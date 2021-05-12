Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7037BE32
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A596EBF6;
	Wed, 12 May 2021 13:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12F36E07B;
 Wed, 12 May 2021 13:25:40 +0000 (UTC)
IronPort-SDR: pRsQpG1ofdHUxE/d5H5o43ygVh/DlJABPB6Bc8bk8+ZZJcuxLqht2XrRtT6Ya2NPUwY7new/6U
 QYApJVytrOWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="285205998"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="285205998"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 06:25:35 -0700
IronPort-SDR: 1hAkmnEwDuAPuZm7e4fdrqKJKMLdWWqkr/VCuSvZGy7KcrJZ+WvroE8RjVxi3iG+qs/AsrfN2u
 4pUxKqUV6YMA==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; d="scan'208";a="625385127"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 06:25:34 -0700
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
 <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
 <8551810c-a095-3906-d982-7bc409140c48@amd.com>
 <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
 <a0277869-7244-aee0-3359-21dac8f5a724@amd.com>
 <e85e9bd7a28c8570c6429683d6d68ee0855afacb.camel@linux.intel.com>
 <d0f0c55d-1784-922b-e9bd-0248cd7fb6af@amd.com>
 <6e317ee2b22546a2333d3098f5cda1a59da62a1a.camel@linux.intel.com>
 <d40ac511-3de3-12f0-4f0c-38b730e62b81@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <f6a34adf-f36f-3654-0764-149d7f402ca7@linux.intel.com>
Date: Wed, 12 May 2021 15:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d40ac511-3de3-12f0-4f0c-38b730e62b81@amd.com>
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


On 5/12/21 3:05 PM, Christian König wrote:
> Am 12.05.21 um 15:02 schrieb Thomas Hellström:
>> On Wed, 2021-05-12 at 09:09 +0200, Christian König wrote:
>>> Am 12.05.21 um 09:05 schrieb Thomas Hellström:
>>>> On Wed, 2021-05-12 at 08:57 +0200, Christian König wrote:
>>>>> Am 11.05.21 um 16:28 schrieb Thomas Hellström:
>>>>>> On 5/11/21 4:09 PM, Christian König wrote:
>>>>>>> Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
>>>>>>>> On 5/11/21 3:58 PM, Christian König wrote:
>>>>>>>>> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>>>>>>>>>> Most logical place to introduce TTM buffer objects is
>>>>>>>>>> as an
>>>>>>>>>> i915
>>>>>>>>>> gem object backend. We need to add some ops to account
>>>>>>>>>> for
>>>>>>>>>> added
>>>>>>>>>> functionality like delayed delete and LRU list
>>>>>>>>>> manipulation.
>>>>>>>>>>
>>>>>>>>>> Initially we support only LMEM and SYSTEM memory, but
>>>>>>>>>> SYSTEM
>>>>>>>>>> (which in this case means evicted LMEM objects) is not
>>>>>>>>>> visible to i915 GEM yet. The plan is to move the i915
>>>>>>>>>> gem
>>>>>>>>>> system
>>>>>>>>>> region
>>>>>>>>>> over to the TTM system memory type in upcoming patches.
>>>>>>>>>>
>>>>>>>>>> We set up GPU bindings directly both from LMEM and from
>>>>>>>>>> the
>>>>>>>>>> system
>>>>>>>>>> region,
>>>>>>>>>> as there is no need to use the legacy TTM_TT memory
>>>>>>>>>> type.
>>>>>>>>>> We reserve
>>>>>>>>>> that for future porting of GGTT bindings to TTM.
>>>>>>>>>>
>>>>>>>>>> There are some changes to TTM to allow for purging
>>>>>>>>>> system
>>>>>>>>>> memory
>>>>>>>>>> buffer
>>>>>>>>>> objects and to refuse swapping of some objects:
>>>>>>>>>> Unfortunately i915
>>>>>>>>>> gem
>>>>>>>>>> still relies heavily on short-term object pinning, and
>>>>>>>>>> we've
>>>>>>>>>> chosen to
>>>>>>>>>> keep short-term-pinned buffer objects on the TTM LRU
>>>>>>>>>> lists
>>>>>>>>>> for now,
>>>>>>>>>> meaning that we need some sort of mechanism to tell TTM
>>>>>>>>>> they are not
>>>>>>>>>> swappable. A longer term goal is to get rid of the
>>>>>>>>>> short-
>>>>>>>>>> term
>>>>>>>>>> pinning.
>>>>>>>>> Well just use the eviction_valuable interface for this.
>>>>>>>> Yes, we do that for vram/lmem eviction, but we have nothing
>>>>>>>> similar
>>>>>>>> for system swapping. Do I understand you correctly that you
>>>>>>>> want me
>>>>>>>> to add a call to eviction_valuable() also for that instead
>>>>>>>> of
>>>>>>>> swap_possible()?
>>>>>>> You should already have that. eviction_valuable is called in
>>>>>>> both
>>>>>>> cases.
>>>>>>>
>>>>>> Hmm. I can only see it called from ttm_mem_evict_first() which
>>>>>> is
>>>>>> not
>>>>>> in the swapping path? Or do I miss something?
>>>>> Mhm, looks like my recollection was wrong. We should probably
>>>>> move
>>>>> the
>>>>> call into the ttm_bo_evict_swapout_allowable() function.
>>>> Yes, I think we also need a convention whether it's called dma_resv
>>>> locked or not, since the helper accesses bo->mem, which should
>>>> really
>>>> only be done under reservation. At the same point, there is value
>>>> in
>>>> calling this function while holding the LRU lock.
>>> You actually need to call it while holding the lock because eviction
>>> otherwise ends up in an endless loop.
>>>
>>> Trying to fix that for years, but so far no luck with that.
>>>
>>>> Also, I wonder whether implementations of this callback might
>>>> encounter
>>>> unexpected data when called from the swapout path, because at least
>>>> the
>>>> helper assumes it not in system memory, since it is accessing bo-
>>>>> mem.start.
>>>> So unless we use a separate callback for swapout, there's some
>>>> auditing
>>>> to be done.
>>> Please audit the existing callbacks and move the callback into the
>>> function after doing that.
>>>
>>> Thanks,
>>> Christian.
>> Would it be OK if I also move the kref_get_unless_zero() to before
>> ttm_bo_evict_swapout_allowable() to make the code less sensitive to
>> surprises?
>
> No, because then you need a kref_put while holding the spinlock which 
> is not allowed.
>
> Christian.

Ugh. yes, you're right.

/Thomas


