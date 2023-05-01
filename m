Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6A6F3196
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 15:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6C10E0A2;
	Mon,  1 May 2023 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2810E0A2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 13:42:02 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Q94BX2xRGz9sVh;
 Mon,  1 May 2023 15:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1682948516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqYP4L/dOQIMjnG4KNToVeLEt+0G6LtXeDVBdi/r+Rg=;
 b=zvcWH6KBDacptU5xkzi9uKyNMs3di7lqxMKl+ZHDf60qM2JjAQ9YphAvYDVbSp4Nk5p3/k
 BNusxtiVRWr91z42j93X8ZpJYR5717bDOnVJph+9WTy2BrlkdYDGy22ceS6sXfVnhzrH6z
 KDjDIkH59HlUqz0l4EtylDF5dJZda7BZhbKxBzcwzkf8sjq6ic08nLD+/7fYSRz6Efo4y6
 ex2mdqmCTcVJH6vbiNj/NPkEf6hMLyz/VslpjDVkzIAoQNHd6F161qrCm4jkAXIa2bOC86
 UFCOnfPeOhh2mQECnozaInvlast3VtVl1lwR1qngUtWw5XKKjtrTCbxqrYYffA==
References: <20230418074008.69752-1-me@crly.cz> <87cz3uzpx1.fsf@oltmanns.dev>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 0/7] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
Date: Mon, 01 May 2023 15:40:49 +0200
In-reply-to: <87cz3uzpx1.fsf@oltmanns.dev>
Message-ID: <87mt2o9njh.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4Q94BX2xRGz9sVh
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Beranek <me@crly.cz>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime, Jernej, I was trying to understand why pll-video0 is not updated
and I tracked down the culprit to ccu_nkm.c.

On 2023-04-23 at 15:24:33 +0200, Frank Oltmanns <frank@oltmanns.dev> wrote:
> On 2023-04-18 at 09:40:01 +0200, Roman Beranek <me@crly.cz> wrote:
>> According to Allwinner's BSP code, in DSI mode, TCON0 clock needs to be
>> running at what's effectively the per-lane datarate of the DSI link.
>> Given that the TCON DCLK divider is fixed to 4 (SUN6I_DSI_TCON_DIV),
>> DCLK can't be set equal to the dotclock. Therefore labeling TCON DCLK
>> as sun4i_dotclock or tcon-pixel-clock shall be avoided.
>>
>> With bpp bits per pixel transmitted over n DSI lanes, the target DCLK
>> rate for a given pixel clock is obtained as follows:
>>
>> DCLK rate = 1/4 * bpp / n * pixel clock
>>
>> Effect of this change can be observed through the rate of Vblank IRQs
>> which should now match refresh rate implied by set display mode. It
>> was verified to do so on a A64 board with a 2-lane and a 4-lane panel.
[...]
> I've tried your patches on my pinephone. I also set the panel's clock to
> 72 MHz, so at 24 bpp and 4 lanes that should result in a data clock of
> 108 MHz. This should be possible when pll-video0 is at 297 MHz.
>
> Unfortunately, pll-video0 is not set and therefore the relevant part of
> the clk_summary looks like this:
>
>                           enable  prepare  protect              hardware
> clock                      count    count    count        rate    enable
> ------------------------------------------------------------------------
>  pll-video0                    1        1        1   294000000         Y
>     hdmi                       0        0        0   294000000         N
>     tcon1                      0        0        0   294000000         N
>     pll-mipi                   1        1        1   431200000         Y
>        tcon0                   2        2        1   431200000         Y
>           tcon-data-clock      1        1        1   107800000         Y
>     pll-video0-2x              0        0        0   588000000         Y
>
> Note, I've cut the columns accuracy, phase, and duty cycle, because they
> show the same values for all clocks (0, 0, 50000).
>
> My understanding was that with this patchset setting the parent clock
> should be possible. Do you have any idea why it doesn't work on the
> pinephone? Or maybe it does work on yours and I'm making some kind of
> mistake?

