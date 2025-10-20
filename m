Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3F2BF00E8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AB110E32E;
	Mon, 20 Oct 2025 08:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6287410E338
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:57:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2188A1F91;
 Mon, 20 Oct 2025 01:57:23 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FF83F66E;
 Mon, 20 Oct 2025 01:57:28 -0700 (PDT)
Message-ID: <a5f919cf-cc2b-460e-b6fa-a4eba7b54aa3@arm.com>
Date: Mon, 20 Oct 2025 09:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] drm/panthor: Add arch-specific panthor_hw binding
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-3-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251014094337.1009601-3-karunika.choo@arm.com>
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

On 14/10/2025 10:43, Karunika Choo wrote:
> This patch adds the framework for binding to a specific panthor_hw
> structure based on the architecture major value parsed from the GPU_ID
> register. This is in preparation of enabling architecture-specific
> behaviours based on GPU_ID.
> 
> This framework allows a single panthor_hw structure to be shared across
> multiple architectures should there be minimal changes between them via
> the arch_min and arch_max field of the panthor_hw_entry structure,
> instead of duplicating the structure across multiple architectures.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Looks fine (although see my comment in the previous patch about
potentially squashing into this one).

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  4 ++
>  drivers/gpu/drm/panthor/panthor_hw.c     | 49 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index a764111359d2..1457c1255f1f 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -26,6 +26,7 @@ struct panthor_device;
>  struct panthor_gpu;
>  struct panthor_group_pool;
>  struct panthor_heap_pool;
> +struct panthor_hw;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> @@ -122,6 +123,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>  
> +	/** @hw: GPU-specific data. */
> +	struct panthor_hw *hw;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 326a9db0b5c2..b6e7401327c3 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -8,6 +8,28 @@
>  #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
>  	(((arch_major) << 24) | (prod_major))
>  
> +/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
> +struct panthor_hw_entry {
> +	/** @arch_min: Minimum supported architecture major value (inclusive) */
> +	u8 arch_min;
> +
> +	/** @arch_max: Maximum supported architecture major value (inclusive) */
> +	u8 arch_max;
> +
> +	/** @hwdev: Pointer to panthor_hw structure */
> +	struct panthor_hw *hwdev;
> +};
> +
> +static struct panthor_hw panthor_hw_arch_v10 = {};
> +
> +static struct panthor_hw_entry panthor_hw_match[] = {
> +	{
> +		.arch_min = 10,
> +		.arch_max = 13,
> +		.hwdev = &panthor_hw_arch_v10,
> +	},
> +};
> +
>  static char *get_gpu_model_name(struct panthor_device *ptdev)
>  {
>  	const u32 gpu_id = ptdev->gpu_info.gpu_id;
> @@ -116,6 +138,29 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  		 ptdev->gpu_info.tiler_present);
>  }
>  
> +static int panthor_hw_bind_device(struct panthor_device *ptdev)
> +{
> +	struct panthor_hw *hdev = NULL;
> +	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> +	int i = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
> +		struct panthor_hw_entry *entry = &panthor_hw_match[i];
> +
> +		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
> +			hdev = entry->hwdev;
> +			break;
> +		}
> +	}
> +
> +	if (!hdev)
> +		return -EOPNOTSUPP;
> +
> +	ptdev->hw = hdev;
> +
> +	return 0;
> +}
> +
>  static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
>  {
>  	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> @@ -133,6 +178,10 @@ int panthor_hw_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = panthor_hw_bind_device(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	panthor_hw_info_init(ptdev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 0af6acc6aa6a..39752de3e7ad 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -6,6 +6,12 @@
>  
>  struct panthor_device;
>  
> +/**
> + * struct panthor_hw - GPU specific register mapping and functions
> + */
> +struct panthor_hw {
> +};
> +
>  int panthor_hw_init(struct panthor_device *ptdev);
>  
>  #endif /* __PANTHOR_HW_H__ */

