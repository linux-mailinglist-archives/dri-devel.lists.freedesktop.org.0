Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D24DC04572
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 06:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83710E9C8;
	Fri, 24 Oct 2025 04:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INDgq1A4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246F710E9C6;
 Fri, 24 Oct 2025 04:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761280201; x=1792816201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PE/imlPnnUWifrYRxfAih/dr//JyRWqBOKBs1ExJmrw=;
 b=INDgq1A41oRJ/5IOTSB3JzRto40U2xrGw+aqsi2hNlYtv1p7p8jXYM4V
 ux6/EgP/KL4UKeF8+ZJLsldBAZ1UIHXYHogkjseIPIimBEPxb/WSh3m0y
 2dNNVrbOuD8GoHlSNFF0dnjHy6VZRZgwSS36SnpIyezUjyzjYhhec4R2M
 g5FQFFTrBKskpFK1qy5TGNVHsScyhtsw1gZZ6ACNa99MXgfeqzUXyVxgC
 mANHsdBIQ4zKgr4J2ZKwdiPUtsKnQw8LfRlbhfQS0w7wvpQsjZu2Wn6Iw
 NkNvi3vHN36VIwZkMF7vFcyDhaHv1eDnzNgBd459JMwNYa2ihi9SQYwiZ Q==;
X-CSE-ConnectionGUID: z3N9YYZeSlm7LnW8/IXG1Q==
X-CSE-MsgGUID: 7hLqOOIFS8yM45xEfFa3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66075913"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="66075913"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 21:30:00 -0700
X-CSE-ConnectionGUID: QJw3IRndQDKr6zA+t46sZQ==
X-CSE-MsgGUID: EZv/dr1qS1mliv3XACvegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="183509171"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 21:30:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 21:29:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 21:29:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 21:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2mXrWbXxfNtxMpA0e/mrqKiuuW0noXBcbl6aHb241AXc+reYEUNttEWQv0Wzu/pvhZ1lLc4BC7W7o0h/qJ0oktlZGtYICJjCsx3iZAbHuSCVegUGZGJANHYmPQud8+W/FaKhvF2ws6tyPptzIP1wLB+9njgBFk0WhKiuAJ99y8jZNc/E0Nh5sHFuulnT4Pk+hZEieyGj0/64co1jLk1NO1E3SoehoqZSg+RuWiY4v9GC1NmXxJjfdQdHdNLNrbjAR/Z4HO3lcY221oBGfLbVLggEGkeevxHT/qOCc1TH3c1jZp3QNV9qaFtseXASC9XhbF683yZmdOuGaMZwj2Ayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcxAoequ6M/c57BgYWz6ByC2rrYBDn+RXagjaOTDhpw=;
 b=FP9IC5GN+hcCf2MgudTO//IWr4PtOyrsMOTRnumK2fkILy9fvo8OWMbLMb7+Hz5nhMS4LaB1dfYSkMxlr+i/mYdPKMcxeGJiUfx4RyOi/493lTK9wmJ5AqOkiHoNOj4XjuLjMipOb2J1Ghwnd9qQqIoNuN+/oPxN3Z3cGmUiNj/58DetxWa1ZuXPSoHPNRv9+a616ISf9tbwUT4NkevhlOnCQabuKRrpjgG059JQvTL/G6fcokghSMaiK2fRYSe0NxLzWZLjlTSdrqPa3kOcIvDiAhas3TMvZVaGKz3o5cgd91TWUxCJxjwJPohlLZ2tedVri/zEPWDO6uaHf6MHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6780.namprd11.prod.outlook.com
 (2603:10b6:510:1cb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 04:29:52 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 04:29:51 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 06/24] drm: Add helper to extract lut from struct
 drm_color_lut_32
Thread-Topic: [v5 06/24] drm: Add helper to extract lut from struct
 drm_color_lut_32
