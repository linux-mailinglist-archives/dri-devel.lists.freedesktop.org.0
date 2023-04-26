Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7C6EF296
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F710E300;
	Wed, 26 Apr 2023 10:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62110E300;
 Wed, 26 Apr 2023 10:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUTJ0/IYenex2muHJhcNsFan0XdvzNqcZnSiMcDLgSolmf+6x1EtzhO6tzxkl+2x2obmZSS9dvq0kM5JUy5Kw6mlqugIxHwc4GWwoPR6shtXstAv7qx2GX3hJ999HBRDo69k++elaWiY5hA3FMNUj4sJtLNLpA7Ak+ZVb3C+GYvZYowhLNW0l+Qbr3eoJHzm7nAXAvh1phz1IekVk7nDBVJiYIT+jI+vrBBNKWNLsMEgJMN+YAuFDuyjGnye5mVr3hL0PrZW/8GtjlHh1pKJbYbRHYERDi4bmF0AMx5cp3W5BL/LeAffc3/gkLH7ZNEKYKGUh5Op8Gee2JyLADZy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FxS8umf41lmyu/65e2IVli3W3e0MW2qOffYdNtstgk=;
 b=mKcexGVXpqZUmEl4Rfv+2UJjp1cMu7gQxzoF9Vj60lgtUm3DZXM3eZ652NUUArOn+thtyyXLoSVX7Wbga73X3HxY09BbZnzihRQSnNpKckxog+L2a8Yy6x/nTy/PP50GtIA8515BGCeg+CBUtWRu4jhPLL38A/2FWf5LuS+BU1BehDLodz1G/mpFpRfaLo+LfEaDJzvWRttfLPRxGovZZKYCK5JKrxmoCeBTwBJH/WCxMoaJ2AmL82M+EhmyKnQHkgU4Hfh/hEAgkzHF2QA9izjdzHRitSGTEkTYMcPDoBoOgZ9w5Hjm8CvxDV2tcZQxW2ug28NIG+rMyfSbCBA80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FxS8umf41lmyu/65e2IVli3W3e0MW2qOffYdNtstgk=;
 b=q46pWOsTaUjmwiAiN9HnCBU83PrHdsrD0VtKEpxJ16Wwdg0wHx6gButhZEXtWbfLobYxBHxeoUCILU30++TM8kT0NrIty50KeHRXwv/mkSMSQ8LJ8D3G2XDcz4GEgwcLxONIq3Xc0vrnC+muAfWi8Cuc3pKzAsBwyNglkAlJmXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 10:49:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 10:49:29 +0000
