Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC5A2A012
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 06:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0F10E429;
	Thu,  6 Feb 2025 05:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyQT3GL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91A910E423;
 Thu,  6 Feb 2025 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738819340; x=1770355340;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fjgqaUcpWG5waVtUb9SLwufpMdDcmRUd9hsCt9Z6Yq0=;
 b=MyQT3GL0zZEEnZEPD1I/mWGTb5jdy4skL08F+QkOsK1V6dKOegxGdeh0
 Mz/hhSNxte2qtCjjB0k6WjnwjZdColviFZk7+TSk4RIF+UOiWNJpSJBVP
 4m0WKWhcOX6Vcp88ysyEKTTSTUn3dUQAdibTGNtiy38vzAp9zFLRW3j4/
 F3xP4E3XsE59oaA5+9Ms2PR6Va7lxSrw0sH/0CivzshOrnXEDp10NeJX7
 zuEh22NsRc+6sLshljzT5iET+4xXJGveU8Iy8A6WwRMFfNoHU+D95qTBJ
 KHmtVCw4V7eTkdIIaZ6MGYAuOQA7JMifxqAsAR/Y8E9SQUylPT0PXdK+n A==;
X-CSE-ConnectionGUID: 8l1L+OGZT/2IpdD+vdw9bw==
X-CSE-MsgGUID: 3Rx5H24sSmym44UT+77kVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49653264"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="49653264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 21:22:19 -0800
X-CSE-ConnectionGUID: sqYIyQWtS8K+M4rSgILBQg==
X-CSE-MsgGUID: t/g232dSR+6jSq4EPZCI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="111685966"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 21:22:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 21:22:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 21:22:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 21:22:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNNyc/L3oYZYtgZ+EiS8VNpK2HsXV1G+SOPaPCIFu62Wbww9wNJQUPckRldnxTQ3FxD9rffzam7a89aSWz0oopFygYMJYBu76ThbZWWbYqHn0qnf1DXWZ0QHOxHpbeKqlJh1H5/784ETuDF1Qi11LI4VV0Ss6EQz3VhXjsY2Z2/yrJ9pjleZTraabpM7J+kedgmfQ/RqwrY+0dT4w4QfAhCLq6uCuwzA6squrNzVzyZUvRdfZOTSSPGcxZI9VEFKXo5YF/lCQ+TFRkQDbuLaIVrSBig7c65GjBnkvQvRxiKq6l441GvcezZ4OFNnm31mOjKw8HpWVyWP9oDPviE5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPhIxRCqOHn92YAhW3yvtLgUBHBQghGgqh6q5eoD1OM=;
 b=f5U9+2+kPFWz6ohu0WeIC0nRSOrmIpIe619xN3Novr1mUvGpAepTjcKy7tqOsQ+7y4PEoN+KZ+3ZXj5e2bnpV6AISWmZe2lsdTAqHVNEhc+p5NLdXQW4OzYMCGmu0EBi/bCC2R7v28xGjvDKqmtqiHJC1Eg+56wpdeWq4g98tfbgEmIkqAgci6xvnHpfRZBs0ImEgO9Y9/AnN76Mv1oB7D9D+hHriayuhLSPYHiYzScS6K9kSRAUzbi9OlzGacQnkayaHoXROxC/PjzS8dYT/dH5owlpbSnLJOf3CJpUJ0+/IPEg0/yHzgliQqQ4wATEaJy/TPH2qWUS8qDL+lxhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 05:22:15 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 05:22:15 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 5/7] drm/i915/backlight: Add function to change brightness
 in nits for VESA
Thread-Topic: [PATCH 5/7] drm/i915/backlight: Add function to change
 brightness in nits for VESA
Thread-Index: AQHbdwNpEt0/pInss0WwqlyIESVMXrM44u8wgADczWA=
Date: Thu, 6 Feb 2025 05:22:15 +0000
Message-ID: <IA0PR11MB730743DCD0A9ED6B27C4C9DBBAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
 <20250204125009.2609726-6-suraj.kandpal@intel.com>
 <IA0PR11MB730748D7A52408F40DD02596BAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB730748D7A52408F40DD02596BAF72@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SN7PR11MB6945:EE_
