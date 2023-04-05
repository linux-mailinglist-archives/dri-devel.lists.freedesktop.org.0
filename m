Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C524C6D7DE3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22F10E962;
	Wed,  5 Apr 2023 13:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4110E962;
 Wed,  5 Apr 2023 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680702012; x=1712238012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TMW8F/b8XbGwMI3cGtMIb1pBjtc7ngMyt4nCjkMRsMY=;
 b=JDZThcM0o4708VbEKmF8CK1awVYUnKzeQvEYl3EaYh7bCGYDY6fntmlS
 FD1wTBrcMVn2dQ3IrX4hud42cjkRigC1jHFZ3CanFJrI3oqXmc4luAn/n
 Ew82emxb85YDGywvhgmmaUqtsujOfeE6mPf7Ukfi+k4559RgbDq+HKe5J
 HXEVjRNM7QO6gsKks/2hYDcnVdgmRQJO2XgSbIUrvFJRyTFEowBo220gE
 2ulfA7TwSw9EG0Ugmf3HYxqmAjQfQb+N6iBkuhdLUCs7rfij9Jn4zNBuc
 Q12Cb01Eokf1heXmtLY1pB5I8RuFxeC9iGo3C6TwwehoKE35eYeDXdYoH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407535079"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="407535079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 06:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="717046177"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="717046177"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga008.jf.intel.com with SMTP; 05 Apr 2023 06:40:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 Apr 2023 16:40:06 +0300
Date: Wed, 5 Apr 2023 16:40:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helper: Don't set deadline for modesets
Message-ID: <ZC16Nn0kkjs8HTpg@intel.com>
References: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
 <20230405133105.947834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405133105.947834-1-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 03:31:05PM +0200, Daniel Vetter wrote:
> If the crtc is being switched on or off then the semantics of
> computing the timestampe of the next vblank is somewhat ill-defined.
> And indeed, the code splats with a warning in the timestamp
> computation code. Specifically it hits the check to make sure that
> atomic drivers have full set up the timing constants in the drm_vblank
> structure, and that's just not the case before the crtc is actually
> on.
> 
> For robustness it seems best to just not set deadlines for modesets.
> 
> v2: Also skip on inactive crtc (Ville)
> 
> Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org/
> Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch only
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f21b5a74176c..d44fb9b87ef8 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1528,6 +1528,12 @@ static void set_fence_deadline(struct drm_device *dev,
>  	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
>  		ktime_t v;
>  
> +		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> +			continue;
> +
> +		if (!new_crtc_state->active)
> +			continue;
> +
>  		if (drm_crtc_next_vblank_start(crtc, &v))
>  			continue;
>  
> -- 
> 2.40.0

-- 
Ville Syrjälä
Intel
