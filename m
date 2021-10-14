Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE942D575
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 10:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60AD6EC34;
	Thu, 14 Oct 2021 08:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441816EC32;
 Thu, 14 Oct 2021 08:51:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214574289"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="214574289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 01:51:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="491863623"
Received: from rwambsga-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.210.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 01:51:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: add helpers to read link training delays
In-Reply-To: <YWdOIarEwIzTUBkT@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211012144321.5990-1-jani.nikula@intel.com>
 <YWdOIarEwIzTUBkT@intel.com>
Date: Thu, 14 Oct 2021 11:51:52 +0300
Message-ID: <87y26wvviv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 Oct 2021, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Oct 12, 2021 at 05:43:20PM +0300, Jani Nikula wrote:
>> The link training delays are different and/or available in different
>> DPCD offsets depending on:
>>=20
>> - Clock recovery vs. channel equalization
>> - DPRX vs. LTTPR
>> - 128b/132b vs. 8b/10b
>> - DPCD 1.4+ vs. earlier
>>=20
>> Add helpers to get the correct delays in us, reading DPCD if
>> necessary. This is more straightforward than trying to retrofit the
>> existing helpers to take 128b/132b into account.
>>=20
>> Having to pass in the DPCD receiver cap field seems unavoidable, because
>> reading it involves checking the revision and reading extended receiver
>> cap. So unfortunately the interface is mixed cached and read as needed.
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 132 ++++++++++++++++++++++++++++++++
>>  include/drm/drm_dp_helper.h     |  21 ++++-
>>  2 files changed, 151 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_he=
lper.c
>> index 4d0d1e8e51fa..04ebef7f5aa7 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -154,6 +154,138 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 =
link_status[DP_LINK_STATUS_SIZ
>>  }
>>  EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>>=20=20
>> +static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux=
, u8 rd_interval)
>> +{
>> +	if (rd_interval > 4)
>> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
>> +			    aux->name, rd_interval);
>> +
>> +	if (rd_interval =3D=3D 0)
>> +		return 100;
>> +
>> +	return rd_interval * 4 * USEC_PER_MSEC;
>> +}
>> +
>> +static int __8b10b_channel_eq_delay_us(const struct drm_dp_aux *aux, u8=
 rd_interval)
>> +{
>> +	if (rd_interval > 4)
>> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
>> +			    aux->name, rd_interval);
>> +
>> +	if (rd_interval =3D=3D 0)
>> +		return 400;
>> +
>> +	return rd_interval * 4 * USEC_PER_MSEC;
>> +}
>
> Is there a reason you're not reusing these in the existing sleepy
> functions?

I decided to see how this flies first, and do that as a follow-up.

> Maybe just passing in the dpcd receiver cap all the way=20
> would also be nicer since then these functions would do all the work,
> instead of splitting it partially between these and the caller.

It's a bit subtle. Checking for dpcd receiver cap in the caller allows
early return without the dpcd read in some cases.

It's all really unnecessarily complicated how the delays are spread all
over the place in dpcd. I couldn't think of a cleaner approach (without
a massive dpcd caching rewrite using regmap, anyway ;).

> Also with the 1.4+ case handled elsewhere there won't be debug
> spew for illegal values (not sure we care too much though).

That's subtle too. This leaves out the check when we're not using the
value, which seems fine to me. However, the same dpcd offset is used for
channel equalization, and that will have the check and debug print.

>> +
>> +static int __128b132b_channel_eq_delay_us(const struct drm_dp_aux *aux,=
 u8 rd_interval)
