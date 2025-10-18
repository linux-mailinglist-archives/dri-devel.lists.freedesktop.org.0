Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27207BED359
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 18:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565AF10E002;
	Sat, 18 Oct 2025 16:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dtn31Kbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19E210E11F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 16:03:27 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso556069266b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760803406; x=1761408206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PDE1i70uMuyHnvAFVWfjyIRl/K/1UfDOKuhRPGumqU=;
 b=Dtn31KbdmA9NBNJILM1BfZwUjDIfIC7tpISE0XwTahXIKZktwAAq3UQSPMrOxEm5XM
 TGHPGrBkxXwNnewpV4dUXVDaNmgo0h3IB3grTh+s3hE6P3zXMbtAxYQZzEYya9k5F6AM
 AepTVqfgYPhbSDZHR4iCCwchs898VyzMRuqgn6tSoKFvAz7n9ccUE/JS7UTYE8zqtd8g
 N+hguRFjlj0HA73q5m/i4X9PAwpttWAhiSXGqs3NMOKJK7bOKNQ3azBImIUi1kDwpOw8
 SW/cF/++cnsSZI7gMdfIYMVvHpZR1gYEQXHo2i+honWVuM5XIe4s8LuixN2C0Ib0XDaL
 E+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760803406; x=1761408206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PDE1i70uMuyHnvAFVWfjyIRl/K/1UfDOKuhRPGumqU=;
 b=uOImF9Fo8va8x10R5G31/UzN5fDS3pQxH3Zab5chRrg2OkcdjBt/Rrweb+DvI5N9HY
 y/MlBRoAnHfjUf51JYRb2hKsxDDWziiRsh4i8D+YNR0PEyfs4ibuCvO4wBRwFDn5ftEs
 FPQP26gNUnW9G4q+xv5bM7aFDERianWtpEBCQk7HwN1BccuDZMSb6ZRYiB7NqKKCwuHK
 PcdfncRSsfsyxxNfL/Rnb17tdByXQupFAls/kD2X6ZyJTpiOHr+ReamE4xz4XbGivHwT
 0HiO+NNANXK5vgzBpXux04TooTRUADakRfV43q8LrcBWBOTO36uPxq/4lvYrTvH5lcDy
 UT8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEP2jJZ4XyZs0qvDg5QqdqAzPqSMtSwNBbSk8R0Qi3ZW5Tmfsc+PeB9xFnuBO1ccNBrZ2JlDxYzOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcAFRGDJI46km8pfNpAPALI2CqT+V5fuhbN+rCekn+mx5TFSVw
 axUE23vbJ2ZNOdoL6hlCHS0w6qezR1nHbl8C9j6bufjJKa8HKktx1czb0UhjLZ4WYn2MU47UwFD
 qmzi4wbuBvZsKvdRjux+xZSdb4wwT4+gIhOvHSpYQ5w==
X-Gm-Gg: ASbGncvzBFtKIEu14YE3Wkq2WQ/cRA31bmUs8iuvdedyzTwcWK6wu+eJ8iyZ+jIQnG2
 grdjuVEgTLpxth4YqW67I0BkMfV/RHYWUD/PYfRDMj+HoqivrlAKS2kMer5p5p5dmAyRTBtEnQI
 Po5ny/v47pque4JM9sD2oQRcrt0Vnmz23XO6e3OMeorL+PuFKo1AWQDO9xIreR7Ls4Wx59lr0FM
 AoTk6toSd/4B/a7UEA1Yf3gcKRXRj+peNq9DPtcXuAztHS2r0sGaglczSwPV48pWbO0ac3Wl6yw
 d8iOM2l8gsxCRrItHoziAQpXJNs=
X-Google-Smtp-Source: AGHT+IHexk19IgNk6IuP2jV+2x2wF7f0unp4c1GwwYyOBf/8w9heBdr+ysi7d7B9dpzKsMkgpYC1PUK3YyRIdsL9bbA=
X-Received: by 2002:a17:907:97d4:b0:b2a:10a3:7113 with SMTP id
 a640c23a62f3a-b64725722f3mr807862966b.29.1760803406106; Sat, 18 Oct 2025
 09:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
 <CAO_48GGD8sCoQt_qWKqcbg6v7Cyi5U9QsxsvNOcqfkLRqHS7_w@mail.gmail.com>
In-Reply-To: <CAO_48GGD8sCoQt_qWKqcbg6v7Cyi5U9QsxsvNOcqfkLRqHS7_w@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Sat, 18 Oct 2025 21:33:14 +0530
X-Gm-Features: AS18NWCxIWZfRS3hG4C_yzteaWS7C2gP5_aCiLwTRjHCdW6sGbeW-DvFPRdxwEc
Message-ID: <CAO_48GEXC0FDkeRN57e5Yc=4WCwjh=9pDpZXjowZzEaPPsAd-w@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
To: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev
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

On Wed, 15 Oct 2025 at 13:53, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hi Maxime,
>
> On Mon, 13 Oct 2025 at 14:05, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > Here's another attempt at supporting user-space allocations from a
> > specific carved-out reserved memory region.
>
>
> Thank you for the series - I think it looks pretty decent, and with
> Marek's Acked-by for the cma patch [1], I'm inclined to merge it.
>
> I'll wait till today evening, in case there are any more comments, and
> then go ahead and merge it.


