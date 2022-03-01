Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BAA4C93BA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 20:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143EB10E3B6;
	Tue,  1 Mar 2022 19:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E710E3B6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 19:00:24 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id b13so13661119qkj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 11:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=1s4wKOTETMpFLmBb2NItI/j6bEjRB/YZ4Ymwr19XbJ0=;
 b=4ZEb+kGX9UGHeCgk10NQjRgBcGreXfCyn9tZaUFlRAdk08BBGVr0zQNiW4CRrTh/hp
 qrooOuF1YQFqPoG+jI1xuFEIDdG5or/Tej0inwySh4LZgz3yewhhAPfa6zX/dzF/vSzQ
 R4v2pLJZNG/XWPfp1UFsxn20nhxYDB/nCi8nOWBfl9c0ZhZUqFM1EAmmLmffqUjAoOko
 aOZNsVeLnaxwuXOHpipxACmntPMdyosXpKvt7tFKlBTCA35oNvIu2D2rSasaWwdoD7WB
 P6MY3D6l4rIue+N9KF95G2eEcgLrk8Ujbpz2Nx6rzOlKyldlTaRqsILd8OhL30N79hey
 x2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1s4wKOTETMpFLmBb2NItI/j6bEjRB/YZ4Ymwr19XbJ0=;
 b=eaA9uPsrSayBvlMkveeo9CfeAfL/qcN0S8Yre7/n0MbHlibpUdc6OrFn8hPvpHKLKZ
 L4ntDu25NX4jcaAA9zb4y0ZK7JnYa0YMUCCRsMFh5K6eiR+aKCtcIkA790YiCyEKbPFb
 I1aJ9LXLOXZcdbhcLFoyP+/aUm2hXBNVVwXES1qLL3VCOBHw2etwhjUFJ52He39yDDJF
 qn3yzOyx22FIhOsPE/MG2AQtA4sKUCDyN2mtuIJiAnOLAXqHnp466CupxPHC2WuF5oil
 rHnrA0bIRZDOxXz+NgK486FNwNJGqdQcItPXP695bpPzGMHN61Qp5oY5q1HUNwDPnqQb
 dZ7w==
X-Gm-Message-State: AOAM532XzbWqD4zWYhV3CJNH5lX5uIeyeoxkw0f/4to3RocONRTLY1c1
 bbZwjbXRgyq1ILRvlheOlbxnBw==
X-Google-Smtp-Source: ABdhPJyhSzdCiPj1QtJh6+8Y5nAZMEr7W8BMlcS0p743uQ3OJ+C47eua5erqwk3jQgZ0P64ZgGQp3w==
X-Received: by 2002:a05:620a:ed2:b0:648:dad8:b39b with SMTP id
 x18-20020a05620a0ed200b00648dad8b39bmr14775115qkm.185.1646161223571; 
 Tue, 01 Mar 2022 11:00:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 o200-20020a37a5d1000000b0064904a35862sm6911777qke.96.2022.03.01.11.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:00:23 -0800 (PST)
