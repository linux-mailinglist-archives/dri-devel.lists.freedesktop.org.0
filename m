Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC068BE50
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 14:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A69410E3CD;
	Mon,  6 Feb 2023 13:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F2610E3C8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1675690411; x=1707226411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTWUyfTYU4fbu38M2dsjkBHhJrU05wzatML5KKWLAYA=;
 b=FWZOLA5FR97P2iOMMhPo91bgXBmZ7vEkyEetvQivlBhOtgIWCmvA7LTD
 VKDtz0MBRowz7Xrzqj9IcpyPU8JuXkzsOmJpyHcbhA/4JB1LpZE99Tt4T
 BmYlg8wFCijvASwlGmrvK9JzNY3R0fmxVx7H9KjCJ7dTJiuQTteqw9Vd2
 fPKjk7nWiSK5T6nX/vGXSEmzz2idE+uI5qznIEtdcyyLjkxjtUvXBj79s
 1ZOrKlrQUG9IEtOWTKP5/pF1NL+br6P6a+5dLjqZARYIbbsdnYqIgZNBf
 UDVIrC/po76JXs+Zmf341hIyTUacaSKOZVtr899QnZZn09XiNWKz+RJEB Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; d="scan'208";a="28892405"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 14:33:29 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 06 Feb 2023 14:33:29 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 14:33:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1675690409; x=1707226409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTWUyfTYU4fbu38M2dsjkBHhJrU05wzatML5KKWLAYA=;
 b=oul95aHwT6iULz35tjJvyLqd57RFiX588JbR5kzn0mj7F4/oML4tjeSm
 NEBNLH8+6HpmXU5vHPAYtj/k8MqGM7AsjjP+4iK1fop/eT5OIH+IdEakj
 sBQ5tD7VlptAySkMA3krPKr0xebxouzRPNKbE1X2r8wpptZw3qhAEaFXx
 yB0nyyUEuIDGxBoB9fvi2EOGhLFbxJt4aIvVoq9L/eq3rMz3k0vIOd0s5
 MgsmkN20GWKkgypXUt65l8toDp785zAeKpj2WP3VXsncPj1k8KmIf9Y3s
 VsxTY5Y8ZTu1FEAhvaGJQvnC2ZwP+4s+FpJY9kEth9OvzSpu6kl4pe732 w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; d="scan'208";a="28892403"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Feb 2023 14:33:28 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D7D19280056;
 Mon,  6 Feb 2023 14:33:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: fsl-dcu: enable PIXCLK on LS1021A
Date: Mon, 06 Feb 2023 14:33:26 +0100
Message-ID: <8179909.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230117110801.2069761-2-alexander.stein@ew.tq-group.com>
References: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
 <20230117110801.2069761-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: dri-devel@lists.freedesktop.org,
 Matthias Schiffer <matthias.schiffer@tq-group.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

any feedback on this?

Best regards
Alexander

Am Dienstag, 17. Januar 2023, 12:08:01 CET schrieb Alexander Stein:
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
> diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig
> b/drivers/gpu/drm/fsl-dcu/Kconfig index 5ca71ef87325..c9ee98693b48 100644
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
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c index
> 418887654bac..314cb8af89ee 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -100,12 +100,26 @@ static void fsl_dcu_irq_uninstall(struct drm_device
> *dev) static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
> {
>  	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
> +	struct regmap *scfg;
>  	int ret;
> 
>  	ret = fsl_dcu_drm_modeset_init(fsl_dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev->dev, ret, "failed to initialize 
mode
> setting\n");
> 
> +	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> +	if (PTR_ERR(scfg) != -ENODEV) {
> +		/*
> +		 * For simplicity, enable the PIXCLK unconditionally. 
Disabling
> +		 * the clock in PM or on unload could be implemented as a 
future
> +		 * improvement.
> +		 */
> +		ret = regmap_update_bits(scfg, SCFG_PIXCLKCR, 
SCFG_PIXCLKCR_PXCEN,
> +					SCFG_PIXCLKCR_PXCEN);
> +		if (ret < 0)
> +			return dev_err_probe(dev->dev, ret, "failed to 
enable pixclk\n");
> +	}
> +
>  	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
>  	if (ret < 0) {
>  		dev_err(dev->dev, "failed to initialize vblank\n");
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h
> b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h index
> e2049a0e8a92..566396013c04 100644
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




