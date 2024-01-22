Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CC836343
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 13:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6810E054;
	Mon, 22 Jan 2024 12:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857810E054
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705926670; x=1737462670;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rKOUFHXWJsPpXFJvsArPfdhbCBh4rHUm3fVGGQmfkIE=;
 b=YUsMiBONk7ZFK06mhtYGizfmA36+Qq9NHD16IQA3Bv2A7chByNWFZVYH
 CYPqdUVzgt3Ylm+1GdE+lkxo6LK3l25fyi9hlPjt+LpzCmna4Hg0ShXzy
 OZMMkb9BKDzeZybIqtKFYzM5gLNdohkhmEBpZKw50t3P3MQubvL8r2l/x
 kPMFZHlunWVHoJOkr692uslC34mwIzyDdOZskvS1wjwffiPacbcREQZbl
 dMdwoPj+0RUaoD7F0WvT4WMZElznzoEjDNb1SNJ9LtEL1BuXQf4+KHPRw
 +Yief76oCETTf6FmsCpOZk7YEEnzc458b7HFpjZBUYB0ppUk9CDmXNrSb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432357359"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432357359"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:31:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958723193"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="958723193"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:31:08 -0800
Message-ID: <be68fb6e-c41a-4aa9-9f89-455fbe339582@linux.intel.com>
Date: Mon, 22 Jan 2024 13:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Disable PLL after VPU IP reset during FLR
To: dri-devel@lists.freedesktop.org
References: <20231024165353.761507-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231024165353.761507-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Applied to drm-misc-fixes

On 24.10.2023 18:53, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> IP reset has to followed by ivpu_pll_disable() to properly enter
> reset state.
> 
> Fixes: 828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v2: use ivpu_hw_37xx_ip_reset() in ivpu_hw_37xx_power_up()
> 
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 23 ++++++++++++++++++++---
>  drivers/accel/ivpu/ivpu_hw_40xx.c | 23 ++++++++++++++++++++---
>  2 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 5c0246b9e522..56b53833ede2 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -598,7 +598,7 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
>  	return 0;
>  }
>  
> -static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
> +static int ivpu_hw_37xx_ip_reset(struct ivpu_device *vdev)
>  {
>  	int ret;
>  	u32 val;
> @@ -623,6 +623,23 @@ static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
>  	return ret;
>  }
>  
> +static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
> +{
> +	int ret = 0;
> +
> +	if (ivpu_hw_37xx_ip_reset(vdev)) {
> +		ivpu_err(vdev, "Failed to reset VPU IP\n");
> +		ret = -EIO;
> +	}
> +
> +	if (ivpu_pll_disable(vdev)) {
> +		ivpu_err(vdev, "Failed to disable PLL\n");
> +		ret = -EIO;
> +	}
> +
> +	return ret;
> +}
> +
>  static int ivpu_hw_37xx_d0i3_enable(struct ivpu_device *vdev)
>  {
>  	int ret;
> @@ -651,7 +668,7 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> -	ret = ivpu_hw_37xx_reset(vdev);
> +	ret = ivpu_hw_37xx_ip_reset(vdev);
>  	if (ret)
>  		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
>  
> @@ -722,7 +739,7 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
>  {
>  	int ret = 0;
>  
> -	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_reset(vdev))
> +	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_ip_reset(vdev))
>  		ivpu_err(vdev, "Failed to reset the VPU\n");
>  
>  	if (ivpu_pll_disable(vdev)) {
> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
> index e691c49c9841..b25d02dc541b 100644
> --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
> @@ -742,7 +742,7 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
>  	return 0;
>  }
>  
> -static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
> +static int ivpu_hw_40xx_ip_reset(struct ivpu_device *vdev)
>  {
>  	int ret;
>  	u32 val;
> @@ -764,6 +764,23 @@ static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
>  	return ret;
>  }
>  
> +static int ivpu_hw_40xx_reset(struct ivpu_device *vdev)
> +{
> +	int ret = 0;
> +
> +	if (ivpu_hw_40xx_ip_reset(vdev)) {
> +		ivpu_err(vdev, "Failed to reset VPU IP\n");
> +		ret = -EIO;
> +	}
> +
> +	if (ivpu_pll_disable(vdev)) {
> +		ivpu_err(vdev, "Failed to disable PLL\n");
> +		ret = -EIO;
> +	}
> +
> +	return ret;
> +}
> +
>  static int ivpu_hw_40xx_d0i3_enable(struct ivpu_device *vdev)
>  {
>  	int ret;
> @@ -824,7 +841,7 @@ static int ivpu_hw_40xx_power_up(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> -	ret = ivpu_hw_40xx_reset(vdev);
> +	ret = ivpu_hw_40xx_ip_reset(vdev);
>  	if (ret) {
>  		ivpu_err(vdev, "Failed to reset HW: %d\n", ret);
>  		return ret;
> @@ -902,7 +919,7 @@ static int ivpu_hw_40xx_power_down(struct ivpu_device *vdev)
>  {
>  	int ret = 0;
>  
> -	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_reset(vdev))
> +	if (!ivpu_hw_40xx_is_idle(vdev) && ivpu_hw_40xx_ip_reset(vdev))
>  		ivpu_warn(vdev, "Failed to reset the VPU\n");
>  
>  	if (ivpu_pll_disable(vdev)) {
