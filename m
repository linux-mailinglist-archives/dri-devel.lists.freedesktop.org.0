Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A6F380415
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61E76EE12;
	Fri, 14 May 2021 07:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421C26EE0E;
 Fri, 14 May 2021 07:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJHScgbdpZX8wgNy/fKLsa+WPDZso3Pklr19Rtbc7F16H4VSVxhhHJ41ubDeYYEU9nNIbmaH4G0xcnEFkxk2513ZSHtbxa0wwHJRZuKqfu35NvhtctXABT2vm0uCjLRXHopcE3hl/wQCNy+SGz7ZtLx2WqzbLDw7A/+BNBJ29mOsD6xGuTeHF3SthE1VoA7eklZK/WaU5ZPAb3wwHDyxtTSO/iStkkU/vu+7i9tKkErG019vdWGYC9aMWFWRFwIBlogeAsdsth/R4qhvK33AjKf4w7EN/M6XbE/obFZEVDRD3j/S9l7YeS/M6bbdeKQ9RtOHKHF84kTkPtPErp0uOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKKIXMdTyRPJALPYri6c3qB8qO6iWPYhHjjPMznM+Z8=;
 b=L+ZmUwWYOKWkfAur0SSpwf5ZOvFTyvz8UT0wCIxyoZZQV8aIBtnd1a+NoL2f1F6M7cqbaG4LLwdoMsTwo0Kvjo0eoQ6v1fvp2kUba4xJoWJSvzr9tfHb74rMek/gSzX1jWj6Xb1siM7bqWigHeQpodM1ciP7IGqDJIXjVwoqotiI0e1TYHeRgmevuStZ7T+B7FcgfTmYNqztrmdGEJ5nORWCVfmaAqIQR7+h+4dOZqq9Xs66d4duUgFTnMDMY34fW8KKkevc41vEPa6dE6uHFV6FPrrooTJr1LpY3AV1FboBHUfpWbIQwx9ZZ7Ej8ZrNOTUPsPpY6pY9C6OkWKtRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKKIXMdTyRPJALPYri6c3qB8qO6iWPYhHjjPMznM+Z8=;
 b=cS+H3OcvPo4355Qt3Vn/OG91DaPzuhh6Fpbmh0LsD1h4HpxAp4wCIV8zzxkodU5CJQzxzm2zo/La0xvmC8iCTEYvP7uy8ZAMWAb+6qfIZUNt5vkyOhc0OrWlZExIE1pN/iMtFEsnPjY9lVIFP3U7uHpI6PCT/YPEGgvdd3L3Ga0=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2578.namprd12.prod.outlook.com (2603:10b6:207:49::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 14 May
 2021 07:18:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 07:18:34 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE >
 AMDGPU_PAGE_SIZE
To: Huacai Chen <chenhuacai@loongson.cn>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>
References: <20210514064039.1300558-1-chenhuacai@loongson.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b555643f-8369-2eb5-fbea-89e6e9f01435@amd.com>
Date: Fri, 14 May 2021 09:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210514064039.1300558-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
X-ClientProxiedBy: PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
 (2a02:908:1252:fb60:cf70:a0fd:8c48:efd4) by
 PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 07:18:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6392e037-8db6-4dd5-e373-08d916a87c0a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB25785829876340508C3316A883509@BL0PR12MB2578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iOoCWlkUxBRWn4wSxtIZuyJfSB503/Ilff1tv3neQY0eq74ld6PdkBf2aqsSSKo68SNc7zkJWcGeaN+a++GmpMt0ke/AVXfWaXm9m/VznegW2wGWQUfHkVQlZUS8H7UVM7vHLnuCxV9UtDcmh6BCJSw5ss4AJGWsrvr6Rrh3pTtSgbgKA66gTOtiVrvSMtWftrlEEJ4xqfGvhHjVYwsGVjtB8DnEIvO0R81PKG4Hsj4tIQTW3ShDQNxxy8jInPFqpCPQOQe13Ck9GU7zHVRm9k+BgUN+KCET3wyWjiOWpO7AQ9ruymhKmQMNAe+yPPGJL+buNK9yQwcW5ifo1TXvgoX8sHeCUw42UMD7uk7YR1kcYWwGbyhVP4iWPX0UPOeiP0Fk+8c03hg6rc8hD7cFbsCl3xtjDIW2SyHn+56ydPzEL5YUiL/D7uJee8FWTDNm5MiMkgwEIt6odeHpPfMuuO/JStE0mDpCGKlSGvUS3mtjiMGn2KeshV+5i45KC4/Oj+ghCFqpYoiSznkMbhlWhYbPFZMzhy2FkJ/Yh/EDBEtqSB5epFB3ODV8m29GxdvWqDhJXkTI0EYWbVQ3d0dxDCsxnGwltkfkPQYOCZX1uzyiSMJ7p7unXmiNI27K0RK7VrHf60JywlKOEX+cUyUv0y0dx44P3n0YxC0KUKBm0Iaz+kGfJAKflXJ5PcZNLXrX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(478600001)(15650500001)(2906002)(6486002)(8676002)(16526019)(186003)(8936002)(6666004)(2616005)(31686004)(110136005)(316002)(5660300002)(66946007)(86362001)(31696002)(66574015)(66556008)(83380400001)(66476007)(36756003)(4326008)(38100700002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEZOZXFqMHNRZ2s2UDFuZytqL2dSYVVIVFc5YVI4WDFLUUZsMWJPcVA1dHF0?=
 =?utf-8?B?VVkzbGx6NzNBNHA5UGx2eEQwTnB6Qk5IL2orVGtHelViZkpYN2hQSzNEc3pq?=
 =?utf-8?B?QUN5YngzUWYwcXRtM04rMVFQYS9XVERFeWFaMzIydWgweWFNRjNiWGNxK1NT?=
 =?utf-8?B?OXBFWEJqczFqTG1zVVhNcURkLzhhZXJPQXRXQ1k0NjBiWHFRNytBZHc3Q1dD?=
 =?utf-8?B?VGhEa1V2NEc2MnlKN2NZNi93My9JVm9BWHhxTklyM0dsQ0V5dnV5LzRFb3pi?=
 =?utf-8?B?bUt5WnJBNWFRMW1wa1A5OGd0eUhjU0w1cHE0MjlzZWpwMmtVTE5xVFlEajVu?=
 =?utf-8?B?QktmaklNdmtEa2JYQ2MzWjk1ZGFncG41NUtHdjEwMnJaYjJZaFRETUtUK1lH?=
 =?utf-8?B?anJiSUpubUJybkpNZ0xaMWJTeFlFVXFyR1lydDVXVnp2Vkg3WTQyYUpyUFNZ?=
 =?utf-8?B?UlRidlhReE11N05kSEVjbzgzQ1hQYjRxRldBb3ZPU1R4b3lxbTZMZWw5RzJp?=
 =?utf-8?B?cWZldW01YmhVVzFKbjNwWnJJbFlOZFZLRXZwYU5hdVJIRS91cjREMDFwK0NM?=
 =?utf-8?B?TlZNV0xLZ1gyVTNGalo0WTJKSzBBV0FGVk9aSnY3SW10dHVJYnAxKzFobEVH?=
 =?utf-8?B?czZ2MkRmNWNFbmM5SFNMWU5xcXNZRjR4ZTdZODVSRjVMdnZqUEd3WG9rSHFv?=
 =?utf-8?B?WXkyTFplRTVLNlZINnVvUEE0V2VUU0N4UmxrT3o3ZGVqVGRiUTBveVRwcDNH?=
 =?utf-8?B?bm1MblhxMC9UMnowN3pXSEkzdWVwZFRHWEExN0JBdnVNTWRJd2c4VkFuTkdY?=
 =?utf-8?B?YllRR2o5a1pMVlR6cE82a2xvL3FBQWdFdHNYUXFtL0VrS3BhTzZEN3l4blNZ?=
 =?utf-8?B?dzFtYVVJNGcwNi91LzZTMTcwdHdVRGpDajlYVkM5Qnl0a1FWL2xtOTYyekkz?=
 =?utf-8?B?b3lORCswSXZnMU9FNTFYQzU3S2VETCtCOU1kZnh3Lzhhenp0bmcrKzFHNEdr?=
 =?utf-8?B?WDFGTm5QT3JUR1pDRVRMT0RFUzNKNGhZT3lYTkVuekpYTkFmek1sM1Iyamxv?=
 =?utf-8?B?TUxZVFBVR1NrSWR4ekgrR0lrQ3BCdWJibm8rTDVIaHdGRjU5cEFBMFJ0OEZs?=
 =?utf-8?B?clhDY1ZyVCs2VzYySy9HK0E4cmZpVSs4RUNlMDRLdVNQNzJzdTFqdlBVYU96?=
 =?utf-8?B?NW5RWElubEdsa3dManRubUREcjdnQXVtQ2ZSZGhrZ2x1VjgzRDl0ZEtRVUxp?=
 =?utf-8?B?UFczS29hTkJITldkUG9qRzlJVFVmQ25hbVNLb3dzbnNnRHpJdGszM1duVmRE?=
 =?utf-8?B?c2VWMG9BNDhrTHNiNkNMOTNyamNBRm9MYVNMR2c5TU9HVlVXYVhiTnJHcUFx?=
 =?utf-8?B?Q01RcG5DS0VqYVZ1aHRaMk56emFZRE1xODcrcUdVdFd6S1NKdmo1QTZPY1Vk?=
 =?utf-8?B?dnRCN3hBa1ZxT0N1Qng1RjZBOU5UMEpIMDhUWmRUWmVQLy9QN0lqcmJFQzRw?=
 =?utf-8?B?amZYOTFpVWRhZVhIMG4rOTlqd3JlZlVYWCsrbU5wSWtkYlNZRjY2UUwrUlpo?=
 =?utf-8?B?aFpSWmx5NVhtazhMMDJvUGd0UGg4L1RCc0paNmNmVG8vWUdsbVNncHZuODZD?=
 =?utf-8?B?YzMvSUlTMEZhc0dnaTBKQW9UTnlkRGpOaTdZSTBzeCs1N0JpRnBidDQ3aDZO?=
 =?utf-8?B?MHRvRnFsYnpSZ3NNMGIvZGh2SEZHWGROMklGbFAvWHdRUlgwVjZWWHRKZE9J?=
 =?utf-8?B?Zjdvdy9WV09ndnZZdGZyTlRKcFRMTWFkNFJQVTBQYVAvcGt0bnY3U2Z4NnVL?=
 =?utf-8?B?Z3BCZ3hnMlgyd1JaVUYzWDhYdEMzNWloK0kwZ21Da2EzcFhlbUdWMlBhNDQx?=
 =?utf-8?Q?zE+K0qLRDC9P3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6392e037-8db6-4dd5-e373-08d916a87c0a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 07:18:34.1840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpXcNA2UetKU+oFI5rcFHt3v1ltBrXLc5subGyOEismhkeCWmdMNcSDZj9EQBYTh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
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
Cc: Yi Li <liyi@loongson.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.05.21 um 08:40 schrieb Huacai Chen:
> From: Yi Li <liyi@loongson.cn>
>
> When PAGE_SIZE is larger than AMDGPU_PAGE_SIZE, the number of GPU TLB
> entries which need to update in amdgpu_map_buffer() should be multiplied
> by AMDGPU_GPU_PAGES_IN_CPU_PAGE (PAGE_SIZE / AMDGPU_PAGE_SIZE).
>
> Signed-off-by: Yi Li <liyi@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3bef0432cac2..a376a993e474 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -225,7 +225,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   	*addr += mm_cur->start & ~PAGE_MASK;
>   
>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> -	num_bytes = num_pages * 8;
> +	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>   
>   	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
>   				     AMDGPU_IB_POOL_DELAYED, &job);

