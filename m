Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F331B7279AD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 10:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C010E22C;
	Thu,  8 Jun 2023 08:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FE210E22C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 08:11:32 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q7Ajk-0008SP-M1; Thu, 08 Jun 2023 10:11:16 +0200
Message-ID: <182004fb03699d04cbcc1b1b74c95c88a576621c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm: bridge: tc358767: give VSDELAY some positive
 value
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Date: Thu, 08 Jun 2023 10:11:13 +0200
In-Reply-To: <d7707a56-2b36-25d0-d5f2-79ef60b292bd@denx.de>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
 <20230602191501.4138433-2-l.stach@pengutronix.de>
 <70962376-c7f1-1adc-37e4-55fa33055ae9@denx.de>
 <7210bb5955a469134f3b072007bf98a74c8f17da.camel@pengutronix.de>
 <d7707a56-2b36-25d0-d5f2-79ef60b292bd@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 07.06.2023 um 15:54 +0200 schrieb Marek Vasut:
> On 6/7/23 14:53, Lucas Stach wrote:
> > Am Freitag, dem 02.06.2023 um 23:34 +0200 schrieb Marek Vasut:
> > > On 6/2/23 21:15, Lucas Stach wrote:
> > > > From: David Jander <david@protonic.nl>
> > > >=20
> > > > The documentation is not clear about how this delay works.
> > > > Empirical tests have shown that with a VSDELAY of 0, the first
> > > > scanline is not properly formatted in the output stream when
> > > > DSI->DP mode is used. The calculation spreadsheets from Toshiba
> > > > seem to always make this value equal to the HFP + 10 for DSI->DP
> > > > use-case. For DSI->DPI this value should be > 2 and for DPI->DP
> > > > it seems to always be 0x64.
> > > >=20
> > > > Signed-off-by: David Jander <david@protonic.nl>
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > ---
> > > >    drivers/gpu/drm/bridge/tc358767.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/br=
idge/tc358767.c
> > > > index 46916ae30f8f..9f2c67b4a488 100644
> > > > --- a/drivers/gpu/drm/bridge/tc358767.c
> > > > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > > > @@ -817,7 +817,7 @@ static int tc_set_common_video_mode(struct tc_d=
ata *tc,
> > > >    	 * sync signals
> > > >    	 */
> > > >    	ret =3D regmap_write(tc->regmap, VPCTRL0,
> > > > -			   FIELD_PREP(VSDELAY, 0) |
> > > > +			   FIELD_PREP(VSDELAY, right_margin + 10) |
> > > >    			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
> > > >    	if (ret)
> > > >    		return ret;
> > >=20
> > > Aren't you running into a problem due to VS timing misconfiguration o=
n
> > > the scanout engine or DSI serializer side ? The VSDELAY seems to
> > > increase the length of VSYNC active .
> > >=20
> >=20
> > No, as far as I understand the VSDELAY adds an offset between input an
> > output side of the video FIFO. It shouldn't increase the length of any
> > sync signal, but delays the read side of the FIFO, so the write (DSI)
> > side has some margin to put data into the FIFO before DP side starts to
> > assemble packets.
>=20
> Does this apply to DSI-to-DPI mode too ?

I guess it does the same thing, but the technical documents I have
don't really say anything about it. I don't think the VSDELAY really
matters in the DPI output case, as DPI is much slower in pulling data
out of the FIFO compared to the DP packetizing, so the DSI side should
always be able to keep up with the DPI side.

>=20
> > >   Which DSI bus mode do you use, sync events/pulses/burst ?
> >=20
> > At the time when this patch was written it still was the SYNC_PULSE
> > mode.
>=20
> Can you please double-check this with current burst mode ?

It works fine on a hardware in DSI to DPI mode. I could check that
things are still as expected in DSI to DP mode later, but I don't
expect any issues.

Regards,
Lucas
