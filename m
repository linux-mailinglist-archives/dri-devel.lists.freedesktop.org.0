Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A09867CE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 22:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463910EA42;
	Wed, 25 Sep 2024 20:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="e/RCyGLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C90610EA25
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 20:49:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 951F5880D8;
 Wed, 25 Sep 2024 22:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727297394;
 bh=zA1bPjKVCQ+/q7twBKcSEpbo5NaODKvE4JaFQ6OIdVw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e/RCyGLt56Lh9eqd34kRP2AkX068h1mcx5tSe4QSLDQBgqrKPM2maVcwVvySK7/1R
 FNUr7lyDoVjiGBZG3ay+SxuYuXZYoSUFNLBTT9dIPcOaSreoTzsi7Q6gXGvqKF4IAa
 9dth2JxHn+vzjBZMRZBozDlc3PcPDz3DOr8MauwIjwDMinXWUl3AmS+lnA+DifJkK/
 q8HC2Zgzd/FAH3CnFJPND8B+IRBccHr9wOuVTZICrZWlbsIDEMVKNXE7552jjyw1Qp
 /sqVgZwl0pP728ksqV3kiOlyFX1IUACGzDKkUVZJIGxgzzOkPw77hOrNpnTXWAKEmn
 v+KUJHQgLblew==
Message-ID: <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
Date: Wed, 25 Sep 2024 22:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 9/25/24 7:58 PM, Nicolas Dufresne wrote:

Hi,

[...]

>> +static struct v4l2_pix_format *
>> +ipu_mem2mem_vdic_get_format(struct ipu_mem2mem_vdic_priv *priv,
>> +			    enum v4l2_buf_type type)
>> +{
>> +	return &priv->fmt[V4L2_TYPE_IS_OUTPUT(type) ? V4L2_M2M_SRC : V4L2_M2M_DST];
>> +}
> 
>  From here ...
> 
>> +
>> +static bool ipu_mem2mem_vdic_format_is_yuv420(const u32 pixelformat)
>> +{
>> +	/* All 4:2:0 subsampled formats supported by this hardware */
>> +	return pixelformat == V4L2_PIX_FMT_YUV420 ||
>> +	       pixelformat == V4L2_PIX_FMT_YVU420 ||
>> +	       pixelformat == V4L2_PIX_FMT_NV12;
>> +}
>> +
>> +static bool ipu_mem2mem_vdic_format_is_yuv422(const u32 pixelformat)
>> +{
>> +	/* All 4:2:2 subsampled formats supported by this hardware */
>> +	return pixelformat == V4L2_PIX_FMT_UYVY ||
>> +	       pixelformat == V4L2_PIX_FMT_YUYV ||
>> +	       pixelformat == V4L2_PIX_FMT_YUV422P ||
>> +	       pixelformat == V4L2_PIX_FMT_NV16;
>> +}
>> +
>> +static bool ipu_mem2mem_vdic_format_is_yuv(const u32 pixelformat)
>> +{
>> +	return ipu_mem2mem_vdic_format_is_yuv420(pixelformat) ||
>> +	       ipu_mem2mem_vdic_format_is_yuv422(pixelformat);
>> +}
>> +
>> +static bool ipu_mem2mem_vdic_format_is_rgb16(const u32 pixelformat)
>> +{
>> +	/* All 16-bit RGB formats supported by this hardware */
>> +	return pixelformat == V4L2_PIX_FMT_RGB565;
>> +}
>> +
>> +static bool ipu_mem2mem_vdic_format_is_rgb24(const u32 pixelformat)
>> +{
>> +	/* All 24-bit RGB formats supported by this hardware */
>> +	return pixelformat == V4L2_PIX_FMT_RGB24 ||
>> +	       pixelformat == V4L2_PIX_FMT_BGR24;
>> +}
>> +
>> +static bool ipu_mem2mem_vdic_format_is_rgb32(const u32 pixelformat)
>> +{
>> +	/* All 32-bit RGB formats supported by this hardware */
>> +	return pixelformat == V4L2_PIX_FMT_XRGB32 ||
>> +	       pixelformat == V4L2_PIX_FMT_XBGR32 ||
>> +	       pixelformat == V4L2_PIX_FMT_BGRX32 ||
>> +	       pixelformat == V4L2_PIX_FMT_RGBX32;
>> +}
> 
> To here, these days, all this information can be derived from v4l2_format_info
> in v4l2-common in a way you don't have to create a big barrier to adding more
> formats in the future.

I am not sure I quite understand this suggestion, what should I change here?

Note that the IPUv3 seems to be done, it does not seem like there will 
be new SoCs with this block, so the list of formats here is likely final.

[...]

