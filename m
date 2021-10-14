Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7A42D78E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 12:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD53F6E15A;
	Thu, 14 Oct 2021 10:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07B6E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 10:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D18251F43904
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
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
 <20211011070247.792-12-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
Date: Thu, 14 Oct 2021 12:56:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-12-yunfei.dong@mediatek.com>
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

> Core thread:
> 1. Gets lat_buf from core msg queue.
> 2. Proceeds core decode.
> 3. Puts the lat_buf back to lat msg queue.
> 
> Both H264 and VP9 rely on the core thread.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

I would be happier to see a better commit message, for example:
"Introduce a core thread, responsible for... getting lat_buf from ...
which then proceeds core decode by ... and finally, puts the lat_buf
back to the lat message queue"

> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
>   4 files changed, 57 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index e21e0c4bcd86..de83e3b821b4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		goto err_dec_pm;
>   	}
>   
> +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> +			MTK_VDEC_CORE);

No need to break this line.

> +		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
> +			"mtk-%s", "core");

Please fix indentation, like so:
		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,

						"mtk-%s", "core");

> +		if (IS_ERR(dev->kthread_core)) {
> +			dev_err(&pdev->dev, "Failed to create core thread");
> +			ret = PTR_ERR(dev->kthread_core);
> +			goto err_res;
> +		}
> +	}
> +
>   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>   		mutex_init(&dev->dec_mutex[i]);
>   	spin_lock_init(&dev->irqlock);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9d072c082f73..68a9b1a2d3b3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -27,6 +27,7 @@
>   #define MTK_VCODEC_MAX_PLANES	3
>   #define MTK_V4L2_BENCHMARK	0
>   #define WAIT_INTR_TIMEOUT_MS	1000
> +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)

I'd propose to change this to IS_VDEC_LAT_ARCH(hw_arch): that would increase human
readability when using this macro.

>   
>   /*
>    * enum mtk_hw_reg_idx - MTK hw register base index
> @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
>    * @comp_dev: component hardware device
>    * @component_node: component node
>    *
> + * @kthread_core: thread used for core hardware decode
> + * @msg_queue_core_ctx: msg queue context used for core thread
> + *
>    * @hardware_bitmap: used to record hardware is ready or not
>    */
>   struct mtk_vcodec_dev {
> @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
>   	void *comp_dev[MTK_VDEC_HW_MAX];
>   	struct device_node *component_node[MTK_VDEC_HW_MAX];
>   
> +	struct task_struct *kthread_core;
> +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> +
>   	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
>   };
>   
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> index d66ed98c79a9..665f571eab4b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
>   			kfree(lat_buf->private_data);
>   	}
>   }
> +
> +int vdec_msg_queue_core_thead(void *data)
> +{
> +	struct mtk_vcodec_dev *dev = data;
> +	struct vdec_lat_buf *lat_buf;
> +	struct mtk_vcodec_ctx *ctx;
> +
> +	set_freezable();
> +	for (;;) {
> +		try_to_freeze();
> +		if (kthread_should_stop())
> +			break;
> +
> +		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
> +		if (!lat_buf)
> +			continue;
> +
> +		ctx = lat_buf->ctx;
> +		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> +
> +		if (!lat_buf->core_decode)
> +			mtk_v4l2_err("Core decode callback func is NULL");

Is this supposed to really happen?
I see that this is always initialized in function vdec_msg_queue_init().

Regards,
- Angelo


