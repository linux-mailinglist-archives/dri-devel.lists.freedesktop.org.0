Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3DA4950D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827F389870;
	Thu, 20 Jan 2022 15:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D9D89870
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:02:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 364241F452FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642690968;
 bh=UCYAYN1otaB6DgQDjiu+pKsBQqT4D0xd+V8HgSZi97s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bwh2Ak0PNsoNN13HwbrW7GMrQIXxOH1U2BbGmXsIpGVaoEtPvBCshBivGhjAsBiRw
 DPpe96LO9+m4ZXCZFY1rkv9o4gFVovnGJRk5UcPDVKfai/ZuA4SqQeCBthPkex/BgD
 qEmgdTFv4R1oOADx/CwuEnJK4umtN15o0O/1mp3bWP80XD7+/4grkexxOso+rZDQok
 N1TOfDlHKdSRMMKewy93ovBaOFVvXJuTlngYURGC7VaUCLmDciSxRUVH/KMDN0fVmn
 0yXCwwpSJHepNdQdussTpXNhuFL1LgWOCoZ05UI/8Isoj/lh7c9aC6lrnTXY8Dw8np
 UXRtI8tDcO0LQ==
Subject: Re: [PATCH v5, 14/15] media: mtk-vcodec: support stateless VP8
 decoding
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220117094001.20049-1-yunfei.dong@mediatek.com>
 <20220117094001.20049-15-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ce69e326-04b7-6866-92c3-50745b3a3d01@collabora.com>
Date: Thu, 20 Jan 2022 16:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117094001.20049-15-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/01/22 10:40, Yunfei Dong ha scritto:
> Add support for VP8 decoding using the stateless API,
> as supported by MT8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  24 +-
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   1 +
>   .../mtk-vcodec/vdec/vdec_vp8_req_if.c         | 440 ++++++++++++++++++
>   .../media/platform/mtk-vcodec/vdec_drv_if.c   |   4 +
>   .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
>   6 files changed, 469 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c
> 

Hello Yunfei,
I've found some issues in this patch, and there are also some other considerations
to tidy it up.

(....snip....)

> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c
> new file mode 100644
> index 000000000000..969568b98251
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c
> @@ -0,0 +1,440 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include <linux/slab.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <uapi/linux/v4l2-controls.h>
> +
> +#include "../mtk_vcodec_util.h"
> +#include "../mtk_vcodec_dec.h"
> +#include "../mtk_vcodec_intr.h"
> +#include "../vdec_drv_base.h"
> +#include "../vdec_drv_if.h"
> +#include "../vdec_vpu_if.h"
> +
> +/* Decoding picture buffer size (3 reference frames plus current frame) */
> +#define VP8_DPB_SIZE			4
> +
> +/* HW working buffer size (bytes) */
> +#define VP8_SEG_ID_SZ		(256 * 1024)

This is SZ_256K

> +#define VP8_PP_WRAPY_SZ		(64 * 1024)
> +#define VP8_PP_WRAPC_SZ		(64 * 1024)
> +#define VP8_VLD_PRED_SZ		(64 * 1024)

And these are all SZ_64K.

