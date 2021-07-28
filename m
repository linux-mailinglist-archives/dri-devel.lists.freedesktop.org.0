Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76923D9903
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 00:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13EC6E167;
	Wed, 28 Jul 2021 22:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC8E6E167
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 22:48:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="210878392"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="210878392"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 15:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="663875324"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2021 15:48:26 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 15:48:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 15:48:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 15:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiKvCwR3EMhnj/Pwut1Ds44XmNNaRT2ceaIfx4/k3px9b7W785IpuQO+LyCxGLevcb7p+PfrIJOFB2H+qxPRxIIEOFdiO8krXEDLkVocMG59V7YuISKiC9XMV4dpqJ7qK/f52zZBczI+m8HM0AQ5ucLYcyx9gb9MWOAbPp4E/P4sKhHxsCKmFxi+RYjTYrEhLqDSyS6e4gbadr19YQEQ7p5BK8F7UV3hMUSt9SoVX9+ec7muZ2Gl0l2HMS40xaF0FJpp8lnu/6Sq8rKs4hR3vGQ7sUwaonV+ehuXG7D99HrgD66PEO3NByk/xjEbpFxpX2d/ETiYTVdSRMQ1yUpmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2yU0EK1ThdNsH5TT8N2KU2b+YpqYhz1UXUFuThCNvk=;
 b=fVotuuuJUfMfOsRtHQM0ECjc8L79tMBmQk4vQfNXULCm0QOOXb2q9oGTmGdp3Slp7SP8QhypHgrIq5Envo5sVWFyi3QfQQrTJVvJ42qWG+fIqG9G33Gs8/5agzktgAI4EHUPlPAxX5XYOzbmT8ANrkvAENrtRgifU/Yvaq1q5/47QD2H1RMMOoTQyz6RVauRwjPnfag3KrZUiBnRasgrw1323Q4Rm731ONgXy1mNd5+hEOTxUW5DMksG1FvG0HVnUzCLAYB8TAol9NtP1CEe+tzvPM9tLA6jWyAa9Zy6khVOXFz3Y/kfvIP25rw1XoZYAdh8EBKZvZsOsL+wjvO24w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2yU0EK1ThdNsH5TT8N2KU2b+YpqYhz1UXUFuThCNvk=;
 b=nDlWEGHbIZAVC+Lt+5TIbwHMkMbVEA43h9XwI2H03gw8qCJS5kyV9nWRUTH24NnvzPOX5e0NXd04YvqEk4+ogvNX/WIX8Lc5aweZkVZPsDIztgG4jjeb2SnSiryK1FwKdCgjuXHqqrkSpPvKjbV12zEU2Mbagrxo/l3Q1HVZ6ko=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by BYAPR11MB3032.namprd11.prod.outlook.com (2603:10b6:a03:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Wed, 28 Jul
 2021 22:48:24 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::cd49:4031:91e6:ec6e%7]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 22:48:23 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dea, 
 Edmund J" <edmund.j.dea@intel.com>
