Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B812F5476
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 22:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33BF6EC68;
	Wed, 13 Jan 2021 21:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9DB6EC65;
 Wed, 13 Jan 2021 21:10:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23589380-1500050 for multiple; Wed, 13 Jan 2021 21:08:56 +0000
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
References: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
 <161055261490.6195.7986280621869334351@build.alporthouse.com>
 <CAKMK7uEnnEj_YAR5Tm3jpS7MNPkqB43JBhQnY_K0YQ+LE9wL1g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm-buf: Add debug option
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Jan 2021 21:08:54 +0000
Message-ID: <161057213487.6195.581396740566956696@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Christian König <christian.koenig@amd.com>, DMA BUFFER SHARING FRAMEWORK <linaro-mm-sig@lists.linaro.org>, David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>, DMA BUFFER SHARING FRAMEWORK <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-01-13 20:50:11)
> On Wed, Jan 13, 2021 at 4:43 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > Quoting Daniel Vetter (2021-01-13 14:06:04)
> > > We have too many people abusing the struct page they can get at but
> > > really shouldn't in importers. Aside from that the backing page might
> > > simply not exist (for dynamic p2p mappings) looking at it and using it
> > > e.g. for mmap can also wreak the page handling of the exporter
> > > completely. Importers really must go through the proper interface like
> > > dma_buf_mmap for everything.
> >
> > If the exporter doesn't want to expose the struct page, why are they
> > setting it in the exported sg_table?
> 
> You need to store it somewhere, otherwise the dma-api doesn't work.
> Essentially this achieves clearing/resetting the struct page pointer,
> without additional allocations somewhere, or tons of driver changes
> (since presumably the driver does keep track of the struct page
> somewhere too).

Only for mapping, and that's before the export -- if there's even a
struct page to begin with.
 
> Also as long as we have random importers looking at struct page we
> can't just remove it, or crashes everywhere. So it has to be some
> debug option you can disable.

Totally agreed that nothing generic can rely on pages being transported
via dma-buf, and memfd is there if you do want a suitable transport. The
one I don't know about is dma-buf heap, do both parties there consent to
transport pages via the dma-buf? i.e. do they have special cases for
import/export between heaps?
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
