Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0125706E28
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B77310E215;
	Wed, 17 May 2023 16:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45A810E214;
 Wed, 17 May 2023 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340955; x=1715876955;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lqfIH+ZxKpwFoP3/tKuuVLaw0nihNRJzpk38qw2csIQ=;
 b=LTFGgl+JX2oOddc/BVsDqpfXudl+gjYOJ8zZpJQqji8X1HmaJJyBQ+zN
 cRV1S2Y+2wTove8B+44SGs2cMQ0BhwFWGhseCkeocGd+1VhPGWTEmmY8h
 G/FRjo8J0qH8V6m96YRTZeNsBAJ1UKAGfn14unTS9AlsioeIxqTSNbFrK
 pRcnbsr7aZjwTer9OTKjjJh2PDD7i4LDLl//TBeXoBHBAPJsOBplhLNUE
 ROORsOR0wa8VTvRppW8AG/k730763yP2aLW85/zcYAsVXNjqPL0h/vMOm
 FEkY2auPXeOf4RKgo/+zAFT76UJzp9oqLQP05vfviKaIjqo9oj5l9UF43 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350642004"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="350642004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826016987"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="826016987"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO [10.252.15.194])
 ([10.252.15.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:29:03 -0700
Message-ID: <dcaf0964-3264-6a35-469d-75ff520d5f6b@intel.com>
Date: Wed, 17 May 2023 17:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Content-Language: en-GB
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517160523.GA607652@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230517160523.GA607652@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 17:05, Stanislaw Gruszka wrote:
> On Wed, May 17, 2023 at 04:22:38PM +0100, Matthew Auld wrote:
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
> Nice catch :-) we observed lockdep deadlock false alarms too, but I could
> not spot it out and were adding lockdep_set_class(key) to avoid those.
> 
> 
>> +static inline void __drmm_mutex_release(struct drm_device *dev, void *res)
> 
> Can this be inline if used in drmm_add_action_or_reset() ?

I think so. Did I missing something here? It at least builds for me.

> 
> 
>> +{
>> +	struct mutex *lock = res;
>> +
>> +	mutex_destroy(lock);
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
>> + * This is a &drm_device-managed version of mutex_init(). The initialized
>> + * lock is automatically destroyed on the final drm_dev_put().
>> + */
>> +#define drmm_mutex_init(dev, lock) ({					     \
>> +	mutex_init(lock);						     \
>> +	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
>> +})									     \
> 
> Regards
> Stanislaw
> 
> 
