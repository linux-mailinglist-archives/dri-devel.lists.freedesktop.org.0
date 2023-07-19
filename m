Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E1759917
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A44910E4BD;
	Wed, 19 Jul 2023 15:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24F310E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QElzvbQvjAZAtJWMcrUP+d8GdJqxMMnqwRPyz7HkYXTzqNXo6PZcV7zuqckJergyOiE3nV51TZakJYl8+OFqFMtR5bu8j5TobwZVXED3Oe0+0g7UnZJs50oRQzAVvG7nP3rqqjLTVo0l1kQUammEAuC3I4xrdlKq37NLZzglzuTUh9zaBQPyKH41NPmoIe+AnXoVgRM5Z2rHub/zWysgymnYQZhTwOJrhBPFrsnsXXdCwvtMHJ4NeeMjzpZ9UCd6MwS+HthikXEoSoJ+z3HuplqxN0SrhyePS4dIwWYtANcf5/8UiyxM/mqPKhg582O2VGhqzOgEt95Fepc/XEzUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11/EJwQWwEu9jZHMNSsin6aC0LZSbTvCxydfEzv5j28=;
 b=nBODsSKxt3iTNh2Eyd4DoMGoXR1jFIcAU/X9n91QqUuU/O5s2t2QKCGxF5rRQ4yblvk5yz6zCp5/qm5nOiXfqQAqI/Mkr/fm16TiSiWxduf8pNHQRwvkhUEQyW/RmwHUDbUDRc23oXaNjHGYewseouSEC2rENqo/pXFExm0OeuaJO/fSiAWrGX9aZQyLsDrpTD+MA2X/lgperCot0Lk7TBL23DYdqfcBk5sKnH0lSO8otHbMkHGNa++6BMmts4LZPnO/5e35oXwn2IxHsvFk/QLRD0AjijmBUlcV2QFmvjTTdC4M/m5CP/vAtdusCIaW8QlsXcjY5wIxZ4rM3AwmpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11/EJwQWwEu9jZHMNSsin6aC0LZSbTvCxydfEzv5j28=;
 b=grE9ZALcvc1Z+INgdids6WXHj6HQjjvaiq1GPbowQNzHf2pkfyUZaWvS7IwM6JtnN79uXdZ+iWKdndjOF2ELjhY/gzIfinP4RQRk0wLJp1TRN3upXIqQ8SnxL/aCh9Egze2RLjR/p4moDiIJR7YIh6fN0khPBwxB2sQnw2ajimU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Wed, 19 Jul 2023 15:05:43 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:05:43 +0000
