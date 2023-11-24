Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E57F7870
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 17:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D35B10E808;
	Fri, 24 Nov 2023 16:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AD10E808
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 16:00:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b2ddab817so14445695e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700841624; x=1701446424;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=QIZHOCN0O+AJ7xoSGSR7gqeveeQq60Da6ux/290lK/k=;
 b=r4JRwvnOQvw9u+F95Fd2DiaQHwcMKiVXh9mGhCl9K1psdIgyPxNtrRguJL+pniW4ij
 HGCQRqyHXceAl4F9YED7xnIvlYtMErcxwh3eE5a7pI4Lq+JMowz1QwRZ2wqHZ7e8QSAb
 q5iHJfxRj0onudMn/7iDY94ytD8vMsK5/XnpyRYOC+VKjNhiluSWcyc/B069jdJif2xs
 8GHFUGrhUrVyf8IgNTk6ZV/1OGIm9U6ibWj/lgkniuwli0CpjfLYYGRCoIAU8IwLlN+U
 uMdMzdv9qf2uzeITwoC1/KhrTUY58lMqsdCD7f3trrngQZLfV34u5M6fZ7ux1JN0S+QF
 8QsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700841624; x=1701446424;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIZHOCN0O+AJ7xoSGSR7gqeveeQq60Da6ux/290lK/k=;
 b=pEVccKmiiMV8b2IxEftKxOvYcpci0ZOAu9Ic7kQuQTRHouCo/IR3yHLAzAOruhbqT3
 Ogj2iqqL7Wj53HNRaKOocRkOnB6XIP3eBkcHTsfn1hsVuwYD2XST/SVX7zDfOzCY49Cl
 SS1li3k99I5adefkaYUS9l7lIK/Py7PkCPzlUPUP94dtgFjG3Q/RdprN20CGLPewL676
 moRPNCcwnOdBGQcaGyBplnhfDyIsP2uC1W5kAlFLpex80PPdav1Cc6BIe76OFlbRWd+V
 I7OJ0k9RUmWJJ029pgbw7LI/f5b9OUn1aU/PTWrTAW8ySUlzXyGaj49L+d4CgUjX2h2s
 qBkA==
X-Gm-Message-State: AOJu0Yw76Y/mrXmJKpXRlVGpxPoXVNRIwVCluCMdoO1q8JyVZL7us+hB
 j3FkIHCG+zxd9r8DeKOkivJVsA==
X-Google-Smtp-Source: AGHT+IFZbJEIaR1JnmbP2ltcRj3tm0C6/uC1zEbNnTJYzlCYq+OYJ+nKuLBrMqyGIKkKo/dWAAtGAw==
X-Received: by 2002:a05:600c:354c:b0:405:39b4:3145 with SMTP id
 i12-20020a05600c354c00b0040539b43145mr3007348wmq.2.1700841623251; 
 Fri, 24 Nov 2023 08:00:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b00332e6a0e9f4sm3285103wro.75.2023.11.24.08.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:00:22 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
 <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
 <b23ddc3b-d995-4cd6-91f2-3efa59d345a5@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock
 path configurable by CCF
Date: Fri, 24 Nov 2023 16:32:20 +0100
In-reply-to: <b23ddc3b-d995-4cd6-91f2-3efa59d345a5@linaro.org>
Message-ID: <1j34wvdtux.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri 24 Nov 2023 at 16:15, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 24/11/2023 15:12, Jerome Brunet wrote:
>> On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org>
>> wrote:
>> 
>>> In order to setup the DSI clock, let's make the unused VCLK2 clock path
>>> configuration via CCF.
>>>
>>> The nocache option is removed from following clocks:
>>> - vclk2_sel
>>> - vclk2_input
>>> - vclk2_div
>>> - vclk2
>>> - vclk_div1
>>> - vclk2_div2_en
>>> - vclk2_div4_en
>>> - vclk2_div6_en
>>> - vclk2_div12_en
>>> - vclk2_div2
>>> - vclk2_div4
>>> - vclk2_div6
>>> - vclk2_div12
>>> - cts_encl_sel
>>>
>>> vclk2 and vclk2_div uses the newly introduced vclk regmap driver
>>> to handle the enable and reset bits.
>>>
>>> In order to set a rate on cts_encl via the vclk2 clock path,
>>> the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
>>> to keep CCF from selection a parent.
>>> The parents of cts_encl_sel & vclk2_sel are expected to be defined
>>> in DT.
>>>
>>> The following clock scheme is to be used for DSI:
>>>
>>> xtal
>>> \_ gp0_pll_dco
>>>     \_ gp0_pll
>>>        |- vclk2_sel
>>>        |  \_ vclk2_input
>>>        |     \_ vclk2_div
>>>        |        \_ vclk2
>>>        |           \_ vclk2_div1
>>>        |              \_ cts_encl_sel
>>>        |                 \_ cts_encl	-> to VPU LCD Encoder
>>>        |- mipi_dsi_pxclk_sel
>>>        \_ mipi_dsi_pxclk_div
>>>           \_ mipi_dsi_pxclk		-> to DSI controller
>>>
>>> The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
>>> for mipi_dsi_pxclk and vclk2_input.
>> Could you explain a bit more this part of about the RO ops ?
>> Maybe I'm missing something.
>> You would be relying on the reset being always the way it. It is
>> probable but not safe.
>> A way to deal with the shared GP0 would be to:
>> * cut rate propagation at mipi_dsi_pxclk_sel (already done) and
>>    (vclk2_sel - TBD) ...
>> * Set GP0 base rate through assigned-clock-rate (which you already in
>>    patch 11)
>> With this, I'm not sure anything needs to be RO for the rates to be set
>> properly for each subtree.
>> Also, with the subtree above and your example in patch 11, it looks odd
>> that
>> PXCLK is manually set through DT while ENCL is not. Both are input of
>> dsi driver.
>
> So the deal is about dynamic setup of clocks for DSI bridges, not really
> for panels where we can probably know in advance the clock setup.
>
> In this particular case, we need to keep a ratio between the vclk and the
> DSI bitclk, the DSI bitclk is taken from mipi_dsi_pxclk and vclk is derived
> from gp0 via vclk2.
>
> If we set the bitclk rate via mipi_dsi_pxclk, CCF will try to use mipi_dsi_pxclk_div
> to achieve the rate,

