Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57699ABAC8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 02:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD3510E10E;
	Wed, 23 Oct 2024 00:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="l8PhXhSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2382D10E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 00:59:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC1FF892AA;
 Wed, 23 Oct 2024 02:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729645174;
 bh=ECHHQ56CDB7f7hscf7vZFKjxE3wM97b9Tgz1zhQLshU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l8PhXhSBtuVdvk/jcLiL4dixQulDnPaUq2fuCkwb4Bj7jzWR/XFOM/ItHUfQOMBA/
 ZdwgkF6iAu4pMMOj3NCg/YJeUBc8dBg1mQv6tVLaTrA5Bv/5BJH3B11RUfSv3VVJWH
 SmTvkVu6MpTgliDohLBlS+uMm9YJD1w3FrVbOepOCVqoQPAkbFU8LSNAa0zDVuJs51
 HgSc7LOOtni52tPR1OpjjZk2jkC//yt5c8BXn6RlK/mx5PXafKnu3lz63e8OxuCk1m
 xwJwKqs/1fdq3bHXIZnhkCumNMa+/6kTpNZFeICTBU2AAaCPDieY9mIFMSWLBQ3ypR
 Yit392nciguPg==
Message-ID: <1f5e9559-59f8-490b-9cb2-2f8d4a8823e6@denx.de>
Date: Wed, 23 Oct 2024 02:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
 <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
 <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
 <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d1307426-9a86-4356-93b8-9a10c8369ad8@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/22/24 8:13 AM, Liu Ying wrote:

[...]

>>>>> This patch would cause the below in-flight LDB bridge driver
>>>>> patch[1] fail to do display mode validation upon display modes
>>>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>>>
>>>> Why ?
>>>
>>> Mode validation is affected only for dual LVDS link mode.
>>> For single LVDS link mode, this patch does open more display
>>> modes read from the DDC I2C bus.  The reason behind is that
>>> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
>>> link mode, while it's 7 for single LVDS link mode.
>>>
>>> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
>>> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
>>> clock rate, "media_ldb" clock rate is 519.75MHz and
>>> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
>>> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
>>> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
>>> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
>>> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
>>> too because "media_disp2_pix" clock cannot handle the 3.5
>>> division ratio from "video_pll1_out" clock running at
>>> 519.232MHz.  See the below clk_summary.
>>
>> Shouldn't this patch help exactly with that ?
> 
> No, it doesn't help but only makes clk_round_rate() called in
> LDB driver's .mode_valid() against 148.352MHz return 148.352MHz
> which allows the unexpected 1920x1080-59.94Hz display mode.

Why is 1920x1080-59.94Hz mode unexpected in the first place ?
I assume your display device reports that it supports this mode, and now 
the scanout engine and LDB can generate this mode too ? Or does the 
display device NOT support this mode ?

>> It should allow you to set video_pll1_out to whatever is necessary by LDB first, fixate that frequency, and the LCDIFv3 would then be forced to use /7 divider from faster Video PLL1 , right ?
> 
> Yes, it allows that for single-link LVDS use cases.
> And, __no__, for dual-link LVDS use cases because the
> video_pll1_out clock rate needs to be 2x the LVDS serial clock
> rate.

Can't the LDB still set the Video PLL frequency to whatever it needs 
first, fixate it, and only then let the LCDIFv3 divide the frequency 
down ? (sorry, I am a bit tired today, maybe I am missing the obvious)

>>>       video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>>>          video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>>>             video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>>>                video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>>>                   media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>                      media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>>>                                                                                                                                deviceless                      no_connection_id
>>>                   media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>>>                      media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>>>                                                                                                                                32ec0000.blk-ctrl               disp1
>>>                                                                                                                                deviceless                      no_connection_id
>>>                   media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>>>                      media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>>>                                                                                                                                32ec0000.blk-ctrl               disp2
>>>                                                                                                                                deviceless                      no_connection_id
>>>
>>> Single LVDS link mode is not affected because "media_disp2_pix"
>>> clock can handle the 7 division ratio.
>>>
>>> To support the dual LVDS link mode, "video_pll1" clock rate needs
>>> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
>>> can use 7 division ratio to achieve the /3.5 clock rate comparing
>>> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
>>> LDB driver thus not directly controlled by it.  This is another
>>> reason why assigning a reasonable "video_pll1" clock rate in DT
>>> makes sense.
>>
>> I agree that _right_now_, the DT clock assignment is the only option.
>> I would like to see that DT part disappear and instead would prefer if the LDB/LCDIF could figure out the clock tree configuration themselves.
> 
> I think we'll live with the assigned clock rate in DT, because the
> i.MX8MP LDB and Samsung MIPI DSI display pipelines need to share a
> video PLL, like I mentioned in comments for patch 2.

They do NOT need to share a PLL, you can use e.g. PLL3 for one and Video 
PLL for the other if the requirement is accurate pixel clock .

[...]
