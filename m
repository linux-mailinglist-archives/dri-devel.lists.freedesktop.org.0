Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51093CF9A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 10:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DDF10E2D1;
	Fri, 26 Jul 2024 08:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPxNnRVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1332F10E103;
 Fri, 26 Jul 2024 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721982363; x=1753518363;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dzHtMzHbaJ2yE5UIrMONtQRc75u7v0DvZWr8hP/nT0E=;
 b=aPxNnRVLt9IxWlwV6Nsi4R/LQiMjHXzTsPW86TKAf65YmvaVJdBQRCHq
 +rGv224vaC1NBmQBQrNvzs0WOdH3/WoGQAGp/WT13lKvQ7RIQISMUA5cV
 /rM1gIfm+cphCmRcA+YITExTGjpMX6QH8u2Gbri59gaGiOEiABn5kDo4J
 BJJaDFJavrKYpvJJk+Ojk+LfJ7Y3MSva2Uex19oh+CyGIC+4bavi1/1hv
 wlPUf6XIyrCdt5hUY1IxDHLykBUDbvrVEVBo84YfqBQH07kstJY9AoZ9u
 hvmPn4yb61zkLTheUhngToWui36Q5SCn6cYx4bDlbyFjCqI/FZIAAhjrI Q==;
X-CSE-ConnectionGUID: 0Eg+Xr6cTGyBCSRJVdDwNA==
X-CSE-MsgGUID: 1hsJV0LjRcG+pPrpBm7xyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19892092"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19892092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:26:00 -0700
X-CSE-ConnectionGUID: khyK4IXFRY6UMJBtoOLvfw==
X-CSE-MsgGUID: lvwBMgd3Tnq2BcaUZpQp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53214226"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 01:25:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix possible int overflow in
 skl_ddi_calculate_wrpll()
In-Reply-To: <e6c131df-64b6-4856-8778-0fa7e8c7c876@fintech.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240724184911.12250-1-n.zhandarovich@fintech.ru>
 <87sevxzy0i.fsf@intel.com>
 <e6c131df-64b6-4856-8778-0fa7e8c7c876@fintech.ru>
Date: Fri, 26 Jul 2024 11:25:52 +0300
Message-ID: <87ed7gzhin.fsf@intel.com>
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

On Thu, 25 Jul 2024, Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:
> Hi,
>
> On 7/25/24 01:17, Jani Nikula wrote:
>> On Wed, 24 Jul 2024, Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:
>>> On the off chance that clock value ends up being too high (by means
>>> of skl_ddi_calculate_wrpll() having benn called with big enough
>>> value of crtc_state->port_clock * 1000), one possible consequence
>>> may be that the result will not be able to fit into signed int.
>>>
>>> Fix this, albeit unlikely, issue by first casting one of the operands
>>> to u32, then to u64, and thus avoid causing an integer overflow.
>> 
>> Okay, thanks for the patch, but please let's not do this.
>> 
>> Currently the highest possible port clock is 2000000 kHz, and 1000 times
>> that fits into 31 bits. When we need to support higher clocks, we'll
>> need to handle this. But not like this.
>> 
>> That (u64)(u32) is just too unintuitive, and assumes the caller has
>> already passed in something that has overflown. People are just going to
>> pause there, and wonder what's going on.
>> 
>> If we want to appease the static analyzer, I think a better approach
>> would be to change the parameter to u64 clock_hz, and have the caller
>> do:
>> 
>> 	ret = skl_ddi_calculate_wrpll((u64)crtc_state->port_clock * 1000,
>> 				      i915->display.dpll.ref_clks.nssc, &wrpll_params);
>> 
>> BR,
>> Jani.
>> 
>
> First, I agree that using (u64)(u32) is confusing and not intuitive,
> even if there are some similar examples in kernel code.
>
> The reason why I thought I had to opt for it though is the following: I
> was worried that if the int value of 'clock' in
> skl_ddi_calculate_wrpll() is big enough (specifically, high bit is 1),
> then after casting it to long or u64 in this case, the resulting value
> of wider type will have all its ~32 upper bits also set to 1, per rules
> of Integer Promotion. Changing the type from signed to unsigned, then to
> bigger unsigned seems to mitigate *this* particular issue and I can't
> come up with a more elegant solution at the moment. Correct me if I'm
> wrong somewhere.
>
> Also, while port clock may be able to fit its value timed 1000 into 31
> bits, multiplying it by 5 to get AFE Clock value, as far as I can see,
> *will* lead to overflow, as 2,000,000,000 * 5 won't fit into 32 bits.
>
> To sum it up, with current max possible port clock values an integer
> overflow can occur and changing 'clock' parameter from int to u64 may
> lead to a different issue. If my understanding about integer promotion
> is flawed, I'll gladly send v2 patch with your solution.

