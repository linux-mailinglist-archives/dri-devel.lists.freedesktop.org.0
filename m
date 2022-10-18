Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20352602BD6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 14:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DEE10E201;
	Tue, 18 Oct 2022 12:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9435510E201
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 12:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABVas38FGpXpHsqjMvK0FVJYOhkaokCJyBL/uwVVZ76rWSDlOYlZxaJ6aS8k16WBN6cne3vHe4b54dutPL57grKbNe062xB/PRBuOKwun3M+hrrWT46YO3srj9yvh80HeHBWcVya2Zc5Grww+9QEUjyUnu9rfT1iOlM64p5jt9UX4bZw1r7hcg937oPjGWQ9M+cGt/vLzVKv8tdGcvrCNyiNO43MwPbGVs1XlhnnuXa0WyACGGdBWTJPLxhdu1p9olJ7aCw+LpvOxAdGJkQ5m9pAu/PhwbLVc8/b/Wdz0d0WUc+09L8xWUgJluXq2ieCLFa7FiQMAMKGKMDCrZCL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cXmm6N837j6IMNW2yNh22j+A5+qig4zbrmQn1OINLs=;
 b=KSshIbsfbu/CSIGcs9+BSm8YAbKhFJrQnmf+j/xNVjSs9iNcsDaW20tmlmLfLD2xbS8yaTHmzDWofSxvquoC5ElLae/ox5LUH3GwuRC92KqPcbgl4dbTS3L/24xhPGVvR//ZTtE5uPmXRCD2Q9UOUJPpJapwiY+o7aI769VPJduk9j0gayiTjsgTrieCxZhNY0q08dukmCA9A9pwCmEqiyOmulv6MwTNPr9K5Pj4MHCm5UpqhXdo2cl9ZSpe/NdesMinPFAMsY0Q0ePqoIncYIiL/GLk3wbPmvB2IC842i8HC8e0P4rWMp9f3y0jS/LYUko1+W00YktijQZ8ykC9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cXmm6N837j6IMNW2yNh22j+A5+qig4zbrmQn1OINLs=;
 b=2lcWSVjyooxKYbKyT1QyEMuSSoMUrWjHPI1j7N+SktH43iPtKgySfuefGQzWwT22FhlTX+dDaXcoARpmDYeydB/4ycZ1tix89CBYB11AwHpD9Yz5ovPQOp2AIp09BgOGlItet3c3y2eERwEPYfCzXruRwReKz3dfbcbBkccRl18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 12:35:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 12:35:02 +0000
