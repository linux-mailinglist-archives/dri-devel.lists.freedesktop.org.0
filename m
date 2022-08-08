Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2758C7A2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C16698C04;
	Mon,  8 Aug 2022 11:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71E5F97522
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 11:28:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8161DED1;
 Mon,  8 Aug 2022 04:28:36 -0700 (PDT)
Received: from [10.57.42.25] (unknown [10.57.42.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38A93F67D;
 Mon,  8 Aug 2022 04:28:34 -0700 (PDT)
Message-ID: <362beab8-5908-9ef3-a1ea-aa32b10900da@arm.com>
Date: Mon, 8 Aug 2022 12:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/2] drm/panfrost: Add specific register offset macros
 for JS and MMU AS
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 robh@kernel.org, tomeu.vizoso@collabora.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220729144610.2105223-1-adrian.larumbe@collabora.com>
 <20220729144610.2105223-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220729144610.2105223-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 29/07/2022 15:46, Adrián Larumbe wrote:
> Each Panfrost job has its own job slot and MMU address space set of
> registers, which are selected with a job-specific index.
> 
> Turn the shift and stride used for selection of the right register set base
> into a define rather than using magic numbers.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

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

