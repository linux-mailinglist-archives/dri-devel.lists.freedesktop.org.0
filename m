Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677B6BE507
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E3410EEA6;
	Fri, 17 Mar 2023 09:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7544410EEA2;
 Fri, 17 Mar 2023 09:10:33 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f18so5653037lfa.3;
 Fri, 17 Mar 2023 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679044231;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DcxwPLMgH8TQvzlH8rslSljIPEdXp59TytSjgtEqxgE=;
 b=UXiNXVfzWXyugAmhGN4PL73XDWIJVmfNU2K5VaEQtO31gFlKYO2y3s/ZXpux8ZSOFl
 yr2LdOozjgxjpXJnO0DHi+PFh30H9Xma06doq7Y6OYny1ORI67GX8kpSKW4s9vfgtBZN
 /qfAANaSLsfBY6fVEHigttZMmc3pY33fpAaeQJ2xUzOenylk6ZlGGTsGNfCVw8tx5rWt
 Y0WA4AIOw+A0gwswwCLIQVzupbtt+/BV7D8M1LWh/0FV3HOJ4LarBbnHW0AV2Rx+o990
 VWbsGm8gAPF+RQ9sfqPUgg20IOk1dxeMQbr25EjZL8J70mMGlBff+5g25GTPbC14/0ZZ
 kY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679044231;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DcxwPLMgH8TQvzlH8rslSljIPEdXp59TytSjgtEqxgE=;
 b=TuVIz6etKGlCQ32i4AN3wiIWUQv1YKly29l1cPJ7vVgPRvqcRlULxaqG0NNSSRkrWa
 xH7YIl38n0MuaDFPzTHy3d3jyWqNiZG8jmEISxq3uyohIKaURM6llyaH7DSbg6XhqVbL
 q01khiyak6zuyDfP0paYfPczrMABYjuVp38mb3kAiV4RndMjotTLcgNh4A59N5ffw13B
 XsXTUh6sWMQWYDysKWV2n+VWrOud+ZCG7TQGcuNUaT8YvsreZW7HDVwm4qlQNwH/SvzW
 aWFmnjGYM+kzRt3oumtRv2gJuYoXpNqm5D5jY6RCXlZHyPIE3oiD12ikteioNrN6oOfp
 Wf0w==
X-Gm-Message-State: AO0yUKXkLvpZDQvWy2DRSHnWGtvpvezmnzDZ77/hVsXK1+Wj/qxWJebO
 KsnnK6rtJJT8jPIomCv5DWg=
X-Google-Smtp-Source: AK7set+oNmLKucfTTmZPZLKOwpJSCLRqf5YmI+zqSLnhx0Oex/d2yplo+kNj6JxqcI/WWfg2h7PmdA==
X-Received: by 2002:ac2:5f10:0:b0:4d8:4f46:f0b9 with SMTP id
 16-20020ac25f10000000b004d84f46f0b9mr3810695lfq.23.1679044231458; 
 Fri, 17 Mar 2023 02:10:31 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05651211c900b004d545f1e0ccsm275379lfr.187.2023.03.17.02.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 02:09:54 -0700 (PDT)
Date: Fri, 17 Mar 2023 11:09:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <20230317110921.0862cc8b@eldfell>
In-Reply-To: <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PQu+8_PwJg02nK.t.l_MdDX";
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
Cc: Rob Clark <robdclark@chromium.org>, DMA@freedesktop.org,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org,
	Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/PQu+8_PwJg02nK.t.l_MdDX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Mar 2023 23:22:24 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Thu, Mar 16, 2023 at 5:29=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote: =20
