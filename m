Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2B96B655
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0408979D;
	Wed,  4 Sep 2024 09:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYTuYGNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDAB89622;
 Wed,  4 Sep 2024 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725441586; x=1756977586;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0K0o9+YCwQDX/0UNvwHbGetKUICQf834paPzOH7lmpk=;
 b=DYTuYGNVCrT2MR2jY74CFk9wix/SZnz8aleswYFqvj+9MKEkUuVtaPAd
 FzlhcDNYM8SgHDDyzibSYiVVMZ4JlLdjJrLrhjoYeN0OEzAPfdIQ/h58x
 Vf0bdwm1koUANsdcOaO80FwG3q/M6Euzca1hYlvsU5YccJznWFE0nYPX+
 8BtGWQXwVxw9srgSGMOCsypqP0vOQb1C25xLU+5Yad7lmVwFQ1CltrurR
 GzP1HBQNYjCFSmT2DHT6gDW1ljc9NeGDkuWjEBK7YvXeWpl7ljeKcGwps
 KRGVNOw7e2FHp0fpD6Co7lCKJwyZ97NOKY8OtQukCAHugBDpHJQmMD4+Y g==;
X-CSE-ConnectionGUID: Sf04YemfTM+NkmMJWW4f8g==
X-CSE-MsgGUID: t55P2s6sS6qPaN7aM2T+Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24250704"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24250704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:19:45 -0700
X-CSE-ConnectionGUID: GxucHCoOTCGeVFfrnXXIDw==
X-CSE-MsgGUID: +MjBTxjnQEiyFg+4fCN3eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="70016131"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 02:19:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 02:19:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 02:19:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 02:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRjYQBpiG7tfUg9Qt1aPUTecLHre4x943Mu4ebXD23ZVbsIVm/IZOM6nrfBAxjpDTcVq5ZU3MfhyisKRUyZZ8Wnk0Jnl/Mw9s+mfJ/KNITW3V/h0KpHaLDvuoS3QpwwrITRiP6eWOWbBJ0hI3A2ikrFFOLoGBS1oDZbdHWJf2h4PqGK2vviV7ofjw0ZllhYPi2mQvkgs0yVzJoVB2qBNbBcKvdWxlYEWI1SCtYtzcgMAzdgGorZyL4xhPWO9twAdXEhRMjfKKytfcPqFk55s0GE9Tz07gQ8pCNQTb4BchEgjoimeOuA46IZkbjW28+F+l6mXdpAw8SG8C+BZvDQ3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y41NLTUso5w6pbc+bPZTGjBt47Owr6TmDz1+M3ciONc=;
 b=Dg+kBl8Ib076Bx11SnRn52QQ/LZd+h5PxSX/ij/7y9E1JX22Zj0vm2Zdjxlf9meQdb/0xHA+odfmG0KRi7dC3mJXPORrp2nSu7JqNysgHBuaeQOHrwlH7c0dCm19OJZm0KYdpJTlxTxTjj3JZ5gKYAKZX8OIkraTHtonWLWYJJ7fizNsn8t8AAVjUBuCCXgl60YQl5lMjoV1mrvhpvix3IUXOHetGifZoGjyQa1nORVAaFm4OSsdH2vQXOc224beUL0bHqWtUhzcc7oUnJ7WVspaLXuQwFpwIVYBdgwu40cVtTb0ANVaJD1Wm0XfShAnb8rRlQb6BXWiW3WJhgKIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MW4PR11MB5799.namprd11.prod.outlook.com (2603:10b6:303:181::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 09:19:41 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:19:41 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [1/5] drm: Introduce sharpness mode property
Thread-Topic: [1/5] drm: Introduce sharpness mode property
Thread-Index: AQHa0Q5DkRZkG2tbgUap9zRSZDEmr7JHs7ig
Date: Wed, 4 Sep 2024 09:19:41 +0000
Message-ID: <DM4PR11MB6360FFD59AC3437C5EB5A0AAF49C2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-2-nemesa.garg@intel.com>
In-Reply-To: <20240708080917.257857-2-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MW4PR11MB5799:EE_
x-ms-office365-filtering-correlation-id: 963173e6-6f05-4c4b-1d02-08dcccc2b523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?krtXjKaLqAbjlfLrORXLBzmT0DVXYdRL7i/rhSGxdm3rNL1fX5BXSjUQQtgQ?=
 =?us-ascii?Q?D1xY8AyzQHNDluvaWOaVJ0JsdZzENw4lRTshCDFEcqlojLLFxLqa78YlBi3q?=
 =?us-ascii?Q?1XJUmVmNkQDKJ0+V6UU+rlsqahGtbE3USnwogzBjvMVgXUpa6BuPbPmOi0y2?=
 =?us-ascii?Q?yK3no+SRyf7dcIXWPz6elforuxbWO47o8xmYbRxFvfHG2VUTVQVkcawDJEz+?=
 =?us-ascii?Q?W9gmTYCbJYTQJ09IxuEKexr2lyAv1DcMp3692TarTNfzMynDR3Xzt8c2bd5r?=
 =?us-ascii?Q?ZB2lLhEgxyuvWri+fwAuzaDNGK6TxxzcnnXPGq+ScOCdrCoBlE3z8kyk3wjl?=
 =?us-ascii?Q?cthI+OQlBzjV8B+wIMXzXaBp/mN+QMm0GdbRo3X7+Bk2fce/2HWJAkJ8rnRf?=
 =?us-ascii?Q?ebJowfVjj2NQMszIfVP8p3wx2z+YOmpPpvZoDZssZl1/vok5Luanp6T3NBJX?=
 =?us-ascii?Q?Z5ujLXwvYAt2soYPfk79yqtT/7/rJ+2BjiLjMlgCiCDo/95nl0A5hkc/SJ4D?=
 =?us-ascii?Q?w6WwFK0PG3UudwgA9nS5mSEp4StD4kgWHu8cVWiY2dDqMs9cW2SmDMRMZE/H?=
 =?us-ascii?Q?JWf/EvYNE4gKGIFbCUeJI0QB0ly6Qmtnb8sSXmHSHaNI5PqI6ghetG48cGDq?=
 =?us-ascii?Q?09lVDawG8GdhzWUX5QClRor83Vcbk+YUQbIQJepLV3+lo7dKhNX6L2kdR8gq?=
 =?us-ascii?Q?hn/Y0nweCVKGlNcn2zwJiI7GFqyWdGsyJvMF/3mfK5GL0QtN5btpjFJc8k/a?=
 =?us-ascii?Q?wVY/SRu2v39uT8g4Ef/B9QDhII2aYwd0QlDRi184NJ/iwqa4GcZBGPI4xsSX?=
 =?us-ascii?Q?/3OkIcYMSKO9/hVzEMgUFK272kgotDX2bRv98Mo9FzRiqf+8vKm7kaU1ZdbZ?=
 =?us-ascii?Q?N3zgQRPp8QITBfXoeQmG6cVXkYnMOLZbIR0iQSpBZg/izOixohekeYG3bkl5?=
 =?us-ascii?Q?5pm5QuLoNQzGFUcd3dmyhbkhYZ99/L1m/mSpX3nPvK5Ox83Xl3N+rbzfy51c?=
 =?us-ascii?Q?1d+jQBJsho+vjQxcJXty1bh7ANdFTbI0ymY/NFQayBYN3t0uL6dk+0Gnqeee?=
 =?us-ascii?Q?UTcjg+w8sxE1XHRXSEgSrUA6Yu2WvIFnDSJ2tws1bxN19RscIe8YCrnr1HHH?=
 =?us-ascii?Q?5mgdUHWGfPSyYMjElKSrBwAr9cABpZ7SdEXvExF2PZk/06PI7d4zjy9D70zF?=
 =?us-ascii?Q?au1iTe96T4NLnPzm8nIELNeTrqtpDutB+q5FWTqlbzzQGW402aLWfpAJMyWQ?=
 =?us-ascii?Q?2JYZ/c1FeQDH4ajiaK1I2CCq7dbFs1Zt1w8QflkDCUIGFWj39CllhQUnjO8K?=
 =?us-ascii?Q?WzMrz/r7r/yJSikhrF6uTKbFpadoJu+IjpWXVFbyqPlji0DNAWX1CRZWKzV7?=
 =?us-ascii?Q?DMS3huQ2miGVlFgdRuVzuovhMbbMobD+OnC6NlptLYdP+dxw1Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CaNrhITjlIDP3IG/Y1rb3zY20gpBYVclqzIDsBbcx+ULt0/4OefrFEYXS/hg?=
 =?us-ascii?Q?SXpUzjWOzgEE02XKJjAOmwpOED+676eQ1O4jebV6yi9TWqPSkNxqCclPR+J+?=
 =?us-ascii?Q?RXdDGLYhbalQFHsasQilYcuWx3MZ3UjX8aTEpdGJENvVoGnaxI41/p6xOl+b?=
 =?us-ascii?Q?LlQOWxK14Dqkhk7J5jVtOxZc0AWnnUYCq24E4W8Nvjhy1vK/9Eu+bNuoazpk?=
 =?us-ascii?Q?CNBiUduRyfezfCiAGQgNcpcl4ozXYWdlsnP85oDbrEXFvR9TaRSFkKVBNABg?=
 =?us-ascii?Q?gHDzDIEle5NBGKfNQL+1v4yfOdlD+PE9Gt2xGln/7JsktDUL1RHcm07J0Cqn?=
 =?us-ascii?Q?farUtH6fKXdG0wHwbLWhuK7+eYSUfAPGZsg3RTD0Zt2jSRpgVbO5OyQWmgJF?=
 =?us-ascii?Q?U8z4qwcUzjHzgcRZFMgJgDsBGkEcGlWCkKm6gH+2eyUyfvqX2xIGwfPKkQp7?=
 =?us-ascii?Q?WCG7MtuLKGo6IPR0/oNFGCh5s0x45/DKOdE4iV8pXFnKpC69+TpPXEbcQkCB?=
 =?us-ascii?Q?0R/15avpvECVtz2wFTMFu5OdCs4Quye//zJQRI2XwNztbkLG/LZBbGH6Avsm?=
 =?us-ascii?Q?1XXrY2BDDoEzRPIxGdoLx3v2eZAG8P1VTLLqtRlx6LOIRaT5SPWrjdC8dCwC?=
 =?us-ascii?Q?iDJqvXVmwcdGmPR6p9S/HUPLsTI9MT+BVcpqWRk4eUMDBKNXg5wZM5RqIz+n?=
 =?us-ascii?Q?frMo34gpn4w7KXC6adBZtXps6EnagCNzUaBRHXtabhCwo8QY3U6KbCDb+aEY?=
 =?us-ascii?Q?hcPDTMnjLL3/5KzpNYuO/50v/LJanrZ3Pct1+FhYWlZ9Ah50e/k8gD9M9DP2?=
 =?us-ascii?Q?MeFk20nn4+9eBW4rlFEX7EXOaxKjYtKCU5rkEA+bkGqkHgB80q5H4TDBV4kj?=
 =?us-ascii?Q?VnsveFL/JvfQctYXn8jB8vPXYGPSFu5nOZOYAWS6w/EIbpCXkAg3GnagQKR4?=
 =?us-ascii?Q?XjMO0Tb3PV71+LX2YngRk2yAlUGTZICqXiRsHp5WGBiwsZXFN4jFtraRxUL4?=
 =?us-ascii?Q?yGC+z0yWoqVEO0JSu2u6Diq0TeOyDaNLi2N4dgcUf4NjdXUkU8meNFe1Uqti?=
 =?us-ascii?Q?PjrZVMfbmKD8OZTDbYEmYVCa318f1nBTPzYHAsQME0TeSWvUcojvyO7EAtVb?=
 =?us-ascii?Q?vIRpll9NaOadtKuvUFSW/kyWQzHjm3w/hObeh0lTwAd4wIubgG7v/eWvEnhh?=
 =?us-ascii?Q?6ykCAy2g2xlFcF+w0w5GtaU/Oz+RyVAvim+9G+ayKKcEnPl5w4hKyQJhopIN?=
 =?us-ascii?Q?Q6u7kjbM9wutSNOOE9+2artl+1cC/Nv4cPDg8EV6Y3eFk0EI+IZEV94hsAM+?=
 =?us-ascii?Q?/CDvZFgO61OJP7TPCFNISArip8w3JH0VGffiLU+tPD3lC4b5oe/5mPN5Hgjl?=
 =?us-ascii?Q?xgAdx3QZX0KB4MW2sIE6fMuDx9SIw0nvw66nCqz3NNY20FgxnN/CIHBav+2F?=
 =?us-ascii?Q?lJEZBOJYW1Ch0fZKDZ209ICTBV81MiQrC65ADWS2HIRWfmWUbAJNbs77Ifa/?=
 =?us-ascii?Q?8Ib8v5I4n16VjiHlOXC9pswQxrI0z5O0IPP+HRO97dfvv5hZ7AR7CT2Dgftu?=
 =?us-ascii?Q?QX3Z/Yg/QRgPUSaLtHQ49oemQo09WWumhvkppRsg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963173e6-6f05-4c4b-1d02-08dcccc2b523
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 09:19:41.3952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jblCZYqxlzM4KjceQ13gflf7+c5tRT0SqRCCiX71YeUkk5iwZaeOb/wTnF64jr4BlBvHS6sEysbfOoYuPPkChw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5799
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ne=
mesa
> Garg
> Sent: Monday, July 8, 2024 1:39 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [1/5] drm: Introduce sharpness mode property

Nit: Rename it to sharpness strength instead of mode.

> Introduces the new crtc property "SHARPNESS_STRENGTH" that allows the use=
r
> to set the intensity so as to get the sharpness effect.
> The value of this property can be set from 0-255.
> It is useful in scenario when the output is blurry and user want to sharp=
en the
> pixels. User can increase/decrease the sharpness level depending on the c=
ontent
> displayed.
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>  drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h            | 17 +++++++++++++++
>  3 files changed, 56 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 22bbb2d83e30..825640ab39f6 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -417,6 +417,8 @@ static int drm_atomic_crtc_set_property(struct drm_cr=
tc
> *crtc,
>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>  	} else if (property =3D=3D crtc->scaling_filter_property) {
>  		state->scaling_filter =3D val;
> +	} else if (property =3D=3D crtc->sharpness_strength_prop) {

Agree with Arun, spell property fully for consistency.

> +		state->sharpness_strength =3D val;
>  	} else if (crtc->funcs->atomic_set_property) {
>  		return crtc->funcs->atomic_set_property(crtc, state, property,
> val);
>  	} else {
> @@ -454,6 +456,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
>  		*val =3D 0;
>  	else if (property =3D=3D crtc->scaling_filter_property)
>  		*val =3D state->scaling_filter;
> +	else if (property =3D=3D crtc->sharpness_strength_prop)
> +		*val =3D state->sharpness_strength;
>  	else if (crtc->funcs->atomic_get_property)
>  		return crtc->funcs->atomic_get_property(crtc, state, property,
> val);
>  	else {
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c inde=
x
> 3488ff067c69..4ff18786a226 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -229,6 +229,24 @@ struct dma_fence *drm_crtc_create_fence(struct
> drm_crtc *crtc)
>   * 		Driver's default scaling filter
>   * 	Nearest Neighbor:
>   * 		Nearest Neighbor scaling filter
> + * SHARPNESS_STRENGTH:
> + *	Atomic property for setting the sharpness strength/intensity by
> userspace.
> + *
> + *	The value of this property is set as an integer value ranging
> + *	from 0 - 255 where:
> + *
> + *	0 means feature is disabled.
> + *
> + *	1 means minimum sharpness.
> + *
> + *	255 means maximum sharpness.
> + *
> + *	User can gradually increase or decrease the sharpness level and can
> + *	set the optimum value depending on content and this value will be
> + *	passed to kernel through the Uapi.
> + *	The sharpness effect takes place post blending on the final composed
> output.
> + *	If the feature is disabled, the content remains same without any
> sharpening effect
> + *	and when this feature is applied, it enhances the clarity of the cont=
ent.

Can you also mention the modeset requirement that this can be done with no =
modeset
and can be managed as normal flip.

>   */
>=20
>  __printf(6, 0)
> @@ -939,3 +957,20 @@ int drm_crtc_create_scaling_filter_property(struct
> drm_crtc *crtc,
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> +
> +int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev =3D crtc->dev;
> +
> +	struct drm_property *prop =3D
> +		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH", 0,
> 255);
> +
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	crtc->sharpness_strength_prop =3D prop;
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_crtc_create_sharpness_strength_property);
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index
> 8b48a1974da3..1cdca5c82753 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -317,6 +317,16 @@ struct drm_crtc_state {
>  	 */
>  	enum drm_scaling_filter scaling_filter;
>=20
> +	/**
> +	 * @sharpness_strength
> +	 *
> +	 * Used by the user to set the sharpness intensity.
> +	 * The value ranges from 0-255.
> +	 * Any value greater than 0 means enabling the featuring
> +	 * along with setting the value for sharpness.
> +	 */
> +	u8 sharpness_strength;
> +
>  	/**
>  	 * @event:
>  	 *
> @@ -1088,6 +1098,12 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
>=20
> +	/**
> +	 * @sharpness_strength_prop: property to apply
> +	 * the intensity of the sharpness requested.
> +	 */
> +	struct drm_property *sharpness_strength_prop;
> +
>  	/**
>  	 * @state:
>  	 *
> @@ -1324,4 +1340,5 @@ static inline struct drm_crtc *drm_crtc_find(struct
> drm_device *dev,  int drm_crtc_create_scaling_filter_property(struct drm_=
crtc
> *crtc,
>  					    unsigned int supported_filters);
>=20
> +int drm_crtc_create_sharpness_strength_property(struct drm_crtc *crtc);
>  #endif /* __DRM_CRTC_H__ */
> --
> 2.25.1