>> +{
>> +	switch (rd_interval) {
>> +	default:
>> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x\n",
>> +			    aux->name, rd_interval);
>> +		fallthrough;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US:
>> +		return 400;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS:
>> +		return 4000;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS:
>> +		return 8000;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS:
>> +		return 12000;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS:
>> +		return 16000;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS:
>> +		return 32000;
>> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS:
>> +		return 64000;
>> +	}
>> +}
>
> The spec does claim that only 00-06 are legal also for the CR delay.
> So here too we lose the debug spew if we don' have the CR version
> of this.
>
>> +
>> +/*
>> + * The link training delays are different for:
>> + *
>> + *  - Clock recovery vs. channel equalization
>> + *  - DPRX vs. LTTPR
>> + *  - 128b/132b vs. 8b/10b
>> + *  - DPCD rev 1.3 vs. later
>> + *
>> + * Get the correct delay in us, reading DPCD if necessary.
>> + */
>> +static int __read_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIV=
ER_CAP_SIZE],
>> +			enum drm_dp_phy dp_phy, bool uhbr, bool cr)
>> +{
>> +	int (*parse)(const struct drm_dp_aux *aux, u8 rd_interval);
>> +	unsigned int offset;
>> +	u8 rd_interval, mask;
>> +	int delay_us;
>> +
>> +	if (dp_phy =3D=3D DP_PHY_DPRX) {
>> +		if (uhbr) {
>> +			if (cr)
>> +				return 100;
>> +
>> +			offset =3D DP_128B132B_TRAINING_AUX_RD_INTERVAL;
>> +			mask =3D DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
>> +			parse =3D __128b132b_channel_eq_delay_us;
>> +		} else {
>> +			if (cr && dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV_14)
>> +				return 100;
>> +
>> +			offset =3D DP_TRAINING_AUX_RD_INTERVAL;
>> +			mask =3D DP_TRAINING_AUX_RD_MASK;
>> +			if (cr)
>> +				parse =3D __8b10b_clock_recovery_delay_us;
>> +			else
>> +				parse =3D __8b10b_channel_eq_delay_us;
>> +		}
>> +	} else {
>> +		if (uhbr) {
>> +			offset =3D DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
>> +			mask =3D DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
>> +			parse =3D __128b132b_channel_eq_delay_us;
>> +		} else {
>> +			if (cr)
>> +				return 100;
>> +
>> +			offset =3D DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
>> +			mask =3D DP_TRAINING_AUX_RD_MASK;
>> +			parse =3D __8b10b_channel_eq_delay_us;
>> +		}
>> +	}
>> +
>> +	if (offset < DP_RECEIVER_CAP_SIZE) {
>> +		rd_interval =3D dpcd[offset];
>> +	} else {
>> +		if (drm_dp_dpcd_readb(aux, offset, &rd_interval) !=3D 1) {
>> +			drm_dbg_kms(aux->drm_dev, "%s: failed rd interval read\n",
>> +				    aux->name);
>> +			/* arbitrary default delay */
>> +			return 400;
>> +		}
>> +	}
>> +
>> +	delay_us =3D parse(aux, rd_interval & mask);
>> +	if (delay_us < 0)
>
> Is that possible?

It's not, this is leftover from when I thought of return negative errors
but decided against it. I'll respin just for this.

>
>> +		return 0;
>> +
>> +	return delay_us;
>> +}
>> +
>> +int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 d=
pcd[DP_RECEIVER_CAP_SIZE],
>> +				     enum drm_dp_phy dp_phy, bool uhbr)
>> +{
>> +	return __read_delay(aux, dpcd, dp_phy, uhbr, true);
>> +}
>> +EXPORT_SYMBOL(drm_dp_read_clock_recovery_delay);
>> +
>> +int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[=
DP_RECEIVER_CAP_SIZE],
>> +				 enum drm_dp_phy dp_phy, bool uhbr)
>> +{
>> +	return __read_delay(aux, dpcd, dp_phy, uhbr, false);
>> +}
>> +EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
>> +
>>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *au=
x,
>>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>>  {
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index b52df4db3e8f..afdf7f4183f9 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -1114,8 +1114,15 @@ struct drm_panel;
>>  # define DP_UHBR20                             (1 << 1)
>>  # define DP_UHBR13_5                           (1 << 2)
>>=20=20
>> -#define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
>> -# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
>> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 =
/* 2.0 */
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK              0x7f
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US            0x00
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS              0x01
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS              0x02
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS             0x03
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS             0x04
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
>> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
>
> What a wonderful mix of 4*x vs. 2^x. Sticking to one or the other would
> have made life too easy obviously. But could still use that rule to
> shorten the switch statement in __128b132b_channel_eq_delay_us() a bit.
> And for 16ms you could even have some fun flipping a coin to decide on
> which side it goes :P

I'm not sure it's worth it to add the arithmetic.

(But I really really don't understand why it's so hard to decide on a
unit, and add a multiplier in dpcd. Or even reserve 1-2 high bits to
choose the unit, and leave the rest for the multiplier. *sigh*.)

> Anyways, looks mostly about as sane as this stuff can be.
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, I'll respin for the return value check.

BR,
Jani.


>
>>=20=20
>>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
>>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
>> @@ -1389,6 +1396,11 @@ enum drm_dp_phy {
>>  # define DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED		    BIT(0)
>>  # define DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED		    BIT(1)
>>=20=20
>> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1  0xf0022 /* =
2.0 */
>> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy)	\
>> +	DP_LTTPR_REG(dp_phy, DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER=
1)
>> +/* see DP_128B132B_TRAINING_AUX_RD_INTERVAL for values */
>> +
>>  #define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
>>  #define DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy) \
>>  	DP_LTTPR_REG(dp_phy, DP_LANE0_1_STATUS_PHY_REPEATER1)
>> @@ -1527,6 +1539,11 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8=
 link_status[DP_LINK_STATUS_SIZ
>>  #define DP_LTTPR_COMMON_CAP_SIZE	8
>>  #define DP_LTTPR_PHY_CAP_SIZE		3
>>=20=20
>> +int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 d=
pcd[DP_RECEIVER_CAP_SIZE],
>> +				     enum drm_dp_phy dp_phy, bool uhbr);
>> +int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[=
DP_RECEIVER_CAP_SIZE],
>> +				 enum drm_dp_phy dp_phy, bool uhbr);
>> +
>>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *au=
x,
>>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>>  void drm_dp_lttpr_link_train_clock_recovery_delay(void);
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
