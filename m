Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E463A91ABD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913810EABF;
	Thu, 17 Apr 2025 11:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A746B10EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:26:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45DD1515
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:26:03 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 144B63F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 04:26:05 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:26:02 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] drm/panthor: Fix missing explicit padding in
 drm_panthor_gpu_info
Message-ID: <aADlSq-PmZaLhaRr@e110455-lin.cambridge.arm.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417100503.3478405-2-boris.brezillon@collabora.com>
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

On Thu, Apr 17, 2025 at 12:05:02PM +0200, Boris Brezillon wrote:
> drm_panthor_gpu_info::shader_present is currently automatically offset
> by 4 byte to meet Arm's 32-bit/64-bit field alignment rules, but those
> constraints don't stand on 32-bit x86 and cause a mismatch when running
> an x86 binary in a user emulated environment like FEX. It's also
> generally agreed that uAPIs should explicitly pad their struct fields,
> which we originally intended to do, but a mistake slipped through during
> the submission process, leading drm_panthor_gpu_info::shader_present to
> be misaligned.
> 
> This uAPI change doesn't break any of the existing users of panthor
> which are either arm32 or arm64 where the 64-bit alignment of
> u64 fields is already enforced a the compiler level.
> 
> Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  include/uapi/drm/panthor_drm.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..1379a2d4548c 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -293,6 +293,18 @@ struct drm_panthor_gpu_info {
>  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
>  	__u32 as_present;
>  
> +	/**
> +	 * @garbage: Unused field that's not even zero-checked.

By whom? Kernel provides it and initializes it to zero, so I guess that's why it's not checked.

> +	 *
> +	 * This originates from a missing padding that leaked in the initial driver submission
> +	 * and was only found when testing the driver in a 32-bit x86 environment, where
> +	 * u64 field alignment rules are relaxed compared to aarch32.
> +	 *
> +	 * This field can't be repurposed, because it's never been checked by the driver and
> +	 * userspace is not guaranteed to zero it out.

The direction is the other way around, it's provided by kernel. I would loosen the restriction
on repurposing, maybe when 32bit x86 is no longer such a hot market we can reuse it for some
other chicken bits.

With the comment updated,

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> +	 */
> +	__u32 garbage;
> +
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;
>  
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
