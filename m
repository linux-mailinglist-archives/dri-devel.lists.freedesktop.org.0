Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45285A920D4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9250310E0A4;
	Thu, 17 Apr 2025 15:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B85EB10E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:07:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0CE01515;
 Thu, 17 Apr 2025 08:07:08 -0700 (PDT)
Received: from [10.1.37.32] (e122027.cambridge.arm.com [10.1.37.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF5E3F59E;
 Thu, 17 Apr 2025 08:07:09 -0700 (PDT)
Message-ID: <0f642a16-6f42-4392-8450-6a473213b50e@arm.com>
Date: Thu, 17 Apr 2025 16:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/panthor: Add missing explicit padding in
 drm_panthor_gpu_info
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250417144907.3679831-1-boris.brezillon@collabora.com>
 <20250417144907.3679831-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250417144907.3679831-2-boris.brezillon@collabora.com>
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

On 17/04/2025 15:49, Boris Brezillon wrote:
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
> Changes in v2:
> - Rename the garbage field into pad0 and adjust the comment accordingly
> - Add Liviu's R-b
> 
> Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  include/uapi/drm/panthor_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..dbb907eae443 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -293,6 +293,9 @@ struct drm_panthor_gpu_info {
>  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
>  	__u32 as_present;
>  
> +	/** @pad0: MBZ. */
> +	__u32 pad0;
> +
>  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
>  	__u64 shader_present;
>  

