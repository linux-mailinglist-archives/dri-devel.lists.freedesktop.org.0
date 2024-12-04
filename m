Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E09E4F17
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5876210EDD2;
	Thu,  5 Dec 2024 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="qgSFQcYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A807010ED31
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:54:06 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241204135405euoutp015d46e2248ee47177270b1081c307d6e3~N-cLiDuWk0405704057euoutp01a
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241204135405euoutp015d46e2248ee47177270b1081c307d6e3~N-cLiDuWk0405704057euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733320445;
 bh=2m2dCwxBvEIih/aNkKptER8bOBw6WGNFqy07DpmRn6U=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qgSFQcYxVJ8AAjw2Pl6mqt8abr5RzwjTwGpMm6tuSzcIg+oiWIwCfgxhkvrI9BTIQ
 TigLgqSOoe7D8u+DpPMxbS6C/MFrpR7qTMGgERlJXOH63O1X8cdUhIPOnmXBdMw3ac
 oB84XhyjD5JhYkH6o6q2LI2n9Osc3ouRx22g/Tjs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241204135404eucas1p20f69df3db10b74bad69da82ffedb4397~N-cLGRStE1565215652eucas1p2K;
 Wed,  4 Dec 2024 13:54:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 60.79.20397.CFE50576; Wed,  4
 Dec 2024 13:54:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241204135404eucas1p1ca100f80300d1b0fa27fee426f77634f~N-cKnrqOL0828608286eucas1p1T;
 Wed,  4 Dec 2024 13:54:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241204135404eusmtrp175731e553eaacbcb9ad59cb3c61f265a~N-cKmlckZ0050500505eusmtrp1V;
 Wed,  4 Dec 2024 13:54:04 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-7c-67505efc7491
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.AF.19920.BFE50576; Wed,  4
 Dec 2024 13:54:03 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241204135402eusmtip2226fa9cf15f8cc65623d1bce5d92794c~N-cJRPgpL2514725147eusmtip2A;
 Wed,  4 Dec 2024 13:54:02 +0000 (GMT)
Message-ID: <94356242-7c94-4da5-a9ad-684d03ddedd6@samsung.com>
Date: Wed, 4 Dec 2024 14:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/14] clk: thead: Refactor TH1520 clock driver
 to share common code
