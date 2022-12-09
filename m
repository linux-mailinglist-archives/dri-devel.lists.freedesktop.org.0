Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AB648026
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 10:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3461910E504;
	Fri,  9 Dec 2022 09:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FFA10E504
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 09:32:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 1so6142426lfz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 01:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oBdOhyWntKFG7A7buaQENCm2gJ4+Uao0OtTP8lGjEYk=;
 b=Pt1tN4LLjM3pQdMO6+3KGfQD0ui5OO9swavw/W05uifn6444OrMkD80QqunlIdbg0b
 lrL5hmTo1LZNv5bosX0pHD42JwDmSm6Plg9G1vTpf39wiHL2IX4ikrdwmhP88tY9IFkQ
 RlMQXzTX52EK4x+n9hdegrGjbDNZdejhMI/iI5hTVNCWwO1bvV/9ZIgJzTHV7irAHs3L
 OnqaYcK6rUa20SJ7iZM1GNEfeRUTF37Ah8sIzd/wGm83RyMN2N6lb6GylOpbZj2Yhp6m
 qqfRgK8drCgBYe6MpdGJbQ1RASoobdmVP21oaewIDKIMNCPC6ZYZ3JP851g0M8dpwMFm
 nWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBdOhyWntKFG7A7buaQENCm2gJ4+Uao0OtTP8lGjEYk=;
 b=nD9BfOBje82sBxOePN2SOAdxZNgTg+9oibr7WzJmlTUJfqCXUXXHUiZSQzk5Q09zEH
 r1rbhRqu5XaabxZ+5oNpv7kAQCf6yM14bF3L7ERySPQInwRTKYLocYofOaEXs80xW6DI
 HP8XcmNCWbbMJ2pdlHgdEB0sW4BtMMWDYKWgaGxp2U6STGBDRJDBU5NeDGkypTy1JuI8
 zBzvWDuXUTfqpqKvDyMeAR1AafpkHPZSte3G8HyRRHK81GVOh2AaaDr4mkIHQJ39CwjA
 wPb3YOdl5Pmk3+rehTLCis2DLuzQDlN9jOhWGOt/J25n/OTpqnXFtwlT0RgyCxDwOc5Q
 Lv8w==
X-Gm-Message-State: ANoB5pl3K6/Q4gVBoePg1A4VLZpUtEttUKk/gGpOwGSzJRzE8UXvRo3J
 4PW4syIpsW2a4420eQRwDzY=
X-Google-Smtp-Source: AA0mqf5FAG9RMuqHBYYGt13U3LScyBDaOHnpfHLdwXQlIrpc2hgxZULYt2E01CJa10sDmf7nLfXnNw==
X-Received: by 2002:a05:6512:2622:b0:4b5:41fa:69d8 with SMTP id
 bt34-20020a056512262200b004b541fa69d8mr2231721lfb.16.1670578326379; 
 Fri, 09 Dec 2022 01:32:06 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056512324600b004ab52b0bcf9sm181105lfr.207.2022.12.09.01.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 01:32:06 -0800 (PST)
Date: Fri, 9 Dec 2022 11:32:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <20221209113202.234b413a@eldfell>
In-Reply-To: <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
 <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yutxZO4OuBJeupqc9eAt.=X";
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/yutxZO4OuBJeupqc9eAt.=X
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Dec 2022 17:26:06 +0900
Tomasz Figa <tfiga@chromium.org> wrote:

> On Mon, Dec 5, 2022 at 5:29 PM Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> >
> > Hi Tomasz,
> >
> > Am 05.12.22 um 07:41 schrieb Tomasz Figa: =20
> > > [SNIP] =20
> > >> In other words explicit ownership transfer is not something we would
> > >> want as requirement in the framework, cause otherwise we break tons =
of
> > >> use cases which require concurrent access to the underlying buffer.
> > >>
> > >> When a device driver needs explicit ownership transfer it's perfectly
> > >> possible to implement this using the dma_fence objects mentioned abo=
ve.
> > >> E.g. drivers can already look at who is accessing a buffer currently=
 and
