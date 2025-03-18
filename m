Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67440A66EB2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5507B10E110;
	Tue, 18 Mar 2025 08:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBHRJ8Ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B164A10E110;
 Tue, 18 Mar 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742287494; x=1773823494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LCGb8nOdCjr4hmPDVbY/evwW2QDr+05zETiYk0YnSJE=;
 b=LBHRJ8Ievzh2RdPkJ/uqBX6T8yv/bW3zno+OZWKEuTYXw3q2dx3OCIi8
 KlwpjUDfPEpAxNCVJLDw1Xb77sxfMhEO1sGQzbEe9ncrVqA9nXkgQJBXB
 DDiwJKh90OtHrTqw1aeVZhgYf5u4L3WcYXHZbTjwSpK5CsyJL3Kl+Dgwm
 T3DNhXfW7zLZ+wGo4SBC+ckU2GOdqZ16r8465rBCagBPoJIX/0yNYiSaj
 DCBjX1+gKPbOO0nwo+uUQX1inmyEBQdbF5TKd9glIBeQ65tbJtFVyJhJP
 JbjPcZ5q26hIJ1Y+13mP6Hjr2IGG2vDLQlmvaXxgZSjI9Uso+ntarz2nr Q==;
X-CSE-ConnectionGUID: C595ElzVS4qPgju2WWA/6Q==
X-CSE-MsgGUID: E8NfXOTjSL2rLnkbbswT2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43151296"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43151296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 01:44:54 -0700
X-CSE-ConnectionGUID: deyJWIYbTEGFyt6P35MiIg==
X-CSE-MsgGUID: KpnCYxbwSGmo5gIwkKKbkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="127038201"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 18 Mar 2025 01:44:51 -0700
Received: from [10.245.252.130] (unknown [10.245.252.130])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4E75133BE9;
 Tue, 18 Mar 2025 08:44:50 +0000 (GMT)
Message-ID: <06a037a2-c75f-4e87-8bfc-589c7b2b919b@intel.com>
Date: Tue, 18 Mar 2025 09:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-3-jonathan.cavitt@intel.com>
 <9d85d2bb-1f64-4d6c-9982-a2d23cbbac32@intel.com>
 <CH0PR11MB5444E03A221293476A9DC295E5D22@CH0PR11MB5444.namprd11.prod.outlook.com>
 <3c506ee2-7a1a-46ce-b4ff-4d774c87431f@intel.com>
 <CH0PR11MB54449FFE4835496CC59D62B4E5DF2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54449FFE4835496CC59D62B4E5DF2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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



