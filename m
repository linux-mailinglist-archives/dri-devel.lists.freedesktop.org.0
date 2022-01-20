Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9B495116
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7D10E390;
	Thu, 20 Jan 2022 15:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D2010E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:10:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F19781F450C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642691449;
 bh=nEgdR/KgZQL268DaWFkTldrCGXi81p2iJGObIq7IsQI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jGyNvUF/+bUkr+B77ANFgiANv+ajUnEut7lHvYvwMcYD956oUd0c9QGS6Vsyp1PEC
 3J3nD8FbM3+3o91h2oK/TYXV222XN5bkP/n3G79iUCk6nQ0Of7R+8sSzbFBqliKYjz
 5cVCT5j82I7Nz6fwXZcaj5EvkPr/bI3uq/iBzb+lRlTlPb07jVFt63PgGtVgnS92kc
 mMzfc1rxCcx4oQGiWhzqk7chzzcj9uEUTpaFFQgEmbPel1Z7VTj58OAtdrEqtC1FLE
 XuvgBNN6j9Xt1awidfoTvWeWeE9GoqTgMlio5lvPjoleU1F1vEibJOCKlVj/12fhg/
 eRaoxYZUPvHvg==
Subject: Re: [PATCH v5, 12/15] media: mtk-vcodec: Extract H264 common code
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220117094001.20049-1-yunfei.dong@mediatek.com>
 <20220117094001.20049-13-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <651387eb-561f-06b4-f269-7b5f7873fc59@collabora.com>
Date: Thu, 20 Jan 2022 16:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117094001.20049-13-yunfei.dong@mediatek.com>
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

Il 17/01/22 10:39, Yunfei Dong ha scritto:
> Mt8192 can use some of common code with mt8183. Moves them to
> a new file in order to reuse.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
>   .../mtk-vcodec/vdec/vdec_h264_req_common.c    | 307 ++++++++++++++
>   .../mtk-vcodec/vdec/vdec_h264_req_common.h    | 253 +++++++++++
>   .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 395 +-----------------
>   4 files changed, 579 insertions(+), 377 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
>   create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index 359619653a0e..3f41d748eee5 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -9,6 +9,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>   		vdec/vdec_vp8_if.o \
>   		vdec/vdec_vp9_if.o \
>   		vdec/vdec_h264_req_if.o \
> +		vdec/vdec_h264_req_common.o \
>   		mtk_vcodec_dec_drv.o \
>   		vdec_drv_if.o \
>   		vdec_vpu_if.o \
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
> new file mode 100644
> index 000000000000..90e8c4906e2a
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +
> +#include "vdec_h264_req_common.h"
> +
> +/* get used parameters for sps/pps */
> +#define GET_MTK_VDEC_FLAG(cond, flag) \
> +	{ dst_param->cond = ((src_param->flags & flag) ? (1) : (0)); }
> +#define GET_MTK_VDEC_PARAM(param) \
> +	{ dst_param->param = src_param->param; }
> +
> +/*
> + * The firmware expects unused reflist entries to have the value 0x20.
> + */
> +void mtk_vdec_h264_fixup_ref_list(u8 *ref_list, size_t num_valid)
> +{
> +	memset(&ref_list[num_valid], 0x20, 32 - num_valid);
> +}
> +
> +void *mtk_vdec_h264_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
> +{
> +	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
> +

Like written in the review for the VP8 driver, please perform a NULL check and
handle the error case properly in the caller...

> +	return ctrl->p_cur.p;
> +}
> +
> +void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_ctx *ctx,
> +				 struct slice_api_h264_decode_param *decode_params,
> +				 mtk_h264_dpb_info *h264_dpb_info)

				struct mtk_h264_dpb_info *h264_dpb_info)
				^^^^^^
Oops! This typo makes this code unable to be compiled.

> +{
> +	struct vb2_queue *vq;
> +	struct vb2_buffer *vb;
> +	struct vb2_v4l2_buffer *vb2_v4l2;
> +	int index;
> +
> +	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +
> +	for (index = 0; index < V4L2_H264_NUM_DPB_ENTRIES; index++) {
> +		const struct slice_h264_dpb_entry *dpb;
> +		int vb2_index;
> +

...snip...

> +void mtk_vdec_h264_copy_scaling_matrix(struct slice_api_h264_scaling_matrix *dst_matrix,
> +				       const struct v4l2_ctrl_h264_scaling_matrix *src_matrix)
> +{
> +	memcpy(dst_matrix->scaling_list_4x4, src_matrix->scaling_list_4x4,
> +	       sizeof(dst_matrix->scaling_list_4x4));
> +
> +	memcpy(dst_matrix->scaling_list_8x8, src_matrix->scaling_list_8x8,
> +	       sizeof(dst_matrix->scaling_list_8x8));
> +}
> +
> +void
> +mtk_vdec_h264_copy_decode_params(struct slice_api_h264_decode_param *dst_params,
> +				 const struct v4l2_ctrl_h264_decode_params *src_params,
> +				 const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);

There's another overlook here:
				const struct v4l2_h264_dpb_entry *dpb)

> +{
> +	int i;

Regards,
Angelo
