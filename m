Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605CA9193D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 12:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D7910EA84;
	Thu, 17 Apr 2025 10:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C028D10EA84
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:24:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B710D1515;
 Thu, 17 Apr 2025 03:24:33 -0700 (PDT)
Received: from [10.1.37.32] (e122027.cambridge.arm.com [10.1.37.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED5453F694;
 Thu, 17 Apr 2025 03:24:34 -0700 (PDT)
Message-ID: <b25491fc-122c-4b6c-981a-703147d2f7d8@arm.com>
Date: Thu, 17 Apr 2025 11:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Fix missing explicit padding in
 drm_panthor_gpu_info
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250417100503.3478405-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2025 11:05, Boris Brezillon wrote:
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
> +	 *
> +	 * This originates from a missing padding that leaked in the initial driver submission
> +	 * and was only found when testing the driver in a 32-bit x86 environment, where
> +	 * u64 field alignment rules are relaxed compared to aarch32.
> +	 *
> +	 * This field can't be repurposed, because it's never been checked by the driver and
> +	 * userspace is not guaranteed to zero it out.

Why would user space be providing this structure? This is meant to be
provided from the kernel to user space, and (fingers-crossed) we've been
zeroing the padding even though not explicitly? (rather than leaking
some kernel data).

Other than the comment - yes this is a uAPI mistake we should fix.

I'm not sure how much we care about historic x86 uAPI but it also should
be possible to identify an old x86 client using the x86 padding because
the structure will be too short. But my preference would be to say "it's
always been broken on x86" and therefore there's no regression.

Thanks,
Steve

> +	 */
> +	__u32 garbage;
> +
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;
>  

