Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDF3A6DE7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 20:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3806E091;
	Mon, 14 Jun 2021 18:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34066E091
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 18:02:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F1B8C4;
 Mon, 14 Jun 2021 20:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623693752;
 bh=5ca8iqJFgZlq6ZnMr9Z20pvoriSoIcoglGz+6mW0vs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k2E1p/KCteMVa+KOYX/u4JTZlqwB/FtR7euYTS/MrReC1Rl9eyolpxseE2YwQBopt
 zTtMpQjBeBxt7koeEK+nonKWXf39X+zAOEHfOGEaJAuATMF047LjatazaN83Qb9cnb
 PkGUMn9dwX4Agfn0HLMH+KeOGhovVH1yI+olJwg0=
Date: Mon, 14 Jun 2021 21:02:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YMeZpHfFhjz2d5Om@pendragon.ideasonboard.com>
References: <20210515204656.367442-1-marex@denx.de>
 <20210515204656.367442-2-marex@denx.de>
 <YKL2SAfonHJcoTw/@pendragon.ideasonboard.com>
 <cd0e358b-9d8e-9005-0889-346e2b7b722c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd0e358b-9d8e-9005-0889-346e2b7b722c@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, ch@denx.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, May 25, 2021 at 12:38:47PM +0200, Marek Vasut wrote:
> On 5/18/21 1:03 AM, Laurent Pinchart wrote:
> 
> Hi,
> 
> [...]
> 
> >> @@ -69,10 +70,33 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
> >>   			"Failed to disable regulator \"vcc\": %d\n", ret);
> >>   }
> >>   
> >> +static bool lvds_codec_mode_fixup(struct drm_bridge *bridge,
> >> +				const struct drm_display_mode *mode,
> >> +				struct drm_display_mode *adj)
> >> +{
> >> +	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> >> +	struct drm_encoder *encoder = bridge->encoder;
> >> +	struct drm_device *ddev = encoder->dev;
> >> +	struct drm_connector *connector;
> >> +
> >> +	/* If 'data-mapping' was not specified, do nothing. */
> >> +	if (!lvds_codec->bus_format)
> >> +		return true;
> >> +
> >> +	/* Patch in the LVDS format */
> >> +	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
> >> +		drm_display_info_set_bus_formats(&connector->display_info,
> >> +						 &lvds_codec->bus_format, 1);
> >> +	}
> > 
> > This part bothers me, as the format at the input of the LVDS decoder
> > doesn't match the format on the connector. Shouldn't you implement
> > .atomic_get_output_bus_fmts() instead ?
> 
> No, I tried that option before this solution and that didn't work. The 
> atomic stuff seems to be separate from what I need to pass here, i.e. 
> without this, e.g. the mxsfb scanout engine still receives the wrong format.

I fear this needs to be investigated then, as the connected format isn't
the same as the LVDS decoder input format, so the above isn't right.

-- 
Regards,

Laurent Pinchart
