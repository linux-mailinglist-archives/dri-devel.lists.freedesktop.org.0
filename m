Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08F7199F0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 12:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907F910E21E;
	Thu,  1 Jun 2023 10:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ECD10E21E;
 Thu,  1 Jun 2023 10:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezm6NNVc+9cH6RmLeQ3Ivf9tdplOGdvTTgv70hFmJVQx/PRBHnDjsMyujqqidkztoMSi8UkgUkSHoTdx4XXG1MsNe3BjJePdkqxDVkzcgaFWYvIeP5h6g5xrDIsn4nmk75ObIHwXWTLGQIpxMPVxtZSmIvd8HF9TDeFfrepQEwKks5xhNPmCEWjsqd9QqhKFPrRtFa7ldVj8xCusrfsuOYP6YPRD1/+RPpHGtkItg12TngGDXfJ0FaIDbArpKAT3eXJTs0/fhZbYpZWAG35/1bbBQ2kGFLCjGYMbJzhcDgW9TslVJDYQwaQoBFV8cVIhNDvbyr6Pv6sYQufBqY/Bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsAD4scQmpmSkulptJdm6YPxqRDvfgsUxWznScHwBJs=;
 b=Ff1qJfKH28+yKmMISh+VL2vhneG0TDZNvDqJAu/gbhcIm2PDevrHoiyXPksfuSEP4a17e1q3p7OrtS664qZ3g0Go7L/0e4Wa3Oz5STR6sLOPKrKMNvVN6UXKgvAxi+1LnYS8Ub0O8AF7UOcCvgFSgzTQDKKGFy8+3rJtiI8AHBUtGaIeclC1JmI08kpfEB4sUZZBpRfiS+37TNiz2KO5UwqAVJI9CQe9Ii9fDNXNoj6VVpOxeNFSyC9kBSKKZa4gjJeT35KxIlTpAYjajuxgE2AS5OQeb7K1vXfcqcHVXSNNDkSRHerPJPip8HO/PlD6HlUvyvX0hYequWrDv6Fiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsAD4scQmpmSkulptJdm6YPxqRDvfgsUxWznScHwBJs=;
 b=UzI3ZAnm/MwZCNyVQEvqmvNE99o+HTID2KwFSGSYzAa5pJZlrG4rxJkzmlKQYAp1N4/zeEEvlkxeb78528iRSUiUGARNtr3XQMx8N6eOOvZVhbXYiH3OxK7l+OTVtd54Cq1wfYhymJq5VTeXvdieKa/60r0l6JTdVHltsZRWIv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5470.namprd12.prod.outlook.com (2603:10b6:a03:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 10:38:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::907f:26e2:673a:2ad2%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 10:38:05 +0000
Message-ID: <6f57ab78-b760-d756-a68c-16029a3afcea@amd.com>
Date: Thu, 1 Jun 2023 12:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/ttm: Clear the buffer object bulk move at
 individualize time
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230525150205.194098-1-thomas.hellstrom@linux.intel.com>
 <20230525150205.194098-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230525150205.194098-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: acf9512f-956b-4f49-8db3-08db628c47c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5HzaginDnyCXe/cuHqoIk3U/vA578oWKVN3o+uPHnKQKv9ZvPp47+3MULMAXF0lzkG2a/ze6VGpolYgWRO/CUXp3PbQjBpC3uZl3MI6TH1VhyLQyd4g02u7vJAZ2ZRzU+iMChzfThod6n1tqVlReJB83mYs9XKB+6jAntUTo+vfNIBjdB6B9g2zFUPiUFm7kJcJRZbqLeM4cMIlc/g5SuKX3i8LqiZetNlFVL2g/s2xu7LUrXdKP51QrwNNiSszjiIFIkwVkWwPtrG7QY80bAIPaj/SxXH0qF2kuUVhH3ezNW2/pv9aAnvsqsYJFzP6otzVsb73L/y5qqQq2Sul18DW+MJ4nKe/IE+jWtIAcODFS7vScyjI0T9+Bml0CfynrT8/DzQTsHg8fNoFT1y8RTOUXPFKdwhvj5tcLITGQFTqIjr97VpTJhAM/WLQVaLu1kW1D9drH2I1nZxHtqipDZoIxI4WM0zkBc6kRnehOcyXBH9wKORssQ0wBXFlTX+Ydf51IsmUT0HczgkJAyI9LvhWSZRWd0NxHrCl03Z1JW5/yDzu/neiKAPWXBCV8JXP9Qv0SN/H5dYlfBZVu48shHv8bhVFtA/YZ4JjbIYhAD/EEHEW40VblgqjfkGa0GZwEyEfO7iUgEz+XpT0ZaxyzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(31696002)(4326008)(66946007)(66476007)(66556008)(8936002)(8676002)(41300700001)(86362001)(316002)(31686004)(2906002)(5660300002)(478600001)(6666004)(6486002)(38100700002)(83380400001)(2616005)(66574015)(6506007)(6512007)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjdmQndSNlgyRlM4c2RqaG9yRGVLbXk3N205VlZYRmV0V1o2VWcycitxV1ds?=
 =?utf-8?B?eTNJK2NWWkMvOFVWUzY4VXlTalVlS2hQRTlWRVdiUzB6MVhsRnNyQ016dWkz?=
 =?utf-8?B?Um5URWx4a3N2Y0FRTitiREJZYkdsWVN2QzcxQk5UK1Nia2x4R1ZKdjlYdjJp?=
 =?utf-8?B?Z2REbllBU1cvaW9tbjBQS0lWUW5vbmdnekJHWjVqc0Zla3NTcDQvd0U1dXdH?=
 =?utf-8?B?WEFVMFF4dElxUG5XV25pdEFwZWk2M2R0OWplTGhZL1hxY1h0aEs0VVByelJt?=
 =?utf-8?B?UVd5QlhkTFNBMWRrQkNpV2R3bzBtQ09YekM1NUNxeFFkU0c2ZlZQMVZoYmdD?=
 =?utf-8?B?SWcvS1ZXZ0NnbDAyWXNmSmxQWElLK05uUzhYeTI4VHZycnVmay9weVFySjBx?=
 =?utf-8?B?NXN3cVdyTjJWYks3Zmt4SEN4WmUzbFV0V1pmK2FldGtJTTEyUWZhMlZ5ZldQ?=
 =?utf-8?B?ZnE4RnhJR0F4R21ON3dGRnExcXgxakEvN1kvV2FlRUgyUnBXYVFFeVNSTGFZ?=
 =?utf-8?B?a3NNd0tqR2gyRVBIdjRmc1BQbnBPWE1YeTkrM0QveWpHcnM1c21TaC8wRHN3?=
 =?utf-8?B?cnlNa2cvUDBwQW1DRUFtSTlTdnd4cDF3VTBXbjIrMC8yTi9FcmF2VVI1MUZJ?=
 =?utf-8?B?ejNHN1hiNzJwYzFOTlNNbWZ4NmJCNDJtdlZJSXk1ZEhRcG5iSS9aVTBpeWly?=
 =?utf-8?B?ODEyOUxvUEx3UklwWkN6LzdiTE1IYmhlSVJSQXIyVzJsRktNL282M3cyZDIv?=
 =?utf-8?B?WENOUTl6UDlqQUpHcjFpWlhVSzZyenlJVE5wWUlCc1dtNHVsMFUwdFl4dWM0?=
 =?utf-8?B?RHdLZStqcEZadVdqV2lDYSszVlpwUEJIaVU0NWRwYlhxRk9BUFRXS0hQV2Zm?=
 =?utf-8?B?NDNrVFE4RUJGNEEvTEpsS1djK1dFUVNjemlnWTVzQ1BtNnh0M3BqWUNKTlBN?=
 =?utf-8?B?VlptaWxsRVdNeDZJTDFwa3hnV1NPTjlqd2h5RnlMNWhVc3Q0clg0d3F4SlhY?=
 =?utf-8?B?alNWcktVUktYQlJFSklUNUJWSXZ2QnphSkJlUGZTUVhuZUxJUitxeUVVbDFk?=
 =?utf-8?B?OEtEcmttVjlyV3RRL1laRjl2Mi9wK0VTQ2RKaTJSTGpqclZDK0pUVThYREVo?=
 =?utf-8?B?RE44R0tUZ21iT1FZVVNFcGlYZG03WklYcDlwWktNSnQ5UzJBWXJPMFJONHI4?=
 =?utf-8?B?TGozV1pBbHV6U3lmeVJ1ajVjVzhjaG9tNVlYbm85VmdqZHRzaVNoYXdyTWk5?=
 =?utf-8?B?Mk5rWVdSYXdkRWc4emdiT0YrNG9lcFFoUjJGZ3BFalNDRXE3K0hIZTRVeXFp?=
 =?utf-8?B?Mnd4c2xRdkZaUmtyNDBIRnAxUnBZZUFZdEtYZGpwNE9ldytjUEpmSC9GSUYx?=
 =?utf-8?B?eW5KU2d1WmdKTWVjMmZxaHBOeTNML1ZDeGhYYko0ZmkvbVNNcFgvQno1dkpt?=
 =?utf-8?B?NVg0WG56RktmOHFxenZlL3FOL1NNeWlrL0tMWXdrMVZVZTFmOVBDUE1lNDNH?=
 =?utf-8?B?Qzd4bHFLMVRMNGhLNFpkK0J2NXFSbStWNkZYV2psb0tmUk9xemQ5bG1IOW8w?=
 =?utf-8?B?NWtWOGhuamhhYnREUWZlU0U4VktnekF2d2FJb3FFdE9xci9RZXRzcXVSRktY?=
 =?utf-8?B?R29laEdweEVoNDJ5a3dmTDU5dkFaaWJaczdBYkpjRVdjTitFRlNzaWZtRkxE?=
 =?utf-8?B?dkU1dHBvekRXRFZBZk5sL08wa09Fa204Sk9rUy9pVWtJMkExRkUwQ3VOd1hP?=
 =?utf-8?B?eFpBVlJ6NHgwYVgwOUdHS25XdW90ZENNRUdiZmZBcTNsNWdQbGphb2NNV1VG?=
 =?utf-8?B?U3BrWTFLRWRxMk5HMytPWFVvQnJHYkN6T0JTdWxYYU9ram9tTkRDeXBMUXB6?=
 =?utf-8?B?RUV1TkdaTWR1eWc2b1ZOU3dnU1dSQVpGSkJ1R1poWFp1d1JhK1F2WTBEZUVj?=
 =?utf-8?B?bDhoV21yS2VOeXRHTU1INGt0QitCQnBmYTlMUlpnTXBld1BmWGtTbDFHT2Q0?=
 =?utf-8?B?QmttMUw4b0JJNmVOdHhaZ3lrVHpsZDAraUxKYkY5STRvWm41TkhkdWxMeGMw?=
 =?utf-8?B?L2RPMlVRRmR3VXJBQ21pYTZLa3praVd2UGZqMm9ZR3pSb3RhVnFLUWtwa1FX?=
 =?utf-8?B?L3JFRGk3UnF1aTM3OG5uZTI3dTNSdFd6U0Y2azJCU2ZudmdSSTJhemV4Ymgx?=
 =?utf-8?Q?uN6JbA2p0F8duz0ZcQQtWfTDvO+41cXnu9GfyxXaUTod?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf9512f-956b-4f49-8db3-08db628c47c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:38:04.5382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uM7keojZVdDK2Rm8RCaiEDfnenMZZZwNbQ5W6mH8AhgLycWhtzHpILitEIHUMAD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5470
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.23 um 17:02 schrieb Thomas Hellström:
> Clearing the buffer object bulk move is closely tied to individualizing
> the resv, since that is when we effectively detach the bo from a vm.
>
> Clearing the bulk move also requires the bo resv, which we have readily
> locked at individualizing time without clobbering the much wider vm
> lock.
>
> So Clear the buffer object bulk_move at individualizing time, and update
> the code comments.

WOW, there are some big misunderstandings here. First of all the 
assumption that the reservation lock is taken at individualization time 
is completely incorrect.

Instead this is called during release with an unknown state of the 
reservation lock, this can be locked or not depending who is dropping 
the last reference.

Then when you use bulk move, the area covered by the bulk is protected 
by the common reservation lock. So when a BO is to be removed from the 
bulk it's a must have to remove it from the bulk *before* dropping the 
last reference.

Regards,
Christian.

>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bd5dae4d1624..57cc9f845adc 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -193,20 +193,33 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
>   	BUG_ON(!dma_resv_trylock(&bo->base._resv));
>   
>   	r = dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
> -	dma_resv_unlock(&bo->base._resv);
> -	if (r)
> -		return r;
>   
> -	if (bo->type != ttm_bo_type_sg) {
> -		/* This works because the BO is about to be destroyed and nobody
> -		 * reference it any more. The only tricky case is the trylock on
> -		 * the resv object while holding the lru_lock.
> +	if (!r && bo->type != ttm_bo_type_sg) {
> +		/*
> +		 * The TTM bo refcount is now zero and hence nobody will
> +		 * therefore try to lock the bo at this point: the LRU
> +		 * list lookups will trylock even if the refcount is zero,
> +		 * but will only do that under the LRU lock and will
> +		 * then immediately back off under the same LRU lock when it
> +		 * sees the zero refcount.
>   		 */
>   		spin_lock(&bo->bdev->lru_lock);
>   		bo->base.resv = &bo->base._resv;
> +
> +		/* Since bulk move is closely tied with the shared resv,
> +		 * clear it when we have now individualized, if that was not
> +		 * done by the driver already.
> +		 */
> +		if (bo->bulk_move) {
> +			if (bo->resource)
> +				ttm_resource_del_bulk_move(bo->resource, bo);
> +			bo->bulk_move = NULL;
> +		}
>   		spin_unlock(&bo->bdev->lru_lock);
>   	}
>   
> +	dma_resv_unlock(&bo->base._resv);
> +
>   	return r;
>   }
>   
> @@ -324,7 +337,6 @@ static void ttm_bo_release(struct kref *kref)
>   	int ret;
>   
>   	WARN_ON_ONCE(bo->pin_count);
> -	WARN_ON_ONCE(bo->bulk_move);
>   
>   	if (!bo->deleted) {
>   		ret = ttm_bo_individualize_resv(bo);
> @@ -337,6 +349,8 @@ static void ttm_bo_release(struct kref *kref)
>   					      30 * HZ);
>   		}
>   
> +		WARN_ON_ONCE(bo->bulk_move);
> +
>   		if (bo->bdev->funcs->release_notify)
>   			bo->bdev->funcs->release_notify(bo);
>   

