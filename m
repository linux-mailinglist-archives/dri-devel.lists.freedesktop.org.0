Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40AE4679BD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 15:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4117ABD7;
	Fri,  3 Dec 2021 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F607ABD6;
 Fri,  3 Dec 2021 14:50:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="235718410"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="235718410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:50:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="597998255"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 06:50:16 -0800
Message-ID: <96eca78d-2b92-cce0-0aee-2d5f72c26bdf@linux.intel.com>
Date: Fri, 3 Dec 2021 15:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
 <f8f1500c-170d-ccf9-ac2d-1484bbdc587e@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <f8f1500c-170d-ccf9-ac2d-1484bbdc587e@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/3/21 15:26, Christian König wrote:
> [Adding Daniel here as well]
>
> Am 03.12.21 um 15:18 schrieb Thomas Hellström:
>> [SNIP]
>>> Well that's ok as well. My question is why does this single dma_fence
>>> then shows up in the dma_fence_chain representing the whole
>>> migration?
>> What we'd like to happen during eviction is that we
>>
>> 1) await any exclusive- or moving fences, then schedule the migration
>> blit. The blit manages its own GPU ptes. Results in a single fence.
>> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
>> fences.
>> 3) Most but not all of the remaining resv shared fences will have been
>> finished in 2) We can't easily tell which so we have a couple of shared
>> fences left.
>
> Stop, wait a second here. We are going a bit in circles.
>
> Before you migrate a buffer, you *MUST* wait for all shared fences to 
> complete. This is documented mandatory DMA-buf behavior.
>
> Daniel and I have discussed that quite extensively in the last few month.
>
> So how does it come that you do the blit before all shared fences are 
> completed?

Well we don't currently but wanted to... (I haven't consulted Daniel in 
the matter, tbh).

I was under the impression that all writes would add an exclusive fence 
to the dma_resv. If that's not the case or this is otherwise against the 
mandatory DMA-buf bevhavior, we can certainly keep that part as is and 
that would eliminate 3).

/Thomas

