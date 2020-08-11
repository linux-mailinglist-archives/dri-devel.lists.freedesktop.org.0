Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C72414E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 04:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEBC6E02D;
	Tue, 11 Aug 2020 02:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83286E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 02:21:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z18so9967049wrm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TmoKV7MOYO+sW9asyPyzbgaPBKsZSfBCrxLdIsoS/+A=;
 b=a9BWtCF/5XlCgkS7nxPI9SLxQNgUdO5oP0Cuq3NdlDdYCl0HSEwE7KhAFYiGg6pQ0l
 AnMZSXrHPzXlCUjMrFfzN2TjTxhIlxkJjvMqKCNKi/TbGQW/OJp5aiTkdEoZnJ12PLMA
 hKPl2HYa2eTWQQwcdp+kbLkQ6eKUoe+ka+/BaRIzbifuimJ2Mk+1c/qzAXGDjnUA4zrj
 DcW9WCfX8+51dU5ItvQb3qBxBn5IcoWGkzxiWM6lMNxT8Aq2hlPq5YOHYA0WWkOKbmJV
 tCYxl9t1eILedqjLzpsv8XfwWpedvv1dAsOXEMkqB7N8ubqMbh5/T0aI2Rnx3dz1xqfE
 +b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TmoKV7MOYO+sW9asyPyzbgaPBKsZSfBCrxLdIsoS/+A=;
 b=qUaCanYl200obY5AkeYOpTZLGdTAPMZ8+6p9xJqueHBfaUpjjh+KserCW8uWMaJ8GS
 gpr2vu9enIgwFuQUqc6l/NIM1Pgno9PDPUNEQ3Iv2uFi0aLRZ0tPabuMYRpOnrcpCDnq
 opEU3KFe7OQa9W4TQxpsI5vUa1KOV9oOb56Cgfm3kiduZgU5ON9T1IwLljHBzJ8sUtWf
 G+aFk4nacyPLOCjs5IF3kpDML4cDhucTCalenGOfgggU6MngNaRlm1VKCgtNL7C19cip
 PiOjfRnno03e18NAToeJdkgg9I/BA2odKmimdDL6XyJHlWQ32XPJDhOCBVztK+GLNyrx
 wNug==
X-Gm-Message-State: AOAM532bcaqX00OeULfr4xvKNo9194SQC1X6SzxI9JZN28zXPNnhDzwv
 EJtZ0vPSbCEVpcu4acizkHSSHn8J
X-Google-Smtp-Source: ABdhPJzWzSWVwB1SugXhiPPP1zfMa0+DNIjTHIE5I3icme6d8b+im8+mD3apvmsnbUyFNtcgBBFBvw==
X-Received: by 2002:adf:c983:: with SMTP id f3mr3871841wrh.348.1597112512158; 
 Mon, 10 Aug 2020 19:21:52 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v12sm23705162wri.47.2020.08.10.19.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 19:21:51 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 1/2] drm/vmwgfx/sou: Use drm_mode_config_reset
Date: Tue, 11 Aug 2020 04:20:57 +0200
Message-Id: <20200811022058.14346-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 linux-graphics-maintainer@vmware.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

Same problem as in stdu, same fix.

Fixes: 51f644b40b4b ("drm/atomic-helper: reset vblank on crtc reset")
Acked-by: Charmaine Lee <charmainel@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 32a22e4eddb1..4bf0f5ec4fc2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -859,8 +859,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 	sou->base.is_implicit = false;
 
 	/* Initialize primary plane */
-	vmw_du_plane_reset(primary);
-
 	ret = drm_universal_plane_init(dev, &sou->base.primary,
 				       0, &vmw_sou_plane_funcs,
 				       vmw_primary_plane_formats,
@@ -875,8 +873,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_plane_enable_fb_damage_clips(primary);
 
 	/* Initialize cursor plane */
-	vmw_du_plane_reset(cursor);
-
 	ret = drm_universal_plane_init(dev, &sou->base.cursor,
 			0, &vmw_sou_cursor_funcs,
 			vmw_cursor_plane_formats,
@@ -890,7 +886,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 
 	drm_plane_helper_add(cursor, &vmw_sou_cursor_plane_helper_funcs);
 
-	vmw_du_connector_reset(connector);
 	ret = drm_connector_init(dev, connector, &vmw_sou_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
@@ -918,8 +913,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 		goto err_free_encoder;
 	}
 
-
-	vmw_du_crtc_reset(crtc);
 	ret = drm_crtc_init_with_planes(dev, crtc, &sou->base.primary,
 					&sou->base.cursor,
 					&vmw_screen_object_crtc_funcs, NULL);
@@ -973,6 +966,8 @@ int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
 
 	dev_priv->active_display_unit = vmw_du_screen_object;
 
+	drm_mode_config_reset(dev);
+
 	DRM_INFO("Screen Objects Display Unit initialized\n");
 
 	return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
