Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC506C01F4
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 14:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED8B10E162;
	Sun, 19 Mar 2023 13:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48810E162
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 13:13:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-162-78-nat.elisa-mobile.fi
 [85.76.162.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBAF91858;
 Sun, 19 Mar 2023 14:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679231578;
 bh=/r8ObLyvEZV8rs1xRhx4UsZVHgsYFJFhifnA3TcgfOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ktNUMzDgkjvggrnSuYTnyZ9cXjqpq8cH6o8Ez3F9BIRmrH7LKVWZTq9Ja4vtHvYed
 HF2KOMdNrzPh1j+hHH8U/7Iw77PrzDxS4FOGRsHO06ymkTaZ3pEkNTOdPcch90u04h
 5Lq//ctHOb9G/+FNUInep+V4M2iEu3q2HwHL5wq4=
Date: Sun, 19 Mar 2023 15:13:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 01/19] drm/bridge: cdns-mhdp8546: Improve error reporting
 in remove callback
Message-ID: <20230319131301.GF10144@pendragon.ideasonboard.com>
References: <20230318190804.234610-1-u.kleine-koenig@pengutronix.de>
 <20230318190804.234610-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230318190804.234610-2-u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sat, Mar 18, 2023 at 08:07:46PM +0100, Uwe Kleine-König wrote:
> Replace the generic error message issued by the driver core when the remove
> callback returns non-zero ("remove callback returned a non-zero value. This
> will be ignored.") by a message that tells the actual problem.
> 
> Also simplify a bit by checking the return value of wait_event_timeout a
> bit later.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f6822dfa3805..d74c6fa30ccc 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2574,7 +2574,6 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
>  {
>  	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
>  	unsigned long timeout = msecs_to_jiffies(100);
> -	bool stop_fw = false;
>  	int ret;
>  
>  	drm_bridge_remove(&mhdp->bridge);
> @@ -2582,18 +2581,19 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
>  	ret = wait_event_timeout(mhdp->fw_load_wq,
>  				 mhdp->hw_state == MHDP_HW_READY,
>  				 timeout);
> -	if (ret == 0)
> -		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> -			__func__);
> -	else
> -		stop_fw = true;
> -
>  	spin_lock(&mhdp->start_lock);
>  	mhdp->hw_state = MHDP_HW_STOPPED;
>  	spin_unlock(&mhdp->start_lock);
>  
> -	if (stop_fw)
> +	if (ret == 0) {
> +		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
> +			__func__);
> +	} else {
>  		ret = cdns_mhdp_set_firmware_active(mhdp, false);
> +		if (ret)
> +			dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n",
> +				ERR_PTR(ret));

Why not simply
			dev_err(mhdp->dev, "Failed to stop firmware (%d)\n",
				ret);

? Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	}
>  
>  	phy_exit(mhdp->phy);
>  
> @@ -2609,7 +2609,7 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(mhdp->clk);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct of_device_id mhdp_ids[] = {

-- 
Regards,

Laurent Pinchart
