Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66247F768E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 15:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D2410E0AD;
	Fri, 24 Nov 2023 14:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18210E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 14:40:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso1276882f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 06:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700836825; x=1701441625;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=NIiwAxdmzOkDiTxrhYUc4Y3MMadBDgLLDbQxBLZ1bpU=;
 b=K6J1/Ypm9va6e992ORu2PelJc6ZcXchKnjOgBleZTltKW/fSicol531BXTNzW16jiS
 jWDK8bQJRUo5pWl4wQIwDClXEjhKyvwdFEGBRQc5NH33KH6Z58h8hsfuxwY2BHm6ISiR
 LX8nOpcOYQS9XOgYDznB7ETWQyCl132J8Rjf0sfKFIVMf90IV4uhnq57YrAjaNvLHrk/
 qZRb3qEvGJeO2J8CaVqvHN1MCP3vLEmq8fZGb0PFspyjiRy23wOLFCFwP3SFpg6cvCJk
 KiOkYIjUv3Pxo8gy/HbVp2CiHM5d1/63wWOI9LYEyZVmqRT1DBJmNv6YWKkfP0FQjEEw
 HhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700836825; x=1701441625;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIiwAxdmzOkDiTxrhYUc4Y3MMadBDgLLDbQxBLZ1bpU=;
 b=BAUvjm9DlrWTFipy8vhlIncJypRpiYPEPvR7z1svR34nL9js3y02vMryFL+jOGR4Sv
 GmcVSihDFzwCxB8nVocEmppZWbd+36GKZSdZzKKH7I+BhEVtAmAabg6XNjvI7D/b/ICx
 BsxTV6PQ0OVUPd4GZ66a9huzGHiNI1j16jYKlNcQDjPdA2FHAJVEbPIOeTXckIYvPpYh
 u+/V02EOywYi8Jh7HFe3JTSpVz1k7BANYm40QhuwplTESPVFRLNE3ZeglHCATwVXNK7U
 yu8ubd+Tr9SuhBtxAIIq7bc9OVXaPmWjRsVj6kN88gUcZd2ezMNTwzcSjKHhpIqNB73J
 nCqg==
X-Gm-Message-State: AOJu0Yw/rLaZcj/89KWkcVF4Ifyyoqu6oG/lC8oKolmgOBKLxl6TdCa/
 Q0zzh5NsIij1TD5WwGXzhbDU3g==
X-Google-Smtp-Source: AGHT+IHzzbRCPSKjkI9QlpIzhC8HlPiBgBVnia+Dbm7E/Rv/wiz9vBCUYYDhElu81nWxgMuUVurIgQ==
X-Received: by 2002:a5d:4b88:0:b0:32d:87c8:b548 with SMTP id
 b8-20020a5d4b88000000b0032d87c8b548mr2321540wrt.21.1700836825270; 
 Fri, 24 Nov 2023 06:40:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
 by smtp.gmail.com with ESMTPSA id
 dm16-20020a0560000bd000b0032d09f7a713sm4500582wrb.18.2023.11.24.06.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 06:40:24 -0800 (PST)
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 08/12] clk: meson: g12a: make VCLK2 and ENCL clock
 path configurable by CCF
Date: Fri, 24 Nov 2023 15:12:53 +0100
In-reply-to: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-8-95256ed139e6@linaro.org>
Message-ID: <1jbkbjdxk8.fsf@starbuckisacylon.baylibre.com>
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


On Fri 24 Nov 2023 at 09:41, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> In order to setup the DSI clock, let's make the unused VCLK2 clock path
> configuration via CCF.
>
> The nocache option is removed from following clocks:
> - vclk2_sel
> - vclk2_input
> - vclk2_div
> - vclk2
> - vclk_div1
> - vclk2_div2_en
> - vclk2_div4_en
> - vclk2_div6_en
> - vclk2_div12_en
> - vclk2_div2
> - vclk2_div4
> - vclk2_div6
> - vclk2_div12
> - cts_encl_sel
>
> vclk2 and vclk2_div uses the newly introduced vclk regmap driver
> to handle the enable and reset bits.
>
> In order to set a rate on cts_encl via the vclk2 clock path,
> the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
> to keep CCF from selection a parent.
> The parents of cts_encl_sel & vclk2_sel are expected to be defined
> in DT.
>
> The following clock scheme is to be used for DSI:
>
> xtal
> \_ gp0_pll_dco
>    \_ gp0_pll
>       |- vclk2_sel
>       |  \_ vclk2_input
>       |     \_ vclk2_div
>       |        \_ vclk2
>       |           \_ vclk2_div1
>       |              \_ cts_encl_sel
>       |                 \_ cts_encl	-> to VPU LCD Encoder
>       |- mipi_dsi_pxclk_sel
>       \_ mipi_dsi_pxclk_div
>          \_ mipi_dsi_pxclk		-> to DSI controller
>
> The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
> for mipi_dsi_pxclk and vclk2_input.

