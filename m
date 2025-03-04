Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696EA4EF96
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B426A10E0AB;
	Tue,  4 Mar 2025 21:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kt8yGO6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2910E0AB;
 Tue,  4 Mar 2025 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741125175; x=1772661175;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QtDwCg+VdA30ZYcBpbi3h5sHmn7K/Uix4CFK8H2EaLQ=;
 b=kt8yGO6np9isJ9f1c6GDGM+Zp0iqQ5cpVNDq3RFp1bNytVLtQyqYpM2j
 9yjOEsKCe4+534eI2sQtCC0FgE7i6oZgzJp746yHAvsLQDAF4W5L7a5tQ
 IjkGAPX+lKvYPMExxOAXpMOR026wjAvEP4SCs0xXi4jd07p5R5pKbhC4g
 KLmEK5I6HolvEYcvMKVitr5/Qul4bI7khL+uvelSEvqtArq3eAPyPWMC2
 J3qzClab/HEiy5nPa0BzlxtnZ+dxfT0WQhSyDRtK8+bdZS782/bcQ2hz9
 dkT+JMXKdzatNAG9HMhNkKaolmt+p25TSbgYXwU6IOxiHSoRJXij76zy3 A==;
X-CSE-ConnectionGUID: kb4/XnNyQL65gTKdCTmkZw==
X-CSE-MsgGUID: Y86fE9eyQ4yukMYS6DIbYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41780572"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="41780572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 13:52:54 -0800
X-CSE-ConnectionGUID: mvxkGRSWRr6zKggCUzl4rw==
X-CSE-MsgGUID: v1+0u+7IRqiJLV3kJdBnhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="118647775"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 13:52:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 4 Mar 2025 13:52:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 13:52:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 13:52:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3mKfmxhCNrWktT9AhF+ktxvdHV4cWwHvtIb5qW6bpNV07S+t8GP8znIOa5a/PXpKdsOsEJB9ZFsa0+NsIBm+fXPfYqOS0JfuYc4NKYzLAOakV0dk6WeT2EUgFRGZf6kD4tp/VqJfoUa5ibrBfwGKz4woqjdy9fMCbyRy6ghxFfqQiC6/83v0UJQDgYOLyXc3ErKHUQ8VzEJMAKoMb8ZzgsOwsNBv42bRbyowU1JKFglwAtXwbdMWkW+qL2SLuEzWGgAIKP5G5/nQdbq47RD5UOUh9saxfqPGM1dGIlDgmEaEAflGPhGMGzbPg0YkgHgSZlR/kcBLGM8CatO3Inklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTFM2eWp+8/7Pfl3xEwWuXidPbn/pAZPhWDqCSCVHws=;
 b=nyXSnYFXQqtbJGxC0yQlQXVBmkGmQnrd+qT/35OHjS/RBssXfzkunwHW1rhrQxelLt64f7wfF1AfrOMOpQ0qYtpZfLxNxg9BtGBJqmnYHi4XU+C5DINLcWFWdzsNl3NdkBt7pwEEh5IGRwuZhkAxJIS30qEnyhkxzsSCWmUGZoVY/q2XkLx2v6lW/K8jT8Zy6i7J5utb0U5ZWAcoKDUf7T6t9Ry8RpCAovAkm8uNSxjDVDL4ZaHP+5q7q2MsvQJf3faV7K8XBlul3jyVyYoPiZbRHcbLhTFhDTnbnQz52IwPGc0w4IjQYySxBE50BBQn5LEnYCVuhfxB3NxrfTlHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 21:52:51 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%7]) with mapi id 15.20.8511.017; Tue, 4 Mar 2025
 21:52:51 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Zhang, Jianxun" <jianxun.zhang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Topic: [PATCH v5 3/6] drm/xe/xe_vm: Add per VM pagefault info
Thread-Index: AQHbjSgjodQTkFI7206TvupsztHqobNjfujg
Date: Tue, 4 Mar 2025 21:52:51 +0000
Message-ID: <DM4PR11MB5456C18650347A86311DB70CEAC82@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
 <20250304170854.67195-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250304170854.67195-4-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA1PR11MB7367:EE_
