Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EF41308B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 11:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDAD6E917;
	Tue, 21 Sep 2021 09:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8D6E917;
 Tue, 21 Sep 2021 09:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BECq7fjElLyVd5YxVdju5NdMn1u/VIdCJKEgj2b8KTe7XS1c6LJ5709CNizhpOto3bmi3zXdOa7ymQxgIkl2XWx+tw7FAwoCA78v5sLkOlJhNzav0I+5FZIC8ysZtfT/TLSBIDMKoBPas+lzXPi4HFtoDZtaFEFX3n8oc4V+hiZeQysTVj9lKQsdr83Ec0NXsderqhSwWh5bcgUZV2WJaAW9aoEWbYa5FW/nTomrQX4B+f93eUf1f8EUInKbuL8KY5JMx0mx4vN2/9vabMQIrm0wQT3yRIfpF3HRfeMDfutAOkAW9HdtkL0dPfQTgyyMYA9V8SpQ59S4Zbd91feZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=exudtGDs5OvHSo9SFsyEIp8suCZw6KezHElg+dbCuJE=;
 b=N0zAF6JGHHoarnaVs4GTb9YlAMq+EzvnjLc/JKI8tGWGfrpEivLhLgKHtuT0b3dkQZ/pV5Hg33wcqRF8PnnPkCFoTsaVCcG4QEbNcpQ8TvqnEYzS0VQGWkUu+szTBqMUrfiR7sTOsXHHzmfgNAczMgy+GPt4AnZEx5FkahmkxFygtPlwsyGZTmIOLQPDqD1cuZIxLoWMP8KXAn+cRmrn+vEIAqLLm3+wrvepIZHTD6NPW/rPT6HEAgvFidqnB0NacBZGBpw6/5i74NVLX+BSDLo12w+KOTvHEcj0MZSG0HCs9a+JbVs7MQe5U22X0PwjCEw5F2A5S9iaGK/oXZQEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exudtGDs5OvHSo9SFsyEIp8suCZw6KezHElg+dbCuJE=;
 b=Qt3fAjtt3oHlBFn8kQ8FqVDdO7gugr47KyPlMbaCSYijFl8iLqAhiOqL2yTPxH+yZhfqJ9BouzfwuCB9F800TjD6tjG64rF+SElupG4W7FyCDtbegu8IhdTTlbcn5MJexKH+oMtek7bTAPs4CCIh+HzVP9q5DleiVBh4b/WcAf8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 09:04:32 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 09:04:32 +0000
Subject: Re: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, matthew.auld@intel.com, daniel@ffwll.ch,
 alexander.deucher@amd.com