To: Stephen Boyd <sboyd@kernel.org>, airlied@gmail.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com,
 frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com,
 jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com,
 mripard@kernel.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <94a57c718a09a20d148101884bf2e5f2.sboyd@kernel.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1BUZRie75yz5ywbawc0+AZtaLbSqUZIcJiviQAnms7kjLOY3aisLY6L
 Cbu4K2AUF11AwEVE3dxWthXDWIHlortcJYtlWHERCOUScSu1AQbEZRcKFcjlWPHveZ/3eZ/n
 fb/5+Li3hfTj75UdYBUySZyIFBC1bQtdmx/uFktfdtb6oav95zBkeaCjUEVzJ4YMrZ08NNJj
 xtDNuRkSVd7pptB48yEC9Rn1FFK1VZFoQjdCIod6hIduNBaRyJnfClCtM5NEptZhChU7LAQq
 qW8EKDv3Bx765dobaOKGGkfZuifR8uV6Ci311RDozN0rFDJPFfKQzfQeyrxyiojYwMwMZFHM
 1MQEwVhzXBTTPH+WYBp0wxSjbugAzMWyXJIZ6rtMMt+1RzGjR20Yc6kknck0tWHMzI+9JHPM
 XAaYHlU/xVyyfyX2ihaExrBxe5NYRWDYp4JYx3g7L6HHCg72/3kNzwDO9DzgwYf0VqhqmMfy
 gIDvTRsBPDe5ALjCBWDdifs8rnAC2DS6+KjDXxnJKwjm+FIA9TMqiiumAWyxD+FukZAOg0Uu
 zB1B0M/BI5mzwI2FtBds//Y24cZP0f5wdFBLueVraQnMPbXNbbOOfojDgsWBlVmcrgPwaoeQ
 w75w8LZhhSfpIDhWauC5Zz3oCNi0kMZJ/KHKcgZ3+0D6ugD29mdg3M6R0KJ5l7t4LZy0mSkO
 b4D2k2qCw3I4ZpnFOfw1bFDbHuNX4VDnfdJtg9MvwKrGQI7eBktcXTjnvgYOTHtxG6yBJ2pP
 P6aFMCfbm1NvhBp1/n+hncZa7DgQ6VY9iW7VibpVt+j+zz0LiDLgyyYq46WsMljGJgcoJfHK
 RJk04HN5/EXw6Gfbl2xz9cA46QhoARgftADIx0XrhDtfEku9hTGSL1NYhfwTRWIcq2wB6/mE
 yFf4fIw/601LJQfYfSybwCr+7WJ8D78M7GmQGqKtpnxS5xKwtJ0VO6oSv9fbh0M18R5aOr6t
 6pXm/EPpd34dCdz4zutLpcWgqVIim/19eajoVtQfMQnvV4eP5w68Lcr3rAjdvZXN+bCy40H5
 9Pm7H0fOjzmSarYkY8umw+LoC28Zoi/kBfK1Vnlf5rPHQ2q6ye37NpXEZTXUFXy2Y8+U1n5r
 P5KrQddPp+9F2b4ojpV8FJgSrsHhmxaHsMsaWVj8m8y4q9x5JLvimPh8ZOPB8tQ9Bs+fzT5/
 pdQfvRkW5NoUFJzVsWs4dfZeaNJmwWv70xYXFN3P5ESwydbcAsVJ+Pfh6pIP9L3X1y+Gh9i+
 8dQYCqc1Jr3P4PITcyJCGSvZ8iKuUEr+AQGNLNdIBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsVy+t/xe7q/4wLSDdYdMbc4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLl5d7mC3aZvFb/N+z
 g93i37WNLBaz3+1nt9jyZiKrxfG14RYt+6ewOMh4vL/Ryu7x5uVLFo/DHV/YPfZ+W8DisXPW
 XXaPnp1nGD02repk87hzbQ+bx7yTgR73u48zeWxeUu/RsvYYk8f7fVfZPPq2rGL0uNR8nd1j
 8+nqAMEoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsE
 vYyPL06yFlw6zFhx/dkp5gbGz/VdjBwcEgImEl39xl2MXBxCAksZJbb8vcjWxcgJFJeRuNb9
 kgXCFpb4c62LDaLoNaPEkY83WUGaeQXsJOZ8YQKpYRFQkWhv+cQIYvMKCEqcnPkErFdUQF7i
 /q0Z7CC2sECixOR/i5lB5ogI/GGWmPz8NiuIwyywnVFiw8ypjBAb/jNKrH3QANbOLCAucevJ
 fLAVbAJGEg+WzwfbzCngILH7Zx2IySygLrF+nhBEtbxE89bZzBMYhWYhuWMWkkGzEDpmIelY
 wMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBRbTv2c/MOxnmvPuodYmTiYDzEKMHBrCTC
 G6QdkC7Em5JYWZValB9fVJqTWnyI0RQYFhOZpUST84GpMq8k3tDMwNTQxMzSwNTSzFhJnNft
 8vk0IYH0xJLU7NTUgtQimD4mDk6pBqbtZ6LvzPcqmOBrvCfW+ojs7tUVx80Pn2ua4y2V5WFm
 Uuha/GjbsaOVaht2tf7MaE0tE7b0yZkasCLPKOD8Qqs59oyVbnZ8t8K+S2zo8djs75/yxKXs
 uRF36+fJUwwPnDqpqbKIN1f6X3WBDc+0tRvLpB7v+KHS+ejwQ5uPeyMmcIYeEV/jXsUq3VT3
 zaXiaEeH3b2Q8097C5tD3q512rN62nVxE6v3d4WmH3vp0qtRqfjH6P+q4se24YFneq9wXdt0
 JVmdfcLOr3tFNigUXdzd8U5hH9u/hDkPzTn1P+z9WKG4+m9qjtEPHnGllPdP8hIK/2T56P5y
 ir3cmyGSs25rhLbZQSb7TyXdfYus/imxFGckGmoxFxUnAgBAf27A3QMAAA==
