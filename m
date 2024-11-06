Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A909BEE6E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D255E10E6E2;
	Wed,  6 Nov 2024 13:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YpcLQYW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660D10E6E2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:17:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93DAA475;
 Wed,  6 Nov 2024 14:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730899049;
 bh=WYVykGgIGWOZakRTXDQpTktNipc2LJjx08BB+EWVg18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YpcLQYW9ZGo2RrRHelMkVOI0dVW0NEdHFn7+fSkfhem+XpEQVQ1PPtsF2pmCmbLvJ
 NGANXu00iNoF3Zu+bPWuWtXugx41qCAfQMfVCFbXxWxEu7MPHY1MkcVaXaJIeiw8QI
 gLM3t9nzYcFpgMYonmEPmxJfHllv1yqa6B/QR8/Q=
Date: Wed, 6 Nov 2024 15:17:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Archit Taneja <architt@codeaurora.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Hien Huynh <hien.huynh.px@renesas.com>
Subject: Re: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in
 clock_div_by_lanes
Message-ID: <20241106131731.GG9369@pendragon.ideasonboard.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
 <20241105160612.GC6317@pendragon.ideasonboard.com>
 <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134619B30EB1894710AB669D86532@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

On Wed, Nov 06, 2024 at 10:20:43AM +0000, Biju Das wrote:
> Hi Laurent Pinchart,
> 
> Thanks for the feedback.
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 05 November 2024 16:06
> > Subject: Re: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 05, 2024 at 11:12:19AM +0000, Biju Das wrote:
> > > Fix out-of-bounds array in adv7511_dsi_config_timing_gen(), when dsi
> > > lanes = 1.
> > 
> > Does the hardware support using the internal timing generator with a single lane ? If so
> 
> As per the binding documentation [1], ADV7535 supports single lane.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml?h=next-20241106
> 
> > adv7511_dsi_config_timing_gen() should be fixed, otherwise that should be explained in the commit
> 
> On RZ/G2L SMARC EVK platform, lanes=2,3,4 works ok, But with setting lanes=1, video is unstable
> by trying with clock_divider as 6,7 and 8 by updating the array and also disabling internal timing generator.

Is that an issue specific to that board, or to the chip in general ? If
it's specific to the board, disabling 1 lane usage for everybody in the
driver isn't the right option.

> > message, and mentioned with a comment in adv7533_parse_dt(). I would also print an error message in
> > that case.
> 
> OK, this can be done.
> 
> > If the internal timing generator can't be used with a single lane, the DT bindings should also be
> > updated to document that.
> 
> Even single lane with or without internal timing generator does not work on RZ/G2L.
> 
> So, any users of ADV 7535 tested single lane??
> 
> > > Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing
> > > generator")
> > > Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Changes in v2:
> > >  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
> > >  - Dropped Archit Taneja invalid Mail address
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > index 3e57ba838e5e..0c2236e53af5 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> > > @@ -185,6 +185,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
> > >  	adv->use_timing_gen = !of_property_read_bool(np,
> > >  						"adi,disable-timing-generator");
> > >
> > > +	if (adv->use_timing_gen && num_lanes == 1)
> > > +		return -EINVAL;
> > > +
> > >  	/* TODO: Check if these need to be parsed by DT or not */
> > >  	adv->rgb = true;
> > >  	adv->embedded_sync = false;

-- 
Regards,

Laurent Pinchart
