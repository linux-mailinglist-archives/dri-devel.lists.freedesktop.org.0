Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C22167BB7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586046F3F6;
	Fri, 21 Feb 2020 11:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120906E262
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 11:05:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F03F2AE17;
 Fri, 21 Feb 2020 11:05:43 +0000 (UTC)
Date: Fri, 21 Feb 2020 12:05:41 +0100
From: Torsten Duwe <duwe@suse.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/6] drm/bridge: anx6345: Fix getting anx6345 regulators
Message-ID: <20200221110541.GA28948@suse.de>
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-2-anarsoul@gmail.com>
 <fc4ed2c4-ae5f-cd67-1c8a-c17e1cb63423@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc4ed2c4-ae5f-cd67-1c8a-c17e1cb63423@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>, Stephan Gerhold <stephan@gerhold.net>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 09:32:01AM +0100, Neil Armstrong wrote:
> On 20/02/2020 09:35, Vasily Khoruzhick wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > We don't need to pass '-supply' suffix to devm_get_regulator()
> > 
> > Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 56f55c53abfd..0d8d083b0207 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -712,14 +712,14 @@ static int anx6345_i2c_probe(struct i2c_client *client,
> >  		DRM_DEBUG("No panel found\n");
> >  
> >  	/* 1.2V digital core power regulator  */
> > -	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12-supply");
> > +	anx6345->dvdd12 = devm_regulator_get(dev, "dvdd12");
> >  	if (IS_ERR(anx6345->dvdd12)) {
> >  		DRM_ERROR("dvdd12-supply not found\n");
> >  		return PTR_ERR(anx6345->dvdd12);
> >  	}
> >  
> >  	/* 2.5V digital core power regulator  */
> > -	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25-supply");
> > +	anx6345->dvdd25 = devm_regulator_get(dev, "dvdd25");
> >  	if (IS_ERR(anx6345->dvdd25)) {
> >  		DRM_ERROR("dvdd25-supply not found\n");
> >  		return PTR_ERR(anx6345->dvdd25);
> > 
> 
> This is a duplicate of "drm/bridge: analogix-anx6345: Avoid duplicate -supply suffix" (20200218155440.BEFB968C65@verein.lst.de)
> 
> But this one has fixes and review from laurent, so I'll push this one when the serie is ready

I really don't mind, as long as it gets fixed.
The change is pretty obvious when you look at commit 69511a452e6dc.

Signed-off-by: Torsten Duwe <duwe@suse.de>
Reviewed-by: Mark Brown <broonie@kernel.org>
(broonie had replied to my submission back in November)

There's one other fix required for the anx6345 and, while at it,
I had also fixed the code I copied in that hurry as well. 
What about these? All 3 fixes can go in independently, so I wouldn't
tie them to this series.

	Torsten

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
