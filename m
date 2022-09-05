Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B05AD186
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562910E30E;
	Mon,  5 Sep 2022 11:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F6910E30E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:25:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJHZw1aW3iJ9H8ot87aCJKqOXqomwC6OUFd2TITzCSCMjNe+Zvr0FMVolsRnLAjAtBxfJWdqAbh2moFIcLs5dMYRvyZhHxkYxQj2PMOEva0GOAH3NAqBpsm75IrqS2xZj9hewXnEpfEQrwW0bTevyIkeH5LqeVBWXUiTtc1Vuwbu2UgORl3eod7XL0QGGGXJSifesox7T5cLDYcN/2Si6XnBmGxTuVX10O/opEX4+SNsSDe+J2Dthh/+5nejurw18VqFZra3PDqyNNB/IVR/TmyLEkd56bPu2ed0EdgWQ9Cfa6WjYNJ74IOoaoFRY7QB3PoGdFbf0+RST4oeG/wGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M62w+sA/4ZgJkn/JIBnuBpwTw8jDUHybcNoEpP8YN1M=;
 b=ZyaLm70g4gD7Dp0RRzuk4ssXB/jVTGlwb7NG0MbQAXZA5U244OzuopuzKRlJX8rt408uWdympa1HJwF5aYvEHjEq0XwwcklC/5zXQkSs/taIME7tYvFnG4EcdLbDmg/QFL8jANZIaUJh3F3nXjVqxBbH61ANxRSNrZ81lHxbkRYUd8V82jA7prsWzsvA8YMXr+SN9B3NbrpBHQkhiYOb99ACzzXZ1VPylU9Q1mKrsf8RLX3Iiqgy1LqzoyTqNZArrKoiKPZZGAhLKX930KHEVY1W5ykseVekQnKQXTuZQ47MzDfQdRiQH0vPPf9VML79H4X809r7+kr0YgAu5z6xnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M62w+sA/4ZgJkn/JIBnuBpwTw8jDUHybcNoEpP8YN1M=;
 b=AeHP94RjRUr9j9YgRfFzKkUXAe/ddOaORzf9KELLSzaYZd2n3Uh7OF1kHOXyscJDRshnJ4iZVUlPiaqzUtyCc8sJH+CFGxySOJB5vQotvx7k8g8K1qE0ewe7oowD7jcwV4NXsLE4un0Mq69uZ1JXyH/KqMcDcVsfB+ZYo0jOtfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 11:25:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:25:51 +0000
