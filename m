Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65456BE9A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403B10EBBE;
	Fri,  8 Jul 2022 18:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA810EBBB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:32 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id siMU270024C55Sk01iMUmx; Fri, 08 Jul 2022 20:21:30 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbX-002fJg-CX; Fri, 08 Jul 2022 20:21:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbW-00BtNW-MT; Fri, 08 Jul 2022 20:21:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/3] drm/fourcc: Add missing big-endian XRGB1555 and RGB565
 formats
Date: Fri,  8 Jul 2022 20:21:07 +0200
Message-Id: <0744671ac096a12f0d538906bd324efa71b11400.1657300532.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657300532.git.geert@linux-m68k.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit eae06120f1974e1a ("drm: refuse ADDFB2 ioctl for broken
bigendian drivers"), drivers must set the
quirk_addfb_prefer_host_byte_order quirk to make the drm_mode_addfb()
compat code work correctly on big-endian machines.

While that works fine for big-endian XRGB8888 and ARGB8888, which are
mapped to the existing little-endian BGRX8888 and BGRA8888 formats, it
does not work for big-endian XRGB1555 and RGB565, as the latter are not
listed in the format database.

Fix this by adding the missing formats.  Limit this to big-endian
platforms, as there is currently no need to support these formats on
little-endian platforms.

Fixes: 6960e6da9cec3f66 ("drm: fix drm_mode_addfb() on big endian machines.")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Cirrus is the only driver setting quirk_addfb_prefer_host_byte_order
and supporting RGB565 or XRGB1555, but no one tried that on big-endian?
Cirrus does not support DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN
in cirrus_fb_create, so you cannot get a graphical text console.

Do we need these definitions on little-endian platforms, too?
Would it be better to use "DRM_FORMAT_{XRGB1555,RGB565} |
DRM_FORMAT_BIG_ENDIAN" instead of "DRM_FORMAT_HOST_{XRGB1555,RGB565}" in
formats[]?

Alternative, callers could filter out the DRM_FORMAT_BIG_ENDIAN flag
when calling {,__}drm_format_info().

Advantages:
  - No need to have separate entries with DRM_FORMAT_BIG_ENDIAN set.

Disadvantages:
  - {,__}drm_format_info() returns a pointer to a const object,
    whose .format field won't have the DRM_FORMAT_BIG_ENDIAN flag set,
    complicating callers,
  - All callers need to be updated,
  - It is difficult to know which big-endian formats are really
    supported, especially as only a few are needed.
---
 drivers/gpu/drm/drm_fourcc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e09331bb3bc73f21..16a854c9e07fa4b0 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -190,6 +190,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_BGRA5551,	.depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
 		{ .format = DRM_FORMAT_RGB565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR565,		.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+#ifdef __BIG_ENDIAN
+		{ .format = DRM_FORMAT_HOST_XRGB1555,	.depth = 15, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_HOST_RGB565,	.depth = 16, .num_planes = 1, .cpp = { 2, 0, 0 }, .hsub = 1, .vsub = 1 },
+#endif
 		{ .format = DRM_FORMAT_RGB888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_BGR888,		.depth = 24, .num_planes = 1, .cpp = { 3, 0, 0 }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_XRGB8888,	.depth = 24, .num_planes = 1, .cpp = { 4, 0, 0 }, .hsub = 1, .vsub = 1 },
-- 
2.25.1

