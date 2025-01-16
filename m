Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE6A13C82
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7256710E998;
	Thu, 16 Jan 2025 14:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iam3uS7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD7A10E993;
 Thu, 16 Jan 2025 14:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5B789A41BC9;
 Thu, 16 Jan 2025 14:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A84C4CED6;
 Thu, 16 Jan 2025 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737038455;
 bh=FZlOafbMVTA45sxqfM2NthYjknMNgjVBiAHaGQgAIWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Iam3uS7jmaS6mMveHumo+vd+ZHke+TolZzhz+MpIrOEbLY5RghhcPaO8NCYKTYaK9
 nmQLSr6054w+DxWFFdJr8GqZTb3VAMKEWhipgnATfyk/eStegfAFUHovSjfKdv6BSj
 4q8CBksgXLprHMRzc8W42hkp2rFZ1cEFkAy5gnWD8N3XY/wmdL1hoValAqQe8pfL1V
 u78cyIFrHnO/kdEEMJ+AM1EeV2p01THdV89G+td39f9yZMgRLg6/P08BdwMLE/lVFL
 eaRF6xGKS63dnRBc/voundMFd+rWO7D+DGtLhiQH7Pdf/TkaPWhxZsGDgV9OrdLQil
 aTJxDjghekdIg==
Date: Thu, 16 Jan 2025 07:40:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: mark static functions noinline_for_stack
Message-ID: <20250116144049.GA1810277@ax162>
References: <20250109053504.2998728-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109053504.2998728-1-tzungbi@kernel.org>
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

Hi Tzung-Bi,

First of all, thanks for the patch!

On Thu, Jan 09, 2025 at 05:35:04AM +0000, Tzung-Bi Shih wrote:
> When compiling allmodconfig (CONFIG_WERROR=y) with clang-19, see the
> following errors:
> 
> .../display/dc/dml2/display_mode_core.c:6268:13: warning: stack frame size (3128) exceeds limit (3072) in 'dml_prefetch_check' [-Wframe-larger-than]
> .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7236:13: warning: stack frame size (3256) exceeds limit (3072) in 'dml_core_mode_support' [-Wframe-larger-than]
> 
> Mark static functions called by dml_prefetch_check() and
> dml_core_mode_support() noinline_for_stack to avoid them become huge
> functions and thus exceed the frame size limit.

So I fixed these particular instances by hiding them when certain
sanitizers are enabled:

https://gitlab.freedesktop.org/agd5f/linux/-/commit/e4479aecf6581af81bc0908575447878d2a07e01

However, there are still reports of the regular 2048 limit being hit
with certain configurations such as LTO (the issue number is somewhat
funny given the situation):

https://github.com/ClangBuiltLinux/linux/issues/2048

So I think it would be a good idea for the AMD folks to consider
applying this patch as well.

