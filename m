Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E1986609
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 19:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A0C10E846;
	Wed, 25 Sep 2024 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qs9nPiu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE5C10E846
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 17:58:54 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7a9acc6f22dso10942885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1727287134; x=1727891934;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cDYvydJ+ev1hzpyvHJeDhluenV7UYMfl5qvSXfKuWvw=;
 b=qs9nPiu5F8BJ3ao5F6Q8aiTl1E45hnjr7D/o5dhN6cDaccAlBBQVfayMDMGF+ZfrAa
 jXDnwZCpX06BpORONicfSNbEkqc/Q2soX58Ij5WfahC/C0OsqbKZoqJYX5nAtcqqLI3J
 XYD3urL2pE57mrCb97wGEoRpjsTaLptsG9CLdSVnNruGAauhgdSXfZtqUnjy6uH0NnMM
 ODsS9YntX8G0OGdofiWa/VrLHpLGkUH8qSaaGuzEFdQZ+VtDjVgIaCf+wcmaq8UfvWAa
 6aQ4J6K/rf8/QMMlXSC0G+201PQpY8BYYorDTIp/g3p5WPsAJuV8UQsSfoWqyO+1a+/S
 ZSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727287134; x=1727891934;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cDYvydJ+ev1hzpyvHJeDhluenV7UYMfl5qvSXfKuWvw=;
 b=hG4VN1L6AR5qk236HetfY8LgS/UCiBX8TpZl6IZeekMP25m/I5ugyOPEsainr+dr8w
 jJWuSrUpM+96/pz+ramihHsGfgJMcevzheAgxJ58nXa7JmFcp0j8fSERsAcRJdPIf9hz
 GgRlxodp0cM7+ck/ly3dh2/cPoIoKUrzmoQgSNW0DB12eUxwQ0hLUH37FwV4pW7zZstm
 sBeaUMRRGq3KxvFygS0ee6Y//hQe8dPWU1dE9UJOaabpsUwfkAXQzoYQTdO32StVclHa
 K8YPEhHEuLr9Kh8Tuz5CrNbT2PHirpdPR2br1S/NNFI/PBrGoeL8MahETu8GkojvhzgZ
 kkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXT5+jYsLPpoUxGoX9pWgSjmrLql4i5BKMCBzswlB4/D2hzRD9VxJsop8buEvAHBYJRNWzY7p2m0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh9WOc9DEOxIRTfxsJ4AatFKjHxKG3RHfvbdKvVQnB0XgTSaMh
 MLLRgaMi5egNHKL3DyPFtGpo1oJu8cLxqL1DULkPtzpPoYQOCkpfVEiBlKXEe5s=
X-Google-Smtp-Source: AGHT+IHu6ocjOMxSabVYA7FI+gxTmBgm7Xen4eENB//tCpbe4RuvL1Nl/ekXOyKmZtIn/hpk3I+muQ==
X-Received: by 2002:a05:620a:440a:b0:7a9:c04a:f5a with SMTP id
 af79cd13be357-7ace7412226mr528690485a.31.1727287133578; 
 Wed, 25 Sep 2024 10:58:53 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::580])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7acde618db1sm193086285a.125.2024.09.25.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 10:58:52 -0700 (PDT)
Message-ID: <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Wed, 25 Sep 2024 13:58:51 -0400
In-Reply-To: <20240724002044.112544-2-marex@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
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

Hi,