Subject: RE: [PATCH 09/14] drm/kmb : W/A for planar formats
Thread-Topic: [PATCH 09/14] drm/kmb : W/A for planar formats
Thread-Index: AQHXg0gP8e5Ji8XY+UWjraBVJZbsVatY/piw
Date: Wed, 28 Jul 2021 22:48:23 +0000
Message-ID: <BY5PR11MB4182F6E56DE7276683F883DC8CEA9@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-9-anitha.chrisanthus@intel.com>
In-Reply-To: <20210728003126.1425028-9-anitha.chrisanthus@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9d8686c-c780-4f1c-9d56-08d95219ce43
x-ms-traffictypediagnostic: BYAPR11MB3032:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3032BC569CCA150EE367E4C48CEA9@BYAPR11MB3032.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8KWduLvzxbxTt7nYZ4i95dWxI1ECMN95bhTeFR/kwwBWH78X+cYB73VOVZ1qMBnf5kpHNGUv8qnwvfE5YLNAfsfrSuieZhpeVNPgBvI2+WUMuqa+klsZCRBOI51dKs5qAHUEMSx+2/MJCOQ57HY9vLh1/7/Mi9ehBk+SFY3PJQKscaY2q6jOIE6tDsz6gN1L0uQV4W5hAWPw8sT4Z4tVSMzcPeoHraOSWy4TVUHnWIkjNBYCxZSFcjoi2WTQNb74hEQxAIkjXJCV0Hidtl5sivTar0YfB5aq0n/9Jlr2FhF4LEMJ8nvqe1PcIHfsRJzGc+V5TkiRCND1FeLJZKezxUnihm4yeUQ0rxPgBR6NkoDdS6mbmcElFtudEAYQq1uU/xB4a4p1ToE9gSfWkLcSM+HMjnDL0SiBRE3QbR5uqvp1CQ1DYTjHOQhBpYrHT6hDEOQjtmEnvU+Ebzl/IM+snmwSUXdomckfJbhs4vnkOTU+iCuAmpfY7Wc5cPhy1YojWpa9rXYmp7Mw2tHeUyTfxDIP4luJyfLeJokJRhFOHvEgUXc6ESo3fACC7bC1Zux6saxtgQ2LRHmLhOHTOBo/RPh3qWR7O3vGGgcTURoavf15381KwoZKNrzS3DlIAKlm1TSSfqp1MB4SMYs5++0I3xret2v1gQvLOCnGu7+en5kiSYznNfRwRUHL+eIEKQdA39v2SWsSNS8odWd1HAVs0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(66476007)(478600001)(64756008)(66556008)(122000001)(76116006)(5660300002)(26005)(316002)(6506007)(66946007)(53546011)(86362001)(33656002)(52536014)(9686003)(55016002)(6636002)(83380400001)(8676002)(2906002)(38100700002)(7696005)(110136005)(38070700005)(186003)(71200400001)(66446008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dxF3iv8D3Glf0Vw9N8FDOsdb+OZk6ndhX/oD3sJl+qbnxVcdhkCmrwmE8NEB?=
 =?us-ascii?Q?rTy5zE3Vs4HiYHPnr1UVrtGL6jdYbijMUV6N/fabOkUYpAPRJWR88Y+oV+G/?=
 =?us-ascii?Q?ZVjER72+zBV4TAgUUvSL4/JXyqXbf1t6DwfNSyYnR7zwjbtn9v4n0uUzGvvn?=
 =?us-ascii?Q?paxiSDd75M7jEyGSctgKzRyLveo+i7P/eszyVyjEDesOQ8XOeWlvTxbWjAM1?=
 =?us-ascii?Q?47lBiyJVo4oA1Kfq0xGY0lsUwONuk30Py0NB89VzRpRjeFx5SVG/sgYORSed?=
 =?us-ascii?Q?9XYnKohQoubOQoyOSY17k3QURWlwum0T3eP0Z8WpV3704Wm9KPY2BEDzRFUx?=
 =?us-ascii?Q?JxMLC7Qjn1a1qe+K8vUlwtlcXD3Fa0ytivgtl1yrjre4pG2z2wzLGD1LTRKM?=
 =?us-ascii?Q?ASlWfwMupAYd4XaXr8E0TliT+7TnWU+2xx04qsoLCcKbRp4+xngwfVx44oB3?=
 =?us-ascii?Q?cJw0Fp/EUdYAIGmtkbBYJlseApF+wsMYgP6zHDRkfKZULriX38HihyRrYeqY?=
 =?us-ascii?Q?TVK9Qek+1iYaMhWMgmSDRM31m+wWZgmLpjRCQfwIoFYRiT34XPVfrIxmOUNT?=
 =?us-ascii?Q?oHWYgsXxsLRQdHzNapIg8JAnw6UAjqPgPM9B+JxNeYDVPhxJs63pQpRJt9F/?=
 =?us-ascii?Q?O9acnn7KagX6FVX0TU91L8r1e7ri7nM90K07Pg415zqxGkdV67fFrogt3o8h?=
 =?us-ascii?Q?QVrKyoCcxLZJhV8MZusJMaTTaN32t01DAxBiqCf3gjhxbVN57/zP0tz9UwZ5?=
 =?us-ascii?Q?aGGGJGfR1fHRElmP21/Se/4r83GFcPmvoZa8dQKJniRAYffAcvojYxO8MJ5V?=
 =?us-ascii?Q?8ZTFX6aQL4NLqBdYpgIdQNKtzhxP28crETKZkYr+iHm/5aBconOdPPtcBIqI?=
 =?us-ascii?Q?n6PEpU/ZnqgGJliI7PSw+s/aehN40mPWExuTTzic4/EjgCfRf165HIsa9CLK?=
 =?us-ascii?Q?xQGxK+uV/Amz03e/0o36/qKeIyGRo1w/Ghzyhnm3Ker0UxE7ydZaXTwNl6ns?=
 =?us-ascii?Q?6uMll1C9i8j7tn+DpskO1H/zaQ7gDcOz8+U5mejWNj5wGBWvkF1u5I5Kd/Mu?=
 =?us-ascii?Q?CVLo8mhbZk8tQFLPQp7HA55iqgfGA2RvyBiCQlIbMQObH+8LwC/NhR5za+9t?=
 =?us-ascii?Q?t2CS/7S0cOBngWei+skJ7o1urELYpX/ufXD8CqY0LSVSAGpZRWwpX/eu04TV?=
 =?us-ascii?Q?VlcLV3HjHTtrUclBB+A6BOAlIzig21Uiki9OMV5+nzy1+L3O3AoCSLVworvV?=
 =?us-ascii?Q?WhRmYT22025/8qqn/xw66bB917BjckQd3yjPo3IE+6lNBIk72doeiOPxTOYw?=
 =?us-ascii?Q?bqQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d8686c-c780-4f1c-9d56-08d95219ce43
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 22:48:23.7024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xk4yIsi+2Q/+shVS5IQ5RYyskrbEjkerntos+q4E9V08Be7Ohw3LXp4KXZKUyiDmYWJf9GapH5sBzsxRnU7chQBRtyxQQYYiXZOJ882J2zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3032
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

Please ignore this patch. Will combine this with 256B w/a patch.

> -----Original Message-----
> From: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Sent: Tuesday, July 27, 2021 5:31 PM
> To: dri-devel@lists.freedesktop.org; Chrisanthus, Anitha
> <anitha.chrisanthus@intel.com>; Dea, Edmund J <edmund.j.dea@intel.com>
> Subject: [PATCH 09/14] drm/kmb : W/A for planar formats
>=20
> This is a work around for fully planar formats, where color corruption
> was observed for formats like YU12, YU16 etc. Set the DMA Vstride and
> Line width for U and V planes to the same as the Y plane and not the
> actual pitch. For decoded video frames, continue to use the info from
> metadata.
>=20
> Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c
> b/drivers/gpu/drm/kmb/kmb_plane.c
> index dacec5c4266f..4523af949ea1 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -333,6 +333,7 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
>  	struct disp_cfg *init_disp_cfg;
>  	struct viv_vidmem_metadata *md =3D NULL;
>  	struct drm_gem_object *gem_obj;
> +	unsigned int cb_stride, cr_stride;
>=20
>  	if (!plane || !new_plane_state || !old_plane_state)
>  		return;
> @@ -397,8 +398,10 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
>  	val |=3D get_bits_per_pixel(fb->format);
>  	/* Program Cb/Cr for planar formats */
>  	if (num_planes > 1) {
> -		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> -				fb->pitches[1]);
> +		cb_stride =3D md ? fb->pitches[1] : width * fb->format->cpp[0];
> +		kmb_write_lcd(kmb,
> +			      LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
> +			      cb_stride);
>  		kmb_write_lcd(kmb,
> LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
>  			      (width * fb->format->cpp[0]));
>=20
> @@ -419,9 +422,11 @@ static void kmb_plane_atomic_update(struct
> drm_plane *plane,
>  					addr[U_PLANE]);
>=20
>  		if (num_planes =3D=3D 3) {
> +			cr_stride =3D md ? fb->pitches[2] :
> +				    width * fb->format->cpp[0];
>  			kmb_write_lcd(kmb,
>=20
> LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
> -				      fb->pitches[2]);
> +				      cr_stride);
>=20
>  			kmb_write_lcd(kmb,
>=20
> LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
> --
> 2.25.1

