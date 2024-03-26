Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F77A88C18C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 13:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053D510E36E;
	Tue, 26 Mar 2024 12:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEj5cTLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03610E36E;
 Tue, 26 Mar 2024 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711454779; x=1742990779;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VMOQQWQ8zlA4KMRdap0GxAhv5vGKeo6xRzJmQ3DuzK4=;
 b=OEj5cTLQptpqtSoWiY+ht8s2R+4CdeLMBv7/7o+yxlsF35pR9IVDxg+Q
 AxOuiLjqXMqtgiWNVWXKTq67XPTFY/3JdMfcWL8WSlj6aV9ExvHEkI/ry
 s0QgYIJi/KYhui/6p+I/b2ujsPWg0GixDwbIQIZwLwC8Tevwdkcf+FD0e
 KwMnITD7ljBUlzkXXItvDmDa8BTLteopJzfrkh2EKmN3V54NnGer2h22d
 AZmAgch8y0CHyY2ptG9s97wYFYOrqCaj1zpT1U2L58lIG7QnVPD/kCNAQ
 QTQQfCy+eCHrodDArEqZtMoQs+MeLJOmDH6s9OOZGmIQKUwZ8gjmbxDkt g==;
X-CSE-ConnectionGUID: qKm1MrcGRmukf9VrL1958w==
X-CSE-MsgGUID: wNBV4AUTQNmDFedrOoC+nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17229270"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17229270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="15928553"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.33])
 ([10.246.52.33])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:05:39 -0700
Message-ID: <49e4ab49-e928-475a-bbaf-19c9009fdd1f@linux.intel.com>
Date: Tue, 26 Mar 2024 13:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gem: Calculate object page offset for partial
 memory mapping
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
References: <20240325134033.287913-1-andi.shyti@linux.intel.com>
 <db2627fa-b1da-4a27-8c87-bebe0407d8a7@linux.intel.com>
 <ZgKttR-loIoAZoOE@ashyti-mobl2.lan>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZgKttR-loIoAZoOE@ashyti-mobl2.lan>
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

Hi Andi,

On 3/26/2024 12:12 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> ...
>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> index a2195e28b625..57a2dda2c3cc 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>> @@ -276,7 +276,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
>>>    	/* PTEs are revoked in obj->ops->put_pages() */
>>>    	err = remap_io_sg(area,
>>>    			  area->vm_start, area->vm_end - area->vm_start,
>>> -			  obj->mm.pages->sgl, iomap);
>>> +			  obj->mm.pages->sgl, 0, iomap);
>> Why don't we need partial mmap for CPU but only for GTT ?
> As far as I understood we don't. I have a version with the CPU
> offset as well in trybot[*]
>
> But without support for segmented buffer objects, I don't know
> how much this has any effect.

You confused me more :) Why segmented buffer object is needed for 
partial CPU mmap but not for GTT  ?

 From high level,  GTT and CPU both should support partial mmap unless I 
missing something here.

>
>> Sounds like this also need to be cover by a IGT tests.
> Yes, I it does need some igt work, working on it.
>
>> Don't we need "Fixes" tag for this?
> Why should we? I'm not fixing anything here,

If userspace  expects partial mmap to work then this is a bug/gap in 
i915 so we need to

backport this as far as possible. Need some information about the 
requirement about  why we need this patch suddenly?


Regards,

Nirmoy

>   I'm just
> recalculating the mapping not starting from the beginning of the
> scatter page.
>
> Andi
>
> [*] https://patchwork.freedesktop.org/patch/584474/?series=131539&rev=2
