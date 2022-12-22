Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A36542B5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C410E160;
	Thu, 22 Dec 2022 14:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792DA10E160;
 Thu, 22 Dec 2022 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671718648; x=1703254648;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=meZJDY1PMUtgLkPrUblSxd3HYWLxd7p0iVKy4Ko1qbk=;
 b=iUm2KU0rDre6tmN6s+s8l2/7ICOnJNxv129qzHEN855OShvjjwysq+7g
 1C2WXTU/a00d54gKgoTZBdAObGy5BRzQKlmKHOZSde1sVUOce8VzcnzCd
 7im0oQJCmxVJRxs7/pFd8GzBIL95938hx7diqbd4+pcEUKPykMrXOfCdq
 8BKA87hKzb5tovTNn/j/ddKK/p0kPD7Uc9hAFSoLApfT7rt3Iq7NNH7Ms
 4fPs2xcM+Ab+4AGf+q/0vg8I7OlYfzHxQXc5i77152MT9nEmbv4bTKIC9
 eem4M0oXdKDjZhyyuyKqeQvav1QGS90CiPMmHIVyteqwpns/jdBrDBWDM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="307820230"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="307820230"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 06:17:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="651797661"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="651797661"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.17.92])
 ([10.213.17.92])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 06:17:21 -0800
Message-ID: <286f817c-2e3a-aba9-1083-73f25bafd84c@intel.com>
Date: Thu, 22 Dec 2022 15:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.12.2022 15:12, Geert Uytterhoeven wrote:
> Hi Andrzej,
>
> Thanks for your series!
>
> On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> I hope there will be place for such tiny helper in kernel.
>> Quick cocci analyze shows there is probably few thousands places
>> where it could be useful.
>> I am not sure who is good person to review/ack such patches,
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
> Upon closer look, shouldn't that be
>
>      previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);
>
> ?

Yes, you are right, the first argument is a pointer.

Regards
Andrzej

>
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
> Before I realized the missing "&", I wondered how this is different
> from swap(), so naming is important.
> https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

