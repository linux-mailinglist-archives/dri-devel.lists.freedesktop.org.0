Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02B3DA5C0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 16:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839336EDB9;
	Thu, 29 Jul 2021 14:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E4A6EDB4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:10:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r26so11331546lfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=KVeYIfkluOzJAUxQ6fjcXqXMAp11NPT9x26kXkIM9wM=;
 b=SibX58LSiD/u9dKbhKcen8rE9n01FSntjvE2TxKqEcW2rFX9Rt6nvzAE8k8r99xb/V
 oqjW9FKWnW+lx3snEEYci0yJvw9NfhxPihfbS9MuqVXkrq2HlDaN1aOXxhmoT0gdVsF6
 b246hzmGTC1ofMmgBlZNmBT2pRLY0QDOL9Q/h3JPMHK7Z6x9QYGPESqlUjYgh9NlIvTQ
 Xf6Lkpo6Qj5aIuq1/vb6gUtF6VidmI1x8Kp15X3GfjnvQOGKE5P21wO/o1C8KeSGRf81
 g+ODBffQ5zbZ7qCz6jX7YvyI72ca9iRlBEHZW18WX55fc1VWGecNq5xh8cRCJ5YMshXr
 nPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=KVeYIfkluOzJAUxQ6fjcXqXMAp11NPT9x26kXkIM9wM=;
 b=oyITDTAmtKlOXz5Z4vxDjO3msMlrT0mBiUCAaUxBmyd6XLHU1D2nig+PZ9uTm5i3re
 n2E4Bu9ySrfH50r8o8b2jBM9v778Fu8dx7yeRj8E6LoufglWdPJ6eY7R8JKOEGDjz+ai
 KOoUbUIuW8IaoJLvrL1PdU6zJIpBULHijf/7W+1dhYTfsYUBqyQfbJ1yehwIRXelumUK
 oEARHTnaS9LDa7pYWf1Ggo7NtXxanwz2BMCfFMdNV2l2R/E/S8R9RA4sAxzxeA574J0c
 JEp6eKGR3LaAC+yPzq2ebsOQyBet9mW9x965Ue9WfRJUfS4CIE52rRGVINO5AxF6OjhE
 73eA==
X-Gm-Message-State: AOAM532EEN95OEflsL2DtuYqIuX6Xzq02COH0jthYC2uXL8sgKkDVbMZ
 fB9mVMACZg92ZOgvH4O6/iQ=
X-Google-Smtp-Source: ABdhPJz9Eq4IckwXHS1EzovDJ5oWEjCbWpskXZEWqWPysT2uNlbZuJPI2mO19uvMvjAZbLjG37InoA==
X-Received: by 2002:a05:6512:511:: with SMTP id
 o17mr3919872lfb.396.1627567821084; 
 Thu, 29 Jul 2021 07:10:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f14sm170210ljj.116.2021.07.29.07.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 07:10:20 -0700 (PDT)
Date: Thu, 29 Jul 2021 17:10:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729171017.25441c00@eldfell>
In-Reply-To: <11692377-acae-696a-bbeb-9921a6f5d905@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
 <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
 <20210729140024.6a635be4@eldfell>
 <c090d320-7f2c-3858-d978-7a6f6e8001c0@amd.com>
 <20210729154917.5e664b24@eldfell>
 <11692377-acae-696a-bbeb-9921a6f5d905@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N=FJlttKm+gC6bUtDikG7jt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/N=FJlttKm+gC6bUtDikG7jt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 15:41:09 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 29.07.21 um 14:49 schrieb Pekka Paalanen:
