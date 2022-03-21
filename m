Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED494E23A1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8A10E326;
	Mon, 21 Mar 2022 09:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C6410E326
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyBaXp2PIKW8Ruo8cRzG+zzget6yiobyB7Wjs3fkEW41bWAZSNSzEcCEwYE2AuS8D8J2IZ8+GyeQBrtJaSO79HqHWu7q00vgncRpgyK4GflWFNng/aXPDK1JvqSO1p6NlomHG2aUelBhoNovkZpCS5kc9Q/Ome/EhKHRgC0u+qh+tawScn1SQoaFIU6AdYHTi4Ng3gwFJVoBW1VZYRaRBtIvTKcDHjfEc2eyMbK/co1vVuT2LHcEbGRTfturl041/tCT+tzN+StrrMwjXqCRlMTNrnQnHvmHtHy3dAED1dQkIsy2JIk99wAESJuvy5y7Homh/3CVv01ZQ8Z55yrXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdM+8CraNUcODBZ+ejblVoCAp9BYZQ1XhAJVplxHj3k=;
 b=do/s/5qau6+/FxIGdDUXG/9iGyGEAWlxKRn4LH6je8SDtbofk5kzg/2QCcN/O1ii+CF47HM0SqTcKZANJsukG5SDD172fR2/8G6O8dJY0mNjl62MRpLfLFl4o8p5Syz6e3L73ORZDki2s0/T6haj4LFp1CU/r9le6kAJhhlm+p9e8tPnLYOA+HHNtqp61glOhh2lEtLFm4tVYDC29lE8TNZdymB4VIdqzxWdjlJBYg9jcWJu5z4owKg44Fz1rzWXrHc5jLwjoz/Uu6PHtPk0L2Sq8f/YECxVf8ktMnRqX03t6aCFgfgm6qh6Y3UnvsxEwP3kRTa7r6ReZCAd1JhjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdM+8CraNUcODBZ+ejblVoCAp9BYZQ1XhAJVplxHj3k=;
 b=P8reFv0Hgl8blucNXaPhMCSX6Rc1tYmX+24kpvhBKg0NRKh327OvTvPHwLtxfkPF+M/eD5SxVcFBM9H4wfrkaE72TI6M3e4bnyqtlOYfOoBFMJovP+DCwckgL9LXCKoZm0gNP7x88p32b2SwUjkTPT473Swn7dSVxHaJHFhMF70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 09:51:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 09:51:43 +0000
