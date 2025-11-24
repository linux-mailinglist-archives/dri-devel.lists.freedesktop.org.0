Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAEC7F691
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 09:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DC210E1E8;
	Mon, 24 Nov 2025 08:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WWlBSjfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658F110E1E1;
 Mon, 24 Nov 2025 08:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMvY+6WuHTP6f9sQDQHP75YXnEv1vxF84uvEQWVins73KXLYY6eD2W53xM1TYQI38TmQEJE1Sdp70IxQmbAqqh/HKf58zu9bpTBotYwxLSjAggKPKK4Do+A3+zYSwD08U7ozTDbc2KwflnGolosNPSzdaeb29PPNxKwQU5qEnKWpIRJCz4KRDSc9MTrPKvLL7hQxODtdpGfdeQOp/4uvTnNim4I99sm2g7k6o+Fo75BTXqk3oNOJju0fZq0HGuvoltmmhPKI6l6PTM/WCbCijcRAeHLSpaMBADpqX6ojTuvPKDu2gVccI/+A6jA9KzG/bBnO1ccSgfNBQG6iEkXeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HU4TDbFnUkvvEC3znOvFzyTFS1ffaunQvcTPNg3CYU=;
 b=SHrWk25G7bJfkgQazr2W/tKGmoECaE+8fPZHimLK7CRutjZ7y8oatogAu9iyVUyPgsCeUBlIzyFVgo8cgxUies9kadQUIJuH4PikzIkYTJQowlXx3G9Zn95+iXzEsAC/Y13i+l4As5iJs/Rk4Iu4Dcla7V0wRww9w4WACN2RLnqLP5FeIRNwl3bdxMwhr3hsI6xZmZ8ON73kmYmuORX4bXN7LoauYAklCZ0i8OOXViMezcGFUfJhyjUgw5h3mwEygZWNsBai8kQojJboScaNbiI4pSVdDUYyi2NnmHol+Jylzba2AfG4KazbV6hoB2YkTbjNiYbrfKXtD0NMT1oqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HU4TDbFnUkvvEC3znOvFzyTFS1ffaunQvcTPNg3CYU=;
 b=WWlBSjfvMSef3yo08FuM+oqRf97oyNUP2h4pwcgCpTN4x/l/+zS38X/W/dttsdlctlotwXMtQeaR5hhnVhxVgzGZHjcpp9vytB+A4H03iz9xrfvMY8F99h9EepSf5QP/6u4ERhH8WJleijyCyS/Rhy/XdjYWzUTXdMM8OHGZfSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN5PR12MB9461.namprd12.prod.outlook.com (2603:10b6:408:2a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 08:42:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:42:53 +0000
Message-ID: <88a45d09-ef97-4fc2-8069-9d9911834f1e@amd.com>
Date: Mon, 24 Nov 2025 09:42:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/28] drm/amdgpu: add amdgpu_device argument to ttm
 functions that need it
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-11-pierre-eric.pelloux-prayer@amd.com>
 <3708bb5d-6b3f-4817-a25a-5a7b90918d0c@amd.com>
 <cb1c8db1-22f9-4722-ba53-a53c3893df80@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cb1c8db1-22f9-4722-ba53-a53c3893df80@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN5PR12MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: fb07804e-345d-429d-70cd-08de2b357544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVMzVzNGbWlJaG0wRk93eVNFVnpUYjBhS1dvN1p3N1o2SlBHWUgyNDdMT1RZ?=
 =?utf-8?B?WnNuSlFiZWpqL25hdlFOUVZYUUhpWWt0aHFpR2VkWlZ0cmhReWtUTU5BZlNK?=
 =?utf-8?B?SUduSklmSFl0SGlZSEVyelliYmlnK2l5eDE4UnJUOS9Ia1AxTGlOb2tiQ0Fu?=
 =?utf-8?B?M0tibTk5aHZ4WWpIMFg3RXM2Yy9rdmRMODhoQUJuejZEcU9reWt0VGI1U3BZ?=
 =?utf-8?B?OEgvdjBHVTZONElacmR5U3BVNTk2azAwVmdrMElkWG1FWnBRQVp0QXlMRzMr?=
 =?utf-8?B?OWZjQlZBbHppMEpIMEdpQXJSS3VlTU1QQnNaRlpkUjFURWhNd2JHYVR5Zm4z?=
 =?utf-8?B?Q3AwNkxna2l4UXZkUlRRZE45cWxIWTEvenUvclR6QXB4STkvZytERG5sTURs?=
 =?utf-8?B?b3hieVBrTFFUZU1xRWRPNWt1VlJ1ZmQrSHl3cVVmcDFsOU42Y1owS05ZMXJT?=
 =?utf-8?B?d0t3RWcwbWtobFM2YkZHM1picHJYLzhsajVvYW9RVS92SzZtMGI3VmtMVG90?=
 =?utf-8?B?N3FsaWRGWUpNRG1SL2VPL2JrU1lUK2NMbkFtSjBzNDdMQ0hmcTQ2cFBUZ0cw?=
 =?utf-8?B?bU1rb3dBS0htTnMybnRsbzM1dUtUZ3dWcWF5cnMyb2JpMFdKdElNc1R3NzlQ?=
 =?utf-8?B?TXhvZjBuNm9sSHdMbHVrUTNoT29jdzdqZk5ZcnE5Z0NyKzBtQmN1UUtHc3R4?=
 =?utf-8?B?ajFYSEZPQjNYY2haY3FsWTh3Qk1Ca1ZQS05rb2ROUlJ3dm1Cd0FNNG5ZNnpX?=
 =?utf-8?B?NXF0T1FWZm53bU5rNVk3U2hvY2JYK1NZb3F4UWNzMVU5emcrK2l6ckZuOVUx?=
 =?utf-8?B?U2ozeDdLWTNuTFgwNHhUOElyd3UyV0h1dk1zc3ZIV29ob0JqTkl5SUJhWTZh?=
 =?utf-8?B?alFycGpiVFczWFliOW9BOUp5VHV2SHFaWmJuREhZNzNnRGJCZGJvRjVCMTdT?=
 =?utf-8?B?R2JPMHpnUzZGTW53NDVMekVGZFZHTW5VZDF2SXNBM0d4ckdmUXBhRDZTS1Ex?=
 =?utf-8?B?MmZ2bGw0K3F6bHFiMTVvMDdiZklvOExpM1NYUVNRWEhMYjdqSGJYVG9MZ0lZ?=
 =?utf-8?B?UWd1K2hiTit5czFBNzBSTWpFbmtFNVAxMktLNnlyR2k2RnQ3TktJaUw3UlZH?=
 =?utf-8?B?UWtzOFo1NThCQjgrVzdSblNTRWRNb2RFVUJMUFZRcWQ0V0g1TGJ1cm5jSTBI?=
 =?utf-8?B?eWl6WGZ6WGlEUlRTSGZpTkwreU5YdFBDQ3pTZnl5RXM1N29CTlB2UVZERW1z?=
 =?utf-8?B?NU9uUlcxUlZ4UDdGQ3ZPWHZqVFZTT05wcGkrdFRYM3crU0JjOFdZN29iUEJO?=
 =?utf-8?B?bUNPOW1nSS9IYWdVbW84dVhSZ0F5L21wZUpHanhWc05rNFpHS0RVM21kQkRN?=
 =?utf-8?B?WFhReVpMaTdlS2RKaEQ4YUpGMGZFTTM2dnpRNXJjd0cwVm1UTGhEL0t3aXls?=
 =?utf-8?B?bmdqQ21rUU9TU0NBRVFSeEJ3VnJrYWoyYzFFR2Q1Y2gwMlVHK1VWMy9pa1pX?=
 =?utf-8?B?cFlLaEJpOVhDOFdlMnpxZHpUUmhZSmR0ZTNNN3J1SFp1NFN0QUkyQkZHV2lX?=
 =?utf-8?B?bUxlSmJWY1RqakFQNkhIOU5LNkVaSkloYlJycmhIbzNyS1I0aXhDYyt0S3Bs?=
 =?utf-8?B?NkdBM3o5ejJEOHJNUmttN0pYaWhydlBEL0k4Z1czVzRiWHh6QXdrM1RSOXRU?=
 =?utf-8?B?NDlMdEk5Tk40U28rQ3VTbExQNTdnL1drWHYxVDZ1VldZY0dGK1N1TU9IZDdJ?=
 =?utf-8?B?REFTMmk1cTJSUFRBbnorNG8rQ0xnWkZTSWs5bWpucFRQK01lR3c1Z2pOcTJW?=
 =?utf-8?B?Z0hvZTNyTmY4cjc3OEZCYTkxeGtaRHN2cEtmTXpQd2RoVHB2SVR5aTBSZC9C?=
 =?utf-8?B?ZTNDMG9rbUY0YTF1NFQ1R3dsSzVqejlEUGM1TkFPZ2VvV0xqc1J6U2JYUjZj?=
 =?utf-8?Q?+hxCOfqRGOO9X0CjFvk4BOcSCEe67NQC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHF3eUxURTVadUtDSktneHpiV0owNzd0OGNUM2RtVW9uaGlvZkFocHdxK1hv?=
 =?utf-8?B?M1NRUXd6Q1JtbEp0RExDYzBPNm1OckVOYTMray9Gb3NTS0hvR1NYNmFZYnkv?=
 =?utf-8?B?dHY2bFRHUFlFdzRjd2s3QW9ZcDdoU3Jxdnl4dkV1Zmo5emtTVjRaVktFNVRr?=
 =?utf-8?B?SFE2a3lPUVFzSU1kY1RaeWVjUkY2T3lEYUgrTSthdms5NXpHZ3BqZzNSeGhi?=
 =?utf-8?B?N21ldVRqVDZBa0Rvcmx1RThyY1NSMVZSenRSZExTQ1FkYnpWUytXdUoyU2Vx?=
 =?utf-8?B?SWUwVUVZSjJ0NEhhNFNoUHhBZjFNOGx0cUozTVB6R09ZYlpkR2dqN3ZrNnpH?=
 =?utf-8?B?NC9lM29TUU9FdkpQdTdtcEptZDRpRnlZS3h4bGkzOFFvdWFIMG14YWRnODJt?=
 =?utf-8?B?SmFJK1dNd1BCd0JRUlZzZGJEcDhEOWxZSEd6TEhWcUduYWszeklJRUE0QVRK?=
 =?utf-8?B?WjJ0Z2t2SEFFdlZpYVhpQWNpekk4UW1ISlFXR1FYU211RmFRMzhnSGFLS3Fy?=
 =?utf-8?B?eTd5MjFBUDU0dFZVMnhnYUswMnkyN2Zqa2tTOXdXLy9EYk5oVUtvVTRZR3Ay?=
 =?utf-8?B?Z3BrYzNuNUJDQ0ppVGJ6YjFadG1CZEUzaVRFYk4wanZqa25NRTJiL2ovc3Y0?=
 =?utf-8?B?L016L2w5S0pmNE9ueFBYbTFQZFJJNTRoNGRHdXA4TVRIM3p3Ri9tRnI2WWFq?=
 =?utf-8?B?OWNuNU1iV2NGYVlXRGNuUmxBUldQSUhBWUh6bTB1TXRmd2ZLMEJMM2x3bDJW?=
 =?utf-8?B?d3NlTTB1VDRaN2xxR1ZXODRoMUdzZC9OYjZXdUI1UVJOaWRldlNwKytWT09w?=
 =?utf-8?B?MlEwMk5ZbWNvWVlmYUNPNjltMDdMdGs4dDM4VG05K0Yzazd2ZDlJellNZ2Rh?=
 =?utf-8?B?UXpGVVJxVmxJSTFmMkFaUC9leGo2c3Z3RXhUODBpUThrMm56SEoyWEJqOEFv?=
 =?utf-8?B?YzNHSWE0QVZGOHkxTnpuM2pHbmZYUkNxTUxyb1RhTTlMb2Q4ODZXNnNkaVFX?=
 =?utf-8?B?V2ZMaWk1QnZCZmRXcERHcWhzZ3RyZ0hHZ081L1BqaDJiM2RZbnVQU3UrbVBj?=
 =?utf-8?B?MGxKdStpWnFMYk1OVEo1MWdrRm9pbFB3d2lCRC8veGRUbVpWL3BDbGIvaWhr?=
 =?utf-8?B?QjRib1E0c2hEMmYydW5oclI4aE5KWmkvQW5xb1ZVNGZVajQyZHJSSkhReDl1?=
 =?utf-8?B?TGhxa1JobUROSUFYUjdaRXk0bnlGSVV5TVZUUklZeWZCcFoxUktzUDVFTEw2?=
 =?utf-8?B?aCs0dExESER6bVRKR3dVZ2RmVmhlNXlkKy9MSURsOXhtS3RWM1grVDRJYkdP?=
 =?utf-8?B?Ty9JNDVsdm44YlhpYkVCZWtabU9WWU0ranptbFZHNS9UOCtZOVYrQ3AydmFU?=
 =?utf-8?B?Sy9VZ0FiVlFCZStZRXp4UnBYWEJTTEd6d2VwSmFqSXBSaTZReXFQMkdRNmRD?=
 =?utf-8?B?QmtaYmtKV2FTYlFUR2FRbTlqWVBDc29Ob0FIUzRXeFBYNmkxZTBwUXhmbW9a?=
 =?utf-8?B?NDBHQ1ptSWJQWGxhQ1RvRS9TQzNFV1M4alNJbWRya2lqaE4wZFd4ZjlZT2o3?=
 =?utf-8?B?dGhLMjVKN2hOdXhXK1ZrUGZhTSs3RlBjTFovVXVpc2h4VzQxNjEvVTBEd0M3?=
 =?utf-8?B?NFNBdU5QZjUzQTF3RE9NcTJSVmtmNEhUa0tTZUY2bHJDRzJ0RFU5dFQreDRI?=
 =?utf-8?B?aW9CSUZPNnRkNWJxMGZ6c3BvOWlKOXhSaFN0dnhhZTlWd05WMjJTd0s2Vkxr?=
 =?utf-8?B?a3JIV0hpZHU1em1FaGR6WkNKZnlzMzJGMXRHMTlpeHZISmhob0dtdER0eW15?=
 =?utf-8?B?WFQ0Nm5uTzdFNVpyNlA4Tnk4R2Jkc01BSXFWMFA5VVZZZ0tvRFF0T09aQUYw?=
 =?utf-8?B?THc0VW9USWtmbDZ3ODgrYk8yOWFsd1RLbHgxZHNRRWJoVStDZTdzWUxqQ1Jn?=
 =?utf-8?B?S245RDNmMlEweVFoWHE4c2J2dk5JZlpyVy9DSUdnaXAwOGRqS3hGRll2NjBE?=
 =?utf-8?B?Y2EzVXZJNDlERFArS3M1QVNOSTNWdDlTSUJmWW9PZ2VwWEc4cHA3clVXOVZU?=
 =?utf-8?B?NkNwZW44WGxuZVk5bjFtQ0YxQVgvNE8vK2oyOXlkeDc2OVlwMTJrcGsxb055?=
 =?utf-8?Q?/BPM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb07804e-345d-429d-70cd-08de2b357544
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:42:53.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scIdj6b8PmZHFCMlc1mg0iHAhaw2N244pJQH4KGwDCBEJTQWt3UOTyfi5xgiHUrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9461
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

