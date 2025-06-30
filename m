Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF1AED94B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4018510E3E1;
	Mon, 30 Jun 2025 10:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="up9rwjyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973C510E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 10:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt7xPhnKyUNl01/WG5UlJNFhnUthCtipM+4v8dnL6VYvi+C7oc6E31UcAmjdd/RwJrAP9gfr8pLoWLM+rNmO893NX1DzSun7LoZWDjFHFHw47fm3SWQPKKT//PofUkj0yX8wPv2JEPQC8DCCh2q6JCplnf3pHHpkbkVJhumTGk9kYo4BWuYfYm1Ki/SpiekRWIsfr5kFuubzJYHfnFlRoTQcCmmzhYgcf36a6Yqyz1Q0+HbUBmsldbMjx3u1L1HqkAcEnfGwPVd2cmCNyzRJDfdis+PhGljEzaKALzgyBGQ11Ou2B25aih4OQbMnxdI6jSH0GbrVjII+SbvDc5bwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIvpggqX9zX8dsY2XjKcygWn8nsALah21UhLv5Fy33A=;
 b=jLRfgk/wudsDrBnEn2bZuy1L9wOw5YWFGWbtG+K+LvyslZcoB1qHWueyKoKwTA2v7NumeeC6g5pM9sfui4jLu8+wZNoI9y8gdFL935esBxSByrxAWOdbZlX7pSXeTeHmjiw4dveMXPK3i+7PgEiEmR9MupQlbfGxymKf5PsPglvoxpFJWQ3rZ7A2wpkHFNMfM2G45h3ysymcCTCen7HtRJu1Rdk9Gs19RN2gK8HmRDoilLN8IjO+crAifR6rfRCjoWciGp6+kIBCCSj9NmXkLeyafChTIePFg116Qiegdr/1FL4lVYBWqajsvCTXNz5HHn0EbyyFyEeoKUljptdgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIvpggqX9zX8dsY2XjKcygWn8nsALah21UhLv5Fy33A=;
 b=up9rwjyrsy7O8ykz+tQF5nP9V9Hi7yCHX0QP7cr3vr+kugi05iZ8KFoVCxUAWvegsj6uKztlVnYClqIbejW+r6MrRqNOyC1D47FxVBrJQb3RLj3eQBpDXwYl4l643900Aw07etPm9C3BfQ4Gvc/xin8LkWk0DPPDkcB2YmvGghY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 10:04:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 10:04:27 +0000
