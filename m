Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8BE7D4ABE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 10:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2563110E2FE;
	Tue, 24 Oct 2023 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D1710E04D;
 Tue, 24 Oct 2023 08:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1yXIvB3TaiQX6RU1reMbYutUHYQvrGn9YGrUXUJ1yW5PEWP8UEmMevjnhdH+iV5yHw6rOmPSvSvvFHfQTv5fL31fy+G8DrRm1lymGPZDnmsroBYLcuwGgyNLkHWvPVUMDX9A6N5CBXMHSVVEGwCD5e7P9eQwOcoQFa/xhH3EJhzj49jTVx4zWZ6mBWaHigHbDP7azUvZcSjMHftYSMt91yWi5+0XlN3Nt4QjWUb7hTtk79sd5OjnB6Q6KF0JdPBCGL301qW2oZKfjecv9I7yjEIR4mZL6Ooo8wN1ZffUBk3JSRJ9Pa0XnnEPKyHFAWwwb10jA3H/OvQvjhrevYWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6DTYzc2HZxTrYBU4FlcbU3sZcGlA6jY7BJTsnbE7TI=;
 b=cYYbndm625TUIZ7zdq/Pn943Jp2IddQBzxfwoG0iGyQJobUJ6Jr+/s8ILiAkJOq7HvlSRfPBZrp7RfbzOLQXnK+kT9vZyGZN94Tdzdi+ju76ALo0Tn8h2B/VTXdVeVNNSz5mpBphqN8jR5ywLm03o2KetsC8kTu6VH9xPypPAdgzFsl3vs23hwu+RRF9MNG4deD2L7UhWvVHWmNmvaGwg8LcIQZ3vXliZ6KBJBywXAoZO7CxVuHWJm3GogwMf1uF+BcJlmmhmLQQdvTwRTpXTyp8D/Qmk8qcel69UZXfqzWMiZRdqI5xF4XXBCr7Dv45ZPJEjWC8Vngg88ol8o2img==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6DTYzc2HZxTrYBU4FlcbU3sZcGlA6jY7BJTsnbE7TI=;
 b=qQLgBh891ODPUtxUd0QIv6KhBRJtxxhEQWMaqN+4LeS8T3UtBcNUa8mrx227BgC4BjH4m8D6zJMvQk99GAXl0pblU4FR6haW4hZ9iYv0U9YOUV5rUlle+m0NWSC41Po0+gWZ5juCpYZubhvT9olTVZejtqeNBhM6yx2+2vmDB1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB9158.namprd12.prod.outlook.com (2603:10b6:806:380::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 08:45:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::af19:f731:8846:68ba%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 08:45:47 +0000
Message-ID: <ca76ef68-5fa4-4a2a-9da2-0378dd7bc2cf@amd.com>
Date: Tue, 24 Oct 2023 10:45:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 1/7] drm/gpuvm: convert WARN() to
 drm_WARN() variants
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-2-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231023201659.25332-2-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3bd261-5e68-4a08-2563-08dbd46d9db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZYPZSvezkumiaEAjAAQirlkaYZPHpO8gS4BG42i0lEClm3AK5n13cP5ZAZImRB0dIPupa8JMegGOxGzbDn1uvc2iWxAZnOlFPQAaNX1f86RQbgxTsX3BHPfEed0S/FtM6IIDX70vmq1XMHQ+1MlRHcWC6osLh7lSVpvJi2W71pyvvTsYbYxFfeuVbXEk2Xo80WdHzhJh9TbwUgEl8qdvyoLiCqh8yXFcEur92tt/+C7hBuhg8UPTzwujq8o9NPGb1RuSqYTg9loa2EBJh+ZPfI2G6U+wBFAaJIIE76IIY9RQNrbvdcwR0FFaYYT40LpArIkbrbeuSMFAsKVujs8ovAvm5DD8y+oBQV5b8NPEi3+M6qfsLVjYC+ShI1ayHs08CGVspNBuDVZ/AZeGMWajVlboJizAw68B2cRMMzTLXrHNt0S3uWox5u2SN7P9P76Z9xBla1oh9/ojoc3RfW5tP7SkA45w0gZlZB9ePloVju12lo7JU4AlgSsILhfc5nJylSTQq+wUkhKlVkI/vjZyfwlb52Nijo1c4h2Z15WKu/NnlDPC0fLRC9DOpRUe5B6aFKzqUeAMLsj5mUkAyjm1C1lghD3aGvPv9NrGCDUBCr03uFdOGeACdqEZiTATQ6Z99Gn3jqlamU9W4WsOUEEzyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(86362001)(31696002)(36756003)(6486002)(478600001)(26005)(7416002)(2616005)(6506007)(6512007)(5660300002)(8676002)(8936002)(4326008)(66946007)(66476007)(66556008)(6666004)(41300700001)(316002)(31686004)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1JOVWp5MzFnS0hnWGJ2Y041S3pEbWRvUi93WTNwNHlvbytlU2JsU0ZvUlVM?=
 =?utf-8?B?eFlKT0Q2M0JNWGw2anBZYWRSMEhSaTEvRlZaQXFwcGVXWDc4ajJHRjZxTVda?=
 =?utf-8?B?TzYxN0ZvRjNsei9zVy9idEU5OWQrNnVjTWtXZVE0SSthdXBIYXFIN0JHTWhp?=
 =?utf-8?B?QndpRkZhR3Y5ejhla2RjNWRIOElOK3p6T3ZDb1hwTVZOQzdkUXBURjJiYTBV?=
 =?utf-8?B?Y2t5RGZpRkFITEkwaGY0YjUwRDd1YU1HQkpXS3YwZllncXdKVCsrR1ZXUDNK?=
 =?utf-8?B?aWlVWFlNVFZCRjhPYldveVIrR2s0emJ5WDQyYUZwODF4OWh2TSt4U3dPY1NE?=
 =?utf-8?B?Mk81cVhaU1FsUGtBK0hETGxxRXY3S1QzZHBZNHhQUHg2cm1pTVl1VXVXOTh5?=
 =?utf-8?B?Z2VyMGwzWnlCcENsbXZNUXhTcW12eHlLTllWSHc0M2RxNUdIeEk5WUhCUE41?=
 =?utf-8?B?YUU1R3oxMExvbkJPZXdKQkduVFJvNHdnM1liTSsrak9CY0tzMnpGQ2dQWi8r?=
 =?utf-8?B?TDlkZnJydW14K0d1cFh4THZnUmhITFlnTHJHcFI5cEtSK1hBVTRDOXEwUnI4?=
 =?utf-8?B?VjhobTBVWTY1ck5HcjZZcENmMnh4clhmWTJ4RERlampGMWUzc25LdVU5ZC93?=
 =?utf-8?B?M0hES0h5NnY0NmpGc1ZtRUFlZ0dEcS8zWGpqbVZKYnhuWkk5VjdTbnRzRGZZ?=
 =?utf-8?B?VHNJYUtDOW5DQ2FPSllJbGNkb1lYY2hPUkNNbXMyVFJpYXkybU8reWlPd0ht?=
 =?utf-8?B?ZWxwSG9veDRqNTBFc1h0OHJRc3B2QjlJTFRPbUVOUXJMWmx5TE5LTVFNTWlh?=
 =?utf-8?B?OXlXUzlwMTl2VnQ5SVRid2J2Tzk3ZktTMjVxYTQ4dDhYdFBwVlh6RTlXNUJR?=
 =?utf-8?B?QTRYS0RnTzhHZk8yeEdFMUJaaTd5YXNxU1FHc1lqdTJMUmhTcGpxQ0psWTRz?=
 =?utf-8?B?czdTVFNTOWh0ZGUzMmtld0VqU2FlRXdybTZqWU1nZVhKcGo0YlhvYWhhdmVn?=
 =?utf-8?B?cUhZUGJNejIzV1RBTmVTcE5BblNhaFlHc0JFaXl2WXUvbFkzV3hQZmRmODQ5?=
 =?utf-8?B?V3QwbUxJVU5XZHFVUTVraWlYaU1mUkQ1K3YwSUFvNkZsMmxRQ3l3V3ViQmc1?=
 =?utf-8?B?SzZuRUVqdmk5YlBMK0tVS015RlB1QStGZERyS2VpQy82NjdQUWQrUU1GN2xv?=
 =?utf-8?B?S0dJNWxKbmtaSFRPN2NvbG1pZFYrWHFycDVZbkdHSUorSnkyY3p4TG9jY0FE?=
 =?utf-8?B?RTJQNnRGbUFBQ0hLd0VMTXZkTHk1T08zTWN1b09RY3hSRjZFZnoxajlmRWx4?=
 =?utf-8?B?NjR5UzJiNndrSjUvb1UxdVBrMU1jR0hVY28rYVpwNnFiRGd4ZE9jOUtRNTNX?=
 =?utf-8?B?VkFycDg5N1NuSGdmeDVJV2VsWTkzSUREaDAxY1p6QmdtZHNUQWlmeFlwdFBh?=
 =?utf-8?B?TTAvaDdPbGtVVHBMcU16L084U2JmK1J6cjE0Z0RaUHJzNWdqOHExNXRGQUhz?=
 =?utf-8?B?bnVyK1UzeC9xNDVORVovNldBRVJFanp2MTlIZG9pd056bXcxTmhHbUY0c2Y2?=
 =?utf-8?B?eGIxSFYrSHl3YkVvTTY0SW9jTjdTdkhOZytBb0JSMmZ0V2dSQ1YrTE5Ob0tG?=
 =?utf-8?B?QzZWdXJhNkFsbWs4WEtVWjRMZWpYcGgrYXYySWl6enl2SDdhYVZNNitpT0tm?=
 =?utf-8?B?cmZFRHRnZ2RWRVMyRmI1RCtpRndwT3ZvNmxmbFBScFFmRkRhUW9WK2VHSkVW?=
 =?utf-8?B?clg2VkNQMVJYalI3emRsaVdIaXRJU3J6ODJmMnVmZUhVY2k4bFovMHdTTFZH?=
 =?utf-8?B?bG1GZUZPWER0dFdUSVdyRCtvbW00dUZQcm5FWGxBQnVDMjFnZ3k5a1FCamVN?=
 =?utf-8?B?bk85QjNaQllCYXVDcCtUbVpiUGtMQnh1ZUkzeEdhMUlkbUh0T0pIVTlqbDAv?=
 =?utf-8?B?TXR6MEo0OEt1M0VBMlIrSWtBVENPOS8zbjFZaStjUVdGSWx6aEU0MXYrS1Vp?=
 =?utf-8?B?eWFlYzJxU2MvbjYva0FPb3JLL1g5TmRrc29GR3V3c2Zvd1kvNjZBUE1tMEVw?=
 =?utf-8?B?Z0pjMmtTWFdJdGxydFgyT2RhMWJUSTFNUEs1U0svbjJpZ1pIOU10R2VsTEtI?=
 =?utf-8?Q?qeV92ePXTr7awIEJegZwytHvw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3bd261-5e68-4a08-2563-08dbd46d9db7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 08:45:46.7614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGQMKdaBYQUTRKl5IssgvrAgzeu2gc/dZddkubR9rQ2I5LcuUT7FJpERmf/6tCHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9158
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.10.23 um 22:16 schrieb Danilo Krummrich:
> Use drm_WARN() and drm_WARN_ON() variants to indicate drivers the
> context the failing VM resides in.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c            | 32 ++++++++++++++------------
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
>   include/drm/drm_gpuvm.h                |  7 ++++++
>   3 files changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 08c088319652..d7367a202fee 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -614,12 +614,12 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>   static void __drm_gpuva_remove(struct drm_gpuva *va);
>   
>   static bool
> -drm_gpuvm_check_overflow(u64 addr, u64 range)
> +drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
>   {
>   	u64 end;
>   
> -	return WARN(check_add_overflow(addr, range, &end),
> -		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
> +	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
> +			"GPUVA address limited to %zu bytes.\n", sizeof(end));
>   }
>   
>   static bool
> @@ -647,7 +647,7 @@ static bool
>   drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>   		      u64 addr, u64 range)
>   {
> -	return !drm_gpuvm_check_overflow(addr, range) &&
> +	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
>   	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
>   	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);

