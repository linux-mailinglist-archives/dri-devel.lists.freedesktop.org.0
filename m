Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F8216942
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 11:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857289CBC;
	Tue,  7 Jul 2020 09:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225CD89CBC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 09:40:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200707094032euoutp02bc235b2b0d40ba916b08fa2749cb0e47~fbv6NO5tU1565115651euoutp02h
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 09:40:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200707094032euoutp02bc235b2b0d40ba916b08fa2749cb0e47~fbv6NO5tU1565115651euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594114832;
 bh=NKIXIZf7DqPM44p634PRRQQpgwlo737WpVwaop6YS/g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=sOGIb1BW/40xaj8x9YhGIpD57NGrAvROgKGk93RNW5GHXK1UpyxgPS6tiWEoO2sZN
 0nwgX2MW0/AkcMQ+jPZ7NiSuZl742N2uo5UcxndmbuASgxEeG4cexd4CX9/wEJSu3p
 /HU/16m0NcWbHIzg4NIMJgZlCNZ0ppSNgfGp7mms=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200707094032eucas1p1561b02b886cf5d6b07ab5f897da3a11f~fbv55PHXs0287902879eucas1p1-;
 Tue,  7 Jul 2020 09:40:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.67.05997.013440F5; Tue,  7
 Jul 2020 10:40:32 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200707094031eucas1p167fcabe5e1275d9d8584de4baccc36fc~fbv5kG1Zu0287902879eucas1p1_;
 Tue,  7 Jul 2020 09:40:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200707094031eusmtrp224005f38d42d83c2425b55661f7c16bd~fbv5jYt8d0878708787eusmtrp2H;
 Tue,  7 Jul 2020 09:40:31 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-07-5f04431045b6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DF.69.06314.F03440F5; Tue,  7
 Jul 2020 10:40:31 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200707094029eusmtip24fc305116ea90ec9f9c6e9d4392554ca~fbv3CyALk0258102581eusmtip2U;
 Tue,  7 Jul 2020 09:40:29 +0000 (GMT)
Subject: Re: [PATCH v7 08/36] drm: exynos: fix common struct sg_table
 related issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <53d2ae18-3d60-773f-4544-3c8f55749038@samsung.com>