Message-ID: <ca2606e3-ec5a-4fcb-b252-bb00a531c0dd@amd.com>
Date: Mon, 30 Jun 2025 12:04:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/ttm: use gpu mm stats to track gpu memory
 allocations. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-3-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250630045005.1337339-3-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAP220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f7d7fb-045b-4557-6385-08ddb7bd7f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlo4ZzBFTnJMa3hGU1NLNlNDSVhpRWFybC9wZXNYT3JEdnNxWGlYR1dvSk9l?=
 =?utf-8?B?ZkJWZHFWN3FFcTMybVc3amVrenc2Ky9TN1pHRnIzUnJ5Ym9iVll3bVVkUmxt?=
 =?utf-8?B?Rm1iR0c5eVJzSHVIbEk0c2xtTzZKNDVMTTVwWjBQQlordHFkbWVCdVE3TUNK?=
 =?utf-8?B?R1pKcUVmQThEaEZBSTBrOVBYZ1U3SFM1bS9JQ2NCY2lBbzVVKzZvY1RCY3da?=
 =?utf-8?B?aTlBVkNpeVEydko0QlpTQ3NKeVlNb1BFYUpHbXUzMGJ0eUM3eXFFekNsd25y?=
 =?utf-8?B?dE9zeHo2SVJyakp0clhCNXI0S0t5ZnFXcWtxWVRGRjJxcWNOQWhqUnlpZjYv?=
 =?utf-8?B?MTdLK3hmeTlTcG45U1hTb2YycUdjaGhENkpVYzZna2JTaGFLSFo4WElBY3RN?=
 =?utf-8?B?UUhlTlk4bVdGKzZVQWFQMEtRdE5qMXBzRGZqZnc4ck9qUEdHdlhYR1pQcmM4?=
 =?utf-8?B?WFFwd055empvR3BzZnBpU0xqS1dFNG03MmVuSExSSVcxK0xyMXQwTzhYMWhW?=
 =?utf-8?B?VVVURnRZdnpJVXJQWGZMcjdUM2JRa25lcDV2bnBTc0N3dENPQ0szT2gvaHp3?=
 =?utf-8?B?OGxkWmVheDd1U0NUTmZweVFIVVNRekhZckNjZHZEOTNmRXkxaWtLbE9GTnRo?=
 =?utf-8?B?d0tWTlBPNTZoQXl1UU9DdVRiY2dESUdpQnFmY25pQUYyeHNVNXdCSUZJS3dG?=
 =?utf-8?B?aHZBY3RCZmNlYTZKbGhNZzhndHd6S2Q2VWtUQ3V1WmNoSkJqbjFZVlF5UEdQ?=
 =?utf-8?B?Vy9rdWhKdTBpNEhTc2wzdE9QcFE5VEpPN0NVNE5TQXc1UkZnOXUrQ0xNRnNs?=
 =?utf-8?B?N3JweXNHcXdGVW9iT0RRNC9hSysrVFc1RDlBM3M0b1JPbkdxNHRkclRuVVAw?=
 =?utf-8?B?Mmw3ZDNEang1ZU9iL2FDT2RxMURldHVWMVR1RzFlRE1sa244OXNiVitzcVND?=
 =?utf-8?B?Nk1mSWw2WnJCYmZvMU83aFRLVURWYUxLRnR3WDI5NFFLSWNpNWhaM1NseVpJ?=
 =?utf-8?B?OUwzWnpWMUhPRUpEZzZqTExucXRlclhpbnNVUzV1Vlk3b2EySy9WK1F5ZVhx?=
 =?utf-8?B?U2h4Mi9ad20relhTaWRaWGY2bmttd1p3TUpWUDkyKzYwNnhpSlpXYU1ONjZh?=
 =?utf-8?B?aDBvSHo4ZXg1ZFNXbVdXbmZjZCtoTGxNeFIwNE53RjE2ODZpQXJQQlp4TkZN?=
 =?utf-8?B?RXNnUVUxZ1owUHNtZ0xmQkJMZnRTK3VHRkE1emZHWWdhMHBhaTUybEdOd0xR?=
 =?utf-8?B?WmFEWFk0S0gxYXZlTUJFSmZWdExIeGhSL0R2dnEwbDhncC9zdjduVElsNHh1?=
 =?utf-8?B?cEFBalRxMXlwSXhFUVZIV1J1OVVWcjBXYWRwNithblhmRFd4STRNVm1GRVJu?=
 =?utf-8?B?c0dhTTB1cXNHU2s5L2NzbmxMTHA4dTd5dkx0RWRmc1Z3a1Vvd2hsWTdmYWJq?=
 =?utf-8?B?ZzNybllINVlPTCtnY1VtTUU0NmplaDFyeDNUYW1lS0ZGUEl5MXJ3R0U1ayto?=
 =?utf-8?B?NCtCR1pHOEo3Vmc4dEt6RGhZa3FWc21Dd1lpbGJXOHVGV0JwdlB3MG8vUHYx?=
 =?utf-8?B?TUhBLzAxS2c0MkdEVVR2Y2FFVkEySEtlaUZ2cGxhRDRNQkxlaythajIvZ3BH?=
 =?utf-8?B?aUVvUFFrZ1l0dFlETWdnMW9qdzFIOHp2TW9GRjF2ZDdFbVRPakw4SW5FQU4y?=
 =?utf-8?B?K3RSZlBFaXFmK3lPbENHVjhaYVJycGFGUG83dC9vcE1qZzd3YTN6ZlVFemFo?=
 =?utf-8?B?NUZ5akNxOTZqTDZQRXJBWm8vMXdjU0pzS1UvbDN0SGY3UUNYUjBsakJFOEEr?=
 =?utf-8?B?dnM5d21Ba1pRYkRyamY4NEVsYnRwcTR2QUg0YThlUjBVS1V1eUZVVmtMT1Ez?=
 =?utf-8?B?NlhVaWtGNnIxWHpIZkhkVVJkQXZQeE05VmxlYjJpajlEaEROcGdsdkJ6SW9G?=
 =?utf-8?Q?TqRKV49t8XI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1AvQjVETG53dlB2TVBuLzZOdlFVOVpvcURTVUExR2pKNTdhZDVHblUxS24w?=
 =?utf-8?B?YVZSQjMrZ0pVZm5VY29EOWlwNjdtUFZnMFI5cjY1ai9rSjdwSFppNlFOdWs2?=
 =?utf-8?B?Q2Q2RStxMUQ0clY0U1JEK2dIWmpTRUJjenlWdXUvcTgvMmdLd2FQcDJObVdw?=
 =?utf-8?B?aEVrSlk5VVFJcTZIZXN1SksyaHAvSi9VRWJsL0NHMnBYSkRwcW4ySnF0ZG03?=
 =?utf-8?B?S2lDaDd6OUNwYWZwZUxINDgzNVRTQVUvbGk0d3NEdTcxdlorVUFFZUZha2ta?=
 =?utf-8?B?eVAzOTNTY0FRSzg5QVBuMXRKamo3NGtSZks1QXMvM1BHL2tMeWswcnZRUnov?=
 =?utf-8?B?bUdKVDlRZnVDMklnVWNRSE5QL3g4TC9WSVNEcDRPcS96UUxsQnRqN2RzYzEv?=
 =?utf-8?B?MU9SNU1vc0pKcFYvT0lCTTM3b2VqTU9ucWNYRHNMNFpFeHNaY2YxbmpkS1U4?=
 =?utf-8?B?R3NtcTRNcm5RMDZUTG5mcUFQOVh2eGhHN2Nvbm5QSFFNMTJIck5kMldKVVpD?=
 =?utf-8?B?Vi9hYXR0enBYRlE2VXh5OWZEUytZeEc3dkQwTC9vODcxd0pBSmJ2UXlUc3My?=
 =?utf-8?B?aGh6QjhDQk1sOHVwUmFFeVg4RHNKTFBzTDBHbEx2UEdXRjE5VEdhZm5DTFU5?=
 =?utf-8?B?b0RwVHJ6Rm1mRlVBU1R4aFA5Qngvcm5sMHREcHVTV0xaM3NrYlJqOHBkeWhQ?=
 =?utf-8?B?blNOcWkvdXpkdWdsUmp1V3FVYUF1Ny96KzJacm1Lb2lEWUV5Nk1HMDE4ZUpT?=
 =?utf-8?B?OEwvL0Q0WU9NbHkvcS9PemYvejNrYVh1SEtlbWcvS3diWkJBQ1dZdXVaNEYx?=
 =?utf-8?B?NkxUYVVVSkFhbG9veHhRWERBbi81T1VKeXZZbmwvZ2xxOW4wWXNieVlleEds?=
 =?utf-8?B?dHJwUitTMnorZDJQMnh6Qjd5M3M1TmtSWVdIaWt5UnlQcmJqOGYxbGhrbjRi?=
 =?utf-8?B?V0VISW95bWtuTGtBdHl4T2x5YmtreEY1TWxuTEZ4eExZb0kyQ1BFVjBtWU52?=
 =?utf-8?B?RkFiakRDRHVvWXh3eEo3NzlXTXZadWF3ZFdDdFlaUlN0T1U4NFo5ckZKS0tE?=
 =?utf-8?B?L0duaEo1QzYvSlUxeXBLWFVBL3FGazgyZEFCNEJkaTFMT09xaFkwYXNYSmJz?=
 =?utf-8?B?bkc3eXRXNUlWVlMwaEVEMU93cUNpWU9wZE43eFhRWWYxRVB0U1dZRCt5U1Ro?=
 =?utf-8?B?NXV6M0dYeWp2a0hrMXNyUW54NWc3aFRCL2dtYmZDSnMyVmhPQUVtZ3VSdXlV?=
 =?utf-8?B?UlJwUm5neUNiWFB3UTczWGg2Z0IxUFpjcC9PWDRNcDhhL1hSbEx0Z2M4RjlT?=
 =?utf-8?B?NUVWT2F1ZHdJc0tNYStQUUFFTW1zdkFkSUZTb3luT0pjYzEvdk5wd1A5TnpM?=
 =?utf-8?B?SnVyeHlXN2NVVW5kaHdscDBNeVdzQlpVNHEwTFN0SGNISHlXVGwxM1N3K28r?=
 =?utf-8?B?RXpEYVlOb3NQUm1rSkpvT29LVTFuL1lwZ2FLSXFsdFUxeEF0d2paQXk0Q3hZ?=
 =?utf-8?B?alczRGw5VzY4SGE2aXgyQ3AxTEh1TFpaUkZZSTc0cHdxVm5LQlM3TS9qVXRw?=
 =?utf-8?B?SHA3bGxtWEwzMFRRUDVZUU1QRlNYaUVPYU4wSTJpUWdYVmdEdXl3eU5zdi80?=
 =?utf-8?B?SlF4R2tQNU5qSE5EblNLY2JXMDl6SVZBcEpzNnYrcVVlNW96Y3BjTEc4QlFp?=
 =?utf-8?B?VEhTd1RlL3cvRmhINDA0aWpVV2pWVm1GVHdNL1RSUFRhSjBZdjRPUmtQck1W?=
 =?utf-8?B?ZWE3bnZ5TVJ5eFRFN0tPQWhEb2dTM25qVUZHZXZONVk1NnFVQWFaNWdEU1My?=
 =?utf-8?B?RS8xY1dESEVwVDNEcDBZejc5VnVhODZyRWxtQjJOUjhlWko4QnN0alBzU25t?=
 =?utf-8?B?Nmx6NEFUZEFFTTFEQ2xLbGlCU2FaMzBnaUppQTFaUHNvcTZtM1MwQzZ1M0hJ?=
 =?utf-8?B?ZktBT2Ixd2IzRTFRRk1tODRFbGk5NStHSWpzV0wxMC8rNzJDMVpqQnhCcFVj?=
 =?utf-8?B?WWpxdEg3TUo3OVlFYU04M1BGMWJqNG5IRVlsem5LQVRtWU5EcjVJRkN0NmxR?=
 =?utf-8?B?SXYxS0dPeWZCVnhJUEZLT2xpR1VTdk1tRllhYm01THc0UmpYUjNFOEhTTnVt?=
 =?utf-8?Q?zWPl0lnGStHE28VmPCOVttWcH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f7d7fb-045b-4557-6385-08ddb7bd7f45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:04:27.0468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZJoXYh9UVy+12WN5J0L+5gipYuJ8b3jsORXO9VhxuI4j0nivEz5mfqCDFePYzhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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
