Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87928B25BA6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795B210E04F;
	Thu, 14 Aug 2025 06:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h3lHu3ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BEF10E04F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:13:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EB61601DD;
 Thu, 14 Aug 2025 06:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4E7C4CEEF;
 Thu, 14 Aug 2025 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755151983;
 bh=DAGhSWQHXEHySMtrjXTOpoAjZ6wAwaqNMvo6ON2OJxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3lHu3aiobL0T0fk/o90/lR7crHSA/3wZHAC0YA3sLLGB4v52FV10x7lKyMsDM1sY
 ReumTALeQkloTBu3I6tsjCabMWXzXx/TTYModh1h68VLWmUJuROoRfdM+XEQ9P+RzV
 UB8/LkiK08WUB14CsUUycZrb4Cr17AsakkaM3DGiPsQ42MVJSWy0IDk3LMydTjy9mb
 PsaDi8/RZptKDGWlrS1g3RQ4ZVHxtMj4ArPk5ZiGP8sf0UT4YOqTsb2xG9bcldG//j
 1znx2Lggvw/UgNIQt2PoA9yjcHRwJrbTFO3+tCdsojX5ToVSmZWRUvumraX1h9VpFO
 mkR2nWKX7robQ==
Date: Thu, 14 Aug 2025 11:42:50 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <aJ1-YpgvGt4_6CFU@sumit-X1>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813060339.2977604-3-jens.wiklander@linaro.org>
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

On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> Export the dma-buf heap functions to allow them to be used by the OP-TEE
> driver. The OP-TEE driver wants to register and manage specific secure
> DMA heaps with it.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/dma-buf/dma-heap.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Can we get an ack from DMAbuf maintainers here? With that we should be
able to queue this patch-set for linux-next targetting the 6.18 merge
window.

-Sumit

> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..cdddf0e24dce 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>  	return heap->priv;
>  }
> +EXPORT_SYMBOL(dma_heap_get_drvdata);
>  
>  /**
>   * dma_heap_get_name - get heap name
> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  {
>  	return heap->name;
>  }
> +EXPORT_SYMBOL(dma_heap_get_name);
>  
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	kfree(heap);
>  	return err_ret;
>  }
> +EXPORT_SYMBOL(dma_heap_add);
>  
>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>  {
> -- 
> 2.43.0
> 
