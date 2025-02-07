Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F7A2C67D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 16:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117A110E0E5;
	Fri,  7 Feb 2025 15:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NJDVfFPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F2B10E0E5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738940586;
 bh=GvHyGmeYK6HeWkgsW68Ny11hGh20cfIbIuSfIxslwOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NJDVfFPXYKi06U8LZVuJ+eD3/JwB5LSV42N+bU3wBGXCvqZTDZ1z2/wuGmYiWZ9Cv
 iUdkFi8+nQi3klX0kD3VGs9qtCrEEeT2TaJZJ9tmgwfeLeKryDBN65BQf8pC4/Npzw
 fcE9wdnAxeS5bCYtKxU9ectJnTdE0lDsMHTZ4QFbhHzfBRtX0JE66X6BgyL32h4GhC
 Sd/wluCZvKyCqJsuR6Mx8ujTx4aXppOvrBbUEgmVaykpQl7x8ePt0EiTcjcmVog1CT
 7L8FAXtPw/6j5E5+okTxU1lH+No7t2s0KRyv8ajRzDaeQlhhzRkLP2nTghZR39BOQ8
 /HnOIQ4E295pQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BE23C17E02BE;
 Fri,  7 Feb 2025 16:03:05 +0100 (CET)
Date: Fri, 7 Feb 2025 16:02:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Maxime Ripard <mripard@kernel.org>, Florent Tomasin 
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey	
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
Message-ID: <20250207160253.42551fb1@collabora.com>
In-Reply-To: <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
 <20250205-amorphous-nano-agouti-b5baba@houat>
 <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Sorry for joining the party late, a couple of comments to back Akash
and Nicolas' concerns.

On Wed, 05 Feb 2025 13:14:14 -0500
Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:52 +0100, Maxime Ripard a =C3=
=A9crit=C2=A0:
> > On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote: =20
> > > Hi Maxime, Nicolas
> > >=20
> > > On 30/01/2025 17:47, Nicolas Dufresne wrote: =20
> > > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0: =20
> > > > > Hi Nicolas,
> > > > >=20
> > > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:=
 =20
> > > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =
=C3=A9crit=C2=A0: =20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > I started to review it, but it's probably best to discuss it =
here.
> > > > > > >=20
> > > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wro=
te: =20
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > This is a patch series covering the support for protected m=
ode execution in
> > > > > > > > Mali Panthor CSF kernel driver.
> > > > > > > >=20
> > > > > > > > The Mali CSF GPUs come with the support for protected mode =
execution at the
> > > > > > > > HW level. This feature requires two main changes in the ker=
nel driver:
> > > > > > > >=20
> > > > > > > > 1) Configure the GPU with a protected buffer. The system mu=
st provide a DMA
> > > > > > > >    heap from which the driver can allocate a protected buff=
er.
> > > > > > > >    It can be a carved-out memory or dynamically allocated p=
rotected memory region.
> > > > > > > >    Some system includes a trusted FW which is in charge of =
the protected memory.
> > > > > > > >    Since this problem is integration specific, the Mali Pan=
thor CSF kernel
> > > > > > > >    driver must import the protected memory from a device sp=
ecific exporter. =20
> > > > > > >=20
> > > > > > > Why do you need a heap for it in the first place? My understa=
nding of
> > > > > > > your series is that you have a carved out memory region somew=
here, and
> > > > > > > you want to allocate from that carved out memory region your =
buffers.
> > > > > > >=20
> > > > > > > How is that any different from using a reserved-memory region=
, adding
> > > > > > > the reserved-memory property to the GPU device and doing all =
your
> > > > > > > allocation through the usual dma_alloc_* API? =20
> > > > > >=20
> > > > > > How do you then multiplex this region so it can be shared betwe=
en
> > > > > > GPU/Camera/Display/Codec drivers and also userspace ? =20
> > > > >=20
> > > > > You could point all the devices to the same reserved memory regio=
n, and
> > > > > they would all allocate from there, including for their userspace=
-facing
> > > > > allocations. =20
> > > >=20
> > > > I get that using memory region is somewhat more of an HW descriptio=
n, and
> > > > aligned with what a DT is supposed to describe. One of the challeng=
e is that
> > > > Mediatek heap proposal endup calling into their TEE, meaning knowin=
g the region
> > > > is not that useful. You actually need the TEE APP guid and its IPC =
protocol. If
> > > > we can dell drivers to use a head instead, we can abstract that SoC=
 specific
