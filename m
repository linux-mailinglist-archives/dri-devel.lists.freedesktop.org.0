Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5B6F0C5F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 21:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E810E109;
	Thu, 27 Apr 2023 19:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B823810E109
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:09:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65910637E8;
 Thu, 27 Apr 2023 19:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAF8C433EF;
 Thu, 27 Apr 2023 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682622594;
 bh=4MuGyWTQQD8YDc9ZDP5EuTvCXfhs1RGXEGefTe8GbFs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OEyoAdAg2oHj1kpUaFAUQnORGNgUcMTwXna94WirWc4/7OFURAmKcVKLlVxGAFkME
 toxsg2t0o0U7Q+9nKKAWfOe1B/t1z3g1kRabot2L3KU7VvngL293h0JsGHTQ534ZJP
 wb/t5pQP0ryuyOaWJAQ0Akswuclq647TVGmt1KHHbj8adW21pY6mXqBy4ogxoG3XiT
 nl8v4DuX6FhDVh3IAmmeTltphT6HmwSaAdaxUAAee3iYvoH2HR36H28EF1sUk2sy35
 kac9ZjDMYlfFNHS8ZZYJ4TPcDUlbU3BEvZYy9X6SsaJklf3YKOr0nvFwrR0eNy/XBZ
 ccVK16xunjKbA==
Message-ID: <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
Date: Thu, 27 Apr 2023 14:09:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 29/65] clk: socfpga: gate: Add a determine_rate hook
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-29-9a1358472d52@cerno.tech>
 <679921ee-98d4-d6ef-5934-e009fd4b31fc@kernel.org>
 <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <sjlp5ubnpvulgwhhymmfkmmobkgxacyqwagqozodkee3di2qik@3igj6k3zgbk6>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-tegra@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 4/25/23 09:48, Maxime Ripard wrote:
> Hi Dinh,
> 
> On Mon, Apr 24, 2023 at 01:32:28PM -0500, Dinh Nguyen wrote:
>> On 4/4/23 05:11, Maxime Ripard wrote:
>>> The SoCFGPA gate clock implements a mux with a set_parent hook, but
>>> doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>> The other trigger would be a call to clk_set_parent(), but it's far less
>>> used, and it doesn't look like there's any obvious user for that clock.
>>>
>>> So, the set_parent hook is effectively unused, possibly because of an
>>> oversight. However, it could also be an explicit decision by the
>>> original author to avoid any reparenting but through an explicit call to
>>> clk_set_parent().
>>>
>>> The latter case would be equivalent to setting the flag
>>> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
>>> to __clk_mux_determine_rate(). Indeed, if no determine_rate
>>> implementation is provided, clk_round_rate() (through
>>> clk_core_round_rate_nolock()) will call itself on the parent if
>>> CLK_SET_RATE_PARENT is set, and will not change the clock rate
>>> otherwise. __clk_mux_determine_rate() has the exact same behavior when
>>> CLK_SET_RATE_NO_REPARENT is set.
>>>
>>> And if it was an oversight, then we are at least explicit about our
>>> behavior now and it can be further refined down the line.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>    drivers/clk/socfpga/clk-gate.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
>>> index 32ccda960f28..cbba8462a09e 100644
>>> --- a/drivers/clk/socfpga/clk-gate.c
>>> +++ b/drivers/clk/socfpga/clk-gate.c
>>> @@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
>>>    static struct clk_ops gateclk_ops = {
>>>    	.recalc_rate = socfpga_clk_recalc_rate,
>>> +	.determine_rate = __clk_mux_determine_rate,
>>>    	.get_parent = socfpga_clk_get_parent,
>>>    	.set_parent = socfpga_clk_set_parent,
>>>    };
>>> @@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device_node *node)
>>>    	init.name = clk_name;
>>>    	init.ops = ops;
>>> -	init.flags = 0;
>>> +	init.flags = CLK_SET_RATE_NO_REPARENT;
>>>    	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
>>>    	if (init.num_parents < 2) {
>>>
>>
>> This patch broke SoCFPGA boot serial port. The characters are mangled.
> 
> Do you have any other access to that board? If so, could you dump
> clk_summary in debugfs with and without that patch?
> 

That dump from the clk_summary are identical for both cases.
