Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8101184367A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 07:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F78D11396F;
	Wed, 31 Jan 2024 06:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A9111396F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 06:15:15 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id C72DB60416;
 Wed, 31 Jan 2024 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1706681704;
 bh=2yPSLwDIVXISiz850jNswuJMbHS4Z6UYnk6bKNxSsGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hiiMiM5OZoROWd6k7SN0rkmCACBj/yZ25OihprOZDTsxfQJAVKRDX5wv9QRB2uGdH
 Pv8yplmE9sewWWTOfW2yB13kUuEujbqnp1pMfLt0RyJtBEizx/KfpnukvN2FX2lv06
 Wh3uSKUJId/u+XENV2YTOI07H8lwC/Hjkdn5gtzmiHcEdKfyX3xfvqKZ8dBpnvuq1Y
 jRA4n/XnEazH12EbMFzyQtJs6NyTz0/C62poin32e9nnB8Qucv2I2P0UHFREMgDsyx
 Zmi2Pm05JoxFfDgNq9VufCPnPpiVin0sYUwuwaecgnpMdPFT5lZzfvJ80zYVhrHIXE
 mJNFfrq1W0E9Q==
Date: Wed, 31 Jan 2024 08:14:09 +0200
From: Tony Lindgren <tony@atomide.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH v2 10/10] drm/bridge: tc358775: Configure hs_rate and
 lp_rate
Message-ID: <20240131061409.GU31612@atomide.com>
References: <20231202075514.44474-11-tony@atomide.com>
 <20231207161352.2634438-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207161352.2634438-1-mwalle@kernel.org>
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org, jernej.skrabec@gmail.com,
 simhavcs@gmail.com, merlijn@wizzup.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se, pavel@ucw.cz,
 mripard@kernel.org, robh+dt@kernel.org, philipp@uvos.xyz,
 neil.armstrong@linaro.org, sre@kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Michael Walle <mwalle@kernel.org> [231207 16:14]:
> > The hs_rate and lp_rate may be used by the dsi host for timing
> > calculations. The tc358775 has a maximum bit rate of 1 Gbps/lane,
> > tc358765 has maximurate of 800 Mbps per lane.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/gpu/drm/bridge/tc358775.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> > --- a/drivers/gpu/drm/bridge/tc358775.c
> > +++ b/drivers/gpu/drm/bridge/tc358775.c
> > @@ -636,6 +636,11 @@ static int tc_attach_host(struct tc_data *tc)
> >  	dsi->format = MIPI_DSI_FMT_RGB888;
> >  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> >  		MIPI_DSI_MODE_LPM;
> > +	if (tc->type == TC358765)
> > +		dsi->hs_rate = 800000000;
> 
> It's not clear to me whether this is the data rate or the frequency. From
> the kernel doc:
> 
>  * @hs_rate: maximum lane frequency for high speed mode in hertz, this should
>  * be set to the real limits of the hardware, zero is only accepted for
>  * legacy drivers
> 
> The tc358775 datasheet lists 1Gbps per lane, which corresponds to a 500MHz DSI
> clock frequency. Not sure how that would correspond to the "maximum lane
> frequency" above. I guess the wording of the comment is just misleading and
> the value is the data rate of the lane.

Yeah seems we're using the data rate of a lane in in hertz and then the
host drivers adapt for the double data rate. Or at least that's my
understanding.. Hopefully we don't have different assumptions in the
host drivers.

> > +	else
> > +		dsi->hs_rate = 1000000000;
> > +	dsi->lp_rate = 10000000;
> 
> That I didn't found in the datasheet. Just a T_min_rx (minimum pulse width
> response) which is 20ns. But there are no more details on this.

I think the low power data rate might be specified in the mipi dsi spec.
Maybe somebody familiar with the spec can confirm it.

Regards,

Tony
