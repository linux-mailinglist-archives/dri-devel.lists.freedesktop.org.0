Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6151DC9ACFF
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EEF10E599;
	Tue,  2 Dec 2025 09:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DRc+MBhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4212610E552;
 Tue,  2 Dec 2025 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764666856;
 bh=9HeGkb1CV5dVb10i7VYeFGTZqYWWEywQIZiFwfcvnNI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DRc+MBhOIKNro4cltO7qBBLqA4sWlayyyVJdH3ujaUMPaEzQGv+x0i/L5gLhI9IqY
 8vpONH64B12nWznZZv9Uh2FIAGbVMtfSjOuwUk0kj/76lZ2TyprxNOH06j4GdnBgn5
 cJgr4tr7QLCGHEGVtJ/s4kiTazDUZDvalI1BjhDGEa1qLlo0mRK2Q0LTR431GSwkoJ
 fJuO2nhqBejHtKD9jBMKPRE3G76pB+Ajw8RrKpBZCF1J7HGtNaQnOeMIIEBu/xY9QW
 II6EFVNfbvROuRZVtB8ojL17ICD1vj8UA6mciLUOzqLvaJS1SA7pNTwldJaExoQK6u
 fSAfN+RZNfa3Q==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B826A17E1149;
 Tue,  2 Dec 2025 10:14:15 +0100 (CET)
Message-ID: <e11acf7a-452a-4ef1-91e1-48be1f0571d9@collabora.com>
Date: Tue, 2 Dec 2025 10:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/10] drm/panthor: Introduce huge tmpfs mountpoint
 option
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-9-loic.molinari@collabora.com>
 <20251201094555.595744ab@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20251201094555.595744ab@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Boris,

On 01/12/2025 09:45, Boris Brezillon wrote:
> On Fri, 28 Nov 2025 19:52:50 +0100
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> Introduce the 'panthor.transparent_hugepage' boolean module parameter
>> (false by default). When the parameter is set to true, a new tmpfs
>> mountpoint is created and mounted using the 'huge=within_size'
>> option. It's then used at GEM object creation instead of the default
>> 'shm_mnt' mountpoint in order to enable Transparent Hugepage (THP) for
>> the object (without having to rely on a system wide parameter).
>>
>> v3:
>> - use huge tmpfs mountpoint in drm_device
>>
>> v4:
>> - fix builds with CONFIG_TRANSPARENT_HUGEPAGE=n
>> - clean up mountpoint creation error handling
>> - print negative error value
>>
>> v5:
>> - use drm_gem_has_huge_tmp() helper
>> - get rid of CONFIG_TRANSPARENT_HUGEPAGE ifdefs
>>
>> v9:
>> - replace drm_gem_has_huge_tmp() by drm_gem_get_huge_tmp()
>>
>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.c |  3 +++
>>   drivers/gpu/drm/panthor/panthor_drv.c    |  7 +++++++
>>   drivers/gpu/drm/panthor/panthor_drv.h    |  9 +++++++++
>>   drivers/gpu/drm/panthor/panthor_gem.c    | 18 ++++++++++++++++++
>>   drivers/gpu/drm/panthor/panthor_gem.h    |  2 ++
>>   5 files changed, 39 insertions(+)
>>   create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index e133b1e0ad6d..2979ee0e52c2 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -18,6 +18,7 @@
>>   #include "panthor_devfreq.h"
>>   #include "panthor_device.h"
>>   #include "panthor_fw.h"
>> +#include "panthor_gem.h"
>>   #include "panthor_gpu.h"
>>   #include "panthor_hw.h"
>>   #include "panthor_mmu.h"
>> @@ -294,6 +295,8 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   	if (ret)
>>   		goto err_unplug_fw;
>>   
>> +	panthor_gem_init(ptdev);
>> +
>>   	/* ~3 frames */
>>   	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>>   	pm_runtime_use_autosuspend(ptdev->base.dev);
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index d1d4c50da5bf..55dbda6dbf9c 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1559,6 +1559,7 @@ static const struct file_operations panthor_drm_driver_fops = {
>>   	.read = drm_read,
>>   	.llseek = noop_llseek,
>>   	.mmap = panthor_mmap,
>> +	.get_unmapped_area = drm_gem_get_unmapped_area,
>>   	.show_fdinfo = drm_show_fdinfo,
>>   	.fop_flags = FOP_UNSIGNED_OFFSET,
>>   };
>> @@ -1626,6 +1627,12 @@ static const struct drm_driver panthor_drm_driver = {
>>   #endif
>>   };
>>   
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +bool panthor_transparent_hugepage;
>> +module_param_named(transparent_hugepage, panthor_transparent_hugepage, bool, 0400);
>> +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (false = default)");
> 
> On a second thought, I wonder if this shouldn't be an opt-out param
> (which is what V3D does, BTW). What's the downside of enabling THP if we
> have a fallback for cases where memory is too fragmented to get huge
> pages at allocation time?

The only issue I can think of is maybe the fragmentation implied by the 
alignment requirement. But I don't think it's too much of an issue 
because, as you said, it will just fallback to allocating small pages in 
between, and V3D, which has use cases with low memory requirements too, 
makes it an opt-out too.

I'll do that for both Panfrost and Panthor.

Regards,
Loïc

>> +#endif
>> +
>>   static int panthor_probe(struct platform_device *pdev)
>>   {
>>   	struct panthor_device *ptdev;
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.h b/drivers/gpu/drm/panthor/panthor_drv.h
>> new file mode 100644
>> index 000000000000..79dccd289881
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.h
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
>> +
>> +#ifndef __PANTHOR_DRV_H__
>> +#define __PANTHOR_DRV_H__
>> +
>> +extern bool panthor_transparent_hugepage;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>> index 10d255cccc09..7ae07a9bc996 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0 or MIT
>>   /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>   /* Copyright 2023 Collabora ltd. */
>> +/* Copyright 2025 Amazon.com, Inc. or its affiliates */
>>   
>>   #include <linux/cleanup.h>
>>   #include <linux/dma-buf.h>
>> @@ -12,10 +13,27 @@
>>   #include <drm/panthor_drm.h>
>>   
>>   #include "panthor_device.h"
>> +#include "panthor_drv.h"
>>   #include "panthor_fw.h"
>>   #include "panthor_gem.h"
>>   #include "panthor_mmu.h"
>>   
>> +void panthor_gem_init(struct panthor_device *ptdev)
>> +{
>> +	int err;
>> +
>> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>> +	    !panthor_transparent_hugepage)
>> +		return;
>> +
>> +	err = drm_gem_huge_mnt_create(&ptdev->base, "within_size");
>> +	if (drm_gem_get_huge_mnt(&ptdev->base))
>> +		drm_info(&ptdev->base, "Using Transparent Hugepage\n");
>> +	else if (err)
>> +		drm_warn(&ptdev->base, "Can't use Transparent Hugepage (%d)\n",
>> +			 err);
>> +}
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
>>   {
>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
>> index 80c6e24112d0..2eefe9104e5e 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gem.h
>> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
>> @@ -136,6 +136,8 @@ struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
>>   	return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem_object, base);
>>   }
>>   
>> +void panthor_gem_init(struct panthor_device *ptdev);
>> +
>>   struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
>>   
>>   int
> 

