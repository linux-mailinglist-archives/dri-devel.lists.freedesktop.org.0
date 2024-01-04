Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60325824207
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 13:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033FA10E473;
	Thu,  4 Jan 2024 12:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jan 2024 12:51:51 UTC
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch
 [IPv6:2001:1600:3:17::bc0d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9974A10E462
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 12:51:51 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4T5R7G64hBzMpnWg;
 Thu,  4 Jan 2024 12:42:18 +0000 (UTC)
Received: from unknown by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4T5R7F6yDnzMpnPs; Thu,  4 Jan 2024 13:42:17 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/panel: ltk050h3146w: only print message when GPIO
 getting is not EPROBE_DEFER
Date: Thu,  4 Jan 2024 13:41:57 +0100
Message-ID: <20240104-ltk-dev_err_probe-v1-1-8ef3c0b585d8@theobroma-systems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104-ltk-dev_err_probe-v1-0-8ef3c0b585d8@theobroma-systems.com>
References: <20240104-ltk-dev_err_probe-v1-0-8ef3c0b585d8@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Quentin Schulz <foss+kernel@0leil.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

devm_gpiod_get_optional may return EPROBE_DEFER in case the GPIO
controller isn't yet probed when the panel driver is being probed.

In that case, a spurious and confusing error message about not being
able to get the reset GPIO is printed even though later on the device
actually manages to get probed.

Use dev_err_probe instead so that the message is only printed when it
truly matters.

Cc: Quentin Schulz <foss+kernel@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 30919c872ac8d..ecfa4181c4fd9 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -646,10 +646,8 @@ static int ltk050h3146w_probe(struct mipi_dsi_device *dsi)
 		return -EINVAL;
 
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset_gpio)) {
-		dev_err(dev, "cannot get reset gpio\n");
-		return PTR_ERR(ctx->reset_gpio);
-	}
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio), "cannot get reset gpio\n");
 
 	ctx->vci = devm_regulator_get(dev, "vci");
 	if (IS_ERR(ctx->vci)) {

-- 
2.43.0

