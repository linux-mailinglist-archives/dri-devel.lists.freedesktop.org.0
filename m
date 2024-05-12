Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A58C36F6
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42B810E08D;
	Sun, 12 May 2024 15:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="gDfarrKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383A410E08D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 15:23:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44CFNOLi104054;
 Sun, 12 May 2024 10:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715527404;
 bh=iPt9kUUsTlBAWuNAoPBMtkKgtnn+LDWAMV58Vn9IFvA=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=gDfarrKrX3LbWffw/cxWr8PUQ1no0AAh2nX2j/FMZVG6mNQ1MYrCN/N1oBL8wuTPC
 tSdNxtNLhQLXWIb2eLxBfiRxcG0vjj1ovcU605jREoeUuqFQPgVSSOU8ndwQPfrRlg
 Al+C8/6X8adOaWSS2kb8rj8iLWHz6sy1ShRdAf8w=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44CFNO90022407
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 12 May 2024 10:23:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 12
 May 2024 10:23:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 12 May 2024 10:23:23 -0500
Received: from [10.249.131.75] ([10.249.131.75])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44CFNEba016476;
 Sun, 12 May 2024 10:23:15 -0500
Message-ID: <e34dc434-7922-4b47-bc41-c06f13366194@ti.com>
Date: Sun, 12 May 2024 20:53:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/tidss: Add OLDI bridge support
To: Francesco Dolcini <francesco@dolcini.it>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, DRI Development
 List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-5-a-bhatia1@ti.com>
 <ZkCsfH1qeSsXyQz4@gaggiata.pivistrello.it>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ZkCsfH1qeSsXyQz4@gaggiata.pivistrello.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Francesco,

On 12/05/24 17:18, Francesco Dolcini wrote:
> Hello Aradhya, thanks for you patch, I should be able to test your patch on my
> hardware in the coming days.

That's appreciated. Thank you! =)

> 
> On Sun, May 12, 2024 at 01:00:55AM +0530, Aradhya Bhatia wrote:
>> Up till now, the OLDI support in tidss was integrated within the tidss dispc.
>> This was fine till the OLDI was one-to-mapped with the DSS video-port (VP).
>> The AM62 and AM62P SoCs have 2 OLDI TXes that can support dual-lvds / lvds-clone
>> modes.
>>
>> Add OLDI TXes as separate DRM bridge entities to better support the new LVDS
>> configurations.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>  drivers/gpu/drm/tidss/Makefile      |   3 +-
>>  drivers/gpu/drm/tidss/tidss_dispc.c |  11 +-
>>  drivers/gpu/drm/tidss/tidss_dispc.h |   4 +
>>  drivers/gpu/drm/tidss/tidss_drv.c   |  13 +-
>>  drivers/gpu/drm/tidss/tidss_drv.h   |   4 +
>>  drivers/gpu/drm/tidss/tidss_oldi.c  | 568 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/tidss/tidss_oldi.h  |  73 ++++
>>  7 files changed, 673 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
>>  create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>> index d15f836dca95..fd90e8498cc2 100644
>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>> @@ -23,6 +23,7 @@
>>  #include "tidss_drv.h"
>>  #include "tidss_kms.h"
>>  #include "tidss_irq.h"
>> +#include "tidss_oldi.h"
>>  
>>  /* Power management */
>>  
>> @@ -140,10 +141,17 @@ static int tidss_probe(struct platform_device *pdev)
>>  
>>  	spin_lock_init(&tidss->wait_lock);
>>  
>> +	ret = tidss_oldi_init(tidss);
>> +	if (ret) {
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to init OLDI (%d)\n", ret);
>> +		return ret;
>> +	}
> 
> return dev_err_probe()
> 
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
>> new file mode 100644
>> index 000000000000..fd96ca815542
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
>> @@ -0,0 +1,568 @@
> 
> ...
> 
>> +		ret = drm_of_find_panel_or_bridge(child, OLDI_OURPUT_PORT, -1,
>> +						  &panel, &bridge);
>> +		if (ret) {
>> +			/*
>> +			 * Either there was no OLDI sink in the devicetree, or
>> +			 * the OLDI sink has not been added yet. In any case,
>> +			 * return.
>> +			 * We don't want to have an OLDI node connected to DSS
>> +			 * but not to any sink.
>> +			 */
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(tidss->dev,
>> +					"no panel/bridge for OLDI%d. Error %d\n",
>> +					oldi_instance, ret);
> 
> just dev_err_probe
> 
>> +			goto err_put_node;
>> +		}
> 
> ...
> 
>> +		if (IS_ERR(oldi->io_ctrl)) {
>> +			dev_err(oldi->dev,
>> +				"%s: oldi%d syscon_regmap_lookup_by_phandle failed %ld\n",
>> +			       __func__, oldi_instance, PTR_ERR(oldi->io_ctrl));
>> +			ret = PTR_ERR(oldi->io_ctrl);
> 
> dev_err_probe 
> 
>> +			goto err_put_node;
>> +		}
>> +
>> +		oldi->s_clk = of_clk_get_by_name(child, "s_clk");
>> +		if (IS_ERR(oldi->s_clk)) {
>> +			dev_err(oldi->dev,
>> +				"%s: oldi%d Failed to get s_clk: %ld\n",
>> +				__func__, oldi_instance, PTR_ERR(oldi->s_clk));
>> +			ret = PTR_ERR(oldi->s_clk);
> 
> dev_err_probe

Got it. Will update in all the 4 places.

> 
> In general, in this function, sometime you print an error and goto
> err_put_node, sometime you just goto err_put_node.  Not sure what's the
> rationale on this.

There hasn't been any real logic behind the prints, except that I have
added them whenever there was something (specifc) to be explained. Other
times, for example, if the error is -ENOMEM, or any other systemic API
failure, there isn't any print required.

If this function does exit in an error, however, tidss_probe will always
throw a print (except in the case of -EPROBE_DEFER).

> 
>> +			goto err_put_node;
>> +		}
>> +
>> +		/* Register the bridge. */
>> +		oldi->bridge.of_node = child;
>> +		oldi->bridge.driver_private = oldi;
>> +		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
>> +		oldi->bridge.timings = &default_tidss_oldi_timings;
>> +
>> +		tidss->oldis[tidss->num_oldis++] = oldi;
>> +		oldi->tidss = tidss;
>> +
>> +		drm_bridge_add(&oldi->bridge);
>> +	}
>> +
>> +err_put_node:
>> +	of_node_put(child);
>> +	of_node_put(oldi_parent);
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.h b/drivers/gpu/drm/tidss/tidss_oldi.h
>> new file mode 100644
>> index 000000000000..5ad02ddea11a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tidss/tidss_oldi.h
>> @@ -0,0 +1,73 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (C) 2023 - Texas Instruments Incorporated
>> + *
>> + * Aradhya Bhatia <a-bhati1@ti.com>
>> + */
>> +
>> +#ifndef __TIDSS_OLDI_H__
>> +#define __TIDSS_OLDI_H__
>> +
>> +#include <linux/media-bus-format.h>
>> +
>> +#include "tidss_drv.h"
>> +#include "tidss_dispc.h"
>> +
>> +struct tidss_oldi;
> 
> why do you need this here? 

