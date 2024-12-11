Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F419ECF2E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 15:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BB710EB78;
	Wed, 11 Dec 2024 14:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hqna+FOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85B210E1C8;
 Wed, 11 Dec 2024 14:56:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC0F0A42339;
 Wed, 11 Dec 2024 14:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AA8C4CED4;
 Wed, 11 Dec 2024 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733929010;
 bh=OREpjiujqd4SpEZvxAc06dWhF5wUZtZuOpJQ2zmJ8fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hqna+FORRl5s+hoVNX1PHcAkrXrpDQAzfv3NlWXzozI+wZiDZ9WBguGPAcyZkoVQ5
 0CtxxAowC8RaEdJMSlzLkrp3IUwDW3JMLdjLrSs41emwNl+Y6yzhrDM546MppyN+Yl
 nnw8RlLR7bspvO+J+GDQsGPpmPxzMB7JWfnwOtasrvSfgVWx91ff+nLOU0TIihH8wJ
 nLGG/wQEzgYZ2vliQ3sVwcAHKGmrmcW356DKkU4Spduc1T7ehj0yZm5P5bkqDMHsdq
 RwyjSvRidsZIryVplu/6/gBL92iRjHH0Jt5G7eu/eUprRLUrfMYIZXTKJePQiOOk24
 TPuRWRdoA1Dag==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tLO8z-000000003BN-11Dy;
 Wed, 11 Dec 2024 15:56:53 +0100
Date: Wed, 11 Dec 2024 15:56:53 +0100
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
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z1moNToiIIB9auSl@hovoldconsulting.com>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
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

On Wed, Dec 11, 2024 at 03:04:15PM +0200, Abel Vesa wrote:
 
> +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +{
> +	int lttpr_count;
> +
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> +					  dp->lttpr_caps))
> +		return;
> +
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);

I was gonna say shouldn't you handle errors here, but that explains the
non-negative check I commented on the first patch in the series.

This looks error prone, but I think you should at least update the
kernel doc comment to drm_dp_lttpr_init() in the first patch so that
it's clear that you pass in the number of LTTPRs *or* an errno.

> +
> +	drm_dp_lttpr_init(dp->aux, lttpr_count);
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  
> +	msm_dp_display_lttpr_init(dp);

It looks like you ignore errors on purpose so I guess that's fine.

> +
>  	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>  	if (rc)
>  		goto end;

Either way, this is needed for external display on my x1e80100 machines,
while not breaking the X13s:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