Le mercredi 24 juillet 2024 =C3=A0 02:19 +0200, Marek Vasut a =C3=A9crit=C2=
=A0:
> Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
> Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
> memory. This only works for single stream, that is, one input from
> one camera is deinterlaced on the fly with a helper buffer in DRAM
> and the result is written into memory.
>=20
> The i.MX6Q/QP does support up to four analog cameras via two IPUv3
> instances, each containing one VDI deinterlacer block. In order to
> deinterlace all four streams from all four analog cameras live, it
> is necessary to operate VDI in INDIRECT mode, where the interlaced
> streams are written to buffers in memory, and then deinterlaced in
> memory using VDI in INDIRECT memory-to-memory mode.
>=20
> This driver also makes use of the IDMAC->VDI->IC->IDMAC data path
> to provide pixel format conversion from input YUV formats to both
> output YUV or RGB formats. The later is useful in case the data
> are imported into the GPU, which on this platform cannot directly
> sample YUV buffers.
>=20
> This is derived from previous work by Steve Longerbeam and from the
> IPUv3 CSC Scaler mem2mem driver.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Steve Longerbeam <slongerbeam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> ---
> V2: - Add complementary imx_media_mem2mem_vdic_uninit()
>     - Drop uninitiaized ret from ipu_mem2mem_vdic_device_run()
>     - Drop duplicate nbuffers assignment in ipu_mem2mem_vdic_queue_setup(=
)
>     - Fix %u formatting string in ipu_mem2mem_vdic_queue_setup()
>     - Drop devm_*free from ipu_mem2mem_vdic_get_ipu_resources() fail path
>       and ipu_mem2mem_vdic_put_ipu_resources()
>     - Add missing video_device_release()
> ---
>  drivers/staging/media/imx/Makefile            |   2 +-
>  drivers/staging/media/imx/imx-media-dev.c     |  55 +
>  .../media/imx/imx-media-mem2mem-vdic.c        | 997 ++++++++++++++++++
>  drivers/staging/media/imx/imx-media.h         |  10 +
>  4 files changed, 1063 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/imx/imx-media-mem2mem-vdic.c
>=20
> diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/i=
mx/Makefile
> index 330e0825f506b..0cad87123b590 100644
> --- a/drivers/staging/media/imx/Makefile
> +++ b/drivers/staging/media/imx/Makefile
> @@ -4,7 +4,7 @@ imx-media-common-objs :=3D imx-media-capture.o imx-media-=
dev-common.o \
> =20
>  imx6-media-objs :=3D imx-media-dev.o imx-media-internal-sd.o \
>  	imx-ic-common.o imx-ic-prp.o imx-ic-prpencvf.o imx-media-vdic.o \
> -	imx-media-csc-scaler.o
> +	imx-media-mem2mem-vdic.o imx-media-csc-scaler.o
> =20
>  imx6-media-csi-objs :=3D imx-media-csi.o imx-media-fim.o
> =20
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/=
media/imx/imx-media-dev.c
> index be54dca11465d..a841fdb4c2394 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_async=
_notifier *notifier)
>  		goto unlock;
>  	}
> =20
> +	imxmd->m2m_vdic[0] =3D imx_media_mem2mem_vdic_init(imxmd, 0);
> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
> +		ret =3D PTR_ERR(imxmd->m2m_vdic[0]);
> +		imxmd->m2m_vdic[0] =3D NULL;
> +		goto unlock;
> +	}
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		imxmd->m2m_vdic[1] =3D imx_media_mem2mem_vdic_init(imxmd, 1);
> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
> +			ret =3D PTR_ERR(imxmd->m2m_vdic[1]);
> +			imxmd->m2m_vdic[1] =3D NULL;
> +			goto uninit_vdi0;
> +		}
> +	}
> +
>  	ret =3D imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
> +	if (ret)
> +		goto uninit_vdi1;
> +
> +	ret =3D imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[0]);
> +	if (ret)
> +		goto unreg_csc;
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		ret =3D imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[1]);
> +		if (ret)
> +			goto unreg_vdic;
> +	}
> +
> +	mutex_unlock(&imxmd->mutex);
> +	return ret;
> +
> +unreg_vdic:
> +	imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[0]);
> +	imxmd->m2m_vdic[0] =3D NULL;
> +unreg_csc:
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +	imxmd->m2m_vdev =3D NULL;
> +uninit_vdi1:
> +	if (imxmd->ipu[1])
> +		imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[1]);
> +uninit_vdi0:
> +	imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[0]);
>  unlock:
>  	mutex_unlock(&imxmd->mutex);
>  	return ret;
> @@ -108,6 +153,16 @@ static void imx_media_remove(struct platform_device =
*pdev)
> =20
>  	v4l2_info(&imxmd->v4l2_dev, "Removing imx-media\n");
> =20
> +	if (imxmd->m2m_vdic[1]) {	/* MX6Q/QP only */
> +		imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[1]);
> +		imxmd->m2m_vdic[1] =3D NULL;
> +	}
> +
> +	if (imxmd->m2m_vdic[0]) {
> +		imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[0]);
> +		imxmd->m2m_vdic[0] =3D NULL;
> +	}
> +
>  	if (imxmd->m2m_vdev) {
>  		imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
>  		imxmd->m2m_vdev =3D NULL;
> diff --git a/drivers/staging/media/imx/imx-media-mem2mem-vdic.c b/drivers=
/staging/media/imx/imx-media-mem2mem-vdic.c
> new file mode 100644
> index 0000000000000..71c6c023d2bf8
> --- /dev/null
> +++ b/drivers/staging/media/imx/imx-media-mem2mem-vdic.c
> @@ -0,0 +1,997 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * i.MX VDIC mem2mem de-interlace driver
> + *
> + * Copyright (c) 2024 Marek Vasut <marex@denx.de>
> + *
> + * Based on previous VDIC mem2mem work by Steve Longerbeam that is:
> + * Copyright (c) 2018 Mentor Graphics Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/version.h>
> +
> +#include <media/media-device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "imx-media.h"
> +
> +#define fh_to_ctx(__fh)	container_of(__fh, struct ipu_mem2mem_vdic_ctx, =
fh)
> +
> +#define to_mem2mem_priv(v) container_of(v, struct ipu_mem2mem_vdic_priv,=
 vdev)
> +
> +enum {
> +	V4L2_M2M_SRC =3D 0,
> +	V4L2_M2M_DST =3D 1,
> +};
> +
> +struct ipu_mem2mem_vdic_ctx;
> +
> +struct ipu_mem2mem_vdic_priv {
> +	struct imx_media_video_dev	vdev;
> +	struct imx_media_dev		*md;
> +	struct device			*dev;
> +	struct ipu_soc			*ipu_dev;
> +	int				ipu_id;
> +
> +	struct v4l2_m2m_dev		*m2m_dev;
> +	struct mutex			mutex;		/* mem2mem device mutex */
> +
> +	/* VDI resources */
> +	struct ipu_vdi			*vdi;
> +	struct ipu_ic			*ic;
> +	struct ipuv3_channel		*vdi_in_ch_p;
> +	struct ipuv3_channel		*vdi_in_ch;
> +	struct ipuv3_channel		*vdi_in_ch_n;
> +	struct ipuv3_channel		*vdi_out_ch;
> +	int				eof_irq;
> +	int				nfb4eof_irq;
> +	spinlock_t			irqlock;	/* protect eof_irq handler */
> +
> +	atomic_t			stream_count;
> +
> +	struct ipu_mem2mem_vdic_ctx	*curr_ctx;
> +
> +	struct v4l2_pix_format		fmt[2];
> +};
> +
> +struct ipu_mem2mem_vdic_ctx {
> +	struct ipu_mem2mem_vdic_priv	*priv;
> +	struct v4l2_fh			fh;
> +	unsigned int			sequence;
> +	struct vb2_v4l2_buffer		*prev_buf;
> +	struct vb2_v4l2_buffer		*curr_buf;
> +};
> +
> +static struct v4l2_pix_format *
> +ipu_mem2mem_vdic_get_format(struct ipu_mem2mem_vdic_priv *priv,
> +			    enum v4l2_buf_type type)
> +{
> +	return &priv->fmt[V4L2_TYPE_IS_OUTPUT(type) ? V4L2_M2M_SRC : V4L2_M2M_D=
ST];
> +}

From here ...

