Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A68786A4E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210A10E4E7;
	Thu, 24 Aug 2023 08:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F104D10E4E7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5wO8PbKidk4WoBpD0DTOIX8wIVS10D+zzVINyQiOEE=;
 b=M/giJgEeFJMo7aDeV/n6nod4KBdsZmYrmEZqb4NdPJMffCLsS2jjcJ8/gIymXdq4EPDWLh
 GOxP4MKsjjT6nDBg0tID1IJJbjLFl6SlAkxhPeyek3aXRqVOp/iYc+vSmySRIb2JJhMiZt
 JGIX+P3AQllFj2aIUmzTncvzeqvaJo4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-vRARj3EdOPOospCV0RG_8g-1; Thu, 24 Aug 2023 04:41:40 -0400
X-MC-Unique: vRARj3EdOPOospCV0RG_8g-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bbafb70ecbso14128781fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 01:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866498; x=1693471298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5wO8PbKidk4WoBpD0DTOIX8wIVS10D+zzVINyQiOEE=;
 b=ayOMWqp4UdhhDiBONO/5Ynzg+Mv/kHy08iIVkHvU20YPuO9cF5tj27HPt+rnb5AVOb
 /f0/I4Jrg4S+VgbLul6nPcYdK3NgsYvjgG588IuCNYf9I7YfhgHDybM2c6zx1UkdcKgb
 YtqSiTnXXnwnD+AtOEHiyN8KuEcuKxJcoPrunKyx46dxSxqImXiihbhN73h/NdOVRRDj
 NptxaWhRLrvbYeJ78t++oW4ILdPuCiNU54WYWi1HxHYSt5Msl6sG58OrJGpH4KQyqMT1
 Mm/LWFQgYtdeCYMZ0R3Z441EOUiW3AV7c81MDZ4csWy9u6YTsxQtpq8Cc609Y/FLsY1N
 IfFw==
X-Gm-Message-State: AOJu0YzGjL27+kx1saez2YBZTi+6r0xMOaE4/zrVnh5W/prjzvUFFXIw
 rTbAdvnC/5AsVJ+LymVWY3kwVLDz03z1GkKK75H01dkzK6BkrCF1e/uLkzhlhRAoeNAQN/v7LZK
 15WO2nN96br5/obamRyzO/zFzPxhf2vbypBZuo363s+zC
X-Received: by 2002:a05:651c:19a4:b0:2b6:a882:129c with SMTP id
 bx36-20020a05651c19a400b002b6a882129cmr12866658ljb.0.1692866498668; 
 Thu, 24 Aug 2023 01:41:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+OHi4IZEMx5ZaVqLdoTwq6QNcM5s/NEtabkQI2+YCTPS9Z3iS4SXv+xLT3oe01ytcI/VlcGqjnJxp3jqQmEg=
X-Received: by 2002:a05:651c:19a4:b0:2b6:a882:129c with SMTP id
 bx36-20020a05651c19a400b002b6a882129cmr12866636ljb.0.1692866498245; Thu, 24
 Aug 2023 01:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-4-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-4-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:41:27 +0200
