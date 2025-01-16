Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1DA139FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 13:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FD710E59A;
	Thu, 16 Jan 2025 12:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xln6GTBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53EE10E598;
 Thu, 16 Jan 2025 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737030825; x=1768566825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jkej0LdSoZeV+G5EqxeSAefRVK/JapPd+p0FzDC4fHg=;
 b=Xln6GTBf2ZNzRJkUno8Z8qqk88eaQl43cTm8KQy/aChZTQZMxoo2jKdo
 CUn7r9lRHWKfoaOPBccRlIaZDyqVykCwaG5gEWksN/jXdzdzlxLmI4E8G
 Rt8yvUrmiHaHJUFbfWwMmXra2LdIh7ENKJuWiuEULGc/6gkPcV/bw3Lld
 TTBKYdJ+OhWuvxtclFER3LifH6msQ/o0JRoTwwoBROy0Tt9U91eQZrw79
 wO5S/WBAh45GoPUIcTfSqoEeg3WqGMqAMs7jbfjecbTHA8I/OPtX/NVam
 0uE8JBFyTJrAZCFcw4cBwFrv7FiyiQzIgSMyFcyolaqFC83aIdfPyrUEG A==;
X-CSE-ConnectionGUID: b8y+Sz/wR7m7WiPnhJG9Cg==
X-CSE-MsgGUID: vgx7LrHeR1We8FtsQ6rIEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59892377"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="59892377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:33:39 -0800
X-CSE-ConnectionGUID: p5L5r8MxRZaUX5cBcaAXpQ==
X-CSE-MsgGUID: bSz8/+tSQL2CAaWTjakwSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105332981"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 04:33:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 04:33:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 04:33:38 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 04:33:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7j8UXp23twjlPIz0P34/Dn5qNM0CjVjrjAm3xCkNz4TE4Xozsa7jxei8HF+eNjOJXSvPmBhF9o84LwK99ojFUy4wv/JqgY7LbXW06igZkx7NXCkS/GUCjJYyxarHPxPtXqDLg6GHJqd4o3S6Fm7PFCk9ss0GAjz4mqISJsxkQ5aj4xENzaB79UzvT3oY4IeReamwHmmEs59GCo6kiq+5yyd5n5vD48z0PqRW/tpWUk2ELFoen4p/Gmm4pfj2cPdGGRdCnJYT7PiXlNTPDCMbBpRNw63H5xVGFIJZYNEHLka7TeEF6E1LRRfRrL7OnqkHqSO+BlbMArMxG7JvhH6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkej0LdSoZeV+G5EqxeSAefRVK/JapPd+p0FzDC4fHg=;
 b=QIo4V0fogcDmEJU9nJwV44akHqPd6JKxNrQ9ukH/zya7v2wiFLPTBFce8secSWDqbR7MOgHLU2BJee7hPi5fsj7hhS64X9Dqqfkug0XIG0jk1jzIS2bRPYbvI5CHZpwG0xZSKYxYxknj2/NQgH/coNnrvukecN2sSWH7aRIiLntPyin7pmmqmJmBYjkXSFZ2iWlvcgh7f8ennIfPwGStsGr8fB6Zblu4LXmMkGP3oktDjcPNFi+MqTdUyMSm7J/KUCIkAIF6J9zUyb3sfI7uC3nd1WqMGzmy6cvgomoPyYxXIeYdLslNq6LgQ5ugWJaPQ+SI+J6Fv19wXSTFi1LhBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 12:33:30 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 12:33:30 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Topic: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Index: AQHbYtFEgXOdJTxz0Uatj2h0T3Y1k7MYSSEAgACcqVCAACSXAIAABa/Q
Date: Thu, 16 Jan 2025 12:33:30 +0000
Message-ID: <IA0PR11MB73072FF4CF32A40E670CD9CEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
 <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
 <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJprDgcyZTgz9QX0X51sC=F6ogXsMkDLfbSypH1kSm5hJzg@mail.gmail.com>
