Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1876D7C69
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A21110E90A;
	Wed,  5 Apr 2023 12:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0617510E90A;
 Wed,  5 Apr 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680697521; x=1712233521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pOpaS/VzVZdJzObenZMlvFf1Tou6jErgD6Bwf6oEvXo=;
 b=SwCDo21AqMhlH6pSZwmehNQTpt6lqhISdzuH8NBBEab2n+kNFR/TzE6K
 TqZYa7rMXoQVtHMPA3sduII97bHBNX0gEIARQi+zN0PJ+l4aXnkE+HNie
 WpIZtbBn0Ul5x+pg91U8XL0ZvEvWE06NO8E7l05gCMoe2tLRzzGo73/D/
 gaW0IbNqHxhN28Zt4A7neVDZkiZYIuWNs0O3/1+qYY2pyl85O+DRP6S9Y
 N1mPTySn7S1e8wlrM70EQFXhdcd2+VwPlXG0bSXNd3gqV997Jsxi368rS
 SUsr++6zozjSDMJyduoevUwT6X7YvBqY1BGT9LPU5CoitLlDzXAgkJ5Bq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="345017360"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="345017360"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719300576"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="719300576"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2023 05:25:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 05 Apr 2023 15:25:15 +0300
Date: Wed, 5 Apr 2023 15:25:15 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helper: Don't set deadline for modesets
Message-ID: <ZC1oq1+oBWM6PpRR@intel.com>
References: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
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

On Wed, Apr 05, 2023 at 10:16:50AM +0200, Daniel Vetter wrote:
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
> Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org/
> Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch only
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f21b5a74176c..6640d80d84f3 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1528,6 +1528,9 @@ static void set_fence_deadline(struct drm_device *dev,
>  	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
>  		ktime_t v;
>  
> +		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
> +			continue;

Should this stuff also be skipped when !new_crtc_state->active?
I didn't actually check what drm_crtc_next_vblank_start() ends
up doing in that case.

> +
>  		if (drm_crtc_next_vblank_start(crtc, &v))
>  			continue;
>  
> -- 
> 2.40.0

-- 
Ville Syrjälä
Intel
