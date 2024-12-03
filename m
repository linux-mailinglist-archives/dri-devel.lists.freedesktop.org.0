Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFD9E1201
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 04:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43F310E1A9;
	Tue,  3 Dec 2024 03:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="yQFZJ2iQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694310E1A9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 03:48:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D617F88730;
 Tue,  3 Dec 2024 04:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733197682;
 bh=+/gNxv5RfQAZz4MiyMIhky8lX1u5Q4AQYKE91+pBjCY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=yQFZJ2iQ+CQnEsTy0Tqeb8tm3G+DtPFSufq0Pa1uZupj+/hSiYfh70rgeLgHOSw72
 gd5cGvscyZ6zSPdbLpQxbkXT8A6JDxVNdWDpD6k1NmFSuPkUMEI3l/ot8cMBpYoPs+
 fheYu1hWGwFafC8qs4ViOXK59gT96y2mnkBmNsctB5cTNWid9RsEtwE+RBn2sj9SUM
 zL2QLOI5fAsUkmfotbGDy6OASwKagvaAM8IQfI7/yvh2h24Ixc13hi26LDWrPdSvRP
 5heQ85zmVAyhtUGYSg4ols69NFi7zs+Uw8toEtgZFcNS9zZrbRHn4SQjDVsAZxMQtk
 z+J0uW40Vw9Cw==
Message-ID: <12a1b86e-8f25-4875-8503-1de98f125a62@denx.de>
Date: Tue, 3 Dec 2024 04:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
To: Liu Ying <victor.liu@oss.nxp.com>, Nikolaus Voss <nv@vosn.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2c950130-84b4-4a81-84a2-b5e08af43616@oss.nxp.com>
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

On 12/3/24 3:22 AM, Liu Ying wrote:

[...]

>>> I doubt that pixel clock tree cannot find appropriate division ratios
>>> for some pixel clock rates, especially for dual-link LVDS on i.MX8MP
>>> and i.MX93 platforms, because PLL clock rate should be 7x faster than
>>> pixel clock rate and 2x faster than "ldb" clock rate so that the 3.5
>>> folder between "ldb" clock and pixel clock can be met. That means the
>>> PLL clock rate needs to be explicitly set first for this case.
>>>
>>> Can you assign the PLL clock rate in DT to satisfy the "ldb" and pixel
>>> clock rates like the below commit does, if you use a LVDS panel?
>>>
>>> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>>> frequency to 506.8 MHz")
>>
>> I probably could. The point of my patch is you don't have to know in
>> advance which LVDS panel is connected, and you don't have to calculate
>> the base PLL clock by hand and store it in the device tree.
>>
>> In my test system, I have three different LVDS panels with EDID EEPROM,
>> none of which worked with the stock driver, but all work with this
>> patch.
>> With slightly adapted pixel clocks though.
> 
> If each of the three LVDS panels has only one display mode, you may
> assign the PLL clock rates in DT overlays for the panels.
I temporarily agree.

I also currently use DTOs for various panels including their PLL 
setting, but in the end, I think/hope the work of Miquel and co. is 
going to make that PLL setting part unnecessary.
