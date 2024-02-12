Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EB850ED5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801B10E941;
	Mon, 12 Feb 2024 08:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EdWeIwBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A7F10E8AD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 08:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clsc1l/fLoi49ok0sFHR+ktQhORpSl3tTtnDBr/2SRbTlSu//y279ij56oGB2Mc3I/PMtvK/2Wt7VAK3xK+fNf+oEp2uYPTXcmSxhZu71qUi9COGj1XIO6NS8Ac+duUDGuvbm0WHhcyPXi+MXirvcpHMDDp9+0JimxCSAJFvL6y7CERNHU3fonRx2FlfSWqXHYVMvIONtuz4wEFsxKB4Dx/pChs6mrqtBb1yQW+b2BCSkEN9Ps/MbU1GNy+FpCPCTJSnt7qmVXhXZhefiUNaL3VJz5SX0PqjhNQAarnmKRl+3TjFimYSY6hD8GIy4g4pCw8isW8RefoOBehguCZ0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUnyHEK2Z0iy+7pS5lWZzqOg8fP/5l5P/TOGosabA6s=;
 b=Z9wR+oUzBl1j6z3n78PF+yTd5NCWn1MB0tVBGxb98tWiRp+iT+WxCm6dszoA8JnClAW2IXiY+/wzPvzmK19Nh9GAhgxV8HnFw874B3Hko0OtHKR9CoqFJZQguT3yguPcPf0+3T2E/ifQot9fYIt7EcL59aa9M6gS9XixfI17VPxMlzJBgC1YZhaW85cmnDlfjfdDwhUxsqEBoD5zcMMpeNRd2sg+6/S3xZQ4CW4/KMrNsaB3dfN/cGPWXMGWT4Q8rB0IpoXck+3MyEsWm+IvHTBdatB40cCrimi6oLLxZ6fbr5INTDp01/rNz49byCdQAF9aJR9Ku3smYlIYZRVcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUnyHEK2Z0iy+7pS5lWZzqOg8fP/5l5P/TOGosabA6s=;
 b=EdWeIwBiypovRUZB9QklGxGd0OfSG3KA9iAVjhkEqSPReO4fQf1+YHI1jajjqJBZ5RZiz0nNG9VGNbC9IUvflsspovc/4WMKttiL/LUOwGqLXgcX7VI8JtC5QRK73BLbDFmGuwjlPwTd8+/IFDG7OdVvrqFR4nHaHipvVPSlO0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Mon, 12 Feb
 2024 08:23:41 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7292.022; Mon, 12 Feb 2024
 08:23:41 +0000
