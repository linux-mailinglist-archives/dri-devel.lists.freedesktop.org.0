Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230E9D78F0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 23:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7656310E04D;
	Sun, 24 Nov 2024 22:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="KVFQ9XGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A9C10E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 22:48:25 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 31FCC889E9;
 Sun, 24 Nov 2024 23:48:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732488503;
 bh=8BmP5farunaXks7Deyq0Pqjsft7Toz6QqZdEGzvbVS4=;
 h=From:To:Cc:Subject:Date:From;
 b=KVFQ9XGeaQ2WN6f4EAzbRogMNmhws8S3vfJ4iU7yFBBRAhfpnPrI3uA2LUaBImdDA
 i16sYk5hObGbCVFpZJzUoX4B5bHNB+jk5TMgEH6CSdOBNdM0VqOMKG5zR/+odZur95
 js1rGcjr9dPY1zKqTd5O4yVGSs4dmuvZEYa/Btuvb0X/Wrplxb2tBBc61kgUwwsbbD
 +WA0qP3PgeNV/Qulh7Ya+9ydO5Shd4cFxq2rEQAbxiae9E7V8X7v0FGOC5hTTKqfLI
 +t/o3/iTQ/heSafJg1Tknd5f4Ptu/nhTcFQomJkcqTZZY1HxOjwL6p3w68GlytGUew
 49A1nyspjKWLg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH] drm/panel: st7701: Add prepare_prev_first flag to drm_panel
Date: Sun, 24 Nov 2024 23:48:07 +0100
Message-ID: <20241124224812.150263-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

The DSI host must be enabled for the panel to be initialized in
prepare(). Set the prepare_prev_first flag to guarantee this.
This fixes the panel operation on NXP i.MX8MP SoC / Samsung DSIM
DSI host.

Fixes: 849b2e3ff969 ("drm/panel: Add Sitronix ST7701 panel driver")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Chris Morgan <macromorgan@hotmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org # v6.2+
---
Note that the prepare_prev_first flag was added in Linux 6.2.y commit
5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel"),
hence the CC stable v6.2+, even if the Fixes tag points to a commit
in Linux 5.1.y .
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index eef03d04e0cd2..1f72ef7ca74c9 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -1177,6 +1177,7 @@ static int st7701_probe(struct device *dev, int connector_type)
 		return dev_err_probe(dev, ret, "Failed to get orientation\n");
 
 	drm_panel_init(&st7701->panel, dev, &st7701_funcs, connector_type);
+	st7701->panel.prepare_prev_first = true;
 
 	/**
 	 * Once sleep out has been issued, ST7701 IC required to wait 120ms
-- 
2.45.2

