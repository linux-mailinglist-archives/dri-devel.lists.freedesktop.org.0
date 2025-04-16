Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEAA8B528
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E1010E8A6;
	Wed, 16 Apr 2025 09:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68BFD10E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:22:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD21152B;
 Wed, 16 Apr 2025 02:22:47 -0700 (PDT)
Received: from [10.57.90.52] (unknown [10.57.90.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9682A3F66E;
 Wed, 16 Apr 2025 02:22:45 -0700 (PDT)
Message-ID: <43260764-4940-4faa-ac07-7138f306a062@arm.com>
Date: Wed, 16 Apr 2025 10:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/panthor: Add driver IOCTL for setting BO labels
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com>
 <20250411150357.3308921-3-adrian.larumbe@collabora.com>
 <6d67aff0-7082-4966-acb2-d7985820b3ea@arm.com>
 <oc7nqx5gxrefaphpoyn7tsyhj2zcpbhwuxnhlgxtp6exet2ebz@wve2rz376pf4>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <oc7nqx5gxrefaphpoyn7tsyhj2zcpbhwuxnhlgxtp6exet2ebz@wve2rz376pf4>
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

On 14/04/2025 21:41, Adrián Larumbe wrote:
> On 14.04.2025 11:01, Steven Price wrote:
>> On 11/04/2025 16:03, Adrián Larumbe wrote:
>>> Allow UM to label a BO for which it possesses a DRM handle.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Although very minor NITs below which you can consider.
>>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_drv.c | 42 ++++++++++++++++++++++++++-
>>>  drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
>>>  include/uapi/drm/panthor_drm.h        | 23 +++++++++++++++
>>>  3 files changed, 66 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 06fe46e32073..983b24f1236c 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -1331,6 +1331,44 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>>>  	return 0;
>>>  }
>>>
>>> +static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
>>> +				  struct drm_file *file)
>>> +{
>>> +	struct drm_panthor_bo_set_label *args = data;
>>> +	struct drm_gem_object *obj;
>>> +	const char *label;
>>> +	int ret = 0;
>>> +
>>> +	obj = drm_gem_object_lookup(file, args->handle);
>>> +	if (!obj)
>>> +		return -ENOENT;
>>> +
>>> +	if (args->size && args->label) {
>>> +		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
>>> +			ret = -E2BIG;
>>> +			goto err_label;
>>> +		}
>>> +
>>> +		label = strndup_user(u64_to_user_ptr(args->label), args->size);
>>> +		if (IS_ERR(label)) {
>>> +			ret = PTR_ERR(label);
>>> +			goto err_label;
>>> +		}
>>> +	} else if (args->size && !args->label) {
>>> +		ret = -EINVAL;
>>> +		goto err_label;
>>> +	} else {
>>> +		label = NULL;
>>> +	}
>>> +
>>> +	panthor_gem_bo_set_label(obj, label);
>>> +
>>> +err_label:
>>> +	drm_gem_object_put(obj);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  static int
>>>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>>>  {
>>> @@ -1400,6 +1438,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>>>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>>>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>>>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>>> +	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
>>>  };
>>>
>>>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>>> @@ -1509,6 +1548,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>>>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>>>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>>>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>>> + * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
>>>   */
>>>  static const struct drm_driver panthor_drm_driver = {
>>>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
>>> @@ -1522,7 +1562,7 @@ static const struct drm_driver panthor_drm_driver = {
>>>  	.name = "panthor",
>>>  	.desc = "Panthor DRM driver",
>>>  	.major = 1,
>>> -	.minor = 3,
>>> +	.minor = 4,
>>>
>>>  	.gem_create_object = panthor_gem_create_object,
>>>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
>>> index af0d77338860..beba066b4974 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
>>> @@ -13,6 +13,8 @@
>>>
>>>  struct panthor_vm;
>>>
>>> +#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
>>> +
>>>  /**
>>>   * struct panthor_gem_object - Driver specific GEM object.
>>>   */
>>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>>> index 97e2c4510e69..12b1994499a9 100644
>>> --- a/include/uapi/drm/panthor_drm.h
>>> +++ b/include/uapi/drm/panthor_drm.h
>>> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
>>>
>>>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>>>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
>>> +
>>> +	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
>>> +	DRM_PANTHOR_BO_SET_LABEL,
>>>  };
>>>
>>>  /**
>>> @@ -977,6 +980,24 @@ struct drm_panthor_tiler_heap_destroy {
>>>  	__u32 pad;
>>>  };
>>>
>>> +/**
>>> + * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
>>> + */
>>> +struct drm_panthor_bo_set_label {
>>> +	/** @handle: Handle of the buffer object to label. */
>>> +	__u32 handle;
>>> +
>>> +	/**
>>> +	 * @size: Length of the label, including the NULL terminator.
>>> +	 *
>>> +	 * Cannot be greater than the OS page size.
>>> +	 */
>>> +	__u32 size;
>>> +
>>> +	/** @label: User pointer to a NULL-terminated string */
>>> +	__u64 label;
>>> +};
>>
>> First very minor NIT:
>>  * NULL is a pointer, i.e. (void*)0
>>  * NUL is the ASCII code point '\0'.
>> So it's a NUL-terminated string.
> 
> Fixed
> 
>> Second NIT: We don't actually need 'size' - since the string is
>> NUL-terminated we can just strndup_user(__user_pointer__, PAGE_SIZE).
>> As things stand we validate that strlen(label) < size <= PAGE_SIZE -
>> which is a little odd (user space might as well just pass PAGE_SIZE
>> rather than calculate the actual length).
> 
> The snag I see in this approach is that the only way to make sure
> strlen(label) + 1 <= PAGE_SIZE would be doing something like
> 
> label = strndup_user(u64_to_user_ptr(args->label), args->size);
> if (strlen(label) + 1 <= PAGE_SIZE) {
>    kfree(label)
>    return -E2BIG;
> }

You can just do

  strndup_user(u64_to_user_ptr(args->label), PAGE_SIZE)

If you look at the kernel's implementation it handles an overly long
string by returning an error:

> 	length = strnlen_user(s, n);
> 
> 	if (!length)
> 		return ERR_PTR(-EFAULT);
> 
> 	if (length > n)
> 		return ERR_PTR(-EINVAL);
> 
> 	p = memdup_user(s, length);

So there's no need to call strlen() on the result.

> In the meantime, we've duplicated the string and traversed a whole page
> of bytes, all to be discarded at once.
> 
> In this case, I think it's alright to expect some cooperation from UM
> in supplying the actual size, although I'm really not an expert in
> designing elegant uAPIs, so if you think this looks very odd I'd be
> glad to replace it with.
> 
> Actually, as I was writing this, I realised that strndup_user() calls
> strnlen_user(), which is publicly available for other drivers, so
> I might check the length first, and if it falls within bounds, do
> the actual user stringdup.

Again, no need (and strnlen_user() has a comment basically saying "don't
call this"). strndup_user() has all the magic we need here.

As I say this is just a 'nit' - so no big deal. But I don't really see
the point of the size in the uAPI.

Take a look at dma_buf_set_name() for an example which sets the name on
a dma_buf (and doesn't take a size argument) - although that wasn't an
example of good uAPI design as the type in the ioctl was botched ;(

Thanks,
Steve

> I shall also mention the size bound on the uAPI for the 'label' pointer.
> 
>> Thanks,
>> Steve
>>
>> +
>>  /**
>>   * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
>>   * @__access: Access type. Must be R, W or RW.
>> @@ -1019,6 +1040,8 @@ enum {
>>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
>>  	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
>>  		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
>> +	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
>> +		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
>>  };
>>
>>  #if defined(__cplusplus)
> 
> 
> Adrian Larumbe

