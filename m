Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBDE464D90
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 13:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4A46FAC6;
	Wed,  1 Dec 2021 12:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A987F6EE1D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 12:09:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8A5D01F458EB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638360548; bh=T1dDKfmYc0uS+FyjcHNPVLTk9UgH3cP+bHnFuI0cPbw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Sq+vL5oyuOK821DgDXIhUQUfCZh0Sr1b4jpeGjK8lSnWhcSFc4hqCTS6IZ4nREQnF
 BKH5Yr3aC+PQMiu2OhMZgdSG3cHrbgDS5JJUYckJgYSzB1YE2jdSQxSfw9YXINTfiJ
 EZupB0q+qiB9bnxO6p04cEe5ZT9jPGjUD62JSh8bhN1dOTMklsuuAqbI7KvGLxc+au
 A5tlVmIzZoJg4Nx9leKufP3xT7t9LP+FrAdvTOHMD4L1cB1KcTx/CGrblJML5vqhwd
 K+ZZVoQm2tKgZAnM+P9Q2z3pHfjjQp0wYsXTbfY6exq3QNPgN4o9bUTh4X+hwUCKXP
 fssDSRQyBXcCQ==
Subject: Re: [PATCH v11, 10/19] media: mtk-vcodec: Add msg queue feature for
 lat and core architecture
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-11-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9710488f-9129-4462-b528-642561021731@collabora.com>
Date: Wed, 1 Dec 2021 13:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-11-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/21 04:41, Yunfei Dong ha scritto:
> For lat and core architecture, lat thread will send message to core
> thread when lat decode done. Core hardware will use the message
> from lat to decode, then free message to lat thread when decode done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   9 +
>   .../platform/mtk-vcodec/vdec_msg_queue.c      | 257 ++++++++++++++++++
>   .../platform/mtk-vcodec/vdec_msg_queue.h      | 148 ++++++++++
>   4 files changed, 415 insertions(+)
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index c61bfb179bcc..359619653a0e 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		mtk_vcodec_dec_drv.o \
>   		vdec_drv_if.o \
>   		vdec_vpu_if.o \
> +		vdec_msg_queue.o \
>   		mtk_vcodec_dec.o \
>   		mtk_vcodec_dec_stateful.o \
>   		mtk_vcodec_dec_stateless.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 7fc106df039b..610b0af13879 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -15,7 +15,9 @@
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-core.h>
> +
>   #include "mtk_vcodec_util.h"
> +#include "vdec_msg_queue.h"
>   
>   #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
>   #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
> @@ -282,6 +284,8 @@ struct vdec_pic_info {
>    * @decoded_frame_cnt: number of decoded frames
>    * @lock: protect variables accessed by V4L2 threads and worker thread such as
>    *	  mtk_video_dec_buf.
> + *
> + * @msg_queue: msg queue used to store lat buffer information.
>    */
>   struct mtk_vcodec_ctx {
>   	enum mtk_instance_type type;
> @@ -325,6 +329,7 @@ struct mtk_vcodec_ctx {
>   	int decoded_frame_cnt;
>   	struct mutex lock;
>   
> +	struct vdec_msg_queue msg_queue;
>   };
>   
>   enum mtk_chip {
> @@ -457,6 +462,8 @@ struct mtk_vcodec_enc_pdata {
>    * @dec_capability: used to identify decode capability, ex: 4k
>    * @enc_capability: used to identify encode capability
>    *
> + * @msg_queue_core_ctx: msg queue context used for core workqueue
> + *
>    * @subdev_dev: subdev hardware device
>    * @subdev_bitmap: used to record hardware is ready or not
>    */
> @@ -497,6 +504,8 @@ struct mtk_vcodec_dev {
>   	unsigned int dec_capability;
>   	unsigned int enc_capability;
>   
> +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> +
>   	void *subdev_dev[MTK_VDEC_HW_MAX];
>   	DECLARE_BITMAP(subdev_bitmap, MTK_VDEC_HW_MAX);
>   };
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> new file mode 100644
> index 000000000000..da4d114f7ad0
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/freezer.h>
> +#include <linux/interrupt.h>
> +#include <linux/kthread.h>
> +
> +#include "mtk_vcodec_dec_pm.h"
> +#include "mtk_vcodec_drv.h"
> +#include "vdec_msg_queue.h"
> +
> +/* the size used to store lat slice header information */
> +#define VDEC_LAT_SLICE_HEADER_SZ    (640 * SZ_1K)
> +
> +/* the size used to store avc error information */
> +#define VDEC_ERR_MAP_SZ_AVC         (17 * SZ_1K)
> +
> +/* core will read the trans buffer which decoded by lat to decode again.
> + * The trans buffer size of FHD and 4K bitstreams are different.
> + */
> +static int vde_msg_queue_get_trans_size(int width, int height)
> +{
> +	if (width > 1920 || height > 1088)
> +		return 30 * SZ_1M;
> +	else
> +		return 6 * SZ_1M;
> +}
> +
> +void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
> +	int hardware_index)
> +{
> +	init_waitqueue_head(&ctx->ready_to_use);
> +	INIT_LIST_HEAD(&ctx->ready_queue);
> +	spin_lock_init(&ctx->ready_lock);
> +	ctx->ready_num = 0;
> +	ctx->hardware_index = hardware_index;
> +}
> +
> +static struct list_head *vdec_get_buf_list(int hardware_index,
> +	struct vdec_lat_buf *buf)
> +{
> +	switch (hardware_index) {
> +	case MTK_VDEC_CORE:
> +		return &buf->core_list;
> +	case MTK_VDEC_LAT0:
> +		return &buf->lat_list;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *msg_ctx,
> +	struct vdec_lat_buf *buf)

This function can fail: it has to return an integer value.

> +{
> +	struct list_head *head;
> +
> +	head = vdec_get_buf_list(msg_ctx->hardware_index, buf);
> +	if (!head) {
> +		mtk_v4l2_err("fail to qbuf: %d",msg_ctx->hardware_index);
> +		return;
> +	}
> +
> +	spin_lock(&msg_ctx->ready_lock);
> +	list_add_tail(head, &msg_ctx->ready_queue);
> +	msg_ctx->ready_num++;
> +
> +	if (msg_ctx->hardware_index != MTK_VDEC_CORE)
> +		wake_up_all(&msg_ctx->ready_to_use);
> +
> +	mtk_v4l2_debug(3, "enqueue buf type: %d addr: 0x%p num: %d",
> +		msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> +	spin_unlock(&msg_ctx->ready_lock);
> +}
> +
> +static bool vdec_msg_queue_wait_event(struct vdec_msg_queue_ctx *msg_ctx)
> +{
> +	int ret;
> +
> +	ret = wait_event_timeout(msg_ctx->ready_to_use,
> +		!list_empty(&msg_ctx->ready_queue),
> +		msecs_to_jiffies(1500));

At the beginning of this file:
#define VDEC_MSG_QUEUE_TIMEOUT_MS	1500

...then:
	ret = wait_event_timeout(msg_ctx->ready_to_use,

				 !list_empty(&msg_ctx->ready_queue),

				 msecs_to_jiffies(VDEC_MSG_QUEUE_TIMEOUT_MS));


> +	if (!ret)
> +		return false;
> +
> +	return true;
> +}
> +
> +struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *msg_ctx)
> +{
> +	struct vdec_lat_buf *buf;
> +	struct list_head *head;
> +	int ret;
> +
> +	spin_lock(&msg_ctx->ready_lock);
> +	if (list_empty(&msg_ctx->ready_queue)) {
> +		mtk_v4l2_debug(3, "queue is NULL, type:%d num: %d",
> +			msg_ctx->hardware_index, msg_ctx->ready_num);
> +		spin_unlock(&msg_ctx->ready_lock);
> +
> +		if (msg_ctx->hardware_index == MTK_VDEC_CORE)
> +			return NULL;
> +
> +		ret = vdec_msg_queue_wait_event(msg_ctx);
> +		if (!ret)
> +			return NULL;
> +		spin_lock(&msg_ctx->ready_lock);
> +	}
> +
> +	if (msg_ctx->hardware_index == MTK_VDEC_CORE)
> +		buf = list_first_entry(&msg_ctx->ready_queue,
> +			struct vdec_lat_buf, core_list);
> +	else
> +		buf = list_first_entry(&msg_ctx->ready_queue,
> +			struct vdec_lat_buf, lat_list);
> +
> +	head = vdec_get_buf_list(msg_ctx->hardware_index, buf);
> +	if (!head) {
> +		spin_unlock(&msg_ctx->ready_lock);
> +		mtk_v4l2_err("fail to dqbuf: %d",msg_ctx->hardware_index);
> +		return NULL;
> +	}
> +	list_del(head);
> +
> +	msg_ctx->ready_num--;
> +	mtk_v4l2_debug(3, "dqueue buf type:%d addr: 0x%p num: %d",
> +		msg_ctx->hardware_index, buf, msg_ctx->ready_num);
> +	spin_unlock(&msg_ctx->ready_lock);
> +
> +	return buf;
> +}
> +
> +void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_rptr)
> +{
> +	spin_lock(&msg_queue->lat_ctx.ready_lock);
> +	msg_queue->wdma_rptr_addr = ube_rptr;
> +	mtk_v4l2_debug(3, "update ube rprt (0x%llx)", ube_rptr);
> +	spin_unlock(&msg_queue->lat_ctx.ready_lock);
> +}
> +
> +void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_wptr)
> +{
> +	spin_lock(&msg_queue->lat_ctx.ready_lock);
> +	msg_queue->wdma_wptr_addr = ube_wptr;
> +	mtk_v4l2_debug(3, "update ube wprt: (0x%llx 0x%llx) offset: 0x%llx",
> +		msg_queue->wdma_rptr_addr, msg_queue->wdma_wptr_addr, ube_wptr);
> +	spin_unlock(&msg_queue->lat_ctx.ready_lock);
> +}
> +
> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
> +{
> +	long timeout_jiff;
> +	int ret;
> +
> +	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
> +	ret = wait_event_timeout(msg_queue->lat_ctx.ready_to_use,
> +		msg_queue->lat_ctx.ready_num == NUM_BUFFER_COUNT,
> +		timeout_jiff);
> +	if (ret) {
> +		mtk_v4l2_debug(3, "success to get lat buf: %d",
> +			msg_queue->lat_ctx.ready_num);
> +		return true;
> +	}
> +	mtk_v4l2_err("failed with lat buf isn't full: %d",
> +		msg_queue->lat_ctx.ready_num);
> +	return false;
> +}
> +
> +void vdec_msg_queue_deinit(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx)
> +{
> +	struct vdec_lat_buf *lat_buf;
> +	struct mtk_vcodec_mem *mem;
> +	int i;
> +
> +	mem = &msg_queue->wdma_addr;
> +	if (mem->va)
> +		mtk_vcodec_mem_free(ctx, mem);
> +	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +		lat_buf = &msg_queue->lat_buf[i];
> +
> +		mem = &lat_buf->wdma_err_addr;
> +		if (mem->va)
> +			mtk_vcodec_mem_free(ctx, mem);
> +
> +		mem = &lat_buf->slice_bc_addr;
> +		if (mem->va)
> +			mtk_vcodec_mem_free(ctx, mem);
> +
> +		if (lat_buf->private_data)
> +			kfree(lat_buf->private_data);
> +	}
> +}
> +
> +int vdec_msg_queue_init(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx,
> +	core_decode_cb_t core_decode,
> +	int private_size)
> +{
> +	struct vdec_lat_buf *lat_buf;
> +	int i, err;
> +
> +	/* already init msg queue */
> +	if (msg_queue->wdma_addr.size)
> +		return 0;
> +
> +	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
> +	msg_queue->wdma_addr.size = vde_msg_queue_get_trans_size(
> +		ctx->picinfo.buf_w, ctx->picinfo.buf_h);
> +
> +	err = mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
> +	if (err) {
> +		mtk_v4l2_err("failed to allocate wdma_addr buf");
> +		return -ENOMEM;
> +	}
> +	msg_queue->wdma_rptr_addr = msg_queue->wdma_addr.dma_addr;
> +	msg_queue->wdma_wptr_addr = msg_queue->wdma_addr.dma_addr;
> +
> +	for (i = 0; i < NUM_BUFFER_COUNT; i++) {
> +		lat_buf = &msg_queue->lat_buf[i];
> +
> +		lat_buf->wdma_err_addr.size = VDEC_ERR_MAP_SZ_AVC;
> +		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->wdma_err_addr);
> +		if (err) {
> +			mtk_v4l2_err("failed to allocate wdma_err_addr buf[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->slice_bc_addr.size = VDEC_LAT_SLICE_HEADER_SZ;
> +		err = mtk_vcodec_mem_alloc(ctx, &lat_buf->slice_bc_addr);
> +		if (err) {
> +			mtk_v4l2_err("failed to allocate wdma_addr buf[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->private_data = kzalloc(private_size, GFP_KERNEL);
> +		if (!lat_buf->private_data) {
> +			mtk_v4l2_err("failed to allocate private_data[%d]", i);
> +			goto mem_alloc_err;
> +		}
> +
> +		lat_buf->ctx = ctx;
> +		lat_buf->core_decode = core_decode;
> +		vdec_msg_queue_qbuf(&msg_queue->lat_ctx, lat_buf);

If this function fails, there will be no buffer. In case of failure, you should
take the appropriate action here, instead of going on with an invalid buffer.

> +	}
> +	return 0;
> +
> +mem_alloc_err:
> +	vdec_msg_queue_deinit(msg_queue, ctx);
> +	return -ENOMEM;
> +}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> new file mode 100644
> index 000000000000..91a315ba0cba
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#ifndef _VDEC_MSG_QUEUE_H_
> +#define _VDEC_MSG_QUEUE_H_
> +
> +#include <linux/sched.h>
> +#include <linux/semaphore.h>
> +#include <linux/slab.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "mtk_vcodec_util.h"
> +
> +#define NUM_BUFFER_COUNT 3
> +
> +struct vdec_lat_buf;
> +struct mtk_vcodec_ctx;
> +struct mtk_vcodec_dev;
> +typedef int (*core_decode_cb_t)(struct vdec_lat_buf *lat_buf);
> +
> +/**
> + * struct vdec_msg_queue_ctx - represents a queue for buffers ready to be processed
> + * @ready_used: ready used queue used to signalize when get a job queue
> + * @ready_queue: list of ready lat buffer queues
> + * @ready_lock: spin lock to protect the lat buffer usage
> + * @ready_num: number of buffers ready to be processed
> + * @hardware_index: hardware id that this queue is used for
> + */
> +struct vdec_msg_queue_ctx {
> +	wait_queue_head_t ready_to_use;
> +	struct list_head ready_queue;
> +	spinlock_t ready_lock;
> +	int ready_num;
> +	int hardware_index;
> +};
> +
> +/**
> + * struct vdec_lat_buf - lat buffer message used to store lat info for core decode
> + * @wdma_err_addr: wdma error address used for lat hardware
> + * @slice_bc_addr: slice bc address used for lat hardware
> + * @ts_info: need to set timestamp from output to capture
> + *
> + * @private_data: shared information used to lat and core hardware
> + * @ctx: mtk vcodec context information
> + * @core_decode: different codec use different decode callback function
> + * @lat_list: add lat buffer to lat head list
> + * @core_list: add lat buffer to core head list
> + */
> +struct vdec_lat_buf {
> +	struct mtk_vcodec_mem wdma_err_addr;
> +	struct mtk_vcodec_mem slice_bc_addr;
> +	struct vb2_v4l2_buffer ts_info;
> +
> +	void *private_data;
> +	struct mtk_vcodec_ctx *ctx;
> +	core_decode_cb_t core_decode;
> +	struct list_head lat_list;
> +	struct list_head core_list;
> +};
> +
> +/**
> + * struct vdec_msg_queue - used to store lat buffer message
> + * @lat_buf: lat buffer used to store lat buffer information
> + * @wdma_addr: wdma address used for ube
> + * @wdma_rptr_addr: ube read point
> + * @wdma_wptr_addr: ube write point
> + * @lat_ctx: used to store lat buffer list
> + */
> +struct vdec_msg_queue {
> +	struct vdec_lat_buf lat_buf[NUM_BUFFER_COUNT];
> +
> +	struct mtk_vcodec_mem wdma_addr;
> +	uint64_t wdma_rptr_addr;
> +	uint64_t wdma_wptr_addr;
> +
> +	struct vdec_msg_queue_ctx lat_ctx;
> +};
> +
> +/**
> + * vdec_msg_queue_init - init lat buffer information.
> + * @msg_queue: used to store the lat buffer information
> + * @ctx: v4l2 ctx
> + * @core_decode: core decode callback for each codec
> + * @private_size: the private data size used to share with core
> + */
> +int vdec_msg_queue_init(
> +	struct vdec_msg_queue *msg_queue,
> +	struct mtk_vcodec_ctx *ctx,
> +	core_decode_cb_t core_decode,
> +	int private_size);
> +

int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
			struct mtk_vcodec_ctx *ctx,

			core_decode_cb_t core_decode, int private_size);

> +/**
> + * vdec_msg_queue_init_ctx - used to init msg queue context information.
> + * @ctx: message queue context
> + * @hardware_index: hardware index
> + */
> +void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx,
> +	int hardware_index);

Don't break this line; even 90 columns is fine...

> +
> +/**
> + * vdec_msg_queue_qbuf - enqueue lat buffer to queue list.
> + * @ctx: message queue context
> + * @buf: current lat buffer
> + */
> +void vdec_msg_queue_qbuf(struct vdec_msg_queue_ctx *ctx,
> +	struct vdec_lat_buf *buf);

Same here.

> +
> +/**
> + * vdec_msg_queue_dqbuf - dequeue lat buffer from queue list.
> + * @ctx: message queue context
> + */
> +struct vdec_lat_buf *vdec_msg_queue_dqbuf(struct vdec_msg_queue_ctx *ctx);
> +
> +/**
> + * vdec_msg_queue_update_ube_rptr - used to updata the ube read point.
> + * @msg_queue: used to store the lat buffer information
> + * @ube_rptr: current ube read point
> + */
> +void vdec_msg_queue_update_ube_rptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_rptr);

... and again ...

> +
> +/**
> + * vdec_msg_queue_update_ube_wptr - used to updata the ube write point.
> + * @msg_queue: used to store the lat buffer information
> + * @ube_wptr: current ube write point
> + */
> +void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue,
> +	uint64_t ube_wptr);

... and again ...

> +
> +/**
> + * vdec_msg_queue_wait_lat_buf_full - used to check whether all lat buffer
> + *                                    in lat list.
> + * @msg_queue: used to store the lat buffer information
> + */
> +bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue);
> +
> +/**
> + * vdec_msg_queue_deinit - deinit lat buffer information.
> + * @msg_queue: used to store the lat buffer information
> + * @ctx: v4l2 ctx
> + */
> +void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
> +			   struct mtk_vcodec_ctx *ctx);

... and again.

> +
> +#endif
> 


