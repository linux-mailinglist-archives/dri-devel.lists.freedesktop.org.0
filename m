Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DC9619FA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 00:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E7D10E0F5;
	Tue, 27 Aug 2024 22:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i6iqha0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D341910E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 22:22:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45E752C5;
 Wed, 28 Aug 2024 00:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724797294;
 bh=SixS31ES6MC72vAm06llo73TN+cIQRGrpwDlBT2Pmj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i6iqha0J+jsw936j+ioeawc6Cy96uNgyYyiKomQX4IsJT/RGcJLtaP+6qzbndudnw
 9VIcLliiN0NiDdhKFi8l4mh7p+reFcn+rwfN3lZvUcUBREm9Mc0wCgWHSnKVhumKiE
 QR7OQCDgRuI0dgWF7Bj1w6jdoCgIRoJkW0E/tCf4=
Date: Wed, 28 Aug 2024 01:22:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Message-ID: <20240827222237.GH30398@pendragon.ideasonboard.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
 <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

Hi Biju,

On Tue, Aug 27, 2024 at 04:43:12PM +0000, Biju Das wrote:
> Hi Laurent and Tomi,
> 
> Gentle ping. Are you happy with this patch?

I've sent a pull request last Friday, see
https://lore.kernel.org/r/20240822234445.GA23541@pendragon.ideasonboard.com

> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Monday, December 18, 2023 10:39 AM
> > Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Nov 16, 2023 at 12:24:24PM +0000, Biju Das wrote:
> > > The rcar_du_vsps_init() doesn't free the np allocated by
> > > of_parse_phandle_with_fixed_args() for the non-error case.
> > >
> > > Fix memory leak for the non-error case.
> > >
> > > While at it, replace the label 'error'->'done' as it applies to
> > > non-error case as well and update the error check condition for
> > > rcar_du_vsp_init() to avoid breakage in future, if it returns positive value.
> > >
> > > Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the
> > > same VSP")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > > ---
> > > v1->v2:
> > >  * Replaced the label 'error'->'done' as it applies to non-error case as
> > >    well.
> > >  * Update the error check condition for rcar_du_vsp_init() to avoid
> > >    breakage in future, if it returns positive value.
> > > ---
> > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > index 70d8ad065bfa..4c8fe83dd610 100644
> > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > >  		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
> > >  						       cells, i, &args);
> > >  		if (ret < 0)
> > > -			goto error;
> > > +			goto done;
> > >
> > >  		/*
> > >  		 * Add the VSP to the list or update the corresponding existing @@
> > > -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > >  		vsp->dev = rcdu;
> > >
> > >  		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> > > -		if (ret < 0)
> > > -			goto error;
> > > +		if (ret)
> > > +			goto done;
> > >  	}
> > >
> > > -	return 0;
> > > -
> > > -error:
> > > +done:
> > >  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
> > >  		of_node_put(vsps[i].np);
> > >

-- 
Regards,

Laurent Pinchart
