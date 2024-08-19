Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68C95693B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7410E22B;
	Mon, 19 Aug 2024 11:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="APE2veF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045FF10E22B;
 Mon, 19 Aug 2024 11:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps9oQqyN6agxFyE+8DaMOPsJc1T0RouH92wo5iRHssv5+tWNJpzyywz2dN7JIir4mz5Rxnn0nfvXhn9ZL/TRiJiMdJ22f3Y7NJACiSzjijhlTpTu7hKU87V0dLS1bHIou+PpfzT4WutmUB5m5PFjeU9RauDDppdBgM+J02KbgjyvtOjOVuTMSQ4kfwDvtcdQGd1nkMsYngU764AmzC3a12IFYPhjuuImmgoMzCenuxiC6oncM1VIX5am6QEWveGiRLJQdb/qHMUUa/9TE7BpNaiylLP4cA1hVaFYphrqW9NR+7mqO13DQ1bGOtfHM/MR4FLoav5cky7rwNtK/BhJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNCu4fR7H6gDWWapnaJw0lEtJxqiFrzZll2g9kTuq+E=;
 b=f6318PaZwGZVAGJIlycz8xnJ6VO7D1wToKWi13RxoJOTyVBP6MZzthxResVeCt9bjBG0wUoV9mnbJoLRkyzORa119ENI6u0sMcWek2Z9/AsZ8xQJQ79aqLqUn/Vj43NvLcXPk+k8dXhTZ2FtywyEIHSHMSjrirM04LzIs5BccsMOH+EFd7W+/L/Byc4Lc8RDqEznYlb/WW8RHL8vUj1lqWn9RC3qELFDN8OEWl34XhFhHKdPxfFiirtXzbP3uSGj+D14MwPcf79toOWtQn3avinqHpDp3Ove0iZ30xpZUE+Bd5g0T9QMwlv0Wnr+rQYwb4CAbbeK0QFShFSmLyQQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNCu4fR7H6gDWWapnaJw0lEtJxqiFrzZll2g9kTuq+E=;
 b=APE2veF9abaIOTZyh67suChEMJZWg4w2mB7O2EyWsURWb7pIFUm7jTDA8Jr8qBukt7dfXSt/iBZv/WWW2o4592OXTE8/rzQIWwekMmHKzPIFIVXC89+bM1L7bS/GYjH4WaWKwxrn0K6xoA41JDHdPNhQH2yFVFs5yYxVbwMqXJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 11:21:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 11:21:58 +0000
