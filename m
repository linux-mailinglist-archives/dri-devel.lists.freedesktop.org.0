Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67DA9E84A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FC210E380;
	Mon, 28 Apr 2025 06:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwiqZo1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9999E10E1E3;
 Mon, 28 Apr 2025 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745822002; x=1777358002;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yGrlzj85CbVXHQrKVw4fMlEvIbVYTk53OUJSjsf6q0c=;
 b=KwiqZo1hf6zHpWc+VYZYSTiHz2Ljx+FhXMXoMCaoHHUV4jm4u6K457qi
 qDRREB4khTj7y5pgYKqo7FrIHbqlPukrV+Amd1tpAVMhnDhvcimm/bqKd
 Z+16a00xbzyCab43IaeWfcpQbvkJZlZcfqcKpWaM9h2xHJCxxSqWuc3r9
 7ZB6alejbnHDRfehQGg8gaweHExg7uRd2xxeIWLImiCgiQeycbIniszRr
 Ma0mD9F4i6dwpJzQmFxpnbKIJHE0gZndlBdnqsSMRRumUZfb5CC0jmJy8
 vM1svqV6Q8mG9k2bgc9MxkbHhxXdH9FeIPUKKPlIbvsIGdm9zD1xA55QG Q==;
X-CSE-ConnectionGUID: fIr5rbPZQyukT0vbSpUSQg==
X-CSE-MsgGUID: LW9jSSNySAuPCu1jyJsBxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="64932037"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="64932037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:33:22 -0700
X-CSE-ConnectionGUID: mbzIcTMYS7eLG2oWPnTgvQ==
X-CSE-MsgGUID: MjR4ubpeRjWhOGgkZFeiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="138241139"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:33:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 23:33:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 23:33:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 23:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9XjO8ZiLEB0GYGqe3MZTPdcgJAG4qZ7RUG6Nf831jM9vLNDfhHXpzZ4Xxb/aIWWTxDNjQmKpjG8W8psLraBbXv2WB2OrS/VexvhvMX8o75GfT7sO9kaPmiQ/3OFLnM+CmyGlvxVZKIZpE1V4o4xBPsASl5gwSOqJ7dbK+BpjdzBJN1HcYrjjfiTV88mG1ZTjy67z2t/EyGbJ7odydLBz0X/9oTdqSTJam/+qdIxT38j+ZnOY4AD1mFcysxXXXtuqmPqvnn+bHNZ9rNZrzWl+soBbhalTEsgEtX/82iFKP8K7cf87vXUwN+CzvvzsgWLSjUR0AbN2QBMXFsMVlSp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGrlzj85CbVXHQrKVw4fMlEvIbVYTk53OUJSjsf6q0c=;
 b=oAP84gNdatMN/5vU3EjMPdxk9VkRCmZY4JmAkP9o1Itha7oxxPTDGV4eqOFmVaGgcF9zHfwM7LpAKd3vAFNfFceee/jVmMIG1dIV6+e2hInUh9LDE07Ik82g3SYKYckyFmNcK5X0F1ZZIEjTxQ4JHG0OBLyBNTilQzYUp4GrvXpHP5/eIF/1F+bFd78zW0T5dXFyd3l4fm8Ia4VvlJmzq+t2TWCoXKKrz/bROjJJtYZmXOtktQRokUnDYIxQzaZUcWv0EFtF+yHWQxL1JCOHW41TZUZr//S94rgcyyv6M80JXgXlKkJdyFHHX09KeRcR19Xj894OByL9QHV3HCGw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 06:32:31 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 06:32:31 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: Re: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link symbol
 cycles
Thread-Topic: [PATCH v7 1/2] drm/display/dp: Export fn to calculate link
 symbol cycles
Thread-Index: AQHbtS3DXP0L+gSwT0uRA0mk8TdaUbO4pEMA
Date: Mon, 28 Apr 2025 06:32:30 +0000
Message-ID: <d4ffaf29e6ef5eba4780a521f09bae668a5b350e.camel@intel.com>
References: <20250424-hblank-v7-0-8b002f1506cc@intel.com>
 <20250424-hblank-v7-1-8b002f1506cc@intel.com>
