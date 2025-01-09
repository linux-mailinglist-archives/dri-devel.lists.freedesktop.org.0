Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C75A075C2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4610ED9D;
	Thu,  9 Jan 2025 12:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S4+PYipB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216D210ED9D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaRGHYSDNDx8j5Sv739ndbEavJ3gTGTro3zAYBBSmtwu9RXKAC1iNW9e8YQWIeoRvDtJWZXIflEfXyy7ug7Jfr5EiHVr58XHTXXNFgifbOppRwx5MrQ8EtecHo9VApFHypoBRblTqb3rN9xxatczVkhnXL0gHX3T0nCtsbn6KMomO9ORGvNDIrxkF7KKJDrSCpB0T7njZYCoHvgLntYoPewOu0s5bfoV7MkXVSezAtGoth3SoZDbOVuPjj6sgwELwS6isySU3bpuhv+qSiNJ9jfVFjt0TWuGAOaM5TWP2tvXSh6qEO5isRKe1BW+oCyroalLTeideiyEaulidkuTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMM1F1bK/bxi55K1sCI7mBBP3NJR+vocn4NEIz4RDMQ=;
 b=ii6nY9wFmWRdqEcH67cbqJLQpYOsJA1hfWtA2S9yikaGtk4JzjWoghfpddAIyavQQVnU4EZ6Zdzew/hHhwv5wXgMZBF027Jf6uOZL1lp0qEoYchVECSvjVJv8qRJP+kgiqG7GZ03TQvigH8/5sFo1LlT2flvdcB8X6HMrPb1XAQLKFhEHaQ6dcBTFkbPvF1e6IRvUQuEjGUd2aUhe7muzsvPIzbXldEixrJOCgmJ+9rrWzumOxoLPyIHEBIWUrDUD5swNK5XcwQmAAyOyL80GZVN77UiL2MM+BLZ+n7OcBH3uxGjd6EYnNLKS8YHKLlDdZNbgkrHokHzXsXNpNY07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMM1F1bK/bxi55K1sCI7mBBP3NJR+vocn4NEIz4RDMQ=;
 b=S4+PYipBcaDpE5Kmlw/YRgZOjnqlSR0motyIajQ8zbvftU94lV9TWg4GGign2jNJkVTzFKiIcra7WB3l8BywGyMZ6NX256I6b+OF6veqMJiy3Q6KHcjvdwONgkwtQ8vGcMZxwKC5bTDdJzyiYz4SWMMRZfjgUaBVOUst4tV/Cyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 12:30:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 12:30:46 +0000
