Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C269E18D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E6C10E166;
	Tue, 21 Feb 2023 13:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538C710E179;
 Tue, 21 Feb 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676986975; x=1708522975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7hNWcojp5W2U9hZRNmXQmRA9fxvEreTv/MsDdmwKkTM=;
 b=nP+yJofG5TPxvfNIkr+ZqSuzvNZrZpqs+hL7e2o396Q3Zsm9mRvYlmZY
 GaEku5e7fYXQ4BRz0bdxhLX4JIpexEWh0j19Wo5/mZJqavORfxM5Tq4HC
 jyWTRQOMhQneBbZ/uA1P3+Ke26N5UgPDs7G8jSmpjd94Q3xQr/3jPZ32w
 uBRi/Wfw56uyKnMU72J3l67p3ZWQoseooj9xHPvvbMprIkf6Rt+0NTcXs
 oT04MOr/yrrsr1V4zSmqfjpkKmtDJ3asZ5R5Mj73hFlvYDh2NJoc5eFgw
 dAoCX5OE4bYXUEZ/1vMefJOrhKn1Wu7pc5LbcTNaBKo6oHVeH2Ye8OsAC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316353740"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="316353740"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 05:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673679994"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="673679994"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 21 Feb 2023 05:42:50 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 15:42:49 +0200
Date: Tue, 21 Feb 2023 15:42:49 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4 10/14] drm/vblank: Add helper to get next vblank time
Message-ID: <Y/TKWRNXvRo6seKK@intel.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-11-robdclark@gmail.com>
 <20230220110820.595cfa37@eldfell>
 <CAF6AEGuo-vmW4Va9=RH+kH9KgNvR2vzjJ8meO-oty56xjDhjgg@mail.gmail.com>
 <20230221104551.60d44d1c@eldfell> <Y/TAr64SpxO712RB@intel.com>
 <20230221151133.6392c521@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221151133.6392c521@eldfell>
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

On Tue, Feb 21, 2023 at 03:11:33PM +0200, Pekka Paalanen wrote:
> On Tue, 21 Feb 2023 15:01:35 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Tue, Feb 21, 2023 at 10:45:51AM +0200, Pekka Paalanen wrote:
> > > On Mon, 20 Feb 2023 07:55:41 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >   
> > > > On Mon, Feb 20, 2023 at 1:08 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
> > > > >
> > > > > On Sat, 18 Feb 2023 13:15:53 -0800
> > > > > Rob Clark <robdclark@gmail.com> wrote:
> > > > >    
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Will be used in the next commit to set a deadline on fences that an
> > > > > > atomic update is waiting on.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
> > > > > >  include/drm/drm_vblank.h     |  1 +
> > > > > >  2 files changed, 33 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > > > > > index 2ff31717a3de..caf25ebb34c5 100644
> > > > > > --- a/drivers/gpu/drm/drm_vblank.c
> > > > > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > > > > @@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
> > > > > >  }
> > > > > >  EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
> > > > > >
> > > > > > +/**
> > > > > > + * drm_crtc_next_vblank_time - calculate the time of the next vblank
> > > > > > + * @crtc: the crtc for which to calculate next vblank time
> > > > > > + * @vblanktime: pointer to time to receive the next vblank timestamp.
> > > > > > + *
> > > > > > + * Calculate the expected time of the next vblank based on time of previous
> > > > > > + * vblank and frame duration    
> > > > >
> > > > > Hi,
> > > > >
> > > > > for VRR this targets the highest frame rate possible for the current
> > > > > VRR mode, right?
> > > > >    
> > > > 
> > > > It is based on vblank->framedur_ns which is in turn based on
> > > > mode->crtc_clock.  Presumably for VRR that ends up being a maximum?  
> > > 
> > > I don't know. :-)  
> > 
> > At least for i915 this will give you the maximum frame
> > duration.
> 
> Really maximum duration? So minimum VRR frequency?

Yes. Doing otherwise would complicate the actual
timestamp calculation even further.

The actual timestamps i915 generates will however match
the start of active video, regardless of how long vblank
was extended.

The only exception might be if you query the timestamp
during vblank but VRR exit has not yet been triggered,
ie. not commit has been made during the frame. In that
case the timestamp will correspond to the max frame
duration, which may or may not end up being the case.
Depends totally whether a commit will still happen
during the vblank to trigger an early vblank exit.

> 
> > Also this does not calculate the the start of vblank, it
> > calculates the start of active video.
> 
> Oh indeed, so it's too late. What one would actually need for the
> deadline is the driver's deadline to present for the immediately next
> start of active video.
> 
> And with VRR that should probably aim for the maximum frame frequency,
> not minimum?

Yeah, max frame rate seems like the easiest thing to use there.

The other option might be some average value based on recent
history, but figuring tht out would seem like a lot more work.

-- 
Ville Syrjälä
Intel
