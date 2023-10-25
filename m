Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3348E7D7561
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 22:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5774010E704;
	Wed, 25 Oct 2023 20:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902610E660
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:50:43 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9CFB940621
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698241839;
 bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=MK6FPk7/VpMFWYDLlL1MsXvbDVH3nMv+f3+FoxF4tYu6GqGT4EQ43bnWY4Gg2GXab
 UTFFPJECl0JF1VpL3wrShChKl4Z02NpVRb3YSLRdGyYLTZjr4mU31xK7KDjqQbtrRQ
 HMkoDdjrS091E6AvzRNGPUsi7x5wVV13f3HQd90QvvQCDUa3X62bWN2ETKwH2U7cV0
 AweZEdST1dQ81P4RI7QFKWFXGxX4f4cK3vc2L/IqOQ93wiKqtCS85KqB9p+SFuGfik
 YFkH0a10UaRUxODXqMn/KtpLtU01jA7VDJjXCePVCGtHx1Z385tj7X+HYyb4rN+wq0
 zjlzpJWUtJMJg==
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7a95387b717so330915639f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 06:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698241838; x=1698846638;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1x37B91j9+69z88CpRerUtWigBjNUnfhOj4SQBIvW4=;
 b=wBuw0rN4vU7HabnB6+ZDWrU/HQvru9TlzS7qrVF5nT/SYRU+Z7olB1vbgcG2TA0kng
 A5MTqBj72SwLjwJDWsAo4DH3bAeU1Z11D6GzTOEOEiDvcg9qioVD7zrT4n8xMwkNG66F
 RI8g02cirapd71hndApHx7no4QO7XJ77oHWItt6huHcKUc/cqlzw8hMJxCi/gS3tswUG
 b+CLC7xY/aLaEoHQYXy6cu9/6z5VgZp3f7RNbvvwHatxdcjn8GeGCCg0ZgFTlt1S5hpK
 NNHG5dEGcoNK1c2717FJp9F+Ufj1Vj68mE8dQjLxGagd/G8GSEPWbrU3ohD5NYYmsE/X
 dg5A==
X-Gm-Message-State: AOJu0YxjBenP3NxRutB+glc8yD2dE4KwQ04z2PQdhdEAsimP3WE6GAma
 LhByeLL2McVR5xLIdG8giTj0lx8NgI9ObFBaaw4gBoDu62EbUk260fli5+ulfNTS5NwS6147Flk
 OZ9vPn8rjv6K1JsOOQUSxpWLXe9X4QXxWFtIEJYRSOR9Kx0g1y7gjoAsHReP2eA==
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id
 k19-20020a1f2413000000b00496b3b75d4cmr9124801vkk.16.1698241817365; 
 Wed, 25 Oct 2023 06:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9zDnpBEjkuG+zK5+I3md5OYseNj7+FyeAufjrHbMrkjT4o0+aAODqiZVHTJv2jiFeyLuyYUPzrjH27o2gXYU=
X-Received: by 2002:a1f:2413:0:b0:496:b3b7:5d4c with SMTP id
 k19-20020a1f2413000000b00496b3b75d4cmr9124773vkk.16.1698241817037; Wed, 25
 Oct 2023 06:50:17 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:50:16 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:50:16 -0700
Message-ID: <CAJM55Z_SS351YyudUkiS3YvBx7O9OM=MGL6PpgVZZjaYjLy3+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
To: Keith Zhao <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Oct 2023 20:19:56 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keith Zhao wrote:
> For each modifier, add the corresponding description
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..a580a848c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
>
>  /* add more to the end as needed */
>
> @@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_CLEAR(field) \
>  	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))
> +
> +#define DRM_FORMAT_MOD_VERISILICON_NORM_MODE_MASK				0x1F
> +
> +/*
> + * An x-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X8		0x02
> +
> +/*
> + * A y-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_8X8		0x03
> +
> +/*
> + * An 8x8 tile consists of four standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X8						0x04
> +
> +/*
> + * An 8x4 tile consists of two standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X4						0x07
> +
> +/*
> + * An x-major 8x4 super tile consists of 128 8x4 sub-tiles in total.
> + * Each 8x4 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X4		0x0B

These indents are all over the place. Please either align them with tabs or use
a single space like the AMD defines above.

> +
> +/*
> + * A y-major 4x8 super tile consists of 128 4x8 sub-tiles in total.
> + * Each 4x8 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_4X8    0x0C
> +
> +#define fourcc_mod_vs_norm_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL, \
> +				(tile))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.34.1
>
