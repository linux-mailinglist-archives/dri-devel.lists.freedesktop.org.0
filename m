Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8462042CCB8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 23:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E2F6EBA8;
	Wed, 13 Oct 2021 21:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D046EB42;
 Wed, 13 Oct 2021 21:22:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="288414174"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="288414174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 14:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524799277"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 13 Oct 2021 14:22:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 00:22:41 +0300
Date: Thu, 14 Oct 2021 00:22:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: add helpers to read link training delays
Message-ID: <YWdOIarEwIzTUBkT@intel.com>
References: <20211012144321.5990-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012144321.5990-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Oct 12, 2021 at 05:43:20PM +0300, Jani Nikula wrote:
> The link training delays are different and/or available in different
> DPCD offsets depending on:
> 
> - Clock recovery vs. channel equalization
> - DPRX vs. LTTPR
> - 128b/132b vs. 8b/10b
> - DPCD 1.4+ vs. earlier
> 
> Add helpers to get the correct delays in us, reading DPCD if
> necessary. This is more straightforward than trying to retrofit the
> existing helpers to take 128b/132b into account.
> 
> Having to pass in the DPCD receiver cap field seems unavoidable, because
> reading it involves checking the revision and reading extended receiver
> cap. So unfortunately the interface is mixed cached and read as needed.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c | 132 ++++++++++++++++++++++++++++++++
>  include/drm/drm_dp_helper.h     |  21 ++++-
>  2 files changed, 151 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 4d0d1e8e51fa..04ebef7f5aa7 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -154,6 +154,138 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>  
> +static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
> +{
> +	if (rd_interval > 4)
> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
> +			    aux->name, rd_interval);
> +
> +	if (rd_interval == 0)
> +		return 100;
> +
> +	return rd_interval * 4 * USEC_PER_MSEC;
> +}
> +
> +static int __8b10b_channel_eq_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
> +{
> +	if (rd_interval > 4)
> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x (max 4)\n",
> +			    aux->name, rd_interval);
> +
> +	if (rd_interval == 0)
> +		return 400;
> +
> +	return rd_interval * 4 * USEC_PER_MSEC;
> +}

Is there a reason you're not reusing these in the existing sleepy
functions? Maybe just passing in the dpcd receiver cap all the way 
would also be nicer since then these functions would do all the work,
instead of splitting it partially between these and the caller.
Also with the 1.4+ case handled elsewhere there won't be debug
spew for illegal values (not sure we care too much though).

> +
> +static int __128b132b_channel_eq_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
> +{
> +	switch (rd_interval) {
> +	default:
> +		drm_dbg_kms(aux->drm_dev, "%s: invalid AUX interval 0x%02x\n",
> +			    aux->name, rd_interval);
> +		fallthrough;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US:
> +		return 400;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS:
> +		return 4000;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS:
> +		return 8000;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS:
> +		return 12000;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS:
> +		return 16000;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS:
> +		return 32000;
> +	case DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS:
> +		return 64000;
> +	}
> +}

The spec does claim that only 00-06 are legal also for the CR delay.
So here too we lose the debug spew if we don' have the CR version
of this.

