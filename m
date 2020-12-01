Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB82C93F8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1815389DFA;
	Tue,  1 Dec 2020 00:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658889DFA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:33:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18AE831D;
 Tue,  1 Dec 2020 01:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782787;
 bh=zHkFpFJk1EHrcOyzIYV3F+ExzvqPuUphPS1SQfgLM0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYCkRCmVWkRdDQG//iQz4n26oHvkFoBjx4R//UCZ6/SQdwtGMnUbvANtI7IeSD/xs
 q16EYkjIVQSfNzHzZWF2Ohdf5oO3Jh35ELQTQAKoZXR73L3RRfqxeSi5NO8lbmRWBh
 PS7vUnL1bpg4W5uVnvE+VB+me5z1d5iF3CdssNKc=
Date: Tue, 1 Dec 2020 02:32:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 73/80] drm/omap: dsi: display_enable cleanup
Message-ID: <20201201003257.GR25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-74-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-74-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:31PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_enable(), which just calls
> _dsi_display_enable(), and rename _dsi_display_enable() to
> dsi_display_enable().

How about adding a comment here to explain why the WARN_ON() is needed
anymore ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 4f79d6c664ff..e50418db71ef 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3738,7 +3738,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
>  	}
>  }
>  
> -static void _dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_display_enable(struct dsi_data *dsi)
>  {
>  	int r;
>  
> @@ -3767,16 +3767,6 @@ static void _dsi_display_enable(struct dsi_data *dsi)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
>  
> -static void dsi_display_enable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi = to_dsi_data(dssdev);
> -	DSSDBG("dsi_display_enable\n");
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	_dsi_display_enable(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -3851,7 +3841,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
>  			return;
>  
>  		dsi_bus_lock(dsi);
> -		_dsi_display_enable(dsi);
> +		dsi_display_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4942,7 +4932,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
>  
>  	dsi_bus_lock(dsi);
>  
> -	dsi_display_enable(dssdev);
> +	dsi_display_enable(dsi);
>  
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
