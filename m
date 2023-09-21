Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC137A9214
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87C010E568;
	Thu, 21 Sep 2023 07:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7B110E568
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:34:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg6eRERkp4De7R34mATfyEjtcaPVnHyDmkb7TakN/fU1AB/xfqr36sXS6gZ8Li+PkjqSr5eO7AJG4rKHnGw1kNmeDs0FyYSpd/sAg+gWAhUss4D2NryEJhUMXsgfrYrMKxPCMBux03UARBOrsZbQRIOUq8VqKEn1ghRRcjGtUdDTzcDMy2yzmAbhHnABGajte5ZgDF6aEFZEyBMSQcQbsiNQWa4cO87GjmLVR8KQZfhvPpCSL42CwC4cPjsy4V2wilJ8MNbzbkmAk5n+rvnkvg2IbMKWixXjXDd5e076AjmyKNcqnWb6m0KphHQKwz+xKJ42NgzoiNEswV5gHbMCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/UaJmcgVWHE6PIAY95hlW7DSI0Uk21/VJU+ShgiSOI=;
 b=D70lfOoa2Rz3Eh+3Q/E/RS+7RN4ibFx/YK9t7HK28yg460jwVXPJZhNevRudFkTjyj2nVZC60DrsbFWOYmHXN77O39J7qZXQCL1tqLOIqN65uLGZUFCZKRknTKGDrwHMKpvF8uaiO6pvx/SSfQWtTNcU8blNtk7AnoeRRUy2mU6iMWELv2cA7Sycnb6O+AnYGTuHWFuxiCWOpxnbKs98eCis19+xhYIz3O9/P2a/MSZZ7jVqicW+SD2ndAQIxmeDeUY0cDXE3NM6MB9uRg17l49MzIr4+tCc+CBUpPa1fOdvdyF6KvlnCpUeX+nPIV2oaK0kDMbVn5BA2IfcetGjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/UaJmcgVWHE6PIAY95hlW7DSI0Uk21/VJU+ShgiSOI=;
 b=JyYM01gKQBWWeOc93GL7IV9ReJIxfwLjEToH1NLcvqyBbqYJcyeheedJNXBcA2H3II0BZMgKMC61NZhPWFlxjsbU2sfilwraI7BTKG3+Fo0guqSavoiskmEsvYQ6dsWAT3R1mp0cWByMSfTxrcFI42RQoiDkcN2zxkDShO097sc=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 07:34:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 07:34:24 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