In-Reply-To: <20250424-hblank-v7-1-8b002f1506cc@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|IA3PR11MB8966:EE_
x-ms-office365-filtering-correlation-id: ed1b04aa-66f7-4071-ea5f-08dd861e741a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bEFLQ2toMllzb1pITS9sb3RzeVl4L1F1c2IwQnZ2Mk1lczl0YjNZUHFEK1Zx?=
 =?utf-8?B?cHFtOE55Tm5rMnkyajF0TlRrdGszVE1xQXJ3YnpMdVpSUkhiWTJyZk92eldv?=
 =?utf-8?B?ZDh1TXlwMUNWZ29zREYvWkZBSHV2VksxbVpwMEs0RnBWTVpwdUdnV29OU2FU?=
 =?utf-8?B?RzhtaC9ERG1ZSTRBL2V1dktuT3NpK3RybFdXQlpIRXptZXNJcmdCbzVmT3g5?=
 =?utf-8?B?L2NZLzF6OHNiZ01BYzV4L3JWc2c3UGczZGVXRnBtcm9McjZYRFhQM09lbWds?=
 =?utf-8?B?ZVpOVmtLUFZYdlI5VUF6Sm4wdnVBVTZuMERFMmNjRXp5aDJWMDhpQVFwaGN6?=
 =?utf-8?B?cy81dVNPWUtMU1I0WEdQOU1aRDFTWmsxZXhIQXpkQ3FmNXdLTVR1eVZ1WFJq?=
 =?utf-8?B?clJveXZjUko0eTF3QlNRNWdvVkxaSHJNemtKRk1PMVNjSjdBNkJhTmcxZlJH?=
 =?utf-8?B?OEZnQUpLVmtQL1dEdHdBcW80VXByVEJJYmhGc011NGJGcDNtQUlvZUdaVnRR?=
 =?utf-8?B?VGF4STRLREJ5R2lockp3TXlWRWlvZUxwbnVXbk5zU2dMQXRuYjlzWkR4eEsz?=
 =?utf-8?B?aDhaRUJUS2ZRWXZrWUQzRmZpdjNHK3FMV21oWWYvc2tiOW5FRmNicjIrK3lZ?=
 =?utf-8?B?b0s5dFdjNjRGK04zSHducmc2YkEwN1hsT2VPSS9vTzhDV0xLSW4xQ3pHYWJY?=
 =?utf-8?B?dWxUakJKUUJTSURWV3JUOHlCcUtxUkU4QjRxY1VQem00TzBPaXZISTJqR3Yr?=
 =?utf-8?B?RElhUlRNREpCZmRZSjJCMHMwdmIzZm4rbVprS0RmeDF5QVd0RkY4UnFHNS9Q?=
 =?utf-8?B?K01VZjZVLzVuaXY0VlJDS3h6dUFVWURNTCtSb3dKZFhLemRkb2NMOTFyeHVt?=
 =?utf-8?B?OFE5TlpwS1Y3bFFZNW5QRktzOExIdUdRWnA5QmZrVVZNRUlxaEVsZkpBSndO?=
 =?utf-8?B?Nk9VSThGdWNVQkc3WnIxd2U0N2I5RlNoZlhVcnA5YlBwODE2NkpHcnJRY25F?=
 =?utf-8?B?MlQ5TFhBSk1FSG5qU2lBQ3VidWN4VHlBaTk5ZFlqdnU4WG5LRXB6SFgrK1pO?=
 =?utf-8?B?OEF0Z1lBM0tVc0dWUVhVSytubCs4bnJMdWhQaWlNNjgzVnR4S0RTMG9sdnUx?=
 =?utf-8?B?MVpzTzJFU2J4WXJkeVRISmlLRzE4S3FBbFNWaXowZ0gvQThGcnRKMWFianhv?=
 =?utf-8?B?UTZhdWtOQXpyOFFDcGljQnZUNjB2THIyS3FQV3NjN3VlKzcrUmxPaER1M00y?=
 =?utf-8?B?dzF6SHNjaWdhTXdqOWdxTEljcHVZVUZ2Y0RsdmZVZjY3a2lSS2pkY0x4UThR?=
 =?utf-8?B?NnlEV3VxTzZDVDJvM1JqVkRXaDE5V0RBNTFTaE1NQ2UzdUdEaUxpV2crNzdv?=
 =?utf-8?B?SGxZaVhnYk0xaHNFM2lSc2F1SWRHa2JvcmpjZnNaMjBoRTZsY2d6OE10MUEy?=
 =?utf-8?B?eWJmd2hrVFFIS3FaUjZObjBQUmlhOC9SUEpBTWlod2orcngwMGUyWE1aRkZl?=
 =?utf-8?B?TEFZbkFyNEpnRGlUZ0FUNnIrenRLTDJTNEZKTUlMTXVscDk1MjFGMlNlODNJ?=
 =?utf-8?B?WXRvMFN1UC95a2RJOUxBZ2VLTThBcVVBK0hVVGdDRVVudnhvZFk4Vmt6Mzg3?=
 =?utf-8?B?VlV5RkIyVkJqTzYrUFJacFBmWjVnS0tQeUczbTM1eE0rZ2NYeTRsZzdReHZS?=
 =?utf-8?B?Z0cwdjBSUmd6cHVvVVdZTXNTK0hHZXBkYkdGckFydk0xR1IzYXZwbjFYeWxN?=
 =?utf-8?B?M2YxTnZZVnhxNlY2RzBJR3EwbVJBVHVoZEtYdjEySFFuSy94NmNQNllXcURY?=
 =?utf-8?B?RzlBb3dMbzAzemVsRkpneUE1aFVGUG91blQ2SWdlVU1ZYTF2YTJodjMzQVlT?=
 =?utf-8?B?L01na1Q2WVNaU2UvYXNhaFRDRFpiVkMydTN5U3FISDVWRWtQb2Q5VEhLNEph?=
 =?utf-8?B?dlRoRW9WbzNuaUJiWjNRWmJ3N0FCSy95K0svd04wTW16R1FwcFFkMTA2YlQr?=
 =?utf-8?Q?I2QBiN/OiIV1VugJftADVEUphgfPXM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjcrRmZ4T3lONDZ4VlRFQzd2eTdGdy9hZDVxNElha2N1VzYrbGNjWEI4M2tx?=
 =?utf-8?B?b0JGRnYvaWpnN1ZXYU5WcXlIMEE0Yzh6OGU5L1NqUVlERzZ6bWRlS0thUWZL?=
 =?utf-8?B?VWVjM1FvRGNpaXI5end3WWczMlJWNDZZQ1NMK1pydTEzcXdNazg3Q0NkcnBR?=
 =?utf-8?B?d01BbzdFTWJyYlRtN3VxZDQ4em9xMmxuSlFCYkhOZm5BRVFRbFdJa252WGRx?=
 =?utf-8?B?ekN5bzByMjZTUFAxTmpOclF1TnczL2VweTJKaEJIOElBSDdQckVlQ3JLbG5F?=
 =?utf-8?B?YnRiRFJWNWYxUm5XOWpuOVIzN2xraFAzR1dITHJ1TEx0azkwN2hJTEJkWmtW?=
 =?utf-8?B?SDg2ZHVsQ2FiSjdhT2JaNndmakdzNWJoUnQ5cTlaTG5aWEFkVHF4L01Lb2N5?=
 =?utf-8?B?UERkT0p2ai92SGdiakhvWGNEQUF0YS9CaDF1MnFtN0YzK2JnZTF6S1Juc0ti?=
 =?utf-8?B?VzhjZVdiYWVUWXpwN28yUDA4ZUNoZHNlU1c0VnkvU2g1RnZLMjBUMnVybnow?=
 =?utf-8?B?eWo3bVVXaUk1MXArelkyNzhBc09wcHJxL28vWjhkbGRaNE13aml5ZFpwZ245?=
 =?utf-8?B?aWNKVG9OTG43VTFXRWlML1RKakcvSDIwNmorc2ZBNWZHNXpDV0RpdUczV0d2?=
 =?utf-8?B?NktjOVordHVvOWh3ZVNGMElvblcvVCthZUtCUmhIMDJFSkFzZzQ4RitLNktP?=
 =?utf-8?B?RW1QSGVXc2pzR0NCZWJ1dGJEWGVpd1haVjk0dWh0S3M4a2l5ZWtTSEszNmtz?=
 =?utf-8?B?bzBGMEpEMlBHcUIzT3dkaUZFYkZUaStWSkNUcTdGdHNzdnpSOG93UkN3dm9n?=
 =?utf-8?B?REgrS2RxbUdCNm5pekJ2VmJRUE1BclhGSnBjRW5HOS9CTTE2aEEzK2JQclJI?=
 =?utf-8?B?ajdmWVJ6UCtaQ3RZTFF6RWZUZUdjRkEzYVJDc1paMmlCSmhXa1J5YlJGYm9u?=
 =?utf-8?B?UlRBRS9sU211OHJtTkRRQ1RwNElidTIyOGtwVjFybG1xRHk0V1l2QXFaSXRk?=
 =?utf-8?B?NHhiSGZ6REI4NnJ0eFk5ZEF5eGl3czd6RGtTdmowTlRXVzh6emViRFNuL01C?=
 =?utf-8?B?RG9KNEZmcnN5NXZwSzBzYURhZnNaUWhKcTdyYjlLcFdzWkZ3QnRRUUtMd0R4?=
 =?utf-8?B?bzZHY0k5NmlmSVowc0gveG1pSEhVWG9aYk5SQjU4S0hXRy9UcVhNc1dFV3pz?=
 =?utf-8?B?c0VqWHJGVWViekFOOHM3cUhIU1pOSllIem5pTU5wVEJCdFcwc0F0NE81K0dC?=
 =?utf-8?B?Qlg1SGFqUkdWQk9Oc0wxb0xiY2ZFbkp3d1hqZmkvMmVBVnpvWUx1eGRLbDE3?=
 =?utf-8?B?dng0ckpXaEZDRDVEYzgyMEdSb1BFRTA1QTUycVE5Slk3R1ptRXJuSTg4bUxS?=
 =?utf-8?B?dkZsSW1BcVlYelRvNGgwc2hMRDdoN3duRFBVdDYrLzBsdjFyTVE2dC9odVAy?=
 =?utf-8?B?c3dheTN6TFUxa2hLbGluVjFnbllBa1Z6cHFtdVlxZmg1NU81b1Rab0w2ZzI1?=
 =?utf-8?B?NklxZkFHMmhnMU40WUNtUStyNU9GekJxcEhWRUVlOWRnc1hTTUlnS2Qvc3Bl?=
 =?utf-8?B?eVMzeEFEdDVhQ0RSZUN2WVFnSHJ5U2xYTy9OczNaTFRjcVRHWExnbW80eXBP?=
 =?utf-8?B?SmVOS1hZcVJOMnplYysxV3V1Z2I2SVAyNlBXMGRIM2dBVElKeGltVm8zcHd6?=
 =?utf-8?B?T0dvVUp0aWFyME9MZGhIbWxOUFc1MGlEUThhWGVBVEoyU0RWS09nNmZOK2tQ?=
 =?utf-8?B?SkQ0YXMzWDVtaGxXa3ZGVThPVkdWdWVDUmw4ZDVpRkZCRGJWYVlTYy8zaUo1?=
 =?utf-8?B?czNCRy82eGI3bHV2Z3dEZHd6R3QrcmlacW4vK0dwS3JWa3VXSytyOTYwclEx?=
 =?utf-8?B?UjZydUNWeEZEa3NLRXhnODg1c001aHVCQUY5NFk1czd2bTNIZ1JsV1FuWEli?=
 =?utf-8?B?RWg3c09uQWE1TnZYdlZqbVdlVk1LUUxwSDVFcmFKKzg3djZpRGNKWWpHT2NS?=
 =?utf-8?B?TjZ6ditiMFIwRXdzUE1KZkRJRjNsSC9SN0xvaXNUemtoaUNpQXk3ZHh4OGNW?=
 =?utf-8?B?a013UlBrWTUzWktsOHo4L1g2eU0vZ1NvV1Zqakg5Z3VIYStYTHhOek9kRHR6?=
 =?utf-8?B?enh1cXBsQ0VjUWcxcUlXWXA5eEYvVkdoNXRpSVJZTGJseDRXdWI3N2J2bWhK?=
 =?utf-8?Q?P/CTyMdz/wyw4PSttDsoM4s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CF2D1D7194A004C8CEF1D565A405659@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1b04aa-66f7-4071-ea5f-08dd861e741a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 06:32:31.0957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85ORGQQlV6Nx8zCmf3SucMHKW2H5Hvs0+fgwkH1GCeaia69AeQ5FZnrOuT1JkPHt05ACnLasigDA25q8K6R7yqtzlUVUAqmtpSusii9clUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
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

