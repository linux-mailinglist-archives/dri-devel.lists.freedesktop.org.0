Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2289ACC54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410610E1F3;
	Wed, 23 Oct 2024 14:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d1LRo0za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D02910E1F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 246585C5F0A;
 Wed, 23 Oct 2024 14:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E5FC4CEE4;
 Wed, 23 Oct 2024 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729693844;
 bh=Tmr6J5mJFH6Iy72xJOrNjejVaHARmkj7o5RpsJk38m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d1LRo0zacq+GRRzV9UxekgPXqtoIK5e9ti+7vCXQfNyVTGtx4UN0lGyBSYhQoSXrQ
 eCoGLaceXEmFhlj/rf/RzXo50adB2a9hMaEi3D8agddAHIL52kpj48ZOdiA+Ga/WiT
 e4W4bXjqO8ogczb9hWtxEAozvd2IZqGOy3Ekv3GQ9FIctIXm0pUfknoGQdwHTHch3N
 lAa3gcmPB/3/DACIk6/ORVX77qws1bBgD0zTM7UKm6GVIGy4/q1WpeqOxASnBP82DC
 3AkYdnF+eYD8QRhDsdreODn3sCyJ7wRkigHxikEvfYDIp/fpyOPNSvIkKdl669+PK9
 gf7r8oHo1P0uw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ian Forbes <ian.forbes@broadcom.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 19/30] drm/vmwgfx: Limit display layout ioctl
 array size to VMWGFX_NUM_DISPLAY_UNITS
Date: Wed, 23 Oct 2024 10:29:44 -0400
Message-ID: <20241023143012.2980728-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023143012.2980728-1-sashal@kernel.org>
References: <20241023143012.2980728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
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

From: Ian Forbes <ian.forbes@broadcom.com>

[ Upstream commit 28a5dfd4f615539fb22fb6d5c219c199c14e6eb6 ]

Currently the array size is only limited by the largest kmalloc size which
is incorrect. This change will also return a more specific error message
than ENOMEM to userspace.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240808200634.1074083-1-ian.forbes@broadcom.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 3 ---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3f4719b3c2681..4e2807f5f94cf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -62,7 +62,7 @@
 #define VMWGFX_DRIVER_MINOR 20
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
-#define VMWGFX_MAX_DISPLAYS 16
+#define VMWGFX_NUM_DISPLAY_UNITS 8
 #define VMWGFX_CMD_BOUNCE_INIT_SIZE 32768
 
 #define VMWGFX_MIN_INITIAL_WIDTH 1280
@@ -82,7 +82,7 @@
 #define VMWGFX_NUM_GB_CONTEXT 256
 #define VMWGFX_NUM_GB_SHADER 20000
 #define VMWGFX_NUM_GB_SURFACE 32768
-#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_MAX_DISPLAYS
+#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_NUM_DISPLAY_UNITS
 #define VMWGFX_NUM_DXCONTEXT 256
 #define VMWGFX_NUM_DXQUERY 512
 #define VMWGFX_NUM_MOB (VMWGFX_NUM_GB_CONTEXT +\
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 288ed0bb75cb9..884804274dfb1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2225,7 +2225,7 @@ int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_vmw_update_layout_arg *arg =
 		(struct drm_vmw_update_layout_arg *)data;
-	void __user *user_rects;
+	const void __user *user_rects;
 	struct drm_vmw_rect *rects;
 	struct drm_rect *drm_rects;
 	unsigned rects_size;
@@ -2237,6 +2237,8 @@ int vmw_kms_update_layout_ioctl(struct drm_device *dev, void *data,
 					    VMWGFX_MIN_INITIAL_HEIGHT};
 		vmw_du_update_layout(dev_priv, 1, &def_rect);
 		return 0;
+	} else if (arg->num_outputs > VMWGFX_NUM_DISPLAY_UNITS) {
+		return -E2BIG;
 	}
 
 	rects_size = arg->num_outputs * sizeof(struct drm_vmw_rect);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 6141fadf81efe..2a6c6d6581e02 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -199,9 +199,6 @@ struct vmw_kms_dirty {
 	s32 unit_y2;
 };
 
-#define VMWGFX_NUM_DISPLAY_UNITS 8
-
-
 #define vmw_framebuffer_to_vfb(x) \
 	container_of(x, struct vmw_framebuffer, base)
 #define vmw_framebuffer_to_vfbs(x) \
-- 
2.43.0

