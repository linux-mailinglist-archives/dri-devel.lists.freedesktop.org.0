Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B298F605
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0A10E8E3;
	Thu,  3 Oct 2024 18:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="xxRB4ytO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE5010E8E0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 18:28:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E5C7088A24;
 Thu,  3 Oct 2024 20:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727980090;
 bh=faYbxPEN6YGmMvqnzy2uL/Tt+yyjSeCCd5lEptEMVRc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xxRB4ytOkc6Vv1VH6rsKDSeN00aFVCafvnSNKlb/8KIvj3EXbvodAYGnQ+cu5M/AY
 KS7m9F2QT59CYaYSEdLLeHakPaBahOPgjAcMbNQLDqJsN1clRo3GTaZTMUB/nbCAdh
 TXScmeYcmcpn2Q8ZiwohhZAMW8jP+vrRo3rEDXcW0lcEMgnCwcmDIZNk+X+aIPjF/i
 pd+sTqrA88SI6nirocgCfT2qIVS/uIwBKePE73/I28K6fU+paoc903tnmAvrPfOePw
 WbFW0LjbY6vs5MftIbm86biFfOgFtFNddCWHT7iloI5Ax/045Ppo8igAg3q5BOLAnz
 5Jn6AYlUvJeNg==
Message-ID: <0c49d362-da0c-432e-90d9-69b02cdf3e64@denx.de>
Date: Thu, 3 Oct 2024 19:13:34 +0200
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
 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
 <386f4e12fd835b18c3f618f2c94cbd426bd6cf28.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <386f4e12fd835b18c3f618f2c94cbd426bd6cf28.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 9/27/24 9:33 PM, Nicolas Dufresne wrote:
