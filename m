Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D507EAC0AAC
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6236110EA9A;
	Thu, 22 May 2025 11:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILds5KK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4D210E980;
 Thu, 22 May 2025 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747913617; x=1779449617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WdBVOuBdulA7fZyIkVKjirq2QbgT2wUGolt7H1FCOro=;
 b=ILds5KK+yQ7k5X5wvLRgevJ9CFxVU7JkOfWArk59Zu8tVihlWyEVKYR1
 /DpguBmPl1lnv/Y1mPgv9uVhzPIpv50qfWe5nNURfvEIEqlW1MQBoB0+N
 IfM1PKSF/La7jvcd44xmVjgs7kusw1W8eyQiAsHgTAcnSjN/qBY+fw3YU
 2HQzWRvXG5Q88ST94o/mefmUBNbVJ4GnQlNIM/ILXJ2+VK+siXL37Q873
 Wh6cPTh4MXfzjopy/nnKigj1mwjlAzSHjE1JCTeHn6yjf8XmKfrpLztis
 /kdDPwbsGhtJslyU+1mDFNjZuNlD5xpGaKQJl+r0A/Qz3A3GEqJkAWTuv A==;
X-CSE-ConnectionGUID: 5uQhJZPxSzSqa1sBAFjSZw==
X-CSE-MsgGUID: JBp1UqcbQNynJv2k2iJwTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60573641"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60573641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:33:37 -0700
X-CSE-ConnectionGUID: TNO3lo1XRke5Ppc2gsZfeg==
X-CSE-MsgGUID: YS+VUGg6SBqNYDZVc2QQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="144514301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:33:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 04:33:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 04:33:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 04:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItPKeC+82kDQ3AYA5iQfrvl/fWmT0tgK1ouf+RYvV9hsBTx/seDC2IJVG0+r92IvWQuh5F6Shvj92MM+nk5PGLgXVHGaz5xs8JzGexL1CMaop3K1+07SPgvAy2D1zDmFzni1kf2ba6Es9H5i2ewGuFrC1KuYgHflMy/79zZt/uh8LsxKl5J0Bpccs3JkfI/lhZ7bO4W7VKdCGH78is+hy7ttkhxG7FoIqwdwgzA8UvkU5inggygm4ShUaGvuUxCZ/vzfyXsQ+RW+v2R3hG7BmGgGOLuwftn7Hp8TTepdsPLZdOTZhQpJUJn9ZxE2rwNzgpQ2DhcXBGiIwoW6M5WlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdBVOuBdulA7fZyIkVKjirq2QbgT2wUGolt7H1FCOro=;
 b=AO9e/wWPPThTKxljhlUAKomI4NSRtgoSrvi1v68ONniQTHOb22vJNqFM4S+w2tcwSbbHTSagIx2gNuEWI4d0eQdBswhR0EsfU9qHy8jg7lwM5jlowGjEjPwuJ9MpAmqw0VwqNqGuOPuJhVoNWrCvjHmQ9xW0tElLQCy9vjxGsvvqDme6NliITHzpJG6Geq6qVR3SEEQJ+Za6pCzWROAqVgRI6qgG2+Ngna9imGFm5MTKUhVwwepwnJHdEfpAs/+JdNDgVYmhaFGT0uFEfZoC4AFKBw5Qk5YNxRFIOEIJxlF4wkCRIVmWFS4HN9bv+JacmVQlU4GKrkILaTYlctX3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 11:33:00 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 11:33:00 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>
