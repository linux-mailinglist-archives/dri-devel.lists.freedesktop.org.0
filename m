Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B299514D8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 08:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A24610E413;
	Wed, 14 Aug 2024 06:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PebwvEop";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37BD10E413;
 Wed, 14 Aug 2024 06:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723618664; x=1755154664;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KbjC+8/jzw6Q9BrnTVAM/narvymSlwbeb8erjHMmhvY=;
 b=PebwvEopFPubn4zZ2ZyanWzhJKsmdkKNJXtilpwlu4ACSuHiFtjvYsZq
 qWnCtnUTgzr/96kanPKxs9XJI4Ng4JNre27F/XvOp1V8pBKjbqU0CGsoU
 FOoOsY0l5nM+62LGNXRsBJwC8hOjzgjVg+0mU0JntJ5XsZTsGiwtAcSds
 1gIz5TzWfw+BWMt7J8Oae4+Ez+gExDMjK/ufG0t7q79KhQBxcnixzxGhx
 CWp23M0En3Qr8+LikyEikcQXHGdeVDhu0sGC5tLNdQMUua3NWTI371XlQ
 Eqws7lK951+56hAu8cjB/QxEBYc8XcFvLUwOLb4jk3VTBjCGHAHejJIx2 A==;
X-CSE-ConnectionGUID: WDzxQYROSFqv13GouRhGTg==
X-CSE-MsgGUID: kTedQDlzRYqPxkVO+qivJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25616270"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="25616270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:57:43 -0700
X-CSE-ConnectionGUID: IfreNJmLQJ6Fmwazs/raPw==
X-CSE-MsgGUID: 4eGjZP04TA6E/T/EX9iWgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="59022609"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 23:57:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akinobu.mita@gmail.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
In-Reply-To: <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240813121237.2382534-1-jani.nikula@intel.com>
 <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
Date: Wed, 14 Aug 2024 09:57:31 +0300
Message-ID: <87cymbzj50.fsf@intel.com>
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

On Tue, 13 Aug 2024, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Tue, 13 Aug 2024 15:12:35 +0300 Jani Nikula <jani.nikula@intel.com> wrote:
>
>> The fault-inject.h users across the kernel need to add a lot of #ifdef
>> CONFIG_FAULT_INJECTION to cater for shortcomings in the header. Make
>> fault-inject.h self-contained for CONFIG_FAULT_INJECTION=n, and add
>> stubs for DECLARE_FAULT_ATTR(), setup_fault_attr(), should_fail_ex(),
>> and should_fail() to allow removal of conditional compilation.
>> 
>> --- a/include/linux/fault-inject.h
>> +++ b/include/linux/fault-inject.h
>>  
>> -#include <linux/types.h>
>> -#include <linux/debugfs.h>
>
> Removing a nested include exposes all those sites which were
> erroneously depending upon that nested include.  Here's what I have
> found so far, there will be more.

Right. I didn't hit them with the configs I tried... though I wonder why
not, especially lib/fault-inject.c puzzles me.

How do you want to proceed? Arguably uncovering and fixing those places
is good, but that's kind of an unintended consequence here.

BR,
Jani.


>
> --- a/mm/failslab.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/mm/failslab.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <linux/fault-inject.h>
>  #include <linux/error-injection.h>
> +#include <linux/debugfs.h>
>  #include <linux/slab.h>
>  #include <linux/mm.h>
>  #include "slab.h"
> --- a/lib/fault-inject.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/lib/fault-inject.c
> @@ -2,6 +2,7 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/random.h>
> +#include <linux/debugfs.h>
>  #include <linux/sched.h>
>  #include <linux/stat.h>
>  #include <linux/types.h>
> --- a/kernel/futex/core.c~fault-inject-improve-build-for-config_fault_injection=n-fix
> +++ a/kernel/futex/core.c
> @@ -34,6 +34,7 @@
>  #include <linux/compat.h>
>  #include <linux/jhash.h>
>  #include <linux/pagemap.h>
> +#include <linux/debugfs.h>
>  #include <linux/plist.h>
>  #include <linux/memblock.h>
>  #include <linux/fault-inject.h>
> _
>

-- 
Jani Nikula, Intel
