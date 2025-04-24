Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E5A9B0EB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B8C10E81A;
	Thu, 24 Apr 2025 14:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WnGwcp8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3011E10E82D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 14:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745505091; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k6M7uRYKUL9+HQk6tK7Ge8kol+FxjX3Cji/L9GCIhVBxTssEWCT8cJSiCY3+OOwHEXnPkZZRzkf2RPbFLKreuERlVkhVSG0BTaVS9DK5+60uEI6yedqLQG52u4LazDArrJ6MPnrPSepQz/HCVS2upNec4Eb9R2Fj89q5+c+14ZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745505091;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ObPsW9NivxQkunqyvUGTyyYN9HWfpFhyrX55AbRyBFE=; 
 b=FPuhLbH8fTXKxScyeNdqtLrH/JRQ+XHSlhMUCe1keHlqbnD4fdY7CTe4arJmUldLUZJD3ALpptnjhmSpsCHPdHCP0RNRkqIG7ZFQotgPf4rxmLLsSpQom/iOohgSdyrLjmJYMsXDwMw/Vi7QaZ9BtDJY2eDK/7BnhZMAQsDsRPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745505091; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=ObPsW9NivxQkunqyvUGTyyYN9HWfpFhyrX55AbRyBFE=;
 b=WnGwcp8GibR6IwfrXMxXxIM//NzXSmrxry9PAViBb2A1FCN6Y+VOjQoy6p6eUvhW
 zhUrAWImeJr5miPIQESK4NfEMI49W/1zmYGUYS+HiAlz4ARBPaQTsEAftQNyFQFVao1
 yc1I673xxCRWx3m+vxCRUbWPjEN6Xm2xp3hmfQpM=
Received: by mx.zohomail.com with SMTPS id 1745505089396212.1544749388322;
 Thu, 24 Apr 2025 07:31:29 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:31:26 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
Message-ID: <72lpkvpox2p56yph5vdvn4zy6p7jz3xr7tez7volmu6ikxn22w@bjs6huwstcik>
References: <20250417144907.3679831-1-boris.brezillon@collabora.com>
 <20250417144907.3679831-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417144907.3679831-3-boris.brezillon@collabora.com>
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