Message-ID: <30927f4b-c7d7-1b03-2b9d-a9d6c362de23@amd.com>
Date: Tue, 18 Oct 2022 14:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 andrey.grodzovsky@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, steven.price@arm.com
References: <20221017143006.2419-1-Arvind.Yadav@amd.com>
 <f03c1b59-e024-40d8-5fee-02d8d660a058@amd.com>
 <32e4b5d7-940d-cc46-69e5-74f42baed160@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <32e4b5d7-940d-cc46-69e5-74f42baed160@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b84cf5-7dd2-44b2-e721-08dab1052d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7orsgO+jyBim+yTkLRv6A/mKtOzsh5W1RLwUV88CVOwKhvJjWEQob3EuFkrE+I6tgp2TjL59ZxyRZedAnrZVX1ONuMZKpnqdSwCZNKoAhpZABG7ZHwF4bK+1GL1dxVMHXkB3DXa+1oJvxORX6VQfubEZ9W0sHIHetKPgu2sX4Y7F7llVpxyw7vTV7q4e189IgYvbTFrV5slSAyUI+Awxt5XrpLE/W9eTBcYLUcJq20BO8RGC9uCmAUe2jrMPXA1CCaUvhqcGTdG6cXEe/vP46fld+ypS27QZ9gMsoHjxXW+wDGbTZB1LnYqj8oxXwrXj+1N47vIFXoEayow56KwHUKE9C7or49zeMHxXf56/KMln4EQutVrTt3IX7mDxkQIp10KNiggOKsschqPkcO+LyTD6dr5xSMR3AjPZ5vfzSTpG52NXSwCgD1PtO1q9oKReYkSJqhdyRgG9hfx/i8bYZaLmqQh2sse7bw2EC0wQLABf0nm4jdvD9Z/2gPXD2Mu4wTcEmvouDKMVbTeYDKJrYGTaAON15D8y5OBEQ8Kbz8cKeF23DdE8SzVKC0f6RnJaBcUkrqcpi4Vv3gai4jLf5vl9MwXxxNFsHU7rWjsrqeqWgBbx2/J1Zu5mmappVZTEcLXQPXiJX0mF79ydU9F++eqVYy0h0VooIgRvdzwANaS2X3uDPyDiKgSMOBruw0JoyIhKw4z4lUHzDXw1w7EmI38NN78d4DwjrpbjdG2dksvdzuft1QsZncnZojQLNhC7mP/T1vElQ8EiPQsOa4M+Ytb4ULYBMh/LahF3wtKcDGJfONgBTkbA/rKbXTstLvR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(5660300002)(921005)(36756003)(6486002)(6506007)(66946007)(66556008)(66476007)(6666004)(31696002)(8676002)(8936002)(41300700001)(86362001)(6512007)(83380400001)(478600001)(110136005)(31686004)(2616005)(38100700002)(316002)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGovMXhIOGozT2VYakt3ZWJJZG4yWXNEN2NmTmVqTmt1YnJrYjJDeG9RSU43?=
 =?utf-8?B?YUtxdEI1RVBhVEhXMmdGTXRvSC9ZRlhiQW5CZXg2RXdhc3lpc1NmTjJ3Mitm?=
 =?utf-8?B?MFJBcDE4WXZDNU96ZFVLbEZRdWpuMHR5ekhYTkZkVDJhTDduMzhTcGR0dFZm?=
 =?utf-8?B?cm1oUkNCY0Z6TnNTM0IxTUZrYllhTHRucGlTK1ZDY1RTSEdWRVRHV2F4ZFIw?=
 =?utf-8?B?RDJjcUo0RUU1MlJScHlPTjJTY3lGVTVDaGZERW5MWGc3Sk1tRkxLek1WTFk1?=
 =?utf-8?B?QmhZZnZ2Ris3SXpkdkNoQlplUkZaLyt6Q1lzSEhxNXkwY0NucW16TVVzQlNm?=
 =?utf-8?B?RHI3M1FEZzg5VHZUYmZKNjB0eHJTcThXTkg2V2VKOVhDVmViU2E1WGNmS01L?=
 =?utf-8?B?VFdacHN4YStWSVNGcGR1ODhma2xDeTJ1VnFCSGhZZUk5dlF2cWxjZFBtNUQr?=
 =?utf-8?B?a21MQlRFOWdVcG1naDN4a3hlNTZZTVlpTFF1NWpXUHlDeGNLZmVJaExabnlx?=
 =?utf-8?B?alhSeldqcFQxemNkWmJUZ0ptbWNXUGlYcHRPc1NOcHFWM0hBLzN2Y2JudlJ1?=
 =?utf-8?B?WEFWMWYvMjJtWFhkVysxaDlkSFE5eDBJZzVZeTRBbDh1MmFMei9uaTJqUFk3?=
 =?utf-8?B?N05vcDNoeUo2d1Rzb0NsOVlXQmpLVXVaN1hWOFp5Y0VINk5nbzFIQWdlcnll?=
 =?utf-8?B?SUEyY0k5QktmT2d4V0dnbnEvTk13MFhwSzFHbzdhUkFEczNBWEZ4SDd4bFNH?=
 =?utf-8?B?TldvS05Ua3pMSW5DTElpa1VHcll1bmtiS0lvQnIwRnVocFdXUGRFSG9zK3Vv?=
 =?utf-8?B?RlM5cHVmamxDVlc1cm10c3RwNCt1WEhzb1d6ODlWWkF5R0JXM0tPVmRiU0RY?=
 =?utf-8?B?eHRGTFdyZk9NNzlZanB3djZnc2oxd2hIMTFQd0VrR1Qybkg5QThQa1E0S0o3?=
 =?utf-8?B?RjhJQVR4YTI3TGVKblJhUFlWWDhwZUtuTnh4c3lxelBYc0Vuc3ZQZXZkcHNp?=
 =?utf-8?B?MFhWcnBBWDdpYzczK2wvOEtocHVMTEgycHdsS1phOHo5aDBmRC9vZlMwVWw5?=
 =?utf-8?B?VXR6enRBaTAzcUZSV05ST3NlbklEcCtYT2dVSzdTVzdmUmRqVm9GNDJGMnZv?=
 =?utf-8?B?aGR5a2s0dnJhSHZJUy9VajFFdWdpZ2FwcGQ0RHNMSnZab0hISndmR2J2dnJm?=
 =?utf-8?B?YVRHK242S2JXTVVHZzUwSGNOeUFneGw4NXBQQ1pBVEtucG1TRmhRcUQxKzg4?=
 =?utf-8?B?MTNBZy9nSUc3T0lMTUxJbzQ3TlYvaEI1MzliTUo3ZzUzdHQwOEdsQzdVS1RM?=
 =?utf-8?B?ZTFoK2JqSVViRXBBLzNCZS9vcFBRRSt1NC9YUWNtb2RvNDhyanR6RVJySDVi?=
 =?utf-8?B?TkJkRU9wbFFiWTFGM1R4NVh2N0s5QW1aa3lUVllZc0p0OXlGdG9ERVJoVVFv?=
 =?utf-8?B?Um1qd1hqTW55dms1d2VmMFJTNEdyNGtkeGVodFpFVzhDbklJcW03Unc1M09N?=
 =?utf-8?B?TWI4azc0Vmh6ZTNkdDc3UzVydTd5R0lWZTBIbHoyNFVSODh2MlhicHVPSkVu?=
 =?utf-8?B?ZkplME0vQ1RGTXcrS0FUMGRqV0NMbnRvQXZZc2lRZzBEVGFJT3NVRW5aS082?=
 =?utf-8?B?NEc1cEU0UU1naGc2Z2JhemxmT1lIS3pLcDFxUi93ekFGT1FoWGMveDRmS2JE?=
 =?utf-8?B?Z00wWWVNempMTlRDQ3JPanMwdnJPUjBMbEtrSUYrdld3NkRzZitxLzVwWi93?=
 =?utf-8?B?dXoyWFNONHhMT1k4TnVzeG5ZdVlPRFlGMkN5RVh3czRHSTBDR2ZiL0ViVE5W?=
 =?utf-8?B?L1ZFV2pJVlJXU3Yzb0tkR01RT3FLVGFwakh0TENtQkg4a1JaUXhnL0VMY2JT?=
 =?utf-8?B?S055YWJndGxvbFAvMFBGdXFuQXd3WWEyVWdNRTFPYTF3ODJJMWlCcXFXL3gr?=
 =?utf-8?B?SXVqWGdRaERKQ1E5L21XYi9kTUM4Um5tNng0ekNXMi8yRENCNEh1UjlEWTVr?=
 =?utf-8?B?bmVoNU1LWE1wbENxYU5DM3BPUGtVajliV0F6TXVtSU4wejlUNjdlOVdCbEpr?=
 =?utf-8?B?WXhXa1RTcGtZZTBVRVBOL3BBUDRuTXNBa2dxdVprU2VFNWErQzRKWjFobnl0?=
 =?utf-8?B?cVBSelNPRHRtZ0FmUlJqZnRreEt5Zjd4TjErUmRmdXl2d3NZQTM5YkxCQjRU?=
 =?utf-8?Q?Zx/duSb6MoCSMWZmk6MZQ0KDJIHkCA294M8h877hmVgK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b84cf5-7dd2-44b2-e721-08dab1052d20
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 12:35:01.8617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGWXp615lB0AfHASkSsJdrUFuAb9GI4KYzDugmrYekAuivAR4AuCfqlL2VdftUFL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457
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


