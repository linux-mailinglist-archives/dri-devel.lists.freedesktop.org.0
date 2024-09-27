Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD1988395
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 13:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8C710E348;
	Fri, 27 Sep 2024 11:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrF+K5ZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7CF10E335;
 Fri, 27 Sep 2024 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727438283; x=1758974283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cE3DSOxu2KhQ4VUt6KjdR+DUz74JcXwEdHUB+LUYDoU=;
 b=IrF+K5ZBehI0uaI9hRt/L+KdXLdONRC8fYq3KVihSDcLLZ2V+Ajm8Cf7
 Y09y4ibb0x0PE5bB8sz263entVfYhrDtN3xgyCkCpAbSd8ug7eEFV/8rg
 ALXQyV3vMcA9Mzt0+djeKJ8l6F2O3Wy0ach08KdtFAl7Sx7ANMZVRjcEI
 LgHnkYD82wxSQnEdATcCFtl38wKvBXvreuNemBjk6RuoG9CPY9ka+nBO7
 jObImmIHROSOdafWcWjI1Vh8xDiZginTtvUy8uitw7lb65p6Ptz/c9EHR
 zk/WwwGbdO4g8FelNF7c9wujQ46sIpv3JgiUPM2s+K2hYkx1Uulp6Z7Hd A==;
X-CSE-ConnectionGUID: Hi/ZWUz8QkC2MHzyt+OQeg==
X-CSE-MsgGUID: nMt6g4RUSP6jZDgh0W7gRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30289418"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30289418"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:58:03 -0700
X-CSE-ConnectionGUID: fOl91vxBR5Cr1bV1f6e8BA==
X-CSE-MsgGUID: 5VSTsa3zTTu7LE+v2lKtJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72688311"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 04:57:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 14:57:46 +0300
Date: Fri, 27 Sep 2024 14:57:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: Re: [PATCH] gpu: drm: i915: display: Avoid null values
 intel_plane_atomic_check_with_state
Message-ID: <ZvaduhDERL-zvED3@intel.com>
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
 <87tte1zewf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tte1zewf.fsf@intel.com>
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

On Fri, Sep 27, 2024 at 11:20:32AM +0300, Jani Nikula wrote:
> On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wrote:
> > This fix solves multiple Smatch errors:
> >
> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
> > intel_plane_atomic_check_with_state() error:
> > we previously assumed 'fb' could be null (see line 648)
> >
> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
> > intel_plane_atomic_check_with_state()
> > error: we previously assumed 'fb' could be null (see line 659)
> >
> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
> > intel_plane_atomic_check_with_state()
> > error: we previously assumed 'fb' could be null (see line 663)
> >
> > We should check first if fb is not null before to access its properties.
> 
> new_plane_state->uapi.visible && !fb should not be possible, but it's
> probably too hard for smatch to figure out. It's not exactly trivial for
> humans to figure out either.
> 
> I'm thinking something like below to help both.
> 
> Ville, thoughts?
> 
> 
> BR,
> Jani.
> 
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index 3505a5b52eb9..d9da47aed55d 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -629,6 +629,9 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
>  	if (ret)
>  		return ret;
>  
> +	if (drm_WARN_ON(display->drm, new_plane_state->uapi.visible && !fb))
> +		return -EINVAL;
> +

We have probably 100 places that would need this. So it's going
to be extremely ugly.

One approach I could maybe tolerate is something like
intel_plane_is_visible(plane_state) 
{
	if (drm_WARN_ON(visible && !fb))
		return false;

	return plane_state->visible;
}

+ s/plane_state->visible/intel_plane_is_visible(plane_state)/

But is that going to help these obtuse tools?

>  	if (fb)
>  		new_crtc_state->enabled_planes |= BIT(plane->id);
>  
> 
> 
> >
> > Signed-off-by: Alessandro Zanni <alessandro.zanni87@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index e979786aa5cf..1606f79b39e6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -656,18 +656,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
> >  	    intel_plane_is_scaled(new_plane_state))
> >  		new_crtc_state->scaled_planes |= BIT(plane->id);
> >  
> > -	if (new_plane_state->uapi.visible &&
> > +	if (new_plane_state->uapi.visible && fb &&
> >  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
> >  		new_crtc_state->nv12_planes |= BIT(plane->id);
> >  
> > -	if (new_plane_state->uapi.visible &&
> > +	if (new_plane_state->uapi.visible && fb &&
> >  	    fb->format->format == DRM_FORMAT_C8)
> >  		new_crtc_state->c8_planes |= BIT(plane->id);
> >  
> >  	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
> >  		new_crtc_state->update_planes |= BIT(plane->id);
> >  
> > -	if (new_plane_state->uapi.visible &&
> > +	if (new_plane_state->uapi.visible && fb &&
> >  	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
> >  		new_crtc_state->data_rate_y[plane->id] =
> >  			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
