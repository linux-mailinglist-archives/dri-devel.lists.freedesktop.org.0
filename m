Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0C9A35218
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 00:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319D10E1A1;
	Thu, 13 Feb 2025 23:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IQKj7ZVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F36A10E1A1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 23:20:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5947581;
 Fri, 14 Feb 2025 00:19:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739488758;
 bh=XYJTaWXQEz/OWr9HpJqybRZfF8oAyhP96PpCImYOr/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQKj7ZVrXPkOzQx620VX74DWLRB70wxrXhw8PMx7mFc+yOczpPPW18tKQHM1Pim5u
 aeoDijx7jg1B2g1kVOAh7LD6S/bHbeZZJY1/3zyo2JnND332DQgQ8g8VYGDO+wCRsJ
 yQaeSyW4QhSZWerfQxXtSPzSudvbgu6I7xrBroHs=
Date: Fri, 14 Feb 2025 01:20:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v4] drm/bridge: display-connector: implement the error
 path of .probe()
Message-ID: <20250213232025.GB3457@pendragon.ideasonboard.com>
References: <20250131073453.551252-1-joe@pf.is.s.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131073453.551252-1-joe@pf.is.s.u-tokyo.ac.jp>
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

Hi Joe,

Thank you for the patch.

On Fri, Jan 31, 2025 at 04:34:53PM +0900, Joe Hattori wrote:
> Current implementation of .probe() leaks a reference of i2c_adapter.
> Implement an error path and call put_device() on the obtained
> i2c_adapter in it to fix this refcount bug.
> 
> Also, remove the IS_ERR() check before calling
> i2c_put_adapter(conn->bridge.ddc) since conn->bridge.dcc is either NULL
> or a valid pointer, and a null-check is already done in
> i2c_put_adapter().
> 
> This bug was found by an experimental verification tool that I am
> developing.
> 
> Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V4:
> - Stopped assigning the return value of dev_err_probe().
> - Updated the commit message.
> 
> Changes in V3:
> - Removed shadowed variables (ret).
> 
> Changes in V2:
> - Omit the null check before calling i2c_put_adapter().
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 31 +++++++++++++---------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 72bc508d4e6e..52a86f99fa45 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -329,35 +329,39 @@ static int display_connector_probe(struct platform_device *pdev)
>  
>  	/* Get the DP PWR for DP connector. */
>  	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
> -		int ret;
> -
>  		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
> -		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
> +		if (ret < 0) {
> +			dev_err_probe(&pdev->dev, ret,
> +					    "failed to get DP PWR regulator\n");
> +			goto err_put;
> +		}
>  	}
>  
>  	/* enable DDC */
>  	if (type == DRM_MODE_CONNECTOR_HDMIA) {
> -		int ret;
> -
>  		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
>  						       GPIOD_OUT_HIGH);
>  
>  		if (IS_ERR(conn->ddc_en)) {
>  			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
> -			return PTR_ERR(conn->ddc_en);
> +			ret = PTR_ERR(conn->ddc_en);
> +			goto err_put;
>  		}
>  
>  		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
> -		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
> +		if (ret < 0) {
> +			dev_err_probe(
> +				&pdev->dev, ret,
> +				"failed to get HDMI +5V Power regulator\n");

This looks weird.

			dev_err_probe(&pdev->dev, ret,
				      "failed to get HDMI +5V Power regulator\n");

or

			dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
if you prefer.

With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			goto err_put;
> +		}
>  	}
>  
>  	if (conn->supply) {
>  		ret = regulator_enable(conn->supply);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
> -			return ret;
> +			goto err_put;
>  		}
>  	}
>  
> @@ -383,6 +387,10 @@ static int display_connector_probe(struct platform_device *pdev)
>  	drm_bridge_add(&conn->bridge);
>  
>  	return 0;
> +
> +err_put:
> +	i2c_put_adapter(conn->bridge.ddc);
> +	return ret;
>  }
>  
>  static void display_connector_remove(struct platform_device *pdev)
> @@ -397,8 +405,7 @@ static void display_connector_remove(struct platform_device *pdev)
>  
>  	drm_bridge_remove(&conn->bridge);
>  
> -	if (!IS_ERR(conn->bridge.ddc))
> -		i2c_put_adapter(conn->bridge.ddc);
> +	i2c_put_adapter(conn->bridge.ddc);
>  }
>  
>  static const struct of_device_id display_connector_match[] = {

-- 
Regards,

Laurent Pinchart
