Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D587A91F1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C32110E556;
	Thu, 21 Sep 2023 07:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92810E556
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:13:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qdy8kBRUG6cMmNxeY2OUtmDsoO6RSGcYXCD4SX+Uo8F1BRKrP1+q3P2b0etM3aHyZRjM5E+I5XdzDJwcBiT3rc27Or1bIZdCpzJWFJqRs/jM0ZMhaJ1+w1bYTPlKB86AhaJqLZURCwKFTPtosldD5rYnvhNHTyeVK7EU4vzlCeUv930Jkuzq+huIN/wCLwkBndJt9AOrMNt5UooZIqLUfW7zIvkSn1X9iDvQfa2lQjgm4DQ8Zl5A9mMeTssRMX+JLpgNcBe7zgUkXgRexF8EkJh446Ur1GOWeGK7Pox4/ApW3FiPipjIvu4ww8i44XXctpmQ7Q0nBWDO1+mfdNPvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXV91J2swl/OTWe7PDTxtmIo7Ys5S7/JDsISLtV4wvI=;
 b=OBCgE0v2o8HIZUqLm5eTnPRmPZ3BAj6roFA0Ikoe8GVwea3uZX8iD1PVTsdyI+m3cpbbZFXwQHC8qWJf/fas6mOdnSteJhYCB60m90/lJ+WqKBEVZCXjM7+eg6Ve36UJTXBfX0JxXlYiurc9ToqqmuZNH+8Zy7kBt7JW4xbDg5CuiA58Yvy3VVLR1AKNIkzeAO/fYwRkbOrb6iQlkc91Es753KKSDbcAxqooWn+XdxXJKGz8ojixqqD7jZQ7993+YXf8grsjn16go/MH5IZ7MI0r8GPIlPWdA0m4qz5U3nFdkSrqUVnVrukDPqZEWq84jU/4sUi/xBcHPfOCxCTc8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXV91J2swl/OTWe7PDTxtmIo7Ys5S7/JDsISLtV4wvI=;
 b=L1C1VSf/hn5RKbu51EmXjZRuBssSgo8kfBKEM4uksmO85j4iH6Co1XeuTb1xwdzWtvo9yWOIr6TeBwy7bdQqBfpD/9GzKckISbhf1wTZYTBihHBdoq+ZortH1SZOPIYtYJ/y7Q6IEQ48PFxl++2s9d7zbdRA+3TUAemDtUxc23k=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 07:13:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 07:13:44 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Topic: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Index: AQHZ662fEUnhuutWEkO/NTaz1A0SHLAk2e8A