Message-ID: <48e3b200-39e5-4e54-ba05-de72c627d876@amd.com>
Date: Thu, 9 Jan 2025 13:30:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/18] drm/amdgpu: Use DRM scheduler API in
 amdgpu_xcp_release_sched
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108183528.41007-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 646e248f-63ad-4316-4b68-08dd30a97146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cytHL0x6VExuazBUVVZJNmtCakFiSEJJN3g4cUJXemRIUlhheTBaUVI1SjFZ?=
 =?utf-8?B?MUMyRVdSNkhuelUyYkVKenFiZVVqUUs4K0M1N1dkOWEwT1crMWgxUXNDWHJU?=
 =?utf-8?B?ajh6dFFabDhYeXRKVEcvMFduTGZ4YmE5K29TTXlMbFRLeWxiclNpOWFCYzZL?=
 =?utf-8?B?QXdWYlI2Vm1WTkFPY1N5MEt3dDZ4NE1QSWJ6OUFZdGoxZktsTXFhR1RCWEpN?=
 =?utf-8?B?NmhyWGo2L1hMY0E0Umw4eUhCckVhd1YzeVdJM2ZrVjRQRXhuc1I1dlRGMDFo?=
 =?utf-8?B?enllQlJkc3A0cjIwNHNhb2NvaUpxQmNzZ2JEMGdUQk0rU20vZFlYYmRXU05O?=
 =?utf-8?B?cU5iNEppU3lMUkZ2UklSZ2dxS0J6TnM2aGpyM3JHSktSUmN5d0xjdDFQeFVF?=
 =?utf-8?B?TXBQWlJ0azdFakJCSEpoN2o5WkVJN3k4ZkJrd0xJM1ZkN1kzMzlxNjJQckFm?=
 =?utf-8?B?RWdWTVBRdFBMNTNidWx6QzA1akF2OU5ydDZxTitaMnY0UW9tZ0c1enNMY3dG?=
 =?utf-8?B?YUhxOFBEMVRRdnJabCtac0FOYXpOSUp1eVdOMDlkOVorYTdXdDkzZ1dQZGNL?=
 =?utf-8?B?SGRMUXpnMWQyTUtyMTdydU5HM3hHeGl6YVpGdElkWGFSVDBIcGZMWDJhaUdQ?=
 =?utf-8?B?TDNrYmE5dVdvTDhpZ3BTS1l3ZG1DeXpWbWx5eTc1YytzVnZBM3Z3UHVadHlu?=
 =?utf-8?B?ZWFVV2s5ZHYyZHFkUWVUT1V0RHRiT0hDWXlGNzQ0QVF4SGFJc1duSnJyMHFM?=
 =?utf-8?B?dHVodzkwd0dXQU1ZTVUxVTVkMUNPOTRxaVp6OS8zd2pNdUZmbE10c2k3WVRn?=
 =?utf-8?B?eTNtNlBVTkUyNGlwMnNtN3ZzVE95UzdyVWxabzBvN0xuK0VRUFN1Y1BOckV1?=
 =?utf-8?B?VVRMeWJ1WHdkaS9RSFpYeHllYmprYkxkSnhmSUxaSmNFdDNJZHRoNkdIaFht?=
 =?utf-8?B?S2N2SlN6YUxBU1pETnZEeU42UlMzbksvMDZ4NmZKbEFjOXdOWi9CNnY4aHkx?=
 =?utf-8?B?bVVlY2FBNUF5cXpGTFpuT1JlSDhGby9qNzdMSEN5Vi84S01UMDBFZVpKRjRI?=
 =?utf-8?B?UnpKUVNudldSUENCU0JDL1pNYlZDMHZrb0dsTnNlUnlQaDMrY2ZzODBkT2N6?=
 =?utf-8?B?ZnNwdGxKVFhHZVNGR3hWNmRia1d2bS9aME8rZGwxbk95WnJ0RWJwMXBwS2I5?=
 =?utf-8?B?eUtVMVNrRHVTdms3MGhWL0xSWWpQRTE2Nms1THdmWGVVOWNac2JvdzJ2VkMx?=
 =?utf-8?B?ZStNL21GRkR5UDRDVFJQcGM1QnNYT2ZMM3dFVmdZekU2YWRzOHFKRlNUdnNE?=
 =?utf-8?B?RVJRZjM3eGtrL0RNd1krS25SVU14WEZCQ0xMOTBOQkhoTnJrZzBCUUhOZGcr?=
 =?utf-8?B?RVZXWVdlNTZOcC91Z08zanVwUDdPSXBPQnZESkxsRGZMRTYyd3ZoRldpdW50?=
 =?utf-8?B?dUx0ZDUxamlManlYSEQwVnIrUWVyOStBMitMUjNUSjF5TWM0QWZWQ3UwbUtS?=
 =?utf-8?B?ek03ZmJjbTIxQkx3QjhZQ3J5U2JIK25iUGw3MXk4L21wZTh0Y1ZmZ3R4MTRB?=
 =?utf-8?B?aWlLeUhHMERNbk9KK3Q1Ym1raGUrOXoxM3plTWFPZjlVWi84RVh1ZkI4R3Jx?=
 =?utf-8?B?RGVtNy9BekdZR09nSEdwdjZkN0RPcERyM3o5dllhQlBRTmVMaDd3S2Y0UHps?=
 =?utf-8?B?c0s4WDlqY0U1TDYwQjBXckFLOENGMnZoai8vcEJMcVBOOGhkT1NLMW9EWS9o?=
 =?utf-8?B?NDVaMi9JczlyNlIwcWVmOG1BNmhpcFh4bDBRR2pCL2RLeW9iTDd6WUJrRFNs?=
 =?utf-8?B?M3BPVkx1dEptTGNiUTZ6dzdwTTV2ZTc3SHc2QW8vVEpoeXlnMUZ1ZDAxd3Jv?=
 =?utf-8?Q?1gNIf6hnd9vMC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJkZzJXVytHOGRwUjN6Q21Wa1RHanlnSmxiT2hXT1VLLzk5emZ1S0FiV2xk?=
 =?utf-8?B?Z3hNQmF2bUxyVkNrWXA4emlYK3ZERTNYeDI3dEJ0SXNTYW5lRkErZXFXTzVq?=
 =?utf-8?B?QVJEeUhucVdKekpHd3pUYkFVNmdXY2lmM0VncWdyeDN0VldSeEQwOHp6cU14?=
 =?utf-8?B?UlNnU3hkcU8zY3lvb0QyZHVHdDUvWlN1aW1Zbi9ZQml4TVJSeC9uenZqcjVG?=
 =?utf-8?B?WjZodzc5bHdUKzRjVlJDM1QyWVpGMjdSZHowcHM2NGJaUE1zSmk0TVRPYVBT?=
 =?utf-8?B?Um5CYWlUOGVNSHVTb2JqbHBkeE5KS0FhNFR1TS9meHliSGMvOVpWRGxWZE04?=
 =?utf-8?B?Y2FBQTUvY1ZMRnFnQUlkVWtCSmV6eE5VRU8zeVVraFZRZ25HMjZFbXFjRUd2?=
 =?utf-8?B?aWhKZ1ZNVkRUamhnNGQwNnl4aUJ6WlBhV2VrZEU3WTNIeUk4U3BVMDF0OTlt?=
 =?utf-8?B?V3paK2FlditMZEtoRWpGbnBqdTZTZUtqNnVPcXJJMGJ0MDYxem1rM25mZjZU?=
 =?utf-8?B?eEdRQ3ZLMC9IdFFqZGtNcjBoc29mZXdXTjVDTVQzdlg3NkxoVTYyUmNwcERU?=
 =?utf-8?B?LzhDM0dJOGYrZ0Uza1N5ZzNuZjA0YWtSUXIzVGw4SllMZVMvZnpJeWtWNVdL?=
 =?utf-8?B?SlA4Zzh4a3JVYjJNMzhFSld4RkNTWGV2ZW9lM0hQd2FFd3JNZ251c1VFMTFC?=
 =?utf-8?B?M1N6MHQ3STVhMFRCMytEUzZWWkViN3drSjMvSkFYUkhNUnB5OXRrQUhoY1dE?=
 =?utf-8?B?em4wQ3RqZ3ZCeU1nSFpoSzhML1YyNUY2NktKcjI1ZENYRXhEZDFsRWl0UTNs?=
 =?utf-8?B?RUdLOTM0akp1WXFuY3JOTmxYZjVnQ1JjWmhtUWg4cG5IR0lZeFYxVzVTWitJ?=
 =?utf-8?B?K1hiUC9EYlRwNjRZK1kvOWNzU1U5eFhwN2FrZ2pPbzVlNkY3VUQzRStuRElX?=
 =?utf-8?B?UXFBT3VaQmxZMHZrSkQ1b0xGbW82ZzQ1YjVSTDgxVUU2SHBmcEdXbERMRm1K?=
 =?utf-8?B?Q0lWbGxyOEJMTEh2SlIrSE9ZNE9kZ20reGZmVU8xNGVGTlQ5K1NpR3p1M1o3?=
 =?utf-8?B?cWdzSFlhSUlhUzhRaWppU2c2TFdVUitNeGQrNEl1Wlh6MUxVMk56MUVIK1VW?=
 =?utf-8?B?dUszWWkxenU5clhsQmplQitNK2RKRDZNU3h2dHFJYWJzeGVTMDh0ZVJwbXAy?=
 =?utf-8?B?cmE1ZkJnZEVUSUtvV0dJSFpqZUlNdU84S0ZaVXZuR01WUkEvYTJFcllJemw5?=
 =?utf-8?B?U3BDNlMrM1hoSWtxVHpxS0QzRkFuQndVelQzNXcvNGh4ZXlodFpnUkdGVDNy?=
 =?utf-8?B?RTZJbnBKTEIvdFliZHhMYTZuWEdQa3V2ZkZlUWRKTXZLTlBUb2daVXVseDZr?=
 =?utf-8?B?U1VQdGZpTnVZYzdaSml0SGhpb2grdGV5YTJsWUYzWlBncEZBRTF6UWtDdE5l?=
 =?utf-8?B?Z1NKemtTWno3UEtVQmtSOVBkWFRDbzJ0V2k3TVM5ZnJnMzlwWHhZVGpBNE4w?=
 =?utf-8?B?a2Zqa051V3FPN1RSL3RVeEVpZXorWGhNZWZTMUVEZlRhT3ZLb3ZCM1FLRlpZ?=
 =?utf-8?B?bDhsaUFQblEveHMrR283RGdXa3VzcFpNcmJob3Z3UG1zWTl6aEttQlRHQmFE?=
 =?utf-8?B?Z0Z3WGdYTHZnQ0RWUUpGSmJGcnAzbHU1ZXg2VWtNaWZya0NzZlJFMXYyNnU1?=
 =?utf-8?B?TjhXQlM1RFg1UUllNE50bU1TYnVzeVNER2c4NjJJQmQ4cFAxaklIUVRCQ0F1?=
 =?utf-8?B?ZXVSUzhGZUtqZzVQRmF0M3FSU3d4NWhUNjFCT29aYUc1YnJRYzBSWjhQdVIv?=
 =?utf-8?B?QzV1NmVUMXNHby9yQnVoSlg0d2Vzc3pHYi9BNjJsUEtxc1lGdzhyZzR2Ti83?=
 =?utf-8?B?MTdGTlQySFhCNVRRRWhwaDRkTGVLNEpNM1BaYzY0M2prYllVTUcwUHA1WWw0?=
 =?utf-8?B?WjVvV1pTd0l2cytNNDJMcGt4RXd4MlQyREdCU0srQ0x1SDN4MklWVGRIVTAr?=
 =?utf-8?B?MG1hdEhJUnpRaS85RGQrSjhZSHVmaHdxZDYzcVRidFZBVk1EQW5hVUdodS9X?=
 =?utf-8?B?cCtkd0x0Z0Zpc3NkSlBVUkdzTVVWbHJEV3hnNmxxUitQbFgyZWRzZm5TMnhL?=
 =?utf-8?Q?2KQO3dc90WvS/bPS2CAwMK8lB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646e248f-63ad-4316-4b68-08dd30a97146
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:30:46.6843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT5t2P9QV/HQ2CaLz1WaVGqMdXLx7xjfdMxC+V2xWO0kFcifYkCC4Y3RuQtyvaEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450
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

Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
> Lets use the existing helper instead of peeking into the structure
> directly.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

Grr, I can't count of how many of those I already fixed :(

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> index e209b5e101df..23b6f7a4aa4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -427,7 +427,7 @@ void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
>   		return;
>   
>   	sched = entity->entity.rq->sched;
> -	if (sched->ready) {
> +	if (drm_sched_wqueue_ready(sched)) {
>   		ring = to_amdgpu_ring(entity->entity.rq->sched);
>   		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
>   	}

