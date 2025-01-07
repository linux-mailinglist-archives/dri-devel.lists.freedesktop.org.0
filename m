Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDDA03B1C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193EE10E18B;
	Tue,  7 Jan 2025 09:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sQIB3sMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9A10E18B;
 Tue,  7 Jan 2025 09:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ADE99A40DB0;
 Tue,  7 Jan 2025 09:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B85FC4CED6;
 Tue,  7 Jan 2025 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736242232;
 bh=faHcSgdF3E9ljSXlRVOQi+PPa9Gd2RrArQ5HFzl15S4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sQIB3sMw4gmVXtgD+5YdawMKFcDfJQVad1wMKc39QsPkKJ0w8LVl6+ToWwqpZ3D8i
 wSNFNWwzNBrkx4vfNK/xL/y8JgZBvym4lF1OVs3GwkOU7eDnipCzJR4/M9RdIHKYH5
 8s2OfJOE01m/31DOaaWHdvgKkN1PkrZWsMd/i6I8jdD6H5XdzqWu40lJV20vVrCuxA
 PIeOwWft41rEhREQEvmOKfp50+xrvnjvYcqHJpYhiYn/XVNVCvtNSpHtS6SKgH0mzD
 VJkbuxzF1cQuZu5mG3+tSVPYkM0XupewkMn/wybdO8AhxjR9HqFoakeN0kcHysOBFQ
 QPiF1ADxK2kJA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tV5uv-000000006q9-3HKE;
 Tue, 07 Jan 2025 10:30:29 +0100
Date: Tue, 7 Jan 2025 10:30:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z3z0NcDhmwOoQhlG@hovoldconsulting.com>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
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
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
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
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed

typo: transparent (2x)

> +	 */

I think this comment now needs to go inside the conditional, if you want
to keep it at all.

> +	if (drm_dp_lttpr_set_transparent_mode(aux, false)) {
> +		drm_dp_lttpr_set_transparent_mode(aux, true);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);

This looks much better to me now, so with the above addressed: 

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
