Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA8A29862
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 19:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3481A10E382;
	Wed,  5 Feb 2025 18:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nPNk3GIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807810E382
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 18:07:28 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-467918c360aso1342981cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 10:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738778848; x=1739383648;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=;
 b=nPNk3GIVTF/f2ZiicBhP1z4WeN0DdA3Fi5eLe2aRmXQneUFF4jIb2IJ8A4uq/0Q54+
 DQCn7bAeJvmwQbycT6Vepaqmm65BeBUQ+GUQlAycabzOakFkAAn533HHs7Vj/2QcQcor
 koeS+rduYaZGmtGZeQYbw/ud8R/XCQ2B1SVbv9qhlNhPYbRG+gN9zBhaCCdSCNwyHVsl
 I51RcVK3ehm7B/tAy2ZGUGZzWQwWATXQrL5TD9NAx2hWAC1k2Ba8HoAPozax1ayjOLMi
 CUE86r0YviR1DSVnP6e/IFEFAGEBBT/uFM3vN7fht+muLVvSuJVlSrAmYj6J2hDHe8yB
 4rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738778848; x=1739383648;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5a3g63YXuRyBGyCYvHoCZXHBrCt33UAX5/d9X21sMZ4=;
 b=UOdXNCMJ7Q5PH+O/dW+lDpirEbPhVoElrMm7ogTLn+kpf36A4WnhmyiIVRo6mPqbn4
 prbad5f57ADKZe/amOePWP5xpiZFBfuwj47YHPdYNX4ikpakvbWpSECP1/YHEIC99gAl
 +6RcQpuGUagDIOOJYE/bZNzFhXNzJmoVoWvGoYY746ObuuwncSzlEJAYU+Nx4SQUJ1Ns
 KXpojdKmlgsphquyBugZI8pUXMkX6JXhdTZBx3uZDsM+IlDy8uZyAPCt0Rt8fuErXVMY
 DQ0rq4DsBWXm/wWv+UggqRvMWqSBv9+K91+Yau/Fupki8uOLo43MJt7GGLIyIxhL0cHP
 vsJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWSaQZzYcnhMTqehFtA3hfehy7KHqDdzRCEybU4SMZH8M1ODU7D3Pvw3qL3LrPYe8ADJwvwKU06o0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym5wvMCqVX83JJcjTq7OoZU2RXPlMfW8zfbrzqS2dsU4e1BGWF
 Kdb635iDnO3aVJYBFq1RsYvVMA13ensnDnIu3MNsuNE5cDvR1fqRqKmd+ew2yyg=
X-Gm-Gg: ASbGncuz05VJSW2xF2/HD5miYuvHtEaxIrBe4wlipbqvIt6nyHrYgMyhiSeiEm3Rq+0
 6ffuQlDenxmaEUfnLyVwc0+aIeveT1FKhXbLu+BVK7TUUThY6AgxJy3i9XIEuf072Ypb/Ws6ruj
 EUYdycjsOxmKHIXxWSxKcD7teibxkHRSc7RYR4oaoKpZFCURWOqpl23k6AboZ7FYIMNP78RyNZT
 Yb1bAJhBsdPYD/qmdldHbv8lmEbNo5fdf8sFSQZhGs5BFyGRQR8g8XXy5Qt4YR1wGKvsILZRBtt
 laziTWePyeueopyd
X-Google-Smtp-Source: AGHT+IEo4hXzx1g4KENBMeo2s9vL7H7kP3tcfvoRUkgZj0tj3tMn7WAB4E53kizdrimAnj8XyGNu6g==
X-Received: by 2002:ac8:7e93:0:b0:467:6833:e30c with SMTP id
 d75a77b69052e-470281e8607mr53959051cf.30.1738778847693; 
 Wed, 05 Feb 2025 10:07:27 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4702c56c62bsm7919921cf.28.2025.02.05.10.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 10:07:27 -0800 (PST)
Message-ID: <9b5104631f827fe44ad1030c971c72fba9a8ac90.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>
Cc: Florent Tomasin <florent.tomasin@arm.com>, Vinod Koul
 <vkoul@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau	 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Date: Wed, 05 Feb 2025 13:07:25 -0500
In-Reply-To: <20250205-robust-tall-parrot-69baf7@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
 <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
 <20250205-robust-tall-parrot-69baf7@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:53 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> On Tue, Feb 04, 2025 at 01:22:58PM -0500, Nicolas Dufresne wrote:
> > Le lundi 03 f=C3=A9vrier 2025 =C3=A0 16:43 +0000, Florent Tomasin a =C3=
=A9crit=C2=A0:
> > > Hi Maxime, Nicolas
> > >=20
> > > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> > > > > Hi Nicolas,
> > > > >=20
> > > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =
=C3=A9crit=C2=A0:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > I started to review it, but it's probably best to discuss it =
here.
> > > > > > >=20
> > > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wro=
te:
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
ecific exporter.
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
> > > > > > > allocation through the usual dma_alloc_* API?
> > > > > >=20
> > > > > > How do you then multiplex this region so it can be shared betwe=
en
> > > > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > > > >=20
> > > > > You could point all the devices to the same reserved memory regio=
n, and
> > > > > they would all allocate from there, including for their userspace=
-facing
> > > > > allocations.
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
> > > >=20
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
> > > of the GPU HW. This is a device globally owned protected memory.
> >=20
> > This use case also applies well for codec. The Mediatek SCP firmware ne=
eds to be
> > loaded with a restricted memory too, its a very similar scenario, plus =
Mediatek
> > chips often include a Mali. On top of that, V4L2 codecs (in general) do=
 need to
> > allocate internal scratch buffer for the IP to write to for things like=
 motion
> > vectors, reconstruction frames, entropy statistics, etc. The IP will on=
ly be
> > able to write if the memory is restricted.
>=20
> BTW, in such a case, do the scratch buffers need to be
> protected/secure/whatever too, or would codecs be able to use any buffer
> as a scratch buffer?

They need to be protected yes. Its not very fine grained on the platform I =
work
on. When that protection is enabled, the decoder can only read and write fr=
om
protected memory. I know there is platform were it can read from both, but
generally all IOs regardless what they are used for endup with the same
restriction.

Nicolas

p.s. since Khronos seems to have adopted "protected", perhaps it will be ad=
vised
to go for that in the end.

>=20
> Maxime

