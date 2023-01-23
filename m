Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA8678761
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577310E230;
	Mon, 23 Jan 2023 20:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17110E230
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dR4B6kHQaj7//M7qQq9wGbJI7CZHCHS2qtsNSs9a+F8=;
 b=TxOTfVrg/um7RkR6rLUTfEEukZxXqVFNASMm+FxBgthCKCAM1teo8wG75iuncGCBGDn7C+g6tzKZw
 HTiUQkHjqpK1O6BdGeSg969AZG3TvImmRpDGF5BHWK7TYsZujmEQumgp9dwg3flwAmFphEnxNX/xeX
 RZqLXXXLersU8MAyn2o9VFMAsWfVKE+UVmrXrMZr9W6xCc0+r19qlfW/fKpRFDtt945MT0IAU/99Bu
 phiKQGK9AOcOkoX/q+zbCcCcesMq9vuHV4DRvwU2Ab1guWKiH6esYmFcS9rwTwAO9D9is3fiiHIiuV
 cSYhgclusflPb2tF1psfe6uUpuuDEtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dR4B6kHQaj7//M7qQq9wGbJI7CZHCHS2qtsNSs9a+F8=;
 b=Xpjmt+gKZas22amWeotejMS/gMP0HnkV125albyqo4chHHtjppQ6+D5sXvGr88iOHCDC6Sm1qqTlJ
 MWDRCMNBA==
X-HalOne-ID: f65a9f49-9b5a-11ed-8cc5-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id f65a9f49-9b5a-11ed-8cc5-cde5ad41a1dd;
 Mon, 23 Jan 2023 20:17:32 +0000 (UTC)
Date: Mon, 23 Jan 2023 21:17:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@edgeble.ai>
Subject: Re: [PATCH 2/2] drm: bridge: dw-mipi-dsi: Switch to regmap support
Message-ID: <Y87rW8lI3HV8emjR@ravnborg.org>
References: <20230123184647.437965-1-jagan@edgeble.ai>
 <20230123184647.437965-2-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123184647.437965-2-jagan@edgeble.ai>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

The change to regmap looks nice. But two small comments below,
just some drive-by comments.

	Sam

On Tue, Jan 24, 2023 at 12:16:47AM +0530, Jagan Teki wrote:
> To make debugging easier, switch the driver to use regmap
> from conventional io calls.
> 
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 81 ++++++++++++-------
>  1 file changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 47bd69d5ac99..62a160af4047 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include <video/mipi_display.h>
> @@ -242,7 +243,7 @@ struct dw_mipi_dsi {
>  	struct mipi_dsi_host dsi_host;
>  	struct drm_bridge *panel_bridge;
>  	struct device *dev;
> -	void __iomem *base;
> +	struct regmap *regmap;
>  
>  	struct clk *pclk;
>  
> @@ -301,12 +302,16 @@ static inline struct dw_mipi_dsi *bridge_to_dsi(struct drm_bridge *bridge)
>  
>  static inline void dsi_write(struct dw_mipi_dsi *dsi, u32 reg, u32 val)
>  {
> -	writel(val, dsi->base + reg);
> +	regmap_write(dsi->regmap, reg, val);
>  }
>  
>  static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
>  {
> -	return readl(dsi->base + reg);
> +	u32 val;
> +
> +	regmap_read(dsi->regmap, reg, &val);
> +
> +	return val;
>  }
>  
>  static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> @@ -332,6 +337,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	if (IS_ERR(bridge))
>  		return PTR_ERR(bridge);
>  
> +	dev_info(host->dev, "Attached device %s\n", device->name);
>  	dsi->panel_bridge = bridge;
>  
>  	drm_bridge_add(&dsi->bridge);
> @@ -400,9 +406,9 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
>  	int ret;
>  	u32 val, mask;
>  
> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
> -				 val, !(val & GEN_CMD_FULL), 1000,
> -				 CMD_PKT_STATUS_TIMEOUT_US);
> +	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
> +				       val, !(val & GEN_CMD_FULL), 1000,
> +				       CMD_PKT_STATUS_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dsi->dev, "failed to get available command FIFO\n");
>  		return ret;
> @@ -411,9 +417,9 @@ static int dw_mipi_dsi_gen_pkt_hdr_write(struct dw_mipi_dsi *dsi, u32 hdr_val)
>  	dsi_write(dsi, DSI_GEN_HDR, hdr_val);
>  
>  	mask = GEN_CMD_EMPTY | GEN_PLD_W_EMPTY;
> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
> -				 val, (val & mask) == mask,
> -				 1000, CMD_PKT_STATUS_TIMEOUT_US);
> +	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
> +				       val, (val & mask) == mask,
> +				       1000, CMD_PKT_STATUS_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dsi->dev, "failed to write command FIFO\n");
>  		return ret;
> @@ -443,9 +449,9 @@ static int dw_mipi_dsi_write(struct dw_mipi_dsi *dsi,
>  			len -= pld_data_bytes;
>  		}
>  
> -		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
> -					 val, !(val & GEN_PLD_W_FULL), 1000,
> -					 CMD_PKT_STATUS_TIMEOUT_US);
> +		ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
> +					       val, !(val & GEN_PLD_W_FULL), 1000,
> +					       CMD_PKT_STATUS_TIMEOUT_US);
>  		if (ret) {
>  			dev_err(dsi->dev,
>  				"failed to get available write payload FIFO\n");
> @@ -466,9 +472,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
>  	u32 val;
>  
>  	/* Wait end of the read operation */
> -	ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
> -				 val, !(val & GEN_RD_CMD_BUSY),
> -				 1000, CMD_PKT_STATUS_TIMEOUT_US);
> +	ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
> +				       val, !(val & GEN_RD_CMD_BUSY), 1000,
> +				       CMD_PKT_STATUS_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dsi->dev, "Timeout during read operation\n");
>  		return ret;
> @@ -476,9 +482,9 @@ static int dw_mipi_dsi_read(struct dw_mipi_dsi *dsi,
>  
>  	for (i = 0; i < len; i += 4) {
>  		/* Read fifo must not be empty before all bytes are read */
> -		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
> -					 val, !(val & GEN_PLD_R_EMPTY),
> -					 1000, CMD_PKT_STATUS_TIMEOUT_US);
> +		ret = regmap_read_poll_timeout(dsi->regmap, DSI_CMD_PKT_STATUS,
> +					       val, !(val & GEN_PLD_R_EMPTY), 1000,
> +					       CMD_PKT_STATUS_TIMEOUT_US);
>  		if (ret) {
>  			dev_err(dsi->dev, "Read payload FIFO is empty\n");
>  			return ret;
> @@ -499,6 +505,9 @@ static ssize_t dw_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
>  	struct mipi_dsi_packet packet;
>  	int ret, nb_bytes;
>  
> +	DRM_INFO("%x %x %x\n", msg->type,
> +		 ((((u8 *)msg->tx_buf)[0] << 8) >> 8),
> +		 ((((u8 *)msg->tx_buf)[1] << 16)) >> 16);
This looks like some debug left-over. If not, then please consider to
use drm_info or dev_info.
>  	ret = mipi_dsi_create_packet(&packet, msg);
>  	if (ret) {
>  		dev_err(dsi->dev, "failed to create packet: %d\n", ret);
> @@ -828,17 +837,18 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
>  	u32 val;
>  	int ret;
>  
> -	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
> +	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENABLECLK |
>  		  PHY_UNRSTZ | PHY_UNSHUTDOWNZ);
This change is not related to the regmap conversion and should be
separated out.

	Sam
