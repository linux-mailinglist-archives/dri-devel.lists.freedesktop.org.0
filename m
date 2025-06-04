Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467DACDA43
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD38010E1CD;
	Wed,  4 Jun 2025 08:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uJamZqkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6B910E126;
 Wed,  4 Jun 2025 08:52:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIBjJ/LW4oqw+uRiCccydPbynuOgPTJ+RBJ9EVft1HsHDwvAT8pkn9kpuC76hgwGcKdLDRyOElzSQ6TDaLCjZPBj/sMSTSuz9P84YZLgw9qnrqHczg2koKm74ouwbblg/Y8BOWqpiwQ5ZOKgcU6yhf3GE4Bf+42wIvWGrKFGRg6R9tltSPJblirV5lE/In3tG7b/XVwuS040I+Yd1jdFTkFBWpjxYk3fKcz7hf7zaVsSV6/IeKnbDwXLLb+IqMDHXBoK+ysKwsojg5PVbp66DRH03BYaqI37z45Ch7Juxcr1M7QhwoFJs8EtGuGhJZpqNEokG/Jkne1Sgx57jq7O+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLEdB7HzKF/0GyNwEWZ30IgIXBj79NsQV3C5Dpyoon8=;
 b=XHz5LD2gxxWPqgWEUJVKNpfgrT4i05KRWF3GhAKh+8ku4Yvp+D1D8JY3VYtiKaBAcJU5G9YaqkeE2PqL7B09rKFgyCot2ORzOX/eIfe2zkyvc6pqBx7QRCl+dfCouV3bD+RLDt9inQNUT+uBhJvDVVSM7i+H1FltTlN/rN1GedwBAYTkMdL+eQOVJYuJ6/s+PKN4v8iZc17pDdS2ACgMOWrFDn7zSkKv4BuMJAmfGHNnAmqDsWSqjI5Vkdoz7i9S4mdjtMkFoVRjksVs+3ykzcaPVhADga1lFG2F4TitRaOsI3aw26GRW+FZ83H/P61HGmkivhYY2ldztgjomBZcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLEdB7HzKF/0GyNwEWZ30IgIXBj79NsQV3C5Dpyoon8=;
 b=uJamZqkVU0yW1K124YJlHWhl0ObkOzrYjzWUbpcSIbXVt6JVEsCVPgSCHFsctGkjB0aGn3nHucncozw42gvDk/w46S8k2e4ggCU6uh2DmaBMJCsfn2xcERC59sST61vmvXj1h61RhlZmhQjshGdEnlCSnhtyRjZWSy5IQz7icUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 08:52:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 4 Jun 2025
 08:52:02 +0000
