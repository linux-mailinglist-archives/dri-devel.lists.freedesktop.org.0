Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82A644BB4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739C10E341;
	Tue,  6 Dec 2022 18:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9EC10E341
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 18:26:39 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id s14so10985665qvo.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 10:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7kpLvNm5uBf2XYrpn4bTO2wa/TiX11FSiUYTx9NblW8=;
 b=IlcyootEX8f0Rf7dHkb5k9d5dnsinyUcsq4ABUWb4ntewjtMFIP6mrO4CB4Nm8NAiu
 VaVYxpTPfX3F585DlmIAb01veEPp2T06BC+2Ikj/fg5DR0QHORpkGlhE96jmCUax0nd0
 L4SJdwY/ecJaa7qGg0DC6ZhTwDzJEmalsr+VSpY/F8253jnNfUhXjRktO8iaQmBMxOqt
 dZt7oCSEPfzihG61XbewDJBhGu9HyS2BCKJfEHcCniEufDuweEBPu4JXOltpbt3VH1oA
 5BLCsFGNAQAdo4R5b1UR3vrkLtgGJpTrdVYsnxM30PqgnA0FJAnTghRgJk56WWKKKchq
 1Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7kpLvNm5uBf2XYrpn4bTO2wa/TiX11FSiUYTx9NblW8=;
 b=lTuh1EoGNURoo6Z38wBGSbugsY4gX0EWh/WYRKAxQWB8bmv9H41iJl3gavSFoVFeIk
 n/C/MsxA5X2hJ+VYi0o2koNq08QAgAYRXlS4zZvcrBobZKmxmz5mitqKLmmaCG3eKu/x
 cydiBaBQwtBthzWlOeHJhq5hLklR2xu0hg1/sH/keSBcRh6tJR63jenLBOrEso+Q1TSP
 CD1jYWLLyggFEgM+opgs0t+Num6eWYRe2uPyAUyB/YCZQC003siIItHGiL67AHD9ESPs
 eQ5oFZpyIVQQ2OwzRCo8WsyxXvdMieN3Br+27QTWijvL+mAYKbF7byQfquG0cEKYW5Zh
 pAlA==
X-Gm-Message-State: ANoB5pmbEa+n/tlVVL+WSvrTRoo6UlW2XbPlNgYdGcBaqyyZOGEAXRrN
 hVCb5WSrDRhFfH32KAIw8OcHXQ==
X-Google-Smtp-Source: AA0mqf715AYDLHMhrSAReLtTmBQ1ZIQXmHM4KT1OfQo6rb26Wednbz6jSxGorLy0TmU2o51bLO5cXg==
X-Received: by 2002:a05:6214:1147:b0:4c7:1d69:552e with SMTP id
 b7-20020a056214114700b004c71d69552emr27136641qvt.92.1670351198422; 
 Tue, 06 Dec 2022 10:26:38 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 p18-20020ac87412000000b0039cba52974fsm4070515qtq.94.2022.12.06.10.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 10:26:37 -0800 (PST)
Message-ID: <45df0c693d5485cdaa30946704299d57e3dac977.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tomasz
 Figa <tfiga@chromium.org>
Date: Tue, 06 Dec 2022 13:26:35 -0500
In-Reply-To: <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 05 d=C3=A9cembre 2022 =C3=A0 09:28 +0100, Christian K=C3=B6nig a =
=C3=A9crit=C2=A0:
> Hi Tomasz,
>=20
> Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> > [SNIP]
> > > In other words explicit ownership transfer is not something we would
> > > want as requirement in the framework, cause otherwise we break tons o=
f
> > > use cases which require concurrent access to the underlying buffer.
> > >=20
> > > When a device driver needs explicit ownership transfer it's perfectly
> > > possible to implement this using the dma_fence objects mentioned abov=
e.
> > > E.g. drivers can already look at who is accessing a buffer currently =
and
> > > can even grab explicit ownership of it by adding their own dma_fence
> > > objects.
> > >=20
> > > The only exception is CPU based access, e.g. when something is writte=
n
> > > with the CPU a cache flush might be necessary and when something is r=
ead
> > > with the CPU a cache invalidation might be necessary.
> > >=20
> > Okay, that's much clearer now, thanks for clarifying this. So we
> > should be covered for the cache maintenance needs originating from CPU
> > accesses already, +/- the broken cases which don't call the begin/end
> > CPU access routines that I mentioned above.
> >=20
> > Similarly, for any ownership transfer between different DMA engines,
> > we should be covered either by the userspace explicitly flushing the
> > hardware pipeline or attaching a DMA-buf fence to the buffer.
> >=20
> > But then, what's left to be solved? :) (Besides the cases of missing
> > begin/end CPU access calls.)
>=20
> Well there are multiple problems here:
>=20
> 1. A lot of userspace applications/frameworks assume that it can=20
> allocate the buffer anywhere and it just works.

