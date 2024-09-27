Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005359886AC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CEE10EC60;
	Fri, 27 Sep 2024 14:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqE19rP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158D10EC53;
 Fri, 27 Sep 2024 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727446040; x=1758982040;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CLo9OzVwUZsZ0uIWth/rFORlhVysacKJrF8TOBj8qI0=;
 b=CqE19rP8CrOA9YPjaYR3O37aV7RKg3nBMHh0l1Zc8wVjOi5q8OGleZie
 3yf7lIkF/4LqVaR37DI7Kwv6l7LgQaQNIFz8t10QkiNTSidbL9rpe3CHl
 ew87t12ue6GpPNkWVp66WDtmEHvJ6C9yzvrXPevNCHFLpC7dDogzJM6on
 F1i3lOX0oax2rdCM1Pd3ubULi00qnmmxpkzfK6YcbTZX5mVL8rmm05gKI
 Ta9WI/v5ADzK0MWZ1rRr/NDV2CS0z+GueHRGmuzCnkUSKC82tPIkB+BSe
 dNEehlZk6waiKiStYVp/rwQ1HXi1l6DoeKqeeIH+sn3mL8EcGlFq5Sl6s w==;
X-CSE-ConnectionGUID: tGchfyAlRG29jki65VaO2Q==
X-CSE-MsgGUID: UtgDstvUT4KGiBzzzNCQog==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37262393"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37262393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:07:20 -0700
X-CSE-ConnectionGUID: pYcf9pL4QQyGlpwN2L8OuQ==
X-CSE-MsgGUID: xIrr8pHUQhedg+DyPQcs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72706953"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 07:07:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 17:07:15 +0300
Date: Fri, 27 Sep 2024 17:07:15 +0300
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
Message-ID: <Zva8E_L9yUN6IWlW@intel.com>
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
 <87tte1zewf.fsf@intel.com> <ZvaduhDERL-zvED3@intel.com>
 <87tte1xmqe.fsf@intel.com> <Zva3CAewBl8NBL91@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zva3CAewBl8NBL91@intel.com>
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

On Fri, Sep 27, 2024 at 04:45:44PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 27, 2024 at 04:14:17PM +0300, Jani Nikula wrote:
> > On Fri, 27 Sep 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > On Fri, Sep 27, 2024 at 11:20:32AM +0300, Jani Nikula wrote:
> > >> On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wrote:
> > >> > This fix solves multiple Smatch errors:
> > >> >
> > >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
> > >> > intel_plane_atomic_check_with_state() error:
> > >> > we previously assumed 'fb' could be null (see line 648)
> > >> >
> > >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
> > >> > intel_plane_atomic_check_with_state()
> > >> > error: we previously assumed 'fb' could be null (see line 659)
> > >> >
> > >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
> > >> > intel_plane_atomic_check_with_state()
> > >> > error: we previously assumed 'fb' could be null (see line 663)
> > >> >
> > >> > We should check first if fb is not null before to access its properties.
> > >> 
> > >> new_plane_state->uapi.visible && !fb should not be possible, but it's
> > >> probably too hard for smatch to figure out. It's not exactly trivial for
> > >> humans to figure out either.
> > >> 
> > >> I'm thinking something like below to help both.
> > >> 
> > >> Ville, thoughts?
> > >> 
> > >> 
> > >> BR,
> > >> Jani.
> > >> 
> > >> 
> > >> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > >> index 3505a5b52eb9..d9da47aed55d 100644
> > >> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > >> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > >> @@ -629,6 +629,9 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
> > >>  	if (ret)
> > >>  		return ret;
> > >>  
> > >> +	if (drm_WARN_ON(display->drm, new_plane_state->uapi.visible && !fb))
> > >> +		return -EINVAL;
> > >> +
> > >
> > > We have probably 100 places that would need this. So it's going
> > > to be extremely ugly.
> > >
> > > One approach I could maybe tolerate is something like
> > > intel_plane_is_visible(plane_state) 
> > > {
> > > 	if (drm_WARN_ON(visible && !fb))
> > > 		return false;
> > >
> > > 	return plane_state->visible;
> > > }
> > >
> > > + s/plane_state->visible/intel_plane_is_visible(plane_state)/
> > >
> > > But is that going to help these obtuse tools?
> > 
> > That does help people, which is more important. :)
> > 
> > I think the problem is first checking if fb is NULL, and then
> > dereferencing it anyway.
> > 
> > visible always means fb != NULL, but I forget, is the reverse true? Can
> > we have fb != NULL and !visible? I mean could we change the fb check to
> > visible check?
> 
> No, the reverse does not hold. A plane can be invisible
> while still having a valid fb. Eg. the plane could be
> positioned completely offscreen, or the entire crtc may
> be inactive (DPMS off).
> 
> And whenever we have an fb we want to do all the check to make sure
> it satisfies all the requirements, whether the plane is visible or
> not. Otherwise we could end up confusing userspace with something
> like this:
> 
> 1. Usespace assigns some unsupported fb to the plane
>    but positions the plane offscreen -> success
> 2. Userspace moves the plane to somewhere onscreen -> fail


Basically planes should have three different "enabled" states:

logically_enabled: fb!=NULL (also the crtc must be logically enabled,
                             but drm_atomic_plane_check() guarantees
			     this for us)
visible: logically_enabled && dst rectangle is at least
         partially within pipe_src rectangle
active: visible && crtc_is_active

Currently we try to make the proper distinction between
logically_enabled vs. invisible, but we do not properly
handle the visible vs. active case. That is, we currently
mark the plane as invisible if the crtc is inactive.

That means we eg. calculate watermarks as if the plane was
invisible. That may cause a subsequent "DPMS on" operation
to fail unexpectedly because all of a sudden we realize 
that we don't have enough FIFO space for this particular
plane configuration. There's a FIXME somewhere in the plane
code about this.

-- 
Ville Syrjälä
Intel
