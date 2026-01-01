Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBCBCED8CE
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 00:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0A10E149;
	Thu,  1 Jan 2026 23:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="A9HM6twq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA6710E149
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 23:26:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dj2xy2rRtz9svD;
 Fri,  2 Jan 2026 00:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767309958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2j6AdpI5VEIuPetVKSFH+Svwx51VlD+55ROYZGbANBs=;
 b=A9HM6twquaWTkRWvSF51TTgJFQVyADowMlBI6F6nseSVfTB1aQ15mkQfq8/RsbtGSt02Wl
 sj1vf5E7btKa0l10pEWKFjKg/UzgqXM/OqBU1GSW3YcjLewuGPyCgoZ4uNFlxfbeZDdR3Y
 y5l/FnrkZ8M0yOyXCVFWCnG/PYwrsE7MHmTARv5jIu7IALDwsafuAbzKLXNsYochiNATkj
 O0UZjLkRy4n4jHBNT6I68+gboFLq3b+MpAIrKf1QiF6hJ6BHsNewyH8HUGvQahOUm+Cdlc
 m/4nZUl9fGhY4KOSP1hSweMksiIKqA+O7SoW1UJisIttIwd/cqMNvsYCn1NaAw==
Message-ID: <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
Date: Fri, 2 Jan 2026 00:25:54 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: David Laight <david.laight.linux@gmail.com>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
 <20260101114221.6a401790@pumpkin>
 <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
 <20260101231320.16766226@pumpkin>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260101231320.16766226@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 4ekdrdoty6i6dc5b8irwgj4qjt3u8mtq
X-MBO-RS-ID: aa9340bd8078d65737b
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

On 1/2/26 12:13 AM, David Laight wrote:
> On Thu, 1 Jan 2026 22:26:34 +0100
> Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
>> On 1/1/26 12:42 PM, David Laight wrote:
>>
>> Hello David,
>>
>>>>    static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>    				   unsigned long fin_rate,
>>>>    				   unsigned long fout_target,
>>>> -				   struct dsi_setup_info *setup_info)
>>>> +				   struct dsi_setup_info *setup_info,
>>>> +				   u16 vclk_divider)
>>>
>>> There is no need for this to be u16, unsigned int will generate better code.
>>
>> Can you please elaborate on the "better code" part ?
> 
> Basically the compiler has to generate extra code to ensure the value
> doesn't exceed 65535.
> So there will be a mask of the function parameter (passes in a 32bit register).
> Any arithmetic needs similar masking of the result.
> You won't see the latter (as much) on x86 (or m68k) because the compiler
> can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
> But pretty much no other cpu can do that, so extra instructions are needed
> to stop the value (in a 32bit register) exceeding the limit for the variable.
> 
> Remember that while C variables can be char/short the values they contain
> are promoted to 'signed int' before (pretty much) anything is done with
> the value, any calculated value is then truncated before being assigned back.
> For on-stack values this is fine - but modern compilers was to keep values
> in registers as much as possible.
> 
>>
>>>>    {
>>>>    	unsigned int best_err = -1;
>>>>    	const struct rcar_mipi_dsi_device_info *info = dsi->info;
>>>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
>>>>    			if (fout < info->fout_min || fout > info->fout_max)
>>>>    				continue;
>>>>    
>>>> -			fout = div64_u64(fout, setup_info->vclk_divider);
>>>> +			fout = div64_u64(fout, vclk_divider);
>>>
>>> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
>>> So pass the bit number instead.
>>
>> While I agree this is a shift in the end, it also makes the code harder
>> to understand. I can add the following change into V2, but I would like
>> input from Tomi/Laurent on whether we should really push the
>> optimization in that direction:
> 
> The shift really is a lot faster.
> Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
> AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
> doesn't slow things down (it does on the Intel cpu).
> Don't even think about what happens on 32bit cpus.
> I don't know about other architectures.
> Just comment as 'x >> n' rather than 'x / (1 << n)'
Please note that this code is built primarily for arm64 , so discussing 
x86 or m68k optimizations doesn't make much sense here.