Thread-Topic: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
Thread-Index: AQHZ662eWr7cl3xpJE+lZ5+GA2ueirAk4xpg
Date: Thu, 21 Sep 2023 07:34:24 +0000
Message-ID: <AM7PR04MB7046B544BFB1BAEE2335E7FF98F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-6-l.stach@pengutronix.de>
In-Reply-To: <20230920103126.2759601-6-l.stach@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|VI1PR04MB6880:EE_
x-ms-office365-filtering-correlation-id: 1733ba88-7072-4397-9af0-08dbba752dc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FWmtwnAszcoCGjHA4A/ghjh5JCqGCUMb+ejk0tIf1D7tVNOqAq5LaIOm8oY5vCuHvvmo+5ST8gOuhOagG31aztLWlCT7MwBuOdsFivJBq5okXJq67JAyiJbdeVfaiUv4uq0Ag6owDhRIWa+efYyoaZWW+tfdJ3k1JCOxbLupe5F3h/H+xm4eM933hfzzT5KUbWkSVP1EH+EXtE05IOtVsB19UOBxnvl30nITPprm5gVc20A6xVHq7t6kWiP150BKvWkmBxga5qWl/NPfxsVmplf5kUuZjcU7Dqy258fWViCIKD29JN9Eew4wm1zPEBDrDcYbZOgZCkBY8E9emx/BM9pWS5Uc0hC3EQDhvOk5kXSzRxVdgDuR0YFEscl7Uu9jary2hE/EK1uaaaOkSrl4QUVMc+X9jgF5Pt5x2507vMcZishHuV2lzfgNvCs4zAa3enovfrTjHSX0sv0MZ+G86hzbp9ZAksiZyNqrhP6TxL93ESxzSAlcsVotFkAkia/AtY4gTYeV5w3+rzclEgE10qgQBOnAIuPyJMIImXs03Tb2Up+zbb+Vqpiy386IAIFJqHjZFWvJPK084RWMWWIQ1Ymp+l3UsPUV/Rcd5VHuOglWuHa76ool7mhRR3xv5OOb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199024)(1800799009)(186009)(86362001)(8676002)(55016003)(76116006)(66446008)(110136005)(54906003)(316002)(66476007)(64756008)(122000001)(2906002)(478600001)(66556008)(38100700002)(38070700005)(66946007)(8936002)(41300700001)(4326008)(71200400001)(83380400001)(9686003)(26005)(5660300002)(7696005)(53546011)(6506007)(52536014)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hMMwii9zlRfg/XQh7/HM63WGo87DYYiTLa8fTldX8xHiduedrCa3PM0vS85R?=
 =?us-ascii?Q?Kdyi3r8Uf1cHpuyMNTDWCHPpGKbvyWbJ0AFP9bFhtBi1uR0PoJOxt7MmAcow?=
 =?us-ascii?Q?rFdByvJeH1P4H0V/YhAYfxkO+iVp0oBMp8tlFZtNngQT7YwLK41+1L8GiMeL?=
 =?us-ascii?Q?wigSO47HJ+vH80Hi7eck3swrF/PNd5xK1MzEM7GJWSticVBrccyHqanCTcqk?=
 =?us-ascii?Q?NIJnMrDugfndUR05tV3/qio/NMpl2Kuvk/EaQZwKPH6FMsRgfDLbdhMLK3M3?=
 =?us-ascii?Q?cCtCXylzIlvk23MHUYIj8BVn9oispTa2nicfLVGaHOTRAM1QWlSQxwvmI9M2?=
 =?us-ascii?Q?XcqJ3Q4da58ea5BIp3bG82FWi/jKtDCZWAYb1MY6QedLu38wVje0uKgosb2w?=
 =?us-ascii?Q?yB2M8VEO4+UWsBFkwBs+QB1j9M0n4zXltv/a+85WlXkvMF3jfRcq/BzxvlyW?=
 =?us-ascii?Q?9fiacfSKyvdttov+nJmglGJmurP0K+79Kn0U4wQrsGSy4Jg3GxoeJPsoiUjs?=
 =?us-ascii?Q?Fp4tFT6Svt/ZdwF1v1dl1TZQsofHyaw1m4ypmJLDnzxJYAHD7aKXL5SPsjIe?=
 =?us-ascii?Q?oYp7T9O5hD/tqdtLqscE/iVJ9408HMo7LI2Rz5SY8mDGPYH3xfvZeIvuhahR?=
 =?us-ascii?Q?DkBc21iIoAtprsh6oPhN/qN1OtjC6wLAB+K+N4Q8V8ULpWZaAJYD8js8P7NL?=
 =?us-ascii?Q?0fRujV64vst/UWombiP0TRm18XDaceY3xtQxpf0eIZLMwUpWnwvNqyKXzGfR?=
 =?us-ascii?Q?CpmrgpPWqaUf8SOl3uyFExS3evDM3xawhEJ2WP35T/e0BH8tqRAWWmZaKolh?=
 =?us-ascii?Q?WRkO1GRnTJgZ+Ki4SIcxe8G4rqql6+CPIHj1alK7Pz89JCFhVx4KUzOEYltN?=
 =?us-ascii?Q?5UO497F184LWddaRhJLYBm/yh+DiAVD4+yN69TymupP8BoZoiC0Snn3Cd+Yf?=
 =?us-ascii?Q?Osg655B517de1aabyY9geBaJfZo1kJiVgBSBRpAoUtupBvLS1S5b/8a1qmZx?=
 =?us-ascii?Q?f9EH+Kf5qkYLEC8jhGNq3jtGWRP/Q9Io6rSb2laEm8j988TQHv7AcEgho+nC?=
 =?us-ascii?Q?2P58Obp+kY5QluQsu9p1D+YAkLMalaGotdqRokBLJWEACeW67X6ztipB19TR?=
 =?us-ascii?Q?2YDdroPUCkQX1EFStb2BUmCg3F6Hlj22t4+hHY0nug/a8J+RC3/F2LFGWjYD?=
 =?us-ascii?Q?BfeiqQnqHFKl7TUTGyIUW30t/sHZz5PznxtYnQk5C9vlTD8sRCaJQWGCEy5j?=
 =?us-ascii?Q?y9faHa0DdXplEr41D3JW+NR/mKXkRdVNSPh+O2gGwiLlE07EOJBiS6x9PeFH?=
 =?us-ascii?Q?U0pm7WUHd6aKzUtSf0icB75vdhxdSSj14D2fVtLLnKRVn2Y05X8g4uMmD6be?=
 =?us-ascii?Q?0I/VsNlbZ0yysdUwMH3lxVb+uYOKkn/0uqRJYgIJ2HdZnqpL0bnDinJmd5fK?=
 =?us-ascii?Q?RBh5MogSEOE0Nedv//+VyxYq1Mrl7ih54aVZ2Bg8N53OY/xrOaIzNzmSYviD?=
 =?us-ascii?Q?Sixi+XM3m1Y01+1BPnv281KUhQHIvw0Gb4PsQ2hv7mr6o6PG9D3BvtCgFDTR?=
 =?us-ascii?Q?TqfI69u2iVvbO1toMcg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1733ba88-7072-4397-9af0-08dbba752dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 07:34:24.4420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnYy3wFQC6Lhh1QNlU7izkRZhxqjmAKBDmszQnkOc+WjryLQjTsf4rOMStOkk7amErV+qPmIonh/3NkkjA1Qow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880
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
> Force a modeset if the new FB has a different format than the
> currently active one. While it might be possible to change between
> compatible formats without a full modeset as the format control is
> also supposed to be double buffered, the colorspace conversion is
> not, so when the CSC changes we need a modeset.
>=20
> For now just always force a modeset when the FB format changes to
> properly reconfigure all parts of the device for the new format.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++++++++++++++++-
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
>  2 files changed, 37 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 18de2f17e249..b74f0cf1e240 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -30,9 +30,25 @@
>  #include "lcdif_drv.h"
>  #include "lcdif_regs.h"
>=20
> +static int lcdif_atomic_check(struct drm_device *dev,
> +				struct drm_atomic_state *state)

