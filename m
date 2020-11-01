Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744252A1C85
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 08:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFF86E14C;
	Sun,  1 Nov 2020 07:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE66E14C;
 Sun,  1 Nov 2020 07:13:20 +0000 (UTC)
IronPort-SDR: 9tMwZkG4inv/JC9qyB/46q8Gf0mOUSFcnBf23xVaSa4cvCHjIsRA5oSuHgNA+BikGWpdx1qxnP
 JqzXHMGxfOXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="167991323"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="167991323"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 00:13:19 -0700
IronPort-SDR: UJOdOPw+G+t0NPstfFs3fKf5pMzGoG1KuB8bg6H/t6HMsL51hpjbsM3QxJTtUW3YIoXv6fA7U7
 7ujEEcleCtpg==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537586921"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2020 00:13:17 -0700
Subject: Re: [RFC 11/13] drm/i915: Read DSC capabilities of the HDMI2.1 PCON
 encoder
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-12-ankit.k.nautiyal@intel.com>
 <e4d5cbbd77b94e878c18e7d7f936c215@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <15e94820-05a6-fd3a-7291-38108fbd1497@intel.com>
Date: Sun, 1 Nov 2020 12:43:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <e4d5cbbd77b94e878c18e7d7f936c215@intel.com>
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


On 10/19/2020 5:02 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 11/13] drm/i915: Read DSC capabilities of the HDMI2.1 PCON
>> encoder
>>
>> This patch adds a helper function to read the DSC capabilities of the
>> HDMI2.1 PCon encoder. It also adds a new structure to store these caps, which
>> can then be used to get the PPS parameters for PCON-HDMI2.1 sink pair. Which
>> inturn will be used to take a call to override the existing PPS-metadata, by either
>> writing the entire new PPS metadata, or by writing only the PPS override
>> parameters.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_types.h    |  16 ++
>>   drivers/gpu/drm/i915/display/intel_dp.c       | 178 ++++++++++++++++++
>>   2 files changed, 194 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 6c69922313d6..23282695a47f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1292,6 +1292,21 @@ struct intel_dp_pcon_frl {
>>   int trained_rate_gbps;
>>   };
>>
>> +struct intel_dp_pcon_dsc {
>> +bool enc_support;
>> +bool pps_override_support;
>> +bool blk_prediction_support;
>> +u8 version_major;
>> +u8 version_minor;
>> +u8 color_fmt_mask;
>> +u8 color_depth_mask;
>> +u8 max_slices;;
>> +u8 max_slice_width;
>> +u8 line_buf_bit_depth;
>> +u8 bpp_precision_incr;
>> +int rc_buf_size;
>> +};
>> +
>>   struct intel_dp {
>>   i915_reg_t output_reg;
>>   u32 DP;
>> @@ -1415,6 +1430,7 @@ struct intel_dp {
>>   bool hobl_active;
>>
>>   struct intel_dp_pcon_frl frl;
>> +struct intel_dp_pcon_dsc pcon_dsc;
>>   };
>>
>>   enum lspcon_vendor {
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index e6c4cb844e37..b4f8abaea607 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3882,6 +3882,182 @@ cpt_set_link_train(struct intel_dp *intel_dp,
>>   intel_de_posting_read(dev_priv, intel_dp->output_reg);  }
>>
>> +void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp) {
>> +u8 buf;
>> +u8 rc_buf_blk_size;
>> +u8 max_slices = 0;
>> +
>> +struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>> +struct intel_dp_pcon_dsc *pcon_dsc = &intel_dp->pcon_dsc;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_ENCODER, &buf)
>> < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_ENCODER\n");
>> +return;
>> +}
>> +pcon_dsc->enc_support = buf & DP_PCON_DSC_ENCODER_SUPPORTED;
>> +pcon_dsc->pps_override_support = buf &
>> DP_PCON_DSC_PPS_ENC_OVERRIDE;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_VERSION, &buf)
>> < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_VERSION\n");
>> +return;
> If we fail here or in any of the subsequent calls below shouldn't we reset the dsc params saying DSC not
> supported. Else we may return with ex.
> pcon_dsc->enc_support = buf & DP_PCON_DSC_ENCODER_SUPPORTED
> which would ideally not be right.

