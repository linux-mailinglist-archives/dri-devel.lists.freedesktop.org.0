Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38444B06341
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FF810E5F5;
	Tue, 15 Jul 2025 15:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Cugj0rRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD5510E5F5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:42:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imMmPt8iI9WRolHlKwM3TRNaf+huptf5N6DBAbpcrJl5OrirnyWqtLqBxzX8hPM/eNy2nRRp6vPMXgA53yg38GcECgKEW9B+EjyDb33Ll0S3CiC8J+7blCDfsQlgD9rSnLogRRs2sq/P5P4UfRrwjJqOda4FzJlDRwFabKMHndDCsjKW34Far053zC/VGsWv/lcz1XClOtl/cnWGddAxUgP9iIK6p9h4Rifgxd/Yg3cK8bkvZZq8h8uWyXNo9Wiqv9jeKpbiyTAAwCUF5WEHC6TSvKVmQXBdxLmFfI4DIL6LUROyMNOsP56gmzu4Xys88aTxME6K75o8wZ2pYMPXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4narCNUwRkqcJFxbeuOSPp8CvQf0TjvAMit5NOpJv0=;
 b=IHBAMG998uqahM5Gz5uLCU64Muxpc2yQTq6oGWSpiCMhN0UjlTiHiXI1VMBi0myjy9BdG/LOVSVUG6fVZskvV+fhzlbxvU40vIoe1TTWZWwxV8+TfTUegTKu+bFh8OnY3sY6UzzoiE/6C3Wad8QHvbKgbpvqJ0fOREt6mrz0L8mU1T5rA0XqI2OXAG18LsIYY0HcmOUjWiNaiw0+aa06tNQugXPN/NvmCPbjV/mNLr/loN7/WLX/bGE6lu8ckIqRiWFaYCX+RSd6v7U05CzUJ4PHrUBL11oD/Uqe+ruy8K1KjhBPyvEO76JZnDFLEh2ySPruJW2+aFuSq+tvN2oNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4narCNUwRkqcJFxbeuOSPp8CvQf0TjvAMit5NOpJv0=;
 b=Cugj0rRLbwFS7xRf3UPlYVKjgd2u68Hj7vcDgazK/OvkfCn/5l+jnhaBYjPeNYLDAl4DHePRRG+qPN5qphYk5VPvb08TeIlG+XA89LvlYxoe3AL7bnulVL7pZB/P4WKEsHMqOm0VGiJZdmX4ud2bAmlMyCU7TkYiLPR5pc4jWBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 15:42:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 15:42:07 +0000
Message-ID: <19818715-b1c8-49cc-b6b9-2abfc1eac1f6@amd.com>
Date: Tue, 15 Jul 2025 17:42:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, phasta@kernel.org,
 dakr@kernel.org, matthew.brost@intel.com
