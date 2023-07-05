Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E174F7487F2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2977C10E396;
	Wed,  5 Jul 2023 15:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6539F10E394
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:26:28 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by andre.telenet-ops.be with bizsmtp
 id HTSR2A00J45Xpxs01TSRt7; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Ob-000ckB-NU;
 Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Of-00AwXe-AH;
 Wed, 05 Jul 2023 17:26:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 3/3] modetest: Add support for DRM_FORMAT_NV{24,42}
Date: Wed,  5 Jul 2023 17:26:17 +0200
Message-Id: <1e43eba23f3a73ed4c18ec4516869a5abc39a475.1688570702.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688570702.git.geert+renesas@glider.be>
References: <cover.1688570702.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for creating buffers using semi-planar YUV formats with
non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/modetest/buffers.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/modetest/buffers.c b/tests/modetest/buffers.c
index 0b55aeddfef9a854..0605b12552bb8eec 100644
--- a/tests/modetest/buffers.c
+++ b/tests/modetest/buffers.c
@@ -129,6 +129,8 @@ bo_create(int fd, unsigned int format,
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
 		bpp = 8;
@@ -208,6 +210,11 @@ bo_create(int fd, unsigned int format,
 		virtual_height = height * 2;
 		break;
 
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
+		virtual_height = height * 3;
+		break;
+
 	default:
 		virtual_height = height;
 		break;
@@ -255,6 +262,19 @@ bo_create(int fd, unsigned int format,
 		planes[1] = virtual + offsets[1];
 		break;
 
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
+		offsets[0] = 0;
+		handles[0] = bo->handle;
+		pitches[0] = bo->pitch;
+		pitches[1] = pitches[0] * 2;
+		offsets[1] = pitches[0] * height;
+		handles[1] = bo->handle;
+
+		planes[0] = virtual;
+		planes[1] = virtual + offsets[1];
+		break;
+
 	case DRM_FORMAT_YUV420:
 	case DRM_FORMAT_YVU420:
 		offsets[0] = 0;
-- 
2.34.1

