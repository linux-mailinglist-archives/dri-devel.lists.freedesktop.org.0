Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFC9101A1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 12:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B07C10E8A6;
	Thu, 20 Jun 2024 10:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kl8sV+ju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548E710E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 10:42:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E8DC66F;
 Thu, 20 Jun 2024 12:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718880133;
 bh=ti8bxCNiWoqLj57KYwDqhNvEAh/oPERI35OrXACSuro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kl8sV+jutpc7/1rMKSuIsrNDmmORcwUa8Or9bzo/2tHa66VmlpjIS2vqoRj6zdO0B
 I6bsUE+TzhkE3k6iyDCXtMflS38ws49jFcMcHZw/NcCgze9c9sgaTjguWAoSd1l89i
 7lTnvnE4XU7hYrV37s230lxdIP6mZeW6mkiNo99U=
Date: Thu, 20 Jun 2024 13:42:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>, 
 Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH 2/4] drm: ti-sn65dsi86: Check bridge connection failure
Message-ID: <20240620104210.GB27999@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>
 <20240619193258.GC31507@pendragon.ideasonboard.com>
 <404691d2-b013-4bcc-b7e4-bcc809e4bfbb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <404691d2-b013-4bcc-b7e4-bcc809e4bfbb@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 20, 2024 at 09:43:05AM +0300, Tomi Valkeinen wrote:
> On 19/06/2024 22:32, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jun 19, 2024 at 12:22:16PM +0200, Jacopo Mondi wrote:
> >> From: Phong Hoang <phong.hoang.wz@renesas.com>
> >>
> >> Add a check to the register access function when attaching a bridge
> >> device.
> 
> I think the desc is missing the "why". I'm guessing it's the first 
> register access to the IC, and thus verifies that it is accessible.

Isn't it a good idea in general to always check if I2C reads succeeded ?

> >>
> >> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> >> ---
> >>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> index 84698a0b27a8..b7df53577987 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> @@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
> >>   
> >>   static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
> >>   {
> >> +	int ret;
> >>   	int val;
> >>   	struct mipi_dsi_host *host;
> >>   	struct mipi_dsi_device *dsi;
> >> @@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
> >>   
> >>   	/* check if continuous dsi clock is required or not */
> >>   	pm_runtime_get_sync(dev);
> >> -	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> >> +	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> >>   	pm_runtime_put_autosuspend(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>   	if (!(val & DPPLL_CLK_SRC_DSICLK))
> >>   		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> >>   

-- 
Regards,

Laurent Pinchart