Am 18.10.22 um 14:20 schrieb Yadav, Arvind:
> [SNIP]
>>
>>> +    drm_sched_fence_finished(s_fence);
>>> +    dma_fence_put(&s_fence->finished);
>>> +    wake_up_interruptible(&sched->wake_up_worker);
>>> +}
>>> +
>>> +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
>>> +                  struct drm_sched_fence *s_fence)
>>> +{
>>> +    return dma_fence_add_callback(fence, &s_fence->cb,
>>> +                      drm_sched_job_done_cb);
>>> +}
>>> +
>>> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence *s_fence)
>>> +{
>>> +    return dma_fence_remove_callback(s_fence->parent,
>>> +                     &s_fence->cb);
>>> +}
>>
>> Do we really need separate functions for that?
>>
> We can use  'drm_sched_fence_set_parent' but we need to add extra NULL 
> check before
>
> adding in the callback otherwise add-callback will throw the warning 
> message every time.
>
> If I add NULL check then will never get any callback warning message 
> for setting NULL parent fence.
>
> So I have kept separate functions.

I rather prefer having a single function and allowing the parent fence 
to be set to NULL.

Alternatively we could have a drm_sched_fence_set_parent() and 
drm_sched_fence_clear_parent() function if you really think it's cleaner 
that way.