References: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <adf913fd-da60-70b5-2a83-608d8b8b9cba@amd.com>
Date: Tue, 21 Sep 2021 11:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:9e25:63a7:d115:3eab]
 (2a02:908:1252:fb60:9e25:63a7:d115:3eab) by
 AM0PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:208:d2::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:04:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a963c58-8f3c-4dac-88ed-08d97cded37f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4565EDFAFBD7FEAB1C4C44FA83A19@MN2PR12MB4565.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0wpW0TQ4CQk7JF0gyR1Z5GRWchmUyQSL2VtJ70a87v+c2no1n8wKrRiwkc7rYmwJKGNg2XpxSdX+vz5woXhZQF6lOv2A0Cv1FyUcCVCFD17MjatlhidwvKmuzh++6PEHPelWo0crdooAzr8OuBSdlG9YkgSjL60bM96uFYiJVeJlQbLk1e6V3XVUAxWv/CcZdGHfrhF6z3dOox+AweYAzpKLgXYjZTzmih8nec2XAMwXegmMz/xztZC13xFi0TRIxQ9ny5zdRhaSthq2DP1urVE0+LVEN44RmJE88N4ZDB9nlcyaIUZnCvteagUx3E9K+dpFLielAQ88dHd2iuR4pta2c3vMFJn7nk/cEjQ/T667xq1iZouUlGjzjy7UYEAGDzrwGpVpiUTS4Q/igBdBUiYq/VZui+yXMrVUjxGQOCIDnPoj9tTNkPgJmOgeR0HB53PVXrBm+oX9gKpNlmJZ9rkvJmSYVKR+ryB+FnjwX/In29NEwQGuBXbi0n+sSXt+uod12WpOf+/jMNtl7qnN/hUqwilaGixmWJOerNnGkVoxu+qMUZdNoYTRc5TOozwSr6Rb86uK2TL44gD+NGiqmZdDekF+VgSSLykv11AVjvz5Js97JKpEwolLTidt3fzNlNzty/r4o4ei9KVVpeiWtIyPVEyqwAUKkaRSKo/OV/apJK3F6m1UWB3HAVnNa1uajoMIy6qzDejbEq3of8G99E8jrE9JPyL0ejHoSHeMVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(2906002)(316002)(508600001)(86362001)(6486002)(5660300002)(6666004)(38100700002)(6636002)(83380400001)(2616005)(31696002)(66946007)(31686004)(8936002)(36756003)(66556008)(66476007)(8676002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtvanhlMStBMCtEdk41dklJRUhZNXhoam94bmVzZFd6MDFnLy82TjhSd1Iv?=
 =?utf-8?B?aHBPYVdlQVh0RnNzcjEyeTBSKzVzSWNKY2dOb2RLR1lYNTNPRHNXK2dTNmNH?=
 =?utf-8?B?QlVFTUpWaGs4aTVQS0kzWTdWc3VMSmNsZnJoSkNnb29Wa3JrSjNrUk15cXhT?=
 =?utf-8?B?UVlQY2JpMkJSQTl3NWdia1ViWVdQRk9xS0M4UmExSS9kZGprcmJtRFFvSkk5?=
 =?utf-8?B?ZitxRUxBV1Y2UkloZVp1YVpJcFRLUzBmYy9QVkNwNGhRNUx5OFc3UzJsVkRX?=
 =?utf-8?B?dHdxUElpOUJZcmJuNUx4TzdlRnY1bzlmZ0ZZR0xucCtCU2V2b1dYMzREdExQ?=
 =?utf-8?B?RkROSkZtenJObkJYZG1YNzVlaFBSdklvL1FwTFBhYXVEd0ZXMHV6YWxETXU2?=
 =?utf-8?B?a2MvVGVPblRxVnBLay9rSkJESitoZkRDU1BKR21iblBuaEVkM1VBV1g5aUlR?=
 =?utf-8?B?VTNoaTU1UDg1Z2xDSjVubE1qOFBLVUlMeTZBdjFSMEpEYkVFaDB4dVlUWGxB?=
 =?utf-8?B?RGRwRFhPejdRVzgvMXhLN1pUTnhwMUNOUUdiMytzTzdpLzRwVExFMzlTK2Vx?=
 =?utf-8?B?WlNKcXoxOHdaWXYyS094eWJrdTRsb2xTVXB1eTNjYXhucXBRWDNPekRCQzYy?=
 =?utf-8?B?V00zWkJFQVVLOGY5OTF1ajVDNWdlVmNVbklpOEREcmlDcGEycTU2b0YwVVA3?=
 =?utf-8?B?ck9FTDA4dHo2Mjh5ZFBaOEllbE12L1JEM3FjenJkNVRaZGJSMnpwWkFQaGht?=
 =?utf-8?B?MjJ1S01tbWZOODFDNy85cVc0TDhiZHZ5VVdWZ3VXaDl6RWRjZWcrQWJBZUY0?=
 =?utf-8?B?aVZpMW5ORDhFOWNwa0FiVXhGTnFnZ3ZOYXorSG16UDUvZWxQNzRsemo2RW04?=
 =?utf-8?B?SkZuMUc5TmpJYTZHa0k3TjNqT1pHNjFDMUJJMFhqMWVIVG1QSjRTVVFDNzNJ?=
 =?utf-8?B?S1ZlZk53K21aTGhpYlJ6MDF5ck9RWCs1RXd0VG1TU1BzWWgrZVA0UkRtM0lk?=
 =?utf-8?B?NXdrRS92aFkwV2F3aThHNmN2Z2VpY2lnc2VyeDFmc0E3bTEvNFVPaDd1Z3d1?=
 =?utf-8?B?ZGxGLysxWTZ1Q0Z2bDZ0RTVZQlIrcTJNZS9zOTQzSU1wZ0Z1YzZkbkJYcC9M?=
 =?utf-8?B?WmR3SlpzZHlDVllNeTlDR0h3Qm1SOUpPSjVISWxlMVh3bE96VnlVL3hCRGxX?=
 =?utf-8?B?V0FsNXJ4WEkwZU1Md2FiZjlxNWRtdUtNUjlWLzNrV3FBbGtDa3ZuamVBZFhu?=
 =?utf-8?B?SGs5cmVJdk9XS29HTW5WR0ZMODk5T2tzWVV0KytJVlpLcHloNWhINUlWbEs1?=
 =?utf-8?B?WlZwenRCSzNVQzBxaWZyS2h0cVZrS2NsU2dha0N0MlJTWDFja3czWndnalBG?=
 =?utf-8?B?bUloRUY1ekp6bHJIVm9KL2s4OS9UYnhnWFNWcFh1YTZWQjhYNnYvSDVoMGRt?=
 =?utf-8?B?VDR4RVF0RHNhbGg1aXJYQ3pLWC8xMG42VnRUbktYQmFOK2trN1AvVlNGNm83?=
 =?utf-8?B?cTlaYm5yRXZMTEdEZVd4Y0R0N21JdWZ0NmtuRzRQSkdQWDRENVBYRkp4MHNT?=
 =?utf-8?B?SFdwMVJaUWFDV0lmRFJaZTVxUjFwOTNiMlVoU0JvVFl2TU84MW1NUGlyOS9u?=
 =?utf-8?B?aEtHVlk2K2lPUC9oY0xoa3FvRmFiMXIrZmFWMThjRXVid0lZOGpka2g3dHM5?=
 =?utf-8?B?WHFzcjFnTTExMVFBdUpNSmVSZkRhTU9ieWZacU1HK3lrSm41ZC90dE5DZGpU?=
 =?utf-8?B?YVdWU3YxOGJ0d0tnNVRwR093aDBwaUZiVWt6VlloV21peTIvaWpxczdpMC9R?=
 =?utf-8?B?d0s0dDNLdGVBeTRjY1R6V29adjRaZ2ExbFVIMUxNUVVGNk10UkZVZmlDVFVW?=
 =?utf-8?Q?StcUOu1U0FeX9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a963c58-8f3c-4dac-88ed-08d97cded37f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:04:32.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7WV9gLbH7AGr4T1epM3Wgvhsqsd9VKSAaOnXQUUoRSAubxU9S5spcFA6rPce1B/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
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

Am 20.09.21 um 21:21 schrieb Arunpravin:
> Replace drm_mm with drm buddy manager for
> VRAM memory management
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  78 +++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 216 ++++++++++--------
>   3 files changed, 189 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index acfa207cf970..ba24052e9062 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -30,12 +30,25 @@
>   #include <drm/ttm/ttm_resource.h>
>   #include <drm/ttm/ttm_range_manager.h>
>   
> +struct amdgpu_vram_mgr_node {
> +	struct ttm_range_mgr_node tnode;

NAK, don't base this on ttm_range_mgr_node. Instead use ttm_resource.

And please name the member base instead.

> +	struct list_head blocks;
> +};
> +
> +static inline struct amdgpu_vram_mgr_node *
> +to_amdgpu_vram_mgr_node(struct ttm_resource *res)
> +{
> +	return container_of(container_of(res, struct ttm_range_mgr_node, base),
> +			struct amdgpu_vram_mgr_node, tnode);
> +}
> +

Maybe stuff that in a separate amdgpu_vram_mgr.h file together with all 
the other defines for the vram manager.

>   /* state back for walking over vram_mgr and gtt_mgr allocations */
>   struct amdgpu_res_cursor {
>   	uint64_t		start;
>   	uint64_t		size;
>   	uint64_t		remaining;
> -	struct drm_mm_node	*node;
> +	void			*node;
> +	uint32_t		mem_type;
>   };
>   
>   /**
> @@ -52,8 +65,6 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   				    uint64_t start, uint64_t size,
>   				    struct amdgpu_res_cursor *cur)
>   {
> -	struct drm_mm_node *node;
> -
>   	if (!res || res->mem_type == TTM_PL_SYSTEM) {
>   		cur->start = start;
>   		cur->size = size;
> @@ -65,14 +76,39 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   
>   	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
>   
> -	node = to_ttm_range_mgr_node(res)->mm_nodes;
> -	while (start >= node->size << PAGE_SHIFT)
> -		start -= node++->size << PAGE_SHIFT;
> +	cur->mem_type = res->mem_type;
> +
> +	if (cur->mem_type == TTM_PL_VRAM) {

Rather use a switch/case here.

> +		struct drm_buddy_block *block;
> +		struct list_head *head, *next;
> +
> +		head = &to_amdgpu_vram_mgr_node(res)->blocks;
> +
> +		block = list_first_entry_or_null(head, struct drm_buddy_block, link);
> +		while (start >= block->size << PAGE_SHIFT) {
> +			start -= block->size << PAGE_SHIFT;
> +
> +			next = block->link.next;
> +			if (next != head)
> +				block = list_entry(next, struct drm_buddy_block, link);
> +		}
>   
> -	cur->start = (node->start << PAGE_SHIFT) + start;
> -	cur->size = min((node->size << PAGE_SHIFT) - start, size);
> -	cur->remaining = size;
> -	cur->node = node;
> +		cur->start = (block->start << PAGE_SHIFT) + start;
> +		cur->size = min((block->size << PAGE_SHIFT) - start, size);
> +		cur->remaining = size;
> +		cur->node = block;
> +	} else if (cur->mem_type == TTM_PL_TT) {
> +		struct drm_mm_node *node;
> +
> +		node = to_ttm_range_mgr_node(res)->mm_nodes;
> +		while (start >= node->size << PAGE_SHIFT)
> +			start -= node++->size << PAGE_SHIFT;
> +
> +		cur->start = (node->start << PAGE_SHIFT) + start;
> +		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->remaining = size;
> +		cur->node = node;

With a default handling for other placement types.

> +	}
>   }
>   
>   /**
> @@ -85,8 +121,6 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>    */
>   static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   {
> -	struct drm_mm_node *node = cur->node;
> -
>   	BUG_ON(size > cur->remaining);
>   
>   	cur->remaining -= size;
> @@ -99,9 +133,23 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		return;
>   	}
>   
> -	cur->node = ++node;
> -	cur->start = node->start << PAGE_SHIFT;
> -	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +	if (cur->mem_type == TTM_PL_VRAM) {
> +		struct drm_buddy_block *block = cur->node;
> +		struct list_head *next;
> +
> +		next = block->link.next;
> +		block = list_entry(next, struct drm_buddy_block, link);
> +
> +		cur->node = block;
> +		cur->start = block->start << PAGE_SHIFT;
> +		cur->size = min(block->size << PAGE_SHIFT, cur->remaining);
> +	} else if (cur->mem_type == TTM_PL_TT) {
> +		struct drm_mm_node *node = cur->node;
> +
> +		cur->node = ++node;
> +		cur->start = node->start << PAGE_SHIFT;
> +		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +	}
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e69f3e8e06e5..96c8e8aaa0ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,6 +26,7 @@
>   
>   #include <linux/dma-direction.h>
>   #include <drm/gpu_scheduler.h>
> +#include <drm/drm_buddy.h>
>   #include "amdgpu.h"
>   
>   #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
> @@ -40,7 +41,7 @@
>   
>   struct amdgpu_vram_mgr {
>   	struct ttm_resource_manager manager;
> -	struct drm_mm mm;
> +	struct drm_buddy_mm mm;
>   	spinlock_t lock;
>   	struct list_head reservations_pending;
>   	struct list_head reserved_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7b2b0980ec41..de0c5f4cabaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -23,7 +23,9 @@
>    */
>   
>   #include <linux/dma-mapping.h>
> +#include <linux/list_sort.h>
>   #include <drm/ttm/ttm_range_manager.h>
> +#include <drm/drm_buddy.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_vm.h"
> @@ -33,7 +35,7 @@
>   
>   struct amdgpu_vram_reservation {
>   	struct list_head node;
> -	struct drm_mm_node mm_node;
> +	struct drm_buddy_block mm_node;
>   };
>   
>   static inline struct amdgpu_vram_mgr *
> @@ -196,10 +198,10 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
>    * Calculate how many bytes of the MM node are inside visible VRAM
>    */
>   static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
> -				    struct drm_mm_node *node)
> +				    struct drm_buddy_block *block)
>   {
> -	uint64_t start = node->start << PAGE_SHIFT;
> -	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
> +	uint64_t start = block->start << PAGE_SHIFT;
> +	uint64_t end = (block->size + block->start) << PAGE_SHIFT;
>   
>   	if (start >= adev->gmc.visible_vram_size)
>   		return 0;
> @@ -220,8 +222,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct ttm_resource *res = bo->tbo.resource;
> -	unsigned pages = res->num_pages;
> -	struct drm_mm_node *mm;
> +	struct amdgpu_vram_mgr_node *vnode = to_amdgpu_vram_mgr_node(res);
> +	struct drm_buddy_block *block;
>   	u64 usage;
>   
>   	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
> @@ -230,9 +232,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
>   		return 0;
>   
> -	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
> -	for (usage = 0; pages; pages -= mm->size, mm++)
> -		usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +	list_for_each_entry(block, &vnode->blocks, link)
> +		usage += amdgpu_vram_mgr_vis_size(adev, block);
>   
>   	return usage;
>   }
> @@ -242,12 +243,15 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -	struct drm_mm *mm = &mgr->mm;
> +	struct drm_buddy_mm *mm = &mgr->mm;
>   	struct amdgpu_vram_reservation *rsv, *temp;
>   	uint64_t vis_usage;
> +	int r = 0;
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
> -		if (drm_mm_reserve_node(mm, &rsv->mm_node))
> +		r = drm_buddy_alloc_range(mm, &rsv->node, rsv->mm_node.start, rsv->mm_node.size);
> +
> +		if (unlikely(r))
>   			continue;
>   
>   		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
> @@ -333,26 +337,16 @@ int amdgpu_vram_mgr_query_page_status(struct ttm_resource_manager *man,
>   	return ret;
>   }
>   
> -/**
> - * amdgpu_vram_mgr_virt_start - update virtual start address
> - *
> - * @mem: ttm_resource to update
> - * @node: just allocated node
> - *
> - * Calculate a virtual BO start address to easily check if everything is CPU
> - * accessible.
> - */
> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
> -				       struct drm_mm_node *node)
> +static int sort_blocks(void *priv, const struct list_head *A,
> +					const struct list_head *B)

