Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD146924276
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44AB10E631;
	Tue,  2 Jul 2024 15:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q9tMwoyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2052.outbound.protection.outlook.com [40.107.114.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192A010E631
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5k33iQrtrVMiXw+eHzz0FtywdbOMmQWNoN2G/0UaH26DB8IRQQBetFZRC4ZeIOAlmLTCMadLLE8+nbdEpPIEwwaiQDF2iyQYyo1tCWBAt2kACXt1VZG1Dsd49wb5hJlB5nHyW5BCmZ0lKtXLttqlyd80ihXeh9+OKrBbiQFDsIA3Axp19QgwPtRHzD2D2z5aWjDUjBfEnvFnoojA7D4cKjN8sQIqYPN9FSICklDPrDOL3SWbIOG2iLJeYTXNWOISJk//ZXHw+VSHmPpifpUOPLRc6rARfAIiiwMioJqz9GOWisSFHBaI/a7vOk6QcP2pZoFGjjCGfz4ZV8sq8LtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg8bpqy6sIFuZRFQVvJ7QexJtmL4b3xTUdcbBO5B+Rc=;
 b=K4hOtzviLzmep9ERND+II7qRUmB6EX86pSb29DVNU+L2exvp+SNQ6O5VXaQwJp2CJjAkMbne1CQD+b781DkEP7GIY2+T4z3Gwnm2VO0NUzdhbDMOsdh1LsP8AisJcv7E0PUb+cdV/h3REZ9rEY/0WVuc/3oLBxhBa0RjqzMW0mlsVVzCOUyKzOpwvtJOW7WfqF2/VVx6Q6wQbWB2/kbP7+ODFmV7I1a4SZibZiP9Ae3VKHKY48gYLxqMh7OKcsTCvXlDnMw/6EAWOjIz8uf1sQvScVPWoKsSAavc7735K2/5h4lFiAPkm7tsNq3WsR17jOdODVbj7qNY9+vxKw0lYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg8bpqy6sIFuZRFQVvJ7QexJtmL4b3xTUdcbBO5B+Rc=;
 b=q9tMwoybHJRUhdzkl51+jfKYDYF3/T3fwb4SO1lizElgsuUF6fHFmRZ0CivobL2oQtYfSqB9OLy9kzQ9RH9STgH7yDe5dCt6b5b0rUBIKKJ6oSB+Z7sJh6JHycIto7AtVtz+Ar8YWJy5DDKTJeSjU7MDuY4MiPVGgR9gTfDgBaI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6249.jpnprd01.prod.outlook.com (2603:1096:400:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 15:33:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 15:33:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Topic: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Thread-Index: AQHazGTHQ9cZ4EeqwkOBDVP4aUPHjrHjha2AgAAH+fA=
Date: Tue, 2 Jul 2024 15:33:17 +0000
Message-ID: <TY3PR01MB1134627D95970A6B463AC870B86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
 <20240702-choking-glitch-d97191325ac7@spud>
In-Reply-To: <20240702-choking-glitch-d97191325ac7@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6249:EE_
x-ms-office365-filtering-correlation-id: 605e5dc1-6fde-4368-8136-08dc9aac4baf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?d9qDcx3utPGAAJz8JShWuZDi7ayreIPbMyPOSCC/eJMZn6bFJ++ULu4lbNEv?=
 =?us-ascii?Q?++2s1MfQiCmy9H1o4XYMB3YwOEnXbwvpIwYvtIP/nAb6r1NI1c3/LyIqgFPF?=
 =?us-ascii?Q?YuBsCVoT0J+Y+egyI+7ttcaOzJ30ZQGtwD3Mq+HAGuK33TlGUagvsbgO4mM6?=
 =?us-ascii?Q?/I2LXpqkPeNjCt3rczjT68qHMsG4AFazDgQ98SYbDDhL7cK+IvubIWL7QayC?=
 =?us-ascii?Q?6BZCvkiwAxUJ50mM75pgzWp3SxrN8+TYRJ0cCPlhGNYq6QQNrcm68V4YV2E/?=
 =?us-ascii?Q?7JG0ctbw24bVkszqmjavzSNVyk5Wt/nJPxQo+/vCLEClr+rB1aM5Q8h1T1GM?=
 =?us-ascii?Q?rZKLtAGeOLyQ3czHwCOucb4dGsIEGgWHBr1JxtNvLYn1fM9/Qai8+f1sUQZc?=
 =?us-ascii?Q?CrP6ASW1qKJ+lCagCt1eH8200IHOptqm2D/Nfh7tJZR/CXZDScina36ppiHI?=
 =?us-ascii?Q?r8X/lZ7ypoD4CHOHrdw3tq+ODkwoQFbw1db65ZxcHo+JIUIlUvdL6kJInaa7?=
 =?us-ascii?Q?uVT+lzIBoMHSX6HgqiEw1uSZMTULoGIsHtLTnBiDStkkJOuLjofl6N0C4OPx?=
 =?us-ascii?Q?+BJ8nPJ/K/knogsmBGoter/yGXEO2Ir7vdAnxtwvQp2+s8BS2k+ymtyqhm0r?=
 =?us-ascii?Q?fv5cmHBZt5DkollfZq4TfeYMU3LvkkVw4VZFMUQsqz6iXc5lHtducYjiOSx3?=
 =?us-ascii?Q?Lub55JuvNWQeujsVuYUHhpyO3SMXHULx6bAO640o+nirIYHQqh5AQAgheYTI?=
 =?us-ascii?Q?FvcKwCS7/+/gb5yPPO0ejalpBjb9O0soDw7DsDGOfdCURDOcNuW6ZDZMx/qD?=
 =?us-ascii?Q?Gj5ZYXuKw7jF0yXq72Zg9sh92zPTjPpPkJCmIy/rJKcjk9vqB7iaRyGQQqIH?=
 =?us-ascii?Q?dArlibmkYHUEAuIneoSl4D9EgrXEewGbLYiTmHu9NFQLGP8pwtxlZ2YutY0E?=
 =?us-ascii?Q?1mwh0DQjiDdjBD7x5kOy3X1Mmw2fm9lVPcwBRU7MXH+OUAcyYd8shGcwfnRU?=
 =?us-ascii?Q?kUnNH3fJ8EPsFqj5bafi1GJJfoR19/B0P03HO6uimKHyvThgpgpNUG35cq0a?=
 =?us-ascii?Q?spHjgMsTauGjPKJsLGz4HVuNBV3o6hVBbwIicS+L6u94wJ4TBSIidxPhj5TG?=
 =?us-ascii?Q?sAwpgXi4HsKPYi7CJUCO7QONh6J5sJ94K1Jho35lKk9+JnnHUgjfx4FEUeHi?=
 =?us-ascii?Q?6Ir8j0fk2l0wlb1SLIr0FHEflyw3jNB6jmVEoc97cbHnVN7UettoEURdiw9E?=
 =?us-ascii?Q?KcZ72m2uK+Dq3hK+yQ8mF8dBotNwriszfYMhEpuBXW6Me63b26OJMYDg9YUI?=
 =?us-ascii?Q?1XQBIrsA8X+XbNc3dBHSMPzhBZme2Qcy14Z0qi5OkHyl3+RneoWeKAnr5tVY?=
 =?us-ascii?Q?XkZJjyo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l2EPv+CJ2H48qKzhsOqvIuLcJ4pkxYFuTBKypdfW/TLJNyyzNv2GfpxL/epF?=
 =?us-ascii?Q?ZnnRnbnJ5UiJMdT/gx/i0+voVu000n6ePvuXQSJKUfxksup1ErM5BVBm50kp?=
 =?us-ascii?Q?EJexRslQ58DTPEQoMiWrom9iZ5g+tIt5MSY0Mf5+N+8/FsIonGW0JwTEueGg?=
 =?us-ascii?Q?dilcQamTbHeA7Ybu29x4iUS6TrVbLVvud3DkRe1JtLxMKfoeaoVM2TYxjSFq?=
 =?us-ascii?Q?+g28g08o1kgDvebW+bw5Z1AyZJEiMxAxTEF31rrkrAkMkODXXahZtJvXOwvU?=
 =?us-ascii?Q?ESsfoRNK7kkSJB6Et3SDHzpqvjmw75IW91lLBRd0A0i6EQByXJ/LXoklVX+F?=
 =?us-ascii?Q?E2eNzVwdkqajoD8kboISyTHe/kLDrKctl+TY9J5M+GGndtxbLdRtqxxtIpsQ?=
 =?us-ascii?Q?0o6WXlR35ieP4mOHOwqBvDnRtymkDtehEyGzbSV6DEOl+4zjCvu9jnm3W4MS?=
 =?us-ascii?Q?kQyIqoCAm3FTLLM1XCAPtk0nJATxchBIgYIq9s+YwuegfS+NCDmOqIPLBqEW?=
 =?us-ascii?Q?ROp1PJ6jKlTQAZQuJPf30oabpgfOFOIuyh0mm/uL9liE863vnYtPxtOFeRhT?=
 =?us-ascii?Q?RQyD0UcPTRy0GYDfohQMfeq2eA4f37Cchtl4J6IhIXUK4LDIc4pQmLZjDpka?=
 =?us-ascii?Q?8cynVwP1BYEsPdfkHhcZeNZ7tnDDyPrsYVqVrN45eKfTBKmkhOkpj5XKS7Oh?=
 =?us-ascii?Q?dBX73An5b+bFq6zvnQOnaIXUEd8FJVMwfGkuXE2jr7yxqCoRQYlVrSq6nLZf?=
 =?us-ascii?Q?M4TvvoOLCazHjpc02c6bNC84bQvS2M5ToQIf/3AKN1LTJRNq3wHDpcxhSLXg?=
 =?us-ascii?Q?fspXLg/TVsrsLOZXYl+CLygmp4t31ykReKyfenVXZT6YOVaQg1pBDlOwLUYs?=
 =?us-ascii?Q?Gnfh2PkCHDMUPzp7HfigdsY79i0jUiJPBYsiubufIynLfWfsUUD0hhDpPP26?=
 =?us-ascii?Q?ICJ5uqgBNHHRWK0tvsxyvoEQI7AwUNVzgRi1IpLXDCinF46RCd3yv+dUMxJJ?=
 =?us-ascii?Q?qqNOkM+AxwJLS3rJuQ9bt4u3UIlLC1HA2JjlVBl9rBCjvqMBagA8dCbpRlRt?=
 =?us-ascii?Q?HkZj18OoPSupnTNn8KoaQpNBAZRY3+sHsiEJCAyc+N3atdf+G8yAGOqZ3C5X?=
 =?us-ascii?Q?WbDxO/JjlHnyhkNP8NKqHohoFGvTE2PGGN3kQkjYGUQfDjyb/yYMo0h+wTph?=
 =?us-ascii?Q?pgiBskJ62aC36gs6cOpIRPf2yz6mX53deL0W+T5zPyufwSmRD+pnl76boiRM?=
 =?us-ascii?Q?12eOTG/SOX2Jn1g3/WFnHQSkQ3shNQ3xj95Qd1rrzTp/ZJoaWYXfHJiJcFfY?=
 =?us-ascii?Q?dRpdtDGPDWg68wtmke2ZedS0315H+QaTJnsHHw6i53oSTrHIzB6iNMstdJHS?=
 =?us-ascii?Q?UCNS9oMeq0OhbbqaWJBM64dyThLpaSagUzIOY+ojS7Gr8VveYsL/1n+iUPD2?=
 =?us-ascii?Q?XNN4mBs5uhte0RTUIUB2rAp1sZKN1lZC1bhJWzXyV0dOaTHt05Pu4VfN0HgS?=
 =?us-ascii?Q?O13TPRCv5yj8dsuWPIt/mEOADyxCXUJ/qkOck+10bilPkCDa/nFI4R7lOoSN?=
 =?us-ascii?Q?HpUAIobbiHg4ZQAYI0fK4IXDnsKVOoSCk5o/e7x4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605e5dc1-6fde-4368-8136-08dc9aac4baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 15:33:17.4168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3CucRlafjwptPoVQFJDBMGb+m9FiOPsgvYRM1dK8o6C3WoShfI9DrxvjCozBsHD3QBrh4wBI/fUdhzPQIiszyUcu3NxaYtTFGJSA2z/4KrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6249
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

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, July 2, 2024 3:51 PM
> Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document=
 RZ/G2UL DU bindings
>=20
> On Tue, Jul 02, 2024 at 10:46:13AM +0100, Biju Das wrote:
> > Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> > SoC, but has only DPI interface.
> >
> > While at it, add missing required property port@1 for RZ/G2L and
> > RZ/V2L SoCs.
>=20
> A new required property is an ABI break, it deserves more of an explanati=
on than "in passing..."

RZ/G2L LCDC documents both port@0 and port@1 that is described here in [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml?h=3Dnext-=
20240702#n59

Unfortunately missed to add port@1 as required property.

Currently there is no user for the DPI interface and there is
no DPI interface support in display driver. So, there is nothing
for ABI breakage.

I will mention in the commit description that
"currently there is no user for the DPI interface
and hence there won't be any ABI breakage for adding
port@1 as required property for RZ/G2L and RZ/V2L SoCs".

Cheers,
Biju

>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 08e5b9478051..c0fec282fa45 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - renesas,r9a07g043u-du # RZ/G2UL
> >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> >        - items:
> >            - enum:
> > @@ -60,9 +61,6 @@ properties:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          unevaluatedProperties: false
> >
> > -    required:
> > -      - port@0
> > -
> >      unevaluatedProperties: false
> >
> >    renesas,vsps:
> > @@ -88,6 +86,34 @@ required:
> >
> >  additionalProperties: false
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a07g043u-du
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0: false
> > +            port@1:
> > +              description: DPI
> > +
> > +          required:
> > +            - port@1
> > +    else:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: DSI
> > +            port@1:
> > +              description: DPI
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> >  examples:
> >    # RZ/G2L DU
> >    - |
> > --
> > 2.43.0
> >