> +
> +static bool ipu_mem2mem_vdic_format_is_yuv420(const u32 pixelformat)
> +{
> +	/* All 4:2:0 subsampled formats supported by this hardware */
> +	return pixelformat =3D=3D V4L2_PIX_FMT_YUV420 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_YVU420 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_NV12;
> +}
> +
> +static bool ipu_mem2mem_vdic_format_is_yuv422(const u32 pixelformat)
> +{
> +	/* All 4:2:2 subsampled formats supported by this hardware */
> +	return pixelformat =3D=3D V4L2_PIX_FMT_UYVY ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_YUYV ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_YUV422P ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_NV16;
> +}
> +
> +static bool ipu_mem2mem_vdic_format_is_yuv(const u32 pixelformat)
> +{
> +	return ipu_mem2mem_vdic_format_is_yuv420(pixelformat) ||
> +	       ipu_mem2mem_vdic_format_is_yuv422(pixelformat);
> +}
> +
> +static bool ipu_mem2mem_vdic_format_is_rgb16(const u32 pixelformat)
> +{
> +	/* All 16-bit RGB formats supported by this hardware */
> +	return pixelformat =3D=3D V4L2_PIX_FMT_RGB565;
> +}
> +
> +static bool ipu_mem2mem_vdic_format_is_rgb24(const u32 pixelformat)
> +{
> +	/* All 24-bit RGB formats supported by this hardware */
> +	return pixelformat =3D=3D V4L2_PIX_FMT_RGB24 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_BGR24;
> +}
> +
> +static bool ipu_mem2mem_vdic_format_is_rgb32(const u32 pixelformat)
> +{
> +	/* All 32-bit RGB formats supported by this hardware */
> +	return pixelformat =3D=3D V4L2_PIX_FMT_XRGB32 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_XBGR32 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_BGRX32 ||
> +	       pixelformat =3D=3D V4L2_PIX_FMT_RGBX32;
> +}

To here, these days, all this information can be derived from v4l2_format_i=
nfo
in v4l2-common in a way you don't have to create a big barrier to adding mo=
re
formats in the future.

> +
> +/*
> + * mem2mem callbacks
> + */
> +static irqreturn_t ipu_mem2mem_vdic_eof_interrupt(int irq, void *dev_id)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D dev_id;
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D priv->curr_ctx;
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	spin_lock(&priv->irqlock);
> +
> +	src_buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> +
> +	src_buf->sequence =3D ctx->sequence++;
> +	dst_buf->sequence =3D src_buf->sequence;
> +
> +	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> +	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
> +
> +	v4l2_m2m_job_finish(priv->m2m_dev, ctx->fh.m2m_ctx);
> +
> +	spin_unlock(&priv->irqlock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t ipu_mem2mem_vdic_nfb4eof_interrupt(int irq, void *dev=
_id)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D dev_id;
> +
> +	/* That is about all we can do about it, report it. */
> +	dev_warn_ratelimited(priv->dev, "NFB4EOF error interrupt occurred\n");

Not sure this is right. If that means ipu_mem2mem_vdic_eof_interrupt won't =
fire,
then it means streamoff/close after that will hang forever, leaving a zombi=
e
process behind.

Perhaps mark the buffers as ERROR, and finish the job.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void ipu_mem2mem_vdic_device_run(void *_ctx)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D _ctx;
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	struct vb2_v4l2_buffer *curr_buf, *dst_buf;
> +	dma_addr_t prev_phys, curr_phys, out_phys;
> +	struct v4l2_pix_format *infmt;
> +	u32 phys_offset =3D 0;
> +	unsigned long flags;
> +
> +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT)=
;
> +	if (V4L2_FIELD_IS_SEQUENTIAL(infmt->field))
> +		phys_offset =3D infmt->sizeimage / 2;
> +	else if (V4L2_FIELD_IS_INTERLACED(infmt->field))
> +		phys_offset =3D infmt->bytesperline;
> +	else
> +		dev_err(priv->dev, "Invalid field %d\n", infmt->field);
> +
> +	dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	out_phys =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +
> +	curr_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	if (!curr_buf) {
> +		dev_err(priv->dev, "Not enough buffers\n");
> +		return;

Impossible branch, has been checked by __v4l2_m2m_try_queue().

> +	}
> +
> +	spin_lock_irqsave(&priv->irqlock, flags);
> +
> +	if (ctx->curr_buf) {
> +		ctx->prev_buf =3D ctx->curr_buf;
> +		ctx->curr_buf =3D curr_buf;
> +	} else {
> +		ctx->prev_buf =3D curr_buf;
> +		ctx->curr_buf =3D curr_buf;
> +		dev_warn(priv->dev, "Single-buffer mode, fix your userspace\n");
> +	}

The driver is not taking ownership of prev_buf, only curr_buf is guaranteed=
 to
exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, allo=
cate
new buffers, and then an old freed buffer may endup being used.

Its also unclear to me how userspace can avoid this ugly warning, how can y=
ou
have curr_buf set the first time ? (I might be missing something you this o=
ne
though).

Perhaps what you want is a custom job_ready() callback, that ensure you hav=
e 2
buffers in the OUTPUT queue ? You also need to ajust the CID
MIN_BUFFERS_FOR_OUTPUT accordingly.

> +
> +	prev_phys =3D vb2_dma_contig_plane_dma_addr(&ctx->prev_buf->vb2_buf, 0)=
;
> +	curr_phys =3D vb2_dma_contig_plane_dma_addr(&ctx->curr_buf->vb2_buf, 0)=
;
> +
> +	priv->curr_ctx =3D ctx;
> +	spin_unlock_irqrestore(&priv->irqlock, flags);
> +
> +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset);
> +
> +	/* No double buffering, always pick buffer 0 */
> +	ipu_idmac_select_buffer(priv->vdi_out_ch, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch_p, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch_n, 0);
> +
> +	/* Enable the channels */
> +	ipu_idmac_enable_channel(priv->vdi_out_ch);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch_p);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch_n);
> +}
> +
> +/*
> + * Video ioctls
> + */
> +static int ipu_mem2mem_vdic_querycap(struct file *file, void *priv,
> +				     struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, "imx-m2m-vdic", sizeof(cap->driver));
> +	strscpy(cap->card, "imx-m2m-vdic", sizeof(cap->card));
> +	strscpy(cap->bus_info, "platform:imx-m2m-vdic", sizeof(cap->bus_info));
> +	cap->device_caps =3D V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> +	cap->capabilities =3D cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_enum_fmt(struct file *file, void *fh, struct=
 v4l2_fmtdesc *f)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(fh);