On 11/21/25 17:09, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 21/11/2025 à 14:24, Christian König a écrit :
>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>> Instead of getting it through amdgpu_ttm_adev(bo->tbo.bdev).
>>
>> Why should that be a good idea?
> 
> IMO explicit parameters are clearer than implicit ones so if these functions depends on adev, they might as well get it as an argument instead of fishing it from one of their other arguments.

Usually defensive code does exactly the oposite. E.g. when you can figure out adev from the BO then do it.

Only when the adev of the BO and the adev which does the operation can be different then provide that as extra parameter *and* code in such a way that this actually works.

Such things can happen in an XGMI hive for example, but makes the whole stuff much more complicated (lock inversions etc...).

> But if you prefer to keep the existing code I can drop this patch.

Yes please do so and if you see other cases please make sure to use the same approach as well.

Thanks,
Christian.

> 
> Pierre-Eric
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 +++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 ++++++-----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 ++++--
>>>   3 files changed, 13 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 858eb9fa061b..2ee48f76483d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -725,7 +725,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>           bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>>           struct dma_fence *fence;
>>>   -        r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>> +        r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
>>>           if (unlikely(r))
>>>               goto fail_unreserve;
>>>   @@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>>>       if (r)
>>>           goto out;
>>>   -    r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
>>> +    r = amdgpu_fill_buffer(adev,
>>> +                   &adev->mman.clear_entity, abo, 0, &bo->base._resv,
>>>                      &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>>>       if (WARN_ON(r))
>>>           goto out;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 1d3afad885da..57dff2df433b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>>>           (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>>>           struct dma_fence *wipe_fence = NULL;
>>>   -        r = amdgpu_fill_buffer(&adev->mman.move_entity,
>>> +        r = amdgpu_fill_buffer(adev, &adev->mman.move_entity,
>>>                          abo, 0, NULL, &wipe_fence,
>>>                          AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>>>           if (r) {
>>> @@ -2350,6 +2350,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>>>     /**
>>>    * amdgpu_ttm_clear_buffer - clear memory buffers
>>> + * @adev: amdgpu device object
>>>    * @bo: amdgpu buffer object
>>>    * @resv: reservation object
>>>    * @fence: dma_fence associated with the operation
>>> @@ -2359,11 +2360,11 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>>>    * Returns:
>>>    * 0 for success or a negative error code on failure.
>>>    */
>>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>>> +                struct amdgpu_bo *bo,
>>>                   struct dma_resv *resv,
>>>                   struct dma_fence **fence)
>>>   {
>>> -    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>       struct amdgpu_res_cursor cursor;
>>>       u64 addr;
>>>       int r = 0;
>>> @@ -2414,14 +2415,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>       return r;
>>>   }
>>>   -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
>>> +               struct amdgpu_ttm_buffer_entity *entity,
>>>                  struct amdgpu_bo *bo,
>>>                  uint32_t src_data,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **f,
>>>                  u64 k_job_id)
>>>   {
>>> -    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>       struct dma_fence *fence = NULL;
>>>       struct amdgpu_res_cursor dst;
>>>       int r;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 9288599c9c46..d0f55a7edd30 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -174,10 +174,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **fence,
>>>                  bool vm_needs_flush, uint32_t copy_flags);
>>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>>> +                struct amdgpu_bo *bo,
>>>                   struct dma_resv *resv,
>>>                   struct dma_fence **fence);
>>> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
>>> +               struct amdgpu_ttm_buffer_entity *entity,
>>>                  struct amdgpu_bo *bo,
>>>                  uint32_t src_data,
>>>                  struct dma_resv *resv,

