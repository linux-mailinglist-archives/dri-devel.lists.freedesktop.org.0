Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5ACC8AAE9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6E10E028;
	Wed, 26 Nov 2025 15:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QLLhrDph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582C110E028
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/JUEOVnJRJBi9xf7Z2BR1sNk6R0fzSudIVZxyBsCg1BeJCjpQQPp8o7RfyyfZahfSHBrWDa0Nm6h1bmkXFNc7msHcuLvKV5AMSxFhcbUZqrjYiNCkW9IwlVEuTHwSLyhRMO1XAe+FuwxWfF6HgSbKat9FJI2yROnu0SZmWQWImMb6vDJ8JEOxeSZGkUOB6OQtPZwUKV5266K9QLiUGSFuTxM0EHXkctEPh9wHHLjZMeZRi5VtNGJA3EP98x6R8XEHhHVgGPqQY2rlf63P2HdVDyD5WrDb23av4yz4UKQzJcZep+Zxf9Ke2uAyCCdl6w+Lv3Ufd/y43N8UmE2mFBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP2oPP0WpQVIds2ugcdOYqS3vlI7IQVcClG1cHJ1DEE=;
 b=iozlDAzCWW1RRN6hPbxo8KUfYnjhwpZffusqeSWXRn2vgYKmm59GwPCA9Zju3KyeG2jVMtWpNpTwNwpqummiAJb7xkf4LEq9szFcLfryvRj9L5Vaz4vA+lj6kwOyfxdvGyl6fIQ9E3APezYbzh48Nq2o3YLc4HRyuuvUQVP7Fk2Yapp+MuO/eNpjJ/lLTA0Mm0KD1ECWMuT7l+rW+w0QFzRD5uyj8tFFh78up63kHG5N1TtwkH1tsNR86ie1eIxCsVBuJIPqSXjpaf1ik96anYOEtmU3x2AzLQ7ZzPqSV8dPVm/xb2XEUpJkbwA1rC67PvyWdwrw04OzOP74SxK+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dP2oPP0WpQVIds2ugcdOYqS3vlI7IQVcClG1cHJ1DEE=;
 b=QLLhrDphs3hgOv/RKB/sjtfT9EIm4sDrsVogklEvfp41FhBZNYN670tKsOlOKLDYp+KYO7ogGlN/Fsjwx2MbULLXktEiaejfm+oTMhCa53boUwf7MgdNSKKczbqqBkorAqyT7+p+eaFFse1AGQpRU40bOTAA4aRL76jKEeslcuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:36:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:36:11 +0000
