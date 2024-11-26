Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B19D986A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED1810E8BC;
	Tue, 26 Nov 2024 13:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6kHXXwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920510E8BC;
 Tue, 26 Nov 2024 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627266; x=1764163266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tF+FNKdGrvF8wntDTJN3Y+u2QfREEbvIzSAFHLXo8NQ=;
 b=V6kHXXwHZARwvhTx6cNhi8qXk2B9M8zt30awbS0/1iU498GWiBnYp+qC
 PpI6HmbymVoipQpUSwVp0pPdlkZjOk1lgE38c4W6V/59U6tjZ7ZCBnrOl
 /wqI4vauL2fxMQr5G9vJwlWV39nwDu3hfRwJtzPjUUKmr0sDBI6wjiZJt
 bVx41TscvUbQ0ZfiO0PW8d/cLSJtbcY4/UVb8BjZD3GPU+4XesWRZDh4V
 yj3oyHriE8nYObMNVBIAkaBzGoISHftAUKDx5O70JMIgghHfduOXGqobF
 M2rtwQQlelpg0uyZrWFTsa7v+KAEF+pExJbf4aP4vCWa2eKDzELFNuFaM g==;
X-CSE-ConnectionGUID: 5TK9V5/8T2G4TgHOIl+gdQ==
X-CSE-MsgGUID: /df+ygI+QF6hsrToeUsUWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170462"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:21:06 -0800
X-CSE-ConnectionGUID: FutwbAUYSwix04gCGpFm2g==
X-CSE-MsgGUID: Ox2G22XpQ92UrAT+Ma1I1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114875109"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:21:02 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 25/25] drm/doc/rfc: Add documentation for multi-segmented 1D LUT
Date: Tue, 26 Nov 2024 18:57:30 +0530
Message-ID: <20241126132730.1192571-26-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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
index 4135f07b85a7..706dfc449aee 100644
--- a/Documentation/gpu/rfc/color_pipeline.rst
+++ b/Documentation/gpu/rfc/color_pipeline.rst
@@ -277,6 +277,125 @@ pipeline might look like this::
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
+2. Piece Wise Linear 1D LUT2. Piece Wise Linear 1D LUT
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
@@ -318,6 +437,27 @@ property values::
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
@@ -373,4 +513,4 @@ for user space. In this case a new pipeline should be defined.
 References
 ==========
 
-1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
\ No newline at end of file
+1. https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
-- 
2.42.0

