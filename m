Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED9A88AF7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BDC10E10C;
	Mon, 14 Apr 2025 18:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bxb1xCmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6810E10C;
 Mon, 14 Apr 2025 18:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj6Ohxq07Jh5MN1qtG2fQRdukmmuwYNzM6Q0VQdtxHF857m1sCtZ4+t7CEkekTqP0RVJeYj4mThACjwA94PLDpG4iWh0zKv3SwX607KETmadB8QNwqGcM6lsTN8RzjNtCsj1VSqPGsgZAMehD655JwvU/Iyb/QKMU2fdyUqCb5Lo8+ynNWOt0kWzNT66BKQlITLG0jGSquXrDuc0WTuh3cSuaawkvSP1OQFa8u0YzDCOdD96MWBJVu/W4nXo0YDzjNbLZiQ6LkFiNISSUpzN/uKSp/cL60KdJN0yyz5g+4fQnXkV4DkisoaT8x3CHHK6tilXgMi22qJdLxRvTfb18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf5LCGTuLDBqLRvQLTdZvpgk/jrDtSEF+LRat8xdnKU=;
 b=eT74Q9Ptxf6W9UEdfambuW1cwULUJnWzturguiR8UgHcbLqB57zIVsHyxJys+5UrCUsyU8WmIsTI8dp5/UzuzQTPs8UiWM6LLA+lGVy75+Rrv5hBdM5hdSj1lmCLHMu165q9gjYkc7dllLM+ZtCZRfBB246Ut9dLl0X75LiJeeGmm1JuPi9RFOhqR1y23mnAkulnrLxgneUnTcS2qqM99+D3T9s05WPTgALt9wa2b6Wza858rGEmbtVoMhmBQtUxt6eXspmEqzNN5c4vE2YwpZ9g1pAT1eZlyNUsoZPVBYzXFxJL+lpaITMHFkAW2BZZDSa5tnGJymM8B3xYn2hikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf5LCGTuLDBqLRvQLTdZvpgk/jrDtSEF+LRat8xdnKU=;
 b=Bxb1xCmRg0XrFafYKzEcNKA+Rhj6xtz5m3mYz5oZub2Hg2W6G+XQo1jSMHN56LP24LWOG+unM5ZOxBvHzHSI8oBOWOG3+Zm2gtO3L0h0ItuPyA8ZzcfDFntPIaMUgNqYEqgLmC5bsu59RVf/UDD82zzHjMJOaalD1+ahrWTNK5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:24:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 18:24:45 +0000
