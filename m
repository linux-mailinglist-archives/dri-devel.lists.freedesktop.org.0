Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E876B9A5102
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 23:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81F910E3C8;
	Sat, 19 Oct 2024 21:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2u8pOFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784410E06A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 21:49:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70A015B3;
 Sat, 19 Oct 2024 23:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729374442;
 bh=tfvr+zOblZGTruP4mpM7adeSPSX93PwmhoRyBwJcdvw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N2u8pOFedv7qs9a38FB00VK5lo+s5Aa9K2tmh+IO3EPzKYlum3L5Ul7q7fpKpwkpP
 X7S/hTezjEY3SibLzlGLMWj5DgK4aoOnSAVQknLcwSaYYAS9CT4Ywx3qknvhASgow+
 inV+coV7B7KeHSXZdKcysF/dh9KmvE30E8GIS0MQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f4b083ec-58b5-477a-a0a4-c4c8d02027a7@denx.de>
References: <20240531202813.277109-1-marex@denx.de>
 <ab2eb32e-a458-4c9b-8324-27ccb00336c5@denx.de>
 <7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
 <23d9df90-cb80-4d97-afd6-5c573face4bc@nxp.com>
 <f4b083ec-58b5-477a-a0a4-c4c8d02027a7@denx.de>
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lukas F . Hartmann <lukas@mntmn.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>,
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Sat, 19 Oct 2024 22:49:04 +0100
Message-ID: <172937454426.2485972.12472740284222343769@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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

Quoting Marek Vasut (2024-10-12 21:37:59)
> On 10/11/24 5:10 AM, Liu Ying wrote:
>=20
> Hi,
>=20
> >>>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , bu=
t it is still in the imx8mp.dtsi . Therefore, to make your panel work at th=
e correct desired pixel clock frequency instead of some random one inherite=
d from imx8mp.dtsi, add the following to the pollux DT, I believe that will=
 fix the problem and is the correct fix:
> >>>>
> >>>> &media_blk_ctrl {
> >>>>  =C2=A0=C2=A0=C2=A0 // 506800000 =3D 72400000 * 7 (for single-link L=
VDS, this is enough)
> >>>>  =C2=A0=C2=A0=C2=A0 // there is no need to multiply the clock by * 2
> >>>>  =C2=A0=C2=A0=C2=A0 assigned-clock-rates =3D <500000000>, <200000000=
>, <0>, <0>, <500000000>, <506800000>;
> >>>
> >>> This assigns "video_pll1" clock rate to 506.8MHz which is currently n=
ot
> >>> listed in imx_pll1443x_tbl[].
> >>
> >> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates")=
 the 1443x PLLs can be configured to arbitrary rates which for video PLL is=
 desirable as those should produce accurate clock.
> >=20
> > Ack.
> >=20
> >>
> >>> Does the below patch[1] fix the regression issue? It explicitly sets
> >>> the clock frequency of the panel timing to 74.25MHz.
> >>>
> >>> [1] https://patchwork.freedesktop.org/patch/616905/?series=3D139266&r=
ev=3D1
> >> That patch is wrong, there is an existing entry for this panel in pane=
l-simple.c which is correct and precise, please do not add that kind of imp=
recise duplicate timings into DT.
> >=20
> > At least the patch[1] is legitimate now to override the display
> > timing of the panel because the override mode is something
> > panel-simple.c supports.
>=20
> It may be possible to override the mode, but why would this be the=20
> desired if the panel-simple.c already contains valid accurate timings=20
> for this particular panel ?

I'm confused a little here. Why is it that setting the panel timings in
the DT as per [1] make the display work, while the panel timeings in
panel-simple alone are not enough?

Is there some difference in code path for 'how' the panel timings are
set as to whether they will apply fully or not ?


--
Kieran


>=20
> > And, pixel clock @74.25MHz is not out
> > of the panel specification since edt_etml1010g3dra_timing
> > indicates the minimum as 66.3MHz and the maximum as 78.9MHz.
>=20
> The panel-simple.c already contains timings for this panel, which are=20
> accurate and follow the panel datasheet. If the goal here is to support=20
> approximate panel timings between the currently available three options=20
> (min/typ/max) listed in panel-simple, then that is another discussion=20
> for another patch.
>=20
> > Furthermore, if "PHYTEC phyBOARD-Pollux i.MX8MP" also supports
> > something like MIPI DSI to HDMI, then 74.25MHz panel pixel clock
> > rate is more desirable because the LVDS display and the MIPI DSI
> > display pipeline with typical 148.5MHz/74.25MHz pixel clock rates
> > may use one single "video_pll1" clock.
>=20
> I actually do have exactly this use case on one system -- one LVDS panel =

> and one MIPI DSI panel -- the solution is really easy, source the LVDS=20
> pixel clock from Video PLL and the DSI clock from e.g. PLL3 .
>=20
> > Anyway, I think it is ok to use the patch[1] or assigning
> > "video_pll1" clock rate to 506.8MHz in DT(no things like MIPI
> > DSI to HDMI in existing DT).
> I believe for the current release, it is better to update the Video PLL=20
> clock in this one board DT, because that is minimum impact change=20
> isolated to this board and fixes a real issue where the LVDS panel=20
> worked within specification only by sheer chance.