You are right, will take care in next patch. If dsc 1.2 is not supported 
we will not configure PCON encode DSC DPCDs.

Also I have realized, we do not use all the information for writing PPS 
parameters.

So aligning with the existing code, will read all the pcon's DSC encoder 
caps and store in intel_dp structure in a u8 array.

Will have drm helper functions to retrieve values like max slices, max 
slice with and bpp precision which need some processing, based on the 
port caps.


>> +}
>> +pcon_dsc->version_major = (buf & DP_PCON_DSC_MAJOR_MASK) >>
>> +  DP_PCON_DSC_MAJOR_SHIFT;
>> +pcon_dsc->version_minor = (buf & DP_PCON_DSC_MINOR_MASK) >>
>> +  DP_PCON_DSC_MINOR_SHIFT;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_RC_BUF_BLK_INFO, &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_RC_BUF_BLK_INFO\n");
>> +return;
>> +}
>> +
>> +switch (buf & DP_PCON_DSC_RC_BUF_BLK_SIZE) {
>> +case DP_PCON_DSC_RC_BUF_BLK_1KB :
>> +rc_buf_blk_size = 1;
>> +break;
>> +case DP_PCON_DSC_RC_BUF_BLK_4KB :
>> +rc_buf_blk_size = 4;.
>> +break;
>> +case DP_PCON_DSC_RC_BUF_BLK_16KB :
>> +rc_buf_blk_size = 16;
>> +break;
>> +case DP_PCON_DSC_RC_BUF_BLK_64KB :
>> +rc_buf_blk_size = 64;
>> +break;
>> +default :
>> +rc_buf_blk_size = 0;
>> +}
> It would be good if you create sub-functions for each of these aspects to make it more readable.

Agreed. As mentioned above will have drm_helper functions for these.


>
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_RC_BUF_SIZE,
>> &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_RC_BUF_SIZE\n");
>> +return;
>> +}
>> +/* storing rc_buf_size in bytes */
>> +pcon_dsc->rc_buf_size = (buf + 1) * rc_buf_blk_size * 1024;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_SLICE_CAP_2,
>> &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_SLICE_CAP_2\n");
>> +return;
>> +}
>> +if (buf & DP_PCON_DSC_24_PER_DSC_ENC)
>> +       max_slices = 24;
>> +else if (buf & DP_PCON_DSC_20_PER_DSC_ENC)
>> +max_slices = 20;
>> +else if (buf & DP_PCON_DSC_16_PER_DSC_ENC)
>> +max_slices = 16;
>> +
>> +if (max_slices == 0) {
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_SLICE_CAP_1,
>> +      &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_SLICE_CAP_2\n");
> Its SLICE_CAP_1.


Agreed, will fix in next version.


>
>> +return;
>> +}
>> +
>> +if (buf & DP_PCON_DSC_12_PER_DSC_ENC)
>> +max_slices = 12;
>> +else if (buf & DP_PCON_DSC_10_PER_DSC_ENC)
>> +max_slices = 10;
>> +else if (buf & DP_PCON_DSC_8_PER_DSC_ENC)
>> +max_slices = 8;
>> +else if (buf & DP_PCON_DSC_6_PER_DSC_ENC)
>> +max_slices = 6;
>> +else if (buf & DP_PCON_DSC_4_PER_DSC_ENC)
>> +max_slices = 4;
>> +else if (buf & DP_PCON_DSC_2_PER_DSC_ENC)
>> +max_slices = 2;
>> +else if (buf & DP_PCON_DSC_1_PER_DSC_ENC)
>> +max_slices = 1;
> Use switch here as well.

Wont be able to use switch here as logical & with different values is 
done. I will make it more compact and readable in next version.

Regards,

Ankit


