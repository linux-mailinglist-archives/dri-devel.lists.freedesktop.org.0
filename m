Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065122F46F3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2062C6E24E;
	Wed, 13 Jan 2021 08:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200EF6E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOXKLIulUMOmIHA0wMgLkJH35xuskjWaotD33Xao0oTZGAR4TX9wu5A6MJPZANoEIvHyjPCF0c0x26RwzAi4yZmSHKLd2eyUpXPCx4SkC9x9V1TkidQ2QHbWqQqfIDuPk56hO+MI059Ta7miINgUPTI5Ko+uloWgFEEsRMMtXvszR9EwOY97HkQszKcpQPHdO0uEs1AgGn3pcSxWiqZqIdzbbpG00NCk3CnUgHaQJTcRLO3yppdjLgdBKq9WQ6g3PR09Ki/B3G3k6ubmG5PGfz9ZQOBEZN53TaX1jY8mK0d4n/jaHdHndIbZyYBEurYj6rk+OJP2FzrtScQqykPejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQFFHaAgLQXLb2O3QDYLRE3vofYjJfAzYPSQEgGdnN8=;
 b=Pis3z+mbjF5MO5TFfgnxY+JZN+eIh9oKDtxhq758uWoYX3hwySHMx/iW1PO4iTNNPDl6i28qaX/NsXdxSvHTdKvfbP8BkBk8JvpjkkCRgE3XmLWJR5uczCIcsDFuLfKFySM8R5wzAsJIC8ITedXTs6gqbObO4vM7VcBB+FZhJq5G1t71uWbNdtl1rawFp0dxdX6SuBD7qEV1TZLFL2yG4+JY/CRdYwVdAmHkZUd4ZKuc6N3ODE9rI0qeeNQUelJoaZygbwJYcAx2OorZdopzRE09p5A+UnlYOixE8WS9RUo2bGkwc16uR7KGVRnBkA8IFUa0LWTHYR8Gi9jDIvqGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQFFHaAgLQXLb2O3QDYLRE3vofYjJfAzYPSQEgGdnN8=;
 b=z/xesaWVCqItdapRgRPuT27jQX14H05f/KLXSMjYBu36ciay8ae5zUjuMo4cxb+5m+EKH3T8B+ouHHKaC10MdIfgepJuXUWSGTBRTtKOdp+xJzimV7Koyi6UOOWr6AtsPmpot/xX43qlZ5a+GK8mt/mAN5JyCBsq9VZ8U0+7haI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Wed, 13 Jan
 2021 08:58:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 08:58:53 +0000
