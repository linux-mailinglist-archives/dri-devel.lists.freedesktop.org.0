Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669ED749CC4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9F910E3FB;
	Thu,  6 Jul 2023 12:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B610E3FB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:54:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abTl+DgkoeMtqRtNBTvhR9fEVRzqsHG/ObaczNaG8/WaFWIXi95uqRDtLerzFYN67IiSFZBe2rw4bBiatCUcIJK62OaomzuWLhmfy6Oe2iEZXJXq0G0+xcALRjXV1Iu5iCPE586H6/zTw5O+tGPwmr3WuQGrXVGOCuJvlImrgdbss1G/xL0RIcwaLPLrltD/UF+9LmdK3+CYGAFqNeli6mOD1lGNsWDnRGbm20v4z29wgeU+dulF2GBi1086M2frGFXtNkefT5ONBxMblOnIsKrwL+YvFUHTnX7pVAhTeu0mK9sX8PYb8noUt8GryM/gCUIdwsZYQTrf5YNIBoUMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeEQEuTZunrLsRvwqIC/lBnXLyF9qwc35iERwmNV7f0=;
 b=h0zQs+8kRCRXMmMfxYH+NtuJPfOlwNN4BWBj83GBZtphKM3Kfe5OXepigbTEiQB/pZKCoHWxcEG6OvuzXKUui4Qd4T/YAA3Drr4vcjp4ghSqV4quWCbJjpepWy9YYlKtLX5C+q6ITFSw/CgMihn6A0iJ8xzZJyKomzyiTi/Nm/g1vGxZJeimjuevQGf6LPQ9J+3UGW4gqta4lhGdhhd3PHf3EZE765rlU2wL9qcVfnj2uDuNtkeJKID4kGoX15HTQDIuJPfUfATC4n/Wl4bzfwN4lHCgQ/rTx3Yjh2TbYPJBw9+fJD/ICEms6Y40Rx3qEi3PbctiAqGBbu9eSVWEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeEQEuTZunrLsRvwqIC/lBnXLyF9qwc35iERwmNV7f0=;
 b=p57WKb+pHEBM9b8zYcdBC5K+4zJx8XNJv+zRmFBEeIFctPLsIIr2gv2mJ2h7N6+27thbPBy8yUGuBuEcp+nPMnd82noeGl7/CW+F3Bn2Mx3hMVfCNam4BVx1kKQpVnWiqtFR3AgiyNFWv9lyYYNPBnhpq2N0hFx75PL8P4DEMSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 12:54:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 12:54:38 +0000
