Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362B42DE82
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 17:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57FD6E183;
	Thu, 14 Oct 2021 15:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3206E183;
 Thu, 14 Oct 2021 15:43:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227600638"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="227600638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 08:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="626843138"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 14 Oct 2021 08:43:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 14 Oct 2021 18:43:28 +0300
Date: Thu, 14 Oct 2021 18:43:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/dp: reuse the 8b/10b link training delay helpers
Message-ID: <YWhQIAh5f8cUjVbc@intel.com>
References: <20211014150059.28957-1-jani.nikula@intel.com>
 <20211014150059.28957-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211014150059.28957-2-jani.nikula@intel.com>
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

On Thu, Oct 14, 2021 at 06:00:58PM +0300, Jani Nikula wrote:
> Reuse the 8b/10b link training delay helpers. Functionally this skips
> the check for invalid values for DPCD 1.4 and later at clock recovery
> delay (as it's a fixed delay and bypasses the rd_interval) but the same
> value will be checked and invalid values reported at channel
> equalization.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index f7ebf5974fa7..ada0a1ff262d 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -284,35 +284,25 @@ EXPORT_SYMBOL(drm_dp_read_channel_eq_delay);
>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> -	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> -					 DP_TRAINING_AUX_RD_MASK;
> +	u8 rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> +		DP_TRAINING_AUX_RD_MASK;
> +	int delay_us;
>  
> -	if (rd_interval > 4)
> -		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> -			    aux->name, rd_interval);
> -
> -	if (rd_interval == 0 || dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
> -		rd_interval = 100;
> +	if (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14)
> +		delay_us = 100;
>  	else
> -		rd_interval *= 4 * USEC_PER_MSEC;
> +		delay_us = __8b10b_clock_recovery_delay_us(aux, rd_interval);
>  
> -	usleep_range(rd_interval, rd_interval * 2);
> +	usleep_range(delay_us, delay_us * 2);
>  }
>  EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
>  
>  static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> -						 unsigned long rd_interval)
> +						 u8 rd_interval)
>  {
> -	if (rd_interval > 4)
> -		drm_dbg_kms(aux->drm_dev, "%s: AUX interval %lu, out of range (max 4)\n",
> -			    aux->name, rd_interval);
> -
> -	if (rd_interval == 0)
> -		rd_interval = 400;
> -	else
> -		rd_interval *= 4 * USEC_PER_MSEC;
> +	int delay_us = __8b10b_channel_eq_delay_us(aux, rd_interval);
>  
> -	usleep_range(rd_interval, rd_interval * 2);
> +	usleep_range(delay_us, delay_us * 2);
>  }
>  
>  void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
