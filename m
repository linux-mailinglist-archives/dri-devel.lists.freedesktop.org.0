Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F92D8C05
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 08:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEEA6E0BA;
	Sun, 13 Dec 2020 07:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724716E0BA;
 Sun, 13 Dec 2020 07:23:30 +0000 (UTC)
IronPort-SDR: H/VZ40ws3wURB29hMTha+2BvzG+OGt2r1xnwuEGr/IWqgxm9kxJslbgrK+Ldos2pnRu9h5jbPo
 Pd8L8jIChk3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9833"; a="153825889"
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="153825889"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:23:30 -0800
IronPort-SDR: dv/eC4IhYkNDNIPmfeE7VPxWMiKsxHVPL2bqqZAsbfEyiTrAoMpHe/O4W/xMKL5zNJqDX9MRoG
 fS74vuQgwunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,415,1599548400"; d="scan'208";a="325771438"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 12 Dec 2020 23:23:29 -0800
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 12 Dec 2020 23:23:28 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 13 Dec 2020 12:53:26 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Sun, 13 Dec 2020 12:53:26 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4 15/16] drm/i915: Let PCON convert from RGB to YUV if it
 can
Thread-Topic: [PATCH v4 15/16] drm/i915: Let PCON convert from RGB to YUV if
 it can
Thread-Index: AQHWzTf4cOhIsbBVEEKUS/53zvTfJKn0phCg
Date: Sun, 13 Dec 2020 07:23:26 +0000
Message-ID: <3e75205fdf02455c98cad1fa81d60d71@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
 <20201208075145.17389-16-ankit.k.nautiyal@intel.com>
In-Reply-To: <20201208075145.17389-16-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Kulkarni,
 Vandita" <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Tuesday, December 8, 2020 1:22 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
> airlied@linux.ie; jani.nikula@linux.intel.com; ville.syrjala@linux.intel.com;
> Kulkarni, Vandita <vandita.kulkarni@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH v4 15/16] drm/i915: Let PCON convert from RGB to YUV if it can

Make it drm/i915/display:

> If PCON has capability to convert RGB->YUV colorspace and also to 444->420
> downsampling then for any YUV420 only mode, we can let the PCON do all the
> conversion.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 37 +++++++++++++------
>  2 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b41de41759a0..4150108bdc6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1460,6 +1460,7 @@ struct intel_dp {
>  		int pcon_max_frl_bw, sink_max_frl_bw;
>  		u8 max_bpc;
>  		bool ycbcr_444_to_420;
> +		bool rgb_to_ycbcr;
>  	} dfp;
> 
>  	/* Display stream compression testing */ diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 30c76ba63232..b3f1190d8150 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -651,6 +651,10 @@ intel_dp_output_format(struct drm_connector
> *connector,
>  	    !drm_mode_is_420_only(info, mode))
>  		return INTEL_OUTPUT_FORMAT_RGB;
> 
> +	if (intel_dp->dfp.rgb_to_ycbcr &&
> +	    intel_dp->dfp.ycbcr_444_to_420)
> +		return INTEL_OUTPUT_FORMAT_RGB;
> +
>  	if (intel_dp->dfp.ycbcr_444_to_420)
>  		return INTEL_OUTPUT_FORMAT_YCBCR444;
>  	else
> @@ -4365,13 +4369,12 @@ void intel_dp_configure_protocol_converter(struct
> intel_dp *intel_dp)
>  			    "Failed to set protocol converter YCbCr 4:2:0
> conversion mode to %s\n",
>  			    enableddisabled(intel_dp->dfp.ycbcr_444_to_420));
> 
> -	tmp = 0;
> -
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_PROTOCOL_CONVERTER_CONTROL_2, tmp) <= 0)
> +	tmp = intel_dp->dfp.rgb_to_ycbcr ?
> +		DP_CONVERSION_BT601_RGB_YCBCR_ENABLE : 0;

There are other combinations also possible like BT709 and BT2020. Handle those as well here.
If no colorspace data is provided we can make BT601 as default, but if user chooses a colorspace
and pcon supports it, then we should go for that option. We can get that info from connector
colorspace properties.


> +	if (drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp) <= 0)
>  		drm_dbg_kms(&i915->drm,
> -			    "Failed to set protocol converter YCbCr 4:2:2
> conversion mode to %s\n",
> -			    enableddisabled(false));
> +			    "Failed to set protocol converter RGB->YCbCr
> conversion mode to %s\n",
> +			    enableddisabled(intel_dp->dfp.rgb_to_ycbcr));
>  }
> 
>  static void intel_enable_dp(struct intel_atomic_state *state, @@ -6897,7
> +6900,7 @@ intel_dp_update_420(struct intel_dp *intel_dp)  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_connector *connector = intel_dp->attached_connector;
> -	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420;
> +	bool is_branch, ycbcr_420_passthrough, ycbcr_444_to_420, rgb_to_ycbcr;
> 
>  	/* No YCbCr output support on gmch platforms */
>  	if (HAS_GMCH(i915))
> @@ -6919,14 +6922,23 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>  		dp_to_dig_port(intel_dp)->lspcon.active ||
>  		drm_dp_downstream_444_to_420_conversion(intel_dp->dpcd,
>  							intel_dp-
> >downstream_ports);
> +	rgb_to_ycbcr = drm_dp_downstream_rgb_to_ycbcr_conversion(intel_dp-
> >dpcd,
> +							intel_dp-
> >downstream_ports);
> 
>  	if (INTEL_GEN(i915) >= 11) {
> +		/* Let PCON convert from RGB->YCbCr if possible */
> +		if (is_branch && rgb_to_ycbcr && ycbcr_444_to_420) {
> +			intel_dp->dfp.rgb_to_ycbcr = true;
> +			intel_dp->dfp.ycbcr_444_to_420 = true;
> +			connector->base.ycbcr_420_allowed = true;
> +		} else {
>  		/* Prefer 4:2:0 passthrough over 4:4:4->4:2:0 conversion */
> -		intel_dp->dfp.ycbcr_444_to_420 =
> -			ycbcr_444_to_420 && !ycbcr_420_passthrough;
> +			intel_dp->dfp.ycbcr_444_to_420 =
> +				ycbcr_444_to_420 && !ycbcr_420_passthrough;
> 
> -		connector->base.ycbcr_420_allowed =
> -			!is_branch || ycbcr_444_to_420 ||
> ycbcr_420_passthrough;
> +			connector->base.ycbcr_420_allowed =
> +				!is_branch || ycbcr_444_to_420 ||
> ycbcr_420_passthrough;
> +		}
>  	} else {
>  		/* 4:4:4->4:2:0 conversion is the only way */
>  		intel_dp->dfp.ycbcr_444_to_420 = ycbcr_444_to_420; @@ -
> 6935,8 +6947,9 @@ intel_dp_update_420(struct intel_dp *intel_dp)
>  	}
> 
>  	drm_dbg_kms(&i915->drm,
> -		    "[CONNECTOR:%d:%s] YCbCr 4:2:0 allowed? %s, YCbCr 4:4:4-
> >4:2:0 conversion? %s\n",
> +		    "[CONNECTOR:%d:%s] RGB->YcbCr conversion? %s, YCbCr 4:2:0
> +allowed? %s, YCbCr 4:4:4->4:2:0 conversion? %s\n",
>  		    connector->base.base.id, connector->base.name,
> +		    yesno(intel_dp->dfp.rgb_to_ycbcr),
>  		    yesno(connector->base.ycbcr_420_allowed),
>  		    yesno(intel_dp->dfp.ycbcr_444_to_420));
>  }
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
