Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C438B3B2025
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 20:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18776E96E;
	Wed, 23 Jun 2021 18:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1D6E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 18:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxKWD06WDV607ePqo5soMjcbr3wxuZxBuF9pX384gYxLQVS4gheoUJlyJtEtkIylmuZc4tfk0CIGE+6tyIG4qiVgw8Ov660s1C7oqDN/cs/qRw9kdFwlWvtAT1/L5n1hmXpG2qsfCoz4s7+l9OZxnTK1ZNt380NkihJmU94lAleiV7jQTRkt/h70kd9tO5raQKpoZvsZkiG2DiRhybl3BwguVpAj7xLrh6xEeSPUzhC16Ac0DMCzR+Ul0wlyxZNQ4HfIZx0NIcQwwCXD0yo8E1XfW/fhtD2mKQJQnzwYbqmH0wJGdEgOZdeAYcCeBYrdWsIvVnvUyqEcH+kbslRyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcuDNiBuHBjI+rFkdFsr7knx7DI7evnZzjkq7y3RcYg=;
 b=VvKrYXdK7NDVGctNHVi7zZnDhAL1zN0nn4hzIP4U8oXCH7HKTKPeJnmH51oaKVeJ0Kj4t1SpU6A3UOlftFYfcRP29PMXdfZv7ySWJJLBZCksLZdU49+SZmRw/sklW11HrcO1WbAO+PNWbL2tTD9wnabxVmCg90D2btQbuf0n+8+5c1yjNnBwUyf2cKLMe+ycQZp2X8Oeu+fM2lwnspcvAxraPKZG6DyOiu/SI+6kJIOcQZFoSyjAEgvYwsdHJvZESqnYNZJxTR9YvUWgE1/7Bzxc/jIhgZP6YCIDCMl7IV/1f6r0jxf/8HVXXsF4VEj8Ovw6gnKO9fyzuXSbmS65Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcuDNiBuHBjI+rFkdFsr7knx7DI7evnZzjkq7y3RcYg=;
 b=YKbaWU9zwaYpVfIh3DvIKRcJYLOZe70G6ghVy2Inp0SFRsEm483sT9/Dd1fYIcTUEFrCZZJJ9jFrCG5cWKf+sqP47YLbnhaSrMC+w1XPiQp4BKugy2H1XZTg80cZgyBmIbLRYVBMDMn8yK1hw8tJ1Spw59M5z+RiDrI5bH0OE+w=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5135.namprd12.prod.outlook.com (2603:10b6:5:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 18:18:31 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.019; Wed, 23 Jun 2021
 18:18:31 +0000
Subject: Re: [PATCH 1/6] drm/ttm: add TTM_PL_FLAG_TEMPORARY flag v3
To: dri-devel@lists.freedesktop.org
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <fabc2a74-37ee-7a45-25a7-178f2faf6c29@amd.com>
Date: Wed, 23 Jun 2021 20:18:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f23:b700:999b:61ce:dd13:3b25]
X-ClientProxiedBy: PR2PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:101:16::23) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f23:b700:999b:61ce:dd13:3b25]
 (2003:c5:8f23:b700:999b:61ce:dd13:3b25) by
 PR2PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:101:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 18:18:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a782331-4b77-4d12-6d2d-08d936734e19
