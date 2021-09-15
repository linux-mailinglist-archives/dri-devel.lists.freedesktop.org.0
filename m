Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5440C780
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C29F6E91F;
	Wed, 15 Sep 2021 14:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3F06E91F;
 Wed, 15 Sep 2021 14:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAXc+GHNSZEKOXiE5I42if/lUOG4YKEQJRBVLr72Qz7PeCNOwatOGfClZHzTjZSwB3xb5NjL1rQKTemEC2Zr4xDyQR07njAEr95XGH1LGj7yiJkNStv0Qsu4lYTbDiAlIoOUABftjU3/mRpDuaot9nGbVB5Wld71wy/iWhxCKAzjNiJlq97a28dXZhjVMVh9WQq9V27ruU5vMMRxgSDFKLFWzgNoiF1eFsLVFkkUTkXDGqSozmHUKQNxKghpY/r3kPtyrtmeQ8N5FiZ2l5G6lwkX9JMBa9I1XuVrbeTmHL/RQJKp0sHJfh6Fa0MKefowKErdiKGtXQCB+iY78DTLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EZDsjq5PtaBxLv4e8u1/d2SyvaVxMYh4g74Z9FQAkQ4=;
 b=abKN/tXmfbkZ1gvThKWkdncI9RfH36Ffd/qyDdZF/Pn0oqZ+DWsH5IHhQgrmC20jCn27CVxdOK51hYrkaQOcxB6DXIxkQM/e1gEU2R/BimioH2noUW/B9QnH2LSfwyMqV6jynge5XIp1sO2jX30wxxuMedDz3UXsj6rHzOwLDrPJii7QZONFCJsyW3UqMPQheoGGp52Wp0tFdLNQxTfKEq3HNkbhvwa9Ne7bqEyflt554BoI4bAwogFwbMTS12eyLk9nkMXW65q/jSDVT1MlvBnAXoUHJNGO5zpUxGURK9T5JdLDOcjIXCOL01dXXATeq4EsIG4mDkv0swr1alZS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZDsjq5PtaBxLv4e8u1/d2SyvaVxMYh4g74Z9FQAkQ4=;
 b=2nxxvfjw2DTJwuJ7ivlQo7LQ8y90UvHF6IyDubE9hXY1VIE1URzLKGCIGqiWVUOxg91407o8BtHh0TUD/J41By99VdnqpjON8Q3+/cnu754IJI6rsI3EkcN4aM2tfXGlHwQiO6oWdH4xfglTuRM4NKMvDklR2muY7te2IzE9N2I=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2703.namprd12.prod.outlook.com (2603:10b6:805:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 14:32:36 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 14:32:36 +0000
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "Liu, Monk" <Monk.Liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
 <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
 <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
 <CADnq5_POHuuQYm5ZULWeumCmsy+eWbsRe0MSKuJcQxb7R=962g@mail.gmail.com>
 <SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com>
 <9fef7287-5d2c-1d25-afa8-1c621be8fe67@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <0eb18ea5-a689-665a-72fb-27a77ff21ab4@amd.com>
Date: Wed, 15 Sep 2021 10:32:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9fef7287-5d2c-1d25-afa8-1c621be8fe67@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------20EA96E7AE4C789C89532F29"
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:b7f3:c5bf:cc7e:9d39]
 (2607:fea8:3edf:49b0:b7f3:c5bf:cc7e:9d39) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 14:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3875b2b1-852f-4298-7c9c-08d97855a941
