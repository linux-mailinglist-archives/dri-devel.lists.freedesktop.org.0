Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E39E2C7C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 20:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2D710E040;
	Tue,  3 Dec 2024 19:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RAB8Btjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C234210E040
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 19:56:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B58A75C5FD0;
 Tue,  3 Dec 2024 19:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38188C4CECF;
 Tue,  3 Dec 2024 19:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733255774;
 bh=LNPOhasfBl6uX7u447Qvpak0EuJj+PGtNRVYhR85x7I=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RAB8BtjvBbU4DmxEjf39Sq+poyFeYWcOoBMdzHq0+Mpq3Uvu7qzLmiX3vj5yloGKv
 2Q/hWW0JIiOEVrk3HfSwBbSzettwEmFRMmi8Bjy9DmNoZICACJJsgFe7Shbo2u+FYf
 yNKg22oheCKB/pHYXDC5ORWa3HS+4nx0oTBKj/1z+I7Z6b2B7yKGrMEadRf7werA0y
 hbeASB+dHIqchQAwQ//l+cxmVBXHGdjq1m4ysmKiTXQWfjkVaZlBX4yCayS4CnI58J
 H1zrHlD043xfOrl7R9weTMQSNUQLHfdgBQwUbB8SWPrFiV5ZXd0xTfhgSTXTPN9BJb
 TY6jhvZjmJqZA==
Message-ID: <94a57c718a09a20d148101884bf2e5f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241203134137.2114847-2-m.wilczynski@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134150eucas1p24ba8d2fbf2af5b8f9abe503b4334127d@eucas1p2.samsung.com>
 <20241203134137.2114847-2-m.wilczynski@samsung.com>
Subject: Re: [RFC PATCH v1 01/14] clk: thead: Refactor TH1520 clock driver to
 share common code
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Michal Wilczynski <m.wilczynski@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com,
 frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com,
 jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, mripard@kernel.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wefu@redhat.com
Date: Tue, 03 Dec 2024 11:56:12 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Michal Wilczynski (2024-12-03 05:41:24)
> diff --git a/drivers/clk/thead/Makefile b/drivers/clk/thead/Makefile
> index 7ee0bec1f251..d7cf88390b69 100644
> --- a/drivers/clk/thead/Makefile
> +++ b/drivers/clk/thead/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_CLK_THEAD_TH1520_AP) +=3D clk-th1520-ap.o
> +obj-$(CONFIG_CLK_THEAD_TH1520_AP) +=3D clk-th1520.o clk-th1520-ap.o

Can the -ap driver be extended instead? Or are the clks in a different
IO region?

> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th=
1520-ap.c
> index 17e32ae08720..a6015805b859 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -5,297 +5,9 @@
>   *  Authors: Yangtao Li <frank.li@vivo.com>
>   */
> =20
> -#include <dt-bindings/clock/thead,th1520-clk-ap.h>

Presumably this should stay here.

> -#include <linux/bitfield.h>
> -#include <linux/clk-provider.h>
> -#include <linux/device.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/regmap.h>

These should all stay here as well.

