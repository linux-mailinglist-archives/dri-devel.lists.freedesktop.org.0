Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9FCCED93
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F010E8D6;
	Fri, 19 Dec 2025 07:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hpFto5Wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Fri, 19 Dec 2025 07:52:03 UTC
Received: from mx-relay50-hz3.antispameurope.com
 (mx-relay50-hz3.antispameurope.com [94.100.134.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0237810E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:52:02 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6,
 headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766130371;
 b=JnpFrZp+Y1Msm60xdLj3EU5COm8L+Tn34fo4GRYwXrdk0+Ck3lGQK2rh1U/3o8y1WV5xWJZ1
 68oz/0ZiEW1qS0pwdCW2DhIl6fR6mCfcTPIbn/ZZ+84Rtfp7rwYM47a4Ita5/umZVmJt4pQc/v3
 2mDrc1AYMZ9Iw1aiQOFyAD0arMbduILa5+XrGfDCKtgOzN1lOFHsMn7tsu2KwjP56t5lXmHDyf3
 qoDYpKnjoJU+vxaJFq4gCG7Te+Ka4Biu46QOTylKTw21iXDwUtxPrRRZSKj5rVVsGlT43YRg8E0
 tEKG/7our46ES+Gm54bktV8k+TzcnOth10t1k2SDhBr5w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766130371;
 b=EpHkY8B/JQJRq2xzNTjRmi5yDNCcKwvchtLXoQQpvwctrprOEIE3fkl4ZKcDQWk7QqMWGeG3
 U/gpq6rPMv5bBxkk+g3ztqI8DO2kbvd789VEg8QR6Rz1zJId2ffLWcpJFiEfhiapbkxlJ7PD11t
 dhqbwAdAx+gYz4LGoqcyuTV7KJ6fk655easymA60DlxWavmdUv/LlgAgJ+y4KAC/5z/YvSr8sO7
 PQFVWv17EOBj+hGBwCy0zXzR+maJ4rLIiDvLlDdk0ZfifNPxMLilbGboi7bz5V3Zs9PtN9my3Rf
 Fo+L5dLXWKR5Hmyw6cECMnf8W2D8vzGfe/LxBC4/yi8GQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay50-hz3.antispameurope.com; Fri, 19 Dec 2025 08:46:11 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id
 C0DFBCC0DAC; Fri, 19 Dec 2025 08:45:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Date: Fri, 19 Dec 2025 08:45:57 +0100
Message-ID: <7637686.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <3210190.mvXUDI8C0e@steina-w>
 <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: dri-devel@lists.freedesktop.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for:
 alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay50-hz3.antispameurope.com with 4dXfjM6trLz2nJ7p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: f6d1fa41e90d3fcf88d8c9a603ba697f
X-cloud-security: scantime:3.688
DKIM-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766130371; v=1;
 b=hpFto5Wfm64UQQ9jniOywqxkv0puB+hUWqJrAO8RiAtH6SBylI5TqujNnvxSR0H0WDLUFp8H
 NQvEGpgr+EQeWYJRwKXWjBMrwaEfEBZuPnWFmHQZsCZWyhvApfjGJG9fMvJdoPRUClFWf+powUk
 SMM0fbd//67MPS5D9D9pfFWTadZLXKOUo0qbM13VIXm3wahOqYrNj2M1xC6Qs65RAqvh4SJG4KB
 OTjxXUFnu7mTCO9y4hMpQ3KGcrZj/DjkwZ5ZNwUsfKDkNWUtHh6IYXx82meAoOrnxdtK0Xr8a12
 Aut7sSluZp+pQECNUpi4U6RXbwCQCCTYFJxdE4rChEx8Q==
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

Hi Marco,

Am Donnerstag, 18. Dezember 2025, 20:08:41 CET schrieb Marco Felsch:
> Hi Alexander,
>=20
> On 25-12-16, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> > > Hi Liu,
> > >=20
> > > sorry I didn't fully answer you please see below.
> > >=20
> > > On 25-12-08, Liu Ying wrote:
> > > > Hi Marco,
> > > >=20
> > > > On 12/02/2025, Marco Felsch wrote:
> > > > > From: Liu Ying <victor.liu@nxp.com>
> > > > >=20
> > > > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register wh=
ich
> > > > > configures parallel display format by using the "PARALLEL_DISP_FO=
RMAT"
> > > > > field. Document the Parallel Display Format Configuration(PDFC) s=
ubnode
> > > > > and add the subnode to example.
> > > > >=20
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > > > [m.felsch@pengutronix.de: add bus-width]
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++=
++++++++++++++
> > > > >  1 file changed, 92 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-=
media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-m=
edia-blk-ctrl.yaml
> > > > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108=
b492bcbabc8a560d8e707cd 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > @@ -26,6 +26,12 @@ properties:
> > > > >    reg:
> > > > >      maxItems: 1
> > >=20
> > > ...
> > >=20
> > > > > +            properties:
> > > > > +              endpoint:
> > > > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > > +                unevaluatedProperties: false
> > > > > +
> > > > > +                properties:
> > > > > +                  bus-width:
> > > >=20
> > > > In v1-v5, I thought the output bus format can be determined by the =
sink
> > > > device(a panel or a bridge) hence properties like bus-width were no=
t needed.
> > > > But, if this property is really needed, then reference video-interf=
aces.yaml
> > > > since bus-width is documented there.  Should we reference bus-type =
defined
> > > > in video-interfaces.yaml too?
> > >=20
> > > You're right, the bus-width should be determined by the connected pan=
el.
> > > But there are cases where a 24-bit panel is connected but only the lo=
wer
> > > 18-bits are muxed. I added the bus-width property to handle this case.
> > > In the end most users don't have to specify this since the correct
> > > bus-width is coming from the panel bus-fmt.
> > >=20
> > > > > +                    enum: [ 16, 18, 24 ]
> > > >=20
> > > > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP=
 supports
> > > > below formats.  It seems that the enum here may tell RGB888, RGB666=
 and RGB565.
> > > > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> > > >=20
> > > > 000b RGB888 -> RGB888
> > > > 001b RGB888 -> RGB666
> > > > 010b RGB565 -> RGB565
> > > > 011b RGB555 -> RGB555
> > > > 100b YUV -> YCbCr 24 bits
> > > > 101b YUV -> YUV444
> > >=20
> > > This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =
=3D=3D
> > > 24-bit.
> > >=20
> > > That said, I don't think that you need to specify the bus-fmt since t=
his
> > > is coming from the panel. As said above, my itension with the bus-wid=
th
> > > property is to provide integrators (dts-writers) a possibility to lim=
it
> > > the physical available bus width.
> >=20
> > Mh, isn't [1] exactly about this? Not sure about the outcome at that ti=
me.
>=20
> Thanks for the pointer, I wasn't aware of this discussion. I skimmed
> through the dt-bindings thread and I agree with Rob and Maxime.
>=20
> We do have the bus-width endpoint property already. This property is
> alredy used by media and drm bridge drivers. Why not making use of for
> this simple bridge driver too?
>=20
> Furthermore I doubt, that a simple drm-bridge MEDIA_BUS_FMT_* convert
> driver solves all the problem in a generic way for all platforms, all
> connectors, all routing options.

Nobody knows what new hardware comes up with =C2=AF\_ (=E3=83=84)_/=C2=AF
Anyway we already have a similar problem on our MBa6ULx mainboard.
Current downstream workaround is to clone the display timings but
change the bus format. See [1]. Although I would like to get rid of it.
This is just the display connector on the mainboard causing the shift.

Best regards
Alexander

[1] https://github.com/tq-systems/linux-tqmaxx/commit/777c02480182d3054264a=
aaf80e1dbc40a02cfc1

> If the i.MX93 NXP-EVKs in [1] would have connected the upper LCD_DAT*
> pads instead of the lower ones, there would be no conversion needed by
> the PDFC bridge driver, albeit the physical bus is cut to 18-bit width
> due to the RPi ext. header limit, which is expanded to 24-bit again later=
 on
> via the Adafruit board panel FPC connector.
>=20
> In such scenario the output width of the PDFC has to be 24-bit else
> you would lose not only the two LSBs but also the two MSBs for each
> channel. I tried to visualize what I meant for the blue channel:
>=20
>                  24-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>                  18-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>           +---------+    |    |    |    |    |
>           |    +---------+    |    |    |    |
>           |    |    +---------+    |    |    |
>           |    |    |    +---------+    |    |
>           |    |    |    |    +---------+    |
>           |    |    |    |    |    +---------+
>           |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>=20
> The mapping can get quite difficult for a single SoC already, just by
> using a slighlty different HW routing (the upper D[ata] pads).
>=20
> Therefore I would keep it simple and device/ip specific (in this case
> PDFC specific) by making use of the bus-width. Specifying the bus-width
> property could be also wrong albeit it's the case physically, as you can
> see in my above example.
>=20
> Therefore the bus-width property must have a good description.
>=20
> Regards,
>   Marco
>=20
> > Best regards,
> > Alexander
> >=20
> > [1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.=
com/
> >=20
> > > [snip]
>=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


