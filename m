Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A0C15B89
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADBF10E5F8;
	Tue, 28 Oct 2025 16:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C970210E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:16:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3B621692
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:16:21 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 394203F63F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:16:29 -0700 (PDT)
Date: Tue, 28 Oct 2025 16:16:27 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] drm/panthor: Add arch-specific panthor_hw binding
Message-ID: <aQDsW3xf2NNUvBN-@e110455-lin.cambridge.arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
 <20251027161334.854650-2-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027161334.854650-2-karunika.choo@arm.com>
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

Hello,

On Mon, Oct 27, 2025 at 04:13:27PM +0000, Karunika Choo wrote:
> This patch adds the framework for binding to a specific panthor_hw
> structure based on the architecture major value parsed from the GPU_ID
> register. This is in preparation of enabling architecture-specific
> behaviours based on GPU_ID. As such, it also splits the GPU_ID register
> read operation into its own helper function.
> 
> This framework allows a single panthor_hw structure to be shared across
> multiple architectures should there be minimal changes between them via
> the arch_min and arch_max field of the panthor_hw_entry structure,
> instead of duplicating the structure across multiple architectures.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
> v2:
>  * merged GPU_ID refactoring patch with the arch-specific panthor_hw
>    binding patch (PATCH 01/10 and PATCH 02/10 in v1).
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  4 ++
>  drivers/gpu/drm/panthor/panthor_hw.c     | 65 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
>  3 files changed, 74 insertions(+), 1 deletion(-)
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
> index 4f2858114e5e..b6e7401327c3 100644
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

I'm not a big fan of this [min, max] range definition. I would expect that,
unless a new panthor_hw_entry is defined, the one covering arch X will also
cover arch X+1 automatically. With the current implementation we will have
to add a patch extending arch_max for an existing panthor_hw_entry when a new
GPU architecture is released that is compatible with the previous one at the
panthor_hw level *and backport the patch* for older kernels if they can
support that hardware.

My suggestion is to drop this structure entirely and change panthor_hw_bind_device()
to a cascade of if()s starting with the latest arch to have a struct panthor_hw
defined. For this patch the function will actually just set ptdev->hw to panthor_hw_arch_v10
without any ifs.

Also (this is my personal preference) I would merge patch 1/8 and 2/8 so that we
don't have just empty structures defined.

Best regards,
Liviu

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
> @@ -62,7 +84,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
> 
> -	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
>  	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
>  	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
>  	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
> @@ -117,8 +138,50 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
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
> +static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
> +{
> +	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> +	if (!ptdev->gpu_info.gpu_id)
> +		return -ENXIO;
> +
> +	return 0;
> +}
> +
>  int panthor_hw_init(struct panthor_device *ptdev)
>  {
> +	int ret = 0;
> +
> +	ret = panthor_hw_gpu_id_init(ptdev);
> +	if (ret)
> +		return ret;
> +
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
