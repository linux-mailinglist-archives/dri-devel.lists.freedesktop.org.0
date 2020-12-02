Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACF22CBF30
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EBC6EA36;
	Wed,  2 Dec 2020 14:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3516EA36;
 Wed,  2 Dec 2020 14:13:28 +0000 (UTC)
IronPort-SDR: Pvl829DbYFHM6BxgycVejBvLdoWJP3kck18CM+PBAPq3aMQKg4Yxm6+MyFtHz1k7Zuj2y5ZyO3
 pi2pS9zF1H4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="170454107"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="170454107"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:13:28 -0800
IronPort-SDR: pVt6lMCKT5SdG4SlJomFDZ6QSV8pCLE5nlHMZopwjwuRm98itBaqKrGBxlG+cGAvLXZ8pVZkiS
 6574z85swTNQ==
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="550073263"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.195.118])
 ([10.215.195.118])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:13:23 -0800
Subject: Re: [PATCH v2 12/13] drm/i915: Add helper functions for calculating
 DSC parameters for HDMI2.1
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201101100657.12087-1-ankit.k.nautiyal@intel.com>
 <20201101100657.12087-13-ankit.k.nautiyal@intel.com>
 <db5de0781aa846fc851979e74be415c4@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <0d8864d5-5e61-cee7-98f9-562026782b36@intel.com>
Date: Wed, 2 Dec 2020 19:43:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <db5de0781aa846fc851979e74be415c4@intel.com>
Content-Language: en-US
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
Cc: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uma,

Thanks for the comments and spotting the errors. I agree to most of the 
comments and will address them in the next version.

Please find my responses inline:

