Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0263AE87
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 18:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2BE10E2F8;
	Mon, 28 Nov 2022 17:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD5C10E2F8;
 Mon, 28 Nov 2022 17:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcNzng/NxDvl8dPtmthfsqWBhm+XdtNvs+EIOAvZc/Yp3qlgPOYcFj9NF+ROoq2yaMGwytoLWIxPmzFEGxttL6VYW3HiqFW6GPy+0PF5C7xPTnYlGodaHLB7OxHavcnF5j3teohMbSfJjT8ItECgjMkN0zCDnD2tXl22G8gr4+ambtpJBHYuofWQwMyksCwz51DePHdm5Ut5ylJ6UYZnOYNTFVJQU18zwBMnzLB+9zPQRN/k29ryi0ZPMMtCRaq7DwnySyYOgThIQq5IUYhxeMRQmZcgSuwsIR6hn1uBepLoszEO5xYxyWTfNXsR6Hw0gHuS7ukRzlMdobx2PkwGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEi1mUs+yMYzBFMl1OZ4B4T6FbNCx4MOqNO8IirKBNs=;
 b=GROjp+oEX0SJqD0MnutjcS2a01WxA9t7V8qHme6/ksj6tMtXs7TidNmUfE6BBAx6kaVjZXwnNZf+FHRGuE7B45k9dquEMaJIAMhUV5eEoH9GrbmfGTMU4ob82c1L/nmue48mCQp4l4re98i6dzl5imW/cRCjx+lwdxA7rGq/OiY24I77Ej3m1r861MByiXNrmDayCoKM3WO+053G9l1AdZeWRiVYVSuBhOzbfi5ZIJ3ncaZqeobc7x5BdyJspkna9YotBj2njF4wq1fauEMG4f7gbjO3ZRIJifGVWJntOFvBj4aqn1j3WcsbJeAXNVpS2L+Tq/8caVH1vwe8gckWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEi1mUs+yMYzBFMl1OZ4B4T6FbNCx4MOqNO8IirKBNs=;
 b=PNAoPh4kX6Te8Ahe1m80Hl3GJDnrrMAsRwWkb49WSe/0skPkO8b0T/EMvVD7gBcBjDyDFQ6zlKZ1arOrWUPTs7LuMHUhet3F+DU1UvFNcykvenUo1Mi8mK7YtLw80bObd8YfayRTwjMlx85L3OtWKiigH3yyaxLdtyHzmFp1wvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 17:09:48 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6755:9455:2407:ea3e%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 17:09:48 +0000
