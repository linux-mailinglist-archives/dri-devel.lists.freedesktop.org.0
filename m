Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AF4D08D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75DF10E235;
	Mon,  7 Mar 2022 20:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFA910E237
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:32 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by michel.telenet-ops.be with bizsmtp
 id 3YtW2700D1Yj8bA06YtWjR; Mon, 07 Mar 2022 21:53:30 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM9-0036SS-34; Mon, 07 Mar 2022 21:53:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM8-0034mP-L8; Mon, 07 Mar 2022 21:53:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/3] drm_fourcc: Add DRM_FORMAT_C[124]
Date: Mon,  7 Mar 2022 21:53:17 +0100
Message-Id: <c9b62e081b77b625654e7d4477bfd63fe3833c35.1646683737.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646683737.git.geert@linux-m68k.org>
References: <cover.1646683737.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add fourcc codes for color-indexed frame buffer formats with two, four,
and sixteen colors.  Add support for creating buffers using these
formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/drm/drm_fourcc.h |  5 ++++-
 tests/modetest/buffers.c | 15 +++++++++++++++
 tests/util/format.c      |  3 +++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 957c7be29239c0a1..f8b18d28a71dabff 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -99,7 +99,10 @@ extern "C" {
 #define DRM_FORMAT_INVALID	0
 
 /* color index */
-#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
+#define DRM_FORMAT_C1		fourcc_code('C', '1', ' ', ' ') /* [7:0] C0:C1:C2:C3:C4:C5:C6:C7 1:1:1:1:1:1:1:1 eight pixels/byte */
+#define DRM_FORMAT_C2		fourcc_code('C', '2', ' ', ' ') /* [7:0] C0:C1:C2:C3 2:2:2:2 four pixels/byte */
+#define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [7:0] C0:C1 4:4 two pixels/byte */
+#define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C 8 one pixel/byte */
 
 /* 8 bpp Red */
 #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 8a8d9e0143474378..af7f60b4fb4d09ad 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -135,6 +135,18 @@ bo_create(int fd, unsigned int format,
 	int ret;
 
 	switch (format) {
+	case DRM_FORMAT_C1:
+		bpp = 1;
+		break;
+
+	case DRM_FORMAT_C2:
+		bpp = 2;
+		break;
+
+	case DRM_FORMAT_C4:
+		bpp = 4;
+		break;
+
 	case DRM_FORMAT_C8:
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV21:
@@ -283,6 +295,9 @@ bo_create(int fd, unsigned int format,
 		planes[2] = virtual + offsets[2];
 		break;
 
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
 	case DRM_FORMAT_C8:
 	case DRM_FORMAT_ARGB4444:
 	case DRM_FORMAT_XRGB4444:
diff --git a/tests/util/format.c b/tests/util/format.c
index 1ca1b82ce947b2f4..4b984af9bce8ac6f 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -40,6 +40,9 @@
 
 static const struct util_format_info format_info[] = {
 	/* Indexed */
+	{ DRM_FORMAT_C1, "C1" },
+	{ DRM_FORMAT_C2, "C2" },
+	{ DRM_FORMAT_C4, "C4" },
 	{ DRM_FORMAT_C8, "C8" },
 	/* YUV packed */
 	{ DRM_FORMAT_UYVY, "UYVY", MAKE_YUV_INFO(YUV_YCbCr | YUV_CY, 2, 2, 2) },
-- 
2.25.1

