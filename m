Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672F7C8801
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520D10E15B;
	Fri, 13 Oct 2023 14:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A45910E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:20 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by laurent.telenet-ops.be with bizsmtp
 id xSjJ2A00956FAx301SjJtd; Fri, 13 Oct 2023 16:43:18 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gx5-IT;
 Fri, 13 Oct 2023 16:43:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNm-002Vpi-0M;
 Fri, 13 Oct 2023 16:43:18 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 8/9] modetest: add support for DRM_FORMAT_C[124]
Date: Fri, 13 Oct 2023 16:43:10 +0200
Message-Id: <f56a54c506ddca865edcb4e336e342bd02e06840.1697207862.git.geert@linux-m68k.org>
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

Add support for creating buffers using the new color-indexed frame
buffer formats with two, four, and sixteen colors.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v4:
  - No changes,

v3:
  - Add Acked-by,

v2:
  - Split off changes to tests/modetest/buffers.c.
---
 tests/modetest/buffers.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index c122fb3fe9429190..65f1cfb32ab9eeae 100644
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
@@ -292,6 +304,9 @@ bo_create(int fd, unsigned int format,
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

