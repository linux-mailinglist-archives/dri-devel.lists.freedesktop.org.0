Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0145EBEF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98066EEA1;
	Fri, 26 Nov 2021 10:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA16EEA1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kicZUtTIeH13g7DNxfFyWYkli4FPOhUkEpqc7tatcJpqDKojKiBCWSs8Tj2yrgNvn5QXk12b7BwcRYCN5VUFs1Pb16S9c7kr5qVoqndY0rqGiCDXh5Cwe3HgUhBFjerjXQ4sWpKHMKB/G8Isi5NhFHNA2Q/hPzAr4iwqMegJ4nFRi4Xc7/26h+Hn7LbGsvHrl8Dnzy5nIp8AO8AtElqJsWseAyX4xBOFOJ8HGdoL9OBKAFgxfCGxtDQp6dhPSeuYqhnEpQASrc5nWzAA7tdCQBsC4V4h6wwsuoLHvNoznEdf721dPMweqIX/QpvlNe72pbcYnhl7Yc7kYU4wDem8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ/R4ZNaSf6EzZZ+vQ2wkUXRFY2tgbr6awAocxc92is=;
 b=O1hPwWsuAX2HU6P1ojlKT4N5CMVH0bdTD+xkMn1MT6LWde5ozVUfEhApMyGwqvSSVzcVYmhmM+V2Fp48FFVUlwZ2ySTuMPDC39V7hHLpI3hWF/5gZByImWzxOnS2RtcSahBvznVGOj5de0AQTDobRsYG9curDTYFss6pAJfvSyag7NPGA6GTbZZPEAKbZX8LYZZAcRc4ZJ2utgBVtjmx7C9+fNtzRY6uKhEbuldLlH5XnUgNnhEMy8bXtZc4iKBBjp1Nc7gcwsvodh3J+G5ZKuXIMmppd/9plZf7Hjj4eUxCEXwXM+LldEYhXweXrgp9/e7kz+fWCQklLB1crgYIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ/R4ZNaSf6EzZZ+vQ2wkUXRFY2tgbr6awAocxc92is=;
 b=D8ABS1CSaOOs0SFyNGIsw3hDpOUerIKze3qRJ8B1z6Q7bemP8f2X32O/dDfGfAk+LcZW+iimVH+pynkQel2QUVcUQxZtYIyRe71/1we+XZZdl0lB6Tsb9aC/5WxHy2CvOYVbz1DHgHWJ0oScF7zFQi+dwfH1tSC9nt8vtc6jIbk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3204.jpnprd01.prod.outlook.com (2603:1096:604:7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 10:51:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 10:51:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
Thread-Topic: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
Thread-Index: AQHX4q8a5cXhcQbc30ydYfJwY8HDu6wVoKCA
Date: Fri, 26 Nov 2021 10:51:48 +0000
Message-ID: <OS0PR01MB5922819388EAA6973EDCD3D386639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96eba79e-347d-4312-86d6-08d9b0cabee9
x-ms-traffictypediagnostic: OSAPR01MB3204:
x-microsoft-antispam-prvs: <OSAPR01MB3204EB81452CC6F28962D96E86639@OSAPR01MB3204.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QeN96NsNXFK3v1igr2ZV76FxX0uzyY/+5uneXjwfXpb9PkLssFsSsZpSF1y/vt1fw8HeBjxf15Ljr3c0TK2WYBS+g1vqWMoulFMWIdmXvZ/zIpuz54gzDVybkMPDxOYugBjXzYM/AfxRDjz7l1vTVvRqkwLA4EeTIbGr6EzNUjV4tVBkQlmH0k8k7XgQhkMHJPB+GAWB999Zctt8i1RlbjkN13b/Workx3t7govPzmSyevchBcIYIGTNsVTQSW+z6ej+yLRZ/HnRxCkrJjdp0lP6PI7VlUgTgu/ghCl25E5wvEeyW3VqVVhMA1kVS0bk0i5EghjDQp96lmUWNfZ123n0S8Zy9XdAJ2xfnMhl7XHfiIeWUhRIaUmWHAI/Rf3DA7wgZvSPxETV2MGW7MKLCZvgRowbeCnGl2jgXehKEuN4K50C1Eihi5LEuAlr4j7r/leo4mM/lFyiPsXSyqWrpE1ezGwiwN4ShT70C/DO62paw5liuWEohilZ9j3q0mmKnPykTkY3Mvs+gVkM2QC43E/rZw2Rj97looP5ZFpOsjcvqcynNOPhUdEddGR/TywitoTmaMwDPLOGSlt1kwmHFnddw+FEphV2dsyd0PCe7ydbHuOv4QyO+oI14Sl2BfizGT7jBaEdUNXYmsZNt7uPRws/Zc1fL8eFIYe1/OAPBYXIdcw6HVoNEkuNZb7MtdNVpWqINk1y0Tfd80E5kheIvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(4326008)(122000001)(86362001)(9686003)(5660300002)(7696005)(76116006)(26005)(55016003)(186003)(83380400001)(52536014)(33656002)(508600001)(64756008)(66556008)(66446008)(8936002)(66946007)(6506007)(71200400001)(110136005)(8676002)(316002)(38070700005)(66476007)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8X5bdT+gB+4XsEguVYy47S1RJ51TEGzgcTssnzzcBzy+gA4kapsyTewcP43N?=
 =?us-ascii?Q?Tk0ddq/p37VbzZ+IT9jo480Xr7u3JfY4o/HzdUWQGdx9JD0S++ahaQ2lklyX?=
 =?us-ascii?Q?H/aSvy2Pl1ZdrMU5bhejzDR+vMBI7QqrynJU5Lgn3BlVNxQ+9Kz+Zq2hwzDk?=
 =?us-ascii?Q?ohu8bhLggHoT4IVM5nRqIqBv740IPHmYpUWtoSiGCo8EX1BkrI997Ji5H6fd?=
 =?us-ascii?Q?Hkh5HOmiDecbLZuS8CjpFUhCD+qV5nq5oZZ/tKJJFmoQO9pXo+5ByFM5yVyT?=
 =?us-ascii?Q?4ESelNK/1vbFCnjNO6ov3/Uj5HooNMlVxpzGRAJ7caqiwDgM/65BYMxPVdip?=
 =?us-ascii?Q?k/cWUtAZxRKpO/huu8DbGo9LT+wh+hiob9H+eIpfAQ8p0jqqrOpo20FEthEx?=
 =?us-ascii?Q?46HfIRSjg4NOZP70YbMke36tjn0O5nBGQecbOE3DCSfXVcSJrf03/G2uG5YB?=
 =?us-ascii?Q?rRW/29czaYGy6qEHEKaBW4LnU2/KRJcT32jyzHWh+VNslnYosSSaWobmUP1p?=
 =?us-ascii?Q?XZrA+0OloGeH8Jh6DmFgYalCkBVt+m/2xs7vB6ubkd5IYa82zVRQhjNvzhpD?=
 =?us-ascii?Q?w7T0c1jMqp3jTysAQCT7R4xAsEX1UUGMFYXoUgxWrpgrSBwIl61b2KOxWy8K?=
 =?us-ascii?Q?MvFeARJi/envvBmXi87NNo+CvczYOF+DbeaGajcUHOqr60u45McpE25Klx9Q?=
 =?us-ascii?Q?MdrjZK9NnXsiaSmXfAkgYB+fKhE83aKfv2ZkhvnUr656AsDo/z5vLxvP11OD?=
 =?us-ascii?Q?UkfrfyVooR6QAj5HvRqH4kN2HndfJyLs/9WCc43e8HP//gp0q3Slk/EOgbjU?=
 =?us-ascii?Q?3tE50RcHlHgdMQAEQ4dwrz1qQz370dFrI3M6fEjmIPA1UGxmxxIfPt1Nwgv/?=
 =?us-ascii?Q?nxPQ5CpHQKkf0zsKdAuq+Vg5IxlrNWrYU87YBi0YS3OW3PS3XLeHP1UtCWLU?=
 =?us-ascii?Q?EZHBA1jamBss8cIT/RhdfZe+j2JTQSPUH+/5hIR5IU/yItFkANz78ToyF/VK?=
 =?us-ascii?Q?IsqxlAFBUvRGydQqSylU4ZX0Wu7UH6L2vj+1jsvpVumyoCCypUaKMui/Apwb?=
 =?us-ascii?Q?Jbzr2vi/2knM0CzWF7TSRrRkQ6WXJ1LycN5FOaTXaJnpYy9OdvevFSQ5VRQA?=
 =?us-ascii?Q?ivkpDiuZwHS5vT8W+NwNSEUoz7mSZeyWrul8LD+3wdoAp9uKJHbov77AXxLb?=
 =?us-ascii?Q?5cU6g832T5bLKzLEKSiJ370o/mk711hGF85asqjKQmIISeQNORSxjZA/si/3?=
 =?us-ascii?Q?Wdb/Lfmd0oh/r1ImqK09ZYP6VLjT07Y3ylFNQ1Ex4NlVMxPT42LYrTAwc1Xp?=
 =?us-ascii?Q?SFIPd2iMHW547GaRzCcFEMXxRPTvkKDC2B1GFOidRQhZX/TKVn7mjkc71d0p?=
 =?us-ascii?Q?QYguwJZ25L/D909LIYDOneQVY1n3+IMP1B/c24bG/ECHOSX8tRXsu+ppJ0ZJ?=
 =?us-ascii?Q?tX95TvStvbjnJn+2xR+uSydtJKzraogHx9wX7GYLp0uR7Am7eNvvEJGbEadS?=
 =?us-ascii?Q?S4QGAuLKMQQndMN94UFzQCiJ5UsojC+uyTHgS6h7QLAUWLS5o3LCnYfhFvHa?=
 =?us-ascii?Q?M4gWw95XptAMqMEoLFqFymYYhoOavcM3UIDy1C9GTsZ9SlPY4YBJPYaWBjoB?=
 =?us-ascii?Q?Wm6XcvbdZ5ItNTqK68SaJZrQxGwoieHcLLhQfks7vPO6pRYzQoXhCLwupxOQ?=
 =?us-ascii?Q?AX4DNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eba79e-347d-4312-86d6-08d9b0cabee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 10:51:48.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5ZTehXkKOib8zKOu1Q58KtQ96Ga0uVMlWzsvi/FBuSaBZV6zQKmYanFmojF6qYg/3W49ZSO+5y+GU4RT50jf3PdQ7/jhjiMyDQllHbcPqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3204
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thanks for the patch.

> Subject: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe orderin=
g
>=20
> The bridge probe ordering for DSI devices has been clarified and further
> documented in
>=20
> To support connecting with the SN65DSI86 device after commit c3b75d4734cb
> ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
> update to the new probe ordering to remove a perpetual -EPROBE_DEFER loop
> between the two devices.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 48 +++++++++++++------------
>  1 file changed, 26 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 833f4480bdf3..f783bacee8da 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -639,6 +639,8 @@ static int rcar_mipi_dsi_host_attach(struct
> mipi_dsi_host *host,
>  					struct mipi_dsi_device *device)
>  {
>  	struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> +	struct drm_panel *panel;
> +	int ret;
>=20
>  	if (device->lanes > dsi->num_data_lanes)
>  		return -EINVAL;
> @@ -646,12 +648,36 @@ static int rcar_mipi_dsi_host_attach(struct
> mipi_dsi_host *host,
>  	dsi->lanes =3D device->lanes;
>  	dsi->format =3D device->format;
>=20
> +	ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> +					  &dsi->next_bridge);
> +	if (ret) {
> +		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> +		return ret;

This can merged with previous line. return dev_err_probe(dsi->dev, ret, "co=
uld not find next bridge\n");
> +	}
> +
> +	if (!dsi->next_bridge) {
> +		dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, panel);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			dev_err(dsi->dev, "failed to create panel bridge\n");
> +			return PTR_ERR(dsi->next_bridge);

Why not return dev_err_probe??

Cheers,
Biju

> +		}
> +	}
> +
> +	/* Initialize the DRM bridge. */
> +	dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> +	dsi->bridge.of_node =3D dsi->dev->of_node;
> +	drm_bridge_add(&dsi->bridge);
> +
>  	return 0;
>  }
>=20
>  static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
>  					struct mipi_dsi_device *device)
>  {
> +	struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> +
> +	drm_bridge_remove(&dsi->bridge);
> +
>  	return 0;
>  }
>=20
> @@ -766,21 +792,6 @@ static int rcar_mipi_dsi_probe(struct platform_devic=
e
> *pdev)
>  		return PTR_ERR(dsi->rstc);
>  	}
>=20
> -	ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> -					  &dsi->next_bridge);
> -	if (ret) {
> -		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> -		return ret;
> -	}
> -
> -	if (!dsi->next_bridge) {
> -		dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			dev_err(dsi->dev, "failed to create panel bridge\n");
> -			return PTR_ERR(dsi->next_bridge);
> -		}
> -	}
> -
>  	/* Initialize the DSI host. */
>  	dsi->host.dev =3D dsi->dev;
>  	dsi->host.ops =3D &rcar_mipi_dsi_host_ops; @@ -788,11 +799,6 @@ static
> int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>=20
> -	/* Initialize the DRM bridge. */
> -	dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> -	dsi->bridge.of_node =3D dsi->dev->of_node;
> -	drm_bridge_add(&dsi->bridge);
> -
>  	return 0;
>  }
>=20
> @@ -800,8 +806,6 @@ static int rcar_mipi_dsi_remove(struct platform_devic=
e
> *pdev)  {
>  	struct rcar_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
>=20
> -	drm_bridge_remove(&dsi->bridge);
> -
>  	mipi_dsi_host_unregister(&dsi->host);
>=20
>  	return 0;
> --
> 2.30.2

