Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164143E474C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 16:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5ED89BD4;
	Mon,  9 Aug 2021 14:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCF889BD4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 14:15:46 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so129500wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Jr4qKjtli7YykcvO40VUo/rtD/o9S6UI+vOLaLuvL+A=;
 b=hDKDmqcCMxGUMyjvHuDIYzqVDVzdAptvOqs7b5cmdjXBsckfx6K7wxwPuuB5A4aj5u
 kgDmT7WqpqqM7wACvSyiKYQrsZxTNG5mm7waL+h4p5ugAgHTH1+1gyQfdBMqLdJc5mqi
 8AwewSF3PYxZoBKOm3GKQKmgA0qwq5w6yKmys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Jr4qKjtli7YykcvO40VUo/rtD/o9S6UI+vOLaLuvL+A=;
 b=euhsNIbL/AEdYxYVTo6d8+Nv0Z8WY1Vyfrs6jr//GT7XS16ZAsIMoVAAtxmLPk6QSV
 1RJvKf1zVbz6STXlZsWmn8c/N0xiZsm81TOH3/3hYZYJHotB3wC2gAgbqJ+flG4PFgxn
 90khbT2ZYb6qLwhk+h8881egAH3NSdQ0gTMBFdSAVxWLobUVG/wGcUJMD7tW+Q88Qh9m
 HJIzsaCfsjOfEhHBg3DPso+v0EZQlpeKfLbvd9IbttnE9DqoLB05Y3rMlFLzaJrW50+p
 t5JWEEl8refq+pzuWWCvNkhNE06DkSzwtWQdnB/++EvhcjUrEJskAy8GTf01Ry+OBf36
 b7aQ==
X-Gm-Message-State: AOAM5304voJKc9HLCgHC6IWEbxWreH4/YJt84erm2m+d1iybbliWkpGW
 U1yLQvJ3F1/Zqx7Fb9BlLUvtGQ==
X-Google-Smtp-Source: ABdhPJw0GoTb7VgXgtidwz12nBhACbFMPtTHNsh6zROoQ8w7Qk9qxcBwlj/rUqTkEEzAmfTQE+NewQ==
X-Received: by 2002:a05:600c:c2:: with SMTP id
 u2mr17031046wmm.106.1628518544790; 
 Mon, 09 Aug 2021 07:15:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r10sm2557656wrq.32.2021.08.09.07.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 07:15:43 -0700 (PDT)
Date: Mon, 9 Aug 2021 16:15:41 +0200
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
Message-ID: <YRE4jaQsOYNsLb+1@phenom.ffwll.local>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
 <612fd31a51384cb28ac6da9db3e840ca@intel.com>
 <YQepZMFaCNLBNGx9@phenom.ffwll.local>
 <fa53f9db229e481784bfe3a61a195fd3@intel.com>
 <1b96e91f-d65c-a155-8c8c-8a4326733c4e@daenzer.net>
 <CAKMK7uH7gy7x-MrN7EWwwdsZKn-i5XB5Wie_ueRXXdnx5Yhefw@mail.gmail.com>
 <8722db11a6d245259c15ca2262a40d07@intel.com>
 <YQvUsYgKxPM/2KZm@phenom.ffwll.local>
 <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47938a95ac0640cbb1b713ff1a48dd8d@intel.com>
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

