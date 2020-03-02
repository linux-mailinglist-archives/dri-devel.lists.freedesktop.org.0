Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D6177106
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1CC6E9FB;
	Tue,  3 Mar 2020 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs42.siol.net [185.57.226.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0712789DB4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 09:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id B64A852352B;
 Mon,  2 Mar 2020 10:46:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id LKSd7f3jTVIM; Mon,  2 Mar 2020 10:46:50 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 5AE61523492;
 Mon,  2 Mar 2020 10:46:50 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 7D37A52319A;
 Mon,  2 Mar 2020 10:46:49 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: a.hajda@samsung.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/4] drm/bridge: dw-hdmi: Fix color space conversion
 detection
Date: Mon, 02 Mar 2020 10:46:49 +0100
Message-ID: <791571909.0ifERbkFSE@jernej-laptop>
In-Reply-To: <c1cbcdc0-61a7-e5cb-4ad0-7057c33da154@baylibre.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-3-jernej.skrabec@siol.net>
 <c1cbcdc0-61a7-e5cb-4ad0-7057c33da154@baylibre.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil!

Dne ponedeljek, 02. marec 2020 ob 10:26:09 CET je Neil Armstrong napisal(a):
> Hi Jernej,
> 
> On 29/02/2020 17:30, Jernej Skrabec wrote:
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
> 
> I think in this case you should also fix the CEC enablement to:

you mean CSC, right?

> if (is_color_space_conversion(hdmi) || is_color_space_decimation(hdmi))
> 
> in dw_hdmi_enable_video_path() otherwise CSC won't be enabled and will be
> bypassed in decimation case only.
> 

Missed that one. I'll fix in v2.

Best regards,
Jernej



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