Message-ID: <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
Date: Wed, 26 Nov 2025 16:36:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
 <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:408:d4::34) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 154b07c1-6d91-41d3-e524-08de2d0186a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXlqbk5JQ0QzNlZoVmhEampiSWVmRytZV2NvTWFvcmdWWVBYcXoySStuT0tJ?=
 =?utf-8?B?QWliekoyNnZlZmNwSGJYL2JYdy8xYVBPUVFvOW9wMlRwR0YxaTl1M3VBU0s4?=
 =?utf-8?B?M0VydUUyOVBOdlhIUE9qTXg0RzVpUTJrdG9Ud0M2bldObElLcFlYQ0pCaDM4?=
 =?utf-8?B?T256WTZyRUZTQkhjd0hYcFI1TzdEYXRUaXkxUUsycFczNWJkS2JYYWF4TDlk?=
 =?utf-8?B?RFRjaUdlWCs4M0EyREluRHVLZnloSTB5TUFadzlBL0lwS1NJM2NTOEhaSi9q?=
 =?utf-8?B?UXdaeHdocTlTNkEvckxybTJETDRvN09NTHR6RXpDNVpUcUFhclhqdkNkQXNG?=
 =?utf-8?B?VnlCUDBQTklLUG5GNGxJVWRZSXFMWnFNR2tlREw4UUFtNjUzVDNxUGtGdFZi?=
 =?utf-8?B?b3RVcTVrMXlhQXZza1pkMmRKQ0FaOFdrT0V1Ky96YWl3cW1yZkU5NjdNOE9u?=
 =?utf-8?B?UTJXd0JrNEhYMW5lN1Y4TUpaSlE0bDcvblZzaDVpSkR0aXFXRk1DdjdYRzhK?=
 =?utf-8?B?Q3RoSUJNdjFucGw0STZYTUxYZFFDNkdOZkVMOGJwOGpkeHV1YkZtQWNpSzlS?=
 =?utf-8?B?Q2UvZ3h3NUNOOXpqYmx4Y2lNcHVHM3YreDB0ZldXWWdNdzhmdTZ1TTJQWGFF?=
 =?utf-8?B?b0prT1RZZ3NhN0FaS1BBTTJMdDZjaGZIWWxpYUxUNEh6U1VMcWg5SGpMVS9U?=
 =?utf-8?B?RDR3aU5saVV0MjNMTnNQS1UrNlU1WVBNYUVsSGZpTVBiZHhXVStqbytLaElw?=
 =?utf-8?B?ZmZyU3paMW53R1FpNEJNTWI4d3d6YXlqNk5lUm0rNGdYQzc4cG95Wm0yQkt2?=
 =?utf-8?B?Vll5ZG9naDRUc1lqUzJaSjA4Q3FTMzNpelhzVVJSU2N4bS94NFlTRG50WitP?=
 =?utf-8?B?YXBHbVhzR21ZWVI0ellZODJZN1B5Rzg5THBwRThNazlPaUkvNjVrVE1vTzJG?=
 =?utf-8?B?MmNndlBBSWo2cEJud2ZrdVpPZUlXK1dTTitHVlNXUWlZMWd0cmM0dnI5TVB6?=
 =?utf-8?B?YURXTGptbGVaamJDc24rd1FyMXZxUzBQbkRSMUMyRzhjdmlSeW1OTWx4Uk1T?=
 =?utf-8?B?bTJGVW9iMFY1Yll6YjJDZEIvSE93czVWYmNsRloyR3FJZWIraEJqTFBrZ2ZE?=
 =?utf-8?B?cktuQnFIc1FwTGhCK3drS1pGenA5Tm1ZWVlJVUhEVThyKzhuYnA4UUI5c0k3?=
 =?utf-8?B?UGFQRWcyZk5RMmtRSUxvVlp2ZHRzRFFzZmU1VFlYOWcrcUpZWUFsMURVempV?=
 =?utf-8?B?RkRIRnhZSEcrcmhYRTNuUWVPQ1ljSm03R1VaZE82Nmh4cUI3YXdlZTk3VG1R?=
 =?utf-8?B?UXpkRkxGYTVncVZXUi9oZzJPamswMmgwQkVIMVZ0WHVucWpUSVUrVHYrKzY1?=
 =?utf-8?B?c0tnUTE4Y0lqTExqakVmSEFpWVRxRkpGYXhPRjZwVlNWamFkNVZ3S3A5ZkEz?=
 =?utf-8?B?YzhLSFpkQ3hsZXdwTC9SbFRsODNhSVh5bWVFWnFtR3Btc3lYaDYrYjdtT2Jt?=
 =?utf-8?B?QS82Zzh3bFI0YjZXL3JCcXdwOHRVMVEwL2crLzBtR2taWFZzdG5wYWFUZGYv?=
 =?utf-8?B?NDM5cThCQkRuQkwyYUZKbk9TRXprbUNMbGhHOGgwS1ZiUWlyVy9nVlozTHpY?=
 =?utf-8?B?UWg3SzlhOElZbnltZUJ1bmNlZGlMMnFpWjNGemswbWNDYlNaTmpNQTJ4UXB0?=
 =?utf-8?B?cTBqN2E3di9QNVY1YU0vTldoNzcyVUd4WXZoV2ZHdng2UlhSY0QrcFg3K3BT?=
 =?utf-8?B?V2d6OGtOZFk5MWJ3VHhicFNwdjZ5T3pCZ0lHSlNibVlwSTBJSHJsRlJzSk5R?=
 =?utf-8?B?SWlsNUJEdTFkM1I2Tk1WbnNnUFZ4VC9pVkhIYklyUmt3OWxBdEFaNjh3VlJ5?=
 =?utf-8?B?MjVQcnRGVXczMUFXWHRjU3ZKRmltRmI0TE1pbElyVnhhQS9iRGFReVAwems2?=
 =?utf-8?B?Nnc3VEFMaVY1MzFKdlF4SWF4RUwzZDVQVVFHb3lKVDYwQW5na1p6VHBYK2xw?=
 =?utf-8?Q?HEQ/oQa3AsO6rKUHi6Czd6ROP1jXZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGRHME91Tjc2SXc3cjFPb0FDTHBHRGN5S01GK1JwMHY0WGlRdXlPdllvMFky?=
 =?utf-8?B?OWlsOXZPNitRMnpTQnBONG12YWNORXRvVFBoTzNLdXdIL2dUM2d6V2xFWFQ2?=
 =?utf-8?B?Y0tjNzVWMTBaaDZrKzN6bjdMZktmZHNrZHBwbDVSMDlzcFZXV3JnMHB3dkVF?=
 =?utf-8?B?YjZBL3B5ektBQzd5WlQrZHBpblFlMy9iQ2owMmhzdVlOOGFDQmdyS09sR05D?=
 =?utf-8?B?b3hjdENyUWx3bDFYZUR2eE95blRSL2ZYUlVlUmZOQ2NTSG9lNzg0bFQ2ZUtO?=
 =?utf-8?B?Z1FHVWRDaW1Ma1VDTmFsUmtCREkyenR5bTdnVW1UUlBOVkZOc0JiS1laV1Zn?=
 =?utf-8?B?T3ZpejJFMnFQZlhlUkdvdTFKYVA5SDQvR2doQU1yT0xURGtzNTRQQ0s0dGVH?=
 =?utf-8?B?VkpFOHBrZk1DZTlQelZoVGdTY1AzY3pVUFdaTlNVRCtIWFhhbmw4QUE5QjE1?=
 =?utf-8?B?eDRFbUNPeldIMVZvVE9rZFZndHZ2QXR6eUtmaDRBUjgxNFJXbGt6UkFzcmhz?=
 =?utf-8?B?dXVmeFlLVTdqUGl1K0I0VWp2Z2JnR3FOblJkcjNETWdYbUdnVWxPN1FVeHNH?=
 =?utf-8?B?VnE3enFYTGdmZjZPUFROT3N6ejVpZGkzYmhqZ04yekpzaC9NWWcrTldxck5j?=
 =?utf-8?B?THJHTGdoMEtjaXVCNlN5Ync1aTNJaThOWUhMT2NVSkRxZ3F1RGZHZ2VzcUo4?=
 =?utf-8?B?M211T01sTFpQTkVUb0I0U3N2SDZydHkyU0F3M2xyVG5NOFRMOXdwK0tlZ0dB?=
 =?utf-8?B?bERWZUg1czZHM0RUSnIrTWExMjNld1hJbHFaaitTZDNSZ0JYcmNWSkNEeTQ1?=
 =?utf-8?B?TjN3bjRuMDA0U0NlWGpkR24xckdCQ0VMQ0x2U0k2dE01cFRCMDNZWGxCWS9N?=
 =?utf-8?B?eHFqOU1NUHlwU3FLYmJVbGNTM1hHVlhXaUJxYms0SlljeVZ3dzgwR09ZNndk?=
 =?utf-8?B?WStCWmFiNDdxc0puSkp0RW8wUVhFWUZ4N3BGZkQzYStUSFp2RDgvM3hMUGlo?=
 =?utf-8?B?SWlCZ2dkRFI1eUF3R2FUOUxKT1dZbEJuYStUZUp3OFdyeXZudytTby9GZEhm?=
 =?utf-8?B?NExmYVAvZ2pRaFBoeis4aXhFdS9Cd3FqOFRmYi94eU9weUEzZVZHS3FOSTQ0?=
 =?utf-8?B?VUdhbHNNclpVTFpLVXJoU29uWHNXTmNkRHhOcVBZUkRZbmJObjZLdWNSRUxF?=
 =?utf-8?B?U2sveUVuWUVSTUoxNm5YaHEwSEY2UzNzNjhYWjdPUWF1d0syS0JwTE5UUXM1?=
 =?utf-8?B?V1ZFVmNyaFJQRWh0SXNVa1JtM1hzQi9UcW9QUDVKSUk2aURVWU55ektmZFky?=
 =?utf-8?B?SFZyYWp4eVhhOEtnUW5JWDZMOGNqNFNXTGhXZ0NjTWRUOThNaFJSeVN6clNa?=
 =?utf-8?B?OU4zNERxdlJ6TlNONXhXV2UvczJaTUdaM2dmSWlLdVlIZWxXN3orWnBzOVV5?=
 =?utf-8?B?UlIrL0JVY3R5TUFGczFHbHI5NkJOMGd3MS9HUDlmZTJ4ejFSdTRidlVZdkR5?=
 =?utf-8?B?TnhLeXRmT1N5MXdLMEZCTmdOaHNueVhCZnFiQWNZRXFzT1ZvalZyTWFnd01h?=
 =?utf-8?B?QzF3aXBiWm5tNGo1MWZDSzVnZ1ZXUzZ5Nlc5MEdLb1dHSDFMemVuRThnbytJ?=
 =?utf-8?B?eFk2Nk5HVFVnTTFINWpOZ1hLaTNLMllNaTRQUk5TSHlUaTl3YlJRcHc1Q0d2?=
 =?utf-8?B?Y0lZTzRVTlZ4d1RIamt6bFZmcU9OMXFzNnVNWTNpWTd4L1VUa1Z0QnE1Mlp5?=
 =?utf-8?B?ZGE3SmtIQTlDRkxqM3pXUVVmWHJETGcydDBXWERpb250TW9xZDFVOVJrYWVm?=
 =?utf-8?B?UWp3MnpMWjFIcWo0b0ZnTnpDZnUxUXFicCszM09TUXJsMWtFbFBGWXl4SCsy?=
 =?utf-8?B?YXB4NjllUFRRdlAvV2JpNDlHREZrb1pxd1QxbEk3MTRzRDl2WTk5TDF6Vy9n?=
 =?utf-8?B?N3RwbEwrbjFibjcveXdUSVpndm5tblRUeENSM29lZThRRUxERjVNdXBJZ0pU?=
 =?utf-8?B?Z1BHRndyd3NLNGJyS2krSzYraWdobUV1ZlZHMXZZMFdyRFNkT2RXckFpaVpZ?=
 =?utf-8?B?RkVjVFBja3NTZVlVQS9PNEZRT1FGRVJyc3lKVzJ1Sm1yNS9RVWRqRGFEZGU3?=
 =?utf-8?Q?rEGc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154b07c1-6d91-41d3-e524-08de2d0186a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:36:11.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCL/Vgy3GBt64Tqmy7deP79LLdiyaax+amamibshrlSduh3uanSMq5bbpSf3x30I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
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

