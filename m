Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EBC93C5A5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 16:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D47310E263;
	Thu, 25 Jul 2024 14:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB1A10E263;
 Thu, 25 Jul 2024 14:53:55 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 25 Jul
 2024 17:53:53 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 25 Jul
 2024 17:53:52 +0300
Message-ID: <e6c131df-64b6-4856-8778-0fa7e8c7c876@fintech.ru>
Date: Thu, 25 Jul 2024 07:53:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Fix possible int overflow in
 skl_ddi_calculate_wrpll()
To: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
 <stable@vger.kernel.org>
References: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
 <87sevxzy0i.fsf@intel.com>
Content-Language: en-US
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <87sevxzy0i.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

Hi,

On 7/25/24 01:17, Jani Nikula wrote:
> On Wed, 24 Jul 2024, Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:
>> On the off chance that clock value ends up being too high (by means
>> of skl_ddi_calculate_wrpll() having benn called with big enough
>> value of crtc_state->port_clock * 1000), one possible consequence
>> may be that the result will not be able to fit into signed int.
>>
>> Fix this, albeit unlikely, issue by first casting one of the operands
>> to u32, then to u64, and thus avoid causing an integer overflow.
> 
> Okay, thanks for the patch, but please let's not do this.
> 
> Currently the highest possible port clock is 2000000 kHz, and 1000 times
> that fits into 31 bits. When we need to support higher clocks, we'll
> need to handle this. But not like this.
> 
> That (u64)(u32) is just too unintuitive, and assumes the caller has
> already passed in something that has overflown. People are just going to
> pause there, and wonder what's going on.
> 
> If we want to appease the static analyzer, I think a better approach
> would be to change the parameter to u64 clock_hz, and have the caller
> do:
> 
> 	ret = skl_ddi_calculate_wrpll((u64)crtc_state->port_clock * 1000,
> 				      i915->display.dpll.ref_clks.nssc, &wrpll_params);
> 
> BR,
> Jani.
> 

First, I agree that using (u64)(u32) is confusing and not intuitive,
even if there are some similar examples in kernel code.

The reason why I thought I had to opt for it though is the following: I
was worried that if the int value of 'clock' in
skl_ddi_calculate_wrpll() is big enough (specifically, high bit is 1),
then after casting it to long or u64 in this case, the resulting value
of wider type will have all its ~32 upper bits also set to 1, per rules
of Integer Promotion. Changing the type from signed to unsigned, then to
bigger unsigned seems to mitigate *this* particular issue and I can't
come up with a more elegant solution at the moment. Correct me if I'm
wrong somewhere.

Also, while port clock may be able to fit its value timed 1000 into 31
bits, multiplying it by 5 to get AFE Clock value, as far as I can see,
*will* lead to overflow, as 2,000,000,000 * 5 won't fit into 32 bits.

To sum it up, with current max possible port clock values an integer
overflow can occur and changing 'clock' parameter from int to u64 may
lead to a different issue. If my understanding about integer promotion
is flawed, I'll gladly send v2 patch with your solution.

Regards,
Nikita
> 
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: fe70b262e781 ("drm/i915: Move a bunch of stuff into rodata from the stack")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>> Fixes: tag is not entirely correct, as I can't properly identify the
>> origin with all the code movement. I opted out for using the most
>> recent topical commit instead.
>>
>>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> index 90998b037349..46d4dac6c491 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> @@ -1683,7 +1683,7 @@ skl_ddi_calculate_wrpll(int clock /* in Hz */,
>>  	};
>>  	unsigned int dco, d, i;
>>  	unsigned int p0, p1, p2;
>> -	u64 afe_clock = clock * 5; /* AFE Clock is 5x Pixel clock */
>> +	u64 afe_clock = (u64)(u32)clock * 5; /* AFE Clock is 5x Pixel clock */
>>  
>>  	for (d = 0; d < ARRAY_SIZE(dividers); d++) {
>>  		for (dco = 0; dco < ARRAY_SIZE(dco_central_freq); dco++) {
> 
