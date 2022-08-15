Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34010592DDC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 13:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB96793934;
	Mon, 15 Aug 2022 11:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98269371F;
 Mon, 15 Aug 2022 11:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZUKbMIyFAMocvsj5lxoatkaKAuNKMnMQp1/SMuzb7CPJjMTrCw+t8lto/rdHbR4NVVWSszJyH3ElmRDz8e9pD5pIIiruzNAPtwi5BAhnqImYMek+zF5mjBsc5o8QHQZFN+3qXhbna8hNxfyGIF6EsFE4lZK5XNRGgoNlnbO9j9mykkoZu8kjG+Mle8amC9JH222vL1GsL7mbJaS5JbpVP66xOVevp0eCoyY8tA0MgReMkOxflzluoRWhfiS4wTEMzr3GdBIy/qLc4ZyoPyrl1HhEh7rTGlhOk34cbFVNPC1ziTJWRaAVm2lNMYNAO5JNH+9QC2c1KqVGqiXWTGWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ8/tDEkPWhHWutR3h9R9mE/62j0OBIXtxXi1Bt6ZEk=;
 b=OsCm8w9tJL0o5pyAtpz9hIJpF2RzlRG6QjyFl4h7evS8jk0XCgGOXG2g/3tMCY3Xgk+y+ha0YUzzuSKHZjRNNfwiODdiBaqrIc5Be4ium8NUCZ8FRZjY9OTLHjoF/gkJONfWQYOgEjRWKXdVCHdFD+XU3yf0SC+hshp8R1tG5NBHj5o9G35O/1XWmnrZIUDYLD7r/BeGzxKStAQyyFokBCa6L+zfEtXXTcVI4KCsJ4ZvVRKceOKVAMw63IwuKKCgg/jbvj7zyLbQXjV1iRyGAOoW82E6fsoE5yK9qf5Ogyny1PtAORpxikFj3dtIeIwH7qIww8lYLA0cxT6Q84xiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ8/tDEkPWhHWutR3h9R9mE/62j0OBIXtxXi1Bt6ZEk=;
 b=vE9wtCPJkBe8RV2VU5bDwdstGGHNs4VGd8j5j+uuodPVdQMUiPNJiVOD97in9PadIdT5WI4oZKEJFPJvS3wvrXjYPksRw8/GSjm63rMTCFiayMXrNxaXEvmA8EdA28XxbIEouE2KIP/IANKPlzPoEaNP62LtH91KVgUTdAKYYwQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 11:05:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 11:05:13 +0000
