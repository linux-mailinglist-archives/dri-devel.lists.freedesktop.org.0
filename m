Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA018A97E1C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 07:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8355310E0D1;
	Wed, 23 Apr 2025 05:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebpULh5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8011910E0D1;
 Wed, 23 Apr 2025 05:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745386626; x=1776922626;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5EzBuELSqUF5r5XA1aUNg8vsMbMYr03NBqNTaucwhIQ=;
 b=ebpULh5tRmOgJVacD9w7bLW+HJiBk5iv2AF5tyFEt8cak1NWlQxws0rX
 hQ8hpGdkwjhB38rvTP6/u7dwY0npJ5mB/hAGlAKI8HoJsWAgDNq1ivfKj
 7ZbgdDtM4ezJ+IzB0ZLOaE26uvvQuNgYroBM1HSai4dZ0VaFMpFpQkNpU
 ysunvTZMKxCklWmCzbtkMGGHAXpTxEZU8/7sMUYpHsXUAtnLhVjynrDn1
 OfHFG4ciQGIR2InZw6IXeO2z1hhx0Mgdnejra71hflOiYQDGeDab5JnM4
 4YNWkjcUXONeWYFQG+4bj0KZ+fTeNw6Jubi8+jXRQ1JkTFyTXiX9JOPA/ g==;
X-CSE-ConnectionGUID: XppfOJI7RNWEi9zb7rpGEg==
X-CSE-MsgGUID: syTqzAzcRO6lSGDr/WPyMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46843482"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46843482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:06 -0700
X-CSE-ConnectionGUID: hQGXxO16St+Gl8jGFFHwvA==
X-CSE-MsgGUID: cnCgriQkRA+bIpWO6N1Alg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="133160061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 22:37:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 22:37:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 22:37:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSEi/0EEOgp2EiqBVt1DAm95QlBqCpnssvENjOPaDO8Y9cQb+edRyfPJLsDyM4c+IDRNoZUmEP3DbYz28MT570u4lGmKenDFJboFaUpDzRjJhcb09zl659mFK4H04RIuivHggc+6+Ir9yRUO+1Z3JA4r0JpTUWa8b9NgGhpqT7pMAdqal0ul4cEV93kBObMT0CuQfy9D8vtJZAqMVrbzWxchhk/8uxFZHaG2RO9fcBh/mVLeNaIoi0FpJT/ol3B0+GEZBjIYWIuWgkEJfQbGEtpo7Dt6XcYlAxkX4jIW3aDbk07I+OjmIV+z2qkIbXTJ75K8WV7cx3kT0NHZ77983Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfSsdShbzYV8WvxUAUCFNcxK7Q2lyBkJ9kWQMaT0Las=;
 b=VZBKB39KocNRDYtu/djroiaEvHuKF5NhCx91LOGyzMgGU1ihv/V6QtizDzYflsdtN62COT2P5X7ZNWvzmbeB7vSak+1FqtPHLgYGE3ea/v6kYxTlvWxtfwtVma3zlKxGx81yYXs/orvzltGo0f6n906TYmM2u1jpyRLQw1pgtESs3WFa6JRgyaq/CBe8wEff+MU0cjTyMA0DzbrzY1+9tUixK+betMcVOoheYm0kqFl3KwIESZ7LGmg3NXvnJeQ+uwrD1GK6VzV8AnRccP7FwqryoeE/Qo+YJhPiVLDnUHLH2F8JNWj55ETU0lMtFuV6zX7zj2p2bxjKOD/fbiF8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 05:36:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 05:36:21 +0000
