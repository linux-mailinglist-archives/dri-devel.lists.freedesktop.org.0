Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBD347F17
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CB96ECB4;
	Wed, 24 Mar 2021 17:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069866ECB6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:16:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x13so25220058wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R+S6Evbk1NQq3jj3D1FRfJ9Usoohhpyi2nUtrGT8KOM=;
 b=lGMbpEbyGsYR4DRsf7nWig1f+QjSHb/AjXMxDFPPpUv86VzY/6DyjlhUbbb5h1sbFj
 erxz0AOogeQGsZHlH2gKUr9mTpyBMyL9+t58Q0QOUwCqQjDwOHq1REuxlgpvjUT0X9b9
 RduEERjQpieF6DtpzxPeWNyhd8dX6o1pUOQiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R+S6Evbk1NQq3jj3D1FRfJ9Usoohhpyi2nUtrGT8KOM=;
 b=GhMe8UJcNWRa0gjgCIdEae/Sy8c+LtbU/O2v2wFg31XfnYlpclVyKfw8hheVPP8KW2
 4cEMVq1vvBrMTk9FwsUVxJBeAa9JX3zu5/wP+Un9K/rQDOHlF/jlucMg5b/qFpHIEK6V
 tEh2KPhlxdzWFX/8X+C9+G7VfLzk0VcWgjbdqAl8ZPAnOW7yrrxS3wGyXHBtmX4YWOMy
 Rc9FEuR29SsbkFNSziaM7EKQPscDEEgOXOSO4PHXugHeWEV9UrA/5wFMopjorD1iiLgI
 ethWqNW3PnN84L/eg0hl5CYVGe/LclnxzCD90itKc2iZBMCM2j5ZYRem5ls0/xnX4ZAt
 6HFA==
X-Gm-Message-State: AOAM530t/cdWIoQiQhJh0oBtTch8NJh7+gp8w3cNxgyxE4buniLdaigR
 HTuPMd6QtdOA+UKf5iDichexmaSLXZ+N8cKv
X-Google-Smtp-Source: ABdhPJxmIWv9zK3kVXoxCJIff+aUHrAUko5+3MzW48G7HXxzwMT7BDK6nLK3ZXwffrYdtwdnczQQSg==
X-Received: by 2002:adf:e391:: with SMTP id e17mr4552647wrm.285.1616606206687; 
 Wed, 24 Mar 2021 10:16:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 18sm3265056wmj.21.2021.03.24.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:16:46 -0700 (PDT)
Date: Wed, 24 Mar 2021 18:16:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 63/70] drm/i915: Move gt_revoke() slightly
Message-ID: <YFtz/KiStRF3uQUc@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-64-maarten.lankhorst@linux.intel.com>
 <YFtwHG3ZbjzhuzOZ@phenom.ffwll.local> <YFtzuLjmMAU030wn@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFtzuLjmMAU030wn@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 07:15:36PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Mar 24, 2021 at 06:00:12PM +0100, Daniel Vetter wrote:
> > On Tue, Mar 23, 2021 at 04:50:52PM +0100, Maarten Lankhorst wrote:
> > > We get a lockdep splat when the reset mutex is held, because it can be
> > > taken from fence_wait. This conflicts with the mmu notifier we have,
> > > because we recurse between reset mutex and mmap lock -> mmu notifier.
> > > =

> > > Remove this recursion by calling revoke_mmaps before taking the lock.
> > > =

> > > The reset code still needs fixing, as taking mmap locks during reset
> > > is not allowed.
> > > =

> > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_reset.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/=
i915/gt/intel_reset.c
> > > index 990cb4adbb9a..447f589750c2 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > > @@ -970,8 +970,6 @@ static int do_reset(struct intel_gt *gt, intel_en=
gine_mask_t stalled_mask)
> > >  {
> > >  	int err, i;
> > >  =

> > > -	gt_revoke(gt);
> > > -
> > >  	err =3D __intel_gt_reset(gt, ALL_ENGINES);
> > >  	for (i =3D 0; err && i < RESET_MAX_RETRIES; i++) {
> > >  		msleep(10 * (i + 1));
> > > @@ -1026,6 +1024,9 @@ void intel_gt_reset(struct intel_gt *gt,
> > >  =

> > >  	might_sleep();
> > >  	GEM_BUG_ON(!test_bit(I915_RESET_BACKOFF, &gt->reset.flags));
> > > +
> > =

> > I've added a FIXME comment here just so we don't totally forget. This w=
ill
> > also blow up again when we wrap the entire reset path into a dma_fence
> > critical section annotation (at least going forward, we can't do that on
> > hw that needs display reset with the current code unfortunately).
> > =

> > But I did look at the code which originally added this in
> > =

> > commit 2caffbf1176256cc4f8d4e5c3c524fc689cb9876
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Fri Feb 8 15:37:03 2019 +0000
> > =

> >     drm/i915: Revoke mmaps and prevent access to fence registers across=
 reset
> > =

> > and noped right out.
> > =

> > I think this complexity needs to go entirely, and instead we just prote=
ct
> > the fence register state to make sure that after reset they are all good
> > again:
> > - add a new mutex for low level fence register state
> > - hold that mutex around fence register writes (really just the low lev=
el
> >   fence writes)
> > - hold it in the reset path when we restore fence registers
> > =

> > This means that a global reset also thrashes mmaps, but it's a global
> > reset we're talking about here, everything is thrash anyway. Plus/minus
> > fenced gtt mmaps really doesn't change the tally.
> =

> My recollection is that GPU reset doesn't actually clobber the fence =

> registers. Though not 100% sure I can trust my brain on this. Also
> dunno if it actually matter here or not, but figured I'd point it out.

I think on gen2/3 it does, because there everything goes over. But yeah
maybe on gen4+ it's all fine, would be worth to check that.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
