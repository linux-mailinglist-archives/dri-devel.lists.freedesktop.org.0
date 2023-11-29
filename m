Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F300E7FCB8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DE610E5AA;
	Wed, 29 Nov 2023 00:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226F10E5AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:39:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14EA09DE;
 Wed, 29 Nov 2023 01:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701218354;
 bh=fLSRHWJ9LglpWCRHAytva/xvauRTbkrBBqtDLyov6T0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djosKzIXowYoaysSo5SHvDzPbMNxQvDsSNaZacAj47KKaJCjVHWj1dSQkRsJQCoqG
 XKdREiau31Shg/KQ9rXGv7p55JO3FtyMO8v7nblWIKLDxXW7HCBDZjHLp+BRIHFBio
 T9BL9HBU8CvSzMqFXHg4Mli4h50OgIZxeC+gOOEw=
Date: Wed, 29 Nov 2023 02:39:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
Message-ID: <20231129003955.GB8171@pendragon.ideasonboard.com>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Thu, Nov 23, 2023 at 06:54:27PM +0100, Uwe Kleine-König wrote:
> pm_runtime_resume_and_get() already drops the runtime PM usage counter
> in the error case. So a call to pm_runtime_put_sync() can be dropped.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I wonder if checkpatch should warn about usage of pm_runtime_get_sync().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c45c07840f64..5b8e1dfc458d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1413,11 +1413,9 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	int ret;
>  
>  	if (!pdata->pwm_enabled) {
> -		ret = pm_runtime_get_sync(pdata->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_sync(pdata->dev);
> +		ret = pm_runtime_resume_and_get(pdata->dev);
> +		if (ret < 0)
>  			return ret;
> -		}
>  	}
>  
>  	if (state->enabled) {

-- 
Regards,

Laurent Pinchart
