Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208782F2A3A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB86E138;
	Tue, 12 Jan 2021 08:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1456E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id e25so1269467wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mvyUnP+5Er1b+eoWLtHRMmyLGwhFtg7skXxoWFfuqlg=;
 b=JlkKoI6jqQeZHowKk4XRLGXsTszdalRsxT340K9RnAxr0HDgOy4Bg8CGAXk3SxGiX1
 smagwgePAV4Rb44Do+Pe8kBXRf66I6yuY9rj7Craj7JTwSwdLXpBycwGskbmY7jpZEAY
 9w+R46iDXrYC9T/jvupkOdm0tLxStLvXHs/D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mvyUnP+5Er1b+eoWLtHRMmyLGwhFtg7skXxoWFfuqlg=;
 b=PaS1LTpNt6S6qbk3dV8kJJaKZxsvgk3xGxF5tkPtwxY3qHo+6DCT6PkU9txQe/muXj
 G9bMa2pQCZC82ISipWFmyygC70Kqg3reaYBxRTCObzjzS3YASq0pchvDoIZIGwyykAM6
 zlTRGwgvzEAaa+OdRYTyrfozd6YgcnyCsee2cBGtAk0l3Mvdo//O5UUFsePNlyv4Cw9f
 ZRFWHDtLQX6A+Z4P2FPLsWkGmlg1Yn/gXWwJHmxPWpKuy7vOkn7kY8fCSAPncgf2yXe3
 5Gqac5Z5FnTn0a0qhh+qXJAQGIxvFfW72s/HK2w6Wg+/fShm5lLx0qwSif+C5Q+M9myX
 8NhA==
X-Gm-Message-State: AOAM530LMgHKtZjlrULi853EILqY/ILRxb7MqB7y2k5G6mwY9tYWqfAT
 8Bo2Lhy9K8QLZG4+8pJKzHWiiCz/TpeBfdoU
X-Google-Smtp-Source: ABdhPJyexyNFvHV0btHTlQ+e1C+RBmteKZ1DA1cvXqZaRLGlomTn6nId3jufrgptrwactGCw07rTIA==
X-Received: by 2002:a1c:b7d4:: with SMTP id h203mr2480861wmf.59.1610441052333; 
 Tue, 12 Jan 2021 00:44:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/15] drm/arc: Use drmm_mode_config_cleanup
Date: Tue, 12 Jan 2021 09:43:50 +0100
Message-Id: <20210112084358.2771527-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With autocleanup through drm_device management we can delete all the
code. Possible now that there's no confusion against devm_kzalloc'ed
structures anymore.

I inlined arcpgu_setup_mode_config because it's tiny and the newly
needed return value handling would have been more ...

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c |  4 +---
 drivers/gpu/drm/arc/arcpgu_drv.c  | 21 +++++++++------------
 drivers/gpu/drm/arc/arcpgu_hdmi.c |  6 +-----
 drivers/gpu/drm/arc/arcpgu_sim.c  | 11 ++---------
 4 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 31a85c703307..43313adb1981 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -209,10 +209,8 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
 
 	ret = drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, NULL,
 					&arc_pgu_crtc_funcs, NULL);
-	if (ret) {
-		arc_pgu_plane_destroy(primary);
+	if (ret)
 		return ret;
-	}
 
 	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
 	return 0;
diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index 9020352816fa..6349e9dc770e 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -30,16 +30,6 @@ static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static void arcpgu_setup_mode_config(struct drm_device *drm)
-{
-	drm_mode_config_init(drm);
-	drm->mode_config.min_width = 0;
-	drm->mode_config.min_height = 0;
-	drm->mode_config.max_width = 1920;
-	drm->mode_config.max_height = 1080;
-	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
-}
-
 DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
 
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
@@ -54,7 +44,15 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	if (IS_ERR(arcpgu->clk))
 		return PTR_ERR(arcpgu->clk);
 
-	arcpgu_setup_mode_config(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 1920;
+	drm->mode_config.max_height = 1080;
+	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	arcpgu->regs = devm_ioremap_resource(&pdev->dev, res);
@@ -108,7 +106,6 @@ static int arcpgu_unload(struct drm_device *drm)
 {
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-	drm_mode_config_cleanup(drm);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
index dbad2c9237fe..925d6d31bb78 100644
--- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
+++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
@@ -39,9 +39,5 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
 		return ret;
 
 	/* Link drm_bridge to encoder */
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret)
-		drm_encoder_cleanup(encoder);
-
-	return ret;
+	return drm_bridge_attach(encoder, bridge, NULL, 0);
 }
diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
index 3772df1647aa..afc34f8b4de0 100644
--- a/drivers/gpu/drm/arc/arcpgu_sim.c
+++ b/drivers/gpu/drm/arc/arcpgu_sim.c
@@ -73,21 +73,14 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
 			DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret < 0) {
 		dev_err(drm->dev, "failed to initialize drm connector\n");
-		goto error_encoder_cleanup;
+		return ret;
 	}
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		dev_err(drm->dev, "could not attach connector to encoder\n");
-		goto error_connector_cleanup;
+		return ret;
 	}
 
 	return 0;
-
-error_connector_cleanup:
-	drm_connector_cleanup(connector);
-
-error_encoder_cleanup:
-	drm_encoder_cleanup(encoder);
-	return ret;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
