Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B2A0680E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36A610E94A;
	Wed,  8 Jan 2025 22:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hg9TDY1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4268910E43E;
 Wed,  8 Jan 2025 22:17:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 54D15A41C75;
 Wed,  8 Jan 2025 22:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C13C4CED3;
 Wed,  8 Jan 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736374671;
 bh=kPEj6/SUZEeHs4OcQvx3Fcoy7dnil6NFBN9jWICpb4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hg9TDY1xVbWLfVM/QQl5JnnrGeEnip9IwJ4zjh5PRL1RzB6+wsmV2An9U7aOiAcnj
 7hz3inVSSOrF2No8AC99ZcMbtHh84bmerQvv/Eq8EtdlIgbxjM8RpqeTbJcywBlAdB
 2zRtfKdz027AHGl2oo2BGT/DCylTGxf8gfzV892td5HK9NewY4X14B4v0pNnw6f7Rt
 J7mswe38PfmuEQQ9iM19Vx0TfG/XyKZg3M/rusGoUH/uwMmnfTDixlgSBHBoPxbknu
 p8L7Qv/LiPhfbP4IYyRYx2b59/9UFcM0ceiitHLrwCB94T4sm32aortNYW3HQYKjYr
 ynOoskg5ndaVg==
Date: Wed, 8 Jan 2025 16:17:47 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
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

On Wed, Jan 08, 2025 at 04:31:43PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
>  }
>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
>  
> +/**
> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode

kernel-doc functions should have () suffix

> + * @aux: DisplayPort AUX channel
> + * @enable: Enable or disable transparent mode
> + *
> + * Returns 0 on success or a negative error code on failure.

And this should be "Return: ...".

> + */
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> +{
> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return (ret == 1) ? 0 : -EIO;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> +
> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *

Documentation also explicitly says not to leave a blank line here...

Regards,
Bjorn

> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs. Between 0 and 8, according to DP standard.
> + *               Negative error code for any non-valid number.
> + *               See drm_dp_lttpr_count().
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	int ret;
> +
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	ret = drm_dp_lttpr_set_transparent_mode(aux, true);
> +	if (ret)
> +		return ret;
> +
> +	if (lttpr_count < 0)
> +		return -ENODEV;
> +
> +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> +		/*
> +		 * Roll-back to transparent mode if setting non-transparent
> +		 * mode has failed
> +		 */
> +		drm_dp_lttpr_set_transparent_mode(aux, true);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);
> +
>  /**
>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
>   * @caps: LTTPR common capabilities
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> 
> -- 
> 2.34.1
> 