On 17.04.2025 16:49, Boris Brezillon wrote:
> Currently, we pick the MMIO offset based on the size of the pgoff_t
> type seen by the process that manipulates the FD, such that a 32-bit
> process can always map the user MMIO ranges. But this approach doesn't
> work well for emulators like FEX, where the emulator is a 64-bit binary
> which might be executing 32-bit code. In that case, the kernel thinks
> it's the 64-bit process and assumes DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
> is in use, but the UMD library expects DRM_PANTHOR_USER_MMIO_OFFSET_32BIT,
> because it can't mmap() anything above the pgoff_t size.
>
> In order to solve that, we need a way to explicitly set the user MMIO
> offset from the UMD, such that the kernel doesn't have to guess it
> from the TIF_32BIT flag set on user thread. We keep the old behavior
> if DRM_PANTHOR_SET_USER_MMIO_OFFSET is never called.
>
> Changes:
> - Drop the lock/immutable fields and allow SET_USER_MMIO_OFFSET
>   requests to race with mmap() requests
> - Don't do the is_user_mmio_offset test twice in panthor_mmap()
> - Improve the uAPI docs
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 18 ++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c    | 56 +++++++++++++++++-------
>  include/uapi/drm/panthor_drm.h           | 38 ++++++++++++++++
>  3 files changed, 96 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 4c27b6d85f46..6d8c2d5042f2 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -219,6 +219,24 @@ struct panthor_file {
>  	/** @ptdev: Device attached to this file. */
>  	struct panthor_device *ptdev;
>
> +	/** @user_mmio: User MMIO related fields. */
> +	struct {
> +		/**
> +		 * @offset: Offset used for user MMIO mappings.
> +		 *
> +		 * This offset should not be used to check the type of mapping
> +		 * except in panthor_mmap(). After that point, MMIO mapping
> +		 * offsets have been adjusted to match
> +		 * DRM_PANTHOR_USER_MMIO_OFFSET and this macro should be used
> +		 * instead.
> +		 * Make sure this rule is followed at all times, because
> +		 * userspace is in control of the offset, and can change the
> +		 * value behind out back, potentially leading to erronous
> +		 * branching happening in kernel space.
> +		 */
> +		u64 offset;
> +	} user_mmio;
> +
>  	/** @vms: VM pool attached to this file. */
>  	struct panthor_vm_pool *vms;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 4d4a52a033f6..aedef2bfa7ac 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1338,6 +1338,20 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>  	return 0;
>  }
>
> +static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
> +					      void *data, struct drm_file *file)
> +{
> +	struct drm_panthor_set_user_mmio_offset *args = data;
> +	struct panthor_file *pfile = file->driver_priv;
> +
> +	if (args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_32BIT &&
> +	    args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_64BIT)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(pfile->user_mmio.offset, args->offset);
> +	return 0;
> +}
> +
>  static int
>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>  {
> @@ -1355,6 +1369,18 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	}
>
>  	pfile->ptdev = ptdev;
> +	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
> +
> +#ifdef CONFIG_ARM64
> +	/*
> +	 * With 32-bit systems being limited by the 32-bit representation of
> +	 * mmap2's pgoffset field, we need to make the MMIO offset arch
> +	 * specific.
> +	 */
> +	if (test_tsk_thread_flag(current, TIF_32BIT))
> +		pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
> +#endif
> +
>
>  	ret = panthor_vm_pool_create(pfile);
>  	if (ret)
> @@ -1407,6 +1433,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> +	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
>  };
>
>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> @@ -1415,30 +1442,26 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>  	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
> +	u64 user_mmio_offset;
>  	int ret, cookie;
>
>  	if (!drm_dev_enter(file->minor->dev, &cookie))
>  		return -ENODEV;
>
> -#ifdef CONFIG_ARM64
> -	/*
> -	 * With 32-bit systems being limited by the 32-bit representation of
> -	 * mmap2's pgoffset field, we need to make the MMIO offset arch
> -	 * specific. This converts a user MMIO offset into something the kernel
> -	 * driver understands.
> +	/* Adjust the user MMIO offset to match the offset used kernel side.
> +	 * We use a local variable with a READ_ONCE() here to make sure
> +	 * the user_mmio_offset we use for the is_user_mmio_mapping() check
> +	 * hasn't changed when we do the offset adjustment.
>  	 */
> -	if (test_tsk_thread_flag(current, TIF_32BIT) &&
> -	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
> -		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
> -			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
> +	user_mmio_offset = READ_ONCE(pfile->user_mmio.offset);
> +	if (offset >= user_mmio_offset) {
> +		offset -= user_mmio_offset;
> +		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
>  		vma->vm_pgoff = offset >> PAGE_SHIFT;
> -	}
> -#endif
> -
> -	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
>  		ret = panthor_device_mmap_io(ptdev, vma);
> -	else
> +	} else {
>  		ret = drm_gem_mmap(filp, vma);
> +	}
>
>  	drm_dev_exit(cookie);
>  	return ret;
> @@ -1516,6 +1539,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> + * - 1.4 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1529,7 +1553,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 3,
> +	.minor = 4,
>
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index dbb907eae443..1d1282f2c9fa 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -127,6 +127,20 @@ enum drm_panthor_ioctl_id {
>
>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> +
> +	/**
> +	 * @DRM_PANTHOR_SET_USER_MMIO_OFFSET: Set the offset to use as the user MMIO offset.
> +	 *
> +	 * The default behavior is to pick the MMIO offset based on the size of the pgoff_t
> +	 * type seen by the process that manipulates the FD, such that a 32-bit process can
> +	 * always map the user MMIO ranges. But this approach doesn't work well for emulators
> +	 * like FEX, where the emulator is an 64-bit binary which might be executing 32-bit
> +	 * code. In that case, the kernel thinks it's the 64-bit process and assumes
> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT is in use, but the UMD library expects
> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_32BIT, because it can't mmap() anything above the
> +	 * pgoff_t size.
> +	 */
> +	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
>  };
>
>  /**
> @@ -980,6 +994,28 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>
> +/**
> + * struct drm_panthor_set_user_mmio_offset - Arguments passed to
> + * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
> + *
> + * This ioctl is only really useful if you want to support userspace
> + * CPU emulation environments where the size of an unsigned long differs
> + * between the host and the guest architectures.
> + */
> +struct drm_panthor_set_user_mmio_offset {
> +	/**
> +	 * @offset: User MMIO offset to use.
> +	 *
> +	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT.
> +	 *
> +	 * Use DRM_PANTHOR_USER_MMIO_OFFSET (which selects OFFSET_32BIT or
> +	 * OFFSET_64BIT based on the size of an unsigned long) unless you
> +	 * have a very good reason to overrule this decision.
> +	 */
> +	__u64 offset;
> +};
> +
>  /**
>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>   * @__access: Access type. Must be R, W or RW.
> @@ -1022,6 +1058,8 @@ enum {
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
> +		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
>  };
>
>  #if defined(__cplusplus)
> --
> 2.49.0

Adrian Larumbe
