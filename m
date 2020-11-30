Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6C2C8150
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 10:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5666E43C;
	Mon, 30 Nov 2020 09:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0BA6E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 09:46:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F2CA538;
 Mon, 30 Nov 2020 10:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606729585;
 bh=iWSpmOaRT8F5jWtp2Vpx9N0hysxNESH6Ll8Ha77TGpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BiQ8jnkhSU5qplMMA/CX/6vg/ImWQCVrZ0YyYviMSJrIJZhVLlkT8NeAzGNg/NmxP
 l3+2YtCDQpgGhwUcT8WFAlVHjw08+K5QCzUHWVPkZ6zNscl+GQe1p1qf+auOL8ucNg
 HlLLddK4IZ+CdKJ62LEtJVFyRtcMdTJMjtxhgZks=
Date: Mon, 30 Nov 2020 11:46:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH v3 4/6] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201130094617.GE4141@pendragon.ideasonboard.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
 <20201119160134.9244-5-nikhil.nd@ti.com>
 <a36967dc-ca5f-d231-198b-1153c9720d65@ti.com>
 <20201130063503.phivehin7l2cx53j@NiksLab>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130063503.phivehin7l2cx53j@NiksLab>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

On Mon, Nov 30, 2020 at 12:05:03PM +0530, Nikhil Devshatwar wrote:
> On 14:51-20201125, Tomi Valkeinen wrote:
> > On 19/11/2020 18:01, Nikhil Devshatwar wrote:
> > > Remove the old code to iterate over the bridge chain, as this is
> > > already done by the framework.
> > > The bridge state should have the negotiated bus format and flags.
> > > Use these from the bridge's state.
> > > If the bridge does not support format negotiation, error out
> > > and fail.
> > > 
> > > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > ---
> > > 
> > > Notes:
> > >     changes from v2:
> > >     * Remove the old code and use the flags from the bridge state
> > > 
> > >  drivers/gpu/drm/tidss/tidss_encoder.c | 36 +++++++++++----------------
> > >  1 file changed, 14 insertions(+), 22 deletions(-)
> > 
> > If a first bridge (after the crtc) supports two bus formats as input, how does tidss choose between
> > those? This patch just picks bstate->input_bus_cfg.format, and it's not clear to me which one that
> > is (the first one?). Also, we don't check if tidss actually supports the bus format.
> 
> The selection is done by the framework in
> select_bus_fmt_recursive at drivers/gpu/drm/drm_bridge.c:810
> 
> My understanding is that currently, the format negotiation logic does
> not negotiate all the way till encoder, it stops only at the
> first_bridge.

Should we then implement a bridge in the tidss driver to model the
internal encoder, in order to support format negotiation all the way to
the tidss ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