So that struct tidss_device can store pointers to struct tidss_oldi
instances.

> 
>> +
>> +/* OLDI Instances */
>> +#define OLDI(n)		n
>> +
>> +/* OLDI PORTS */
>> +#define OLDI_INPUT_PORT		0
>> +#define OLDI_OURPUT_PORT	1
>> +
>> +/* OLDI Config Bits */
>> +#define OLDI_ENABLE		BIT(0)
>> +#define OLDI_MAP		(BIT(1) | BIT(2) | BIT(3))
>> +#define OLDI_SRC		BIT(4)
>> +#define OLDI_CLONE_MODE		BIT(5)
>> +#define OLDI_MASTERSLAVE	BIT(6)
>> +#define OLDI_DEPOL		BIT(7)
>> +#define OLDI_MSB		BIT(8)
>> +#define OLDI_LBEN		BIT(9)
>> +#define OLDI_LBDATA		BIT(10)
>> +#define OLDI_DUALMODESYNC	BIT(11)
>> +#define OLDI_SOFTRST		BIT(12)
>> +#define OLDI_TPATCFG		BIT(13)
>> +
>> +/* Control MMR Register */
>> +
>> +/* Register offsets */
>> +#define OLDI_PD_CTRL            0x100
>> +#define OLDI_LB_CTRL            0x104
>> +
>> +/* Power control bits */
>> +#define OLDI_PWRDN_TX(n)	BIT(n)
>> +
>> +/* LVDS Bandgap reference Enable/Disable */
>> +#define OLDI_PWRDN_BG		BIT(8)
>> +
>> +#define OLDI_IDLE_CLK_HZ	25000000 /*25 MHz */
> this is used only on a single C files, move it there?
> 
> I would consider this comment in general for this header file,
> from a quick check most of this is used only in tidss_oldi.c.

Apart from struct tidss_device being able to access struct tidss_oldi,
there is no direct access to any of the above.

Perhaps I can move the idle clock definition into the C file.

However, before tidss_oldi.h, all the register definitions have been
stored in tidss_dispc_regs.h. It just seemed right to keep them out in
the header file and maintain the status quo.


Regards
Aradhya
