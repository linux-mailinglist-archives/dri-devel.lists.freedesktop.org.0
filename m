Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E82AAA04A
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2C110E4C9;
	Mon,  5 May 2025 22:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B48cwSHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF55A10E4C8;
 Mon,  5 May 2025 22:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E35774A285;
 Mon,  5 May 2025 22:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F83EC4CEE4;
 Mon,  5 May 2025 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484398;
 bh=NNaqxXAZEKjGDSJV+2iLJ4GQNoCZYaBBpvFWGKgDev8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B48cwSHyG1PWGHZTRphPp3KMOcXLM0enAsBBk3byw8qXtwm3FPDMVh2GRmozVDeod
 yJKqiSOoGDuZnK1141zBsHd/OLKXiN3hhShhHW4GH+CKuEkoxRgdH4VJbQyQ6cOH/e
 /fsHUY4GslppCNYLPCjNz7XzR5EzkDQaflfhQ9DQamQkzpLkFg1JIhM0L0LQDYBSA5
 ZGBCYYLmnSfpTNZ/Hgs6T2yKkIHJpJL1nfagslluIIrrU9rVTRtl0z7g2ko60bwyGj
 PKK3vG6GFH1fE7/BBdjT0AIZJ1lCSMFfb4Fft7Sk8kV+VX21ikUcWlBWahtw3XDfVi
 33vcZqWEfo+DA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Austin Zheng <Austin.Zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, siqueira@igalia.com, alex.hung@amd.com,
 colin.i.king@gmail.com, aurabindo.pillai@amd.com, chaitanya.dhere@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 470/642] drm/amd/display: Account For OTO
 Prefetch Bandwidth When Calculating Urgent Bandwidth
Date: Mon,  5 May 2025 18:11:26 -0400
Message-Id: <20250505221419.2672473-470-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Austin Zheng <Austin.Zheng@amd.com>

[ Upstream commit 36681f15bb12b5c01df924379cdab9234259825c ]

[Why]
1) The current calculations for OTO prefetch bandwidth do not consider the number of DPP pipes in use.
As a result, OTO prefetch bandwidth may be larger than the vactive bandwidth if multiple DPP pipes are used.
OTO prefetch bandwidth should never exceed the vactive bandwidth.

2) Mode programming may be mismatched with mode support
In cases where mode support has chosen to use the equalized (equ) prefetch schedule,
mode programming may end up using oto prefetch schedule instead.
The bandwidth required to do the oto schedule may end up being higher than the equ schedule.
This can cause the required urgent bandwidth to exceed the available urgent bandwidth.

