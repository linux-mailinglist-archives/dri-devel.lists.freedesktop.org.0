Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1AC9D3262
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 04:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CDB10E6B3;
	Wed, 20 Nov 2024 03:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNFo9shr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A6610E2C7;
 Wed, 20 Nov 2024 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732072005; x=1763608005;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=psu/RvmM+P0Jb0nhzgfMmI4mfE3NiNpz3FIfO00n7Q4=;
 b=ZNFo9shrpUN0bJxwLWkH7DWWtB+OOUXQmhzvBMX3tlcbaaW648icon+L
 /5ghaKhwJ6JXco1K/fGPksm3IxIuo25YnYkvyCrFLKK14Y4OBzFIM2cuX
 MQvWNvXibNmkK35V0zkogFqrzQ9spKEPAcPTGJAVcxEyArQZiCpcnm1v1
 DOwSlPc2LvhH83VzpegIpLfOYxwamHsRBMrP0U5YsnD5i4E6ETUEy9iBM
 9Kd+xIStCTWvJKZAOp2IYzuUyU42e7BObALf/zMLZxmiG8op9vOGd9t/o
 Oj/eaF1hf+o3QTlK5gJ3myPmDbd5xYx/PZv2ubOb8fTAYsVovLzYiQh/B Q==;
X-CSE-ConnectionGUID: UW46x3S7S+itAELn78DlaQ==
X-CSE-MsgGUID: k2tjW+M/Rva4lgw5HTxfXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31511907"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31511907"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 19:06:44 -0800
X-CSE-ConnectionGUID: n0OEfzlxS9+daopH7pgqHA==
X-CSE-MsgGUID: taIEkTZrTzK2X2FErW6JnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89582003"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 19:06:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 19:06:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 19:06:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 19:06:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjjIEJQ8YkZlHh8j4z0K17gooQrTSqA1kpWVDDjN2Q0R37Kt57koe0c5rHfcN2nZzYtC8YWPpHbUtQKdUfg2xG2aMicuaD8A/ddF/nNHhzGq1LvxJRyGkqEGgwkrmY3/6znbroUXBt+0IUnxdEam+K1pbb9qUzxbVfC2moF+1uNrfD4AZFixHE3rIlGZLLmjCH1MXI1glBi7j6A5MZGi8KBH8Fjah96iUfPpSnwZc9GtzM8QA5Z0kopms81PZf/VlYg2YBY40kH1OeIzrwARUuQDIOIn5hbt2pb5dqFHmHLuapHxkmcwAkpegsSApi+XtSJkTRbUX7OSDt31uy2mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nviXOX1gVQdJwurOmUgAiRBElz2CLxltNRn08yQqqp4=;
 b=Gi6P+SjqcZGi/DTTcDrKuntujFH6lyKQAo6Mtqh7TWZs0PR6wuN0GWuChis7ISVSiylink8Me0xUkYJ/VUq5lL7qIdv/e88pSFdkMe4CsLeyZWQOjByOOnxOxLGPLeKCBwcHM62rPCIt2WPU/shi7nXdCkS1S6ceddnF8pCYYihqPwLlfy8Jhka9Ipz5BN5Aiid4ejwRDH2coTg+W3fOWQCRrJ/2dcppX7YkZDST8zy+pcG7Twt1eUcoE9vNucN9PXrKoj7zXR68N1JMLVZ3Zb1bz2TBbnqq+0LiXWCcVQTW61u7B6U9Xf+N0ewuEU3h6XwuS7i3UKoNw99m2rrrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Wed, 20 Nov 2024 03:06:41 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 03:06:41 +0000