Message-ID: <CACO55ttVrQZQGHzWgodroF4TXbgx_qoft8we6daRdDvoUpXtKw@mail.gmail.com>
Subject: Re: [PATCH 03/20] drm/nouveau/nvkm/subdev/bios/init: Demote a bunch
 of kernel-doc abuses
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:584: warning: Function p=
arameter or member 'init' not described in 'init_reserved'
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c:611: warning: expecting =
prototype for INIT_DONE(). Prototype was for init_done() instead
>  [Snipped ~140 lines for brevity]
>
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   | 136 +++++++++---------
>  1 file changed, 68 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/bios/init.c
> index 1420794038642..b54f044c4483b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -575,7 +575,7 @@ init_tmds_reg(struct nvbios_init *init, u8 tmds)
>   * init opcode handlers
>   ***********************************************************************=
******/
>
> -/**
> +/*
>   * init_reserved - stub for various unknown/unused single-byte opcodes
>   *
>   */
> @@ -602,7 +602,7 @@ init_reserved(struct nvbios_init *init)
>         init->offset +=3D length;
>  }
>
> -/**
> +/*
>   * INIT_DONE - opcode 0x71
>   *
>   */
> @@ -613,7 +613,7 @@ init_done(struct nvbios_init *init)
>         init->offset =3D 0x0000;
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PROG - opcode 0x32
>   *
>   */
> @@ -650,7 +650,7 @@ init_io_restrict_prog(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_REPEAT - opcode 0x33
>   *
>   */
> @@ -676,7 +676,7 @@ init_repeat(struct nvbios_init *init)
>         init->repeat =3D repeat;
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PLL - opcode 0x34
>   *
>   */
> @@ -716,7 +716,7 @@ init_io_restrict_pll(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_END_REPEAT - opcode 0x36
>   *
>   */
> @@ -732,7 +732,7 @@ init_end_repeat(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_COPY - opcode 0x37
>   *
>   */
> @@ -759,7 +759,7 @@ init_copy(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data);
>  }
>
> -/**
> +/*
>   * INIT_NOT - opcode 0x38
>   *
>   */
> @@ -771,7 +771,7 @@ init_not(struct nvbios_init *init)
>         init_exec_inv(init);
>  }
>
> -/**
> +/*
>   * INIT_IO_FLAG_CONDITION - opcode 0x39
>   *
>   */
> @@ -788,7 +788,7 @@ init_io_flag_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_GENERIC_CONDITION - opcode 0x3a
>   *
>   */
> @@ -840,7 +840,7 @@ init_generic_condition(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_IO_MASK_OR - opcode 0x3b
>   *
>   */
> @@ -859,7 +859,7 @@ init_io_mask_or(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, index, data &=3D ~(1 << or));
>  }
>
> -/**
> +/*
>   * INIT_IO_OR - opcode 0x3c
>   *
>   */
> @@ -878,7 +878,7 @@ init_io_or(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, index, data | (1 << or));
>  }
>
> -/**
> +/*
>   * INIT_ANDN_REG - opcode 0x47
>   *
>   */
> @@ -895,7 +895,7 @@ init_andn_reg(struct nvbios_init *init)
>         init_mask(init, reg, mask, 0);
>  }
>
> -/**
> +/*
>   * INIT_OR_REG - opcode 0x48
>   *
>   */
> @@ -912,7 +912,7 @@ init_or_reg(struct nvbios_init *init)
>         init_mask(init, reg, 0, mask);
>  }
>
> -/**
> +/*
>   * INIT_INDEX_ADDRESS_LATCHED - opcode 0x49
>   *
>   */
> @@ -942,7 +942,7 @@ init_idx_addr_latched(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_IO_RESTRICT_PLL2 - opcode 0x4a
>   *
>   */
> @@ -977,7 +977,7 @@ init_io_restrict_pll2(struct nvbios_init *init)
>         trace("}]\n");
>  }
>
> -/**
> +/*
>   * INIT_PLL2 - opcode 0x4b
>   *
>   */
> @@ -994,7 +994,7 @@ init_pll2(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_I2C_BYTE - opcode 0x4c
>   *
>   */
> @@ -1025,7 +1025,7 @@ init_i2c_byte(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_ZM_I2C_BYTE - opcode 0x4d
>   *
>   */
> @@ -1051,7 +1051,7 @@ init_zm_i2c_byte(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_ZM_I2C - opcode 0x4e
>   *
>   */
> @@ -1085,7 +1085,7 @@ init_zm_i2c(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_TMDS - opcode 0x4f
>   *
>   */
> @@ -1111,7 +1111,7 @@ init_tmds(struct nvbios_init *init)
>         init_wr32(init, reg + 0, addr);
>  }
>
> -/**
> +/*
>   * INIT_ZM_TMDS_GROUP - opcode 0x50
>   *
>   */
> @@ -1138,7 +1138,7 @@ init_zm_tmds_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CR_INDEX_ADDRESS_LATCHED - opcode 0x51
>   *
>   */
> @@ -1168,7 +1168,7 @@ init_cr_idx_adr_latch(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr0, save0);
>  }
>
> -/**
> +/*
>   * INIT_CR - opcode 0x52
>   *
>   */
> @@ -1188,7 +1188,7 @@ init_cr(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr, val | data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_CR - opcode 0x53
>   *
>   */
> @@ -1205,7 +1205,7 @@ init_zm_cr(struct nvbios_init *init)
>         init_wrvgai(init, 0x03d4, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_CR_GROUP - opcode 0x54
>   *
>   */
> @@ -1229,7 +1229,7 @@ init_zm_cr_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CONDITION_TIME - opcode 0x56
>   *
>   */
> @@ -1256,7 +1256,7 @@ init_condition_time(struct nvbios_init *init)
>         init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_LTIME - opcode 0x57
>   *
>   */
> @@ -1273,7 +1273,7 @@ init_ltime(struct nvbios_init *init)
>                 mdelay(msec);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_SEQUENCE - opcode 0x58
>   *
>   */
> @@ -1298,7 +1298,7 @@ init_zm_reg_sequence(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_PLL_INDIRECT - opcode 0x59
>   *
>   */
> @@ -1317,7 +1317,7 @@ init_pll_indirect(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_INDIRECT - opcode 0x5a
>   *
>   */
> @@ -1336,7 +1336,7 @@ init_zm_reg_indirect(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_SUB_DIRECT - opcode 0x5b
>   *
>   */
> @@ -1362,7 +1362,7 @@ init_sub_direct(struct nvbios_init *init)
>         init->offset +=3D 3;
>  }
>
> -/**
> +/*
>   * INIT_JUMP - opcode 0x5c
>   *
>   */
> @@ -1380,7 +1380,7 @@ init_jump(struct nvbios_init *init)
>                 init->offset +=3D 3;
>  }
>
> -/**
> +/*
>   * INIT_I2C_IF - opcode 0x5e
>   *
>   */
> @@ -1407,7 +1407,7 @@ init_i2c_if(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_COPY_NV_REG - opcode 0x5f
>   *
>   */
> @@ -1433,7 +1433,7 @@ init_copy_nv_reg(struct nvbios_init *init)
>         init_mask(init, dreg, ~dmask, (data & smask) ^ sxor);
>  }
>
> -/**
> +/*
>   * INIT_ZM_INDEX_IO - opcode 0x62
>   *
>   */
> @@ -1451,7 +1451,7 @@ init_zm_index_io(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data);
>  }
>
> -/**
> +/*
>   * INIT_COMPUTE_MEM - opcode 0x63
>   *
>   */
> @@ -1469,7 +1469,7 @@ init_compute_mem(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_RESET - opcode 0x65
>   *
>   */
> @@ -1496,7 +1496,7 @@ init_reset(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_MEM - opcode 0x66
>   *
>   */
> @@ -1555,7 +1555,7 @@ init_configure_mem(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_CLK - opcode 0x67
>   *
>   */
> @@ -1589,7 +1589,7 @@ init_configure_clk(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_CONFIGURE_PREINIT - opcode 0x68
>   *
>   */
> @@ -1615,7 +1615,7 @@ init_configure_preinit(struct nvbios_init *init)
>         init_exec_force(init, false);
>  }
>
> -/**
> +/*
>   * INIT_IO - opcode 0x69
>   *
>   */
> @@ -1655,7 +1655,7 @@ init_io(struct nvbios_init *init)
>         init_wrport(init, port, data | value);
>  }
>
> -/**
> +/*
>   * INIT_SUB - opcode 0x6b
>   *
>   */
> @@ -1682,7 +1682,7 @@ init_sub(struct nvbios_init *init)
>         init->offset +=3D 2;
>  }
>
> -/**
> +/*
>   * INIT_RAM_CONDITION - opcode 0x6d
>   *
>   */
> @@ -1701,7 +1701,7 @@ init_ram_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_NV_REG - opcode 0x6e
>   *
>   */
> @@ -1719,7 +1719,7 @@ init_nv_reg(struct nvbios_init *init)
>         init_mask(init, reg, ~mask, data);
>  }
>
> -/**
> +/*
>   * INIT_MACRO - opcode 0x6f
>   *
>   */
> @@ -1743,7 +1743,7 @@ init_macro(struct nvbios_init *init)
>         init->offset +=3D 2;
>  }
>
> -/**
> +/*
>   * INIT_RESUME - opcode 0x72
>   *
>   */
> @@ -1755,7 +1755,7 @@ init_resume(struct nvbios_init *init)
>         init_exec_set(init, true);
>  }
>
> -/**
> +/*
>   * INIT_STRAP_CONDITION - opcode 0x73
>   *
>   */
> @@ -1773,7 +1773,7 @@ init_strap_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_TIME - opcode 0x74
>   *
>   */
> @@ -1794,7 +1794,7 @@ init_time(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_CONDITION - opcode 0x75
>   *
>   */
> @@ -1811,7 +1811,7 @@ init_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_IO_CONDITION - opcode 0x76
>   *
>   */
> @@ -1828,7 +1828,7 @@ init_io_condition(struct nvbios_init *init)
>                 init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG16 - opcode 0x77
>   *
>   */
> @@ -1845,7 +1845,7 @@ init_zm_reg16(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_INDEX_IO - opcode 0x78
>   *
>   */
> @@ -1867,7 +1867,7 @@ init_index_io(struct nvbios_init *init)
>         init_wrvgai(init, port, index, data | value);
>  }
>
> -/**
> +/*
>   * INIT_PLL - opcode 0x79
>   *
>   */
> @@ -1884,7 +1884,7 @@ init_pll(struct nvbios_init *init)
>         init_prog_pll(init, reg, freq);
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG - opcode 0x7a
>   *
>   */
> @@ -1904,7 +1904,7 @@ init_zm_reg(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_RAM_RESTRICT_PLL - opcde 0x87
>   *
>   */
> @@ -1934,7 +1934,7 @@ init_ram_restrict_pll(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_RESET_BEGUN - opcode 0x8c
>   *
>   */
> @@ -1945,7 +1945,7 @@ init_reset_begun(struct nvbios_init *init)
>         init->offset +=3D 1;
>  }
>
> -/**
> +/*
>   * INIT_RESET_END - opcode 0x8d
>   *
>   */
> @@ -1956,7 +1956,7 @@ init_reset_end(struct nvbios_init *init)
>         init->offset +=3D 1;
>  }
>
> -/**
> +/*
>   * INIT_GPIO - opcode 0x8e
>   *
>   */
> @@ -1972,7 +1972,7 @@ init_gpio(struct nvbios_init *init)
>                 nvkm_gpio_reset(gpio, DCB_GPIO_UNUSED);
>  }
>
> -/**
> +/*
>   * INIT_RAM_RESTRICT_ZM_GROUP - opcode 0x8f
>   *
>   */
> @@ -2010,7 +2010,7 @@ init_ram_restrict_zm_reg_group(struct nvbios_init *=
init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_COPY_ZM_REG - opcode 0x90
>   *
>   */
> @@ -2027,7 +2027,7 @@ init_copy_zm_reg(struct nvbios_init *init)
>         init_wr32(init, dreg, init_rd32(init, sreg));
>  }
>
> -/**
> +/*
>   * INIT_ZM_REG_GROUP - opcode 0x91
>   *
>   */
> @@ -2049,7 +2049,7 @@ init_zm_reg_group(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_XLAT - opcode 0x96
>   *
>   */
> @@ -2077,7 +2077,7 @@ init_xlat(struct nvbios_init *init)
>         init_mask(init, daddr, ~dmask, data);
>  }
>
> -/**
> +/*
>   * INIT_ZM_MASK_ADD - opcode 0x97
>   *
>   */
> @@ -2098,7 +2098,7 @@ init_zm_mask_add(struct nvbios_init *init)
>         init_wr32(init, addr, data);
>  }
>
> -/**
> +/*
>   * INIT_AUXCH - opcode 0x98
>   *
>   */
> @@ -2122,7 +2122,7 @@ init_auxch(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_AUXCH - opcode 0x99
>   *
>   */
> @@ -2144,7 +2144,7 @@ init_zm_auxch(struct nvbios_init *init)
>         }
>  }
>
> -/**
> +/*
>   * INIT_I2C_LONG_IF - opcode 0x9a
>   *
>   */
> @@ -2183,7 +2183,7 @@ init_i2c_long_if(struct nvbios_init *init)
>         init_exec_set(init, false);
>  }
>
> -/**
> +/*
>   * INIT_GPIO_NE - opcode 0xa9
>   *
>   */
> --
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

