Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31E93A1D5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F710E5D9;
	Tue, 23 Jul 2024 13:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bQxyCM1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CEE10E5D6;
 Tue, 23 Jul 2024 13:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySI4QK2QdCOP5ZqIzn6THob2rr/ccBegNYKgc2fwjaSSzmhnDtR6wxxfO9ZfS0+mF6GZNf2j+TDgXrwTTczuaDpjJoIXKvx5X1wnwxLULsXfqOdp8hcCC/X6b0tqT9QyAG63ITDRTrhyLzzy7tKThOt4D7XTyauY1IFLBNE/5lptXl3ccP0vnYlGWatPTIA7igwNiMZnz7a0NY/tImyCW+OvkbMbhSbebL0psjvheWjdB70V/NDsx1az/PfokNuC+NInFcoPorc9AoSJprRlNvV6+zhdeK9RECv6NWvmJPmTa7GeJE8lVn2zGK8PObMtX3oXfa7hqNx+nFjbcY2JQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpCESbK6sCZeKMwVvVhDq9ZRkkMaN9vXeFmkxeqpW+8=;
 b=AwMsRd2B+1Hg4RRfVY2ECXF+eovJpIyKdzmijvMbk4hEqGRVHo8qTH6Sp3XRixtL2nEzoW4Q2LrpClyyELGmX5d1Q+UoDowuw5BzG5Lq/FqDnsTz59LzaKNuQzTSj2E5Up/pwVqjjN5UNfR2nYEdIFbB1UQFHzgfPW4XlK/T9u/LhXFdW4oquPIQqjXNuiqWlv3lnkzZv6WpTITacEf+jmIOs3wpetjYLr4twx6oX0Zx6FKBtOr9Jb6C0j57lc/q56Bb8N2ojgMzWwci/YnXtHOLsXwqZWLUYneSgBs1KEi3eJHtqsffrMQ9YILYPvv3QZIervBlO2ecFHdACqLrCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpCESbK6sCZeKMwVvVhDq9ZRkkMaN9vXeFmkxeqpW+8=;
 b=bQxyCM1gsTnB6Id3KbGXs5ebp9EnyrEvMQJRMWLRH6scM4EyWY4cvvX9Do/c1SMo3uY4k467t3Bon94+4mzBCTm8AsT5NvnyxDJLWC7mDcW4TAtHsTLSXWWk2KzCpq1a8uVoyn+fD+SoRxNIjvkjEs6fCFGzSWDwxu4+Is+YxRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 13:43:31 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%4]) with mapi id 15.20.7784.017; Tue, 23 Jul 2024
 13:43:31 +0000