T24gVGh1LCAyMDI1LTA0LTI0IGF0IDIwOjQ1ICswNTMwLCBBcnVuIFIgTXVydGh5IHdyb3RlOg0K
PiBVbmlmeSB0aGUgZnVuY3Rpb24gdG8gY2FsY3VsYXRlIHRoZSBsaW5rIHN5bWJvbCBjeWNsZXMg
Zm9yIGJvdGggZHNjIGFuZA0KPiBub24tZHNjIGNhc2UgYW5kIGV4cG9ydCB0aGUgZnVuY3Rpb24g
c28gdGhhdCBpdCBjYW4gYmUgdXNlZCBpbiB0aGUNCj4gcmVzcGVjdGl2ZSBwbGF0Zm9ybSBkaXNw
bGF5IGRyaXZlcnMgZm9yIG90aGVyIGNhbGN1bGF0aW9ucy4NCj4gDQo+IHYyOiB1bmlmeSB0aGUg
Zm4gZm9yIGJvdGggZHNjIGFuZCBub24tZHNjIGNhc2UgKEltcmUpDQo+IHYzOiByZW5hbWUgZHJt
X2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyB0byBkcm1fZHBfbGlua19kYXRhX3N5bWJvbF9jeWNsZXMN
Cj4gwqDCoMKgIHJldGFpbiBzbGljZV9lb2NfY3ljbGVzIGFzIGlzIChJbXJlKQ0KPiB2NDogRXhw
b3NlIG9ubHkgZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcygpIChJbXJlKQ0KPiB2NjogQWRkIHNs
aWNlIHBpeGVscyB3aGljaCB3YXMgcmVtb3ZlZCB1bmtub3dpbmdseSAoVmlub2QpDQo+IA0KPiBS
ZXZpZXdlZC1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIHwgNTIgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tDQo+IMKgaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHBfaGVs
cGVyLmjCoMKgwqDCoCB8wqAgMiArKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KDQpSZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBp
bGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQoNCg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IGluZGV4IDU3ODI4ZjJiN2I1YTA1ODJjYTRhNmYy
YTliZTJkNTkwOWZlOGFkMjQuLjU2YzdlMzMxOGYwMTA3OWMzYmRlNDkyYTIxYzc2ZWQzN2U5NzI0
Y2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmMNCj4gQEAg
LTQzOTMsOCArNDM5Myw5IEBAIEVYUE9SVF9TWU1CT0woZHJtX3BhbmVsX2RwX2F1eF9iYWNrbGln
aHQpOw0KPiDCoCNlbmRpZg0KPiDCoA0KPiDCoC8qIFNlZSBEUCBTdGFuZGFyZCB2Mi4xIDIuNi40
LjQuMS4xLCAyLjguNC40LCAyLjguNyAqLw0KPiAtc3RhdGljIGludCBkcm1fZHBfbGlua19zeW1i
b2xfY3ljbGVzKGludCBsYW5lX2NvdW50LCBpbnQgcGl4ZWxzLCBpbnQgYnBwX3gxNiwNCj4gLQkJ
CQnCoMKgwqDCoCBpbnQgc3ltYm9sX3NpemUsIGJvb2wgaXNfbXN0KQ0KPiArc3RhdGljIGludCBk
cm1fZHBfbGlua19kYXRhX3N5bWJvbF9jeWNsZXMoaW50IGxhbmVfY291bnQsIGludCBwaXhlbHMs
DQo+ICsJCQkJCcKgIGludCBicHBfeDE2LCBpbnQgc3ltYm9sX3NpemUsDQo+ICsJCQkJCcKgIGJv
b2wgaXNfbXN0KQ0KPiDCoHsNCj4gwqAJaW50IGN5Y2xlcyA9IERJVl9ST1VORF9VUChwaXhlbHMg
KiBicHBfeDE2LCAxNiAqIHN5bWJvbF9zaXplICogbGFuZV9jb3VudCk7DQo+IMKgCWludCBhbGln
biA9IGlzX21zdCA/IDQgLyBsYW5lX2NvdW50IDogMTsNCj4gQEAgLTQ0MDIsMjIgKzQ0MDMsNDIg
QEAgc3RhdGljIGludCBkcm1fZHBfbGlua19zeW1ib2xfY3ljbGVzKGludCBsYW5lX2NvdW50LCBp
bnQgcGl4ZWxzLCBpbnQNCj4gYnBwX3gxNiwNCj4gwqAJcmV0dXJuIEFMSUdOKGN5Y2xlcywgYWxp
Z24pOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyBpbnQgZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9j
eWNsZXMoaW50IGxhbmVfY291bnQsIGludCBwaXhlbHMsIGludCBzbGljZV9jb3VudCwNCj4gLQkJ
CQkJIGludCBicHBfeDE2LCBpbnQgc3ltYm9sX3NpemUsIGJvb2wgaXNfbXN0KQ0KPiArLyoqDQo+
ICsgKiBkcm1fZHBfbGlua19zeW1ib2xfY3ljbGVzIC0gY2FsY3VsYXRlIHRoZSBsaW5rIHN5bWJv
bCBjb3VudCB3aXRoL3dpdGhvdXQgZHNjDQo+ICsgKiBAbGFuZV9jb3VudDogRFAgbGluayBsYW5l
IGNvdW50DQo+ICsgKiBAcGl4ZWxzOiBudW1iZXIgb2YgcGl4ZWxzIGluIGEgc2NhbmxpbmUNCj4g
KyAqIEBkc2Nfc2xpY2VfY291bnQ6IG51bWJlciBvZiBzbGljZXMgZm9yIERTQyBvciAnMCcgZm9y
IG5vbi1EU0MNCj4gKyAqIEBicHBfeDE2OiBiaXRzIHBlciBwaXhlbCBpbiAuNCBiaW5hcnkgZml4
ZWQgZm9ybWF0DQo+ICsgKiBAc3ltYm9sX3NpemU6IERQIHN5bWJvbCBzaXplDQo+ICsgKiBAaXNf
bXN0OiAldHJ1ZSBmb3IgTVNUIGFuZCAlZmFsc2UgZm9yIFNTVA0KPiArICoNCj4gKyAqIENhbGN1
bGF0ZSB0aGUgbGluayBzeW1ib2wgY3ljbGVzIGZvciBib3RoIERTQyAoQGRzY19zbGljZV9jb3Vu
dCAhPTApIGFuZA0KPiArICogbm9uLURTQyBjYXNlIChAZHNjX3NsaWNlX2NvdW50ID09IDApIGFu
ZCByZXR1cm4gdGhlIGNvdW50Lg0KPiArICovDQo+ICtpbnQgZHJtX2RwX2xpbmtfc3ltYm9sX2N5
Y2xlcyhpbnQgbGFuZV9jb3VudCwgaW50IHBpeGVscywgaW50IGRzY19zbGljZV9jb3VudCwNCj4g
KwkJCcKgwqDCoMKgwqAgaW50IGJwcF94MTYsIGludCBzeW1ib2xfc2l6ZSwgYm9vbCBpc19tc3Qp
DQo+IMKgew0KPiArCWludCBzbGljZV9jb3VudCA9IGRzY19zbGljZV9jb3VudCA/IDogMTsNCj4g
wqAJaW50IHNsaWNlX3BpeGVscyA9IERJVl9ST1VORF9VUChwaXhlbHMsIHNsaWNlX2NvdW50KTsN
Cj4gLQlpbnQgc2xpY2VfZGF0YV9jeWNsZXMgPSBkcm1fZHBfbGlua19zeW1ib2xfY3ljbGVzKGxh
bmVfY291bnQsIHNsaWNlX3BpeGVscywNCj4gLQkJCQkJCQnCoCBicHBfeDE2LCBzeW1ib2xfc2l6
ZSwgaXNfbXN0KTsNCj4gLQlpbnQgc2xpY2VfZW9jX2N5Y2xlcyA9IGlzX21zdCA/IDQgLyBsYW5l
X2NvdW50IDogMTsNCj4gKwlpbnQgc2xpY2VfZGF0YV9jeWNsZXMgPSBkcm1fZHBfbGlua19kYXRh
X3N5bWJvbF9jeWNsZXMobGFuZV9jb3VudCwNCj4gKwkJCQkJCQnCoMKgwqDCoMKgwqAgc2xpY2Vf
cGl4ZWxzLA0KPiArCQkJCQkJCcKgwqDCoMKgwqDCoCBicHBfeDE2LA0KPiArCQkJCQkJCcKgwqDC
oMKgwqDCoCBzeW1ib2xfc2l6ZSwNCj4gKwkJCQkJCQnCoMKgwqDCoMKgwqAgaXNfbXN0KTsNCj4g
KwlpbnQgc2xpY2VfZW9jX2N5Y2xlcyA9IDA7DQo+ICsNCj4gKwlpZiAoZHNjX3NsaWNlX2NvdW50
KQ0KPiArCQlzbGljZV9lb2NfY3ljbGVzID0gaXNfbXN0ID8gNCAvIGxhbmVfY291bnQgOiAxOw0K
PiDCoA0KPiDCoAlyZXR1cm4gc2xpY2VfY291bnQgKiAoc2xpY2VfZGF0YV9jeWNsZXMgKyBzbGlj
ZV9lb2NfY3ljbGVzKTsNCj4gwqB9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3N5bWJv
bF9jeWNsZXMpOw0KPiDCoA0KPiDCoC8qKg0KPiDCoCAqIGRybV9kcF9id19vdmVyaGVhZCAtIENh
bGN1bGF0ZSB0aGUgQlcgb3ZlcmhlYWQgb2YgYSBEUCBsaW5rIHN0cmVhbQ0KPiDCoCAqIEBsYW5l
X2NvdW50OiBEUCBsaW5rIGxhbmUgY291bnQNCj4gwqAgKiBAaGFjdGl2ZTogcGl4ZWwgY291bnQg
b2YgdGhlIGFjdGl2ZSBwZXJpb2QgaW4gb25lIHNjYW5saW5lIG9mIHRoZSBzdHJlYW0NCj4gLSAq
IEBkc2Nfc2xpY2VfY291bnQ6IERTQyBzbGljZSBjb3VudCBpZiBAZmxhZ3MvRFJNX0RQX0xJTktf
QldfT1ZFUkhFQURfRFNDIGlzIHNldA0KPiArICogQGRzY19zbGljZV9jb3VudDogbnVtYmVyIG9m
IHNsaWNlcyBmb3IgRFNDIG9yICcwJyBmb3Igbm9uLURTQw0KPiDCoCAqIEBicHBfeDE2OiBiaXRz
IHBlciBwaXhlbCBpbiAuNCBiaW5hcnkgZml4ZWQgcG9pbnQNCj4gwqAgKiBAZmxhZ3M6IERSTV9E
UF9PVkVSSEVBRF94IGZsYWdzDQo+IMKgICoNCj4gQEAgLTQ0MzEsNyArNDQ1Miw3IEBAIHN0YXRp
YyBpbnQgZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9jeWNsZXMoaW50IGxhbmVfY291bnQsIGludCBw
aXhlbHMsIGludA0KPiBzbGljZV9jDQo+IMKgICogYXMgd2VsbCBhcyB0aGUgc3RyZWFtJ3MNCj4g
wqAgKiAtIEBoYWN0aXZlIHRpbWluZw0KPiDCoCAqIC0gQGJwcF94MTYgY29sb3IgZGVwdGgNCj4g
LSAqIC0gY29tcHJlc3Npb24gbW9kZSAoQGZsYWdzIC8gJURSTV9EUF9PVkVSSEVBRF9EU0MpLg0K
PiArICogLSBjb21wcmVzc2lvbiBtb2RlIChAZHNjX3NsaWNlX2NvdW50ICE9IDApDQo+IMKgICog
Tm90ZSB0aGF0IHRoaXMgb3ZlcmhlYWQgZG9lc24ndCBhY2NvdW50IGZvciB0aGUgOGIvMTBiLCAx
MjhiLzEzMmINCj4gwqAgKiBjaGFubmVsIGNvZGluZyBlZmZpY2llbmN5LCBmb3IgdGhhdCBzZWUN
Cj4gwqAgKiBAZHJtX2RwX2xpbmtfYndfY2hhbm5lbF9jb2RpbmdfZWZmaWNpZW5jeSgpLg0KPiBA
QCAtNDQ4NiwxNSArNDUwNywxMCBAQCBpbnQgZHJtX2RwX2J3X292ZXJoZWFkKGludCBsYW5lX2Nv
dW50LCBpbnQgaGFjdGl2ZSwNCj4gwqAJV0FSTl9PTigoZmxhZ3MgJiBEUk1fRFBfQldfT1ZFUkhF
QURfVUhCUikgJiYNCj4gwqAJCShmbGFncyAmIERSTV9EUF9CV19PVkVSSEVBRF9GRUMpKTsNCj4g
wqANCj4gLQlpZiAoZmxhZ3MgJiBEUk1fRFBfQldfT1ZFUkhFQURfRFNDKQ0KPiAtCQlzeW1ib2xf
Y3ljbGVzID0gZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9jeWNsZXMobGFuZV9jb3VudCwgaGFjdGl2
ZSwNCj4gLQkJCQkJCQnCoMKgwqDCoMKgIGRzY19zbGljZV9jb3VudCwNCj4gLQkJCQkJCQnCoMKg
wqDCoMKgIGJwcF94MTYsIHN5bWJvbF9zaXplLA0KPiAtCQkJCQkJCcKgwqDCoMKgwqAgaXNfbXN0
KTsNCj4gLQllbHNlDQo+IC0JCXN5bWJvbF9jeWNsZXMgPSBkcm1fZHBfbGlua19zeW1ib2xfY3lj
bGVzKGxhbmVfY291bnQsIGhhY3RpdmUsDQo+IC0JCQkJCQkJwqAgYnBwX3gxNiwgc3ltYm9sX3Np
emUsDQo+IC0JCQkJCQkJwqAgaXNfbXN0KTsNCj4gKwlzeW1ib2xfY3ljbGVzID0gZHJtX2RwX2xp
bmtfc3ltYm9sX2N5Y2xlcyhsYW5lX2NvdW50LCBoYWN0aXZlLA0KPiArCQkJCQkJwqAgZHNjX3Ns
aWNlX2NvdW50LA0KPiArCQkJCQkJwqAgYnBwX3gxNiwgc3ltYm9sX3NpemUsDQo+ICsJCQkJCQnC
oCBpc19tc3QpOw0KPiDCoA0KPiDCoAlyZXR1cm4gRElWX1JPVU5EX1VQX1VMTChtdWxfdTMyX3Uz
MihzeW1ib2xfY3ljbGVzICogc3ltYm9sX3NpemUgKiBsYW5lX2NvdW50LA0KPiDCoAkJCQkJwqDC
oMKgIG92ZXJoZWFkICogMTYpLA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9k
cm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiBp
bmRleCBkOTYxNGUyYzg5Mzk3NTM2ZjQ0YmI3MjU4ZTg5NDYyOGFlMWRjY2M5Li43YjE5MTkyYzcw
MzEzZDY2ZGNlMWI3YmE0MGRkNTljMTRmODBhMTgyIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2Ry
bV9kcF9oZWxwZXIuaA0KPiBAQCAtOTcxLDUgKzk3MSw3IEBAIGludCBkcm1fZHBfYndfY2hhbm5l
bF9jb2RpbmdfZWZmaWNpZW5jeShib29sIGlzX3VoYnIpOw0KPiDCoGludCBkcm1fZHBfbWF4X2Rw
cnhfZGF0YV9yYXRlKGludCBtYXhfbGlua19yYXRlLCBpbnQgbWF4X2xhbmVzKTsNCj4gwqANCj4g
wqBzc2l6ZV90IGRybV9kcF92c2Nfc2RwX3BhY2soY29uc3Qgc3RydWN0IGRybV9kcF92c2Nfc2Rw
ICp2c2MsIHN0cnVjdCBkcF9zZHAgKnNkcCk7DQo+ICtpbnQgZHJtX2RwX2xpbmtfc3ltYm9sX2N5
Y2xlcyhpbnQgbGFuZV9jb3VudCwgaW50IHBpeGVscywgaW50IGRzY19zbGljZV9jb3VudCwNCj4g
KwkJCcKgwqDCoMKgwqAgaW50IGJwcF94MTYsIGludCBzeW1ib2xfc2l6ZSwgYm9vbCBpc19tc3Qp
Ow0KPiDCoA0KPiDCoCNlbmRpZiAvKiBfRFJNX0RQX0hFTFBFUl9IXyAqLw0KPiANCg0K