If you have CLK_RATE_PARENT on mipi_dsi_pxclk_sel, I'm not surprised it
does that, but you don't :/ I'm quite surprised it would do that, or
even could.

From your example setting 96Mhz on both gp0 and mipi_dsi_pxclk, since
you've proposed RO-OPS, I suppose the divider is assumed to be 1 and
stay like that forever.

With rate propagation disabled mipi_dsi_pxclk_sel and GP0 is 96Mhz,
CCF would have no choice but picking 1 as divider, so I don't understand
how CCF would pick anything else and how RO-OPS help

> and it does it everytime I tried, breaking the vclk/bitclk ratio,
> and we have no way to know the gp0 rate in this case.

If you really want to ensure the divider value is always 1, why not use a
divider table allowing only 1 ? Adding a comment in the g12 clock driver
would nice because this not obvious. It would be safer than relying on
the reset value.

>
> I suspect mipi_dsi_pxclk_div was added to achieve fractional vclk/bitclk ratios,
> since it doesn't exist on AXG. Not sure we would ever need it... and none
> of the other upstream DSI drivers supports such setups.
>
> The main reasons I set only mipi_dsi_pxclk in DT is because :
> 1) the DSI controller requires a bitclk to respond, pclk is not enough
> 2) GP0 is disabled with an invalid config at cold boot, thus we cannot
> rely on a default/safe rate on an initial prepare_enable().
> This permits setting initial valid state for the DSI controller, while
> the actual bitclk and vclk are calculated dynamically with panel/bridge
> runtime parameters.

Nothing against setting rate in DT when it is static. Setting it then
overriding it is not easy to follow.

To work around GP0 not being set, assuming you want to keep rate
propagation as it is, you could call clk_set_rate() on cts_encl (possibly w/o
enabling it) to force a setup on gp0 then clk_prepare_enable() on
pxclk. You'd get a your safe rate on GP0 and the clock you need on pxclk.

It is a bit hackish. Might be better to claim gp0 in your driver to
manage it directly, cutting rate propagation above it to control each
branch of the subtree as you need. It seems you need to have control over
that anyway and it would be clear GP0 is expected to belong to DSI.

