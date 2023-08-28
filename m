Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092F78A56D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 07:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8012B10E107;
	Mon, 28 Aug 2023 05:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BA310E107
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 05:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHHqd84MmclxzsOioAZaKL3le/dV8O37ex5VJ3imvFwdd0htq4x9ZVhG8mCDlFdPvUfP1fwT0KYat4rOnJK5pPTmtF1ikHYshH6f4EaDtg2W/H3wcacULXxCKt8LgZlXC9UstfxwSa/Q/lLQ9FRBS41hqVZYGEy3lWhQjNI8+z/nQwH997JN/PdXKYgEO6JO3dM2BYz/ntp1J/psIb0gqECzONyucrFxpuctliqTHAiyGcqXhuuqoZfnPcSfNIlkDzwpislzc1WUU1XE+qr91mcnDDUT8+gudo+tvl67LgjzQVp4EpeACrTCD7VJ6tyJGfxKBbZjAp0uOJRru9YHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHN8+OjQMk3jl/guE/GK5p/E93q3CRsBtEGpayG1VW4=;
 b=Ukx/SdcYF2pSQgh6FwRAWm7AtlOWFc6llspqxJN9xnjfFevlyR0v1CV4KPVFnQn4jCNDnjQGyMCo8tGVeszvTRGtY7O/nECnev2dgnw3M55BDs5mPcMuC426rteItkADz+WLXZRll8WGg3ZDDCKmBLwSjAz5OBvVibXduIqckOAWNNw8xjvHQ7wLES8YzZGtbDkWSmgebX3IY1XR0zFqDQ6Bh3Zzs33CYgebuaNIKKe3+3pIuAyb7nuCuM0QIp+nRcmNJUP7isRDf99PfW4sVPnBMDvD6YP6aKEgOhqXZxsjX8EnzjtvS/u2rg7UYMVZJyQfsQtSOQwBRo9UqYGe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHN8+OjQMk3jl/guE/GK5p/E93q3CRsBtEGpayG1VW4=;
 b=M0XcT3RZ++OSPd1B02xEBcnDXyICUlSvDu3a3QPf1xTKebxKldb59FOEDf3K+0ksloSH05I3L94/PfHAd8YuDPKQxEN7J5syyRW+ilN63dtvClKuriRHYwsg8W+jq5nYTKThwvBzjFnRZRfhmZqUJQHS1RwAwUQTvV4V6dRUDSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 05:56:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 05:56:52 +0000
