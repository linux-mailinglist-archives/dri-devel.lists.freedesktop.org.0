Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434917568F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0D6E1B2;
	Mon,  2 Mar 2020 09:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFD6E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:05:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1287954A;
 Mon,  2 Mar 2020 10:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583139951;
 bh=VDWAsNeO8Ac3vEXOshs+XlaeJk2oAZMeE+lRCTwjq3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKehywIxMxHb/CCQajH3sguIvjMVZxuTpfxCoiWpcAl17aU8YfSaLfF+U8+h3TENy
 E6EoN2ZT7TPVULNqBPQR5IqLp2vIgwQDMw1X6qqy6LeKRUnf78T24zknkPZJBfgVBT
 Ijz2XzdMkjKEbPcr0tnUmXvYAOy75kpICjkE2ojw=
Date: Mon, 2 Mar 2020 11:05:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep
 color
Message-ID: <20200302090527.GB11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206191834.6125-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil and Jonas,

Thank you for the patch.

On Thu, Feb 06, 2020 at 08:18:24PM +0100, Neil Armstrong wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Configure the correct mtmdsclock for deep colors to prepare support
> for 10, 12 & 16bit output.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 67fca439bbfb..9e0927d22db6 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  
>  	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);

Nitpicking a bit, I would change

-	vmode->mtmdsclock = vmode->mpixelclock = mode->clock * 1000;
+	vmode->mpixelclock = mode->clock * 1000;

above, and here add

	vmode->mtmdsclock = vmode->mpixelclock;

to keep all mtmdsclock calculation in a single place.

> +	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
> +		switch (hdmi_bus_fmt_color_depth(
> +				hdmi->hdmi_data.enc_out_bus_format)) {
> +		case 16:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;

Both mpixelclock and mtmdsclock are unsigned int. Is the cast to u64
needed ?

On a separate but related note, what does the 'm' in tmdsclock stand for
? It seems to originate from the 'm' prefix for mpixelclock, which has
been there from the start. Unless there's a good reason for the prefix,
renaming mtmdsclock to tmds_clock (and handling the other fields in the
hdmi_vmode structure similarly) would increase clarity I think.

> +			break;
> +		case 12:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
> +			break;
> +		case 10:
> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
> +			break;
> +		}
> +	}
> +
>  	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
>  		vmode->mtmdsclock /= 2;
>  
> +	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);

s/tmdsclk/tmdsclock/ to match the field name ?

> +
>  	/* Set up HDMI_FC_INVIDCONF */
>  	inv_val = (hdmi->hdmi_data.hdcp_enable ||
>  		   (dw_hdmi_support_scdc(hdmi) &&

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