Message-ID: <410a44bfa10fb230fe35937510273d751dc3d90a.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 06/15] media: mtk-vcodec: Refactor get and put
 capture buffer flow
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 01 Mar 2022 14:00:21 -0500
In-Reply-To: <20220223034008.15781-7-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-7-yunfei.dong@mediatek.com>
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

Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> For lat and core decode in parallel, need to get capture buffer
> when core start to decode and put capture buffer to display
> list when core decode done.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 121 ++++++++++++------
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   5 +-
>  .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  16 ++-
>  3 files changed, 102 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 23a154c4e321..6d481410bf89 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -108,37 +108,87 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
>  
>  #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
>  
> -static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
> -					       struct vdec_fb *fb)
> +static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx *ctx,
> +					   struct mtk_vcodec_mem *bs, int error)
>  {
> -	struct mtk_video_dec_buf *vdec_frame_buf =
> -		container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> -	struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
> -	unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +	struct mtk_video_dec_buf *out_buf;
> +	struct vb2_v4l2_buffer *vb;
>  
> -	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> -	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> -		unsigned int cap_c_size =
> -			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +	if (!bs) {
> +		mtk_v4l2_err("Free bitstream buffer fail.");
> +		return;
> +	}
> +	out_buf = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	vb = &out_buf->m2m_buf.vb;
>  
> -		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> +	mtk_v4l2_debug(2, "Free bitsteam buffer id = %d to done_list",
> +		       vb->vb2_buf.index);
> +
> +	v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +	if (error) {
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +		if (error == -EIO)
> +			out_buf->error = true;
> +	} else {
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
>  	}
>  }
>  
> -static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
> -					   struct vb2_v4l2_buffer *vb2_v4l2)
> +static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx,
> +					   struct vdec_fb *fb, int error)
>  {
> -	struct mtk_video_dec_buf *framebuf =
> -		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> -	struct vdec_fb *pfb = &framebuf->frame_buffer;
> -	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
> +	struct mtk_video_dec_buf *vdec_frame_buf;
> +	struct vb2_v4l2_buffer *vb;
> +	unsigned int cap_y_size, cap_c_size;
> +
> +	if (!fb) {
> +		mtk_v4l2_err("Free frame buffer fail.");
> +		return;
> +	}
> +	vdec_frame_buf = container_of(fb, struct mtk_video_dec_buf,
> +				      frame_buffer);
> +	vb = &vdec_frame_buf->m2m_buf.vb;
> +
> +	cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
> +	cap_c_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> +
> +	v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>  
> -	pfb->base_y.va = NULL;
> +	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
> +	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
> +		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
> +
> +	mtk_v4l2_debug(2, "Free frame buffer id = %d to done_list",
> +		       vb->vb2_buf.index);
> +	if (error)
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> +	else
> +		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
> +}
> +
> +static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +	struct mtk_video_dec_buf *framebuf;
> +	struct vb2_v4l2_buffer *vb2_v4l2;
> +	struct vb2_buffer *dst_buf;
> +	struct vdec_fb *pfb;
> +
> +	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	if (!vb2_v4l2) {
> +		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
> +		return NULL;
> +	}
> +
> +	dst_buf = &vb2_v4l2->vb2_buf;
> +	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
> +
> +	pfb = &framebuf->frame_buffer;
> +	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
>  	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
>  	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
>  
>  	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> -		pfb->base_c.va = NULL;
> +		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
>  		pfb->base_c.dma_addr =
>  			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
>  		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
> @@ -162,12 +212,11 @@ static void mtk_vdec_worker(struct work_struct *work)
>  	struct mtk_vcodec_ctx *ctx =
>  		container_of(work, struct mtk_vcodec_ctx, decode_work);
>  	struct mtk_vcodec_dev *dev = ctx->dev;
> -	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +	struct vb2_v4l2_buffer *vb2_v4l2_src;
>  	struct vb2_buffer *vb2_src;
>  	struct mtk_vcodec_mem *bs_src;
>  	struct mtk_video_dec_buf *dec_buf_src;
>  	struct media_request *src_buf_req;
> -	struct vdec_fb *dst_buf;
>  	bool res_chg = false;
>  	int ret;
>  
> @@ -178,13 +227,6 @@ static void mtk_vdec_worker(struct work_struct *work)
>  		return;
>  	}
>  
> -	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	if (!vb2_v4l2_dst) {
> -		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
> -		return;
> -	}
> -
>  	vb2_src = &vb2_v4l2_src->vb2_buf;
>  	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
>  				   m2m_buf.vb);
> @@ -193,9 +235,15 @@ static void mtk_vdec_worker(struct work_struct *work)
>  	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id,
>  		       vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
>  
> -	bs_src->va = NULL;
> +	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
>  	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
>  	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> +	if (!bs_src->va) {
> +		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
> +			     vb2_src->index);
> +		return;
> +	}
>  
>  	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
>  		       ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
> @@ -206,9 +254,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>  	else
>  		mtk_v4l2_err("vb2 buffer media request is NULL");
>  
> -	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
> -	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
> -	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
> +	ret = vdec_if_decode(ctx, bs_src, NULL, &res_chg);
>  	if (ret) {
>  		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
>  			     ctx->id, vb2_src->index, bs_src->size,
> @@ -220,12 +266,9 @@ static void mtk_vdec_worker(struct work_struct *work)
>  		}
>  	}
>  
> -	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
> -
> -	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
> -					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
> -
> +	mtk_vdec_stateless_out_to_done(ctx, bs_src, ret);
>  	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);

