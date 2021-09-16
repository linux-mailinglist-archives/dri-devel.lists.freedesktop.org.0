Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BAC40D702
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CFE6EB44;
	Thu, 16 Sep 2021 10:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27E66EB44;
 Thu, 16 Sep 2021 10:06:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="283528581"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="283528581"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:06:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="434444198"
Received: from mkrygin-mobl1.ccr.corp.intel.com (HELO [10.249.254.218])
 ([10.249.254.218])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:06:36 -0700
Subject: Re: [PATCH v3 06/12] drm/ttm: add TTM_PAGE_FLAG_EXTERNAL_MAPPABLE
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-6-matthew.auld@intel.com>
 <00e355ba-fa5a-945e-d9ea-48260a2c56ae@amd.com>
 <7548b96f116883a4f0db6a6d82c3023488761ea4.camel@linux.intel.com>
 <f14ae06d-63a0-9ac2-7623-9fa3140d2de6@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <6fe3ca40-339b-04cc-a156-925b5ca433d6@linux.intel.com>
Date: Thu, 16 Sep 2021 12:06:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f14ae06d-63a0-9ac2-7623-9fa3140d2de6@intel.com>
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


On 9/16/21 11:58 AM, Matthew Auld wrote:
> On 16/09/2021 10:03, Thomas Hellström wrote:
>> On Thu, 2021-09-16 at 08:55 +0200, Christian König wrote:
>>>
>>>
>>> Am 15.09.21 um 20:59 schrieb Matthew Auld:
>>>> In commit:
>>>>
>>>> commit 667a50db0477d47fdff01c666f5ee1ce26b5264c
>>>> Author: Thomas Hellstrom <thellstrom@vmware.com>
>>>> Date:   Fri Jan 3 11:17:18 2014 +0100
>>>>
>>>>       drm/ttm: Refuse to fault (prime-) imported pages
>>>>
>>>> we introduced the restriction that imported pages should not be
>>>> directly
>>>> mappable through TTM(this also extends to userptr). In the next
>>>> patch we
>>>> want to introduce a shmem_tt backend, which should follow all the
>>>> existing rules with TTM_PAGE_FLAG_EXTERNAL, since it will need to
>>>> handle
>>>> swapping itself, but with the above mapping restriction lifted.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 6 ++++--
>>>>    include/drm/ttm/ttm_tt.h        | 7 +++++++
>>>>    2 files changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> index 708390588c7c..fd6e18f12f50 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -163,8 +163,10 @@ vm_fault_t ttm_bo_vm_reserve(struct
>>>> ttm_buffer_object *bo,
>>>>           * (if at all) by redirecting mmap to the exporter.
>>>>           */
>>>>          if (bo->ttm && (bo->ttm->page_flags &
>>>> TTM_PAGE_FLAG_EXTERNAL)) {
>>>> -               dma_resv_unlock(bo->base.resv);
>>>> -               return VM_FAULT_SIGBUS;
>>>> +               if (!(bo->ttm->page_flags &
>>>> TTM_PAGE_FLAG_EXTERNAL_MAPPABLE)) {
>>
>> I saw there was previously a thought about testing for ttm_bo_type_sg
>> here. Was that a dead end?
>
> I guess the issue was userptr, which is also EXTERNAL and needs to be 
> rejected here, but underneath it's not type_sg.


OK, I thought userptr was using type_sg. I wonder what it's for if 
that's not the case...


>
> Just having an explicit MAPPABLE flag or similar seemed the more 
> flexible approach? Happy to try out other ideas.
>
I'm fine with a flag as well.

/Thomas