> > >> can even grab explicit ownership of it by adding their own dma_fence
> > >> objects.
> > >>
> > >> The only exception is CPU based access, e.g. when something is writt=
en
> > >> with the CPU a cache flush might be necessary and when something is =
read
> > >> with the CPU a cache invalidation might be necessary.
> > >> =20
> > > Okay, that's much clearer now, thanks for clarifying this. So we
> > > should be covered for the cache maintenance needs originating from CPU
> > > accesses already, +/- the broken cases which don't call the begin/end
> > > CPU access routines that I mentioned above.
> > >
> > > Similarly, for any ownership transfer between different DMA engines,
> > > we should be covered either by the userspace explicitly flushing the
> > > hardware pipeline or attaching a DMA-buf fence to the buffer.
> > >
> > > But then, what's left to be solved? :) (Besides the cases of missing
> > > begin/end CPU access calls.) =20
> >
> > Well there are multiple problems here:
> >
> > 1. A lot of userspace applications/frameworks assume that it can
> > allocate the buffer anywhere and it just works.
> >
> > This isn't true at all, we have tons of cases where device can only
> > access their special memory for certain use cases.
> > Just look at scanout for displaying on dGPU, neither AMD nor NVidia
> > supports system memory here. Similar cases exists for audio/video codecs
> > where intermediate memory is only accessible by certain devices because
> > of content protection. =20
>=20
> Ack.
>=20
> Although I think the most common case on mainstream Linux today is
> properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> GPU) and hoping that other devices would accept the buffers just fine,
> which isn't a given on most platforms (although often it's just about
> pixel format, width/height/stride alignment, tiling, etc. rather than
> the memory itself). That's why ChromiumOS has minigbm and Android has
> gralloc that act as the central point of knowledge on buffer
> allocation.

Hi,

as an anecdote, when I was improving Mutter's cross-DRM-device handling
(for DisplayLink uses) a few years ago, I implemented several different
approaches of where to allocate, to try until going for the slowest but
guaranteed to work case of copying every update into and out of sysram.

It seems there are two different approaches in general for allocation
and sharing:

1. Try different things until it works or you run out of options

pro:
- no need for a single software component to know everything about
  every device in the system

con:
- who bothers with fallbacks, if the first try works on my system for
  my use case I test with? I.e. cost of code in users.
- trial-and-error can be very laborious (allocate, share with all
  devices, populate, test)
- the search space might be huge


2. Have a central component that knows what to do

pro:
- It might work on the first attempt, so no fallbacks in users.
- It might be optimal.

con:
- You need a software component that knows everything about every
  single combination of hardware in existence, multiplied by use cases.


Neither seems good, which brings us back to https://github.com/cubanismo/al=
locator .


> > 2. We don't properly communicate allocation requirements to userspace.
> >
> > E.g. even if you allocate from DMA-Heaps userspace can currently only
> > guess if normal, CMA or even device specific memory is needed. =20
>=20
> DMA-buf heaps actually make it even more difficult for the userspace,
> because now it needs to pick the right heap. With allocation built
> into the specific UAPI (like V4L2), it's at least possible to allocate
> for one specific device without having any knowledge about allocation
> constraints in the userspace.
>=20
> >
> > 3. We seem to lack some essential parts of those restrictions in the
> > documentation.
> > =20
>=20
> Ack.
>=20
> > >>>> So if a device driver uses cached system memory on an architecture=
 which
> > >>>> devices which can't access it the right approach is clearly to rej=
ect
> > >>>> the access. =20
> > >>> I'd like to accent the fact that "requires cache maintenance" !=3D =
"can't access". =20
> > >> Well that depends. As said above the exporter exports the buffer as =
it
> > >> was allocated.
> > >>
> > >> If that means the the exporter provides a piece of memory which requ=
ires
> > >> CPU cache snooping to access correctly then the best thing we can do=
 is
