Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F8F41C336
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 13:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBC36E1A8;
	Wed, 29 Sep 2021 11:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204628913D;
 Wed, 29 Sep 2021 11:14:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="285932338"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="285932338"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 04:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="617423409"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 29 Sep 2021 04:14:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 29 Sep 2021 14:14:51 +0300
Date: Wed, 29 Sep 2021 14:14:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <YVRKq79qPNlFcC8I@intel.com>
References: <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
 <20210318230126.GA1900@labuser-Z97X-UD5H>
 <YFS7mINBWsHiYIKm@intel.com>
 <20210319205413.GA6359@labuser-Z97X-UD5H>
 <YFUTyb6ofKRI12hO@intel.com>
 <20210319212624.GA6560@labuser-Z97X-UD5H>
 <YFUXX/pDcBheiNWL@intel.com>
 <20210325220127.GA28898@labuser-Z97X-UD5H>
 <YF4ImoReniVIz+TT@intel.com>
 <20210401214908.GA24310@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210401214908.GA24310@labuser-Z97X-UD5H>
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

On Thu, Apr 01, 2021 at 02:49:13PM -0700, Navare, Manasi wrote:
> On Fri, Mar 26, 2021 at 06:15:22PM +0200, Ville Syrjälä wrote:
> > On Thu, Mar 25, 2021 at 03:01:29PM -0700, Navare, Manasi wrote:
> > > On Fri, Mar 19, 2021 at 11:27:59PM +0200, Ville Syrjälä wrote:
> > > > On Fri, Mar 19, 2021 at 02:26:24PM -0700, Navare, Manasi wrote:
> > > > > On Fri, Mar 19, 2021 at 11:12:41PM +0200, Ville Syrjälä wrote:
> > > > > > On Fri, Mar 19, 2021 at 01:54:13PM -0700, Navare, Manasi wrote:
> > > > > > > On Fri, Mar 19, 2021 at 04:56:24PM +0200, Ville Syrjälä wrote:
> > > > > > > > On Thu, Mar 18, 2021 at 04:01:26PM -0700, Navare, Manasi wrote:
> > > > > > > > > So basically we see this warning only in case of bigjoiner when
> > > > > > > > > drm_atomic_check gets called without setting the state->allow_modeset flag.
> > > > > > > > 
> > > > > > > > Considering the code is 'WARN(!state->allow_modeset, ...' that
> > > > > > > > fact should be rather obvious.
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > So do you think that in i915, in intel_atomic_check_bigjoiner() we should only
> > > > > > > > > steal the crtc when allow_modeset flag is set in state?
> > > > > > > > 
> > > > > > > > No. If you fully read drm_atomic_check_only() you will observe
> > > > > > > > that it will reject any commit w/ allow_modeset==false which 
> > > > > > > > needs a modeset. And it does that before the WARN.
> > > > > > > > 
> > > > > > > > So you're barking up the wrong tree here. The problem I think
> > > > > > > > is that you're just computing requested_crtcs wrong.
> > > > > > > 
> > > > > > > So here in this case, requested CRTC = 0x1 since it requests modeset on CRTC 0
> > > > > > > Now in teh atomic check, it steals the slave CRTC 1 and hence affected CRTC comes out
> > > > > > > as 0x3 and hence the mismatch.
> > > > > > 
> > > > > > Hmm. How can it be 0x3 if we filtered out the uapi.enable==false case?
> > > > > > 
> > > > > 
> > > > > Yes if I add that condition like in this patch then it correctly calculates
> > > > > the affected crtc bitmask as only 0x1 since it doesnt include the slave crtc.
> > > > > So with this patch, requested crtc = 0x 1, affected crtc = 0x1
> > > > > 
> > > > > If this looks good then this fixes our bigjoiner warnings.
> > > > > Does this patch look good to you as is then?
> > > > 
> > > > I think you still need to fix the requested_crtcs calculation.
> > > 
> > > We calculate requested crtc at the beginning :
> > > for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > >                 requested_crtc |= drm_crtc_mask(crtc);
> > > 
> > > Are you suggesting adding this to after:
> > >  if (config->funcs->atomic_check) {
> > >                 ret = config->funcs->atomic_check(state->dev, state);
> > > 
> > >                 if (ret) {
> > >                         DRM_DEBUG_ATOMIC("atomic driver check for %p failed: %d\n",
> > >                                          state, ret);
> > >                         return ret;
> > >                 }
> > > 		requested_crtc |= drm_crtc_mask(crtc);    // Here it will have requested crtc = 0x11
> > >         }
> > > 
> > > in this case here the state should already have master crtc 0 and slave crtc 1
> > > and that requested crtc should already be 0x11
> > > 
> > > Then in that case we dont need any special check for calculating affected crtc, that also will be 0x11
> > 
> > All I'm saying is that you're currently calculating requested_crtcs and
> > affected_crtcs differently. So I'm not at all surprised that they might
> > not match.
> >
> 
> I dont get your point yet.
> requested crtc is calculated before the atomic check call and we dont check for crtc uapi.enable to be true.
> And hence requested crtc  = CRTC 0 = 0x2
> After I added the check in this patch where affected crtc will include only the crtcs that have uapi.enable = true
> then  it perfectly matches the requested crtc and return 0x2 but without this check when the calculation of
> requested and affected crtc is the same is where we see the affected crtc = CRTC 0 and 1 = 0x3
> 
> So when the calculation is different infcat we dont see the mismatch
> 
> What is your point here?

Try doing an atomic commit wiht both crtcs already added in by 
userspace. I think that will still WARN.

-- 
Ville Syrjälä
Intel