Date: Tue, 7 Jul 2020 11:40:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200619103636.11974-9-m.szyprowski@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURiGOTM747i5Nq6WB63MrRCLtLJiwLDUkJGC6o+BkDrl4G0vtquW
 QbhkiGxkXvK2aS2SeMd01900UNouunhZMfGChpf1R0qL5S2L0nYcI/8953zv+33fezgEKh7C
 vIgkeRqrlDNSCS4UGD/+tB4nwwWxJ5ZNu6nHAxaEailrxqjh1UWcqmv4gFC6rmBqZXgGoVpt
 Ixj1qaMCp8qsnQjV9P6zE/X22xxGlRXN4xdc6MbnjYA2rU1j9NSjboTWv8yiJzZsKF00VgPo
 N+NqnM4z1AN6ufXAVedo4bl4VpqUwSoDQ+KEiYUTu1JtHnfNbV8RNchx0wCCgORpOPssTgOE
 hJisBbBm6YcTf1gBsHLdgvKHZQBLxq1AA5y3HNWWQoxjMVkDYPZsPC9aBLBpdFDAtXUno+Do
 pg+n8SANDk1xBKdByWIE2oydKFfASX/4Rz+OcywiQ2B5vnlrgIA8DA3NrQjHe8gY2DxvQniN
 G7SUzwk4dnboWzYNW16U9IEmewXKsyd8sFKHccMg+d0J1umLUX7ri7C7emGb3eFCt8GJ531w
 s/0FwnMWnKp9iPLmXADbXrVvG4Lh5MAvnEuGOrZu7gjk3y4UtmUf4dEVjtnd+BVcYaGxFOWv
 RTA3R8z38IVT/W3b/Txh9eAqng8k2h3BtDvCaHeE0f4fqwOCeuDJpqtkCazqlJy9E6BiZKp0
 eULALYWsFTh+Wu9G98pr0PH7phmQBJC4iHJxNFaMMRmqTJkZQAKVeIjC+ntjxKJ4JvMeq1TE
 KtOlrMoMvAmBxFMUVDV/Q0wmMGlsCsumssp/VYRw9lKDp/kF68m+MtuZteuLGmNJl+LJ9Lvb
 ey9HFVRTh7QjS3qfS8es5Vj6ULbX/mBlT9Xwgj38bMpoqCbLvcE/jDBda1R/oYqZoOTJg1Zj
 RJdfT+SVykhF37Qk1E8crWe0k3Z6Ro7NW88X5NmFuSnJ9b5WvXe7LtWScL9Ul5fYJ5UIVInM
 yaOoUsX8Bby5r5xlAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xe7r8zizxBhcfmVv0njvJZLFxxnpW
 iytf37NZrFx9lMliwX5riy9XHjJZbHp8jdXi8q45bBYzzu9jslh75C67xcEPT1gtZkx+yebA
 47Fm3hpGj+3fHrB63O8+zuSxeUm9x+1/j5k9Jt9Yzuix+2YDm0ffllWMHp83yQVwRunZFOWX
 lqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlTLrNXfBYpOLQ
 1jdMDYxtgl2MnBwSAiYSS09OYu1i5OIQEljKKPHw810miIS4xO75b5khbGGJP9e62CCK3jJK
 fFkyDSwhLBAmcaLjJli3iMAWRolnKw4zgjjMAtOZJG52/YCae5RR4sqyCWAtbAKaEn8332QD
 sXkF7CRmTjjECGKzCKhIbFm/CWy3qECcxPIt89khagQlTs58wgJicwLVb/y/BayXWcBMYt7m
 h8wQtrzE9rdzoGxxiaYvK1knMArNQtI+C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1ya
 l66XnJ+7iREYz9uO/dy8g/HSxuBDjAIcjEo8vAlHmOOFWBPLiitzDzFKcDArifA6nT0dJ8Sb
 klhZlVqUH19UmpNafIjRFOi5icxSosn5wFSTVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2x
 JDU7NbUgtQimj4mDU6qB0ZV1eqvW5kxGBT/G0qmNIRmqeXcObzFNqVYpeXCA5fWX1zNXaZ0O
 nGOYP0t7aR33lT1BEcH3TwSUZXPFvii+9CBIYbLx1X7O5EXndq+TdG7RKTxYcSfJdlOvzAIH
 oXKBRUHmLf97VFg8frvVXP6/y/1w5guTT8f9BBL/C/dv2iNR5zWxLstZiaU4I9FQi7moOBEA
 P2s+Qv0CAAA=
X-CMS-MailID: 20200707094031eucas1p167fcabe5e1275d9d8584de4baccc36fc
X-Msg-Generator: CA
X-RootMTR: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9@eucas1p1.samsung.com>
 <20200619103636.11974-9-m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19.06.2020 12:36, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
>
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
>
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
>
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by <a.hajda@samsung.com>

Regards
Andrzej


> ---
>   drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index fcee33a43aca..7014a8cd971a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -395,8 +395,8 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
>   		return;
>   
>   out:
> -	dma_unmap_sg(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt->sgl,
> -			g2d_userptr->sgt->nents, DMA_BIDIRECTIONAL);
> +	dma_unmap_sgtable(to_dma_dev(g2d->drm_dev), g2d_userptr->sgt,
> +			  DMA_BIDIRECTIONAL, 0);
>   
>   	pages = frame_vector_pages(g2d_userptr->vec);
>   	if (!IS_ERR(pages)) {
> @@ -511,10 +511,10 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
>   
>   	g2d_userptr->sgt = sgt;
>   
> -	if (!dma_map_sg(to_dma_dev(g2d->drm_dev), sgt->sgl, sgt->nents,
> -				DMA_BIDIRECTIONAL)) {
> +	ret = dma_map_sgtable(to_dma_dev(g2d->drm_dev), sgt,
> +			      DMA_BIDIRECTIONAL, 0);
> +	if (ret) {
>   		DRM_DEV_ERROR(g2d->dev, "failed to map sgt with dma region.\n");
> -		ret = -ENOMEM;
>   		goto err_sg_free_table;
>   	}
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
