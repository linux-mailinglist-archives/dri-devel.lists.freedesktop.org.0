Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E1D76695F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B2410E6C9;
	Fri, 28 Jul 2023 09:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD0A10E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:52:48 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by xavier.telenet-ops.be with bizsmtp
 id SZsm2A00T0d1nm801Zsm5x; Fri, 28 Jul 2023 11:52:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9B-002m5R-JB;
 Fri, 28 Jul 2023 11:52:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPK9O-00ApV2-Ou;
 Fri, 28 Jul 2023 11:52:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v3 8/9] modetest: Add support for DRM_FORMAT_C[124]
Date: Fri, 28 Jul 2023 11:52:39 +0200
Message-Id: <14882a1a894875376867abdf8bcdaccbf658df43.1690537375.git.geert@linux-m68k.org>
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

Add support for creating buffers using the new color-indexed frame
buffer formats with two, four, and sixteen colors.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v3:
  - Add Acked-by,

v2:
  - Split off changes to tests/modetest/buffers.c.
---
 tests/modetest/buffers.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 0b55aeddfef9a854..8af6201aca3034a9 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -124,6 +124,18 @@ bo_create(int fd, unsigned int format,
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
@@ -272,6 +284,9 @@ bo_create(int fd, unsigned int format,
 		planes[2] = virtual + offsets[2];
 		break;
 
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
 	case DRM_FORMAT_C8:
 	case DRM_FORMAT_ARGB4444:
 	case DRM_FORMAT_XRGB4444:
-- 
2.34.1

