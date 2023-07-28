Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C34F76695A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478A10E08D;
	Fri, 28 Jul 2023 09:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B7010E064
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:52:48 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by albert.telenet-ops.be with bizsmtp
 id SZsm2A00V0d1nm806Zsm1J; Fri, 28 Jul 2023 11:52:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9B-002m5W-Jl;
 Fri, 28 Jul 2023 11:52:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9O-00ApV6-PV;
 Fri, 28 Jul 2023 11:52:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v3 9/9] modetest: Add SMPTE pattern support for C4
 format
Date: Fri, 28 Jul 2023 11:52:40 +0200
Message-Id: <3e799ebd364c6a33224236d8f1247a5b9e10ea25.1690537375.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690537375.git.geert@linux-m68k.org>
References: <cover.1690537375.git.geert@linux-m68k.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for drawing the SMPTE pattern in buffers using a
color-indexed frame buffer formats with two, four, or sixteen colors.

Note that this still uses 256 as the CLUT size, as
DRM_IOCTL_MODE_SETGAMMA enforces that the size matches against the
(fixed) gamma size, while the CLUT size depends on the format.

Move clearing the color LUT entries from util_smpte_index_gamma() to its
caller, as only the caller knows how many entries there really are
(currently DRM always assumes 256 entries).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v3:
  - Add Acked-by,

v2:
  - Split off changes to tests/modetest/modetest.c,
  - Add C1 and C2 support.

The linuxdoc comments say userspace can query the gamma size:

 * drm_mode_gamma_set_ioctl - set the gamma table
 *
 * Set the gamma table of a CRTC to the one passed in by the user. Userspace can
 * inquire the required gamma table size through drm_mode_gamma_get_ioctl.

 * drm_mode_gamma_get_ioctl - get the gamma table
 *
 * Copy the current gamma table into the storage provided. This also provides
 * the gamma table size the driver expects, which can be used to size the
 * allocated storage.

but the code doesn't seem to support that in an easy way (like setting
red/green/blue to NULL on input, retrieving gamma_size on output), only
by providing big enough buffers for red/green/blue, and looping over
gamma_size until -EINVAL is no longer returned.
---
 tests/modetest/modetest.c | 9 ++++++---
 tests/util/pattern.c      | 1 -
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index ce91d404d747beb9..ce334868df7bf12a 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1116,13 +1116,16 @@ static bool add_property_optional(struct device *dev, uint32_t obj_id,
 static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)
 {
 	unsigned blob_id = 0;
+	const struct util_format_info *info;
 	/* TODO: support 1024-sized LUTs, when the use-case arises */
 	struct drm_color_lut gamma_lut[256];
 	int i, ret;
 
-	if (fourcc == DRM_FORMAT_C8) {
-		/* TODO: Add C8 support for more patterns */
-		util_smpte_index_gamma(256, gamma_lut);
+	info = util_format_info_find(fourcc);
+	if (info->ncolors) {
+		memset(gamma_lut, 0, sizeof(gamma_lut));
+		/* TODO: Add index support for more patterns */
+		util_smpte_index_gamma(info->ncolors, gamma_lut);
 		drmModeCreatePropertyBlob(dev->fd, gamma_lut, sizeof(gamma_lut), &blob_id);
 	} else {
 		for (i = 0; i < 256; i++) {
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 1c6176b41506fa7d..a757d3de76fe4a2d 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -990,7 +990,6 @@ void util_smpte_index_gamma(unsigned size, struct drm_color_lut *lut)
 		printf("Error: gamma too small: %u < 2\n", size);
 		return;
 	}
-	memset(lut, 0, size * sizeof(struct drm_color_lut));
 
 #define FILL_COLOR(idx, r, g, b) \
 	lut[idx].red = (r) * 0x101; \
-- 
2.34.1

