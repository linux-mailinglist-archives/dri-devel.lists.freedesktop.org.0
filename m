Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96515170BDD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 23:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7096E182;
	Wed, 26 Feb 2020 22:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86786E182
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 22:49:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998A9DC3;
 Wed, 26 Feb 2020 23:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582757340;
 bh=pUCuiMmfrdr6LtVX+714AWv8+XPNDyrPgmNrPoRl2wo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SoKOcZZeRJi7s0IC2+vttPG7JOHDBaSrxKETj3pUl12XWPY/EvNWgmBJxnixRAXqe
 PH+m9oY3GFg9PWlV9eYwSDBsWJapOnkH56O+6HBdJCNeeCGLQaOGid+GYAAwdLZgXJ
 8niYJbj6STGZ3IYdcC/twcaSuNoZfFTij0VdYRTg=
Date: Thu, 27 Feb 2020 00:48:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 11/56] drm/omap: dsi: simplify write function
Message-ID: <20200226224839.GI4770@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-12-sebastian.reichel@collabora.com>
 <20200225153105.GJ4764@pendragon.ideasonboard.com>
 <20200226224643.f7gy3maaai7d2hdc@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226224643.f7gy3maaai7d2hdc@earth.universe>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Wed, Feb 26, 2020 at 11:46:43PM +0100, Sebastian Reichel wrote:
> On Tue, Feb 25, 2020 at 05:31:05PM +0200, Laurent Pinchart wrote:
> > > +	if (mipi_dsi_packet_format_is_short(msg->type)) {
> > > +		u16 data = packet.header[1] | (packet.header[2] << 8);
> > > +		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> > 
> > You use the packet for this case only, I think you could simply write
> > 
> > 		u16 data = ((msg->tx_len > 0) ? tx[0] : 0)
> > 			 | (((msg->tx_len > 1) ? tx[1] : 0) << 8);
> > 		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
> 
> That probably works with 's/tx[/((u8*) msg->tx_buf)[', which looks
> really ugly :) This code is further simplified by a further patch,
> which forwards the complete message into dsi_vc_send_short().
> 
> > >  	} else {
> > > -		r = dsi_vc_send_long(dsi, channel,
> > > -				type == DSS_DSI_CONTENT_GENERIC ?
> > > -				MIPI_DSI_GENERIC_LONG_WRITE :
> > > -				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
> > > +		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
> > > +						   msg->tx_buf, msg->tx_len, 0);
> > 
> > Indentation.
> 
> Ok.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Are you fine with keeping the mipi_dsi_packet, since it will be
> removed in a further patch?

Yes, please ignore the comments related to the packet structure, I've
realized when reviewing a patch further in this series that this goes
away (I've mentioned that explicitly in the review of that patch).

> > >  	}
> > >  
> > > -	return r;
> > > -}
> > > -
> > > -static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
> > > -		const u8 *data, int len)
> > > -{
> > > -	struct dsi_data *dsi = to_dsi_data(dssdev);
> > > -
> > > -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> > > -			DSS_DSI_CONTENT_DCS);
> > > -}
> > > -
> > > -static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
> > > -		const u8 *data, int len)
> > > -{
> > > -	struct dsi_data *dsi = to_dsi_data(dssdev);
> > > -
> > > -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> > > -			DSS_DSI_CONTENT_GENERIC);
> > > -}
> > > -
> > > -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> > > -			       int channel, const u8 *data, int len,
> > > -			       enum dss_dsi_content_type type)
> > > -{
> > > -	struct dsi_data *dsi = to_dsi_data(dssdev);
> > > -	int r;
> > > +	if (r < 0)
> > > +		return r;
> > >  
> > > -	r = dsi_vc_write_nosync_common(dsi, channel, data, len, type);
> > > -	if (r)
> > > -		goto err;
> > > +	/*
> > > +	 * we do not always have to do the BTA sync, for example we can
> > > +	 * improve performance by setting the update window information
> > > +	 * without sending BTA sync between the commands. In that case
> > > +	 * we can return earily.
> > 
> > s/earily/early/
> > 
> > Do I understand correctly that this isn't implemented yet ? You should
> > make it clear in the comment that it's a candidate for a future
> > optimization.
> 
> Yes. I forgot the TODO keyword for some reason. Has been quite some
> time since I wrote this patch :) I fixed the earily and prefixed the
> message with TODO.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
