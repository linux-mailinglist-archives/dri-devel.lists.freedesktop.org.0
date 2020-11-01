Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18E2A1C62
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 07:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4A6E288;
	Sun,  1 Nov 2020 06:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF136E222;
 Sun,  1 Nov 2020 06:01:09 +0000 (UTC)
IronPort-SDR: Ym5c2Y5d7OhO4zGgSgD7Ei6UQTEbgepgaMdhW/DQQtWat5wJeTBxxZS8vOy4Ut4vOjNYgTYSh2
 rIq/jn3v7LIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9791"; a="148054353"
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="148054353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:01:09 -0700
IronPort-SDR: tp2MztPSkGgyC0/Zq7SPvSPDrP4DV0RFghxh4kSz1UQTMrpO73Trcuz/P+hCUOwDVxFKQfy3am
 0NfOLiGfOGeQ==
X-IronPort-AV: E=Sophos;i="5.77,440,1596524400"; d="scan'208";a="537570319"
Received: from aknautiy-mobl.gar.corp.intel.com (HELO [10.215.177.133])
 ([10.215.177.133])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2020 23:01:06 -0700
Subject: Re: [RFC 05/13] drm/i915: Add support for starting FRL training for
 HDMI2.1 via PCON
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
 <20201015105259.27934-6-ankit.k.nautiyal@intel.com>
 <55c73a5c117e436eaab0f8d4ff806de0@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <9cb1135d-56ef-2d00-e33d-2904e8a84a29@intel.com>
Date: Sun, 1 Nov 2020 11:31:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <55c73a5c117e436eaab0f8d4ff806de0@intel.com>
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