> +
> +/**
> + * struct vdec_vp8_slice_info - decode misc information
> + * @vld_wrapper_dma   : vld wrapper dma address
> + * @seg_id_buf_dma    : seg id dma address
> + * @wrap_y_dma        : wrap y dma address
> + * @wrap_c_dma        : wrap y dma address
> + * @cur_y_fb_dma      : current plane Y frame buffer dma address
> + * @cur_c_fb_dma      : current plane C frame buffer dma address
> + * @bs_dma            : bitstream dma address
> + * @bs_sz             : bitstream size
> + * @resolution_changed: resolution change flag 1 - changed,  0 - not change
> + * @frame_header_type : current frame header type
> + * @wait_key_frame    : wait key frame coming
> + * @crc               : used to check whether hardware's status is right
> + * @timeout           : decode timeout: 1 timeout, 0 no timeount

There's no `timeout` in this structure, did you forget to remove the
documentation for this one?

> + * @reserved:         : reserved, currently unused
> + */
> +struct vdec_vp8_slice_info {
> +	u64 vld_wrapper_dma;
> +	u64 seg_id_buf_dma;
> +	u64 wrap_y_dma;
> +	u64 wrap_c_dma;
> +	u64 cur_y_fb_dma;
> +	u64 cur_c_fb_dma;
> +	u64 bs_dma;
> +	u32 bs_sz;
> +	u32 resolution_changed;
> +	u32 frame_header_type;
> +	u32 crc[8];
> +	u32 reserved;
> +};
> +
> +/**
> + * struct vdec_vp8_slice_dpb_info  - vp8 reference information
> + * @y_dma_addr    : Y bitstream physical address
> + * @c_dma_addr    : CbCr bitstream physical address
> + * @reference_flag: reference picture flag
> + * @reserved      : 64bit align
> + */
> +struct vdec_vp8_slice_dpb_info {
> +	dma_addr_t y_dma_addr;
> +	dma_addr_t c_dma_addr;
> +	int reference_flag;
> +	int reserved;
> +};
> +
> +/**
> + * struct vdec_vp8_slice_vsi - VPU shared information
> + * @dec          : decoding information
> + * @pic          : picture information
> + * @vp8_dpb_info : reference buffer information
> + */
> +struct vdec_vp8_slice_vsi {
> +	struct vdec_vp8_slice_info dec;
> +	struct vdec_pic_info pic;
> +	struct vdec_vp8_slice_dpb_info vp8_dpb_info[3];
> +};
> +
> +/**
> + * struct vdec_vp8_slice_inst - VP8 decoder instance
> + * @seg_id_buf     : seg buffer
> + * @wrap_y_buf     : wrapper y buffer
> + * @wrap_c_buf     : wrapper c buffer
> + * @vld_wrapper_buf: vld wrapper buffer
> + * @ctx            : V4L2 context
> + * @vpu            : VPU instance for decoder
> + * @vsi            : VPU share information
> + */
> +struct vdec_vp8_slice_inst {
> +	struct mtk_vcodec_mem seg_id_buf;
> +	struct mtk_vcodec_mem wrap_y_buf;
> +	struct mtk_vcodec_mem wrap_c_buf;
> +	struct mtk_vcodec_mem vld_wrapper_buf;
> +	struct mtk_vcodec_ctx *ctx;
> +	struct vdec_vpu_inst vpu;
> +	struct vdec_vp8_slice_vsi *vsi;
> +};
> +
> +static void *vdec_vp8_slice_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
> +{
> +	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
> +

You should check if ctrl is NULL here, and eventually return a ERR_PTR(-EINVAL)
if that ever occurs... or you may get a NULL pointer kernel panic...

> +	return ctrl->p_cur.p;
> +}
> +

...snip...

> +
> +static void vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst)

static int ..... ?

