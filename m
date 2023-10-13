Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436B7C8806
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2BD10E196;
	Fri, 13 Oct 2023 14:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B74210E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:20 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by laurent.telenet-ops.be with bizsmtp
 id xSjJ2A00456FAx301SjJtb; Fri, 13 Oct 2023 16:43:18 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwq-FT;
 Fri, 13 Oct 2023 16:43:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002VpO-TR;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 4/9] util: store number of colors for indexed formats
Date: Fri, 13 Oct 2023 16:43:06 +0200
Message-Id: <0d330383122825e424fedfc99ddb2cd16ca314dd.1697207862.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207862.git.geert@linux-m68k.org>
References: <cover.1697207862.git.geert@linux-m68k.org>
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

Store the number of available colors for color-indexed frame
buffer formats in the format_info[] array.  This avoids the need of test
code for having to use switch statements all the time to obtain the
number of colors, or to check if a mode is color-indexed or not.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v4:
  - No changes,

v3:
  - Add Acked-by,

v2:
  - New.
---
 tests/util/format.c | 8 ++++----
 tests/util/format.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/util/format.c b/tests/util/format.c
index b3d2abdc8e67eed0..b99cc9c3599d9237 100644
--- a/tests/util/format.c
+++ b/tests/util/format.c
@@ -40,10 +40,10 @@
 
 static const struct util_format_info format_info[] = {
 	/* Indexed */
-	{ DRM_FORMAT_C1, "C1" },
-	{ DRM_FORMAT_C2, "C2" },
-	{ DRM_FORMAT_C4, "C4" },
-	{ DRM_FORMAT_C8, "C8" },
+	{ DRM_FORMAT_C1, "C1", .ncolors = 2 },
+	{ DRM_FORMAT_C2, "C2", .ncolors = 4 },
+	{ DRM_FORMAT_C4, "C4", .ncolors = 16 },
+	{ DRM_FORMAT_C8, "C8", .ncolors = 256 },
 	/* YUV packed */
 	{ DRM_FORMAT_UYVY, "UYVY", MAKE_YUV_INFO(YUV_YCbCr | YUV_CY, 2, 2, 2) },
 	{ DRM_FORMAT_VYUY, "VYUY", MAKE_YUV_INFO(YUV_YCrCb | YUV_CY, 2, 2, 2) },
diff --git a/tests/util/format.h b/tests/util/format.h
index 2ce1c021fd78d51d..b847c9f2933b3cde 100644
--- a/tests/util/format.h
+++ b/tests/util/format.h
@@ -55,6 +55,7 @@ struct util_yuv_info {
 struct util_format_info {
 	uint32_t format;
 	const char *name;
+	unsigned int ncolors;
 	const struct util_rgb_info rgb;
 	const struct util_yuv_info yuv;
 };
-- 
2.34.1

