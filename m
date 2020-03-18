Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4248018A3C7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 21:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329EE6E95C;
	Wed, 18 Mar 2020 20:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB4A6E95C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:30:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 66A5380611;
 Wed, 18 Mar 2020 21:30:38 +0100 (CET)
Date: Wed, 18 Mar 2020 21:30:36 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 2/5] drm: xlnx: DRM/KMS driver for Xilinx ZynqMP
 DisplayPort Subsystem
Message-ID: <20200318203036.GB28612@ravnborg.org>
References: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
 <20200318153728.25843-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318153728.25843-3-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=Am4ss40yAAAA:8
 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8 a=smPYqembdX3uSWlFwrAA:9
 a=saj2HN4Z5LB2afD9:21 a=yKui89M-4B57n09a:21 a=h6BqrBipB1c4H9xl:21
 a=wPNLvfGTeEIA:10 a=lf-hbUz_c89dky27wAWH:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

Some drive by comments, I tired to do a full review but lost the full
picture.

	Sam

General comments:
- The newly introduced drm_err() and friends could repalce uses of
  dev_err() & co. in some/most places
- The dirver uses the xilinx specific term "layer" where DRM uses plane.
  It makes the code less readable for the average DRM reader, but I
  guess easier for the average Xilinx reader. Tradeoff..
- The code uses kernel-doc formatting all over. But the
  code is not wired into Documentation/ se we do not see
  it in the generated doc.
- Copyright =3D> 2020
- It may just be me - but I am confused that the driver is named
  zynqmp_dpsub.
  I reads like something else.
  And then we have zynqmp_dp which is a module inside zynqmp_dpsub...


> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> new file mode 100644
> index 000000000000..2b844c60a80a
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/Makefile
> @@ -0,0 +1,2 @@
> +zynqmp-dpsub-objs +=3D zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o

The modern syntax is to use:
zynqmp-dpsub-y :=3D zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o

- No "+=3D" as the code do not append to an existing variable.
- Use "-y", so conditionals are better supported.

Many drivers use a name similar to zynqmp_drv - for the driver parts.

> +obj-$(CONFIG_DRM_ZYNQMP_DPSUB) +=3D zynqmp-dpsub.o

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zy=
nqmp_disp.c
> new file mode 100644
> index 000000000000..41c9548225e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -0,0 +1,1708 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ZynqMP Display Controller Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include "zynqmp_disp.h"
> +#include "zynqmp_disp_regs.h"
> +#include "zynqmp_dp.h"
> +#include "zynqmp_dpsub.h"
> +
> +/*
> + * Overview
> + * --------
> + *
> + * The display controller part of ZynqMP DP subsystem, made of the Audio=
/Video
> + * Buffer Manager, the Video Rendering Pipeline (blender) and the Audio =
Mixer.
> + *
> + *              +-------------------------------------------------------=
-----+
> + * +--------+   | +----------------+     +-----------+                  =
     |
> + * | DPDMA  | --->|                | --> |   Video   | Video +----------=
---+ |
> + * | 4x vid |   | |                |     | Rendering | -+--> |          =
   | |   +------+
> + * | 2x aud |   | |  Audio/Video   | --> | Pipeline  |  |    | DisplayPo=
rt |---> | PHY0 |
> + * +--------+   | | Buffer Manager |     +-----------+  |    |   Source =
   | |   +------+
> + *              | |    and STC     |     +-----------+  |    | Controlle=
r  | |   +------+
> + * Live Video --->|                | --> |   Audio   | Audio |          =
   |---> | PHY1 |
> + *              | |                |     |   Mixer   | --+-> |          =
   | |   +------+
> + * Live Audio --->|                | --> |           |  ||   +----------=
---+ |
> + *              | +----------------+     +-----------+  ||              =
     |
> + *              +---------------------------------------||--------------=
-----+
> + *                                                      vv
> + *                                                Blended Video and
> + *                                                Mixed Audio to PL
> + *
> + * Only non-live input from the DPDMA and output to the DisplayPort Sour=
ce
> + * Controller are currently supported. Interface with the programmable l=
ogic
> + * for live streams is not implemented.
> + *
> + * The display controller code creates planes for the DPDMA video and gr=
aphics
> + * layers, and a CRTC for the Video Rendering Pipeline.
> + *
> + * interface into those 3 blocks. In high level, the driver is layered
> + * in the following way:
Is something missing before "interface"? Sentence seems incomplete.

Nice overview!

> + *
> + * zynqmp_disp_crtc & zynqmp_disp_plane
> + * |->zynqmp_disp
> + *	|->zynqmp_disp_aud
> + *	|->zynqmp_disp_blend
> + *	|->zynqmp_disp_avbuf
> + */
> +
> +#define ZYNQMP_DISP_AV_BUF_NUM_VID_GFX_BUFFERS		4
> +#define ZYNQMP_DISP_AV_BUF_NUM_BUFFERS			6
> +
> +#define ZYNQMP_DISP_NUM_LAYERS				2
> +#define ZYNQMP_DISP_MAX_NUM_SUB_PLANES			3
> +
> +/**
> + * struct zynqmp_disp_format - Display subsystem format information
> + * @drm_fmt: DRM format (4CC)
> + * @buf_fmt: AV buffer format
> + * @bus_fmt: Media bus formats (live formats)
> + * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
> + * @sf: Scaling factors for color components
> + */
> +struct zynqmp_disp_format {
> +	u32 drm_fmt;
> +	u32 buf_fmt;
> +	u32 bus_fmt;
> +	bool swap;
> +	const u32 *sf;
> +};
> +
> +/**
> + * enum zynqmp_disp_id - Layer identifier
> + * @ZYNQMP_DISP_LAYER_VID: Video layer
> + * @ZYNQMP_DISP_LAYER_GFX: Graphics layer
> + */
> +enum zynqmp_disp_layer_id {
> +	ZYNQMP_DISP_LAYER_VID,
> +	ZYNQMP_DISP_LAYER_GFX
> +};
> +
> +/**
> + * enum zynqmp_disp_layer_mode - Layer mode
> + * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
> + * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
> + */
> +enum zynqmp_disp_layer_mode {
> +	ZYNQMP_DISP_LAYER_NONLIVE,
> +	ZYNQMP_DISP_LAYER_LIVE
> +};
> +
> +/**
> + * struct zynqmp_disp_layer_dma - DMA channel for one data plane of a la=
yer
> + * @chan: DMA channel
> + * @xt: Interleaved DMA descriptor template
> + * @sgl: Data chunk for dma_interleaved_template
> + */
> +struct zynqmp_disp_layer_dma {
> +	struct dma_chan *chan;
> +	struct dma_interleaved_template xt;
> +	struct data_chunk sgl;
> +};
> +
> +/**
> + * struct zynqmp_disp_layer_info - Static layer information
> + * @formats: Array of supported formats
> + * @num_formats: Number of formats in @formats array
> + * @num_channels: Number of DMA channels
> + */
> +struct zynqmp_disp_layer_info {
> +	const struct zynqmp_disp_format *formats;
> +	unsigned int num_formats;
> +	unsigned int num_channels;
> +};
> +
> +/**
> + * struct zynqmp_disp_layer - Display layer (DRM plane)
> + * @plane: DRM plane
> + * @id: Layer ID
> + * @disp: Back pointer to struct zynqmp_disp
> + * @info: Static layer information
> + * @dmas: DMA channels
> + * @disp_fmt: Current format information
> + * @drm_fmt: Current DRM format information
> + * @mode: Current operation mode
> + */
> +struct zynqmp_disp_layer {
> +	struct drm_plane plane;
> +	enum zynqmp_disp_layer_id id;
> +	struct zynqmp_disp *disp;
> +	const struct zynqmp_disp_layer_info *info;
> +
> +	struct zynqmp_disp_layer_dma dmas[ZYNQMP_DISP_MAX_NUM_SUB_PLANES];
> +
> +	const struct zynqmp_disp_format *disp_fmt;
> +	const struct drm_format_info *drm_fmt;
> +	enum zynqmp_disp_layer_mode mode;
> +};
> +
> +/**
> + * struct zynqmp_disp_blend - Blender
> + * @base: Registers I/O base address
> + */
> +struct zynqmp_disp_blend {
> +	void __iomem *base;
> +};
> +
> +/**
> + * struct zynqmp_disp_avbuf - Audio/video buffer manager
> + * @base: Registers I/O base address
> + */
> +struct zynqmp_disp_avbuf {
> +	void __iomem *base;
> +};
> +
> +/**
> + * struct zynqmp_disp_audio - Audio mixer
> + * @base: Registers I/O base address
> + * @_ps_clk: Audio clock from PS
> + * @_pl_clk: Audio clock from PL
> + * @clk: Audio clock
> + */
> +struct zynqmp_disp_audio {
> +	void __iomem *base;
> +	struct clk *_ps_clk;
> +	struct clk *_pl_clk;
> +	struct clk *clk;
> +};
Nitpick - why start names with '_'?

    dp_aud_clk
    dp_live_audio_aclk

had been much more descriptive - this is the name in the binding anyway.


> +
> +/**
> + * struct zynqmp_disp - Display controller
> + * @dev: Device structure
> + * @drm: DRM core
> + * @dpsub: Display subsystem
> + * @crtc: DRM CRTC
> + * @blend: Blender (video rendering pipeline)
> + * @avbuf: Audio/video buffer manager
> + * @audio: Audio mixer
> + * @layers: Layers (planes)
> + * @event: Pending vblank event request
> + * @_ps_pclk: Pixel clock from PS
> + * @_pl_pclk: Pixel clock from PL
> + * @pclk: Pixel clock
> + */
> +struct zynqmp_disp {
> +	struct device *dev;
> +	struct drm_device *drm;
Modern drm drivers embed drm_device.
But that comment I think belongs to zynqmp_dpsub.

> +	struct zynqmp_dpsub *dpsub;
> +
> +	struct drm_crtc crtc;
> +
> +	struct zynqmp_disp_blend blend;
> +	struct zynqmp_disp_avbuf avbuf;
> +	struct zynqmp_disp_audio audio;
> +
> +	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
> +
> +	struct drm_pending_vblank_event *event;
> +
> +	/* Don't operate directly on _ps_ */
> +	struct clk *_ps_pclk;
> +	struct clk *_pl_pclk;
> +	struct clk *pclk;
> +};
Same rant on names of clk here.

zynqmp_disp._ps_pclk and zynqmp_disp_audio._ps_clk are only used as
flags in the code.
Make this explicit with two flalgs like this:
    zynqmp_disp_audio._ps_clk =3D> bool video_from_ps;
    zynqmp_disp._ps_pclk =3D> bool audio_from_ps;

Just an idea.

