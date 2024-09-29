Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE398978A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 23:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1947910E09C;
	Sun, 29 Sep 2024 21:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="fATAOzOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844BB10E09C;
 Sun, 29 Sep 2024 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=m1PzQTIEDVxxlxs7sA9n4mTcYa9KV3H44lmu6R++yWg=; b=fATAOzObw1YxcJqb
 0Ywwy4Q0OYFN13XBERCkZwgziPtnslqHYxxjLLV/PURP93hCJdvLUnK1NPAlv1rDBDOkQ8fCU9UbO
 xrSlp6okGzQhWk1+q6Mm19hKJj+bpRtMCAaqTsFhNZXkrKbs67ZfG5yhR5qT5O/O495sFJhwKHdzd
 PaWnPEdvw2hxgPAzXBZgqfJ8QPKvSuYTI1PzhIaCDQ/+VpJc7TMWNTPlVTYaFZR8FSXWQwnwJYlMx
 wvnvlvnYOtcknR9KMxj9CnwtmpXQMehkQFmYuxxYnlw3Z3x/JLL4KhAyxvY72K0oChWmdBt65mX0w
 IIc89fLsCJc5LwI0NQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1sv14p-007qty-0J;
 Sun, 29 Sep 2024 21:03:35 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amd/powerplay: Delete unused function and maths library
Date: Sun, 29 Sep 2024 22:03:33 +0100
Message-ID: <20240929210333.304747-1-linux@treblig.org>
X-Mailer: git-send-email 2.46.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

We start with the function 'atomctrl_calculate_voltage_evv_on_sclk'
which has been unused since 2016's commit
e805ed83ba1c ("drm/amd/powerplay: delete useless files.")

Remove it.

It was the last user of the struct ATOM_ASIC_PROFILING_INFO_V3_4
remove it.

It was also the last user of the entire fixed point maths library in
ppevvmath.h.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/include/atombios.h        |  72 ---
 .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.c   | 428 -------------
 .../drm/amd/pm/powerplay/hwmgr/ppatomctrl.h   |   2 -
 .../drm/amd/pm/powerplay/hwmgr/ppevvmath.h    | 561 ------------------
 4 files changed, 1063 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b78360a71bc9..e810366a3c83 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -5432,78 +5432,6 @@ typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_3
   ULONG  ulSDCMargine;
 }ATOM_ASIC_PROFILING_INFO_V3_3;
 
