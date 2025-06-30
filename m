Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CA2AED9A6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F5810E3F3;
	Mon, 30 Jun 2025 10:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rBMXCYFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CFF10E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXZOWJpsxBuLutAtAKU5OF+/q+4+0eUZB4Q96jOvfQMIe3YA0lXg6QwSmRs5fLIVsPopKrCydqAD1xLeFisz1rc75N3JqNLp8clBJ8DjPGxDkYcOhzbSkamz43QMKwqu0rMy31TPk9OsE2Maxv/P3uXIqEZCd9tTS7CTXscZHESdcxMXwRu+Ae3NZ9GzOjOMuhdjJSMC1PeodGi9lLZ0kCCVHHJeePIGi1ZjvRFbUsmG/YJuO4TsfnXTVucfkc33+wiQU+NBltNQ6fYLxggKyxx4Y6Wkxa6Ldv1WROObAUKsCdnTs8DXUlpSXtv+b9bcy/lVq+xQMq/Cv/Qf3GDW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPpO4rfDwK2JbAHtx5KcjEtMeojfsLN3GQBDpCnNXaE=;
 b=FUGvhnTE+dBUQ+LMGDMcpDz1jFBY7FLDXSbvz7v3iAWoID9DHfu2xVi9BnEXPgs4nuECiB/YKRE4G1m3kgKMPD1RjPsDN1kq9VHM2y2IarSCUkkdlXIxV+fIuMJjhaDgwEF9MOgBdXpWDT0zFmcFKjVvMiWecpowvvXoFpbZ55Q9zrM6l4Rq/uiO9n1I07IbqPPzlAx4lxleHgYqdKBsyYG9G1UgEi50fzEu6FkyAHkZjzPh61by46YyIjdstKIBErJOhjGkr2NkECqY2Bgp1I5e8o7bfijVxZK5LAmWt1CbBaA4fQz4A5R9dT1S/lt9EmSULLF/+/mGnF1PNvh8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPpO4rfDwK2JbAHtx5KcjEtMeojfsLN3GQBDpCnNXaE=;
 b=rBMXCYFzvWudSlB1jr7N31Q4gByLuMCMZLPfjw/ozWPQXmvvP5WSEdNTDRpOwrLEkdXjBjmHDYvV2iE+js6ID3R6qKGwSTxBgAlkLr4DVU94IlYoN/aqHEwK9t3CdckTgChiwajovm6h45i9DLDwWgMR+U38BxoA1hMiSFpacZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 10:20:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:20:30 +0000
