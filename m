Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5C492B51
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 17:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA310E193;
	Tue, 18 Jan 2022 16:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F4110E193;
 Tue, 18 Jan 2022 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642523670; x=1674059670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0C5whETnR1MnAnGV+Kl8KfclpcM8vOpmlvxwftMNJLw=;
 b=HtreglfkqBnWFReUPCHWOpmjSoIfbULo4NvnefemC4TP9j2ylRTPpP64
 4DI2MHcRLw0kH+YFO9i0KHRoHZs/a3pMO6RHBf9VuTLP1Z6ZsBmE9XL9V
 oK2MfzxLhWzxFRCzxNCsndfIm7OW9piLhrDEZJbzvtBGJWf5pgbDtbdpj
 sCfzNxWu9iqh9I8CcZnnLIkSntAFg6PQtCjR+iokvxTV7cRv9lEXK2pY5
 qE3ELg8WZIyzYU7GQk7CSfQ/42j0cRNW4QFdxYtNE4b043AgUJK/0kktY
 JHYJV77wVELKDnYiFtE+N65DVMGQUBXDIuorZ7hxDeIRte8UxxrsQwyi/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331208591"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="331208591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 08:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="492720508"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga002.jf.intel.com with SMTP; 18 Jan 2022 08:34:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Jan 2022 18:34:20 +0200
Date: Tue, 18 Jan 2022 18:34:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH v3] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <YebsDDwzBJHm+fKu@intel.com>
References: <20211004115913.23889-1-manasi.d.navare@intel.com>
 <20211022195112.GA1609@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211022195112.GA1609@labuser-Z97X-UD5H>
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
Cc: Daniel Stone <daniels@collabora.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 22, 2021 at 12:51:12PM -0700, Navare, Manasi wrote:
> 
> Hi Ville,
> 
> Could you take a look at this, this addresses teh review comments from prev version

I don't think I ever got an answer to my question as to whether this
was tested with all the interesting scenarios:
1) just with the master crtc added by userspace into the commit
2) just with the slave crtc added by userspace into the commit
3) both crtcs added by userspace into the commit

I guess 1) has been tested since that happens all the time, but the other
two scanarios would likely need to be done with a synthetic test to make
sure we're actually hitting them.

I think it *should* work, but I'd like to have real proof of that.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Manasi
> 
> On Mon, Oct 04, 2021 at 04:59:13AM -0700, Manasi Navare wrote:
> > In case of a modeset where a mode gets split across mutiple CRTCs
> > in the driver specific implementation (bigjoiner in i915) we wrongly count
> > the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
> > an affected CRTC in atomic_check_only().
> > This triggers a warning since affected CRTCs doent match requested CRTC.
> > 
> > To fix this in such bigjoiner configurations, we should only
> > increment affected crtcs if that CRTC is enabled in UAPI not
> > if it is just used internally in the driver to split the mode.
> > 
> > v3: Add the same uapi crtc_state->enable check in requested
> > crtc calc (Ville)
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > Cc: Daniel Stone <daniels@collabora.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index ff1416cd609a..a1e4c7905ebb 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1310,8 +1310,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >  
> >  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> >  
> > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > -		requested_crtc |= drm_crtc_mask(crtc);
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +		if (new_crtc_state->enable)
> > +			requested_crtc |= drm_crtc_mask(crtc);
> > +	}
> >  
> >  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >  		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> > @@ -1360,8 +1362,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >  		}
> >  	}
> >  
> > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > -		affected_crtc |= drm_crtc_mask(crtc);
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +		if (new_crtc_state->enable)
> > +			affected_crtc |= drm_crtc_mask(crtc);
> > +	}
> >  
> >  	/*
> >  	 * For commits that allow modesets drivers can add other CRTCs to the
> > -- 
> > 2.19.1
> > 

-- 
Ville Syrjälä
Intel
