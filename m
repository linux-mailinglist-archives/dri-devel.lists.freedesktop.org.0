Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5553D0B8B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F2A6E949;
	Wed, 21 Jul 2021 09:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D536E949
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:43:21 +0000 (UTC)
X-UUID: 82db7ebf1ab742f789ea29cbd51c6732-20210721
X-UUID: 82db7ebf1ab742f789ea29cbd51c6732-20210721
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1811651001; Wed, 21 Jul 2021 17:43:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 17:43:15 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas07.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 21 Jul 2021 17:43:15 +0800
From: <guangming.cao@mediatek.com>
To: <Brian.Starkey@arm.com>, <benjamin.gaignard@linaro.org>,
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <john.stultz@linaro.org>, <labbott@redhat.com>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <lmark@codeaurora.org>,
 <matthias.bgg@gmail.com>, <sumit.semwal@linaro.org>
Subject: [PATCH] dma-heap: Let dma heap use dma_map_attrs to map & unmap iova
Date: Wed, 21 Jul 2021 17:43:14 +0800
Message-ID: <20210721094314.117413-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210715062405.98932-1-guangming.cao@mediatek.com>
References: <20210715062405.98932-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Guangming Cao <Guangming.Cao@mediatek.com>, wsd_upstream@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Thu, 2021-07-15 at 14:24 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> On Thu, 2021-07-08 at 18:14 +0800, guangming.cao@mediatek.com wrote:
> 
> Hi Sumit, Christian, Matthias,
> 
> gentle ping for this patch :)

move receviers to '--to' list.
gentle ping for this patch  :)

> 
> BRs!
> Guangming
> 
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > 
> > For dma-heap users, they can't bypass cache sync when map/unmap
> > iova
> > with dma heap. But they can do it by adding DMA_ATTR_SKIP_CPU_SYNC
> > into dma_alloc_attrs.
> > 
> > To keep alignment, at dma_heap side, also use
> > dma_buf_attachment.dma_map_attrs to do iova map & unmap.
> > 
> > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
> >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-
> > buf/heaps/cma_heap.c
> > index 0c05b79870f9..2c9feb3bfc3e 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -99,9 +99,10 @@ static struct sg_table
> > *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
> >  {
> >  	struct dma_heap_attachment *a = attachment->priv;
> >  	struct sg_table *table = &a->table;
> > +	int attrs = attachment->dma_map_attrs;
> >  	int ret;
> >  
> > -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +	ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >  	if (ret)
> >  		return ERR_PTR(-ENOMEM);
> >  	a->mapped = true;
> > @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >  				   enum dma_data_direction direction)
> >  {
> >  	struct dma_heap_attachment *a = attachment->priv;
> > +	int attrs = attachment->dma_map_attrs;
> >  
> >  	a->mapped = false;
> > -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> > buf/heaps/system_heap.c
> > index 23a7e74ef966..fc7b1e02988e 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -130,9 +130,10 @@ static struct sg_table
> > *system_heap_map_dma_buf(struct dma_buf_attachment *attac
> >  {
> >  	struct dma_heap_attachment *a = attachment->priv;
> >  	struct sg_table *table = a->table;
> > +	int attrs = attachment->dma_map_attrs;
> >  	int ret;
> >  
> > -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> > +	ret = dma_map_sgtable(attachment->dev, table, direction,
> > attrs);
> >  	if (ret)
> >  		return ERR_PTR(ret);
> >  
> > @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct
> > dma_buf_attachment *attachment,
> >  				      enum dma_data_direction
> > direction)
> >  {
> >  	struct dma_heap_attachment *a = attachment->priv;
> > +	int attrs = attachment->dma_map_attrs;
> >  
> >  	a->mapped = false;
> > -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> > +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
> >  }
> >  
> >  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf
> > *dmabuf,
> > -- 
> > 2.17.1
> > 