To better understand what's going on I've extended the clk_rate_request
class to also output the requested rate. The relevant output is this
(leading line numbers by me for referencing the lines below):
line  1:     kworker/u8:2-49      [002] .....     1.850141: clk_rate_request_start: tcon-data-clock rate 108000000 min 0 max 18446744073709551615, parent tcon0 (588000000)
line  2:     kworker/u8:2-49      [002] .....     1.850149: clk_rate_request_start: tcon0 rate 432000000 min 0 max 18446744073709551615, parent pll-mipi (588000000)
line  3:     kworker/u8:2-49      [002] .....     1.850154: clk_rate_request_start: pll-mipi rate 432000000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line  4:     kworker/u8:2-49      [002] .....     1.850168: clk_rate_request_done: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line  5:     kworker/u8:2-49      [002] .....     1.850169: clk_rate_request_done: tcon0 rate 431200000 min 0 max 18446744073709551615, parent pll-mipi (431200000)
line  6:     kworker/u8:2-49      [002] .....     1.850171: clk_rate_request_done: tcon-data-clock rate 107800000 min 0 max 18446744073709551615, parent tcon0 (431200000)
line  7:     kworker/u8:2-49      [002] .....     1.850172: clk_rate_request_start: tcon-data-clock rate 108000000 min 0 max 18446744073709551615, parent tcon0 (588000000)
line  8:     kworker/u8:2-49      [002] .....     1.850174: clk_rate_request_start: tcon0 rate 432000000 min 0 max 18446744073709551615, parent pll-mipi (588000000)
line  9:     kworker/u8:2-49      [002] .....     1.850179: clk_rate_request_start: pll-mipi rate 432000000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 10:     kworker/u8:2-49      [002] .....     1.850190: clk_rate_request_done: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 11:     kworker/u8:2-49      [002] .....     1.850191: clk_rate_request_done: tcon0 rate 431200000 min 0 max 18446744073709551615, parent pll-mipi (431200000)
line 12:     kworker/u8:2-49      [002] .....     1.850192: clk_rate_request_done: tcon-data-clock rate 107800000 min 0 max 18446744073709551615, parent tcon0 (431200000)
line 13:     kworker/u8:2-49      [002] .....     1.850193: clk_rate_request_start: tcon0 rate 431200000 min 0 max 18446744073709551615, parent pll-mipi (588000000)
line 14:     kworker/u8:2-49      [002] .....     1.850195: clk_rate_request_start: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 15:     kworker/u8:2-49      [002] .....     1.850205: clk_rate_request_done: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 16:     kworker/u8:2-49      [002] .....     1.850206: clk_rate_request_done: tcon0 rate 431200000 min 0 max 18446744073709551615, parent pll-mipi (431200000)
line 17:     kworker/u8:2-49      [002] .....     1.850208: clk_rate_request_start: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 18:     kworker/u8:2-49      [002] .....     1.850219: clk_rate_request_done: pll-mipi rate 431200000 min 0 max 18446744073709551615, parent pll-video0 (294000000)
line 19:     kworker/u8:2-49      [002] .....     1.850229: clk_set_rate: pll-mipi 431200000
line 20:     kworker/u8:2-49      [003] .....     1.850508: clk_set_rate_complete: pll-mipi 431200000
line 21:     kworker/u8:2-49      [003] .....     1.850513: clk_set_rate: tcon0 431200000
line 22:     kworker/u8:2-49      [003] .....     1.850515: clk_set_rate_complete: tcon0 431200000
line 23:     kworker/u8:2-49      [003] .....     1.850516: clk_set_rate: tcon-data-clock 107800000
line 24:     kworker/u8:2-49      [003] .....     1.850524: clk_set_rate_complete: tcon-data-clock 107800000
line 25:     kworker/u8:2-49      [003] .....     1.853320: clk_prepare: tcon-data-clock
line 26:     kworker/u8:2-49      [003] .....     1.853324: clk_prepare_complete: tcon-data-clock
line 27:     kworker/u8:2-49      [003] d..1.     1.853328: clk_enable: tcon-data-clock
line 28:     kworker/u8:2-49      [003] d..1.     1.853333: clk_enable_complete: tcon-data-clock

In line 1 we can see that a rate of 108 MHz is requested for
tcon-data-clock. In lines 2 and 3 this is forwarded to tcon0 and
pll-mipi (432 MHz). What surprised me, is that there is no request to
set the rate of pll-video0. Instead pll-mipi (and subsequently tcon0)
are set to 431.2 MHz (lines 4,5) and consequently tcon-data-clock is at
107.8 MHz (line 6) as I also reported in my previous mail (see quote
above).

When figuring out the call stack, I traced the whole thing down to
ccu_nkm_determine_rate(). The simplified call stack looks like this:

clk_set_rate(tcon-data-clock, 108MHz)
   clk_core_set_rate_nolock(tcon-data-clock, 108MHz)
      clk_core_req_round_rate_nolock(tcon-data-clock, 108MHz)
         clk_core_round_rate_nolock(tcon-data-clock, 108MHz)
            sun4i_dclk_round_rate(tcon-data-clock)
               clk_hw_round_rate(tcon0, 432MHz)
                  clk_core_round_rate_nolock(tcon0, 432MHz)
                     clk_mux_determine_rate_flags(tcon0, 432MHz)
                        clk_core_round_rate_nolock(pll-mipi, 432MHz)
                           ccu_nkm_determine_rate(pll-mipi, 432MHz)

Looking at ccu_nkm_determine_rate(), we've found our culprit because it
does not try parent clock rates other than the current one. The same
applies to all other ccu_nkm_* functions.

So, I can see two options:
 a. Set pll-video0 to 297 MHz on boot
 b. Add functionality to ccu_nkm_* to also update the parent clock rate.

I'm actually interested in tackling b, but I can't make any promises as
to if and when I'll be able to solve it. I'm not certain about any side
effects this might have.

Until then, is option a acceptable in mainline?

Thanks,
  Frank

>
> On a brighter note, when I initialize pll-video0 to 297 MHz in
> sunxi-ng/ccu-sun50i-a64.c:sun50i_a64_ccu_probe() I get an even 108 Mhz
> for the data clock. The patch is:
>
> 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
>
> +	/*
> +	 * Initialize PLL VIDEO0 to default values (297 MHz)
> +	 * to clean up any changes made by bootloader
> +	 */
> +	writel(0x03006207, reg + 0x10);
> +
> 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_desc);
> 	if (ret)
> 		return ret;
>
> Best,
>   Frank