Message-ID: <d187d17f-0155-4c4c-98bd-f91e02aab5f6@amd.com>
Date: Mon, 14 Apr 2025 13:24:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] drm/amd/display: make sure drm_edid stored in
 aconnector doesn't leak
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250411201333.151335-1-mwen@igalia.com>
 <20250411201333.151335-2-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250411201333.151335-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:806:d1::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d066e05-c26f-49a6-ab58-08dd7b81a1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWRtcE5SZnZFUzd6b0s5U1hmOGJzSmxOY0ZtTGVPSXpIb3pMVkcwUy8yZmJ1?=
 =?utf-8?B?S1lRV3VpQ3dNTU01MTNZWnM5OURSOXZrb21TWWF6ck5MVXZQSExpZHM5NVRs?=
 =?utf-8?B?UFBvNzRiTEozNEs0OWQzN0h1MGRJb1RlQTJsenVURU8zMW9KN3d2Mm9IcGF3?=
 =?utf-8?B?b0Y3dG03S2libVJyUG0vZWhmK2ZHbFFhNkxPVVZ5MGF3VENicXlacU52WTY3?=
 =?utf-8?B?Ti9XYmhJVWFKQzlaL1ZrUk9iTlhLVXkzbEZ3TW9IRHllL0crMW90NC9UUHhv?=
 =?utf-8?B?WTFLMmw5RUZnc2U5TzQwZTFkbTNKUVlzdTRmNnd0M1psdjB2MENvMi9EWEtV?=
 =?utf-8?B?VUIza3JiWjVSUW9HVTYvQWluZE5KTWRWQ2FKYlV5YWR3UGVUSzUxV2hpYkdK?=
 =?utf-8?B?VE5CRjNTSXNIckszcVIvS3BTbTVYRmQ5clUzZTN2Q0xwc2tERVowcm1Vc0JF?=
 =?utf-8?B?dnJuelpFeFFWNldSWTV2Qi9YWGFqSUdnTkRRUko5SkVka1I2SHY0Z29VdDd4?=
 =?utf-8?B?Skt6czhDaVI2bmpCRGV6aDE5cU1oK01nMFVlZFpyVHVDai9HN0MwSTlzSG9u?=
 =?utf-8?B?MjgzNFlCWVFKNVl2NmZURUVMcFByMjlha3Rka2VpWEFiSHF1Y2x4VStUbERs?=
 =?utf-8?B?bGRuU2d2TTNVK2d1cXNnbXdObDBISDVQWTRGd2I0L1FtM290eC9KL3lkeVFm?=
 =?utf-8?B?MTR0OVk2cEFkUVVDRW1ZQlAwU2plU1V6NUhFQ2tKaXhWY1FYdUFMR1FqRllC?=
 =?utf-8?B?ZU1xdFVUQ0J5b2xkcW9adXhXQlcyWmJxVXNDc09sTTZhclVwa3lVMUhIRWVi?=
 =?utf-8?B?Q1Z4L0JHekFQenZBRlFNRzZGMjZiSDhqb0V0SjlOSThmT2N6M01GMmhZMFZm?=
 =?utf-8?B?OWpYSGQwb2hEU1N2M1BnbkxTL1QyRlJNZWVESE83cWhodVRtVjExSmh3RzVy?=
 =?utf-8?B?T2VkdW03cUJuYW9hOGJPTlVQM1RPNjNlMVZBeEJaZHg2RDU2aXdZVzI4RWxG?=
 =?utf-8?B?RHI3M2F1cjRLcGFmekMxd3BmU2VTQTUraXBnN0FDRGFlVFR2WFNtcEZraFht?=
 =?utf-8?B?NzhCK3RTcmxlQnZiK1BQUUdpVmozOG11WmdRcUlvS2Y3WnB3ZVhEQ3FVOXVU?=
 =?utf-8?B?MjdlSGM3WkFwMXVBcTBwYk1BdzA4QlAzNFZ1S0xCWSsyS05DeklUcGlEamR5?=
 =?utf-8?B?YXAwMjkwaTBDSUxiaVFWWXhUUlB1ZlFGKzFxUTRYY211RlZmY1c5UGtONTQv?=
 =?utf-8?B?ZTlRUi8wcUVxODF0UWZJL1RCTnFUZnIvNDlCaWs2bDJRczFrbVVuME5aRmor?=
 =?utf-8?B?cjlxa3owbDlaVkhROWZpS1dsQU5zM1NEaEpyeEpmejUzL2VHYnpSS2NCZ25n?=
 =?utf-8?B?TDNRMDU2WmZYZUc3RWNmU1IxVmZmYnZhdEdjTnN2clcxNmdDYS80WUJCOUJa?=
 =?utf-8?B?bnpzeVlFQm1YTXFJM0RQWjVhSmRoOWZKdStCWGZZR3dyb3pxYzhML3VlbG1N?=
 =?utf-8?B?ck5yb2hPQnlwOWI3bzRRaU1WWWZjR0FDTVFyemhIblNmb2ZYR2FYbDZXamov?=
 =?utf-8?B?Wmt2VDBkYjRRRWVLREZmUU9aWU1iVldlUTJjeHR6UHlrTmNXcmlDbTBNeDNm?=
 =?utf-8?B?OUwrUWxRa2trSnJYSTVjR2t3U1l3QUk4aEZnejJMTkJiRjdUZGRQRE5FaE5P?=
 =?utf-8?B?V3IzU0xCcWFEMUVNSE1DL1dOS3J0TENTbHlRQlJkUjhMS3BEYU9SNnk2cFhM?=
 =?utf-8?B?bUZaWThPOCs0Rk5jSzloNy9VMTJwdCtMb1RkaWxDWnlDRUgrekxqTmNNeEU2?=
 =?utf-8?B?YWxLRS94VmlkeWIwdXhzK0ZwM1FGNVhKa1paRVJEcysyNy83U0pYRGF4SWJR?=
 =?utf-8?B?ZGZwcXl4T2tJSmNXSDRQUXliMVIza0FLOWVOWFBhQXZPOTh1MUhha3YrcFNL?=
 =?utf-8?Q?GKVJes0kE0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0d2V0dVVVV3TGJUK09rbmJEYTJ4YXFXOFIxZTJ4SWJYZlhNd1FNZFUrbjkz?=
 =?utf-8?B?c2ZrTmR5V2YrYjR4ZEpkbWNaQmNGa0lYaUkvN3lQU01nQzYzRFdBa3U4UXpR?=
 =?utf-8?B?U2NqWk1YUVRPcVlyaHpMS3dPMUIvZ2k0dmFrR2NBOHRNTTRadFFpRGhXKzV3?=
 =?utf-8?B?bXhjWUFQN2ZXaWk1WWp4L3VoUExmcG9taGEzTDB6T1NCVHhsVlYrbSswZjh2?=
 =?utf-8?B?N01sZ1d0RnoxQzcvSjE3ZUNuMkJaa3Q3OS9OV3ZEdW00R2dselZRMytrZFB6?=
 =?utf-8?B?aDdFTXJCd3J1YnQwMWl0WWttLzd5VzFBQ1h2K1NCMFdpYmFnSHhVVDBPTk1y?=
 =?utf-8?B?L0VCRVlORGFRQnVKQVZvbkdxRllhRVRZNjdIdGdodDVTQ0RaQXlsZE04d3A0?=
 =?utf-8?B?Q2VMRFVKNnl1UU9pcGRrVm1ZZXRIaWw4NHZudWhxcVNJeVhSMlNyZWJrVlVZ?=
 =?utf-8?B?OXN5b3ZDUVU2c2Q5NCtJZTV6dHpST28vWGtjdWFWUDFIa3RNVEFjdlVSR3dF?=
 =?utf-8?B?bDlaSFNVQ0ExRk8zenhOWjBjUStMT2dTajlqSDhWdHpqd2MzOEd2K2xNeExB?=
 =?utf-8?B?VXJvZmgyenVUUFdwR3F1SERUR2VNalFSTmdacnhoMWEyVDVQeUNTVzN4NUpK?=
 =?utf-8?B?RUowSEx5Vm1vTWpqQllBTHhrVUdzcnJiZ2dLSmdKbmdudnZ4VmZDZ3R3UVBm?=
 =?utf-8?B?aVphMDRHTGhxVU9LZ2NDREFKbm5lS2xia2prQTFGcU9yMFRqNUs2eUpNdmFx?=
 =?utf-8?B?dTE5b0I4OUVVOWZHa2JKTFJHbWY1MVFZQUptRWtvdm5iVENqSGVXYklNdnFD?=
 =?utf-8?B?ZWhSSWRwMjUyWU9zYnBPZkpaL3doc1hHSzlqcUNiZDNFdWF4eWc1OCtKZlky?=
 =?utf-8?B?OVdVelo1Z0hxczdQRWowVHhiRHJoK2k3WldZdkJBZitLWUlyUU93d1NINWVj?=
 =?utf-8?B?MThWSjNMWTVYanlWSXZZVk54NXA2aWFKUDFPYWpFbVJscDRVSWpvd3NlY3Nu?=
 =?utf-8?B?Qm5QUWgzc1BQRnRmVUx0V2M3Z0EwaWtkOG4wR054YjJISmUwbTJGb1h2UUhh?=
 =?utf-8?B?M1Fva1JFa2dOWEVHZ2lVTnJKREdpQnFzOEpPMFdQakRUM3g0TStmSEhMcnBF?=
 =?utf-8?B?Y3draHRaWmg4Rkh3UHlmNktySXA2cUhNay9vUGkxMU10L2NQK3orbUlXRlJj?=
 =?utf-8?B?U2JIM0Z1SHVGUXNVdW43ajRReUVPNzdxRkl4MUh4cW1kdWVhWVp1L2dUa3VK?=
 =?utf-8?B?WmlySHg5eEhKckJKbEdlRFkxMDlqNzcvTmF0b3ZFUjlvci9EYXUyUG1ZMVdL?=
 =?utf-8?B?WmlvdGxtcHNuUHk2L1o3YTVyRU11K1RLeVpETkc1NjdiQXpmNGRNa0JZMmZa?=
 =?utf-8?B?a1IrMHQ5RGVUTnRCM0dFdE96Zi9ZZ1N5K3BOeVl2dVZqVnVEVXRydFRvYkxh?=
 =?utf-8?B?WGxBQXZZSG1WcWZJQ3FhOEVFVkpSSTcvTENOUExTTWdqL3l3Q01iaXlFdWtW?=
 =?utf-8?B?M05VZUY4cTZKNFZ3a0g0bjlMZ0djWnMyV3pUQjVGSXJhczZIQ09vMi95aTFQ?=
 =?utf-8?B?R2w3cjdjM2pVbzNFTTEvM3JrY3hRYkZVd3NMNDdibDY0cHlPMitjYW1reTRn?=
 =?utf-8?B?KzM3NS9tTEwrZ05UTTFRSStmUVF2Lyt0WERWa09qTlhSczNaSGhjTG12ejk4?=
 =?utf-8?B?aWVYVi9EUzQ3U2NWVEVDeVFvVkdnT3IxUEc4ekowbW5uL1VTVkhtcGswellD?=
 =?utf-8?B?UDh4TmRSY3RxT3drSnIwaVF0bCs5QkgzVkJ4WDVidXJGR0pQLzJtbllSaWt5?=
 =?utf-8?B?UGVhVE4vdzRvNWJxMHVubGRyUlRpNEgxSnF2SGVCcVhzYjVaWU5pZG5PeE93?=
 =?utf-8?B?VTBqS3FpYWg1ZCtmRndFdmlWZ0QrM3NUOURrVmZqVVlKRWRlcWdub3JjclZx?=
 =?utf-8?B?WlNZcTREWWhMWnFySkxycUxLWnIvdzJYbTVya3ZyZUVCck8xa3BGcEJLZm5Z?=
 =?utf-8?B?aTMrVXpDaWZwRzdQMEhwa0FRTWkwMjFjblJ4UVhRTElCQXdCalYzeWNIUk9n?=
 =?utf-8?B?c3JIRk9Ja3ovRzFRS1RWZU9vTVU3ZW1zZENBdEFpd2g5Q3pDNEcwVjIzOXo3?=
 =?utf-8?Q?UB7Wgy2XF1w6tW6ytWoLpSzFd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d066e05-c26f-49a6-ab58-08dd7b81a1bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:24:45.3621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcN2dNEtaSvUiegG8h6CPw6mC2TkWLuivPS3Z8+kc4XeKjMjTVCeCLQ804xmvGs/0EEvR6YbTkmXE5WwyjL6sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
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

On 4/11/2025 3:08 PM, Melissa Wen wrote:
> Make sure the drm_edid container stored in aconnector is freed when
> detroying the aconnector.

destroying

> 
> Fixes: 48edb2a4 ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Minor nit above.  Add to next version:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8665bd3cb75a..960bb8c62ffe 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7397,6 +7397,8 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
>   		dc_sink_release(aconnector->dc_sink);
>   	aconnector->dc_sink = NULL;
>   
> +	drm_edid_free(aconnector->drm_edid);
> +
>   	drm_dp_cec_unregister_connector(&aconnector->dm_dp_aux.aux);
>   	drm_connector_unregister(connector);
>   	drm_connector_cleanup(connector);