x-ms-office365-filtering-correlation-id: 0692e41f-3e8a-4aac-17a8-08dd466e37f4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9/MreUSEnvJKbFul2LLxG7HFAap9IzuC6R/sjrxhmmAjDnCoX74t3IIODUD/?=
 =?us-ascii?Q?b/ty6Kw+s1Uw2tz3838uy2RIXfhQqjOLyB56GWieNRzoOusT0n2eRF0BQwRS?=
 =?us-ascii?Q?4v84nQcZbu6hs1t00Nn8FN2B/48W1JJJ913j+7MBzaZLotidrCQ2+ID2H/tN?=
 =?us-ascii?Q?wwmOXZOGaKaRuXKXya8E2Yjt0Yz5YVfichXxK3kThLUun1KBbi8BaK9LVHFt?=
 =?us-ascii?Q?/pd+M71Xr4j34pqmXd3SGHGVc3zxxF8N1Ut9TmEfGu3iaqWgf1nfV8Q4IBgS?=
 =?us-ascii?Q?6IybwM9D4IuG6bPNQkp/DSA8orNpkYVckEXQpPiGPUgxzwEx8lD+rwudDDA4?=
 =?us-ascii?Q?TrEhg28cM1k+D/s3KxSsg6X3fDXTQLbV/16E7mOEE1w3l1ngxXF3P9vJkMXZ?=
 =?us-ascii?Q?hoBkszvN9GwALguo/3k9v2a4yvmwk9NAgJJ3n2bCdCSMrzEOztexKyuDAUv+?=
 =?us-ascii?Q?UvDLuSBIU6uMPECeQYDwvqROx43rvHjUfzat9DUMCkmBuS0PrxvkOwA6AtWk?=
 =?us-ascii?Q?PDJU/KObr9EsSTjb+BYHU0sX8L3oke2Is4OufcSmlPJ/cEjbDoAXvdR9KmUB?=
 =?us-ascii?Q?H9ZPS6yrdGZJYE/qJRbqh3+p7gtkVO2PlNIiASVT585kJD2NPMFLAq7YczLz?=
 =?us-ascii?Q?+b+7vu3hcj6zZKwfik/qbKFSaVzU/chMdLiEpR2pOISqET4W37n6LAnniEIB?=
 =?us-ascii?Q?Hre411gHd5cbqrbXjTkux+y9M4cybn4laRfdQqXoY2ctDDufZfGAN5RDLdGg?=
 =?us-ascii?Q?nE9nH7kUDwbfKkRLzX7CeGFURGFKjqmb8lpGuInmEXP5DiJlrEtPKZ8z6/ep?=
 =?us-ascii?Q?coW2sDqLQjGagWDjM0VhLbfBDLxhYTD4UT097S7pxXLi9zGhy1OASwE0717g?=
 =?us-ascii?Q?Yjio/ox+NzKuYmOVlbcRMkLHsrQ4jSgEgA1q9Z0C+lMzGOniiEq07+F5XZB4?=
 =?us-ascii?Q?TB7UJ7ObnWAs0bBk+ltTm+SiWKZg7JGpyJUkV0QM0ov2w/eEnjzWOwuACiPC?=
 =?us-ascii?Q?Encd+hRdWwJ8btrS+LTwdxHnDi+0fuBiwDzdSoKt3qQAYYWB3REieijo6V63?=
 =?us-ascii?Q?fc3u0ZzJVJqGnAXiw17grVxthpN2Q015qv1iPrA+fEsqSEa+4xg+Rg2Ka9EY?=
 =?us-ascii?Q?omOlbTEq7BzhVwLh1OA9kNUvgU0qfwpumv7u1oPCh1TvzLEAHqhV9Lzj0mJw?=
 =?us-ascii?Q?0Iu/UE2qwtADq7QvByiG+RxM2WGq81H7YFv/vaAFZZ9TAdxUyTx4r6yS//O7?=
 =?us-ascii?Q?G9+bfAW49/Ie4kZg76jSfaH8Saab4B4+hUrVilxBSIgHv/lk/f6ZywA7I/jF?=
 =?us-ascii?Q?N2GpAO2jd2cNQpTpqIrgjhONjBs6GdvPvqNa226EQkFskNipat89OLKqKeVd?=
 =?us-ascii?Q?G62KzmLn5l2+W/05TMRZPvebgR945wYCbPh/pw13ZdZeC3zeYzF1Iy75vX0l?=
 =?us-ascii?Q?DVyAh4hWvDDGFXHorRqOQMdk9E3mHQ/d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E/oQPwMWcN9NO61kbmea0Bh8bPUuvdv0huSjtJK7CQA8ch1yS5KB6GPIkRdE?=
 =?us-ascii?Q?Jq3e+uLNA+ni6w6488i8MfJEn4yB0RkNEAjKo/aHEyh/uk2fR7glHl6xloBx?=
 =?us-ascii?Q?aN0OfzlFW4x/PxFv2IERfA4k1YqWxFsIF8b8zSrbNTHGSFftdG9H5FGsdwCZ?=
 =?us-ascii?Q?/id1MlqgEgNokahV5oFSnlxSZwK6mKflV1p7sKPIRRlKCHlSaYZdzh0k+F0Z?=
 =?us-ascii?Q?g0Ih3goCHsQUE+3D0sJgX/xrcIGdawreMUgR/LCFteW1qtdYvFzC5TJMyzNa?=
 =?us-ascii?Q?KseBia6TvcfSubh1GOQ0KWXnIFg9xX5sWNiGlb6+zKJd2X9Qq4LmYZL6jvlS?=
 =?us-ascii?Q?iutUUZrhDUVg0+ggy2oK92XRjm0XX/jzSka4tOClsYkbfLx8G8ZVZ2T9KyQD?=
 =?us-ascii?Q?mZ13tREkOXjh+pWxLlU0zeboUkFcitrLwiPFTLj1dMoWbvF1Dxb0VPFNh8+m?=
 =?us-ascii?Q?BqedQ2ZeDpQrwRv/+w+q3RnMDG2Tn1UvmoQV4CYHWhIf9Ldiwtcc1Wx8gx8y?=
 =?us-ascii?Q?kZzK4h6tczGAtt7bqBG5vCwn4sxsj8bECXkvNnL1Qpm+6MOeHdW+zAuvUubW?=
 =?us-ascii?Q?GhVdVLDJWgDxgFNbVdJqgcCeUZyT+i3pQzTIKfbn3co0WlzWgI+OiqMibFoD?=
 =?us-ascii?Q?EGZUY4kPnN4TbaPJbaDNI+5tZ65rYWy3y//IRI3tLqsY8Vp965egCldYSnjv?=
 =?us-ascii?Q?Q6ypujfZ9kd5XRoulSmCT2gE71QqR8DjAfJ5hKUsRIl/t8YItQ17EV0iskyJ?=
 =?us-ascii?Q?eklb83XX0zq0X9NIhR4dYSoWKCNnkEhyiNf6VWWxT/thvVJD4dwK7yJ/SlNb?=
 =?us-ascii?Q?0lnqEBdwfH/smHDX9rMhGJsMnrYYOu4pbTpu9cUjejK6uX6LQu3RRpdEagLD?=
 =?us-ascii?Q?pQAkLHo5i9A1vlOyXFVTjG6fNcEbivA0gWfstWf3zHw9F8Y54yum3RIJvtqR?=
 =?us-ascii?Q?So6mv4OnNAch6a7mZtXm7jtlMikkO2vPbfceQryFJoQyFF5x02JogBw5trTO?=
 =?us-ascii?Q?X9R5RcjERXtQH1XpzEZKQsx6AGV3ECO6CaIOewUbDUiHJG9XisFURoRgqXMs?=
 =?us-ascii?Q?udMjbmG5d+SoN75p1m3ovGYhkCCE7/8cRC3wEdAm2t0L5RiPmFMDa47YTx35?=
 =?us-ascii?Q?Q0dz25khhq6lDlosaBByvN7bkh7BVsj6Qrt/P6SQ+SkpsZzN8V7o8fjYG0VU?=
 =?us-ascii?Q?jgAu15kzjVtffp1kYDr3oC0tgNWVm7mtgVyXUErHYntnhqnSToRRx//eao8j?=
 =?us-ascii?Q?J73HW94ND9hlWnQGdrom7KM86FDvR1kRbjGoN4wmiea06SVCl0XJZh27//aW?=
 =?us-ascii?Q?Vj5TMhzgTz9xvEJpe6zWH62p59PFo0lp2AeDww1co/tQnZItelpj52wm/A0x?=
 =?us-ascii?Q?jnapEvV351Z6df5DDW8CN4fF0BOyQ4uiC+zfb6S0ssh0wFIVqJQVquxwm+n4?=
 =?us-ascii?Q?e8+8+7l15FVESAd3KRe76X6srD/Hl/g1zGMlEGASrckKQnEOezYZb8kIh5mC?=
 =?us-ascii?Q?zl/TfeX9P2mxHmEMSOTOhVZvN4bWT04lIfVtrQ3NjWSrkAZUrWSpJBXkGrp3?=
 =?us-ascii?Q?o+pgM+ekhEzI/FEI0xCJLbB0ngezzxLH3RmKoRWk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0692e41f-3e8a-4aac-17a8-08dd466e37f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 05:22:15.4948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFDLYRZ33EsCKyP5Ou1gN/QGSGS/tbtIe93TTf/FkpzH1k8C3xsBKxXi2VT6Em6k9LiY8t40FsAd/R1OwI3fyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
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

