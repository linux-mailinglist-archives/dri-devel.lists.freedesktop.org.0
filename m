Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9A8220F5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 19:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C6010E1E7;
	Tue,  2 Jan 2024 18:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53910E17C;
 Tue,  2 Jan 2024 18:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5VvsCTWJqIuAZRO06lbt83J7caT9+n67Z1R0yBpN14ANrJyCVy5WUtYhVH0OJctJYpMEUXySH+p0xvNwyQs2Q2IivL1KBxLAtPrzxvLlO34u9r1AkWbRY8Tf3ICktAP+xCe1oLTvQkOaJfMSK0nTQTBnT2pwpc9ydUFeFZx0UtwWNnEVWzMwX/O7nCmfnGJdV6h679+mow7CMgz4SmSOALoVLVJPA9etAJXHHwt2IKf5jy5tumwSG44JibWLuuA1ndwl9kyam1w+fbuYScwSxG2HDBnKRF0k3UEWjWQ4d3ilDxNjEH+t96i9Q2eJiLySo63TZmMbl99zFHUj8fyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LYaiarbbBG7my+vMLLX20401EBwECNAklDQ5kCB8P0=;
 b=ZummBaCsvcuiXWSYHorppwfrvbfo7UrzC97KJuHid/+W8GpUfEs+Q6ckWToCwdpvslC8Yr0mFkQVnxyO8e6A1KuYeqpMnuaZFWUxMjmALzr0rwkAqRaWsLrC6H8U3NrczLgjCSKC+2B51Lby43BiogPpYk2H8+p47GUh3N+iR64twC5sMINZvLN0hJ2TFR2TfxZ5JOIzq/EQZjPHE536r1S+yJrwvP9nl2aP9xzMjIFiK47fHFHnCZrxXGQbZ2xQw3B2y4CmfS2VIiVgHifXW7VqT1bG9TtX1irs8/G2FpcdJEcZ8mGZgmL2lToxdIKbQUyF/MESHrqoabxX6v6ung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LYaiarbbBG7my+vMLLX20401EBwECNAklDQ5kCB8P0=;
 b=H7Bk24vyZtrhuv9n+yNMqZEUAlWDNZZv9EqdC8k4nXQcoZs4Nt6d+o+JLS4orKrA3az1G3zvc/0QN7pVmHiFQMUKtXEyq47A1hwYJctUk6/FHd2kIYhNW/moKNYXsZHHU1apxdVZLmGZRq5eVFeK8OSv0Tcuj42lPrQbdbk2Y/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 18:26:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 18:26:46 +0000
