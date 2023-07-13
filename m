Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FCD752345
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 15:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2F610E6D6;
	Thu, 13 Jul 2023 13:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A24A10E6D6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 13:17:26 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
 by michel.telenet-ops.be with bizsmtp
 id LdHN2A00Z3wy6xv06dHNad; Thu, 13 Jul 2023 15:17:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwC3-001Gqq-0u;
 Thu, 13 Jul 2023 15:17:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qJwCA-00GWyY-N9;
 Thu, 13 Jul 2023 15:17:22 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/8] drm/dumb-buffers: Fix drm_mode_create_dumb() for bpp < 8
Date: Thu, 13 Jul 2023 15:17:10 +0200
Message-Id: <5ba8ac5e465121b646a59487dc75b27017e0c769.1689252746.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mode_create_dumb() calculates the number of characters per pixel
from the number of bits per pixel by rounding up, which is not correct
as the actual value of cpp may be non-integer.  While we do not need to
care here about complex formats like YUV, bpp < 8 is a valid use case.

  - The overflow check for the buffer width is not correct if bpp < 8.
    However, it doesn't hurt, as widths larger than U32_MAX / 8 should
    not happen for real anyway.  Add a comment to clarify.
  - Calculating the stride from the number of characters per pixel is
    not correct.  Fix this by calculating it from the number of bits per
    pixel instead.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Why is drm_mode_create_dumb.size __u64?  The test for "args->height >
U32_MAX / stride" rejects all sizes not fitting in __u32 anyway.
---
 drivers/gpu/drm/drm_dumb_buffers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index 70032bba1c97e787..21a04c32a5e3d785 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -71,10 +71,11 @@ int drm_mode_create_dumb(struct drm_device *dev,
 	/* overflow checks for 32bit size calculations */
 	if (args->bpp > U32_MAX - 8)
 		return -EINVAL;
+	/* Incorrect (especially if bpp < 8), but doesn't hurt much */
 	cpp = DIV_ROUND_UP(args->bpp, 8);
 	if (cpp > U32_MAX / args->width)
 		return -EINVAL;
-	stride = cpp * args->width;
+	stride = DIV_ROUND_UP(args->bpp * args->width, 8);
 	if (args->height > U32_MAX / stride)
 		return -EINVAL;
 
-- 
2.34.1

