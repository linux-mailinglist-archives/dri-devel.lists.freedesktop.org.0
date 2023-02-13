Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2E169528E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 22:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC810E6D6;
	Mon, 13 Feb 2023 21:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CB710E6D6;
 Mon, 13 Feb 2023 21:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4UrlETAgA5PH56fGaLashGWBTwfzZU8qlG/9+RHveUlq/u0zWLpDXE+tXy4mVGN0c2ROThD/vSo3E+jWZrnmJrioPIVEfC8B62mllRYys8zF6KFgAV+lS/rDC9T3bMStZWQIMnJf9oRlZfHV+WzWZzaAOO1K/CaYCyI7JBmtWTARBmwHRl4eDTaHoeYAjhL/Ta5XcIGyXdU8PAN0l8KJ/qDLxuDKrojhnnwrUyhHbCq4HUZuQxUgMIVKYKNoPDhoGHfCnpLnxaOowBbMl+pTZkRhYhbqqOryqZtDU429ICNMzBcxhztHzNa9FPbwaSE96YuV5o1byUatO5DWod+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pppOI6VpggdabalokJfB/g3Te+aB3u4Vtfi/NPfL5hw=;
 b=EeEQnq4uIvi2FgdNlKntK44fAR0b4dkpSS+Za58bflg8bNh72O5M797R6YphWAZfR55h9fb1raxLwAEA+L7F48vpY8HAWun7/3NnWC8FRpjG7WN5J0iJI0YygYIZd0p+ZzDtRnahNL9+uc9kttigXrBspBfVYWEuqqnZbBmD4uUCytHAsNucpqq8x+ugDAGZYhmoK2CrySUUEFyAJDuX6MF+LfBVC6p2AiO1MxgyOlKBZsACoRuvFI6frIXPfxqAbyFuE4UuX1N9KSezL/mcutaMBY6AUfi9qzraYpXS6sTbDEH3/5itvMdeAoxn2GRqMUGtTU2GtkRKhA7ZNE7nWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pppOI6VpggdabalokJfB/g3Te+aB3u4Vtfi/NPfL5hw=;
 b=DOB10GlqlLaz9quUDEuJxzKxew9Hq3u4x7THA56lXTY8hTHLYG2mYyNkvam/EHEGeKmN1jgmoy1nCwqeZ8qrmqkAtiU/Gx0WGJJFC0fOLLoyIKlVBNDrKko1bm8xN7hpSkCn+liWX/wCw3RTk3kSyYACh4Y5/GsvsRzI8myQeR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Mon, 13 Feb
 2023 21:01:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 21:01:18 +0000
