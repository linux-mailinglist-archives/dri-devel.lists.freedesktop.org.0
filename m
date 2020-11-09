Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE772AB750
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2F899A5;
	Mon,  9 Nov 2020 11:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F64899A5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:40:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9Be8hw114928;
 Mon, 9 Nov 2020 05:40:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604922008;
 bh=XsNckVeqM0iVXm5ZeK+c16im4dZunwYK3ppg7ea+AWc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZPdhIoOlcCnbUxvQPq3zYNQ66VrnD78Mf8UnxpKPk/w7st39j1ff06WaN8W3hLUuF
 DvmmwqX+YzimKgmTuZwZL7Y1SRrxKMgrnZVae8FaMS4PJmmdbeZGtjW8aGQxIlK+zs
 4RuTA2uT5vKQYxILDdF+sWYMbReI92Ghs2oxP09I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9Be7vQ050691
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 05:40:07 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 05:40:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 05:40:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9Be6n3069932;
 Mon, 9 Nov 2020 05:40:07 -0600
Date: Mon, 9 Nov 2020 17:10:05 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/5] drm/tidss: Set bus_format correctly from
 bridge/connector
Message-ID: <20201109114005.4q4km5if775dfqtd@NiksLab>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-3-nikhil.nd@ti.com>
 <20201029225730.GK15024@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029225730.GK15024@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 00:57-20201030, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Fri, Oct 16, 2020 at 04:09:14PM +0530, Nikhil Devshatwar wrote:
> > When there is a chain of bridges attached to the encoder,
> > the bus_format should be ideally set from the input format of the
> > first bridge in the chain.
> > 
> > Use the bridge state to get the negotiated bus_format.
> > If the bridge does not support format negotiation, error out
> > and fail.
> > 
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> >  drivers/gpu/drm/tidss/tidss_encoder.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> > index e278a9c89476..ae7f134754b7 100644
> > --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> > +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> > @@ -22,6 +22,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> >  	struct drm_device *ddev = encoder->dev;
> >  	struct tidss_crtc_state *tcrtc_state = to_tidss_crtc_state(crtc_state);
> >  	struct drm_display_info *di = &conn_state->connector->display_info;
> > +	struct drm_bridge_state *bstate;
> >  	struct drm_bridge *bridge;
> >  	bool bus_flags_set = false;
> >  
> > @@ -41,14 +42,19 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> >  		break;
> >  	}
> >  
> > -	if (!di->bus_formats || di->num_bus_formats == 0)  {
> > -		dev_err(ddev->dev, "%s: No bus_formats in connected display\n",
> > -			__func__);
> > +	/* Copy the bus_format from the input_bus_format of first bridge */
> > +	bridge = drm_bridge_chain_get_first_bridge(encoder);
> > +	bstate = drm_atomic_get_new_bridge_state(crtc_state->state, bridge);
> > +	if (bstate)
> > +		tcrtc_state->bus_format = bstate->input_bus_cfg.format;
> > +
> > +	if (tcrtc_state->bus_format == 0 ||
> > +	    tcrtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> > +
> > +		dev_err(ddev->dev, "Bridge connected to the encoder did not specify media bus format\n");
> >  		return -EINVAL;
> >  	}
> >  
> > -	// XXX any cleaner way to set bus format and flags?
> > -	tcrtc_state->bus_format = di->bus_formats[0];
> >  	if (!bus_flags_set)
> >  		tcrtc_state->bus_flags = di->bus_flags;
> 
> Shouldn't the flags also be retrieved from the bridge state ?

Yes, the code does that above, not covered in the diff context.
When no bridges have reported the timings,
it uses the display_info as fallback (when bus_flags_set is false)

Nikhil D

> 
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
