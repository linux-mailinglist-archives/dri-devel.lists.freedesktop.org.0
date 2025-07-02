Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB1AF0F34
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A4B10E6B4;
	Wed,  2 Jul 2025 09:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsUyjRfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511D510E6B4;
 Wed,  2 Jul 2025 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447351; x=1782983351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEumus4aX1i+GcxUoPkJzRO4vo/WSL9xxgY1FbaKYiA=;
 b=fsUyjRfyDD+ocZORWBOjxKksdkikvkJQHPkjfvWSOKTqQKiqnemvJjAa
 DP5IcS5tBnLsyuYsz+gAH6je4hlHG5GJtqxaeQ70cIkHNj9q3Bj+F7mox
 bl+NO8LME+nDm/LsEs5vFpWkmRBtYpi/lMKvki5D58eGC2BBtI5D7ufSB
 PyD2xKZzMLe9aE6CxqoSbhhaIDYyOjGJW1yh8JpIwNfRmvfgvbT7TIG6g
 Vpghrr0ERzNHQnPqswGUnUeYDdFPeM1f2mmcuy9RRN0rLUYyJzG08h913
 uNtPiSq7QEjSynUgsK4CprGUCv4j7B6Q/wt3MX2ftLUOkpqmnmDTMHyLK w==;
X-CSE-ConnectionGUID: t91QTrWNR8aKyg0fSidsjA==
X-CSE-MsgGUID: FsTKiBbaTF6dF5SMSsCEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427279"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:09:11 -0700
X-CSE-ConnectionGUID: 4lY6Mpm/RlSzZNv4I7bJCQ==
X-CSE-MsgGUID: O/FCEOGOQ3iO7gXlWtxoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536835"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:09:07 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 24/24] drm/doc/rfc: Add documentation for multi-segmented 1D LUT
Date: Wed,  2 Jul 2025 14:49:36 +0530
Message-ID: <20250702091936.3004854-25-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation to explain properties of the exposed hardware
1D LUT blocks, its identification and computation of the LUT samples
based on the number of samples, their distribution and precison.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 Documentation/gpu/rfc/color_pipeline.rst | 142 ++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/rfc/color_pipeline.rst b/Documentation/gpu/rfc/color_pipeline.rst
index cd1cc2d0f988..10cfcf8f1c74 100644
--- a/Documentation/gpu/rfc/color_pipeline.rst
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -279,6 +279,125 @@ pipeline might look like this::
     ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
     └─ "NEXT" (immutable) = 0
 
+Discover capabilities of 1D LUT HW block
+----------------------------------------
+
+The driver exposes a blob property(HW_CAPS) which allows user-space to
+parse and extract the hardware capabilities of 1D LUT. These include
+number of LUT segments, number of LUT samples per segment, start and end
+point of respective segments and the precision of the LUT sample along
+with the normalization factor. This is how the capability structure look like
+
+	struct drm_color_lut_range {
+	       __u32 flags;
+	       __u16 count;
+	       __s32 start, end;
+	       __u32 norm_factor;
+
+	       struct {
+	               __u16 intp;
+	               __u16 fracp;
+	       } precision;
+	};
+
+If a hardware has multiple segments in 1D LUT, each segment will be represented
+by one instance of the above structure and the whole 1D LUT block will be represented
+by an array of drm_color_lut_range.
+
+Here,
+
+flags : This indicates LUT characteristics like linearly increasing, negative
+	reflect or any other property of the LUT.
+
+count : Number of samples in the respective segments.
+
+start, end : It indicates the starting point and ending point of the segment respectively.
+	This represent a point in 0 to 1.0 color space curve and the value depends on
+	the normalization factor chosen.
+
+norm_factor : This factor helps define a scale to represent LUT sample with the smallest step size
+	      in case of uniform or non-uniform LUT sample distribution.
+
+precision: It indicates the fixed point precision of HW LUT including integer and fractional component.
+
+To explain the usage with some real life example
+------------------------------------------------
+
+1. Conventional 1D LUT with just one segment
+
+		|---|---|------------------------------------|
+		0   1   2                                   1024
+
+
+	- Hardware Description: A color block with a LUT linearly interpolating and
+				covering range from 0 to 1.0
+					- Number of segments - 1
+					- Number of samples in LUT 1024
+					- Precision of LUT samples in HW 0.10
+					- Normalization Factor - Max value to represent 1.0
+						 in terms of smallest step size which is 1024.
+
+	In this case, it will be represented by the following structure.
+
+	struct drm_color_lut_range lut_1024[] = {
+			.start = 0 .end = (1 << 10);
+			.normalization_factor = 1024;
+			.count = 1024;
+			.precision {
+				.int_comp = 0;
+				.fractional_comp = 10;
+			}
+		}
+
+2. Piece Wise Linear 1D LUT
+
+	        |---|---|------------------------------------|
+		0   1   2                                   32
+		|    \
+                |       \
+                |          \
+                |             \
+                |                \
+		0                   \
+                |---|---|--...-------|
+		0   1   2            8
+
+	- Hardware Description: A color block with a LUT linearly interpolating and
+				covering range from 0 to 1.0
+					- Number of segments 2
+					- Number of samples
+						- segment 1 - 9 (covers range from 0 to 1/32)
+						- segment 2 - 30 (covers range from 2/32 to 1.0)
+					- Precision of LUT samples in HW 0.24
+					- Normalization Factor - Max value to represent 1.0
+						 in terms of smallest step size which is 8*32.
+
+		struct drm_color_lut_range lut_pwl[] = {
+		        /* segment 1 */
+		        {
+				.count = 9,
+				.start = 0, .end = 8,
+				.norm_factor = 8*32,
+				.precision = {
+					.intp = 0,
+					.fracp = 24,
+				},
+			},
+		        /* segment 2 */
+			{
+				.count = 30,
+				.start = 8*2, .end = 8*32,
+				.norm_factor = 8*32,
+				.precision = {
+					.intp = 0,
+					.fracp = 24,
+				},
+		        },
+		}
+
+Note: In case HW supports overlapping LUTs expectation from uAPI is that the respective HW vendor
+driver expose it as linearly increasing LUT and it will internally handle the programming of the
+overlapping sections.
 
 Color Pipeline Programming
 ==========================
@@ -320,6 +439,27 @@ property values::
     ├─ "CURVE_1D_TYPE" = PQ EOTF
     └─ "BYPASS" = false
 
+Programming 1d LUT HW block
+---------------------------
+
+In order to compute the LUT samples, userspace will parse the drm_color_lut_range structure to
+get the LUT distribution of the underlying HW block.
+
+It needs to compute the normalized value of the LUT sample using the normalization factor provided
+by the driver. The normalized value can then be scaled to the LUT precision of the HW. The computed
+LUT samples will be packed in a blob and passed to the driver to be programmed in HW.
+
+The pseudo code of calculating the LUT samples for a linear LUT is described below.
+
+	for (i = 0; i < sample_count; i++) {
+			                  start                         end - start
+		normalized_value = ---------------------- + ----------------------------------------- * i
+			            normalization_factor    (sample_count - 1) * normalization_factor
+
+		lut[i] = normalized_value * lut_precision /* (1 << precision.fracp) */
+	}
+
+Note: The same logic can be extended for any color space transfer function implementation.
 
 Driver Implementer's Guide
 ==========================
@@ -375,4 +515,4 @@ for user space. In this case a new pipeline should be defined.
 References
 ==========
 
-1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
-- 
2.42.0

