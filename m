Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F709D1A559
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 17:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82E10E51B;
	Tue, 13 Jan 2026 16:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C75C10E51D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 16:39:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vfhQc-0007MI-35; Tue, 13 Jan 2026 17:39:34 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vfhQb-000SBd-12;
 Tue, 13 Jan 2026 17:39:32 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vfhQa-009v7W-1h;
 Tue, 13 Jan 2026 17:39:32 +0100
Date: Tue, 13 Jan 2026 17:39:32 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 imx@lists.linux.dev, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3] drm/bridge: fsl-ldb: Parse register offsets from DT
Message-ID: <20260113163932.vx4245vyiafwvehg@pengutronix.de>
References: <20260104213712.128982-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260104213712.128982-1-marek.vasut@mailbox.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Marek,

On 26-01-04, Marek Vasut wrote:
> The DT bindings for this bridge describe register offsets for the LDB,
> parse the register offsets from DT instead of hard-coding them in the
> driver. No functional change.

during the discussion of the i.MX9 PDFC bridge dt-bindings [1] we came
to the conclusion that the 'reg' property shouldn't have been added to
the dt-bindings in the first place.

[1] https://lore.kernel.org/all/20251219153537.zgxcokyhcqerw4jp@pengutronix.de/

As descibed in [1], the PDFC and LDB aren't standalone IPs with
dedicated register spaces. For some cases like the LDB, there may be two
dedicated registers, but for other cases like the PDFC, there is only a
single register-field and the register containing this field is shared
between the PDFC and the MIPI-DSI block.

Therefore the 'reg' DT abstraction is wrong, instead the BLK-CTRL child
devices should appear without a 'reg' property as simple child devices.
The child devices need to get the register space from the syscon parent
and need to code the registers and register-fields within the driver
like the LDB does currently.

Sorry for the late feedback.

Regards,
  Marco

> The LDB was always meant to parse the 'reg' offsets out of the DT, it
> only went somewhat wrong in the process and we ended up with hard-coded
> reg<->compatible mapping. It was never intended to be that way, so fix
> it.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: - Switch to of_property_read_reg()
>     - Parse single-register LDB variants from DT too
> V3: - Update commit message
>     - Drop "likely" from the comment
> ---
>  drivers/gpu/drm/bridge/fsl-ldb.c | 58 ++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bce..aa352c70b9ab2 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -8,6 +8,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>  };
>  
>  struct fsl_ldb_devdata {
> -	u32 ldb_ctrl;
> -	u32 lvds_ctrl;
>  	bool lvds_en_bit;
> -	bool single_ctrl_reg;
>  };
>  
>  static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
> -	[IMX6SX_LDB] = {
> -		.ldb_ctrl = 0x18,
> -		.single_ctrl_reg = true,
> -	},
> -	[IMX8MP_LDB] = {
> -		.ldb_ctrl = 0x5c,
> -		.lvds_ctrl = 0x128,
> -	},
> +	[IMX6SX_LDB] = { },
> +	[IMX8MP_LDB] = { },
>  	[IMX93_LDB] = {
> -		.ldb_ctrl = 0x20,
> -		.lvds_ctrl = 0x24,
>  		.lvds_en_bit = true,
>  	},
>  };
> @@ -90,8 +80,11 @@ struct fsl_ldb {
>  	struct clk *clk;
>  	struct regmap *regmap;
>  	const struct fsl_ldb_devdata *devdata;
> +	u64 ldb_ctrl;
> +	u64 lvds_ctrl;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
> +	bool single_ctrl_reg;
>  };
>  
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -204,15 +197,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  		reg |=	(fsl_ldb->ch0_enabled ? LDB_CTRL_DI0_VSYNC_POLARITY : 0) |
>  			(fsl_ldb->ch1_enabled ? LDB_CTRL_DI1_VSYNC_POLARITY : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, reg);
>  
> -	if (fsl_ldb->devdata->single_ctrl_reg)
> +	if (fsl_ldb->single_ctrl_reg)
>  		return;
>  
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
>  	usleep_range(15, 20);
> @@ -220,7 +213,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	reg |=	(fsl_ldb->ch0_enabled ? LVDS_CTRL_CH0_EN : 0) |
>  		(fsl_ldb->ch1_enabled ? LVDS_CTRL_CH1_EN : 0);
>  
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, reg);
>  }
>  
>  static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
> @@ -231,12 +224,12 @@ static void fsl_ldb_atomic_disable(struct drm_bridge *bridge,
>  	/* Stop channel(s). */
>  	if (fsl_ldb->devdata->lvds_en_bit)
>  		/* Set LVDS_CTRL_LVDS_EN bit to disable. */
> -		regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl,
> +		regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl,
>  			     LVDS_CTRL_LVDS_EN);
>  	else
> -		if (!fsl_ldb->devdata->single_ctrl_reg)
> -			regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, 0);
> -	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->ldb_ctrl, 0);
> +		if (!fsl_ldb->single_ctrl_reg)
> +			regmap_write(fsl_ldb->regmap, fsl_ldb->lvds_ctrl, 0);
> +	regmap_write(fsl_ldb->regmap, fsl_ldb->ldb_ctrl, 0);
>  
>  	clk_disable_unprepare(fsl_ldb->clk);
>  }
> @@ -296,7 +289,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	struct device_node *remote1, *remote2;
>  	struct drm_panel *panel;
>  	struct fsl_ldb *fsl_ldb;
> -	int dual_link;
> +	int dual_link, idx, ret;
>  
>  	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>  	if (IS_ERR(fsl_ldb))
> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->dev = &pdev->dev;
>  	fsl_ldb->bridge.of_node = dev->of_node;
>  
> +	/* No "reg-names" property means single-register LDB */
> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> +	if (idx < 0) {
> +		fsl_ldb->single_ctrl_reg = true;
> +		idx = 0;
> +	}
> +
> +	ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->ldb_ctrl, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (!fsl_ldb->single_ctrl_reg) {
> +		idx = of_property_match_string(dev->of_node, "reg-names", "lvds");
> +		if (idx < 0)
> +			return idx;
> +
> +		ret = of_property_read_reg(dev->of_node, idx, &fsl_ldb->lvds_ctrl, NULL);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	fsl_ldb->clk = devm_clk_get(dev, "ldb");
>  	if (IS_ERR(fsl_ldb->clk))
>  		return PTR_ERR(fsl_ldb->clk);
> -- 
> 2.51.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