> +{
> +	const struct v4l2_ctrl_vp8_frame *frame_header =
> +		vdec_vp8_slice_get_ctrl_ptr(inst->ctx, V4L2_CTRL_TYPE_VP8_FRAME);

This is crashing the kernel, because it ends up being NULL...
... the solution to that is to look for V4L2_CID_STATELESS_VP8_FRAME instead of
V4L2_CTRL_TYPE_VP8_FRAME, but you should really do an error check here and
eventually bail out, in case anything goes horribly wrong...

> +	struct mtk_vcodec_ctx *ctx = inst->ctx;
> +	struct vb2_queue *vq;
> +	struct vb2_buffer *vb;
> +	u64 referenct_ts;
> +	int index, vb2_index;
> +

...so you'd be checking for error pointer of frame_header here and returning.

> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	for (index = 0; index < 3; index++) {
> +		referenct_ts = vdec_vp8_slice_get_ref_by_ts(frame_header, index);
> +		vb2_index = vb2_find_timestamp(vq, referenct_ts, 0);
> +		if (vb2_index < 0) {
> +			if (!V4L2_VP8_FRAME_IS_KEY_FRAME(frame_header))
> +				mtk_vcodec_err(inst, "reference invalid: index(%d) ts(%lld)",
> +					       index, referenct_ts);
> +			inst->vsi->vp8_dpb_info[index].reference_flag = 0;
> +			continue;
> +		}
> +		inst->vsi->vp8_dpb_info[index].reference_flag = 1;
> +
> +		vb = vq->bufs[vb2_index];
> +		inst->vsi->vp8_dpb_info[index].y_dma_addr =
> +			vb2_dma_contig_plane_dma_addr(vb, 0);
> +		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
> +			inst->vsi->vp8_dpb_info[index].c_dma_addr =
> +				vb2_dma_contig_plane_dma_addr(vb, 1);
> +		else
> +			inst->vsi->vp8_dpb_info[index].c_dma_addr =
> +				inst->vsi->vp8_dpb_info[index].y_dma_addr +
> +				ctx->picinfo.fb_sz[0];
> +	}
> +
> +	inst->vsi->dec.frame_header_type = frame_header->flags >> 1;
> +}
> +
> +static int vdec_vp8_slice_init(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct vdec_vp8_slice_inst *inst;
> +	int err;
> +
> +	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
> +	if (!inst)
> +		return -ENOMEM;
> +
> +	inst->ctx = ctx;
> +
> +	inst->vpu.id = SCP_IPI_VDEC_LAT;
> +	inst->vpu.core_id = SCP_IPI_VDEC_CORE;
> +	inst->vpu.ctx = ctx;
> +	inst->vpu.codec_type = ctx->current_codec;
> +	inst->vpu.capture_type = ctx->capture_fourcc;
> +
> +	err = vpu_dec_init(&inst->vpu);
> +	if (err) {
> +		mtk_vcodec_err(inst, "vdec_vp8 init err=%d", err);
> +		goto error_free_inst;
> +	}
> +
> +	inst->vsi = inst->vpu.vsi;
> +	err = vdec_vp8_slice_alloc_working_buf(inst);
> +	if (err)
> +		goto error_deinit;
> +
> +	mtk_vcodec_debug(inst, "vp8 struct size = %d vsi: %d\n",
> +			 (int)sizeof(struct v4l2_ctrl_vp8_frame),
> +			 (int)sizeof(struct vdec_vp8_slice_vsi));
> +	mtk_vcodec_debug(inst, "vp8:%p, codec_type = 0x%x vsi: 0x%p",
> +			 inst, inst->vpu.codec_type, inst->vpu.vsi);
> +
> +	ctx->drv_handle = inst;
> +	return 0;
> +
> +error_deinit:
> +	vpu_dec_deinit(&inst->vpu);
> +error_free_inst:
> +	kfree(inst);
> +	return err;
> +}
> +
> +static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> +				 struct vdec_fb *fb, bool *res_chg)
> +{
> +	struct vdec_vp8_slice_inst *inst = h_vdec;
> +	struct vdec_vpu_inst *vpu = &inst->vpu;
> +	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
> +	unsigned int data;
> +	u64 y_fb_dma, c_fb_dma;
> +	int err, timeout;
> +
> +	/* Resolution changes are never initiated by us */
> +	*res_chg = false;
> +
> +	/* bs NULL means flush decoder */
> +	if (!bs)
> +		return vpu_dec_reset(vpu);
> +
> +	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +
> +	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
> +	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> +
> +	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
> +	if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
> +		c_fb_dma = y_fb_dma +
> +			inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
> +	else
> +		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
> +
> +	inst->vsi->dec.bs_dma = (unsigned long)bs->dma_addr;

inst->vsi->dec.bs_dma is u64... so please cast to u64.

> +	inst->vsi->dec.bs_sz = bs->size;
> +	inst->vsi->dec.cur_y_fb_dma = y_fb_dma;
> +	inst->vsi->dec.cur_c_fb_dma = c_fb_dma;
> +
> +	mtk_vcodec_debug(inst, "frame[%d] bs(%zu 0x%lx) y/c(0x%llx 0x%llx)",
> +			 inst->ctx->decoded_frame_cnt,
> +			 bs->size, (unsigned long)bs->dma_addr,

...and it would be useful if it was u64 here too, obviously.

> +			 y_fb_dma, c_fb_dma);
> +
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &dst_buf_info->m2m_buf.vb, true);
> +
> +	vdec_vp8_slice_get_decode_parameters(inst);
> +	err = vpu_dec_start(vpu, &data, 1);
> +	if (err) {
> +		mtk_vcodec_debug(inst, "vp8 dec start err!");
> +		goto error;
> +	}

Regards,
Angelo

