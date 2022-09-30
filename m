Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E45F0B70
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 14:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E05B10ECBB;
	Fri, 30 Sep 2022 12:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF610E1DE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 12:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA0QgOyvOQ8IAuLEAjasFkMuJi+P/mrbUspTfZ41ew2gyVnH907avpvr8H23Rzs9BlFkk21SpZqclLIFpnXOFajNpFErexy1aKVFsP4VCpTQ9tQr8mBO2kbfj8RExc6HctI1gwfdfsCGROXbS5FwuK33UjT0VCGtPJ+eJr5IzB8rq+o/4RN5MaNmz+R4hvqSS+N1HjfQAFuwglurkP8OkvK1jKvl0A86TUaSyzI0BSOektx/xT3h8avMZKKskNEcpTnU3AFNWXeAZqf+BX7vIBRAYLU6wCszm1+BSKtIBZe0IoqFcH7bwM8IcegxvCQ3wxoI9o0LAAKfcdy+f3iLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ktSJcsysVABitLIn7GAT4bn9Jj1eJPyyQXorE0I4pw=;
 b=bZslPnf/Rher1ViyoYnIGXqna3qYnGuwSiSbQOmPkGl6LgqpQ4vsjFyw+Jj2raVeBNwGqlo/VfS+QBEeNxkHQKOlx2bFZisPhtB1juYecHdcdifzcarIb5I9B1pxVapGh8VweUkoQGL8aisKPXgdzzx8wrYGJ57aGpa3qvKfl5VQNCupdMYSGAF+xFTJoW0Xn22Y+la5b7AQN1jxso6bBlHunZwKxk3Y3NacLeMmFGur+G/YaB9rcTQ7GM9ZOgAy0UaKbyqTFhE4GeMSRm9+8Lg/85vjk3TONcqLd0vTDQdZ63xvZNxzVyOToQH/CKYb+qbH2ZHXKtt4xFu4/gxU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ktSJcsysVABitLIn7GAT4bn9Jj1eJPyyQXorE0I4pw=;
 b=qeSgVG/HZ+PrgHgTvTG0BKD1U0Ho+2QBjaLjbXklmksXkx1JTqO1abYl+/JOSIsM0oj0Y37ZyytkH1PKGGgs3ER78GabgyidDAF2zhxP+lYYIUh808o16iCEuqWJG+UCfjRazpeeAO658VUWlZwcPxldEJMMB/6f7+XLmEOTtKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Fri, 30 Sep
 2022 12:12:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 12:12:18 +0000
Message-ID: <98ae0798-af8c-848a-6bf5-ae55b2dde6b5@amd.com>
Date: Fri, 30 Sep 2022 14:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/13] drm/scheduler: add
 drm_sched_job_add_resv_dependencies
