Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79870CF35B3
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 12:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF84110E178;
	Mon,  5 Jan 2026 11:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oxF9pWVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C64310E178
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 11:50:34 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12978664;
 Mon,  5 Jan 2026 12:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1767613812;
 bh=+8QxQpjufdyJMy7el1fqrY7czYiD2WczNRj/lU10VIU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oxF9pWVxaiOAWxxskOLoXUnimXMo36pxMna949tF5n79yf4UiZ5t81dpD3Ap8PrQN
 FAkpqCu1Pajuc8/wUWrXqYBsTy96PYa/JyMVCLHaCRxKq4EqFQWBug+wmB3w4773qG
 p8xXdb+0bGSmXmlso6TiBTcc/cRD57yMjx7diKCQ=
Message-ID: <215b8c33-d803-4a4c-a7c4-f6be231e15a0@ideasonboard.com>
Date: Mon, 5 Jan 2026 13:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: David Laight <david.laight.linux@gmail.com>,
 Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
 <20260101114221.6a401790@pumpkin>
 <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
 <20260101231320.16766226@pumpkin>
 <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
 <20260101234438.504b3c48@pumpkin>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260101234438.504b3c48@pumpkin>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/01/2026 01:44, David Laight wrote:
> On Fri, 2 Jan 2026 00:25:54 +0100
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
>> On 1/2/26 12:13 AM, David Laight wrote:
>>> On Thu, 1 Jan 2026 22:26:34 +0100
>>> Marek Vasut <marek.vasut@mailbox.org> wrote:
>>>   
>>>> On 1/1/26 12:42 PM, David Laight wrote:
>>>>
>>>> Hello David,
>>>>  
>>>>>>    static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>>>    				   unsigned long fin_rate,
>>>>>>    				   unsigned long fout_target,
>>>>>> -				   struct dsi_setup_info *setup_info)
>>>>>> +				   struct dsi_setup_info *setup_info,
>>>>>> +				   u16 vclk_divider)  
>>>>>
>>>>> There is no need for this to be u16, unsigned int will generate better code.  
>>>>
>>>> Can you please elaborate on the "better code" part ?  
>>>
>>> Basically the compiler has to generate extra code to ensure the value
>>> doesn't exceed 65535.
>>> So there will be a mask of the function parameter (passes in a 32bit register).
>>> Any arithmetic needs similar masking of the result.
>>> You won't see the latter (as much) on x86 (or m68k) because the compiler
>>> can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
>>> But pretty much no other cpu can do that, so extra instructions are needed
>>> to stop the value (in a 32bit register) exceeding the limit for the variable.
>>>
>>> Remember that while C variables can be char/short the values they contain
>>> are promoted to 'signed int' before (pretty much) anything is done with
>>> the value, any calculated value is then truncated before being assigned back.
>>> For on-stack values this is fine - but modern compilers was to keep values
>>> in registers as much as possible.
>>>   
>>>>  
>>>>>>    {
>>>>>>    	unsigned int best_err = -1;
>>>>>>    	const struct rcar_mipi_dsi_device_info *info = dsi->info;
>>>>>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>>>    			if (fout < info->fout_min || fout > info->fout_max)
>>>>>>    				continue;
>>>>>>    
>>>>>> -			fout = div64_u64(fout, setup_info->vclk_divider);
>>>>>> +			fout = div64_u64(fout, vclk_divider);  
>>>>>
>>>>> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
>>>>> So pass the bit number instead.  
>>>>
>>>> While I agree this is a shift in the end, it also makes the code harder
>>>> to understand. I can add the following change into V2, but I would like
>>>> input from Tomi/Laurent on whether we should really push the
>>>> optimization in that direction:  
>>>
>>> The shift really is a lot faster.
>>> Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
>>> AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
>>> doesn't slow things down (it does on the Intel cpu).
>>> Don't even think about what happens on 32bit cpus.
>>> I don't know about other architectures.
>>> Just comment as 'x >> n' rather than 'x / (1 << n)'
>>
>> Please note that this code is built primarily for arm64 , so discussing 
>> x86 or m68k optimizations doesn't make much sense here.
> 
> ARM definitely only has 32 and 64bit maths - so you will see masking
> instructions for arithmetic on char/short values (unless the compiler
> can tell that the values cannot get too large.)
> 
> Divide performance is cpu dependant - the only arm cpu I've used only
> had software divide (but a fast barrel shifter).
> If you think that Intel haven't thrown much silicon at integer divide
> it isn't that likely that arm will have a divide that is much faster
> than 1 clock for each bit in the quotient.
> (Of course I might be wrong...)
The division is done once when enabling the display? If so, I'd
prioritize readability. That said, division done with shift if quite
common, so I'm not sure if it would be that bad with a few comments.

 Tomi