" checkpatch.pl --strict" complains:
CHECK: Alignment should match open parenthesis
#31: FILE: drivers/gpu/drm/mxsfb/lcdif_drv.c:34:
+static int lcdif_atomic_check(struct drm_device *dev,
+                               struct drm_atomic_state *state)

> +{
> +	int ret;
> +
> +	ret =3D drm_atomic_helper_check(dev, state);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Check modeset again in case crtc_state->mode_changed is
> +	 * updated in plane's ->atomic_check callback.
> +	 */
> +	return drm_atomic_helper_check_modeset(dev, state);

This additional check looks fine, but it's done for every commit.
Is it ok to move it to lcdif_plane_atomic_check() where mode_changed
is set for those commits in question?

Regards,
Liu Ying

> +}
> +
>  static const struct drm_mode_config_funcs lcdif_mode_config_funcs =3D {
>  	.fb_create		=3D drm_gem_fb_create,
> -	.atomic_check		=3D drm_atomic_helper_check,
> +	.atomic_check		=3D lcdif_atomic_check,
>  	.atomic_commit		=3D drm_atomic_helper_commit,
>  };
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 3ebf55d06027..8167604bd3f8 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -647,18 +647,32 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs
> =3D {
>  static int lcdif_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_atomic_state *state)
>  {
> -	struct drm_plane_state *plane_state =3D
> drm_atomic_get_new_plane_state(state,
> -
> plane);
> +	struct drm_plane_state *new_state =3D
> drm_atomic_get_new_plane_state(state,
> +
> plane);
> +	struct drm_plane_state *old_state =3D
> drm_atomic_get_old_plane_state(state,
> +
> plane);
>  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(plane->dev);
>  	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	/* always okay to disable the plane */
> +	if (!new_state->fb)
> +		return 0;
>=20
>  	crtc_state =3D drm_atomic_get_new_crtc_state(state,
>  						   &lcdif->crtc);
>=20
> -	return drm_atomic_helper_check_plane_state(plane_state,
> crtc_state,
> -						   DRM_PLANE_NO_SCALING,
> -						   DRM_PLANE_NO_SCALING,
> -						   false, true);
> +	ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, true);
> +	if (ret)
> +		return ret;
> +
> +	if (old_state->fb && new_state->fb->format !=3D old_state->fb->format)
> +		crtc_state->mode_changed =3D true;
> +
> +	return 0;
>  }
>=20
>  static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> --
> 2.39.2