X-MS-TrafficTypeDiagnostic: DM4PR12MB5135:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5135B1C0EFFC623FF23E645F8B089@DM4PR12MB5135.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6P9Jow+S282+UrC/Zsto0GHy8YPx00eDbfxpE+xbTNKxDyMvDLnLbYnjeTdQgOEaGNJcUoNHsIejuRYtgTgE4hjmkW3SgnrSmBtyqzpCVyJLmxAVo2IOhnl+yTLIIcwd+e44txhnqgBYJc2p8N3GzNMgnph+oD9KUtuy1Jvy8kKdRu3eZJIa7vTZbRVURnYVSMah0Z70dS/lnUtGSwNIns4eCEtNClP4gaCZQDg7Rbi88XRDreZT6TMBlZEB8AQ6T8l0DjgDU3cRgqXOMuGBCnPG842SnsEO0XgG54c2aiGZO8cnlKEXf/F+i62BzseY+V8kYEMQepicOMGe/0nBMHfEYrwhrDBzd3o9gIAnQD8RWZ75RHDphOQpY3bzfyod9nxyv0Ee2rLGYYn5Uu4/cIEA5GQV/s96T3zDjMsoIUCYnpV7JXl5QwrU+Ttifpva+TlGdO3RqydXJPOHMeQZkJbmY18GRGV3akNwkFBxZuPy/XKoC31XMpNPNDzDHp72efxnqZJt8FyspZIjpFBczWrNd5Qnj3mr3l0GGYqyH+eq9vGPrFaN+yqR7LdYx5Njr9U9v73tmjJ0cHLqApaJe9/fRnFhluAmyRpjCJIlPwzOlsuPqKJdleyRnwJRoR+iFZjgEeiSE8KiCB+yxzZtLG271AOPk8b2soNuB/ugbimtHs3q1WHsNoN0tTJCWXmE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(478600001)(6666004)(2906002)(6916009)(38100700002)(4326008)(86362001)(53546011)(6486002)(52116002)(186003)(5660300002)(16526019)(66574015)(83380400001)(31696002)(8676002)(316002)(31686004)(2616005)(66946007)(36756003)(66476007)(66556008)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3F2VWc4Vkh6WmlucmpTT2dFdGUvYjY4RWl5ZjJmbmlCM1p1cjZFTFpNRWt4?=
 =?utf-8?B?Z0M4MHNxV1FxNHp6RXNSWWs2cUdtMm1HV1FlcnBTUDN1QzFsd2V6RWxEbmNH?=
 =?utf-8?B?bDVCRkVHZ3VUbktnRTQ3MXI3SWJCMGVUMjBKMDVsY3dDTUNmeG55alVSNnZZ?=
 =?utf-8?B?WFNOWjRjWkxVbUpMMEs0OHRtUXIyditwNkh2aXlvVUM2UXlDR0VEaklxQVd0?=
 =?utf-8?B?L2RUUENCYk13eUhIUThzT1JRVDhzMEZ4alpDZHUrZFgxbzZsRHRpWUlNcDdv?=
 =?utf-8?B?Y0RneXM2TGFveFVDbExWc0VOQzdLTFk4Y0FEUjM5SG9zV1FuaUt3WmNoK2Vy?=
 =?utf-8?B?bzQ4VW1NRFcwNEN4emxaYVduNkRJcWRudlRsYkpGbDB4YXNFUnZCV0lkSkhV?=
 =?utf-8?B?NVB5Yk9vRGJaN1NuL0VYUjl6VUNzeTUwbWlXMVFMdjNiOEZFMW8yUnh4TEpq?=
 =?utf-8?B?WEJnRms3QzdmMWxYUURyd0EycWtNOWErS2NpVXlYUW9teFo0bnVvekxhSmFq?=
 =?utf-8?B?bkdJTHN4Q05SN0owRGNKNlJ4RGRoN25ZRzE0dzhzaStkQlBYYlhvbHdkTEJj?=
 =?utf-8?B?RTJSeG8xTFNzOEgzU0FKRy82QlBOVVh4NDdhekRST0trM3hOeE1SVjgvV0Ni?=
 =?utf-8?B?N3dWRm0rMUZQc1NSOXc4NytDdFp1MzVCNkJRdDlVdUYzelI0ZFFkb3NpbVZx?=
 =?utf-8?B?clVaM21naFJQUENVS2Z5b1lCeUpPQ0dIY29ENEtJWnBVK29TMlZHVmRoUnNX?=
 =?utf-8?B?bGtsb2RFYzFqY28zb09TU1dFYm41Z3ZsUWV5QWF0ZE5uNEY5MW80UmtydWlZ?=
 =?utf-8?B?SmZZeUp3L1Z2SVU4dzZnWlZtaWl6ZzNrMjU2MExiYTFhYWVwbnlnNmY0dnQ4?=
 =?utf-8?B?U3ppbGpaeXE4eTF3ejBVWVExWFNNcFhrSm0yVlAwRlR1U2w4WmxwYVVjaFJR?=
 =?utf-8?B?RFE5SjNCUzFzQVNrVGJIcHdob1JxK29NR282U3pqVXBoTDBiV0RaMnowZlRL?=
 =?utf-8?B?SjgwVndkRVpKT0NSaCtCdXN1ejdIZDNuTFQ0M0IwVlFyT0szNTVFamg5TWp6?=
 =?utf-8?B?d2NPSG9VZzIranVDR3RuQk5hSENpcUN4TW8vMUp2MHRRY2VhUk1GOUE4Q015?=
 =?utf-8?B?bjZlQkxBZW44VlVNT2ZGT2RRdzdVdGlIYlovbzAvRnVQM3J0YWt0Vjg1MTBW?=
 =?utf-8?B?aG1URU1ubHo0bVE3eFRSZVBYQ1EvZVNITWczTTFGbE0vdi9IMFd0RThNMzVx?=
 =?utf-8?B?REhIbHUwY3o0d1JxR3VWNGc0aUZZQUZ0eUc5ajZyUkpROVNGejk5ZlhBS2Y1?=
 =?utf-8?B?RXFGYzNvbDhzSDBVYWVibXB5dGZ5Skx3VXhHek9RVktJSC90YVkwUUIxcjZ2?=
 =?utf-8?B?RGFGd3lscTRrSVQ4dEhuSE5TNEpBZnh1bTMvL1JHbnRWN2NyRWpQRlYzUFFq?=
 =?utf-8?B?Rm1ZbzRwZjRHcE9KQ1JlVnF4RGZtbzBONS9ZaCtrdkFoSEZkWE1jZmZBUmp6?=
 =?utf-8?B?ZTh2dDhvWEZjS1kxT0RQdHoxTVhyZEJ1YmZvMzcxNmtTYmRlUjBneHRETWhO?=
 =?utf-8?B?bWd0elQzTXlDQXNLWTZ1VlBOcVR1YVQxdVUzcStsTTlrNkFGRHpxaWF3bUZQ?=
 =?utf-8?B?amdTYzR3M2d1U3dYZmRGYkZBMlh6S1BSMTJzR2ROYU9BQWl2ZFpKOG1oV05D?=
 =?utf-8?B?azUzSWIwOFgzcFpqS2NxRjM4Zm1aWThQMHY1UWdFR2lKSUdVdGhFMW5Ic2Ny?=
 =?utf-8?B?Y1VwaGh0M1d4bjhNNDQ1cFZNbVcvR293Y3lrVUVhNnpwTlpUaTB0WEM0dW5V?=
 =?utf-8?B?VmJkOGxjWkhkY0g4ZWxEUHMxTVh5ZnNvTk4rN0ZpWmphd09KVGJsUlRyd3NF?=
 =?utf-8?Q?fSJCE0pIexYsf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a782331-4b77-4d12-6d2d-08d936734e19
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 18:18:31.0706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBGESPyl+37wzIRcSarQvjDw0nLtoeH4NPk/6qEcgBD2aQyXu2ghpX1EWfpK7gMEU5mf2dp7UpmOQCmbkhSr5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5135
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