X-CMS-MailID: 20241204135404eucas1p1ca100f80300d1b0fa27fee426f77634f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241203134150eucas1p24ba8d2fbf2af5b8f9abe503b4334127d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134150eucas1p24ba8d2fbf2af5b8f9abe503b4334127d
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134150eucas1p24ba8d2fbf2af5b8f9abe503b4334127d@eucas1p2.samsung.com>
 <20241203134137.2114847-2-m.wilczynski@samsung.com>
 <94a57c718a09a20d148101884bf2e5f2.sboyd@kernel.org>
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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



On 12/3/24 20:56, Stephen Boyd wrote:
> Quoting Michal Wilczynski (2024-12-03 05:41:24)
>> diff --git a/drivers/clk/thead/Makefile b/drivers/clk/thead/Makefile
>> index 7ee0bec1f251..d7cf88390b69 100644
>> --- a/drivers/clk/thead/Makefile
>> +++ b/drivers/clk/thead/Makefile
>> @@ -1,2 +1,2 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> -obj-$(CONFIG_CLK_THEAD_TH1520_AP) += clk-th1520-ap.o
>> +obj-$(CONFIG_CLK_THEAD_TH1520_AP) += clk-th1520.o clk-th1520-ap.o
> 
> Can the -ap driver be extended instead? Or are the clks in a different
> IO region?

The Video Output (VO) clocks reside in a different address space as
defined in the T-HEAD manual 4.4.1 [1]. Therefore, creating a separate
driver made sense to maintain clarity and adhere to the existing
convention of having one driver per subsystem, similar to the
AP-specific driver.