> +	struct vb2_queue *vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	enum imx_pixfmt_sel cs =3D vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE =
?
> +				 PIXFMT_SEL_YUV_RGB : PIXFMT_SEL_YUV;
> +	u32 fourcc;
> +	int ret;
> +
> +	ret =3D imx_media_enum_pixel_formats(&fourcc, f->index, cs, 0);
> +	if (ret)
> +		return ret;
> +
> +	f->pixelformat =3D fourcc;
> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_g_fmt(struct file *file, void *fh, struct v4=
l2_format *f)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(fh);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	struct v4l2_pix_format *fmt =3D ipu_mem2mem_vdic_get_format(priv, f->ty=
pe);
> +
> +	f->fmt.pix =3D *fmt;
> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_try_fmt(struct file *file, void *fh,
> +				    struct v4l2_format *f)
> +{
> +	const struct imx_media_pixfmt *cc;
> +	enum imx_pixfmt_sel cs;
> +	u32 fourcc;
> +
> +	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {	/* Output */
> +		cs =3D PIXFMT_SEL_YUV_RGB;	/* YUV direct / RGB via IC */
> +
> +		f->fmt.pix.field =3D V4L2_FIELD_NONE;
> +	} else {
> +		cs =3D PIXFMT_SEL_YUV;		/* YUV input only */
> +
> +		/*
> +		 * Input must be interlaced with frame order.
> +		 * Fall back to SEQ_TB otherwise.
> +		 */
> +		if (!V4L2_FIELD_HAS_BOTH(f->fmt.pix.field) ||
> +		    f->fmt.pix.field =3D=3D V4L2_FIELD_INTERLACED)
> +			f->fmt.pix.field =3D V4L2_FIELD_SEQ_TB;
> +	}
> +
> +	fourcc =3D f->fmt.pix.pixelformat;
> +	cc =3D imx_media_find_pixel_format(fourcc, cs);
> +	if (!cc) {
> +		imx_media_enum_pixel_formats(&fourcc, 0, cs, 0);
> +		cc =3D imx_media_find_pixel_format(fourcc, cs);
> +	}
> +
> +	f->fmt.pix.pixelformat =3D cc->fourcc;
> +
> +	v4l_bound_align_image(&f->fmt.pix.width,
> +			      1, 968, 1,
> +			      &f->fmt.pix.height,
> +			      1, 1024, 1, 1);

Perhaps use defines for the magic numbers ?

> +
> +	if (ipu_mem2mem_vdic_format_is_yuv420(f->fmt.pix.pixelformat))
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3 / 2;
> +	else if (ipu_mem2mem_vdic_format_is_yuv422(f->fmt.pix.pixelformat))
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> +	else if (ipu_mem2mem_vdic_format_is_rgb16(f->fmt.pix.pixelformat))
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 2;
> +	else if (ipu_mem2mem_vdic_format_is_rgb24(f->fmt.pix.pixelformat))
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 3;
> +	else if (ipu_mem2mem_vdic_format_is_rgb32(f->fmt.pix.pixelformat))
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width * 4;
> +	else
> +		f->fmt.pix.bytesperline =3D f->fmt.pix.width;
> +
> +	f->fmt.pix.sizeimage =3D f->fmt.pix.height * f->fmt.pix.bytesperline;

And use v4l2-common ?

> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_s_fmt(struct file *file, void *fh, struct v4=
l2_format *f)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(fh);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	struct v4l2_pix_format *fmt, *infmt, *outfmt;
> +	struct vb2_queue *vq;
> +	int ret;
> +
> +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> +	if (vb2_is_busy(vq)) {
> +		dev_err(priv->dev, "%s queue busy\n",  __func__);
> +		return -EBUSY;
> +	}
> +
> +	ret =3D ipu_mem2mem_vdic_try_fmt(file, fh, f);
> +	if (ret < 0)
> +		return ret;
> +
> +	fmt =3D ipu_mem2mem_vdic_get_format(priv, f->type);
> +	*fmt =3D f->fmt.pix;
> +
> +	/* Propagate colorimetry to the capture queue */
> +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT)=
;
> +	outfmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CAPTUR=
E);
> +	outfmt->colorspace =3D infmt->colorspace;
> +	outfmt->ycbcr_enc =3D infmt->ycbcr_enc;
> +	outfmt->xfer_func =3D infmt->xfer_func;
> +	outfmt->quantization =3D infmt->quantization;

