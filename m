Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A9433EDF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7B76E1D2;
	Tue, 19 Oct 2021 18:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12A96E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:59:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215525407"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="215525407"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 11:56:28 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="444014004"
Received: from zhangdi2-mobl.ccr.corp.intel.com (HELO [10.249.254.78])
 ([10.249.254.78])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 11:56:25 -0700
Message-ID: <814bbcb0-2942-5ded-0352-e7c67ebceca5@linux.intel.com>
Date: Tue, 19 Oct 2021 20:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/ttm: Do not put non-struct page memory into PUD/PMDs
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com>
 <616958c2-8dc2-e8f0-4421-eddc7e4f9d5e@linux.intel.com>
 <20211019185208.GY2744544@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211019185208.GY2744544@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/19/21 20:52, Jason Gunthorpe wrote:
> On Tue, Oct 19, 2021 at 08:49:29PM +0200, Thomas Hellström wrote:
>> Hi,
>>
>> On 10/19/21 20:21, Jason Gunthorpe wrote:
>>> PUD and PMD entries do not have a special bit.
>>>
>>> get_user_pages_fast() considers any page that passed pmd_huge() as
>>> usable:
>>>
>>> 		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
>>> 			     pmd_devmap(pmd))) {
>>>
>>> And vmf_insert_pfn_pmd_prot() unconditionally sets
>>>
>>> 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>>>
>>> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
>>>
>>> As such gup_huge_pmd() will try to deref a struct page:
>>>
>>> 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
>>>
>>> and thus crash.
>>>
>>> Prevent this by never using IO memory with vmf_insert_pfn_pud/pmd_prot().
>> Actually I think if fast gup will break even page backed memory since the
>> backing drivers don't assume anybody else takes a refcount / pincount.
>> Normal pages have PTE_SPECIAL and VM_PFNMAP to block that.
> Erk, yes, that is even worse.
>
>> (Side note I was recommended to introduce a PTE_HUGESPECIAL bit for
>> this and basically had  a patch ready but got scared off when trying
>> to handle 64-bit PTE atomic updates on x86-32)
> Right, a PMD_SPECIAL bit is needed to make this work.
Yes, PMD_SPECIAL it was :)
>
>> It might be that we (Intel) try to resurrect this code using
>> PTE_HUGESPECIAL in the near future for i915, but until that, I think
>> it's the safest option to disable it completely.
> Okay, do you want a patch to just delete this function?

That'd be great.

Thanks,

Thomas


>
> Jason