Message-ID: <ed3ef0ec-140d-59f1-b37e-4731d763a11b@amd.com>
Date: Thu, 6 Jul 2023 14:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dma-buf: fix an error pointer vs NULL bug
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0246.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ea2f00-0c87-485a-8203-08db7e202848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltK/br6R5Vw5U6bdZkm1cdDIP2G0UEHaOuFxdh2GrrVZhv+fz2FtUtYmU4qLpVpU4d9s5Yn6TvE56kB/LKAaGfzmqarvAamhgLP3yH4NpT7z2z0h3aARHoKVcIWB1KgzI7MSTEJ+J2bZn7lBehRoq11nlrVCHLP1GlK54vWTWwo4QO16L5BnF1JWJ8I3JJ2wMdjFZ4KgvThcCqSsJLNVBPKMvHCDgc6V9mZXhb+BlzdIz3LDHnVoLoefZ/iEEv/i24NkmhAH1IGqf6V45KFJSxa2RW3pPrqqihU73pvSUaufIsvW/y2oXV6AE+wvnugSL/qXcdicS8VtGy85CtimEU9CXqrFyVM/InnfQM8JhpxcZZbMzKlOBq8UoPtcRIcTGRAhp3BXJy2Fo7qZ06YITpLAXPzsokPQ6kHAZZVjtl5oNPiivBQXT4cJlGH80VZq9Hv9JYleiatg72L7HhWcK58mFkQw3xIpXr2aarXKEc293oT+e6ULehtLPgjJqlFNXA7QnKCdfCyyE9TOv25ilKzqD6bfUCMSDXm/l9u2m9EKrPebrxXr3FAkmdULGZMhvLi6Ur87XtzAlaCDxuRpEEDRSJntMSL4kEhCOyAGFhbgrdHAf5kFypho68Nq6uP9oat1Om7CvpaHtJmqdqCPcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(316002)(4326008)(31686004)(66574015)(66556008)(86362001)(66946007)(66476007)(6506007)(6512007)(186003)(83380400001)(2616005)(31696002)(2906002)(6486002)(38100700002)(41300700001)(8936002)(478600001)(7416002)(6666004)(5660300002)(110136005)(54906003)(36756003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCtaTGRpbVVhNVhTN2FnV1hZcTRjL0plOWVpWGVhSFZRT0FrYTZwcnZIOG01?=
 =?utf-8?B?SXFteFlaYXpMb2JGSDE4S3lZdUpJWUhnOXkzVGQwYmdYeDFuVEd1VFpoTkNm?=
 =?utf-8?B?NWcwd2ZlbFUwTk5zU0c1eUpHTDJHZjV5ZnZnV3VTejRoR1IrbnR3UEp1Z0Vk?=
 =?utf-8?B?YUpvYStoeFdqb2RONStwVkhRdEs4MGJsMVY4dStXaGp0YWRhM01mTUdZUm00?=
 =?utf-8?B?djlqV3Q4RGtFQVZ3OXNsOUlKdjlhdHlxVVRKRE5hK1BxQUcyUjA0K0JDRjh5?=
 =?utf-8?B?L2xiRDR6alhXYXJRNlp1ZmxWdmd5cURLbHlUdlZ6U0lVZFIvK25HUzJ3bXdQ?=
 =?utf-8?B?TzdKV0lSWkdQSjB0aVV5VTF5QlNhSW1KM3YwZHNuRXhUcDYzbGxvMk1sNi9L?=
 =?utf-8?B?WFc5K0VrODJ5Zm1RUDc1NGR6bEdINXRmMURqTTRvcUErMU1qenRrTG1SQXBo?=
 =?utf-8?B?MXFwa0V0Yk1ZaWsxSGRRL3JHR3ZydUN1aTBWNnhURk5OaFkzOEd0bWY4WElk?=
 =?utf-8?B?VG0yclFTSXpxV2tHNHl2Z25NbG5KRm4wYUVaV0FOQm14b1BiRm13NjZQZG5r?=
 =?utf-8?B?MnZJMXJnU3BQVTNZZ3NYbm1GWmhocDdhNXRMTFhDNGhyVThZdU92L0xmN3lU?=
 =?utf-8?B?SlNVaWtIeWIyZ1lITVhsakVhQXdLaGJSOFViYmJHVG50MUhwaUZHeXVLeDJw?=
 =?utf-8?B?ODJENDZGRFFHOE5aUTQxUHY2Q2JTUTVPQy9PNFZDT0VnSXBRVTFYZElvVHRI?=
 =?utf-8?B?MFhLa0NkWEtzTkswRzg3WEtVRHFrWER4czlNMndqejY1MllyQlZyRDV1WU10?=
 =?utf-8?B?NGlmT3VQUkFCNEhJYUpIU1NEbFhsTWg5VnFDTGVRMjFuS29qd1d5VG9WeEtG?=
 =?utf-8?B?ZkdSU1ZiTWNJN25OQ1AwYmY0RDZPdGdveHR1QWNodW1nT1VYdWhuaHBsUVpy?=
 =?utf-8?B?cFVwSEhsZkVXck5McldRTHdCQnplOUFJT1pxS0xHa3RTN3czcEVUdE9KaEc3?=
 =?utf-8?B?Zlk5dDZQb0txdUVVSlNHVXdzSHQ5T2xxa2JqTHMzcTl2V0FoSjRaTHZhbjU1?=
 =?utf-8?B?MkpsSllGdVU2UDU1U0VzcVNJREs2Uk9MSThZVCt1OGZWa3ZhdDQ2TnZvL3VK?=
 =?utf-8?B?Uk5FUUNHc2FsRkF1ZFBtM01sS2xqTGp3ZXJWa1l0Q2lna2RjNVFOaTJxbWxw?=
 =?utf-8?B?aStxUnlQSFBRUXM0Q1RieVd5VWRPaE1jVzM4Z050ZHlPenhURzNvREdBcEIx?=
 =?utf-8?B?ejhuZVhlVlRhMkp3RDJuZ3hSdTZOTkFwVjJ3cDQrUG9RKzVMY2NvSWcyc0hG?=
 =?utf-8?B?ZDRCTmpLMzdvZGdTbU9yOS8wVzVVSTQ1MTFFQkNOaUJIQVpWcTcrdzdrcnp5?=
 =?utf-8?B?K1h2VVhWa2xvZ2JKTUc5MWNYWXptWVhFaHRmNUxjUGZjOUlqN285YU9oMnd4?=
 =?utf-8?B?Y21sR1BsQWsxZ25obnFjSmwvVmJJM0NrUGdwR2gzeVE0ek4vQXpRT0xhMDBT?=
 =?utf-8?B?eVJFeGFTM0RycDVVT2o5bG0vZm81UUVHTlFEeitlaCtsMFNGMjFwYm5TbWxB?=
 =?utf-8?B?NnBjL0pWT1ZCS0pDYUxsRXUrMGJMcU16NVVUMGt0VzZWMldrcHJqZzJmbkRV?=
 =?utf-8?B?Tm12RWJucE5zL1VCRXBmMWFLTG0zWDYrbW5aOS9EY1J6TGZDL0ZFOVI2VzdI?=
 =?utf-8?B?Z0NNOW93NXlEQkpuL214N0RBYWFVSnVVNWZwZnRVY3VIRXVFLzFzRVZVbkdX?=
 =?utf-8?B?a2JwbkRoN0YyWVdJYnQyb3M5RFc2Q1BPWUFBQVcvSzN3cGxZVmwxejdMalBi?=
 =?utf-8?B?YkZSYXlYY2RmaGNuNUw5ck5BUWZtQ1Izb3NreFNVMlY1OWR4TVM5NEFhZTRD?=
 =?utf-8?B?bHNMZjdueDcrRTQ3S3E5bEFUUk9USE1VTGEzbExrS2V6WlVZem9KWlp0a1N0?=
 =?utf-8?B?akpGTnBlQkg5dFNVMHpxdWloNVJsOVhEMi8rN0Q0NGRKOE1NQkVYc1VUajJh?=
 =?utf-8?B?b3JtQVM2Vy9GSkNBL2pEVmg1aVQ4QzZ1Wk9kYmlMUkgxdkFSaEpNZWV0K2Qz?=
 =?utf-8?B?YnlVbUptTzdVdFJGdzNhdGZrZStadmRFc2p1bWt5cFVFdXJnTzVmS0V1TFkr?=
 =?utf-8?B?Sms5ZXJCVjNLdnM0WVh2WGkxbTFzZjVJZFdrbU9MQVZWYTFQQUxFWS9CS0VW?=
 =?utf-8?Q?HH+TGd5SCGNndMAYTtBA84mbGxIJAUXvjYqkFDExKgGO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ea2f00-0c87-485a-8203-08db7e202848
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 12:54:38.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JLS3QKYEPIcISiVIw3hpvsMqNkwDEnTE/tcYtWIwcfmZjzUEhg+qgcmxnhp3wWV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
Cc: kernel-janitors@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gustavo Padovan <gustavo@padovan.org>, Maxime Ripard <mripard@kernel.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.23 um 14:37 schrieb Dan Carpenter:
> Smatch detected potential error pointer dereference.
>
>      drivers/gpu/drm/drm_syncobj.c:888 drm_syncobj_transfer_to_timeline()
>      error: 'fence' dereferencing possible ERR_PTR()
>
> The error pointer comes from dma_fence_allocate_private_stub().  One
> caller expected error pointers and one expected NULL pointers.  Change
> it to return NULL and update the caller which expected error pointers,
> drm_syncobj_assign_null_handle(), to check for NULL instead.
>
> Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences v3")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Should I push that one to drm-misc-fixes?

Regards,
Christian.

> ---
> v2: Fix it in dma_fence_allocate_private_stub() instead of
>     __dma_fence_unwrap_merge().
>
>
>   drivers/dma-buf/dma-fence.c   | 2 +-
>   drivers/gpu/drm/drm_syncobj.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ad076f208760..8aa8f8cb7071 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -160,7 +160,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>   
>   	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
>   	if (fence == NULL)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>   
>   	dma_fence_init(fence,
>   		       &dma_fence_stub_ops,
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 04589a35eb09..e592c5da70ce 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -355,8 +355,8 @@ static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>   {
>   	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
>   
> -	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> +	if (!fence)
> +		return -ENOMEM;
>   
>   	drm_syncobj_replace_fence(syncobj, fence);
>   	dma_fence_put(fence);

