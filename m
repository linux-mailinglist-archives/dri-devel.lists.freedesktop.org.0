Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC545E08D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 19:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E8E6E195;
	Thu, 25 Nov 2021 18:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28FC6E5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 14:38:48 +0000 (UTC)
X-UUID: ed2e66f832074a38b1cb8cb7595e47c5-20211125
X-UUID: ed2e66f832074a38b1cb8cb7595e47c5-20211125
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <kuan-ying.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 968845543; Thu, 25 Nov 2021 22:38:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 25 Nov 2021 22:38:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Nov 2021 22:38:44 +0800
Message-ID: <aea1ed6da66c9ec8eaf8323f5b856feafc6de702.camel@mediatek.com>
Subject: Re: [PATCH v2] dma_heap: use for_each_sgtable_sg in sg_table
 release flow
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: "guangming.cao@mediatek.com" <guangming.cao@mediatek.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Date: Thu, 25 Nov 2021 22:38:45 +0800
In-Reply-To: <20211125134951.62002-1-guangming.cao@mediatek.com>
References: <85eb9053-0ce4-2514-06dc-58b8910dc5f7@arm.com>
 <20211125134951.62002-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Thu, 25 Nov 2021 18:30:01 +0000
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, kuan-ying.lee@mediatek.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "labbott@redhat.com" <labbott@redhat.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-11-25 at 21:49 +0800, guangming.cao@mediatek.com wrote:
> From: Guangming <Guangming.Cao@mediatek.com>
> 
> Use (for_each_sgtable_sg) rather than (for_each_sg) to traverse
> sg_table to free sg_table.
> Use (for_each_sg) maybe will casuse some pages can't be freed
> when send wrong nents number.

s/casuse/cause

> 
> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-
> buf/heaps/system_heap.c
> index 23a7e74ef966..8660508f3684 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct
> dma_buf *dmabuf)
>  	int i;
>  
>  	table = &buffer->sg_table;
> -	for_each_sg(table->sgl, sg, table->nents, i) {
> +	for_each_sgtable_sg(table, sg, i) {
>  		struct page *page = sg_page(sg);
>  
>  		__free_pages(page, compound_order(page));


If this is a fix, I think we should add Fixes: xxxx ("...") in the
commit message and Cc stable.

Thanks,
Kuan-Ying Lee