CC: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Topic: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Index: AQHbnqqz2YhtxDgq7E6gFv3ZntqEdLOkXCdQgAACfoCAAAPEoIAAj/AAgAAWPQCAOdBI4A==
Date: Thu, 22 May 2025 11:33:00 +0000
Message-ID: <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
In-Reply-To: <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH3PR11MB7721:EE_
x-ms-office365-filtering-correlation-id: ff80b3fd-ea38-4a05-f4d7-08dd99246858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WlI1NEt1bjFOVDEyNUpMeVB4eUs3RlVldkp2eGZhOGgxWVVaWG1KcXBMMzB2?=
 =?utf-8?B?L3cvdWxwelk3Y3F6SmJyZEs1bW1iWW8rQTdBbU9XRGRQVlIrbVUzY3lGUVkw?=
 =?utf-8?B?dTZZTytDdGR2Zk4zUWZ1QWl2YU1ZR3lhU2Ezd0gwcjVYcENzb2w4MTgzbnZK?=
 =?utf-8?B?MWxvTHMwY0JQNmsweXNxNzRYUVN1MVpvVno0VWJxenRGdEhVNitCY2tCTCtC?=
 =?utf-8?B?WTRoWXkzbFY3bkVVMlF6algvRnRpeG55NEJkY25LZ2dDeWdUZWN5T1VMcWlk?=
 =?utf-8?B?eHVSUlM2S2Z2T3BXWndTNWlrL2R0VW1FLzR3NEh4cU41K3htdW5lNUgySVNJ?=
 =?utf-8?B?cisyaEdrYU1XdGFwUnI3RDF1YmNPOTc5bDhlMVpTbnlvYjg1bk5POU5TRmw0?=
 =?utf-8?B?K0FiTUJqaC9td3daNTlMc3hMOWhEMXh6RUJHRVU2SjhxZjRxQ1FQSXNGUkxM?=
 =?utf-8?B?SldRMFBMZ3dTTGo1QzJ2OFN6WWE1UzlJNDJsZk5OQlg3dWlCS2xZS0ZRaUU3?=
 =?utf-8?B?dE0vYkYxUWZzYnRHMFNxeW5tMWVGbVpGSXc3T3BqRXptTEJ4YkNjMmNVLzN6?=
 =?utf-8?B?aVROSGYvMzNHb3FOOGN4T0d0aTlqd2tBM2FPMExLVVRaSHdia0lUN3pIeVd4?=
 =?utf-8?B?MWNHSG5QUGd3UGprUWw3c0R6WmRmdjJwamFjRUgrNnJzWC9CZXhlNVVsalNZ?=
 =?utf-8?B?bDdHTm9FQlpoMHFoWmZpaUxESHNPWll3K3N2L3lCdHVRR2hIRG5oN1g5dldy?=
 =?utf-8?B?V1ZFUzc1QzJqTzVFRWY2TnZIMi9YRHBORVFZcTJpcUJnbENhL1o2Nm5KZzdM?=
 =?utf-8?B?OXNjbC9MS2ljODRZSDFpNE00dzB6dEQrY1ZhNFd2aTlGd0xVYzNIZW43NnBq?=
 =?utf-8?B?ODhtcWg2NWZEbUQ4djM5L0JtOUR1cU9hOC9UajFYL3YvcFpRUmlHbGZ6bURX?=
 =?utf-8?B?Sk53Y2l3Zis0Vkw3K2FlTVkxcUdURXNNMFdXRGc5Q01EZTFEUEEvdlRiN0wv?=
 =?utf-8?B?ZDlkY1lxa3l0aGcybTFsY0IxVFVNbWExTUQyS1FRZXZ1Rm1Od2R0WFlzOXVF?=
 =?utf-8?B?YngzM2h6bk85TDZWZkI3dVhQSHdrSTU0b2N5T2UvSnVBcjVnYjZ1T0k2MHJ6?=
 =?utf-8?B?eXpCRlV0SGpCMkZib3dVN0lmd0FwNm1rNW15NDhWeWR3M004aWZuckRLTmFG?=
 =?utf-8?B?Z24zMmZKNFA5aGt5SDUxVm12cVRkcTMzalBFTVhGSHNOMWhTQXNCTkIwaUc4?=
 =?utf-8?B?UUtocm9JcHBLRWpzL2lRd0JiU3o1QUVkTjUxdmcycXhzdmNkdXQ2U3V5Q2dW?=
 =?utf-8?B?czcxbXc5Z0liUWlWdHhJNlFPajNySnJTY1ZpRDZBaE1JalU0S1puVTQ0UTls?=
 =?utf-8?B?YkxLRmg1V1ZZOUxldG00MitPNlEwaUFCZm5pdm5sOTZDSnljeFM2ZDNQMVVU?=
 =?utf-8?B?dWw3NlF1bnZDbHJFMDUrQURTbVRlT1MrODhhN1c4RHp2V1ZQeXlNL3BFL010?=
 =?utf-8?B?eXhOUmtrQit0TFhjR21TS0xVSUtYNjkvQnljS0kyOUVvZGN1RDRhc2pEWVcz?=
 =?utf-8?B?V1ZER2hQVWtVSkZTUjd1TWJpMDhhODNZelMzWHBDYUUrWVVuRkV0QkRTdFpk?=
 =?utf-8?B?K3hKYWZneGRmeUNXSE94UWE5OURSelUwZkU2K3dtdVRYenRBOEVJVXc2ZnF6?=
 =?utf-8?B?NFFDWTljTWVYcGhqMFlCMHp2RTQwN2o2dGhGbWc3NlAwNnZ5VHY2UlU4NEVV?=
 =?utf-8?B?WmZDVnF0UWFpZXd6TEpiYUtETXNYem5yTFdPSXhlMy8zU2cvdnpoSzZLQXFt?=
 =?utf-8?B?T2hFV3RqMzVvSFVwcko2ejZ6VlN5TTd5T091aXl4cGEra01ocHExU1JYT0RE?=
 =?utf-8?B?RjlheVFNTFZ0NStpS2RBNnZuQ2RxbTFnbjIrLzZlc2FNV0g4WEtHSFlvWjBJ?=
 =?utf-8?Q?+Qk1+XTDBfo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUtMYUxjR1ByUkYzRjMvTENrbFJodGR2bnp1RXlFVnB0aVZ3KzBMYzRYdG43?=
 =?utf-8?B?Q0VEUkxwVzZKRVJqanRJUklRRi9SV1RHeFkxNEYrdGdIdGRsVk81RXlEZXBS?=
 =?utf-8?B?bTgzUmFIRHRFd2tLMy9ZbHlIbkpsRU8rT1JsQTYyU0pRalMvM09uWk1CTm1o?=
 =?utf-8?B?ZzBMcE83amxyejAvYkViK3ZKTUNWdG1Bd1MrNWZnSForcTVyWVIyb1NSb0hR?=
 =?utf-8?B?bGFwRldzQk5ick5pMEJFSDFxK3p1U3VtZEpSK2JweHB0RkRvQlRERU80YklN?=
 =?utf-8?B?NVphdGpTYjdwWXFSMVoyYUFORnYvaTIzUkR1QW93V1IvMlQwZUd1aCtFdjQv?=
 =?utf-8?B?SkxIOVJJa0tOUm91anhidFRDNEpUMHA2MXlhbm9XV1VTdmdleXhaTnpVMDhN?=
 =?utf-8?B?d3M3YWhpN1VzcjN0YkRwbU4xTmNuNlF5VWpFWllkMGpjamRMNy9NZkw2Ykk3?=
 =?utf-8?B?T0dVM29hYUZLa0VSaEIvd25WeHg2dEpPeVlBTmFvWENIWXBJZnRoanVTemds?=
 =?utf-8?B?R0REVHdzSmhqc29pNllnVmwyQ25tUmt0dit3M0RoL2N3R01WUUhvUnBsZzBk?=
 =?utf-8?B?b1JHSTArZFlxdmxsZm95ODRXMklmQzdBekI5bUc2TWZSeUZBeVptcVFlQ2JG?=
 =?utf-8?B?bTBRbFFQTVZQMUJNY01tK095Y1hWd2RMd0J2UkQ1c2NzOTRWZ2MzUThQeVhX?=
 =?utf-8?B?S2Jua2c0OVB2YThzL0F6YlNPamxBVU5RWlE5dHZ6REZ2NzF0UjR6eVNLZU9Y?=
 =?utf-8?B?S21RYk5EMktQaUdwb3dqWDVZUXVJUmluWFByZEpvTVdZWGs3UHB1cVNrVUJI?=
 =?utf-8?B?K2wvOVd3d1h3T0ZJaG1wcEtqTkxOQ2pXK0NiTnRKOThmOGJxbjRoVzlocGhr?=
 =?utf-8?B?NzRObGc0QWJQWXM2aTdtYTdaaFJJcUtxeW04aDVnY3pmaHM1ZmFtMXNGVEU5?=
 =?utf-8?B?c2J4NFE3WEd2K0trZlZHSnhqTXNhenMwMW11QWlLdWRDbzJwdmRvcE4xaXFB?=
 =?utf-8?B?ckhKNFlDQzdWSTJIQ1k3d2I2QmoyQjF5UlU1TzM0SWFsbFZPNTdVUE4zRGN1?=
 =?utf-8?B?QmZuaDF1U1JJd05TKzMyMXlSWlZHdWtkREtlSUE0QnpMRFBKVDFMWFpIV3ZF?=
 =?utf-8?B?OUhycGZKZmlEbnB4NWFmS09YeWJlZ3Z3M2pkM3M0SkZaZXBLUVZnNmhUTzlZ?=
 =?utf-8?B?WkFUbmRpRGNuWithZ2VkSW5rQ1lSK0xpbVdkcDkzSWQxbndiVVdhc0VOeXZs?=
 =?utf-8?B?OTE2bFgvRTUwTGNEUmJxbHhnK0ZsMldZdWtUT3JlODhHM1MrUnlaUWRaeTd4?=
 =?utf-8?B?REVzWnFMME1sMmtIaVlZaTBPWWRhaDBHNGIrNzY1Y0Z2UXJ4MXpmNzRnQi9O?=
 =?utf-8?B?YVoxL1ZLRnZWeHRBRXVXN0t3M2tnTWZjU1c0ZDMyV0lnUllvbVM0M2JHV2JW?=
 =?utf-8?B?UUdIc2o0VU1xZXpuYmNvL05OWE9HTFFwWUdzZ3BFNmtvdVZNTkNzZWUwbFNT?=
 =?utf-8?B?NWNJMWZBTndEbDlVTTZ3Q1VuYXhHYmxRYXRkMElHcXBDY25RZnQ1OHp5QWp2?=
 =?utf-8?B?MUhGYnJxV3pCL09SNU9PS3oxV3N6azJqNm1aLzc1bE9yejVFQTNEemk3b2R6?=
 =?utf-8?B?eGU5bmxXL29jeGJDNUd5WE1KRGxVNjdXTm9BcGlKMkhydWFpTG1KTDZSWmR1?=
 =?utf-8?B?YlJZcjFWN1M1SmFMR3B2T0VJb2Y2UW0wRExUS01STGNJUEszSHRNdW5DdE5w?=
 =?utf-8?B?eWZlbUpHVWNJNlF0Kzg3ZHE2OE1xMzh1aXdIMnprR3JWNS9FMHZtZ0JRdVRS?=
 =?utf-8?B?YURkTWdCTDRIVzgwWlZieUFqdDRWdVAzTUxUNzkvM29uMEtoSzJ4aEFNMmlt?=
 =?utf-8?B?czd2S1R1TUVvV2RVWHJzandGSy9mWi9CRnpleDAvRHNPazJJVDVVRElEQ2Iv?=
 =?utf-8?B?cC9oRW10bFA0NWlueU9XQlVXcGNPQVhpN2dCTGdzdDlmQ2Y4U0pTYldTZVl4?=
 =?utf-8?B?KzhhdDU0VXRXQ1A2K01tNDNFTU5vQWEzYnNoL2ZUNElOSE56dS9NRTZYNjlX?=
 =?utf-8?B?aWhkd1ZSaEtPRC9uQjNZa1hwbHdHbHBURll3SkJxQUswciszK2JyR3Q4aU1I?=
 =?utf-8?Q?cdsPNqFSnogqEqybG7xQM24gp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff80b3fd-ea38-4a05-f4d7-08dd99246858
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 11:33:00.4451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xmZxcX2U6KgGK4rclXNBdWjbNBU42+3TR1zZYLd6dRBSNtL63bFkMLVmKuhA2gP8LfCMFcAO27zdnuOSdRHLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogd2F5bGFuZC1kZXZlbCA8
d2F5bGFuZC1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+
IE9mIFNpbW9uIFNlcg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxNSwgMjAyNSA5OjU1IFBNDQo+
IFRvOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gQ2M6IFNoYW5r
YXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgQWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1k
LmNvbT47DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgd2F5
bGFuZC1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGxlby5saXVAYW1kLmNvbTsgdmls
bGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb207IHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb207
DQo+IG13ZW5AaWdhbGlhLmNvbTsgamFkYWhsQHJlZGhhdC5jb207IHNlYmFzdGlhbi53aWNrQHJl
ZGhhdC5jb207DQo+IHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tOyBhZ29pbnNAbnZpZGlhLmNvbTsg
am9zaHVhQGZyb2dnaS5lczsNCj4gbWRhZW56ZXJAcmVkaGF0LmNvbTsgYWxlaXhwb2xAa2RlLm9y
ZzsgeGF2ZXIuaHVnbEBnbWFpbC5jb207DQo+IHZpY3RvcmlhQHN5c3RlbTc2LmNvbTsgZGFuaWVs
QGZmd2xsLmNoOyBxdWljX25hc2VlckBxdWljaW5jLmNvbTsNCj4gcXVpY19jYnJhZ2FAcXVpY2lu
Yy5jb207IHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb207IG1hcmNhbkBtYXJjYW4uc3Q7DQo+IExp
dml1LkR1ZGF1QGFybS5jb207IHNhc2hhbWNpbnRvc2hAZ29vZ2xlLmNvbTsgQm9yYWgsIENoYWl0
YW55YSBLdW1hcg0KPiA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IGxvdWlzLmNo
YXV2ZXRAYm9vdGxpbi5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOCAzMi80M10gZHJtL2Nv
bG9yb3A6IEFkZCAxRCBDdXJ2ZSBDdXN0b20gTFVUIHR5cGUNCj4gDQo+IE9uIFR1ZXNkYXksIEFw
cmlsIDE1dGgsIDIwMjUgYXQgMTc6MDUsIEhhcnJ5IFdlbnRsYW5kDQo+IDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPiB3cm90ZToNCj4gDQo+ID4gPiA+ID4gV2Ugd2FudCB0byBoYXZlIGp1c3Qgb25l
IGNoYW5nZSBpbiB0aGUgd2F5IHdlIGV4cG9zZSB0aGUNCj4gPiA+ID4gPiBoYXJkd2FyZSBjYXBh
YmlsaXRpZXMgZWxzZSBhbGwgbG9va3MgZ29vZCBpbiBnZW5lcmFsLg0KPiA+ID4gPg0KPiA+ID4g
PiBJIHdvdWxkIHJlYWxseSByZWNvbW1lbmQgbGVhdmluZyB0aGlzIGFzIGEgZm9sbG93LXVwIGV4
dGVuc2lvbi4NCj4gPiA+ID4gSXQncyBhIGNvbXBsaWNhdGVkIGFkZGl0aW9uIHRoYXQgcmVxdWly
ZXMgbW9yZSBkaXNjdXNzaW9uLg0KPiA+ID4NCj4gPiA+IEhpIFNpbW9uLA0KPiA+ID4gV2UgaGF2
ZSB0cmllZCB0byBzb2x2ZSB0aGUgY29tcGxleCBwYXJ0IGFuZCBtYWRlIGl0IHNpbXBsZSB0bw0K
PiA+ID4gdW5kZXJzdGFuZCBhbmQgaW1wbGVtZW50IGFsb25nIHdpdGggYSByZWZlcmVuY2UgaW1w
bGVtZW50YXRpb24gWzFdIChjYW4NCj4gYWxzbyBoZWxwIGFkZCB0aGUgc2FtZSBmb3IgQU1EIGNh
c2UgYXMgd2VsbCkuDQo+ID4gPiBXaXRob3V0IHRoaXMgd2Ugd2lsbCBlbmQgdXAgd2l0aCB1cCAy
IGludGVyZmFjZXMgZm9yIDFkTCBMdXQgd2hpY2gNCj4gPiA+IGlzIG5vdCBuaWNlIHdoZXJlIHRo
ZSBvbmUgYWJvdmUgd2lsbCBiZSBhYmxlIHRvIGNvdmVyIHRoZSBjdXJyZW50DQo+ID4gPiBvbmUu
IExldCB1cyBrbm93IHRoZSBwcm9ibGVtcyB3aXRoIHRoZSBwcm9wb3NlZCBpbnRlcmZhY2UgYW5k
IHdlIGNhbg0KPiA+ID4gd29yayB0byBmaXggdGhlIHNhbWUuIEJ1dCBoYXZpbmcgYSBjb21tb24g
YW5kIHNpbmdsZSBpbnRlcmZhY2UgaXMNCj4gPiA+IGdvb2QgYW5kIHRoZSBjdXJyZW50IG9uZSB3
aWxsIG5vdCBmaXQgSW50ZWwncyBjb2xvciBwaXBlbGluZSBkaXN0cmlidXRpb24gc28gdGhlDQo+
IGdlbmVyaWMgb25lIGFueXdheXMgd2lsbCBiZSBuZWVkZWQsIGFuZCBpdCB3aWxsIGJlbmVmaXQg
dXNlcnNwYWNlIHRvIGtub3cgdGhlDQo+IHVuZGVybHlpbmcgTFVUIGRpc3RyaWJ1dGlvbiB0byBj
b21wdXRlIHRoZSBMVVQgc2FtcGxlcy4NCj4gPiA+DQo+ID4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjk4MTIvDQo+ID4NCj4gPiBJIHRoaW5rIHRoZXJl
IGlzIGEgbG90IG9mIHZhbHVlIGluIGdpdmluZyB1c2Vyc3BhY2UgYSBzaW1wbGUgTFVUIHRvDQo+
ID4gd29yayB3aXRoLiBUaGVyZSBhcmUgbWFueSBjb21wb3NpdG9ycyBhbmQgbWFueSBjb21wb3Np
dG9yIG1haW50YWluZXJzLg0KPiA+IFdoZW4gc29tZW9uZSBuZXcganVtcHMgaW50byBjb2xvciBt
YW5hZ2VtZW50IHVzdWFsbHkgc2FtZSB0aGluZw0KPiA+IGhhcHBlbnMuIEl0IHN0YXJ0cyB3aXRo
ICJpdCdzIG5vdCB0b28gY29tcGxpY2F0ZWQiLCBhbmQgdGhlbiBvdmVyIGENCj4gPiBwZXJpb2Qg
b2YgdGltZSBwcm9ncmVzc2VzIHRvICJ0aGlzIGlzIHZlcnkgbXVjaCBub24tdHJpdmlhbCIgYXMN
Cj4gPiB1bmRlcnN0YW5kaW5nIG9uZSBiaXQgdXN1YWxseSBvcGVucyB0ZW4gbW9yZSBxdWVzdGlv
bnMuDQo+ID4NCj4gPiBGb3JjaW5nIHBlb3BsZSB0byBkZWFsIHdpdGggYW5vdGhlciBsZXZlbCBv
ZiBjb21wbGV4aXR5IHdpbGwNCj4gPiBkaXNjb3VyYWdlIGltcGxlbWVudGF0aW9ucyBhbmQgYmUg
Y291bnRlcnByb2R1Y3RpdmUgdG8gZnVydGhlcmluZw0KPiA+IGFkb3B0aW9uIG9mIGNvbG9yIG9w
ZXJhdGlvbnMgZm9yIEhXIGFjY2VsZXJhdGlvbiwgSU1PLg0KPiA+DQo+ID4gSSdtIGFtIG5vdCBv
cHBvc2VkIHRvIGEgY29tcGxleCBMVVQgZGVmaW5pdGlvbiBidXQgSSBkb24ndCB0aGluayBpdA0K
PiA+IHNob3VsZCByZXBsYWNlIGEgc2ltcGxlIGFuZCB3ZWxsLXVuZGVyc3Rvb2QgZGVmaW5pdGlv
bi4NCj4gDQo+IEFncmVlZC4gVG8gYWRkIG9uIHRoaXMsIEkgdGhpbmsgc2hpcHBpbmcgbWFueSBh
ZGRpdGlvbmFsIGZlYXR1cmVzIGZyb20gZGF5IG9uZQ0KPiBzaWduaWZpY2FudGx5IGluY3JlYXNl
cyB0aGUgd29yayBsb2FkIChtb3JlIGNvZGUgdG8gd3JpdGUsIHJldmlldywgdGVzdCBhdCBvbmNl
KQ0KPiBhbmQgd2UnZCBhbHNvIG5lZWQgdG8gZ28gdGhyb3VnaCBzdXBwbGVtZW50YXJ5IHJvdW5k
cyB0byB2YWxpZGF0ZSB0aGUgQVBJDQo+IGRlc2lnbiBhbmQgZW5zdXJlIGl0J3Mgbm90IHRvbyBJ
bnRlbC1zcGVjaWZpYy4gQWxzbyBhZGRpbmcgdGhpcyBmZWF0dXJlIGFzIGEgc2Vjb25kDQo+IHN0
ZXAgd2lsbCBwcm92ZSB0aGF0IHRoZSBBUEkgaXMgYXMgZXh0ZW5zaWJsZSBhcyB3ZSBkZXNpcmUu
DQoNCkFwb2xvZ2llcyBmb3IgZ2V0dGluZyBiYWNrIGxhdGUgdG8gdGhlIHRocmVhZC4gIFN1cmUs
IHdlIGNhbiBnbyB3aXRoIHRoaXMgYW5kIGV4dGVuZCBpdCBsYXRlci4NCg0KPiBJIGRvbid0IHJl
YWxseSB1bmRlcnN0YW5kIHdoeSBpdCdzIGltcG9ydGFudCB0byBoYXZlIHRoaXMgZmVhdHVyZSBp
biB0aGUgZmlyc3QNCj4gdmVyc2lvbi4gSW50ZWwgaGFzIGJlZW4gY29udmVydGluZyBzaW1wbGUg
TFVUcyBpbnRvIHRoZSBmYW5jeSBkaXN0cmlidXRpb24gZm9yIHRoZQ0KPiBleGlzdGluZyBHQU1N
QV9MVVQgYW5kIERFR0FNTUFfTFVUIGZvciBhIHdoaWxlLCBzbyBjYW4gZG8gaXQgZm9yIGNvbG9y
b3AgYXMNCj4gd2VsbC4gVGhlIHVwc2lkZXMgb2YgdGhlIGZhbmN5IGRpc3RyaWJ1dGlvbiBpcyBt
b3JlIHByZWNpc2UgYW5kIHNtYWxsZXIgTFVUcywgYnV0DQo+IHRoYXQgZG9lc24ndCBzZWVtIGNy
aXRpY2FsPw0KDQpZZXMgU2ltb24sIEludGVsIGhhcyBtYW5hZ2VkIHRvIHNvbWVob3cgZml0IG11
bHRpcGxlIHNlZ21lbnRzIHdpdGggdGhlIGV4aXN0aW5nIGRlc2lnbi4gSXQgd2FzDQptYW5hZ2Vh
YmxlIHdoZXJlIHdlIGhhZCBsdXQgZGl2aWRlZCBpbiAyLTMgc2VnbWVudHMsIGJ1dCB3ZSBoYXZl
IHNvbWUgY2FzZXMgd2hlcmUgZGlzdHJpYnV0aW9uDQpvZiBsdXRzIGlzIHRvdGFsbHkgbm9uLXVu
aWZvcm0gKGluIGxvZ2FyaXRobWljIGZhc2hpb24gYXMgYW4gZXhhbXBsZSkuIEJ1dCB3aWxsIGFk
ZCB0aGlzIGFzIGZvbGxvdyB1cCBvbmNlDQp0aGUgYmFzaWMgVUFQSSBpcyBtZXJnZWQuDQoNCk9u
ZSByZXF1ZXN0IHRob3VnaDogQ2FuIHdlIGVuaGFuY2UgdGhlIGx1dCBzYW1wbGVzIGZyb20gZXhp
c3RpbmcgMTZiaXRzIHRvIDMyYml0cyBhcyBsdXQgcHJlY2lzaW9uIGlzDQpnb2luZyB0byBiZSBt
b3JlIHRoYW4gMTYgaW4gY2VydGFpbiBoYXJkd2FyZS4gV2hpbGUgYWRkaW5nIHRoZSBuZXcgVUFQ
SSwgbGV0cyBleHRlbmQgdGhpcyB0byAzMiB0byBtYWtlIGl0IGZ1dHVyZSBwcm9vZi4NClJlZmVy
ZW5jZTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzY0MjU5Mi8/c2Vy
aWVzPTEyOTgxMSZyZXY9NA0KDQorLyoqDQorICogc3RydWN0IGRybV9jb2xvcl9sdXRfMzIgLSBS
ZXByZXNlbnRzIGhpZ2ggcHJlY2lzaW9uIGx1dCB2YWx1ZXMNCisgKg0KKyAqIENyZWF0aW5nIDMy
IGJpdCBwYWxldHRlIGVudHJpZXMgZm9yIGJldHRlciBkYXRhDQorICogcHJlY2lzaW9uLiBUaGlz
IHdpbGwgYmUgcmVxdWlyZWQgZm9yIEhEUiBhbmQNCisgKiBzaW1pbGFyIGNvbG9yIHByb2Nlc3Np
bmcgdXNlY2FzZXMuDQorICovDQorc3RydWN0IGRybV9jb2xvcl9sdXRfMzIgew0KKwkvKg0KKwkg
KiBEYXRhIGZvciBoaWdoIHByZWNpc2lvbiBMVVRzDQorCSAqLw0KKwlfX3UzMiByZWQ7DQorCV9f
dTMyIGdyZWVuOw0KKwlfX3UzMiBibHVlOw0KKwlfX3UzMiByZXNlcnZlZDsNCit9Ow0KDQpSZWdh
cmRzLA0KVW1hIFNoYW5rYXINCg0KPiBTaW1vbg0K
