Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB89AA8669
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A62D10E25F;
	Sun,  4 May 2025 12:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="O6FRDaO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4879610E25F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDoeNVJhmxXeHUOD+tP3CJUbE6Fa9ans3F3oyOGWFIxUDiXvHQTk/2UhLPnxCeN28AQpCYDxTdkBXBXBn0WK8yRpbIf03ZriAKqTIN0n5LbamF7vmu8JT0+p9bvLFg8LJXHl4uEFLz1v0HCSPVjdwlgQ6kWEIecZ0uZZxrjDgQKZcJFtOeFfWWBye8JP2dIcqqBqIcHRNrzxWye3JzMiPTs3G9B6DjgYPNQU75wTJ7fBBFgI58kbVVGlw7LCqG0e9NyGzgUllL0dZqXHjp8nlFkiifj/TvCCYMkuRrCCVlnjaVKpcG0nWAAi19D6WzWxJyDMXyqQe4sOtT7/uD5QXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRokarheRqSc4iiN+IAsZ6MGoJg4v+PQCjiovbCd51A=;
 b=UgNglw6QbOX9nOqUKpuaUYwWovBCIg3jtjUMDrdJjuS7jdG/4HzhKqFCN+GC8tc5o0EoA+JW8rIY2ekods86rn5nbUpwfHNF+pW/VNoxBuhPGPPNm7D39WRcHpJioGnH5YsXGZh5/BqWGgi9GjaJ9Du+l+T7CNnv4JlfJsjbF9nKwbDYKnzFuGo7afLEeaMsTH/DQfUVNFvI9725E9aJXQKE67c9laI/L1PF7Z376Z4W55bLFSpx4kGoPw26O7EQ7F9GlG86Tc4GAxQvs/QUdXhIJ4lyPsjKnX3CWVuTXi63jKcOVUq2YkUsdM/pFx34kYczM7TfCcoOU9gRcB+F3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRokarheRqSc4iiN+IAsZ6MGoJg4v+PQCjiovbCd51A=;
 b=O6FRDaO1gRjixns+lWZ2y6jrrwWWjtjx9Mqslv3DV4PvLrSNcIKNtKR10LVs9Px1ZYjb+s8llQWDSXQpnC6FSP7sMmix+FaclzYfMMyZDzN2MRfgeXSDi9lSLyF4lQ9AjX5sRk8Bfs5gBL6y+/MiVnBkKmgLFDGYB2hxL53ybBM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7108.jpnprd01.prod.outlook.com (2603:1096:400:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 12:51:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:51:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Thread-Topic: [PATCH v4 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for
 D-PHY frequency calculations
Thread-Index: AQHbuhBDtopBmbTifEOJ5R3I8HbLXbPCci4g
Date: Sun, 4 May 2025 12:51:27 +0000
Message-ID: <TY3PR01MB113460F756E0F38AD441C2229868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7108:EE_
x-ms-office365-filtering-correlation-id: 6121f074-a1c5-4766-ae76-08dd8b0a62cf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YKRSqkkkDMm8LTQ6heIxTgLmWNIjEM+H21afCJYahZ0KUs9+NsdL8dF6IMcs?=
 =?us-ascii?Q?m1MgLIrPMovwvajSFaBKASKmoQJVHuAlykRiBXDpDOuoXlYPgQrYnqN90O1x?=
 =?us-ascii?Q?BmA5uhyWc+X5/lKQu0xkmDkkx5z74mT/A8BGXYoLBpaH4YN+7Q1f0t/MOeBP?=
 =?us-ascii?Q?AewpzzBthDykN5al0teIWaur93Fzh1D2fdnFP8BLMZCmiCQGxzZDbIg1OkR5?=
 =?us-ascii?Q?Q0qRgAP27kZlf9UtCno8FVH3r95FSUXpov4erxEEBuzgO3zMQVEql7JKjEHY?=
 =?us-ascii?Q?Ol04VYV/QNzLs4GrG+dwu58LnCyzG4C7DKzCfqa2gpXPvCcR74HZnYy7VG55?=
 =?us-ascii?Q?HeTrMWDpj/6IJxBf2X32SsHQFBk/TG63VRyqKENSX41GMX/po30topOZLUEi?=
 =?us-ascii?Q?OpV7qiJu1TWiZ0ZsDN0S2Aw+grTxSOkQD6ChPo8tBPO9X64VHt8kIJtkvHDz?=
 =?us-ascii?Q?uSutx03OU94xDeDO+nNU55cRw8yygKgz/y/xTKJW6CCZtHL3jVBoG5MKf9DI?=
 =?us-ascii?Q?UU3btlqq+3k8ARrLo6bXcDj1J7MzaRUWXq7GklikDb9BD1g9+zoGdWraWSxZ?=
 =?us-ascii?Q?CGLRD02iYCybxgbgRbgwNRkwIp40o+4OAQydAiFcM8nHGf7zWAHoNzAH/rqd?=
 =?us-ascii?Q?eJ3mRPmrl4c/C20WoTh7tmmhksAMwn9Ur8fzIqUVoLjbq6i1xZTwqNc5d9po?=
 =?us-ascii?Q?YDQ37eryHbcqHfKhHRNXGVPFboECghjaUaaxfqk2CrMxFkeRI9j+blEv9ZsA?=
 =?us-ascii?Q?IEU7ktsvZzJoBpjgKlFYgouZ75DJfjH+79QYFDLqvDTWdTGBTZ49o+ehpGZJ?=
 =?us-ascii?Q?zhcYrKGSziYyW+i3HFjcopycQlpf6c1J9yfmDIGoimaSwmRpLlyMO16sSRwT?=
 =?us-ascii?Q?0c5gtx5EqUCa5mlbjDGr/GjN4wF7sL5U2DVnwideakiiQoRer5PwYX2xqsXU?=
 =?us-ascii?Q?ezCGWljY/xTYCwuPnO/vwfCNidWQZe6nq9t+jAbAMTtwyZm3Wrb4217LihiQ?=
 =?us-ascii?Q?yTkPifppgTiGS0v3ESHbiT2nfN5HNCgSIL6RBZJBpkV4K68QuRijN5/21sIq?=
 =?us-ascii?Q?M2QzgaZQwfS7p78imhY6lYTEmnMdUuLQYKzprUwgKbJpKohysVEhRBBWt9oF?=
 =?us-ascii?Q?VldQhGTsh5dCkPtvVovGCTC80vsbqF2a4gHOC0x60bNOnDSDax39hsgP/uuI?=
 =?us-ascii?Q?gckaGLOAwaEGhQ9TaI/jv1Z+jGo3dJvTCB9R7o607aOwaSz0tE13m67V3/7W?=
 =?us-ascii?Q?kECC3euKwbkwB9sSWtLPXlRf78kRgGWQ7EpZ20KRMkwhNWso3Ttqv46k6LWK?=
 =?us-ascii?Q?GF/C25jG7UHZoAu+1Vcs/v5SSP9HK1FcPBig+BGVorb9k4gAdT0cEfG0eHJx?=
 =?us-ascii?Q?ZqIc5ZJimLPOTZrXJ0KdqdfBij/cvXKOwtJ3ahWCXNgr6WkTb76oDUPDLav1?=
 =?us-ascii?Q?4DudFSoOfWBuTmeQ40yHIlnu5A0Y/s+yyhbVLc8l5X6u2KzLZvDFfsuHAVjy?=
 =?us-ascii?Q?06mluB6cLpLtES0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cV99cdL399VGWLejJHqEwx/O+6/04EqZfebVYp1u/UKK3M33WEx9v1NAxXhY?=
 =?us-ascii?Q?0BFdVWi1k1z2MZgVLExtwtxuUZjzpDG6ZMJTq0CgU9dnwMsgs45yqF5IEtK7?=
 =?us-ascii?Q?ifNfUNwlP2iJn120ZjD1epyCpz3vZwRD1RZDwb4IKZrv5lr15NjVRuRk3gmh?=
 =?us-ascii?Q?hI51kb96J5GotzrjYu+2iKkNU+Y9qa6R5xPQa6iyVpJiRI1LM7b07yaLdxEg?=
 =?us-ascii?Q?QGV7rDkI0bfG2FMrMIMbjsh87FvNXRwELSEWqEqyIoNYv2rzZdxmnpQne7ak?=
 =?us-ascii?Q?3wXfXx5zHahth+XlijJpU6WAJuiPdiOokiYoUspj0iVhSpuAvemAEOiueubn?=
 =?us-ascii?Q?lGCYX6RbCZccKn0UDvytPQ4oRxh3YTvkZMBna0xfzs80w4+Yx6UxMPQSxgJj?=
 =?us-ascii?Q?qjDBS1dlDcDEh0blj7SJq/Q1z/Or5OD0FhfiP4C4VnVAIIiowL5NdimTks7u?=
 =?us-ascii?Q?PrRs0TVxFLJJCpCswhaKA+jFf4z+Uwdu5KJSDce7KVXMwWI5X3mcXGZp88Ns?=
 =?us-ascii?Q?OBCo90vJLtVv0cfsxJlyiZKNCzVe3emMfZUvBJu00tOcZAvS0/i8AvNntZTJ?=
 =?us-ascii?Q?p/hYQNy2kyYo2hbSZq5Fs0soo8N1CoaxXMeUXKsjH6jGvSnDQ3otmT0D6+yc?=
 =?us-ascii?Q?lmLkFhw1FN4aNO2I5/K4V4zdjEIeWVwGPpBK5zgyQJRea1JiGiFANkeQ4flI?=
 =?us-ascii?Q?Uviv5sLjx2n5Of5gQecvCPYG1nXPEFesC23/Kpnq8LMrlYWr7iLoFiMI3D2E?=
 =?us-ascii?Q?5pHT7oUZgBTirQHsqQebyq+4m2TVJQJ7BQGKwgGT1FxT5Vq5WLtm6rAizLf5?=
 =?us-ascii?Q?CXamjEIi345uMEkHhx9YZ/2HG3D4rcLW8QBQUJnqBFc8IJCoig/ERn0BLdKw?=
 =?us-ascii?Q?Nt3cPlIulzLwNwv7PdfMKuFTYP7M0rW4Nxo22s+Bx9F7Gt53CONx5uUnckJI?=
 =?us-ascii?Q?0cUcjrg1JcTSaVw1FKzTiwtDRr/auacHtxMxz7yN8wAWecbB0vDTbMFDZNrv?=
 =?us-ascii?Q?ZAFtobWIP0zqimiY8UOzIOyeA4k6CO+1Q3qeOHBfYN1+o3JwooyRNKDmU5Xl?=
 =?us-ascii?Q?VGzGAz2Gwn/CzgoEDury+iLd7P3Kxex76b24gflenfFgEAaUvO6x/waHxwdV?=
 =?us-ascii?Q?M+/Eyy/P4I56eMPiNuhss6Te8g2QnkuP8WEAnRtDC44u64j+V4sRNKjw0VdC?=
 =?us-ascii?Q?9dX/D7ycGOyOVDysWTwUDchFrzPW9FrytiCLPhnQbsvStWrke7GgEcgFOg1Z?=
 =?us-ascii?Q?iicafqCf37Mf82DQpM1pflHMLs/J8sl741NZTbwY7m3hdNqguk//8E5SxmfC?=
 =?us-ascii?Q?OOr2vrKIamUO0rDlxTvM5bqhynwtlAmi+N87XJZJx1MbtJshdgd3F4ckYRSB?=
 =?us-ascii?Q?IeWmrGfsC2hm1F4zMoX5QMN1Rv8BKZKdDT5mog3Nr8qkb1dqpu9H7wFbZbk5?=
 =?us-ascii?Q?NCeFVdU0lFxW+nvCUm1W3TFHzv2a3tMYFQReb04ts3oCDP0ijkh9u2j7Dvtb?=
 =?us-ascii?Q?i4K9Ov+IuCOyDskx7OZFsUwe2U+bCnUUWfk9Go6nL0rJAuI1MLnIZe85ZS/r?=
 =?us-ascii?Q?ff4jLmNZu2b9Nqu8iWoOWwLV3zYp2dQJnLMmGPY9vUIwqu5czgJVjyPIQ9TB?=
 =?us-ascii?Q?ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6121f074-a1c5-4766-ae76-08dd8b0a62cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:51:27.9896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGccJ12xz97SLUlx6M50Zn2WIeHLC1PXP0m39bSdQOii9SmTMXmo1iFoDHSmKurmhi6mLm4PDF3JjdgHut3lexjmP0vewYLAjdPlLWTUJ2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7108
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

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PH=
Y frequency calculations
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve prec=
ision, especially for the
> RZ/V2H(P) SoC, where PLL dividers require high accuracy.
>=20
> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v3->v4:
> - Used MILLI instead of KILO
> - Made use of mul_u32_u32() for multiplication
>=20
> v2->v3:
> - Replaced `unsigned long long` with `u64`
> - Replaced *_mhz with *_millihz` in functions
>=20
> v1->v2:
> - No changes
> ---
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index ed259627f5e8..a4c0dbae4a46 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -33,7 +33,7 @@
>  struct rzg2l_mipi_dsi;
>=20
>  struct rzg2l_mipi_dsi_hw_info {
> -	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi=
_dsi *dsi, u32 reg)
>   */
>=20
>  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> -				    unsigned long hsfreq)
> +				    u64 hsfreq_millihz)
>  {
> +	unsigned long hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	const struct rzg2l_mipi_dsi_timings *dphy_timings;
>  	unsigned int i;
>  	u32 dphyctrl0;
> @@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  				  const struct drm_display_mode *mode)  {
>  	unsigned long hsfreq, vclk_rate;
> +	u64 hsfreq_millihz;
>  	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
> @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	 */
>  	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>  	vclk_rate =3D clk_get_rate(dsi->vclk);
> -	hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> +	hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp *
> +MILLI), dsi->lanes);
>=20
> -	ret =3D dsi->info->dphy_init(dsi, hsfreq);
> +	ret =3D dsi->info->dphy_init(dsi, hsfreq_millihz);
>  	if (ret < 0)
>  		goto err_phy;
>=20
> @@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLE=
N;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>=20
> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency
>  	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> @@ -778,7 +781,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret =3D dsi->info->dphy_init(dsi, 80000000);
> +	ret =3D dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
>  	if (ret < 0)
>  		goto err_phy;
>=20
> --
> 2.49.0

