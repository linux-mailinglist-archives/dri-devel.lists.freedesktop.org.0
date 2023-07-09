Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F5E74C4E8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 17:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFD810E0E2;
	Sun,  9 Jul 2023 15:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3F10E0E2
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FJqQ5awyoXyoX3BIVPRyesKgV6+6uCkLR3Mc4OaoU84=;
 b=eSiX/YEcFxtUx+On84AYKnyNpT+TifH2BiAHPHVKVOd63WOEaCe1zGfttG5xrx8i83k/bazbcvoZZ
 JrERuAjENNbVYezpfEgnuRB1Q0HrXqUWnuJnF68BHQByP9UOUdITdRii72wp8d65TZTpC9oqz6cr+E
 zyvITrf2W6IV3eMA/QTfcB40MKE9zxp6y9P0hfvU02DTSNGLHp1TIht4z3ph97+mxeu1dgNDPf70V6
 OoipSbsCGJR6PzQmQ+tsVmPrkjIFI367EpcK9wUzo+OXC1nvKGynKdwGGuQhFOeinf/m67pbiDaoh7
 rOk8r3EekwCBdB74o8gn4aKG5980Bpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FJqQ5awyoXyoX3BIVPRyesKgV6+6uCkLR3Mc4OaoU84=;
 b=cLKN9IgMNitpolk/EEVzRoyH8szZDd0WD84jmdMVc8rtMu0xuD7RRaouwGAq8nO7/IGX+3uOV1+uM
 WMl+W2xCQ==
X-HalOne-ID: 727498ed-1e6a-11ee-9850-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 727498ed-1e6a-11ee-9850-b90637070a9d;
 Sun, 09 Jul 2023 15:08:26 +0000 (UTC)
Date: Sun, 9 Jul 2023 17:08:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
Message-ID: <20230709150824.GA697428@ravnborg.org>
References: <20230709135231.449636-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709135231.449636-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Sun, Jul 09, 2023 at 03:52:31PM +0200, Marek Vasut wrote:
> The unprepared_time has to be initialized during probe to probe time
> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
> wait too short time, or no time at all, which would violate the panel
> timing specification. Initializing the unprepared_time() to probe time
> ktime assures the delay is at least what the panel requires from the
> time kernel started. The unprepared_time is then updated every time
> the panel is suspended in panel_simple_suspend() too.
> 
> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next prepare to shorten it")
> Signed-off-by: Marek Vasut <marex@denx.de>

Looks OK,

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It looks like prepared_time is not used anymore.
Could you dig a little into this while you are in the waiting area.

	Sam

> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index d3238088b7f80..37afed67fea7e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -567,6 +567,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  
>  	panel->enabled = false;
>  	panel->prepared_time = 0;
> +	panel->unprepared_time = ktime_get_boottime();
>  	panel->desc = desc;
>  
>  	panel->supply = devm_regulator_get(dev, "power");
> -- 
> 2.40.1
