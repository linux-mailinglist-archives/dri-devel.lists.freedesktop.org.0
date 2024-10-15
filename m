Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9472E99F456
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 19:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBD310E0E3;
	Tue, 15 Oct 2024 17:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xeDE8vzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164C10E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 17:46:16 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6cbf347dc66so27928866d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729014375; x=1729619175;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RSk5uYcCy+FLlh7zsInOY2RY42vRmp22AB3rNGiZhn0=;
 b=xeDE8vzV0i2DsuTP03zhWVIuRI9OyPOe2QZR0I3LSo0h7abreXi4MkmSYMLq6pcTkD
 JzvaKCE+SYxC8s4Q1SJY0tlPEuaEcJbe/F5C9QOzIyWBVGRq/3PuZlF8dnPfLXrbqQUa
 XNQnciUCXsByuZ/LvqtEnDoQeVO+xgWwTVGgi8IW7CvxcKoGq+pI4NvPt65dOUgMct9h
 1QL/rltz2evU6cosLdEulmEiVTDX+fPAAgl0mCiiTXYnHw/FN4retyaigsfIIbqm2QZe
 FBkfAXKpTShyRHbWYsYA5mFNqYMsjmx4a5ZSg3Hkgv8PHgn7L1NVsKccWiYQqRXBRQ9U
 76cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729014375; x=1729619175;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RSk5uYcCy+FLlh7zsInOY2RY42vRmp22AB3rNGiZhn0=;
 b=AEQkosx+rF1SRByqnOcGcNMggjjYl9Utg4WY/wn+0NLogfQuOBhiS1V4HhmAnBGSjT
 Zua7yGVYPdxnXR2skGm7XRuem/LQCZ6JvRedGq2kX8kTAOUepdM3Gz3MJBLDUURegkEV
 m99FVBnnC1+EbgNHWHf5LVHijbnQjsseoqUfnm9WKFa3x0x/3dP/H2hdXwtRQqxTlnVx
 PDlBTAEG6tIV/MytIesqASyPv6+Lg1IQQA2RjYUC1ja55yGv8aakAGuGqcFICQElcVng
 ExIawyOPzDrlufz6Yi9ngaUfKOFxtlWVhR6qqUQJA+Mi09hCTzBxECcxqvIAA+1udGF6
 j1eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcJ8BF68Wz0LFmllj+4+i9/r5sR0LXi3pGN/s09lJ3PAhCVwX7zPiK+rrN58raPnI2Vdext1RnWb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpMPMkkmOtg016evG0enOR0zY4UrCcM3SH/lwTognpLaXd8Bod
 Xm275XKDVy3/A13Iyf+Ix/ddLdQgft9oxg50zQuThbuwABSHY5b9v4NjjasySg4=
X-Google-Smtp-Source: AGHT+IF2NsPjYnboGZj84FGrk0mXRkgKBiWKgqr+y3Ct19RtWGhxwUJt0HZdn9YAFlpRJUID3WDxJg==
X-Received: by 2002:a05:6214:488f:b0:6cb:eba0:267f with SMTP id
 6a1803df08f44-6cbf9d2173amr138661976d6.16.1729014375517; 
 Tue, 15 Oct 2024 10:46:15 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc2290f902sm9175586d6.17.2024.10.15.10.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 10:46:14 -0700 (PDT)
Message-ID: <7098d355fa12c6e6d6255470f2bd513898764c57.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 15 Oct 2024 13:46:13 -0400
In-Reply-To: <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
 <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 24 septembre 2024 =C3=A0 17:28 +0200, Marek Vasut a =C3=A9crit=C2=
=A0:
> On 9/6/24 11:01 AM, Philipp Zabel wrote:
>=20
> Hi,
>=20
> > > diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/stag=
ing/media/imx/imx-media-dev.c
> > > index be54dca11465d..a841fdb4c2394 100644
> > > --- a/drivers/staging/media/imx/imx-media-dev.c
> > > +++ b/drivers/staging/media/imx/imx-media-dev.c
> > > @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_a=
sync_notifier *notifier)
> > >   		goto unlock;
> > >   	}
> > >  =20
> > > +	imxmd->m2m_vdic[0] =3D imx_media_mem2mem_vdic_init(imxmd, 0);
> > > +	if (IS_ERR(imxmd->m2m_vdic[0])) {
> > > +		ret =3D PTR_ERR(imxmd->m2m_vdic[0]);
> > > +		imxmd->m2m_vdic[0] =3D NULL;
> > > +		goto unlock;
> > > +	}
> > > +
> > > +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> > > +	if (imxmd->ipu[1]) {
> > > +		imxmd->m2m_vdic[1] =3D imx_media_mem2mem_vdic_init(imxmd, 1);
> > > +		if (IS_ERR(imxmd->m2m_vdic[1])) {
> > > +			ret =3D PTR_ERR(imxmd->m2m_vdic[1]);
> > > +			imxmd->m2m_vdic[1] =3D NULL;
> > > +			goto uninit_vdi0;
> > > +		}
> > > +	}
> >=20
> > Instead of presenting two devices to userspace, it would be better to
> > have a single video device that can distribute work to both IPUs.
>=20
> Why do you think so ?
>=20
> I think it is better to keep the kernel code as simple as possible, i.e.=
=20
> provide the device node for each m2m device to userspace and handle the=
=20
> m2m device hardware interaction in the kernel driver, but let userspace=
=20
> take care of policy like job scheduling, access permissions assignment=
=20
> to each device (e.g. if different user accounts should have access to=20
> different VDICs), or other such topics.