Message-ID: <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
Date: Mon, 19 Aug 2024 13:21:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: Friedrich Vock <friedrich.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240819072110.108715-1-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9bd452-38d4-48ac-73a4-08dcc04123c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFJ5TkFUaklWNnl3TWM0b3J5cHMyS3hvNHZXNTM4eGZRQkxxYnk1aXBMTlZJ?=
 =?utf-8?B?M3BQalpkVFZwY3NTWHB2Rmx1RG9mTE0vSGhodCtUK3lzWUJ1R0VjdlJPaXJ0?=
 =?utf-8?B?QTQ5N1Z3VTNXaExuOUI0QVA5dHpZak8zdDYyTTlUWUg1a3lTQXdzMU9uNGE5?=
 =?utf-8?B?Wk1oOHZpazBCRExKc1F6UTFrdFhDRzkrNnlsanBLM3ZZTVRhcGtzT1pLanJ2?=
 =?utf-8?B?TVozeEZqYkhCb2I3UitTaHV6YXZvMXUvWmFKanBjalpvMjdkTHVpVjV2Wm9E?=
 =?utf-8?B?YkJhTzBlaUdyTUZtVTBBaURTVmVISlVGdjhjelJ3LzZQZUZuV084aTJuSWw5?=
 =?utf-8?B?MnQvTnhqNVZTYThmNHBQSzBmOFBBdUkwSnV3RE00YXQ0OGdiS3V1a3BZU0ho?=
 =?utf-8?B?V25Gb3gxMzVxRGhnd0ZNWnZNS0JwRGZFdWIvS21BeWFoU2I1NDFVZE9rTzM5?=
 =?utf-8?B?TVMrOXVwQzJ5VDgrbXpzUEpCN0hKU2xmdGNrQzdhK2Q2RWV0Z2lqSEwzRXZS?=
 =?utf-8?B?NG1ncWQrREZlcXpCZHZRT2RNRFRCNlpPUXBsWnp1bmE3dUpHRG1PT3JlWWNS?=
 =?utf-8?B?b1lTM1ZRN0xjOHlsdSt5VERJa1NFUFp3M0Fodzc1VHUwaUJsREJKQzdpQVVi?=
 =?utf-8?B?WXF2VVVrZWVpcmJjempOZW5YM1RzN2R0MTR6R0JqL0Q1Q1BSSkdGcWFFb0U4?=
 =?utf-8?B?dFF0NGdDWlJzQXFTczUwV0k4dy80Z2dBZ0N3VXNSdnptdndIVGMvQjU0SW9S?=
 =?utf-8?B?TUFSTUlGaFlLdGc2MXVNSmdkL1hOUWRLcVNUTU1pUlFLWjhjYm5RK0tTR0do?=
 =?utf-8?B?Q3hYK0VYM3hTRTJEano0L2FDK29QdEl2aDBUYkg1UGNVYmxWNnpaQXZQRUI5?=
 =?utf-8?B?Uzd2TUJTTVAyTEVieVhCSFhxRjIxQVJkRTIrQmpiTldpc2ppa3VkMFNjUmZv?=
 =?utf-8?B?cERWZk9ibmgzaGc5eWVRS2NQaFZNY3paTkQyNHRQdjhrRUcvaDgyV1k3aEhu?=
 =?utf-8?B?Y2FrMS92RjN1Y1VpQVZKVjRuNVF6aHUwL0NraW5wb0ZtWVlSWjVuTnorYnRj?=
 =?utf-8?B?eDkwUUp4OHJrNDV5T1ZmdkpNek9ybkRYVGNDenlkTHhXOUF6Wnhxc2FPNVpQ?=
 =?utf-8?B?T1duZ2hKL0djVHFRZjdrUVRocDZlOEdBQVZna2RMdUV4SGl5ek9hTk5CdXky?=
 =?utf-8?B?Nk5ZVng4dkUxTkhYNG9uZTlQd0Y2TkZmVEROMGxhZ3pyQmF1RlRCU25kcWdN?=
 =?utf-8?B?SldoWStmNlpWb05nV29jWW80Tnl5VERYcW1IemdnN2NLeVZsYkZ4MHkyZ285?=
 =?utf-8?B?VDVXNmVtQmlBcEJlb24wY1NSMWdJQWJPbEg5MVpRbWo1WGtTZjJjVFBhMnA0?=
 =?utf-8?B?ZzIva2ZVZnNMMy9YcXBGd2F0NG9HRXl1bHdqS25ETml1T3hOYkl6MjdFMVhB?=
 =?utf-8?B?dUdwMW9DUjI0UW9FbUdYWHB4K21BQ3plSGYrYzdTODRHOENaa0IwMnVLdnNC?=
 =?utf-8?B?cmwvL2lUazlKaU9xbVhTUGlVbDMzdnJlL0xMaWN5T1ZNZnVoU1l3NUltKzRB?=
 =?utf-8?B?c01OemtJN3p2emN2M3lVcFMrSk80dG5OMHNqZWtCNU1QOEhjQlRZWjhoUndi?=
 =?utf-8?B?QjhEdXNsR3ZTeTd1WU9VK0h0UGkzQnFvT3NybUZWY01pMjdxaUJFb0ZPWGJv?=
 =?utf-8?B?a28zdWZ6OVVubnpvWkdZVjdwMU56L3QvRFV0cC9IeHNiS1QwWVI5VXlwZ0hZ?=
 =?utf-8?Q?brTHHTmNDwm/jrJolk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGMwdFV3VlZSNG0xc1loMFlyLzdPVnY3YVdMZkhGRHJUNUN1a1VmNTF5VXRR?=
 =?utf-8?B?ZWVjV1UxamNmL1hkYTRpeUo0NWZjMXlOQ2s2b3c2SjN3V0dhWjdEejBSSmFt?=
 =?utf-8?B?MGFQRy9rMFJNUmhEY3BXNkprcGlEdFcxNjBOem91NWNzaFJwTTBtYkZNeG0x?=
 =?utf-8?B?M1EwNnZFMUJud0RNcVdWYzYwSldUTWt4VlYxcFJqeWtLNm51Tk1Ha1FtUktP?=
 =?utf-8?B?ay9ISm1aYXJNR3ZmczJEcjZNTVZBb3JxKzJBZEhKVjkwS1pqSUNWQUJvbnQr?=
 =?utf-8?B?SWxVYmxXSDY0MERQaGV0VG1SYjlTZHF1YXBIR1pLbEl3dVNOSjVHL1ltZHJ2?=
 =?utf-8?B?aUVYQ2dycjZQNXNXRHRZbEZoVVJyZzlNR05BUVVtbmdwVktCOVppM3hFdnMx?=
 =?utf-8?B?Y2RRMU9XNE4zVW5JQjRjMVNrSW8xNE9pVmJQcllObUx2c2UvV0tPeFozbnMy?=
 =?utf-8?B?N1dyUGFUNGxKMUNmSk1DNWRFZGlBQ2tQZlRadm9naFpSaHV2dm5sTnB2cUI5?=
 =?utf-8?B?eDlKc2ZhT3R2cHFMbW5kYVNtUGg2NTg2VU9WZ2wrcHViMFhwT1ZtbVZyaG90?=
 =?utf-8?B?REdWVXBXY2ZzQ1dDdWZlR1kvZlFDR0ZUZHZrSmduY0JscG5iSXliUUJaYjhj?=
 =?utf-8?B?NU1GWGRmTDBtZHpQdEo2MVZFWG9xTE8vWVZqSVhjVTQveVBsODVsRG4zdko2?=
 =?utf-8?B?bEtuclA2SVI4dU91VldaSlcrZi9tcjRRUHd1SzI1TXNaZ1o5Vms1NEdoSkNG?=
 =?utf-8?B?dHhzN0dGR2hZTTJOeDZidE9LcHd2aGQ4am1kcngyRzRNbUQ5SnRKUk9pN3pG?=
 =?utf-8?B?c0xpVGN6NDhxZll2MjNXaXVvQ2NiU3pwM05meldMVFdtU1JCVzVUd0lGWE5U?=
 =?utf-8?B?dWM1SFE2WUZaOGRSa1plZ3A0QkhoRVpETnh6UUxaK1RMaWE1akVkQ1JZeHAv?=
 =?utf-8?B?Wjg3U091TFl4SlhEQ0FodWhGNVVWeFdYZG1MRVJBb3Z5OUFPU1RjNEVwUm1t?=
 =?utf-8?B?bHhCQjdKT1pSRUZFZG9LSnZtblkxQUU2OS9SZno4UUxOY0YrN1R5MHNPUC9r?=
 =?utf-8?B?ZzVGakpGUjhmcGU1UnJMTE9rODdzKzh0NGllZk1qWXVqdGRSeTd5SHFiZnNM?=
 =?utf-8?B?WUNNRHhlNlNmSDYrQWcxME9yOFNUM09oSjQ0SlFrRUd1WVp3eXI5bHg5WmQ4?=
 =?utf-8?B?cDhrcFdZSlVtQXdIb3pTTnBIcUttTkdOODhKWFlORjBycnhCemJjYys3R3dE?=
 =?utf-8?B?d3MxaDhOVFRpNDkvREFFcVFoUkJYY3U5MFR2aFZIcmwvYkMwOHRSa0ZDMEpE?=
 =?utf-8?B?SjdwT2F6YURHTmZhVU1EcHdDQVNoakVRTkhIVFdJRzhXN09VZHRLa25IWWdJ?=
 =?utf-8?B?b1lnckpZc1orMGJTR1dGMSs3ajJtajlSd0J6dHNQdk44SW4vV29ieG5YL1lU?=
 =?utf-8?B?QWhvdFk3Q01JTVJZKzBhb0MvQW1yVS9ibExuUFU2bjErZHY0bHl0WEZydFZC?=
 =?utf-8?B?MmRTRE5HdlBjZXBISUp1c0JjLzNmSVRaU29lb1haNE9EMHk0b3Z2clI1VXZh?=
 =?utf-8?B?U2NsWlJ4TWVoYmlEUnBrYmxPRWhNamxvZnFIS0IrS1hRazZNd0JCVlROL3Fj?=
 =?utf-8?B?a0hlMHFZQUNocklRRUFzUkJMeTFKSU1YcTBYY3hXdnVuamRTUUJXckNrWlM3?=
 =?utf-8?B?dy9LWVdwcGhINWxrZGRBWWRuUllhYURKM09FaFpCbXBxMFhING5lRkt5eVYr?=
 =?utf-8?B?U3E4bUd0clRJUmVOVDJsVnhpQUtMaGdJRGppbXRCZDZWWVF2Nkp5NXlwd2Ix?=
 =?utf-8?B?SnRodkR4MnpSTjhBdGwzVWptcGlyQ2o3STRDNUpXRFhKSldZdE80S252dkht?=
 =?utf-8?B?NDJ2Z1YyM2RucUF3MnNPcEMxL2dhd282ZXJUUHQyb1hsTG80RTdJSXJ3WFJN?=
 =?utf-8?B?T1BQYWVLWEpkNXBjTEFZVG1wNkkrUGhEN3AraHpWeUw3QjZwakZ3aUZCbHY2?=
 =?utf-8?B?LzJqSW8yMm55bG9qQkY3QXdmdW1TWnBETGVWR29UY3pCS3R5MDRlRU8xL3p5?=
 =?utf-8?B?KzBxcFovWFUyeGt2R2hWR1hHcllSOG1scW10bUJRK1dTQ3VtK2JvTlhna3Bq?=
 =?utf-8?Q?HORa2h/KP++XLqMtpCpx2HbRv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9bd452-38d4-48ac-73a4-08dcc04123c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 11:21:58.6550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpLXdzk0IH5dPUTxHi1mjGfGCc64nGFAQloLbM4i3qKi3W+8kDXLksKGOXC+Akf3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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

