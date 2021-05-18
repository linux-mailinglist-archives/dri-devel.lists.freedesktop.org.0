Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4F387C65
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDF36EBB7;
	Tue, 18 May 2021 15:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70EF6EBB7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:25:20 +0000 (UTC)
IronPort-SDR: cxLOgP0rQ/W9hQIVbZrbPObMkAWflGuyr7ajqG1S2+J+4z7hPnEh7+Yuo6tR3pNXdT9oB/pbsJ
 NFNymoniQ/vg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="187864586"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="187864586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:25:17 -0700
IronPort-SDR: glDsZki0zdhzZasVW36AueZpSt1Cd8470v8H9a5ce/0tgEUprKZi6WnZdyItec3U/emonwEByE
 FBrAo8210NEg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439085183"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 08:25:16 -0700
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
 <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <07c9239c-1d72-26d8-4fe3-378bf826bae2@linux.intel.com>
Date: Tue, 18 May 2021 17:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 5:17 PM, Christian König wrote:
>
>
> Am 18.05.21 um 17:11 schrieb Thomas Hellström:
>>
>> On 5/18/21 5:07 PM, Christian König wrote:
>>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>
>>>> This allows other drivers that may not setup the vma in the same way
>>>> to use the ttm bo helpers.
>>>
>>> Uff can you please explain why exactly you need that?
>>>
>>> Providing the BO is not much of a problem, but having the BO at 
>>> different VMA offsets is really a no-go with TTM.
>>>
>>> Christian.
>>
>> The current i915 uapi is using different offsets for different 
>> caching :/. We're currently working around that by using 
>> ttm_bo_type_kernel (no TTM vma offset at all) and i915's offset.
>
> Can you instead adjust the offset in the mmap callback like we do for 
> dma-buf?
Will have to take a look.
>
> That's really a no-go what you describe here because it will mess up 
> reverse mapping lockup for buffer movement.

You mean the unmap_mapping_range() stuff? That's not a problem since 
it's a NOP for kernel ttm buffers, and the i915 move() / swap_notify() 
takes care of killing the ptes.

While we're in the process of killing that offset flexibility for 
discrete, we can't do so for older hardware unfortunately.

/Thomas


>
> Christian.



>
>>
>> /Thomas
>>
>