This haven't changed since last version, so recording the problem with this
patch again. The request is being completed here as soon as the lat job is done.
This is too soon, here's what the spec says [1]:

   User-space can poll() a request file descriptor in order to wait until the
   request completes. A request is considered complete once all its associated
   buffers are available for dequeuing and all the associated controls have been
   updated with the values at the time of completion. Note that user-space does not
   need to wait for the request to complete to dequeue its buffers: buffers that
   are available halfway through a request can be dequeued independently of the
   request’s state.

In short, the request can't be completed until the core has finished and the
related capture buffer have been marked done. As a side effect, you need to
handle completing the request in all the possible error cases (you might want to
refactor this). Please sync with Benjamin, he's currently trying to find a way
to simplify the threading model and the driver while at it. This will otherwise
tend to be racy and hard to maintain.

https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/request-api.html#request-submission

> +	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  }
>  
>  static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> @@ -358,6 +401,8 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
>  	.uses_stateless_api = true,
>  	.worker = mtk_vdec_worker,
>  	.flush_decoder = mtk_vdec_flush_decoder,
> +	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer = vdec_get_cap_buffer,
>  	.is_subdev_supported = false,
>  	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>  };
> @@ -376,6 +421,8 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
>  	.uses_stateless_api = true,
>  	.worker = mtk_vdec_worker,
>  	.flush_decoder = mtk_vdec_flush_decoder,
> +	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer = vdec_get_cap_buffer,
>  	.is_subdev_supported = true,
>  	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 6d27e4d41ede..9fcaf69549dd 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -350,7 +350,8 @@ enum mtk_vdec_hw_arch {
>   * @ctrls_setup: init vcodec dec ctrls
>   * @worker: worker to start a decode job
>   * @flush_decoder: function that flushes the decoder
> - *
> + * @get_cap_buffer: get capture buffer from capture queue
> + * @cap_to_disp: put capture buffer to disp list
>   * @vdec_vb2_ops: struct vb2_ops
>   *
>   * @vdec_formats: supported video decoder formats
> @@ -372,6 +373,8 @@ struct mtk_vcodec_dec_pdata {
>  	int (*ctrls_setup)(struct mtk_vcodec_ctx *ctx);
>  	void (*worker)(struct work_struct *work);
>  	int (*flush_decoder)(struct mtk_vcodec_ctx *ctx);
> +	struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_ctx *ctx);
> +	void (*cap_to_disp)(struct mtk_vcodec_ctx *ctx, struct vdec_fb *fb, int error);
>  
>  	struct vb2_ops *vdec_vb2_ops;
>  
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> index 43542de11e9c..36f3dc1fbe3b 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> @@ -670,32 +670,42 @@ static void vdec_h264_slice_deinit(void *h_vdec)
>  }
>  
>  static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> -				  struct vdec_fb *fb, bool *res_chg)
> +				  struct vdec_fb *unused, bool *res_chg)
>  {
>  	struct vdec_h264_slice_inst *inst = h_vdec;
>  	const struct v4l2_ctrl_h264_decode_params *dec_params =
>  		get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
>  	struct vdec_vpu_inst *vpu = &inst->vpu;
> +	struct mtk_video_dec_buf *src_buf_info;
> +	struct mtk_video_dec_buf *dst_buf_info;
> +	struct vdec_fb *fb;
>  	u32 data[2];
>  	u64 y_fb_dma;
>  	u64 c_fb_dma;
>  	int err;
>  
> +	inst->num_nalu++;
>  	/* bs NULL means flush decoder */
>  	if (!bs)
>  		return vpu_dec_reset(vpu);
>  
> +	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
> +	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> +	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
> +
>  	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
>  	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
>  
>  	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
> -			 ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
> +			 inst->num_nalu, y_fb_dma, c_fb_dma, fb);
>  
>  	inst->vsi_ctx.dec.bs_dma = (uint64_t)bs->dma_addr;
>  	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
>  	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
>  	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
>  
> +	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> +				   &dst_buf_info->m2m_buf.vb, true);
>  	get_vdec_decode_parameters(inst);
>  	data[0] = bs->size;
>  	/*
> @@ -734,6 +744,8 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  
>  	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
>  	mtk_vcodec_debug(inst, "\n - NALU[%d]", inst->num_nalu);
> +
> +	inst->ctx->dev->vdec_pdata->cap_to_disp(inst->ctx, fb, 0);
>  	return 0;
>  
>  err_free_fb_out:

