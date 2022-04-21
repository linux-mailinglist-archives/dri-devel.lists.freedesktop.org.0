Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A391F509FF9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D97B10E380;
	Thu, 21 Apr 2022 12:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73110E370;
 Thu, 21 Apr 2022 12:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djt8Ee+aRx0JeB3hwcvihjhhj5OXfoCzyrARzTWufmWgJIUT+FV8s//kj5tc6H12V+X7V1ouLDnsWNED9m1HwG4VUEqr4XY1uZNr9H7Jq2eYfp3qtLuCNP3P/cQWvtBfyjCwXmvz2+6uvxuoGi62672btdXVzdOfmOF3B/9+Lrc0n/AJEVNqYBZGXpOZMeHREfSSk46laWAEHsmpY8wFHyBayJGX8mTUi350xko87qTngEh66Fo78km6jHyfdKIwH+9SBsVVCqr48N4cv2BYcrvJ6pUiNTukCce/jOBzxNwlmgQVSGb+dsQ7Yp8R6As9Xwqf0eMu8Xw6nuHlHZdA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE0cygIGpDJWnCtG1pKegXKvWAHSSTxB17XA4vRl9q0=;
 b=dbKt64ijlo44o3rZj8u0rJu5SNb0UoXHYiRqkF1JXujNiCRTswp9NDsqWJlNtrrUfpgsrHfvhQHq1HbG+UbdxhLzRXk9KUcQBimU/0jzLgWh3/KVk8bzIyiRBSHkC453A237ph3MEW7Kns3kyauJjt8nWAfFgJzc66CeotiCnO1Gpymf+mZvtFMjKTfl+esUX6WBrsgqAImMm1ZjLOq/9PyKhjR/UqglI7ms/3yLl61ChbQo9ab7y5Z0i8Xd5v4E3x1vKx8gJljooxyqzdFvy2s2lJBHNorSrHLSkZsRMyEAd9VEFcoJBcu9Is1nFID7sPTIQ4N8jfTzwwH4Ih+ljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE0cygIGpDJWnCtG1pKegXKvWAHSSTxB17XA4vRl9q0=;
 b=4POpnlFtDJKQDy/x6m0HiSn8YiNtSQ1NW9SOOdLBGtvVwy8ui1Lt9LlJgL0plQJ+nmdhBlcfxxMKcz/OxzaWrJUlkWaEUaoYxULh2LYyABuzUU3EUI/hoV51M5pDWOjHNEQ+iEl1LFQ2lFt9633guZLUwJWske5tL2m8+bFTkug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 12:48:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5164.026; Thu, 21 Apr 2022
 12:48:40 +0000
Message-ID: <60be4755-47ac-cb5e-1486-d9b42cf43b49@amd.com>
Date: Thu, 21 Apr 2022 14:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_array() in
 ttm_tt
