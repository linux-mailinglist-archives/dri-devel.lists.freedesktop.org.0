Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208038FB132
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 13:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7547110E45A;
	Tue,  4 Jun 2024 11:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="jYGdIGar";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bsm0jv1Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E40010E45A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 11:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717500946; x=1749036946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3q7MLcj9GcbD4J+57e7qMPOyqdvIK2K39I8BzcG+LlE=;
 b=jYGdIGarHtosEp6jZlkqaWQEjUI1rBgQ2VLWEvwe7ndzJf4jYQz44Obo
 ShpDUDm9S6gOai4maczg8ABDj71+IxTenZJtJbkfHQzZETRPbqyE6NaZm
 dowwGrcVTCHAlqPe+q5JljLWxApNspmMVHNPCxs1icmtnd0sYECPd9K+H
 s44xcFs8XGBximqUxOVRid2fOi+eZU+VnNSjYtmbjrsavsBDFSKq9XYYQ
 9EVkrEryaZvWbQc4D7iZnratD4NpO8qYzJdHU3O0zYXEzwegfLdxzV12s
 7/Tuh6nDEvSpahmAskNPr0mWemfwsCTB2nDxapF/5YiZ1pZnq0QNblEx7 g==;
X-CSE-ConnectionGUID: q+6LRtM7RQuGSHYmMbFHiQ==
X-CSE-MsgGUID: 9Y5THY5dQ0uQ1vYzZWVP0g==
X-IronPort-AV: E=Sophos;i="6.08,213,1712613600"; d="scan'208";a="37211753"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Jun 2024 13:35:44 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1777E161583; Tue,  4 Jun 2024 13:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717500939;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3q7MLcj9GcbD4J+57e7qMPOyqdvIK2K39I8BzcG+LlE=;
 b=Bsm0jv1QRzrhp6UVNWsR76oZjRKJNGoGucQLZhuGwzVWsBqP7tQQJoM78blZ7oPu64jfEJ
 titZbbp5m73yIjqL5QFKZ24MPm1rtCbuyS/X6F1UxaezvPkWXyF2sgRJqe3frZmnLX+Gcc
 fdLfndOwtGbmUsQHzAdHQz8eBAtCEpfizwh3BKh7SuLkwfIfbmBHX7Pd03s1zUNKiMCRc5
 re0dtg4WjsDRiPmHYPCjAcp8mvv56OXMsIVxaMhou6LjONDKu9pEFpJPllTd+hUpJj26Jp
 NnjcJ+Qm6KeQ7rz5RQ2aIK7H9lq9yOwX3f6CexRW1LyEMQmWzJc12aebCP42ZQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com
Subject: Re: [PATCH 2/6] drm/bridge: tc358767: Use tc_pxl_pll_calc() to
 correct adjusted_mode clock
Date: Tue, 04 Jun 2024 13:35:38 +0200
Message-ID: <3228734.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7989cb19-7735-4e38-8187-68a31fff7a5b@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <1891607.tdWV9SEqCh@steina-w> <7989cb19-7735-4e38-8187-68a31fff7a5b@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

Am Montag, 3. Juni 2024, 23:27:34 CEST schrieb Marek Vasut:
> On 6/3/24 2:45 PM, Alexander Stein wrote:
>=20
> Hi,
>=20
> >> @@ -1631,6 +1643,18 @@ static int tc_edp_atomic_check(struct drm_bridg=
e *bridge,
> >>   			       struct drm_crtc_state *crtc_state,
> >>   			       struct drm_connector_state *conn_state)
> >>   {
> >> +	struct tc_data *tc =3D bridge_to_tc(bridge);
> >> +	int adjusted_clock =3D 0;
> >> +	int ret;
> >> +
> >> +	ret =3D tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> >> +			      crtc_state->adjusted_mode.clock * 1000,
> >> +			      &adjusted_clock, NULL);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	crtc_state->adjusted_mode.clock =3D adjusted_clock / 1000;
> >=20
> > This is prone to rounding errors. Debug output in my case:
> >> [   16.007127] tc358767 1-000f: enable video stream
> >> [   16.007148] tc358767 1-000f: PLL: requested 148500000 pixelclock, r=
ef 26000000
> >> [   16.007163] tc358767 1-000f: PLL: got 147333333, delta -1166667
> >> [   16.007169] tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
> >> [   16.027112] tc358767 1-000f: set mode 1920x1080
> >> [   16.027138] tc358767 1-000f: H margin 148,88 sync 44
> >> [   16.027144] tc358767 1-000f: V margin 36,4 sync 5
> >> [   16.027150] tc358767 1-000f: total: 2200x1125
> >> [   16.059426] tc358767 1-000f: PLL: requested 147333000 pixelclock, r=
ef 26000000
> >> [   16.059455] tc358767 1-000f: PLL: got 146250000, delta -1083000
> >> [   16.059461] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> >> [   16.095724] tc358767 1-000f: PLL: requested 146250000 pixelclock, r=
ef 26000000
> >> [   16.095739] tc358767 1-000f: PLL: got 146250000, delta 0
> >> [   16.095745] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> >=20
> > The accuracy degrades with each call, until a full kHz frequency is rea=
ched,
> > because drm_display_mode.clock only accounts for kHz, but the PLL
> > calculation takes Hz into account.
>=20
> Hmmmmm, I need to take a closer look at this one.
>=20
> Do you have any quick hints ?

No, sorry. I'm not sure about those VFIFO overruns/underruns you mentioned
in the commit message. Does this maybe only apply to DPI input?
At least for 148.5MHz (1080p) apparently it is not possible to that
exact clock anyway.

> > BTW: Which platform are you testing on?
>=20
> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
>=20
> The TC9595 is 2nd generation (automotive?) replacement for TC358767 (1st=
=20
> generation replacement is TC358867) .

Same here. But fail to get output on a DP monitor if I'm running from
external refclk. Using DSICLK/4 seems necessary for some reason, but it
is very unreliable to get a proper image.
Which display are you using? Do you mind sharing your DT?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


