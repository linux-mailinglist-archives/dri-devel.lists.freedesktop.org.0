Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7B4147DA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B449B6EB82;
	Wed, 22 Sep 2021 11:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4416EB80;
 Wed, 22 Sep 2021 11:35:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="220376078"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="220376078"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:35:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="474525554"
Received: from mmazarel-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:35:01 -0700
Subject: Re: [PATCH 2/3] drm/i915/ttm: Fix lockdep warning in
 __i915_gem_free_object()
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
 <20210922083807.888206-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPWMTq0TpLbpUwczGMDjcvh-kjw35d-xUQ_9RNrj9hY+w@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <d1462f5b-f657-c2c2-17b3-cac28cad78e4@linux.intel.com>
Date: Wed, 22 Sep 2021 13:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPWMTq0TpLbpUwczGMDjcvh-kjw35d-xUQ_9RNrj9hY+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 9/22/21 12:55 PM, Matthew Auld wrote:
> On Wed, 22 Sept 2021 at 09:38, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> In the mman selftest, some tests make the ttm_bo_init_reserved() fail,
>> which may trigger a call to the i915_ttm_bo_destroy() function.
>> However, at this point the gem object refcount is set to 1, which
>> triggers a lockdep warning in __i915_gem_free_object() and a
>> corresponding failure in DG1 BAT, i915_selftest@live@mman.
>>
>> Fix this by clearing the gem object refcount if called from that
>> failure path.
>>
>> Fixes: f9b23c157a78 ("drm/i915: Move __i915_gem_free_object to ttm_bo_destroy")
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index b94497989995..b1f561543ff3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -900,6 +900,10 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>>
>>          i915_ttm_backup_free(obj);
>>
>> +       /* Failure during ttm_bo_init_reserved leaves the refcount set to 1. */
>> +       if (IS_ENABLED(CONFIG_LOCKDEP) && !obj->ttm.created)
>> +               refcount_set(&obj->base.refcount.refcount, 0);
>> +
>>          /* This releases all gem object bindings to the backend. */
>>          __i915_gem_free_object(obj);
> The __i915_gem_free_object is also nuking stuff like mm.placements,
> which is still owned by the caller AFAIK, or at least it is until we
> have successfully initialised the object, so smells like potential
> double free? Can we easily move that under the ttm.created check?
> Otherwise maybe we are meant to move the mm.placements handling into
> the RCU callback?

Yes, it indeed sounds like a closer look is needed for the error 
handling here. Perhaps it makes sense to initialize the TTM part and 
then the GEM part while still having the lock. Meanwhile I'll put it 
under the ttm.created check.

Thanks,

Thomas


>
>> --
>> 2.31.1
>>
