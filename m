Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC884827662
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2EF10E155;
	Mon,  8 Jan 2024 17:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D557910E155
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704735365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngyj24n+mc5pmKmREYmUdIsnmVGNr15UAzj8tSnLSjI=;
 b=USJKmUJtz2QRCJrC1L+VjEK3FYbJfv3NioTaEl2XeDpgn1PP6x3CZqdWQTOLhq+HOHw+dD
 wfliZk67Z3ycZfVAxSVk/xPAM8HDOB6YhSVUxKax6hsFpKUWot1629UZFej/2a09lFNIVG
 04mszmba820kBgJoUpBA4gpIx+9EzJ8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-L0LH2nNcNK2bDDY8bTRUjQ-1; Mon, 08 Jan 2024 12:36:03 -0500
X-MC-Unique: L0LH2nNcNK2bDDY8bTRUjQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3bc0e5a430dso2635565b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 09:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704735362; x=1705340162;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngyj24n+mc5pmKmREYmUdIsnmVGNr15UAzj8tSnLSjI=;
 b=F461iYlJFOR2ffvWIp/R2q76c3bpRSGrtVzUETF0n9owB4JCCGnVBQltohiwy4fj5D
 ES3Gzr+0ADaT12E8N2ryv66aGwrlPo45ItCzN6B0Xm3XcMeUKcbl9oq6iT295lfTp9du
 6aaPXZ1UoxXWAIZz/T8RIqzcsA3Lvk01OdNPAvPDhr+a6Wrmspsn5tezK7IPVn+G9Y2h
 bamAVX3oK2M0nLdZN3kzL5HcHNdPVOX5Orv2DLjmfsDTdWR5rMEWTCn2qbgSW+9zP6Q+
 XsItdZkP/fIbNCda1DCCoLt15KU0blMEZ0RwZFd8poWNJPpdHUMjiQJJn4xe+YCs5BLg
 S44A==
X-Gm-Message-State: AOJu0YwljkrXbDc57e3Mu/qhT0hH/V3rIZU4gDe4SUKCPeDg8EfAkLyu
 EWJwt8mGb5+RDy0Bp0zLmNLIeVdmBzXhW0tveyr8W62wBTPpWEPEirXA7f1jg5hr/RYzNkz8vsm
 93UrO4xCgcglaQVakS0WIeXzly6Y3CqS3UwcOIR51LRn3
X-Received: by 2002:a05:6808:1441:b0:3bc:d45:e5e8 with SMTP id
 x1-20020a056808144100b003bc0d45e5e8mr3989865oiv.22.1704735362310; 
 Mon, 08 Jan 2024 09:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO9PzmqyhX4GJg9dT7jJkqJ2vhfTp9JRYqGvojzVCoBmh00ogKkvmro5+RQz9q1YNF9EuC+Q==
X-Received: by 2002:a05:6808:1441:b0:3bc:d45:e5e8 with SMTP id
 x1-20020a056808144100b003bc0d45e5e8mr3989851oiv.22.1704735362004; 
 Mon, 08 Jan 2024 09:36:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ee17-20020a0562140a5100b00680ac921860sm145420qvb.45.2024.01.08.09.35.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:36:01 -0800 (PST)