Message-ID: <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
Date: Tue, 23 Jul 2024 19:13:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: f5855282-9d79-437b-7de6-08dcab1d7052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEZ0SWx1S3pJM1kvMEVjZktjTHZPYkJvSjBTa1pHTDJmdm1PTldmSW96NVNK?=
 =?utf-8?B?ZldBWTc0d25BYjZCZ294cjIzVkZON3N2VkcwaHFUOFpxRXlTRGFHalF4dnc1?=
 =?utf-8?B?TnR4Zkc4cU4rNmpWdE1SZzZSNjdlSTYxT3JMTExyYm5kRm9MYURGc1Q0RXhB?=
 =?utf-8?B?d09VaEE4YmgxZEkvVDRHMHp4ZVFpSVpYV1J6dmZFbnFkRUlRcVRQVXE4WTg0?=
 =?utf-8?B?OEVDc0RKMHNSKzdOblNPZGRYaFYwQkVaY045bU9HaE5WamlteHN5ckRmWmFu?=
 =?utf-8?B?QStLZ08yamVYNkxobldwYzFYM1JCZm1kZUNnRUJYZG1ZVGYyK0IyL0NSWlBt?=
 =?utf-8?B?THZWV2NCNlhSRHBuRHBHUTZOc0xPd1gxTTVtcEZGLzg4TWE1cjI1SDV4RnhO?=
 =?utf-8?B?Vld6R25OT0ZZNGNPQ3BjNVViYkNtRm9RbUxqbFRSb0VCRmdKLzlIRXlzbkNh?=
 =?utf-8?B?WWZWSVZZTWlWbm1qRlZtd05qcm1PK3hnOTVMRkxCS1V6SXVCZUZkWGE2S2RT?=
 =?utf-8?B?KzhSU2pxVlJ5VkxMVnlMUWVVdWxJdHRHWXpMdlp1Um1zRGd2MDV2Uk8rbWxw?=
 =?utf-8?B?Nk8rVms1RzJRK0ZoUVNSdHdaNXZacE9kdVRidGJXcTIvQ2JHWkZoNzNtQkZP?=
 =?utf-8?B?WDI5VmFTVE9kUmJISlY5MDlCd1h0cnJnZXl6NmNkQmNMK2xDbVNod3ZCMnJC?=
 =?utf-8?B?T2tBcUtkbXlEZUlpK0JrdEhzNFlYZFdoOGcyYm5yaEZ1cHRMNVFVRXJhaVdK?=
 =?utf-8?B?VEhVYlRDa3FJSGEwL0FlT1JpdE1lNjB5MDVqYVhrT1kweUx6YXJDdHlIMHI5?=
 =?utf-8?B?eUVXUDMyclNYR2pNQXFoK0g0Z1V5MDliVWs4eks0OCtZME8xRWxhb3VoWnd3?=
 =?utf-8?B?cGtEV3dZaTh3TzVoRDQvaWRyUjhjZ2xWOVcwUnZqVVZML2lJWEcwRGFiemhX?=
 =?utf-8?B?NU54eEI2b293V0l3em9yK0lMVVc0STFpckpkTGFML3VDQTRQNnU5OWtnT0pT?=
 =?utf-8?B?Y1V1Nk4vMTNvbWRRVDZMallDZjI1Q1psOHFKVDZhUzB1QXRnYjZIVk1KVXZy?=
 =?utf-8?B?L0FXUnBpbHEwSVJ1MmdHaGJlL1hpNXJvNVZWOGFJSURLcldySWhyc2JDd0pM?=
 =?utf-8?B?NldiUDMwa0thK3d1UXRyQ1pnZkJtbDh5MGUrS25OWDQ0eC9wUGRKMVFvWjJh?=
 =?utf-8?B?THZVTEZ1b3Q4c2tpQm4xUVhZZHUwTm1LMFl0QUUyMkdGeFlQVmRuNlpmMVMx?=
 =?utf-8?B?SXExTlZhRVpaNGJNaXF4YzVWT25LTmorL1ZTcjhUeTljbTJXK29pUkgvK0Qw?=
 =?utf-8?B?ZUYvd2NVTVI3eW1lRTZidk45OVpDWlg5T0twM1dNOHFsKzhrZm0vT3ZFV0pa?=
 =?utf-8?B?VTI1ZTB2WGRtWUt0NTUwN25ocWtFMWYzS3J6aUFlL3JuVTFPWnNwYjkranNX?=
 =?utf-8?B?cmRTcmN5YlgyRmcvVFRndUY5dnFGU0xyeG41cWVIK0hadjEyeXNmY2ZUbWdS?=
 =?utf-8?B?cmt3ZTBMWkRITGgxQXpvWTRBdUdJTHZCbDVFbHFLVEg2YmgzakRWK0R1ZnhV?=
 =?utf-8?B?OVdERUdPdFZiRFBMQVZadFhkbSszV05BVEcydFg0RkY1eXNlSmlyWi9XNkJX?=
 =?utf-8?B?OXVvZFh0SGRLZktRMXdqRlIrT3JaRnlxQUNPODdHYTB2RVY5RjdyNU9haHNW?=
 =?utf-8?B?UWVWcWMvK3V0UURSOU0zZVFzTTFvcXN2U016VDlVR0pxM0U2NU1TdWdqZkRB?=
 =?utf-8?B?Vm5BVWtFQkQzRzc1SnQ4dlo1VVY0aGhKMVVqWC91czJjeEtxR3ZIQjNyclk2?=
 =?utf-8?B?S1RuQlRYYWJ2VDRSMG5LQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDI4THNtUkxmbG1MWXcrRWZTUUppeXQ0WnBhcnB5b1RVMlI0czNINGxJRDEr?=
 =?utf-8?B?TjlqK0dPOVkwRkVGUlBhckNiK0lyR0J1K3hvM01VbHNQMUxqVW9xcGJjdVM3?=
 =?utf-8?B?a05UUERxbHY5dlNBSjFNb2xaSlRQRHZGcU9GOWFMS0plcG5ZKzE2K1l1MTBn?=
 =?utf-8?B?M2MzelZnVUcyYlFlTVhjV1MwbTJtZlNhbytwOENlK0ZSUjZ1RzhzK1dmNVFu?=
 =?utf-8?B?RXF0YXdwTWQ2VzBWK1cwOCtaLzI0b0hXMVZKQ3hPZFNtNitsbzBTRC9QWGpl?=
 =?utf-8?B?bXM1eEJjdVpyTVVrNXM1TnlBNVYwZ3BOeTA2dU9pN0x6R1R5R0x2MUlhZW9C?=
 =?utf-8?B?MytWWjNyckU5YUN0U3Z2ckdyTmNWTFNqU3ZacWNaaUFycm00c2pwZm13L0Yz?=
 =?utf-8?B?UHhIN2ExdUJsYmV1MFI5ek5uOW5yQ01vUmlXSmxDTCtraS85V2lqQlpiYm5P?=
 =?utf-8?B?ODliUWJrZUp6NVlyVGxjNG5CUkVJSnY0Mlc2NXIrWVlYQUZCbHdRbFRDWDNK?=
 =?utf-8?B?NkRUTENRRDJ2ZDFDNlJIUnhvYmYrY1ZyMzBNQnJZREIvbXdCblplWGVzS0pq?=
 =?utf-8?B?S2ZJV0kvclRURjNhWk5ZRDcxd2FGMy9yYnU3ZjhjTVd4dnpIaW11cXZVRlhx?=
 =?utf-8?B?cHhaOXBBeGVKa1FoeWpHbjVCdEd3RXNiNkNTUmY2clp5RFhZa2tQTDVwaHJ0?=
 =?utf-8?B?aUl6dFlBVUNwWXVlUU90bEJzbkJvUTRvclpoMDhSWTJISUtHcGlEelRmVXB5?=
 =?utf-8?B?OGpuU3JvdkdTU0U4M2hMaExHMndTaC84Q0NGSUFRUk9Sb2w4VGUzVm5xWFBw?=
 =?utf-8?B?bnp3Ymg1eENhVXJPNTQvQ2hzeUJ0WWgyc0FDK1ZhT0xaT0lFT2g1aitiZk5k?=
 =?utf-8?B?azZMQjM4OUNSN1RsYmZJakVBYnNycnVKZVZucE5DaEJDM0tGdnVnd0tBbVo1?=
 =?utf-8?B?R21PTjQ3TmdLMUU5OXZ0YUJiTlJuQnJ0YytIaTVETWU1S2JKSHRzOFlDdTR1?=
 =?utf-8?B?TGhZQmovemczUFViZG80ZHpETy9LS29sbGprRVZjSlkxQTRLdDgvdkNSQUo1?=
 =?utf-8?B?Tzd6cGFodVlJbDlkejVmL1N2Y28zYVdUSFRXaGZDV1dGenU4VHhoZnMzS0VV?=
 =?utf-8?B?RXZ5SGozU2hGbGc3YUtYbGlRY3czbTFKM3dmSG1XaCtnLzJhTXN2T05oUEFN?=
 =?utf-8?B?eVlmbkE5VnFqc1lsekgvMVBDbW1HQnNOZnRxWVNSUjNUTFYzbGhlZ1Yvcmha?=
 =?utf-8?B?Y0ZyWi9SUE55TzNaejZJemIwQjNFd2dNTmsyTXJkM09ROGhwQ1JIS2JMZWZv?=
 =?utf-8?B?NWFNbldwNW1sRlc5TlNMMnVvdUJJN2NuK0pUYVBESVdZR0pNOHRUNXZGQjhO?=
 =?utf-8?B?QnVJWm1UK29jQmxHQnJLWkU3ekhVV3BtUHRBLzZyUS94dUpVd01WWmNnckEy?=
 =?utf-8?B?cXBPZjE3Um9kMkc3TXBWQTdBRHpnZncvQjJabXNpTGkzSE1lcEtGeEZOVWpl?=
 =?utf-8?B?WmF6amxUSXpxN2llOG5yQVNLc1BsYVdxdjhtb21IWTlwb2ZzQkk4cHJMSlQ4?=
 =?utf-8?B?aERrTzFTOXZYZjhjWkNhd0dvM0lVNW96QkUrOU1ycG54NnZDSU1UN2lTZVZK?=
 =?utf-8?B?dHFWbFFCYjY2dzQyN1hsNmtyMVNEQ3U4YTk4Vzc3OEVnOXJNa2tIRUVXWkxm?=
 =?utf-8?B?ajFxZjhzUGdUelBWbDd1NCtwR1hKbkJtYWFLeFRIYldiUk9WNXVzU3B5K1d0?=
 =?utf-8?B?enVhSEZjOHNRTmJIMDB3aUcvaStHNnNUTjZuSWtkcDVIYTZsSEVaYlMyR2xv?=
 =?utf-8?B?OElhQklpQnRvOXVnVll3amdGQXlwOE5ZOTZiVzIyT0w1c3hnUjNBV09XT0Rx?=
 =?utf-8?B?SFhneUVQbkFSZE8vWnQrNWcvQ1YvWEZ0cWpjWWdKRU1GS2twS2RuMEdKMUV5?=
 =?utf-8?B?YXp1WDlnSXQ5ZDhIckR4ejc4WnR6MEx4QmcxOTFCY2l3dUxNVzRWcE1CVld6?=
 =?utf-8?B?eTQ0NDVKY1h3K25yLy9aTDFqaFRqQ3NPNGdvNzRsdVg3U0NlWFdmWXVvUUht?=
 =?utf-8?B?YldVZjZUdmozd0ZhNmJxSWp0bmtmNWFZcUJmbVNKKy9TMk9qQmxBbndReTc5?=
 =?utf-8?Q?VR2faRghT6n0uoCxqdtqJiyo+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5855282-9d79-437b-7de6-08dcab1d7052
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:43:30.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4R0vLdQNhXU+1+k4rIOyW77Hmc6wD/V2eVwSQjjpGBBHCRT4Swe2vL5bAH4/4GlULbZU8LwkPYu63b9jO2LwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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

