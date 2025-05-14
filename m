Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AADFAB62AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 08:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F010610E0B0;
	Wed, 14 May 2025 06:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i0rwXhr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE1710E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 06:00:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onOIvHX4QM/TyFjIK5279vaZEMhJgjNcBUs6kjlVU0YaNFWv3eT5EeR2mZNomgQtF4KgXjnOajyXtz1i9bLruutqMmyw+C720FXsgHmigywua1g52QM/S/NzTPL5B2DnXdWkiwnJTpSObFr5UZEPlgF7vE9PHPmcMt/jpnTF3D/+IL3E8e6WeIp4flZF987Je6IXO3VWaBHCsCCoqT5+HjK3iEuEv1Xpb1wK1IFmp0+RaTqo7EcRAsB9xzSQHEKrtznb18v0rbWtUuIyJ34VfDIPcBbEsg+NRbhRjYHN/1NUfmR+DwVwMZ6BmoevoGP1/Oe0PcAGj+JHe0qbPsMylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwr2l10hT7vj7n9Qor48UPQH4duDjrsr2oximSIwkz0=;
 b=ogaizgS13qA+iLWZrgvYbmJuAHHl388k/U16Z6atvZ9fUqEpwS4CC2GP1RSXPQT0pGQLWjUEq2dZOuslMn2C1vukptFt6R9eDZAn/76uU/Bz6GKqrAP3c6Idg0eWe9RUtGc7hGsvuObHzrpfp/aoe3QGdENklP75ghanHvlU5/GtOI6hW62wLcdprsUcIaB8tNKPBn/jCjCHS3qcET8ZIQiZdluBmC39NSuJKEAVezbuF03m+sStONVYPe+oUqnBzu/x4BOUp3Yo/yNHtICjcOvLL3mSeqF+yasbb68QRe0Jpp9NM5ZOwSJoHUNIb9ZUTjziJ7h9Y1KUGnsaoEzSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwr2l10hT7vj7n9Qor48UPQH4duDjrsr2oximSIwkz0=;
 b=i0rwXhr7X0X1ep4JfBn+WcS2zNdT1Qpacstz2ir36WX6s8WuaOnv8xdFtpsaCdHWE0NiW6S4DqQyCa7Zd1FkPK/yJThZh2ZVCEZDEu93v3sQsYMHFwZIFLgpVn/Q7l/0TY2NlDLnNXXtfZoBLJtzqNvmnZw5QTJUFGqQP0zbrqk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9389.jpnprd01.prod.outlook.com (2603:1096:400:1a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 06:00:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 06:00:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Thread-Topic: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Thread-Index: AQHbxCNbbj/vqXhFv0qNrozmJU7P7rPRojhw
Date: Wed, 14 May 2025 06:00:28 +0000
Message-ID: <TY3PR01MB11346612A2A298818D0787B028691A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250513162300.532693-1-hugo@hugovil.com>
In-Reply-To: <20250513162300.532693-1-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9389:EE_
x-ms-office365-filtering-correlation-id: 316e2c4c-ac53-4740-721c-08dd92aca0b7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kvKZvYmmJAYh3QAGv2QqGxz7El0qO3S3QCNM/PwjoqaUOd/wDGpwe6vj3D7r?=
 =?us-ascii?Q?/Gh3pOTRQZy7530wHVHhUfQYjao3cZnsTWmN7DXmGviMGjwYp9lvGDmZMmIJ?=
 =?us-ascii?Q?MltjEq4w2WGZNWqVAcVP37/cEp/mZV7mQKxTWw6oL+JVLyjyT+VEK7oISkJk?=
 =?us-ascii?Q?6yAjc8OwoWqfIdlfUJwlMWIIUZjEUMFEx7UvJ6jk9CjAW8ydIBlHMv/VdjmA?=
 =?us-ascii?Q?NDlqMvBKu/9ocwWyFeLaxahdU7CkC6nQOLr+WhtpJ1BuGIisPdajr19pMrIc?=
 =?us-ascii?Q?E7tTpUyS5gj7BunVF/giKFX4AiU8TVakaxQwgu9jgIlaXi14CDYx+7Rc4o8I?=
 =?us-ascii?Q?aEcpqJRca8MYJb8Bkd1oj2rB3nYog8nWN0PSVkmvD4+/CMuTnoSMsgZOaxmB?=
 =?us-ascii?Q?SD1mf8kGqNIpmrMUb9dr6zJxurbK9ceDpGLbprlbE1FZtRsqEupoXfLQGlnc?=
 =?us-ascii?Q?wkohHSjnGjZx7imNwOdI/fWH1e+UBc+CCbbX1opo+Zwi3lp0ibV6vs89UAlE?=
 =?us-ascii?Q?lbO3wZ2WFcra/WSG3jbD/V92Zia2zh6Zj0e36jXaWi72StUQ+Uk7plGvPf/f?=
 =?us-ascii?Q?+C3wIRU8ezqujvL1X2Q96hIxJjsKXku63d5GMP3fr1swcJ1YtJyNrYAmIcFs?=
 =?us-ascii?Q?okQuRJsz1DRH0Gcyfampw7LtXGHMncPpypcuU2Bvs4e/fCpqSTpNONd91C+o?=
 =?us-ascii?Q?pwL2yCnmTzG9nw7y4tTi2w2264TT0ze7VRu3iSqIPTmmqdy79yRwKpWC1RDn?=
 =?us-ascii?Q?x2fDRM9I7kx6f2EvCtVq834iSbv3LHCWwcc9R3D7TYT9WmOBBOk7Rui2P9yD?=
 =?us-ascii?Q?DUzR3ZI7T3DeublLrgs1K/awcWMF9QR45vUGNt3RFtNKkENTjRy/bn+WLked?=
 =?us-ascii?Q?UFB3Toulvs15d9mtav1xsLdY2bzEWVWMG3XQrTA0GTl3Fiz3QJidr5Kdc30o?=
 =?us-ascii?Q?V5zyEZuHbzfofXfdWBfQNOwq0mrry3t4aM6tYL65xQn6Movz1NY1VWAadnHu?=
 =?us-ascii?Q?t5HV4i2B12u3s68o+v1EUPx2b+vzNhnZQ3Z8bwFIVgyy8O16bGZpFG+5gFuy?=
 =?us-ascii?Q?P9vyN7PZ/iFJt8AEeQyX3bzyqhJuLiZwW3DwfhyNX5VdKSzg+aIyDaTTME12?=
 =?us-ascii?Q?vHuDA2UsuuTgGWroQUkU9pa4I2LVRazkKbTi/kaNykYj2ZfUvHDPFbMvat2V?=
 =?us-ascii?Q?B+VCahqHZI2t0+LFJNCQmh3XeeKBZ51UljKt0An7h+joaTts4T15nYGH1t8s?=
 =?us-ascii?Q?23L51mfQQ0034tqSdYMMPToEzJR5JeVFGpJPZv9YuuisLZ3D9wPcnxpnveCY?=
 =?us-ascii?Q?maamE6GMMd7yZzqJAoIo8yIX8p8tk4hlnx16M5wYlEXkp7FRsg9B+6PJJHFa?=
 =?us-ascii?Q?Ccemw5N2pxLGAvcn/OaCpjXeAHJOiaQI2anr1XMo7dMg2lVgJNyRdhwqXZKi?=
 =?us-ascii?Q?9gKcbq9jHtS4I8xfwoMtFqhILh+nMVGP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rk88DTxyCo3fF88MThFw1HwfUDcFQfLgRqUnz8+UO9leCCRsDXPQ2brEWdik?=
 =?us-ascii?Q?RfqYvvUBpnnH2CGnXq6vNVwqHQGGhiPhgvi1gsMO0LQl5M1R+RFQeQsuDno1?=
 =?us-ascii?Q?Q9vg1XHnBQKd1HhbPLVXPPRx8d79jiCM+bzFnDXk00NjieOkGg60KvhIAKdY?=
 =?us-ascii?Q?rr+annaQJRYKzY6p6B3DLSliHwXE06u0KugndNheuzXDzrxos3RbmznaOrrn?=
 =?us-ascii?Q?h8duIVFaOUoUxCSaeUXNwZkgv9iLQ7O3Qj4oFsQNyAhmCRVsxjURfDRfcqMb?=
 =?us-ascii?Q?IjWYb31QVxWt1fU3TGEypecdPpa9hj1sKJ0NN19LfrqfOTCG7Z5REawMStXz?=
 =?us-ascii?Q?FtGM/0AXytHMCNAe7hb5l4UkDZVsr1J674po9n4LfGbU6lpmHLskjJTRl2tu?=
 =?us-ascii?Q?b5mJCfnEjVK83ICQBCpzFcQDCatPA3enyN10yzd78sA5o4CtkYk8TgWlhCPG?=
 =?us-ascii?Q?ATJ+4Y9rbSGMyH9K/gXaajnBC+wRJ9WXeDQ5hvrSfM/S/V9MdBf9+L9ocZt7?=
 =?us-ascii?Q?jKZzOxktE/Mq+nhj8lyMWcrUgDfGvtHFY5aFCDIi+dNo4HLRFFVdG6fQ+kwh?=
 =?us-ascii?Q?xJoKORfXUlpJgfecLZ0w9A5P3RzITzeDcXN2VSLiQBYOn3sDKU5dpMyCvW5/?=
 =?us-ascii?Q?5EwKXHlcLUvPb5rgHoKtqbhQZWWGGO4bTeovTI6i01id9QwSkxyGuToa3heY?=
 =?us-ascii?Q?yhB4FbUTFOgwszNh+YNdS8Tkz2UNyfIo/dS7bjJCdYEJ7ATG2HFGQVcCX9B2?=
 =?us-ascii?Q?DSHq8XMwXnOC1BL7yY4OvlGT3Ev3QUPmY8OkHy5QqV9x8K1j71v6Kw9s03tZ?=
 =?us-ascii?Q?X2rsuRPp3FW2GwswFjClRfG6Cf+xw9rkF+RV+yqea1XJpF37M6XNM2QQwal9?=
 =?us-ascii?Q?ojYPRwF3/gCVgjI/+pBLcOpU95CYOeKpp4Ci7A8PbOIAuFLpMWW7otTK9fPe?=
 =?us-ascii?Q?V84NWTqlLA/dH13TBDAZuKQgaigV/qNvYMwCxzNnPa3+ayJ59iEui04Ct/rc?=
 =?us-ascii?Q?gXP/XyTLaRkQNwRqeTBcZgkF/0ey2HnQEPezoZ0qMrKHZTLs4yiS+MIKU5HH?=
 =?us-ascii?Q?v0NUKDJ6+eImKlFDPWWVyNSG26QPaUft4s/hAVwCJPDqsEqsvdVRDwVHLpHn?=
 =?us-ascii?Q?7KMti+u8qckq3e5PPfRVWoTmjsOiS0EtK796mjNZqpD89E8/EwlCdnvUBxvE?=
 =?us-ascii?Q?RKaqhQ/C1b4Vp7wEkfDksbqpgwabRCo18F6vkaXAIfsYn4I1UBbVzmQbu0cC?=
 =?us-ascii?Q?B+jcGDSlABEcBccMkxnCRDUBRwAzUHDW398mahznGkdzAYoPD7a9x8WUrtWJ?=
 =?us-ascii?Q?4uqK+DRAkPYnG5z6vfkvr2mfQsI/Y+M2KWt5gKvBW8kZAygvpsj/Ylkl5PbJ?=
 =?us-ascii?Q?yQqy3K7cql/YFbtRt02dMOZFCaSBJEByF4TSKwf+1BnL9VIGr0oaoEbpVaDl?=
 =?us-ascii?Q?xfN+eXbnu+zkHp0ehGLQ9qCG2J5V7gCKJofd4bkIlItuMEGAjAIrocGZ0X0E?=
 =?us-ascii?Q?GU4qIbKBGPtMok8VQW5nQydhJ/dZKKxku9eSti8+/fDAPPofvbbtsO1mrlrT?=
 =?us-ascii?Q?eOIpNJliUnMCNdMDCKS3RAS5bXXlGEpqYn+EqPu+KazJnUP0w4+W57ebWzXC?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316e2c4c-ac53-4740-721c-08dd92aca0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 06:00:28.4746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ga8CrhkCneFBm+mYSp2BeNL6jjgFSY+/1gb6AjYBmt6rZ8/FzbEqoQmfZtL+aWBKzH0JnFm7a0L+snTLJuCIJEno/KQlXCdU51zzNKoUvjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9389
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

Hi Hugo Villeneuve,

Thanks for your patch.

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 13 May 2025 17:23
> Subject: [PATCH] dt-bindings: display: bridge: renesas,dsi: allow propert=
ies from dsi-controller
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Allow to inherit valid properties from the dsi-controller. This fixes the=
 following warning when
> adding a panel property:
>=20
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do n=
ot
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
>=20
> Also add a panel property to the example.
>=20
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi=
.yaml
> b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index e08c24633926b..e0906a46fb118 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -128,14 +128,17 @@ required:
>    - power-domains
>    - ports
>=20
> -additionalProperties: false
> +unevaluatedProperties: false
>=20
>  examples:
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/clock/r9a07g044-cpg.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>=20
>      dsi0: dsi@10850000 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
>          compatible =3D "renesas,r9a07g044-mipi-dsi", "renesas,rzg2l-mipi=
-dsi";
>          reg =3D <0x10850000 0x20000>;
>          interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, @@ -160,6 +163=
,20 @@ examples:
>          reset-names =3D "rst", "arst", "prst";
>          power-domains =3D <&cpg>;
>=20
> +        panel@0 {
> +            compatible =3D "rocktech,jh057n00900";
> +            reg =3D <0>;
> +            vcc-supply =3D <&reg_2v8_p>;
> +            iovcc-supply =3D <&reg_1v8_p>;
> +            reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint =3D <&dsi0_out>;
> +                };
> +            };
> +        };
> +
>          ports {
>              #address-cells =3D <1>;
>              #size-cells =3D <0>;
> @@ -175,7 +192,7 @@ examples:
>                  reg =3D <1>;
>                  dsi0_out: endpoint {
>                      data-lanes =3D <1 2 3 4>;
> -                    remote-endpoint =3D <&adv7535_in>;
> +                    remote-endpoint =3D <&panel_in>;

Can we make panel example as separate one?

1) One example for using bridge device
2) One example for using direct panel.

Cheers,
Biju

>                  };
>              };
>          };
>=20
> base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
> --
> 2.39.5

