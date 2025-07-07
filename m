Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1CAFB369
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597B510E294;
	Mon,  7 Jul 2025 12:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DZ0uuYhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F8410E132;
 Mon,  7 Jul 2025 12:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR/IotMvsWZIFDc8RXpXn6Tgq/qMsa937vOWSgdehiAC9MHK5tOKVgSm5ivPh3cSxXu0B2vEGjaEz3lUsi0bQ9Rm8F/vDgArZEQVjGRV3V2C5xm7/yQHPcqKOHtjo9Xq+HTUU7+702BksgA7Ceoxy9uCvcnv/F4KI/qseJeMLXuKeoFyE5Xzwe6QIrKwCtxPcnJhugAId5qDXwZE8xfuDPu1xPHDruaLclRsiYMsrmCyf2P2d+UoSUTHN2/sef4/Xj9Aux28KPCU666sgmCz1N29cO7NIjJ4bzTBdcri0E0sKq7OpcScRwbrWIdwvTxdljDXQhXEm+HwU99qbrnxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4smU5UTv1t5VmltbQUnEhKffmf4eHLSYiobKuUp6so=;
 b=mvAcH/NuXv0oWHQYDt1SKT8v1nPKKt19KZK08/NVKay/F+7OpoWrFbE+LcNH1skoNAecHO/wPszw9R5hNrMu/u4qeibxJmxjfRhweS3kuvAkSTjpxH/lcULlCBU3LwYJ/WQeLedtBn6tqL69bDaaCKZE1/ccImlVmZMJeexZe4k35LJ048s2X4dnV2y2gi1HtLJqMYaC2qkGyRhVC8VEEGzEOt3p2/e5FzeHsZQuMKEifiWRpZKzBvObNqs+Hig1bmLPhkLmIk1o3q/UkPD3BdMDCHL0+8lC83JM7uUeKPzWNXFKAjWyfByo2CqFIvXTIZ4j3YaBoMgzmkwMZp4aZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4smU5UTv1t5VmltbQUnEhKffmf4eHLSYiobKuUp6so=;
 b=DZ0uuYhf4Pnfmn6i46BgQH8zPOWITZPUASo71MOiF7X3+pXZLO3vdSlXWp3Chja4ruaLJ7N0gdXHXpKv4Uzxa2/bS38e3A/TDfQqxmrilsnkEyPYnBFBibgRqrA++maeVh8LVtt1RX0YNRlDhWHZwIE0ges7M4aKw0rTWSn7IK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Mon, 7 Jul
 2025 12:38:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:38:11 +0000