Message-ID: <96d14c8a-e3de-fcea-b3b1-434bc6a78ae4@amd.com>
Date: Mon, 5 Sep 2022 13:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] drm/sched: Add callback and enable signaling on debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-3-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220905105653.13670-3-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5adae3eb-7587-4db7-640b-08da8f316358
X-MS-TrafficTypeDiagnostic: DS7PR12MB6237:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yAosFKgPdJTNwt2WIXuUA8TrpjVnD3ZNBYQZIg2cuMfuXFu1bAV57dJctT28Qn78/VOUE0kAs3SK60XIMvyf9HqkPey7cn5H1DkMWoNSjx8mcROULJhUKvoSqrtCKEyC2LKPEziSGpkzQnOoOVSy6swi+7eL7Ij464+S8oeNv62OZzKdGS8lOJd/gbD1KEyb7uFCntwQe0UM1eQLl++5mYPFKHc4WlPpKBsfTy8iZwaWMLAxRmFhT6CInP6yoWkc7UYQxwL1IUgCv+dpgN9gqobETI6YouhJmCjgX6MRenBtAMNWuoLtLrzxY7XDx7owevKtp1aQuJamH2AvLS7S/OR4MfRPYX++f199iS8YMYvo0C9Z+ItQeckR0HvoLqivcOM2l1va1GQHs9sqFQ+3Wtdtzc2PD4EbqVC7+xU7A9qKghOx+LSERMj8yQJoEVgharVoxMMwZmRS3MeRftK36Dbm+IYRlQV0UROc7/5RgHSph/STz90BsrEYT+5Qb/m8LDXCFSyHdQeOJLpCGjm/KEfAIPyXAB2fUhhJrgSMp/GnNsBWYWCZJIUiJr1uNHGdFEvyDt683aNr3WQdhq4y2VLFNP1jJdZSjpddmYKpEEUCf7rlG4Nh3rCuICgAH4aNKMIFqFt9xtFP0KBobSbLUwFfNMEyhwFGhh1iAgQoYxMuExt96gqgIzIFs++v5rhOLzwRtDWmIPKPAfQcyQ8WzLOj8Lx8JSe+mJgamXqqcooqkzMRCA3THAJ0U9LofjbsEkFWAQ8QafrgWSsdj1EQSNKSjvoAcapWqRnuH9EcdUhPtg9GIMnySMJkFVbLQAhM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(36756003)(6506007)(921005)(6512007)(2906002)(31686004)(38100700002)(478600001)(8936002)(6486002)(6666004)(5660300002)(316002)(41300700001)(31696002)(66476007)(26005)(66556008)(66946007)(86362001)(8676002)(186003)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym82SENRQTNRSmNhTlY4Ny9ZbDFkaEg5OHg2MWRENXU4UWV0clU5Z3FxU09v?=
 =?utf-8?B?dDEzSldLSkxaRWdySVZGZ0hEREtMRE9memZGRTlPcTl5MHBnQ3FkcEhjWU9n?=
 =?utf-8?B?dEFUSlpZd0tsYjZjcGJHVzlRcVNOck5QOFhFZVF5azUzOVZrb1A0ZkRkeUlV?=
 =?utf-8?B?R0tSdDdLbGR6Q0JlN2dlUHRTZ1c5am9EVTRqM0wrUjhtYitTOFIxSnpGT1Z0?=
 =?utf-8?B?V050cE1pQXh4TjJpV2piZU9JenV2eEE1RklURElKQzFYZ3I5bWNEblFYSnpM?=
 =?utf-8?B?Y2dHRU1WUTdFTlVKb1FndXNOcUMxbW9ZL0c0Yjk5MlJ2dHMrNld6N0pNTnRU?=
 =?utf-8?B?Y3Y4eE5JQXlGeThTK1g1cTFlZ0V5L3h2b3dnL3gxRWdkd2JYdzRlalZZSzl0?=
 =?utf-8?B?Y3pkcUlRNndCNXBtS3k3b0xoTEQ1U1Vmc3ZzZGFEMWxSZkFYdGpUeWZkOUx6?=
 =?utf-8?B?cVVwbVkvanZEOVNaSTZnc3lFdWNYUy9Idm81YTN6RGR0dWhMR0xkaHhBSm1I?=
 =?utf-8?B?NDZpM1YrcUZMUFpFL0p2ZmhJSFhwR0V2YzBKb2IxK25zd0NLYTdiT21oemEz?=
 =?utf-8?B?WlpyajUrL0UwV054Y2dTcHdNcmFmSnoyTGVYaWZWdG5kQlVucENUOUFBTkdL?=
 =?utf-8?B?c1d1NDY3U1FFdGZLU2tub09CUnRzMU4xcSs5S2trSVRKWk5pdUNuTnp4Y05q?=
 =?utf-8?B?akl6T2ZEbkk4aFdBK1FCTzBNWXFoa016djFqVUQ3TWJOcExBRko1Tml5QXBV?=
 =?utf-8?B?VUtOdHMyUXRZMFM2U28wV2ZpWVJnN0Z4RWpwWStDeDJBaGtHeUw2bStqWklZ?=
 =?utf-8?B?MXhzd3J0eGlQU1k4amwrU3ErWnBNMDlVUmkyd0RHR2tzUTR3U3loMVZ3WXUx?=
 =?utf-8?B?WmZQZ205dG1HUFdkMUZVQTBpVWZyRVJ4dXRGV1JHSUltL2JQSHh4T1BWNXhF?=
 =?utf-8?B?aTdCamIyMys3WDZUQ2RIeHExN09MQUE5c2tKWng0ZlNvZUVWTWVUZ0RScldD?=
 =?utf-8?B?dklKVWprYlJ6SXU0S2RUcTNjeXp5NGJhcjJOM1dkSW9qRzBJdXBaRW0zKzNI?=
 =?utf-8?B?RTlFT2lPU29OdWdjaEYwOFBPWVgzb3VQa3Y5WmpiM3pnWDc3enRrcWVmeW9x?=
 =?utf-8?B?SFFsamhqVlI0MFF2a29lN0Nqb0tIRjJDMU1qcWVtRTY0UjJmeEttUVBMUWJi?=
 =?utf-8?B?S0YyVkIwUXZMbVN6QmRXZStQT3JsK1VFeGZacTQ3aCt2L2NhY3lmK1lMS0sw?=
 =?utf-8?B?Ny94d0VBVmZrS3FlalFSczFqTmNnei8xOWRGZmIvdVdEdVBnaFRFYzh5T2Fp?=
 =?utf-8?B?REsveHhVbG43R1RZYUI0bStFWFMyaVlUbm56QkFHd29id1huNERXR2ZzMllo?=
 =?utf-8?B?SDhUUS8xemNaODJpNWdwTlR3K0lnQ01BeVBFU2p4QnFqYXd3czU2UzF5d2NS?=
 =?utf-8?B?Y21XZU9QSTk2Umt2R3U4S3haQk1JdnFkeU5sMnVVbTBCMDVLMFI5YnlFL3Fw?=
 =?utf-8?B?eWQrb0tzRzl5MS85bE1DOGlxVnUxMld6aTl1LzNHeHVaVGpSZUNBSDBQbmJp?=
 =?utf-8?B?SUx1bWxkaU1sWURGV1I2YVprS3FHUngxaHRjaTZ2eFFGdkhWMnlQK0Fzemhu?=
 =?utf-8?B?TUxrR2Y5YWp2aDUvYkxwK3k4aXlXQlVneUZpK0ZBOHNtWDRXdVEvdWFpcUhJ?=
 =?utf-8?B?SGc2RStXRGFvNHlGcGVwd0h6Zkp0d042bmpFL29TR3ZuL1lCb1NudDh2Um4z?=
 =?utf-8?B?RlFrNXVUSE9adDg0TGdvOUVuYVdKdkdwdTZIdkI1cUpWeTJrYnRsUlR0ZkZm?=
 =?utf-8?B?K2tMbzFEMmxxdWgxc2tEMkhFdHJlMHpTc1ZRK3IySXFnWExMSFdYU09mRzFO?=
 =?utf-8?B?UVhYSGV4ZUhGK2lQcHl3b053UG5aLzJoM2dVckx2aHZPWjFmWEppNkhaazFo?=
 =?utf-8?B?WkpDNHVzL2tHb1VOZytUa2RWTnk4a3E4Nm5DdDl4Njg5blBzajRvbm9Qc0lL?=
 =?utf-8?B?YWE4SXpFcHRVRVQ5WDJ1dDZ0bFVrUm5kWW9qNTdRNmNrbVo0bG5rUTA4UWZL?=
 =?utf-8?B?eXlSaFo3MXErUVg0WWNwQ0x5RysxSjdYZVByYmcvWmptdHVWK3BaSkxtQkhG?=
 =?utf-8?Q?u+LFrNfF1KKBb8YSOAWYVafEM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adae3eb-7587-4db7-640b-08da8f316358
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:25:51.1440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB8/TVc07AZmmnNOFfRGlhXcshH7rsNap/dBNHj6mG6guj8SaqdG39mPoUmzA6ki
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
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



