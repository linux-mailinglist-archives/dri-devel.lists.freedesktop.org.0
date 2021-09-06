Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B644401888
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 11:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994A18982C;
	Mon,  6 Sep 2021 09:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD3D89817;
 Mon,  6 Sep 2021 09:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8cfQeNM9uVwG3r//mvYPCffGj/YJLtO/5SuCn+Jn5nI9Md5OUITCT2guk8gCFkQfL1xAxqSaDLjTsXracTHVKo0Jp3k5+212gkWbTQWqdoaPKWr2enjZNcD4JVdVYunAVprU8nXvNZD8a2NjvvCQFqmmK1okMOyQ7x3WP9k33o7PhLcR7OiAzr5J9YjjORYmPBbzxzKxKIWCkcAgKQr9cGouktPhF1tkbyNRgcqiqJHIx5DKxwLuDQ+33G/r7SCRi4YFVS11KcnkjU+90pjvH1JHw45WgZSHukICZruBwFY4eXoa33rlCLJiaECawuKnXllCTkJd0IGUdsGVdlj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Qbww/w8LcX+paftnA6J3s2hso3RCFHK1/KNuqEIa/A8=;
 b=kFeEm5kf+Sl/pS9lbz+rSazesd2o2jtYz3yrfo99W4hv0BYpRQIgUaYvEw+Il0Mp3JN5fXtTmIqHvTpOhNSvWbBXD584YyfqyQELYjAKs9+kgllBTtjlPHwlH92P6voTx0eLOZ5xut4KMLUdVrjSIzEKb3rmsHB/RBw0AU6azO8ptvJJ4xl4zEDY/aC/AvhIgutg6+4uG76NpxRCiCuNBpAyy5LWNnpRzX+V3i/qv1jGeuH9wlNWCrAd9Q5PAVWF2kGI6UQuMkJRR5lsA4T2Y1W87NUvUt8pObhI1txB0mzyegmEp8ThecPRMzKelFOcaf9bbepZB3fAGBX1QzKIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbww/w8LcX+paftnA6J3s2hso3RCFHK1/KNuqEIa/A8=;
 b=WWXtzfh9jJv/ugxgvqFfirkedAnW8jX81srv5mUj9kPMUgktP76owP276OxOHG7w69Jbek7c/ojeKQp1xOIStk+NvApl5b89unxNsPUy8bfoWxUBjBDYYaYh6JMpwliPO7Wq5sYOC3ROsB3wy8qB35kMTsDDP0vds42LUNbFVTo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 09:01:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 09:01:50 +0000
Subject: Re: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, chenli@uniontech.com,
 dri-devel@lists.freedesktop.org
References: <20210906011210.80327-1-xinhui.pan@amd.com>
 <20210906011210.80327-3-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c1d720c1-53fc-e2f7-dbe4-b7dabfe8357f@amd.com>
