Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D674A6A69FA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 10:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF66C10E0B7;
	Wed,  1 Mar 2023 09:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D736010E0B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677663862; x=1709199862;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7nWm1f6bPfOKsLZiND0bxe7rNCn2HYYOED5hRyMYTto=;
 b=amgjS4bBk0UYZtL8hlgD2gDKZTDYMzq+RyQRqXOxMz/qJaOTJ3YOBHrk
 fxxXtmDsvpixhtARFm2BiEZb0MKRb9ePEb4mK4UiW7+2Em1kJ09mg6q9/
 ss1poHogpKiuoXc3XI1IIWATyaUPkRbh1TYVr8vLaIyhKayTpLkDmApkr
 D3j5GMNRv8AvVYKlDod90tEApnJFKzu5dYQoWWwzSdfLhNzWFcIRXQy2R
 e5BYmxhB0hbljq7jhuIlNBhHGx0PiSyrYAAAnXqzzR8ASEJ36nja+HAhC
 H1i/TwDc1MTUjPVE4KcAx26GVDaFgugrvLFTpYRur1dKjmkgzGuiZ0jz/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="322627869"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="322627869"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:44:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624419635"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="624419635"
Received: from dsvarnas-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.46.249])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 01:44:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH v8 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
In-Reply-To: <e427dcb5cff953ace36df3225b8444da5cd83f8b.1677574322.git.code@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1677574322.git.code@siddh.me>
 <e427dcb5cff953ace36df3225b8444da5cd83f8b.1677574322.git.code@siddh.me>
Date: Wed, 01 Mar 2023 11:44:08 +0200
Message-ID: <87edq8x0uv.fsf@intel.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Siddh Raman Pant <code@siddh.me> wrote:
> This reverts commit 1040e424353f5f4d39f6f3aa8723eb3bd6ea6446.
>
> It used an incorrect way to use drm_* functions. Only drm_device ptrs
> should be passed, but the mentioned commit passed mipi_dsi_host ptr.
> It worked by accident due to macro magic.
>
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 4bc15fbd009d..398fac95dfc0 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -33,7 +33,6 @@
>  
>  #include <drm/display/drm_dsc.h>
>  #include <drm/drm_mipi_dsi.h>
> -#include <drm/drm_print.h>
>  
>  #include <video/mipi_display.h>
>  
> @@ -156,18 +155,19 @@ static int mipi_dsi_device_add(struct mipi_dsi_device *dsi)
>  static struct mipi_dsi_device *
>  of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
>  {
> +	struct device *dev = host->dev;
>  	struct mipi_dsi_device_info info = { };
>  	int ret;
>  	u32 reg;
>  
>  	if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
> -		drm_err(host, "modalias failure on %pOF\n", node);
> +		dev_err(dev, "modalias failure on %pOF\n", node);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	ret = of_property_read_u32(node, "reg", &reg);
>  	if (ret) {
> -		drm_err(host, "device node %pOF has no valid reg property: %d\n",
> +		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
>  			node, ret);
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -202,21 +202,22 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  			      const struct mipi_dsi_device_info *info)
>  {
>  	struct mipi_dsi_device *dsi;
> +	struct device *dev = host->dev;
>  	int ret;
>  
>  	if (!info) {
> -		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
> +		dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (info->channel > 3) {
> -		drm_err(host, "invalid virtual channel: %u\n", info->channel);
> +		dev_err(dev, "invalid virtual channel: %u\n", info->channel);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	dsi = mipi_dsi_device_alloc(host);
>  	if (IS_ERR(dsi)) {
> -		drm_err(host, "failed to allocate DSI device %ld\n",
> +		dev_err(dev, "failed to allocate DSI device %ld\n",
>  			PTR_ERR(dsi));
>  		return dsi;
>  	}
> @@ -227,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  
>  	ret = mipi_dsi_device_add(dsi);
>  	if (ret) {
> -		drm_err(host, "failed to add DSI device %d\n", ret);
> +		dev_err(dev, "failed to add DSI device %d\n", ret);
>  		kfree(dsi);
>  		return ERR_PTR(ret);
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
