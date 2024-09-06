Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D796EEBA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B078D10E821;
	Fri,  6 Sep 2024 09:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5DE10E821
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:01:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1smUqM-0002aw-2Z; Fri, 06 Sep 2024 11:01:26 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1smUqL-005uBl-8I; Fri, 06 Sep 2024 11:01:25 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1smUqL-0003Xt-0W;
 Fri, 06 Sep 2024 11:01:25 +0200
Message-ID: <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Fri, 06 Sep 2024 11:01:25 +0200
In-Reply-To: <20240724002044.112544-2-marex@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Marek,

On Mi, 2024-07-24 at 02:19 +0200, Marek Vasut wrote:
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

Instead of presenting two devices to userspace, it would be better to
have a single video device that can distribute work to both IPUs.
To be fair, we never implemented that for the CSC/scaler mem2mem device
either.

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

These could be inline functions for added type safety.

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

This always outputs at a frame rate of half the field rate, and only
top fields are ever used as current field, and bottom fields as
previous/next fields, right?

I think it would be good to add a mode that doesn't drop the

	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);

output frames, right from the start.

If we don't start with that supported, I fear userspace will make
assumptions and be surprised when a full rate mode is added later.

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

This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=3D2, which is documented
as "full motion, only vertical filter is used". Doesn't this completely
ignore the previous/next fields and only use the output of the di_vfilt
four tap vertical filter block to fill in missing lines from the
surrounding pixels (above and below) of the current field?

I think this should at least be configurable, and probably default to
MED_MOTION.

regards
Philipp

