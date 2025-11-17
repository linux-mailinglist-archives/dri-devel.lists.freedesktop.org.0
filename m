Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73609C62EFD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C204910E2FC;
	Mon, 17 Nov 2025 08:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F2hVW/pT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197D510E2F9;
 Mon, 17 Nov 2025 08:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlZz2bo/qfwbpkL3i6zxeWQ3pulEASkRZUOn6qbBH4mnLhVBBbeenO0mG3dCUUs0PnnSv2rMfnERSjTxp4PcvPPUBfVytIskdPfODWpEJZQvpB5BMG/bUBKgmaaB1fPADkL2UYtYkRIXB10QL8qSHA51hxk3bVvc2FiAxF4NHiD8PoGlW8Y7XSAEag16VJkrkSHuB12eIGT/Lfbhmki2Q8IsP4aNbGSfL/6YHWkjBjgyosYd2Zj7IWnI3nLbwLoIiy2wuKs/Cve70zY3TPXS5rX595AeGjBHJuI1qomlYkSY7c1GcWNNfMkBvzkTxBqwvMWuwTXmM/pzIkX/kRxjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQVY7xq4w9hmaf+Jjqk6EbjjZcFx6HrlSXVgZaMVBp0=;
 b=MqRDEWllFRjEcbEp3NbIWIOOxDOxJ6BpR0xP62H8fKJ1lUiyoAjT0TjU3oqPjswt2hhWydwHiVQqoYKz+Mbxzn1mdosBA5zd/mj2tjzURIw+/ML18qln1+GVW4FDGWk54VWQlDUcYhnR6AkIfCuoqug8Pk1Qwi2ZIlTrjGZwuObQY2vf9PGleO8AO5cElLhWJ0y29+Vq7T65MXuaCYXw6WCLeH/lwPTUr5HkFLDXQL8ECfv3q9h39ByUf3RwbUv9L/pmKe40EVIvWcP+uyPYtrhosrYkZOBZys4OxbHpATecbbIwtde2l5nKdJRuugxPQ4K1ymZ/FIhbUmdh0BcLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQVY7xq4w9hmaf+Jjqk6EbjjZcFx6HrlSXVgZaMVBp0=;
 b=F2hVW/pTgn7TtjGV1ppchFvzc2qX5TFxALGJ+0+utt8yqGe6H94bPb/siVejMlQNGPQcdBf7KNMGp187RWiK4jNP12QsC4ZVTG0WnJKAj+A4TrhC7aXKheqRdMrhdUFBFELE+wHtMYEiPlC8EXwyM9KFC7fvx5ed1dPygeau9Nc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 08:43:33 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 08:43:33 +0000