> Le mercredi 25 septembre 2024 à 22:45 +0200, Marek Vasut a écrit :
>> On 9/25/24 7:58 PM, Nicolas Dufresne wrote:
>>
>>
> 
> [...]
> 
>>
>>>> +static irqreturn_t ipu_mem2mem_vdic_nfb4eof_interrupt(int irq, void *dev_id)
>>>> +{
>>>> +	struct ipu_mem2mem_vdic_priv *priv = dev_id;
>>>> +
>>>> +	/* That is about all we can do about it, report it. */
>>>> +	dev_warn_ratelimited(priv->dev, "NFB4EOF error interrupt occurred\n");
>>>
>>> Not sure this is right. If that means ipu_mem2mem_vdic_eof_interrupt won't fire,
>>> then it means streamoff/close after that will hang forever, leaving a zombie
>>> process behind.
>>>
>>> Perhaps mark the buffers as ERROR, and finish the job.
>>
>> The NFB4EOF interrupt is generated when the VDIC didn't write (all of)
>> output frame . I think it stands for "New Frame Before EOF" or some
>> such. Basically the currently written frame will be corrupted and the
>> next frame(s) are likely going to be OK again.
> 
> So the other IRQ will be triggered ? After this one ? Is so, perhaps take a
> moment to mark the frames as ERROR (which means corrupted).

OK, fixed in V3.

> [...]
> 
>>>
>>> The driver is not taking ownership of prev_buf, only curr_buf is guaranteed to
>>> exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, allocate
>>> new buffers, and then an old freed buffer may endup being used.
>>
>> So, what should I do about this ? Is there some way to ref the buffer to
>> keep it around ?
>>
>>> Its also unclear to me how userspace can avoid this ugly warning, how can you
>>> have curr_buf set the first time ? (I might be missing something you this one
>>> though).
>>
>> The warning happens when streaming starts and there is only one input
>> frame available for the VDIC, which needs three fields to work
>> correctly. So, if there in only one input frame, VDI uses the input
>> frame bottom field as PREV field for the prediction, and input frame top
>> and bottom fields as CURR and NEXT fields for the prediction, the result
>> may be one sub-optimal deinterlaced output frame (the first one). Once
>> another input frame gets enqueued, the VDIC uses the previous frame
>> bottom field as PREV and the newly enqueued frame top and bottom fields
>> as CURR and NEXT and the prediction works correctly from that point on.
> 
> Warnings by default are not acceptable.

This is a workaround so that older gstreamer versions would work, what 
else can I do here ?

>>> Perhaps what you want is a custom job_ready() callback, that ensure you have 2
>>> buffers in the OUTPUT queue ? You also need to ajust the CID
>>> MIN_BUFFERS_FOR_OUTPUT accordingly.
>>
>> I had that before, but gstreamer didn't enqueue the two frames for me,
>> so I got back to this variant for maximum compatibility.
> 
> Its well known that GStreamer v4l2convert element have no support for
> detinterlacing and need to be improved to support any deinterlace drivers out
> there.

It seems v4l2convert disable-passthrough=true works with deinterlacers 
just fine , except for this one reused frame at stream start ?

> Other drivers will simply holds on output buffers until it has enough to produce
> the first valid picture. Holding meaning not marking them done, which keeps then
> in the ACTIVE state, which is being tracked by the core for your.

As far as I understand this, when the EOF interrupt happens, 
v4l2_m2m_src_buf_remove() pulls the oldest input buffer from the queue 
and that buffer is then marked as DONE (or ERROR in v3), that is the 
->prev buffer, isn't it ?

Once the next frame deinterlacing starts, the (new) current frame and 
the prev frame are both active, the deinterlacing happens and then in 
the EOF interrupt, the ->prev frame gets marked as DONE again.

What am I missing here ?

> [...]
> 
>>>> +
>>>> +	if (ipu_mem2mem_vdic_format_is_yuv420(f->fmt.pix.pixelformat))
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 3 / 2;
>>>> +	else if (ipu_mem2mem_vdic_format_is_yuv422(f->fmt.pix.pixelformat))
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
>>>> +	else if (ipu_mem2mem_vdic_format_is_rgb16(f->fmt.pix.pixelformat))
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 2;
>>>> +	else if (ipu_mem2mem_vdic_format_is_rgb24(f->fmt.pix.pixelformat))
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 3;
>>>> +	else if (ipu_mem2mem_vdic_format_is_rgb32(f->fmt.pix.pixelformat))
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width * 4;
>>>> +	else
>>>> +		f->fmt.pix.bytesperline = f->fmt.pix.width;
>>>> +
>>>> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
>>>
>>> And use v4l2-common ?
>>
>> I don't really understand, there is nothing in v4l2-common.c that would
>> be really useful replacement for this ?
> 
> Not sure I get your response, v4l2-common is used in many drivers already, and
> we intent to keep improving it so that all driver uses it in the long term. It
> been created because folks believed they can calculate bytesperline and
> sizeimage, but as the number of format grows, it always endup wrong, causing the
> HW to overflow and break the system at a larger scale.

Do you want me to introduce some new generic helper ? Because I don't 
see an existing generic one.

>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int ipu_mem2mem_vdic_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>>>> +{
>>>> +	struct ipu_mem2mem_vdic_ctx *ctx = fh_to_ctx(fh);
>>>> +	struct ipu_mem2mem_vdic_priv *priv = ctx->priv;
>>>> +	struct v4l2_pix_format *fmt, *infmt, *outfmt;
>>>> +	struct vb2_queue *vq;
>>>> +	int ret;
>>>> +
>>>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>>>> +	if (vb2_is_busy(vq)) {
>>>> +		dev_err(priv->dev, "%s queue busy\n",  __func__);
>>>> +		return -EBUSY;
>>>> +	}
>>>> +
>>>> +	ret = ipu_mem2mem_vdic_try_fmt(file, fh, f);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	fmt = ipu_mem2mem_vdic_get_format(priv, f->type);
>>>> +	*fmt = f->fmt.pix;
>>>> +
>>>> +	/* Propagate colorimetry to the capture queue */
>>>> +	infmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>>>> +	outfmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>>>> +	outfmt->colorspace = infmt->colorspace;
>>>> +	outfmt->ycbcr_enc = infmt->ycbcr_enc;
>>>> +	outfmt->xfer_func = infmt->xfer_func;
>>>> +	outfmt->quantization = infmt->quantization;
>>>
>>> So you can do CSC conversion but not colorimetry ? We have
>>> V4L2_PIX_FMT_FLAG_SET_CSC if you can do colorimetry transforms too. I have
>>> patches that I'll send for the csc-scaler driver.
>>
>> See ipu_ic_calc_csc() , that's what does the colorspace conversion in
>> this driver (on output from VDI).
> 
> int ipu_ic_calc_csc(struct ipu_ic_csc *csc,
>                      enum v4l2_ycbcr_encoding in_enc,
>                      enum v4l2_quantization in_quant,
>                      enum ipu_color_space in_cs,
>                      enum v4l2_ycbcr_encoding out_enc,
>                      enum v4l2_quantization out_quant,
>                      enum ipu_color_space out_cs)
> 
> So instead of simply overriding CSC like you do, let userspace set different CSC
> in and out, so that IPU can handle the conversion properly with correct colors.
> That requires to flag these in the fmt_desc structure during enum format, and to
> only read acknowledge the CSC if userspace have set V4L2_PIX_FMT_FLAG_SET_CSC,
> in other condition, the information must be ignored (which you don't).
The input is from the VDI and that always has to be YUV. Can you maybe 
just CC me on the CSC-scaler patches ? Then I'll see what can be done here.

Thanks
