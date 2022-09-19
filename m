Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC35BD7A8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166E110E19A;
	Mon, 19 Sep 2022 22:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2FF10E19A;
 Mon, 19 Sep 2022 22:54:58 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MWg416PgFz9sdL;
 Mon, 19 Sep 2022 22:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1663628098; bh=UwpqhM3uzo4Z7LZfC/96nKns/llQWGt2eoOavyjOcGo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xsb3y7U7BUV8ped2cd1qnlcDlrbxpGAGjgfVjX0yVxmmARCgitxmRkFnEb3gMOhrN
 4/Q0HgRe1yp1fziPv1ve/XJry4CBEbIuy0oSVznsAC62kwH7EYxwUImb1vkMKjiL2p
 IxO3LsEjCJoSwq7BzI+KoAYQmeXm3NZxLNJP4BNg=
X-Riseup-User-ID: 1ED4FD7E94B0D3DD8FA76157A0B5B550419F084B492BC02F936D1364BB95C45C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MWg3r5tqGz1y9N;
 Mon, 19 Sep 2022 22:54:48 +0000 (UTC)
Message-ID: <a398f73d-5556-f488-c5e7-8a0784d273be@riseup.net>
Date: Mon, 19 Sep 2022 19:54:45 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: refactor CalculateWriteBackDelay to use
 vba_vars_st ptr
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, aric.cyr@amd.com, Pavle.Kotarac@amd.com,
 Nevenko.Stupar@amd.com, aurabindo.pillai@amd.com, Bing.Guo@amd.com,
 nathan@kernel.org, hamza.mahfooz@amd.com, nicholas.kazlauskas@amd.com,
 agustin.gutierrez@amd.com, mdaenzer@redhat.com, Charlene.Liu@amd.com,
 roman.li@amd.com, Wesley.Chalmers@amd.com, alvin.lee2@amd.com,
 Jun.Lei@amd.com, yang.lee@linux.alibaba.com, Syed.Hassan@amd.com
References: <20220917183744.2526927-1-trix@redhat.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220917183744.2526927-1-trix@redhat.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom

Nice to see this patch coming to the DML! Some small nits inline.

On 9/17/22 15:37, Tom Rix wrote:
> Mimimize the function signature by passing a pointer and an index instead
> of passing several elements of the pointer.
> 
> The dml2x,dml3x families uses the same algorithm.  Remove the duplicates.
> Use dml20_ and dml30_ prefix to distinguish the two variants.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  .../dc/dml/dcn20/display_mode_vba_20.c        |  78 +++---------
>  .../dc/dml/dcn20/display_mode_vba_20v2.c      | 115 ++----------------
>  .../dc/dml/dcn21/display_mode_vba_21.c        | 114 +----------------
>  .../dc/dml/dcn30/display_mode_vba_30.c        |  74 +++--------
>  .../dc/dml/dcn31/display_mode_vba_31.c        |  76 +-----------
>  .../dc/dml/dcn314/display_mode_vba_314.c      |  76 +-----------
>  .../dc/dml/dcn32/display_mode_vba_32.c        |  42 +------
>  .../dc/dml/dcn32/display_mode_vba_util_32.c   |  30 -----
>  .../dc/dml/dcn32/display_mode_vba_util_32.h   |  10 +-
>  9 files changed, 63 insertions(+), 552 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index d3b5b6fedf04..6e9d7e2b5243 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -217,16 +217,8 @@ static void CalculateFlipSchedule(
>  		double *DestinationLinesToRequestRowInImmediateFlip,
>  		double *final_flip_bw,
>  		bool *ImmediateFlipSupportedForPipe);
> -static double CalculateWriteBackDelay(
> -		enum source_format_class WritebackPixelFormat,
> -		double WritebackHRatio,
> -		double WritebackVRatio,
> -		unsigned int WritebackLumaHTaps,
> -		unsigned int WritebackLumaVTaps,
> -		unsigned int WritebackChromaHTaps,
> -		unsigned int WritebackChromaVTaps,
> -		unsigned int WritebackDestinationWidth);
>  
> +double dlm20_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i);

Small typo here: s/dlm/dml