This is what I'm suggesting. Cast the clock (which is in kHz) to u64
before multiplication, and avoid overflows.

Option 1, preferred:

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 90998b037349..292d163036b1 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -1658,7 +1658,7 @@ static void skl_wrpll_params_populate(struct skl_wrpll_params *params,
 }
 
 static int
-skl_ddi_calculate_wrpll(int clock /* in Hz */,
+skl_ddi_calculate_wrpll(int clock,
 			int ref_clock,
 			struct skl_wrpll_params *wrpll_params)
 {
@@ -1683,7 +1683,7 @@ skl_ddi_calculate_wrpll(int clock /* in Hz */,
 	};
 	unsigned int dco, d, i;
 	unsigned int p0, p1, p2;
-	u64 afe_clock = clock * 5; /* AFE Clock is 5x Pixel clock */
+	u64 afe_clock = (u64)clock * 1000 * 5; /* AFE Clock is 5x Pixel clock, in Hz */
 
 	for (d = 0; d < ARRAY_SIZE(dividers); d++) {
 		for (dco = 0; dco < ARRAY_SIZE(dco_central_freq); dco++) {
@@ -1808,7 +1808,7 @@ static int skl_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state)
 	struct skl_wrpll_params wrpll_params = {};
 	int ret;
 
-	ret = skl_ddi_calculate_wrpll(crtc_state->port_clock * 1000,
+	ret = skl_ddi_calculate_wrpll(crtc_state->port_clock,
 				      i915->display.dpll.ref_clks.nssc, &wrpll_params);
 	if (ret)
 		return ret;

Option 2, this is what I suggested earlier:

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 90998b037349..a48a45f30f17 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -1658,7 +1658,7 @@ static void skl_wrpll_params_populate(struct skl_wrpll_params *params,
 }
 
 static int
-skl_ddi_calculate_wrpll(int clock /* in Hz */,
+skl_ddi_calculate_wrpll(u64 clock_hz,
 			int ref_clock,
 			struct skl_wrpll_params *wrpll_params)
 {
@@ -1683,7 +1683,7 @@ skl_ddi_calculate_wrpll(int clock /* in Hz */,
 	};
 	unsigned int dco, d, i;
 	unsigned int p0, p1, p2;
-	u64 afe_clock = clock * 5; /* AFE Clock is 5x Pixel clock */
+	u64 afe_clock = clock_hz * 5; /* AFE Clock is 5x Pixel clock */
 
 	for (d = 0; d < ARRAY_SIZE(dividers); d++) {
 		for (dco = 0; dco < ARRAY_SIZE(dco_central_freq); dco++) {
@@ -1808,7 +1808,7 @@ static int skl_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state)
 	struct skl_wrpll_params wrpll_params = {};
 	int ret;
 
-	ret = skl_ddi_calculate_wrpll(crtc_state->port_clock * 1000,
+	ret = skl_ddi_calculate_wrpll((u64)crtc_state->port_clock * 1000,
 				      i915->display.dpll.ref_clks.nssc, &wrpll_params);
 	if (ret)
 		return ret;


>
> Regards,
> Nikita
>> 
>>>
>>> Found by Linux Verification Center (linuxtesting.org) with static
>>> analysis tool SVACE.
>>>
>>> Fixes: fe70b262e781 ("drm/i915: Move a bunch of stuff into rodata from the stack")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>> ---
>>> Fixes: tag is not entirely correct, as I can't properly identify the
>>> origin with all the code movement. I opted out for using the most
>>> recent topical commit instead.
>>>
>>>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>>> index 90998b037349..46d4dac6c491 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>>> @@ -1683,7 +1683,7 @@ skl_ddi_calculate_wrpll(int clock /* in Hz */,
>>>  	};
>>>  	unsigned int dco, d, i;
>>>  	unsigned int p0, p1, p2;
>>> -	u64 afe_clock = clock * 5; /* AFE Clock is 5x Pixel clock */
>>> +	u64 afe_clock = (u64)(u32)clock * 5; /* AFE Clock is 5x Pixel clock */
>>>  
>>>  	for (d = 0; d < ARRAY_SIZE(dividers); d++) {
>>>  		for (dco = 0; dco < ARRAY_SIZE(dco_central_freq); dco++) {
>> 

-- 
Jani Nikula, Intel
