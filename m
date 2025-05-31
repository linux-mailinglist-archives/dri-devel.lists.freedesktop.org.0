Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B08AC999A
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 08:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0709B10E246;
	Sat, 31 May 2025 06:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ue4ggBgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247BD10E0E2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 06:35:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNDS3zLs3qsT0a6gFF8RdFWOPgE2vcAcS/eJLOLYcxHv5Ej4dehHkkweqjbZcL/zduNBTTzBCAD4De0j2AREBrPit0jeRNOVgbbAj4mkoTykdj7Yh7x+jQiMycKP/1LSveFi05ZH0eznq/o0cJAPCOgxCjk2NOUIb+L8Y/gb+2m+QykY5LNe51A8ErhECIyOTAwYjCvqlKnGp2ycIw/ZbcefdYLjJfzSYmL8fO3yZsN95WOUchWBb9tTCsZPxaWjDKgIb2BrBBg6m6GJRMleUlWjYtgyNDvuWoPRzISdsTV/QJsxNPgLUIFkfm3KVLa/U9YYxBbkWqt+VkvjGmryoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o1eXXXEzgmjkkz0QQ4tu+n+yAb8Jo4eWICx6MDW458=;
 b=MVWe/xokoGnngRGx5k9M4DfMdihSoQHQGDv3zOycXA9jbjtDkrYatCy7v+UGufBOZhWinLGkzqZ3aH7Ql/RvxMX3qk/JQ77QmLfW5DcQDB42mhc9vgt/zJia//hs+5EhcIgWZkPb7cwhHPxIyU0DVfKxRBXND/hq7oeG2coFV74LKa7rcAy2Bl8dvx3cJUDUrNrtLSKKuixUijMjPRvs/SIOiZ3SThI3VbsKprE4WgIo9hjI9DuYfUYsO8X5RK2P8hCt17vVbndjSH8MGCOLV9qsBeLoOy9RwdkQIuqX2xuud3SxD7EQMpI3CAmNo/+YDSOzdbwuUa4VbnJkR+Bceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o1eXXXEzgmjkkz0QQ4tu+n+yAb8Jo4eWICx6MDW458=;
 b=Ue4ggBgzMonyAkbXe3wA8w60ynVWuOs6jd0mS39P0EQFR1p5sHuZB+96lT6dc9jYJBh3ipDnDmngZaYHKWanWzXDv+8Hc1dZaOSK6GoFySi+idTFVBeY8pzPuW1SxLxv9Jbr61R87K6/DBSwP+9+wX1UWUXYj8ZgZttkQXQl8l4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13441.jpnprd01.prod.outlook.com (2603:1096:604:334::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Sat, 31 May
 2025 06:35:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.033; Sat, 31 May 2025
 06:35:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Thread-Topic: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Thread-Index: AQHb0YQus2i1gP2rdEqMdB2TnhipsrPsSNYw
Date: Sat, 31 May 2025 06:35:12 +0000
Message-ID: <TY3PR01MB11346CF2602E4EE4E85657C868660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13441:EE_
x-ms-office365-filtering-correlation-id: 1f0c641c-7add-4c07-046d-08dda00d4bfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ktJ874odaynwpKS8G1Zu186IDFuhGtF3s7d4GNsKxOyjdtga+wtpfIoilB6d?=
 =?us-ascii?Q?6q4soZy2N2yhWm245oTA451tXybmRurQUQedVwDPYnIxNp3LTnkRqTNSeYOT?=
 =?us-ascii?Q?dAhaf/NS1DCjzpmr3Eq1pCO1FMp7/7+G/CT6VtfIltjGx6pOABLiq2bQJ4Vc?=
 =?us-ascii?Q?Il/vVDBzftkIJUKJZXJLYqZe+aWhKRSl4lTnHB37OtWEUn/NXeHccbuzlx8d?=
 =?us-ascii?Q?esSbjQAq8J8XPkBMGZ70OSPzpSSBN/rTg99LzXqjVqDSLhd0kq9VHrAcG68p?=
 =?us-ascii?Q?SfqR9MJwDy+9Jqxdce6zAyuh0aO1+V4MdJ6WQIS3IRXYyNEEfAxSro1RmW8z?=
 =?us-ascii?Q?fqXVqNquWEkX/bhLNcJVJj90cv1dIkZB48k5Yp4re8scZXZQ/NXcd9C4oCNN?=
 =?us-ascii?Q?mF7OY39fdqGO9/T+4DRQxsgNB922QYSU9pQB5kNePXdjYfsBYTU+px1q07Al?=
 =?us-ascii?Q?Glvu/Cc4c7Ht+pn25L/5lK4w/X7NtsWPV2UCL7rYh638FduWJRV5vYZiMy/k?=
 =?us-ascii?Q?xEKUgckrsFlbgqRjxcEaJKSBj7Lpjglw3uimqh7JNwqFR8TUUAOrCqoktfWA?=
 =?us-ascii?Q?DLcXEpiC1Uu/+0SdgkKe+jnPeFovKM4F2xyn5ohodK0NNFIYwTIjsVu/G9a1?=
 =?us-ascii?Q?deyiIkPLa3PkFJfLERFemgt4B6hDjoI9h3AaE7Pn9PNj6h52mUd6CrgcCIXD?=
 =?us-ascii?Q?hABrYd7c1q8sngEcAv0q05BSWDGwtpKDp1TnE4U9tXuZNVhYgISumvh3orUD?=
 =?us-ascii?Q?/gcfElvKqAIBDG3aEhJM1Up0X3A3OSLa0fDAfl5e5SpoIribe087vO3ZATtb?=
 =?us-ascii?Q?wmT8EtkSqKa3we8hMUQX18D/t2xAR+6obCRAg0iJ0EsgIP74kGS8wJsoZ7vP?=
 =?us-ascii?Q?Fsghqdg1HDOrl9XScOkJ26IeJW7LXwhDubE5t5DL+irIK0vUAa44TMDaWyMh?=
 =?us-ascii?Q?KZyqileWfbza4FkX8r9mN5N4DVkhIhVs5tj2hgeJIzxdmAUebA+SVhDsLsoi?=
 =?us-ascii?Q?+jED0Ytx/UBn97Fc35P2x3Aw32epQfUTppJTJMX69ApbyBFkO1Ao1mPlF9vi?=
 =?us-ascii?Q?JUFKwNKXTsK7z4BzaXNA8Q5Zm289jhnMYlZETIBMgZhvXcggA8hovtGCNsFi?=
 =?us-ascii?Q?M9nyCVL7cRqZP5UUplUlKuV0k9xYJWdhx/p9Ij+zLoC6avvuC+u7AwuuGsOq?=
 =?us-ascii?Q?qPcxHy02AHzawRD61Tu1g3dF1XFkyNSqE4NZ32xbnuhFHUGVXMmN1zdD47rF?=
 =?us-ascii?Q?nXXDTAJDbSy7925TG6FLK5TfFnPAPlTx6+9tHYwu++MzBHmKgyhmtpiiWaOJ?=
 =?us-ascii?Q?XI5l1tBk4PEix8l7dys4qTKzuCRsiXcr8yRmQzoKqwn23DDiMl3irP+1En7W?=
 =?us-ascii?Q?WXaq5p5WTByuz/Gd/E7CXKsO/nsdAPeB/COKTnlO3hv+fefee0NARGYx00xU?=
 =?us-ascii?Q?7wi+mpU5uOaM4aXm9zGCHzARskJwI8kF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QjqLnN2H2BkeFU0HTiCgxgGsTMctp3hbGOKNfAd2XU/ew9J8mqsAWgclsi/C?=
 =?us-ascii?Q?TAk2w6dDgIn5XwyEdEo3ruA/9kxEnTNkw5aEuVJtAneBdzBon1Vlud+931nQ?=
 =?us-ascii?Q?OPZk6ImylXv+7wmI7CEASFw8cUVWSmbxcCMj7fC0F9a3/YvbJLL0mJAwqree?=
 =?us-ascii?Q?rsirGu0QHXWw2buwbU+k3P57MB5ecCdZwY7RPsIudgktJ+QA7JP55UahG0ZE?=
 =?us-ascii?Q?WA8XeN1zoC+fLneGVa2o0oPCNg/cXNucB2lWjbNkqedigJg4qu5ZQ7jhf8c0?=
 =?us-ascii?Q?wDRtCZvL4Z+iH4KEc9N+bODmgrhQhIloWnh6K/FkvCgKdwPHnlXl2OAAhwL6?=
 =?us-ascii?Q?9g2FwwcXEPnCoZ+RvsjCZZkYq9dkFDkH6pJwbxiPCwAviE5hRONm2cyYc7qu?=
 =?us-ascii?Q?d08cwSnjCezXkEdgmovaHjbmI8VBK1W4GTvUczdt4SGQzOOVDAMaok2Er2Vm?=
 =?us-ascii?Q?NyiPQj2y01GY58VO6UdhFApCX+LrPj50XMr5mb+UE9KA7ZtZYzfdkD8vgyH6?=
 =?us-ascii?Q?T9gT1WHItipnxpdjB8bId8rulS4/POGaZ2nSP5bXMps8y8cXj1oLmrXHwbrI?=
 =?us-ascii?Q?0N7uLZlLBCGhLiHU+XkzLjB9sA+SEQdH0HKBRuqvBBrCP32wVILBZCoJA54K?=
 =?us-ascii?Q?lI+1ZDxIsgaEUF8LejVbkSG8LdJBV/A0UhaGBdSIABeW2TX8Zpl6pZ6TPoZJ?=
 =?us-ascii?Q?Ug1TpyxRI3h3S5XxUpW1LKAPvrMqy285socvEC+3IcVovoB37wC+ze/Qt6kr?=
 =?us-ascii?Q?MnqjS1pyCK7pubnxVKgIXZI9uAVw2V1IlbhZfeJE3fCtbNtNwi5q6smVnQA8?=
 =?us-ascii?Q?Y1mpxS0K4h7JtE+uUYnJgS63HhTi79bq8TdW2ld7/7XdOcvzFEI72LIBGaO3?=
 =?us-ascii?Q?kZfuMWJWPn7cpEgeTY/RtOkj8NGdZ5h50+DcK7TTG1asGE/CkNEWrd3qxlmS?=
 =?us-ascii?Q?1L77OWjZzCIlrQH/yrjrNLVFO0yLc0OJmwTs/Uf+1Kp/ODyWcJlLrxopgt/A?=
 =?us-ascii?Q?60aZ0Rfd7M4LmPmy44x7yU3cCdoW03aCgHz6KTwAdy5L8UOs/1JPmeVuBnSn?=
 =?us-ascii?Q?CbmwtfcYXDPGNJ26rZPZUBn4h61enOC34zNbqkQVV5Va/SU4QjShKvkwaGXk?=
 =?us-ascii?Q?1BmA3oTy+0ImvH1KbhGpsVIrcafWb4A8uLY58Dj26X0nvx+KimZf9tG5YlQ2?=
 =?us-ascii?Q?4pV7W82d0gvKktbX195d693zILXZJjqIWKn09DBOWxBslCHcjZMdp5jSDodc?=
 =?us-ascii?Q?tqKv6voFrku96VO2RzYckMh5ZzdsTHxQDhjezclKGP0mPtZMQu2N9yyOiK7p?=
 =?us-ascii?Q?ZlBkNhILxbDzWShKd5artqoxeAXI+EYJOc4k+PvyU0bHJ7t6R6iU+JplrApp?=
 =?us-ascii?Q?6VCtKg2Og1q47oGI43hHXOr1wO2NkiFH8KP76cb8W0ds8E360J/+Uqr8roPb?=
 =?us-ascii?Q?c27+j6ygJv/uhbp54KhBVbT85zfaXqZv36DX1kT1HFideflR2q9FePcjw9B2?=
 =?us-ascii?Q?D33j42/v6XhrrRU87g6ECSQu6BIEYUz2TN9l7vWE1zMI5GOn9HunRsFMqazp?=
 =?us-ascii?Q?tTpwBX0uxNr1Z/Sxl7JRyIC2mv/aaXzuUsjmXsbV6y93XHYdnU6RksN2Umah?=
 =?us-ascii?Q?dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0c641c-7add-4c07-046d-08dda00d4bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2025 06:35:12.6025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygYCEy6izST1/IUm59cDLGoai0bgZeX3xvanyf8yuEhWa9t79otAf4n/4zUV01grZuEEwyHZNO8Y5n8+hwSK/FPW7e5MwEzI9+ziYQn92Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13441
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

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 May 2025 17:59
> Subject: [PATCH v6 01/12] dt-bindings: display: renesas,rzg2l-du: Add sup=
port for RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The DU block on the RZ/V2H(P) SoC is identical to the one found on the RZ=
/G2L SoC. However, it only
> supports the DSI interface, whereas the RZ/G2L supports both DSI and DPI =
interfaces.
>=20
> Due to this difference, a SoC-specific compatible string 'renesas,r9a09g0=
57-du' is added for the
> RZ/V2H(P) SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This patch is already applied in drm-misc-next [1]
[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Ded6a6d63513ee519=
9841c0a0dc2772ad944e63ee

> ---
> v5->v6:
> - Added reviewed tag from Laurent
>=20
> v4->v5:
> - Added reviewed tag from Biju
>=20
> v3->v4:
> - No changes
>=20
> v2->v3:
> - Collected reviewed tag from Krzysztof
>=20
> v1->v2:
> - Kept the sort order for schema validation
> - Added  `port@1: false` for RZ/V2H(P) SoC
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y=
aml
> b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 95e3d5e74b87..1e32d14b6edb 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
>                - renesas,r9a07g054-du    # RZ/V2L
> @@ -101,7 +102,12 @@ allOf:
>=20
>            required:
>              - port@0
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-du
> +    then:
>        properties:
>          ports:
>            properties:
> @@ -113,6 +119,21 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1: false
> +
> +          required:
> +            - port@0
>=20
>  examples:
>    # RZ/G2L DU
> --
> 2.49.0