> -
> -#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
> -#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
> -#define TH1520_PLL_FBDIV       GENMASK(19, 8)
> -#define TH1520_PLL_REFDIV      GENMASK(5, 0)
> -#define TH1520_PLL_BYPASS      BIT(30)
> -#define TH1520_PLL_DSMPD       BIT(24)
> -#define TH1520_PLL_FRAC                GENMASK(23, 0)
> -#define TH1520_PLL_FRAC_BITS    24
> -
> -struct ccu_internal {
> -       u8      shift;
> -       u8      width;
> -};
> -
> -struct ccu_div_internal {
> -       u8      shift;
> -       u8      width;
> -       u32     flags;
> -};
> -
> -struct ccu_common {
> -       int             clkid;
> -       struct regmap   *map;
> -       u16             cfg0;
> -       u16             cfg1;
> -       struct clk_hw   hw;
> -};
> -
> -struct ccu_mux {
> -       struct ccu_internal     mux;
> -       struct ccu_common       common;
> -};
> -
> -struct ccu_gate {
> -       u32                     enable;
> -       struct ccu_common       common;
> -};
> -
> -struct ccu_div {
> -       u32                     enable;
> -       struct ccu_div_internal div;
> -       struct ccu_internal     mux;
> -       struct ccu_common       common;
> -};
> -
> -struct ccu_pll {
> -       struct ccu_common       common;
> -};
> -
> -#define TH_CCU_ARG(_shift, _width)                                     \
> -       {                                                               \
> -               .shift  =3D _shift,                                      =
 \
> -               .width  =3D _width,                                      =
 \
> -       }
> -
> -#define TH_CCU_DIV_FLAGS(_shift, _width, _flags)                       \
> -       {                                                               \
> -               .shift  =3D _shift,                                      =
 \
> -               .width  =3D _width,                                      =
 \
> -               .flags  =3D _flags,                                      =
 \
> -       }
> -
> -#define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _gate, _flags) \
> -       struct ccu_gate _struct =3D {                                    =
 \
> -               .enable =3D _gate,                                       =
 \
> -               .common =3D {                                            =
 \
> -                       .clkid          =3D _clkid,                      =
 \
> -                       .cfg0           =3D _reg,                        =
 \
> -                       .hw.init        =3D CLK_HW_INIT_PARENTS_DATA(    =
 \
> -                                               _name,                  \
> -                                               _parent,                \
> -                                               &clk_gate_ops,          \
> -                                               _flags),                \
> -               }                                                       \
> -       }
> -
> -static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
> -{
> -       return container_of(hw, struct ccu_common, hw);
> -}
> -
> -static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
> -{
> -       struct ccu_common *common =3D hw_to_ccu_common(hw);
> -
> -       return container_of(common, struct ccu_mux, common);
> -}
> -
> -static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
> -{
> -       struct ccu_common *common =3D hw_to_ccu_common(hw);
> +#include "clk-th1520.h"
> =20
> -       return container_of(common, struct ccu_pll, common);
> -}
> -
> -static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
> -{
> -       struct ccu_common *common =3D hw_to_ccu_common(hw);
> -
> -       return container_of(common, struct ccu_div, common);
> -}
> -
> -static inline struct ccu_gate *hw_to_ccu_gate(struct clk_hw *hw)
> -{
> -       struct ccu_common *common =3D hw_to_ccu_common(hw);
> -
> -       return container_of(common, struct ccu_gate, common);
> -}
> -
> -static u8 ccu_get_parent_helper(struct ccu_common *common,
> -                               struct ccu_internal *mux)
> -{
> -       unsigned int val;
> -       u8 parent;
> -
> -       regmap_read(common->map, common->cfg0, &val);
> -       parent =3D val >> mux->shift;
> -       parent &=3D GENMASK(mux->width - 1, 0);
> -
> -       return parent;
> -}
> -
> -static int ccu_set_parent_helper(struct ccu_common *common,
> -                                struct ccu_internal *mux,
> -                                u8 index)
> -{
> -       return regmap_update_bits(common->map, common->cfg0,
> -                       GENMASK(mux->width - 1, 0) << mux->shift,
> -                       index << mux->shift);
> -}
> -
> -static void ccu_disable_helper(struct ccu_common *common, u32 gate)
> -{
> -       if (!gate)
> -               return;
> -       regmap_update_bits(common->map, common->cfg0,
> -                          gate, ~gate);
> -}
> -
> -static int ccu_enable_helper(struct ccu_common *common, u32 gate)
> -{
> -       unsigned int val;
> -       int ret;
> -
> -       if (!gate)
> -               return 0;
> -
> -       ret =3D regmap_update_bits(common->map, common->cfg0, gate, gate);
> -       regmap_read(common->map, common->cfg0, &val);
> -       return ret;
> -}
> -
> -static int ccu_is_enabled_helper(struct ccu_common *common, u32 gate)
> -{
> -       unsigned int val;
> -
> -       if (!gate)
> -               return true;
> -
> -       regmap_read(common->map, common->cfg0, &val);
> -       return val & gate;
> -}
> -
> -static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
> -                                        unsigned long parent_rate)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -       unsigned long rate;
> -       unsigned int val;
> -
> -       regmap_read(cd->common.map, cd->common.cfg0, &val);
> -       val =3D val >> cd->div.shift;
> -       val &=3D GENMASK(cd->div.width - 1, 0);
> -       rate =3D divider_recalc_rate(hw, parent_rate, val, NULL,
> -                                  cd->div.flags, cd->div.width);
> -
> -       return rate;
> -}
> -
> -static u8 ccu_div_get_parent(struct clk_hw *hw)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -
> -       return ccu_get_parent_helper(&cd->common, &cd->mux);
> -}
> -
> -static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -
> -       return ccu_set_parent_helper(&cd->common, &cd->mux, index);
> -}
> -
> -static void ccu_div_disable(struct clk_hw *hw)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -
> -       ccu_disable_helper(&cd->common, cd->enable);
> -}
> -
> -static int ccu_div_enable(struct clk_hw *hw)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -
> -       return ccu_enable_helper(&cd->common, cd->enable);
> -}
> -
> -static int ccu_div_is_enabled(struct clk_hw *hw)
> -{
> -       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> -
> -       return ccu_is_enabled_helper(&cd->common, cd->enable);
> -}
> -
> -static const struct clk_ops ccu_div_ops =3D {
> -       .disable        =3D ccu_div_disable,
> -       .enable         =3D ccu_div_enable,
> -       .is_enabled     =3D ccu_div_is_enabled,
> -       .get_parent     =3D ccu_div_get_parent,
> -       .set_parent     =3D ccu_div_set_parent,
> -       .recalc_rate    =3D ccu_div_recalc_rate,
> -       .determine_rate =3D clk_hw_determine_rate_no_reparent,
> -};
> -
> -static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
> -                                               unsigned long parent_rate)
> -{
> -       struct ccu_pll *pll =3D hw_to_ccu_pll(hw);
> -       unsigned long div, mul, frac;
> -       unsigned int cfg0, cfg1;
> -       u64 rate =3D parent_rate;
> -
> -       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> -       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> -
> -       mul =3D FIELD_GET(TH1520_PLL_FBDIV, cfg0);
> -       div =3D FIELD_GET(TH1520_PLL_REFDIV, cfg0);
> -       if (!(cfg1 & TH1520_PLL_DSMPD)) {
> -               mul <<=3D TH1520_PLL_FRAC_BITS;
> -               frac =3D FIELD_GET(TH1520_PLL_FRAC, cfg1);
> -               mul +=3D frac;
> -               div <<=3D TH1520_PLL_FRAC_BITS;
> -       }
> -       rate =3D parent_rate * mul;
> -       rate =3D rate / div;
> -       return rate;
> -}
> -
> -static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
> -                                                   unsigned long parent_=
rate)
> -{
> -       struct ccu_pll *pll =3D hw_to_ccu_pll(hw);
> -       unsigned long div, rate =3D parent_rate;
> -       unsigned int cfg0, cfg1;
> -
> -       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> -       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> -
> -       if (cfg1 & TH1520_PLL_BYPASS)
> -               return rate;
> -
> -       div =3D FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
> -             FIELD_GET(TH1520_PLL_POSTDIV2, cfg0);
> -
> -       rate =3D rate / div;
> -
> -       return rate;
> -}
> -
> -static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> -                                        unsigned long parent_rate)
> -{
> -       unsigned long rate =3D parent_rate;
> -
> -       rate =3D th1520_pll_vco_recalc_rate(hw, rate);
> -       rate =3D th1520_pll_postdiv_recalc_rate(hw, rate);
> -
> -       return rate;
> -}
> -
> -static const struct clk_ops clk_pll_ops =3D {
> -       .recalc_rate    =3D ccu_pll_recalc_rate,
> -};
> +#define NR_CLKS        (CLK_UART_SCLK + 1)
> =20
>  static const struct clk_parent_data osc_24m_clk[] =3D {
>         { .index =3D 0 }
> @@ -956,15 +668,6 @@ static struct ccu_common *th1520_gate_clks[] =3D {
>         &sram3_clk.common,
>  };
> =20
> -#define NR_CLKS        (CLK_UART_SCLK + 1)

Why did this move?

> -
> -static const struct regmap_config th1520_clk_regmap_config =3D {
> -       .reg_bits =3D 32,
> -       .val_bits =3D 32,
> -       .reg_stride =3D 4,
> -       .fast_io =3D true,
> -};
> -
>  static int th1520_clk_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> diff --git a/drivers/clk/thead/clk-th1520.c b/drivers/clk/thead/clk-th152=
0.c
> new file mode 100644
> index 000000000000..e2bfe56de9af
> --- /dev/null
> +++ b/drivers/clk/thead/clk-th1520.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> + *  Authors: Yangtao Li <frank.li@vivo.com>
> + */
> +
> +#include "clk-th1520.h"

Explicitly include linux headers here, don't just put them all into a
header file. It helps us easily see what C files are using different
parts of the kernel infrastructure.

> +
> +static u8 ccu_get_parent_helper(struct ccu_common *common,
> +                               struct ccu_internal *mux)
> +{
> +       unsigned int val;
> +       u8 parent;
> +
> +       regmap_read(common->map, common->cfg0, &val);
> +       parent =3D val >> mux->shift;
> +       parent &=3D GENMASK(mux->width - 1, 0);
> +
> +       return parent;
> +}
> +
> +static int ccu_set_parent_helper(struct ccu_common *common,
> +                                struct ccu_internal *mux, u8 index)
> +{
> +       return regmap_update_bits(common->map, common->cfg0,
> +                                 GENMASK(mux->width - 1, 0) << mux->shif=
t,
> +                                 index << mux->shift);
> +}
> +
> +static void ccu_disable_helper(struct ccu_common *common, u32 gate)
> +{
> +       if (!gate)
> +               return;
> +       regmap_update_bits(common->map, common->cfg0, gate, ~gate);
> +}
> +
> +static int ccu_enable_helper(struct ccu_common *common, u32 gate)
> +{
> +       unsigned int val;
> +       int ret;
> +
> +       if (!gate)
> +               return 0;
> +
> +       ret =3D regmap_update_bits(common->map, common->cfg0, gate, gate);
> +       regmap_read(common->map, common->cfg0, &val);
> +       return ret;
> +}
> +
> +static int ccu_is_enabled_helper(struct ccu_common *common, u32 gate)
> +{
> +       unsigned int val;
> +
> +       if (!gate)
> +               return true;
> +
> +       regmap_read(common->map, common->cfg0, &val);
> +       return val & gate;
> +}
> +
> +static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +       unsigned long rate;
> +       unsigned int val;
> +
> +       regmap_read(cd->common.map, cd->common.cfg0, &val);
> +       val =3D val >> cd->div.shift;
> +       val &=3D GENMASK(cd->div.width - 1, 0);
> +       rate =3D divider_recalc_rate(hw, parent_rate, val, NULL, cd->div.=
flags,
> +                                  cd->div.width);
> +
> +       return rate;
> +}
> +
> +static u8 ccu_div_get_parent(struct clk_hw *hw)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       return ccu_get_parent_helper(&cd->common, &cd->mux);
> +}
> +
> +static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       return ccu_set_parent_helper(&cd->common, &cd->mux, index);
> +}
> +
> +static void ccu_div_disable(struct clk_hw *hw)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       ccu_disable_helper(&cd->common, cd->enable);
> +}
> +
> +static int ccu_div_enable(struct clk_hw *hw)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       return ccu_enable_helper(&cd->common, cd->enable);
> +}
> +
> +static int ccu_div_is_enabled(struct clk_hw *hw)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       return ccu_is_enabled_helper(&cd->common, cd->enable);
> +}
> +
> +const struct clk_ops ccu_div_ops =3D {
> +       .disable =3D ccu_div_disable,
> +       .enable =3D ccu_div_enable,
> +       .is_enabled =3D ccu_div_is_enabled,
> +       .get_parent =3D ccu_div_get_parent,
> +       .set_parent =3D ccu_div_set_parent,
> +       .recalc_rate =3D ccu_div_recalc_rate,
> +       .determine_rate =3D clk_hw_determine_rate_no_reparent,
> +};
> +
> +static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct ccu_pll *pll =3D hw_to_ccu_pll(hw);
> +       unsigned long div, mul, frac;
> +       unsigned int cfg0, cfg1;
> +       u64 rate =3D parent_rate;
> +
> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> +
> +       mul =3D FIELD_GET(TH1520_PLL_FBDIV, cfg0);
> +       div =3D FIELD_GET(TH1520_PLL_REFDIV, cfg0);
> +       if (!(cfg1 & TH1520_PLL_DSMPD)) {
> +               mul <<=3D TH1520_PLL_FRAC_BITS;
> +               frac =3D FIELD_GET(TH1520_PLL_FRAC, cfg1);
> +               mul +=3D frac;
> +               div <<=3D TH1520_PLL_FRAC_BITS;
> +       }
> +       rate =3D parent_rate * mul;
> +       rate =3D rate / div;
> +       return rate;
> +}
> +
> +static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
> +                                                   unsigned long parent_=
rate)
> +{
> +       struct ccu_pll *pll =3D hw_to_ccu_pll(hw);
> +       unsigned long div, rate =3D parent_rate;
> +       unsigned int cfg0, cfg1;
> +
> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
> +
> +       if (cfg1 & TH1520_PLL_BYPASS)
> +               return rate;
> +
> +       div =3D FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
> +             FIELD_GET(TH1520_PLL_POSTDIV2, cfg0);
> +
> +       rate =3D rate / div;
> +
> +       return rate;
> +}
> +
> +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> +                                        unsigned long parent_rate)
> +{
> +       unsigned long rate =3D parent_rate;
> +
> +       rate =3D th1520_pll_vco_recalc_rate(hw, rate);
> +       rate =3D th1520_pll_postdiv_recalc_rate(hw, rate);
> +
> +       return rate;
> +}
> +
> +const struct clk_ops clk_pll_ops =3D {
> +       .recalc_rate =3D ccu_pll_recalc_rate,
> +};
> +
> +const struct regmap_config th1520_clk_regmap_config =3D {

I don't get why this is moved.

> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .fast_io =3D true,
> +};
> diff --git a/drivers/clk/thead/clk-th1520.h b/drivers/clk/thead/clk-th152=
0.h
> new file mode 100644
> index 000000000000..285d41e65008
> --- /dev/null
> +++ b/drivers/clk/thead/clk-th1520.h
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> + *  Authors: Yangtao Li <frank.li@vivo.com>
> + *
> + * clk-th1520.h - Common definitions for T-HEAD TH1520 Clock Drivers
> + */
> +
> +#ifndef CLK_TH1520_H
> +#define CLK_TH1520_H
> +
> +#include <dt-bindings/clock/thead,th1520-clk-ap.h>