[How]
Output the oto prefetch bandwidth and incorperate it into the urgent bandwidth calculations
even if the prefetch schedule being used is not the oto schedule.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 25 ++++++++++++++++++-
 .../src/dml2_core/dml2_core_shared_types.h    |  5 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 8ad7704b76691..913f33c31cf38 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -4915,6 +4915,7 @@ static double get_urgent_bandwidth_required(
 	double ReadBandwidthChroma[],
 	double PrefetchBandwidthLuma[],
 	double PrefetchBandwidthChroma[],
+	double PrefetchBandwidthOto[],
 	double excess_vactive_fill_bw_l[],
 	double excess_vactive_fill_bw_c[],
 	double cursor_bw[],
@@ -4978,8 +4979,9 @@ static double get_urgent_bandwidth_required(
 			l->vm_row_bw = NumberOfDPP[k] * prefetch_vmrow_bw[k];
 			l->flip_and_active_bw = l->per_plane_flip_bw[k] + ReadBandwidthLuma[k] * l->adj_factor_p0 + ReadBandwidthChroma[k] * l->adj_factor_p1 + cursor_bw[k] * l->adj_factor_cur;
 			l->flip_and_prefetch_bw = l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre;
+			l->flip_and_prefetch_bw_oto = l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthOto[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre;
 			l->active_and_excess_bw = (ReadBandwidthLuma[k] + excess_vactive_fill_bw_l[k]) * l->tmp_nom_adj_factor_p0 + (ReadBandwidthChroma[k] + excess_vactive_fill_bw_c[k]) * l->tmp_nom_adj_factor_p1 + dpte_row_bw[k] + meta_row_bw[k];
-			surface_required_bw[k] = math_max4(l->vm_row_bw, l->flip_and_active_bw, l->flip_and_prefetch_bw, l->active_and_excess_bw);
+			surface_required_bw[k] = math_max5(l->vm_row_bw, l->flip_and_active_bw, l->flip_and_prefetch_bw, l->active_and_excess_bw, l->flip_and_prefetch_bw_oto);
 
 			/* export peak required bandwidth for the surface */
 			surface_peak_required_bw[k] = math_max2(surface_required_bw[k], surface_peak_required_bw[k]);
@@ -5177,6 +5179,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->Tsw_est3 = 0.0;
 	s->cursor_prefetch_bytes = 0;
 	*p->prefetch_cursor_bw = 0;
+	*p->RequiredPrefetchBWOTO = 0.0;
 
 	dcc_mrq_enable = (p->dcc_enable && p->mrq_present);
 
@@ -5390,6 +5393,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		s->prefetch_bw_oto += (p->swath_width_chroma_ub * p->myPipe->BytePerPixelC) / s->LineTime;
 	}
 
+	/* oto prefetch bw should be always be less than total vactive bw */
+	DML2_ASSERT(s->prefetch_bw_oto < s->per_pipe_vactive_sw_bw * p->myPipe->DPPPerSurface);
+
 	s->prefetch_bw_oto = math_max2(s->per_pipe_vactive_sw_bw, s->prefetch_bw_oto) * p->mall_prefetch_sdp_overhead_factor;
 
 	s->prefetch_bw_oto = math_min2(s->prefetch_bw_oto, *p->prefetch_sw_bytes/(s->min_Lsw_oto*s->LineTime));
@@ -5400,6 +5406,12 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 					p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
 					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
 
+	/* oto bw needs to be outputted even if the oto schedule isn't being used to avoid ms/mp mismatch.
+	 * mp will fail if ms decides to use equ schedule and mp decides to use oto schedule
+	 * and the required bandwidth increases when going from ms to mp
+	 */
+	*p->RequiredPrefetchBWOTO = s->prefetch_bw_oto;
+
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: vactive_sw_bw_l = %f\n", __func__, p->vactive_sw_bw_l);
 	dml2_printf("DML::%s: vactive_sw_bw_c = %f\n", __func__, p->vactive_sw_bw_c);
@@ -6160,6 +6172,7 @@ static void calculate_peak_bandwidth_required(
 				p->surface_read_bandwidth_c,
 				l->zero_array, //PrefetchBandwidthLuma,
 				l->zero_array, //PrefetchBandwidthChroma,
+				l->zero_array, //PrefetchBWOTO
 				l->zero_array,
 				l->zero_array,
 				l->zero_array,
@@ -6196,6 +6209,7 @@ static void calculate_peak_bandwidth_required(
 				p->surface_read_bandwidth_c,
 				l->zero_array, //PrefetchBandwidthLuma,
 				l->zero_array, //PrefetchBandwidthChroma,
+				l->zero_array, //PrefetchBWOTO
 				p->excess_vactive_fill_bw_l,
 				p->excess_vactive_fill_bw_c,
 				p->cursor_bw,
@@ -6232,6 +6246,7 @@ static void calculate_peak_bandwidth_required(
 				p->surface_read_bandwidth_c,
 				p->prefetch_bandwidth_l,
 				p->prefetch_bandwidth_c,
+				p->prefetch_bandwidth_oto, // to prevent ms/mp mismatch when oto bw > total vactive bw
 				p->excess_vactive_fill_bw_l,
 				p->excess_vactive_fill_bw_c,
 				p->cursor_bw,
@@ -6268,6 +6283,7 @@ static void calculate_peak_bandwidth_required(
 				p->surface_read_bandwidth_c,
 				p->prefetch_bandwidth_l,
 				p->prefetch_bandwidth_c,
+				p->prefetch_bandwidth_oto, // to prevent ms/mp mismatch when oto bw > total vactive bw
 				p->excess_vactive_fill_bw_l,
 				p->excess_vactive_fill_bw_c,
 				p->cursor_bw,
@@ -6304,6 +6320,7 @@ static void calculate_peak_bandwidth_required(
 				p->surface_read_bandwidth_c,
 				p->prefetch_bandwidth_l,
 				p->prefetch_bandwidth_c,
+				p->prefetch_bandwidth_oto, // to prevent ms/mp mismatch when oto bw > total vactive bw
 				p->excess_vactive_fill_bw_l,
 				p->excess_vactive_fill_bw_c,
 				p->cursor_bw,
@@ -9066,6 +9083,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->ms.VRatioPreC[k];
 				CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWLuma = &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k]; // prefetch_sw_bw_l
 				CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWChroma = &mode_lib->ms.RequiredPrefetchPixelDataBWChroma[k]; // prefetch_sw_bw_c
+				CalculatePrefetchSchedule_params->RequiredPrefetchBWOTO = &mode_lib->ms.RequiredPrefetchBWOTO[k];
 				CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->ms.NoTimeForDynamicMetadata[k];
 				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
 				CalculatePrefetchSchedule_params->Tno_bw_flip = &mode_lib->ms.Tno_bw_flip[k];
@@ -9210,6 +9228,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.vactive_sw_bw_c;
 				calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
 				calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
+				calculate_peak_bandwidth_params->prefetch_bandwidth_oto = mode_lib->ms.RequiredPrefetchBWOTO;
 				calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
 				calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
 				calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
@@ -9376,6 +9395,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.vactive_sw_bw_c;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_oto = mode_lib->ms.RequiredPrefetchBWOTO;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
 			calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
@@ -11292,6 +11312,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->mp.VRatioPrefetchC[k];
 			CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWLuma = &mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k];
 			CalculatePrefetchSchedule_params->RequiredPrefetchPixelDataBWChroma = &mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k];
+			CalculatePrefetchSchedule_params->RequiredPrefetchBWOTO = &s->dummy_single_array[0][k];
 			CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->mp.NotEnoughTimeForDynamicMetadata[k];
 			CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->mp.Tno_bw[k];
 			CalculatePrefetchSchedule_params->Tno_bw_flip = &mode_lib->mp.Tno_bw_flip[k];
@@ -11434,6 +11455,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_oto = s->dummy_single_array[0];
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
 			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
@@ -11566,6 +11588,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_oto = s->dummy_single_array[k];
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->mp.excess_vactive_fill_bw_c;
 			calculate_peak_bandwidth_params->cursor_bw = mode_lib->mp.cursor_bw;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 23c0fca5515fe..b7cb017b59baa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -484,6 +484,8 @@ struct dml2_core_internal_mode_support {
 	double WriteBandwidth[DML2_MAX_PLANES][DML2_MAX_WRITEBACK];
 	double RequiredPrefetchPixelDataBWLuma[DML2_MAX_PLANES];
 	double RequiredPrefetchPixelDataBWChroma[DML2_MAX_PLANES];
+	/* oto bw should also be considered when calculating urgent bw to avoid situations oto/equ mismatches between ms and mp */
+	double RequiredPrefetchBWOTO[DML2_MAX_PLANES];
 	double cursor_bw[DML2_MAX_PLANES];
 	double prefetch_cursor_bw[DML2_MAX_PLANES];
 	double prefetch_vmrow_bw[DML2_MAX_PLANES];
@@ -1381,6 +1383,7 @@ struct dml2_core_shared_get_urgent_bandwidth_required_locals {
 	double vm_row_bw;
 	double flip_and_active_bw;
 	double flip_and_prefetch_bw;
+	double flip_and_prefetch_bw_oto;
 	double active_and_excess_bw;
 };
 
@@ -1792,6 +1795,7 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	double *VRatioPrefetchC;
 	double *RequiredPrefetchPixelDataBWLuma;
 	double *RequiredPrefetchPixelDataBWChroma;
+	double *RequiredPrefetchBWOTO;
 	bool *NotEnoughTimeForDynamicMetadata;
 	double *Tno_bw;
 	double *Tno_bw_flip;
@@ -2025,6 +2029,7 @@ struct dml2_core_calcs_calculate_peak_bandwidth_required_params {
 	double *surface_read_bandwidth_c;
 	double *prefetch_bandwidth_l;
 	double *prefetch_bandwidth_c;
+	double *prefetch_bandwidth_oto;
 	double *excess_vactive_fill_bw_l;
 	double *excess_vactive_fill_bw_c;
 	double *cursor_bw;
-- 
2.39.5

