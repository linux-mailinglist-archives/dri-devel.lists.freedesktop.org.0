Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A864B25D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 10:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163E10E2F0;
	Tue, 13 Dec 2022 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0214289048;
 Tue, 13 Dec 2022 09:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670923739; x=1702459739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Bp30MA4PgsFJjTtXWD8JVLEk7r0vjtZzmIyP/wIb+WM=;
 b=fYdooy3DrHXlj0GjjL4p6zYNg9vhX1ibcYITs1vgkriccvG9zEmqSkdq
 mdXSO0hWtpNqqhAnDmtM7WDYT4kvYILHoOA781hIa+M0V7x9TQ4hXRgBu
 AEzQ7tPA/KntV+yxZfxR8mDvcfA4JN00IP4vxgBdkDTnGyXOsOpc9uGCQ
 q5uY56b3KtXEVpqGzIc2duSdkyKvW76LgPzd9RoyQdn2MhxT8mHBpZPrE
 Xsai0xiTmaSpMo0OVJwpkEPgu6nM1E1CvYnS229z06yp2wtUHfbGvNTEn
 xurN/W2OGwpAuWlKLr+mVvMGZxEO9PvDjJyiR8joeJ+WPdK6BBsSqy9jz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="345147832"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="345147832"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 01:28:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679238977"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="679238977"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.28.83])
 ([10.213.28.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 01:28:56 -0800
Message-ID: <53e7e660-9ee0-1177-b34a-365c1397ec3b@intel.com>
Date: Tue, 13 Dec 2022 10:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version of
 xchg
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <b0c38501-440f-42a3-ae0f-dd95527b0e56@app.fastmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <b0c38501-440f-42a3-ae0f-dd95527b0e56@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.12.2022 18:16, Arnd Bergmann wrote:
> On Fri, Dec 9, 2022, at 16:48, Andrzej Hajda wrote:
>> The pattern of setting variable with new value and returning old
>> one is very common in kernel. Usually atomicity of the operation
>> is not required, so xchg seems to be suboptimal and confusing in
>> such cases. Since name xchg is already in use and __xchg is used
>> in architecture code, proposition is to name the macro exchange.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> While I generally don't like type invariant calling conventions
> of xchg() and cmpxchg(), having a new function that has a similar
> name without being able to tell which one is which from the
> name seems more confusing.
> 
> Since __xchg() is only used on 11 architectures as an internal

Quite big number for 'only' :)

> name for the backing of arch_xchg() or arch_xchg_relaxed(),
> maybe we can instead rename those to __arch_xchg() and use the
> __xchg() name for the new non-atomic version?

I will try, but even compile test will be some challenge, need to find 
cross-compilers for these archs.

Btw exchange is not totally new name, for example C++ uses it [1].

[1]: https://en.cppreference.com/w/cpp/utility/exchange

Regards
Andrzej

> 
>> +/**
>> + * exchange - set variable pointed by @ptr to @val, return old value
>> + * @ptr: pointer to affected variable
>> + * @val: value to be written
>> + *
>> + * This is non-atomic variant of xchg.
>> + */
>> +#define exchange(ptr, val) ({		\
>> +	typeof(ptr) __ptr = ptr;	\
>> +	typeof(*__ptr) __t = *__ptr;	\
> 
> I think you can better express this using __auto_type than typeof(),
> it is now provided by all supported compilers now.
> 
>       Arnd

