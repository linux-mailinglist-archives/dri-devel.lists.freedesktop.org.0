Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00934A775CA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378BC10E50A;
	Tue,  1 Apr 2025 07:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C8+R1PlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87710E50A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:58:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 571FDA440BF;
 Tue,  1 Apr 2025 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF80C4CEE4;
 Tue,  1 Apr 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743494337;
 bh=N0aOQujaXvl0WI/8gV+qMIDU5kNcN5JuX3zlJZZiu3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8+R1PlSU58+Xkj6v72qEazJhScUDulxNjdpNdBObwRkmx1nQQVyx5DoIXo0oDXb3
 DUbsHsJPJ04TvJZlceBAPqq9QkTPIMKh6IXC6qu4nocokujzVQjpexdRqGk7SN3xtW
 81U6DERoHeJJEis3pWXYwt6uB1lewwO0wBKmsch+n+GAlvVVPsYOZibwbkME2snpHp
 B+tAAUbmMcabcKha4jynjvRH7/YzHnGvLZOrRTF1F/DAybYREdxkPiQavIgTOSuWhi
 lzNTh+JMThlogM3oqTMYcy0mWZAlLmTlyTKBEX4y1GI9wd5LeqfCghwPaN/wN8SIeB
 KutfL59NdHQ6g==
Date: Tue, 1 Apr 2025 13:28:48 +0530
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
Message-ID: <Z-ucuPzwz4IqVTgb@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> Hi Sumit,
> 

<snip>

> 
> >
> > > +
> > > +#include "tee_private.h"
> > > +
> > > +struct tee_dma_heap {
> > > +     struct dma_heap *heap;
> > > +     enum tee_dma_heap_id id;
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     /* Protects pool and teedev above */
> > > +     struct mutex mu;
> > > +};
> > > +
> > > +struct tee_heap_buffer {
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     size_t size;
> > > +     size_t offs;
> > > +     struct sg_table table;
> > > +};
> > > +
> > > +struct tee_heap_attachment {
> > > +     struct sg_table table;
> > > +     struct device *dev;
> > > +};
> > > +
> > > +struct tee_rstmem_static_pool {
> > > +     struct tee_rstmem_pool pool;
> > > +     struct gen_pool *gen_pool;
> > > +     phys_addr_t pa_base;
> > > +};
> > > +
> > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> >
> > Can this dependency rather be better managed via Kconfig?
> 
> This was the easiest yet somewhat flexible solution I could find. If
> you have something better, let's use that instead.
>

--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -5,6 +5,7 @@ config OPTEE
        depends on HAVE_ARM_SMCCC
        depends on MMU
        depends on RPMB || !RPMB
+       select DMABUF_HEAPS
        help
          This implements the OP-TEE Trusted Execution Environment (TEE)
          driver.

-Sumit