Hi Matthew,

Can we push this version for now as we need to mainline the DCC changes 
ASAP,
while we continue our discussion and proceed to implement the permanent 
solution
for address alignment?

Thanks,
Arun.

On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:
> - Add a new start parameter in trim function to specify exact
>    address from where to start the trimming. This would help us
>    in situations like if drivers would like to do address alignment
>    for specific requirements.
>
> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>    flag to disable the allocator trimming part. This patch enables
>    the drivers control trimming and they can do it themselves
>    based on the application requirements.
>
> v1:(Matthew)
>    - check new_start alignment with min chunk_size
>    - use range_overflows()
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>   include/drm/drm_buddy.h              |  2 ++
>   3 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 6a8e45e9d0ec..103c185bb1c8 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>    * drm_buddy_block_trim - free unused pages
>    *
>    * @mm: DRM buddy manager
> + * @start: start address to begin the trimming.
>    * @new_size: original size requested
>    * @blocks: Input and output list of allocated blocks.
>    * MUST contain single block as input to be trimmed.
> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>    * 0 on success, error code on failure.
>    */
>   int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,
>   			 u64 new_size,
>   			 struct list_head *blocks)
>   {
>   	struct drm_buddy_block *parent;
>   	struct drm_buddy_block *block;
> +	u64 block_start, block_end;
>   	LIST_HEAD(dfs);
>   	u64 new_start;
>   	int err;
> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   				 struct drm_buddy_block,
>   				 link);
>   
> +	block_start = drm_buddy_block_offset(block);
> +	block_end = block_start + drm_buddy_block_size(mm, block);
> +
>   	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>   		return -EINVAL;
>   
> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (new_size == drm_buddy_block_size(mm, block))
>   		return 0;
>   
> +	new_start = block_start;
> +	if (start) {
> +		new_start = *start;
> +
> +		if (new_start < block_start)
> +			return -EINVAL;
> +
> +		if (!IS_ALIGNED(new_start, mm->chunk_size))
> +			return -EINVAL;
> +
> +		if (range_overflows(new_start, new_size, block_end))
> +			return -EINVAL;
> +	}
> +
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	parent = block->parent;
>   	block->parent = NULL;
>   
> -	new_start = drm_buddy_block_offset(block);
>   	list_add(&block->tmp_link, &dfs);
>   	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>   	if (err) {
> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	} while (1);
>   
>   	/* Trim the allocated block to the required size */
> -	if (original_size != size) {
> +	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> +	    original_size != size) {
>   		struct list_head *trim_list;
>   		LIST_HEAD(temp);
>   		u64 trim_size;
> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		}
>   
>   		drm_buddy_block_trim(mm,
> +				     NULL,
>   				     trim_size,
>   				     trim_list);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index fe3779fdba2c..423b261ea743 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	} while (remaining_size);
>   
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>   			size = vres->base.size;
>   	}
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 2a74fa9d0ce5..9689a7c5dd36 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -27,6 +27,7 @@
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>   #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
>   #define DRM_BUDDY_CLEARED			BIT(4)
> +#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   unsigned long flags);
>   
>   int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,
>   			 u64 new_size,
>   			 struct list_head *blocks);
>   
>
> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b

