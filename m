Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22331A85EE4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8410EBC0;
	Fri, 11 Apr 2025 13:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGpr5nIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4710EBC0;
 Fri, 11 Apr 2025 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744378099; x=1775914099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V10P5q8gf7gv9o+gZ5Veuu4g8NqHmdoZaLwYY4YO1Bs=;
 b=PGpr5nIaZxghq60Au0syrjNMhbt/NEf2jUgBsuHkZ6m5VnL8sygh4qN/
 6oJyxU19hSJ8o6JBZYeh/Rikvb5esRaS3S1pEw9kSArKv1tyGOAPAnjdI
 Ir2WJWy4lYem8mWrmXNIhaV54zz4S+dnZ8lPaanC/TtMlQ4G8+cp5fB04
 ONtU/EAu4tgMr3Br0xdlpQILAsYPLsJL0sJ7OhPviucjp5f9Po8F22w8g
 s9Wstir6CJjqgVzxJJTIu0liWGnm/foAcaSDgykATdRtAXzWmQeue1sNr
 NH5G1V90tubFXwIkiw8Vr1io0nBwdDEzbK9/mr3BmOW1nqkSYECvyUIi8 A==;
X-CSE-ConnectionGUID: LxJt2WB/RU2O9TVIW7OoVg==
X-CSE-MsgGUID: Cp18HOEqTMK3y86x0/tWxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="33541724"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="33541724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 06:28:19 -0700
X-CSE-ConnectionGUID: cNywz0dmSm2FfJ5vROG/qA==
X-CSE-MsgGUID: 5OkkouGhTfKhNPN4/OFn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="130032775"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 06:28:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 06:28:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 06:28:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 06:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br0fAwv3F2vCjlE371ZotIBhG8DbujJZoL2meQ/Xz6Xqzu4ItDOOjNkNx7auaYGtPG+P7tUxgpN0/gUZlVrkgzcSEFcWXwKjTxX+Usqa4N3co2vTKAat4XOHbkNSqfgpiagLvU1TvhNJcuo7KBOaE1bAY4tOtEdbC4YGOGz7t8UBzmUheR1uraqlsIP+Ob178nqbN8VlJnHIBEUIwpVqjyG1Gv9ENjqTh0TZ1NLhpZcSIIToxqgKF//bikoNTzQ1or7yFu581FN0IyFcrT6oDuj+6j2r2sq5IQ+nzEQIEm6Kiv/1p8ZHCHoOropEpreqlbGmjvmKyjnXehlHNaGHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlp7AddAD0odV2f14MX20l+CvynZaDgN14heTGKcxAQ=;
 b=EWZC5dtYUazBL265ndwQv5xgaxB6WrroqwpKMc33H8mNxN5TVFAYsVK9homiUlxL94M63HoW7It5s9f+o+k0zPMcwZAtOkULaNpvshrxPq6+VHAhjECC+vQbRKyq8wNoWXao3br4ho5qhqcNDpws3OrPEaeftub7c8gGCTemuBq2mf8/+uyhEu71paJ+wqJLtwYdtaakGqF7CWYYC1xtwvGyRbCUuahzYxpmUmI9aUKZKj4HR8GtazPf5FADbYfUSu2UwVWExgHZrC6dhVA7V5OX0tkhl8tyOJJXmY6UWQhT62Rop5wjlbN1HrR+8QBk+H1szoAGsmJ+ly88aGECRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA3PR11MB9063.namprd11.prod.outlook.com (2603:10b6:208:57d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 13:28:01 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 13:28:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 0/2] Register bit definition for EDP_GENERAL_CAP2