> > On Thu, 29 Jul 2021 13:43:20 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Am 29.07.21 um 13:00 schrieb Pekka Paalanen: =20
> >>> On Thu, 29 Jul 2021 12:14:18 +0200
> >>> Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>    =20
> >>>> Am 29.07.21 um 11:15 schrieb Pekka Paalanen: =20
> >>>>> If the app happens to be frozen (e.g. some weird bug in fence handl=
ing
> >>>>> to make it never ready, or maybe it's just bugged itself and never
> >>>>> drawing again), then the app is frozen, and all the rest of the des=
ktop
> >>>>> continues running normally without a glitch. =20
> >>>> But that is in contradict to what you told me before.
> >>>>
> >>>> See when the window should move but fails to draw it's new content w=
hat
> >>>> happens?
> >>>>
> >>>> Are the other windows which would be affected by the move not drawn =
as well? =20
> >>> No, all the other windows will continue behaving normally just like
> >>> they always did. It's just that one frozen window there that won't
> >>> update; it won't resize, so there is no reason to move that other
> >>> window either.
> >>>
> >>> Everything continues as if the frozen window never even sent anything
> >>> to the compositor after its last good update.
> >>>
> >>> We have a principle in Wayland: the compositor cannot afford to wait
> >>> for clients, the desktop as a whole must remain responsive. So there =
is
> >>> always a backup plan even for cases where the compositor expects the
> >>> client to change something. For resizes, in a floating-window manager
> >>> it's easy: just let things continue as they are; in a tiling window
> >>> manager they may have a timeout after which... whatever is appropriat=
e.
> >>>
> >>> Another example: If a compositor decides to make a window maximized, =
it
> >>> tells the client the new size and state it must have. Until the client
> >>> acks that specific state change, the compositor will continue managing
> >>> that window as if nothing changed. Given the asynchronous nature of
> >>> Wayland, the client might even continue submitting updates
> >>> non-maximized for a while, and that will go through as if the
> >>> compositor didn't ask for maximized. But at some point the client acks
> >>> the window state change, and from that point on if it doesn't behave
> >>> like maximized state requires, it will get a protocol error and be
> >>> disconnected. =20
> >> Yeah and all of this totally makes sense.
> >>
> >> The problem is that not forwarding the state changes to the hardware
> >> adds a CPU round trip which is rather bad for the driver design,
> >> especially power management.
> >>
> >> E.g. when you submit the work only after everybody becomes available t=
he
> >> GPU becomes idle in between and might think it is a good idea to reduce
> >> clocks etc... =20
> > Everybody does not need to be available. The compositor can submit its
> > work anyway, it just uses old state for some of the windows.
> >
> > But if everybody happens to be ready before the compositor repaints,
> > then the GPU will be idle anyway, whether the compositor looked at the
> > buffer readyness at all or not. =20
>=20
> Ok good point.
>=20
> > Given that Wayland clients are not expected (but can if they want) to
> > draw again until the frame callback which ensures that their previous
> > frame is definitely going to be used on screen, this idling of GPU
> > might happen regularly with well-behaved clients I guess? =20
>=20
> Maybe I wasn't clear what the problem is: That the GPU goes idle is=20
> expected, but it should it should just not go idle multiple times.
>=20
> > The aim is that co-operative clients never draw a frame that will only
> > get discarded.
> > =20
> >> How about doing this instead:
> >>
> >> 1. As soon as at least one window has new committed state you submit t=
he
> >> rendering.
> >>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 As far as I understand it that=
 is already the case anyway. =20
> > At least Weston does not work like that. Doing that means that the
> > first client to send a new frame will lock all other client updates out
> > of that update cycle.
> >
> > Hence, a compositor usually waits until some point before the target
> > vblank before it starts the repaint, which locks the window state in
> > place for the frame. =20
>=20
> Uff, that means we have lost this game anyway.
>=20
> See you get the best energy utilization if the hardware wakes up as few=20
> as possible and still get everything done.
>=20
> So what happens in the case you describes is that the hardware comes out=
=20
> of sleep at least twice, once for the client and once for the server=20
> which is rather sub optimal.

I can see the point, but what do we know about its significance?

If the alternative is the first-to-win and everyone else gets postponed
by another full refresh cycle, isn't that worse? It could even cause
jitter rather than just "high" latency to screen.

Is there any approach that would not have either disadvantage?

Here is an analysis of why Weston does what it does right now (the new
algorithm):
https://ppaalanen.blogspot.com/2015/02/weston-repaint-scheduling.html


Are we talking about desktops in general, or games, or fullscreen use
case?

It's not unthinkable to have a different compositor scheduling policy
for outputs that happen have only one fullscreen window.

> > Any client update could contain window state changes that prevents the
> > GPU from choosing the content buffer to use.
> > =20
> >> 2. Before starting rendering the hardware driver waits with a timeout
> >> for all the window content to become ready.
> >>   =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 The timeout is picked in a way=
 so that we at least reach a
> >> reasonable fps. Making that depending on the maximum refresh rate of t=
he
> >> display device sounds reasonable to me.
> >>
> >> 3a. If all windows become ready on time we draw the frame as expected.
> >> 3b. If a timeout occurs the compositor is noted of this and goes on a
> >> fallback path rendering only the content known to be ready. =20
> > Sounds like the fallback path, where the compositor's rendering is
> > already late, would need to re-do all the rendering with an extremely
> > tight schedule just before the KMS submission deadline. IOW, when
> > you're not going to make it in time, you have to do even more work and
> > ping-pong even more between CPU and GPU after being a bit late already.
> > Is that really a good idea? =20
>=20
> My idea is that both the fallback path and the normal rendering are=20
> submitted at the same time, just with a big if/then/else around it. E.g.=
=20
> the timeout happens on the GPU hardware and not on the CPU.

