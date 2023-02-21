Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBA69E0F6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 14:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACEF10E7F9;
	Tue, 21 Feb 2023 13:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CFB10E7F9;
 Tue, 21 Feb 2023 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676984503; x=1708520503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=acdczu8sh+vl0KUoF5rFum01VLOZMhQ4SRvqf3KdLIY=;
 b=ZuNiNkwLaXam+9FAN879+PA69SwL7aJoJLlfTDKvHlrfHPIetrgME6rz
 KWXfwhxwSMbIJLY9x7hgVyjWT+AP9B9qFYtYUPj3wyM/IpBG/AhTXzfFC
 qTxKZjp7yDgNuisnHKRtXgdthpa8D/vY0NDUQdhevhpLiFaq46LBmtSyV
 VElVNDywMunj359zpMQ9/XUdei9zHaSkKKQ8OLpMfy456ZeFwnSsdE0zu
 R2RPmNbj3v3AGjOa8Z8Y6nZnh9qkBqWLL22Q1kkJKeHM9PCc2h8xlNUtr
 vCGFoDYTDrpbbJ3WIKaJbKJBGmIERw2sJACQSbGwLA8FLjyGyA/Iqx6RC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333983822"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="333983822"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 05:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="845666450"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="845666450"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga005.jf.intel.com with SMTP; 21 Feb 2023 05:01:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 15:01:35 +0200
Date: Tue, 21 Feb 2023 15:01:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
Message-ID: <Y/TAr64SpxO712RB@intel.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221104551.60d44d1c@eldfell>
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> On Mon, 20 Feb 2023 07:55:41 -0800
> Rob Clark <robdclark@gmail.com> wrote:
> 
> > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >  
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Will be used in the next commit to set a deadline on fences that an
> > > > atomic update is waiting on.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
> > > >  include/drm/drm_vblank.h     |  1 +
> > > >  2 files changed, 33 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > >  }
> > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > >
> > > > +/**
> > > > + * drm_crtc_next_vblank_time - calculate the time of the next vblank
> > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > + * @vblanktime: pointer to time to receive the next vblank timestamp.
> > > > + *
> > > > + * Calculate the expected time of the next vblank based on time of previous
> > > > + * vblank and frame duration  
> > >
> > > Hi,
> > >
> > > for VRR this targets the highest frame rate possible for the current
> > > VRR mode, right?
> > >  
> > 
> > It is based on vblank->framedur_ns which is in turn based on
> > mode->crtc_clock.  Presumably for VRR that ends up being a maximum?
> 
> I don't know. :-)

At least for i915 this will give you the maximum frame
duration.

Also this does not calculate the the start of vblank, it
calculates the start of active video.

> 
> You need a number of clock cycles in addition to the clock frequency,
> and that could still be minimum, maximum, the last realized one, ...
> 
> VRR works by adjusting the front porch length IIRC.
> 
> 
> Thanks,
> pq
> 
> > BR,
> > -R
> > 
> > 
> > >
> > > Thanks,
> > > pq
> > >  
> > > > + */
> > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
> > > > +{
> > > > +     unsigned int pipe = drm_crtc_index(crtc);
> > > > +     struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
> > > > +     u64 count;
> > > > +
> > > > +     if (!vblank->framedur_ns)
> > > > +             return -EINVAL;
> > > > +
> > > > +     count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
> > > > +
> > > > +     /*
> > > > +      * If we don't get a valid count, then we probably also don't
> > > > +      * have a valid time:
> > > > +      */
> > > > +     if (!count)
> > > > +             return -EINVAL;
> > > > +
> > > > +     *vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_crtc_next_vblank_time);
> > > > +
> > > >  static void send_vblank_event(struct drm_device *dev,
> > > >               struct drm_pending_vblank_event *e,
> > > >               u64 seq, ktime_t now)
> > > > diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> > > > index 733a3e2d1d10..a63bc2c92f3c 100644
> > > > --- a/include/drm/drm_vblank.h
> > > > +++ b/include/drm/drm_vblank.h
> > > > @@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
> > > >  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
> > > >  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > >                                  ktime_t *vblanktime);
> > > > +int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
> > > >  void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
> > > >                              struct drm_pending_vblank_event *e);
> > > >  void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,  
> > >  
> 



-- 
Ville Syrjälä
Intel
