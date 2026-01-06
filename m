Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D4CF6A1E
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 04:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D75110E467;
	Tue,  6 Jan 2026 03:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dU/jhZNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BAE10E466;
 Tue,  6 Jan 2026 03:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767671725; x=1799207725;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K6zmfzXjkjTIVenkiHtqKKYEZN4e91cYN51i96SfAUk=;
 b=dU/jhZNhogUncwRiZVLWIHM05InNeIuEwS+HzkDh9fnuBWgXn/zVNIJ+
 eMBw+XfYdztUcJ/D4H4/EuGWOvS/9q5y5nwUn1azGlJjoABR4pduhA85t
 ZfnLC0g/LvYl3sUF7nOdOSKD+9KejGqbPNAD2cDMS9CLgGgexTw1t0Jun
 dUfUQNsNOQw0hUAVOPAaYh7f08NptVIpAu1VgDmFc4BuSFAZIi2tUshqm
 PmuQacW39Z+qJgVhvbwe4p2A+J6Th/dYQ+7OXgodgcg4EVnjzqZtFgy40
 vLHNN9Tsz2WX2T7pm1zPjNF8cN6makuqpjrBX8T9y1T1XJBoCMtlwiqHX A==;
X-CSE-ConnectionGUID: 2OzwwRFCSTWOPogYdVamaw==
X-CSE-MsgGUID: E1Tv5dpYRNKh2DXMu9YSKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68972825"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="68972825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 19:55:23 -0800
X-CSE-ConnectionGUID: FnBweWivRnuRGzJb3jR5vg==
X-CSE-MsgGUID: iDWTNByjQ1qm7W1Hh+y4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206694958"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 19:55:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:55:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 19:55:21 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qj2tNtidjtgF6T9JjIgdbXJr5vYKasBgZM0J69AHv50RmtJ1OSJqpPpQfpcau+eCPX0+fSgxmKeFid08Odk7EuOittSvK5MLo3opgHzUQ1ChcFWPIZspdK9r/V2mkplm/G2yqo3GVFm906XC7EO+6BJRCStTm9qe8RPzv0VpRZ1656YNkc3+UiFO5a7Nz/W81Nx8SNvyObN0xAEqV9MVQxU0cYKN+z0UXVQQuLBTnXklouR5ADWuFgJF2CNvlft7QObxC4JQEsgQtuVXlWmIZIhxAfrj1w1xrgdVMIkm2tcjtTDO5yAaeiQ9C/Cp5fwFTDlyuVyRmusCaS4Ya/umuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6zmfzXjkjTIVenkiHtqKKYEZN4e91cYN51i96SfAUk=;
 b=TGuPKdixqlvTNN94npC0VI3cBGNJpKOVsdWOVcj2gSnkUqQXXIe7H0hGwGSBQmxUzsMMqBJKyZpa3EssTc3uO3mY/LH7H3JuZUkGGnIiN5b8NVAJOe6ozTCDn4rlXXQIUBuhSUqQ0x1UQv4zJ/GDYyvtPVL8DADyLkhTMx/ZgvmBtwdExSc94wPybrhkkjhOpPsvnho97T/l7mYNb6tU0Nayp8BphtwPArjsuFQxONKE/uUpnWobLn/kzyeB5Cf4AE/8DBbYFRYsZThCtMXOmTUjb4i6e2eNhZkreJhzSjWou/+VYYsRB3jvMIOPaRHqP/gPeTAZQG3ahKHsU5of7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CYYPR11MB8332.namprd11.prod.outlook.com
 (2603:10b6:930:be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 03:55:19 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 03:55:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 13/13] drm/i915/color: Add failure handling in plane color
 pipeline init
Thread-Topic: [PATCH 13/13] drm/i915/color: Add failure handling in plane
 color pipeline init
