Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960879AADC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 20:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566F710E058;
	Mon, 11 Sep 2023 18:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248FB10E058;
 Mon, 11 Sep 2023 18:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694457471; x=1725993471;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ocrIL0ZlmVpB256Jk07u6tj77vPtfJwjxZjpXnxO1+4=;
 b=BvI6+kaRd9Tyitxa5ngvzWBm1CGOFhFP+sIO5gKs5im+UzpvG8Gf5q+x
 N+si2X+feZho7chCQKE0bA1smZo4qZ4BOS94KajmlgDq8thzlhyoPIzdp
 xLgtntdu9sZ49O7FvHna14Bmj7A6yoKHm221fMAqbkPpmC4oadVSNJZ7d
 j7BF1bjmCYJp2ODiANQ+WCww5zchDhw6s7BE+pb+ckQGUi2qfOBhSYxJT
 j9IURms9umhlrsimLT5werVJNOFIN6IYmFj1UE2CRNujikRJJFUacloxK
 cw7f+JqFVMK9IDM9bw6+CI1mVuvxK7sJTfdm3BQQ5Ylgms4L6s22sBflE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377080345"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377080345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 11:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="867051091"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="867051091"
Received: from lbinmo2x-mobl1.gar.corp.intel.com (HELO [10.249.254.187])
 ([10.249.254.187])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 11:37:46 -0700
Message-ID: <f7276c96-7295-d3ac-a838-23924876b48a@linux.intel.com>
Date: Mon, 11 Sep 2023 20:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-6-dakr@redhat.com>
 <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
 <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/11/23 19:49, Danilo Krummrich wrote:
> Hi Thomas,
>
> On 9/11/23 19:19, Thomas Hellström wrote:
>> Hi, Danilo
>>
>> On 9/9/23 17:31, Danilo Krummrich wrote:
>>> This patch adds an abstraction layer between the drm_gpuva mappings of
>>> a particular drm_gem_object and this GEM object itself. The abstraction
>>> represents a combination of a drm_gem_object and drm_gpuvm. The
>>> drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
>>> representing this abstraction), while each drm_gpuvm_bo contains 
>>> list of
>>> mappings of this GEM object.
>>>
>>> This has multiple advantages:
>>>
>>> 1) We can use the drm_gpuvm_bo structure to attach it to various lists
>>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>>     objects per VM, which is introduced in subsequent patches.
>>>
>>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>>     drm_gpuvm becomes much cheaper.
>>>
>>> 3) Drivers can derive and extend the structure to easily represent
>>>     driver specific states of a BO for a certain GPUVM.
>>>
>>> The idea of this abstraction was taken from amdgpu, hence the credit 
>>> for
>>> this idea goes to the developers of amdgpu.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>
>> Did you consider having the drivers embed the struct drm_gpuvm_bo in 
>> their own bo definition? I figure that would mean using the gem bo's 
>> refcounting and providing a helper to call from the driver's bo 
>> release. Looks like that could potentially save a lot of code? Or is 
>> there something that won't work with that approach?
>
> There are drm_gpuvm_ops::vm_bo_alloc and drm_gpuvm_ops::vm_bo_free 
> callback for drivers to register for that purpose.

Ah OK. Thanks, I'll take a deeper look.

/Thomas


>
> - Danilo
>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>