Message-ID: <4a115c5b-8e91-4ce9-88c7-cf3f3f9d3aa4@amd.com>
Date: Mon, 7 Jul 2025 14:38:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: rename ttm_bo_put to _fini
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250702110028.2521-1-christian.koenig@amd.com>
 <20250702110028.2521-2-christian.koenig@amd.com>
 <aGWsVBA45EVO/yhM@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aGWsVBA45EVO/yhM@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d642b2e-4bfe-4c4c-58d4-08ddbd532262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3U5OXNKbGhSUUZpWEZGenNVVFlvQzdTT2pnTi82QjNiZ0dvVkRZMWMvU0hy?=
 =?utf-8?B?TUVuQTd5ekRRU0RGYlVRdWFlaTNRblNINUJMdjNQOWhrekRHRUh6MVk4eStv?=
 =?utf-8?B?elNYS2dqREhQWU1WKy9kT1BUM21yZ2RpVENkRTF5ZmVaTnovS2pCSGprdFVl?=
 =?utf-8?B?aC9ZblFCQ0FOMEJzTWh3dVZ0YUxOaHdjZzUyWXFrSk5rNGNsZ1lSR0VVNkJq?=
 =?utf-8?B?czBiQk5ENnJVbWk5R0VaNVJONXFKbXdKZkRSdFpiYndhSzhhTEpyRzh2aDFZ?=
 =?utf-8?B?QVFkT1VSVlpYaUUva202VVArVWJwL3lrVktzWG9NcVNpcXUrNGUyMDBkMFhX?=
 =?utf-8?B?RlpBb093QnBzVUdKTXBkRWk0dWVWYnR0V0k5VFpERnI5d3k1NnBkN1VrRGVW?=
 =?utf-8?B?NGZydVN3KzZ4Tmc5WXoyb1ZvVjdMZW5NYkxDdUJtOTRCTyszcVJveFJJM0N6?=
 =?utf-8?B?aUd3RE9xaHlhejU3K2JPM3NXL1lmamtXV04xYzRBVVpaait1emhUY2dWTmhI?=
 =?utf-8?B?YjNjZ3N5N3FOMHhLdUEvQU5QYnFRcGRBMHJXQW1yT2NNRUxaZkJUQlNDMEpY?=
 =?utf-8?B?WnAxSEVSajhvK3VqQzlQSXR4TUhYcEU4UzAwbnFGY1VTOG1CVks2SHQrNVo4?=
 =?utf-8?B?U2xjaWpmVURkdlM5Y1A3RHlkYUovNFFrOFFDS0d1QkNidWEwaFNRT09tNXZ4?=
 =?utf-8?B?b20zTEpQRkkxU0VvZE5CVFBkMnZ2ckpuYStwWWdmNTZPa00wVHQwRStUQlNz?=
 =?utf-8?B?VDZuUWlaeGVJVmZWMFl4VUlXRFZ5WEMrcHd3VkN1VjJ1dng2SG9uTHhKYlFx?=
 =?utf-8?B?N01ob0dIRFgrNGl6blVmSWRPQVRVNldIVWpDWUZMTEpWQnhMdWhZMEZJYUI1?=
 =?utf-8?B?MUZyVUtQKzhYWGw4Tk0wSDJtVmlaRkx0ck5la1kxNU5xS1d5Wk5TRVRaOE42?=
 =?utf-8?B?bm9BdmROYUtpdURGY0JtMDJGaFoweWZCSTR5c3BuUXdwSFNDeXU0UXM4OTda?=
 =?utf-8?B?TzFZRXlSUlhHZGQxWFlrT1pHeUNIWnNyZDBMdnovRHNWUmhPWFd0UHdZOVc4?=
 =?utf-8?B?WWVHRWV4bXU4OHJGTkNqSzg0RllJY2R4UVdaYWIrSUcwNCtnbE1DTUdnRUxy?=
 =?utf-8?B?VzNPcDRsejhCdk15K0ZjamltNVo0akx2cy82TmtsVEJVUmxqV283U0RObGFP?=
 =?utf-8?B?M0w5Zi8zWU5pK0ZwSXdialZ1SGZuSWJBQTdLRU5XT29OcllBSVlacFR4TTF1?=
 =?utf-8?B?bDgvUDU5YnA1RWhTaFphRUJZSHplcVNLVWNnbjZVaXRMaW8rZzR1TjhJMXZE?=
 =?utf-8?B?M1FMSEhWckM5aTBpT0p2Y3d6czdTUDFEdFZORFUzbjhKcDhkTk44YlAxcGxV?=
 =?utf-8?B?amcvS1FZMEtpOHc4bkRIeCtNYTBSZXA4NUYrWXkvdG82Q2dPUDQ1NDZpM2Fs?=
 =?utf-8?B?YXpYY2FPZ09oczgwUFlrdXZrUzZnS0h3czRwV2VSZnpMUGJkWTNtMlpGb2Zx?=
 =?utf-8?B?c2hTMEprLys4eEx6RE5GNnVCOHNycGF0MVRudlByaDF5R2VtUXhLdURwQ2Er?=
 =?utf-8?B?RHpzOEo2dWdDR1Z4d0pETnA2Z3U2WE0zZWN1Qmk5d1A2Z0RiK2h1QythRURY?=
 =?utf-8?B?SVdvS05kNVA1ak1SUE1Pd1YzNlg4SmM1dGx2OU5OWTBaWVdERXZRUFR4eWVr?=
 =?utf-8?B?TFF2ZGxRNnlXQ051NjlqWXlHWXRsdCsrc0ZwWmh1cVlQbmdVUVk0NlErM1Za?=
 =?utf-8?B?V0M2bnBlckIrekdjSXpJWi9QTFc1TmlRaTdyRUx6TVRPRUhrazJMYjNPZGlQ?=
 =?utf-8?B?VHpvRFRWSlVXMko5OEE4V2ZEWVJtMHBranR1STBTN2dzZXRQSzQ4REdTSkFI?=
 =?utf-8?B?KzE1ZFVNOHBWa1VibTJ1d29VK1VXYXdYNlcrcC9qSDh4SWowQlpUSlc5NlFI?=
 =?utf-8?Q?tQeqDwwztmg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0p6Vk84YnQ1ZG8zV2o2RE5NajFrQUZ1Z0NNWGRGY05SUnNPVHRESnZiTFVp?=
 =?utf-8?B?RmxoaVF3VnA0dWlBZmNnbnNXa2FrY1pRSTRJWS9TN2EyeEZKbW9ja1J5QkF0?=
 =?utf-8?B?Nk4vNzNDZkxBak1CT3NaUzBTaVFCclIxUndwKzRKeUpJeHBwbm04Mm9BK21m?=
 =?utf-8?B?b2pxMlpsZXFvZ2NnQTgzU2NVN0RvMWRjckNXQklYdUN5alBsTzdXZnNkSFhq?=
 =?utf-8?B?dlNvMXNHSGVKOWRlcVdqNXJYWmdLWmtNck1qMDlaRVk0MXFMYXh0WHVFTFBo?=
 =?utf-8?B?TEs0TmtKL2N5SlpybHp4NjQweGhDQm4zZHJXRm5XT2NBSWlaWFcwalZFM3d6?=
 =?utf-8?B?Tk81dTVuKzRMdEJGTnJXdUp3OC9VWGdSRmV0dEtjTVJLbjBpZWhkalZDMHR1?=
 =?utf-8?B?RHFhM2hpNDduajI0Q3Zxci9jYVlkQ2svM3NSOFNmeWxienA2Mk8wOG9WTkZN?=
 =?utf-8?B?WElJTFQ3SG1iT0tvSXBtT2N0Qy9IVEtnU2FHYlVPalFXZjF5N3ZHQVhzblN6?=
 =?utf-8?B?bE5UbmNzUXdPbHdYdWZlSTZmakNzMDhTOTg5NTJ6eForOVpFcGhZTkpjejdk?=
 =?utf-8?B?blVPdHAvVEtOUHM0aGNSM2NmMElIeHgzRVhPNXRjTHlpbXMyOXIyWXJvbXRk?=
 =?utf-8?B?aGw5dDFtRWpwYWVSQ2VoMFdZTFlYSnZOOTlwOWZkN2kxQ3ArQ3E0MWlUSFNU?=
 =?utf-8?B?WUE2aC82cjVNS3pEY1NoNjBqR2hkcGFkOTh5Z2ppaW9Dd2s3Nmk5RCtJZTRz?=
 =?utf-8?B?VnAySC9MSkhZVUY0WXdvRHNDTU4xUzZrUFlCcHhxTVVwTTVzU0w3V1FFd3po?=
 =?utf-8?B?Mk1mNThhMC8vQmVlVzVSVzMwdDIwWjh5QjJLYlQ4bTZ0cml6a3cvZU1rUk10?=
 =?utf-8?B?S0lOdUp6RnYydmZRdnprRGVPeVEvaHBndVRhWlRMRG5IaGVGeHZENUhMUVl1?=
 =?utf-8?B?VHgwN2czeE01dlBqNmhQOVlDQjg1ckdIbGdNWjlDRXBYYlZXN0o5VmlWUHgx?=
 =?utf-8?B?allwMmloUE5iYzNJTVpCQnhLSlE5M0phb3B0UEZFNG5ycG5aWVN4OWFrcGNP?=
 =?utf-8?B?TmJaWjNuQTZrT1Y1WExFRU5DQUd3bWZSSER4K0FsWVJ3dFhTc0dmOGNHTThD?=
 =?utf-8?B?UUFjWWN6LzVUeEhNQVJqY2lPVS90ZytSOGNQRlZFYVRybmVoc2wxTkg4bVVi?=
 =?utf-8?B?ejdTQ1Q3dWNoY1ZvcW80YU1od29DeUx0SmhIQWV3dVUyMGdoTFBmQmRHc3Fh?=
 =?utf-8?B?L0RWdGJkSEtHbHZlMVJiSEdYLy9HeSszcDVwbEdFV2ZRYjF4YjYvZUV0andz?=
 =?utf-8?B?WVRaaHZMU2kweVA1cHJrdWZCR3ZWM1JuZitkTFlTZ29lT0pGZ2wzQUxmQWln?=
 =?utf-8?B?bkVJY0ZIb2NzcjRFLzNUQ2Y3NXJrQ3pjZ2dEeEZWVXF2UTNiYVhVRkFySjl0?=
 =?utf-8?B?cHVXUVowK2ROeHFacFFjeHlLcEtWNjNsdXdJTUVVdVlEVHJJQWdaNUptVlM5?=
 =?utf-8?B?QXZ0ZXZpYkgxdWpRQ1JQYXczeFR3TjEwc1p2VW9GNlFtUGNZV3V0R0owOUVm?=
 =?utf-8?B?d1NXeVBOM1hDMXBnb1BSWC9wRUp5WW1BZWFuVmoyWDRxaCt1cHRwdU1QcFMr?=
 =?utf-8?B?RHlRY0p2bnNqSWZqZVp0L045dWNKRHJqcE5aZVRnNHUwbEc4dVkreVFqaGt5?=
 =?utf-8?B?MGFwK2hqK0lYUThMQzllOFJ3R1lYL0U4RWhPc2pDaXZLQWhtcFgzYlJwMWNZ?=
 =?utf-8?B?YkNtOUJoby9jdUhGaWluUUg2WllzTytVYllpS002bFphdHAxbytVaGJMeGxK?=
 =?utf-8?B?bjFmMERFZzZ3L0IrQUdYZEdMclNxMUNLMk5oTlV2eGZFTlJLSDVsT3QyWkN2?=
 =?utf-8?B?Z2VtSUdjRHRkNFM2UjN0MW1OcFpEanh5NmxVY0Z0N1QzbWxyMmJOREN3YlA5?=
 =?utf-8?B?THZyNFBMTC9RbGZ0d1B4eStYOGRsQVo2OU1uMEtJaVJ1N2U1OGdMcWwyZDR2?=
 =?utf-8?B?NUhtQXNRRFFCSnAvRnY4Um5RUGwzSDJzV0VkNUdCbng4cUh3eTZRMWNocy9k?=
 =?utf-8?B?azJWSXo2cTRtUEhPbUIwZ2liK2EwOFhqeXV6czl1TFppTXFSWlpaL25WRm4y?=
 =?utf-8?Q?DtZVXpuRghfAKUO8P4SaKVlqK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d642b2e-4bfe-4c4c-58d4-08ddbd532262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:38:11.6124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjctlY586hF08QpCDOXnZ1Nyz4IYvv1YAJBDHir41JUUCiYbL0U2GfznC7VVqUA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642
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