On 17.03.2025 21:55, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Saturday, March 15, 2025 7:45 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; michal.mzorek@intel.com
> Subject: Re: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to header
>>
>> On 14.03.2025 23:06, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
>>> Sent: Friday, March 14, 2025 10:02 AM
>>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
>>> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; michal.mzorek@intel.com
>>> Subject: Re: [PATCH v8 2/6] drm/xe/xe_gt_pagefault: Move pagefault struct to header
>>>>
>>>> On 13.03.2025 19:34, Jonathan Cavitt wrote:
>>>>> Move the pagefault struct from xe_gt_pagefault.c to the
>>>>> xe_gt_pagefault_types.h header file, along with the associated enum values.
>>>>>
>>>>> v2:
>>>>> - Normalize names for common header (Matt Brost)
>>>>>
>>>>> v3:
>>>>> - s/Migrate/Move (Michal W)
>>>>> - s/xe_pagefault/xe_gt_pagefault (Michal W)
>>>>> - Create new header file, xe_gt_pagefault_types.h (Michal W)
>>>>> - Add kernel docs (Michal W)
>>>>>
>>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>>>>> ---
>>>>
>>>> ...
>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>>> index 839c065a5e4c..69b700c4915a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
>>>>> @@ -8,6 +8,8 @@
>>>>>  
>>>>>  #include <linux/types.h>
>>>>>  
>>>>> +#include "xe_gt_pagefault_types.h"
>>>>
>>>> it's not needed here, move it to .c
>>>>
>>>>> +
>>>>>  struct xe_gt;
>>>>>  struct xe_guc;
>>>>>  
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>>>> new file mode 100644
>>>>> index 000000000000..90b7085d4b8e
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
>>>>> @@ -0,0 +1,67 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright (c) 2022-2025 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
>>>>> +#define _XE_GT_PAGEFAULT_TYPES_H_
>>>>> +
>>>>
>>>> don't forget to
>>>>
>>>> #include <linux/types.h>
>>>
>>> That explains why the kernel failed to compile on CI.  It was compiling just
>>> fine locally, so that's why I missed this.
>>>
>>>>
>>>>> +/**
>>>>> + * struct xe_gt_pagefault - Structure of pagefaults returned by the
>>>>> + * pagefault handler
>>>>> + */
>>>>> +struct xe_gt_pagefault {
>>>>> +	/** @page_addr: faulted address of this pagefault */
>>>>> +	u64 page_addr;
>>>>> +	/** @asid: ASID of this pagefault */
>>>>> +	u32 asid;
>>>>> +	/** @pdata: PDATA of this pagefault */
>>>>> +	u16 pdata;
>>>>> +	/** @vfid: VFID of this pagefault */
>>>>> +	u8 vfid;
>>>>
>>>> btw, IIRC the VFID from the descriptor will be zero'ed
>>>> does it make sense to keep it here?
>>>
>>> Is the argument that every time pf->vfid is accessed, it's guaranteed to be
>>
>> it's FIELD_GET(PFD_VFID, desc->dw2) guaranteed to be zero
>>
>>> zero?  I can't counter that claim, but wouldn't it be safer to keep reporting
>>> the VFID in case we ever hit a case where it's no longer zero?
>>
>> it can't be non-zero, look at GuC ABI spec that says:
>>
>> ".. with the VF number being zero’d out in the descriptor."
>>
>>>
>>> Also, did we know it would always be zero when we were making the
>>> pagefault struct originally?  If so, why did we include the vfid originally?
>>
>> dunno, ask authors, it was pushed part of the initial commit
>> dd08ebf6c352 that was *not* going through normal review cycle
>>
>>>
>>>>
>>>>> +	/**
>>>>> +	 * @access_type: access type of this pagefault, as a value
>>>>> +	 * from xe_gt_pagefault_access_type
>>>>> +	 */
>>>>> +	u8 access_type;
>>>>> +	/**
>>>>> +	 * @fault_type: fault type of this pagefault, as a value
>>>>> +	 * from xe_gt_pagefault_fault_type
>>>>> +	 */
>>>>> +	u8 fault_type;
>>>>> +	/** @fault_level: fault level of this pagefault */
>>>>> +	u8 fault_level;
>>>>> +	/** @engine_class: engine class this pagefault was reported on */
>>>>> +	u8 engine_class;
>>>>> +	/** @engine_instance: engine instance this pagefault was reported on */
>>>>> +	u8 engine_instance;
>>>>> +	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
>>>>> +	u8 fault_unsuccessful;
>>>>> +	/** @prefetch: unused */
>>>>> +	bool prefetch;
>>>>> +	/** @trva_fault: is set if this is a TRTT fault */
>>>>> +	bool trva_fault;
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * enum xe_gt_pagefault_access_type - Access type reported to the xe_gt_pagefault
>>>>> + * struct.  Saved to xe_gt_pagefault@access_type
>>>>
>>>> this seems to be copied from G2H descriptor as-is.
>>>> so shouldn't this be part of the GuC ABI?
>>>> or based on HW ABI if GuC is just a proxy
>>>
>>> What information should I be including in the kernel docs for these enums?
>>
>> are you asking about xe enums or GuC ABI defs/enums?
>>
>> for the xe enums, we can say this is what HW/GuC provides
>> for the HW defs, we can likely drop kernel-doc
>> we can just point to the Bspec in the commit msg
> 
> Could you please provide the bspec number for the pagefault
> access and fault types?  I tried searching for them on my end but
> wasn't able to find them.

try this one

Bspec: 77412

> -Jonathan Cavitt
> 
>>
>>> -Jonathan Cavitt
>>>
>>>>
>>>>> + */
>>>>> +enum xe_gt_pagefault_access_type {
>>>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_READ = 0,
>>>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
>>>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
>>>>> +	XE_GT_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * enum xe_gt_pagefault_fault_type - Fault type reported to the xe_gt_pagefault
>>>>> + * struct.  Saved to xe_gt_pagefault@fault_type
>>>>
>>>> ditto
>>>>
>>>>> + */
>>>>> +enum xe_gt_pagefault_fault_type {
>>>>> +	XE_GT_PAGEFAULT_TYPE_NOT_PRESENT = 0,
>>>>> +	XE_GT_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
>>>>> +	XE_GT_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
>>>>> +};
>>>>> +
>>>>> +#endif
>>>>
>>>>
>>
>>

