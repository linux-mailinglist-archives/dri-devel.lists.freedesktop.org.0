Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45C6FCCE3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DFB10E3BA;
	Tue,  9 May 2023 17:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A63E10E3BA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 17:38:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F22FD635E1;
 Tue,  9 May 2023 17:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505E9C433D2;
 Tue,  9 May 2023 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683653903;
 bh=MGShGh6VlR3Hv1wloISBcqQ3c580bpsFZyJYjZpPIOc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SZZkL4vQkF3AJdtwH9gbqGDk+xHHq8tV5XNIdopJaR4FlgR4t0ooio/8DGBpkkDI1
 9XvZh/u8VrwtVLR6+bWUtuZfy3ka3/YOGDr13I6xXvr+C2HbOIlR3sg+oRq+s6WkaX
 Rkqh5xGd0kOzk1YjGukRVB1zds+TGaaDX2jB0kRdTsqYsrkO3Ft7JAKYCh7PMGBLpW
 alJPaiC0i7aYN/8emkDIP9Xwx4f44X6MEjZhGFJkaNCeUuWlR3XsB9wLz22IZkVMf/
 NN+1vwZ7hdXXNsKoUMdjVg4qk+znXu6AnK8f8h7pRveIc4z909KgFaPptU75ZM77M2
 VmsQjc6DYnN7Q==
Message-ID: <1b766164-b5e8-61ac-bf73-6d2c49c72409@kernel.org>
Date: Tue, 9 May 2023 12:37:39 -0500
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
 <57dd81d0-510e-0fab-670d-1109eb8dd974@kernel.org>
 <tgtfisqxubin4cjj6q26fboirbcnjzcazt5y3m322lw5lskz6l@d3tgz4hdfnk2>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <tgtfisqxubin4cjj6q26fboirbcnjzcazt5y3m322lw5lskz6l@d3tgz4hdfnk2>
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

