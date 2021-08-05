Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5873E1472
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 14:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF48A6EA06;
	Thu,  5 Aug 2021 12:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8216EA06
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 12:08:21 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id e19so9148238ejs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QINYPdftC+kwfMyU4cvPF8EQviKOBFY1YcdjIjIWydc=;
 b=HjfxWSVW5lNuMaN6QaFwDuUbGOhV1kjbN4HVu9uCr/gZwDi1jjj8n2aE/vsMIVHRPN
 dKlTLx7Zt/m9wYeA8l/WItrIvtZqpqWa5OwzAPM0x+5AeDCNtYTzqNPy3iFVHJd5O0hs
 gHfqKHPbTQ1DjMwqcmQm6HCJ+8iMKRiI5IE/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QINYPdftC+kwfMyU4cvPF8EQviKOBFY1YcdjIjIWydc=;
 b=WkenS9RxwopvXE67Yx1OPiKtLLsvV9CldZADSZ4hpsjMJq9rX8DJplCta8BxsEYvSh
 BTh5/w6FFuqMxoj2/aMcgjsp9ZYrXn1XQg2cL7xmZ+p3/O1EnKY/oogikzYnzBE6OFcs
 GqP9ak9RdWqmno4LoBy0dBEd7a1CeLtgjiekNUxphL62ITWw6hTGUNfR4cxIdrXHuOqJ
 SsVyiRpfB4yugCsZT25ye/WVa5rf/s1UkNRbICkSk/fxFA0JktSt92OGj+DgrqqSorBH
 Kb63nBE1+3xspg2m33tDeh1Cs1inSisTLdELDVaCOAQMfEFTW1s8EWT4a9Fc3/9qsEhY
 xvVw==
X-Gm-Message-State: AOAM533cR++FlEk0c+cVZKvxa9Bxbobco9k9x+gyaoCL24QnO9+gTAkK
 ZfzFEYaRCauK/VIN5uMqxtMVcw==
X-Google-Smtp-Source: ABdhPJy3pwTebRqN7tUmJaBSLzYBh+B+2mrDYXcF+2iJDtWLTWcWUF93GDMaf0hkWLWyUggTP3CK7A==
X-Received: by 2002:a17:906:a24c:: with SMTP id
 bi12mr4508766ejb.530.1628165299735; 
 Thu, 05 Aug 2021 05:08:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cz3sm2191553edb.11.2021.08.05.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 05:08:19 -0700 (PDT)
Date: Thu, 5 Aug 2021 14:08:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Simon Ser <contact@emersion.fr>, "Zhang, Tina" <tina.zhang@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
Subject: Re: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Message-ID: <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8722db11a6d245259c15ca2262a40d07@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 05, 2021 at 04:15:27AM +0000, Kasireddy, Vivek wrote:
> Hi Daniel,
> 
> > > >>> The solution:
> > > >>> - To ensure full framerate, the Guest compositor has to start it's repaint cycle
> > (including
> > > >>> the 9 ms wait) when the Host compositor sends the frame callback event to its
> > clients.
> > > >>> In order for this to happen, the dma-fence that the Guest KMS waits on -- before
> > sending
> > > >>> pageflip completion -- cannot be tied to a wl_buffer.release event. This means that,
> > the
> > > >>> Guest compositor has to be forced to use a new buffer for its next repaint cycle
> > when it
> > > >>> gets a pageflip completion.
> > > >>
> > > >> Is that really the only solution?
> > > > [Kasireddy, Vivek] There are a few others I mentioned here:
> > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986572
> > > > But I think none of them are as compelling as this one.
> > > >
> > > >>
> > > >> If we fix the event timestamps so that both guest and host use the same
> > > >> timestamp, but then the guest starts 5ms (or something like that) earlier,
> > > >> then things should work too? I.e.
> > > >> - host compositor starts at (previous_frametime + 9ms)
> > > >> - guest compositor starts at (previous_frametime + 4ms)
> > > >>
> > > >> Ofc this only works if the frametimes we hand out to both match _exactly_
> > > >> and are as high-precision as the ones on the host side. Which for many gpu
> > > >> drivers at least is the case, and all the ones you care about for sure :-)
> > > >>
> > > >> But if the frametimes the guest receives are the no_vblank fake ones, then
> > > >> they'll be all over the place and this carefully tuned low-latency redraw
> > > >> loop falls apart. Aside fromm the fact that without tuning the guests to
> > > >> be earlier than the hosts, you're guaranteed to miss every frame (except
> > > >> when the timing wobbliness in the guest is big enough by chance to make
> > > >> the deadline on the oddball frame).
> > > > [Kasireddy, Vivek] The Guest and Host use different event timestamps as we don't
> > > > share these between the Guest and the Host. It does not seem to be causing any other
> > > > problems so far but we did try the experiment you mentioned (i.e., adjusting the
> > delays)
> > > > and it works. However, this patch series is meant to fix the issue without having to
> > tweak
> > > > anything (delays) because we can't do this for every compositor out there.
> > >
> > > Maybe there could be a mechanism which allows the compositor in the guest to
> > automatically adjust its repaint cycle as needed.
> > >
> > > This might even be possible without requiring changes in each compositor, by adjusting
> > the vertical blank periods in the guest to be aligned with the host compositor repaint
> > cycles. Not sure about that though.
> > >
> > > Even if not, both this series or making it possible to queue multiple flips require
> > corresponding changes in each compositor as well to have any effect.
> > 
> > Yeah from all the discussions and tests done it sounds even with a
> > deeper queue we have big coordination issues between the guest and
> > host compositor (like the example that the guest is now rendering at
> > 90fps instead of 60fps like the host).
> [Kasireddy, Vivek] Oh, I think you are referring to my reply to Gerd. That 90 FPS vs 
> 60 FPS problem is a completely different issue that is associated with Qemu GTK UI
> backend. With the GTK backend -- and also with SDL backend -- we Blit the Guest
> scanout FB onto one of the backbuffers managed by EGL. 
> 
> I am trying to add a new Qemu Wayland UI backend so that we can eliminate that Blit
> and thereby have a truly zero-copy solution. And, this is there I am running into the 
> halved frame-rate issue -- the current problem.

