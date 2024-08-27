Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE8796005C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 06:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6981210E220;
	Tue, 27 Aug 2024 04:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QoUugN1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5917310E220
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 04:39:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-454b3d89a18so27942431cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 21:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724733555; x=1725338355;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1bocdzyvmHkkepK3+LJbzi9IWUaQMoy+e/hXMzNP8MY=;
 b=QoUugN1+sqYpHaWBuZIJw+1fWJ+Crh7QmtjKYmIBL4i55vyaiklLdJ6fbUyfc3Acm1
 wKFW1rSgmV8gYjKX2bgKZ9T+vwgupO+hBYfRQcWJbSNsWgF8496S4FCCSZU1upag7z//
 xOlXHsUmsUtpAaHUwfaWWwls6K3TgDEg8l2Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724733555; x=1725338355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bocdzyvmHkkepK3+LJbzi9IWUaQMoy+e/hXMzNP8MY=;
 b=jrpS8oBX6fiWASH7N6BXHAT7C/rjBpgkkq6Gf3Uwn6D3Xsyukpr07+bi2NbpoWjqB+
 McylSH0T1fMwRHLGwbPd3CZCdy5IqpaPZDN1BEJngIfypykmianbjsYnjjViXGkd98LG
 ATQ5WzIeAcd91oS3baKHmEgwGwJyy4lh9m73lvR3f71HAL1FWUswE8y3YUh7v4OALhtP
 KpVg2zdzv3NF82MBmAR6VnTLp5Ik2e1IoPAm03qJ7Q59+pCFhUWP5cHzFPADH4bCdIa6
 +wuUC9Xb3WUuwSNGcDB5VvkbIwz1r5QPK17hl5nuIBF0v7vrqH/EvMCowpFg6zP+7gam
 ndPA==
X-Gm-Message-State: AOJu0YzogTwY6n0KggqZmMY1N0NhAvRzLO1/yDx0tbM7vVaxK+6SvMYQ
 jX6zQNwDl6e8+WGqtoF2LWjsQFNp9nMpd/HumCNKqmPT9oH5SgRFT8OHImsM5HPrf2V/f0Tpm46
 FyRuY5ofmt2Sp0YXXEqKheKPmyiiCpb0IYTlW/TzwmK/MV3upc13a6/gVKQYGkNKEuE9uOjRB0Z
 e/bu4UDBZ6JZ1Tfzm6wS9kbgkfo9OWCJuIOMUmgZKki13rcnYhMg==
X-Google-Smtp-Source: AGHT+IGd4XZ9D7c9hn/Cx4gBCjZy0Tf59omb8CgUBnisLTa8ZI7ofU9G/JgaupnYRIs4Br6+p1oj+A==
X-Received: by 2002:ac8:7f94:0:b0:456:45d8:2f08 with SMTP id
 d75a77b69052e-45645d83036mr109629691cf.46.1724733554679; 
 Mon, 26 Aug 2024 21:39:14 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe0dba78sm49731841cf.35.2024.08.26.21.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 21:39:14 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH v2] drm/vmwgfx: Cleanup kms setup without 3d
Date: Tue, 27 Aug 2024 00:39:05 -0400
Message-ID: <20240827043905.472825-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
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

Do not validate format equality for the non 3d cases to allow xrgb to
argb copies and make sure the dx binding flags are only used
on dx compatible surfaces.

Fixes basic 2d kms setup on configurations without 3d. There's little
practical benefit to it because kms framebuffer coherence is disabled
on configurations without 3d but with those changes the code actually
makes sense.

v2: Remove the now unused format variable

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.9+
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 29 -------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  9 +++++---
 2 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb..282b6153bcdd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1283,7 +1283,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 {
 	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_framebuffer_surface *vfbs;
-	enum SVGA3dSurfaceFormat format;
 	struct vmw_surface *surface;
 	int ret;
 
@@ -1320,34 +1319,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		return -EINVAL;
 	}
 
-	switch (mode_cmd->pixel_format) {
-	case DRM_FORMAT_ARGB8888:
-		format = SVGA3D_A8R8G8B8;
-		break;
-	case DRM_FORMAT_XRGB8888:
-		format = SVGA3D_X8R8G8B8;
-		break;
-	case DRM_FORMAT_RGB565:
-		format = SVGA3D_R5G6B5;
-		break;
-	case DRM_FORMAT_XRGB1555:
-		format = SVGA3D_A1R5G5B5;
-		break;
-	default:
-		DRM_ERROR("Invalid pixel format: %p4cc\n",
-			  &mode_cmd->pixel_format);
-		return -EINVAL;
-	}
-
-	/*
-	 * For DX, surface format validation is done when surface->scanout
-	 * is set.
-	 */
-	if (!has_sm4_context(dev_priv) && format != surface->metadata.format) {
-		DRM_ERROR("Invalid surface format for requested mode.\n");
-		return -EINVAL;
-	}
-
 	vfbs = kzalloc(sizeof(*vfbs), GFP_KERNEL);
 	if (!vfbs) {
 		ret = -ENOMEM;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 1625b30d9970..5721c74da3e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -2276,9 +2276,12 @@ int vmw_dumb_create(struct drm_file *file_priv,
 	const struct SVGA3dSurfaceDesc *desc = vmw_surface_get_desc(format);
 	SVGA3dSurfaceAllFlags flags = SVGA3D_SURFACE_HINT_TEXTURE |
 				      SVGA3D_SURFACE_HINT_RENDERTARGET |
-				      SVGA3D_SURFACE_SCREENTARGET |
-				      SVGA3D_SURFACE_BIND_SHADER_RESOURCE |
-				      SVGA3D_SURFACE_BIND_RENDER_TARGET;
+				      SVGA3D_SURFACE_SCREENTARGET;
+
+	if (vmw_surface_is_dx_screen_target_format(format)) {
+		flags |= SVGA3D_SURFACE_BIND_SHADER_RESOURCE |
+			 SVGA3D_SURFACE_BIND_RENDER_TARGET;
+	}
 
 	/*
 	 * Without mob support we're just going to use raw memory buffer
-- 
2.43.0

