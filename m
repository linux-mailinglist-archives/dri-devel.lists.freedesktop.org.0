Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37221C3E686
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 05:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0366A10EA23;
	Fri,  7 Nov 2025 04:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Np0tqqER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AB110E15A;
 Fri,  7 Nov 2025 04:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762488067; x=1794024067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7blTT+nbUUgXnkgwMu1P/hklngs0x8VjmORFbjd1k2g=;
 b=Np0tqqER8408c+BNqTe5Y9Qjsb/LBmP43d5Bje6LOdtxjAvmiWYzhdsZ
 8nuyzb6UJI6RWCMyTzgOS1LVU0/jpTPmjvzTwkbqghanlIsf9rmVPq6Ec
 G2XXqXIsAXzeOW/Z0iUkYmrr1/IC5BYoUBPtiRVJCT9hGsfKPuW+PYMk5
 qHUFjYT5DsBCrmTmgaJxWsWmHK3cROxTCOLCNLXkqKxZw1AByUbM3FAR/
 JX9qwvaoa09FyQmuFVv9HIDRjYJiUOmvSbqXnQmB6nMvRkKLI+IFVTnPB
 4NeFEI0SSkVr1YQHmedvVjHVl3BBP5PHxZZ1Ed/+5L0RCX12OxpyYekXd A==;
