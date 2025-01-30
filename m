Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0ABA2335C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 18:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5C510E9BD;
	Thu, 30 Jan 2025 17:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="mzvC941q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C13110E9BD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 17:47:05 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6e1a41935c3so14147236d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 09:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738259225; x=1738864025;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=M2KnSOALVun40U0rx69PL5LHkQdFIbv2CoISnegMh7s=;
 b=mzvC941qLC66m3Z371mAsyfJAtN78ITfHHDvEyerUQDfvJbl2g5EZE9pT006jNnrYj
 iS5vgpt4CKGU/PCjyg0w+Wc934qR5TBAmaiKIxAT0e7XALV026Xzpa1JAgvhfA4Md5iU
 baaQ69BTTv8aIpZYUutcm1zhjH0GXMZrbTRvpt7UjcFWGo/Qy6veNtGLYWxhwvuLVWGN
 fBaiZwz4+9UCnHm8dgCpLdT/Iq/84inrm0ZYMas634rqVSaPqu54jAHl6UGZw+YPXTDv
 E6aiCwZ+svIlBXxolDmS354SrCrsZMz97O4UfB+N/nGMrXd3RZnLycx0ja+XHBnVmrfK
 QEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738259225; x=1738864025;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2KnSOALVun40U0rx69PL5LHkQdFIbv2CoISnegMh7s=;
 b=jEZxCDW3W2sUtJ4YM/FbV0xRPFthxKahHlg9rPE+2OF+yzFJ481ja6V61QWapSKAPB
 mt62PmX5MAGyoO4sgTptHoOPaEU5k8cp4dFEwiPvZYFTS3APNW6GHs2mLbHx/o9hjD7c
 IuDsm7WHj3823bR86U8tRB1kS8/o/OPC1pIkBQ0oac2lbZwmLhvhCcgMTKaGPE4INZYd
 JnDMSvsd7gywnnyNLRFwX0omKalC8hiZNGRfJdTpFsvsrrYmVjKRkhOuecxXohZ21RAs
 aYNYfxScddSD+NTdltorehbXWLYljRm8XCwSU2iRcXLMQpULxphHdfvGHdVc2EbeHW/R
 CTwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbnD2+Rt7e5zvwjumxSCL14lGbUqmSdYDcPt7bcBYSz9bjZSCV3Alvs9F996+XzRAKlIIUb2OemUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgkgLoV6lpRUuKecZr8aIZZspw9+sAwd/q7GWMT/uSF+msO15Z
 oWCx7uX4Ok83fN0muqTy/kOW4DU3K/ZwkVdla2jVw7WUjJWpiht7CpABmsCatPY=
X-Gm-Gg: ASbGncsG46ikWBhdPlV9bE5ErE58umU7dHiYUREjo2DqCxEMs3Tkek19a2FT/yQNvgO
 TX3lf5efU+JPsYS5LycRo7FlcNv12hDBkPCc/6k3DFkgANpqOtqCOAQjsiumrHziUJSAHiWdhoB
 BrAf7nGWPWUddNoBqVCLAdY/tZ4OMsRXXU2K7bbmVqIMQev96SrHHHuWT8Co0ndSgXbSFCkFcd8
 fhZ00KGPsaxXlxofXhAVaxVDw665kjKM3EaEat6ZbNII2on94+kPU1mvmhGIBqxgKxtsuBQ0ivj
 0/WK0ou0D6JsweXx
X-Google-Smtp-Source: AGHT+IFb98ThAFaKwElwJF/sopgUxhTZjXeuvxkotRwiLF8RhVhCp7fJLzKCy+1eOfFzQ+qv/2X0Lw==
X-Received: by 2002:a05:6214:1d0e:b0:6d8:9124:8795 with SMTP id
 6a1803df08f44-6e243b94159mr102405256d6.1.1738259224602; 
 Thu, 30 Jan 2025 09:47:04 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e25481419fsm8430276d6.27.2025.01.30.09.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 09:47:04 -0800 (PST)
Message-ID: <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
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
Date: Thu, 30 Jan 2025 12:47:02 -0500
In-Reply-To: <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
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

Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > > Hi,
> > >=20
> > > I started to review it, but it's probably best to discuss it here.
> > >=20
> > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > > > Hi,
> > > >=20
> > > > This is a patch series covering the support for protected mode exec=
ution in
> > > > Mali Panthor CSF kernel driver.
> > > >=20
> > > > The Mali CSF GPUs come with the support for protected mode executio=
n at the
> > > > HW level. This feature requires two main changes in the kernel driv=
er:
> > > >=20
> > > > 1) Configure the GPU with a protected buffer. The system must provi=
de a DMA
> > > >    heap from which the driver can allocate a protected buffer.
> > > >    It can be a carved-out memory or dynamically allocated protected=
 memory region.
> > > >    Some system includes a trusted FW which is in charge of the prot=
ected memory.
> > > >    Since this problem is integration specific, the Mali Panthor CSF=
 kernel
> > > >    driver must import the protected memory from a device specific e=
xporter.
> > >=20
> > > Why do you need a heap for it in the first place? My understanding of
> > > your series is that you have a carved out memory region somewhere, an=
d
> > > you want to allocate from that carved out memory region your buffers.
> > >=20
> > > How is that any different from using a reserved-memory region, adding
> > > the reserved-memory property to the GPU device and doing all your
> > > allocation through the usual dma_alloc_* API?
> >=20
> > How do you then multiplex this region so it can be shared between
> > GPU/Camera/Display/Codec drivers and also userspace ?
>=20
> You could point all the devices to the same reserved memory region, and
> they would all allocate from there, including for their userspace-facing
> allocations.

I get that using memory region is somewhat more of an HW description, and
aligned with what a DT is supposed to describe. One of the challenge is tha=
t
Mediatek heap proposal endup calling into their TEE, meaning knowing the re=
gion
is not that useful. You actually need the TEE APP guid and its IPC protocol=
. If
we can dell drivers to use a head instead, we can abstract that SoC specifi=
c
complexity. I believe each allocated addressed has to be mapped to a zone, =
and
that can only be done in the secure application. I can imagine similar need=
s
when the protection is done using some sort of a VM / hypervisor.

Nicolas

>=20
> > Also, how the secure memory is allocted / obtained is a process that
> > can vary a lot between SoC, so implementation details assumption
> > should not be coded in the driver.
>=20
> But yeah, we agree there, it's also the point I was trying to make :)
>=20
> Maxime

