Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58615B48341
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 06:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C1410E1EB;
	Mon,  8 Sep 2025 04:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcOawK7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AD010E1EB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 04:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757305522; x=1788841522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xdW195ycSC8zLvppgeSeftJ749PW4b2XcQw13HVPOZ8=;
 b=UcOawK7d46ulO6vxBhqggHOZOKmoQ+zb+F5Np3cuM2rhUR3cbAi8A1Yd
 6A6kO6/hWtmuRMvnVsjvNbLR1nneulXwZTD89qdrrZfGP0v+5UUi6pJRc
 dIagHj25ao8UUrHMp/fcEGji1YxtTDTSDjfCkLxZ8NWX/ox07w36oTK9F
 t/1EV5CyL2e8y4qFjOFv5KKfEeV5bnw+/Ayl2Z5v7PeYfefY1jr84uGVc
 P8Iz8aVzgMVIMJwWOU/8K8seQFG/ti1U6/Y0w7YjLu5o4+0Cj3A5/PaCQ
 FCiOPkmhIrrZxT2pfXYwX1wgoj8CgKzPLNX3CHb1QjKMLYxV1HYcc+lxa w==;
X-CSE-ConnectionGUID: nOu9HsevTIq52kMvpuUhTA==
X-CSE-MsgGUID: HYwlU36wRMu2FQxuZONXzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59412453"
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="59412453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2025 21:25:21 -0700
X-CSE-ConnectionGUID: 2C7+7xbAToifB01dqA/LZA==
X-CSE-MsgGUID: KLyqFM+cTPu5LNcW+Wbz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,247,1751266800"; d="scan'208";a="172560223"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2025 21:25:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 7 Sep 2025 21:25:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 7 Sep 2025 21:25:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.83)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 7 Sep 2025 21:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+PFjEiWvmi3Gs2GOhOx6d6Z60Ucfay/rbsaAYATqFuXg6H07PUQJFrQkc0i8zk23MqQ1f+jmuWf2soOoZPMNPPSkJPlS+juETNGH++8eAZSbVnLjVZne7r0WvfDeHo+acdnJd9HUhrjoeYkIrqd+L0z8N8NTzGiUX/Q4Ks3ZH3LvKBwauJ6JWDa7oKKwN4KrV83SYXE4u3cwPxEhXgS1rDOhiEjVRb/jP2qJzZAEWahHb82z1XpJbl3xaSJSomDSBfqIqtviuTfP2xqUdMox9Yb/e5AaO7n4mCoGf5JBBftbtn8yeDXjHKEkrKj8WaHDZf30fkW093cgNBlzA2haA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wx+zfe61Yej+K0Vkp1yUKSoiQPW8BDjMZyS0k3irio=;
 b=lu9eytKekH3nhRZ/KCTqwzlzpmsNH+dr1UwCMpq7xVRbN6t7dRMYZ3nvni6S75xe9EJS7Ot3vIfxr0wwwXG3cZIPzg8ZD31iNCC+xgEcm9FvClIY1tyFFJcmsPfA5imm0FGk6Ur+jc7eyzTvBPjIn3sXARLtW5iiYHf+j21NIyOeKR3rtJmBlWSPWuNU0A7Nugnn7KLhESg2x9GblSOsTeaZ+5R6azGcnlbM8+F7jn7nVWP/gOSF42PgE7G8zRWuNIpBFdZRhQzlPD0Fe1UJbMdz2nL/XQJjqFWPK1cElBFWulokM2Uuj2yBG+E3XwDtydmEkLuJ6KG5Ue49VqlO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA4PR11MB9057.namprd11.prod.outlook.com
 (2603:10b6:208:55d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 04:25:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7aab:2a1f:f728:eb01%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 04:25:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix logically dead code
Thread-Topic: [PATCH] drm/amdgpu: fix logically dead code
Thread-Index: AQHcH3HeoZ59KgrjP0m/3ZZbhcpGZrSIr2FA
Date: Mon, 8 Sep 2025 04:25:16 +0000
Message-ID: <DM3PPF208195D8D439BD3D6D24A2E912932E30CA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250906210412.39904-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250906210412.39904-1-chelsyratnawat2001@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA4PR11MB9057:EE_
x-ms-office365-filtering-correlation-id: 39449d14-315e-4dbc-0e57-08ddee8fb6b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?tkjFo3tstv84lKMV7Tedpw4fJ57wDJJSOjClDTZHVZqxgY1fMdDNiXisx/DR?=
 =?us-ascii?Q?EZUkI7VdPECLW/oMKZSRdgXZF3HrGHOb3dCbSH6U97w3+oYUA3oLAZmAig+v?=
 =?us-ascii?Q?4MnHME32+y03uJQVQGh3jCvQewjpC4HBiozShnKS/UvyJDHq0YaaizDEkgm8?=
 =?us-ascii?Q?vCt6fpH1MbHLM2BenaY672hgd4SYJy+HgnGSQByJhOH8sVDXni7Nq5qlYIVT?=
 =?us-ascii?Q?aaTeio/eqjldEWe0p+r3dfmoKQcSkNgVqFw5/erWnMZTTZKKoAKJ1+8X+QDH?=
 =?us-ascii?Q?dXkZW8baVwoJY2M9ouJ9G49Dj4t9eu4lKZWQ81HNEYmr2J0rJPRVAeV58caD?=
 =?us-ascii?Q?RS5bGmGmDOpW7SdgfEP79dGqOtJbL3zINkaXncBxS+FBNYDsMBFaugQGWvBT?=
 =?us-ascii?Q?2qXnqyMSc85RIawNh5nCXpJoPy1QV+TYy+9vdeje3/L/P2zNQ+B5UD0yzsp/?=
 =?us-ascii?Q?fxMp9xRVxOsDf+isrY6hLTQcdez4b7jHy4rIyWjK8tHVEqOlhOM+QBkDPDbP?=
 =?us-ascii?Q?62Ngmi1TLmwgi0W2/8oaJS8MxkrtRCjmhZAmjGtPVWBNV1t/6j5y9wFiZUV4?=
 =?us-ascii?Q?KDEHFxrkfYK8HYLkv54iLJM6ENdzyV8k19lHrwiSkbeit8CNeSdevyfad2Ps?=
 =?us-ascii?Q?qmlonQDyrAV6Uzi+/HfX2NzsaQYxM59z4o9YR/rVY43+rnNM7MN/E1KXhwBl?=
 =?us-ascii?Q?x47xeUfWpeBvXUuGUGJ13MGNIWXngMIrQb3QC5SDfQdDza6y+xJX7E+sVRfW?=
 =?us-ascii?Q?G0sm++IatELmMSLSA3y+DCuqTXZTAEiIvn7MMT9w3OwFboJlHY9yApHE4CI1?=
 =?us-ascii?Q?c510DNfEV+oVOUaxjtWpVQR7LVke918I2xeXGrR+sj1xyFLdN8XzjaexSyX7?=
 =?us-ascii?Q?1N8IW+V/ppdql9M0eZFLvMGXq1CRi8k0rg6l7WmE2NTd3zRy9zL64jyVVPBf?=
 =?us-ascii?Q?AaD8nFcTwSaJ5Rh1+H8zrDiWiu63VRZll5qGGRzswVuEiT4sCoYNwdkWsUAE?=
 =?us-ascii?Q?uSE2x9xqAAtmSMIHmLg10ZQEZQwWW9X2QlM8dawxeekpI4+6aZ3PSpPYcMwE?=
 =?us-ascii?Q?6WZtOE5ICvnhg8jzdWmxYV3W6hQ0bEX9ZO0to/CpVYUPOM5GbJx9f1MwovL5?=
 =?us-ascii?Q?a3ICxfk/Z5jcwRZnyKUkV+vMiGexEDVkPk4fBlslj8qcX2pEI4jZa4soNKLf?=
 =?us-ascii?Q?DIXlt8qvmdyF+LvpfajoyJuIaWkhPhE8nZ6t/88z6lo9HraHWGGBJcH1TXjx?=
 =?us-ascii?Q?6IiMrqjdYD+AvkfcGCzXzZ6AfNIMf8M/aTeuNnezvDsv7ro4AkgycJ2eHHka?=
 =?us-ascii?Q?Ew7eWMZw0qdZBMjJ1DoMAfdqJzdvLw4HYBui337NshUr1jwaZfrkIv88Yb/i?=
 =?us-ascii?Q?BcHTXvnI9F5fJfp+ghcr2c0zLM8kqP+4a7grqSYUSf/C+A6krCxqb9B/vooj?=
 =?us-ascii?Q?1eXLfuBsF+UbyJDzaPw/bt/TLUkKtLBDtaqzCjLanxmJOvAjDU/Rkw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iHeg9k/YDlc9f65av6m6iCaSDsIcwgu12IxZaeRwTum/wfVap7xMFxJU3GuR?=
 =?us-ascii?Q?4Z6BQST+LXXFBpG+xut5WQ2gi2BpYnRhEdsg5w9LfPGEpfuCUlppLni881GO?=
 =?us-ascii?Q?BPgrHY3p+PRQluioiNYbsn11KISKkAJRi1PwDn6k05kYApoUyLf7FW49KNeb?=
 =?us-ascii?Q?6JTtFxQqmmBKoSYqPNwe7ISX1+fGPx5sVisJKuUiLJ/JGi/2WESaXdrXXqek?=
 =?us-ascii?Q?pAaHPUsuyYYA60lbelZsaP5Vw9GoqaHuQd5ETyW1GqYX1ykYtYA6CpPS/cTy?=
 =?us-ascii?Q?G8lYQ6waam4EQ1CA/3y9X8nRkzx0sljn09rrsUhmpBHrgmN3L71taLzZX+Rs?=
 =?us-ascii?Q?TPpdgtEZ4WJ3k1Y5JLOhh4QfTLiKfZ7SnZ1Yh108OEh+1POTyZgYthkTakjC?=
 =?us-ascii?Q?GuSHMIyqqQp13cghAcKW6sCHa/pah0zSrzFExDQbRxpTiSvDdoc3a5NuRaUQ?=
 =?us-ascii?Q?/NIrbXhIkGRQw8v/d0Z56+A+kS2+5Eftc3D9BZeCEjdSc7Hj3bi5i6QCmJVx?=
 =?us-ascii?Q?InKv1viOiX8yE85pdLcKgVaQI5RR/bFF6cToZLXLWlgfeUxVOki0qojYq208?=
 =?us-ascii?Q?dn187sdE/uwQ2iWCxll66L7sVwbs8n5/8EHYUULLAUGjCHvxmphfOr6kKfgI?=
 =?us-ascii?Q?tvm7ur15xnpFCcavJnLoA7gH7/HLa+WtXkBaGH7lmwghgoJyugcSe0GGRs0o?=
 =?us-ascii?Q?VO8xBOokyitR1CcFiCsriBxBluLkrbywS2Opf8DCppNSiq5AyWkd8NfNRL28?=
 =?us-ascii?Q?nwoi+NH+HMCCo33l/EK00Pqe58VFSLsWmPxxLxZdHNaNDS0QcpDOhWAuIXXc?=
 =?us-ascii?Q?8iWnus3wZggAVqbrE3RdaWA7EkJyMmmBxjm0m6VPMFTm//N1/JTtC1w7AGFk?=
 =?us-ascii?Q?XQGnxITm9gavmFrp9/aMuyG05YTsQIaD+b2oOQp7TTUH+VqTWaWsCJ4xGLzd?=
 =?us-ascii?Q?dkXi60cNDLKtHS3w2VpelDU4BWGCOEIxsQbpGbjuzwWB2r7Z8g8daimsZXmt?=
 =?us-ascii?Q?Z8qxK1izhAKwvx92QAPM4359RqAJEEXS0jTEsDBOzZGHCTPQu+/5tNcJUxSf?=
 =?us-ascii?Q?IHBpajc+aHpt5mydxJzIDBG3YaMmvbU0/Jb0Y1qHhCl0HsJrR8JnzQnigoZL?=
 =?us-ascii?Q?Qj+P3Zu285S/u+gKf8u0CCzjteFzK4Zx38l0d7/UmIye9kJYAHsPUBqfzw0y?=
 =?us-ascii?Q?GXx5wk7KOY+utO/eG2Q6u6rxXlcfKSSs6dA6Y0nn7K0aMCp1GhrUPo7gnrfW?=
 =?us-ascii?Q?CKtGxhG/1rOSL3iVEj12acGlKRZwyWwY6kZy5iZIIpSN1tvdlosJYtqX9dby?=
 =?us-ascii?Q?dAzE5AGoFaKGhHAHu7zReNgT7yzyhC3Df1pwLIhiug9JFUwtqI78OldWhCF9?=
 =?us-ascii?Q?tGyt0mXNvhDGdetq4csxLbMQ0VMWd5gg8TK/DBUVkjsWwArzEDM3jKEewFEo?=
 =?us-ascii?Q?q415dPfEhKlTm0oNvmBHxR24svkz76sE+Ya39vT+RS7C+sUsEnwMmCMxQn5n?=
 =?us-ascii?Q?RRAcYz02IDRrg4uTw0QxkfWBtmkIGWTZ4f3fOuMvuOEUeFkKjpIyit6pkayu?=
 =?us-ascii?Q?9Lbu4Gjcc0PHwBlnkGBx1Q/Q6PmmyCuA8Mg5aLOw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39449d14-315e-4dbc-0e57-08ddee8fb6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 04:25:16.9027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nudikYQaxctg1T30cWTxytP0xkiVFFMMHqAaGK9V2zEJhOYKEI6/r4zh+mvYkVcuaSDOuvD6IytrRivZtMP/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
X-OriginatorOrg: intel.com
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

> Subject: [PATCH] drm/amdgpu: fix logically dead code

The prefix here is wrong it should be drm/drm_dp_helper since that's where =
you=20
end up doing change and not in amdgpu

>=20
> The ternary operator inside the if block is redundant because the conditi=
on is
> always true in that context.
>=20
> This patch removes the unnecessary check and returns `ret` directly.
>=20
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 1ecc3df7e316..654d466183d5 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> *aux, struct drm_edp_backlight_i
>  	if (ret < 0) {
>  		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight
> mode: %d\n",
>  			    aux->name, ret);
> -		return ret < 0 ? ret : -EIO;
> +		return ret;

Here functions either expect a success or failure with -EIO since read byte=
 return EPROTO
Or EBUSY we don't want that to propagate up.
So this needs to be=20
return -EIO;

Regards,
Suraj Kandpal

>  	}
>=20
>  	*current_mode =3D (mode_reg &
> DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
> --
> 2.47.3