On 5/4/23 12:04, Maxime Ripard wrote:
> Hi Dinh,
> 
> On Thu, Apr 27, 2023 at 02:09:48PM -0500, Dinh Nguyen wrote:
>> Hi Maxime,
>>
>> On 4/25/23 09:48, Maxime Ripard wrote:
>>> Hi Dinh,
>>>
>>> On Mon, Apr 24, 2023 at 01:32:28PM -0500, Dinh Nguyen wrote:
>>>> On 4/4/23 05:11, Maxime Ripard wrote:
>>>>> The SoCFGPA gate clock implements a mux with a set_parent hook, but
>>>>> doesn't provide a determine_rate implementation.
>>>>>
>>>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>>>> change the parent of a clock. However, the most likely candidate to
>>>>> trigger that parent change is a call to clk_set_rate(), with
>>>>> determine_rate() figuring out which parent is the best suited for a
>>>>> given rate.
>>>>>
>>>>> The other trigger would be a call to clk_set_parent(), but it's far less
>>>>> used, and it doesn't look like there's any obvious user for that clock.
>>>>>
>>>>> So, the set_parent hook is effectively unused, possibly because of an
>>>>> oversight. However, it could also be an explicit decision by the
>>>>> original author to avoid any reparenting but through an explicit call to
>>>>> clk_set_parent().
>>>>>
>>>>> The latter case would be equivalent to setting the flag
>>>>> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
>>>>> to __clk_mux_determine_rate(). Indeed, if no determine_rate
>>>>> implementation is provided, clk_round_rate() (through
>>>>> clk_core_round_rate_nolock()) will call itself on the parent if
>>>>> CLK_SET_RATE_PARENT is set, and will not change the clock rate
>>>>> otherwise. __clk_mux_determine_rate() has the exact same behavior when
>>>>> CLK_SET_RATE_NO_REPARENT is set.
>>>>>
>>>>> And if it was an oversight, then we are at least explicit about our
>>>>> behavior now and it can be further refined down the line.
>>>>>
>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>> ---
>>>>>     drivers/clk/socfpga/clk-gate.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
>>>>> index 32ccda960f28..cbba8462a09e 100644
>>>>> --- a/drivers/clk/socfpga/clk-gate.c
>>>>> +++ b/drivers/clk/socfpga/clk-gate.c
>>>>> @@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
>>>>>     static struct clk_ops gateclk_ops = {
>>>>>     	.recalc_rate = socfpga_clk_recalc_rate,
>>>>> +	.determine_rate = __clk_mux_determine_rate,
>>>>>     	.get_parent = socfpga_clk_get_parent,
>>>>>     	.set_parent = socfpga_clk_set_parent,
>>>>>     };
>>>>> @@ -166,7 +167,7 @@ void __init socfpga_gate_init(struct device_node *node)
>>>>>     	init.name = clk_name;
>>>>>     	init.ops = ops;
>>>>> -	init.flags = 0;
>>>>> +	init.flags = CLK_SET_RATE_NO_REPARENT;
>>>>>     	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
>>>>>     	if (init.num_parents < 2) {
>>>>>
>>>>
>>>> This patch broke SoCFPGA boot serial port. The characters are mangled.
>>>
>>> Do you have any other access to that board? If so, could you dump
>>> clk_summary in debugfs with and without that patch?
>>>
>>
>> That dump from the clk_summary are identical for both cases.
> 
> Thanks for testing
> 
> I'm a bit confused, there should be no difference in behaviour, and if
> there was any difference I would expect the clock tree to be somewhat
> different.
> 
> Could you still paste the clk_summary (and dmesg) output? Which UART
> driver is being used?
> 
> Also, is there a way for me to test it somehow?
> 

Apologies, but there is a diff with/without this patch:

With patch:
<           l4_sp_clk                   3        3        0   100000000 
         0     0  50000         ?
---
Without patch:
 >           l4_sp_clk                   4        4        0   100000000 
          0     0  50000         ?

The enable/prepare count is 4 instead of 3 in the case of a working 
UART. The debug uart is using the lp_sp_clk.


The Cyclone5 devkits are pretty cheap if you want to get one.

Here is the full out of clk_summary:

# cat /sys/kernel/debug/clk/clk_summary
                                  enable  prepare protect 
                 duty  hardware
    clock                          count    count    count rate 
accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
  osc1                                 5        5        0 25000000 
     0     0  50000         Y
     sdram_pll                         0        0        0 800000000 
      0     0  50000         Y
        h2f_usr2_clk                   0        0        0 133333333 
      0     0  50000         Y
           h2f_user2_clk               0        0        0 133333333 
      0     0  50000         ?
        ddr_dq_clk                     0        0        0 400000000 
      0     0  50000         Y
           ddr_dq_clk_gate             0        0        0 400000000 
      0     0  50000         ?
        ddr_2x_dqs_clk                 0        0        0 800000000 
      0     0  50000         Y
           ddr_2x_dqs_clk_gate         0        0        0 800000000 
      0     0  50000         ?
        ddr_dqs_clk                    0        0        0 400000000 
      0     0  50000         Y
           ddr_dqs_clk_gate            0        0        0 400000000 
      0     0  50000         ?
     periph_pll                        3        3        0 1000000000 
       0     0  50000         Y
        h2f_usr1_clk                   0        0        0 1953125 
    0     0  50000         Y
           h2f_user1_clk               0        0        0 1953125 
    0     0  50000         ?
        per_base_clk                   4        4        0 200000000 
      0     0  50000         Y
           gpio_db_clk                 0        0        0 32000 
  0     0  50000         ?
           can1_clk                    0        0        0 40000000 
     0     0  50000         ?
           can0_clk                    0        0        0 100000000 
      0     0  50000         ?
           spi_m_clk                   1        1        0 200000000 
      0     0  50000         ?
           usb_mp_clk                  1        1        0 200000000 
      0     0  50000         ?
           l4_sp_clk                   4        4        0 100000000 
      0     0  50000         ?
           l4_mp_clk                   1        1        0 100000000 
      0     0  50000         ?
        per_nand_mmc_clk               1        1        0 200000000 
      0     0  50000         Y
           nand_x_clk                  0        0        0 200000000 
      0     0  50000         ?
              nand_clk                 0        0        0 50000000 
     0     0  50000         ?
              nand_ecc_clk             0        0        0 200000000 
      0     0  50000         ?
           sdmmc_clk                   1        1        0 200000000 
      0     0  50000         ?
              sdmmc_clk_divided        1        1        0 50000000 
     0     0  50000         ?
        per_qsi_clk                    0        0        0 1953125 
    0     0  50000         Y
        emac1_clk                      1        1        0 250000000 
      0     0  50000         Y
           emac_1_clk                  1        1        0 250000000 
      0     0  50000         ?
        emac0_clk                      0        0        0 1953125 
    0     0  50000         Y
           emac_0_clk                  0        0        0 1953125 
    0     0  50000         ?
     dbg_base_clk                      0        0        0 6250000 
    0     0  50000         Y
        dbg_timer_clk                  0        0        0 6250000 
    0     0  50000         ?
        dbg_trace_clk                  0        0        0 6250000 
    0     0  50000         ?
        dbg_at_clk                     0        0        0 6250000 
    0     0  50000         ?
           dbg_clk                     0        0        0 3125000 
    0     0  50000         ?
     main_pll                          2        3        0 1850000000 
       0     0  50000         Y
        cfg_h2f_usr0_clk               0        0        0 123333333 
      0     0  50000         Y
           h2f_user0_clk               0        0        0 123333333 
      0     0  50000         ?
           cfg_clk                     0        0        0 123333333 
      0     0  50000         ?
        main_nand_sdmmc_clk            0        0        0 3613281 
    0     0  50000         Y
        main_qspi_clk                  1        1        0 370000000 
      0     0  50000         Y
           qspi_clk                    1        1        0 370000000 
      0     0  50000         ?
        mainclk                        0        1        0 370000000 
      0     0  50000         Y
           l3_mp_clk                   0        0        0 185000000 
      0     0  50000         ?
              l3_sp_clk                0        0        0 92500000 
     0     0  50000         Y
           l3_main_clk                 0        0        0 370000000 
      0     0  50000         Y
           l4_main_clk                 0        1        0 370000000 
      0     0  50000         ?
        mpuclk                         1        1        0 925000000 
      0     0  50000         Y
           mpu_l2_ram_clk              0        0        0 462500000 
      0     0  50000         Y
           mpu_periph_clk              1        1        0 231250000 
      0     0  50000         Y


Dinh
