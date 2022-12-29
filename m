Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DE658B3F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 10:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B15A10E1EE;
	Thu, 29 Dec 2022 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDEC10E1EE;
 Thu, 29 Dec 2022 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672307698; x=1703843698;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ekul8eGeWcmCvyM+3dUi16jfyX+OFQQRDZLG3bQVomQ=;
 b=d+7bN+tjqh3eof9bdGje2kpI4zamfY6oXHKsH+IltfywydlGu2NF0yZG
 4vIYv/W8lJbY30ukqxMBcjHIRPMCg9jmTJADrPDZdo1FJxI3F6MVBRfwY
 BIgsMVcxs9JW7VBN0D8cQHYX+iVJvNWG3lWD/FemsFFxxPHFlM+r1fbYY
 qVh8BxuHJ89OYNeXwCreHJSPhBe+76NSoPDLdOu7BGq1oDzOlJyyMm8DT
 Ef4uT6gE+ggVAwsKhrxH9vy9WHVpZ+HRJiPSnjy/8deUA37o+bNIcgSHi
 0elXSLbGnfbt6xofms5/X0zBh+1Hn27+PPdr9nHZYPjJGtGv4Kw4SFjyF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="318699301"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; d="scan'208";a="318699301"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2022 01:54:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="742258354"
X-IronPort-AV: E=Sophos;i="5.96,283,1665471600"; d="scan'208";a="742258354"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.17.178])
 ([10.213.17.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2022 01:54:52 -0800
Message-ID: <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
Date: Thu, 29 Dec 2022 10:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To: Andrew Morton <akpm@linux-foundation.org>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forgive me late response - Holidays,

On 22.12.2022 18:21, Andrew Morton wrote:
> On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>
>> Hi all,
>>
>> I hope there will be place for such tiny helper in kernel.
>> Quick cocci analyze shows there is probably few thousands places
>> where it could be useful.
> So to clarify, the intent here is a simple readability cleanup for
> existing open-coded exchange operations.

And replace private helpers with common one, see the last patch - the 
ultimate goal
would be to replace all occurrences of fetch_and_zero with __xchg.

> The intent is *not* to
> identify existing xchg() sites which are unnecessarily atomic and to
> optimize them by using the non-atomic version.
>
> Have you considered the latter?

If you mean some way of (semi-)automatic detection of such cases, then 
no. Anyway this could be quite interesting challenge.

>
>> I am not sure who is good person to review/ack such patches,
> I can take 'em.
>
>> so I've used my intuition to construct to/cc lists, sorry for mistakes.
>> This is the 2nd approach of the same idea, with comments addressed[0].
>>
>> The helper is tiny and there are advices we can leave without it, so
>> I want to present few arguments why it would be good to have it:
>>
>> 1. Code readability/simplification/number of lines:
>>
>> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
>> -       previous_min_rate = evport->qos.min_rate;
>> -       evport->qos.min_rate = min_rate;
>> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
>>
>> For sure the code is more compact, and IMHO more readable.
>>
>> 2. Presence of similar helpers in other somehow related languages/libs:
>>
>> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>>      helper (__xchg(&x, 0)), which is the same as private helper in
>>      i915 - fetch_and_zero, see latest patch.
>> b) C++ [2]: 'exchange' from utility header.
>>
>> If the idea is OK there are still 2 qestions to answer:
>>
>> 1. Name of the helper, __xchg follows kernel conventions,
>>      but for me Rust names are also OK.
> I like replace(), or, shockingly, exchange().
>
> But...   Can we simply make swap() return the previous value?
>
> 	previous_min_rate = swap(&evport->qos.min_rate, min_rate);

As Alexander already pointed out, swap requires 'references' to two 
variables,
in contrast to xchg which requires reference to variable and value.
So we cannot use swap for cases:
     old_value = __xchg(&x, new_value);

Regards
Andrzej