On Fri, Aug 06, 2021 at 07:27:13AM +0000, Kasireddy, Vivek wrote:
> Hi Daniel,
> 
> > > > > >>> The solution:
> > > > > >>> - To ensure full framerate, the Guest compositor has to start it's repaint cycle
> > > > (including
> > > > > >>> the 9 ms wait) when the Host compositor sends the frame callback event to its
> > > > clients.
> > > > > >>> In order for this to happen, the dma-fence that the Guest KMS waits on -- before
> > > > sending
> > > > > >>> pageflip completion -- cannot be tied to a wl_buffer.release event. This means
> > that,
> > > > the
> > > > > >>> Guest compositor has to be forced to use a new buffer for its next repaint cycle
> > > > when it
> > > > > >>> gets a pageflip completion.
> > > > > >>
> > > > > >> Is that really the only solution?
> > > > > > [Kasireddy, Vivek] There are a few others I mentioned here:
> > > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_986572
> > > > > > But I think none of them are as compelling as this one.
> > > > > >
> > > > > >>
> > > > > >> If we fix the event timestamps so that both guest and host use the same
> > > > > >> timestamp, but then the guest starts 5ms (or something like that) earlier,
> > > > > >> then things should work too? I.e.
> > > > > >> - host compositor starts at (previous_frametime + 9ms)
> > > > > >> - guest compositor starts at (previous_frametime + 4ms)
> > > > > >>
> > > > > >> Ofc this only works if the frametimes we hand out to both match _exactly_
> > > > > >> and are as high-precision as the ones on the host side. Which for many gpu
> > > > > >> drivers at least is the case, and all the ones you care about for sure :-)
> > > > > >>
> > > > > >> But if the frametimes the guest receives are the no_vblank fake ones, then
> > > > > >> they'll be all over the place and this carefully tuned low-latency redraw
> > > > > >> loop falls apart. Aside fromm the fact that without tuning the guests to
> > > > > >> be earlier than the hosts, you're guaranteed to miss every frame (except
> > > > > >> when the timing wobbliness in the guest is big enough by chance to make
> > > > > >> the deadline on the oddball frame).
> > > > > > [Kasireddy, Vivek] The Guest and Host use different event timestamps as we don't
> > > > > > share these between the Guest and the Host. It does not seem to be causing any
> > other
> > > > > > problems so far but we did try the experiment you mentioned (i.e., adjusting the
> > > > delays)
> > > > > > and it works. However, this patch series is meant to fix the issue without having to
> > > > tweak
> > > > > > anything (delays) because we can't do this for every compositor out there.
> > > > >
> > > > > Maybe there could be a mechanism which allows the compositor in the guest to
> > > > automatically adjust its repaint cycle as needed.
> > > > >
> > > > > This might even be possible without requiring changes in each compositor, by
> > adjusting
> > > > the vertical blank periods in the guest to be aligned with the host compositor repaint
> > > > cycles. Not sure about that though.
> > > > >
> > > > > Even if not, both this series or making it possible to queue multiple flips require
> > > > corresponding changes in each compositor as well to have any effect.
> > > >
> > > > Yeah from all the discussions and tests done it sounds even with a
> > > > deeper queue we have big coordination issues between the guest and
> > > > host compositor (like the example that the guest is now rendering at
> > > > 90fps instead of 60fps like the host).
> > > [Kasireddy, Vivek] Oh, I think you are referring to my reply to Gerd. That 90 FPS vs
> > > 60 FPS problem is a completely different issue that is associated with Qemu GTK UI
> > > backend. With the GTK backend -- and also with SDL backend -- we Blit the Guest
> > > scanout FB onto one of the backbuffers managed by EGL.
> > >
> > > I am trying to add a new Qemu Wayland UI backend so that we can eliminate that Blit
> > > and thereby have a truly zero-copy solution. And, this is there I am running into the
> > > halved frame-rate issue -- the current problem.
> > 
> > Yes, that's what I referenced. But I disagree that it's a different
> > problem. The underlying problem in both cases is that the guest and host
> > compositor free-wheel instead of rendering in sync. It's just that
> > depending upon how exactly the flip completion event on the gues side
> > plays out you either get guest rendering that's faster than the host-side
> > 60fps, or guest rendering that's much slower than the host-side 60fps.
> [Kasireddy, Vivek] That used to be the case before we added a synchronization
> mechanism to the GTK UI backend that uses a sync file. After adding this
> and making the Guest wait until this sync file fd on the Host is signaled, we
> consistently get 60 FPS because the flip completion event for the Guest is
> directly tied to the signaling of the sync file in this particular case (GTK UI).
> 
> > 
> > The fundamental problem in both cases is that they don't run in lockstep.
> > If you fix that, through fixing the timestamp and even reporting most
> > likely, you should be able to fix both bugs.
> [Kasireddy, Vivek] GTK UI is an EGL based solution that Blits the Guest scanout
> FB onto one of the backbuffers managed by EGL. Wayland UI is a zero-copy
> solution that just wraps the dmabuf associated with Guest scanout FB in a 
> wl_buffer and submits it directly to the Host compositor. These backends are
> completely independent of each other and cannot be active at the same time.
> In other words, we cannot have zero-copy and Blit based solutions running
> parallelly. And, this issue is only relevant for Wayland UI backend and has 
> nothing to do with GTK UI. 
> 
> > 
> > > > Hence my gut feeling reaction that first we need to get these two
> > > > compositors aligned in their timings, which propobably needs
> > > > consistent vblank periods/timestamps across them (plus/minux
> > > > guest/host clocksource fun ofc). Without this any of the next steps
> > > > will simply not work because there's too much jitter by the time the
> > > > guest compositor gets the flip completion events.
> > > [Kasireddy, Vivek] Timings are not a problem and do not significantly
> > > affect the repaint cycles from what I have seen so far.
> > >
> > > >
> > > > Once we have solid events I think we should look into statically
> > > > tuning guest/host compositor deadlines (like you've suggested in a
> > > > bunch of places) to consisently make that deadline and hit 60 fps.
> > > > With that we can then look into tuning this automatically and what to
> > > > do when e.g. switching between copying and zero-copy on the host side
> > > > (which might be needed in some cases) and how to handle all that.
> > > [Kasireddy, Vivek] As I confirm here: https://gitlab.freedesktop.org/wayland/weston/-
> > /issues/514#note_984065
> > > tweaking the deadlines works (i.e., we get 60 FPS) as we expect. However,
> > > I feel that this zero-copy solution I am trying to create should be independent
> > > of compositors' deadlines, delays or other scheduling parameters.
> > 
> > That's not how compositors work nowadays. Your problem is that you don't
> > have the guest/host compositor in sync. zero-copy only changes the timing,
> > so it changes things from "rendering way too many frames" to "rendering
> > way too few frames".
> > 
> > We need to fix the timing/sync issue here first, not paper over it with
> > hacks.
> [Kasireddy, Vivek] What I really meant is that the zero-copy solution should be
> independent of the scheduling policies to ensure that it works with all compositors.
>  IIUC, Weston for example uses the vblank/pageflip completion timestamp, the
> configurable repaint-window value, refresh-rate, etc to determine when to start
> its next repaint -- if there is any damage:
> timespec_add_nsec(&output->next_repaint, stamp, refresh_nsec);
> timespec_add_msec(&output->next_repaint, &output->next_repaint, -compositor->repaint_msec);
> 
> And, in the case of VKMS, since there is no real hardware, the timestamp is always:
> now = ktime_get();
> send_vblank_event(dev, e, seq, now);

