Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A9D891923
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C79E1126BA;
	Fri, 29 Mar 2024 12:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D8tgqJWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25711126BF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:36:05 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d68cf90ec4so27996871fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711715701; x=1712320501;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=KC8w3+NJEoEp4iFjjEQ7VsL+cucprnwnTVjKhg4Pdoo=;
 b=D8tgqJWh4puboVLaFGjbEptB29twZn7tOYGbDCA/v3WDN+g8smienuDFVDN/sADFbL
 eP+uHf9Dpl5afOoFCgb+qBjjsWWFe92EDrS48wRAUxgPzGyl+njgA9n6veb80HlzTTw/
 QucbCYsCXp7iTVdSqqkarJUYlhHlEkE3+BZW4vlY2ErVypt2GKMl3HRK2KCX+ak97nHk
 tBWYzqOela1DAe5fKTPHkB/fUyhRE96B2Y78uwZIB6rUE1uL4Po+2wLQHcYA27t5B0kK
 DgZ86tf3Uoob28ELxluhqCXHgyEYIBU6ruLp80MyEQcqaWimDziLva/kKg4VgqVrtSXt
 MG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711715701; x=1712320501;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KC8w3+NJEoEp4iFjjEQ7VsL+cucprnwnTVjKhg4Pdoo=;
 b=wFIijoWJ5fSzxux0iVZ6tyNVgkYE4q7l3ICfQnnKotyury+SfplfYrHQy1CysOQ1HR
 8zyXbfirgUYVv7nqLqVrqbwvNQi8Nu2R/IIkcwHbxDg73MCsPvlWDMq3dqxFwiYdK/5L
 XlzNjJ+HeuMVchXedDuAtLgJJ7kY0oAKitHZ7zapb171+Sv9B5+3Q9MbijafmC80jBJv
 KQ92hiuPYs3OBZsAtMpKd3ubRzsWOXTP2jYV2z1fZsTJmrwvnMPBWu1nUrPpHCRdpbRd
 pgjFO+KQM/4qq/XdpCcFWljY5LCW1EGQicX9ztSvJgbmiuIYF2MIdIaUB58WMMoZYO7C
 JfZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZyDhqaqPLyyp8vfzuZCLm5iMxmpAY5o47OcxmB+UtxCdzFauCT+z/rqWK70mSMkUciYvwrOwVB8gSMuKW532RWq2pvjo/K5mJ6qXCedLk
X-Gm-Message-State: AOJu0Yx+B+k5a/8pcaFPumkLvU69DOIuqGsgZZon1skSVb1SXqfyF2Jm
 QyB87w3CDkIMSa6ZzdZFDreHZq93ZAeRadZ4vuCFi2xCAz+9NZoKIMvQnG2xUHU=
X-Google-Smtp-Source: AGHT+IEqnZmZnd/1sz5qvYox5md+LW+1OE5EJ48R6LS63eh6sEQiAaI25oj7fuUOQA3dlUi+U7wpjA==
X-Received: by 2002:a2e:7e12:0:b0:2d7:2ba:525 with SMTP id
 z18-20020a2e7e12000000b002d702ba0525mr1339873ljc.18.1711715701308; 
 Fri, 29 Mar 2024 05:35:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f8f5:63d4:de5b:e4de])
 by smtp.gmail.com with ESMTPSA id
 jb2-20020a05600c54e200b004155387c08esm525835wmb.27.2024.03.29.05.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 05:35:00 -0700 (PDT)
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
 <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Belin <nbelin@baylibre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/7] clk: meson: add vclk driver
Date: Fri, 29 Mar 2024 13:33:29 +0100
In-reply-to: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-2-04f55de44604@linaro.org>
Message-ID: <1jzfuh8bd7.fsf@starbuckisacylon.baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon 25 Mar 2024 at 12:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The VCLK and VCLK_DIV clocks have supplementary bits.
>
> The VCLK gate has a "SOFT RESET" bit to toggle after the whole
> VCLK sub-tree rate has been set, this is implemented in
> the gate enable callback.
>
> The VCLK_DIV clocks as enable and reset bits used to disable
> and reset the divider, associated with CLK_SET_RATE_GATE it ensures
> the rate is set while the divider is disabled and in reset mode.
>
> The VCLK_DIV enable bit isn't implemented as a gate since it's part
> of the divider logic and vendor does this exact sequence to ensure
> the divider is correctly set.

checkpatch reports a few easy CHECKs and one WARNING.
Could you please fix these ?

