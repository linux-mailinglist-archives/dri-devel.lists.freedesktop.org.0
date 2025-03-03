Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA85A4B88D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 08:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3510E215;
	Mon,  3 Mar 2025 07:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBdCMP2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE4910E215;
 Mon,  3 Mar 2025 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988246; x=1772524246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35zKjd+2yYJ4A8Ah4RDJMmKXHjdj8npyUZODaJYkFT8=;
 b=oBdCMP2VNztOPW0/XLgkcjgCTVp2GeyRob2Z9Lcu2PWz48xNz+yWLfGL
 OeHxcJWa9zhpghRN++8sjjK6tC6o72NVrn9QC3P+VQCaWXhySr40U7NG6
 EY5kPwH+a3lC6sS+C6x6BtcpjQYNuI2gj72TWX2aRldzmttlfVz7c379J
 5ChYGAAPhrt/ZyK/5B0m7556rC26rDWp7FrXI4CA3gzm+CfsxnwiFAOLP
 i7maYAyyfDK80+N62oenZkKX5JyX8XZaQUwWdypGc6zukdzy2UpMr+Jvk
 4QO3M/AQhJ/5syr+Oz1Gt2Pc/heK7F5sN9sDZlxJKmN0YlJLGvOv34uM7 Q==;
X-CSE-ConnectionGUID: OlIemkZmTnyoCUQ2SX8RmQ==
X-CSE-MsgGUID: uaizzRd3R6Cq6428O7OaKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41974384"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41974384"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:50:45 -0800
X-CSE-ConnectionGUID: kAYXoUW9QGKT3e/i9LAv6w==
X-CSE-MsgGUID: SV68x/TwTuSiV+DnCPPXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="118414623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:50:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 2 Mar 2025 23:50:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 23:50:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 23:50:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb9HTw24q327Vh66g+dAMcqntZITZor5PE22tD2wOOhKg87vYEpQ4ZMCMdEmEcQWymV8LFUhHuSgAulxUCDpGq3WYmbmSi+bQwoFp8IRCJKksA1BBwiBw+/kzY+ljGqB6TcQhzs8mXBd9AGPfTpc94dNdFilj6dEiKZtgVseJLkIaLfuRlJ6Vpr7gg0gtm8vt+iwOeLNKuqmNt4hu2FlWlePzqy0SPZVh6n6mBEumBXXvVLGEbhOlqlGVOAHxn5AYw6311kSq1ClSXNqYsf6G+oOTlzIzgjx/ck+2+wDyQgcrPg7XwGkcgIuwrdR7vVHc5FZkKBTilEWz5X0JwGY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQnht491t4k8uNyRUewffPTjN5RkbqUAe9ronLD6j5Y=;
 b=Mh+/agLUPT30Ab3Dnu88J752QnsHyQfAPcqhQHEixlfxr0GaTUueeLqTlXkcUG+p3dz3YZup3AbNGLq5/DOJKzJbXHqZxm2qPOMceBfpkhNR9WqSHqXuLVPm9xWKAxBjl4NgvQ2IGkgtNa+RVqEELYPBTR0F4PzQr8ZJV/hcNFIzAkWPLaj0FIyshVWIogfJeLz6m7YqmUZW+nkuauyS9cvO3ViPPYjXW+gTZPTsy59TXlt/GJoeENgd8I4S4Z8AzqXp1ZCU3ahbRkhZk7pANKDsBjCRso2guBorBG3c547imnqERNeslRrSQjMIXr7r2CCTqlb3KRI3eidTGOzOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 07:50:39 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 07:50:39 +0000
