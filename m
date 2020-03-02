Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94D175747
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80296E201;
	Mon,  2 Mar 2020 09:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D206E201
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:37:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00E6E54A;
 Mon,  2 Mar 2020 10:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583141872;
 bh=JaiLwKwLjbPQuu84TSj6iCTI4JbyTTiFDByTAxo6at0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwlhJHtIEgnNQ53Hmp8isgrboXULKcbj4DthZ127fTLcRs2IRyEnA43pDcWOLmgtX
 0/3jRu7JSVq7+lldyxuk8/en/DJHOCMYAPkF/hQ/scvzhICy2dRofuOsoAFgfc+3tR
 bkynMlVN6FWoRhsTQj2kz0BCydMkSLjWhS6RW+gw=
Date: Mon, 2 Mar 2020 11:37:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 3/4] drm/bridge: dw-hdmi: do not force "none" scan mode
Message-ID: <20200302093728.GF11960@pendragon.ideasonboard.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-4-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200229163043.158262-4-jernej.skrabec@siol.net>
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

Hi Jernej and Jonas,

Thank you for the patch.

On Sat, Feb 29, 2020 at 05:30:42PM +0100, Jernej Skrabec wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> Setting scan mode to "none" confuses some TVs like LG B8, which randomly
> change overscan procentage over time. Digital outputs like HDMI and DVI,

s/procentage/percentage/ ?

> handled by this controller, don't really need overscan, so we can always
> set scan mode to underscan. Actually, this is exactly what
> drm_hdmi_avi_infoframe_from_display_mode() already does, so we can just
> remove offending line.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> [updated commit message]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 9d7bfb1cb213..3d6021119942 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1655,8 +1655,6 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>  			HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
>  	}
>  
> -	frame.scan_mode = HDMI_SCAN_MODE_NONE;
> -
>  	/*
>  	 * The Designware IP uses a different byte format from standard
>  	 * AVI info frames, though generally the bits are in the correct

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