Content-Language: en-US
To: Yang Wang <KevinYang.Wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220421123442.1834102-1-KevinYang.Wang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220421123442.1834102-1-KevinYang.Wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0311.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9586867-7d67-4e7e-1c20-08da23954248
X-MS-TrafficTypeDiagnostic: BL1PR12MB5285:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5285FD6EB5440AD24CC8AC5083F49@BL1PR12MB5285.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D+86TpjREwPiTNqHjl57Hr8uoQhD83TaoBSHvQkj6DufISqSE3k7XL5DbrG5K2/FFF2AtvN0Xe1TZwVmHfi8h7RLI9wAwhC/sxoJxpa/McM9VrSyS0sUd9cQDSm/WQ5GAriVRNkk2DBJ3gCazP8JCwHKHgfEm2s2/Ajs+1PX3mW2nCYt80m4YrNp9Q9asnZQgOP+BHnTHFmdGtzYUqdGA1uXaKBEPwzTA3iuvedBCfRwYPYEP9RxYVgD3rpy+2ZcVJm+6A/gbY9e3f2PrNPHJkieji+IJL004YZ5pU2EhLHioAEf9byM+ZKz3sHdx3ISki3yNUsRG49hTJYZWaGKpYg0wwfGxpotz2wlLxl74F4V5KhgveTleMrH3G6YmtrEXOdnz629sJO4t6hmRiq+5yGlGpztUT0l0NIHw9AXjqH4bgNgUo6to6LhxbQvNPGq9zDyRAocLoEWsxMj2PlzatTUsbmqIXwmtlD0426RuELSXYwmiPDLd0iejphBXgUt73LzaYue/UXtO2hgh2c1Hd4juvjxEbngG5dfzCfdkHU8eim+vFk0YsjwP7zzNlL93mPdC6b6CaW6rNHBt0bqp66BmCqgpqWp0CDePCLYC2yWzgHmK1vFz4RfUwYH5pzBk0Bg3v8EhUxojhS1P05GHldh6qpJoE9s9urY+Mym9kJPMDIwFALaoP+u+qjMlKYMkdBuS92JBtnwo82OqnHukH2myBI5zbCrrOjvb95rWrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(31696002)(2616005)(86362001)(36756003)(66476007)(8676002)(66946007)(450100002)(66556008)(4326008)(316002)(31686004)(508600001)(38100700002)(8936002)(5660300002)(6486002)(6506007)(6512007)(83380400001)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU5XT3ZKU1JXd1dpMWdVVjlCVDVpaGx3bTBtRnJxVkVobUlZVDRCSUxZL0Fo?=
 =?utf-8?B?ZndrUzlhOTlGWGp4WS9MQkdhNmVndlIxWXdmbFdXVG5ZNDRhamNYRzMzbUNG?=
 =?utf-8?B?UWR0Q2ZXNU9yTzEyNy9kVktpUTVoOUtnNXIvVlVEY1MvRXdhY0p6N0VnbXRO?=
 =?utf-8?B?cGp0d3BkK09SM2lBb0JuQk5HM1AzVWFMQVFYYTlYc2RFNVM4SXVRMjMvSVVP?=
 =?utf-8?B?MGFJdmxQYS9PQVZxWW1Mczc0b2xDWFM1a2pRUUdiZ3ZxQkx4RG1hRzExbm0w?=
 =?utf-8?B?YXVtTW9DVW11Y2pjaU1XMytEeE53SGVobTByUFlIZEVCbUVJZmpWOWU5N21n?=
 =?utf-8?B?MFRJbTRmeHZqcXprd0l0VjYxMUJZZmJ6VlBRaG9oNmJkTnFDOVJ6Q0F3ekVE?=
 =?utf-8?B?QlVHTlJpOWNCOGFjTXZkMDV0OVdqRnVaNjFKK0YraXAxMVVaQTZSNTdsYytC?=
 =?utf-8?B?UlV0Z1ZuNnNPNzFmRFFNT1hlTUs0SlF4MElYWS9lTE11ZVpEQzJKaFRoaXRK?=
 =?utf-8?B?L3UyNFR1Z1VkUEQzNkh4ak51OVRHSmY3aXVjcUg0dnhCeks5ZHg0SWpva2ht?=
 =?utf-8?B?V2F3OVNuTHo3SDFyd1Naalo2TzQwelM3aFZjL2pLL2pSdHloZWJ6ZEdZaHl4?=
 =?utf-8?B?YUVZSklrWDFDZWYvbC9wQktheEUzVnVNN1kwWnpBaVEwVXdLNXpSK0w0L2Vq?=
 =?utf-8?B?d3I0SThuWWhWQkp2aW9keXVLQnNjOTM3SkMzSC81YmxzU2pwWTRDMjh1bHZx?=
 =?utf-8?B?bDdXZTVJcmNCdTZYSGFZbE9iNjc1OFdwWE1kQ0E2UHBYdDRSODJSTWY2TFdN?=
 =?utf-8?B?RHlmSWNmNEtIM2lhSy9oTGdESkh0SHNNNnNGTnc5WmpzZVVuUGhOSTZMMEJ0?=
 =?utf-8?B?WEZUTDE3Vi9xTlNtQnM3c0xpK3BSYWRMUUplUG9jVFlhSThjYVNGME93cFpr?=
 =?utf-8?B?ZGpOT2dCaVVxUWdFUEpzRzdLdTZieldjT1RtYXRYYXFPM3QrbllqcFJKL2Iy?=
 =?utf-8?B?OFM2TkZXVGl5bE5WeGZjTW5vdWdkRUNCQmVaSUFNeWpEcngwYWxsanNuN2Vy?=
 =?utf-8?B?ZmhjWEVXUnVHMUNsMnN1RWNOQUJKTlJweUovTW9KcU1yenFhSHIwRUkxUzZk?=
 =?utf-8?B?MUJReThmMDFQcU9maXVFOFE4KzEydCtnRVRHNDdsbXY0V2lNb0VtNjFiZkdv?=
 =?utf-8?B?MmcybTFlcnhqU2Q0cGJXdXdpb0VPWjdtT01FMDFSZ3pocUFad3ZMWEk0dm5j?=
 =?utf-8?B?UURxeXA1MTdNOHYzRDF1OStIK25PZWhtUXFXRFBWU3FhRUJBVWZ6V1JKbTNm?=
 =?utf-8?B?TzljOGkxcE8ydEUzU0pnSEp3WHdDdDZkZUhwWDFpNjBPdklIMWZORmNXY3VK?=
 =?utf-8?B?dENVNUJKT0I3NHNhVlhQSjRlditRUERkZkRJSElTYzV0UWtnV0xmSmlLRVBQ?=
 =?utf-8?B?cFlsSDJzTEZSd0VySktSbmtnZE9LU2twMyt2L2VjWWU4TktmSVlyWDF1cHpC?=
 =?utf-8?B?dGxuN0VKbDNhYXpFL2ppQXBtZW5VeldpTXkyZFpwTlFVMWM3dk1laXZOaFIx?=
 =?utf-8?B?ZHZpY1NmU3BzdmJOTTlMWHdCVllzMHJUSWw3V2NMNXRJV3VqWHJLbGllZ1F0?=
 =?utf-8?B?R20yNktFSWpYallXZDhRc2V1c2FsdkI4M3hORktlN2d0SkxIRHFTTzVYRk9j?=
 =?utf-8?B?L1pNT1JtMURkVjJRWFZvNE0xYUtCRzd1RG1QbDFxSEV2eVZUTnZGSHVDUURJ?=
 =?utf-8?B?UFNaYWkxMGFrdlpVQU1hR3pHNE5XZk9UNXV5RTRPL3ZRU3dLRTZDbGpza0dS?=
 =?utf-8?B?OTVuTTlXN3hVVVViSDRIbWpaL1p4aUltMjB1ZGx4dWQwNzRvMzVBVFJ5RFo0?=
 =?utf-8?B?VTh5MTdEUjZ5eDFCMFZ2R2oxMXloQXA3Q3ZQcHp6d3B3amtMSWFYZTMxbmZu?=
 =?utf-8?B?dXNCbUFzdWpUb2M0bDBXdXZ5TFo2L0RUdnRKYkppaC9oaHdaU1pBVlhCT0lw?=
 =?utf-8?B?YkV5NXREL1VCRkowTVp6SVcvNU1KLzlIeGRuK2JaT1NkNUhySXUvc1pIUDdu?=
 =?utf-8?B?UHA2eEwxRmNvWXpnTUlIc1dzOTlOUFpTQkc2ZDQ3TXRDdER5WEJTcmE3UG9B?=
 =?utf-8?B?NmpHVHErTVN6RmJtaFNDWDIzVmdUd3RVSmhHK08zRFlrYnZGQWdncDZqS0pT?=
 =?utf-8?B?T0dRMW50eXl5Nlpjd09xOGFNOGphckNCQVhOa0JycnJ1MStWUjBSQU9KdGMr?=
 =?utf-8?B?MS9hYThoend1emVobUlydVlsUVlscXE0VnlzOVlMYW0zYkJlN213RWxLeC83?=
 =?utf-8?B?Y2NYOGcwUUlkZE0xUDU0YWZHbjM3MTZuWEo4UFZKWnUvRFFiTnhkeFJiclFK?=
 =?utf-8?Q?zq/Nx38dzXbJXw0w2UhITvvL3iQTWyQAOcKfSP7UA/ZJv?=
