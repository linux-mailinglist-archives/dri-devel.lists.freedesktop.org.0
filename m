Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420E6A9B31
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2F410E6EA;
	Fri,  3 Mar 2023 15:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E672110E6E7;
 Fri,  3 Mar 2023 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677858729; x=1709394729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lsRjo7yTXyKCofFwzcN0jbA0ArTfH/fumplb/rfEDjk=;
 b=eY9bugMtbKYwyikNGx6B6AOGqQXem0Y+nQ/E0n0p/WmnvAthQfjIsfy3
 7OvQGR4TE6dYB7hYYGo3VgqVM3h8x8SqrG/Dlr8SWiTUBNuhK09PI9twG
 ZxjUXSrAm5vht3IChvKFYYQaBh16UXq0ug92KPmMLqlO+eser9GHKCkIm
 7irR3/vgN5AoZBQrf1KkciD1dTQn3FuohoI461o4h37mgU8zwDFITzl1u
 imuvhLpp8+zvhf5xLaHWa7deFPBfpTgSwJozSbbFA5cxFuEGZPXMTtxj9
 zzxndl+iiqFQNXVXiDPc1S7VV2K+BADg3gJi740VNhN8mAgn1WpiYoobf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="318896437"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="318896437"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 07:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818509745"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="818509745"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 03 Mar 2023 07:52:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Mar 2023 17:52:02 +0200
Date: Fri, 3 Mar 2023 17:52:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v9 11/15] drm/atomic-helper: Set fence deadline for vblank
Message-ID: <ZAIXonf7orksoFhb@intel.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-12-robdclark@gmail.com>
 <ZAIOaiogeUhhNVfo@intel.com>
 <CAF6AEGuL+B6sR2=7MFvqT0zfsgraoOdzAJBF=Ke1ce1umYh4Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuL+B6sR2=7MFvqT0zfsgraoOdzAJBF=Ke1ce1umYh4Xw@mail.gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 07:45:05AM -0800, Rob Clark wrote:
> On Fri, Mar 3, 2023 at 7:12 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Mar 02, 2023 at 03:53:33PM -0800, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> > > the next vblank time, and inform the fence(s) of that deadline.
> > >
> > > v2: Comment typo fix (danvet)
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index d579fd8f7cb8..d8ee98ce2fc5 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1511,6 +1511,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
> > >
> > > +/*
> > > + * For atomic updates which touch just a single CRTC, calculate the time of the
> > > + * next vblank, and inform all the fences of the deadline.
> > > + */
> > > +static void set_fence_deadline(struct drm_device *dev,
> > > +                            struct drm_atomic_state *state)
> > > +{
> > > +     struct drm_crtc *crtc, *wait_crtc = NULL;
> > > +     struct drm_crtc_state *new_crtc_state;
> > > +     struct drm_plane *plane;
> > > +     struct drm_plane_state *new_plane_state;
> > > +     ktime_t vbltime;
> > > +     int i;
> > > +
> > > +     for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> > > +             if (wait_crtc)
> > > +                     return;
> > > +             wait_crtc = crtc;
> > > +     }
> > > +
> > > +     /* If no CRTCs updated, then nothing to do: */
> > > +     if (!wait_crtc)
> > > +             return;
> >
> > Is there an actual point in limiting this to single crtc updates?
> > That immediately excludes tiled displays/etc.
> >
> > Handling an arbitrary number of crtcs shouldn't really be a lot
> > more complicated should it?
> 
> I guess I could find the soonest upcoming vblank of all the CRTCs and
> use that as the deadline?

Yeah, that seems reasonable. The flips are supposed to happen
atomically (if possible) anyway so collapsing the thing to
a single deadline for all makes sense to me.

-- 
Ville Syrjälä
Intel