Message-ID: <800a8b9d-e02b-45bb-acee-95971c11d87a@intel.com>
Date: Wed, 23 Apr 2025 11:06:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/gpusvm: Add timeslicing support to GPU SVM
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250422170415.584662-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: cc47a247-c3e8-4ce2-bc0f-08dd8228c76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXBzRW8rMWJzbGhKK2cxRXRscFZFWEYvVitmMm5maGNtNFBXdUVYeDVuckYy?=
 =?utf-8?B?a1ZoUTI4T3ozOTFyZ00wZDVTZGtMWTMzQWJxSVVEd3BiTjE4UGpLdjd6K2NG?=
 =?utf-8?B?NytuTEU4SDl6azBSMlBieS9raWJRREVwNXVLTXR0T2VqOW9UZEhVMWZjbHRw?=
 =?utf-8?B?ZTZXMUJxQkY2YVZvMnZvSFFVSG1yK0Raa1BkN2NWOFBNUE9vMXV2M2NDSDlC?=
 =?utf-8?B?bkxDa3AvTjVKbG15RXVDSUkreVhLWTlKK09RTlNISWkwbk81ckdkZWNzWGhX?=
 =?utf-8?B?MUNVeUlmVXBVbWtJL0tVbFhUL3VwcnN3UGREaW9CY3hKbU9qMXdQSTJBOW1I?=
 =?utf-8?B?WVpPdE1PVy9MT2hXbkY0a2xMS3FKbkNUM2thZExxOEs5eDBWNU43TUpFbHZx?=
 =?utf-8?B?S2pkcDhGZEFSODZ1RXFDOE9XazExNkVEL3M1QU9IeUpUNTdMMUthRERNVmF4?=
 =?utf-8?B?UkdhcFViTC9nQWFhZ0djNER0eDJNUWVLcm55eU52Sjd5VWJOMTZxZitUNHRN?=
 =?utf-8?B?YUp6dDVaYVF1T0NmL2ptMnVXc0h3enNEYXpOOHZvZE55M2FJK2Q0THV1S3lk?=
 =?utf-8?B?UENUSDVlMjErTkRRTk9LdGl3YTJmZHZkWFBEazVxaDl3bisza3F2RWhXOThY?=
 =?utf-8?B?ZmsxaWczeGxjeDlKYzFpV2djRFF1MG1xc1J6bTJSOHJoN2QreE5oMDJZWlNh?=
 =?utf-8?B?cElreVIyZ05EODZKd2Y0cHgrYmd4eFVqS1JZdWJsOTdMR2NiVFlRSG1nZ09P?=
 =?utf-8?B?V0lobzJzSEc1dDdKT0krd1NNaUlobmo3Z2RBdDFkNEg4WjFKd0dKRElqV080?=
 =?utf-8?B?MTIxZzJwczBldnpxbTRLNVpmWHFtK29PeEJPbVVEN2VUa2hmRHZ3Y25NWXZq?=
 =?utf-8?B?REJXbnpURkVPZEl2aVFaazB3L3pkQWcrOEdhUzRmSVNvS3BQem9uN1I4NlpK?=
 =?utf-8?B?QXI3a240eEtLOWNQellZSTNacElWWjdQa05yKzFWRWo3dHZPT01CMC9IY09o?=
 =?utf-8?B?ZUtubjhhTUFVMEhXSGxNeWRUTHZtU1FObFdBajZKWDkzdFpjeVk1WDVuem03?=
 =?utf-8?B?c3NrMmRvalUrVnJiZFBwVTZrMEhmVllPQW5uamJlLzhFMjhNb3JXczdhak52?=
 =?utf-8?B?aHJWZ3hvU3VLeHo4ck5BUUpkMHo1UXR1cFg5MTdockZneG9oekV5L2xCZE5w?=
 =?utf-8?B?UmhyMXBmbWxwWmpRWVl1Vjg1SjNvc1ovUm9Fa2JzbVBLSHIxYXNIRHZsSzZ0?=
 =?utf-8?B?QXZsanRIbS8yZlQxR1dTdThod0RnYkZZZWl4MmNYbHhXOU9pQXFuZnFsQk9a?=
 =?utf-8?B?NlVoSnFwR1I5SlZLSEtpS0RJVnNKNE1zZlNtQWc5b3NKN3dZSHRSc0hhcDVO?=
 =?utf-8?B?Ty9GdE1XQi9OOUpKU1VSUXJYR3pTZkVYWVMzOFBpUkFaMzBTYzRuV05lOFl4?=
 =?utf-8?B?Q3RBUkdxK09DZUp5aWJRTE8rSFpUbXgzZUJ1RGdDSEx1bVd0aGJKSE9VWEkx?=
 =?utf-8?B?cm9OSlk2T3hjTHE2dWU4UlFjdmJmVEVjUjRHdUpZZW1CZ2ZhaUxKaG54azdB?=
 =?utf-8?B?NzdZRVVyb2RtRThtUDVQZE50QjF0bzY4eTNPWm9LMmNOemg2elBPOS90OXNF?=
 =?utf-8?B?dERSdlVwU3dFUVNwbzFnVFZna3R5cVU5ZkN5WlhmYmhSeVpXdlBkMmUyWlpq?=
 =?utf-8?B?YVo5NlNvOHpkY1RYMFQrL1BUNi9Sb2pPclN1bGlKa0ZITXlnc1orQzNiSHU1?=
 =?utf-8?B?bFF3ZlZpcGU0bzhWeitHUEZjUnk5c0FxR2kxeEdpS2oyT3o4QkFFdVRCTGJt?=
 =?utf-8?B?ajE1U2Y1V2JTN1FMSEFEdW1nL255NjYrTWZKKytFTlA4RDF0WC96WlRJWC9n?=
 =?utf-8?B?Sm5HYTFzM1RCck5oK0JYRFN1d04zbmFESVFQNFJxWnVyNkt4M1FWN3M5WkZm?=
 =?utf-8?Q?EX+/VCE3m10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVMa0xneXBWUWdDWGc0TzEyWUlKK0NwcFAvb08va29nYTIyS3JmTnJtZEVL?=
 =?utf-8?B?dmhOQm9hY21sWDJ3NFk4TFdHais2K3U5djhmTzhpSlV4YWhNRVhycHRNNzZ3?=
 =?utf-8?B?STVQL3lOSDZISjVkbEFMM0JONWpPdW9YVExpQ1VjTk1WZXk3ZWFWcDNzY3VC?=
 =?utf-8?B?TS9SLzVUU3d4UTZxbld6U3k0UHRoUXR4Z3lZY1hXeG43U2RWWkFEbThxcDhj?=
 =?utf-8?B?UldXOXBRaHRxUVNsMnpwdFRoQmRHZC9NemtnaG1kblZGUWU5b2pBdVZ2WU9r?=
 =?utf-8?B?UlcwUDFxcERUYk5YMHc1OTVSM3BMUTFkdDJuZkRvUGVwVzRHWXRzOGF0MEQ5?=
 =?utf-8?B?NzBoRHo2cFVNWm9CNlgwbUVNRVhSbit0WWl0V0JvNG5TV3E3a01zOXJ1WHBp?=
 =?utf-8?B?cFNKRkgxQUJkdE5BUm5qYTVUWXVuV2pub1NKeVZRc2RJeXBGa2xVQzVxUkhF?=
 =?utf-8?B?Yzc1OEFqSFR4TXBqOWZKMWcwKzZ2RFcyTndZeHBZRCsxV3ZneWFHZmwrZ2hr?=
 =?utf-8?B?eVVNTk1GSFFwY3FvWXQ2eERBVUdKd2Vad0trbzdpSmlhY3ZWUmZ0VjVQR3Fm?=
 =?utf-8?B?VVhqRHdENE83aTB6SWFNOFRlZFNOV3JqWWxIaHVFNi8wek54ZkJvOTJLd2dJ?=
 =?utf-8?B?N2ZpbkNSQkZZekZwNHdKbkdzSFppQVdCdThSamFVdGxoMDI1dk8vZzkzbzZV?=
 =?utf-8?B?dUVkblNXWW9zSjBuZ3gwVzNURnRDZFlqNWc3YWYzdytMR1UzWkZURElZNzFT?=
 =?utf-8?B?dFVBZkxlZzkwYmc4bERMRHB3eVFucEtOV1QxczRpYjlaclEwQ2hhSnk4M2dR?=
 =?utf-8?B?WVEvaDIra1NUM3NwM3lFYmRObk9seDYrenhrY0U4ZTJrRHh0ejliU21ENktj?=
 =?utf-8?B?dWc0Zm56ejZHODdtVFliQ1V0OVhiclF3QTlVNUdFcGxZUDR2T0R1TWl2ZW9O?=
 =?utf-8?B?VXJZOFhVeWo1L1E0NHZEajdkbUxudkhmcm42d3gvQjhjMk1mZmgvR0VtY212?=
 =?utf-8?B?VFJhZzArR2IvK2hOeGZma0tzS0Q5dmZpN3gxVWJiZVFqQ3FGdFNlUnVMaGZh?=
 =?utf-8?B?dUdlMU5HWkx1NytPSGN3VGNlWTNnNWIyNFIreUpzMlpYbVk2RENQcDh3WTZm?=
 =?utf-8?B?YXdPUjVKMUt1UzJhMnI0NDlkd0o0YWY1R3QvcGhmTmR2aHJCWUVJdDhRYVdR?=
 =?utf-8?B?enJNRnJZQk1La2Y3S21nd0NEekNzT044YTgyVGxHaE56c3BES04xQjArdlJo?=
 =?utf-8?B?L3pkUlEySmdlWFVUUEtwd3dtYURrWHJ2SlBCaUdYTTFoVElabXVXT0ZnZWF2?=
 =?utf-8?B?STdueUZrQUtlQy81Lzg2QTBHelpSOHpqcFpvNzN6TWIzeVJzQUM3MVdmMUMy?=
 =?utf-8?B?aW9zK1JXWmZ3ZzN1elo1R3JZVjJxWFB3MlpTb2puVnpHODVoUzVFdkxyYmRO?=
 =?utf-8?B?SHhtWU9NMjN2OGVDUjFMN09MMk5ISVB2Q3JuUUc3TmJ0WlhpNjRGd2NXTVRI?=
 =?utf-8?B?aGJwbG5hNmFXNGhaN0M3aitralU0R2pSeTUrUnZWQW9aM1JBZHhTRVEwTTh5?=
 =?utf-8?B?bHVNMXprUlF4YTRDbzZDdVI1N2VEVUJzazdtemEwS0N1WkVGOUZpWHdsTzNC?=
 =?utf-8?B?ZTRrd3pYUGorUnlYNnFPTWN1cVE0WVd5WFNoSEhkaXZTTktQaHJTTWhsZXIy?=
 =?utf-8?B?cDJKbW5HK05MdVpJNngyL2huQU9NT3VYUEtGcm9MYlNxYjNCbWZZUkVoOG8y?=
 =?utf-8?B?a2ZRWVBVYmROd0Zmd2pXTVpuUGh3OUVpRGlURE5OdlVObjk0SU90WW53SmRs?=
 =?utf-8?B?TDVhbEFDTHZlSEJGM05jL1lYcTIyWHdkcENkd2dSNXhsSWJ6SUtsbEI3RGRn?=
 =?utf-8?B?dkdGa1V2cyttRTZ0ekpEZFNPWDFYa0ZCMmVhVUFXQ3ZZOEMrVTYyNlc4S2RN?=
 =?utf-8?B?RXRCQXNoY2hIQ2RkaDFOZ1ZlQTZIT3JDRkJ6VERTUmlCME5tTmd6YWdWaEkr?=
 =?utf-8?B?akM4QlU2ekdvVW1tL2pzSHJITjZVVnVoUTZFZ2lTQzB5ZWVwUkhuUkVuNFcw?=
 =?utf-8?B?TVZzSU9YeUV6dUZOLzFhL2JsRWJ4aGE5ckZYM0hiK1pQN3F5R3FXYnBkMWdx?=
 =?utf-8?B?VC9hRE1FQ0JEL25JdFNZNmJMT3lDRjNZUElHcStURG1uejFBUzhIbmJncEZZ?=
 =?utf-8?Q?cg95CA0Gnb03tP7jBhg1ZrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc47a247-c3e8-4ce2-bc0f-08dd8228c76e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 05:36:21.5964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GOepFeN76AtjtawaOqV0dDNsGhZ+pvP88exyPti6TB/ORaw0w09Ol1/aal/9d2fQKEKdUSJbwYpl5baCfEXXVw1TY5fLkAP7cKOtwBUF/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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



