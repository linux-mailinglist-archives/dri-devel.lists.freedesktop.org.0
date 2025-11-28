Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AFC9151B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9465110E873;
	Fri, 28 Nov 2025 08:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4F1CwI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A95110E873
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:54:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-343f35d0f99so1286683a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764320051; x=1764924851; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6D/KAR/bSWKR2s9ly+PQD/BhIMWcCPCILbduyTDkASA=;
 b=X4F1CwI/Vhq7p4v6caIC/VTrKM6NZ7QyIu7y02trNB4a/Qd3UQ7VwlbhQfsVwFPEzW
 HW5ymoaou7D3s7v5ODP/kMV3l9nrGzzpge5BHL2ncsG6ByUJv21VPOwASd68WjOKydr2
 1E92eVlTJnZ5BPh0NZbhTNkLBzBZJXDynWcuMsnQ7VJc++81j3UsBot5bv+45Od6nXEQ
 Q6hovVCzEchMUCtiDQ7gcs0V59plTssiRxonF77cBJ/JL3guORcYvBgFMC4vIj9TzUe+
 z9KWYike9jOkOjpLSVhWj21b4arYbFolvBQXBbmqH5QwsA50/gK4UruJwetRZUbR6Aqc
 +uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764320051; x=1764924851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6D/KAR/bSWKR2s9ly+PQD/BhIMWcCPCILbduyTDkASA=;
 b=rtSSWTOpNh6yRZSslhUwPmnQFrKWlcZBFJygpEMCPzOtNxQcUpYGbWelPcAPlL4rR9
 FKWXfxOLsg1EthkYtxguho1VQGgWEaSGP2kJffXIMgdpueORYzcee65X+ul7DXzStbQW
 JMuzI+d7KOfp750KmT0Uk+MLgXYsy1+HC15aIZvN9anveTDOUdARzNsSq5DKZImAaRKs
 Z+56XWuAkZzNjgf61UL0g2NwwOV1e9+aRIrXHj2gBcwVIvjUoleYs3nF4Fjl/X2gxbnp
 6YCRPR1V/zBgiU9bqmpGfOE8X3EUntHUQlfiVUiI+uEMbBVIsGUEfdKQXRqVInMwZ9jt
 aTPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrzMOiVVcIaiEPD2/GpU3jWl6LjdRkFdeqsi2Y4Z74YZJlgUbwD6dlpoG80LCWdV5ET4nM2OBRe+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgUaqliPI4+yC1Qe4h3pWcmAl73sI1NkieRzdsqfrMSFRjfiLJ
 t1/HtAEifWqCNBPg8lgV94IiJhDHjKkN1i2+BB6yJhvMEBd3m+ZMojEylVJDouh17XkiJ5rjQKf
 amX+r7F1WezCh3S0yFD47yV8aNpM3lpk=
X-Gm-Gg: ASbGncsid7YtQDfhR/2Cew5T0UmDtA1XxqXTQQIUnCI8e3mk6i19cj4SwVrqye0x6xe
 ei1k0/cDumI6pFOtT2VLUamtszpZlG3J8nofZzu0NE2WxYrpNd1FTA4O7JNjjdjlsTBeJwI+/Ij
 V5fwPNGwUE5pEQnE3INJyv8VFkTryMKzAs/BceLsQF0RWIQSuYioKxGWwzaUMbP7qPRFYcqknRq
 N6vGliBuKtJKGUut+P/94cW6C9PZvZwUZOR+B95FfEGUPR1guvRaqxsv63LJ1d5xjGZz2zsToZ6
 aDof
X-Google-Smtp-Source: AGHT+IFMBrhB7b7bNrMdCy66Ril2+ZUHgljkEvz9IAGMlG+ckvlvVnHFQRcsS6czYCm7p0xiNhOENy18Q3o9EI1gawQ=
X-Received: by 2002:a17:90b:164c:b0:340:ad5e:cd with SMTP id
 98e67ed59e1d1-3475ebe68f2mr14590056a91.5.1764320050890; Fri, 28 Nov 2025
 00:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20251110144625.18653-1-gert.wollny@collabora.com>
 <20251119164624.9297-1-gert.wollny@collabora.com>
 <20251119164624.9297-5-gert.wollny@collabora.com>
