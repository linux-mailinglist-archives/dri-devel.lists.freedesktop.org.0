Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B29F07F3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360E410E24F;
	Fri, 13 Dec 2024 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XJWS3ERp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2150E10E24F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:33:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 304EA520;
 Fri, 13 Dec 2024 10:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1734082353;
 bh=O1h4i+0ftjHKQXumYTeFsA35/sdD3jnOQ5JEHudwz1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJWS3ERpuDsAsBwcPoy/a7plbbYHth4TkIp+fWynaCYI0G8QpRkbGworeA1xfnsu7
 1eAH1fmPLhJYa3Zci9AV45FtOjxBW9XtKq3uQfu28i3yqu4XbVCWNUQArU4RKy5O91
 JJOdk728E842jCMmTg+Hr58+e9BRasa2NGTi0jOo=
Date: Fri, 13 Dec 2024 11:32:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: display-connector: implement the error path
 of .probe()
Message-ID: <20241213093250.GA19755@pendragon.ideasonboard.com>
References: <20241213081550.3388074-1-joe@pf.is.s.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213081550.3388074-1-joe@pf.is.s.u-tokyo.ac.jp>
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

On Fri, Dec 13, 2024 at 05:15:50PM +0900, Joe Hattori wrote:
> Current implementation of .probe() leaks a reference of i2c_adapter.
> Implement an error path and call put_device() on the obtained
> i2c_adapter in it to fix this refcount bug.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 25 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 72bc508d4e6e..84f1c3798d32 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -332,8 +332,11 @@ static int display_connector_probe(struct platform_device *pdev)
>  		int ret;
>  
>  		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
> -		if (ret < 0)
> -			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
> +		if (ret < 0) {
> +			ret = dev_err_probe(&pdev->dev, ret,
> +					    "failed to get DP PWR regulator\n");
> +			goto err_put;
> +		}
>  	}
>  
>  	/* enable DDC */
> @@ -345,19 +348,24 @@ static int display_connector_probe(struct platform_device *pdev)
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
> +			ret = dev_err_probe(
> +				&pdev->dev, ret,
> +				"failed to get HDMI +5V Power regulator\n");

			ret = dev_err_probe(&pdev->dev, ret,
					    "failed to get HDMI +5V Power regulator\n");

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
> @@ -383,6 +391,11 @@ static int display_connector_probe(struct platform_device *pdev)
>  	drm_bridge_add(&conn->bridge);
>  
>  	return 0;
> +
> +err_put:
> +	if (conn->bridge.ddc)

i2c_put_adapter() already has a NULL check.

> +		i2c_put_adapter(conn->bridge.ddc);
> +	return ret;
>  }
>  
>  static void display_connector_remove(struct platform_device *pdev)

-- 
Regards,

Laurent Pinchart
