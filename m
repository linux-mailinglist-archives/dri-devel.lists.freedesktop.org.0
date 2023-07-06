Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89274A108
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E62510E440;
	Thu,  6 Jul 2023 15:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76C10E43E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:30:36 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by michel.telenet-ops.be with bizsmtp
 id HrWZ2A00W45Xpxs06rWZ2S; Thu, 06 Jul 2023 17:30:34 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qHQw9-000g6y-2O;
 Thu, 06 Jul 2023 17:30:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qHQwD-000qrS-DI;
 Thu, 06 Jul 2023 17:30:33 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/fbdev-dma: Fix documented default preferred_bpp value
Date: Thu,  6 Jul 2023 17:30:31 +0200
Message-Id: <91f093ffe436a9f94d58fb2bfbc1407f1ebe8bb0.1688656591.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 6c80a93be62d398e ("drm/fb-helper: Initialize fb-helper's
preferred BPP in prepare function"), the preferred_bpp parameter of
drm_fb_helper_prepare() defaults to 32 instead of
drm_mode_config.preferred_depth.  Hence this also applies to
drm_fbdev_dma_setup(), which just passes its own preferred_bpp
parameter.

Fixes: b79fe9abd58bab73 ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index d86773fa8ab00f49..76aa52b38a13ed63 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -217,7 +217,7 @@ static const struct drm_client_funcs drm_fbdev_dma_client_funcs = {
  * drm_fbdev_dma_setup() - Setup fbdev emulation for GEM DMA helpers
  * @dev: DRM device
  * @preferred_bpp: Preferred bits per pixel for the device.
- *                 @dev->mode_config.preferred_depth is used if this is zero.
+ *                 32 is used if this is zero.
  *
  * This function sets up fbdev emulation for GEM DMA drivers that support
  * dumb buffers with a virtual address and that can be mmap'ed.
-- 
2.34.1

