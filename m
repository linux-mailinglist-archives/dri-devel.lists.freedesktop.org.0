Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B683973AFF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7426210E852;
	Tue, 10 Sep 2024 15:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Rwc+OP15";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F6D10E852
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:08:23 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4582fa01090so289181cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725980902; x=1726585702;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
 b=Rwc+OP15ok/sYDKuoTC43m05rTaSl7MXx48XWizTBvtx6DwMfLKJubfzOz222iR7Sc
 7Y+KxDU4wpfFFSpSb3zeRH2Hq1w1vlYLu5MSJZbkHvOTDHO76ZEGwsexpNSp/YWqX2TJ
 muMmS/LL5O977sy26mH5mzYGp5YMjH1PQTTg4xNFnSDcYYnjmlpHPzCokxGWn8MZdNXI
 UZPAhelXjQlf7gOxDyVkRPANV2pLGURfXLW+0Cnc/G1A4vLhivg42aF/BDKjX0Ur0FJF
 c2wm2dbgimk6ounacfLqhCr1nrpiMlEjpvIoGzImA7rm3bzoXiZ0dEoCtI6cwd8XRoau
 EAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725980902; x=1726585702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HiSPE2re4i7ztv5W1E1npIwrh98/6F2AGMg3S1xMoPU=;
 b=qy62CSGNXsCL6KCGxMOlR1ndslQ1nIVXxxdWMEJt+jvm8JEBK1bbxKa3MpczEcp+CK
 GMvOVNk/hU3AwdgRQxE9YxKmib1uRo51QsDCju/meDYW82MxRorc8wEpfSQmUeExo5/6
 9aKWHJrB9zh3u6o4o9slUoWNUFDbHgTRg4Rn/gVQnE9CZ53oztvuJQFblAFPbCqnm9qq
 fIQqhxZqEqtYT3f1gqE6g3cm5i4//FBVQ5lF+sTkP1Mz04XUj+85Lwi5WzYDSsvWUon2
 3B/N7L25QSm3TZljq5i50pnGdluiFUk+gfI3YRmDjWw2HVMafKjZXAivpMpUFlMFYClJ
 3e9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgQlSGZTI1u0bJoCYxxmd8ytCwsUGxAj1L85PGD/jqeH7+NS4OID1zzwcXrDnrOXVbgRLyjPb+FHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9bI+xTGLLE3O8ZI1HiEFzOmvW6vpeiCLFCGqdvAhrYKl/7FW4
 JRN5IB9slPRzXxr2XCOgfMDDAn9233TtRMaWZDT2pqa+kbutdaVSojNdvaqCFDZFTjXlbOLze4K
 wR3q7X18zME2GSzU0SjOl+qp3Q3vie5hkbqun
X-Google-Smtp-Source: AGHT+IGk/+MqjVLBNa+qD5EowmlfqCvCzaFlTfS1uq8t2r3RhadFZpBGCv9ceFcyyjW5GiIdk+Cu14iQs471/8FCg7c=
X-Received: by 2002:ac8:5dc6:0:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4583d0600f1mr4121411cf.12.1725980901915; Tue, 10 Sep 2024
 08:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org>
 <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
 <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
In-Reply-To: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Sep 2024 08:08:10 -0700
Message-ID: <CABdmKX2Tsp-KG6_Lth7VUcZcxCfgbsBYqZ5N2h574J+sNP2SxA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap
 support
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

On Mon, Sep 9, 2024 at 11:06=E2=80=AFPM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@l=
inaro.org> wrote:
> > >
> > > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google=
.com> wrote:
> > > >
> > > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > > <jens.wiklander@linaro.org> wrote:
> > > > >
> > > > > Add a Linaro restricted heap using the linaro,restricted-heap bin=
dings
> > > > > implemented based on the generic restricted heap.
> > > > >
> > > > > The bindings defines a range of physical restricted memory. The h=
eap
> > > > > manages this address range using genalloc. The allocated dma-buf =
file
> > > > > descriptor can later be registered with the TEE subsystem for lat=
er use
> > > > > via Trusted Applications in the secure world.
> > > > >
> > > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > ---
> > > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++=
++++++
> > > > >  3 files changed, 176 insertions(+)
> > > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.=
c
> > > > >
> > > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heap=
s/Kconfig
> > > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > > >         help
> > > > >           Enable restricted dma-buf heaps for MediaTek platform. =
This heap is backed by
> > > > >           TEE client interfaces. If in doubt, say N.
> > > > > +
> > > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > > +       help
> > > > > +         Choose this option to enable the Linaro restricted dma-=
buf heap.
> > > > > +         The restricted heap pools are defined according to the =
DT. Heaps
> > > > > +         are allocated in the pools using gen allocater.
> > > > > +         If in doubt, say N.
> > > > > +
> > > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/hea=
ps/Makefile
> > > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > > @@ -2,4 +2,5 @@
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_h=
eap_mtk.o
> > > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_h=
eap_linaro.o
> > > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/dri=
vers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > new file mode 100644
> > > > > index 000000000000..4b08ed514023
> > > > > --- /dev/null
> > > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > > @@ -0,0 +1,165 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * DMABUF secure heap exporter
> > > > > + *
> > > > > + * Copyright 2021 NXP.
> > > > > + * Copyright 2024 Linaro Limited.
> > > > > + */
> > > > > +
> > > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > > +
> > > > > +#include <linux/dma-buf.h>
> > > > > +#include <linux/err.h>
> > > > > +#include <linux/genalloc.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/of.h>
> > > > > +#include <linux/of_fdt.h>
> > > > > +#include <linux/of_reserved_mem.h>
> > > > > +#include <linux/scatterlist.h>
> > > > > +#include <linux/slab.h>
> > > > > +
> > > > > +#include "restricted_heap.h"
> > > > > +
> > > > > +#define MAX_HEAP_COUNT 2
> > > >
> > > > Are multiple supported because of what Cyrille mentioned here about=
 permissions?
> > > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709=
@DBBPR04MB7514.eurprd04.prod.outlook.com/
> > >
> > > Yes, I kept that as is.
> >
> > Ok thanks.
> >
> > > > So this is just some arbitrary limit? I'd prefer to have some sort =
of
> > > > documentation about this.
> > >
> > > How about removing the limit and using dynamic allocation instead?
> >
> > That works too!
>
> It turns out that was easier said than done. The limit is hardcoded
> because dynamic memory allocation isn't available at that stage during
> boot. We have a short description of this heap in Kconfig. I'll add
> something about the limit there if that makes sense.
>
> Thanks,
> Jens

Ah ok sounds good.

I noticed one other thing, linaro_restricted_heap_init and add_heap
should probably have __init. Last week I sent a patch to add that for
the CMA and system heaps.
