Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D53842D6B2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 12:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB36E038;
	Thu, 14 Oct 2021 10:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD506E038
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 10:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F09E61F449AE
Subject: Re: [PATCH v7, 07/15] media: mtk-vcodec: Add irq interface for multi
 hardware
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-8-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3f1885cb-fc4e-5832-52a3-ed1766b17add@collabora.com>
Date: Thu, 14 Oct 2021 12:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Adds irq interface for multi hardware.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 33 +++++++++++++++++--
>   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 25 ++++++++++----
>   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  4 +--
>   .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 27 +++++++--------
>   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |  4 +--
>   .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |  2 +-
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |  2 +-
>   .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |  2 +-
>   .../platform/mtk-vcodec/venc/venc_h264_if.c   |  2 +-
>   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  2 +-
>   12 files changed, 71 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 17cb3e3519eb..ff70fa5b34e3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -73,6 +73,20 @@ static int mtk_vcodec_comp_device_check(struct mtk_vcodec_ctx *ctx)
>   	return 0;
>   }
>   
> +static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dev *dev)
> +{
> +	switch (dev->vdec_pdata->hw_arch) {
> +	case MTK_VDEC_PURE_SINGLE_CORE:
> +		 return MTK_VDEC_ONE_CORE;
> +	case MTK_VDEC_LAT_SINGLE_CORE:
> +		return MTK_VDEC_ONE_LAT_ONE_CORE;
> +	default:
> +		mtk_v4l2_err("not support hw arch:%d",
> +			dev->vdec_pdata->hw_arch);
> +		return MTK_VDEC_NO_HW;
> +	}
> +}
> +
>   static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>   {
>   	struct mtk_vcodec_dev *dev = priv;
> @@ -104,7 +118,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
>   	writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
>   		dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
>   
> -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
>   
>   	mtk_v4l2_debug(3,
>   			"mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
> @@ -176,7 +190,7 @@ static int fops_vcodec_open(struct file *file)
>   {
>   	struct mtk_vcodec_dev *dev = video_drvdata(file);
>   	struct mtk_vcodec_ctx *ctx = NULL;
> -	int ret = 0;
> +	int ret = 0, i, hw_count;
>   	struct vb2_queue *src_vq;
>   
>   	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> @@ -190,7 +204,19 @@ static int fops_vcodec_open(struct file *file)
>   	v4l2_fh_add(&ctx->fh);
>   	INIT_LIST_HEAD(&ctx->list);
>   	ctx->dev = dev;
> -	init_waitqueue_head(&ctx->queue);
> +
> +	if (ctx->dev->vdec_pdata->is_comp_supported) {

As pointed out in the review for patch 04/15 of this series, is_comp_supported
is always false since you moved away from the component framework.

That means that this code can be removed, as nothing ever hits that.

Please note that other patches in this series are following similar/same patterns,
so this comment applies to the entire series.

> +		hw_count = mtk_vcodec_get_hw_count(dev);
> +		if (!hw_count) {
> +			ret = -EINVAL;
> +			goto err_init_queue;
> +		}
> +		for (i = 0; i < hw_count; i++)
> +			init_waitqueue_head(&ctx->queue[i]);
> +	} else {
> +			init_waitqueue_head(&ctx->queue[0]);
> +	}
> +
>   	mutex_init(&ctx->lock);
>   
>   	ret = mtk_vcodec_comp_device_check(ctx);
> @@ -253,6 +279,7 @@ static int fops_vcodec_open(struct file *file)
>   err_m2m_ctx_init:
>   	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>   err_ctrls_setup:
> +err_init_queue:

...and if that unused component code gets removed, this label can also be removed.

>   	v4l2_fh_del(&ctx->fh);
>   	v4l2_fh_exit(&ctx->fh);
>   	kfree(ctx);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> index 3752ccaea284..0997a5a08156 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> @@ -56,7 +56,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
>   	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
>   	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
>   
> -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->comp_idx);
>   
>   	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
>   		ctx->id, dec_done_status);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 140f1a761942..f8e8b5ba408b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -104,6 +104,16 @@ enum mtk_vdec_hw_id {
>   	MTK_VDEC_HW_MAX,
>   };
>   
> +/**
> + * struct mtk_vdec_hw_count - Supported hardware count
> + */
> +enum mtk_vdec_hw_count {
> +	MTK_VDEC_NO_HW = 0,
> +	MTK_VDEC_ONE_CORE,
> +	MTK_VDEC_ONE_LAT_ONE_CORE,
> +	MTK_VDEC_MAX_HW_COUNT,
> +};
> +
>   /*
>    * struct mtk_video_fmt - Structure used to store information about pixelformats
>    */
> @@ -293,9 +303,9 @@ struct mtk_vcodec_ctx {
>   	struct vdec_pic_info picinfo;
>   	int dpb_size;
>   
> -	int int_cond;
> -	int int_type;
> -	wait_queue_head_t queue;
> +	int int_cond[MTK_VDEC_HW_MAX];
> +	int int_type[MTK_VDEC_HW_MAX];
> +	wait_queue_head_t queue[MTK_VDEC_HW_MAX];
>   	unsigned int irq_status;
>   
>   	struct v4l2_ctrl_handler ctrl_hdl;
> @@ -505,11 +515,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
>   }
>   
>   /* Wake up context wait_queue */
> -static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> +static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason,
> +	unsigned int hw_id)
>   {
> -	ctx->int_cond = 1;
> -	ctx->int_type = reason;
> -	wake_up_interruptible(&ctx->queue);
> +	ctx->int_cond[hw_id] = 1;
> +	ctx->int_type[hw_id] = reason;
> +	wake_up_interruptible(&ctx->queue[hw_id]);
>   }
>   
>   #endif /* _MTK_VCODEC_DRV_H_ */
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 2828df77020c..c7540c0cdcea 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -114,7 +114,7 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
>   
>   	clean_irq_status(ctx->irq_status, addr);
>   
> -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED, 0);
>   	return IRQ_HANDLED;
>   }
>   
> @@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
>   	v4l2_fh_add(&ctx->fh);
>   	INIT_LIST_HEAD(&ctx->list);
>   	ctx->dev = dev;
> -	init_waitqueue_head(&ctx->queue);
> +	init_waitqueue_head(&ctx->queue[0]);
>   
>   	ctx->type = MTK_INST_ENCODER;
>   	ret = mtk_vcodec_enc_ctrls_setup(ctx);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> index 70580c2525ba..8147533da98b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> @@ -11,34 +11,31 @@
>   #include "mtk_vcodec_intr.h"
>   #include "mtk_vcodec_util.h"
>   
> -int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
> -				 unsigned int timeout_ms)
> +int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
> +	int command, unsigned int timeout_ms, unsigned hw_id)
>   {
> -	wait_queue_head_t *waitqueue;
>   	long timeout_jiff, ret;
>   	int status = 0;
>   
> -	waitqueue = (wait_queue_head_t *)&ctx->queue;
>   	timeout_jiff = msecs_to_jiffies(timeout_ms);
> -
> -	ret = wait_event_interruptible_timeout(*waitqueue,
> -				ctx->int_cond,
> +	ret = wait_event_interruptible_timeout(ctx->queue[hw_id],
> +				ctx->int_cond[hw_id],
>   				timeout_jiff);
>   
>   	if (!ret) {
>   		status = -1;	/* timeout */
> -		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
> -			     ctx->id, ctx->type, command, timeout_ms,
> -			     ctx->int_cond, ctx->int_type);
> +		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec timeout=%ums (%d %d)",
> +				ctx->id, command, ctx->type, timeout_ms,
> +				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
>   	} else if (-ERESTARTSYS == ret) {
> -		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
> -			     ctx->id, ctx->type, command, ctx->int_cond,
> -			     ctx->int_type);
>   		status = -1;
> +		mtk_v4l2_err("[%d] cmd=%d, type=%d, dec inter fail (%d %d)",
> +				ctx->id, command, ctx->type,
> +				ctx->int_cond[hw_id], ctx->int_type[hw_id]);
>   	}
>   
> -	ctx->int_cond = 0;
> -	ctx->int_type = 0;
> +	ctx->int_cond[hw_id] = 0;
> +	ctx->int_type[hw_id] = 0;
>   
>   	return status;
>   }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> index 638cd1f3526a..2bf4cabfaa43 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h
> @@ -12,7 +12,7 @@
>   struct mtk_vcodec_ctx;
>   
>   /* timeout is ms */
> -int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *data, int command,
> -				unsigned int timeout_ms);
> +int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx *ctx,
> +				int command, unsigned int timeout_ms, unsigned int hw_id);
>   
>   #endif /* _MTK_VCODEC_INTR_H_ */
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> index 40d6e6c5ac7a..481655bb6016 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> @@ -413,7 +413,7 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   		/* wait decoder done interrupt */
>   		err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
>   						   MTK_INST_IRQ_RECEIVED,
> -						   WAIT_INTR_TIMEOUT_MS);
> +						   WAIT_INTR_TIMEOUT_MS, 0);
>   		if (err)
>   			goto err_free_fb_out;
>   
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> index 4dde9ee786b4..d23baa364246 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> @@ -724,7 +724,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   	/* wait decoder done interrupt */
>   	err = mtk_vcodec_wait_for_done_ctx(inst->ctx,
>   					   MTK_INST_IRQ_RECEIVED,
> -					   WAIT_INTR_TIMEOUT_MS);
> +					   WAIT_INTR_TIMEOUT_MS, 0);
>   	if (err)
>   		goto err_free_fb_out;
>   	vpu_dec_end(vpu);
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> index e5393f841080..88c046731754 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> @@ -488,7 +488,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   
>   	/* wait decoder done interrupt */
>   	mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
> -				     WAIT_INTR_TIMEOUT_MS);
> +				     WAIT_INTR_TIMEOUT_MS, 0);
>   
>   	if (inst->vsi->load_data)
>   		load_dec_table(inst);
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index 71cdc3ddafcb..70b8383f7c8e 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -539,7 +539,7 @@ static bool vp9_wait_dec_end(struct vdec_vp9_inst *inst)
>   
>   	mtk_vcodec_wait_for_done_ctx(inst->ctx,
>   			MTK_INST_IRQ_RECEIVED,
> -			WAIT_INTR_TIMEOUT_MS);
> +			WAIT_INTR_TIMEOUT_MS, 0);
>   
>   	if (ctx->irq_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
>   		return true;
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index b6a4f2074fa5..9ae1bd8dbc32 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -335,7 +335,7 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
>   	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
>   
>   	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> -					  WAIT_INTR_TIMEOUT_MS)) {
> +					  WAIT_INTR_TIMEOUT_MS, 0)) {
>   		irq_status = ctx->irq_status;
>   		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
>   	}
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 8267a9c4fd25..f96564277577 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -222,7 +222,7 @@ static unsigned int vp8_enc_wait_venc_done(struct venc_vp8_inst *inst)
>   	struct mtk_vcodec_ctx *ctx = (struct mtk_vcodec_ctx *)inst->ctx;
>   
>   	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> -					  WAIT_INTR_TIMEOUT_MS)) {
> +					  WAIT_INTR_TIMEOUT_MS, 0)) {
>   		irq_status = ctx->irq_status;
>   		mtk_vcodec_debug(inst, "isr return %x", irq_status);
>   	}
> 
