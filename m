Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75375AB767E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC9410E710;
	Wed, 14 May 2025 20:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qug6Yl82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B89A10E710
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747253584; x=1778789584;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KJSO9u4dzs1PeIcNU1OY0U3+gEraUeEgXKXi22bT/zU=;
 b=Qug6Yl82TFaVvPsffZ/rjRWtAwz1eICb5kJQlYIOO2PhgfzGwvKYLJOY
 K8BkMRkzAk5BXM7Ulo/hZhypfHtuQYonBBkKRA+AbBSaSmvKgHy4ZC9dg
 Z2hNXjBBt03FEaBlrdyarSryTWlR2WAYxUzsHjcZwe8nuHXfM8/iWFQep
 YT64VzGPt4WAhPQuVIecCIMNxraI+3N/AtV1MTFJ7Q2ZxFu3tbs8G2eAG
 8Vyc9KdrCzUEmLQFGyh+9Nxmta+PeXK67K3gx/6mmxDMYT4Dvg2bYgZ0o
 9fmpTtat+e+f3CH5d8Rnv7psKSXcq9CzvvBYW1HimixxA2y5AZdWzs7UX g==;
X-CSE-ConnectionGUID: C5G/u0osRfGBOxwzhyWtnQ==
X-CSE-MsgGUID: YacAUlHzSSS7z7lA1vaMTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71677017"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="71677017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:13:04 -0700
X-CSE-ConnectionGUID: WkZMqWlzStCCdg11YY0qAA==
X-CSE-MsgGUID: gbcNYl5hQHGcWzRmwf7uPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="143253177"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:13:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 13:13:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 13:13:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 13:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WA1/WRDeCsU4yJUueQmD9Gk0+R9Wu8ji2SG/i55DEAprOdzQXoiFn2UvE8rpRci9pWKn5knluF54RAqUMOP8mHhfFfv0sCJbv7IN57JjiUHP3ZEOsuev1QMMlP3EfYKR1B9c1821oLizwYoYPIfuYOeUHAFXoUkl9h78RNZVXR7sFDRcvCmMt3DQcnIHC28SgknpHwWO3olbcuXf+sGtB2s1bj72vzNSRuZBTxCGXu6BCQb0dSs8b6wSNAeliZnQGk5GIFunOv9QrTroOJRaldv7vwiTUUn1WaDBPvFSj4bhFEG8D5ylNLxo44XcNl9YFvGKuU4IVzSO9pP0MxkUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJSO9u4dzs1PeIcNU1OY0U3+gEraUeEgXKXi22bT/zU=;
 b=YBVi8w4rk4rWMSkgDm4a0ZJ4lSLLe8gVLt2OytgAtBRObNEbRuuCCeIS/IR1SqouCDIhchB/OLmA8KekTDdUfu/tQBY/N6rfP5cv+Iupw+X0bbmLUSaAiBJh7E1i057Vy6E8opMEa+AOgCm8nK/GPb5lF/sc3iat2soFdErHU6nBOiQDrRemEcCseJVV9JxH87HYlJKMKThdZZhXAz89H13csEOco6C2GF5QqbSzrl19hZQeJifsg4ykYAf0+pXpX1TuEKllJ4qmK5qnQtd/K6wo2bx2RPGX5KYAx96ElCbH/WGDeUdd8V9eIGZzuDP0/njRrQwolVTOhhiIR5mhCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 by BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 20:12:20 +0000