x-ms-office365-filtering-correlation-id: 0d6ec132-7dab-4431-7b22-08dd5b66e923
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F5MYzLewDHS3IxkZXDfczhI9ddF2cr8Z/q7w5mSF//Qcqs/FYyQxfK+Zq3SU?=
 =?us-ascii?Q?9KbBqF0mVi3bU/o/5il9IZBFcXLB3GX/dNFhl3wiOeCQFFCzlcZc9oVYtaou?=
 =?us-ascii?Q?8lyybhN/l7p2Q6KtcWwP9f4p39g8lMES9EUPJcBqNovQXIkGaCPJQ9xdyhqn?=
 =?us-ascii?Q?ZuvwZXl90QGEbReJI+VH+mmCEC/mTwwJLzqKt2DRvFfXoLSIEdKX6pOMf5Tb?=
 =?us-ascii?Q?LZYvhqF6RSukhZjxE076ZAo3JJ19iVJQJluvC3ICG0ksLB5jJRlF9PNgOR7q?=
 =?us-ascii?Q?HKL2mmsMxsNYYSzH5YLVY+KwtU5T3w4ucv78GR5eCS62z36f7gtoBY2lZrzB?=
 =?us-ascii?Q?127zR4liE38cV3EGgWxry4ibq/sJbtrnRx+pGMMl57DG/Y+DrV9xk6AO4rVm?=
 =?us-ascii?Q?6Z/zYRB1ZA9c4tTokhtJhAfH7V1dHaoQMzIuWZMIJKgxskebQiN9ZR+X2U09?=
 =?us-ascii?Q?Kfin87GTMjD8ExCXJcTlb5WjoVwTSP8fTMCb7WcatRgsFaaevML9/nFYV8rt?=
 =?us-ascii?Q?RvQg20Hdn79nMrDZiy8xh5s1z0RwyphZVCQOmjFXcV4iOqvcoS8kpwNGTt17?=
 =?us-ascii?Q?Asw8RVt/CahvqMmFLwQ28JDuJjOaMunF06LN4+B7OrE3XQBH1B6iAh8HxVc+?=
 =?us-ascii?Q?gPmnJ+5Z4R/qEvje7bnUoeNg05Ob8w8bz58I5s4Yf3OXYIsfc14n59/TP48b?=
 =?us-ascii?Q?pThVRCm7A303q1wyqfh/DuXtEh/ts/h4W98bYNv23JBExDJk7sTVLG+vYQ0T?=
 =?us-ascii?Q?lVkM+OJDKpqnId5/rTtL940K1Pz2pHYFeXm6035vzgxU67vWO86nLpjjLHfT?=
 =?us-ascii?Q?BHn6jjQuxrY65TNKoFa0KMkXCeC7P0iecMC6gfawqZ0Z+8zKwTcxUs/lP2Xs?=
 =?us-ascii?Q?85bjRMzmrs2TFG1HspemmNMBCLcRy4s1SqkED+FRp9Fq6fVGFMYdtz0YnBY6?=
 =?us-ascii?Q?Su5tdaPOSjt4v7eKxmHjBRwH29FbuHR3v7Q1RQ8mgbVpr3XR3RqtupG/BBPt?=
 =?us-ascii?Q?b6FPSP6vf+4LMiJOcfFlDe6BBorVjHzWCkGEfNxHqhCSZHukL1IzzGjkbfv0?=
 =?us-ascii?Q?oZwhy2Vm8sGA2bRqkovAi8nQX3QQem+JL29b4pg2VBLAYUlSYIHqnQOacfJS?=
 =?us-ascii?Q?JarP2xNm9FqH52IK1M9gRfs6Bz29B2xpbfq0FrUypbydgD04dz7+ADP6snHV?=
 =?us-ascii?Q?AEJoeGrrXmQlgIqqpu+F0qclEvPVZ2NQ4yuUvBg9t8D7m8a3irKVzmQsjSqR?=
 =?us-ascii?Q?kTJnrzCRgAdMbGywIVGVVWpyJbcbn6QO+9JvnhQzT0ieK7AJ7a9pFBqHycW5?=
 =?us-ascii?Q?Y7WRgtqkYjx+u6rJLNyksiA0HpbWrKtsSS5l4KXnLvwL38q4bKn+hE/RNHnZ?=
 =?us-ascii?Q?nBIX9bcLalrxEifrEHsmMlNeAk9TbwqcAPvLVJs/vAHUsmLHCX2MILq3vZni?=
 =?us-ascii?Q?1/toe730jegjVBd4gh89qZk2HyDpJgan?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ny7vwO6spthTg6Akx7BODP1rCEQ5Ajr+7CSVl/OZTrwyhTjOhkHnH7cj57ic?=
 =?us-ascii?Q?ohzHQJtS0O/jHanqyDDdqdLrz16H9b99os7ZfNnqsdIroOBRbChiU6VyWbiB?=
 =?us-ascii?Q?aJ6/itmGhHcrHmsPBo1JpDKblrsc8zfr43aRb7tSNzOphH75Dg9B1lquR22s?=
 =?us-ascii?Q?tn1GXeVynma/VNuO14S56VDrH56RzTn7Uf2HCP0T7mwclTj+sLPNR72kB0RL?=
 =?us-ascii?Q?Ol8kaAh+VREOZjeUUSnL2XHcnm4RacwGJN8mzg7CgHGAFRMeCLpw+CHQTvi8?=
 =?us-ascii?Q?4VRes2Jz1QCCYYSX7N4TJh0HdgHJaFP3hbXdtm1ic+xC/2rdamn75t7uDos0?=
 =?us-ascii?Q?lZZtBQ6WnrMumrgBhqDqQbJgyySjH3P2539Ku38ypOd/Q6hF+mRH0GSR1bt+?=
 =?us-ascii?Q?zLyK3BnTy1/6ui92Gpk9pWPLay473q1ZXs41KbIE85vJJRcd8lcUZdAWFWqo?=
 =?us-ascii?Q?wl06TaTaEQBS47UeLKla02xQVS5c3siPeEUHtGjC5BmdxR7SkhgL/G5nRVq1?=
 =?us-ascii?Q?UnRQMbS9nFxG+jAneQcCUMcBSunJXAAmeaCGB7aJQyiSTTdksI8Iyk36cMO3?=
 =?us-ascii?Q?vMpwRjwLFo+h6pu4HSEuqKGBXuMfA6Juv2tRoStbiYAnGOZsgs3ac+RWOlDP?=
 =?us-ascii?Q?hKfzMPJgTMT0M1Pr+hEugf8eF50YGLSeyQ/vXx/idut2BCBNMzqyDk8u5B89?=
 =?us-ascii?Q?RWzaDDHVXp/V1TOurGsPlG80MtU4f1R1jB7MnhKZVItIQ71l6kd+2GsxZQZu?=
 =?us-ascii?Q?9IBl+cQtYyMikEs1JkSOdCdO5PMqmJiBUnTJ55N9YZUjhQqFUv9ZGngWqNVK?=
 =?us-ascii?Q?eBsekjGj3YDzxUexW9X11nTTv9JuEdqfrUCSs5yQWX2WPlG4MyO4nopusK34?=
 =?us-ascii?Q?AkyRKVf08eiRfFmAkQ3Plv8Q7PpwRxtxP1HlSKXvdMHFSBgXCLCnPQdDhxWl?=
 =?us-ascii?Q?6osnXhYHpO5dBpV29QbxmjnPKc3OwP7rUv9FQZzdCyEjSnXIhObUE9cu1uvi?=
 =?us-ascii?Q?zKY4pWAsdNdFwSPA7uKBjGe7U3HdtWfrIUlcan8NknmAJrb/zdfxeaKTy7i9?=
 =?us-ascii?Q?/NWOC3qiWlRR3Iov6WVqE4VdA2Ss1t8DyRG5VMaA3utQESZeIqaBcEKdmgmC?=
 =?us-ascii?Q?t3VUWe+jStmlqmipVYOcldi+kQSYsIddGtm9NTyhYarode9BlXWBbQR5whdh?=
 =?us-ascii?Q?DdNyfgVev6xp+xbZK9CKUpKavdLUGHREmChQXuC484LMWuc8uP9c4y7AeOV6?=
 =?us-ascii?Q?b1YlGYrsjHumAHYzFb0DsbZmmxKPCCXcpYc43YBl/Hq3JaeL4t/9SnK8DWF4?=
 =?us-ascii?Q?Ssr8k36NyERkIqszayPEpyLwH7454h6Ddupsf0X71BBxRwx6ZE0Bcvs2dNAV?=
 =?us-ascii?Q?le5HuXGrEk6R0uTx6lLQ21a3xZSAQvVYb84PByuY7E+EhRnJt7oculhNhUkV?=
 =?us-ascii?Q?964zaM7YMidRr2g6KxC2WEywqNgKXtw77ONKowZWVdqPhsBxgRlhen4rV5bq?=
 =?us-ascii?Q?GDSPJvToYTWVoUtKXMvmkhQoxN/uS1XVZyZmQLXA6qKcj7oMc+LsEjliHgfp?=
 =?us-ascii?Q?WfETAazawofByaoYAB6AyFltwP9370W/Z9vRTub1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6ec132-7dab-4431-7b22-08dd5b66e923
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 21:52:51.2378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSSeNeqdgI8N2ndF8JRPMqLDTWMyLT3tj9YiZesU6PDuyw3W4CYEdAVOBHxs8mh0xqoc/NBzYW3RlNtp9f7Taw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
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