Am 19.08.24 um 09:21 schrieb Friedrich Vock:
> In Vulkan, it is the application's responsibility to perform adequate
> synchronization before a sparse unmap, replace or BO destroy operation.
> This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
> that happens on sparse unmap or replace operations.
>
> This has seen a significant improvement in stutter in Forza Horizon 5
> and Forza Horizon 4. (As games that had significant issues in sparse
> binding related stutter).

Looks pretty good, I have Shashank and his team working on the similar 
patches ever since Bas initially came up with it since we need it for 
user queues as well.

Shashank can you take a look at the UAPI? Of hand looks pretty similar 
to what we have done as well, doesn't it?

For the internal implementation in the VM I'm currently working on a bug 
fix for the KFD team, so this is subject to change anyway. Going to keep 
this requirement here in mind while doing that, whatever implementation 
we end up with we probably need to re-base it anyway.

Regards,
Christian.

>
> Userspace changes for this new version can be found at [1][2], and a kernel
> branch containing these patches can be found at [3].
>
> [1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-explicit-sync
> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-explicit-sync
> [3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/amdgpu-vm-explicit-sync
>
> v3 changes:
> - Rebased onto current amd-staging-drm-next
> - Added option to wait for drm_syncobjs instead of executing immediately
>
> Tatsuyuki Ishi (3):
>    drm/amdgpu: Don't implicit sync PRT maps.
>    drm/amdgpu: Add optional explicit sync fences for GEM operations.
>    drm/amdgpu: Bump amdgpu driver version.
>
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76 ++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
>   include/uapi/drm/amdgpu_drm.h                 |  7 ++
>   14 files changed, 194 insertions(+), 66 deletions(-)
>
> --
> 2.46.0
>

