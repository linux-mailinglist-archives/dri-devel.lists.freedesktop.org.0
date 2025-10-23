Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A9BFFCFA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E2110E8D0;
	Thu, 23 Oct 2025 08:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G17wCdyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B99B10E8D0;
 Thu, 23 Oct 2025 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761207097; x=1792743097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wzKGICDjpBF+Fuy1lkrmOvyHGJZU+HrDlbJitaeuec0=;
 b=G17wCdyG5vrQkQnEtIHk0xtLGGTWSI4YNRI719HmVm0sFQlBsHiDmCtY
 U4tz8ceKqqpPBxLI+q5Z4srkuF+WqnjzepjkS7G++zs8wonSyvQ/v1vAs
 bI7uO0Y+gGqXFnm0nR1qpCDRniTyh0aQYiGlUgY7dEpbGfWqF75P8uhvr
 0Gp+gr/sJwAf0wds/kUUYdiyc0StczAMAD8B8coRyS6UHm3c2UcYtImDF
 H8I1BMyLc7I4eSO4ktermwYuwtZ7o5qrH3HoEELw6Dz3nPCNHmr7M8mm+
 PPSy8bcEha8/Lur6B0DCqKr0SUkMuklxSqjIQPkFVJ7re8Am0DaDzIw5p A==;
