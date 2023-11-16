Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5A7EE7D1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A9110E6A3;
	Thu, 16 Nov 2023 19:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDC710E6A0;
 Thu, 16 Nov 2023 19:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t124/2VXkkq9IBi4C/lfDlMMa/jXITa3YTzJQPndZTU=; b=q9Z9d4hVdS4ISCxJeYps1Z4s3L
 uw4qN0SQwMJq4pcRBTEQcuv3r2vMJuwJ5j2MXV4nloFRoh0LKKob+YqXkADx8EYKFT8UR/vT8FR/0
 QRln/uKysN5FrG4eQWiof5V0cFiR9sHLRDvtfBjv149FgQWHfL1Y2xGXtyp02uu3tYDODvAdJHdlv
 nneu2cql5CxhLQLDDw7P8opS/FbUQNDwnLzLTPmHk5j2dahxXXich+f2I7ZJ99T7kxm/7nw0YKpoS
 JsZv43jobaf+1D+Maaobn/ToOAZGqVLM4ZLfxdAaxJtHpfT45wLnueGealwvUn2ajalbsGPPH8oYC
 LpW02q/g==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVT-0048Yy-Nn; Thu, 16 Nov 2023 20:58:31 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Date: Thu, 16 Nov 2023 18:57:47 -0100
Message-Id: <20231116195812.906115-8-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Brief documentation about pre-defined transfer function usage on AMD
display driver and standardized EOTFs and inverse EOTFs.

v3:
- Document BT709 OETF (Pekka)
- Fix description of sRGB and pure power funcs (Pekka)

v4:
- Add description of linear and non-linear forms (Harry)

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a32abbd93a61..49faaf606cfe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -85,6 +85,68 @@ void amdgpu_dm_init_color_mod(void)
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
+ * - Identity: linear/identity relationship between pixel value and
+ *   luminance value;
+ * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure power functions;
+ * - sRGB: 2.4: The piece-wise transfer function from IEC 61966-2-1:1999;
+ * - BT.709: has a linear segment in the bottom part and then a power function
+ *   with a 0.45 (~1/2.22) gamma for the rest of the range; standardized by
+ *   ITU-R BT.709-6;
+ * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
+ *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
+ *
+ * The AMD color model is designed with an assumption that SDR (sRGB, BT.709,
+ * Gamma 2.2, etc.) peak white maps (normalized to 1.0 FP) to 80 nits in the PQ
+ * system. This has the implication that PQ EOTF (non-linear to linear) maps to
+ * [0.0..125.0] where 125.0 = 10,000 nits / 80 nits.
+ *
+ * Non-linear and linear forms are described in the table below:
+ *
+ * ┌───────────┬─────────────────────┬──────────────────────┐
+ * │           │     Non-linear      │   Linear             │
+ * ├───────────┼─────────────────────┼──────────────────────┤
+ * │      sRGB │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
+ * ├───────────┼─────────────────────┼──────────────────────┤
+ * │     BT709 │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
+ * ├───────────┼─────────────────────┼──────────────────────┤
+ * │ Gamma 2.x │ UNORM or [0.0, 1.0] │ [0.0, 1.0]           │
+ * ├───────────┼─────────────────────┼──────────────────────┤
+ * │        PQ │ UNORM or FP16 CCCS* │ [0.0, 125.0]         │
+ * ├───────────┼─────────────────────┼──────────────────────┤
+ * │  Identity │ UNORM or FP16 CCCS* │ [0.0, 1.0] or CCCS** │
+ * └───────────┴─────────────────────┴──────────────────────┘
+ * * CCCS: Windows canonical composition color space
+ * ** Respectively
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

