Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC174223DD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA26EB4F;
	Tue,  5 Oct 2021 10:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961CC6EB49;
 Tue,  5 Oct 2021 10:47:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206522649"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="206522649"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 03:47:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="438651191"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194])
 ([10.213.238.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 03:47:51 -0700
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-25-christian.koenig@amd.com>
 <80bb132f-0e40-68a1-d034-2d4b17d321ad@linux.intel.com>
 <4e94e263-fd20-4779-690a-b530c220b350@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <32d9b655-0b18-417a-eefc-cc1dc41fb554@linux.intel.com>
Date: Tue, 5 Oct 2021 11:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4e94e263-fd20-4779-690a-b530c220b350@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 05/10/2021 11:27, Christian König wrote:
> Am 05.10.21 um 09:53 schrieb Tvrtko Ursulin:
>>
>> On 01/10/2021 11:06, Christian König wrote:
>>> Makes the handling a bit more complex, but avoids the use of
>>> dma_resv_get_excl_unlocked().
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c 
>>> b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>> index e570398abd78..21ed930042b8 100644
>>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>> @@ -143,6 +143,7 @@
>>>    */
>>>   int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct 
>>> drm_plane_state *state)
>>>   {
>>> +    struct dma_resv_iter cursor;
>>>       struct drm_gem_object *obj;
>>>       struct dma_fence *fence;
>>>   @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct 
>>> drm_plane *plane, struct drm_plane_st
>>>           return 0;
>>>         obj = drm_gem_fb_get_obj(state->fb, 0);
>>> -    fence = dma_resv_get_excl_unlocked(obj->resv);
>>> -    drm_atomic_set_fence_for_plane(state, fence);
>>> +    dma_resv_iter_begin(&cursor, obj->resv, false);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>> +        dma_fence_get(fence);
>>> +        dma_resv_iter_end(&cursor);
>>> +        /* TODO: We only use the first write fence here */
>>
>> What is the TODO? NB instead?
> 
> The drm atomic API can unfortunately handle only one fence and we can 
> certainly have more than that.
> 
>>
>>> + drm_atomic_set_fence_for_plane(state, fence);
>>> +        return 0;
>>> +    }
>>> +    dma_resv_iter_end(&cursor);
>>>   +    drm_atomic_set_fence_for_plane(state, NULL);
>>
>>     dma_resv_iter_begin(&cursor, obj->resv, false);
>>     dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>         dma_fence_get(fence);
>>         break;
>>     }
>>     dma_resv_iter_end(&cursor);
>>
>>     drm_atomic_set_fence_for_plane(state, fence);
>>
>> Does this work?
> 
> Yeah that should work as well.
> 
>>
>> But overall I am not sure this is nicer. Is the goal to remove 
>> dma_resv_get_excl_unlocked as API it just does not happen in this series?
> 
> Yes, the only user left is the i915_gem_object_last_write_engine() 
> function and that one you already removed in i915.

To me the above feels clumsier than dma_resv_get_excl_unlocked and you 
can even view it as open coding that helper. So don't know, someone else 
can have a casting vote.

I guess if support for more than one fence is coming soon(-ish) do drm 
atomic api then I could be convinced the iterator here makes sense today.

Regards,

Tvrtko

> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       return 0;
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>>
> 