On 10/19/2020 3:44 AM, Shankar, Uma wrote:
>
>> -----Original Message-----
>> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
>> Sent: Thursday, October 15, 2020 4:23 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Shankar, Uma <uma.shankar@intel.com>;
>> Kulkarni, Vandita <vandita.kulkarni@intel.com>; ville.syrjala@linux.intel.com;
>> Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [RFC 05/13] drm/i915: Add support for starting FRL training for HDMI2.1
>> via PCON
>>
>> This patch adds functions to start FRL training for an HDMI2.1 sink, connected via
>> a PCON as a DP branch device.
>> This patch also adds a new structure for storing frl training related data, when
>> FRL training is completed.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_types.h    |   7 +
>>   drivers/gpu/drm/i915/display/intel_dp.c       | 200 ++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
>>   3 files changed, 209 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index e2f58d0575a2..6c69922313d6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1287,6 +1287,11 @@ struct intel_dp_compliance {
>>   u8 test_lane_count;
>>   };
>>
>> +struct intel_dp_pcon_frl {
>> +bool is_trained;
>> +int trained_rate_gbps;
>> +};
>> +
>>   struct intel_dp {
>>   i915_reg_t output_reg;
>>   u32 DP;
>> @@ -1408,6 +1413,8 @@ struct intel_dp {
>>
>>   bool hobl_failed;
>>   bool hobl_active;
>> +
>> +struct intel_dp_pcon_frl frl;
>>   };
>>
>>   enum lspcon_vendor {
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index cd6934f28f32..c1342b5e7781 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -2885,6 +2885,9 @@ static void intel_dp_prepare(struct intel_encoder
>> *encoder,
>>   intel_dp->DP |= DP_PIPE_SEL_CHV(crtc->pipe);
>>   else
>>   intel_dp->DP |= DP_PIPE_SEL(crtc->pipe);
>> +
>> +intel_dp->frl.is_trained = false;
>> +intel_dp->frl.trained_rate_gbps = 0;
>>   }
>>   }
>>
>> @@ -3781,6 +3784,9 @@ static void intel_disable_dp(struct intel_atomic_state
>> *state,
>>   intel_edp_backlight_off(old_conn_state);
>>   intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_OFF);
>>   intel_edp_panel_off(intel_dp);
>> +
>> +intel_dp->frl.is_trained = false;
>> +intel_dp->frl.trained_rate_gbps = 0;
>>   }
>>
>>   static void g4x_disable_dp(struct intel_atomic_state *state, @@ -3876,6
>> +3882,200 @@ cpt_set_link_train(struct intel_dp *intel_dp,
>>   intel_de_posting_read(dev_priv, intel_dp->output_reg);  }
>>
>> +static int intel_dp_get_max_rate_gbps(struct intel_dp *intel_dp) {
>> +int max_link_clock, max_lanes, max_rate_khz, max_rate_gbps;
>> +
>> +max_link_clock = intel_dp_max_link_rate(intel_dp);
>> +max_lanes = intel_dp_max_lane_count(intel_dp);
>> +max_rate_khz = intel_dp_max_data_rate(max_link_clock, max_lanes);
>> +max_rate_gbps = 8 * DIV_ROUND_UP(max_rate_khz, 1000000);
>> +
>> +return max_rate_gbps;
>> +}
>> +
>> +static int intel_dp_pcon_get_frl_mask(u8 frl_bw_mask) {
>> +int bw_gbps[] = {9, 18, 24, 32, 40, 48};
>> +int i;
>> +
>> +for (i = ARRAY_SIZE(bw_gbps) - 1; i >= 0; i--) {
>> +if (frl_bw_mask & (1 << i))
>> +return bw_gbps[i];
>> +}
>> +return 0;
>> +}
>> +
>> +static int intel_dp_pcon_set_frl_mask(int max_frl) {
>> +int max_frl_mask = 0;
>> +
>> +switch (max_frl) {
>> +case 48:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_48GBPS;
> Just say it as return DP_PCON_FRL_BW_MASK_48GBPS.
> Do it universally.


Makes sense. Will change this in next version.

>
>> +break;
>> +case 40:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_40GBPS;
>> +break;
>> +case 32:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_32GBPS;
>> +break;
>> +case 24:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_24GBPS;
>> +break;
>> +case 18:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_18GBPS;
>> +break;
>> +case 9:
>> +max_frl_mask |= DP_PCON_FRL_BW_MASK_9GBPS;
>> +break;
>> +default:
>> +max_frl_mask = 0;
>> +}
>> +
>> +return max_frl_mask;
>> +}
>> +
>> +static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp) {
>> +struct intel_connector *intel_connector = intel_dp->attached_connector;
>> +struct drm_connector *connector = &intel_connector->base;
>> +
>> +return (connector->display_info.hdmi.max_frl_rate_per_lane *
>> +connector->display_info.hdmi.max_lanes);
>> +}
>> +
>> +static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
>> +{ #define PCON_EXTENDED_TRAIN_MODE true#define
>> PCON_CONCURRENT_MODE
>> +true #define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE #define
>> +PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE #define
> Don't use true instead 1 < 0 as true is not the right thing to be used here.


Alright. I think you mean to use (1 > 0) as true here.

Will use (1 > 0) instead of true in the macro.

>
>> +TIMEOUT_FRL_READY_MS 500 #define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
>> +
>> +struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>> +int max_frl, max_pcon_frl, max_sink_frl, max_rate_gbps, max_frl_edid,
>> ret;
>> +u8 max_frl_mask = 0, frl_trained_mask;
>> +bool is_active;
>> +
>> +ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
>> +if (ret < 0)
>> +return ret;
>> +
>> +max_rate_gbps = intel_dp_get_max_rate_gbps(intel_dp);
>> +drm_dbg(&i915->drm, "Source max rate = %d Gbps\n", max_rate_gbps);
>> +
>> +max_pcon_frl = intel_dp->dfp.pcon_max_frl;
> Append it with rate or bw.


Agreed, will be using it in the next version.

>
>> +drm_dbg(&i915->drm, "PCON max rate = %d Gbps\n", max_pcon_frl);
>> +
>> +/* Double Check from HDMI SINK EDID */
>> +max_frl_edid = intel_dp_hdmi_sink_max_frl(intel_dp);
>> +drm_dbg(&i915->drm, "Sink max rate from EDID = %d Gbps\n",
>> +max_frl_edid);
>> +
>> +max_sink_frl = intel_dp->dfp.sink_max_frl;
>> +drm_dbg(&i915->drm, "Sink max rate from PCON = %d Gbps\n",
>> +max_sink_frl);
>> +
>> +/* TODO MAX SINK FRL from PCON is not enumerated. Using MAX FRL
>> value
> Use multi line comment style.
Agreed.
>
>> + * directly from EDID. Need to confirm from Spec.
>> + */
>> +max_frl = min(max_rate_gbps, min(max_frl_edid, max_pcon_frl));
>> +
>> +if (max_frl <= 0)
>> +return -EINVAL;
>> +
>> +ret = drm_dp_pcon_frl_prepare(&intel_dp->aux, false);
>> +if (ret < 0)
>> +return ret;
>> +/* Wait for PCON to be FRL Ready */
>> +wait_for(is_active = drm_dp_pcon_is_frl_ready(&intel_dp->aux) == true,
>> +TIMEOUT_FRL_READY_MS);
>> +
>> +if (!is_active)
>> +return -ETIMEDOUT;
>> +
>> +max_frl_mask = intel_dp_pcon_set_frl_mask(max_frl);
>> +ret = drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl,
>> PCON_SEQUENTIAL_MODE);
>> +if (ret < 0)
>> +return ret;
>> +ret = drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_mask,
>> PCON_NORMAL_TRAIN_MODE);
>> +if (ret < 0)
>> +return ret;
>> +ret = drm_dp_pcon_frl_enable(&intel_dp->aux);
>> +if (ret < 0)
>> +return ret;
>> +/*
>> + * Wait for FRL to be completed
>> + * Check if the HDMI Link is up and active.
>> + */
>> +wait_for(is_active = drm_dp_pcon_hdmi_link_active(&intel_dp->aux) ==
>> +true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
>> +
>> +if (!is_active)
>> +return -ETIMEDOUT;
>> +/*
>> + * Verify HDMI Link configuration shows FRL Mode.
>> + */
>> +if (DP_PCON_HDMI_MODE_FRL !=
>> drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, &frl_trained_mask)) {
>> +drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL
>> Mode\n");
>> +return -EINVAL;
>> +}
>> +drm_dbg(&i915->drm, "MAX_FRL_MASK = %u, FRL_TRAINED_MASK =
>> %u\n",
>> +max_frl_mask, frl_trained_mask);
>> +
>> +/*
>> + * Read HDMI_LINK_STATUS_TRAINED 0x2005 bit 5
>> + * TODO: Details not mentioned in spec. Need to check.
>> + */
>> +
>> +intel_dp->frl.trained_rate_gbps =
>> intel_dp_pcon_get_frl_mask(frl_trained_mask);
>> +intel_dp->frl.is_trained = true;
>> +drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n",
>> +intel_dp->frl.trained_rate_gbps);
>> +
>> +return 0;
>> +}
>> +
>> +static bool intel_dp_is_frl_required(struct intel_dp *intel_dp) {
>> +if (!intel_dp->frl.is_trained)
>> +return true;
>> +/*
>> + * #TODO check if the mode really required FRL or can work
>> + * with TMDS mode.
>> + */
>> +
>> +return false;
>> +}
>> +
>> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp) {
>> +if (drm_dp_is_branch(intel_dp->dpcd) &&
>> +    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
>> +return true;
>> +
>> +return false;
>> +}
>> +
>> +void intel_dp_check_frl_training(struct intel_dp *intel_dp) {
>> +struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
>> +
>> +if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
>> +    !intel_dp_is_frl_required(intel_dp))
>> +return;
>> +
>> +if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
>> +int ret, mode;
>> +
>> +drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing
>> with TMDS mode\n");
>> +ret = drm_dp_pcon_reset_frl_config(&intel_dp->aux);
>> +mode = drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);
>> +
>> +if (ret < 0 || mode != DP_PCON_HDMI_MODE_TMDS)
>> +drm_dbg(&dev_priv->drm, "Issue with PCON, cannot set
>> TMDS mode\n");
>> +}
>> +
>> +else
> Move it up and enclose in { to match the above if style.


Agreed. Will fix the styling issue here.


Regards,

Ankit

>
>> +drm_dbg(&dev_priv->drm, "FRL training Completed\n"); }
>> +
>>   static void
>>   g4x_set_link_train(struct intel_dp *intel_dp,
>>      const struct intel_crtc_state *crtc_state, diff --git
>> a/drivers/gpu/drm/i915/display/intel_dp.h
>> b/drivers/gpu/drm/i915/display/intel_dp.h
>> index fcc28eb242f2..81d83d88cd41 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
>> @@ -143,4 +143,6 @@ bool intel_dp_initial_fastset_check(struct intel_encoder
>> *encoder,  void intel_dp_sync_state(struct intel_encoder *encoder,
>>    const struct intel_crtc_state *crtc_state);
>>
>> +void intel_dp_check_frl_training(struct intel_dp *intel_dp);
>> +
>>   #endif /* __INTEL_DP_H__ */
>> --
>> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
