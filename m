Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7C1756D8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1436E185;
	Mon,  2 Mar 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD406E185
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:21:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6E8054A;
 Mon,  2 Mar 2020 10:21:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583140909;
 bh=8sq1wDdWf+IVF9oWteFhFDTlL94c/C1RhHDt8Q2EhfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OoC7vyuscxZDXqoEVaQGvn9gvbAyD6h838LS8clufvzeozKixYdGRw7UItBlKPtZ9
 NDFyfW1oHzTXMajaI3mWvg4qdNBz9fSu1M5yDCA1tCILZy2ywcAB+z5Jf9CSoZaluh
 FZQbY2dC1sPD0sDcw0mYh4Gp6eo/zMFnnHKzzXVY=
Date: Mon, 2 Mar 2020 11:21:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: fix AVI frame colorimetry
Message-ID: <20200302092124.GD11960@pendragon.ideasonboard.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229163043.158262-2-jernej.skrabec@siol.net>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

Thank you for the patch.

On Sat, Feb 29, 2020 at 05:30:40PM +0100, Jernej Skrabec wrote:
> CTA-861-F explicitly states that for RGB colorspace colorimetry should
> be set to "none". Fix that.
> 
> Fixes: def23aa7e982 ("drm: bridge: dw-hdmi: Switch to V4L bus format and encodings")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 46 +++++++++++++----------
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 67fca439bbfb..24965e53d351 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1624,28 +1624,34 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>  		frame.colorspace = HDMI_COLORSPACE_RGB;
>  
>  	/* Set up colorimetry */
> -	switch (hdmi->hdmi_data.enc_out_encoding) {
> -	case V4L2_YCBCR_ENC_601:
> -		if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV601)
> -			frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
> -		else
> +	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> +		switch (hdmi->hdmi_data.enc_out_encoding) {
> +		case V4L2_YCBCR_ENC_601:
> +			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV601)
> +				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
> +			else
> +				frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
> +			frame.extended_colorimetry =
> +					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
> +			break;
> +		case V4L2_YCBCR_ENC_709:
> +			if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV709)
> +				frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
> +			else
> +				frame.colorimetry = HDMI_COLORIMETRY_ITU_709;
> +			frame.extended_colorimetry =
> +					HDMI_EXTENDED_COLORIMETRY_XV_YCC_709;
> +			break;
> +		default: /* Carries no data */
>  			frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
> +			frame.extended_colorimetry =
> +					HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
> +			break;
> +		}
> +	} else {
> +		frame.colorimetry = HDMI_COLORIMETRY_NONE;
>  		frame.extended_colorimetry =
> -				HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
> -		break;
> -	case V4L2_YCBCR_ENC_709:
> -		if (hdmi->hdmi_data.enc_in_encoding == V4L2_YCBCR_ENC_XV709)
> -			frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
> -		else
> -			frame.colorimetry = HDMI_COLORIMETRY_ITU_709;
> -		frame.extended_colorimetry =
> -				HDMI_EXTENDED_COLORIMETRY_XV_YCC_709;
> -		break;
> -	default: /* Carries no data */
> -		frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
> -		frame.extended_colorimetry =
> -				HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
> -		break;
> +			HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
>  	}
>  
>  	frame.scan_mode = HDMI_SCAN_MODE_NONE;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
