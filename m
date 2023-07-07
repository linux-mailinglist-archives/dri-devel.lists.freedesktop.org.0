Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C974B102
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC2610E576;
	Fri,  7 Jul 2023 12:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649210E579
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688733155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nn3h1EpL0DqV/dmxdwYAjo6rDt1igIdvshyB/2r4DI8=;
 b=iyRPSCj9k+TFdbeDuRsMVZSvlOZY9tZ3ZqzWTC5szkuwFPBK1CrPWSH1Lofr+815RK5xU+
 3J7liBnH0EvqTmJqrmq8U/bu1bUkA56f8AUjnb1KBIG1ow7vAu/5ttMwGRYGmAIvAuNe70
 zl4tEY/SwpzWN5GkG5N8f+VtFyT+kGs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-DwRorBIlOi6tURumZ67RDg-1; Fri, 07 Jul 2023 08:32:34 -0400
X-MC-Unique: DwRorBIlOi6tURumZ67RDg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso138363366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688733153; x=1691325153;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nn3h1EpL0DqV/dmxdwYAjo6rDt1igIdvshyB/2r4DI8=;
 b=lUN6CJNc6dv02LEULHm9khVbumqUvKwopa14JcoKYgJs+6dVyBDi3W1yjCRlqmXt2a
 gUxpA/amXIR33xrz6GTmtkscFTsamM2eShn1yvvBzQJZJcl6o0gCe5B1hztqITLv2Gn9
 PHDlJdJDRZvrflIZeR7eP9enIaT/G3G1vFIxGX5MVB0VghtPgFFMq3e/m+2ouluyAgNj
 8OtPw8dri2JLAke7JGz9ovq9KigMMsmJmdEFjjkibtRNZIyFviYWic3DLxIaJXG81Jgv
 THOFfIasArg8nT779YEQBPn7VNfeUxx+WAeQeW0voRyKTI9iAoye00QD/J9t3s+gSpGw
 2QVA==
X-Gm-Message-State: ABy/qLZHphXJWIufU00RFnBlL0VjNPX4oqvvZqoMTkwq7iC1jCJXlWnM
 qycvXbrL5u5BfG5PGJS5Y/bBha166Z01oJ3heSy7BAUe1+C28FSANlqo5s6VB8vxLvGQQYSPaoO
 WGhiXPgLns289CnmdqwW3RVHlvO/U
X-Received: by 2002:a17:906:7a52:b0:993:d700:8a46 with SMTP id
 i18-20020a1709067a5200b00993d7008a46mr737164ejo.16.1688733153141; 
 Fri, 07 Jul 2023 05:32:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFRlTP4tlTIrMee4dualKZyn/YQvF5j+qEUu7LZCaQF464CIAp+SYm449fXhMCnrDIsRDqEmA==
X-Received: by 2002:a17:906:7a52:b0:993:d700:8a46 with SMTP id
 i18-20020a1709067a5200b00993d7008a46mr737147ejo.16.1688733152784; 
 Fri, 07 Jul 2023 05:32:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a170906c30600b009934b1eb577sm2149724ejz.77.2023.07.07.05.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 05:32:32 -0700 (PDT)
Message-ID: <dab8bc29-f053-09e4-40ba-5009d1787c26@redhat.com>
Date: Fri, 7 Jul 2023 14:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230706202642.4cbc7227@collabora.com>
 <20230707095754.5d365f8e@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230707095754.5d365f8e@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 09:57, Boris Brezillon wrote:
> On Thu, 6 Jul 2023 20:26:42 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Fri, 30 Jun 2023 00:25:18 +0200
>> Danilo Krummrich <dakr@redhat.com> wrote:
>>
>>> +#ifdef CONFIG_LOCKDEP
>>> +typedef struct lockdep_map *lockdep_map_p;
>>> +#define drm_gpuva_manager_ext_assert_held(mgr)		\
>>> +	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
>>> +/**
>>> + * drm_gpuva_manager_set_ext_lock - set the external lock according to
>>> + * @DRM_GPUVA_MANAGER_LOCK_EXTERN
>>> + * @mgr: the &drm_gpuva_manager to set the lock for
>>> + * @lock: the lock to set
>>> + *
>>> + * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
>>> + * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
>>> + * &drm_gem_objects GPUVA list.
>>> + */
>>> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
>>> +	(mgr)->ext_lock = &(lock)->dep_map
>>
>> Okay, so, IIUC, this is the lock protecting the GEM's active mappings
>> list, meaning the lock is likely to be attached to the GEM object. Are
>> we expected to call drm_gpuva_manager_set_ext_lock() every time we call
>> drm_gpuva_[un]link(), or are we supposed to have some lock at the
>> device level serializing all drm_gpuva_[un]link() calls across VMs? The
>> later doesn't sound like a good option to me, and the former feels a bit
>> weird. I'm wondering if we shouldn't just drop this assert_held() check
>> when DRM_GPUVA_MANAGER_LOCK_EXTERN is set. Alternatively, we could say
>> that any driver wanting to use a custom lock (which is basically all
>> drivers modifying the VA space asynchronously in the ::run_job() path)
>> has to provide its own variant of drm_gpuva_[un]link() (maybe with its
>> own VA list too), which doesn't sound like a good idea either.
> 
> Or we could just attach the dep_map to drm_gem_object::gpuva::lock, and
> let drivers overload the default lock in their GEM creation function if
> they want to use a custom lock (see the following diff).