> > > > complexity. I believe each allocated addressed has to be mapped to =
a zone, and
> > > > that can only be done in the secure application. I can imagine simi=
lar needs
> > > > when the protection is done using some sort of a VM / hypervisor.
> > > >=20
> > > > Nicolas
> > > >  =20
> > >=20
> > > The idea in this design is to abstract the heap management from the
> > > Panthor kernel driver (which consumes a DMA buffer from it).
> > >=20
> > > In a system, an integrator would have implemented a secure heap drive=
r,
> > > and could be based on TEE or a carved-out memory with restricted acce=
ss,
> > > or else. This heap driver would be responsible of implementing the
> > > logic to: allocate, free, refcount, etc.
> > >=20
> > > The heap would be retrieved by the Panthor kernel driver in order to
> > > allocate protected memory to load the FW and allow the GPU to enter/e=
xit
> > > protected mode. This memory would not belong to a user space process.
> > > The driver allocates it at the time of loading the FW and initializat=
ion
> > > of the GPU HW. This is a device globally owned protected memory. =20
> >=20
> > The thing is, it's really not clear why you absolutely need to have the
> > Panthor driver involved there. It won't be transparent to userspace,
> > since you'd need an extra flag at allocation time, and the buffers
> > behave differently. If userspace has to be aware of it, what's the
> > advantage to your approach compared to just exposing a heap for those
> > secure buffers, and letting userspace allocate its buffers from there? =
=20
>=20
> Unless I'm mistaken, the Panthor driver loads its own firmware. Since loa=
ding
> the firmware requires placing the data in a protected memory region, and =
that
> this aspect has no exposure to userspace, how can Panthor not be implicat=
ed ?

Right, the very reason we need protected memory early is because some
FW sections need to be allocated from the protected pool, otherwise the
TEE will fault as soon at the FW enters the so-called 'protected mode'.

Now, it's not impossible to work around this limitation. For instance,
we could load the FW without this protected section by default (what we
do right now), and then provide a DRM_PANTHOR_ENABLE_FW_PROT_MODE
ioctl that would take a GEM object imported from a dmabuf allocated
from the protected dma-heap by userspace. We can then reset the FW and
allow it to operate in protected mode after that point. This approach
has two downsides though:

1. We have no way of checking that the memory we're passed is actually
suitable for FW execution in a protected context. If we're passed
random memory, this will likely hang the platform as soon as we enter
protected mode.

2. If the driver already boot the FW and exposed a DRI node, we might
have GPU workloads running, and doing a FW reset might incur a slight
delay in GPU jobs execution.

I think #1 is a more general issue that applies to suspend buffers
allocated for GPU contexts too. If we expose ioctls where we take
protected memory buffers that can possibly lead to crashes if they are
not real protected memory regions, and we have no way to ensure the
memory is protected, we probably want to restrict these ioctls/modes to
some high-privilege CAP_SYS_.

For #2, that's probably something we can live with, since it's a
one-shot thing. If it becomes an issue, we can even make sure we enable
the FW protected-mode before the GPU starts being used for real.

This being said, I think the problem applies outside Panthor, and it
might be that the video codec can't reset the FW/HW block to switch to
protected mode as easily as Panthor.

Note that there's also downsides to the reserved-memory node approach,
where some bootloader stage would ask the secure FW to reserve a
portion of mem and pass this through the DT. This sort of things tend to
be an integration mess, where you need all the pieces of the stack (TEE,
u-boot, MTK dma-heap driver, gbm, ...) to be at a certain version to
work properly. If we go the ioctl() way, we restrict the scope to the
TEE, gbm/mesa and the protected-dma-heap driver, which is still a lot,
but we've ripped the bootloader out of the equation at least.

Regards,

Boris