Tried on vmwgfx and amdgpu, everything looks fine. I would have love to 
do a kfdtest as

I think kfdtest does bo movement tests but it seems kfdtest regressing 
even before this series. Trying to debug that.


The series is Acked-by: Nirmoy Das <nirmoy.das@amd.com>


On 6/22/2021 6:23 PM, Andrey Grodzovsky wrote:
> From: Lang Yu <Lang.Yu@amd.com>
>
> Sometimes drivers need to use bounce buffers to evict BOs. While those reside
> in some domain they are not necessarily suitable for CS.
>
> Add a flag so that drivers can note that a bounce buffers needs to be
> reallocated during validation.
>
> v2: add detailed comments
> v3 (chk): merge commits and rework commit message
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 3 +++
>   include/drm/ttm/ttm_placement.h | 7 +++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index db53fecca696..45145d02aed2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -913,6 +913,9 @@ static bool ttm_bo_places_compat(const struct ttm_place *places,
>   {
>   	unsigned i;
>   
> +	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> +		return false;
> +
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index aa6ba4d0cf78..8995c9e4ec1b 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -47,8 +47,11 @@
>    * top of the memory area, instead of the bottom.
>    */
>   
> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
> +
> +/* For multihop handling */
> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>   
>   /**
>    * struct ttm_place