So you can do CSC conversion but not colorimetry ? We have
V4L2_PIX_FMT_FLAG_SET_CSC if you can do colorimetry transforms too. I have
patches that I'll send for the csc-scaler driver.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops mem2mem_ioctl_ops =3D {
> +	.vidioc_querycap		=3D ipu_mem2mem_vdic_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap	=3D ipu_mem2mem_vdic_enum_fmt,
> +	.vidioc_g_fmt_vid_cap		=3D ipu_mem2mem_vdic_g_fmt,
> +	.vidioc_try_fmt_vid_cap		=3D ipu_mem2mem_vdic_try_fmt,
> +	.vidioc_s_fmt_vid_cap		=3D ipu_mem2mem_vdic_s_fmt,
> +
> +	.vidioc_enum_fmt_vid_out	=3D ipu_mem2mem_vdic_enum_fmt,
> +	.vidioc_g_fmt_vid_out		=3D ipu_mem2mem_vdic_g_fmt,
> +	.vidioc_try_fmt_vid_out		=3D ipu_mem2mem_vdic_try_fmt,
> +	.vidioc_s_fmt_vid_out		=3D ipu_mem2mem_vdic_s_fmt,
> +
> +	.vidioc_reqbufs			=3D v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		=3D v4l2_m2m_ioctl_querybuf,
> +
> +	.vidioc_qbuf			=3D v4l2_m2m_ioctl_qbuf,
> +	.vidioc_expbuf			=3D v4l2_m2m_ioctl_expbuf,
> +	.vidioc_dqbuf			=3D v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_create_bufs		=3D v4l2_m2m_ioctl_create_bufs,
> +
> +	.vidioc_streamon		=3D v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		=3D v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_subscribe_event		=3D v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	=3D v4l2_event_unsubscribe,
> +};
> +
> +/*
> + * Queue operations
> + */
> +static int ipu_mem2mem_vdic_queue_setup(struct vb2_queue *vq, unsigned i=
nt *nbuffers,
> +					unsigned int *nplanes, unsigned int sizes[],
> +					struct device *alloc_devs[])
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(vq);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	struct v4l2_pix_format *fmt =3D ipu_mem2mem_vdic_get_format(priv, vq->t=
ype);
> +	unsigned int count =3D *nbuffers;
> +
> +	if (*nplanes)
> +		return sizes[0] < fmt->sizeimage ? -EINVAL : 0;
> +
> +	*nplanes =3D 1;
> +	sizes[0] =3D fmt->sizeimage;
> +
> +	dev_dbg(ctx->priv->dev, "get %u buffer(s) of size %d each.\n",
> +		count, fmt->sizeimage);
> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	struct vb2_queue *vq =3D vb->vb2_queue;
> +	struct v4l2_pix_format *fmt;
> +	unsigned long size;
> +
> +	dev_dbg(ctx->priv->dev, "type: %d\n", vb->vb2_queue->type);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		if (vbuf->field =3D=3D V4L2_FIELD_ANY)
> +			vbuf->field =3D V4L2_FIELD_SEQ_TB;
> +		if (!V4L2_FIELD_HAS_BOTH(vbuf->field)) {
> +			dev_dbg(ctx->priv->dev, "%s: field isn't supported\n",
> +				__func__);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	fmt =3D ipu_mem2mem_vdic_get_format(priv, vb->vb2_queue->type);
> +	size =3D fmt->sizeimage;
> +
> +	if (vb2_plane_size(vb, 0) < size) {
> +		dev_dbg(ctx->priv->dev,
> +			"%s: data will not fit into plane (%lu < %lu)\n",
> +			__func__, vb2_plane_size(vb, 0), size);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, fmt->sizeimage);
> +
> +	return 0;
> +}
> +
> +static void ipu_mem2mem_vdic_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, to_vb2_v4l2_buffer(vb));
> +}
> +
> +/* VDIC hardware setup */
> +static int ipu_mem2mem_vdic_setup_channel(struct ipu_mem2mem_vdic_priv *=
priv,
> +					  struct ipuv3_channel *channel,
> +					  struct v4l2_pix_format *fmt,
> +					  bool in)
> +{
> +	struct ipu_image image =3D { 0 };
> +	unsigned int burst_size;
> +	int ret;
> +
> +	image.pix =3D *fmt;
> +	image.rect.width =3D image.pix.width;
> +	image.rect.height =3D image.pix.height;
> +
> +	ipu_cpmem_zero(channel);
> +
> +	if (in) {
> +		/* One field to VDIC channels */
> +		image.pix.height /=3D 2;
> +		image.rect.height /=3D 2;
> +	} else {
> +		/* Skip writing U and V components to odd rows */
> +		if (ipu_mem2mem_vdic_format_is_yuv420(image.pix.pixelformat))
> +			ipu_cpmem_skip_odd_chroma_rows(channel);
> +	}
> +
> +	ret =3D ipu_cpmem_set_image(channel, &image);
> +	if (ret)
> +		return ret;
> +
> +	burst_size =3D (image.pix.width & 0xf) ? 8 : 16;
> +	ipu_cpmem_set_burstsize(channel, burst_size);
> +
> +	if (!ipu_prg_present(priv->ipu_dev))
> +		ipu_cpmem_set_axi_id(channel, 1);
> +
> +	ipu_idmac_set_double_buffer(channel, false);
> +
> +	return 0;
> +}
> +
> +static int ipu_mem2mem_vdic_setup_hardware(struct ipu_mem2mem_vdic_priv =
*priv)
> +{
> +	struct v4l2_pix_format *infmt, *outfmt;
> +	struct ipu_ic_csc csc;
> +	bool in422, outyuv;
> +	int ret;
> +
> +	infmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT)=
;
> +	outfmt =3D ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_CAPTUR=
E);
> +	in422 =3D ipu_mem2mem_vdic_format_is_yuv422(infmt->pixelformat);
> +	outyuv =3D ipu_mem2mem_vdic_format_is_yuv(outfmt->pixelformat);
> +
> +	ipu_vdi_setup(priv->vdi, in422, infmt->width, infmt->height);
> +	ipu_vdi_set_field_order(priv->vdi, V4L2_STD_UNKNOWN, infmt->field);
> +	ipu_vdi_set_motion(priv->vdi, HIGH_MOTION);
> +
> +	/* Initialize the VDI IDMAC channels */
> +	ret =3D ipu_mem2mem_vdic_setup_channel(priv, priv->vdi_in_ch_p, infmt, =
true);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_mem2mem_vdic_setup_channel(priv, priv->vdi_in_ch, infmt, tr=
ue);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_mem2mem_vdic_setup_channel(priv, priv->vdi_in_ch_n, infmt, =
true);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_mem2mem_vdic_setup_channel(priv, priv->vdi_out_ch, outfmt, =
false);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ipu_ic_calc_csc(&csc,
> +			      infmt->ycbcr_enc, infmt->quantization,
> +			      IPUV3_COLORSPACE_YUV,
> +			      outfmt->ycbcr_enc, outfmt->quantization,
> +			      outyuv ? IPUV3_COLORSPACE_YUV :
> +				       IPUV3_COLORSPACE_RGB);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable the IC */
> +	ipu_ic_task_init(priv->ic, &csc,
> +			 infmt->width, infmt->height,
> +			 outfmt->width, outfmt->height);
> +	ipu_ic_task_idma_init(priv->ic, priv->vdi_out_ch,
> +			      infmt->width, infmt->height, 16, 0);
> +	ipu_ic_enable(priv->ic);
> +	ipu_ic_task_enable(priv->ic);
> +
> +	/* Enable the VDI */
> +	ipu_vdi_enable(priv->vdi);
> +
> +	return 0;
> +}
> +
> +static struct vb2_queue *ipu_mem2mem_vdic_get_other_q(struct vb2_queue *=
q)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(q);
> +	enum v4l2_buf_type type =3D q->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE =
?
> +				  V4L2_BUF_TYPE_VIDEO_OUTPUT :
> +				  V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +
> +	return v4l2_m2m_get_vq(ctx->fh.m2m_ctx, type);
> +}
> +
> +static void ipu_mem2mem_vdic_return_bufs(struct vb2_queue *q)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct vb2_v4l2_buffer *buf;
> +
> +	if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		while ((buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +	else
> +		while ((buf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx)))
> +			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
> +}
> +
> +static int ipu_mem2mem_vdic_start_streaming(struct vb2_queue *q, unsigne=
d int count)
> +{
> +	struct vb2_queue *other_q =3D ipu_mem2mem_vdic_get_other_q(q);
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +	int ret;
> +
> +	if (!vb2_is_streaming(other_q))
> +		return 0;
> +
> +	/* Already streaming, do not reconfigure the VDI. */
> +	if (atomic_inc_return(&priv->stream_count) !=3D 1)
> +		return 0;
> +
> +	/* Start streaming */
> +	ret =3D ipu_mem2mem_vdic_setup_hardware(priv);
> +	if (ret)
> +		ipu_mem2mem_vdic_return_bufs(q);
> +
> +	return ret;
> +}
> +
> +static void ipu_mem2mem_vdic_stop_streaming(struct vb2_queue *q)
> +{
> +	struct vb2_queue *other_q =3D ipu_mem2mem_vdic_get_other_q(q);
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct ipu_mem2mem_vdic_priv *priv =3D ctx->priv;
> +
> +	if (vb2_is_streaming(other_q)) {
> +		ipu_mem2mem_vdic_return_bufs(q);
> +		return;
> +	}
> +
> +	if (atomic_dec_return(&priv->stream_count) =3D=3D 0) {
> +		/* Stop streaming */
> +		ipu_idmac_disable_channel(priv->vdi_in_ch_p);
> +		ipu_idmac_disable_channel(priv->vdi_in_ch);
> +		ipu_idmac_disable_channel(priv->vdi_in_ch_n);
> +		ipu_idmac_disable_channel(priv->vdi_out_ch);
> +
> +		ipu_vdi_disable(priv->vdi);
> +		ipu_ic_task_disable(priv->ic);
> +		ipu_ic_disable(priv->ic);
> +	}
> +
> +	ctx->sequence =3D 0;
> +
> +	ipu_mem2mem_vdic_return_bufs(q);
> +}
> +
> +static const struct vb2_ops mem2mem_qops =3D {
> +	.queue_setup	=3D ipu_mem2mem_vdic_queue_setup,
> +	.buf_prepare	=3D ipu_mem2mem_vdic_buf_prepare,
> +	.buf_queue	=3D ipu_mem2mem_vdic_buf_queue,
> +	.wait_prepare	=3D vb2_ops_wait_prepare,
> +	.wait_finish	=3D vb2_ops_wait_finish,
> +	.start_streaming =3D ipu_mem2mem_vdic_start_streaming,
> +	.stop_streaming =3D ipu_mem2mem_vdic_stop_streaming,
> +};
> +
> +static int ipu_mem2mem_vdic_queue_init(void *priv, struct vb2_queue *src=
_vq,
> +				       struct vb2_queue *dst_vq)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D priv;
> +	int ret;
> +
> +	memset(src_vq, 0, sizeof(*src_vq));
> +	src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	src_vq->drv_priv =3D ctx;
> +	src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops =3D &mem2mem_qops;
> +	src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock =3D &ctx->priv->mutex;
> +	src_vq->dev =3D ctx->priv->dev;
> +
> +	ret =3D vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	memset(dst_vq, 0, sizeof(*dst_vq));
> +	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +	dst_vq->drv_priv =3D ctx;
> +	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops =3D &mem2mem_qops;
> +	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock =3D &ctx->priv->mutex;
> +	dst_vq->dev =3D ctx->priv->dev;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +#define DEFAULT_WIDTH	720
> +#define DEFAULT_HEIGHT	576
> +static const struct v4l2_pix_format ipu_mem2mem_vdic_default =3D {
> +	.width		=3D DEFAULT_WIDTH,
> +	.height		=3D DEFAULT_HEIGHT,
> +	.pixelformat	=3D V4L2_PIX_FMT_YUV420,
> +	.field		=3D V4L2_FIELD_SEQ_TB,
> +	.bytesperline	=3D DEFAULT_WIDTH,
> +	.sizeimage	=3D DEFAULT_WIDTH * DEFAULT_HEIGHT * 3 / 2,
> +	.colorspace	=3D V4L2_COLORSPACE_SRGB,
> +	.ycbcr_enc	=3D V4L2_YCBCR_ENC_601,
> +	.xfer_func	=3D V4L2_XFER_FUNC_DEFAULT,
> +	.quantization	=3D V4L2_QUANTIZATION_DEFAULT,
> +};
> +
> +/*
> + * File operations
> + */
> +static int ipu_mem2mem_vdic_open(struct file *file)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D video_drvdata(file);
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D NULL;
> +	int ret;
> +
> +	ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data =3D &ctx->fh;
> +	v4l2_fh_add(&ctx->fh);
> +	ctx->priv =3D priv;
> +
> +	ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(priv->m2m_dev, ctx,
> +					    &ipu_mem2mem_vdic_queue_init);
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +		goto err_ctx;
> +	}
> +
> +	dev_dbg(priv->dev, "Created instance %p, m2m_ctx: %p\n",
> +		ctx, ctx->fh.m2m_ctx);
> +
> +	return 0;
> +
> +err_ctx:
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +	return ret;
> +}
> +
> +static int ipu_mem2mem_vdic_release(struct file *file)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D video_drvdata(file);
> +	struct ipu_mem2mem_vdic_ctx *ctx =3D fh_to_ctx(file->private_data);
> +
> +	dev_dbg(priv->dev, "Releasing instance %p\n", ctx);
> +
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations mem2mem_fops =3D {
> +	.owner		=3D THIS_MODULE,
> +	.open		=3D ipu_mem2mem_vdic_open,
> +	.release	=3D ipu_mem2mem_vdic_release,
> +	.poll		=3D v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	=3D video_ioctl2,
> +	.mmap		=3D v4l2_m2m_fop_mmap,
> +};
> +
> +static struct v4l2_m2m_ops m2m_ops =3D {
> +	.device_run	=3D ipu_mem2mem_vdic_device_run,
> +};
> +
> +static void ipu_mem2mem_vdic_device_release(struct video_device *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D video_get_drvdata(vdev);
> +
> +	v4l2_m2m_release(priv->m2m_dev);
> +	video_device_release(vdev);
> +	kfree(priv);
> +}
> +
> +static const struct video_device mem2mem_template =3D {
> +	.name		=3D "ipu_vdic",
> +	.fops		=3D &mem2mem_fops,
> +	.ioctl_ops	=3D &mem2mem_ioctl_ops,
> +	.minor		=3D -1,
> +	.release	=3D ipu_mem2mem_vdic_device_release,
> +	.vfl_dir	=3D VFL_DIR_M2M,
> +	.tvnorms	=3D V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
> +	.device_caps	=3D V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
> +};
> +
> +static int ipu_mem2mem_vdic_get_ipu_resources(struct ipu_mem2mem_vdic_pr=
iv *priv,
> +					      struct video_device *vfd)
> +{
> +	char *nfbname, *eofname;
> +	int ret;
> +
> +	nfbname =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%s_nfb4eof:%u",
> +				 vfd->name, priv->ipu_id);
> +	if (!nfbname)
> +		return -ENOMEM;
> +
> +	eofname =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%s_eof:%u",
> +				 vfd->name, priv->ipu_id);
> +	if (!eofname)
> +		return -ENOMEM;
> +
> +	priv->vdi =3D ipu_vdi_get(priv->ipu_dev);
> +	if (IS_ERR(priv->vdi)) {
> +		ret =3D PTR_ERR(priv->vdi);
> +		goto err_vdi;
> +	}
> +
> +	priv->ic =3D ipu_ic_get(priv->ipu_dev, IC_TASK_VIEWFINDER);
> +	if (IS_ERR(priv->ic)) {
> +		ret =3D PTR_ERR(priv->ic);
> +		goto err_ic;
> +	}
> +
> +	priv->vdi_in_ch_p =3D ipu_idmac_get(priv->ipu_dev,
> +					  IPUV3_CHANNEL_MEM_VDI_PREV);
> +	if (IS_ERR(priv->vdi_in_ch_p)) {
> +		ret =3D PTR_ERR(priv->vdi_in_ch_p);
> +		goto err_prev;
> +	}
> +
> +	priv->vdi_in_ch =3D ipu_idmac_get(priv->ipu_dev,
> +					IPUV3_CHANNEL_MEM_VDI_CUR);
> +	if (IS_ERR(priv->vdi_in_ch)) {
> +		ret =3D PTR_ERR(priv->vdi_in_ch);
> +		goto err_curr;
> +	}
> +
> +	priv->vdi_in_ch_n =3D ipu_idmac_get(priv->ipu_dev,
> +					  IPUV3_CHANNEL_MEM_VDI_NEXT);
> +	if (IS_ERR(priv->vdi_in_ch_n)) {
> +		ret =3D PTR_ERR(priv->vdi_in_ch_n);
> +		goto err_next;
> +	}
> +
> +	priv->vdi_out_ch =3D ipu_idmac_get(priv->ipu_dev,
> +					 IPUV3_CHANNEL_IC_PRP_VF_MEM);
> +	if (IS_ERR(priv->vdi_out_ch)) {
> +		ret =3D PTR_ERR(priv->vdi_out_ch);
> +		goto err_out;
> +	}
> +
> +	priv->nfb4eof_irq =3D ipu_idmac_channel_irq(priv->ipu_dev,
> +						  priv->vdi_out_ch,
> +						  IPU_IRQ_NFB4EOF);
> +	ret =3D devm_request_irq(priv->dev, priv->nfb4eof_irq,
> +			       ipu_mem2mem_vdic_nfb4eof_interrupt, 0,
> +			       nfbname, priv);
> +	if (ret)
> +		goto err_irq_eof;
> +
> +	priv->eof_irq =3D ipu_idmac_channel_irq(priv->ipu_dev,
> +					      priv->vdi_out_ch,
> +					      IPU_IRQ_EOF);
> +	ret =3D devm_request_irq(priv->dev, priv->eof_irq,
> +			       ipu_mem2mem_vdic_eof_interrupt, 0,
> +			       eofname, priv);
> +	if (ret)
> +		goto err_irq_eof;
> +
> +	/*
> +	 * Enable PRG, without PRG clock enabled (CCGR6:prg_clk_enable[0]
> +	 * and CCGR6:prg_clk_enable[1]), the VDI does not produce any
> +	 * interrupts at all.
> +	 */
> +	if (ipu_prg_present(priv->ipu_dev))
> +		ipu_prg_enable(priv->ipu_dev);
> +
> +	return 0;
> +
> +err_irq_eof:
> +	ipu_idmac_put(priv->vdi_out_ch);
> +err_out:
> +	ipu_idmac_put(priv->vdi_in_ch_n);
> +err_next:
> +	ipu_idmac_put(priv->vdi_in_ch);
> +err_curr:
> +	ipu_idmac_put(priv->vdi_in_ch_p);
> +err_prev:
> +	ipu_ic_put(priv->ic);
> +err_ic:
> +	ipu_vdi_put(priv->vdi);
> +err_vdi:
> +	return ret;
> +}
> +
> +static void ipu_mem2mem_vdic_put_ipu_resources(struct ipu_mem2mem_vdic_p=
riv *priv)
> +{
> +	ipu_idmac_put(priv->vdi_out_ch);
> +	ipu_idmac_put(priv->vdi_in_ch_n);
> +	ipu_idmac_put(priv->vdi_in_ch);
> +	ipu_idmac_put(priv->vdi_in_ch_p);
> +	ipu_ic_put(priv->ic);
> +	ipu_vdi_put(priv->vdi);
> +}
> +
> +int imx_media_mem2mem_vdic_register(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D to_mem2mem_priv(vdev);
> +	struct video_device *vfd =3D vdev->vfd;
> +	int ret;
> +
> +	vfd->v4l2_dev =3D &priv->md->v4l2_dev;
> +
> +	ret =3D ipu_mem2mem_vdic_get_ipu_resources(priv, vfd);
> +	if (ret) {
> +		v4l2_err(vfd->v4l2_dev, "Failed to get VDIC resources (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(vfd->v4l2_dev, "Failed to register video device\n");
> +		goto err_register;
> +	}
> +
> +	v4l2_info(vfd->v4l2_dev, "Registered %s as /dev/%s\n", vfd->name,
> +		  video_device_node_name(vfd));
> +
> +	return 0;
> +
> +err_register:
> +	ipu_mem2mem_vdic_put_ipu_resources(priv);
> +	return ret;
> +}
> +
> +void imx_media_mem2mem_vdic_unregister(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D to_mem2mem_priv(vdev);
> +	struct video_device *vfd =3D priv->vdev.vfd;
> +
> +	video_unregister_device(vfd);
> +
> +	ipu_mem2mem_vdic_put_ipu_resources(priv);
> +}
> +
> +struct imx_media_video_dev *
> +imx_media_mem2mem_vdic_init(struct imx_media_dev *md, int ipu_id)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->md =3D md;
> +	priv->ipu_id =3D ipu_id;
> +	priv->ipu_dev =3D md->ipu[ipu_id];
> +	priv->dev =3D md->md.dev;
> +
> +	mutex_init(&priv->mutex);
> +
> +	vfd =3D video_device_alloc();
> +	if (!vfd) {
> +		ret =3D -ENOMEM;
> +		goto err_vfd;
> +	}
> +
> +	*vfd =3D mem2mem_template;
> +	vfd->lock =3D &priv->mutex;
> +	priv->vdev.vfd =3D vfd;
> +
> +	INIT_LIST_HEAD(&priv->vdev.list);
> +	spin_lock_init(&priv->irqlock);
> +	atomic_set(&priv->stream_count, 0);
> +
> +	video_set_drvdata(vfd, priv);
> +
> +	priv->m2m_dev =3D v4l2_m2m_init(&m2m_ops);
> +	if (IS_ERR(priv->m2m_dev)) {
> +		ret =3D PTR_ERR(priv->m2m_dev);
> +		v4l2_err(&md->v4l2_dev, "Failed to init mem2mem device: %d\n",
> +			 ret);
> +		goto err_m2m;
> +	}
> +
> +	/* Reset formats */
> +	priv->fmt[V4L2_M2M_SRC] =3D ipu_mem2mem_vdic_default;
> +	priv->fmt[V4L2_M2M_SRC].pixelformat =3D V4L2_PIX_FMT_YUV420;
> +	priv->fmt[V4L2_M2M_SRC].field =3D V4L2_FIELD_SEQ_TB;
> +	priv->fmt[V4L2_M2M_SRC].bytesperline =3D DEFAULT_WIDTH;
> +	priv->fmt[V4L2_M2M_SRC].sizeimage =3D DEFAULT_WIDTH * DEFAULT_HEIGHT * =
3 / 2;
> +
> +	priv->fmt[V4L2_M2M_DST] =3D ipu_mem2mem_vdic_default;
> +	priv->fmt[V4L2_M2M_DST].pixelformat =3D V4L2_PIX_FMT_RGB565;
> +	priv->fmt[V4L2_M2M_DST].field =3D V4L2_FIELD_NONE;
> +	priv->fmt[V4L2_M2M_DST].bytesperline =3D DEFAULT_WIDTH * 2;
> +	priv->fmt[V4L2_M2M_DST].sizeimage =3D DEFAULT_WIDTH * DEFAULT_HEIGHT * =
2;
> +
> +	return &priv->vdev;
> +
> +err_m2m:
> +	video_device_release(vfd);
> +	video_set_drvdata(vfd, NULL);
> +err_vfd:
> +	kfree(priv);
> +	return ERR_PTR(ret);
> +}
> +
> +void imx_media_mem2mem_vdic_uninit(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv =3D to_mem2mem_priv(vdev);
> +	struct video_device *vfd =3D priv->vdev.vfd;
> +
> +	video_device_release(vfd);
> +	video_set_drvdata(vfd, NULL);
> +	kfree(priv);
> +}
> +
> +MODULE_DESCRIPTION("i.MX VDIC mem2mem de-interlace driver");
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/medi=
a/imx/imx-media.h
> index f095d9134fee4..9f2388e306727 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -162,6 +162,9 @@ struct imx_media_dev {
>  	/* IC scaler/CSC mem2mem video device */
>  	struct imx_media_video_dev *m2m_vdev;
> =20
> +	/* VDIC mem2mem video device */
> +	struct imx_media_video_dev *m2m_vdic[2];
> +
>  	/* the IPU internal subdev's registered synchronously */
>  	struct v4l2_subdev *sync_sd[2][NUM_IPU_SUBDEVS];
>  };
> @@ -284,6 +287,13 @@ imx_media_csc_scaler_device_init(struct imx_media_de=
v *dev);
>  int imx_media_csc_scaler_device_register(struct imx_media_video_dev *vde=
v);
>  void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *=
vdev);
> =20
> +/* imx-media-mem2mem-vdic.c */
> +struct imx_media_video_dev *
> +imx_media_mem2mem_vdic_init(struct imx_media_dev *dev, int ipu_id);
> +void imx_media_mem2mem_vdic_uninit(struct imx_media_video_dev *vdev);
> +int imx_media_mem2mem_vdic_register(struct imx_media_video_dev *vdev);
> +void imx_media_mem2mem_vdic_unregister(struct imx_media_video_dev *vdev)=
;
> +
>  /* subdev group ids */
>  #define IMX_MEDIA_GRP_ID_CSI2          BIT(8)
>  #define IMX_MEDIA_GRP_ID_IPU_CSI_BIT   10