dt-bindings comes after linux includes, but this shouldn't be here
anyway.

> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>

Seems we have to have this one for clk_hw.

> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

I don't see these includes used here, so remove them.

> +#include <linux/regmap.h>

Forward declare regmap and drop the include

struct regmap;

> +
> +#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
> +#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
> +#define TH1520_PLL_FBDIV       GENMASK(19, 8)
> +#define TH1520_PLL_REFDIV      GENMASK(5, 0)
> +#define TH1520_PLL_BYPASS      BIT(30)
> +#define TH1520_PLL_DSMPD       BIT(24)
> +#define TH1520_PLL_FRAC                GENMASK(23, 0)
> +#define TH1520_PLL_FRAC_BITS    24

Are these going to be used in multiple drivers?

> +
> +struct ccu_internal {
> +       u8      shift;
> +       u8      width;
> +};
> +
> +struct ccu_div_internal {
> +       u8      shift;
> +       u8      width;
> +       u32     flags;
> +};
> +
> +struct ccu_common {
> +       int             clkid;
> +       struct regmap   *map;
> +       u16             cfg0;
> +       u16             cfg1;
> +       struct clk_hw   hw;
> +};
> +
> +struct ccu_mux {
> +       struct ccu_internal     mux;
> +       struct ccu_common       common;
> +};
> +
> +struct ccu_gate {
> +       u32                     enable;
> +       struct ccu_common       common;
> +};
> +
> +struct ccu_div {
> +       u32                     enable;
> +       struct ccu_div_internal div;
> +       struct ccu_internal     mux;
> +       struct ccu_common       common;
> +};
> +
> +struct ccu_pll {
> +       struct ccu_common       common;
> +};
> +
> +#define TH_CCU_ARG(_shift, _width)                                     \
> +       {                                                               \
> +               .shift  =3D _shift,                                      =
 \
> +               .width  =3D _width,                                      =
 \
> +       }
> +
> +#define TH_CCU_DIV_FLAGS(_shift, _width, _flags)                       \
> +       {                                                               \
> +               .shift  =3D _shift,                                      =
 \
> +               .width  =3D _width,                                      =
 \
> +               .flags  =3D _flags,                                      =
 \
> +       }
> +
> +#define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _gate, _flags) \
> +       struct ccu_gate _struct =3D {                                    =
 \
> +               .enable =3D _gate,                                       =
 \
> +               .common =3D {                                            =
 \
> +                       .clkid          =3D _clkid,                      =
 \
> +                       .cfg0           =3D _reg,                        =
 \
> +                       .hw.init        =3D CLK_HW_INIT_PARENTS_DATA(    =
 \
> +                                               _name,                  \
> +                                               _parent,                \
> +                                               &clk_gate_ops,          \
> +                                               _flags),                \
> +               }                                                       \
> +       }
> +
> +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct ccu_common, hw);
> +}
> +
> +static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
> +{
> +       struct ccu_common *common =3D hw_to_ccu_common(hw);
> +
> +       return container_of(common, struct ccu_mux, common);
> +}
> +
> +static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
> +{
> +       struct ccu_common *common =3D hw_to_ccu_common(hw);
> +
> +       return container_of(common, struct ccu_pll, common);
> +}
> +
> +static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
> +{
> +       struct ccu_common *common =3D hw_to_ccu_common(hw);
> +
> +       return container_of(common, struct ccu_div, common);
> +}
> +
> +static inline struct ccu_gate *hw_to_ccu_gate(struct clk_hw *hw)
> +{
> +       struct ccu_common *common =3D hw_to_ccu_common(hw);
> +
> +       return container_of(common, struct ccu_gate, common);
> +}
> +
> +extern const struct clk_ops ccu_div_ops;
> +extern const struct clk_ops clk_pll_ops;
> +extern const struct regmap_config th1520_clk_regmap_config;

Why is the regmap config exported?
