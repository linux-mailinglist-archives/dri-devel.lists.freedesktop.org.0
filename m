Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81650AEEFE1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 09:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B6210E27D;
	Tue,  1 Jul 2025 07:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fsS9Vt4s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181510E273;
 Tue,  1 Jul 2025 07:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjyP6cXs4iYVsbU2Di+Ci5+eUP2zCfsSYXNEhXwndPbLt456tquJ51FYUIAPYmcbt4/P64bgJrQ5bB2vVbb0Yqln02uxhUGUSGGanH9fqVmRvP2Swe8/vdV9p23c8BbAAql4Q2mjBDReVStOZFZ3GEe1cmpGf5fCw19KIXW7UEtyyAFwTe16QTjuMGDILO3VcQ92/MV12F1caGiAjgEC8M7B2rYaK3mwHW1r5p72RVgTYAdW9IS8o3S5Wt3HtQBixKDKvWr6bLON5LXSz5bRUATxeK1Tq40bIcHIagB3XLcLPIPg+9Vt/Eq/n8fdcVv/fOiugGhXJi0ugPe3m/bh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3vvG47sFs1VigW1rhIYqzU6mveqwQW+5gL7ixq6zbo=;
 b=ADnmu0Ovp66GN3ZfRjhG3ItuMIivV19tqU/Q3USdqDdu48i3JfMJ/RetDHHp94E+PS8P7zZTzF1Tk964v8uH7dZMueDw0NOKJmw0ii7p4OuUbpzOt6g61Lln4HC58S8WSfCm0kuQq8QfWaT5M7NEBCbKhWvuIIhjkfb5jK0ljlG2z6Fh1LE7ac10Bu8KVcIE+la/m1kNgvEO5MUyCd7209vEMZyY9LGqimaGUE9y1SVpOUb2nO9m26zA4seq9Z1qezCCqyZR53wl31nLFqW9d8+PNwesDcxAwcnaBQJvnMka8+u0U1ft9h7XbPInHoW5859RqfJtQzc6kPPYltj8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3vvG47sFs1VigW1rhIYqzU6mveqwQW+5gL7ixq6zbo=;
 b=fsS9Vt4se6dloDXpb910kd7e2EyXQ4giR8M4P6llUz19LdQM7x51S2GCOohlZMx7Nz1RKCU6fhXEuqp28UE7wW59fxC0Pmyv5o3pw3/llUFt4nl7WakquMKuL5htLcRML8WhuCG3pwsPC3+XVDI7gZOelrwGNUR+e6tB0qsIVy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 07:40:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 07:40:11 +0000