Subject: Re: [PATCH] drm/ttm: use compound pages for THP
To: David Stevens <stevensd@chromium.org>, dri-devel@lists.freedesktop.org
References: <20210113084733.1181460-1-stevensd@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e0797913-7314-979f-cea8-6af3a67a22a6@amd.com>
Date: Wed, 13 Jan 2021 09:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210113084733.1181460-1-stevensd@chromium.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0115.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0115.eurprd02.prod.outlook.com (2603:10a6:20b:28c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 08:58:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc14621e-9f64-4f6d-80d4-08d8b7a17424
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4470002D4389958E9D03AC5283A90@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppe5q67W+Mswi0VB8B2o/btjfZqMtCkf9H4SoFrJO3tdJ65PK2lDtP2egGeTgbNd4h5FVyPprn0ezDR3j2LSB8xB9H1Fa37Gb4OlmKiin3pMHzwVDLejmoRcnytyBTbQ53uflThDZChj7PnKlHqX93fiGULNQ5Bvh/y0wdlptc94X0srclKSDjkuUV9LH0Gf7lJ5UYBqngBXR1sLlDGB6eauKc9vu+zlZoamEQRAo0Jjsg9uf/Agrr/BwNuhE1vttNAOnycBfExoSFaL10PpfTz4unjQbA8+6OKBjnqL+blXO+68koo4vSxDzbiJCfXANvKc4q29hV06g5oTBDjJ+2NfvZOJ92muD8Nv+QdMny1PukD0E6dZv1bWN+DC2tw/u6Unog06+nIdFkJfgSmhJU6yZplzCYXrzqk6Y0b1CF7U4mGXTc+oQJGWj3nqOwiwNGFTVq7vLybnMn7N3PX/4d5dVHVkxUD9bMYhMxW2Lt8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(83380400001)(52116002)(16526019)(31686004)(36756003)(8676002)(186003)(2616005)(6666004)(86362001)(478600001)(8936002)(6486002)(316002)(2906002)(66476007)(31696002)(66946007)(66556008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OThJZE5PdnBmc3NtbzFvWHovZzFCZitZMmx0bzJyYTYrL0FWcjZ6Tkp0NERW?=
 =?utf-8?B?Qm5vRkJFbEttRk5xVXIvZmJpRlI5RjA2dzIxV09TRXBSZklmTkFlbEp1MDlU?=
 =?utf-8?B?NElaSmJhSm9IQWZSZG45dzB2Tzdzd1pzZzgyOTJRSkw2UHNCcUczYUFmQmxx?=
 =?utf-8?B?d01rWjhNcHRycVZyd0VMSk8vazY1cllzckgyVTdiZEpXZ21MN2IyQTlRTUZY?=
 =?utf-8?B?YW1ZTTIzL1ZNcjA4emNuV29CWjJaM1BmVElESVdUYUE4Wk5SSy8rYlptVnM4?=
 =?utf-8?B?QUt1SW1pOHFSU1Z3KzdnMUNrQU5VdldtMHM2YjllZUF6K3F2WWFITUZCbmt5?=
 =?utf-8?B?WGN1TWNRK2o3QUp2czlheUlFNE43cDRpNkEraEZLemdmWHR5d2JvdVdsQ1JX?=
 =?utf-8?B?bWFmeko4SDlOOTRVd3dmUGRrV082T1hSdXdVbHdtK0pNcWlsek5MMys1Smli?=
 =?utf-8?B?ejhFNWlsRFFEa0ZwREtPMEQzcCsxU1FxdWlsUmZ0Rjdnb0M2em1IZWtRdVNE?=
 =?utf-8?B?N3hPTjJUWlVCZDlwNXVBMDJMZWdPUkJiT3J0cHI0MWY5bytFVjJxelRrQ1NT?=
 =?utf-8?B?REFyWTAzYWVDSzFRdkVHMi9IUm1TQ0QzZDlQZ1JxK3hYYlRVak5ORW5kVStl?=
 =?utf-8?B?NHM2T1hSOGtHdWJFaThWcGNmd1ljT2pRbWMzMmdFS2g5YUNPRmdjNzlXVkVS?=
 =?utf-8?B?TFpUcWtIRlhCMWpYMjFNMXpqM29DN2xDL1NHR0pQdGlkWDVmYlk2aDVvQ0Rq?=
 =?utf-8?B?SS95U3IwcDd4SFZoSnNNM1Y5ejVsa1p4eEo1RmRMdXdGZFcyZ0hPOTNBa1Vy?=
 =?utf-8?B?SHhvR2lSZnA1dlM4Zm1YWGwvY0E4d3FpM1Y0UnVGZ3AvQmlnVUVrbGhWSkMz?=
 =?utf-8?B?djZMbUFNNzZ1SXVubXBRaVh4M0RBRXNyS1pVY29kaUdQWTJOaUt4S3RqdmJt?=
 =?utf-8?B?WVJjdWF3R0pHU2xFMjJWWXl0Y1VuTlNvQ0VmL3p4TWhzK3RJd3pxanBiVlFi?=
 =?utf-8?B?OXNwNjNWT2tCd3lhRG80OXRRb0tVRDNqWnhTRzV1UGZodVpEakF5Vi8wY0Uw?=
 =?utf-8?B?R1hKME1ZOHAyTnBQaUFsRFVocWRwa3hLNDM2VnJBTjR0c1Y3SityQ0E5c3pP?=
 =?utf-8?B?UFprUnhRU29mZlNrNTFvcVF3QkdiaFJxcjJFYVF6c294anE4NDNBdHBmdjdj?=
 =?utf-8?B?MGU0K2Z1TFpjZEF0OGNZWHZrNkJjL3ppVEtyejhDL3pYUmxCWDdPanJ3Ti83?=
 =?utf-8?B?TDBxQnpKRlhqSVRHdHMxMjhBRVcwL2VKL0NxYTBjVi9EYlREK1hWT0ZTRk1z?=
 =?utf-8?B?SU1nU2o5RzRBU2xPOWdVeStTMTF6akEycjdoU0ZSMTlaRUxhOGp4akxYOXV4?=
 =?utf-8?B?K0tHY2JXVHF0YjYrcG5LRGREYVlRSUtFai9vOWFSdzA0elUyaVgzNm1BL2dV?=
 =?utf-8?Q?fskC5luA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:58:53.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: bc14621e-9f64-4f6d-80d4-08d8b7a17424
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwlBWcAu/40/6PcfKjZ37lqHy+7MoC+0UX7kvBq2s+dPhyUNM3ytxShl7/OETKmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.21 um 09:47 schrieb David Stevens:
> Compound page metadata is necessary for page reference counting to work
> properly on pages besides the head page. Without it, put_page
> corresponding to the last outstanding get_page call on a tail page will
> end up freeing that page, even if the bo still references the page.

NAK, I should add a comment since I can't count any more how many times 
people came up with this.

Calling put_page() on a TTM allocated page is strictly illegal in the 
first place since they are not reference counted.

Please don't tell me somebody once more tried to mmap() pages from a 
DMA-buf created sg_table into a process address space?

Regards,
Christian.

>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>   drivers/gpu/drm/ttm/ttm_pool.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 7b2f60616750..09239b93dc2c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -83,7 +83,6 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>   		gfp_flags |= GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
>   			__GFP_KSWAPD_RECLAIM;
>   		gfp_flags &= ~__GFP_MOVABLE;
> -		gfp_flags &= ~__GFP_COMP;
>   	}
>   
>   	if (!pool->use_dma_alloc) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