Message-ID: <1bae7462-8985-426e-870f-e8955f841f4d@redhat.com>
Date: Mon, 8 Jan 2024 18:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/bios/init: drop kernel-doc notation
To: Randy Dunlap <rdunlap@infradead.org>
References: <20231216201152.31376-1-rdunlap@infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231216201152.31376-1-rdunlap@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/16/23 21:11, Randy Dunlap wrote:
> The "/**" comments in this file are not kernel-doc comments. They are
> used on static functions which can have kernel-doc comments, but that
> is not the primary focus of kernel-doc comments.
> Since these comments are incomplete for kernel-doc notation, remove
> the kernel-doc "/**" markers and make them common comments.
> 
> This prevents scripts/kernel-doc from issuing 68 warnings:
> 
> init.c:584: warning: Function parameter or member 'init' not described in 'init_reserved'
> 
> and 67 warnings like this one:
> init.c:611: warning: expecting prototype for INIT_DONE(). Prototype was for init_done() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |  136 +++++++-------
>   1 file changed, 68 insertions(+), 68 deletions(-)
> 
> diff -- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -575,7 +575,7 @@ init_tmds_reg(struct nvbios_init *init,
>    * init opcode handlers
>    *****************************************************************************/
>   
> -/**
> +/*
>    * init_reserved - stub for various unknown/unused single-byte opcodes
>    *
>    */
> @@ -602,7 +602,7 @@ init_reserved(struct nvbios_init *init)
>   	init->offset += length;
>   }
>   
> -/**
> +/*
>    * INIT_DONE - opcode 0x71
>    *
>    */
> @@ -613,7 +613,7 @@ init_done(struct nvbios_init *init)
>   	init->offset = 0x0000;
>   }
>   
> -/**
> +/*
>    * INIT_IO_RESTRICT_PROG - opcode 0x32
>    *
>    */
> @@ -650,7 +650,7 @@ init_io_restrict_prog(struct nvbios_init
>   	trace("}]\n");
>   }
>   
> -/**
> +/*
>    * INIT_REPEAT - opcode 0x33
>    *
>    */
> @@ -676,7 +676,7 @@ init_repeat(struct nvbios_init *init)
>   	init->repeat = repeat;
>   }
>   
> -/**
> +/*
>    * INIT_IO_RESTRICT_PLL - opcode 0x34
>    *
>    */
> @@ -716,7 +716,7 @@ init_io_restrict_pll(struct nvbios_init
>   	trace("}]\n");
>   }
>   
> -/**
> +/*
>    * INIT_END_REPEAT - opcode 0x36
>    *
>    */
> @@ -732,7 +732,7 @@ init_end_repeat(struct nvbios_init *init
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_COPY - opcode 0x37
>    *
>    */
> @@ -759,7 +759,7 @@ init_copy(struct nvbios_init *init)
>   	init_wrvgai(init, port, index, data);
>   }
>   
> -/**
> +/*
>    * INIT_NOT - opcode 0x38
>    *
>    */
> @@ -771,7 +771,7 @@ init_not(struct nvbios_init *init)
>   	init_exec_inv(init);
>   }
>   
> -/**
> +/*
>    * INIT_IO_FLAG_CONDITION - opcode 0x39
>    *
>    */
> @@ -788,7 +788,7 @@ init_io_flag_condition(struct nvbios_ini
>   		init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_GENERIC_CONDITION - opcode 0x3a
>    *
>    */
> @@ -840,7 +840,7 @@ init_generic_condition(struct nvbios_ini
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_IO_MASK_OR - opcode 0x3b
>    *
>    */
> @@ -859,7 +859,7 @@ init_io_mask_or(struct nvbios_init *init
>   	init_wrvgai(init, 0x03d4, index, data &= ~(1 << or));
>   }
>   
> -/**
> +/*
>    * INIT_IO_OR - opcode 0x3c
>    *
>    */
> @@ -878,7 +878,7 @@ init_io_or(struct nvbios_init *init)
>   	init_wrvgai(init, 0x03d4, index, data | (1 << or));
>   }
>   
> -/**
> +/*
>    * INIT_ANDN_REG - opcode 0x47
>    *
>    */
> @@ -895,7 +895,7 @@ init_andn_reg(struct nvbios_init *init)
>   	init_mask(init, reg, mask, 0);
>   }
>   
> -/**
> +/*
>    * INIT_OR_REG - opcode 0x48
>    *
>    */
> @@ -912,7 +912,7 @@ init_or_reg(struct nvbios_init *init)
>   	init_mask(init, reg, 0, mask);
>   }
>   
> -/**
> +/*
>    * INIT_INDEX_ADDRESS_LATCHED - opcode 0x49
>    *
>    */
> @@ -942,7 +942,7 @@ init_idx_addr_latched(struct nvbios_init
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_IO_RESTRICT_PLL2 - opcode 0x4a
>    *
>    */
> @@ -977,7 +977,7 @@ init_io_restrict_pll2(struct nvbios_init
>   	trace("}]\n");
>   }
>   
> -/**
> +/*
>    * INIT_PLL2 - opcode 0x4b
>    *
>    */
> @@ -994,7 +994,7 @@ init_pll2(struct nvbios_init *init)
>   	init_prog_pll(init, reg, freq);
>   }
>   
> -/**
> +/*
>    * INIT_I2C_BYTE - opcode 0x4c
>    *
>    */
> @@ -1025,7 +1025,7 @@ init_i2c_byte(struct nvbios_init *init)
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_ZM_I2C_BYTE - opcode 0x4d
>    *
>    */
> @@ -1051,7 +1051,7 @@ init_zm_i2c_byte(struct nvbios_init *ini
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_ZM_I2C - opcode 0x4e
>    *
>    */
> @@ -1085,7 +1085,7 @@ init_zm_i2c(struct nvbios_init *init)
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_TMDS - opcode 0x4f
>    *
>    */
> @@ -1111,7 +1111,7 @@ init_tmds(struct nvbios_init *init)
>   	init_wr32(init, reg + 0, addr);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_TMDS_GROUP - opcode 0x50
>    *
>    */
> @@ -1138,7 +1138,7 @@ init_zm_tmds_group(struct nvbios_init *i
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_CR_INDEX_ADDRESS_LATCHED - opcode 0x51
>    *
>    */
> @@ -1168,7 +1168,7 @@ init_cr_idx_adr_latch(struct nvbios_init
>   	init_wrvgai(init, 0x03d4, addr0, save0);
>   }
>   
> -/**
> +/*
>    * INIT_CR - opcode 0x52
>    *
>    */
> @@ -1188,7 +1188,7 @@ init_cr(struct nvbios_init *init)
>   	init_wrvgai(init, 0x03d4, addr, val | data);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_CR - opcode 0x53
>    *
>    */
> @@ -1205,7 +1205,7 @@ init_zm_cr(struct nvbios_init *init)
>   	init_wrvgai(init, 0x03d4, addr, data);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_CR_GROUP - opcode 0x54
>    *
>    */
> @@ -1229,7 +1229,7 @@ init_zm_cr_group(struct nvbios_init *ini
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_CONDITION_TIME - opcode 0x56
>    *
>    */
> @@ -1256,7 +1256,7 @@ init_condition_time(struct nvbios_init *
>   	init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_LTIME - opcode 0x57
>    *
>    */
> @@ -1273,7 +1273,7 @@ init_ltime(struct nvbios_init *init)
>   		mdelay(msec);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_REG_SEQUENCE - opcode 0x58
>    *
>    */
> @@ -1298,7 +1298,7 @@ init_zm_reg_sequence(struct nvbios_init
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_PLL_INDIRECT - opcode 0x59
>    *
>    */
> @@ -1317,7 +1317,7 @@ init_pll_indirect(struct nvbios_init *in
>   	init_prog_pll(init, reg, freq);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_REG_INDIRECT - opcode 0x5a
>    *
>    */
> @@ -1336,7 +1336,7 @@ init_zm_reg_indirect(struct nvbios_init
>   	init_wr32(init, addr, data);
>   }
>   
> -/**
> +/*
>    * INIT_SUB_DIRECT - opcode 0x5b
>    *
>    */
> @@ -1362,7 +1362,7 @@ init_sub_direct(struct nvbios_init *init
>   	init->offset += 3;
>   }
>   
> -/**
> +/*
>    * INIT_JUMP - opcode 0x5c
>    *
>    */
> @@ -1380,7 +1380,7 @@ init_jump(struct nvbios_init *init)
>   		init->offset += 3;
>   }
>   
> -/**
> +/*
>    * INIT_I2C_IF - opcode 0x5e
>    *
>    */
> @@ -1407,7 +1407,7 @@ init_i2c_if(struct nvbios_init *init)
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_COPY_NV_REG - opcode 0x5f
>    *
>    */
> @@ -1433,7 +1433,7 @@ init_copy_nv_reg(struct nvbios_init *ini
>   	init_mask(init, dreg, ~dmask, (data & smask) ^ sxor);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_INDEX_IO - opcode 0x62
>    *
>    */
> @@ -1451,7 +1451,7 @@ init_zm_index_io(struct nvbios_init *ini
>   	init_wrvgai(init, port, index, data);
>   }
>   
> -/**
> +/*
>    * INIT_COMPUTE_MEM - opcode 0x63
>    *
>    */
> @@ -1469,7 +1469,7 @@ init_compute_mem(struct nvbios_init *ini
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_RESET - opcode 0x65
>    *
>    */
> @@ -1496,7 +1496,7 @@ init_reset(struct nvbios_init *init)
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_CONFIGURE_MEM - opcode 0x66
>    *
>    */
> @@ -1555,7 +1555,7 @@ init_configure_mem(struct nvbios_init *i
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_CONFIGURE_CLK - opcode 0x67
>    *
>    */
> @@ -1589,7 +1589,7 @@ init_configure_clk(struct nvbios_init *i
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_CONFIGURE_PREINIT - opcode 0x68
>    *
>    */
> @@ -1615,7 +1615,7 @@ init_configure_preinit(struct nvbios_ini
>   	init_exec_force(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_IO - opcode 0x69
>    *
>    */
> @@ -1655,7 +1655,7 @@ init_io(struct nvbios_init *init)
>   	init_wrport(init, port, data | value);
>   }
>   
> -/**
> +/*
>    * INIT_SUB - opcode 0x6b
>    *
>    */
> @@ -1682,7 +1682,7 @@ init_sub(struct nvbios_init *init)
>   	init->offset += 2;
>   }
>   
> -/**
> +/*
>    * INIT_RAM_CONDITION - opcode 0x6d
>    *
>    */
> @@ -1701,7 +1701,7 @@ init_ram_condition(struct nvbios_init *i
>   		init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_NV_REG - opcode 0x6e
>    *
>    */
> @@ -1719,7 +1719,7 @@ init_nv_reg(struct nvbios_init *init)
>   	init_mask(init, reg, ~mask, data);
>   }
>   
> -/**
> +/*
>    * INIT_MACRO - opcode 0x6f
>    *
>    */
> @@ -1743,7 +1743,7 @@ init_macro(struct nvbios_init *init)
>   	init->offset += 2;
>   }
>   
> -/**
> +/*
>    * INIT_RESUME - opcode 0x72
>    *
>    */
> @@ -1755,7 +1755,7 @@ init_resume(struct nvbios_init *init)
>   	init_exec_set(init, true);
>   }
>   
> -/**
> +/*
>    * INIT_STRAP_CONDITION - opcode 0x73
>    *
>    */
> @@ -1773,7 +1773,7 @@ init_strap_condition(struct nvbios_init
>   		init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_TIME - opcode 0x74
>    *
>    */
> @@ -1794,7 +1794,7 @@ init_time(struct nvbios_init *init)
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_CONDITION - opcode 0x75
>    *
>    */
> @@ -1811,7 +1811,7 @@ init_condition(struct nvbios_init *init)
>   		init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_IO_CONDITION - opcode 0x76
>    *
>    */
> @@ -1828,7 +1828,7 @@ init_io_condition(struct nvbios_init *in
>   		init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_REG16 - opcode 0x77
>    *
>    */
> @@ -1845,7 +1845,7 @@ init_zm_reg16(struct nvbios_init *init)
>   	init_wr32(init, addr, data);
>   }
>   
> -/**
> +/*
>    * INIT_INDEX_IO - opcode 0x78
>    *
>    */
> @@ -1867,7 +1867,7 @@ init_index_io(struct nvbios_init *init)
>   	init_wrvgai(init, port, index, data | value);
>   }
>   
> -/**
> +/*
>    * INIT_PLL - opcode 0x79
>    *
>    */
> @@ -1884,7 +1884,7 @@ init_pll(struct nvbios_init *init)
>   	init_prog_pll(init, reg, freq);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_REG - opcode 0x7a
>    *
>    */
> @@ -1904,7 +1904,7 @@ init_zm_reg(struct nvbios_init *init)
>   	init_wr32(init, addr, data);
>   }
>   
> -/**
> +/*
>    * INIT_RAM_RESTRICT_PLL - opcde 0x87
>    *
>    */
> @@ -1934,7 +1934,7 @@ init_ram_restrict_pll(struct nvbios_init
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_RESET_BEGUN - opcode 0x8c
>    *
>    */
> @@ -1945,7 +1945,7 @@ init_reset_begun(struct nvbios_init *ini
>   	init->offset += 1;
>   }
>   
> -/**
> +/*
>    * INIT_RESET_END - opcode 0x8d
>    *
>    */
> @@ -1956,7 +1956,7 @@ init_reset_end(struct nvbios_init *init)
>   	init->offset += 1;
>   }
>   
> -/**
> +/*
>    * INIT_GPIO - opcode 0x8e
>    *
>    */
> @@ -1972,7 +1972,7 @@ init_gpio(struct nvbios_init *init)
>   		nvkm_gpio_reset(gpio, DCB_GPIO_UNUSED);
>   }
>   
> -/**
> +/*
>    * INIT_RAM_RESTRICT_ZM_GROUP - opcode 0x8f
>    *
>    */
> @@ -2010,7 +2010,7 @@ init_ram_restrict_zm_reg_group(struct nv
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_COPY_ZM_REG - opcode 0x90
>    *
>    */
> @@ -2027,7 +2027,7 @@ init_copy_zm_reg(struct nvbios_init *ini
>   	init_wr32(init, dreg, init_rd32(init, sreg));
>   }
>   
> -/**
> +/*
>    * INIT_ZM_REG_GROUP - opcode 0x91
>    *
>    */
> @@ -2049,7 +2049,7 @@ init_zm_reg_group(struct nvbios_init *in
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_XLAT - opcode 0x96
>    *
>    */
> @@ -2077,7 +2077,7 @@ init_xlat(struct nvbios_init *init)
>   	init_mask(init, daddr, ~dmask, data);
>   }
>   
> -/**
> +/*
>    * INIT_ZM_MASK_ADD - opcode 0x97
>    *
>    */
> @@ -2098,7 +2098,7 @@ init_zm_mask_add(struct nvbios_init *ini
>   	init_wr32(init, addr, data);
>   }
>   
> -/**
> +/*
>    * INIT_AUXCH - opcode 0x98
>    *
>    */
> @@ -2122,7 +2122,7 @@ init_auxch(struct nvbios_init *init)
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_AUXCH - opcode 0x99
>    *
>    */
> @@ -2144,7 +2144,7 @@ init_zm_auxch(struct nvbios_init *init)
>   	}
>   }
>   
> -/**
> +/*
>    * INIT_I2C_LONG_IF - opcode 0x9a
>    *
>    */
> @@ -2183,7 +2183,7 @@ init_i2c_long_if(struct nvbios_init *ini
>   	init_exec_set(init, false);
>   }
>   
> -/**
> +/*
>    * INIT_GPIO_NE - opcode 0xa9
>    *
>    */
> 