Message-ID: <ef369d08-1913-47f2-818c-e4f6643f6600@amd.com>
Date: Mon, 30 Jun 2025 12:20:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] ttm: add a memcg accounting flag to the
 alloc/populate APIs
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-11-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-11-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:208:239::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 35171771-6910-4851-f78b-08ddb7bfbd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czNEUENWMmR4QXZHU09ZSVZ0ZW82Njk4VlBmcUp4cnFWS2pOVDdITEFMTVFZ?=
 =?utf-8?B?V2gwa2lLa1BSUGNuSkhTN3RoUG9LL0dINzJ3RzZ4aUVPdFBCZmVJMHIveUJI?=
 =?utf-8?B?MEFxWnVoWEtmdTd5VzZZQUZ0OUtNWGU5ZnF4U3ZPeXRoMng0UHV4cTFUb2Qv?=
 =?utf-8?B?OUlVTlZGQjVRcDNPNVZSSlJBNDRmSXJPMjZQT3J5MW0zRktnTnYrWG1JS0Ez?=
 =?utf-8?B?b013SEJTZ1N5c3UxaHFxR1JnQWxPSllLWFZHYyswYnUzSlBPUjZzWHVob0lE?=
 =?utf-8?B?Rk9RZXJ3T1REQ3Q2eUd2OXFEZm9wd0d6ZXNQSTlIWVRxR0ZRdmlxY1VkQXBn?=
 =?utf-8?B?Q1VCekt3VEdtSWphbERtd3FEYWNyUFRPQ3hGYlBSMnNNVG5nYlp1YkpPd0x1?=
 =?utf-8?B?RHRySDRoWWRpbzlJTlpycVVOMkNJRnpkbksvWGQ0UWp3aW5Dd2Yyb0NGV3Zp?=
 =?utf-8?B?eDBQT2QvbXpZTngxWjNORncxaHdiNHhoYnptczhSY0c0K0htYjBPc0VML2hF?=
 =?utf-8?B?ZE0xVnBtaThYc2g3cGVtdVBpcjNuTlpVTDcwenVKYXNIY2FXYmpUV2kxVHR1?=
 =?utf-8?B?cUZ1YVJScWowYzdxSXFTbGxUWFFQVHhuMWd1VnFDS2J5ZmxNRG1USXRHbzAr?=
 =?utf-8?B?TVIyV25nRGdpK0l0aXNZZ0xybmJrRVRUQUs5NGllSVJPb1RyQUttanhQWHRE?=
 =?utf-8?B?dklnOGpFbDl3QnluUFlLdTBRNzd3Y1VPQnljSkM5UUx1QTA4czYySFNJbXI2?=
 =?utf-8?B?OGFXUjlNMFk2b3JFMXVGTkZ3VnR6WHZWWFVsaDQ5WHFqWmw2S0xhZWVla0M2?=
 =?utf-8?B?UVllbndGM2pTMzNvKzZ1blJrYUFjMnR4cDNVcGgwRjFueHoxeWNkRWNRYUFh?=
 =?utf-8?B?WnlMZElCMjdQNCtEZGVtZ2dwak04OVpOcm1oRTc4eThqYUlJOFJ0VmE0TnRh?=
 =?utf-8?B?cHpuM0VRc1R0cmVManlqWWZoc1JVYnhhNll6TGtaNjBJci9Ha1BjY3BWRmNz?=
 =?utf-8?B?U01WRFpvZ0xOTnE5VTJTa3Zuc3hhWU9NS3N0bW8yRWM0a3JVUlI0b2NKbkto?=
 =?utf-8?B?UEVienBqTTZlVENDRy9KbXI0dGF5R2Q0Nm5qR2xoaGlaRk5PQWp1a3NoVXF2?=
 =?utf-8?B?OE9oYk9zajF1UmNpbmhxSHQ1RStDVmprbTRsWWZvRkpjN3dHbjFnb2dkaWJW?=
 =?utf-8?B?RFNCVitIR1BOejlGS0pRZXFSZ3FKeW1Kb3I4TU9scDFZaXVDY0tiUGtpdjNT?=
 =?utf-8?B?V0drUCtSVm1RMWRQdW51VlBFQ1A3aXVudGxBSjYwaUR2MTU5WWtLcVRwV0E4?=
 =?utf-8?B?UE9JdjhwWWJrdEc1UUt6S2NVM2d6MXd6YzRqVzYwMi9zUkkrZnRBYWM3d1hW?=
 =?utf-8?B?cDVyZ2NxQmZkRVYvd2xQVFUzd3hhR0duSG1rSi9YVC9DTjR4SU9hdTNtb1Y4?=
 =?utf-8?B?eHQ5SGN6TmNjSCtpYmFaUmd4ZHFZMXZ3dWZnZVRNR1JHYTdrMFRtUnM1aVB0?=
 =?utf-8?B?VGdpTHdYbnNxb3c0VTlkeUp3WWsydS84TjlVTzNMK1IvTlVQRUlVYkZUNEhH?=
 =?utf-8?B?elUyVmZRMW8vakNiZTZMUnNNNEM0T1NRTUVESjRVeVlDK2IzczJYYk16aUdx?=
 =?utf-8?B?N2lPRFdRU1ZvcVcrYWlnT29IWXV4aE9VZjRPVVZSbUhKTlRTN2FZaFBoMlJ4?=
 =?utf-8?B?YzJiQlRaMXZIUHlQL2o1Tk9LVTQyNFovRCtJL2xGZXoyNUh6SWdmeURwSHFF?=
 =?utf-8?B?S3dwM0Q3WUN3eHFPazBnSk5YTlJGeXUrQVh5ZDdlblZrcmZacElHNkQvci95?=
 =?utf-8?B?cUx4M2RISC9qcmNQaVlKWjFJd1cyWVkvMVYzMFNMYkUwN0JCNjdPYndiZERa?=
 =?utf-8?B?SWNYS3BQbkxNUFNEM3ZFS0s0eVg2MEcvMFQ2RlVPVGJOU2VETnhhQXpocWZr?=
 =?utf-8?Q?dHT/FmEq6LE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDVhSCs1am5RcXpRTW8rRjR4QWVpZ2RTNTgzcSs1d28ybEdCZUgzOFA1Tytv?=
 =?utf-8?B?NEdJck5YUWljSVZGcmhRdCtEelloYjRxY0hQQXVwOHdhaFFnUkpvNWw1NFdW?=
 =?utf-8?B?ejRvOXBLeHZzYUYvYUVYdExmeVNRZS9rUFlBNlAreHRSVmdzNGhpYkdwaFR3?=
 =?utf-8?B?WERZRDB2UWhTaHpSeHg1WXFaV3ZISTBUMkgxSTB2bnRKY3EwL1ROOUVGbU5G?=
 =?utf-8?B?d25MOUJ3bEJRUnlFMGdmSExIbkxoY0ZkWnVGQzMrZDIyTXMwTGd1T3gzYjEx?=
 =?utf-8?B?a0dKenh3SXZwcmV4eXRrS3lER0VDZU5tMXpJR3BPTmtmdFpibjcrNnFDNEk5?=
 =?utf-8?B?Q2JLbE80YnExdGNLcm9wK09LQXhYa3d2N3EvNk5IZVZkMzVrdkRqMzBDdmwy?=
 =?utf-8?B?cVJ5K3ltTTY2azZJNzZNdFU3TkhqbjBnckJvMk9ucVlPVUtsakovWEZuRkor?=
 =?utf-8?B?U0dKN3lTbkxyNStEcDVRMXc0SVdpdVFtTzROSTFsSVFiTlM0VHlrM0ZuK0ZE?=
 =?utf-8?B?Q3NGSyt1NE1mTVBUeFhSdGFNQWxTYzlDUGI0STZ2SlF0Y3JLVVlpbW5TUkVJ?=
 =?utf-8?B?NGxENzQraTZEVmpOTUpuM3BJbVB0YmNZSFhhMGRNOXFMNWZFUnVGZi9vVWd4?=
 =?utf-8?B?ZXNPekZyWTFNVW1nWVZsNGpubXdPY2dhNmZpeTNGMnlxVW5nakhzSjRBazR2?=
 =?utf-8?B?MFhnN1FWem8zMnl4ejhYa2E5ZGFtNE9xYzQ3ZTVRdTJ4WEgwb1Iwbkh3aFAr?=
 =?utf-8?B?di9oMVZFcmZVWStuN2wyL2Z5Y21uMjVWaWJYKzlHNzF2YzhLNWRvbFJYZWJp?=
 =?utf-8?B?bHF1VW1KVnJaTDRKQU9kY2U5cDk5YStpemZkQjdzekY0dDBncFFpVzdGTG5a?=
 =?utf-8?B?NTlwM0Q1bkl2WUZnZWRpQVc1NzVBMi84UUtZR2FHalNPK2w3K1plZnc0cDY4?=
 =?utf-8?B?cFZXR3BOQnpvZ202RlFlQVhrYUl5cEVVVCtOdnBua3dkUlArU3VwZk8ycjlp?=
 =?utf-8?B?ajZaSmpVVmMzcEIwY0JSUnJTYXNFeE5hMjQ2ZlVMUm1mVnZzNnBtSzVPWFJu?=
 =?utf-8?B?UTVYUTNQd3BZcDVNaEFFd2dNM2FoaU9wWXRQa3BBajRJMTkrTlJKdk5Gb2NQ?=
 =?utf-8?B?WUJIeG9Kc2NIU0VVRVlURzdueUUwcHcxQytueGNEbkkwdnNPa1FsTmpOUEF0?=
 =?utf-8?B?WFRRMWJxUWJFQlBxeGx4U1Jab1IwRCtNczVpalJ1aUlRTmdtdXdpbklKbTFw?=
 =?utf-8?B?c3JyV1NrWVU5Lzl4L2wxUFhyeXYzSmtyVHNoT2FreVlzcmV0UXlOSCtBNlFY?=
 =?utf-8?B?NHFoTktPdlJQaWp4bFJKbngzZUNNbUt0aUxzWVBObTdMY0xCL2orZHM0SzVn?=
 =?utf-8?B?cm41NEVHWk45RkVNVHVIQUJvVkptS3hLUDAyR0w2L0wraGFwRWJra2VxN0tH?=
 =?utf-8?B?dThtMUtXeVNQdmM0YkFaN0k4OUtlMFNzS1V1T2g0U2lKS283Q0NkTExIeG9J?=
 =?utf-8?B?OHA2VGJYUDJNTHZFTGRINEZ5QmNabXBuSm4vdHBncjN0NUtVb1J0cXlTdWl2?=
 =?utf-8?B?cVMyaFNXMjkvdVhjdTBZNHp6KzBYTU1aWDZOYitFRkR1T0NycWg2RnBmSS9t?=
 =?utf-8?B?NUpFZ2s5U1V5VXpZV2FLQU1ROEoxNHkzVnRvR1JiVGg4RDRiZzdrMk5XMnZ2?=
 =?utf-8?B?ZjRMcitMdjE0L21rT2RwVTdGOHRIRFUxRXFSb0VqdWs4QnBCaENHSG0rTjFO?=
 =?utf-8?B?NHRjTmFnL3FTMnV0R3ltN1dsMUlXV1QvZTNKNkZ1Y21MenJ3RDlQeDZyREEz?=
 =?utf-8?B?OHhwRG5KcXMrZlRsNDNrRCtZdjFDaTNjd1pWQ0hSS3RLTW5WNDRydWIwUVJs?=
 =?utf-8?B?RUk1bWlHRzArajY3SVJ0TUVoU29XS2JreVN4RnZGKzFrdVBwS0NrdHFJTmh3?=
 =?utf-8?B?b053SW1EUEtQY1U1N1hwdHp4VnVWR3ZTa1RQbldqMUFEQzQvYmtXcFN6NG5l?=
 =?utf-8?B?bUhMclBBc2Z0TlJTVkszSnhOOFBWMVVvOE0xVjN5MlVlWE9NWE9nbyttZ1ly?=
 =?utf-8?B?Q2phRkhyVWFWdjFXWW82cC9pNUpnbkN6OWNGcFBkRG8xQVRJTTMvd1RwS0RF?=
 =?utf-8?Q?6d3FK8QUheiYtxFfWRRgLAJvV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35171771-6910-4851-f78b-08ddb7bfbd57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:20:30.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tss5+HNBOPfEpdgDfsP/Kt0Le1gGWgu6OUB8M4fChBnVUtYdlY3Oq7R6Nx9rtTOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

