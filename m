Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDAD97E329
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FBB10E049;
	Sun, 22 Sep 2024 20:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LR5aQ3OB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1496710E049
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:17:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso5600646e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727036223; x=1727641023; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=32JmbOeLWknizeDqyICO+CUtTh+HIReNZDfCv2JDvmQ=;
 b=LR5aQ3OBcvFp+nSzsDBpKXuNQmKCoz7wnXYzCcbU8kUnW04ybfNwPyAkZGNwxrKbYj
 VXbWmSpz/k89w+yVhPXspO6hlQ5epHMzghABY0p8GhlFMn45tjfGFIkH0tX2b2txKeW8
 /zqiTh602egNspBmmuBqD1eMGyFVIbs9OpqGi6y914H1V/l7JG2vgf2I5inEkCvIcrrA
 rMWvCIZOWTtWol+pch9aq0ZUFbUQcWLsBOdUnyQjKvlKkzVrT5jp8kvu2yFrI7hlb7Oe
 EjkVig1G5it+kfhTBIrukmz3aZWVVc9sno2TE36+kWDbpsNkJs6ODoLKhwBkHVmCBwdn
 2awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727036223; x=1727641023;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32JmbOeLWknizeDqyICO+CUtTh+HIReNZDfCv2JDvmQ=;
 b=xLKxAJLhhcNmzUM7CkNUy/UKIsbZJvtKLioILevspFHAuhGm6J2yHwOjMwUwJfaES/
 AgH6fPvDCz3nmAOjJbcJgcCW44SMtnbijIPrlUsWfg7cIyfoDmKm+MSGylT+IZV1Lt6f
 ACfYosGk6dQTyvnjoWXM+Q07QsGMRCmnHkN9hwuzkzr2Grm82a5L4+wplZ/8337jP2T7
 C6lFxDq5xey0HubH+PxLSI5KyS+qbrM5WA1gXASUaRgSu1WGZSaf84GCHBtzk5Tox6/W
 62Mkooa7ryBm9x8yxiIteEs+weEnmNyL8EFftZrM1+e5LHcD1jcyjwKwk3zw7xs4F82N
 8aow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI0pXGOMY/bUG8E1clxQf68ZKqb+5fc6xldbsR6WklMKT/KWD720p7lpwoVviX+UXhOiu67uLvUmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw5Cuy59EmQxV4brHNIwFQLQr1zSu87o1n717+vC76CRZUJyK1
 JXziVjmZB3AeBjl8ISNvVvLqIWJHg11i3/jeBpx2z/7xvdITm61sKdlACUf2Ijk=
X-Google-Smtp-Source: AGHT+IHIJ5Z1q5ftPWndXlf+WM28a7eu2ci+JGMAhIoMyc0Mok2MnFmmri/eOqRIQ4n8/dO3KPuJ6g==
X-Received: by 2002:a05:6512:b8e:b0:52c:e119:7f1 with SMTP id
 2adb3069b0e04-536ac33f1bcmr5933942e87.51.1727036223101; 
 Sun, 22 Sep 2024 13:17:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687096936sm3049380e87.150.2024.09.22.13.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 13:17:01 -0700 (PDT)
Date: Sun, 22 Sep 2024 23:16:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Message-ID: <pkpza56m6a7oeuuq5374l27kgeyemhbsnmbswnuyurqzbqpek5@rxh3arxdw7ve>
References: <20240904115135.1843274-1-alexander.stein@ew.tq-group.com>
 <20240904115135.1843274-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904115135.1843274-2-alexander.stein@ew.tq-group.com>
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

On Wed, Sep 04, 2024 at 01:51:35PM GMT, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> The PIXCLK needs to be enabled in SCFG before accessing certain DCU
> registers, or the access will hang.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/fsl-dcu/Kconfig           |  1 +
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 14 ++++++++++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h |  3 +++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
> index 5ca71ef87325..c9ee98693b48 100644
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
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 90cbd18f096d..283858350961 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -100,12 +100,26 @@ static void fsl_dcu_irq_uninstall(struct drm_device *dev)
>  static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
>  {
>  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> +	struct regmap *scfg;
>  	int ret;
>  
>  	ret = fsl_dcu_drm_modeset_init(fsl_dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
>  
> +	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> +	if (PTR_ERR(scfg) != -ENODEV) {
> +		/*
> +		 * For simplicity, enable the PIXCLK unconditionally. Disabling
> +		 * the clock in PM or on unload could be implemented as a future
> +		 * improvement.

This decision should be described in the commit message as well, as the
possible drawbacks (e.g. power consumption, stuck picure, etc).

> +		 */
> +		ret = regmap_update_bits(scfg, SCFG_PIXCLKCR, SCFG_PIXCLKCR_PXCEN,
> +					SCFG_PIXCLKCR_PXCEN);
> +		if (ret < 0)
> +			return dev_err_probe(dev->dev, ret, "failed to enable pixclk\n");
> +	}
> +
>  	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
>  	if (ret < 0) {
>  		dev_err(dev->dev, "failed to initialize vblank\n");
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
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
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
