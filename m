Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854C8A2BBC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 12:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAA10ECD1;
	Fri, 12 Apr 2024 10:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KH6DsjiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B310ECD1;
 Fri, 12 Apr 2024 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712916106; x=1744452106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=n5UIGDnGAnQhmspgpvLN1L4/vpZPbUm9S+DnELtT/rA=;
 b=KH6DsjiMrGmanF1OoByJTDKT61PMa5qxffTyR6gH/B0DLxz0TKzLNGS0
 O8zrBOvNe1t90f5U3aWpTwR1Uo6+lD3N5t3YQk3CtkUJEmRDrsAGvNmIT
 g4cvPl1qFx+F4xZJdr1LzjE8+5p7n9nuvbW53ar2DsLBZTDDi1WP6TPj2
 Tk79pX7yv+SIPAQTORxUAOBC2JKTwxKq6vhqNQ8u22wot+JDcfDiciS9r
 G9DPYCrh7Sr05D6dkL43s9ivzdCc7ZsaAoKgvLYIhimOKFjvoyAkIbh1O
 4R9cDxQ7ZatFkeNulnlgQ3Twfq3SoIodGyixRmoHfdrevOd+Na8dOdzcX g==;
X-CSE-ConnectionGUID: h6h0vO2kS963cbKBqzBuug==
X-CSE-MsgGUID: YoHgOWY+RmeHkJtr2P8cmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18922743"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="18922743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:01:45 -0700
X-CSE-ConnectionGUID: IlXeGO8KSAa7B1wu4RcR3g==
X-CSE-MsgGUID: gqWz5/k8RZ2rNOlwnX4DQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52161505"
Received: from mohdaris-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.252.61.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 03:01:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Steven Price <steven.price@arm.com>, Andrew Morton
 <akpm@linux-foundation.org>, David Laight <David.Laight@ACULAB.COM>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Gow
 <davidgow@google.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: Re: [PATCH 0/4] log2: make is_power_of_2() more generic
In-Reply-To: <8905800b-a977-e821-01ea-a43333f46904@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230330104243.2120761-1-jani.nikula@intel.com>
 <20230330125041.83b0f39fa3a4ec1a42dfd95f@linux-foundation.org>
 <549987e4967d45159573901d330c96a0@AcuMS.aculab.com>
 <20230330151846.fdbc8edbfbaa6eaddb056dc7@linux-foundation.org>
 <87edp52ufk.fsf@intel.com> <8905800b-a977-e821-01ea-a43333f46904@arm.com>
Date: Fri, 12 Apr 2024 13:01:36 +0300
Message-ID: <87jzl2527z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 05 Apr 2023, Steven Price <steven.price@arm.com> wrote:
> On 31/03/2023 09:31, Jani Nikula wrote:
>> On Thu, 30 Mar 2023, Andrew Morton <akpm@linux-foundation.org> wrote:
>>> On Thu, 30 Mar 2023 21:53:03 +0000 David Laight <David.Laight@ACULAB.COM> wrote:
>>>
>>>>> But wouldn't all these issues be addressed by simply doing
>>>>>
>>>>> #define is_power_of_2(n) (n != 0 && ((n & (n - 1)) == 0))
>>>>>
>>>>> ?
>>>>>
>>>>> (With suitable tweaks to avoid evaluating `n' more than once)
>>>>
>>>> I think you need to use the 'horrid tricks' from min() to get
>>>> a constant expression from constant inputs.
>>>
>>> This
>>>
>>> --- a/include/linux/log2.h~a
>>> +++ a/include/linux/log2.h
>>> @@ -41,11 +41,11 @@ int __ilog2_u64(u64 n)
>>>   * *not* considered a power of two.
>>>   * Return: true if @n is a power of 2, otherwise false.
>>>   */
>>> -static inline __attribute__((const))
>>> -bool is_power_of_2(unsigned long n)
>>> -{
>>> -	return (n != 0 && ((n & (n - 1)) == 0));
>>> -}
>>> +#define is_power_of_2(_n)				\
>>> +	({						\
>>> +		typeof(_n) n = (_n);			\
>>> +		n != 0 && ((n & (n - 1)) == 0);		\
>>> +	})
>>>  
>>>  /**
>>>   * __roundup_pow_of_two() - round up to nearest power of two
>>> _
>>>
>>> worked for me in a simple test.
>>>
>>> --- a/fs/open.c~b
>>> +++ a/fs/open.c
>>> @@ -1564,3 +1564,10 @@ int stream_open(struct inode *inode, str
>>>  }
>>>  
>>>  EXPORT_SYMBOL(stream_open);
>>> +
>>> +#include <linux/log2.h>
>>> +
>>> +int foo(void)
>>> +{
>>> +	return is_power_of_2(43);
>>> +}
>>> _
>>>
>>>
>>> foo:
>>> # fs/open.c:1573: }
>>> 	xorl	%eax, %eax	#
>>> 	ret	
>>>
>>>
>>> Is there some more tricky situation where it breaks?
>> 
>> It doesn't work with BUILD_BUG_ON_ZERO().
>
> Like most programming problems, you just need another layer of
> indirection! The below works for me in all the cases I could think of
> (including __uint128_t).
>
>
> #define __IS_POWER_OF_2(n) (n != 0 && ((n & (n - 1)) == 0))
>
> #define _IS_POWER_OF_2(n, unique_n)				\
> 	({							\
> 		typeof(n) unique_n = (n);			\
> 		__IS_POWER_OF_2(unique_n);			\
> 	})
>
> #define is_power_of_2(n)					\
> 	__builtin_choose_expr(__is_constexpr((n)),		\
> 			      __IS_POWER_OF_2((n)),		\
> 			      _IS_POWER_OF_2(n, __UNIQUE_ID(_n)))
>
>
> Although Jani's original might be easier to understand.

I dropped the ball since I couldn't make heads or tails what I should be
doing. And a year has passed. I'll note that the kernel has a number of
helpers for "is power of 2" for u64 and for constant expressions,
outside of log2.h.

I tried to make is_power_of_2() work for all the cases. Would it be more
palatable if I just added all the variants separately to log2.h?

- Leave is_power_of_2() as is
- Add is_power_of_2_u64() for 32-bit build compatible 64-bit checks
- Add IS_POWER_OF_2() macro for constant expressions

Please just tell me what to do and I'll do it.

BR,
Jani.


-- 
Jani Nikula, Intel