> +
> +/* ---------------------------------------------------------------------=
--------
> + * Audio/Video Buffer Manager
> + */
> +
> +static const u32 scaling_factors_444[] =3D {
> +	ZYNQMP_DISP_AV_BUF_4BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_4BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_4BIT_SF,
> +};
> +
...
> +
> +/* List of video layer formats */
> +static const struct zynqmp_disp_format avbuf_vid_fmts[] =3D {
> +	{
> +		.drm_fmt	=3D DRM_FORMAT_VYUY,
> +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_VID_VYUY,
> +		.swap		=3D true,
> +		.sf		=3D scaling_factors_888,
...
> +};
> +
> +/* List of graphics layer formats */
> +static const struct zynqmp_disp_format avbuf_gfx_fmts[] =3D {
> +	{
> +		.drm_fmt	=3D DRM_FORMAT_ABGR8888,
> +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> +		.swap		=3D false,
> +		.sf		=3D scaling_factors_888,
...
> +};
> +
> +static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp_avbuf *avbuf, int r=
eg)
> +{
> +	return readl(avbuf->base + reg);
> +}
> +
> +static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
> +				    int reg, u32 val)
> +{
> +	writel(val, avbuf->base + reg);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_set_format - Set the input format for a layer
> + * @avbuf: Audio/video buffer manager
> + * @layer: The layer ID
> + * @fmt: The format information
> + *
> + * Set the video buffer manager format for @layer to @fmt.
> + */
> +static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf *avbuf,
> +					 enum zynqmp_disp_layer_id layer,
> +					 const struct zynqmp_disp_format *fmt)
> +{
> +	unsigned int i;
> +	u32 val;
> +
> +	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
> +	val &=3D layer =3D=3D ZYNQMP_DISP_LAYER_VID
> +	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
> +	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
> +	val |=3D fmt->buf_fmt;
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
> +		unsigned int reg =3D layer =3D=3D ZYNQMP_DISP_LAYER_VID
> +				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
> +				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
> +
> +		zynqmp_disp_avbuf_write(avbuf, reg, fmt->sf[i]);
> +	}
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_set_clocks_sources - Set the clocks sources
> + * @avbuf: Audio/video buffer manager
> + * @video_from_ps: True if the video clock originates from the PS
> + * @audio_from_ps: True if the audio clock originates from the PS
> + * @timings_internal: True if video timings are generated internally
> + *
> + * Set the source for the video and audio clocks, as well as for the vid=
eo
> + * timings. Clocks can originate from the PS or PL, and timings can be
> + * generated internally or externally.
> + */
> +static void
> +zynqmp_disp_avbuf_set_clocks_sources(struct zynqmp_disp_avbuf *avbuf,
> +				     bool video_from_ps, bool audio_from_ps,
> +				     bool timings_internal)
> +{
> +	u32 val =3D 0;
> +
> +	if (video_from_ps)
> +		val |=3D ZYNQMP_DISP_AV_BUF_CLK_SRC_VID_FROM_PS;
> +	if (audio_from_ps)
> +		val |=3D ZYNQMP_DISP_AV_BUF_CLK_SRC_AUD_FROM_PS;
> +	if (timings_internal)
> +		val |=3D ZYNQMP_DISP_AV_BUF_CLK_SRC_VID_INTERNAL_TIMING;
> +
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_CLK_SRC, val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_enable_channels - Enable buffer channels
> + * @avbuf: Audio/video buffer manager
> + *
> + * Enable all (video and audio) buffer channels.
> + */
> +static void zynqmp_disp_avbuf_enable_channels(struct zynqmp_disp_avbuf *=
avbuf)
> +{
> +	unsigned int i;
> +	u32 val;
> +
> +	val =3D ZYNQMP_DISP_AV_BUF_CHBUF_EN |
> +	      (ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_MAX <<
> +	       ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_SHIFT);
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_AV_BUF_NUM_VID_GFX_BUFFERS; i++)
> +		zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_CHBUF(i),
> +					val);
> +
> +	val =3D ZYNQMP_DISP_AV_BUF_CHBUF_EN |
> +	      (ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_AUD_MAX <<
> +	       ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_SHIFT);
> +
> +	for (; i < ZYNQMP_DISP_AV_BUF_NUM_BUFFERS; i++)
> +		zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_CHBUF(i),
> +					val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_disable_channels - Disable buffer channels
> + * @avbuf: Audio/video buffer manager
> + *
> + * Disable all (video and audio) buffer channels.
> + */
> +static void zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf =
*avbuf)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_AV_BUF_NUM_BUFFERS; i++)
> +		zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_CHBUF(i),
> +					ZYNQMP_DISP_AV_BUF_CHBUF_FLUSH);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_enable_audio - Enable audio
> + * @avbuf: Audio/video buffer manager
> + *
> + * Enable all audio buffers with a non-live (memory) source.
> + */
> +static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf *avb=
uf)
> +{
> +	u32 val;
> +
> +	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> +	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
> +	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
> +	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_disable_audio - Disable audio
> + * @avbuf: Audio/video buffer manager
> + *
> + * Disable all audio buffers.
> + */
> +static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *av=
buf)
> +{
> +	u32 val;
> +
> +	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> +	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
> +	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE;
> +	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_enable_video - Enable a video layer
> + * @avbuf: Audio/video buffer manager
> + * @layer: The layer ID
> + * @mode: Operating mode of layer
> + *
> + * Enable the video/graphics buffer for @layer.
> + */
> +static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avb=
uf,
> +					   enum zynqmp_disp_layer_id layer,
> +					   enum zynqmp_disp_layer_mode mode)
> +{
> +	u32 val;
> +
> +	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> +	if (layer =3D=3D ZYNQMP_DISP_LAYER_VID) {
> +		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
> +		if (mode =3D=3D ZYNQMP_DISP_LAYER_NONLIVE)
> +			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
> +		else
> +			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
> +	} else {
> +		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
> +		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
> +		if (mode =3D=3D ZYNQMP_DISP_LAYER_NONLIVE)
> +			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
> +		else
> +			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
> +	}
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_disable_video - Disable a video layer
> + * @avbuf: Audio/video buffer manager
> + * @layer: The layer ID
> + *
> + * Disable the video/graphics buffer for @layer.
> + */
> +static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *av=
buf,
> +					    enum zynqmp_disp_layer_id layer)
> +{
> +	u32 val;
> +
> +	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> +	if (layer =3D=3D ZYNQMP_DISP_LAYER_VID) {
> +		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
> +		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
> +	} else {
> +		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
> +		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE;
> +	}
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_enable - Enable the video pipe
> + * @avbuf: Audio/video buffer manager
> + *
> + * De-assert the video pipe reset.
> + */
> +static void zynqmp_disp_avbuf_enable(struct zynqmp_disp_avbuf *avbuf)
> +{
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_SRST_REG, 0);
> +}
> +
> +/**
> + * zynqmp_disp_avbuf_disable - Disable the video pipe
> + * @avbuf: Audio/video buffer manager
> + *
> + * Assert the video pipe reset.
> + */
> +static void zynqmp_disp_avbuf_disable(struct zynqmp_disp_avbuf *avbuf)
> +{
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_SRST_REG,
> +				ZYNQMP_DISP_AV_BUF_SRST_REG_VID_RST);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Blender (Video Pipeline)
> + */
> +
> +static void zynqmp_disp_blend_write(struct zynqmp_disp_blend *blend,
> +				    int reg, u32 val)
> +{
> +	writel(val, blend->base + reg);
> +}
> +
> +/*
> + * Colorspace conversion matrices.
> + *
> + * Hardcode RGB <-> YUV conversion to full-range SDTV for now.
> + */
> +static const u16 csc_zero_matrix[] =3D {
> +	0x0,    0x0,    0x0,
> +	0x0,    0x0,    0x0,
> +	0x0,    0x0,    0x0
> +};
> +
> +static const u16 csc_identity_matrix[] =3D {
> +	0x1000, 0x0,    0x0,
> +	0x0,    0x1000, 0x0,
> +	0x0,    0x0,    0x1000
> +};
> +
> +static const u32 csc_zero_offsets[] =3D {
> +	0, 0, 0
> +};
> +
> +static const u16 csc_rgb_to_sdtv_matrix[] =3D {
> +	0x4c9,  0x864,  0x1d3,
> +	0x7d4d, 0x7ab3, 0x800,
> +	0x800,  0x794d, 0x7eb3
> +};
> +
> +static const u32 csc_rgb_to_sdtv_offsets[] =3D {
> +	0x0, 0x8000000, 0x8000000
> +};
> +
> +static const u16 csc_sdtv_to_rgb_matrix[] =3D {
> +	0x1000, 0x166f, 0x0,
> +	0x1000, 0x7483, 0x7a7f,
> +	0x1000, 0x0,    0x1c5a
> +};
> +
> +static const u32 csc_sdtv_to_rgb_offsets[] =3D {
> +	0x0, 0x1800, 0x1800
> +};
> +
> +/**
> + * zynqmp_disp_blend_set_output_format - Set the output format of the bl=
ender
> + * @blend: Blender object
> + * @format: Output format
> + *
> + * Set the output format of the blender to @format.
> + */
> +static void zynqmp_disp_blend_set_output_format(struct zynqmp_disp_blend=
 *blend,
> +						enum zynqmp_dpsub_format format)
> +{
> +	static const unsigned int blend_output_fmts[] =3D {
> +		[ZYNQMP_DPSUB_FORMAT_RGB] =3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_RGB,
> +		[ZYNQMP_DPSUB_FORMAT_YCRCB444] =3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_=
YCBCR444,
> +		[ZYNQMP_DPSUB_FORMAT_YCRCB422] =3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_=
YCBCR422
> +					       | ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_EN_DOWNSAMPLE,
> +		[ZYNQMP_DPSUB_FORMAT_YONLY] =3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YON=
LY,
> +	};
> +
> +	u32 fmt =3D blend_output_fmts[format];
> +	const u16 *coeffs;
> +	const u32 *offsets;
> +	unsigned int i;
> +
> +	zynqmp_disp_blend_write(blend, ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT, fmt);
> +	if (fmt =3D=3D ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_RGB) {
> +		coeffs =3D csc_identity_matrix;
> +		offsets =3D csc_zero_offsets;
> +	} else {
> +		coeffs =3D csc_rgb_to_sdtv_matrix;
> +		offsets =3D csc_rgb_to_sdtv_offsets;
> +	}
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_V_BLEND_NUM_COEFF; i++)
> +		zynqmp_disp_blend_write(blend,
> +					ZYNQMP_DISP_V_BLEND_RGB2YCBCR_COEFF(i),
> +					coeffs[i]);
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_V_BLEND_NUM_OFFSET; i++)
> +		zynqmp_disp_blend_write(blend,
> +					ZYNQMP_DISP_V_BLEND_OUTCSC_OFFSET(i),
> +					offsets[i]);
> +}
> +
> +/**
> + * zynqmp_disp_blend_set_bg_color - Set the background color
> + * @blend: Blender object
> + * @rcr: Red/Cr color component
> + * @gy: Green/Y color component
> + * @bcb: Blue/Cb color component
> + *
> + * Set the background color to (@rcr, @gy, @bcb), corresponding to the R=
, G and
> + * B or Cr, Y and Cb components respectively depending on the selected o=
utput
> + * format.
> + */
> +static void zynqmp_disp_blend_set_bg_color(struct zynqmp_disp_blend *ble=
nd,
> +					   u32 rcr, u32 gy, u32 bcb)
> +{
> +	zynqmp_disp_blend_write(blend, ZYNQMP_DISP_V_BLEND_BG_CLR_0, rcr);
> +	zynqmp_disp_blend_write(blend, ZYNQMP_DISP_V_BLEND_BG_CLR_1, gy);
> +	zynqmp_disp_blend_write(blend, ZYNQMP_DISP_V_BLEND_BG_CLR_2, bcb);
> +}
> +
> +/**
> + * zynqmp_disp_blend_set_global_alpha - Configure global alpha blending
> + * @blend: Blender object
> + * @enable: True to enable global alpha blending
> + * @alpha: Global alpha value (ignored if @enabled is false)
> + */
> +static void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp_blend =
*blend,
> +					       bool enable, u32 alpha)
> +{
> +	zynqmp_disp_blend_write(blend, ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA,
> +				ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA_VALUE(alpha) |
> +				(enable ? ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA_EN : 0));
> +}
> +
> +/**
> + * zynqmp_disp_blend_layer_set_csc - Configure colorspace conversion for=
 layer
> + * @blend: Blender object
> + * @layer: The layer
> + * @coeffs: Colorspace conversion matrix
> + * @offsets: Colorspace conversion offsets
> + *
> + * Configure the input colorspace conversion matrix and offsets for the =
@layer.
> + * Columns of the matrix are automatically swapped based on the input fo=
rmat to
> + * handle RGB and YCrCb components permutations.
> + */
> +static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *bl=
end,
> +					    struct zynqmp_disp_layer *layer,
> +					    const u16 *coeffs,
> +					    const u32 *offsets)
> +{
> +	unsigned int swap[3] =3D { 0, 1, 2 };
> +	unsigned int reg;
> +	unsigned int i;
> +
> +	if (layer->disp_fmt->swap) {
> +		if (layer->drm_fmt->is_yuv) {
> +			/* Swap U and V. */
> +			swap[1] =3D 2;
> +			swap[2] =3D 1;
> +		} else {
> +			/* Swap R and B. */
> +			swap[0] =3D 2;
> +			swap[2] =3D 0;
> +		}
> +	}
> +
> +	if (layer->id =3D=3D ZYNQMP_DISP_LAYER_VID)
> +		reg =3D ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
> +	else
> +		reg =3D ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_V_BLEND_NUM_COEFF; i +=3D 3, reg +=3D 12)=
 {
> +		zynqmp_disp_blend_write(blend, reg + 0, coeffs[i + swap[0]]);
> +		zynqmp_disp_blend_write(blend, reg + 4, coeffs[i + swap[1]]);
> +		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
> +	}
> +
> +	if (layer->id =3D=3D ZYNQMP_DISP_LAYER_VID)
> +		reg =3D ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
> +	else
> +		reg =3D ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_V_BLEND_NUM_OFFSET; i++)
> +		zynqmp_disp_blend_write(blend, reg + i * 4, offsets[i]);
> +}
> +
> +/**
> + * zynqmp_disp_blend_layer_enable - Enable a layer
> + * @blend: Blender object
> + * @layer: The layer
> + */
> +static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp_blend *ble=
nd,
> +					   struct zynqmp_disp_layer *layer)
> +{
> +	const u16 *coeffs;
> +	const u32 *offsets;
> +	u32 val;
> +
> +	val =3D (layer->drm_fmt->is_yuv ?
> +	       0 : ZYNQMP_DISP_V_BLEND_LAYER_CONTROL_RGB) |
> +	      (layer->drm_fmt->hsub > 1 ?
> +	       ZYNQMP_DISP_V_BLEND_LAYER_CONTROL_EN_US : 0);
> +
> +	zynqmp_disp_blend_write(blend,
> +				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
> +				val);
> +
> +	if (layer->drm_fmt->is_yuv) {
> +		coeffs =3D csc_sdtv_to_rgb_matrix;
> +		offsets =3D csc_sdtv_to_rgb_offsets;
> +	} else {
> +		coeffs =3D csc_identity_matrix;
> +		offsets =3D csc_zero_offsets;
> +	}
> +
> +	zynqmp_disp_blend_layer_set_csc(blend, layer, coeffs, offsets);
> +}
> +
> +/**
> + * zynqmp_disp_blend_layer_disable - Disable a layer
> + * @blend: Blender object
> + * @layer: The layer
> + */
> +static void zynqmp_disp_blend_layer_disable(struct zynqmp_disp_blend *bl=
end,
> +					    struct zynqmp_disp_layer *layer)
> +{
> +	zynqmp_disp_blend_write(blend,
> +				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
> +				0);
> +
> +	zynqmp_disp_blend_layer_set_csc(blend, layer, csc_zero_matrix,
> +					csc_zero_offsets);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Audio Mixer
> + */
> +
> +static void zynqmp_disp_audio_write(struct zynqmp_disp_audio *audio,
> +				  int reg, u32 val)
> +{
> +	writel(val, audio->base + reg);
> +}
> +
> +/**
> + * zynqmp_disp_audio_enable - Enable the audio mixer
> + * @audio: Audio mixer
> + *
> + * Enable the audio mixer by de-asserting the soft reset. The audio stat=
e is set to
> + * default values by the reset, set the default mixer volume explicitly.
> + */
> +static void zynqmp_disp_audio_enable(struct zynqmp_disp_audio *audio)
> +{
> +	/* Clear the audio soft reset register as it's an non-reset flop. */
> +	zynqmp_disp_audio_write(audio, ZYNQMP_DISP_AUD_SOFT_RESET, 0);
> +	zynqmp_disp_audio_write(audio, ZYNQMP_DISP_AUD_MIXER_VOLUME,
> +				ZYNQMP_DISP_AUD_MIXER_VOLUME_NO_SCALE);
> +}
> +
> +/**
> + * zynqmp_disp_audio_disable - Disable the audio mixer
> + * @audio: Audio mixer
> + *
> + * Disable the audio mixer by asserting its soft reset.
> + */
> +static void zynqmp_disp_audio_disable(struct zynqmp_disp_audio *audio)
> +{
> +	zynqmp_disp_audio_write(audio, ZYNQMP_DISP_AUD_SOFT_RESET,
> +				ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST);
> +}
> +
> +static void zynqmp_disp_audio_init(struct device *dev,
> +				 struct zynqmp_disp_audio *audio)
> +{
> +	/* Try the live PL audio clock. */
> +	audio->_pl_clk =3D devm_clk_get(dev, "dp_live_audio_aclk");
> +	if (!IS_ERR(audio->_pl_clk)) {
> +		audio->clk =3D audio->_pl_clk;
> +		return;
> +	}
> +
> +	/* If the live PL audio clock is not valid, fall back to PS clock. */
> +	audio->_ps_clk =3D devm_clk_get(dev, "dp_aud_clk");
> +	if (!IS_ERR(audio->_ps_clk)) {
> +		audio->clk =3D audio->_ps_clk;
> +		return;
> +	}
> +
> +	dev_err(dev, "audio disabled due to missing clock\n");
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * ZynqMP Display external functions for zynqmp_dp
> + */
> +
> +/**
> + * zynqmp_disp_handle_vblank - Handle the vblank event
> + * @disp: Display controller
> + *
> + * This function handles the vblank interrupt, and sends an event to
> + * CRTC object. This will be called by the DP vblank interrupt handler.
> + */
> +void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
> +{
> +	struct drm_crtc *crtc =3D &disp->crtc;
> +
> +	drm_crtc_handle_vblank(crtc);
> +}
> +
> +/**
> + * zynqmp_disp_audio_enabled - If the audio is enabled
> + * @disp: Display controller
> + *
> + * Return if the audio is enabled depending on the audio clock.
> + *
> + * Return: true if audio is enabled, or false.
> + */
> +bool zynqmp_disp_audio_enabled(struct zynqmp_disp *disp)
> +{
> +	return !!disp->audio.clk;
> +}
> +
> +/**
> + * zynqmp_disp_get_audio_clk_rate - Get the current audio clock rate
> + * @disp: Display controller
> + *
> + * Return: the current audio clock rate.
> + */
> +unsigned int zynqmp_disp_get_audio_clk_rate(struct zynqmp_disp *disp)
> +{
> +	if (zynqmp_disp_audio_enabled(disp))
> +		return 0;
> +	return clk_get_rate(disp->audio.clk);
> +}
> +
> +/**
> + * zynqmp_disp_get_crtc_mask - Return the CRTC bit mask
> + * @disp: Display controller
> + *
> + * Return: the crtc mask of the zyqnmp_disp CRTC.
> + */
> +uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp)
> +{
> +	return drm_crtc_mask(&disp->crtc);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * ZynqMP Display Layer & DRM Plane
> + */
> +
> +/**
> + * zynqmp_disp_layer_find_format - Find format information for a DRM for=
mat
> + * @layer: The layer
> + * @drm_fmt: DRM format to search
> + *
> + * Search display subsystem format information corresponding to the give=
n DRM
> + * format @drm_fmt for the @layer, and return a pointer to the format
> + * descriptor.
> + *
> + * Return: A pointer to the format descriptor if found, NULL otherwise
> + */
> +static const struct zynqmp_disp_format *
> +zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
> +			      u32 drm_fmt)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < layer->info->num_formats; i++) {
> +		if (layer->info->formats[i].drm_fmt =3D=3D drm_fmt)
> +			return &layer->info->formats[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * zynqmp_disp_layer_enable - Enable a layer
> + * @layer: The layer
> + *
> + * Enable the @layer in the audio/video buffer manager and the blender. =
DMA
> + * channels are started separately by zynqmp_disp_layer_update().
> + */
> +static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
> +{
> +	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
> +				       ZYNQMP_DISP_LAYER_NONLIVE);
> +	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
> +
> +	layer->mode =3D ZYNQMP_DISP_LAYER_NONLIVE;
> +}
> +
> +/**
> + * zynqmp_disp_layer_disable - Disable the layer
> + * @layer: The layer
> + *
> + * Disable the layer by stopping its DMA channels and disabling it in the
> + * audio/video buffer manager and the blender.
> + */
> +static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < layer->drm_fmt->num_planes; i++)
> +		dmaengine_terminate_sync(layer->dmas[i].chan);
> +
> +	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
> +	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
> +}
> +
> +/**
> + * zynqmp_disp_layer_set_format - Set the layer format
> + * @layer: The layer
> + * @state: The plane state
> + *
> + * Set the format for @layer based on @state->fb->format. The layer must=
 be
> + * disabled.
> + */
> +static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> +					 struct drm_plane_state *state)
> +{
> +	const struct drm_format_info *info =3D state->fb->format;
> +	unsigned int i;
> +
> +	layer->disp_fmt =3D zynqmp_disp_layer_find_format(layer, info->format);
> +	layer->drm_fmt =3D info;
> +
> +	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
> +				     layer->disp_fmt);
> +
> +	/*
> +	 * Set slave_id for each DMA channel to indicate they're part of a
> +	 * video group.
> +	 */
> +	for (i =3D 0; i < info->num_planes; i++) {
> +		struct zynqmp_disp_layer_dma *dma =3D &layer->dmas[i];
> +		struct dma_slave_config config =3D {
> +			.direction =3D DMA_MEM_TO_DEV,
> +			.slave_id =3D 1,
> +		};
> +
> +		dmaengine_slave_config(dma->chan, &config);
> +	}
> +}
> +
> +/**
> + * zynqmp_disp_layer_update - Update the layer framebuffer
> + * @layer: The layer
> + * @state: The plane state
> + *
> + * Update the framebuffer for the layer by issuing a new DMA engine tran=
saction
> + * for the new framebuffer.
> + *
> + * Return: 0 on success, or the DMA descriptor failure error otherwise
> + */
> +static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
> +				    struct drm_plane_state *state)
> +{
> +	const struct drm_format_info *info =3D layer->drm_fmt;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < layer->drm_fmt->num_planes; i++) {
> +		unsigned int width =3D state->crtc_w / (i ? info->hsub : 1);
> +		unsigned int height =3D state->crtc_h / (i ? info->vsub : 1);
> +		struct zynqmp_disp_layer_dma *dma =3D &layer->dmas[i];
> +		struct dma_async_tx_descriptor *desc;
> +		dma_addr_t paddr;
> +
> +		paddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
> +
> +		dma->xt.numf =3D height;
> +		dma->sgl.size =3D width * info->cpp[i];
> +		dma->sgl.icg =3D state->fb->pitches[i] - dma->sgl.size;
> +		dma->xt.src_start =3D paddr;
> +		dma->xt.frame_size =3D 1;
> +		dma->xt.dir =3D DMA_MEM_TO_DEV;
> +		dma->xt.src_sgl =3D true;
> +		dma->xt.dst_sgl =3D false;
> +
> +		desc =3D dmaengine_prep_interleaved_cyclic(dma->chan, &dma->xt,
> +							 DMA_CTRL_ACK);
> +		if (!desc) {
> +			dev_err(layer->disp->dev,
> +				"failed to prepare DMA descriptor\n");
> +			return -ENOMEM;
> +		}
> +
> +		dmaengine_submit(desc);
> +		dma_async_issue_pending(dma->chan);
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct zynqmp_disp_layer *plane_to_layer(struct drm_plane =
*plane)
> +{
> +	return container_of(plane, struct zynqmp_disp_layer, plane);
> +}
> +
> +static int
> +zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
> +			       struct drm_plane_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +
> +	if (!state->crtc)
> +		return 0;
> +
> +	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> +	if (IS_ERR(crtc_state))
> +		return PTR_ERR(crtc_state);
> +
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   false, false);
> +}
> +
> +static void
> +zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
> +				 struct drm_plane_state *old_state)
> +{
> +	struct zynqmp_disp_layer *layer =3D plane_to_layer(plane);
> +
> +	if (!old_state->fb)
> +		return;
> +
> +	zynqmp_disp_layer_disable(layer);
> +}
> +
> +static void
> +zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
> +				struct drm_plane_state *old_state)
> +{
> +	struct zynqmp_disp_layer *layer =3D plane_to_layer(plane);
> +	bool format_changed =3D false;
> +
> +	if (!old_state->fb ||
> +	    old_state->fb->format->format !=3D plane->state->fb->format->format)
> +		format_changed =3D true;
> +
> +	/*
> +	 * If the format has changed (including going from a previously
> +	 * disabled state to any format), reconfigure the format. Disable the
> +	 * plane first if needed.
> +	 */
> +	if (format_changed) {
> +		if (old_state->fb)
> +			zynqmp_disp_layer_disable(layer);
> +
> +		zynqmp_disp_layer_set_format(layer, plane->state);
> +	}
> +
> +	zynqmp_disp_layer_update(layer, plane->state);
> +
> +	/* Enable or re-enable the plane is the format has changed. */
> +	if (format_changed)
> +		zynqmp_disp_layer_enable(layer);
> +}
> +
> +static const struct drm_plane_helper_funcs zynqmp_disp_plane_helper_func=
s =3D {
> +	.atomic_check		=3D zynqmp_disp_plane_atomic_check,
> +	.atomic_update		=3D zynqmp_disp_plane_atomic_update,
> +	.atomic_disable		=3D zynqmp_disp_plane_atomic_disable,
> +};
> +
> +static const struct drm_plane_funcs zynqmp_disp_plane_funcs =3D {
> +	.update_plane		=3D drm_atomic_helper_update_plane,
> +	.disable_plane		=3D drm_atomic_helper_disable_plane,
> +	.destroy		=3D drm_plane_cleanup,
> +	.reset			=3D drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
> +{
> +	unsigned int i, j;
> +	int ret;
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
> +		struct zynqmp_disp_layer *layer =3D &disp->layers[i];
> +		enum drm_plane_type type;
> +		u32 *drm_formats;
> +
> +		drm_formats =3D devm_kcalloc(disp->dev, sizeof(*drm_formats),
> +					   layer->info->num_formats,
> +					   GFP_KERNEL);
I *think* there is a life-time issue with drm_formats.
But that is fixable with drmm_kcalloc()

> +		if (!drm_formats)
> +			return -ENOMEM;
> +
> +		for (j =3D 0; j < layer->info->num_formats; ++j)
> +			drm_formats[j] =3D layer->info->formats[j].drm_fmt;
> +
> +		/* Graphics layer is primary, and video layer is overlay. */
> +		type =3D i =3D=3D ZYNQMP_DISP_LAYER_GFX
> +		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> +		ret =3D drm_universal_plane_init(disp->drm, &layer->plane, 0,
> +					       &zynqmp_disp_plane_funcs,
> +					       drm_formats,
> +					       layer->info->num_formats,
> +					       NULL, type, NULL);
> +		if (ret)
> +			return ret;
> +
> +		drm_plane_helper_add(&layer->plane,
> +				     &zynqmp_disp_plane_helper_funcs);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_disp_layer_release_dma - Release DMA channels for a layer
> + * @disp: Display controller
> + * @layer: The layer
> + *
> + * Release the DMA channels associated with @layer.
> + */
> +static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
> +					  struct zynqmp_disp_layer *layer)
> +{
> +	unsigned int i;
> +
> +	if (!layer->info)
> +		return;
> +
> +	for (i =3D 0; i < layer->info->num_channels; i++) {
> +		struct zynqmp_disp_layer_dma *dma =3D &layer->dmas[i];
> +
> +		if (!dma->chan)
> +			continue;
> +
> +		/* Make sure the channel is terminated before release. */
> +		dmaengine_terminate_sync(dma->chan);
> +		dma_release_channel(dma->chan);
> +	}
> +}
> +
> +/**
> + * zynqmp_disp_destroy_layers - Destroy all layers
> + * @disp: Display controller
> + */
> +static void zynqmp_disp_destroy_layers(struct zynqmp_disp *disp)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
> +		zynqmp_disp_layer_release_dma(disp, &disp->layers[i]);
> +}
> +
> +/**
> + * zynqmp_disp_layer_request_dma - Request DMA channels for a layer
> + * @disp: Display controller
> + * @layer: The layer
> + *
> + * Request all DMA engine channels needed by @layer.
> + *
> + * Return: 0 on success, or the DMA channel request error otherwise
> + */
> +static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
> +					 struct zynqmp_disp_layer *layer)
> +{
> +	static const char * const dma_names[] =3D { "vid", "gfx" };
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < layer->info->num_channels; i++) {
> +		struct zynqmp_disp_layer_dma *dma =3D &layer->dmas[i];
> +		char dma_channel_name[16];
> +
> +		snprintf(dma_channel_name, sizeof(dma_channel_name),
> +			 "%s%u", dma_names[layer->id], i);
> +		dma->chan =3D of_dma_request_slave_channel(disp->dev->of_node,
> +							 dma_channel_name);
> +		if (IS_ERR(dma->chan)) {
> +			dev_err(disp->dev, "failed to request dma channel\n");
> +			ret =3D PTR_ERR(dma->chan);
> +			dma->chan =3D NULL;
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_disp_create_layers - Create all layers
> + * @disp: Display controller
> + *
> + * Return: 0 on success, or the DMA channel request error otherwise
> + */
> +static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
> +{
> +	static const struct zynqmp_disp_layer_info layer_info[] =3D {
> +		[ZYNQMP_DISP_LAYER_VID] =3D {
> +			.formats =3D avbuf_vid_fmts,
> +			.num_formats =3D ARRAY_SIZE(avbuf_vid_fmts),
> +			.num_channels =3D 3,
> +		},
> +		[ZYNQMP_DISP_LAYER_GFX] =3D {
> +			.formats =3D avbuf_gfx_fmts,
> +			.num_formats =3D ARRAY_SIZE(avbuf_gfx_fmts),
> +			.num_channels =3D 1,
> +		},
> +	};
> +
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_NUM_LAYERS; i++) {
> +		struct zynqmp_disp_layer *layer =3D &disp->layers[i];
> +
> +		layer->id =3D i;
> +		layer->disp =3D disp;
> +		layer->info =3D &layer_info[i];
> +
> +		ret =3D zynqmp_disp_layer_request_dma(disp, layer);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	zynqmp_disp_destroy_layers(disp);
> +	return ret;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * ZynqMP Display & DRM CRTC
> + */
> +
> +/**
> + * zynqmp_disp_enable - Enable the display controller
> + * @disp: Display controller
> + */
> +static void zynqmp_disp_enable(struct zynqmp_disp *disp)
> +{
> +	zynqmp_disp_avbuf_enable(&disp->avbuf);
> +	/* Choose clock source based on the DT clock handle. */
> +	zynqmp_disp_avbuf_set_clocks_sources(&disp->avbuf, !!disp->_ps_pclk,
> +					     !!disp->audio._ps_clk, true);
> +	zynqmp_disp_avbuf_enable_channels(&disp->avbuf);
> +	zynqmp_disp_avbuf_enable_audio(&disp->avbuf);
> +
> +	zynqmp_disp_audio_enable(&disp->audio);
> +}
> +
> +/**
> + * zynqmp_disp_disable - Disable the display controller
> + * @disp: Display controller
> + */
> +static void zynqmp_disp_disable(struct zynqmp_disp *disp)
> +{
> +	struct drm_crtc *crtc =3D &disp->crtc;
> +
> +	zynqmp_disp_audio_disable(&disp->audio);
> +
> +	zynqmp_disp_avbuf_disable_audio(&disp->avbuf);
> +	zynqmp_disp_avbuf_disable_channels(&disp->avbuf);
> +	zynqmp_disp_avbuf_disable(&disp->avbuf);
> +
> +	/* Mark the flip is done as crtc is disabled anyway */
> +	if (crtc->state->event) {
> +		complete_all(crtc->state->event->base.completion);
> +		crtc->state->event =3D NULL;
> +	}
> +}
> +
> +static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
> +{
> +	return container_of(crtc, struct zynqmp_disp, crtc);
> +}
> +
> +static int zynqmp_disp_crtc_setup_clock(struct drm_crtc *crtc,
> +					struct drm_display_mode *adjusted_mode)
> +{
> +	struct zynqmp_disp *disp =3D crtc_to_disp(crtc);
> +	unsigned long mode_clock =3D adjusted_mode->clock * 1000;
> +	unsigned long rate;
> +	long diff;
> +	int ret;
> +
> +	ret =3D clk_set_rate(disp->pclk, mode_clock);
> +	if (ret) {
> +		dev_err(disp->dev, "failed to set a pixel clock\n");
> +		return ret;
> +	}
> +
> +	rate =3D clk_get_rate(disp->pclk);
> +	diff =3D rate - mode_clock;
> +	if (abs(diff) > mode_clock / 20)
> +		dev_info(disp->dev,
> +			 "requested pixel rate: %lu actual rate: %lu\n",
> +			 mode_clock, rate);
> +	else
> +		dev_dbg(disp->dev,
> +			"requested pixel rate: %lu actual rate: %lu\n",
> +			mode_clock, rate);
> +
> +	return 0;
> +}
> +
> +static void
> +zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
> +			       struct drm_crtc_state *old_crtc_state)
> +{
> +	struct zynqmp_disp *disp =3D crtc_to_disp(crtc);
> +	struct drm_display_mode *adjusted_mode =3D &crtc->state->adjusted_mode;
> +	int ret, vrefresh;
> +
> +	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);
> +
> +	pm_runtime_get_sync(disp->dev);
> +	ret =3D clk_prepare_enable(disp->pclk);
> +	if (ret) {
> +		dev_err(disp->dev, "failed to enable a pixel clock\n");
> +		pm_runtime_put_sync(disp->dev);
> +		return;
> +	}
> +
> +	zynqmp_disp_blend_set_output_format(&disp->blend,
> +					    ZYNQMP_DPSUB_FORMAT_RGB);
> +	zynqmp_disp_blend_set_bg_color(&disp->blend, 0, 0, 0);
> +	zynqmp_disp_blend_set_global_alpha(&disp->blend, false, 0);
> +
> +	zynqmp_disp_enable(disp);
> +
> +	/* Delay of 3 vblank intervals for timing gen to be stable */
> +	vrefresh =3D (adjusted_mode->clock * 1000) /
> +		   (adjusted_mode->vtotal * adjusted_mode->htotal);
> +	msleep(3 * 1000 / vrefresh);
> +}
> +
> +static void
> +zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
> +				struct drm_crtc_state *old_crtc_state)
> +{
> +	struct zynqmp_disp *disp =3D crtc_to_disp(crtc);
> +	struct drm_plane_state *old_plane_state;
> +
> +	/*
> +	 * Disable the plane if active. The old plane state can be NULL in the
> +	 * .shutdown() path if the plane is already disabled, skip
> +	 * zynqmp_disp_plane_atomic_disable() in that case.
> +	 */
> +	old_plane_state =3D drm_atomic_get_old_plane_state(old_crtc_state->stat=
e,
> +							 crtc->primary);
> +	if (old_plane_state)
> +		zynqmp_disp_plane_atomic_disable(crtc->primary, old_plane_state);
> +
> +	zynqmp_disp_disable(disp);
> +
> +	drm_crtc_vblank_off(&disp->crtc);
> +
> +	clk_disable_unprepare(disp->pclk);
> +	pm_runtime_put_sync(disp->dev);
> +}
> +
> +static int zynqmp_disp_crtc_atomic_check(struct drm_crtc *crtc,
> +					 struct drm_crtc_state *state)
> +{
> +	return drm_atomic_add_affected_planes(state->state, crtc);
> +}
> +
> +static void
> +zynqmp_disp_crtc_atomic_begin(struct drm_crtc *crtc,
> +			      struct drm_crtc_state *old_crtc_state)
> +{
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void
> +zynqmp_disp_crtc_atomic_flush(struct drm_crtc *crtc,
> +			      struct drm_crtc_state *old_crtc_state)
> +{
> +	if (crtc->state->event) {
> +		struct drm_pending_vblank_event *event;
> +
> +		/* Consume the flip_done event from atomic helper. */
> +		event =3D crtc->state->event;
> +		crtc->state->event =3D NULL;
> +
> +		event->pipe =3D drm_crtc_index(crtc);
> +
> +		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_arm_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +static const struct drm_crtc_helper_funcs zynqmp_disp_crtc_helper_funcs =
=3D {
> +	.atomic_enable	=3D zynqmp_disp_crtc_atomic_enable,
> +	.atomic_disable	=3D zynqmp_disp_crtc_atomic_disable,
> +	.atomic_check	=3D zynqmp_disp_crtc_atomic_check,
> +	.atomic_begin	=3D zynqmp_disp_crtc_atomic_begin,
> +	.atomic_flush	=3D zynqmp_disp_crtc_atomic_flush,
> +};
> +
> +static int zynqmp_disp_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct zynqmp_disp *disp =3D crtc_to_disp(crtc);
> +
> +	zynqmp_dp_enable_vblank(disp->dpsub->dp);
> +
> +	return 0;
> +}
> +
> +static void zynqmp_disp_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct zynqmp_disp *disp =3D crtc_to_disp(crtc);
> +
> +	zynqmp_dp_disable_vblank(disp->dpsub->dp);
> +}
> +
> +static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs =3D {
> +	.destroy		=3D drm_crtc_cleanup,
> +	.set_config		=3D drm_atomic_helper_set_config,
> +	.page_flip		=3D drm_atomic_helper_page_flip,
> +	.reset			=3D drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank		=3D zynqmp_disp_crtc_enable_vblank,
> +	.disable_vblank		=3D zynqmp_disp_crtc_disable_vblank,
> +};
> +
> +static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
> +{
> +	struct drm_plane *plane =3D &disp->layers[ZYNQMP_DISP_LAYER_GFX].plane;
> +	int ret;
> +
> +	ret =3D drm_crtc_init_with_planes(disp->drm, &disp->crtc, plane,
> +					NULL, &zynqmp_disp_crtc_funcs, NULL);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_crtc_helper_add(&disp->crtc, &zynqmp_disp_crtc_helper_funcs);
> +
> +	/* Start with vertical blanking interrupt reporting disabled. */
> +	drm_crtc_vblank_off(&disp->crtc);
> +
> +	return 0;
> +}
> +
> +static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
> +{
> +	u32 possible_crtcs =3D drm_crtc_mask(&disp->crtc);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ZYNQMP_DISP_NUM_LAYERS; i++)
> +		disp->layers[i].plane.possible_crtcs =3D possible_crtcs;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Initialization & Cleanup
> + */
> +
> +int zynqmp_disp_init(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
> +{
> +	struct zynqmp_disp *disp =3D dpsub->disp;
> +	int ret;
> +
> +	disp->drm =3D drm;
> +
> +	ret =3D zynqmp_disp_create_planes(disp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D zynqmp_disp_create_crtc(disp);
> +	if (ret < 0)
> +		return ret;
> +
> +	zynqmp_disp_map_crtc_to_plane(disp);
> +
> +	return 0;
> +}
> +
> +int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct platform_device=
 *pdev)
> +{
> +	struct zynqmp_disp *disp;
> +	struct zynqmp_disp_layer *layer;
> +	struct resource *res;
> +	int ret;
> +
> +	disp =3D devm_kzalloc(&pdev->dev, sizeof(*disp), GFP_KERNEL);
> +	if (!disp)
> +		return -ENOMEM;
> +	disp->dev =3D &pdev->dev;
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "blend");
> +	disp->blend.base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(disp->blend.base))
> +		return PTR_ERR(disp->blend.base);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "av_buf");
> +	disp->avbuf.base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(disp->avbuf.base))
> +		return PTR_ERR(disp->avbuf.base);
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "aud");
> +	disp->audio.base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(disp->audio.base))
> +		return PTR_ERR(disp->audio.base);
> +
> +	dpsub->disp =3D disp;
> +	disp->dpsub =3D dpsub;
> +
> +	/* Try the live PL video clock */
> +	disp->_pl_pclk =3D devm_clk_get(disp->dev, "dp_live_video_in_clk");
> +	if (!IS_ERR(disp->_pl_pclk))
> +		disp->pclk =3D disp->_pl_pclk;
> +	else if (PTR_ERR(disp->_pl_pclk) =3D=3D -EPROBE_DEFER)
> +		return PTR_ERR(disp->_pl_pclk);
> +
> +	/* If the live PL video clock is not valid, fall back to PS clock */
> +	if (!disp->pclk) {
> +		disp->_ps_pclk =3D devm_clk_get(disp->dev, "dp_vtc_pixel_clk_in");
> +		if (IS_ERR(disp->_ps_pclk)) {
> +			dev_err(disp->dev, "failed to init any video clock\n");
> +			return PTR_ERR(disp->_ps_pclk);
> +		}
> +		disp->pclk =3D disp->_ps_pclk;
> +	}
> +
> +	zynqmp_disp_audio_init(disp->dev, &disp->audio);
> +
> +	ret =3D zynqmp_disp_create_layers(disp);
> +	if (ret)
> +		return ret;
> +
> +	layer =3D &disp->layers[ZYNQMP_DISP_LAYER_VID];
> +	dpsub->dma_align =3D 1 << layer->dmas[0].chan->device->copy_align;
> +
> +	return 0;
> +}
> +
> +void zynqmp_disp_remove(struct zynqmp_dpsub *dpsub)
> +{
> +	struct zynqmp_disp *disp =3D dpsub->disp;
> +
> +	zynqmp_disp_destroy_layers(disp);
> +	dpsub->disp =3D NULL;
> +}
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zy=
nqmp_disp.h
> new file mode 100644
> index 000000000000..93ad36ad7ef3
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ZynqMP Display Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef _ZYNQMP_DISP_H_
> +#define _ZYNQMP_DISP_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * 3840x2160 is advertised as the maximum resolution, but almost any
> + * resolutions under a 300Mhz pixel rate would work. Pick 4096x4096.
> + */
> +#define ZYNQMP_DISP_MAX_WIDTH				4096
> +#define ZYNQMP_DISP_MAX_HEIGHT				4096
> +
> +/* The DPDMA is limited to 44 bit addressing. */
> +#define ZYNQMP_DISP_MAX_DMA_BIT				44
> +
> +struct device;
> +struct drm_device;
> +struct platform_device;
> +struct zynqmp_disp;
> +struct zynqmp_dpsub;
> +
> +void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp);
> +bool zynqmp_disp_audio_enabled(struct zynqmp_disp *disp);
> +unsigned int zynqmp_disp_get_audio_clk_rate(struct zynqmp_disp *disp);
> +uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp);
> +
> +int zynqmp_disp_init(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
> +
> +int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct platform_device=
 *pdev);
