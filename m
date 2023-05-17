Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA241706EF9
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3C510E1AA;
	Wed, 17 May 2023 17:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7E10E1AA;
 Wed, 17 May 2023 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684343050; x=1715879050;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WcR9EcP5arvVwtaboPLoP0TZKAs1hDHur31jHy7b9xM=;
 b=OoSD9if/ViN/RIoM4lZuXHRfKSsRKpdMGHGwCIujR4zrDBvJ4xmkhw8r
 45a4Bg2GqZ/y5E/OzBbx0u+mhFR5sxwamiRT+2uzgjqZ9Eu1+migPAR/I
 zF1kOiF52xcmdgATGs5EpfWVgUQEzK2xtYxcDvItaXPTYCjzEC609fTxi
 pwt6NoiB8u+0qy5K5uYY4/L1w68XvdGcah+kdBSvEC0ghO4RNj6sL4i8F
 ZiYRt50b7uVYarBX9SHiPyOy3Ju8N7DiF9/CccAcfwhg/qm1z4k3Gh/t4
 eFVMLyx4fnM9zeD+/JfnAcZxA6rKr5S4pDAGt1C3NG/tGoSNbsyWP01B3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="341210185"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="341210185"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826038125"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="826038125"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO [10.252.15.194])
 ([10.252.15.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:04:07 -0700
Message-ID: <166214dd-ec9e-b9bd-5bae-d035b3db918c@intel.com>
Date: Wed, 17 May 2023 18:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 17:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 17.05.23 um 17:22 schrieb Matthew Auld:
>> In mutex_init() lockdep seems to identify a lock by defining a static
>> key for each lock class. However if we wrap the whole thing in a
>> function the static key will be the same for everything calling that
>> function, which looks to be the case for drmm_mutex_init(). This then
>> results in impossible lockdep splats since lockdep thinks completely
>> unrelated locks are the same lock class. The other issue is that when
>> looking at splats we lose the actual lock name, where instead of seeing
>> something like xe->mem_access.lock for the name, we just see something
>> generic like lock#8.
>>
>> Attempt to fix this by converting drmm_mutex_init() into a macro, which
>> should ensure that mutex_init() behaves as expected.
> 
> If that's what is required, then OK. But even with your commit mesage, I 
> find it entirely non-obvious what the problem is. Isn't there a way to 
> annotate drmm_mutex_init() so that lockdep treats it like a regular 
> mutex_init()?

AFAICT the issue is that with the existing drmm_mutex_init() we 
basically end up generating:

int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
{
      static struct lock_class_key __key;

      __mutex_init((lock), "lock", &__key);
      ....
}

I think the special static __key is what lockdep uses to identify a lock 
class, so every time we call drmm_mutex_init() we should expect a 
different key. However since this is just a normal function the key will 
be created once and then all callers use the same key. For example, if 
you print mutex->depmap.key you will get the same pointer underneath for 
different drmm_mutex_init callers. And then ofc lockdep gets really 
confused.

Turning it into a macro ensures that each drmm_mutex_init() generates a 
different "static struct lock_class_key __key" for each invocation, 
which looks to be inline with what mutex_init() wants.

I'm not sure if there a better way to solve this...

> 
> Best regards
> Thomas
> 
>>
>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/drm_managed.c | 26 --------------------------
>>   include/drm/drm_managed.h     | 23 ++++++++++++++++++++++-
>>   2 files changed, 22 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_managed.c 
>> b/drivers/gpu/drm/drm_managed.c
>> index 4cf214de50c4..71c49819a7a2 100644
>> --- a/drivers/gpu/drm/drm_managed.c
>> +++ b/drivers/gpu/drm/drm_managed.c
>> @@ -263,29 +263,3 @@ void drmm_kfree(struct drm_device *dev, void *data)
>>       free_dr(dr_match);
>>   }
>>   EXPORT_SYMBOL(drmm_kfree);
>> -
>> -static void drmm_mutex_release(struct drm_device *dev, void *res)
>> -{
>> -    struct mutex *lock = res;
>> -
>> -    mutex_destroy(lock);
>> -}
>> -
>> -/**
>> - * drmm_mutex_init - &drm_device-managed mutex_init()
>> - * @dev: DRM device
>> - * @lock: lock to be initialized
>> - *
>> - * Returns:
>> - * 0 on success, or a negative errno code otherwise.
>> - *
>> - * This is a &drm_device-managed version of mutex_init(). The 
>> initialized
>> - * lock is automatically destroyed on the final drm_dev_put().
>> - */
>> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
>> -{
>> -    mutex_init(lock);
>> -
>> -    return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
>> -}
>> -EXPORT_SYMBOL(drmm_mutex_init);
>> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
>> index 359883942612..01f977e91933 100644
>> --- a/include/drm/drm_managed.h
>> +++ b/include/drm/drm_managed.h
>> @@ -105,6 +105,27 @@ char *drmm_kstrdup(struct drm_device *dev, const 
>> char *s, gfp_t gfp);
>>   void drmm_kfree(struct drm_device *dev, void *data);
>> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
>> +static inline void __drmm_mutex_release(struct drm_device *dev, void 
>> *res)
>> +{
>> +    struct mutex *lock = res;
>> +
>> +    mutex_destroy(lock);
>> +}
>> +
>> +/**
>> + * drmm_mutex_init - &drm_device-managed mutex_init()
>> + * @dev: DRM device
>> + * @lock: lock to be initialized
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + *
>> + * This is a &drm_device-managed version of mutex_init(). The 
>> initialized
>> + * lock is automatically destroyed on the final drm_dev_put().
>> + */
>> +#define drmm_mutex_init(dev, lock) ({                         \
>> +    mutex_init(lock);                             \
>> +    drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);         \
>> +})                                         \
>>   #endif
> 
