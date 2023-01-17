Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F966DB3F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 11:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38A410E2D7;
	Tue, 17 Jan 2023 10:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7099810E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 10:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwNLtAT1injsA6eWmdzidbHptsSSsJcIWlj9g/FbveajJzZRMMmq1gg+qFLYRJOcVgkKePn8b1D0ExuLHupCBbm1UoCNCAINDSOc2PSqBhTWb3mkTStMCaz0K3gPdn3LtvdYPlrqQ5mZP4oUfZSs/jbNt3bwe4X0Jq/m60OLeJyJZ/6+mOwmEVEMtz6zgsCVqB/he529QXDcTepKBrlfHQxzxI82m5+BSoCcdMGb2ZD79XGxdRRjOgZJGWPLBFUfSbqLR6CphluPyuRrI5eJ8DrGpbkQ9iz3PfFif4ZXkG3KARIadttW+5xlHRsG5xsiNiUBn1SoveLrcHslCQO6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es662uYClP/IqbjnyBJPcIz9wc9c4nf6xIaHn7hC8U0=;
 b=mhhk/H6wV+0/DfYxeWnAq56Fy7XZPNqBfW1em24AlJfHe9mQbVp/Zs87JTaF8lqCBMFmDGuTWlATdW8WM7CqbpLL7oTaAFbEAvTFhIKnaFmIGSoV2UUlLJukgIqTDaR4l+AqonesJirVx0b/RcCLc+MZu7K/igbeuNZuBAvT47jcEOvFeedN+k88tgxUBTBjcMpe9HgyE+9eNsLr8Io/bRh+a6RZKdpk1z5AeC649t07wmTQnZCAVbmVioHX1T0mdq7em1EYUe9YfmZV3pds3C+hQek2054+gRIB6FLzgkgSpTsQBh3AYuQ9F9Brkqq79u6hd10iGthUjKy5g7+gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es662uYClP/IqbjnyBJPcIz9wc9c4nf6xIaHn7hC8U0=;
 b=nkXOJfY37pgHtLp7/KQ2ks4NlluvaOm6AgLzjDV/crKrQANjUVT9LmMMDRhVeN0lbbqzTN+WIRL9OIQmQ2hgYSTA/69NHOgcF/FBgPcpzp6BNcPoB9OsscgExz1boOInHkVfX39G6C1GNk5soXPMclqNP0UgeqgeHO3r5JJjm6c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYTPR01MB10936.jpnprd01.prod.outlook.com (2603:1096:400:39f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 10:35:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 10:35:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Subject: RE: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Thread-Topic: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Thread-Index: AQHY/qw3aeqnK+DFtki/nIh8FGiGM66iwLSg
Date: Tue, 17 Jan 2023 10:35:34 +0000
Message-ID: <OS0PR01MB5922B51289D10994930F846A86C69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYTPR01MB10936:EE_
x-ms-office365-filtering-correlation-id: 4a67b251-2685-48db-4f4b-08daf87690e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uu9pbh5gr5SCMZPD8uJ9zqf325Oz0rQos8VNpqi9JrcMUyptOKEccYsXgBnWH0QJDA31OwTYxP4QaB+lpfrIghR+8uQh2Vxtyso3/gBsOziPqg+z7j7Z7rIRcGC/UThIbi+u5LJ7jNWgtk5DbhIrqCxiA0eAsPKlEhQRl70G/atY3gXg1OBb2lt2dNrb5aVyMKItUdN5pO6JO0rbGIUI6k/lG3sTk8JdXq1MLGJ1cb6c0YAqUmtQa9cez2q7jccNmHeghjrfcC8k5N6buCmVyDCRR7YKoVGBqZJTz0tbDF/TwaHnd3CRu4BST/S3bwQKX2wPcEjGCDxxd3y/r5glWISdrmoqHlR25KYlcVRtuJ9K1STK2YoBj2eURk1ZHVU589ZDS3ttWAZB7yue7eLleOadcxmpdNyGuXl899RmCnmdFonLjCGxm068Fi97u1HRP7iaA4zXD1OTsN2fTcYty9km+3ED0xbuFMRzthgAQeSzsnXzdl7zhC4IRjovtcXlAY2tdoDWw1LD7IIbXTcXWoK5cJPpfueAVg3MNtSaIEY0rhmj89g4zLYiEvPG+90KNxlWqp2IuFQylXIknPkGvusRBRSujjVuvLUCF9qPhzSqSXBx+d6Mqa4hADibFScPbID7j34eZoyliAXZry8SeVE2htDbG/2fPQ/vBPCbpCszF8P3FoB/fcZ3hBGtek5MV9oP2+Qoil4K8w8NmVhLwt6nFBcPOaCGKTs054M3flI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(83380400001)(54906003)(110136005)(966005)(9686003)(71200400001)(478600001)(7696005)(33656002)(55016003)(38100700002)(38070700005)(122000001)(52536014)(41300700001)(186003)(26005)(53546011)(6506007)(2906002)(8676002)(7416002)(64756008)(66556008)(66446008)(66476007)(86362001)(76116006)(4326008)(8936002)(5660300002)(66946007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ji2eqAjlzT+CJDo5r3AA12x9GqfeqnX4y/xab5iMXCZPylLngrdiC0q0y5tG?=
 =?us-ascii?Q?ASJvsfLK4x38H+cCrJlvDnlNYa1NtoeQsSaPWfGPLmdDWfbb3GT4UCobUPh0?=
 =?us-ascii?Q?ZrFPFaZelg4BZi1A3WvQfr+uwOa2xMYKHAqJh2MWgaCytfFWrmVcWagpKSw0?=
 =?us-ascii?Q?/zFapLrcejByrfm+/eyrKvVIK3ewrtempp5W82dJpmvO5ilPyNcz9Kzn2NJp?=
 =?us-ascii?Q?h6t18YpXqphzckE9Ce4Bf19NNwnYS2Ei0/QSS5xy3yGOSg3BY3chSjgIdkjr?=
 =?us-ascii?Q?UzKYMAhtvSY5k0cLcQDOGdjlf4WlA7SfJotcErD4HI7LLdYfXzIHBeAL26+T?=
 =?us-ascii?Q?k8L16q8IqAyRK+ZhIMn+h+6vnjyfTPWTIJg7U8MivncVedLSSQXJZdQb0TbB?=
 =?us-ascii?Q?caYCj/VkG65/A9cD3HgbZlXx4d/Spi2+k/dBMamG/J67NwMPnQNVk52wlceN?=
 =?us-ascii?Q?AsS/RkMRVo7qS7XNxHIHs08kofMkWAFNOYS+LN+SaqJgqCcp1LKEI8kRqJal?=
 =?us-ascii?Q?vJQwi5yzB0P6OTt+zbtCtR4bw3djRJko5D5AofDd35EmItt7HxerAGYQhPbZ?=
 =?us-ascii?Q?oZ8HMCygzyzSfq6cDVT+JLt1ksNar1OZkoQDKT38HqBOiwLfY5St9KJYp4ZO?=
 =?us-ascii?Q?+D7oMhNFwqyYGOil+PEPHnn+ZG23UDzNs+gPUO3dT4SsvQbQPQJnD3Xoo/c7?=
 =?us-ascii?Q?QgX0kxonu0PSmlDariZdVrJAvY0sbngwTWsNxXwQGlEhqNoyo8Hgtih/HMyN?=
 =?us-ascii?Q?8DHh8uw4P/IbrXaNPfQrx0LDHCIwzyxonoxs8TjYop81F7de8wSnwdM/dFb5?=
 =?us-ascii?Q?HTakg0DHT9ClPY//SlMPuAhASDDT3IvmzbfYmxicPuGm5r38Om/JmcFiImY4?=
 =?us-ascii?Q?LwKEf0PyPmN5jnRjJ3ME6VagoFq4Y0VN8OQzkDRyV+OfmQ9i/urczU4fSWBh?=
 =?us-ascii?Q?LaD7iGivhXUtl/+M6wCOfI8znteL+Y0oOVh4PVTYmyGraJTNdXzQ+8+hEGfd?=
 =?us-ascii?Q?mkODBbez00ghUQ8yypbgfT1S/QQHdkfksIoyM26vH8IP0bFxy1r1KOcXH2J7?=
 =?us-ascii?Q?gkG0FcMBD4krczKNdj8jiTfcER20F8d6rYA3B5bxN/lXUAt6kraIWl0iWO0P?=
 =?us-ascii?Q?Hvxxq0ezEgmfQhj5UN3aD5EyTMud4EX0YX1bY3TmSbacMiAB0cdq52h6ZBbs?=
 =?us-ascii?Q?BhKQtnbC47tHUbtSNB6CAn/AOCVO2w8xxmVHIWXDYGbK0KXUcN56fq4Jejqr?=
 =?us-ascii?Q?HkA2Rmy9ugol1UJWHilAv2mxCFVKumH46TljQmnDiuKv3rwGNXMgVujPNjnk?=
 =?us-ascii?Q?FKAxwLaX63qRQ0R7Lw5Rc7JmdbGmAYBa190YW0ZZxlXW7yMKmG5XqEFkYYZU?=
 =?us-ascii?Q?C3FvhaL3Ur9JaRFbCXWeuLsqGH905Cc+qKZSsLJAnW7N9TxjWaQe2w32DLMH?=
 =?us-ascii?Q?dS0yBLiZQSuClAKm7r3SvtRRvYzbCTmmxMbfbdhO4Sz+xXb/HB+Y/wroFq29?=
 =?us-ascii?Q?BWZiocIzXRafaok2NSXoZqacSd1hMs1E981wRHzUb6v9e/AEj0GVUD1pUS7I?=
 =?us-ascii?Q?L8EuJ2NRoYBzzkdVnB44Uai3ttYswBujh1KnurAfcEHUhtERV3VN3kv1oYvl?=
 =?us-ascii?Q?jQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a67b251-2685-48db-4f4b-08daf87690e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 10:35:34.6901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIYohxnvH4vAmHERplHWmYNh4HJY6kl3L2XJD7IUlIQPeLVh+zuOd+IFA3+1tnfYcW3R3DYjzCkpa0fhTQDa83mkghfFP7AAJdbt5x5bqKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10936
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping.=20

It is acked by Krzysztof Kozlowski and Reviewed by Geert.

It is blocking for accepting SoC dtsi patches[1] through renesas-soc tree

[1] https://lore.kernel.org/all/20221122213529.2103849-1-biju.das.jz@bp.ren=
esas.com

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 22 November 2022 19:54
> To: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> <neil.armstrong@linaro.org>; Robert Foss <robert.foss@linaro.org>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Laurent Pinchart
> <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jer=
nej
> Skrabec <jernej.skrabec@gmail.com>; dri-devel@lists.freedesktop.org;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
> Document RZ/V2L support
>=20
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found o=
n
> the RZ/G2L SoC. No driver changes are required as generic compatible stri=
ng
> "renesas,rzg2l-mipi-dsi" will be used as a fallback.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/renesas,dsi.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index 131d5b63ec4f..e08c24633926 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -22,6 +22,7 @@ properties:
>      items:
>        - enum:
>            - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +          - renesas,r9a07g054-mipi-dsi # RZ/V2L
>        - const: renesas,rzg2l-mipi-dsi
>=20
>    reg:
> --
> 2.25.1

