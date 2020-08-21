Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019424D643
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 15:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0456E151;
	Fri, 21 Aug 2020 13:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF786E151
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 13:41:11 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 29F1D5C3C51;
 Fri, 21 Aug 2020 15:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1598017269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LE2TFZ1+IweKi2vTZvvLk5Fk6G2KUt1tDlOSM8ejL5I=;
 b=mn8bJG3LS59omc5t6yxfYTIT+YcoTGKpneHtDa5pyD7zYO891zZLYf//ab4rICxuI/4nfU
 x1kL8cKVWk3LnbX4FIbovfXtIBww1CDUw13qOHWL6aQKgtTVBFuXNSASrkJ0rLnvJH57TH
 vDRaj9sQxLLSt09PSG9GCDdKX/7LPzs=
MIME-Version: 1.0
Date: Fri, 21 Aug 2020 15:41:09 +0200
From: Stefan Agner <stefan@agner.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, sboyd@kernel.org,
 mturquette@baylibre.com
Subject: Re: [PATCH] drm: fsl-dcu: enable PIXCLK on LS1021A
In-Reply-To: <20200820105832.22331-1-matthias.schiffer@ew.tq-group.com>
References: <20200820105832.22331-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <0321e3b1a9def003322b71f2a5fdfe08@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: David Airlie <airlied@linux.ie>, Alison Wang <alison.wang@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias,

On 2020-08-20 12:58, Matthias Schiffer wrote:
> The PIXCLK needs to be enabled in SCFG before accessing the DCU on LS1021A,
> or the access will hang.

Hm, this seems a rather ad-hoc access to SCFG from the DCU. We do
support a pixel clock in the device tree bindings of fsl-dcu, so ideally
we should enable the pixel clock through the clock framework.

On the other hand, I guess that would mean adding a clock driver to flip
a single bit, which seems a bit excessive too.

I'd like a second opinion on that. Adding clk framework maintainers.

--
Stefan

> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 25 +++++++++++++++++++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
> index d7dd8ba90e3a..9e5a35e7c00c 100644
> --- a/drivers/gpu/drm/fsl-dcu/Kconfig
> +++ b/drivers/gpu/drm/fsl-dcu/Kconfig
> @@ -8,6 +8,7 @@ config DRM_FSL_DCU
>  	select DRM_PANEL
>  	select REGMAP_MMIO
>  	select VIDEOMODE_HELPERS
> +	select MFD_SYSCON if SOC_LS1021A
>  	help
>  	  Choose this option if you have an Freescale DCU chipset.
>  	  If M is selected the module will be called fsl-dcu-drm.
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index abbc1ddbf27f..8a7556655581 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -51,6 +51,23 @@ static const struct regmap_config fsl_dcu_regmap_config = {
>  	.volatile_reg = fsl_dcu_drm_is_volatile_reg,
>  };
>  
> +static int fsl_dcu_scfg_config_ls1021a(struct device_node *np)
> +{
> +	struct regmap *scfg;
> +
> +	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> +	if (IS_ERR(scfg))
> +		return PTR_ERR(scfg);
> +
> +	/*
> +	 * For simplicity, enable the PIXCLK unconditionally. It might
> +	 * be possible to disable the clock in PM or on unload as a future
> +	 * improvement.
> +	 */
> +	return regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
> +				  SCFG_PIXCLKCR_PXCEN);
> +}
> +
>  static void fsl_dcu_irq_uninstall(struct drm_device *dev)
>  {
>  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> @@ -70,6 +87,14 @@ static int fsl_dcu_load(struct drm_device *dev,
> unsigned long flags)
>  		return ret;
>  	}
>  
> +	if (of_device_is_compatible(fsl_dev->np, "fsl,ls1021a-dcu")) {
> +		ret = fsl_dcu_scfg_config_ls1021a(fsl_dev->np);
> +		if (ret < 0) {
> +			dev_err(dev->dev, "failed to enable pixclk\n");
> +			goto done;
> +		}
> +	}
> +
>  	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
>  	if (ret < 0) {
>  		dev_err(dev->dev, "failed to initialize vblank\n");
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> index e2049a0e8a92..566396013c04 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> @@ -160,6 +160,9 @@
>  #define FSL_DCU_ARGB4444		12
>  #define FSL_DCU_YUV422			14
>  
> +#define SCFG_PIXCLKCR			0x28
> +#define SCFG_PIXCLKCR_PXCEN		BIT(31)
> +
>  #define VF610_LAYER_REG_NUM		9
>  #define LS1021A_LAYER_REG_NUM		10
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