Date: Thu, 21 Sep 2023 07:13:44 +0000
Message-ID: <AM7PR04MB7046AA99475489B1220D309998F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-3-l.stach@pengutronix.de>
In-Reply-To: <20230920103126.2759601-3-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS8PR04MB7608:EE_
x-ms-office365-filtering-correlation-id: 42142e30-3308-456e-dd12-08dbba724ae7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m6elffpXR2BvvqkR+47y8HM3fJ/qyXH8sg3ZvGVdvtvr5uhCSs7M7+zxwv/hMDB5azsQJOyAbxHvAzeXCUt9BMwCOkVYSzQcrCeljStaipwVI26e7n8/hQchtjNclL7Xny2H3bxkvl1Hauy/58n7RAtswDSRGKS5IkKzggO7SZ3/U1oZDjQdSo+dfr3toewl0x8cJ3feEVDTds6KmmHugYimW/5LdRPb1z6DprqGHBSi9yv43tJPdBE6y6TyUH0wkoDhsJrkJ5RZgUAfSXxAUYboN+4QiNJygCCIgOHya0yRRPRgA2U6YAOrwIpAGrbyEGYqBzDMwSVj6MJjEZMNqJ8UIJYMEqT4ck93FCRB5un2Rmzsf7isH5mzYDo9eETZGJgDhE4PG/oykzfVQUEvxtoE/IMauf3dr5YgAEHOYefGYmTrkLI64jSFQGzFx89BXBvGveUjhhwtDc+w5kzT/cR/qNVpXyjsgwR5AF/VEOokWZCBJIkvpV3xKxWF8dbpSSpLhNQBmq0FKZeO1mN+oeI2i0c8PFpua+az62E151EEIc2dWJYxRo33X43ltg3w25P6ykICwVqZW2g0W7cU/725jTARtrJThdE7Z+kxtgfLwVUK09KE06E50wvZBmky
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(186009)(1800799009)(451199024)(9686003)(53546011)(7696005)(6506007)(38100700002)(38070700005)(55016003)(122000001)(86362001)(76116006)(66946007)(110136005)(71200400001)(478600001)(26005)(66556008)(66476007)(66446008)(5660300002)(52536014)(4326008)(8676002)(54906003)(316002)(64756008)(41300700001)(33656002)(8936002)(2906002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Iv0UkyUF5vjshnm+9VtAQNVDA0xuzS4Wzm0S0dFcy1jZv+1EvFnIUHbhIOrI?=
 =?us-ascii?Q?1kxgLbYMiawAzJMo4R/5ae5YETZ4xHQWqYf0toqYDpAzovJ6cLSPt7AtbutW?=
 =?us-ascii?Q?ME/2gSzJ48l4IL6t+KH8XUpsh9l9cWVLDkjGOwQFiDVoI/sRZhTzZ1upoZn/?=
 =?us-ascii?Q?EWfV3SM1ANU8hjtbf27KjCYRUY3LNLzvKt8mVFJoVg1TFZDPtzQyiWASeFBH?=
 =?us-ascii?Q?8fIJ9Qj34McHI1ZWK4rjDl8IzBcruglPUSnxuDzcB2qXhbCxiK+zDB8UL8V3?=
 =?us-ascii?Q?15UezofPTxAqDBUQzlIf+CR1ViY5M/YVK/zNXlHvqFuBNbH/C2Xa0DFmWqM2?=
 =?us-ascii?Q?/Hsd8SaJ6wvAKp6Hxzh6eLLroodCLwVGAgueK4i7hWtBrBnLgx80AnYvqeGr?=
 =?us-ascii?Q?tD7HyPiNCcdRaegLtD1zF271bHzXlSmAOPN46aHM4YWNs2vN8bt4Mkoh8/js?=
 =?us-ascii?Q?/miMoyPBiXE3V9dMbnhJC5Xxt4QAZ6QMibH9iwvTbEv2ark8UcMwXI1MzpH9?=
 =?us-ascii?Q?oi84b6x/zHUiv0MCh+jp2B/F3AAcbh5S0f0NmX1Oiml5FHEiQUbhwlBkgjTs?=
 =?us-ascii?Q?kdDNZ4ThEE0ctJiU8X74Xsrf14Xaf66s2aMz5Vnu448iBvigtqfcgVeRRD5F?=
 =?us-ascii?Q?saCL2PZ7cQG95KrgcTz6GtH+2PxXaWZ8IEA6+VvGwtUhrc9CGA3QLAQbDxy3?=
 =?us-ascii?Q?+BOOxpkJffOA4uVsUa20qCfYxwt7JzVGVoqINHd0b7kvDqSqcrTXFOsqjTqG?=
 =?us-ascii?Q?o9jhVFaEauXp2Wm+43kPpMBbxF27N8GWj9b0X52xy838uLlSZgIuRvtv0Cmx?=
 =?us-ascii?Q?JabO/JNAAiiDLSg3Y1BTM7/FwTEOi56bSGTEyOxNEIQOL98sKehIyzphKhJg?=
 =?us-ascii?Q?sMmzosSbiNgaS5Rcnk0yB/Mes/kpklVXviTmsa51dDJneH1YmJcJmYVNv3ip?=
 =?us-ascii?Q?KPKXROA4ue+h9u4bqYQe5f8HmKy0NBw/Qc/2bBawTyVGJISUZwydUeP3ttRE?=
 =?us-ascii?Q?bXDC2pDUjf840BfHnaAw7IOM++WXYPxO7Ugz1nstAoz4R7EXWqnst8EqcXf6?=
 =?us-ascii?Q?Va9QEZXuQ5dEsNy3VhHG8/Emk3bdolTWnnDg7k/1QzqL1PKnMpcKAcYoqjui?=
 =?us-ascii?Q?T5h5HZVr+TfaOm6tyi2qNCSi4UU7Yk81+qcdbbluRoO3edLvaLPT2Vi+VuTl?=
 =?us-ascii?Q?6zMKYdZCDKZM9kB6xYGa+B0pHCLyeZG8VIqxUrMc5ABg6bwIyAy/2q/hf+HW?=
 =?us-ascii?Q?Bh4ZZbZfMAuMRIuPi0rgh9DEpkiTT5GLiqZ2bD9ElXml9IDyKw3Wt0gHKvT3?=
 =?us-ascii?Q?qkNeMyteciTOmxA65l8en6a4kG25uz1SJbnHDELwMy7drvSLA9fSOppqz3Up?=
 =?us-ascii?Q?khfhMOvdzRth2+3kx5M5VwYu+RetVGvxDovHommzWcygG8IQqb5MlWZ2NdZ6?=
 =?us-ascii?Q?DMl+oKa1vZn3DkpXRlNri5SvkIxyle/64ooKuiH2O5MUBxoVmmhRrSQ1Y5bt?=
 =?us-ascii?Q?4WIr3/0cM79A5JtmFraQRBviGhX4pMrAu1R4dpVvT2mS2m5TNCws6PxE+Yac?=
 =?us-ascii?Q?5rBabCQ1MZkl6jPhcS0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42142e30-3308-456e-dd12-08dbba724ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 07:13:44.8573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 31jOzqBu5WBnV5nlcvre3atB3iXSVhB7syx7DN9bCmxYWuHTYKaSBktpmKPrPCyJM5Ut0MgpXEKssMH5rzZmYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wednesday, September 20, 2023 6:31 PM Lucas Stach <l.stach@pengutronix.d=
e> wrote:
> Allow drm_atomic_helper_commit_tail_rpm to setup all the plane
> state before the scanout is started.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index f5bfe8b52920..4acf6914a8d1 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -505,6 +505,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc
> *crtc,
>  static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
>  				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state,
> +									  crtc);
>  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
>  	struct drm_pending_vblank_event *event;
>  	u32 reg;
> @@ -513,6 +515,9 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc
> *crtc,
>  	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
>  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>=20
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
> +		lcdif_enable_controller(lcdif);

Moving lcdif_enable_controller() function call from atomic_enable to
atomic_flush would change CRTC vs bridge enablement order, which
effectively makes bridge enablement happen prior to CRTC enablement,
see drm_atomic_helper_commit_tail_rpm() detail implementation.  The
reversed order potentially causes malfunctions of the bridge.

BTW, even if it's ok to move the function call, it would be better to call
lcdif_enable_controller() before CTRLDESCL0_5_SHADOW_LOAD_EN is
set so that the original sequence is kept.  Also, LCDIF chapter in SoC RMs
indicates that the shadow load enablement is the last step in
"Software flow diagram".

Regards,
Liu Ying

> +
>  	event =3D crtc->state->event;
>  	crtc->state->event =3D NULL;
>=20
> @@ -552,7 +557,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc
> *crtc,
>=20
> 	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>  		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>  	}
> -	lcdif_enable_controller(lcdif);
>=20
>  	drm_crtc_vblank_on(crtc);
>  }
> --
> 2.39.2

