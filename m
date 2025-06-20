Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F103BAE2379
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E2510E163;
	Fri, 20 Jun 2025 20:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFCE10EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:22:34 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uSiFr-0001je-05; Fri, 20 Jun 2025 22:22:31 +0200
Message-ID: <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gert.wollny@collabora.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 22:22:30 +0200
In-Reply-To: <20250618204400.21808-6-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250618204400.21808-6-gert.wollny@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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

Am Mittwoch, dem 18.06.2025 um 22:43 +0200 schrieb Gert Wollny:
> The PPU flop reset is required on some hardware to clear the
> temporary registers. This implementation follows the code
> implemented in the public galcore kernel module code to this
> for the PPU.
>=20
> v2: - Move flop reset data to etnaviv_drm_private and initialize it
>       from etnaviv_gpu_bind (Lucas)
>     - Prepare code for more chip IDs and other flop reset types
>     - do some cleanups and function name renaming
>=20
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/Makefile             |   1 +
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   6 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   2 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 205 +++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  25 +++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |   6 +
>  7 files changed, 248 insertions(+)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
>=20
> diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/M=
akefile
> index 46e5ffad69a6..903101e8751a 100644
> --- a/drivers/gpu/drm/etnaviv/Makefile
> +++ b/drivers/gpu/drm/etnaviv/Makefile
> @@ -14,6 +14,7 @@ etnaviv-y :=3D \
>  	etnaviv_iommu.o \
>  	etnaviv_mmu.o \
>  	etnaviv_perfmon.o \
> +	etnaviv_flop_reset.o \
>  	etnaviv_sched.o
> =20
>  obj-$(CONFIG_DRM_ETNAVIV)	+=3D etnaviv.o
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_buffer.c
> index 9e007d977efe..a2da3212592f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -18,6 +18,8 @@
>  #include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
> =20
> +#include "etnaviv_flop_reset.h"
> +
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>  	struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> @@ -100,6 +102,10 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>  	/* initialize buffer */
>  	buffer->user_size =3D 0;
> =20
> +	/* Queue in PPU flop reset */
> +	if (etnaviv_flop_reset_ppu_require(&gpu->identity))
> +		etnaviv_flop_reset_ppu_run(gpu);
> +
>  	CMD_WAIT(buffer, gpu->fe_waitcycles);
>  	CMD_LINK(buffer, 2,
>  		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 3e91747ed339..73dc1c00c027 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -604,6 +604,8 @@ static void etnaviv_unbind(struct device *dev)
> =20
>  	xa_destroy(&priv->active_contexts);
> =20
> +	kfree(priv->flop_reset_data_ppu);
> +
Missing etnaviv_cmdbuf_free().

>  	drm->dev_private =3D NULL;
>  	kfree(priv);
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index b3eb1662e90c..20dad16fd554 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -48,6 +48,9 @@ struct etnaviv_drm_private {
>  	/* list of GEM objects: */
>  	struct mutex gem_lock;
>  	struct list_head gem_list;
> +
> +	/* ppu flop reset data */
> +	struct etnaviv_cmdbuf *flop_reset_data_ppu;
>  };
> =20
>  int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_flop_reset.c
> new file mode 100644
> index 000000000000..c33647e96636
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#include "asm-generic/int-ll64.h"
> +#include "etnaviv_buffer.h"
> +#include "etnaviv_cmdbuf.h"
> +#include "state_3d.xml.h"
> +
> +#include "etnaviv_flop_reset.h"
> +
> +enum etnaviv_flop_reset_type {
> +	flop_reset_ppu =3D 1 << 0,
> +	flop_reset_nn =3D 1 << 1,
> +	flop_reset_tp =3D 1 << 2
> +};
> +
> +#define PPU_IMAGE_STRIDE 64
> +#define PPU_IMAGE_XSIZE 64
> +#define PPU_IMAGE_YSIZE 6
> +
> +#define PPU_FLOP_RESET_INSTR_DWORD_COUNT 16
> +
> +static void
> +etnaviv_emit_flop_reset_state_ppu(struct etnaviv_cmdbuf *cmdbuf,
> +				  u32 buffer_base,
> +				  u32 input_offset,
> +				  u32 output_offset,
> +				  u32 shader_offset,
> +				  u32 shader_size,
> +				  u32 shader_register_count)
> +{
> +	CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE,
> +		               VIVS_GL_API_MODE_OPENCL);
> +	CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +	CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +
> +	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
> +
> +	OUT(cmdbuf, buffer_base + input_offset);
> +	OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
> +	OUT(cmdbuf, 0x444051f0);
> +	OUT(cmdbuf, 0xffffffff);
> +
> +	CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
> +	OUT(cmdbuf, buffer_base + output_offset);
> +	OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +	OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE  << 16));
> +	OUT(cmdbuf, 0x444051f0);
> +	OUT(cmdbuf, 0xffffffff);
> +
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG,
> +		               VIVS_CL_CONFIG_DIMENSIONS(2) |
> +		               VIVS_CL_CONFIG_VALUE_ORDER(3));
> +	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL,
> +		               shader_register_count);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH,
> +		               shader_size / 16);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR,
> +		               buffer_base + shader_offset);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG,
> +		               VIVS_SH_CONFIG_RTNE_ROUNDING);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL,
> +		               VIVS_VS_ICACHE_CONTROL_ENABLE);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT,
> +		               shader_size / 16 - 1);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_INPUT_COUNT, 0x1f01);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_VS_HALTI5_UNK008A0, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PA_VS_OUTPUT_COUNT, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_GL_VARYING_TOTAL_COMPONENTS, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_CONTROL_EXT, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_VS_OUTPUT_COUNT, 0x1);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_GL_HALTI5_SH_SPECIALS, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_PREFETCH, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_UNK00924, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_THREAD_ALLOCATION, 0x1);
> +
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_X, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Y, 0x0);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Z, 0x0);
> +
> +	CMD_LOAD_STATES_START(cmdbuf, VIVS_CL_WORKGROUP_COUNT_X, 9);
> +	OUT(cmdbuf, 0xf);
> +	OUT(cmdbuf, 0x5);
> +	OUT(cmdbuf, 0xffffffff);
> +	OUT(cmdbuf, 0x0);
> +	OUT(cmdbuf, 0x0);
> +	OUT(cmdbuf, 0x3ff);
> +	OUT(cmdbuf, 0x0);
> +	OUT(cmdbuf, 0x4);
> +	OUT(cmdbuf, 0x1);
> +	OUT(cmdbuf, 0x0);
> +
> +	CMD_LOAD_STATE(cmdbuf, VIVS_CL_KICKER, 0xbadabeeb);
> +	CMD_LOAD_STATE(cmdbuf, VIVS_GL_FLUSH_CACHE,
> +		               VIVS_GL_FLUSH_CACHE_SHADER_L1 |
> +		               VIVS_GL_FLUSH_CACHE_UNK10 |
> +		               VIVS_GL_FLUSH_CACHE_UNK11);
> +}
> +
> +static void
> +etnaviv_flop_reset_ppu_fill_input(u32 *buffer, u32 size)
> +{
> +	for (int i =3D 0; i < size/4; ++i, ++buffer)
> +		*buffer =3D 0x01010101;
> +}
> +
> +static void
> +etnaviv_flop_reset_ppu_set_shader(u8 *dest)
> +{
> +	const u32 inst[PPU_FLOP_RESET_INSTR_DWORD_COUNT] =3D {
> +		/* img_load.u8 r1, c0, r0.xy */
> +		0x78011779, 0x39000804, 0x00A90050, 0x00000000,
> +		/* img_load.u8 r2, c0, r0.xy */
> +		0x78021779, 0x39000804, 0x00A90050, 0x00000000,
> +		/* dp2x8 r1, r1, r2, c3_512 */
> +		0xB8017145, 0x390018FC, 0x01C90140, 0x40390028,
> +		/* img_store.u8 r1, c2, r0.xy, r1 */
> +		0x380007BA, 0x39001804, 0x00A90050, 0x00390018,
> +	};
> +	memcpy(dest, inst, sizeof(inst));
> +}
> +
> +static struct etnaviv_flop_reset_entry {
> +	u16 chip_model;
> +	u16 revision;
> +	u32 flags;
> +} etnaviv_flop_reset_db [] =3D {
> +	{
> +		.chip_model =3D 0x8000,
> +		.revision =3D 0x6205,
> +		.flags =3D flop_reset_ppu
> +	},
> +};
> +
> +bool
> +etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_=
id)
> +{
> +	const struct etnaviv_flop_reset_entry *e =3D etnaviv_flop_reset_db;
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(etnaviv_flop_reset_db); ++i, ++e) {
> +		if (chip_id->model =3D=3D e->chip_model &&
> +		    chip_id->revision =3D=3D e->revision)
> +			return (e->flags & flop_reset_ppu) !=3D 0;
> +	}
> +
> +	return false;
> +}
> +
> +static const u32 image_data_size =3D PPU_IMAGE_STRIDE * PPU_IMAGE_YSIZE;
> +static const u32 output_offset =3D ALIGN(image_data_size, 64);
> +static const u32 shader_offset =3D ALIGN(output_offset + image_data_size=
, 64);
> +static const u32 shader_size =3D PPU_FLOP_RESET_INSTR_DWORD_COUNT * size=
of(u32);
> +static const u32 shader_register_count =3D 3;
> +static const u32 buffer_size =3D shader_offset + shader_size;
> +
> +void
> +etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv)
> +{
> +	/* Get some space from the rung buffer to put the payload
                                   ^ ring
> +	   (input and output image, and shader), we keep this buffer
> +	   for the whole life time the driver is bound */

This isn't the comment style used throughout the driver.

> +	priv->flop_reset_data_ppu =3D
> +	  kzalloc(sizeof(*priv->flop_reset_data_ppu), GFP_KERNEL);
> +
> +	etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
> +			    priv->flop_reset_data_ppu, buffer_size);
> +
> +	void *buffer_base =3D priv->flop_reset_data_ppu->vaddr;
> +
> +	u32 *input_data =3D (u32 *)buffer_base;
> +	etnaviv_flop_reset_ppu_fill_input(input_data, image_data_size);
> +
> +	u8 *shader_data =3D (u8 *)buffer_base + shader_offset;
> +	etnaviv_flop_reset_ppu_set_shader(shader_data);
> +}
> +
> +void
> +etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu)
> +{
> +	struct etnaviv_drm_private *priv =3D gpu->drm->dev_private;
> +
> +	if (!priv->flop_reset_data_ppu) {
> +		pr_err("Flop reset data was not initialized, skipping\n");
> +		return;
> +	}
> +
> +	u32 buffer_base =3D etnaviv_cmdbuf_get_va(priv->flop_reset_data_ppu,
> +						&gpu->mmu_context->cmdbuf_mapping);
> +
> +	etnaviv_emit_flop_reset_state_ppu(&gpu->buffer,
> +					  buffer_base,
> +					  0,
> +					  output_offset,
> +					  shader_offset,
> +					  shader_size,
> +					  shader_register_count);
> +}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/d=
rm/etnaviv/etnaviv_flop_reset.h
> new file mode 100644
> index 000000000000..f51cece75507
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +
> +#ifndef etnaviv_flop_reset_h
> +#define etnaviv_flop_reset_h
> +
> +#include <linux/types.h>
> +
> +struct etnaviv_chip_identity;
> +struct etnaviv_drm_private;
> +struct etnaviv_gpu;
> +
> +bool
> +etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_=
id);
> +
> +void
> +etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv);
> +
> +void
> +etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu);
> +
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index dc8a7ff3e797..0d1dc1b1d98d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -18,6 +18,7 @@
> =20
>  #include "etnaviv_cmdbuf.h"
>  #include "etnaviv_dump.h"
> +#include "etnaviv_flop_reset.h"
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> @@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device *dev, st=
ruct device *master,
>  		ret =3D -ENXIO;
>  		goto out_sched;
>  	}
> +
> +	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> +	    !priv->flop_reset_data_ppu)
> +		etnaviv_flop_reset_ppu_init(priv);
> +
I don't see why you would need to do this in the bind callback. You
should be able to move this to etnaviv_gpu_init(), so you have the
needed identification data. gpu_init is also executed serially over all
GPUs in the device, so there is no problem with potential races there.

Regards,
Lucas

>  	priv->gpu[priv->num_gpus++] =3D gpu;
> =20
>  	return 0;