On 22-04-2025 22:34, Matthew Brost wrote:
> Add timeslicing support to GPU SVM which will guarantee the GPU a
> minimum execution time on piece of physical memory before migration back
> to CPU. Intended to implement strict migration policies which require
> memory to be in a certain placement for correct execution.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/drm_gpusvm.c | 9 +++++++++
>   include/drm/drm_gpusvm.h     | 5 +++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index edf107809d20..40a56f38ff8e 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1770,6 +1770,8 @@ int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
>   		goto err_finalize;
>   
>   	/* Upon success bind devmem allocation to range and zdd */
> +	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> +		msecs_to_jiffies(ctx->timeslice_ms);
>   	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
>   
>   err_finalize:
> @@ -1990,6 +1992,13 @@ static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
>   	void *buf;
>   	int i, err = 0;
>   
> +	if (page) {
> +		zdd = page->zone_device_data;
> +		if (time_before64(get_jiffies_64(),
> +				  zdd->devmem_allocation->timeslice_expiration))
> +			return 0;
> +	}
> +
>   	start = ALIGN_DOWN(fault_addr, size);
>   	end = ALIGN(fault_addr + 1, size);
>   
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 9fd25fc880a4..cce217bc136f 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -89,6 +89,7 @@ struct drm_gpusvm_devmem_ops {
>    * @ops: Pointer to the operations structure for GPU SVM device memory
>    * @dpagemap: The struct drm_pagemap of the pages this allocation belongs to.
>    * @size: Size of device memory allocation
> + * @timeslice_expiration: Timeslice expiration in jiffies
>    */
>   struct drm_gpusvm_devmem {
>   	struct device *dev;
> @@ -97,6 +98,7 @@ struct drm_gpusvm_devmem {
>   	const struct drm_gpusvm_devmem_ops *ops;
>   	struct drm_pagemap *dpagemap;
>   	size_t size;
> +	u64 timeslice_expiration;
>   };
>   
>   /**
> @@ -283,6 +285,8 @@ struct drm_gpusvm {
>    * @check_pages_threshold: Check CPU pages for present if chunk is less than or
>    *                         equal to threshold. If not present, reduce chunk
>    *                         size.
> + * @timeslice_ms: The timeslice MS which in minimum time a piece of memory
> + *		  remains with either exclusive GPU or CPU access.
>    * @in_notifier: entering from a MMU notifier
>    * @read_only: operating on read-only memory
>    * @devmem_possible: possible to use device memory
> @@ -292,6 +296,7 @@ struct drm_gpusvm {
>    */
>   struct drm_gpusvm_ctx {
>   	unsigned long check_pages_threshold;
> +	unsigned long timeslice_ms;


LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	unsigned int in_notifier :1;
>   	unsigned int read_only :1;
>   	unsigned int devmem_possible :1;

