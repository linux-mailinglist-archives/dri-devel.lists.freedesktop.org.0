Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11514959383
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 06:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E510E583;
	Wed, 21 Aug 2024 04:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="iz4Pgecd";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="dL86t6xE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2024 04:04:08 UTC
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BA610E583
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 04:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1724212683;
 bh=iRH6vm3f+qvme31wvecI88/Rqtmvlts9o6HozktikAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iz4PgecdpbUrvyd4gw8XXc9uXIomOwIADrN6X00sQd4TR0jiKxHenFzb5ndyBbuLF
 rKxSLronsPTJyXCXkjeZg05IoDhp40+VrhYfrF5ckNx7zIeyES8qZF61fdZS6JvgCx
 WSuAkRtxNxYMamcb6lp9axAA5G/GDJTxypCBAlLpGxk/Z18KaBPqZ3UdN4LAtdLHq9
 J93j/MPzFnlPKpsOlRAQQGmDhTiefpbM/xZVbymlycFj8sYzq+7BjjXoEkFDCPRQ7k
 7jV4cELlGG7fszPDiL4dppNVqzLu6iSv1pJ1VkwcExiuq4I1JtMENEkmeS3T/ValmI
 rCqlOx2f3SZZw==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id 915586E7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 12:58:03 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=dL86t6xE; 
 dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id E0E099FE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 12:57:58 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d3bd8a0be3so5184520a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1724212678; x=1724817478;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V+qnGxy5w3VX94K4aj4lv3e2rRMZae3o2HZnHPaaqtQ=;
 b=dL86t6xEESRQ32OuJGgBRYwZIVJrx6uNZBKkbzqbAZMbJd0XWznZScreSSIbYWtOeV
 n+YPPHW9bF0hw/UaKDY3n5ag89Af55fYcT1itSl8dhfd5m0VeEg60sOWAss8JsovgH+K
 YDcC6R56vzrOlWhSe9uXfHoADPAsr3Uxm2AD/qC14lvWCcz5v5y1oB33E6ZySl4cCkB1
 zAgEeP+6rlj77iRd+R9JwTG+LMUEOpzLQ15dzCyLn0K+gaeiOdu/2XkfG5hAW8MmJOCm
 rhsElPC0mgExWOMszdfnO/gSMvw1Dr660byCzdHnXDoTAkZrCoDQD+ufDRnxIjjrQGGD
 twFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724212678; x=1724817478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+qnGxy5w3VX94K4aj4lv3e2rRMZae3o2HZnHPaaqtQ=;
 b=ZAZnR0BIIJatmv8pDrMTChiEvr7zpxzZ53DuimR7eUAa9eGcu3KPDDrdCDcKhSyVPN
 SDjkqot0xaEsdC7CcuaUM/ur2USMFOoGnJ/UkNNxSzIaZmYzoyIIla1XfFHd9VMuJTaE
 3qEhN8BAViE0eajhdOZEZH6f0M3jgPfmqoRBWTQwm0OL52SupuYyjDSfh8NJ37sruDsO
 nquhyFBCGAe4XTSstU8ZZhhb60fG7eH0pKih6QJsZ8rYz6DpFq5VUCzZ1MFa4xrPuc3+
 VgtwJTsa4wvbGUeGm5QYLHI5bdbMEq+v6fMlGClH8LusKrY7on4CDnL3/0M5wKAVO2fa
 zIQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeSgqollT4XUg/iSxAgtd35Q+/gtdpgzagfKa6BK0m86Yb6aRkxg+nRfiI9HuPiXesUuGz/vNThkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8AhOKeyr7bY3CYxiEv8RyuZqvlfgus2VU6QixGQZ4baKM8REX
 1t4rWq2/EhMZKOPYyvcMt+QL896faR2YweefXAaKjLy/nLq4HtKyOyAaMk0UK5RH/nWAf2AhRqO
 JPBO+0YcLWIzIDc7L+BcWFuDDFlb7Q7QwzH75j/9Fmy17Jpuh7XB+Dw9l4ZSrHKxP7UQ=
X-Received: by 2002:a17:90b:1e50:b0:2d3:d8c9:780e with SMTP id
 98e67ed59e1d1-2d5e9a1c42bmr1083901a91.20.1724212677605; 
 Tue, 20 Aug 2024 20:57:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVIiKdohXScz0/LgmYJB0F0NSJGU/plj9oicFpDF0zuctdGMznMuiv+lGTxqm9jYAS6FVvyw==
X-Received: by 2002:a17:90b:1e50:b0:2d3:d8c9:780e with SMTP id
 98e67ed59e1d1-2d5e9a1c42bmr1083873a91.20.1724212677161; 
 Tue, 20 Aug 2024 20:57:57 -0700 (PDT)