X-MS-TrafficTypeDiagnostic: SN6PR12MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2703CBEE4A8C88837225D771EADB9@SN6PR12MB2703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBCZyVZGyddppp4BasWQHkSzlJ4eP9m+rmiERTi/p93sn1rBXI9hkows3sQbdSk5BxVpXPyVNL8WjkmGmB+8sdfe+xL9AN9YHegWjCim+rhyLk2My1wRn+EnZ7JX9avywHEJGbDPRNIgm6xHoGkA+oPyaySP7JIN55k5uYO3uaZ9jPGXYIlgmYGcRMdP1c83woY79z+1iCmm8uTAZLphszE5DeiMdVOwMJiVCcC0l8255kph73d14JvPkelqWO8/rn5sUUfN4kQ8+Iu10LxP9Npl3O6uD9ONMgfFRJOTe2u0toqKgtMfE+uskQLc5FZWOodCCH1YASEJNZBfX9xNiBzs+L+TMJ78ELL+jCtLl0U+zsqFaINtQSWbqJ9D6a80slQgXMsIU227zywkGmz0h1jBpeavDMW31OHVyFPk/Ru6yqCoHp0sdgacf9akFQgx/VXYmRaHZmzAl3fC/xJr3gcpkSUEf7LDgn0JnCS2uiKmum/bI/6muAuoeL2xfJnZNAJ4raI7LzeyjXp/g/t2SqclJvYeAVz7Ct3H0Uq2dxfCvSTy5B0w4d081H3vsZKFyj8tm0jAvMPySGnmGWELBNT9DNnLWv3JElqIomtNVZ8mqCdWXmuQyQibB3xOCGZNTbpBcLh85gFIn3pXnLLGuRukdx769RwHYwniW90YpWGgbngw9/FcRChZp4lFfrV/nZVheDxZ1zlrtaMwQ5oGk0XMFWaNje2oQJNa1UQ86y8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(86362001)(53546011)(186003)(54906003)(44832011)(2906002)(110136005)(478600001)(66574015)(31696002)(6486002)(83380400001)(2616005)(4326008)(36756003)(66946007)(66476007)(66556008)(38100700002)(5660300002)(8676002)(8936002)(31686004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?652bMQjR94VToq9WKBDY69vrm7rk/Pcr1cYbvYuXK4jnwK/6fRSkhOrA?=
 =?Windows-1252?Q?NfIkYLnKxWFW+Z5KR9P0/oorECCf1VCd9j4aq4P2FWz50KEcBGXwznM9?=
 =?Windows-1252?Q?5zIJ6Z8vY2UhCVhRnKyYg4INYXMaUrfkkYhdtqPBejgtwABWlgCpnDU9?=
 =?Windows-1252?Q?h7T7NirbFk2iylEULP/NmfboC5Il2ry73V8c4KS1wbRFy5u5NKln3zdf?=
 =?Windows-1252?Q?K4YVxAmiHcUXysBozekVxB738PscUgcROogLEY8CEaECvQ8CvaY6+eaw?=
 =?Windows-1252?Q?f89aH0dp51fCdty+qXZ1ES3nyCMETsON50IQhiayTnlHH+y6HwjT5Q9+?=
 =?Windows-1252?Q?ARXInrNx2TfB8NOjHxRsARWi2UbPReot5nqDgI+mEOboB7JQE2BPkQJH?=
 =?Windows-1252?Q?/ZM2uMzhSwjbd3FZHOouWuCciPLzzl68FHV86ydxsTl9x7n340zghkp/?=
 =?Windows-1252?Q?JuLrhSAqR8thtueTPQBX88h7A/P0VffdrSgtHxuPodOedCRvVIMdnMi5?=
 =?Windows-1252?Q?0jLqn8+WM4WTfnFbPMWljfyX+uNBAGVQCnSkKnGb9ZMxPGy6E+ItW52m?=
 =?Windows-1252?Q?eguHEfE1iswt/t8rb4KPP7vXn1W94L4tubMJYpeZi1zstpDihJ2yHpl8?=
 =?Windows-1252?Q?IOiDSTiu359X0ls8nTeqEsyc4pWI5GJq3jNUq0gBqFvOjaBwEg4y7vpy?=
 =?Windows-1252?Q?NuGrHGPmJGO2flx3q2huYmGvkNdT035zJBLsFzE416HlknBcyfGduqBt?=
 =?Windows-1252?Q?S6RjjDjGguuo7upsnaD90DWUz9cBNzp74iK7PqwzjsobF+lxJplLJmH2?=
 =?Windows-1252?Q?arFajNOpIXiaQ4ryzgfHg8/MCJnDJBKM1AV1rqRtICjMYVciZENOkS0s?=
 =?Windows-1252?Q?wd6+ZdMTqC47qfGZr+cMkl5fMLhGxQ4LCcdyfw5zo0hrlQhmsZIjbt/l?=
 =?Windows-1252?Q?MJtIOs0RgQWFPaCFQ/k3lvkOonRZiQCH193ZRkZX3LqRRDDeWGp7q/4F?=
 =?Windows-1252?Q?ximsi8l27CtPYNuDPS0QsJ6m3sljsYVHUhWP2ArNAjTqoEUhKidAAkTP?=
 =?Windows-1252?Q?oPhVYLTMN3pF/H+Oqdco7Py+EcWqegLp7wj3xGAii0BDwWOMnqoTKzg6?=
 =?Windows-1252?Q?6yDPQO4K0y6sPgRICsuUZCWoK2q+BppVOAsWy2s4vfq9BfsnpHaTgEcD?=
 =?Windows-1252?Q?Od8xHCtmeRDCZ6akEOVWIHqPaxPU/toMzBRhzjxlS/kresdyUiOxVWsh?=
 =?Windows-1252?Q?i1BLH/IJVf1ETWQHDOrQGTKcLdsPX3uES2y706qUCX4P4vaapsNWimzE?=
 =?Windows-1252?Q?ajszuGnnOoYufm3P+pyt3EaPuu+js6tExO+8y4uhxv9hHMQOYFz6pBH7?=
 =?Windows-1252?Q?o56LwQJ0Vhu1UbwZ1D2YgqPvJH423+wukAozlV1sg4F4VpA8wtLoaw3X?=
 =?Windows-1252?Q?M6UFtZykK0ClB/vUa7L4swJqeeEFiPf4DvVu9Hpnibz9JgU9PfZ/19ZW?=
 =?Windows-1252?Q?LRqetHiG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3875b2b1-852f-4298-7c9c-08d97855a941
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 14:32:35.8459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4cMOVc1XDAo1X2AuZ9eibUVceW2eGdyBgNqoVYqUC1ztO6BIXraZWk7WuEohmHJWacJV3p5VGRI3AJpJziQPng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2703
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

--------------20EA96E7AE4C789C89532F29
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Pushed

Andrey

On 2021-09-15 7:45 a.m., Christian König wrote:
> Yes, I think so as well. Andrey can you push this?
>
> Christian.
>
> Am 15.09.21 um 00:59 schrieb Grodzovsky, Andrey:
>> AFAIK this one is independent.
>>
>> Christian, can you confirm ?
>>
>> Andrey
>> ------------------------------------------------------------------------
>> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
>> Alex Deucher <alexdeucher@gmail.com>
>> *Sent:* 14 September 2021 15:33
>> *To:* Christian König <ckoenig.leichtzumerken@gmail.com>
>> *Cc:* Liu, Monk <Monk.Liu@amd.com>; amd-gfx list 
>> <amd-gfx@lists.freedesktop.org>; Maling list - DRI developers 
>> <dri-devel@lists.freedesktop.org>
>> *Subject:* Re: [PATCH 1/2] drm/sched: fix the bug of time out 
>> calculation(v4)
>> Was this fix independent of the other discussions?  Should this be
>> applied to drm-misc?
>>
>> Alex
>>
>> On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher <alexdeucher@gmail.com> 
>> wrote:
>> >
>> > On Wed, Sep 1, 2021 at 2:50 AM Christian König
>> > <ckoenig.leichtzumerken@gmail.com> wrote:
>> > >
>> > > Am 01.09.21 um 02:46 schrieb Monk Liu:
>> > > > issue:
>> > > > in cleanup_job the cancle_delayed_work will cancel a TO timer
>> > > > even the its corresponding job is still running.
>> > > >
>> > > > fix:
>> > > > do not cancel the timer in cleanup_job, instead do the cancelling
>> > > > only when the heading job is signaled, and if there is a "next" job
>> > > > we start_timeout again.
>> > > >
>> > > > v2:
>> > > > further cleanup the logic, and do the TDR timer cancelling if 
>> the signaled job
>> > > > is the last one in its scheduler.
>> > > >
>> > > > v3:
>> > > > change the issue description
>> > > > remove the cancel_delayed_work in the begining of the cleanup_job
>> > > > recover the implement of drm_sched_job_begin.
>> > > >
>> > > > v4:
>> > > > remove the kthread_should_park() checking in cleanup_job routine,
>> > > > we should cleanup the signaled job asap
>> > > >
>> > > > TODO:
>> > > > 1)introduce pause/resume scheduler in job_timeout to serial the 
>> handling
>> > > > of scheduler and job_timeout.
>> > > > 2)drop the bad job's del and insert in scheduler due to above 
>> serialization
>> > > > (no race issue anymore with the serialization)
>> > > >
>> > > > tested-by: jingwen <jingwen.chen@@amd.com>
>> > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>> > >
>> > > Reviewed-by: Christian König <christian.koenig@amd.com>
>> > >
>> >
>> > Are you planning to push this to drm-misc?
>> >
>> > Alex
>> >
>> >
>> > > > ---
>> > > >   drivers/gpu/drm/scheduler/sched_main.c | 26 
>> +++++++++-----------------
>> > > >   1 file changed, 9 insertions(+), 17 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> > > > index a2a9536..3e0bbc7 100644
>> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
>> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> > > > @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>> > > >   {
>> > > >       struct drm_sched_job *job, *next;
>> > > >
>> > > > -     /*
>> > > > -      * Don't destroy jobs while the timeout worker is 
>> running  OR thread
>> > > > -      * is being parked and hence assumed to not touch 
>> pending_list
>> > > > -      */
>> > > > -     if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>> > > > - !cancel_delayed_work(&sched->work_tdr)) ||
>> > > > -         kthread_should_park())
>> > > > -             return NULL;
>> > > > -
>> > > > spin_lock(&sched->job_list_lock);
>> > > >
>> > > >       job = list_first_entry_or_null(&sched->pending_list,
>> > > > @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>> > > >       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>> > > >               /* remove job from pending_list */
>> > > > list_del_init(&job->list);
>> > > > +
>> > > > +             /* cancel this job's TO timer */
>> > > > + cancel_delayed_work(&sched->work_tdr);
>> > > >               /* make the scheduled timestamp more accurate */
>> > > >               next = list_first_entry_or_null(&sched->pending_list,
>> > > > typeof(*next), list);
>> > > > -             if (next)
>> > > > +
>> > > > +             if (next) {
>> > > > next->s_fence->scheduled.timestamp =
>> > > > job->s_fence->finished.timestamp;
>> > > > -
>> > > > +                     /* start TO timer for next job */
>> > > > + drm_sched_start_timeout(sched);
>> > > > +             }
>> > > >       } else {
>> > > >               job = NULL;
>> > > > -             /* queue timeout for next job */
>> > > > - drm_sched_start_timeout(sched);
>> > > >       }
>> > > >
>> > > > spin_unlock(&sched->job_list_lock);
>> > > > @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
>> > > > (entity = drm_sched_select_entity(sched))) ||
>> > > > kthread_should_stop());
>> > > >
>> > > > -             if (cleanup_job) {
>> > > > +             if (cleanup_job)
>> > > > sched->ops->free_job(cleanup_job);
>> > > > -                     /* queue timeout for next job */
>> > > > - drm_sched_start_timeout(sched);
>> > > > -             }
>> > > >
>> > > >               if (!entity)
>> > > >                       continue;
>> > >
>

