Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DBCB5383D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3110E0DE;
	Thu, 11 Sep 2025 15:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="v2IwKW5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F2C10E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:52:41 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45dd9d72f61so103265e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757605960; x=1758210760;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foMaJCpT5aQB0DVDGayrfvczYmTKtjYQaxnfqBcxeQk=;
 b=v2IwKW5H3VC/m9cicmt+/oywjDOEyp6I768zJZpbNzNuZOOq25KdKxLda1tHp38D4l
 F7sDLnquTmsVt7fPMj5OcA+Im+ZgyaE6lVxv61A+Z0wXtkPgIL2Ii0tLx7m/XOnb8J+O
 sY9Gg549tfc2h7b5ueVhx4SuDYKnNE2mZuTfHjq5QuEa0tiF6kgza9LAXPeXoqYO9K88
 5+LnfbvehPTR8Uuo3sIJO/glZ3xqibjvrmelu8kOUg5OC6qXkcz0pCBJSP/Id5qmsfFE
 FXiftldUP69/DUqzICdHR0Qkq3xJ7n+D2KgSwM+5M7pQUJyYkN0TdFe0GgPfNPHZBYda
 Tw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757605960; x=1758210760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foMaJCpT5aQB0DVDGayrfvczYmTKtjYQaxnfqBcxeQk=;
 b=DbCRxurhA/3MSTZkxECUL7BuS7Ed95lqnBVuIybkqHZUTxuZzN5XJ1cTKp+bgrf5XD
 BMZl2wv45+9xrKMI77azmVVMSED7MwCj+dklqfKgD4oXpAmc4iU6QtuNUPpKLfub+Bi5
 hDPMV5kaVXsQy2Ro1KmgOQSGV/Ygj4fYG7dFoi1riAjr4GQIR3jYSCYteRL+sPOWdhpx
 c+me/YH2CWFVOhvXp7yC4rzNPyLfOPhgLQrxu3DTrqOjYf5m3oTbjYPE/pfn8ImEcFqA
 sNs+Sk2POrC1xs/X6/ClzaHnczc3FmMMkLsAIxPwnPbYSKgqJARZEiqXSKyhHFsPeRYv
 y9LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnnl6UGKCegyvvPrEibl3GnLlHujKosmjlqBZKQTKIwaJ5XCs6IATgbNLhHcez54RHFQ0i+dmFTfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5SOiTjYKIbiguBaOlelHLMRWl3fatvgrpIsihjO60GbYGslvK
 MgX+lr8SnaskUP+cukbq+l7v1W/GI6+ndQfPDUQ+Ro56nH9gWCsqR6u+iiVUQqlPgpxQ7e/ZaA0
 DvU7oNmXMLrxR+6zVLl+uR0qinsnXPTO9MxeSFBnV
X-Gm-Gg: ASbGncuZGGdpImrrVI5LoGEuPGE7OFXEGEAuoHrDe99QTYyO13hsK7O/CxMMpDZmPQP
 K8wG9O4Nqf6PXUdLJw6Gb42fDx92ai5x2T7wG8CdMIkDFI8M6hVB2YZRKDeUB4vOzvA0KUIQOJK
 o/Tar38GaVcUgZR2tB5AX92hjh5Skc0jI0eIEibb+u6OwzcOzT8EbHwY9EWZrVRWnFrMyxRMbUQ
 qwSHHV0Qeh9niOB2e2MRLBkJz3OlyRmzh27iGURx2Y=
X-Google-Smtp-Source: AGHT+IFPtXGS3xfleXOqxUh4NB8MIkaUyVVSq3pObyoX2WKiKcEimPgaW/wvhaqmwPl3cn8wFgGAwaPg27+INgq99jg=
X-Received: by 2002:a05:600c:4193:b0:45c:b621:9199 with SMTP id
 5b1f17b1804b1-45df821ead8mr2846075e9.7.1757605959182; Thu, 11 Sep 2025
 08:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat>
 <20250910-vigorous-attractive-gorilla-af6fec@houat>
 <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com>
 <20250911-didactic-authentic-cockle-e6d5fc@houat>
In-Reply-To: <20250911-didactic-authentic-cockle-e6d5fc@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 11 Sep 2025 08:52:27 -0700
X-Gm-Features: AS18NWAeBqzBQ72YMefW3bpdVUuxd7DtaUCa6fSUYA3My40EoN0I9-kxEb7x3sc
Message-ID: <CABdmKX1RhwgHb1EizSHUE0PHnxgXib7C8=ZWuVeCi6QetQgGSw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Davis <afd@ti.com>,
 Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Sep 11, 2025 at 12:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> Hi TJ,
