Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A8972945
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 08:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E92010E648;
	Tue, 10 Sep 2024 06:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qC4GO6Xz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A9D10E648
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 06:06:59 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-277e6002b7dso2706302fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725948418; x=1726553218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
 b=qC4GO6XzqWdh9UJPEE4PFwFUu73KHRfoKvfNiOxQd5xDt3Z8dFr4KPCx6XTcZddSbw
 0D7XOLWqbgo0hIJdQRtEoQbx9dYGs3EnBL0LnclOFfA4ruWKXvlKKrGJ2bvAxa47ZoXM
 3EfIxNcq2IDgV6B02fg/raEsaGI4vXo70U74VKsSXjZ4ZQJVnTDHUOO7pCY5SpBOsuDH
 NqA4zIrnH7G5+OOnr0fNV/VmiyB95sIxAEeMCQzue0QSyn06cR7uXCr0yLCOmgGcMwc6
 EL1bd4ChHn8evsWM040jcw1gmD7zgzQKP/Mha3cDr5NqRcXy2GTZyvKru+SWDZq/ZvXk
 2CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725948418; x=1726553218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9MHdiQIKbQZ7sHVzFN+NNCUWOQwDHp5p4yZrC2v9dg=;
 b=MI5O4g/QA0bKkhozr9p/gYHYifCdaFME5nMdBJ7cjPV5ET486HcC/cu3Vb1TpKTc34
 kIC91XNAkkikYPB5UrPlQJdzRXti9Stky7LWOTxBnM4RdIGG5++X+18thppoN44wwyky
 FRmMdFo7SA0ujiRxAagqJXFkTyR2NfR+xowjv7Jv54S+vxXj3sbrnTCr+eP/L12F0InS
 KCBhfOKO2pRYZQ19cObMcRkew6VpzlHefyU2lNAz6/TFup7dcWvxzNXc1tVpTIkROqwP
 BtXIRn/VcdZi97/pDsgkyRMD4oy0A2OHtfFdGk6pGRsrgAwYA/sxhfYSC5wuHdjuONOJ
 QwpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW85GkbRA4I2RPNo3rTT3mid/jYFhxIbZ6uqpsZJudtmo3unKZSYfLnCm5OvsS4yAhdc1RFER2tfZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuZD6UA1U2T9ZOacaOHVHAmAdrhTKRaNAKboknxw0jbcAGIxeA
 gH4EY87SAksHB95Ks3gYqotHezkTbmu3/qVA/VkdingzR42nEYJET694Teo8JgwFqVp383OCigg
 63bkuRMw15/583VvlVhAAXzjPn8jSCNNHlUAA1w==
X-Google-Smtp-Source: AGHT+IEICe98dkZbn2Ns9nln8TerGdgfmay8kae6nOnNQUjTdvKEr1T8PPGslpKcLz8r5N2w/0aeGsRv9D3S4R0GNlg=
X-Received: by 2002:a05:6870:9122:b0:278:22d3:53 with SMTP id
 586e51a60fabf-27b82e076cdmr13465979fac.12.1725948418296; Mon, 09 Sep 2024
 23:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-5-jens.wiklander@linaro.org>
 <CABdmKX2KzswmiDY4oWw69_rPWs8d_Cqp7OXouSeMQaYX1SDSmw@mail.gmail.com>
 <CAHUa44FYYFVQWf0DGUXNHoOVQEC0-HRyYa0386dHNjo4y1qSiQ@mail.gmail.com>
 <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
In-Reply-To: <CABdmKX0qd0RoTn2TBQTs9zdf=_JP8pW8hFRUR_7n_t-sfxsGdg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 10 Sep 2024 08:06:46 +0200
Message-ID: <CAHUa44E-7UMseWSEeneYYnAPyhH___=a1YYR6uaOVTNZytzg7g@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] dma-buf: heaps: add Linaro restricted dmabuf heap
 support
To: "T.J. Mercier" <tjmercier@google.com>
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

