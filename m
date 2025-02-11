Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA0A30D3D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 14:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95810E2A4;
	Tue, 11 Feb 2025 13:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sBPzhl2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934E910E2A4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 13:47:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D3065C177A;
 Tue, 11 Feb 2025 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE831C4CEDD;
 Tue, 11 Feb 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739281619;
 bh=r0ToB49ByRRzoTR0oX73//wrpRH+Zm+uP9UF3X+7p9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBPzhl2NVuEMaafcbYRqdMQbyiA1V2OZVr1xOgSfAQtvZm8x3mBLBwzbWBZSAiDp4
 4ykKhDfiwsyS+z+iwnEaxVvVlgn+PZPJvF9wDFNlKuY/Fk703/6puft0Etaj7ypLT1
 UzeGGg2ennTLcuirZqEl1GClmJiqL+uY8bWL3Yzzhee9NvAza24wMn5OIt/fEbRuz0
 MyDBsDZgLDr9CYHOC1Za+6+Z3Or/Mr6WY7TEqyEdIV8WVKLpA8Cl58EIbR/9nCURKI
 UssICMNVI1nU1TqMcHm1p4m+ylj10qyYAD2eJS2dN8FV/mBWIAGagj3kQNS9Xg8KyG
 1jTCIRwEzIufQ==
Date: Tue, 11 Feb 2025 14:46:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
Message-ID: <20250211-robust-lush-skink-0dcc5b@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
 <20250205-amorphous-nano-agouti-b5baba@houat>
 <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
 <20250207160253.42551fb1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="htbc2pgomj3vttd2"
Content-Disposition: inline
In-Reply-To: <20250207160253.42551fb1@collabora.com>
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


--htbc2pgomj3vttd2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
MIME-Version: 1.0

Hi Boris,

On Fri, Feb 07, 2025 at 04:02:53PM +0100, Boris Brezillon wrote:
> Sorry for joining the party late, a couple of comments to back Akash
> and Nicolas' concerns.
>=20
> On Wed, 05 Feb 2025 13:14:14 -0500
> Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>=20
> > Le mercredi 05 f=E9vrier 2025 =E0 15:52 +0100, Maxime Ripard a =E9crit=
=A0:
> > > On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote: =20
> > > > Hi Maxime, Nicolas
> > > >=20
> > > > On 30/01/2025 17:47, Nicolas Dufresne wrote: =20
> > > > > Le jeudi 30 janvier 2025 =E0 17:38 +0100, Maxime Ripard a =E9crit=
=A0: =20
> > > > > > Hi Nicolas,
> > > > > >=20
> > > > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrot=
e: =20
> > > > > > > Le jeudi 30 janvier 2025 =E0 14:46 +0100, Maxime Ripard a =E9=
crit=A0: =20
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > I started to review it, but it's probably best to discuss i=
t here.
> > > > > > > >=20
> > > > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin w=
rote: =20
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > This is a patch series covering the support for protected=
 mode execution in
> > > > > > > > > Mali Panthor CSF kernel driver.
> > > > > > > > >=20
> > > > > > > > > The Mali CSF GPUs come with the support for protected mod=
e execution at the
> > > > > > > > > HW level. This feature requires two main changes in the k=
ernel driver:
> > > > > > > > >=20
> > > > > > > > > 1) Configure the GPU with a protected buffer. The system =
must provide a DMA
> > > > > > > > >    heap from which the driver can allocate a protected bu=
ffer.
> > > > > > > > >    It can be a carved-out memory or dynamically allocated=
 protected memory region.