We have run through this topic already for multi-core stateless CODECs. It =
is
preferable to schedule interchangeable cores inside the Linux kernel.
>=20
> > To be fair, we never implemented that for the CSC/scaler mem2mem device
> > either.
>=20
> I don't think that is actually a good idea. Instead, it would be better=
=20
> to have two scaler nodes in userspace.

It is impossible for userspace to properly dispatch the work and ensure max=
imal
performance across multiple process. A long as there is no state that can r=
eside
on the chip of course.

Nicolas

>=20
> [...]
>=20
> > > +++ b/drivers/staging/media/imx/imx-media-mem2mem-vdic.c
> > > @@ -0,0 +1,997 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * i.MX VDIC mem2mem de-interlace driver
> > > + *
> > > + * Copyright (c) 2024 Marek Vasut <marex@denx.de>
> > > + *
> > > + * Based on previous VDIC mem2mem work by Steve Longerbeam that is:
> > > + * Copyright (c) 2018 Mentor Graphics Inc.
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/module.h>
> > > +#include <linux/sched.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/version.h>
> > > +
> > > +#include <media/media-device.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/v4l2-mem2mem.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > > +
> > > +#include "imx-media.h"
> > > +
> > > +#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_mem2mem_vdic_c=
tx, fh)
> > > +
> > > +#define to_mem2mem_priv(v) container_of(v, struct ipu_mem2mem_vdic_p=
riv, vdev)
> >=20
> > These could be inline functions for added type safety.
>=20
> Fixed in v3
>=20
> [...]
>=20
> > > +static void ipu_mem2mem_vdic_device_run(void *_ctx)
> > > +{
> > > +	struct ipu_mem2mem_vdic_ctx *ctx =3D _ctx;
> > > +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> > > +	struct vb2_v4l2_buffer *curr_buf, *dst_buf;
> > > +	dma_addr_t prev_phys, curr_phys, out_phys;
> > > +	struct v4l2_pix_format *infmt;
> > > +	u32 phys_offset =3D 0;
> > > +	unsigned long flags;
> > > +
> > > +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUT=
PUT);
> > > +	if (V4L2_FIELD_IS_SEQUENTIAL(infmt->field))
> > > +		phys_offset =3D infmt->sizeimage / 2;
> > > +	else if (V4L2_FIELD_IS_INTERLACED(infmt->field))
> > > +		phys_offset =3D infmt->bytesperline;
> > > +	else
> > > +		dev_err(priv->dev, "Invalid field %d\n", infmt->field);
> > > +
> > > +	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > +	out_phys =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> > > +
> > > +	curr_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > +	if (!curr_buf) {
> > > +		dev_err(priv->dev, "Not enough buffers\n");
> > > +		return;
> > > +	}
> > > +
> > > +	spin_lock_irqsave(&priv->irqlock, flags);
> > > +
> > > +	if (ctx->curr_buf) {
> > > +		ctx->prev_buf =3D ctx->curr_buf;
> > > +		ctx->curr_buf =3D curr_buf;
> > > +	} else {
> > > +		ctx->prev_buf =3D curr_buf;
> > > +		ctx->curr_buf =3D curr_buf;
> > > +		dev_warn(priv->dev, "Single-buffer mode, fix your userspace\n");
> > > +	}
> > > +
> > > +	prev_phys =3D vb2_dma_contig_plane_dma_addr(&ctx->prev_buf->vb2_buf=
, 0);
> > > +	curr_phys =3D vb2_dma_contig_plane_dma_addr(&ctx->curr_buf->vb2_buf=
, 0);
> > > +
> > > +	priv->curr_ctx =3D ctx;
> > > +	spin_unlock_irqrestore(&priv->irqlock, flags);
> > > +
> > > +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset)=
;
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset)=
;
> >=20
> > This always outputs at a frame rate of half the field rate, and only
> > top fields are ever used as current field, and bottom fields as
> > previous/next fields, right?
>=20
> Yes, currently the driver extracts 1 frame from two consecutive incoming=
=20
> fields (previous Bottom, and current Top and Bottom):
>=20
> (frame 1 and 3 below is omitted)
>=20
>      1  2  3  4
> ...|T |T |T |T |...
> ...| B| B| B| B|...
>       | ||  | ||
>       '-''  '-''
>        ||    ||
>        ||    \/
>        \/  Frame#4
>      Frame#2
>=20
> As far as I understand it, this is how the current VDI implementation=20
> behaves too, right ?
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/staging/media/imx/imx-media-vdic.c#n207
>=20
> > I think it would be good to add a mode that doesn't drop the
> >=20
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);
> >=20
> > output frames, right from the start.
>=20
> This would make the VDI act as a frame-rate doubler, which would spend a=
=20
> lot more memory bandwidth, which is limited on MX6, so I would also like=
=20
> to have a frame-drop mode (i.e. current behavior).
>=20
> Can we make that behavior configurable ? Since this is a mem2mem device,=
=20
> we do not really have any notion of input and output frame-rate, so I=20
> suspect this would need some VIDIOC_* ioctl ?
>=20
> > If we don't start with that supported, I fear userspace will make
> > assumptions and be surprised when a full rate mode is added later.
>=20
> I'm afraid that since the current VDI already does retain input frame=20
> rate instead of doubling it, the userspace already makes an assumption,=
=20
> so that ship has sailed.
>=20
> But I think we can make the frame doubling configurable ?
>=20
> > > +	/* No double buffering, always pick buffer 0 */
> > > +	ipu_idmac_select_buffer(priv->vdi_out_ch, 0);
> > > +	ipu_idmac_select_buffer(priv->vdi_in_ch_p, 0);
> > > +	ipu_idmac_select_buffer(priv->vdi_in_ch, 0);
> > > +	ipu_idmac_select_buffer(priv->vdi_in_ch_n, 0);
> > > +
> > > +	/* Enable the channels */
> > > +	ipu_idmac_enable_channel(priv->vdi_out_ch);
> > > +	ipu_idmac_enable_channel(priv->vdi_in_ch_p);
> > > +	ipu_idmac_enable_channel(priv->vdi_in_ch);
> > > +	ipu_idmac_enable_channel(priv->vdi_in_ch_n);
> > > +}
>=20
> [...]
>=20
> > > +static int ipu_mem2mem_vdic_setup_hardware(struct ipu_mem2mem_vdic_p=
riv *priv)
> > > +{
> > > +	struct v4l2_pix_format *infmt, *outfmt;
> > > +	struct ipu_ic_csc csc;
> > > +	bool in422, outyuv;
> > > +	int ret;
> > > +
> > > +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUT=
PUT);
> > > +	outfmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CA=
PTURE);
> > > +	in422 =3D ipu_mem2mem_vdic_format_is_yuv422(infmt->pixelformat);
> > > +	outyuv =3D ipu_mem2mem_vdic_format_is_yuv(outfmt->pixelformat);
> > > +
> > > +	ipu_vdi_setup(priv->vdi, in422, infmt->width, infmt->height);
> > > +	ipu_vdi_set_field_order(priv->vdi, V4L2_STD_UNKNOWN, infmt->field);
> > > +	ipu_vdi_set_motion(priv->vdi, HIGH_MOTION);
> >=20
> > This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=3D2, which is documente=
d
> > as "full motion, only vertical filter is used". Doesn't this completely
> > ignore the previous/next fields and only use the output of the di_vfilt
> > four tap vertical filter block to fill in missing lines from the
> > surrounding pixels (above and below) of the current field?
>=20
> Is there a suitable knob for this or shall I introduce a device specific=
=20
> one, like the vdic_ctrl_motion_menu for the current VDIC direct driver ?
>=20
> If we introduce such a knob, then it is all the more reason to provide=
=20
> one device node per one VDIC hardware instance, since each can be=20
> configured for different motion settings.
>=20
> > I think this should at least be configurable, and probably default to
> > MED_MOTION.
>=20
> I think to be compatible with the current VDI behavior and to reduce=20
> memory bandwidth usage, let's default to the HIGH/full mode. That one=20
> produces reasonably good results without spending too much memory=20
> bandwidth which is constrained already on the MX6, and if the user needs=
=20
> better image quality, they can configure another mode using the V4L2=20
> control.
>=20
> [...]
>=20

