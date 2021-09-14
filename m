Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A70C40B740
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 20:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA3C6E593;
	Tue, 14 Sep 2021 18:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629C76E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 18:55:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="220226329"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="220226329"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:55:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="508257965"
Received: from lveltman-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.216.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 11:55:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Linus W <linus.walleij@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/15] drm/edid: Use new encoded panel id style for
 quirks matching
In-Reply-To: <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.4.I6103ce2b16e5e5a842b14c7022a034712b434609@changeid>
Date: Tue, 14 Sep 2021 21:55:00 +0300
Message-ID: <871r5r0yyj.fsf@intel.com>
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

On Thu, 09 Sep 2021, Douglas Anderson <dianders@chromium.org> wrote:
> In the patch ("drm/edid: Allow the querying/working with the panel ID
> from the EDID") we introduced a different way of working with the
> panel ID stored in the EDID. Let's use this new way for the quirks
> code.
>
> Advantages of the new style:
> * Smaller data structure size. Saves 4 bytes per panel.
> * Iterate through quirks structure with just "==" instead of strncmp()
> * In-kernel storage is more similar to what's stored in the EDID
>   itself making it easier to grok that they are referring to the same
>   value.
>
> The quirk table itself is arguably a bit less readable in the new
> style but not a ton less and it feels like the above advantages make
> up for it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Eyeballed the edid_quirk_list, but did not check every bit.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
> This commit is only compile-tested. I don't have any DP panels that
> exercise this code. Transition from the old table to the new one was
> done with a regexp.
>
> Changes in v4:
> - ("Use new encoded panel id style for quirks matching") new for v4.
>
>  drivers/gpu/drm/drm_edid.c | 157 +++++++++++++++++--------------------
>  1 file changed, 71 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f84e0dd264f4..9b19eee0e1b4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -100,122 +100,128 @@ struct detailed_mode_closure {
>  #define LEVEL_GTF2	2
>  #define LEVEL_CVT	3
>  
> +#define EDID_QUIRK(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _quirks) \
> +{ \
> +	.panel_id = drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, vend_chr_2, \
> +					     product_id), \
> +	.quirks = _quirks \
> +}
> +
>  static const struct edid_quirk {
> -	char vendor[4];
> -	int product_id;
> +	u32 panel_id;
>  	u32 quirks;
>  } edid_quirk_list[] = {
>  	/* Acer AL1706 */
> -	{ "ACR", 44358, EDID_QUIRK_PREFER_LARGE_60 },
> +	EDID_QUIRK('A', 'C', 'R', 44358, EDID_QUIRK_PREFER_LARGE_60),
>  	/* Acer F51 */
> -	{ "API", 0x7602, EDID_QUIRK_PREFER_LARGE_60 },
> +	EDID_QUIRK('A', 'P', 'I', 0x7602, EDID_QUIRK_PREFER_LARGE_60),
>  
>  	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
> -	{ "AEO", 0, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
> -	{ "BOE", 0x78b, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* CPT panel of Asus UX303LA reports 8 bpc, but is a 6 bpc panel */
> -	{ "CPT", 0x17df, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('C', 'P', 'T', 0x17df, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* SDC panel of Lenovo B50-80 reports 8 bpc, but is a 6 bpc panel */
> -	{ "SDC", 0x3652, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('S', 'D', 'C', 0x3652, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* BOE model 0x0771 reports 8 bpc, but is a 6 bpc panel */
> -	{ "BOE", 0x0771, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('B', 'O', 'E', 0x0771, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* Belinea 10 15 55 */
> -	{ "MAX", 1516, EDID_QUIRK_PREFER_LARGE_60 },
> -	{ "MAX", 0x77e, EDID_QUIRK_PREFER_LARGE_60 },
> +	EDID_QUIRK('M', 'A', 'X', 1516, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('M', 'A', 'X', 0x77e, EDID_QUIRK_PREFER_LARGE_60),
>  
>  	/* Envision Peripherals, Inc. EN-7100e */
> -	{ "EPI", 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH },
> +	EDID_QUIRK('E', 'P', 'I', 59264, EDID_QUIRK_135_CLOCK_TOO_HIGH),
>  	/* Envision EN2028 */
> -	{ "EPI", 8232, EDID_QUIRK_PREFER_LARGE_60 },
> +	EDID_QUIRK('E', 'P', 'I', 8232, EDID_QUIRK_PREFER_LARGE_60),
>  
>  	/* Funai Electronics PM36B */
> -	{ "FCM", 13600, EDID_QUIRK_PREFER_LARGE_75 |
> -	  EDID_QUIRK_DETAILED_IN_CM },
> +	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
> +				       EDID_QUIRK_DETAILED_IN_CM),
>  
>  	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
> -	{ "LGD", 764, EDID_QUIRK_FORCE_10BPC },
> +	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
>  
>  	/* LG Philips LCD LP154W01-A5 */
> -	{ "LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
> -	{ "LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
> +	EDID_QUIRK('L', 'P', 'L', 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
> +	EDID_QUIRK('L', 'P', 'L', 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE),
>  
>  	/* Samsung SyncMaster 205BW.  Note: irony */
> -	{ "SAM", 541, EDID_QUIRK_DETAILED_SYNC_PP },
> +	EDID_QUIRK('S', 'A', 'M', 541, EDID_QUIRK_DETAILED_SYNC_PP),
>  	/* Samsung SyncMaster 22[5-6]BW */
> -	{ "SAM", 596, EDID_QUIRK_PREFER_LARGE_60 },
> -	{ "SAM", 638, EDID_QUIRK_PREFER_LARGE_60 },
> +	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
> +	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
>  
>  	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
> -	{ "SNY", 0x2541, EDID_QUIRK_FORCE_12BPC },
> +	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
>  
>  	/* ViewSonic VA2026w */
> -	{ "VSC", 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING },
> +	EDID_QUIRK('V', 'S', 'C', 5020, EDID_QUIRK_FORCE_REDUCED_BLANKING),
>  
>  	/* Medion MD 30217 PG */
> -	{ "MED", 0x7b8, EDID_QUIRK_PREFER_LARGE_75 },
> +	EDID_QUIRK('M', 'E', 'D', 0x7b8, EDID_QUIRK_PREFER_LARGE_75),
>  
>  	/* Lenovo G50 */
> -	{ "SDC", 18514, EDID_QUIRK_FORCE_6BPC },
> +	EDID_QUIRK('S', 'D', 'C', 18514, EDID_QUIRK_FORCE_6BPC),
>  
>  	/* Panel in Samsung NP700G7A-S01PL notebook reports 6bpc */
> -	{ "SEC", 0xd033, EDID_QUIRK_FORCE_8BPC },
> +	EDID_QUIRK('S', 'E', 'C', 0xd033, EDID_QUIRK_FORCE_8BPC),
>  
>  	/* Rotel RSX-1058 forwards sink's EDID but only does HDMI 1.1*/
> -	{ "ETR", 13896, EDID_QUIRK_FORCE_8BPC },
> +	EDID_QUIRK('E', 'T', 'R', 13896, EDID_QUIRK_FORCE_8BPC),
>  
>  	/* Valve Index Headset */
> -	{ "VLV", 0x91a8, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b0, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b1, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b2, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b3, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b4, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b5, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b6, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b7, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b8, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91b9, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91ba, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91bb, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91bc, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91bd, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91be, EDID_QUIRK_NON_DESKTOP },
> -	{ "VLV", 0x91bf, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('V', 'L', 'V', 0x91a8, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b0, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b1, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b2, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b3, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b4, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b5, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b6, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b7, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b8, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91b9, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91ba, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bb, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bc, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bd, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* HTC Vive and Vive Pro VR Headsets */
> -	{ "HVR", 0xaa01, EDID_QUIRK_NON_DESKTOP },
> -	{ "HVR", 0xaa02, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
> -	{ "OVR", 0x0001, EDID_QUIRK_NON_DESKTOP },
> -	{ "OVR", 0x0003, EDID_QUIRK_NON_DESKTOP },
> -	{ "OVR", 0x0004, EDID_QUIRK_NON_DESKTOP },
> -	{ "OVR", 0x0012, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('O', 'V', 'R', 0x0003, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('O', 'V', 'R', 0x0004, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('O', 'V', 'R', 0x0012, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* Windows Mixed Reality Headsets */
> -	{ "ACR", 0x7fce, EDID_QUIRK_NON_DESKTOP },
> -	{ "HPN", 0x3515, EDID_QUIRK_NON_DESKTOP },
> -	{ "LEN", 0x0408, EDID_QUIRK_NON_DESKTOP },
> -	{ "LEN", 0xb800, EDID_QUIRK_NON_DESKTOP },
> -	{ "FUJ", 0x1970, EDID_QUIRK_NON_DESKTOP },
> -	{ "DEL", 0x7fce, EDID_QUIRK_NON_DESKTOP },
> -	{ "SEC", 0x144a, EDID_QUIRK_NON_DESKTOP },
> -	{ "AUS", 0xc102, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
> +	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* Sony PlayStation VR Headset */
> -	{ "SNY", 0x0704, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* Sensics VR Headsets */
> -	{ "SEN", 0x1019, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('S', 'E', 'N', 0x1019, EDID_QUIRK_NON_DESKTOP),
>  
>  	/* OSVR HDK and HDK2 VR Headsets */
> -	{ "SVR", 0x1019, EDID_QUIRK_NON_DESKTOP },
> +	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
>  };
>  
>  /*
> @@ -2090,9 +2096,8 @@ EXPORT_SYMBOL(drm_get_edid);
>  static u32 edid_extract_panel_id(const struct edid *edid)
>  {
>  	/*
> -	 * In theory we could try to de-obfuscate this like edid_get_quirks()
> -	 * does, but it's easier to just deal with a 32-bit number since then
> -	 * it can be compared with "==".
> +	 * We represent the ID as a 32-bit number so it can easily be compared
> +	 * with "==".
>  	 *
>  	 * NOTE that we deal with endianness differently for the top half
>  	 * of this ID than for the bottom half. The bottom half (the product
> @@ -2197,25 +2202,6 @@ EXPORT_SYMBOL(drm_edid_duplicate);
>  
>  /*** EDID parsing ***/
>  
> -/**
> - * edid_vendor - match a string against EDID's obfuscated vendor field
> - * @edid: EDID to match
> - * @vendor: vendor string
> - *
> - * Returns true if @vendor is in @edid, false otherwise
> - */
> -static bool edid_vendor(const struct edid *edid, const char *vendor)
> -{
> -	char edid_vendor[3];
> -
> -	edid_vendor[0] = ((edid->mfg_id[0] & 0x7c) >> 2) + '@';
> -	edid_vendor[1] = (((edid->mfg_id[0] & 0x3) << 3) |
> -			  ((edid->mfg_id[1] & 0xe0) >> 5)) + '@';
> -	edid_vendor[2] = (edid->mfg_id[1] & 0x1f) + '@';
> -
> -	return !strncmp(edid_vendor, vendor, 3);
> -}
> -
>  /**
>   * edid_get_quirks - return quirk flags for a given EDID
>   * @edid: EDID to process
> @@ -2224,14 +2210,13 @@ static bool edid_vendor(const struct edid *edid, const char *vendor)
>   */
>  static u32 edid_get_quirks(const struct edid *edid)
>  {
> +	u32 panel_id = edid_extract_panel_id(edid);
>  	const struct edid_quirk *quirk;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(edid_quirk_list); i++) {
>  		quirk = &edid_quirk_list[i];
> -
> -		if (edid_vendor(edid, quirk->vendor) &&
> -		    (EDID_PRODUCT_ID(edid) == quirk->product_id))
> +		if (quirk->panel_id == panel_id)
>  			return quirk->quirks;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
