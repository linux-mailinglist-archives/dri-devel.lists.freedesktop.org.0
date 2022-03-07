Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870954D0378
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494710E052;
	Mon,  7 Mar 2022 15:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C3D10E047;
 Mon,  7 Mar 2022 15:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B97tFNV6N7Qb7qjQjbVjfR67qmfAZPyClgmTI31oWHi56rZIwjYmiHxjg4KLd72PipLTcsPUSf7VeypwLeXBpuJrtMqfO3n3mh0kH3zBRY4DTbupBEm8cj09xnhsC6UeOA7Ahd3Tls6L8JWMDRCBoWvWtXAJiqGOw5I5IpbNuJ8Xir5399IA81Zxmp/XaeWu6RzulevpfE1NiWDbBMbuUvgAqmUlfDFbAZRcfSDlUBRgScNEayrGJBRETirlgeANwnv8XQVjm6himqa7qrNY/m/IZv/BmlE8n0EW9d3mKaK/hUXesGSBkKazCHKzsO10bRAAr1KAp3PkiV3iVsvQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Okba/QqjA4gVoqci4/sexvViveom/pzGXgTb/ywkH4=;
 b=j49dHPyR7EFtABknW4deaitjzwMnFUlNDaYKJxMiqOcQnKoua28MVlJ5AKQbXsWynigFttaD8WEZD4h0AawjjGRWl/OxsSZzKc9ir9CiEAzd+K+7SVcTHt1jZHgPjxlCZVovwCrRJMnZkXdrvKs8RwmiErVLE0DeelwZYUUW3Uk6eXqHIcsIHWOZVfr1xbbpwHj87aE7NicSOow/QeRo6JwYDPcQEjj3WVieOkTJAjJqhMM5elnOE9DEmwE+imKOxTUaIAdG981R2uOrCmic9kiS8c/6q51rkaZbtvTg6IBJJZ/y2G3Ug+rvthKG6+eyk88bttRYpceQbF58Df1jUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Okba/QqjA4gVoqci4/sexvViveom/pzGXgTb/ywkH4=;
 b=s/sjRhoA/0vr+LuXoOAdLLzjWlimUahIpZStL/HNesNDVGy64MuDbsy/oclrpJUfQxoFwT4Mbra2pYcfHcD4lYeDARXoT4KLrDd59VvRy4TIzsUY4JzDyuL6IFdb/kFlsCfzY59ctLDcCh2EaEI6hM4mveZyFZrbYww1N+x2Z6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 15:53:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 15:53:34 +0000
