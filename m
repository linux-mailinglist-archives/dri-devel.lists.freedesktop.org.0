Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E627D3F06AD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839776E7D9;
	Wed, 18 Aug 2021 14:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83426E7D7;
 Wed, 18 Aug 2021 14:26:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1M1du+IBIQLjOmJ+KLp/fgW6X6t9Kzdmi+SRdMdxfvTCJhEJzKNMOZcCPHFhXX56V1Cp/g0xZD+Lok+CMRxS0VT/1ApbHAg7hbHJz9KZXlRebpLR6Jvon6RvT4pTlylZ8LSlgDiKP7Gp8yOGZGFYvlOIkBjPU3WB6+hRJh5IRPkuj7IAAL7VjH8yIdUwbumek8s5RN0kbzhZeHtZA8i03blC31WFd92f3QLW0XyixR9+qvFsr3JqLvZBN4eGPYfyv+kt8bGZ1PvODRZb9b3nZhwL/FfQelfoJvSACue1wHH+cpJ8wZpwhfQi7WFrV3wfRQPxFwtIZXIKtLFWgQJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CvSYZQYwS/EMPpU73WfLrU/whLUzmCdibNl8vcgGco=;
 b=agQ7B4i+K7AeV1mQyweOB4xrvP/IT+CnPzUK2/onLI7RMsHHbHsYRX6T2Th9v5VFQFpKuBxlQyRElzEN0UlFCfkg1IO3+JHvYLkNEbCbZ4lbrlFgNCr8UgNYdTAayaDZfMO7HHYfGTRORDA5UlAISHs5tpk9hV+g4lg2/SxIONNB3UEo8tnzFbk/wavFUQdC9cB1S2uSVAXmlZO24hBF2jzd0Jc8pulZ/rXeH88ZS+OHq8yVMCVs8LkXGurWa178ly6seFJg1zG7KwbZtQoxAO6Xgk/d/2KEr+8fw4dVmNMqqIbCWtZ41SIno+XkHT7g9sq1gcQMjHBBKQQHveLrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CvSYZQYwS/EMPpU73WfLrU/whLUzmCdibNl8vcgGco=;
 b=GAF+EbPRBrQm5CBI8owagVSRo3AoUVOBNT0Qdx44tlvYrIL8I38l41LiPVpZ3WpbzzrRpoJ5FnmLgJ/Yvd97llkplW0UXZ+jwbDbxBJXpicI2ldp+IPh/ouEB+0zoWENsQYlYGRGtgBie3hvpiCBaKtrzZttiqv1eshK2BteyCA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 18 Aug
 2021 14:26:28 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 14:26:28 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu"
 <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
Date: Wed, 18 Aug 2021 10:26:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8030:531a:c97a:dc26]
 (2607:fea8:3edf:49b0:8030:531a:c97a:dc26) by
 YTOPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 14:26:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1856e62-b033-4968-f380-08d962542abd