--------------20EA96E7AE4C789C89532F29
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
  </head>
  <body>
    <p>Pushed</p>
    <p>Andrey</p>
    <div class="moz-cite-prefix">On 2021-09-15 7:45 a.m., Christian
      König wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9fef7287-5d2c-1d25-afa8-1c621be8fe67@gmail.com">
      
      Yes, I think so as well. Andrey can you push this?<br>
      <br>
      Christian.<br>
      <br>
      <div class="moz-cite-prefix">Am 15.09.21 um 00:59 schrieb
        Grodzovsky, Andrey:<br>
      </div>
      <blockquote type="cite" cite="mid:SN6PR12MB4623F8A1707C870938E08140EADA9@SN6PR12MB4623.namprd12.prod.outlook.com">
        <div>AFAIK this one is independent.</div>
        <div><br>
        </div>
        <div>Christian, can you confirm ?</div>
        <div><br>
        </div>
        <div>Andrey</div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            amd-gfx <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org" moz-do-not-send="true">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a>
            on behalf of Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com" moz-do-not-send="true">&lt;alexdeucher@gmail.com&gt;</a><br>
            <b>Sent:</b> 14 September 2021 15:33<br>
            <b>To:</b> Christian König <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
            <b>Cc:</b> Liu, Monk <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">&lt;Monk.Liu@amd.com&gt;</a>;
            amd-gfx list <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">&lt;amd-gfx@lists.freedesktop.org&gt;</a>;
            Maling list - DRI developers <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">&lt;dri-devel@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b> Re: [PATCH 1/2] drm/sched: fix the bug of
            time out calculation(v4)</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">Was this fix independent of the
                other discussions?&nbsp; Should this be<br>
                applied to drm-misc?<br>
                <br>
                Alex<br>
                <br>
                On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com" moz-do-not-send="true">&lt;alexdeucher@gmail.com&gt;</a>
                wrote:<br>
                &gt;<br>
                &gt; On Wed, Sep 1, 2021 at 2:50 AM Christian König<br>
                &gt; <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>
                wrote:<br>
                &gt; &gt;<br>
                &gt; &gt; Am 01.09.21 um 02:46 schrieb Monk Liu:<br>
                &gt; &gt; &gt; issue:<br>
                &gt; &gt; &gt; in cleanup_job the cancle_delayed_work
                will cancel a TO timer<br>
                &gt; &gt; &gt; even the its corresponding job is still
                running.<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; fix:<br>
                &gt; &gt; &gt; do not cancel the timer in cleanup_job,
                instead do the cancelling<br>
                &gt; &gt; &gt; only when the heading job is signaled,
                and if there is a &quot;next&quot; job<br>
                &gt; &gt; &gt; we start_timeout again.<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; v2:<br>
                &gt; &gt; &gt; further cleanup the logic, and do the TDR
                timer cancelling if the signaled job<br>
                &gt; &gt; &gt; is the last one in its scheduler.<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; v3:<br>
                &gt; &gt; &gt; change the issue description<br>
                &gt; &gt; &gt; remove the cancel_delayed_work in the
                begining of the cleanup_job<br>
                &gt; &gt; &gt; recover the implement of
                drm_sched_job_begin.<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; v4:<br>
                &gt; &gt; &gt; remove the kthread_should_park() checking
                in cleanup_job routine,<br>
                &gt; &gt; &gt; we should cleanup the signaled job asap<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; TODO:<br>
                &gt; &gt; &gt; 1)introduce pause/resume scheduler in
                job_timeout to serial the handling<br>
                &gt; &gt; &gt; of scheduler and job_timeout.<br>
                &gt; &gt; &gt; 2)drop the bad job's del and insert in
                scheduler due to above serialization<br>
                &gt; &gt; &gt; (no race issue anymore with the
                serialization)<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; tested-by: jingwen <a class="moz-txt-link-rfc2396E" href="mailto:jingwen.chen@@amd.com" moz-do-not-send="true">&lt;jingwen.chen@@amd.com&gt;</a><br>
                &gt; &gt; &gt; Signed-off-by: Monk Liu <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">&lt;Monk.Liu@amd.com&gt;</a><br>
                &gt; &gt;<br>
                &gt; &gt; Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt; &gt;<br>
                &gt;<br>
                &gt; Are you planning to push this to drm-misc?<br>
                &gt;<br>
                &gt; Alex<br>
                &gt;<br>
                &gt;<br>
                &gt; &gt; &gt; ---<br>
                &gt; &gt; &gt;&nbsp;&nbsp; drivers/gpu/drm/scheduler/sched_main.c
                | 26 +++++++++-----------------<br>
                &gt; &gt; &gt;&nbsp;&nbsp; 1 file changed, 9 insertions(+), 17
                deletions(-)<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; diff --git
                a/drivers/gpu/drm/scheduler/sched_main.c
                b/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt; &gt; &gt; index a2a9536..3e0bbc7 100644<br>
                &gt; &gt; &gt; ---
                a/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt; &gt; &gt; +++
                b/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt; &gt; &gt; @@ -676,15 +676,6 @@
                drm_sched_get_cleanup_job(struct drm_gpu_scheduler
                *sched)<br>
                &gt; &gt; &gt;&nbsp;&nbsp; {<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_job *job, *next;<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't destroy jobs while the
                timeout worker is running&nbsp; OR thread<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is being parked and hence
                assumed to not touch pending_list<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt;timeout !=
                MAX_SCHEDULE_TIMEOUT &amp;&amp;<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                !cancel_delayed_work(&amp;sched-&gt;work_tdr)) ||<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kthread_should_park())<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
                &gt; &gt; &gt; -<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_lock(&amp;sched-&gt;job_list_lock);<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job =
                list_first_entry_or_null(&amp;sched-&gt;pending_list,<br>
                &gt; &gt; &gt; @@ -693,17 +684,21 @@
                drm_sched_get_cleanup_job(struct drm_gpu_scheduler
                *sched)<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job &amp;&amp;
                dma_fence_is_signaled(&amp;job-&gt;s_fence-&gt;finished))
                {<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* remove job from
                pending_list */<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                list_del_init(&amp;job-&gt;list);<br>
                &gt; &gt; &gt; +<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* cancel this job's TO
                timer */<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                cancel_delayed_work(&amp;sched-&gt;work_tdr);<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* make the scheduled
                timestamp more accurate */<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next =
                list_first_entry_or_null(&amp;sched-&gt;pending_list,<br>
                &gt; &gt;
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                typeof(*next), list);<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (next)<br>
                &gt; &gt; &gt; +<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (next) {<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                next-&gt;s_fence-&gt;scheduled.timestamp =<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                job-&gt;s_fence-&gt;finished.timestamp;<br>
                &gt; &gt; &gt; -<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* start TO timer
                for next job */<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                drm_sched_start_timeout(sched);<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job = NULL;<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* queue timeout for next
                job */<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                drm_sched_start_timeout(sched);<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_unlock(&amp;sched-&gt;job_list_lock);<br>
                &gt; &gt; &gt; @@ -791,11 +786,8 @@ static int
                drm_sched_main(void *param)<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                (entity = drm_sched_select_entity(sched))) ||<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                kthread_should_stop());<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cleanup_job) {<br>
                &gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cleanup_job)<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                sched-&gt;ops-&gt;free_job(cleanup_job);<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* queue timeout
                for next job */<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                drm_sched_start_timeout(sched);<br>
                &gt; &gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt; &gt; &gt;<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!entity)<br>
                &gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
                &gt; &gt;<br>
              </div>
            </span></font></div>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------20EA96E7AE4C789C89532F29--
