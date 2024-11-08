Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFD49C2228
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 17:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFBF10EA13;
	Fri,  8 Nov 2024 16:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="D1lJq6uU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2024 14:13:36 UTC
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C391910E9C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:13:36 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
 by cmsmtp with ESMTPS
 id 92gYtJtThg2lz9Pd4tku4o; Fri, 08 Nov 2024 14:06:26 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id 9Pd1tj9h3IVD39Pd2tAKJR; Fri, 08 Nov 2024 14:06:25 +0000
X-Authority-Analysis: v=2.4 cv=IIcECBvG c=1 sm=1 tr=0 ts=672e1ae1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=N0_SVMCKczatFtdaR1UA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0sUQjvOBk5B7kF86MBReNvaIgs7XdYt9a7X6u95KvI=; b=D1lJq6uUB2SbYrHNUsyv+lKoap
 tPXxNaSsKzycBkj8viPTPeuQzaW2EhEhocHzUx+kw5ShOtGEToD5zrtzAtnPgPAyJvO3EJOCY3Ys9
 C9Grhy7VZFJ2EWAAAjMwO8iFmLWwygp8FBgFyIFI2v4OZCeZs3OY4w3TBaVchSyO2hCYoOGETBvsh
 O/uJcRK84TBuP/s2oBKlhvP9lFNUfF6nwmitZ9jq1YnbHnXsocIhpDzeS3VNWZOPebThnK3zMui5+
 ivFDNY/bWMMhJS0Ijpp8xZl3+Qbk5zo6eqGElJf64EWJHO57KjEUPpjfwPAj6HS9AyRRsOAp5Pl66
 3o3FL5cw==;
Received: from [122.165.245.213] (port=41996 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1t9Pcx-001wS1-09;
 Fri, 08 Nov 2024 19:36:19 +0530
Message-ID: <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
Date: Fri, 8 Nov 2024 19:36:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>, Andre Przywara <andre.przywara@arm.com>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <Zy4SKCBwce3q0yj5@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t9Pcx-001wS1-09
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:41996
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPsVs6k6oThOTx2SYCnsDT7DQ6zmIbXfnUfHVMPPart48ByywQIeFg1x+GO4wQL/u+MjEIgFAcMWxtbvxTrkklOnedldg2t/POz4sFMuxbWfPZ5Sl0ib
 5DhZ0JYL4kI6oDTEctVEwaUSWtpTHbgScJxajhqTEgP8RBa8J+OURbx1jQlPc83zX/eNYJLb0lt+EqQW6CJZ4J4dOfrbEWdhxGXPnRuBaSf/873vW9G/LnjY
X-Mailman-Approved-At: Fri, 08 Nov 2024 16:33:34 +0000
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

On 11/8/24 6:59 PM, John Watts wrote:
> On Fri, Nov 08, 2024 at 11:53:57AM +0000, Andre Przywara wrote:
>> Hi John,
> 
> Hi Andre!
> 
>> Can you say *why* this patch is needed? Is there something broken that
>> needs fixing? Where does this show and why wasn't this a problem before?
> 
> Oops, that's a good point. There is currently a bug where the LCD output will
> be tinted. I have full context here which I should have probably linked in the
> patch description:
> 
> https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/T/#u
> 
>> To be honest, given the isolation on this patch, I'd rather wait for this
>> full fledged solution, especially if there is no pressing need (see above).
> 
> I'd be interested to hear if that's still the wanted solution given the link
> above. This currently blocks many people from having working LCD output.
> 
> Doing it the proper way might be overkill for now unless someone deliberately
> tries to run two DEs to the same output. I haven't seen this use case.
> 
> Allwinner kernel fork initially sets them up to values like these then makes
> sure both DEs can't be set to the same TCON.
> 
>>> -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
>>> +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
>>
>> Sorry, but that looks weird:
>> First, please explain the 0x20. Is it bit 5? If yes, what does that bit
>> mean? The commit message suggests you know that?
>>
>> And second: the comment above clearly states that those two writes just
>> *clear* some registers, to have some sane base line. So please adjust this
>> comment, and copy in some of the rationale from the commit message.
>> Explaining things in the commit message is good (so thanks for that!), but
>> having at least some terse technical explanations near the code, in a
>> comment, is better.
> 
> Bit 5 is value 3 of TCON_TOP_PORT_DE1_MSK. The R40 datasheet explains the
> values of both masks as follows:
> 
> 00: TCON_LCD0
> 01: TCON_LCD1
> 10: TCON_TV0
> 11: TCON_TV1
> 
> So this sets DE1's input to DE0.

To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
R40) states the priority of the DE selection, which fails to work? Not sure,
may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.

With A133 following the same as T113 with single mixer without TV, still
sets 0x20 in vendor kernel.

copied from R40:
Note: The priority of DE0 is higher than DE1.
If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
DE0 will be used for the source of TCON_LCD0.

Thanks,
Parthiban

> 
>>
>> Cheers,
>> Andre
> 
> Thanks,
> John Watts
> 

