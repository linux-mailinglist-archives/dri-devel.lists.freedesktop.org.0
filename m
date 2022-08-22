Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7E59C06D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE608BBD1;
	Mon, 22 Aug 2022 13:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110968BB5A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:25:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX+TVTMjrUqiSsH0F2apoJTnJvzfIH7Zdit0AvplYy+Y71KLS2w4RTbxKMvE7GG1t5j0tEpP1oEXrNmRsN21mzcUNKzQnhz+ujQv9O83lldSbflFcwC6sLfjRiKSQ5rhzCOWb4B7yg1JBtFdYPd98RP40DbHOnnYXCB7jYLsXPniCnXHCi8ybOAE3MfKpdxnKf1UPJrtka1/JLARWSONkJNqv9SfkmgPBnMMBaEdFQpTcWNi3RJbglwme2IpjEMuqZj7p2dCbHrhPxfVOn8hQLVFJNmaClU5P9C9hp8D4rd1NAJ36WyVX/ZPWRcj101P8wOkYWTHVQGchEGXGl+F2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlamzyWT+vizyagiJMnqx8VIui10E7oqfeWpW9LdO7k=;
 b=khf4Mf7s1Z/ekXymBSozhAZ0o9lrjx60HmGqLlZX8zYqTY4bB8YVSzHskeIqQizd4kdgNIuv5Gh4EtgrSM/yTzeViSJgbTnvIYUsXg0hNyfPqXiLiYhDhyyZW91kMK2bfFYzzNKR2Gu2tKqU+8xvkAgoPrGQuqSe58gRa3i2o3jx0b5Rt6gpojUjAYxR8Uzc/JA62sKk6grLtxho12sA1E7cR2aVgO2KvFB2/VH5rZHR+neF5fNj72VUmruWBQ79gF8GWn4p77UL8ODEhG0dszmrCaDMgX8aads+nOfTQkonmo0dgu66HrEqiYZFoVfaXjoE5NMpiicz0k/nipCC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlamzyWT+vizyagiJMnqx8VIui10E7oqfeWpW9LdO7k=;
 b=FYQgOVBb52D0MigCquY6REOwYoJVR5aZ69+PNqDgBrNDs6SbCrLHX9YhM/idO5/dioSP2Lu/0cgYdsWekJ7ptH0ULJgLLjBbRsIXmpPwa3AKlxTZri6Mn5Klo0QFQf380Tr+n1RRuTkVA2fk7GOuqarzTklSjsY3fQ3rSE5rYmc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6740.jpnprd01.prod.outlook.com (2603:1096:400:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 13:25:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.023; Mon, 22 Aug 2022
 13:25:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Thread-Topic: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
Thread-Index: AQHYtigCmDMb7ZOlxE2fJo+Yvz7sB6266Idg
Date: Mon, 22 Aug 2022 13:25:18 +0000
Message-ID: <OS0PR01MB5922058F5712CA3367AFEAE186719@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220822130513.119029-1-tomi.valkeinen@ideasonboard.com>
 <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220822130513.119029-2-tomi.valkeinen@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04641b4e-d583-4f26-401b-08da8441c1ea
x-ms-traffictypediagnostic: TYCPR01MB6740:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TkkGKdZB0qiPZBqhnLLrbJXZ8hSNLFlPMDI7qZ71VSPPMVgNTBU+cA+hD1vRuXVNvp2R26QCJ5eMsO7dIEXRVrzEXZX7wMr0By58sDk6p1MCQhlpeveuiBps/NenlkyQekc2ZL5wTw0w1jaofk9q4wWzB6gFCH+KXpiEaL2RW1ToD742RIuKMw5gGE2jEwkvXZzsIF7jDEZmlkLlv9KvfDoRX3opiRORG4cbT6AAlGPjIV8HEbqL09WBAWaCGkB+WVlN2MkI/VrXixD8zJt+hxKzBbuVMjC4+xkGW3Dy92EjSdLrPV2fgZ+cWX5HqYPu/p56aq/EaqSvePE9iPBfFa4xKo1w553z0MGkfLhxuG8rwOQM7wVZowZ87/+997egBZvyz5J20h5VYcEoUbY6VCOA5giF7Bl7z0Gd7B7ZxIQRsiU/dyNxP/YYNyWdRVtxkClPvO15PlmiQmANFQdIJRKJxcDmzgkEfiWysn40Gag2qqil0Uzl+j5AXzJ717us8kYh3qwJofXLe1N2yXOXmHdsYsNndUJNy0E8tJP0+SP0Erq8Ns5kLSAaWYEzn+qlem4Ihm3z0CTBRx42GzAa1LPqmAEWjEGAmoTyaqiQI/vYWhedvaHPkb2ZVje38C3XsdJNrswOGJxZAzjju6U2XUkkCWOVN8hC7giLYU0jNQbHc23k8RFMI6n2jP9p9C153v5iaP9YfD5EmydTFmm1mMPECm1rMybY/qdQKNIx8sTCEjeQb/WOP4sADrwhW6aDIhwULT9ftRqzO5DS1wup7A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66946007)(76116006)(64756008)(66476007)(66446008)(4326008)(8676002)(38100700002)(33656002)(66556008)(86362001)(110136005)(38070700005)(122000001)(186003)(9686003)(26005)(8936002)(41300700001)(7696005)(478600001)(71200400001)(55016003)(316002)(5660300002)(6506007)(2906002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?05VzNB+RM45qh/noyOKv8l1l6SM4yDh5xNkK1yJ3w8xJAZaNl3bvLiVaICn3?=
 =?us-ascii?Q?a9ZYFt0FheTdIeHnKL+nVE1sRYp2JjtoZ1ueDludNo2ptaoMPcYyMh742es1?=
 =?us-ascii?Q?NRw27+YSmNAcxoLQDHNcDy6N9TDvlCX/TAV52dXiTHRLVr5j7sxBYgL9dee2?=
 =?us-ascii?Q?e4JqF9AgTy638bYZ+pBDgltefyAPTWSbZlfzObfJWASV/2Cv6JmfP8hKHmMT?=
 =?us-ascii?Q?GQNUIY3fnJ27re8g2NYDqA/AAvRUgxSCJ1bccnkbSt80g01VU1+nWjWLBZfi?=
 =?us-ascii?Q?tndSzjatNuMqeV9jOlXS3NhKM8uaqQg1d4jmVNKlNSvRT9D/99y0t+HJ894X?=
 =?us-ascii?Q?EJ89q9fVAldgq+yHIM9AYoufA+DW4nANaVOMqzuewgwgMERZSAxkm7SypAae?=
 =?us-ascii?Q?qV6FB9FSpPFhs/e7xElBcIdh+wfF2xXWcZwyzaDOCwpFWhFz3pq/08zJR7mv?=
 =?us-ascii?Q?llsGBv7vxl6T5E7t7bLzmBF2XrZ9P3wPW9NmxOYs/DDixtLwtZNtH7UK2GfE?=
 =?us-ascii?Q?65ZeMLg9xRQH4GReKkIsQxDI/vYCo7ah60x+cl06Q5hHL90/zfJdFSJen9l5?=
 =?us-ascii?Q?s2a9fISTleO/bSGCT4l5ADQfZkvVjVFKSIKnVzhrLaZJtytinANYM+lMkNPN?=
 =?us-ascii?Q?4xupfvsvW69Gry0FygJvxiEDaVjGSdS5ftPLhpFimkdDGOFtHiE3Nnyqw0jG?=
 =?us-ascii?Q?1DJeUm2rWJmIPNGqRWFxzyX5XaXBteCw9RJZdlrV1A44ZvyVG3vLBSzK3SPd?=
 =?us-ascii?Q?USPZjYCJseSDR02qzv7ZLCIrpckeGH9DtPhoP7DXN/5ddxyhruPRYk5vJThz?=
 =?us-ascii?Q?JFrEeMpyMPn1Lzm05ew0jWJp3d0aqmLk1rM6+teADE31n9ezi+ncLZXNx31p?=
 =?us-ascii?Q?BIRBaemz7ve728MDotfKbH5hMSXNBEFlKA3x3rwazpsO7+3G3jTvmlQcbPVN?=
 =?us-ascii?Q?QVb/ahuos66gei6tpyvo9gkx9qu9KujevFnBnU7mG7MmRKV5ZuZx4wpJj79H?=
 =?us-ascii?Q?nmp0wT6UkRxcwoc/ra1c1nN3+y+7xV5aUU3UB7dZAsf/P3vPRBRiiC5sUXKL?=
 =?us-ascii?Q?Oap5fXFJJGhI6pBIv4zF7Q6VeAQLrpqLYvpwj750USgoVcwly+LaJF2TA2r7?=
 =?us-ascii?Q?sAZj6sg5C3m7nflWJ3wZNwKjTHAUn3YW9TjsOV3qOmbniTAYJRa8fhb4CFcO?=
 =?us-ascii?Q?0Za1/0EPLAU3Fw81iUQA+V4FmzESiSDrRdbZmiP20sHycDhGZnGFHLpIBiO7?=
 =?us-ascii?Q?Swp7tpGl6Vsbvg5eqpV4aLq/qkQOf+2JfahWGxFYHX7D3g/UbmMYZSmIE5Hz?=
 =?us-ascii?Q?Ut0/D2frEEGSbSp4BsrlNr1vW5AhWSJbBR/w9n01ziocmHoWYo1rPX6g0yKh?=
 =?us-ascii?Q?ODC2PKgH41yVAKEerv3X5tFSCfJ6w1KDI4/6n6whEnS7kctphzU6flHxg28J?=
 =?us-ascii?Q?P0CgEqjdPOEX/IxXZyqbNHSCgzYb0t3dqgGoVNLA+TWIOgGh4CIM/aD637c8?=
 =?us-ascii?Q?+VIgmZka2thSkWP1SWveDd80nk/9t/E6LLiUclKGZ1/5rE35MEsXcBkonxQ1?=
 =?us-ascii?Q?k86QfW+a9E/cl7CKYbr8t2G/mr3swT3MCHkJ6+Fbp4bkWLM78Fqh2CqjGkXb?=
 =?us-ascii?Q?Sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04641b4e-d583-4f26-401b-08da8441c1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 13:25:18.6973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQORLaLFxokRIknOqj9YbKDzTfj9kvdXwJS7xevq8HJi9i+tgdIOZoATmLSMWOhC2OhFIxFNMDzPUdumhhzVuDZVZ0ghkZPeqXzZf+F1pP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6740
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
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thanks for the patch.

> Subject: [PATCH v2 1/4] drm: rcar-du: dsi: Properly stop video mode TX
>=20
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> The driver does not explicitly stop the video mode transmission when
> disabling the output. While this doesn't seem to be causing any issues,
> lets follow the steps described in the documentation and add a
> rcar_mipi_dsi_stop_video() which stop the video mode transmission. This
> function will also be used in later patches to stop the video
> transmission even if the DSI IP is not shut down.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 62f7eb84ab01..7f2be490fcf8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -542,6 +542,34 @@ static int rcar_mipi_dsi_start_video(struct
> rcar_mipi_dsi *dsi)
>  	return 0;
>  }
>=20
> +static void rcar_mipi_dsi_stop_video(struct rcar_mipi_dsi *dsi) {
> +	u32 status;
> +	int ret;
> +
> +	/* Disable transmission in video mode. */
> +	rcar_mipi_dsi_clr(dsi, TXVMCR, TXVMCR_EN_VIDEO);
> +
> +	ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_ACT),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to disable video transmission\n");
> +		return;
> +	}
> +
> +	/* Assert video FIFO clear. */
> +	rcar_mipi_dsi_set(dsi, TXVMCR, TXVMCR_VFCLR);
> +
> +	ret =3D read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & TXVMSR_VFRDY),
> +				2000, 100000, false, dsi, TXVMSR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Failed to assert video FIFO clear\n");
> +		return;

This return is not required.

Cheers,
Biju

> +	}
> +}
> +
>  /* --------------------------------------------------------------------
> ---------
>   * Bridge
>   */
> @@ -601,6 +629,7 @@ static void rcar_mipi_dsi_atomic_disable(struct
> drm_bridge *bridge,  {
>  	struct rcar_mipi_dsi *dsi =3D bridge_to_rcar_mipi_dsi(bridge);
>=20
> +	rcar_mipi_dsi_stop_video(dsi);
>  	rcar_mipi_dsi_shutdown(dsi);
>  	rcar_mipi_dsi_clk_disable(dsi);
>  }
> --
> 2.34.1