On 30.06.25 06:49, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This flag does nothing yet, but this just changes the APIs to accept
> it in the future across all users.
> 
> This flag will eventually be filled out with when to account a tt
> populate to a memcg.

I would keep the pool completely out of memcg accounting and always account at a higher level.

Accounting that low just gives a hughe surfurce for driver issues.

Regards,
Christian.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c          |  5 +++--
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c     |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c       |  4 ++--
>  drivers/gpu/drm/loongson/lsdc_ttm.c              |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_bo.c             |  6 ++++--
>  drivers/gpu/drm/radeon/radeon_ttm.c              |  3 ++-
>  drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_pool_test.c        | 16 ++++++++--------
>  drivers/gpu/drm/ttm/tests/ttm_tt_test.c          | 12 ++++++------
>  drivers/gpu/drm/ttm/ttm_bo.c                     |  5 +++--
>  drivers/gpu/drm/ttm/ttm_bo_util.c                |  6 +++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c                  |  4 +++-
>  drivers/gpu/drm/ttm/ttm_pool.c                   |  6 ++++--
>  drivers/gpu/drm/ttm/ttm_tt.c                     |  8 +++++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c             |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       |  7 ++++---
>  drivers/gpu/drm/xe/xe_bo.c                       |  3 ++-
>  include/drm/ttm/ttm_bo.h                         |  1 +
>  include/drm/ttm/ttm_device.h                     |  1 +
>  include/drm/ttm/ttm_pool.h                       |  1 +
>  include/drm/ttm/ttm_tt.h                         |  1 +
>  22 files changed, 61 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 9c5df35f05b7..920b412156dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1138,6 +1138,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
>   */
>  static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>  				  struct ttm_tt *ttm,
> +				  bool memcg_account,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
> @@ -1161,7 +1162,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>  		pool = &adev->mman.ttm_pools[gtt->pool_id];
>  	else
>  		pool = &adev->mman.bdev.pool;
> -	ret = ttm_pool_alloc(pool, ttm, ctx);
> +	ret = ttm_pool_alloc(pool, ttm, memcg_account, ctx);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 1f4814968868..6cdaf3696583 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -314,6 +314,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>  
>  static int i915_ttm_tt_populate(struct ttm_device *bdev,
>  				struct ttm_tt *ttm,
> +				bool memcg_account,
>  				struct ttm_operation_ctx *ctx)
>  {
>  	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> @@ -321,7 +322,7 @@ static int i915_ttm_tt_populate(struct ttm_device *bdev,
>  	if (i915_tt->is_shmem)
>  		return i915_ttm_tt_shmem_populate(bdev, ttm, ctx);
>  
> -	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +	return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
>  }
>  
>  static void i915_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
> @@ -808,7 +809,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>  	}
>  
>  	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
> -		ret = ttm_bo_populate(bo, &ctx);
> +		ret = ttm_bo_populate(bo, false, &ctx);
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 2f6b33edb9c9..4ab1eb3e42bc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>  
>  	/* Populate ttm with pages if needed. Typically system memory. */
>  	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
> -		ret = ttm_bo_populate(bo, ctx);
> +		ret = ttm_bo_populate(bo, false, ctx);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 61596cecce4d..0b555979d786 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>  		goto out_no_lock;
>  
>  	backup_bo = i915_gem_to_ttm(backup);
> -	err = ttm_bo_populate(backup_bo, &ctx);
> +	err = ttm_bo_populate(backup_bo, false, &ctx);
>  	if (err)
>  		goto out_no_populate;
>  
> @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>  	if (!backup_bo->resource)
>  		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
>  	if (!err)
> -		err = ttm_bo_populate(backup_bo, &ctx);
> +		err = ttm_bo_populate(backup_bo, false, &ctx);
>  	if (!err) {
>  		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
>  					    false);
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
> index 2e42c6970c9f..6d8781506802 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -110,6 +110,7 @@ lsdc_ttm_tt_create(struct ttm_buffer_object *tbo, uint32_t page_flags)
>  
>  static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
>  				struct ttm_tt *ttm,
> +				bool memcg_account,
>  				struct ttm_operation_ctx *ctx)
>  {
>  	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> @@ -122,7 +123,7 @@ static int lsdc_ttm_tt_populate(struct ttm_device *bdev,
>  		return 0;
>  	}
>  
> -	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +	return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
>  }
>  
>  static void lsdc_ttm_tt_unpopulate(struct ttm_device *bdev,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index b96f0555ca14..1f2b9f5f2bf8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1417,7 +1417,9 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>  
>  static int
>  nouveau_ttm_tt_populate(struct ttm_device *bdev,
> -			struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> +			struct ttm_tt *ttm,
> +			bool memcg_account,
> +			struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_tt *ttm_dma = (void *)ttm;
>  	struct nouveau_drm *drm;
> @@ -1434,7 +1436,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>  
>  	drm = nouveau_bdev(bdev);
>  
> -	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
> +	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, memcg_account, ctx);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 616d25c8c2de..8c4273239d16 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -526,6 +526,7 @@ static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct radeon_device *rdev,
>  
>  static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>  				  struct ttm_tt *ttm,
> +				  bool memcg_account,
>  				  struct ttm_operation_ctx *ctx)
>  {
>  	struct radeon_device *rdev = radeon_get_rdev(bdev);
> @@ -547,7 +548,7 @@ static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>  		return 0;
>  	}
>  
> -	return ttm_pool_alloc(&rdev->mman.bdev.pool, ttm, ctx);
> +	return ttm_pool_alloc(&rdev->mman.bdev.pool, ttm, memcg_account, ctx);
>  }
>  
>  static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3148f5d3dbd6..b52e3c1089e6 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -538,7 +538,7 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
>  
>  	if (params->with_ttm) {
>  		old_tt = priv->ttm_dev->funcs->ttm_tt_create(bo, 0);
> -		ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, &ctx);
> +		ttm_pool_alloc(&priv->ttm_dev->pool, old_tt, false, &ctx);
>  		bo->ttm = old_tt;
>  	}
>  
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 39234a3e98c4..aaf152c2383d 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -88,7 +88,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>  
>  	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	ttm_pool_free(pool, tt);
> @@ -157,7 +157,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
>  	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>  	KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>  
> @@ -220,7 +220,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>  
>  	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>  
> @@ -253,7 +253,7 @@ static void ttm_pool_alloc_order_caching_match(struct kunit *test)
>  	tt = ttm_tt_kunit_init(test, 0, caching, size);
>  	KUNIT_ASSERT_NOT_NULL(test, tt);
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
> @@ -285,7 +285,7 @@ static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
>  	KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
>  	KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	ttm_pool_free(pool, tt);
> @@ -319,7 +319,7 @@ static void ttm_pool_alloc_order_mismatch(struct kunit *test)
>  	KUNIT_ASSERT_FALSE(test, !list_lru_count(&pt_pool->pages));
>  	KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt_tt->pages));
>  
> -	err = ttm_pool_alloc(pool, tt, &simple_ctx);
> +	err = ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	ttm_pool_free(pool, tt);
> @@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit *test)
>  	KUNIT_ASSERT_NOT_NULL(test, pool);
>  
>  	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
> -	ttm_pool_alloc(pool, tt, &simple_ctx);
> +	ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  
>  	pt = &pool->caching[caching].orders[order];
>  	KUNIT_ASSERT_TRUE(test, !list_lru_count(&pt->pages));
> @@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *test)
>  	KUNIT_ASSERT_NOT_NULL(test, pool);
>  
>  	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
> -	ttm_pool_alloc(pool, tt, &simple_ctx);
> +	ttm_pool_alloc(pool, tt, false, &simple_ctx);
>  
>  	pt = &pool->caching[caching].orders[order];
>  	KUNIT_ASSERT_TRUE(test, list_lru_count(&pt->pages) == 1);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index 61ec6f580b62..333c503e218b 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -262,7 +262,7 @@ static void ttm_tt_populate_null_ttm(struct kunit *test)
>  	struct ttm_operation_ctx ctx = { };
>  	int err;
>  
> -	err = ttm_tt_populate(devs->ttm_dev, NULL, &ctx);
> +	err = ttm_tt_populate(devs->ttm_dev, NULL, false, &ctx);
>  	KUNIT_ASSERT_EQ(test, err, -EINVAL);
>  }
>  
> @@ -283,11 +283,11 @@ static void ttm_tt_populate_populated_ttm(struct kunit *test)
>  	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
> -	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> +	err = ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	populated_page = *tt->pages;
>  
> -	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> +	err = ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
>  	KUNIT_ASSERT_PTR_EQ(test, populated_page, *tt->pages);
>  }
>  
> @@ -307,7 +307,7 @@ static void ttm_tt_unpopulate_basic(struct kunit *test)
>  	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
> -	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> +	err = ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
>  
> @@ -351,7 +351,7 @@ static void ttm_tt_swapin_basic(struct kunit *test)
>  	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
> -	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> +	err = ttm_tt_populate(devs->ttm_dev, tt, false, &ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	KUNIT_ASSERT_TRUE(test, ttm_tt_is_populated(tt));
>  
> @@ -361,7 +361,7 @@ static void ttm_tt_swapin_basic(struct kunit *test)
>  	KUNIT_ASSERT_TRUE(test, tt->page_flags & TTM_TT_FLAG_SWAPPED);
>  
>  	/* Swapout depopulates TT, allocate pages and then swap them in */
> -	err = ttm_pool_alloc(&devs->ttm_dev->pool, tt, &ctx);
> +	err = ttm_pool_alloc(&devs->ttm_dev->pool, tt, false, &ctx);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	err = ttm_tt_swapin(tt);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..af04bb8e2c2a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -142,7 +142,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  			goto out_err;
>  
>  		if (mem->mem_type != TTM_PL_SYSTEM) {
> -			ret = ttm_bo_populate(bo, ctx);
> +			ret = ttm_bo_populate(bo, false, ctx);
>  			if (ret)
>  				goto out_err;
>  		}
> @@ -1256,6 +1256,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   * is set to true.
>   */
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_tt *tt = bo->ttm;
> @@ -1268,7 +1269,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		return 0;
>  
>  	swapped = ttm_tt_is_swapped(tt);
> -	ret = ttm_tt_populate(bo->bdev, tt, ctx);
> +	ret = ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 250675d56b1c..764d1cf1ecbe 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -167,7 +167,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>  		    dst_man->use_tt)) {
> -		ret = ttm_bo_populate(bo, ctx);
> +		ret = ttm_bo_populate(bo, false, ctx);
>  		if (ret)
>  			return ret;
>  	}
> @@ -354,7 +354,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  
>  	BUG_ON(!ttm);
>  
> -	ret = ttm_bo_populate(bo, &ctx);
> +	ret = ttm_bo_populate(bo, false, &ctx);
>  	if (ret)
>  		return ret;
>  
> @@ -511,7 +511,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>  		pgprot_t prot;
>  		void *vaddr;
>  
> -		ret = ttm_bo_populate(bo, &ctx);
> +		ret = ttm_bo_populate(bo, false, &ctx);
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b47020fca199..c5ad447debe3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -225,7 +225,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		};
>  
>  		ttm = bo->ttm;
> -		err = ttm_bo_populate(bo, &ctx);
> +		err = ttm_bo_populate(bo,
> +				      false,
> +				      &ctx);
>  		if (err) {
>  			if (err == -EINTR || err == -ERESTARTSYS ||
>  			    err == -EAGAIN)
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c6192c915f0d..0526900366e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -744,6 +744,7 @@ static unsigned int ttm_pool_alloc_find_order(unsigned int highest,
>  }
>  
>  static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +			    bool memcg_account,
>  			    const struct ttm_operation_ctx *ctx,
>  			    struct ttm_pool_alloc_state *alloc,
>  			    struct ttm_pool_tt_restore *restore)
> @@ -854,6 +855,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   * Returns: 0 on successe, negative error code otherwise.
>   */
>  int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +		   bool memcg_account,
>  		   struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_pool_alloc_state alloc;
> @@ -863,7 +865,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	ttm_pool_alloc_state_init(tt, &alloc);
>  
> -	return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
> +	return __ttm_pool_alloc(pool, tt, memcg_account, ctx, &alloc, NULL);
>  }
>  EXPORT_SYMBOL(ttm_pool_alloc);
>  
> @@ -916,7 +918,7 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  			return 0;
>  	}
>  
> -	return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt->restore);
> +	return __ttm_pool_alloc(pool, tt, false, ctx, &alloc, tt->restore);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 506e257dfba8..8f38de3b2f1c 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -366,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
>  
>  int ttm_tt_populate(struct ttm_device *bdev,
> -		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> +		    struct ttm_tt *ttm,
> +		    bool memcg_account,
> +		    struct ttm_operation_ctx *ctx)
>  {
>  	int ret;
>  
> @@ -395,9 +397,9 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	}
>  
>  	if (bdev->funcs->ttm_tt_populate)
> -		ret = bdev->funcs->ttm_tt_populate(bdev, ttm, ctx);
> +		ret = bdev->funcs->ttm_tt_populate(bdev, ttm, memcg_account, ctx);
>  	else
> -		ret = ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +		ret = ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
>  	if (ret)
>  		goto error;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index fa5841fda659..a4d4ebf585fe 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -569,13 +569,13 @@ int vmw_bo_cpu_blit(struct vmw_bo *vmw_dst,
>  		dma_resv_assert_held(src->base.resv);
>  
>  	if (!ttm_tt_is_populated(dst->ttm)) {
> -		ret = dst->bdev->funcs->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
> +		ret = dst->bdev->funcs->ttm_tt_populate(dst->bdev, dst->ttm, false, &ctx);
>  		if (ret)
>  			return ret;
>  	}
>  
>  	if (!ttm_tt_is_populated(src->ttm)) {
> -		ret = src->bdev->funcs->ttm_tt_populate(src->bdev, src->ttm, &ctx);
> +		ret = src->bdev->funcs->ttm_tt_populate(src->bdev, src->ttm, false, &ctx);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 5553892d7c3e..2351dafc1c68 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -360,7 +360,8 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  
>  
>  static int vmw_ttm_populate(struct ttm_device *bdev,
> -			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> +			    struct ttm_tt *ttm, bool memcg_account,
> +			    struct ttm_operation_ctx *ctx)
>  {
>  	bool external = (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) != 0;
>  
> @@ -372,7 +373,7 @@ static int vmw_ttm_populate(struct ttm_device *bdev,
>  						       ttm->dma_address,
>  						       ttm->num_pages);
>  
> -	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
> +	return ttm_pool_alloc(&bdev->pool, ttm, memcg_account, ctx);
>  }
>  
>  static void vmw_ttm_unpopulate(struct ttm_device *bdev,
> @@ -580,7 +581,7 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
>  	if (unlikely(ret != 0))
>  		return ret;
>  
> -	ret = vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, &ctx);
> +	ret = vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, false, &ctx);
>  	if (likely(ret == 0)) {
>  		struct vmw_ttm_tt *vmw_tt =
>  			container_of(vbo->tbo.ttm, struct vmw_ttm_tt, dma_ttm);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7aa2c17825da..522cbff11563 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -504,6 +504,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  }
>  
>  static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
> +			      bool memcg_account,
>  			      struct ttm_operation_ctx *ctx)
>  {
>  	struct xe_ttm_tt *xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> @@ -521,7 +522,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  		err = ttm_tt_restore(ttm_dev, tt, ctx);
>  	} else {
>  		ttm_tt_clear_backed_up(tt);
> -		err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> +		err = ttm_pool_alloc(&ttm_dev->pool, tt, memcg_account, ctx);
>  	}
>  	if (err)
>  		return err;
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 894ff7ccd68e..099dc2604baa 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -464,6 +464,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>  		     pgprot_t tmp);
>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /* Driver LRU walk helpers initially targeted for shrinking. */
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 39b8636b1845..903ca40ebf92 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -84,6 +84,7 @@ struct ttm_device_funcs {
>  	 */
>  	int (*ttm_tt_populate)(struct ttm_device *bdev,
>  			       struct ttm_tt *ttm,
> +			       bool memcg_account,
>  			       struct ttm_operation_ctx *ctx);
>  
>  	/**
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index df56527c4853..da5b94226203 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -79,6 +79,7 @@ struct ttm_pool {
>  };
>  
>  int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +		   bool memcg_account,
>  		   struct ttm_operation_ctx *ctx);
>  void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>  
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 406437ad674b..15d4019685f6 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -250,6 +250,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   * Calls the driver method to allocate pages for a ttm
>   */
>  int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /**