Received: from PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346]) by PH8PR11MB6879.namprd11.prod.outlook.com
 ([fe80::bd3d:59f2:9d29:346%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 20:12:20 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: RE: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Topic: [RFC PATCH 0/2] Virtio-GPU suspend and resume
Thread-Index: AQHbveDGUI4ch9Wax0+wshHtMZeSmrPEbDcggAAE0YCAAV1kQIALLozggAFMUICAAFL48A==
Date: Wed, 14 May 2025 20:12:20 +0000
Message-ID: <PH8PR11MB6879A04005A6858718978C87FA91A@PH8PR11MB6879.namprd11.prod.outlook.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
 <7f334c99-fe86-4e53-86d6-e8473c76ff3e@collabora.com>
 <PH8PR11MB6879A6238EAD527704B8C994FA8E2@PH8PR11MB6879.namprd11.prod.outlook.com>
 <28584e91-6320-431d-afae-9f10e1eca86d@collabora.com>
 <PH8PR11MB68792B11430CF12E9B7A525CFA96A@PH8PR11MB6879.namprd11.prod.outlook.com>
 <ae1c2cb0-af29-4dfc-b2d8-224a44a7c6f7@collabora.com>
In-Reply-To: <ae1c2cb0-af29-4dfc-b2d8-224a44a7c6f7@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6879:EE_|BL3PR11MB6436:EE_
x-ms-office365-filtering-correlation-id: 6ee4f620-4fb8-4e51-b9a7-08dd9323a1d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cEFyS2hDS3ZXU0Zncm1hWHErcUxTNFNnaU1DajRveksvRm00ZnBocVBWakZU?=
 =?utf-8?B?MGYyOUx5VVF4UHJZcURDdHZ1ZFVSdmo1V2FRcXBLdE01NzhBRElIZUJSZ0Fu?=
 =?utf-8?B?dUU0RmNGZnRWRzdpR3JyL0hmOHN2c2xLUEFJeFJXRFF4VEQ4SkEyQmY0bmd2?=
 =?utf-8?B?dlpsOERhbXRZNW9BOWVwR0hiYU1IL2J5SVNyK1NJYnZUWUdTNjYxNjg5a0xZ?=
 =?utf-8?B?bW85MnY5Um5kdjhUNkFIbEtad3FHNWRvbXhoMFFMQWlib2lPTWhXL1lVTDN5?=
 =?utf-8?B?cWg5NkgveXdnSFEvaDhYbllMMWZpUkxjL0tCRGFWRkpIaEdSY1RtS1lFc0lY?=
 =?utf-8?B?WUJ4TnNGa0NQOXozZ2FmS0tuUDlKMFo1bm1sYTMwYUNhWWp4QW1PRGtNZWpx?=
 =?utf-8?B?c2JtVlkzdDNwMnNkQnpPaDlnMHRSZ1BnVzB6UDQwVzdrZGFodS9LMWpNaDNv?=
 =?utf-8?B?bGdhbjZwSmwvVzhMMmNvZGNkWWlHdXdtcjJxcUxoMU42QWZxMkNrT2hlcEJK?=
 =?utf-8?B?SVVKOC9ySGk3a04walYxS3NFZ0dsbXpId08vSGg5a0Fhak5oUmtIQlpMU1lh?=
 =?utf-8?B?RlFpZ295NXZUSE9DS2J1MnkwNGRYTVBXMHo5TndGRUtnd3dwS2tsODVTb0Ex?=
 =?utf-8?B?dERQTmtWRWJsZEZQQitIVmxJUW9qb203Nkx6dXhGOVl4K2c0b0JnellSanlK?=
 =?utf-8?B?dEtWemRXbjBGcWE2b29iMHc3UDJSdmE2bEVJRXV4cU04ZFNaaVhxZ0F1ZTRM?=
 =?utf-8?B?U0E2bVpEWlpKNVZpYzdWQ0NqTGd3NW9LeUhWTFJ1eS94d3B2NUFwSEFOTVNF?=
 =?utf-8?B?NFlHUDNqb0ltWkZsN3FGdzRBTENDVlJybC9jWkdFNU81UStad3dRQlhuakVG?=
 =?utf-8?B?ZmQ0d24vVzFDaVgzMTA0YU9FQ1IzR3c2eXJjR3RyVDRmOCtVVk1SaUVEODV5?=
 =?utf-8?B?RUo2S0J3YWFYa3lGcjVaV0ZSbFd6aW1veDV5bHExTTJrbGtrK1VDSWJKY0VS?=
 =?utf-8?B?cWNnclNGem1DbTBJNlFubjcvVUJ6SzVzeG14dnp1UlArSGtwYXB2TkE0aTMz?=
 =?utf-8?B?VnVsV0tHaWZFN3BjOWlYVW9QR0VhbWhwOEhwWHFyRzUveEY5dys1aDBwK0Z4?=
 =?utf-8?B?cXRpWEdCOXNNb2QzWGUvdi9wZFVLaUJtWnpnYXlqL00ycHQ4U1FzSHgxblYx?=
 =?utf-8?B?ZVpxdHNkNk03ZkZFOGpTMURlakR3bWhOTVU0ckxtUXMwZEN1bGNlMWh2bHlX?=
 =?utf-8?B?cGMxa1ZteTFzL3FRcTQ2SmtUR2EraGduR3JKVk9Ub2c1MzlkN2RVOEsrN0Z4?=
 =?utf-8?B?WXQrMW8ySEE1SjJodm1HM3BndkxRVU44Z01kelZNdlg0QWRLVWErcGgrTno4?=
 =?utf-8?B?NStEdTJnWi81TFpTaUlyQ3ByR005emZ2Vjk0UkpXS1MwSUpUNlVLOUtUeGV2?=
 =?utf-8?B?UEkreDBtSGJOTGVCSnpNNXBJbm1aQktYYTNrckkzWEVybm9Qc3lxNTRlTUJm?=
 =?utf-8?B?dDdLeG51TWJtUkdyblBmZktweHFwT2FkdGRtZm5vajY3T1IvTkxwdHhlNC93?=
 =?utf-8?B?d0Mrc0laRGpPRVpFVVJ1VEl0bkdJbkovZXIyWDExd2tKRGw3dHkrWU43RWpU?=
 =?utf-8?B?UjVHdXNWVmxOYS9WZ3FVbmo3ekI4TXY2Wml3T1hXS2pQcm1HZ2JsVWMxVTRw?=
 =?utf-8?B?aHRST2VtUkphcWNiWXh4N0xnMWpxYzNwelNiYnlDTVE2YUpjUkVMejh6Q0NY?=
 =?utf-8?B?cnVlV2ducGdpQVpkOFZXK0wzZHgxY0dwaUZtaUZ6d1dQbHhramsrK3NBeDNy?=
 =?utf-8?B?MC9WQlNzZkNqUTRYMU5iQjc5UWFib2FKZVFTRzZ0dHFzZUNhWDZZbXdCSkNR?=
 =?utf-8?B?ZFBRYmVFNjVyb1ZXRlJHcW5WUjNweUxYeGdZL003OU96eEFFRE1DUWJKRlpk?=
 =?utf-8?B?cksrZnFyNFNRbzlZRk94d3dGdWJVQXFoR0ZXaDY0TExTdGl3WFdpUXZEZ0xL?=
 =?utf-8?Q?Ee4nf9tNLBtc7zjC3tcV82N0ngCC1Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6879.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWIxQTB1ODF5N0NKOEdqVjRHOURtb2hYWkV3WW54WG5IU1A4VFY1SnVlYnJL?=
 =?utf-8?B?Q09yVEJkQkFOa1B4UGdUcUpBQWJ0aDhiNEhWWnZQT0YyWWFqZmZqL09PTS9h?=
 =?utf-8?B?Y2NSQitaMzhwWHc4RTZmaHJ3N3dCTTBLNkx3SzZ1d3dmYzdJeWJOSHlLdVNM?=
 =?utf-8?B?Z3hkNzB0RlduVkN0ZkcvdmZvaHJjbjBya01ISWtXSFJ1WTVUMlZQK3NFSzZX?=
 =?utf-8?B?QWQ1ak9QcjJCVURrNkVQNE56WEhhcDVUMzdoTEVwVUJLS3RJVTh0UERaSGE3?=
 =?utf-8?B?MjRkMEFheXAvbWI0N2Q0UUsrN1oraFlXNFU5QTM2elNMYVI0ZXVDMGdzOWxh?=
 =?utf-8?B?MU44NFJ1dVdtNWZaVzRmR2poZ1daek1uVks5QUFuYTRGQ2Q5RlpnTWpQVkhH?=
 =?utf-8?B?R0JZTXVUVzMzRmtNWG5yWkZwUHRxMEV1bWhiMVZ1d3JRS0VZSkEwaUpKWnNo?=
 =?utf-8?B?ZjFmRGNieUVva3FVci83b3dOS2hJUlprZjhZVUNRUlJ3UCtvYnJDNlFIWlNM?=
 =?utf-8?B?dXM0T2ZSbEM1Z3pUM2lMWXVwVkhsYVhEbHI3dVg4YVcyUWR5MUt3ajBEQVIy?=
 =?utf-8?B?NWM1Ri82aUZMMDVRV1NybmNUS2tEWll4eTJlcDQycTc1eUNxVnRjdlV2TnhK?=
 =?utf-8?B?dWFnVXRBeE5TOFhxK3ZINldldUdFUUxIK3p4eDFmYWlCUGxYNDdIbytYSzMz?=
 =?utf-8?B?ZThRY0VKSGpBM0MxQkdTa3ZPOXp5a1M3U01oY0hocUVoYjZZeDB4a0g4RzFp?=
 =?utf-8?B?TDhrM1dLMzJoMXgyS0Y1c3RQQVhBMndYM1JnU0RQbkIzYk82NGNnVDJ6QVdX?=
 =?utf-8?B?Qm4xR0gxdkU4LzJJRjNKZTQranR6UVFsOXE2eUhwaDlzNUxYVjlXQ0VRYUcz?=
 =?utf-8?B?NFFiSWhrRFd0YU1FZjRsQ29VQXk4VENNanlzM2xXcTdSRmdNbk5zZU44YTR4?=
 =?utf-8?B?MVU1enBLdW0vWVhHZWFDSVBPTFRMVHZJV0Vnc1RDU1B1SlJGUDFzdU5iNjBF?=
 =?utf-8?B?cTdmYXd5NTJhTjY4NWRua1BLMGowQm45SEdJUUJvRGpsTTZIdFhOK1VWL29m?=
 =?utf-8?B?MFd5T3pBTVNuNVJ0emdUYmhidWQwN1IreFUwN1orTndUMWI3enJOaDNSMzlk?=
 =?utf-8?B?bzZGVEZRZ3VSSUYydDB5b25DWVBpbkJCY2hOWnlrNXowR3NXQVVFLytXbEJB?=
 =?utf-8?B?NzhxbkpxQ01GcjNuZ0x1UEd2N1VrYnFQZGkzTVZVZm9FWnpzWXNmNEluM3FP?=
 =?utf-8?B?a2VkL1Vna1BzODdDbVBGSVhmWGlIK3JqWVlwRGVhUnlWY2xNRk5NU2JHYVNO?=
 =?utf-8?B?SUNLcnF2K1lxMm03MjJ6eXQ3WG5lOXRDSlNiZ3F1UlQvUjdRYkt0QjVUMk4v?=
 =?utf-8?B?QVVtQ2hHRFlrejZFckFYKytpb2JIRzcvVWxWK2tvSVlCMEF3RjVIVzVDNVlU?=
 =?utf-8?B?TnlyK29rTFhGMkZsMlRsSEZRc09oVUk2c1pmVXVIUTNwZHluMkozY2NWdFFm?=
 =?utf-8?B?MDF0RFAva0FNRWluaVRDZHA1MDRpK2R6Y2IxaU5lQUJPcldrUnk4d0c3RnZT?=
 =?utf-8?B?Vll0MXUrcTJxczBzdUQrQVNDNFpydTQwTk5CWFFSZXJ5VWFaVnl0N3BmMUgx?=
 =?utf-8?B?M05vTERxMjdhS3k2QStHeldLRmxYeTNNcDF6ekM4MHA1Qm1qUTFIcExCNFdp?=
 =?utf-8?B?M3V6WnBMMTdCZW9OZ0tKSExzZnRvWFZocHh6VUMzVVc2Z0piREJnRjJmUElx?=
 =?utf-8?B?aFk3NGN3ZmNJY2pGSHNCYjJQSndSNTBWMTU0d1BkaGVBWXBpcGhtWGkxR1ZR?=
 =?utf-8?B?SEMvWUdoK29YaUc3ME90akhGZnoyVHljK0c1VGxCajlNMVV0eWxRbDFqZ0ky?=
 =?utf-8?B?RklqeUNJUC9OU3RIY1VGYXJLNk5UeFZ1Y0F6YjdMZUtPMEVSaThjeVBKUjRJ?=
 =?utf-8?B?WWJWdW5FNTZVR3BWZmR3U3lyaXdLdk9sbEFLYzRIRWV3d0krK0FjOUhzMXlL?=
 =?utf-8?B?cE80azh0TW1BQm5scERJQmdKV29paXFTekZ0SGFFOUhOTFV1YTNnc1lvVmFp?=
 =?utf-8?B?dkN2SFNYcDZnblN3c3BIN1grL1daTm1ueHQyOSt0OFVwSXl5aC9BT3NpOStw?=
 =?utf-8?Q?kdbAHS7O2CHloCpCCOy81Zna1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee4f620-4fb8-4e51-b9a7-08dd9323a1d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 20:12:20.4522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0lpkIS/n8SUFODvsaovyyeS471EsoGLVx3XmMTQ8F4C/dl1Nkidwn2cvmXKfBlzEllkXlr7cMcVVZF/2Jjt1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6436
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

SGkgRG1pdHJ5LA0KDQpJdCB0dXJuZWQgb3V0IHRoYXQgYXR0YWNoaW5nIGJhY2tpbmcgZHVyaW5n
IHJlc3RvcmluZyBwcm9jZXNzIHdhcyBza2lwcGVkIGR1ZSB0bw0Kb2JqLT5hdHRhY2ggPT0gdHJ1
ZSBjb25kaXRpb24sIHdoaWNoIGlzIHRoZSByZWFzb24gZm9yIHRoZSBlcnIgbWVzc2FnZXMgeW91
IHJlcG9ydGVkLg0KSSBoYWQgdGVzdGVkIG15IHBhdGNoIG9uIHNsaWdodGx5IG9sZGVyIHZpcnRp
by1ncHUgZHJpdmVyIHRoYXQgZGlkbid0IGhhdmUgdGhpcyBmbGFnDQood2FzIGFkZGVkIGJ5IG9u
ZSBvZiB5b3VyIGNvbW1pdHMgdGhhdCBhZGRlZCBkZXRhY2hpbmcgYmFja2luZykuDQoNClRoZW4g
SSBhZGRlZCBhIGxpbmUgdG8gc2V0IHRoaXMgZmFsc2UgYmVmb3JlIGF0dGFjaGluZyBiYWNraW5n
IGFnYWluIGZvciByZXN0b3JpbmcgYW5kIEkgc2VlDQpUaGUgZGlzcGxheSBpcyBub3cgdXAgd2hl
biByZXN1bWluZyBidXQgdGhlIHdob2xlIGtlcm5lbCBzZWVtcyB0byBoYW5nIGFmdGVyd2FyZHMu
DQoNCkkgYW0gZGVidWdnaW5nIGl0IG5vdy4gDQoNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0gg
MC8yXSBWaXJ0aW8tR1BVIHN1c3BlbmQgYW5kIHJlc3VtZQ0KPiANCj4gT24gNS8xMy8yNSAyMjoy
MywgS2ltLCBEb25nd29uIHdyb3RlOg0KPiA+IEhpIERtaXRyeSwNCj4gPg0KPiA+IENhbiB5b3Ug
c2hhcmUgc29tZSBkZXRhaWxzIGFib3V0IHlvdXIgdGVzdCBzZXR1cD8NCj4gPiBIb3cgZG8gSSBy
ZXBsaWNhdGUgdGhlIHByb2JsZW0geW91IHNhdz8gQW5kIGlzICJzdXNwZW5kIGFuZCByZXN1bWUi
DQo+IHdvcmtpbmcgYnkgZGVmYXVsdCBpbiB5b3VyIGNhc2U/DQo+IA0KPiBNeSB0ZXN0aW5nIHNl
dHVwOg0KPiANCj4gLSBRRU1VIHN0YWdpbmcgdHJlZQ0KPiAtIEd1ZXN0IGtlcm5lbCA2LjE0LjYg
KyB5b3VyIHBhdGNoZXMNCj4gLSBVc2luZyAiLXNlcmlhbCBtb246c3RkaW8gLWRldmljZSB2aXJ0
aW8tdmdhIC1kaXNwbGF5IGd0ayIgaW4gUUVNVSBjbWRsaW5lDQo+IA0KPiBJJ20gYm9vdGluZyBn
dWVzdCBpbnRvIFZUIGFuZCBydW5uaW5nICJydGN3YWtlIC1tbWVtIC1zNSIgZnJvbSBzZXJpYWwN
Cj4gY29uc29sZS4gT24gcmVzdW1lIGZyb20gc3VzcGVuZCBJIHNlZSB0aG9zZSBkcml2ZXIgZXJy
b3IgbWVzc2FnZXMuDQo+IFdpdGhvdXQgeW91ciBwYXRjaGVzIHRoZXJlIGFyZSBubyBlcnJvcnMu
DQo+IA0KPiBBZnRlciByZXN1bWUgZnJvbSBzdXNwZW5kIGRpc3BsYXkgbm90IHdvcmtpbmcgaW4g
Ym90aCBjYXNlcyB3aXRoL3dpdGhvdXQNCj4geW91ciBwYXRjaGVzLg0KPiANCj4gLS0NCj4gQmVz
dCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
