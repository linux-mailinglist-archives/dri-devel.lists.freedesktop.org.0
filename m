Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E3175F0F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A9D6E52E;
	Mon,  2 Mar 2020 16:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB1F6E52E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 16:01:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D35E9D0;
 Mon,  2 Mar 2020 17:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583164905;
 bh=8xsW9GAR0aM5jgCKtEVOt61W0h7SwaVnM/ckN7MbJKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qr8r2Ktj7KXelyNGWtC/to2sGwhKDEtdoFo80PR1O/jmYLYEffTuv81qeyshUYH3T
 QqJ1IF3L1qpPhjheuw6vM8MGVil2R1hXt9Cm1ZmidXNKxyn9uQvWYN/kfA/dvf837W
 262ZSoS48nk+e4FkoT9Xr2V0tFJzu31ay1LSzKDQ=
Date: Mon, 2 Mar 2020 18:01:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 01/11] drm/bridge: dw-hdmi: set mtmdsclock for deep
 color
Message-ID: <20200302160121.GR11960@pendragon.ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-2-narmstrong@baylibre.com>
 <20200302090527.GB11960@pendragon.ideasonboard.com>
 <a5b6d1f2-8f1c-ae3f-529d-baf7f4cecbe9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5b6d1f2-8f1c-ae3f-529d-baf7f4cecbe9@baylibre.com>
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

Hi Neil,
 
On Mon, Mar 02, 2020 at 04:54:17PM +0100, Neil Armstrong wrote:
> On 02/03/2020 10:05, Laurent Pinchart wrote:
> > On Thu, Feb 06, 2020 at 08:18:24PM +0100, Neil Armstrong wrote:
> >> From: Jonas Karlman <jonas@kwiboo.se>
> >>
> >> Configure the correct mtmdsclock for deep colors to prepare support
> >> for 10, 12 & 16bit output.
> >>
> >> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> index 67fca439bbfb..9e0927d22db6 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> @@ -1818,9 +1818,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
> >>  
> >>  	dev_dbg(hdmi->dev, "final pixclk = %d\n", vmode->mpixelclock);
> > 
> > Nitpicking a bit, I would change
> > 
> > -	vmode->mtmdsclock = vmode->mpixelclock = mode->clock * 1000;
> > +	vmode->mpixelclock = mode->clock * 1000;
> > 
> > above, and here add
> > 
> > 	vmode->mtmdsclock = vmode->mpixelclock;
> > 
> > to keep all mtmdsclock calculation in a single place.
> > 
> >> +	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
> >> +		switch (hdmi_bus_fmt_color_depth(
> >> +				hdmi->hdmi_data.enc_out_bus_format)) {
> >> +		case 16:
> >> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 2;
> > 
> > Both mpixelclock and mtmdsclock are unsigned int. Is the cast to u64
> > needed ?
> > 
> > On a separate but related note, what does the 'm' in tmdsclock stand for
> > ? It seems to originate from the 'm' prefix for mpixelclock, which has
> > been there from the start. Unless there's a good reason for the prefix,
> > renaming mtmdsclock to tmds_clock (and handling the other fields in the
> > hdmi_vmode structure similarly) would increase clarity I think.
> > 
> >> +			break;
> >> +		case 12:
> >> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 3 / 2;
> >> +			break;
> >> +		case 10:
> >> +			vmode->mtmdsclock = (u64)vmode->mpixelclock * 5 / 4;
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >>  	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
> >>  		vmode->mtmdsclock /= 2;
> >>  
> >> +	dev_dbg(hdmi->dev, "final tmdsclk = %d\n", vmode->mtmdsclock);
> > 
> > s/tmdsclk/tmdsclock/ to match the field name ?
> > 
> >> +
> >>  	/* Set up HDMI_FC_INVIDCONF */
> >>  	inv_val = (hdmi->hdmi_data.hdcp_enable ||
> >>  		   (dw_hdmi_support_scdc(hdmi) &&
> > 
> 
> I fixed the calculus and the cast, but I'll rename the mtmdsclock in a following patch.
> 
> is it ok for you ?

Sure, works for me.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
