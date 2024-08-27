Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB917960054
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 06:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3910E173;
	Tue, 27 Aug 2024 04:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dsVRY0LW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD810E173
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 04:33:28 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7a3574acafeso328280285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 21:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724733207; x=1725338007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jO3b/HQbgIsaJ6GcQxLwnZeZj3dlyeqCaKQpgY4bypg=;
 b=dsVRY0LWeOpVeW5603/9Fg+D4+Er7jCzifmmEaA9R8Pb5r8dt6LnrsRb51OUaWq3BL
 wcnY8AhPXoAuMmPrlkco5jD6NATL37LW/5RlbYs6vPJC87be45jovfklkopRrE89Qbgo
 bX/GX/nUyhs1fSTOe9LYsnVJsp8haBMh+JbuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724733207; x=1725338007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jO3b/HQbgIsaJ6GcQxLwnZeZj3dlyeqCaKQpgY4bypg=;
 b=NYexY8Q0wCenl53uIX2vDnzeTDas43VmJkPxQB/UL4NhWz7jwQoDQsIb8rE5QTFNwT
 KL1hG/sWTiKlqKhDWSk8o/5RNgAKOuImFSofsv03dlL1I1qEffv0x2vKNLzH/6wTKh3e
 bezYxMoeYGqqSFhcoP8H9XEtvIQyu2mtR9jNXIErUJsKKDlrCdrO7MGNLg7AZZJPMQoc
 wSuQY1shnHLdW6gZ8XKdPVa54HXfaACbpRxAj+oOzQta1yowPy1GttplosPzYUvHRUs2
 W1U4jrgoEhLFvMDVkfAgi1wAmW9brflZIxN0i8oxGa+ELHjbXIYmcXpS/lCFRRZEGw96
 Mffw==
X-Gm-Message-State: AOJu0YyijFA1w1RG3iE7tERrhBbd8A5Wa6BvzVP7JIkZi+j1gorUFfSS
 YjXnsA63aKM0VWgkNlMlW0Ze3YpszX6+Qq57aevG1wUpaeggtvlaKmnsbr6mi5SxZVW7iv4CrtE
 Ny5Gea31j9sB84Z24X7L3mATqSIDBs+t/85h+2cTFcptSwh5WbhAYPO4T7p5WY09F4KoBIH2SlM
 AuUti39KnZyEtITp3vOinQmJP+WRL/SZD9Hex5Y7hrtpa86WPl1w==
X-Google-Smtp-Source: AGHT+IH8jM3t0qpSTWzftDdR4vyON6uBqO9e4LDu0vWeptUBNKXD6dZnd+MukBUEVgPdQFuVaWU7xQ==
X-Received: by 2002:a05:620a:4096:b0:79d:6169:7ab9 with SMTP id
 af79cd13be357-7a7e4e717aemr197587485a.68.1724733206628; 
 Mon, 26 Aug 2024 21:33:26 -0700 (PDT)
Received: from localhost.localdomain ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f341e14sm518060585a.30.2024.08.26.21.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 21:33:26 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Cleanup kms setup without 3d
Date: Tue, 27 Aug 2024 00:33:19 -0400
Message-ID: <20240827043319.466910-1-zack.rusin@broadcom.com>
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

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.9+
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 9 ---------
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 9 ++++++---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb..b5fc5a9e123a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1339,15 +1339,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 		return -EINVAL;
 	}
 
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

