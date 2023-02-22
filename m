Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640D69F869
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131E10EA25;
	Wed, 22 Feb 2023 15:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC4410EA25;
 Wed, 22 Feb 2023 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677081364; x=1708617364;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aWlVChOS42UkpWJgeEJ21XDZB6lv/809UxlYTW78TAY=;
 b=a7uO77jOZaYW/5B4NjVllVovRyBIzAGR5jytkNaxpunx7O1s9fRVrxCn
 aRem2/O2EKy/4en+haAs7EPc4F9splxkck1wSqQFsTEA4/zLxoFLl9AXi
 rC15tvDaKV3AG1DlTB5+PB5lX2s7NjrmW7D8x8/vpvJl13A8RjvPLG5yX
 ozSWzjJXjbUTw7X1yCesei9oPjF1YhG7gNa1pSybICzvmxbQUiRD8AQ7Z
 79GC3o48n+K5S/enxDYtLUhJnTwAo4ao7zh6GuAbULJPkNZ5Vn6bMf8Z8
 9BG0mdmFcSqJyQ4d1aKcMNZTONuxLgN2uUp/6Euj9vgRINXYEgJhXI/Sj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="330687013"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="330687013"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 07:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674146372"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="674146372"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 22 Feb 2023 07:55:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Feb 2023 17:55:58 +0200
Date: Wed, 22 Feb 2023 17:55:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
Message-ID: <Y/Y7DvUYH1qUT0co@intel.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
 <CAF6AEGumfEeGQQaEoEm4hzJajCOBBTrWxPQ9MTh7jt-Mov2FEQ@mail.gmail.com>
 <20230222115700.138d824c@eldfell>
 <CAF6AEGuK0_GtgXS7REAN=u4YZ7x11FrAxVW4iQcqV7bJdJFv6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuK0_GtgXS7REAN=u4YZ7x11FrAxVW4iQcqV7bJdJFv6g@mail.gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 07:44:42AM -0800, Rob Clark wrote:
> On Wed, Feb 22, 2023 at 1:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Tue, 21 Feb 2023 09:50:20 -0800
> > Rob Clark <robdclark@gmail.com> wrote:
> >
> > > On Tue, Feb 21, 2023 at 5:01 AM Ville Syrjälä
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > > > > On Mon, 20 Feb 2023 07:55:41 -0800
> > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > > > >
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > Will be used in the next commit to set a deadline on fences that an
> > > > > > > > atomic update is waiting on.
> > > > > > > >
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
> > > > > > > >  include/drm/drm_vblank.h     |  1 +
> > > > > > > >  2 files changed, 33 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > > > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * drm_crtc_next_vblank_time - calculate the time of the next vblank
> > > > > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > > > > + * @vblanktime: pointer to time to receive the next vblank timestamp.
> > > > > > > > + *
> > > > > > > > + * Calculate the expected time of the next vblank based on time of previous
> > > > > > > > + * vblank and frame duration
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > for VRR this targets the highest frame rate possible for the current
> > > > > > > VRR mode, right?
> > > > > > >
> > > > > >
> > > > > > It is based on vblank->framedur_ns which is in turn based on
> > > > > > mode->crtc_clock.  Presumably for VRR that ends up being a maximum?
> > > > >
> > > > > I don't know. :-)
> > > >
> > > > At least for i915 this will give you the maximum frame
> > > > duration.
> > >
> > > I suppose one could argue that maximum frame duration is the actual
> > > deadline.  Anything less is just moar fps, but not going to involve
> > > stalling until vblank N+1, AFAIU
> > >
> > > > Also this does not calculate the the start of vblank, it
> > > > calculates the start of active video.
> > >
> > > Probably something like end of previous frame's video..  might not be
> > > _exactly_ correct (because some buffering involved), but OTOH on the
> > > GPU side, I expect the driver to set a timer for a few ms or so before
> > > the deadline.  So there is some wiggle room.
> >
> > The vblank timestamp is defined to be the time of the first active
> > pixel of the frame in the video signal. At least that's the one that
> > UAPI carries (when not tearing?). It is not the start of vblank period.
> >
> > With VRR, the front porch before the first active pixel can be multiple
> > milliseconds. The difference between 144 Hz and 60 Hz is 9.7 ms for
> > example.
> 
> What we really want is the deadline for the hw to latch for the next
> frame.. which as Ville pointed out is definitely before the end of
> vblank.
> 
> Honestly this sort of feature is a lot more critical for the non-VRR
> case, and VRR is kind of a minority edge case.  So I'd prefer not to
> get too hung up on VRR.  If there is an easy way for the helpers to
> detect VRR, I'd be perfectly fine not setting a deadline hint in that
> case, and let someone who actually has a VRR display figure out how to
> handle that case.

The formula I gave you earlier works for both VRR and non-VRR.

-- 
Ville Syrjälä
Intel
