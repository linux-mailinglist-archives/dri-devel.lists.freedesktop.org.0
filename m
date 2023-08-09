Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EE776C5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 00:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCF010E12C;
	Wed,  9 Aug 2023 22:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA8410E12C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 22:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691620857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
 b=XbhWl7gJz61HdCfNcX9isnaOJpsgEcAa9PcT89v4Zcz/wogp7ZuM7SEZv15fTm2C7Qmu7h
 tljZPsyq30Xdj1klCj6blY+wzDX5Z16kcTBpH1VY59P61nO39mIeQ17e01O2413uJSQbkZ
 3jvWNERSq8nz2MGEFEGr1E3vhPklh/Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-0k6q0BF4MASvA3mHEVC2UQ-1; Wed, 09 Aug 2023 18:40:56 -0400
X-MC-Unique: 0k6q0BF4MASvA3mHEVC2UQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-523282be1a5so154250a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 15:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691620855; x=1692225655;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqkWptdyICgKZLcTvquabOW8rAvUOuPeScuQD1YQUKA=;
 b=BPjerjZhZMGVTmBfxbloTvsj6vdh4fxFfP+O6zmgS5xyvz49v/WNviKlXLl56aGveJ
 l+fR7Ok+pjp4LxOQ0CVhq1E0KqzUJPYSJiePRqDvIDFSgPhSY+eePZHjjtfgjsYbDKcd
 IYJ8oD8HVGZN1Si83EjTX10G3/81Rdt3qInJl8uEMnKAnLwpSjPPFUw9xbB0SUsH7YkX
 WoSvyk9OaRw8OoVyssPJLFM+/dhopUA0ixkkZ2YCyoplTcrx/qQeNdixu2a7jxI9XPU+
 JmEjkiNnguRHtNwurLecEXm9exdb26iClLMmbePTq9WlaONLhX9EAEiWSXdZDUmUtpm1
 XX1Q==
X-Gm-Message-State: AOJu0YyfNl/5ny7v9t/SrBtF7SaOUGKq/86KCuBUr1LxEGw5RbnF2Tln
 UYh+BsppQxnhS4IfGpgMTNkSvIkdUeTb7N5rlil7UL4Y88CwtW1gSxpyES/G9wl5LNZlW3Hlcsq
 dT/nKbOry2kdubhQax6WQVvNWRmla
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id
 n7-20020aa7c687000000b005224cd7efb0mr469654edq.17.1691620855563; 
 Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbc5d+5Pwrcb2mWJiUCFNf5HjHJlFOgUzg5E8ZB5Bw31sbH+4nAOdQBye19n8yg+HHqaYiFA==
X-Received: by 2002:aa7:c687:0:b0:522:4cd7:efb0 with SMTP id
 n7-20020aa7c687000000b005224cd7efb0mr469630edq.17.1691620855277; 
 Wed, 09 Aug 2023 15:40:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a056402071a00b0052369656ed3sm48675edx.3.2023.08.09.15.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Aug 2023 15:40:54 -0700 (PDT)
Message-ID: <3f4beed9-6aca-b544-80a2-9ea5264da119@redhat.com>
Date: Thu, 10 Aug 2023 00:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep check for
 dma-resv lock
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-2-dakr@redhat.com>
 <20230808092117.7f7fdef9@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230808092117.7f7fdef9@collabora.com>
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
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/8/23 09:21, Boris Brezillon wrote:
> On Thu,  3 Aug 2023 18:52:20 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
>> should fall back to the GEM objects dma-resv lock. With the current
>> implementation we're setting the lock_dep_map of the GEM objects 'resv'
>> pointer (in case no custom lock_dep_map is set yet) on
>> drm_gem_private_object_init().
>>
>> However, the GEM objects 'resv' pointer might still change after
>> drm_gem_private_object_init() is called, e.g. through
>> ttm_bo_init_reserved(). This can result in the wrong lock being tracked.
>>
>> To fix this, call dma_resv_held() directly from
>> drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
>> pointer only if an actual custom lock is set.
>>
>> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> but I'm wondering if it wouldn't be a good thing to add a
> drm_gem_set_resv() helper, so the core can control drm_gem_object::resv
> re-assignments (block them if it's happening after the GEM has been
> exposed to the outside world or update auxiliary data if it's happening
> before that).

I agree, this might be a good idea. There are quite a few places where 
drm_gem_object::resv is set from external code.

> 
>> ---
>>   include/drm/drm_gem.h | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index c0b13c43b459..bc9f6aa2f3fe 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    * @lock: the lock used to protect the gpuva list. The locking primitive
>>    * must contain a dep_map field.
>>    *
>> - * Call this if you're not proctecting access to the gpuva list
>> - * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
>> - * of initializing lock_dep_map for you.
>> + * Call this if you're not proctecting access to the gpuva list with the
>> + * dma-resv lock, but with a custom lock.
>>    */
>>   #define drm_gem_gpuva_set_lock(obj, lock) \
>> -	if (!(obj)->gpuva.lock_dep_map) \
>> +	if (!WARN((obj)->gpuva.lock_dep_map, \
>> +		  "GEM GPUVA lock should be set only once.")) \
>>   		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
>>   #define drm_gem_gpuva_assert_lock_held(obj) \
>> -	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
>> +	lockdep_assert((obj)->gpuva.lock_dep_map ? \
>> +		       lock_is_held((obj)->gpuva.lock_dep_map) : \
>> +		       dma_resv_held((obj)->resv))
>>   #else
>>   #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
>>   #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
>> @@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
>>    *
>>    * Calling this function is only necessary for drivers intending to support the
>>    * &drm_driver_feature DRIVER_GEM_GPUVA.
>> + *
>> + * See also drm_gem_gpuva_set_lock().
>>    */
>>   static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>>   {
>>   	INIT_LIST_HEAD(&obj->gpuva.list);
>> -	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
>>   }
>>   
>>   /**
> 