Message-ID: <fdb6f760-a823-4c3e-b784-9f872e69b7e9@amd.com>
Date: Mon, 17 Nov 2025 09:43:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] drm/amdgpu: pass optional dependency to
 amdgpu_fill_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-10-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-10-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:408:ff::9) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a4ac4e-05cb-4b85-eab2-08de25b56425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3RhYkVmVmZHTnZiYTNsU25vYkJOQlY1ZEt4M3AwY21pZW1DTW1zWjIwczU0?=
 =?utf-8?B?cUxwTFhVTUx4UzZibzJuMnNzV3NKVXFZSmJHajVOUDdnUWplQlF1T2hYck9V?=
 =?utf-8?B?L1Y2TEg0bEVmbnM4TzEyeFZxTTBPTlNMTFJlOUdBZ2REQ3BnUENBYVg1ZURW?=
 =?utf-8?B?Zm02S1orNVQ0WU1FUzFhWFpXSVlLaXVkSUxoU2tmZUdVb2xLbUErUzNCNTRI?=
 =?utf-8?B?ejE3YVFxOVY4RHJyajdhWTlWSVBOL21aU3FHdlBSVFpuTGRUU1FWNDkxTG9C?=
 =?utf-8?B?TXVBUWswUUVwWFBLK01SdU5wdjVxcUpyTW01Zldjb2lTSzg2M0hXdVlwYVVq?=
 =?utf-8?B?T3dFQTNhcTFjV3haRXVRaEJFb21HWmgvaXhlWHlCaXVodWY4YnN2WFd6Vk9a?=
 =?utf-8?B?Znc3UXRSdTVVOEVSTHByTEhWQjJmalRCRGk1WmdYUFYyZW9veWxFR3RnZTg1?=
 =?utf-8?B?d2tEZFU5TjgvbE9ISStsalpNVkhKOGJUaGpja0ptdEJXdkpuc09tOUI5eXJx?=
 =?utf-8?B?V0NHNkJubmtoYmJKandPeXkwcU8wTndSdE1qdTF1bDF3T1RkZE8rYlV4bVJQ?=
 =?utf-8?B?YURtdkhESzhYUGlneVNZVFV0STJucFFTcnRFMXhkUFVXdXM2b2diR3R3d25n?=
 =?utf-8?B?dUVkNHFRYlpBWDMreHhlNDhkd1RqeXRuUUlibGwwYTBQYldaTnlGeFhBQXBn?=
 =?utf-8?B?MVVaT2hRV2dWZDR6K3JYUkRZb3BvZTBhQXhKTjBpUEg3R2RIeVZMTkFESVpR?=
 =?utf-8?B?WlFkQW1mWUFuYmQ1OWFZQ3hsNXgydkhRY0h3djZvdEIyUGRPeUs1elZScHA0?=
 =?utf-8?B?WHNlUm9nRnJLYmJDOG51ZjB4RkovcHJGYnlEazhRSExYa0lzRkNlRDZKem1w?=
 =?utf-8?B?Z2Nmc3JGZFVRd3h1QTJxVTQwSkxtQTFPcjc5cXJXb1YzdnN0Ry9mSGRoWUxK?=
 =?utf-8?B?Yk1mMEZqTndTUmhPcGJ5UkFwYzRLUmF1clhSNEU4cnNhV2ZDaDUzZzZHZy9m?=
 =?utf-8?B?b2dUNzYxK2xDaTBjeEZYd3hrcllTOWxRUCtWNllvdUVxTE9KUWlCSCs4ME5E?=
 =?utf-8?B?QndLTk9xSU44TFdNUmNaazdLU21MTHJraWVWVHRDUWZoU2VKaXA4aFYrbWVI?=
 =?utf-8?B?VndrUmxvT2UzeWt3R0VRSmJFK0ROLzVyRVprbmdEaGw0M2paZzAwd0sxTGk5?=
 =?utf-8?B?OUVCeFVrcHYzb1VZTW1BazRFNTFsa09LMGJJTS8vRnFqN0pDOUM1UlZuSUta?=
 =?utf-8?B?aVN3VDZwUVZ0WWZxWWdzMzdYNHBEdVBWRjdFK2g4RjkxWVhZSDVxd0psa0Z0?=
 =?utf-8?B?bHAxL3VIQktGUjl0V01nbERKVXd3Y05sSjk5QllGL3JLTkt0Y0ozMXpsRVdp?=
 =?utf-8?B?WHV6ME1oQjhUNHJPZFVTeTMyU2dsNUJBb1c4N3AxWkhvaG94c3ZUYU95bThP?=
 =?utf-8?B?T1dOYUU0cDZQV3VXM0xiZHBYLzh3UmNqaUFPTThiOXpRd1hpVzhST2p6QWZC?=
 =?utf-8?B?TWVYQjhqZlI5K0VqME95QlFpeDU1NlNpZG1kWXpsWkp2d0d3aDc5QjNua2Vx?=
 =?utf-8?B?bGxqNU9WdGJaaTkwZ1IxTTFBS2FsT0JwMmNqNGpPZktFZld5WTUvTzJ3Mi9j?=
 =?utf-8?B?Mjh4WEtpRnpuMjVZdnkvbi9aM3laMDNRK2xVUXQ1TTQ3ZUg4K2x5TFk3K3VH?=
 =?utf-8?B?aXkrT0txcXJmVlNYZnBBRFJtU3B0Y1k3TTVpSHZRUmxqRkkvR3Z1cWdOM1I1?=
 =?utf-8?B?TUdvNnE5cVY3VmlTalNYUXRDUEhwWXJ5RGorQVRZa0lvYU5jMjMrMUgxTlZn?=
 =?utf-8?B?OXF1TDlqamJPaTVldkE0RDNCazVSbnpuSk5PcFlaaXR4MlpjZzh6QlRnRFdQ?=
 =?utf-8?B?THRFRGVySG5hd29XUnNML0oyRGxlQ2VmcnBiZkFpaXMwN01VcmRxUE8zZEhD?=
 =?utf-8?Q?xDlvFAa8rlkWywXMBRusbTitdRqagKk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjBwYm5BVlZWQkhobER2M0tudW1saTNwanRDYUQ5VDFwcUR4QlBMSS95RWNs?=
 =?utf-8?B?cHZjTitZRFYyOE1PYW8xdEZHMlpDREkxY3NCR2xaZWlNSWcraWhDYlpVRmpP?=
 =?utf-8?B?blhvMkxDaHc2VHg5WnVYRVBxSjVzeVArODMraGlreEZjYnZrZml5bklKSFZC?=
 =?utf-8?B?SGlQWVZwMWRYQ0RyallnL1d0bWRKbHVPZ1hmb1dJWkswR1dMY3JpWFhIWEY1?=
 =?utf-8?B?Qm15dzBtZkE0Z1JpQklZN2pKVW9IeGVXWlU1QXczV3RNREZ1NGJRWEd0c2Jl?=
 =?utf-8?B?TGo5cXZaNGU2T05PWkZJMmFFTEQ3UUJGZlF6bGFwTmR2ZHlJQ3pzL243Q21r?=
 =?utf-8?B?Sk9HR2pOZmhPM3hObU94TTlCTnJUZWx3cjhzYlpQWk9MamdRbnE4UUF6blNB?=
 =?utf-8?B?UDllWHJlODd0cVlWeFZiZmQ4YllkV2ZLRjFsS1c5dHk0TjVkcjlCNWZ1UlhG?=
 =?utf-8?B?bXF0anJkVS9rNythZjluNDAzdno0TzR4SHcyVHVQeUJpR1lXMTFnRDJ0T0RO?=
 =?utf-8?B?VGFobytSTXlVSGRKNGJDcXRJTWVxM0p6MUczVktZTEtqQ2daOEkvbi9SRUU2?=
 =?utf-8?B?cGRzYld6WjVIaldsM2lqQTNYMFJDQmN5SC91cVlKcFozaWVJMWE4UU5tcks1?=
 =?utf-8?B?NUt0MXdOR1hFMURFTVR5Ly8zWFBESlhaaHUzSThUbjExaVhNWi9sZXBEbU1s?=
 =?utf-8?B?NGNFZEVWL3pKaWZPSEdqclNjR2tmZWxjM3U2RDVLUDF1RkJJNTZ3MUdDK1Nw?=
 =?utf-8?B?c3dESVpmOEhacWl0VlJxMUZ6ZHFWOHhUR3BzSG9WS3owaHozSGg4WnlQOHFS?=
 =?utf-8?B?dWJ1aGNNUldvY0hYWmRuSFU2cDhrR3pPQWhPL1BpR1J5a3JtWHJ3WnB4cWIz?=
 =?utf-8?B?V1NXNkw5aUJQVUlZcjNjTmRlKzFwUlF3L1lhMEhtcmhtVEpVZTJVWTcySkZE?=
 =?utf-8?B?b2xJNDlLVlVIdjQwNXFLSmRzSFRuTGU5eXhRUExPelhQZlFHdEIzTUFhaS9Y?=
 =?utf-8?B?NkVwbi9SaDhrK0J6d24zTzlOVlg5ZjZ4QXFUd01PYWJLMHRNSVZXRW9rUnR6?=
 =?utf-8?B?dWg0OEdXK25qWDM4YmY3VUd2L2tOcnA3eEpOMVl3ZldEeXVBbWxXSGdKN1lz?=
 =?utf-8?B?RCtWV1VRSUxJckNEbW1VQkxjcTRucEhVNzVtRG5wRFZqOHlUU1JkbWoweVd2?=
 =?utf-8?B?WlpWK0dmQjZwSVlzRk44VXlxWDg5WE5FclBmWkRPdW9kOERyY00wUTBDREdw?=
 =?utf-8?B?dStZZFZIeDU5d3RXai9RUFB5eUUveTl5ME5XSnVZeWlmTE5RQkVJRFNpOTY5?=
 =?utf-8?B?UWtFSFl4VERkblZTdm5MM1RFSVFpc2cwT1JQKzdoVkFPU1FwYVZML0NMY0t6?=
 =?utf-8?B?R3dYK2hnZlljb1dmUXp4MCs1N1Rya2VYejNaaHNPUWo1UWVHQTQ1YXdrWnha?=
 =?utf-8?B?UzNJekdUaUc4elRUQVRtU2dTdXl5QmJXUXRRWGY4bzhIM2ZyOHVjL0JMaUQv?=
 =?utf-8?B?eGtUZDNKWEIrSnFNOE9Qa0Z5ZHA0czFvNDl3MUNmOFF1UlV6ZUVEU1BlNmlv?=
 =?utf-8?B?ZDZOSGZJQjUzeGlUYmpmaGVRbWxCZktpRENDYjNyQVdtN3NwQ2cxR1QrZldF?=
 =?utf-8?B?eHRyUkpJSW5SUXM5alVHb0U2V2gvQUNPcERQV2xpdjVTUzd6Sjg4c1VpZFBx?=
 =?utf-8?B?T25STkNMMVo4bUNMSnUxWm1TZXJFb25ubDg1VWUwNzVjdyt4dStjNG9JUkJI?=
 =?utf-8?B?c0w5Yzlvajc3QlpCZnJzbXpzWWgraWhuVlFxR2o0MWVjVkdzQk5oOHFhZUZy?=
 =?utf-8?B?UHk4RWtiU3MxNmQxaDBvMzU2TUhncWQ3QjAxQ2RzaUU2YjByd1MvL2NCeG1l?=
 =?utf-8?B?bTRxOWVFY3pkem05a3J0RmkwYjg4RU5RY3o3dWhKY0ZycGFaQVh0RGg2MXU0?=
 =?utf-8?B?ZVN2YkdBOGk5eXlBQ0hPa0p1OHMzam9NNWl4RDgxRkoyVi9VODhUQjlmeWpH?=
 =?utf-8?B?Mm1DVllkV25RMUFDdnZDRklzNGwxVTJaNjFuRFpRQzRGMDQzZnJPbjU2aGhP?=
 =?utf-8?B?ZE1tRWRiSVlaN3lRSWZVdnAwK3c4Z00yTFNSTUNEWmlrVVVMM0JaSFZUbEh1?=
 =?utf-8?Q?NHC9B87PQoLqfZrROj5P+JNos?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a4ac4e-05cb-4b85-eab2-08de25b56425
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:43:33.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtLb7IxLLKEsy5wH+W6hqO04aNdZSIXJaA0Qx9iHNq1ZcM5qRKpBQbBLgXcUDo70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> In case the fill job depends on a previous fence, the caller can
> now pass it to make sure the ordering of the jobs is correct.