Message-ID: <8b288dcd-81ed-4047-89b4-4bc8a4062fb2@amd.com>
Date: Tue, 1 Jul 2025 09:40:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Increment job count before swapping tail spsc
 queue
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, pstanner@redhat.com
References: <20250613212013.719312-1-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613212013.719312-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0073.namprd02.prod.outlook.com
 (2603:10b6:208:51::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4215cbcd-45dd-4b53-17fa-08ddb8728299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE9JUnMxTEN1N09EYVRJL0JaTGJ5M3g4Qy91V3VXdEdURnhuemE4NXVaeE1E?=
 =?utf-8?B?dXdPWVowM2ltSEhxOXp0REhkN0xpdGlBUU5CL1hNd0duamZVK3JOMDFQbFFt?=
 =?utf-8?B?MmlacjIzLzBXeCtTSHNvblRLTHZVbklxbzE1VDFiU1BwS2VzdnNuQ0JWSFhS?=
 =?utf-8?B?OS9TeG8xdGNLOTNSbUZqNEtJbFk5TXlRYnY2WS94bkFyNHEvUWc1Q25vSDBL?=
 =?utf-8?B?T1JmWDZaNCtIQmQ5d2Iwc0ZuTjVHd3BjSW5oeUJlcUd4TzAvNk9VYmJKZktH?=
 =?utf-8?B?VWlLaW5Ycms4VUpJbFhSakgybWZGTGJYOTJScDF5enZ1NEFQV1krT1RCRE05?=
 =?utf-8?B?UytnY20vY0lCc3RPNTd1ckJ1UjVQZk1MQTRnYlBNbVBUQm9HYy85THJUdVN3?=
 =?utf-8?B?eVNMWHhpdEdYUVJoUWF4a2VqU3lOOWdPR2YwSjdUV2dISDR2ZXVrZDZVUWF3?=
 =?utf-8?B?a2VJSWFjVkwwYVVjNEloU1Z3TXRLdGNGb3I1dENpSUpiRmNtVXlFWHh5azN5?=
 =?utf-8?B?azZrSHFVdlBMSFZGWUc0S3FQTnNqN0JXWmNxck1PM1ZyS1RPRURWV1A5T0l6?=
 =?utf-8?B?S3prYUhHVEhkM0dlSE9JRnVWdSsveXlzWGhDcC9zajZKMVpVM0lyNU96dlh1?=
 =?utf-8?B?Y0QzNlB5TW8xd0lzQnNGTzk0U0doQ1B6a1lKSDRXa2NTMXNwZjUxcmdENVIv?=
 =?utf-8?B?QjlKRHR5NVMvTktIMS83K044VjlXYWY0WnlTQk1mcHE3cWNYcXVPMXRXYXRQ?=
 =?utf-8?B?VlUrbWdGZUQ1Q2ptejMvUzM0UzBaNFVxMFpQSGZEeU1keTZhUlVlQXFkdy9t?=
 =?utf-8?B?aXVnN3ZtaHY2RmVmZmxuZHdJMWU3L1BVQVJDQkE0ZWxYZWJvUzgvTkViZnd3?=
 =?utf-8?B?Ymh4TXVMQXBPa016TUlCYlNXUHhhVUJESXdXYklPR3FKRVZDRHRERTRCaW5H?=
 =?utf-8?B?blpiZ1BzQjdreWxaaGVhU2lTUFpvdjRiQTYvdzlra0lNbGZJRk5DeHk0VE5C?=
 =?utf-8?B?dHdoVWlPVGttTVpJbjhZNjFjSUJVM3hqMFR6RDZXb2dkaC82VURqc3p4NWp4?=
 =?utf-8?B?VHdycUdxY3hqblZRSEZLN0g1UFovdjN1MmpBc1orVm8wMGs4UVdpRXhCTElC?=
 =?utf-8?B?Mm1ZUnFUazFPMHZZNjB5bUdmMVBPY3hVTE4raUVoUzMwTzVScVZoQXhEeDJq?=
 =?utf-8?B?VkpBOG5SZTFuRXJKanlkbUU5REFZeFRJQnFVc3ZIalJnZ3NWTkdkd3pJUVZF?=
 =?utf-8?B?UDUyRXZ6R2Q5cnVTTHRvYUNmWjBRZUpIenN5WkYzMzc5eDQzbTQ4N20xZ3Y1?=
 =?utf-8?B?MW84OEVpZjQrVHJuR29LQnA4bVRmWGRvUk55M0tZTmxMalJkOGVzV1QrcHE2?=
 =?utf-8?B?Z2pKSzRTTFBYdkdpb1huNHNRM3F4WjR5akM3WE1pV3F0V3JRdnYvYllFSFVQ?=
 =?utf-8?B?WHkvcUkyWGl2ZWF1ak9qUlV0SGxIU1ZwdHBRdEFlZWNOeUxWMDZxdUJDT0tW?=
 =?utf-8?B?SEtSMldZZlV4ckJxNXgwSlF0aVhlNEhUeVhtcjROanNhNXJwT0pEeStUcVcr?=
 =?utf-8?B?dG5vU0RtenN5ajZMT3RTcmEwSDVTa2xxNlUwVzExZk4vQ0Zhcjl0OHJvZnhR?=
 =?utf-8?B?d2NvMjBGK2VUVldjVEpUTGJOK3RuMGxTZllkaERxSjRucVZjUVRZazlqQkhp?=
 =?utf-8?B?QklNT1pyQW1OVGRTUHdua3NIOVA3RWQyOU5YUFU1blVEK3dLSFhFUW1SU3ZO?=
 =?utf-8?B?MUR0NWl4SXBHVGhjb2pTZjErN05RUUNBV2kzR2U2QloxNTFpWFZrdnA0cWJr?=
 =?utf-8?B?RWlpOGx5ajA3Ymk2RjIxbzNueXZiZUVLTTJaR1YzQXdrL1dnL2hPWEdVeFRB?=
 =?utf-8?B?VDQxS0RML0ViYnpHRU4rVGtRanlYUGw0ZGd6YVI2N1JacVE1Wk1DZ0JiakxU?=
 =?utf-8?Q?xiv3bPtkTjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHhNdXpTay80cmhhSDFBVFZVVEExUDBza2ZBWGJsL1BFYkFMNU16ZWg4NGda?=
 =?utf-8?B?eVVMbFFRVDlrMkh0QWIxaU1GVWNoVW8yWkpOTHhMZFh3SGI0VXkzSWM0bEtI?=
 =?utf-8?B?Z21FdEtFUUczT1NDTGFTV0FPRHF2dm96UVhoS01JNVZmZHZ2MjF2RWNxMUlp?=
 =?utf-8?B?QTk1WUp1bWJubGtseGtWZFVINDRpYjI1UkRyTjBqQ01YYmxCWEhzRXB4TDN3?=
 =?utf-8?B?L0RSdFI0SGFLTlBpdHFrTFk2R0x1TnFoUCs5OVNHSXE0UTNWNitHNFk4Q3cz?=
 =?utf-8?B?TUlYTWVWZDY3THVCSlZ3WStwdVFyS05wbjBPVWFPZzlzWjhrUmZEcFlPR1VK?=
 =?utf-8?B?dnR2R21uNndINjdneGkya3RSN2pjeWo3TFA1emJSQUNkMFNobE41bWpZdFhH?=
 =?utf-8?B?RzRRN01WeEVtbHI0NEpwNWs3TXJvU0J1a3BiaGs2OHg5ODVweXhoOE5odWUr?=
 =?utf-8?B?cnN0WElkNHRZMHo1YjExM25TbGNsdG53N1ZjYWpwTE5VUmpHb1MrT0kzWm5q?=
 =?utf-8?B?TU1CaGt0Vk1kajJHOUh3eFVzalBhd2ZuZVFrUkhBRUhEZ1BwOE8xb0Q2Umx3?=
 =?utf-8?B?TnMydXp6aGZNUVNJWmVLb0tGMERraEc5Zm1QdEh1N2dPb2s0SHBGNTdxQTY5?=
 =?utf-8?B?VU54OHllb1FKSnMwcUltZXZRekVObG1GZk40TXVjNEhmSjdCNHYrWktMU0xs?=
 =?utf-8?B?emY4cFhncndRUURYZDg3YVU5TVhNWVA4c2xPRHBrRTVsbDlaVTZMMmZNLzRw?=
 =?utf-8?B?enBsRVZMQjZaZ3lhcC8wZGp6Q0IyRWVZajJ2WVJpbGVnNmlDcUlXMll6aVc2?=
 =?utf-8?B?T0pCS0x2aUMyc29DWnhiR2VacmllN2VhZ2g3R1Q1eW1MM2tUNjN6ejViRW9U?=
 =?utf-8?B?b3pyVjIwRnRhc1hyam1IZWU5eS9wcmJGUlVqSkNaNDRibjIvSit3S1l4UkIy?=
 =?utf-8?B?QVBpbHhmcmF3K1FhUXNIT3cyY2g4YmFKdXBYczFwRk5YeHpBOHh3ZHltRU1h?=
 =?utf-8?B?YTVFbUtMN2ZkaW9WK2VVOU9rYnc2OHgzQ0tUZG9NSGdyNkU0ekt5M1p3RVRz?=
 =?utf-8?B?ek82Z0ZVQzNHSlRPR1NxNE15WXViN2RhaDFBVDc1WVBGUUQvZW5oWTZGMUYr?=
 =?utf-8?B?WDBmME1IQ1ZIL2hCT0ZxSjZ6ZDFDakhsbzNWRVYxck1TOTlyeXdYZnZJa0No?=
 =?utf-8?B?SDAxRzNCbHlTd2pFazZvL3ZBQWlubWZQTEZyNVV3S0dYd0hxV1ZSWjhuRUZB?=
 =?utf-8?B?WXpDNTBVTjk4anEvNmw1WGgzcmVxTkI3RGt0ZHBKTEhQYi9YWmVPTTZQZ2lm?=
 =?utf-8?B?QmNuUVVRbS9XU1JWYlQzYmNkWFBPeWZ1MXJ4RVlDYUZrbTduemp0T1VoaUxo?=
 =?utf-8?B?S1NZQk9xWHZ6T0h1blRlTFhBSWFteWtacndOVWtFUS9oSkNsZFpyRG5UeFFh?=
 =?utf-8?B?VWFGK3RkeFV0bHdydGlrUXV3WFJmVWRSUm1RQVZ1Q2k4TUk1RXI1eFpvWnM0?=
 =?utf-8?B?dk50RTBrRlJRTEEvUGFFYzBJNm9HL3VVT2VDOWFOUHdBdXMwSVlUZGU5VkdQ?=
 =?utf-8?B?U1l1aXNwZUNRalNXeVRJckdCdDRPVUFPMS9YV2hzb1I4MEprdXNYSmdSMnpL?=
 =?utf-8?B?eSs2Z1lRWFB3emF2MEp6RXk1QjdpL0oySk1YVDR5dVN3K1Q1eEJPYmpFZjkx?=
 =?utf-8?B?U0JjNEJkY0FOTU9Tdkc5ejdkODhNZ2t5T1BWN2dzdEJRejRRTmV5bFZFeFZQ?=
 =?utf-8?B?TVJKV2Yvd0JpTjMvMWh5dTBnVlFDNlp6ZldPUDhIOUtSdHNvUWxTMUFlQ29y?=
 =?utf-8?B?MERWUVhBblRIVU5TdnRaNXMwOGRSRCtVaWpEd2NSdUVnOGdxUStLVkM0QkJ4?=
 =?utf-8?B?UWU0QnUzQyszK1hyZmlQUmk3NHNUbHRUeGJmZ1ZtM3RtYWRVZCthUk5JZmZC?=
 =?utf-8?B?c005VlIxNVlxd3Zwb0h5TjVOcTR4ZlRPVkptYUZZNXFMbE53SUEzcDRIbG1D?=
 =?utf-8?B?MTRUbFBSV2RlZ1huZ2hQWjZDT0ZpTEpXajZMVUltMU05amFRQnhnbWlBWGlJ?=
 =?utf-8?B?Y3VUTXA0cjRVdE5XWlNFeHNYQnZGNHgvbUI4RFVpdFpaMDlsSXVGTGZGVE5R?=
 =?utf-8?Q?vaChrTvL9HyEc4vwEjHOqB7BY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4215cbcd-45dd-4b53-17fa-08ddb8728299
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:40:11.7434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjofVehdMszdUqN2XyV4DsMHNeSin/N7zTdHG/1qNfcdEAbEDZofngh/Vz1R7xeK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607
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

On 13.06.25 23:20, Matthew Brost wrote:
> A small race exists between spsc_queue_push and the run-job worker, in
> which spsc_queue_push may return not-first while the run-job worker has
> already idled due to the job count being zero. If this race occurs, job
> scheduling stops, leading to hangs while waiting on the job’s DMA
> fences.
> 
> Seal this race by incrementing the job count before appending to the
> SPSC queue.
> 
> This race was observed on a drm-tip 6.16-rc1 build with the Xe driver in
> an SVM test case.
> 
> Fixes: 1b1f42d8fde4 ("drm: move amd_gpu_scheduler into common location")
> Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Sorry for the late response, if it isn't already pushed to drm-misc-fixes then feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  include/drm/spsc_queue.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> index 125f096c88cb..ee9df8cc67b7 100644
> --- a/include/drm/spsc_queue.h
> +++ b/include/drm/spsc_queue.h
> @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *n
>  
>  	preempt_disable();
>  
> +	atomic_inc(&queue->job_count);
> +	smp_mb__after_atomic();
> +
>  	tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
>  	WRITE_ONCE(*tail, node);
> -	atomic_inc(&queue->job_count);
>  
>  	/*
>  	 * In case of first element verify new node will be visible to the consumer