On 11/26/2020 1:58 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Sunday, November 1, 2020 3:37 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH v2 12/13] drm/i915: Add helper functions for calculating DSC
>> parameters for HDMI2.1
>>
>> The DP-HDMI2.1 PCON spec provides way for a source to set PPS
>> parameters: slice height, slice width and bits_per_pixel, based on the HDMI2.1
>> sink capabilities. The DSC encoder of the PCON will respect these parameters,
>> while preparing the 128 byte PPS.
>>
>> This patch adds helper functions to calculate these PPS paremeters as per the
>> HDMI2.1 specification.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 181 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_hdmi.h |   7 +
>>   2 files changed, 188 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index f90838bc74fb..6b9b9ea7f9b0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -3438,3 +3438,184 @@ void intel_hdmi_init(struct drm_i915_private
>> *dev_priv,
>>   	dig_port->aux_ch = intel_bios_port_aux_ch(dev_priv, port);
>>   	intel_hdmi_init_connector(dig_port, intel_connector);  }
>> +
>> +int intel_hdmi_dsc_get_slice_height(int vactive) {
>> +	int slice_height;
>> +
>> +	/*
>> +	 * Slice Height determination : HDMI2.1 Section 7.7.5.2
>> +	 * Select smallest slice height >=96, that results in a valid PPS and
>> +	 * requires minimum padding lines required for final slice.
>> +	 *
>> +	 * Assumption : Vactive is even.
>> +	 */
>> +	for (slice_height = 96; slice_height <= vactive; slice_height += 2)
>> +		if (vactive % slice_height == 0)
>> +			return slice_height;
>> +
>> +	return 0;
>> +}
>> +
>> +int
>> +intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>> +			      int src_max_slices, int src_max_slice_width,
>> +			      int hdmi_max_slices, int hdmi_throughput) {
> It would be good to add a comment describing each of the function parameters, this
> will make following code easier.

Alright, I will add documentation here.


>
>> +/* Pixel rates in KPixels/sec */
>> +#define HDMI_DSC_PEAK_PIXEL_RATE		2720000
>> +#define HDMI_DSC_MAX_ENC_THROUGHPUT_0		340000
>> +#define HDMI_DSC_MAX_ENC_THROUGHPUT_1		400000
> It would be good to add a comment to describe what actually this represent.
Agreed will have a comment to describe these macros.
>
>> +#define MAX_HDMI_SLICE_WIDTH			2720
> How this limit is defined, may be mention of the spec details.
Agreed, will provide details in next patch version.
>
>> +	int kslice_adjust;
>> +	int adjusted_clk_khz;
>> +	int min_slices;
>> +	int target_slices;
>> +	int max_throughput; /* max clock freq. in khz per slice */
>> +	int max_slice_width;
>> +	int slice_width;
>> +	int pixel_clock = crtc_state->hw.adjusted_mode.crtc_clock;
>> +
>> +	if (!hdmi_throughput)
>> +		return 0;
>> +
>> +	/*
>> +	 * Slice Width determination : HDMI2.1 Section 7.7.5.1
>> +	 * kslice_adjust factor for 4:2:0 formats is 0.5, where as
>> +	 * for 4:4:4 is 1.0. Multiplying these factors by 10 and later
>> +	 * dividing adjusted clock value by 10.
>> +	 */
>> +	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>> +		kslice_adjust = 5;
>> +	else
>> +		kslice_adjust = 10;
> May be add a note for 422 formats, or fail in that case, not sure if value of 1 holds
> good for 422 as well. If it's 1, then ignore the comment.

You are right, for 422 format correct value is 0.5.

I will set the value of 1 for 444 formats and the else case for 422 and 
420 will be then 0.5

>
>> +
>> +	adjusted_clk_khz = DIV_ROUND_UP(kslice_adjust * pixel_clock, 10);
>> +
>> +	if (adjusted_clk_khz <= HDMI_DSC_PEAK_PIXEL_RATE)
>> +		max_throughput = HDMI_DSC_MAX_ENC_THROUGHPUT_0;
>> +	else
>> +		max_throughput = HDMI_DSC_MAX_ENC_THROUGHPUT_1;
> A comment describing slight details will be good.
Will add the comments in this part in next version.
>
>> +	/*
>> +	 * Taking into account the sink's capability for maximum
>> +	 * clock per slice (in MHz) as read from HF-VSDB.
>> +	 */
>> +	max_throughput = min(max_throughput, hdmi_throughput * 1000);
>> +
>> +	if (!max_throughput)
>> +		return 0;
> hdmi_throughput is already checked for 0, so this is not needed.

Agreed, this is redundant, will get rid of this condition.


>> +	min_slices = DIV_ROUND_UP(adjusted_clk_khz, max_throughput);
>> +	max_slice_width = min(MAX_HDMI_SLICE_WIDTH, src_max_slice_width);
>> +
>> +	/*
>> +	 * Keep on increasing the num of slices/line, starting from min_slices
>> +	 * per line till we get such a number, for which the slice_width is
>> +	 * just less than max_slice_width. The slices/line selected should be
>> +	 * less than or equal to the max horizontal slices that the combination
>> +	 * of PCON encoder and HDMI decoder can support.
>> +	 */
>> +	slice_width = max_slice_width;
>> +
>> +	do {
>> +		if (min_slices <= 1 && src_max_slices >= 1 && hdmi_max_slices
>>> = 1)
>> +		       target_slices = 1;
>> +		else if (min_slices <= 2 && src_max_slices >= 2 &&
>> hdmi_max_slices >= 2)
>> +		       target_slices = 2;
>> +		else if (min_slices <= 4 && src_max_slices >= 4 &&
>> hdmi_max_slices >= 4)
>> +		       target_slices = 4;
>> +		else if (min_slices <= 8 && src_max_slices >= 8 &&
>> hdmi_max_slices >= 8)
>> +		       target_slices = 8;
>> +		else if (min_slices <= 12 && src_max_slices >= 12 &&
>> hdmi_max_slices >= 12)
>> +		       target_slices = 12;
>> +		else if (min_slices <= 16 && src_max_slices >= 16 &&
>> hdmi_max_slices >= 16)
>> +		       target_slices = 16;
>> +		else
>> +			return 0;
>> +
>> +		slice_width = DIV_ROUND_UP(crtc_state-
>>> hw.adjusted_mode.hdisplay, target_slices);
>> +		if (slice_width >= max_slice_width)
>> +			min_slices = target_slices + 1;
>> +	} while (slice_width >= max_slice_width);
>> +
>> +	return target_slices;
>> +}
>> +
>> +int
>> +intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
>> +		       int output_format, bool hdmi_all_bpp,
>> +		       int hdmi_max_chunk_bytes)
> Describe the parameters here as well.
Will add the documentation for the function in next version.
>
>> +{
>> +	int max_dsc_bpp, min_dsc_bpp;
>> +	int target_bytes;
>> +	bool bpp_found = false;
>> +	int bpp_decrement_x16;
>> +	int bpp_target;
>> +	int bpp_target_x16;
>> +
>> +	/*
>> +	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
>> +	 * Start with the max bpp and keep on decrementing with
>> +	 * fractional bpp, if supported by PCON DSC encoder
>> +	 *
>> +	 * for each bpp we check if no of bytes can be supported by HDMI sink
>> +	 */
>> +
>> +	/* Assuming: bpc as 8*/
>> +	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
>> +		min_dsc_bpp = 6;
>> +		max_dsc_bpp = 3 * 4; /* 3*bpc/2 */
>> +	} else {
>> +		min_dsc_bpp = 8;
>> +		max_dsc_bpp = 3 * 8; /* 3*bpc */
>> +	}
> May be add a note for 422 formats, or fail in that case. I guess 8 and 24 will work
> for RGB and 422 will have different values. Please check and fix this.