Uh, I like that. Will pick it up, thanks!

> 
> ---
> 
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index e47747f22126..6427c88c22ba 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -675,8 +675,7 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>   		       const char *name,
>   		       u64 start_offset, u64 range,
>   		       u64 reserve_offset, u64 reserve_range,
> -		       const struct drm_gpuva_fn_ops *ops,
> -		       enum drm_gpuva_manager_flags flags)
> +		       const struct drm_gpuva_fn_ops *ops)
>   {
>   	mgr->rb.tree = RB_ROOT_CACHED;
>   	INIT_LIST_HEAD(&mgr->rb.list);
> @@ -686,7 +685,6 @@ drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>   	mgr->mm_range = range;
>   
>   	mgr->name = name ? name : "unknown";
> -	mgr->flags = flags;
>   	mgr->ops = ops;
>   
>   	memset(&mgr->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> @@ -822,16 +820,12 @@ EXPORT_SYMBOL(drm_gpuva_remove);
>   void
>   drm_gpuva_link(struct drm_gpuva *va)
>   {
> -	struct drm_gpuva_manager *mgr = va->mgr;
>   	struct drm_gem_object *obj = va->gem.obj;
>   
>   	if (unlikely(!obj))
>   		return;
>   
> -	if (drm_gpuva_manager_external_lock(mgr))
> -		drm_gpuva_manager_ext_assert_held(mgr);
> -	else
> -		dma_resv_assert_held(obj->resv);
> +	drm_gem_gpuva_assert_lock_held(obj);
>   
>   	list_add_tail(&va->gem.entry, &obj->gpuva.list);
>   }
> @@ -850,16 +844,12 @@ EXPORT_SYMBOL(drm_gpuva_link);
>   void
>   drm_gpuva_unlink(struct drm_gpuva *va)
>   {
> -	struct drm_gpuva_manager *mgr = va->mgr;
>   	struct drm_gem_object *obj = va->gem.obj;
>   
>   	if (unlikely(!obj))
>   		return;
>   
> -	if (drm_gpuva_manager_external_lock(mgr))
> -		drm_gpuva_manager_ext_assert_held(mgr);
> -	else
> -		dma_resv_assert_held(obj->resv);
> +	drm_gem_gpuva_assert_lock_held(obj);
>   
>   	list_del_init(&va->gem.entry);
>   }
> @@ -1680,10 +1670,7 @@ drm_gpuva_gem_unmap_ops_create(struct drm_gpuva_manager *mgr,
>   	struct drm_gpuva *va;
>   	int ret;
>   
> -	if (drm_gpuva_manager_external_lock(mgr))
> -		drm_gpuva_manager_ext_assert_held(mgr);
> -	else
> -		dma_resv_assert_held(obj->resv);
> +	drm_gem_gpuva_assert_lock_held(obj);
>   
>   	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
>   	if (!ops)
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 5ec8148a30ee..572d7a538324 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -387,10 +387,14 @@ struct drm_gem_object {
>   	 * Provides the list of GPU VAs attached to this GEM object.
>   	 *
>   	 * Drivers should lock list accesses with the GEMs &dma_resv lock
> -	 * (&drm_gem_object.resv).
> +	 * (&drm_gem_object.resv) or a custom lock if one is provided.
>   	 */
>   	struct {
>   		struct list_head list;
> +
> +#ifdef CONFIG_LOCKDEP
> +		struct lockdep_map *lock_dep_map;
> +#endif
>   	} gpuva;
>   
>   	/**
> @@ -540,6 +544,26 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>   
>   int drm_gem_evict(struct drm_gem_object *obj);
>   
> +#ifdef CONFIG_LOCKDEP
> +/*
> + * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the gpuva list.
> + * @obj: the &drm_gem_object
> + * @lock: the lock used to protect the gpuva list. The locking primitive
> + * must contain a dep_map field.
> + *
> + * Call this if you're not proctecting access to the gpuva list
> + * with the resv lock, otherwise, drm_gem_gpuva_init() takes case
> + * of initializing the lock_dep_map for you.
> + */
> +#define drm_gem_gpuva_set_lock(obj, lock) \
> +	obj->gpuva.lock_dep_map = &(lock)->dep_map
> +#define drm_gem_gpuva_assert_lock_held(obj) \
> +	lockdep_assert(lock_is_held(obj->gpuva.lock_dep_map))
> +#else
> +#define drm_gem_gpuva_set_lock(obj, lock) do {} while(0)
> +#define drm_gem_gpuva_assert_lock_held(obj) do {} while(0)
> +#endif
> +
>   /**
>    * drm_gem_gpuva_init - initialize the gpuva list of a GEM object
>    * @obj: the &drm_gem_object
> @@ -552,6 +576,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
>   static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>   {
>   	INIT_LIST_HEAD(&obj->gpuva.list);
> +	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
>   }
>   
>   /**
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index 4f23aaf726dd..4ad56b67e244 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -185,44 +185,6 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
>   	return va->flags & DRM_GPUVA_INVALIDATED;
>   }
>   
> -#ifdef CONFIG_LOCKDEP
> -typedef struct lockdep_map *lockdep_map_p;
> -#define drm_gpuva_manager_ext_assert_held(mgr)		\
> -	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
> -/**
> - * drm_gpuva_manager_set_ext_lock - set the external lock according to
> - * @DRM_GPUVA_MANAGER_LOCK_EXTERN
> - * @mgr: the &drm_gpuva_manager to set the lock for
> - * @lock: the lock to set
> - *
> - * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
> - * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
> - * &drm_gem_objects GPUVA list.
> - */
> -#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
> -	(mgr)->ext_lock = &(lock)->dep_map
> -#else
> -typedef struct { /* nothing */ } lockdep_map_p;
> -#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)
> -#define drm_gpuva_manager_set_ext_lock(mgr, lock)	do { } while (0)
> -#endif
> -
> -/**
> - * enum drm_gpuva_manager_flags - the feature flags for the &drm_gpuva_manager
> - */
> -enum drm_gpuva_manager_flags {
> -	/**
> -	 * @DRM_GPUVA_MANAGER_LOCK_EXTERN:
> -	 *
> -	 * Indicates the driver has it's own external lock for linking and
> -	 * unlinking &drm_gpuvas to the &drm_gem_objects GPUVA list.
> -	 *
> -	 * When setting this flag it is rquired to set a lock via
> -	 * drm_gpuva_set_ext_lock().
> -	 */
> -	DRM_GPUVA_MANAGER_LOCK_EXTERN = (1 << 0),
> -};
> -
>   /**
>    * struct drm_gpuva_manager - DRM GPU VA Manager
>    *
> @@ -241,11 +203,6 @@ struct drm_gpuva_manager {
>   	 */
>   	const char *name;
>   
> -	/**
> -	 * @flags: the feature flags of the &drm_gpuva_manager
> -	 */
> -	enum drm_gpuva_manager_flags flags;
> -
>   	/**
>   	 * @mm_start: start of the VA space
>   	 */
> @@ -283,31 +240,15 @@ struct drm_gpuva_manager {
>   	 * @ops: &drm_gpuva_fn_ops providing the split/merge steps to drivers
>   	 */
>   	const struct drm_gpuva_fn_ops *ops;
> -
> -	/**
> -	 * @ext_lock: &lockdep_map according to @DRM_GPUVA_MANAGER_LOCK_EXTERN
> -	 */
> -	lockdep_map_p ext_lock;
>   };
>   
>   void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
>   			    const char *name,
>   			    u64 start_offset, u64 range,
>   			    u64 reserve_offset, u64 reserve_range,
> -			    const struct drm_gpuva_fn_ops *ops,
> -			    enum drm_gpuva_manager_flags flags);
> +			    const struct drm_gpuva_fn_ops *ops);
>   void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
>   
> -/**
> - * drm_gpuva_manager_external_lock - indicates whether the
> - * @DRM_GPUVA_MANAGER_LOCK_EXTERN flag is set
> - * @mgr: the &drm_gpuva_manager to check the flag for
> - */
> -static inline bool drm_gpuva_manager_external_lock(struct drm_gpuva_manager *mgr)
> -{
> -	return mgr->flags & DRM_GPUVA_MANAGER_LOCK_EXTERN;
> -}
> -
>   /**
>    * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
>    * @va__: &drm_gpuva structure to assign to in each iteration step
> 

