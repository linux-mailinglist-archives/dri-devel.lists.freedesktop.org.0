Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB88B1C59E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4662310E13F;
	Wed,  6 Aug 2025 12:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lnZidwA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69610E13F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 12:12:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DA000A56A0D;
 Wed,  6 Aug 2025 12:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC680C4CEE7;
 Wed,  6 Aug 2025 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754482362;
 bh=mjSRFkYQWRi/DhpW/R0nsid3OLNzB9r+riIbu/8ICIc=;
 h=From:To:Cc:Subject:Date:From;
 b=lnZidwA+tuaQm2hZQ1afBj8ep4vYIoXGp3JNW2BhJLZMBgFujz4SJ0YA7EO5UOnnw
 4XmQSpeNjEtnLhpRrN14e9GlpytEy6TaDifuf6uM9fA10VkGeFm1+zFIOVWzJoNoCW
 sOFmM3OaqHffc0yNkGOBrJSNDUjQv6bY7eOy8tcx/kQgIp8YsD92TVgC1eLjQ/VeLq
 cpPsCBIxfZ+/6BgbqJhDaucSi4jxLImiAuwRaPfJ1nA1Xkam5DHN/2+JBhErle7zwF
 2pK1d7jxO7cCbIj9RYhZtktkhg5NHFvQ/rmivf8CPXHv/7ewglXSqVmFUABqyLU2dW
 wui0CZfb+lB5g==
From: Sasha Levin <sashal@kernel.org>
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch,
 laurent.pinchart+renesas@ideasonboard.com, ville.syrjala@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH] drm/omapdrm: Pass format info to
 drm_helper_mode_fill_fb_struct()
Date: Wed,  6 Aug 2025 08:12:35 -0400
Message-Id: <20250806121235.622437-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Commit 41ab92d35ccd ("drm: Make passing of format info to
drm_helper_mode_fill_fb_struct() mandatory") removed the fallback
format lookup in drm_helper_mode_fill_fb_struct(), making the
format info parameter mandatory.

The coccinelle script in commit a34cc7bf1034 ("drm: Allow the caller
to pass in the format info to drm_helper_mode_fill_fb_struct()")
correctly added NULL as the format parameter to omapdrm's call to
drm_helper_mode_fill_fb_struct(). However, omapdrm was subsequently
overlooked in the follow-up series that updated drivers to pass the
actual format info instead of NULL (commits b4d360701b76 through
3f019d749671 updated other drivers like amdgpu, exynos, i915, msm,
tegra, virtio, vmwgfx, etc., but omapdrm was not included).

This causes fb->format to be NULL, triggering a warning in
drm_framebuffer_init() at line 870 and causing framebuffer
initialization to fail with -EINVAL, followed by an oops when
drm_framebuffer_remove() tries to clean up the failed initialization.

Note: Unlike other drivers that were fixed to pass format info from
their fb_create() callbacks all the way down to avoid redundant lookups,
we don't do that here because omap_framebuffer_init() is also called
from the fbdev code path (omap_fbdev.c) which doesn't have the format
info readily available. Changing the function signature to accept format
info would require adding a format lookup in the fbdev caller, so the
total number of lookups would remain the same - we'd just be moving the
lookup from omap_framebuffer_init() to its fbdev caller.

Fixes: 41ab92d35ccd ("drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/omapdrm/omap_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 30c81e2e5d6b..42da78bcb5a6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -440,7 +440,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 		plane->dma_addr  = 0;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, format, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
 	if (ret) {
-- 
2.39.5