Message-ID: <7cc6172e-b068-341c-f4b0-e6a8d1b968e7@amd.com>
Date: Mon, 28 Aug 2023 07:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] [PATCH v2] dma-buf/sw_sync: Avoid recursive lock
 during fence signal
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230818145939.39697-1-robdclark@gmail.com>
 <a05e0c2e-fd62-4a8e-9fa4-dffaf86f7730@gmail.com>
 <CAF6AEGs+6cveKbv=onEJSZJERk8m56YJzza6A2+eLd3+6MuWMg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGs+6cveKbv=onEJSZJERk8m56YJzza6A2+eLd3+6MuWMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: bb498fa0-fb9e-4c2f-e6d5-08dba78b9393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqTnKf2iMup8Af8bdohE8pzGYPZFKfOxjGwsMnxoQfu/8a7XKDEwFQ15wvOapRdzff8sSPVk+uD6J/0Gu3z79l8hFB571cmGj8msBOasLvAqwL1eoPs5xedxXBKzpPhjVA+0UDbwwkszqQO1dLAhuiqBnLL6AZqPZ5bYdVkNFLmdnYVCa9tT/jc2Q7ipN/DB9KldODQoXHbBNztnTGAP8f+kEtn9qWY2SC/uLbSQx802OOhQCPZAPRhPsihs9/k8FE+FkPYTDQ61iLwHBr9AEUIOR/MWSP+8b6EdMHRBeir3mWPMMqO43Rvry/YBUkKoqrBf5iYbwiFLvbW29CO7dwu7KCsqKaYiham4essIN4DZ6M90mpXaj4rzq1L7cPlBY3+zlExVPwVny7FctA6xsABdhVN/mWQ0YW+UKs/Gmrl2JZFG0nXick8vbt8xqBt3eFJXNJBfEbuYaRQVUSKO7W6IuWDjuT6/iUwMysbUw1edU6G5lsgdhk0JnvIrssEDff3iJ/ISmW5eGoxVoOfwfZ+gv1+3En3eVj9yYIwAefJa4ZqIfDGs9pb8FcEydKfIS7VEOKwMEpYvnNJqGlFzhL7KNqOyv68xdQI3/ztkHSadEQTHP19v9ZFqJ4GZmUw5bWkl7v1mcMfacRfA+AhDAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(186009)(1800799009)(451199024)(31686004)(6506007)(6486002)(6512007)(6666004)(36756003)(86362001)(38100700002)(31696002)(2616005)(2906002)(26005)(53546011)(966005)(478600001)(83380400001)(41300700001)(66556008)(110136005)(66946007)(4326008)(66574015)(8936002)(5660300002)(8676002)(7416002)(54906003)(316002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZ6YXFlR09oTi9YME9GbE5DbHhBVWx6V0dpUytYZTcvM1BaWU9lU2lhYk8r?=
 =?utf-8?B?aldqMmR4eVNUNmsvRlhOaFJZeGFicjY5ekhEZVNkQTN5L3MzUlBGZnM5RTlr?=
 =?utf-8?B?WGR6L1dEa2hnbWdxUWhjR0hFTk10MWQweTBnWlFPdWM1OStHWlc3aThNM0Rt?=
 =?utf-8?B?ZnZmWGFYQTJ2QTJMQWYzVHNWeVBsQ25KTGZvNTdCUVlMcEFIWXhKc1V0MzJK?=
 =?utf-8?B?cmpCVHZmSk5FNUtLQks4ZFdDMHpkKzZvelpmZnZ5Q1FIUzQ2VWNNazlsK1RR?=
 =?utf-8?B?RW45aTZ4Z3U3OEcveXd2M2d2cHhyVy9jYy90Qi9QcjlVRndzMFBCYkxRQjV0?=
 =?utf-8?B?eEJKUWcycUhwc0hwQ0ZrV1VDVEF4WXhWZ0hiUFdxSzZtd3BOTXMvZ0JPVnZk?=
 =?utf-8?B?QmdoamVjTFB0Q0JwSVZUWEgrUHF1TnhOVWU1TGJLd2s1djc4R0l4ZFZrZjdr?=
 =?utf-8?B?NTMrOWhJQ2xPNGZ2d0hXbG1lUkxiVTlyVHozU2J0OEFXL01uVWNQWkZzbTBT?=
 =?utf-8?B?ZEM2OHRPdE5lSGsrZFNVREZZU1J2R0lMVFpDN0VVQzQ1RG5GNitrL2VOVnQ4?=
 =?utf-8?B?bDd1UnJqMFFiMWxUSTYzUzdSeVIzQ1FRWW43V1hsL0I1Yk84MS9SbzhDQzNq?=
 =?utf-8?B?WXMxMFdZNFNKc2Mzem40UitQNTFZN2RhSWhnbXBIMXppZ2ZVRVpaQWpsSGk3?=
 =?utf-8?B?OXlTTENIdnc5RTljckdrUmw5S01ISHA3VFp5QUozRmdVSzE5Q1F5dW5venJs?=
 =?utf-8?B?Z3k1bnBUcFo2dzduSktCNTkwRGQ3RHNEaVVsMDlhMDQxRXMxL3hEUkMrSFV2?=
 =?utf-8?B?QzRrckpVRE0zWWNEMGMvSWJScGxYMHdsWXQybUJrNHhRZStVMDQveWpoSHMr?=
 =?utf-8?B?L0RWTGExSXhjSlBiNExGRDVtdklIaWZ6eGRqL0IvOVNHWklPK1pyY1g4cjRj?=
 =?utf-8?B?c0tWUjZNMHY0MnplekgxMmdXUi9KYWZBN0dhMnN4ajV4TGFNMHBUdUU1YVRi?=
 =?utf-8?B?Z0VIS0p0dUp5YUwxYmdxTDlhTjJjRmVQMDl2d2cxNCtSaklkMkcvdzhZWitO?=
 =?utf-8?B?dXJETlJOV3dFU2tWZ2VMeE5JZjdxOFR6aFNKckp1Rm5HZUZ6YVdTOFNCcnJs?=
 =?utf-8?B?ZnBEblgvTVVocE9hZVhnb2tFR00xUWs0YlpsZWxwOCszS0wrMHpoakVrRG1w?=
 =?utf-8?B?UFdKMnVnYkhFeFZodmozbGpBcFd6dXdsZ2JKUVRlaExXMW45RU9ZVStQL0kr?=
 =?utf-8?B?SHZpRExVSUh6Uml3VjRsUVcxaFlrNThFMENBQk9IVFQwa3FLRG1YYjJlV3A4?=
 =?utf-8?B?bk4rQThDRjNuRU5rTDJNK0Z6QzY2cE5DZXR1MXVFWmdGcXlVdzRhck1xWnBo?=
 =?utf-8?B?WVgrd2w3WHVhaGxxMkZCKzVEamNIbkNyeEVjaFVHeS9HMDVrWTZLcGU0THVC?=
 =?utf-8?B?SWlrSlY3aHdHUU9zTkl4ZGh5QkxjT1EyTlhsVjRmaEQ4c0tmV2E5cjF4Nm5w?=
 =?utf-8?B?S1VnUnNsSDBaQTkvMnVmR0d4cUJ0c3hHM1QvMm5BaVhZdW1Nc0RFcURwZ3Nt?=
 =?utf-8?B?dnlrQjMwYXFpdFVIU2kxNzBzYXVkTVZTaVMyTkZrQ1pIZHRsQ2piNmZISzJz?=
 =?utf-8?B?QW4xaFRnWEFwbzd6aXlQMWZvWVJLL1BXLzZsdmNXVUNRdVU1dlMzQy85UEpj?=
 =?utf-8?B?aDYxUUN0WW1GWWw1K3hlOWFNUnRmNWRKWVh3VzZyZTF3REExKytBMnpTNUNF?=
 =?utf-8?B?OWMwTTBDcWN3WHVxNnBXSkJCM0JBTjJ3QkxEdjAvTURYL3NLcU9ESEpsc3lQ?=
 =?utf-8?B?VFZYQ3NKSmd0dktRSGNhTW0wSjFIT2ZsMUZVbWt6UHk5ZmJuU1hTQU0wVkxM?=
 =?utf-8?B?MUljMTZLUWJPbmQzRDZuUzRNZ05yaHdBZy9BdW1NdDdjaVJnOVd0NXl0Qnhm?=
 =?utf-8?B?KzN6WG1sWTJFN2RJYzliUTd0ekpaNFRpbEM3T01ROVBrRGJUUk1lYzdRNjVk?=
 =?utf-8?B?ZEp5dGJlVzFLMHZyUjVzS200enpDdXFFQ2ZobHBERjYwbGl5ditzeGtEd2pM?=
 =?utf-8?B?Y1dxZVNVOEwxbXlCODZVNk9INWlVSEJjdzRhYzNHZXE0dS9DZmF5SjdLMTRO?=
 =?utf-8?Q?ohsSAafCge20o1q6zEBK44BEG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb498fa0-fb9e-4c2f-e6d5-08dba78b9393
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 05:56:52.3973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vj0wd6KvvG/TfDm+7tsBpMcNYgpWbbLKjAevrUCOXotNcbF0sIT/vNVxou5JnUO+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.08.23 um 19:15 schrieb Rob Clark:
> On Tue, Aug 22, 2023 at 6:01 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 18.08.23 um 16:59 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> If a signal callback releases the sw_sync fence, that will trigger a
>>> deadlock as the timeline_fence_release recurses onto the fence->lock
>>> (used both for signaling and the the timeline tree).
>>>
>>> To avoid that, temporarily hold an extra reference to the signalled
>>> fences until after we drop the lock.
>>>
>>> (This is an alternative implementation of https://patchwork.kernel.org/patch/11664717/
>>> which avoids some potential UAF issues with the original patch.)
>>>
>>> v2: Remove now obsolete comment, use list_move_tail() and
>>>       list_del_init()
>>>
>>> Reported-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> Fixes: d3c6dd1fb30d ("dma-buf/sw_sync: Synchronize signal vs syncpt free")
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thanks, any chance you could take this via drm-misc?

I've already pushed this quite a while ago.

At the moment I have problem answering because AMD has a new security 
policy which makes it impossible to push patches and access mails at the 
same time.

We are working with our IT to get this fixed, but at the moment its 
eating my time.

Sorry for the delay,
Christian.

>
> BR,
> -R
>
>>> ---
>>>    drivers/dma-buf/sw_sync.c | 18 +++++++++---------
>>>    1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
>>> index 63f0aeb66db6..f0a35277fd84 100644
>>> --- a/drivers/dma-buf/sw_sync.c
>>> +++ b/drivers/dma-buf/sw_sync.c
>>> @@ -191,6 +191,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
>>>     */
>>>    static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>>>    {
>>> +     LIST_HEAD(signalled);
>>>        struct sync_pt *pt, *next;
>>>
>>>        trace_sync_timeline(obj);
>>> @@ -203,21 +204,20 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
>>>                if (!timeline_fence_signaled(&pt->base))
>>>                        break;
>>>
>>> -             list_del_init(&pt->link);
>>> +             dma_fence_get(&pt->base);
>>> +
>>> +             list_move_tail(&pt->link, &signalled);
>>>                rb_erase(&pt->node, &obj->pt_tree);
>>>
>>> -             /*
>>> -              * A signal callback may release the last reference to this
>>> -              * fence, causing it to be freed. That operation has to be
>>> -              * last to avoid a use after free inside this loop, and must
>>> -              * be after we remove the fence from the timeline in order to
>>> -              * prevent deadlocking on timeline->lock inside
>>> -              * timeline_fence_release().
>>> -              */
>>>                dma_fence_signal_locked(&pt->base);
>>>        }
>>>
>>>        spin_unlock_irq(&obj->lock);
>>> +
>>> +     list_for_each_entry_safe(pt, next, &signalled, link) {
>>> +             list_del_init(&pt->link);
>>> +             dma_fence_put(&pt->base);
>>> +     }
>>>    }
>>>
>>>    /**

