Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0FB79C868
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252D10E3A3;
	Tue, 12 Sep 2023 07:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A3F10E3A2;
 Tue, 12 Sep 2023 07:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694504570; x=1726040570;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PiPVESGjz4+9B3CmXHVRHfqH0RQNO7dsFUqM+loKVOM=;
 b=O112YdF4B8sgWFsriIqrfXWFBY7re3Xs/+0KM1TTEXQZp7edh+lz+KI+
 n1m1NLoTupG/1hxZkp0c0pI4fxzlnC5kUSaDXE95K/Cn92a33KQKvzS8J
 2Nb4ezBwCTBCCdTkksCKljW+yv8rHY3a+u/Z887n6Rei0Q/dEY8ZWU4yd
 HOQxBWkIeBHl4hw+N0mfdGEdIDKtCNv5QCt8jI76qsZcEsjXYZ17AUDaO
 7d+fiKqSxOtEGIeiXMI+Vi+iiIt2iAbSRqVvkkaxXMP0W6pUQBLH0csHL
 G0mmxbTP2O+2NuZ5+Yqk69h3Stcsg9YxWKSojbkPKC6dWWEeQUJr1JHuJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368558729"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="368558729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 00:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886858762"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; d="scan'208";a="886858762"
Received: from dhermamx-mobl1.amr.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 00:42:20 -0700
Message-ID: <05b06e5d-03aa-14f4-46b1-6057c4437043@linux.intel.com>
Date: Tue, 12 Sep 2023 09:42:44 +0200
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

Hi, Danilo

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
>
> - Danilo

Now after looking a bit deeper, I think actually the question could be 
rephrased as, why don't we just use the
struct drm_gem_object::gpuva struct as the drm_gpuvm_bo in the spirit of 
keeping things simple? Drivers would then just embed it in their bo 
subclass and we'd avoid unnecessary fields in the struct drm_gem_object 
for drivers that don't do VM_BIND yet.

Sure, this won't be per bo and per vm, but it'd really only make a 
slight difference where we have multiple VMAs per bo, where per-vm 
per-bo state either needs to be duplicated or attached to a single vma 
(as in the case of the external bo list).

To me that looks like a substantial amount of less code / complexity?

/Thomas


>
>>
>> Thanks,
>>
>> Thomas
>>
>>
>