Message-ID: <849577a8-feab-d876-c0fa-4c752ed37b78@amd.com>
Date: Wed, 19 Jul 2023 11:05:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <66943763-0c30-9603-2a4c-7603ab5ece27@amd.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <66943763-0c30-9603-2a4c-7603ab5ece27@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 7875f394-7b25-43ab-9f0d-08db88699f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qdb0Ojn+brSNyEDX9GPkE4KmdduNK3KXnHxP4PmZZMX193UNqTT0+ed5n+TC5ktazyHIAQTG4w4zgOnCrsbLpNfm0/LdcpqL8KATq6CX471Nx2t1SEic9qc+D8K4zUJpT0F8DAWDNun5lusHJlFk8nYH4Q8pjDEhKceLQM745RkJz/z/Or+YUiC+p7hlurIzDQ5C5UtWJOiu8c3rUpoTD6hZLjG4ASOdwpWHods2SPRErYW2rAqMcGqR+kuWqaM1j1eLEGpq+QHOplfUxyPiHGqjTbK9CbLY58eUuuTQ7Lmeg1ZOjPNmurPjL7cipXd/HXVaDdYtL5byTmTCuj7dTEf6zfzpVcCSTKzGqztnCYXkOSeLQYd2yp2OJT9UyOS6C8hvfhmOFD+leGthnGLgOKwsJ5oLPcoZd1TEWmq4Scv9BZrSDCedUNlgWNd5T9hztZk0j/4dul4JqukZQBFhXsN3yIYEw4JN9LGYpDWGB6qEguX/+RLkqUodmT3uqdYVTvimfG+oO2GPXwHS/hMHGKPWQ9PMtNQRbaPZ4SXLuqBgwRHcGGGsk8p8Azno5OWhXh3sVgHRmSsRe2J4wbZUDvUzunmayBXVt5ZfrhC+UBSIwx8ZPm5/Z3URsFSk/q4rbILVJR54fsDGmNC6mF53yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(7416002)(31686004)(31696002)(86362001)(30864003)(36756003)(2906002)(44832011)(66899021)(2616005)(186003)(66574015)(6512007)(83380400001)(6506007)(26005)(53546011)(38100700002)(6486002)(110136005)(6666004)(54906003)(66556008)(478600001)(316002)(66946007)(66476007)(5660300002)(4326008)(41300700001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tCR1ZEK2pEQVZITWNmYTB4SWhvOUdOTkhZM2hpNWRZTThReERnMWZUUUFy?=
 =?utf-8?B?SU9rMENUbjgrdHFtVndvcHlUZ2x5eDRDV2NLQnZqOUFIOUhDZEdmbzNJb283?=
 =?utf-8?B?M2Y2cWJMTS9JUXpEd3VGalZKUnR2bnlkdGl6MitqUXNiaFZldGd0VHh2ODlI?=
 =?utf-8?B?NHhlSWJFamcyNXdpYUx1bTNBb21YK01tTWZ3UDdqRTRteEp0dFYweVNmVmtN?=
 =?utf-8?B?VXZtcVdRMVhuL291b1Y2b2VOUXF6TDRRMUxsRElzWDg2N1RJcWlZV293YVNs?=
 =?utf-8?B?K2RLNmFEMXlvTisvSktiMEJqVUM1VElGZkdVK1NMK0cvTFN5RWVCdkNEaU5H?=
 =?utf-8?B?OS9DRFN1c09YbWVpd0tIMTlGNGRjVzI3Ylg2dTZDTXJJZTl5TTRhaWVBa1lH?=
 =?utf-8?B?Y3JMM0R4ZUI4TTJCQ3Z6UmRQc1FLZjFSRU9FY0lWTnpmS1JPdnhBOWdNdFZD?=
 =?utf-8?B?RXVPeUI1VlkvU1FSaE9OTS9EdnU3M0d3a3VFOXRrMUJ0Z2pzdXVMb3BjbFRV?=
 =?utf-8?B?T09XczJHK3c5TERubWRFYVdCcmllMDNvU1NhZlhDVHJySVphQ0xOdktXckRC?=
 =?utf-8?B?dWFtL2NCdGdzaWlIb1FOalNUbTVsanBVZTk2bUFuOGx3OUFMaEpGZHp5NHJp?=
 =?utf-8?B?b2IrMEVaVDN1d2w2UHBLYmZtdit3Tzd6cVp0ZDJFc2xoN3ZwT2lwUEpoZHB6?=
 =?utf-8?B?N25YZUN6Y1hLdEQ2Qkx2MDhGZkxLUFo5Qno4M2E5UVlzRURXWThkUUpRQkFh?=
 =?utf-8?B?cjE1dW9ZN29TczA0UG1ITGJBL1RJWXpINVVJbXplWUMvS21zaDRoUWVBNEtX?=
 =?utf-8?B?UnF0S3NpdEkwNDd0VjkvajU0WWhrbksxSUtreTRWcUxuOEVwUHRmUzdlTWVy?=
 =?utf-8?B?eVp1ZXVaT09rZmMvNlNUSDNQdk43VHdvbys3dUpBSUZLbUVzNktVN2xRWWxI?=
 =?utf-8?B?amNjNFlqZ2NXZWN6MTVVSlNuMlR4Nk1sc3VLUHRsQnNINDJtcTA4OHczclVX?=
 =?utf-8?B?VmpDYWhqMkxuKzRzUmdtbUpwOUhWdVF0T3UzS3E5VmpHKzQzWW9oQUVFb0g2?=
 =?utf-8?B?RjBoL09yUWZ0YStYWTc5QjhXODNiZmN2SXV5aUdIRStLQUs2RVFMYVVQK0xz?=
 =?utf-8?B?Y1JtM2xPb2diQ0RlTUp0V2hCV2Ztd3V3WjkrZnBhT2pQSE9kdmFLbWhzaFg0?=
 =?utf-8?B?ckR3WFc2UThTTjBJMGVUcVBtSVlXeTljM1hmUVNGeXJvYktKSC91blJIYTBk?=
 =?utf-8?B?eXFUSEFBS3Q5RGJLVVdJU2V3NjluVEM2M2J2Q2M0MXoxNitRdFpSTFRrWjB5?=
 =?utf-8?B?d0FoU3EraWkrSEgzQ2xuVUgwNWFac1ZvZ0NnL3ROUHI4U0VIeitxS2dwclFM?=
 =?utf-8?B?bnJiNzUyS1hXamd5Kzc4SWdvZVI3UjUwT3Z2SW5kWE80aE1XeURrZmttbzFi?=
 =?utf-8?B?WmNZNzBDQnNxdE5TdXcvMnVxeFUwRm56RVVEcmpQaDlMYnJiSUJydGhZOWhE?=
 =?utf-8?B?S1lVWXp2WEpFUnJYSWdacFlKZHpMZW1jWWJDcWlQRHlycy9HaTFzRWFMdEFo?=
 =?utf-8?B?Z0oxaldvN3hpWEpPWlVKRjV1OGhLSkd5QjNTU0J2V2pZankzRlRMc0VkMkpq?=
 =?utf-8?B?bk9rV1I4eGhPQTdkTkxDTCtkYzhLQlBKdzZTM2VSMEt5V0gyd2phUW42THUy?=
 =?utf-8?B?VXFaWG9LQmVmL0ZEYTlHakhUaXIyNlJGZmpHcTZOUkhKUE1yQTdZdUlYV2hH?=
 =?utf-8?B?WStsRDZHMEtoUVYvK2tQVnpBeVI3dzBjOEhYUUJyMU5Qa2IzTlFkaFB3Z3F5?=
 =?utf-8?B?Vmc2eklJaFU4TTZXQVlMSW1FaURuamhUYTZjV250cUFXeXlncU9USEIvaStv?=
 =?utf-8?B?WkhnS1hxUnU4RXpoUDh1Qi9JZmpORml3c010THYwZnUxbGlKMkVySlY3TFAr?=
 =?utf-8?B?MGJURXlZMWZudDJ3VFhMS3ZPM1lxQ1dUT29BajNNbVJKMUZBemVoMHhPaVZt?=
 =?utf-8?B?VFlzWUVQREUyaC9EREtzSy9TZlZ2ZWJMY2pYZjZwY3FnZzIxdTYwKzVVQjZl?=
 =?utf-8?B?RGIyWUtzQlQ1eUdxL2EwLzIwVlpaTlo4Qmo0RE45YXl4ZmR2aWFJYzJyRnMw?=
 =?utf-8?Q?HTpbfeZL0gU/DmCzeypZdKIOI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7875f394-7b25-43ab-9f0d-08db88699f82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:05:43.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Pcm80UUScR4rsLhlkvi3Xs1sxajzKcJu/TNmCWs4BalpsqoYmdav/ttxm5JtYQw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-19 04:45, Christian König wrote:
> Am 16.07.23 um 09:51 schrieb Asahi Lina:
>> On 15/07/2023 16.14, Luben Tuikov wrote:
>>> On 2023-07-14 04:21, Asahi Lina wrote:
>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>> causes segfaults and other badness when job completion fences are
>>>> signaled after the scheduler is torn down.
>>>
>>> If there are pending jobs, ideally we want to call into the driver,
>>> so that it can release resources it may be holding for those.
>>> The idea behind "pending" is that they are pending in the hardware
>>> and we don't know their state until signalled/the callback called.
>>> (Or unless the device is reset and we get a notification of that fact.)
>>
>> That's what the job->free_job() callback does, then the driver is free 
>> to do whatever it wants with those jobs. A driver could opt to 
>> synchronously kill those jobs (if it can) or account for them 
>> separately/asynchronously.
>>
>> What this patch basically says is that if you destroy a scheduler with 
>> pending jobs, it immediately considers them terminated with an error, 
>> and returns ownership back to the driver for freeing. Then the driver 
>> can decide how to handle the rest and whatever the underlying hardware 
>> state is.
> 
> Yeah, and exactly that is absolutely *not* a good idea. Keep in mind 
> that memory management depends on all this stuff and signal a dma_fence 
> always requires that the hw give a go for that.
> 
> If you want to cleanup a scheduler with pending jobs what needs to 
> happen instead is that the driver cancels the processing and signals the 
> hw fence.
> 
>>
>>>> Explicitly detach all jobs from their completion callbacks and free
>>>> them. This makes it possible to write a sensible safe abstraction for
>>>> drm_sched, without having to externally duplicate the tracking of
>>>> in-flight jobs.
>>>>
>>>> This shouldn't regress any existing drivers, since calling
>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>> be a no-op if there are no pending jobs.
>>>
>>> While this statement is true on its own, it kind of contradicts
>>> the premise of the first paragraph.
>>
>> I mean right *now* it's broken, before this patch. I'm trying to make 
>> it safe, but it shouldn't regress any exiting drivers since if they 
>> trigger this code path they are broken today.
> 
> Yes and exactly that's intentional.
> 
> What you can do is to issue a *big* warning here when there are still 
> pending unsignaled hw fences when the driver calls drm_sched_fini().
> 
> But setting the scheduler fence to signaled without getting a signaled 
> state from the hw fence is a complete NO-GO.

Okay, so we have the requirement (how). If we can also get a reason behind
it (why), perhaps we can add the requirement and the reason as a lucid comment
to drm_sched_fini() to come with this patch when reworked, so that future
drivers whether they be in Rust or C, can take note.

Perhaps this will also help future development in DRM itself.
-- 
Regards,
Luben

> 
> Regards,
> Christian.
> 
>>
>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_main.c | 32 
>>>> ++++++++++++++++++++++++++++++--
>>>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 1f3bc3606239..a4da4aac0efd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>   {
>>>>       struct drm_sched_entity *s_entity;
>>>> +    struct drm_sched_job *s_job, *tmp;
>>>>       int i;
>>>>   -    if (sched->thread)
>>>> -        kthread_stop(sched->thread);
>>>> +    if (!sched->thread)
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * Stop the scheduler, detaching all jobs from their hardware 
>>>> callbacks
>>>> +     * and cleaning up complete jobs.
>>>> +     */
>>>> +    drm_sched_stop(sched, NULL);
>>>> +
>>>> +    /*
>>>> +     * Iterate through the pending job list and free all jobs.
>>>> +     * This assumes the driver has either guaranteed jobs are 
>>>> already stopped, or that
>>>> +     * otherwise it is responsible for keeping any necessary data 
>>>> structures for
>>>> +     * in-progress jobs alive even when the free_job() callback is 
>>>> called early (e.g. by
>>>> +     * putting them in its own queue or doing its own refcounting).
>>>> +     */
>>>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>> +        spin_lock(&sched->job_list_lock);
>>>> +        list_del_init(&s_job->list);
>>>> +        spin_unlock(&sched->job_list_lock);
>>>> +
>>>> + dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
>>>> +        drm_sched_fence_finished(s_job->s_fence);
>>>
>>> I'd imagine it's better to rebase this on top of drm-misc-next where
>>> drm_sched_fence_finished() takes one more parameter--the error.
>>
>> Ah, sure! I can do that.
>>
>>>
>>>> +
>>>> +        WARN_ON(s_job->s_fence->parent);
>>>> +        sched->ops->free_job(s_job);
>>>> +    }
>>>> +
>>>> +    kthread_stop(sched->thread);
>>>>         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>           struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>
>>>
>>> Conceptually I don't mind this patch--I see what it is trying to 
>>> achieve,
>>> but technically, we want the driver to detect GPU removal and return 
>>> shared
>>> resources back, such as "jobs", which DRM is also aware of.
>>
>> I think you missed the context of why I'm doing this, so in short: my 
>> use case (like Xe's) involves using a separate drm_sched instance *per 
>> file* since these queues are scheduled directly by the firmware. So 
>> this isn't about GPU removal, but rather about a GPU context going 
>> away while jobs are in flight (e.g. the process got killed). We want 
>> that to quickly kill the "DRM view" of the world, including signaling 
>> all the fences with an error and freeing resources like the scheduler 
>> itself.
>>
>> In the case of this particular GPU, there is no known way to actively 
>> and synchronously abort GPU jobs, so we need to let them run to 
>> completion (or failure), but we don't want that to block process 
>> cleanup and freeing a bunch of high-level resources. The driver is 
>> architected roughly along the lines of a firmware abstraction layer 
>> that maps to the firmware shared memory structures, and then a layer 
>> on top that implements the DRM view. When a process gets killed, the 
>> DRM side (which includes the scheduler, etc.) gets torn down 
>> immediately, and it makes sense to handle this cleanup inside 
>> drm_sched since it already has a view into what jobs are in flight. 
>> Otherwise, I would have to duplicate job tracking in the driver 
>> (actually worse: in the Rust abstraction for safety), which doesn't 
>> make much sense.
>>
>> But what I *do* have in the driver is tracking of the firmware 
>> structures. So when the drm_sched gets torn down and all the jobs 
>> killed, the underlying firmware jobs do run to completion, and the 
>> resources they use are all cleaned up after that (it's all reference 
>> counted). The primitive involved here is that in-flight firmware jobs 
>> are assigned an event completion slot, and that keeps a reference to 
>> them from a global array until the events fire and all the jobs are 
>> known to have completed. This keeps things memory-safe, since we 
>> absolutely cannot free/destroy firmware structures while they are in 
>> use (otherwise the firmware crashes, which is fatal on these GPUs - 
>> requires a full system reboot to recover).
>>
>> In practice, with the VM map model that we use, what ends up happening 
>> when a process gets killed is that all the user objects for in-flight 
>> jobs get unmapped, which usually causes the GPU hardware (not 
>> firmware) to fault. This then triggers early termination of jobs 
>> anyway via the firmware fault recovery flow. But even that takes some 
>> short amount of time, and by then all the drm_sched stuff is long gone 
>> and we're just dealing with the in-flight firmware stuff.
>>
>>> In the case where we're initiating the tear, we should notify the 
>>> driver that
>>> we're about to forget jobs (resources), so that it knows to return 
>>> them back
>>> or that it shouldn't notify us for them (since we've notified we're 
>>> forgetting them.)
>>
>> That contradicts Christian's comment. I tried to document that (after 
>> this patch) the scheduler no longer cares about hw fences and whether 
>> they are signaled or not after it's destroyed, and I got a strongly 
>> worded NAK for it. Sooo... which is it? Is it okay for drivers not to 
>> signal the hw fence after a scheduler teardown, or not?
>>
>> But really, I don't see a use case for an explicit "about to forget 
>> job" callback. The job free callback already serves the purpose of 
>> telling the driver to clean up resources associated with a job. If it 
>> wants to synchronously abort things there, it could easily take over 
>> its own fence signaling and do something with the underlying stuff if 
>> the fence is not signaled yet.
>>
>> In my case, since the driver is written in Rust and free_job() just 
>> maps to the destructor (Drop impl), that just ends up freeing a bunch 
>> of memory and other objects, and I don't particularly care about the 
>> state of the firmware side any more after that. The flow is the same 
>> whether it was a successful job completion, a failure, or an early 
>> destruction due to the drm_sched getting torn down.
>>
>>> (Note also that in this latter case, traditionally, the device would 
>>> be reset,
>>> so that we can guarantee that it has forgotten all shared resources 
>>> which
>>> we are to tear up. This is somewhat more complicated with GPUs, thus 
>>> the method
>>> pointed out above.)
>>
>> Yeah, in the firmware scheduling case we can't do this at all unless 
>> the firmware has an explicit teardown/forget op (which I'm not aware 
>> of) and a full GPU reset isn't something we can do either. Hence we 
>> just let the underlying jobs complete. In practice they tend to die 
>> pretty quickly anyway once all the buffers are unmapped.
>>
>> ~~ Lina
>>
> 