Thread-Topic: [PATCH 0/2] Register bit definition for EDP_GENERAL_CAP2
Thread-Index: AQHbqENP7XPxB0u7L0uaBQd+MAdIyLOeem3Q
Date: Fri, 11 Apr 2025 13:28:01 +0000
Message-ID: <SN7PR11MB675095838AB3BA86BDCF8D49E3B62@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
In-Reply-To: <20250408050138.2382452-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA3PR11MB9063:EE_
x-ms-office365-filtering-correlation-id: 48c7516b-3b53-43b8-05af-08dd78fcaebb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Q+dH0XLGZeixpHo1Vqi7rTwvxERtFptc0+WJpyvUGtAJN6OR1xz5AkgOcG6x?=
 =?us-ascii?Q?l6r1gpHzVwbiqlrrXfG/oyRzpKKPTp5RI7JftI1zTHrd/s222Mvd9vGIlkBt?=
 =?us-ascii?Q?CLh8vtcrAP7yaUkMGI8JFM6CRv7yYakwHF5YvCjPik5nuCowunF3dPSq/JGR?=
 =?us-ascii?Q?5kRsnycGmGOR4PiBdJI9Otxw8e7LPbWCEC6tcPebJJlNevbMsRS+E9jO15DA?=
 =?us-ascii?Q?Pba7Q9owfBUviqhNIiuUD1L0rZIsDCSP4Ax/rH5rYUytQgIDZyy5ldLvUeqa?=
 =?us-ascii?Q?vsFZjqHn42Yi7P4ZmPEc6t2bnOKlJRAGC8ljndn4yL4hvCqPzkuBVMZj0MtT?=
 =?us-ascii?Q?o4ogRYtqOoa0hkFWcs+VBS+O0S94K9mEK+YO85zzBXwXg1jb9Ht1NPCl+Ef1?=
 =?us-ascii?Q?BzYKmiBpRHLhO8/TqTg0nYQCrD8qVJKkQ6+RE/wb4G304jnpsSEsc0sYQkd+?=
 =?us-ascii?Q?4NE1gWUxLUytT44CfOIV5mrVEG6+Z1Cc5qwB3sr3cUEVwe53vGAxv3vBUvsw?=
 =?us-ascii?Q?1AyBZ80icpAt1De25kvQnvYW9okLVYzSC16hHeH7UneT4tDME9VMGeq56l9U?=
 =?us-ascii?Q?oXPUB708pbwv2clpALjI2JZJmdqGrTNgi/phAC0cIBniY2Xr8LPLSQat9lTK?=
 =?us-ascii?Q?+nAEnKQ8o56E64AZrgNd7OBEQoabDZD8boe7lPVbvnnVkaarmEBzKW85RAj9?=
 =?us-ascii?Q?ImTw6cBP4jksmfuNf6dFIeAk/1J6rUpNjUODLf+GVS0XAOsKoZE349kSF5cf?=
 =?us-ascii?Q?FGRNxc/7JHL/4OCocsupoNQqu7Kt95XIcAT/iDN5JTxFvkfRncJ2BSfSujh3?=
 =?us-ascii?Q?STiWQI/2+/hkEzw44Yz7tck6Y94Pgw+S//BLEfnSgrMD4czNy6/PqwJg1548?=
 =?us-ascii?Q?uVpze3lhJzDvMkyIkLhoql3ZXyrhk1P93Z33/picsyPvBN5CNxcfk4uudTQv?=
 =?us-ascii?Q?xa2ZTF7mzSiVE7P19CC67wXEfunM2oDfOBPbLDZnAdBhw0quge4opOdQZuP9?=
 =?us-ascii?Q?jftkGjcmeVD/PeJxsVZIk74K2wvQuN9+00GYsPSBDEdrOmb+SYsE9OCR4bWu?=
 =?us-ascii?Q?lbYYqgnDNlDfvvwurg8V+040WdQ5NisxziOn5UYjbAKXLVkhfTuQk2KyXuOJ?=
 =?us-ascii?Q?Q8t2ro+7/mgOm+uIlbrGQdbz6fzS6B4KRreKf9qJ+0TTyC8a3xjHWtm9Q18X?=
 =?us-ascii?Q?VCKfavsa6mo/4pYDCVDAr1uR7+yPtXlpbkzDXIuftBxuD4HxA1rir+d+5XpG?=
 =?us-ascii?Q?WwwyUFsrAVzleR3qqbCkRJF9QMAYhZaKAMoxDHTMW63SMqiXmYh4FnTHijVf?=
 =?us-ascii?Q?Svk5KpUMarmtsUKPF1vdn7rv+CqX0BQwTly7gvYCCtula75y2BTqIUhu4opE?=
 =?us-ascii?Q?+Eu1AViOysyy1OHjbHrVj9OvdSpG9PR/EueDgjcui2Tsg4d7ipjk4ACST6jU?=
 =?us-ascii?Q?KkcN+YddEFeZhYNLO0nxNge744nRe3TK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?et6V1cWLT/HCUv6WwTUIEpJ4LYcT1Zzj47rV+luP5pkASv7sEHTRE6Q7NzrM?=
 =?us-ascii?Q?JegK8c0IcYxz8tOCWhSy7y23+Mte+WPF6iDaE4Su5m3TbICDNSnjH6IOz26e?=
 =?us-ascii?Q?5l+1yQh6e9ODs+3VAHnHLileFd/K3fUCLjfwEJ+Igw0cbsWzgSLCK5sdFOfa?=
 =?us-ascii?Q?HaUdRA4vec0AIK6hB6OnRqpoGZAGUJ+9VEMtQSpUHnl/aiKdCusJfNbCq083?=
 =?us-ascii?Q?ifQ3NxIweuCgCgao+nQKOd6aIdGDRyIrLag2jSIpUvWDB4cR1snUVkLvQswA?=
 =?us-ascii?Q?VgHSoEp1dmv8TlEt0ITM4xV/4PQv4KLkIm6GyJaJb9n9vCkR2KnCGfq41a+D?=
 =?us-ascii?Q?dYl6C3UxBb5B+TMXsV1nngW0AGdHvwPdDaNgOyw6II7QuQRBr4weRZpVBXfS?=
 =?us-ascii?Q?ywEKCV+2pgtLotKluR/JJcM2a4AY4+rsFJCuHIOGpUNlWPBrYRJcz9tt/L8r?=
 =?us-ascii?Q?rc/mK+EYVXG5BTsFrqME23zilZM7T7RnYMa7qFno0zqyb/CWjq2j5OEGAiAh?=
 =?us-ascii?Q?xLUCuzp90ZwOqwh/citmlFxvftsSH7mJVLnwWlOAry3eF8YklnEMw7JPXqL2?=
 =?us-ascii?Q?zd4fG/uubOv0dU70pUDqoZoDLKwAqkQeXpN9DZFjD2ZixoKntFgniqp1ddMy?=
 =?us-ascii?Q?8Gmrqgw58088o1P4cUa2Sr5sCBCXZ9XmfYBQaR3Zg8iz27o7FeOX7GZLA0/n?=
 =?us-ascii?Q?Ue/hLJz3yN+UU3vcg+8SjLZtryL3F+Ysj94wfnE95+eSZhXb8Z8jYcDE79e2?=
 =?us-ascii?Q?23ia7OmmckYpsBmfPr6Q4LAVFv8C2/P7J2g1yFFGSI+3xw8Zd/QDj6Xzfq1A?=
 =?us-ascii?Q?RKS7KWHMuIGDxVYTjp7Vfhy4kPy8NyUMjqh8KGEpLWcPBOvLTd9Qd/B74Q1a?=
 =?us-ascii?Q?8bY9/GQqslX8eB87LmPGfaKU1+cZA1w66XCZnQEg3Z8G6X79VkBii1ryvVwv?=
 =?us-ascii?Q?YtxeTUU3QirVl2+4XRONVfst8o6QbNSSHonak7aFi/leGCOAXGJedyogYtrD?=
 =?us-ascii?Q?bxDoYXd+Mvn6eeTma5posVaaWJXuAH/zvd996Fq9x3Aqf1GMWkG+UyxvDHSh?=
 =?us-ascii?Q?umRXru0hf8kcBmTsiaKCetiZEvwwWmvHrWa4U0Y4Vdb4eLyw0TzWYyqwuVt+?=
 =?us-ascii?Q?CorJhooEA360W0yhq4Uk7fDCiiki50WElAcKukBT1ePOdilKhmKiSzNnVv80?=
 =?us-ascii?Q?eyP2iAVBc171FkBC7CcZDCU9gg5NpwYMqX34RNARE85owvGzILMq7/SOYgEE?=
 =?us-ascii?Q?ArwFeROXp+UfkY1VQ1+1AQdkGepr18o9Jfr53LC2bjzu0ALcgD2H+2qb0H6e?=
 =?us-ascii?Q?UiCsVIKe8XXwI85uEXauHSsQqFTdd686laGIDn1YZkzvU0rE+Cs7R1VNOZyc?=
 =?us-ascii?Q?8+CUWRrElOOEjcrWDcU5dXMWxinddtvj7hjMOQ3DZhu5jIY0V0XHuh0Cf41j?=
 =?us-ascii?Q?9E10e10xz6jxq59gCwjw9iY7DDXWtT8NCSOKrg/P5kcUDKsJZjzS24RTgxkX?=
 =?us-ascii?Q?3cvEmFJSNQ0TFQebrwhUcgwVbLLTlMrTnYG1bVbk4trSQWeHt8yGF8WL8gEi?=
 =?us-ascii?Q?nVVuytXUQQDnE7FUbNwUWcW/s9hnZipiZocjWxGl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c7516b-3b53-43b8-05af-08dd78fcaebb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 13:28:01.4423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1kGcdvkJ2ffgez0dP7XLlN+Z+cO/KBIpPJUsBv2Q27fM3V3qzCFJJbtCOxbjJCkuz+QrfNdLIc4PM+S5JSUhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9063
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, April 8, 2025 10:32 AM
> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 0/2] Register bit definition for EDP_GENERAL_CAP2
>=20
> Add smooth brightness register bit definition for register
> EDP_GENERAL_CAPABILITY 2
>=20

Thanks for the reviews
Pushed to drm-misc-next

Regards,
Suraj Kandpal

> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>=20
> Suraj Kandpal (2):
>   drm/dp: Add smooth brightness register bit definition
>   drm/i915/backlight: Modify condition to use panel luminance
>=20
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>  include/drm/display/drm_dp.h                          | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> --
> 2.34.1

