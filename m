Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBB0387C98
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189E6EC02;
	Tue, 18 May 2021 15:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883466E0D7;
 Tue, 18 May 2021 15:38:56 +0000 (UTC)
IronPort-SDR: QfM9PppkvcSXnBz7+nC6XGFV4+HTva8vpSHfwWgdG4VHlg2631xkEnktj0pzLQn4zP27aGgeK5
 0VRH17V1DtUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="286275371"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="286275371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:38:56 -0700
IronPort-SDR: 7jNsrBvQ9zeEFfOzDf+YzCpFXh6nJK4QhKD56xKnIIAp7rlwrrEzwYW7eok98mW+yMQpz61x8B
 /5GX/LG+ATkg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439089609"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:38:55 -0700
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
Date: Tue, 18 May 2021 17:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
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


On 5/18/21 5:28 PM, Christian König wrote:
> Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>>
>> On 5/18/21 5:18 PM, Christian König wrote:
>>>
>>>
>>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>>
>>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>>> We are calling the eviction_valuable driver callback at eviction 
>>>>> time to
>>>>> determine whether we actually can evict a buffer object.
>>>>> The upcoming i915 TTM backend needs the same functionality for 
>>>>> swapout,
>>>>> and that might actually be beneficial to other drivers as well.
>>>>>
>>>>> Add an eviction_valuable call also in the swapout path. Try to 
>>>>> keep the
>>>>> current behaviour for all drivers by returning true if the buffer 
>>>>> object
>>>>> is already in the TTM_PL_SYSTEM placement. We change behaviour for 
>>>>> the
>>>>> case where a buffer object is in a TT backed placement when 
>>>>> swapped out,
>>>>> in which case the drivers normal eviction_valuable path is run.
>>>>>
>>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>>> that are not populated. This allows a driver to purge a bo at
>>>>> swapout time if its content is no longer valuable rather than to
>>>>> have TTM swap the contents out.
>>>>>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>
>>>> Christian,
>>>>
>>>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>>>> figure you will push back on that one. What we really need is a 
>>>> functionality to just drop the bo contents and end up in system 
>>>> memory unpopulated. Should I perhaps add a utility function to do 
>>>> that instead? like ttm_bo_purge()?
>>>
>>> We already have that. Just call ttm_bo_validate() without any place 
>>> to put the buffer.
>>>
>>> See how ttm_bo_pipeline_gutting() is used.
>>>
>>> Christian.
>>
>> OK, so is that reentrant from the move() or swap_notify() callback.
>
> That sounds like a design bug to me since you should never need to do 
> this.
>
> When you want to destroy the backing store of a buffer during eviction 
> you should just do this by returning an empty placement from the 
> evict_flags callback.

So this is for the functionality where the user has indicated that the 
contents is no longer of value, but the buffer itself
is cached until evicted or swapped out for performance reasons. So the 
above would work for eviction, but what about swapout. Could we add some 
similar functionality there?

/Thomas

>
> Regards,
> Christian.
>
>>
>> /Thomas
>>
>>
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>
>>>
>