Message-ID: <f82c95c6-324a-cb43-b8e3-d216bf2491fb@amd.com>
Date: Mon, 13 Feb 2023 22:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/10] drm/amd/amdgpu: Deal with possible fail allocation
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-8-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230213204923.111948-8-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d51b53-9301-42b6-b4e9-08db0e057394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTXa2IaJiQMTyQZDYGlhT+SnpZbTGLszkoDjyaD/Zun4/Gwv2I/Dby5IBiMNL0i/LjXPu4lMNrE84IKwKr0m2sZGcAFu3ewa8jKtQ44VJNEc5SQ8o/eUG0ETBVRr7xT+Tzf5QgEAHopMv84GE3zrrDtz79zw+KmWtH4KOwB/eg6/eqx18thHgx46Cfu5imKv8/VYVK0AJyVIU51iw0fBjLOiioKJppV7o8Ya9GIJTNLJKFIl4Z7XLXvhIBi63Wni9IBy6buKswDraV6D5XiOK1tntc+pn3iGIH4LTZ64OYF7qL1bdELEJ9Tc4IIPt3nJYIBld0jsbzFDX2109Lwri3ZD/qzJjaR+0qqV0JWH4FeWrlzvXuyKI4b91DfEsFYsw4UEuzSNCjnaf+DNnki2F8APi92TiUOTjJWuLL2caSpbRxkDIRycRYl6voDSplR9RAzt+LKNquvs9RfIGN3YGAQjYA4iBiafR5UxIt9D/Ht/E79YFxG5OOeqf1p8O1daFZMjGRok/Lhwdye/5LBfHA0UCmjo7aJ/ggEXgnk0d2yuAyWMe4k6NFGO+HUzGQcU7EmCHlEgMxjdmuhb1S93d+m4MziLGwEOcteVz+so0J6aPRbG2uQuQI87NHQfa9PwcME2wc0oUi8spvngoey1eX9HzLQDXg7GzMmA0Ki/x7Bb3+LOn2kHrIM88sfE+zdQcgfzO1F/JTz5iCtvqHc/lSI2FmFuqec65WlsO9DDg3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199018)(6486002)(31686004)(31696002)(2616005)(86362001)(83380400001)(36756003)(2906002)(478600001)(186003)(6666004)(6512007)(66899018)(6506007)(41300700001)(38100700002)(5660300002)(8676002)(8936002)(4326008)(66476007)(66556008)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUkxam12K0ZsU2tXVnp6MHpLR0d6b1M5S0RzREl3M21EN3N3SFNJdENhc1pR?=
 =?utf-8?B?MjNCeUNmZ2M5NkJNL09zNWs3L1BZMHpRb2NteGswUFZCZWdILzNVb1p3cU5D?=
 =?utf-8?B?aTg0VDVUeHNZYTZXeGZaSlRIYVdBemF0VENDMmJxMGppdTNxcThJV3JxYTFl?=
 =?utf-8?B?aGFnOGMwbUJUdWppN2NmQVA2dk5hSTB3d3FJUitTU2lBYlRvRElFQm9Wc3Q0?=
 =?utf-8?B?azV6RHZweFdJSEp6bVd0MVBBMFpHajVaaEUrNFU1anM1ZWVOVHJ0UDVQa2NS?=
 =?utf-8?B?M1htYjRQcG9NcEo2TUg3Z2lqWVZ2ZFdXSkF0SGhUREN4S0Jody9lSVQ3Y2lt?=
 =?utf-8?B?SElVeTFxS05paXpTTGZtZTEvdkthYW1rYk1UVTd3cGdoODhpaXZnZENJbGU1?=
 =?utf-8?B?a08zdVI2WnZMQ3J4WUh3cjB5VkE2STMwTmZKUU5vcEc2Y1pRSlozMVJtbU1v?=
 =?utf-8?B?UVhyZU5FTUJ2TWEyWXlGTEQxWkY5VHN2dmVLQlNXY2VQZDFaMnI1UGZyVTBZ?=
 =?utf-8?B?U0p5eXBzdGRWcU1xTGZVQzlRV2N6aFpUZlR0WFlLWTQyZFl5TjhkVW5FR3Rj?=
 =?utf-8?B?MmRTeXNZSjVEYXZ3eGVHL2Z2dFBUMXNGNG1UbDAxazZXQXkyd2lSZlBNeWNO?=
 =?utf-8?B?TDRUUzRwckorS1NqRTdQRi94cVRFRnkxWVFaRnVCa29hM0dyZHBqT25mV3Fo?=
 =?utf-8?B?TmN3RFh2c2hsY1ZPM2pwVC9ESUhIV2pWMG1HclBHTWdFRm84djIrZFlWaXVl?=
 =?utf-8?B?VVlGYXB1anVqaHQ2bExMSXFqdy82MVpwdVhuK1JLb29kTTZYVGJyRkxKdGN4?=
 =?utf-8?B?SnllbkRtakFUSWlOL0x5TkpnQXhicUljYmlKS1hGbnNvN3YxRlFWVE1aeU1X?=
 =?utf-8?B?a2d1cGdXdnJLMmdJb01XNWQvbXpnRmNGZHlEWFNLUWdmakE5QTlOODl4K25I?=
 =?utf-8?B?TUFlOElCU2JiNlB6dUFyU1EyVmJxNWpBMGpSNlI4VFdLS01pdk9GTzV5c3I3?=
 =?utf-8?B?Q0VwMjZFa2dmNFJ3OEIzSzdUdGdBdHVhTGkwUVprS1FyQXVaVWZhYm1NVS9m?=
 =?utf-8?B?bGcxUENJTzg0Q0tuSTJyaFBEcnFDQWZoclhkSTdGMDQxRW12WlFZZ2NlTnEv?=
 =?utf-8?B?UUh5dzlPRVpValFWNVVkTTJQT3JQYlBoZ2dPZXhnWkZsOVZ5aER2elV3eUNF?=
 =?utf-8?B?aGY3RzJpM2hnRjQrbzRmZmppT3VzR2tRYTBmRDNFK3VDUnlMRlpzWXRZajNw?=
 =?utf-8?B?Vzl5aHhCK0lSYmMxQ0d2VVBMWmNYVzA4RHp2SkswM240VDlyZmF2UTB4NTN3?=
 =?utf-8?B?RGFyUDREZHJsaVo5VzI3WnVkdDlqTVh2a1pjOW9RNW90SnFSU2RUZ2NRY3d3?=
 =?utf-8?B?dG9XYjV1T3ptdlMveFAxY2lFdGloNkFWNUJXRUR1QUFWOE5XQzZjV0NOZ1A2?=
 =?utf-8?B?NkxXNlE3MEk1OTd2L0JKN1hwdGtIcWl3Q0dKSVdsaHJYMFlOU2tvam45VlMw?=
 =?utf-8?B?S0pRcmg4MzV2UHdWR0N1RFJZU2FKbkwyZGZWbTRaM2tZR3RnUEJrbk5yUURI?=
 =?utf-8?B?OFZSeTN3Nno2NU5yVFA1eVhyTlFmWVB3WjBrVHZjcXFHdnpkOHMvanc5Z3pJ?=
 =?utf-8?B?MEFvMnZnQ2hTaGtWTXVOMWRTbjFOWmhQMEQrM2IxMmlPTm9sVUExaXhjbTN4?=
 =?utf-8?B?djM1MytEL3pTUEc2am5hQ2RrUDB4dDZjb04zalg2cVZic2VjTnZub29oUjJN?=
 =?utf-8?B?NUllRk40ZzJVYXZSTC94Z1pFSzlNZG5qeWpkdHhjKy9zbDRLd3UrU2kvMWhL?=
 =?utf-8?B?NnFVaWl4czVrdjl5TStLczg4bUFFU3cwMXN4YlQ5aEcxZ1RPWlVOVThZNGtH?=
 =?utf-8?B?b3c2aTNsQ3pCalRsTGtKWmFQM29FaGJ1WlhBWlROTElVbE1GQUhpS3c4enVk?=
 =?utf-8?B?MFBsb2dUNEhXbkpGaktIejF6dDBaNHQ0NVk5REFaN1JYekpwenExSGYwV0sw?=
 =?utf-8?B?ZWlCbnZWQzY2NUpPK1pFL0VBb1RzeDlGWjBhODBKRkxqQkZPOVQ5bDlBUDZz?=
 =?utf-8?B?MUlFSHp1ckZ3c0V5WCszVUZjT3pBUWN1LzRBdjJid1FORlZockVydDRROGVL?=
 =?utf-8?B?YlkzWkVyWDJEbU40UTA0YUlrU1NnRXZvNFJadlhTZXFGWXlTR2J4anFUVjJx?=
 =?utf-8?Q?v/2jBIlcZrpqxvbuyx9EgryC/vxH+bGgOK3pNyD+C5Ox?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d51b53-9301-42b6-b4e9-08db0e057394
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 21:01:18.2151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bemht8xDjbmIYfPkLQrbL6gdd3qJ2surMgDOirItIx/6FblKkOC/taqnM69xEAEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, mairacanal@riseup.net, alexander.deucher@amd.com,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.02.23 um 21:49 schrieb Arthur Grillo:
> Deal with return value of an allocation. This reduces the number of
> -Wunused-but-set-variable warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index 82e27bd4f038..00c0876840c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1104,6 +1104,8 @@ int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
>   			    &ctx_data->meta_data_obj,
>   			    &ctx_data->meta_data_mc_addr,
>   			    &ctx_data->meta_data_ptr);
> +	if (r)
> +		return r;
>   	if (!ctx_data->meta_data_obj)
>   		return -ENOMEM;

That change doesn't make much sense.

We already check ctx_data->meta_data_obj and return -ENOMEM here when 
something goes wrong.

We could potentially remove that, but it's not really a problem as far 
as I can see.

Christian.
