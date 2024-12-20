Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32449F8BA9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144C010EE94;
	Fri, 20 Dec 2024 05:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SX3DxPap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B010EE94;
 Fri, 20 Dec 2024 05:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecpQAkohY1alySWnLVxrZMoksGokdz4wHygxWkCM2pAh9nJtsm4LddcLTic7jDrTohb3CWhQbr+tigXn5bGjlIxijtik/2bGd7qXejAHyfF/z8IvGrs2KNB2+K24bs5FbL9KEQ0qtekxh35UFVmhtbXrQ8VK+dOaGOVh+FbVYuXVWdqTOIHkTzAU0R2+kKCDZzazYCGW3DhzaMAoS5C0u4aZSPUSHJi4iW4liV5wYz1JNGGxm7H4DefBDFkzDCfOylPAKn23LTclTfzBtseJRvh8jSnL8EqONJpFgnTY6HWhltfqVGx9tG/ri88gI+7d7b9bHAb3xUrByrS7wApirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iTc/RhDNUDPjaN5HCCyQTcOtWapU5VV127OmucGJVE=;
 b=DMc49nk2GUUdhKCRUPF0HNWXbvWjI98mTJlj9jqGNQlme3lt8c5G2hic5mBZqMHXmIKI+FTiWcyCkAR+zSIx14kPi2zwwYnMJtstyRD/t/zHHS/cb8OvPC4fybnz5UC+MiO/ZdMUsxg1j40BmLn3nG9/DQrD5KJLWDkUJfvU8FuVOuxZwgdYdFAHyNmt2jH9Z19kE7KC4u2b3g5JVwWgv9gm3V+2Ka6Rpc3GtOPzJsW3lNxpqjPNQKXWOSsRNGC3Y0z5soRHDT4v2Mw4vw8X+Q/Ttx+3qlcJOOPXXyQe1uf1OrMgop+zkaEHwIgzZUE0e/D+dvwAcmciF7a7Xwx1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iTc/RhDNUDPjaN5HCCyQTcOtWapU5VV127OmucGJVE=;
 b=SX3DxPapYom9Eko7mbXJ0+FcwDWmFJjX0ws60EYhnh+dhyu0O48qDO0/u+HOaDUEoA8fyDWDBUIMqm9y/mUNVFSKMsmsQwyYxTgcuKIUGQht4h5R5kVl5ijuM0ZwYBDyq+NoOZnJh7cI5CQM4o6Ew9RnpYCIjJzLBQJbcqrmqaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 05:02:34 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%3]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 05:02:34 +0000
