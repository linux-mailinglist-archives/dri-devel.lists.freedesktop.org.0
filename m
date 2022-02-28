Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8574C7BFF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 22:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940E10E917;
	Mon, 28 Feb 2022 21:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6315010E917
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 21:29:18 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id w7so14882673qvr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 13:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=D7XF/ydXKQe5CNfMxR56kkfmjRc3n07JxRNzL8ONVks=;
 b=fauPbIptyTaVga2WDVneLHyQup6EjXBbjMvK+uf4GWa4cR/CgaNYMGlKJTC3Aqz/Tx
 m3mp+p8Mztr5ToniJnQm97RXB3QJlwVnK1kcBzL6qBng4RvMwoMyXLjm6lIScPdadq2j
 xdwO+Svi9Od6h9xeFMmiY36sYDZtKWIGlcibkUE9mCu92Mk/YUvHdGkjfCKV6EQ9LEtz
 8gbZm3ip0KyNmj1GCgaGOpkEtYzgKuUAEvjMlfbQrmOfTPuqMw+mSMOKFmlmvvEpgIqX
 pDLqxxutFZPNNY+rzu9mkVv9pKDGiZ+e907U4pYi3eOtjshxf0sYgES/iSokbzF8k7g2
 G9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=D7XF/ydXKQe5CNfMxR56kkfmjRc3n07JxRNzL8ONVks=;
 b=66/BKG3zBsd47zAma3Z0lnAHdj0Nyt7XtAcJ5ZxwlHEAOHm4fOjva16efdIkWwMgcx
 /TBltRrexqLPk1VxZ7cnQnJ3VkTN9VITyxWE863UVSdx1TkS2FUDtjMcbg1dUfwsJJqr
 g1z4/Ga4gjHpO6oa54rHOg8NfPFcKW8R9hbCUemj5oM4FPD1jikXRhHxW1sP+4c1Sn09
 IXrhTk7Idii0uOa0f8pla+0GUHN/UL06LzqzKmdTLMZB4qHn+gpOne+bSNAlqVcbIgzt
 X40DC8KSDFVtprf3D34tEUClgzmN6Nw1ESWEuBWEdps53XqSsS7FfVQxB9DeTGvBxdI2
 KtEA==
X-Gm-Message-State: AOAM5316R0W4Z9LnnjCWFrroX6+veEASKXkJOqLgJROx0zDm7Ol95SHv
 StjmBZdC0+jcuqaWZuvVVz/pUw==
X-Google-Smtp-Source: ABdhPJyWcexc084R4qQtKlB3l+HRBkObWo1df/YXmN1sBZh8GGvH9no/pxtZlogSJF0ZdzxHxikZXQ==
X-Received: by 2002:a0c:9c01:0:b0:432:7630:263 with SMTP id
 v1-20020a0c9c01000000b0043276300263mr15169467qve.47.1646083757352; 
 Mon, 28 Feb 2022 13:29:17 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 p10-20020ae9f30a000000b00648e783ffbasm5604435qkg.135.2022.02.28.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 13:29:16 -0800 (PST)
Message-ID: <cb7cf296bc7df7334f55cc51ef11b671572559ac.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 04/15] media: mtk-vcodec: Read max resolution from
 dec_capability
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Mon, 28 Feb 2022 16:29:15 -0500
In-Reply-To: <20220223034008.15781-5-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-5-yunfei.dong@mediatek.com>
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

Hi Yunfei,