I don't think you need that patch any more.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 22 ++++++++++++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index e7b2cae031b3..be3532134e46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1322,7 +1322,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  		goto out;
>  
>  	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
> -			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e1f0567fd2d5..b13f0993dbf1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -173,6 +173,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   * @tmz: if we should setup a TMZ enabled mapping
>   * @size: in number of bytes to map, out number of bytes mapped
>   * @addr: resulting address inside the MC address space
> + * @dep: optional dependency
>   *
>   * Setup one of the GART windows to access a specific piece of memory or return
>   * the physical address for local memory.
> @@ -182,7 +183,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>  				 struct ttm_resource *mem,
>  				 struct amdgpu_res_cursor *mm_cur,
>  				 unsigned int window, struct amdgpu_ring *ring,
> -				 bool tmz, uint64_t *size, uint64_t *addr)
> +				 bool tmz, uint64_t *size, uint64_t *addr,
> +				 struct dma_fence *dep)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned int offset, num_pages, num_dw, num_bytes;
> @@ -234,6 +236,9 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>  	if (r)
>  		return r;
>  
> +	if (dep)
> +		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
> +
>  	src_addr = num_dw * 4;
>  	src_addr += job->ibs[0].gpu_addr;
>  
> @@ -326,13 +331,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		/* Map src to window 0 and dst to window 1. */
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  src->bo, src->mem, &src_mm,
> -					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
> +					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
> +					  NULL);
>  		if (r)
>  			goto error;
>  
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  dst->bo, dst->mem, &dst_mm,
> -					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
> +					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
> +					  NULL);
>  		if (r)
>  			goto error;
>  
> @@ -415,7 +422,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		struct dma_fence *wipe_fence = NULL;
>  
>  		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
> -				       abo, 0, NULL, &wipe_fence,
> +				       abo, 0, NULL, &wipe_fence, fence,
>  				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
> @@ -2443,7 +2450,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &cursor,
> -					  entity->gart_window_id1, ring, false, &size, &addr);
> +					  entity->gart_window_id1, ring, false, &size, &addr,
> +					  NULL);
>  		if (r)
>  			goto err;
>  
> @@ -2469,6 +2477,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **f,
> +		       struct dma_fence *dependency,
>  		       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> @@ -2496,7 +2505,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &dst,
>  					  entity->gart_window_id1, ring, false,
> -					  &cur_size, &to);
> +					  &cur_size, &to,
> +					  dependency);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 9d4891e86675..e8f8165f5bcf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -186,6 +186,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **f,
> +		       struct dma_fence *dependency,
>  		       u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);

