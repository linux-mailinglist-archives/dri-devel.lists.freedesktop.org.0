Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECB8083B9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722A710E828;
	Thu,  7 Dec 2023 09:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C310E82A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701939734; x=1733475734;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6+V7qwmXRqQ713PNZlbo90Gt3Xr4lsfKvXfg4GN7o8o=;
 b=MHbw9YqgltnZ9rXxjcfkEkeb0hpGo77cRI8/lI9zAFt9YHB76dC7392r
 tQl2tr9YgdL3W7ClHGEPJHDQgRRlidoe0Sp3n/Yx5y3epmnZfaog/8gtO
 aZTLh6Le95TLcXrWG+DZD6+YFvy+XnErLxjFn+w+kuNCzUiJzKnYTn794
 IvZitEVmup6kvqQnybpfodA8MTYrd+PU47YIvvHzzoIMaIB8MPoJqosk3
 qUWfUHrfZetXPFQPru8Z63kyfqDSRr3VkoHdVGXNIihbOioFAHEhWLyGc
 S5f6EbocJlIU/cwlBiK5WPXoPwx9ZieoteLsfZ91G5qHUYaQS2xPmrHi5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393071125"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393071125"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:02:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775335294"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775335294"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga007.fm.intel.com with SMTP; 07 Dec 2023 01:02:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 07 Dec 2023 11:02:09 +0200
Date: Thu, 7 Dec 2023 11:02:09 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/3] usb: typec: nb7vpq904m: Only select DRM_AUX_BRIDGE
 with OF
Message-ID: <ZXGKEXDAMM6yUup7@kuha.fi.intel.com>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-1-d242a0ae9df4@kernel.org>
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
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 bryan.odonoghue@linaro.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 01:13:34PM -0700, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
> included when CONFIG_TYPEC_MUX_NB7VPQ904M selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>     Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>     Selected by [y]:
>     - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 5120942f309d..38416fb0cc3c 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -40,7 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
>  	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=n
> -	select DRM_AUX_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
> 
> -- 
> 2.43.0

-- 
heikki
