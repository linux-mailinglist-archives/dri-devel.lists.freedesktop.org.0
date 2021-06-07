Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50939D8C1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 11:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32C26E895;
	Mon,  7 Jun 2021 09:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F5C86E895
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 09:30:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9228031B;
 Mon,  7 Jun 2021 02:30:01 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED5303F719;
 Mon,  7 Jun 2021 02:29:59 -0700 (PDT)
Date: Mon, 7 Jun 2021 10:29:49 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
 device
Message-ID: <20210607102949.00aba9b7@slackpad.fritz.box>
In-Reply-To: <20210607085836.2827429-1-megous@megous.com>
References: <20210607085836.2827429-1-megous@megous.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Saravana Kannan <saravanak@google.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM
 DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Allwinner sunXi
 SoC support" <linux-sunxi@lists.linux.dev>, "moderated list:ARM/Allwinner sunXi
 SoC support" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  7 Jun 2021 10:58:36 +0200
Ondrej Jirman <megous@megous.com> wrote:

Hi,

> From: Saravana Kannan <saravanak@google.com>
> 
> On sunxi boards that use HDMI output, HDMI device probe keeps being
> avoided indefinitely with these repeated messages in dmesg:
> 
>   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
>     not ready
> 
> There's a fwnode_link being created with fw_devlink=on between hdmi
> and hdmi-phy nodes, because both nodes have 'compatible' property set.
> 
> Fw_devlink code assumes that nodes that have compatible property
> set will also have a device associated with them by some driver
> eventually. This is not the case with the current sun8i-hdmi
> driver.
> 
> This commit makes sun8i-hdmi-phy into a proper platform device
> and fixes the display pipeline probe on sunxi boards that use HDMI.
> 
> More context: https://lkml.org/lkml/2021/5/16/203
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Many thanks to both of you for fixing this! I just tested this on a
Pine64-LTS (A64), Pine-H64 (H6) and OrangePi PC2 (H5). On all boards
this patch brings back HDMI video output for me.

Since this is a regression introduced with 5.13-rc1, we should merge
this ASAP.

Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> v2: Fix building as a module (phy and hdmi are part of the same module, so
> module init callbacks need to be shared)
> 
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 31 ++++++++++++++++---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  5 ++--
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 41 ++++++++++++++++++++++----
>  3 files changed, 66 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index bbdfd5e26ec88..f75fb157f2ff7 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -209,7 +209,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  		goto err_disable_clk_tmds;
>  	}
>  
> -	ret = sun8i_hdmi_phy_probe(hdmi, phy_node);
> +	ret = sun8i_hdmi_phy_get(hdmi, phy_node);
>  	of_node_put(phy_node);
>  	if (ret) {
>  		dev_err(dev, "Couldn't get the HDMI PHY\n");
> @@ -242,7 +242,6 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  cleanup_encoder:
>  	drm_encoder_cleanup(encoder);
> -	sun8i_hdmi_phy_remove(hdmi);
>  err_disable_clk_tmds:
>  	clk_disable_unprepare(hdmi->clk_tmds);
>  err_assert_ctrl_reset:
> @@ -263,7 +262,6 @@ static void sun8i_dw_hdmi_unbind(struct device *dev, struct device *master,
>  	struct sun8i_dw_hdmi *hdmi = dev_get_drvdata(dev);
>  
>  	dw_hdmi_unbind(hdmi->hdmi);
> -	sun8i_hdmi_phy_remove(hdmi);
>  	clk_disable_unprepare(hdmi->clk_tmds);
>  	reset_control_assert(hdmi->rst_ctrl);
>  	gpiod_set_value(hdmi->ddc_en, 0);
> @@ -320,7 +318,32 @@ static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
>  		.of_match_table = sun8i_dw_hdmi_dt_ids,
>  	},
>  };
> -module_platform_driver(sun8i_dw_hdmi_pltfm_driver);
> +
> +static int __init sun8i_dw_hdmi_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&sun8i_dw_hdmi_pltfm_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&sun8i_hdmi_phy_driver);
> +	if (ret) {
> +		platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit sun8i_dw_hdmi_exit(void)
> +{
> +	platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
> +	platform_driver_unregister(&sun8i_hdmi_phy_driver);
> +}
> +
> +module_init(sun8i_dw_hdmi_init);
> +module_exit(sun8i_dw_hdmi_exit);
>  
>  MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@siol.net>");
>  MODULE_DESCRIPTION("Allwinner DW HDMI bridge");
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> index d4b55af0592f8..74f6ed0e25709 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -195,14 +195,15 @@ struct sun8i_dw_hdmi {
>  	struct gpio_desc		*ddc_en;
>  };
>  
> +extern struct platform_driver sun8i_hdmi_phy_driver;
> +
>  static inline struct sun8i_dw_hdmi *
>  encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
>  {
>  	return container_of(encoder, struct sun8i_dw_hdmi, encoder);
>  }
>  
> -int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
> -void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi);
> +int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node);
>  
>  void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy);
>  void sun8i_hdmi_phy_set_ops(struct sun8i_hdmi_phy *phy,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index 9994edf675096..c9239708d398c 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/of_address.h>
> +#include <linux/of_platform.h>
>  
>  #include "sun8i_dw_hdmi.h"
>  
> @@ -597,10 +598,30 @@ static const struct of_device_id sun8i_hdmi_phy_of_table[] = {
>  	{ /* sentinel */ }
>  };
>  
> -int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
> +int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(node);
> +	struct sun8i_hdmi_phy *phy;
> +
> +	if (!pdev)
> +		return -EPROBE_DEFER;
> +
> +	phy = platform_get_drvdata(pdev);
> +	if (!phy)
> +		return -EPROBE_DEFER;
> +
> +	hdmi->phy = phy;
> +
> +	put_device(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
> -	struct device *dev = hdmi->dev;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
>  	struct sun8i_hdmi_phy *phy;
>  	struct resource res;
>  	void __iomem *regs;
> @@ -704,7 +725,7 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>  		clk_prepare_enable(phy->clk_phy);
>  	}
>  
> -	hdmi->phy = phy;
> +	platform_set_drvdata(pdev, phy);
>  
>  	return 0;
>  
> @@ -728,9 +749,9 @@ int sun8i_hdmi_phy_probe(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
>  	return ret;
>  }
>  
> -void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
> +static int sun8i_hdmi_phy_remove(struct platform_device *pdev)
>  {
> -	struct sun8i_hdmi_phy *phy = hdmi->phy;
> +	struct sun8i_hdmi_phy *phy = platform_get_drvdata(pdev);
>  
>  	clk_disable_unprepare(phy->clk_mod);
>  	clk_disable_unprepare(phy->clk_bus);
> @@ -744,4 +765,14 @@ void sun8i_hdmi_phy_remove(struct sun8i_dw_hdmi *hdmi)
>  	clk_put(phy->clk_pll1);
>  	clk_put(phy->clk_mod);
>  	clk_put(phy->clk_bus);
> +	return 0;
>  }
> +
> +struct platform_driver sun8i_hdmi_phy_driver = {
> +	.probe  = sun8i_hdmi_phy_probe,
> +	.remove = sun8i_hdmi_phy_remove,
> +	.driver = {
> +		.name = "sun8i-hdmi-phy",
> +		.of_match_table = sun8i_hdmi_phy_of_table,
> +	},
> +};

