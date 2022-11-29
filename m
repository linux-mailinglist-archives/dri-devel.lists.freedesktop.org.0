Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47263BF0E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E098610E3B6;
	Tue, 29 Nov 2022 11:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B329A10E3B9;
 Tue, 29 Nov 2022 11:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn1AABDOj9NOFCzX9FdO2bUtPChvKcgOOTFo2dCguPM9aHUL1mTu7mlNgVx+vWg8SAJnGT7dcLkoJvVwGZ1+jXR37r70/9P3GlrHRz6VIOw18ht1Qd5SzLkZzWfEd7wJH4rGs1gP4etvoRgkT8LImk9W/0gEqxmMUVhHXEgl+PtaYDHglQaQJEXu0oTaFJC3S+IuBjjVNfbhAXmfgfsl+4t2Ulcipd72pV8Ib+Eeqxq2kgBQMKl4VTBEjPKV2s0sLLORdTWPXy7lyjVItWrp7/XOJ+euSIIoMd50VCaF/IM4ohohVpHTRkXWoh5j/7uDSXi2AIhCzgo8sOJn9Iq1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L26ixCG8rTLzSsP8JoVF9GGgTnHDLNVOyhfBwhq4tX8=;
 b=M986cS4Vqh2ozmT1x4NgxH051oIWCbDzkgEt/xFb3ZvVvANiYeAI7GjeMdmyBRAY7GZ4HblGrj8lXaoCMfASpsH0HOrxxTcNfuCKGniyIK43eqUZSLaDj5qBdRCjpIYHHpsPYCKzBGsjjUlgxYEPQ6817sCY83g9v8JcOlhqucVzykmqC1ReXHEQP885ay4dj9a3CSuC3e/NkX0rPfjxs/LEets1WFvBkERm1mqjGmKIHW/hREhJ/lEPYEdChmUPPTmhKGExhxP+jyH5AU1oWUWmJ5M23VQc5+lVHBecKx0Adng6prwSXIomUtWb/I4etBRSPgNf4q00lq+XjloSjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L26ixCG8rTLzSsP8JoVF9GGgTnHDLNVOyhfBwhq4tX8=;
 b=5DZ6Vp/3s1i33S7+R0ykJuVOpGcGUnVzbwgmvBjZCiVu6SkLvzNZHNHcdsMsuEnVOfGXXnRvuTtC5y8DcKTlLf4f9VeA/v68OXLLw9Y/EItgLXCusXkZ8SKl0R/MJVig/Lf0hlVtpSskMKTt+udbMy+nsRXvAPL6KoHBngRHW1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 29 Nov
 2022 11:32:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 11:32:31 +0000