> This uses the newly introduced per-node gpu tracking stats,
> to track GPU memory allocated via TTM and reclaimable memory in
> the TTM page pools.
> 
> These stats will be useful later for system information and
> later when mem cgroups are integrated.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> v2: add reclaim parameters and adjust the right counters.
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 34 ++++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index baf27c70a419..11a5777b4a85 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -131,6 +131,16 @@ static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
>  static DECLARE_RWSEM(pool_shrink_rwsem);
>  
> +/* helper to get a current valid node id from a pool */
> +static int ttm_pool_nid(struct ttm_pool *pool) {
> +	int nid = NUMA_NO_NODE;
> +	if (pool)
> +		nid = pool->nid;
> +	if (nid == NUMA_NO_NODE)
> +		nid = numa_node_id();

That isn't correct.

The NUMA node in the pool is just a hint where to allocate from, but the memory can come from somewhere else as well.

You need to look at the allocated page to figure out to which NUMA node that belongs.

Regards,
Christian.

> +	return nid;
> +}
> +
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  					unsigned int order)
> @@ -150,8 +160,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  	if (!pool->use_dma_alloc) {
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
> -		if (p)
> +		if (p) {
>  			p->private = order;
> +			mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)), NR_GPU_ACTIVE, (1 << order));
> +		}
>  		return p;
>  	}
>  
> @@ -186,7 +198,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  
>  /* Reset the caching and pages of size 1 << order */
>  static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
> -			       unsigned int order, struct page *p)
> +			       unsigned int order, struct page *p, bool reclaim)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>  	struct ttm_pool_dma *dma;
> @@ -201,6 +213,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> +		mod_node_page_state(NODE_DATA(ttm_pool_nid(pool)),
> +				    reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> +				    -(1 << order));
>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -276,6 +291,7 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
>  static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  {
>  	unsigned int i, num_pages = 1 << pt->order;
> +	int nid = ttm_pool_nid(pt->pool);
>  
>  	for (i = 0; i < num_pages; ++i) {
>  		if (PageHighMem(p))
> @@ -288,17 +304,23 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  	list_add(&p->lru, &pt->pages);
>  	spin_unlock(&pt->lock);
>  	atomic_long_add(1 << pt->order, &allocated_pages);
> +
> +	mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -num_pages);
> +	mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, num_pages);
>  }
>  
>  /* Take pages from a specific pool_type, return NULL when nothing available */
>  static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
>  {
>  	struct page *p;
> +	int nid = ttm_pool_nid(pt->pool);
>  
>  	spin_lock(&pt->lock);
>  	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
>  	if (p) {
>  		atomic_long_sub(1 << pt->order, &allocated_pages);
> +		mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order));
> +		mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order));
>  		list_del(&p->lru);
>  	}
>  	spin_unlock(&pt->lock);
> @@ -331,7 +353,7 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>  	spin_unlock(&shrinker_lock);
>  
>  	while ((p = ttm_pool_type_take(pt)))
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
>  }
>  
>  /* Return the pool_type to use for the given caching and order */
> @@ -383,7 +405,7 @@ static unsigned int ttm_pool_shrink(void)
>  
>  	p = ttm_pool_type_take(pt);
>  	if (p) {
> -		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p, true);
>  		num_pages = 1 << pt->order;
>  	} else {
>  		num_pages = 0;
> @@ -475,7 +497,7 @@ static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool *pool, struct page *page,
>  	if (pt)
>  		ttm_pool_type_give(pt, page);
>  	else
> -		ttm_pool_free_page(pool, caching, order, page);
> +		ttm_pool_free_page(pool, caching, order, page, false);
>  
>  	return nr;
>  }
> @@ -780,7 +802,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	return 0;
>  
>  error_free_page:
> -	ttm_pool_free_page(pool, page_caching, order, p);
> +	ttm_pool_free_page(pool, page_caching, order, p, false);
>  
>  error_free_all:
>  	if (tt->restore)

