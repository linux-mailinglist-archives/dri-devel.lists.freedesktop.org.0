Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8B17712E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEBD6EA21;
	Tue,  3 Mar 2020 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs8.siol.net [185.57.226.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7886E271
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 12:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 01DE15230B1;
 Mon,  2 Mar 2020 13:45:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id L-mXkFixs0XB; Mon,  2 Mar 2020 13:45:45 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 89B175242A5;
 Mon,  2 Mar 2020 13:45:45 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 970E85230B1;
 Mon,  2 Mar 2020 13:45:44 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/4] drm/bridge: dw-hdmi: Fix color space conversion
 detection
Date: Mon, 02 Mar 2020 13:45:44 +0100
Message-ID: <4602894.0VBMTVartN@jernej-laptop>
In-Reply-To: <20200302092748.GE11960@pendragon.ideasonboard.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-3-jernej.skrabec@siol.net>
 <20200302092748.GE11960@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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

Dne ponedeljek, 02. marec 2020 ob 10:27:48 CET je Laurent Pinchart napisal(a):
> Hi Jernej,
> 
> Thank you for the patch.
> 
> On Sat, Feb 29, 2020 at 05:30:41PM +0100, Jernej Skrabec wrote:
> > Currently, is_color_space_conversion() compares not only color spaces
> > but also formats. For example, function would return true if YCbCr 4:4:4
> > and YCbCr 4:2:2 would be set. Obviously in that case color spaces are
> > the same.
> > 
> > Fix that by comparing if both values represent RGB color space.
> > 
> > Fixes: b21f4b658df8 ("drm: imx: imx-hdmi: move imx-hdmi to
> > bridge/dw_hdmi")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> This isn't implemented today, but could the CSC be used to convert
> between different YCbCr encodings ?

Yes, CSC offers great flexibility, but unfortunately that also means that you 
have as much CSC matrices as there is possible conversions. This explodes 
quickly, especially if you convert from one YCbCr encoding to another (BT.601, 
BT.709, BT.2020) and also considering range (full, limited). If you don't mind 
doing some calculations in code, this becames much simpler, but doing fixed 
point arithmetic isn't fun. Is floating point arithmetic allowed in kernel?

I wrote a simple program to produce all those CSC matrices for sun4i-drm 
driver: http://ix.io/2dak Note that it's for RGB <-> YUV conversion, but DW 
HDMI has a bit different order. I believe it's GRB, but I'm not 100% sure.

You can also do various color adjustements, like brigthness, but that would 
also mean that you have to multiply all matrices to get final one which you can 
then write into registers.

Best regards,
Jernej

> 
> In any case the patch is correct based on the current implementation, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> > 24965e53d351..9d7bfb1cb213 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -956,7 +956,8 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
> > 
> >  static int is_color_space_conversion(struct dw_hdmi *hdmi)
> >  {
> > 
> > -	return hdmi->hdmi_data.enc_in_bus_format !=
> > hdmi->hdmi_data.enc_out_bus_format; +	return
> > hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) !=
> > +		hdmi_bus_fmt_is_rgb(hdmi-
>hdmi_data.enc_out_bus_format);
> > 
> >  }
> >  
> >  static int is_color_space_decimation(struct dw_hdmi *hdmi)




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
