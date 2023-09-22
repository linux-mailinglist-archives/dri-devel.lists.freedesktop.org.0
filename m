Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFA7AAEC9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 11:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7F210E641;
	Fri, 22 Sep 2023 09:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A291010E641
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 09:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmU8jSNe+Go0e356NWJCDUL3dlYa6qWr/7Gfy3uVc6I5kbuXUaNyrS91teXdUgw835CYPBCP5HXkJIJbqg8Gn6/gMbE64CHx44lXjLyooRBa9eAlAn+YBl6L45tkfbiooivPvEcDjxLFLT2nZN8fNsfRW9BhujWlst1gWG/aOEunL9McPyRlswCxUKayLjx9uZzo6KSn8zinwqsqDLVz3h3ThIDvrnTYjs1jwVg4Ou5MqrIX7p5qoUTfgWruWNX0BUQzLrN304i8ypQHJSP/X7DF8hWJLtPAnlJzXhQ5W2Gp0EL3b+uDS/vURIDctutDlSwXVhZ/StshuB/mKamN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKgiA0yk/8YYH32cPiWKkKGXR3/CQQvjDoQ5TLIn+4g=;
 b=JHsyHzGgy3gtfx23riSsIiA4pF/jv9F5Hnf57Pn93lhvmf/aKB5FqKQhhzpq32D0ZJ6zVNl1nKoQ5ugEWPzYtbAgR+F57Pji2Il2We/dEjPiA1Mmm2Z9pDw/fKbJKiYq1cdlOLIgOPss/nL2i9JW4pxJvS1yD8IrnOm+2DXDriDvrcgXaFlkJ5jQaFjbF52rECW8xXSKrbd5PZx8tKWnH0rkgDcCHpmKO33N1YnwcwMlH42Enw0vEovqREl3XAWs6LyIzlBQu2AStSDqzPL9QX7YOYHxTrG0ggdWikOpwZwLoWKMetwHSCHoatbpGfWjh+wUQH3C+8Bi2FEwV8O+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKgiA0yk/8YYH32cPiWKkKGXR3/CQQvjDoQ5TLIn+4g=;
 b=JnZCPhayh2lGU8F3E5qE1zgOOsMI8zs6othfyrV/UMd2v8UQDUcomaWRoLkWjR6Npl5DwFA/Zkmzndp4i/YYnhDaMPB5PhEFEbz0mjUnK94L6MWi13j9izhAKcgiQApUhBZDFn3Z7qbB1GXjn8XzcSCbc0m3EtVWsSU60GsV2dE=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 09:51:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:51:34 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the
 atomic commit
Thread-Topic: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the
 atomic commit
Thread-Index: AQHZ7MantD0fnbN5fky/sv1JT6zTobAmlvuw
Date: Fri, 22 Sep 2023 09:51:34 +0000
Message-ID: <AM7PR04MB70466A7C22B15EB701B9543A98FFA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230921200312.3989073-1-l.stach@pengutronix.de>
 <20230921200312.3989073-3-l.stach@pengutronix.de>