Message-ID: <0e92b868-58bd-41cd-8ddf-d2aabd137ed2@amd.com>
Date: Wed, 4 Jun 2025 10:51:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix build with CONFIG_DEBUG_FS=n
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250603184750.3304647-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250603184750.3304647-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: ff53fc27-b6ac-49de-d95d-08dda34512c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjFpcjZoK3ZhTzd6aDBVTHJpc1JXNWd6WHQyWTA4QWtETjkyYy9WWFR1YUlS?=
 =?utf-8?B?M1A4Z1h5OHRFTjJMdFNMLzJKRHJyVk43VzY0VGlQeDUzUXdoaUtxVFl6Tk1o?=
 =?utf-8?B?VXV0OG9KT2tBL21COXJmQ3pUUXdxdlRUdDN5K0ZCZjlYU3lvOVRSNi9wUDIw?=
 =?utf-8?B?SEg4SWhsV3VDUlZmMDVVSTA1Rm1ZcGpOYlBIWUY3L25ZVTlUSUNpeUJaQlZC?=
 =?utf-8?B?VCt3MTlmaHQ4QmV4Q0hMRncydHlQY1IxbXdVdktzbWxhRDJDWmhpRklsTlYw?=
 =?utf-8?B?dzd4TSs5Zm1TSFdyNmNBMTZtTHJMdFVCTnhtQW5FUUQ2M3Q1S2h6bE9MakI5?=
 =?utf-8?B?WG5jNTN3ZjBXbERBNEhFRCtPRVBiQ3dVTjhST2N6eUNYRUtoUVdGZXc5RExn?=
 =?utf-8?B?eDRUUEx1amwyOGF6RzVMQitoWVB1cko3UGpIWEdpOE1nL1E3K2JSMlVUOTFI?=
 =?utf-8?B?YUpFb2x2ZTVoZG02WEVGUkl4U2t5ME8xZE9xZ1l5djBlVEhXd05CUjdudTV3?=
 =?utf-8?B?TnRrWVhxdHhUQ1doMWtiYU5UZDdaU3JHYjdsbWZjNEtzRDNtVkJ3Zkg3czFG?=
 =?utf-8?B?NEtlMnVxdGZYY1ZMekZmV3hKV3AzdEhOTnhGeWI3MHZFeml1S09hVnJVK2hL?=
 =?utf-8?B?R0M4dmo0SE1RR1g2S1AyWElkUm1rd1BSdFdIcXBLcldicFBoaGtKaVpzdW43?=
 =?utf-8?B?Ylduc0ZYekZST2NiZ041OEZYSWR3RXAwcVN0a29URFM3c3dMaHp3UmRNT2c0?=
 =?utf-8?B?eFVRY3pjU1RaeW84L3NDSDM0bDQwT2d6ZklWVGVyMzZYVmIyNlhVTWdnbTdq?=
 =?utf-8?B?ZE9nZjlGTTU2djUxTDNSejgzc2RrUWYyOEJzZzdTZC9HbTlYTnd5cDlvQ056?=
 =?utf-8?B?UCtnY0RYWE1BN3AwMWYvYTk3N3ZjWCtyWkxVNTN1blFwZ3RHdEdCK2ozelMv?=
 =?utf-8?B?b1N3MUFzMjZzOUVQVGpoQnNxdFRBWEErdjZDaEQ1OUxwdWViZDAzUit0azNL?=
 =?utf-8?B?ZEJ4MWVZWnVDWURYN2FBUW4zM0tsNzlMbzFIVFpMU25wVm9DOGY5SkhOQmlx?=
 =?utf-8?B?akg3YlFoZ2lzN2RVenVzUnp5V3JNam90YXZ0WUNDZlhlMkIrVjkvRkRRMzcy?=
 =?utf-8?B?RlIvb1JML3BxSXFpeTdYSTg0aXZTNFRFVncyN3FtVzlwMFpJbE5xQ0YwN3g2?=
 =?utf-8?B?WE04RHFOWXdCQWhnckoyd2w2SzI4SDgxTVJJUDBMTVN5Yk1iVU54d0hWY1FL?=
 =?utf-8?B?SHFWWUk3V2JSU2FvWDcyZHZFTmh5ckV2eFFiTUxXWkVMNkdOTHBkZ1FvV0FU?=
 =?utf-8?B?TlUyeXBNNlFSdmp0eXljeXJQRVZxYldqZ0p6Q3FINW5TNW4yRTNIa05udHlT?=
 =?utf-8?B?czlGMDFYT2ZoQmFHQ1JVT255MDNvQjI3ZjY0eUhKdEp6YTZhOHhuT1hqRGtZ?=
 =?utf-8?B?RXRQV2dBa3QzNngzU3ZLWFVHcUpNTHd6WlhMb2Q0RWllZFptaHRhM01QOXNP?=
 =?utf-8?B?amFJc3FsSitVczdXeHljdXgyOXNlTUpsWkhPVFU2UXhJZi8zMnZ4VW1taEpG?=
 =?utf-8?B?b3lZK1JCZ2dnTjN5YkFTNTVsYXdoS1dLS3VXUFRXQ2doSXV1WitvSTdzWGd5?=
 =?utf-8?B?cVJkdXBWNkJyR2tMZXQ4N3ovUGt6UkFYL1o3MDRQam1KV2ppMStXQml0TUgy?=
 =?utf-8?B?emN1dnduWHB4b3cxakZDNElZVkxVVzl2UldIaFFNZ2FSRjZlTEJ0VVVOTWZM?=
 =?utf-8?B?L0wyblBQU011NHJCVmNxVXg4OHFIU3htZi9tQkR4dU5xUFViYkZGQ20wdjE4?=
 =?utf-8?B?cWJlSnUxM0tGQlA5alcxUGNidVVFV016YmJjZ1FpdkNxdzhRWGw5NWNaZDZ5?=
 =?utf-8?B?VmEyT0IrNmlvb1JnK2lyYW84VlRhdnZIa3ErdUxjMWZubm9XaXlENlBpWFpi?=
 =?utf-8?Q?mlkXE6IrfuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXFZdDVzVWpKbVlzWHd6UE1rNW0wcUtMc1Q5L0txbHRnYnZuRTd0M2VrZmUy?=
 =?utf-8?B?aU9WWUtCMW42aVhtQThLQkM5OTg5aXFuemdrOXhxeGpGelZiQ2dJUjRDTG1m?=
 =?utf-8?B?aE5QZ0hybGRkd3BEK3I4N0xCMXROdVd0TWR3U09ub3ppKzFXMXVObS9NSjRS?=
 =?utf-8?B?Q0pWVXhIWllheWFGMHJOempVNGFEc2NkVWFVK24rdHZMbXN1YUIyVFErb3l5?=
 =?utf-8?B?Y2FwZlpMWDh2MlJ6MzZsZ3hBQ3V6dG1tVWc0NVpQVTFaUi83VlBjRlZweStL?=
 =?utf-8?B?MDJ2ckdGSFZUWlFrMFdqQWI0MTFjSWxKbmQycFMzZlJZSHZZOWlxT1M3VHNk?=
 =?utf-8?B?UjE1MnBPVFhieTgzek9ZUUs4a0FyS3JkTUd1ZTVKUzdmMG95elFmTVQ0STVT?=
 =?utf-8?B?YXlSdk9mZm5ObjMrUDUwcTBxcWQ3aS9VLzFpM0VmcDQ4UnFtQVFzeHhGSXl0?=
 =?utf-8?B?ZHYvNEsva3kybnFnbE56MklKZWUxUTcvT2xDS2RiQ2lvWDc3Qm5QQm5HYUpI?=
 =?utf-8?B?S0FzZ1phK2dPaG1XY2NEbUR3YnNwcUtOc09yNGN1YWlEbjZwcjZ1TnZLbTBx?=
 =?utf-8?B?RDR3TU1tVk9UbUxtQllsU2M4S3BZaENSbkRIbVpXZk1jelNoSStlWTZHeGM5?=
 =?utf-8?B?bEVCeHNRZHQyVTBEdDIzdDcrdkR3MjNzS3VCd1ZXSVF2akl1ditZRjFLVEpY?=
 =?utf-8?B?UTczbGFUS0Ivd1dZcnRPM082RmgrVEYwZEo5RFZSb0tMa1FvRkt2aWxweE1I?=
 =?utf-8?B?emt6QzhndlZDcitYd3ZLc3pXbXcwMjU5dVdXRnJEdVhDZGRjWkFjdklIWEhk?=
 =?utf-8?B?NlJ5MnI0TzVJVzNkMHVPVTVhWGFLZlRaT05uV2ZRUUJTNWgreHR3aDA2TThn?=
 =?utf-8?B?UkhrSXREdXRwcHZMSVZlZXYvM2h6SjNEbHoxS3A2cXhvWVZVRVN1TVVHb1dq?=
 =?utf-8?B?N1dnWVRCTlBFQS9OckhYM3VCVjBnVERNRllBWXFxaGIxU25sK0daN1I0WUZh?=
 =?utf-8?B?dUtJT0kwcVJFN1hCUTgveVRYZ0dTSFZjZGFMVHFyVWxHU2Vacm1DdWlyNkxl?=
 =?utf-8?B?WStRSWZNamhPWnNXaVFpem5pU0lrWEFtdjJnZHo5R3crd0ZUYU5RbUZhOGRj?=
 =?utf-8?B?Vm5oeHNBYm5mMlBWaU5ROWFXNGlMd1BoNkFUUzZ6SU9ockRHRUp1QUtjT2VR?=
 =?utf-8?B?MlpLZG9xV2h6K3VkOU1ISzZBeUV5ZlAvOVZRRHltcmx6U3F3VURmaTNXOFdS?=
 =?utf-8?B?T2JidDByVXk4K1h3VUpqUHVFbEtCa1ZhZEJPN0cyMnptL2RubUI3Wkk4c0NP?=
 =?utf-8?B?RWNkOUN0b1FaSG9EYjZrZDhpcFRjRlhCRk9oa3F1RGNLQ2szZXpWQkFWOE5i?=
 =?utf-8?B?S21NeWxhQi9mL1FzT2hlNHFhc09CWFM5TTl1NTZyUzVSZFdSN0RsR3NyeklF?=
 =?utf-8?B?Wk5vUnZmZktVTzlEYUFYMHh4c2dTZWVsYWhVYXhHK3IvZ3NsTUFIU1MwOTVD?=
 =?utf-8?B?NVhYOGlnSFp6dDd1ZVpOQTc0aDM0UDVsK1JoU2JoTENIb3dMWm1iMFZNOU8x?=
 =?utf-8?B?NW5WSSt6Tlh0TWxIejhUUU1PczVsRzNxMU14eVl0dkY2UXhCb0hKOVh6REts?=
 =?utf-8?B?b3BLZ3Z5OUczN1RRdXBXbVZkZXEvcEJlT2xLUnFPVnhWOWZ0cWtCWWl4R0NM?=
 =?utf-8?B?RlpJZ1dVbzhkaG1BSG5zMEp5T3pJSWIyemsyemorSDVkempKeDFyUDdwcHFp?=
 =?utf-8?B?MFArQUF4YVN3L3NxM3NtSzRQWTFZVENDREwzOVQyMU9mbTRLcG9YTDNxR2l3?=
 =?utf-8?B?bDUwVWVCMVJOSUZKNitYYUNVNEZDa0lJOXhJcnpPOWEvVnF3Q0JvNGdKdlBa?=
 =?utf-8?B?Ly9FbnN3TTAzRWREME4vUjd5aENxSzVvaXJqd2JPc2twYitqMDREUWdra0ov?=
 =?utf-8?B?RXBtZjlsMk5hRXpFWXhWSzhhRDJNMFJlNUwyU1gzbU1TaWN1c0NER1NTV0Nn?=
 =?utf-8?B?ejdFa0RYR1dITEtuYWEwamR1blR0RC9QQnFZVHRpbktON3hTQks5Vkc2R3hz?=
 =?utf-8?B?NTR6UkozT24rMGpNMHUyYzdTU0ptZ3NaRXhvaXFTRUR5VG9NcTBLWXpyQzZk?=
 =?utf-8?Q?g7KnWIcF4bcmurxBwEZYV932p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff53fc27-b6ac-49de-d95d-08dda34512c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:52:02.0689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Zvmztk2f2bb5Xp/ps+FLsOBNWLtx8coxHm8f1eBlfEa7nLZWsvydOa0KAOdC2/Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054
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

On 6/3/25 20:47, Lucas De Marchi wrote:
> Move the define outside the ifdef for CONFIG_DEBUG_FS to fix the build.
> This currently breaks drm kunit tests:
> 
> 	$ ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/ttm/tests/.kunitconfig
> 	ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
> 	../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
> 	 1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
> 
> Fixes: 22b929b25293 ("drm/ttm: Increase pool shrinker batch target")
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I think moving it to the top of the file would be cleaner, but having it directly above the shrinker code is potentially valid as well.

Either way feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> if it hasn't already been pushed.

Regards,
Christian.

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index e671812789ea7..2dead28a6c1c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1132,6 +1132,9 @@ void ttm_pool_fini(struct ttm_pool *pool)
>  }
>  EXPORT_SYMBOL(ttm_pool_fini);
>  
> +/* Free average pool number of pages.  */
> +#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
> +
>  static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
> @@ -1265,9 +1268,6 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  }
>  EXPORT_SYMBOL(ttm_pool_debugfs);
>  
> -/* Free average pool number of pages.  */
> -#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
> -
>  /* Test the shrinker functions and dump the result */
>  static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>  {

