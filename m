Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD64B85DE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 11:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032910E61C;
	Wed, 16 Feb 2022 10:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14DB10E5F5;
 Wed, 16 Feb 2022 10:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwqtY98122kNPT1ZqVxx++1oimzWZzEbIHYwPgUvLicFInLNjZTpsMQpR24JHT8LEnd0JNiWIH2JWEazu7E3LSof4zfGRG0wXPdIWHVJtlvdOr7pVtLgXzGp9V850MECr+BTbheR+f4dPWVJluVEBUjD8x4K1tGS7YPnkLYRfNDbMHhysv3zn2LbcWvJBzbl+l/LhfAyBYclJq+uXCs2RaZmW4IZg0KC5Gg//jc9PhNQqGhlMZEZWbTehX7Nf5LIjdeYbodjLILe/O5bVgUOL/ccwxF/IdBWKrBX+gIYp5oo61LVFOQAIpitk9fL1+mQ5M2+iODRjT+zZ33dchioYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sbFq0v5be1qoUS2ZU3pehe+qp22T4mlbu9DFZSJfkk=;
 b=LHxoexSwdhxWk5krlbCSa96Am3jdaqwaB65nOLsdKcyndjbsmxBhWhkWOFq2f4D+8PEXmvvJYy5MBuR27ZKUki45yNxfxCkuZ/IO6S8SwfuTH4afYWcqHXomISlGEyyORN6uV/C+0V40CM6CD6dZo1rUdGFSc90WB6DEqpsITjBUVMTJP9np5a+5KuFGVCxZXj9Dp56kGmB4va4/U0NGmTseqRulBRsmt2bZWaaSqWNLcLXb30pqqB/pvM7/CxxtmICMQdWMtGOOmctwiUMKPAG+YtE5LreqaRjt5DSoD2mb7awm0+DD9SitQtWe/p1KqRbM4brYj82Ck5aAjgv5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sbFq0v5be1qoUS2ZU3pehe+qp22T4mlbu9DFZSJfkk=;
 b=l/vE9vyoi8BshHI8smEhuyYHWgdRMAB3auijFEGF6XLl+Ot6gOB0lONjS8XvcN6FSAdMWQ1vnqo/F83TQGCANzuexo7h1ixGPSTa5UxhMzsaVdJZPKMECaMr0IR+qpDnWFGP6dSOunvPqCVGojVMWQmd+2HSgdrt2/kUWeW98Ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1497.namprd12.prod.outlook.com (2603:10b6:4:d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.15; Wed, 16 Feb 2022 10:36:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 10:36:27 +0000
Message-ID: <11828cdd-8d7b-b9a2-5a8c-ee0eac2f8aa8@amd.com>
Date: Wed, 16 Feb 2022 11:36:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/mm: Add an iterator to optimally walk over holes
 for an allocation (v3)
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <30de1989-6fee-d94a-7d99-6a3a8c59659d@amd.com>
 <20220215222352.867195-1-vivek.kasireddy@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220215222352.867195-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 112c74d4-9e9a-4a0b-bfaa-08d9f1382feb
X-MS-TrafficTypeDiagnostic: DM5PR12MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB14970380C881FAB8758BFF2083359@DM5PR12MB1497.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YrBRS6y1JalGcZw+A6o2sSGqy24RH6yeXdJtFYIONEc/VzAlM9sIFRMmIiC2VmeGZOok9UFcQcgngngxnN10Y/xT/lzc8PmM5EnGXHFK540vhoJHit1QY6Eua38pYOxda75gmMvQLye5JJMij5H36dOFQl3aecMHVMeERhHYOCdYMHxbAtAHrOP//YRGR6a2iapze2CosgmurOKCePjcKB1FrqlsxKkbfOlsKwMvOIwlqpDla/K3aTzYxqjAmbDIuRSNTAuS1J88g20UiCVureVP3lVNYSXVXJCnBFFJRAEdMCoNhGGFe0qfpbZcQpkSKQfszu+WA+bL8xzp8ljKFej5PUDcDJjrK5+lYfwo+ZIRXjrcV5GqhwS+3WbGoLCvbdmPnal15wHXilttdPl1OJgdWI/U9Dgc9Ug64TR895MelqSzl59V4egUZZTjcshYNmoms9QAg6Pxgox9CSfAoqwlH3fr7XACILza6hSGYrfOd73yiV26PXm6Y+uSuUqL2qr1nrbh3Ik3hU8rgUOhPCHCzxEjiYkZdwMd/S4p00X3v4KM30SXwohYgBi7iPOXr1B/+vLyYbMwCXxoZouUcN4C8BjJrhEq62dLLeiJsEs4/YllwHhrst8ZOkVcDqAfqgoaSyiCuAzj/esnFAF0rmK6MFpq08MkELNaEW74DuqwZIzcs6Azl4CqVSx+wqAejl/2wSXs/wMioYhxsuQ1zkIhjXnnQkOJ37ux+tK4EXN+tn0clcGVzwI09pQqjzg0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(36756003)(186003)(83380400001)(26005)(8676002)(2616005)(66946007)(66556008)(8936002)(66476007)(86362001)(38100700002)(316002)(2906002)(31696002)(6486002)(508600001)(5660300002)(54906003)(6666004)(6506007)(6512007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVzM1pKOUMyZ2pmZ0gxQlVKZW13VGRlVDdOVWRvemVHTzRjakVCWEVxN1I0?=
 =?utf-8?B?aHZhQzBFTjllRVVGVTZHb3Nmb0F0dEl1Z1hHcEtDbHZZNDc5bUl1VG9oeEFR?=
 =?utf-8?B?OFc4VjM0UWxYM3dDU2NsRlRlZ3p3ZFcyNzM0YVhzSXJDMC8zNzRLY0ZJc1BO?=
 =?utf-8?B?anpBdHM3OXo2Y01ZaVRBMGRGakh3WUlTSHEvekJRaSt3V3JaVlhzd2hzcHVD?=
 =?utf-8?B?TkZUUnpURndLUjAyR0dnKzRNdnNkMWJkSFN5SndKams5QXBlRGR6cmpUSy9N?=
 =?utf-8?B?WmtFNDQvaHR5WXc2WWl6UDl3Rk5icGsxempBaDdNZXYwb3BMbWZCWjRNMk4r?=
 =?utf-8?B?YkdJVzV2WU8ySExZaW1QYnBXYm41NzhTNkg3amU2NkZOak9HdXg0UnRaYXZX?=
 =?utf-8?B?aGkxblc2dkFORDNEeThMK1QrbHdHTGlaMWlnVENSKzgwV3NuWnN0dnh6WG9Q?=
 =?utf-8?B?ZlEwQVFEUm1BREFtdWF4dUJQR1J6eG9KKzJNeGVtUlJObnVORndHaFZBOXBB?=
 =?utf-8?B?WkRwRFdlc1l3YllaeDNQU0dwV0tGTzVGcEdqdTBMaVFaTDc3M0NMemNBQ2lr?=
 =?utf-8?B?L3hmVnlkVTVpTzV4VEpZZm01dzE4MXVlQUNMQm5Fc3ljSTZuOC9PbElEQlJp?=
 =?utf-8?B?d011d2FNSVNlS3ZCdmF6Rng4NXU0QXRRWTlrMmY5SU9pOTljaWFhdk5yYnEv?=
 =?utf-8?B?Q2ZLcHplZDgxMW8xV2pBVkFPSVhkREwweFlWcTlhUFNGSFlmanpIL2tGR2h4?=
 =?utf-8?B?SUhpMDErNDBHMDgyRGpQSThOL0Rpc0JXNVVlTmpjakI3MWNvZzNlRlY3bjUy?=
 =?utf-8?B?Z0w4VFR6aTVYbExXa3huQmIydjA4OWpvT241VDNjQk9DS084VGRrY3ViYmVZ?=
 =?utf-8?B?WFVqYnNQZERlbGtCc2FpUlFXNXpjWWRhODZLMGhHMjl5QzREcktZRFBVMGFG?=
 =?utf-8?B?Uy81b29IL3QvZWF4K2FCdDNrOE5GNWxtVlRMMlFIVldHRkQ4RERTd3RTUGlV?=
 =?utf-8?B?TlgrU2RIZTdzbVJseEIxclFGZmVsd1FIU3VBQ1o0a2hEK3BUZWlPY3owYktG?=
 =?utf-8?B?OW5zT3hMTHJlQnFldEFBei80MDVhVGJvVVR4aTV5cmxCRG1aV2p5OWVzQmlj?=
 =?utf-8?B?aDQwYm9zeGRPL3JvSjQ1SFJNNy9vTHBFUU9YZEJhRnhUbmZZbGtpRVhla3ZF?=
 =?utf-8?B?VElBd0pRQ2VDWDgybVFTRGN4dXRESUFPMS9YYzUzaVJ0bFRyd25GM1hFVTRV?=
 =?utf-8?B?RmNNdTdVVzBncGF3UTlXN25QQ0VNT21sbjRwU0pWakZWQXBNVFZSZjFIUHAy?=
 =?utf-8?B?YTZndlJoOStXNGVLYjhTVjNQbHM5OVJudnJoWGRHbW1halk3bWZ4UURBclIw?=
 =?utf-8?B?NkRodXU1Um5DdDk1SS8yaUxScmVqb1UrNFhoNXRxTzR6QXJLL3VMU3RPV3Qw?=
 =?utf-8?B?aVZ5T0IvdzNvK3YxUkl3ZjFWNmIvTk1vcW5uZklWa3drRGhwS1lETzcrUjJZ?=
 =?utf-8?B?am9GSWNpcTZrVjdrbkVKTG5hUkdiaGJQTjIzTGptY3c2MVRWNE95ME8xRzZa?=
 =?utf-8?B?aUVqSEhrNkRqYUhKUjlRMlAvc3IyVEp5SUNPZGk4R1ZPOUFkRGF5WjZ5a0pM?=
 =?utf-8?B?eEN1UTBNeXRJYjRDRmlqb0dSV1JTeDQyODIzS0VqZHhHRzg0cGFkeCtlYzBt?=
 =?utf-8?B?YVZnMWNZOHhOY3k1Z2xoUmJSdCtLZHJianpjeS9hMGhqSDUrRTVsRFFaRVV6?=
 =?utf-8?B?YWdaYVp6ZU52bzc1NmZJMXQ5V1pUQVJGUi9ZeTZxRHZuREdFamZ6OW1IYjB6?=
 =?utf-8?B?YmZjWTJEQ2RySDFhZ21kN2NKdWpTTEZ6eW0reGJWYmlSQi9rMzJvellRNnlG?=
 =?utf-8?B?aDZsVnpGM0xvUVk4d3VpaStXSW9KVktueVB1NSt3T1pEaGM4bFlNejg5RmdR?=
 =?utf-8?B?ZXkrcDlFRjFsWkhYdk56OUs0bG5yVnBFTEZDZVdtZWJReHVYU2FFQms2UUNr?=
 =?utf-8?B?aVFmRmhXc2ViWEtqSXd6K01MVklreGE3RCtxcjNlZjloaEZHR1kveWxuWjVF?=
 =?utf-8?B?M2RsV3FGOE03WWFZSEFtbGJPdFI4OWZoZ0tabE9Ja01hOGpPejNIdjNvV1Q4?=
 =?utf-8?Q?r2SA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c74d4-9e9a-4a0b-bfaa-08d9f1382feb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 10:36:27.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuUMwYYjrr+AV6J2q+3mO0UPN2pb8GHcCLdq5XQ/FoNkzlifj59PLsY24ywY49vT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1497
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.22 um 23:23 schrieb Vivek Kasireddy:
> This iterator relies on drm_mm_first_hole() and drm_mm_next_hole()
> functions to identify suitable holes for an allocation of a given
> size by efficiently traversing the rbtree associated with the given
> allocator.
>
> It replaces the for loop in drm_mm_insert_node_in_range() and can
> also be used by drm drivers to quickly identify holes of a certain
> size within a given range.
>
> v2: (Tvrtko)
> - Prepend a double underscore for the newly exported first/next_hole
> - s/each_best_hole/each_suitable_hole/g
> - Mask out DRM_MM_INSERT_ONCE from the mode before calling
>    first/next_hole and elsewhere.
>
> v3: (Tvrtko)
> - Reduce the number of hunks by retaining the "mode" variable name
>
> Cc: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Of hand it looks like it does what the description says without any 
functional change, but I don't know the internals of drm_mm so well either.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_mm.c | 32 +++++++++++++++-----------------
>   include/drm/drm_mm.h     | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..8efea548ae9f 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -352,10 +352,10 @@ static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
>   	return node;
>   }
>   
> -static struct drm_mm_node *
> -first_hole(struct drm_mm *mm,
> -	   u64 start, u64 end, u64 size,
> -	   enum drm_mm_insert_mode mode)
> +struct drm_mm_node *
> +__drm_mm_first_hole(struct drm_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -374,6 +374,7 @@ first_hole(struct drm_mm *mm,
>   						hole_stack);
>   	}
>   }
> +EXPORT_SYMBOL(__drm_mm_first_hole);
>   
>   /**
>    * DECLARE_NEXT_HOLE_ADDR - macro to declare next hole functions
> @@ -410,11 +411,11 @@ static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
>   DECLARE_NEXT_HOLE_ADDR(next_hole_high_addr, rb_left, rb_right)
>   DECLARE_NEXT_HOLE_ADDR(next_hole_low_addr, rb_right, rb_left)
>   
> -static struct drm_mm_node *
> -next_hole(struct drm_mm *mm,
> -	  struct drm_mm_node *node,
> -	  u64 size,
> -	  enum drm_mm_insert_mode mode)
> +struct drm_mm_node *
> +__drm_mm_next_hole(struct drm_mm *mm,
> +		   struct drm_mm_node *node,
> +		   u64 size,
> +		   enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -432,6 +433,7 @@ next_hole(struct drm_mm *mm,
>   		return &node->hole_stack == &mm->hole_stack ? NULL : node;
>   	}
>   }
> +EXPORT_SYMBOL(__drm_mm_next_hole);
>   
>   /**
>    * drm_mm_reserve_node - insert an pre-initialized node
> @@ -516,11 +518,11 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   				u64 size, u64 alignment,
>   				unsigned long color,
>   				u64 range_start, u64 range_end,
> -				enum drm_mm_insert_mode mode)
> +				enum drm_mm_insert_mode caller_mode)
>   {
>   	struct drm_mm_node *hole;
>   	u64 remainder_mask;
> -	bool once;
> +	enum drm_mm_insert_mode mode = caller_mode & ~DRM_MM_INSERT_ONCE;
>   
>   	DRM_MM_BUG_ON(range_start > range_end);
>   
> @@ -533,13 +535,9 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   	if (alignment <= 1)
>   		alignment = 0;
>   
> -	once = mode & DRM_MM_INSERT_ONCE;
> -	mode &= ~DRM_MM_INSERT_ONCE;
> -
>   	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
> -	for (hole = first_hole(mm, range_start, range_end, size, mode);
> -	     hole;
> -	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
> +	drm_mm_for_each_suitable_hole(hole, mm, range_start, range_end,
> +				      size, mode) {
>   		u64 hole_start = __drm_mm_hole_node_start(hole);
>   		u64 hole_end = hole_start + hole->hole_size;
>   		u64 adj_start, adj_end;
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index ac33ba1b18bc..777f659f9692 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -400,6 +400,42 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
>   	     1 : 0; \
>   	     pos = list_next_entry(pos, hole_stack))
>   
> +struct drm_mm_node *
> +__drm_mm_first_hole(struct drm_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    enum drm_mm_insert_mode mode);
> +
> +struct drm_mm_node *
> +__drm_mm_next_hole(struct drm_mm *mm,
> +		   struct drm_mm_node *node,
> +		   u64 size,
> +		   enum drm_mm_insert_mode mode);
> +
> +/**
> + * drm_mm_for_each_suitable_hole - iterator to optimally walk over all
> + * holes that can fit an allocation of the given @size.
> + * @pos: &drm_mm_node used internally to track progress
> + * @mm: &drm_mm allocator to walk
> + * @range_start: start of the allowed range for the allocation
> + * @range_end: end of the allowed range for the allocation
> + * @size: size of the allocation
> + * @mode: fine-tune the allocation search
> + *
> + * This iterator walks over all holes suitable for the allocation of given
> + * @size in a very efficient manner. It is implemented by calling
> + * drm_mm_first_hole() and drm_mm_next_hole() which identify the
> + * appropriate holes within the given range by efficiently traversing the
> + * rbtree associated with @mm.
> + */
> +#define drm_mm_for_each_suitable_hole(pos, mm, range_start, range_end, \
> +				      size, mode) \
> +	for (pos = __drm_mm_first_hole(mm, range_start, range_end, size, \
> +				       mode & ~DRM_MM_INSERT_ONCE); \
> +	     pos; \
> +	     pos = mode & DRM_MM_INSERT_ONCE ? \
> +	     NULL : __drm_mm_next_hole(mm, hole, size, \
> +				       mode & ~DRM_MM_INSERT_ONCE))
> +
>   /*
>    * Basic range manager support (drm_mm.c)
>    */

