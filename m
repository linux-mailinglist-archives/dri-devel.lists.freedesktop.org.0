Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C631793CCA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193A10E028;
	Wed,  6 Sep 2023 12:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C73C210E028
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 12:37:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475BD106F;
 Wed,  6 Sep 2023 05:38:32 -0700 (PDT)
Received: from [10.57.36.163] (unknown [10.57.36.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A69A3F67D;
 Wed,  6 Sep 2023 05:37:52 -0700 (PDT)
Message-ID: <6b24d964-97d7-5337-f200-aab6c7d22318@arm.com>
Date: Wed, 6 Sep 2023 14:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 12/15] drm/panthor: Add the driver frontend block
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-13-boris.brezillon@collabora.com>
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20230809165330.2451699-13-boris.brezillon@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/23 18:53, Boris Brezillon wrote:
> +static int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
> +				   struct drm_file *file)
> +{
> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_vm_create *args = data;
> +	u64 kernel_va_start = 0;
> +	int cookie, ret;
> +
> +	if (!drm_dev_enter(ddev, &cookie))
> +		return -ENODEV;
> +
> +	if (args->flags & ~PANTHOR_VM_CREATE_FLAGS) {
> +		ret = -EINVAL;
> +		goto out_dev_exit;
> +	}
> +
> +	if (drm_WARN_ON(ddev, !va_bits) || args->kernel_va_range > (1ull << (va_bits - 1))) {
> +		ret = -EINVAL;
> +		goto out_dev_exit;
> +	}
> +
> +	if (args->kernel_va_range)
> +		kernel_va_start = (1 << (va_bits - 1)) - args->kernel_va_range;

Bug here if user space provides kernel_va_range, which is the intention 
of the current Mesa proposal.

I think the desired calculation should be something like:
kernel_va_start = (1ull << va_bits) - args->kernel_va_range;

PS: There is currently also a bug in the accompanying Mesa changes which 
accidentally makes kernel_va_range always zero, thus bypassing this 
kernel bug.
The Mesa bug is due to va_bits always being zero because mmu_features 
field is not copied in panthor_dev_query_props().

> +	ret = panthor_vm_pool_create_vm(ptdev, pfile->vms,
> +					kernel_va_start, args->kernel_va_range);
> +	if (ret >= 0) {
> +		args->id = ret;
> +		ret = 0;
> +	}
> +
> +out_dev_exit:
> +	drm_dev_exit(cookie);
> +	return ret;
> +}

--
Regards,
Ketil Johnsen