Thread-Index: AQHb6zDhBp2yOGC70U+qePOAaHYLSbTRZB4w
Date: Fri, 24 Oct 2025 04:29:51 +0000
Message-ID: <DM3PPF208195D8D3DDF6B6DE06D33CC3856E3F1A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-7-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-7-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6780:EE_
x-ms-office365-filtering-correlation-id: 98a7dd74-3b45-4784-60c6-08de12b5f952
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aAeT0imeiqqNNIP2Np+j/bAiKR/EiR0z4qF/Vy2gG/uBLGdnBHyb/j4jCoIi?=
 =?us-ascii?Q?HfvxB4XEkyt6gl4YchezStn00eBNdDTJu2N6C4x2kFyuZ3wrSeeEAskdsylH?=
 =?us-ascii?Q?E4kzGunqpFD6a+aRDw0Xe9YoAg8mmLX0sJywJcLurXSys7AQAFFuZ1vcaF4K?=
 =?us-ascii?Q?UAlOA4XMKkCexoQol0whv/7cw1UGBZEtroqXKFkTbJd9G64SgaPi2UEO4Gji?=
 =?us-ascii?Q?WzW25W1RKrqvK3C8/MjBv2gBQMFYzbcs/UTx4pj1ISJ+AyWAPqVE4qqMjrTr?=
 =?us-ascii?Q?LucOGF5G+SFO1oBPUqMNHxqjxW2gRvzWeNshizOI1GhojR7A5BbU1h9pxaXV?=
 =?us-ascii?Q?IghtksnAlnuc5Kobvl7ma9o8HyToU4KM24OkyZyeXK0F/eSG2dlIWbNoVtcu?=
 =?us-ascii?Q?lEjLy3R4+aI8kIQKUpNmWAsZlW9Qjvtbef8pKPmdKQQ8m0bLAOWS2ozXLuW4?=
 =?us-ascii?Q?pqdZp+RaYp1pnY3XAqQJNqUcaQTovg4OyU8+7cqd+PnVnke6QhWJtsyuPU0h?=
 =?us-ascii?Q?szlyNNa51cLzlYUA0XwhBnoLN0ddri3rlZI4lBkTEVFJ7hjd2YNtEfaXI1b2?=
 =?us-ascii?Q?Aj2woCSpz7UObp4yhDiPiG61XYr8D1kGUfACbc5MnWGnvBxUl0puThbpyc2H?=
 =?us-ascii?Q?fPboIZ1p+4a6cLARjKqATiUhFvYmnXJJPO/tMkWDYjo9y185h8V62ACR3taq?=
 =?us-ascii?Q?BspiN92/Uh17Keb6f63bFWhX/h7Vq2XcwZ7TqKAmNrsvEgMYZI7Ts4C3CrtK?=
 =?us-ascii?Q?1uYHCuAVGcCLPyTeIZFkzcDcMeyfw2OAES7oxsvL27JDDN/3i+SgDGGRoFQc?=
 =?us-ascii?Q?Q3l6oGjF0E6Qq9gn+b5KB3Fg6r8hy5UlI32iQge+E1BmsI/8RLFL7Yj+tsWA?=
 =?us-ascii?Q?00k7lNuNSyI67k78upvOFwpXkZqf6DaTuheG2e7dQdWUzy9xqvh1DjJe7Dqt?=
 =?us-ascii?Q?G676Si9tLhW0LzFunfZHiyJ7PgFc3e1hYzgIMPyyoscJDNkhsoI+IyFXyLcP?=
 =?us-ascii?Q?q0F8rqnOunWvOoLnOkKuab+p33tgQfwCx5CJnARIQ3sdxWCfOVgrlTTD5fGP?=
 =?us-ascii?Q?cyPUj5xQgp52fseO9tNFECgZaFEUM6jHapQxz0WqUWfomwBBEMqymzeBL6MK?=
 =?us-ascii?Q?tCAoyX1B/cpxXwwvnX/f9ZmLSM0y8gIZXNR8Cf9vQ2yzjNg/eAtAcVBcrMRN?=
 =?us-ascii?Q?QLUZUtuYjEx5sLrc+TDtz2vHIOT0kfP7/9Sj9csQReT4754qDy27KiyZBFkG?=
 =?us-ascii?Q?ChJ24yDCLisEQCPo3ohDh8DwwqGDf+AKcz8ySt13OQh9nV8TwzNP2Q1rLUFJ?=
 =?us-ascii?Q?Fvi+vCMkuqPEY9QA+9de8KOFinaVUPaj7w10oVj7LJddpq3Y1k89szJPd95y?=
 =?us-ascii?Q?tfPEQT6Zj00sO9XFPCdYNOgU7xQHAOAsqgiHE1PbJ6790QySW8un58fqFwGn?=
 =?us-ascii?Q?XFIOqUj+S7TtoWIoIkCMSszLgRr7cFXRPAv4OrYGwhy5TbzeDAuZhZixzMZi?=
 =?us-ascii?Q?61kuw6CFr88S98ceRucI9Dg6YO+boDrJ4/I7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hlMi+yIF6CwkqtSrx6PX9MD2AieRHahrNpSB+JS4cP947FYx7QgB1nkKGNvx?=
 =?us-ascii?Q?mxloPDZA9cchXB+6f+smLgXhk5qndv5dBJJ7Rsr3hi4W9Lemsezj8ToK6y/X?=
 =?us-ascii?Q?5y4z5az0/yGD/J/l7FqwS/s1axUpS1YH2MkuasQ5QABGRmnPdcIjBNHwTqkb?=
 =?us-ascii?Q?j4AJ/c2SEEMdYOWe4LjYo0OxpoA2JYgvU2aIjPd3/A/jNGUvhuN7fNEY0V4M?=
 =?us-ascii?Q?S6Fhbn/eqAqvuffniiHhcC3NjpiM0C3IASMBlt9xerDtGP1Gpzlwb6XU2+9x?=
 =?us-ascii?Q?PUZsjTEOaHfFnoqDD2j3mRAe4YKILUP2deu9npJ/6Gx3bbUIwZ2cac9mG51x?=
 =?us-ascii?Q?UHhSRX70/rhu2mvDYoK+fOvhQf4eJFBqZC98Lr0l9nlLTXFDSlQxltlGsFZc?=
 =?us-ascii?Q?ATZ/sw4Z9+aCpn38xRKeS45gEEzjfX0X+JrkK1+IHLx9Bs2MILeZXk5JhhdG?=
 =?us-ascii?Q?/ImvqVHDn+4Ix0ebVzghydGuSN+5bak4juxLjbazf0gCjwUroJfgmTIaX/+t?=
 =?us-ascii?Q?6nzio+RhQUlUUQoIUxlayHPWbuHzuQIrBWshvtAIfs0c4QNLdF8QpaqaKAC8?=
 =?us-ascii?Q?BpVLfYHRHvb9FjaLDpmRjIeOt4zOSbV8Najzm987RAnlRQrZJotwnycAq1bh?=
 =?us-ascii?Q?h+c9zkPqqZIbp0e1N4Bj097hSUrQC3EteSC0bemYF69ipHAnKnx8kWa6dwMz?=
 =?us-ascii?Q?NDmXjEPAraDBzVEvtINaR4wDRwRfYrtTApE5yuhj6aZU/oSq7Dr0+VXKsIlF?=
 =?us-ascii?Q?r53kIkmUAQJMABll8u51Fr5zmJUggrJpt5pYrEjMCVSICH9wtV9+rKYMEO7Q?=
 =?us-ascii?Q?YtM9OyLVA7p5pRXbjmIw7VHkwRRQvkR7rXhNj+yyIhq0awM4oJRXRIDtUiOk?=
 =?us-ascii?Q?g20JgIAIccAhupjyiwNKjRWy13jol6H+IgVQYP9Yo2Zm2e9Ih5hyQs6gwShS?=
 =?us-ascii?Q?i0kVxo5MLo6AVvZAyswjHQAZemEGSXwAM2UkudkicEBSUVNPn0I5antOrMZA?=
 =?us-ascii?Q?NRI5PbwmKLCYLc5WntA1Y7jHArZqPTLXADMu0gun1p0kksVczZhqcJy4XobA?=
 =?us-ascii?Q?oNNhj9n3ZFiemkuOKbNAu/tDm1tiQx//Pt9UPaxmL6bxki8Pc0/n5zZ9dVT9?=
 =?us-ascii?Q?HmmGdfP5/cc1XhmAqybp70ZsvSA//387W4RN2JQM59OjDUs6JxemcumfCErq?=
 =?us-ascii?Q?ddss0pgfWUKrsO876hPF9OOkBk1eu3dTNRIQ9Vrkxv943VpTpDeaC3jeHnyl?=
 =?us-ascii?Q?WEH+ozlRqxRQP42e4wLQ8+Ze51iS0ntAEn2pHFXGi/mVFYYFhNp0jYwIHMwH?=
 =?us-ascii?Q?KSn2yTz9pEcjAD5xf5/V77kzlHSupa3j29DBxqaQpc3pmvZbesqwwKdK49ko?=
 =?us-ascii?Q?TsJEGNvPEmNJxebmc8ESxCLxvc57hQ0r4So22xVn9EWi5ZSkxWGmUuTz7Qp+?=
 =?us-ascii?Q?FpOi7j6moKZM69HOdMS4eQy2wHWHDeBEBNil4gxSUcIkrcyxdqFiANwcWRe2?=
 =?us-ascii?Q?s9pJXRtgPV/YZHX0gUDCUqmb7og/mtMPqfFSr45me51ZlGkSO1GN3e/Y6NnN?=
 =?us-ascii?Q?Safue0Zi+TkO0YQ4Zhn3fmucXU0zpdK/fv02LukG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a7dd74-3b45-4784-60c6-08de12b5f952
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 04:29:51.4347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zn2A6drGpyuKcPVuzq8Wt7hXWq7g8GkxJVzFAClA04jHVobpfGADpBZMLVB8zEbCZJw00Xoq4YbUNW9q4Bvqmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6780
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