Message-ID: <94b94e92-3c75-4707-b262-20a6a316ece5@amd.com>
Date: Thu, 19 Dec 2024 22:02:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 41/44] drm/colorop: allow non-bypass colorops
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-42-harry.wentland@amd.com>
 <Zv_U3h146lThx__w@louis-chauvet-laptop>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <Zv_U3h146lThx__w@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: ff99c531-e829-4cdd-e2f2-08dd20b383e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3lzWkRaeFhYSHZXNXhldzFWbzFUU1JKbElOZ05udXNTSHpSYyt4SUlIclZm?=
 =?utf-8?B?QmQ4aytHcWxRRW9UM1hpMFhFUkp5MEN1bHpsRy9XSU5kVmpRT014bDVqRFJz?=
 =?utf-8?B?aXlseWM3UVJZN0FoSUxsWFpJWXNWdlp0amxXaTJpY0l2MnFVcDBIaS9CQzFt?=
 =?utf-8?B?MFlZNlV0YTgwYVNYckpTT0RvZzZEbkRxUDFybkpONjFFQVE4YVhpVkI5clFZ?=
 =?utf-8?B?aldyY1Y1MGNETTZQTzhlaCtQek44KzBjUVFsQXpjbTdBVWpkMGJ3SEhHdVBh?=
 =?utf-8?B?YjlFWUNweUorSnFWd1Q4bFppOFh1bnd4L2huVW9wK1VreE16amdOUzR6NnNW?=
 =?utf-8?B?SENXK014UVp4VTdrTGNJY21QWEM4dENISGFIc3RuNEdXeFEzUWhhdThCd2hB?=
 =?utf-8?B?MHQ1K3QveWpXU09Ta3lKR2NWWFlLU2hnSGVpWG9UekloRmgzUmxTZk52WXZL?=
 =?utf-8?B?c1VYZkpqZ2tZSXFxRlJWRU5XYUZoMjMvem1od1JKMTN6Z1R3d0krT0UvMmV4?=
 =?utf-8?B?cHF0Wmxxdkd3SHdiNTFFUXZscG50TkNFbHBRYnZEUlNNYVRlZmxvREtxVVhB?=
 =?utf-8?B?RStDem9uWUdRTStIVlFPa0Jiako1WjkxWVAxeGQvbEtYMGRoazlJMnRWWnRG?=
 =?utf-8?B?NkJxbjd6SXF4MDlxdFI5TjV1UmJIeTBzMXpOTHNDNTd2NVljM3V4WmRUcGRP?=
 =?utf-8?B?TjNGNS8zblRJS2ZPQmpzMzd2K1hHZW05eEV5T0g1NExoN05YOGVXTnp1Mk9J?=
 =?utf-8?B?WG9ZUW1vSVVyZHAyL1FRbnk2dmhSQjc2MkhjZ3hEWEczZmkra1FqVFREOG4z?=
 =?utf-8?B?UnAyT1ltbXNzRUhNNXJZejBSRXpSZ0x6Y3AyNEZMQ3VVTFdVcktjZnVrKzJ4?=
 =?utf-8?B?T1hqSDUxbk9XZit5Nnl0R1BETXhFRy84T2laelY0N2txSm5zQmVCdlRlb3Vw?=
 =?utf-8?B?QVdjVHV0aXNleUVXSm1IRnZsL1FJeGhJbXJWYnBjc3RWbThsaDVuYUEwQUF3?=
 =?utf-8?B?SXArTVlQUjlVZnBmT25JTHhsV0RYY25FdFJQc0pVc0d2azFmTmVENHJ6ZDJW?=
 =?utf-8?B?UTRxVXAzWUhybXo5WHMvUHNJcWMrWWlabHdNaEIzTmFOTWVpWDJLK0pBOXJF?=
 =?utf-8?B?Znd4RmluNUFyNTFoeUlMS1NBd2Y1SkEwUE92TnQ5cjlNUzVSejhjR3oxeGlL?=
 =?utf-8?B?RlBETTJVY0tYYURoNTJaU1lrN3haamxwbzM1MDdYWHd3OUpvOStoQUExdE9k?=
 =?utf-8?B?dkYvdW41Sy9XUUppODVacUltQndHemJOdU8wNW9CR1haemRQNDRpUGM4aVkr?=
 =?utf-8?B?YzJmUkhuWmxGMGJKbk1qNC8wR0tqWkd1dEJyd1p2WnBSRVdoeUtJaGh2UzJF?=
 =?utf-8?B?amtnbkdndG9KckdzOFVsZUkzZjQ2VjZwM1JJMmx2aSt3dlcvcy82MmNSQmx4?=
 =?utf-8?B?VHNHWU5sUmlFU3BXWis4WWEzTUdia0NIODVhbEZuclAvc05Vajg2OERRMkNn?=
 =?utf-8?B?L2FVTFFLdDNFbFJHUUtkUTBwdm10K2M3NDZkSWdlRmtJUlBXSk0yMGgyL1R3?=
 =?utf-8?B?YmRLQnRDYVdoekNzb0tOQWhBL21GWEk1QWxjTFVmVm9QTFV4RkptdU9LZjcw?=
 =?utf-8?B?Z2ZEdFpPeGJJNnZLY0puMzJkdG9qNHdBRFlvSVhKc2hkRFZPQmx1TEwvUUtS?=
 =?utf-8?B?d1R5c3Y2UVN1dmVGOWNNT1ZaYjFpSFZNbDNCY1pORTZXTXB6MkdwR2YrYVpX?=
 =?utf-8?B?UzgxRDJkN3lRVStqN0R4cTZ0ZWJWOEdpL0VxcnJoVWxuWkZtYWZGYXdHdGVW?=
 =?utf-8?B?UEhCRnVXTnVjZG4yRGtkSnMwNWxuZ214VTcxR3JZNmpTNmJ2aEQyVDhzSmpB?=
 =?utf-8?Q?xAPWc91Yf4NPB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2dQakxvU2dlZ0VjcnRwMCtEdVNhWE9hMksxellNampOTm5oSUpJSGZrbUtj?=
 =?utf-8?B?a1o4MjAvMGtrUmh0M2EzeC90amRxU2dCQjFYbFJtTDRqS0tFaWFxaTFlL284?=
 =?utf-8?B?U1VLVk0xcVk4N09QczF1QVk4d0trdUM0WFlXdlFRTVUrdDRpSWM5OE8yVkZW?=
 =?utf-8?B?ckRJUkprV2locHBab0FMcW9ycnBQdlpLbjdBYmpQWi9jZ2pHd1B6RDVvYVhS?=
 =?utf-8?B?OThCcDBhS1J3dmI4Rk90UkFSOWRNcitaQ2FPaXNPNWZYcVJUY3piL0VSK0VZ?=
 =?utf-8?B?RWNvS01wbnc4NEFQZ1hyR2VWdFZ1L0hjYjFCNzlDUFJ6dGRKYnBmWEUvd2hJ?=
 =?utf-8?B?b054T3lOYW5UQnNwNndLNkx5LytlTENiOHFpQndWSUM1VExOZHVsclJxaktP?=
 =?utf-8?B?WUMzZEg2SkJjYVFYQXpMVTZoZjhsMVAwcXViZ3Vla2pESWFxaUlJMXVRYzl3?=
 =?utf-8?B?MTl4VW5ZVlczazVEVTlEOFJqcWQ1WXJnbTJLTXZsK0N2bi9QVllneWlCQ0VJ?=
 =?utf-8?B?RjJsREw4RFZ3QVVUMThkK0o2cWZtTU1xS25ybWdPSDdJa0dCS2VDMDJiS0NK?=
 =?utf-8?B?b3h3YzUyREhYR214V3ZNenVHSjV6c1BtMHBuelR0OUtVTFhzTzBJVDAzYkZa?=
 =?utf-8?B?NHlEOFV1U1BreU9zZ24rVlZ4dU9zdHlpbWwyZVpBd2g0RUxiMEFFUGpOSUJi?=
 =?utf-8?B?M3dMK1A4UTBYM2YvVzlRUmdOUGVvQWhGeEY2QW80WmlXY2NFSWZweDR6UThY?=
 =?utf-8?B?TjBQbC9mVGN3ZXI5dWJ4MHhiL2RWWnBrTTBIOWVxWGJvSU5rb0dVbkp0eHcv?=
 =?utf-8?B?U1JzQ3d6R0lWZUJCUTB6blhrcm1NRlVHQVRJbVRKelNKQVYwQTdoZnl6RWFW?=
 =?utf-8?B?Tkk4VG41NUhrM2N4TnRvc3MyWTZNR1kwb0RjNnZNT0puV1ZtMnFLNmNSMnFv?=
 =?utf-8?B?MnJzS1h6VFh0MjJQaGZuT2ZkYUdob1BXTldLSCtuTEhIMDZEeTBGUTloQXJ1?=
 =?utf-8?B?Q2dMVVlwa3Mwd2xmYlhDd1VVdFlDa1BsYWs2WE1XejZ6UjhubS9tZFMwSkVa?=
 =?utf-8?B?R0owREgvZVlUNXl4bUNCYlkrTGFWd3VTMUg4N1NiZHRqZ2k5aEs5SGk4UFVZ?=
 =?utf-8?B?RnNOeWFub3Bodm1sT2ZnVWdERzg0Uk5GNGlJL0lEVEo2RzdSUnJOcm1taC9W?=
 =?utf-8?B?KzVaM2o1Qlp3Z3k2RzZjSlNzVjVCK09FVDlkcVZsNkZWb2NjTmdNbCthbEI1?=
 =?utf-8?B?ZWgyL3pBSElvaWYwTDB6eEdPOFFrdjQyaW8ydHVTbUw4ZTh0c3RYVWJxUW5y?=
 =?utf-8?B?MEVjUTlYakpQSjZrWmlManhyK013TXZ5R2I0dGlmYjRMU1pscHRQdnBmckJh?=
 =?utf-8?B?OC91RG1BeEk1RzJZL1JzQStRTC9QVThmbkpwa0NyZFNSZ3Y2Q0JVT3lJMCsr?=
 =?utf-8?B?TFNIN0F5ZE9QWCs5MENFOS82TjZDNlBGRm1xRnN1dHNDc3M5VVIzekZBKzdt?=
 =?utf-8?B?a3l6bktIcXRUMlZuZlladlIzZnlmb0tPL2M2QjAvVGpsZWE0QXFhTVFvRE1l?=
 =?utf-8?B?bnExaDRlTHplUk9VdHFubjMrOXNrM2MxV1dMNGNBakJ6MTdVSjFkc2t3U1JG?=
 =?utf-8?B?TTRKRG8rbWxLRkxiVnI3SlJDRnQ4VUF6UzdUckJ2RURXTHdIUHZyRE02VG9T?=
 =?utf-8?B?dk1rd3FPeFdXRC9SZUlHQjhlWDRwVGIydllSQkVWalB4Rkd0bE1vLzV2RVJw?=
 =?utf-8?B?NlM2SkhtVzNEMFRxVVUxTE5iejNHaUttWXExejZLeHdvMStRQUg4R2M4ZzRs?=
 =?utf-8?B?RWt4UDl1VDgzakxuWGRTM3ZaR3BvbmF5UzRwQUhsWDBHdjFTNjNCVGl6VnhC?=
 =?utf-8?B?Zy9Tdk1kVW4rbGJYZThOVFlORXoxUERiSkFRTnVyMU15d0kwRTE0K29nUXUy?=
 =?utf-8?B?K3RMditJVU1zcytWbzg5ems1c2RFalphWWxQNmpJY09jamo0TFJpaThOM1hN?=
 =?utf-8?B?RG1uTTkyZzExOW9tZmpXcUE1bTdqYkJmd0tlQVpDdUZEZS9IeUQyemZTdC9x?=
 =?utf-8?B?djk0YmNOMlJ0QWE1Q3IyUVlCQ2s5TUorYnlPc25HWS91YmhudSsvalhRN3Q0?=
 =?utf-8?Q?d7Sqy7nvJaDdzGl8dRIQWojHq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff99c531-e829-4cdd-e2f2-08dd20b383e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 05:02:34.1552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AybnLoYTaqQCBfDwQbFfGPPeqDVWCGHReIVOUcVyro7AiTx4HzbtBZXP15cjB3yST/nJeWBTs1Rge4HdpK4iRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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



