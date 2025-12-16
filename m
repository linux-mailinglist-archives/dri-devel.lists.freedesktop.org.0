Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55BCC1512
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 08:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0230C10E702;
	Tue, 16 Dec 2025 07:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="E8CbwhHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Tue, 16 Dec 2025 07:36:03 UTC
Received: from mx-relay100-hz2.antispameurope.com
 (mx-relay100-hz2.antispameurope.com [94.100.136.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5632C10E702
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:36:03 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765870184;
 b=Yz2cdWz2QG1CC6KFf79dRfJXaQs8pZJgeTWy+n8mODNdWZPkmGHyUAgq03o+PHqL3Dnx8kkk
 4EmPfb+BTdVSF29CRYAn7u51nEqqubccAmXU1pABOqUiWI89xHkGpIkBNcfmCmrkJ4x21zp+pRp
 czqfbUFbwSO+6kOUD0/t2QYwtDMuqf0WxA1i+H7sy8jwKbN+Ra4qinKFCLdo34/GVF9/Rw8PLe/
 iWSIseNyRC/k4kiud9F4UCDaHGtrS3lq4P4lsxRM3s67CMtwrJqe8941vkGCKM+K3ZXxU7V9FeM
 eUjsgtLd7fp+S645ZBfufRPtKkpahhG162pNmce3KCkeA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765870184;
 b=Yeeh74I5EnjerclCcR7g6LpCU4RG8iK7tO519QKlz3RNQJNHGbFj3Il50Ua8CM+gy3fRuHm9
 g5+xGQX/KfxJjsGb5QiierTw2SZoNMDwYBi+LUvFFqA+Fy5+RMCevcG7J/ZPFmfIgsNxY8hViaQ
 QWIPVqVHpTeHtpSdv/THv8N/FiRml8PNJ0f1IEGgK8YrcERkl+vrBeMhJ+3dSp2w/WPXw9MZhyE
 W782Eor+xM/IWPB94uhobsD8bpkUHXQkSnbgXSH5ARwvCywu2XSMsyBB5qsou6kW3tvVG4lZF9G
 lybuD6SHhbH9XQHQkkJz0aRy53gC+AtzIQmf2NKHPgZzA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay100-hz2.antispameurope.com; Tue, 16 Dec 2025 08:29:44 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id
 61240CC0DC8; Tue, 16 Dec 2025 08:29:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215175436.wwlgzxionq55zu27@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13198926.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: dri-devel@lists.freedesktop.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for:
 alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay100-hz2.antispameurope.com with 4dVpTn4rt4z3PJZL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: 7843bfe7f806661645c9883349bcb132
X-cloud-security: scantime:2.036
DKIM-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765870184; v=1;
 b=E8CbwhHudwcO+Bqvz3PfCTeXgUe+/rdpJiP1HGH1MoyczsWaLva815Z5iXodL59uhtjy/FMt
 JBlifFCJwFqQcUt83jbjQffJUpq/mShw3mwNRxHD/WLXmRd+U6tAf78p4SDY9hqoDh+/dy9cZfM
 stRYCokk6HcKRMmbtzW1o6Ppq2Tv7NGxykj300Et5sM02n1mCf4oOXxoxQhlC9EWTK0P2JXt/mX
 suK10UW++binTdZQM3vQICwAcC09256ctwFvba2iJ2hHul47KQ60xHB+n5yfsO0zT1yjwCd1L8l
 wflHHeqLpzPbOk7pgiEWbNphEi3YgvCeJXlXkNkWPEKKw==
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

--nextPart13198926.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
MIME-Version: 1.0

Hi,

Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> Hi Liu,
>=20
> sorry I didn't fully answer you please see below.
>=20
> On 25-12-08, Liu Ying wrote:
> > Hi Marco,
> >=20
> > On 12/02/2025, Marco Felsch wrote:
> > > From: Liu Ying <victor.liu@nxp.com>
> > >=20
> > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > > field. Document the Parallel Display Format Configuration(PDFC) subno=
de
> > > and add the subnode to example.
> > >=20
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > [m.felsch@pengutronix.de: add bus-width]
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++=
++++++++++
> > >  1 file changed, 92 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-medi=
a-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media=
=2Dblk-ctrl.yaml
> > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492=
bcbabc8a560d8e707cd 100644
> > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > @@ -26,6 +26,12 @@ properties:
> > >    reg:
> > >      maxItems: 1
>=20
> ...
>=20
> > > +            properties:
> > > +              endpoint:
> > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +                unevaluatedProperties: false
> > > +
> > > +                properties:
> > > +                  bus-width:
> >=20
> > In v1-v5, I thought the output bus format can be determined by the sink
> > device(a panel or a bridge) hence properties like bus-width were not ne=
eded.
> > But, if this property is really needed, then reference video-interfaces=
=2Eyaml
> > since bus-width is documented there.  Should we reference bus-type defi=
ned
> > in video-interfaces.yaml too?
>=20
> You're right, the bus-width should be determined by the connected panel.
> But there are cases where a 24-bit panel is connected but only the lower
> 18-bits are muxed. I added the bus-width property to handle this case.
> In the end most users don't have to specify this since the correct
> bus-width is coming from the panel bus-fmt.
>=20
> > > +                    enum: [ 16, 18, 24 ]
> >=20
> > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP sup=
ports
> > below formats.  It seems that the enum here may tell RGB888, RGB666 and=
 RGB565.
> > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> >=20
> > 000b RGB888 -> RGB888
> > 001b RGB888 -> RGB666
> > 010b RGB565 -> RGB565
> > 011b RGB555 -> RGB555
> > 100b YUV -> YCbCr 24 bits
> > 101b YUV -> YUV444
>=20
> This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =3D=
=3D
> 24-bit.
>=20
> That said, I don't think that you need to specify the bus-fmt since this
> is coming from the panel. As said above, my itension with the bus-width
> property is to provide integrators (dts-writers) a possibility to limit
> the physical available bus width.

Mh, isn't [1] exactly about this? Not sure about the outcome at that time.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.com/

> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart13198926.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBClsACgkQaS+g2M0Z
/iVQ0Qf8CUXPNQgjvninNpUlo9wHMSxcj70F/nwY4xnJ9mAHPkIcrl+Ye0RpxJvm
HUghMQJsn8g5oW1mw3ihaOEFFyjI2Nmpn839jZzyuWZFCzy+6ZArWMnhjAmU3EK8
axvxjC6n5kJ2/Dx3wih+X2Ub6IbwNIB01Xq368832yntOGHje3ucsFLNNV8RXaNH
PRwXcgrJ0fSDoEZPC1Eh59z+2sRZbA8rdLxHP+tqq71jwpBaTJUCZDSUfO1ZgFy7
LeiQPAchQ1p/gqgo9xvkM5pISy7hj0p/f1jRTroTT1VfHKsp4LDxb71VE/S+IKQU
dYOr28lQ8IOXSDJuSIAYKAynFx8akw==
=c8lD
-----END PGP SIGNATURE-----

--nextPart13198926.O9o76ZdvQC--