Message-ID: <81c1db17-e324-6e45-5d55-4308dba99605@amd.com>
Date: Mon, 12 Feb 2024 13:53:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tests/drm_buddy: add alloc_contiguous test
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20240208143618.247048-2-matthew.auld@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240208143618.247048-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::31) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d68c1d-e38d-439e-45c0-08dc2ba3eb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctEyKtMvNvpVLUH1j0pJXARCNETXAV/ISwwJUgan1SnlXPx8xG+Rz0wYLpKVp6kWKk4tCfwDWkeIp13Cb9OWb+8mZgfhZEjlvhVtUfZKJzTI4NNtaVYqbA4HtnqW7k311Am48pFmJQeF+GNPxFcsZMOAKKR6c/SsnbnAy6L834EE4xGoFPtJMjjs3zlNTCUi13rOxRJXjJIfofAF7VH9oZUMIE2nYK3zHbOvC9/xTHyaZz6GIlsiwkhfDyzY6vvBkkQ9wWvab07OIICzNpCHOQI3oB5lOyn6H/CdhiAdm+pJIqHJFY9+FbMG+gYsEPS/Gy7/Q5tmFJBHYv/alfAeCBFMIrkPXFh4+wfTaFhOu/foix0w0FR7mppp3ix2W2BeWY1J9qfUJVLxDnDfU0kJWu6O62UWffhwzVpCV+asF9IucUcLVjCvsC8up8nGaJJ/nzZlbTrRXGHgxD9Qb9sYuf7h2cCg6/cMEZi2XrU0g5ndDitXW4iV0SoBsRuJoGSQvIU770gDZoWtWoKpA9VwU7xNlXX/zmKr751aoQnse+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(38100700002)(41300700001)(2616005)(26005)(66574015)(966005)(4326008)(5660300002)(66476007)(8936002)(8676002)(66556008)(66946007)(2906002)(478600001)(6486002)(6512007)(6506007)(53546011)(6666004)(316002)(54906003)(36756003)(86362001)(31696002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFVOWN6aXRNQzZDQWV6RUtPb1AxSkRrREdLTFMxS1F4UTAxRWJ1SkV5WVZp?=
 =?utf-8?B?WWZGdVBUMk9KSUxWMWFsYTFvNSsyUEJ2OHdsRjB1bEYyZ0Z3eFdpRmJicnlT?=
 =?utf-8?B?R014NU1vb0ZmaGRXZjB0M1hTanVjQ2taVXIrWkgwVnhqOEI4RUVMaXY3cHFs?=
 =?utf-8?B?SXRESm1KQ2w5UG4xNlJHd3NVcnNVN2RJUmxrb2NrMUIwalM3TnRvNnhycFlL?=
 =?utf-8?B?dTdweVBQMzJjMkFQSnJ0S1liVndRUFNnaFVvM2d0eEVUSjZEaTV6ZmJGblB2?=
 =?utf-8?B?ZmtDaVpUb3E1bjk4RkhWZW5sSSswZUpBbHNSY3NtSzRXVnR4ZjFnZ1JvRDdu?=
 =?utf-8?B?WWRMVkN0ZUpWTG9YZVB6RkZ4WExkRHQ2ODkzRW1GSzdXczZyL2FZN3RQRFVl?=
 =?utf-8?B?MUZoZzQvbVJNZk9lWjVmaG9ZK2JhajU2cUU2a3ArZTNiWFZoZDNXZlBOaHJq?=
 =?utf-8?B?TmQ1elF0OGE3SjVJR0FQN05COTRUMlhMM01HWWpDRERLa2pvS0tneFZ1Mk5V?=
 =?utf-8?B?SVkvbytrNllFNFBQYjNlSmVCVC9CYzRjTGhNeWFNQ0pZWTJ6RExNSHZ4bkRv?=
 =?utf-8?B?OG1Qc3dBNG5NRjM4YjVzU1ErZWJEREsrUWQxaWpncHdOZmtHRXdpc3NnZVNa?=
 =?utf-8?B?aUQ4dFNZSnVtQ2traWxWWC9IRThQc3VYcWFqOXlMYVBXYmNDM0ZMSmVVbzlk?=
 =?utf-8?B?QkpxOXNWQTh6LzQxclNERjdGMzRhV1ZtSFp1ZHlSVWpEOVBldk5ycHI5M1dX?=
 =?utf-8?B?VkFuaU5DR2swMFB1d3ZvYlpVNHFjUWE4NSt5emJtcHF2c21qSm8rZGxZODlO?=
 =?utf-8?B?RHE5WHExTW5FbEdLWXNqQjh4TTR0N015aUQwUXR4Ym1XWThGenN6QWIyUmtJ?=
 =?utf-8?B?ZHpEcXVSUzhKK2JZZGxRd2dXYnlUSGVrQURySThWVnNpOVkrejNYVFgvSlFI?=
 =?utf-8?B?WWZqK3JTNEtUaThPdlhCZmdLS3dEdWJUNVkyZ0s4UHI2ZlNJeEFFVitOeTBF?=
 =?utf-8?B?WStnNUFLQmwzOVhPQ1p1dFJmRWoyTkMySnNLQmc1akxnTEVJUTdFTTVjVUlK?=
 =?utf-8?B?eFZoQzExc28xR1Zhekt4ckNxNnhQcktuOVZURjgweTlIeUVmM1ZVU0Q1S0pr?=
 =?utf-8?B?dDAzTEs0VjlzRUJsalhxNGhzZWJQc0ovR3A2QmFRM3Q4aUY2N1VreUhCdWFK?=
 =?utf-8?B?QUxqVjI2L1FOZHAva0pKQzU5YzdwbGRVa1dDdHNkRVExN0NyMml0aW1iNW1U?=
 =?utf-8?B?b0QvUTE1bkwwckpSNmNDdEpIeXRZNnkzbjF3UStPRitJY2FzWUEzZzhuc0xz?=
 =?utf-8?B?c0hxTlBweThrVFg4WENuUlpxQ0I5bG0yYVVSVXdIQ2EvQXZ2QkRERC9GeUdv?=
 =?utf-8?B?WUtxeEJCU2Q1WWs5aE5FdCt5N0ZNOVlGUFI5WHJvQ3RUQm1Kc3hRU2NXa0Yx?=
 =?utf-8?B?ckFDK3dYVVdCNlRGY2FXRjBBN01ZWjZxeUZkOVZicWU2YkFJb21HSTQwMVVR?=
 =?utf-8?B?WW5FcG5KV3N2aC9YeU5WVTJEb1FnZ2Y0aTJ1a2FlM0hOYkd3cnl1VC8zWDdK?=
 =?utf-8?B?Mk10NDB2SDE1UmdzaWxEZ2pDNXdvaFlNS1MzeThkR3FwMGxaa25EQ2ZhTmNa?=
 =?utf-8?B?WkFKT1NsZGVicnFySkxza05idURCTkoxRmZtZUdUQ2Fpd1ExbWRrRy9qUXFa?=
 =?utf-8?B?K3RVU2pSalR4QlkvTWd6RHJaY3JHczgxTDdOUitncllPOUQyL0JlRVdmVGZh?=
 =?utf-8?B?NnJqOFN4dXZzNmNpRXkzNjQyNVJ6ZXdzZlBxeGJwSTlLNjNNSEZwTUc1cStj?=
 =?utf-8?B?by92Y3J3VXlaOGROSHV3S05tZng3Q3UyRzBPOHFTT1dIbWk0c0Jqd01wdFg2?=
 =?utf-8?B?d3oyQi9pRHhBSjhjdklYRE5KcFpCZzhyN2dDZmhTS3crQ00vZ0ZCeGwvQ3Yr?=
 =?utf-8?B?OHNzUjFOeDQ3bFk3M2VUL3lSc1pHdzkwb0ZXRGxrUHRBSTFEUUZhN0ZaTnh2?=
 =?utf-8?B?SVZCa2k0UDRlSHFpTm9xWTJ4dis3ZGJQNlJzQ3E2ODZDbG9WcTlxK1FhR2tv?=
 =?utf-8?B?MWp6UUE0NGdCWTB4THRPcWlpMEpwR3dmb2hvUzhSTzNsb1p3bFNLWUFTNnho?=
 =?utf-8?Q?FSf0kjth5vKUx8C2DJ9QQ0ep7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d68c1d-e38d-439e-45c0-08dc2ba3eb74
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 08:23:41.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eq9ki4PrEsCW2fPuUYjHescipd+4fXIWGue7SW3D3jFfTjQ3azD1zhT/GV68LteCn1OmBbp1j2vzkPKxixcmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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

Can I push this test case along with the bug fix patch.

Thanks,
Arun.

On 2/8/2024 8:06 PM, Matthew Auld wrote:
> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
>
> References: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Limonciello <mario.limonciello@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 89 ++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index ea2af6bd9abe..4215d8b5fcf0 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/prime_numbers.h>
>   #include <linux/sched/signal.h>
> +#include <linux/sizes.h>
>   
>   #include <drm/drm_buddy.h>
>   
> @@ -18,6 +19,93 @@ static inline u64 get_size(int order, u64 chunk_size)
>   	return (1 << order) * chunk_size;
>   }
>   
> +static void drm_test_buddy_alloc_contiguous(struct kunit *test)
> +{
> +	u64 mm_size, ps = SZ_4K, i, n_pages, total;
> +	struct drm_buddy_block *block;
> +	struct drm_buddy mm;
> +	LIST_HEAD(left);
> +	LIST_HEAD(middle);
> +	LIST_HEAD(right);
> +	LIST_HEAD(allocated);
> +
> +	mm_size = 16 * 3 * SZ_4K;
> +
> +	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> +
> +	/*
> +	 * Idea is to fragment the address space by alternating block
> +	 * allocations between three different lists; one for left, middle and
> +	 * right. We can then free a list to simulate fragmentation. In
> +	 * particular we want to exercise the DRM_BUDDY_CONTIGUOUS_ALLOCATION,
> +	 * including the try_harder path.
> +	 */
> +
> +	i = 0;
> +	n_pages = mm_size / ps;
> +	do {
> +		struct list_head *list;
> +		int slot = i % 3;
> +
> +		if (slot == 0)
> +			list = &left;
> +		else if (slot == 1)
> +			list = &middle;
> +		else
> +			list = &right;
> +		KUNIT_ASSERT_FALSE_MSG(test,
> +				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							      ps, ps, list, 0),
> +				       "buddy_alloc hit an error size=%d\n",
> +				       ps);
> +	} while (++i < n_pages);
> +
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +
> +	drm_buddy_free_list(&mm, &middle);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   2 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &right);
> +	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +	/*
> +	 * At this point we should have enough contiguous space for 2 blocks,
> +	 * however they are never buddies (since we freed middle and right) so
> +	 * will require the try_harder logic to find them.
> +	 */
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   2 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +
> +	drm_buddy_free_list(&mm, &left);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> +							   3 * ps, ps, &allocated,
> +							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> +			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +
> +	total = 0;
> +	list_for_each_entry(block, &allocated, link)
> +		total += drm_buddy_block_size(&mm, block);
> +
> +	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
> +
> +	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_fini(&mm);
> +}
> +
>   static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   {
>   	u64 mm_size, size, start = 0;
> @@ -280,6 +368,7 @@ static struct kunit_case drm_buddy_tests[] = {
>   	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
>   	KUNIT_CASE(drm_test_buddy_alloc_pathological),
> +	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>   	{}
>   };
>   