References: <20250715135033.706126-1-lincao12@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250715135033.706126-1-lincao12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 147c8543-73c1-4aae-4e0f-08ddc3b627d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2MyMlBHVlpHZnJ1Y3lhSHdGZTB5OWZJMm9KUGk0aitOeW9XRmtOaUVybmhx?=
 =?utf-8?B?dDNHVjMwdXVFUDdrOFd5YU0wNnFkUEYxclY1S29SQWxkK0xDL2hzTHFjeUxP?=
 =?utf-8?B?cTMzOHRWZWFiSXR6N1pxVzNZKzlEaXNMc3UrVHgvNnVJUXB4YXFmL2xNMm5q?=
 =?utf-8?B?b3BuVjhOUTB1TEp6Q1cyY010WWM3cjQydnVYTHlnREVLcSszVWlyVkxZMHRQ?=
 =?utf-8?B?R3QzS25hVVBZRWoxVjFLU1BaUlBJMC9qR1NDaWd1VUlBTUdQak92YUtySlZr?=
 =?utf-8?B?anFvRDY0QXJrTHVVRERZb1RtVENBcDJIOHdWWlo4N084QUQ4RnhCdXdRN214?=
 =?utf-8?B?WnEvRE9scXE0eDNncm8ycW52cjhLb25Id21FVUJHanlMRyt1NlM4NFFnZHBU?=
 =?utf-8?B?NVY5TGFMa2xoUzh1NElGVWVNWThPVkRJWFRwT09lYURBK2ZneTR2dkZwWjN6?=
 =?utf-8?B?QkJxMkVvWkd1dDBERTVkWjVncHdSQkRkOXJuRVVnVjBVdVM5K1pWT0ZIajRL?=
 =?utf-8?B?M3I3V1pOUGNFblF3RFRlYUpkNWJaRUx6ZStMVDlMY3ZHQjBsZTh4T0NhbWVv?=
 =?utf-8?B?SHBRc0N2T3k3cGttUWNzQWZONlRkWnM2eG1IRmcxV2w3T09JWDNCTVBGN0Vq?=
 =?utf-8?B?UUI5QlZNZGFveWR5elY3MXlwdEp5UzlCekdnb05xMlgvQ2s3NHMzY2RPdkRV?=
 =?utf-8?B?a09Gb05HdXNVY0NVNGFiRTBZZEFvNENkVnpCNlcxVTRCSHNVRUtacWUyb3lL?=
 =?utf-8?B?eVhhSzR2aENtbGJLUFp2Q2Y0T0ExZTN6LzVYL3N6S2l3Yzk4VjhvSGdLSVFl?=
 =?utf-8?B?M0w3blFxcDU4NDIwTXhBMzhzVjJEMDdEL3FUZitEYjBUL0FrRXpoZWIxdjB2?=
 =?utf-8?B?RnNkaVJrbEZVY2ZkWUVKMTU3amdZblUyYzdpakdITWN3TnpHREFmb1Vwb1Rm?=
 =?utf-8?B?R21INVpRN1hLc3BaLzVwa25XWEFKdFRYWEtzSUxvU0VaLzZaWWluVkhCckJV?=
 =?utf-8?B?dTVkdUJlV3poRWFJRHNZYmtMMGsrWUZRWTBGODZxWnpBWVNRemxXRU1VbnlM?=
 =?utf-8?B?SmxPTGZNM2RMQzhJYS9NYUwxamhia0JabGFZYldpS1dEQiswRWFMQ29PTU1F?=
 =?utf-8?B?WkNQQUR5eStFek12ME5JVjBIL2syY1NmUHo0U0EvaU5Oc1RaZWY0ckEwQUI4?=
 =?utf-8?B?SDR6N3Y5cTdBU0s5Tk5YZVB4NEhXNmNHcTQxcjB3eWJ0QVZQTkVTckxBRmtl?=
 =?utf-8?B?bE9QV2JCeDBtZVl4Z0Q1Z0FtU283RzZRbEQ5WkhIbjVQeXNIN042aEVNdGtr?=
 =?utf-8?B?WTRnRmpVRFhpWHhXM1NxVDVKLzE3SXNjNEpqU1E4b0dtOCtMVWZVeVlpMkNa?=
 =?utf-8?B?NWdva2JhVHVRaDlrMCtFaTFMU2tmWlJQeXIxZFhsMit3VWU4S0lWRml3YWVF?=
 =?utf-8?B?VEdScXdhSTNpYzlBMEZ6VG5IRXVOVHBtRlEvUEVIN3JzSE5yazdidHZ5M1hm?=
 =?utf-8?B?UVBYUVAvcjRDMSt2M3AzWHkwb1RHVmtHb1BKcDViclUwTmJaSUdYZmpOK2VM?=
 =?utf-8?B?VStqOWlseGp2R1o5ajdEWHFBVXh4U0prL0Q1Qktydm15K2lpMkUwTnRYcDdo?=
 =?utf-8?B?ZmdrbkRJRXhnTmtWRTNOWm01c3F3T294WGUxWTloWFNRdEw5UjlEamh2TGFD?=
 =?utf-8?B?bnlPL0FFYmZBM3ZBREtmVXhIS1pEYVExUDk4SHEzd1BXRnJDRllmbmU1bGRX?=
 =?utf-8?B?QVFoUjcyT1dLenM0TE9ORmJUMVFTSjVydXhDeWNYcndSdVhqNzVNbEZoaVRO?=
 =?utf-8?B?V1l0L3U1Q2FLZlV2a2JaYmFXdlFLSHJpb3BVMWU4b2poaHhMQUV6UStyY1Qx?=
 =?utf-8?B?NzlQczJlZE1VVVJMQ0llc1NuRnIyYmlTSlQ0b0ZOMnFnZnR6b01rQjRYT2V0?=
 =?utf-8?Q?xC/X0FuEMoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1l4dEpmcVJJK2twRVZ1ZEFaNnNyOTVoWVd0a2xQWDg4cklnbzZUUFVkRzdF?=
 =?utf-8?B?b25ZL29FeWJqSWVScnMrejgydmtUTGhuZ1hNMllGQzFZd2tlRHVxcFVtQkxN?=
 =?utf-8?B?OUZZWE1CWXBySzhpcnpld2JaTlI3RnhiUTIrNzJTL2FieHF1T1FMUzNaTlNo?=
 =?utf-8?B?Zmh2bkNJQUxhbTZRaEthQjVTdjNSei9XSmJtWnQ4Nk1JZTF4UGU3WHJxaUV4?=
 =?utf-8?B?TnNLUXBUWkg1NHlIWDVjQ2pRUS9OeFZUeFlSbnZKSE05d2Fjcm44MWZBaGFS?=
 =?utf-8?B?SXBpL2RndUVMWE5HeXVXNnN3bEpxOUV2blR2aFNYWTZVaXZGa1AzMVh1eStr?=
 =?utf-8?B?YWFvSGVTVUI1MERsdDJRNDJyWGZlT3AyWGtzZy96Z2NreXlUc1JmaVo0cHJF?=
 =?utf-8?B?dzR4YmRoVi9IUU9NcnVaUVBYVm5IU0pWeWhhZHRwRmFvdDRHSy81K3R0d3VY?=
 =?utf-8?B?cUIvdmVGYVk1SjdETFpxOURNRFhwRnBrYkdkREpFUHNEa1B0cG1NMXJ1aFdl?=
 =?utf-8?B?eFM3WXYxM09Ka24zdm03emxMNFVLT0pVMWhscUZhQ1dGSW1Db3FsbkQvMFBs?=
 =?utf-8?B?ektzeDAzbkllVWh6SnFiRUxyTE9LcEkzazZCNmplVFZMaDlYMit6WTFuZzRR?=
 =?utf-8?B?KzdaTGUwK254ZnJjcXRZZlY1RnkxWXpHYkoxUGlXWjZ6cCs0eUpLeU0rY1Nj?=
 =?utf-8?B?MXBJVGVlN09WakZZSjhJV0hmMngxSDA3SktRRTkwY3RpWjV2ZVRXN21JM2VK?=
 =?utf-8?B?cXQvREpnYi9PUWx6b3NRNGhaL09KK1RqVWF3L0QwZHJWczFTbXZlNm1ha1lY?=
 =?utf-8?B?dXdDejNwN1VWeDZDay94YjhyNXk1SmcveDRzYjJURnpiZ3JpNFAvcGdOQnB0?=
 =?utf-8?B?SVpLOHZKL3RROEJhckdLTzkveit3dnN1TzdxTlZrNERxQXJDUS9MLzJiaTl6?=
 =?utf-8?B?OS8yZFRwQ1NpUlVWQVdwNVVwaHU4TUd0SDN1cml6QUFVWFl0dGdZc0Y0SXo3?=
 =?utf-8?B?SVVKZC9tcnVLVjdjZnIrK0RYYzN1TG5OWHdhTEFKMENTY2VVbWVRbjFBTmpJ?=
 =?utf-8?B?bVN6WlZSdWhnUWJna3pLRktzOUJkdUNSV3lxYVRUSEllMWZ6S3RCRTgyRHo2?=
 =?utf-8?B?RWNQRjZEcXh6MFlQNHB4aGZRM2tLdkRGaW1JZmVXWW04L25lOU5JdG1JNkk0?=
 =?utf-8?B?ZWRvT2VFQUtHakh3VnpGQ1ptN2FZUVgxVExpUFJRK0RXbmYzait6bmFlbmZp?=
 =?utf-8?B?VU1NWHVsaEhaTWpzMlVDYlUzUmpvWHZ4WVV6K2R2SXY3ZzlrOUtSQmNhb1V4?=
 =?utf-8?B?ZnF2aElqT0dsdGx1WUR4UEdGYTc5UXhJUloxTUFpRmp2MXJ5WGhnZ2hYOG9h?=
 =?utf-8?B?cXZIZ2IvbzMrdmFjS1IxaGV4b0ZGM2dsa3dGU0wwcUgvWXpwL2lkSnpWRVMv?=
 =?utf-8?B?azBJOVdxMGNHVWpMK2FWQzJkTHBOVG9YdEVKWUhSa2xzMWVyWG1MM2hWYy9L?=
 =?utf-8?B?R01jWk1OSWxxQmtuWkV0ZDd2dlI5K0w3bktUYlJhMGVnVXRxcVRwekQ2RXhZ?=
 =?utf-8?B?d0hUcmRndUxXRTQveUp6OStVeTZ1clRrQ1M4ZzZBTnJyMjhCNHVqKzEwSk1K?=
 =?utf-8?B?dlhoUHJmdGFEQkJWMzN6bi9WTytHbzVoQ3lKcG8weWlVVVNlZGRPbkx1WlZH?=
 =?utf-8?B?RmJ5ckNjZzRHaHpvZkt3dWFsU3c3VklwNC9PV0dLTndZUWNHY1cxN1FyUUFV?=
 =?utf-8?B?RGhvTzlHbkNFbDVkSjZuZHVBeTQxUkhqNDF0bTlSVCtLcGhpWFY2Zmx4WVZI?=
 =?utf-8?B?dFNZZ3FGTEhzYmVQQi9XK3VYQVJCcElSM2ZUS3dxT0lWQThocG5NY2pkRWVo?=
 =?utf-8?B?a0FVS0RFck92NjhjR3Y2ay94S3hXWktTMGxNYVM4ZmM2VDc5R3lJWW9ZTlpp?=
 =?utf-8?B?MXlpekFDUTZialpjMVhQMnZWUlRsN0VQcERReXZlZEhJak9sS0lpdllZeHh3?=
 =?utf-8?B?ZFd1TjdjaDYvSDYwZ3E2MmlyY3pEcG1wcHBRZXZYc0NTL2ZKb3Y4bHNBcXFi?=
 =?utf-8?B?SXZoR00xRm1XaXBqTDZnVGdTSWpuV1VpTUlNb3lWUWt5UVVvYlpsN1BEZ2xX?=
 =?utf-8?Q?/PnoahFUCFpwSl4xqS8U8cZxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147c8543-73c1-4aae-4e0f-08ddc3b627d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:42:07.8935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ex9WKkgoxcwn0FkFDJHbXfqdGwNPygbOZS7coUKkrUHs+L4g5s6DiV5ef5GjmuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178
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