Message-ID: <90e62dcc-49f2-84d7-d845-1d05c9f3dd08@amd.com>
Date: Mon, 28 Nov 2022 22:39:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] drm: Optimise for continuous memory allocation
Content-Language: en-US
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20221128063419.101586-1-xinhui.pan@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20221128063419.101586-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::6) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 574d9731-0292-4724-e1d2-08dad1635afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwvPbzDFmmbeaMcVqmaykF6a0GQAk6SXLy/ybapP/e474xtXSgDfHeLgO9PyqibmULCR1nEmSfe6SCP45wyP3crqD2yFlOQkkxQOHVCPye6jvrl6y3uWu7Li2Qep9sbt7XRIzGfpKlBeEwGzMFsnomA2yN8uQKYd0JZ+eWYLHNdtRDBKN31agnZSLZ+wuarDV5BXo8E75lOfhi3AcfbgY5DTPRY+G9Dc8bylQq3Z7BSb2Wun6Orc1VOgP277HrYHHzr1NgcZ5qqvhwjipXmal9inJzAjjmMGb4ftHmehiaftJS4hya0U8bPVrHKzeMpuepYEdqU8wzBHaq9rEIsWv7FYelyRMgBpiSpnot2nOgm+6JMD9Pz+XULAEr7BL2WorayiMsCBocALoYSEem5DcMoXAGuHepPnYZv3Y1GMHRcLpQ/0B68Bs1XOfYdnkHIAjeSazCgIPo4bPzp5gLcYFfIEUZG9ZhajlAMdHDeC7Sitr6OO1a905nqTK551nuuB4ADqEAmSV8zQEq0mzmGyrbX3oBgZRbsVZ6EdtaJ0O3nS6TH2i1sko4JsX0Oe9L3fLJrn3q63a5jgFp+UvthD2zYgn1OZgwDXwwTPv92+GJ59GaiWgHRKpz68NPBsz6cil/xwr8IiU850wyA9up2BVKzIDlcJ+SQi3HN3c7uOZ7h8Zpd5AoPtTsmOfKUvL3JWkNd8IkQiDuH5XJRKM3sjNbIxayZuE1eUcGkEurANfao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(2616005)(316002)(41300700001)(66946007)(66476007)(4326008)(8676002)(36756003)(66556008)(5660300002)(53546011)(83380400001)(26005)(6666004)(6506007)(6512007)(186003)(31696002)(86362001)(6486002)(478600001)(2906002)(66899015)(38100700002)(31686004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJoa0xtRFVtT01POU9QcWJyb3lodVgyMDFFSzVrbFRKUUdyM2IxL3YwRlY2?=
 =?utf-8?B?Rjl4cDA2NVBrVlVmeW1WNXRvdzdKNlFZa2xESmIzRGNacFBqWE1vMGZtMUJq?=
 =?utf-8?B?NkQ4OXlCbFlCT2kxczA4UmRiYjZJWVZVUEpVcEpmVUNTMWpxT2V0d2x5MU5i?=
 =?utf-8?B?UE16aW96eXNHYTMzeGk1S0cvVjJ4Ti9PNG1FOWpRUzk4aHpwY25KM0ZMakFp?=
 =?utf-8?B?VE1JL2F2SUp0Q04rSldFT2duOWdoUnNxZjVLclRLU2drQ054WWVWNmoxeW4v?=
 =?utf-8?B?eks2WHZlNjVDTURxM3dON2czUEVJaUVpUTl5eVdvR2JROUx3Q04xTjhuKzVq?=
 =?utf-8?B?ZTU3amJYL2Y3dVc1TFFkSGtLWTNXSCswbFc4QUcrR3UzVzJzNmNxOW1qWG9u?=
 =?utf-8?B?S3FrbHJJb2FKenRjaUhVNXFvVDRFMVZKdElxSEhSRTFGZXoxamdKSWVNek52?=
 =?utf-8?B?ZU5mNS9XUnJTdHcwdnNUUmk1RG8zdVU3NVNtWEZmdWt2NzRDRjc1WHlPZ0hI?=
 =?utf-8?B?a0ozWjN6eFFSY1NhUStEdlVpNnNXeEZBc2RNQVAxUmdsNFlsWEpHeEZnSGJq?=
 =?utf-8?B?V0hvbXg0cG02Vm1iVGxLaGE0b255NlFVVURnWThYVWpLaG5LVGVsVDZ4ejlJ?=
 =?utf-8?B?TmEyMTJaVmpyVUVITloyQThrVDg2UG1TRG1aeWUyRUtqK3UyNHZCV3NBYnMv?=
 =?utf-8?B?dkFYbkM2QVp0T2JlaU5YWDVvcEV6UWNSMHVzY0Zha0FnS294RElQckFNTnJD?=
 =?utf-8?B?cnVmVklHajU5dGFLRnAra0VPdzFqZTlZZDZmNzZuZGZ0Q25STkttcDRlWERK?=
 =?utf-8?B?MjMxSEtrQlRWYnZSRjJDUUFNNUUyUkNiODB3TEtYYzUyKy80eHowa1E3Qll1?=
 =?utf-8?B?M2NPajBmL0hnWmpETHZRVkZTallJWmhQZW1PUTRqaS95bklEcEJGUS9lckVs?=
 =?utf-8?B?eHBCOG5rSmhmelUwQjMwUFd1UWU5NzZYY2I5a2VxR3JweVZxUXpzT3g2SCtW?=
 =?utf-8?B?NU9Fd1BNRDk2bk9IZG5mVWpNcHdhejRoZUNKN0pBZDBDWTl1R0JyNTRHZlRB?=
 =?utf-8?B?Nmo2dm1RYy9IYU55ZTE3MElPYlBlZjNyUzVBdGtxV1gzM3c1RlNINktkUmRH?=
 =?utf-8?B?L2lBa240a2dZbzJiWTgwN1V4UXFIcldHcVVNcUN6U3lWajhkVU53b1YySURK?=
 =?utf-8?B?dU9hWE9ldFRIYXlzZnI1T2cxekErUGcvZjlKL28rSlZLdHZzbDhaMkNuVmtE?=
 =?utf-8?B?b3p0TWJEeFU3NXdlSm1Ed1BXazRlOHZlSEJieUE0YVdCTGxYSHZidnpZbTAr?=
 =?utf-8?B?TlRSMUxxd0VtbURTcWpWM2VLb0NtWThjRStwRzhXbHJ2Q3NBaVd6NUdydzcx?=
 =?utf-8?B?M3RDUkI0ak1ibUJHYzZ4ZDRUWjRjeWh6SmppYW1ybm11VVluYjJVTHcydi94?=
 =?utf-8?B?Njh5SkNDRlgrQkVESlI0QVhrRHYzL29KaXE5MU9jSEY4cklhWUNRTEt0a1Na?=
 =?utf-8?B?QWkxeGRpQnltTTRZRkN4U29KUWhUZHRTZkd5SWtJUmh6aGxqZjhETE1vT0Zq?=
 =?utf-8?B?ZHovcXlKc21RaUxGODNyTUpJcFg3YkpDb1BBQnJKNDJocHZoeklXaURwQVgx?=
 =?utf-8?B?eEt2WDdXVFRUSnVsTDhqWHozRmhHSVpQbEpMZFI0cFdscHU4Zml2UWJmdVhw?=
 =?utf-8?B?WTVGUDNNZUw3dVllY2x5RUVDSFE4UGxhRVZETTJuZkZyRHZTaStSSFp5ZWlw?=
 =?utf-8?B?bFZsa21PaTVKWXB1dGxNdVJuN3I3WHRqNi82MlpDeGZxbHRic3BsenVNMFho?=
 =?utf-8?B?bXlsNU81dVNkOFlGSWlpUEl5RXJEYVBCc0JOT0pzaGdlOG9KRHBaaXhFNXpZ?=
 =?utf-8?B?T0dSSkhJcnBCTVIwWmJ1RVRQVmpRRDRMeHYxWnBVbkE0NjNWN3AzR3hWdEhN?=
 =?utf-8?B?M2xkbjlZRzErTmxNUHRKQk9YdmFqK0ZQTWlnOFM5M2picExIYWZhbXlRZlJp?=
 =?utf-8?B?VUVSTVZ1OGE2R1NxQ3BDZ0NWMWJqaVYyTDIwcFgvUG81QzBKY0ZLdWJ5OEZG?=
 =?utf-8?B?ODljUTJpb0dndUU5ZEE4dWkwUklBQ0s5QzRxSnZaM1FVVXNJREUyeDlwTTNO?=
 =?utf-8?Q?aEMxGHHPzBnnyqz9JJ5UT2vor?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574d9731-0292-4724-e1d2-08dad1635afc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 17:09:48.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2O6WfegHIVpz3ef48/eZZ2UYtefbq58JUeGTM2NU9QF535CDDtNcjtswly0A/oMB+JeYnpj2WIWeTpmBVzZlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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
Cc: christian.koenig@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xinhui,

On 11/28/2022 12:04 PM, xinhui pan wrote:
> Currently drm-buddy does not have full knowledge of continuous memory.
>
> Lets consider scenario below.
> order 1:    L		    R
> order 0: LL	LR	RL	RR
> for order 1 allocation, it can offer L or R or LR+RL.
>
> For now, we only implement L or R case for continuous memory allocation.
> So this patch aims to implement the LR+RL case.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
> change from v2:
> search continuous block in nearby root if needed
>
> change from v1:
> implement top-down continuous allocation
> ---
>   drivers/gpu/drm/drm_buddy.c | 78 +++++++++++++++++++++++++++++++++----
>   1 file changed, 71 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..ff58eb3136d2 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -386,6 +386,58 @@ alloc_range_bias(struct drm_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static struct drm_buddy_block *
> +find_continuous_blocks(struct drm_buddy *mm,
> +		       int order,
> +		       unsigned long flags,
> +		       struct drm_buddy_block **rn)
> +{
> +	struct list_head *head = &mm->free_list[order];
> +	struct drm_buddy_block *node, *parent, *free_node, *max_node = NULL;
NIT: We usually name the variable as *block or ***_block for drm buddy 
and we have *node or ***_node for drm mm manager.
> +	int i;
> +
> +	list_for_each_entry(free_node, head, link) {
> +		if (max_node) {
> +			if (!(flags & DRM_BUDDY_TOPDOWN_ALLOCATION))
> +				break;
> +
> +			if (drm_buddy_block_offset(free_node) <
> +			    drm_buddy_block_offset(max_node))
> +				continue;
> +		}
> +
> +		parent = free_node;
> +		do {
> +			node = parent;
> +			parent = parent->parent;
> +		} while (parent && parent->right == node);
> +
> +		if (!parent) {
> +			for (i = 0; i < mm->n_roots - 1; i++)
> +				if (mm->roots[i] == node)
> +					break;
> +			if (i == mm->n_roots - 1)
> +				continue;
> +			node = mm->roots[i + 1];
> +		} else {
> +			node = parent->right;
> +		}
> +
> +		while (drm_buddy_block_is_split(node))
> +			node = node->left;
> +
> +		if (drm_buddy_block_is_free(node) &&
> +		    drm_buddy_block_order(node) == order) {
> +			*rn = node;
> +			max_node = free_node;
> +			BUG_ON(drm_buddy_block_offset(node) !=
> +				drm_buddy_block_offset(max_node) +
> +				drm_buddy_block_size(mm, max_node));
> +		}
> +	}
> +	return max_node;
> +}
> +
>   static struct drm_buddy_block *
>   get_maxblock(struct list_head *head)
>   {
> @@ -637,7 +689,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   struct list_head *blocks,
>   			   unsigned long flags)
>   {
> -	struct drm_buddy_block *block = NULL;
> +	struct drm_buddy_block *block = NULL, *rblock = NULL;
>   	unsigned int min_order, order;
>   	unsigned long pages;
>   	LIST_HEAD(allocated);
> @@ -689,17 +741,29 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
> +			pages -= BIT(order);
> +			block = rblock;
> +			rblock = NULL;
> +		} while (block);
I think with this approach, if we are lucky enough we may get contiguous 
blocks in one order level down in RL
combination from the freelist?

Regards,
Arun
>   
>   		if (!pages)
>   			break;

