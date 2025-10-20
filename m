Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108ABF1C1A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4084610E44F;
	Mon, 20 Oct 2025 14:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UKJ1t2Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB810E44E;
 Mon, 20 Oct 2025 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760969610;
 bh=TvYssAkPQLG2m2KKWp4oKulXBwqsnyHFiW1/8FMfTRw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UKJ1t2Mv9iTIFpZ0UNlXXnBI2ZEV3XsYaDmlhtXR5AiCvXUxut2ycdosfITanbF9U
 nf41fXqA/SaR/AWtSs3EA9CjkZgDlGjON7CpU1VvQLR7Ozsz1pATxR518yyagkWO/Z
 n1N07PDRUYXGF6L2x+ibF9GKaiiViLXCj92pj3VW8swdx7m5LCqzzPb0A7+zod4+Lt
 TxueDTAvsgJas1VH3ETOAcCMu7hWXCRTmPnZXuh1i9Zseu7zozKur0BjsvE3JrGxsw
 CiVm4zTx4i8yWmPsrDfAI7iQSyGJCrFJUGqi1WHjFIJa+09qdRm7EQ+uxnfRd4mgR7
 ZkX2C+sn/MnyQ==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 643FD17E02B0;
 Mon, 20 Oct 2025 16:13:29 +0200 (CEST)
Message-ID: <8ba7350a-83a7-4c83-8d91-83803d0c06e8@collabora.com>
Date: Mon, 20 Oct 2025 16:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] drm/gem: Add huge tmpfs mount point helper
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-6-loic.molinari@collabora.com>
 <7584abe7-0c3f-4022-b510-c2a57fd167bb@ursulin.net>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <7584abe7-0c3f-4022-b510-c2a57fd167bb@ursulin.net>
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