-// for Fiji speed EVV algorithm
-typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_4
-{
-  ATOM_COMMON_TABLE_HEADER         asHeader;
-  ULONG  ulEvvLkgFactor;
-  ULONG  ulBoardCoreTemp;
-  ULONG  ulMaxVddc;
-  ULONG  ulMinVddc;
-  ULONG  ulLoadLineSlop;
-  ULONG  ulLeakageTemp;
-  ULONG  ulLeakageVoltage;
-  EFUSE_LINEAR_FUNC_PARAM sCACm;
-  EFUSE_LINEAR_FUNC_PARAM sCACb;
-  EFUSE_LOGISTIC_FUNC_PARAM sKt_b;
-  EFUSE_LOGISTIC_FUNC_PARAM sKv_m;
-  EFUSE_LOGISTIC_FUNC_PARAM sKv_b;
-  USHORT usLkgEuseIndex;
-  UCHAR  ucLkgEfuseBitLSB;
-  UCHAR  ucLkgEfuseLength;
-  ULONG  ulLkgEncodeLn_MaxDivMin;
-  ULONG  ulLkgEncodeMax;
-  ULONG  ulLkgEncodeMin;
-  ULONG  ulEfuseLogisticAlpha;
-  USHORT usPowerDpm0;
-  USHORT usPowerDpm1;
-  USHORT usPowerDpm2;
-  USHORT usPowerDpm3;
-  USHORT usPowerDpm4;
-  USHORT usPowerDpm5;
-  USHORT usPowerDpm6;
-  USHORT usPowerDpm7;
-  ULONG  ulTdpDerateDPM0;
-  ULONG  ulTdpDerateDPM1;
-  ULONG  ulTdpDerateDPM2;
-  ULONG  ulTdpDerateDPM3;
-  ULONG  ulTdpDerateDPM4;
-  ULONG  ulTdpDerateDPM5;
-  ULONG  ulTdpDerateDPM6;
-  ULONG  ulTdpDerateDPM7;
-  EFUSE_LINEAR_FUNC_PARAM sRoFuse;
-  ULONG  ulEvvDefaultVddc;
-  ULONG  ulEvvNoCalcVddc;
-  USHORT usParamNegFlag;
-  USHORT usSpeed_Model;
-  ULONG  ulSM_A0;
-  ULONG  ulSM_A1;
-  ULONG  ulSM_A2;
-  ULONG  ulSM_A3;
-  ULONG  ulSM_A4;
-  ULONG  ulSM_A5;
-  ULONG  ulSM_A6;
-  ULONG  ulSM_A7;
-  UCHAR  ucSM_A0_sign;
-  UCHAR  ucSM_A1_sign;
-  UCHAR  ucSM_A2_sign;
-  UCHAR  ucSM_A3_sign;
-  UCHAR  ucSM_A4_sign;
-  UCHAR  ucSM_A5_sign;
-  UCHAR  ucSM_A6_sign;
-  UCHAR  ucSM_A7_sign;
-  ULONG ulMargin_RO_a;
-  ULONG ulMargin_RO_b;
-  ULONG ulMargin_RO_c;
-  ULONG ulMargin_fixed;
-  ULONG ulMargin_Fmax_mean;
-  ULONG ulMargin_plat_mean;
-  ULONG ulMargin_Fmax_sigma;
-  ULONG ulMargin_plat_sigma;
-  ULONG ulMargin_DC_sigma;
-  ULONG ulReserved[8];            // Reserved for future ASIC
-}ATOM_ASIC_PROFILING_INFO_V3_4;
-
 // for  Polaris10/Polaris11 speed EVV algorithm
 typedef struct  _ATOM_ASIC_PROFILING_INFO_V3_5
 {
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
index b56298d9da98..fe24219c3bf4 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
@@ -28,7 +28,6 @@
 #include "ppatomctrl.h"
 #include "atombios.h"
 #include "cgs_common.h"
-#include "ppevvmath.h"
 
 #define MEM_ID_MASK           0xff000000
 #define MEM_ID_SHIFT          24
@@ -677,433 +676,6 @@ bool atomctrl_get_pp_assign_pin(
 	return bRet;
 }
 
-int atomctrl_calculate_voltage_evv_on_sclk(
-		struct pp_hwmgr *hwmgr,
-		uint8_t voltage_type,
-		uint32_t sclk,
-		uint16_t virtual_voltage_Id,
-		uint16_t *voltage,
-		uint16_t dpm_level,
-		bool debug)
-{
-	ATOM_ASIC_PROFILING_INFO_V3_4 *getASICProfilingInfo;
-	struct amdgpu_device *adev = hwmgr->adev;
-	EFUSE_LINEAR_FUNC_PARAM sRO_fuse;
-	EFUSE_LINEAR_FUNC_PARAM sCACm_fuse;
-	EFUSE_LINEAR_FUNC_PARAM sCACb_fuse;
-	EFUSE_LOGISTIC_FUNC_PARAM sKt_Beta_fuse;
-	EFUSE_LOGISTIC_FUNC_PARAM sKv_m_fuse;
-	EFUSE_LOGISTIC_FUNC_PARAM sKv_b_fuse;
-	EFUSE_INPUT_PARAMETER sInput_FuseValues;
-	READ_EFUSE_VALUE_PARAMETER sOutput_FuseValues;
-
-	uint32_t ul_RO_fused, ul_CACb_fused, ul_CACm_fused, ul_Kt_Beta_fused, ul_Kv_m_fused, ul_Kv_b_fused;
-	fInt fSM_A0, fSM_A1, fSM_A2, fSM_A3, fSM_A4, fSM_A5, fSM_A6, fSM_A7;
-	fInt fMargin_RO_a, fMargin_RO_b, fMargin_RO_c, fMargin_fixed, fMargin_FMAX_mean, fMargin_Plat_mean, fMargin_FMAX_sigma, fMargin_Plat_sigma, fMargin_DC_sigma;
-	fInt fLkg_FT, repeat;
-	fInt fMicro_FMAX, fMicro_CR, fSigma_FMAX, fSigma_CR, fSigma_DC, fDC_SCLK, fSquared_Sigma_DC, fSquared_Sigma_CR, fSquared_Sigma_FMAX;
-	fInt fRLL_LoadLine, fDerateTDP, fVDDC_base, fA_Term, fC_Term, fB_Term, fRO_DC_margin;
-	fInt fRO_fused, fCACm_fused, fCACb_fused, fKv_m_fused, fKv_b_fused, fKt_Beta_fused, fFT_Lkg_V0NORM;
-	fInt fSclk_margin, fSclk, fEVV_V;
-	fInt fV_min, fV_max, fT_prod, fLKG_Factor, fT_FT, fV_FT, fV_x, fTDP_Power, fTDP_Power_right, fTDP_Power_left, fTDP_Current, fV_NL;
-	uint32_t ul_FT_Lkg_V0NORM;
-	fInt fLn_MaxDivMin, fMin, fAverage, fRange;
-	fInt fRoots[2];
-	fInt fStepSize = GetScaledFraction(625, 100000);
-
-	int result;
-
-	getASICProfilingInfo = (ATOM_ASIC_PROFILING_INFO_V3_4 *)
-			smu_atom_get_data_table(hwmgr->adev,
-					GetIndexIntoMasterTable(DATA, ASIC_ProfilingInfo),
-					NULL, NULL, NULL);
-
-	if (!getASICProfilingInfo)
-		return -1;
-
-	if (getASICProfilingInfo->asHeader.ucTableFormatRevision < 3 ||
-	    (getASICProfilingInfo->asHeader.ucTableFormatRevision == 3 &&
-	     getASICProfilingInfo->asHeader.ucTableContentRevision < 4))
-		return -1;
-
-	/*-----------------------------------------------------------
-	 *GETTING MULTI-STEP PARAMETERS RELATED TO CURRENT DPM LEVEL
-	 *-----------------------------------------------------------
-	 */
-	fRLL_LoadLine = Divide(getASICProfilingInfo->ulLoadLineSlop, 1000);
-
-	switch (dpm_level) {
-	case 1:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM1), 1000);
-		break;
-	case 2:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM2), 1000);
-		break;
-	case 3:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM3), 1000);
-		break;
-	case 4:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM4), 1000);
-		break;
-	case 5:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM5), 1000);
-		break;
-	case 6:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM6), 1000);
-		break;
-	case 7:
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM7), 1000);
-		break;
-	default:
-		pr_err("DPM Level not supported\n");
-		fDerateTDP = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulTdpDerateDPM0), 1000);
-	}
-
-	/*-------------------------
-	 * DECODING FUSE VALUES
-	 * ------------------------
-	 */
-	/*Decode RO_Fused*/
-	sRO_fuse = getASICProfilingInfo->sRoFuse;
-
-	sInput_FuseValues.usEfuseIndex = sRO_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sRO_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sRO_fuse.ucEfuseLength;
-
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	/* Finally, the actual fuse value */
-	ul_RO_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fMin = GetScaledFraction(le32_to_cpu(sRO_fuse.ulEfuseMin), 1);
-	fRange = GetScaledFraction(le32_to_cpu(sRO_fuse.ulEfuseEncodeRange), 1);
-	fRO_fused = fDecodeLinearFuse(ul_RO_fused, fMin, fRange, sRO_fuse.ucEfuseLength);
-
-	sCACm_fuse = getASICProfilingInfo->sCACm;
-
-	sInput_FuseValues.usEfuseIndex = sCACm_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sCACm_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sCACm_fuse.ucEfuseLength;
-
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	ul_CACm_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fMin = GetScaledFraction(le32_to_cpu(sCACm_fuse.ulEfuseMin), 1000);
-	fRange = GetScaledFraction(le32_to_cpu(sCACm_fuse.ulEfuseEncodeRange), 1000);
-
-	fCACm_fused = fDecodeLinearFuse(ul_CACm_fused, fMin, fRange, sCACm_fuse.ucEfuseLength);
-
-	sCACb_fuse = getASICProfilingInfo->sCACb;
-
-	sInput_FuseValues.usEfuseIndex = sCACb_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sCACb_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sCACb_fuse.ucEfuseLength;
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	ul_CACb_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fMin = GetScaledFraction(le32_to_cpu(sCACb_fuse.ulEfuseMin), 1000);
-	fRange = GetScaledFraction(le32_to_cpu(sCACb_fuse.ulEfuseEncodeRange), 1000);
-
-	fCACb_fused = fDecodeLinearFuse(ul_CACb_fused, fMin, fRange, sCACb_fuse.ucEfuseLength);
-
-	sKt_Beta_fuse = getASICProfilingInfo->sKt_b;
-
-	sInput_FuseValues.usEfuseIndex = sKt_Beta_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sKt_Beta_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sKt_Beta_fuse.ucEfuseLength;
-
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	ul_Kt_Beta_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fAverage = GetScaledFraction(le32_to_cpu(sKt_Beta_fuse.ulEfuseEncodeAverage), 1000);
-	fRange = GetScaledFraction(le32_to_cpu(sKt_Beta_fuse.ulEfuseEncodeRange), 1000);
-
-	fKt_Beta_fused = fDecodeLogisticFuse(ul_Kt_Beta_fused,
-			fAverage, fRange, sKt_Beta_fuse.ucEfuseLength);
-
-	sKv_m_fuse = getASICProfilingInfo->sKv_m;
-
-	sInput_FuseValues.usEfuseIndex = sKv_m_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sKv_m_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sKv_m_fuse.ucEfuseLength;
-
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-	if (result)
-		return result;
-
-	ul_Kv_m_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fAverage = GetScaledFraction(le32_to_cpu(sKv_m_fuse.ulEfuseEncodeAverage), 1000);
-	fRange = GetScaledFraction((le32_to_cpu(sKv_m_fuse.ulEfuseEncodeRange) & 0x7fffffff), 1000);
-	fRange = fMultiply(fRange, ConvertToFraction(-1));
-
-	fKv_m_fused = fDecodeLogisticFuse(ul_Kv_m_fused,
-			fAverage, fRange, sKv_m_fuse.ucEfuseLength);
-
-	sKv_b_fuse = getASICProfilingInfo->sKv_b;
-
-	sInput_FuseValues.usEfuseIndex = sKv_b_fuse.usEfuseIndex;
-	sInput_FuseValues.ucBitShift = sKv_b_fuse.ucEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = sKv_b_fuse.ucEfuseLength;
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	ul_Kv_b_fused = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fAverage = GetScaledFraction(le32_to_cpu(sKv_b_fuse.ulEfuseEncodeAverage), 1000);
-	fRange = GetScaledFraction(le32_to_cpu(sKv_b_fuse.ulEfuseEncodeRange), 1000);
-
-	fKv_b_fused = fDecodeLogisticFuse(ul_Kv_b_fused,
-			fAverage, fRange, sKv_b_fuse.ucEfuseLength);
-
-	/* Decoding the Leakage - No special struct container */
-	/*
-	 * usLkgEuseIndex=56
-	 * ucLkgEfuseBitLSB=6
-	 * ucLkgEfuseLength=10
-	 * ulLkgEncodeLn_MaxDivMin=69077
-	 * ulLkgEncodeMax=1000000
-	 * ulLkgEncodeMin=1000
-	 * ulEfuseLogisticAlpha=13
-	 */
-
-	sInput_FuseValues.usEfuseIndex = getASICProfilingInfo->usLkgEuseIndex;
-	sInput_FuseValues.ucBitShift = getASICProfilingInfo->ucLkgEfuseBitLSB;
-	sInput_FuseValues.ucBitLength = getASICProfilingInfo->ucLkgEfuseLength;
-
-	sOutput_FuseValues.sEfuse = sInput_FuseValues;
-
-	result = amdgpu_atom_execute_table(adev->mode_info.atom_context,
-			GetIndexIntoMasterTable(COMMAND, ReadEfuseValue),
-			(uint32_t *)&sOutput_FuseValues, sizeof(sOutput_FuseValues));
-
-	if (result)
-		return result;
-
-	ul_FT_Lkg_V0NORM = le32_to_cpu(sOutput_FuseValues.ulEfuseValue);
-	fLn_MaxDivMin = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulLkgEncodeLn_MaxDivMin), 10000);
-	fMin = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulLkgEncodeMin), 10000);
-
-	fFT_Lkg_V0NORM = fDecodeLeakageID(ul_FT_Lkg_V0NORM,
-			fLn_MaxDivMin, fMin, getASICProfilingInfo->ucLkgEfuseLength);
-	fLkg_FT = fFT_Lkg_V0NORM;
-
-	/*-------------------------------------------
-	 * PART 2 - Grabbing all required values
-	 *-------------------------------------------
-	 */
-	fSM_A0 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A0), 1000000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A0_sign)));
-	fSM_A1 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A1), 1000000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A1_sign)));
-	fSM_A2 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A2), 100000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A2_sign)));
-	fSM_A3 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A3), 1000000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A3_sign)));
-	fSM_A4 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A4), 1000000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A4_sign)));
-	fSM_A5 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A5), 1000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A5_sign)));
-	fSM_A6 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A6), 1000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A6_sign)));
-	fSM_A7 = fMultiply(GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulSM_A7), 1000),
-			ConvertToFraction(uPow(-1, getASICProfilingInfo->ucSM_A7_sign)));
-
-	fMargin_RO_a = ConvertToFraction(le32_to_cpu(getASICProfilingInfo->ulMargin_RO_a));
-	fMargin_RO_b = ConvertToFraction(le32_to_cpu(getASICProfilingInfo->ulMargin_RO_b));
-	fMargin_RO_c = ConvertToFraction(le32_to_cpu(getASICProfilingInfo->ulMargin_RO_c));
-
-	fMargin_fixed = ConvertToFraction(le32_to_cpu(getASICProfilingInfo->ulMargin_fixed));
-
-	fMargin_FMAX_mean = GetScaledFraction(
-		le32_to_cpu(getASICProfilingInfo->ulMargin_Fmax_mean), 10000);
-	fMargin_Plat_mean = GetScaledFraction(
-		le32_to_cpu(getASICProfilingInfo->ulMargin_plat_mean), 10000);
-	fMargin_FMAX_sigma = GetScaledFraction(
-		le32_to_cpu(getASICProfilingInfo->ulMargin_Fmax_sigma), 10000);
-	fMargin_Plat_sigma = GetScaledFraction(
-		le32_to_cpu(getASICProfilingInfo->ulMargin_plat_sigma), 10000);
-
-	fMargin_DC_sigma = GetScaledFraction(
-		le32_to_cpu(getASICProfilingInfo->ulMargin_DC_sigma), 100);
-	fMargin_DC_sigma = fDivide(fMargin_DC_sigma, ConvertToFraction(1000));
-
-	fCACm_fused = fDivide(fCACm_fused, ConvertToFraction(100));
-	fCACb_fused = fDivide(fCACb_fused, ConvertToFraction(100));
-	fKt_Beta_fused = fDivide(fKt_Beta_fused, ConvertToFraction(100));
-	fKv_m_fused =  fNegate(fDivide(fKv_m_fused, ConvertToFraction(100)));
-	fKv_b_fused = fDivide(fKv_b_fused, ConvertToFraction(10));
-
-	fSclk = GetScaledFraction(sclk, 100);
-
-	fV_max = fDivide(GetScaledFraction(
-				 le32_to_cpu(getASICProfilingInfo->ulMaxVddc), 1000), ConvertToFraction(4));
-	fT_prod = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulBoardCoreTemp), 10);
-	fLKG_Factor = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulEvvLkgFactor), 100);
-	fT_FT = GetScaledFraction(le32_to_cpu(getASICProfilingInfo->ulLeakageTemp), 10);
-	fV_FT = fDivide(GetScaledFraction(
-				le32_to_cpu(getASICProfilingInfo->ulLeakageVoltage), 1000), ConvertToFraction(4));
-	fV_min = fDivide(GetScaledFraction(
-				 le32_to_cpu(getASICProfilingInfo->ulMinVddc), 1000), ConvertToFraction(4));
-
-	/*-----------------------
-	 * PART 3
-	 *-----------------------
-	 */
-
-	fA_Term = fAdd(fMargin_RO_a, fAdd(fMultiply(fSM_A4, fSclk), fSM_A5));
-	fB_Term = fAdd(fAdd(fMultiply(fSM_A2, fSclk), fSM_A6), fMargin_RO_b);
-	fC_Term = fAdd(fMargin_RO_c,
-			fAdd(fMultiply(fSM_A0, fLkg_FT),
-			fAdd(fMultiply(fSM_A1, fMultiply(fLkg_FT, fSclk)),
-			fAdd(fMultiply(fSM_A3, fSclk),
-			fSubtract(fSM_A7, fRO_fused)))));
-
-	fVDDC_base = fSubtract(fRO_fused,
-			fSubtract(fMargin_RO_c,
-					fSubtract(fSM_A3, fMultiply(fSM_A1, fSclk))));
-	fVDDC_base = fDivide(fVDDC_base, fAdd(fMultiply(fSM_A0, fSclk), fSM_A2));
-
-	repeat = fSubtract(fVDDC_base,
-			fDivide(fMargin_DC_sigma, ConvertToFraction(1000)));
-
-	fRO_DC_margin = fAdd(fMultiply(fMargin_RO_a,
-			fGetSquare(repeat)),
-			fAdd(fMultiply(fMargin_RO_b, repeat),
-			fMargin_RO_c));
-
-	fDC_SCLK = fSubtract(fRO_fused,
-			fSubtract(fRO_DC_margin,
-			fSubtract(fSM_A3,
-			fMultiply(fSM_A2, repeat))));
-	fDC_SCLK = fDivide(fDC_SCLK, fAdd(fMultiply(fSM_A0, repeat), fSM_A1));
-
-	fSigma_DC = fSubtract(fSclk, fDC_SCLK);
-
-	fMicro_FMAX = fMultiply(fSclk, fMargin_FMAX_mean);
-	fMicro_CR = fMultiply(fSclk, fMargin_Plat_mean);
-	fSigma_FMAX = fMultiply(fSclk, fMargin_FMAX_sigma);
-	fSigma_CR = fMultiply(fSclk, fMargin_Plat_sigma);
-
-	fSquared_Sigma_DC = fGetSquare(fSigma_DC);
-	fSquared_Sigma_CR = fGetSquare(fSigma_CR);
-	fSquared_Sigma_FMAX = fGetSquare(fSigma_FMAX);
-
-	fSclk_margin = fAdd(fMicro_FMAX,
-			fAdd(fMicro_CR,
-			fAdd(fMargin_fixed,
-			fSqrt(fAdd(fSquared_Sigma_FMAX,
-			fAdd(fSquared_Sigma_DC, fSquared_Sigma_CR))))));
-	/*
-	 fA_Term = fSM_A4 * (fSclk + fSclk_margin) + fSM_A5;
-	 fB_Term = fSM_A2 * (fSclk + fSclk_margin) + fSM_A6;
-	 fC_Term = fRO_DC_margin + fSM_A0 * fLkg_FT + fSM_A1 * fLkg_FT * (fSclk + fSclk_margin) + fSM_A3 * (fSclk + fSclk_margin) + fSM_A7 - fRO_fused;
-	 */
-
-	fA_Term = fAdd(fMultiply(fSM_A4, fAdd(fSclk, fSclk_margin)), fSM_A5);
-	fB_Term = fAdd(fMultiply(fSM_A2, fAdd(fSclk, fSclk_margin)), fSM_A6);
-	fC_Term = fAdd(fRO_DC_margin,
-			fAdd(fMultiply(fSM_A0, fLkg_FT),
-			fAdd(fMultiply(fMultiply(fSM_A1, fLkg_FT),
-			fAdd(fSclk, fSclk_margin)),
-			fAdd(fMultiply(fSM_A3,
-			fAdd(fSclk, fSclk_margin)),
-			fSubtract(fSM_A7, fRO_fused)))));
-
-	SolveQuadracticEqn(fA_Term, fB_Term, fC_Term, fRoots);
-
-	if (GreaterThan(fRoots[0], fRoots[1]))
-		fEVV_V = fRoots[1];
-	else
-		fEVV_V = fRoots[0];
-
-	if (GreaterThan(fV_min, fEVV_V))
-		fEVV_V = fV_min;
-	else if (GreaterThan(fEVV_V, fV_max))
-		fEVV_V = fSubtract(fV_max, fStepSize);
-
-	fEVV_V = fRoundUpByStepSize(fEVV_V, fStepSize, 0);
-
-	/*-----------------
-	 * PART 4
-	 *-----------------
-	 */
-
-	fV_x = fV_min;
-
-	while (GreaterThan(fAdd(fV_max, fStepSize), fV_x)) {
-		fTDP_Power_left = fMultiply(fMultiply(fMultiply(fAdd(
-				fMultiply(fCACm_fused, fV_x), fCACb_fused), fSclk),
-				fGetSquare(fV_x)), fDerateTDP);
-
-		fTDP_Power_right = fMultiply(fFT_Lkg_V0NORM, fMultiply(fLKG_Factor,
-				fMultiply(fExponential(fMultiply(fAdd(fMultiply(fKv_m_fused,
-				fT_prod), fKv_b_fused), fV_x)), fV_x)));
-		fTDP_Power_right = fMultiply(fTDP_Power_right, fExponential(fMultiply(
-				fKt_Beta_fused, fT_prod)));
-		fTDP_Power_right = fDivide(fTDP_Power_right, fExponential(fMultiply(
-				fAdd(fMultiply(fKv_m_fused, fT_prod), fKv_b_fused), fV_FT)));
-		fTDP_Power_right = fDivide(fTDP_Power_right, fExponential(fMultiply(
-				fKt_Beta_fused, fT_FT)));
-
-		fTDP_Power = fAdd(fTDP_Power_left, fTDP_Power_right);
-
-		fTDP_Current = fDivide(fTDP_Power, fV_x);
-
-		fV_NL = fAdd(fV_x, fDivide(fMultiply(fTDP_Current, fRLL_LoadLine),
-				ConvertToFraction(10)));
-
-		fV_NL = fRoundUpByStepSize(fV_NL, fStepSize, 0);
-
-		if (GreaterThan(fV_max, fV_NL) &&
-			(GreaterThan(fV_NL, fEVV_V) ||
-			Equal(fV_NL, fEVV_V))) {
-			fV_NL = fMultiply(fV_NL, ConvertToFraction(1000));
-
-			*voltage = (uint16_t)fV_NL.partial.real;
-			break;
-		} else
-			fV_x = fAdd(fV_x, fStepSize);
-	}
-
-	return result;
-}
-
 /**
  * atomctrl_get_voltage_evv_on_sclk: gets voltage via call to ATOM COMMAND table.
  * @hwmgr:              input: pointer to hwManager
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
index 1f987e846628..22b0ac12df97 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.h
@@ -316,8 +316,6 @@ extern int atomctrl_get_engine_pll_dividers_kong(struct pp_hwmgr *hwmgr,
 						 pp_atomctrl_clock_dividers_kong *dividers);
 extern int atomctrl_read_efuse(struct pp_hwmgr *hwmgr, uint16_t start_index,
 		uint16_t end_index, uint32_t *efuse);
-extern int atomctrl_calculate_voltage_evv_on_sclk(struct pp_hwmgr *hwmgr, uint8_t voltage_type,
-		uint32_t sclk, uint16_t virtual_voltage_Id, uint16_t *voltage, uint16_t dpm_level, bool debug);
 extern int atomctrl_get_engine_pll_dividers_ai(struct pp_hwmgr *hwmgr, uint32_t clock_value, pp_atomctrl_clock_dividers_ai *dividers);
 extern int atomctrl_set_ac_timing_ai(struct pp_hwmgr *hwmgr, uint32_t memory_clock,
 								uint8_t level);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
deleted file mode 100644
index 409aeec6baa9..000000000000
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppevvmath.h
+++ /dev/null
@@ -1,561 +0,0 @@
-/*
- * Copyright 2015 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-#include <asm/div64.h>
-
-enum ppevvmath_constants {
-	/* We multiply all original integers with 2^SHIFT_AMOUNT to get the fInt representation */
-	SHIFT_AMOUNT	= 16,
-
-	/* Change this value to change the number of decimal places in the final output - 5 is a good default */
-	PRECISION	=  5,
-
-	SHIFTED_2	= (2 << SHIFT_AMOUNT),
-
-	/* 32767 - Might change in the future */
-	MAX		= (1 << (SHIFT_AMOUNT - 1)) - 1,
-};
-
-/* -------------------------------------------------------------------------------
- * NEW TYPE - fINT
- * -------------------------------------------------------------------------------
- * A variable of type fInt can be accessed in 3 ways using the dot (.) operator
- * fInt A;
- * A.full => The full number as it is. Generally not easy to read
- * A.partial.real => Only the integer portion
- * A.partial.decimal => Only the fractional portion
- */
-typedef union _fInt {
-    int full;
-    struct _partial {
-        unsigned int decimal: SHIFT_AMOUNT; /*Needs to always be unsigned*/
-        int real: 32 - SHIFT_AMOUNT;
-    } partial;
-} fInt;
-
-/* -------------------------------------------------------------------------------
- * Function Declarations
- *  -------------------------------------------------------------------------------
- */
-static fInt ConvertToFraction(int);                       /* Use this to convert an INT to a FINT */
-static fInt Convert_ULONG_ToFraction(uint32_t);           /* Use this to convert an uint32_t to a FINT */
-static fInt GetScaledFraction(int, int);                  /* Use this to convert an INT to a FINT after scaling it by a factor */
-static int ConvertBackToInteger(fInt);                    /* Convert a FINT back to an INT that is scaled by 1000 (i.e. last 3 digits are the decimal digits) */
-
-static fInt fNegate(fInt);                                /* Returns -1 * input fInt value */
-static fInt fAdd (fInt, fInt);                            /* Returns the sum of two fInt numbers */
-static fInt fSubtract (fInt A, fInt B);                   /* Returns A-B - Sometimes easier than Adding negative numbers */
-static fInt fMultiply (fInt, fInt);                       /* Returns the product of two fInt numbers */
-static fInt fDivide (fInt A, fInt B);                     /* Returns A/B */
-static fInt fGetSquare(fInt);                             /* Returns the square of a fInt number */
-static fInt fSqrt(fInt);                                  /* Returns the Square Root of a fInt number */
-
-static int uAbs(int);                                     /* Returns the Absolute value of the Int */
-static int uPow(int base, int exponent);                  /* Returns base^exponent an INT */
-
-static void SolveQuadracticEqn(fInt, fInt, fInt, fInt[]); /* Returns the 2 roots via the array */
-static bool Equal(fInt, fInt);                            /* Returns true if two fInts are equal to each other */
-static bool GreaterThan(fInt A, fInt B);                  /* Returns true if A > B */
-
-static fInt fExponential(fInt exponent);                  /* Can be used to calculate e^exponent */
-static fInt fNaturalLog(fInt value);                      /* Can be used to calculate ln(value) */
-
-/* Fuse decoding functions
- * -------------------------------------------------------------------------------------
- */
-static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_range, uint32_t bitlength);
-static fInt fDecodeLogisticFuse(uint32_t fuse_value, fInt f_average, fInt f_range, uint32_t bitlength);
-static fInt fDecodeLeakageID (uint32_t leakageID_fuse, fInt ln_max_div_min, fInt f_min, uint32_t bitlength);
-
-/* Internal Support Functions - Use these ONLY for testing or adding to internal functions
- * -------------------------------------------------------------------------------------
- * Some of the following functions take two INTs as their input - This is unsafe for a variety of reasons.
- */
-static fInt Divide (int, int);                            /* Divide two INTs and return result as FINT */
-static fInt fNegate(fInt);
-
-static int uGetScaledDecimal (fInt);                      /* Internal function */
-static int GetReal (fInt A);                              /* Internal function */
-
-/* -------------------------------------------------------------------------------------
- * TROUBLESHOOTING INFORMATION
- * -------------------------------------------------------------------------------------
- * 1) ConvertToFraction - InputOutOfRangeException: Only accepts numbers smaller than MAX (default: 32767)
- * 2) fAdd - OutputOutOfRangeException: Output bigger than MAX (default: 32767)
- * 3) fMultiply - OutputOutOfRangeException:
- * 4) fGetSquare - OutputOutOfRangeException:
- * 5) fDivide - DivideByZeroException
- * 6) fSqrt - NegativeSquareRootException: Input cannot be a negative number
- */
-
-/* -------------------------------------------------------------------------------------
- * START OF CODE
- * -------------------------------------------------------------------------------------
- */
-static fInt fExponential(fInt exponent)        /*Can be used to calculate e^exponent*/
-{
-	uint32_t i;
-	bool bNegated = false;
-
-	fInt fPositiveOne = ConvertToFraction(1);
-	fInt fZERO = ConvertToFraction(0);
-
-	fInt lower_bound = Divide(78, 10000);
-	fInt solution = fPositiveOne; /*Starting off with baseline of 1 */
-	fInt error_term;
-
-	static const uint32_t k_array[11] = {55452, 27726, 13863, 6931, 4055, 2231, 1178, 606, 308, 155, 78};
-	static const uint32_t expk_array[11] = {2560000, 160000, 40000, 20000, 15000, 12500, 11250, 10625, 10313, 10156, 10078};
-
-	if (GreaterThan(fZERO, exponent)) {
-		exponent = fNegate(exponent);
-		bNegated = true;
-	}
-
-	while (GreaterThan(exponent, lower_bound)) {
-		for (i = 0; i < 11; i++) {
-			if (GreaterThan(exponent, GetScaledFraction(k_array[i], 10000))) {
-				exponent = fSubtract(exponent, GetScaledFraction(k_array[i], 10000));
-				solution = fMultiply(solution, GetScaledFraction(expk_array[i], 10000));
-			}
-		}
-	}
-
-	error_term = fAdd(fPositiveOne, exponent);
-
-	solution = fMultiply(solution, error_term);
-
-	if (bNegated)
-		solution = fDivide(fPositiveOne, solution);
-
-	return solution;
-}
-
-static fInt fNaturalLog(fInt value)
-{
-	uint32_t i;
-	fInt upper_bound = Divide(8, 1000);
-	fInt fNegativeOne = ConvertToFraction(-1);
-	fInt solution = ConvertToFraction(0); /*Starting off with baseline of 0 */
-	fInt error_term;
-
-	static const uint32_t k_array[10] = {160000, 40000, 20000, 15000, 12500, 11250, 10625, 10313, 10156, 10078};
-	static const uint32_t logk_array[10] = {27726, 13863, 6931, 4055, 2231, 1178, 606, 308, 155, 78};
-
-	while (GreaterThan(fAdd(value, fNegativeOne), upper_bound)) {
-		for (i = 0; i < 10; i++) {
-			if (GreaterThan(value, GetScaledFraction(k_array[i], 10000))) {
-				value = fDivide(value, GetScaledFraction(k_array[i], 10000));
-				solution = fAdd(solution, GetScaledFraction(logk_array[i], 10000));
-			}
-		}
-	}
-
-	error_term = fAdd(fNegativeOne, value);
-
-	return fAdd(solution, error_term);
-}
-
-static fInt fDecodeLinearFuse(uint32_t fuse_value, fInt f_min, fInt f_range, uint32_t bitlength)
-{
-	fInt f_fuse_value = Convert_ULONG_ToFraction(fuse_value);
-	fInt f_bit_max_value = Convert_ULONG_ToFraction((uPow(2, bitlength)) - 1);
-
-	fInt f_decoded_value;
-
-	f_decoded_value = fDivide(f_fuse_value, f_bit_max_value);
-	f_decoded_value = fMultiply(f_decoded_value, f_range);
-	f_decoded_value = fAdd(f_decoded_value, f_min);
-
-	return f_decoded_value;
-}
-
-
-static fInt fDecodeLogisticFuse(uint32_t fuse_value, fInt f_average, fInt f_range, uint32_t bitlength)
-{
-	fInt f_fuse_value = Convert_ULONG_ToFraction(fuse_value);
-	fInt f_bit_max_value = Convert_ULONG_ToFraction((uPow(2, bitlength)) - 1);
-
-	fInt f_CONSTANT_NEG13 = ConvertToFraction(-13);
-	fInt f_CONSTANT1 = ConvertToFraction(1);
-
-	fInt f_decoded_value;
-
-	f_decoded_value = fSubtract(fDivide(f_bit_max_value, f_fuse_value), f_CONSTANT1);
-	f_decoded_value = fNaturalLog(f_decoded_value);
-	f_decoded_value = fMultiply(f_decoded_value, fDivide(f_range, f_CONSTANT_NEG13));
-	f_decoded_value = fAdd(f_decoded_value, f_average);
-
-	return f_decoded_value;
-}
-
-static fInt fDecodeLeakageID (uint32_t leakageID_fuse, fInt ln_max_div_min, fInt f_min, uint32_t bitlength)
-{
-	fInt fLeakage;
-	fInt f_bit_max_value = Convert_ULONG_ToFraction((uPow(2, bitlength)) - 1);
-
-	fLeakage = fMultiply(ln_max_div_min, Convert_ULONG_ToFraction(leakageID_fuse));
-	fLeakage = fDivide(fLeakage, f_bit_max_value);
-	fLeakage = fExponential(fLeakage);
-	fLeakage = fMultiply(fLeakage, f_min);
-
-	return fLeakage;
-}
-
-static fInt ConvertToFraction(int X) /*Add all range checking here. Is it possible to make fInt a private declaration? */
-{
-	fInt temp;
-
-	if (X <= MAX)
-		temp.full = (X << SHIFT_AMOUNT);
-	else
-		temp.full = 0;
-
-	return temp;
-}
-
-static fInt fNegate(fInt X)
-{
-	fInt CONSTANT_NEGONE = ConvertToFraction(-1);
-	return fMultiply(X, CONSTANT_NEGONE);
-}
-
-static fInt Convert_ULONG_ToFraction(uint32_t X)
-{
-	fInt temp;
-
-	if (X <= MAX)
-		temp.full = (X << SHIFT_AMOUNT);
-	else
-		temp.full = 0;
-
-	return temp;
-}
-
-static fInt GetScaledFraction(int X, int factor)
-{
-	int times_shifted, factor_shifted;
-	bool bNEGATED;
-	fInt fValue;
-
-	times_shifted = 0;
-	factor_shifted = 0;
-	bNEGATED = false;
-
-	if (X < 0) {
-		X = -1*X;
-		bNEGATED = true;
-	}
-
-	if (factor < 0) {
-		factor = -1*factor;
-		bNEGATED = !bNEGATED; /*If bNEGATED = true due to X < 0, this will cover the case of negative cancelling negative */
-	}
-
-	if ((X > MAX) || factor > MAX) {
-		if ((X/factor) <= MAX) {
-			while (X > MAX) {
-				X = X >> 1;
-				times_shifted++;
-			}
-
-			while (factor > MAX) {
-				factor = factor >> 1;
-				factor_shifted++;
-			}
-		} else {
-			fValue.full = 0;
-			return fValue;
-		}
-	}
-
-	if (factor == 1)
-		return ConvertToFraction(X);
-
-	fValue = fDivide(ConvertToFraction(X * uPow(-1, bNEGATED)), ConvertToFraction(factor));
-
-	fValue.full = fValue.full << times_shifted;
-	fValue.full = fValue.full >> factor_shifted;
-
-	return fValue;
-}
-
-/* Addition using two fInts */
-static fInt fAdd (fInt X, fInt Y)
-{
-	fInt Sum;
-
-	Sum.full = X.full + Y.full;
-
-	return Sum;
-}
-
-/* Addition using two fInts */
-static fInt fSubtract (fInt X, fInt Y)
-{
-	fInt Difference;
-
-	Difference.full = X.full - Y.full;
-
-	return Difference;
-}
-
-static bool Equal(fInt A, fInt B)
-{
-	if (A.full == B.full)
-		return true;
-	else
-		return false;
-}
-
-static bool GreaterThan(fInt A, fInt B)
-{
-	if (A.full > B.full)
-		return true;
-	else
-		return false;
-}
-
-static fInt fMultiply (fInt X, fInt Y) /* Uses 64-bit integers (int64_t) */
-{
-	fInt Product;
-	int64_t tempProduct;
-
-	/*The following is for a very specific common case: Non-zero number with ONLY fractional portion*/
-	/* TEMPORARILY DISABLED - CAN BE USED TO IMPROVE PRECISION
-	bool X_LessThanOne, Y_LessThanOne;
-
-	X_LessThanOne = (X.partial.real == 0 && X.partial.decimal != 0 && X.full >= 0);
-	Y_LessThanOne = (Y.partial.real == 0 && Y.partial.decimal != 0 && Y.full >= 0);
-
-	if (X_LessThanOne && Y_LessThanOne) {
-		Product.full = X.full * Y.full;
-		return Product
-	}*/
-
-	tempProduct = ((int64_t)X.full) * ((int64_t)Y.full); /*Q(16,16)*Q(16,16) = Q(32, 32) - Might become a negative number! */
-	tempProduct = tempProduct >> 16; /*Remove lagging 16 bits - Will lose some precision from decimal; */
-	Product.full = (int)tempProduct; /*The int64_t will lose the leading 16 bits that were part of the integer portion */
-
-	return Product;
-}
-
-static fInt fDivide (fInt X, fInt Y)
-{
-	fInt fZERO, fQuotient;
-	int64_t longlongX, longlongY;
-
-	fZERO = ConvertToFraction(0);
-
-	if (Equal(Y, fZERO))
-		return fZERO;
-
-	longlongX = (int64_t)X.full;
-	longlongY = (int64_t)Y.full;
-
-	longlongX = longlongX << 16; /*Q(16,16) -> Q(32,32) */
-
-	div64_s64(longlongX, longlongY); /*Q(32,32) divided by Q(16,16) = Q(16,16) Back to original format */
-
-	fQuotient.full = (int)longlongX;
-	return fQuotient;
-}
-
-static int ConvertBackToInteger (fInt A) /*THIS is the function that will be used to check with the Golden settings table*/
-{
-	fInt fullNumber, scaledDecimal, scaledReal;
-
-	scaledReal.full = GetReal(A) * uPow(10, PRECISION-1); /* DOUBLE CHECK THISSSS!!! */
-
-	scaledDecimal.full = uGetScaledDecimal(A);
-
-	fullNumber = fAdd(scaledDecimal, scaledReal);
-
-	return fullNumber.full;
-}
-
-static fInt fGetSquare(fInt A)
-{
-	return fMultiply(A, A);
-}
-
-/* x_new = x_old - (x_old^2 - C) / (2 * x_old) */
-static fInt fSqrt(fInt num)
-{
-	fInt F_divide_Fprime, Fprime;
-	fInt test;
-	fInt twoShifted;
-	int seed, counter, error;
-	fInt x_new, x_old, C, y;
-
-	fInt fZERO = ConvertToFraction(0);
-
-	/* (0 > num) is the same as (num < 0), i.e., num is negative */
-
-	if (GreaterThan(fZERO, num) || Equal(fZERO, num))
-		return fZERO;
-
-	C = num;
-
-	if (num.partial.real > 3000)
-		seed = 60;
-	else if (num.partial.real > 1000)
-		seed = 30;
-	else if (num.partial.real > 100)
-		seed = 10;
-	else
-		seed = 2;
-
-	counter = 0;
-
-	if (Equal(num, fZERO)) /*Square Root of Zero is zero */
-		return fZERO;
-
-	twoShifted = ConvertToFraction(2);
-	x_new = ConvertToFraction(seed);
-
-	do {
-		counter++;
-
-		x_old.full = x_new.full;
-
-		test = fGetSquare(x_old); /*1.75*1.75 is reverting back to 1 when shifted down */
-		y = fSubtract(test, C); /*y = f(x) = x^2 - C; */
-
-		Fprime = fMultiply(twoShifted, x_old);
-		F_divide_Fprime = fDivide(y, Fprime);
-
-		x_new = fSubtract(x_old, F_divide_Fprime);
-
-		error = ConvertBackToInteger(x_new) - ConvertBackToInteger(x_old);
-
-		if (counter > 20) /*20 is already way too many iterations. If we dont have an answer by then, we never will*/
-			return x_new;
-
-	} while (uAbs(error) > 0);
-
-	return x_new;
-}
-
-static void SolveQuadracticEqn(fInt A, fInt B, fInt C, fInt Roots[])
-{
-	fInt *pRoots = &Roots[0];
-	fInt temp, root_first, root_second;
-	fInt f_CONSTANT10, f_CONSTANT100;
-
-	f_CONSTANT100 = ConvertToFraction(100);
-	f_CONSTANT10 = ConvertToFraction(10);
-
-	while (GreaterThan(A, f_CONSTANT100) || GreaterThan(B, f_CONSTANT100) || GreaterThan(C, f_CONSTANT100)) {
-		A = fDivide(A, f_CONSTANT10);
-		B = fDivide(B, f_CONSTANT10);
-		C = fDivide(C, f_CONSTANT10);
-	}
-
-	temp = fMultiply(ConvertToFraction(4), A); /* root = 4*A */
-	temp = fMultiply(temp, C); /* root = 4*A*C */
-	temp = fSubtract(fGetSquare(B), temp); /* root = b^2 - 4AC */
-	temp = fSqrt(temp); /*root = Sqrt (b^2 - 4AC); */
-
-	root_first = fSubtract(fNegate(B), temp); /* b - Sqrt(b^2 - 4AC) */
-	root_second = fAdd(fNegate(B), temp); /* b + Sqrt(b^2 - 4AC) */
-
-	root_first = fDivide(root_first, ConvertToFraction(2)); /* [b +- Sqrt(b^2 - 4AC)]/[2] */
-	root_first = fDivide(root_first, A); /*[b +- Sqrt(b^2 - 4AC)]/[2*A] */
-
-	root_second = fDivide(root_second, ConvertToFraction(2)); /* [b +- Sqrt(b^2 - 4AC)]/[2] */
-	root_second = fDivide(root_second, A); /*[b +- Sqrt(b^2 - 4AC)]/[2*A] */
-
-	*(pRoots + 0) = root_first;
-	*(pRoots + 1) = root_second;
-}
-
-/* -----------------------------------------------------------------------------
- * SUPPORT FUNCTIONS
- * -----------------------------------------------------------------------------
- */
-
-/* Conversion Functions */
-static int GetReal (fInt A)
-{
-	return (A.full >> SHIFT_AMOUNT);
-}
-
-static fInt Divide (int X, int Y)
-{
-	fInt A, B, Quotient;
-
-	A.full = X << SHIFT_AMOUNT;
-	B.full = Y << SHIFT_AMOUNT;
-
-	Quotient = fDivide(A, B);
-
-	return Quotient;
-}
-
-static int uGetScaledDecimal (fInt A) /*Converts the fractional portion to whole integers - Costly function */
-{
-	int dec[PRECISION];
-	int i, scaledDecimal = 0, tmp = A.partial.decimal;
-
-	for (i = 0; i < PRECISION; i++) {
-		dec[i] = tmp / (1 << SHIFT_AMOUNT);
-		tmp = tmp - ((1 << SHIFT_AMOUNT)*dec[i]);
-		tmp *= 10;
-		scaledDecimal = scaledDecimal + dec[i]*uPow(10, PRECISION - 1 - i);
-	}
-
-	return scaledDecimal;
-}
-
-static int uPow(int base, int power)
-{
-	if (power == 0)
-		return 1;
-	else
-		return (base)*uPow(base, power - 1);
-}
-
-static int uAbs(int X)
-{
-	if (X < 0)
-		return (X * -1);
-	else
-		return X;
-}
-
-static fInt fRoundUpByStepSize(fInt A, fInt fStepSize, bool error_term)
-{
-	fInt solution;
-
-	solution = fDivide(A, fStepSize);
-	solution.partial.decimal = 0; /*All fractional digits changes to 0 */
-
-	if (error_term)
-		solution.partial.real += 1; /*Error term of 1 added */
-
-	solution = fMultiply(solution, fStepSize);
-	solution = fAdd(solution, fStepSize);
-
-	return solution;
-}
-
-- 
2.46.2