>  static void dml20_DisplayPipeConfiguration(struct display_mode_lib *mode_lib);
>  static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>  		struct display_mode_lib *mode_lib);
> @@ -1085,6 +1077,7 @@ static unsigned int CalculateVMAndRowBytes(
>  static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
>  		struct display_mode_lib *mode_lib)
>  {
> +	struct vba_vars_st *v = &mode_lib->vba;
>  	unsigned int j, k;
>  
>  	mode_lib->vba.WritebackDISPCLK = 0.0;
> @@ -1980,36 +1973,15 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
>  		if (mode_lib->vba.BlendingAndTiming[k] == k) {
>  			if (mode_lib->vba.WritebackEnable[k] == true) {
>  				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] =
> -						mode_lib->vba.WritebackLatency
> -								+ CalculateWriteBackDelay(
> -										mode_lib->vba.WritebackPixelFormat[k],
> -										mode_lib->vba.WritebackHRatio[k],
> -										mode_lib->vba.WritebackVRatio[k],
> -										mode_lib->vba.WritebackLumaHTaps[k],
> -										mode_lib->vba.WritebackLumaVTaps[k],
> -										mode_lib->vba.WritebackChromaHTaps[k],
> -										mode_lib->vba.WritebackChromaVTaps[k],
> -										mode_lib->vba.WritebackDestinationWidth[k])
> -										/ mode_lib->vba.DISPCLK;
> +					mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(v, k) / mode_lib->vba.DISPCLK;
>  			} else
>  				mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
>  			for (j = 0; j < mode_lib->vba.NumberOfActivePlanes; ++j) {
>  				if (mode_lib->vba.BlendingAndTiming[j] == k
>  						&& mode_lib->vba.WritebackEnable[j] == true) {
>  					mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k] =
> -							dml_max(
> -									mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k],
> -									mode_lib->vba.WritebackLatency
> -											+ CalculateWriteBackDelay(
> -													mode_lib->vba.WritebackPixelFormat[j],
> -													mode_lib->vba.WritebackHRatio[j],
> -													mode_lib->vba.WritebackVRatio[j],
> -													mode_lib->vba.WritebackLumaHTaps[j],
> -													mode_lib->vba.WritebackLumaVTaps[j],
> -													mode_lib->vba.WritebackChromaHTaps[j],
> -													mode_lib->vba.WritebackChromaVTaps[j],
> -													mode_lib->vba.WritebackDestinationWidth[j])
> -													/ mode_lib->vba.DISPCLK);
> +							dml_max(mode_lib->vba.WritebackDelay[mode_lib->vba.VoltageLevel][k],
> +								mode_lib->vba.WritebackLatency + dlm20_CalculateWriteBackDelay(v, j) / mode_lib->vba.DISPCLK);
>  				}
>  			}
>  		}

[...]

> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> index ad100658132f..9778effba7a4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> @@ -597,15 +597,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>  		if (mode_lib->vba.BlendingAndTiming[k] == k) {
>  			if (mode_lib->vba.WritebackEnable[k] == true) {
>  				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = mode_lib->vba.WritebackLatency
> -						+ dml32_CalculateWriteBackDelay(
> -								mode_lib->vba.WritebackPixelFormat[k],
> -								mode_lib->vba.WritebackHRatio[k],
> -								mode_lib->vba.WritebackVRatio[k],
> -								mode_lib->vba.WritebackVTaps[k],
> -								mode_lib->vba.WritebackDestinationWidth[k],
> -								mode_lib->vba.WritebackDestinationHeight[k],
> -								mode_lib->vba.WritebackSourceHeight[k],
> -								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK;
> +					+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / mode_lib->vba.DISPCLK;
>  			} else
>  				v->WritebackDelay[mode_lib->vba.VoltageLevel][k] = 0;
>  			for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
> @@ -614,15 +606,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>  					v->WritebackDelay[mode_lib->vba.VoltageLevel][k] =
>  						dml_max(v->WritebackDelay[mode_lib->vba.VoltageLevel][k],
>  						mode_lib->vba.WritebackLatency +
> -						dml32_CalculateWriteBackDelay(
> -								mode_lib->vba.WritebackPixelFormat[j],
> -								mode_lib->vba.WritebackHRatio[j],
> -								mode_lib->vba.WritebackVRatio[j],
> -								mode_lib->vba.WritebackVTaps[j],
> -								mode_lib->vba.WritebackDestinationWidth[j],
> -								mode_lib->vba.WritebackDestinationHeight[j],
> -								mode_lib->vba.WritebackSourceHeight[j],
> -								mode_lib->vba.HTotal[k]) / mode_lib->vba.DISPCLK);
> +							dml30_CalculateWriteBackDelay(v, j, v->HTotal[k]) / mode_lib->vba.DISPCLK);
>  				}
>  			}
>  		}
> @@ -2864,16 +2848,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  					if (mode_lib->vba.WritebackEnable[k] == true) {
>  						mode_lib->vba.WritebackDelayTime[k] =
>  							mode_lib->vba.WritebackLatency
> -						+ dml32_CalculateWriteBackDelay(
> -							mode_lib->vba.WritebackPixelFormat[k],
> -							mode_lib->vba.WritebackHRatio[k],
> -							mode_lib->vba.WritebackVRatio[k],
> -							mode_lib->vba.WritebackVTaps[k],
> -							mode_lib->vba.WritebackDestinationWidth[k],
> -							mode_lib->vba.WritebackDestinationHeight[k],
> -							mode_lib->vba.WritebackSourceHeight[k],
> -							mode_lib->vba.HTotal[k])
> -							/ mode_lib->vba.RequiredDISPCLK[i][j];
> +							+ dml30_CalculateWriteBackDelay(v, k, v->HTotal[k]) / mode_lib->vba.RequiredDISPCLK[i][j];
>  					} else {
>  						mode_lib->vba.WritebackDelayTime[k] = 0.0;
>  					}
> @@ -2883,16 +2858,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  							mode_lib->vba.WritebackDelayTime[k] =
>  								dml_max(mode_lib->vba.WritebackDelayTime[k],
>  									mode_lib->vba.WritebackLatency
> -								+ dml32_CalculateWriteBackDelay(
> -									mode_lib->vba.WritebackPixelFormat[m],
> -									mode_lib->vba.WritebackHRatio[m],
> -									mode_lib->vba.WritebackVRatio[m],
> -									mode_lib->vba.WritebackVTaps[m],
> -									mode_lib->vba.WritebackDestinationWidth[m],
> -									mode_lib->vba.WritebackDestinationHeight[m],
> -									mode_lib->vba.WritebackSourceHeight[m],
> -									mode_lib->vba.HTotal[m]) /
> -									mode_lib->vba.RequiredDISPCLK[i][j]);
> +									+ dml30_CalculateWriteBackDelay(v, m, v->HTotal[m]) / mode_lib->vba.RequiredDISPCLK[i][j]);
>  						}
>  					}
>  				}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> index 5b5b94f1024d..a08de0dc080f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
> @@ -2856,36 +2856,6 @@ void dml32_CalculateDCFCLKDeepSleep(
>  #endif
>  } // CalculateDCFCLKDeepSleep
>  
> -double dml32_CalculateWriteBackDelay(
> -		enum source_format_class WritebackPixelFormat,
> -		double WritebackHRatio,
> -		double WritebackVRatio,
> -		unsigned int WritebackVTaps,
> -		unsigned int         WritebackDestinationWidth,
> -		unsigned int         WritebackDestinationHeight,
> -		unsigned int         WritebackSourceHeight,
> -		unsigned int HTotal)
> -{
> -	double CalculateWriteBackDelay;
> -	double Line_length;
> -	double Output_lines_last_notclamped;
> -	double WritebackVInit;
> -
> -	WritebackVInit = (WritebackVRatio + WritebackVTaps + 1) / 2;
> -	Line_length = dml_max((double) WritebackDestinationWidth,
> -			dml_ceil((double)WritebackDestinationWidth / 6.0, 1.0) * WritebackVTaps);
> -	Output_lines_last_notclamped = WritebackDestinationHeight - 1 -
> -			dml_ceil(((double)WritebackSourceHeight -
> -					(double) WritebackVInit) / (double)WritebackVRatio, 1.0);

The CalculateWriteBackDelay from the DCN30 states:

Output_lines_last_notclamped = WritebackDestinationHeight - 1 -		
	dml_ceil((WritebackSourceHeight -
	WritebackVInit) / WritebackVRatio, 1);

I'm not sure if the behavior on the DCN32 will stay the same without the
casting to double. Maybe AMD engineers will know better, but I would
check if the behavior of the function stays the same. Moreover, on
DCN30, WritebackDestinationWidth, WritebackDestinationHeight, and
WritebackSourceHeight are long, and here they are unsigned int. Again,
I'm not sure how much this can affect the boundary cases, just something
to check.

Best Regards,
- Maíra Canal

> -	if (Output_lines_last_notclamped < 0) {
> -		CalculateWriteBackDelay = 0;
> -	} else {
> -		CalculateWriteBackDelay = Output_lines_last_notclamped * Line_length +
> -				(HTotal - WritebackDestinationWidth) + 80;
> -	}
> -	return CalculateWriteBackDelay;
> -}
> -
>  void dml32_UseMinimumDCFCLK(
>  		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
>  		bool DRRDisplay[],
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
> index 3dbc9cf46aad..017acfe5af2f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.h
> @@ -571,15 +571,7 @@ void dml32_CalculateDCFCLKDeepSleep(
>  		/* Output */
>  		double *DCFClkDeepSleep);
>  
> -double dml32_CalculateWriteBackDelay(
> -		enum source_format_class WritebackPixelFormat,
> -		double WritebackHRatio,
> -		double WritebackVRatio,
> -		unsigned int WritebackVTaps,
> -		unsigned int         WritebackDestinationWidth,
> -		unsigned int         WritebackDestinationHeight,
> -		unsigned int         WritebackSourceHeight,
> -		unsigned int HTotal);
> +double dml30_CalculateWriteBackDelay(struct vba_vars_st *vba, unsigned int i, unsigned int HTotal);
>  
>  void dml32_UseMinimumDCFCLK(
>  		enum dm_use_mall_for_pstate_change_mode UseMALLForPStateChange[],