>> +static irqreturn_t ipu_mem2mem_vdic_nfb4eof_interrupt(int irq, void *dev_id)
>> +{
>> +	struct ipu_mem2mem_vdic_priv *priv = dev_id;
>> +
>> +	/* That is about all we can do about it, report it. */
>> +	dev_warn_ratelimited(priv->dev, "NFB4EOF error interrupt occurred\n");
> 
> Not sure this is right. If that means ipu_mem2mem_vdic_eof_interrupt won't fire,
> then it means streamoff/close after that will hang forever, leaving a zombie
> process behind.
> 
> Perhaps mark the buffers as ERROR, and finish the job.

The NFB4EOF interrupt is generated when the VDIC didn't write (all of) 
output frame . I think it stands for "New Frame Before EOF" or some 
such. Basically the currently written frame will be corrupted and the 
next frame(s) are likely going to be OK again.

>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void ipu_mem2mem_vdic_device_run(void *_ctx)
>> +{
>> +	struct ipu_mem2mem_vdic_ctx *ctx = _ctx;
>> +	struct ipu_mem2mem_vdic_priv *priv = ctx->priv;
>> +	struct vb2_v4l2_buffer *curr_buf, *dst_buf;
>> +	dma_addr_t prev_phys, curr_phys, out_phys;
>> +	struct v4l2_pix_format *infmt;
>> +	u32 phys_offset = 0;
>> +	unsigned long flags;
>> +
>> +	infmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>> +	if (V4L2_FIELD_IS_SEQUENTIAL(infmt->field))
>> +		phys_offset = infmt->sizeimage / 2;
>> +	else if (V4L2_FIELD_IS_INTERLACED(infmt->field))
>> +		phys_offset = infmt->bytesperline;
>> +	else
>> +		dev_err(priv->dev, "Invalid field %d\n", infmt->field);
>> +
>> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +	out_phys = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>> +
>> +	curr_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	if (!curr_buf) {
>> +		dev_err(priv->dev, "Not enough buffers\n");
>> +		return;
> 
> Impossible branch, has been checked by __v4l2_m2m_try_queue().

Fixed in V3

>> +	}
>> +
>> +	spin_lock_irqsave(&priv->irqlock, flags);
>> +
>> +	if (ctx->curr_buf) {
>> +		ctx->prev_buf = ctx->curr_buf;
>> +		ctx->curr_buf = curr_buf;
>> +	} else {
>> +		ctx->prev_buf = curr_buf;
>> +		ctx->curr_buf = curr_buf;
>> +		dev_warn(priv->dev, "Single-buffer mode, fix your userspace\n");
>> +	}
> 
> The driver is not taking ownership of prev_buf, only curr_buf is guaranteed to
> exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, allocate
> new buffers, and then an old freed buffer may endup being used.

So, what should I do about this ? Is there some way to ref the buffer to 
keep it around ?

> Its also unclear to me how userspace can avoid this ugly warning, how can you
> have curr_buf set the first time ? (I might be missing something you this one
> though).

The warning happens when streaming starts and there is only one input 
frame available for the VDIC, which needs three fields to work 
correctly. So, if there in only one input frame, VDI uses the input 
frame bottom field as PREV field for the prediction, and input frame top 
and bottom fields as CURR and NEXT fields for the prediction, the result 
may be one sub-optimal deinterlaced output frame (the first one). Once 
another input frame gets enqueued, the VDIC uses the previous frame 
bottom field as PREV and the newly enqueued frame top and bottom fields 
as CURR and NEXT and the prediction works correctly from that point on.

> Perhaps what you want is a custom job_ready() callback, that ensure you have 2
> buffers in the OUTPUT queue ? You also need to ajust the CID
> MIN_BUFFERS_FOR_OUTPUT accordingly.

I had that before, but gstreamer didn't enqueue the two frames for me, 
so I got back to this variant for maximum compatibility.

>> +	prev_phys = vb2_dma_contig_plane_dma_addr(&ctx->prev_buf->vb2_buf, 0);
>> +	curr_phys = vb2_dma_contig_plane_dma_addr(&ctx->curr_buf->vb2_buf, 0);
>> +
>> +	priv->curr_ctx = ctx;
>> +	spin_unlock_irqrestore(&priv->irqlock, flags);
>> +
>> +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset);
>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset);
>> +
>> +	/* No double buffering, always pick buffer 0 */
>> +	ipu_idmac_select_buffer(priv->vdi_out_ch, 0);
>> +	ipu_idmac_select_buffer(priv->vdi_in_ch_p, 0);
>> +	ipu_idmac_select_buffer(priv->vdi_in_ch, 0);
>> +	ipu_idmac_select_buffer(priv->vdi_in_ch_n, 0);
>> +
>> +	/* Enable the channels */
>> +	ipu_idmac_enable_channel(priv->vdi_out_ch);
>> +	ipu_idmac_enable_channel(priv->vdi_in_ch_p);
>> +	ipu_idmac_enable_channel(priv->vdi_in_ch);
>> +	ipu_idmac_enable_channel(priv->vdi_in_ch_n);
>> +}

