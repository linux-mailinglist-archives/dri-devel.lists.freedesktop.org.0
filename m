Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE907AC0B16
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EEA10EB92;
	Thu, 22 May 2025 12:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cVyLveeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1749E10EA2D;
 Thu, 22 May 2025 12:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBWcXReSGxokMawDNRJ7RvcOFqK/6nOB0f3Ub86/cTK65+n9pcdfzb8ifvhbmvvId1i7NhLdRRzi3JWeJYxwaZ8KaOYv7VenHuM4r6LiG3H8OGzLypILR4HD3FlnOQna9TZCwVfWw5Ke/Q/ie9SJKxqs0Dw1K13YhY1DBGd0pv05X5EAbe6cNjYF2nkAFlMUsRZkPEUtWBw2l539OIOVaSsonwOMtXKmu4aGdN1wgPgw+JDQHCQTlJBHO4nYD4p5gRStoLAWx7y2ZpSHaJdfwZYiQERIwAJqgkxd0QIOxUDD2cS5TRmXXnYEYvD7EErKAcM+2+TC+ArYXyr218vU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vw8V+WllNfpKnQS8hsDnauAE2OG/zRh+5luxeOQuvs=;
 b=EFVclOHAemm8Q/MCnphOxd4YqdSJDZB1yTNXQpV77pKyea+8oqC58IDu2H0yOGYqclkOTmew8xEyeH0sijIzkB8IaddvZjFyVfw0PlOMQ0TYm7QCODyr7zRP63bjXmwYH/ygwD1fBCag2RJqNryn+37lL01n0QqoltI1aedjLip6bNqb6IfgT6fHHrRJ8FtLBimLjzegAim9beHYNxofb0OnLKV59a4QhmuJdoSz+bbSWxiCngeZJZ8oi1n4cLbFq+C2p6BEJCg4wsm9Wlit3oESc8QEDxK1yZbvfpOndPq3nmT/VsYc109lxBUqUCdHVPM2Mj4fRuJajOo4Yz3DFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vw8V+WllNfpKnQS8hsDnauAE2OG/zRh+5luxeOQuvs=;
 b=cVyLveebGP/hAwOXNOXpKrdJwuqvuLMJaIYanYOT/WBs8T9Sp7Uvy3nZppMWGclFND5VDFqZuUO+elS9/tssqazcXFpdJfT8x/uhEuNPdTfqsyE5FzJ17H6hHhRaZ2HoKvuFHasyCgt+bFndZHBLynF4U50Ho4+bB896mSbzpS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 12:06:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 12:06:11 +0000
Message-ID: <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
Date: Thu, 22 May 2025 14:06:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250522112540.161411-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0064.prod.exchangelabs.com (2603:10b6:208:23f::33)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dff931e-5302-4ea6-bf82-08dd99290ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXdkeUgrV2pGdWNmY2x4cXZTTGVuTlhoK0lITTBCVGhmL2d2K0RoN1BJUHFs?=
 =?utf-8?B?T2ZRRndlM3U5blpmYjZocThXSGo0VWZINkJ6bjVJVzFqNWM0RW1JSUt3aXBo?=
 =?utf-8?B?R2M4WEs5UFpTUGgwTmJiU2lXYUpFWHJKT3lneU9YYkdaWU1BVG9VU2UxNnIx?=
 =?utf-8?B?Ymh5SStHclNLOHloRWQyaUphUnpVVjZDaW5xRjdzRnduRmZFdlhjQmNsaGpk?=
 =?utf-8?B?ek5jcUNSZFNBUEk0UU9td0tsQTFOblN6WjF3RndEWHkrdkNMYzBRV2lCTXZa?=
 =?utf-8?B?ck1nSllYVzN3RHBXZEpXeHNqTFNLOUljNy9GQVpFQ1VWaHIxTWQxeWdlWVo4?=
 =?utf-8?B?SUU2Umt3ekVQaE45b2k4ZzU4NVhYTUF6ZW5mQ2xKajNIQkJ5bkovaG91Lyta?=
 =?utf-8?B?SzlYU2Q0NGtxMmczUU8waFhHVFVMRXFnN3paQ3NqY3RVVWI2UlVzdWUyWk84?=
 =?utf-8?B?OVJiam9zbVJrYlJ2OFlYRG80dkxKNmpkNXRkSTR6SEtYU3ZZc2hvbEFDMjBt?=
 =?utf-8?B?RzhHWjBOZzByek9VM3I3OGVZdm5jeHA2NUpIR0RYbnJ6cGpVbWRvV1czQ3R1?=
 =?utf-8?B?QUMyYm5HTGNOMi9tejk0UG44cE1KaWN3RlFiWGtqY25BZW4vSWhoMEN0U1hO?=
 =?utf-8?B?M25BOXAvSURreGJFbzV0N00vL3lSV0JkY0ZtZUU4U3dLNmRKeXk1WElaYmF6?=
 =?utf-8?B?SHIyRlI2TFBSUWJwMEhSS0U3anRlblNVaGZwOTdRNnl6RHdTY2pUdklGMnVy?=
 =?utf-8?B?c3FXK1VrcDdwUnRwTklOR0d1Vmt0dUdhZXhzYzBnaGtUSEI4b1p4U1Z4VVRB?=
 =?utf-8?B?RXRTWDcvVTBsTFJvR1V6RWdoaWFtYWdCcmlkSmFRQUYxSEMzV1Z5L2Ryd3E2?=
 =?utf-8?B?K0owR05zcVVwY1NtWXZxMFBRWTdKemwzTUVlK203OWtNamtMOCs4QXJnYlVs?=
 =?utf-8?B?TmRndnJVVnpraTFRTExlMEhWamR0RGtYeEJKaTRkZ1hMYmlsMnpKejVDb0gv?=
 =?utf-8?B?ano3L09wSVpsMmhYNmhtR1EvVkJWRDIwM0RMcEFFZyt1ZzlxLy8reXluWHk2?=
 =?utf-8?B?SHRYcURxeU50WmdGN09CeU5HbWtWU0VvT1VqZlRmV0p3NHZnTWlmYm1MdUJF?=
 =?utf-8?B?anpLUVNETUEwTS8zMlBCYkdZVXN5a2Q0d1F5UjdVVUJiMUE5K0ZGeFJVYklW?=
 =?utf-8?B?UmpFMFpBQ2JxaXhqM3FxcjFoRm5VWitzZ2NhMEdJVkZzbUpxYTF1all5OFV6?=
 =?utf-8?B?SmJKaE1MeEIwVTcweEpkVDVrNUpFK0tQZUlwRHJOT0h2SUNFbStydTVWeVNX?=
 =?utf-8?B?cW45dzZ6WEtVOUJFTSs2MEtud2RycWIrazlwR2h3V2VncTkxaSt0S1N0YUZT?=
 =?utf-8?B?dk9MUUJnUGJMN3dxL1Y4QUlNMUdGdDBjSlBTZG1GWWdheGFIUXRXeVV3NXE4?=
 =?utf-8?B?TFplWGU4NmVEcXBEUkkybFdUcEMwVitjUHY2NFZDc2lBK3FGSEFvbFZGT0Ex?=
 =?utf-8?B?aXIwQXNWZ0FnZHB0M0JjREpWRTcrL1NhYmVwb3dkamRQV0I2SVF1VWVtMGV6?=
 =?utf-8?B?eXVrWnE2TjZYeFIzTHF4eGtYcTdsdGluSDRSZkw2cmt6WStIRkpJZlZSbG5o?=
 =?utf-8?B?SmdaVXhCQU1KaWJqZ0NqR0cyNlRWMVQrSEc0RzZEeW1DWFk3b1hFZitrMW92?=
 =?utf-8?B?SVFEcTM4SzFDRDkxTURPamc2ck5EcE51cEVvaVB2bVFGUDd5NFhrZDB6STJq?=
 =?utf-8?B?OGVURnBSdkhwVzVMV1pWemlVRThzVFE1Zk9tWHNSOTRNRDY5RjM1dUFQWmtN?=
 =?utf-8?B?aVZNU3cwaklUVVdDSVc5NFNxczg0YTJ5SEFzWVJsZkptOUtkVDgyRDJZb3Rj?=
 =?utf-8?B?ZU9Calh4aVdqYW5GUjdTVVBqTENRZ2txakFKSVJ2Qmh3OUphVXp6SlhOVXdI?=
 =?utf-8?Q?FWWo/nGrwfQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlvZWQwem0yYVBvOW5EWDBCQUtDeGl3SWJrWlhEKzJoZnJtNVpFRDFGMkJB?=
 =?utf-8?B?QWd5RjZhTDFEQlZ2SXQzdmxqdjdMNHB0TEtJalpqcExLSkR0OWdRZzhNbDZy?=
 =?utf-8?B?NG0rTTFQdXVISlJWb21QZDBOVUtDNlZXU3o3Q3VZQ09hU2pFREp3bDV4eW5T?=
 =?utf-8?B?eDhiV1grNm1YQTlJaTk4ZzBrOEFsUGdCQStWNWJoVkZWYXJjK29oc3htVUov?=
 =?utf-8?B?c1lnTy8rTkdSWWZISDdJV3NzbDZhMmdXTkZXekZlOHJkd0xXbVl4VVBiOUpP?=
 =?utf-8?B?MDI3SW1HZUVYMXIxNEhxVTFHMzdYWnpGVGp5L1lUdDY4M1B6QW85WTRDaVJa?=
 =?utf-8?B?ODdRb05NYk9nbTIxV1Bpb0dBcG9PVFo3MExLQUxVenEyU0RxVzNsWGpMSkZV?=
 =?utf-8?B?TDlTZHhkeTNKN1Z6WnE2N1M2RENTQmpHRTRaR3Bmb1RDNDV1b3JzS2s4bC9a?=
 =?utf-8?B?WUdyV3YrUE9ZeTJtNzFrVmx4SU9FdnFwL2RWdDNSQkJETzB2RHppQTF4Rkoy?=
 =?utf-8?B?NE81U0txdmFWSXFxSEwxeCtLZFliRkgxcEtXNk5ZMEs5eXQ3eVVFODJ6TWU2?=
 =?utf-8?B?dTRrUlJ4V1gwbHdQR2NMTkN5czBpTDVxQVl0TGhnU2Faa05hUVhkRm1pUCt1?=
 =?utf-8?B?NDdTNEtBYm9kNlk1ekEwa0MvaTcvSFMvSWUxZnVqNCtuc1FjbzlHQyszUWZ4?=
 =?utf-8?B?NEY0b3QzNFlDMkJXNklZcWtvbWxkU1hGMXlsY0VnWFdCbG03akhnL0dBNkpO?=
 =?utf-8?B?MEdLWDR5THIxUGptR2YvdjduV243L2pVbFNINGxZMWxjbkFZc3dzUGN3MHVa?=
 =?utf-8?B?VWMyaitHY1M1ZzBCK2ZXY3M4c3kxZm9mYzlQZlJ0UTkwMFIrOHRWTjdMb2RF?=
 =?utf-8?B?S0RvL0NmdHJVeTRBQ2I5OTI4VTZ2NHpRbGtraTY0b2FiVEdyYTZMaUE5UmpJ?=
 =?utf-8?B?bEhTNlFPQzhnLzZmQmorN2tBbGRoRFdzS1NMNG9BS1YxbmNjd2NFdDJJNFFC?=
 =?utf-8?B?Rk5uc2lVVktFWm9iMWhwTWxSSXF1bWtSTjM1LzM3Ym05NTgyQTM4Yzh2RThZ?=
 =?utf-8?B?MkxPYmp6SnF0a2ZDckdVZk94VDZEMjF6cnQ2eStzUGtza2pnUzRIUTluWHNU?=
 =?utf-8?B?anhaTXRuZERMSWdvOGZPZHZoWVdhYXNRNjBRTzRtQW5nZk10ZzQxMUw4RmtZ?=
 =?utf-8?B?VDByRHJYVUpDRFlsUFdJVkNNVW16czMxQTFQY2hTVHFCb2VLTHpoOUdST21Y?=
 =?utf-8?B?MGE2ZStnY1d1R3BydFdBSlIvSHdTNGNKeFpoSWhUaU1vUkIxdVZKU2Y1UEdB?=
 =?utf-8?B?ZU9BWi9nY0lZenZvdlpkenB6TkdkSWZWNEpaQ0hHVU5oRUZhZWs1VDhNaytM?=
 =?utf-8?B?YTh1djJ5NlIvSGVaeFQ5SHVUbVlQUVJJY2J5WUhPYW5yc3lKTit3N0dBQ3h3?=
 =?utf-8?B?czhHUU1qNXdlYzc4a1M5b0FxMWszUGRkemdJRGk3WmZQTm5nTytJNXpZWk1s?=
 =?utf-8?B?anJ0cXZUcXRiLzI1NEJWUVBmb3ozNUQrVVRhSXQ5V3A0UkdGbkpGYVV1UFZu?=
 =?utf-8?B?bmVreFg1SVc5NlA1OWFoNjdQMkdHVjRxQVBmbVJiMk1IblZsaWZ6bTVVQ0VJ?=
 =?utf-8?B?TnlxQ1VoODEzeFI1MmwydlI1MEZwa1B0clFONXNNWGFaM3dCcFBoUTlueUZE?=
 =?utf-8?B?RElNeHpXYVlwN1BvWDNUMHRIOXQzRldNeElmc1VOQ21UWldKbnZqS2x0ek9o?=
 =?utf-8?B?WFkrWE0xTmpoZ1BwYjhEZzkzN1d4VkhJSlYydHo3dXpLcjZZVEp5OU5nL3Bl?=
 =?utf-8?B?NG5SL2ZPZjNHUzk0b2ltNnVmUkpKaVAwdVAyUjJNU0ZXTmJhRjZsK0FxTHho?=
 =?utf-8?B?T2plRURsNUZ2aDYva3VOUEpnU2RzRGp2SzZEd2VYNnhLenF4NlVpeEhraWZQ?=
 =?utf-8?B?ZHlYRmJQWVYxMmM2c3lncmpCYmV6WHVXbDRMNUdCNThQak9kcktXTFl3RWlI?=
 =?utf-8?B?bDRZTUtpc0FXUlFtM2pqUXJ0bVI3RDVMMWhMT3JGb1hWWlJrZU55cnN1YkZ0?=
 =?utf-8?B?M3BVMjRka0NRaDZsbXF4RlhhbnlRdTl2NjNSU0Mwci95eDFkUGtJUFhLKzk2?=
 =?utf-8?Q?wHeMJR+dYZsD2IJGfaUYRWGJE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dff931e-5302-4ea6-bf82-08dd99290ab4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:06:11.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ww+B8l58g3elfrEY309oh2HcnKIsYbEZpMK3SzGMw3A+CUssQ8nxaWiuyIDBHYXh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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

On 5/22/25 13:25, Philipp Stanner wrote:
> dma_fence_is_signaled_locked(), which is used in
> nouveau_fence_context_kill(), can signal fences below the surface
> through a callback.
> 
> There is neither need for nor use in doing that when killing a fence
> context.
> 
> Replace dma_fence_is_signaled_locked() with __dma_fence_is_signaled(), a
> function which only checks, never signals.

That is not a good approach.

Having the __dma_fence_is_signaled() means that other would be allowed to call it as well.

But nouveau can do that here only because it knows that the fence was issued by nouveau.

What nouveau can to is to test the signaled flag directly, but that's what you try to avoid as well.

Regards,
Christian.

> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index d5654e26d5bc..993b3dcb5db0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>  
>  	spin_lock_irqsave(&fctx->lock, flags);
>  	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
> -		if (error && !dma_fence_is_signaled_locked(&fence->base))
> +		if (error && !__dma_fence_is_signaled(&fence->base))
>  			dma_fence_set_error(&fence->base, error);
>  
>  		if (nouveau_fence_signal(fence))