>
> For the record, the samsung-dsim used fixed rate set from DT, and they moved
> from that in order to support more panel and bridges.
>
> But they're quite lucky because usually the DSI PLL is included in the PHY,
> this makes the Amlogic design quite unusual (like most multimedia stuf...).
>
> Neil
>
>> 
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/clk/meson/g12a.c | 68 +++++++++++++++++++++++++++++++++---------------
>>>   1 file changed, 47 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>>> index cadd824336ad..fb3d9196a1fd 100644
>>> --- a/drivers/clk/meson/g12a.c
>>> +++ b/drivers/clk/meson/g12a.c
>>> @@ -22,6 +22,7 @@
>>>   #include "clk-regmap.h"
>>>   #include "clk-cpu-dyndiv.h"
>>>   #include "vid-pll-div.h"
>>> +#include "vclk.h"
>>>   #include "meson-eeclk.h"
>>>   #include "g12a.h"
>>>   @@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
>>>   		.ops = &clk_regmap_mux_ops,
>>>   		.parent_hws = g12a_vclk_parent_hws,
>>>   		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
>>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> No sure CLK_SET_RATE_PARENT is wise here.
>> What you manually set in DT for the GP0, is likely to change because of
>> this, isn't it ?
>> 
>>>   	},
>>>   };
>>>   @@ -3193,7 +3194,7 @@ static struct clk_regmap g12a_vclk2_input = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3215,19 +3216,32 @@ static struct clk_regmap g12a_vclk_div = {
>>>   };
>>>     static struct clk_regmap g12a_vclk2_div = {
>>> -	.data = &(struct clk_regmap_div_data){
>>> -		.offset = HHI_VIID_CLK_DIV,
>>> -		.shift = 0,
>>> -		.width = 8,
>>> +	.data = &(struct clk_regmap_vclk_div_data){
>>> +		.div = {
>>> +			.reg_off = HHI_VIID_CLK_DIV,
>>> +			.shift   = 0,
>>> +			.width   = 8,
>>> +		},
>>> +		.enable = {
>>> +			.reg_off = HHI_VIID_CLK_DIV,
>>> +			.shift   = 16,
>>> +			.width   = 1,
>>> +		},
>>> +		.reset = {
>>> +			.reg_off = HHI_VIID_CLK_DIV,
>>> +			.shift   = 17,
>>> +			.width   = 1,
>>> +		},
>>> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
>>>   	},
>>>   	.hw.init = &(struct clk_init_data){
>>>   		.name = "vclk2_div",
>>> -		.ops = &clk_regmap_divider_ops,
>>> +		.ops = &clk_regmap_vclk_div_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) {
>>>   			&g12a_vclk2_input.hw
>>>   		},
>>>   		.num_parents = 1,
>>> -		.flags = CLK_GET_RATE_NOCACHE,
>>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>>>   	},
>>>   };
>>>   @@ -3246,16 +3260,24 @@ static struct clk_regmap g12a_vclk = {
>>>   };
>>>     static struct clk_regmap g12a_vclk2 = {
>>> -	.data = &(struct clk_regmap_gate_data){
>>> -		.offset = HHI_VIID_CLK_CNTL,
>>> -		.bit_idx = 19,
>>> +	.data = &(struct clk_regmap_vclk_data){
>>> +		.enable = {
>>> +			.reg_off = HHI_VIID_CLK_CNTL,
>>> +			.shift   = 19,
>>> +			.width   = 1,
>>> +		},
>>> +		.reset = {
>>> +			.reg_off = HHI_VIID_CLK_CNTL,
>>> +			.shift   = 15,
>>> +			.width   = 1,
>>> +		},
>>>   	},
>>>   	.hw.init = &(struct clk_init_data) {
>>>   		.name = "vclk2",
>>> -		.ops = &clk_regmap_gate_ops,
>>> +		.ops = &clk_regmap_vclk_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>>>   	},
>>>   };
>>>   @@ -3339,7 +3361,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3353,7 +3375,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3367,7 +3389,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3381,7 +3403,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3395,7 +3417,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
>>>   		.ops = &clk_regmap_gate_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>>>   		.num_parents = 1,
>>> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3461,6 +3483,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 =
>>> {
>>>   			&g12a_vclk2_div2_en.hw
>>>   		},
>>>   		.num_parents = 1,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3474,6 +3497,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 =
>>> {
>>>   			&g12a_vclk2_div4_en.hw
>>>   		},
>>>   		.num_parents = 1,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3487,6 +3511,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 =
>>> {
>>>   			&g12a_vclk2_div6_en.hw
>>>   		},
>>>   		.num_parents = 1,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3500,6 +3525,7 @@ static struct clk_fixed_factor g12a_vclk2_div12
>>> = {
>>>   			&g12a_vclk2_div12_en.hw
>>>   		},
>>>   		.num_parents = 1,
>>> +		.flags = CLK_SET_RATE_PARENT,
>>>   	},
>>>   };
>>>   @@ -3561,7 +3587,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
>>>   		.ops = &clk_regmap_mux_ops,
>>>   		.parent_hws = g12a_cts_parent_hws,
>>>   		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
>>> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
>>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>>>   	},
>>>   };
>>>   @@ -3717,7 +3743,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel
>>> = {
>>>   		.ops = &clk_regmap_mux_ops,
>>>   		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>>>   		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
>>> -		.flags = CLK_SET_RATE_NO_REPARENT,
>>> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>>>   	},
>>>   };
>>>   @@ -3729,7 +3755,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div
>>> = {
>>>   	},
>>>   	.hw.init = &(struct clk_init_data){
>>>   		.name = "mipi_dsi_pxclk_div",
>>> -		.ops = &clk_regmap_divider_ops,
>>> +		.ops = &clk_regmap_divider_ro_ops,
>>>   		.parent_hws = (const struct clk_hw *[]) {
>>>   			&g12a_mipi_dsi_pxclk_sel.hw
>>>   		},
>> 