In-Reply-To: <CAA8EJprDgcyZTgz9QX0X51sC=F6ogXsMkDLfbSypH1kSm5hJzg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ1PR11MB6203:EE_
x-ms-office365-filtering-correlation-id: 2ea993ea-0f30-424d-cb71-08dd3629fbb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZEprQ1VxOHRORWszSHFZbTQrTkJVMWxES0hqZUxiNURueFN2U3ZPRjB3SWkx?=
 =?utf-8?B?SW9DbTVmUUNPY1ZSVitMajQ1dW55Z0JNdU1vQkx3UmhUOE8zblVQdWtqZVg3?=
 =?utf-8?B?Mi9STnJDd09MNVEwOHNLWjV2VEVKUTVwRStFblN5c2ZBZTNsS2FNQ0llTWha?=
 =?utf-8?B?TFNtQ01vc2luRXA4MU92SlFmUFM1MDFPTjZraTJ4ZU9oRUw2N3pLaExWMllx?=
 =?utf-8?B?czhOZGF4bG9KVEJWK0ExRktxQVBOUGdHVC95ejJVK0YyYnozSHJ6dTdwOVFa?=
 =?utf-8?B?TUh5M1JEaktlSTFDc2dKeFdaZUpTQnZ3MlhPZXI1WEUxdXBRLy9YQVhyeWht?=
 =?utf-8?B?SHlmNGRMTDNnWjVKRGhmMk85UTdQV0ZiR2h0V2lJOVAyWkJnREFrTjNjNHo3?=
 =?utf-8?B?VVcrUUN6MERrYjJob0xXeWkyNGdZQzF0VFVRUE1EK3UyRGZ5SytvRFpJMWZk?=
 =?utf-8?B?VWVlUDNMWk5tRldyN1lBa1NVTlhKblNHdnM1MXNZQVZGMzlTc2g2VTFEYlVl?=
 =?utf-8?B?OTltbXVMVXl0NTBLbEYraFdUOWhXSGZtYnRTRE10UmVrNzd6T0pWNWpGQ1k5?=
 =?utf-8?B?dENldmtuZHJ3SGdiQi94QlpjTnJUdDNHa2p5eG9rSUdkTUZFODN2TmJtK2Zl?=
 =?utf-8?B?NEZwMVRyOXJ6c2JqR25hR0xvVzdSYmk1TmJObUwvb0k4TzJKVGpVKytCT2c4?=
 =?utf-8?B?Tzd2cENlTFlkclpBM1dyL0pqZEV4ZVhSWDZ4UGtXcnpuWnpIMytuQ0RqOUJL?=
 =?utf-8?B?VHJXU3EvaWMwa2F5T0llT2JGRjBpTXkxTUEwVHF3eTBEak5lODZRM2hsYmtw?=
 =?utf-8?B?djBQZVRHTDRwTG9GV0JOdmhZUGU3N2paYmM4Vno2MjNCVDI2MUUybDFBV1Y3?=
 =?utf-8?B?SW1lN0V1VjdseG1wV0tZNXJSMElnRWxCa2dwTExSeTd0R3hOeW5jUDFMQlRG?=
 =?utf-8?B?MnFoZzNxT2NxWXdFeFJETDF4cUZjYjBDZDdSWXNPVG1halA5b3BSdEhMRXhs?=
 =?utf-8?B?WjlPNG9CbDg2bENZYUpTMUhLOTd6MERZTVdxMlQ3SDArb20reEc2eWV4RFFN?=
 =?utf-8?B?YitIYUc0MmRFSjdzbEhxeHdnVTFrLzJtNE9ZRE9CbGlJcGpXMCtYRnduWTdt?=
 =?utf-8?B?VEcvcVN6MmJlVUlGbnRyVXZpbEI0MFpBNSs2NS90c3VKSGRURU9BakVVeVZl?=
 =?utf-8?B?SDdyT1l2SzhlWEM0ZVB1K3JkUG9HMkRyMTRNRXFlNTZyNzVkaU53RlVZdEkw?=
 =?utf-8?B?aFh0Q3VMZ3pOdUV6c2ppeHFQeXh6VXE0Z2VrWVhBRS9EWTY3VVEvNXhFai92?=
 =?utf-8?B?RkZqTXp3Y2lUeE9IWVhiWU55NWt1UVlGMHphdldkYVg1K2s5U3B1cDZkd1V3?=
 =?utf-8?B?Zzd0YjA0eHRrdkdJWk44ZTdlS3FVMmQzc00zWHYrUFQwbWg0WFdjYkVibUR3?=
 =?utf-8?B?SjRVbTZpOG9iUTFqdFVvNVRsbmpyUVh1VXZWL3drZUxiNzFWdUJRbEVQR3lS?=
 =?utf-8?B?dnZ5MGovcG81NERCK0xVRWRKdzgzUVFVSVd1RFM4NFRjQjg5VEswc2NhR0Zh?=
 =?utf-8?B?cENZMDYzOG9jT1NkTXdSMVh4N2lVYmVhUjFady9pVjQrekhOTExlUWkxSk9x?=
 =?utf-8?B?WUdjc2wxMG05VlJsWmorR0IyL3A0eXhvRURMcSt2L2pPc3lCbXM5WHduald3?=
 =?utf-8?B?NzVUa3FLb3NaRzhCSk9vZlFEb01RTmUxSVV1TE9VdkxEVDI3RzRjYkp5YmpC?=
 =?utf-8?B?N0l5bFN4aFZrY1Bja3E5Z3hjd3BYcVZqUTQzTGFORVdHWWRKc3FjSG1tZXZs?=
 =?utf-8?B?bnArUklIMjFXcVB6OE43d3VxT1JmRXJkZW1hQzRva0pSL3hZY0FqMXRnaVQy?=
 =?utf-8?B?SGdWQ01VN1VIL3FlMWhSUUx6YnJyZTBMRG1KODVSM3lKVFFIdDlGMHd2bXho?=
 =?utf-8?Q?oPqxH4+YUMe7kp9hOyvE0NtQSHyLNxSq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzNBOVkxYmxFYlp0clpGNnB5MktmYVM2UE1rbEM3czlSRFNwa2tCbmdKQjFM?=
 =?utf-8?B?VEMvMkRFK2dNbzRqVjVvdWk2Mld6dThRQXNWZldkcTdPRnVaNkw0Q0VQeWQ1?=
 =?utf-8?B?VmhoTGlJdHBZQmMvZ0pxcitjV094U1hKTitkREhhVkJ2ZExBWmZTUUxXajdY?=
 =?utf-8?B?QU5RMkIzWXNCNUJIUG9GM1NwSHhHcTFpTHRxY0M4YnphYm44QnB2cU5yN2dv?=
 =?utf-8?B?T25MUWhjUkV0Y0lsSVNURG10UVN6T2NDdlE1a2hBQTd6a010VXF3WFRycTdm?=
 =?utf-8?B?aWlJbmpiS1ZobGF4MnlYOEJXd3hzUE9vUnp1OGlEVmJLVXB2Wk1GSnpZWEEy?=
 =?utf-8?B?Q2hWTCtaRW9QMHlaMG1ZN28yaTFtNzgxMkdLeUJTaHlpVndYd3NKMXpZRmIz?=
 =?utf-8?B?YTViZW1JOU9oUnhKS0ZadzBXeGgyT3g3UlB0eitMYWhqMDBYRlVzdVpEV3Np?=
 =?utf-8?B?RzBDVEZwZ1FUREFDRjR3QnZBd2RNcW9RS2E2MUNWY3NXY2pickRhVnE5Y3g0?=
 =?utf-8?B?ejFsNzduckZRcld4WE5ERURNWTRXMncwMUZROU1VVzQrMUEyZkFtd0xSTUky?=
 =?utf-8?B?SVpuUC9aQVZWK1o5dkZHdkpEVmYxU3pNK1k1T1V2c3B6bXJZa2ZlMUpMa05K?=
 =?utf-8?B?dm0rb0g5Mmg5K0tGaDFWNi9EYVY4YWEvTzRDaWthL2EwTUZ1RGE4ZmFIaGoz?=
 =?utf-8?B?MzgyTFEyYU9vbVRDRks4YTJiUTRHK1Z4T2tsbSsrS25TSG9MQ3hXdEJ0UDJy?=
 =?utf-8?B?WXlqYmxZZ0VzcFFjdG5WU0tMNXlNcnZZOU1rZmdUWWFVR1lZa3FVMlllcjlv?=
 =?utf-8?B?YlZaUEhxODFpY3Jua2dDNnlOcTEvZ3VIby90RmxIWFF5S3lJSUFGeWM3aHMw?=
 =?utf-8?B?MWo2eFVmK0JlKzRsaHlsUTZESGlCYzBqOWNJSElTaUhEYVBlL210Z3pBK3lW?=
 =?utf-8?B?Wm9jeS9kcW5zbDBnWFRtL1FoaFcxZWtTeTVBOHVlL0tkQXpjL09RcUFHblB1?=
 =?utf-8?B?dWpCSjhCeGgwTWJkcUxiRFhHUzY3YVcydjk4ZTBhRTBBK1RRZ2d6U0dYbCtr?=
 =?utf-8?B?NzhlZmcrUmtyZmNLd0tVVGd2ajZ6RGl0b3FyZ2NOa1AyaVIyQkdqMTB5eEJY?=
 =?utf-8?B?N2Q5RnU5QW9sZkFZN01nSEE4SnBoQkNUWGhsNmtvczYzT2JWU3RBY1dHWFpz?=
 =?utf-8?B?SlBNcnpSUDVJZjVaT2xEN0hFdEkvcElXVElDbG1tTlJBUk82UUVIUHlucStG?=
 =?utf-8?B?dHlSazJSS3dpVWFWdUV3SmllRjdLWU9ZbVE4bjA3U2V6MjRtdm1kM1M2TlhC?=
 =?utf-8?B?SHd3ckZCN212RGtDaUFzMTU4cURmNkRwVmdpK2hmU1pCZlJZVndST0hESUc5?=
 =?utf-8?B?SGVzNTdZdEhGK3lyK1BCcXFnN1hCM3Z2VDI0bEYyektOU1Z5M2MzZEdReHY5?=
 =?utf-8?B?QzFVeWRHT2lLT3NOQTA2QmI4QUU1NVk2b04yeU1VREc1MDhGN2ZDajNoRFN3?=
 =?utf-8?B?KzVJSnFsR1I1SW4xaXBFK25lM3BJNzZtUWdDMkdSbXhhUjRXZE11b0RnTWIy?=
 =?utf-8?B?dUgwVDBKbC9naWFGdExZRDFHb21JSVFnRnh2K1dJQTZZVm9nL29tYmtCdHhI?=
 =?utf-8?B?ek8vYnk1cWxjUlIyeGs4Z1R0THhob1hsemlyekR6ZWRnV0hNNjBDdk5Oa0tw?=
 =?utf-8?B?cWhwckRFZ253cUFyemFOVWk5UThFYmtpUGdvaDEwbWI3anAyNFlEMHhrWUFp?=
 =?utf-8?B?aTFGRWVvQlhYZFpiZ3FXNHhjN0RvMHM3ai9jRFFEai9hV3BEM1UySFptSzRY?=
 =?utf-8?B?V1gxbU8vZnBPZTVnTm1GRjBXMTBrUGQ2eWFEVzMzVlNVSzZ5L1o3YkplUUNj?=
 =?utf-8?B?d1oyWDliSGRIQzN4eWxvYTlubXBzL1Z6S1dSWjlnVjIwN2U3a1VJc2d3MlVi?=
 =?utf-8?B?QWk5R0x5U0ZLQVV0bFR6cnRTT1JpaCtXR2htRTlMQmNaNEpHWUR2cTk0NFNI?=
 =?utf-8?B?azA1b1BlSmp2TEljSHpxaVM2djkzbHBLOUFJVjlQdDBTZksrWjZ2dHZXUWIv?=
 =?utf-8?B?b0hVR3BERzBubHgrV01hc0dWWC9HVlZPUDBFMnFuV016V0NhOERmcFZjSW1I?=
 =?utf-8?B?d2UwQWhtQWszNmhzMktVRmZLMlZnSUQvOU9BVWlqNjM0M0NxRTJLaVZ4Y3V4?=
 =?utf-8?Q?DAyDH7Sdc7nEyBWpFhi3Mmb1B1DIDdsm9TTdHrb3G29W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea993ea-0f30-424d-cb71-08dd3629fbb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 12:33:30.0617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeSOOkbbaeff+LSrA9YjHKjpcvW5Yq9qFU7Ix1UiJnYhWyjQuAhu2UJXLGHilotHbE1TZBTKuGRkOeTS/h8t1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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