On 20/10/2025 11:10, Tvrtko Ursulin wrote:
> 
> On 15/10/2025 16:30, Loïc Molinari wrote:
>> Add the drm_gem_huge_mnt_create() helper to avoid code duplication in
>> the i915, V3D, Panfrost and Panthor drivers. It creates and mounts a
>> dedicated huge tmpfs mountpoint, for the lifetime of a DRM device,
>> used at GEM object initialization.
>>
>> The next commits will port drivers to this helper.
>>
>> v3:
>> - store huge tmpfs mountpoint in drm_device
>>
>> v4:
>> - return 0 in builds with CONFIG_TRANSPARENT_HUGEPAGE=n
>> - return 0 when huge_mnt already exists
>>
>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 58 +++++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_device.h  | 11 ++++++++
>>   include/drm/drm_gem.h     |  1 +
>>   3 files changed, 70 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index a98d5744cc6c..db8c0a217add 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/export.h>
>>   #include <linux/file.h>
>>   #include <linux/fs.h>
>> +#include <linux/fs_context.h>
>>   #include <linux/iosys-map.h>
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/mm.h>
>> @@ -82,6 +83,63 @@
>>    * up at a later date, and as our interface with shmfs for memory 
>> allocation.
>>    */
>> +static void drm_gem_huge_mnt_free(struct drm_device *dev, void *data)
>> +{
>> +    drm_WARN_ON(dev, dev->huge_mnt == NULL);
> 
> I don't see a benefit of adding this check but maybe I am missing 
> something.

That was mostly to detect and warn drivers setting the drm_device's 
huge_mnt pointer directly. I can remove that.

>> +
>> +    kern_unmount(dev->huge_mnt);
>> +    dev->huge_mnt = NULL;
> 
> Ditto - device is going away, no? So why bother clearing the pointer?

This one is necessary to let drivers tear down and reload. 
drm_gem_huge_mnt_create() returns if the pointer isn't NULL.

> Also, is the compiler smart enough to not compile or complain this 
> function is unused in the !CONFIG_TRANSPARENT_HUGEPAGE case?

No compiler warnings, but this might not be the case with different 
compilers/versions so I'll ifdef it out.

>> +}
>> +
>> +/**
>> + * drm_gem_huge_mnt_create - Create, mount and use a huge tmpfs 
>> mountpoint
>> + * @dev: drm_device a huge tmpfs mountpoint should be used with
>> + * @value: huge tmpfs mount option value
>> + *
>> + * This function creates and mounts a dedicated huge tmpfs mountpoint 
>> for the
>> + * lifetime of the drm device @dev which is used at GEM object 
>> initialization
>> + * with drm_gem_object_init().
>> + *
>> + * The most common option value @value is "within_size" which only 
>> allocates
>> + * huge pages if the page will be fully within the GEM object size. 
>> "always",
>> + * "advise" and "never" are supported too but the latter would just 
>> create a
>> + * mountpoint similar to the default one (`shm_mnt`). See shmemfs and
>> + * Transparent Hugepage for more information.
>> + *
>> + * Returns:
>> + * 0 on success or a negative error code on failure.
>> + */
>> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value)
>> +{
>> +    struct file_system_type *type;
>> +    struct fs_context *fc;
>> +    int ret;
>> +
>> +    if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
>> +        return 0;
> 
> Is there a specific reason why the !CONFIG_TRANSPARENT_HUGEPAGE path is 
> not implemented in the header as a static inline? That would enable 
> those builds to avoid the pointless function in text and function call 
> in the drivers.

Good point. I'll propose a new version with drm_gem_huge_mnt_create() 
implemented as a static inline function that calls into 
__drm_gem_huge_mnt_create() only for builds with 
CONFIG_TRANSPARENT_HUGEPAGE=y.

>  
>> +    if (unlikely(dev->huge_mnt))
>> +        return 0;
> 
> Any special reason why it is allowed to call it multiple times with 
> success?

That was initially returning -EEXIST in v3 but got changed after review 
to simplify call sites.

> 
>> +
>> +    type = get_fs_type("tmpfs");
>> +    if (unlikely(!type))
>> +        return -EOPNOTSUPP;
>> +    fc = fs_context_for_mount(type, SB_KERNMOUNT);
>> +    if (IS_ERR(fc))
>> +        return PTR_ERR(fc);
>> +    ret = vfs_parse_fs_string(fc, "source", "tmpfs");
>> +    if (unlikely(ret))
>> +        return -ENOPARAM;
>> +    ret = vfs_parse_fs_string(fc, "huge", value);
>> +    if (unlikely(ret))
>> +        return -ENOPARAM;
>> +
>> +    dev->huge_mnt = fc_mount_longterm(fc);
>> +    put_fs_context(fc);
>> +
>> +    return drmm_add_action_or_reset(dev, drm_gem_huge_mnt_free, NULL);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_huge_mnt_create);
>> +
>>   static void
>>   drm_gem_init_release(struct drm_device *dev, void *ptr)
>>   {
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index 778b2cca6c49..352e3db402d7 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -3,6 +3,7 @@
>>   #include <linux/list.h>
>>   #include <linux/kref.h>
>> +#include <linux/mount.h>
>>   #include <linux/mutex.h>
>>   #include <linux/idr.h>
>>   #include <linux/sched.h>
>> @@ -168,6 +169,16 @@ struct drm_device {
>>        */
>>       struct drm_master *master;
>> +    /**
>> +     * @huge_mnt:
>> +     *
>> +     * Huge tmpfs mountpoint used at GEM object initialization
>> +     * drm_gem_object_init(). Drivers can call 
>> drm_gem_huge_mnt_create() to
>> +     * create a huge tmfps mountpoint. The default tmpfs mountpoint
>> +     * (`shm_mnt`) is used if NULL.
>> +     */
>> +    struct vfsmount *huge_mnt;
> 
> Maybe it would be nice to hide this in the !CONFIG_TRANSPARENT_HUGEPAGE 
> case? A bit ugly to add an ifdef but it is also a bit questionable to 
> force the member on everyone.

It was initially stored in drivers' data structures but, as mentioned 
above for v3, got put in drm_device to simplify call sites.

Both V3D and i915 are testing for that pointer in a few places and that 
would require adding ifdefs there too. This would also be the same for 
any drivers adding support for huge pages. Is that really worth it?

> 
> Regards,
> 
> Tvrtko
> 
>> +
>>       /**
>>        * @driver_features: per-device driver features
>>        *
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index 7c8bd67d087c..7285a62d9afc 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -492,6 +492,7 @@ struct drm_gem_object {
>>           DRM_GEM_FOPS,\
>>       }
>> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value);
>>   void drm_gem_object_release(struct drm_gem_object *obj);
>>   void drm_gem_object_free(struct kref *kref);
>>   int drm_gem_object_init(struct drm_device *dev,
> 