Am 05.09.22 um 12:56 schrieb Arvind Yadav:
> Here's on debug adding an enable_signaling callback for finished
> fences and enabling software signaling for finished fence.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c  |  4 +++-
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 7fd869520ef2..ebd26cdb79a0 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -122,16 +122,28 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>   
>   	dma_fence_put(&fence->scheduled);
>   }
> +#ifdef CONFIG_DEBUG_FS
> +static bool drm_sched_enable_signaling(struct dma_fence *f)
> +{
> +	return true;
> +}
> +#endif
>   
>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> +#ifdef CONFIG_DEBUG_FS
> +	.enable_signaling = drm_sched_enable_signaling,
> +#endif
>   	.release = drm_sched_fence_release_scheduled,
>   };
>   
>   static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> +#ifdef CONFIG_DEBUG_FS
> +	.enable_signaling = drm_sched_enable_signaling,
> +#endif

Adding the callback should not be necessary.

>   	.release = drm_sched_fence_release_finished,
>   };
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e0ab14e0fb6b..140e3d8646e2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -961,7 +961,9 @@ static int drm_sched_main(void *param)
>   			s_fence->parent = dma_fence_get(fence);
>   			/* Drop for original kref_init of the fence */
>   			dma_fence_put(fence);

Uff, not related to your patch but that looks wrong to me. The reference 
can only be dropped after the call to dma_fence_add_callback().

> -
> +#ifdef CONFIG_DEBUG_FS
> +			dma_fence_enable_sw_signaling(&s_fence->finished);
> +#endif

This should always be called, independent of the config options set.

Christian.

>   			r = dma_fence_add_callback(fence, &sched_job->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)

