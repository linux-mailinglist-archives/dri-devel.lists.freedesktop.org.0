Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5144C1A99
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5FF10E19B;
	Wed, 23 Feb 2022 18:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D86210E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:05:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6DD5DD;
 Wed, 23 Feb 2022 19:05:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645639502;
 bh=0KfdNa+vM70EeqFP9yOVby84KYIZfhnNgJkRhONmCio=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iCQxj9jDdRGe9tablR6QqoOeMuW3kk+aYgNetlvh+Es7hP7bBDt1G0G6w4M7OFUdO
 hdbw5EBq5/nwYes8sK3BmY+ThQQiv8sHtMgUgbNUAyrr9lUlsjqs+PhtbS4ig2UcXB
 b0MpRCbvJOSCuG9LJ3QkdUxSKoS4s4W2X4bmENbk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
 <YNM+JO4AAkPOLg7Y@pendragon.ideasonboard.com>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 23 Feb 2022 18:04:59 +0000
Message-ID: <164563949999.4066078.2399611738908533224@Monstersaurus>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug, Laurent,

Quoting Laurent Pinchart (2021-06-23 14:59:00)
> Hi Doug,
>=20
> On Wed, Mar 24, 2021 at 03:47:07PM -0700, Doug Anderson wrote:
> > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > >
> > > Despite the SN65DSI86 being an eDP bridge, on some systems its output=
 is
> > > routed to a DisplayPort connector. Enable DisplayPort mode when the n=
ext
> > > component in the display pipeline is not a panel, and disable eDP
> > > features in that case.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 ++++++++++++++++++++-----=
--
> > >  1 file changed, 24 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/=
bridge/ti-sn65dsi86.c
> > > index e2527d597ccb..f792227142a7 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -55,6 +55,7 @@
> > >  #define SN_LN_ASSIGN_REG                       0x59
> > >  #define  LN_ASSIGN_WIDTH                       2
> > >  #define SN_ENH_FRAME_REG                       0x5A
> > > +#define  ASSR_CONTROL                          BIT(0)
> > >  #define  VSTREAM_ENABLE                                BIT(3)
> > >  #define  LN_POLRS_OFFSET                       4
> > >  #define  LN_POLRS_MASK                         0xf0
> > > @@ -86,6 +87,8 @@
> > >  #define SN_DATARATE_CONFIG_REG                 0x94
> > >  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
> > >  #define  DP_DATARATE(x)                                ((x) << 5)
> > > +#define SN_TRAINING_SETTING_REG                        0x95
> > > +#define  SCRAMBLE_DISABLE                      BIT(4)
> > >  #define SN_ML_TX_MODE_REG                      0x96
> > >  #define  ML_TX_MAIN_LINK_OFF                   0
> > >  #define  ML_TX_NORMAL_MODE                     BIT(0)
> > > @@ -723,6 +726,11 @@ static int ti_sn_link_training(struct ti_sn_brid=
ge *pdata, int dp_rate_idx,
> > >         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> > >                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx)=
);
> > >
> > > +       /* For DisplayPort, use the standard DP scrambler seed. */
> > > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > > +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> > > +                                  ASSR_CONTROL, 0);
> >=20
> > I don't actually know anything about DP scrambler seeds. However:
> >=20
> > 1. From reading the docs, this field seems to be documented to be
> > "read only" unless:
> >=20
> > 1a) The "TEST2" pin is pulled high when you power on the bridge.
> > 1b) You set "ASSR_OVERRIDE" (page select to page 7, write to register
> > 0x16, page select back to page 0).
> >=20
> > I don't know if TEST2 is being pulled high in your hardware, but at
> > least I can see that 1b) isn't done. So I'm guessing that this line is
> > a no-op? If I had to guess from all the hoops they're making you jump
> > through there's some sort of errata around standard scrambling on this
> > bridge chip. Are you sure it works OK?
>=20
> Good question :-) We managed to get the SN65DSI86 to work with an
> external DP monitor yesterday, so it's possible (some modes don't
> operate correctly yet, but I assume that to be an issue with the DSI
> encoder).
>=20
> The TEST2 pin is strapped to ground on the board.
>=20
> According to the DisplayPort specification, eDP and DP use different
> scrambler seeds to prevent interoperability between an eDP source and a
> DP sink. I'll check what happens without this change.

Without this change, the display still works...

>=20
> > 2. The docs I see claim that this field is 2 bits big. It seems like
> > it would be nice to honor. Yeah, it's silly because 0x11 and 0x10 are
> > "reserved" so it's really more like a 1-bit field, but still seems
> > like it would be better to set both bits, or at least add a comment
> > explaining why you're not matching the datasheet.
>=20
> Sure.
>=20
> > 3. Your patch doesn't seem to touch the bit of code in
> > ti_sn_bridge_enable() that says this:
> >=20
> > /**
> >  * The SN65DSI86 only supports ASSR Display Authentication method and
> >  * this method is enabled by default. An eDP panel must support this
> >  * authentication method. We need to enable this method in the eDP panel
> >  * at DisplayPort address 0x0010A prior to link training.
> >  */
> > drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
> >    DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);
> >=20
> > Won't that be a problem?
>=20
> I'll have a look.

I'm not sure I yet fully understand the requirements here, but could it
be that only supporting ASSR is why the scrambling is disabled below?

Commenting out that write does not affect the bring up of my DP monitor.

>=20
> > > +
> > >         /* enable DP PLL */
> > >         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> > >
> > > @@ -734,6 +742,11 @@ static int ti_sn_link_training(struct ti_sn_brid=
ge *pdata, int dp_rate_idx,
> > >                 goto exit;
> > >         }
> > >
> > > +       /* For DisplayPort, disable scrambling mode. */
> > > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING=
_REG,
> > > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE=
);
> >=20
> > I'm assuming that this is the important part of your patch? Would be
> > sorta nice to include the "why" in your comment. Why do you want to
> > disable scrambling mode for DP but not for eDP? Maybe you care about
> > compatibility but not EMI if you're hooking up to random DP things?
>=20
> I'll investigate and include proper documentation in v2 (or drop the
> change altogether if it's not required).

And indeed, this part is important. If I drop this hunk - then I get no
display output.

I'm afraid I don't (yet) know the reasons 'why' to extend the comment,
beyond "Scrambling is not supported for DP".

If anyone already does, please feel free to provide the text, and I'll
include it in the next revision, or I'll try to do some more digging
into this part.

--
Kieran


>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
