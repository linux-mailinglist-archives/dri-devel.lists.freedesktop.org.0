Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD9CED908
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 00:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F80E10E124;
	Thu,  1 Jan 2026 23:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZmvLLdzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EA110E14C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 23:44:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so75904775e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 15:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767311080; x=1767915880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VaHV+fPSHbV1XYccY9PKSQ9qUgEH9z1PuWJ+g++FYU=;
 b=ZmvLLdzzIvWJEfoULcAqI+Y5HZ0GUwYTXyJxvp9yMMLRPhS5MpuhYsLgpv/rmKUBol
 dR6quTDYBdrk3GjJprCz3SbzxQQ2ALdyNKYUPHocePIMVt+riaWPCPupiNYgiG9lHqRT
 wXtjj/h76E6/9nL3FZmsBVlKErfHg5FaotoPDflxR5+BEtBOkaUXfny+/M068WcIDWZ8
 W0u/wiYfWXSwm8goXtVjRNyahXQCBDJZuUTT6hO/rMm6cyG3w85vX+B36ky5WNyokawJ
 SB7MaoQww1HykuckdE5yh2NBXK22o2lB9j65zjZvbqwQLqSr6rkxlTmNzy//VVeH77uV
 b3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767311080; x=1767915880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8VaHV+fPSHbV1XYccY9PKSQ9qUgEH9z1PuWJ+g++FYU=;
 b=FdGQJdMVt3wEFKtynlDdJPCXuliyqVdu1YUsWpgp2KyONjViDvLKpSZHoOrEBSPZdT
 jox2QNiWjrjCpoWrCjSDQX9z5noN7y8BAoaW5lVzaO795RSZtLN7VdpvMqctdvXzEgvH
 EjWsSUJjhjxXG1Wdai8alnHEkwRGYJmDtTRXUiQiTLW0tg1vJkFlzfHX+3KNwwm7Ljz3
 Gmn6vSUA7xqsHc5uww0nRgzAO18tvlD/GllfEzL60WGGYq8DQyCjrzWO6O/ZNxCL3Tl5
 d2i7TRBiVN7iCTj0VIDuvi4rHynz8k8TzrZV0vEMVDe6hCnGshZOLphPMLqbIkxb5wbo
 TB3A==
X-Gm-Message-State: AOJu0Yz/GP7VEuXhlzhoFXCBpZ/yvKwr9jKejyfPpETX3pDV2DneRh+6
 VEHxQKYhFvA/RTE4XmEgrzmYK/Cm8iXCfRYUEU7/uWSKO+JQc+N/zIcK
X-Gm-Gg: AY/fxX7XYX7NFx9Dpst3tzJTEjlFn+ERE7bNbLO/pn3CcprlCD8FwQm19sR4MMFiVMJ
 XNA0a9JgIyWd1DbyyJ8V5KfF/xGENr/TKzvHW6WhSfItamjCwU0vFdhkwtjKOzBdByZWll4XpYH
 miW8riyJijSKPcdCOoJee2euILq9h35f3DAQ4yZg1mZZj2TZ/aGgJNJhIEDj/uZFuIRlFPAY4li
 NO+Mt2c5Y13gIPkyPbbQeCksu+oQo8vBNfLdmLcmDuBh4A2XTxLxcVwEj8w3bLJWlL+stJW9mJz
 eMAJIe/90ObshCmXc4bW3PR1E01z6zReo0vizJ4AlPwHn+Gp66Mtw9LGWFC6l5Dv5cpX19viR3I
 8A88qdRfjtPjtjt0z9mDaBSra8aLekDg6C5Iyth0RdNSnBqK2thHQ+tIAZDe1bzTrALPP7d5WCe
 IXavW1ZnyDl8Ff9iot+uDK2agvLCOB3WY4FvlXKcR8ckh3sFlNkcBzobRMTlvPqbU=
X-Google-Smtp-Source: AGHT+IHXkr2lbC80Zn7hP1J5nTM92i3wkwwhT9Omhmn5jdpQQIdtVx9uILZue6GcYU98GN1FGqcvCg==
X-Received: by 2002:a05:600c:4e42:b0:477:7d94:5d0e with SMTP id
 5b1f17b1804b1-47d1958fcbcmr470283665e9.27.1767311079946; 
 Thu, 01 Jan 2026 15:44:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d5372sm742449455e9.14.2026.01.01.15.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 15:44:39 -0800 (PST)