X-CSE-ConnectionGUID: DDb7/VqpRyyP0sOPdW2zfQ==
X-CSE-MsgGUID: XpCaLdjFR3CV8x1GY+KsyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73660585"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="73660585"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:11:37 -0700
X-CSE-ConnectionGUID: bvwBifYkRJO/eu3Xq76J/Q==
X-CSE-MsgGUID: miq6foAkR3afkeTSGaSOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="207751208"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:11:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 01:11:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 01:11:36 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 01:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV8WqQmgZV9pIFVXey4PwP4mhFQ9MZo41Cy2Nr18JRU5oCKe5hB8PvCKW3SK6uVCHqQP66iEAyvIw+jNIBX0mZCWVIvIPoajrX3FjAP/us0mU4s9HPwUTHuiGHsfu9nDoV0V9Rp2Tzw9yly/IfiBIjI6bkgk+AIrRw27O217xTSFsOuwtqS7qucT3gjl5zRU/GYOcYAAfNnZd0FffM+CWRmOxnATSXi0lYgNJRvgT1mjlgT0+EldMmFIokSFosHFPjmu6M29YU+wVhSrydsrtrsL2JVDDtTuXS9SRUHOGP2qaQ4aVpfFN3A+cZR3SF4dZUWMXIXe1OSMENUETLwm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrul1wWSRv6VxC8Jj0guC2kbxRFh2hNuzoAcRIlsoZo=;
 b=B6wKYceDDCXbxRt68hAG1FkyCIrdCHpr1jJmU3yvG+bFEE6u+apKkrgoc87pAhVAGxRQj+2jiPqzOe1Cwk6kKw9CQjLcxVxOd29xxX5rtqQCvD+4z6u1ajG4Qw4PFb2M2ODp7FqXVtPWbDD9AWvsaq0mWN0K9oq9Qy8Bo07qL8aCNzVih8Be8DItFlc37OrPQEx85ft+YPkxywV4MFxl0dlxI/CGaEOvt5WuBjH2/NJIAYLRgJ42UJn7CxRvryPKtWHNYQ5jjOr8PfOmZSf5xBh68QuNc0gufbWIjc1fExJoG/WfTUT7mHIQ3MQXro/eDcinooZ1UEMCGMsDA/LQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4595.namprd11.prod.outlook.com
 (2603:10b6:5:2ac::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 08:11:33 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 08:11:33 +0000
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
Subject: RE: [v5 04/24] drm: Add 1D LUT multi-segmented color op
Thread-Topic: [v5 04/24] drm: Add 1D LUT multi-segmented color op
Thread-Index: AQHb6zDcJKxGmhUz6USp5iPtIX2pGrTQEoqg
Date: Thu, 23 Oct 2025 08:11:33 +0000
Message-ID: <DM3PPF208195D8D1116619CBE818BC680C9E3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-5-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-5-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 36eb4d2a-3333-495a-51d9-08de120bc75b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WLXGt0pBmtnG1TpaWNMyAoZ+8Mrgjhg374BixK/0Yjr0yPfcdYEP4HnBbrGU?=
 =?us-ascii?Q?UQNSTtMEoYfbci9jzUt9xRaWAtz8Ic+MWqa2BRdNdQjDgFstnVVadtEyx/6V?=
 =?us-ascii?Q?HQugCVbVfEWDiHQ8jNC4nBGBP6R11kMRyPQoJXum1n1A6l0fh1twfB6MPNIB?=
 =?us-ascii?Q?Lqe9on7IXx8OG6b+jRi10GnKn4Xmq6zK/y4ufQzQ5eGCEL0qQbtvsmhLDA73?=
 =?us-ascii?Q?tk3cOCdwNHtJwZpZy5qr6GjzSNo2SrK3Wv9JhdL/hv8/f8RGjdO2zbmhX1P4?=
 =?us-ascii?Q?jA7GD7S8p1Wfmqv/irX/Hidwx4MZsstdiQ3W/1b1/bzVmLHWFN5pkUvt7WAk?=
 =?us-ascii?Q?A3me5dU/ofXRPVchL0YGQUPaWS3z7iNj/ZKAWdppC+daizQk4Js1YL73ted7?=
 =?us-ascii?Q?h/2ynOROsiG+EG9VTMeWGk2eWxsQ1IVgyZv7IyZb1GuReLFoIyZCrG66heZ1?=
 =?us-ascii?Q?7p6s4VwFqkhMt5LUwgKenC1+sIj1TfBVb4DNtualUC3LeY13CuxIf+ZDg19X?=
 =?us-ascii?Q?zUwccNFzJUs6iuUu5upgglckTSQ6sWk+NMiDNKGdje2hvCKugP2SRhiHrlhi?=
 =?us-ascii?Q?mFhhUsdCRe8bVRMU+LlrPT1ak8o/JS3FYNnK4PY/rLI9Lu3SRiJD0MFl/NGi?=
 =?us-ascii?Q?guoVxeFG4s1DtS/8IYw0drW1tbBnwndJbKxoRdQaQ3piwl3Kn57Ra3gwsYzF?=
 =?us-ascii?Q?frM7Z7aetlc5Lnd1MT/xELiFiFhivdHP2j7oFrqgaYBfaWF+WythCKsYuGHB?=
 =?us-ascii?Q?+ptajEPNVXFPrUbe4+Gc0mDZqAmCFD/RMvR91pQ5DFEODv4ABdZpOaDrjK2i?=
 =?us-ascii?Q?zSTOtTjLHXripcJHshIiTXYYgfDavq1Z5Ufsmo5LE9wybIgw2QQ4Dk8i+oAD?=
 =?us-ascii?Q?8ltDjOrg6ozSjOsquAMc0MQX5s0bMczrOpKOKahZpCpFcAs0nezpGEu/ks2M?=
 =?us-ascii?Q?Y6mTdvqIaX6v+dlaRnYf1qwLC7I8Yg65gOUM7bM72FfsGAfabjvMaN2TOG7Q?=
 =?us-ascii?Q?HpWgknfHpBS27XwMdwkjtPPOEvjxHulJBiFu8GQloKlM/406O8QBA4b0o8Zp?=
 =?us-ascii?Q?AxzjQ4Yl8E/yp19a+cmRql+DW5c7RzubZY/7Ew8CDs9USAG5n95hRPCtL9BO?=
 =?us-ascii?Q?wsjZcfXx1FIusn+XQYdS9JUmiu3T7foeWN1LOXbPSpx9bZSkPM/ZG+9CWQUc?=
 =?us-ascii?Q?LeqzSk7mmfIA4TeETVuaA/2VzDyu2Bg03D+N210ckdCg/md/D2VK0gNwf1I6?=
 =?us-ascii?Q?pgknN7bze2VQnhbO0LcBLnzoux7apujYBSEEHK4lolUo2WThvoBtuaKp3EbS?=
 =?us-ascii?Q?MS2vNExWPw6MgunFf/du4TyC61y8oUaUhWZSUtvDQS28sYvYA+FfMQCTNuwO?=
 =?us-ascii?Q?OPFlzCG229G1fpK8MK0j1Mu+mpft5t/VW2UzqeqvfI3JqtBfHff7ht9z90Qe?=
 =?us-ascii?Q?8DEijNTMt5O1dUiACuu7/a+x8EyO6Qwt6gUjsL7Db783IUeiT+9aXmQdg1T/?=
 =?us-ascii?Q?D+vfaWqgSCIAao4acvDJejfcRnjozfr0GmcN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GSyzALg1kE7KMG0A01d/WrR8ceM3NLOXIkq7pmoSgnzZb+gStcuF0sdlB370?=
 =?us-ascii?Q?d/LKZacBqe1eSkcpBty1fzSJ94cq3+VOdBqFYWzvtanjk+0Xcriv/8h37Ou+?=
 =?us-ascii?Q?tXLDHLkHmuY7gxbNgOJROWXi3QyVK8ugtzivLV6VtYYcA/A2r84fhS1Eiyiq?=
 =?us-ascii?Q?/nTsTyc+uh1u6U7Yh9MsGjyfh5jDXZ5HfOA2JNGB8jvOAAk4I7zmOMxVwnAW?=
 =?us-ascii?Q?v/lriBQEXfKShY64qdZ6RGFs9qioqWiIBCwjm1BKSMijF+YpA54Lht4TKQE1?=
 =?us-ascii?Q?5yISHvvIhPqSzDAkprkprl8neUM8z0yiyEsvEaAT+qNgYBZSmKz8OudJaM/I?=
 =?us-ascii?Q?aEs6FdiFXAX0HrwQhAct7JB/qREg/lY5UxWiNO/lhAa7R2aFk/PV9wivuYYA?=
 =?us-ascii?Q?qmyx7DDpxwF0gwEYCDzFj7WDrOBlUn1JpkZhmdSEcBhnJTaWSshBLNAs1nNp?=
 =?us-ascii?Q?8lgJpT8lCidP90R3+rp+cYR6qjzpiQE0Euu7MlLOn4yynoQr5GKkh6NYDa3J?=
 =?us-ascii?Q?MAQ2bKM5v42kwp+81z9Mz+bMxdvJ+iJUkYAPLZbY9xJUCE5CfQt5qYEBprSn?=
 =?us-ascii?Q?dhnDm0ugiN59BMbqiqrvepxLWFyzG5MNHPY5KWQv+k8TCvEjdEDcgEmSIGHe?=
 =?us-ascii?Q?iEUkGRoVpsxY2omfXSVd5fiTvBaieyTa9y86X7zMwjijv7RGzm3dVFBwSQFR?=
 =?us-ascii?Q?SghlzeID/Jo74OQSbFrF7hpHTYbrnzpIe1Ut7BymgOnKmXtjowjcWhIz8QVI?=
 =?us-ascii?Q?HLn5c+ZAx39wuQ9jofG0Wv1rkoCFl0bx66HerVOBcBQ8gIu2KZJ8fNx0wujR?=
 =?us-ascii?Q?60QHKr+HuJ4ORZ1nz+KUrUry9E6Yw1WjQZ0Fqsr23EGace3+TrDfHLE0Jvoe?=
 =?us-ascii?Q?HD4s5DCO+emXu+gXizdT1MDywwVTKDVc2RdpzLod7fbUni74S0HXbwomtG19?=
 =?us-ascii?Q?vW5sJWRqNMM56K7n8s76pVWFDjh7OfGEenBMZtyYhAGZvBVp1baQllZQBKEB?=
 =?us-ascii?Q?paSEkR+hCspGyg9+zzJ+1yFRc6+ZkYXuT51Fbz1mEZOagFwQmULm4ZD2W7nd?=
 =?us-ascii?Q?vH3mzlpTOj2JCzxFL6DAm4v+gS2CRaYQuEZkLCn2Ib+gbbtXObM/RFxF+nwv?=
 =?us-ascii?Q?1Jt41oNZHJ5OSMyKdRvu2WBtR+u4f1huVqhqnyCpJdG4gEFmjUSdM0pdJEbt?=
 =?us-ascii?Q?VhVmyGB2hy9JgLvGyJe/QADz5yrL5mxxi2xvpTxFxMUriApdG5pUASYfk6/j?=
 =?us-ascii?Q?V96k7vLHSv/VaE9BHM5IIaNX10qUEmc2McN4VC2lC04dYJMeOoblZFQyGRBa?=
 =?us-ascii?Q?jpumO2ixq4TSnRotFN3UEYx9ZKcjHNRrXS4UPgpxqSS3oMB0+9q+ENM4HPQd?=
 =?us-ascii?Q?cLqnGBaiYOzyQ96AmgbPfmDEVP2zjtUbjMRFODBSVcWE0K2YCOVTOltt9P+2?=
 =?us-ascii?Q?rRwysThIu+uN0numNk1HaaT1tAJvcst99nK6/BgsWgNTVZgTSQ3Fp3lp2R9w?=
 =?us-ascii?Q?XVzP1csUpPLX4KV0vPHh2KMSL9rz3EVy1Z9jI2mj+TPMlg566qmYZsfnN7Jh?=
 =?us-ascii?Q?xpRUEonN0ppPeplfFKRRLXv8yrcN8TjLfRWpgcO6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eb4d2a-3333-495a-51d9-08de120bc75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 08:11:33.1570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVoCpgYj2tfamaO1yXqAdAJ0B692jNyp3U9DIJ7tIIdBGcySHm9aoNLIm4PF3m2tcOYNwKGrr6ND611kwrQB9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

> Subject: [v5 04/24] drm: Add 1D LUT multi-segmented color op
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add support for color ops that can be programmed by 1 dimensional multi
> segmented Look Up Tables.

I think let's just call it LUT here too that what we have mentioned across =
the whole series

>=20
> v2: Fixed the documentation for Multi segmented lut (Dmitry)

*LUT

With that fixed,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c      |  4 ++++
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  drivers/gpu/drm/drm_colorop.c     |  1 +
>  include/uapi/drm/drm_mode.h       | 10 ++++++++++
>  4 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 3ab32fe7fe1c..71160a71f5a3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -800,6 +800,10 @@ static void drm_atomic_colorop_print_state(struct
> drm_printer *p,
>=20
> drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
>  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
>  		break;
> +	case DRM_COLOROP_1D_LUT_MULTSEG:
> +		drm_printf(p, "\thw cap blob id=3D%d\n", state->hw_caps ? state-
> >hw_caps->base.id : 0);
> +		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
> +		break;
>  	case DRM_COLOROP_CTM_3X4:
>  		drm_printf(p, "\tdata blob id=3D%d\n", state->data ? state->data-
> >base.id : 0);
>  		break;
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 81a8da09fbfe..c59f6671b73d 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -723,6 +723,9 @@ static int drm_atomic_color_set_data_property(struct
> drm_colorop *colorop,
>  		size =3D colorop->lut_size * colorop->lut_size * colorop->lut_size
> *
>  		       sizeof(struct drm_color_lut_32);
>  		break;
> +	case DRM_COLOROP_1D_LUT_MULTSEG:
> +		elem_size =3D sizeof(struct drm_color_lut_32);
> +		break;
>  	default:
>  		/* should never get here */
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 52c08d717944..97e9acbb0f2c 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -65,6 +65,7 @@
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
>  	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
>  	{ DRM_COLOROP_1D_LUT, "1D LUT" },
> +	{ DRM_COLOROP_1D_LUT_MULTSEG, "1D LUT Multi Segmented" },
>  	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
>  	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
>  	{ DRM_COLOROP_3D_LUT, "3D LUT"},
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index dd223077f4e9..18e36cbe10f7 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -915,6 +915,16 @@ enum drm_colorop_type {
>  	 */
>  	DRM_COLOROP_1D_LUT,
>=20
> +	/**
> +	 * @DRM_COLOROP_1D_LUT_MULTSEG:
> +	 *
> +	 * A 1D LUT with multiple segments to cover the full color range with
> non-uniformly
> +	 * distributed &drm_color_lut entries, packed into a blob via the DATA
> property.
> +	 * The driver's expected LUT size and segmented capabilities are
> advertised via the
> +	 * HW_CAPS property.
> +	 */
> +	DRM_COLOROP_1D_LUT_MULTSEG,
> +
>  	/**
>  	 * @DRM_COLOROP_CTM_3X4:
>  	 *
> --
> 2.42.0