Message-ID: <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
Date: Mon, 15 Aug 2022 13:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0149.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8057e092-6a0a-45d1-5196-08da7eae06fe
X-MS-TrafficTypeDiagnostic: DM4PR12MB6230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBka6YQqRD4KIiSxrYPEDbizJouhkl2DdftdAWsacMfC+5HGuynn7X5nMSEpl2UqBIDN6ewiMMh+zWAnpsRykOioU1zj10I3YCen8JZn7vcFPQ251MNALTBG6sQRp9uuA1xvsLXpnD2IP6hl16EBuxvlVCU+B3wqhFY14muuJElqia37RmniVzz4q0on6l/Z5Teze4B9qVbc7+HuW564J5QotztfAn0h1mCmxHqGH0iRAOs9zQ+5U4BRWvcTl56de87ZtDzjW/rT6oO12HsUtnFfs5JJqqqisUEHcEsBwGX/COF1q90yBgZytbIDUGaKlA7etou/i3IMjt5q2wh3jht8LZ2QMQjUv/AUE5HN+d6gKIa/7NCEQiOB2PPDNv1Xo7Gcxgmc6T869b1c9gsK5FRxDkr7dqwldpw4dmy5x0SjqIR6aPflZ6oLs+s4iwGKBiDa4QFN+GjpTFFDzq+A/o4hLfBdMkCkI1zqrcAFFuoeId0+qaKRV6VhEe90yLuvc92t1goliKs7pE/xda3ic3HEFEtkAM2EqmJp4ZkPYZiGNnCajA2Rsj9+Du+GACDQ0cXObu8tHZ7VK7SnV+o7XD9izPxEEWk0nrJMmi/X6DKeQVzsY5t2+d6jiYRR7f9iPSbw5CCMe+2CXAmxehlWxwusIbgWXh/adQk2z33oVv8AWsqkUHOsZOPRqA74S5kKnHcpNRIlfle9C8AePQBRNN1c4OPURGfwELQQEAOj15+D7pgCzFrXT9C/Cxv3ld+eHov5LMPf9AMK4acv6oDsYbdJlDiWs6GkhVEt1R/ScWcO6PPNtl+VsWQlQt54/UYYVUHD6jlCMKmi2jQj0Fj6Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(38100700002)(5660300002)(2906002)(66476007)(478600001)(6486002)(66946007)(66556008)(31686004)(8676002)(8936002)(6512007)(36756003)(6506007)(6666004)(66574015)(86362001)(2616005)(83380400001)(41300700001)(316002)(186003)(4326008)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lIN2NSZmJzTXBzaHY3WWg0WlZwWElCb0lJaE1aT2ZROGxlWWZHUDNpckZL?=
 =?utf-8?B?OTl2WU1ZbXZ5SitpM3FscmNyVGZ4OUp1enRNZWJGOWVWd3FDMWZrdXFxOENv?=
 =?utf-8?B?VmhCeGE4Q1RHREprQUV0R3R0RHNuaW5teEp0ZG53K2tZeDdTQ25FbEZFUy8y?=
 =?utf-8?B?bWM1dTJ1UXcrYWpYaWdjZVZMTlltbDl5ZEdQRmsyUXFZeGpCSFRiMWlQdWNa?=
 =?utf-8?B?RW1Ib1JNQS9UeTZLUlc0dm5TRldPKzVUcVVTdjNFWUZXQ3dpOE9HbjBMSHNY?=
 =?utf-8?B?ZnIyblJyRmJHSVRkQ1g0Rk1NcUdxakhEeDJRRkVQTWUzdStyTFpUaHd2UmxU?=
 =?utf-8?B?TVZ0NFh0UkQyMGdWMGFzUTZ4dlVTSEtEcUdGbUFHczlFUkZicm9rTHo4NW9L?=
 =?utf-8?B?NHlHTUIxakxsWWtPZ1EraVRBaWhJem5GeFcreHg4ODVCRnkxcVVuRU1TV1V5?=
 =?utf-8?B?b2dOS0dwZU9tTGRMQnhGMWxUTWZESUwyOXVuZDAvSFZuaEwrL2c3VWFKaDEv?=
 =?utf-8?B?SGE0SHBaZnR5dEF3MWpTaWU4b1d0eDRkL3hwZ3JqWUdTcFhiQnBFeEN1K1lE?=
 =?utf-8?B?MUdzUlpIQko0aEFwYmhqNWczVVE4d3JNaGJZejkybTZla0xwK1NHSi9yTkdw?=
 =?utf-8?B?VjVEWHpFL2daTkFXVmxaeGp1OWRNMllmdHgrSmxrdXdsWFFyKzl3N0Z3Vjd5?=
 =?utf-8?B?UVRZU0dKNTYyUnd3UEc1QzhCSUladXRtZkhXbjN6V1lPalNEVVFCamZrZFFN?=
 =?utf-8?B?UTdsaDdiK0h0TGE3YjJCYXNvVEJ3RVd1WEkzZWtkelh1WHFPWlhpWmluNk9X?=
 =?utf-8?B?YW1QMzIyb3BCYXpRT0hENXlVMDJUdHBSRFZNNWJYdjJYSXpUb1djMW1RdFla?=
 =?utf-8?B?MXNJOHBycnhUbWR3VEZHenJucGs2c0dOYlV3SityZ2RYS2x5SXZsSVVYSWM0?=
 =?utf-8?B?S1lWY2RTSHUybzI0NlBYNzdib29pNDhmbEp2dllRdHU1SitqcCtoRXV5R1NW?=
 =?utf-8?B?eXplY0lYdGtsdTVhUTcrdUpXQ0RudkxSSmF0b2JvcVQ5RHpaYmZCU2plei9X?=
 =?utf-8?B?QmVpMjdLY3hMMi9PQlRFWmh4Z1NFQW55a1g4K2lQRmd4K2liU1Z6Y3lpNDJK?=
 =?utf-8?B?c0l1ekFoQVZmZW83Zi9SQXRLb1p5K0Q4aTQ3Uk5iMTUybEV6bEhZQkZtbWVJ?=
 =?utf-8?B?Y3JZNno0NE5FcGVKenRCRFVGTlFibzBPNDNhU3RSMDBCb2M1ellaTjRIYjk4?=
 =?utf-8?B?Z0pmQVdwb251YmU2VlJOMitHMDBjMFlobzV0VXViNGxjcXlNVjRKaU81Z2lZ?=
 =?utf-8?B?T2tHQjJBRW4zQ1BNU1Z2ckN2Q1dFanNNbkR0U3lWbG9xVkl4U2JMSlVESmdD?=
 =?utf-8?B?aUtMVExJTHdacGpYWTZNM2d5LyswbWxNMlo0azRKSEcrL2hBeUZBTTdNaFVQ?=
 =?utf-8?B?QWUxREI5Q2Q2ZFdYUFhzSlg5bDJQSG51Y01lQTlKRVlnZVhOcS9VUUw4VWJh?=
 =?utf-8?B?QkVnRVNmZDJFUU5CTkEvTlc1UzlndnJXK2dLc25YbzhsVTlEdm9jSUN3bDJQ?=
 =?utf-8?B?YTZxWm9wZDdEWEk4TnN2ZldZMGN1eEpzb1hROVBTMURXRE4zWVpDRkhuWndQ?=
 =?utf-8?B?L1hWbm8vUUh4RDdLVW95M3JXY3ZiamxjVUNVaTdKa1Z4STVKd0ZOT01RYmY3?=
 =?utf-8?B?eGRDR3N0c0RRRUUxdlFESVZxektOUDEzczhscWdLTkRYYndOQ0pLVEFEVVJl?=
 =?utf-8?B?eXA5WkZCRWxXUlhTZEFoTVhPMmlXZkxmNzluTTdkekY0aDY1SVlpV1Ztei91?=
 =?utf-8?B?RWxhOTRuZlhVaTdBcFZ6YjZRYXBXdlRSYnY3YTFJdUdNdksySURXSWNmaEl5?=
 =?utf-8?B?eVUvUUkvNm5USDUzZzFveW1aTkg5aUdMQ0RFVk1HbGtMaEo5clU3L0pyR3N6?=
 =?utf-8?B?NFBJdUJnQTArYXIyRGJwSlFSU0FXWXQxS3R0LzF0M0o0WDVqZXpxa05GNFd2?=
 =?utf-8?B?eUpqSEVGNEpFSndnQzBEZWxvNm5VUkhNWXBHZ2JMNCtzU29mTmpRSEQyM3Nq?=
 =?utf-8?B?eUVYV0xhSU8yUGMvenVGaVE0RjNxTUVZeElpZ1prM3lXcXZ0dXpuVEZTUE9i?=
 =?utf-8?B?RHNpR0dZSWhJS3haSWpWRGtIUGZ0aU9HbGRIMEd4SlovRTJCUXMzWlk3ZkdT?=
 =?utf-8?Q?+hx/BAuM8YGanVH+3Rv/UvFAoWjUwK0gppgFaS3XSpW8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057e092-6a0a-45d1-5196-08da7eae06fe
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 11:05:13.4804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ER0WQyByWWtIRsIxVxY2XEAK8lxusQ1vjIx00WqdV8HthCs+144TAGnrEluiyudo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.08.22 um 15:30 schrieb Arunpravin Paneer Selvam:
> We are adding two new callbacks to ttm resource manager
> function to handle intersection and compatibility of
> placement and resources.
>
> v2: move the amdgpu and ttm_range_manager changes to
>      separate patches (Christian)
> v3: rename "intersect" to "intersects" (Matthew)
> v4: move !place check to the !res if and return false
>      in ttm_resource_compatible() function (Christian)
> v5: move bits of code from patch number 6 to avoid
>      temporary driver breakup (Christian)
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Patch #6 could still be cleaned up more now that we have the workaround 
code in patch #1, but that not really a must have.

Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
series.

