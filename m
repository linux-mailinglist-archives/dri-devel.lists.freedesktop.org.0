Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26139A65F9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511210E011;
	Mon, 21 Oct 2024 11:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WGpIVq5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C43510E011
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:10:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32509526;
 Mon, 21 Oct 2024 13:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729508899;
 bh=SNzKSWHvJVDDSQ9Feoygg0Z+XxDwpbrEq5wv+It3to0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WGpIVq5fHdac57nBRQjviMmeNHL/r9azywuQF56RPvWw7kwoGcbUHFDuCtvYnGacu
 FoLt85a5z+KYwZsRAbnSb+jtwSN5allih11WiiKvceLbxf5IXgUA38tR/vLUhflJxX
 qZnHmkBdU4LrxipW6fzwAgNCrKsUru2xhaRs29BA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eee5649b-ca5a-42c5-a6ec-246ee21fb6e4@denx.de>
References: <20240531202813.277109-1-marex@denx.de>
 <de285fc0-728f-4ba0-86e0-0069d2cc9a35@denx.de>
 <64e18ceed5279a9346a6a1141f02ead93383bd1e.camel@ideasonboard.com>
 <84f505af-1066-4fcf-84b7-28c152c09b89@denx.de>
 <a7143bd9-a5e0-4afc-98ed-2d4d58171a32@nxp.com>
 <d70a9c51-6fd7-46fe-8009-b42d0ab4e142@denx.de>
 <23d9df90-cb80-4d97-afd6-5c573face4bc@nxp.com>
 <f4b083ec-58b5-477a-a0a4-c4c8d02027a7@denx.de>
 <172937454426.2485972.12472740284222343769@ping.linuxembedded.co.uk>
 <eee5649b-ca5a-42c5-a6ec-246ee21fb6e4@denx.de>
Subject: Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of
 .crtc_clock
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lukas F.Hartmann <lukas@mntmn.com>,
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
Date: Mon, 21 Oct 2024 12:10:02 +0100
Message-ID: <172950900212.3353069.2089097805440086007@ping.linuxembedded.co.uk>
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

Quoting Marek Vasut (2024-10-20 03:49:29)
> On 10/19/24 11:49 PM, Kieran Bingham wrote:
> > Quoting Marek Vasut (2024-10-12 21:37:59)
> >> On 10/11/24 5:10 AM, Liu Ying wrote:
> >>
> >> Hi,
> >>
> >>>>>> This Video PLL1 configuration since moved to &media_blk_ctrl {} , =
but it is still in the imx8mp.dtsi . Therefore, to make your panel work at =
the correct desired pixel clock frequency instead of some random one inheri=
ted from imx8mp.dtsi, add the following to the pollux DT, I believe that wi=
ll fix the problem and is the correct fix:
> >>>>>>
> >>>>>> &media_blk_ctrl {
> >>>>>>   =C2=A0=C2=A0=C2=A0 // 506800000 =3D 72400000 * 7 (for single-lin=
k LVDS, this is enough)
> >>>>>>   =C2=A0=C2=A0=C2=A0 // there is no need to multiply the clock by =
* 2
> >>>>>>   =C2=A0=C2=A0=C2=A0 assigned-clock-rates =3D <500000000>, <200000=
000>, <0>, <0>, <500000000>, <506800000>;
> >>>>>
> >>>>> This assigns "video_pll1" clock rate to 506.8MHz which is currently=
 not
> >>>>> listed in imx_pll1443x_tbl[].
> >>>>
> >>>> Since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates=
") the 1443x PLLs can be configured to arbitrary rates which for video PLL =
is desirable as those should produce accurate clock.
> >>>
> >>> Ack.
> >>>
> >>>>
> >>>>> Does the below patch[1] fix the regression issue? It explicitly sets
> >>>>> the clock frequency of the panel timing to 74.25MHz.
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/patch/616905/?series=3D139266=
&rev=3D1
> >>>> That patch is wrong, there is an existing entry for this panel in pa=
nel-simple.c which is correct and precise, please do not add that kind of i=
mprecise duplicate timings into DT.
> >>>
> >>> At least the patch[1] is legitimate now to override the display
> >>> timing of the panel because the override mode is something
> >>> panel-simple.c supports.
> >>
> >> It may be possible to override the mode, but why would this be the
> >> desired if the panel-simple.c already contains valid accurate timings
> >> for this particular panel ?
> >=20
> > I'm confused a little here. Why is it that setting the panel timings in
> > the DT as per [1] make the display work, while the panel timeings in
> > panel-simple alone are not enough?
> >=20
> > Is there some difference in code path for 'how' the panel timings are
> > set as to whether they will apply fully or not ?
> Because [1] sets inaccurate pixel clock of 74.25 MHz, which can be=20
> divided down from random default Video PLL setting of 1039.5 MHz set in=20
> imx8mp.dtsi media_blk_ctrl , 1039.5 / 74.25 =3D 14 .
>=20
> The panel-simple pixel clock are 72.4 MHz, to achieve that accurately,=20
> it is necessary to reconfigure the Video PLL frequency to 506.8 MHz ,=20
> which LCDIFv3 can do, but LDB can not, hence it has to be done in DT for =

> now.

Aha - right - Thanks, I'd missed the part that 74.25 MHz /is not/ the
correct or supported pixel clock for the panel, so it just becomes
'close enough' and lucky that it works...


Now I understand how your proposed :

> >>>>>> &media_blk_ctrl {
> >>>>>>   =C2=A0=C2=A0=C2=A0 // 506800000 =3D 72400000 * 7 (for single-lin=
k LVDS, this is enough)
> >>>>>>   =C2=A0=C2=A0=C2=A0 // there is no need to multiply the clock by =
* 2
> >>>>>>   =C2=A0=C2=A0=C2=A0 assigned-clock-rates =3D <500000000>, <200000=
000>, <0>, <0>, <500000000>, <506800000>;
> >>>>>
> >>>>> This assigns "video_pll1" clock rate to 506.8MHz which is currently=
 not
> >>>>> listed in imx_pll1443x_tbl[].

is more accurate. But is that acceptable for DT ? To just hardcode
clocks like that?

Or is this something we'll then remove when the additional patches make
it upstream? (I'm curious on the basis that I thought we treat DT as
'firmware' so if we put this in we expect it to be there forever?)

All of this seems like perhaps it should be in an overlay for the
display too - but given this board comes with this panel as a kit - I
suspect it's fine to keep it all there.

--
Kieran
