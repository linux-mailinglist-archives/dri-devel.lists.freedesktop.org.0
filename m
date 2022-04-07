Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE94F86BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D43010EC14;
	Thu,  7 Apr 2022 17:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983510EC14
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 17:58:47 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b19so2830679qkk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=TZCjOtY9g4m9iEGwCFLxFzTUFw15yxM8KmtiXIbra0I=;
 b=ewUxT7CIF0J3ekhFzAkMsSRNXurErm8uoORR1+5u2xHO1QywkxR4B4oNAvMWG0ArYA
 PptUs9Cgk8MVqk5XaiAnTlFNrMCm5Khh7Tu+iYDtpJD1pXK6ENtBPyCovcpYrlWya0Tr
 4CmkPsMKz4dxMAv7rYYGNHNxn30dFhOlTS9SkneCSp5iLbN20qDacfVds3VJCui2ePWf
 4caiMK4h2V1lrXsRZj/HYDchACH0fGe3/ZyGqEldXFnvQvG8l7FlilIMglc5w+bZjAyr
 45d6OJJht0MUgh02bIgYi2VjxhyK7dxvLhFnH96vrmTnz8sqe5OZ7IP0rkZCxDUZUUo0
 9W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=TZCjOtY9g4m9iEGwCFLxFzTUFw15yxM8KmtiXIbra0I=;
 b=1jCwCNRW8ysYch5xHHhzK6fbL5l4ZJjbZ2g8BDa7EEBdZioY8UyUxNK3MxOF4FQcvd
 mZtE6ybj/7Nx9tlndeqGKlsnxMstU33duHi4WqOIT1yGhqxlxa12cVSEJ3olYiIArVTn
 pSQyZH9gmSsTzepPSrtGM3eUiJDmgp7aaT/IzORh8pBbfxzQQ2j/ZhAkjOaEUb4i/obS
 3JqI4BUkDgoD4yujHbIaNsLymexlUr6uGvsBHtmcL5MpgjSKGeMcHXGfkzDgMSYwCw13
 pfLaNGQ8fI2to0FOMrr7xCMLHALjgj3COOWk6bXSQemnq2jdqvuYAhEK6FqZjKoatg69
 SVxw==
X-Gm-Message-State: AOAM533DBTt5tPqOPpKcvKw2AuEFs9NhqIzZZfPrSyAFlDvBh7H95T/G
 +PQ34wY+oIvDpAcvkr3V35dsTw==
X-Google-Smtp-Source: ABdhPJxB6bH5RGG47yUMxhFpl1nvuw2s94lSiAXSmQnpwWIbYicp9A+RKwEKPe33+MYHlCC4Y1NtrA==
X-Received: by 2002:a05:620a:2487:b0:67b:3113:f83f with SMTP id
 i7-20020a05620a248700b0067b3113f83fmr10356030qkn.604.1649354325428; 
 Thu, 07 Apr 2022 10:58:45 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05622a00cc00b002ebdd6ef303sm593153qtw.43.2022.04.07.10.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:58:45 -0700 (PDT)
Message-ID: <c5f1572a3fa9406d96534986a1b051bda0cbae3d.camel@ndufresne.ca>
Subject: Re: [PATCH v8, 16/17] media: mediatek: vcodec: support stateless
 VP9 decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Date: Thu, 07 Apr 2022 13:58:42 -0400
In-Reply-To: <d9c3dee7bbc763024eac14aab78ce4838c5074f8.camel@ndufresne.ca>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <20220331024801.29229-17-yunfei.dong@mediatek.com>
 <d9c3dee7bbc763024eac14aab78ce4838c5074f8.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
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

Le mercredi 06 avril 2022 =C3=A0 15:23 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi Yunfei,
>=20
> Le jeudi 31 mars 2022 =C3=A0 10:48 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> > Add support for VP9 decoding using the stateless API,
> > as supported by MT8192. And the drivers is lat and core architecture.
> >=20
> > Signed-off-by: George Sun <george.sun@mediatek.com>
> > Signed-off-by: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>=20
> Reviewed-by should be dropped when large rework happens. In this case, th=
e
> probability updated has been rewritten to use the common code (thanks for
> porting it). Unfortunately, running fluster tests shows massive regressio=
n (was
> 275/303) before):
>=20
>    Ran 34/303 tests successfully
>=20
> H.264 (91/135) and VP9 (59/61) are same as before. Any idea ? What was yo=
ur test
> results ?

Build warnings were badly fixed in my tree. I'll comment inline, but everyt=
hing
was catched by the CI, a V9 will be neede to finish cleanup build and doc
warnings. Note that Xiaoyong Lu also had crop info reading, I don't know if=
 this
is needed.