> A way to reproduce:
> $ git checkout next-20250107
> $ mkdir build_dir
> $ export PATH=/tmp/llvm-19.1.6-x86_64/bin:$PATH
> $ make LLVM=1 O=build_dir allmodconfig
> $ make LLVM=1 O=build_dir drivers/gpu/drm/ -j
> 
> The way how it chose static functions to mark:
> [0] Unset CONFIG_WERROR in build_dir/.config.
> To get display_mode_core.o without errors.
> 
> [1] Get a function list called by dml_prefetch_check().
> $ sed -n '6268,6711p' drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c \
>   | sed -n -r 's/.*\W(\w+)\(.*/\1/p' | sort -u >/tmp/syms
> 
> [2] Get the non-inline function list.
> Objdump won't show the symbols if they are inline functions.
> 
> $ make LLVM=1 O=build_dir drivers/gpu/drm/ -j
> $ objdump -d build_dir/.../display_mode_core.o | \
>   ./scripts/checkstack.pl x86_64 0 | \
>   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/orig
> 
> [3] Get the full function list.
> Append "-fno-inline" to `CFLAGS_.../display_mode_core.o` in
> drivers/gpu/drm/amd/display/dc/dml2/Makefile.
> 
> $ make LLVM=1 O=build_dir drivers/gpu/drm/ -j
> $ objdump -d build_dir/.../display_mode_core.o | \
>   ./scripts/checkstack.pl x86_64 0 | \
>   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/noinline
> 
> [4] Get the inline function list.
> If a symbol only in /tmp/noinline but not in /tmp/orig, it is a good
> candidate to mark noinline.
> 
> $ diff /tmp/orig /tmp/noinline
> 
> Chosen functions and their stack sizes:
> CalculateBandwidthAvailableForImmediateFlip [display_mode_core.o]:144
> CalculateExtraLatency [display_mode_core.o]:176
> CalculateTWait [display_mode_core.o]:64
> CalculateVActiveBandwithSupport [display_mode_core.o]:112
> set_calculate_prefetch_schedule_params [display_mode_core.o]:48
> 
> CheckGlobalPrefetchAdmissibility [dml2_core_dcn4_calcs.o]:544
> calculate_bandwidth_available [dml2_core_dcn4_calcs.o]:320
> calculate_vactive_det_fill_latency [dml2_core_dcn4_calcs.o]:272
> CalculateDCFCLKDeepSleep [dml2_core_dcn4_calcs.o]:208
> CalculateODMMode [dml2_core_dcn4_calcs.o]:208
> CalculateOutputLink [dml2_core_dcn4_calcs.o]:176
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../gpu/drm/amd/display/dc/dml2/display_mode_core.c  | 12 ++++++------
>  .../dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> index 35bc917631ae..84a2de9a76d4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> @@ -1736,7 +1736,7 @@ static void CalculateBytePerPixelAndBlockSizes(
>  #endif
>  } // CalculateBytePerPixelAndBlockSizes
>  
> -static dml_float_t CalculateTWait(
> +static noinline_for_stack dml_float_t CalculateTWait(
>  		dml_uint_t PrefetchMode,
>  		enum dml_use_mall_for_pstate_change_mode UseMALLForPStateChange,
>  		dml_bool_t SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
> @@ -4458,7 +4458,7 @@ static void CalculateSwathWidth(
>  	}
>  } // CalculateSwathWidth
>  
> -static  dml_float_t CalculateExtraLatency(
> +static noinline_for_stack dml_float_t CalculateExtraLatency(
>  		dml_uint_t RoundTripPingLatencyCycles,
>  		dml_uint_t ReorderingBytes,
>  		dml_float_t DCFCLK,
> @@ -5915,7 +5915,7 @@ static dml_uint_t DSCDelayRequirement(
>  	return DSCDelayRequirement_val;
>  }
>  
> -static dml_bool_t CalculateVActiveBandwithSupport(dml_uint_t NumberOfActiveSurfaces,
> +static noinline_for_stack dml_bool_t CalculateVActiveBandwithSupport(dml_uint_t NumberOfActiveSurfaces,
>  										dml_float_t ReturnBW,
>  										dml_bool_t NotUrgentLatencyHiding[],
>  										dml_float_t ReadBandwidthLuma[],
> @@ -6019,7 +6019,7 @@ static void CalculatePrefetchBandwithSupport(
>  #endif
>  }
>  
> -static dml_float_t CalculateBandwidthAvailableForImmediateFlip(
> +static noinline_for_stack dml_float_t CalculateBandwidthAvailableForImmediateFlip(
>  													dml_uint_t NumberOfActiveSurfaces,
>  													dml_float_t ReturnBW,
>  													dml_float_t ReadBandwidthLuma[],
> @@ -6213,7 +6213,7 @@ static dml_uint_t CalculateMaxVStartup(
>  	return max_vstartup_lines;
>  }
>  
> -static void set_calculate_prefetch_schedule_params(struct display_mode_lib_st *mode_lib,
> +static noinline_for_stack void set_calculate_prefetch_schedule_params(struct display_mode_lib_st *mode_lib,
>  						   struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSchedule_params,
>  						   dml_uint_t j,
>  						   dml_uint_t k)
> @@ -6265,7 +6265,7 @@ static void set_calculate_prefetch_schedule_params(struct display_mode_lib_st *m
>  				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
>  }
>  
> -static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
> +static noinline_for_stack void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
>  {
>  	struct dml_core_mode_support_locals_st *s = &mode_lib->scratch.dml_core_mode_support_locals;
>  	struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> index b9ec243cf9ba..7fffca67ca9d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
> @@ -2778,7 +2778,7 @@ static double dml_get_return_bandwidth_available(
>  	return return_bw_mbps;
>  }
>  
> -static void calculate_bandwidth_available(
> +static noinline_for_stack void calculate_bandwidth_available(
>  	double avg_bandwidth_available_min[dml2_core_internal_soc_state_max],
>  	double avg_bandwidth_available[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max],
>  	double urg_bandwidth_available_min[dml2_core_internal_soc_state_max], // min between SDP and DRAM
> @@ -3531,7 +3531,7 @@ static void CalculateUrgentBurstFactor(
>  
>  }
>  
> -static void CalculateDCFCLKDeepSleep(
> +static noinline_for_stack void CalculateDCFCLKDeepSleep(
>  	const struct dml2_display_cfg *display_cfg,
>  	unsigned int NumberOfActiveSurfaces,
>  	unsigned int BytePerPixelY[],
> @@ -4076,7 +4076,7 @@ static bool ValidateODMMode(enum dml2_odm_mode ODMMode,
>  	return true;
>  }
>  
> -static void CalculateODMMode(
> +static noinline_for_stack void CalculateODMMode(
>  	unsigned int MaximumPixelsPerLinePerDSCUnit,
>  	unsigned int HActive,
>  	enum dml2_output_format_class OutFormat,
> @@ -4173,7 +4173,7 @@ static void CalculateODMMode(
>  #endif
>  }
>  
> -static void CalculateOutputLink(
> +static noinline_for_stack void CalculateOutputLink(
>  	struct dml2_core_internal_scratch *s,
>  	double PHYCLK,
>  	double PHYCLKD18,
> @@ -5928,7 +5928,7 @@ static double calculate_impacted_Tsw(unsigned int exclude_plane_idx, unsigned in
>  }
>  
>  // a global check against the aggregate effect of the per plane prefetch schedule
> -static bool CheckGlobalPrefetchAdmissibility(struct dml2_core_internal_scratch *scratch,
> +static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core_internal_scratch *scratch,
>  											 struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params *p)
>  {
>  	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals *s = &scratch->CheckGlobalPrefetchAdmissibility_locals;
> @@ -6941,7 +6941,7 @@ static void calculate_bytes_to_fetch_required_to_hide_latency(
>  	}
>  }
>  
> -static void calculate_vactive_det_fill_latency(
> +static noinline_for_stack void calculate_vactive_det_fill_latency(
>  		const struct dml2_display_cfg *display_cfg,
>  		unsigned int num_active_planes,
>  		unsigned int bytes_required_l[],
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
