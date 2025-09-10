Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4F1B5229D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C39910E9F0;
	Wed, 10 Sep 2025 20:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="APg+ZZkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A410E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45dd9d72f61so26705e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757537098; x=1758141898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdj+uOiXuiIXzM1Vn3fcDOOxGOrxrCVtY7jUVpK65ZI=;
 b=APg+ZZkOFOnKjyWHRi/N+YVfuI8ZXJ7wS2xPbZonyB41ildzF18ZKqh/rale32gfV7
 ErJfy6yLBWDH4nCwbR/Hyfe+I1B3I//M7QCfxmUObPMP6hIGxpjAoqazakvcTWOniP9J
 kUPn1iyppA4SNPqa3zJv6xCnn8EuH6SmfYnryYnTO2ZChPAea8GLvuXOs4kZFPRL2Hj7
 lH0tLk45IGcdJh5/iVuC6D59jX3z4zsk24liqsHKS7NWkGEIoXUxaz3nMhuyulEP6tL/
 WCDHqnl3sQbLVFr90qxtx3E8BpptsMoOIpoxy7i5Y2kZUIhep6M8M+SXvNaBsw5FRHe8
 TwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537098; x=1758141898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdj+uOiXuiIXzM1Vn3fcDOOxGOrxrCVtY7jUVpK65ZI=;
 b=JTdSbjWUxeXB3bljb7jsfqREgR0neejorxUNYuzSNmpaUNH+huoSsU3x1Ek1ah36l2
 7pnuj0zVNKkB3e51/PnrPNQipWkGQ2bTgno9qoLr0zkwhjrKnLWVnJL+5nzRBKEe5gzo
 WfpdDAK4LSLtuuA8yIMVBYlaKdu2Zr4fixJLedUY6oqyzuPP0umob/Bh8uLhoUuskAQ0
 q9Ej4Xn3YmkP8UWfBMT7zFYsDlTS8f2wQuITF/vkorK7ehzJAJhRM4SSpcKhb2duEmyT
 zUPFSZZmLZqGFykp1zs7OMXShMLHiGijCh0dvid8x/bywDpTfFPyBSd9AE6iFCYx3N3n
 iasA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsjDf05pfb2VlApxyyTU6Q9TNQ1SnCTWDpb/7gnIR+FhpoJJyU1RkTGrmIJ46+8lOmQZ7zCXA3oV0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR83V7VGARMwI/oUQCZylDEZFyMSFWLaJx8NGLkNDU7cxHwDsC
 PMpQQBpEMG08kSy2wEAOe6atjbTUM7mNAQljfxxqVL/cLg1Rv/THko6Uk5XwZp+uUinRpTrjviS
 AAJ25bZKhBRegU9wVWyrq/ymzorwe6K/y9jRMHorY
X-Gm-Gg: ASbGnctBjLa5ASiS/hSAn3FfuYP3zvDtnaZdDM/y00Wtvv+QwS/ql8Q2lyk+1wa7CSD
 WauDHebA9xz3FIzWD2eXyE+aeoEHoVpvtAEP8l5ySfKb/2ySdEnkLyJicFuufGMk/gb/LxVDdix
 YJ8app/NdD3bM6s4n6ErPdQgJn/l0h1kdJol8bclUdjtjZHzdMcYfB2Zn5bwKW/gHV2TE6feNaJ
 WHkTXxrK+cjb6sc3W4/eC6n5EH10hLKRALUm4RVrt1ElayIL/wWgns=
X-Google-Smtp-Source: AGHT+IF/Fz2Y5nk02badGqITxY1/tzo4lRqGZ2Zao4nfkcXFZyjJgtYYuI6B/Fj3L639UAHyqOxbIJ21cF9JPLUpaI8=
X-Received: by 2002:a05:600c:1502:b0:45b:7d8f:4bd4 with SMTP id
 5b1f17b1804b1-45df74f81cemr1873365e9.4.1757537098041; Wed, 10 Sep 2025
 13:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat>
 <20250910-vigorous-attractive-gorilla-af6fec@houat>
In-Reply-To: <20250910-vigorous-attractive-gorilla-af6fec@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Sep 2025 13:44:45 -0700
X-Gm-Features: AS18NWDgBu3edPeSCZERO8HncQFGrRuZvzuC8yXw-tqKPcuIWCidg2bFxSYLb0U
Message-ID: <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com>
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

On Wed, Sep 10, 2025 at 12:33=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > > Here's another attempt at supporting user-space allocations from a
> > > specific carved-out reserved memory region.
> > >
> > > The initial problem we were discussing was that I'm currently working=
 on
> > > a platform which has a memory layout with ECC enabled. However, enabl=
ing
> > > the ECC has a number of drawbacks on that platform: lower performance=
,
> > > increased memory usage, etc. So for things like framebuffers, the
> > > trade-off isn't great and thus there's a memory region with ECC disab=
led
> > > to allocate from for such use cases.
> > >
> > > After a suggestion from John, I chose to first start using heap
> > > allocations flags to allow for userspace to ask for a particular ECC
> > > setup. This is then backed by a new heap type that runs from reserved
> > > memory chunks flagged as such, and the existing DT properties to spec=
ify
> > > the ECC properties.
> > >
> > > After further discussion, it was considered that flags were not the
> > > right solution, and relying on the names of the heaps would be enough=
 to
> > > let userspace know the kind of buffer it deals with.
> > >
> > > Thus, even though the uAPI part of it had been dropped in this second
> > > version, we still needed a driver to create heaps out of carved-out m=
emory
> > > regions. In addition to the original usecase, a similar driver can be
> > > found in BSPs from most vendors, so I believe it would be a useful
> > > addition to the kernel.
> > >
> > > Some extra discussion with Rob Herring [1] came to the conclusion tha=
t
> > > some specific compatible for this is not great either, and as such an
> > > new driver probably isn't called for either.
> > >
> > > Some other discussions we had with John [2] also dropped some hints t=
hat
> > > multiple CMA heaps might be a good idea, and some vendors seem to do
> > > that too.
> > >
> > > So here's another attempt that doesn't affect the device tree at all =
and
> > > will just create a heap for every CMA reserved memory region.
> > >
> > > It also falls nicely into the current plan we have to support cgroups=
 in
> > > DRM/KMS and v4l2, which is an additional benefit.
> > >
> > > Let me know what you think,
> > > Maxime
> >
> > Any chance we can get this merged?
>
> Guys, can we move forward on this?
>
> Maxime

Hi Maxime,

Sorry I've been MIA the last couple of months.

The docs for the "reusable" property say, "device driver(s) owning the
region need to be able to reclaim it back", but how can a driver
reclaim memory backing a dmabuf, since pages allocated for a dmabuf
aren't necessarily movable. Couldn't a user allocate all of it, and
refuse to close those dmabufs?

I backported this to 6.6 and ran it on a Pixel. While there are
already similar out-of-tree dmabuf heap drivers that expose heaps for
these reserved regions, they do more than just cma_alloc (multiple
flavors of buffer securing, use case specific alignment and padding,
and slightly different allocation strategies) so I don't think this
series would allow us to completely drop the custom heap code, but
it's a nice start. Does the cgroup part come in because the plan is to
add charging in cma_heap.c?

Thanks,
T.J.