>=20
> > ---
> > changed compare with v7:
> > Using upstream interface to update vp9 prob tables.
> > ---
> >  .../media/platform/mediatek/vcodec/Makefile   |    1 +
> >  .../vcodec/mtk_vcodec_dec_stateless.c         |   26 +-
> >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
> >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2072 +++++++++++++++++
> >  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
> >  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
> >  6 files changed, 2102 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp=
9_req_lat_if.c
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/Makefile b/drivers/=
media/platform/mediatek/vcodec/Makefile
> > index b457daf2d196..93e7a343b5b0 100644
> > --- a/drivers/media/platform/mediatek/vcodec/Makefile
> > +++ b/drivers/media/platform/mediatek/vcodec/Makefile
> > @@ -9,6 +9,7 @@ mtk-vcodec-dec-y :=3D vdec/vdec_h264_if.o \
> >  		vdec/vdec_vp8_if.o \
> >  		vdec/vdec_vp8_req_if.o \
> >  		vdec/vdec_vp9_if.o \
> > +		vdec/vdec_vp9_req_lat_if.o \
> >  		vdec/vdec_h264_req_if.o \
> >  		vdec/vdec_h264_req_common.o \
> >  		vdec/vdec_h264_req_multi_if.o \
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stat=
eless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > index 3208f834ff80..a4735e67d39e 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > @@ -91,13 +91,28 @@ static const struct mtk_stateless_control mtk_state=
less_controls[] =3D {
> >  			.max =3D V4L2_MPEG_VIDEO_VP8_PROFILE_3,
> >  		},
> >  		.codec_type =3D V4L2_PIX_FMT_VP8_FRAME,
> > -	}
> > +	},
> > +	{
> > +		.cfg =3D {
> > +			.id =3D V4L2_CID_STATELESS_VP9_FRAME,
> > +		},
> > +		.codec_type =3D V4L2_PIX_FMT_VP9_FRAME,
> > +	},
> > +	{
> > +		.cfg =3D {
> > +			.id =3D V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
> > +			.min =3D V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> > +			.def =3D V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> > +			.max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_3,
> > +		},
> > +		.codec_type =3D V4L2_PIX_FMT_VP9_FRAME,
> > +	},
> >  };
> > =20
> >  #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> > =20
> > -static struct mtk_video_fmt mtk_video_formats[4];
> > -static struct mtk_codec_framesizes mtk_vdec_framesizes[2];
> > +static struct mtk_video_fmt mtk_video_formats[5];
> > +static struct mtk_codec_framesizes mtk_vdec_framesizes[3];
> > =20
> >  static struct mtk_video_fmt default_out_format;
> >  static struct mtk_video_fmt default_cap_format;
> > @@ -338,6 +353,7 @@ static void mtk_vcodec_add_formats(unsigned int fou=
rcc,
> >  	switch (fourcc) {
> >  	case V4L2_PIX_FMT_H264_SLICE:
> >  	case V4L2_PIX_FMT_VP8_FRAME:
> > +	case V4L2_PIX_FMT_VP9_FRAME:
> >  		mtk_video_formats[count_formats].fourcc =3D fourcc;
> >  		mtk_video_formats[count_formats].type =3D MTK_FMT_DEC;
> >  		mtk_video_formats[count_formats].num_planes =3D 1;
> > @@ -385,6 +401,10 @@ static void mtk_vcodec_get_supported_formats(struc=
t mtk_vcodec_ctx *ctx)
> >  		mtk_vcodec_add_formats(V4L2_PIX_FMT_VP8_FRAME, ctx);
> >  		out_format_count++;
> >  	}
> > +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_VP9_FRAME) {
> > +		mtk_vcodec_add_formats(V4L2_PIX_FMT_VP9_FRAME, ctx);
> > +		out_format_count++;
> > +	}
> > =20
> >  	if (cap_format_count)
> >  		default_cap_format =3D mtk_video_formats[cap_format_count - 1];
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > index 2ba1c19f07b6..a29041a0b7e0 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > @@ -355,6 +355,7 @@ enum mtk_vdec_format_types {
> >  	MTK_VDEC_FORMAT_MT21C =3D 0x40,
> >  	MTK_VDEC_FORMAT_H264_SLICE =3D 0x100,
> >  	MTK_VDEC_FORMAT_VP8_FRAME =3D 0x200,
> > +	MTK_VDEC_FORMAT_VP9_FRAME =3D 0x400,
> >  };
> > =20
> >  /**
> > diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_l=
at_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > new file mode 100644
> > index 000000000000..d63399085b9b
> > --- /dev/null
> > +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > @@ -0,0 +1,2072 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: George Sun <george.sun@mediatek.com>
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/v4l2-vp9.h>
> > +
> > +#include "../mtk_vcodec_util.h"
> > +#include "../mtk_vcodec_dec.h"
> > +#include "../mtk_vcodec_intr.h"
> > +#include "../vdec_drv_base.h"
> > +#include "../vdec_drv_if.h"
> > +#include "../vdec_vpu_if.h"
> > +
> > +/* reset_frame_context defined in VP9 spec */
> > +#define VP9_RESET_FRAME_CONTEXT_NONE0 0
> > +#define VP9_RESET_FRAME_CONTEXT_NONE1 1
> > +#define VP9_RESET_FRAME_CONTEXT_SPEC 2
> > +#define VP9_RESET_FRAME_CONTEXT_ALL 3
> > +
> > +#define VP9_TILE_BUF_SIZE 4096
> > +#define VP9_PROB_BUF_SIZE 2560
> > +#define VP9_COUNTS_BUF_SIZE 16384
> > +
> > +#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> > +#define LF_FLAG(x) (!!((lf)->flags & V4L2_VP9_LOOP_FILTER_FLAG_##x))
> > +#define SEG_FLAG(x) (!!((seg)->flags & V4L2_VP9_SEGMENTATION_FLAG_##x)=
)
> > +#define VP9_BAND_6(band) ((band) =3D=3D 0 ? 3 : 6)
> > +
> > +/*
> > + * struct vdec_vp9_slice_frame_ctx - vp9 prob tables footprint
> > + */
> > +struct vdec_vp9_slice_frame_ctx {
> > +	struct {
> > +		u8 probs[6][3];
> > +		u8 padding[2];
> > +	} coef_probs[4][2][2][6];
> > +
> > +	u8 y_mode_prob[4][16];
> > +	u8 switch_interp_prob[4][16];
> > +	u8 seg[32];  /* ignore */
> > +	u8 comp_inter_prob[16];
> > +	u8 comp_ref_prob[16];
> > +	u8 single_ref_prob[5][2];
> > +	u8 single_ref_prob_padding[6];
> > +
> > +	u8 joint[3];
> > +	u8 joint_padding[13];
> > +	struct {
> > +		u8 sign;
> > +		u8 classes[10];
> > +		u8 padding[5];
> > +	} sign_classes[2];
> > +	struct {
> > +		u8 class0[1];
> > +		u8 bits[10];
> > +		u8 padding[5];
> > +	} class0_bits[2];
> > +	struct {
> > +		u8 class0_fp[2][3];
> > +		u8 fp[3];
> > +		u8 class0_hp;
> > +		u8 hp;
> > +		u8 padding[5];
> > +	} class0_fp_hp[2];
> > +
> > +	u8 uv_mode_prob[10][16];
> > +	u8 uv_mode_prob_padding[2][16];
> > +
> > +	u8 partition_prob[16][4];
> > +
> > +	u8 inter_mode_probs[7][4];
> > +	u8 skip_probs[4];
> > +
> > +	u8 tx_p8x8[2][4];
> > +	u8 tx_p16x16[2][4];
> > +	u8 tx_p32x32[2][4];
> > +	u8 intra_inter_prob[8];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_frame_counts - vp9 counts tables footprint
> > + */
> > +struct vdec_vp9_slice_frame_counts {
> > +	union {
> > +		struct {
> > +			u32 band_0[3];
> > +			u32 padding0[1];
> > +			u32 band_1_5[5][6];
> > +			u32 padding1[2];
> > +		} eob_branch[4][2][2];
> > +		u32 eob_branch_space[256 * 4];
> > +	};
> > +
> > +	struct {
> > +		u32 band_0[3][4];
> > +		u32 band_1_5[5][6][4];
> > +	} coef_probs[4][2][2];
> > +
> > +	u32 intra_inter[4][2];
> > +	u32 comp_inter[5][2];
> > +	u32 comp_inter_padding[2];
> > +	u32 comp_ref[5][2];
> > +	u32 comp_ref_padding[2];
> > +	u32 single_ref[5][2][2];
> > +	u32 inter_mode[7][4];
> > +	u32 y_mode[4][12];
> > +	u32 uv_mode[10][10];
> > +	u32 partition[16][4];
> > +	u32 switchable_interp[4][4];
> > +
> > +	u32 tx_p8x8[2][2];
> > +	u32 tx_p16x16[2][4];
> > +	u32 tx_p32x32[2][4];
> > +
> > +	u32 skip[3][4];
> > +
> > +	u32 joint[4];
> > +
> > +	struct {
> > +		u32 sign[2];
> > +		u32 class0[2];
> > +		u32 classes[12];
> > +		u32 bits[10][2];
> > +		u32 padding[4];
> > +		u32 class0_fp[2][4];
> > +		u32 fp[4];
> > +		u32 class0_hp[2];
> > +		u32 hp[2];
> > +	} mvcomp[2];
> > +
> > +	u32 reserved[126][4];
> > +};
> > +
> > +/**
> > + * struct vdec_vp9_slice_counts_map - vp9 counts tables to map
> > + *                                    v4l2_vp9_frame_symbol_counts
> > + * @skip:	skip counts.
> > + * @y_mode:	Y prediction mode counts.
> > + * @filter:	interpolation filter counts.
> > + * @mv_joint:	motion vector joint counts.
> > + * @sign:	motion vector sign counts.
> > + * @classes:	motion vector class counts.
> > + * @class0:	motion vector class0 bit counts.
> > + * @bits:	motion vector bits counts.
> > + * @class0_fp:	motion vector class0 fractional bit counts.
> > + * @fp:	motion vector fractional bit counts.
> > + * @class0_hp:	motion vector class0 high precision fractional bit coun=
ts.
> > + * @hp:	motion vector high precision fractional bit counts.
> > + */
> > +struct vdec_vp9_slice_counts_map {
> > +	u32 skip[3][2];
> > +	u32 y_mode[4][10];
> > +	u32 filter[4][3];
> > +	u32 sign[2][2];
> > +	u32 classes[2][11];
> > +	u32 class0[2][2];
> > +	u32 bits[2][10][2];
> > +	u32 class0_fp[2][2][4];
> > +	u32 fp[2][4];
> > +	u32 class0_hp[2][2];
> > +	u32 hp[2][2];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_uncompressed_header - vp9 uncompressed header=
 syntax
> > + *                                             used for decoding
> > + */
> > +struct vdec_vp9_slice_uncompressed_header {
> > +	u8 profile;
> > +	u8 last_frame_type;
> > +	u8 frame_type;
> > +
> > +	u8 last_show_frame;
> > +	u8 show_frame;
> > +	u8 error_resilient_mode;
> > +
> > +	u8 bit_depth;
> > +	u8 padding0[1];
> > +	u16 last_frame_width;
> > +	u16 last_frame_height;
> > +	u16 frame_width;
> > +	u16 frame_height;
> > +
> > +	u8 intra_only;
> > +	u8 reset_frame_context;
> > +	u8 ref_frame_sign_bias[4];
> > +	u8 allow_high_precision_mv;
> > +	u8 interpolation_filter;
> > +
> > +	u8 refresh_frame_context;
> > +	u8 frame_parallel_decoding_mode;
> > +	u8 frame_context_idx;
> > +
> > +	/* loop_filter_params */
> > +	u8 loop_filter_level;
> > +	u8 loop_filter_sharpness;
> > +	u8 loop_filter_delta_enabled;
> > +	s8 loop_filter_ref_deltas[4];
> > +	s8 loop_filter_mode_deltas[2];
> > +
> > +	/* quantization_params */
> > +	u8 base_q_idx;
> > +	s8 delta_q_y_dc;
> > +	s8 delta_q_uv_dc;
> > +	s8 delta_q_uv_ac;
> > +
> > +	/* segmentation_params */
> > +	u8 segmentation_enabled;
> > +	u8 segmentation_update_map;
> > +	u8 segmentation_tree_probs[7];
> > +	u8 padding1[1];
> > +	u8 segmentation_temporal_udpate;
> > +	u8 segmentation_pred_prob[3];
> > +	u8 segmentation_update_data;
> > +	u8 segmentation_abs_or_delta_update;
> > +	u8 feature_enabled[8];
> > +	s16 feature_value[8][4];
> > +
> > +	/* tile_info */
> > +	u8 tile_cols_log2;
> > +	u8 tile_rows_log2;
> > +	u8 padding2[2];
> > +
> > +	u16 uncompressed_header_size;
> > +	u16 header_size_in_bytes;
> > +
> > +	/* LAT OUT, CORE IN */
> > +	u32 dequant[8][4];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_compressed_header - vp9 compressed header syn=
tax
> > + *                                           used for decoding.
> > + */
> > +struct vdec_vp9_slice_compressed_header {
> > +	u8 tx_mode;
> > +	u8 ref_mode;
> > +	u8 comp_fixed_ref;
> > +	u8 comp_var_ref[2];
> > +	u8 padding[3];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_tiles - vp9 tile syntax
> > + */
> > +struct vdec_vp9_slice_tiles {
> > +	u32 size[4][64];
> > +	u32 mi_rows[4];
> > +	u32 mi_cols[64];
> > +	u8 actual_rows;
> > +	u8 padding[7];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_reference - vp9 reference frame information
> > + */
> > +struct vdec_vp9_slice_reference {
> > +	u16 frame_width;
> > +	u16 frame_height;
> > +	u8 bit_depth;
> > +	u8 subsampling_x;
> > +	u8 subsampling_y;
> > +	u8 padding;
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_frame - vp9 syntax used for decoding
> > + */
> > +struct vdec_vp9_slice_frame {
> > +	struct vdec_vp9_slice_uncompressed_header uh;
> > +	struct vdec_vp9_slice_compressed_header ch;
> > +	struct vdec_vp9_slice_tiles tiles;
> > +	struct vdec_vp9_slice_reference ref[3];
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_init_vsi - VSI used to initialize instance
> > + */
> > +struct vdec_vp9_slice_init_vsi {
> > +	unsigned int architecture;
> > +	unsigned int reserved;
> > +	u64 core_vsi;
> > +	/* default frame context's position in MicroP */
> > +	u64 default_frame_ctx;
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_mem - memory address and size
> > + */
> > +struct vdec_vp9_slice_mem {
> > +	union {
> > +		u64 buf;
> > +		dma_addr_t dma_addr;
> > +	};
> > +	union {
> > +		size_t size;
> > +		dma_addr_t dma_addr_end;
> > +		u64 padding;
> > +	};
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_bs - input buffer for decoding
> > + */
> > +struct vdec_vp9_slice_bs {
> > +	struct vdec_vp9_slice_mem buf;
> > +	struct vdec_vp9_slice_mem frame;
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_fb - frame buffer for decoding
> > + */
> > +struct vdec_vp9_slice_fb {
> > +	struct vdec_vp9_slice_mem y;
> > +	struct vdec_vp9_slice_mem c;
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_state - decoding state
> > + */
> > +struct vdec_vp9_slice_state {
> > +	int err;
> > +	unsigned int full;
> > +	unsigned int timeout;
> > +	unsigned int perf;
> > +
> > +	unsigned int crc[12];
> > +};
> > +
> > +/**
> > + * struct vdec_vp9_slice_vsi - exchange decoding information
> > + *                             between Main CPU and MicroP
> > + *
> > + * @bs:	input buffer
> > + * @fb:	output buffer
> > + * @ref:	3 reference buffers
> > + * @mv:	mv working buffer
> > + * @seg:	segmentation working buffer
> > + * @tile:	tile buffer
> > + * @prob:	prob table buffer, used to set/update prob table
> > + * @counts:	counts table buffer, used to update prob table
> > + * @ube:	general buffer
> > + * @trans:	trans buffer position in general buffer
> > + * @err_map:	error buffer
> > + * @row_info:	row info buffer
> > + * @frame:	decoding syntax
> > + * @state:	decoding state
> > + */
> > +struct vdec_vp9_slice_vsi {
> > +	/* used in LAT stage */
> > +	struct vdec_vp9_slice_bs bs;
> > +	/* used in Core stage */
> > +	struct vdec_vp9_slice_fb fb;
> > +	struct vdec_vp9_slice_fb ref[3];
> > +
> > +	struct vdec_vp9_slice_mem mv[2];
> > +	struct vdec_vp9_slice_mem seg[2];
> > +	struct vdec_vp9_slice_mem tile;
> > +	struct vdec_vp9_slice_mem prob;
> > +	struct vdec_vp9_slice_mem counts;
> > +
> > +	/* LAT stage's output, Core stage's input */
> > +	struct vdec_vp9_slice_mem ube;
> > +	struct vdec_vp9_slice_mem trans;
> > +	struct vdec_vp9_slice_mem err_map;
> > +	struct vdec_vp9_slice_mem row_info;
> > +
> > +	/* decoding parameters */
> > +	struct vdec_vp9_slice_frame frame;
> > +
> > +	struct vdec_vp9_slice_state state;
> > +};
> > +
> > +/**
> > + * struct vdec_vp9_slice_pfc - per-frame context that contains a local=
 vsi.
> > + *                             pass it from lat to core
> > + *
> > + * @vsi:	local vsi. copy to/from remote vsi before/after decoding
> > + * @ref_idx:	reference buffer index
> > + * @seq:	picture sequence
> > + * @state:	decoding state
> > + */
> > +struct vdec_vp9_slice_pfc {
> > +	struct vdec_vp9_slice_vsi vsi;
> > +
> > +	u64 ref_idx[3];
> > +
> > +	int seq;
> > +
> > +	/* LAT/Core CRC */
> > +	struct vdec_vp9_slice_state state[2];
> > +};
> > +
> > +/*
> > + * enum vdec_vp9_slice_resolution_level
> > + */
> > +enum vdec_vp9_slice_resolution_level {
> > +	VP9_RES_NONE,
> > +	VP9_RES_FHD,
> > +	VP9_RES_4K,
> > +	VP9_RES_8K,
> > +};
> > +
> > +/*
> > + * struct vdec_vp9_slice_ref - picture's width & height should kept
> > + *                             for later decoding as reference picture
> > + */
> > +struct vdec_vp9_slice_ref {
> > +	unsigned int width;
> > +	unsigned int height;
> > +};
> > +
> > +/**
> > + * struct vdec_vp9_slice_instance - represent one vp9 instance
> > + *
> > + * @ctx:		pointer to codec's context
> > + * @vpu:		VPU instance
> > + * @seq:		global picture sequence
> > + * @level:		level of current resolution
> > + * @width:		width of last picture
> > + * @height:		height of last picture
> > + * @frame_type:	frame_type of last picture
> > + * @irq:		irq to Main CPU or MicroP
> > + * @show_frame:	show_frame of last picture
> > + * @dpb:		picture information (width/height) for reference
> > + * @mv:		mv working buffer
> > + * @seg:		segmentation working buffer
> > + * @tile:		tile buffer
> > + * @prob:		prob table buffer, used to set/update prob table
> > + * @counts:		counts table buffer, used to update prob table
> > + * @frame_ctx:		4 frame context according to VP9 Spec
> > + * @frame_ctx_helper:	4 frame context according to newest kernel spec
> > + * @dirty:		state of each frame context
> > + * @init_vsi:		vsi used for initialized VP9 instance
> > + * @vsi:		vsi used for decoding/flush ...
> > + * @core_vsi:		vsi used for Core stage
> > + * @counts_map:	used map to counts_helper
> > + * &counts_helper:	counts table according to newest kernel spec
> > + */
> > +struct vdec_vp9_slice_instance {
> > +	struct mtk_vcodec_ctx *ctx;
> > +	struct vdec_vpu_inst vpu;
> > +
> > +	int seq;
> > +
> > +	enum vdec_vp9_slice_resolution_level level;
> > +
> > +	/* for resolution change and get_pic_info */
> > +	unsigned int width;
> > +	unsigned int height;
> > +
> > +	/* for last_frame_type */
> > +	unsigned int frame_type;
> > +	unsigned int irq;
> > +
> > +	unsigned int show_frame;
> > +
> > +	/* maintain vp9 reference frame state */
> > +	struct vdec_vp9_slice_ref dpb[VB2_MAX_FRAME];
> > +
> > +	/*
> > +	 * normal working buffers
> > +	 * mv[0]/seg[0]/tile/prob/counts is used for LAT
> > +	 * mv[1]/seg[1] is used for CORE
> > +	 */
> > +	struct mtk_vcodec_mem mv[2];
> > +	struct mtk_vcodec_mem seg[2];
> > +	struct mtk_vcodec_mem tile;
> > +	struct mtk_vcodec_mem prob;
> > +	struct mtk_vcodec_mem counts;
> > +
> > +	/* 4 prob tables */
> > +	struct vdec_vp9_slice_frame_ctx frame_ctx[4];
> > +	/*4 helper tables */
> > +	struct v4l2_vp9_frame_context frame_ctx_helper;
> > +	unsigned char dirty[4];
> > +
> > +	/* MicroP vsi */
> > +	union {
> > +		struct vdec_vp9_slice_init_vsi *init_vsi;
> > +		struct vdec_vp9_slice_vsi *vsi;
> > +	};
> > +	struct vdec_vp9_slice_vsi *core_vsi;
> > +
> > +	struct vdec_vp9_slice_counts_map counts_map;
> > +	struct v4l2_vp9_frame_symbol_counts counts_helper;
> > +};
> > +
> > +/*
> > + * (2, (0, (1, 3)))
> > + * max level =3D 2
> > + */
> > +static const signed char vdec_vp9_slice_inter_mode_tree[6] =3D {
> > +	-2, 2, 0, 4, -1, -3
> > +};
> > +
> > +/* max level =3D 6 */
> > +static const signed char vdec_vp9_slice_intra_mode_tree[18] =3D {
> > +	0, 2, -9, 4, -1, 6, 8, 12, -2, 10, -4, -5, -3, 14, -8, 16, -6, -7
> > +};
> > +
> > +/* max level =3D 2 */
> > +static const signed char vdec_vp9_slice_partition_tree[6] =3D {
> > +	0, 2, -1, 4, -2, -3
> > +};
> > +
> > +/* max level =3D 1 */
> > +static const signed char vdec_vp9_slice_switchable_interp_tree[4] =3D =
{
> > +	0, 2, -1, -2
> > +};
> > +
> > +/* max level =3D 2 */
> > +static const signed char vdec_vp9_slice_mv_joint_tree[6] =3D {
> > +	0, 2, -1, 4, -2, -3
> > +};
> > +
> > +/* max level =3D 6 */
> > +static const signed char vdec_vp9_slice_mv_class_tree[20] =3D {
> > +	0, 2, -1, 4, 6, 8, -2, -3, 10, 12,
> > +	-4, -5, -6, 14, 16, 18, -7, -8, -9, -10
> > +};
> > +
> > +/* max level =3D 0 */
> > +static const signed char vdec_vp9_slice_mv_class0_tree[2] =3D {
> > +	0, -1
> > +};
> > +
> > +/* max level =3D 2 */
> > +static const signed char vdec_vp9_slice_mv_fp_tree[6] =3D {
> > +	0, 2, -1, 4, -2, -3
> > +};
> > +
> > +/*
> > + * all VP9 instances could share this default frame context.
> > + */
> > +static struct vdec_vp9_slice_frame_ctx *vdec_vp9_slice_default_frame_c=
tx;
> > +static DEFINE_MUTEX(vdec_vp9_slice_frame_ctx_lock);
> > +
> > +static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf);
> > +
> > +static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice=
_instance *instance)
> > +{
> > +	struct vdec_vp9_slice_frame_ctx *remote_frame_ctx;
> > +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> > +	struct mtk_vcodec_ctx *ctx;
> > +	struct vdec_vp9_slice_init_vsi *vsi;
> > +	int ret =3D 0;
> > +
> > +	ctx =3D instance->ctx;
> > +	vsi =3D instance->vpu.vsi;
> > +	if (!ctx || !vsi)
> > +		return -EINVAL;
> > +
> > +	remote_frame_ctx =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
> > +						     (u32)vsi->default_frame_ctx);
> > +	if (!remote_frame_ctx) {
> > +		mtk_vcodec_err(instance, "failed to map default frame ctx\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	mutex_lock(&vdec_vp9_slice_frame_ctx_lock);
> > +	if (vdec_vp9_slice_default_frame_ctx)
> > +		goto out;
> > +
> > +	frame_ctx =3D kmalloc(sizeof(*frame_ctx), GFP_KERNEL);
> > +	if (!frame_ctx) {
> > +		ret =3D -ENOMEM;
> > +		goto out;
> > +	}
> > +
> > +	memcpy_fromio(frame_ctx, remote_frame_ctx, sizeof(*frame_ctx));
> > +	vdec_vp9_slice_default_frame_ctx =3D frame_ctx;
> > +
> > +out:
> > +	mutex_unlock(&vdec_vp9_slice_frame_ctx_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_i=
nstance *instance,
> > +					       struct vdec_vp9_slice_vsi *vsi)
> > +{
> > +	struct mtk_vcodec_ctx *ctx =3D instance->ctx;
> > +	enum vdec_vp9_slice_resolution_level level;
> > +	/* super blocks */
> > +	unsigned int max_sb_w;
> > +	unsigned int max_sb_h;
> > +	unsigned int max_w;
> > +	unsigned int max_h;
> > +	unsigned int w;
> > +	unsigned int h;
> > +	size_t size;
> > +	int ret;
> > +	int i;
> > +
> > +	w =3D vsi->frame.uh.frame_width;
> > +	h =3D vsi->frame.uh.frame_height;
> > +
> > +	if (w > VCODEC_DEC_4K_CODED_WIDTH ||
> > +	    h > VCODEC_DEC_4K_CODED_HEIGHT) {
> > +		return -EINVAL;
> > +	} else if (w > MTK_VDEC_MAX_W || h > MTK_VDEC_MAX_H) {
> > +		/* 4K */
> > +		level =3D VP9_RES_4K;
> > +		max_w =3D VCODEC_DEC_4K_CODED_WIDTH;
> > +		max_h =3D VCODEC_DEC_4K_CODED_HEIGHT;
> > +	} else {
> > +		/* FHD */
> > +		level =3D VP9_RES_FHD;
> > +		max_w =3D MTK_VDEC_MAX_W;
> > +		max_h =3D MTK_VDEC_MAX_H;
> > +	}
> > +
> > +	if (level =3D=3D instance->level)
> > +		return 0;
> > +
> > +	mtk_vcodec_debug(instance, "resolution level changed, from %u to %u, =
%ux%u",
> > +			 instance->level, level, w, h);
> > +
> > +	max_sb_w =3D DIV_ROUND_UP(max_w, 64);
> > +	max_sb_h =3D DIV_ROUND_UP(max_h, 64);
> > +	ret =3D -ENOMEM;
> > +
> > +	/*
> > +	 * Lat-flush must wait core idle, otherwise core will
> > +	 * use released buffers
> > +	 */
> > +
> > +	size =3D (max_sb_w * max_sb_h + 2) * 576;
> > +	for (i =3D 0; i < 2; i++) {
> > +		if (instance->mv[i].va)
> > +			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
> > +		instance->mv[i].size =3D size;
> > +		if (mtk_vcodec_mem_alloc(ctx, &instance->mv[i]))
> > +			goto err;
> > +	}
> > +
> > +	size =3D (max_sb_w * max_sb_h * 32) + 256;
> > +	for (i =3D 0; i < 2; i++) {
> > +		if (instance->seg[i].va)
> > +			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
> > +		instance->seg[i].size =3D size;
> > +		if (mtk_vcodec_mem_alloc(ctx, &instance->seg[i]))
> > +			goto err;
> > +	}
> > +
> > +	if (!instance->tile.va) {
> > +		instance->tile.size =3D VP9_TILE_BUF_SIZE;
> > +		if (mtk_vcodec_mem_alloc(ctx, &instance->tile))
> > +			goto err;
> > +	}
> > +
> > +	if (!instance->prob.va) {
> > +		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> > +		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> > +			goto err;
> > +	}
> > +
> > +	if (!instance->counts.va) {
> > +		instance->counts.size =3D VP9_COUNTS_BUF_SIZE;
> > +		if (mtk_vcodec_mem_alloc(ctx, &instance->counts))
> > +			goto err;
> > +	}
> > +
> > +	instance->level =3D level;
> > +	return 0;
> > +
> > +err:
> > +	instance->level =3D VP9_RES_NONE;
> > +	return ret;
> > +}
> > +
> > +static void vdec_vp9_slice_free_working_buffer(struct vdec_vp9_slice_i=
nstance *instance)
> > +{
> > +	struct mtk_vcodec_ctx *ctx =3D instance->ctx;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(instance->mv); i++) {
> > +		if (instance->mv[i].va)
> > +			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
> > +	}
> > +	for (i =3D 0; i < ARRAY_SIZE(instance->seg); i++) {
> > +		if (instance->seg[i].va)
> > +			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
> > +	}
> > +	if (instance->tile.va)
> > +		mtk_vcodec_mem_free(ctx, &instance->tile);
> > +	if (instance->prob.va)
> > +		mtk_vcodec_mem_free(ctx, &instance->prob);
> > +	if (instance->counts.va)
> > +		mtk_vcodec_mem_free(ctx, &instance->counts);
> > +
> > +	instance->level =3D VP9_RES_NONE;
> > +}
> > +
> > +static void vdec_vp9_slice_vsi_from_remote(struct vdec_vp9_slice_vsi *=
vsi,
> > +					   struct vdec_vp9_slice_vsi *remote_vsi,
> > +					   int skip)
> > +{
> > +	struct vdec_vp9_slice_frame *rf;
> > +	struct vdec_vp9_slice_frame *f;
> > +
> > +	/*
> > +	 * compressed header
> > +	 * dequant
> > +	 * buffer position
> > +	 * decode state
> > +	 */
> > +	if (!skip) {
> > +		rf =3D &remote_vsi->frame;
> > +		f =3D &vsi->frame;
> > +		memcpy_fromio(&f->ch, &rf->ch, sizeof(f->ch));
> > +		memcpy_fromio(&f->uh.dequant, &rf->uh.dequant, sizeof(f->uh.dequant)=
);
> > +		memcpy_fromio(&vsi->trans, &remote_vsi->trans, sizeof(vsi->trans));
> > +	}
> > +
> > +	memcpy_fromio(&vsi->state, &remote_vsi->state, sizeof(vsi->state));
> > +}
> > +
> > +static void vdec_vp9_slice_vsi_to_remote(struct vdec_vp9_slice_vsi *vs=
i,
> > +					 struct vdec_vp9_slice_vsi *remote_vsi)
> > +{
> > +	memcpy_toio(remote_vsi, vsi, sizeof(*vsi));
> > +}
> > +
> > +static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_lo=
g2)
> > +{
> > +	int sbs =3D (mi_num + 7) >> 3;
> > +	int offset =3D ((idx * sbs) >> tile_log2) << 3;
> > +
> > +	return offset < mi_num ? offset : mi_num;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice=
_instance *instance,
> > +						 struct vdec_lat_buf *lat_buf)
> > +{
> > +	struct vb2_v4l2_buffer *src;
> > +	struct vb2_v4l2_buffer *dst;
> > +
> > +	src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> > +	if (!src)
> > +		return -EINVAL;
> > +
> > +	lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> > +
> > +	dst =3D &lat_buf->ts_info;
> > +	v4l2_m2m_buf_copy_metadata(src, dst, true);
> > +	return 0;
> > +}
> > +
> > +static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *i=
nstance,
> > +				     struct vdec_vp9_slice_uncompressed_header *uh,
> > +				     struct v4l2_ctrl_vp9_frame *hdr)
> > +{
> > +	int i;
> > +
> > +	uh->profile =3D hdr->profile;
> > +	uh->last_frame_type =3D instance->frame_type;
> > +	uh->frame_type =3D !HDR_FLAG(KEY_FRAME);
> > +	uh->last_show_frame =3D instance->show_frame;
> > +	uh->show_frame =3D HDR_FLAG(SHOW_FRAME);
> > +	uh->error_resilient_mode =3D HDR_FLAG(ERROR_RESILIENT);
> > +	uh->bit_depth =3D hdr->bit_depth;
> > +	uh->last_frame_width =3D instance->width;
> > +	uh->last_frame_height =3D instance->height;
> > +	uh->frame_width =3D hdr->frame_width_minus_1 + 1;
> > +	uh->frame_height =3D hdr->frame_height_minus_1 + 1;
> > +	uh->intra_only =3D HDR_FLAG(INTRA_ONLY);
> > +	/* map v4l2 enum to values defined in VP9 spec for firmware */
> > +	switch (hdr->reset_frame_context) {
> > +	case V4L2_VP9_RESET_FRAME_CTX_NONE:
> > +		uh->reset_frame_context =3D VP9_RESET_FRAME_CONTEXT_NONE0;
> > +		break;
> > +	case V4L2_VP9_RESET_FRAME_CTX_SPEC:
> > +		uh->reset_frame_context =3D VP9_RESET_FRAME_CONTEXT_SPEC;
> > +		break;
> > +	case V4L2_VP9_RESET_FRAME_CTX_ALL:
> > +		uh->reset_frame_context =3D VP9_RESET_FRAME_CONTEXT_ALL;
> > +		break;
> > +	default:
> > +		uh->reset_frame_context =3D VP9_RESET_FRAME_CONTEXT_NONE0;
> > +		break;
> > +	}
> > +	/*
> > +	 * ref_frame_sign_bias specifies the intended direction
> > +	 * of the motion vector in time for each reference frame.
> > +	 * - INTRA_FRAME =3D 0,
> > +	 * - LAST_FRAME =3D 1,
> > +	 * - GOLDEN_FRAME =3D 2,
> > +	 * - ALTREF_FRAME =3D 3,
> > +	 * ref_frame_sign_bias[INTRA_FRAME] is always 0
> > +	 * and VDA only passes another 3 directions
> > +	 */
> > +	uh->ref_frame_sign_bias[0] =3D 0;
> > +	for (i =3D 0; i < 3; i++)
> > +		uh->ref_frame_sign_bias[i + 1] =3D
> > +			!!(hdr->ref_frame_sign_bias & (1 << i));
> > +	uh->allow_high_precision_mv =3D HDR_FLAG(ALLOW_HIGH_PREC_MV);
> > +	uh->interpolation_filter =3D hdr->interpolation_filter;
> > +	uh->refresh_frame_context =3D HDR_FLAG(REFRESH_FRAME_CTX);
> > +	uh->frame_parallel_decoding_mode =3D HDR_FLAG(PARALLEL_DEC_MODE);
> > +	uh->frame_context_idx =3D hdr->frame_context_idx;
> > +
> > +	/* tile info */
> > +	uh->tile_cols_log2 =3D hdr->tile_cols_log2;
> > +	uh->tile_rows_log2 =3D hdr->tile_rows_log2;
> > +
> > +	uh->uncompressed_header_size =3D hdr->uncompressed_header_size;
> > +	uh->header_size_in_bytes =3D hdr->compressed_header_size;
> > +}
> > +
> > +static void vdec_vp9_slice_setup_frame_ctx(struct vdec_vp9_slice_insta=
nce *instance,
> > +					   struct vdec_vp9_slice_uncompressed_header *uh,
> > +					   struct v4l2_ctrl_vp9_frame *hdr)
> > +{
> > +	int error_resilient_mode;
> > +	int reset_frame_context;
> > +	int key_frame;
> > +	int intra_only;
> > +	int i;
> > +
> > +	key_frame =3D HDR_FLAG(KEY_FRAME);
> > +	intra_only =3D HDR_FLAG(INTRA_ONLY);
> > +	error_resilient_mode =3D HDR_FLAG(ERROR_RESILIENT);
> > +	reset_frame_context =3D uh->reset_frame_context;
> > +
> > +	/*
> > +	 * according to "6.2 Uncompressed header syntax" in
> > +	 * "VP9 Bitstream & Decoding Process Specification",
> > +	 * reset @frame_context_idx when (FrameIsIntra || error_resilient_mod=
e)
> > +	 */
> > +	if (key_frame || intra_only || error_resilient_mode) {
> > +		/*
> > +		 * @reset_frame_context specifies
> > +		 * whether the frame context should be
> > +		 * reset to default values:
> > +		 * 0 or 1 means do not reset any frame context
> > +		 * 2 resets just the context specified in the frame header
> > +		 * 3 resets all contexts
> > +		 */
> > +		if (key_frame || error_resilient_mode ||
> > +		    reset_frame_context =3D=3D 3) {
> > +			/* use default table */
> > +			for (i =3D 0; i < 4; i++)
> > +				instance->dirty[i] =3D 0;
> > +		} else if (reset_frame_context =3D=3D 2) {
> > +			instance->dirty[uh->frame_context_idx] =3D 0;
> > +		}
> > +		uh->frame_context_idx =3D 0;
> > +	}
> > +}
> > +
> > +static void vdec_vp9_slice_setup_loop_filter(struct vdec_vp9_slice_unc=
ompressed_header *uh,
> > +					     struct v4l2_vp9_loop_filter *lf)
> > +{
> > +	int i;
> > +
> > +	uh->loop_filter_level =3D lf->level;
> > +	uh->loop_filter_sharpness =3D lf->sharpness;
> > +	uh->loop_filter_delta_enabled =3D LF_FLAG(DELTA_ENABLED);
> > +	for (i =3D 0; i < 4; i++)
> > +		uh->loop_filter_ref_deltas[i] =3D lf->ref_deltas[i];
> > +	for (i =3D 0; i < 2; i++)
> > +		uh->loop_filter_mode_deltas[i] =3D lf->mode_deltas[i];
> > +}
> > +
> > +static void vdec_vp9_slice_setup_quantization(struct vdec_vp9_slice_un=
compressed_header *uh,
> > +					      struct v4l2_vp9_quantization *quant)
> > +{
> > +	uh->base_q_idx =3D quant->base_q_idx;
> > +	uh->delta_q_y_dc =3D quant->delta_q_y_dc;
> > +	uh->delta_q_uv_dc =3D quant->delta_q_uv_dc;
> > +	uh->delta_q_uv_ac =3D quant->delta_q_uv_ac;
> > +}
> > +
> > +static void vdec_vp9_slice_setup_segmentation(struct vdec_vp9_slice_un=
compressed_header *uh,
> > +					      struct v4l2_vp9_segmentation *seg)
> > +{
> > +	int i;
> > +	int j;
> > +
> > +	uh->segmentation_enabled =3D SEG_FLAG(ENABLED);
> > +	uh->segmentation_update_map =3D SEG_FLAG(UPDATE_MAP);
> > +	for (i =3D 0; i < 7; i++)
> > +		uh->segmentation_tree_probs[i] =3D seg->tree_probs[i];
> > +	uh->segmentation_temporal_udpate =3D SEG_FLAG(TEMPORAL_UPDATE);
> > +	for (i =3D 0; i < 3; i++)
> > +		uh->segmentation_pred_prob[i] =3D seg->pred_probs[i];
> > +	uh->segmentation_update_data =3D SEG_FLAG(UPDATE_DATA);
> > +	uh->segmentation_abs_or_delta_update =3D SEG_FLAG(ABS_OR_DELTA_UPDATE=
);
> > +	for (i =3D 0; i < 8; i++) {
> > +		uh->feature_enabled[i] =3D seg->feature_enabled[i];
> > +		for (j =3D 0; j < 4; j++)
> > +			uh->feature_value[i][j] =3D seg->feature_data[i][j];
> > +	}
> > +}
> > +
> > +static int vdec_vp9_slice_setup_tile(struct vdec_vp9_slice_vsi *vsi,
> > +				     struct v4l2_ctrl_vp9_frame *hdr)
> > +{
> > +	unsigned int rows_log2;
> > +	unsigned int cols_log2;
> > +	unsigned int rows;
> > +	unsigned int cols;
> > +	unsigned int mi_rows;
> > +	unsigned int mi_cols;
> > +	struct vdec_vp9_slice_tiles *tiles;
> > +	int offset;
> > +	int start;
> > +	int end;
> > +	int i;
> > +
> > +	rows_log2 =3D hdr->tile_rows_log2;
> > +	cols_log2 =3D hdr->tile_cols_log2;
> > +	rows =3D 1 << rows_log2;
> > +	cols =3D 1 << cols_log2;
> > +	tiles =3D &vsi->frame.tiles;
> > +	tiles->actual_rows =3D 0;
> > +
> > +	if (rows > 4 || cols > 64)
> > +		return -EINVAL;
> > +
> > +	/* setup mi rows/cols information */
> > +	mi_rows =3D (hdr->frame_height_minus_1 + 1 + 7) >> 3;
> > +	mi_cols =3D (hdr->frame_width_minus_1 + 1 + 7) >> 3;
> > +
> > +	for (i =3D 0; i < rows; i++) {
> > +		start =3D vdec_vp9_slice_tile_offset(i, mi_rows, rows_log2);
> > +		end =3D vdec_vp9_slice_tile_offset(i + 1, mi_rows, rows_log2);
> > +		offset =3D end - start;
> > +		tiles->mi_rows[i] =3D (offset + 7) >> 3;
> > +		if (tiles->mi_rows[i])
> > +			tiles->actual_rows++;
> > +	}
> > +
> > +	for (i =3D 0; i < cols; i++) {
> > +		start =3D vdec_vp9_slice_tile_offset(i, mi_cols, cols_log2);
> > +		end =3D vdec_vp9_slice_tile_offset(i + 1, mi_cols, cols_log2);
> > +		offset =3D end - start;
> > +		tiles->mi_cols[i] =3D (offset + 7) >> 3;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void vdec_vp9_slice_setup_state(struct vdec_vp9_slice_vsi *vsi)
> > +{
> > +	memset(&vsi->state, 0, sizeof(vsi->state));
> > +}
> > +
> > +static void vdec_vp9_slice_setup_ref_idx(struct vdec_vp9_slice_pfc *pf=
c,
> > +					 struct v4l2_ctrl_vp9_frame *hdr)
> > +{
> > +	pfc->ref_idx[0] =3D hdr->last_frame_ts;
> > +	pfc->ref_idx[1] =3D hdr->golden_frame_ts;
> > +	pfc->ref_idx[2] =3D hdr->alt_frame_ts;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_pfc(struct vdec_vp9_slice_instance *in=
stance,
> > +				    struct vdec_vp9_slice_pfc *pfc)
> > +{
> > +	struct v4l2_ctrl_vp9_frame *hdr;
> > +	struct vdec_vp9_slice_uncompressed_header *uh;
> > +	struct v4l2_ctrl *hdr_ctrl;
> > +	struct vdec_vp9_slice_vsi *vsi;
> > +	int ret;
> > +
> > +	/* frame header */
> > +	hdr_ctrl =3D v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATEL=
ESS_VP9_FRAME);
> > +	if (!hdr_ctrl || !hdr_ctrl->p_cur.p)
> > +		return -EINVAL;
> > +
> > +	hdr =3D hdr_ctrl->p_cur.p;
> > +	vsi =3D &pfc->vsi;
> > +	uh =3D &vsi->frame.uh;
> > +
> > +	/* setup vsi information */
> > +	vdec_vp9_slice_setup_hdr(instance, uh, hdr);
> > +	vdec_vp9_slice_setup_frame_ctx(instance, uh, hdr);
> > +	vdec_vp9_slice_setup_loop_filter(uh, &hdr->lf);
> > +	vdec_vp9_slice_setup_quantization(uh, &hdr->quant);
> > +	vdec_vp9_slice_setup_segmentation(uh, &hdr->seg);
> > +	ret =3D vdec_vp9_slice_setup_tile(vsi, hdr);
> > +	if (ret)
> > +		return ret;
> > +	vdec_vp9_slice_setup_state(vsi);
> > +
> > +	/* core stage needs buffer index to get ref y/c ... */
> > +	vdec_vp9_slice_setup_ref_idx(pfc, hdr);
> > +
> > +	pfc->seq =3D instance->seq;
> > +	instance->seq++;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_insta=
nce *instance,
> > +					   struct vdec_vp9_slice_vsi *vsi,
> > +					   struct mtk_vcodec_mem *bs,
> > +					   struct vdec_lat_buf *lat_buf)
> > +{
> > +	int i;
> > +
> > +	vsi->bs.buf.dma_addr =3D bs->dma_addr;
> > +	vsi->bs.buf.size =3D bs->size;
> > +	vsi->bs.frame.dma_addr =3D bs->dma_addr;
> > +	vsi->bs.frame.size =3D bs->size;
> > +
> > +	for (i =3D 0; i < 2; i++) {
> > +		vsi->mv[i].dma_addr =3D instance->mv[i].dma_addr;
> > +		vsi->mv[i].size =3D instance->mv[i].size;
> > +	}
> > +	for (i =3D 0; i < 2; i++) {
> > +		vsi->seg[i].dma_addr =3D instance->seg[i].dma_addr;
> > +		vsi->seg[i].size =3D instance->seg[i].size;
> > +	}
> > +	vsi->tile.dma_addr =3D instance->tile.dma_addr;
> > +	vsi->tile.size =3D instance->tile.size;
> > +	vsi->prob.dma_addr =3D instance->prob.dma_addr;
> > +	vsi->prob.size =3D instance->prob.size;
> > +	vsi->counts.dma_addr =3D instance->counts.dma_addr;
> > +	vsi->counts.size =3D instance->counts.size;
> > +
> > +	vsi->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
> > +	vsi->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.size;
> > +	vsi->trans.dma_addr =3D lat_buf->ctx->msg_queue.wdma_wptr_addr;
> > +	/* used to store trans end */
> > +	vsi->trans.dma_addr_end =3D lat_buf->ctx->msg_queue.wdma_rptr_addr;
> > +	vsi->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma_addr;
> > +	vsi->err_map.size =3D lat_buf->wdma_err_addr.size;
> > +
> > +	vsi->row_info.buf =3D 0;
> > +	vsi->row_info.size =3D 0;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_inst=
ance *instance,
> > +					    struct vdec_vp9_slice_vsi *vsi)
> > +{
> > +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> > +	struct vdec_vp9_slice_uncompressed_header *uh;
> > +
> > +	uh =3D &vsi->frame.uh;
> > +
> > +	mtk_vcodec_debug(instance, "ctx dirty %u idx %d\n",
> > +			 instance->dirty[uh->frame_context_idx],
> > +			 uh->frame_context_idx);
> > +
> > +	if (instance->dirty[uh->frame_context_idx])
> > +		frame_ctx =3D &instance->frame_ctx[uh->frame_context_idx];
> > +	else
> > +		frame_ctx =3D vdec_vp9_slice_default_frame_ctx;
> > +	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
> > +
> > +	return 0;
> > +}
> > +
> > +static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_inst=
ance *instance,
> > +					    struct vdec_vp9_slice_vsi *vsi,
> > +					    struct mtk_vcodec_mem *buf)
> > +{
> > +	struct vdec_vp9_slice_uncompressed_header *uh;
> > +
> > +	/* reset segment buffer */
> > +	uh =3D &vsi->frame.uh;
> > +	if (uh->frame_type =3D=3D 0 ||
> > +	    uh->intra_only ||
> > +	    uh->error_resilient_mode ||
> > +	    uh->frame_width !=3D instance->width ||
> > +	    uh->frame_height !=3D instance->height) {
> > +		mtk_vcodec_debug(instance, "reset seg\n");
> > +		memset(buf->va, 0, buf->size);
> > +	}
> > +}
> > +
> > +/*
> > + * parse tiles according to `6.4 Decode tiles syntax`
> > + * in "vp9-bitstream-specification"
> > + *
> > + * frame contains uncompress header, compressed header and several til=
es.
> > + * this function parses tiles' position and size, stores them to tile =
buffer
> > + * for decoding.
> > + */
> > +static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_inst=
ance *instance,
> > +					    struct vdec_vp9_slice_vsi *vsi,
> > +					    struct mtk_vcodec_mem *bs)
> > +{
> > +	struct vdec_vp9_slice_uncompressed_header *uh;
> > +	unsigned int rows_log2;
> > +	unsigned int cols_log2;
> > +	unsigned int rows;
> > +	unsigned int cols;
> > +	unsigned int mi_row;
> > +	unsigned int mi_col;
> > +	unsigned int offset;
> > +	unsigned int pa;
> > +	unsigned int size;
> > +	struct vdec_vp9_slice_tiles *tiles;
> > +	unsigned char *pos;
> > +	unsigned char *end;
> > +	unsigned char *va;
> > +	unsigned int *tb;
> > +	int i;
> > +	int j;
> > +
> > +	uh =3D &vsi->frame.uh;
> > +	rows_log2 =3D uh->tile_rows_log2;
> > +	cols_log2 =3D uh->tile_cols_log2;
> > +	rows =3D 1 << rows_log2;
> > +	cols =3D 1 << cols_log2;
> > +
> > +	if (rows > 4 || cols > 64) {
> > +		mtk_vcodec_err(instance, "tile_rows %u tile_cols %u\n",
> > +			       rows, cols);
> > +		return -EINVAL;
> > +	}
> > +
> > +	offset =3D uh->uncompressed_header_size +
> > +		uh->header_size_in_bytes;
> > +	if (bs->size <=3D offset) {
> > +		mtk_vcodec_err(instance, "bs size %zu tile offset %u\n",
> > +			       bs->size, offset);
> > +		return -EINVAL;
> > +	}
> > +
> > +	tiles =3D &vsi->frame.tiles;
> > +	/* setup tile buffer */
> > +
> > +	va =3D (unsigned char *)bs->va;
> > +	pos =3D va + offset;
> > +	end =3D va + bs->size;
> > +	/* truncated */
> > +	pa =3D (unsigned int)bs->dma_addr + offset;
> > +	tb =3D instance->tile.va;
> > +	for (i =3D 0; i < rows; i++) {
> > +		for (j =3D 0; j < cols; j++) {
> > +			if (i =3D=3D rows - 1 &&
> > +			    j =3D=3D cols - 1) {
> > +				size =3D (unsigned int)(end - pos);
> > +			} else {
> > +				if (end - pos < 4)
> > +					return -EINVAL;
> > +
> > +				size =3D (pos[0] << 24) | (pos[1] << 16) |
> > +					(pos[2] << 8) | pos[3];
> > +				pos +=3D 4;
> > +				pa +=3D 4;
> > +				offset +=3D 4;
> > +				if (end - pos < size)
> > +					return -EINVAL;
> > +			}
> > +			tiles->size[i][j] =3D size;
> > +			if (tiles->mi_rows[i]) {
> > +				*tb++ =3D (size << 3) + ((offset << 3) & 0x7f);
> > +				*tb++ =3D pa & ~0xf;
> > +				*tb++ =3D (pa << 3) & 0x7f;
> > +				mi_row =3D (tiles->mi_rows[i] - 1) & 0x1ff;
> > +				mi_col =3D (tiles->mi_cols[j] - 1) & 0x3f;
> > +				*tb++ =3D (mi_row << 6) + mi_col;
> > +			}
> > +			pos +=3D size;
> > +			pa +=3D size;
> > +			offset +=3D size;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *in=
stance,
> > +				    struct mtk_vcodec_mem *bs,
> > +				    struct vdec_lat_buf *lat_buf,
> > +				    struct vdec_vp9_slice_pfc *pfc)
> > +{
> > +	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> > +	int ret;
> > +
> > +	ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D vdec_vp9_slice_setup_pfc(instance, pfc);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D vdec_vp9_slice_alloc_working_buffer(instance, vsi);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> > +	if (ret)
> > +		goto err;
> > +
> > +	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> > +
> > +	/* setup prob/tile buffers for LAT */
> > +
> > +	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> > +	if (ret)
> > +		goto err;
> > +
> > +	return 0;
> > +
> > +err:
> > +	return ret;
> > +}
> > +
> > +static
> > +void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j=
, unsigned int k,
> > +					struct vdec_vp9_slice_frame_counts *counts,
> > +					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> > +{
> > +	u32 l, m;
> > +
> > +	/*
> > +	 * helper eo -> mtk eo
> > +	 * helpre e1 -> mtk c3
> > +	 * helper c0 -> c0
> > +	 * helper c1 -> c1
> > +	 * helper c2 -> c2
> > +	 */
> > +	for (l =3D 0; l < 6; l++) {
> > +		for (m =3D 0; m < VP9_BAND_6(l); m++) {
> > +			if (l =3D=3D 0) {
> > +				counts_helper->coeff[i][j][k][l][m] =3D
> > +					&counts->coef_probs[i][j][k].band_0[m];
> > +				counts_helper->eob[i][j][k][l][m][0] =3D
> > +					&counts->eob_branch[i][j][k].band_0[m];
> > +				counts_helper->eob[i][j][k][l][m][1] =3D
> > +					&counts->coef_probs[i][j][k].band_0[m][3];
> > +			} else {
> > +				counts_helper->coeff[i][j][k][l][m] =3D
> > +					&counts->coef_probs[i][j][k].band_1_5[l - 1][m];
> > +				counts_helper->eob[i][j][k][l][m][0] =3D
> > +					&counts->eob_branch[i][j][k].band_1_5[l - 1][m];
> > +				counts_helper->eob[i][j][k][l][m][1] =3D
> > +					&counts->coef_probs[i][j][k].band_1_5[l - 1][m][3];
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +static void vdec_vp9_slice_counts_map_helper(struct vdec_vp9_slice_cou=
nts_map *counts_map,
> > +					     struct vdec_vp9_slice_frame_counts *counts,
> > +					     struct v4l2_vp9_frame_symbol_counts *counts_helper)
> > +{
> > +	int i, j, k, l, m;
> > +
> > +	counts_helper->partition =3D &counts->partition;
> > +	counts_helper->intra_inter =3D &counts->intra_inter;
> > +	counts_helper->tx32p =3D &counts->tx_p32x32;
> > +	counts_helper->tx16p =3D &counts->tx_p16x16;
> > +	counts_helper->tx8p =3D &counts->tx_p8x8;
> > +	counts_helper->uv_mode =3D &counts->uv_mode;
> > +
> > +	counts_helper->comp =3D &counts->comp_inter;
> > +	counts_helper->comp_ref =3D &counts->comp_ref;
> > +	counts_helper->single_ref =3D &counts->single_ref;
> > +	counts_helper->mv_mode =3D &counts->inter_mode;
> > +	counts_helper->mv_joint =3D &counts->joint;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->skip); i++)
> > +		memcpy(counts_map->skip[i], counts->skip[i],
> > +		       sizeof(counts_map->skip[0]));
> > +	counts_helper->skip =3D &counts_map->skip;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->y_mode); i++)
> > +		memcpy(counts_map->y_mode[i], counts->y_mode[i],
> > +		       sizeof(counts_map->y_mode[0]));
> > +	counts_helper->y_mode =3D &counts_map->y_mode;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->filter); i++)
> > +		memcpy(counts_map->filter[i], counts->switchable_interp[i],
> > +		       sizeof(counts_map->filter[0]));
> > +	counts_helper->filter =3D &counts_map->filter;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->sign); i++)
> > +		memcpy(counts_map->sign[i], counts->mvcomp[i].sign,
> > +		       sizeof(counts_map->sign[0]));
> > +	counts_helper->sign =3D &counts_map->sign;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->classes); i++)
> > +		memcpy(counts_map->classes[i], counts->mvcomp[i].classes,
> > +		       sizeof(counts_map->classes[0]));
> > +	counts_helper->classes =3D &counts_map->classes;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->class0); i++)
> > +		memcpy(counts_map->class0[i], counts->mvcomp[i].class0,
> > +		       sizeof(counts_map->class0[0]));
> > +	counts_helper->class0 =3D &counts_map->class0;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->bits); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(counts_map->bits[0]); j++)
> > +			memcpy(counts_map->bits[i][j], counts->mvcomp[i].bits[j],
> > +			       sizeof(counts_map->bits[0][0]));
> > +	counts_helper->bits =3D &counts_map->bits;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->class0_fp); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(counts_map->class0_fp[0]); j++)
> > +			memcpy(counts_map->class0_fp[i][j], counts->mvcomp[i].class0_fp[j],
> > +			       sizeof(counts_map->class0_fp[0][0]));
> > +	counts_helper->class0_fp =3D &counts_map->class0_fp;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->fp); i++)
> > +		memcpy(counts_map->fp[i], counts->mvcomp[i].fp,
> > +		       sizeof(counts_map->fp[0]));
> > +	counts_helper->fp =3D &counts_map->fp;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->class0_hp); i++)
> > +		memcpy(counts_map->class0_hp[i], counts->mvcomp[i].class0_hp,
> > +		       sizeof(counts_map->class0_hp[0]));
> > +	counts_helper->class0_hp =3D &counts_map->class0_hp;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(counts_map->hp); i++)
> > +		memcpy(counts_map->hp[i], counts->mvcomp[i].hp, sizeof(counts_map->h=
p[0]));
> > +
> > +	counts_helper->hp =3D &counts_map->hp;
> > +
> > +	for (i =3D 0; i < 4; i++)
> > +		for (j =3D 0; j < 2; j++)
> > +			for (k =3D 0; k < 2; k++)
> > +				vdec_vp9_slice_map_counts_eob_coef(i, j, k, counts, counts_helper)=
;
> > +}
> > +
> > +static void vdec_vp9_slice_map_to_coef(unsigned int i, unsigned int j,=
 unsigned int k,
> > +				       struct vdec_vp9_slice_frame_ctx *frame_ctx,
> > +				       struct v4l2_vp9_frame_context *frame_ctx_helper)
> > +{
> > +	u32 l, m;
> > +
> > +	for (l =3D 0; l < ARRAY_SIZE(frame_ctx_helper->coef[0][0][0]); l++) {
> > +		for (m =3D 0; m < VP9_BAND_6(l); m++) {
> > +			memcpy(frame_ctx_helper->coef[i][j][k][l][m],
> > +			       frame_ctx->coef_probs[i][j][k][l].probs[m],
> > +			       sizeof(frame_ctx_helper->coef[i][j][k][l][0]));
> > +		}
> > +	}
> > +}
> > +
> > +static void vdec_vp9_slice_map_from_coef(unsigned int i, unsigned int =
j, unsigned int k,
> > +					 struct vdec_vp9_slice_frame_ctx *frame_ctx,
> > +					 struct v4l2_vp9_frame_context *frame_ctx_helper)
> > +{
> > +	u32 l, m;
> > +
> > +	for (l =3D 0; l < ARRAY_SIZE(frame_ctx_helper->coef[0][0][0]); l++) {
> > +		for (m =3D 0; m < VP9_BAND_6(l); m++) {
> > +			memcpy(frame_ctx->coef_probs[i][j][k][l].probs[m],
> > +			       frame_ctx_helper->coef[i][j][k][l][m],
> > +			       sizeof(frame_ctx_helper->coef[i][j][k][l][0]));
> > +		}
> > +	}
> > +}
> > +
> > +static
> > +void vdec_vp9_slice_framectx_map_helper(bool frame_is_intra,
> > +					struct vdec_vp9_slice_frame_ctx *pre_frame_ctx,
> > +					struct vdec_vp9_slice_frame_ctx *frame_ctx,
> > +					struct v4l2_vp9_frame_context *frame_ctx_helper)
> > +{
> > +	struct v4l2_vp9_frame_mv_context *mv =3D &frame_ctx_helper->mv;
> > +	u32 i, j, k;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->coef); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(frame_ctx_helper->coef[0]); j++)
> > +			for (k =3D 0; k < ARRAY_SIZE(frame_ctx_helper->coef[0][0]); k++)
> > +				vdec_vp9_slice_map_to_coef(i, j, k, pre_frame_ctx,
> > +							   frame_ctx_helper);
> > +
> > +	/*
> > +	 * use previous prob when frame is not intra or
> > +	 * we should use the prob updated by the compressed header parse
> > +	 */
> > +	if (!frame_is_intra)
> > +		frame_ctx =3D pre_frame_ctx;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx8); i++)
> > +		memcpy(frame_ctx_helper->tx8[i], frame_ctx->tx_p8x8[i],
> > +		       sizeof(frame_ctx_helper->tx8[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx16); i++)
> > +		memcpy(frame_ctx_helper->tx16[i], frame_ctx->tx_p16x16[i],
> > +		       sizeof(frame_ctx_helper->tx16[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx32); i++)
> > +		memcpy(frame_ctx_helper->tx32[i], frame_ctx->tx_p32x32[i],
> > +		       sizeof(frame_ctx_helper->tx32[0]));
> > +
> > +	memcpy(frame_ctx_helper->skip, frame_ctx->skip_probs, sizeof(frame_ct=
x_helper->skip));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->inter_mode); i++)
> > +		memcpy(frame_ctx_helper->inter_mode[i], frame_ctx->inter_mode_probs[=
i],
> > +		       sizeof(frame_ctx_helper->inter_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->interp_filter); i++)
> > +		memcpy(frame_ctx_helper->interp_filter[i], frame_ctx->switch_interp_=
prob[i],
> > +		       sizeof(frame_ctx_helper->interp_filter[0]));
> > +
> > +	memcpy(frame_ctx_helper->is_inter, frame_ctx->intra_inter_prob,
> > +	       sizeof(frame_ctx_helper->is_inter));
> > +
> > +	memcpy(frame_ctx_helper->comp_mode, frame_ctx->comp_inter_prob,
> > +	       sizeof(frame_ctx_helper->comp_mode));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->single_ref); i++)
> > +		memcpy(frame_ctx_helper->single_ref[i], frame_ctx->single_ref_prob[i=
],
> > +		       sizeof(frame_ctx_helper->single_ref[0]));
> > +
> > +	memcpy(frame_ctx_helper->comp_ref, frame_ctx->comp_ref_prob,
> > +	       sizeof(frame_ctx_helper->comp_ref));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->y_mode); i++)
> > +		memcpy(frame_ctx_helper->y_mode[i], frame_ctx->y_mode_prob[i],
> > +		       sizeof(frame_ctx_helper->y_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->uv_mode); i++)
> > +		memcpy(frame_ctx_helper->uv_mode[i], frame_ctx->uv_mode_prob[i],
> > +		       sizeof(frame_ctx_helper->uv_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->partition); i++)
> > +		memcpy(frame_ctx_helper->partition[i], frame_ctx->partition_prob[i],
> > +		       sizeof(frame_ctx_helper->partition[0]));
> > +
> > +	memcpy(mv->joint, frame_ctx->joint, sizeof(mv->joint));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->sign); i++)
> > +		mv->sign[i] =3D frame_ctx->sign_classes[i].sign;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->classes); i++)
> > +		memcpy(mv->classes[i], frame_ctx->sign_classes[i].classes,
> > +		       sizeof(mv->classes[i]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_bit); i++)
> > +		mv->class0_bit[i] =3D frame_ctx->class0_bits[i].class0[0];
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->bits); i++)
> > +		memcpy(mv->bits[i], frame_ctx->class0_bits[i].bits, sizeof(mv->bits[=
0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_fr); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(mv->class0_fr[0]); j++)
> > +			memcpy(mv->class0_fr[i][j], frame_ctx->class0_fp_hp[i].class0_fp[j]=
,
> > +			       sizeof(mv->class0_fr[0][0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->fr); i++)
> > +		memcpy(mv->fr[i], frame_ctx->class0_fp_hp[i].fp, sizeof(mv->fr[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_hp); i++)
> > +		mv->class0_hp[i] =3D frame_ctx->class0_fp_hp[i].class0_hp;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->hp); i++)
> > +		mv->hp[i] =3D frame_ctx->class0_fp_hp[i].hp;
> > +}
> > +
> > +static void vdec_vp9_slice_helper_map_framectx(struct v4l2_vp9_frame_c=
ontext *frame_ctx_helper,
> > +					       struct vdec_vp9_slice_frame_ctx *frame_ctx)
> > +{
> > +	struct v4l2_vp9_frame_mv_context *mv =3D &frame_ctx_helper->mv;
> > +	u32 i, j, k;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx8); i++)
> > +		memcpy(frame_ctx->tx_p8x8[i], frame_ctx_helper->tx8[i],
> > +		       sizeof(frame_ctx_helper->tx8[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx16); i++)
> > +		memcpy(frame_ctx->tx_p16x16[i], frame_ctx_helper->tx16[i],
> > +		       sizeof(frame_ctx_helper->tx16[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->tx32); i++)
> > +		memcpy(frame_ctx->tx_p32x32[i], frame_ctx_helper->tx32[i],
> > +		       sizeof(frame_ctx_helper->tx32[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->coef); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(frame_ctx_helper->coef[0]); j++)
> > +			for (k =3D 0; k < ARRAY_SIZE(frame_ctx_helper->coef[0][0]); k++)
> > +				vdec_vp9_slice_map_from_coef(i, j, k, frame_ctx,
> > +							     frame_ctx_helper);
> > +
> > +	memcpy(frame_ctx->skip_probs, frame_ctx_helper->skip, sizeof(frame_ct=
x_helper->skip));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->inter_mode); i++)
> > +		memcpy(frame_ctx->inter_mode_probs[i], frame_ctx_helper->inter_mode[=
i],
> > +		       sizeof(frame_ctx_helper->inter_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->interp_filter); i++)
> > +		memcpy(frame_ctx->switch_interp_prob[i], frame_ctx_helper->interp_fi=
lter[i],
> > +		       sizeof(frame_ctx_helper->interp_filter[0]));
> > +
> > +	memcpy(frame_ctx->intra_inter_prob, frame_ctx_helper->is_inter,
> > +	       sizeof(frame_ctx_helper->is_inter));
> > +
> > +	memcpy(frame_ctx->comp_inter_prob, frame_ctx_helper->comp_mode,
> > +	       sizeof(frame_ctx_helper->comp_mode));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->single_ref); i++)
> > +		memcpy(frame_ctx->single_ref_prob[i], frame_ctx_helper->single_ref[i=
],
> > +		       sizeof(frame_ctx_helper->single_ref[0]));
> > +
> > +	memcpy(frame_ctx->comp_ref_prob, frame_ctx_helper->comp_ref,
> > +	       sizeof(frame_ctx_helper->comp_ref));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->y_mode); i++)
> > +		memcpy(frame_ctx->y_mode_prob[i], frame_ctx_helper->y_mode[i],
> > +		       sizeof(frame_ctx_helper->y_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->uv_mode); i++)
> > +		memcpy(frame_ctx->uv_mode_prob[i], frame_ctx_helper->uv_mode[i],
> > +		       sizeof(frame_ctx_helper->uv_mode[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(frame_ctx_helper->partition); i++)
> > +		memcpy(frame_ctx->partition_prob[i], frame_ctx_helper->partition[i],
> > +		       sizeof(frame_ctx_helper->partition[0]));
> > +
> > +	memcpy(frame_ctx->joint, mv->joint, sizeof(mv->joint));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->sign); i++)
> > +		frame_ctx->sign_classes[i].sign =3D mv->sign[i];
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->classes); i++)
> > +		memcpy(frame_ctx->sign_classes[i].classes, mv->classes[i],
> > +		       sizeof(mv->classes[i]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_bit); i++)
> > +		frame_ctx->class0_bits[i].class0[0] =3D mv->class0_bit[i];
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->bits); i++)
> > +		memcpy(frame_ctx->class0_bits[i].bits, mv->bits[i], sizeof(mv->bits[=
0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_fr); i++)
> > +		for (j =3D 0; j < ARRAY_SIZE(mv->class0_fr[0]); j++)
> > +			memcpy(frame_ctx->class0_fp_hp[i].class0_fp[j], mv->class0_fr[i][j]=
,
> > +			       sizeof(mv->class0_fr[0][0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->fr); i++)
> > +		memcpy(frame_ctx->class0_fp_hp[i].fp, mv->fr[i], sizeof(mv->fr[0]));
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->class0_hp); i++)
> > +		frame_ctx->class0_fp_hp[i].class0_hp =3D mv->class0_hp[i];
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(mv->hp); i++)
> > +		frame_ctx->class0_fp_hp[i].hp =3D mv->hp[i];
> > +}
> > +
> > +static int vdec_vp9_slice_update_prob(struct vdec_vp9_slice_instance *=
instance,
> > +				      struct vdec_vp9_slice_vsi *vsi)
> > +{
> > +	struct vdec_vp9_slice_frame_ctx *pre_frame_ctx;
> > +	struct v4l2_vp9_frame_context *pre_frame_ctx_helper;
> > +	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> > +	struct vdec_vp9_slice_frame_counts *counts;
> > +	struct v4l2_vp9_frame_symbol_counts *counts_helper;
> > +	struct vdec_vp9_slice_uncompressed_header *uh;
> > +	bool frame_is_intra;
> > +	bool use_128;
> > +
> > +	uh =3D &vsi->frame.uh;
> > +	pre_frame_ctx =3D &instance->frame_ctx[uh->frame_context_idx];
> > +	pre_frame_ctx_helper =3D &instance->frame_ctx_helper;
> > +	frame_ctx =3D (struct vdec_vp9_slice_frame_ctx *)instance->prob.va;
> > +	counts =3D (struct vdec_vp9_slice_frame_counts *)instance->counts.va;
> > +	counts_helper =3D &instance->counts_helper;
> > +
> > +	if (!uh->refresh_frame_context)
> > +		return 0;
> > +
> > +	if (!uh->frame_parallel_decoding_mode) {
> > +		vdec_vp9_slice_counts_map_helper(&instance->counts_map, counts, coun=
ts_helper);
> > +
> > +		frame_is_intra =3D !vsi->frame.uh.frame_type || vsi->frame.uh.intra_=
only;
> > +		/* check default prob */
> > +		if (!instance->dirty[uh->frame_context_idx])
> > +			vdec_vp9_slice_framectx_map_helper(frame_is_intra,
> > +							   vdec_vp9_slice_default_frame_ctx,
> > +							   frame_ctx,
> > +							   pre_frame_ctx_helper);
> > +		else
> > +			vdec_vp9_slice_framectx_map_helper(frame_is_intra,
> > +							   pre_frame_ctx,
> > +							   frame_ctx,
> > +							   pre_frame_ctx_helper);
> > +
> > +		use_128 =3D !frame_is_intra && !vsi->frame.uh.last_frame_type;
> > +		v4l2_vp9_adapt_coef_probs(pre_frame_ctx_helper,
> > +					  counts_helper,
> > +					  use_128,
> > +					  frame_is_intra);
> > +		if (!frame_is_intra)
> > +			v4l2_vp9_adapt_noncoef_probs(pre_frame_ctx_helper,
> > +						     counts_helper,
> > +						     V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE,
> > +						     vsi->frame.uh.interpolation_filter,
> > +						     vsi->frame.ch.tx_mode,
> > +						     vsi->frame.uh.allow_high_precision_mv ?
> > +						     V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV : 0);
> > +		vdec_vp9_slice_helper_map_framectx(pre_frame_ctx_helper, pre_frame_c=
tx);
> > +	} else {
> > +		memcpy(pre_frame_ctx, frame_ctx, sizeof(*frame_ctx));
> > +	}
> > +
> > +	instance->dirty[uh->frame_context_idx] =3D 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *i=
nstance,
> > +				     struct vdec_lat_buf *lat_buf,
> > +				     struct vdec_vp9_slice_pfc *pfc)
> > +{
> > +	struct vdec_vp9_slice_vsi *vsi;
> > +
> > +	vsi =3D &pfc->vsi;
> > +	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
> > +
> > +	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
> > +			 pfc->seq, vsi->state.crc[0],
> > +			 (unsigned long)vsi->trans.dma_addr,
> > +			 (unsigned long)vsi->trans.dma_addr_end);
> > +
> > +	/* buffer full, need to re-decode */
> > +	if (vsi->state.full) {
> > +		/* buffer not enough */
> > +		if (vsi->trans.dma_addr_end - vsi->trans.dma_addr =3D=3D
> > +			vsi->ube.size)
> > +			return -ENOMEM;
> > +		return -EAGAIN;
> > +	}
> > +
> > +	vdec_vp9_slice_update_prob(instance, vsi);
> > +
> > +	instance->width =3D vsi->frame.uh.frame_width;
> > +	instance->height =3D vsi->frame.uh.frame_height;
> > +	instance->frame_type =3D vsi->frame.uh.frame_type;
> > +	instance->show_frame =3D vsi->frame.uh.show_frame;
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_core_to_dst_buf(struct vdec_vp9_slice_=
instance *instance,
> > +						struct vdec_lat_buf *lat_buf)
> > +{
> > +	struct vb2_v4l2_buffer *dst;
> > +
> > +	dst =3D v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
> > +	if (!dst)
> > +		return -EINVAL;
> > +
> > +	v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, dst, true);
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_inst=
ance *instance,
> > +					    struct vdec_vp9_slice_pfc *pfc,
> > +					    struct vdec_vp9_slice_vsi *vsi,
> > +					    struct vdec_fb *fb,
> > +					    struct vdec_lat_buf *lat_buf)
> > +{
> > +	struct vb2_buffer *vb;
> > +	struct vb2_queue *vq;
> > +	struct vdec_vp9_slice_reference *ref;
> > +	int plane;
> > +	int size;
> > +	int idx;
> > +	int w;
> > +	int h;
> > +	int i;
> > +
> > +	plane =3D instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
> > +	w =3D vsi->frame.uh.frame_width;
> > +	h =3D vsi->frame.uh.frame_height;
> > +	size =3D ALIGN(w, 64) * ALIGN(h, 64);
> > +
> > +	/* frame buffer */
> > +	vsi->fb.y.dma_addr =3D fb->base_y.dma_addr;
> > +	if (plane =3D=3D 1)
> > +		vsi->fb.c.dma_addr =3D fb->base_y.dma_addr + size;
> > +	else
> > +		vsi->fb.c.dma_addr =3D fb->base_c.dma_addr;
> > +
> > +	/* reference buffers */
> > +	vq =3D v4l2_m2m_get_vq(instance->ctx->m2m_ctx,
> > +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > +	if (!vq)
> > +		return -EINVAL;
> > +
> > +	/* get current output buffer */
> > +	vb =3D &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
> > +	if (!vb)
> > +		return -EINVAL;
> > +
> > +	/* update internal buffer's width/height */
> > +	for (i =3D 0; i < vq->num_buffers; i++) {
> > +		if (vb =3D=3D vq->bufs[i]) {
> > +			instance->dpb[i].width =3D w;
> > +			instance->dpb[i].height =3D h;
> > +			break;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * get buffer's width/height from instance
> > +	 * get buffer address from vb2buf
> > +	 */
> > +	for (i =3D 0; i < 3; i++) {
> > +		ref =3D &vsi->frame.ref[i];
> > +		idx =3D vb2_find_timestamp(vq, pfc->ref_idx[i], 0);
> > +		if (idx < 0) {
> > +			ref->frame_width =3D w;
> > +			ref->frame_height =3D h;
> > +			memset(&vsi->ref[i], 0, sizeof(vsi->ref[i]));
> > +		} else {
> > +			ref->frame_width =3D instance->dpb[idx].width;
> > +			ref->frame_height =3D instance->dpb[idx].height;
> > +			vb =3D vq->bufs[idx];
> > +			vsi->ref[i].y.dma_addr =3D
> > +				vb2_dma_contig_plane_dma_addr(vb, 0);
> > +			if (plane =3D=3D 1)
> > +				vsi->ref[i].c.dma_addr =3D
> > +					vsi->ref[i].y.dma_addr + size;
> > +			else
> > +				vsi->ref[i].c.dma_addr =3D
> > +					vb2_dma_contig_plane_dma_addr(vb, 1);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *i=
nstance,
> > +				     struct vdec_fb *fb,
> > +				     struct vdec_lat_buf *lat_buf,
> > +				     struct vdec_vp9_slice_pfc *pfc)
> > +{
> > +	struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
> > +	int ret;
> > +
> > +	vdec_vp9_slice_setup_state(vsi);
> > +
> > +	ret =3D vdec_vp9_slice_setup_core_to_dst_buf(instance, lat_buf);
> > +	if (ret)
> > +		goto err;
> > +
> > +	ret =3D vdec_vp9_slice_setup_core_buffer(instance, pfc, vsi, fb, lat_=
buf);
> > +	if (ret)
> > +		goto err;
> > +
> > +	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[1]);
> > +
> > +	return 0;
> > +
> > +err:
> > +	return ret;
> > +}
> > +
> > +static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *=
instance,
> > +				      struct vdec_lat_buf *lat_buf,
> > +				      struct vdec_vp9_slice_pfc *pfc)
> > +{
> > +	struct vdec_vp9_slice_vsi *vsi;
> > +
> > +	vsi =3D &pfc->vsi;
> > +	memcpy(&pfc->state[1], &vsi->state, sizeof(vsi->state));
> > +
> > +	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
> > +			 pfc->seq,
> > +			 vsi->state.crc[0], vsi->state.crc[1],
> > +			 vsi->state.crc[2], vsi->state.crc[3]);
> > +	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
> > +			 pfc->seq,
> > +			 vsi->state.crc[4], vsi->state.crc[5],
> > +			 vsi->state.crc[6], vsi->state.crc[7]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_init(struct mtk_vcodec_ctx *ctx)
> > +{
> > +	struct vdec_vp9_slice_instance *instance;
> > +	struct vdec_vp9_slice_init_vsi *vsi;
> > +	int ret;
> > +
> > +	instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
> > +	if (!instance)
> > +		return -ENOMEM;
> > +
> > +	instance->ctx =3D ctx;
> > +	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> > +	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> > +	instance->vpu.ctx =3D ctx;
> > +	instance->vpu.codec_type =3D ctx->current_codec;
> > +
> > +	ret =3D vpu_dec_init(&instance->vpu);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "failed to init vpu dec, ret %d\n", ret);
> > +		goto error_vpu_init;
> > +	}
> > +
> > +	/* init vsi and global flags */
> > +
> > +	vsi =3D instance->vpu.vsi;
> > +	if (!vsi) {
> > +		mtk_vcodec_err(instance, "failed to get VP9 vsi\n");
> > +		ret =3D -EINVAL;
> > +		goto error_vsi;
> > +	}
> > +	instance->init_vsi =3D vsi;
> > +	instance->core_vsi =3D mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler=
,
> > +						       (u32)vsi->core_vsi);
> > +	if (!instance->core_vsi) {
> > +		mtk_vcodec_err(instance, "failed to get VP9 core vsi\n");
> > +		ret =3D -EINVAL;
> > +		goto error_vsi;
> > +	}
> > +
> > +	instance->irq =3D 1;
> > +
> > +	ret =3D vdec_vp9_slice_init_default_frame_ctx(instance);
> > +	if (ret)
> > +		goto error_default_frame_ctx;
> > +
> > +	ctx->drv_handle =3D instance;
> > +
> > +	return 0;
> > +
> > +error_default_frame_ctx:
> > +error_vsi:
> > +	vpu_dec_deinit(&instance->vpu);
> > +error_vpu_init:
> > +	kfree(instance);
> > +	return ret;
> > +}
> > +
> > +static void vdec_vp9_slice_deinit(void *h_vdec)
> > +{
> > +	struct vdec_vp9_slice_instance *instance =3D h_vdec;
> > +
> > +	if (!instance)
> > +		return;
> > +
> > +	vpu_dec_deinit(&instance->vpu);
> > +	vdec_vp9_slice_free_working_buffer(instance);
> > +	vdec_msg_queue_deinit(&instance->ctx->msg_queue, instance->ctx);
> > +	kfree(instance);
> > +}
> > +
> > +static int vdec_vp9_slice_flush(void *h_vdec, struct mtk_vcodec_mem *b=
s,
> > +				struct vdec_fb *fb, bool *res_chg)
> > +{
> > +	struct vdec_vp9_slice_instance *instance =3D h_vdec;
> > +
> > +	mtk_vcodec_debug(instance, "flush ...\n");
> > +
> > +	vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
> > +	return vpu_dec_reset(&instance->vpu);
> > +}
> > +
> > +static void vdec_vp9_slice_get_pic_info(struct vdec_vp9_slice_instance=
 *instance)
