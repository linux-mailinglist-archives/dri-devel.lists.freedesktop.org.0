Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBEAB3B53A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EEE10EB69;
	Fri, 29 Aug 2025 08:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y6RA5fsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C7510EB69
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR1KRlwM/AXzi8+esu0zYUEuWKsKh4cPXFOSapjHoGTuaEMX9CaSZSp9CJOUMgtiWV9L9XYHfwyXInjekE/q+55sVpnBzWx8Qd1JlUGvEMKaGW45Phqf94wU60uu2Z8kTaO/2isQMa+jXmLNXiXI8eduhpiCZIpy/78G3JywLgf//Y1J+BuZWjLlyV3HBecZysEN15sbmH/UzPdn4I7mGiqUNghZIAJN48al9jvYZVGoJkP5KrPNa9+VnzdARlMXaYG+xuiRnvld/hFrCXvgFX7QWVYfuHBaxWK2x7oA5LceTQFfnL1opObdCF+u2/JZZm3l2nHU1+cKNyV326btuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEseWtx4O+PMOIOvACW1RofIpM4IiaWD5Jg0LruWYE8=;
 b=k9GStaSJG48Xxep4qBbAlSxGMd3leCp1zzkqVva+nR22aaUK+3QjohTb69DpuYCYdIKyW0wEkNkvWNd+GgAd59CyHFaXUSEkQIlk1YjzqylsaJnAW2vEaRrq+tgGCOzDTh6U8hjEQfcB7Ma6TinbCb3isE9kOEoib0xlVkeh9u/nbmnGOAqwUZCtcUOAwH4kywi6SBgt8eVAU35ZlTFVuVmJxhsLHK2U68h6tjNzg4XneqRSOZ3G6H0aOtiAN8emiUijPgEUrS9TSb1vp3+AoQZ6NKDLmQUbxqR+vF79uiWFTQh3X5RcLqcbf3ZgQLqFsEzjy/9ShS0oxie6hn2dYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEseWtx4O+PMOIOvACW1RofIpM4IiaWD5Jg0LruWYE8=;
 b=Y6RA5fsUrdewdW1hZvnYplGRTZHFvqD3f5fwzclFT8dAIleqIzWtxkGw6haL19ZLhmbCbiM0zTTlgkZhX7Zqbx1NuIv6p63uHcpxVItc4qifLoQDuuu9Z/IhOWFxb9+/zqJpfAk8K/qfLo6/QFN9iPNAXyWD5yK7ILQNlEsqOLi9M9DacKUFYX0ph/Q482LZYTK0LD7dJ80tBxP7msitwYq9H/uB74drgpklG7tdcmnQeSac1jFhueUkSsC0lzgnMg7EsiULY1qB4h1KEhqL8R9kng7oYWF+qNUt052sPgoL7qZFRQCJ79ei0nZoOKzCU8AAykH2D5UNRrfXAXUgsg==