>> +}
>> +
>> +pcon_dsc->max_slices = max_slices;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_BUF_BIT_DEPTH,
>> &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_BUF_BIT_DEPTH\n");
>> +return;
>> +}
>> +switch (buf & DP_PCON_DSC_BIT_DEPTH_MASK) {
>> +case DP_PCON_DSC_DEPTH_8_BITS :
>> +pcon_dsc->line_buf_bit_depth = 8;
>> +break;
>> +case DP_PCON_DSC_DEPTH_9_BITS :
>> +pcon_dsc->line_buf_bit_depth = 9;
>> +break;
>> +case DP_PCON_DSC_DEPTH_10_BITS :
>> +pcon_dsc->line_buf_bit_depth = 10;
>> +break;
>> +case DP_PCON_DSC_DEPTH_11_BITS :
>> +pcon_dsc->line_buf_bit_depth = 11;
>> +break;
>> +case DP_PCON_DSC_DEPTH_12_BITS :
>> +pcon_dsc->line_buf_bit_depth = 12;
>> +break;
>> +case DP_PCON_DSC_DEPTH_13_BITS :
>> +pcon_dsc->line_buf_bit_depth = 13;
>> +break;
>> +case DP_PCON_DSC_DEPTH_14_BITS :
>> +pcon_dsc->line_buf_bit_depth = 14;
>> +break;
>> +case DP_PCON_DSC_DEPTH_15_BITS :
>> +pcon_dsc->line_buf_bit_depth = 15;
>> +break;
>> +case DP_PCON_DSC_DEPTH_16_BITS :
>> +pcon_dsc->line_buf_bit_depth = 16;
>> +break;
>> +default :
>> +pcon_dsc->line_buf_bit_depth = 0;
>> +}
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_BLOCK_PREDICTION, &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_BLOCK_PREDICTION\n");
>> +return;
>> +}
>> +if (buf && DP_PCON_DSC_BLOCK_PRED_SUPPORT)
>> +pcon_dsc->blk_prediction_support = true;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_ENC_COLOR_FMT_CAP, &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_ENC_COLOR_FMT_CAP\n");
>> +return;
>> +}
>> +pcon_dsc->color_fmt_mask = buf;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_ENC_COLOR_DEPTH_CAP, &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_ENC_COLOR_DEPTH_CAP\n");
>> +return;
>> +}
>> +pcon_dsc->color_depth_mask = buf;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux,
>> DP_PCON_DSC_MAX_SLICE_WIDTH, &buf) < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_MAX_SLICE_WIDTH\n");
>> +return;
>> +}
>> +pcon_dsc->max_slice_width = buf;;
>> +
>> +if (drm_dp_dpcd_readb(&intel_dp->aux, DP_PCON_DSC_BPP_INCR, &buf)
>> < 0) {
>> +drm_err(&i915->drm, "Failed to read
>> DP_PCON_DSC_BPP_INCR\n");
>> +return;
>> +}
>> +switch(buf & DP_PCON_DSC_BPP_INCR_MASK) {
>> +case DP_PCON_DSC_ONE_16TH_BPP:
>> +pcon_dsc->bpp_precision_incr = 16;
>> +break;
>> +case DP_PCON_DSC_ONE_8TH_BPP:
>> +pcon_dsc->bpp_precision_incr = 8;
>> +break;
>> +case DP_PCON_DSC_ONE_4TH_BPP:
>> +pcon_dsc->bpp_precision_incr = 4;
>> +break;
>> +case DP_PCON_DSC_ONE_HALF_BPP:
>> +pcon_dsc->bpp_precision_incr = 2;
>> +break;
>> +case DP_PCON_DSC_ONE_BPP:
>> +pcon_dsc->bpp_precision_incr = 1;
>> +break;
>> +default :
>> +pcon_dsc->bpp_precision_incr = 0;
>> +}
>> +}
>> +
>>   static int intel_dp_get_max_rate_gbps(struct intel_dp *intel_dp)  {
>>   int max_link_clock, max_lanes, max_rate_khz, max_rate_gbps; @@ -
>> 6659,6 +6835,8 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>>       intel_dp->dfp.max_tmds_clock,
>>       intel_dp->dfp.pcon_max_frl,
>>       intel_dp->dfp.sink_max_frl);
>> +
>> +intel_dp_get_pcon_dsc_cap(intel_dp);
>>   }
>>
>>   static void
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