Message-ID: <163aa450-dfb9-4e81-838e-505a31168dba@amd.com>
Date: Tue, 2 Jan 2024 13:26:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: fixes for HMM mem allocation
Content-Language: en-US
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, dri-devel@lists.freedesktop.org
References: <20231231143700.893822-1-dhirschfeld@habana.ai>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231231143700.893822-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ed8039-8c85-4ea3-7670-08dc0bc0608b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ypf2iOta7nlBRPfn2Tsn4Ecw9hk6F4gbHHjisHT5UL2IHaJAjEaWtUZsfKZzrgWqEpbgf7+LMwo21T5xjtoKGm2Z2LDXU4bYQiYeIhstZkXxvpjRJ10yNwP2S7Q4T0Z3sOTvWK9u9igeh1HENx7Qb4FVlSgpsDu5HufcT6tIQ+6S4uYvEb6JGvQSlVAACfmWHeGxZ+NXEZxihcS4olVI2V20gJFuwE5ULlo4ZyEYHINqw0lweWVz6g1HwOKRNZj1FlRDerfPzX96OxsSTKM2nCsbIcUXbOB/U2aUaOXg7tvXp2aahBIDhr7gBae8+93gSCeH+yJFwQo2hYbINw6RLhlAl5ej/peXXS+z5GfAzBifU1E/sAVAXhWok/KZf5HTMYKtnPSl3BodLqTNSoPH3nnALjbAt17Hg/9aWUDHVNYSemh4PZjAsp8SBQFME96Xq07m5PxNhPXtXdEHad4fxGufNwO0tfeYNX+8gpf9rbErcq4QrqKV0sTU4G8F7vIu1eJMyQ5WbpA3IfFb8mPxGFyl2Ye4IC0aED0michFIS+EINVYihWDj7CqfYX7p5aTvsplZGkSt4GYUqFRPftD4Zlft9BtvzoQ0uowUSB4vXayxB8J+Og9R3Z8MlqhfVQ9tKNNXou6ZdfhK9hpauCNyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(31686004)(4001150100001)(8676002)(8936002)(4326008)(5660300002)(44832011)(36756003)(66556008)(66476007)(316002)(31696002)(86362001)(6486002)(478600001)(6506007)(41300700001)(53546011)(6512007)(36916002)(26005)(2616005)(83380400001)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9Pb2JxbTZaVUNiWnFvTERlSnQrZE5vcFRRVXYrR1Z6c0ZFWi9YRU56bC9R?=
 =?utf-8?B?NlNjcU9JaW0velRjWGk4bjB5TUl0ODNydEl0bW5NTVE4ZWNuNU5qU1FFamFU?=
 =?utf-8?B?dHkvYW90eTZuQ21FL1JyUmMrcDFRdm5XNjd2em9CdTluSit5eGc3UW1VVlFw?=
 =?utf-8?B?MEQvK21yRmRUWll5bGFhVXc2Q21tcGw5V25RSG1ZT2M5QlJ2aVo1SEpkYUh2?=
 =?utf-8?B?ZEd0V1BhZCtqREtDZ1VUTG40amdQUUVjM21tUjlHLzJNOFpGbnFqelRmS3hD?=
 =?utf-8?B?Rks0NmM0cVVTYjREL21lbFNRU2E4L3lHM0hyN0ZKcnRrUlVHMCsxTzExd0xC?=
 =?utf-8?B?TjJ5RWExTXJXa1F4c3BFVjdSUTUzU3htQnQwUWFvajRyd2FpcDJacGtFQU9X?=
 =?utf-8?B?U0duMkliRGpTb0ZWQXNZTzhxY3h2N1ljNnI1aTBYc0NrSXMxYXVSN3pHR1Vu?=
 =?utf-8?B?Y082Z0VhSHd5VTZqMUdDUUR1SnJkZlRySFYrQzRvcEIwT2tPYWF5cU9JeGtv?=
 =?utf-8?B?WjV1UjJtL0tLckRWWTU1ZkZ6aXBVNHdxbXBCbUpZVUJvbDBKVFErTU42QVdW?=
 =?utf-8?B?TkMyYmxUZ1FxS2w2a0VaUDRYeCt4NWtvb0s0UlZVK0JDYmVyK1pSdkxVQWhn?=
 =?utf-8?B?Q0xRenhmWlZ3eGtGSXhpdUNQUlBsUVJXdmJQYS9UeTM0dHcxdmIrekJ2bW9s?=
 =?utf-8?B?MFFwcmtMaFozazhDR0ZvZFZwNWpwdk92NGJZdEZHVzRkZXZXQldSVFBhaktD?=
 =?utf-8?B?K2w1d2ZNQUJudGxKTjlxU3NoU0pNUEN6bGJ0VytRT1M0UWNxMUVGU3RHcFV4?=
 =?utf-8?B?ME52dG1WaFdCR0QvU3BRV3BHcFlCTHpwOWR2eW1abXo3YzFtTTJid0FIM1VP?=
 =?utf-8?B?MDVhN3hjQ3AwQnd3VC9hcVFaaTdJaHQ2eVNEdGlTc0dmRHBjcDZCMUJMWG1R?=
 =?utf-8?B?Q2JUUjA1aW54OC92SDhrRXVSYlh4ckd0U3grdGMrTXRwRFRnQ0l0WGZkTW1S?=
 =?utf-8?B?bjh5V0hJVUdlaU82RmVSbTJUeHFxSCt3TjQ1RjJrY2d0UWNmV2dJanl6bUNL?=
 =?utf-8?B?eXphU00yZW81bXh2QjlGRWJPQ2lkV0k4V3N5WTBUSUhWTHFKSnBBSUhaSFY1?=
 =?utf-8?B?OUN0Ti9WNGppNCtUTnpUVW5uZXZTN2J1VTNWUUlrZlVYWm8wZCt4K2lyaS9Q?=
 =?utf-8?B?Zmo3d3p1a1FQdVFlc1NCNE1uUHhkNEdlV3VPZzQ2WEhpcEVaUjZJY3pER0Nr?=
 =?utf-8?B?UjI1WGVjMjJ6SzRQY1A4KzEydWRTanNWcUNyZzgyd0FXMUZvQldoa2JGK1Nv?=
 =?utf-8?B?Rm45T1dSY21hT2lRdjduV0ZxL3RYWWtEaTNUSHk3Yk1QNkxDNkJma0RsYldi?=
 =?utf-8?B?d2VOZHYvWGVxcDJCUTN3U2lYZ1VUdDFCUExLYUZnTGtyWWQrM244ZnZqZnBm?=
 =?utf-8?B?Wmdnc3JPamNOM3dtQzY0YmltWUVOQkFwQUp5a2xvb01TZzdQbTNTdjE0SlVn?=
 =?utf-8?B?M3FkMVJVWWFpTXU1L0JrYXNnQkpnVjZjWEtENzVtRDZvZVp6dXN2Rm1GVmV6?=
 =?utf-8?B?dUhKWXdwcy9LYldacWZ3MU42eDAzb2F4QXVmZnZYREYxeE43aTVlc0s0TmEv?=
 =?utf-8?B?NE05QnlIa21EVnpsRnBOS2tuOGhzMUUreGRtM01EWXBCRG9VRkNlWWdGVnAr?=
 =?utf-8?B?ZmZORzYzNnZoZXc5RjNQSXE5dVlKTlI5Mm10TXU2bjJVd0Qweko2V2ZqUTlo?=
 =?utf-8?B?VGNQUGE1TU5IakNleFFrUGdncjU1K2hUbjd3VndCYlJ0SmVJWHlaLytwRFp1?=
 =?utf-8?B?ZmxWVWpLNlUvUS9YRnY3T2Y3Y2FaN05YbEE5NnFqTTdIcmFwRVc5V2drd2F1?=
 =?utf-8?B?NVNzOWVVM3J2TDJsY1pLTWl5RVNXeTZSOU1GelVmWndDQXVudXRhNGdhU2tT?=
 =?utf-8?B?NjVVdi9TdXg2UWJwa29VblVyaWZ5U3cycWVPeUs2cXRYOU56RG8wd2NuWUFZ?=
 =?utf-8?B?RjMwYlc1R2JQNVJocDNpcUVsRGJXUlM4UWJNMEwwUU95cmgzOS9FVWZEM2Fr?=
 =?utf-8?B?Y0EvYUcvY0RIZThQYTRDYjl4KzJJZFhQNlFqS2k2UWpYbEFTcEExMDhza0lV?=
 =?utf-8?Q?W4nSJ7twjkBVQA+4mS1veqJTz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ed8039-8c85-4ea3-7670-08dc0bc0608b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 18:26:46.2380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXMG0sSC1gaj85T3poHmq3AT0APvZCA3OGuFCkMf2rN/p7U8SN+dpRiMcut2+KnBl0FO+PArG63teUDsx5drDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087
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
Cc: ogabbay@kernel.org, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 obitton@habana.ai, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-31 09:37, Dafna Hirschfeld wrote:
> Few fixes to amdkfd and the doc of
> devm_request_free_mem_region.
>
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++---
>   kernel/resource.c                        | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 6c25dab051d5..b8680e0753ca 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -1021,7 +1021,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>   	} else {
>   		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
>   		if (IS_ERR(res))
> -			return -ENOMEM;
> +			return PTR_ERR(res);
>   		pgmap->range.start = res->start;
>   		pgmap->range.end = res->end;
>   		pgmap->type = MEMORY_DEVICE_PRIVATE;
> @@ -1037,10 +1037,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
>   	r = devm_memremap_pages(adev->dev, pgmap);
>   	if (IS_ERR(r)) {
>   		pr_err("failed to register HMM device memory\n");
> -		/* Disable SVM support capability */
> -		pgmap->type = 0;
>   		if (pgmap->type == MEMORY_DEVICE_PRIVATE)
>   			devm_release_mem_region(adev->dev, res->start, resource_size(res));
> +		/* Disable SVM support capability */
> +		pgmap->type = 0;

Ooff, thanks for catching that. For the KFD driver changes you can add

Fixes: c83dee9b6394 ("drm/amdkfd: add SPM support for SVM")
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


>   		return PTR_ERR(r);
>   	}
>   
> diff --git a/kernel/resource.c b/kernel/resource.c
> index 866ef3663a0b..fe890b874606 100644
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@ -1905,8 +1905,8 @@ get_free_mem_region(struct device *dev, struct resource *base,
>    * devm_request_free_mem_region - find free region for device private memory
>    *
>    * @dev: device struct to bind the resource to
> - * @size: size in bytes of the device memory to add
>    * @base: resource tree to look in
> + * @size: size in bytes of the device memory to add
>    *
>    * This function tries to find an empty range of physical address big enough to
>    * contain the new resource, so that it can later be hotplugged as ZONE_DEVICE