On 11/26/25 16:34, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-11-21 kl. 16:12, skrev Christian König:
>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>> Until now ttm stored a single pipelined eviction fence which means
>>> drivers had to use a single entity for these evictions.
>>>
>>> To lift this requirement, this commit allows up to 8 entities to
>>> be used.
>>>
>>> Ideally a dma_resv object would have been used as a container of
>>> the eviction fences, but the locking rules makes it complex.
>>> dma_resv all have the same ww_class, which means "Attempting to
>>> lock more mutexes after ww_acquire_done." is an error.
>>>
>>> One alternative considered was to introduced a 2nd ww_class for
>>> specific resv to hold a single "transient" lock (= the resv lock
>>> would only be held for a short period, without taking any other
>>> locks).
>>>
>>> The other option, is to statically reserve a fence array, and
>>> extend the existing code to deal with N fences, instead of 1.
>>>
>>> The driver is still responsible to reserve the correct number
>>> of fence slots.
>>>
>>> ---
>>> v2:
>>> - simplified code
>>> - dropped n_fences
>>> - name changes
>>> v3: use ttm_resource_manager_cleanup
>>> ---
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Going to push separately to drm-misc-next on Monday.
>>
> Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.

Thanks for the note! But hui? We changed amdgpu to not touch the move fence.

Give me a second.

Thanks,
Christian.

> 
> Kind regards,
> ~Maarten Lankhorst

