Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76E1E39D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7916A6E0DA;
	Wed, 27 May 2020 07:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74D76E0DA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:06:13 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85A65206F1;
 Wed, 27 May 2020 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590563173;
 bh=Bnwio/T0f8/rO+4l0ETfUXCahBdmz6vzX2tvqweK3c4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oF/iNegV3lDmsHA8jl2XuOdgHsm3ArbmfhqDo4tj/ixgr/8+hjuVwgK2omrt1GHqK
 lftYRB6EtnDGNvsW0OlYmy8Cp4c40r1rRUvQnh70Y1+AmlskJw2okPi3Ha7N8yyMaB
 MuI4eAKk/rPw1yzcI9NKh9tcdk+KZvcMyWAF4ovE=
MIME-Version: 1.0
In-Reply-To: <a1efabae8d7df30c987bff10544c2071e906e07a.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <a1efabae8d7df30c987bff10544c2071e906e07a.1587742492.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v2 25/91] clk: bcm: Add BCM2711 DVP driver
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Wed, 27 May 2020 00:06:12 -0700
Message-ID: <159056317280.88029.13256292035418533462@swboyd.mtv.corp.google.com>
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

Quoting Maxime Ripard (2020-04-24 08:34:06)
> The HDMI block has a block that controls clocks and reset signals to the
> HDMI0 and HDMI1 controllers.
> 
> Let's expose that through a clock driver implementing a clock and reset
> provider.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
> new file mode 100644
> index 000000000000..c1c4b5857d32
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2020 Cerno
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
[...]
> +
> +static int clk_dvp_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *data;
> +       struct resource *res;
> +       struct clk_dvp *dvp;
> +       void __iomem *base;
> +       int ret;
> +
> +       dvp = devm_kzalloc(&pdev->dev, sizeof(*dvp), GFP_KERNEL);
> +       if (!dvp)
> +               return -ENOMEM;
> +       platform_set_drvdata(pdev, dvp);
> +
> +       dvp->data = devm_kzalloc(&pdev->dev,
> +                                struct_size(dvp->data, hws, NR_CLOCKS),
> +                                GFP_KERNEL);
> +       if (!dvp->data)
> +               return -ENOMEM;
> +       data = dvp->data;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()?

> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
