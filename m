Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FD32D838
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FA16E0C6;
	Thu,  4 Mar 2021 17:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FADD6E0C6;
 Thu,  4 Mar 2021 17:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvkiroMs5MIwGSEeIH09ZUNFaelPxMTflKC3hQSIBbc5AYiDl//BVzIg8esPFSoL/d/xoE5ojvUkgnyp0E1Xc4HoI/oqp1UmSLnYIt/w+fefnj5q4tjpxqfSN6/rHk5pqLnYeiA/LNgmtULXLTPBOeypErwL2tZ7fU8zM0HJAAG3tfl8JvC69UeCt2/RQshYVSZGxWI09n4DnUcZhjp6A2DtTjmc5duGYGiW+VdU0AUfNg0/s87fq69eVbD0bJM+9NxC+p21Bsos2OGeh1tdtlSPJcqRkLByGIiZn4BpUmakyisjww9pwCJ0bXu/j7WYkRu8w/S6Mm7AWEZ/gmcVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVHNXAxP/pRrBWajF6+vnnhaL5HNFJ/CCpj5PVGYkLU=;
 b=Ra4iuXdLwIOF23zmo1CQ61jG4KTwxOcCJ3uvcGy+gm2omlB5ekgw3Pq31QgwT2vmGNMelgl9apQrzyxuJwSpkS9iBVe1uaLNAWpg+/X4ZigeOaQpT46o9SCb1+ZVcffHsL4M9pBzcYefanhOWM2CvvwoEGTfk0D7XZXUQuQ9eomzDT1rlITs+/6sTzpqwoWVxoieOj8nQ2r+b+lPhoHbKAaNWNBcxa77nEZ6rXbGzKQzJmm/8k8k1GEMAI4Ue81JBaxTqOc6bsh1I1iPTk24dc2S7c01yaYdxvMzfsJ542o+eR9DglfVn+6a+NYB9CnILDKFXf3tFM3mdmzT3rYYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVHNXAxP/pRrBWajF6+vnnhaL5HNFJ/CCpj5PVGYkLU=;
 b=X+PrIrRVue+yHEkVNbK7IP0AR9qR+Kn6yt8ldI7zcadpRxEu1JN1rAw7zlzsOj1FsmgrmORme/4MHBx145tFYra1l/XOQIBNrOQ3Ic38kuBqRNCUax2dZbqtOLWjZhZgsLtmYWfEM9c7n30LgePBU2zUCkVMqdv2+8mTY6OrGJo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4097.namprd12.prod.outlook.com (2603:10b6:a03:213::20)
 by BYAPR12MB2952.namprd12.prod.outlook.com (2603:10b6:a03:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 17:01:58 +0000
Received: from BY5PR12MB4097.namprd12.prod.outlook.com
 ([fe80::a8bd:e678:1c74:94f1]) by BY5PR12MB4097.namprd12.prod.outlook.com
 ([fe80::a8bd:e678:1c74:94f1%8]) with mapi id 15.20.3890.032; Thu, 4 Mar 2021
 17:01:58 +0000
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, brahma_sw_dev@amd.com
References: <1614873891-5836-1-git-send-email-Oak.Zeng@amd.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
Message-ID: <69501a46-ffbe-437c-3651-03400b3455a5@amd.com>
Date: Thu, 4 Mar 2021 12:01:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <1614873891-5836-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BY5PR12MB4097.namprd12.prod.outlook.com
 (2603:10b6:a03:213::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.4.42.239] (165.204.55.251) by
 YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.26 via Frontend Transport; Thu, 4 Mar 2021 17:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36bebacf-e8d3-4d80-cdd7-08d8df2f38ed
X-MS-TrafficTypeDiagnostic: BYAPR12MB2952:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB295257B5588C12A6AEA425A0FE979@BYAPR12MB2952.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbZy/pab2IX4yGls1gETplHhdlZI1JDce85vYGa2H1JwpzX4oqWPbCfz4uXypHg20LEOTnoPZdUVYdXFGWDf7HOj/RU5CxpDY4wfKIs+urwnMXWbT24g86WSNEomPfyhfxrYAJ+dNTVq3vzI1VcI2Wk809uJLEvDAuAEcyzV1wYFewic4CAOUE1CeuCCZQxIrXYrQucxEtUUydzwlu/HhQKZDjyS28XORK3oRAUf0GfJLb8KtnOtmQILoABpn0dSsFAwsqB8Ut2dUwTeMDskVKBY8IkMAL5PlC089FPNgAFJIPNA5JPyj2HZcBe/R8sApCFYkS/94RZ/+CD0FmOnXYfml5rYYz31JhG/JL7tTKLDDydNalOk4vSgulDKi2XI31MAp1dZ6hUqVqS84JDk2dJy+jRMYwmT5kjlvjhKVbsK8u7ccV6yzI1mVOHPZy5KYrRgl9VeRY11ZX1K2Tau/5PiW6Mk5y5hW9atOakPKsGFoF+Exiz6OSsAhJmjq62vOJJQ2qwNQTYozCd8VhVR+55E9MKQvcR5Bp3D6bVeqqq9OT6F+roDn5vIV+d4QKdkmevAlCPNrH+ZatXs/aDzl+ekOq52QJA4+A35ombR9QQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4097.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(450100002)(6486002)(66476007)(66946007)(66556008)(5660300002)(2616005)(8676002)(186003)(53546011)(16576012)(956004)(8936002)(36756003)(26005)(2906002)(316002)(31696002)(31686004)(478600001)(16526019)(4326008)(6636002)(52116002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2plRGZYSU90ZDJDRXhub2pSMDlNTVlmYVc0WlNUYUV6MDdTV3BlVWFkLzVW?=
 =?utf-8?B?L2dWMzlYczN4NEo5c3k1WGJMWXJiYVlVMXNJYjZjSzBuR1BCWTNmV1ZzbXYv?=
 =?utf-8?B?bVRyeXRrNGFnK3JOQmtVMzhhVHl0NXh0YUhwRFBiVnhsTlRrSjYzdTRsK3JK?=
 =?utf-8?B?V3RDeExmZXZkSkswOXdsdEprODZVY1lYTlovYktoQ2ZtWmk0ZjhOditlMzV2?=
 =?utf-8?B?YktBY1dOdHVZM1Zmamd6UXR1K1NwNjlYV3l2djlnck1NOGNvMU56MlJMcEJv?=
 =?utf-8?B?Z1pGVENud2FvczN1OTk2QVRZM29xWHBUSGVzUjBxRUVSaTE4QzFha21NSlgx?=
 =?utf-8?B?aVRQMjRhK0drRW9UdTcrVHRJQWk0YkpkYXNNOVY1bHBYeTVHNENobTM3V2xm?=
 =?utf-8?B?Y1FMMjJkdWFmbEN4eGJyKzFKaGVXSnN0bnVyUlRUL1J1eFlLT3RPbzMyeE43?=
 =?utf-8?B?aUVMeW5sbk1sR2RpdUV1b3NVd3hmYStEZ3BiZnBLekJiVEtZNXl2MXRpWFBu?=
 =?utf-8?B?TnJjZHUvanl5ZjVkR3U2OW5nZjBPUVA1dFVTelYrNXlURkwwdFlwcnZOZzZw?=
 =?utf-8?B?MUtITjd1S3liREVVN1o5T3Exazd5M2FoUVpheUFqMzJYNUVESG9mSVNadnRQ?=
 =?utf-8?B?b2RZWWdscmoyV2FvZXRhY0lEcVZHNE9wRS9IKzJCak1MWmFkNUw5U2s1NjZL?=
 =?utf-8?B?WVp0bHlBV1k0TUk3MHFJVVBMcmVvQnlBdXJySEkvVTI2Rk0zMFMyM3FuTDVG?=
 =?utf-8?B?MkVPVUsyTTkvZTUzV1VSTitocEJpalg3Ri9Lcmd6MHQrM1BLR2p5REVXMXpn?=
 =?utf-8?B?TmxhclBDYWpSdHNNRE12cG5kMU9nRjVRc0MvL0dBbnl6cjREVmVLeHdqc0d5?=
 =?utf-8?B?K2dPcjVFUGRsSnFPUDlpSHV6U3FreXZtYzUzSWNwQ3M5YXd4UnZpVTlqQ2N2?=
 =?utf-8?B?UVg0R1o3YXhVT3ZSd1RYUFR6aWtKamlaVnhkc29OSi9BTG45Sm8xZGFtTFlx?=
 =?utf-8?B?Tk1MVWRtOGI2Q2t1R2Z0UXgvNWxRSG5tNkVueWNKY21kQUVoTTh1ei9lMURv?=
 =?utf-8?B?eEdIY2RJOWloN29HZDYxSWNFdS9EeDJHNTBoamxNRm92R2J1c3NiMXVqWi9x?=
 =?utf-8?B?eTVnK0lXMUtOUGwzVXZnNHdQUlhqUWlLOXVYdWMxUC9RQnFxMUhrbmVMR1lm?=
 =?utf-8?B?azR6dm9pZW5ZM1BVazRLSXl1WTZGNmFwQzY2SG5MVkE4dm5kK2paNGY3eERi?=
 =?utf-8?B?MEY5a3dnOFltR3ZTWExLclRDTFVqbWhLSzMzQWFqNktMWEd5WVZVWjhtM0JS?=
 =?utf-8?B?K2cwYVppZlM4cjBFT3hvT1Mzd1ZjZTFYcFI4S2E1ZktEKy9LVnc2L09DaDJy?=
 =?utf-8?B?SXNWRmNZeXFUTFRjVXdBdXN6bmJPUWtmOWRVZUxHRHB3RFB2WThGaTQyb3JM?=
 =?utf-8?B?Q3ZJWDA0aDhMN2hHRVNtcW1CMGNyZllMV0NOVGtrQ1RwTEZxYktzZzQ2M0o5?=
 =?utf-8?B?YkVVUmVWcWFucmtaWjlaMzIvNk0zYkRyVE1IV09hUXcrRk9ldGFFeWZTUHBq?=
 =?utf-8?B?bk5qUmVwanhtTmNwY1JLRHAzcWx1OXBGUGhWbVdYLzBYbUwvVjdHWkk1blNQ?=
 =?utf-8?B?ZlQvWERGaWpuSUFzNDZMVFY5eDIwMDBubCtuNG04TVNVSTVRek5nVFBUN21n?=
 =?utf-8?B?VVVIbFh1SG5zaXl3YStyM0puelhxemNHUzVPdmM4aFdHU3g3ekpjVlN2Mmdj?=
 =?utf-8?Q?V8Gb8jcfG+omrfCtjmTNzeMJQ1rgjAjKfnCDUqm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bebacf-e8d3-4d80-cdd7-08d8df2f38ed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4097.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:01:58.7308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56xSLd2Vk9xiegV2pK69r4LWADG6QtI1CR1BPAjkVux24N2iYFP8J6kkHhPrCtfcTH5iURuRrv4FHnqTh2ueIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
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
Cc: Alexander.Deucher@amd.com, jinhuieric.huang@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was wondering if a managed version of such API exists but looks like 
none. We only have devm_ioremap_wc but that is valid only for 
PAGE_CACHE_MODE_WC whereas ioremap_cache uses _WB. One more small 
comment below.


Acked-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

On 3/4/2021 11:04 AM, Oak Zeng wrote:
> If tbo.mem.bus.caching is cached, buffer is intended to be mapped
> as cached from CPU. Map it with ioremap_cache.
>
> This wasn't necessary before as device memory was never mapped
> as cached from CPU side. It becomes necessary for aldebaran as
> device memory is mapped cached from CPU.
>
> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
> Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 031e581..7429464 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -91,6 +91,10 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
>   
>   		if (mem->bus.caching == ttm_write_combined)
>   			addr = ioremap_wc(mem->bus.offset, bus_size);
> +#ifdef CONFIG_X86


Please use #if defined (CONFIG_X86)

> +		else if (mem->bus.caching == ttm_cached)
> +			addr = ioremap_cache(mem->bus.offset, bus_size);
> +#endif
>   		else
>   			addr = ioremap(mem->bus.offset, bus_size);
>   		if (!addr) {
> @@ -372,6 +376,11 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
>   		if (mem->bus.caching == ttm_write_combined)
>   			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
>   						  size);
> +#ifdef CONFIG_X86
> +		else if (mem->bus.caching == ttm_cached)
> +			map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
> +						  size);
> +#endif
>   		else
>   			map->virtual = ioremap(bo->mem.bus.offset + offset,
>   					       size);
> @@ -490,6 +499,11 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
>   		else if (mem->bus.caching == ttm_write_combined)
>   			vaddr_iomem = ioremap_wc(mem->bus.offset,
>   						 bo->base.size);
> +		else if (mem->bus.caching == ttm_cached)
> +#ifdef CONFIG_X86
> +			vaddr_iomem = ioremap_cache(mem->bus.offset,
> +						  bo->base.size);
> +#endif
>   		else
>   			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
