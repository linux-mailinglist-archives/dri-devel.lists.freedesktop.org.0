Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFEC4EF88A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 19:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B3D10E02B;
	Fri,  1 Apr 2022 17:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33510E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 17:02:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 908902F7;
 Fri,  1 Apr 2022 19:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648832530;
 bh=LGWLodHx28jd9verpae7ChrJT1fbqIVgWRUqV/RT+Qk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fUUIXowVKX915u/uLCBJ327EQZZ1fA5lOohKKjX/l6QLzicaioQ3B7Y9Zo6YqXDdL
 bYKeOZy7murJnzPMXtg7zk//Ft7s1mWdKr+xytGEzkeVjkVsfk6db9LkFBBE0TRaxY
 +Daqw8iOeODDZ2y7NJFmtQu4kqvHZIceit/ut2tA=
Date: Fri, 1 Apr 2022 20:02:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] drm/panel: lvds: Simplify mode parsing
Message-ID: <YkcvJwW5/pC8wjRn@pendragon.ideasonboard.com>
References: <20220331192347.103299-1-marex@denx.de>
 <Ykce0oywZTR5NnsF@pendragon.ideasonboard.com>
 <66182d46-9270-1096-97b1-1cd635e0795e@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66182d46-9270-1096-97b1-1cd635e0795e@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 06:11:22PM +0200, Marek Vasut wrote:
> On 4/1/22 17:48, Laurent Pinchart wrote:
> 
> Hi,
> 
> [...]
> 
> >> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> >> index 27a1c9923b09..65c6a6e9e223 100644
> >> --- a/drivers/gpu/drm/panel/panel-lvds.c
> >> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> >> @@ -30,7 +30,8 @@ struct panel_lvds {
> >>   	const char *label;
> >>   	unsigned int width;
> >>   	unsigned int height;
> >> -	struct videomode video_mode;
> >> +	struct drm_display_mode dmode;
> > 
> > "dmode" sounds a bit weird, I would have gone for just "mode", or
> > "display_mode", but I don't mind much.
> 
> That's how the of_get_drm_panel_display_mode() parameter is called in 
> drivers/gpu/drm/drm_modes.c , so I'll just keep it for consistency.
> 
> [...]
> 
> >> -	videomode_from_timing(&timing, &lvds->video_mode);
> >> -
> >> -	ret = of_property_read_u32(np, "width-mm", &lvds->width);
> >> -	if (ret < 0) {
> >> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> >> -			np, "width-mm");
> >> -		return -ENODEV;
> >> -	}
> >> -	ret = of_property_read_u32(np, "height-mm", &lvds->height);
> >> -	if (ret < 0) {
> >> -		dev_err(lvds->dev, "%pOF: invalid or missing %s DT property\n",
> >> -			np, "height-mm");
> >> -		return -ENODEV;
> >> -	}
> > 
> > of_get_drm_panel_display_mode() doesn't consider missing width-mm or
> > height-mm properties as an error. Should we check here that ->width_mm
> > and ->height_mm are not 0 ?
> 
> I wonder whether we should always require valid width-mm and height-mm 
> DT property in of_get_drm_panel_display_mode() instead.

If that doesn't introduce any regression, that would be my preference
too.

> [...]

-- 
Regards,

Laurent Pinchart
