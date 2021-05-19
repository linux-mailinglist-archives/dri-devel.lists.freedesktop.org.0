Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084C388781
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 08:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0068D6E196;
	Wed, 19 May 2021 06:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776D86E196;
 Wed, 19 May 2021 06:27:54 +0000 (UTC)
IronPort-SDR: lO+5a8PJojQtu+Rm6Jtua3MFzixIpzwNmqjc539diOuYiZ2EuNDTeVlQupgSef+f5tjasEQj5v
 pLiF60Sw7xyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="197810678"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="197810678"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 23:27:53 -0700
IronPort-SDR: D0yQiy2JUiTycIv8o+pzcfB5Aebl2NOP4ERHPU2DA1dUgw2QHICbPZku6BeLCwzVaeY0/ky0lt
 6yN70qPixHIw==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="627496700"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.222])
 ([10.249.254.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 23:27:52 -0700
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
 <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
 <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
 <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
 <fb9a4898-5844-c1e5-7a24-cb50a9ad6df7@amd.com>
 <334dc2d2-2053-9e42-62be-58784e4256aa@linux.intel.com>
 <a627f340-492e-c2cd-f805-8fafdca8eb60@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1be54cd2-5e50-c967-17a8-4b6d86fe71b1@linux.intel.com>
Date: Wed, 19 May 2021 08:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a627f340-492e-c2cd-f805-8fafdca8eb60@amd.com>
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


On 5/18/21 6:30 PM, Christian König wrote:
> Am 18.05.21 um 18:07 schrieb Thomas Hellström:
>>
>> On 5/18/21 5:42 PM, Christian König wrote:
>>> Am 18.05.21 um 17:38 schrieb Thomas Hellström:
>>>>
>>>> On 5/18/21 5:28 PM, Christian König wrote:
>>>>> Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>>>>>>
>>>>>> On 5/18/21 5:18 PM, Christian König wrote:
>>>>>>>
>>>>>>>
>>>>>>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>>>>>>
>>>>>>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>>>>>>> We are calling the eviction_valuable driver callback at 
>>>>>>>>> eviction time to
>>>>>>>>> determine whether we actually can evict a buffer object.
>>>>>>>>> The upcoming i915 TTM backend needs the same functionality for 
>>>>>>>>> swapout,
>>>>>>>>> and that might actually be beneficial to other drivers as well.
>>>>>>>>>
>>>>>>>>> Add an eviction_valuable call also in the swapout path. Try to 
>>>>>>>>> keep the
>>>>>>>>> current behaviour for all drivers by returning true if the 
>>>>>>>>> buffer object
>>>>>>>>> is already in the TTM_PL_SYSTEM placement. We change behaviour 
>>>>>>>>> for the
>>>>>>>>> case where a buffer object is in a TT backed placement when 
>>>>>>>>> swapped out,
>>>>>>>>> in which case the drivers normal eviction_valuable path is run.
>>>>>>>>>
>>>>>>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>>>>>>> that are not populated. This allows a driver to purge a bo at
>>>>>>>>> swapout time if its content is no longer valuable rather than to
>>>>>>>>> have TTM swap the contents out.
>>>>>>>>>
>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>> Signed-off-by: Thomas Hellström 
>>>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>>>>
>>>>>>>> Christian,
>>>>>>>>
>>>>>>>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>>>>>>>> figure you will push back on that one. What we really need is a 
>>>>>>>> functionality to just drop the bo contents and end up in system 
>>>>>>>> memory unpopulated. Should I perhaps add a utility function to 
>>>>>>>> do that instead? like ttm_bo_purge()?
>>>>>>>
>>>>>>> We already have that. Just call ttm_bo_validate() without any 
>>>>>>> place to put the buffer.
>>>>>>>
>>>>>>> See how ttm_bo_pipeline_gutting() is used.
>>>>>>>
>>>>>>> Christian.
>>>>>>
>>>>>> OK, so is that reentrant from the move() or swap_notify() callback.
>>>>>
>>>>> That sounds like a design bug to me since you should never need to 
>>>>> do this.
>>>>>
>>>>> When you want to destroy the backing store of a buffer during 
>>>>> eviction you should just do this by returning an empty placement 
>>>>> from the evict_flags callback.
>>>>
>>>> So this is for the functionality where the user has indicated that 
>>>> the contents is no longer of value, but the buffer itself
>>>> is cached until evicted or swapped out for performance reasons. So 
>>>> the above would work for eviction, but what about swapout. Could we 
>>>> add some similar functionality there?
>>>
>>> Amdgpu has the same functionality and you don't need to handle swap 
>>> at all.
>>>
>>> Just return from the evict_flags that you want to drop the backing 
>>> store as soon as the BO leaves the GTT domain.
>>
>> Hmm, the pipeline_gutting function seems ok, but overly complex if 
>> the bo is already idle, Am I allowed to optimize it slightly for the 
>> latter case?
>
> Yeah, sure. We just never hat that use case so far.

One thing about the code here that makes me worried is that the 
"destination" ttm_tt is allocated *after* pipeline_gutting. We're not 
really allowed to fail here because that would leave the BO in a state 
where codepaths (fault for example) try to access a NULL ttm_tt. While 
the idle case can get away with ttm_tt_unpopulate, for the async case, 
ttm_tt really needs to be pre-allocated, so that we can leave the bo in 
a consistent state.

/Thomas


>
> Christian.
>
>>
>> /Thomas
>>
>>
>>>
>>> Christian.
>>>
>>>>
>>>> /Thomas
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>
>>>
>
