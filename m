Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079D914665
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AB710E3D4;
	Mon, 24 Jun 2024 09:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="CdTHxIxf";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bDB+7oB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3565C10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719221205; x=1750757205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hMqs+6F09NwaQlFvBqwTnd0kC2Pz3PgkMayL2dK0Fbw=;
 b=CdTHxIxfUUTm66R3QmLbRyCXv9GjPFeWhMpTQJO1K+4rTn7zCgYenNKW
 sRIbgasH+DARmVI0SL4FXo9CjSRMWAI2KsqyeifAAhOvUXAEhhNBdMmJe
 pwz2eUANCzD53juUhgFjGlN0g+N1Mg+0kqM68AcBGlbjnev/Y+z3468cJ
 ZHQXMA8shRcdyH2xXHA8T+DrEh57CdjsQr+6kf8IrzSbXcCTyrV2xwTkR
 rVF8Utdtrlq1KGwcX2ChkqMwQUjlW2bMHW8Q8Vqyi5OkMda2vCO2KB894
 mvGcbpp/a9NXPi/pJV1AfD7hGsU63zmq+FipFaQ1aRyKGjDPtOT5ECTsq A==;
X-CSE-ConnectionGUID: HucsafNZR9Sqd2hy+J5OaQ==
X-CSE-MsgGUID: SnENx/mYQS6Yklbug0mrkg==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37547846"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:26:41 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4ECC16FCF8; Mon, 24 Jun 2024 11:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719221197;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hMqs+6F09NwaQlFvBqwTnd0kC2Pz3PgkMayL2dK0Fbw=;
 b=bDB+7oB8xehQYQjpGGDQ7xC/5bPBeqACC2lyXfSiBzFthjWTugtLkUCvDVZqG8eXhft9+z
 6iUrP0o4YlZ0QU8gfajXZv8wX3cwq+HFQCjYVHW6cFhhagTTlhjnM8dOvm6gNEvQPWg6sb
 /JtaXPkFK3tqRIXBCiWUaUo+GYfHiCUUgOMDGuUA6xdzztFO2BswwsWPGWdqToBxRwxyeN
 YjisaLjrtUf7eDsj37b9mB6sq+KBlIFhDQL5NzwL5OpS9HSnhdqJhrHjUpCFWxsXAi29o+
 dDl5zJt05B2DH+Xq5JnoI+yAdfH8W1EzVPzCTOtIIKBhCkisGTvZan/PxOvD0A==
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
Date: Mon, 24 Jun 2024 11:26:41 +0200
Message-ID: <3760061.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <71f042ba-63f4-402c-8be2-3bfe6fe91a0b@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <4623820.cEBGB3zze1@steina-w> <71f042ba-63f4-402c-8be2-3bfe6fe91a0b@denx.de>
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

Am Freitag, 21. Juni 2024, 16:54:51 CEST schrieb Marek Vasut:
> On 6/21/24 12:32 PM, Alexander Stein wrote:
>=20
> Hi,
>=20
> skipping the parts where I would simply write "OK" ...
>=20
> >>>> As FVUEN is cleared at the next VSYNC event I suspect the DSI timings
> >>>> are (slightly) off, but unfortunately I don't have equipment to check
> >>>> DSI signal quality/timings.
> >>>
> >>> As long as the LCDIFv3 pixel clock are equal or slightly slower than
> >>> what the TC9595 PixelPLL generates, AND, DSIM serializer has enough
> >>> bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI RX
> >>> cannot go any faster), you should have no issues on that end.
> >=20
> > I'm using samsung,burst-clock-frequency =3D <1000000000> so this should=
 be
> > okay. That is 1080p resolution.
>=20
> Yes, correct.
>=20
> >>> When in doubt, try and use i2ctransfer to read out register 0x300
> >>> repeatedly, that's DSI RX error counter register. See if the DSI error
> >>> count increments.
> >=20
> > If the bridge is not working the registers look like this:
> > 300: c0800000
> > 464: 00000001
> >=20
> > they are not changing and stay like that.
> >=20
> > If the bridge is actually running they are like
> > 300: c08000d3
> > 464: 00000000
> >=20
> > and are also not changing.
>=20
> Uh ... that looks like the whole chip clock tree somehow locked up .
>=20
> Thinking about this, I once did force the DSIM into 24 MHz mode (there=20
> is PLL bypass setting, where the DSIM uses 24 MHz serializer clock=20
> directly for the DSI HS clock) or something close, it was enough to=20
> drive a low resolution panel. But the upside was, with a 200 MHz 5Gsps=20
> scope set to AC-coupling and 10x probe, I could discern the traffic on=20
> DSI data lane and decode it by hand. The nice thing is, you could=20
> trigger on 1V2 LP mode, so you know where the packet starts. The=20
> downside is, if you have multiple data lanes, the packet is spread=20
> across them.
>=20
> You could also tweak tc_edp_atomic_check()/tc_edp_mode_valid() and force=
=20
> only low(er) resolution modes of your DP panel right from the start, so=20
> you wouldn't need that much DSI bandwidth. Maybe you could reach some=20
> mode where your equipment is enough to analyze the traffic by hand ?

I think I got it running now. Apparently there were different, independent
problems which you addressed by your series. Unfortunately the patch
'tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS' introduced a new problem
(at least for me). For the record I'm running the following patch stack bas=
ed
on next-20240621:
* Add linux-next specific files for 20240621
* arm64: dts: imx8mp: Add TC9595 DSI-DP bridge on TQMa8MPxL/MBa8MPxL
* drm: bridge: samsung-dsim: Initialize bridge on attach
* drm/bridge: tc358767: Reset chip again on attach
* drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
* drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation an=
d enablement
* drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
* drm/bridge: tc358767: Drop line_pixel_subtract
* drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
* Revert "drm/bridge: tc358767: Set default CLRSIPO count"

All of them are needed, reverting/dropping a single one results in a
non-functioning bridge.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