[...]

>> +static int ipu_mem2mem_vdic_try_fmt(struct file *file, void *fh,
>> +				    struct v4l2_format *f)
>> +{
>> +	const struct imx_media_pixfmt *cc;
>> +	enum imx_pixfmt_sel cs;
>> +	u32 fourcc;
>> +
>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {	/* Output */
>> +		cs = PIXFMT_SEL_YUV_RGB;	/* YUV direct / RGB via IC */
>> +
>> +		f->fmt.pix.field = V4L2_FIELD_NONE;
>> +	} else {
>> +		cs = PIXFMT_SEL_YUV;		/* YUV input only */
>> +
>> +		/*
>> +		 * Input must be interlaced with frame order.
>> +		 * Fall back to SEQ_TB otherwise.
>> +		 */
>> +		if (!V4L2_FIELD_HAS_BOTH(f->fmt.pix.field) ||
>> +		    f->fmt.pix.field == V4L2_FIELD_INTERLACED)
>> +			f->fmt.pix.field = V4L2_FIELD_SEQ_TB;
>> +	}
>> +
>> +	fourcc = f->fmt.pix.pixelformat;
>> +	cc = imx_media_find_pixel_format(fourcc, cs);
>> +	if (!cc) {
>> +		imx_media_enum_pixel_formats(&fourcc, 0, cs, 0);
>> +		cc = imx_media_find_pixel_format(fourcc, cs);
>> +	}
>> +
>> +	f->fmt.pix.pixelformat = cc->fourcc;
>> +
>> +	v4l_bound_align_image(&f->fmt.pix.width,
>> +			      1, 968, 1,
>> +			      &f->fmt.pix.height,
>> +			      1, 1024, 1, 1);
> 
> Perhaps use defines for the magic numbers ?

Fixed in V3, thanks

>> +
>> +	if (ipu_mem2mem_vdic_format_is_yuv420(f->fmt.pix.pixelformat))
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 3 / 2;
>> +	else if (ipu_mem2mem_vdic_format_is_yuv422(f->fmt.pix.pixelformat))
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
>> +	else if (ipu_mem2mem_vdic_format_is_rgb16(f->fmt.pix.pixelformat))
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
>> +	else if (ipu_mem2mem_vdic_format_is_rgb24(f->fmt.pix.pixelformat))
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 3;
>> +	else if (ipu_mem2mem_vdic_format_is_rgb32(f->fmt.pix.pixelformat))
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 4;
>> +	else
>> +		f->fmt.pix.bytesperline = f->fmt.pix.width;
>> +
>> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
> 
> And use v4l2-common ?

I don't really understand, there is nothing in v4l2-common.c that would 
be really useful replacement for this ?

>> +	return 0;
>> +}
>> +
>> +static int ipu_mem2mem_vdic_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct ipu_mem2mem_vdic_ctx *ctx = fh_to_ctx(fh);
>> +	struct ipu_mem2mem_vdic_priv *priv = ctx->priv;
>> +	struct v4l2_pix_format *fmt, *infmt, *outfmt;
>> +	struct vb2_queue *vq;
>> +	int ret;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +	if (vb2_is_busy(vq)) {
>> +		dev_err(priv->dev, "%s queue busy\n",  __func__);
>> +		return -EBUSY;
>> +	}
>> +
>> +	ret = ipu_mem2mem_vdic_try_fmt(file, fh, f);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	fmt = ipu_mem2mem_vdic_get_format(priv, f->type);
>> +	*fmt = f->fmt.pix;
>> +
>> +	/* Propagate colorimetry to the capture queue */
>> +	infmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>> +	outfmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +	outfmt->colorspace = infmt->colorspace;
>> +	outfmt->ycbcr_enc = infmt->ycbcr_enc;
>> +	outfmt->xfer_func = infmt->xfer_func;
>> +	outfmt->quantization = infmt->quantization;
> 
> So you can do CSC conversion but not colorimetry ? We have
> V4L2_PIX_FMT_FLAG_SET_CSC if you can do colorimetry transforms too. I have
> patches that I'll send for the csc-scaler driver.

See ipu_ic_calc_csc() , that's what does the colorspace conversion in 
this driver (on output from VDI).

[...]
