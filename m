Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045654B228F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16EA10EA63;
	Fri, 11 Feb 2022 09:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9E10EA5F;
 Fri, 11 Feb 2022 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644573362; x=1676109362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bvISd1/VQzn9n4lZa/xFlrAsJCUH7rmN0mppYWW3+H4=;
 b=PPKWcWUeLC2pvmd8x4A7wmf0+73+l5OtXcl66y/g7MRQ0IQLop4r5wRc
 D7xpHPwL/kaQbbacc558s9uVS7awHnFoLyE7b6o7m4CVg4velA0AQsp5J
 J8Tovj3Alanpon3WMbpupqZ2LOSOrgYAiBNeB3vJuRDPROjuzV+StK3LL
 JERya6SfrNacoGxjiV8uMk0EVbGUgnV2yMeVyWawdNh0USRFNFaP30VPy
 Dyom8PdN5a5/jpbsz3kNCMLi4DJwnbLjrliY1XvjayasQD5vjT5xedOH3
 Lw0Wdim2p5FVAPUDNxKdh8b5oTOGjzuJcg3TnWQ3L5xkLZPTnSwbZH8It w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247295398"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="247295398"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:56:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774200082"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:56:00 -0800
Message-ID: <45a64b08-1a7e-117f-fd20-e5c4a15f8d7c@linux.intel.com>
Date: Fri, 11 Feb 2022 10:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v2 12/15] drm/i915/create: apply
 ALLOC_GPU_ONLY by default
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-13-matthew.auld@intel.com>
 <e4f128ad-1738-cee7-6790-fbdbb6d5698d@linux.intel.com>
 <CAM0jSHM8+KBAN2iMM7L+9HUKuTodH5u32o4XgGZbv8fvUrn67g@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHM8+KBAN2iMM7L+9HUKuTodH5u32o4XgGZbv8fvUrn67g@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/22 10:52, Matthew Auld wrote:
> On Fri, 11 Feb 2022 at 09:49, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>>
>> On 2/10/22 13:13, Matthew Auld wrote:
>>> Starting from DG2+, when dealing with LMEM, we assume that by default
>>> all userspace allocations should be placed in the non-mappable portion
>>> of LMEM.  Note that dumb buffers are not included here, since these are
>>> not "GPU accelerated" and likely need CPU access.
>>>
>>> In a later patch userspace will be able to provide a hint if CPU access
>>> to the buffer is needed.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_create.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> index 9402d4bf4ffc..cc9ddb943f96 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> @@ -424,6 +424,15 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>>>                ext_data.n_placements = 1;
>>>        }
>>>
>>> +     /*
>>> +      * TODO: add a userspace hint to force CPU_ACCESS for the object, which
>>> +      * can override this.
>>> +      */
>>> +     if (!IS_DG1(i915) && (ext_data.n_placements > 1 ||
>>> +                           ext_data.placements[0]->type !=
>>> +                           INTEL_MEMORY_SYSTEM))
>>> +             ext_data.flags |= I915_BO_ALLOC_GPU_ONLY;
>>> +
>> WRT previous review comment here, it would be easier to follow if the bo
>> was marked as a GPU only buffer regardless. Then for example capture and
>> other functions where it actually matters can choose to take action
>> based on, for example, whether the BAR is restricted or not?
> Yeah, I completely forgot about this, sorry. Will fix now.

Actually you did reply, but I forgot to reply to that :).

/Thomas


