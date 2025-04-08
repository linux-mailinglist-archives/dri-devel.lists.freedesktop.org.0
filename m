Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF93A7F91C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B9F10E1B7;
	Tue,  8 Apr 2025 09:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tSWNR0Zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8406410E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:14:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DB85060007;
 Tue,  8 Apr 2025 09:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0BCC4CEEC;
 Tue,  8 Apr 2025 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744103679;
 bh=5T96jd+YxJ7IGn6UQn3A5R31GnrSZ6GL7SLpCq5VmKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tSWNR0ZfWAED8hNKIJ7DVGo7/V4mFLjdGDbDeA49eX+0ZFM2ERQMmj4JTo2BsJ5U7
 NDkIzHb1xw2+71csR2AtpMXLlrB78qDptAL1FSIPPMWuD9ilO7R1UJpReoHugBjTqK
 /CYKNXoEsBDBLlPp7S+fp5QjXW+C54362lQou8nh80P5RRiGRdcRTFxrv1mv+dpcl9
 rssVvDPM/HEOTI1UQZk14UFeKdtW41XdoW7yDYQr18+sOlk6eP2A/lVaVBePoxasPf
 6WNG2dCiRSeuP5IKM6F+k4tlSomwoJFV2K9IS6toDtnQRPHpGMGoXHyBM3I7sI7U0F
 vJ+eCCwSWWGZg==
Date: Tue, 8 Apr 2025 14:44:29 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
Message-ID: <Z_To9V-JOKZ7ChhE@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
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

On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> On Tue, Apr 1, 2025 at 9:58 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > Hi Sumit,
> > >
> >
> > <snip>
> >
> > >
> > > >
> > > > > +
> > > > > +#include "tee_private.h"
> > > > > +
> > > > > +struct tee_dma_heap {
> > > > > +     struct dma_heap *heap;
> > > > > +     enum tee_dma_heap_id id;
> > > > > +     struct tee_rstmem_pool *pool;
> > > > > +     struct tee_device *teedev;
> > > > > +     /* Protects pool and teedev above */
> > > > > +     struct mutex mu;
> > > > > +};
> > > > > +
> > > > > +struct tee_heap_buffer {
> > > > > +     struct tee_rstmem_pool *pool;
> > > > > +     struct tee_device *teedev;
> > > > > +     size_t size;
> > > > > +     size_t offs;
> > > > > +     struct sg_table table;
> > > > > +};
> > > > > +
> > > > > +struct tee_heap_attachment {
> > > > > +     struct sg_table table;
> > > > > +     struct device *dev;
> > > > > +};
> > > > > +
> > > > > +struct tee_rstmem_static_pool {
> > > > > +     struct tee_rstmem_pool pool;
> > > > > +     struct gen_pool *gen_pool;
> > > > > +     phys_addr_t pa_base;
> > > > > +};
> > > > > +
> > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > >
> > > > Can this dependency rather be better managed via Kconfig?
> > >
> > > This was the easiest yet somewhat flexible solution I could find. If
> > > you have something better, let's use that instead.
> > >
> >
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -5,6 +5,7 @@ config OPTEE
> >         depends on HAVE_ARM_SMCCC
> >         depends on MMU
> >         depends on RPMB || !RPMB
> > +       select DMABUF_HEAPS
> >         help
> >           This implements the OP-TEE Trusted Execution Environment (TEE)
> >           driver.
> 
> I wanted to avoid that since there are plenty of use cases where
> DMABUF_HEAPS aren't needed.

Yeah, but how the users will figure out the dependency to enable DMA
heaps with TEE subsystem. So it's better we provide a generic kernel
Kconfig which enables all the default features.

> This seems to do the job:
> +config TEE_DMABUF_HEAP
> + bool
> + depends on TEE = y && DMABUF_HEAPS
> 
> We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kernel.

Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
to use. We should do that such that there isn't a hard dependency to
compile them into the kernel. 

-Sumit

> 
> Cheers,
> Jens
