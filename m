Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D61404993
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B31A6E4D7;
	Thu,  9 Sep 2021 11:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08326E4D7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:41:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CBE2611AF;
 Thu,  9 Sep 2021 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187690;
 bh=lZPFsafQ4x9ZhcGx2SHXD6JQ8EyomNZhe2cZ6YQnL5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AN0DcgNTGF9usL6YT3HZ5+zoQTVHAXwQ1ltJKsOgEJXyWGJI+cr1uaM1UhC6f0OFk
 x/tKntb3IIk0VDeHtw2GI4d5I6BJJZYupZKYyI4AN53LYl6Cpvo2Ia0x6MnOx/REQ2
 eRqeOD374GNFpndrp7EJ5GL4rH5lCP+I7bY7JEn34XDGLtQ1eK9E7CVNC2wRpIWjtd
 DkIdwdX7SkDUfw0iZKlpk5ei24Nulv9tUOMOCaJN/kUI1JnyUfYbu1eTjEUDRwoDJo
 0gZSKOCQ3wMynJwApSiH3UXpHVgjMX788L96JktzMUiFB9yAGfX4B/w5sg0KRUtgUG
 0v2ZaBkSxa66w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Melissa Wen <melissa.srw@gmail.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 018/252] drm/vkms: Let shadow-plane helpers
 prepare the plane's FB
Date: Thu,  9 Sep 2021 07:37:12 -0400
Message-Id: <20210909114106.141462-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit b43e2ec03b0de040d536591713ea9c875ff34ba9 ]

Replace vkms' prepare_fb and cleanup_fb functions with the generic
code for shadow-buffered planes. No functional changes.

This change also fixes a problem where IGT kms_flip tests would
create a segmentation fault within vkms. The driver's prepare_fb
function did not report an error if a BO's vmap operation failed.
The kernel later tried to operate on the non-mapped memory areas.
The shared shadow-plane helpers handle errors correctly, so that
the driver now avoids the segmantation fault.

v2:
	* include paragraph about IGT tests in commit message (Melissa)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210705074633.9425-4-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 38 +------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 107521ace597..092514a2155f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -8,7 +8,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
-#include <drm/drm_gem_shmem_helper.h>
 
 #include "vkms_drv.h"
 
@@ -150,45 +149,10 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static int vkms_prepare_fb(struct drm_plane *plane,
-			   struct drm_plane_state *state)
-{
-	struct drm_gem_object *gem_obj;
-	struct dma_buf_map map;
-	int ret;
-
-	if (!state->fb)
-		return 0;
-
-	gem_obj = drm_gem_fb_get_obj(state->fb, 0);
-	ret = drm_gem_shmem_vmap(gem_obj, &map);
-	if (ret)
-		DRM_ERROR("vmap failed: %d\n", ret);
-
-	return drm_gem_plane_helper_prepare_fb(plane, state);
-}
-
-static void vkms_cleanup_fb(struct drm_plane *plane,
-			    struct drm_plane_state *old_state)
-{
-	struct drm_gem_object *gem_obj;
-	struct drm_gem_shmem_object *shmem_obj;
-	struct dma_buf_map map;
-
-	if (!old_state->fb)
-		return;
-
-	gem_obj = drm_gem_fb_get_obj(old_state->fb, 0);
-	shmem_obj = to_drm_gem_shmem_obj(drm_gem_fb_get_obj(old_state->fb, 0));
-	dma_buf_map_set_vaddr(&map, shmem_obj->vaddr);
-	drm_gem_shmem_vunmap(gem_obj, &map);
-}
-
 static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
 	.atomic_update		= vkms_plane_atomic_update,
 	.atomic_check		= vkms_plane_atomic_check,
-	.prepare_fb		= vkms_prepare_fb,
-	.cleanup_fb		= vkms_cleanup_fb,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-- 
2.30.2

