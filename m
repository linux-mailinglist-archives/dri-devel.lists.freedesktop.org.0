Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB97D4A71
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36EC10E2F6;
	Tue, 24 Oct 2023 08:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DB210E2F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 08:37:48 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 354DC66072F6;
 Tue, 24 Oct 2023 09:37:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698136667;
 bh=OXWBJI8/0kuWCWSXzhyCCeuu9STJjBJew+90jgeB8X4=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=OGJO3GgETEk/ycZzbWNpU1U+oaj6LykXxpi2st2VCGO/eoz4X/z9I2H/Q8WSe9O2A
 ND33IMXmMoCyNOTlbcvfVgSFosGXdqSmO5S2bJOm9QBdckE05TxRPgqudMt5cKUEc9
 aD6yRms2261d4sPMjJeDgujNJyNO5ciuTEyhJl1T5mGd+RWKLN77wMdvRILoCHAi0A
 wxYlwhkNBrbbjo8c7voaWm7f28zgIXSWrHn+SkmMYxiuZtLS+VexCvJqqtHNdREE9y
 Wnz/CvjQrhbyIejGo65mUWCqv0A/sSMLVpCAHtRkFimCBPIX8447u7ty4X9vBPmVGN
 n05yD2ajcv6jQ==
Message-ID: <fa495623-1b63-4b94-84b8-c5cf0b9ba0ae@collabora.com>
Date: Tue, 24 Oct 2023 10:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 03/11] drm/mediatek: Add secure buffer control flow to
 mtk_drm_gem
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-4-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add secure buffer control flow to mtk_drm_gem.
> 
> When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
> to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
> dma buffer from secure dma-heap and bind it to mtk_drm_gem object.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 84 +++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++
>   2 files changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index bcce723f257d..2064ccd7dde0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -4,6 +4,8 @@
>    */
>   
>   #include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <uapi/linux/dma-heap.h>
>   #include <drm/mediatek_drm.h>
>   
>   #include <drm/drm.h>
> @@ -55,6 +57,80 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>   	return mtk_gem_obj;
>   }
>   
> +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
> +						     const char *heap, size_t size)
> +{
> +	struct mtk_drm_private *priv = dev->dev_private;
> +	struct mtk_drm_gem_obj *mtk_gem;
> +	struct drm_gem_object *obj;
> +	struct dma_heap *dma_heap;
> +	struct dma_buf *dma_buf;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	struct iosys_map map = {};
> +	int ret;
> +
> +	mtk_gem = mtk_drm_gem_init(dev, size);
> +	if (IS_ERR(mtk_gem))
> +		return ERR_CAST(mtk_gem);
> +
> +	obj = &mtk_gem->base;
> +
> +	dma_heap = dma_heap_find(heap);
> +	if (!dma_heap) {
> +		DRM_ERROR("heap find fail\n");
> +		goto err_gem_free;
> +	}
> +	dma_buf = dma_heap_buffer_alloc(dma_heap, size,
> +					O_RDWR | O_CLOEXEC, DMA_HEAP_VALID_HEAP_FLAGS);
> +	if (IS_ERR(dma_buf)) {
> +		DRM_ERROR("buffer alloc fail\n");
> +		dma_heap_put(dma_heap);
> +		goto err_gem_free;
> +	}
> +	dma_heap_put(dma_heap);
> +
> +	attach = dma_buf_attach(dma_buf, priv->dma_dev);
> +	if (IS_ERR(attach)) {
> +		DRM_ERROR("attach fail, return\n");
> +		dma_buf_put(dma_buf);
> +		goto err_gem_free;
> +	}

blank line here please

> +	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		DRM_ERROR("map failed, detach and return\n");
> +		dma_buf_detach(dma_buf, attach);
> +		dma_buf_put(dma_buf);
> +		goto err_gem_free;
> +	}
> +	obj->import_attach = attach;
> +	mtk_gem->dma_addr = sg_dma_address(sgt->sgl);
> +	mtk_gem->sg = sgt;
> +	mtk_gem->size = dma_buf->size;
> +
> +	if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
> +		/* secure buffer can not be mapped */
> +		mtk_gem->sec = true;
> +	} else {
> +		ret = dma_buf_vmap(dma_buf, &map);
> +		mtk_gem->kvaddr = map.vaddr;
> +		if (ret) {
> +			DRM_ERROR("map failed, ret=%d\n", ret);
> +			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +			dma_buf_detach(dma_buf, attach);
> +			dma_buf_put(dma_buf);
> +			mtk_gem->kvaddr = NULL;
> +		}
> +	}
> +
> +	return mtk_gem;
> +
> +err_gem_free:
> +	drm_gem_object_release(obj);
> +	kfree(mtk_gem);
> +	return ERR_PTR(-ENOMEM);
> +}
> +
>   struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
>   					   size_t size, bool alloc_kmap)
>   {
> @@ -218,7 +294,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
>   	if (IS_ERR(mtk_gem))
>   		return ERR_CAST(mtk_gem);
>   
> +	mtk_gem->sec = !sg_page(sg->sgl);
>   	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
> +	mtk_gem->size = attach->dmabuf->size;
>   	mtk_gem->sg = sg;
>   
>   	return &mtk_gem->base;
> @@ -290,7 +368,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
>   	struct drm_mtk_gem_create *args = data;
>   	int ret;
>   
> -	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
> +		mtk_gem = mtk_drm_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
> +	else
> +		mtk_gem = mtk_drm_gem_create(dev, args->size, false);
> +
>   	if (IS_ERR(mtk_gem))
>   		return PTR_ERR(mtk_gem);
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> index 90f3d2916ec5..ed4d23e252e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -27,9 +27,11 @@ struct mtk_drm_gem_obj {
>   	void			*cookie;
>   	void			*kvaddr;
>   	dma_addr_t		dma_addr;
> +	size_t			size;
>   	unsigned long		dma_attrs;
>   	struct sg_table		*sg;
>   	struct page		**pages;
> +	bool			sec;

`sec` may be ambiguous. You can call that `secure` or `is_secure_buf`.

>   };
>   
>   #define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
> @@ -37,6 +39,8 @@ struct mtk_drm_gem_obj {
>   void mtk_drm_gem_free_object(struct drm_gem_object *gem);
>   struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
>   					   bool alloc_kmap);
> +struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
> +						     const char *heap, size_t size);
>   int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>   			    struct drm_mode_create_dumb *args);
>   struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);



