Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D097CFED89
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 17:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24BF10E635;
	Wed,  7 Jan 2026 16:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MyjTRq2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3977110E635
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 16:23:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8532660018;
 Wed,  7 Jan 2026 16:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53594C4AF09;
 Wed,  7 Jan 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767803011;
 bh=k7AXjdlvSSY2GXbhosvmb93DQkkMFyru+9t+qiFbWVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MyjTRq2sBL1oUubK+Eyi5zfLNNdQ6YouKwzG0StBJpxHnoWzrwks9XaCP52P28Sep
 arLjT4uhUy2Eq7HhG1VED8zIdwrLRJSTl9ANMNkr3+/LJVP47UKsBlLptxXNL+PF4B
 FpmE4lrEgzyiySaDu3CAjYq18NCLgp31epfwt1fB3y4u/JbaZnIqO3oMflmRIzhzgD
 zib4wjuDZjU+qZ0zRU6cAXspS6EAA/0BzIqcCAwrmolQwWji1lUiQc4/FHvvnI1Awf
 J75lbARQteJ7YEr6wOFX5VvdRhmlsUMVmx24J3RkubV/Oceca4VNF5KUS3hacONeWZ
 MeAT0PV4ATYTQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Stefan Christ <contact@stefanchrist.eu>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10.y] drm/gma500: Remove unused helper
 psb_fbdev_fb_setcolreg()
Date: Wed,  7 Jan 2026 11:23:28 -0500
Message-ID: <20260107162328.4079503-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026010536-thwarting-rare-1984@gregkh>
References: <2026010536-thwarting-rare-1984@gregkh>
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit be729f9de6c64240645dc80a24162ac4d3fe00a8 ]

Remove psb_fbdev_fb_setcolreg(), which hasn't been called in almost
a decade.

Gma500 commit 4d8d096e9ae8 ("gma500: introduce the framebuffer support
code") added the helper psb_fbdev_fb_setcolreg() for setting the fbdev
palette via fbdev's fb_setcolreg callback. Later
commit 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for
fb_ops") set several default helpers for fbdev emulation, including
fb_setcmap.

The fbdev subsystem always prefers fb_setcmap over fb_setcolreg. [1]
Hence, the gma500 code is no longer in use and gma500 has been using
drm_fb_helper_setcmap() for several years without issues.

Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Stefan Christ <contact@stefanchrist.eu>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.10+
Link: https://elixir.bootlin.com/linux/v6.16.9/source/drivers/video/fbdev/core/fbcmap.c#L246 # [1]
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Link: https://lore.kernel.org/r/20250929082338.18845-1-tzimmermann@suse.de
[ adapted file path from fbdev.c to framebuffer.c and removed fb_setcolreg from three fb_ops structures ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/gma500/framebuffer.c | 44 ----------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 6ef4ea07d1bb..c8db96b41dfa 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -34,47 +34,6 @@ static const struct drm_framebuffer_funcs psb_fb_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 };
 
-#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
-
-static int psbfb_setcolreg(unsigned regno, unsigned red, unsigned green,
-			   unsigned blue, unsigned transp,
-			   struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	uint32_t v;
-
-	if (!fb)
-		return -ENOMEM;
-
-	if (regno > 255)
-		return 1;
-
-	red = CMAP_TOHW(red, info->var.red.length);
-	blue = CMAP_TOHW(blue, info->var.blue.length);
-	green = CMAP_TOHW(green, info->var.green.length);
-	transp = CMAP_TOHW(transp, info->var.transp.length);
-
-	v = (red << info->var.red.offset) |
-	    (green << info->var.green.offset) |
-	    (blue << info->var.blue.offset) |
-	    (transp << info->var.transp.offset);
-
-	if (regno < 16) {
-		switch (fb->format->cpp[0] * 8) {
-		case 16:
-			((uint32_t *) info->pseudo_palette)[regno] = v;
-			break;
-		case 24:
-		case 32:
-			((uint32_t *) info->pseudo_palette)[regno] = v;
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static int psbfb_pan(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -167,7 +126,6 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static const struct fb_ops psbfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = psbfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
@@ -178,7 +136,6 @@ static const struct fb_ops psbfb_ops = {
 static const struct fb_ops psbfb_roll_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
@@ -189,7 +146,6 @@ static const struct fb_ops psbfb_roll_ops = {
 static const struct fb_ops psbfb_unaccel_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_setcolreg = psbfb_setcolreg,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-- 
2.51.0