Message-ID: <ff5cce67-cbbb-48ea-9e44-22fd859ba16f@intel.com>
Date: Mon, 3 Mar 2025 13:20:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Simona Vetter <simona.vetter@ffwll.ch>, Pekka Paalanen
 <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <Z7NxOVfgvvBt_sj3@phenom.ffwll.local> <Z7XdTfEgMlW4wrm8@phenom.ffwll.local>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <Z7XdTfEgMlW4wrm8@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 148e29a9-e74d-4309-fb69-08dd5a28172f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTZwUlhuSzZCUHRrVU5vVm05ZXNlWVFrRzRYYzZjZDk4amdiOG5Rc2pNVVIw?=
 =?utf-8?B?OXhUeHpGOVY3dmY4SWpTUXZHcEVZcU1nUmFwY1FHUmM3a1FRaS9xekNFRStX?=
 =?utf-8?B?c3JTL2hsY3ZZWTRxREt0OVJIR3JGSkoySWphbHFLUDE0MVFOQjBxNVhkdHhT?=
 =?utf-8?B?TjM1elNjVTh4dGhXb3lLQUNxb3JDU0FCdTUzVjhUaDAvdmRQdWZsNWJQMEly?=
 =?utf-8?B?UWVGcWtTRnJLcnc0QUpiQkNUcWFYZTRuOWl5OEh6b0JOOGdpVzZlMSswRVdB?=
 =?utf-8?B?d2Rna0tJeTF0TUdlUHNvUWhtQUdWRjBCSndNdmtSbGRoMkFydll1d2lyQ3hM?=
 =?utf-8?B?RTBwaG1ZSndEK2VOYU1uU3FSSWNxR3NHd1dBOFNWSS9KSDF2d015enF1RkxN?=
 =?utf-8?B?MU1ZQ2c3OGtXaE9VcC9tdEpmcmxlUmlXUlZiU1F1enpOcEI3ZjBINnpHL0lk?=
 =?utf-8?B?YlVvWUc1WlUwTmRESWpsVHBCaXBzNzJHOUFkMVowbm15TlJnU3hPMlA0YWFn?=
 =?utf-8?B?YnRSRzVRN3VtblhodjlBQi94M0FIOFV1NTZWbEprYzZuRUF6NHRQZFcyQUpN?=
 =?utf-8?B?dmpEWVFZOENZWGY4ZDZBeVdXUk51QkgrMzJDbEI3UENoUTZ5Nm1TczdYbDFQ?=
 =?utf-8?B?LzQrN21GTXFGNndFcmxPSkpZdG84dHhrWWd6TXFmSDNVT2htZEJmdHJqWFJ3?=
 =?utf-8?B?RVdVNGIyd0NOOE9MOU1mNFFXVUtVOG1KREo3eHBrTUwyeXhOekJtbjIxaEx5?=
 =?utf-8?B?Vnl1QmhnSFNoY3c0a1kwdzg1YnhBN0lYVkE3N2k1enE2MHd1U0dQM3BSbW1S?=
 =?utf-8?B?YkdvVVYyMnZma1l5c1YvVzFVRWQ2S2xjMzI4S1NCSTRwZVMxTnFRN0xUTlI4?=
 =?utf-8?B?Wjl1NVdYOFRobThkazlhRkhqaXlzUWhDMnVZdTVHdG1YREp6TVBwZDBiZFAr?=
 =?utf-8?B?MTJLSkdjLzhsVGtKbTNwcnQrdWJWVlVmUlJ1SGx5NlZyZnF1WU9Ja016a01a?=
 =?utf-8?B?NzdXdHptY29zNStZb3Q3NWZ6RXA1VS9UdkllazVPVkRXNis5ZVBDNVlJZ29q?=
 =?utf-8?B?QjQ3VlBjRXJZOWtlUEpOT2tMODB3WFg3VUhIOHM4ekpDTTJ1RVM0SUZrd3Jl?=
 =?utf-8?B?NG5aQUh0REp5NHdNZUVVU3ZZczgxSE9oY0V1TXNnVGM4YnFXNTVGN0RiVWE3?=
 =?utf-8?B?K1AzOXpDTThpZzJPMEZ2dU1idE45VW40c2wybytycHZQTnVJRStqbWJwaDFr?=
 =?utf-8?B?UmYwSC8vaXd4NEZVOVFUSFhoTENRUWtmbUptWm1FdnVMVjNBL29ma2tTWHQy?=
 =?utf-8?B?YzJ5eW1iWVVsTjIvTjd6QzhURUlGaUFWaGQ5MklsQms4bnpzVjg5ZHdDTWNr?=
 =?utf-8?B?OVdjUEVFSllscVJ5RU03U3UvNzAxOEtSdFJRLzh0aDJ3aFdLV0RXZW0xcW1T?=
 =?utf-8?B?SWlmSDJJWnNCQlVVckkrVnRQSU94Z2VZNFhnd2QwbHB1bXU2KzRoWmlDOU5u?=
 =?utf-8?B?a2NXRktGVlMzNTk0eUxVUEdubmQrOURydmVGSGQvRmV5U0ZEUVBydGZZdmFl?=
 =?utf-8?B?NlVucGVxcFEyRlVZcnc3MEs0aEg4bkUrVTl1bUtsL2FVdkgwdTVFejliVzYw?=
 =?utf-8?B?aHFnSlJIanU1dE5hdHVEb0JNVTk2d212SjBPQ3RlNkV3YWs4V2lTeXRUdGhT?=
 =?utf-8?B?TkVGVWgxbk5WQXMrRyttdkZFMVRwbGZ5eHpmMXlEWkhRTzBSeXlmOEZrWGhh?=
 =?utf-8?B?dG5IWHAweERTdWVJYU9BaVI2aFFiclFKNHQ5dDRydFdMdjk2Q0IxNWZoTWlr?=
 =?utf-8?B?eURZcElZTnRoWU5KQWFwY0NXZWZSMnZwMGRnMGdsaWJIWEE3eVVpdDlrTExJ?=
 =?utf-8?Q?kWw+cU2575nNV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGNhSEhiMnU1dndsa2RXWk11T0JEaVpSNjVROTJLamlMT21xMUdxcmJaa3ZL?=
 =?utf-8?B?eFc4ZTYvekdDaGduTzJSQjN2ZkhKMmxncjNUL0QrRGU2Mm5tTEo2d2U4U3dE?=
 =?utf-8?B?TWNQR2pYOFAwSytQUjdyb25BSTBadTBqa3lmTmo3RWsyZXRFK3dhVFl0WFZ1?=
 =?utf-8?B?SG9xOCthT2lYaG9RRUh6d0lRQjJvdnVhMU1wVjdQOSsxMjc3dzkxUWY1OGwx?=
 =?utf-8?B?R0RPR3NmLzBpTTJNUFdxamZnV0YrRmZrV016NzRWK2FJdFNpNFdQZUluM0Ju?=
 =?utf-8?B?anMvY0pEZFE0eWhzWEJJNjhBSjFRWE4zcjZ3TWdna3F6cmVIdnhKR1ZtUi9j?=
 =?utf-8?B?RS8rb3I1TDhEUHBCTDIzWWgyWE1aOGY2WnF5eU5wd3Zwd1lyRmdRcTRsS2tx?=
 =?utf-8?B?ZU9EZTluTkVnRVRzeU1FQ2hjb0J6dWhWK0V0RG95ZnpLVk1qdW52eEd4YSty?=
 =?utf-8?B?Lyt3d0kycldYY09ZUzcvQzY3Z1FGUzNhSmJiUjVadlhSanVFUlAxNUEzSnVp?=
 =?utf-8?B?SXRpcWMwTXlnZHZxZU80TXlydDB3eGt6TVk1TEs2U0s3OUdrMmVXM29BeFlZ?=
 =?utf-8?B?clpkRFJZckxxQ05ha2tiVVpqRmFpdy8rR2NwTnJFV1lmQWtiWklqY1pTWmpp?=
 =?utf-8?B?UWFHSlo0MkYyVjVSR0FFUWZLY0NuVWRxd3lCSFhQQ0dINWNvL3J3K2JkbzEy?=
 =?utf-8?B?dzJyTnlrS3dpSXFBeVdBOGJXcVppUUxjR3Z5cGM5UFl6cXkrZTlpZS9SVWMv?=
 =?utf-8?B?cjIzdXZ3QnUzS1FBZVBJdGViRXZzZ25yNDlWdGgvSU93bGpJQzBkZXkyYmx2?=
 =?utf-8?B?VHlrY3hqcC9MTEpyU3h4VFo1OGRrODI0Mkp0SmFzVjE3UGRKUlJDV0trM1lu?=
 =?utf-8?B?UFRFOGpCdHZlL0JORVRaaXJVS3pQc09rZTNJcVVLREg3dVJhWUQ0Rm04SmNl?=
 =?utf-8?B?NFZhWWdsSEJaNUpxQVZvck1RcHBKa3dGUVNnMWo2ZFVOa1ZqNm9tSXUrbXBF?=
 =?utf-8?B?aG5Sb0NPMmtVU2hqb0cwb2xYWGdvYTZzcmNacW5pYk1HbWYxUEU2dUh2bEgv?=
 =?utf-8?B?QURvTVFSdEpOU1ludVJZTzJ0MGR0NG5VT3FyczhMQk1qd1pVVUwvcXc4dVNq?=
 =?utf-8?B?eWs4TW1LRkhTV1VqNVZ0eDRxS1c5S3JTNmxxTFZDd0FJVmJoY0NyNnh6WnRT?=
 =?utf-8?B?VVVlR21ERGFQVkhXbDZadVRhLzhUaGlodUZNZnh0TysyUFBvdm9EYkRSUVpC?=
 =?utf-8?B?MGlWTEh5U0pScmRweFErYnNRQVpMVVpZRXFTcW8vd2laL3hoS2lMZWlveSs0?=
 =?utf-8?B?aStta2xJSVhpbi83RTVGY29mUElhVjVja3N4eHM5Z0dvOVUvRjhrNXV0MWNj?=
 =?utf-8?B?NEg5Nm9ZRklTR3dQSHFBd1RQSndKUHlqcGY2bmtMd3RVNmZqWkRoZWsrSzZP?=
 =?utf-8?B?d2F4ZHNzUk5YWnZCMjRKVllRajdrN3RLQVpVamxiZkRiUHloWlF6RnVUMnBR?=
 =?utf-8?B?MW1PZkJRRCs3Nlp5WHR6S01Oc2pxQ0J2bGlPczhYUVBGNS8zV2U5K0NnWkkv?=
 =?utf-8?B?WWlod2tXZmFQcW1rZDh2SGF6TFlVVGlGeGFtK0xWaExGY0RlK3k3eHkxbEU5?=
 =?utf-8?B?ZjVQZm5HTUdoLzRBZVZtbERVUWQwSXFBQ1gzMFY4N1g3RHFlZTFYM1EwUFJl?=
 =?utf-8?B?ZnM5UkpJK2VvNnRObEM5NmM2TkRSeDlxYURUcDV6dHBlUHhaNTNYNVpzYXJ6?=
 =?utf-8?B?Z280eVNXaXZFZU1rUWZ6Wk5BS3dCck1mbG12QlRjY3JaaTFwbjgycjBucUxM?=
 =?utf-8?B?RTNsdkh1bjk4U0JqTFJZOXdzRmV2OC9zNjNmS0xYUllIQlRDVW9vdmRLL0VS?=
 =?utf-8?B?bDlEcjBKYUhpNldWWllaWlVCbmV1LzdFem1zMG1ZaXA3VGhzUjRrSldaWXM1?=
 =?utf-8?B?VWQyVmxUWTRObVJMNFhGY1ZqcUFzVmcvVnc2QndCck9raldYd1ZNeVE4WC8y?=
 =?utf-8?B?bjlCMzdaL1pUc2JWaGRCQVZ3a3lpOUp6d3ZyOUtnNGN2WjVQZURZVkk0a3ZQ?=
 =?utf-8?B?QkhVVjhNTWExbFk0OUxscVdqRmMzQ0x4QnZLc01adjlJS3hFQlJmeDZ2Vnl0?=
 =?utf-8?B?dU55MFNFTUxGd29paWpVK29FcVZLZHVnTTI2Z3JQanVzT3BnWnZvN3hDU2FW?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e29a9-e74d-4309-fb69-08dd5a28172f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 07:50:39.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8g8UCjpWsl57An5iST5m4ABQtawpI+QPjPxp0Nx5hz8mc0qqocodBDRikhlgLCTPYPIFfkD9bcD/fOWq+OKbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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


