Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39F8083F7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4B10E818;
	Thu,  7 Dec 2023 09:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC3310E1B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701940313; x=1733476313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZcE5r+onmRZXLVOd8w757XhOgdVfZWpGAi/Ixy4pJPk=;
 b=F/FJ0T/LvTyIDKdsGAEz5W7k/zqOj/3piuNJ0lYQLHihIvfCsMsPVL4v
 ORMXuUu0xBmE3yR3ktVhW2hodV9VP7iBm3Z787zE/iO9Fn7PnQLmQnmMG
 TzS5WO+ZvmcG/mNVrJRfD3OSeuAzqROMCevdf3hYVGR24lVRv8HLyk33T
 2S7mReTKeSOo8Ao4JP9kh54o80J9uz1Yl4er3COScDIToKlgtXuSNfejG
 YvrYsI6U0lAnw+dHT+52M42aBtLSDbQAayeKX84Y6IFgQ9u7+qt18DXiD
 JBIPGdz/0vtaopi0ZrL/N+l2KgFM4c2O2BqynVTdNi2RN65mfBzzAq1s1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391374004"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="391374004"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 01:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771658852"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="771658852"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orsmga002.jf.intel.com with SMTP; 07 Dec 2023 01:11:45 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 07 Dec 2023 11:11:44 +0200
Date: Thu, 7 Dec 2023 11:11:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/3] usb: typec: qcom-pmic-typec: Only select
 DRM_AUX_HPD_BRIDGE with OF
Message-ID: <ZXGMUA7b4m4cIrv5@kuha.fi.intel.com>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
 <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-2-d242a0ae9df4@kernel.org>
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

On Tue, Dec 05, 2023 at 01:13:35PM -0700, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_HPD_BRIDGE depends on CONFIG_OF but that dependency is
> not included when CONFIG_TYPEC_QCOM_PMIC selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
> 
>   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>     Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>     Selected by [m]:
>     - TYPEC_QCOM_PMIC [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_TCPM [=m] && (ARCH_QCOM || COMPILE_TEST [=y]) && (DRM [=m] || DRM [=m]=n) && DRM_BRIDGE [=y]
> 
> Only select CONFIG_DRM_AUX_HPD_BRIDGE with both CONFIG_DRM_BRIDGE and
> CONFIG_OF to clear up the warning.
> 
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Shouldn't DRM_BRIDGE depend on/select OF instead?

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 64d5421c69e6..8cdd84ca5d6f 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,7 +80,7 @@ config TYPEC_QCOM_PMIC
>  	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on DRM || DRM=n
> -	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  A Type-C port and Power Delivery driver which aggregates two
>  	  discrete pieces of silicon in the PM8150b PMIC block: the
> 
> -- 
> 2.43.0

-- 
heikki