In-Reply-To: <20251119164624.9297-5-gert.wollny@collabora.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 28 Nov 2025 09:53:59 +0100
X-Gm-Features: AWmQ_bn0YhTgsHLbZX4q7TcndBhQDDJiR57-Ds6iIIFEVBDm-2_U2jb6PI18dLU
Message-ID: <CAH9NwWfxkUaKrypOZxJvFwp9j0ZMRrcWCc-hjRe=QYo=qqWT8A@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drm/etnaviv: Add PPU flop reset
To: gert.wollny@collabora.com
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Am Mi., 19. Nov. 2025 um 17:43 Uhr schrieb <gert.wollny@collabora.com>:
>
> From: Gert Wollny <gert.wollny@collabora.com>
>
> The PPU flop reset is required on some hardware to clear the
> temporary registers. This code follows the implementation
> of the PPU flop reset as found in the public galcore kernel
> module. Compared to that code some superfluous parts were
> removed and only the code path for SoC chip_model = 0x8000
> and revision = 0x6205 is implemented and tested.
>
> v2: - Move flop reset data to etnaviv_drm_private and initialize it
>       from etnaviv_gpu_bind (Lucas)
>     - Prepare code for more chip IDs and other flop reset types
>     - Do some cleanups and rename some functions
>
> v3: - Move initialization of flop reset data to etnaviv_gpu_init (Lucas)
>     - Free PPU data suballocation (Lucas)
>
> v4: As suggested by
>     - replace "asm-generic/int-ll64.h" with "linux/types.h"
>     - drop flop reset type enum since we only support one type here
>     - move function return parameters on same line with function name
>     - replace open coded for loop with memset32
>     - add cnost to local static values
>     - add a return value to etnaviv_flop_reset_ppu_init; handle and
>       pass errors on to the caller
>     - handle etnaviv_flop_reset_ppu_init return value
>     - use dev_err for flop reset error message
>     - fix include guard to be consistent with the other driver code
>     - fix license header and formatting
>
> v5: As suggested by Christian Gmeiner:
>     - add required header that is no longer pulled in by etnaviv_buffer.h
>     - fix include style of linux headers
>     - free flop_reset_data_ppu when command buffer initialization fails
>     - fix typo in error message
>
> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/Makefile             |   1 +
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   6 +
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.h     |   7 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h        |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c | 208 +++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h |  21 ++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  11 +
>  8 files changed, 260 insertions(+)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
>
> diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
> index 46e5ffad6..903101e87 100644
> --- a/drivers/gpu/drm/etnaviv/Makefile
> +++ b/drivers/gpu/drm/etnaviv/Makefile
> @@ -14,6 +14,7 @@ etnaviv-y := \
>         etnaviv_iommu.o \
>         etnaviv_mmu.o \
>         etnaviv_perfmon.o \
> +       etnaviv_flop_reset.o \
>         etnaviv_sched.o
>
>  obj-$(CONFIG_DRM_ETNAVIV)      += etnaviv.o
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 829f8497d..463a6f556 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -18,6 +18,8 @@
>  #include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
>
> +#include "etnaviv_flop_reset.h"
> +
>  static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
>         struct etnaviv_cmdbuf *buffer, u8 pipe)
>  {
> @@ -100,6 +102,10 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>         /* initialize buffer */
>         buffer->user_size = 0;
>
> +       /* Queue in PPU flop reset */
> +       if (etnaviv_flop_reset_ppu_require(&gpu->identity))
> +               etnaviv_flop_reset_ppu_run(gpu);
> +
>         CMD_WAIT(buffer, gpu->fe_waitcycles);
>         CMD_LINK(buffer, 2,
>                  etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> index c5a0d1fb9..9388a686e 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
> @@ -7,9 +7,16 @@
>  #define etnaviv_buffer_h
>
>  #include "etnaviv_cmdbuf.h"
> +#include "etnaviv_gpu.h"
> +#include "etnaviv_gem.h"
> +#include "etnaviv_mmu.h"
>
>  #include "common.xml.h"
> +#include "linux/printk.h"

#include <linux/printk.h> and move it to the top.

>  #include "state.xml.h"
> +#include "state_blt.xml.h"
> +#include "state_hi.xml.h"
> +#include "state_3d.xml.h"
>  #include "cmdstream.xml.h"
>
>  static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index f9bc837e2..21a42a1f4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -569,6 +569,9 @@ static void etnaviv_unbind(struct device *dev)
>
>         component_unbind_all(dev, drm);
>
> +       etnaviv_cmdbuf_free(priv->flop_reset_data_ppu);
> +       kfree(priv->flop_reset_data_ppu);
> +
>         etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>
>         xa_destroy(&priv->active_contexts);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index b3eb1662e..20dad16fd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -48,6 +48,9 @@ struct etnaviv_drm_private {
>         /* list of GEM objects: */
>         struct mutex gem_lock;
>         struct list_head gem_list;
> +
> +       /* ppu flop reset data */
> +       struct etnaviv_cmdbuf *flop_reset_data_ppu;
>  };
>
>  int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> new file mode 100644
> index 000000000..6ed2471f3
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.c
> @@ -0,0 +1,208 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/dev_printk.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "etnaviv_buffer.h"
> +#include "etnaviv_cmdbuf.h"
> +#include "etnaviv_gpu.h"
> +#include "state_3d.xml.h"
> +
> +#include "etnaviv_flop_reset.h"
> +
> +#define PPU_IMAGE_STRIDE 64
> +#define PPU_IMAGE_XSIZE 64
> +#define PPU_IMAGE_YSIZE 6
> +
> +#define PPU_FLOP_RESET_INSTR_DWORD_COUNT 16
> +
> +static void etnaviv_emit_flop_reset_state_ppu(struct etnaviv_cmdbuf *cmdbuf,
> +                                             u32 buffer_base, u32 input_offset,
> +                                             u32 output_offset,
> +                                             u32 shader_offset,
> +                                             u32 shader_size,
> +                                             u32 shader_register_count)
> +{
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_API_MODE, VIVS_GL_API_MODE_OPENCL);
> +       CMD_SEM(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +       CMD_STALL(cmdbuf, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(0), 4);
> +
> +       OUT(cmdbuf, buffer_base + input_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_SH_HALTI5_UNIFORMS(4), 4);
> +       OUT(cmdbuf, buffer_base + output_offset);
> +       OUT(cmdbuf, PPU_IMAGE_STRIDE);
> +       OUT(cmdbuf, PPU_IMAGE_XSIZE | (PPU_IMAGE_YSIZE << 16));
> +       OUT(cmdbuf, 0x444051f0);
> +       OUT(cmdbuf, 0xffffffff);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_CONFIG,
> +                      VIVS_CL_CONFIG_DIMENSIONS(2) |
> +                              VIVS_CL_CONFIG_VALUE_ORDER(3));
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_INVALIDATE, 0x1f);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_VARYING_NUM_COMPONENTS(0), 0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_TEMP_REGISTER_CONTROL,
> +                      shader_register_count);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_SAMPLER_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_UNIFORM_BASE, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_LOW, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_NEWRANGE_HIGH, shader_size / 16);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_INST_ADDR, buffer_base + shader_offset);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_SH_CONFIG, VIVS_SH_CONFIG_RTNE_ROUNDING);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_ICACHE_CONTROL,
> +                      VIVS_VS_ICACHE_CONTROL_ENABLE);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_COUNT, shader_size / 16 - 1);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_INPUT_COUNT, 0x1f01);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_HALTI5_UNK008A0, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PA_VS_OUTPUT_COUNT, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_VARYING_TOTAL_COMPONENTS, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_CONTROL_EXT, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_VS_OUTPUT_COUNT, 0x1);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_HALTI5_SH_SPECIALS, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_PS_ICACHE_PREFETCH, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_UNK00924, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_THREAD_ALLOCATION, 0x1);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_X, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Y, 0x0);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_GLOBAL_WORK_OFFSET_Z, 0x0);
> +
> +       CMD_LOAD_STATES_START(cmdbuf, VIVS_CL_WORKGROUP_COUNT_X, 9);
> +       OUT(cmdbuf, 0xf);
> +       OUT(cmdbuf, 0x5);
> +       OUT(cmdbuf, 0xffffffff);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x3ff);
> +       OUT(cmdbuf, 0x0);
> +       OUT(cmdbuf, 0x4);
> +       OUT(cmdbuf, 0x1);
> +       OUT(cmdbuf, 0x0);
> +
> +       CMD_LOAD_STATE(cmdbuf, VIVS_CL_KICKER, 0xbadabeeb);
> +       CMD_LOAD_STATE(cmdbuf, VIVS_GL_FLUSH_CACHE,
> +                      VIVS_GL_FLUSH_CACHE_SHADER_L1 |
> +                              VIVS_GL_FLUSH_CACHE_UNK10 |
> +                              VIVS_GL_FLUSH_CACHE_UNK11);
> +}
> +
> +static void etnaviv_flop_reset_ppu_fill_input(u32 *buffer, u32 size)
> +{
> +       memset32(buffer, 0x01010101, size / 4);
> +}
> +
> +static void etnaviv_flop_reset_ppu_set_shader(u8 *dest)
> +{
> +       static const u32 inst[PPU_FLOP_RESET_INSTR_DWORD_COUNT] = {
> +               /* img_load.u8 r1, c0, r0.xy */
> +               0x78011779,
> +               0x39000804,
> +               0x00A90050,
> +               0x00000000,
> +               /* img_load.u8 r2, c0, r0.xy */
> +               0x78021779,
> +               0x39000804,
> +               0x00A90050,
> +               0x00000000,
> +               /* dp2x8 r1, r1, r2, c3_512 */
> +               0xB8017145,
> +               0x390018FC,
> +               0x01C90140,
> +               0x40390028,
> +               /* img_store.u8 r1, c2, r0.xy, r1 */
> +               0x380007BA,
> +               0x39001804,
> +               0x00A90050,
> +               0x00390018,
> +       };
> +       memcpy(dest, inst, sizeof(inst));
> +}
> +
> +static const struct etnaviv_flop_reset_entry {
> +       u16 chip_model;
> +       u16 revision;
> +       u32 flags;
> +} etnaviv_flop_reset_db[] = {
> +       {
> +               .chip_model = 0x8000,
> +               .revision = 0x6205,
> +       },
> +};
> +
> +bool etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id)
> +{
> +       const struct etnaviv_flop_reset_entry *e = etnaviv_flop_reset_db;
> +
> +       for (int i = 0; i < ARRAY_SIZE(etnaviv_flop_reset_db); ++i, ++e) {
> +               if (chip_id->model == e->chip_model &&
> +                   chip_id->revision == e->revision)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static const u32 image_data_size = PPU_IMAGE_STRIDE * PPU_IMAGE_YSIZE;
> +static const u32 output_offset = ALIGN(image_data_size, 64);
> +static const u32 shader_offset = ALIGN(output_offset + image_data_size, 64);
> +static const u32 shader_size = PPU_FLOP_RESET_INSTR_DWORD_COUNT * sizeof(u32);
> +static const u32 shader_register_count = 3;
> +static const u32 buffer_size = shader_offset + shader_size;
> +
> +int etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv)
> +{
> +       /* Get some space from the rung buffer to put the payload
> +        * (input and output image, and shader), we keep this buffer
> +        * for the whole life time the driver is bound
> +        */
> +       priv->flop_reset_data_ppu =
> +               kzalloc(sizeof(*priv->flop_reset_data_ppu), GFP_KERNEL);
> +
> +       if (!priv->flop_reset_data_ppu)
> +               return -ENOMEM;
> +
> +       int ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc,
> +                                     priv->flop_reset_data_ppu, buffer_size);
> +       if (ret) {
> +               kfree(priv->flop_reset_data_ppu);
> +               return ret;
> +       }
> +
> +       void *buffer_base = priv->flop_reset_data_ppu->vaddr;
> +       u32 *input_data = (u32 *)buffer_base;
> +       u8 *shader_data = (u8 *)buffer_base + shader_offset;
> +
> +       etnaviv_flop_reset_ppu_fill_input(input_data, image_data_size);
> +       etnaviv_flop_reset_ppu_set_shader(shader_data);
> +
> +       return 0;
> +}
> +
> +void etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu)
> +{
> +       struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> +
> +       if (!priv->flop_reset_data_ppu) {
> +               dev_err(gpu->dev,
> +                       "Oops: Flop reset data was not initialized, skipping\n");
> +               return;
> +       }
> +
> +       u32 buffer_base = etnaviv_cmdbuf_get_va(
> +               priv->flop_reset_data_ppu, &gpu->mmu_context->cmdbuf_mapping);
> +
> +       etnaviv_emit_flop_reset_state_ppu(&gpu->buffer, buffer_base, 0,
> +                                         output_offset, shader_offset,
> +                                         shader_size, shader_register_count);
> +}
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> new file mode 100644
> index 000000000..e6dee1db7
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_flop_reset.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (C) 2025 Etnaviv Project
> + */
> +
> +#ifndef _ETNAVIV_FLOP_RESET_H_
> +#define _ETNAVIV_FLOP_RESET_H_
> +
> +#include <linux/types.h>
> +
> +struct etnaviv_chip_identity;
> +struct etnaviv_drm_private;
> +struct etnaviv_gpu;
> +
> +bool etnaviv_flop_reset_ppu_require(const struct etnaviv_chip_identity *chip_id);
> +
> +int etnaviv_flop_reset_ppu_init(struct etnaviv_drm_private *priv);
> +
> +void etnaviv_flop_reset_ppu_run(struct etnaviv_gpu *gpu);
> +
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 33586e3f2..b5257e0a7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -18,6 +18,7 @@
>
>  #include "etnaviv_cmdbuf.h"
>  #include "etnaviv_dump.h"
> +#include "etnaviv_flop_reset.h"
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> @@ -789,6 +790,16 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>                 goto fail;
>         }
>
> +       if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> +           !priv->flop_reset_data_ppu) {
> +               ret = etnaviv_flop_reset_ppu_init(priv);
> +               if (ret) {
> +                       dev_err(gpu->dev,
> +                               "Unable to initialize PPU flop reset data\n");
> +                       goto fail;
> +               }
> +       }
> +
>         if (gpu->identity.nn_core_count > 0)
>                 dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
>                                     "for which the UAPI is still experimental\n");
> --
> 2.51.0
>

In order to save you from doing another round, I will fix the last
nit, if that is okay
for you.

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