Do you already have commit rights?

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
>   include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
>   3 files changed, 119 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..f066e8124c50 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	struct ttm_resource *res = bo->resource;
> +	struct ttm_device *bdev = bo->bdev;
> +
>   	dma_resv_assert_held(bo->base.resv);
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> -	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
> -	    (place->lpfn && place->lpfn <= bo->resource->start))
> -		return false;
> -
> -	return true;
> +	return ttm_resource_intersects(bdev, res, place, bo->base.size);
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 20f9adcc3235..0d1f862a582b 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -253,10 +253,84 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   }
>   EXPORT_SYMBOL(ttm_resource_free);
>   
> +/**
> + * ttm_resource_intersects - test for intersection
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res intersects with @place and @size. Used for testing if evictions
> + * are valueable or not.
> + *
> + * Returns true if the res placement intersects with @place and @size.
> + */
> +bool ttm_resource_intersects(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res)
> +		return false;
> +
> +	if (!place)
> +		return true;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!man->func->intersects) {
> +		if (place->fpfn >= (res->start + res->num_pages) ||
> +		    (place->lpfn && place->lpfn <= res->start))
> +			return false;
> +
> +		return true;
> +	}
> +
> +	return man->func->intersects(man, res, place, size);
> +}
> +
> +/**
> + * ttm_resource_compatible - test for compatibility
> + *
> + * @bdev: TTM device structure
> + * @res: The resource to test
> + * @place: The placement to test
> + * @size: How many bytes the new allocation needs.
> + *
> + * Test if @res compatible with @place and @size.
> + *
> + * Returns true if the res placement compatible with @place and @size.
> + */
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size)
> +{
> +	struct ttm_resource_manager *man;
> +
> +	if (!res || !place)
> +		return false;
> +
> +	man = ttm_manager_type(bdev, res->mem_type);
> +	if (!man->func->compatible) {
> +		if (res->start < place->fpfn ||
> +		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
> +			return false;
> +
> +		return true;
> +	}
> +
> +	return man->func->compatible(man, res, place, size);
> +}
> +
>   static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
>   {
> +	struct ttm_buffer_object *bo = res->bo;
> +	struct ttm_device *bdev = bo->bdev;
>   	unsigned i;
>   
>   	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> @@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> -		if (res->start < heap->fpfn || (heap->lpfn &&
> -		    (res->start + res->num_pages) > heap->lpfn))
> +		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>   			continue;
>   
>   		if ((res->mem_type == heap->mem_type) &&
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index ca89a48c2460..5afc6d664fde 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
>   	void (*free)(struct ttm_resource_manager *man,
>   		     struct ttm_resource *res);
>   
> +	/**
> +	 * struct ttm_resource_manager_func member intersects
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res intersects with @place + @size. Used to judge if
> +	 * evictions are valueable or not.
> +	 */
> +	bool (*intersects)(struct ttm_resource_manager *man,
> +			   struct ttm_resource *res,
> +			   const struct ttm_place *place,
> +			   size_t size);
> +
> +	/**
> +	 * struct ttm_resource_manager_func member compatible
> +	 *
> +	 * @man: Pointer to a memory type manager.
> +	 * @res: Pointer to a struct ttm_resource to be checked.
> +	 * @place: Placement to check against.
> +	 * @size: Size of the check.
> +	 *
> +	 * Test if @res compatible with @place + @size. Used to check of
> +	 * the need to move the backing store or not.
> +	 */
> +	bool (*compatible)(struct ttm_resource_manager *man,
> +			   struct ttm_resource *res,
> +			   const struct ttm_place *place,
> +			   size_t size);
> +
>   	/**
>   	 * struct ttm_resource_manager_func member debug
>   	 *
> @@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res);
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
> +bool ttm_resource_intersects(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size);
> +bool ttm_resource_compatible(struct ttm_device *bdev,
> +			     struct ttm_resource *res,
> +			     const struct ttm_place *place,
> +			     size_t size);
>   bool ttm_resource_compat(struct ttm_resource *res,
>   			 struct ttm_placement *placement);
>   void ttm_resource_set_bo(struct ttm_resource *res,
>
> base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1