Received: from MN0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::26)
 by IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 08:01:38 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:52b:cafe::b7) by MN0P223CA0014.outlook.office365.com
 (2603:10b6:208:52b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.19 via Frontend Transport; Fri,
 29 Aug 2025 08:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.0 via Frontend Transport; Fri, 29 Aug 2025 08:01:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 29 Aug
 2025 01:01:20 -0700
Received: from [10.64.161.125] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 29 Aug
 2025 01:01:16 -0700
Message-ID: <eb8d958b-a60b-49ab-b136-49351ef11864@nvidia.com>
Date: Fri, 29 Aug 2025 10:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
To: Danilo Krummrich <dakr@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Alice Ryhl <aliceryhl@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250829075633.2306-1-dakr@kernel.org>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20250829075633.2306-1-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA1PR12MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: ea5f278e-f24f-4355-642a-08dde6d24848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JQRGE4MEEzOFlESUVZRGxwWU5kb05jZTV1NVFDUmtCK2ZwZ2x0V3d1eExw?=
 =?utf-8?B?TU5hM0lBR1ZoU0x1aExnYlBRODhNeFFqYk1RZmd2aE5Ca3d1N1pvUWxEL04z?=
 =?utf-8?B?MnBYQ3BoRXpDSlVjMDV1NXlrVUNrZE1zY2p2aEFoL1lmdkVRaW9LS0dSUzdN?=
 =?utf-8?B?b3ZGTE02dXJQaUtaS2d3V0liQlNoMTJHWmUyY2JMWjlvWTR2UGRvM29oenZY?=
 =?utf-8?B?Wk8ySEtuMXRPd0dTLzNjV1BxcGxUM1hiZnBiV0sxcWx5T2tzSlFRYVdaY1Mw?=
 =?utf-8?B?TFBEUHJVUVpjYkZaYlVDWDM3bHpyV1d5OGlLYXp6VE5aL21hUkFJREJpeTI2?=
 =?utf-8?B?RFkwQ0dkalo0WVhwTVczYnhmSXFrWHdHMXZOVjlzSTRlZ1Q5cWFWdDI5ellL?=
 =?utf-8?B?UDZ0L3JHamtXYXh4SjN3K3g0dkZMNFZWYThSSGhkQ3Y5dXZwQksrbFJ1Y3Mx?=
 =?utf-8?B?WVJFRS93NEEwQ29DSG81b0VmdUQ4VG5wSUFybU5rc1p6cmZzaXo4OHhoV096?=
 =?utf-8?B?b2F4cC9KUmtubGFNTGNFK0g3MWE5VExrSWRONmVxekkva0UxN2Q4a1l4RkpE?=
 =?utf-8?B?K3QwZFRuWE44Z3R6YlJLMGxyNXNHbkVVVksrYVFlaTlYSWxsQzNyWHdzdFBk?=
 =?utf-8?B?dHliT2lGWDMvRE1RT3A3S1M1dkNWc0NiVlNJT1Q0cjllSTkyRnY3TGw5ZWdT?=
 =?utf-8?B?bWxRaUQ1RXNJMEVldzFGZXRYY3BOQ29rYU91QW15L1NPeDNoS04vaTFxZXJ0?=
 =?utf-8?B?di8wYm81blZHN2VIWGRIYjFGcUV1N0djTTdGd0ZrU1BtbXdrKzZNT3JvRUhT?=
 =?utf-8?B?Sk5CRUJIMG5Ed0JsYTRwcmNKTGJWOVA1Smt0d2lSM2pCdkFNQllMYnc4Ky9P?=
 =?utf-8?B?UmFlVnF4c25KQ1BNaVV6SlEraTgwcGJINkFEOWFzaFNMTm9NYzZtSkw2cDky?=
 =?utf-8?B?TmdQMlJ5cDNqcU12QU5MNEllTUpld2UyQ2JqWFNsa1pBdi9WTFVPanBJZlU3?=
 =?utf-8?B?czVNMXVYaXRYNG43TTV3c2xZeTM1RlJYUGFlc1RJUVlBbWhOVFFTMGMvSGZO?=
 =?utf-8?B?ckVyOHphUlBrbTh6cWkvSnZBbys2YktOVDl5UzNoa3Nka0hXaXpyK1NqSW9x?=
 =?utf-8?B?eVFKUnptbUdJSXdQU05BY1ErM2k1R3pLdWxudGREOTUxNEhiSUFzT3lJRU9P?=
 =?utf-8?B?ek01MEN0SXJCaHR5T0dRRFhaNlkwL1VnVXRYbXhFLzZJV1ErVURHcnZCUEFT?=
 =?utf-8?B?dFZzZERmOFRqdHlrUjBpaHBDZGdKQnBPWDBySGpqeThSL0JpWFdRMnBzRHc2?=
 =?utf-8?B?empRSGduWklQREZneE8wSEFlaFdMRTZkbDgxamtMZEh0WDd5ZDZaWDFLYWtY?=
 =?utf-8?B?aHBBMXdOdEJtZmhWVythZVVaWkJuTkQ0Y0ZpOUVDam5URytMRzYwcVVJaUxI?=
 =?utf-8?B?KzJsckFIZGVVdkpRK0VRenVZaEFzOEpJdnBHYi9mc0dQNWNaZjl5SmFCdXlC?=
 =?utf-8?B?TFQweVRPdXFOOHMxVUhFeHV3bXFNZTYvczIzS1YwUzdZTm9yZkp0ZUdLWWls?=
 =?utf-8?B?Nmtqc044L1lUYU5uUGptNFQ5Z1pUWHVDWHhCSnFOMUlac09uaE1HK3VzeUZO?=
 =?utf-8?B?N3duQVlQaFpCQmZrU3JpcDVDQmZIcURMdUYwUXF4NitiMy9LWnFTSXUyMGpM?=
 =?utf-8?B?MjdpdEd6dWlYbnQwZkdiMXBDK2pDc0R1eUZlS2ZBK0tJVVlXR1l5S0lrQ2xG?=
 =?utf-8?B?UElNZ05hdDRIOHIvWE9meSsydEQ0bUVsMVQzWXFwQnJ6M2J0dXI5UEZrUURp?=
 =?utf-8?B?SnpUbXZzWDg4cG1ZbWV1VFo0RnRZTjBmL3NJa2ZLZ3lBbWNMRFRiSlVMUS9j?=
 =?utf-8?B?aUhhVFVuMEVoaUxOVFYyRms1S05kc3dJTFQ1UXdMYUNySGZMZTRKcUJLT0w2?=
 =?utf-8?B?ZDRDYkkvVzVHRURqMSt3UDMwbVR0WnNFaFBwQnlWZzNlUkllZEt0OUxxRGt6?=
 =?utf-8?B?STVxOWRsOTZUeGVUOHA4dE16RUFGcS9zdVZENDFGbW9KaVQ5TjRYeHFyY3JG?=
 =?utf-8?Q?d9sPvE?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:01:38.4759 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5f278e-f24f-4355-642a-08dde6d24848
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458
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


On 29.08.25 09:55, Danilo Krummrich wrote:
> Since commit e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> it is possible for test_prepare_array() to exceed a stack frame size of
> 2048 bytes depending on the exact configuration of the kernel.
>
>    drivers/gpu/drm/tests/drm_exec_test.c: In function ‘test_prepare_array’:
>    drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2128 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>      171 | }
>          | ^
>    cc1: all warnings being treated as errors
>    make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_exec_test.o] Error 1
>    make[6]: *** Waiting for unfinished jobs....
>
> In order to fix this, allocate the GEM objects in test_prepare_array()
> with kzalloc(), rather than placing them on the stack.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes: e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
>   drivers/gpu/drm/tests/drm_exec_test.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index d6c4dd1194a0..d59ec3baae1d 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -150,14 +150,22 @@ static void test_prepare(struct kunit *test)
>   static void test_prepare_array(struct kunit *test)
>   {
>   	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj1 = { };
> -	struct drm_gem_object gobj2 = { };
> -	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[] = {
> +		(gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL)),
> +		(gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL)),
> +	};
>   	struct drm_exec exec;
>   	int ret;
>   
> -	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
> -	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
> +	if (!gobj1 || !gobj2) {
> +		KUNIT_FAIL(test, "Failed to allocate GEM objects.\n");
> +		goto out;
> +	}
> +
> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>   	drm_exec_until_all_locked(&exec)
> @@ -166,8 +174,12 @@ static void test_prepare_array(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   	drm_exec_fini(&exec);
>   
> -	drm_gem_private_object_fini(&gobj1);
> -	drm_gem_private_object_fini(&gobj2);
> +	drm_gem_private_object_fini(gobj1);
> +	drm_gem_private_object_fini(gobj2);
> +
> +out:
> +	kfree(gobj1);
> +	kfree(gobj2);
>   }
>   
>   static void test_multiple_loops(struct kunit *test)
>
> base-commit: 0b6da6d3a8d5391ff9da2358ac5afd8b7badd943