Message-ID: <fe127690-9dbb-797f-c0c3-f1e05657293f@amd.com>
Date: Tue, 29 Nov 2022 12:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] drm: Optimise for continuous memory allocation
Content-Language: en-US
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221129105655.125571-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221129105655.125571-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 31da54e3-c2ba-42d3-6a4b-08dad1fd6722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wXXZWFoEDG6wkeFbM8RC4aYmrvurwffkcGRqoYsTbVIe8B+npYxCive19Vmljt6bhTov1WG3PKgyM/hblY27JXraXs9nm72yDtefFn6laLhdEFjv+pkA3BuPNYdg88e5Ldlspajd47Qo1AqlBKlJS8MNpyWqUuyaLpP3DAfGW53ol0Ne1hszc2Vd3oT+ypr1bcTZpd8qY/4pvh5bPKB849Hn+ywNhvLHKEIqn0VXrwNIOJsXw4Zj/MxnYRAPHFkF7vGIcH6STsxUkqB6BmVDOYT9uIdZYcy1PP72O4HK0nW1sxQa/5meh9pztQE+gJj9WYwZzn5i8BT1Wjbw30AQBFI2GBSWmCawwaO2XzADYfhZ0jYiKCzF9vUlykdTKE3he+A+oXHNZv9eCLdwPk536YW6NdD4kaVr9ah0Yc3Cg9Te+oyvBkAayAgdAbbVgx/i/Ja+caBdsVTFxl3kcTrxb9vDEhmNS5JzTvnQey9U8/Yl9xJ+SC755UI/7GWyAIKMHOCy/bddn7QfqqzMpK9qLvB/+ovrNU0z+zNJ8aKlUq8txOVdiRXgJp/tOBVDtRmCIEvJvsjEKNfmXGmdCLWE25MsBi/VY7cEzsxyfh/mTXHqExKV87GMNXG4wTfdzC6u86o6WWm+3/7A8/3l7kGEW8wUsy22xaGl/i3uBbwtIXnE4z9KcY7hpeBJdXLUiYOKF6n+RX+sJ4gnyZO9kejz5Eq5k7ix6otXeA63PlVark=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(36756003)(66899015)(31696002)(86362001)(8676002)(2906002)(83380400001)(4326008)(478600001)(8936002)(31686004)(2616005)(186003)(66556008)(66946007)(6486002)(316002)(38100700002)(66476007)(6512007)(6506007)(5660300002)(41300700001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTh2c0twSXd2c3ZMeWswSENCQ09TOGdYbUtmSUNzTU9zdEpoNGFOTjJ6L3Nz?=
 =?utf-8?B?R2NlUVdwN1JtbFo4T2VNMmdFSUtOZnh4SVpyeStIOUw2ZGwrN0FUTUpjWmRx?=
 =?utf-8?B?SUJFZisrbjF6aDFzWGtpVzVqbFpXNlVPVHBpWmNlZWpZOGprdmNvRnFjcVU1?=
 =?utf-8?B?MUJIaG5wd1MyY1A0SEZ2dDlBaHRtVDBMSUgrQ1RldzVEQzkxQzVuSmkvaTJp?=
 =?utf-8?B?VW0xRldhbDNiM2tMRkFVbXp4MnRWMUNHeGJXRFVQTElPdUVwdngvRlZUUkZZ?=
 =?utf-8?B?OG0zd2JuU3dDd0lwNHQrRTVWTm1nZUFOaXpBSzNrUWkyWEx4OW1JSVY5RTlt?=
 =?utf-8?B?VEpJWjF4a1ZMQk00YmsrN0hSQUtVdkxtamxBOFRUVkV2K20wL0E2eHNzeDBZ?=
 =?utf-8?B?WUdlWVpxUjI2N09GOVdzUGxRU2V4aDJjK2N3ZlN2TzhXdFQ2bndxbGU2UE4y?=
 =?utf-8?B?L1NBOUk1YzBiTmVrUVJacUR3Zy85VXVFVTZyVFRnTnFLRC8vSVg3aGpOdlFp?=
 =?utf-8?B?TmtZWnAxRDM0THp6RHNYdEJYdUpuYXZiWDczQUJtOFNJSGNHMXZzcGc4aEpD?=
 =?utf-8?B?OVd4dVUrdHFDV3Z3YW5SWnc0K1NVSHloNjQybFo3NThpWHFkcjlFVi9wK254?=
 =?utf-8?B?bG1JWnNnUUgwVlN1bWdMYzhacHEyejZrK1R2QXBkKzBxdTVFVW14ZlkyMktn?=
 =?utf-8?B?OTVQWTJVSjEwNDBFV2k3NWFsRldWSjhJcXRacGF2WlFXL1ZDa2F3UDRTRTdS?=
 =?utf-8?B?WDE4NW9BVnlkbTQ5c2pGNFhGQmpTeVdvVjhZOHpxOHN0NDJwSjlWSzBETDBz?=
 =?utf-8?B?T1d4SFUzeUtMYVU4Zmd2WjNKMmdTVy94UE4xbkNFRklCOWdtNUt2L2Z4aCsz?=
 =?utf-8?B?VEdleFZ3NmExSXBIQmszaUZ6MnBXZElxTjVTZmlnUjUvbktEak1sK0pXL0R2?=
 =?utf-8?B?SWh1eUNDdGQ4N244WU94V3VHbGw4Rmc3b3krbTh6d29lUnZRQ1hOSk44ZlIz?=
 =?utf-8?B?bFYwb0FQYVpYUUx2Tm5lRnpXd2lwRHhrNTRUZmtkOGNXdU44azZZa25qRGFL?=
 =?utf-8?B?YzFiWE1sbXFnNG9SbWVyendrZTRkcnJTV1RsOEVZSmc0ZVJmbUZmZXNLb2c1?=
 =?utf-8?B?VFlLT25TQW5ac3h0M01QRHFUQUJoOHB1c05EdzlncVV0T2NselJ1eDZadzdG?=
 =?utf-8?B?TVlyZGdBRGllRUhIaHR5VnVjUzllNU5NQWRtd0VsUkkzOCtkMkVrM0sra0hQ?=
 =?utf-8?B?ZW5zYjNPUFJ5RVQyVWYrZHJLRkM2TTNjZ1NXS3gwV0F1SE5OVU0yanFENG04?=
 =?utf-8?B?YzhCWllmZk0rdks0VmlGT3NRRlc3Q0ZuNjYrQUk0blFSSVk1VW14amZtQTkv?=
 =?utf-8?B?R1plWlAvR3R1Z3ZLNzZtck5RdStNS0JteXRVWkVNVGUxbDJ4eGVDRkRsR1NL?=
 =?utf-8?B?T1pFcU5weDMwdm85bFNoVzlmUXRwZjFoOVhEKzZIbHRjbTZiMVBncUx5ZXRz?=
 =?utf-8?B?MHdyaHd2ZmVKSmZVN0lzczFhcHV5UW9vR0VPZlpOVk9TTzRvQW54M0NZQUl5?=
 =?utf-8?B?UXJGckh0d0pBWE42eGJRRGNqVlExalNtNy9Sck41QkVZRTZxYTZkT1B0OEZr?=
 =?utf-8?B?MXhONzl2UkdOeHpzNmZKUFV5VmlRZUM2ZkxqTnkxUUlCdVZ6YzFPTG16aEtV?=
 =?utf-8?B?OEpKSGhJMkFoYWtLb1V3ZHYvbXZNQ1FseDluWmlYczlKUzBNcDg2UC93MkR3?=
 =?utf-8?B?azN5MFRTb1g2aklaeG5FVTdLUUFjaUdJL1BpYXBIWjB5blBiTmEzS2svbytZ?=
 =?utf-8?B?UGpHL29DRHVBS2JROG1pYzl3dFNUOUhDcmNHR2k5enkzSHNnVDN6YmkrZk8z?=
 =?utf-8?B?N3hOdTJZN3llTS9UNlpCQndNc25adE1sdnF0Wlg4SDVFSUVsaTZOL0lWbkFX?=
 =?utf-8?B?T0l5VjRFNm56Zmd6YW1SdXg5ajRLZmxiT203VTFGYlM4U0xOdUY1cGxSbDFw?=
 =?utf-8?B?Qkx3NmtaMkk3elZUWHg3ZTFBSWRiMGpUUTRETHlVU2RKQkgwcExiS3RtVml4?=
 =?utf-8?B?M3hRejBrVFBpTGdOZ0NoY3p3RGt2ODB5Y1lhcXlBRkFUZUJnZzlaR0hlS21W?=
 =?utf-8?B?aHk2cTJIQzVUZlJCY25MNmdodjVBdUh3NE4xQ1FIdDhGbHVwTitKellWWlhr?=
 =?utf-8?Q?2rJ7mKDlfYPjSFpp6hjxX7ZplJf8VrRY12plo62B3jES?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31da54e3-c2ba-42d3-6a4b-08dad1fd6722
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 11:32:31.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDn1otAcjPHkS4RSQCMYQbfCcWm0I350f9lVus9ZvaAxYDJpVx9W0/YMrz+7/EMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
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
Cc: arunpravin.paneerselvam@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.11.22 um 11:56 schrieb xinhui pan:
> Currently drm-buddy does not have full knowledge of continuous memory.
>
> Lets consider scenario below.
> order 1:    L		    R
> order 0: LL	LR	RL	RR
> for order 1 allocation, it can offer L or R or LR+RL.
>
> For now, we only implement L or R case for continuous memory allocation.
> So this patch aims to implement the rest cases.
>
> Adding a new member leaf_link which links all leaf blocks in asceding
> order. Now we can find more than 2 sub-order blocks easier.
> Say, order 4 can be combined with corresponding order 4, 2+2, 1+2+1,
> 0+1+2+0, 0+2+1+0.

Well that description is a bit confusing and doesn't make to much sense 
to me.

When you have two adjacent free order 0 blocks then those should be 
automatically combined into an order 1. This is a fundamental property 
of the buddy allocator, otherwise the whole algorithm won't work.

When you have the case of a free order 1 block with two adjacent free 
order 0 blocks then we a fragmented address space. In this case the best 
approach is to fail the allocation and start to swap things out.

So what exactly is the goal here?

Regards,
Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
> change from v3:
> reworked totally. adding leaf_link.
>
> change from v2:
> search continuous block in nearby root if needed
>
> change from v1:
> implement top-down continuous allocation
> ---
>   drivers/gpu/drm/drm_buddy.c | 108 +++++++++++++++++++++++++++++++++---
>   include/drm/drm_buddy.h     |   1 +
>   2 files changed, 102 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..8edafb99b02c 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -80,6 +80,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   {
>   	unsigned int i;
>   	u64 offset;
> +	LIST_HEAD(leaf);
>   
>   	if (size < chunk_size)
>   		return -EINVAL;
> @@ -136,6 +137,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   			goto out_free_roots;
>   
>   		mark_free(mm, root);
> +		list_add_tail(&root->leaf_link, &leaf);
>   
>   		BUG_ON(i > mm->max_order);
>   		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
> @@ -147,6 +149,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   		i++;
>   	} while (size);
>   
> +	list_del(&leaf);
>   	return 0;
>   
>   out_free_roots:
> @@ -205,6 +208,9 @@ static int split_block(struct drm_buddy *mm,
>   	mark_free(mm, block->left);
>   	mark_free(mm, block->right);
>   
> +	list_add(&block->right->leaf_link, &block->leaf_link);
> +	list_add(&block->left->leaf_link, &block->leaf_link);
> +	list_del(&block->leaf_link);
>   	mark_split(block);
>   
>   	return 0;
> @@ -256,6 +262,9 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   			break;
>   
>   		list_del(&buddy->link);
> +		list_add(&parent->leaf_link, &block->leaf_link);
> +		list_del(&buddy->leaf_link);
> +		list_del(&block->leaf_link);
>   
>   		drm_block_free(mm, block);
>   		drm_block_free(mm, buddy);
> @@ -386,6 +395,78 @@ alloc_range_bias(struct drm_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static struct drm_buddy_block *
> +find_continuous_blocks(struct drm_buddy *mm,
> +		       int order,
> +		       unsigned long flags,
> +		       struct drm_buddy_block **rblock)
> +{
> +	struct list_head *head = &mm->free_list[order];
> +	struct drm_buddy_block *free_block, *max_block = NULL, *end, *begin;
> +	u64 pages = BIT(order + 1);
> +	u64 cur_pages;
> +
> +	list_for_each_entry(free_block, head, link) {
> +		if (max_block) {
> +			if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
> +				break;
> +
> +			if (drm_buddy_block_offset(free_block) <
> +			    drm_buddy_block_offset(max_block))
> +				continue;
> +		}
> +
> +		cur_pages = BIT(order);
> +		begin = end = free_block;
> +		while (true) {
> +			struct drm_buddy_block *prev, *next;
> +			int prev_order, next_order;
> +
> +			prev = list_prev_entry(begin, leaf_link);
> +			if (!drm_buddy_block_is_free(prev) ||
> +			    drm_buddy_block_offset(prev) >
> +			    drm_buddy_block_offset(begin)) {
> +				prev = NULL;
> +			}
> +			next = list_next_entry(end, leaf_link);
> +			if (!drm_buddy_block_is_free(next) ||
> +			    drm_buddy_block_offset(next) <
> +			    drm_buddy_block_offset(end)) {
> +				next = NULL;
> +			}
> +			if (!prev && !next)
> +				break;
> +
> +			prev_order = prev ? drm_buddy_block_order(prev) : -1;
> +			next_order = next ? drm_buddy_block_order(next) : -1;
> +			if (next_order >= prev_order) {
> +				BUG_ON(drm_buddy_block_offset(end) +
> +				       drm_buddy_block_size(mm, end) !=
> +				       drm_buddy_block_offset(next));
> +				end = next;
> +				cur_pages += BIT(drm_buddy_block_order(next));
> +			}
> +			if (prev_order >= next_order) {
> +				BUG_ON(drm_buddy_block_offset(prev) +
> +				       drm_buddy_block_size(mm, prev) !=
> +				       drm_buddy_block_offset(begin));
> +				begin = prev;
> +				cur_pages += BIT(drm_buddy_block_order(prev));
> +			}
> +			if (pages == cur_pages)
> +				break;
> +			BUG_ON(pages < cur_pages);
> +		}
> +
> +		if (pages > cur_pages)
> +			continue;
> +
> +		*rblock = end;
> +		max_block = begin;
> +	}
> +	return max_block;
> +}
> +
>   static struct drm_buddy_block *
>   get_maxblock(struct list_head *head)
>   {
> @@ -637,7 +718,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   struct list_head *blocks,
>   			   unsigned long flags)
>   {
> -	struct drm_buddy_block *block = NULL;
> +	struct drm_buddy_block *block = NULL, *rblock = NULL;
>   	unsigned int min_order, order;
>   	unsigned long pages;
>   	LIST_HEAD(allocated);
> @@ -689,17 +770,30 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   				break;
>   
>   			if (order-- == min_order) {
> +				if (!(flags & DRM_BUDDY_RANGE_ALLOCATION) &&
> +				    min_order != 0 && pages == BIT(order + 1)) {
> +					block = find_continuous_blocks(mm,
> +								       order,
> +								       flags,
> +								       &rblock);
> +					if (block)
> +						break;
> +				}
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
>   		} while (1);
>   
> -		mark_allocated(block);
> -		mm->avail -= drm_buddy_block_size(mm, block);
> -		kmemleak_update_trace(block);
> -		list_add_tail(&block->link, &allocated);
> -
> -		pages -= BIT(order);
> +		do {
> +			mark_allocated(block);
> +			mm->avail -= drm_buddy_block_size(mm, block);
> +			kmemleak_update_trace(block);
> +			list_add_tail(&block->link, &allocated);
> +			pages -= BIT(drm_buddy_block_order(block));
> +			if (block == rblock || !rblock)
> +				break;
> +			block = list_next_entry(block, leaf_link);
> +		} while (true);
>   
>   		if (!pages)
>   			break;
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 572077ff8ae7..c5437bd4f4f3 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -50,6 +50,7 @@ struct drm_buddy_block {
>   	 */
>   	struct list_head link;
>   	struct list_head tmp_link;
> +	struct list_head leaf_link;
>   };
>   
>   /* Order-zero must be at least PAGE_SIZE */