this patch does not work unless userland calls enum_framesizes, which is
completely optional. See comment and suggestion below.

Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> Supported max resolution for different platforms are not the same: 2K
> or 4K, getting it according to dec_capability.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 29 +++++++++++--------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 +++
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 130ecef2e766..304f5afbd419 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -152,13 +152,15 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
>  	q_data->coded_height = DFT_CFG_HEIGHT;
>  	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
>  	q_data->field = V4L2_FIELD_NONE;
> +	ctx->max_width = MTK_VDEC_MAX_W;
> +	ctx->max_height = MTK_VDEC_MAX_H;
>  
>  	v4l_bound_align_image(&q_data->coded_width,
>  				MTK_VDEC_MIN_W,
> -				MTK_VDEC_MAX_W, 4,
> +				ctx->max_width, 4,
>  				&q_data->coded_height,
>  				MTK_VDEC_MIN_H,
> -				MTK_VDEC_MAX_H, 5, 6);
> +				ctx->max_height, 5, 6);
>  
>  	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
>  	q_data->bytesperline[0] = q_data->coded_width;
> @@ -217,7 +219,7 @@ static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
>  	}
>  }
>  
> -static int vidioc_try_fmt(struct v4l2_format *f,
> +static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
>  			  const struct mtk_video_fmt *fmt)
>  {
>  	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> @@ -225,9 +227,9 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  	pix_fmt_mp->field = V4L2_FIELD_NONE;
>  
>  	pix_fmt_mp->width =
> -		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, MTK_VDEC_MAX_W);
> +		clamp(pix_fmt_mp->width, MTK_VDEC_MIN_W, ctx->max_width);
>  	pix_fmt_mp->height =
> -		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, MTK_VDEC_MAX_H);
> +		clamp(pix_fmt_mp->height, MTK_VDEC_MIN_H, ctx->max_height);
>  
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>  		pix_fmt_mp->num_planes = 1;
> @@ -245,16 +247,16 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  		tmp_h = pix_fmt_mp->height;
>  		v4l_bound_align_image(&pix_fmt_mp->width,
>  					MTK_VDEC_MIN_W,
> -					MTK_VDEC_MAX_W, 6,
> +					ctx->max_width, 6,
>  					&pix_fmt_mp->height,
>  					MTK_VDEC_MIN_H,
> -					MTK_VDEC_MAX_H, 6, 9);
> +					ctx->max_height, 6, 9);
>  
>  		if (pix_fmt_mp->width < tmp_w &&
> -			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
> +			(pix_fmt_mp->width + 64) <= ctx->max_width)
>  			pix_fmt_mp->width += 64;
>  		if (pix_fmt_mp->height < tmp_h &&
> -			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
> +			(pix_fmt_mp->height + 64) <= ctx->max_height)
>  			pix_fmt_mp->height += 64;
>  
>  		mtk_v4l2_debug(0,
> @@ -294,7 +296,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  		fmt = mtk_vdec_find_format(f, dec_pdata);
>  	}
>  
> -	return vidioc_try_fmt(f, fmt);
> +	return vidioc_try_fmt(ctx, f, fmt);
>  }
>  
>  static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -317,7 +319,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	return vidioc_try_fmt(f, fmt);
> +	return vidioc_try_fmt(ctx, f, fmt);
>  }
>  
>  static int vidioc_vdec_g_selection(struct file *file, void *priv,
> @@ -445,7 +447,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>  		return -EINVAL;
>  
>  	q_data->fmt = fmt;
> -	vidioc_try_fmt(f, q_data->fmt);
> +	vidioc_try_fmt(ctx, f, q_data->fmt);
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>  		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
>  		q_data->coded_width = pix_mp->width;
> @@ -545,6 +547,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  				fsize->stepwise.min_height,
>  				fsize->stepwise.max_height,
>  				fsize->stepwise.step_height);
> +
> +		ctx->max_width = fsize->stepwise.max_width;
> +		ctx->max_height = fsize->stepwise.max_height;

The spec does not require calling enum_fmt, so changing the maximum here is
incorrect (and fail with GStreamer). If userland never enum the framesizes, the
resolution get limited to 1080p.

As this only depends and the OUTPUT format and the device being open()
(condition being dev_capability being set and OUTPUT format being known / not
VP8), you could initialize the cxt max inside s_fmt(OUTPUT) instead, which is a
mandatory call. I have tested this change to verify this:


diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 044e3dfbdd8c..3e7c571526a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -484,6 +484,14 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    !(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
+	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
+		mtk_v4l2_debug(3, "4K is enabled");
+		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
+		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
+	}
+
 	q_data->fmt = fmt;
 	vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
@@ -574,15 +582,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
-		if (!(ctx->dev->dec_capability &
-				VCODEC_CAPABILITY_4K_DISABLED) &&
-				fsize->pixel_format != V4L2_PIX_FMT_VP8_FRAME) {
-			mtk_v4l2_debug(3, "4K is enabled");
-			fsize->stepwise.max_width =
-					VCODEC_DEC_4K_CODED_WIDTH;
-			fsize->stepwise.max_height =
-					VCODEC_DEC_4K_CODED_HEIGHT;
-		}
+		fsize->stepwise.max_width = ctx->max_width;
+		fsize->stepwise.max_height = ctx->max_height;
+
 		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
 				ctx->dev->dec_capability,
 				fsize->stepwise.min_width,
@@ -592,8 +594,6 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 				fsize->stepwise.max_height,
 				fsize->stepwise.step_height);
 
-		ctx->max_width = fsize->stepwise.max_width;
-		ctx->max_height = fsize->stepwise.max_height;
 		return 0;
 	}
 


>  		return 0;
>  	}
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index bb7b8e914d24..6d27e4d41ede 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -284,6 +284,8 @@ struct vdec_pic_info {
>   *	  mtk_video_dec_buf.
>   * @hw_id: hardware index used to identify different hardware.
>   *
> + * @max_width: hardware supported max width
> + * @max_height: hardware supported max height
>   * @msg_queue: msg queue used to store lat buffer information.
>   */
>  struct mtk_vcodec_ctx {
> @@ -329,6 +331,8 @@ struct mtk_vcodec_ctx {
>  	struct mutex lock;
>  	int hw_id;
>  
> +	unsigned int max_width;
> +	unsigned int max_height;
>  	struct vdec_msg_queue msg_queue;
>  };
>  