I know you have said that about 10 times, perhaps I'm about to believe it, =
but
why do you think userspace assumes this ? Did you actually read code that d=
oes
this (that isn't meant to run on controlled environment). And can you provi=
de
some example of broken generic userspace ? The DMABuf flow is meant to be t=
rial
and error. At least in GStreamer, yes, mostly only device allocation (when
genericly usable) is implemented, but the code that has been contribute wil=
l try
and fallback back like documented. Still fails sometimes, but that's exactl=
y the
kind of kernel bugs your patchset is trying to address. I don't blame anyon=
e
here, since why would folks on GStreamer/FFMPEG or any other "generic media
framework" spend so much time implement "per linux device code", when non-
embedded (constraint) linux is just handful of users (compare to Windows,
Android, iOS users).

To me, this shouldn't be #1 issue. Perhaps it should simply be replaced by
userspace not supporting DMABuf Heaps. Perhaps add that Linux distribution =
don't
always enable (or allow normal users to access) heaps (though you point 2. =
gets
in the way) ? Unlike virtual memory, I don't think there is very good accou=
nting
and reclaiming mechanism for that memory, hence opening these means any
userspace could possibly impair the system functioning. If you can't e.g. l=
imit
their usage within containers, this is pretty difficult for generic linux t=
o
carry. This is a wider problem of course, which likely affect a lot of GPU =
usage
too, but perhaps it should be in the lower priority part of the todo.

>=20
> This isn't true at all, we have tons of cases where device can only=20
> access their special memory for certain use cases.
> Just look at scanout for displaying on dGPU, neither AMD nor NVidia=20
> supports system memory here. Similar cases exists for audio/video codecs=
=20
> where intermediate memory is only accessible by certain devices because=
=20
> of content protection.

nit: content protection is not CODEC specific, its a platform feature, its =
also
not really a thing upstream yet from what I'm aware of. This needs unified
design and documentation imho, but also enough standardisation so that a ge=
neric
application can use it. Right now, content protection people have been
complaining that V4L2 (and most generic userspace) don't work with their de=
sign,
rather then trying to figure-out a design that works with existing API.

>=20
> 2. We don't properly communicate allocation requirements to userspace.
>=20
> E.g. even if you allocate from DMA-Heaps userspace can currently only=20
> guess if normal, CMA or even device specific memory is needed.
>=20
> 3. We seem to lack some essential parts of those restrictions in the=20
> documentation.

Agreed (can't always disagree).

regards,
Nicolas

>=20
> > > > > So if a device driver uses cached system memory on an architectur=
e which
> > > > > devices which can't access it the right approach is clearly to re=
ject
> > > > > the access.
> > > > I'd like to accent the fact that "requires cache maintenance" !=3D =
"can't access".
> > > Well that depends. As said above the exporter exports the buffer as i=
t
> > > was allocated.
> > >=20
> > > If that means the the exporter provides a piece of memory which requi=
res
> > > CPU cache snooping to access correctly then the best thing we can do =
is
> > > to prevent an importer which can't do this from attaching.
> > Could you elaborate more about this case? Does it exist in practice?
> > Do I assume correctly that it's about sharing a buffer between one DMA
> > engine that is cache-coherent and another that is non-coherent, where
> > the first one ends up having its accesses always go through some kind
> > of a cache (CPU cache, L2/L3/... cache, etc.)?
>=20
> Yes, exactly that. What happens in this particular use case is that one=
=20
> device driver wrote to it's internal buffer with the CPU (so some cache=
=20
> lines where dirty) and then a device which couldn't deal with that tried=
=20
> to access it.
>=20
> We could say that all device drivers must always look at the coherency=
=20
> of the devices which want to access their buffers. But that would=20
> horrible complicate things for maintaining the drivers because then=20
> drivers would need to take into account requirements from other drivers=
=20
> while allocating their internal buffers.
>=20
> That's essentially the reason why we have DMA-buf heaps. Those heaps=20
> expose system memory buffers with certain properties (size, CMA, DMA bit=
=20
> restrictions etc...) and also implement the callback functions for CPU=
=20
> cache maintenance.
>=20
> > > We do have the system and CMA dma-buf heap for cases where a device
> > > driver which wants to access the buffer with caches enabled. So this =
is
> > > not a limitation in functionality, it's just a matter of correctly us=
ing it.
> > >=20
> > V4L2 also has the ability to allocate buffers and map them with caches =
enabled.
>=20
> Yeah, when that's a requirement for the V4L2 device it also makes=20
> perfect sense.
>=20
> It's just that we shouldn't force any specific allocation behavior on a=
=20
> device driver because of the requirements of a different device.
>=20
> Giving an example a V4L2 device shouldn't be forced to use=20
> videobuf2-dma-contig because some other device needs CMA. Instead we=20
> should use the common DMA-buf heaps which implement this as neutral=20
> supplier of system memory buffers.
>=20
> > > The problem is that in this particular case the exporter provides the
> > > buffer as is, e.g. with dirty CPU caches. And the importer can't deal
> > > with that.
> > Why does the exporter leave the buffer with dirty CPU caches?
>=20
> Because exporters always export the buffers as they would use it. And in=
=20
> this case that means writing with the CPU to it.
>=20
> > > Either reverting the roles of the importer or exporter or switching o=
ver
> > > to the common DMA-heaps implementation for the buffer would solve tha=
t.
> > >=20
> > > > > It's the job of the higher level to prepare the buffer a device w=
ork
> > > > > with, not the one of the lower level.
> > > > What are higher and lower levels here?
> > > The MM as higher level and the DMA mapping framework as lower level.
> > >=20
> > Hmm, I generally consider the DMA mapping framework a part of MM,
> > especially its allocation capabilities. It heavily relies on low level
> > MM primitives internally and exposes another set of low level
> > primitives that is more useful for device drivers. At least it should
> > be seen this way, but I agree that it currently includes things that
> > shouldn't necessarily be there, like the transparent bouncing.
>=20
> Exactly that, yes! Good to hear that more people think that way.
>=20
> Christoph made some comments which sounded like he agreed to some of the=
=20
> points as well, but nobody ever said it so clearly.
>=20
> > > > As per the existing design of the DMA mapping framework, the framew=
ork
> > > > handles the system DMA architecture details and DMA master drivers
> > > > take care of invoking the right DMA mapping operations around the D=
MA
> > > > accesses. This makes sense to me, as DMA master drivers have no ide=
a
> > > > about the specific SoCs or buses they're plugged into, while the DM=
A
> > > > mapping framework has no idea when the DMA accesses are taking plac=
e.
> > > Yeah and exactly that's a bit problematic. In an ideal world device
> > > drivers wouldn't see memory they can't access in the first place.
> > >=20
> > > For example what we currently do is the following:
> > > 1. get_user_pages() grabs a reference to the pages we want to DMA to/=
from.
> > > 2. DMA mapping framework is called by the driver to create an sg-tabl=
e.
> > > 3. The DMA mapping framework sees that this won't work and inserts
> > > bounce buffers.
> > > 4. The driver does the DMA to the bounce buffers instead.
> > > 5. The DMA mapping framework copies the data to the real location.
> > >=20
> > > This is highly problematic since it removes the control of what happe=
ns
> > > here. E.g. drivers can't prevent using bounce buffers when they need
> > > coherent access for DMA-buf for example.
> > >=20
> > > What we should have instead is that bounce buffers are applied at a
> > > higher level, for example by get_user_pages() or more general in the =
MM.
> > >=20
> > I tend to agree with you on this, but I see a lot of challenges that
> > would need to be solved if we want to make it otherwise. The whole
> > reason for transparent bouncing came from the fact that many existing
> > subsystems didn't really care about the needs of the underlying
> > hardware, e.g. block or network subsystems would just pass random
> > pages to the drivers. I think the idea of DMA mapping handling this
> > internally was to avoid implementing the bouncing here and there in
> > each block or network driver that needs it. (Arguably, an optional
> > helper could be provided instead for use in those subsystems...)
>=20
> Yes, totally agree. The problem is really that we moved bunch of MM and=
=20
> DMA functions in one API.
>=20
> The bounce buffers are something we should really have in a separate=20
> component.
>=20
> Then the functionality of allocating system memory for a specific device=
=20
> or devices should be something provided by the MM.
>=20
> And finally making this memory or any other CPU address accessible to a=
=20
> device (IOMMU programming etc..) should then be part of an DMA API.
>=20
> > > > > In other words in a proper design the higher level would prepare =
the
> > > > > memory in a way the device driver can work with it, not the other=
 way
> > > > > around.
> > > > >=20
> > > > > When a device driver gets memory it can't work with the correct r=
esponse
> > > > > is to throw an error and bubble that up into a layer where it can=
 be
> > > > > handled gracefully.
> > > > >=20
> > > > > For example instead of using bounce buffers under the hood the DM=
A layer
> > > > > the MM should make sure that when you call read() with O_DIRECT t=
hat the
> > > > > pages in question are accessible by the device.
> > > > >=20
> > > > I tend to agree with you if it's about a costly software "emulation=
"
> > > > like bounce buffers, but cache maintenance is a hardware feature
> > > > existing there by default and it's often much cheaper to operate on
> > > > cached memory and synchronize the caches rather than have everythin=
g
> > > > in uncached (or write-combined) memory.
> > > Well that we should have proper cache maintenance is really not the
> > > question. The question is where to do that?
> > >=20
> > > E.g. in the DMA-mapping framework which as far as I can see should on=
ly
> > > take care of translating addresses.
> > The DMA mapping framework is actually a DMA allocation and mapping
> > framework. Generic memory allocation primitives (like alloc_pages(),
> > kmalloc()) shouldn't be used for buffers that are expected to be
> > passed to DMA engines - there exist DMA-aware replacements, like
> > dma_alloc_pages(), dma_alloc_coherent(), dma_alloc_noncontiguous(),
> > etc.
> >=20
> > > Or the higher level (get_user_pages() is just one example of that) wh=
ich
> > > says ok device X wants to access memory Y I need to make sure that
> > > caches are flushed/invalidated.
> > Okay, so here comes the userptr case, which I really feel like is just
> > doomed at the very start, because it does nothing to accommodate
> > hardware needs at allocation time and then just expects some magic to
> > happen to make it possible for the hardware to make use of the buffer.
> >=20
> > That said, it should be still possible to handle that pretty well for
> > hardware that allows it, i.e. without much memory access constraints.
> > What would be still missing if we just use the existing gup() +
> > dma_map() + dma_sync() sequence?
>=20
> Error or rather fallback handling and *not* transparently inserting=20
> bounce buffers.
>=20
> The whole implicit bounce buffers concept falls apart as soon as you=20
> don't have a stream access any more.
>=20
> > > > > > It's a use-case that is working fine today with many devices (e=
.g. network
> > > > > > adapters) in the ARM world, exactly because the architecture sp=
ecific
> > > > > > implementation of the DMA API inserts the cache maintenance ope=
rations
> > > > > > on buffer ownership transfer.
> > > > > Yeah, I'm perfectly aware of that. The problem is that exactly th=
at
> > > > > design totally breaks GPUs on Xen DOM0 for example.
> > > > >=20
> > > > > And Xen is just one example, I can certainly say from experience =
that
> > > > > this design was a really really bad idea because it favors just o=
ne use
> > > > > case while making other use cases practically impossible if not r=
eally
> > > > > hard to implement.
> > > > Sorry, I haven't worked with Xen. Could you elaborate what's the
> > > > problem that this introduces for it?
> > > That's a bit longer topic. The AMD XEN devs are already working on th=
is
> > > as far as I know. I can ping internally how far they got with sending
> > > the patches out to avoid this problem.
> > Hmm, I see. It might be a good data point to understand in which
> > direction we should be going, but I guess we can wait until they send
> > some patches.
>=20
> There was just recently a longer thread on the amd-gfx mailing list=20
> about that. I think looking in there as well might be beneficial.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Best regards,
> > Tomasz
>=20