Please prefix all function with amdgpu_vram_mgr_.

>   {
> -	unsigned long start;
> +	struct drm_buddy_block *a = list_entry(A, typeof(*a), link);
> +	struct drm_buddy_block *b = list_entry(B, typeof(*b), link);
>   
> -	start = node->start + node->size;
> -	if (start > mem->num_pages)
> -		start -= mem->num_pages;
> +	if (a->start < b->start)
> +		return -1;
>   	else
> -		start = 0;
> -	mem->start = max(mem->start, start);
> +		return 1;
>   }
>   
>   /**
> @@ -370,15 +364,20 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
> +	unsigned long lpfn, pages_per_node, pages_left, pages;
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
>   	uint64_t vis_usage = 0, mem_bytes, max_bytes;
> +	struct amdgpu_vram_mgr_node *vnode;
> +	struct drm_buddy_mm *mm = &mgr->mm;
>   	struct ttm_range_mgr_node *node;
> -	struct drm_mm *mm = &mgr->mm;
> -	enum drm_mm_insert_mode mode;
> +	enum drm_buddy_alloc_mode mode;
> +	struct drm_buddy_block *block;
> +	unsigned int visible_pfn;
> +	bool bar_limit_enabled;
> +	unsigned long n_pages;
>   	unsigned i;
> -	int r;
> +	int r = 0;

Please don't initialize the return type here. That's considered bad 
coding style.

>   
>   	lpfn = place->lpfn;
>   	if (!lpfn)
> @@ -395,10 +394,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		goto error_sub;
>   	}
>   
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>   		pages_per_node = ~0ul;
> -		num_nodes = 1;
> -	} else {
> +	else {
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   		pages_per_node = HPAGE_PMD_NR;
>   #else
> @@ -407,57 +405,97 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   #endif
>   		pages_per_node = max_t(uint32_t, pages_per_node,
>   				       tbo->page_alignment);
> -		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>   	}
>   
> -	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> -			GFP_KERNEL | __GFP_ZERO);
> -	if (!node) {
> +	vnode = kzalloc(sizeof(*vnode), GFP_KERNEL);
> +
> +	if (!vnode) {
>   		r = -ENOMEM;
>   		goto error_sub;
>   	}
>   
> +	node = &vnode->tnode;
> +
>   	ttm_resource_init(tbo, place, &node->base);
>   
> -	mode = DRM_MM_INSERT_BEST;
> -	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> -		mode = DRM_MM_INSERT_HIGH;
> +	bar_limit_enabled = !(amdgpu_gmc_vram_full_visible(&adev->gmc));
> +
> +	visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
> +
> +	mode = DRM_BUDDY_BOTTOM_UP;
> +	if (!place->fpfn && lpfn == man->size &&
> +					(place->flags & TTM_PL_FLAG_TOPDOWN))
> +		/* Allocate blocks from CPU non-mappable (TOP-DOWN) region */
> +		mode = DRM_BUDDY_TOP_DOWN;
> +	else if (place->fpfn || (lpfn != man->size && lpfn != visible_pfn))
> +		/* Allocate blocks in desired range */
> +		mode = DRM_BUDDY_ALLOC_RANGE;
>   
>   	pages_left = node->base.num_pages;
>   
>   	/* Limit maximum size to 2GB due to SG table limitations */
>   	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>   
> +	INIT_LIST_HEAD(&vnode->blocks);
> +
>   	i = 0;
> -	spin_lock(&mgr->lock);
> -	while (pages_left) {
> -		uint32_t alignment = tbo->page_alignment;
> -
> -		if (pages >= pages_per_node)
> -			alignment = pages_per_node;
> -
> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
> -						alignment, 0, place->fpfn,
> -						lpfn, mode);
> -		if (unlikely(r)) {
> -			if (pages > pages_per_node) {
> -				if (is_power_of_2(pages))
> -					pages = pages / 2;
> -				else
> -					pages = rounddown_pow_of_two(pages);
> -				continue;
> -			}
> -			goto error_free;
> -		}
> +	if (mode == DRM_BUDDY_ALLOC_RANGE) {
> +		r = drm_buddy_alloc_range(mm, &vnode->blocks,
> +				(uint64_t)place->fpfn << PAGE_SHIFT, pages << PAGE_SHIFT);

That handling won't work. It's possible that you need contiguous memory 
in a specific range.

> +
> +		if (unlikely(r))
> +			goto error_free_res;
> +	} else {
> +		while (pages_left) {
> +			if (pages >= pages_per_node)
> +				pages = pages_per_node;
> +
> +			n_pages = pages;
> +
> +			if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +				n_pages = roundup_pow_of_two(n_pages);

That approach won't work either. For contiguous allocation you need to 
allocate one big chunk and then free up what you don't need at the end.

> +
> +			do {
> +				unsigned int order;
> +
> +				order = fls(n_pages) - 1;
> +				BUG_ON(order > mm->max_order);
> +
> +				spin_lock(&mgr->lock);
> +				block = drm_buddy_alloc(mm, order, bar_limit_enabled,
> +									visible_pfn, mode);

That doesn't seem to make much sense either. The backend allocator 
should not care about the BAR size nor the visible_pfn.

> +				spin_unlock(&mgr->lock);
>   
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
> -		pages_left -= pages;
> -		++i;
> +				if (IS_ERR(block)) {
> +					r = -ENOSPC;
> +					goto error_free_blocks;
> +				}
>   
> -		if (pages > pages_left)
> -			pages = pages_left;
> +				n_pages -= BIT(order);
> +
> +				list_add_tail(&block->link, &vnode->blocks);
> +
> +				if (!n_pages)
> +					break;
> +			} while (1);
> +
> +			pages_left -= pages;
> +			++i;
> +
> +			if (pages > pages_left)
> +				pages = pages_left;
> +		}
>   	}
> +
> +	spin_lock(&mgr->lock);
> +	list_sort(NULL, &vnode->blocks, sort_blocks);