Message-ID: <8688c626-5858-18ba-593b-cdf179ca5201@amd.com>
Date: Mon, 21 Mar 2022 10:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/ttm: fix potential null ptr deref in when mem space
 alloc fails
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
References: <20220318195004.416539-1-bob.beckett@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220318195004.416539-1-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10c3bbf-73a1-45d5-88c2-08da0b20678b
X-MS-TrafficTypeDiagnostic: DS7PR12MB5839:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB5839D6A8932A8E10BBB70A9E83169@DS7PR12MB5839.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RviQt0aEJRsyfpHgGI/inldeniE4c6dmLgF+i9IDTfQbkHC+YGBU1O0hsZ9VSwqho0CMKwfPxWOXAY/3ThPP+MRFK+O8GfyACOKJOydT4aOEL2ALFcQZrjVkcOL+Dl/wUJrp25By4P9KBfs2gR3zVS8vpt+959qp2naxVU8CK1uu8Q8amUvPhwn8sVXRih2JVrZCOQr84xtsTnLZuT4CLqazhp1cHKeE6bLtWvrRhqhSc0tchSmYXho1S4UmPVZXbi9+tPi8x+2o9xKaLZp7gXtREcxOOQBZeg5755AsybdLlu7YhSVee/gWJ5yUtpB5sJEHltZNlJ4UGKeCeWoAGO6xorWCSYxuv2/clnlNXAef/8o5z+l8W5pewJzx0tzvmiEmh7zm8Pw25S+4jzrO0uCUmHeQr4yK2vcQvwTmAm9N8dofZA2WUdCzlBTbuxWwW/fT0JlubU9sNJUCUgPc8aYXVW1YSEwkbMltXRLgOK1q6SLOR03kdzH0groWCjH6wRZC0JdpXZAqaUzL+UCrq/0V72b86HJz1u/J2WCi/pKCA/Qco1bXJZWlwig7vQkh+b05gXLgY12OZWJp92ds7Gp2wFB3drxsyV0kd0Gz2VhY9Mq6JM4nBnabMCGvbG1weV0vFYPm3xyE/H4SCj9XnLTEfbvTSiminNgEmDujfBg0DX0wFNBrFWKF3JT9Hsngl8OlrDVaR0Ru3tcVuh41t7PG7XrF4FWDVom5wSEjb4YwRYPahow0HzUfNjxiT8MN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(8676002)(4326008)(66946007)(66556008)(66476007)(508600001)(6666004)(6486002)(8936002)(2616005)(6512007)(2906002)(316002)(38100700002)(186003)(36756003)(5660300002)(6506007)(31686004)(86362001)(110136005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHA1NktQTkxLQldNVS9JY3dqT1dwUGFZdmZpMkFpeHFKZTlMb1JPN1NMRFZx?=
 =?utf-8?B?aCsvUTZVVGl0N0JaK2haelROR05IZjZvUWUvSzZwckNOa2xuWWJJOWVzaTFH?=
 =?utf-8?B?WEVYSVIvWjVjSW9NQVNYenFjRFR1cjFKNlloSTV1SXkxbXIxaE8vc0ZLclhs?=
 =?utf-8?B?aUtNc2RnOTlaNXBSNS9FSUg4WG1WMDYwWlpVTDRqVlVOZnpHYW5oL3NRWDFD?=
 =?utf-8?B?bE1kLzB6MnVGVnVLYXEvekZpamxqaXFkblEyZFV0bXppbkl4OVFUdXg3ZTA3?=
 =?utf-8?B?OGg5ajg4V3JQU1hMVW00d0M1dlJXY3V3N3pzQ3NlMVEwQTVIV0dOeHA4WUV0?=
 =?utf-8?B?ZVNLTXBxTFppWFRwRDg3ZUFpTjN0RkF4V3NXVDA2SEFHWXc3UUJCNzRpREVn?=
 =?utf-8?B?YUtXQWZNeHNWQzRpTk9xMkM2MmRJaWo5cXQ4WVVyOFBDemNHYWxSS1lNQzlm?=
 =?utf-8?B?OThTY2QvejFDam04NDRwZll1a1o1eWduMGxobkN1RU1aUFp6NktVK3FNRm14?=
 =?utf-8?B?emdzbVJrSXk0Zmhqc0I0Skk1REFhMXROYjlLUTFIWXJMT08vdjlhaEw1Y3A0?=
 =?utf-8?B?UnA3Q1ZIU2FmeGt3T0ZPdjF5b3UyZDVEeHBQdUF0N0N2YlJ1YkhMK3RwM3dM?=
 =?utf-8?B?VVJJYytjdDFCYzBKU2ZveGI2anBac3U1SE1VcG91cmRpSmpDTHVPdGw0N0du?=
 =?utf-8?B?dEZacThUTnJ2UUV4UlFWd0huV3M3VUlkeitBRU9ZZUFpVXpaNGRVTDFFU3dX?=
 =?utf-8?B?N0JOSEtVcXI2eHBUWVBKQUNCYVVNWWVoeXg4b2RFN1VxL3JWbGdZZTk5aEkz?=
 =?utf-8?B?NDVtVzNjZzhUQVNaT2ZYVkM1KzFaVzYwTVdPbENRVWk2M2MxQ3hXclpOazlW?=
 =?utf-8?B?YktQTEpPeTR1dlhaT294eXhxeWY3SVNLcVpPcTNhcWN3WWhJNCtRc1ZFZm50?=
 =?utf-8?B?cjVEWmJqaVJGU3BJaFFzV1NaWTdxRThSdFZQWHRrSERuMDhsUGQzMGcvbzFQ?=
 =?utf-8?B?UklvWGtUczV2bU15c08zUXIzemUvbjVEckRZemFUSXRVUHAxYjcrVVRJaDVq?=
 =?utf-8?B?bkdRZjRaMDVQU255MmF6NGM4b3h0b0h5a0hObWZHMHVpSVZoZWRiYWpINlF6?=
 =?utf-8?B?dkJFZGtIYlM3QW05UWNETTEzYnc5cjBHeDNOd3pIeEVGVFZJWEgxb2hUZG9G?=
 =?utf-8?B?cGhOdi81dlVNN2V0clhTS3lNRVNFSERhSGtnUS9MQmZWQ2pTNzhOb2laMk4y?=
 =?utf-8?B?NFVKd2txNCtCeTh1MFlHMmVMaXFhWWpEQVBZNlRCOEw2OThyWjJUTytWZk56?=
 =?utf-8?B?NXcrR2RTWDE3bHZvMTMxNmRHZWZ0Q09EOWdoalVoN2VISFpoWVJiMEI2dDhl?=
 =?utf-8?B?UHl2LzBOekVCT3lENktmMHZRTTlKM04rNlpnbnU2a1Nib0ZLNUZRNEVuYndD?=
 =?utf-8?B?M1hqcHA0N2RybmtDYWFHcWtEcFhkTTJHZWJ6VlVHN3pQQXVDaVVKRS96TUlj?=
 =?utf-8?B?bjNpYVc1TEhCbUlZbmlwd2h2dkdPMEVyZGxhL1ZpUVRjUU00NGllOElmUjAz?=
 =?utf-8?B?WGpLb3BBNXZXMUtzT2Qyd3RBc2tYZHZtZDVtMVFsZiszWXUreU8rNHZVUzhk?=
 =?utf-8?B?VkdWN3pOU3Q2SE5Ja0dDTytHZVkreXBXZmNPTG9wNHMrSXpUUHhhL2RqTW9J?=
 =?utf-8?B?QzkxeUV4dld5VVhWTHUvVksxY0E2Wkw0bzM4UmJVMW9QYkpkR2R2RTdmS0NH?=
 =?utf-8?B?cHZSVUw2NVg3RXJFSzhCcm5wYzJFRXBpd3R0ZDJWYWUrVlJUN0xSRTIwNUdH?=
 =?utf-8?B?UHdJQ2t5dnN6YjRpUWxwMmI3N3ZRTFpVKzlPY2NML2hjcWUvWEFHc3AzM1dw?=
 =?utf-8?B?ZjFMRkVaWUtxTjgvU1FyQkhQK3l0aDlVVlc5UFNzUEUwdkN5V2U5aTlSbWFp?=
 =?utf-8?B?czVLeUVSMmRRSFJRaHhsRzZQZTVEMnRINE1FMyt2YStuZ0I3amN1N3lRbExh?=
 =?utf-8?B?dmV4QlkwMkVWYWJYZTcxanpRaFk1Yi8zdFZkQzNWK2c3M1R0a3NoVk5YaEUy?=
 =?utf-8?Q?ZZwVlH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c3bbf-73a1-45d5-88c2-08da0b20678b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:51:43.2278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3ebCxAGl6Uw4QrDJ2Ywnc9sdti8+xcHxl9jt51CiTkEa0S95CB1ef4jmCyd+Lzv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.03.22 um 20:50 schrieb Robert Beckett:
> when allocating a resource in place it is common to free the buffer's
> resource, then allocate a new resource in a different placement.
>
> e.g. amdgpu_bo_create_kernel_at calls ttm_resource_free, then calls
> ttm_bo_mem_space.

Well yes I'm working the drivers towards this, but NAK at the moment. 
Currently bo->resource is never expected to be NULL.

And yes I'm searching for this bug in amdgpu for quite a while. Where 
exactly does that happen?

Amdgpu is supposed to allocate a new resource first, then do a swap and 
the free the old one.

Thanks,
Christian.

>
> In this situation, bo->resource will be null as it is cleared during
> the initial freeing of the previous resource.
> This leads to a null deref.
>
> Fixes: d3116756a710 (drm/ttm: rename bo->mem and make it a pointer)
>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index db3dc7ef5382..62b29ee7d040 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -875,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   	}
>   
>   error:
> -	if (bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
> +	if (bo->resource && bo->resource->mem_type == TTM_PL_SYSTEM && !bo->pin_count)
>   		ttm_bo_move_to_lru_tail_unlocked(bo);
>   
>   	return ret;

