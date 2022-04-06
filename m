Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A14F6A56
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE05310E239;
	Wed,  6 Apr 2022 19:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F19C10E239
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:48:20 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBda-000474-Vz; Wed, 06 Apr 2022 21:48:19 +0200
Message-ID: <032571d2b128c34f5ab6e133653e5370e0d3fd48.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/7] drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:48:18 +0200
In-Reply-To: <20220311170601.50995-6-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-6-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 11.03.2022 um 18:06 +0100 schrieb Marek Vasut:
> Reorder mxsfb_crtc_mode_set_nofb() such that all functions which perform
> register IO are called from one single location in this function. This is
> a clean up. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 14f5cc590a51b..497603964add8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -289,13 +289,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
>  	int err;
>  
> -	/* Mandatory eLCDIF reset as per the Reference Manual */
> -	err = mxsfb_reset_block(mxsfb);
> -	if (err)
> -		return;
> -
> -	mxsfb_set_formats(mxsfb, bus_format);
> -
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
>  		bus_flags = mxsfb->bridge->timings->input_bus_flags;
>  
> @@ -306,6 +299,13 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  			     bus_flags);
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
>  
> +	/* Mandatory eLCDIF reset as per the Reference Manual */
> +	err = mxsfb_reset_block(mxsfb);
> +	if (err)
> +		return;
> +
> +	mxsfb_set_formats(mxsfb, bus_format);
> +
>  	mxsfb_set_mode(mxsfb, bus_flags);
>  }
>  