On Tue, Mar 04, 2025 9:09 AM Cavitt, Jonathan wrote
> Add additional information to each VM so they can report up to the last
> 50 seen pagefaults.  Only failed pagefaults are saved this way, as succes=
sful
> pagefaults should recover and not need to be reported to userspace.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 17 +++++++++++
>  drivers/gpu/drm/xe/xe_vm.c           | 45 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h           |  6 ++++
>  drivers/gpu/drm/xe/xe_vm_types.h     | 20 +++++++++++++
>  4 files changed, 88 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 07b52d3c1a60..84907fb4295e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -335,6 +335,22 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
> u32 *msg, u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>=20
> +static void save_pagefault_to_vm(struct xe_device *xe, struct
> +xe_pagefault *pf) {
> +	struct xe_vm *vm;
> +	struct xe_pagefault *store;
> +
> +	vm =3D asid_to_vm(xe, pf->asid);

For this vm, we need release it with xe_vm_put(vm);

Shuicheng

> +	if (IS_ERR(vm))
> +		return;
> +
> +	spin_lock(&vm->pfs.lock);
> +	store =3D kzalloc(sizeof(*pf), GFP_KERNEL);
> +	memcpy(store, pf, sizeof(*pf));

The kzalloc and memcpy could be combined with:
	store =3D kmemdup(pf, sizeof(*pf), GFP_KERNEL);
And we should check whether store is NULL or not. Or check pf is NULL or no=
t in xe_vm_add_pf_entry.

Shuicheng

> +	xe_vm_add_pf_entry(vm, store);
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>=20
>  static void pf_queue_work_func(struct work_struct *w) @@ -353,6 +369,7
> @@ static void pf_queue_work_func(struct work_struct *w)
>  		ret =3D handle_pagefault(gt, &pf);
>  		if (unlikely(ret)) {
>  			print_pagefault(xe, &pf);
> +			save_pagefault_to_vm(xe, &pf);
>  			pf.fault_unsuccessful =3D 1;

The pf is updated after the save_pagefault_to_vm. So the save should after =
the update.

Shuicheng

>  			drm_dbg(&xe->drm, "Fault response:
> Unsuccessful %d\n", ret);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c inde=
x
> 996000f2424e..6211b971bbbd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -746,6 +746,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -
> EAGAIN;  }
>=20
> +static void free_pf_entry(struct xe_vm *vm, struct xe_vm_pf_entry *e) {
> +	list_del(&e->list);
> +	kfree(e->pf);
> +	kfree(e);
> +	vm->pfs.len--;

Maybe we could do an assert/check to make sure vm->pfs.len > 0 ?

Shuicheng

> +}
> +
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf) {
> +	struct xe_vm_pf_entry *e =3D NULL;
> +
> +	e =3D kzalloc(sizeof(*e), GFP_KERNEL);
> +	xe_assert(vm->xe, e);
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_add_tail(&e->list, &vm->pfs.list);
> +	vm->pfs.len++;
> +	/**
> +	 * Limit the number of pfs in the pf list to prevent memory overuse.
> +	 */
> +	if (vm->pfs.len > MAX_PFS) {
> +		struct xe_vm_pf_entry *rem =3D
> +			list_first_entry(&vm->pfs.list, struct xe_vm_pf_entry,
> list);
> +
> +		free_pf_entry(vm, rem);
> +	}
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm) {
> +	struct xe_vm_pf_entry *e, *tmp;
> +
> +	spin_lock(&vm->pfs.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->pfs.list, list)
> +		free_pf_entry(vm, e);
> +	spin_unlock(&vm->pfs.lock);
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds=
)  {
>  	int i;
> @@ -1448,6 +1488,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>=20
> +	INIT_LIST_HEAD(&vm->pfs.list);
> +	spin_lock_init(&vm->pfs.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>=20
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func); @@ -
> 1672,6 +1715,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>=20
> +	xe_vm_remove_pf_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h inde=
x
> f66075f8a6fe..4d94ab5c8ea4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,8 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>=20
> +#define MAX_PFS 50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -244,6 +246,10 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma);
>=20
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>=20
> +void xe_vm_add_pf_entry(struct xe_vm *vm, struct xe_pagefault *pf);
> +
> +void xe_vm_remove_pf_entries(struct xe_vm *vm);
> +
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t
> *end);
>=20
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma); diff --gi=
t
> a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..10b0952db56c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_range_fence.h"
>=20
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_sync_entry;
>  struct xe_user_fence;
>  struct xe_vm;
> @@ -135,6 +136,13 @@ struct xe_userptr_vma {
>=20
>  struct xe_device;
>=20
> +struct xe_vm_pf_entry {
> +	/** @pf: observed pagefault */
> +	struct xe_pagefault *pf;
> +	/** @list: link into @xe_vm.pfs.list */
> +	struct list_head list;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -274,6 +282,18 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>=20
> +	/**
> +	 * @pfs: List of all pagefaults associated with this VM
> +	 */
> +	struct {
> +		/** @lock: lock protecting @bans.list */
> +		spinlock_t lock;
> +		/** @list: list of xe_exec_queue_ban_entry entries */
> +		struct list_head list;
> +		/** @len: length of @bans.list */
> +		unsigned int len;

The "@bans.list" in the comments need be updated?=20

Shuicheng

> +	} pfs;
> +
>  	/**
>  	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
>  	 * protected by the vm resv.
> --
> 2.43.0

