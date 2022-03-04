Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F94CCF06
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 08:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEA810EC39;
	Fri,  4 Mar 2022 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410C810EC11
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 07:27:32 +0000 (UTC)
X-UUID: b8ce8015f59e4995a16062fe6f0c4e52-20220304
X-UUID: b8ce8015f59e4995a16062fe6f0c4e52-20220304
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 380931885; Fri, 04 Mar 2022 15:27:25 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 4 Mar 2022 15:27:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 15:27:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 15:27:21 +0800
Message-ID: <1f7d63dd5d8ae426791d4e901231dba6ab94d2c2.camel@mediatek.com>
Subject: Re: [PATCH v7, 07/15] media: mtk-vcodec: Refactor supported vdec
 formats and framesizes
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Fri, 4 Mar 2022 15:27:21 +0800
In-Reply-To: <777ced91106f5aba06e7cac6b6b1c80f42d25a1f.camel@ndufresne.ca>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-8-yunfei.dong@mediatek.com>
 <777ced91106f5aba06e7cac6b6b1c80f42d25a1f.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
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
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Steve
 Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for your suggestion.

On Tue, 2022-03-01 at 09:34 -0500, Nicolas Dufresne wrote:
> Le mercredi 23 février 2022 à 11:40 +0800, Yunfei Dong a écrit :
> > Supported output and capture format types for mt8192 are different
> > with mt8183. Needs to get format types according to decoder
> > capability.
> 
> This patch is both refactoring and changing the behaviour. Can you
> please split
> the non-functional changes from the functional one. This ensure we
> can proceed
> with a good review of the functional changes.
> 
I will split this patch. Thanks.

