Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB1484E6A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 07:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57C10F865;
	Wed,  5 Jan 2022 06:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B403D10F862
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 06:36:00 +0000 (UTC)
X-UUID: 74e77be901fe420393d4d2238783a093-20220105
X-UUID: 74e77be901fe420393d4d2238783a093-20220105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 295248893; Wed, 05 Jan 2022 14:35:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 5 Jan 2022 14:35:54 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 5 Jan 2022 14:35:53 +0800
From: <guangming.cao@mediatek.com>
To: <christian.koenig@amd.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
Date: Wed, 5 Jan 2022 14:36:43 +0800
Message-ID: <20220105063643.119874-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
References: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
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
Cc: linux-arm-kernel@lists.infradead.org, guangming.cao@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mingyuan.ma@mediatek.com,
 linaro-mm-sig@lists.linaro.org, yf.wang@mediatek.com, libo.kang@mediatek.com,
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, labbott@redhat.com,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming.Cao <guangming.cao@mediatek.com>

On Tue, 2022-01-04 at 08:47 +0100, Christian K鰊ig wrote:
> Am 03.01.22 um 19:57 schrieb John Stultz:
> > On Mon, Dec 27, 2021 at 1:52 AM <guangming.cao@mediatek.com> wrote:
> > > From: Guangming <Guangming.Cao@mediatek.com>
> > > 
> > 
> > Thanks for submitting this!
> > 
> > > Add a size check for allcation since the allocation size is
> > 
> > nit: "allocation" above.
> > 
> > > always less than the total DRAM size.
> > 
> > In general, it might be good to add more context to the commit
> > message
> > to better answer *why* this change is needed rather than what the
> > change is doing.  ie: What negative thing happens without this
> > change?
> > And so how does this change avoid or improve things?
> 
> Completely agree, just one little addition: Could you also add this
> why 
> as comment to the code?
> 
> When we stumble over this five years from now it is absolutely not 
> obvious why we do this.
> 
> Thanks,
> Christian.
> 
Thanks for your reply!
I will update the related reason in the patch later.

The reason for adding this check is that we met a case that the user
sent an invalid size(It seems it's a negative value, MSB is 0xff, it's
larger than DRAM size after convert it to size_t) to dma-heap to alloc
memory, and this allocation was running on a process(such as "gralloc"
on Android device) can't be killed by OOM flow, and we also couldn't
find the related dmabuf in "dma_buf_debug_show" because the related
dmabuf was not exported yet since the allocation is still on going.

Since this invalid argument case can be prevented at dma-heap side, so,
I added this size check, and moreover, to let debug it easily, I also
added logs when size is bigger than a threshold we set in mtk system
heap.
If you think that print logs in dma-heap framework is better, I will
update it in next version.

If you have better solution(such as dump the size under allocating
in "dma_buf_debug_show", which maybe need add global variable to record
it), please kindly let me know.
Thanks :)
Guangming

> > 
> > 
> > > Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> > > Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> > > ---
> > > v2: 1. update size limitation as total_dram page size.
> > >      2. update commit message
> > > ---
> > >   drivers/dma-buf/dma-heap.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-
> > > heap.c
> > > index 56bf5ad01ad5..e39d2be98d69 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct
> > > dma_heap *heap, size_t len,
> > >          struct dma_buf *dmabuf;
> > >          int fd;
> > > 
> > > +       if (len / PAGE_SIZE > totalram_pages())
> > > +               return -EINVAL;
> > 
> > This seems sane. I know ION used to have some 1/2 of memory cap to
> > avoid unnecessary memory pressure on crazy allocations.
> > 
> > Could you send again with an improved commit message?
> > 
> > thanks
> > -john
> 
> 