Yes, that's what I referenced. But I disagree that it's a different
problem. The underlying problem in both cases is that the guest and host
compositor free-wheel instead of rendering in sync. It's just that
depending upon how exactly the flip completion event on the gues side
plays out you either get guest rendering that's faster than the host-side
60fps, or guest rendering that's much slower than the host-side 60fps.

The fundamental problem in both cases is that they don't run in lockstep.
If you fix that, through fixing the timestamp and even reporting most
likely, you should be able to fix both bugs.

> > Hence my gut feeling reaction that first we need to get these two
> > compositors aligned in their timings, which propobably needs
> > consistent vblank periods/timestamps across them (plus/minux
> > guest/host clocksource fun ofc). Without this any of the next steps
> > will simply not work because there's too much jitter by the time the
> > guest compositor gets the flip completion events.
> [Kasireddy, Vivek] Timings are not a problem and do not significantly
> affect the repaint cycles from what I have seen so far.
> 
> > 
> > Once we have solid events I think we should look into statically
> > tuning guest/host compositor deadlines (like you've suggested in a
> > bunch of places) to consisently make that deadline and hit 60 fps.
> > With that we can then look into tuning this automatically and what to
> > do when e.g. switching between copying and zero-copy on the host side
> > (which might be needed in some cases) and how to handle all that.
> [Kasireddy, Vivek] As I confirm here: https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_984065
> tweaking the deadlines works (i.e., we get 60 FPS) as we expect. However,
> I feel that this zero-copy solution I am trying to create should be independent
> of compositors' deadlines, delays or other scheduling parameters.

That's not how compositors work nowadays. Your problem is that you don't
have the guest/host compositor in sync. zero-copy only changes the timing,
so it changes things from "rendering way too many frames" to "rendering
way too few frames".

We need to fix the timing/sync issue here first, not paper over it with
hacks.

Only, and I really mean only, when that shows that it's simply impossible
to hit 60fps with zero-copy and the guest/host fully aligned should we
look into making the overall pipeline deeper.

> > Only when that all shows that we just can't hit 60fps consistently and
> > really need 3 buffers in flight should we look at deeper kms queues.
> > And then we really need to implement them properly and not with a
> > mismatch between drm_event an out-fence signalling. These quick hacks
> > are good for experiments, but there's a pile of other things we need
> > to do first. At least that's how I understand the problem here right
> > now.
> [Kasireddy, Vivek] Experiments done so far indicate that we can hit 59 FPS consistently
> -- in a zero-copy way independent of compositors' delays/deadlines -- with this
> patch series + the Weston MR I linked in the cover letter. The main reason why this
> works is because we relax the assumption that when the Guest compositor gets a
> pageflip completion event that it could reuse the old FB it submitted in the previous
> atomic flip and instead force it to use a new one. And, we send the pageflip completion
> event to the Guest when the Host compositor sends a frame callback event. Lastly,
> we use the (deferred) out_fence as just a mechanism to tell the Guest compositor when
> it can release references on old FBs so that they can be reused again.
> 
> With that being said, the only question is how can we accomplish the above in an upstream
> acceptable way without regressing anything particularly on bare-metal. Its not clear if just
> increasing the queue depth would work or not but I think the Guest compositor has to be told
> when it can start its repaint cycle and when it can assume the old FB is no longer in use.
> On bare-metal -- and also with VKMS as of today -- a pageflip completion indicates both.
> In other words, Vblank event is the same as Flip done, which makes sense on bare-metal.
> But if we were to have two events at-least for VKMS: vblank to indicate to Guest to start
> repaint and flip_done to indicate to drop references on old FBs, I think this problem can
> be solved even without increasing the queue depth. Can this be acceptable?

That's just another flavour of your "increase queue depth without
increasing the atomic queue depth" approach. I still think the underlying
fundamental issue is a timing confusion, and the fact that adjusting the
timings fixes things too kinda proves that. So we need to fix that in a
clean way, not by shuffling things around semi-randomly until the specific
config we tests works.

Iow I think we need a solution here which both slows down the 90fps to
60fps for the blit case, and the 30fps speed up to 60fps for the zerocopy
case. Because the host might need to switch transparently between blt and
zerocopy for various reasons.
-Daniel

> Thanks,
> Vivek
> > 
> > Cheers, Daniel
> > 
> > >
> > >
> > > --
> > > Earthling Michel Dänzer               |               https://redhat.com
> > > Libre software enthusiast             |             Mesa and X developer
> > 
> > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
