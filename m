Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DAAAC3C9F
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D83610E2FE;
	Mon, 26 May 2025 09:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bElW8I5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A210E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAodeGgA2gV9N4uP7tL0BS+d6lFDuXtZMMRIAhH3YepmMOH08tS6xQ1u9sfrfEcPK8HJeOsfRLR9cVtflkL0Qkvf5xd/5DCKZ10yOjH44v/fKX6iAlFtijisqU4KApqMgT3EYzRnRLew4x5T+X1aBONS4fq3G0Dr9KDcOUuq7AMiL6VuRX6nrOBT8q8XI5KDnMTzWTqixH2If0XVHNRFrSSyMzvNHbLZyld8ZiUiqPLTP6pW3ORfQYYFfaHXBTOlWKYOORJAk63INF+axvbC65aizawfUVD8MPPJKxf3mgHjH3OrbBOdPaYbjXMnxsKpzzwzXmhrDBPtdiCqxpW6Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHJJcV0/4MSUW5A4XoQkdEyRHG2yEgU1XT1Q+fsZXqY=;
 b=RPRmA83SLmmSkWJc/XE8DL9616R8xBZon9QoMBhi6OD5oaAy3teu8XEYSI8mObCmmamknEnSsl95k2Obx+DxN/VQyFq7zRmmz+fw1biAWtMj+GWLgua8LM9VkLv+pZ32Z0CuLzoMP5TuYxmoF28WpjcEiRvOk0usrrbIlfmoLtI9dXMKs7EwkzRP1/4xeh7U7uVVR+fLf6Ed0n5pcg7+s+D4seaOUKlHrsTOIZ3jq30G3wKKai7M7H6GN9SWErW7j/DX8ZTOYwPio0T65XdfJmY+8yCKe2sl/yS72gJXdQmjst31MN152YLnIA9rqt6ly7PhamPGnqW+naekokMYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHJJcV0/4MSUW5A4XoQkdEyRHG2yEgU1XT1Q+fsZXqY=;
 b=bElW8I5UdoK9bSM62uZ6AV5ts/Y/W609KlEFZu2N0pmQonxOIQECLlLbf0iD1XwqmYbR9UeOHgBPqvT+XFZFDVlCgVTStEiElcoAXjhB/pO/u42svJ4a0tEH4PYOSTCQ9urlaTXKWgTQC4q41QVb4qGnhgYXK0/1MLILBfedOpQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11682.jpnprd01.prod.outlook.com (2603:1096:604:244::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 09:24:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 09:24:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Douglas Anderson
 <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
Thread-Topic: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Thread-Index: AQHbzhvvK7RvQXa8YUe2grxf3jAhB7PkovOw
Date: Mon, 26 May 2025 09:24:04 +0000
Message-ID: <TY3PR01MB1134683A9785850743F26CF0C8665A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11682:EE_
x-ms-office365-filtering-correlation-id: 113bdba6-c8c9-4994-bba8-08dd9c370f4d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mKvdx1O2kpin02MmFBz2J9J5LstGaExmgAGIxmrfbu+yJ6hWeLKlf6/wW5iV?=
 =?us-ascii?Q?/xSacnpLY+HLj0MvmiThRp+/hBKVmJKRb1t0PKM4aujRLsdIa/gT6HN7gjQw?=
 =?us-ascii?Q?j0XO8WLK6d0JaJJ29EfaTfIuLjfO7HbLhWTcNNWFK6dgOb0HjAFYk7FPXjjl?=
 =?us-ascii?Q?SPRhLVMETRO39JWVOSVPk408SKpbwBtYUtmQ1ANMGcpZxDLj0MF3cBtbWf5o?=
 =?us-ascii?Q?PFZbXovziEQmGijPReLmw8DPYH0Xvpqhw8PwFvNlkBY3m8P5hsl1YIksocZ0?=
 =?us-ascii?Q?CNlrkkWl04KyCz1Sc0v95tCyamfvMipBIEQmbHdAFo8BLncpxVD32TCexY3u?=
 =?us-ascii?Q?grPXHLW1LmCH+ZBGtANjyf5Nz6Ha+avxGle+JmKIOgxGKyfslF5mozw2Ukkg?=
 =?us-ascii?Q?HjPTKxpByPwZ1Hojmfpy2uhGNxaZanyB529GMGzZLF83AYzS+I0iBqtqLZ1n?=
 =?us-ascii?Q?rXjX1vtZMMYrdvVbI1CBBNcrslXAV4pouucZjjb9hCznkmQdBmI4lnrJQ+ZM?=
 =?us-ascii?Q?e7vIQK4veCBFwW5a57tLiJZ+V7YP950FuXvqjqU3QDOPnqDgvImcIvAkViXu?=
 =?us-ascii?Q?r9FFdYiqtw1O37kw73CUa+DMOhljWMGcMDpX1Ni20PJOFqJPuFQr1rn/DcMs?=
 =?us-ascii?Q?qErDkBVKx51AtkOjssgwoXTlt1vqo6sDLWHARCtksQ2cWySicwbD7Qj+1gIT?=
 =?us-ascii?Q?43W1EK45SQcFPas1aQ5QGXfZR2IqCxaVXaWmO56KzuH5EBKgIUx9Hyi1WyH7?=
 =?us-ascii?Q?I8KMfPllJtrXy/CzUh7ZHIXr5R3q50Kq7gfBueQUQcH/vyh1x1TDkKwyfH/P?=
 =?us-ascii?Q?HZtIOH24CT4a3vBDw72W+du36DQ0Kdh+rCWKmvKpJ2dMWrfAU8FAK0Ujh6yI?=
 =?us-ascii?Q?w/WwEqMLMhZfToiErK5mlsQYdg7TfEKJFPhaYqxQ0M8zJpV/dmylCXx+F/gP?=
 =?us-ascii?Q?XidkMJjDWn4W1NmWxMtDKLr/NadTYgCp7un+z/ZOzjKTH7o+ZvKysUT6Dg+9?=
 =?us-ascii?Q?U32yHeesH6o7P4xTya92f4doK6zHe+UDggevWfGzNMlOK2n1xuzCbKRZxIUt?=
 =?us-ascii?Q?dNGJQ28Qq2njt5sre3oaijwQHU/DQx7/sZlbMm8LYnvHwRNIirRWsTFmobj7?=
 =?us-ascii?Q?hM9eP28gatbjmsjcG9B3UG7yh5hA9nippJQAzgcmTxdacXvY2ZHQ9twV/9Pm?=
 =?us-ascii?Q?a/r1P+RpGEFj5MAQOsSXZ8EXwQXRZIcAhNg6NkXdzvdkUL+/lX9aW70XIxC5?=
 =?us-ascii?Q?LDLUKRn7PLzTSd+EFlZvbwn0GIiR5PJU3u0RKSVGqsBDDrDSECzFfQYjplS0?=
 =?us-ascii?Q?PgFGn/2l+1JW7MvR+AjBbMQOt1R/63mIHmEOrWzA4i3y2Yaq7uqht14SKwoz?=
 =?us-ascii?Q?vVa+J/0b+JnTVfOvLwKk77EaXQp3I9nP1hHFIk6W1g5s66AZT3p9KQM9mgul?=
 =?us-ascii?Q?uBbUjWgbKJQs+VsXYUkCZXS436egSQm2gWsKdoh/eqcmEfmKJf93kGQOwkpo?=
 =?us-ascii?Q?ImrIIcZBy4jEJZA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a57wB864GKIwYE6npcrT6TifR4WGB9TU7NLYBR+7fYoVUKWW8slb4hh5JFq7?=
 =?us-ascii?Q?+J/Nh+ITbHSipGu2+dDu5mteV++jdCY4fOakyRBZywvZTLUXwn0W0RplEeBJ?=
 =?us-ascii?Q?xqqq0wX4XN76JnG8yWtP/y9TDaHVVJDCwCI6kYs4vSpWwaGju6DoaZiaVUMM?=
 =?us-ascii?Q?e8DTjcBTwxaCs/j5tevx7pYF2hvQdTwZTn0H67qaO4YU4d461F+NzE2Wx+q5?=
 =?us-ascii?Q?0dzw4BDLqImfhkKm+Zw6cuaT8u620gGPfBHj4q3jHXSebUcS+XCg0eZ88jla?=
 =?us-ascii?Q?mjxj1yHq2mMEEmhoGDuHdNJMUvb7uBSrmWZhFbHLai7h7kF5+lHHlf7TTCSp?=
 =?us-ascii?Q?GYSOqdoQl6iAF1QzHD1O+o9tfVpb6eKDetSpFjfHXX6hyT3SrvzyrUuv36iI?=
 =?us-ascii?Q?H2d4NlXlYijp+Zhs+ULhVLmvWyV39l0zDLuSgjduZrGboliGEXtxKsvECdKU?=
 =?us-ascii?Q?4ioncEtOsavfg8b2QNJ7IKr67vR2zqT+ADqgv+va8VtFGnAXLcAtynv8iX8Y?=
 =?us-ascii?Q?pm0gmE5Jrn9jBNOitOB8Ao8JeeKiesU3odV0GBTN8G9+F97oztO+74Lr7shc?=
 =?us-ascii?Q?bgoSq5xT1ygt4Rd8dDrod7+jl9XBvzdJB+RJUfO9YTD+P/slQlHmr+m00o3n?=
 =?us-ascii?Q?r91O/bkdmwjo4vcZx22ODHbhfYklrwo68UudkTdB94R1UCQIepD17oUpyp5i?=
 =?us-ascii?Q?jepOCGkncNEplEvCKtmm+EX5dps1XVx15qw0puMtW0g6PvA2+5x7YzGiUYXQ?=
 =?us-ascii?Q?nrbUIWPKFxSO4Cfl8qilzR5mwQvSJdcP07XoPNmCqZQljKy6zTf+esHqNrq7?=
 =?us-ascii?Q?CVWcUdz7sDyjJMtBn25e2fET3QDVjf2NNRxqGk3pdNSR4PwUfQA/VF4kAlBA?=
 =?us-ascii?Q?pYKyoTA8H5MrmOj2VJaEw3GhAowj51zdNLRYyflym35nYiC0jOr0Ru2rLcws?=
 =?us-ascii?Q?nRRhfhqtXG0m+ctEAGUSmCCXTQur5FyEQg0F+hdxS92ppBHMCj15mnegp5Go?=
 =?us-ascii?Q?pYBBd8SvaQvttGuLSCOwbLQIDLP0w+cXx6DpGrVgcfgq0xDZGxB9RwbDlnxS?=
 =?us-ascii?Q?hSrnClwO0rZg1wqNbLnMD+7/JTjBOpXmWOlxJvq9GFBYzl1QMiISzU1lfBrF?=
 =?us-ascii?Q?3hbku/AqyzrSjGyTSREOX0fCKtjELzQ9YooXm50KXhXX5/rL4LzS1gcn7Apk?=
 =?us-ascii?Q?aPjHxUELGSKJ8A66GNqgmfnu6btTwrbQ7SGLZBwCexW3p4QAEZbds+4MGMj4?=
 =?us-ascii?Q?E7SF8FQBax/VfJiookLdSlxU7dcBkFimLNaxHbyxuafIY2kIFSKMwLHwEn5n?=
 =?us-ascii?Q?0XzfCB69FdtD7GNx8iuLesDogMPp0IIAAK7xeJEQ7g3MO4qbA06EgvzkziGu?=
 =?us-ascii?Q?D05E1LHpO4pOwkBSgmfKaOKitL9jhM0GzFi65IzRdRuOZ1zD6xbgrp6+PyP6?=
 =?us-ascii?Q?4Ny/KJ3k+XfPZeYFPRah+dIzEFO5zbj/9eQ1uhYIxQR2765OqOy/7ojov6x2?=
 =?us-ascii?Q?7fztpc3J+wQ5lLaa9nEOy0Wc8SKOpirrx30x01g9rCPOAxvlC6wjbUH7yIJP?=
 =?us-ascii?Q?K6ieli8mu4ozmvxh18BzZ0042TDhfWbWIrR6n378?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113bdba6-c8c9-4994-bba8-08dd9c370f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 09:24:04.4689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ca3NlAf02XrJThfDmgGaT2+revd78RDAqOzCJQXYUkJRDcWV22ykKEIqZHzGVWVlNkGPn0m6LIBy6p9dxPTYEFRu8474A5KhUSIA4fOz2mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11682
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

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 26 May 2025 09:55
> Subject: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() wit=
h atomic_enable()
>=20
> After adv7511_mode_set() was merged into .atomic_enable(), only the nativ=
e resolution is working when
> using modetest.
>=20
> This is caused by incorrect timings: adv7511_mode_set() must not be merge=
d into .atomic_enable().
>=20
> Move adv7511_mode_set() back to the .mode_set() callback in drm_bridge_fu=
ncs to restore correct
> behavior.
>=20
> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector h=
elpers")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

The modetest started working again on RZ/V2L SMARC EVK connected to ADV7535=
.

So,

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 8b7548448615..7a874bf645af 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -647,6 +647,7 @@ adv7511_detect(struct adv7511 *adv7511)  }
>=20
>  static void adv7511_mode_set(struct adv7511 *adv7511,
> +			     const struct drm_display_mode *mode,
>  			     const struct drm_display_mode *adj_mode)  {
>  	unsigned int low_refresh_rate;
> @@ -717,11 +718,11 @@ static void adv7511_mode_set(struct adv7511 *adv751=
1,
>  			vsync_polarity =3D 1;
>  	}
>=20
> -	if (drm_mode_vrefresh(adj_mode) <=3D 24)
> +	if (drm_mode_vrefresh(mode) <=3D 24)
>  		low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_24HZ;
> -	else if (drm_mode_vrefresh(adj_mode) <=3D 25)
> +	else if (drm_mode_vrefresh(mode) <=3D 25)
>  		low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_25HZ;
> -	else if (drm_mode_vrefresh(adj_mode) <=3D 30)
> +	else if (drm_mode_vrefresh(mode) <=3D 30)
>  		low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_30HZ;
>  	else
>  		low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE; @@ -743,7 +744,7 @=
@ static void
> adv7511_mode_set(struct adv7511 *adv7511,
>  	 * supposed to give better results.
>  	 */
>=20
> -	adv7511->f_tmds =3D adj_mode->clock;
> +	adv7511->f_tmds =3D mode->clock;
>  }
>=20
>  static int adv7511_connector_init(struct adv7511 *adv) @@ -795,8 +796,6 =
@@ static void
> adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
>=20
>  	adv7511_set_config_csc(adv, connector, adv->rgb);
>=20
> -	adv7511_mode_set(adv, &crtc_state->adjusted_mode);
> -
>  	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);  =
}
>=20
> @@ -821,6 +820,16 @@ adv7511_bridge_hdmi_tmds_char_rate_valid(const struc=
t drm_bridge *bridge,
>  	return MODE_OK;
>  }
>=20
> +static void adv7511_bridge_mode_set(struct drm_bridge *bridge,
> +				    const struct drm_display_mode *mode,
> +				    const struct drm_display_mode *adj_mode) {
> +	struct adv7511 *adv =3D bridge_to_adv7511(bridge);
> +
> +	/* should not be merged into atomic_enable() */
> +	adv7511_mode_set(adv, mode, adj_mode); }
> +
>  static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge =
*bridge,
>  						      const struct drm_display_info *info,
>  		const struct drm_display_mode *mode)
> @@ -917,6 +926,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct=
 drm_bridge *bridge,  }
>=20
>  static const struct drm_bridge_funcs adv7511_bridge_funcs =3D {
> +	.mode_set =3D adv7511_bridge_mode_set,
>  	.mode_valid =3D adv7511_bridge_mode_valid,
>  	.attach =3D adv7511_bridge_attach,
>  	.detect =3D adv7511_bridge_detect,
> --
> 2.43.0

