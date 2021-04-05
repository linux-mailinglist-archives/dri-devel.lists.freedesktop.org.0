Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E32353A80
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 03:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996CA6E4E8;
	Mon,  5 Apr 2021 01:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F396E4E8
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 01:05:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F2F31025;
 Mon,  5 Apr 2021 03:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617584733;
 bh=/avT1ZR+k+cQhp3irhkZYkN6nvF673BT55y0EGhKqio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4hYKGz/uGBo4zCtaSacADKX5dfEc36dAIYshoiq9ZrwAEp7DitHgmg7qaAjhInd0
 BI/XIgw0AknUSLKThkZNDIN+3qeCaMgEIlM5BOK++9paCfUg+WomtzGW/TY295LF6E
 54WRVKPdHnshf4+94myrmVHpwayF7Y5rcnvn6UAI=
Date: Mon, 5 Apr 2021 04:04:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 11/12] drm/bridge: ti-sn65dsi86: Print an error if we
 fallback to panel modes
Message-ID: <YGpiMQkJbvdO6obJ@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.11.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.11.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:45PM -0700, Douglas Anderson wrote:
> Now that we can properly read the EDID for modes there should be no
> reason to fallback to the fixed modes that our downstream panel driver
> provides us. Let's make that clear by:
> - Putting an error message in the logs if we fall back.
> - Putting a comment in saying what's going on.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index fb50f9f95b0f..3b61898cf9cb 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -303,6 +303,13 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  			return num;
>  	}
>  
> +	/*
> +	 * Ideally this should never happen and we could remove the fallback
> +	 * but let's preserve old behavior.
> +	 */
> +	DRM_DEV_ERROR(pdata->dev,
> +		      "Failed to read EDID; falling back to panel modes");
> +
>  exit:
>  	return drm_panel_get_modes(pdata->panel, connector);
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
