Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD8963EA1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 10:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485010E62F;
	Thu, 29 Aug 2024 08:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgOq4DTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474A10E62F;
 Thu, 29 Aug 2024 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724920396; x=1756456396;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0GTvpkdmfaGTn0q7kCARwJVrbsCs79gIkMqKu97MkmU=;
 b=TgOq4DTHjKc3upBoIAsuSFtvmkNf/lPl7B5T6FdcHbHpnZNIe7OvcdIh
 BNKjdt6EJCzZ/o4kB60q1PYwPYdvO1zd2MCwUMHRqCnilOADmZjovIBDL
 o+L+M2gfIfTceeU0Ym1OQq17rAEA4fUCVQp4cylOuT8vRayxOMSm+NF/o
 d2plXgOlBra2GIa6GVXdMUiwdjznzBzzGuH4RFPp5EEDi3qnGiuDxHKVO
 uN2C/LjJH/De0V+QtOtHl0lntA9xR8Cl3KEAL1/PSq8XGyZpw95RKw78L
 +3lURTRN17Zl6R0T463RwMwMwZmPie0nt2LvgDWmxWT9al75FVZA4QxZI g==;
X-CSE-ConnectionGUID: P9j/viAfT2iQ+VPgCfujuA==
X-CSE-MsgGUID: JF0v3dqURXOZrSHhN0y1YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13276307"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="13276307"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 01:33:15 -0700
X-CSE-ConnectionGUID: e5iareJETE+p52VeOhqvPA==
X-CSE-MsgGUID: V9L3UhUwT82JG58T+MvB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="63845951"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 01:33:16 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 01:33:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 01:33:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 01:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0RsRaQGYLPUVlDE9XjBpS107rxR2JxHfJmu1x48L7u0/Mmn5DB5jwSEEBttAWU2yTmjbloDCL5Av8Vo43OXn4SbKYiv/ATu1FgmL3dO5Curu1dOB9Oo9tHdSk0euR5LiJx1SsFBX4EiNcwBpISygQv2QXn0z8yfn6TWHAyuSpHBT5cMlc1HZa2F4gBGd+ae4JW3qIijkbOBDjPp/ajraxDVit/esHiJRdwBjPSoaEO2zurKegDfGlzlS/90jr851uyNVj1/uugKqHCx3fRU+FW2R7tuFQp/gSSakasAOtBf6EsgjbxQs5Yt2CbeZt1x/D4iGfCowNpk5UOxQI/KwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7OP8sHsCjDLDf3YvOWGk/Cd0rOR3+L4mFyFjAYT99I=;
 b=hon7eqtLeyn+tPvdKHsoNZg6O+hyH2490+KeKCjU0uHVYiUUaeZcHMbMRtp3YrNwV99uhr6Yzpy9V9NJfr+gOMe1zd37rlq8gCtHfVbfvplGq0hVTVK7utAJdU3XDkgFPpXi+0qWMR1F2GfSGI3y6HLXitUzulVCRmhBGdI/xPGeEbhuI7Kp93OY6U3OBKzhjv6xILIVzfaayJ2tg747fcy+0WQWB7/r55fEROziUZSE7SwaFj0dKseMHrdN7tqtndPIyYMRR9YznRMCriZm6woENDcxz7O4F8HY6eLuvZmCrtYO42tyu+6KVXCLJWQ0UAhk6hae+RayIUmbneBMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 08:33:06 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 08:33:05 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [1/5] drm: Introduce sharpness mode property