Thank you; it's merged to drm-misc-next now.
>
>
> Best,
> Sumit.
>
> >
> > The initial problem we were discussing was that I'm currently working o=
n
> > a platform which has a memory layout with ECC enabled. However, enablin=
g
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disable=
d
> > to allocate from for such use cases.
> >
> > After a suggestion from John, I chose to first start using heap
> > allocations flags to allow for userspace to ask for a particular ECC
> > setup. This is then backed by a new heap type that runs from reserved
> > memory chunks flagged as such, and the existing DT properties to specif=
y
> > the ECC properties.
> >
> > After further discussion, it was considered that flags were not the
> > right solution, and relying on the names of the heaps would be enough t=
o
> > let userspace know the kind of buffer it deals with.
> >
> > Thus, even though the uAPI part of it had been dropped in this second
> > version, we still needed a driver to create heaps out of carved-out mem=
ory
> > regions. In addition to the original usecase, a similar driver can be
> > found in BSPs from most vendors, so I believe it would be a useful
> > addition to the kernel.
> >
> > Some extra discussion with Rob Herring [1] came to the conclusion that
> > some specific compatible for this is not great either, and as such an
> > new driver probably isn't called for either.
> >
> > Some other discussions we had with John [2] also dropped some hints tha=
t
> > multiple CMA heaps might be a good idea, and some vendors seem to do
> > that too.
> >
> > So here's another attempt that doesn't affect the device tree at all an=
d
> > will just create a heap for every CMA reserved memory region.
> >
> > It also falls nicely into the current plan we have to support cgroups i=
n
> > DRM/KMS and v4l2, which is an additional benefit.
> >
> > Let me know what you think,
> > Maxime
> >
> > 1: https://lore.kernel.org/all/20250707-cobalt-dingo-of-serenity-dbf92c=
@houat/
> > 2: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=3Dc71kzFFaWK-fF5rCdnr9=
P5h1sgPOWSGSw@mail.gmail.com/
> >
> > Let me know what you think,
> > Maxime
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v8:
> > - Rebased on top of 6.18-rc1
> > - Added TJ R-b
> > - Link to v7: https://lore.kernel.org/r/20250721-dma-buf-ecc-heap-v7-0-=
031836e1a942@kernel.org
> >
> > Changes in v7:
> > - Invert the logic and register CMA heap from the reserved memory /
> >   dma contiguous code, instead of iterating over them from the CMA heap=
.
> > - Link to v6: https://lore.kernel.org/r/20250709-dma-buf-ecc-heap-v6-0-=
dac9bf80f35d@kernel.org
> >
> > Changes in v6:
> > - Drop the new driver and allocate a CMA heap for each region now
> > - Dropped the binding
> > - Rebased on 6.16-rc5
> > - Link to v5: https://lore.kernel.org/r/20250617-dma-buf-ecc-heap-v5-0-=
0abdc5863a4f@kernel.org
> >
> > Changes in v5:
> > - Rebased on 6.16-rc2
> > - Switch from property to dedicated binding
> > - Link to v4: https://lore.kernel.org/r/20250520-dma-buf-ecc-heap-v4-1-=
bd2e1f1bb42c@kernel.org
> >
> > Changes in v4:
> > - Rebased on 6.15-rc7
> > - Map buffers only when map is actually called, not at allocation time
> > - Deal with restricted-dma-pool and shared-dma-pool
> > - Reword Kconfig options
> > - Properly report dma_map_sgtable failures
> > - Link to v3: https://lore.kernel.org/r/20250407-dma-buf-ecc-heap-v3-0-=
97cdd36a5f29@kernel.org
> >
> > Changes in v3:
> > - Reworked global variable patch
> > - Link to v2: https://lore.kernel.org/r/20250401-dma-buf-ecc-heap-v2-0-=
043fd006a1af@kernel.org
> >
> > Changes in v2:
> > - Add vmap/vunmap operations
> > - Drop ECC flags uapi
> > - Rebase on top of 6.14
> > - Link to v1: https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-0-=
54cbbd049511@kernel.org
> >
> > ---
> > Maxime Ripard (5):
> >       doc: dma-buf: List the heaps by name
> >       dma-buf: heaps: cma: Register list of CMA regions at boot
> >       dma: contiguous: Register reusable CMA regions at boot
> >       dma: contiguous: Reserve default CMA heap
> >       dma-buf: heaps: cma: Create CMA heap for each CMA reserved region
> >
> >  Documentation/userspace-api/dma-buf-heaps.rst | 24 ++++++++------
> >  MAINTAINERS                                   |  1 +
> >  drivers/dma-buf/heaps/Kconfig                 | 10 ------
> >  drivers/dma-buf/heaps/cma_heap.c              | 47 +++++++++++++++++--=
--------
> >  include/linux/dma-buf/heaps/cma.h             | 16 +++++++++
> >  kernel/dma/contiguous.c                       | 11 +++++++
> >  6 files changed, 72 insertions(+), 37 deletions(-)
> > ---
> > base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
> > change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e
> > prerequisite-message-id: <20250610131231.1724627-1-jkangas@redhat.com>
> > prerequisite-patch-id: bc44be5968feb187f2bc1b8074af7209462b18e7
> > prerequisite-patch-id: f02a91b723e5ec01fbfedf3c3905218b43d432da
> > prerequisite-patch-id: e944d0a3e22f2cdf4d3b3906e5603af934696deb
> >
> > Best regards,
> > --
> > Maxime Ripard <mripard@kernel.org>
> >
>
>
> --
> Thanks and regards,
>
> Sumit Semwal (he / him)
> Senior Tech Lead - Android, Platforms and Virtualisation
> Linaro.org =E2=94=82 Arm Solutions at Light Speed



--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed
