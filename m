Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588B4C984D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 23:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432D310E6BD;
	Tue,  1 Mar 2022 22:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B70810E6BD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 22:22:27 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id f18so16860qtb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=wx8Yupe3IibmBZEFCAonWVHfr5GLoV154wkhInWI5jk=;
 b=dcSn2EQN2OjsNmja+3SrZ9u6zZJovAzLM1HzXYl3vy9Go7lDfqXwDvL9sTJjLWCBNd
 BOse95QEaZGQd0f+Ogo1YbLZR5bp4Ek0METE2VlbljsgTbvOXZ+HABndVT349maEOJgj
 i8j43EqUkiNfI3Ce99bzSY6zU4mj1fTwXK2kkvuqWagovcQR0+LPsmnpi2lXKDMqOsmA
 bLOFJiwhZkYv4l6nrezHrb2dZl0ZL73vAqHBh0lt6Bk0/LbP9FSIqF8eiS0SjJWBS7W0
 4YXGT/cDmQAKFJswDlNHsElKjqM2B0HrvXMHc1vrM07reX834CZ8pLP7SEjkNYSt9kxv
 LBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wx8Yupe3IibmBZEFCAonWVHfr5GLoV154wkhInWI5jk=;
 b=q8ySuHsC87uQ+DVbF4HLfR8xefeyoXBTrsab3ZZBs+Zw6hjo9oZ1kaKTlBEcQNhx45
 A0tWKMim+gPi8Ld9xz1zFPApGx7UuezUf8VzNvdRlela+rKY1tkt6VoWf5dR68cR7R5S
 bCBiEI/mI7v0Ev2jRfGn57eyHj+OKwZD7WlS1Ay6iifypjliuzCvgswN4QX7xSnWROai
 J3m/auOqbdvvrJ5ArhIL6oWpclKXg8p9E6UNSlNRp8av0VuflPIapLVByM0ASk4UkAWL
 IyQqyXc6iUw1a6mgx6Rxz9GaCG4yThHUYb4BheraFF9pY0AA9gyxKtIFdSBoZfkkKWk2
 CD4g==
X-Gm-Message-State: AOAM5329PwgnSuMdUtXXObmL/S7+fYWcQFAfIm+jlEnqF3HWyK6LZaP4
 O/winxdpQf0HNXK9bWC5RvZhMA==
X-Google-Smtp-Source: ABdhPJwbLU1d0/ViO21nEjMaGUyFZY2oJGWviTEyWAEoZ+ljuzxI+OJRUIYnzr5YL90EJ0eGP0O9LA==
X-Received: by 2002:a05:622a:1794:b0:2de:697:e565 with SMTP id
 s20-20020a05622a179400b002de0697e565mr21476554qtk.563.1646173345928; 
 Tue, 01 Mar 2022 14:22:25 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 g1-20020ac87d01000000b002d5c8226f17sm10452557qtb.7.2022.03.01.14.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:22:25 -0800 (PST)
Message-ID: <554cd6c34e1d62aae9995431f62fb3b3d5f0123b.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 15/15] media: mtk-vcodec: support stateless VP9
 decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 01 Mar 2022 17:22:23 -0500
In-Reply-To: <20220223034008.15781-16-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-16-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 23 février 2022 à 11:40 +0800, Yunfei Dong a écrit :
> Add support for VP9 decoding using the stateless API,
> as supported by MT8192. And the drivers is lat and core architecture.

You already have a reviewed tag, but I'm under the impression that there is a
fair amount of duplication with the helper library v4l2-vp9:

  include/media/v4l2-vp9.h
  drivers/media/v4l2-core/v4l2-vp9.c

Can you at least give it a look and comment on why you can't use/adapt it for
this driver ?

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: George Sun <george.sun@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/media/platform/mtk-vcodec/Makefile    |    1 +
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   26 +-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |    1 +
>  .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c     | 1971 +++++++++++++++++
>  .../media/platform/mtk-vcodec/vdec_drv_if.c   |    4 +
>  .../media/platform/mtk-vcodec/vdec_drv_if.h   |    1 +
>  6 files changed, 2001 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c
> 
> diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> index b457daf2d196..93e7a343b5b0 100644
> --- a/drivers/media/platform/mtk-vcodec/Makefile
> +++ b/drivers/media/platform/mtk-vcodec/Makefile
> @@ -9,6 +9,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
>  		vdec/vdec_vp8_if.o \
>  		vdec/vdec_vp8_req_if.o \
>  		vdec/vdec_vp9_if.o \
> +		vdec/vdec_vp9_req_lat_if.o \
>  		vdec/vdec_h264_req_if.o \
>  		vdec/vdec_h264_req_common.o \
>  		vdec/vdec_h264_req_multi_if.o \
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 2a0164ddc708..3770e8117488 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -91,13 +91,28 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
>  			.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
>  		},
>  		.codec_type = V4L2_PIX_FMT_VP8_FRAME,
> -	}
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_STATELESS_VP9_FRAME,
> +		},
> +		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
> +	},
> +	{
> +		.cfg = {
> +			.id = V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
> +			.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +			.def = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +			.max = V4L2_MPEG_VIDEO_VP9_PROFILE_3,
> +		},
> +		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
> +	},
>  };
>  
>  #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
>  
> -static struct mtk_video_fmt mtk_video_formats[4];
> -static struct mtk_codec_framesizes mtk_vdec_framesizes[2];
> +static struct mtk_video_fmt mtk_video_formats[5];
> +static struct mtk_codec_framesizes mtk_vdec_framesizes[3];
>  
>  static struct mtk_video_fmt default_out_format;
>  static struct mtk_video_fmt default_cap_format;
> @@ -366,6 +381,7 @@ static void mtk_vcodec_add_formats(unsigned int fourcc,
>  	switch (fourcc) {
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_VP8_FRAME:
> +	case V4L2_PIX_FMT_VP9_FRAME:
>  		mtk_video_formats[count_formats].fourcc = fourcc;
>  		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
>  		mtk_video_formats[count_formats].num_planes = 1;
> @@ -413,6 +429,10 @@ static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
>  		mtk_vcodec_add_formats(V4L2_PIX_FMT_VP8_FRAME, ctx);
>  		out_format_count++;
>  	}
> +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_VP9_FRAME) {
> +		mtk_vcodec_add_formats(V4L2_PIX_FMT_VP9_FRAME, ctx);
> +		out_format_count++;
> +	}
>  
>  	if (cap_format_count)
>  		default_cap_format = mtk_video_formats[cap_format_count - 1];
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index c68297db225e..ea58f11e7659 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -355,6 +355,7 @@ enum mtk_vdec_format_types {
>  	MTK_VDEC_FORMAT_MT21C = 0x40,
>  	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
>  	MTK_VDEC_FORMAT_VP8_FRAME = 0x200,
> +	MTK_VDEC_FORMAT_VP9_FRAME = 0x400,
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c
> new file mode 100644
> index 000000000000..c678170c7ca3
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c
> @@ -0,0 +1,1971 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: George Sun <george.sun@mediatek.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "../mtk_vcodec_util.h"
> +#include "../mtk_vcodec_dec.h"
> +#include "../mtk_vcodec_intr.h"
> +#include "../vdec_drv_base.h"
> +#include "../vdec_drv_if.h"
> +#include "../vdec_vpu_if.h"
> +
> +/* reset_frame_context defined in VP9 spec */
> +#define VP9_RESET_FRAME_CONTEXT_NONE0 0
> +#define VP9_RESET_FRAME_CONTEXT_NONE1 1
> +#define VP9_RESET_FRAME_CONTEXT_SPEC 2
> +#define VP9_RESET_FRAME_CONTEXT_ALL 3
> +
> +#define VP9_TILE_BUF_SIZE 4096
> +#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_COUNTS_BUF_SIZE 16384
> +
> +#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> +#define LF_FLAG(x) (!!((lf)->flags & V4L2_VP9_LOOP_FILTER_FLAG_##x))
> +#define SEG_FLAG(x) (!!((seg)->flags & V4L2_VP9_SEGMENTATION_FLAG_##x))
> +
> +/*
> + * struct vdec_vp9_slice_frame_ctx - vp9 prob tables footprint
> + */
> +struct vdec_vp9_slice_frame_ctx {
> +	struct {
> +		u8 probs[6][3];
> +		u8 padding[2];
> +	} coef_probs[4][2][2][6];
> +
> +	u8 y_mode_prob[4][16];
> +	u8 switch_interp_prob[4][16];
> +	u8 seg[32];  /* ignore */
> +	u8 comp_inter_prob[16];
> +	u8 comp_ref_prob[16];
> +	u8 single_ref_prob[5][2];
> +	u8 single_ref_prob_padding[6];
> +
> +	u8 joint[3];
> +	u8 joint_padding[13];
> +	struct {
> +		u8 sign;
> +		u8 classes[10];
> +		u8 padding[5];
> +	} sign_classes[2];
> +	struct {
> +		u8 class0[1];
> +		u8 bits[10];
> +		u8 padding[5];
> +	} class0_bits[2];
> +	struct {
> +		u8 class0_fp[2][3];
> +		u8 fp[3];
> +		u8 class0_hp;
> +		u8 hp;
> +		u8 padding[5];
> +	} class0_fp_hp[2];
> +
> +	u8 uv_mode_prob[10][16];
> +	u8 uv_mode_prob_padding[2][16];
> +
> +	u8 partition_prob[16][4];
> +
> +	u8 inter_mode_probs[7][4];
> +	u8 skip_probs[4];
> +
> +	u8 tx_p8x8[2][4];
> +	u8 tx_p16x16[2][4];
> +	u8 tx_p32x32[2][4];
> +	u8 intra_inter_prob[8];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_frame_counts - vp9 counts tables footprint
> + */
> +struct vdec_vp9_slice_frame_counts {
> +	union {
> +		struct {
> +			u32 band_0[3];
> +			u32 padding0[1];
> +			u32 band_1_5[5][6];
> +			u32 padding1[2];
> +		} eob_branch[4][2][2];
> +		u32 eob_branch_space[256 * 4];
> +	};
> +
> +	struct {
> +		u32 band_0[3][4];
> +		u32 band_1_5[5][6][4];
> +	} coef_probs[4][2][2];
> +
> +	u32 intra_inter[4][2];
> +	u32 comp_inter[5][2];
> +	u32 comp_inter_padding[2];
> +	u32 comp_ref[5][2];
> +	u32 comp_ref_padding[2];
> +	u32 single_ref[5][2][2];
> +	u32 inter_mode[7][4];
> +	u32 y_mode[4][12];
> +	u32 uv_mode[10][10];
> +	u32 partition[16][4];
> +	u32 switchable_interp[4][4];
> +
> +	u32 tx_p8x8[2][2];
> +	u32 tx_p16x16[2][4];
> +	u32 tx_p32x32[2][4];
> +
> +	u32 skip[3][4];
> +
> +	u32 joint[4];
> +
> +	struct {
> +		u32 sign[2];
> +		u32 class0[2];
> +		u32 classes[12];
> +		u32 bits[10][2];
> +		u32 padding[4];
> +		u32 class0_fp[2][4];
> +		u32 fp[4];
> +		u32 class0_hp[2];
> +		u32 hp[2];
> +	} mvcomp[2];
> +
> +	u32 reserved[126][4];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_uncompressed_header - vp9 uncompressed header syntax
> + *                                             used for decoding
> + */
> +struct vdec_vp9_slice_uncompressed_header {
> +	u8 profile;
> +	u8 last_frame_type;
> +	u8 frame_type;
> +
> +	u8 last_show_frame;
> +	u8 show_frame;
> +	u8 error_resilient_mode;
> +
> +	u8 bit_depth;
> +	u8 padding0[1];
> +	u16 last_frame_width;
> +	u16 last_frame_height;
> +	u16 frame_width;
> +	u16 frame_height;
> +
> +	u8 intra_only;
> +	u8 reset_frame_context;
> +	u8 ref_frame_sign_bias[4];
> +	u8 allow_high_precision_mv;
> +	u8 interpolation_filter;
> +
> +	u8 refresh_frame_context;
> +	u8 frame_parallel_decoding_mode;
> +	u8 frame_context_idx;
> +
> +	/* loop_filter_params */
> +	u8 loop_filter_level;
> +	u8 loop_filter_sharpness;
> +	u8 loop_filter_delta_enabled;
> +	s8 loop_filter_ref_deltas[4];
> +	s8 loop_filter_mode_deltas[2];
> +
> +	/* quantization_params */
> +	u8 base_q_idx;
> +	s8 delta_q_y_dc;
> +	s8 delta_q_uv_dc;
> +	s8 delta_q_uv_ac;
> +
> +	/* segmentation_params */
> +	u8 segmentation_enabled;
> +	u8 segmentation_update_map;
> +	u8 segmentation_tree_probs[7];
> +	u8 padding1[1];
> +	u8 segmentation_temporal_udpate;
> +	u8 segmentation_pred_prob[3];
> +	u8 segmentation_update_data;
> +	u8 segmentation_abs_or_delta_update;
> +	u8 feature_enabled[8];
> +	s16 feature_value[8][4];
> +
> +	/* tile_info */
> +	u8 tile_cols_log2;
> +	u8 tile_rows_log2;
> +	u8 padding2[2];
> +
> +	u16 uncompressed_header_size;
> +	u16 header_size_in_bytes;
> +
> +	/* LAT OUT, CORE IN */
> +	u32 dequant[8][4];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_compressed_header - vp9 compressed header syntax
> + *                                           used for decoding.
> + */
> +struct vdec_vp9_slice_compressed_header {
> +	u8 tx_mode;
> +	u8 ref_mode;
> +	u8 comp_fixed_ref;
> +	u8 comp_var_ref[2];
> +	u8 padding[3];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_tiles - vp9 tile syntax
> + */
> +struct vdec_vp9_slice_tiles {
> +	u32 size[4][64];
> +	u32 mi_rows[4];
> +	u32 mi_cols[64];
> +	u8 actual_rows;
> +	u8 padding[7];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_reference - vp9 reference frame information
> + */
> +struct vdec_vp9_slice_reference {
> +	u16 frame_width;
> +	u16 frame_height;
> +	u8 bit_depth;
> +	u8 subsampling_x;
> +	u8 subsampling_y;
> +	u8 padding;
> +};
> +
> +/*
> + * struct vdec_vp9_slice_frame - vp9 syntax used for decoding
> + */
> +struct vdec_vp9_slice_frame {
> +	struct vdec_vp9_slice_uncompressed_header uh;
> +	struct vdec_vp9_slice_compressed_header ch;
> +	struct vdec_vp9_slice_tiles tiles;
> +	struct vdec_vp9_slice_reference ref[3];
> +};
> +
> +/*
> + * struct vdec_vp9_slice_init_vsi - VSI used to initialize instance
> + */
> +struct vdec_vp9_slice_init_vsi {
> +	unsigned int architecture;
> +	unsigned int reserved;
> +	u64 core_vsi;
> +	/* default frame context's position in MicroP */
> +	u64 default_frame_ctx;
> +};
> +
> +/*
> + * struct vdec_vp9_slice_mem - memory address and size
> + */
> +struct vdec_vp9_slice_mem {
> +	union {
> +		u64 buf;
> +		dma_addr_t dma_addr;
> +	};
> +	union {
> +		size_t size;
> +		dma_addr_t dma_addr_end;
> +		u64 padding;
> +	};
> +};
> +
> +/*
> + * struct vdec_vp9_slice_bs - input buffer for decoding
> + */
> +struct vdec_vp9_slice_bs {
> +	struct vdec_vp9_slice_mem buf;
> +	struct vdec_vp9_slice_mem frame;
> +};
> +
> +/*
> + * struct vdec_vp9_slice_fb - frame buffer for decoding
> + */
> +struct vdec_vp9_slice_fb {
> +	struct vdec_vp9_slice_mem y;
> +	struct vdec_vp9_slice_mem c;
> +};
> +
> +/*
> + * struct vdec_vp9_slice_state - decoding state
> + */
> +struct vdec_vp9_slice_state {
> +	int err;
> +	unsigned int full;
> +	unsigned int timeout;
> +	unsigned int perf;
> +
> +	unsigned int crc[12];
> +};
> +
> +/**
> + * struct vdec_vp9_slice_vsi - exchange decoding information
> + *                             between Main CPU and MicroP
> + * @bs          : input buffer
> + * @fb          : output buffer
> + * @ref         : 3 reference buffers
> + * @mv          : mv working buffer
> + * @seg         : segmentation working buffer
> + * @tile        : tile buffer
> + * @prob        : prob table buffer, used to set/update prob table
> + * @counts      : counts table buffer, used to update prob table
> + * @ube         : general buffer
> + * @trans       : trans buffer position in general buffer
> + * @err_map     : error buffer
> + * @row_info    : row info buffer
> + * @frame       : decoding syntax
> + * @state       : decoding state
> + */
> +struct vdec_vp9_slice_vsi {
> +	/* used in LAT stage */
> +	struct vdec_vp9_slice_bs bs;
> +	/* used in Core stage */
> +	struct vdec_vp9_slice_fb fb;
> +	struct vdec_vp9_slice_fb ref[3];
> +
> +	struct vdec_vp9_slice_mem mv[2];
> +	struct vdec_vp9_slice_mem seg[2];
> +	struct vdec_vp9_slice_mem tile;
> +	struct vdec_vp9_slice_mem prob;
> +	struct vdec_vp9_slice_mem counts;
> +
> +	/* LAT stage's output, Core stage's input */
> +	struct vdec_vp9_slice_mem ube;
> +	struct vdec_vp9_slice_mem trans;
> +	struct vdec_vp9_slice_mem err_map;
> +	struct vdec_vp9_slice_mem row_info;
> +
> +	/* decoding parameters */
> +	struct vdec_vp9_slice_frame frame;
> +
> +	struct vdec_vp9_slice_state state;
> +};
> +
> +/**
> + * struct vdec_vp9_slice_pfc - per-frame context that contains a local vsi.
> + *                             pass it from lat to core
> + * @vsi         : local vsi. copy to/from remote vsi before/after decoding
> + * @ref_idx     : reference buffer index
> + * @seq         : picture sequence
> + * @state       : decoding state
> + */
> +struct vdec_vp9_slice_pfc {
> +	struct vdec_vp9_slice_vsi vsi;
> +
> +	u64 ref_idx[3];
> +
> +	int seq;
> +
> +	/* LAT/Core CRC */
> +	struct vdec_vp9_slice_state state[2];
> +};
> +
> +/*
> + * enum vdec_vp9_slice_resolution_level
> + */
> +enum vdec_vp9_slice_resolution_level {
> +	VP9_RES_NONE,
> +	VP9_RES_FHD,
> +	VP9_RES_4K,
> +	VP9_RES_8K,
> +};
> +
> +/*
> + * struct vdec_vp9_slice_ref - picture's width & height should kept
> + *                             for later decoding as reference picture
> + */
> +struct vdec_vp9_slice_ref {
> +	unsigned int width;
> +	unsigned int height;
> +};
> +
> +/**
> + * struct vdec_vp9_slice_instance - represent one vp9 instance
> + * @ctx         : pointer to codec's context
> + * @vpu         : VPU instance
> + * @seq         : global picture sequence
> + * @level       : level of current resolution
> + * @width       : width of last picture
> + * @height      : height of last picture
> + * @frame_type  : frame_type of last picture
> + * @irq         : irq to Main CPU or MicroP
> + * @show_frame  : show_frame of last picture
> + * @dpb         : picture information (width/height) for reference
> + * @mv          : mv working buffer
> + * @seg         : segmentation working buffer
> + * @tile        : tile buffer
> + * @prob        : prob table buffer, used to set/update prob table
> + * @counts      : counts table buffer, used to update prob table
> + * @frame_ctx   : 4 frame context according to VP9 Spec
> + * @dirty       : state of each frame context
> + * @init_vsi    : vsi used for initialized VP9 instance
> + * @vsi         : vsi used for decoding/flush ...
> + * @core_vsi    : vsi used for Core stage
> + */
> +struct vdec_vp9_slice_instance {
> +	struct mtk_vcodec_ctx *ctx;
> +	struct vdec_vpu_inst vpu;
> +
> +	int seq;
> +
> +	enum vdec_vp9_slice_resolution_level level;
> +
> +	/* for resolution change and get_pic_info */
> +	unsigned int width;
> +	unsigned int height;
> +
> +	/* for last_frame_type */
> +	unsigned int frame_type;
> +	unsigned int irq;
> +
> +	unsigned int show_frame;
> +
> +	/* maintain vp9 reference frame state */
> +	struct vdec_vp9_slice_ref dpb[VB2_MAX_FRAME];
> +
> +	/*
> +	 * normal working buffers
> +	 * mv[0]/seg[0]/tile/prob/counts is used for LAT
> +	 * mv[1]/seg[1] is used for CORE
> +	 */
> +	struct mtk_vcodec_mem mv[2];
> +	struct mtk_vcodec_mem seg[2];
> +	struct mtk_vcodec_mem tile;
> +	struct mtk_vcodec_mem prob;
> +	struct mtk_vcodec_mem counts;
> +
> +	/* 4 prob tables */
> +	struct vdec_vp9_slice_frame_ctx frame_ctx[4];
> +	unsigned char dirty[4];
> +
> +	/* MicroP vsi */
> +	union {
> +		struct vdec_vp9_slice_init_vsi *init_vsi;
> +		struct vdec_vp9_slice_vsi *vsi;
> +	};
> +	struct vdec_vp9_slice_vsi *core_vsi;
> +};
> +
> +/*
> + * (2, (0, (1, 3)))
> + * max level = 2
> + */
> +static const signed char vdec_vp9_slice_inter_mode_tree[6] = {
> +	-2, 2, 0, 4, -1, -3
> +};
> +
> +/* max level = 6 */
> +static const signed char vdec_vp9_slice_intra_mode_tree[18] = {
> +	0, 2, -9, 4, -1, 6, 8, 12, -2, 10, -4, -5, -3, 14, -8, 16, -6, -7
> +};
> +
> +/* max level = 2 */
> +static const signed char vdec_vp9_slice_partition_tree[6] = {
> +	0, 2, -1, 4, -2, -3
> +};
> +
> +/* max level = 1 */
> +static const signed char vdec_vp9_slice_switchable_interp_tree[4] = {
> +	0, 2, -1, -2
> +};
> +
> +/* max level = 2 */
> +static const signed char vdec_vp9_slice_mv_joint_tree[6] = {
> +	0, 2, -1, 4, -2, -3
> +};
> +
> +/* max level = 6 */
> +static const signed char vdec_vp9_slice_mv_class_tree[20] = {
> +	0, 2, -1, 4, 6, 8, -2, -3, 10, 12,
> +	-4, -5, -6, 14, 16, 18, -7, -8, -9, -10
> +};
> +
> +/* max level = 0 */
> +static const signed char vdec_vp9_slice_mv_class0_tree[2] = {
> +	0, -1
> +};
> +
> +/* max level = 2 */
> +static const signed char vdec_vp9_slice_mv_fp_tree[6] = {
> +	0, 2, -1, 4, -2, -3
> +};
> +
> +/*
> + * all VP9 instances could share this default frame context.
> + */
> +static struct vdec_vp9_slice_frame_ctx *vdec_vp9_slice_default_frame_ctx;
> +static DEFINE_MUTEX(vdec_vp9_slice_frame_ctx_lock);
> +
> +static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf);
> +
> +static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance *instance)
> +{
> +	struct vdec_vp9_slice_frame_ctx *remote_frame_ctx;
> +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> +	struct mtk_vcodec_ctx *ctx;
> +	struct vdec_vp9_slice_init_vsi *vsi;
> +	int ret = 0;
> +
> +	ctx = instance->ctx;
> +	vsi = instance->vpu.vsi;
> +	if (!ctx || !vsi)
> +		return -EINVAL;
> +
> +	remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +						     (u32)vsi->default_frame_ctx);
> +	if (!remote_frame_ctx) {
> +		mtk_vcodec_err(instance, "failed to map default frame ctx\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vdec_vp9_slice_frame_ctx_lock);
> +	if (vdec_vp9_slice_default_frame_ctx)
> +		goto out;
> +
> +	frame_ctx = kmalloc(sizeof(*frame_ctx), GFP_KERNEL);
> +	if (!frame_ctx) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	memcpy_fromio(frame_ctx, remote_frame_ctx, sizeof(*frame_ctx));
> +	vdec_vp9_slice_default_frame_ctx = frame_ctx;
> +
> +out:
> +	mutex_unlock(&vdec_vp9_slice_frame_ctx_lock);
> +
> +	return ret;
> +}
> +
> +static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *instance,
> +					       struct vdec_vp9_slice_vsi *vsi)
> +{
> +	struct mtk_vcodec_ctx *ctx = instance->ctx;
> +	enum vdec_vp9_slice_resolution_level level;
> +	/* super blocks */
> +	unsigned int max_sb_w;
> +	unsigned int max_sb_h;
> +	unsigned int max_w;
> +	unsigned int max_h;
> +	unsigned int w;
> +	unsigned int h;
> +	size_t size;
> +	int ret;
> +	int i;
> +
> +	w = vsi->frame.uh.frame_width;
> +	h = vsi->frame.uh.frame_height;
> +
> +	if (w > VCODEC_DEC_4K_CODED_WIDTH ||
> +	    h > VCODEC_DEC_4K_CODED_HEIGHT) {
> +		/* 8K? */
> +		return -EINVAL;
> +	} else if (w > MTK_VDEC_MAX_W || h > MTK_VDEC_MAX_H) {
> +		/* 4K */
> +		level = VP9_RES_4K;
> +		max_w = VCODEC_DEC_4K_CODED_WIDTH;
> +		max_h = VCODEC_DEC_4K_CODED_HEIGHT;
> +	} else {
> +		/* FHD */
> +		level = VP9_RES_FHD;
> +		max_w = MTK_VDEC_MAX_W;
> +		max_h = MTK_VDEC_MAX_H;
> +	}
> +
> +	if (level == instance->level)
> +		return 0;
> +
> +	mtk_vcodec_debug(instance, "resolution level changed, from %u to %u, %ux%u",
> +			 instance->level, level, w, h);
> +
> +	max_sb_w = DIV_ROUND_UP(max_w, 64);
> +	max_sb_h = DIV_ROUND_UP(max_h, 64);
> +	ret = -ENOMEM;
> +
> +	/*
> +	 * Lat-flush must wait core idle, otherwise core will
> +	 * use released buffers
> +	 */
> +
> +	size = (max_sb_w * max_sb_h + 2) * 576;
> +	for (i = 0; i < 2; i++) {
> +		if (instance->mv[i].va)
> +			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
> +		instance->mv[i].size = size;
> +		if (mtk_vcodec_mem_alloc(ctx, &instance->mv[i]))
> +			goto err;
> +	}
> +
> +	size = (max_sb_w * max_sb_h * 32) + 256;
> +	for (i = 0; i < 2; i++) {
> +		if (instance->seg[i].va)
> +			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
> +		instance->seg[i].size = size;
> +		if (mtk_vcodec_mem_alloc(ctx, &instance->seg[i]))
> +			goto err;
> +	}
> +
> +	if (!instance->tile.va) {
> +		instance->tile.size = VP9_TILE_BUF_SIZE;
> +		if (mtk_vcodec_mem_alloc(ctx, &instance->tile))
> +			goto err;
> +	}
> +
> +	if (!instance->prob.va) {
> +		instance->prob.size = VP9_PROB_BUF_SIZE;
> +		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> +			goto err;
> +	}
> +
> +	if (!instance->counts.va) {
> +		instance->counts.size = VP9_COUNTS_BUF_SIZE;
> +		if (mtk_vcodec_mem_alloc(ctx, &instance->counts))
> +			goto err;
> +	}
> +
> +	instance->level = level;
> +	return 0;
> +
> +err:
> +	instance->level = VP9_RES_NONE;
> +	return ret;
> +}
> +
> +static void vdec_vp9_slice_free_working_buffer(struct vdec_vp9_slice_instance *instance)
> +{
> +	struct mtk_vcodec_ctx *ctx = instance->ctx;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(instance->mv); i++) {
> +		if (instance->mv[i].va)
> +			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
> +	}
> +	for (i = 0; i < ARRAY_SIZE(instance->seg); i++) {
> +		if (instance->seg[i].va)
> +			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
> +	}
> +	if (instance->tile.va)
> +		mtk_vcodec_mem_free(ctx, &instance->tile);
> +	if (instance->prob.va)
> +		mtk_vcodec_mem_free(ctx, &instance->prob);
> +	if (instance->counts.va)
> +		mtk_vcodec_mem_free(ctx, &instance->counts);
> +
> +	instance->level = VP9_RES_NONE;
> +}
> +
> +static void vdec_vp9_slice_vsi_from_remote(struct vdec_vp9_slice_vsi *vsi,
> +					   struct vdec_vp9_slice_vsi *remote_vsi,
> +					   int skip)
> +{
> +	struct vdec_vp9_slice_frame *rf;
> +	struct vdec_vp9_slice_frame *f;
> +
> +	/*
> +	 * compressed header
> +	 * dequant
> +	 * buffer position
> +	 * decode state
> +	 */
> +	if (!skip) {
> +		rf = &remote_vsi->frame;
> +		f = &vsi->frame;
> +		memcpy_fromio(&f->ch, &rf->ch, sizeof(f->ch));
> +		memcpy_fromio(&f->uh.dequant, &rf->uh.dequant, sizeof(f->uh.dequant));
> +		memcpy_fromio(&vsi->trans, &remote_vsi->trans, sizeof(vsi->trans));
> +	}
> +
> +	memcpy_fromio(&vsi->state, &remote_vsi->state, sizeof(vsi->state));
> +}
> +
> +static void vdec_vp9_slice_vsi_to_remote(struct vdec_vp9_slice_vsi *vsi,
> +					 struct vdec_vp9_slice_vsi *remote_vsi)
> +{
> +	memcpy_toio(remote_vsi, vsi, sizeof(*vsi));
> +}
> +
> +static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
> +{
> +	int sbs = (mi_num + 7) >> 3;
> +	int offset = ((idx * sbs) >> tile_log2) << 3;
> +
> +	return offset < mi_num ? offset : mi_num;
> +}
> +
> +static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
> +						 struct vdec_lat_buf *lat_buf)
> +{
> +	struct vb2_v4l2_buffer *src;
> +	struct vb2_v4l2_buffer *dst;
> +
> +	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> +	if (!src)
> +		return -EINVAL;
> +
> +	dst = &lat_buf->ts_info;
> +	v4l2_m2m_buf_copy_metadata(src, dst, true);
> +	return 0;
> +}
> +
> +static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *instance,
> +				     struct vdec_vp9_slice_uncompressed_header *uh,
> +				     struct v4l2_ctrl_vp9_frame *hdr)
> +{
> +	int i;
> +
> +	uh->profile = hdr->profile;
> +	uh->last_frame_type = instance->frame_type;
> +	uh->frame_type = !HDR_FLAG(KEY_FRAME);
> +	uh->last_show_frame = instance->show_frame;
> +	uh->show_frame = HDR_FLAG(SHOW_FRAME);
> +	uh->error_resilient_mode = HDR_FLAG(ERROR_RESILIENT);
> +	uh->bit_depth = hdr->bit_depth;
> +	uh->last_frame_width = instance->width;
> +	uh->last_frame_height = instance->height;
> +	uh->frame_width = hdr->frame_width_minus_1 + 1;
> +	uh->frame_height = hdr->frame_height_minus_1 + 1;
> +	uh->intra_only = HDR_FLAG(INTRA_ONLY);
> +	/* map v4l2 enum to values defined in VP9 spec for firmware */
> +	switch (hdr->reset_frame_context) {
> +	case V4L2_VP9_RESET_FRAME_CTX_NONE:
> +		uh->reset_frame_context = VP9_RESET_FRAME_CONTEXT_NONE0;
> +		break;
> +	case V4L2_VP9_RESET_FRAME_CTX_SPEC:
> +		uh->reset_frame_context = VP9_RESET_FRAME_CONTEXT_SPEC;
> +		break;
> +	case V4L2_VP9_RESET_FRAME_CTX_ALL:
> +		uh->reset_frame_context = VP9_RESET_FRAME_CONTEXT_ALL;
> +		break;
> +	default:
> +		uh->reset_frame_context = VP9_RESET_FRAME_CONTEXT_NONE0;
> +		break;
> +	}
> +	/*
> +	 * ref_frame_sign_bias specifies the intended direction
> +	 * of the motion vector in time for each reference frame.
> +	 * - INTRA_FRAME = 0,
> +	 * - LAST_FRAME = 1,
> +	 * - GOLDEN_FRAME = 2,
> +	 * - ALTREF_FRAME = 3,
> +	 * ref_frame_sign_bias[INTRA_FRAME] is always 0
> +	 * and VDA only passes another 3 directions
> +	 */
> +	uh->ref_frame_sign_bias[0] = 0;
> +	for (i = 0; i < 3; i++)
> +		uh->ref_frame_sign_bias[i + 1] =
> +			!!(hdr->ref_frame_sign_bias & (1 << i));
> +	uh->allow_high_precision_mv = HDR_FLAG(ALLOW_HIGH_PREC_MV);
> +	uh->interpolation_filter = hdr->interpolation_filter;
> +	uh->refresh_frame_context = HDR_FLAG(REFRESH_FRAME_CTX);
> +	uh->frame_parallel_decoding_mode = HDR_FLAG(PARALLEL_DEC_MODE);
> +	uh->frame_context_idx = hdr->frame_context_idx;
> +
> +	/* tile info */
> +	uh->tile_cols_log2 = hdr->tile_cols_log2;
> +	uh->tile_rows_log2 = hdr->tile_rows_log2;
> +
> +	uh->uncompressed_header_size = hdr->uncompressed_header_size;
> +	uh->header_size_in_bytes = hdr->compressed_header_size;
> +}
> +
> +static void vdec_vp9_slice_setup_frame_ctx(struct vdec_vp9_slice_instance *instance,
> +					   struct vdec_vp9_slice_uncompressed_header *uh,
> +					   struct v4l2_ctrl_vp9_frame *hdr)
> +{
> +	int error_resilient_mode;
> +	int reset_frame_context;
> +	int key_frame;
> +	int intra_only;
> +	int i;
> +
> +	key_frame = HDR_FLAG(KEY_FRAME);
> +	intra_only = HDR_FLAG(INTRA_ONLY);
> +	error_resilient_mode = HDR_FLAG(ERROR_RESILIENT);
> +	reset_frame_context = uh->reset_frame_context;
> +
> +	/*
> +	 * according to "6.2 Uncompressed header syntax" in
> +	 * "VP9 Bitstream & Decoding Process Specification",
> +	 * reset @frame_context_idx when (FrameIsIntra || error_resilient_mode)
> +	 */
> +	if (key_frame || intra_only || error_resilient_mode) {
> +		/*
> +		 * @reset_frame_context specifies
> +		 * whether the frame context should be
> +		 * reset to default values:
> +		 * 0 or 1 means do not reset any frame context
> +		 * 2 resets just the context specified in the frame header
> +		 * 3 resets all contexts
> +		 */
> +		if (key_frame || error_resilient_mode ||
> +		    reset_frame_context == 3) {
> +			/* use default table */
> +			for (i = 0; i < 4; i++)
> +				instance->dirty[i] = 0;
> +		} else if (reset_frame_context == 2) {
> +			instance->dirty[uh->frame_context_idx] = 0;
> +		}
> +		uh->frame_context_idx = 0;
> +	}
> +}
> +
> +static void vdec_vp9_slice_setup_loop_filter(struct vdec_vp9_slice_uncompressed_header *uh,
> +					     struct v4l2_vp9_loop_filter *lf)
> +{
> +	int i;
> +
> +	uh->loop_filter_level = lf->level;
> +	uh->loop_filter_sharpness = lf->sharpness;
> +	uh->loop_filter_delta_enabled = LF_FLAG(DELTA_ENABLED);
> +	for (i = 0; i < 4; i++)
> +		uh->loop_filter_ref_deltas[i] = lf->ref_deltas[i];
> +	for (i = 0; i < 2; i++)
> +		uh->loop_filter_mode_deltas[i] = lf->mode_deltas[i];
> +}
> +
> +static void vdec_vp9_slice_setup_quantization(struct vdec_vp9_slice_uncompressed_header *uh,
> +					      struct v4l2_vp9_quantization *quant)
> +{
> +	uh->base_q_idx = quant->base_q_idx;
> +	uh->delta_q_y_dc = quant->delta_q_y_dc;
> +	uh->delta_q_uv_dc = quant->delta_q_uv_dc;
> +	uh->delta_q_uv_ac = quant->delta_q_uv_ac;
> +}
> +
> +static void vdec_vp9_slice_setup_segmentation(struct vdec_vp9_slice_uncompressed_header *uh,
> +					      struct v4l2_vp9_segmentation *seg)
> +{
> +	int i;
> +	int j;
> +
> +	uh->segmentation_enabled = SEG_FLAG(ENABLED);
> +	uh->segmentation_update_map = SEG_FLAG(UPDATE_MAP);
> +	for (i = 0; i < 7; i++)
> +		uh->segmentation_tree_probs[i] = seg->tree_probs[i];
> +	uh->segmentation_temporal_udpate = SEG_FLAG(TEMPORAL_UPDATE);
> +	for (i = 0; i < 3; i++)
> +		uh->segmentation_pred_prob[i] = seg->pred_probs[i];
> +	uh->segmentation_update_data = SEG_FLAG(UPDATE_DATA);
> +	uh->segmentation_abs_or_delta_update = SEG_FLAG(ABS_OR_DELTA_UPDATE);
> +	for (i = 0; i < 8; i++) {
> +		uh->feature_enabled[i] = seg->feature_enabled[i];
> +		for (j = 0; j < 4; j++)
> +			uh->feature_value[i][j] = seg->feature_data[i][j];
> +	}
> +}
> +
> +static int vdec_vp9_slice_setup_tile(struct vdec_vp9_slice_vsi *vsi,
> +				     struct v4l2_ctrl_vp9_frame *hdr)
> +{
> +	unsigned int rows_log2;
> +	unsigned int cols_log2;
> +	unsigned int rows;
> +	unsigned int cols;
> +	unsigned int mi_rows;
> +	unsigned int mi_cols;
> +	struct vdec_vp9_slice_tiles *tiles;
> +	int offset;
> +	int start;
> +	int end;
> +	int i;
> +
> +	rows_log2 = hdr->tile_rows_log2;
> +	cols_log2 = hdr->tile_cols_log2;
> +	rows = 1 << rows_log2;
> +	cols = 1 << cols_log2;
> +	tiles = &vsi->frame.tiles;
> +	tiles->actual_rows = 0;
> +
> +	if (rows > 4 || cols > 64)
> +		return -EINVAL;
> +
> +	/* setup mi rows/cols information */
> +	mi_rows = (hdr->frame_height_minus_1 + 1 + 7) >> 3;
> +	mi_cols = (hdr->frame_width_minus_1 + 1 + 7) >> 3;
> +
> +	for (i = 0; i < rows; i++) {
> +		start = vdec_vp9_slice_tile_offset(i, mi_rows, rows_log2);
> +		end = vdec_vp9_slice_tile_offset(i + 1, mi_rows, rows_log2);
> +		offset = end - start;
> +		tiles->mi_rows[i] = (offset + 7) >> 3;
> +		if (tiles->mi_rows[i])
> +			tiles->actual_rows++;
> +	}
> +
> +	for (i = 0; i < cols; i++) {
> +		start = vdec_vp9_slice_tile_offset(i, mi_cols, cols_log2);
> +		end = vdec_vp9_slice_tile_offset(i + 1, mi_cols, cols_log2);
> +		offset = end - start;
> +		tiles->mi_cols[i] = (offset + 7) >> 3;
> +	}
> +
> +	return 0;
> +}
> +
> +static void vdec_vp9_slice_setup_state(struct vdec_vp9_slice_vsi *vsi)
> +{
> +	memset(&vsi->state, 0, sizeof(vsi->state));
> +}
> +
> +static void vdec_vp9_slice_setup_ref_idx(struct vdec_vp9_slice_pfc *pfc,
> +					 struct v4l2_ctrl_vp9_frame *hdr)
> +{
> +	pfc->ref_idx[0] = hdr->last_frame_ts;
> +	pfc->ref_idx[1] = hdr->golden_frame_ts;
> +	pfc->ref_idx[2] = hdr->alt_frame_ts;
> +}
> +
> +static int vdec_vp9_slice_setup_pfc(struct vdec_vp9_slice_instance *instance,
> +				    struct vdec_vp9_slice_pfc *pfc)
> +{
> +	struct v4l2_ctrl_vp9_frame *hdr;
> +	struct vdec_vp9_slice_uncompressed_header *uh;
> +	struct v4l2_ctrl *hdr_ctrl;
> +	struct vdec_vp9_slice_vsi *vsi;
> +	int ret;
> +
> +	/* frame header */
> +	hdr_ctrl = v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_VP9_FRAME);
> +	if (!hdr_ctrl || !hdr_ctrl->p_cur.p)
> +		return -EINVAL;
> +
> +	hdr = hdr_ctrl->p_cur.p;
> +	vsi = &pfc->vsi;
> +	uh = &vsi->frame.uh;
> +
> +	/* setup vsi information */
> +	vdec_vp9_slice_setup_hdr(instance, uh, hdr);
> +	vdec_vp9_slice_setup_frame_ctx(instance, uh, hdr);
> +	vdec_vp9_slice_setup_loop_filter(uh, &hdr->lf);
> +	vdec_vp9_slice_setup_quantization(uh, &hdr->quant);
> +	vdec_vp9_slice_setup_segmentation(uh, &hdr->seg);
> +	ret = vdec_vp9_slice_setup_tile(vsi, hdr);
> +	if (ret)
> +		return ret;
> +	vdec_vp9_slice_setup_state(vsi);
> +
> +	/* core stage needs buffer index to get ref y/c ... */
> +	vdec_vp9_slice_setup_ref_idx(pfc, hdr);
> +
> +	pfc->seq = instance->seq;
> +	instance->seq++;
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instance *instance,
> +					   struct vdec_vp9_slice_vsi *vsi,
> +					   struct mtk_vcodec_mem *bs,
> +					   struct vdec_lat_buf *lat_buf)
> +{
> +	int i;
> +
> +	vsi->bs.buf.dma_addr = bs->dma_addr;
> +	vsi->bs.buf.size = bs->size;
> +	vsi->bs.frame.dma_addr = bs->dma_addr;
> +	vsi->bs.frame.size = bs->size;
> +
> +	for (i = 0; i < 2; i++) {
> +		vsi->mv[i].dma_addr = instance->mv[i].dma_addr;
> +		vsi->mv[i].size = instance->mv[i].size;
> +	}
> +	for (i = 0; i < 2; i++) {
> +		vsi->seg[i].dma_addr = instance->seg[i].dma_addr;
> +		vsi->seg[i].size = instance->seg[i].size;
> +	}
> +	vsi->tile.dma_addr = instance->tile.dma_addr;
> +	vsi->tile.size = instance->tile.size;
> +	vsi->prob.dma_addr = instance->prob.dma_addr;
> +	vsi->prob.size = instance->prob.size;
> +	vsi->counts.dma_addr = instance->counts.dma_addr;
> +	vsi->counts.size = instance->counts.size;
> +
> +	vsi->ube.dma_addr = lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
> +	vsi->ube.size = lat_buf->ctx->msg_queue.wdma_addr.size;
> +	vsi->trans.dma_addr = lat_buf->ctx->msg_queue.wdma_wptr_addr;
> +	/* used to store trans end */
> +	vsi->trans.dma_addr_end = lat_buf->ctx->msg_queue.wdma_rptr_addr;
> +	vsi->err_map.dma_addr = lat_buf->wdma_err_addr.dma_addr;
> +	vsi->err_map.size = lat_buf->wdma_err_addr.size;
> +
> +	vsi->row_info.buf = 0;
> +	vsi->row_info.size = 0;
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *instance,
> +					    struct vdec_vp9_slice_vsi *vsi)
> +{
> +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> +	struct vdec_vp9_slice_uncompressed_header *uh;
> +
> +	uh = &vsi->frame.uh;
> +
> +	mtk_vcodec_debug(instance, "ctx dirty %u idx %d\n",
> +			 instance->dirty[uh->frame_context_idx],
> +			 uh->frame_context_idx);
> +
> +	if (instance->dirty[uh->frame_context_idx])
> +		frame_ctx = &instance->frame_ctx[uh->frame_context_idx];
> +	else
> +		frame_ctx = vdec_vp9_slice_default_frame_ctx;
> +	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
> +
> +	return 0;
> +}
> +
> +static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_instance *instance,
> +					    struct vdec_vp9_slice_vsi *vsi,
> +					    struct mtk_vcodec_mem *buf)
> +{
> +	struct vdec_vp9_slice_uncompressed_header *uh;
> +
> +	/* reset segment buffer */
> +	uh = &vsi->frame.uh;
> +	if (uh->frame_type == 0 ||
> +	    uh->intra_only ||
> +	    uh->error_resilient_mode ||
> +	    uh->frame_width != instance->width ||
> +	    uh->frame_height != instance->height) {
> +		mtk_vcodec_debug(instance, "reset seg\n");
> +		memset(buf->va, 0, buf->size);
> +	}
> +}
> +
> +/*
> + * parse tiles according to `6.4 Decode tiles syntax`
> + * in "vp9-bitstream-specification"
> + *
> + * frame contains uncompress header, compressed header and several tiles.
> + * this function parses tiles' position and size, stores them to tile buffer
> + * for decoding.
> + */
> +static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *instance,
> +					    struct vdec_vp9_slice_vsi *vsi,
> +					    struct mtk_vcodec_mem *bs)
> +{
> +	struct vdec_vp9_slice_uncompressed_header *uh;
> +	unsigned int rows_log2;
> +	unsigned int cols_log2;
> +	unsigned int rows;
> +	unsigned int cols;
> +	unsigned int mi_row;
> +	unsigned int mi_col;
> +	unsigned int offset;
> +	unsigned int pa;
> +	unsigned int size;
> +	struct vdec_vp9_slice_tiles *tiles;
> +	unsigned char *pos;
> +	unsigned char *end;
> +	unsigned char *va;
> +	unsigned int *tb;
> +	int i;
> +	int j;
> +
> +	uh = &vsi->frame.uh;
> +	rows_log2 = uh->tile_rows_log2;
> +	cols_log2 = uh->tile_cols_log2;
> +	rows = 1 << rows_log2;
> +	cols = 1 << cols_log2;
> +
> +	if (rows > 4 || cols > 64) {
> +		mtk_vcodec_err(instance, "tile_rows %u tile_cols %u\n",
> +			       rows, cols);
> +		return -EINVAL;
> +	}
> +
> +	offset = uh->uncompressed_header_size +
> +		uh->header_size_in_bytes;
> +	if (bs->size <= offset) {
> +		mtk_vcodec_err(instance, "bs size %zu tile offset %u\n",
> +			       bs->size, offset);
> +		return -EINVAL;
> +	}
> +
> +	tiles = &vsi->frame.tiles;
> +	/* setup tile buffer */
> +
> +	va = (unsigned char *)bs->va;
> +	pos = va + offset;
> +	end = va + bs->size;
> +	/* truncated */
> +	pa = (unsigned int)bs->dma_addr + offset;
> +	tb = instance->tile.va;
> +	for (i = 0; i < rows; i++) {
> +		for (j = 0; j < cols; j++) {
> +			if (i == rows - 1 &&
> +			    j == cols - 1) {
> +				size = (unsigned int)(end - pos);
> +			} else {
> +				if (end - pos < 4)
> +					return -EINVAL;
> +
> +				size = (pos[0] << 24) | (pos[1] << 16) |
> +					(pos[2] << 8) | pos[3];
> +				pos += 4;
> +				pa += 4;
> +				offset += 4;
> +				if (end - pos < size)
> +					return -EINVAL;
> +			}
> +			tiles->size[i][j] = size;
> +			if (tiles->mi_rows[i]) {
> +				*tb++ = (size << 3) + ((offset << 3) & 0x7f);
> +				*tb++ = pa & ~0xf;
> +				*tb++ = (pa << 3) & 0x7f;
> +				mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
> +				mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
> +				*tb++ = (mi_row << 6) + mi_col;
> +			}
> +			pos += size;
> +			pa += size;
> +			offset += size;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
> +				    struct mtk_vcodec_mem *bs,
> +				    struct vdec_lat_buf *lat_buf,
> +				    struct vdec_vp9_slice_pfc *pfc)
> +{
> +	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
> +	int ret;
> +
> +	ret = vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> +	if (ret)
> +		goto err;
> +
> +	ret = vdec_vp9_slice_setup_pfc(instance, pfc);
> +	if (ret)
> +		goto err;
> +
> +	ret = vdec_vp9_slice_alloc_working_buffer(instance, vsi);
> +	if (ret)
> +		goto err;
> +
> +	ret = vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> +	if (ret)
> +		goto err;
> +
> +	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> +
> +	/* setup prob/tile buffers for LAT */
> +
> +	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> +	if (ret)
> +		goto err;
> +
> +	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	return ret;
> +}
> +
> +/* implement merge prob process defined in 8.4.1 */
> +static unsigned char vdec_vp9_slice_merge_prob(unsigned char pre, unsigned int ct0,
> +					       unsigned int ct1, unsigned int cs,
> +					       unsigned int uf)
> +{
> +	unsigned int den;
> +	unsigned int prob;
> +	unsigned int count;
> +	unsigned int factor;
> +
> +	/*
> +	 * The variable den representing the total times
> +	 * this boolean has been decoded is set equal to ct0 + ct1.
> +	 */
> +	den = ct0 + ct1;
> +	if (!den)
> +		return pre;  /* => count = 0 => factor = 0 */
> +	/*
> +	 * The variable prob estimating the probability that
> +	 * the boolean is decoded as a 0 is set equal to
> +	 * (den == 0) ? 128 : Clip3(1, 255, (ct0 * 256 + (den >> 1)) / den).
> +	 */
> +	prob = ((ct0 << 8) + (den >> 1)) / den;
> +	prob = prob < 1 ? 1 : (prob > 255 ? 255 : prob);
> +	/* The variable count is set equal to Min(ct0 + ct1, countSat) */
> +	count = den < cs ? den : cs;
> +	/*
> +	 * The variable factor is set equal to
> +	 * maxUpdateFactor * count / countSat.
> +	 */
> +	factor = uf * count / cs;
> +	/*
> +	 * The return variable outProb is set equal to
> +	 * Round2(preProb * (256 - factor) + prob * factor, 8).
> +	 */
> +	return pre + (((prob - pre) * factor + 128) >> 8);
> +}
> +
> +static inline unsigned char vdec_vp9_slice_adapt_prob(unsigned char pre, unsigned int ct0,
> +						      unsigned int ct1)
> +{
> +	return vdec_vp9_slice_merge_prob(pre, ct0, ct1, 20, 128);
> +}
> +
> +/* implement merge probs process defined in 8.4.2 */
> +static unsigned int vdec_vp9_slice_merge_probs(const signed char *tree, int location,
> +					       unsigned char *pre_probs, unsigned int *counts,
> +					       unsigned char *probs, unsigned int cs,
> +					       unsigned int uf)
> +{
> +	int left = tree[location];
> +	int right = tree[location + 1];
> +	unsigned int left_count;
> +	unsigned int right_count;
> +
> +	if (left <= 0)
> +		left_count = counts[-left];
> +	else
> +		left_count = vdec_vp9_slice_merge_probs(tree, left, pre_probs, counts,
> +							probs, cs, uf);
> +
> +	if (right <= 0)
> +		right_count = counts[-right];
> +	else
> +		right_count = vdec_vp9_slice_merge_probs(tree, right, pre_probs, counts,
> +							 probs, cs, uf);
> +
> +	/* merge left and right */
> +	probs[location >> 1] =
> +		vdec_vp9_slice_merge_prob(pre_probs[location >> 1],
> +					  left_count, right_count, cs, uf);
> +	return left_count + right_count;
> +}
> +
> +static inline void vdec_vp9_slice_adapt_probs(const signed char *tree,
> +					      unsigned char *pre_probs,
> +					      unsigned int *counts,
> +					      unsigned char *probs)
> +{
> +	vdec_vp9_slice_merge_probs(tree, 0, pre_probs, counts, probs, 20, 128);
> +}
> +
> +/* 8.4 Probability adaptation process */
> +static void vdec_vp9_slice_adapt_table(struct vdec_vp9_slice_vsi *vsi,
> +				       struct vdec_vp9_slice_frame_ctx *ctx,
> +				       struct vdec_vp9_slice_frame_ctx *pre_ctx,
> +				       struct vdec_vp9_slice_frame_counts *counts)
> +{
> +	unsigned char *pp;
> +	unsigned char *p;
> +	unsigned int *c;
> +	unsigned int *e;
> +	unsigned int uf;
> +	int t, i, j, k, l;
> +
> +	uf = 128;
> +	if (!vsi->frame.uh.frame_type || vsi->frame.uh.intra_only ||
> +	    vsi->frame.uh.last_frame_type)
> +		uf = 112;
> +
> +	p = (unsigned char *)&ctx->coef_probs;
> +	pp = (unsigned char *)&pre_ctx->coef_probs;
> +	c = (unsigned int *)&counts->coef_probs;
> +	e = (unsigned int *)&counts->eob_branch;
> +
> +	/* 8.4.3 Coefficient probability adaption process */
> +	for (t = 0; t < 16; t++) {
> +		for (((k) = 0); ((k) < 6); ((k)++)) {
> +			for (l = 0; l < (k == 0 ? 3 : 6); l++) {
> +				p[0] = vdec_vp9_slice_merge_prob(pp[0], c[3], e[0]
> +								 - c[3], 24, uf);
> +				p[1] = vdec_vp9_slice_merge_prob(pp[1],	c[0], c[1]
> +								 + c[2], 24, uf);
> +				p[2] = vdec_vp9_slice_merge_prob(pp[2], c[1],
> +								 c[2], 24, uf);
> +				p += 3;
> +				pp += 3;
> +				c += 4;
> +				e++;
> +			}
> +			if (k == 0) {
> +				/* 3 * 3 unused values and 2 bytes padding */
> +				p += 11;
> +				pp += 11;
> +				e++;
> +			} else {
> +				/* extra 2 bytes could make 4 bytes align (3 * 6 + 2) */
> +				p += 2;
> +				pp += 2;
> +				/* 5 * 6=30, extra 2 int */
> +				if (k == 5)
> +					e += 2;
> +			}
> +		}
> +	}
> +
> +	if (!vsi->frame.uh.frame_type || vsi->frame.uh.intra_only)
> +		return;
> +
> +	/* 8.4.4 Non coefficient probability adaption process */
> +
> +	for (i = 0; i < 4; i++) {
> +		ctx->intra_inter_prob[i] =
> +			vdec_vp9_slice_adapt_prob(pre_ctx->intra_inter_prob[i],
> +						  counts->intra_inter[i][0],
> +						  counts->intra_inter[i][1]);
> +	}
> +
> +	for (i = 0; i < 5; i++) {
> +		ctx->comp_inter_prob[i] =
> +			vdec_vp9_slice_adapt_prob(pre_ctx->comp_inter_prob[i],
> +						  counts->comp_inter[i][0],
> +						  counts->comp_inter[i][1]);
> +	}
> +
> +	for (i = 0; i < 5; i++) {
> +		ctx->comp_ref_prob[i] =
> +			vdec_vp9_slice_adapt_prob(pre_ctx->comp_ref_prob[i],
> +						  counts->comp_ref[i][0],
> +						  counts->comp_ref[i][1]);
> +	}
> +
> +	for (i = 0; i < 5; i++) {
> +		for (j = 0; j < 2; j++) {
> +			ctx->single_ref_prob[i][j] =
> +				vdec_vp9_slice_adapt_prob(pre_ctx->single_ref_prob[i][j],
> +							  counts->single_ref[i][j][0],
> +							  counts->single_ref[i][j][1]);
> +		}
> +	}
> +
> +	for (i = 0; i < 7; i++) {
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_inter_mode_tree,
> +					   &pre_ctx->inter_mode_probs[i][0],
> +					   &counts->inter_mode[i][0],
> +					   &ctx->inter_mode_probs[i][0]);
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_intra_mode_tree,
> +					   &pre_ctx->y_mode_prob[i][0],
> +					   &counts->y_mode[i][0],
> +					   &ctx->y_mode_prob[i][0]);
> +	}
> +
> +	for (i = 0; i < 10; i++) {
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_intra_mode_tree,
> +					   &pre_ctx->uv_mode_prob[i][0],
> +					   &counts->uv_mode[i][0],
> +					   &ctx->uv_mode_prob[i][0]);
> +	}
> +
> +	for (i = 0; i < 16; i++) {
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_partition_tree,
> +					   &pre_ctx->partition_prob[i][0],
> +					   &counts->partition[i][0],
> +					   &ctx->partition_prob[i][0]);
> +	}
> +
> +	if (vsi->frame.uh.interpolation_filter == 4) {
> +		for (i = 0; i < 4; i++) {
> +			vdec_vp9_slice_adapt_probs(vdec_vp9_slice_switchable_interp_tree,
> +						   &pre_ctx->switch_interp_prob[i][0],
> +						   &counts->switchable_interp[i][0],
> +						   &ctx->switch_interp_prob[i][0]);
> +		}
> +	}
> +
> +	if (vsi->frame.ch.tx_mode == 4) {
> +		for (i = 0; i < 2; i++) {
> +			ctx->tx_p8x8[i][0] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p8x8[i][0],
> +								       counts->tx_p8x8[i][0],
> +								       counts->tx_p8x8[i][1]);
> +			ctx->tx_p16x16[i][0] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p16x16[i][0],
> +									 counts->tx_p16x16[i][0],
> +									 counts->tx_p16x16[i][1] +
> +									 counts->tx_p16x16[i][2]);
> +			ctx->tx_p16x16[i][1] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p16x16[i][1],
> +									 counts->tx_p16x16[i][1],
> +									 counts->tx_p16x16[i][2]);
> +			ctx->tx_p32x32[i][0] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p32x32[i][0],
> +									 counts->tx_p32x32[i][0],
> +									 counts->tx_p32x32[i][1] +
> +									 counts->tx_p32x32[i][2] +
> +									 counts->tx_p32x32[i][3]);
> +			ctx->tx_p32x32[i][1] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p32x32[i][1],
> +									 counts->tx_p32x32[i][1],
> +									 counts->tx_p32x32[i][2] +
> +									 counts->tx_p32x32[i][3]);
> +			ctx->tx_p32x32[i][2] = vdec_vp9_slice_adapt_prob(pre_ctx->tx_p32x32[i][2],
> +									 counts->tx_p32x32[i][2],
> +									 counts->tx_p32x32[i][3]);
> +		}
> +	}
> +
> +	for (i = 0; i < 3; i++) {
> +		ctx->skip_probs[i] = vdec_vp9_slice_adapt_prob(pre_ctx->skip_probs[i],
> +							       counts->skip[i][0],
> +							       counts->skip[i][1]);
> +	}
> +
> +	vdec_vp9_slice_adapt_probs(vdec_vp9_slice_mv_joint_tree,
> +				   &pre_ctx->joint[0],
> +				   &counts->joint[0],
> +				   &ctx->joint[0]);
> +
> +	for (i = 0; i < 2; i++) {
> +		ctx->sign_classes[i].sign = vdec_vp9_slice_adapt_prob(pre_ctx->sign_classes[i].sign,
> +								      counts->mvcomp[i].sign[0],
> +								      counts->mvcomp[i].sign[1]);
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_mv_class_tree,
> +					   &pre_ctx->sign_classes[i].classes[0],
> +					   &counts->mvcomp[i].classes[0],
> +					   &ctx->sign_classes[i].classes[0]);
> +
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_mv_class0_tree,
> +					   pre_ctx->class0_bits[i].class0,
> +					   counts->mvcomp[i].class0,
> +					   ctx->class0_bits[i].class0);
> +		for (j = 0; j < 10; j++) {
> +			ctx->class0_bits[i].bits[j] =
> +				vdec_vp9_slice_adapt_prob(pre_ctx->class0_bits[i].bits[j],
> +							  counts->mvcomp[i].bits[j][0],
> +							  counts->mvcomp[i].bits[j][1]);
> +		}
> +
> +		for (j = 0; j < 2; ++j) {
> +			vdec_vp9_slice_adapt_probs(vdec_vp9_slice_mv_fp_tree,
> +						   pre_ctx->class0_fp_hp[i].class0_fp[j],
> +						   counts->mvcomp[i].class0_fp[j],
> +						   ctx->class0_fp_hp[i].class0_fp[j]);
> +		}
> +		vdec_vp9_slice_adapt_probs(vdec_vp9_slice_mv_fp_tree,
> +					   pre_ctx->class0_fp_hp[i].fp,
> +					   counts->mvcomp[i].fp,
> +					   ctx->class0_fp_hp[i].fp);
> +		if (vsi->frame.uh.allow_high_precision_mv) {
> +			ctx->class0_fp_hp[i].class0_hp =
> +				vdec_vp9_slice_adapt_prob(pre_ctx->class0_fp_hp[i].class0_hp,
> +							  counts->mvcomp[i].class0_hp[0],
> +							  counts->mvcomp[i].class0_hp[1]);
> +			ctx->class0_fp_hp[i].hp =
> +				vdec_vp9_slice_adapt_prob(pre_ctx->class0_fp_hp[i].hp,
> +							  counts->mvcomp[i].hp[0],
> +							  counts->mvcomp[i].hp[1]);
> +		}
> +	}
> +}
> +
> +static int vdec_vp9_slice_update_prob(struct vdec_vp9_slice_instance *instance,
> +				      struct vdec_vp9_slice_vsi *vsi)
> +{
> +	struct vdec_vp9_slice_frame_ctx *pre_frame_ctx;
> +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> +	struct vdec_vp9_slice_frame_counts *counts;
> +	struct vdec_vp9_slice_uncompressed_header *uh;
> +
> +	uh = &vsi->frame.uh;
> +	pre_frame_ctx = &instance->frame_ctx[uh->frame_context_idx];
> +	frame_ctx = (struct vdec_vp9_slice_frame_ctx *)instance->prob.va;
> +	counts = (struct vdec_vp9_slice_frame_counts *)instance->counts.va;
> +
> +	if (!uh->refresh_frame_context)
> +		return 0;
> +
> +	if (!uh->frame_parallel_decoding_mode) {
> +		/* uh->error_resilient_mode must be 0 */
> +		vdec_vp9_slice_adapt_table(vsi,	frame_ctx,
> +					   /* use default frame ctx? */
> +					   instance->dirty[uh->frame_context_idx] ?
> +					   pre_frame_ctx :
> +					   vdec_vp9_slice_default_frame_ctx,
> +					   counts);
> +	}
> +
> +	memcpy(pre_frame_ctx, frame_ctx, sizeof(*frame_ctx));
> +	instance->dirty[uh->frame_context_idx] = 1;
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
> +				     struct vdec_lat_buf *lat_buf,
> +				     struct vdec_vp9_slice_pfc *pfc)
> +{
> +	struct vdec_vp9_slice_vsi *vsi;
> +
> +	vsi = &pfc->vsi;
> +	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
> +
> +	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x\n",
> +			 pfc->seq, vsi->state.crc[0]);
> +
> +	/* buffer full, need to re-decode */
> +	if (vsi->state.full) {
> +		/* buffer not enough */
> +		if (vsi->trans.dma_addr_end - vsi->trans.dma_addr ==
> +			vsi->ube.size)
> +			return -ENOMEM;
> +		return -EAGAIN;
> +	}
> +
> +	vdec_vp9_slice_update_prob(instance, vsi);
> +
> +	instance->width = vsi->frame.uh.frame_width;
> +	instance->height = vsi->frame.uh.frame_height;
> +	instance->frame_type = vsi->frame.uh.frame_type;
> +	instance->show_frame = vsi->frame.uh.show_frame;
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_core_to_dst_buf(struct vdec_vp9_slice_instance *instance,
> +						struct vdec_lat_buf *lat_buf)
> +{
> +	struct vb2_v4l2_buffer *src;
> +	struct vb2_v4l2_buffer *dst;
> +
> +	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> +	if (!dst)
> +		return -EINVAL;
> +
> +	src = &lat_buf->ts_info;
> +	dst->vb2_buf.timestamp = src->vb2_buf.timestamp;
> +	dst->timecode = src->timecode;
> +	dst->field = src->field;
> +	dst->flags = src->flags;
> +	dst->vb2_buf.copied_timestamp = src->vb2_buf.copied_timestamp;
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *instance,
> +					    struct vdec_vp9_slice_pfc *pfc,
> +					    struct vdec_vp9_slice_vsi *vsi,
> +					    struct vdec_fb *fb,
> +					    struct vdec_lat_buf *lat_buf)
> +{
> +	struct vb2_buffer *vb;
> +	struct vb2_queue *vq;
> +	struct vdec_vp9_slice_reference *ref;
> +	int plane;
> +	int size;
> +	int idx;
> +	int w;
> +	int h;
> +	int i;
> +
> +	plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
> +	w = vsi->frame.uh.frame_width;
> +	h = vsi->frame.uh.frame_height;
> +	size = ALIGN(w, 64) * ALIGN(h, 64);
> +
> +	/* frame buffer */
> +	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
> +	if (plane == 1)
> +		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
> +	else
> +		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
> +
> +	/* reference buffers */
> +	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx,
> +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (!vq)
> +		return -EINVAL;
> +
> +	/* get current output buffer */
> +	vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
> +	if (!vb)
> +		return -EINVAL;
> +
> +	/* update internal buffer's width/height */
> +	for (i = 0; i < vq->num_buffers; i++) {
> +		if (vb == vq->bufs[i]) {
> +			instance->dpb[i].width = w;
> +			instance->dpb[i].height = h;
> +			break;
> +		}
> +	}
> +
> +	/*
> +	 * get buffer's width/height from instance
> +	 * get buffer address from vb2buf
> +	 */
> +	for (i = 0; i < 3; i++) {
> +		ref = &vsi->frame.ref[i];
> +		idx = vb2_find_timestamp(vq, pfc->ref_idx[i], 0);
> +		if (idx < 0) {
> +			ref->frame_width = w;
> +			ref->frame_height = h;
> +			memset(&vsi->ref[i], 0, sizeof(vsi->ref[i]));
> +		} else {
> +			ref->frame_width = instance->dpb[idx].width;
> +			ref->frame_height = instance->dpb[idx].height;
> +			vb = vq->bufs[idx];
> +			vsi->ref[i].y.dma_addr =
> +				vb2_dma_contig_plane_dma_addr(vb, 0);
> +			if (plane == 1)
> +				vsi->ref[i].c.dma_addr =
> +					vsi->ref[i].y.dma_addr + size;
> +			else
> +				vsi->ref[i].c.dma_addr =
> +					vb2_dma_contig_plane_dma_addr(vb, 1);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
> +				     struct vdec_fb *fb,
> +				     struct vdec_lat_buf *lat_buf,
> +				     struct vdec_vp9_slice_pfc *pfc)
> +{
> +	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
> +	int ret;
> +
> +	vdec_vp9_slice_setup_state(vsi);
> +
> +	ret = vdec_vp9_slice_setup_core_to_dst_buf(instance, lat_buf);
> +	if (ret)
> +		goto err;
> +
> +	ret = vdec_vp9_slice_setup_core_buffer(instance, pfc, vsi, fb, lat_buf);
> +	if (ret)
> +		goto err;
> +
> +	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[1]);
> +
> +	return 0;
> +
> +err:
> +	return ret;
> +}
> +
> +static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
> +				      struct vdec_lat_buf *lat_buf,
> +				      struct vdec_vp9_slice_pfc *pfc)
> +{
> +	struct vdec_vp9_slice_vsi *vsi;
> +
> +	vsi = &pfc->vsi;
> +	memcpy(&pfc->state[1], &vsi->state, sizeof(vsi->state));
> +
> +	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
> +			 pfc->seq,
> +			 vsi->state.crc[0], vsi->state.crc[1],
> +			 vsi->state.crc[2], vsi->state.crc[3]);
> +	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
> +			 pfc->seq,
> +			 vsi->state.crc[4], vsi->state.crc[5],
> +			 vsi->state.crc[6], vsi->state.crc[7]);
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_init(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct vdec_vp9_slice_instance *instance;
> +	struct vdec_vp9_slice_init_vsi *vsi;
> +	int ret;
> +
> +	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
> +	if (!instance)
> +		return -ENOMEM;
> +
> +	instance->ctx = ctx;
> +	instance->vpu.id = SCP_IPI_VDEC_LAT;
> +	instance->vpu.core_id = SCP_IPI_VDEC_CORE;
> +	instance->vpu.ctx = ctx;
> +	instance->vpu.codec_type = ctx->current_codec;
> +
> +	ret = vpu_dec_init(&instance->vpu);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "failed to init vpu dec, ret %d\n", ret);
> +		goto error_vpu_init;
> +	}
> +
> +	/* init vsi and global flags */
> +
> +	vsi = instance->vpu.vsi;
> +	if (!vsi) {
> +		mtk_vcodec_err(instance, "failed to get VP9 vsi\n");
> +		ret = -EINVAL;
> +		goto error_vsi;
> +	}
> +	instance->init_vsi = vsi;
> +	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> +						       (u32)vsi->core_vsi);
> +	if (!instance->core_vsi) {
> +		mtk_vcodec_err(instance, "failed to get VP9 core vsi\n");
> +		ret = -EINVAL;
> +		goto error_vsi;
> +	}
> +
> +	instance->irq = 1;
> +
> +	ret = vdec_vp9_slice_init_default_frame_ctx(instance);
> +	if (ret)
> +		goto error_default_frame_ctx;
> +
> +	ctx->drv_handle = instance;
> +
> +	return 0;
> +
> +error_default_frame_ctx:
> +error_vsi:
> +	vpu_dec_deinit(&instance->vpu);
> +error_vpu_init:
> +	kfree(instance);
> +	return ret;
> +}
> +
> +static void vdec_vp9_slice_deinit(void *h_vdec)
> +{
> +	struct vdec_vp9_slice_instance *instance = h_vdec;
> +
> +	if (!instance)
> +		return;
> +
> +	vpu_dec_deinit(&instance->vpu);
> +	vdec_vp9_slice_free_working_buffer(instance);
> +	vdec_msg_queue_deinit(&instance->ctx->msg_queue, instance->ctx);
> +	kfree(instance);
> +}
> +
> +static int vdec_vp9_slice_flush(void *h_vdec, struct mtk_vcodec_mem *bs,
> +				struct vdec_fb *fb, bool *res_chg)
> +{
> +	struct vdec_vp9_slice_instance *instance = h_vdec;
> +
> +	mtk_vcodec_debug(instance, "flush ...\n");
> +
> +	vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
> +	return vpu_dec_reset(&instance->vpu);
> +}
> +
> +static void vdec_vp9_slice_get_pic_info(struct vdec_vp9_slice_instance *instance)
> +{
> +	struct mtk_vcodec_ctx *ctx = instance->ctx;
> +	unsigned int data[3];
> +
> +	mtk_vcodec_debug(instance, "w %u h %u\n",
> +			 ctx->picinfo.pic_w, ctx->picinfo.pic_h);
> +
> +	data[0] = ctx->picinfo.pic_w;
> +	data[1] = ctx->picinfo.pic_h;
> +	data[2] = ctx->capture_fourcc;
> +	vpu_dec_get_param(&instance->vpu, data, 3, GET_PARAM_PIC_INFO);
> +
> +	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, 64);
> +	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, 64);
> +	ctx->picinfo.fb_sz[0] = instance->vpu.fb_sz[0];
> +	ctx->picinfo.fb_sz[1] = instance->vpu.fb_sz[1];
> +}
> +
> +static void vdec_vp9_slice_get_dpb_size(struct vdec_vp9_slice_instance *instance,
> +					unsigned int *dpb_sz)
> +{
> +	/* refer VP9 specification */
> +	*dpb_sz = 9;
> +}
> +
> +static void vdec_vp9_slice_get_crop_info(struct vdec_vp9_slice_instance *instance,
> +					 struct v4l2_rect *cr)
> +{
> +	struct mtk_vcodec_ctx *ctx = instance->ctx;
> +
> +	cr->left = 0;
> +	cr->top = 0;
> +	cr->width = ctx->picinfo.pic_w;
> +	cr->height = ctx->picinfo.pic_h;
> +
> +	mtk_vcodec_debug(instance, "l=%d, t=%d, w=%d, h=%d\n",
> +			 cr->left, cr->top, cr->width, cr->height);
> +}
> +
> +static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_type type, void *out)
> +{
> +	struct vdec_vp9_slice_instance *instance = h_vdec;
> +
> +	switch (type) {
> +	case GET_PARAM_PIC_INFO:
> +		vdec_vp9_slice_get_pic_info(instance);
> +		break;
> +	case GET_PARAM_DPB_SIZE:
> +		vdec_vp9_slice_get_dpb_size(instance, out);
> +		break;
> +	case GET_PARAM_CROP_INFO:
> +		vdec_vp9_slice_get_crop_info(instance, out);
> +		break;
> +	default:
> +		mtk_vcodec_err(instance, "invalid get parameter type=%d\n",
> +			       type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> +				     struct vdec_fb *fb, bool *res_chg)
> +{
> +	struct vdec_vp9_slice_instance *instance = h_vdec;
> +	struct vdec_lat_buf *lat_buf;
> +	struct vdec_vp9_slice_pfc *pfc;
> +	struct vdec_vp9_slice_vsi *vsi;
> +	struct mtk_vcodec_ctx *ctx;
> +	int ret;
> +
> +	if (!instance || !instance->ctx)
> +		return -EINVAL;
> +	ctx = instance->ctx;
> +
> +	/* init msgQ for the first time */
> +	if (vdec_msg_queue_init(&ctx->msg_queue, ctx,
> +				vdec_vp9_slice_core_decode,
> +				sizeof(*pfc)))
> +		return -ENOMEM;
> +
> +	/* bs NULL means flush decoder */
> +	if (!bs)
> +		return vdec_vp9_slice_flush(h_vdec, bs, fb, res_chg);
> +
> +	lat_buf = vdec_msg_queue_dqbuf(&instance->ctx->msg_queue.lat_ctx);
> +	if (!lat_buf) {
> +		mtk_vcodec_err(instance, "Failed to get VP9 lat buf\n");
> +		return -EBUSY;
> +	}
> +	pfc = (struct vdec_vp9_slice_pfc *)lat_buf->private_data;
> +	if (!pfc)
> +		return -EINVAL;
> +	vsi = &pfc->vsi;
> +
> +	ret = vdec_vp9_slice_setup_lat(instance, bs, lat_buf, pfc);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "Failed to setup VP9 lat ret %d\n", ret);
> +		return ret;
> +	}
> +	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
> +
> +	ret = vpu_dec_start(&instance->vpu, 0, 0);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (instance->irq) {
> +		ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
> +						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
> +		/* update remote vsi if decode timeout */
> +		if (ret) {
> +			mtk_vcodec_err(instance, "VP9 decode timeout %d\n", ret);
> +			writel(1, &instance->vsi->state.timeout);
> +		}
> +		vpu_dec_end(&instance->vpu);
> +	}
> +
> +	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> +	ret = vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
> +
> +	/* LAT trans full, no more UBE or decode timeout */
> +	if (ret) {
> +		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mtk_vcodec_debug(instance, "lat dma 1 0x%llx 0x%llx\n",
> +			 pfc->vsi.trans.dma_addr, pfc->vsi.trans.dma_addr_end);
> +
> +	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
> +				       vsi->trans.dma_addr_end +
> +				       ctx->msg_queue.wdma_addr.dma_addr);
> +	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> +
> +	return 0;
> +}
> +
> +static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
> +{
> +	struct vdec_vp9_slice_instance *instance;
> +	struct vdec_vp9_slice_pfc *pfc;
> +	struct mtk_vcodec_ctx *ctx = NULL;
> +	struct vdec_fb *fb = NULL;
> +	int ret = -EINVAL;
> +
> +	if (!lat_buf)
> +		goto err;
> +
> +	pfc = lat_buf->private_data;
> +	ctx = lat_buf->ctx;
> +	if (!pfc || !ctx)
> +		goto err;
> +
> +	instance = ctx->drv_handle;
> +	if (!instance)
> +		goto err;
> +
> +	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> +	if (!fb) {
> +		ret = -EBUSY;
> +		goto err;
> +	}
> +
> +	ret = vdec_vp9_slice_setup_core(instance, fb, lat_buf, pfc);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "vdec_vp9_slice_setup_core\n");
> +		goto err;
> +	}
> +	vdec_vp9_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
> +
> +	ret = vpu_dec_core(&instance->vpu);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "vpu_dec_core\n");
> +		goto err;
> +	}
> +
> +	if (instance->irq) {
> +		ret = mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> +						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
> +		/* update remote vsi if decode timeout */
> +		if (ret) {
> +			mtk_vcodec_err(instance, "VP9 core timeout\n");
> +			writel(1, &instance->core_vsi->state.timeout);
> +		}
> +		vpu_dec_core_end(&instance->vpu);
> +	}
> +
> +	vdec_vp9_slice_vsi_from_remote(&pfc->vsi, instance->core_vsi, 1);
> +	ret = vdec_vp9_slice_update_core(instance, lat_buf, pfc);
> +	if (ret) {
> +		mtk_vcodec_err(instance, "vdec_vp9_slice_update_core\n");
> +		goto err;
> +	}
> +
> +	pfc->vsi.trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
> +	mtk_vcodec_debug(instance, "core dma_addr_end 0x%llx\n", pfc->vsi.trans.dma_addr_end);
> +	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> +	ctx->dev->vdec_pdata->cap_to_disp(ctx, fb, 0);
> +
> +	return 0;
> +
> +err:
> +	if (ctx) {
> +		/* always update read pointer */
> +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> +
> +		if (fb)
> +			ctx->dev->vdec_pdata->cap_to_disp(ctx, fb, 1);
> +	}
> +	return ret;
> +}
> +
> +const struct vdec_common_if vdec_vp9_slice_lat_if = {
> +	.init		= vdec_vp9_slice_init,
> +	.decode		= vdec_vp9_slice_lat_decode,
> +	.get_param	= vdec_vp9_slice_get_param,
> +	.deinit		= vdec_vp9_slice_deinit,
> +};
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> index 9db9a57da2c1..2d3a45781359 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> @@ -44,6 +44,10 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  		ctx->dec_if = &vdec_vp9_if;
>  		ctx->hw_id = MTK_VDEC_CORE;
>  		break;
> +	case V4L2_PIX_FMT_VP9_FRAME:
> +		ctx->dec_if = &vdec_vp9_slice_lat_if;
> +		ctx->hw_id = MTK_VDEC_LAT0;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
> index e3adf8f36342..e383a04db7b8 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
> @@ -60,6 +60,7 @@ extern const struct vdec_common_if vdec_h264_slice_lat_if;
>  extern const struct vdec_common_if vdec_vp8_if;
>  extern const struct vdec_common_if vdec_vp8_slice_if;
>  extern const struct vdec_common_if vdec_vp9_if;
> +extern const struct vdec_common_if vdec_vp9_slice_lat_if;
>  
>  /**
>   * vdec_if_init() - initialize decode driver

