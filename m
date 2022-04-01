Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8954EE940
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC15610FFCC;
	Fri,  1 Apr 2022 07:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDCF10FFCA;
 Fri,  1 Apr 2022 07:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frmyaf+SIiwffGX1lIRCwLRUgTTM9ZFO4rHYjWqgt/dhaF9uvUftFRa/LxGWQjKr42pMB2hKv7oc9nnM2noj4zGYfi3mx1TbFo+VH4KXlQDvvTZLU2YWieFTO3+vUeRUV4S/nI7wpLKGOwRs/2jBKQ+nNL0IZSnKjayOcuRpdUTM+FM8Aij6CW3EgPVrOut5aJwr29vCIJLtYESl3jLehzZkIGY9yLkIJ3OZPj34TZM8vyfh2/udUx6JNA/6nQuusNnfJTMWPBcevlew5nsOriANU7WS0YXfhse9pM/my73dJd5QsL1Nq5CxY0cqKxaXoRxg06zqWwrdqJjK+CTQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vcv1VbUTzY2cP2Dp76O+ECZiD4CSjp08KNuMhErPTc=;
 b=LCW1D+UePyoWw6Al6xObxg6800Oiy6T0DUHTK4ynlHbTRrtKnQiyI07xxUNOqpXmEJoOzs1B34tnpnLzihUrr/NLTjhqkj8cjFDGU3KuDh14h8IrgFa7Y4A28FE1OeFl3w2dd3BQUB6ntfbeIscStWQ3AYJtJDp/POx4U4iZds5X/ycB7kRjvQ3162xHhD2492/8AwImHV/rz17RMJYqk5IpZW+ml2lZfUiJGxPeDl1Ra7jssC0ducdNdZPbflEQglu79DUOhqWOfnGrbsr3Qxf5qUzcL8cQo/8vi0AnrrkQSHRqXuEr6wOkhxtuQCda14n4c2ExfTQXaruBvrI2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vcv1VbUTzY2cP2Dp76O+ECZiD4CSjp08KNuMhErPTc=;
 b=VeuEdfSBQ/4PfXnP7hvSnJQTfGiwVkcx6fujz9Kk35LtwCcS72AUAnuq182j9gy7AgsGb8keru7WQwPCo+byhi0BKaD4cCP+28OO1Lzzoq+rkKsmqEL2wF9Xo/97YkHM/rpGrKRmmcP+RZExnPPKIQk/RSGDUwNO6IwxMfgUfmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1490.namprd12.prod.outlook.com (2603:10b6:405:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Fri, 1 Apr
 2022 07:49:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Fri, 1 Apr 2022
 07:49:09 +0000
Message-ID: <e09df802-0823-aa23-7434-925b6af7a0db@amd.com>
Date: Fri, 1 Apr 2022 09:49:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] drm/etnaviv: Use scheduler dependency handling
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220331204651.2699107-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0026.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c313fd6-8fd0-4439-f08f-08da13b41ae5
X-MS-TrafficTypeDiagnostic: BN6PR12MB1490:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1490C5B0E92AA1BFAA97D1F083E09@BN6PR12MB1490.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AzWKOrFbG9YNa7swAWLjJJMMu8qkebEjJOKtVh8yFJF0MBVJAjSkxn4SCfedyXFnX+hmdSeF6TQYAmgqv9mRN2prUAEqzVUpnowz05xh6RO9UYW8t8hxxRHbWw65Rpt/oO9MHzUXWoVqUvH+fOFVoOIiDVh5Iwy1U3U5KVfy486N1XyGyA7aBWTaMTAnc0uyTgmNXOBFIEgPMMMPt2Y1INROKciMifa95gI0K+VhDeLiwu2d29RlvrLkhQSy8G08oeDu/TdNfkN9yhwq9KxkL/CsaSGSDXifiyqT7JVUFyPdrUDeDXoVGp0EZuW78eoggrpVwbMtmKKg0sPvLcjmQx6Um173NaWIv5PnNsfPtRFMqTtPSoNjFyd6a/yCU+r9y7ynMUNrsr+8sjGrdxASe7nV3qLJnIONFl08eoz1ZdiW0O/m2OF5bcUgym/k/czx3K50z9dP7IuIyH7dhgU3qIQM5tbkcRZzXKbUcP3o/Gxe7mxxH9c94X9zqpEGl0nriSjUSl1p1hsIoj4pXpmD0ngaToA8r6rC5ltzUXJ4yfKaM43rdc4fKmyYXuUuN0LvhMsjE4pqYr4o/uTbDpBgUVvVLL8f9835BP2AiLIEtCbWrqmCQB7wInDCYPcl+FAFsC1JeWerCjJxopu413g2ZyqCTsO2srrUNu0EMmDL6OCXe4oWZaby2MSKWskITo/+HgB5yEDyd7uhfINhr7qO/ao0BitzJUl08pIltHU176avGyvSCNYL9X2iLCIRkxU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6512007)(26005)(508600001)(2906002)(6486002)(6666004)(83380400001)(186003)(6506007)(31696002)(8936002)(86362001)(7416002)(66574015)(5660300002)(31686004)(66946007)(8676002)(4326008)(316002)(2616005)(36756003)(110136005)(66556008)(66476007)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2VzVGNXR3Uyd2RrZmVoa2dzYis3c1V6TFFNbTFISHUzV082bXRtVTd3SnAw?=
 =?utf-8?B?T3hmbXArcThuZkxCV3B6bEZSc29OSzY3VSs5OTFzUE5ScGpOR3Uwd2duR2ZJ?=
 =?utf-8?B?YjQ2eXB6eDk4QjA1enk3QXY1UTBSU0Q1Rmlub0J3eHdXcnM4QURGMHRTb2tN?=
 =?utf-8?B?bE1XMHE4WGxsTG9GSGNRSjVxUXRFcDFOQzE5cENqVXM4SVVVais4Ymw5ZTBt?=
 =?utf-8?B?RlBvNE1Pb0NEc3dDVHhnS1VFWE94Z2p5WnNFNFB2VE5JNXR0MkpIWEFuelZK?=
 =?utf-8?B?Y3pZNnloUUk4dWtsWUpIMU1qcGkvbU9SVUZ6bURFTWY1RjF0aE42WmdLR2Zt?=
 =?utf-8?B?OUF5a0cxeTdieGUvV3VTRVczUWlsdnRUS0hpZFMwRUdwNUJjUHR4ejlZazZW?=
 =?utf-8?B?WlUyeE9FaXBBaUs2UjlHZjRhUWRIWFRVL1phWGF4VWY1QmNHNE1oYXgxbnQy?=
 =?utf-8?B?ajNqRDl0R3hUTktHdXlLdVMwZm1GaWZ0c3E4UXU3a2JVRG1RVlRlbzdGa21r?=
 =?utf-8?B?YkhGTUhJUnhMbnR5ak8wSlRWclRxWG1NWWljNTFKVE8wMlJLNFlIWXBDaG5K?=
 =?utf-8?B?blhtc2FkUmJEY0lYUWxVV25xNzJyaVNueGNIN3FRV0N2RmdSUnBxTnlKaHdM?=
 =?utf-8?B?SEJ3VDdPR0YzSmZzL3RHcTcwTU90SHNRUHlnelMvaytaVWJzNmg3QmdGbzBQ?=
 =?utf-8?B?RGdWZlR6cDNrRlJoMGxFcmVSTVkwamFxTUh3ZlJtQjVLU3o2VWRjUkF1Tjd2?=
 =?utf-8?B?cmR2ZHRZZUxkdXgxT2JXR2JOaUlxTDYzc1BoRG9nRDl5dmIrbXpoZ0FOdVRl?=
 =?utf-8?B?eGZxa2hUZTRLTjgycjBqTEhJd3V3MXFnbzBjM2wyai9mU3EvWG1qZU5Mem9C?=
 =?utf-8?B?eXJhUmtKUExrU3Y2Z3RJcVRrdEMxSE0zK0xzSll6aXZRaGZvb05JRDRHQUVZ?=
 =?utf-8?B?a1RoUnRwc2FNMlRrVzdWL29HRGFKU2xLcThWeFdiY0NsNzM5a1hjNlVUdE00?=
 =?utf-8?B?QnArUEdOR2VBVkt6eFJMNS9HeFNoQm11RHhidFY2dnVrckdtN3M3dk5Gc1dP?=
 =?utf-8?B?dEJlMTVLSGswMWcwSEpJb0FLRitaSTg0SHR1d3BuVUEySEpCZ0V1U3dNRktJ?=
 =?utf-8?B?cGZWSnR4SWp3Zk9CandCVWFVZFlUa1IxcDhHZVZRZmVlUlE1cU5CbXRnLzIz?=
 =?utf-8?B?UkZwUDZOYjlMY0FlL1BOY3RwVlA1U2xUYVE2ay94L216UW0vc21MN2JDaWVo?=
 =?utf-8?B?SFZ0c1B6dWJkbm5uclNEWG5jVlo0R01ncjZtTzRIYk9xa0lEM21EVlBMOUhT?=
 =?utf-8?B?SzUyeGxHMzlTMi9vZ0tGeWZ0amVtS2NNMlB4THAxSHdOUjFQUjZuOUhuL2NN?=
 =?utf-8?B?TThPbDE4bkNTcnVOeHErR1ZCNVlQTW11SzFQT0lJQkFFcWs2aGlxVVljQUVV?=
 =?utf-8?B?aGN6RUZPOXZrNkxlcndoM2VhTWxzc096TzFodi9CeUxHZ0ZwNVZmK05obXl1?=
 =?utf-8?B?bUVzN2VoUWRZa0NSQzAzUnhKWXF0YytZa25HOUZUSGtKOTY3Y0tzK3Z2ZE1X?=
 =?utf-8?B?bG13dkRPVFdwbU5xaHNEWTdNT2UrUDByL2g5MHlLT0QxN29uVWpyMmpidHpM?=
 =?utf-8?B?ZVBBZXQ5TkRpR09VL2hoZDVJM0gwcUtpVDVsNFZsc2NlZHhHcUtKeFRCS2NI?=
 =?utf-8?B?WUFyckRqU2N1WDZTQjJuY1NRNU9hKzNxSUFoVkppeFRQSC9BNFdFZ0ZrbTdk?=
 =?utf-8?B?VkFnNWZoUGpIVlRyVE5rQnhGSmp1VHdCVmJPSU0rTDlvZE1rSVkwcVdjbmNQ?=
 =?utf-8?B?RGtPSUZiV0tZQURDZzJsazBFWWRvVm1YK203ZDdrblVJVUdqYTVvMG56eWVp?=
 =?utf-8?B?Sks3MHZncHgwVUJwSEtwNm81dFFBODllZGtCbHRJaEUyRFlGTWNlV1ZXN1pl?=
 =?utf-8?B?RnpaVzhWR2gwR1d0QWdWUWNsdW5ibTJXNlI2bkpLUmlZYldRWllLdzRHbWFp?=
 =?utf-8?B?VGdhTFR5aG14ZTBTbTVlSVBBTmlXTk0yQ3oxS1Y0MDA2QVMvSzZCNWdLemdJ?=
 =?utf-8?B?eGwzamNKbHlHYVZXMFpSOWRKcTJhVXRTTVhXQVU2b0l6SGZWQlIvVkFqbVND?=
 =?utf-8?B?VHBHdzA0WlcwTzJiWVFZUURnQ1Q1alkxaTUyVm5MYytaSmdUY0lweXIxaDFR?=
 =?utf-8?B?NEdCZ0xIbmxEREtPNG5kVUxPK1NKQlVSdG5yekZkU0dPT3R6Wnd1ZDFFWkNz?=
 =?utf-8?B?bm8xUEMvb1prQWJOV1lDOWlUYnZpQW5iOEhHNExaVGU0RzBBU3ExTVZhTXJn?=
 =?utf-8?B?Tm5GakdhNGp6Wnd2N01zbHAxYUw1VXdZN21BK1VoekpLZHlYTHVRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c313fd6-8fd0-4439-f08f-08da13b41ae5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 07:49:09.5320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RakU1j0bc05UgKRUcyCx+wXK/NNg+RvLrUiJ306ryeq7lLzDM+WnmH0smUWv3UlU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1490
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
Cc: etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.22 um 22:46 schrieb Daniel Vetter:
> We need to pull the drm_sched_job_init much earlier, but that's very
> minor surgery.
>
> v2: Actually fix up cleanup paths by calling drm_sched_job_init, which
> I wanted to to in the previous round (and did, for all other drivers).
> Spotted by Lucas.
>
> v3: Rebase over renamed functions to add dependencies.
>
> v4: Rebase over patches from Christian.
>
> v5: More rebasing over work from Christian.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