Date: Thu, 1 Jan 2026 23:44:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Message-ID: <20260101234438.504b3c48@pumpkin>
In-Reply-To: <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
 <20260101114221.6a401790@pumpkin>
 <15e7f0e9-9862-4606-83d2-d95e0cb6e821@mailbox.org>
 <20260101231320.16766226@pumpkin>
 <4116865c-f3a5-4d3c-887e-bbf8ae1fd8a1@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 2 Jan 2026 00:25:54 +0100
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 1/2/26 12:13 AM, David Laight wrote:
> > On Thu, 1 Jan 2026 22:26:34 +0100
> > Marek Vasut <marek.vasut@mailbox.org> wrote:
> >   
> >> On 1/1/26 12:42 PM, David Laight wrote:
> >>
> >> Hello David,
> >>  
> >>>>    static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>>>    				   unsigned long fin_rate,
> >>>>    				   unsigned long fout_target,
> >>>> -				   struct dsi_setup_info *setup_info)
> >>>> +				   struct dsi_setup_info *setup_info,
> >>>> +				   u16 vclk_divider)  
> >>>
> >>> There is no need for this to be u16, unsigned int will generate better code.  
> >>
> >> Can you please elaborate on the "better code" part ?  
> > 
> > Basically the compiler has to generate extra code to ensure the value
> > doesn't exceed 65535.
> > So there will be a mask of the function parameter (passes in a 32bit register).
> > Any arithmetic needs similar masking of the result.
> > You won't see the latter (as much) on x86 (or m68k) because the compiler
> > can use the C 'as if' rule and use the cpu's 8/16 bit registers and alu.
> > But pretty much no other cpu can do that, so extra instructions are needed
> > to stop the value (in a 32bit register) exceeding the limit for the variable.
> > 
> > Remember that while C variables can be char/short the values they contain
> > are promoted to 'signed int' before (pretty much) anything is done with
> > the value, any calculated value is then truncated before being assigned back.
> > For on-stack values this is fine - but modern compilers was to keep values
> > in registers as much as possible.
> >   
> >>  
> >>>>    {
> >>>>    	unsigned int best_err = -1;
> >>>>    	const struct rcar_mipi_dsi_device_info *info = dsi->info;
> >>>> @@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
> >>>>    			if (fout < info->fout_min || fout > info->fout_max)
> >>>>    				continue;
> >>>>    
> >>>> -			fout = div64_u64(fout, setup_info->vclk_divider);
> >>>> +			fout = div64_u64(fout, vclk_divider);  
> >>>
> >>> Since vclk_divider is BIT_U32(div [+ 1]) this is just a shift right.
> >>> So pass the bit number instead.  
> >>
> >> While I agree this is a shift in the end, it also makes the code harder
> >> to understand. I can add the following change into V2, but I would like
> >> input from Tomi/Laurent on whether we should really push the
> >> optimization in that direction:  
> > 
> > The shift really is a lot faster.
> > Even on 64bit x86 cpus it can be slow - 35-88 clocks prior to 'Cannon Lake'.
> > AMD cpu get better with Zen3, and using a 64bit divide with 32bits values
> > doesn't slow things down (it does on the Intel cpu).
> > Don't even think about what happens on 32bit cpus.
> > I don't know about other architectures.
> > Just comment as 'x >> n' rather than 'x / (1 << n)'
>
> Please note that this code is built primarily for arm64 , so discussing 
> x86 or m68k optimizations doesn't make much sense here.

ARM definitely only has 32 and 64bit maths - so you will see masking
instructions for arithmetic on char/short values (unless the compiler
can tell that the values cannot get too large.)

Divide performance is cpu dependant - the only arm cpu I've used only
had software divide (but a fast barrel shifter).
If you think that Intel haven't thrown much silicon at integer divide
it isn't that likely that arm will have a divide that is much faster
than 1 clock for each bit in the quotient.
(Of course I might be wrong...)

	David