> Subject: [v5 06/24] drm: Add helper to extract lut from struct
> drm_color_lut_32
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add helper to extract lut values in the precision needed by hardware.
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  include/drm/drm_color_mgmt.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index ba420444b9f3..b1d12f06fc6e 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -50,6 +50,22 @@ static inline u32 drm_color_lut_extract(u32 user_input=
,
> int bit_precision)
>  					 (1 << 16) - 1);
>  }
>=20
> +/**
> + * drm_color_lut_32_extract - clamp and round LUT entries
> + * @user_input: input value
> + * @bit_precision: number of bits the hw LUT supports
> + *
> + * Extract U0.bit_precision from a U0.32 LUT value.
> + *
> + */
> +static inline u32 drm_color_lut_32_extract(u32 user_input, int
> +bit_precision) {
> +	u64 max =3D (bit_precision >=3D 64) ? ~0ULL : (1ULL << bit_precision) -=
 1;
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)user_input * max,
> +				     (1ULL << 32) - 1);

Two problems with this=20
First you don't need the (u64) typecast compiler will do it.
Next you'll loose a lot of precision when we look at the edge cases where o=
verflow is
Possible so you'll need to make the multiplication safe.

Regards,
Suraj Kandpal

> +}
> +
>  u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
>=20
>  void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> --
> 2.42.0