> regards,
> Nicolas
> 
Best Regards,
Yunfei Dong
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   8 +-
> >  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  13 +-
> >  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 117 +++++++++++++-
> > ----
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  13 +-
> >  4 files changed, 107 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 304f5afbd419..bae43938ee37 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -26,7 +26,7 @@ mtk_vdec_find_format(struct v4l2_format *f,
> >  	const struct mtk_video_fmt *fmt;
> >  	unsigned int k;
> >  
> > -	for (k = 0; k < dec_pdata->num_formats; k++) {
> > +	for (k = 0; k < *dec_pdata->num_formats; k++) {
> >  		fmt = &dec_pdata->vdec_formats[k];
> >  		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
> >  			return fmt;
> > @@ -525,7 +525,7 @@ static int vidioc_enum_framesizes(struct file
> > *file, void *priv,
> >  	if (fsize->index != 0)
> >  		return -EINVAL;
> >  
> > -	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
> > +	for (i = 0; i < *dec_pdata->num_framesizes; ++i) {
> >  		if (fsize->pixel_format != dec_pdata-
> > >vdec_framesizes[i].fourcc)
> >  			continue;
> >  
> > @@ -564,7 +564,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc
> > *f, void *priv,
> >  	const struct mtk_video_fmt *fmt;
> >  	int i, j = 0;
> >  
> > -	for (i = 0; i < dec_pdata->num_formats; i++) {
> > +	for (i = 0; i < *dec_pdata->num_formats; i++) {
> >  		if (output_queue &&
> >  		    dec_pdata->vdec_formats[i].type != MTK_FMT_DEC)
> >  			continue;
> > @@ -577,7 +577,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc
> > *f, void *priv,
> >  		++j;
> >  	}
> >  
> > -	if (i == dec_pdata->num_formats)
> > +	if (i == *dec_pdata->num_formats)
> >  		return -EINVAL;
> >  
> >  	fmt = &dec_pdata->vdec_formats[i];
> > diff --git a/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateful.c
> > index 7966c132be8f..3f33beb9c551 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > @@ -37,7 +37,9 @@ static const struct mtk_video_fmt
> > mtk_video_formats[] = {
> >  	},
> >  };
> >  
> > -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> > +static const unsigned int num_supported_formats =
> > +	ARRAY_SIZE(mtk_video_formats);
> > +
> >  #define DEFAULT_OUT_FMT_IDX 0
> >  #define DEFAULT_CAP_FMT_IDX 3
> >  
> > @@ -59,7 +61,8 @@ static const struct mtk_codec_framesizes
> > mtk_vdec_framesizes[] = {
> >  	},
> >  };
> >  
> > -#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> > +static const unsigned int num_supported_framesize =
> > +	ARRAY_SIZE(mtk_vdec_framesizes);
> >  
> >  /*
> >   * This function tries to clean all display buffers, the buffers
> > will return
> > @@ -235,7 +238,7 @@ static void mtk_vdec_update_fmt(struct
> > mtk_vcodec_ctx *ctx,
> >  	unsigned int k;
> >  
> >  	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
> > -	for (k = 0; k < NUM_FORMATS; k++) {
> > +	for (k = 0; k < num_supported_formats; k++) {
> >  		fmt = &mtk_video_formats[k];
> >  		if (fmt->fourcc == pixelformat) {
> >  			mtk_v4l2_debug(1, "Update cap fourcc(%d ->
> > %d)",
> > @@ -617,11 +620,11 @@ const struct mtk_vcodec_dec_pdata
> > mtk_vdec_8173_pdata = {
> >  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> >  	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
> >  	.vdec_formats = mtk_video_formats,
> > -	.num_formats = NUM_FORMATS,
> > +	.num_formats = &num_supported_formats,
> >  	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> >  	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> >  	.vdec_framesizes = mtk_vdec_framesizes,
> > -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> > +	.num_framesizes = &num_supported_framesize,
> >  	.worker = mtk_vdec_worker,
> >  	.flush_decoder = mtk_vdec_flush_decoder,
> >  	.is_subdev_supported = false,
> > diff --git a/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateless.c
> > index 6d481410bf89..e51d935bd21d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > @@ -81,33 +81,23 @@ static const struct mtk_stateless_control
> > mtk_stateless_controls[] = {
> >  
> >  #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
> >  
> > -static const struct mtk_video_fmt mtk_video_formats[] = {
> > -	{
> > -		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> > -		.type = MTK_FMT_DEC,
> > -		.num_planes = 1,
> > -	},
> > -	{
> > -		.fourcc = V4L2_PIX_FMT_MM21,
> > -		.type = MTK_FMT_FRAME,
> > -		.num_planes = 2,
> > -	},
> > +static struct mtk_video_fmt mtk_video_formats[2];
> > +static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
> > +
> > +static struct mtk_video_fmt default_out_format;
> > +static struct mtk_video_fmt default_cap_format;
> > +static unsigned int num_formats;
> > +static unsigned int num_framesizes;
> > +
> > +static struct v4l2_frmsize_stepwise stepwise_fhd = {
> > +	.min_width = MTK_VDEC_MIN_W,
> > +	.max_width = MTK_VDEC_MAX_W,
> > +	.step_width = 16,
> > +	.min_height = MTK_VDEC_MIN_H,
> > +	.max_height = MTK_VDEC_MAX_H,
> > +	.step_height = 16
> >  };
> >  
> > -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> > -#define DEFAULT_OUT_FMT_IDX    0
> > -#define DEFAULT_CAP_FMT_IDX    1
> > -
> > -static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> > -	{
> > -		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
> > -		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> > -				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
> > -	},
> > -};
> > -
> > -#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> > -
> >  static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx
> > *ctx,
> >  					   struct mtk_vcodec_mem *bs,
> > int error)
> >  {
> > @@ -350,6 +340,62 @@ const struct media_device_ops
> > mtk_vcodec_media_ops = {
> >  	.req_queue	= v4l2_m2m_request_queue,
> >  };
> >  
> > +static void mtk_vcodec_add_formats(unsigned int fourcc,
> > +				   struct mtk_vcodec_ctx *ctx)
> > +{
> > +	struct mtk_vcodec_dev *dev = ctx->dev;
> > +	const struct mtk_vcodec_dec_pdata *pdata = dev->vdec_pdata;
> > +	int count_formats = *pdata->num_formats;
> > +	int count_framesizes = *pdata->num_framesizes;
> > +
> > +	switch (fourcc) {
> > +	case V4L2_PIX_FMT_H264_SLICE:
> > +			[count_formats].fourcc = fourcc;
> > +		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
> > +		mtk_video_formats[count_formats].num_planes = 1;
> > +
> > +		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
> > +		mtk_vdec_framesizes[count_framesizes].stepwise =
> > stepwise_fhd;
> > +		num_framesizes++;
> > +		break;
> > +	case V4L2_PIX_FMT_MM21:
> > +		mtk_video_formats[count_formats].fourcc = fourcc;
> > +		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
> > +		mtk_video_formats[count_formats].num_planes = 2;
> > +		break;
> > +	default:
> > +		mtk_v4l2_err("Can not add unsupported format type");
> > +		return;
> > +	}
> > +
> > +	num_formats++;
> > +	mtk_v4l2_debug(3, "num_formats: %d num_frames:%d
> > dec_capability: 0x%x",
> > +		       count_formats, count_framesizes, ctx->dev-
> > >dec_capability);
> > +}
> > +
> > +static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx
> > *ctx)
> > +{
> > +	int cap_format_count = 0, out_format_count = 0;
> > +
> > +	if (num_formats && num_framesizes)
> > +		return;
> > +
> > +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
> > +		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
> > +		cap_format_count++;
> > +	}
> > +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
> > +		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
> > +		out_format_count++;
> > +	}
> > +
> > +	if (cap_format_count)
> > +		default_cap_format = mtk_video_formats[cap_format_count
> > - 1];
> > +	if (out_format_count)
> > +		default_out_format =
> > +			mtk_video_formats[cap_format_count +
> > out_format_count - 1];
> > +}
> > +
> >  static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
> >  {
> >  	struct vb2_queue *src_vq;
> > @@ -360,6 +406,11 @@ static void mtk_init_vdec_params(struct
> > mtk_vcodec_ctx *ctx)
> >  	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
> >  		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);
> >  
> > +	if (!ctx->dev->vdec_pdata->is_subdev_supported)
> > +		ctx->dev->dec_capability |=
> > +			MTK_VDEC_FORMAT_H264_SLICE |
> > MTK_VDEC_FORMAT_MM21;
> > +	mtk_vcodec_get_supported_formats(ctx);
> > +
> >  	/* Support request api for output plane */
> >  	src_vq->supports_requests = true;
> >  	src_vq->requires_requests = true;
> > @@ -393,11 +444,11 @@ const struct mtk_vcodec_dec_pdata
> > mtk_vdec_8183_pdata = {
> >  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> >  	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
> >  	.vdec_formats = mtk_video_formats,
> > -	.num_formats = NUM_FORMATS,
> > -	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> > -	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> > +	.num_formats = &num_formats,
> > +	.default_out_fmt = &default_out_format,
> > +	.default_cap_fmt = &default_cap_format,
> >  	.vdec_framesizes = mtk_vdec_framesizes,
> > -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> > +	.num_framesizes = &num_framesizes,
> >  	.uses_stateless_api = true,
> >  	.worker = mtk_vdec_worker,
> >  	.flush_decoder = mtk_vdec_flush_decoder,
> > @@ -413,11 +464,11 @@ const struct mtk_vcodec_dec_pdata
> > mtk_lat_sig_core_pdata = {
> >  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> >  	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
> >  	.vdec_formats = mtk_video_formats,
> > -	.num_formats = NUM_FORMATS,
> > -	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> > -	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> > +	.num_formats = &num_formats,
> > +	.default_out_fmt = &default_out_format,
> > +	.default_cap_fmt = &default_cap_format,
> >  	.vdec_framesizes = mtk_vdec_framesizes,
> > -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> > +	.num_framesizes = &num_framesizes,
> >  	.uses_stateless_api = true,
> >  	.worker = mtk_vdec_worker,
> >  	.flush_decoder = mtk_vdec_flush_decoder,
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 9fcaf69549dd..270c73c05285 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -344,6 +344,15 @@ enum mtk_vdec_hw_arch {
> >  	MTK_VDEC_LAT_SINGLE_CORE,
> >  };
> >  
> > +/*
> > + * struct mtk_vdec_format_types - Structure used to get supported
> > + *		  format types according to decoder capability
> > + */
> > +enum mtk_vdec_format_types {
> > +	MTK_VDEC_FORMAT_MM21 = 0x20,
> > +	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
> > +};
> > +
> >  /**
> >   * struct mtk_vcodec_dec_pdata - compatible data for each IC
> >   * @init_vdec_params: init vdec params
> > @@ -379,12 +388,12 @@ struct mtk_vcodec_dec_pdata {
> >  	struct vb2_ops *vdec_vb2_ops;
> >  
> >  	const struct mtk_video_fmt *vdec_formats;
> > -	const int num_formats;
> > +	const int *num_formats;
> >  	const struct mtk_video_fmt *default_out_fmt;
> >  	const struct mtk_video_fmt *default_cap_fmt;
> >  
> >  	const struct mtk_codec_framesizes *vdec_framesizes;
> > -	const int num_framesizes;
> > +	const int *num_framesizes;
> >  
> >  	enum mtk_vdec_hw_arch hw_arch;
> >  
> 
> 

