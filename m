Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A6AC2E1A
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 09:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C1410E141;
	Sat, 24 May 2025 07:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tRlteuML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3555410E141
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 07:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZktPrxNRM/wIa4ni15luqETBr8eGCO3455prGna49EC5afSbJNhjqioyilAXD61Do5zs+bItcLfVaNKVQYophTSkSRjcMR8u/n9USVIyes0+GacaR8IdB9MmmDoRwla+zhKCM9R16QMTSMiTHhP7hGmTWp7yoYokWDHli0+ocFpWsY/jjuzKbxvWKMD2ZTnVbIs5ROZPVY5StBLbu+xSMaba30tBypgLeiAggZjQbikKizufrmI/+3zDk9KNXstN2G5YO1rxVuTiGd5TtjExude+0V2/Ba6ZQMKCmGkKPPaNg5KHIIzjK4wMayycQRBggs6SLqpehAGWfRr4XEXPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7b89DXhYe2XnuPsu3RmLJO14zUv1yEFhYi/BnPsWMg=;
 b=UFXI4jZYzUXAU0IHvGja34enu9uGCC/RF7DxwifSkLC9ofpe2DYMdeeGuAGN0c1EnAhtXMctyP7ODtQq998cmcebJWBsKlwBCsGX0RSt1hd0ArpFzAEkH36/4gJNTSwlWkuSGpiZZRGQEQPxLGRrq8xJkNC/CqyNt0HPc0FIkxAdmIT6/DPUNMNvmObTgZ93I4czk4jx4i0mgqwfgtkb3LDf59CxMjPnea92iTr+ymHiEiSOvdjG98D83ZAw3cpvriaptCkEOf2xIfsEbkZm3LZwTmqLPq5ebyGs9fWKeUSi/nu/YoBlhYy0gB9DeGkfGYVqWCayIKxUR/b3vknfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7b89DXhYe2XnuPsu3RmLJO14zUv1yEFhYi/BnPsWMg=;
 b=tRlteuMLDtlKfkpc4GOHhDRL2wh/hFoaFVnZcmTXZJK99jdVVsC1oXGFDRex87PMtZEvZc/OWh4Njkc5Rkux9dKqePKNtRJwAkeTv/9hMf9Fx/1u+DAspn1pT8ZbsKcPzbTL2I0lq90a1M9ivbUen+veuS7pfQMjTkGG3dyjCoQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11477.jpnprd01.prod.outlook.com (2603:1096:400:378::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Sat, 24 May
 2025 07:29:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.022; Sat, 24 May 2025
 07:29:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Topic: [PATCH v2] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Index: AQHbypQI+pKLxLDQYECzNJF1XHHd5bPhZaSA
Date: Sat, 24 May 2025 07:29:00 +0000
Message-ID: <TY3PR01MB113460B1C8F438F83E2803DE2869BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250521210335.3149065-1-chris.brandt@renesas.com>
In-Reply-To: <20250521210335.3149065-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11477:EE_
x-ms-office365-filtering-correlation-id: ba7211f0-44d3-458e-2407-08dd9a94a73c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Nw2B0+QvHztIlkRknF+y2RpnLljYj2FWo6srXDz2JMWh76/r2N78qt3NNPjv?=
 =?us-ascii?Q?9w4adczhHZluhih+wfmqcRt+Btq2UEjZz99CT7YBMmd/wsJ/J9gp9iFwZ/qj?=
 =?us-ascii?Q?PsOOU4i+GGn4a9ae9LkuuR9hb8IJitmtH882vahqpUkvodLaWjTWb6zpsF+r?=
 =?us-ascii?Q?8E73HuK+UIp812s44qDMRCkgFyIOueqxjB+YJfjB2dMwP68mfRQ9WEI3b1+5?=
 =?us-ascii?Q?2UTdpoPHmLcvhNCoeQdsy1aQ1aoEgDSnrUy5ja8U+G888ndQGl1J0E727B8i?=
 =?us-ascii?Q?vtNn05zFF3Y6gArYSO/rmeD1rKSR9eTf302ZuBKR5dGSEQ5eWggMK6Q+qrak?=
 =?us-ascii?Q?ShJdGr7EnCw2Ss7hsthQ/GiF+HRF9YUc4dwYDK+L+XkO+ZqW0kUjV8584Y5b?=
 =?us-ascii?Q?ZmPQo9zpC9li893W8wd/sDwbsrbI+dei/evgZyZE2INimuPF/raLGeFLX+Be?=
 =?us-ascii?Q?BikcBNrRzQM9ZfuQrK5zqF8Hj50aOe91E9WS/U+c/5bmUrmHUwd4wYtsrd8f?=
 =?us-ascii?Q?FND9d9n6gcFP7wI5L+9SsXp6tKFLMquZ545UEDglVLJEVqTm4ipvUDDJ/wEI?=
 =?us-ascii?Q?VZ3qG4ElhDU3C8X2orSvFs8v+NUzEBVAmOODDpnk9ssbKQKg3jwkCL0F5van?=
 =?us-ascii?Q?ocVBA+JEbj2y/5MnRJ/QiUR/YU3DMtxEo+F3NBozLjT2KfINWFM7iWtebAOi?=
 =?us-ascii?Q?u51aXEhoe0nh0kloqSbIp5bwKL+gs02vkSgZ27ixDn5RR8RjnPre9DsRUA2H?=
 =?us-ascii?Q?uUO/3HLLrWXZ8dyj1TGQ8lcCSfKRve7E72vebZLmDkf/D8a0yYaIQsqmNs2T?=
 =?us-ascii?Q?RTRzuvej1LHEKJbZyGXAzaomPo16sFJIM8l+9X+Mm9izx1Vqew7MR0uFAnRw?=
 =?us-ascii?Q?KqqHRsbRmCrK6vpfPeycYLpD1RciGxBLOLNLzfPpAUen6ANvUjTbnsgPNazV?=
 =?us-ascii?Q?kbrMxhT8knVrxM9d8AUS+hxkCRVZyYxDRNC9J8nrEWV/MZR9WfemXckJG0z0?=
 =?us-ascii?Q?1uaks59WFtR/izeHmzikrHEbXF14b00r2368+1NQXYPF2VuoRr/d1zrbWoqy?=
 =?us-ascii?Q?OMiYYnbBvlcTseygGZEgQStXJU3ITspTWgChiVxZEEt+d0NXTrH9pMWrrsrI?=
 =?us-ascii?Q?Cb6LsYrzai4ZWwHoAlo0tmL/0u2TR2ks3935Sn+QF7uguCTf95Jh/sQghY9n?=
 =?us-ascii?Q?dGjyR4y2grH5o0XH1gAtlqR1Yd9UcC/h7JZoeWL3hWMi64OVybyidDxkZQCI?=
 =?us-ascii?Q?i/oAiTwS70mNNGhiSSMgA9ler8E1MwjxoQoQr5VqYmqIuYxtm0YhiQdZFAoD?=
 =?us-ascii?Q?24115jb1MaN27RFn2SMwfHS1azH0up4L0vMYW95T4tFFXLCBsE1+nDW17lMr?=
 =?us-ascii?Q?bOf41TlHLf6OLaniMINfBjPsUar9AjSNA9UxDvgdJDsl6PEV6s9wIujWKhGx?=
 =?us-ascii?Q?kgwoFln7qqPZpreKeG1Lfjm0qbuEEyaWhKC7+rY1Hwj+KFoancO0VxAzj7xQ?=
 =?us-ascii?Q?VgifddIa+XpJnD8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H/aNAGfkihU24MRRsLA7mnFof0XtdnlPeLckkmOXLm5kwdduO5F7O9dTBf56?=
 =?us-ascii?Q?WshJKEU7EbjG/I/x/o8gaSi+xq8OVK4lMrGWywT1AgYP4sD+tAac2cg4qikX?=
 =?us-ascii?Q?fVeZ8AW0ZKLPDzcG+NUUPCpebnrUiX9n8scwCUm4pajuur1EqeBsNYa9i0dM?=
 =?us-ascii?Q?stoNxIoBlA4jpWcYC5Wrupq34bIV8PuLrIEgzSPrDyZSrKDRHZvCz+3wRwuG?=
 =?us-ascii?Q?5OC3t7ngQb2QSZ77Rg1b1EJxqSdJL6nVU4W1g6MoDIQpzh81L0tXQWZF6/5e?=
 =?us-ascii?Q?40ZEQMLogibin6NCowEJKl2qwYygBMMu8TzGLZuwz4GZaFP11+nUDWPVCBtN?=
 =?us-ascii?Q?wGZ08/17SrVjgJ0ALd/vZkhIn4uh19ZJ3huCzyFWJ3Kwa1vhMwpDwi1djack?=
 =?us-ascii?Q?IvPBpBziVA4F/V2VPwmRt83bz76ecVaUbKpVkKDRqig/5ETLJfVjyOr5zlfe?=
 =?us-ascii?Q?xvUJOLVM1962VfUWK2WymMBb2Cd44EIY8Sf/li+zPFxaVMl++XDosy8/OMnK?=
 =?us-ascii?Q?r6RfC5I2DMsFymAZoiHriYGf/6n2NodfB2mo39HMmmrzsepasuGkyuk6W71D?=
 =?us-ascii?Q?cqSGJxq1kNSQvv2ZTlK5UxOcPCD8EXsT2+kJS16VHCO2qhy9PMx8aVQ2LCW7?=
 =?us-ascii?Q?ZcVt16NIxYrY4YTLDOUZMwiRl//GZl40hn8zVhI14LsnALEswVXl+P/lEvgj?=
 =?us-ascii?Q?tNjobgtigvCwn9h8eitrxZYkTygP29Daux/51/ScaNiN/Q0cTaTqIuXrECgW?=
 =?us-ascii?Q?klEWcjiyEV3i9sg0aE4RftpCnUXF2iD7xa2AE2x0N5FfTdt6/VS1DBYTG7p0?=
 =?us-ascii?Q?uceC2FF9elLu0eBOiLJsq3jsvQFNxkFJZxRUz4H2gdrg4jfS1RW1KM01CZWg?=
 =?us-ascii?Q?OowV9c9eTDzo4njT+HqxU69geAbvtcVas3CwcTPx98z8P3HXnzFATgfwk/kn?=
 =?us-ascii?Q?y+3KCks8fEubjmjGWD5RmwtVESva3a4QCRfvd1BWUeu2F5DVXdJNoSgs+plO?=
 =?us-ascii?Q?xNm6H0UQEMl1Qk+9ySgpdnJwg/VEizlPEt/c+KP94LXXis8b+SueYByJXfU5?=
 =?us-ascii?Q?AzZZs7Q/SHzuP+lo3YYVWCKeyvjnaO3OfP7sI+m4iIx7cnWTKoCjwa/NRCj0?=
 =?us-ascii?Q?Z6sIAYtMarZQFFdx46FPanKv9vZSOcY+vlasF7s/06KQko3UKuRg4svxdcpM?=
 =?us-ascii?Q?XU6MzDE8Tj+9jtziEOs685WS5elTN24XJJJFRJ3lNJGEfXldBCaS9Gjw4HpM?=
 =?us-ascii?Q?AUcqQsSjvO+owmijba3iM3fZLp2bq/+Ol3HUHR7Ipa1D1j5Xesu5Bh8vCLO8?=
 =?us-ascii?Q?nXR4VLROmgX9sUECCg5s4jA1l9Gks/Oz09VblS4c6jbbuSdUU/OJTlPOLvfb?=
 =?us-ascii?Q?t+rPfH1ZorVi8c7bH3bP5tKFBzmYKAWnAAbiXLYK/32NEqRlPzjBlHWl7xBs?=
 =?us-ascii?Q?FNPoth+2IrzdEijzC1Di3gSLm5iFrXYEzEboKwPy/wuj82eaGpyAf/JtxXn2?=
 =?us-ascii?Q?ntgfX70uPziNuD1+2VQVz/mtTgjRb01bHUUSiDC6Ic9zxZiB+1MeUHCpk6Jo?=
 =?us-ascii?Q?T4pHIku7R6Eg+601fh8GnXu0IrA2CjuZtyyBGCaVqA7gh+5IQrXVxX3P07It?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7211f0-44d3-458e-2407-08dd9a94a73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 07:29:00.7482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1w9TkD4Zg6VuRHZtqkSKudmp3ZbTPKGFeLMQ3wRVYdQTRiyWBbO2G3cR3DdY9QhJeb8NsUi/HyYRrYGyhdDSgUADwIP8CdmcPrsfGEFivIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11477
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

Hi Chris,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 21 May 2025 22:04
> Subject: [PATCH v2] drm: renesas: rz-du: Add atomic_pre_enable
>=20
> When drm_panel.prepare_prev_first is set to true in a panel driver, the p=
anel expects the MIPI DSI
> hardware to be already configured before the panel's prepare function is =
called because it might need
> to send DCS commands.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v1->v2
>  - Fixed alignment reported by checkpatch
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 4550c6d84796..1202e0ce0188 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -531,8 +531,8 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *b=
ridge,
>  				 flags);
>  }
>=20
> -static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> -					 struct drm_atomic_state *state)
> +static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
>  {
>  	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
>  	const struct drm_display_mode *mode;
> @@ -549,6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_=
bridge *bridge,
>  		return;
>=20
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +	int ret;
>=20
>  	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
> @@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_b=
ridge_ops =3D {
>  	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
>  	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,
> --
> 2.34.1