On 15.07.25 15:50, Lin.Cao wrote:
> When application A submits jobs and application B submits a job with a
> dependency on A's fence, the normal flow wakes up the scheduler after
> processing each job. However, the optimization in
> drm_sched_entity_add_dependency_cb() uses a callback that only clears
> dependencies without waking up the scheduler.
> 
> When application A is killed before its jobs can run, the callback gets
> triggered but only clears the dependency without waking up the scheduler,
> causing the scheduler to enter sleep state and application B to hang.
> 
> Remove the optimization by deleting drm_sched_entity_clear_dep() and its
> usage, ensuring the scheduler is always woken up when dependencies are
> cleared.
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..ac678de7fe5e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -355,17 +355,6 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity)
>  }
>  EXPORT_SYMBOL(drm_sched_entity_destroy);
>  
> -/* drm_sched_entity_clear_dep - callback to clear the entities dependency */
> -static void drm_sched_entity_clear_dep(struct dma_fence *f,
> -				       struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_entity *entity =
> -		container_of(cb, struct drm_sched_entity, cb);
> -
> -	entity->dependency = NULL;
> -	dma_fence_put(f);
> -}
> -
>  /*
>   * drm_sched_entity_wakeup - callback to clear the entity's dependency and
>   * wake up the scheduler
> @@ -376,7 +365,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  	struct drm_sched_entity *entity =
>  		container_of(cb, struct drm_sched_entity, cb);
>  
> -	drm_sched_entity_clear_dep(f, cb);
> +	entity->dependency = NULL;
> +	dma_fence_put(f);
>  	drm_sched_wakeup(entity->rq->sched);
>  }
>  
> @@ -429,13 +419,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>  		fence = dma_fence_get(&s_fence->scheduled);
>  		dma_fence_put(entity->dependency);
>  		entity->dependency = fence;
> -		if (!dma_fence_add_callback(fence, &entity->cb,
> -					    drm_sched_entity_clear_dep))
> -			return true;
> -
> -		/* Ignore it when it is already scheduled */
> -		dma_fence_put(fence);
> -		return false;
>  	}
>  
>  	if (!dma_fence_add_callback(entity->dependency, &entity->cb,