PiA+ID4gT24gRnJpLCBKYW4gMTAsIDIwMjUgYXQgMDE6MTU6MzBBTSArMDUzMCwgQXJ1biBSIE11
cnRoeSB3cm90ZToNCj4gPiA+ID4gSW1hZ2VFbmhhbmNlbWVuVChJRVQpIGhhcmR3YXJlIGludGVy
cG9sYXRlcyB0aGUgTFVUIHZhbHVlIHRvDQo+ID4gPiA+IGdlbmVyYXRlIHRoZSBlbmhhbmNlZCBv
dXRwdXQgaW1hZ2UuIExVVCB0YWtlcyBhbiBpbnB1dCB2YWx1ZSwNCj4gPiA+ID4gb3V0cHV0cyBh
IG5ldyB2YWx1ZSBiYXNlZCBvbiB0aGUgZGF0YSB3aXRoaW4gdGhlIExVVC4gMUQgTFVUIGNhbg0K
PiA+ID4gPiByZW1hcCBpbmRpdmlkdWFsIGlucHV0IHZhbHVlcyB0byBuZXcgb3V0cHV0IHZhbHVl
cyBiYXNlZCBvbiB0aGUNCj4gPiA+ID4gTFVUIHNhbXBsZS4gTFVUIGNhbiBiZSBpbnRlcnBvbGF0
ZWQgYnkgdGhlIGhhcmR3YXJlIGJ5IG11bHRpcGxlDQo+ID4gPiA+IG1vZGVzIEV4OiBEaXJlY3Qg
TG9va3VwIExVVCwgTXVsdGlwbGljYXRpdmUgTFVUIGV0YyBUaGUgbGlzdCBvZg0KPiA+ID4gPiBz
dXBwb3J0ZWQgbW9kZSBieSBoYXJkd2FyZSBhbG9uZyB3aXRoIHRoZSBmb3JtYXQoZXhwb25lbnQN
Cj4gPiA+ID4gbWFudGlzc2EpIGlzIGV4cG9zZWQgdG8gdXNlciBieSB0aGUgaWV0X2x1dF9jYXBz
IHByb3BlcnR5LiBNYXhpbXVtDQo+ID4gPiA+IGZvcm1hdCBiZWluZyA4LjI0IGkuZSA4IGV4cG9u
ZW50IGFuZCAyNCBtYW50aXNzYS4NCj4gPiA+ID4gRm9yIGlsbHVzdHJhdGlvbiBhIGhhcmR3YXJl
IHN1cHBvcnRpbmcgMS45IGZvcm1hdCBkZW5vdGVzIHRoaXMgYXMNCj4gPiA+ID4gMHgxMDAwMUZG
LiBJbiBvcmRlciB0byBrbm93IHRoZSBleHBvbmVudCBkbyBhIGJpdHdpc2UgQU5EIHdpdGgNCj4g
PiA+ID4gMHhGMDAwMDAwLiBUaGUgTFVUIHZhbHVlIHRvIGJlIHByb3ZpZGVkIGJ5IHVzZXIgd291
bGQgYmUgYSAxMGJpdA0KPiA+ID4gPiB2YWx1ZSB3aXRoIDEgYml0IGludGVnZXIgYW5kIDkgYml0
IGZyYWN0aW9uYWwgdmFsdWUuDQo+ID4gPiA+DQo+ID4gPiA+IE11bHRpcGxlIGZvcm1hdHMgY2Fu
IGJlIHN1cHBvcnRlZCwgaGVuY2UgcG9pbnRlciBpcyB1c2VkIG92ZXIgaGVyZS4NCj4gPiA+ID4g
VXNlciBjYW4gdGhlbiBwcm92aWRlIHRoZSBMVVQgd2l0aCBhbnkgb25lIG9mIHRoZSBzdXBwb3J0
ZWQgbW9kZXMNCj4gPiA+ID4gaW4gYW55IG9mIHRoZSBzdXBwb3J0ZWQgZm9ybWF0cy4NCj4gPiA+
ID4gVGhlIGVudHJpZXMgaW4gdGhlIExVVCBjYW4gdmFyeSBkZXBlbmRpbmcgb24gdGhlIGhhcmR3
YXJlDQo+ID4gPiA+IGNhcGFiaWxpdHkgd2l0aCBtYXggYmVpbmcgMjU1LiBUaGlzIHdpbGwgYWxz
byBiZSBleHBvc2VkIGFzDQo+ID4gPiA+IGlldF9sdXRfY2FwcyBzbyB1c2VyIGNhbiBnZW5lcmF0
ZSBhIExVVCB3aXRoIHRoZSBzcGVjaWZpZWQgZW50cmllcy4NCj4gPiA+ID4NCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwgNTANCj4gPiA+
ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4gPiA+IGIvaW5jbHVkZS91
YXBpL2RybS9kcm1fbW9kZS5oIGluZGV4DQo+ID4gPiA+DQo+ID4gPg0KPiA3YTcwMzkzODExNDJi
YjVkYmEyNjliZGFlYzQyYzE4YmUzNGUyZDA1Li4wNTZjMmVmZWYxNTg5ODQ4MDM0YWZjMDANCj4g
PiA+IDg5ZjENCj4gPiA+ID4gODM4YzI1NDdiY2Y4IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9k
cm1fbW9kZS5oDQo+ID4gPiA+IEBAIC0xMzY3LDYgKzEzNjcsMTcgQEAgc3RydWN0IGRybV9tb2Rl
X2Nsb3NlZmIgew0KPiA+ID4gPiAgICovDQo+ID4gPiA+ICAjZGVmaW5lIERSTV9NT0RFX0hJU1RP
R1JBTV9IU1ZfTUFYX1JHQiAgICAgICAgICAgICAgICAgICAgICgxIDw8DQo+ID4gPiAwKQ0KPiA+
ID4gPg0KPiA+ID4gPiArLyogTFVUIHZhbHVlcyBhcmUgcG9pbnRzIG9uIGV4cG9uZW50aWFsIGdy
YXBoIHdpdGggeCBheGlzIGFuZA0KPiA+ID4gPiAreS1heGlzDQo+ID4gPiA+ICt5PWYoeCkgKi8N
Cj4gPiA+DQo+ID4gPiBIdWg/DQo+ID4gPg0KPiA+IFRoaXMgZih4KSBjYW4gYmUgdGhlIGFsZ29y
aXRobSBkZWZpbmVkICBieSB0aGUgdXNlciBzcGFjZSBhbGdvcml0aG0gdG8NCj4gPiBnZW5lcmF0
ZSB0aGUgbG9va3VwIHRhYmxlLiBHZW5lcmF0aW9uIG9mIHRoZSBMVVQgdmFsdWUgaXMgbGVmdCB0
byB0aGUgdXNlcg0KPiBzcGFjZSBhbGdvcml0aG0uDQo+ID4gV2hlbiB0aGlzIExVVCB0YWJsZSBp
cyBwYXNzZWQgdG8gdGhlIGhhcmR3YXJlIGl0cyBqdXN0IHNpZ25pZmllcyBob3cNCj4gPiBoYXJk
d2FyZSBzaG91bGQgdXNlIHRoaXMgdGFibGUgdG8gZ2V0IHRoZSBMVVQgdmFsdWUuIEluIHRoaXMg
bW9kZSBpdCdzIGEgZGlyZWN0DQo+IGxvb2t1cCB0YWJsZS4NCj4gDQo+IFlvdXIgZG9jdW1lbnRh
dGlvbiBzaG91bGQgYmUgZGVzY3JpYmluZyB3aGF0IGlzIGV4cGVjdGVkIGZyb20gdGhlIHVzZXJz
cGFjZS4NCj4gV2hhdCBpcyB5LCB4IGFuZCBmKHgpPyBIb3cgaXMgaXQgYmVpbmcgdXNlZD8NCj4g
DQpTdXJlIHdpbGwgYWRkIHRoZSBhYm92ZSBleHBsYW5hdGlvbiBpbiB0aGUgcGF0Y2ggZG9jdW1l
bnRhdGlvbi4NCg0KPiA+DQo+ID4gPiA+ICsjZGVmaW5lIERSTV9NT0RFX0lFVF9MT09LVVBfTFVU
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8DQo+ID4gPiAwKQ0KPiA+ID4NCj4gPiA+
IEFnYWluLCB3aGF0IGlzIHRoZSByZWFzb24gZm9yIGEgc2hpZnQ/IENhbiB0aGVzZSB2YWx1ZXMg
YmUgT1InZD8NCj4gPiA+DQo+ID4gWWVzIGNhbiBiZSBPUidkIHZhbHVlcyBhcyB3ZWxsLg0KPiA+
IExldCBtZSBrbm93IGlmIHRoaXMgaGFzIHRvIGJlIGNoYW5nZWQ/DQo+ID4gSnVzdCBjaG9zZSBi
aXR3aXNlIHNoaWZ0IHRvIGRlbm90ZSB0aGUgbXVsdGlwbGUgbW9kZXMuDQo+IA0KPiBXaGF0IGRv
ZXMgaXQgbWVhbiBpZiBkcm1faWV0XzFkbHV0X3NhbXBsZS5pZXRfbW9kZSBjb250YWlucyBPUiBv
ZiB0d28NCj4gdmFsdWVzPw0KPiANCmlldF9tb2RlIGluIHN0cnVjdCBkcm1faWV0X2NhcHMgY2Fu
IGJlIE9SIG9mIHR3byBzdWNoIG1vZGVzLA0Kd2hpY2ggbWVhbnMgdGhhdCB0aGUgaGFyZHdhcmUg
c3VwcG9ydHMgYm90aCBvZiB0aGUgbW9kZXMuDQpEcm1faWV0XzFkbHV0X3NhbXBsZS5pZXRfbW9k
ZSB0ZWxscyB0aGUgaGFyZHdhcmUgd2hpY2ggaWV0IA0KbW9kZSBpcyB1c2VkIGluIGdlbmVyYXRp
bmcgdGhlIExVVCB2YWx1ZS4gQmVjYXVzZSBoYXJkd2FyZSANCndpbGwgaGF2ZSB0byBpbnRlcnBy
ZXQgdGhlIExVVCB2YWx1ZSBiYXNlZCBvbiB0aGUgbW9kZS4NCg0KPiA+DQo+ID4gPiA+ICsvKg0K
PiA+ID4gPiArICogTFVUIHZhbHVlcywgcG9pbnRzIG9uIG5lZ2F0aXZlIGV4cG9uZW50aWFsIGdy
YXBoIHdpdGggeC1heGlzDQo+ID4gPiA+ICthbmQgeS1heGlzDQo+ID4gPiA+ICsgKiBZID0geS94
IHNvIHVwb24gbXVsdGlwbHlpbmcgeCwgeSBpcyBvYnRhaW5lZCwgaGVuY2UNCj4gPiA+ID4gK211
bHRpcGxpY2F0aXZlLiBUaGUNCj4gPiA+DQo+ID4gPiBDYW4ndCBwYXJzZSB0aGlzIHNlbnRlbmNl
Lg0KPiA+ID4NCj4gPiBXZSBuZWVkIHggYW5kIHkgcG9pbnRzIGluIHRoZSBleHBvbmVudGlhbCBn
cmFwaC4NCj4gPiBGb3IgcmV0cmlldmluZyB0aGUgdmFsdWUgWSBvbiB0aGUgZ3JhcGggdGhlIHZh
bHVlIHBhc3NlZCBieSB0aGUgdXNlcg0KPiA+IGlzIGluIHRoZSBmb3JtYXQgeS94IEluIG9yZGVy
IHRvIGdldCB0aGUgWSBwb2ludHMgb24gdGhlIGdyYXBoIHRoZSB2YWx1ZSBoYXMgdG8NCj4gYmUg
bXVsdGlwbGllZCBieSB4Lg0KPiA+IFRoaXMgaXMgYSBmbG9hdGluZyBwb2ludCB2YWx1ZSB3aGVu
IGNvbXBhcmVkIHdpdGggYW4gaW50ZWdlciB2YWx1ZQ0KPiA+IHdpdGggdGhlIGRpcmVjdCBsb29r
dXAgbW9kZS4NCj4gDQo+IEFnYWluLCB3aGF0IGFyZSB4IGFuZCB5PyBCaW4gaW5kaWNlcz8gUGl4
ZWwgY291bnRzPyBOdW1iZXIgb2YgQ1BVcyBpbiB0aGUNCj4gY3VycmVudCBnZW5lcmF0aW9uPw0K
PiANCkl0IGRlcGVuZHMgb24gdGhlIG1vZGUgZm9yIGRpcmVjdCBsb29rdXAgYm90aCB4IGFuZCB5
IGFyZSBwaXhlbHMgYW5kIGZvcg0KbXVsdGlwbGljYXRpdmUgbW9kZSBYIGNvLW9yZGluYXRlIGlz
IHByb3BvcnRpb25hbCB0byB0aGUgcGl4ZWwgdmFsdWUgYW5kDQp0aGUgWSBjby1vcmRpbmF0ZSBp
cyB0aGUgbXVsdGlwbGllciBmYWN0b3IsIGkuZSBYLWF4aXMgaW4gcGl4ZWxzIGFuZCBZLWF4aXMg
DQppcyBPdXRQaXhlbC9JblBpeGVsDQoNCj4gPg0KPiA+DQo+ID4gPiA+ICsgKiBmb3JtYXQgb2Yg
TFVUIGNhbiBhdCBtYXggYmUgOC4yNCg4aW50ZWdlciAyNCBmcmFjdGlvbmFsKQ0KPiA+ID4gPiAr
IHJlcHJlc2VudGVkIGJ5DQo+ID4gPiA+ICsgKiB1MzIuIERlcGVuZGluZyBvbiB0aGUgaGFyZHdh
cmUgY2FwYWJpbGl0eSBhbmQgZXhwb25lbnQNCj4gPiA+ID4gKyBtYW50aXNzYSBjYW4gYmUNCj4g
PiA+ID4gKyAqIGNob3Nlbi4NCj4gPiA+DQo+ID4gPiBXaGF0IGRvZXMgdGhhdCBtZWFuPyBIb3cg
aXMgaXQgY2hvb3Nlbj8NCj4gPiA+DQo+ID4gVGhlIG1heCB2YWx1ZSB0aGF0IHRoZXNlIGtpbmQg
b2YgMURMVVQgY2FuIGJlIGlzIDguMjQNCj4gDQo+IFdoeT8NCj4gDQozMmJpdCBpcyB0aGUgY29u
dGFpbmVyIGFuZCB3aXRoaW4gdGhpcyBpZiB3ZSBjaG9vc2UgMTYuMTYgdGhlbiBpdCBkb2VzbuKA
mXQNCm1ha2Ugc2Vuc2UgdG8gYm9vc3QgdGhlIHBpeGVsIGJ5IDJeMTYNCkhlbmNlIHNldCBhc2lk
ZSA4IGJpdCBmb3IgaW50ZWdlciAyXjggIHRoZXJlYnkgYm9vc3RpbmcgdGhlIHBpeGVsIGJ5IDI1
NQ0KYW5kIHRoYXTigJlzIGEgaHVnZSBib29zdCBmYWN0b3IuDQpSZW1haW5pbmcgMjQgYml0cyBv
dXQgb2YgdGhlIGNvbnRhaW5lciAzMiBpcyBmcmFjdGlvbmFsIHZhbHVlLiBUaGlzIGlzIHRoZQ0K
b3B0aW1hbCB2YWx1ZSBmb3IgaW1wbGVtZW50aW5nIGluIHRoZSBoYXJkd2FyZSBhcyB3ZWxsIGFz
IHBlciB0aGUNCmhhcmR3YXJlIGRlc2lnbi4NCg0KPiA+IEhhcmR3YXJlIGRlc2lnbiBjYW4gY2hv
b3NlIGFueXRoaW5nIHdpdGhpbiB0aGlzIHJhbmdlLiBUaGlzIGRlcGVuZHMgb24NCj4gPiB0aGUg
YWNjdXJhY3kgcmVxdWlyZWQgYnkgaGFyZHdhcmUga2VlcGluZyBpbiBtaW5kIHRoZSBoYXJkd2Fy
ZSBjb3N0DQo+ID4gZm9yIGltcGxlbWVudGF0aW9uLg0KPiA+IEp1c3QgYSBwcmVjaXNpb24gZm9y
IDMyYml0IHZhbHVlLg0KPiA+DQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gKyNkZWZpbmUgRFJNX01P
REVfSUVUX01VTFRJUExJQ0FUSVZFICAgICAgICAgICAgICAgICAgICAgICAgKDEgPDwgMSkNCj4g
PiA+ID4gKw0KPiA+ID4gPiAgLyoqDQo+ID4gPiA+ICAgKiBzdHJ1Y3QgZHJtX2hpc3RvZ3JhbV9j
YXBzDQo+ID4gPiA+ICAgKg0KPiA+ID4gPiBAQCAtMTQxNCw2ICsxNDI1LDQ1IEBAIHN0cnVjdCBk
cm1faGlzdG9ncmFtIHsNCj4gPiA+ID4gICAgIF9fdTMyIG5yX2VsZW1lbnRzOw0KPiA+ID4gPiAg
fTsNCj4gPiA+ID4NCj4gPiA+ID4gKy8qKg0KPiA+ID4gPiArICogc3RydWN0IGRybV9pZXRfY2Fw
cw0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIEBpZXRfbW9kZTogcGl4ZWwgZmFjdG9yIGVuaGFu
Y2VtZW50IG1vZGVzIGRlZmluZWQgaW4gdGhlIGFib3ZlDQo+ID4gPiA+ICttYWNyb3MNCj4gPiA+
ID4gKyAqIEBpZXRfc2FtcGxlX2Zvcm1hdDogaG9sZHMgdGhlIGFkZHJlc3Mgb2YgYW4gYXJyYXkg
b2YgdTMyIExVVA0KPiA+ID4gPiArc2FtcGxlDQo+ID4gPiBmb3JtYXRzDQo+ID4gPiA+ICsgKiAg
ICAgICAgICAgICAgICBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlIGNhcGFiaWxpdHkuIE1heCBi
ZWluZyA4LjI0DQo+ID4gPiA+ICsgKiAgICAgICAgICAgICAgICBEb2luZyBhIGJpdHdpc2UgQU5E
IHdpbGwgZ2V0IHRoZSBwcmVzZW50IHNhbXBsZS4NCj4gPiA+ID4gKyAqICAgICAgICAgICAgICAg
IEV4OiBmb3IgMSBpbnRlZ2VyIDkgZnJhY3Rpb24gQU5EIHdpdGggMHgxMDAwMUZGDQo+ID4gPg0K
PiA+ID4gPz8gQ2FuIGhhcmR3YXJlIHN1cHBvcnQgMTYuMTY/IDMyLjA/DQo+ID4gPg0KPiA+IE5v
LCBmb3IgYSAxRCBMVVQgbWF4aW11bSBmbG9hdGluZyBudW1iZXIgY2FuIGJlIDguMjQNCj4gDQo+
IFdoeT8gSXMgaXQgYSBsaW1pdGF0aW9uIG9mIHRoZSBJbnRlbCBoYXJkd2FyZSBvciBqdXN0IGEg
cmFuZG9tIEFQSSBjaG9pY2U/DQo+IA0KQXMgZXhwbGFpbmVkIGFib3ZlIHRoaXMgYW4gb3B0aW1h
bCB2YWx1ZSB5aWVsZGluZyB0byBhIGh1Z2UgYm9vc3QgZmFjdG9yIG9mDQoyNTUuOTkuIFRoaXMg
aXMgYXMgcGVyIHRoZSBoYXJkd2FyZSBkZXNpZ24uDQoNCj4gPiBIZW5jZSBoYXJkd2FyZSB3aWxs
IGhhdmUgdG8gYWRoZXJlIHRvIGFueXRoaW5nIHdpdGhpbiB0aGlzIHJhbmdlLg0KPiA+DQo+ID4g
PiA+ICsgKiBAbnJfaWV0X3NhbXBsZV9mb3JtYXRzOiBudW1iZXIgb2YgaWV0X3NhbXBsZV9mb3Jt
c3RzIHN1cHBvcnRlZA0KPiA+ID4gPiArIGJ5DQo+ID4gPiB0aGUNCj4gPiA+ID4gKyAqICAgICAg
ICAgICAgICAgICAgICBoYXJkd2FyZQ0KPiA+ID4gPiArICogQG5yX2lldF9sdXRfZW50cmllczog
bnVtYmVyIG9mIExVVCBlbnRyaWVzICAqLyBzdHJ1Y3QNCj4gPiA+ID4gK2RybV9pZXRfY2FwcyB7
DQo+ID4gPiA+ICsgICBfX3U4IGlldF9tb2RlOw0KPiA+ID4gPiArICAgdTY0IGlldF9zYW1wbGVf
Zm9ybWF0Ow0KPiA+ID4gPiArICAgX191MzIgbnJfaWV0X3NhbXBsZV9mb3JtYXRzOw0KPiA+ID4g
PiArICAgX191MzIgbnJfaWV0X2x1dF9lbnRyaWVzOw0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArLyoqDQo+ID4gPiA+ICsgKiBzdHJ1Y3QgZHJtX2lldF8xZGx1dF9zYW1wbGUNCj4g
PiA+DQo+ID4gPiBJcyBpdCBzdXBwb3NlZCB0byBiZSB1c2VkIHdpdGggRFJNX01PREVfSUVUX01V
TFRJUExJQ0FUSVZFIG9ubHk/IE9yDQo+ID4gPiBpcyBpdCBzdXBwb3NlZCB0byBiZSB1c2VkIHdp
dGggRFJNX01PREVfSUVUX0xPT0tVUF9MVVQ/IEluIHRoZQ0KPiA+ID4gbGF0dGVyIGNhc2Ugd2hh
dCBzaG91bGQgYmUgdGhlIGlldF9mb3JtYXQgdmFsdWU/DQo+ID4gPg0KPiA+IFRoZSBzdHJ1Y3Qg
aWV0XzFkbHV0X3NhbXBsZSB3aWxsIGJlIHVzZWQgZm9yIGFsbCB0aGUgSUVUIG1vZGVzIGkuZQ0K
PiA+IGRpcmVjdCBsb29rdXAgYW5kIG11bHRpcGxpY2F0aXZlLg0KPiA+IFRoZSBlbGVtZW50IGll
dF9zYW1wbGVfZm9ybWF0IHdpbGwgbm90IGJlIGFwcGxpY2FibGUgZm9yIGRpcmVjdA0KPiA+IGxv
b2t1cC4gVGhpcyB3aWxsIGJlIHVzZWQgZm9yIG11bHRpcGxpY2F0aXZlIGFuZCB0aGUgdmFsdWUg
d2hhdCBpdCBjYW4NCj4gPiBob2xkIGZvciBtdWx0aXBsaWNhdGl2ZSBpcyBtZW50aW9uZWQgaW4g
dGhlIGFib3ZlIGRlc2NyaXB0aW9uLg0KPiA+IEkgbWlzc2VkIGFkZGluZyB0aGlzIGluZm8gaW4g
dGhlIGRlc2NyaXB0aW9uLCB3aWxsIGFkZCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPiANCj4g
QW5kIHNvbWUgb3RoZXIgZm9ybWF0cyB3aWxsIGFsc28gcmVxdWlyZSBhZGRpdGlvbmFsIGRhdGEu
IFRoaXMgbXVsdGktZm9ybWF0DQo+IHN0cnVjdHVyZSBzb3VuZHMgYmFkIGZyb20gbXkgUE9WLg0K
PiANCldpbGwgdHJ5IGdlbmVyYWxpemUgdGhpcyBzdHJ1Y3R1cmUgYWNyb3NzIHRoZSBtb2Rlcy4N
Ckl0cyBvbmx5IGZvciBkaXJlY3QgbG9va3VwIG1vZGUgd2Ugd2lsbCBub3QgbmVlZCBhbnkgaWV0
X3NhbXBsZV9mb3JtYXQuDQpGb3Igb3RoZXIgbW9kZXMgc3VjaCBhcyBtdWx0aXBsaWNhdGl2ZSwg
YWRkaXRpdmUgZXRjIHdlIHdpbGwgbmVlZCB0byBtZW50aW9uDQp0aGUgaWV0X3NhbXBsZV9mb3Jt
YXQuDQpUb3AgdmlldyBvZiB0aGlzIExVVCBpcyBqdXN0IGEgbG9va3VwIHRhYmxlIHdoaWNoIHNh
eXMgZm9yIGEgcGFydGljdWxhciBwaXhlbA0KdmFsdWUgaW4gdGhlIExVVCB0YWJsZSwgd2hhdCBp
cyB0aGUgb3V0cHV0IHZhbHVlIGFuZCB0aGlzIG91dHB1dCB2YWx1ZQ0KaXMgdGhlIHBpeGVsIHZh
bHVlIHRoYXQgaXMgcmVwbGFjZWQgaW4gdGhlIGluY29taW5nIGltYWdlLg0KTm93IGdlbmVyYXRp
b24gb2YgdGhpcyBMVVQgY2FuIGJlIGRvbmUgZGlmZmVyZW50IG1ldGhvZHMgcmVmZXJyZWQgdG8g
YXMNCm1vZGVzIG92ZXIgaGVyZS4NClNvIG9uZSB2YXJpYWJsZSB0byBtZW50aW9uIHRoZSB0eXBl
IG9mIG1vZGUgYW5kIG90aGVyIHRvIHNwZWNpZnkgdGhlDQppbnRlcm5hbCBkZXRhaWxzIG9mIHRo
ZSBzZWxlY3RlZCBtb2RlLg0KV2lsbCByZWZyYW1lIGFjY29yZGluZ2x5Lg0KDQpUaGFua3MgYW5k
IFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