vkms has been fixed since a while to fake high-precision timestamps like
from a real display.

> When you say that the Guest/Host compositor need to stay in sync, are you 
> suggesting that we need to ensure that the vblank timestamp on the Host 
> needs to be shared and be the same on the Guest and a vblank/pageflip
> completion for the Guest needs to be sent at exactly the same time it is sent
> on the Host? If yes, I'd say that we do send the pageflip completion to Guest
> around the same time a vblank is generated on the Host but it does not help
> because the Guest compositor would only have 9 ms to submit a new frame
> and if the Host is running Mutter, the Guest would only have 2 ms.
> (https://gitlab.freedesktop.org/wayland/weston/-/issues/514#note_984341)

Not at the same time, but the same timestamp. And yes there is some fun
there, which is I think the fundamental issue. Or at least some of the
compositor experts seem to think so, and it makes sense to me.

> > 
> > Only, and I really mean only, when that shows that it's simply impossible
> > to hit 60fps with zero-copy and the guest/host fully aligned should we
> > look into making the overall pipeline deeper.
> [Kasireddy, Vivek] From all the experiments conducted so far and given the
> discussion associated with https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> I think we have already established that in order for a zero-copy solution to work 
> reliably, the Guest compositor needs to start its repaint cycle when the Host
> compositor sends a frame callback event to its clients.
> 
> > 
> > > > Only when that all shows that we just can't hit 60fps consistently and
> > > > really need 3 buffers in flight should we look at deeper kms queues.
> > > > And then we really need to implement them properly and not with a
> > > > mismatch between drm_event an out-fence signalling. These quick hacks
> > > > are good for experiments, but there's a pile of other things we need
> > > > to do first. At least that's how I understand the problem here right
> > > > now.
> > > [Kasireddy, Vivek] Experiments done so far indicate that we can hit 59 FPS consistently
> > > -- in a zero-copy way independent of compositors' delays/deadlines -- with this
> > > patch series + the Weston MR I linked in the cover letter. The main reason why this
> > > works is because we relax the assumption that when the Guest compositor gets a
> > > pageflip completion event that it could reuse the old FB it submitted in the previous
> > > atomic flip and instead force it to use a new one. And, we send the pageflip completion
> > > event to the Guest when the Host compositor sends a frame callback event. Lastly,
> > > we use the (deferred) out_fence as just a mechanism to tell the Guest compositor when
> > > it can release references on old FBs so that they can be reused again.
> > >
> > > With that being said, the only question is how can we accomplish the above in an
> > upstream
> > > acceptable way without regressing anything particularly on bare-metal. Its not clear if
> > just
> > > increasing the queue depth would work or not but I think the Guest compositor has to be
> > told
> > > when it can start its repaint cycle and when it can assume the old FB is no longer in use.
> > > On bare-metal -- and also with VKMS as of today -- a pageflip completion indicates
> > both.
> > > In other words, Vblank event is the same as Flip done, which makes sense on bare-metal.
> > > But if we were to have two events at-least for VKMS: vblank to indicate to Guest to start
> > > repaint and flip_done to indicate to drop references on old FBs, I think this problem can
> > > be solved even without increasing the queue depth. Can this be acceptable?
> > 
> > That's just another flavour of your "increase queue depth without
> > increasing the atomic queue depth" approach. I still think the underlying
> > fundamental issue is a timing confusion, and the fact that adjusting the
> > timings fixes things too kinda proves that. So we need to fix that in a
> > clean way, not by shuffling things around semi-randomly until the specific
> > config we tests works.
> [Kasireddy, Vivek] This issue is not due to a timing or timestamp mismatch. We
> have carefully instrumented both the Host and Guest compositors and measured
> the latencies at each step. The relevant debug data only points to the scheduling
> policy -- of both Host and Guest compositors -- playing a role in Guest rendering 
> at 30 FPS.

Hm but that essentially means that the events your passing around have an
even more ad-hoc implementation specific meaning: Essentially it's the
kick-off for the guest's repaint loop? That sounds even worse for a kms
uapi extension.

> > Iow I think we need a solution here which both slows down the 90fps to
> > 60fps for the blit case, and the 30fps speed up to 60fps for the zerocopy
> > case. Because the host might need to switch transparently between blt and
> > zerocopy for various reasons.
> [Kasireddy, Vivek] As I mentioned above, the Host (Qemu) cannot switch UI
> backends at runtime. In other words, with GTK UI backend, it is always Blit
> whereas Wayland UI backend is always zero-copy.

Hm ok, that at least makes things somewhat simpler. Another thing that I
just realized: What happens when the host changes screen resolution and
especially refresh rate?
-Daniel

> 
> Thanks,
> Vivek
> 
> > -Daniel
> > 
> > > Thanks,
> > > Vivek
> > > >
> > > > Cheers, Daniel
> > > >
> > > > >
> > > > >
> > > > > --
> > > > > Earthling Michel Dänzer               |               https://redhat.com
> > > > > Libre software enthusiast             |             Mesa and X developer
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