>>> atomic_dec(&sched->hw_rq_count);
>>> @@ -576,15 +562,14 @@ void drm_sched_start(struct drm_gpu_scheduler 
>>> *sched, bool full_recovery)
>>>               continue;
>>>             if (fence) {
>>> -            r = dma_fence_add_callback(fence, &s_job->cb,
>>> -                           drm_sched_job_done_cb);
>>> +            r = drm_sched_fence_add_parent_cb(fence, s_job->s_fence);
>>>               if (r == -ENOENT)
>>> -                drm_sched_job_done(s_job);
>>> +                drm_sched_job_done(s_job->s_fence);
>>>               else if (r)
>>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>>> failed (%d)\n",
>>
>> Completely nuke that here. All of this should be done in the single 
>> drm_sched_fence_set_parent() function.
>>
>> And an error message is completely superfluous. We just need to 
>> handle the case that the callback can't be installed because the 
>> fence is already signaled.
>>
> I will do the changes as per your review comments, Thank you for the 
> review.

Just to clarify, you should nuke the error message. Error handling is 
rather pointless here.

Thanks,
Christian.

>
> Thanks,
>
> ~Arvind
>
>> Regards,
>> Christian.
>>
>>>                         r);
>>>           } else
>>> -            drm_sched_job_done(s_job);
>>> +            drm_sched_job_done(s_job->s_fence);
>>>       }
>>>         if (full_recovery) {
>>> @@ -1049,14 +1034,9 @@ static int drm_sched_main(void *param)
>>>           drm_sched_fence_scheduled(s_fence);
>>>             if (!IS_ERR_OR_NULL(fence)) {
>>> -            s_fence->parent = dma_fence_get(fence);
>>> -            /* Drop for original kref_init of the fence */
>>> -            dma_fence_put(fence);
>>> -
>>> -            r = dma_fence_add_callback(fence, &sched_job->cb,
>>> -                           drm_sched_job_done_cb);
>>> +            r = drm_sched_fence_set_parent(fence, s_fence);
>>>               if (r == -ENOENT)
>>> -                drm_sched_job_done(sched_job);
>>> +                drm_sched_job_done(s_fence);
>>>               else if (r)
>>>                   DRM_DEV_ERROR(sched->dev, "fence add callback 
>>> failed (%d)\n",
>>>                         r);
>>> @@ -1064,7 +1044,7 @@ static int drm_sched_main(void *param)
>>>               if (IS_ERR(fence))
>>> dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>>>   -            drm_sched_job_done(sched_job);
>>> +            drm_sched_job_done(s_fence);
>>>           }
>>>             wake_up(&sched->job_scheduled);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 1f7d9dd1a444..7258e2fa195f 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -281,6 +281,10 @@ struct drm_sched_fence {
>>>            * @owner: job owner for debugging
>>>            */
>>>       void                *owner;
>>> +    /**
>>> +     * @cb: callback
>>> +     */
>>> +    struct dma_fence_cb cb;
>>>   };
>>>     struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>> @@ -300,7 +304,6 @@ struct drm_sched_fence 
>>> *to_drm_sched_fence(struct dma_fence *f);
>>>    *         be scheduled further.
>>>    * @s_priority: the priority of the job.
>>>    * @entity: the entity to which this job belongs.
>>> - * @cb: the callback for the parent fence in s_fence.
>>>    *
>>>    * A job is created by the driver using drm_sched_job_init(), and
>>>    * should call drm_sched_entity_push_job() once it wants the 
>>> scheduler
>>> @@ -325,7 +328,6 @@ struct drm_sched_job {
>>>       atomic_t            karma;
>>>       enum drm_sched_priority        s_priority;
>>>       struct drm_sched_entity         *entity;
>>> -    struct dma_fence_cb        cb;
>>>       /**
>>>        * @dependencies:
>>>        *
>>> @@ -559,6 +561,12 @@ void drm_sched_fence_free(struct 
>>> drm_sched_fence *fence);
>>>   void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>   void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>   +int drm_sched_fence_add_parent_cb(struct dma_fence *fence,
>>> +                  struct drm_sched_fence *s_fence);
>>> +bool drm_sched_fence_remove_parent_cb(struct drm_sched_fence 
>>> *s_fence);
>>> +int drm_sched_fence_set_parent(struct dma_fence *fence,
>>> +                   struct drm_sched_fence *s_fence);
>>> +
>>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>>> *sched);
>>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>>                           unsigned long remaining);
>>

