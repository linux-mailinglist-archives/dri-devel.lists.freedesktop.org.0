Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727A6E5518
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F3510E0FE;
	Mon, 17 Apr 2023 23:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C57E10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 23:23:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5C81E837A7;
 Tue, 18 Apr 2023 01:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681773811;
 bh=LCsMthDhyYWENEbRzaTVRwOHdppq61Ge4OVid4ZaLlI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iRcBAgqDR7ASOkNCOU0CGVqDFJ7sFNxfc4dJpCCCU5GiSIrdIo81xx+pPu5CDSOqR
 4I3fDEAEFFNQRdVczCU+gm8/hWq5znEw6EtIDvNM0zpsIvQLze9ENOtuCzT2+pCLe5
 RAMJCVel32BYkKsbHtqB6jXE2xP5y1M8YL/lEde9krZrTGQaP+YKPezcaIdXiozfLT
 XfCGt9lz2Tz21wVexKVvM4n+tmaOXnaUZCeoGdQB6emwrRk4bbSoOLQTnX6ggPq01Z
 A1mqH973Q8At89rskp7UmIsGw2/oyTJ8y09mFKn68VMfyFh+BfndwVBX34JH44s3GS
 vAuIq4hkKlXEw==
Message-ID: <ac7ce475-23dd-4d9d-afd1-ad139496a510@denx.de>
Date: Tue, 18 Apr 2023 01:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Adam Ford <aford173@gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-5-aford173@gmail.com>
 <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
 <CAHCN7x+NUnMtLbj_7A_uqxPsi5NXRXsPFwDnn=sf1bgm-Q-BsQ@mail.gmail.com>
 <88e53197-2819-c068-eba6-a218a19d8d15@denx.de>
 <CAHCN7xLbbyTaN43pJe3NMdupoGb5vC3yXc_vBn6+CRChWCt92A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xLbbyTaN43pJe3NMdupoGb5vC3yXc_vBn6+CRChWCt92A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/18/23 00:24, Adam Ford wrote:
> On Mon, Apr 17, 2023 at 3:08 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 4/17/23 13:57, Adam Ford wrote:
>>> On Sun, Apr 16, 2023 at 5:13 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 4/15/23 12:41, Adam Ford wrote:
>>>>> The high-speed clock is hard-coded to the burst-clock
>>>>> frequency specified in the device tree.  However, when
>>>>> using devices like certain bridge chips without burst mode
>>>>> and varying resolutions and refresh rates, it may be
>>>>> necessary to set the high-speed clock dynamically based
>>>>> on the desired pixel clock for the connected device.
>>>>
>>>> The link rate negotiation should happen internally between the nearest
>>>> bridge and DSIM, so please add that to DRM core instead of hacking
>>>> around it by tweaking the HS clock again.
>>>
>>> I thought you tried to add something like this before and had some resistance.
>>
>> Yes, all my attempts were rejected by a single reviewer. I suspended my
>> efforts in that area for now.
>>
>>> The Pixel clock is set by the bridge already without any new code
>>> added to the DRM core..  I am just reading that value that's there,
>>> and setting the clock accordingly.  I don't see how this is a hack.
>>
>> Assume you have a DSI-to-HDMI bridge attached to your DSIM bridge, it
>> operates in non-burst mode, like ADV7533 . How would you configure the
> 
> I have an ADV7535
> 
>> HS clock rate for such a bridge in DT ? (hint: you cannot, because the
>> required clock comes from the EDID, which may not be available just yet)
> 
> The whole idea is that you wouldn't want to or need to configure the
> clock speed in the device tree because it comes from the
> EDID->bridge->DSI.
> 
> I've tested this configuration on imx8mm, imx8mn, and imx8mp and I can
> change the resolution and refresh rate on the fly and the DSI will
> automatically readjust accordingly.   If you fixed the clock in the
> device tree, you wouldn't be able to do that, and that was the point
> of this patch.

Uh, I retract my comment, I was clearly confused here and we're talking 
about the same thing.
