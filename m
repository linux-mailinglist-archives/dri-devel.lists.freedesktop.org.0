Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530C17C7EE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 22:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9A989B62;
	Fri,  6 Mar 2020 21:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415F989B62
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 21:37:08 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0BA2206CC;
 Fri,  6 Mar 2020 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583530627;
 bh=MG+Nr/SsnHpbxh3SplI7F9p5PxrOCbN+06QsZJt0L64=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=UOBcufnT5iG/qTocPd8Abrcpb2d/ayJ3D2IC+N6l7uwMb1cOCrYtGgLDeRiMSoyCg
 j9f/IOHmE2KLqZGFjQ6ailwWXCmY4Goy+NK/hIBmDG/4vah7BEK6eW8H0/44BZXK0K
 EvsyhMVLJzO9CXKGR6hBNV5imLqjbZjWzihBgzpE=
MIME-Version: 1.0
In-Reply-To: <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, airlied@linux.ie,
 ck.hu@mediatek.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 ulrich.hecht+renesas@gmail.com
Date: Fri, 06 Mar 2020 13:37:07 -0800
Message-ID: <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, ,
	dri-devel@lists.freedesktop.org,
	Richard Fontana <rfontana@redhat.com>,
	Collabora Kernel ML <kernel@collabora.com>,
	linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
	wens@csie.org, linux-arm-kernel@lists.infradead.org,
	mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, frank-w@public-files.de,
	Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
	Houlong Wei <houlong.wei@mediatek.com>,
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Allison Randal <allison@lohutok.net>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rdunlap@infradead.org, linux-kernel@vger.kernel.org,
	fwll.ch@freedesktop.org, Daniel Vetter <daniel@f>,
	matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
> Hi Stephen,
> 
> On 5/3/20 22:01, Stephen Boyd wrote:
> > Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
> >> From: Matthias Brugger <mbrugger@suse.com>
> >>
> >> There is no strong reason for this to use CLK_OF_DECLARE instead of
> >> being a platform driver.
> > 
> > Cool.
> > 
> >> Plus, this driver provides clocks but also
> >> a shared register space for the mediatek-drm and the mediatek-mdp
> >> driver. So move to drivers/soc/mediatek as a platform driver.
> >>
> >> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >> ---
> >>
> >> Changes in v11: None
> >> Changes in v10:
> >> - Renamed to be generic mtk-mmsys
> >> - Add driver data support to be able to support diferent SoCs
> >>
> >> Changes in v9:
> >> - Move mmsys to drivers/soc/mediatek (CK)
> >>
> >> Changes in v8:
> >> - Be a builtin_platform_driver like other mediatek mmsys drivers.
> >>
> >> Changes in v7:
> >> - Free clk_data->clks as well
> >> - Get rid of private data structure
> >>
> >>  drivers/clk/mediatek/clk-mt8173.c | 104 --------------------
> >>  drivers/soc/mediatek/Kconfig      |   7 ++
> >>  drivers/soc/mediatek/Makefile     |   1 +
> >>  drivers/soc/mediatek/mtk-mmsys.c  | 154 ++++++++++++++++++++++++++++++
> > 
> > Can you generate with -M so that we can see what has actually changed?
> > 
> 
> Sure, sorry about that.
> 
> >>  4 files changed, 162 insertions(+), 104 deletions(-)
> >>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
> >>
> >> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> >> index 2114b563478c..7a156944d50e 100644
> >> --- a/drivers/soc/mediatek/Kconfig
> >> +++ b/drivers/soc/mediatek/Kconfig
> >> @@ -44,4 +44,11 @@ config MTK_SCPSYS
> >>           Say yes here to add support for the MediaTek SCPSYS power domain
> >>           driver.
> >>  
> >> +config MTK_MMSYS
> >> +       bool "MediaTek MMSYS Support"
> >> +       depends on COMMON_CLK_MT8173
> > 
> > Does it need some default so that defconfig updates don't break things?
> > 
> 
> Right.
> 
> >> +       help
> >> +         Say yes here to add support for the MediaTek Multimedia
> >> +         Subsystem (MMSYS).
> >> +
> >>  endmenu
> >> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> >> index b01733074ad6..01f9f873634a 100644
> >> --- a/drivers/soc/mediatek/Makefile
> >> +++ b/drivers/soc/mediatek/Makefile
> >> @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> >>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> >>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> >>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> >> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> >> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> >> new file mode 100644
> >> index 000000000000..473cdf732fb5
> >> --- /dev/null
> >> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> >> @@ -0,0 +1,154 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2014 MediaTek Inc.
> >> + * Author: James Liao <jamesjj.liao@mediatek.com>
> >> + */
> >> +
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +#include "../../clk/mediatek/clk-gate.h"
> >> +#include "../../clk/mediatek/clk-mtk.h"
> > 
> > Why not use include/linux/clk/?
> > 
> 
> I can move these files to include, this will impact a lot more of drivers but,
> yes, I think is the right way.
> 
> > But I also don't understand why the clk driver is moved outside of
> > drivers/clk/ into drivers/soc/. Commit text saying that it has shared
> > registers doesn't mean it can't still keep the clk driver part in the
> > drivers/clk/ area.
> > 
> 
> Actually moving this to the soc directory has been requested by CK (mediatek) as
> a change in v8. You can see the discussion in [1]
> 

I can reply there in that thread if necessary, but we shouldn't need to
force simple-mfd into DT bindings to support this. Match the compatible
string in drivers/soc/ and register devices in software for the
different pieces of this overall hardware block. If necessary, pass down
the ioremapped addresss down through device data to each logical driver
in the respective subsystem.

So yes, it looks like an MFD, but that doesn't mean we have to change
the DT binding or put it in drivers/mfd to support that. And we don't
have to fix any problems with allowing two drivers to probe the same
compatible string.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
