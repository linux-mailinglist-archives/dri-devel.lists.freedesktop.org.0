Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A193F585318
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 17:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EE8892B1;
	Fri, 29 Jul 2022 15:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162B10E50D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 15:50:43 +0000 (UTC)
Received: from maud (unknown [184.175.40.242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 04CB16601B7C;
 Fri, 29 Jul 2022 16:50:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659109841;
 bh=t1TO3aaoAlCaVTs603Sa9m2l6sBsFYALb1lHRNgN97U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gnruFdriSAe/UBzofPW2HVK7pW9JVVd7zNM1OxnpquZk2gbw2iRA5XO5ylW0P3VkY
 PZXgs0zd+hoCRoEnqJ7kDFyLgLD2zep+kFch/tICbr/rHjMgZ8mDjrnbLwDk0QIW88
 u+vLDAm0xwoJmr8voLD2FLYdlx2QUpAb7ZOpiicjkFwbnCClw38YSlm2HmDYqB/+UB
 wrjWB5hio8/cpN6ZHfVCe41qwsGyVAafXBQbkeN7Puemmc2jmC8U58EhXMkssE9i7D
 Pc+cEa6eSFzL1eM+83Okqwkdgxrk5u9KaXbo5dVRQ+yYIfbNkIkHyUhS0Plt2f5rqI
 MaUQ84oQJojCQ==
Date: Fri, 29 Jul 2022 11:50:35 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v6 1/2] drm/panfrost: Add specific register offset macros
 for JS and MMU AS
Message-ID: <YuQBy0qSOotfp7UG@maud>
References: <20220729144610.2105223-1-adrian.larumbe@collabora.com>
 <20220729144610.2105223-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729144610.2105223-2-adrian.larumbe@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tomeu.vizoso@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Fri, Jul 29, 2022 at 03:46:09PM +0100, Adri??n Larumbe wrote:
> Each Panfrost job has its own job slot and MMU address space set of
> registers, which are selected with a job-specific index.
> 
> Turn the shift and stride used for selection of the right register set base
> into a define rather than using magic numbers.
> 
> Signed-off-by: Adri??n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_regs.h | 42 ++++++++++++++----------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index accb4fa3adb8..919f44ac853d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -226,23 +226,25 @@
>  #define JOB_INT_MASK_DONE(j)		BIT(j)
>  
>  #define JS_BASE				0x1800
> -#define JS_HEAD_LO(n)			(JS_BASE + ((n) * 0x80) + 0x00)
> -#define JS_HEAD_HI(n)			(JS_BASE + ((n) * 0x80) + 0x04)
> -#define JS_TAIL_LO(n)			(JS_BASE + ((n) * 0x80) + 0x08)
> -#define JS_TAIL_HI(n)			(JS_BASE + ((n) * 0x80) + 0x0c)
> -#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * 0x80) + 0x10)
> -#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * 0x80) + 0x14)
> -#define JS_CONFIG(n)			(JS_BASE + ((n) * 0x80) + 0x18)
> -#define JS_XAFFINITY(n)			(JS_BASE + ((n) * 0x80) + 0x1c)
> -#define JS_COMMAND(n)			(JS_BASE + ((n) * 0x80) + 0x20)
> -#define JS_STATUS(n)			(JS_BASE + ((n) * 0x80) + 0x24)
> -#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x40)
> -#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x44)
> -#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x50)
> -#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x54)
> -#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x58)
> -#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x60)
> -#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x70)
> +#define JS_SLOT_STRIDE			0x80
> +
> +#define JS_HEAD_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
> +#define JS_HEAD_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x04)
> +#define JS_TAIL_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x08)
> +#define JS_TAIL_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x0c)
> +#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x10)
> +#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x14)
> +#define JS_CONFIG(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x18)
> +#define JS_XAFFINITY(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x1c)
> +#define JS_COMMAND(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x20)
> +#define JS_STATUS(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x24)
> +#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x40)
> +#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x44)
> +#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x50)
> +#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x54)
> +#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x58)
> +#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x60)
> +#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
>  
>  /* Possible values of JS_CONFIG and JS_CONFIG_NEXT registers */
>  #define JS_CONFIG_START_FLUSH_CLEAN		BIT(8)
> @@ -281,7 +283,9 @@
>  #define AS_COMMAND_FLUSH_MEM		0x05	/* Wait for memory accesses to complete, flush all the L1s cache then
>  						   flush all L2 caches then issue a flush region command to all MMUs */
>  
> -#define MMU_AS(as)			(0x2400 + ((as) << 6))
> +#define MMU_BASE			0x2400
> +#define MMU_AS_SHIFT			0x06
> +#define MMU_AS(as)			(MMU_BASE + ((as) << MMU_AS_SHIFT))
>  
>  #define AS_TRANSTAB_LO(as)		(MMU_AS(as) + 0x00) /* (RW) Translation Table Base Address for address space n, low word */
>  #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
> @@ -300,6 +304,8 @@
>  #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
>  #define AS_FAULTEXTRA_HI(as)		(MMU_AS(as) + 0x3C) /* (RO) Secondary fault address for address space n, high word */
>  
> +#define MMU_AS_STRIDE			(1 << MMU_AS_SHIFT)
> +
>  /*
>   * Begin LPAE MMU TRANSTAB register values
>   */
> -- 
> 2.37.0
> 
