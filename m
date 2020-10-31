Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72F2A1A99
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 21:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9110E6E07F;
	Sat, 31 Oct 2020 20:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FCC6E07F
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 20:56:24 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D6C2080501;
 Sat, 31 Oct 2020 21:56:18 +0100 (CET)
Date: Sat, 31 Oct 2020 21:56:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v6 2/2] drm/bridge: hx8837: add a Himax HX8837 display
 controller driver
Message-ID: <20201031205617.GA1111106@ravnborg.org>
References: <20201030030800.1036888-1-lkundrak@v3.sk>
 <20201030030800.1036888-3-lkundrak@v3.sk>
 <20201031080137.GB1044557@ravnborg.org>
 <20201031201259.GA294060@demiurge.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031201259.GA294060@demiurge.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=yQnS-YR962e6U0jWTX0A:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lubomir.

> > 
> > > +	select BACKLIGHT_CLASS_DEVICE
> > Please use a depends - using select on a symbol with a prompt is always
> > wrong. Yeah, I know you then need to enable backlight to see this
> > driver. Sorry, but this is the best we can do now.
> > Many other drivers can cope with depends here.
> 
> This results in a dependency loop:
> 
>   drivers/video/fbdev/Kconfig:12:error: recursive dependency detected!
>   drivers/video/fbdev/Kconfig:12: symbol FB is selected by DRM_KMS_FB_HELPER
>   drivers/gpu/drm/Kconfig:80:     symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
>   drivers/gpu/drm/Kconfig:74:     symbol DRM_KMS_HELPER is selected by DRM_HIMAX_HX8837
>   drivers/gpu/drm/bridge/Kconfig:51:      symbol DRM_HIMAX_HX8837 depends on BACKLIGHT_CLASS_DEVICE
>   drivers/video/backlight/Kconfig:143:    symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>   drivers/video/fbdev/Kconfig:187:        symbol FB_BACKLIGHT depends on FB
> 
> Unfortunately I have no idea how to resolve it at the moment.
> 
> I suppose I can look further into it if necessary. Or is it okay if I
> leave it at select BACKLIGHT_CLASS_DEVICE for now?

Sigh, leave it as a select then :-(
The "sigh" is not directed at you but the mess this
BACKLIGHT_CLASS_DEVICE is and the limitations of Kconfig.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