When those parameters come from userspace you don't really want a 
warning in the system log in the first place.

Otherwise userspace can trivially spam the system log with warnings. The 
usual approach is to make this debug level severity instead.

Regards,
Christian.

>   }
> @@ -656,6 +656,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>    * drm_gpuvm_init() - initialize a &drm_gpuvm
>    * @gpuvm: pointer to the &drm_gpuvm to initialize
>    * @name: the name of the GPU VA space
> + * @drm: the &drm_device this VM resides in
>    * @start_offset: the start offset of the GPU VA space
>    * @range: the size of the GPU VA space
>    * @reserve_offset: the start of the kernel reserved GPU VA area
> @@ -668,8 +669,8 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>    * &name is expected to be managed by the surrounding driver structures.
>    */
>   void
> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> -	       const char *name,
> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> +	       struct drm_device *drm,
>   	       u64 start_offset, u64 range,
>   	       u64 reserve_offset, u64 reserve_range,
>   	       const struct drm_gpuvm_ops *ops)
> @@ -677,20 +678,20 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>   	gpuvm->rb.tree = RB_ROOT_CACHED;
>   	INIT_LIST_HEAD(&gpuvm->rb.list);
>   
> -	drm_gpuvm_check_overflow(start_offset, range);
> -	gpuvm->mm_start = start_offset;
> -	gpuvm->mm_range = range;
> -
>   	gpuvm->name = name ? name : "unknown";
>   	gpuvm->ops = ops;
> +	gpuvm->drm = drm;
>   
> -	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
> +	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
> +	gpuvm->mm_start = start_offset;
> +	gpuvm->mm_range = range;
>   
> +	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
>   	if (reserve_range) {
>   		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
>   		gpuvm->kernel_alloc_node.va.range = reserve_range;
>   
> -		if (likely(!drm_gpuvm_check_overflow(reserve_offset,
> +		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
>   						     reserve_range)))
>   			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>   	}
> @@ -712,8 +713,8 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>   	if (gpuvm->kernel_alloc_node.va.range)
>   		__drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>   
> -	WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
> -	     "GPUVA tree is not empty, potentially leaking memory.");
> +	drm_WARN(gpuvm->drm, !RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
> +		 "GPUVA tree is not empty, potentially leaking memory.\n");
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>   
> @@ -795,7 +796,8 @@ drm_gpuva_remove(struct drm_gpuva *va)
>   	struct drm_gpuvm *gpuvm = va->vm;
>   
>   	if (unlikely(va == &gpuvm->kernel_alloc_node)) {
> -		WARN(1, "Can't destroy kernel reserved node.\n");
> +		drm_WARN(gpuvm->drm, 1,
> +			 "Can't destroy kernel reserved node.\n");
>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 5cf892c50f43..aaf5d28bd587 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1808,6 +1808,7 @@ int
>   nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>   		  u64 kernel_managed_addr, u64 kernel_managed_size)
>   {
> +	struct drm_device *drm = cli->drm->dev;
>   	int ret;
>   	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
>   
> @@ -1836,7 +1837,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>   	uvmm->kernel_managed_addr = kernel_managed_addr;
>   	uvmm->kernel_managed_size = kernel_managed_size;
>   
> -	drm_gpuvm_init(&uvmm->base, cli->name,
> +	drm_gpuvm_init(&uvmm->base, cli->name, drm,
>   		       NOUVEAU_VA_SPACE_START,
>   		       NOUVEAU_VA_SPACE_END,
>   		       kernel_managed_addr, kernel_managed_size,
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index bdfafc4a7705..687fd5893624 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -29,6 +29,7 @@
>   #include <linux/rbtree.h>
>   #include <linux/types.h>
>   
> +#include <drm/drm_device.h>
>   #include <drm/drm_gem.h>
>   
>   struct drm_gpuvm;
> @@ -201,6 +202,11 @@ struct drm_gpuvm {
>   	 */
>   	const char *name;
>   
> +	/**
> +	 * @drm: the &drm_device this VM lives in
> +	 */
> +	struct drm_device *drm;
> +
>   	/**
>   	 * @mm_start: start of the VA space
>   	 */
> @@ -241,6 +247,7 @@ struct drm_gpuvm {
>   };
>   
>   void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> +		    struct drm_device *drm,
>   		    u64 start_offset, u64 range,
>   		    u64 reserve_offset, u64 reserve_range,
>   		    const struct drm_gpuvm_ops *ops);

