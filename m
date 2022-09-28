Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1835ED1CB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E162E10E212;
	Wed, 28 Sep 2022 00:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB7910E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:22:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0622347C;
 Wed, 28 Sep 2022 02:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664324544;
 bh=sEc3YaOxBbtODDIhskmqPZsgNW+rSjuavbF2jjSqFyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsIgkTCXT74uDVNr5BqUm507zT0bp/YfMfWhMawBNfqTMcmOJID6mPgsvpE0htiMX
 GPVFg97KBbdVxEDZ3zB4DlLo77fIRsBhusvf2W174kCbVKzJDmK+gqE6l40hgk7Tsc
 I9bHJV/h5TzkJOFp7+tnEMGxl3zy2cjjvcB5AzM8=
Date: Wed, 28 Sep 2022 03:22:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/4] drm: lcdif: Add support for YUV planes
Message-ID: <YzOTvttVIclavVO9@pendragon.ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-5-laurent.pinchart@ideasonboard.com>
 <594e0470-f0b0-8c46-edb9-163bbcb5ecf1@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <594e0470-f0b0-8c46-edb9-163bbcb5ecf1@denx.de>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 02:16:54AM +0200, Marek Vasut wrote:
> On 9/28/22 01:38, Laurent Pinchart wrote:
> 
> Hi,
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index ba84b51598b3..a97a5f512aae 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> 
> [...]
> 
> > @@ -37,9 +38,10 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> >   {
> >   	struct drm_device *drm = lcdif->drm;
> >   	const u32 format = lcdif->crtc.primary->state->fb->format->format;
> > +	bool in_yuv = false;
> > +	bool out_yuv = false;
> >   
> > -	writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> > -
> > +	/* HDMI output */
> 
> Should this comment really be here ? The IP can be connected to either 
> LVDS serializer/DSI bridge/HDMI , it is not just HDMI output IP.

You're right, I'll drop the comment.

> >   	switch (bus_format) {
> >   	case MEDIA_BUS_FMT_RGB565_1X16:
> >   		writel(DISP_PARA_LINE_PATTERN_RGB565,
> 
> [...]
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

-- 
Regards,

Laurent Pinchart
