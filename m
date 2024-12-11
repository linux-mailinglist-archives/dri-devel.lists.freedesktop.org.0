Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C89ECED8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 15:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918510EB68;
	Wed, 11 Dec 2024 14:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fkdcp6d2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D8F10E1A3;
 Wed, 11 Dec 2024 14:42:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F8905C606D;
 Wed, 11 Dec 2024 14:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFCE4C4CED2;
 Wed, 11 Dec 2024 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733928144;
 bh=RJoGGBFcL+sQrgvZ8+9BKYWDJWcgBpREZ6n8Z69Zl9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fkdcp6d25g6ET2VUFeJgANhn0OzBzTp74DQddva1BycAheDOFS1hA76M0cG8a1lco
 GiF+wGC8KuSSiiksMidE9H02hUmQ0Ey5QdFXdPFf/dIbCFM949pMOUVI4OnnJ/KY9z
 8ne5hNVbTCxbkBQAwhg+mUFZ37yOrf3Gohgeo83LhkXN32EFDm2ON53j5wwL4JXq6n
 Z1stje4hyUGIKnHj5mYVbgXf6JnmM/LPNeCzyHoc6gdVQZShSJ8zniEJ4+X8TfLaXo
 mkPA9cS0HTj/ohUY/+SOZBz5fvs2mPhGWcZ18xgISbMcx59BA7q+gkp55/d/vELH5k
 QqclZZ/0OfjVg==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tLNv1-000000002rx-1zMb;
 Wed, 11 Dec 2024 15:42:28 +0100
Date: Wed, 11 Dec 2024 15:42:27 +0100
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
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z1mk08SHEd5_vc99@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
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

On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
 
> +/**
> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> + * @aux: DisplayPort AUX channel
> + * @enable: Enable or disable transparent mode
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> +{
> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> +
> +	return ret == 1 ? 0 : ret;

This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
sure it never returns 0 (for short transfers).

> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);

This appears to be what the driver currently uses, but why not
EXPORT_SYMBOL_GPL?

> +
> +/**
> + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> + *
> + * @aux: DisplayPort AUX channel
> + * @lttpr_count: Number of LTTPRs
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> +{
> +	if (!lttpr_count)
> +		return 0;
> +
> +	/*
> +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> +	 * non-transparent mode and the disable->enable non-transparent mode
> +	 * sequence.
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);

Error handling?

> +
> +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))

No need to check lttpr_count again here.

> +		return 0;

I'd check for errors instead of success here and do the rollback before
returning -EINVAL.

> +
> +	/*
> +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> +	 * the number of LTTPRs is invalid
> +	 */
> +	drm_dp_lttpr_set_transparent_mode(aux, true);
> +
> +	return -EINVAL;

And return 0 explicitly here.

> +}
> +EXPORT_SYMBOL(drm_dp_lttpr_init);

In any case this works well and is needed for external display on the
Lenovo ThinkPad T14s, while not breaking the X13s which does not need
it:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
