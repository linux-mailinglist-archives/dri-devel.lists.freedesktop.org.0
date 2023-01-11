Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C8665710
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10CD10E2B1;
	Wed, 11 Jan 2023 09:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA0C10E2B1;
 Wed, 11 Jan 2023 09:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDpoHmiXfzuwLklhM3QB7mXaGJC2hhaB7JAYGjFdYIKtjUesf00ObV3dNkPgPIh7YuZp3fjWe7V1jAONmNSTHOBq4N+72veiHHbTcrnw8zVYAKfLuFM+635jExYibcMGcv3Zsa+gNBbYxU4+1a8HsOz+lM8dcr4ij93RU0I7DaBCwLzejuPsRW2oboQAR1rSh9vMAj1D49Mc8XMZOGL5V6OXWTeYj1/dJC1iK3va/YZeSbBxxAbhPljyJfSa7PGuAv12JzWlpdcEd1C+fpUbaCOYsFjibidUDmBp6wtV6kpb835Qr9fLDdaL50uhox4046hhK5t0XvlYmr/bZEfrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnZ9o2sB94iqSU5a6cjPa0iEJtD4x7JwFrO3taBpiAc=;
 b=IaWgGhKJ7UbTx5y82MCXwGytuFRJIHcwWDNdFcC0FAotjaNSrT7vnWPWcAMfvAPVy2SzG5nuVhsWwDPLWgt4dXQhwfLJ2ojkFAYBC1gnYymRGVznRT77augjDgjFKmoRbMet8WXhOFwvr7pjtyHXpgQn4LJ0eqSbfGcJ0Utg4LvnBx2Q5uXw2IDpKsrNW8hMrXGLLMFVNqW2NJ1ejapJmrqq69T0ewi/gslTqTt9cz5KD6aQR4xBCbNqQFFm1puz4ZEy8P6iOX7ukq+zAju7NUKVY3/uQ6r97lDB37m6fbssA6N7uS3L2JuQ3NnHtr81gbo9fCw3lbz4NLhgB8p9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnZ9o2sB94iqSU5a6cjPa0iEJtD4x7JwFrO3taBpiAc=;
 b=1wGmxo7GLhw6NYpIYyFLnun6N5qqkwM2fotzNzv1Xj06rz9GcXADWkzOuwl+HsnX+fqyUvUAZUvjSfJbuGOSt+v471YzS+0EwTfZAuQfhQIYan4kc1AkBKUd8BJZOUvEqm/CxSz0hTZEW0CAde28Gv577BSKxwLu0uTiEUVEEEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 09:12:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 09:12:58 +0000
