Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF914777D42
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733DE10E57C;
	Thu, 10 Aug 2023 16:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24A410E573;
 Thu, 10 Aug 2023 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P9MEKtJhSMgnLsIUAgMIyHv1PUh5yex761a8f47xbF0=; b=swq6cD3C1dUjaAvuAZM/bLVita
 EqMOTO6SwjYjNG9oMqWML6wVDB5DJxM3riDflq6oaDk42oPSxPpKzLJeXVyN2Zdv3dnQsGIiBqELS
 0lTNLEQPv+gEKg1REF/jWQjjRs/w/PPGTHSaGaSzJni2CulOXRxuR4EAvIcsURC02sShGbGg3krVJ
 GdE6MagS742FMJ/rBh7uQXLkH4bb9cnHL1GSTLFpNw0rorCbTNzASvn+lIwiY4EhAImkoZuJwVRIb
 4sR6vb+3ojeksfecp522nDaLYW0pD5AEzSFvq0PyTWaBRBrjIVx3kVFh18AhEl10RRx4OpqjmX1P8
 Gzt1f4hw==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88N-00GjYD-Fv; Thu, 10 Aug 2023 18:03:35 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 08/34] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Date: Thu, 10 Aug 2023 15:02:48 -0100
Message-Id: <20230810160314.48225-9-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Brief documentation about pre-defined transfer function usage on AMD
display driver and standardized EOTFs and inverse EOTFs.

Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index cc2187c0879a..7f13bcdaf016 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -85,6 +85,45 @@ void amdgpu_dm_init_color_mod(void)
 }
 
 #ifdef AMD_PRIVATE_COLOR
+/* Pre-defined Transfer Functions (TF)
+ *
+ * AMD driver supports pre-defined mathematical functions for transferring
+ * between encoded values and optical/linear space. Depending on HW color caps,
+ * ROMs and curves built by the AMD color module support these transforms.
+ *
+ * The driver-specific color implementation exposes properties for pre-blending
+ * degamma TF, shaper TF (before 3D LUT), and blend(dpp.ogam) TF and
+ * post-blending regamma (mpc.ogam) TF. However, only pre-blending degamma
+ * supports ROM curves. AMD color module uses pre-defined coefficients to build
+ * curves for the other blocks. What can be done by each color block is
+ * described by struct dpp_color_capsand struct mpc_color_caps.
+ *
+ * AMD driver-specific color API exposes the following pre-defined transfer
+ * functions:
+ *
+ * - Linear/Unity: linear/identity relationship between pixel value and
+ *   luminance value;
+ * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure gamma functions;
+ * - sRGB: 2.4 gamma with small initial linear section as standardized by IEC
+ *   61966-2-1:1999;
+ * - BT.709 (BT.1886): 2.4 gamma with differences in the dark end of the scale.
+ *   Used in HD-TV and standardized by ITU-R BT.1886;
+ * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
+ *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
+ *
+ * In the driver-specific API, color block names attached to TF properties
+ * suggest the intention regarding non-linear encoding pixel's luminance
+ * values. As some newer encodings don't use gamma curve, we make encoding and
+ * decoding explicit by defining an enum list of transfer functions supported
+ * in terms of EOTF and inverse EOTF, where:
+ *
+ * - EOTF (electro-optical transfer function): is the transfer function to go
+ *   from the encoded value to an optical (linear) value. De-gamma functions
+ *   traditionally do this.
+ * - Inverse EOTF (simply the inverse of the EOTF): is usually intended to go
+ *   from an optical/linear space (which might have been used for blending)
+ *   back to the encoded values. Gamma functions traditionally do this. 
+ */
 static const char * const
 amdgpu_transfer_function_names[] = {
 	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
-- 
2.40.1

