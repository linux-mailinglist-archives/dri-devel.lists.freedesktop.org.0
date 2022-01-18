Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5C492E06
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 20:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A92D10E434;
	Tue, 18 Jan 2022 19:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB88D10E434;
 Tue, 18 Jan 2022 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642532407; x=1674068407;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=V64B3M6E4kj0l19YNPCajPr6U6BH7e2Ackf6jpy5OrE=;
 b=CCmgemNazFdnACzgUJNuTERfEL+RFessfGbsRi8xr3ECW/10Uio7vDZl
 8RsYnT1HKeyqHUaQ46XXh08Rmn6xrFl/2/AekBmn0OnC6+Wysn0dUVXs3
 BB2a+oBT4yT4QIzz004hQYe++BK8jU7WBCRzGPyyL/qPuClPgPhpNvquk
 QDRE6BbO1fEnrtymv+PQEwrZ8CLUpT829YJhnw11tl6/G7kZNKFJ008yL
 awi9NDvCWfqFlbMSqcC82OD5QepikvwEWKlc1S+EmLBuMZ68k3LR2f9rZ
 v/XsHLn1N267AWk8mbw84sfLt1RDDW5tYhaBa3CUtma3m+XafcM9DviMo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="308229277"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="308229277"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 11:00:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="625605182"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 11:00:05 -0800
Date: Tue, 18 Jan 2022 11:15:14 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20220118191514.GA15750@labuser-Z97X-UD5H>
References: <20211004115913.23889-1-manasi.d.navare@intel.com>
 <20211022195112.GA1609@labuser-Z97X-UD5H>
 <YebsDDwzBJHm+fKu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YebsDDwzBJHm+fKu@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Tue, Jan 18, 2022 at 06:34:20PM +0200, Ville Syrjälä wrote:
> On Fri, Oct 22, 2021 at 12:51:12PM -0700, Navare, Manasi wrote:
> > 
> > Hi Ville,
> > 
> > Could you take a look at this, this addresses teh review comments from prev version
> 
> I don't think I ever got an answer to my question as to whether this
> was tested with all the interesting scenarios:
> 1) just with the master crtc added by userspace into the commit
> 2) just with the slave crtc added by userspace into the commit
> 3) both crtcs added by userspace into the commit
> 
> I guess 1) has been tested since that happens all the time, but the other
> two scanarios would likely need to be done with a synthetic test to make
> sure we're actually hitting them.
> 
> I think it *should* work, but I'd like to have real proof of that.
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thank you for your review here Ville.
I have triggered a separate email thread to understand all the above testing scenarios and get them tested with bigjoiner IGT.

Manasi

> 
> > 
> > Manasi
> > 
> > On Mon, Oct 04, 2021 at 04:59:13AM -0700, Manasi Navare wrote:
> > > In case of a modeset where a mode gets split across mutiple CRTCs
> > > in the driver specific implementation (bigjoiner in i915) we wrongly count
> > > the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
> > > an affected CRTC in atomic_check_only().
> > > This triggers a warning since affected CRTCs doent match requested CRTC.
> > > 
> > > To fix this in such bigjoiner configurations, we should only
> > > increment affected crtcs if that CRTC is enabled in UAPI not
> > > if it is just used internally in the driver to split the mode.
> > > 
> > > v3: Add the same uapi crtc_state->enable check in requested
> > > crtc calc (Ville)
> > > 
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > > Cc: Daniel Stone <daniels@collabora.com>
> > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > index ff1416cd609a..a1e4c7905ebb 100644
> > > --- a/drivers/gpu/drm/drm_atomic.c
> > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > @@ -1310,8 +1310,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > >  
> > >  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> > >  
> > > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > -		requested_crtc |= drm_crtc_mask(crtc);
> > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > +		if (new_crtc_state->enable)
> > > +			requested_crtc |= drm_crtc_mask(crtc);
> > > +	}
> > >  
> > >  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> > >  		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> > > @@ -1360,8 +1362,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > >  		}
> > >  	}
> > >  
> > > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > -		affected_crtc |= drm_crtc_mask(crtc);
> > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > +		if (new_crtc_state->enable)
> > > +			affected_crtc |= drm_crtc_mask(crtc);
> > > +	}
> > >  
> > >  	/*
> > >  	 * For commits that allow modesets drivers can add other CRTCs to the
> > > -- 
> > > 2.19.1
> > > 
> 
> -- 
> Ville Syrjälä
> Intel