Content-Language: en-US
To: "Chien, WenChieh (Jay)" <WenChieh.Chien@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220929132136.1715-1-christian.koenig@amd.com>
 <20220929132136.1715-2-christian.koenig@amd.com>
 <BYAPR12MB295219A4E2E249DDBE36B63089569@BYAPR12MB2952.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <BYAPR12MB295219A4E2E249DDBE36B63089569@BYAPR12MB2952.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 1433da27-522e-47fd-22f7-08daa2dd054c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vJbu1taRtcJ0X/tcHA+Ms1W3SVkS1puFyCt9iyviAYUHpIdffIxnyDqHcJLZO9gP4yZ7fTVieddZtZNI+MkPgTY2Oz36OdIH0UrHhNbivMUoxmGW5XAJOswolzlOKnWB2ENP0fg/AQyDbJoRGbGl222gTrUsB2wVCbbvUwYn198xr1MJLRtdhOh1kFpiXPdiOidf1MdopW6xYTfNhWfA66+Gv2xvOZqp9xP8yWt46/rQuAEt0JarUHe9kZEuN6HUBdkCIWXsVM9VNlk6Bt9oTB+zFGUznB7eZ2wMoUowY4CjsDJWDaHdazR/lWZeQhIasshk40CluOhG1sZ2QJlpodh+/QTyQD/SKOenO4k7+pIShYcNuJJJPZlOUlCjneFuqzN/7hbBVwXR4ti+nJutCNG/TqSNM3hABqDEBJJbHc6mOlz++AMZAdjOpFl7MYkXAOHkUFg9NSaXt3eoLJE3Xw2MzEdUHJl4Ca8KMbVBS2dBkDbesS7l9PMDOlgKFudq39/TO2SPRpXO8pfnAqtXD21dUaUG9cP209PDJ3IOeOMi6tWKULl7FlXVnkD4tWfLlq7VnI8ZUbBVknuolALsaPUuXc5ULfmJf0VDhhdHfsypa0AvnUbqCg7vMKb1xObtHgziHBPhQoh590cj8lnoNtXTkkLRg8rfqKBwNjrQ1e+sBJhghHWlH36RZwr5IJlELDKfg2Hwrl+Z7bnWebRQLuPS9O4dy7HxQBROTf3RdiiGy2Dvkot6tauGoFPN025hKHXjlsgSNIPdigeLaEz/w/0mtowSmeZy/pOBfMzACk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(110136005)(86362001)(316002)(31696002)(54906003)(36756003)(8936002)(66946007)(66556008)(66476007)(2906002)(8676002)(41300700001)(4326008)(66574015)(6512007)(186003)(5660300002)(2616005)(6666004)(478600001)(6506007)(6486002)(53546011)(38100700002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWVVMUJYV0wvS2FJREt3cFViSjFLa25ITDcyZ2pUT291MHE5STlmeGV0RjZt?=
 =?utf-8?B?Uk82dkNiNlkybUxBWkxzTXdnQlRKRlNXUDdUTTlSOUtqejFkTDNiK0RRaEpk?=
 =?utf-8?B?MlN6M3dsbzlHVmRwK2c2ckVrL2wxeXNrMEJRdDl0K2JWZGl5Wkxvcit3UGtU?=
 =?utf-8?B?VGhEeC9LZmpLbC91cktWdmdlNGExVjdzU1NBbjNQc3E2bVpHVFZISlNXaDJy?=
 =?utf-8?B?TUZzdTl0SnhoK3NTZUFMdlJrVVYyQzNzNU05MG5DTEZSRXA5M0lzaGtleHY3?=
 =?utf-8?B?SXg4L3FUcjVzZktnTU5ZWGRJWm95dVVqRFdxK3lZY1V1WFc3SWhMWTZwTXdl?=
 =?utf-8?B?b1RXWTE2dzdZN3J5czlFaWlkUXB2dW9pK2tKWVZkdGN5ZWw0UWpacDkvOG5N?=
 =?utf-8?B?cEEvdUMrOHErclhWUzRtalk3UUxZVCtxSmExQzN1dzNHRzVYNzcyMkJkV1Jq?=
 =?utf-8?B?OHJYOVMzNk1Xc0xOenM5WVNva3BlK29GMVR2TW81azRDRXQ3cUpVdzU3U0Y3?=
 =?utf-8?B?TVVNeDhhbUdkUWo2dVZhRU9KZEc4RGIybms3NU1sbENLVHZENk0zWEFuSDJD?=
 =?utf-8?B?SkhrbGtjc1hTUjhpZUlqT0ZPQzF5ZW1HV05KQmtMUXk2UXVWNlA0V0hwRDN1?=
 =?utf-8?B?eThUUTVCOUVaNHpCMXo2TGdnSEVFQk1jNWJNamwvNkRPWldGV2FKZEp4REFn?=
 =?utf-8?B?RnpIazJoOU1UMmoySk1BSUNpZnQ2MkdTcmw5RnVIQ3huVVNpZGVZUVYxNGw1?=
 =?utf-8?B?NDdobTUvbldnTEx2TFFxSVhpazFENitTSmRwcUJkdnJCZXVOL3ZFUWlueEZx?=
 =?utf-8?B?dUVqemxydlQwVHZRZWY5Wkt3bzNtT1daR3N2TGdpMWNUWUsrWGRxK0xWQWlF?=
 =?utf-8?B?RjVIZnZiMk1IaEF1TFBmK094VEVXY1J0WC9XbjJUQVFTdy9lRmVhMEdpaGtr?=
 =?utf-8?B?V0QrOGRjU090dVA3WlFjSEdaY1dCUzRleU1rR1FvR3hnWW1OZW5tNWRINmFk?=
 =?utf-8?B?VFo1aEdIS3FKSzJmTDBpUkwwUjViZU5hMExaZjJnbmZVL1g0Ym1TdURpL096?=
 =?utf-8?B?a1ZmdUpvWnU2cXQxL2RMbURDZXVuN1MxUHBLMC9EOThZbGtLb0tCTEtBOUNj?=
 =?utf-8?B?VWxBVHZGRHhKSUNjMjhRa2x2bFpXb2dFU2k1RmpzRW1jQnJ6a2pMNkZCT3VH?=
 =?utf-8?B?V2FFdE0rb2kvTXQ1dmtkemdpeGNuNGw2MjN5MmI5WFJhZmxPTzlEaVM0TVlk?=
 =?utf-8?B?d3pzNDRVaVNPeWMrUFZLdUkrOHZjTEJ4RVdRbWV2SG55NlEwbFV6M2VsbDRi?=
 =?utf-8?B?VmZtVzVRVFZveWJ5bVE1ZW5FNkU5R0E1OGJkbjdSTnIxNlNUSkl5RU11VHFv?=
 =?utf-8?B?SVFLWFpLNGQ0cEtUOHFhKzNlL0ZOb2lSaTJ1dndoMUZJRFpPa3BTTEdrdVpp?=
 =?utf-8?B?MW96VUU4b2tvb3QrZkZIQzdpZ3RyTSt1RS9LMVlGMmg5end4YnYxNjR3Nlla?=
 =?utf-8?B?QWVueVdqUW1jYkxTRUU3dUNnNERiQ3FrMFNSMnM5R250aFFpcHJ6eFA4aHJt?=
 =?utf-8?B?VkZxQlJKR2xQV1BGQUh2VDk2d25qMStZeFdZSnEzVHIyZVhMekRZWEYrZ2k4?=
 =?utf-8?B?d2FoYUphZEVsMlFlNEQxUlhTQjhzY0dESmg0UmxnaldLY2EwR2pNQlpMMmc3?=
 =?utf-8?B?K0xTR3ZYUldhaWhsbEd0cUY4YXMyRVhHYTJ4WFR2R0VOMjJnQm9mWmpBODhV?=
 =?utf-8?B?QkhmYXcxR3hDLzFGa0pMcWdjOU1DZWlWMWkydnhrQVp1N3dXbDJZalpmdTFs?=
 =?utf-8?B?bG1nQkVVK0RUZk9zaktkd2UxaEZURXdrcDIrZE90MzZEK24wZmt4cVRwZVhv?=
 =?utf-8?B?c0FnUURFL2t4R0dJVFl1YXNQRTNENHRvTzFBbVR1RFVRMEVCektDNytGcVA4?=
 =?utf-8?B?MjR4WG5UcmtzWEsvakVTS0RGQ0tIT1o2NXN2anBvSVd1NE12OGpaMVBqODBJ?=
 =?utf-8?B?Tk9pTEY4MU8zaWhKcDJ1NXpJVjdlaUdkeVVBeU5IenY2bHp0eW5qZGYyN0dn?=
 =?utf-8?B?OERDS016ZmJ3bE5pZCsyazVLejNjUEhzKy8rbmtkd2VYSUFoREpRSitjemtI?=
 =?utf-8?B?Z1JtTlRIOEhDb1cxbVZ2ZlBBVi9Mc1VCa0JtSjJZMVgvcTNPV1B0T1VpeUMr?=
 =?utf-8?Q?SWF0/IzPVgQz3sLNwvRLh7ObVC6cImJ6wwS25ISnPzh5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1433da27-522e-47fd-22f7-08daa2dd054c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 12:12:18.8256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqkb5hV5TXKaLbQLKBrRip7aecqTDgoCq8zJlBcypSoxV7vN8MelHu4+WaxXgz9/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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
Cc: "Wang, Chester" <shansheng.wang@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well this won't be fixed on older kernel like 5.4 or 5.15.

You at least need something like 5.19 and even then you need to look 
into backporting that stuff.

Regards,
Christian.

Am 30.09.22 um 04:05 schrieb Chien, WenChieh (Jay):
> [AMD Official Use Only - General]
>
> Hi Christian
>
> This looks on kernel revision 5.15, currently, the Zork use 5.4
> Google also comment that kernel 5.15 fix the issue.
>
> I'm not sure the kernel  have rev plan to 5.15 or not
> We will discuss this on 10/3.
>
> Do you suggest that use kernel 5.15 and merge patch to test  ?
>
> Jay
>
>
>
> -----Original Message-----
> From: Christian König <ckoenig.leichtzumerken@gmail.com>
> Sent: Thursday, September 29, 2022 9:21 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Chien, WenChieh (Jay) <WenChieh.Chien@amd.com>; Wang, Chester <shansheng.wang@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH 02/13] drm/scheduler: add drm_sched_job_add_resv_dependencies
>
> Add a new function to update job dependencies from a resv obj.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 49 ++++++++++++++++++--------
>   include/drm/gpu_scheduler.h            |  5 +++
>   2 files changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e0ab14e0fb6b..6e2cd0f906b2 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -685,32 +685,28 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,  EXPORT_SYMBOL(drm_sched_job_add_dependency);
>   
>   /**
> - * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
> - *   dependencies
> + * drm_sched_job_add_resv_dependencies - add all fences from the resv
> + to the job
>    * @job: scheduler job to add the dependencies to
> - * @obj: the gem object to add new dependencies from.
> - * @write: whether the job might write the object (so we need to depend on
> - * shared fences in the reservation object).
> + * @resv: the dma_resv object to get the fences from
> + * @usage: the dma_resv_usage to use to filter the fences
>    *
> - * This should be called after drm_gem_lock_reservations() on your array of
> - * GEM objects used in the job but before updating the reservations with your
> - * own fences.
> + * This adds all fences matching the given usage from @resv to @job.
> + * Must be called with the @resv lock held.
>    *
>    * Returns:
>    * 0 on success, or an error on failing to expand the array.
>    */
> -int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> -					    struct drm_gem_object *obj,
> -					    bool write)
> +int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
> +					struct dma_resv *resv,
> +					enum dma_resv_usage usage)
>   {
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
>   	int ret;
>   
> -	dma_resv_assert_held(obj->resv);
> +	dma_resv_assert_held(resv);
>   
> -	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(write),
> -				fence) {
> +	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
>   		/* Make sure to grab an additional ref on the added fence */
>   		dma_fence_get(fence);
>   		ret = drm_sched_job_add_dependency(job, fence); @@ -721,8 +717,31 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>   	}
>   	return 0;
>   }
> -EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
> +EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
>   
> +/**
> + * drm_sched_job_add_implicit_dependencies - adds implicit dependencies as job
> + *   dependencies
> + * @job: scheduler job to add the dependencies to
> + * @obj: the gem object to add new dependencies from.
> + * @write: whether the job might write the object (so we need to depend
> +on
> + * shared fences in the reservation object).
> + *
> + * This should be called after drm_gem_lock_reservations() on your
> +array of
> + * GEM objects used in the job but before updating the reservations
> +with your
> + * own fences.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> +					    struct drm_gem_object *obj,
> +					    bool write)
> +{
> +	return drm_sched_job_add_resv_dependencies(job, obj->resv,
> +						   dma_resv_usage_rw(write));
> +}
> +EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>   
>   /**
>    * drm_sched_job_cleanup - clean up scheduler job resources diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index 0fca8f38bee4..3315e5be7791 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -32,6 +32,8 @@
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> +enum dma_resv_usage;
> +struct dma_resv;
>   struct drm_gem_object;
>   
>   struct drm_gpu_scheduler;
> @@ -474,6 +476,9 @@ int drm_sched_job_init(struct drm_sched_job *job,  void drm_sched_job_arm(struct drm_sched_job *job);  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence);
> +int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
> +					struct dma_resv *resv,
> +					enum dma_resv_usage usage);
>   int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>   					    struct drm_gem_object *obj,
>   					    bool write);
> --
> 2.25.1