Why do you sort the list here?

Regards,
Christian.

> +
> +	list_for_each_entry(block, &vnode->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +	block = list_first_entry_or_null(&vnode->blocks,
> +			struct drm_buddy_block, link);
> +	node->base.start = block->start;
>   	spin_unlock(&mgr->lock);
>   
>   	if (i == 1)
> @@ -472,12 +510,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	*res = &node->base;
>   	return 0;
>   
> -error_free:
> -	while (i--)
> -		drm_mm_remove_node(&node->mm_nodes[i]);
> +error_free_blocks:
> +	spin_lock(&mgr->lock);
> +	drm_buddy_free_list(mm, &vnode->blocks);
>   	spin_unlock(&mgr->lock);
> -	kvfree(node);
> -
> +error_free_res:
> +	kfree(vnode);
>   error_sub:
>   	atomic64_sub(mem_bytes, &mgr->usage);
>   	return r;
> @@ -494,28 +532,28 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   				struct ttm_resource *res)
>   {
> -	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
> +	struct amdgpu_vram_mgr_node *vnode = to_amdgpu_vram_mgr_node(res);
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct drm_buddy_mm *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   	uint64_t usage = 0, vis_usage = 0;
> -	unsigned i, pages;
>   
>   	spin_lock(&mgr->lock);
> -	for (i = 0, pages = res->num_pages; pages;
> -	     pages -= node->mm_nodes[i].size, ++i) {
> -		struct drm_mm_node *mm = &node->mm_nodes[i];
> -
> -		drm_mm_remove_node(mm);
> -		usage += mm->size << PAGE_SHIFT;
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +	list_for_each_entry(block, &vnode->blocks, link) {
> +		usage += block->size << PAGE_SHIFT;
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>   	}
> +
>   	amdgpu_vram_mgr_do_reserve(man);
> +
> +	drm_buddy_free_list(mm, &vnode->blocks);
>   	spin_unlock(&mgr->lock);
>   
>   	atomic64_sub(usage, &mgr->usage);
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>   
> -	kvfree(node);
> +	kfree(vnode);
>   }
>   
>   /**
> @@ -668,12 +706,6 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_resource_manager *man)
>   static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>   				  struct drm_printer *printer)
>   {
> -	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
> -
> -	spin_lock(&mgr->lock);
> -	drm_mm_print(&mgr->mm, printer);
> -	spin_unlock(&mgr->lock);
> -
>   	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
>   		   man->size, amdgpu_vram_mgr_usage(man) >> 20,
>   		   amdgpu_vram_mgr_vis_usage(man) >> 20);
> @@ -701,7 +733,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   
>   	man->func = &amdgpu_vram_mgr_func;
>   
> -	drm_mm_init(&mgr->mm, 0, man->size);
> +	drm_buddy_init(&mgr->mm, man->size << PAGE_SHIFT, PAGE_SIZE);
>   	spin_lock_init(&mgr->lock);
>   	INIT_LIST_HEAD(&mgr->reservations_pending);
>   	INIT_LIST_HEAD(&mgr->reserved_pages);
> @@ -737,10 +769,10 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
> -		drm_mm_remove_node(&rsv->mm_node);
> +		drm_buddy_free(&mgr->mm, &rsv->mm_node);
>   		kfree(rsv);
>   	}
> -	drm_mm_takedown(&mgr->mm);
> +	drm_buddy_fini(&mgr->mm);
>   	spin_unlock(&mgr->lock);
>   
>   	ttm_resource_manager_cleanup(man);

