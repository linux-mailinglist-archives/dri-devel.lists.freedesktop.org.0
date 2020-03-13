Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DF183E20
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 02:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724276E279;
	Fri, 13 Mar 2020 01:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10526E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 01:01:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F27620637;
 Fri, 13 Mar 2020 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584061260;
 bh=uy2OXM73oGUesqzxIxuGWbUgIsrh1BViYety9ik44ic=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=we+k4V9lzqruvFLtqWB8xUS0uM6m3loDgI5ykV4MA6/qVEsIJ4FoazOCXo3sheqUs
 sSKld74yTBvSmF5NmECSVX8YJNH4g3t/aBR1ZtUykLsz32eEIE+ryxDzeM84gJG5DM
 QEyHcbC3597nFJuFP5EtLRoNe3Ed4HeJBOFGX4NI=
MIME-Version: 1.0
In-Reply-To: <6dd6bd48e894c1e8ee85c29a30ba1b18041d83c4.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6dd6bd48e894c1e8ee85c29a30ba1b18041d83c4.1582533919.git-series.maxime@cerno.tech>
Subject: Re: [PATCH 27/89] clk: bcm: Add BCM2711 DVP driver
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 12 Mar 2020 18:00:59 -0700
Message-ID: <158406125965.149997.13919203635322854760@swboyd.mtv.corp.google.com>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-02-24 01:06:29)
> diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
> new file mode 100644
> index 000000000000..f4773cc92724
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 Cerno
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/reset/reset-simple.h>
> +
> +#define DVP_HT_RPI_SW_INIT     0x04
> +#define DVP_HT_RPI_MISC_CONFIG 0x08
> +
> +#define NR_CLOCKS      2
> +#define NR_RESETS      6
> +
> +struct clk_dvp {
> +       struct clk                      *clks[NR_CLOCKS];
> +       struct clk_onecell_data         clk_data;
> +       struct reset_simple_data        reset;
> +};
> +
> +static int clk_dvp_probe(struct platform_device *pdev)
> +{
> +       struct resource *res;
> +       struct clk_dvp *dvp;
> +       void __iomem *base;
> +       const char *parent;
> +       int ret;
> +
> +       dvp = devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
> +       if (!dvp)
> +               return -ENOMEM;
> +       platform_set_drvdata(pdev, dvp);
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       dvp->reset.rcdev.owner = THIS_MODULE;
> +       dvp->reset.rcdev.nr_resets = NR_RESETS;
> +       dvp->reset.rcdev.ops = &reset_simple_ops;
> +       dvp->reset.rcdev.of_node = pdev->dev.of_node;
> +       dvp->reset.membase = base + DVP_HT_RPI_SW_INIT;
> +       spin_lock_init(&dvp->reset.lock);
> +
> +       ret = reset_controller_register(&dvp->reset.rcdev);
> +       if (ret)
> +               return ret;
> +
> +       parent = of_clk_get_parent_name(pdev->dev.of_node, 0);
> +       if (!parent)
> +               goto unregister_reset;
> +
> +       dvp->clks[0] = clk_register_gate(&pdev->dev, "hdmi0-108MHz",
> +                                        parent, CLK_IS_CRITICAL,
> +                                        base + DVP_HT_RPI_MISC_CONFIG, 3,
> +                                        CLK_GATE_SET_TO_DISABLE, &dvp->reset.lock);
> +       if (IS_ERR(dvp->clks[0])) {
> +               ret = PTR_ERR(dvp->clks[0]);
> +               goto unregister_reset;
> +       }
> +
> +       dvp->clks[1] = clk_register_gate(&pdev->dev, "hdmi1-108MHz",
> +                                        parent, CLK_IS_CRITICAL,
> +                                        base + DVP_HT_RPI_MISC_CONFIG, 4,
> +                                        CLK_GATE_SET_TO_DISABLE, &dvp->reset.lock);

Can we use clk_hw APIs, document why CLK_IS_CRITICAL, and use something
like clk_hw_register_gate_parent_data() so that we don't have to use
of_clk_get_parent_name() above?


> +       if (IS_ERR(dvp->clks[1])) {
> +               ret = PTR_ERR(dvp->clks[1]);
> +               goto unregister_clk0;
> +       }
> +
> +       dvp->clk_data.clks = dvp->clks;
> +       dvp->clk_data.clk_num = NR_CLOCKS;
> +       of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
> +                           &dvp->clk_data);

This can fail. Please recover. Also, please use clk_hw based APIs.

> +
> +       return 0;
> +
> +
> +unregister_clk0:
> +       clk_unregister_gate(dvp->clks[0]);
> +
> +unregister_reset:
> +       reset_controller_unregister(&dvp->reset.rcdev);
> +       return ret;
> +};
> +
> +static int clk_dvp_remove(struct platform_device *pdev)
> +{
> +       struct clk_dvp *dvp = platform_get_drvdata(pdev);
> +
> +       clk_unregister_gate(dvp->clks[1]);
> +       clk_unregister_gate(dvp->clks[0]);
> +       reset_controller_unregister(&dvp->reset.rcdev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id clk_dvp_dt_ids[] = {
> +       { .compatible = "brcm,brcm2711-dvp", },
> +       { /* sentinel */ },

Please drop comma after this so we can't put anything after lest it
cause a compiler error.

> +};
> +
> +static struct platform_driver clk_dvp_driver = {
> +       .probe  = clk_dvp_probe,
> +       .remove = clk_dvp_remove,
> +       .driver = {
> +               .name           = "brcm2711-dvp",
> +               .of_match_table = clk_dvp_dt_ids,
> +       },
> +};
> +module_platform_driver(clk_dvp_driver);
> -- 
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
