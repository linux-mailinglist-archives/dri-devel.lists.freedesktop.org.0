Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4765912D1B4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 17:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553389565;
	Mon, 30 Dec 2019 16:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9735289548;
 Mon, 30 Dec 2019 16:05:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:05:15 -0800
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="213361950"
Received: from unknown (HELO [10.66.114.55]) ([10.66.114.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 30 Dec 2019 08:05:11 -0800
Subject: Re: [PATCH v3 2/9] drm/dp: get/set phy compliance pattern
To: Harry Wentland <hwentlan@amd.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20191218235324.GI12192@intel.com>
 <20191223170350.15531-1-animesh.manna@intel.com>
 <20191223170350.15531-2-animesh.manna@intel.com>
 <2bf4630b-52f3-138d-9061-766275cbfbe8@amd.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <93fd1b3e-2c97-2cfb-0e1a-9de86b327451@intel.com>
Date: Mon, 30 Dec 2019 21:35:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2bf4630b-52f3-138d-9061-766275cbfbe8@amd.com>
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-12-2019 01:23, Harry Wentland wrote:
>
> On 2019-12-23 12:03 p.m., Animesh Manna wrote:
>> During phy compliance auto test mode source need to read
>> requested test pattern from sink through DPCD. After processing
>> the request source need to set the pattern. So set/get method
>> added in drm layer as it is DP protocol.
>>
>> v2: As per review feedback from Manasi on RFC version,
>> - added dp revision as function argument in set_phy_pattern api.
>> - used int for link_rate and u8 for lane_count to align with existing code.
>>
>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> ---
>>   drivers/gpu/drm/drm_dp_helper.c | 93 +++++++++++++++++++++++++++++++++
>>   include/drm/drm_dp_helper.h     | 31 +++++++++++
>>   2 files changed, 124 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> index 2c7870aef469..91c80973aa83 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -1371,3 +1371,96 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>>   	return num_bpc;
>>   }
>>   EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
>> +
>> +/**
>> + * drm_dp_get_phy_test_pattern() - get the requested pattern from the sink.
>> + * @aux: DisplayPort AUX channel
>> + * @data: DP phy compliance test parameters.
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
>> +				struct drm_dp_phy_test_params *data)
>> +{
>> +	int err;
>> +	u8 rate, lanes;
>> +
>> +	err = drm_dp_dpcd_readb(aux, DP_TEST_LINK_RATE, &rate);
>> +	if (err < 0)
>> +		return err;
>> +	data->link_rate = drm_dp_bw_code_to_link_rate(rate);
>> +
>> +	err = drm_dp_dpcd_readb(aux, DP_TEST_LANE_COUNT, &lanes);
>> +	if (err < 0)
>> +		return err;
>> +	data->num_lanes = lanes & DP_MAX_LANE_COUNT_MASK;
>> +
>> +	if (lanes & DP_ENHANCED_FRAME_CAP)
>> +		data->enahanced_frame_cap = true;
>> +
>> +	err = drm_dp_dpcd_readb(aux, DP_PHY_TEST_PATTERN, &data->phy_pattern);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	switch (data->phy_pattern) {
>> +	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
>> +		err = drm_dp_dpcd_read(aux, DP_TEST_80BIT_CUSTOM_PATTERN_7_0,
>> +				       &data->custom80, 10);
> Using sizeof(data->custom80) might be safer.
>
>> +		if (err < 0)
>> +			return err;
>> +
>> +		break;
>> +	case DP_PHY_TEST_PATTERN_CP2520:
>> +		err = drm_dp_dpcd_read(aux, DP_TEST_HBR2_SCRAMBLER_RESET,
>> +				       &data->hbr2_reset, 2);
> Same here, using sizeof(data->hbr2_reset).
>
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_get_phy_test_pattern);
>> +
>> +/**
>> + * drm_dp_set_phy_test_pattern() - set the pattern to the sink.
>> + * @aux: DisplayPort AUX channel
>> + * @data: DP phy compliance test parameters.
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
>> +				struct drm_dp_phy_test_params *data, u8 dp_rev)
>> +{
>> +	int err, i;
>> +	u8 link_config[2];
>> +	u8 test_pattern;
>> +
>> +	link_config[0] = drm_dp_link_rate_to_bw_code(data->link_rate);
>> +	link_config[1] = data->num_lanes;
>> +	if (data->enahanced_frame_cap)
>> +		link_config[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
>> +	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, link_config, 2);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	test_pattern = data->phy_pattern;
>> +	if (dp_rev < 0x12) {
>> +		test_pattern = (test_pattern << 2) &
>> +			       DP_LINK_QUAL_PATTERN_11_MASK;
>> +		err = drm_dp_dpcd_writeb(aux, DP_TRAINING_PATTERN_SET,
>> +					 test_pattern);
>> +		if (err < 0)
>> +			return err;
>> +	} else {
>> +		for (i = 0; i < data->num_lanes; i++) {
>> +			err = drm_dp_dpcd_writeb(aux,
>> +						 DP_LINK_QUAL_LANE0_SET + i,
>> +						 test_pattern);
>> +			if (err < 0)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_set_phy_test_pattern);
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index d6e560870fb1..42a364748308 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -700,6 +700,15 @@
>>   # define DP_TEST_COUNT_MASK		    0xf
>>   
>>   #define DP_PHY_TEST_PATTERN                 0x248
>> +# define DP_PHY_TEST_PATTERN_SEL_MASK       0x7
>> +# define DP_PHY_TEST_PATTERN_NONE           0x0
>> +# define DP_PHY_TEST_PATTERN_D10_2          0x1
>> +# define DP_PHY_TEST_PATTERN_ERROR_COUNT    0x2
>> +# define DP_PHY_TEST_PATTERN_PRBS7          0x3
>> +# define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
>> +# define DP_PHY_TEST_PATTERN_CP2520         0x5
>> +
>> +#define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>>   #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>>   #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>>   #define	DP_TEST_80BIT_CUSTOM_PATTERN_23_16  0x252
>> @@ -1570,4 +1579,26 @@ static inline void drm_dp_cec_unset_edid(struct drm_dp_aux *aux)
>>   
>>   #endif
>>   
>> +/**
>> + * struct drm_dp_phy_test_params - DP Phy Compliance parameters
>> + * @link: Link information.
> @link seems to be from a previous patch version. Please describe
> link_rate and num_lanes instead.
>
>> + * @phy_pattern: DP Phy test pattern from DPCD 0x248 (sink)
>> + * @hb2_reset: DP HBR2_COMPLIANCE_SCRAMBLER_RESET from DCPD
>> + *            0x24A and 0x24B (sink)
>> + * @custom80: DP Test_80BIT_CUSTOM_PATTERN from DPCDs 0x250
>> + *               through 0x259.
> Missing doc for enhanced_frame_cap.
>
>> + */
>> +struct drm_dp_phy_test_params {
>> +	int link_rate;
> Is there a reason you're not using u8 here? Would be nice to keep it
> consistent with num_lanes.

link_rate variable is used here to store actual clock value after multiplying with 27000 (0.27 gbps) with link-code using drm_dp_bw_code_to_link_rate().
Followed the same and u8 maybe not be sufficient. Added other suggested changes. Thanks for review.

Regrads,
Animesh

>
>> +	u8 num_lanes;
>> +	u8 phy_pattern;
>> +	u8 hbr2_reset[2];
>> +	u8 custom80[10];
>> +	bool enahanced_frame_cap;
> Typo. Should be enhanved_frame_cap.
>
> Harry
>
>> +};
>> +
>> +int drm_dp_get_phy_test_pattern(struct drm_dp_aux *aux,
>> +				struct drm_dp_phy_test_params *data);
>> +int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
>> +				struct drm_dp_phy_test_params *data, u8 dp_rev);
>>   #endif /* _DRM_DP_HELPER_H_ */
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
