Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E630370B963
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A3110E299;
	Mon, 22 May 2023 09:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D1810E297;
 Mon, 22 May 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684749039; x=1716285039;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a7xk5ynNhw9PP+8F9CGXCT3fyCZ0GROanTFF3ZgPtTc=;
 b=Zb3N03rowjJ9UECKnato2nPM6xsAIQU7CC2p4/jUkwHaSTZsriL2pYkF
 SsGeXesMJeMPEmze3B0/Iepj3LmqpOISTvrEENNFhT2rAB0NykRBrJKWG
 EW6moX1cFYQRoIaVChoEf2QcOn4XR9WTtOfq2RD6L7faaCMG6OCrkOqWL
 xMAFKQLUEDurscM3uIUeFsa3I+pUis6O7kZIVl9OJZ7FaLI6+f6ZqTwPn
 fJw1TzK3cLgxzjlUIOtQCPBCZbpcyUe7mmqistUqRFl+Awuk3P/kIle7t
 R6UeqXFxC8irCbqMKq/MJ1nm6iYZ3Bi9KQIq7PPn4tKaU0XfO3vP+SZ4A g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381099947"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381099947"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="768448559"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="768448559"
Received: from amigon-mobl.ger.corp.intel.com (HELO [10.249.128.230])
 ([10.249.128.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:50:36 -0700
Message-ID: <b32e9dc2-c450-52aa-12fa-7bc8b207aba4@intel.com>
Date: Mon, 22 May 2023 10:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
References: <20230519090733.489019-1-matthew.auld@intel.com>
 <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
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
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 10:43, Thomas Zimmermann wrote:
> Hi
> 
> Am 19.05.23 um 11:07 schrieb Matthew Auld:
>> In mutex_init() lockdep identifies a lock by defining a special static
>> key for each lock class. However if we wrap the macro in a function,
>> like in drmm_mutex_init(), we end up generating:
>>
>> int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
>> {
>>        static struct lock_class_key __key;
>>
>>        __mutex_init((lock), "lock", &__key);
>>        ....
>> }
>>
>> The static __key here is what lockdep uses to identify the lock class,
>> however since this is just a normal function the key here will be
>> created once, where all callers then use the same key. In effect the
>> mutex->depmap.key will be the same pointer for different
>> drmm_mutex_init() callers. This then results in impossible lockdep
>> splats since lockdep thinks completely unrelated locks are the same lock
>> class.
>>
>> To fix this turn drmm_mutex_init() into a macro such that it generates a
>> different "static struct lock_class_key __key" for each invocation,
>> which looks to be inline with what mutex_init() wants.
>>
>> v2:
>>    - Revamp the commit message with clearer explanation of the issue.
>>    - Rather export __drmm_mutex_release() than static inline.
>>
>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reported-by: Sarah Walker <sarah.walker@imgtec.com>
>> Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
>> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Shall I add the patch to drm-misc-fixes?

Yes, please do. Thanks.

> 
> Best regards
> Thomas
> 
>> ---
>>   drivers/gpu/drm/drm_managed.c | 22 ++--------------------
>>   include/drm/drm_managed.h     | 18 +++++++++++++++++-
>>   2 files changed, 19 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_managed.c 
>> b/drivers/gpu/drm/drm_managed.c
>> index 4cf214de50c4..c21c3f623033 100644
>> --- a/drivers/gpu/drm/drm_managed.c
>> +++ b/drivers/gpu/drm/drm_managed.c
>> @@ -264,28 +264,10 @@ void drmm_kfree(struct drm_device *dev, void *data)
>>   }
>>   EXPORT_SYMBOL(drmm_kfree);
>> -static void drmm_mutex_release(struct drm_device *dev, void *res)
>> +void __drmm_mutex_release(struct drm_device *dev, void *res)
>>   {
>>       struct mutex *lock = res;
>>       mutex_destroy(lock);
>>   }
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
>> +EXPORT_SYMBOL(__drmm_mutex_release);
>> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
>> index 359883942612..ad08f834af40 100644
>> --- a/include/drm/drm_managed.h
>> +++ b/include/drm/drm_managed.h
>> @@ -105,6 +105,22 @@ char *drmm_kstrdup(struct drm_device *dev, const 
>> char *s, gfp_t gfp);
>>   void drmm_kfree(struct drm_device *dev, void *data);
>> -int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
>> +void __drmm_mutex_release(struct drm_device *dev, void *res);
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