> > Create a function that fills in the value for
> > PANEL_TARGET_LUMINANCE_VALUE which helps in changing the luminance
> in nits using VESA interface.
> >
> > --v2
> > -Prefer using luminance over nits [Jani]
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Tested-by: Ben Kao <ben.kao@intel.com>
> > ---
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
>=20
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 30
> > +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index a733b5623563..a9facfacac95 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -474,6 +474,31 @@ static u32 intel_dp_aux_vesa_get_backlight(struct
> > intel_connector *connector, en
> >  	return connector->panel.backlight.level;  }
> >
> > +static int
> > +intel_dp_aux_vesa_set_luminance(struct intel_connector *connector,
> > +u32
> > +level) {
> > +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> > +	u8 buf[3];
> > +	int ret;
> > +
> > +	level =3D level * 1000;
> > +	level &=3D 0xffffff;
> > +	buf[0] =3D (level & 0x0000ff);
> > +	buf[1] =3D (level & 0x00ff00) >> 8;
> > +	buf[2] =3D (level & 0xff0000) >> 16;
> > +
> > +	ret =3D drm_dp_dpcd_write(&intel_dp->aux,
> > DP_EDP_PANEL_TARGET_LUMINANCE_VALUE,
> > +				buf, sizeof(buf));
> > +	if (ret !=3D sizeof(buf)) {
> > +		drm_err(intel_dp->aux.drm_dev,
> > +			"%s: Failed to set VESA Aux Luminance: %d\n",
> > +			intel_dp->aux.name, ret);
> > +		return -EINVAL;
> > +	} else {
> > +		return 0;
> > +	}
> > +}
Can this function be moved to drm core drm_edp_backlight_set_level() ?

Thanks and Regards,
Arun R Murthy
--------------------
> > +
> >  static void
> >  intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> > *conn_state, u32 level)  { @@ -481,6 +506,11 @@
> > intel_dp_aux_vesa_set_backlight(const struct drm_connector_state
> > *conn_state, u3
> >  	struct intel_panel *panel =3D &connector->panel;
> >  	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
> >
> > +	if (panel->backlight.edp.vesa.luminance_control_support) {
> > +		if (!intel_dp_aux_vesa_set_luminance(connector, level))
> > +			return;
> > +	}
> > +
> >  	if (!panel->backlight.edp.vesa.info.aux_set) {
> >  		const u32 pwm_level =3D
> > intel_backlight_level_to_pwm(connector, level);
> >
> > --
> > 2.34.1