> > >
> > > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote: =20
> > > > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@gm=
ail.com> wrote: =20
> > > > >
> > > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote: =20
> > > > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jadah=
l@gmail.com> wrote: =20
> > > > > > >
> > > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote: =20
> > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > >
> > > > > > > > Add a way to hint to the fence signaler of an upcoming dead=
line, such as
> > > > > > > > vblank, which the fence waiter would prefer not to miss.  T=
his is to aid
> > > > > > > > the fence signaler in making power management decisions, li=
ke boosting
> > > > > > > > frequency as the deadline approaches and awareness of missi=
ng deadlines
> > > > > > > > so that can be factored in to the frequency scaling.
> > > > > > > >
> > > > > > > > v2: Drop dma_fence::deadline and related logic to filter du=
plicate
> > > > > > > >     deadlines, to avoid increasing dma_fence size.  The fen=
ce-context
> > > > > > > >     implementation will need similar logic to track deadlin=
es of all
> > > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > > v6: More docs
> > > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > > >
> > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > > --- =20
> > > > > > >
> > > > > > > Hi Rob!
> > > > > > > =20
> > > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++=
++++++++++++
> > > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > > >  3 files changed, 87 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documen=
tation/driver-api/dma-buf.rst
> > > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > >     :doc: fence signalling annotation
> > > > > > > >
> > > > > > > > +DMA Fence Deadline Hints
> > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > +
> > > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > +   :doc: deadline hints
> > > > > > > > +
> > > > > > > >  DMA Fences Functions Reference
> > > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > >
> > > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/=
dma-fence.c
> > > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_=
fence **fences, uint32_t count,
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * DOC: deadline hints
> > > > > > > > + *
> > > > > > > > + * In an ideal world, it would be possible to pipeline a w=
orkload sufficiently
> > > > > > > > + * that a utilization based device frequency governor coul=
d arrive at a minimum
> > > > > > > > + * frequency that meets the requirements of the use-case, =
in order to minimize
> > > > > > > > + * power consumption.  But in the real world there are man=
y workloads which
> > > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > > + *
> > > > > > > > + * * Workloads that ping-pong between device and CPU, with=
 alternating periods
> > > > > > > > + *   of CPU waiting for device, and device waiting on CPU.=
  This can result in
> > > > > > > > + *   devfreq and cpufreq seeing idle time in their respect=
ive domains and in
> > > > > > > > + *   result reduce frequency.
> > > > > > > > + *
> > > > > > > > + * * Workloads that interact with a periodic time based de=
adline, such as double
> > > > > > > > + *   buffered GPU rendering vs vblank sync'd page flipping=
.  In this scenario,
> > > > > > > > + *   missing a vblank deadline results in an *increase* in=
 idle time on the GPU
> > > > > > > > + *   (since it has to wait an additional vblank period), s=
ending a signal to
> > > > > > > > + *   the GPU's devfreq to reduce frequency, when in fact t=
he opposite is what is
> > > > > > > > + *   needed. =20
> > > > > > >
> > > > > > > This is the use case I'd like to get some better understandin=
g about how
> > > > > > > this series intends to work, as the problematic scheduling be=
havior
> > > > > > > triggered by missed deadlines has plagued compositing display=
 servers
> > > > > > > for a long time.
> > > > > > >
> > > > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL dr=
iver
> > > > > > > developer, so I will need some hand holding when it comes to
> > > > > > > understanding exactly what piece of software is responsible f=
or
> > > > > > > communicating what piece of information.
> > > > > > > =20
> > > > > > > > + *
> > > > > > > > + * To this end, deadline hint(s) can be set on a &dma_fenc=
e via &dma_fence_set_deadline.
> > > > > > > > + * The deadline hint provides a way for the waiting driver=
, or userspace, to
> > > > > > > > + * convey an appropriate sense of urgency to the signaling=
 driver.
> > > > > > > > + *
> > > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOT=
ONIC for userspace
> > > > > > > > + * facing APIs).  The time could either be some point in t=
he future (such as
> > > > > > > > + * the vblank based deadline for page-flipping, or the sta=
rt of a compositor's
> > > > > > > > + * composition cycle), or the current time to indicate an =
immediate deadline
> > > > > > > > + * hint (Ie. forward progress cannot be made until this fe=
nce is signaled). =20
> > > > > > >
> > > > > > > Is it guaranteed that a GPU driver will use the actual start =
of the
> > > > > > > vblank as the effective deadline? I have some memories of sei=
ng
> > > > > > > something about vblank evasion browsing driver code, which I =
might have
> > > > > > > misunderstood, but I have yet to find whether this is somethi=
ng
> > > > > > > userspace can actually expect to be something it can rely on.=
 =20