In-Reply-To: <20230921200312.3989073-3-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DBBPR04MB7819:EE_
x-ms-office365-filtering-correlation-id: 57f2e454-1ff5-4db3-eb9c-08dbbb5181b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w/xxH/VcemflILEZrxfgMfzrmJ0mU8zlOlMu9zxQKwjrp3dJ5c4M3psE6Vp7RHy9AX3o4lPB+9ifrh81PYoo5SjHL9p5UqZKBDGZSWDb2yM9Xe97HEzaQ4+kple71Mr6PM7d0+TNaC4rfPa14TVvL5GFYWSnqRwXg/eufp9UWpRUF3VyK5fNqqfclDgVVCFkPatfghOuc1qKHeahDsCr++UiPvYBquHLi2vNPnyePbAislyn4IbpoCB7YtEwYLSwRZZyct9x1WMYs0ycptkacvjbplmpBcLaS8ENtLx5Ktex4LiCbDF2rHMFOIAayutWyu9tJwOpy9SiaBo6O8n45C0IbQDtD1cIC9rbSJFOqTv9OfnWnUrkhEfmksAhIFbZ0ElwsW/V7rNhLSjtdmLW0vMMgLUhf5ibdUXaEg0xoi1HB+xWfW2zckKd8E5KBmF5ow+/RJIyg7UZRQ1wPGADF0LckiDcTDWllwMUs3F/Utlead4PXu59X/tUQeyRTnDf4QsiZOlJ4agNm3ecbmEhQADHQgmez/zIFRk7RrVzMUsh3+VqCL4UT78/J/DVmM2XehJu1nOTXcXPRmgY8zJyFwoezUKEAUyyqEDbxJf+C/FcNXLX+ygS8dwNostu/1y2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(1800799009)(451199024)(186009)(4326008)(6506007)(7696005)(8936002)(316002)(53546011)(8676002)(52536014)(54906003)(64756008)(66446008)(110136005)(66556008)(66476007)(2906002)(9686003)(71200400001)(66946007)(76116006)(478600001)(26005)(41300700001)(83380400001)(122000001)(38100700002)(38070700005)(86362001)(33656002)(5660300002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ldZZN+kFiL8hzgB8IlCyceK/qzU1hV/5KtQzeVNFeXn1vJenkcHvIIJ0M1S/?=
 =?us-ascii?Q?XQduX1VU3nRJ3SqIPruAaPkoz/hsgvyxRuZAnLz4ZEzgsCjlvgVFYiM9HCTs?=
 =?us-ascii?Q?SQ/2gSKYbGeU7EzT0Xf5qM4uVgHDGwNOeC/TMfmqsaZQTBdu8x4dkNFSPvwq?=
 =?us-ascii?Q?XyTFcF9FQ7vm6X8ufPNjhMgzEMy6fJgonA2ElxND28lUmQWJ9D0s/9IadO6J?=
 =?us-ascii?Q?9/Ywx4gyLq+MLVzeqblNKmNjAPhdzXLrYv6V3XEw90vIjNGWd9mpdy64eb/Q?=
 =?us-ascii?Q?2gRPyfoDxpbPLtFUF6VO4oxSWMrg4S+H260hCcvDFDdJ5xwzrFlEardmeZFu?=
 =?us-ascii?Q?K7bYTv8lWfnK3fTSnx3nG2h4Q393nRmaSp5+xHWq+oW6L+rNHK7RHlq+fAuj?=
 =?us-ascii?Q?gTAt2oAEud2kGzi6m0wmIPx2FugP0/1wZtv6RPJ4PV5fTjlo3mUf1sUkDA6L?=
 =?us-ascii?Q?jBgwt7xvg2/LZfSMPmz7MEJnMX1p+JCFrVFhcRnYi0oKDqfyYdTIAV2PkKxJ?=
 =?us-ascii?Q?DmBwnMCX81rLRbjl0sZiowEhb0XbtcmGpb2JCY2cCg5IphbFvd6NYHUYogqO?=
 =?us-ascii?Q?1rQWQSCb2rc70IrQcVbegdiKWRaqzjLCpr417PtXTVi18QIdptQMyXaG3uwn?=
 =?us-ascii?Q?xNrqs1TSaToqOnct7fhKPsSxPJIfQHkbSkzAbUDas1IYAGNCMVu/Ew2SRonc?=
 =?us-ascii?Q?GWnZF9qu006YINmE8Xpx2SHrcNABhdPaHL84WqngT2VM/vN4+KBqlhFkHA3Q?=
 =?us-ascii?Q?YttG+fMHkwOpniiDoX+koNoYO+Yb4lNJNitMoj3fPznZ8JrpZs05D4p7ZS4P?=
 =?us-ascii?Q?Yccba9Kq6zsKbuPZCR4AN3B6LlIt0Qvtxvfa5vcn23RId14ownXrOOh2H6pJ?=
 =?us-ascii?Q?/5Dj5D9SHLU/wczpLmMslDZShzel6/e+timsig36waQlHVVQ4GL1Uv4ZIFqb?=
 =?us-ascii?Q?b9llGDRx/eBv3co8iGUS7GiXaJHV3DSdxKLrZ9W6pMC7Nn2D4W/iUgg2yJNK?=
 =?us-ascii?Q?Nz9SFlSu35i0ce0PxIXiXMJP9uB5eN6y+f51s3XrRHrHnqS+2vQ6MMHm+C7s?=
 =?us-ascii?Q?2brrCph4vD75Cyisf1COKjqDC1w/2B4jzrmXKRYAJdiOm5Y1q9eMyvSzEbj+?=
 =?us-ascii?Q?mPwusCdUQ0qZQlbLzPuEqI8teO009S1Xh7CzzWPfkUANj6LAcNI2SYi1kphQ?=
 =?us-ascii?Q?qau5isa8E/4W3ECKZC1jriZ1BLCd5gZuEwQ4IC4A5FcsqWcfqFl6k8XJ0e4n?=
 =?us-ascii?Q?HsVLFbwvjA7BEbJiZDnGS8RtLeMHg0x0dKARybU3Zn+7vXd/iRuYEFWN7a5Z?=
 =?us-ascii?Q?imFyIRzAK9Z4uN0GfSnc12v1UiLA6c+Kbx8a33wNOiJXnvaNS9I1XeWYK5y0?=
 =?us-ascii?Q?/iaYhGy3nelgUmv9KpgyBP68ntN8L+g6vFCECwd178nsMRGylrmpyZZ1dn21?=
 =?us-ascii?Q?T6XCNx5l0Dook/nWTfR7Wt8vhP3ikqD5FOdHC6oyjuLQBWa0ycyJAnCqaVqJ?=
 =?us-ascii?Q?ammkEzhnHg6AccTPcYdIDqE5yp7AYSu+jwgpJfIC5ax6ITJqsOP7E6QA+lsS?=
 =?us-ascii?Q?XzcLGe7kqaj4qA1vT+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f2e454-1ff5-4db3-eb9c-08dbbb5181b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 09:51:34.5796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tUAsvap4lAv9kgm1dzr1VyEa/zOgL0VHu6SUECohQc4JkE1Yes1LOsAuirUuh+/KH6T+MJS4wvXTvZc1QdIvtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819
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

On Friday, September 22, 2023 4:03 AM Lucas Stach <l.stach@pengutronix.de> =
wrote:
> drm_atomic_helper_commit_tail_rpm makes it hard for drivers to follow
> the documented encoder/bridge enable flow, as it commits all CRTC enables
> before the planes are fully set up, so drivers that can't enable the
> display link without valid plane setup either need to do the plane setup
> in the CRTC enable or violate the flow by enabling the display link after
> the planes have been set up. Neither of those options seem like a good
> idea.
>=20
> For devices that only do coarse-grained runtime PM for the whole display
> controller and not per CRTC, like the i.MX LCDIF, we can handle hardware
> wakeup and suspend in the atomic_commit_tail. Add a commit tail which
> follows the more conventional atomic commit flow of first diabling any
> unused CRTCs, setting up all the active plane state, then enable all
> active display pipes and also handles the device runtime PM at the
> appropriate times.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2: new patch
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++++++--
>  2 files changed, 31 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 18de2f17e249..205f6855fb1b 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -36,8 +36,28 @@ static const struct drm_mode_config_funcs
> lcdif_mode_config_funcs =3D {
>  	.atomic_commit		=3D drm_atomic_helper_commit,
>  };
>=20
> +void lcdif_commit_tail(struct drm_atomic_state *old_state)
> +{
> +	struct drm_device *drm =3D old_state->dev;
> +
> +	pm_runtime_get_sync(drm->dev);

Here, pixel clock lcdif->clk is enabled via lcdif_rpm_resume(), and then ..=
.

> +
> +	drm_atomic_helper_commit_modeset_disables(drm, old_state);
> +	drm_atomic_helper_commit_planes(drm, old_state,
> +
> 	DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +	drm_atomic_helper_commit_modeset_enables(drm, old_state);

... here, clk_set_rate() is called for lcdif->clk via lcdif_crtc_atomic_ena=
ble().
Set rate with clock enabled?

Another concern is lcdif_reset_block() is called via lcdif_crtc_mode_set_no=
fb()
here, while plane is already set up, which means plane settings are potenti=
ally
reset.

With this patch series, display shows constant color by running modetest to
change fb pixel format.  However, doing page flip with "-v" option seems fi=
ne.
Also, seems the issue doesn't reproduce without fbdev emulation.

Regards,
Liu Ying

> +
> +	drm_atomic_helper_fake_vblank(old_state);
> +	drm_atomic_helper_commit_hw_done(old_state);
> +	drm_atomic_helper_wait_for_vblanks(drm, old_state);
> +
> +	pm_runtime_put(drm->dev);
> +
> +	drm_atomic_helper_cleanup_planes(drm, old_state);
> +}
> +
>  static const struct drm_mode_config_helper_funcs
> lcdif_mode_config_helpers =3D {
> -	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> +	.atomic_commit_tail =3D lcdif_commit_tail,
>  };
>=20
>  static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index e277592e5fa5..ccee5e28f236 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -540,7 +540,11 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc
> *crtc,
>=20
>  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
>=20
> -	pm_runtime_get_sync(drm->dev);
> +	/*
> +	 * Update the RPM usage count, actual resume already happened in
> +	 * lcdif_commit_tail wrapping all the atomic update.
> +	 */
> +	pm_runtime_get_noresume(drm->dev);
>=20
>  	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
>=20
> @@ -576,7 +580,11 @@ static void lcdif_crtc_atomic_disable(struct drm_crt=
c
> *crtc,
>  	}
>  	spin_unlock_irq(&drm->event_lock);
>=20
> -	pm_runtime_put_sync(drm->dev);
> +	/*
> +	 * Update the RPM usage count, actual suspend happens in
> +	 * lcdif_commit_tail wrapping all the atomic update.
> +	 */
> +	pm_runtime_put(drm->dev);
>  }
>=20
>  static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> --
> 2.39.2

