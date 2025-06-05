Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21CACEFF0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5C810E9AB;
	Thu,  5 Jun 2025 13:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RO+37cSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5028210E998;
 Thu,  5 Jun 2025 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749128755; x=1780664755;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=djlRlC9id9IQAIgotfvV+UE/wGOekdAEjLlf+xQIWxs=;
 b=RO+37cSFbWGB43z3oB/qEm6U7s8vaLPBks0oFkbn4zDNbMmdpDiDND75
 DrNcb/T2QRhfj64SngaOAfhiPoCpuGploPx2itG0k4GxuS0Wu4kqkP8JE
 +Pz5hGqByaaEoCq60E4b/g+m91UO69fU1blgD8bP1XLPySFnXcXZeHzoj
 K57KvBsypso7SN5C1bbDj4SDh/uqCJ1BN8fnponfRHuw5cQ43OCLBmj46
 BBp4LVtRnFFLQpSDl/JFtRMwSaJVDdUON077Cy33/V7rI74oiDTwKYyki
 wBgJP/Ns4WJq5992v1+0AQR8EXqgGJdNrhYrEaB47ym9X38DkLwyxUkuM A==;
X-CSE-ConnectionGUID: 8dgN1bXrSE684vXTK7+L8w==
X-CSE-MsgGUID: Sh8Hgfi5Szu29XhQtdl5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68686145"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="68686145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:05:55 -0700
X-CSE-ConnectionGUID: sfcM/iPTRO68pOnjD90Tkg==
X-CSE-MsgGUID: eCZKV1dfRHakJyCbET+O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146479674"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:05:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] drm/edid: Define the quirks in an enum list
In-Reply-To: <20250605082850.65136-3-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-3-imre.deak@intel.com>
Date: Thu, 05 Jun 2025 16:05:50 +0300
Message-ID: <e47dd2badaf16f04912db3c6fc35901baf0a4723@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> An enum list is better suited to define a quirk list, do that. This
> makes looking up a quirk more robust and also allows for separating
> quirks internal to the EDID parser and global quirks which can be
> queried outside of the EDID parser (added as a follow-up).
>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 218 +++++++++++++++++++------------------
>  1 file changed, 112 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 74e77742b2bd4..857ae0c47a1c3 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -66,34 +66,36 @@ static int oui(u8 first, u8 second, u8 third)
>   * on as many displays as possible).
>   */
>  
> -/* First detailed mode wrong, use largest 60Hz mode */
> -#define EDID_QUIRK_PREFER_LARGE_60		(1 << 0)
> -/* Reported 135MHz pixel clock is too high, needs adjustment */
> -#define EDID_QUIRK_135_CLOCK_TOO_HIGH		(1 << 1)
> -/* Prefer the largest mode at 75 Hz */
> -#define EDID_QUIRK_PREFER_LARGE_75		(1 << 2)
> -/* Detail timing is in cm not mm */
> -#define EDID_QUIRK_DETAILED_IN_CM		(1 << 3)
> -/* Detailed timing descriptors have bogus size values, so just take the
> - * maximum size and use that.
> - */
> -#define EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE	(1 << 4)
> -/* use +hsync +vsync for detailed mode */
> -#define EDID_QUIRK_DETAILED_SYNC_PP		(1 << 6)
> -/* Force reduced-blanking timings for detailed modes */
> -#define EDID_QUIRK_FORCE_REDUCED_BLANKING	(1 << 7)
> -/* Force 8bpc */
> -#define EDID_QUIRK_FORCE_8BPC			(1 << 8)
> -/* Force 12bpc */
> -#define EDID_QUIRK_FORCE_12BPC			(1 << 9)
> -/* Force 6bpc */
> -#define EDID_QUIRK_FORCE_6BPC			(1 << 10)
> -/* Force 10bpc */
> -#define EDID_QUIRK_FORCE_10BPC			(1 << 11)
> -/* Non desktop display (i.e. HMD) */
> -#define EDID_QUIRK_NON_DESKTOP			(1 << 12)
> -/* Cap the DSC target bitrate to 15bpp */
> -#define EDID_QUIRK_CAP_DSC_15BPP		(1 << 13)
> +enum drm_edid_internal_quirk {
> +	/* First detailed mode wrong, use largest 60Hz mode */
> +	EDID_QUIRK_PREFER_LARGE_60,
> +	/* Reported 135MHz pixel clock is too high, needs adjustment */
> +	EDID_QUIRK_135_CLOCK_TOO_HIGH,
> +	/* Prefer the largest mode at 75 Hz */
> +	EDID_QUIRK_PREFER_LARGE_75,
> +	/* Detail timing is in cm not mm */
> +	EDID_QUIRK_DETAILED_IN_CM,
> +	/* Detailed timing descriptors have bogus size values, so just take the
> +	 * maximum size and use that.
> +	 */
> +	EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE,
> +	/* use +hsync +vsync for detailed mode */
> +	EDID_QUIRK_DETAILED_SYNC_PP,
> +	/* Force reduced-blanking timings for detailed modes */
> +	EDID_QUIRK_FORCE_REDUCED_BLANKING,
> +	/* Force 8bpc */
> +	EDID_QUIRK_FORCE_8BPC,
> +	/* Force 12bpc */
> +	EDID_QUIRK_FORCE_12BPC,
> +	/* Force 6bpc */
> +	EDID_QUIRK_FORCE_6BPC,
> +	/* Force 10bpc */
> +	EDID_QUIRK_FORCE_10BPC,
> +	/* Non desktop display (i.e. HMD) */
> +	EDID_QUIRK_NON_DESKTOP,
> +	/* Cap the DSC target bitrate to 15bpp */
> +	EDID_QUIRK_CAP_DSC_15BPP,
> +};
>  
>  #define MICROSOFT_IEEE_OUI	0xca125c
>  
> @@ -128,124 +130,124 @@ static const struct edid_quirk {
>  	u32 quirks;
>  } edid_quirk_list[] = {
>  	/* Acer AL1706 */
> -	EDID_QUIRK('A', 'C', 'R', 44358, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('A', 'C', 'R', 44358, BIT(EDID_QUIRK_PREFER_LARGE_60)),
>  	/* Acer F51 */
> -	EDID_QUIRK('A', 'P', 'I', 0x7602, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('A', 'P', 'I', 0x7602, BIT(EDID_QUIRK_PREFER_LARGE_60)),
>  
>  	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
> -	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('A', 'E', 'O', 0, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* BenQ GW2765 */
> -	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
> +	EDID_QUIRK('B', 'N', 'Q', 0x78d6, BIT(EDID_QUIRK_FORCE_8BPC)),
>  
>  	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
> -	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('B', 'O', 'E', 0x78b, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* CPT panel of Asus UX303LA reports 8 bpc, but is a 6 bpc panel */
> -	EDID_QUIRK('C', 'P', 'T', 0x17df, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('C', 'P', 'T', 0x17df, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* SDC panel of Lenovo B50-80 reports 8 bpc, but is a 6 bpc panel */
> -	EDID_QUIRK('S', 'D', 'C', 0x3652, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('S', 'D', 'C', 0x3652, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* BOE model 0x0771 reports 8 bpc, but is a 6 bpc panel */
> -	EDID_QUIRK('B', 'O', 'E', 0x0771, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('B', 'O', 'E', 0x0771, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* Belinea 10 15 55 */
> -	EDID_QUIRK('M', 'A', 'X', 1516, EDID_QUIRK_PREFER_LARGE_60),
> -	EDID_QUIRK('M', 'A', 'X', 0x77e, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('M', 'A', 'X', 1516, BIT(EDID_QUIRK_PREFER_LARGE_60)),
> +	EDID_QUIRK('M', 'A', 'X', 0x77e, BIT(EDID_QUIRK_PREFER_LARGE_60)),
>  
>  	/* Envision Peripherals, Inc. EN-7100e */
> -	EDID_QUIRK('E', 'P', 'I', 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
> +	EDID_QUIRK('E', 'P', 'I', 59264, BIT(EDID_QUIRK_135_CLOCK_TOO_HIGH)),
>  	/* Envision EN2028 */
> -	EDID_QUIRK('E', 'P', 'I', 8232, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('E', 'P', 'I', 8232, BIT(EDID_QUIRK_PREFER_LARGE_60)),
>  
>  	/* Funai Electronics PM36B */
> -	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
> -				       EDID_QUIRK_DETAILED_IN_CM),
> +	EDID_QUIRK('F', 'C', 'M', 13600, BIT(EDID_QUIRK_PREFER_LARGE_75) |
> +					 BIT(EDID_QUIRK_DETAILED_IN_CM)),
>  
>  	/* LG 27GP950 */
> -	EDID_QUIRK('G', 'S', 'M', 0x5bbf, EDID_QUIRK_CAP_DSC_15BPP),
> +	EDID_QUIRK('G', 'S', 'M', 0x5bbf, BIT(EDID_QUIRK_CAP_DSC_15BPP)),
>  
>  	/* LG 27GN950 */
> -	EDID_QUIRK('G', 'S', 'M', 0x5b9a, EDID_QUIRK_CAP_DSC_15BPP),
> +	EDID_QUIRK('G', 'S', 'M', 0x5b9a, BIT(EDID_QUIRK_CAP_DSC_15BPP)),
>  
>  	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
> -	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
> +	EDID_QUIRK('L', 'G', 'D', 764, BIT(EDID_QUIRK_FORCE_10BPC)),
>  
>  	/* LG Philips LCD LP154W01-A5 */
> -	EDID_QUIRK('L', 'P', 'L', 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
> -	EDID_QUIRK('L', 'P', 'L', 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
> +	EDID_QUIRK('L', 'P', 'L', 0, BIT(EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)),
> +	EDID_QUIRK('L', 'P', 'L', 0x2a00, BIT(EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)),
>  
>  	/* Samsung SyncMaster 205BW.  Note: irony */
> -	EDID_QUIRK('S', 'A', 'M', 541, EDID_QUIRK_DETAILED_SYNC_PP),
> +	EDID_QUIRK('S', 'A', 'M', 541, BIT(EDID_QUIRK_DETAILED_SYNC_PP)),
>  	/* Samsung SyncMaster 22[5-6]BW */
> -	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
> -	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('S', 'A', 'M', 596, BIT(EDID_QUIRK_PREFER_LARGE_60)),
> +	EDID_QUIRK('S', 'A', 'M', 638, BIT(EDID_QUIRK_PREFER_LARGE_60)),
>  
>  	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
> -	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
> +	EDID_QUIRK('S', 'N', 'Y', 0x2541, BIT(EDID_QUIRK_FORCE_12BPC)),
>  
>  	/* ViewSonic VA2026w */
> -	EDID_QUIRK('V', 'S', 'C', 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
> +	EDID_QUIRK('V', 'S', 'C', 5020, BIT(EDID_QUIRK_FORCE_REDUCED_BLANKING)),
>  
>  	/* Medion MD 30217 PG */
> -	EDID_QUIRK('M', 'E', 'D', 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
> +	EDID_QUIRK('M', 'E', 'D', 0x7b8, BIT(EDID_QUIRK_PREFER_LARGE_75)),
>  
>  	/* Lenovo G50 */
> -	EDID_QUIRK('S', 'D', 'C', 18514, EDID_QUIRK_FORCE_6BPC),
> +	EDID_QUIRK('S', 'D', 'C', 18514, BIT(EDID_QUIRK_FORCE_6BPC)),
>  
>  	/* Panel in Samsung NP700G7A-S01PL notebook reports 6bpc */
> -	EDID_QUIRK('S', 'E', 'C', 0xd033, EDID_QUIRK_FORCE_8BPC),
> +	EDID_QUIRK('S', 'E', 'C', 0xd033, BIT(EDID_QUIRK_FORCE_8BPC)),
>  
>  	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
> -	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
> +	EDID_QUIRK('E', 'T', 'R', 13896, BIT(EDID_QUIRK_FORCE_8BPC)),
>  
>  	/* Valve Index Headset */
> -	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b1, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b2, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b3, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b4, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b5, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b6, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b7, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b8, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91b9, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91ba, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91bb, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91bc, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91bd, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91a8, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b0, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b1, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b2, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b3, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b4, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b5, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b6, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b7, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b8, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b9, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91ba, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bb, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bc, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bd, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91be, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bf, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* HTC Vive and Vive Pro VR Headsets */
> -	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('H', 'V', 'R', 0xaa01, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('H', 'V', 'R', 0xaa02, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
> -	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('O', 'V', 'R', 0x0003, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('O', 'V', 'R', 0x0004, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('O', 'V', 'R', 0x0012, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('O', 'V', 'R', 0x0001, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('O', 'V', 'R', 0x0003, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('O', 'V', 'R', 0x0004, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('O', 'V', 'R', 0x0012, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* Windows Mixed Reality Headsets */
> -	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('A', 'C', 'R', 0x7fce, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('L', 'E', 'N', 0x0408, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('F', 'U', 'J', 0x1970, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('D', 'E', 'L', 0x7fce, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('S', 'E', 'C', 0x144a, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('A', 'U', 'S', 0xc102, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* Sony PlayStation VR Headset */
> -	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('S', 'N', 'Y', 0x0704, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* Sensics VR Headsets */
> -	EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('S', 'E', 'N', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
>  
>  	/* OSVR HDK and HDK2 VR Headsets */
> -	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
> -	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
> +	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
>  };
>  
>  /*
> @@ -2951,6 +2953,12 @@ static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>  	return 0;
>  }
>  
> +static bool drm_edid_has_internal_quirk(struct drm_connector *connector,
> +					enum drm_edid_internal_quirk quirk)
> +{
> +	return connector->display_info.quirks & BIT(quirk);
> +}
> +
>  #define MODE_SIZE(m) ((m)->hdisplay * (m)->vdisplay)
>  #define MODE_REFRESH_DIFF(c,t) (abs((c) - (t)))
>  
> @@ -2960,7 +2968,6 @@ static u32 edid_get_quirks(const struct drm_edid *drm_edid)
>   */
>  static void edid_fixup_preferred(struct drm_connector *connector)
>  {
> -	const struct drm_display_info *info = &connector->display_info;
>  	struct drm_display_mode *t, *cur_mode, *preferred_mode;
>  	int target_refresh = 0;
>  	int cur_vrefresh, preferred_vrefresh;
> @@ -2968,9 +2975,9 @@ static void edid_fixup_preferred(struct drm_connector *connector)
>  	if (list_empty(&connector->probed_modes))
>  		return;
>  
> -	if (info->quirks & EDID_QUIRK_PREFER_LARGE_60)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_60))
>  		target_refresh = 60;
> -	if (info->quirks & EDID_QUIRK_PREFER_LARGE_75)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_75))
>  		target_refresh = 75;
>  
>  	preferred_mode = list_first_entry(&connector->probed_modes,
> @@ -3474,7 +3481,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  						  const struct drm_edid *drm_edid,
>  						  const struct detailed_timing *timing)
>  {
> -	const struct drm_display_info *info = &connector->display_info;
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *mode;
>  	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
> @@ -3508,7 +3514,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  		return NULL;
>  	}
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_REDUCED_BLANKING) {
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_REDUCED_BLANKING)) {
>  		mode = drm_cvt_mode(dev, hactive, vactive, 60, true, false, false);
>  		if (!mode)
>  			return NULL;
> @@ -3520,7 +3526,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  	if (!mode)
>  		return NULL;
>  
> -	if (info->quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_135_CLOCK_TOO_HIGH))
>  		mode->clock = 1088 * 10;
>  	else
>  		mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
> @@ -3551,7 +3557,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  
>  	drm_mode_do_interlace_quirk(mode, pt);
>  
> -	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_SYNC_PP)) {
>  		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
>  	} else {
>  		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> @@ -3564,12 +3570,12 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
>  	mode->width_mm = pt->width_mm_lo | (pt->width_height_mm_hi & 0xf0) << 4;
>  	mode->height_mm = pt->height_mm_lo | (pt->width_height_mm_hi & 0xf) << 8;
>  
> -	if (info->quirks & EDID_QUIRK_DETAILED_IN_CM) {
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_IN_CM)) {
>  		mode->width_mm *= 10;
>  		mode->height_mm *= 10;
>  	}
>  
> -	if (info->quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE)) {
>  		mode->width_mm = drm_edid->edid->width_cm * 10;
>  		mode->height_mm = drm_edid->edid->height_cm * 10;
>  	}
> @@ -6734,26 +6740,26 @@ static void update_display_info(struct drm_connector *connector,
>  	drm_update_mso(connector, drm_edid);
>  
>  out:
> -	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_NON_DESKTOP)) {
>  		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
>  			    connector->base.id, connector->name,
>  			    info->non_desktop ? " (redundant quirk)" : "");
>  		info->non_desktop = true;
>  	}
>  
> -	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_CAP_DSC_15BPP))
>  		info->max_dsc_bpp = 15;
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_6BPC))
>  		info->bpc = 6;
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_8BPC))
>  		info->bpc = 8;
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_10BPC))
>  		info->bpc = 10;
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_FORCE_12BPC))
>  		info->bpc = 12;
>  
>  	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
> @@ -6918,7 +6924,6 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  static int _drm_edid_connector_add_modes(struct drm_connector *connector,
>  					 const struct drm_edid *drm_edid)
>  {
> -	const struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
>  
>  	if (!drm_edid)
> @@ -6948,7 +6953,8 @@ static int _drm_edid_connector_add_modes(struct drm_connector *connector,
>  	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
>  		num_modes += add_inferred_modes(connector, drm_edid);
>  
> -	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
> +	if (drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_60) ||
> +	    drm_edid_has_internal_quirk(connector, EDID_QUIRK_PREFER_LARGE_75))
>  		edid_fixup_preferred(connector);
>  
>  	return num_modes;

-- 
Jani Nikula, Intel
