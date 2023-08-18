Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9772780671
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E0110E471;
	Fri, 18 Aug 2023 07:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AA310E471;
 Fri, 18 Aug 2023 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692344183; x=1723880183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0eRTsZnod6/XUsAMMIMDypKmUjwzNPcmz88fgm4IVVc=;
 b=Xj99BPujn9iks3Cx/Pho6fEre/6rLP77Xn3vkzqfEd/fenePc0g2XDv/
 ojqmEBjuiM5odDxn8GOPdh5t4ZgaG3a8OPDCuwXwkX4YjamJsmmhg5DEw
 uiipvWsrDr4G9ZfMe9AdsnlkxJpaa193p9MDwtxVRTans2diPYs3Q+Z/1
 ybJwrjyIe5/Gll3VCB75rDZG51a8gh7Jc/XHFVzlU3MBszBcIoHGDkwJZ
 UIk6+pdTZxkrvOmgWcVroBUFOkrPlznYBMC+vOdSBIks3ZFypogpPVXxA
 mO/bqUGPoCDhD20HiXxf1zbXk47lD3reZ6Pitp1kevoQNOeESsjUg80ns Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376794958"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="376794958"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 00:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="738039708"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="738039708"
Received: from fatinf5x-mobl.gar.corp.intel.com (HELO [10.249.254.194])
 ([10.249.254.194])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 00:36:19 -0700
Message-ID: <7e655c2b-211f-6ea0-9dc1-feb0131a90e4@linux.intel.com>
Date: Fri, 18 Aug 2023 09:36:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Dave Airlie <airlied@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/17/23 04:12, Zeng, Oak wrote:
>> -----Original Message-----
>> From: Dave Airlie <airlied@gmail.com>
>> Sent: August 16, 2023 6:52 PM
>> To: Felix Kuehling <felix.kuehling@amd.com>
>> Cc: Zeng, Oak <oak.zeng@intel.com>; Christian König
>> <christian.koenig@amd.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com;
>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Welty,
>> Brian <brian.welty@intel.com>; Philip Yang <Philip.Yang@amd.com>; intel-
>> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: Re: Implement svm without BO concept in xe driver
>>
>> On Thu, 17 Aug 2023 at 08:15, Felix Kuehling <felix.kuehling@amd.com> wrote:
>>> On 2023-08-16 13:30, Zeng, Oak wrote:
>>>> I spoke with Thomas. We discussed two approaches:
>>>>
>>>> 1) make ttm_resource a central place for vram management functions such as
>> eviction, cgroup memory accounting. Both the BO-based driver and BO-less SVM
>> codes call into ttm_resource_alloc/free functions for vram allocation/free.
>>>>       *This way BO driver and SVM driver shares the eviction/cgroup logic, no
>> need to reimplment LRU eviction list in SVM driver. Cgroup logic should be in
>> ttm_resource layer. +Maarten.
>>>>       *ttm_resource is not a perfect match for SVM to allocate vram. It is still a
>> big overhead. The *bo* member of ttm_resource is not needed for SVM - this
>> might end up with invasive changes to ttm...need to look into more details
>>> Overhead is a problem. We'd want to be able to allocate, free and evict
>>> memory at a similar granularity as our preferred migration and page
>>> fault granularity, which defaults to 2MB in our SVM implementation.
>>>
>>>
>>>> 2) svm code allocate memory directly from drm-buddy allocator, and expose
>> memory eviction functions from both ttm and svm so they can evict memory
>> from each other. For example, expose the ttm_mem_evict_first function from
>> ttm side so hmm/svm code can call it; expose a similar function from svm side so
>> ttm can evict hmm memory.
>>> I like this option. One thing that needs some thought with this is how
>>> to get some semblance of fairness between the two types of clients.
>>> Basically how to choose what to evict. And what share of the available
>>> memory does each side get to use on average. E.g. an idle client may get
>>> all its memory evicted while a busy client may get a bigger share of the
>>> available memory.
>> I'd also like to suggest we try to write any management/generic code
>> in driver agnostic way as much as possible here. I don't really see
>> much hw difference should be influencing it.
>>
>> I do worry about having effectively 2 LRUs here, you can't really have
>> two "leasts".
>>
>> Like if we hit the shrinker paths who goes first? do we shrink one
>> object from each side in turn?
> One way to solve this fairness problem is to create a driver agnostic drm_vram_mgr. Maintain a single LRU in drm_vram_mgr. Move the memory eviction/cgroups memory accounting logic from ttm_resource manager to drm_vram_mgr. Both BO-based driver and SVM driver calls to drm_vram_mgr to allocate/free memory.
>
> I am not sure whether this meets the 2M allocate/free/evict granularity requirement Felix mentioned above. SVM can allocate 2M size blocks. But BO driver should be able to allocate any arbitrary sized blocks - So the eviction is also arbitrary size.

This is not far from what a TTM resource manager does with TTM 
resources, only made generic at the drm level, and making the "resource" 
as lean as possible. With 2M granularity this seems plausible.

>
>> Also will we have systems where we can expose system SVM but userspace
>> may choose to not use the fine grained SVM and use one of the older
>> modes, will that path get emulated on top of SVM or use the BO paths?
>
> If by "older modes" you meant the gem_bo_create (such as xe_gem_create or amdgpu_gem_create), then today both amd and intel implement those interfaces using BO path. We don't have a plan to emulate that old mode on tope of SVM, afaict.

I think we might end up emulating "older modes" on top of SVM at some 
point, not to far out, although what immediately comes to mind would be 
eviction based on something looking like NUMA- and CGROUP aware 
shrinkers for integrated bo drivers if that turns out to be sufficient 
from a memory usage starvation POW. This is IMHO indeed something to 
start thinking about, but for the current situation trying to solve a 
mutual SVM-TTM fair eviction problem would be a reasonable scope.

Thanks,

Thomas


>
> Thanks,
> Oak
>
>> Dave.
