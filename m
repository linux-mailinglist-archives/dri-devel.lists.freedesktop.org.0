Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169CC97368
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3077110E3BB;
	Mon,  1 Dec 2025 12:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o/Nq1J2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1F710E3B8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:19:22 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B553C176E;
 Mon,  1 Dec 2025 13:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764591427;
 bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=o/Nq1J2DeNIItyGvxpknG+Es2gMm4K5JMfFrN4r/rcr/j+F+VmIbEPNrRuFMUVR4A
 fTtzv1SAh2Vc+KTsYTNl21x9OvQiAIghxpa8zFkWmuKMLPWMrQkBuoj3YPPjBCv4dE
 mUC0OffqRe9UUfoFBE2DKbc8+4y3iRJm2i/dwqJM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 01 Dec 2025 14:18:43 +0200
Subject: [PATCH v7 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-xilinx-formats-v7-1-1e1558adfefc@ideasonboard.com>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
In-Reply-To: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpLYfCrz0osWNnioWxJ+pRazxkcDm1Y6wFOSqoG
 VxQ+vrQCVWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaS2HwgAKCRD6PaqMvJYe
 9XxGD/9CK7bNaaDU9xQvVBPvD9PhicflAfu2lrfT2pb0kbeKPAGTHNyuGCyqyT7tBGKk1aAk/+a
 /erKLy/3MiMyid4xBUuKnwXICHkzCwFragfhL/3TCmUQ1MMH9WYOp6gmtPUrkMEcmPuBqtfLFHA
 7jBp53da1pm1x2jaRmD7scAnlkdIwgfFZy1Tq7v8nixz/eDXHyAwnAPuFUovmo0Xr0dnE67e60I
 atWpXj+BRuOXmg/EmVfOyajuxb2kuiFlmTcqOog8CGfYPcBv9PiOMiWjfeUS6TfrMuR9JctivHs
 SNTsiVzcBD3wg4oCpH0IL0KIWI3V/AQvNYCF+DijSHe9PhH3pTbQ2WcboI0xV6jh6JibKIppMTb
 +6MBB+gdhNTbRQsug1Jkb/rvbC2NoYpgLWoS3qMZK1tm/es8iuHflIfp7eyTqPP3Pc7gWJ7rGA4
 3ij4wl/6BK4V7KtIg+OLm6NrA6/8dKkQ23adxfUXz6eSOfpQ8vYHBCU1WWVk+ft83B3Ovo8G5nE
 iDoQnvzRKZYMR9GwDZTGATxWe36NWQiucPQOGKnu/F9P6LskikMa4dyQf0nuJEgBW+LAs+4WimO
 cC0mcyzk749W/7M4f46SpvU8bcazBoSb+uvodXK701S/LfGXCEIgxwToSfd9ueBsb02AcsobBlH
 UhsURqHox0d9rnQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
pixels (Y components), and two padding bits, in a 4 byte block. That is
10.666... bits per pixel when considering the whole 4 byte block, which
is what drm_format_info_bpp() does. Thus a driver that supports such
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e0d533611040..e662aea9d105 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -491,12 +491,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
  */
 unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 {
+	unsigned int block_size;
+
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
-	return info->char_per_block[plane] * 8 /
-	       (drm_format_info_block_width(info, plane) *
-		drm_format_info_block_height(info, plane));
+	block_size = drm_format_info_block_width(info, plane) *
+		     drm_format_info_block_height(info, plane);
+
+	if (info->char_per_block[plane] * 8 % block_size) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
+	return info->char_per_block[plane] * 8 / block_size;
 }
 EXPORT_SYMBOL(drm_format_info_bpp);
 

-- 
2.43.0

