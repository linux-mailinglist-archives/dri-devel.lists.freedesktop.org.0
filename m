Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D6A0922A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0C310F0BE;
	Fri, 10 Jan 2025 13:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="an4VIFwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509CD10F0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:36:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso15565765e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736516182; x=1737120982;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8P7iNv0mAXeAGSKfCf0HUawhqYYLf6sisnMlgkknW/s=;
 b=an4VIFwjcIckyfYqxatgNL+gvDK1DZjq2Gp93zH7ehtBQxFgj13FVXbmFdDkaC4aJg
 ryFU+wd/U79Bz6HZmKpNiYEFxJEHOPg7rGliDjCKHheWbPmoSGSF9X9nh29rdm4Kxhuf
 NKcazWF1XRwBeAhHk/ExkP5JZPy8wOQj2twZ8fn4GQ7wLKf0FtKLy1EXbcAicFtRIUQC
 j4S4fIV5TDXTTpl8c+xosHfiwW58wy++RWyW48nhKw0rm9NPyTcYCgGqGuucRIcG7247
 BhxFcJd9xslLWby8Spq/RjQPGe5cHeBMLuDAgHUkdrauAHZSpG8ss5XQtfeXXGEnHWfd
 4owA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736516182; x=1737120982;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8P7iNv0mAXeAGSKfCf0HUawhqYYLf6sisnMlgkknW/s=;
 b=YQAAKtPJU2bRGPCssJgaR1QA+8Ocz/SsrC7fnE3QCxDvy5Ot32FLWmUmw3EFCiqA+E
 Z9SWvkVDZVb2vNhahCwjrAC6SWaXZBa2rpoxNHgWzIjI4AhF4jVBzVRihy200YJlGtww
 jyXHwVXamThdR2qQ+vHt2lP9w08faUod5O3ykevdJed8GBfKcWHpuW1XejVmbqquPrlC
 8ziQG2f0Ste+S5gjkWJ3D5JxqjJac6Thil8h551f5kdrLS6JPOX6hwxumVc+U0g0wLBc
 tdZ5kwfTZHYWtkzYbomL5Bw6mOT7T1o5ytSZJZJGxqItIUpo3lLnuZZvUmUgBhYCHbJU
 YeTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKJmCjn+8E1a6W5tATjM+01AdYXgJtWDlC1+B3oPq/Oq3MQrS7rxrj6v1LdGFOEHzkmIUWX+kLS98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybrYdeeelFJQKRVj+SxKekh0OL1qK/8cR5NWf/YNB86LtUdMhU
 NE/nP7JddJE03pUxspX8CDJIjJleq0yz00jmk7mGeeiLZuuNnoxymU1ZG8tFEEk=
X-Gm-Gg: ASbGncsi//R3ZIwjqmRiEOnzRjfqUWByKgziy6MSvNSp29moKS/z+LonGsoXFKhliU2
 xlf63cvGS1sD1lxkJmfBMyRXDRtEFen0f/qFJqNKHu/RLDr2DBKvs64wkGEFW4BmkT30EZOae5Y
 Rd1zN45U07QgqeXCxvGdwa1xwXgskAA/2vYSSRa5ZFwtyY1gD7ZN4jAuupVZF2CBX9fFvX1pPD3
 5R0WsGOyVPso1OmzHAAYmK1M+89VOyR6xsktPfEd02Yx2WZRDTNOxI=
X-Google-Smtp-Source: AGHT+IE2t38/6Fgkasnk5z1oGlZWIwNNkxu56/ClKRywxNOMHRMUbu2KBmbq53eWMrvzd2a8fGu+uA==
X-Received: by 2002:a05:600c:5486:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-436e2696d1fmr96900075e9.9.1736516181737; 
 Fri, 10 Jan 2025 05:36:21 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f3f7:a818:65b5:3db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383dedsm4640121f8f.35.2025.01.10.05.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:36:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ao.xu@amlogic.com,  dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] drm: meson: add S4 compatible for DRM driver