On 19-02-2025 19:01, Simona Vetter wrote:
> On Mon, Feb 17, 2025 at 06:26:17PM +0100, Simona Vetter wrote:
>> On Mon, Feb 17, 2025 at 12:08:08PM +0200, Pekka Paalanen wrote:
>>> Hi Arun,
>>>
>>> this whole series seems to be missing all the UAPI docs for the DRM
>>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>>> replacement for them, I would assume both are a requirement.
>>>
>>> Without the ReST docs it is really difficult to see how this new UAPI
>>> should be used.
>> Seconded. But really only wanted to comment on the userspace address in
>> drm blobs.
>>
>>>> +/**
>>>> + * struct drm_histogram_config
>>>> + *
>>>> + * @hist_mode_data: address to the histogram mode specific data if any
>>> Do I understand correctly that the KMS blob will contain a userspace
>>> virtual memory address (a user pointer)? How does that work? What are
>>> the lifetime requirements for that memory?
>>>
>>> I do not remember any precedent of this, and I suspect it's not a good
>>> design. I believe all the data should be contained in the blobs, e.g.
>>> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
>>> for returning histogram data to userspace, but at least all the data
>>> sent to the kernel should be contained in the blob itself since it
>>> seems to be quite small. Variable length is ok for blobs.
>> So yeah this doesn't work for a few reasons:
>>
>> - It's very restrictive what you're allowed to do during an atomic kms
>>    commit, and a userspace page fault due to copy_from/to_user is
>>    definitely not ok. Which means you need to unconditionally copy before
>>    the atomic commit in the synchronous prep phase for the user->kernel
>>    direction, and somewhere after the entire thing has finished for the
>>    other direction. So this is worse than just more blobs, because with
>>    drm blobs you can at least avoid copying if nothing has changed.
>>
>> - Due to the above you also cannot synchronize with userspace for the
>>    kernel->userspace copy. And you can't fix that with a sync_file out
>>    fence, because the underlying dma_fence rules are what prevents you from
>>    doing userspace page faults in atomic commit, and the same rules apply
>>    for any other sync_file fence too.
>>
>> - More fundamentally, both drm blobs and userspace virtual address spaces
>>    (as represented by struct mm_struct) are refconted objects, with
>>    entirely decoupled lifetimes. You'll have UAF issues here, and if you
>>    fix them by grabbing references you'll break the world.
>>
>> tldr; this does not work
>>
>> Alternative A: drm blob
>> -----------------------
>>
>> This would work for the userspace->kernel direction, but there's some
>> downsides:
>>
>> - You still copy, although less often than with a userspace pointer.
>>
>> - The kernel->userspace direction doesn't work, because blob objects are
>>    immutable. We have mutable blob properties, but mutability is achieved
>>    by exchanging the entire blob object. There's two options to address
>>    that:
>>
>>    a) Fundamentally immutable objects is really nice api designs, so I
>>       prefer to not change that. But in theory making blob objects mutable
>>       would work, and probably break the world.
>>
>>    b) A more benign trick would be to split the blob object id allocation
>>       from creating the object itself. We could then allocate and return
>>       the blob ID of the new histogram to userspace synchronously from the
>>       atomic ioctl, while creating the object for real only in the atomic
>>       commit.
>>
>>       As long as we preallocate any memory this doesn't break and dma_fence
>>       signalling rules. Which also means we could use the existing atomic
>>       out-fence (or a new one for histograms) to signal to userspace when
>>       the data is ready, so this is at least somewhat useful for
>>       compositors without fundamental issues.
>>
>>       You still suffer from additional copies here.
> Another detail I've forgotten: If you queue an atomic commit and then
> immmediately do a compositor swithc, then the new compositor would end up
> with the very confusing situation of having a blob property pointing at a
> blob which does not yet exist. And since it wont get the drm_event nor has
> a dma_fence out-fence, it also cannot reliably wait.
>
> So this would be awkward at best, and might actually be a cross-compositor
> attack vector.
>
> So yeah delayed blob object creation also don't look great, and mutable
> blob objects probably break compositors even harder and we'd need to make
> this all opt-in.
>
> We need an opt-in for all of these I think, but the more I think about it
> the more this alternative looks like the worst.
>
>> Alternative B: gem_bo
>> ---------------------
>>
>> One alternative which naturally has mutable data would be gem_bo, maybe
>> wrapped in a drm_fb. The issue with that is that for small histograms you
>> really want cpu access both in userspace and the kernel, while most
>> display hardware wants uncached. And all the display-only kms drivers we
>> have do not have a concept of cached gem_bo, unlike many of the drm
>> drivers with render/accel support. Which means we're adding gem_bo which
>> cannot be used for display, on display-only drivers, and I'd expect this
>> will result in compositors blowing up in funny ways to no end.
>>
>> So not a good idea either, at least not if your histograms are small and
>> the display hw doesn't dma them in/out already anyway.
>>
>> This also means that we'll probably need 2 interfaces here, one supporting
>> gem_bo for big histograms and hw that can dma in/out of them, and a 2nd
>> one optimized for the cpu access case.
>>
>> Alternative C: memfd
>> --------------------
>>
>> I think a new drm property type that accepts memfd would fit the bill
>> quit well:
>>
>> - memfd can be mmap(), so you avoid copies.
>>
>> - their distinct from gem_bo, so no chaos in apis everywhere with imposter
>>    gem_bo that cannot ever be used for display.
>>
>> - memfd can be sealed, so we can validate that they have the right size
>>
>> - thanks to umdabuf there's already core mm code to properly pin them, so
>>    painful to implement this all.
>>
>> For a driver interface I think the memfd should be pinned as long as it's
>> in a drm_crtc/plane/whatever_state structure, with a kernel vmap void *
>> pointer already set up. That way drivers can't get this wrong.
>>
>> The uapi has a few options:
>>
>> - Allow memfd to back drm_framebuffer. This won't result in api chaos
>>    since the compositor creates these, and these memfd should never show up
>>    in any property that would have a real fb backed by gem_bo. This still
>>    feels horrible to me personally, but it would allow to support
>>    histograms that need gem_bo in the same api. Personally I think we
>>    should just do two flavors, they're too distinct.
>>
>> - A new memfd kms object like blob objects, which you can create and
>>    destroy and which are refcounted. Creation would also pin the memfd and
>>    check it has a sealed size (and whatever else we want sealed). This
>>    avoids pin/unpin every time you change the memfd property, but no idea
>>    whether that's a real use-case.
>>
>> - memfd properties just get the file descriptor (like in/out fences do)
>>    and the drm atomic ioctl layer transparently pins/unpins as needed.
>>
>> Personally I think option C is neat, A doable, B really only for hw that
>> can dma in/out of histograms and where it's big enough that doing so is a
>> functional requirement.
> Also for all these we'd need to make these new properties opt-in and hide
> them from compositors who cannot cope. Just defensive programming best
> practices.
Thanks for the suggestions, having a new IPC memfd in drm is a great 
idea and helps not only for this but should also help others like 
writeback etc. I will explore more on the memfd.

Thanks and Regards,
Arun R Murthy
--------------------

> -Sima