> +
> +/*
> + * The link training delays are different for:
> + *
> + *  - Clock recovery vs. channel equalization
> + *  - DPRX vs. LTTPR
> + *  - 128b/132b vs. 8b/10b
> + *  - DPCD rev 1.3 vs. later
> + *
> + * Get the correct delay in us, reading DPCD if necessary.
> + */
> +static int __read_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +			enum drm_dp_phy dp_phy, bool uhbr, bool cr)
> +{
> +	int (*parse)(const struct drm_dp_aux *aux, u8 rd_interval);
> +	unsigned int offset;
> +	u8 rd_interval, mask;
> +	int delay_us;
> +
> +	if (dp_phy == DP_PHY_DPRX) {
> +		if (uhbr) {
> +			if (cr)
> +				return 100;
> +
> +			offset = DP_128B132B_TRAINING_AUX_RD_INTERVAL;
> +			mask = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
> +			parse = __128b132b_channel_eq_delay_us;
> +		} else {
> +			if (cr && dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
> +				return 100;
> +
> +			offset = DP_TRAINING_AUX_RD_INTERVAL;
> +			mask = DP_TRAINING_AUX_RD_MASK;
> +			if (cr)
> +				parse = __8b10b_clock_recovery_delay_us;
> +			else
> +				parse = __8b10b_channel_eq_delay_us;
> +		}
> +	} else {
> +		if (uhbr) {
> +			offset = DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
> +			mask = DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK;
> +			parse = __128b132b_channel_eq_delay_us;
> +		} else {
> +			if (cr)
> +				return 100;
> +
> +			offset = DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy);
> +			mask = DP_TRAINING_AUX_RD_MASK;
> +			parse = __8b10b_channel_eq_delay_us;
> +		}
> +	}
> +
> +	if (offset < DP_RECEIVER_CAP_SIZE) {
> +		rd_interval = dpcd[offset];
> +	} else {
> +		if (drm_dp_dpcd_readb(aux, offset, &rd_interval) != 1) {
> +			drm_dbg_kms(aux->drm_dev, "%s: failed rd interval read\n",
> +				    aux->name);
> +			/* arbitrary default delay */
> +			return 400;
> +		}
> +	}
> +
> +	delay_us = parse(aux, rd_interval & mask);
> +	if (delay_us < 0)

Is that possible?

> +		return 0;
> +
> +	return delay_us;
> +}
> +
> +int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				     enum drm_dp_phy dp_phy, bool uhbr)
> +{
> +	return __read_delay(aux, dpcd, dp_phy, uhbr, true);
> +}
> +EXPORT_SYMBOL(drm_dp_read_clock_recovery_delay);
> +
> +int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				 enum drm_dp_phy dp_phy, bool uhbr)
> +{
> +	return __read_delay(aux, dpcd, dp_phy, uhbr, false);
> +}
> +EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
> +
>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index b52df4db3e8f..afdf7f4183f9 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1114,8 +1114,15 @@ struct drm_panel;
>  # define DP_UHBR20                             (1 << 1)
>  # define DP_UHBR13_5                           (1 << 2)
>  
> -#define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
> -# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL                    0x2216 /* 2.0 */
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK              0x7f
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_400_US            0x00
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_4_MS              0x01
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_8_MS              0x02
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_12_MS             0x03
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_16_MS             0x04
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
> +# define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06

What a wonderful mix of 4*x vs. 2^x. Sticking to one or the other would
have made life too easy obviously. But could still use that rule to
shorten the switch statement in __128b132b_channel_eq_delay_us() a bit.
And for 16ms you could even have some fun flipping a coin to decide on
which side it goes :P

Anyways, looks mostly about as sane as this stuff can be.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
> @@ -1389,6 +1396,11 @@ enum drm_dp_phy {
>  # define DP_VOLTAGE_SWING_LEVEL_3_SUPPORTED		    BIT(0)
>  # define DP_PRE_EMPHASIS_LEVEL_3_SUPPORTED		    BIT(1)
>  
> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1  0xf0022 /* 2.0 */
> +#define DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER(dp_phy)	\
> +	DP_LTTPR_REG(dp_phy, DP_128B132B_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1)
> +/* see DP_128B132B_TRAINING_AUX_RD_INTERVAL for values */
> +
>  #define DP_LANE0_1_STATUS_PHY_REPEATER1			    0xf0030 /* 1.3 */
>  #define DP_LANE0_1_STATUS_PHY_REPEATER(dp_phy) \
>  	DP_LTTPR_REG(dp_phy, DP_LANE0_1_STATUS_PHY_REPEATER1)
> @@ -1527,6 +1539,11 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
>  #define DP_LTTPR_PHY_CAP_SIZE		3
>  
> +int drm_dp_read_clock_recovery_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				     enum drm_dp_phy dp_phy, bool uhbr);
> +int drm_dp_read_channel_eq_delay(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				 enum drm_dp_phy dp_phy, bool uhbr);
> +
>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_clock_recovery_delay(void);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
