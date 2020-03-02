Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70EA175707
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35C26E1E9;
	Mon,  2 Mar 2020 09:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3D6E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:28:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 178FE54A;
 Mon,  2 Mar 2020 10:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583141292;
 bh=9ZqrQgN1kicNCFdvQnafSQx8lmmfNjFur/cYDbP3rDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skswSqAQuA8w3fEw57iweTsG5i9uxgyuyyKNg3OiEsiYEb0M3CjsQQczW9udnAGEr
 T2HSEz9s35KdPJUtHRFZ5Wm2YwCWHcLEITfyn+nNW7CqkZe5EGYbEb/hiEAjsId6bv
 HuOSO3bAcOeA8l0Ibo4SK095T1jkIsyXt2Q/ZZ08=
Date: Mon, 2 Mar 2020 11:27:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 2/4] drm/bridge: dw-hdmi: Fix color space conversion
 detection
Message-ID: <20200302092748.GE11960@pendragon.ideasonboard.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229163043.158262-3-jernej.skrabec@siol.net>
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

On Sat, Feb 29, 2020 at 05:30:41PM +0100, Jernej Skrabec wrote:
> Currently, is_color_space_conversion() compares not only color spaces
> but also formats. For example, function would return true if YCbCr 4:4:4
> and YCbCr 4:2:2 would be set. Obviously in that case color spaces are
> the same.
> 
> Fix that by comparing if both values represent RGB color space.
> 
> Fixes: b21f4b658df8 ("drm: imx: imx-hdmi: move imx-hdmi to bridge/dw_hdmi")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

This isn't implemented today, but could the CSC be used to convert
between different YCbCr encodings ?

In any case the patch is correct based on the current implementation, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 24965e53d351..9d7bfb1cb213 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -956,7 +956,8 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
>  
>  static int is_color_space_conversion(struct dw_hdmi *hdmi)
>  {
> -	return hdmi->hdmi_data.enc_in_bus_format != hdmi->hdmi_data.enc_out_bus_format;
> +	return hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) !=
> +		hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format);
>  }
>  
>  static int is_color_space_decimation(struct dw_hdmi *hdmi)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
