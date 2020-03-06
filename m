Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B817CD91
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548806E185;
	Sat,  7 Mar 2020 10:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B24A6E49B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 16:30:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 098DD29681D
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To: Stephen Boyd <sboyd@kernel.org>, airlied@linux.ie, ck.hu@mediatek.com,
 laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
Date: Fri, 6 Mar 2020 17:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:45 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On 5/3/20 22:01, Stephen Boyd wrote:
> Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> There is no strong reason for this to use CLK_OF_DECLARE instead of
>> being a platform driver.
> 
> Cool.
> 
>> Plus, this driver provides clocks but also
>> a shared register space for the mediatek-drm and the mediatek-mdp
>> driver. So move to drivers/soc/mediatek as a platform driver.
>>
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> ---
>>
>> Changes in v11: None
>> Changes in v10:
>> - Renamed to be generic mtk-mmsys
>> - Add driver data support to be able to support diferent SoCs
>>
>> Changes in v9:
>> - Move mmsys to drivers/soc/mediatek (CK)
>>
>> Changes in v8:
>> - Be a builtin_platform_driver like other mediatek mmsys drivers.
>>
>> Changes in v7:
>> - Free clk_data->clks as well
>> - Get rid of private data structure
>>
>>  drivers/clk/mediatek/clk-mt8173.c | 104 --------------------
>>  drivers/soc/mediatek/Kconfig      |   7 ++
>>  drivers/soc/mediatek/Makefile     |   1 +
>>  drivers/soc/mediatek/mtk-mmsys.c  | 154 ++++++++++++++++++++++++++++++
> 
> Can you generate with -M so that we can see what has actually changed?
> 

Sure, sorry about that.

>>  4 files changed, 162 insertions(+), 104 deletions(-)
>>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>>
>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>> index 2114b563478c..7a156944d50e 100644
>> --- a/drivers/soc/mediatek/Kconfig
>> +++ b/drivers/soc/mediatek/Kconfig
>> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>>           Say yes here to add support for the MediaTek SCPSYS power domain
>>           driver.
>>  
>> +config MTK_MMSYS
>> +       bool "MediaTek MMSYS Support"
>> +       depends on COMMON_CLK_MT8173
> 
> Does it need some default so that defconfig updates don't break things?
> 

Right.

>> +       help
>> +         Say yes here to add support for the MediaTek Multimedia
>> +         Subsystem (MMSYS).
>> +
>>  endmenu
>> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
>> index b01733074ad6..01f9f873634a 100644
>> --- a/drivers/soc/mediatek/Makefile
>> +++ b/drivers/soc/mediatek/Makefile
>> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> new file mode 100644
>> index 000000000000..473cdf732fb5
>> --- /dev/null
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2014 MediaTek Inc.
>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "../../clk/mediatek/clk-gate.h"
>> +#include "../../clk/mediatek/clk-mtk.h"
> 
> Why not use include/linux/clk/?
> 

I can move these files to include, this will impact a lot more of drivers but,
yes, I think is the right way.

> But I also don't understand why the clk driver is moved outside of
> drivers/clk/ into drivers/soc/. Commit text saying that it has shared
> registers doesn't mean it can't still keep the clk driver part in the
> drivers/clk/ area.
> 

Actually moving this to the soc directory has been requested by CK (mediatek) as
a change in v8. You can see the discussion in [1]

Thanks,
 Enric

[1] https://patchwork.kernel.org/cover/11394709/

>> +
>> +#include <dt-bindings/clock/mt8173-clk.h>
>> +
>> +static const struct mtk_gate_regs mm0_cg_regs = {
>> +       .set_ofs = 0x0104,
>> +       .clr_ofs = 0x0108,
>> +       .sta_ofs = 0x0100,
>> +};
>> +
>> +static const struct mtk_gate_regs mm1_cg_regs = {
>> +       .set_ofs = 0x0114,
>> +       .clr_ofs = 0x0118,
>> +       .sta_ofs = 0x0110,
>> +};
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
