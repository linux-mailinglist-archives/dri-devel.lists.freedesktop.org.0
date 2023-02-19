Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82D69C02C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Feb 2023 13:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B215110E0EB;
	Sun, 19 Feb 2023 12:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B4110E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Feb 2023 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1676810143; bh=GD1/ZR4At5h6SM6mQDgIMv9bcXFuYgl0QllZHFJhFuA=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=QcF4uatrIQ9ZHKNPdX9+ZZ2KL/OWAuaIBzHBdNcFLX/8V5K6FHn1d21iCfhzZuVuM
 tub66QftMhU/Q6xUR9OnuYZUAVDo29/H35ibK0ouGDugIW7HdzjTDtOPLzTgiJvdLJ
 sRI02t2ecH/dV75NIPJGjii+zV+XftncnTTX9AHI=
Date: Sun, 19 Feb 2023 13:35:42 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix vertical refresh rate of XBD599
Message-ID: <20230219123542.yxb5ixe424ig6ofv@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Frank Oltmanns <frank@oltmanns.dev>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230219114553.288057-1-frank@oltmanns.dev>
 <20230219114553.288057-2-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219114553.288057-2-frank@oltmanns.dev>
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
Cc: Purism Kernel Team <kernel@puri.sm>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 19, 2023 at 12:45:53PM +0100, Frank Oltmanns wrote:
> Fix the XBD599 panel's slight visual stutter by correcting the pixel
> clock speed so that the panel's 60Hz vertical refresh rate is met.
> 
> Set the clock speed using the underlying formula instead of a magic
> number. To have a consistent procedure for both panels, set the JH057N
> panel's clock also as a formula.
>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..cd7d631f7573 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -139,7 +139,7 @@ static const struct drm_display_mode jh057n00900_mode = {
>  	.vsync_start = 1440 + 20,
>  	.vsync_end   = 1440 + 20 + 4,
>  	.vtotal	     = 1440 + 20 + 4 + 12,
> -	.clock	     = 75276,
> +	.clock	     = (720 + 90 + 20 + 20) * (1440 + 20 + 4 + 12) * 60 / 1000,
>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	.width_mm    = 65,
>  	.height_mm   = 130,
> @@ -324,7 +324,7 @@ static const struct drm_display_mode xbd599_mode = {
>  	.vsync_start = 1440 + 18,
>  	.vsync_end   = 1440 + 18 + 10,
>  	.vtotal	     = 1440 + 18 + 10 + 17,
> -	.clock	     = 69000,
> +	.clock	     = (720 + 40 + 40 + 40) * (1440 + 18 + 10 + 17) * 60 / 1000,

As for pinephone, A64 can't produce 74.844 MHz precisely, so this will not work.

Better fix is to alter the mode so that clock can be something the only SoC this
panel is used with can actually produce.

See eg. https://github.com/megous/linux/commit/dd070679d717e7f34af7558563698240a43981a6
which is tested to actually produce 60Hz by measuring the vsync events against
the CPU timer.

Your patch will not produce the intended effect.

kind regards,
	o.

>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	.width_mm    = 68,
>  	.height_mm   = 136,
> -- 
> 2.39.1
> 