On Wed, Sep 4, 2024 at 11:42=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Wed, Sep 4, 2024 at 2:44=E2=80=AFAM Jens Wiklander <jens.wiklander@lin=
aro.org> wrote:
> >
> > On Tue, Sep 3, 2024 at 7:50=E2=80=AFPM T.J. Mercier <tjmercier@google.c=
om> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 12:04=E2=80=AFAM Jens Wiklander
> > > <jens.wiklander@linaro.org> wrote:
> > > >
> > > > Add a Linaro restricted heap using the linaro,restricted-heap bindi=
ngs
> > > > implemented based on the generic restricted heap.
> > > >
> > > > The bindings defines a range of physical restricted memory. The hea=
p
> > > > manages this address range using genalloc. The allocated dma-buf fi=
le
> > > > descriptor can later be registered with the TEE subsystem for later=
 use
> > > > via Trusted Applications in the secure world.
> > > >
> > > > Co-developed-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> > > >  drivers/dma-buf/heaps/Makefile                |   1 +
> > > >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++=
++++
> > > >  3 files changed, 176 insertions(+)
> > > >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > >
> > > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/=
Kconfig
> > > > index 58903bc62ac8..82e2c5d09242 100644
> > > > --- a/drivers/dma-buf/heaps/Kconfig
> > > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > > @@ -28,3 +28,13 @@ config DMABUF_HEAPS_RESTRICTED_MTK
> > > >         help
> > > >           Enable restricted dma-buf heaps for MediaTek platform. Th=
is heap is backed by
> > > >           TEE client interfaces. If in doubt, say N.
> > > > +
> > > > +config DMABUF_HEAPS_RESTRICTED_LINARO
> > > > +       bool "Linaro DMA-BUF Restricted Heap"
> > > > +       depends on DMABUF_HEAPS_RESTRICTED
> > > > +       help
> > > > +         Choose this option to enable the Linaro restricted dma-bu=
f heap.
> > > > +         The restricted heap pools are defined according to the DT=
. Heaps
> > > > +         are allocated in the pools using gen allocater.
> > > > +         If in doubt, say N.
> > > > +
> > > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps=
/Makefile
> > > > index 0028aa9d875f..66b2f67c47b5 100644
> > > > --- a/drivers/dma-buf/heaps/Makefile
> > > > +++ b/drivers/dma-buf/heaps/Makefile
> > > > @@ -2,4 +2,5 @@
> > > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)         +=3D cma_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)  +=3D restricted_heap.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)      +=3D restricted_hea=
p_mtk.o
> > > > +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_LINARO)   +=3D restricted_hea=
p_linaro.o
> > > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)      +=3D system_heap.o
> > > > diff --git a/drivers/dma-buf/heaps/restricted_heap_linaro.c b/drive=
rs/dma-buf/heaps/restricted_heap_linaro.c
> > > > new file mode 100644
> > > > index 000000000000..4b08ed514023
> > > > --- /dev/null
> > > > +++ b/drivers/dma-buf/heaps/restricted_heap_linaro.c
> > > > @@ -0,0 +1,165 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * DMABUF secure heap exporter
> > > > + *
> > > > + * Copyright 2021 NXP.
> > > > + * Copyright 2024 Linaro Limited.
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt)     "rheap_linaro: " fmt
> > > > +
> > > > +#include <linux/dma-buf.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/genalloc.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_fdt.h>
> > > > +#include <linux/of_reserved_mem.h>
> > > > +#include <linux/scatterlist.h>
> > > > +#include <linux/slab.h>
> > > > +
> > > > +#include "restricted_heap.h"
> > > > +
> > > > +#define MAX_HEAP_COUNT 2
> > >
> > > Are multiple supported because of what Cyrille mentioned here about p=
ermissions?
> > > https://lore.kernel.org/lkml/DBBPR04MB7514E006455AEA407041E4F788709@D=
BBPR04MB7514.eurprd04.prod.outlook.com/
> >
> > Yes, I kept that as is.
>
> Ok thanks.
>
> > > So this is just some arbitrary limit? I'd prefer to have some sort of
> > > documentation about this.
> >
> > How about removing the limit and using dynamic allocation instead?
>
> That works too!

It turns out that was easier said than done. The limit is hardcoded
because dynamic memory allocation isn't available at that stage during
boot. We have a short description of this heap in Kconfig. I'll add
something about the limit there if that makes sense.

Thanks,
Jens