>
> On Wed, Sep 10, 2025 at 01:44:45PM -0700, T.J. Mercier wrote:
> > On Wed, Sep 10, 2025 at 12:33=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > >
> > > On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > > > > Here's another attempt at supporting user-space allocations from =
a
> > > > > specific carved-out reserved memory region.
> > > > >
> > > > > The initial problem we were discussing was that I'm currently wor=
king on
> > > > > a platform which has a memory layout with ECC enabled. However, e=
nabling
> > > > > the ECC has a number of drawbacks on that platform: lower perform=
ance,
> > > > > increased memory usage, etc. So for things like framebuffers, the
> > > > > trade-off isn't great and thus there's a memory region with ECC d=
isabled
> > > > > to allocate from for such use cases.
> > > > >
> > > > > After a suggestion from John, I chose to first start using heap
> > > > > allocations flags to allow for userspace to ask for a particular =
ECC
> > > > > setup. This is then backed by a new heap type that runs from rese=
rved
> > > > > memory chunks flagged as such, and the existing DT properties to =
specify
> > > > > the ECC properties.
> > > > >
> > > > > After further discussion, it was considered that flags were not t=
he
> > > > > right solution, and relying on the names of the heaps would be en=
ough to
> > > > > let userspace know the kind of buffer it deals with.
> > > > >
> > > > > Thus, even though the uAPI part of it had been dropped in this se=
cond
> > > > > version, we still needed a driver to create heaps out of carved-o=
ut memory
> > > > > regions. In addition to the original usecase, a similar driver ca=
n be
> > > > > found in BSPs from most vendors, so I believe it would be a usefu=
l
> > > > > addition to the kernel.
> > > > >
> > > > > Some extra discussion with Rob Herring [1] came to the conclusion=
 that
> > > > > some specific compatible for this is not great either, and as suc=
h an
> > > > > new driver probably isn't called for either.
> > > > >
> > > > > Some other discussions we had with John [2] also dropped some hin=
ts that
> > > > > multiple CMA heaps might be a good idea, and some vendors seem to=
 do
> > > > > that too.
> > > > >
> > > > > So here's another attempt that doesn't affect the device tree at =
all and
> > > > > will just create a heap for every CMA reserved memory region.
> > > > >
> > > > > It also falls nicely into the current plan we have to support cgr=
oups in
> > > > > DRM/KMS and v4l2, which is an additional benefit.
> > > > >
> > > > > Let me know what you think,
> > > > > Maxime
> > > >
> > > > Any chance we can get this merged?
> > >
> > > Guys, can we move forward on this?
> > >
> > > Maxime
> >
> > Hi Maxime,
> >
> > Sorry I've been MIA the last couple of months.
> >
> > The docs for the "reusable" property say, "device driver(s) owning the
> > region need to be able to reclaim it back", but how can a driver
> > reclaim memory backing a dmabuf, since pages allocated for a dmabuf
> > aren't necessarily movable. Couldn't a user allocate all of it, and
> > refuse to close those dmabufs?
>
> I guess, but how is that any different than what we're doing on the
> default allocator already?

Yeah fair, it's not. I'm thinking that makes determining a size for a
reusable driver-specified region that's always exposed to userspace a
bit fuzzy. The requirements for the driver can probably be known, but
for potentially unrelated allocations from userspace? The default
ownership / file permissions for the heap would have to be changed to
allow those non-reclaimable allocations, so maybe that's enough of an
opt-in for such regions.

> It also has to be reusable, and will not be able to reclaim any memory
> allocated through the heap.
>
> > I backported this to 6.6 and ran it on a Pixel. While there are
> > already similar out-of-tree dmabuf heap drivers that expose heaps for
> > these reserved regions, they do more than just cma_alloc (multiple
> > flavors of buffer securing, use case specific alignment and padding,
> > and slightly different allocation strategies) so I don't think this
> > series would allow us to completely drop the custom heap code, but
> > it's a nice start.
>
> Thanks for testing, and I totally expect more heaps coming for things
> like protected memory, but it should indeed reduce the number of heap
> drivers needed going forward.
>
> > Does the cgroup part come in because the plan is to add charging in
> > cma_heap.c?
>
> Yes, and the system heap as well.
>
> Maxime

Thanks,

Reviewed-by: T.J. Mercier <tjmercier@google.com>