So for every refresh, the compositor needs to prepare a combinatorial
explosion number of possible compositions to be rendered?

Or do we have the assumption that everything we talk about here is
conditional to not having any window state changes other than content
change?

Remember the example where one window is pending a resize, and if/when
that happens another window needs to move.

> But I think that stuff is just to complicated to implement.
>=20
> I want to describe once more what the ideal configuration would be:
> 1. When you render a frame one or more clients submit jobs to the hardwar=
e.
> 2. Those jobs then execute on the hardware asynchronously to the CPU.
> 3. At the same time the CPU prepares a composition job which takes all=20
> the window content from clients and renders a new frame.
> 4. This new frame gets submitted to the hardware driver as new content=20
> on the screen.
> 5. The hardware driver waits for all the rendering to be completed and=20
> flips the screen.

I believe this is what happens right now, when compositors do not take
into account that client buffers might not be ready, with the problem
that any client GPU job that takes ages will stall the whole desktop's
refresh.

>=20
> The idea is that you have only one block of activity on the hardware,=20
> e.g. something like this:
> _------------_______flip_-------------_____flip.....
>=20
>=20
> But what happens with Wayland currently is that you end up with:
> _--------_______-__flip_------------___-__flip.....
>=20
>=20
> Or even worse when you have multiple clients rendering at random times:
> _---_---_---____-__flip_---_---_---___-__flip.....
>=20
>=20
> I'm actually not that of a power management guy, but it is rather=20
> obvious that this is not optimal.

Possibly, but I haven't seen anyone come up with a better plan given the
constraints that Wayland window state management raises.

Seems like it all boils down to the fundamental trade-off between
latency and throughput, or latency and power efficiency.


Thanks,
pq

>=20
> Regards,
> Christian.
>=20
>=20
> > It also means the compositor cannot submit the KMS atomic commit until
> > the GPU is done or timed out the compositing job, which is another
> > GPU-CPU ping-pong.
> > =20
> >> 4. Repeat.
> >>
> >> This way we should be able to handle all use cases gracefully, e.g. the
> >> hanging client won't cause the server to block and when everything
> >> becomes ready on time we just render as expected. =20
> >
> > Thanks,
> > pq =20
>=20


--Sig_/N=FJlttKm+gC6bUtDikG7jt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECtskACgkQI1/ltBGq
qqeyCxAAqLOHHDzFwFh3JAIeQEv/9ke1qU3yRiT/1w17VwnHKJCG0HAWyyAGUFy2
ggW++JIjPye1ZT6LbdDJcLNbDsOXuhnwdxjy4lRLcjHVVMT78lsH+ATQ05UZU9bF
8x/yzj0YV6LYRGpNB6unqs3nu+/B41TyNB9fVRjW0XwfRUdEnC7JYpJFdJd7GeTI
QOLsoGSk0rqMhKX5lF/n01qhofipb+hLNAuo4sgiuqRbKXmhTcmKRh4/CqC4NsPc
SIUG3tjNeIkmo6+OEhCXgCTjSC3pd5LUY/Gqt+Zuny/+CD4eFilOqo1huKhIbk66
gCCCeOxhoAOLGsJi0VG4GxIChIKWj38ORpMWS4ZTh1GUlzXNdyErhNnxyZt7Okr/
ukhuHFMH/TYr+8N+EkhvMzuuHke2YeJU9b8FsuW7PGPnBbUDOLytVZlVLapOEofc
LvCO5d5LQaVAd7piW8Fc4P194w+98FgmEmL435QUtdI+6/Y5GyWCvBaUKC+3IiSn
LAAMtAGEuxuVDBKjbjhlNOu8pRhhHI8w44weaB2geYR47+3pGQq1S9F0FOd0vFTR
tjrtLl0uW6tDDtsqSKhPTtdpGNrUyvLJ+13NO3uXyxMblIbMo1Sn4CswsA/y+Qaa
KSscxUDPqHMC//8kiQSGnIghhsLMP8aSdLCfsv5YSMQ4RaBdmaE=
=itZY
-----END PGP SIGNATURE-----

--Sig_/N=FJlttKm+gC6bUtDikG7jt--