But Lucas should probably ack that we merge it through drm-misc-next.

> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  4 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 51 +++++++++++--------
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 53 +-------------------
>   drivers/gpu/drm/etnaviv/etnaviv_sched.h      |  3 +-
>   4 files changed, 35 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> index 8983a0ef383e..63688e6e4580 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
> @@ -80,8 +80,6 @@ struct etnaviv_gem_submit_bo {
>   	u64 va;
>   	struct etnaviv_gem_object *obj;
>   	struct etnaviv_vram_mapping *mapping;
> -	unsigned int nr_fences;
> -	struct dma_fence **fences;
>   };
>   
>   /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> @@ -94,7 +92,7 @@ struct etnaviv_gem_submit {
>   	struct etnaviv_file_private *ctx;
>   	struct etnaviv_gpu *gpu;
>   	struct etnaviv_iommu_context *mmu_context, *prev_mmu_context;
> -	struct dma_fence *out_fence, *in_fence;
> +	struct dma_fence *out_fence;
>   	int out_fence_id;
>   	struct list_head node; /* GPU active submit list */
>   	struct etnaviv_cmdbuf cmdbuf;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 592cbb38609a..5f502c49aec2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -188,9 +188,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>   		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>   			continue;
>   
> -		ret = dma_resv_get_fences(robj,
> -					  bo->flags & ETNA_SUBMIT_BO_WRITE,
> -					  &bo->nr_fences, &bo->fences);
> +		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
> +							      &bo->obj->base,
> +							      bo->flags & ETNA_SUBMIT_BO_WRITE);
>   		if (ret)
>   			return ret;
>   	}
> @@ -398,8 +398,6 @@ static void submit_cleanup(struct kref *kref)
>   
>   	wake_up_all(&submit->gpu->fence_event);
>   
> -	if (submit->in_fence)
> -		dma_fence_put(submit->in_fence);
>   	if (submit->out_fence) {
>   		/* first remove from IDR, so fence can not be found anymore */
>   		mutex_lock(&submit->gpu->fence_lock);
> @@ -530,58 +528,69 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &submit->cmdbuf,
>   				  ALIGN(args->stream_size, 8) + 8);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_put;
>   
>   	submit->ctx = file->driver_priv;
>   	submit->mmu_context = etnaviv_iommu_context_get(submit->ctx->mmu);
>   	submit->exec_state = args->exec_state;
>   	submit->flags = args->flags;
>   
> +	ret = drm_sched_job_init(&submit->sched_job,
> +				 &ctx->sched_entity[args->pipe],
> +				 submit->ctx);
> +	if (ret)
> +		goto err_submit_put;
> +
>   	ret = submit_lookup_objects(submit, file, bos, args->nr_bos);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	if ((priv->mmu_global->version != ETNAVIV_IOMMU_V2) &&
>   	    !etnaviv_cmd_validate_one(gpu, stream, args->stream_size / 4,
>   				      relocs, args->nr_relocs)) {
>   		ret = -EINVAL;
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   	}
>   
>   	if (args->flags & ETNA_SUBMIT_FENCE_FD_IN) {
> -		submit->in_fence = sync_file_get_fence(args->fence_fd);
> -		if (!submit->in_fence) {
> +		struct dma_fence *in_fence = sync_file_get_fence(args->fence_fd);
> +		if (!in_fence) {
>   			ret = -EINVAL;
> -			goto err_submit_objects;
> +			goto err_submit_job;
>   		}
> +
> +		ret = drm_sched_job_add_dependency(&submit->sched_job,
> +						   in_fence);
> +		if (ret)
> +			goto err_submit_job;
>   	}
>   
>   	ret = submit_pin_objects(submit);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	ret = submit_reloc(submit, stream, args->stream_size / 4,
>   			   relocs, args->nr_relocs);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	ret = submit_perfmon_validate(submit, args->exec_state, pmrs);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	memcpy(submit->cmdbuf.vaddr, stream, args->stream_size);
>   
>   	ret = submit_lock_objects(submit, &ticket);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	ret = submit_fence_sync(submit);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
> -	ret = etnaviv_sched_push_job(&ctx->sched_entity[args->pipe], submit);
> +	ret = etnaviv_sched_push_job(submit);
>   	if (ret)
> -		goto err_submit_objects;
> +		goto err_submit_job;
>   
>   	submit_attach_object_fences(submit);
>   
> @@ -595,7 +604,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>   		sync_file = sync_file_create(submit->out_fence);
>   		if (!sync_file) {
>   			ret = -ENOMEM;
> -			goto err_submit_objects;
> +			goto err_submit_job;
>   		}
>   		fd_install(out_fence_fd, sync_file->file);
>   	}
> @@ -603,7 +612,9 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	args->fence_fd = out_fence_fd;
>   	args->fence = submit->out_fence_id;
>   
> -err_submit_objects:
> +err_submit_job:
> +	drm_sched_job_cleanup(&submit->sched_job);
> +err_submit_put:
>   	etnaviv_submit_put(submit);
>   
>   err_submit_ww_acquire:
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index a8452ce10e3a..72e2553fbc98 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -17,48 +17,6 @@ module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
>   static int etnaviv_hw_jobs_limit = 4;
>   module_param_named(hw_job_limit, etnaviv_hw_jobs_limit, int , 0444);
>   
> -static struct dma_fence *
> -etnaviv_sched_dependency(struct drm_sched_job *sched_job,
> -			 struct drm_sched_entity *entity)
> -{
> -	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> -	struct dma_fence *fence;
> -	int i;
> -
> -	if (unlikely(submit->in_fence)) {
> -		fence = submit->in_fence;
> -		submit->in_fence = NULL;
> -
> -		if (!dma_fence_is_signaled(fence))
> -			return fence;
> -
> -		dma_fence_put(fence);
> -	}
> -
> -	for (i = 0; i < submit->nr_bos; i++) {
> -		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
> -		int j;
> -
> -		for (j = 0; j < bo->nr_fences; j++) {
> -			if (!bo->fences[j])
> -				continue;
> -
> -			fence = bo->fences[j];
> -			bo->fences[j] = NULL;
> -
> -			if (!dma_fence_is_signaled(fence))
> -				return fence;
> -
> -			dma_fence_put(fence);
> -		}
> -		kfree(bo->fences);
> -		bo->nr_fences = 0;
> -		bo->fences = NULL;
> -	}
> -
> -	return NULL;
> -}
> -
>   static struct dma_fence *etnaviv_sched_run_job(struct drm_sched_job *sched_job)
>   {
>   	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
> @@ -132,29 +90,22 @@ static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)
>   }
>   
>   static const struct drm_sched_backend_ops etnaviv_sched_ops = {
> -	.dependency = etnaviv_sched_dependency,
>   	.run_job = etnaviv_sched_run_job,
>   	.timedout_job = etnaviv_sched_timedout_job,
>   	.free_job = etnaviv_sched_free_job,
>   };
>   
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit)
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
>   {
>   	int ret = 0;
>   
>   	/*
>   	 * Hold the fence lock across the whole operation to avoid jobs being
>   	 * pushed out of order with regard to their sched fence seqnos as
> -	 * allocated in drm_sched_job_init.
> +	 * allocated in drm_sched_job_arm.
>   	 */
>   	mutex_lock(&submit->gpu->fence_lock);
>   
> -	ret = drm_sched_job_init(&submit->sched_job, sched_entity,
> -				 submit->ctx);
> -	if (ret)
> -		goto out_unlock;
> -
>   	drm_sched_job_arm(&submit->sched_job);
>   
>   	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.h b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> index c0a6796e22c9..baebfa069afc 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.h
> @@ -18,7 +18,6 @@ struct etnaviv_gem_submit *to_etnaviv_submit(struct drm_sched_job *sched_job)
>   
>   int etnaviv_sched_init(struct etnaviv_gpu *gpu);
>   void etnaviv_sched_fini(struct etnaviv_gpu *gpu);
> -int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
> -			   struct etnaviv_gem_submit *submit);
> +int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit);
>   
>   #endif /* __ETNAVIV_SCHED_H__ */