X-MS-Exchange-AntiSpam-MessageData-1: Kd491As4gwic0g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9586867-7d67-4e7e-1c20-08da23954248
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 12:48:39.9530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqd77UfVaVLSE46/voOFdMwTcoyp4tjsmqIQmXmspGsqCJez56aphN+45gdxobQl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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
Cc: felix.kuehling@amd.com, lijo.lazar@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.04.22 um 14:34 schrieb Yang Wang:
> simplify programming with existing functions.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>

With a minimal style change reviewed and pushed to drm-misc-next.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..cbb3d1fb4caf 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -96,19 +96,20 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>    */
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -	ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
> -			GFP_KERNEL | __GFP_ZERO);
> +	ttm->pages = kvcalloc(ttm->num_pages, sizeof(void*),
> +			      GFP_KERNEL);
>   	if (!ttm->pages)
>   		return -ENOMEM;
> +
>   	return 0;
>   }
>   
>   static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -	ttm->pages = kvmalloc_array(ttm->num_pages,
> -				    sizeof(*ttm->pages) +
> -				    sizeof(*ttm->dma_address),
> -				    GFP_KERNEL | __GFP_ZERO);
> +	ttm->pages = kvcalloc(ttm->num_pages,
> +			      sizeof(*ttm->pages) +
> +			      sizeof(*ttm->dma_address),
> +			      GFP_KERNEL);
>   	if (!ttm->pages)
>   		return -ENOMEM;
>   
> @@ -118,11 +119,13 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>   
>   static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -	ttm->dma_address = kvmalloc_array(ttm->num_pages,
> -					  sizeof(*ttm->dma_address),
> -					  GFP_KERNEL | __GFP_ZERO);
> +	ttm->dma_address = kvcalloc(ttm->num_pages,
> +				    sizeof(*ttm->dma_address),
> +				    GFP_KERNEL);
>   	if (!ttm->dma_address)
>   		return -ENOMEM;
> +
> +
>   	return 0;
>   }
>   

