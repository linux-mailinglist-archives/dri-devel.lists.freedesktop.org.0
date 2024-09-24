Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838559849ED
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111B10E0CF;
	Tue, 24 Sep 2024 16:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="OmEObOsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C0E10E0CF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:45:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5520388580;
 Tue, 24 Sep 2024 18:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727196319;
 bh=/Jgh2J56THl4Ke+D7QEi5nBhb50MSZCH9cCXRjOyfYI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=OmEObOsuIyMuuEy8T1cDPkzmwhe3PnLL+TB5IGYFqRdVpIQmqnaquhSYrLvmn9957
 2ZZJwClGW3YIJnYty1BS3bip4v1/5PsQ/kB9MQyT0jmAsJWiXJcJteNT/Cvb55Rzir
 LBkHEngLq8f+RJPX07nOtZbgV3JnEuR+t2L/4rzkgIQ4CFAdtZHVj0vFxx5RQjcBkH
 MOEiWssJSHcg8rpjSUvjdm589BHHe/9pXtY2c0IUrMlhdnCPSPj6d3/KJjM0SBIl2E
 2qGcMPcm4CeCdQy8fr9sILsjcAJMWeNP7eslmUH0Lgf2OVI8h6SrXkqXhUbLAronA/
 rqdythIZtZqrg==
Message-ID: <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
Date: Tue, 24 Sep 2024 17:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
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

On 9/6/24 11:01 AM, Philipp Zabel wrote:

Hi,

>> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
>> index be54dca11465d..a841fdb4c2394 100644
>> --- a/drivers/staging/media/imx/imx-media-dev.c
>> +++ b/drivers/staging/media/imx/imx-media-dev.c
>> @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
>>   		goto unlock;
>>   	}
>>   
>> +	imxmd->m2m_vdic[0] = imx_media_mem2mem_vdic_init(imxmd, 0);
>> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
>> +		ret = PTR_ERR(imxmd->m2m_vdic[0]);
>> +		imxmd->m2m_vdic[0] = NULL;
>> +		goto unlock;
>> +	}
>> +
>> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
>> +	if (imxmd->ipu[1]) {
>> +		imxmd->m2m_vdic[1] = imx_media_mem2mem_vdic_init(imxmd, 1);
>> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
>> +			ret = PTR_ERR(imxmd->m2m_vdic[1]);
>> +			imxmd->m2m_vdic[1] = NULL;
>> +			goto uninit_vdi0;
>> +		}
>> +	}
> 
> Instead of presenting two devices to userspace, it would be better to
> have a single video device that can distribute work to both IPUs.

Why do you think so ?

I think it is better to keep the kernel code as simple as possible, i.e. 
provide the device node for each m2m device to userspace and handle the 
m2m device hardware interaction in the kernel driver, but let userspace 
take care of policy like job scheduling, access permissions assignment 
to each device (e.g. if different user accounts should have access to 
different VDICs), or other such topics.

> To be fair, we never implemented that for the CSC/scaler mem2mem device
> either.

I don't think that is actually a good idea. Instead, it would be better 
to have two scaler nodes in userspace.

[...]

>> +++ b/drivers/staging/media/imx/imx-media-mem2mem-vdic.c
>> @@ -0,0 +1,997 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * i.MX VDIC mem2mem de-interlace driver
>> + *
>> + * Copyright (c) 2024 Marek Vasut <marex@denx.de>
>> + *
>> + * Based on previous VDIC mem2mem work by Steve Longerbeam that is:
>> + * Copyright (c) 2018 Mentor Graphics Inc.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/fs.h>
>> +#include <linux/module.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/version.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "imx-media.h"
>> +
>> +#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_mem2mem_vdic_ctx, fh)
>> +
>> +#define to_mem2mem_priv(v) container_of(v, struct ipu_mem2mem_vdic_priv, vdev)
> 
> These could be inline functions for added type safety.

Fixed in v3

[...]

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
>> +
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
> 
> This always outputs at a frame rate of half the field rate, and only
> top fields are ever used as current field, and bottom fields as
> previous/next fields, right?

Yes, currently the driver extracts 1 frame from two consecutive incoming 
fields (previous Bottom, and current Top and Bottom):

(frame 1 and 3 below is omitted)

     1  2  3  4
...|T |T |T |T |...
...| B| B| B| B|...
      | ||  | ||
      '-''  '-''
       ||    ||
       ||    \/
       \/  Frame#4
     Frame#2

As far as I understand it, this is how the current VDI implementation 
behaves too, right ?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/media/imx/imx-media-vdic.c#n207

> I think it would be good to add a mode that doesn't drop the
> 
> 	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
> 	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
> 	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);
> 
> output frames, right from the start.

This would make the VDI act as a frame-rate doubler, which would spend a 
lot more memory bandwidth, which is limited on MX6, so I would also like 
to have a frame-drop mode (i.e. current behavior).

Can we make that behavior configurable ? Since this is a mem2mem device, 
we do not really have any notion of input and output frame-rate, so I 
suspect this would need some VIDIOC_* ioctl ?

> If we don't start with that supported, I fear userspace will make
> assumptions and be surprised when a full rate mode is added later.

I'm afraid that since the current VDI already does retain input frame 
rate instead of doubling it, the userspace already makes an assumption, 
so that ship has sailed.

But I think we can make the frame doubling configurable ?

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

>> +static int ipu_mem2mem_vdic_setup_hardware(struct ipu_mem2mem_vdic_priv *priv)
>> +{
>> +	struct v4l2_pix_format *infmt, *outfmt;
>> +	struct ipu_ic_csc csc;
>> +	bool in422, outyuv;
>> +	int ret;
>> +
>> +	infmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>> +	outfmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +	in422 = ipu_mem2mem_vdic_format_is_yuv422(infmt->pixelformat);
>> +	outyuv = ipu_mem2mem_vdic_format_is_yuv(outfmt->pixelformat);
>> +
>> +	ipu_vdi_setup(priv->vdi, in422, infmt->width, infmt->height);
>> +	ipu_vdi_set_field_order(priv->vdi, V4L2_STD_UNKNOWN, infmt->field);
>> +	ipu_vdi_set_motion(priv->vdi, HIGH_MOTION);
> 
> This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=2, which is documented
> as "full motion, only vertical filter is used". Doesn't this completely
> ignore the previous/next fields and only use the output of the di_vfilt
> four tap vertical filter block to fill in missing lines from the
> surrounding pixels (above and below) of the current field?

Is there a suitable knob for this or shall I introduce a device specific 
one, like the vdic_ctrl_motion_menu for the current VDIC direct driver ?

If we introduce such a knob, then it is all the more reason to provide 
one device node per one VDIC hardware instance, since each can be 
configured for different motion settings.

> I think this should at least be configurable, and probably default to
> MED_MOTION.

I think to be compatible with the current VDI behavior and to reduce 
memory bandwidth usage, let's default to the HIGH/full mode. That one 
produces reasonably good results without spending too much memory 
bandwidth which is constrained already on the MX6, and if the user needs 
better image quality, they can configure another mode using the V4L2 
control.

[...]
