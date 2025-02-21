Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46113A3EE86
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 09:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E28810E279;
	Fri, 21 Feb 2025 08:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VlrCmE0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEB610E279
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOo06XdVKVDlslaQ9+mE7l9AlnoS9vvYvkXS6VAvEHlT3KsPlgeucLQ9D7Q/llG+47CcovwMzAccKZYoRBWk7BflUuhcEAjB3dDCBxo4K+oLOJbYw7Ybs5/lflqdEZFyRDiwzJMWqoFDy9oW4Y2iB2U+okP1j8p0liR4NvRc3Y4xOtUZWLp1q5icE2P/P7g6gLYp0Xa0QRh7dMckNWJMc4Gj0vJHbf2a/HALmU3EtI3lBfuwz81ofClXtOMijq0sgwJJHacc7aPTz293jEBSyhj28XSzCnHlIyTDC4aVD4ACd8h2YN8BRV5Wshi32okiDwKvwPp3G/sebDOCgwWAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDHHvR+JOXybgucAsRCnpJALtOkXd2oAEWubuVjz97s=;
 b=F1JRI2tbKHK3crhcrPEt1hHfkNJ4JkkOQuRTCfELv8a7TQB0sxo6wu7qgYqMBgU89X4BNhhkRTEsc8kJ4WlAb8MShhpH/lRA45UiFMA8G0BbW0KqG5JyDhdXrZxfyMScux0EqiIvNLjyGmosnm6Q9KXwgYR5VcnsNu7g9cs/NiT4L1stjQ9pMWkA0saDUPFwPkN20ZJKWIBU+lW7yV0GBdYO3A4lzp28jHxKj6uUj4O+RcrZtBmJB8m2wByOxdswcAZUgIapaY9Qy6tklRoQCq7Qg5auri8LL/nZ5ME8nlHPyW0gLt6gtHqT4iLIaRmI1GSFKHlGsMYz0vpISC0izw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDHHvR+JOXybgucAsRCnpJALtOkXd2oAEWubuVjz97s=;
 b=VlrCmE0k67oKyvCrEhEdvazg411mPp1hPizCGR1F3heTqa8E5BkHtjB2tUCOi3e4NYHtUqOU9BPMCobZN4GGUusg+U0AOBl1ZtvJYZoHWnLhh0Z6tN9uyDJlBNzog+oIGVBF7oJC1ryggLAtcGHNLvNlRl2fZmtjV0/Q7iuhvBY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10765.jpnprd01.prod.outlook.com (2603:1096:400:2ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 08:20:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 08:20:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thierry
 Reding <thierry.reding@gmail.com>
CC: Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Mark Zhang <markz@nvidia.com>, Dave Airlie
 <airlied@redhat.com>, Terje Bergstrom <tbergstrom@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Thread-Topic: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Thread-Index: AQHbd8Aqai4WhmiBF0OEIqjKJRkhe7NRgx8Q
Date: Fri, 21 Feb 2025 08:20:10 +0000
Message-ID: <TY3PR01MB113462783C25B733E05C5CFB986C72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10765:EE_
x-ms-office365-filtering-correlation-id: 9f7dc08c-86aa-49ed-a9dd-08dd52508f2c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xB88CyxBMhdQpwVC/5OfXJDufleO1Bg5kgT2YvcJj81Ojv6S9olf0dgr8har?=
 =?us-ascii?Q?4iZz1L5XO6YhUXKrOramq05G3b9l8RJ/fC5e1deLNHYdB4+vkvigL5rIYbT+?=
 =?us-ascii?Q?JsnHs6z9ZRQNMEjR8zVSC0q583fSw5EHyB4BSDdXijGiDAu0gSp98Xcr2cgd?=
 =?us-ascii?Q?I1iLqJ7bRWQRsogo1YwnDONUl4760iZ8gSnxUpDpSZ2w93IJApbEfgf8J+3g?=
 =?us-ascii?Q?lGNzkiL80IhekETUdlHVzi2dEZuS4W2y16AK+AwYQxSFmcZvTo2t2v6CEpJk?=
 =?us-ascii?Q?lXqRtr6kuX27XARLiJ2ppkjYNFs0cbI6HgQv3JTdYsyj3blresTelTAxF+oc?=
 =?us-ascii?Q?+R8Xe4HPlX5+HaRMYx44ekqOr9x9d0QExMnr94nMBUmKhX76p/pa5lJ83het?=
 =?us-ascii?Q?vels6sF62qrdDKnwaHVH3e2Skw+l9JcnljqH1oweE1+tdFIqBshwtV9A8u/c?=
 =?us-ascii?Q?BJeTNMJJqyjxNQQyQty1dkSFGBdKXDc+SmlVrYlxbE12aNcqGqaUgBURlQzx?=
 =?us-ascii?Q?XNFgZlg1yGMVgZyF8QZ40BhwwWhnmKWvu/JhFpWcRRnV3dxO1/Ne55047lhd?=
 =?us-ascii?Q?iDwSGXIAgELzT8jHVoWBSbW/+fLH/qWuJDUX29Unf7qmCEeBfLAbGzqGvcER?=
 =?us-ascii?Q?S4X74t43S3gCzbrJA8jqYF04zSRzYRT0yuYptE11PRGwW23UOOLopSyVaLWT?=
 =?us-ascii?Q?aIoNSILLp0pzNQRmbmZ+QihySBr19J/3PuvAjmMjxfpSyVSkcdcDkTeOmDYY?=
 =?us-ascii?Q?yPMBpcKQ9rVGhlBrrNdP1bVBQXn0TEmJZ7pJlB9OglSP4hwYHG4gCKJmU+Ly?=
 =?us-ascii?Q?9bEq8TA3IKWAQJMb4z85p0dEyi9l3FS83Mz9f6cL54rZlKhtSpMc93M9mRtc?=
 =?us-ascii?Q?Y+dAg9AUMzogCDLPqwRc1R5f9n2M6WikshFmxpJDW+8YNdKrlU/OF3FRKp/w?=
 =?us-ascii?Q?dWtquBlOB+69EVk2SBLLzveaWqG1WXIgqrG1U1HFh6O5OEF454JnF5rPHu0B?=
 =?us-ascii?Q?xCaxXQwf5e+YtEF6NcUVgjPAwRbI+A/W0lKG15IWVBcFKtDebk01vHViWWi0?=
 =?us-ascii?Q?s+Vz/tOedSRtjwYru878giqL312smjAOD1QKKtNnR26tlx/A4RC7rff9nZlq?=
 =?us-ascii?Q?wioG1XmCwf5hwP7fLPPSDxId0CjR27H/TSumMGY4xAa8k54L/W26LbKVTdMZ?=
 =?us-ascii?Q?RdhWDY2+7K79TUxBxM/3+OBfHy1JJTuB3+CMvMc434ZGkagqDT/e5vX6GbH2?=
 =?us-ascii?Q?6k0nUST8+W7l/bR4sUVGuhhI3ec+lB+dmYY9anC9gNBJjkbVDWiERyzY5VfY?=
 =?us-ascii?Q?Q72lPolbY78Q+csqYLZ1FZgHoqf9Y2dLvuspZqYH+EtNlJpmEZw45PhDGrHa?=
 =?us-ascii?Q?fgyuzZVTU2x0lAyz6crZfFe6nfcBJgTbhs+N4OieX/y/CTezgLY2JWoF/YGj?=
 =?us-ascii?Q?oXJdmHEX7D4kYVRaXL0nQDSVyW0UeKe1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?scyKmXcMmEaB3T7t+zoiEmyZPWbgJ2kUqpPqzJIJdlebUsEzud17zkjnXuWP?=
 =?us-ascii?Q?BypVPq8OHYGUCX0EOVwN/rxMyeS+mC+QByL7fDi3mwnCPSckxMlNMFWjbVFf?=
 =?us-ascii?Q?I2Nrv+eXqs6b7K6yzKilj7W2nVxLXZ7eS0xE5xAOKsVAcFOj8l/gLP0fQ/pb?=
 =?us-ascii?Q?PsNpZNLZxNkE4Li7CA8CaJVQ+pxhGl7+WJZPIOjKmBlbzIcnx85ErQsCrec8?=
 =?us-ascii?Q?NaRRbfLMb5MqXGujwbf8NewKvKlJUqIFdJGjPjHQkGi9mUjoRcjCjpIIDL0O?=
 =?us-ascii?Q?fdyg+ReF2OwBYkq+JiCqohTPPV3qkmgbwwX8uHMIQC8sCNP9sbFGMgenYYo2?=
 =?us-ascii?Q?KNDvNtMfTqXGC41V6ovthBR3wuLBhJ8Unw48cwaiQhfkxMC5eeqeDAMV3gNF?=
 =?us-ascii?Q?/n2kFHY8fhY5Jqx3b7xvsCo+LaZLWwxf4vCMv9kmlOu8RstdXOUxyEG9wcqx?=
 =?us-ascii?Q?dvhntfBR0iaKTkDQUBEFB1mge/Q4ij2Sg1vfJot/3ltWloqeiH7Ui868dyvl?=
 =?us-ascii?Q?iJ2fsreLU7BjHPJzoEk5h1Mpj8MRQlFOU24+Mvpx7z9eWOc2MUYog4lTzEVv?=
 =?us-ascii?Q?E1L+USvn3d54fAR4l7N2a6TjpaZ39YrvRuUT8klv6dZxsEyP0Agu3he3Vz1S?=
 =?us-ascii?Q?oRLXVo/CVs0AjJm/4ScFFay6/D+UUVDfj+Vpa8xX4HYMtSIPZ4QqixZvk19l?=
 =?us-ascii?Q?m6/9xVVfM1Nq2Apiijvs/VeiRwvdURuAIglxatodzlVepWJd1tiGJGjh3KL9?=
 =?us-ascii?Q?Z8UH6OGL2z9Qw7KO0TZdF7cLVKnoewHElgFLiI6g5BB3uJaF0UzTIqM8Cwcj?=
 =?us-ascii?Q?A8zy//mR00r16O+w0EzXgmK6LUw6/mRmBXq9R+WkMHleaHh+3YRFT+aO30Cz?=
 =?us-ascii?Q?WPHRwZIddywvjdE6n8gWYSkFz4fFeyTtRyGGyE53/sTad5KE4vcmjteMi6Nw?=
 =?us-ascii?Q?uos7dyBKQnHzHQ0Wz9edlAfdz2N+mXtWZtY9z4TsmF3zkEAVVMjZuWelmRmJ?=
 =?us-ascii?Q?OGbZ3u+40seyW1eZnr9sBHfBrfPe2iNBIPqxx0FVe7IQni2EOKyzxceM4XBy?=
 =?us-ascii?Q?Qs3h6e0O0UL3url9sYin4XRL3UNFtPsA7kCJM7sO9g6EVRZ1jtizFulzhvDr?=
 =?us-ascii?Q?xwXGfo0shbETrkR8pmnXwKjqqxFEdyhQ9qZmSO8P2QnK9Kg0nBshU6JNJCU+?=
 =?us-ascii?Q?N58jqhd7qm9DmHB0cycq3uQcE/fdOXnO1+0m5pzhBf9WN4S4JfNsRCoB1VJd?=
 =?us-ascii?Q?n3s+5lgK/fsx3/EH+DoBQzf4Lwb5FK062kzEN+PLfu/pD6y0qPJZvf2NKSfb?=
 =?us-ascii?Q?fJ3f0GMIcADcGrGjq/vJ/UJ+4VTFOqN7ZDsRBVgXT04QaHCpDVIiAVGKTHAp?=
 =?us-ascii?Q?R9eYwLG/QI20lAzpWl1n60reXdoVjSQEzcVsgFws/DU+WiePNJwWUtgUHdpw?=
 =?us-ascii?Q?tGRrY9p/0MADS4/3wM9yhRn3HSZ0l7KyUXFgUgKdW3V85QTze2+ihBjmmkQP?=
 =?us-ascii?Q?2EUH2C6WmK7u+00nJO7Ik0XTt61wVp4fRnOBjGPZyHq6MoOnXMi3WL6zdXDK?=
 =?us-ascii?Q?HtxOH7SkXG9NmCxkqpjGebGTECJEA+xi57KBzX6qmmVlx7iSaKNG55Oyakti?=
 =?us-ascii?Q?Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7dc08c-86aa-49ed-a9dd-08dd52508f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 08:20:10.8886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/vX+5oE19RA6J+LKYiLvYwp6IYZfmo6wofLjXmKLV02ruf/TbKt46aotQPXMoJbKPUDScPx8mhhGDkkriS+kgIzmyXd1OKf2hhBPh6mPv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10765
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

Hi all,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 05 February 2025 11:22
> Subject: [PATCH] drm/tegra: rgb: Fix the unbound reference count
>=20
> The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,=
 but the driver does not
> decrement the refcount during unbind. Fix the unbound reference count usi=
ng devm_add_action_or_reset()
> helper.
>=20
> Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c in=
dex
> 1e8ec50b759e..2065157daab3 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs tegra_r=
gb_encoder_helper_funcs =3D {
>  	.atomic_check =3D tegra_rgb_encoder_atomic_check,  };
>=20
> +static void tegra_dc_of_node_put(void *data) {
> +	of_node_put(data);
> +}
> +
>  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
>  	struct device_node *np;
> @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  	int err;
>=20
>  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> +	if (!np)
> +		return -ENODEV;
> +
> +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, dc->dev=
);
> +	if (err < 0)
> +		return err;
> +
> +	if (!of_device_is_available(np))
>  		return -ENODEV;
>=20
>  	rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);

Gentle ping.

Cheers,
Biju
