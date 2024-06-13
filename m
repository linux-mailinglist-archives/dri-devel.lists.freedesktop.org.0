Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573F4907A96
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F5210E32C;
	Thu, 13 Jun 2024 18:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514E310E0A8;
 Thu, 13 Jun 2024 18:05:43 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 206573EFF6;
 Thu, 13 Jun 2024 20:05:40 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:05:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/8] drm/msm/dsi: drop unused GPIOs handling
Message-ID: <5wu7wdoxudmmbovopsdgdvdyrufddo6juiomvoelcic5eqctn7@zgc2qqtscxnz>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-3-67a0116b5366@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-3-67a0116b5366@linaro.org>
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

On 2024-06-13 20:05:06, Dmitry Baryshkov wrote:
> Neither disp-enable-gpios nor disp-te-gpios are defined in the schema.
> None of the board DT files use those GPIO pins. Drop them from the
> driver.

What's worse, when people set disp-te-gpios the
devm_gpiod_get_optional("disp-te", GPIOD_IN) below resets the typical mdp_vsync
function via pinctrl to the IN function, causing vsync signals to be lost and
the MDP hardware to fall back to half the requested refresh rate since commit
da9e7b7696d8 ("drm/msm/dpu: Correctly configure vsync tearcheck for command
mode").

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a50f4dda5941..c4d72562c95a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -7,7 +7,6 @@
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> -#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> @@ -130,9 +129,6 @@ struct msm_dsi_host {
>  
>  	unsigned long src_clk_rate;
>  
> -	struct gpio_desc *disp_en_gpio;
> -	struct gpio_desc *te_gpio;
> -
>  	const struct msm_dsi_cfg_handler *cfg_hnd;
>  
>  	struct completion dma_comp;
> @@ -1613,28 +1609,6 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
>  	return IRQ_HANDLED;
>  }
>  
> -static int dsi_host_init_panel_gpios(struct msm_dsi_host *msm_host,
> -			struct device *panel_device)
> -{
> -	msm_host->disp_en_gpio = devm_gpiod_get_optional(panel_device,
> -							 "disp-enable",
> -							 GPIOD_OUT_LOW);
> -	if (IS_ERR(msm_host->disp_en_gpio)) {
> -		DBG("cannot get disp-enable-gpios %ld",
> -				PTR_ERR(msm_host->disp_en_gpio));
> -		return PTR_ERR(msm_host->disp_en_gpio);
> -	}
> -
> -	msm_host->te_gpio = devm_gpiod_get_optional(panel_device, "disp-te",
> -								GPIOD_IN);
> -	if (IS_ERR(msm_host->te_gpio)) {
> -		DBG("cannot get disp-te-gpios %ld", PTR_ERR(msm_host->te_gpio));
> -		return PTR_ERR(msm_host->te_gpio);
> -	}
> -
> -	return 0;
> -}
> -
>  static int dsi_host_attach(struct mipi_dsi_host *host,
>  					struct mipi_dsi_device *dsi)
>  {
> @@ -1651,11 +1625,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->dsc)
>  		msm_host->dsc = dsi->dsc;
>  
> -	/* Some gpios defined in panel DT need to be controlled by host */
> -	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> -	if (ret)
> -		return ret;
> -
>  	ret = dsi_dev_attach(msm_host->pdev);
>  	if (ret)
>  		return ret;
> @@ -2422,9 +2391,6 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  	dsi_sw_reset(msm_host);
>  	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
>  
> -	if (msm_host->disp_en_gpio)
> -		gpiod_set_value(msm_host->disp_en_gpio, 1);
> -
>  	msm_host->power_on = true;
>  	mutex_unlock(&msm_host->dev_mutex);
>  
> @@ -2454,9 +2420,6 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  
>  	dsi_ctrl_disable(msm_host);
>  
> -	if (msm_host->disp_en_gpio)
> -		gpiod_set_value(msm_host->disp_en_gpio, 0);
> -
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
>  
>  	cfg_hnd->ops->link_clk_disable(msm_host);
> 
> -- 
> 2.39.2
> 
