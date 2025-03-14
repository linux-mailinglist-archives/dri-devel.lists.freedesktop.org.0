Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B9A620CA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 23:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3773010E0A5;
	Fri, 14 Mar 2025 22:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H7s7nSuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Fri, 14 Mar 2025 22:48:54 UTC
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32D10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 22:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=QqlpOM47T0J7hj
 rktmlQ8XwpoSBAcP6JW1h4M9FywSc=; b=H7s7nSuDp/1eUK1avAkm0y8etmb/oX
 39q+707zmi6Q4xLKfyvtSyGQPA/UBjCsvmB+S8lpp/VmAJ4QIrFLb4puXUsxbe3O
 6AZW3x710KbO50blfG3WqXNMK/DjeHWnVbuyc2i9D+DWmB5kP6al7RwiKhTQTKnG
 nohy/zJ3UvhSF9KcXcsYrle6c6yuDAwiOV6DX3qYUch5rscIeQGuAIduz49+rAD+
 eGmi+7biEFH3e7w9B/rzVJ14/mL0WugllECGfulbPxScjbrtYs2rt2nR7Cq0LIfs
 rkLPmjZzIAXVkNdI7+o0I7F2v/xbCAX0Wm/InOe9CQR8+UeHK1CIPhxw==
Received: (qmail 2190072 invoked from network); 14 Mar 2025 23:42:11 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 14 Mar 2025 23:42:11 +0100
X-UD-Smtp-Session: l3s3148p1@HgAiJlUw/o0ujnuL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Phong Hoang <phong.hoang.wz@renesas.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection failure
Date: Fri, 14 Mar 2025 23:39:05 +0100
Message-ID: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phong Hoang <phong.hoang.wz@renesas.com>

Add a check to the very first register access function when attaching a
bridge device, so we can bail out if I2C communication does not work.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only!

Changes since v1:

* rebased to v6.14-rc6
* add Laurent's tag (Thanks!)
* update patch description according to Tomi's suggestions (Thanks!)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1..59508e82a991 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 
 static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
 {
+	int ret;
 	int val;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
@@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
+	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
 	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return ret;
+
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-- 
2.47.2

