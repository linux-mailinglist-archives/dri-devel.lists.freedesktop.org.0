Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5602528CF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889B16EA33;
	Wed, 26 Aug 2020 08:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6C289F38
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 20:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nicolas) with ESMTPSA id BC7B8292838
Message-ID: <a1663f6e74eca50f19b44416cdeb346a7b836108.camel@collabora.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ezequiel Garcia
 <ezequiel@collabora.com>
Date: Tue, 25 Aug 2020 16:26:04 -0400
In-Reply-To: <20200820155427.GV6593@pendragon.ideasonboard.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
 <621cd69bdd4af3e5bd5f2c96450c87651620381a.camel@collabora.com>
 <20200820155427.GV6593@pendragon.ideasonboard.com>
Organization: Collabora
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Beckett <bob.beckett@collabora.com>, kernel@collabora.com,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Daniel Stone <daniels@collabora.com>, Tomasz Figa <tfiga@chromium.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0128383915=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0128383915==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-hxmlfzOfGx7K+x0X3RAE"


--=-hxmlfzOfGx7K+x0X3RAE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 20 ao=C3=BBt 2020 =C3=A0 18:54 +0300, Laurent Pinchart a =C3=A9cri=
t :
> Hi Ezequiel,
>=20
> On Thu, Aug 20, 2020 at 05:36:40AM -0300, Ezequiel Garcia wrote:
> > Hi John,
> >=20
> > Thanks a ton for taking the time
> > to go thru this.
> >=20
> > On Mon, 2020-08-17 at 21:13 -0700, John Stultz wrote:
> > > On Sun, Aug 16, 2020 at 10:23 AM Ezequiel Garcia <ezequiel@collabora.=
com> wrote:
> > > > This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> > > > which will allocate memory suitable for the given device.
> > > >=20
> > > > The implementation is mostly a port of the Contiguous Videobuf2
> > > > memory allocator (see videobuf2/videobuf2-dma-contig.c)
> > > > over to the DMA-BUF Heap interface.
> > > >=20
> > > > The intention of this allocator is to provide applications
> > > > with a more system-agnostic API: the only thing the application
> > > > needs to know is which device to get the buffer for.
> > > >=20
> > > > Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> > > > is unknown to the application.
> > >=20
> > > My hesitancy here is that the main reason we have DMA BUF Heaps, and
> > > ION before it, was to expose different types of memory allocations to
> > > userspace. The main premise that often these buffers are shared with
> > > multiple devices, which have differing constraints and it is userspac=
e
> > > that best understands the path a buffer will take through a series of
> > > devices. So userspace is best positioned to determine what type of
> > > memory should be allocated to satisfy the various devices constraints
> > > (there were some design attempts to allow DMA BUFs to use multiple
> > > attach with deferred alloc at map time to handle this constraint
> > > solving in-kernel, but it was never adopted in practice).
> > >=20
> > > This however, requires some system specific policy - implemented in
> > > the Android userspace by gralloc which maps "usage" types (device
> > > pipeline flows) to heaps. I liken it to fstab, which helps map mount
> > > points to partitions - it's not going to be the same on every system.
> > >=20
> > > What you seem to be proposing seems a bit contrary to this premise -
> > > Userland doesn't know what type of memory it needs, but given a devic=
e
> > > can somehow find the heap it should allocate for? This seems to assum=
e
> > > the buffer is only to be used with a single device?
> >=20
> > Single-device usage wasn't the intention. I see now that this patch
> > looks too naive and it's confusing. The idea is of course to get buffer=
s
> > that can be shared.
> >=20
> > I'm thinking you need to share your picture buffer with a decoder,
> > a renderer, possibly something else. Each with its own set
> > of constraints and limitations.=09
> >=20
> > Of course, a buffer that works for device A may be unsuitable for
> > device B and so this per-device heap is surely way too naive.
> >=20
> > As you rightly mention, the main intention of this RFC is to
> > question exactly the current premise: "userspace knows".
> > I fail to see how will (generic and system-agnostic) applications
> > know which heap to use.
> >=20
> > Just for completion, let me throw a simple example: i.MX 8M
> > and some Rockchip platforms share the same VPU block, except the
> > latter have an IOMMU.
> >=20
> > So applications would need to query an iommu presence
> > to get buffer from CMA or not.
>=20
> I don't think we can do this in a system-agnostic way. What I'd like to
> see is an API for the kernel to expose opaque constraints for each

Please, take into consideration that constraints can also come from
userspace. These days, there exist things we may want to do using the
CPU, but the SIMD instructions and the associated algorithm will
introduce constraints too. If these constraints comes too opaque, but
you will also potentially limit some valid CPU interaction with HW in
term of buffer access. CPU constraints todays are fairly small and one
should be able to express them I believe. Of course, these are not
media agnostic, some constraints may depends on the media (like an
image buffer, a matrix buffer or audio buffer) and the associated
algorithm to be used.

An example would be an image buffers produced or modified on CPU but
encoded with HW.

> device, and a userspace library to reconcile constraints, selecting a
> suitable heap, and producing heap-specific parameters for the
> allocation.
>=20
> The constraints need to be transported in a generic way, but the
> contents can be opaque for applications. Only the library would need to
> interpret them. This can be done with platform-specific code inside the
> library. A separate API for the library to interect with the kernel to
> further query or negotiate configuration parameters could be part of
> that picture.
>=20
> This would offer standardized APIs to applications (to gather
> constraints, pass them to the constraint resolution library, and receive
> a heap ID and heap parameters), while still allowing platform-specific
> code in userspace.
>=20
> > > There was at some point a discussion where folks (maybe it was
> > > DanielV? I can't remember...) suggested having something like a sysfs
> > > device node link from a device to a dma-buf heap chardev. This seems
> > > like it would add a similar behavior as what you're proposing, howeve=
r
> > > without adding possibly a ton of new device specific heaps to the
> > > /dev/dma_heap/ dir. However, we would potentially need any missing
> > > heap types added first.
> > >=20
> > > > I'm not really expecting this patch to be correct or even
> > > > a good idea, but just submitting it to start a discussion on DMA-BU=
F
> > > > heap discovery and negotiation.
> > > >=20
> > > > Given Plumbers is just a couple weeks from now, I've submitted
> > > > a BoF proposal to discuss this, as perhaps it would make
> > > > sense to discuss this live?
> > >=20
> > > I do think it's an interesting idea. I agree that having every driver
> > > implement a dmabuf exporter is a bit silly, but I also think Brian's
> > > point that maybe we need some drm helper functions that provide
> > > similar functionality along with a more standardized device ioctl for
> > > single device allocations might be better.
> >=20
> > I'm unsure we should treat single device specially.
> > =20
> > Exposing device limitations and constraints properly,
> > allowing some sort of negotation would hopefully solve
> > single device and shared requirements.

--=-hxmlfzOfGx7K+x0X3RAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCX0Vz3AAKCRBxUwItrAao
HEdGAJ9ZbPnP7UJWaAxUOqwuGH4HLjGOTACcCm2ffLIId5mvJZCSRk/NLal6tN4=
=/s49
-----END PGP SIGNATURE-----

--=-hxmlfzOfGx7K+x0X3RAE--


--===============0128383915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0128383915==--

