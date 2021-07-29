Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AD3DA057
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E488E6E0BA;
	Thu, 29 Jul 2021 09:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1653D6E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:37:38 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z2so9863785lft.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6xYM4GghZ+EWYpy/lB2lIDcHjit5HTkWG+vusYrCG34=;
 b=fKd2NfmDRuGgsfANpWiZ8LPYBSckk7wlLspAL3Q3oeZo6tQXztKf/eJKik7rQZdQbs
 BfO8wDXQkh4KrCCWaN+JvKgiB5RuajD6hHij6m9uskz8Ehy0LCeLO5MO6R60DjncTQig
 Hx7BgOWCSggEzWGWK/Ro6cRN4+KKlRXxxHR/7hltEmX+VtUJTXolbAIQopapG4tAzkQG
 ZyD9Y5uufCjYME2JfE9et3hw4/+qN0nduqibrZv3hK+M+y97S1hyD1fL0ydaSvKZNjuw
 MoCJypeyLsw4wH4FqgPumTj6e1FIABQPUHkPf139CULzllA71LyNecilC307IrsPqGAa
 CRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6xYM4GghZ+EWYpy/lB2lIDcHjit5HTkWG+vusYrCG34=;
 b=Mdo3/jQjxXS6IDpM6f1qNarBYMb3rcyo86l7p0B0sE+8eTP8PohM3zTJq1k6Qrcto/
 r6mWFeWtHSBJZsV3MzZbq0eb433hcJS9q4j1Of08wR8YyP7HmG7UkrzfFCCzpX9Unwb3
 aiyBeSR5VhQ4HJh4NM6XXeU9T3G64Ab+Wcyoq6RMyfF3ZprKcYxAG9ZkX9be8cLBDpi+
 pXiUqcY/+TMtLBIjaz3rDNoeO5oeNuGUgXdIpemkLlhuJXPVMxur2hhSwXaFqRCIKct9
 7VgfOxy5VuXS8pFVhJtsW0W2Rvf1ic8ygnOULvg9oYn6h3I5SJeDhYxG3uZijam5j056
 JOww==
X-Gm-Message-State: AOAM532F98F/64NZ4mdU5CgOlo3pUDsE9kQSdNOsLZbuW2uW3vHoPJlE
 KflpixG7RZxc3LfWn1xt5ss=
X-Google-Smtp-Source: ABdhPJxCs8NcaPvaP0Xjj6sO4ElOk0rtGYSxBdIazOQL9C2hrydCXH9csX65rJ6/A1hqof5/sGVZhQ==
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1991239lfi.543.1627551456305; 
 Thu, 29 Jul 2021 02:37:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f20sm128775lfv.236.2021.07.29.02.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 02:37:36 -0700 (PDT)
Date: Thu, 29 Jul 2021 12:37:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729123732.3259a9bf@eldfell>
In-Reply-To: <YQJu6AqKn7bdT1li@phenom.ffwll.local>
References: <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <CAF6AEGu409eY9xznTAaBf2ZDcV_AaDELUzN2afWgiHwB_uBwqg@mail.gmail.com>
 <YQJUKXgf/Q957fmy@phenom.ffwll.local>
 <ff394f2b-b555-e80f-b685-d0d59e2bbe67@daenzer.net>
 <YQJu6AqKn7bdT1li@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C/IUA+I6gnX4XYpXMYZQgHZ";
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
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/C/IUA+I6gnX4XYpXMYZQgHZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Jul 2021 11:03:36 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jul 29, 2021 at 10:17:43AM +0200, Michel D=C3=A4nzer wrote:
> > On 2021-07-29 9:09 a.m., Daniel Vetter wrote: =20
> > > On Wed, Jul 28, 2021 at 08:34:13AM -0700, Rob Clark wrote: =20
> > >> On Wed, Jul 28, 2021 at 6:24 AM Michel D=C3=A4nzer <michel@daenzer.n=
et> wrote: =20
> > >>> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote: =20
> > >>>> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer: =20
> > >>>>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote: =20
> > >>>>>> Am 27.07.21 um 17:37 schrieb Rob Clark: =20
> > >>>>>>> On Tue, Jul 27, 2021 at 8:19 AM Michel D=C3=A4nzer <michel@daen=
zer.net> wrote: =20
> > >>>>>>>> On 2021-07-27 5:12 p.m., Rob Clark wrote: =20
> > >>>>>>>>> On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <michel@da=
enzer.net> wrote: =20
> > >>>>>>>>>> On 2021-07-27 1:38 a.m., Rob Clark wrote: =20
> > >>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> > >>>>>>>>>>>
> > >>>>>>>>>>> Based on discussion from a previous series[1] to add a "boo=
st" mechanism
> > >>>>>>>>>>> when, for example, vblank deadlines are missed.  Instead of=
 a boost
> > >>>>>>>>>>> callback, this approach adds a way to set a deadline on the=
 fence, by
> > >>>>>>>>>>> which the waiter would like to see the fence signalled.

...

