Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A699B72A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 23:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2909810E366;
	Sat, 12 Oct 2024 21:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="gt4a5y0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7424D10E366
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 21:26:09 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3ACA188E0A;
 Sat, 12 Oct 2024 23:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728768367;
 bh=BPbjybVYso2SsvCjYT5dmUDnHzZPpdXSHwTTR6enMnU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gt4a5y0AtemogG14/BXObAu+4lMg5Gc5nNf0ht4KlJttecfVW13cV5dx60/JxXcHY
 hGskR8TPasXfxZnA626Q+MIjXzlc3sfMlETWOZ1Few2SMuxlfPD6qif+QNqWjiJjvj
 aXsHxax570VDWSJe2dvq12Xiwe2v+8eSRgpNcTyREIrukaDBEvhbJAr8OGW44lcoSr
 fPcSu4UD44X8t5eXhTbHBwxe9XJUVo2qXGjFEzFRhwZvO+F8e4HIYKGhKsZuM0KsFx
 sPk5IWkkmJklqbd+QBM7iIrL5RwVM0JL/BZ2PeMnj1Sgq+jRblnw5Z+XdlcegitBwI
 WqD/bUbyyEWQg==
Message-ID: <d99e0021-3253-4312-9b50-6031ae0f8d8e@denx.de>
Date: Sat, 12 Oct 2024 23:07:13 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
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

On 10/11/24 8:18 AM, Liu Ying wrote:
> On 10/11/2024, Marek Vasut wrote:
>> On 10/10/24 7:22 AM, Liu Ying wrote:
>>> On 10/09/2024, Marek Vasut wrote:
>>>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>>>> results in accurate serializer clock.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Peng Fan <peng.fan@nxp.com>
>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: imx@lists.linux.dev
>>>> Cc: kernel@dh-electronics.com
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-clk@vger.kernel.org
>>>> ---
>>>>    drivers/clk/imx/clk-imx8mp.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>>>> index 516dbd170c8a3..2e61d340b8ab7 100644
>>>> --- a/drivers/clk/imx/clk-imx8mp.c
>>>> +++ b/drivers/clk/imx/clk-imx8mp.c
>>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>>>        hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>>>        hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>>>        hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>>>> -    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>>>> +    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>>>
>>> This patch would cause the below in-flight LDB bridge driver
>>> patch[1] fail to do display mode validation upon display modes
>>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
>>
>> Why ?
> 
> Mode validation is affected only for dual LVDS link mode.
> For single LVDS link mode, this patch does open more display
> modes read from the DDC I2C bus.  The reason behind is that
> LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
> link mode, while it's 7 for single LVDS link mode.
> 
> In my system, "video_pll1" clock rate is assigned to 1.0395GHz
> in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
> clock rate, "media_ldb" clock rate is 519.75MHz and
> "media_disp2_pix" clock rate is 148.5MHz, which is fine for
> dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
> with 148.352MHz pixel clock rate, "video_pll1" clock rate will
> be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
> and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
> too because "media_disp2_pix" clock cannot handle the 3.5
> division ratio from "video_pll1_out" clock running at
> 519.232MHz.  See the below clk_summary.

Shouldn't this patch help exactly with that ?

It should allow you to set video_pll1_out to whatever is necessary by 
LDB first, fixate that frequency, and the LCDIFv3 would then be forced 
to use /7 divider from faster Video PLL1 , right ?

>      video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id
>         video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id
>            video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id
>               video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id
>                  media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>                     media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb
>                                                                                                                               deviceless                      no_connection_id
>                  media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id
>                     media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix
>                                                                                                                               32ec0000.blk-ctrl               disp1
>                                                                                                                               deviceless                      no_connection_id
>                  media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id
>                     media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix
>                                                                                                                               32ec0000.blk-ctrl               disp2
>                                                                                                                               deviceless                      no_connection_id
> 
> Single LVDS link mode is not affected because "media_disp2_pix"
> clock can handle the 7 division ratio.
> 
> To support the dual LVDS link mode, "video_pll1" clock rate needs
> to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
> can use 7 division ratio to achieve the /3.5 clock rate comparing
> to "media_ldb" clock rate.  However, "video_pll1" is not seen by
> LDB driver thus not directly controlled by it.  This is another
> reason why assigning a reasonable "video_pll1" clock rate in DT
> makes sense.

I agree that _right_now_, the DT clock assignment is the only option.
I would like to see that DT part disappear and instead would prefer if 
the LDB/LCDIF could figure out the clock tree configuration themselves.

>> Also, please Cc me on fsl-ldb.c patches.
> 
> Ok, will do.  BTW, if MAINTAINERS is updated, then you'll always
> receive fsl-ldb.c patches.

Thanks

>>> Unsupported display modes cannot be ruled out.  Note that
>>> "media_ldb" is derived from "video_pll1_out" by default as the
>>> parent is set in imx8mp.dtsi.  And, the only 4 rates supported
>>> by "video_pll1" are listed in imx_pll1443x_tbl[] - 1.0395GHz,
>>> 650MHz, 594MHz and 519.75MHz.
>> I disagree with this part, since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") the 1443x PLLs can be configured to arbitrary rates which for video PLL is desirable as those should produce accurate clock.
> 
> Kinda ack - that commit does open up many more clock rates.
> But, the commit just says dynamic rates, not arbitrary rates or
> any rate.
I am fine with that.