> > > > > > > > >    Some system includes a trusted FW which is in charge o=
f the protected memory.
> > > > > > > > >    Since this problem is integration specific, the Mali P=
anthor CSF kernel
> > > > > > > > >    driver must import the protected memory from a device =
specific exporter. =20
> > > > > > > >=20
> > > > > > > > Why do you need a heap for it in the first place? My unders=
tanding of
> > > > > > > > your series is that you have a carved out memory region som=
ewhere, and
> > > > > > > > you want to allocate from that carved out memory region you=
r buffers.
> > > > > > > >=20
> > > > > > > > How is that any different from using a reserved-memory regi=
on, adding
> > > > > > > > the reserved-memory property to the GPU device and doing al=
l your
> > > > > > > > allocation through the usual dma_alloc_* API? =20
> > > > > > >=20
> > > > > > > How do you then multiplex this region so it can be shared bet=
ween
> > > > > > > GPU/Camera/Display/Codec drivers and also userspace ? =20
> > > > > >=20
> > > > > > You could point all the devices to the same reserved memory reg=
ion, and
> > > > > > they would all allocate from there, including for their userspa=
ce-facing
> > > > > > allocations. =20
> > > > >=20
> > > > > I get that using memory region is somewhat more of an HW descript=
ion, and
> > > > > aligned with what a DT is supposed to describe. One of the challe=
nge is that
> > > > > Mediatek heap proposal endup calling into their TEE, meaning know=
ing the region
> > > > > is not that useful. You actually need the TEE APP guid and its IP=
C protocol. If
> > > > > we can dell drivers to use a head instead, we can abstract that S=
oC specific
> > > > > complexity. I believe each allocated addressed has to be mapped t=
o a zone, and
> > > > > that can only be done in the secure application. I can imagine si=
milar needs
> > > > > when the protection is done using some sort of a VM / hypervisor.
> > > > >=20
> > > > > Nicolas
> > > > >  =20
> > > >=20
> > > > The idea in this design is to abstract the heap management from the
> > > > Panthor kernel driver (which consumes a DMA buffer from it).
> > > >=20
> > > > In a system, an integrator would have implemented a secure heap dri=
ver,
> > > > and could be based on TEE or a carved-out memory with restricted ac=
cess,
> > > > or else. This heap driver would be responsible of implementing the
> > > > logic to: allocate, free, refcount, etc.
> > > >=20
> > > > The heap would be retrieved by the Panthor kernel driver in order to
> > > > allocate protected memory to load the FW and allow the GPU to enter=
/exit
> > > > protected mode. This memory would not belong to a user space proces=
s.
> > > > The driver allocates it at the time of loading the FW and initializ=
ation
> > > > of the GPU HW. This is a device globally owned protected memory. =
=20
> > >=20
> > > The thing is, it's really not clear why you absolutely need to have t=
he
> > > Panthor driver involved there. It won't be transparent to userspace,
> > > since you'd need an extra flag at allocation time, and the buffers
> > > behave differently. If userspace has to be aware of it, what's the
> > > advantage to your approach compared to just exposing a heap for those
> > > secure buffers, and letting userspace allocate its buffers from there=
? =20
> >=20
> > Unless I'm mistaken, the Panthor driver loads its own firmware. Since l=
oading
> > the firmware requires placing the data in a protected memory region, an=
d that
> > this aspect has no exposure to userspace, how can Panthor not be implic=
ated ?
>=20
> Right, the very reason we need protected memory early is because some
> FW sections need to be allocated from the protected pool, otherwise the
> TEE will fault as soon at the FW enters the so-called 'protected mode'.

How does that work if you don't have some way to allocate the protected
memory? You can still submit jobs to the GPU, but you can't submit /
execute "protected jobs"?

> Now, it's not impossible to work around this limitation. For instance,
> we could load the FW without this protected section by default (what we
> do right now), and then provide a DRM_PANTHOR_ENABLE_FW_PROT_MODE
> ioctl that would take a GEM object imported from a dmabuf allocated
> from the protected dma-heap by userspace. We can then reset the FW and
> allow it to operate in protected mode after that point.

Urgh, I'd rather avoid that dance if possible :)

> This approach has two downsides though:
>=20
> 1. We have no way of checking that the memory we're passed is actually
> suitable for FW execution in a protected context. If we're passed
> random memory, this will likely hang the platform as soon as we enter
> protected mode.

It's a current limitation of dma-buf in general, and you'd have the same
issue right now if someone imports a buffer, or misconfigure the heap
for a !protected heap.

I'd really like to have some way to store some metadata in dma_buf, if
only to tell that the buffer is protected.

I suspect you'd also need that if you do things like do protected video
playback through a codec, get a protected frame, and want to import that
into the GPU. Depending on how you allocate it, either the codec or the
GPU or both will want to make sure it's protected.

> 2. If the driver already boot the FW and exposed a DRI node, we might
> have GPU workloads running, and doing a FW reset might incur a slight
> delay in GPU jobs execution.
>=20
> I think #1 is a more general issue that applies to suspend buffers
> allocated for GPU contexts too. If we expose ioctls where we take
> protected memory buffers that can possibly lead to crashes if they are
> not real protected memory regions, and we have no way to ensure the
> memory is protected, we probably want to restrict these ioctls/modes to
> some high-privilege CAP_SYS_.
>=20
> For #2, that's probably something we can live with, since it's a
> one-shot thing. If it becomes an issue, we can even make sure we enable
> the FW protected-mode before the GPU starts being used for real.
>=20
> This being said, I think the problem applies outside Panthor, and it
> might be that the video codec can't reset the FW/HW block to switch to
> protected mode as easily as Panthor.
>
> Note that there's also downsides to the reserved-memory node approach,
> where some bootloader stage would ask the secure FW to reserve a
> portion of mem and pass this through the DT. This sort of things tend to
> be an integration mess, where you need all the pieces of the stack (TEE,
> u-boot, MTK dma-heap driver, gbm, ...) to be at a certain version to
> work properly. If we go the ioctl() way, we restrict the scope to the
> TEE, gbm/mesa and the protected-dma-heap driver, which is still a lot,
> but we've ripped the bootloader out of the equation at least.

Yeah. I also think there's two discussions in parallel here:

 1) Being able to allocate protected buffers from the driver
 2) Exposing an interface to allocate those to userspace

I'm not really convinced we need 2, but 1 is obviously needed from what
you're saying.

Maxime

--htbc2pgomj3vttd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tUzwAKCRAnX84Zoj2+
dgyXAX9Mpc+TjVfAcyCQN/n7q9zZ5lmbptADZW4LEBnXwTWDkkiDiB1S1nzvFyd0
xywePzABgNQe/OpXr+aMBUmIbrbXc0/Yc/5KJdkXmAf8AsGGC198Qo6AbnZL4M8x
oYxodaBcBA==
=GufS
-----END PGP SIGNATURE-----

--htbc2pgomj3vttd2--