> > >> to prevent an importer which can't do this from attaching. =20
> > > Could you elaborate more about this case? Does it exist in practice?
> > > Do I assume correctly that it's about sharing a buffer between one DMA
> > > engine that is cache-coherent and another that is non-coherent, where
> > > the first one ends up having its accesses always go through some kind
> > > of a cache (CPU cache, L2/L3/... cache, etc.)? =20
> >
> > Yes, exactly that. What happens in this particular use case is that one
> > device driver wrote to it's internal buffer with the CPU (so some cache
> > lines where dirty) and then a device which couldn't deal with that tried
> > to access it. =20
>=20
> If so, shouldn't that driver surround its CPU accesses with
> begin/end_cpu_access() in the first place?
>=20
> The case that I was suggesting was of a hardware block that actually
> sits behind the CPU cache and thus dirties it on writes, not the
> driver doing that. (I haven't personally encountered such a system,
> though.)
>=20
> >
> > We could say that all device drivers must always look at the coherency
> > of the devices which want to access their buffers. But that would
> > horrible complicate things for maintaining the drivers because then
> > drivers would need to take into account requirements from other drivers
> > while allocating their internal buffers. =20
>=20
> I think it's partially why we have the allocation part of the DMA
> mapping API, but currently it's only handling requirements of one
> device. And we don't have any information from the userspace what
> other devices the buffer would be used with...
>=20
> Actually, do we even have such information in the userspace today?
> Let's say I do a video call in a web browser on a typical Linux
> system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> V4L2 camera fills in buffers with video frames and both encoder and
> display consume them. Do we have a central place which would know that
> a buffer needs to be allocated that works with the producer and all
> consumers?

I have a vague belief that many, many years ago, in the early days of
dmabuf development, there was the idea of the sequence:
- create a dmabuf handle
- share the handle with all devices that would need access
- *then* do the allocation with kernel-internal negotiation to fill all
  devices' needs, if at all possible

Obviously that didn't happen. I think today's dmabuf Wayland protocol
would support this though.

Anyway, Wayland can tell the app which DRM devices a buffer
needs to work with as a GPU texture and potentially on same/another
DRM device as a KMS framebuffer, so theoretically the app could know.


Thanks,
pq

--Sig_/yutxZO4OuBJeupqc9eAt.=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmOTAJIACgkQI1/ltBGq
qqe6Kg//YTqIVuEJp0EYrN6L4eafpQG+YNYEQlkALBw5zzM/x+07PD8XjsXygl0x
TouoRVm19By9IaP/BJGt9TYAEvP1WChIlaF0mApfROuAq3i0/t5UFMzu+pdEUlZj
AY7J1QgsvImlQd6kpAPVkTWFtpN6H9FO+gQM5G/aQsUY82gk+RWRV+AQft9to86F
mns8+HnGd5aHanFAUq3IzEZOgxejzKK5pKcYyJDrdstpDKq/dBMglUtXRlE4SJE5
1yHMnHdV7qC2wfEn+8tF0ZQqWCmKYf5Iyu3o0tjDvAe6qgeRa7VnZWBXLzwaSEVr
q7a0LCBoIi6nHN+Xu/fJdJ9M2cEDj4pLlnyTx/POFatEzsvuwy2dzAVreHBEd6B/
3i2ZPxcvhdPzZ8FjbYf2MisGDpgYre0f+48aLaGsbXW2zvyZ44yGX1QTMwF1jKTM
yECACZ6MIWlLdzFvh0GEsHPW8StUxfOPvSBBf+S3jDhniIyvFwUxCF7dRhSjTnJ3
5FNth/1RHHARUqJ8UXSi/MGEMUCmt4aYosu6fFucRu3FAszRPeaoHG5UciKrROEd
HMc7XbbpWTyYhHjYUETd5/wnysXeALFJEdhF9JnuALzM03h8qyCDMUxeUjDtrg1L
f3MUA5WVipSzqRBZDO2PHDuET1vp9qwtMVaY9QuHjf9lNM8xb+A=
=6yHb
-----END PGP SIGNATURE-----

--Sig_/yutxZO4OuBJeupqc9eAt.=X--