X-MS-TrafficTypeDiagnostic: SA0PR12MB4397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB439762C63CCD6FA1A3581571EAFF9@SA0PR12MB4397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4fgs889jDr+FjYiIzF7tC7FZIpeVqpKuWJu7GS0xLWob6PGPItxR0LqYhJnWERIvMnkvFhgewDThpI9CfL5j/+JsiY/tB2tF+WP0YrN+ZNAGdq1hi9QKVEENIlzM2gf2Ls9WrztA73+/HiJDOr9Ak15Lj0H7jRdLnWQW/YHfTjuUKLx4NxCvHlPA8j5eLpx6XMIMUViayFlpTVT440lhAALW6UjfmKFn5STzHlhIIrXr1mpn/S1iz6CC+4AxVXDXkaKavkWJpiErJ9tYRdEb361ML/G+upobKF37hVLjdxRPwVDULOccKkagmwOftEUHcuYqsQBclI0kRXh3EjYZci7X3zZpvFroyGEBNjMXkklbEO2MSUq7XtcA+AaqiZbP28MKke2ob3guTKHhSFazb2Y5xEKDIwZzhwgvEbEEqIZo06zxufsClzMuoh9p+Zy1Ox1Zgmo6v7Ap5WFwfT/JJSF+cK54OLQVb5OE8pHqBzIv6dps+BMPHT7orJIZCWQXzUdMLF6O5ZjI0A1uw1W0PWCTaEjvb12qb1KPFAOnZZmReNdoT9w4eQjogf2pVasVByxIlXEGi+Slhzmmux7g1LjzRdy+DCNYohFV9fX11J5WieQ96u8u7sTLg0bDxR/49hoP1IT+2kvZOze6/dIQ1ubRTxfS/NRcWbOt5Nu4/U+4NxunngQUkWdKE8ZLtFoN5lUZGFiTmdhJcsqU1qI9lcznO36+blL+I/IaJgsn/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(478600001)(66556008)(66946007)(66476007)(186003)(36756003)(2906002)(8676002)(54906003)(53546011)(110136005)(6486002)(5660300002)(38100700002)(83380400001)(8936002)(4326008)(316002)(44832011)(31696002)(31686004)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVozbjZ4Qm1XRWh3eHlNM25MLzcvQlZzSXBqVFlHNUhlZWpNMlM3VlZRUGlJ?=
 =?utf-8?B?WFFXTkJCaGpCam9wRmpNTlZndGtVMW1YMjBtY3dWQllzaHRpRkhRNVFrQUFF?=
 =?utf-8?B?VjUrRko1eXFEbXloN09mcjVyREFwOXowYjBUNE9uRnJtc3gva05uSnhYdzd2?=
 =?utf-8?B?eTgrZ1dxQ0E3ckdyQzZLblRaNFJaNGppM0dxSXk4TTFWU0JEb1o1aVBxeGVQ?=
 =?utf-8?B?WHR6WkVualhKWHJNb1lhbG5sNEg1MzN5TCsxMUI4TDNjUGFXMy9ZdDM2Yzlu?=
 =?utf-8?B?ZjRCQ1VFYlEzRHJlY25ZVEorcFNpOG9FK3RCSk1oTjZGb29aMENkWmdlekV4?=
 =?utf-8?B?WjhVQmJSeU1pcG1zQW9GTDF1UHg5cTM2WFROYlN3SVNhQ2N2Y2tPZ2pXK3Zi?=
 =?utf-8?B?UEc5L2N6eit0TFFGSGJDaDVkbmZjN2Z5VER3VlZUY0hLS3BPMzh4MGk1OXZS?=
 =?utf-8?B?OHBsVm5DT0xqeEVFUFRWa1FWRU1tRkNHZDBsa2crenBIU3ZveFQzeGVoOUE2?=
 =?utf-8?B?Y0JwaUJ6a09OMFVudlVRWHh0SGppR2M1WWdhN29taE83Wm4ySzZHUGZrTTFW?=
 =?utf-8?B?T3VkSStGQ2x3dFVjMHRld3RtdHFGaU5XMHhoSktRd25vWFBYOU5mQjd2Sk15?=
 =?utf-8?B?SzZDWGJSaVpOTlM1WVFzeXZEaWFCajNyL09QK2JFRnIycjRuZ05xNXk4Wmx0?=
 =?utf-8?B?Szl2alJxVUI2a01BeDJPL0pYbFFZcXczalRxeUIwTnBZUnRnc1d2ZUxvL3RS?=
 =?utf-8?B?UUJvY0MwVFUrUUtrVUFpeUZlTlNoTjczN1VYZ21aTHdkM0g4clhEc0lwWVJj?=
 =?utf-8?B?ZlFFTm5kaUVsMHg5aWdXSDlLTGlRUnkwZjB2NUMwMHN3RXlQbVJCdzBySEtG?=
 =?utf-8?B?eFdMYUxZZWx3eG9sSjNaZnZMell3SlBjUnY0eGUwaW5ZbXVBaG1lYkVBM1ZK?=
 =?utf-8?B?TWdtMnNzZEFHRFg1enh3ak5waXhFcS9oek9rNHI0QXBNNElqNUI4WUIzN0RW?=
 =?utf-8?B?eXMrSk54VkFuWkZhdjBGbTBDVWhTMDJMYlpCY3NmTzhOdVN0YnZZcjV6MUNS?=
 =?utf-8?B?clM3WjNQeDlydHlEZVppcUFRR2NNMDRXd2hUMDJ3SUpYN2Rta2F3ZGxCUE50?=
 =?utf-8?B?VHgxekxlTmpaTXExbzdSWUZLWTNqTDFjR2o0NkNEVUk1SjVYQ09ienc5SUNC?=
 =?utf-8?B?U1BOZUc4S0ZFQVhFdUxCYnRnMXp0RHRFcnJPbnNEZUhCbjhxOHFyQU1iK2Y4?=
 =?utf-8?B?eHkvNzQ5SFVaOXk3ajB4VVNONlZHVnM2MlBZZWVFMVoxMVFsa3d6U1F0Wldz?=
 =?utf-8?B?QmVhUXBSTUdWMFlsOHFVdGtNWG1nOWJrWDlhaCsxV21Eak9CaFhuZCtTTUZt?=
 =?utf-8?B?MlJFaTE5OUhnYm5vbGlCMGRJaEFmSEdMZWZxK0dOOHdabUphb2NlNFprQzZv?=
 =?utf-8?B?aDhxTjEwem1wOThlTVVYMHlzN0N4a0RPNWlBOWJwVEVZdlcwMUdSWTc5akJm?=
 =?utf-8?B?SVVlNGlXWWc5Z1NuYWRSZjlNMU0yVXVuNm1mbFYwZXAxRjlpZTVFQWxCbSs5?=
 =?utf-8?B?UHVYQVRPQ0RjdGdZWFJrNFZ2NFlvOTdPQ1NKQ2VQSUpJWTZqalNPL1VYSEdq?=
 =?utf-8?B?azVoUTgyTmthTytlZjBQYVRZM1YramZzbWFxYzRaZDllNDBDa0Nldi9oMlh3?=
 =?utf-8?B?SklTWSt4Q1JQSS9kOXp0SHBGbUlZdFRhS1hOU2pCejEzUGtuQVZub3ROZU14?=
 =?utf-8?B?VEplY3ZJUjJVMkxLUGF1ME5uRkVwY1R4UU4xM2RXd0RNSHdtV25aOTBBTWJC?=
 =?utf-8?B?Y2FGZ05iWTlrc3FoL2lMRzVkYzZMVDNhanN4T0RKVnVFS0diZzg4WStOQmZk?=
 =?utf-8?Q?NnYSAAKieT46d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1856e62-b033-4968-f380-08d962542abd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 14:26:28.5571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mn4E7eYP820PyXoMx9mCqwAeRe45raVP43aCoLH3WBUiOUcjhKntGZQvy1v986yVKB+D6a6oa8chtdZ7BIaKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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