On 10/4/24 05:43, Louis Chauvet wrote:
> On 03/10/24 - 16:01, Harry Wentland wrote:
>> Not all HW will be able to do bypass on all color
>> operations. Introduce an 'allow_bypass' boolean for
>> all colorop init functions and only create the BYPASS
>> property when it's true.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 +++++---
>>   drivers/gpu/drm/drm_atomic.c                  |  3 +-
>>   drivers/gpu/drm/drm_colorop.c                 | 51 ++++++++++++-------
>>   drivers/gpu/drm/vkms/vkms_colorop.c           |  8 +--
>>   include/drm/drm_colorop.h                     | 10 ++--
>>   5 files changed, 60 insertions(+), 34 deletions(-)
>>
> 
> [...]
> 
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>   
>> -	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
>> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
>>   	if (ret)
>>   		goto cleanup;
>>   
>> @@ -48,7 +48,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>   
>> -	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
>> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
>>   	if (ret)
>>   		goto cleanup;
>>   
>> @@ -64,7 +64,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>   
>> -	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
>> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane, true);
>>   	if (ret)
>>   		goto cleanup;
>>   
>> @@ -80,7 +80,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>>   		goto cleanup;
>>   	}
>>   
>> -	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
>> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs, true);
>>   	if (ret)
>>   		goto cleanup;
> 
> You allow the bypass here, but you forgot to add a check in apply_colorop
> to bypass the colorop when this is set. It seems to be the case in the AMD
> driver too. Or maybe you wanted to pass false in "allow_bypass"?


The bypass is used in each color transform. For example, it is used in 
pre_blend_color_transform() of vkms_composer.c, before calling 
apply_colorop().

Similarly, it is checked before calling each color transformation in 
amdgpu_dm_color.c, such as __set_colorop_in_tf_1d_curve(), 
__set_dm_plane_colorop_3x4_matrix() and etc.


> 
>>   
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index d3a00296973d..b8c1c4da3444 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -333,14 +333,16 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>>   }
>>   
>>   int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
>> -			      struct drm_plane *plane, u64 supported_tfs);
>> +			      struct drm_plane *plane, u64 supported_tfs,
>> +			      bool allow_bypass);
>>   int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
>>   				  struct drm_plane *plane, uint32_t lut_size,
>> -				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
>> +				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
>> +				  bool allow_bypass);
>>   int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>> -			     struct drm_plane *plane);
>> +			     struct drm_plane *plane, bool allow_bypass);
>>   int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>> -			      struct drm_plane *plane);
>> +			      struct drm_plane *plane, bool allow_bypass);
>>   
>>   struct drm_colorop_state *
>>   drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
>> -- 
>> 2.46.2
>>

