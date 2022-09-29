Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F1E5EFCCC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3663110EBCC;
	Thu, 29 Sep 2022 18:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2169810EBCD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVsMFXr0EklPkJO7YYY8eacHAPIEfp+7AFO/bfTUfY/teQmwPDVto2Wi5/RXwqFE5JMokvsezo1PWyHpHXoXVHi7WlX96hTRr1rzO5CsISO9mDcQ9jU9+ETfsMa541LKlv8TIXM/ThvAnacb/Lc62kkSxTKFUL1BBMxtqbGlyGJYCu/uv1eub1hxtBKMdw7WS4KvGFzlwjA9x8/D1l13Kp/HO0IQtkF8QiNY7oqCO6Oa3CwTbg6Z+zv8nYkAouR2af8HhDzQUcEPMbBY6xWXnkyAU8SjgjGpolHNAsVtW18IvogOGZUYkWTSJlNbCW7y6zxGkfLQLsx1GlK8ntiAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdTjrunTL52tKl3TZ4CFy+/hlYk4OHDHmNfZkSFeMmw=;
 b=SBgM7pdZPz8ey38gLvq24W8/UZQtTkRTekdsHTXejyhSyHSOVN3PgtsjhRt0FOxJ6XZsFuivBTWut2Q5ym3X8CHiG5w4SqBSdYcyRWPQkCqPn0Kk494IBoWSehw28P+10/VQIv7QKX3DaLkj8+CyHvlHAN1Yizeq2OxQGAWKN9/W+82/zMEESLrsaroU4PXXIXj/ONPaqvl2HxRQP8z3vIIFhJ/zUyO7LDVGUG2d1uvMliZ/yqJuUwWo7bQKMgiJAZm2RXOpBfexg8aRYPeEm0FvVM5piO+RBOoc+3zpZFUauHXkjYMiqxiEn3x+56sk1umjiU67Fp6Ux0rugXl9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdTjrunTL52tKl3TZ4CFy+/hlYk4OHDHmNfZkSFeMmw=;
 b=OA6yvkJFWbnrCRpQw3JD96MZNlE3qFxAiL9fjpZXRWLT9rvZl89xXWulxY/C8kudBBoLrrf2C/SJNgAGLdejDS5Pty1bv4u1uk0aOkH3hyBW8/BPijeNUsb5aqDq5RH+Yw9X9z06Biv3ePHTWagPEW9yR8ZytKnITrfYD0bYzPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5057.namprd12.prod.outlook.com (2603:10b6:610:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22; Thu, 29 Sep
 2022 18:15:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 18:15:01 +0000
Message-ID: <97e4b580-68c4-84bd-1cca-1467a134ae7a@amd.com>
Date: Thu, 29 Sep 2022 20:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dma-buf: Remove the signaled bit status check
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
 <20220927172409.484061-2-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220927172409.484061-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cc1c87-608b-475a-5862-08daa246867c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ab8t2yR1CSisqoWomCQe2LHrYdxTPJYBUxlLuH6uPElxhNNum60rVk8inFvniQKkfL+pdq/Ibwo7eOjZ0Jdn9kiKzDYeYG44inPzQHwN0C1JziICLml7KbYXwlBbUw3rBwwZ8P3RtO5Ev2TRa3KZX55KCSsmElvDO9CJ+hYFeYz6OODGVQx6nukTll4NKUzROAEpRkvlQKazLYFHL5t+N/YVBw1GfXR6SjSlAqiL+5DhyOWi5TW7676014/I1Bfz5hNC3suF07GkI4z59KqMfsNO2lkf412pDcE+WTw0jIasJeqkU2g+N6LQAz1cfEj3lmMMRrLQUkq8NXWx8lDjBhJghsVQHUNF2cxN3MaTrxwHzbRZTj+GD5cJFpnEeyn0KXioPUv0M277wT1op+ZdXTdSiVW7t3nbJIbKMRlVOTM2LHI6y5PPsojMQFPATxRMj+kFAjsIrb2tZv38MdzYZ1XKJt7ikKznesrB7EvNunhwHJgHeKXv+hBOae/GfsNT21ATcYXoYiZzy/d+PQn0bfpEND/sMfNW9vTSKqVoq8PgP2kZLGTBkYXKzN5zkjHECsGBP8Tqr1Ld0O4PrNmwb/pAxwSTz/jya7fTB0sOgCiTK6OOXM67mvjYxiMqGP36i7Dx+FmxX+hMJlKoMZ9tgnkpR8qUfeTNGivhZBFCAjEGPFV5V6P0gGlmMEB6nUXnW9rc45bLonoUIChH8yTj466eVZEiILAj2AXOsqciNOgS+l2PFPWkmhx/MogFlG2bFSWiIKS0H0MpdK7I9TXY3k4pTMcVPwIA5dz7nuwvgHQ/MZC6Cs6fYfKYefDO+qKw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(921005)(31686004)(2906002)(4744005)(6512007)(5660300002)(186003)(86362001)(8936002)(83380400001)(38100700002)(66574015)(2616005)(31696002)(41300700001)(6506007)(36756003)(8676002)(66946007)(66556008)(66476007)(6666004)(316002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCttNTFCdS9QRm91TVBKemtBSUpHUktuQnY3Nm16WjdPdUJCWU0xeDk0UlBE?=
 =?utf-8?B?Z0lXYWdBUGM1cVBGMXBteHl0aFVXdnhMcG1qK0lOSWR1WGFNTnptOCtycDJV?=
 =?utf-8?B?T3FSUm0wNlJsM3FHUjlMR1ZpZlBCVE9pRERQbEJidTYvL2FYNlVQTE9QaUJl?=
 =?utf-8?B?NVpXL212dy92b25qeGE1SkdlMGw2VFc1a25sN25JUFo0Vk0xZkdHYlk4cUl0?=
 =?utf-8?B?ZDF3QkFCTHZBb3NhQXFLY3JpU2ppNHRzZEpwaGtxSENLUVBDQjNTVXZsMzJG?=
 =?utf-8?B?cEk1ZThCUWtGM2krUzU0V0V1aS92Q3ZLQVd1bS9ZaXdqRURDQ0hnaGtzdUhh?=
 =?utf-8?B?VlVZeTVvQ0V2WlpjMFhEenRrdE9PQ1V0cFNTY0hzWFBmOTF2OHJ2V1FSR1RK?=
 =?utf-8?B?WTUxeUErZkpWY01reDlxVUtXZllzZk9NT2VTREtDNDN6ZGhzNnRUOGxjanJl?=
 =?utf-8?B?Zm9rbXl5ZEQ4bHFKZTVJMU9FMkk2aVNjNWVCN1lJMmtaQ0s1VHlPT242dGFY?=
 =?utf-8?B?QUlwTkluaTk4c083SEpYaXNxQlpNOWo3MjRESEU2Qll0dDF3YXdIaGNYVHh4?=
 =?utf-8?B?TEpqK1hCdEVabUFRUjRGMllqcFdEbFN4WUFETmVHOTVSb3J4WDJjVTJrQTVE?=
 =?utf-8?B?QzVNc3VSMVFPRTNPczBwSnpTeHFhazVRWk4wZ0FlWFJJUkpMZytoQkQrTWlG?=
 =?utf-8?B?b0xrdHY1NTRGOC9qVjFmSUlPaFF5cTVqb1pHbzJCOHI1SDN1TFVENW5vK1M1?=
 =?utf-8?B?cU9pVWFVUTZCOCtDMHpaWXp1SzN3cDNqcHRkdERjSHZpc2VObVpqRGhzVnhW?=
 =?utf-8?B?cS9Db1dtQkxISXhFZ2w1OXU5aXphQVdsVzljSjBYejVLMEJxMVE5T1BXQTBF?=
 =?utf-8?B?d0JHK3ZtVmpnbHg3RHJNeEtiMkNPZE80VThXZnJjMTMzcUFrN01RMnVYY3N3?=
 =?utf-8?B?Yi9yWG9NV1NmM0xweEFVSGJGa1lEMldlSC9na1UyZWVIejgvY2VUblJOOG4r?=
 =?utf-8?B?Q2Y2eGw3YlM5YXJMdVVTYzhYVlpYYldScUhRMEJUT2FUWnhZZkZ1SzNETDAy?=
 =?utf-8?B?TS9QUHpCaFZpSE9xeVVLZjhmeGZnb1hBTzhlbVZMZkIvSklNQTRJZlplc3JF?=
 =?utf-8?B?ZFVkcEpJQUZGc3NhM2pPYXpsNjhrWTlRRTlQNzBEbEl5WGU2MVhiNGF5dXd2?=
 =?utf-8?B?Ny9XOGJHK1VDODQvWFI5bHQ4eDZwQldueHRjMzdtMlZjMFRiWERZdUxWNy9a?=
 =?utf-8?B?czdHUVR5dHNYMzFKUkFrUkFNRVFOdnU2Y1ZzMjk1T1lWNXR5MkdIeXRMUEY4?=
 =?utf-8?B?ekpDTEVHa0RIVjNSQzJPWTNqVW41bjFKUDAwcjdwYzZVUE92ejIydDNtUmhV?=
 =?utf-8?B?TGNtSGV2dzNEdlo2YWw2SStFUjFJNmNyUERTVWtOMEZkZXFyS3dSL0laZ0RO?=
 =?utf-8?B?VEhrbU1vbTlVSXBCWE1ncWgxUUIyTFAvcHlBR1dHVStEOHJXa01lU1FQdjVv?=
 =?utf-8?B?dUxRcmJrMWF6UlU1azNxMmVtSG9vVHBjU0JYaEpia0dYcTc2UjB4bnRFMld4?=
 =?utf-8?B?TTJidStrekZMWjE5cmJWYldPYXFsTjdOQXhvcWpKNUdiZUpqb3V1dVZ4S3Y4?=
 =?utf-8?B?WTdDWVZtanoyNDBUZnpDa2w0UFZJZGNWaVQ0N3FSZHY0OXo3RjcvSkhyOVl4?=
 =?utf-8?B?MUQ1aFI0YmlkSnBmVVpFRFpyQmdsdGpZWVB5cVNKNTU5NEFINlBaZWo4WGdx?=
 =?utf-8?B?ZWNMMGJqMjFSUVpiTFRSdGVQeHF5U1ZWcHdIeGhpbzZ1VW50VU9YMS9MVDVv?=
 =?utf-8?B?UGYwMjVUc0dsTGh5K2tCWGJjaGJ2VE9kMkRBL2FOMDJ3VVdKK1FJOGw5Sk5S?=
 =?utf-8?B?QllnakVtUWNWZmlrYVVodVBhMkcxeFRvRnhlWXVFRm9BbFRXb0Z6Q21VMDE3?=
 =?utf-8?B?VDRpYmRCdjR5QTk2U3UwMmRnRUZ3dHh5N3hoRW9SYnNIYzgzWGlQM1BxM1Bh?=
 =?utf-8?B?eERmODlWakJxcEJaSnF4MjIwaEoySUpRZGlST2t2Mms3RXlIT3BVMWRUbjdT?=
 =?utf-8?B?c3JQemtZYVJkRm85bmFJSW9ROEhZZWRtR2VEM0EyeXQyMzJrblJwb3RiazBB?=
 =?utf-8?B?dEQ0SWJadWgwMnhMWkY5V3BzZEdOclArR1YvcWRmWkxTbnV4Z1Y5cVlsRWRF?=
 =?utf-8?Q?OtP6+JYUZCL95FjZjz8gWH4Hm3L5XdKRjIk0kkyu4KAN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cc1c87-608b-475a-5862-08daa246867c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:15:01.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkJj04hqv4WMmUbTSMobJ8qYhrJsjzCFv2h8hlDPIYYY9q3Ve3b71x2fvr3dxC+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5057
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

Am 27.09.22 um 19:24 schrieb Arvind Yadav:
> Remove the extra signaled bit status check because
> it is returning early when the fence is already signaled and
> __dma_fence_enable_signaling is checking the status of signaled
> bit again.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/dma-fence.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 406b4e26f538..11ef20f70ee0 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -648,11 +648,6 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>   	if (WARN_ON(!fence || !func))
>   		return -EINVAL;
>   
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> -		INIT_LIST_HEAD(&cb->node);
> -		return -ENOENT;
> -	}
> -
>   	spin_lock_irqsave(fence->lock, flags);
>   
>   	if (__dma_fence_enable_signaling(fence)) {