Received: from pc-0182.atmarktech (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d5eba30e40sm501627a91.24.2024.08.20.20.57.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Aug 2024 20:57:56 -0700 (PDT)
Received: from martinet by pc-0182.atmarktech with local (Exim 4.96)
 (envelope-from <martinet@pc-zest>) id 1sgcTr-003xuT-0q;
 Wed, 21 Aug 2024 12:57:55 +0900
Date: Wed, 21 Aug 2024 12:57:45 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Adam Ford <aford173@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
Message-ID: <ZsVluV50NvuGGHFX@atmark-techno.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
 <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
 <22a3f5266260dd3915269ae3eec7724f7537eb55.camel@pengutronix.de>
 <cd03ecb1-100e-4699-95ed-d837a2802dc7@kontron.de>
 <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7x+bh_ka250hOCenO3Et6re4EJ=5TG8=kpG1hs-PV0dQxQ@mail.gmail.com>
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

Adam Ford wrote on Tue, Aug 20, 2024 at 09:49:03PM -0500:
> > > However, this check is a bit overcautious in that it only allows exact
> > > rate matches. IIRC HDMI allows a rate mismatch of +- 0.5%, so this
> > > check could be relaxed quite a bit to allow for that.
> >
> > I checked with a 1080p display that reports 23 possible modes via EDID.
> > Out of these 15 are accepted by the driver with the strict check.
> >
> > Two more would be accepted with a relaxed check that allows a 0.5% margin.
> >
> > For the remaining six modes, the pixel clock would deviate up to ~5%
> > from what the display expects. Still, if I remove the check altogether,
> > all 23 modes seem to work just fine.

I can confirm the displays I tested also seem pretty tolerant in
practice (up to ~3-4% at least), but I agree with Lucas that this isn't
something we can rely on for a general purpose driver as having examples
of things being tolerant doesn't mean all hardware will be as flexible..

> > I'd really like to be able to add more PHY PLL setpoints for displays
> > that use non-CEA-861 modes. Unfortunately I didn't manage to figure out
> > the fractional-n PLL parameter calculation so far.
> >
> > The i.MX8MP Reference Manual provides formulas to calculate the
> > parameters based on the register values and I tried to make sense of it
> > using the existing register values in the driver. But somehow it doesn't
> > add up for me.
> >
> > Lucas, did you already work with the PLL parameters? By any chance, do
> > you now how the math behind them works?
> 
> I spent a little time trying to understand it a bit.  I created a PMS
> calculator similar to the one used on the DSI controller,

Great! I'll admit this also flies over my head and I don't have the
time to study this, so this is much appreciated.

> except that
> the M seems to be fixed at a value of 62 per the data sheet, so it's
> more of a PS calculator.

Hmm... PHY_REG2 in the datasheet only lists '0011_1110b - 62' as
example(?) values, but it doesn't say other values are reserved either,
I'm not sure what to make of it.
In the current driver PHY_REG_02 (driver macro) is assigned the first
field of .pll_div_regs, which goes anywhere from 0x4b to 0x7b -- pretty
far from 62(0x3e)...

Since other frequencies have been adjusting this main diviser ratio we
actually tried copying neighboring values and adjusting only that reg 2
(so the M if I get this right?), but the end result ended up not
synchronizing properly every time... We didn't have time to check with a
scope if the generated signal was ugly or if it just didn't lock
properly, but the display worked when we just re-used the neighboring
values without changing anything despite being ~3-4% off, so we took the
easy way out here and didn't dig much further.

> Anyway, When I run my P-S calculator to generate the 'best rate' I get
> a value that's usually 0.2% variance from nominal, but I only verified
> a handful of values:
> 
> Several which were +0.2%
> 297600000 vs 297000000 (4k@30)
> 148800000 vs 148500000 (1080p60)
> 74400 vs 74200
> 
> One value was -0.16%
> 24800000 vs 25200000
> 
> If the M value was a bit more flexible, we might be able to reduce
> that variance more.

Yes, I think the M value could be more flexible, but that'd require
checking if it actually works, whereas having slightly off frequencies
will most likely be OK so I don't think it's worth the effort -- happy
to stick to what the datasheet describes.

> If / when I get some time, I might play with trying to disable the
> fractional mode and just use the PMS calculator for simplicity despite
> the inaccuracy.  Maybe we could fall back to using the PMS calculator
> if the desired frequency isn't in the look-up-table.

That'd be greatly appreciated, I don't have any strong opinion on
whether that should completely replace the table, or only be used if
there is no exact match in the table as these are values we know will
work; but we can definitely test any patch you can throw at us here.


Cheers,
-- 
Dominique