Message-ID: <e3fbca3f-0709-18aa-0951-b62556d891cc@amd.com>
Date: Wed, 26 Apr 2023 12:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] drm/ttm: Helper function to get TTM mem limit
Content-Language: en-US
To: Mukul Joshi <mukul.joshi@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230426015251.551223-1-mukul.joshi@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230426015251.551223-1-mukul.joshi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0027.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 374e23bc-11db-49cd-ca80-08db4643e950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WwocsepocAGXk23ZIhbjLtWt1ToNULJzjXAih+VrxRTWAedzePLZt22dbWLUdjUkEdHA+FcVNrBECd4+fFbY9VqzjSwiD7b+FEurh8I8GIJ4TJztELXP3SKPo0UuHAr6+GnbVpsBqqLhbpVJEg4NHdp8gafo4wSsmoomKmgYdCxfdS3Y0OCSq1EhLu13Atfzh/J12dOqJoAWh2megPyy1jWR8BsUXLHxNXpGL/uGDiK3qpZuBtpH61ZmrsfpmtO0OJdov7nR0mctbbtVkORhvvqWBwd104Nc9nW6Jgdiizh7Kvrh19W/cu5e4dh05XaERfxhVc28uFoxAC0p8L3dJHVH58t8aKQcGp5SEQJB2aF7RwuVU3vVfKEhqtlbgidnaO0lADKjNgTgGbz0MC9Uz2+4y3pU8lL7BZqYvf79W259VDm0GMuPL7pL+0i/puBXnOyFfqop9ScyopOcT6l8k8Ga16eprAZFuz8PMbqU7mM4NLvGqs5uy1gT6E8fwS+qNF4rXCj/+pVp9eZoG1CQDlTAMd47Sjhlniu79GRH2E828YhJfZaSOyYnmXURY8BUiNn8HRuyagSQfkuiXlyaS1sjoa0ECwitgsaKfNOc5y8T3Q7SEBDxJlvVIvxrrmvKDP8c6/PES4IZymH+i0LzIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(31696002)(4326008)(450100002)(478600001)(31686004)(86362001)(38100700002)(36756003)(66946007)(66476007)(6486002)(66556008)(2906002)(6666004)(5660300002)(6512007)(316002)(26005)(41300700001)(66574015)(6506007)(8936002)(2616005)(8676002)(83380400001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVFKR0lUaXFEaHFjdVBxVVNMK1FjRFZtWnZVK2lSa0FHVktPeS8rUE0vekdR?=
 =?utf-8?B?ejY3Nk1LRXgrWnZiTTYxM084UlczNEwxTmIrMHhwcVNRTThHTm1ldEpnektn?=
 =?utf-8?B?V3MrL09nS0JyZEE1MkZlVm5VeFZBQXh4bGdvcUNDby9Tb2hjWjAwL3kxczcv?=
 =?utf-8?B?T1orUm5sRWJWcENCSkhCc0NNamdUbkY5aElnNDUvR0RhTVpYMzJySUQwSXhZ?=
 =?utf-8?B?MURiT1cvSkIwV2RCSy9Pd0h6VnAvTG1zSnpuRWhwWTVUVUZDcElHSnYvUUQw?=
 =?utf-8?B?LzBXVHZNbklzRnQvbmpWSk5XOVZCSlFpRFk5aFVHQTZGWGtCZ0VydTJKQ0R3?=
 =?utf-8?B?VDRIQkVnMVFTRlBuVDBmdmdrMFY3bVdyNkRBb3BLSjdwVGg5SzBlL1pUM2Fj?=
 =?utf-8?B?Z3NsMnNMT202UzVyenpBNnNITVIvdFhxUGhjSm51Vkd4UTdmdmpXVWV6MDc4?=
 =?utf-8?B?aU1ubWdzRUtmUUh4NnZkRHF5cG44RWVwRGY4dzUyNnc5eWVidGxVQTlMWXhK?=
 =?utf-8?B?bE43QUF3dDhsTXdodUx0MVZYaFRlV2lHeGlCNDQ1bXNBb08xR2RUamYrb0tq?=
 =?utf-8?B?NzdXUlhtcTlKR1lhMDdab1IvcU41VHhhajUveTFGRGxWNlIyNXB4N2VrTjVu?=
 =?utf-8?B?TDRZa2ZMcksyQ2t4ZytNaXNwVGlkaDZOQVNjalpPZHY0UkFySnJ3V1BoTVZ1?=
 =?utf-8?B?Vjc4ZkJSUjRIbHdJS3Awa01kclR6VVlqbDlCRzJ1cDIrSTNvY0Rmd3kyb1F3?=
 =?utf-8?B?NTRGUVRReXhqTXVpb09jNXpuQXpCT0txMWhTRnZQdHY3NURLaUZuWTU2NU9H?=
 =?utf-8?B?aTE1TE52VW9RT29mMHc4Nmh4V3NndTFmUzZPSEQ3T29BZzdhSSt0YjFlMnM0?=
 =?utf-8?B?YVZsZWE4UFJZUmlqbG5CM014MnVnYktQMVpIU2dXb05VZkxwZW81QTFFeFlI?=
 =?utf-8?B?RzBISlFMTGQrWVVwa1ZZd0V0a2xrMmRLblBPeEFOZ0lxdGVlM2hGYnpxUnJj?=
 =?utf-8?B?QW04a3lGcXpVUE5lc2pISmE2eGtoK1ZlOWVRTzJUTmRLSitjVGFvL1pTMmZF?=
 =?utf-8?B?T0ozUFBwQzN5R3JsYXU2cE42MC9EWk5FWkhHU3RBZzFUeDVyUit3SUZDMG8w?=
 =?utf-8?B?eUd5RHcvdkFzQitDekl6bjFEWGRxSms0NWVrODNTVTFmK0EzVDVTdnJ2eldS?=
 =?utf-8?B?MEw3dGVGSVZmbDFkN0JQU25NOHlvNStiMjRkN1pVRVNyWmU2Q08yZmJnT09m?=
 =?utf-8?B?VXB6ZkdpLys1YkMrc21mYVlVMzN5OHpJYUwrM0lNZ2JzeVZSeWZzNk0yNzlN?=
 =?utf-8?B?Y0xlNTRaUDdQZW1kTVVQRCtOaHZzZGhwNFBwbk5GOGFldGpQN0oreTB0bFRN?=
 =?utf-8?B?SE12UUVGVUdvaVdJZVc0cEhsTFVVMnpjMFUwOU9QQXdvazl3dzNpcnpLNHZl?=
 =?utf-8?B?NGVJUEwzRUdDN2lOUGs0WUpKSld0M2oweWVqWGNVeGd0dElvNDZOYTFzV3h3?=
 =?utf-8?B?cjF1NFpLTmQ4N0ZxcjFBSDFxd2tCMmEzZmNIdnZZUWxWdGJRRzJaeDFmSkFL?=
 =?utf-8?B?YXR6QWxtZmcyWXB6QkZCL1VabFRvQkFjaDJtODNQVW1xWXkzVjg0V3NkZ0E3?=
 =?utf-8?B?aU9wa21kVllrcHJNcGNIMnp4K21LS2pMQngvZlMxZ1hramNyeVlQVi9ZdkpM?=
 =?utf-8?B?cVZSaWtpUUpTdyttWDQ3N05NY1V2RXFUaEdIM2FVdExrUytWZktQTTZ4bVdP?=
 =?utf-8?B?ei9QZ1NzTjRnR0xNVWF1L0VrbzhUWTNBMXZuTFlwdXo2SXJOemZITXpnT3Fn?=
 =?utf-8?B?bFRkbThhYUNyeGZKUWdxM0s3b1lMRmtNVkdSaElybDBaRDhXVzQ0dUQ3TWVG?=
 =?utf-8?B?MDhEbXVYV3ljUUtTQTcwZ3BLOTQvNnE3WS9ha2tzZ2ovRm8zZXY1L0w5Wkwv?=
 =?utf-8?B?TXFFSFFOVFFTMFgrUDBRbnRHQ0lQUVJQUERYQkRBZzFTUVVKMVZYeGc3a3I1?=
 =?utf-8?B?R1FDazMwQkpHWEc5NFBWbWdZNHVqVlFtRHp1U0M3cWFGakw3WFdnZE9HazFv?=
 =?utf-8?B?dUZhdWIxUmh4VC80OXVQRGdIZnF1eTF6RnIzNW01VFlhWmhSOVFyeGROVDcy?=
 =?utf-8?Q?V/3ZOUayeOouKE76oFTGdGfbr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374e23bc-11db-49cd-ca80-08db4643e950
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 10:49:29.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/7QPNwOZv7w5v1qx/Mn9+w7LxkdRct9CEoPLsiloVhELZ0xZl6TLg8B0dufOlMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308
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
Cc: Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.04.23 um 03:52 schrieb Mukul Joshi:
> Add a helper function to get TTM memory limit. This is
> needed by KFD to set its own internal memory limits.
>
> Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 6 ++++++
>   include/drm/ttm/ttm_tt.h     | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index d505603930a7..1f765dd7792c 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -449,3 +449,9 @@ ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>   	return &iter_tt->base;
>   }
>   EXPORT_SYMBOL(ttm_kmap_iter_tt_init);
> +
> +unsigned long ttm_tt_pages_limit(void)
> +{
> +	return ttm_pages_limit;
> +}
> +EXPORT_SYMBOL(ttm_tt_pages_limit);
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index b7d3f3843f1e..d54b2dc05d71 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -222,7 +222,7 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>   
>   struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>   					    struct ttm_tt *tt);
> -
> +unsigned long ttm_tt_pages_limit(void);
>   #if IS_ENABLED(CONFIG_AGP)
>   #include <linux/agp_backend.h>
>   