Other than that, It looks OK.

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/meson/Kconfig  |   4 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
>  4 files changed, 197 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 29ffd14d267b..8a9823789fa3 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
>  	tristate
>  	select COMMON_CLK_MESON_REGMAP
>  
> +config COMMON_CLK_MESON_VCLK
> +	tristate
> +	select COMMON_CLK_MESON_REGMAP
> +
>  config COMMON_CLK_MESON_CLKC_UTILS
>  	tristate
>  
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 9ee4b954c896..9ba43fe7a07a 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
>  obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
>  obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
>  obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
> +obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
>  
>  # Amlogic Clock controllers
>  
> diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
> new file mode 100644
> index 000000000000..3ea813a0a995
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/module.h>
> +#include "vclk.h"
> +
> +/* The VCLK gate has a supplementary reset bit to pulse after ungating */
> +
> +static inline struct meson_vclk_gate_data *
> +clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
> +{
> +	return (struct meson_vclk_gate_data *)clk->data;
> +}
> +
> +static int meson_vclk_gate_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
> +
> +	meson_parm_write(clk->map, &vclk->enable, 1);
> +
> +	/* Do a reset pulse */
> +	meson_parm_write(clk->map, &vclk->reset, 1);
> +	meson_parm_write(clk->map, &vclk->reset, 0);
> +
> +	return 0;
> +}
> +
> +static void meson_vclk_gate_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
> +
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +}
> +
> +static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops meson_vclk_gate_ops = {
> +	.enable = meson_vclk_gate_enable,
> +	.disable = meson_vclk_gate_disable,
> +	.is_enabled = meson_vclk_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
> +
> +/* The VCLK Divider has supplementary reset & enable bits */
> +
> +static inline struct meson_vclk_div_data *
> +clk_get_meson_vclk_div_data(struct clk_regmap *clk)
> +{
> +	return (struct meson_vclk_div_data *)clk->data;
> +}
> +
> +static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
> +						     unsigned long prate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
> +				   vclk->table, vclk->flags, vclk->div.width);
> +}
> +
> +static int meson_vclk_div_determine_rate(struct clk_hw *hw,
> +					      struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
> +				      vclk->flags);
> +}
> +
> +static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
> +			      vclk->flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	meson_parm_write(clk->map, &vclk->div, ret);
> +
> +	return 0;
> +};
> +
> +static int meson_vclk_div_enable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	/* Unreset the divider when ungating */
> +	meson_parm_write(clk->map, &vclk->reset, 0);
> +	meson_parm_write(clk->map, &vclk->enable, 1);
> +
> +	return 0;
> +}
> +
> +static void meson_vclk_div_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	/* Reset the divider when gating */
> +	meson_parm_write(clk->map, &vclk->enable, 0);
> +	meson_parm_write(clk->map, &vclk->reset, 1);
> +}
> +
> +static int meson_vclk_div_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
> +
> +	return meson_parm_read(clk->map, &vclk->enable);
> +}
> +
> +const struct clk_ops meson_vclk_div_ops = {
> +	.recalc_rate = meson_vclk_div_recalc_rate,
> +	.determine_rate = meson_vclk_div_determine_rate,
> +	.set_rate = meson_vclk_div_set_rate,
> +	.enable = meson_vclk_div_enable,
> +	.disable = meson_vclk_div_disable,
> +	.is_enabled = meson_vclk_div_is_enabled,
> +};
> +EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
> +
> +MODULE_DESCRIPTION("Amlogic vclk clock driver");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
> new file mode 100644
> index 000000000000..20b0b181db09
> --- /dev/null
> +++ b/drivers/clk/meson/vclk.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#ifndef __VCLK_H
> +#define __VCLK_H
> +
> +#include "clk-regmap.h"
> +#include "parm.h"
> +
> +/**
> + * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
> + *
> + * @enable:	vclk enable field
> + * @reset:	vclk reset field
> + * @flags:	hardware-specific flags
> + *
> + * Flags:
> + * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
> + */
> +struct meson_vclk_gate_data {
> +	struct parm enable;
> +	struct parm reset;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops meson_vclk_gate_ops;
> +
> +/**
> + * struct meson_vclk_div_data - vclk_div regmap back specific data
> + *
> + * @div:	divider field
> + * @enable:	vclk divider enable field
> + * @reset:	vclk divider reset field
> + * @table:	array of value/divider pairs, last entry should have div = 0
> + *
> + * Flags:
> + * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
> + */
> +struct meson_vclk_div_data {
> +	struct parm div;
> +	struct parm enable;
> +	struct parm reset;
> +	const struct clk_div_table *table;
> +	u8 flags;
> +};
> +
> +extern const struct clk_ops meson_vclk_div_ops;
> +
> +#endif /* __VCLK_H */


-- 
Jerome