> > I'm not questioning that this approach helps when there's a direct
> > chain of fences from the client to the page flip. I'm pointing out
> > there will not always be such a chain.
> >=20
> >  =20
> > >> But maybe the solution to make this also useful for mutter =20
> >=20
> > It's not just mutter BTW. I understand gamescope has been doing
> > this for some time already. And there seems to be consensus among
> > developers of Wayland compositors that this is needed, so I expect
> > at least all the major compositors to do this longer term.
> >=20
> >  =20
> > >> is to, once we have deadline support, extend it with an ioctl to
> > >> the dma-fence fd so userspace can be the one setting the
> > >> deadline. =20
> >=20
> > I was thinking in a similar direction.
> >  =20
> > > atomic ioctl with TEST_ONLY and SET_DEADLINES? Still gives mutter
> > > the option to bail out with an old frame if it's too late? =20
> >=20
> > This is a bit cryptic though, can you elaborate? =20
>=20
> So essentially when the mutter compositor guesstimator is fairly
> confident about the next frame's composition (recall you're keeping
> track of clients to estimate their usual latency or something like
> that), then it does a TEST_ONLY commit to check it all works and prep
> the rendering, but _not_ yet fire it off.
>=20
> Instead it waits until all buffers complete, and if some don't, pick
> the previous one. Which I guess in an extreme case would mean you
> need a different window tree configuration and maybe different
> TEST_ONLY check and all that, not sure how you solve that.
>=20
> Anyway, in that TEST_ONLY commit my idea is that you'd also supply
> all the in-fences you expect to depend upon (maybe we need an
> additional list of in-fences for your rendering job), plus a deadline
> when you want to have them done (so that there's enough time for your
> render job still). And the kernel then calls dma_fence_set_deadline
> on all of them.
>=20
> Pondering this more, maybe a separate ioctl is simpler where you just
> supply a list of in-fences and deadlines.
>=20
> The real reason I want to tie this to atomic is for priviledge
> checking reasons. I don't think normal userspace should have the
> power to set arbitrary deadlines like this - at least on i915 it will
> also give you a slight priority boost and stuff like that, to make
> sure your rendering for the current frame goes in ahead of the next
> frame's prep work.
>=20
> So maybe just a new ioctl that does this which is limited to the
> current kms owner (aka drm_master)?

Yeah.

Why not have a Wayland compositor *always* "set the deadlines" for the
next screen update as soon as it gets the wl_surface.commit with the
new buffer and fences (a simplified description of what is actually
necessary to take a new window state set into use)?

The Wayland client posted the frame to the compositor, so surely it
wants it ready and displayed ASAP. If we happen to have a Wayland frame
queuing extension, then also take that into account when setting the
deadline.

Then, *independently* of that, the compositor will choose which frames
it will actually use in its composition when the time comes.

No need for any KMS atomic commit fiddling, userspace just explicitly
sets the deadline on the fence and that's it. You could tie the
privilege of setting deadlines to simply holding DRM master on whatever
device? So the ioctl would need both the fence and any DRM device fd.

A rogue application opening a DRM device and becoming DRM master on it
just to be able to abuse deadlines feels both unlikely and with
insignificant consequences. It stops the obvious abuse, and if someone
actually goes the extra effort, then so what.


Thanks,
pq

--Sig_/C/IUA+I6gnX4XYpXMYZQgHZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECdtwACgkQI1/ltBGq
qqd+/Q//ZYD8WK6x/5Agqh3t65cNNGvUOOxWmEt+OuP3R7ZxCK/EAgUACoWBeY9l
5oMQhlI9VfKhLnTgyRFAc/aODza8MAMaKhDtvOeoD5Z5zRWomlqvST+RQ0dF5oB3
ElRWxP1GTfZSs2VV+ocLmSDSmufV8wyWO3tQbmbRtnKmggNHNDA7DsWhnCHsjxKb
KNgaSZ1jIXeZpaML03y/oTDVNj9P11hJFYctECQyTtSIQPv5W9A5axRYKnZ518H3
NaH+IrOOINWDRGy1IqhL800IscxQLnkc5obo6FpADzS0MUBTvbC76EEtCRBOyhAr
sAQhev4E+RVutRWDdhr0vAWlNLXOD4lnWofIG/x0QWp2TBOQ+B9KZXYc3nQlDF6i
sQzrA1jRrmB1NsKqJ2c0ulX8ZMSYGmuuOUciNf6MwTQwJe72bKQw4c43DMFFpTFs
d4tPG9CCELezI7vR7xZgCrJHrI4RLimOhEaJUhruRyUwIjiWt09YOHsFrmI/3GxL
FDKPwcj35C/4vgx6aO/e4GZD3OCWbZ7ubjgfJ20kN+g2qukZ5L1cU1pOeLeUjzUh
IUA2+sXRRapyrSnZXAQl0t3MpB+u2ImaXw4Vf0O5QXbBKO3/n1MWqNUZJmcGNwYc
Mbae8E5OSG6SaWgC1j4DGmFPwuRnrql//VeIvP4dnvhCW3BLH3Y=
=xPrl
-----END PGP SIGNATURE-----

--Sig_/C/IUA+I6gnX4XYpXMYZQgHZ--
