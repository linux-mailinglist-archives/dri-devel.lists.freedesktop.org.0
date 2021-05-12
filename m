Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E537B841
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A6E6EB69;
	Wed, 12 May 2021 08:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8182D6EB69
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:44:33 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gx5so33756278ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=k57DmPl8RW2cyjRaOT7DUBGMCS6OKcniCq01ArtFPiQ=;
 b=KsoKRhZ6yW0fI2927FQBtBpGJa/p4X2S3IylQQQvthYzyt8AlbV5ogQpc1tXQfjkTm
 5yNZ84tI2ndBqIf70g0Co32Lc5QubIL9D9j2G+GvrxSJ786e6aL1ZI8Fj2UBDJEHVXYJ
 oso8dTGfP/5X8dV9IRxpL9q8NvoMhfg4f42wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=k57DmPl8RW2cyjRaOT7DUBGMCS6OKcniCq01ArtFPiQ=;
 b=ax2IF6EChponKw4+c2AYtvHEOuo2iGrFP3Fv5jSTBswRTIzEjT0cSzrWkfr+hw0Qop
 mDfHa0Z+K1n9uXgPVG9sf5KqJ615OsdbAOY+Wb93Y3MM7sAxnFV+wK2T4inyQvp8IP+o
 Ec5LucKRIkK25EswDfmzDwq3hmiarRlSc5xaq9/kPhFS69MDaGMstFhjv9Cg4LWxo9B5
 5KtL+wMCGHuDtjINOCsmK4/ClFG3aixnOHowqc82puovUqYtwLABzLc7zoL/1q5NLLpA
 LFF947RBGNXPyrqZ0nhvwtFm/R6iqkjxZSXq3dHsIackJtzTyuEDDi6+F2CLwf1purvd
 h5fQ==
X-Gm-Message-State: AOAM533rczSRQagddKjEUxMea4xXYXI1O/Enh+Xm+CidI/q61lAvg5QA
 7kDBL/xooHOfZyVVpTluZfE92g==
X-Google-Smtp-Source: ABdhPJxptkXgJRtqEdZiKU66KrhWXSXB6VaFaRD17ezfQoy2BC7eR+y5a6HCmnXQg1rmhVR+RgA7ug==
X-Received: by 2002:a17:906:f41:: with SMTP id
 h1mr37036003ejj.399.1620809072115; 
 Wed, 12 May 2021 01:44:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x9sm17001704edv.22.2021.05.12.01.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 01:44:31 -0700 (PDT)
Date: Wed, 12 May 2021 10:44:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <YJuVbRNGSCkYYD7U@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
 <20210512112330.0130a62a@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512112330.0130a62a@eldfell>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 11:23:30AM +0300, Pekka Paalanen wrote:
> On Tue, 11 May 2021 18:44:17 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote:
> > > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:  
> > > >
> > > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:  
> > > > >
> > > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:  
> > > > > >
> > > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:  
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > > > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > > > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > > > > > that actually needs dirtyfb, and skip over them.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>  
> > > > > >
> > > > > > So this is a bit annoying because the idea of all these "remap legacy uapi
> > > > > > to atomic constructs" helpers is that they shouldn't need/use anything
> > > > > > beyond what userspace also has available. So adding hacks for them feels
> > > > > > really bad.  
> > > > >
> > > > > I suppose the root problem is that userspace doesn't know if dirtyfb
> > > > > (or similar) is actually required or is a no-op.
> > > > >
> > > > > But it is perhaps less of a problem because this essentially boils
> > > > > down to "x11 vs wayland", and it seems like wayland compositors for
> > > > > non-vsync'd rendering just pageflips and throws away extra frames from
> > > > > the app?  
> > > >
> > > > Yeah it's about not adequately batching up rendering and syncing with
> > > > hw. bare metal x11 is just especially stupid about it :-)
> > > >  
> > > > > > Also I feel like it's not entirely the right thing to do here either.
> > > > > > We've had this problem already on the fbcon emulation side (which also
> > > > > > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > > > > > there was to have a worker which batches up all the updates and avoids any
> > > > > > stalls in bad places.  
> > > > >
> > > > > I'm not too worried about fbcon not being able to render faster than
> > > > > vblank.  OTOH it is a pretty big problem for x11  
> > > >
> > > > That's why we'd let the worker get ahead at most one dirtyfb. We do
> > > > the same with fbcon, which trivially can get ahead of vblank otherwise
> > > > (if sometimes flushes each character, so you have to pile them up into
> > > > a single update if that's still pending).
> > > >  
> > > > > > Since this is for frontbuffer rendering userspace only we can probably get
> > > > > > away with assuming there's only a single fb, so the implementation becomes
> > > > > > pretty simple:
> > > > > >
> > > > > > - 1 worker, and we keep track of a single pending fb
> > > > > > - if there's already a dirty fb pending on a different fb, we stall for
> > > > > >   the worker to start processing that one already (i.e. the fb we track is
> > > > > >   reset to NULL)
> > > > > > - if it's pending on the same fb we just toss away all the updates and go
> > > > > >   with a full update, since merging the clip rects is too much work :-) I
> > > > > >   think there's helpers so you could be slightly more clever and just have
> > > > > >   an overall bounding box  
> > > > >
> > > > > This doesn't really fix the problem, you still end up delaying sending
> > > > > the next back-buffer to mesa  
> > > >
> > > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > > tracking corruption is possible, but that's not the kernel's problem.
> > > > So how would anything get held up in userspace.  
> > > 
> > > the part about stalling if a dirtyfb is pending was what I was worried
> > > about.. but I suppose you meant the worker stalling, rather than
> > > userspace stalling (where I had interpreted it the other way around).
> > > As soon as userspace needs to stall, you're losing again.  
> > 
> > Nah, I did mean userspace stalling, so we can't pile up unlimited amounts
> > of dirtyfb request in the kernel.
> > 
> > But also I never expect userspace that uses dirtyfb to actually hit this
> > stall point (otherwise we'd need to look at this again). It would really
> > be only there as defense against abuse.
> > 
> > > > > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > > > > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > > > > of drm_atomic_helper_dirtyfb()  
> > > >
> > > > That's still using information that userspace doesn't have, which is a
> > > > bit irky. We might as well go with your thing here then.  
> > > 
> > > arguably, this is something we should expose to userspace.. for DSI
> > > command-mode panels, you probably want to make a different decision
> > > with regard to how many buffers in your flip-chain..
> > > 
> > > Possibly we should add/remove the fb_damage_clips property depending
> > > on the display type (ie. video/pull vs cmd/push mode)?  
> > 
> > I'm not sure whether atomic actually needs this exposed:
> > - clients will do full flips for every frame anyway, I've not heard of
> >   anyone seriously doing frontbuffer rendering.
> 
> That may or may not be changing, depending on whether the DRM drivers
> will actually support tearing flips. There has been a huge amount of
> debate for needing tearing for Wayland [1], and while I haven't really
> joined that discussion, using front-buffer rendering (blits) to work
> around the driver inability to flip-tear might be something some people
> will want.

Uh pls dont, dirtyfb does a full atomic commit on atomic drivers
underneath it.

> Personally, what I do agree with is that "tear if late from intended
> vblank" is a feature that will be needed when VRR cannot be used.
> However, I would also argue that multiple tearing updates per refresh
> cycle is not a good idea, and I know people disagree with this because
> practically all relevant games are using a naive main loop that makes
> multi-tearing necessary for good input response.
> 
> I'm not quite sure where this leaves the KMS UAPI usage patterns. Maybe
> this matters, maybe not?
> 
> Does it make a difference between using legacy DirtyFB vs. atomic
> FB_DAMAGE_CLIPS property?
> 
> Also mind that Wayland compositors would be dynamically switching
> between "normal flips" and "tearing updates" depending on the
> scenegraph. This switch should not be considered a "mode set".
> 
> [1] https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/65

I think what you want is two things:
- some indication that frontbuffer rendering "works", for some value of
  that (which should probably be "doesn't require dirtyfb")

- tearing flips support. This needs driver support

If you don't have either, pls don't try to emulate something using
frontbuffer rendering and dirtyfb, because that will make it really,
really awkward for the kernel to know what exactly userspace wants to do.
Overloading existing interfaces with new meaning just we can really 
and it happens to work on the one platform we tested is really not a good
idea.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