Thread-Index: AQHccLcOt8jkGhQ5ZEOvLDvKmUMKSbVEmcOg
Date: Tue, 6 Jan 2026 03:55:19 +0000
Message-ID: <DM3PPF208195D8D8D76FABC0564F8D66DB0E387A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-14-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-14-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CYYPR11MB8332:EE_
x-ms-office365-filtering-correlation-id: 8238d68d-9d2a-479d-d2a0-08de4cd768dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WS93L0gveTEzL3kzSkRjNlhacm1sb3ZTOG8rM1RhWWVldG5BaFlBZSs4WEFC?=
 =?utf-8?B?ei9RUXZpdEhVRm0rNUV1QzJqeHJjd2ZPWjNOMEFENkpsUTlZUTZrQ3FEVmNS?=
 =?utf-8?B?ZmtxVHNOdHN1M2tyRC9qdjJvN2QyUW14ZVp1RmwwMWpoWWRoOGlTZjBZZ21D?=
 =?utf-8?B?VGgyTmVwaURsd3FEem1ObzY2OVBzTy9NelhFMGYzOEwvOXh0R0JlSFI2M296?=
 =?utf-8?B?V0Q3Ym0xaUdSSWViNWtuUlBzSi9TK1NXSG9uemYyL0pCVlRLZkhRTEw5am5t?=
 =?utf-8?B?UHYyUWdzRWhOd1FxeEdWdmZQRnYzYktVZnpzU3VvMEJjUVA1bHVOeXV4dUJK?=
 =?utf-8?B?aUFjdmhLT1ljYmlnay8vZWdmVjdBSTN5dVVJS3AybFkvcDdQclFUL2EweVVJ?=
 =?utf-8?B?V3VEV2U2N3IydjY5cHJROW1UNW9yWjU2R2pJcWh2L0FDcGdCNUFLSno4Z0pp?=
 =?utf-8?B?TGh0eDNYaGRVSUk4bVBhMHprQys1eVhqbG1TL21NYk85RzVQYWgxUHl0SnVq?=
 =?utf-8?B?cExoUHF3MU5IVmxBV1FnT3ZoclQxZmUrNG45dTVkcVZkaC80WFNyR21KcjVC?=
 =?utf-8?B?WXlobkwxTS82NlJ0bXhSRTVSZG95SHovV0o5MEhqS3RLNE1QZXZXN2s3czc1?=
 =?utf-8?B?UStCRFEvQVdvOU1xcEdQUndoeURvVDZjUFRsbUpwOWVUb2lGMEQwRjUxeUkr?=
 =?utf-8?B?Ky9RVlQvN0FIMGtSa05LMzVpVG4wUFA4YjVpOXFEVTNYSDNSODh1R3NsWVlS?=
 =?utf-8?B?NHIxczd3eGVZckgydFpYb2g1VzRiWFkwQ2lMb1AxVkRWeTU4c0tGVjVucngz?=
 =?utf-8?B?bFJvT2lEV3RnTjIwZXk2RGVjZ2UvbHVseDFDWmtwU1F0VWorK1NvSlFBS0hz?=
 =?utf-8?B?RDNZQTdmVFFKMjhJSXhWdWtjRTlZdmMwRGJHK0RsVTdRTDRXNFBVSnVERVY0?=
 =?utf-8?B?K2dHR29CN0RWcEgrbStMMDlScDFMMWplNVdJUHVOb0NXUUxmeG4xTUxWbFMy?=
 =?utf-8?B?YVUvVlBvTXR1NEVRdDc0b1RvQ1gwcDZSMWd3ZnkyRHFCZkRNRlpYRTRlSzJq?=
 =?utf-8?B?QWlwTXUzMHFLbHR5VS9BSFl1UDZtV3l1VFRBTEtvOHN2dGdITmZGempFdEdD?=
 =?utf-8?B?OExyUU8zN1dnbUJCcjNlQm1hakhJUUpoL1dXSFRhazJ6eitSb0hVTzV3Q2JM?=
 =?utf-8?B?WHlKcXNrS1ZTZHRkTURld2l3TTZRc1RhNlRBbXdkeUFzRjgyejRnZ3k0S2Zx?=
 =?utf-8?B?MWxzdTF2NUw2RWpxYVRoK0U5Ykcwc1VoMGpjVlJUNFQvTjBqNmRacUV1bDR2?=
 =?utf-8?B?a2hCR0VzaExqYk1oVkI4NllnbVIvaE50QkZyY05PM3ZIWkFNZjlpc1IxcFdz?=
 =?utf-8?B?NzdNN0FlRjNtZ1R0UHE0cGRpaEFXYzdJaDdMZ3BpRmtmL2RvQXpvbkJUUEZ0?=
 =?utf-8?B?aFR5YWxuS1drRjdWZ29MTDVCMnVOQW12cnRhUnlxbGFnem81anMvRHBmb3po?=
 =?utf-8?B?ZXBKM1BycEQzOWRUaVllY3R1cjhyOXBMSERKcWFnaDArM3BuT0szU2kydnVH?=
 =?utf-8?B?bi8rUDJ1eG1uL044cUxiTWEzUGFBZHRLNWx1T1NaV09zcUF6S3VjNTJJNVBF?=
 =?utf-8?B?bUx1dVBvVFR1YUEyRmZYWEIrSm41UnNjZWs5ZTRMZ2xKWXJZQ3dUZUFqOGdj?=
 =?utf-8?B?YzBCTllSa3FYd2VRSnZaTFRaWGd5VTl4Yk5oOTJPd0lFNzFJckFGY0tzc3dt?=
 =?utf-8?B?R0VGd0Nva1JZK2IvSUNKeXdlTVBVcDNTQ1dIeFhEWW02THdzVWVhU2VaNUQ5?=
 =?utf-8?B?aWhCUU1WUklNRnpMdlNObUxXMzdNZklDREVCRHlRVHdEUmw1cDg2cHVEcEtV?=
 =?utf-8?B?NkFlWkZWTlZoNGp6WW5HR1hsN2krcmY3VDBQN3ptbnpCZ3NNQWhwcUcvUEtq?=
 =?utf-8?B?YlBTTTViQUNNRFhEZVRMaENmSkE5UkR0MzlqNkoxZFdZUXczN2pHa0RMN3Vv?=
 =?utf-8?B?ZHYvajI1NndSUkxtNnBjQVVqN3NTNC82SzNSamZSTEhoMkJ1QWExV3hYS3Ux?=
 =?utf-8?Q?bPXqhY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTI3TFlkT01kM3hFczd5TmRvTVcvKzZBWWR6NVlPRWY1VFlCR0M2dEUxRVQ5?=
 =?utf-8?B?WC8zMVFjWFY0T1BERzJxZ2czUm1ua0pEYzlWYVVxSytOc3J2cFVVR3RmM0F5?=
 =?utf-8?B?aDBUWnZBUHRraVdTellpZzlEUitIcTFYVjhFUEx1YXBNdHdyT1lNbU03QVkw?=
 =?utf-8?B?NFJlaDRUL25lVGpyK2dldE9FbGtIakdYdmlkRllSYmhhZ0ZzTEFBWTlkRjRW?=
 =?utf-8?B?Mit0TEp3UmFqMG0zSlIxb3E5aDdMUFNZek43R3hSaHJzQ1RTdXhVM3FZRi9B?=
 =?utf-8?B?K1hFSFlOWCt6bUU4MkpUZyt1ZW45dTlLbDNzSHNJRmdVTFBKMlBsbVBqOHNC?=
 =?utf-8?B?WVhoRjhMRk9nS2V0S1gyTElsOHJEYzVIemk1UFc1VTIvUFJXWCtQSnBPR3Zl?=
 =?utf-8?B?MUUybkJmaStXNCtzMlRxejJHY1NaMGVlalFxSE5sSUNTamlRWGhLVzlUU3dT?=
 =?utf-8?B?aWhuNG15ZWhBSXF6c214bzBGOEhJSDNkdUloSDlLM1lqbmlUOExTakd3Qm5U?=
 =?utf-8?B?UWU2aG9jajhFNm5oVUVHZHdMaWwwbEVXWWdBSFZNQjNYcVhjbG05ZHdhMDVC?=
 =?utf-8?B?RERlc25jQk9OakJZM2NIeHNxaGo2Nms4ZUdDMXpOb2NJWmhLNEZoRGIraHli?=
 =?utf-8?B?Um9sUzdITHNaelRHUW9VUXc4OWlSSnA4VGFkc1M5NkJFY1VzYllwcFYySzl4?=
 =?utf-8?B?cGRGMXJhZ25lYWo4K0toci84TFFRcnVZUTJ0bVNvRU8wTUdmUmVCUFIyc1l3?=
 =?utf-8?B?MCtqN1dtekVYOWl5UTFxUEg2ZVQ2R0xOS2ZSb2luT3pBR1Ywc29ZckkzaStR?=
 =?utf-8?B?ZmoxK0hVYTY3VWVFTVpDZjYzSm9lRU5IejFNZWtLKzRJYUQvV2IrV0tLcUJV?=
 =?utf-8?B?UGZtd1JYdjFINHJSRkRHOVNyYXE0dEFLdU00ZC9TZG1hRUNTVHBTenZnTHhR?=
 =?utf-8?B?OWVjTkJ3V2p1UEF5N1c4c01sK1UyamJHWU16RkY1MXB4VlROQldsTTdSMUlZ?=
 =?utf-8?B?eG50aXlCdnpBSFJSRnhlN2ZiYWVPSUZJc3p2K2gwSEpZelhRcFhISktwaTBo?=
 =?utf-8?B?Y25pSndIS3ZYL0JGTDBhSTRCTi9QRXZPV0JHVGNIdDBMUHRscFdEVGNtUWV3?=
 =?utf-8?B?WkFyUXNEdEJIL3BaRFZsYzBIcDlUQXMzdHNBcGFnN0VpZk1QMzRQSktZYWdw?=
 =?utf-8?B?Zlo4VlVQMWtuQlh2ODhGZVBpWmxKbmhnS2JQQzgwSlJYQ0Z3YnZrVS9HTkRr?=
 =?utf-8?B?RmZOMnQ2dE0xUW1wOTMrbGZtc3pRR0pUM2swSEJyWjl3VTRhWjFrc3FweS9D?=
 =?utf-8?B?b2h5RWdFQ0I1cWdFbnEyRytwV094bkhheU5Ob3kxYnJiN0xPOUZSUDYvTkNo?=
 =?utf-8?B?SG1GQUZIVG1VSjhDbVBzajhjdFc3UStKdERzY3RJcUF2K1pTWVRaVEgvSk1P?=
 =?utf-8?B?ZUlEME9GcTJjQW9DNmVndFVmYVVHQ0lXbXdLMGw5ZnFTdWRnYlZrdHZNUXRh?=
 =?utf-8?B?SDh2Z2xjNmNmNWlidjdJVHJ0US9YK0l2cWxMU3Y3MXV2MGR0SmpxdUdYNXFa?=
 =?utf-8?B?aEVDdmNjU1Mra2lWTXVxd0VIK3A1WkUxZlA1bE9yZ3VkVXBYTkZqOHZNWU5S?=
 =?utf-8?B?eWRMTW9NNldKdGtuNHRDSzNjM1NOd1pPWHVpY1JyS29zNGZGOFRCTXlFSU5J?=
 =?utf-8?B?OGpOTFkyM1JRbHJzT1hxQ2N3bVhiOG5vMHorTk44a1lJVERSQlFLVXRBQXBJ?=
 =?utf-8?B?N29SZFZSdTYzTlVFY1RkMzNsVmJIUjdRdDRXanJtS2NNT3FFWXZLeFRqbGR1?=
 =?utf-8?B?bW5YNWQwZnVycHFyZ3RDc0R3ekoyeDBiem5qYktVU0RYcjB5bm5aVmttN1lM?=
 =?utf-8?B?ZzBGcjlITHFNYWlqLzc3djBLNkZ1NjdGWnFINytVK0ZMdXo3NUovNmlPQWRu?=
 =?utf-8?B?eDBPR0YrS3pMZGRYWWNwY040UVV4TnFwNWphQ1l6Tm1PYzZ0SmZCa3gyczV6?=
 =?utf-8?B?ODNORWlNS1orcVF5QVdxcUlLcFBnc2ZZMmNCaTdoanRBdDIydlpKaGIxYjBJ?=
 =?utf-8?B?Sm5RenVkUWFPU3RORXpKNkhrM0svOTRxZ3hRUzEwTGsvamxFeG5qcy9ZMThD?=
 =?utf-8?B?TGd3U2dvNFpVQnBpekl4aC9ob3Vkajk2VEs4M1NLc1k3RE5tRWs2ZHJLeW1r?=
 =?utf-8?B?cGVOZEFraWJ0aVFLb2ZzNUVhNytaSXNPTUhncjU3aUpLVnRtNlo2L3FSNDNz?=
 =?utf-8?B?ZnhaQ2tyWjdROTZZKzVuMjZxTnpKWTRPNms2TXBNSGhwSk1GV25Kd2xMQWJT?=
 =?utf-8?B?TVJ3K1l1S3hKMnZVdTNzZUhxVjV2dTdEazRnTS9Zci8xaFZmTjBBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8238d68d-9d2a-479d-d2a0-08de4cd768dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 03:55:19.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sq51loha5F/HUFcKNcmKB2T5MoM1wWhXeR8vZenMOs3//+yRBQjXnXzBSrOIU3h3bx6Iq5fo9fYxdlND1KBAWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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