Date: Mon, 6 Sep 2021 11:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210906011210.80327-3-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM9P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:e317:935c:f697:77f0]
 (2a02:908:1252:fb60:e317:935c:f697:77f0) by
 AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 09:01:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ad8d19-98d0-412f-1332-08d97114f62c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB367884B3D5B190380A963C2A83D29@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bOYxFRJznaYrzFYAPQoOzbJqI5fX4mppSF7mtCuirh/Ya3t0Xq1fbQXIEKxsaRRPtNDmolpUHkJBSWpaV34qiZNXJbYyks/VPXQRYBXX2SeoWfQcq2i9CgcVWVfCQGwB6OLQp4GQbvSF1UaO0RXyIL0EotWepOlbElc4+bp4kACyzhuJrrSPtfTGhi/mflEL/vt4LfEnbY1hZKmIm7k0sKsgEJu5CMdNgFz3uwLPkXWkcEa48ZwcUN2yRzv7zOopzxgQB3aFdCzZqqaa4o22V884dALBFomTZvTeKVgPL4LzY0TD9C9Gi1rPJa7cVnpvVwsw3PmxmX9i/PUs4rqw4EMxFTRaX877jg8SMAhhw9QXWKjnD/JuZaZ8N4ykEYzEc3iy3oQwQUiJmJu1hEdfpI15r2YMqradaxa2qXxLLR5zb3BVXx3inAGkKAW3EjVjoO1+FfnPeluL46weagKKwvXqbrlumnotQqsKE0kS/GdFaZ8GsCzbx63ShkYZmVlo1ygI1xMVQ4E+d5YmU1LtqhXpt2KHzbzyHynFu1kHBF9BOejIJ/WEkblAvOMFzqXdRnaJv8tikfXNgRLbLRNQeL0FHJdnZdnRgWcmRhAsgQ5F3rxd+0dLudD1hUTXt5rE6toU4mR/uo+R9Jj0F5ztRKHq1XDNi9pWbHGfJxigFiFD/+iSrf10xpFKDrBtK7Wl5cKEHugz7nnYbHkCVyR7CkhwIMovW88AHO/dVi5V14=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(38100700002)(478600001)(31696002)(86362001)(8676002)(31686004)(5660300002)(6666004)(6486002)(316002)(4326008)(2906002)(2616005)(36756003)(186003)(8936002)(66946007)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVlQWkVkRDV1dTJYeEUvRWsxekV6WUtmcW9FTzB0RnB3WlVZRHNRaW5DOHoz?=
 =?utf-8?B?Q2RIM2RHV2x4SjlFVkxUUHNXZVdyMU5KRE1EZmNSTEliSnpXN3FZUmhZQlRK?=
 =?utf-8?B?YmU5bXVWNURJUllnVVB1eXF4L3pINk5kVjhaNFE5cmo2SXBqWnNjRjNweWFO?=
 =?utf-8?B?dXNGYUVlWUJHNkhkelR1TS9jV3B4UW1mRVpHUnl4Q2krTWQzNFYzQ2tVQ3Nq?=
 =?utf-8?B?WHpyeUhsSGFZSzBsQTRJblNlRGl5WGtlUUJ4RWdNU1ZmVW9raFdpdnVZblBS?=
 =?utf-8?B?bERRRkR6bUtaV253cVdxKzYxbjNOeWRMTzE5MEZOMmM5NnM0VzVFU29yalpx?=
 =?utf-8?B?K3E2aklOblg0ZjdNV1poc1FMZklyM1FTMG9lQXVwN2NiQlhCenc0U25ZNXBL?=
 =?utf-8?B?SFkwRzdoRDhQSzZzZk1iTXNCMlk5RS9XTzlBSFlIREpZckh4ZU41alJDY2dX?=
 =?utf-8?B?QWllNlNWQk5iRldFdTdyelRLak1nU0dlUk5UWXZVWURtcFR1bm9OOTFocDRr?=
 =?utf-8?B?cEhFUTRPTTdDc1BWbmdmTjRiSldxaEtyU0JVbnExSHRud0hiQ2ZzRFRWZ2Zw?=
 =?utf-8?B?K2NaWTJQcnRBQitxelZ0RFZZYUZoWG5CL0g0NnJmUUN4SGU1T3ZXWC90dEZs?=
 =?utf-8?B?bVpyYzF3bGE2TjZwU3lqNEZ0NkNRSEJjT0svTWVLc3lmK21QWXBwQi9xMTVT?=
 =?utf-8?B?aEIrdm14K3NYUVJxS2VLbzVJbVp0UFAycis3eWZRL2IrTUQvRUJsKzhmWGI0?=
 =?utf-8?B?a0lyY3o3UFBaTzRXbjVtcmMzZXI5Qmp0NE9LYmszMSt3dzdxTnAvb0FiaTdY?=
 =?utf-8?B?SVpDZUJUOElIMkVCQVFQMVFjMDJSRVhqS1dhZnJ4QmJLd2ZxSVZHU3J2M2lk?=
 =?utf-8?B?MUNzM202TGFhNlBaSE10M2N0WVE4bkdiei9xNVc5SmE0dWl3YUU2M2tQVk5k?=
 =?utf-8?B?dk9oNitIYktmc0VnMlJmQkErSEE4ZUl2ZGpTZkNBanpncXNPeG1xL01WeElQ?=
 =?utf-8?B?TTNsZEEvME9oVDhLYWQ2Z2pzamR1Z2tOR2M0TDdDSGQ5VE1WRFFCay8wN3Rj?=
 =?utf-8?B?YnlGdk53cnpXdE1xSWZ2aTY2MTVmc1IvaWczMnJnVnI5QU4wQzRJek9penJs?=
 =?utf-8?B?NlQ1eGN4bFZXbGEyWlN3USt4RjI5cWRaeXJPZVo3ZFg2NldFdzUveERJM2NE?=
 =?utf-8?B?cCtpTHpSMDB0blZpc3FkMU1sSzNTbWcrd0F3WjlsQ29vZkZMdDMyenhNalhG?=
 =?utf-8?B?RDBpbjJnSGZEaGVUTFBRRitzTTIrdVE1Vm5YYzkwby9rd2IvMjBaRUY1dVVR?=
 =?utf-8?B?VklkSnBaR2xMUGhwVmV0dnZDaGFVNGt2ZFVqMS9TdWVzVlhQTFZNN3dMb3JS?=
 =?utf-8?B?OGVLYUpQcEJ1TGxQYlhlYmFGQ0JVU3daVTRUZFdTU1pBdUpLazAyMTZ6OVYv?=
 =?utf-8?B?a3R6TzN0ZXMwcEFwRlovYXBnejdSR0prT2RkZHZ2Z3B0WWc2RGNvTjNwT0VW?=
 =?utf-8?B?OGNpNjlBOFNFUXJxMTNkZG1ZSWFYbm05SGM4cTRPTklRaS9yRUNjaUdQTHR3?=
 =?utf-8?B?Y2ErZVNVa3FZb2treFVhamowUkpxWEo3dng0Uno0cXdQUTlFVDY5NGpiQ0FL?=
 =?utf-8?B?K1hLb0VYSXA3UlVDRE11cmR4Mk9ReHlrdnJHRUpQY3NDZ0NBOHlpSEYrT1Ez?=
 =?utf-8?B?RjN6TUhKVStMNTRJdG8xVHFBTm9pS0Z0Q3Jzck9QUGdaSUVlL25TYlpvRk0x?=
 =?utf-8?B?aC9iNnUrOTZvNHM4ajJZRFZzSHJvbVJxNkpwb0JCVnZKMVVjcVlSOG9HMFVF?=
 =?utf-8?B?VGRqUnRZSG5BT3pJU2JEMDRaRUpKQ0JtTm54KzFkS1cyNy90dHpUU1lsT2pP?=
 =?utf-8?Q?sTAjRgmddnnck?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ad8d19-98d0-412f-1332-08d97114f62c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 09:01:49.8600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rTDASQX0eUqaP4B5+TZpQsau1Of2q+/lgOGoEdYGk7cECczkZF8DNgPYPii0O9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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

