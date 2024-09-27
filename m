Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD9988ADF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 21:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFFF10ED0A;
	Fri, 27 Sep 2024 19:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GMXRsuLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B715C10ED0A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 19:50:08 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6cb2f344dbbso18668226d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1727466607; x=1728071407;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U2tg8OU6eAd7XdNvSYc+LJitu1DCYWL+a/jnG4hrEak=;
 b=GMXRsuLYwkpxgWYJfBm60RbNaLdpnifKSeibjMiRtPoZrypwHs8NNN7dZolPArbrKu
 RfzKX1N8ORrsTXSWXIfF9d2QCLO9zzhirGIPBFvJsKvQgkbxf6/UtuSX10lCibLjJmeq
 lSDk0Jl4VjnJ+XWWHN8wcjhzv9SJCyEoBRxgjPSQTtfIOHg+YCXe/TRjYsGHTI48nhrt
 6PhpSKYaIFibSP2L7LoqLlvdAk0bbo2itUB+Frf47sPPOj3p/flsCv1YiaEEQYOsE5gS
 aNYOA6D1unU/4a5c3rwQvgJCNxIm1LzjN9DgikClV1Wr7D0MNNWw6jgz+ZTPHyIP2qY0
 /YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727466607; x=1728071407;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U2tg8OU6eAd7XdNvSYc+LJitu1DCYWL+a/jnG4hrEak=;
 b=ud6PSUE5Cpl9ydb8Qecs6s7bz0elMtFKq/m7YMFxILKiL7d4ajKAPBl7VpXW+Aj6ZS
 Lld2fvELQSyPKHtrpUyjK3u2tphtw9vSuvV3SlTNLqhINpx2UhrdCKZsswY6iCpUOnOi
 SbuZ6nOG2FVpKPRVmQlEa1hLgPqNnFPrCWqVCkspxPjOaBSSAZ/H1DFk554iBxbRndrG
 +VPHn4vFyEOB71OHo5SjHyV+bWoRrg72Fjmj3MzbQb0M7rpOuOaxa37s8Q2Fpc7fnTmQ
 aBLsY5rG5Lp6nC71RH4UexP0DskSm2e4IkcK646976zaAQaWtRYeXfDJdntZ2ZQGikjD
 55JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzTU9AVyZx4F6iJvs6Fz+vr5jgShxBnFHJxf+cVtoysi0hZqkP94E7TnPYWX6TZcEO63QJPOm2yG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4Dnq7Rv0rQv+lx7mCTBpfeJckU2B43aBRIbn49BNjBuVpvTbC
 OP91qJ+hoI+mmibGuUVasalGIOMcE4vMqf4mpTI+ZGU2tdc4ayX/xVHCyNUBZ/w=
X-Google-Smtp-Source: AGHT+IE8GLjUnXh75USL6POTL0wF3GhP3RbPQsW20Tmjvx9gUrkr/ENH4ZzNWvAis54wTSGF58cLZw==
X-Received: by 2002:a05:6214:3d8a:b0:6cb:32ef:d55f with SMTP id
 6a1803df08f44-6cb3b5b7ef0mr80052226d6.6.1727466607342; 
 Fri, 27 Sep 2024 12:50:07 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::580])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cb3b610b12sm12230896d6.39.2024.09.27.12.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 12:50:06 -0700 (PDT)
Message-ID: <7c9e3a1a6092f6574c17d7206767ece0bcefc81f.camel@ndufresne.ca>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sumit Garg <sumit.garg@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,  Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Fri, 27 Sep 2024 15:50:05 -0400
In-Reply-To: <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
 <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
 <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeudi 26 septembre 2024 =C3=A0 19:22 +0530, Sumit Garg a =C3=A9crit=C2=
=A0:
> [Resend in plain text format as my earlier message was rejected by
> some mailing lists]
>=20
> On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote:
> >=20
> > On 9/25/24 19:31, Christian K=C3=B6nig wrote:
> >=20
> > Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
> >=20
> > On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian K=C3=B6nig wrote:
> >=20
> > Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
> >=20
> > On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
> >=20
> > On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
> >=20
> > Hi,
> >=20
> > On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> >=20
> > Hi,
> >=20
> > This patch set is based on top of Yong Wu's restricted heap patch set [=
1].
> > It's also a continuation on Olivier's Add dma-buf secure-heap patch set=
 [2].
> >=20
> > The Linaro restricted heap uses genalloc in the kernel to manage the he=
ap
> > carvout. This is a difference from the Mediatek restricted heap which
> > relies on the secure world to manage the carveout.
> >=20
> > I've tried to adress the comments on [2], but [1] introduces changes so=
 I'm
> > afraid I've had to skip some comments.
> >=20
> > I know I have raised the same question during LPC (in connection to
> > Qualcomm's dma-heap implementation). Is there any reason why we are
> > using generic heaps instead of allocating the dma-bufs on the device
> > side?
> >=20
> > In your case you already have TEE device, you can use it to allocate an=
d
> > export dma-bufs, which then get imported by the V4L and DRM drivers.
> >=20
> > This goes to the heart of why we have dma-heaps in the first place.
> > We don't want to burden userspace with having to figure out the right
> > place to get a dma-buf for a given use-case on a given hardware.
> > That would be very non-portable, and fail at the core purpose of
> > a kernel: to abstract hardware specifics away.
> >=20
> > Unfortunately all proposals to use dma-buf heaps were moving in the
> > described direction: let app select (somehow) from a platform- and
> > vendor- specific list of dma-buf heaps. In the kernel we at least know
> > the platform on which the system is running. Userspace generally doesn'=
t
> > (and shouldn't). As such, it seems better to me to keep the knowledge i=
n
> > the kernel and allow userspace do its job by calling into existing
> > device drivers.
> >=20
> > The idea of letting the kernel fully abstract away the complexity of in=
ter
> > device data exchange is a completely failed design. There has been plen=
ty of
> > evidence for that over the years.
> >=20
> > Because of this in DMA-buf it's an intentional design decision that
> > userspace and *not* the kernel decides where and what to allocate from.
> >=20
> > Hmm, ok.
> >=20
> > What the kernel should provide are the necessary information what type =
of
> > memory a device can work with and if certain memory is accessible or no=
t.
> > This is the part which is unfortunately still not well defined nor
> > implemented at the moment.
> >=20
> > Apart from that there are a whole bunch of intentional design decision =
which
> > should prevent developers to move allocation decision inside the kernel=
. For
> > example DMA-buf doesn't know what the content of the buffer is (except =
for
> > it's total size) and which use cases a buffer will be used with.
> >=20
> > So the question if memory should be exposed through DMA-heaps or a driv=
er
> > specific allocator is not a question of abstraction, but rather one of =
the
> > physical location and accessibility of the memory.
> >=20
> > If the memory is attached to any physical device, e.g. local memory on =
a
> > dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> > memory as device specific allocator.
> >=20
> > So, for embedded systems with unified memory all buffers (maybe except
> > PCIe BARs) should come from DMA-BUF heaps, correct?
> >=20
> >=20
> > From what I know that is correct, yes. Question is really if that will =
stay this way.
> >=20
> > Neural accelerators look a lot stripped down FPGAs these days and the b=
enefit of local memory for GPUs is known for decades.
> >=20
> > Could be that designs with local specialized memory see a revival any t=
ime, who knows.
> >=20
> > If the memory is not physically attached to any device, but rather just
> > memory attached to the CPU or a system wide memory controller then expo=
se
> > the memory as DMA-heap with specific requirements (e.g. certain sized p=
ages,
> > contiguous, restricted, encrypted, ...).
> >=20
> > Is encrypted / protected a part of the allocation contract or should it
> > be enforced separately via a call to TEE / SCM / anything else?
> >=20
> >=20
> > Well that is a really good question I can't fully answer either. From w=
hat I know now I would say it depends on the design.
> >=20
>=20
> IMHO, I think Dmitry's proposal to rather allow the TEE device to be
> the allocator and exporter of DMA-bufs related to restricted memory
> makes sense to me. Since it's really the TEE implementation (OP-TEE,
> AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
> particular piece of allocated memory. AFAIK, that happens after the
> DMA-buf gets allocated and then user-space calls into TEE to set up
> which media pipeline is going to access that particular DMA-buf. It
> can also be a static contract depending on a particular platform
> design.

When the memory get the protection is hardware specific. Otherwise the desi=
gn
would be really straightforward, allocate from the a heap or any random dri=
ver
API and protect that memory through an call into the TEE. Clear seperation =
would
be amazingly better, but this is not how hardware and firmware designer hav=
e
seen it.=20

In some implementation, there is a carving of memory that be protected befo=
re
the kernel is booted. I believe (but I'm not affiliated with them) that MTK=
 has
hardware restriction making that design the only usable method.

In general, the handling of secure memory is bound to the TEE application f=
or
the specific platform, it has to be separated from the generic part of tee
drivers anyway, and dmabuf heaps is in my opinion the right API for the tas=
k.

On MTK, if you have followed, when the SCP (their co-processor) is handling
restricted video, you can't even call into it anymore directly. So to drive=
 the
CODECs, everything has to be routed through the TEE. Would you say that bec=
ause
of that this should not be a V4L2 driver anymore ?

>=20
> As Jens noted in the other thread, we already manage shared memory
> allocations (from a static carve-out or dynamically mapped) for
> communications among Linux and TEE that were based on DMA-bufs earlier
> but since we didn't required them to be shared with other devices, so
> we rather switched to anonymous memory.
>=20
> From user-space perspective, it's cleaner to use TEE device IOCTLs for
> DMA-buf allocations since it already knows which underlying TEE
> implementation it's communicating with rather than first figuring out
> which DMA heap to use for allocation and then communicating with TEE
> implementation.

As a user-space developer in the majority of my time, adding common code to
handle dma heaps is a lot easier and straight forward then having to glue a=
ll
the different allocators implement in various subsystems. Communicating whi=
ch
heap to work can be generic and simple.

Nicolas