X-CSE-ConnectionGUID: 4VIkDIn6Q+WGE10Qdjd4sQ==
X-CSE-MsgGUID: 3HZFzjXTStCP09A1c5ok8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="82041035"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="82041035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 20:00:54 -0800
X-CSE-ConnectionGUID: x0eUhVh8TLubw1v4X6xCWg==
X-CSE-MsgGUID: pvEGRjFnT4+GqJLOCc2D/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="188373916"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 20:00:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 20:00:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 20:00:53 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 20:00:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUByTaIzkpAWf8+x1UbjwOMNf8hnJ0lhCKW9pm/zuTyFUeoTLI4KbmRlc4HwtMgbNDjkUe96FGK7oK4kAnvIfUN/5jfwAXg2wRaB7C4oVcpgY8uUe3KSce8z67dv6kTBASVzZyKWJBkXjUGb2ISx4xtqBjEntTKLuVYnhS0BX9RqOLqSob82gUwZycOBIS06dqEfzZ+OC25V+ZGieqgznEisuxhqCa/+c2IlBdHBxlbPVkrYEY5QVJOsMM87h3GOrnabkmxRA1YvUdLMo3fKvXSX6J1dDla1eynN0rGFzIv7iB9PuoOZQdTzW5GL3CLxO5NfDOjIBpHaxGX4O0wY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7blTT+nbUUgXnkgwMu1P/hklngs0x8VjmORFbjd1k2g=;
 b=vk0DqZNPyn4MbjX8WQga/Bdc8wSrur3/ZB8YbRDHuWvzHwDkmUAQu/XhxOq6qJm1neoAJpEl6Md3FscZKV/ETHvXvpkeqWRG+Mk7XB+QQrwJEzEEYqZb+TF33tCAYledmUoNCffHuIMFie8mFxC67h1jfmuORe4+u+/Qit3sd6RhMmdgbujIh/TvJjO6cbU2OZVdiniiAtNrvpOm0ea4D+3uYx6MnJHXVuMV8s+SGg9eOG371FR8TYm8yYAiLcvotLYkOKL26d5FY1fw2TIhxzeDxfPcGeNUKP5wcv4dxhF1FYHvmGy5biM9csQrR//ogYimbRuGiqslO1nPN6gYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB5128.namprd11.prod.outlook.com
 (2603:10b6:510:39::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 04:00:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 04:00:47 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Topic: [PATCH v2 04/10] drm/i915/alpm: Refactor Auxless wake time
 calculation
Thread-Index: AQHcTRJ7UJT9VeS8HUa3NmcTY0YWYbTmmm+g
Date: Fri, 7 Nov 2025 04:00:47 +0000
Message-ID: <DM3PPF208195D8DA39A8CC8C853DF4CF4FDE3C3A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-5-animesh.manna@intel.com>
In-Reply-To: <20251103220957.1229608-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB5128:EE_
x-ms-office365-filtering-correlation-id: ddd06ac2-2da7-43ce-faf0-08de1db23bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R0J0MUNNeVgrdEc1dm40WWN2WFRORHpyRUNEeEJEVkE5UU1DZW41dDQydmgw?=
 =?utf-8?B?YUpQUWxFR3ZOSnYxUmJ2UmtYdXZ1d2x0UHk2aWJSRDN3VzRKYklYaVBwOUx4?=
 =?utf-8?B?V0w2MGFqbzBlc25jTFRGVDM5Tkgzb1dwSm4wQlBXbHgwcXpKYVhqM1J5YWUy?=
 =?utf-8?B?S0JxN0JGZmZ4RFZDVnBpUXBETzlQQXV1TCtqWUx3YlYxbW1Fak9OOFBVR0tK?=
 =?utf-8?B?cDk4WjUxcmRGSlN1VHcyL01icCtMMm1JNWY2MU52eHk4OFRnTjU0YnRvbXZw?=
 =?utf-8?B?a3VPeUMvTUFjMVZhT2dkQUZlZThwamlHYm1Wd0tpRXB2VS9ZL0M0L3FEdVBV?=
 =?utf-8?B?ZW1saXFCak9oV3E4L1JoL3VjVEczZVN2aExlZzNlQ2hWMmpuWHJaZHkxczE0?=
 =?utf-8?B?d3RSUVBJQzBSeFpKN2pzUlZtZGZOMXNwMUFUaEdab3lQOENoVzBVME5tK1hk?=
 =?utf-8?B?MzJRSkRSUE9xblZpalZxdFFkbXZqNVBFSjRwQXB2OWJTV2JSZ1M1YzFyV1V6?=
 =?utf-8?B?Wlo0RTI1VkhsRUplNXdOL0JkWXNXRGRvOXZIT2NWbUZ2bkU1cE5PNnBIQ2Fz?=
 =?utf-8?B?bFV1VEhiNzc5RVV6TWUvaTR0NlpoRnhCUm1Nekl4dERJeExia08wZUI1VGFQ?=
 =?utf-8?B?T2prS1h6L2RVZGN3VmE3aFJETWhhOCtERGJoT3I3MUwzaXhuQzIyOUEzYlFW?=
 =?utf-8?B?Y2ZxM25EZmpJdlV4VDRDUjYwak1LUHdqUEdNckx4ZzBZUGRhZDRHeFM1VU1F?=
 =?utf-8?B?OFRQSWRFRSsyZWYySVp0d2FUOUliUWFKcmJFUDRHSGVHRjI5LytlUEI3VEdZ?=
 =?utf-8?B?ZWtUTXNsbEp2bzgyWHlTZE1nWEt0MjhaZzJ3Z0YxUS9xRGxNUHZvNlZabnUy?=
 =?utf-8?B?MlMrS21YQTdmUllZWURJK3huQk05QjRpSmx1MFFxaXZFZVdtUlFoQVdVbXlT?=
 =?utf-8?B?VVZONkVGaExEVWNZZlRwN0o1YlFDUjlXWmhSYlN2b1BHRXhZcFpsekZ3MFdZ?=
 =?utf-8?B?R2JudEFnUEtydiswY0FQKyswK2NqcFcxMCtxdG5oTEZscWV6Zmw3SXZBenFO?=
 =?utf-8?B?amt4b1hDajdJbGc4S3g4dzZYcHd5L0dKSGM4cU5CV2VkTmhleHJiaWw3cmho?=
 =?utf-8?B?Vm8wQXpWbXc5QU1lTmZrWk4rM0FNSkhJZTZ6M1laK1Qwc3B5dmd5cCttMTRj?=
 =?utf-8?B?Ykc3MDFEUDgwYzV6SFhaVE94RGFRZk9IL3VIUUJnN2NFNExsTytKU3JDM1Q1?=
 =?utf-8?B?MEw2SDlnbVlrUUpDZUluVCtna0dRQWtpRXNzYVVyMy8vcFhKQzdvcTducE9z?=
 =?utf-8?B?bCthb0JFK0ZWNFU2c1BoQStRQmUxNGtJeldTSVp0U3NiNFpvUUxBdnBFbkQ3?=
 =?utf-8?B?RmRLcDl1MFQvNXYyL29tUkdMVDV6NFRTOWliTFRwT0RiM2hwcnJyUmNwWlpq?=
 =?utf-8?B?VmY2UUdmMDlyY1hCd3hLNkZnSDIzSVY0S0kxd0JTbFpzY1hNRk1wL2dXMGU2?=
 =?utf-8?B?WEI2OUUxSW52amFJS1FpYisxRjVtNHlucGgxY3dSWEcyYzZ1OGwxWTBONGJK?=
 =?utf-8?B?c1Z4eXJGWEt3cXZNdjZwdHR0WUNJVjhSNXVUSlY5VXJ3eldpczk5eld5OERE?=
 =?utf-8?B?ZTIydnVydms3QjVCMllESTNzQzYwWFdiZ2dIOHFBVnNUdG5YMmZQY1JnKzh1?=
 =?utf-8?B?NEJlN1RLc1BGM0lmOHYzUUc2c3hUaXVtZ0plMlNuV0dCSEFuQ2pmMlpCaDRi?=
 =?utf-8?B?aUl2d3gvMGorSE0reE1JcURJVTJrblExRXpuNDN1NmU3ZjJxb3E3bTZaTkZh?=
 =?utf-8?B?RGVFYlNseEtzOHFLT3FBUHVoR1NyVUN3d3FERjhUZmtyRC9TRWptLzB0cS9S?=
 =?utf-8?B?VEJPWmRNak1HUTBsUWkvcU5EdklHMUpTUEZNVGNIVVh4Z3ZwUDRhZ1ljaFRI?=
 =?utf-8?B?bUNxYktFY083Y2E4WWpOVkJJNWRxcEZ3VDNYM1daQ1FQRmhhYVR6OE1Ua0Fv?=
 =?utf-8?B?bWJ3QmtwWGFGZE5vRnROTjdRTWREMHFUTjJEZDQ1UHZpenlVUnpiWUdDODV5?=
 =?utf-8?Q?wz7dyu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtWckt0MnhiUjdRT3czTktvZ09xTHVJYTYyaEF3eUdCUW5lM29xN0VQWDlL?=
 =?utf-8?B?d3ppSkZpeGJXb3cvZW8zUHJTK1BOZ0JUdFVCZGloMEp3NVdEb0V6aEpiTWJ0?=
 =?utf-8?B?YVlpMWlPV2ZxYW5WZ0tqaFFZV2JNNnQxZlF4RFRoMTZiS0RzbDk3ZGV1OC84?=
 =?utf-8?B?NHM5Z003WnU3M0Z5bjZTNDRoZWNOckIrNkNhOTZUVEVjUFlvN0ZKUWNTaU11?=
 =?utf-8?B?TEJaUkJKMTBNR2NoTW1Hc3ZaWXREWWxrK29tMXZQQ0ZJU3hWN1RnTHRFOEl2?=
 =?utf-8?B?K2NSZVBINEVaMlJRSFFGTzdYZWRSMmJlRTUxQS9EUFdzOEQxZzJmYVlCdEVn?=
 =?utf-8?B?MXQybXl5S2hyUldIcFFYc0ZQRWd0Ny9GMVg5M2JMSWQ4WGN0Y0JodEhRcERq?=
 =?utf-8?B?ZzkzL1dmcW1zdjNkREFjSjJjYVZaWUgvTU43bHZxQkQ5RFlHWW1Mc25Gb0R4?=
 =?utf-8?B?cmV3Mk85UVRBWi84SHc1VnJOK1BvbWd3N3RHbDAzT0c2aTBiOE9GdkwzQkZr?=
 =?utf-8?B?RnY5WXkzc1RHU0tpbkZkYWFyNytNd3EvaURXYVoyTWZuM21RcHlNTlRwNGlY?=
 =?utf-8?B?ZjZHUTArQzNHNmNDNzlPTGVSVjBVOVNrM1hlRml0aVJBc1owSkM4U2JlaFcr?=
 =?utf-8?B?MzlBcW9Nbk1GNFI5VWZHeTFpSWxmemR5ZGswWE1sNHorZ2svR0tEWnVTZHdo?=
 =?utf-8?B?TmVtMS9RWlQ0elI2ay81amorL0ZibVBuaU1qZklncE92RTR4YTVJWnAxT2I1?=
 =?utf-8?B?NUNGbkE0NDVDYktIYnYwbVJUTWVZUnYwMmljcitEeitJNXNJcmZHWXBlZXI4?=
 =?utf-8?B?Zi9DWWwwOGszeGpqUU9nc2N1MDJTK2JqTTl5V1VDZFk4NlM5clRqMUEzYVVw?=
 =?utf-8?B?VTBrTUhtTzV0R0JPRGhRa0RSZXFOUW1rdm9KcEM0UU9mbFN6b2VxSzdTeFMx?=
 =?utf-8?B?b1Y2dWJpd2Rub1BCSU5lQmRlbTZrc1huK3pzaG84TjFQSmRIZEdiZlE2WWxB?=
 =?utf-8?B?SzZJK1R3aFZackMvY2U0d2FCaHNkL1dSZ0UzY2x4OEJSTXUrNnQ5VDJ6SlJE?=
 =?utf-8?B?WmNNL3NpTlNrd2xJQktlclhPZTcvbmV0TzdzWVNMek1UMjRpY2FncnpjSUZD?=
 =?utf-8?B?c3RYb2I4MXhmNnhIOW5GZnJFcXpicVdyVGFEb0hWOHJsbDZkeVRzR2RKenJJ?=
 =?utf-8?B?SE1ueXJ4RFlmV1UrZWtPVkZRa2VoeVg1ZTlrdm5uMDdXbnBVZUgzUXpCS0Rs?=
 =?utf-8?B?WFdpMEc3cm9rUnFEZGtPaXZsbmZ2VmJzMENnYTZMYjlFeDh4MmdlUU4rdVdo?=
 =?utf-8?B?OURHVkcwQVhrcHpva1lGS0Zoand6UGNvYmViR2JNd2pBVnZYR1pvMkhaZWJ3?=
 =?utf-8?B?NFd0ZlBNQ29nQ3ZiRGs3cGxYVEhRRVdCSGcwYTFwM21TSlVjbFdIR0QyMy8z?=
 =?utf-8?B?UzErRnQwSU1YYW56SHRvcWFLZWo2RXNlS3pGbnB3cFU2TTEveHVWMWRta1NN?=
 =?utf-8?B?d3dlSjNCSjAvZXhYUzBZSGFNdjVWYk95VVVhQ21RaU81amtsY09ZRTVCRG5N?=
 =?utf-8?B?WGk3cnZHVDVhWTFPbFNLK3BwdzljTC9YODNDRktkNWVRLzBrK09xTWF5N1NH?=
 =?utf-8?B?RkpUdmdvSmUyZW9GalptWW84U1pLcG8rdXpxRXpBcDNwRkRYa3BNRERCU0hi?=
 =?utf-8?B?b2U0Uy9YWGt1MGxVM2tySExUS2EvWm9ZZ3NBSFc3RHNTS3ZjYXhWQkZqVFFW?=
 =?utf-8?B?ZzdoWGl0NFdOZHZrd3dMQUZIM1VGQkMzcWFjL05mYjhEdUVXUERITXJxcUkx?=
 =?utf-8?B?RnFid01rYXpnbG1DaWo1NVkyeXNNQU5MQkxlM0Y0N0VNeHh6anZPWWxBV1lZ?=
 =?utf-8?B?QktCUzJFekFObE1MNk0yWUoreXR4SFRZSndqUGROY0k4dmdBd01JSTlCankr?=
 =?utf-8?B?RTJ1cDV1U2JQR3pDZGlQa2Nvb2swSlBWcUNMMHljZ3o4N3gyKzBRVWZ2VjIz?=
 =?utf-8?B?YzB3Q3VXNEtkR0QwT0doNEV5RVJQZ2kxQi9uZkp0SWlVTG5tNmU4MlJBbWEz?=
 =?utf-8?B?cVpQek81YzVzRHJ4Qm5CdU1TeDZhTU45S1A3VUY4YTJRT1liemwvdWhDMmI4?=
 =?utf-8?Q?lyewoCCOQFq8Kc9poOfpa2ZuD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd06ac2-2da7-43ce-faf0-08de1db23bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 04:00:47.6893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/0NZEGDbH3nlUhn7+c6R7vEXHH/o3QE2uvdcb4eqkQIoqZBcjIeuewzHJ937TTBEASYVGrnExnXbLhbhg4y6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDQvMTBdIGRybS9pOTE1L2FscG06IFJlZmFjdG9yIEF1eGxl
c3Mgd2FrZSB0aW1lDQo+IGNhbGN1bGF0aW9uDQo+IA0KPiBEaXZpZGUgdGhlIGF1eGxlc3Mgd2Fr
ZSB0aW1lIGNhbGN1bGF0aW9uIGluIHBhcnRzIHdoaWNoIHdpbGwgaGVscCBsYXRlciB0byBhZGQN
Cj4gWGUzcCByZWxhdGVkIG1vZGlmaWNhdGlvbi4NCj4gDQo+IHYxOiBJbml0aWFsIHZlcnNpb24u
DQoNCk5vIG5lZWQgZm9yIHRoaXMgeW91IGNhbiBzdGFydCBvZmYgd2l0aCB2MiBkaXJlY3RseQ0K
U2FtZSBmb3IgYWxsIHBhdGNoZXMgd2hlcmUgdGhpcyBoYXMgb2NjdXJlZA0KDQo+IHYyOiBSZWZh
Y3RvciBmaXJzdCBleGlzdGluZyBjYWxjdWxhdGlvbi4gW0phbmldDQo+IA0KDQpBZGQgQnNwZWMg
bGluaw0KDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMgfCAz
NyArKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmMNCj4gaW5kZXggNzc5NzE4ZDBjOGRkLi44ZDA3NDU1YTYyYzIgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IEBAIC04
NSw2ICs4NSwyNiBAQCBzdGF0aWMgaW50IGdldF9sZnBzX2hhbGZfY3ljbGVfY2xvY2tzKGNvbnN0
IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiAgCQkxMDAwIC8gKDIg
KiBMRlBTX0NZQ0xFX0NPVU5UKTsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IGdldF90cGh5Ml9w
Ml90b19wMChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKSB7DQo+ICsJcmV0dXJuIDEyICogMTAw
MDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2Qoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gKwkJCQkgICAgY29uc3Qgc3RydWN0IGludGVsX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUpIHsNCj4gKwlpbnQgcG9ydF9jbG9jayA9IGNydGNfc3RhdGUt
PnBvcnRfY2xvY2s7DQo+ICsJaW50IHQxID0gNTAgKiAxMDAwOw0KPiArCWludCB0cHM0ID0gKDI1
MiAqIDEwKTsNCg0KV2hlcmUgZGlkIHRoaXMgKiAxMCBjb21lIGZyb20/DQoNCj4gKwlsb25nIHRt
bF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIHBvcnRfY2xvY2sgLyAxMDsNCg0KV2h5
IHRoZSBleHRyYSAvMTAgcmVxdWlyZWQgaGVyZSBhbHNvIGlmIHlvdSBoYWQgbm90IG11bHRpcGxp
ZWQgdHBzNCB3aXRoIDEwIHRoZW4gdGhpcyB3b3VsZG4ndCBiZSByZXF1aXJlZA0KWW91IGFsc28g
cmVtb3ZlZCB0aGUgY29tbWVudCB0ZWxsaW5nIHVzIHBvcnRjbG9jayBuZWVkIHRvIGJlIGluIDEw
S2Ivcw0KDQo+ICsJaW50IHRjZHMsIGVzdGFibGlzaG1lbnRfcGVyaW9kOw0KPiArDQo+ICsJdGNk
cyA9ICg3ICsgRElWX1JPVU5EX1VQKDY1MDAsIHRtbF9waHlfbG9jaykgKyAxKSAqIHRtbF9waHlf
bG9jazsNCj4gKwllc3RhYmxpc2htZW50X3BlcmlvZCA9IChTSUxFTkNFX1BFUklPRF9USU1FICsg
dDEgKyB0Y2RzKTsNCj4gKw0KPiArCXJldHVybiBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gK30N
Cj4gKw0KPiAgLyoNCj4gICAqIEFVWC1MZXNzIFdha2UgVGltZSA9IENFSUxJTkcoICgoUEhZIFAy
IHRvIFAwKSArIHRMRlBTX1BlcmlvZCwgTWF4Kw0KPiAgICogdFNpbGVuY2UsIE1heCsgdFBIWSBF
c3RhYmxpc2htZW50ICsgdENEUykgLyB0bGluZSkgQEAgLTEwNCwxOSArMTI0LDE0DQo+IEBAIHN0
YXRpYyBpbnQgZ2V0X2xmcHNfaGFsZl9jeWNsZV9jbG9ja3MoY29uc3Qgc3RydWN0IGludGVsX2Ny
dGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICAgKiB0TUxfUEhZX0xPQ0sgPSBUUFM0IExlbmd0
aCAqICggMTAgLyAoTGluayBSYXRlIGluIE1IeikgKQ0KPiAgICogVFBTNCBMZW5ndGggPSAyNTIg
U3ltYm9scw0KPiAgICovDQo+IC1zdGF0aWMgaW50IF9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtl
X3RpbWUoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICtz
dGF0aWMgaW50IF9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCwNCj4gKwkJCQkJICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCg0K
SSBkb27igJl0IHNlZSBhbnkganVzdGlmaWVkIHJlYXNvbiB0byBzZW5kIGludGVsX2RwIGhlcmUN
Cg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiAqY3J0Y19zdGF0ZSkNCj4gIHsNCj4gLQlp
bnQgdHBoeTJfcDJfdG9fcDAgPSAxMiAqIDEwMDA7DQo+IC0JaW50IHQxID0gNTAgKiAxMDAwOw0K
PiAtCWludCB0cHM0ID0gMjUyOw0KPiAtCS8qIHBvcnRfY2xvY2sgaXMgbGluayByYXRlIGluIDEw
a2JpdC9zIHVuaXRzICovDQo+IC0JaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBz
NCAvIGNydGNfc3RhdGUtPnBvcnRfY2xvY2s7DQo+IC0JaW50IG51bV9tbF9waHlfbG9jayA9IDcg
KyBESVZfUk9VTkRfVVAoNjUwMCwgdG1sX3BoeV9sb2NrKSArIDE7DQo+IC0JaW50IHQyID0gbnVt
X21sX3BoeV9sb2NrICogdG1sX3BoeV9sb2NrOw0KPiAtCWludCB0Y2RzID0gMSAqIHQyOw0KPiAr
CWludCB0cGh5Ml9wMl90b19wMCA9IGdldF90cGh5Ml9wMl90b19wMChpbnRlbF9kcCk7DQo+ICsJ
aW50IGVzdGFibGlzaG1lbnRfcGVyaW9kID0gZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGludGVs
X2RwLA0KPiArY3J0Y19zdGF0ZSk7DQo+IA0KPiAgCXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJf
cDJfdG9fcDAgKw0KPiBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNfc3RhdGUpICsNCj4gLQkJCSAg
ICBTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y2RzLCAxMDAwKTsNCj4gKwkJCSAgICBlc3Rh
Ymxpc2htZW50X3BlcmlvZCwgMTAwMCk7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGludA0KPiBAQCAt
MTI4LDcgKzE0Myw3IEBAIF9sbmxfY29tcHV0ZV9hdXhfbGVzc19hbHBtX3BhcmFtcyhzdHJ1Y3Qg
aW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiAgCQlsZnBzX2hhbGZfY3ljbGU7DQo+IA0KPiAgCWF1
eF9sZXNzX3dha2VfdGltZSA9DQo+IC0JCV9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUo
Y3J0Y19zdGF0ZSk7DQo+ICsJCV9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoaW50ZWxf
ZHAsIGNydGNfc3RhdGUpOw0KPiAgCWF1eF9sZXNzX3dha2VfbGluZXMgPSBpbnRlbF91c2Vjc190
b19zY2FubGluZXMoJmNydGNfc3RhdGUtDQo+ID5ody5hZGp1c3RlZF9tb2RlLA0KPiAgCQkJCQkJ
ICAgICAgIGF1eF9sZXNzX3dha2VfdGltZSk7DQo+ICAJc2lsZW5jZV9wZXJpb2QgPSBnZXRfc2ls
ZW5jZV9wZXJpb2Rfc3ltYm9scyhjcnRjX3N0YXRlKTsNCj4gLS0NCj4gMi4yOS4wDQoNCg==
