Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2C56BEAA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0904810EBF9;
	Fri,  8 Jul 2022 18:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64910EBE1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:47 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id siMn270054C55Sk06iMnbu; Fri, 08 Jul 2022 20:21:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-002fMY-Ty; Fri, 08 Jul 2022 20:21:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-00BtTD-A9; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 09/10] modetest: Add support for DRM_FORMAT_C[124]
Date: Fri,  8 Jul 2022 20:21:39 +0200
Message-Id: <49042436e4f9ee709a616779def3c0c0833176f6.1657302034.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302034.git.geert@linux-m68k.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
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

Add support for creating buffers using the new color-indexed frame
buffer formats with two, four, and sixteen colors.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Split off changes to tests/modetest/buffers.c.
---
 tests/modetest/buffers.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
-- 
2.25.1

