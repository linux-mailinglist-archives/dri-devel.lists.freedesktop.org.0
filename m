Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E064D3513
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 18:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F5F10E57F;
	Wed,  9 Mar 2022 17:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D219010E57F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 17:04:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5822D8C4;
 Wed,  9 Mar 2022 18:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646845496;
 bh=5Fo54rwgvgRJxqVwV2aN1QaPQFVna5hLv/7lAvz14Ks=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=evFB6li6o4vZyLAeiZy28cPS5VPrdOPnh1RVpE3Q7CSQtUFlL+Gbo1f33/9QXYB5L
 fBVoJA/j0E1f1Qytw1wBNxeOwX9C5m+fQ2aY+gPVBimrFcOcGyudGG1BvWrDtOM2P6
 l9BPjqFObjK425H9sjmdGhPGZBr8DWkwdF9oE9ro=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 09 Mar 2022 17:04:54 +0000
Message-ID: <164684549417.11309.167290259626544349@Monstersaurus>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-03-07 23:22:00)
> Hi,
>=20
> On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> > routed to a DisplayPort connector. Enable DisplayPort mode when the next
> > component in the display pipeline is detected as a DisplayPort
> > connector, and disable eDP features in that case.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Reworked to set bridge type based on the next bridge/connector.
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > --
> > Changes since v1/RFC:
> >  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
> >    devm_drm_of_get_bridge"
> >  - eDP/DP mode determined from the next bridge connector type.
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 29f5f7123ed9..461f963faa0b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -60,6 +60,7 @@
> >  #define SN_LN_ASSIGN_REG                       0x59
> >  #define  LN_ASSIGN_WIDTH                       2
> >  #define SN_ENH_FRAME_REG                       0x5A
> > +#define  ASSR_CONTROL                          BIT(0)
> >  #define  VSTREAM_ENABLE                                BIT(3)
> >  #define  LN_POLRS_OFFSET                       4
> >  #define  LN_POLRS_MASK                         0xf0
> > @@ -91,6 +92,8 @@
> >  #define SN_DATARATE_CONFIG_REG                 0x94
> >  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
> >  #define  DP_DATARATE(x)                                ((x) << 5)
> > +#define SN_TRAINING_SETTING_REG                        0x95
> > +#define  SCRAMBLE_DISABLE                      BIT(4)
> >  #define SN_ML_TX_MODE_REG                      0x96
> >  #define  ML_TX_MAIN_LINK_OFF                   0
> >  #define  ML_TX_NORMAL_MODE                     BIT(0)
> > @@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi=
86 *pdata, int dp_rate_idx,
> >         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> >                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
> >
> > +       /* For DisplayPort, use the standard DP scrambler seed. */
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> > +                                  ASSR_CONTROL, 0);
>=20
> I thought it was agreed that this hunk wasn't doing anything and
> should be removed? I did some research previously [1] and the manual
> said that this bit is "read only" unless "TEST2" is pulled high. In
> the previous discussion Laurent said that it wasn't. I also pointed
> out that this conflicts with the bit of code in ti_sn_bridge_enable()
> which tells the sink to enable the alternate scrambler.

Sorry - I had misremembered indeed, and looking back I confirmed that
this hunk was not required. I had incorrectly remembered that the second
part was required (below) and assumed that had meant both were.

Of course if we're disabling the scrambling mode, then it likely doesn't
matter what the seed is!.

Looking at the datasheet though, register 0x5a, clearly says the default
is 01 (ASSR) which we're not using. So the datasheet implies we want the
DP scrambler seed (if it were enabled?)

Reading the 0x5a register here shows we have 0x05. Indeed, re-reading
after attempting to write '0' to it still shows 0x05. So it's read-only
and not relevant regardless.

I've removed this hunk now.

> >         /* enable DP PLL */
> >         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> >
> > @@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi=
86 *pdata, int dp_rate_idx,
> >                 goto exit;
> >         }
> >
> > +       /* For DisplayPort, disable scrambling mode. */
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_R=
EG,
> > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
>=20
> In my previous review I asked for some comments to include the "why"
> we disabling scrambling mode for DP. Can you please add that?
>=20
> I also presume that for DP it's probably a good idea to avoid the code
> in ti_sn_bridge_enable() that tells the sink to use the alternate
> scrambler.

looking at it yes. I've added a check to avoid that in my DP connector
case, and there doesn't seem to be any effect on the output. But I'll
add it to the patch for the next version.



>> I think it was done for DRM purpose, to prevent signals meant for a
>> panel to be connected to a device that could capture video from a DP
>> source.

Is this better:

	/*
	 * Only eDP pannels which support Alternate Scrambler Seed Reset (ASSR)
	 * are supported by the SN65DSI86. For DisplayPort, disable scrambling
	 * mode.
	 */

I don't know if it answers your 'why' ... and I don't think adding
 "We think it is for DRM protection"

really suits the comment.

=20
> [1] https://lore.kernel.org/r/CAD=3DFV=3DWwayx1Y-xv=3DRPuJbG+Q1wHrUWgh4P7=
wuzy_bAL=3D_FN0g@mail.gmail.com
>=20
> -Doug
