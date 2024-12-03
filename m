Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E5B9E30E5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 02:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B591510E4A3;
	Wed,  4 Dec 2024 01:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="OxiKsdGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EF110E4A3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 01:44:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AED348940F;
 Wed,  4 Dec 2024 02:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733276654;
 bh=vY9kPGS0RdiXB0OHZCmI9kH/oWg2qyslJ/GlqgoS874=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OxiKsdGRxNS7Xdu0tMCPtS62mOtLM/7/zbKsln5bTnZxcCAxW4IyRydn6ckF5zToI
 2knwzr4uqjZctkqgfqG2/XdrW4teL8Yd8c16CFXDRjf6t5PlX9oK9oAHAtdnexaJQJ
 P1rpf4NgH6zDZom1Gkf0pI6G2PkzuU+SkJs/V7Zfflf7kY7yEAJQJf01Ed4FwjiNDU
 vQYsUY8CHQIsDSULugkcFEBnAwsh2/6m1BKQT/OCg93ykB0j1nRGqlFyA89S3F4+GS
 2rJieYBhNc99vWOLe01jqNFhSckRQyvWSwM1f9FBlKmGlJZy6n8MijvCDFehud213r
 5ZfrvtJrc0mbg==
Message-ID: <b86666cc-da63-405d-9036-96cb4e69dafb@denx.de>
Date: Wed, 4 Dec 2024 00:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Nikolaus Voss <nv@vosn.de>
Cc: Liu Ying <victor.liu@oss.nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabio Estevam <festevam@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nikolaus.voss@haag-streit.com, miquel.raynal@bootlin.com
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <000b34cdd1591c82265ce1f9848828d1@vosn.de>
 <2c950130-84b4-4a81-84a2-b5e08af43616@oss.nxp.com>
 <12a1b86e-8f25-4875-8503-1de98f125a62@denx.de>
 <808d4092a9e97b95480d47c1bd84d930@vosn.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <808d4092a9e97b95480d47c1bd84d930@vosn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 12/3/24 8:20 AM, Nikolaus Voss wrote:
> On 03.12.2024 04:12, Marek Vasut wrote:
>> On 12/3/24 3:22 AM, Liu Ying wrote:
>>
>> [...]
>>
>>>>> I doubt that pixel clock tree cannot find appropriate division ratios
>>>>> for some pixel clock rates, especially for dual-link LVDS on i.MX8MP
>>>>> and i.MX93 platforms, because PLL clock rate should be 7x faster than
>>>>> pixel clock rate and 2x faster than "ldb" clock rate so that the 3.5
>>>>> folder between "ldb" clock and pixel clock can be met. That means the
>>>>> PLL clock rate needs to be explicitly set first for this case.
>>>>>
>>>>> Can you assign the PLL clock rate in DT to satisfy the "ldb" and pixel
>>>>> clock rates like the below commit does, if you use a LVDS panel?
>>>>>
>>>>> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>>>>> frequency to 506.8 MHz")
>>>>
>>>> I probably could. The point of my patch is you don't have to know in
>>>> advance which LVDS panel is connected, and you don't have to calculate
>>>> the base PLL clock by hand and store it in the device tree.
>>>>
>>>> In my test system, I have three different LVDS panels with EDID EEPROM,
>>>> none of which worked with the stock driver, but all work with this
>>>> patch.
>>>> With slightly adapted pixel clocks though.
>>>
>>> If each of the three LVDS panels has only one display mode, you may
>>> assign the PLL clock rates in DT overlays for the panels.
>> I temporarily agree.
>>
>> I also currently use DTOs for various panels including their PLL
>> setting, but in the end, I think/hope the work of Miquel and co. is
>> going to make that PLL setting part unnecessary.
> 
> That is exactly what my patch is about. I want to use one DT for all
> panels

Right

> and store the panel's timing in EDID EEPROM.
Oh, that is a new one. Does the EDID EEPROM store the entirety of 
'struct display_timing {}' somehow , or is that a custom format ?
