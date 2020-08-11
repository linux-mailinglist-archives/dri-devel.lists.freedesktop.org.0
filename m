Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DEC2414EA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 04:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260A76E060;
	Tue, 11 Aug 2020 02:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABD86E060
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 02:22:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so9967505wrm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LWDVenYXS6Kcmn815N0Ntirdz58cKbiLjtlEEq0mZdY=;
 b=mH79X0+cHNGCCgV3TnVO8fqWD2T7Gr8UWgMsZ01o1gDYh8AJUHdCX7iZk23ffxaedL
 TMmW/lwACueozlWXjsfAyEMDWGaOoX8bF3gdWty6K3jPrGU5Rl9TPs1oJrZhx5rbVUbH
 MyYPrL9kmacAQiw35hBJZs19uSrwJur0ZIZdw1ARraL1yc85t1X/p9YKFT61y1jL422k
 rfHcZT/eErzhHawPdlkKooOH/lqITq+WoRPAx5XAgfK8KYrtRwnzUxFbLaZhqP251PIo
 GXDfiFXMHcVDx6xp6rVfWInI0fEtvk4EcEkVOCIXB0hc/UXL+mlmvv6lAQ2T2D3d4P5c
 LDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LWDVenYXS6Kcmn815N0Ntirdz58cKbiLjtlEEq0mZdY=;
 b=Rv8kKtbVK5wPIyHsuM3jHcI5GFp0zFoEulj/BUrUZbrDI3/BL/WHleo18nAyPwAxar
 nvGB00zN+AkErOQcY60OymHlqR7TyOxWRancH5lxSvoQeMk1i6PHnYRJ7Ds5tfdEdCjc
 iyQ6kZipOdJxROvTu+BafUuClpUh2L5tb9zuODOQs8h07KY7ktmAAYa3gq31vOh+3Ci1
 Q2f1GGimp5Vp+3J3ham66kBJDbvU0OoZ2l5289XE8lOjekvRuVw4K1cCP7EX4Vql7SRO
 9Rr76hHMWgCLFd7n+TNjNit+10oU9mjOXHTGyQng+SBxiuVmIPvqnUllNOgCzQTb9NMo
 sMzA==
X-Gm-Message-State: AOAM532towN2z555wORD8TD8gh19uHAFqDOLOxZoHVcyJDZltOHPp0aF
 o7wXWMYxbYu9QnsRdktduCR0jXCo
X-Google-Smtp-Source: ABdhPJy9da2dyJ7PXsavKDKPFBdCYRcqzey0uVSZ7Z2jWAMjSsGPWvmLS9TPQuWUo+pxwNtmeHN1Ag==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr26742328wru.222.1597112529348; 
 Mon, 10 Aug 2020 19:22:09 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id v12sm23705162wri.47.2020.08.10.19.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 19:22:08 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 2/2] drm/vmwgfx/ldu: Use drm_mode_config_reset
Date: Tue, 11 Aug 2020 04:20:58 +0200
Message-Id: <20200811022058.14346-2-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811022058.14346-1-rscheidegger.oss@gmail.com>
References: <20200811022058.14346-1-rscheidegger.oss@gmail.com>
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
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 009f1742bed5..c4017c7a24db 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -387,8 +387,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 	ldu->base.is_implicit = true;
 
 	/* Initialize primary plane */
-	vmw_du_plane_reset(primary);
-
 	ret = drm_universal_plane_init(dev, &ldu->base.primary,
 				       0, &vmw_ldu_plane_funcs,
 				       vmw_primary_plane_formats,
@@ -402,8 +400,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_plane_helper_add(primary, &vmw_ldu_primary_plane_helper_funcs);
 
 	/* Initialize cursor plane */
-	vmw_du_plane_reset(cursor);
-
 	ret = drm_universal_plane_init(dev, &ldu->base.cursor,
 			0, &vmw_ldu_cursor_funcs,
 			vmw_cursor_plane_formats,
@@ -417,7 +413,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 
 	drm_plane_helper_add(cursor, &vmw_ldu_cursor_plane_helper_funcs);
 
-	vmw_du_connector_reset(connector);
 	ret = drm_connector_init(dev, connector, &vmw_legacy_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
@@ -445,7 +440,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 		goto err_free_encoder;
 	}
 
-	vmw_du_crtc_reset(crtc);
 	ret = drm_crtc_init_with_planes(dev, crtc, &ldu->base.primary,
 					&ldu->base.cursor,
 					&vmw_legacy_crtc_funcs, NULL);
@@ -520,6 +514,8 @@ int vmw_kms_ldu_init_display(struct vmw_private *dev_priv)
 
 	dev_priv->active_display_unit = vmw_du_legacy;
 
+	drm_mode_config_reset(dev);
+
 	DRM_INFO("Legacy Display Unit initialized\n");
 
 	return 0;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