Thread-Topic: [1/5] drm: Introduce sharpness mode property
Thread-Index: AQHa0Q5K7vpGB4QyNUSb1hMlt8+YhLI95O/A
Date: Thu, 29 Aug 2024 08:33:05 +0000
Message-ID: <IA0PR11MB73079F87C30950FCE5D30E4BBA962@IA0PR11MB7307.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ2PR11MB8372:EE_
x-ms-office365-filtering-correlation-id: 81cfcb31-c82b-4382-bab9-08dcc80533ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NhtcQDHoAm89lC89XzYHVsWHVTODAxTkisTQEnWqWktTDPv+uu+GHhKTj88Q?=
 =?us-ascii?Q?d6ZPoQuW+K7NpO/nEXOd4NGHePR+bTUuNcu8HrpRjPJNUq9lRScC3iP2zqLR?=
 =?us-ascii?Q?pzEQKsTeftdrBT81574z6wASrgfSFNr+xGqJsPxL81/gfeDyRYqIpuWGsI5L?=
 =?us-ascii?Q?KdXVEuTOtFsS1VcO1Ko6hex8ilgiIp7hT/+F6P9RZPSSCg7ZAZoaIEhac88n?=
 =?us-ascii?Q?1Bs/XjsUwXwjUtqlt23K0oIXtH9LqSo5jAfQ8zvyVnWxReeGkUg+Fh8aLvu2?=
 =?us-ascii?Q?ISYRK6rBY2z4fhb3toLtUsFX/Tzz4k/Gq48t1R24SyO4TieKKkF18zKH5TWH?=
 =?us-ascii?Q?C1EyD1phy0NeOiCqb7Ot1q7NeYQG/sk/Jt09QrL41X1P3R57sRRKX4fI3QdZ?=
 =?us-ascii?Q?7Vn3+7F+QZS66dttmDLinqroeiPT5JES+jhXaB8plhp8phVlwrZ0Ds5ILHr9?=
 =?us-ascii?Q?6vNg/V+0Bg8psl5W3ZM0K7X+E7zJJJzmw9bfOSNOONUgraMThImV0i2tB2Q5?=
 =?us-ascii?Q?/0XlFtsFvKShsrilEkBtt4pprHv+jawiLoNHZsGDAvqdbQ2oSYuMTqU8iYZV?=
 =?us-ascii?Q?VNHCl/7J+XILCHh9OChdM8aH+oALa2KVB0OhSUECBfLnA6rlCFa2NclSWXIQ?=
 =?us-ascii?Q?yuVsYvDd/GaGQSPS/I7DPlK7pBhyNnxOhX8Hkfd0GYv0Px4oBaHm1hr6WQiF?=
 =?us-ascii?Q?8Szo4IrklJPORt0cDAXOkw8U/YkdtJeidtsKiQB3TKtbeblRnyT9cYCTNUDH?=
 =?us-ascii?Q?7cmfJYBhs/WIpKmWIj0Ehrn1GgDdxwCm+OsiFvwzdK8Jg4Oi7gqP9hBwu+ZX?=
 =?us-ascii?Q?JrWj7JYU9H+EIVwNemXkRl31BOLZARm8J0flMRtOwb0y5dexV0STWNqFTjQ6?=
 =?us-ascii?Q?sSDZxvzKF1LRGCuRAO+nJovvInE/VA6TLcAQJI/Em4WbhnscFnVlPFG7+piF?=
 =?us-ascii?Q?JETWFv7wRJnhH7IDsUSMzGL055ucdwWYVCz3omJihrIWmjM+DrDJPT2161rb?=
 =?us-ascii?Q?zYAwtzjlf7NckoXDeHFjgg4PgRWFPTCEPHUa/Slwtko0Qx/sk5FAsG0RMnGW?=
 =?us-ascii?Q?KhNaVxRPjlv+odfsH/jMqyrVEk1i7HvX1S1/4RLkxvblC/3TgRjQkIHuAjcd?=
 =?us-ascii?Q?Wc7n5ugTTaXWW86xAQ6EJ8BXwV6yEs91w6so1zGMvvlXRV2GiyHutkbreHKp?=
 =?us-ascii?Q?kCThVBpArDaO9VRiZ6YspNNyvt8dYoCwnyxq24YpI0tDrUwobFO4it70oq19?=
 =?us-ascii?Q?+yqvaFz8kozE8R7THHcK5aL/9/nTHt6kopkxt+LMzaw2lJWtCceS/H4QBUrH?=
 =?us-ascii?Q?L8HWFylUy7b8yz45e5L735WFZfJdIWvfOhfXJVTRgOH9uCveiNnZLiF3mgXn?=
 =?us-ascii?Q?Et3qa2LPfQBfDx5i52Njz2oRwEMbqMpZhOzdCcQrO41c3FzVtg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r0E86pkXIfddBAGQ61sEZVJLhKwDGpZERthUvV6848uzmuDnD/fp89HE+0Mf?=
 =?us-ascii?Q?4uP+064MRG4jvMuzqjQ17ivUmUkM7yY7Daj03+S77RdcbIIfclq26xb0E9hd?=
 =?us-ascii?Q?YkYnx+iUXmbvssNAQL5+9OcUl/JNV7+oo1pnfWXgvXANuuzNem9J+QEW6og5?=
 =?us-ascii?Q?XvZ8DTpE11Uqza17VrLwYvrXOe7Qvd9CKZz6kBoAdBFgG0MaB+ewPEfKc1rq?=
 =?us-ascii?Q?bgnIMKVS61wfFPXVleiZczQlmAO9cYCAC/CRvj7oeSpk/edd/py2Rmj381QL?=
 =?us-ascii?Q?c5omFqQiMErxEff4QJjdWX4SvrCBzQrdDTJ4RGe704Gqq7rBTDJtWJ5C2VSy?=
 =?us-ascii?Q?u+RzlLWbHZ8jOh2wnZxRfC0PbA0Om0mtAQ7wagSbJW+U8JGyX5i2U3NQAKPx?=
 =?us-ascii?Q?dqpO/S8CZRur1hYaOljIJeu4NODeIAZ6aiPlTyl23eXqEKyQhHblVQgGtL4W?=
 =?us-ascii?Q?YaB6PxORPmtR4uoqCGyMHR8rytpRocHu150HnwMX4yg0vD8421iKEuYYZBEA?=
 =?us-ascii?Q?Xu0fgAzQYSBZmZ6bTM8q8KdYfq2raJpu8ikMWaHg0264vyc/SOWld6kRKEOJ?=
 =?us-ascii?Q?HoicdcEH4x/oUiZ48FHcr1/uHAJIWcr995fkcZ/CaUKEFJYpkekuCC/PSpFL?=
 =?us-ascii?Q?G6eqUvOWUlznFIZ3l8nV/YiXyL6Y2aVp7KYUEjoCrtCBfsy7DNx/Oe6YMPsz?=
 =?us-ascii?Q?Ld7l2PDovE1rbzWuciLTbnrYH7JiYzReoy+s5CBxkt8v0M6865nY+p74/I5C?=
 =?us-ascii?Q?F5o4ZnmpEEL+B1obp97zBrewjOEHo2inl7H325Kge7wantOKiAXyd8k4hGnQ?=
 =?us-ascii?Q?zAHE84eDB0ycyEAiV2kVDWMDTHTIgB22/8nlBBYq/vLN6Y6RSsAwcf8e5G5L?=
 =?us-ascii?Q?rXveLZFgDZfwuQKa/3pv38Bl2pT3ltmMyzh8dN6+FgcugAAbmkHnn1NyUxEa?=
 =?us-ascii?Q?BjgBUwJ+6QsY7fJWHO43GTkk+HCNV59ACDG8OjG0blLGoRE2F9eywQwYPgDU?=
 =?us-ascii?Q?4lZ33BoyTrvWbEYacp+/9EcCCUEbOFJAmRu4tgZv9qLVgQ9M1GzvOqq2aEaD?=
 =?us-ascii?Q?SX0npd16I+yWqn9n0yki6XDz3B5YS+4NcenGBjBj5oyFF680UckAPrJ4804Q?=
 =?us-ascii?Q?oa+kc+ikSWXKIfaxJJ/TfYBnL4d1Ypw0Qa0jerqCTszv3dpJrYWslYyE94iY?=
 =?us-ascii?Q?5NF7KQMG3yvIYN/seYhc+hYTTx6irKPgegONrakWJf7Kh0Ct1pusv0QIpeh9?=
 =?us-ascii?Q?MqD3XTfeDVcGb+mnX41RweZTA8KC1tOv7Xzn/tNVS+44s1RNpOrkOU/Xsubz?=
 =?us-ascii?Q?49cPQ+U8XfvhlqBxQcYBXKbQvmO3ApXbS5kyTGhDCsWOPhaTc9FV3XUY/ant?=
 =?us-ascii?Q?TotWQTg9v+Q4k+9DMrgs7q7U9rFbn4j9rdPo/uHROansPJ2kONepSpO/5+PT?=
 =?us-ascii?Q?eqQfEqvfPjkmXzVkxzlmSAP2zRCEw/yIFBaig+u/ptjJ2AOJsaCAfK9zc87D?=
 =?us-ascii?Q?ns2GTYcObi2/21sFJpfx21SiW4//AO6GCP8AfatJmE7gF8UwzoksnBCbi9/P?=
 =?us-ascii?Q?Bq3m9DwVzN0Qz2cSeLVDDozAcDeuy7jp9WVWs/rUBlTZSwpnOr9wfohIKvth?=
 =?us-ascii?Q?czMDevckB6ofBTf54/MrSzNConQcA+UQzAmwviuzMnuj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cfcb31-c82b-4382-bab9-08dcc80533ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 08:33:05.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZItsvZmG8Wbxv5zrntNIYszeabt7UBbpIeCOUUQ19zQTsXa7OzbGtQ8a8STKnXaYABd/LieDuvm3INtHjmIuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
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
>=20
> Introduces the new crtc property "SHARPNESS_STRENGTH" that allows the use=
r
> to set the intensity so as to get the sharpness effect.
> The value of this property can be set from 0-255.
> It is useful in scenario when the output is blurry and user want to sharp=
en the
> pixels. User can increase/decrease the sharpness level depending on the
> content displayed.
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
> @@ -417,6 +417,8 @@ static int drm_atomic_crtc_set_property(struct
> drm_crtc *crtc,
>  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
>  	} else if (property =3D=3D crtc->scaling_filter_property) {
>  		state->scaling_filter =3D val;
> +	} else if (property =3D=3D crtc->sharpness_strength_prop) {
Just in order to maintain similarity in the naming conventions can this be =
changed to either "prop_sharpness_strength" or "sharpness_strength_property=
"

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
No blank line over here.

> +	struct drm_property *prop =3D
> +		drm_property_create_range(dev, 0, "SHARPNESS_STRENGTH",
> 0, 255);
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
Thanks and Regards,
Arun R Murthy
--------------------