On 2021-08-18 10:02 a.m., Alex Deucher wrote:

> + dri-devel
>
> Since scheduler is a shared component, please add dri-devel on all
> scheduler patches.
>
> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>> [Why]
>> for bailing job, this commit will delete it from pending list thus the
>> bailing job will never have a chance to be resubmitted even in advance
>> tdr mode.
>>
>> [How]
>> after embeded hw_fence into amdgpu_job is done, the race condition that
>> this commit tries to work around is completely solved.So revert this
>> commit.
>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>> v2:
>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>> during processing timedout_job
>>
>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>   1 file changed, 5 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index a2a953693b45..f9b9b3aefc4a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>   {
>>          struct drm_gpu_scheduler *sched;
>>          struct drm_sched_job *job;
>> +       struct dma_fence *fence;
>>          enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>
>>          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>
>>          if (job) {
>>                  /*
>> -                * Remove the bad job so it cannot be freed by concurrent
>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>> -                * is parked at which point it's safe.
>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>> +                * processing timedout_job
>>                   */
>> -               list_del_init(&job->list);
>> +               fence = dma_fence_get(job->s_fence->parent);


While this is true for amdgpu, it has no meaning for other drivers for 
whom we haven't
done the refactoring of embedding HW fence (parent) into the job 
structure. In fact thinking
about it, unless you do the HW fence embedding for all the drivers using 
the scheduler you cannot
revert this patch or you will just break them.

Andrey


>>                  spin_unlock(&sched->job_list_lock);
>>
>>                  status = job->sched->ops->timedout_job(job);
>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>                          job->sched->ops->free_job(job);
>>                          sched->free_guilty = false;
>>                  }
>> +               dma_fence_put(fence);
>>          } else {
>>                  spin_unlock(&sched->job_list_lock);
>>          }
>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>
>>          kthread_park(sched->thread);
>>
>> -       /*
>> -        * Reinsert back the bad job here - now it's safe as
>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>> -        * bad job at this point - we parked (waited for) any in progress
>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>> -        * now until the scheduler thread is unparked.
>> -        */
>> -       if (bad && bad->sched == sched)
>> -               /*
>> -                * Add at the head of the queue to reflect it was the earliest
>> -                * job extracted.
>> -                */
>> -               list_add(&bad->list, &sched->pending_list);
>> -
>>          /*
>>           * Iterate the job list from later to  earlier one and either deactive
>>           * their HW callbacks or remove them from pending list if they already
>> --
>> 2.25.1
>>