Message-ID: <841ff816-b93f-34b3-4868-364f2943c039@amd.com>
Date: Mon, 7 Mar 2022 16:53:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9fd73c4-25fa-487b-bbd2-08da0052a274
X-MS-TrafficTypeDiagnostic: MN2PR12MB4453:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB44532713D93BAE7A4F2819C583089@MN2PR12MB4453.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OzZTquUheRr1A5PzbE+y6IZBoJxrbbHsanMJiE3JqWUP27Fl6CcifTV8y/djS/PU76hE3J8jkFeKWwa/Pv1AyDeA425zol4gsKnaWSPTyOfQQHY/Gy+a9hGMzGnUbsigNzb1u7kfP9W4kkLYn30MasLFZ5MXvxLTgmgP9YLP4wr6FeZD4z5cMa0RCXqhYvGZz8IafYDMqCdjAuwpDj50Mh0t4jP6faY3DvmTofxo/yONvtAfEWAWTYcwunqa40xiXgmdHcey9yevwWYnSYzjCYvq/gmNbQK1XSl8myIum+5f4q+/irgSZQcmxIs5are0avx5WhFaR7Oj0WlPmwGSG8O4QpWiiyTlEoZLoj/14/koLfYpL0aE+iZEUOtKdaXR0IgROvcz7MFI9lBGUkCVegM31IG//ceYGx+3iPkCqrMyZdmaVNT9nFWwP2K0LPAtM2W0fzp8zgxtS+5T/oRkvzupsHlnD7/6Oeq3gpny9OcVWbqUiw21P+S+mjBAL09yFBkKITiGBfi7rQctHg89dQb4A9pznpFTs3A322I26DtoJT1TVau6WnceLVpsJ80xb623lfZK9o5/2vpGAcKXapZEyD1lf26zkTvTWpxEA1urAY/gKOKxXCMtaSYE2mOSLEcJr94f9G4QXZKBz1McLBVihAOHutzGisxMrJmVydH8AXe9oed1TwW8TV3fB8KAemLsVtH2mwHDfzip6/c5ygxL4ZwaAoMP5pn1MIzfxK57tf1OiJixUoz+822I/Vy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66476007)(66556008)(66946007)(4326008)(6486002)(31696002)(508600001)(5660300002)(6512007)(8936002)(31686004)(83380400001)(186003)(2906002)(2616005)(316002)(38100700002)(86362001)(36756003)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFgyMVAySm1oNDlhVVU5ZVU0TVd5ZytybGVVQ1U3ZjJ3VnVRc1loUHlTanZR?=
 =?utf-8?B?aTFUdU9QQWZzVkdrNXpGVm55azlPY3FQQ2RJQkJxV2lJM1JlU29zSWxBMUtW?=
 =?utf-8?B?SktxTnlDeUJvdk5vQ3NBOGxvOURZWVhFMDhpRnlGeU1oZGpOK0hmZEIrU2Y5?=
 =?utf-8?B?Q1JxOHJmOGtqOEx4c212RnlWQjJyWG00UklxcklFWWRFenpvZXBLc09sZnpW?=
 =?utf-8?B?ZFpLeUZTcnQrZFdrNG9Sc21DMStLeHZqT3pSazVZUWR0VDBDK0xXU04wVjFi?=
 =?utf-8?B?WFU1V1kwWU81TTJTQklqVkFNa21adjNOaGwxM3U3WVN2aDhHRXlXWm1oM1Rx?=
 =?utf-8?B?OEdIaU5VS3BxZXRZSmcwdVAxcVBUNU5RSFVTdjBZSUZGYUt3SnlTM0JiLzFw?=
 =?utf-8?B?UTRQMlFRZEx2YjdjbWdjMFBidUNlYUlSNkJYQ3kwaytNUHBUYmNnckhQQnRx?=
 =?utf-8?B?UTg0cUh0ZWJsM3lnejlaUERCUTJoL2hHRkhXNTJyTVlnWjZlS2dJeDEzNFZx?=
 =?utf-8?B?anVnTnErUjhFQVUxcHFtQzJKNElxZm40NWp2MUVFQnMwb1N2ZVhoVHMzYlBv?=
 =?utf-8?B?bTVVRjJrSmdqWFZhbTVPME1jckhoNHhaY2ZWdU8wS3lLamNaM2VWM0lYOEpY?=
 =?utf-8?B?cUFpckNsMUZKVHdjRlp3anphTUlEZC9xTkt4cDRMOVdGQTYzUGNncDVkWXRK?=
 =?utf-8?B?RUFsSUgxNkVSdW5ETmk3QUQvcHhjTmI4OTlxc1Z6ZHhYQllsMFN0WUZsODEw?=
 =?utf-8?B?TFAvZ29ZanJPdjY3SnZ5b3FUZ0FvbnhyQ29RUjZZa1JNT3FaaEhxL2lQTnVW?=
 =?utf-8?B?N0Q4SEVEZTdkWFlhNlJ0VGp3djlGOGdlZFRGUi9PaXlkdFBuYUYyVmJ4MkE5?=
 =?utf-8?B?dVQxSEd2RUFHRVUwSUtlQjdrS1ZsazdGLytjdTc3cTQvT2JUTlhpWjJOcVB2?=
 =?utf-8?B?dHRxVkRoa0crajVBS0E3QlhMWlJoeVVuY3pDdjI5a2VXT2lHN0pIb0FOZWRx?=
 =?utf-8?B?L0ZXWXRWY2hKMGZrd3MvMjZEVFF0S1dNbU9GOW93U0ovMC94YUxBTG1yV0x0?=
 =?utf-8?B?WGE2VkwvQ2g2SmQzTExUUlc1eXBZY2YzVy9HL0ZFclk0SDhyN294NFpYb3BC?=
 =?utf-8?B?Y05mNGx1aW4vUGgzcEhOQk5XR204Z2JaWDAxMkd3QzZZcG95R3FiUUpOY2p2?=
 =?utf-8?B?eXNTRDNUUVd4TUhTaG5sSHFORXhHc3h6T1ZjQVJJUlo4ZytBU01QVHpaQUNR?=
 =?utf-8?B?ckE2VFhWMTloZk10VndMWklrOWlWMHg1eURhRGJoRC8weXhDOEJmcHZVRXc2?=
 =?utf-8?B?SzNSNmRUNzZ2NTlDRHpwNyt3NlZWd1ZGVWFnYnRrRkVqNTZaQkU0V3UyK0pQ?=
 =?utf-8?B?dURIVHpoT0FOZEpyRTNGS2U2aUtuYkt4dVE4c3FIM3VlbHYyUW1FZ3l6VjR2?=
 =?utf-8?B?anlKcElFQjE1VVhQbWt2ZWNJbjhIL095K25JR0taWHM5R0RWY0VTb1VLV2FF?=
 =?utf-8?B?N1hYWk82VXErQWREWGZxT0RiSTdjNFhGUjNQcGFiR2hPdnRUSllVWlArbTE5?=
 =?utf-8?B?YWpwRXA4UXhQMjZ1dTJ4eUx1b1hYczJtSmgrcitxRXVSTFRmbDh5YXVSM2hs?=
 =?utf-8?B?bkJ2bG81UzVhQzRTWHNsaDlseFY1ME5CeEdZNjFNb2NtdC9sWGsrSXQzWXZk?=
 =?utf-8?B?RDVKcy9aN1lNbW5Gd2dmbUo0MGYzU0srbU10QlJ2Rng2eU9IU1lLbWJtb2dw?=
 =?utf-8?B?aUlQRWl2bDVoS2pUem5aZTV1UGdZWGFuL1hPeEtnT1VWbFVEak5GQkZQVUNM?=
 =?utf-8?B?ZVlTRFBxRWNid2pUUXZFUUNLNmtHS2c5aGZIWG90RGIrdlNnZ3IzQXE4WFc5?=
 =?utf-8?B?SW9MbEZOV2FsR0dTRyszM2U2WVlYTVVHK3NrYmlIZFJiRElOQUY4Z09ybE42?=
 =?utf-8?B?NHV6TmRYVFMyZm1YSksxUjl3M2x6ejA1eHZUaEhwUHZ3THBKQzNrVC9paXEx?=
 =?utf-8?B?amRMOUlpMlR4ZHRBanRsaDF2eHNxUjZnYVdRaE1iYTdGaEo2d1F1Q3ljemcx?=
 =?utf-8?B?K3hmTUxLOXk3YkJZTHM0RTZLZlZQV3QyNGE5OGwxYzBYUkNOT2V4SldtUVZ3?=
 =?utf-8?B?dU4rVTRGZjVaSHFYYzBSL3hXU0xKQXhUcmFtM1kyNUE0aTgxQ0VZb0hVUzJ6?=
 =?utf-8?Q?9RVzHIIoofZXMo3jg6HGDv8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fd73c4-25fa-487b-bbd2-08da0052a274
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:53:34.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a95HU9NEtdACAgbOyVU4b2o4m3ZCCSG/UgHlBgWCoKxkqW8/xWl9YoU5J/AghHHD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.22 um 15:37 schrieb Arunpravin:
> place BUG_ON(order < min_order) outside do..while
> loop as it fails Unigine Heaven benchmark.
>
> Unigine Heaven has buffer allocation requests for
> example required pages are 161 and alignment request
> is 128. To allocate the remaining 33 pages, continues
> the iteration to find the order value which is 5 and
> when it compares with min_order = 7, enables the
> BUG_ON(). To avoid this problem, placed the BUG_ON
> check outside of do..while loop.

Well using BUG_ON sounds like the wrong approach in the first place.

A BUG_ON() is only justified if you prevent further data corruption, 
e.g. when you detect for example a reference count overflow or similar.

In all other cases you should trigger a WARN_ON() and abort the 
operation with -EINVAL if possible.

Regards,
Christian.

>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..ed94c56b720f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	order = fls(pages) - 1;
>   	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>   
> +	BUG_ON(order < min_order);
> +
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
>   		BUG_ON(order > mm->max_order);
> -		BUG_ON(order < min_order);
>   
>   		do {
>   			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>
> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b