> +void zynqmp_disp_remove(struct zynqmp_dpsub *dpsub);
> +
> +#endif /* _ZYNQMP_DISP_H_ */
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xl=
nx/zynqmp_disp_regs.h
> new file mode 100644
> index 000000000000..c92e2c2bd22e
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> @@ -0,0 +1,201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ZynqMP Display Controller Driver - Register Definitions
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef _ZYNQMP_DISP_REGS_H_
> +#define _ZYNQMP_DISP_REGS_H_
> +
> +#include <linux/bits.h>
> +
> +/* Blender registers */
> +#define ZYNQMP_DISP_V_BLEND_BG_CLR_0			0x0
> +#define ZYNQMP_DISP_V_BLEND_BG_CLR_1			0x4
> +#define ZYNQMP_DISP_V_BLEND_BG_CLR_2			0x8
> +#define ZYNQMP_DISP_V_BLEND_BG_MAX			0xfff
> +#define ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA		0xc
> +#define ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA_VALUE(n)	((n) << 1)
> +#define ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA_EN		BIT(0)
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT		0x14
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_RGB		0x0
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YCBCR444	0x1
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YCBCR422	0x2
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_YONLY	0x3
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_XVYCC	0x4
> +#define ZYNQMP_DISP_V_BLEND_OUTPUT_VID_FMT_EN_DOWNSAMPLE	BIT(4)
> +#define ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(n)		(0x18 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_LAYER_CONTROL_EN_US		BIT(0)
> +#define ZYNQMP_DISP_V_BLEND_LAYER_CONTROL_RGB		BIT(1)
> +#define ZYNQMP_DISP_V_BLEND_LAYER_CONTROL_BYPASS	BIT(8)
> +#define ZYNQMP_DISP_V_BLEND_NUM_COEFF			9
> +#define ZYNQMP_DISP_V_BLEND_NUM_OFFSET			3
> +#define ZYNQMP_DISP_V_BLEND_RGB2YCBCR_COEFF(n)		(0x20 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(n)		(0x44 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(n)		(0x68 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_OUTCSC_OFFSET(n)		(0x74 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(n)		(0x80 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(n)		(0xa4 + ((n) * 4))
> +#define ZYNQMP_DISP_V_BLEND_CHROMA_KEY_ENABLE		0x1d0
> +#define ZYNQMP_DISP_V_BLEND_CHROMA_KEY_COMP1		0x1d4
> +#define ZYNQMP_DISP_V_BLEND_CHROMA_KEY_COMP2		0x1d8
> +#define ZYNQMP_DISP_V_BLEND_CHROMA_KEY_COMP3		0x1dc
> +
> +/* AV buffer manager registers */
> +#define ZYNQMP_DISP_AV_BUF_FMT				0x0
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_SHIFT		0
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK		(0x1f << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_UYVY		(0 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_VYUY		(1 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YVYU		(2 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUYV		(3 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16		(4 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24		(5 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI		(6 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO		(7 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI2		(8 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444		(9 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_RGB888		(10 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_RGBA8880		(11 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_RGB888_10		(12 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10		(13 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI2_10	(14 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10		(15 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16_10		(16 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10		(17 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10		(18 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16_420		(19 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420	(20 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI2_420	(21 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16_420_10	(22 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10	(23 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI2_420_10	(24 << 0)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_SHIFT		8
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK		(0xf << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888		(0 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888		(1 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGB888		(2 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_BGR888		(3 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA5551		(4 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA4444		(5 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGB565		(6 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_8BPP		(7 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_4BPP		(8 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_2BPP		(9 << 8)
> +#define ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_1BPP		(10 << 8)
> +#define ZYNQMP_DISP_AV_BUF_NON_LIVE_LATENCY		0x8
> +#define ZYNQMP_DISP_AV_BUF_CHBUF(n)			(0x10 + ((n) * 4))
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_EN			BIT(0)
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_FLUSH			BIT(1)
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_SHIFT	2
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_MASK		(0xf << 2)
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_MAX		0xf
> +#define ZYNQMP_DISP_AV_BUF_CHBUF_BURST_LEN_AUD_MAX	0x3
> +#define ZYNQMP_DISP_AV_BUF_STATUS			0x28
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL			0x2c
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EN			BIT(0)
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EVENT_SHIFT		1
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EVENT_EX_VSYNC	0
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EVENT_EX_VID	1
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EVENT_EX_AUD	2
> +#define ZYNQMP_DISP_AV_BUF_STC_CTRL_EVENT_INT_VSYNC	3
> +#define ZYNQMP_DISP_AV_BUF_STC_INIT_VALUE0		0x30
> +#define ZYNQMP_DISP_AV_BUF_STC_INIT_VALUE1		0x34
> +#define ZYNQMP_DISP_AV_BUF_STC_ADJ			0x38
> +#define ZYNQMP_DISP_AV_BUF_STC_VID_VSYNC_TS0		0x3c
> +#define ZYNQMP_DISP_AV_BUF_STC_VID_VSYNC_TS1		0x40
> +#define ZYNQMP_DISP_AV_BUF_STC_EXT_VSYNC_TS0		0x44
> +#define ZYNQMP_DISP_AV_BUF_STC_EXT_VSYNC_TS1		0x48
> +#define ZYNQMP_DISP_AV_BUF_STC_CUSTOM_EVENT_TS0		0x4c
> +#define ZYNQMP_DISP_AV_BUF_STC_CUSTOM_EVENT_TS1		0x50
> +#define ZYNQMP_DISP_AV_BUF_STC_CUSTOM_EVENT2_TS0	0x54
> +#define ZYNQMP_DISP_AV_BUF_STC_CUSTOM_EVENT2_TS1	0x58
> +#define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT0		0x60
> +#define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT1		0x64
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT			0x70
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT		0
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		(0x3 << 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE		(0 << 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM		(1 << 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN		(2 << 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE		(3 << 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT		2
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		(0x3 << 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE		(0 << 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM		(1 << 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE		(2 << 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE		(3 << 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT		4
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		(0x3 << 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL		(0 << 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM		(1 << 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN		(2 << 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE		(3 << 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN		BIT(6)
> +#define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0		0x74
> +#define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1		0x78
> +#define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT		0x100
> +#define ZYNQMP_DISP_AV_BUF_CLK_SRC			0x120
> +#define ZYNQMP_DISP_AV_BUF_CLK_SRC_VID_FROM_PS		BIT(0)
> +#define ZYNQMP_DISP_AV_BUF_CLK_SRC_AUD_FROM_PS		BIT(1)
> +#define ZYNQMP_DISP_AV_BUF_CLK_SRC_VID_INTERNAL_TIMING	BIT(2)
> +#define ZYNQMP_DISP_AV_BUF_SRST_REG			0x124
> +#define ZYNQMP_DISP_AV_BUF_SRST_REG_VID_RST		BIT(1)
> +#define ZYNQMP_DISP_AV_BUF_AUDIO_CH_CONFIG		0x12c
> +#define ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(n)		(0x200 + ((n) * 4))
> +#define ZYNQMP_DISP_AV_BUF_VID_COMP_SF(n)		(0x20c + ((n) * 4))
> +#define ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(n)		(0x218 + ((n) * 4))
> +#define ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG		0x224
> +#define ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(n)		(0x228 + ((n) * 4))
> +#define ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG		0x234
> +#define ZYNQMP_DISP_AV_BUF_4BIT_SF			0x11111
> +#define ZYNQMP_DISP_AV_BUF_5BIT_SF			0x10842
> +#define ZYNQMP_DISP_AV_BUF_6BIT_SF			0x10410
> +#define ZYNQMP_DISP_AV_BUF_8BIT_SF			0x10101
> +#define ZYNQMP_DISP_AV_BUF_10BIT_SF			0x10040
> +#define ZYNQMP_DISP_AV_BUF_NULL_SF			0
> +#define ZYNQMP_DISP_AV_BUF_NUM_SF			3
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_6		0x0
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8		0x1
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
> +#define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
> +
> +/* Audio registers */
> +#define ZYNQMP_DISP_AUD_MIXER_VOLUME			0x0
> +#define ZYNQMP_DISP_AUD_MIXER_VOLUME_NO_SCALE		0x20002000
> +#define ZYNQMP_DISP_AUD_MIXER_META_DATA			0x4
> +#define ZYNQMP_DISP_AUD_CH_STATUS0			0x8
> +#define ZYNQMP_DISP_AUD_CH_STATUS1			0xc
> +#define ZYNQMP_DISP_AUD_CH_STATUS2			0x10
> +#define ZYNQMP_DISP_AUD_CH_STATUS3			0x14
> +#define ZYNQMP_DISP_AUD_CH_STATUS4			0x18
> +#define ZYNQMP_DISP_AUD_CH_STATUS5			0x1c
> +#define ZYNQMP_DISP_AUD_CH_A_DATA0			0x20
> +#define ZYNQMP_DISP_AUD_CH_A_DATA1			0x24
> +#define ZYNQMP_DISP_AUD_CH_A_DATA2			0x28
> +#define ZYNQMP_DISP_AUD_CH_A_DATA3			0x2c
> +#define ZYNQMP_DISP_AUD_CH_A_DATA4			0x30
> +#define ZYNQMP_DISP_AUD_CH_A_DATA5			0x34
> +#define ZYNQMP_DISP_AUD_CH_B_DATA0			0x38
> +#define ZYNQMP_DISP_AUD_CH_B_DATA1			0x3c
> +#define ZYNQMP_DISP_AUD_CH_B_DATA2			0x40
> +#define ZYNQMP_DISP_AUD_CH_B_DATA3			0x44
> +#define ZYNQMP_DISP_AUD_CH_B_DATA4			0x48
> +#define ZYNQMP_DISP_AUD_CH_B_DATA5			0x4c
> +#define ZYNQMP_DISP_AUD_SOFT_RESET			0xc00
> +#define ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST		BIT(0)
> +
> +#endif /* _ZYNQMP_DISP_REGS_H_ */
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynq=
mp_dp.c
> new file mode 100644
> index 000000000000..409d4a35cbf9
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -0,0 +1,1742 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ZynqMP DisplayPort Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_dp_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/phy/phy.h>
> +#include <linux/reset.h>
> +
> +#include "zynqmp_disp.h"
> +#include "zynqmp_dp.h"
> +#include "zynqmp_dpsub.h"
> +
> +static uint zynqmp_dp_aux_timeout_ms =3D 50;
> +module_param_named(aux_timeout_ms, zynqmp_dp_aux_timeout_ms, uint, 0444);
> +MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default:=
 50)");
> +
> +/*
> + * Some sink requires a delay after power on request
> + */
> +static uint zynqmp_dp_power_on_delay_ms =3D 4;
> +module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint,=
 0444);
> +MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)=
");
> +
> +/* Link configuration registers */
> +#define ZYNQMP_DP_LINK_BW_SET				0x0
> +#define ZYNQMP_DP_LANE_COUNT_SET			0x4
> +#define ZYNQMP_DP_ENHANCED_FRAME_EN			0x8
> +#define ZYNQMP_DP_TRAINING_PATTERN_SET			0xc
> +#define ZYNQMP_DP_SCRAMBLING_DISABLE			0x14
> +#define ZYNQMP_DP_DOWNSPREAD_CTL			0x18
> +#define ZYNQMP_DP_SOFTWARE_RESET			0x1c
> +#define ZYNQMP_DP_SOFTWARE_RESET_STREAM1		BIT(0)
> +#define ZYNQMP_DP_SOFTWARE_RESET_STREAM2		BIT(1)
> +#define ZYNQMP_DP_SOFTWARE_RESET_STREAM3		BIT(2)
> +#define ZYNQMP_DP_SOFTWARE_RESET_STREAM4		BIT(3)
> +#define ZYNQMP_DP_SOFTWARE_RESET_AUX			BIT(7)
> +#define ZYNQMP_DP_SOFTWARE_RESET_ALL			(ZYNQMP_DP_SOFTWARE_RESET_STREAM1=
 | \
> +							 ZYNQMP_DP_SOFTWARE_RESET_STREAM2 | \
> +							 ZYNQMP_DP_SOFTWARE_RESET_STREAM3 | \
> +							 ZYNQMP_DP_SOFTWARE_RESET_STREAM4 | \
> +							 ZYNQMP_DP_SOFTWARE_RESET_AUX)
> +
> +/* Core enable registers */
> +#define ZYNQMP_DP_TRANSMITTER_ENABLE			0x80
> +#define ZYNQMP_DP_MAIN_STREAM_ENABLE			0x84
> +#define ZYNQMP_DP_FORCE_SCRAMBLER_RESET			0xc0
> +#define ZYNQMP_DP_VERSION				0xf8
> +#define ZYNQMP_DP_VERSION_MAJOR_MASK			GENMASK(31, 24)
> +#define ZYNQMP_DP_VERSION_MAJOR_SHIFT			24
> +#define ZYNQMP_DP_VERSION_MINOR_MASK			GENMASK(23, 16)
> +#define ZYNQMP_DP_VERSION_MINOR_SHIFT			16
> +#define ZYNQMP_DP_VERSION_REVISION_MASK			GENMASK(15, 12)
> +#define ZYNQMP_DP_VERSION_REVISION_SHIFT		12
> +#define ZYNQMP_DP_VERSION_PATCH_MASK			GENMASK(11, 8)
> +#define ZYNQMP_DP_VERSION_PATCH_SHIFT			8
> +#define ZYNQMP_DP_VERSION_INTERNAL_MASK			GENMASK(7, 0)
> +#define ZYNQMP_DP_VERSION_INTERNAL_SHIFT		0
> +
> +/* Core ID registers */
> +#define ZYNQMP_DP_CORE_ID				0xfc
> +#define ZYNQMP_DP_CORE_ID_MAJOR_MASK			GENMASK(31, 24)
> +#define ZYNQMP_DP_CORE_ID_MAJOR_SHIFT			24
> +#define ZYNQMP_DP_CORE_ID_MINOR_MASK			GENMASK(23, 16)
> +#define ZYNQMP_DP_CORE_ID_MINOR_SHIFT			16
> +#define ZYNQMP_DP_CORE_ID_REVISION_MASK			GENMASK(15, 8)
> +#define ZYNQMP_DP_CORE_ID_REVISION_SHIFT		8
> +#define ZYNQMP_DP_CORE_ID_DIRECTION			GENMASK(1)
> +
> +/* AUX channel interface registers */
> +#define ZYNQMP_DP_AUX_COMMAND				0x100
> +#define ZYNQMP_DP_AUX_COMMAND_CMD_SHIFT			8
> +#define ZYNQMP_DP_AUX_COMMAND_ADDRESS_ONLY		BIT(12)
> +#define ZYNQMP_DP_AUX_COMMAND_BYTES_SHIFT		0
> +#define ZYNQMP_DP_AUX_WRITE_FIFO			0x104
> +#define ZYNQMP_DP_AUX_ADDRESS				0x108
> +#define ZYNQMP_DP_AUX_CLK_DIVIDER			0x10c
> +#define ZYNQMP_DP_AUX_CLK_DIVIDER_AUX_FILTER_SHIFT	8
> +#define ZYNQMP_DP_INTERRUPT_SIGNAL_STATE		0x130
> +#define ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD		BIT(0)
> +#define ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST	BIT(1)
> +#define ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY		BIT(2)
> +#define ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT	BIT(3)
> +#define ZYNQMP_DP_AUX_REPLY_DATA			0x134
> +#define ZYNQMP_DP_AUX_REPLY_CODE			0x138
> +#define ZYNQMP_DP_AUX_REPLY_CODE_AUX_ACK		(0)
> +#define ZYNQMP_DP_AUX_REPLY_CODE_AUX_NACK		BIT(0)
> +#define ZYNQMP_DP_AUX_REPLY_CODE_AUX_DEFER		BIT(1)
> +#define ZYNQMP_DP_AUX_REPLY_CODE_I2C_ACK		(0)
> +#define ZYNQMP_DP_AUX_REPLY_CODE_I2C_NACK		BIT(2)
> +#define ZYNQMP_DP_AUX_REPLY_CODE_I2C_DEFER		BIT(3)
> +#define ZYNQMP_DP_AUX_REPLY_COUNT			0x13c
> +#define ZYNQMP_DP_REPLY_DATA_COUNT			0x148
> +#define ZYNQMP_DP_REPLY_DATA_COUNT_MASK			0xff
> +#define ZYNQMP_DP_INT_STATUS				0x3a0
> +#define ZYNQMP_DP_INT_MASK				0x3a4
> +#define ZYNQMP_DP_INT_EN				0x3a8
> +#define ZYNQMP_DP_INT_DS				0x3ac
> +#define ZYNQMP_DP_INT_HPD_IRQ				BIT(0)
> +#define ZYNQMP_DP_INT_HPD_EVENT				BIT(1)
> +#define ZYNQMP_DP_INT_REPLY_RECEIVED			BIT(2)
> +#define ZYNQMP_DP_INT_REPLY_TIMEOUT			BIT(3)
> +#define ZYNQMP_DP_INT_HPD_PULSE_DET			BIT(4)
> +#define ZYNQMP_DP_INT_EXT_PKT_TXD			BIT(5)
> +#define ZYNQMP_DP_INT_LIV_ABUF_UNDRFLW			BIT(12)
> +#define ZYNQMP_DP_INT_VBLANK_START			BIT(13)
> +#define ZYNQMP_DP_INT_PIXEL1_MATCH			BIT(14)
> +#define ZYNQMP_DP_INT_PIXEL0_MATCH			BIT(15)
> +#define ZYNQMP_DP_INT_CHBUF_UNDERFLW_MASK		0x3f0000
> +#define ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK		0xfc00000
> +#define ZYNQMP_DP_INT_CUST_TS_2				BIT(28)
> +#define ZYNQMP_DP_INT_CUST_TS				BIT(29)
> +#define ZYNQMP_DP_INT_EXT_VSYNC_TS			BIT(30)
> +#define ZYNQMP_DP_INT_VSYNC_TS				BIT(31)
> +#define ZYNQMP_DP_INT_ALL				(ZYNQMP_DP_INT_HPD_IRQ | \
> +							 ZYNQMP_DP_INT_HPD_EVENT | \
> +							 ZYNQMP_DP_INT_CHBUF_UNDERFLW_MASK | \
> +							 ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
> +
> +/* Main stream attribute registers */
> +#define ZYNQMP_DP_MAIN_STREAM_HTOTAL			0x180
> +#define ZYNQMP_DP_MAIN_STREAM_VTOTAL			0x184
> +#define ZYNQMP_DP_MAIN_STREAM_POLARITY			0x188
> +#define ZYNQMP_DP_MAIN_STREAM_POLARITY_HSYNC_SHIFT	0
> +#define ZYNQMP_DP_MAIN_STREAM_POLARITY_VSYNC_SHIFT	1
> +#define ZYNQMP_DP_MAIN_STREAM_HSWIDTH			0x18c
> +#define ZYNQMP_DP_MAIN_STREAM_VSWIDTH			0x190
> +#define ZYNQMP_DP_MAIN_STREAM_HRES			0x194
> +#define ZYNQMP_DP_MAIN_STREAM_VRES			0x198
> +#define ZYNQMP_DP_MAIN_STREAM_HSTART			0x19c
> +#define ZYNQMP_DP_MAIN_STREAM_VSTART			0x1a0
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0			0x1a4
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK		BIT(0)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_RGB	(0 << 1)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_YCRCB_422	(5 << 1)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_YCRCB_444	(6 << 1)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_MASK	(7 << 1)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_DYNAMIC_RANGE	BIT(3)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_YCBCR_COLR		BIT(4)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_6		(0 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_8		(1 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_10		(2 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_12		(3 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_16		(4 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_MASK		(7 << 5)
> +#define ZYNQMP_DP_MAIN_STREAM_MISC1			0x1a8
> +#define ZYNQMP_DP_MAIN_STREAM_MISC1_Y_ONLY_EN		BIT(7)
> +#define ZYNQMP_DP_MAIN_STREAM_M_VID			0x1ac
> +#define ZYNQMP_DP_MSA_TRANSFER_UNIT_SIZE		0x1b0
> +#define ZYNQMP_DP_MSA_TRANSFER_UNIT_SIZE_TU_SIZE_DEF	64
> +#define ZYNQMP_DP_MAIN_STREAM_N_VID			0x1b4
> +#define ZYNQMP_DP_USER_PIX_WIDTH			0x1b8
> +#define ZYNQMP_DP_USER_DATA_COUNT_PER_LANE		0x1bc
> +#define ZYNQMP_DP_MIN_BYTES_PER_TU			0x1c4
> +#define ZYNQMP_DP_FRAC_BYTES_PER_TU			0x1c8
> +#define ZYNQMP_DP_INIT_WAIT				0x1cc
> +
> +/* PHY configuration and status registers */
> +#define ZYNQMP_DP_PHY_RESET				0x200
> +#define ZYNQMP_DP_PHY_RESET_PHY_RESET			BIT(0)
> +#define ZYNQMP_DP_PHY_RESET_GTTX_RESET			BIT(1)
> +#define ZYNQMP_DP_PHY_RESET_PHY_PMA_RESET		BIT(8)
> +#define ZYNQMP_DP_PHY_RESET_PHY_PCS_RESET		BIT(9)
> +#define ZYNQMP_DP_PHY_RESET_ALL_RESET			(ZYNQMP_DP_PHY_RESET_PHY_RESET |=
 \
> +							 ZYNQMP_DP_PHY_RESET_GTTX_RESET | \
> +							 ZYNQMP_DP_PHY_RESET_PHY_PMA_RESET | \
> +							 ZYNQMP_DP_PHY_RESET_PHY_PCS_RESET)
> +#define ZYNQMP_DP_PHY_PREEMPHASIS_LANE_0		0x210
> +#define ZYNQMP_DP_PHY_PREEMPHASIS_LANE_1		0x214
> +#define ZYNQMP_DP_PHY_PREEMPHASIS_LANE_2		0x218
> +#define ZYNQMP_DP_PHY_PREEMPHASIS_LANE_3		0x21c
> +#define ZYNQMP_DP_PHY_VOLTAGE_DIFF_LANE_0		0x220
> +#define ZYNQMP_DP_PHY_VOLTAGE_DIFF_LANE_1		0x224
> +#define ZYNQMP_DP_PHY_VOLTAGE_DIFF_LANE_2		0x228
> +#define ZYNQMP_DP_PHY_VOLTAGE_DIFF_LANE_3		0x22c
> +#define ZYNQMP_DP_PHY_CLOCK_SELECT			0x234
> +#define ZYNQMP_DP_PHY_CLOCK_SELECT_1_62G		0x1
> +#define ZYNQMP_DP_PHY_CLOCK_SELECT_2_70G		0x3
> +#define ZYNQMP_DP_PHY_CLOCK_SELECT_5_40G		0x5
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN			0x238
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_0		BIT(0)
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_1		BIT(1)
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_2		BIT(2)
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN_LANE_3		BIT(3)
> +#define ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL			0xf
> +#define ZYNQMP_DP_PHY_PRECURSOR_LANE_0			0x23c
> +#define ZYNQMP_DP_PHY_PRECURSOR_LANE_1			0x240
> +#define ZYNQMP_DP_PHY_PRECURSOR_LANE_2			0x244
> +#define ZYNQMP_DP_PHY_PRECURSOR_LANE_3			0x248
> +#define ZYNQMP_DP_PHY_POSTCURSOR_LANE_0			0x24c
> +#define ZYNQMP_DP_PHY_POSTCURSOR_LANE_1			0x250
> +#define ZYNQMP_DP_PHY_POSTCURSOR_LANE_2			0x254
> +#define ZYNQMP_DP_PHY_POSTCURSOR_LANE_3			0x258
> +#define ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_0		0x24c
> +#define ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_1		0x250
> +#define ZYNQMP_DP_PHY_STATUS				0x280
> +#define ZYNQMP_DP_PHY_STATUS_PLL_LOCKED_SHIFT		4
> +#define ZYNQMP_DP_PHY_STATUS_FPGA_PLL_LOCKED		BIT(6)
> +
> +/* Audio registers */
> +#define ZYNQMP_DP_TX_AUDIO_CONTROL			0x300
> +#define ZYNQMP_DP_TX_AUDIO_CHANNELS			0x304
> +#define ZYNQMP_DP_TX_AUDIO_INFO_DATA			0x308
> +#define ZYNQMP_DP_TX_M_AUD				0x328
> +#define ZYNQMP_DP_TX_N_AUD				0x32c
> +#define ZYNQMP_DP_TX_AUDIO_EXT_DATA			0x330
> +
> +#define ZYNQMP_DP_MAX_LANES				2
> +#define ZYNQMP_MAX_FREQ					3000000
> +
> +#define DP_REDUCED_BIT_RATE				162000
> +#define DP_HIGH_BIT_RATE				270000
> +#define DP_HIGH_BIT_RATE2				540000
> +#define DP_MAX_TRAINING_TRIES				5
> +#define DP_V1_2						0x12
> +
> +/**
> + * struct zynqmp_dp_link_config - Common link config between source and =
sink
> + * @max_rate: maximum link rate
> + * @max_lanes: maximum number of lanes
> + */
> +struct zynqmp_dp_link_config {
> +	int max_rate;
> +	u8 max_lanes;
> +};
> +
> +/**
> + * struct zynqmp_dp_mode - Configured mode of DisplayPort
> + * @bw_code: code for bandwidth(link rate)
> + * @lane_cnt: number of lanes
> + * @pclock: pixel clock frequency of current mode
> + * @fmt: format identifier string
> + */
> +struct zynqmp_dp_mode {
> +	u8 bw_code;
> +	u8 lane_cnt;
> +	int pclock;
> +	const char *fmt;
> +};
> +
> +/**
> + * struct zynqmp_dp_config - Configuration of DisplayPort from DTS
> + * @misc0: misc0 configuration (per DP v1.2 spec)
> + * @misc1: misc1 configuration (per DP v1.2 spec)
> + * @bpp: bits per pixel
> + */
> +struct zynqmp_dp_config {
> +	u8 misc0;
> +	u8 misc1;
> +	u8 bpp;
> +};
> +
> +/**
> + * struct zynqmp_dp - Xilinx DisplayPort core
> + * @encoder: the drm encoder structure
> + * @connector: the drm connector structure
> + * @dev: device structure
> + * @dpsub: Display subsystem
> + * @drm: DRM core
> + * @iomem: device I/O memory for register access
> + * @reset: reset controller
> + * @irq: irq
> + * @config: IP core configuration from DTS
> + * @aux: aux channel
> + * @phy: PHY handles for DP lanes
> + * @num_lanes: number of enabled phy lanes
> + * @hpd_work: hot plug detection worker
> + * @status: connection status
> + * @enabled: flag to indicate if the device is enabled
> + * @dpcd: DP configuration data from currently connected sink device
> + * @link_config: common link configuration between IP core and sink devi=
ce
> + * @mode: current mode between IP core and sink device
> + * @train_set: set of training data
> + */
> +struct zynqmp_dp {
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +	struct device *dev;
> +	struct zynqmp_dpsub *dpsub;
> +	struct drm_device *drm;
> +	void __iomem *iomem;
> +	struct reset_control *reset;
> +	int irq;
> +
> +	struct zynqmp_dp_config config;
> +	struct drm_dp_aux aux;
> +	struct phy *phy[ZYNQMP_DP_MAX_LANES];
> +	u8 num_lanes;
> +	struct delayed_work hpd_work;
> +	enum drm_connector_status status;
> +	bool enabled;
> +
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	struct zynqmp_dp_link_config link_config;
> +	struct zynqmp_dp_mode mode;
> +	u8 train_set[ZYNQMP_DP_MAX_LANES];
> +};
> +
> +static inline struct zynqmp_dp *encoder_to_dp(struct drm_encoder *encode=
r)
> +{
> +	return container_of(encoder, struct zynqmp_dp, encoder);
> +}
> +
> +static inline struct zynqmp_dp *connector_to_dp(struct drm_connector *co=
nnector)
> +{
> +	return container_of(connector, struct zynqmp_dp, connector);
> +}
> +
> +static void zynqmp_dp_write(struct zynqmp_dp *dp, int offset, u32 val)
> +{
> +	writel(val, dp->iomem + offset);
> +}
> +
> +static u32 zynqmp_dp_read(struct zynqmp_dp *dp, int offset)
> +{
> +	return readl(dp->iomem + offset);
> +}
> +
> +static void zynqmp_dp_clr(struct zynqmp_dp *dp, int offset, u32 clr)
> +{
> +	zynqmp_dp_write(dp, offset, zynqmp_dp_read(dp, offset) & ~clr);
> +}
> +
> +static void zynqmp_dp_set(struct zynqmp_dp *dp, int offset, u32 set)
> +{
> +	zynqmp_dp_write(dp, offset, zynqmp_dp_read(dp, offset) | set);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * PHY Handling
> + */
> +
> +#define RST_TIMEOUT_MS			1000
> +
> +static int zynqmp_dp_reset(struct zynqmp_dp *dp, bool assert)
> +{
> +	unsigned long timeout;
> +
> +	if (assert)
> +		reset_control_assert(dp->reset);
> +	else
> +		reset_control_deassert(dp->reset);
> +
> +	/* Wait for the (de)assert to complete. */
> +	timeout =3D jiffies + msecs_to_jiffies(RST_TIMEOUT_MS);
> +	while (!time_after_eq(jiffies, timeout)) {
> +		bool status =3D !!reset_control_status(dp->reset);
> +
> +		if (assert =3D=3D status)
> +			return 0;
> +
> +		cpu_relax();
> +	}
> +
> +	dev_err(dp->dev, "reset %s timeout\n", assert ? "assert" : "deassert");
> +	return -ETIMEDOUT;
> +}
> +
> +/**
> + * zynqmp_dp_phy_init - Initialize the phy
> + * @dp: DisplayPort IP core structure
> + *
> + * Initialize the phy.
> + *
> + * Return: 0 if the phy instances are initialized correctly, or the erro=
r code
> + * returned from the callee functions.
> + */
> +static int zynqmp_dp_phy_init(struct zynqmp_dp *dp)
> +{
> +	int ret;
> +	int i;
> +
> +	for (i =3D 0; i < dp->num_lanes; i++) {
> +		ret =3D phy_init(dp->phy[i]);
> +		if (ret) {
> +			dev_err(dp->dev, "failed to init phy lane %d\n", i);
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D zynqmp_dp_reset(dp, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	zynqmp_dp_clr(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
> +
> +	/*
> +	 * Power on lanes in reverse order as only lane 0 waits for the PLL to
> +	 * lock.
> +	 */
> +	for (i =3D dp->num_lanes - 1; i >=3D 0; i--) {
> +		ret =3D phy_power_on(dp->phy[i]);
> +		if (ret) {
> +			dev_err(dp->dev, "failed to power on phy lane %d\n", i);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_phy_exit - Exit the phy
> + * @dp: DisplayPort IP core structure
> + *
> + * Exit the phy.
> + */
> +static void zynqmp_dp_phy_exit(struct zynqmp_dp *dp)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < dp->num_lanes; i++) {
> +		ret =3D phy_power_off(dp->phy[i]);
> +		if (ret)
> +			dev_err(dp->dev, "failed to power off phy(%d) %d\n", i,
> +				ret);
> +	}
> +
> +	zynqmp_dp_reset(dp, true);
> +
> +	for (i =3D 0; i < dp->num_lanes; i++) {
> +		ret =3D phy_exit(dp->phy[i]);
> +		if (ret)
> +			dev_err(dp->dev, "failed to exit phy(%d) %d\n", i, ret);
> +	}
> +}
> +
> +/**
> + * zynqmp_dp_phy_probe - Probe the PHYs
> + * @dp: DisplayPort IP core structure
> + *
> + * Probe PHYs for all lanes. Less PHYs may be available than the number =
of
> + * lanes, which is not considered an error as long as at least one PHY is
> + * found. The caller can check dp->num_lanes to check how many PHYs were=
 found.
> + *
> + * Return:
> + * * 0				- Success
> + * * -ENXIO			- No PHY found
> + * * -EPROBE_DEFER		- Probe deferral requested
> + * * Other negative value	- PHY retrieval failure
> + */
> +static int zynqmp_dp_phy_probe(struct zynqmp_dp *dp)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ZYNQMP_DP_MAX_LANES; i++) {
> +		char phy_name[16];
> +		struct phy *phy;
> +
> +		snprintf(phy_name, sizeof(phy_name), "dp-phy%d", i);
> +		phy =3D devm_phy_get(dp->dev, phy_name);
> +
> +		if (IS_ERR(phy)) {
> +			switch (PTR_ERR(phy)) {
> +			case -ENODEV:
> +				if (dp->num_lanes)
> +					return 0;
> +
> +				dev_err(dp->dev, "no PHY found\n");
> +				return -ENXIO;
> +
> +			case -EPROBE_DEFER:
> +				return -EPROBE_DEFER;
> +
> +			default:
> +				dev_err(dp->dev, "failed to get PHY lane %u\n",
> +					i);
> +				return PTR_ERR(phy);
> +			}
> +		}
> +
> +		dp->phy[i] =3D phy;
> +		dp->num_lanes++;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_phy_ready - Check if PHY is ready
> + * @dp: DisplayPort IP core structure
> + *
> + * Check if PHY is ready. If PHY is not ready, wait 1ms to check for 100=
 times.
> + * This amount of delay was suggested by IP designer.
> + *
> + * Return: 0 if PHY is ready, or -ENODEV if PHY is not ready.
> + */
> +static int zynqmp_dp_phy_ready(struct zynqmp_dp *dp)
> +{
> +	u32 i, reg, ready;
> +
> +	ready =3D (1 << dp->num_lanes) - 1;
> +
> +	/* Wait for 100 * 1ms. This should be enough time for PHY to be ready */
> +	for (i =3D 0; ; i++) {
> +		reg =3D zynqmp_dp_read(dp, ZYNQMP_DP_PHY_STATUS);
> +		if ((reg & ready) =3D=3D ready)
> +			return 0;
> +
> +		if (i =3D=3D 100) {
> +			dev_err(dp->dev, "PHY isn't ready\n");
> +			return -ENODEV;
> +		}
> +
> +		usleep_range(1000, 1100);
> +	}
> +
> +	return 0;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DisplayPort Link Training
> + */
> +
> +/**
> + * zynqmp_dp_max_rate - Calculate and return available max pixel clock
> + * @link_rate: link rate (Kilo-bytes / sec)
> + * @lane_num: number of lanes
> + * @bpp: bits per pixel
> + *
> + * Return: max pixel clock (KHz) supported by current link config.
> + */
> +static inline int zynqmp_dp_max_rate(int link_rate, u8 lane_num, u8 bpp)
> +{
> +	return link_rate * lane_num * 8 / bpp;
> +}
> +
> +/**
> + * zynqmp_dp_mode_configure - Configure the link values
> + * @dp: DisplayPort IP core structure
> + * @pclock: pixel clock for requested display mode
> + * @current_bw: current link rate
> + *
> + * Find the link configuration values, rate and lane count for requested=
 pixel
> + * clock @pclock. The @pclock is stored in the mode to be used in other
> + * functions later. The returned rate is downshifted from the current ra=
te
> + * @current_bw.
> + *
> + * Return: Current link rate code, or -EINVAL.
> + */
> +static int zynqmp_dp_mode_configure(struct zynqmp_dp *dp, int pclock,
> +				    u8 current_bw)
> +{
> +	int max_rate =3D dp->link_config.max_rate;
> +	u8 bws[3] =3D { DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4 };
> +	u8 max_lanes =3D dp->link_config.max_lanes;
> +	u8 max_link_rate_code =3D drm_dp_link_rate_to_bw_code(max_rate);
> +	u8 bpp =3D dp->config.bpp;
> +	u8 lane_cnt;
> +	s8 i;
> +
> +	if (current_bw =3D=3D DP_LINK_BW_1_62) {
> +		dev_err(dp->dev, "can't downshift. already lowest link rate\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i =3D ARRAY_SIZE(bws) - 1; i >=3D 0; i--) {
> +		if (current_bw && bws[i] >=3D current_bw)
> +			continue;
> +
> +		if (bws[i] <=3D max_link_rate_code)
> +			break;
> +	}
> +
> +	for (lane_cnt =3D 1; lane_cnt <=3D max_lanes; lane_cnt <<=3D 1) {
> +		int bw;
> +		u32 rate;
> +
> +		bw =3D drm_dp_bw_code_to_link_rate(bws[i]);
> +		rate =3D zynqmp_dp_max_rate(bw, lane_cnt, bpp);
> +		if (pclock <=3D rate) {
> +			dp->mode.bw_code =3D bws[i];
> +			dp->mode.lane_cnt =3D lane_cnt;
> +			dp->mode.pclock =3D pclock;
> +			return dp->mode.bw_code;
> +		}
> +	}
> +
> +	dev_err(dp->dev, "failed to configure link values\n");
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * zynqmp_dp_adjust_train - Adjust train values
> + * @dp: DisplayPort IP core structure
> + * @link_status: link status from sink which contains requested training=
 values
> + */
> +static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
> +				   u8 link_status[DP_LINK_STATUS_SIZE])
> +{
> +	u8 *train_set =3D dp->train_set;
> +	u8 voltage =3D 0, preemphasis =3D 0;
> +	u8 i;
> +
> +	for (i =3D 0; i < dp->mode.lane_cnt; i++) {
> +		u8 v =3D drm_dp_get_adjust_request_voltage(link_status, i);
> +		u8 p =3D drm_dp_get_adjust_request_pre_emphasis(link_status, i);
> +
> +		if (v > voltage)
> +			voltage =3D v;
> +
> +		if (p > preemphasis)
> +			preemphasis =3D p;
> +	}
> +
> +	if (voltage >=3D DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
> +		voltage |=3D DP_TRAIN_MAX_SWING_REACHED;
> +
> +	if (preemphasis >=3D DP_TRAIN_PRE_EMPH_LEVEL_2)
> +		preemphasis |=3D DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
> +
> +	for (i =3D 0; i < dp->mode.lane_cnt; i++)
> +		train_set[i] =3D voltage | preemphasis;
> +}
> +
> +/**
> + * zynqmp_dp_update_vs_emph - Update the training values
> + * @dp: DisplayPort IP core structure
> + *
> + * Update the training values based on the request from sink. The mapped=
 values
> + * are predefined, and values(vs, pe, pc) are from the device manual.
> + *
> + * Return: 0 if vs and emph are updated successfully, or the error code =
returned
> + * by drm_dp_dpcd_write().
> + */
> +static int zynqmp_dp_update_vs_emph(struct zynqmp_dp *dp)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->train_se=
t,
> +				dp->mode.lane_cnt);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i =3D 0; i < dp->mode.lane_cnt; i++) {
> +		u32 reg =3D ZYNQMP_DP_SUB_TX_PHY_PRECURSOR_LANE_0 + i * 4;
> +		union phy_configure_opts opts =3D { 0 };
> +		u8 train =3D dp->train_set[i];
> +
> +		opts.dp.voltage[0] =3D (train & DP_TRAIN_VOLTAGE_SWING_MASK)
> +				   >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
> +		opts.dp.pre[0] =3D (train & DP_TRAIN_PRE_EMPHASIS_MASK)
> +			       >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
> +
> +		phy_configure(dp->phy[i], &opts);
> +
> +		zynqmp_dp_write(dp, reg, 0x2);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_link_train_cr - Train clock recovery
> + * @dp: DisplayPort IP core structure
> + *
> + * Return: 0 if clock recovery train is done successfully, or correspond=
ing
> + * error code.
> + */
> +static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
> +{
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	u8 lane_cnt =3D dp->mode.lane_cnt;
> +	u8 vs =3D 0, tries =3D 0;
> +	u16 max_tries, i;
> +	bool cr_done;
> +	int ret;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRAINING_PATTERN_SET,
> +			DP_TRAINING_PATTERN_1);
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
> +				 DP_TRAINING_PATTERN_1 |
> +				 DP_LINK_SCRAMBLING_DISABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * 256 loops should be maximum iterations for 4 lanes and 4 values.
> +	 * So, This loop should exit before 512 iterations
> +	 */
> +	for (max_tries =3D 0; max_tries < 512; max_tries++) {
> +		ret =3D zynqmp_dp_update_vs_emph(dp);
> +		if (ret)
> +			return ret;
> +
> +		drm_dp_link_train_clock_recovery_delay(dp->dpcd);
> +		ret =3D drm_dp_dpcd_read_link_status(&dp->aux, link_status);
> +		if (ret < 0)
> +			return ret;
> +
> +		cr_done =3D drm_dp_clock_recovery_ok(link_status, lane_cnt);
> +		if (cr_done)
> +			break;
> +
> +		for (i =3D 0; i < lane_cnt; i++)
> +			if (!(dp->train_set[i] & DP_TRAIN_MAX_SWING_REACHED))
> +				break;
> +		if (i =3D=3D lane_cnt)
> +			break;
> +
> +		if ((dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK) =3D=3D vs)
> +			tries++;
> +		else
> +			tries =3D 0;
> +
> +		if (tries =3D=3D DP_MAX_TRAINING_TRIES)
> +			break;
> +
> +		vs =3D dp->train_set[0] & DP_TRAIN_VOLTAGE_SWING_MASK;
> +		zynqmp_dp_adjust_train(dp, link_status);
> +	}
> +
> +	if (!cr_done)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_link_train_ce - Train channel equalization
> + * @dp: DisplayPort IP core structure
> + *
> + * Return: 0 if channel equalization train is done successfully, or
> + * corresponding error code.
> + */
> +static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
> +{
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	u8 lane_cnt =3D dp->mode.lane_cnt;
> +	u32 pat, tries;
> +	int ret;
> +	bool ce_done;
> +
> +	if (dp->dpcd[DP_DPCD_REV] >=3D DP_V1_2 &&
> +	    dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED)
> +		pat =3D DP_TRAINING_PATTERN_3;
> +	else
> +		pat =3D DP_TRAINING_PATTERN_2;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRAINING_PATTERN_SET, pat);
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
> +				 pat | DP_LINK_SCRAMBLING_DISABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (tries =3D 0; tries < DP_MAX_TRAINING_TRIES; tries++) {
> +		ret =3D zynqmp_dp_update_vs_emph(dp);
> +		if (ret)
> +			return ret;
> +
> +		drm_dp_link_train_channel_eq_delay(dp->dpcd);
> +		ret =3D drm_dp_dpcd_read_link_status(&dp->aux, link_status);
> +		if (ret < 0)
> +			return ret;
> +
> +		ce_done =3D drm_dp_channel_eq_ok(link_status, lane_cnt);
> +		if (ce_done)
> +			break;
> +
> +		zynqmp_dp_adjust_train(dp, link_status);
> +	}
> +
> +	if (!ce_done)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_link_train - Train the link
> + * @dp: DisplayPort IP core structure
> + *
> + * Return: 0 if all trains are done successfully, or corresponding error=
 code.
> + */
> +static int zynqmp_dp_train(struct zynqmp_dp *dp)
> +{
> +	u32 reg;
> +	u8 bw_code =3D dp->mode.bw_code;
> +	u8 lane_cnt =3D dp->mode.lane_cnt;
> +	u8 aux_lane_cnt =3D lane_cnt;
> +	bool enhanced;
> +	int ret;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_LANE_COUNT_SET, lane_cnt);
> +	enhanced =3D drm_dp_enhanced_frame_cap(dp->dpcd);
> +	if (enhanced) {
> +		zynqmp_dp_write(dp, ZYNQMP_DP_ENHANCED_FRAME_EN, 1);
> +		aux_lane_cnt |=3D DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +	}
> +
> +	if (dp->dpcd[3] & 0x1) {
> +		zynqmp_dp_write(dp, ZYNQMP_DP_DOWNSPREAD_CTL, 1);
> +		drm_dp_dpcd_writeb(&dp->aux, DP_DOWNSPREAD_CTRL,
> +				   DP_SPREAD_AMP_0_5);
> +	} else {
> +		zynqmp_dp_write(dp, ZYNQMP_DP_DOWNSPREAD_CTL, 0);
> +		drm_dp_dpcd_writeb(&dp->aux, DP_DOWNSPREAD_CTRL, 0);
> +	}
> +
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_LANE_COUNT_SET, aux_lane_cnt);
> +	if (ret < 0) {
> +		dev_err(dp->dev, "failed to set lane count\n");
> +		return ret;
> +	}
> +
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
> +				 DP_SET_ANSI_8B10B);
> +	if (ret < 0) {
> +		dev_err(dp->dev, "failed to set ANSI 8B/10B encoding\n");
> +		return ret;
> +	}
> +
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_LINK_BW_SET, bw_code);
> +	if (ret < 0) {
> +		dev_err(dp->dev, "failed to set DP bandwidth\n");
> +		return ret;
> +	}
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_LINK_BW_SET, bw_code);
> +	switch (bw_code) {
> +	case DP_LINK_BW_1_62:
> +		reg =3D ZYNQMP_DP_PHY_CLOCK_SELECT_1_62G;
> +		break;
> +	case DP_LINK_BW_2_7:
> +		reg =3D ZYNQMP_DP_PHY_CLOCK_SELECT_2_70G;
> +		break;
> +	case DP_LINK_BW_5_4:
> +	default:
> +		reg =3D ZYNQMP_DP_PHY_CLOCK_SELECT_5_40G;
> +		break;
> +	}
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_PHY_CLOCK_SELECT, reg);
> +	ret =3D zynqmp_dp_phy_ready(dp);
> +	if (ret < 0)
> +		return ret;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
> +	memset(dp->train_set, 0, 4);
> +	ret =3D zynqmp_dp_link_train_cr(dp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D zynqmp_dp_link_train_ce(dp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_TRAINING_PATTERN_SET,
> +				 DP_TRAINING_PATTERN_DISABLE);
> +	if (ret < 0) {
> +		dev_err(dp->dev, "failed to disable training pattern\n");
> +		return ret;
> +	}
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRAINING_PATTERN_SET,
> +			DP_TRAINING_PATTERN_DISABLE);
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_train_loop - Downshift the link rate during training
> + * @dp: DisplayPort IP core structure
> + *
> + * Train the link by downshifting the link rate if training is not succe=
ssful.
> + */
> +static void zynqmp_dp_train_loop(struct zynqmp_dp *dp)
> +{
> +	struct zynqmp_dp_mode *mode =3D &dp->mode;
> +	u8 bw =3D mode->bw_code;
> +	int ret;
> +
> +	do {
> +		if (dp->status =3D=3D connector_status_disconnected ||
> +		    !dp->enabled)
> +			return;
> +
> +		ret =3D zynqmp_dp_train(dp);
> +		if (!ret)
> +			return;
> +
> +		ret =3D zynqmp_dp_mode_configure(dp, mode->pclock, bw);
> +		if (ret < 0)
> +			goto err_out;
> +
> +		bw =3D ret;
> +	} while (bw >=3D DP_LINK_BW_1_62);
> +
> +err_out:
> +	dev_err(dp->dev, "failed to train the DP link\n");
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DisplayPort AUX
> + */
> +
> +#define AUX_READ_BIT	0x1
> +
> +/**
> + * zynqmp_dp_aux_cmd_submit - Submit aux command
> + * @dp: DisplayPort IP core structure
> + * @cmd: aux command
> + * @addr: aux address
> + * @buf: buffer for command data
> + * @bytes: number of bytes for @buf
> + * @reply: reply code to be returned
> + *
> + * Submit an aux command. All aux related commands, native or i2c aux
> + * read/write, are submitted through this function. The function is mapp=
ed to
> + * the transfer function of struct drm_dp_aux. This function involves in
> + * multiple register reads/writes, thus synchronization is needed, and i=
t is
> + * done by drm_dp_helper using @hw_mutex. The calling thread goes into s=
leep
> + * if there's no immediate reply to the command submission. The reply co=
de is
> + * returned at @reply if @reply !=3D NULL.
> + *
> + * Return: 0 if the command is submitted properly, or corresponding erro=
r code:
> + * -EBUSY when there is any request already being processed
> + * -ETIMEDOUT when receiving reply is timed out
> + * -EIO when received bytes are less than requested
> + */
> +static int zynqmp_dp_aux_cmd_submit(struct zynqmp_dp *dp, u32 cmd, u16 a=
ddr,
> +				    u8 *buf, u8 bytes, u8 *reply)
> +{
> +	bool is_read =3D (cmd & AUX_READ_BIT) ? true : false;
> +	u32 reg, i;
> +
> +	reg =3D zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
> +	if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REQUEST)
> +		return -EBUSY;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_ADDRESS, addr);
> +	if (!is_read)
> +		for (i =3D 0; i < bytes; i++)
> +			zynqmp_dp_write(dp, ZYNQMP_DP_AUX_WRITE_FIFO,
> +					buf[i]);
> +
> +	reg =3D cmd << ZYNQMP_DP_AUX_COMMAND_CMD_SHIFT;
> +	if (!buf || !bytes)
> +		reg |=3D ZYNQMP_DP_AUX_COMMAND_ADDRESS_ONLY;
> +	else
> +		reg |=3D (bytes - 1) << ZYNQMP_DP_AUX_COMMAND_BYTES_SHIFT;
> +	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_COMMAND, reg);
> +
> +	/* Wait for reply to be delivered upto 2ms */
> +	for (i =3D 0; ; i++) {
> +		reg =3D zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
> +		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY)
> +			break;
> +
> +		if (reg & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_REPLY_TIMEOUT ||
> +		    i =3D=3D 2)
> +			return -ETIMEDOUT;
> +
> +		usleep_range(1000, 1100);
> +	}
> +
> +	reg =3D zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPLY_CODE);
> +	if (reply)
> +		*reply =3D reg;
> +
> +	if (is_read &&
> +	    (reg =3D=3D ZYNQMP_DP_AUX_REPLY_CODE_AUX_ACK ||
> +	     reg =3D=3D ZYNQMP_DP_AUX_REPLY_CODE_I2C_ACK)) {
> +		reg =3D zynqmp_dp_read(dp, ZYNQMP_DP_REPLY_DATA_COUNT);
> +		if ((reg & ZYNQMP_DP_REPLY_DATA_COUNT_MASK) !=3D bytes)
> +			return -EIO;
> +
> +		for (i =3D 0; i < bytes; i++)
> +			buf[i] =3D zynqmp_dp_read(dp, ZYNQMP_DP_AUX_REPLY_DATA);
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *ms=
g)
> +{
> +	struct zynqmp_dp *dp =3D container_of(aux, struct zynqmp_dp, aux);
> +	int ret;
> +	unsigned int i, iter;
> +
> +	/* Number of loops =3D timeout in msec / aux delay (400 usec) */
> +	iter =3D zynqmp_dp_aux_timeout_ms * 1000 / 400;
> +	iter =3D iter ? iter : 1;
> +
> +	for (i =3D 0; i < iter; i++) {
> +		ret =3D zynqmp_dp_aux_cmd_submit(dp, msg->request, msg->address,
> +					       msg->buffer, msg->size,
> +					       &msg->reply);
> +		if (!ret) {
> +			dev_dbg(dp->dev, "aux %d retries\n", i);
> +			return msg->size;
> +		}
> +
> +		if (dp->status =3D=3D connector_status_disconnected) {
> +			dev_dbg(dp->dev, "no connected aux device\n");
> +			return -ENODEV;
> +		}
> +
> +		usleep_range(400, 500);
> +	}
> +
> +	dev_dbg(dp->dev, "failed to do aux transfer (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * zynqmp_dp_aux_init - Initialize and register the DP AUX
> + * @dp: DisplayPort IP core structure
> + *
> + * Program the AUX clock divider and filter and register the DP AUX adap=
ter.
> + *
> + * Return: 0 on success, error value otherwise
> + */
> +static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
> +{
> +	unsigned long rate;
> +	unsigned int w;
> +
> +	/*
> +	 * The AUX_SIGNAL_WIDTH_FILTER is the number of APB clock cycles
> +	 * corresponding to the AUX pulse. Allowable values are 8, 16, 24, 32,
> +	 * 40 and 48. The AUX pulse width must be between 0.4=B5s and 0.6=B5s,
> +	 * compute the w / 8 value corresponding to 0.4=B5s rounded up, and make
> +	 * sure it stays below 0.6=B5s and within the allowable values.
> +	 */
> +	rate =3D clk_get_rate(dp->dpsub->apb_clk);
> +	w =3D DIV_ROUND_UP(4 * rate, 1000 * 1000 * 10 * 8) * 8;
> +	if (w > 6 * rate / (1000 * 1000 * 10) || w > 48) {
> +		dev_err(dp->dev, "aclk frequency too high\n");
> +		return -EINVAL;
> +	}
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_AUX_CLK_DIVIDER,
> +			(w << ZYNQMP_DP_AUX_CLK_DIVIDER_AUX_FILTER_SHIFT) |
> +			(rate / (1000 * 1000)));
> +
> +	dp->aux.name =3D "ZynqMP DP AUX";
> +	dp->aux.dev =3D dp->dev;
> +	dp->aux.transfer =3D zynqmp_dp_aux_transfer;
> +
> +	return drm_dp_aux_register(&dp->aux);
> +}
> +
> +/**
> + * zynqmp_dp_aux_cleanup - Cleanup the DP AUX
> + * @dp: DisplayPort IP core structure
> + *
> + * Unregister the DP AUX adapter.
> + */
> +static void zynqmp_dp_aux_cleanup(struct zynqmp_dp *dp)
> +{
> +	drm_dp_aux_unregister(&dp->aux);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DisplayPort Generic Support
> + */
> +
> +/**
> + * zynqmp_dp_update_misc - Write the misc registers
> + * @dp: DisplayPort IP core structure
> + *
> + * The misc register values are stored in the structure, and this
> + * function applies the values into the registers.
> + */
> +static void zynqmp_dp_update_misc(struct zynqmp_dp *dp)
> +{
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_MISC0, dp->config.misc0);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_MISC1, dp->config.misc1);
> +}
> +
> +/**
> + * zynqmp_dp_set_format - Set the input format
> + * @dp: DisplayPort IP core structure
> + * @format: input format
> + * @bpc: bits per component
> + *
> + * Update misc register values based on input @format and @bpc.
> + *
> + * Return: 0 on success, or -EINVAL.
> + */
> +static int zynqmp_dp_set_format(struct zynqmp_dp *dp,
> +				enum zynqmp_dpsub_format format,
> +				unsigned int bpc)
> +{
> +	static const struct drm_display_info *display;
> +	struct zynqmp_dp_config *config =3D &dp->config;
> +	unsigned int num_colors;
> +
> +	config->misc0 &=3D ~ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_MASK;
> +	config->misc1 &=3D ~ZYNQMP_DP_MAIN_STREAM_MISC1_Y_ONLY_EN;
> +
> +	switch (format) {
> +	case ZYNQMP_DPSUB_FORMAT_RGB:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_RGB;
> +		num_colors =3D 3;
> +		break;
> +
> +	case ZYNQMP_DPSUB_FORMAT_YCRCB444:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_YCRCB_444;
> +		num_colors =3D 3;
> +		break;
> +
> +	case ZYNQMP_DPSUB_FORMAT_YCRCB422:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_COMP_FORMAT_YCRCB_422;
> +		num_colors =3D 2;
> +		break;
> +
> +	case ZYNQMP_DPSUB_FORMAT_YONLY:
> +		config->misc1 |=3D ZYNQMP_DP_MAIN_STREAM_MISC1_Y_ONLY_EN;
> +		num_colors =3D 1;
> +		break;
> +
> +	default:
> +		dev_err(dp->dev, "Invalid colormetry in DT\n");
> +		return -EINVAL;
> +	}
> +
> +	display =3D &dp->connector.display_info;
> +	if (display->bpc && bpc > display->bpc) {
> +		dev_warn(dp->dev,
> +			 "downgrading requested %ubpc to display limit %ubpc\n",
> +			 bpc, display->bpc);
> +		bpc =3D display->bpc;
> +	}
> +
> +	config->misc0 &=3D ~ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_MASK;
> +
> +	switch (bpc) {
> +	case 6:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_6;
> +		break;
> +	case 8:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_8;
> +		break;
> +	case 10:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_10;
> +		break;
> +	case 12:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_12;
> +		break;
> +	case 16:
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_16;
> +		break;
> +	default:
> +		dev_warn(dp->dev, "Not supported bpc (%u). fall back to 8bpc\n",
> +			 bpc);
> +		config->misc0 |=3D ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_8;
> +		bpc =3D 8;
> +		break;
> +	}
> +
> +	/* Update the current bpp based on the format. */
> +	config->bpp =3D bpc * num_colors;
> +
> +	return 0;
> +}
> +
> +/**
> + * zynqmp_dp_encoder_mode_set_transfer_unit - Set the transfer unit valu=
es
> + * @dp: DisplayPort IP core structure
> + * @mode: requested display mode
> + *
> + * Set the transfer unit, and calculate all transfer unit size related v=
alues.
> + * Calculation is based on DP and IP core specification.
> + */
> +static void
> +zynqmp_dp_encoder_mode_set_transfer_unit(struct zynqmp_dp *dp,
> +					 struct drm_display_mode *mode)
> +{
> +	u32 tu =3D ZYNQMP_DP_MSA_TRANSFER_UNIT_SIZE_TU_SIZE_DEF;
> +	u32 bw, vid_kbytes, avg_bytes_per_tu, init_wait;
> +
> +	/* Use the max transfer unit size (default) */
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MSA_TRANSFER_UNIT_SIZE, tu);
> +
> +	vid_kbytes =3D mode->clock * (dp->config.bpp / 8);
> +	bw =3D drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
> +	avg_bytes_per_tu =3D vid_kbytes * tu / (dp->mode.lane_cnt * bw / 1000);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MIN_BYTES_PER_TU,
> +			avg_bytes_per_tu / 1000);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_FRAC_BYTES_PER_TU,
> +			avg_bytes_per_tu % 1000);
> +
> +	/* Configure the initial wait cycle based on transfer unit size */
> +	if (tu < (avg_bytes_per_tu / 1000))
> +		init_wait =3D 0;
> +	else if ((avg_bytes_per_tu / 1000) <=3D 4)
> +		init_wait =3D tu;
> +	else
> +		init_wait =3D tu - avg_bytes_per_tu / 1000;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INIT_WAIT, init_wait);
> +}
> +
> +/**
> + * zynqmp_dp_encoder_mode_set_stream - Configure the main stream
> + * @dp: DisplayPort IP core structure
> + * @mode: requested display mode
> + *
> + * Configure the main stream based on the requested mode @mode. Calculat=
ion is
> + * based on IP core specification.
> + */
> +static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
> +					      const struct drm_display_mode *mode)
> +{
> +	u8 lane_cnt =3D dp->mode.lane_cnt;
> +	u32 reg, wpl;
> +	unsigned int rate;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_HTOTAL, mode->htotal);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VTOTAL, mode->vtotal);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_POLARITY,
> +			(!!(mode->flags & DRM_MODE_FLAG_PVSYNC) <<
> +			 ZYNQMP_DP_MAIN_STREAM_POLARITY_VSYNC_SHIFT) |
> +			(!!(mode->flags & DRM_MODE_FLAG_PHSYNC) <<
> +			 ZYNQMP_DP_MAIN_STREAM_POLARITY_HSYNC_SHIFT));
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_HSWIDTH,
> +			mode->hsync_end - mode->hsync_start);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VSWIDTH,
> +			mode->vsync_end - mode->vsync_start);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_HRES, mode->hdisplay);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VRES, mode->vdisplay);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_HSTART,
> +			mode->htotal - mode->hsync_start);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VSTART,
> +			mode->vtotal - mode->vsync_start);
> +
> +	/* In synchronous mode, set the diviers */
> +	if (dp->config.misc0 & ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK) {
> +		reg =3D drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
> +		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_N_VID, reg);
> +		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_M_VID, mode->clock);
> +		rate =3D zynqmp_disp_get_audio_clk_rate(dp->dpsub->disp);
> +		if (rate) {
> +			dev_dbg(dp->dev, "Audio rate: %d\n", rate / 512);
> +			zynqmp_dp_write(dp, ZYNQMP_DP_TX_N_AUD, reg);
> +			zynqmp_dp_write(dp, ZYNQMP_DP_TX_M_AUD, rate / 1000);
> +		}
> +	}
> +
> +	/* Only 2 channel audio is supported now */
> +	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
> +		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CHANNELS, 1);
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_USER_PIX_WIDTH, 1);
> +
> +	/* Translate to the native 16 bit datapath based on IP core spec */
> +	wpl =3D (mode->hdisplay * dp->config.bpp + 15) / 16;
> +	reg =3D wpl + wpl % lane_cnt - lane_cnt;
> +	zynqmp_dp_write(dp, ZYNQMP_DP_USER_DATA_COUNT_PER_LANE, reg);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DRM Connector
> + */
> +
> +static enum drm_connector_status
> +zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct zynqmp_dp *dp =3D connector_to_dp(connector);
> +	struct zynqmp_dp_link_config *link_config =3D &dp->link_config;
> +	u32 state, i;
> +	int ret;
> +
> +	/*
> +	 * This is from heuristic. It takes some delay (ex, 100 ~ 500 msec) to
> +	 * get the HPD signal with some monitors.
> +	 */
> +	for (i =3D 0; i < 10; i++) {
> +		state =3D zynqmp_dp_read(dp, ZYNQMP_DP_INTERRUPT_SIGNAL_STATE);
> +		if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD)
> +			break;
> +		msleep(100);
> +	}
> +
> +	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
> +		ret =3D drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
> +				       sizeof(dp->dpcd));
> +		if (ret < 0) {
> +			dev_dbg(dp->dev, "DPCD read failes");
> +			goto disconnected;
> +		}
> +
> +		link_config->max_rate =3D min_t(int,
> +					      drm_dp_max_link_rate(dp->dpcd),
> +					      DP_HIGH_BIT_RATE2);
> +		link_config->max_lanes =3D min_t(u8,
> +					       drm_dp_max_lane_count(dp->dpcd),
> +					       dp->num_lanes);
> +
> +		dp->status =3D connector_status_connected;
> +		return connector_status_connected;
> +	}
> +
> +disconnected:
> +	dp->status =3D connector_status_disconnected;
> +	return connector_status_disconnected;
> +}
> +
> +static int zynqmp_dp_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct zynqmp_dp *dp =3D connector_to_dp(connector);
> +	struct edid *edid;
> +	int ret;
> +
> +	edid =3D drm_get_edid(connector, &dp->aux.ddc);
> +	if (!edid)
> +		return 0;
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	ret =3D drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
> +	return ret;
> +}
> +
> +static struct drm_encoder *
> +zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
> +{
> +	struct zynqmp_dp *dp =3D connector_to_dp(connector);
> +
> +	return &dp->encoder;
> +}
> +
> +static int zynqmp_dp_connector_mode_valid(struct drm_connector *connecto=
r,
> +					  struct drm_display_mode *mode)
> +{
> +	struct zynqmp_dp *dp =3D connector_to_dp(connector);
> +	u8 max_lanes =3D dp->link_config.max_lanes;
> +	u8 bpp =3D dp->config.bpp;
> +	int max_rate =3D dp->link_config.max_rate;
> +	int rate;
> +
> +	if (mode->clock > ZYNQMP_MAX_FREQ) {
> +		dev_dbg(dp->dev, "filtered the mode, %s,for high pixel rate\n",
> +			mode->name);
> +		drm_mode_debug_printmodeline(mode);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	/* Check with link rate and lane count */
> +	rate =3D zynqmp_dp_max_rate(max_rate, max_lanes, bpp);
> +	if (mode->clock > rate) {
> +		dev_dbg(dp->dev, "filtered the mode, %s,for high pixel rate\n",
> +			mode->name);
> +		drm_mode_debug_printmodeline(mode);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_connector_funcs zynqmp_dp_connector_funcs =3D {
> +	.detect			=3D zynqmp_dp_connector_detect,
> +	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> +	.destroy		=3D drm_connector_cleanup,
> +	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
> +	.reset			=3D drm_atomic_helper_connector_reset,
> +};
> +
> +static const struct drm_connector_helper_funcs
> +zynqmp_dp_connector_helper_funcs =3D {
> +	.get_modes	=3D zynqmp_dp_connector_get_modes,
> +	.best_encoder	=3D zynqmp_dp_connector_best_encoder,
> +	.mode_valid	=3D zynqmp_dp_connector_mode_valid,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DRM Encoder
> + */
> +
> +static void zynqmp_dp_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct zynqmp_dp *dp =3D encoder_to_dp(encoder);
> +	unsigned int i;
> +	int ret =3D 0;
> +
> +	pm_runtime_get_sync(dp->dev);
> +	dp->enabled =3D true;
> +	zynqmp_dp_update_misc(dp);
> +	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
> +		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN, 0);
> +	if (dp->status =3D=3D connector_status_connected) {
> +		for (i =3D 0; i < 3; i++) {
> +			ret =3D drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER,
> +						 DP_SET_POWER_D0);
> +			if (ret =3D=3D 1)
> +				break;
> +			usleep_range(300, 500);
> +		}
> +		/* Some monitors take time to wake up properly */
> +		msleep(zynqmp_dp_power_on_delay_ms);
> +	}
> +	if (ret !=3D 1)
> +		dev_dbg(dp->dev, "DP aux failed\n");
> +	else
> +		zynqmp_dp_train_loop(dp);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
> +			ZYNQMP_DP_SOFTWARE_RESET_ALL);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
> +}
> +
> +static void zynqmp_dp_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct zynqmp_dp *dp =3D encoder_to_dp(encoder);
> +
> +	dp->enabled =3D false;
> +	cancel_delayed_work(&dp->hpd_work);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
> +	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
> +			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
> +	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
> +		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
> +	pm_runtime_put_sync(dp->dev);
> +}
> +
> +static void
> +zynqmp_dp_encoder_atomic_mode_set(struct drm_encoder *encoder,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *connector_state)
> +{
> +	struct zynqmp_dp *dp =3D encoder_to_dp(encoder);
> +	struct drm_display_mode *mode =3D &crtc_state->mode;
> +	struct drm_display_mode *adjusted_mode =3D &crtc_state->adjusted_mode;
> +	u8 max_lanes =3D dp->link_config.max_lanes;
> +	u8 bpp =3D dp->config.bpp;
> +	int rate, max_rate =3D dp->link_config.max_rate;
> +	int ret;
> +
> +	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
> +
> +	/* Check again as bpp or format might have been chagned */
> +	rate =3D zynqmp_dp_max_rate(max_rate, max_lanes, bpp);
> +	if (mode->clock > rate) {
> +		dev_err(dp->dev, "the mode, %s,has too high pixel rate\n",
> +			mode->name);
> +		drm_mode_debug_printmodeline(mode);
> +	}
> +
> +	ret =3D zynqmp_dp_mode_configure(dp, adjusted_mode->clock, 0);
> +	if (ret < 0)
> +		return;
> +
> +	zynqmp_dp_encoder_mode_set_transfer_unit(dp, adjusted_mode);
> +	zynqmp_dp_encoder_mode_set_stream(dp, adjusted_mode);
> +}
> +
> +#define ZYNQMP_DP_MIN_H_BACKPORCH	20
> +
> +static int
> +zynqmp_dp_encoder_atomic_check(struct drm_encoder *encoder,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *mode =3D &crtc_state->mode;
> +	struct drm_display_mode *adjusted_mode =3D &crtc_state->adjusted_mode;
> +	int diff =3D mode->htotal - mode->hsync_end;
> +
> +	/*
> +	 * ZynqMP DP requires horizontal backporch to be greater than 12.
> +	 * This limitation may not be compatible with the sink device.
> +	 */
> +	if (diff < ZYNQMP_DP_MIN_H_BACKPORCH) {
> +		int vrefresh =3D (adjusted_mode->clock * 1000) /
> +			       (adjusted_mode->vtotal * adjusted_mode->htotal);
> +
> +		dev_dbg(encoder->dev->dev, "hbackporch adjusted: %d to %d",
> +			diff, ZYNQMP_DP_MIN_H_BACKPORCH - diff);
> +		diff =3D ZYNQMP_DP_MIN_H_BACKPORCH - diff;
> +		adjusted_mode->htotal +=3D diff;
> +		adjusted_mode->clock =3D adjusted_mode->vtotal *
> +				       adjusted_mode->htotal * vrefresh / 1000;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_funcs zynqmp_dp_encoder_funcs =3D {
> +	.destroy		=3D drm_encoder_cleanup,
> +};
> +
> +static const struct drm_encoder_helper_funcs zynqmp_dp_encoder_helper_fu=
ncs =3D {
> +	.enable			=3D zynqmp_dp_encoder_enable,
> +	.disable		=3D zynqmp_dp_encoder_disable,
> +	.atomic_mode_set	=3D zynqmp_dp_encoder_atomic_mode_set,
> +	.atomic_check		=3D zynqmp_dp_encoder_atomic_check,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Interrupt Handling
> + */
> +
> +/**
> + * zynqmp_dp_enable_vblank - Enable vblank
> + * @dp: DisplayPort IP core structure
> + *
> + * Enable vblank interrupt
> + */
> +void zynqmp_dp_enable_vblank(struct zynqmp_dp *dp)
> +{
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_VBLANK_START);
> +}
> +
> +/**
> + * zynqmp_dp_disable_vblank - Disable vblank
> + * @dp: DisplayPort IP core structure
> + *
> + * Disable vblank interrupt
> + */
> +void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp)
> +{
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_VBLANK_START);
> +}
> +
> +static void zynqmp_dp_hpd_work_func(struct work_struct *work)
> +{
> +	struct zynqmp_dp *dp;
> +
> +	dp =3D container_of(work, struct zynqmp_dp, hpd_work.work);
> +
> +	if (dp->drm)
> +		drm_helper_hpd_irq_event(dp->drm);
> +}
> +
> +static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
> +{
> +	struct zynqmp_dp *dp =3D (struct zynqmp_dp *)data;
> +	u32 status, mask;
> +
> +	status =3D zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
> +	mask =3D zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
> +	if (!(status & ~mask))
> +		return IRQ_NONE;
> +
> +	/* dbg for diagnostic, but not much that the driver can do */
> +	if (status & ZYNQMP_DP_INT_CHBUF_UNDERFLW_MASK)
> +		dev_dbg_ratelimited(dp->dev, "underflow interrupt\n");
> +	if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
> +		dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> +
> +	if (status & ZYNQMP_DP_INT_VBLANK_START)
> +		zynqmp_disp_handle_vblank(dp->dpsub->disp);
> +
> +	if (status & ZYNQMP_DP_INT_HPD_EVENT)
> +		schedule_delayed_work(&dp->hpd_work, 0);
> +
> +	if (status & ZYNQMP_DP_INT_HPD_IRQ) {
> +		int ret;
> +		u8 status[DP_LINK_STATUS_SIZE + 2];
> +
> +		ret =3D drm_dp_dpcd_read(&dp->aux, DP_SINK_COUNT, status,
> +				       DP_LINK_STATUS_SIZE + 2);
> +		if (ret < 0)
> +			goto handled;
> +
> +		if (status[4] & DP_LINK_STATUS_UPDATED ||
> +		    !drm_dp_clock_recovery_ok(&status[2], dp->mode.lane_cnt) ||
> +		    !drm_dp_channel_eq_ok(&status[2], dp->mode.lane_cnt)) {
> +			zynqmp_dp_train_loop(dp);
> +		}
> +	}
> +
> +handled:
> +	return IRQ_HANDLED;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Initialization & Cleanup
> + */
> +
> +int zynqmp_dp_init(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
> +{
> +	struct zynqmp_dp *dp =3D dpsub->dp;
> +	struct drm_encoder *encoder =3D &dp->encoder;
> +	struct drm_connector *connector =3D &dp->connector;
> +	int ret;
> +
> +	dp->drm =3D drm;
> +	dp->config.misc0 &=3D ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
> +	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
> +
> +	/* Create the DRM encoder and connector. */
> +	encoder->possible_crtcs |=3D zynqmp_disp_get_crtc_mask(dpsub->disp);
> +	drm_encoder_init(drm, encoder, &zynqmp_dp_encoder_funcs,
> +			 DRM_MODE_ENCODER_TMDS, NULL);
Here the new drm_simple_encoder_init() would make the code a little
simpler.

> +	drm_encoder_helper_add(encoder, &zynqmp_dp_encoder_helper_funcs);
> +
> +	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> +	ret =3D drm_connector_init(encoder->dev, connector,
> +				 &zynqmp_dp_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
> +	if (ret) {
> +		dev_err(dp->dev, "failed to create the DRM connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &zynqmp_dp_connector_helper_funcs);
> +	drm_connector_register(connector);
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	/* Initialize and register the AUX adapter. */
> +	ret =3D zynqmp_dp_aux_init(dp);
> +	if (ret) {
> +		dev_err(dp->dev, "failed to initialize DP aux\n");
> +		return ret;
> +	}
> +
> +	/* Now that initialisation is complete, enable interrupts. */
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_ALL);
> +
> +	return 0;
> +}
> +
> +void zynqmp_dp_cleanup(struct zynqmp_dpsub *dpsub)
> +{
> +	struct zynqmp_dp *dp =3D dpsub->dp;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
> +	disable_irq(dp->irq);
> +
> +	cancel_delayed_work_sync(&dp->hpd_work);
> +	zynqmp_dp_aux_cleanup(dp);
> +}
> +
> +int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct platform_device *=
pdev)
> +{
> +	struct zynqmp_dp *dp;
> +	struct resource *res;
> +	int ret;
> +
> +	dp =3D devm_kzalloc(&pdev->dev, sizeof(*dp), GFP_KERNEL);
> +	if (!dp)
> +		return -ENOMEM;
> +
> +	dp->dev =3D &pdev->dev;
> +	dp->dpsub =3D dpsub;
> +	dp->status =3D connector_status_disconnected;
> +
> +	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
> +
> +	/* Acquire all resources (IOMEM, IRQ and PHYs). */
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
> +	dp->iomem =3D devm_ioremap_resource(dp->dev, res);
> +	if (IS_ERR(dp->iomem))
> +		return PTR_ERR(dp->iomem);
> +
> +	dp->irq =3D platform_get_irq(pdev, 0);
> +	if (dp->irq < 0)
> +		return dp->irq;
> +
> +	dp->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(dp->reset)) {
> +		if (PTR_ERR(dp->reset) !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get reset: %ld\n",
> +				PTR_ERR(dp->reset));
> +		return PTR_ERR(dp->reset);
> +	}
> +
> +	ret =3D zynqmp_dp_phy_probe(dp);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize the hardware. */
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
> +			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
> +	zynqmp_dp_set(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_FORCE_SCRAMBLER_RESET, 1);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
> +
> +	ret =3D zynqmp_dp_phy_init(dp);
> +	if (ret)
> +		return ret;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 1);
> +
> +	/*
> +	 * Now that the hardware is initialized and won't generate spurious
> +	 * interrupts, request the IRQ.
> +	 */
> +	ret =3D devm_request_threaded_irq(dp->dev, dp->irq, NULL,
> +					zynqmp_dp_irq_handler, IRQF_ONESHOT,
> +					dev_name(dp->dev), dp);
> +	if (ret < 0)
> +		goto error_phy;
> +
> +	dpsub->dp =3D dp;
> +
> +	dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
> +		dp->num_lanes);
> +
> +	return 0;
> +
> +error_phy:
> +	zynqmp_dp_phy_exit(dp);
> +	return ret;
> +}
> +
> +void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
> +{
> +	struct zynqmp_dp *dp =3D dpsub->dp;
> +
> +	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
> +
> +	zynqmp_dp_phy_exit(dp);
> +	dpsub->dp =3D NULL;
> +}
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.h b/drivers/gpu/drm/xlnx/zynq=
mp_dp.h
> new file mode 100644
> index 000000000000..5e758d2b76b0
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ZynqMP DisplayPort Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef _ZYNQMP_DP_H_
> +#define _ZYNQMP_DP_H_
> +
> +struct drm_device;
> +struct platform_device;
> +struct zynqmp_dp;
> +struct zynqmp_dpsub;
> +
> +void zynqmp_dp_enable_vblank(struct zynqmp_dp *dp);
> +void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp);
> +
> +int zynqmp_dp_init(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
> +void zynqmp_dp_cleanup(struct zynqmp_dpsub *dpsub);
> +
> +int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct platform_device *=
pdev);
> +void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub);
> +
> +#endif /* _ZYNQMP_DP_H_ */
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/z=
ynqmp_dpsub.c
> new file mode 100644
> index 000000000000..2235761c4ed1
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ZynqMP DisplayPort Subsystem Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "zynqmp_disp.h"
> +#include "zynqmp_dp.h"
> +#include "zynqmp_dpsub.h"
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Dumb Buffer & Framebuffer Allocation
> + */
> +
> +static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
> +				    struct drm_device *drm,
> +				    struct drm_mode_create_dumb *args)
> +{
> +	struct zynqmp_dpsub *dpsub =3D drm->dev_private;
> +	unsigned int pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +
> +	/* Enforce the alignment constraints of the DMA engine. */
> +	args->pitch =3D ALIGN(pitch, dpsub->dma_align);
> +
> +	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
> +}
> +
> +static struct drm_framebuffer *
> +zynqmp_dpsub_fb_create(struct drm_device *drm, struct drm_file *file_pri=
v,
> +		       const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	struct zynqmp_dpsub *dpsub =3D drm->dev_private;
> +	struct drm_mode_fb_cmd2 cmd =3D *mode_cmd;
> +	unsigned int i;
> +
> +	/* Enforce the alignment constraints of the DMA engine. */
> +	for (i =3D 0; i < ARRAY_SIZE(cmd.pitches); ++i)
> +		cmd.pitches[i] =3D ALIGN(cmd.pitches[i], dpsub->dma_align);
> +
> +	return drm_gem_fb_create(drm, file_priv, &cmd);
> +}
> +
> +static const struct drm_mode_config_funcs zynqmp_dpsub_mode_config_funcs=
 =3D {
> +	.fb_create		=3D zynqmp_dpsub_fb_create,
> +	.atomic_check		=3D drm_atomic_helper_check,
> +	.atomic_commit		=3D drm_atomic_helper_commit,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * DRM/KMS Driver
> + */
> +
> +DEFINE_DRM_GEM_CMA_FOPS(zynqmp_dpsub_drm_fops);
> +
> +static struct drm_driver zynqmp_dpsub_drm_driver =3D {
> +	.driver_features		=3D DRIVER_MODESET | DRIVER_GEM |
> +					  DRIVER_ATOMIC,
> +
> +	.prime_handle_to_fd		=3D drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle		=3D drm_gem_prime_fd_to_handle,
> +	.gem_prime_export		=3D drm_gem_prime_export,
> +	.gem_prime_import		=3D drm_gem_prime_import,
> +	.gem_prime_get_sg_table		=3D drm_gem_cma_prime_get_sg_table,
> +	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
> +	.gem_prime_vmap			=3D drm_gem_cma_prime_vmap,
> +	.gem_prime_vunmap		=3D drm_gem_cma_prime_vunmap,
> +	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
> +	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
> +	.gem_vm_ops			=3D &drm_gem_cma_vm_ops,
> +	.dumb_create			=3D zynqmp_dpsub_dumb_create,
> +	.dumb_destroy			=3D drm_gem_dumb_destroy,
> +
> +	.fops				=3D &zynqmp_dpsub_drm_fops,
> +
> +	.name				=3D "zynqmp-dpsub",
> +	.desc				=3D "Xilinx DisplayPort Subsystem Driver",
> +	.date				=3D "20130509",
Hmm, this is not very current..

> +	.major				=3D 1,
> +	.minor				=3D 0,
> +};
> +
> +static void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub)
> +{
> +	struct drm_device *drm =3D dpsub->drm;
> +
> +	drm_dev_unregister(drm);
> +
> +	zynqmp_dp_cleanup(dpsub);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	drm_dev_put(drm);
> +}
> +
> +static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
> +{
> +	struct drm_device *drm;
> +	int ret;
> +
> +	drm =3D drm_dev_alloc(&zynqmp_dpsub_drm_driver, dpsub->dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	dpsub->drm =3D drm;
> +	drm->dev_private =3D dpsub;
> +
> +	/* Initialize mode config, vblank and the KMS poll helper. */
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.funcs =3D &zynqmp_dpsub_mode_config_funcs;
> +	drm->mode_config.min_width =3D 0;
> +	drm->mode_config.min_height =3D 0;
> +	drm->mode_config.max_width =3D ZYNQMP_DISP_MAX_WIDTH;
> +	drm->mode_config.max_height =3D ZYNQMP_DISP_MAX_HEIGHT;
> +
> +	ret =3D drm_vblank_init(drm, 1);
> +	if (ret)
> +		goto err_mode_config_cleanup;
> +
> +	drm->irq_enabled =3D 1;
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	/*
> +	 * Initialize the DISP and DP components. This will creates planes,
> +	 * CRTC, encoder and connector. The DISP should be initialized first as
> +	 * the DP encoder needs the CRTC.
> +	 */
> +	ret =3D zynqmp_disp_init(dpsub, drm);
> +	if (ret)
> +		goto err_poll_fini;
> +
> +	ret =3D zynqmp_dp_init(dpsub, drm);
> +	if (ret)
> +		goto err_poll_fini;
> +
> +	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
> +
> +	/* Reset all components and register the DRM device. */
> +	drm_mode_config_reset(drm);
> +
> +	ret =3D drm_dev_register(drm, 0);
> +	if (ret < 0)
> +		goto err_dp_cleanup;
> +
> +	/*
> +	 * Initialize fbdev generic emulation. Failures are not fatal as the
> +	 * DRM/KMS device is still usable without emulation support.
> +	 */
> +	ret =3D drm_fbdev_generic_setup(drm, 24);
> +	if (ret < 0)
> +		dev_err(dpsub->dev, "Failed to initialize fbdev emulation\n");
> +
> +	return 0;
> +
> +err_dp_cleanup:
> +	zynqmp_dp_cleanup(dpsub);
> +err_poll_fini:
> +	drm_kms_helper_poll_fini(drm);
> +err_mode_config_cleanup:
> +	drm_mode_config_cleanup(drm);
> +	drm_dev_put(drm);
> +	return ret;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Power Management
> + */
> +
> +static int __maybe_unused zynqmp_dpsub_suspend(struct device *dev)
> +{
> +	struct zynqmp_dpsub *dpsub =3D dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_suspend(dpsub->drm);
> +}
> +
> +static int __maybe_unused zynqmp_dpsub_resume(struct device *dev)
> +{
> +	struct zynqmp_dpsub *dpsub =3D dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_resume(dpsub->drm);
> +}
> +
> +static const struct dev_pm_ops zynqmp_dpsub_pm_ops =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(zynqmp_dpsub_suspend, zynqmp_dpsub_resume)
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Probe & Remove
> + */
> +
> +static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
> +{
> +	int ret;
> +
> +	dpsub->apb_clk =3D devm_clk_get(dpsub->dev, "dp_apb_clk");
> +	if (IS_ERR(dpsub->apb_clk))
> +		return PTR_ERR(dpsub->apb_clk);
> +
> +	ret =3D clk_prepare_enable(dpsub->apb_clk);
> +	if (ret) {
> +		dev_err(dpsub->dev, "failed to enable the APB clock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zynqmp_dpsub_probe(struct platform_device *pdev)
> +{
> +	struct zynqmp_dpsub *dpsub;
> +	int ret;
> +
> +	dpsub =3D devm_kzalloc(&pdev->dev, sizeof(*dpsub), GFP_KERNEL);
> +	if (!dpsub)
> +		return -ENOMEM;
> +
> +	dpsub->dev =3D &pdev->dev;
> +	platform_set_drvdata(pdev, dpsub);
> +
> +	/* Try the reserved memory. Proceed if there's none. */
> +	of_reserved_mem_device_init(&pdev->dev);
> +
> +	ret =3D zynqmp_dpsub_init_clocks(dpsub);
> +	if (ret < 0)
> +		goto err_mem;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	/*
> +	 * DP should be probed first so that the zynqmp_disp can set the output
> +	 * format accordingly.
> +	 */
> +	ret =3D zynqmp_dp_probe(dpsub, pdev);
> +	if (ret)
> +		goto err_pm;
> +
> +	ret =3D zynqmp_disp_probe(dpsub, pdev);
> +	if (ret)
> +		goto err_dp;
> +
> +	ret =3D zynqmp_dpsub_drm_init(dpsub);
> +	if (ret)
> +		goto err_disp;
> +
> +	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
> +
> +	return 0;
> +
> +err_disp:
> +	zynqmp_disp_remove(dpsub);
> +err_dp:
> +	zynqmp_dp_remove(dpsub);
> +err_pm:
> +	pm_runtime_disable(&pdev->dev);
> +	clk_disable_unprepare(dpsub->apb_clk);
> +err_mem:
> +	of_reserved_mem_device_release(&pdev->dev);
> +	return ret;
> +}
> +
> +static int zynqmp_dpsub_remove(struct platform_device *pdev)
> +{
> +	struct zynqmp_dpsub *dpsub =3D platform_get_drvdata(pdev);
> +
> +	zynqmp_dpsub_drm_cleanup(dpsub);
> +
> +	zynqmp_disp_remove(dpsub);
> +	zynqmp_dp_remove(dpsub);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	clk_disable_unprepare(dpsub->apb_clk);
> +	of_reserved_mem_device_release(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static void zynqmp_dpsub_shutdown(struct platform_device *pdev)
> +{
> +	struct zynqmp_dpsub *dpsub =3D platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(dpsub->drm);
> +}
> +
> +static const struct of_device_id zynqmp_dpsub_of_match[] =3D {
> +	{ .compatible =3D "xlnx,zynqmp-dpsub-1.7", },
> +	{ /* end of table */ },
> +};
> +MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
> +
> +static struct platform_driver zynqmp_dpsub_driver =3D {
> +	.probe			=3D zynqmp_dpsub_probe,
> +	.remove			=3D zynqmp_dpsub_remove,
> +	.shutdown		=3D zynqmp_dpsub_shutdown,
> +	.driver			=3D {
> +		.name		=3D "zynqmp-dpsub",
> +		.pm		=3D &zynqmp_dpsub_pm_ops,
> +		.of_match_table	=3D zynqmp_dpsub_of_match,
> +	},
> +};
> +
> +module_platform_driver(zynqmp_dpsub_driver);
> +
> +MODULE_AUTHOR("Xilinx, Inc.");
> +MODULE_DESCRIPTION("ZynqMP DP Subsystem Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/z=
ynqmp_dpsub.h
> new file mode 100644
> index 000000000000..732f29bda8d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ZynqMP DPSUB Subsystem Driver
> + *
> + * Copyright (C) 2017 - 2019 Xilinx, Inc.
> + *
> + * Authors:
> + * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
> + * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + */
> +
> +#ifndef _ZYNQMP_DPSUB_H_
> +#define _ZYNQMP_DPSUB_H_
> +
> +struct clk;
> +struct device;
> +struct drm_device;
> +struct zynqmp_disp;
> +struct zynqmp_dp;
> +
> +enum zynqmp_dpsub_format {
> +	ZYNQMP_DPSUB_FORMAT_RGB,
> +	ZYNQMP_DPSUB_FORMAT_YCRCB444,
> +	ZYNQMP_DPSUB_FORMAT_YCRCB422,
> +	ZYNQMP_DPSUB_FORMAT_YONLY,
> +};
> +
> +/**
> + * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem
> + * @drm: The DRM/KMS device
> + * @dev: The physical device
> + * @apb_clk: The APB clock
> + * @disp: The display controller
> + * @dp: The DisplayPort controller
> + * @dma_align: DMA alignment constraint (must be a power of 2)
> + */
> +struct zynqmp_dpsub {
> +	struct drm_device *drm;
> +	struct device *dev;
> +
> +	struct clk *apb_clk;
> +
> +	struct zynqmp_disp *disp;
> +	struct zynqmp_dp *dp;
> +
> +	unsigned int dma_align;
> +};
> +
> +#endif /* _ZYNQMP_DPSUB_H_ */
> -- =

> Regards,
> =

> Laurent Pinchart
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