> > +{
> > +	struct mtk_vcodec_ctx *ctx =3D instance->ctx;
> > +	unsigned int data[3];
> > +
> > +	mtk_vcodec_debug(instance, "w %u h %u\n",
> > +			 ctx->picinfo.pic_w, ctx->picinfo.pic_h);
> > +
> > +	data[0] =3D ctx->picinfo.pic_w;
> > +	data[1] =3D ctx->picinfo.pic_h;
> > +	data[2] =3D ctx->capture_fourcc;
> > +	vpu_dec_get_param(&instance->vpu, data, 3, GET_PARAM_PIC_INFO);
> > +
> > +	ctx->picinfo.buf_w =3D ALIGN(ctx->picinfo.pic_w, 64);
> > +	ctx->picinfo.buf_h =3D ALIGN(ctx->picinfo.pic_h, 64);
> > +	ctx->picinfo.fb_sz[0] =3D instance->vpu.fb_sz[0];
> > +	ctx->picinfo.fb_sz[1] =3D instance->vpu.fb_sz[1];
> > +}
> > +
> > +static void vdec_vp9_slice_get_dpb_size(struct vdec_vp9_slice_instance=
 *instance,
> > +					unsigned int *dpb_sz)
> > +{
> > +	/* refer VP9 specification */
> > +	*dpb_sz =3D 9;
> > +}
> > +
> > +static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_=
type type, void *out)
> > +{
> > +	struct vdec_vp9_slice_instance *instance =3D h_vdec;
> > +
> > +	switch (type) {
> > +	case GET_PARAM_PIC_INFO:
> > +		vdec_vp9_slice_get_pic_info(instance);
> > +		break;
> > +	case GET_PARAM_DPB_SIZE:
> > +		vdec_vp9_slice_get_dpb_size(instance, out);
> > +		break;
> > +	case GET_PARAM_CROP_INFO:
> > +		mtk_vcodec_debug(instance, "No need to get vp9 crop information.");
> > +		break;
> > +	default:
> > +		mtk_vcodec_err(instance, "invalid get parameter type=3D%d\n",
> > +			       type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_m=
em *bs,
> > +				     struct vdec_fb *fb, bool *res_chg)
> > +{
> > +	struct vdec_vp9_slice_instance *instance =3D h_vdec;
> > +	struct vdec_lat_buf *lat_buf;
> > +	struct vdec_vp9_slice_pfc *pfc;
> > +	struct vdec_vp9_slice_vsi *vsi;
> > +	struct mtk_vcodec_ctx *ctx;
> > +	int ret;
> > +
> > +	if (!instance || !instance->ctx)
> > +		return -EINVAL;
> > +	ctx =3D instance->ctx;
> > +
> > +	/* init msgQ for the first time */
> > +	if (vdec_msg_queue_init(&ctx->msg_queue, ctx,
> > +				vdec_vp9_slice_core_decode,
> > +				sizeof(*pfc)))
> > +		return -ENOMEM;
> > +
> > +	/* bs NULL means flush decoder */
> > +	if (!bs)
> > +		return vdec_vp9_slice_flush(h_vdec, bs, fb, res_chg);
> > +
> > +	lat_buf =3D vdec_msg_queue_dqbuf(&instance->ctx->msg_queue.lat_ctx);
> > +	if (!lat_buf) {
> > +		mtk_vcodec_err(instance, "Failed to get VP9 lat buf\n");
> > +		return -EBUSY;
> > +	}
> > +	pfc =3D (struct vdec_vp9_slice_pfc *)lat_buf->private_data;
> > +	if (!pfc)
> > +		return -EINVAL;
> > +	vsi =3D &pfc->vsi;
> > +
> > +	ret =3D vdec_vp9_slice_setup_lat(instance, bs, lat_buf, pfc);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "Failed to setup VP9 lat ret %d\n", ret);
> > +		return ret;
> > +	}
> > +	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
> > +
> > +	ret =3D vpu_dec_start(&instance->vpu, 0, 0);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (instance->irq) {
> > +		ret =3D mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
> > +						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
> > +		/* update remote vsi if decode timeout */
> > +		if (ret) {
> > +			mtk_vcodec_err(instance, "VP9 decode timeout %d pic %d\n", ret, pfc=
->seq);
> > +			writel(1, &instance->vsi->state.timeout);
> > +		}
> > +		vpu_dec_end(&instance->vpu);
> > +	}
> > +
> > +	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
> > +	ret =3D vdec_vp9_slice_update_lat(instance, lat_buf, pfc);
> > +
> > +	/* LAT trans full, no more UBE or decode timeout */
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	mtk_vcodec_debug(instance, "lat dma 1 0x%llx 0x%llx\n",
> > +			 pfc->vsi.trans.dma_addr, pfc->vsi.trans.dma_addr_end);
> > +
> > +	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
> > +				       vsi->trans.dma_addr_end +
> > +				       ctx->msg_queue.wdma_addr.dma_addr);
> > +	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
> > +
> > +	return 0;
> > +}
> > +
> > +static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > +{
> > +	struct vdec_vp9_slice_instance *instance;
> > +	struct vdec_vp9_slice_pfc *pfc;
> > +	struct mtk_vcodec_ctx *ctx =3D NULL;
> > +	struct vdec_fb *fb =3D NULL;
> > +	int ret =3D -EINVAL;
> > +
> > +	if (!lat_buf)
> > +		goto err;
> > +
> > +	pfc =3D lat_buf->private_data;
> > +	ctx =3D lat_buf->ctx;
> > +	if (!pfc || !ctx)
> > +		goto err;
> > +
> > +	instance =3D ctx->drv_handle;
> > +	if (!instance)
> > +		goto err;
> > +
> > +	fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> > +	if (!fb) {
> > +		ret =3D -EBUSY;
> > +		goto err;
> > +	}
> > +
> > +	ret =3D vdec_vp9_slice_setup_core(instance, fb, lat_buf, pfc);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "vdec_vp9_slice_setup_core\n");
> > +		goto err;
> > +	}
> > +	vdec_vp9_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
> > +
> > +	ret =3D vpu_dec_core(&instance->vpu);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "vpu_dec_core\n");
> > +		goto err;
> > +	}
> > +
> > +	if (instance->irq) {
> > +		ret =3D mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
> > +						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
> > +		/* update remote vsi if decode timeout */
> > +		if (ret) {
> > +			mtk_vcodec_err(instance, "VP9 core timeout pic %d\n", pfc->seq);
> > +			writel(1, &instance->core_vsi->state.timeout);
> > +		}
> > +		vpu_dec_core_end(&instance->vpu);
> > +	}
> > +
> > +	vdec_vp9_slice_vsi_from_remote(&pfc->vsi, instance->core_vsi, 1);
> > +	ret =3D vdec_vp9_slice_update_core(instance, lat_buf, pfc);
> > +	if (ret) {
> > +		mtk_vcodec_err(instance, "vdec_vp9_slice_update_core\n");
> > +		goto err;
> > +	}
> > +
> > +	pfc->vsi.trans.dma_addr_end +=3D ctx->msg_queue.wdma_addr.dma_addr;
> > +	mtk_vcodec_debug(instance, "core dma_addr_end 0x%llx\n", pfc->vsi.tra=
ns.dma_addr_end);
> > +	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_ad=
dr_end);
> > +	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> > +
> > +	return 0;
> > +
> > +err:
> > +	if (ctx) {
> > +		/* always update read pointer */
> > +		vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_a=
ddr_end);
> > +
> > +		if (fb)
> > +			ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
> > +	}
> > +	return ret;
> > +}
> > +
> > +const struct vdec_common_if vdec_vp9_slice_lat_if =3D {
> > +	.init		=3D vdec_vp9_slice_init,
> > +	.decode		=3D vdec_vp9_slice_lat_decode,
> > +	.get_param	=3D vdec_vp9_slice_get_param,
> > +	.deinit		=3D vdec_vp9_slice_deinit,
> > +};
> > diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c b/dri=
vers/media/platform/mediatek/vcodec/vdec_drv_if.c
> > index b709c7bae197..27b4b35039cf 100644
> > --- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
> > @@ -45,6 +45,10 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigne=
d int fourcc)
> >  		ctx->dec_if =3D &vdec_vp9_if;
> >  		ctx->hw_id =3D MTK_VDEC_CORE;
> >  		break;
> > +	case V4L2_PIX_FMT_VP9_FRAME:
> > +		ctx->dec_if =3D &vdec_vp9_slice_lat_if;
> > +		ctx->hw_id =3D MTK_VDEC_LAT0;
> > +		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h b/dri=
vers/media/platform/mediatek/vcodec/vdec_drv_if.h
> > index 97f6e324e623..076306ff2dd4 100644
> > --- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
> > +++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.h
> > @@ -60,6 +60,7 @@ extern const struct vdec_common_if vdec_h264_slice_mu=
lti_if;
> >  extern const struct vdec_common_if vdec_vp8_if;
> >  extern const struct vdec_common_if vdec_vp8_slice_if;
> >  extern const struct vdec_common_if vdec_vp9_if;
> > +extern const struct vdec_common_if vdec_vp9_slice_lat_if;
> > =20
> >  /**
> >   * vdec_if_init() - initialize decode driver
>=20