[1] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> 
>> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
>> index 17e32ae08720..a6015805b859 100644
>> --- a/drivers/clk/thead/clk-th1520-ap.c
>> +++ b/drivers/clk/thead/clk-th1520-ap.c
>> @@ -5,297 +5,9 @@
>>   *  Authors: Yangtao Li <frank.li@vivo.com>
>>   */
>>  
>> -#include <dt-bindings/clock/thead,th1520-clk-ap.h>
> 
> Presumably this should stay here.
> 
>> -#include <linux/bitfield.h>
>> -#include <linux/clk-provider.h>
>> -#include <linux/device.h>
>> -#include <linux/module.h>
>> -#include <linux/platform_device.h>
>> -#include <linux/regmap.h>
> 
> These should all stay here as well.
> 
>> -
>> -#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
>> -#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
>> -#define TH1520_PLL_FBDIV       GENMASK(19, 8)
>> -#define TH1520_PLL_REFDIV      GENMASK(5, 0)
>> -#define TH1520_PLL_BYPASS      BIT(30)
>> -#define TH1520_PLL_DSMPD       BIT(24)
>> -#define TH1520_PLL_FRAC                GENMASK(23, 0)
>> -#define TH1520_PLL_FRAC_BITS    24
>> -
>> -struct ccu_internal {
>> -       u8      shift;
>> -       u8      width;
>> -};
>> -
>> -struct ccu_div_internal {
>> -       u8      shift;
>> -       u8      width;
>> -       u32     flags;
>> -};
>> -
>> -struct ccu_common {
>> -       int             clkid;
>> -       struct regmap   *map;
>> -       u16             cfg0;
>> -       u16             cfg1;
>> -       struct clk_hw   hw;
>> -};
>> -
>> -struct ccu_mux {
>> -       struct ccu_internal     mux;
>> -       struct ccu_common       common;
>> -};
>> -
>> -struct ccu_gate {
>> -       u32                     enable;
>> -       struct ccu_common       common;
>> -};
>> -
>> -struct ccu_div {
>> -       u32                     enable;
>> -       struct ccu_div_internal div;
>> -       struct ccu_internal     mux;
>> -       struct ccu_common       common;
>> -};
>> -
>> -struct ccu_pll {
>> -       struct ccu_common       common;
>> -};
>> -
>> -#define TH_CCU_ARG(_shift, _width)                                     \
>> -       {                                                               \
>> -               .shift  = _shift,                                       \
>> -               .width  = _width,                                       \
>> -       }
>> -
>> -#define TH_CCU_DIV_FLAGS(_shift, _width, _flags)                       \
>> -       {                                                               \
>> -               .shift  = _shift,                                       \
>> -               .width  = _width,                                       \
>> -               .flags  = _flags,                                       \
>> -       }
>> -
>> -#define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _gate, _flags) \
>> -       struct ccu_gate _struct = {                                     \
>> -               .enable = _gate,                                        \
>> -               .common = {                                             \
>> -                       .clkid          = _clkid,                       \
>> -                       .cfg0           = _reg,                         \
>> -                       .hw.init        = CLK_HW_INIT_PARENTS_DATA(     \
>> -                                               _name,                  \
>> -                                               _parent,                \
>> -                                               &clk_gate_ops,          \
>> -                                               _flags),                \
>> -               }                                                       \
>> -       }
>> -
>> -static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>> -{
>> -       return container_of(hw, struct ccu_common, hw);
>> -}
>> -
>> -static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
>> -{
>> -       struct ccu_common *common = hw_to_ccu_common(hw);
>> -
>> -       return container_of(common, struct ccu_mux, common);
>> -}
>> -
>> -static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
>> -{
>> -       struct ccu_common *common = hw_to_ccu_common(hw);
>> +#include "clk-th1520.h"
>>  
>> -       return container_of(common, struct ccu_pll, common);
>> -}
>> -
>> -static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
>> -{
>> -       struct ccu_common *common = hw_to_ccu_common(hw);
>> -
>> -       return container_of(common, struct ccu_div, common);
>> -}
>> -
>> -static inline struct ccu_gate *hw_to_ccu_gate(struct clk_hw *hw)
>> -{
>> -       struct ccu_common *common = hw_to_ccu_common(hw);
>> -
>> -       return container_of(common, struct ccu_gate, common);
>> -}
>> -
>> -static u8 ccu_get_parent_helper(struct ccu_common *common,
>> -                               struct ccu_internal *mux)
>> -{
>> -       unsigned int val;
>> -       u8 parent;
>> -
>> -       regmap_read(common->map, common->cfg0, &val);
>> -       parent = val >> mux->shift;
>> -       parent &= GENMASK(mux->width - 1, 0);
>> -
>> -       return parent;
>> -}
>> -
>> -static int ccu_set_parent_helper(struct ccu_common *common,
>> -                                struct ccu_internal *mux,
>> -                                u8 index)
>> -{
>> -       return regmap_update_bits(common->map, common->cfg0,
>> -                       GENMASK(mux->width - 1, 0) << mux->shift,
>> -                       index << mux->shift);
>> -}
>> -
>> -static void ccu_disable_helper(struct ccu_common *common, u32 gate)
>> -{
>> -       if (!gate)
>> -               return;
>> -       regmap_update_bits(common->map, common->cfg0,
>> -                          gate, ~gate);
>> -}
>> -
>> -static int ccu_enable_helper(struct ccu_common *common, u32 gate)
>> -{
>> -       unsigned int val;
>> -       int ret;
>> -
>> -       if (!gate)
>> -               return 0;
>> -
>> -       ret = regmap_update_bits(common->map, common->cfg0, gate, gate);
>> -       regmap_read(common->map, common->cfg0, &val);
>> -       return ret;
>> -}
>> -
>> -static int ccu_is_enabled_helper(struct ccu_common *common, u32 gate)
>> -{
>> -       unsigned int val;
>> -
>> -       if (!gate)
>> -               return true;
>> -
>> -       regmap_read(common->map, common->cfg0, &val);
>> -       return val & gate;
>> -}
>> -
>> -static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>> -                                        unsigned long parent_rate)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -       unsigned long rate;
>> -       unsigned int val;
>> -
>> -       regmap_read(cd->common.map, cd->common.cfg0, &val);
>> -       val = val >> cd->div.shift;
>> -       val &= GENMASK(cd->div.width - 1, 0);
>> -       rate = divider_recalc_rate(hw, parent_rate, val, NULL,
>> -                                  cd->div.flags, cd->div.width);
>> -
>> -       return rate;
>> -}
>> -
>> -static u8 ccu_div_get_parent(struct clk_hw *hw)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -
>> -       return ccu_get_parent_helper(&cd->common, &cd->mux);
>> -}
>> -
>> -static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -
>> -       return ccu_set_parent_helper(&cd->common, &cd->mux, index);
>> -}
>> -
>> -static void ccu_div_disable(struct clk_hw *hw)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -
>> -       ccu_disable_helper(&cd->common, cd->enable);
>> -}
>> -
>> -static int ccu_div_enable(struct clk_hw *hw)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -
>> -       return ccu_enable_helper(&cd->common, cd->enable);
>> -}
>> -
>> -static int ccu_div_is_enabled(struct clk_hw *hw)
>> -{
>> -       struct ccu_div *cd = hw_to_ccu_div(hw);
>> -
>> -       return ccu_is_enabled_helper(&cd->common, cd->enable);
>> -}
>> -
>> -static const struct clk_ops ccu_div_ops = {
>> -       .disable        = ccu_div_disable,
>> -       .enable         = ccu_div_enable,
>> -       .is_enabled     = ccu_div_is_enabled,
>> -       .get_parent     = ccu_div_get_parent,
>> -       .set_parent     = ccu_div_set_parent,
>> -       .recalc_rate    = ccu_div_recalc_rate,
>> -       .determine_rate = clk_hw_determine_rate_no_reparent,
>> -};
>> -
>> -static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
>> -                                               unsigned long parent_rate)
>> -{
>> -       struct ccu_pll *pll = hw_to_ccu_pll(hw);
>> -       unsigned long div, mul, frac;
>> -       unsigned int cfg0, cfg1;
>> -       u64 rate = parent_rate;
>> -
>> -       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
>> -       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
>> -
>> -       mul = FIELD_GET(TH1520_PLL_FBDIV, cfg0);
>> -       div = FIELD_GET(TH1520_PLL_REFDIV, cfg0);
>> -       if (!(cfg1 & TH1520_PLL_DSMPD)) {
>> -               mul <<= TH1520_PLL_FRAC_BITS;
>> -               frac = FIELD_GET(TH1520_PLL_FRAC, cfg1);
>> -               mul += frac;
>> -               div <<= TH1520_PLL_FRAC_BITS;
>> -       }
>> -       rate = parent_rate * mul;
>> -       rate = rate / div;
>> -       return rate;
>> -}
>> -
>> -static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
>> -                                                   unsigned long parent_rate)
>> -{
>> -       struct ccu_pll *pll = hw_to_ccu_pll(hw);
>> -       unsigned long div, rate = parent_rate;
>> -       unsigned int cfg0, cfg1;
>> -
>> -       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
>> -       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
>> -
>> -       if (cfg1 & TH1520_PLL_BYPASS)
>> -               return rate;
>> -
>> -       div = FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
>> -             FIELD_GET(TH1520_PLL_POSTDIV2, cfg0);
>> -
>> -       rate = rate / div;
>> -
>> -       return rate;
>> -}
>> -
>> -static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>> -                                        unsigned long parent_rate)
>> -{
>> -       unsigned long rate = parent_rate;
>> -
>> -       rate = th1520_pll_vco_recalc_rate(hw, rate);
>> -       rate = th1520_pll_postdiv_recalc_rate(hw, rate);
>> -
>> -       return rate;
>> -}
>> -
>> -static const struct clk_ops clk_pll_ops = {
>> -       .recalc_rate    = ccu_pll_recalc_rate,
>> -};
>> +#define NR_CLKS        (CLK_UART_SCLK + 1)
>>  
>>  static const struct clk_parent_data osc_24m_clk[] = {
>>         { .index = 0 }
>> @@ -956,15 +668,6 @@ static struct ccu_common *th1520_gate_clks[] = {
>>         &sram3_clk.common,
>>  };
>>  
>> -#define NR_CLKS        (CLK_UART_SCLK + 1)
> 
> Why did this move?
> 
>> -
>> -static const struct regmap_config th1520_clk_regmap_config = {
>> -       .reg_bits = 32,
>> -       .val_bits = 32,
>> -       .reg_stride = 4,
>> -       .fast_io = true,
>> -};
>> -
>>  static int th1520_clk_probe(struct platform_device *pdev)
>>  {
>>         struct device *dev = &pdev->dev;
>> diff --git a/drivers/clk/thead/clk-th1520.c b/drivers/clk/thead/clk-th1520.c
>> new file mode 100644
>> index 000000000000..e2bfe56de9af
>> --- /dev/null
>> +++ b/drivers/clk/thead/clk-th1520.c
>> @@ -0,0 +1,188 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
>> + *  Authors: Yangtao Li <frank.li@vivo.com>
>> + */
>> +
>> +#include "clk-th1520.h"
> 
> Explicitly include linux headers here, don't just put them all into a
> header file. It helps us easily see what C files are using different
> parts of the kernel infrastructure.
> 
>> +
>> +static u8 ccu_get_parent_helper(struct ccu_common *common,
>> +                               struct ccu_internal *mux)
>> +{
>> +       unsigned int val;
>> +       u8 parent;
>> +
>> +       regmap_read(common->map, common->cfg0, &val);
>> +       parent = val >> mux->shift;
>> +       parent &= GENMASK(mux->width - 1, 0);
>> +
>> +       return parent;
>> +}
>> +
>> +static int ccu_set_parent_helper(struct ccu_common *common,
>> +                                struct ccu_internal *mux, u8 index)
>> +{
>> +       return regmap_update_bits(common->map, common->cfg0,
>> +                                 GENMASK(mux->width - 1, 0) << mux->shift,
>> +                                 index << mux->shift);
>> +}
>> +
>> +static void ccu_disable_helper(struct ccu_common *common, u32 gate)
>> +{
>> +       if (!gate)
>> +               return;
>> +       regmap_update_bits(common->map, common->cfg0, gate, ~gate);
>> +}
>> +
>> +static int ccu_enable_helper(struct ccu_common *common, u32 gate)
>> +{
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       if (!gate)
>> +               return 0;
>> +
>> +       ret = regmap_update_bits(common->map, common->cfg0, gate, gate);
>> +       regmap_read(common->map, common->cfg0, &val);
>> +       return ret;
>> +}
>> +
>> +static int ccu_is_enabled_helper(struct ccu_common *common, u32 gate)
>> +{
>> +       unsigned int val;
>> +
>> +       if (!gate)
>> +               return true;
>> +
>> +       regmap_read(common->map, common->cfg0, &val);
>> +       return val & gate;
>> +}
>> +
>> +static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>> +                                        unsigned long parent_rate)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +       unsigned long rate;
>> +       unsigned int val;
>> +
>> +       regmap_read(cd->common.map, cd->common.cfg0, &val);
>> +       val = val >> cd->div.shift;
>> +       val &= GENMASK(cd->div.width - 1, 0);
>> +       rate = divider_recalc_rate(hw, parent_rate, val, NULL, cd->div.flags,
>> +                                  cd->div.width);
>> +
>> +       return rate;
>> +}
>> +
>> +static u8 ccu_div_get_parent(struct clk_hw *hw)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +
>> +       return ccu_get_parent_helper(&cd->common, &cd->mux);
>> +}
>> +
>> +static int ccu_div_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +
>> +       return ccu_set_parent_helper(&cd->common, &cd->mux, index);
>> +}
>> +
>> +static void ccu_div_disable(struct clk_hw *hw)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +
>> +       ccu_disable_helper(&cd->common, cd->enable);
>> +}
>> +
>> +static int ccu_div_enable(struct clk_hw *hw)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +
>> +       return ccu_enable_helper(&cd->common, cd->enable);
>> +}
>> +
>> +static int ccu_div_is_enabled(struct clk_hw *hw)
>> +{
>> +       struct ccu_div *cd = hw_to_ccu_div(hw);
>> +
>> +       return ccu_is_enabled_helper(&cd->common, cd->enable);
>> +}
>> +
>> +const struct clk_ops ccu_div_ops = {
>> +       .disable = ccu_div_disable,
>> +       .enable = ccu_div_enable,
>> +       .is_enabled = ccu_div_is_enabled,
>> +       .get_parent = ccu_div_get_parent,
>> +       .set_parent = ccu_div_set_parent,
>> +       .recalc_rate = ccu_div_recalc_rate,
>> +       .determine_rate = clk_hw_determine_rate_no_reparent,
>> +};
>> +
>> +static unsigned long th1520_pll_vco_recalc_rate(struct clk_hw *hw,
>> +                                               unsigned long parent_rate)
>> +{
>> +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
>> +       unsigned long div, mul, frac;
>> +       unsigned int cfg0, cfg1;
>> +       u64 rate = parent_rate;
>> +
>> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
>> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
>> +
>> +       mul = FIELD_GET(TH1520_PLL_FBDIV, cfg0);
>> +       div = FIELD_GET(TH1520_PLL_REFDIV, cfg0);
>> +       if (!(cfg1 & TH1520_PLL_DSMPD)) {
>> +               mul <<= TH1520_PLL_FRAC_BITS;
>> +               frac = FIELD_GET(TH1520_PLL_FRAC, cfg1);
>> +               mul += frac;
>> +               div <<= TH1520_PLL_FRAC_BITS;
>> +       }
>> +       rate = parent_rate * mul;
>> +       rate = rate / div;
>> +       return rate;
>> +}
>> +
>> +static unsigned long th1520_pll_postdiv_recalc_rate(struct clk_hw *hw,
>> +                                                   unsigned long parent_rate)
>> +{
>> +       struct ccu_pll *pll = hw_to_ccu_pll(hw);
>> +       unsigned long div, rate = parent_rate;
>> +       unsigned int cfg0, cfg1;
>> +
>> +       regmap_read(pll->common.map, pll->common.cfg0, &cfg0);
>> +       regmap_read(pll->common.map, pll->common.cfg1, &cfg1);
>> +
>> +       if (cfg1 & TH1520_PLL_BYPASS)
>> +               return rate;
>> +
>> +       div = FIELD_GET(TH1520_PLL_POSTDIV1, cfg0) *
>> +             FIELD_GET(TH1520_PLL_POSTDIV2, cfg0);
>> +
>> +       rate = rate / div;
>> +
>> +       return rate;
>> +}
>> +
>> +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>> +                                        unsigned long parent_rate)
>> +{
>> +       unsigned long rate = parent_rate;
>> +
>> +       rate = th1520_pll_vco_recalc_rate(hw, rate);
>> +       rate = th1520_pll_postdiv_recalc_rate(hw, rate);
>> +
>> +       return rate;
>> +}
>> +
>> +const struct clk_ops clk_pll_ops = {
>> +       .recalc_rate = ccu_pll_recalc_rate,
>> +};
>> +
>> +const struct regmap_config th1520_clk_regmap_config = {
> 
> I don't get why this is moved.
> 
>> +       .reg_bits = 32,
>> +       .val_bits = 32,
>> +       .reg_stride = 4,
>> +       .fast_io = true,
>> +};
>> diff --git a/drivers/clk/thead/clk-th1520.h b/drivers/clk/thead/clk-th1520.h
>> new file mode 100644
>> index 000000000000..285d41e65008
>> --- /dev/null
>> +++ b/drivers/clk/thead/clk-th1520.h
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
>> + *  Authors: Yangtao Li <frank.li@vivo.com>
>> + *
>> + * clk-th1520.h - Common definitions for T-HEAD TH1520 Clock Drivers
>> + */
>> +
>> +#ifndef CLK_TH1520_H
>> +#define CLK_TH1520_H
>> +
>> +#include <dt-bindings/clock/thead,th1520-clk-ap.h>
> 
> dt-bindings comes after linux includes, but this shouldn't be here
> anyway.
> 
>> +#include <linux/bitfield.h>
>> +#include <linux/clk-provider.h>
> 
> Seems we have to have this one for clk_hw.
> 
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> I don't see these includes used here, so remove them.
> 
>> +#include <linux/regmap.h>
> 
> Forward declare regmap and drop the include
> 
> struct regmap;
> 
>> +
>> +#define TH1520_PLL_POSTDIV2    GENMASK(26, 24)
>> +#define TH1520_PLL_POSTDIV1    GENMASK(22, 20)
>> +#define TH1520_PLL_FBDIV       GENMASK(19, 8)
>> +#define TH1520_PLL_REFDIV      GENMASK(5, 0)
>> +#define TH1520_PLL_BYPASS      BIT(30)
>> +#define TH1520_PLL_DSMPD       BIT(24)
>> +#define TH1520_PLL_FRAC                GENMASK(23, 0)
>> +#define TH1520_PLL_FRAC_BITS    24
> 
> Are these going to be used in multiple drivers?
> 
>> +
>> +struct ccu_internal {
>> +       u8      shift;
>> +       u8      width;
>> +};
>> +
>> +struct ccu_div_internal {
>> +       u8      shift;
>> +       u8      width;
>> +       u32     flags;
>> +};
>> +
>> +struct ccu_common {
>> +       int             clkid;
>> +       struct regmap   *map;
>> +       u16             cfg0;
>> +       u16             cfg1;
>> +       struct clk_hw   hw;
>> +};
>> +
>> +struct ccu_mux {
>> +       struct ccu_internal     mux;
>> +       struct ccu_common       common;
>> +};
>> +
>> +struct ccu_gate {
>> +       u32                     enable;
>> +       struct ccu_common       common;
>> +};
>> +
>> +struct ccu_div {
>> +       u32                     enable;
>> +       struct ccu_div_internal div;
>> +       struct ccu_internal     mux;
>> +       struct ccu_common       common;
>> +};
>> +
>> +struct ccu_pll {
>> +       struct ccu_common       common;
>> +};
>> +
>> +#define TH_CCU_ARG(_shift, _width)                                     \
>> +       {                                                               \
>> +               .shift  = _shift,                                       \
>> +               .width  = _width,                                       \
>> +       }
>> +
>> +#define TH_CCU_DIV_FLAGS(_shift, _width, _flags)                       \
>> +       {                                                               \
>> +               .shift  = _shift,                                       \
>> +               .width  = _width,                                       \
>> +               .flags  = _flags,                                       \
>> +       }
>> +
>> +#define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _gate, _flags) \
>> +       struct ccu_gate _struct = {                                     \
>> +               .enable = _gate,                                        \
>> +               .common = {                                             \
>> +                       .clkid          = _clkid,                       \
>> +                       .cfg0           = _reg,                         \
>> +                       .hw.init        = CLK_HW_INIT_PARENTS_DATA(     \
>> +                                               _name,                  \
>> +                                               _parent,                \
>> +                                               &clk_gate_ops,          \
>> +                                               _flags),                \
>> +               }                                                       \
>> +       }
>> +
>> +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
>> +{
>> +       return container_of(hw, struct ccu_common, hw);
>> +}
>> +
>> +static inline struct ccu_mux *hw_to_ccu_mux(struct clk_hw *hw)
>> +{
>> +       struct ccu_common *common = hw_to_ccu_common(hw);
>> +
>> +       return container_of(common, struct ccu_mux, common);
>> +}
>> +
>> +static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
>> +{
>> +       struct ccu_common *common = hw_to_ccu_common(hw);
>> +
>> +       return container_of(common, struct ccu_pll, common);
>> +}
>> +
>> +static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
>> +{
>> +       struct ccu_common *common = hw_to_ccu_common(hw);
>> +
>> +       return container_of(common, struct ccu_div, common);
>> +}
>> +
>> +static inline struct ccu_gate *hw_to_ccu_gate(struct clk_hw *hw)
>> +{
>> +       struct ccu_common *common = hw_to_ccu_common(hw);
>> +
>> +       return container_of(common, struct ccu_gate, common);
>> +}
>> +
>> +extern const struct clk_ops ccu_div_ops;
>> +extern const struct clk_ops clk_pll_ops;
>> +extern const struct regmap_config th1520_clk_regmap_config;
> 
> Why is the regmap config exported?

The regmap_config is exported to allow reuse across multiple drivers.
Initially, I passed the clock VOSYS address space using the reg property
and created the regmap from it, enabling other drivers to utilize the
same configuration. Later, I switched to a regmap-based syscon approach
but haven’t moved the regmap_config back to the AP driver.

Based on Krzysztof's feedback, using the reg property to pass
memory-mapped registers is preferred. If needed, I can create a separate
regmap_config for the VO subsystem instead of reusing the existing one.

I will also address the other points you mentioned in your review.

Thank you for your feedback.
Michał

> 