Am 06.09.21 um 03:12 schrieb xinhui pan:
> Like vce/vcn does, visible VRAM is OK for ib test.
> While commit a11d9ff3ebe0 ("drm/amdgpu: use GTT for
> uvd_get_create/destory_msg") says VRAM is not mapped correctly in his
> platform which is likely an arm64.
>
> So lets change back to use VRAM on x86_64 platform.

That's still a rather clear NAK. This issue is not related to ARM at all 
and you are trying to fix a problem which is independent of the platform.

Christian.

>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index d451c359606a..e4b75f33ccc8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1178,7 +1178,11 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	int r, i;
>   
>   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
> +#ifdef CONFIG_X86_64
> +				      AMDGPU_GEM_DOMAIN_VRAM,
> +#else
>   				      AMDGPU_GEM_DOMAIN_GTT,
> +#endif
>   				      &bo, NULL, (void **)&msg);
>   	if (r)
>   		return r;
> @@ -1210,7 +1214,11 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	int r, i;
>   
>   	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
> +#ifdef CONFIG_X86_64
> +				      AMDGPU_GEM_DOMAIN_VRAM,
> +#else
>   				      AMDGPU_GEM_DOMAIN_GTT,
> +#endif
>   				      &bo, NULL, (void **)&msg);
>   	if (r)
>   		return r;