PiBTdWJqZWN0OiBbUEFUQ0ggMTMvMTNdIGRybS9pOTE1L2NvbG9yOiBBZGQgZmFpbHVyZSBoYW5k
bGluZyBpbiBwbGFuZSBjb2xvcg0KPiBwaXBlbGluZSBpbml0DQo+IA0KPiBUaGUgcGxhbmUgY29s
b3IgcGlwZWxpbmUgaW5pdGlhbGl6YXRpb24gYnVpbHQgdXAgbXVsdGlwbGUgY29sb3JvcCBibG9j
a3MgaW5saW5lLA0KPiBidXQgZGlkIG5vdCByZWxpYWJseSBjbGVhbiB1cCBwYXJ0aWFsbHkgY29u
c3RydWN0ZWQgcGlwZWxpbmVzIHdoZW4gYW4NCj4gaW50ZXJtZWRpYXRlIHN0ZXAgZmFpbGVkLiBU
aGlzIGNvdWxkIGxlYWQgdG8gbGVha2VkIGNvbG9yb3Agb2JqZWN0cyBhbmQgZnJhZ2lsZQ0KPiBl
cnJvciBoYW5kbGluZyBhcyB0aGUgcGlwZWxpbmUgZ3Jvd3MuDQo+IA0KPiBSZWZhY3RvciB0aGUg
cGlwZWxpbmUgY29uc3RydWN0aW9uIHRvIHVzZSBhIGNvbW1vbiBoZWxwZXIgZm9yIGFkZGluZyBj
b2xvcm9wDQo+IGJsb2Nrcy4gVGhpcyBjZW50cmFsaXplcyBhbGxvY2F0aW9uLCBpbml0aWFsaXph
dGlvbiwgYW5kIHRlYXJkb3duIGxvZ2ljLCBhbGxvd2luZw0KPiB0aGUgY2FsbGVyIHRvIHJlbGlh
Ymx5IHVud2luZCBhbGwgcHJldmlvdXNseSBjcmVhdGVkIGNvbG9yb3BzIG9uIGZhaWx1cmUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFpdGFueWEgS3VtYXIgQm9yYWggPGNoYWl0YW55YS5rdW1h
ci5ib3JhaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y29sb3JfcGlwZWxpbmUuYyAgIHwgMTQyICsrKysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmMN
Cj4gaW5kZXggOGZlY2M1MzU0MGJhLi4wMzVlYzNmMDIyY2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY29sb3JfcGlwZWxpbmUuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2NvbG9yX3BpcGVsaW5lLmMNCj4gQEAg
LTIsNiArMiw4IEBADQo+ICAvKg0KPiAgICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9y
YXRpb24NCj4gICAqLw0KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gKw0KPiAgI2lu
Y2x1ZGUgImludGVsX2NvbG9yLmgiDQo+ICAjaW5jbHVkZSAiaW50ZWxfY29sb3JvcC5oIg0KPiAg
I2luY2x1ZGUgImludGVsX2NvbG9yX3BpcGVsaW5lLmgiDQo+IEBAIC0xMCw2ICsxMiw3IEBADQo+
ICAjaW5jbHVkZSAic2tsX3VuaXZlcnNhbF9wbGFuZS5oIg0KPiANCj4gICNkZWZpbmUgTUFYX0NP
TE9SX1BJUEVMSU5FUyAxDQo+ICsjZGVmaW5lIE1BWF9DT0xPUk9QIDQNCj4gICNkZWZpbmUgUExB
TkVfREVHQU1NQV9TSVpFIDEyOA0KPiAgI2RlZmluZSBQTEFORV9HQU1NQV9TSVpFIDMyDQo+IA0K
PiBAQCAtMTgsNjkgKzIxLDEyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb2xvcm9wX2Z1
bmNzDQo+IGludGVsX2NvbG9yb3BfZnVuY3MgPSB7ICB9Ow0KPiANCj4gIHN0YXRpYw0KPiAtaW50
IF9pbnRlbF9jb2xvcl9waXBlbGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LCBzdHJ1Y3QNCj4gZHJtX3Byb3BfZW51bV9saXN0ICpsaXN0LA0KPiAtCQkJCSAgICAgZW51bSBw
aXBlIHBpcGUpDQo+ICtzdHJ1Y3QgaW50ZWxfY29sb3JvcCAqaW50ZWxfY29sb3JfcGlwZWxpbmVf
cGxhbmVfYWRkX2NvbG9yb3Aoc3RydWN0DQo+IGRybV9wbGFuZSAqcGxhbmUsDQo+ICsJCQkJCQkJ
ICAgICBzdHJ1Y3QNCj4gaW50ZWxfY29sb3JvcCAqcHJldiwNCj4gKwkJCQkJCQkgICAgIGVudW0N
Cj4gaW50ZWxfY29sb3JfYmxvY2sgaWQpDQo+ICB7DQoNClNlZW1zIGxpa2UgeW91IGp1c3QgYWRk
ZWQgYSBuZXcgZnVuY3Rpb24gYW5kIHRoZW4gY2hhbmdlZCB0aGUgZnVuY3Rpb24gDQpfaW50ZWxf
Y29sb3JfcGlwZWxpbmVfcGxhbmVfaW5pdCBidXQgZ2l0IGZvcm1hdC1wYXRjaCBtZXNzZWQgdGhp
cyBwYXRjaCB1cCBiaXQNCk1heWJlIHRyeSB1c2UgLS1wYXRpZW5jZSBvcHRpb24gdG8gbWFrZSB0
aGlzIHBhdGNoIG1vcmUgcmVhZGFibGUuDQogDQo+ICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9
IHBsYW5lLT5kZXY7DQo+IC0Jc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRl
bF9kaXNwbGF5KGRldik7DQo+IC0Jc3RydWN0IGRybV9jb2xvcm9wICpwcmV2X29wOw0KPiAgCXN0
cnVjdCBpbnRlbF9jb2xvcm9wICpjb2xvcm9wOw0KPiAgCWludCByZXQ7DQo+IA0KPiAtCWNvbG9y
b3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0ZShJTlRFTF9QTEFORV9DQl9QUkVfQ1NDX0xVVCk7DQo+
IC0NCj4gLQlyZXQgPSBkcm1fcGxhbmVfY29sb3JvcF9jdXJ2ZV8xZF9sdXRfaW5pdChkZXYsICZj
b2xvcm9wLT5iYXNlLA0KPiBwbGFuZSwgJmludGVsX2NvbG9yb3BfZnVuY3MsDQo+IC0JCQkJCQkg
IFBMQU5FX0RFR0FNTUFfU0laRSwNCj4gLQ0KPiBEUk1fQ09MT1JPUF9MVVQxRF9JTlRFUlBPTEFU
SU9OX0xJTkVBUiwNCj4gLQ0KPiBEUk1fQ09MT1JPUF9GTEFHX0FMTE9XX0JZUEFTUyk7DQo+ICsJ
Y29sb3JvcCA9IGludGVsX2NvbG9yb3BfY3JlYXRlKGlkKTsNCj4gKw0KPiArCWlmIChJU19FUlIo
Y29sb3JvcCkpDQo+ICsJCXJldHVybiBjb2xvcm9wOw0KPiArDQo+ICsJc3dpdGNoIChpZCkgew0K
PiArCWNhc2UgSU5URUxfUExBTkVfQ0JfUFJFX0NTQ19MVVQ6DQo+ICsJCXJldCA9IGRybV9wbGFu
ZV9jb2xvcm9wX2N1cnZlXzFkX2x1dF9pbml0KGRldiwNCj4gKwkJCQkJCQkgICZjb2xvcm9wLT5i
YXNlLA0KPiBwbGFuZSwNCj4gKw0KPiAmaW50ZWxfY29sb3JvcF9mdW5jcywNCj4gKw0KPiBQTEFO
RV9ERUdBTU1BX1NJWkUsDQo+ICsNCj4gRFJNX0NPTE9ST1BfTFVUMURfSU5URVJQT0xBVElPTl9M
SU5FQVIsDQo+ICsNCj4gRFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBBU1MpOw0KPiArCQlicmVh
azsNCj4gKwljYXNlIElOVEVMX1BMQU5FX0NCX0NTQzoNCj4gKwkJcmV0ID0gZHJtX3BsYW5lX2Nv
bG9yb3BfY3RtXzN4NF9pbml0KGRldiwgJmNvbG9yb3AtPmJhc2UsDQo+IHBsYW5lLA0KPiArCQkJ
CQkJICAgICAmaW50ZWxfY29sb3JvcF9mdW5jcywNCj4gKw0KPiBEUk1fQ09MT1JPUF9GTEFHX0FM
TE9XX0JZUEFTUyk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgSU5URUxfUExBTkVfQ0JfM0RMVVQ6
DQo+ICsJCXJldCA9IGRybV9wbGFuZV9jb2xvcm9wXzNkbHV0X2luaXQoZGV2LCAmY29sb3JvcC0+
YmFzZSwNCj4gcGxhbmUsDQo+ICsJCQkJCQkgICAmaW50ZWxfY29sb3JvcF9mdW5jcywgMTcsDQo+
ICsNCj4gRFJNX0NPTE9ST1BfTFVUM0RfSU5URVJQT0xBVElPTl9URVRSQUhFRFJBTCwNCj4gKwkJ
CQkJCSAgIHRydWUpOw0KPiArCQlicmVhazsNCj4gKwljYXNlIElOVEVMX1BMQU5FX0NCX1BPU1Rf
Q1NDX0xVVDoNCj4gKwkJcmV0ID0gZHJtX3BsYW5lX2NvbG9yb3BfY3VydmVfMWRfbHV0X2luaXQo
ZGV2LCAmY29sb3JvcC0NCj4gPmJhc2UsIHBsYW5lLA0KPiArDQo+ICZpbnRlbF9jb2xvcm9wX2Z1
bmNzLA0KPiArDQo+IFBMQU5FX0dBTU1BX1NJWkUsDQo+ICsNCj4gRFJNX0NPTE9ST1BfTFVUMURf
SU5URVJQT0xBVElPTl9MSU5FQVIsDQo+ICsNCj4gRFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBB
U1MpOw0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlkcm1fZXJyKHBsYW5lLT5kZXYs
ICJJbnZhbGlkIGNvbG9yb3AgaWQgWyVkXSIsIGlkKTsNCj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4g
Kwl9DQo+IA0KPiAgCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+ICsJCWdvdG8gY2xlYW51
cDsNCj4gDQo+IC0JbGlzdC0+dHlwZSA9IGNvbG9yb3AtPmJhc2UuYmFzZS5pZDsNCj4gKwlpZiAo
cHJldikNCj4gKwkJZHJtX2NvbG9yb3Bfc2V0X25leHRfcHJvcGVydHkoJnByZXYtPmJhc2UsICZj
b2xvcm9wLQ0KPiA+YmFzZSk7DQo+IA0KPiAtCS8qIFRPRE86IGhhbmRsZSBmYWlsdXJlcyBhbmQg
Y2xlYW4gdXAgKi8NCj4gLQlwcmV2X29wID0gJmNvbG9yb3AtPmJhc2U7DQo+ICsJcmV0dXJuIGNv
bG9yb3A7DQo+IA0KPiAtCWNvbG9yb3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0ZShJTlRFTF9QTEFO
RV9DQl9DU0MpOw0KPiAtCXJldCA9IGRybV9wbGFuZV9jb2xvcm9wX2N0bV8zeDRfaW5pdChkZXYs
ICZjb2xvcm9wLT5iYXNlLCBwbGFuZSwNCj4gJmludGVsX2NvbG9yb3BfZnVuY3MsDQo+IC0NCj4g
RFJNX0NPTE9ST1BfRkxBR19BTExPV19CWVBBU1MpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVy
biByZXQ7DQo+ICtjbGVhbnVwOg0KPiArCWludGVsX2NvbG9yb3BfZGVzdHJveSgmY29sb3JvcC0+
YmFzZSk7DQo+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gK30NCj4gDQo+IC0JZHJtX2NvbG9y
b3Bfc2V0X25leHRfcHJvcGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiAtCXByZXZf
b3AgPSAmY29sb3JvcC0+YmFzZTsNCj4gK3N0YXRpYw0KPiAraW50IF9pbnRlbF9jb2xvcl9waXBl
bGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QNCj4gZHJtX3By
b3BfZW51bV9saXN0ICpsaXN0LA0KPiArCQkJCSAgICAgZW51bSBwaXBlIHBpcGUpDQo+ICt7DQo+
ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBsYW5lLT5kZXY7DQo+ICsJc3RydWN0IGludGVs
X2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGRldik7DQo+ICsJc3RydWN0IGlu
dGVsX2NvbG9yb3AgKmNvbG9yb3BbTUFYX0NPTE9ST1BdOw0KPiArCWludCByZXQgPSAwOw0KPiAr
CWludCBpID0gMDsNCj4gDQo+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDM1ICYmDQo+
IC0JICAgIGludGVsX2NvbG9yX2NydGNfaGFzXzNkbHV0KGRpc3BsYXksIHBpcGUpICYmDQo+IC0J
ICAgIHBsYW5lLT50eXBlID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpIHsNCj4gLQkJY29sb3Jv
cCA9IGludGVsX2NvbG9yb3BfY3JlYXRlKElOVEVMX1BMQU5FX0NCXzNETFVUKTsNCj4gKwljb2xv
cm9wW2ldID0gaW50ZWxfY29sb3JfcGlwZWxpbmVfcGxhbmVfYWRkX2NvbG9yb3AocGxhbmUsIE5V
TEwsDQo+ICsNCj4gSU5URUxfUExBTkVfQ0JfUFJFX0NTQ19MVVQpOw0KPiArDQo+ICsJaWYgKElT
X0VSUihjb2xvcm9wW2ldKSkgew0KPiArCQlyZXQgPSBQVFJfRVJSKGNvbG9yb3BbaV0pOw0KPiAr
CQlnb3RvIGNsZWFudXA7DQo+ICsJfQ0KPiArCWkrKzsNCg0KSSBzZWUgYSBsb3Qgb2YgcmVwZWF0
ZWQgY29kZSBtYXliZSB3ZSBjYW4gZ2V0IHRoaXMgZG9uZSB2aWEgYSBsb29wDQpzdGF0aWMgY29u
c3QgZW51bSBpbnRlbF9jb2xvcm9wX3R5cGUgcGlwZWxpbmVbXSA9IHsNCiAgICAgICAgSU5URUxf
UExBTkVfQ0JfUFJFX0NTQ19MVVQsDQogICAgICAgIElOVEVMX1BMQU5FX0NCX0NTQywNCiAgICAg
ICAgSU5URUxfUExBTkVfQ0JfM0RMVVQsDQogICAgICAgIElOVEVMX1BMQU5FX0NCX1BPU1RfQ1ND
X0xVVCwNCn07DQoNCmZvciAobiA9IDA7IG4gPCBBUlJBWV9TSVpFKHBpcGVsaW5lKTsgbisrKSB7
DQogICAgICAgIGlmIChwaXBlbGluZVtuXSA9PSBJTlRFTF9QTEFORV9DQl8zRExVVCAmJg0KICAg
ICAgICAgICAgKERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMzUgfHwNCiAgICAgICAgICAgICBwbGFu
ZS0+dHlwZSAhPSBEUk1fUExBTkVfVFlQRV9QUklNQVJZIHx8DQogICAgICAgICAgICAgIWludGVs
X2NvbG9yX2NydGNfaGFzXzNkbHV0KGRpc3BsYXksIHBpcGUpKSkNCiAgICAgICAgICAgICAgICBj
b250aW51ZTsNCg0KICAgICAgICByZXQgPSBhZGRfcGxhbmVfY29sb3JvcChwbGFuZSwgY29sb3Jv
cCwgJmksICZwcmV2LCBwaXBlbGluZVtuXSk7DQogICAgICAgIGlmIChyZXQpDQogICAgICAgICAg
ICAgICAgZ290byBjbGVhbnVwOw0KfQ0KDQpXaGVyZSBhZGRfcGxhbmVfY29sb3JvcCBpcyANCg0K
c3RhdGljIGludA0KYWRkX3BsYW5lX2NvbG9yb3Aoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQog
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW50ZWxfY29sb3JvcCAqKmNvbG9yb3AsDQogICAgICAg
ICAgICAgICAgICBpbnQgKmksDQogICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW50ZWxfY29sb3Jv
cCAqKnByZXYsDQogICAgICAgICAgICAgICAgICBlbnVtIGludGVsX2NvbG9yb3BfdHlwZSB0eXBl
KQ0Kew0KICAgICAgICBjb2xvcm9wWyppXSA9IGludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2Fk
ZF9jb2xvcm9wKHBsYW5lLCAqcHJldiwgdHlwZSk7DQogICAgICAgIGlmIChJU19FUlIoY29sb3Jv
cFsqaV0pKQ0KICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNvbG9yb3BbKmldKTsNCg0K
ICAgICAgICAqcHJldiA9IGNvbG9yb3BbKmldOw0KICAgICAgICAoKmkpKys7DQoNCiAgICAgICAg
cmV0dXJuIDA7DQp9IA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbCANCg0KPiANCj4gLQkJcmV0
ID0gZHJtX3BsYW5lX2NvbG9yb3BfM2RsdXRfaW5pdChkZXYsICZjb2xvcm9wLT5iYXNlLA0KPiBw
bGFuZSwNCj4gLQkJCQkJCSAgICZpbnRlbF9jb2xvcm9wX2Z1bmNzLCAxNywNCj4gLQ0KPiBEUk1f
Q09MT1JPUF9MVVQzRF9JTlRFUlBPTEFUSU9OX1RFVFJBSEVEUkFMLA0KPiAtCQkJCQkJICAgdHJ1
ZSk7DQo+IC0JCWlmIChyZXQpDQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiANCj4gLQkJZHJtX2NvbG9y
b3Bfc2V0X25leHRfcHJvcGVydHkocHJldl9vcCwgJmNvbG9yb3AtPmJhc2UpOw0KPiArCWNvbG9y
b3BbaV0gPSBpbnRlbF9jb2xvcl9waXBlbGluZV9wbGFuZV9hZGRfY29sb3JvcChwbGFuZSwgY29s
b3JvcFtpIC0NCj4gMV0sDQo+ICsNCj4gSU5URUxfUExBTkVfQ0JfQ1NDKTsNCj4gDQo+IC0JCXBy
ZXZfb3AgPSAmY29sb3JvcC0+YmFzZTsNCj4gKwlpZiAoSVNfRVJSKGNvbG9yb3BbaV0pKSB7DQo+
ICsJCXJldCA9IFBUUl9FUlIoY29sb3JvcFtpXSk7DQo+ICsJCWdvdG8gY2xlYW51cDsNCj4gIAl9
DQo+IA0KPiAtCWNvbG9yb3AgPSBpbnRlbF9jb2xvcm9wX2NyZWF0ZShJTlRFTF9QTEFORV9DQl9Q
T1NUX0NTQ19MVVQpOw0KPiAtCXJldCA9IGRybV9wbGFuZV9jb2xvcm9wX2N1cnZlXzFkX2x1dF9p
bml0KGRldiwgJmNvbG9yb3AtPmJhc2UsDQo+IHBsYW5lLCAmaW50ZWxfY29sb3JvcF9mdW5jcywN
Cj4gLQkJCQkJCSAgUExBTkVfR0FNTUFfU0laRSwNCj4gLQ0KPiBEUk1fQ09MT1JPUF9MVVQxRF9J
TlRFUlBPTEFUSU9OX0xJTkVBUiwNCj4gLQ0KPiBEUk1fQ09MT1JPUF9GTEFHX0FMTE9XX0JZUEFT
Uyk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwlpKys7DQo+IA0KPiAtCWRy
bV9jb2xvcm9wX3NldF9uZXh0X3Byb3BlcnR5KHByZXZfb3AsICZjb2xvcm9wLT5iYXNlKTsNCj4g
KwlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUgJiYNCj4gKwkgICAgaW50ZWxfY29sb3Jf
Y3J0Y19oYXNfM2RsdXQoZGlzcGxheSwgcGlwZSkgJiYNCj4gKwkgICAgcGxhbmUtPnR5cGUgPT0g
RFJNX1BMQU5FX1RZUEVfUFJJTUFSWSkgew0KPiArCQljb2xvcm9wW2ldID0gaW50ZWxfY29sb3Jf
cGlwZWxpbmVfcGxhbmVfYWRkX2NvbG9yb3AocGxhbmUsDQo+IGNvbG9yb3BbaSAtIDFdLA0KPiAr
DQo+IElOVEVMX1BMQU5FX0NCXzNETFVUKTsNCj4gKw0KPiArCQlpZiAoSVNfRVJSKGNvbG9yb3Bb
aV0pKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKGNvbG9yb3BbaV0pOw0KPiArCQkJZ290byBjbGVh
bnVwOw0KPiArCQl9DQo+ICsJCWkrKzsNCj4gKwl9DQo+IA0KPiAtCWxpc3QtPm5hbWUgPSBrYXNw
cmludGYoR0ZQX0tFUk5FTCwgIkNvbG9yIFBpcGVsaW5lICVkIiwgbGlzdC0+dHlwZSk7DQo+ICsJ
Y29sb3JvcFtpXSA9IGludGVsX2NvbG9yX3BpcGVsaW5lX3BsYW5lX2FkZF9jb2xvcm9wKHBsYW5l
LCBjb2xvcm9wW2kgLQ0KPiAxXSwNCj4gKw0KPiBJTlRFTF9QTEFORV9DQl9QT1NUX0NTQ19MVVQp
Ow0KPiArCWlmIChJU19FUlIoY29sb3JvcFtpXSkpIHsNCj4gKwkJcmV0ID0gUFRSX0VSUihjb2xv
cm9wW2ldKTsNCj4gKwkJZ290byBjbGVhbnVwOw0KPiArCX0NCj4gKwlpKys7DQo+ICsNCj4gKwls
aXN0LT50eXBlID0gY29sb3JvcFswXS0+YmFzZS5iYXNlLmlkOw0KPiArCWxpc3QtPm5hbWUgPSBr
YXNwcmludGYoR0ZQX0tFUk5FTCwgIkNvbG9yIFBpcGVsaW5lICVkIiwNCj4gK2NvbG9yb3BbMF0t
PmJhc2UuYmFzZS5pZCk7DQo+IA0KPiAgCXJldHVybiAwOw0KPiArDQo+ICtjbGVhbnVwOg0KPiAr
CXdoaWxlICgtLWkgPj0gMCkNCj4gKwkJaW50ZWxfY29sb3JvcF9kZXN0cm95KCZjb2xvcm9wW2ld
LT5iYXNlKTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gIGludCBpbnRlbF9jb2xvcl9w
aXBlbGluZV9wbGFuZV9pbml0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBlbnVtIHBpcGUgcGlw
ZSkNCj4gLS0NCj4gMi4yNS4xDQoNCg==
