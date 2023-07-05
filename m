Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F87487F1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6B010E394;
	Wed,  5 Jul 2023 15:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486710E38E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:26:28 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5979:7b6f:39a:b9cb])
 by baptiste.telenet-ops.be with bizsmtp
 id HTSR2A00G45Xpxs01TSRMZ; Wed, 05 Jul 2023 17:26:25 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Ob-000ck6-Mx;
 Wed, 05 Jul 2023 17:26:25 +0200
Received: from geert by rox with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qH4Of-00AwXZ-9g;
 Wed, 05 Jul 2023 17:26:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/3] util: Add pattern support for DRM_FORMAT_NV{24, 42}
Date: Wed,  5 Jul 2023 17:26:16 +0200
Message-Id: <eab4e871d026e39f98591840daaa8d82b9ccc637.1688570702.git.geert+renesas@glider.be>
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

Add support for drawing the SMPTE and tiles patterns in buffers using
semi-planar YUV formats with non-subsampled chroma planes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tests/util/pattern.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 158c0b160a2ee870..f45a26ccec38f202 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -698,6 +698,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
 		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
 		return fill_smpte_yuv_planar(&info->yuv, planes[0], u, v,
@@ -1023,6 +1025,8 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_NV21:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		u = info->yuv.order & YUV_YCbCr ? planes[1] : planes[1] + 1;
 		v = info->yuv.order & YUV_YCrCb ? planes[1] : planes[1] + 1;
 		return fill_tiles_yuv_planar(info, planes[0], u, v,
-- 
2.34.1