Message-ID: <260df86a-d115-49ab-985c-3633b532e30a@intel.com>
Date: Wed, 20 Nov 2024 05:05:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/29] drm/xe: Add SVM device memory mirroring
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-18-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20241016032518.539495-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cd00e2-570c-4194-c304-08dd09105b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEk2d3ZNVTB3aDQ0YkpIS3ZnOHZxT3Q3RjdCNVZpdGR5RnFvQXBDKzZVUjJ4?=
 =?utf-8?B?dXJnU3NySWM4b2p4V0YrVGo2OThCMWFEeDFVNzV4L1JNQzFHeXRENld3T3cx?=
 =?utf-8?B?b0J4ZW5ZN3dBNittbFV1b1BMdDA0QjAzRzFYbXhidVE4dS8ybUNWbFErZkQ4?=
 =?utf-8?B?OXF0MUlhc0ltd3F0aHkzdFIxTmdFQVBxS0p3TVNNM0NoK1k5bGZQUTdNNDhV?=
 =?utf-8?B?ZkNFYnFNZ3lPak1LTVhWaE1MbmordGZ2ZmFFRGd6OC9oYnh5VUZ6YWNCbGlB?=
 =?utf-8?B?NW9QM29SYktQOEhMT0l3dzR5SUU1TVh6N1YzWkZ1WWRqR3FWeVROa000clZD?=
 =?utf-8?B?dkZuZE1WUUV6SEk2cFBReSs3YlNiUWdzYkxRZWh1MkFZS0czYThud2J1STRL?=
 =?utf-8?B?NHhoTngzMFdUOHY3UExYa3RrY3hMWndQK0VUcWRhLzRiQWowallYaWxscXpi?=
 =?utf-8?B?SGNyUDVjenV1ekhRRGo2SkVuVkt3RUl5RkFuR3V3MTRwWnZBdU83TFY5N2Yy?=
 =?utf-8?B?cWQxdkVhZmY0d2FpY0xYeHV1Q0NNTG13VkZpMU9hSHVUYnBaQWpyYTl1eis1?=
 =?utf-8?B?NnI4TWNCWnZ1YVZoeG9MQ21ySnBjSHpScm1yditSWG5UMGJWK0w0VkN5YWVm?=
 =?utf-8?B?OVdxWWcybVF3aHVmcjVMeXRKQ3YxV0wySHgySHViR25OcURIYVQrRTVGdFZx?=
 =?utf-8?B?T2R4SUxMSHFrb3FQcGRxd3VQMnFNTS93ZWZPanNMU3hKeDlMU0JZMTVUTkc0?=
 =?utf-8?B?MmdwWUthWU5vbmpCN1ZNaVhmQWJpWGNaOW1xOEg4OUZJYXIrOHAxZW53REs3?=
 =?utf-8?B?WTNXbmNVZCtzM3hDeWxWZE95NnhaUUdVRVdpMW5UOVYwQm84Yy92ZS8yVkFx?=
 =?utf-8?B?d1JOWmU4UlgyNU43eVV6Y1cvdTUrZUNLb090ZkNBZlYvUGVYbjJ1eGpHZzZm?=
 =?utf-8?B?akRIbjlkU2diaEtsSDRhVEdDS212Zm5CMTJ1M202dFc3VURKVTJaSmxON0xn?=
 =?utf-8?B?bEdPYlFYSTJUQjJZSmwvRXk3REVraWpQVmdWbU9RY0NhTUFNemZCVldXMFR2?=
 =?utf-8?B?TSt4b1IxOTJUdUU1dXZaai9YSEQ0a1JjcXlqNzVFQldJNkJDT0lEVUVYYVEz?=
 =?utf-8?B?UlVEbVpzZ0ZqSFgwWnVtL1AySXpFNnZaRWFpQ0oySndzTlFwcmNOckwydVVG?=
 =?utf-8?B?NWF0SE5hR2VldWVlVmtlc2MwcjAxQ211dXZYL2FnK0RLdWtiR2ZjVDk2R2xu?=
 =?utf-8?B?NmxNZGFnU3FUNG14TXl6R2pXb2FsYjZ1eEhXcXIrWEM0eDJiVFIzUzNmZVdY?=
 =?utf-8?B?NU1UME9TT1BmWU9hK01vTjk4R29mN3JTdVhydHI1OEI0VTBWUDJmb2ZZV1Ay?=
 =?utf-8?B?Si85dkw1U1k0Y3VMeHlzWVhjSUF6UElTMk1ISk9MTDRPZGNSNTFPeUVMa1ds?=
 =?utf-8?B?dllPeUtzeUU0WmVkeVQyZFZqVThiM3ZwSHpjbzlST0VHNmhKcTFvNkFua0w4?=
 =?utf-8?B?YXVpSzRUQm9JaHVUdU5qZklCV2t4TVpFUWl5UjNwOEl6Q3RBR3VKTUwzWk1S?=
 =?utf-8?B?YUFyeGZrQ2JuRmtNdXl5TGk3ZjRDaHQ3dnVBckt4V1Q0aHVOVnVWMUNvVC91?=
 =?utf-8?B?T3QyMEVTRUlHRzNPcG9TRXJxcEt0R2VWV3dsb29WOWp0Mm43aXFYbTNaRVBT?=
 =?utf-8?B?NUcyc3M2L1JLRjNSOFNVSzNselRLQmIzdW9DNDRKQkxDRmM0TW5EL2cxbUZ4?=
 =?utf-8?Q?Hd9DiMI2m5+Zg1XjNJTYwUXXvKLwu10VxG5VKWj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFaM3VLMkRpeW1waHNpUjhVWXNRUmpmKzJRYU9sWXI2V0RNc0FQdnA2ZkxL?=
 =?utf-8?B?M3VQQjRxcyszN3kzeHJUWlZZWlRmRzRRalhUdlZaT3BTdTFOK2pMTjc0VlZs?=
 =?utf-8?B?OXo5ZXlnWG9JOVY5b01rcGhNQjMvWkZZVzNBWUs3T3RNd21URC8rVEp1VVEx?=
 =?utf-8?B?eFhSM3ZhOEhneDIyR0VmSFk0WWIvZkVzNkxFSkF2ZlVsazFqZDBpZjV2SUkz?=
 =?utf-8?B?OGFBTXpzZ3F6REU5N2JNVjhWK0xQZ2RZd3o0bTdYMjNjWXRiQlZFNTdrV0tJ?=
 =?utf-8?B?N1YrTkwrdzdDU1FvTFN3dk9Ia01OSW1mSzNDWk9lNFQ4bmpVNmN0aldwTjlH?=
 =?utf-8?B?K0kvRG1rRWpqZjMxc0txVzBwZGpaYWYwVjcxb0l6UFhtQ2sxdnZpcTNGakNn?=
 =?utf-8?B?S1hXRUFpSkxMcE5IYUxNcXZuaWZkbkRYemFzRWMwRFliM2V1ek9VaHZKRnpm?=
 =?utf-8?B?eWtkc2lDNjRWTlRBRS90Wi9pTTJLMmQxN1NKalA1bnpaa3FQWXdoaVlUTFhu?=
 =?utf-8?B?UU54QVlnb0kvZ3ZxQ3RyRUFOdFpwOUZTN0VwdVFGc21NL1Q4V241dGNhcXJL?=
 =?utf-8?B?aFptcmthUFRuZ3NHb1dnU0xDMU9lUy9reVZ6TzJSYndDWkpocGE4cEZ3YS9y?=
 =?utf-8?B?UmNUSnpXamtPa0lnTWE2QW5VUVdhL1hkbUpRU2dvdCszMEpDK1pHM0srSi9u?=
 =?utf-8?B?bDhZdjc1Q2VZaG9wYk5TMlhOWWJKdmFEN1F5d2MweWxEdm1ub3psWGRZOUdR?=
 =?utf-8?B?VDZDa1pLYnBvZFFrUXNUYkpvU2FWZ0IxeGdGUlNxTWlRbHllM3BSRmhROE54?=
 =?utf-8?B?ZHRCY1ZTd2FWVk5RL2NMK09tODdEUEtMcGhVQktWWFhva3c4cVZlcVN1RXZK?=
 =?utf-8?B?UEJpT1oxNUpwcWV2eUQ3OC9WWUdVZkFGOHp2bGoxbkNIVGhwMElSMUd0UmQr?=
 =?utf-8?B?c1V5bysxN1htU1JOd2FyZmdNOE9nc2pNUzJlUmkzZ282OSsyTUptWEpHQ3BQ?=
 =?utf-8?B?a2xiQ2I0MktiM0xuUlBjREFXcFdUdzBIZ3J1M01pbmZ4Sy93czRQcHNWNm1i?=
 =?utf-8?B?RzZLQ0xMTGloSGRiYkxOTkp4TFduWklQcG03U3M5QzhvaE1Qc0VSWnlOc0Y2?=
 =?utf-8?B?Y3NNQVlQeFNEMThQS0Q5RG5pSitmbGc5U3Z4a3Q0MmNvK1MvaXlHTlB5cnh4?=
 =?utf-8?B?ZkRFWmNHYUEwRzAzMldQak9YZncydzNOUlJoK3cweklzc1hucllJNmRYWUhn?=
 =?utf-8?B?d2x4Nk1maXdyYUoxTGhlcEZOSGhrNm10OUhLZDlraXV6dktrRjNSZkEyT3JE?=
 =?utf-8?B?Rnd0Zm8zOFU0OUhsNW8zV2d6RnU0S0wxU2hDNkNsQTFBb3ByNmRPNUU3MVZ1?=
 =?utf-8?B?aGpwSTVMdm5xOXBqZW9kUUJNenlPMHJ6dkE1dDVtanRESnFlMmJvQUU3b0VP?=
 =?utf-8?B?eE84aTc2MkM4WEMwaVdXMVpMc2hyNHhYM1k5dFduWjJoamtpZHE3VjgyYXN5?=
 =?utf-8?B?clBWT2xxNEV3c2hSeXdCRjU4TW5lQ04rUS9hTDRWY1dmY2MzeDV2eG5YRmll?=
 =?utf-8?B?NDNKbEhNM2FEQThOTU1mSUgwckRXNFZDR0t3MG82MzNibCsxWUw2emV3RDdC?=
 =?utf-8?B?bng2WHlrbWl2TXpUL3FWZ1NXSmppNkZLTjJYL1ZveTBONDJ0MDc3d3k4L1Rv?=
 =?utf-8?B?SmNuNVJ4NkVOSXB3UGFoNGs0SXpEVWlmVzNYbjlNOVVWOWM3a1RHb1ZyeVll?=
 =?utf-8?B?eFJweGU0WWFYRXhaalVuZlcxUGxUZVdXUHhJTFovZU9vaXBJd0J4U3RNV2FN?=
 =?utf-8?B?bzFDMjQ4a1huSTU2c1VwalJSTUh1M0txSmZDUTQ1N3FmWG5hWFZKM0laLzZm?=
 =?utf-8?B?V2MrWHVQMnRpMTAxTVhvZW1OU2NxUnNUTC9FS3gxOGZtKzdMWkVwSXRnVnRw?=
 =?utf-8?B?NG52K3N1SU83ancwcWhqREpIMzNSUUM4RVVjYnhNVGFhaEd0TzdQS0VYWFdK?=
 =?utf-8?B?MytneVNCaHVQUGRRdmNZYjJCSTJtN0Ewb2VGcWRLTS8zOGVOUTdpVEhlSU05?=
 =?utf-8?B?cm5icmoyZDI4NFdEMjVjQ014MUVUeVUvZDU5SElTOWpEMlJ4SU5pK0o1NjRX?=
 =?utf-8?B?MFFGQVNtcmR1YzRDUTh3K25jdVRBTS9MZUt6ek52dloyaHpIZElpM2tYWjNp?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cd00e2-570c-4194-c304-08dd09105b19
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 03:06:41.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkBwDaUvnQDFGIDJ2s2Api9ewOldhK6imENJww73QlInEKnar91YLQ70jOFjTI7B7iZD/Cv3tME5Pckees0fFNcuoykvqGlThlq0DDigWIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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



On 10/16/24 6:25 AM, Matthew Brost wrote:
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region belongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
To use the devm_request_free_mem_region() function, 
CONFIG_GET_FREE_REGION=y in config.
xe's kconfig need to have CONFIG_GET_FREE_REGION dependency.
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> +	mr->pagemap.owner = xe_svm_devm_owner(xe);
> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +		 tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