> > > > > >
> > > > > > I guess you mean s/GPU driver/display driver/ ?  It makes thing=
s more
> > > > > > clear if we talk about them separately even if they happen to b=
e the
> > > > > > same device. =20
> > > > >
> > > > > Sure, sorry about being unclear about that.
> > > > > =20
> > > > > >
> > > > > > Assuming that is what you mean, nothing strongly defines what t=
he
> > > > > > deadline is.  In practice there is probably some buffering in t=
he
> > > > > > display controller.  For ex, block based (including bandwidth
> > > > > > compressed) formats, you need to buffer up a row of blocks to
> > > > > > efficiently linearize for scanout.  So you probably need to lat=
ch some
> > > > > > time before you start sending pixel data to the display.  But d=
etails
> > > > > > like this are heavily implementation dependent.  I think the mo=
st
> > > > > > reasonable thing to target is start of vblank. =20
> > > > >
> > > > > The driver exposing those details would be quite useful for users=
pace
> > > > > though, so that it can delay committing updates to late, but not =
too
> > > > > late. Setting a deadline to be the vblank seems easy enough, but =
it
> > > > > isn't enough for scheduling the actual commit. =20
> > > >
> > > > I'm not entirely sure how that would even work.. but OTOH I think y=
ou
> > > > are talking about something on the order of 100us?  But that is a b=
it
> > > > of another topic. =20
> > >
> > > Yes, something like that. But yea, it's not really related. Scheduling
> > > commits closer to the deadline has more complex behavior than that to=
o,
> > > e.g. the need for real time scheduling, and knowing how long it usual=
ly
> > > takes to create and commit and for the kernel to process. =20
>=20
> Vblank can be really long, especially with VRR where the additional
> time you get to finish the frame comes from making vblank longer.
> Using the start of vblank as a deadline makes VRR useless. It really
> would be nice to have some feedback about the actual deadline from the
> kernel, maybe in `struct drm_event_vblank`.

Hi Sebastian,

why would deadline at vblank beginning not be exactly what you want
also with VRR?

Let's say the frame misses that deadline on a VRR system, but the frame
still completes and the flip makes it to the intended scanout cycle,
thanks to VRR giving it more time. Why should that miss not be
classified as a miss?

If it is classified as a miss, then GPU freq and whatnot will be
increased, which will increase the effective update rate of VRR.

If it is not classified as a miss, then GPU might not speed up, and you
end up with low update rate, even though you still don't skip scanout
cycles thanks to VRR.

I guess if you actually *want* VRR to run at a low rate in order to
keep the GPU in a lower power demand, you could compute your "late
deadline" from the minimum rate VRR timings, subtracting the vblank
period from the estimated next flip completion timestamp?


Thanks,
pq

--Sig_/PQu+8_PwJg02nK.t.l_MdDX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQULkEACgkQI1/ltBGq
qqcflQ/7Bcf2sjwi33//OE29jdqtYajW5YPQL7aC7KSwacbDqXPeh3Yq/4wsqmAg
pJLB+4rwZsxeo6D+SuXPyr+pSqKWG/Q881QWtwUTHxg5eCiJzwf+AwgCFvQsgkag
JbjXnmWjufzV4CGiO/cAHBPVyfAwZ65xNRno6YcnL5cqqmL7I+qUNTecFn/qaB1j
BFSX1E+/U3p7uxp8LmwkNMaL/ZrnITDXJq9ikHmseXdvL/6UVYjFhbkq4+xV+P3R
3oYqmwz/k6IsXmTk47vh62yvTJhseo77JgI/GR7jtynX77+lrCfe3KSIwONhpI0o
jWFV9Csdin/rJiIAe6lfMuGOO5zt9H5qIRS7nQyoThX6u1PpwOZuMWzcMNpYilFu
DF5rcSIK0u2TdnsKJjQAjW7N5fpTENYdHxhMvjsYAht5nx3jEev6zN6Xr8MXA0PE
3y+BL4NIX6sRmr3CDao4vzE3/MTyLNGnVRu8dpQedIgcRsFfN0H3ZITJ2+4oo2Re
3GgTXaZFViaJYmlH9tyuzi7gj/GZWfN0J/A6RET5NGRfAIhQvWjb/QFR5ixPpP7z
k35cKda/TDToFacWKzhUXOk+tCxvUaIcBTYd3ZGXfF++4asGXF+P5ZOK5aeTGNoi
E2xSiSRFngaeawwANXrLib5DhW0jgc8VgxKXjdFNFz3Jp6d8BSc=
=n4+V
-----END PGP SIGNATURE-----

--Sig_/PQu+8_PwJg02nK.t.l_MdDX--
