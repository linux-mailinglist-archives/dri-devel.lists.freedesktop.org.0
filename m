Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38F8A5610
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 17:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCCE10EC86;
	Mon, 15 Apr 2024 15:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PYpXj3Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5F010EC86
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZQFgmF3aiX/nRwHyZEsbpJolz4uksvfe/L1gzzY1AlY=; b=PYpXj3Y0y/i4Kt1Kx6hm6rW+Dp
 wrzJOlHTn0/zKMzhb5IWTUHbpD2b0MKNeYJoAThzWsZdC3V2JevISm64oGocWz0V1HQkOSX4H2j39
 YczQZOaAN6dqILyEq09L4lP0j1ZvNdR1E/sZrRQGkhdD0qSJR8corMMI3mGt66oLo5I0mLbs/ZFuJ
 x3B6BTHG9mItlLWIwmkRIdAsV+jPtpIGAgsUPjK2eHBEG99fK7OSeHMXQzaHEErBAILDCut/z2JHT
 RjzmWy0wLZA5UAEv0LhWdrYrGuXma5rUkEU2aob6p9VuHCY83C2ISHUjqE6UYQa2diwPV0aVpOkbu
 7pDGlHcQ==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwNyT-004oFJ-Ss; Mon, 15 Apr 2024 17:10:26 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: jfalempe@redhat.com, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] drm/fb_dma:
 s/drm_panic_gem_get_scanout_buffer/drm_fb_dma_get_scanout_buffer
Date: Mon, 15 Apr 2024 12:09:53 -0300
Message-ID: <20240415151013.3210278-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On version 11, Thomas suggested to change the name of the function and
this request was applied on version 12, which is the version that
landed. Although the name of the function changed on the C file, it
didn't changed on the header file, leading to a compilation error as
such:

drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c:780:24: error: use of undeclared
identifier 'drm_fb_dma_get_scanout_buffer'; did you mean 'drm_panic_gem_get_scanout_buffer'?
  780 |         .get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                               drm_panic_gem_get_scanout_buffer
./include/drm/drm_fb_dma_helper.h:23:5: note: 'drm_panic_gem_get_scanout_buffer'
declared here
   23 | int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
      |     ^
1 error generated.

Best Regards,
- Maíra

Fixes: 879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic"
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/drm/drm_fb_dma_helper.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index 61f24c2aba2f..c950732c6d36 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -6,6 +6,7 @@
 
 struct drm_device;
 struct drm_framebuffer;
+struct drm_plane;
 struct drm_plane_state;
 struct drm_scanout_buffer;
 
@@ -20,8 +21,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
 
-int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
-				     struct drm_scanout_buffer *sb);
+int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
+				  struct drm_scanout_buffer *sb);
 
 #endif
 
-- 
2.44.0