On 03.07.25 00:01, Matthew Brost wrote:
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> index 6c77550c51af..5426b435f702 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>>  	dma_resv_fini(resv);
>>  }
>>  
>> -static void ttm_bo_put_basic(struct kunit *test)
>> +static void ttm_bo_fini_basic(struct kunit *test)
>>  {
>>  	struct ttm_test_devices *priv = test->priv;
>>  	struct ttm_buffer_object *bo;
>> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
>>  	dma_resv_unlock(bo->base.resv);
>>  	KUNIT_EXPECT_EQ(test, err, 0);
>>  
>> -	ttm_bo_put(bo);
>> +	ttm_bo_fini(bo);
> 
> Intel's CI [1], see Kunit tab, is indicating an issue with the
> selftests.

Even without any change the ttm_bo_validate subtest is crashing for me and I was about to disable those crashing tests.

My guess is that the test never worked 100% reliable and relies on some incorrect assumptions.

> Unsure if this suggestion would fix the kunit failure, but
> would it not be better to just ref count gem BOs in the kunit tests and
> create a mock drm_gem_object_funcs ops in in which free calls
> ttm_bo_fini? Then in selftests replace ttm_bo_fini with
> drm_gem_object_put?

Yeah that is one possible solution I had in mind as well, but I thought about disabling the failed test first and then discussion with Thomas what to do about it.

Christian.

> 
> Matt 
