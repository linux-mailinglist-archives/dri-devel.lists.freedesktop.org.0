Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88537A943
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33E46E194;
	Tue, 11 May 2021 14:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836676E194;
 Tue, 11 May 2021 14:28:40 +0000 (UTC)
IronPort-SDR: 9uXW7rtVso5XqG7WoEAvhSBviakWVhQJ8sNmOrUSnI54JH/hT0PVWR7oNpADlQOr1TGjLPyabL
 2HU3utfqHmjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196359976"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196359976"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:28:39 -0700
IronPort-SDR: BUWZ3nAt2KFYwhtg7w4r04CahXvBgSOzMex1dJJfxtotNtWaTLk6wDZ7XqwKt96V4PzDofgQJt
 z6W7OKO8D3MQ==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391421714"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:28:38 -0700
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
Date: Tue, 11 May 2021 16:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8551810c-a095-3906-d982-7bc409140c48@amd.com>
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


On 5/11/21 4:09 PM, Christian König wrote:
>
>
> Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
>>
>> On 5/11/21 3:58 PM, Christian König wrote:
>>> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>>>> Most logical place to introduce TTM buffer objects is as an i915
>>>> gem object backend. We need to add some ops to account for added
>>>> functionality like delayed delete and LRU list manipulation.
>>>>
>>>> Initially we support only LMEM and SYSTEM memory, but SYSTEM
>>>> (which in this case means evicted LMEM objects) is not
>>>> visible to i915 GEM yet. The plan is to move the i915 gem system 
>>>> region
>>>> over to the TTM system memory type in upcoming patches.
>>>>
>>>> We set up GPU bindings directly both from LMEM and from the system 
>>>> region,
>>>> as there is no need to use the legacy TTM_TT memory type. We reserve
>>>> that for future porting of GGTT bindings to TTM.
>>>>
>>>> There are some changes to TTM to allow for purging system memory 
>>>> buffer
>>>> objects and to refuse swapping of some objects: Unfortunately i915 gem
>>>> still relies heavily on short-term object pinning, and we've chosen to
>>>> keep short-term-pinned buffer objects on the TTM LRU lists for now,
>>>> meaning that we need some sort of mechanism to tell TTM they are not
>>>> swappable. A longer term goal is to get rid of the short-term pinning.
>>>
>>> Well just use the eviction_valuable interface for this.
>>
>> Yes, we do that for vram/lmem eviction, but we have nothing similar 
>> for system swapping. Do I understand you correctly that you want me 
>> to add a call to eviction_valuable() also for that instead of 
>> swap_possible()?
>
> You should already have that. eviction_valuable is called in both cases.
>
Hmm. I can only see it called from ttm_mem_evict_first() which is not in 
the swapping path? Or do I miss something?

Thanks,

Thomas