Could you explain a bit more this part of about the RO ops ?
Maybe I'm missing something.

You would be relying on the reset being always the way it. It is
probable but not safe.

A way to deal with the shared GP0 would be to:
* cut rate propagation at mipi_dsi_pxclk_sel (already done) and
  (vclk2_sel - TBD) ... 
* Set GP0 base rate through assigned-clock-rate (which you already in
  patch 11)

With this, I'm not sure anything needs to be RO for the rates to be set
properly for each subtree.

Also, with the subtree above and your example in patch 11, it looks odd that
PXCLK is manually set through DT while ENCL is not. Both are input of
dsi driver.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/g12a.c | 68 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 47 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index cadd824336ad..fb3d9196a1fd 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -22,6 +22,7 @@
>  #include "clk-regmap.h"
>  #include "clk-cpu-dyndiv.h"
>  #include "vid-pll-div.h"
> +#include "vclk.h"
>  #include "meson-eeclk.h"
>  #include "g12a.h"
>  
> @@ -3165,7 +3166,7 @@ static struct clk_regmap g12a_vclk2_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_vclk_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,

No sure CLK_SET_RATE_PARENT is wise here.
What you manually set in DT for the GP0, is likely to change because of
this, isn't it ?

>  	},
>  };
>  
> @@ -3193,7 +3194,7 @@ static struct clk_regmap g12a_vclk2_input = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3215,19 +3216,32 @@ static struct clk_regmap g12a_vclk_div = {
>  };
>  
>  static struct clk_regmap g12a_vclk2_div = {
> -	.data = &(struct clk_regmap_div_data){
> -		.offset = HHI_VIID_CLK_DIV,
> -		.shift = 0,
> -		.width = 8,
> +	.data = &(struct clk_regmap_vclk_div_data){
> +		.div = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.enable = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 16,
> +			.width   = 1,
> +		},
> +		.reset = {
> +			.reg_off = HHI_VIID_CLK_DIV,
> +			.shift   = 17,
> +			.width   = 1,
> +		},
> +		.flags = CLK_DIVIDER_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "vclk2_div",
> -		.ops = &clk_regmap_divider_ops,
> +		.ops = &clk_regmap_vclk_div_ops,
>  		.parent_hws = (const struct clk_hw *[]) {
>  			&g12a_vclk2_input.hw
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3246,16 +3260,24 @@ static struct clk_regmap g12a_vclk = {
>  };
>  
>  static struct clk_regmap g12a_vclk2 = {
> -	.data = &(struct clk_regmap_gate_data){
> -		.offset = HHI_VIID_CLK_CNTL,
> -		.bit_idx = 19,
> +	.data = &(struct clk_regmap_vclk_data){
> +		.enable = {
> +			.reg_off = HHI_VIID_CLK_CNTL,
> +			.shift   = 19,
> +			.width   = 1,
> +		},
> +		.reset = {
> +			.reg_off = HHI_VIID_CLK_CNTL,
> +			.shift   = 15,
> +			.width   = 1,
> +		},
>  	},
>  	.hw.init = &(struct clk_init_data) {
>  		.name = "vclk2",
> -		.ops = &clk_regmap_gate_ops,
> +		.ops = &clk_regmap_vclk_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
>  	},
>  };
>  
> @@ -3339,7 +3361,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3353,7 +3375,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3367,7 +3389,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3381,7 +3403,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3395,7 +3417,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
>  		.ops = &clk_regmap_gate_ops,
>  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3461,6 +3483,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
>  			&g12a_vclk2_div2_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3474,6 +3497,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
>  			&g12a_vclk2_div4_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3487,6 +3511,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
>  			&g12a_vclk2_div6_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3500,6 +3525,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
>  			&g12a_vclk2_div12_en.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
>  
> @@ -3561,7 +3587,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_cts_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };
>  
> @@ -3717,7 +3743,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
>  		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
> -		.flags = CLK_SET_RATE_NO_REPARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };
>  
> @@ -3729,7 +3755,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mipi_dsi_pxclk_div",
> -		.ops = &clk_regmap_divider_ops,
> +		.ops = &clk_regmap_divider_ro_ops,
>  		.parent_hws = (const struct clk_hw *[]) {
>  			&g12a_mipi_dsi_pxclk_sel.hw
>  		},

