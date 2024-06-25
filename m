Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8F7915EAD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 08:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C9510E286;
	Tue, 25 Jun 2024 06:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Nc3va4/i";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HGvrEfDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8508210E286
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 06:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719295919; x=1750831919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Meaao+L1TfjC2WAu0BwpZtIbjRJ3XMXhMRKd3TjMIQ4=;
 b=Nc3va4/iOj7AQ3K8+oWcuQRuaLjhQxDj86rxRIxXlVVXEdyPvyigzHlB
 uXlIjT7ZxvuC3rf4WXsRfDv3WI0n3Ys8PdBh08Pf3uhlpYgnBm9NLMuCx
 C1mdJbFhzeurBxqnOFja52SfDqf/3g/GnoeFBFmlS42VyakcaT7bc1+FE
 QXMehTRdElGAa7vjjVJNTIgKJM6naWxXeorThdzP4KO9hvyoLdXiiJ6af
 Nxcnfh9zHMBQEGtX6zldoiH1N6VUbBMsaXRvME3u0PndAMpUMX8kpMNEp
 vJ5G3yTonSjrvcbvNtpp1vUIkRAnakhLIU8FlqjEcqwafZ28AqM3/6DYk g==;
X-CSE-ConnectionGUID: WdScgQ69R7Kn5JOMyU6vqg==
X-CSE-MsgGUID: vWuLhi+UT+6q3HEI3Z1ZOQ==
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="37564730"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jun 2024 08:11:57 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A953170480; Tue, 25 Jun 2024 08:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719295912;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Meaao+L1TfjC2WAu0BwpZtIbjRJ3XMXhMRKd3TjMIQ4=;
 b=HGvrEfDlMRWG48OR5oR+Ct3WUuVIxHqr1Mk3fTgfwYv17zKhoOqM5nHAzDSc7oRUDv8A2E
 HClLCZAazkyIWUiQpyowexii7dzZqB6wXZ/OtdK4L5DIqf1P3pP3PMRRRDv+tDTI0xEjpT
 tsdYim5qF4XI1JqEq/J1QkCt+8zXtvCG25k6RKnyLLf6PtDRUtGHF4pjKaBmaZLXpHrL81
 TU6loHGEWt04nMPFnuXzeAM3WyzopSiDFUByvY8aKf17XrJYtP/lNYRx074s1YP5Bg0Bxg
 JM7z/34XOruSS4kDrf8a/BI4SwgDyYJBx0403BtlhaV44hhnuOkW25CzPfN34w==
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
Date: Tue, 25 Jun 2024 08:11:52 +0200
Message-ID: <2815610.BEx9A2HvPv@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <3db8424d-9880-4e9f-8441-26139a44dba8@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <3760061.MHq7AAxBmi@steina-w> <3db8424d-9880-4e9f-8441-26139a44dba8@denx.de>
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

Am Dienstag, 25. Juni 2024, 02:33:53 CEST schrieb Marek Vasut:
> On 6/24/24 11:26 AM, Alexander Stein wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Am Freitag, 21. Juni 2024, 16:54:51 CEST schrieb Marek Vasut:
> >> On 6/21/24 12:32 PM, Alexander Stein wrote:
> >>
> >> Hi,
> >>
> >> skipping the parts where I would simply write "OK" ...
> >>
> >>>>>> As FVUEN is cleared at the next VSYNC event I suspect the DSI timi=
ngs
> >>>>>> are (slightly) off, but unfortunately I don't have equipment to ch=
eck
> >>>>>> DSI signal quality/timings.
> >>>>>
> >>>>> As long as the LCDIFv3 pixel clock are equal or slightly slower than
> >>>>> what the TC9595 PixelPLL generates, AND, DSIM serializer has enough
> >>>>> bandwidth on the DSI bus (i.e. set the bus to 1 GHz, the TC9595 DSI=
 RX
> >>>>> cannot go any faster), you should have no issues on that end.
> >>>
> >>> I'm using samsung,burst-clock-frequency =3D <1000000000> so this shou=
ld be
> >>> okay. That is 1080p resolution.
> >>
> >> Yes, correct.
> >>
> >>>>> When in doubt, try and use i2ctransfer to read out register 0x300
> >>>>> repeatedly, that's DSI RX error counter register. See if the DSI er=
ror
> >>>>> count increments.
> >>>
> >>> If the bridge is not working the registers look like this:
> >>> 300: c0800000
> >>> 464: 00000001
> >>>
> >>> they are not changing and stay like that.
> >>>
> >>> If the bridge is actually running they are like
> >>> 300: c08000d3
> >>> 464: 00000000
> >>>
> >>> and are also not changing.
> >>
> >> Uh ... that looks like the whole chip clock tree somehow locked up .
> >>
> >> Thinking about this, I once did force the DSIM into 24 MHz mode (there
> >> is PLL bypass setting, where the DSIM uses 24 MHz serializer clock
> >> directly for the DSI HS clock) or something close, it was enough to
> >> drive a low resolution panel. But the upside was, with a 200 MHz 5Gsps
> >> scope set to AC-coupling and 10x probe, I could discern the traffic on
> >> DSI data lane and decode it by hand. The nice thing is, you could
> >> trigger on 1V2 LP mode, so you know where the packet starts. The
> >> downside is, if you have multiple data lanes, the packet is spread
> >> across them.
> >>
> >> You could also tweak tc_edp_atomic_check()/tc_edp_mode_valid() and for=
ce
> >> only low(er) resolution modes of your DP panel right from the start, so
> >> you wouldn't need that much DSI bandwidth. Maybe you could reach some
> >> mode where your equipment is enough to analyze the traffic by hand ?
> >=20
> > I think I got it running now. Apparently there were different, independ=
ent
> > problems which you addressed by your series.
>=20
> Oh, glad I could help.
>=20
> > Unfortunately the patch
> > 'tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS' introduced a new prob=
lem
> > (at least for me). For the record I'm running the following patch stack=
 based
> > on next-20240621:
>=20
> Thanks for tracking it down. I can drop that one=20
> MIPI_DSI_CLOCK_NON_CONTINUOUS patch from the series and do a V4. Would=20
> that work for you ? At least there would be some improvement to the=20
> driver and I can analyze the MIPI_DSI_CLOCK_NON_CONTINUOUS issue in=20
> detail separately.

Sure, thanks to your patches this bridge does its job now.
Sure, now that I have a reference system I can easily try a V4 without
the MIPI_DSI_CLOCK_NON_CONTINUOUS patch.

Best regards,
Alexander

> > * Add linux-next specific files for 20240621
> > * arm64: dts: imx8mp: Add TC9595 DSI-DP bridge on TQMa8MPxL/MBa8MPxL
> > * drm: bridge: samsung-dsim: Initialize bridge on attach
> > * drm/bridge: tc358767: Reset chip again on attach
> > * drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
> > * drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculatio=
n and enablement
> > * drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode =
clock
> > * drm/bridge: tc358767: Drop line_pixel_subtract
> > * drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
> > * Revert "drm/bridge: tc358767: Set default CLRSIPO count"
> >=20
> > All of them are needed, reverting/dropping a single one results in a
> > non-functioning bridge.
>=20
> Thank you for testing !
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