Alright, will have a separate condition for 444 format and 420 format.

The 422 format will be then in else case.

>
>> +
>> +	/*
>> +	 * Taking into account if all dsc_all_bpp supported by HDMI2.1 sink
>> +	 * Section 7.7.34 : Source shall not enable compressed Video
>> +	 * Transport with bpp_target settings above 12 bpp unless
>> +	 * DSC_all_bpp is set to 1.
>> +	 */
>> +	if (!hdmi_all_bpp)
>> +		max_dsc_bpp = min(max_dsc_bpp, 12);
>> +
>> +	/*
>> +	 * The Sink has a limit of compressed data in bytes for a scanline,
>> +	 * as described in max_chunk_bytes field in HFVSDB block of edid.
>> +	 * The no. of bytes depend on the target bits per pixel that the
>> +	 * source configures. So we start with the max_bpp and calculate
>> +	 * the target_chunk_bytes. We keep on decrementing the target_bpp,
>> +	 * till we get the target_chunk_bytes just less than what the sink's
>> +	 * max_chunk_bytes, or else till we reach the min_dsc_bpp.
>> +	 *
>> +	 * The decrement is according to the fractional support from PCON DSC
>> +	 * encoder. For fractional BPP we use bpp_target as a multiple of 16.
>> +	 *
>> +	 * bpp_target_x16 = bpp_target * 16
>> +	 * So we need to decrement by {1, 2, 4, 8, 16} for fractional bpps
>> +	 * {1/16, 1/8, 1/4, 1/2, 1} respectively.
>> +	 */
>> +
>> +	bpp_target = max_dsc_bpp;
>> +	if (src_fractional_bpp)
> I think you missed a ! here


Thanks for catching that. Will fix in the next version.

>
>> +		return 0;
>> +	bpp_decrement_x16 = DIV_ROUND_UP(16, src_fractional_bpp);
>> +	bpp_target_x16 = (bpp_target * 16) - bpp_decrement_x16;
>> +
>> +	while (bpp_target_x16 > (min_dsc_bpp * 16)) {
>> +		int bpp;
>> +
>> +		bpp = DIV_ROUND_UP(bpp_target_x16, 16);
>> +		target_bytes = num_slices * slice_width * DIV_ROUND_UP(bpp,
>> 8);
>> +		if (target_bytes <= hdmi_max_chunk_bytes) {
>> +			bpp_found = true;
>> +			break;
>> +		}
>> +		bpp_target_x16 -= bpp_decrement_x16;
> Not sure on the overall calculation on this part, but if this works then I am good. Please confirm the
> same with actual bpp values computed and validate.

The value for bpp was seen to be around 10-12bpp for with TGL platform 
with for 8k resolutions with one of the DSC1.2 panel for 8k modes.

>> +	}
>> +	if (bpp_found)
>> +		return bpp_target_x16;
> I think we should divide by 16 and return. Isn't it ?

The values expected to be written in PPS parameter register are x16 so I 
am directly returning this value.

Thanks & Regards,

Ankit


>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> index 15eb0ccde76e..fa1a9b030850 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> @@ -50,5 +50,12 @@ bool intel_hdmi_limited_color_range(const struct
>> intel_crtc_state *crtc_state,
>>   				    const struct drm_connector_state
>> *conn_state);  bool intel_hdmi_deep_color_possible(const struct intel_crtc_state
>> *crtc_state, int bpc,
>>   				    bool has_hdmi_sink, bool ycbcr420_output);
>> +int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
>> +			   int num_slices, int output_format, bool hdmi_all_bpp,
>> +			   int hdmi_max_chunk_bytes);
>> +int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>> +				  int src_max_slices, int src_max_slice_width,
>> +				  int hdmi_max_slices, int hdmi_throughput); int
>> +intel_hdmi_dsc_get_slice_height(int vactive);
>>
>>   #endif /* __INTEL_HDMI_H__ */
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
