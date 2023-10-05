Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8AC7BA786
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AB510E446;
	Thu,  5 Oct 2023 17:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AF610E43C;
 Thu,  5 Oct 2023 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GRrnDtFMyiMaU4LlgdhrT1yQ3d8NPGwHn28lmseYX4Y=; b=jBWxCoXorrrGX/ptqSX63EjxyS
 I0pPAbEf5tRho1ytSXildeWlzKxYquROUJeHvm8VnN7/BZEGh4HcZ0kuLINlNtzu6QQn+OZmxkffc
 S0Mjbxgd8EsihSuy+aWzTveFMVd4y7+geU5NFQyJd32XSAdnhqhMiZEldUZnj+qhY2F4doAQkyOcu
 Ky4iAgN12pKMc8Uoj1tqMF2wSrsWe2taQ0wj7ixJRxwKVRArmddO6RO59xXtcafk9FYFT6WNIetaV
 nXdFSZku9YW+MyN6rbJRYeAMhH5Rli/Vs4Lbgv51K2vH4/ghG4aKn3UimulSSg+YyRSMY8p1h3aKC
 /2+p7lHw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRww-00CFJN-5n; Thu, 05 Oct 2023 19:15:46 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v4 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
Date: Thu,  5 Oct 2023 16:15:02 -0100
Message-Id: <20231005171527.203657-8-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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

Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index d03bdb010e8b..d5dbd20a6766 100644
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

