Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F12619450
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 11:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C254910E08B;
	Fri,  4 Nov 2022 10:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64610E08B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 10:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8000B620F5;
 Fri,  4 Nov 2022 10:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C1EC433C1;
 Fri,  4 Nov 2022 10:19:27 +0000 (UTC)
Message-ID: <861e53bc-777e-1c15-6d24-b7e6f2b1a2a1@xs4all.nl>
Date: Fri, 4 Nov 2022 11:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
Content-Language: en-US
To: Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20221025014659.7158-1-mingjia.zhang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221025014659.7158-1-mingjia.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mingjia,

What are the changes since v4? You didn't mentioned that.

Yunfei, can you review this v5? I prefer to have your Acked/Reviewed-by before merging.

Regards,

	Hans

On 25/10/2022 03:46, Mingjia Zhang wrote:
> Enable VP9 inner racing mode
> We send lat trans buffer to the core when trigger lat to work, instead of waiting for the lat decode done.
> It can be reduce decoder latency.
> 
> Signed-off-by: Mingjia Zhang <mingjia.zhang@mediatek.com>
> ---
> Changes from v3:
> 
> - CTS/GTS test pass
> - Fluster result: Ran 275/303 tests successfully
> 
> Changes from v2:
> 
> - CTS/GTS test pass
> - Fluster result: Ran 240/303 tests successfully
> 
> Changes from v1:
> 
> - CTS/GTS test pass
> ---
>  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 85 ++++++++++---------
>  1 file changed, 47 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> index 81de876d51267..1b39119c89951 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> @@ -436,6 +436,7 @@ struct vdec_vp9_slice_ref {
>   * @frame_ctx:		4 frame context according to VP9 Spec
>   * @frame_ctx_helper:	4 frame context according to newest kernel spec
>   * @dirty:		state of each frame context
> + * @local_vsi:		local instance vsi information
>   * @init_vsi:		vsi used for initialized VP9 instance
>   * @vsi:		vsi used for decoding/flush ...
>   * @core_vsi:		vsi used for Core stage
> @@ -482,6 +483,8 @@ struct vdec_vp9_slice_instance {
>  	struct v4l2_vp9_frame_context frame_ctx_helper;
>  	unsigned char dirty[4];
>  
> +	struct vdec_vp9_slice_vsi local_vsi;
> +
>  	/* MicroP vsi */
>  	union {
>  		struct vdec_vp9_slice_init_vsi *init_vsi;
> @@ -1616,16 +1619,10 @@ static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance
>  }
>  
>  static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
> -				     struct vdec_lat_buf *lat_buf,
> -				     struct vdec_vp9_slice_pfc *pfc)
> +				     struct vdec_vp9_slice_vsi *vsi)
>  {
> -	struct vdec_vp9_slice_vsi *vsi;
> -
> -	vsi = &pfc->vsi;
> -	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
> -
>  	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
> -			 pfc->seq, vsi->state.crc[0],
> +			 (instance->seq - 1), vsi->state.crc[0],
>  			 (unsigned long)vsi->trans.dma_addr,
>  			 (unsigned long)vsi->trans.dma_addr_end);
>  
> @@ -2090,6 +2087,13 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  		return ret;
>  	}
>  
> +	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability)) {
> +		vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> +		memcpy(&instance->local_vsi, vsi, sizeof(*vsi));
> +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> +		vsi = &instance->local_vsi;
> +	}
> +
>  	if (instance->irq) {
>  		ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
>  						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
> @@ -2102,22 +2106,25 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  	}
>  
>  	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> -	ret = vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
> +	ret = vdec_vp9_slice_update_lat(instance, vsi);
>  
> -	/* LAT trans full, no more UBE or decode timeout */
> -	if (ret) {
> -		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
> -		return ret;
> -	}
> +	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
> +		/* LAT trans full, no more UBE or decode timeout */
> +		if (ret) {
> +			mtk_vcodec_err(instance, "frame[%d] decode error: %d\n",
> +				       ret, (instance->seq - 1));
> +			return ret;
> +		}
>  
> -	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
> -			 (unsigned long)pfc->vsi.trans.dma_addr,
> -			 (unsigned long)pfc->vsi.trans.dma_addr_end);
>  
> -	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
> -				       vsi->trans.dma_addr_end +
> -				       ctx->msg_queue.wdma_addr.dma_addr);
> -	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> +	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
> +	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_addr_end);
> +	if (!IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
> +		vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> +
> +	mtk_vcodec_debug(instance, "lat trans end addr(0x%lx), ube start addr(0x%lx)\n",
> +			 (unsigned long)vsi->trans.dma_addr_end,
> +			 (unsigned long)ctx->msg_queue.wdma_addr.dma_addr);
>  
>  	return 0;
>  }
> @@ -2139,40 +2146,40 @@ static int vdec_vp9_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
>  {
>  	struct vdec_vp9_slice_instance *instance;
> -	struct vdec_vp9_slice_pfc *pfc;
> +	struct vdec_vp9_slice_pfc *pfc = NULL;
>  	struct mtk_vcodec_ctx *ctx = NULL;
>  	struct vdec_fb *fb = NULL;
>  	int ret = -EINVAL;
>  
>  	if (!lat_buf)
> -		goto err;
> +		return -EINVAL;
>  
>  	pfc = lat_buf->private_data;
>  	ctx = lat_buf->ctx;
>  	if (!pfc || !ctx)
> -		goto err;
> +		return -EINVAL;
>  
>  	instance = ctx->drv_handle;
>  	if (!instance)
> -		goto err;
> +		return -EINVAL;
>  
>  	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
>  	if (!fb) {
>  		ret = -EBUSY;
> -		goto err;
> +		goto vdec_dec_end;
>  	}
>  
>  	ret = vdec_vp9_slice_setup_core(instance, fb, lat_buf, pfc);
>  	if (ret) {
>  		mtk_vcodec_err(instance, "vdec_vp9_slice_setup_core\n");
> -		goto err;
> +		goto vdec_dec_end;
>  	}
>  	vdec_vp9_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
>  
>  	ret = vpu_dec_core(&instance->vpu);
>  	if (ret) {
>  		mtk_vcodec_err(instance, "vpu_dec_core\n");
> -		goto err;
> +		goto vdec_dec_end;
>  	}
>  
>  	if (instance->irq) {
> @@ -2190,24 +2197,26 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
>  	ret = vdec_vp9_slice_update_core(instance, lat_buf, pfc);
>  	if (ret) {
>  		mtk_vcodec_err(instance, "vdec_vp9_slice_update_core\n");
> -		goto err;
> +		goto vdec_dec_end;
>  	}
>  
> -	pfc->vsi.trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
>  	mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n",
>  			 (unsigned long)pfc->vsi.trans.dma_addr_end);
> -	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> -	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> -
> -	return 0;
>  
> -err:
> -	if (ctx && pfc) {
> -		/* always update read pointer */
> -		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> +vdec_dec_end:
> +	/* always update read pointer */
> +	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
> +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
> +					       pfc->vsi.trans.dma_addr);
> +	else
> +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue,
> +					       pfc->vsi.trans.dma_addr_end);
>  
> +	if (ret) {
>  		if (fb)
>  			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
> +	} else {
> +		ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
>  	}
>  	return ret;
>  }