In-Reply-To: <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com> (Ao Xu via's
 message of "Fri, 10 Jan 2025 13:39:53 +0800")
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-3-cbc2d5edaae8@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:36:20 +0100
Message-ID: <1j8qriaizv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri 10 Jan 2025 at 13:39, Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org> wrote:

> From: Ao Xu <ao.xu@amlogic.com>
>
> Add S4 compatible for DRM driver. This update driver logic to support
> S4-specific configurations. This also add vpu clock operation in
> bind, suspend, resume, shutdown stage.
>
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 127 +++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/meson/meson_drv.h |   6 ++
>  2 files changed, 132 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 81d2ee37e7732dca89d02347b9c972300b38771a..d28094efeb137ae0b9990ab3608825d563358dba 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -11,6 +11,7 @@
>  #include <linux/aperture.h>
>  #include <linux/component.h>
>  #include <linux/module.h>
> +#include <linux/clk.h>
>  #include <linux/of_graph.h>
>  #include <linux/sys_soc.h>
>  #include <linux/platform_device.h>
> @@ -160,6 +161,34 @@ static void meson_vpu_init(struct meson_drm *priv)
>  	writel_relaxed(value, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
>  }
>  
> +static void meson_setup_clk(struct meson_drm *priv, bool enable)
> +{
> +	int ret;
> +
> +	if (!priv || !priv->vpu_clk || !priv->vapb_clk)
> +		return;
> +
> +	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4))
> +		return;
> +
> +	if (enable) {
> +		ret = clk_prepare_enable(priv->vpu_clk);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to set vpu clk\n");
> +			return;
> +		}
> +		ret = clk_prepare_enable(priv->vapb_clk);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to Set vapb clk\n");
> +			clk_disable_unprepare(priv->vpu_clk);
> +			return;
> +		}
> +	} else {
> +		clk_disable_unprepare(priv->vpu_clk);
> +		clk_disable_unprepare(priv->vapb_clk);
> +	}
> +}
> +
>  struct meson_drm_soc_attr {
>  	struct meson_drm_soc_limits limits;
>  	const struct soc_device_attribute *attrs;
> @@ -241,6 +270,83 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  		goto free_drm;
>  	}
>  
> +	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_S4)) {
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sysctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */

This comment, the name of the zone and even the usage you are making of
it clearly show this is repeating the error of past, directly accessing
improperly shared registers which should otherwise have been implemented
as proper controller using the kernel available framework, such PD, phys,
clock, reset, etc ...

Worse, it gets encoded into the dt binding, making extremely difficult
to fix later on.

> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->sysctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->sysctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the SYSCTRL regmap\n");
> +			ret = PTR_ERR(priv->sysctrl);
> +			goto free_drm;
> +		}
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "clkctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */
> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->clkctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->clkctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the clkctrl regmap\n");
> +			ret = PTR_ERR(priv->clkctrl);
> +			goto free_drm;
> +		}
> +
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwrctrl");
> +		if (!res) {
> +			ret = -EINVAL;
> +			goto free_drm;
> +		}
> +		/* Simply ioremap since it may be a shared register zone */
> +		regs = devm_ioremap(dev, res->start, resource_size(res));
> +		if (!regs) {
> +			ret = -EADDRNOTAVAIL;
> +			goto free_drm;
> +		}
> +
> +		priv->pwrctrl = devm_regmap_init_mmio(dev, regs,
> +						  &meson_regmap_config);
> +		if (IS_ERR(priv->pwrctrl)) {
> +			dev_err(&pdev->dev, "Couldn't create the pwrctrl regmap\n");
> +			ret = PTR_ERR(priv->pwrctrl);
> +			goto free_drm;
> +		}
> +
> +		priv->vpu_clk = devm_clk_get(&pdev->dev, "vpu");
> +		if (IS_ERR(priv->vpu_clk)) {
> +			dev_err(&pdev->dev, "vpu clock request failed\n");
> +			ret = PTR_ERR(priv->vpu_clk);
> +			goto free_drm;
> +		}
> +
> +		priv->vapb_clk = devm_clk_get(&pdev->dev, "vapb");
> +		if (IS_ERR(priv->vapb_clk)) {
> +			dev_err(&pdev->dev, "vapb clock request failed\n");
> +			ret = PTR_ERR(priv->vapb_clk);
> +			goto free_drm;
> +		}
> +		meson_setup_clk(priv, true);
> +	}
> +
>  	priv->canvas = meson_canvas_get(dev);
>  	if (IS_ERR(priv->canvas)) {
>  		ret = PTR_ERR(priv->canvas);
> @@ -424,12 +530,21 @@ static const struct component_master_ops meson_drv_master_ops = {
>  
>  static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
>  {
> +	int ret;
>  	struct meson_drm *priv = dev_get_drvdata(dev);
>  
>  	if (!priv)
>  		return 0;
>  
> -	return drm_mode_config_helper_suspend(priv->drm);
> +	ret = drm_mode_config_helper_suspend(priv->drm);
> +	if (unlikely(ret)) {
> +		drm_err(dev, "suspend error: %d", ret);
> +		return ret;
> +	}
> +
> +	meson_setup_clk(priv, false);
> +
> +	return ret;
>  }
>  
>  static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> @@ -439,6 +554,7 @@ static int __maybe_unused meson_drv_pm_resume(struct device *dev)
>  	if (!priv)
>  		return 0;
>  
> +	meson_setup_clk(priv, true);
>  	meson_vpu_init(priv);
>  	meson_venc_init(priv);
>  	meson_vpp_init(priv);
> @@ -458,6 +574,7 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>  
>  	drm_kms_helper_poll_fini(priv->drm);
>  	drm_atomic_helper_shutdown(priv->drm);
> +	meson_setup_clk(priv, false);
>  }
>  
>  /*
> @@ -471,6 +588,7 @@ static const struct of_device_id components_dev_match[] = {
>  	{ .compatible = "amlogic,meson-gxl-dw-hdmi" },
>  	{ .compatible = "amlogic,meson-gxm-dw-hdmi" },
>  	{ .compatible = "amlogic,meson-g12a-dw-hdmi" },
> +	{ .compatible = "amlogic,meson-s4-dw-hdmi" },
>  	{}
>  };
>  
> @@ -539,6 +657,11 @@ static struct meson_drm_match_data meson_drm_g12a_data = {
>  	.afbcd_ops = &meson_afbcd_g12a_ops,
>  };
>  
> +static struct meson_drm_match_data meson_drm_s4_data = {
> +	.compat = VPU_COMPATIBLE_S4,
> +	.afbcd_ops = &meson_afbcd_g12a_ops,
> +};
> +
>  static const struct of_device_id dt_match[] = {
>  	{ .compatible = "amlogic,meson-gxbb-vpu",
>  	  .data       = (void *)&meson_drm_gxbb_data },
> @@ -548,6 +671,8 @@ static const struct of_device_id dt_match[] = {
>  	  .data       = (void *)&meson_drm_gxm_data },
>  	{ .compatible = "amlogic,meson-g12a-vpu",
>  	  .data       = (void *)&meson_drm_g12a_data },
> +	{ .compatible = "amlogic,meson-s4-vpu",
> +	  .data       = (void *)&meson_drm_s4_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 3f9345c14f31c13b071f420533fe8a450d3e0f36..c801a2e3e55a054247710aebae5602e44c9e1624 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -22,6 +22,7 @@ enum vpu_compatible {
>  	VPU_COMPATIBLE_GXL  = 1,
>  	VPU_COMPATIBLE_GXM  = 2,
>  	VPU_COMPATIBLE_G12A = 3,
> +	VPU_COMPATIBLE_S4 = 4,
>  };
>  
>  enum {
> @@ -45,6 +46,11 @@ struct meson_drm {
>  	enum vpu_compatible compat;
>  	void __iomem *io_base;
>  	struct regmap *hhi;
> +	struct regmap *sysctrl;
> +	struct regmap *clkctrl;
> +	struct regmap *pwrctrl;
> +	struct clk *vpu_clk;
> +	struct clk *vapb_clk;
>  	int vsync_irq;
>  
>  	struct meson_canvas *canvas;

-- 
Jerome