Message-ID: <505534d0-78fe-8fdc-7eb8-015a79af9d69@amd.com>
Date: Wed, 11 Jan 2023 10:12:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/4] drm/gem: Remove BUG_ON in
 drm_gem_private_object_init
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230111063524.2374038-1-Amaranath.Somalapuram@amd.com>
 <20230111063524.2374038-2-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111063524.2374038-2-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: e546ccb0-c082-4295-a0ab-08daf3b407db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6zGLu2+BUFHdEhvqeOjFjT5zQCKuBJqIHKJTDyoPJFTrGVMZazSxD3ZReKDc/5IBHgAH1OanPGYO3fEQrfb5Kwsd6uTrjIhkBQJ2ARjly2L7d66Coe5Lh8EYukiu7OOEQi3cwrnTI2mJk48nesC9XHRNe0ZnIKAaEL97nFNOeZUYBK1UfbJn6KRi0c7fl9s0wEbVGCW5eVu6/qVFruQv5c1TtglrQc5d7yG8CAo6l+8VqVQad4xMETLGkVDAzBodOY41kBcpUMXN+BE0MqSf1mUAvLoBu3qVhhpSy5jg/xf2rxLjbMacL0joouSm4ZFm0u1LLMUPHiDNHYDzYJ7dAjm90OvS+m4ESgrfCCQWVi5Ikk8pUl+peejDpwRKvpOqfnxCq8vYwrjr43jXrvQT2olgkf7KmYrecbijEngRUqrX6k3lW83oHU4j1kxmt/7aRZHJCcaWbGjfSW1i3hKHSBPpWXuBd8/thrSvxHmUDtqL5Xg1ACICtw+2Au6ouiY6lp6FOkm68hRiqXbFxDwEK7kMKOc1igP2pnsm1xKUOywHwuhx4fqKeiAK5QRrW1ZhjBXrMKs18KbLOHMeJCR9igb6pB1WDyqs5+c280b6CpkkmMckUT8KoTC9l2Qy2R1pqirWJx6QFdETbX4W9QUOmx1ZzKqhx2MM2zMBCPDVGAO4RzPYDdtYyqmV/JzdUeVKs5eBYF34nE5sjbTtN+hM0ra+doUd/9Ir5fQv1uCiB+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(2906002)(31686004)(4326008)(5660300002)(4744005)(31696002)(86362001)(36756003)(8936002)(41300700001)(8676002)(66476007)(66946007)(66556008)(38100700002)(316002)(450100002)(6486002)(83380400001)(6506007)(2616005)(6666004)(6512007)(478600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW1xQjNYbG1hNlZMWnJKaHBGREZtVUFlOTU1NWtyL0dKUWhVeDR6Q0Z5dXlx?=
 =?utf-8?B?UTllQkRjK1RnWGJMYWpoMW50bXlzRThib3lsa3pIM2tRaFY0KzM5NEJSYXFG?=
 =?utf-8?B?VnR1Q3VRT0dBRXNhWlhaZEVqenRlQ0wrRk9reFp2b2hDY2FWTDdMTDQ3eFVG?=
 =?utf-8?B?d01lWk8vcVdZeHFwUmU4RE1uYWIxNm1ocFNMb1VGZ1o0ZzEwVFR1QktybFlW?=
 =?utf-8?B?MkNRd3BkZDczMjdhTjJqN1luVUl5QmdHeGMyODNVZDY2WThiZXFpSVZHMGti?=
 =?utf-8?B?aTJleE5XRlBrcjc5SVJyb1ZuR2dQeW5lMFRjT0NnRGtrTGxjUVVUYS85Yy8y?=
 =?utf-8?B?cG5kR3o5bXdIc3hIRS9IdzBYQkMwdlhLNzJWY1U5ak4vSi94bUlCTUpwbDhM?=
 =?utf-8?B?a0NOU0dqUnVmeUx5ODFQd3JQR1A2b2k5ZlRWV0dFamhUKzBNUTh4bUVzVkor?=
 =?utf-8?B?MUlyajlPeG1NR0F1TXh4NGhiOWxnVGdrQXF0bk5tQ0lpQXhUVWx6WEtWNXJt?=
 =?utf-8?B?NG95UHovNGp3OHA0a25FYi8zOG1wcVJ4anJTL1hRNzZ2OEwweEtxSjRlbzlp?=
 =?utf-8?B?SlkyaldUUjZuSHFtVXRFUFdEeDFRZmlDMUdjRVIyNUthZC9vdzY0TWZXS3Rs?=
 =?utf-8?B?dDhUOHFuRkxOK3ZlbTBVUjk1alFmQUVRSkFBc1RRUnJ6ckd6QmlxT09IOXdD?=
 =?utf-8?B?Nkp4WkhEcHU3OEh2WVJ1V0dtNzRHVVNkSGhhWnF3bGpWdjd6Q2hVRDlFd05F?=
 =?utf-8?B?VWUrckhMczYxaXAwQzg3MXV6cW5qN01PN2dkRHFTZjJUQ0UwSUtORjc5YjFz?=
 =?utf-8?B?RmZZMG9renRObWNmT083QURBYmRULzM3cGZhc3A4bTZJRGRjM2kyQXl0WFpi?=
 =?utf-8?B?N0hua1k5TFF3cEJkc2VKSW9ZcFVpM1g2eWd0TGpLOHBSTlBJMWcyeUNCemFG?=
 =?utf-8?B?dVgrWUZHTjRsK1dVYks1cDV3M3V5VzVhaFNWUmFlNGhTTlNrRitOYW5CU0hw?=
 =?utf-8?B?UlRnL0J4aW9rblB3U2lTQVY2aERIaytUdXZGNnRkSzJkbkxPY3pLY1diTGxC?=
 =?utf-8?B?NDlMWVBuYURXT3FTN0htRXRXcHdoS3k5eXE0QnVWeXJ6UlJ2TEVieUxocnB1?=
 =?utf-8?B?TUZuc3JxVExuVzMvOFpOMTRaWC9CbmtmS1JVeEhPL2lpKzNBMVpSZTdRY2Zz?=
 =?utf-8?B?RWRvRmcrWXAyS2RZNnIvSlhFbU1INytKWm81L2dUTW9wWklXTU1uZlVzSUpQ?=
 =?utf-8?B?Mk8zUUx6ajJYUnlONmw4RXE2MGFlTmI2VllFNU9uN2tpbmw2WUQxQXdDYUlY?=
 =?utf-8?B?U2hTT01lTjFwVi9PaW9zWnZDZ3hHbnVUdC9aQVQ5U1lSU0FrZWV2Wko3NURi?=
 =?utf-8?B?RFhadkRHSHd0T3diM2dTajlZWDNncTBWRkhsc05QMGNYZnQ0V2V1eGd6Wmh3?=
 =?utf-8?B?SXhjQWNBR1JpTnQwMm93dW5YSGJ4ZS9YVFVzUFU2bWI5MzZ3OGdWLzRQZkF0?=
 =?utf-8?B?aUlyaDR4RUhtRVRWMHBkMEdZQUVYSWF0ODA0NEFXeHBacVFaNnU2Z0ZUN2Zs?=
 =?utf-8?B?UEI4TTRScVBEY3BQWHJBSmxXeEhYaDNXUE1jcXpRVVZYSnMyNUpVZTJicVlZ?=
 =?utf-8?B?eTNMaThxN3lCcWNPMU9ORExzQWtSUVBvcHc4VGpIMGtqd2dxYXBuVXNWd1BH?=
 =?utf-8?B?b0tvYnQ3bkVFTzJYMTduOUVsOTRyc3R6cStSUHBpOERHcnNPVEZKUmRjZHlq?=
 =?utf-8?B?SGt5S283R0c0S3F1V0cwdXpCSkxxWDNGYlp1emRtRU5kOW9hLy8wNWFWM0Ix?=
 =?utf-8?B?dlAyU3pXMG1UMXZvU2grbldvVDRYVjdvQlExcm80TGMxbWptaXpXTDNvamtr?=
 =?utf-8?B?a3QwcitvRnl1NElSbVAzOTRKUklXd0ZrZWp4TG1jRVVsQ3gzdFlYRUw5b0RB?=
 =?utf-8?B?WE9IekhXNmd4WWdYMXE4M0s1VkJNa0NNZFJBbjdXTTJieDZvWnhGNDdSOW9l?=
 =?utf-8?B?VXczQW1BYWh2YlFvRlgxeEZGdmpucTJqMGJDU1JaRnUwKzk5WXhaOFVPSXRD?=
 =?utf-8?B?b0oycUU4TWFLQlVlRW9zSkFKU013TU03czBiUnNvbUZPZG51NG5wSUVJSlZD?=
 =?utf-8?B?anJYNlVIcHg3bDhvdnF6aHBpUTFhS1FvdEk0VkpHL0dSMFhmVmNsRUg5dVky?=
 =?utf-8?Q?s0PcbU7+1Kn1qdrBORMz+XqHiU2KrtmiU8jywkYFfur9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e546ccb0-c082-4295-a0ab-08daf3b407db
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:12:57.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u43xsobJbPKm50pySWi/crIeqsR6KU0wgtwaoXky91RxL+j1dEDv3C8NmN44lyPS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8131
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch here needs to come first, otherwise changing the TTM/AMDGPU 
internals to allow byte sized BOs for GDS would trigger this BUG_ON().

Christian.

Am 11.01.23 um 07:35 schrieb Somalapuram Amaranath:
> ttm_resource allocate size in bytes to support less than page size
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 59a0bb5ebd85..ee8b5c2b6c60 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -152,8 +152,6 @@ EXPORT_SYMBOL(drm_gem_object_init);
>   void drm_gem_private_object_init(struct drm_device *dev,
>   				 struct drm_gem_object *obj, size_t size)
>   {
> -	BUG_ON((size & (PAGE_SIZE - 1)) != 0);
> -
>   	obj->dev = dev;
>   	obj->filp = NULL;
>   

