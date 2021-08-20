Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE983F2D67
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 15:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792F6EA93;
	Fri, 20 Aug 2021 13:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395B76EA91;
 Fri, 20 Aug 2021 13:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc5mfVmOt5tr1/6vAOcclzkaiAWm5MwN3j2fnyuuAv9fHIK5gJRgfdIgytNXqkK4ALc2dh92mFDzVtiTIQaDi7kTJpBKAUQ/0rG8XgamygHB0D2GI3J88eoARp1yJpw/NV15ae+GICRSjDiZlFdHE7qeTqMkNHtbMzA6mjQaeR+1ZBECvvtXC6DXxHyInrsB9KXbSwZ4RJacotMENEbC5ubBe5gcWbe+elOx54V6N715nGzBEPkoD97T6leTfUCiBjiqnxXQFn9OXbMDv9FtqOmgllEfwDSCBbiNqbh5vWUG2/g3SzsmYnULBxa02bGkZTXs7SihD4yNYCi/+ESMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ57jq5eAogkfJBbQd34Wc8VVY4lvNJSwvmO9ZgaRYI=;
 b=fJ0S6HGiqmCOI0cTDIqB9hk17IxvLyTeX48BS/V3ekRYqTBmI4eeIbf/b/SwzJsrjymvC3aEbPZzEjCEK/K+SZk2UKqK/2wvj/DZc0qAHh3zh6JSkAqC/vkJpW1Byuqu8uGk2SaVN5szE/DkqZQcE3n30EITzQCK7r98C2BoMETEHR8YF+tzrbrIwRc1lnVC0Ws/c8u9qyiBFUYx8tLgfmhLddz+jbduQXH1yExK7+5RgV8sWE03e/AErlAw2VtaG9G7iV8TBUnYyPy+Vg/sK0KVArT5eac1J8b4BDr3ZlEn49rrHA6GGr7dT7D9TnjlSp3nRGD7ToguQOWSo3bGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ57jq5eAogkfJBbQd34Wc8VVY4lvNJSwvmO9ZgaRYI=;
 b=MfMxAXpxZsdHbTTM/2q6tGys+r+gKvPxJT+ii/kFYQCcJ6MNr9gtuhDK/PuQowVvuGmXczhPJaTrTGj94iT9OMLxXWy5IeGGY1B0qBevemnvv4+cFBH2BFZWZKKacGs+iGVKc2lYlKOsf1720t60X5lhbz/MEaPK+UikUwd4heY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 13:49:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 13:49:06 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Jingwen Chen <Jingwen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
References: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
 <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
 <20210820080936.welwdg73muojh7k5@wayne-dev>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <0f37766a-4fef-0f08-d46c-d329fceb8bcd@amd.com>
Date: Fri, 20 Aug 2021 09:49:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210820080936.welwdg73muojh7k5@wayne-dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::35) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:2f68:f1b:289e:f643]
 (2607:fea8:3edf:49b0:2f68:f1b:289e:f643) by
 YT1PR01CA0156.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 13:49:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3541b85-0c7f-4bef-9210-08d963e14722
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43812E34923E1E1189A2549AEAC19@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7/eJtx3I8EzSP3nt7KK4ORGOZxbsn4HFoQIrqjIKcsBi/15RB7DvWgUKLi+1J2ccugcN/g1NWAo7Xlv4ZvTQQDQsz7nirPwoaYpPv6TudKjx9g26S4rqe7Wa7oX5r4gLXWIq7U38BLrXCivYK/zh897r3E8++P9LiJ6KAq/BoIwgqyUCmzsYVmCIo0/b3QQmv5vuiV3hJRmz+b1YpIO1tA/fO7dool0J0OskrKDIByNobYfltWEweDP5f8ssqVYLdyu8+N8VMfaJp3YwC0mhf4Cb8J015e/G1I+RwepOYbKCA5lPldrY5tCQV5dSB/tfu2Ovc8YCDC8uA0Y2exi9YtzZ/NMLLn45Di+yWKVqMRcWp9wzDzPYnBine0WuDjiXiATwNCU4dvJW+F1wPhwks8JuRiYkCM7U//lXUnA/a3oVfvO/hULy0IOLM+bPkIPKUZuwi4czgiA/0adNnZU9HsGz2fo2d5DpcdIwi8SkC9gPZ4bS2h0m/rOgP3dp1kgM4rSbRcN2ff2DANg+W8bBwbSCBCyeh9Hi+M7N7UmCSS+0yWOHDPfuPleUDVz8nWn/fNC1y26GFRidYgyD2ytBDJWi+ps6CLGaGTlF3eaorh+7e1SFkZK7+9gXwh0VNJQZC9ZubCvpwbHUpK1PpMDMKGXlNS1OOzYJGzyziL/J0wx1aT2gdUZmfYE/hIQ7I0XmIzDmds7zQClamTtw8T1cyynRdOUzA3rL+ShwU5gthocZawLmyvvWzp/OUWpo1RYyJc9ICLwUW2Ral8WLggrCxkDIbOveCLlDxeUZfmyswIsi6tZGxrLsudqE7q3r6EX9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(31686004)(8936002)(36756003)(5660300002)(31696002)(83380400001)(8676002)(6486002)(2906002)(30864003)(66476007)(38100700002)(54906003)(66946007)(66556008)(86362001)(4326008)(966005)(478600001)(44832011)(53546011)(45080400002)(2616005)(66574015)(110136005)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1UR3BDaGFyRzc2eDNBTGlHdGFKSHFDOE9tM2piQlVCaThId3pYSmYzVy9a?=
 =?utf-8?B?Vng4VUtzYjhJZU5ncUxMaWU3WW8xZXF0MjVVakpaRFlPUWRCYnJRY3h5RnMz?=
 =?utf-8?B?K2llaFByRzJWTjNGcjB2QWU4WUwyMkkrQmdMYVIxU1NPL0xrM2VVNmI1QWVB?=
 =?utf-8?B?WEt6aUExMitkM2pOMnNNRXN0NmJBam4xYVlhcGhGeFlZcmM2dWtUeGFqUVlq?=
 =?utf-8?B?bHhEajZKM3Mxei9xUGZlV0hOa0RDeElTMkdOL0d4N0VzWWZjblZyL2pyYnZE?=
 =?utf-8?B?OXdoSEJIZ1dDRHFxRkIvMDhRTkVQSGJzWXhwL3Y3OGkvRVdBL0tNaWdLWXMz?=
 =?utf-8?B?TlBWWmtSckF4ZDBGaVhOMDQ2OEJaYTI4akhtZzFVOVdDeTAwQ2J4QndoZ1JI?=
 =?utf-8?B?T0NmbDJsNEtZR1FydE9EdVN5Y1FFL25XY0NITFFrcTVBdkFEUjNwSTh3eGVI?=
 =?utf-8?B?enZoYzlyOUtKbTU3dXBldVdZMndyN1VQOHBJeHd4cnpqVXhxckNWdHFURElJ?=
 =?utf-8?B?T2I4ODlvTk9sSUFXMWladWw5d0lUbkUvVTVJSVY0N04rS3NUVVhhNkY1YTh5?=
 =?utf-8?B?VC9DUFE2cHAvczZ6OFlaVFZnbTBHVUpZRmxRajJVYjBTT3FEb2N6UWxYNGRt?=
 =?utf-8?B?RVdET21sRklOZHd4ZDVFZDVzZ2M0ak94dmRxRXJHeklSc3NTN2M3VnZQbUJ2?=
 =?utf-8?B?eW1jSjlnUTN5ZUFqbG5pNlpxMGpLY3hyQWZON01ndlVDalZva2JpRVprdjgy?=
 =?utf-8?B?TjNGS1ozczEzeEVqalQzMFFqamQvVWVHYm5UTkptdHhabXZxSjZWcTNVVFk4?=
 =?utf-8?B?RWFub1pvWjBQZjRIT1dlZStVVCtxT2FCQWFwSzR2bzBudFBxK09vTnAxdVA3?=
 =?utf-8?B?TFJmeHJHR1JTVjhtTFZmRHJJYkpoTnhFNi9YYkQydHh1MDBHWXlDRTc2elgy?=
 =?utf-8?B?SE5sNlJwZDVQeXk1aTdXRTdQTXM5NWYxZnZSdUhGa0lVWldQblIzb001N2la?=
 =?utf-8?B?eTgvY3lOUm9qUHJzQnEvOW5mcW1DWm9mVHQ3QStYUlB3QnlDMGJUcGowVHpG?=
 =?utf-8?B?a1V5cnluMVNDTkRJTHkrcHl0VG1mV1YrMjVSYmovekhpdUdQbVVXMi9TNWhE?=
 =?utf-8?B?bVY5MFhjSUpKckFpT0JnRnBLZDNvdm1sZEVaVjBMUW5LUDV0dzdjd3NySFkr?=
 =?utf-8?B?dXFIdmxoRzQvbEhybmpVaE5rYkJuYndtRjJhLy83ckt3RlJkYVN6dG94citH?=
 =?utf-8?B?akg3dnl3bDZoSWwyeTFlOEdoOFNDcXVTditVcW5oUjBPYTBpblR3Wi9GVWFF?=
 =?utf-8?B?WEFCK29ENVErSFdDdWFad05VVkUrNytYc00zWEJNeDA4dEJPWm5JYTdtNlgz?=
 =?utf-8?B?aEIrZVphdStobmE1TmdOSFJyT01TWWJYVWZxUFFncUdKQUp4VXY0d3JLUHVO?=
 =?utf-8?B?eVJtOGZnS0xIakk3T3ZOVjVrOVlFaWxxcGVtOTVjWERPVlRpanVGVVJiSkln?=
 =?utf-8?B?VU1LQWlRY29pQXdsaHQzNnl5OEU4V21xaGtUdnFraEl1blI0K1hEQVZPekVU?=
 =?utf-8?B?aUQreXBuUDFLM3RNREI3WW9EVVVBNDFUQXFCQjd4Nm5YeitZQXNXdSthNmlI?=
 =?utf-8?B?YVN4SFNaUmttK1pYS0x3Z3k3c0N6ZCtMTEFMSFdsRXoxaHV2QVFtd1JzM053?=
 =?utf-8?B?R3I5WUNXNWpWMktNVmdnZFFBSi9vRTZyNWhlVTVnSVg0RkI2dWduMjgzQWJF?=
 =?utf-8?B?KzJ6NkxucFV6eWdlYU1VbWpJL1RWNzdsN3FHNTk2TTBiREFrMVFHa05HR1NF?=
 =?utf-8?B?N2JlWU80bk1TVDEwSDZ2WGtTYSt3a0d2bndPeWRSbWRkVUREeHJyTWlqVHNK?=
 =?utf-8?Q?oHw+nNk23tEkv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3541b85-0c7f-4bef-9210-08d963e14722
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 13:49:06.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtLblSbAcVCyfvyY5h5Np/LQMXv3MDu66AEYVDSylmVuUb3ercAFzmF5csuLQRlmliiVE49hdzJF97hPQXq7Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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

I believe we have some minor confusion here

On 2021-08-20 4:09 a.m., Jingwen Chen wrote:
> Hi all,
>
> I just submit a v3 patch according your opinion on using kthread_park
> instead.
>
> Thanks,
> Jingwen
> On Fri Aug 20, 2021 at 09:20:42AM +0200, Christian König wrote:
>> No, that perfectly works for me.
>>
>> The problem we used to have with this approach was that we potentially have
>> multiple timeouts at the same time.
>>
>> But when we serialize the timeout handling by using a single workqueue as
>> suggested by Daniel now as well then that isn't an issue any more.


While we do use single work queue by default (system_wq) for this, we 
use different
work items, one per scheduler which means they still run in parallel.  I 
didn't see the original
mail by Daniel but from what Christian mentioned I assume he suggested 
to serialize all TO handlers
from all possible engines by either using single work item for TO 
handler or by using single threaded queue for all TO handlers.
So i believe it's premature to send V3 patch without also switching all 
TDR handling to actual single threaded
handling per entire ASIC or in case of amdgpu we actually need to 
consider XGMI hives and so it goes beyond a single
device.

Andrey


>>
>> Regards,
>> Christian.
>>
>> Am 20.08.21 um 09:12 schrieb Liu, Monk:
>>> [AMD Official Use Only]
>>>
>>> @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
>>> Do you have any concern on the kthread_park() approach ?
>>>
>>> Theoretically speaking sched_main shall run there exclusively with job_timeout since they both touches jobs, and stop scheduler during job_timeout won't impact performance since in that scenario
>>> There was already something wrong/stuck on that ring/scheduler
>>>
>>> Thanks
>>>
>>> ------------------------------------------
>>> Monk Liu | Cloud-GPU Core team
>>> ------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Liu, Monk
>>> Sent: Thursday, August 19, 2021 6:26 PM
>>> To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>> Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
>>> Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>>>
>>> [AMD Official Use Only]
>>>
>>> Hi Daniel
>>>
>>>>> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
>>> Yeah we had this though as well in our mind.
>>>
>>> Our second approach is to call ktrhead_stop() in job_timedout() routine so that  the "bad" job is guaranteed to be used without scheduler's touching or freeing, Check this sample patch one as well please:
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a2a9536..50a49cb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>           sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>           /* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>> +       kthread_park(sched->thread);
>>>           spin_lock(&sched->job_list_lock);
>>>           job = list_first_entry_or_null(&sched->pending_list,
>>>                                          struct drm_sched_job, list);
>>>           if (job) {
>>> -               /*
>>> -                * Remove the bad job so it cannot be freed by concurrent
>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>> -                * is parked at which point it's safe.
>>> -                */
>>> -               list_del_init(&job->list);
>>>                   spin_unlock(&sched->job_list_lock);
>>>                   status = job->sched->ops->timedout_job(job);
>>> @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>           } else {
>>>                   spin_unlock(&sched->job_list_lock);
>>>           }
>>> +       kthread_unpark(sched->thread);
>>>           if (status != DRM_GPU_SCHED_STAT_ENODEV) {
>>>                   spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>           kthread_park(sched->thread);
>>>           /*
>>> -        * Reinsert back the bad job here - now it's safe as
>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>> -        * bad job at this point - we parked (waited for) any in progress
>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>> -        * now until the scheduler thread is unparked.
>>> -        */
>>> -       if (bad && bad->sched == sched)
>>> -               /*
>>> -                * Add at the head of the queue to reflect it was the earliest
>>> -                * job extracted.
>>> -                */
>>> -               list_add(&bad->list, &sched->pending_list);
>>> -
>>> -       /*
>>>            * Iterate the job list from later to  earlier one and either deactive
>>>            * their HW callbacks or remove them from pending list if they already
>>>            * signaled.
>>>
>>>
>>> Thanks
>>>
>>> ------------------------------------------
>>> Monk Liu | Cloud-GPU Core team
>>> ------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Daniel Vetter <daniel@ffwll.ch>
>>> Sent: Thursday, August 19, 2021 5:31 PM
>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
>>> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>>>
>>> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>>>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>>>
>>>>>>>>> + dri-devel
>>>>>>>>>
>>>>>>>>> Since scheduler is a shared component, please add dri-devel
>>>>>>>>> on all scheduler patches.
>>>>>>>>>
>>>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>>>> [Why]
>>>>>>>>>> for bailing job, this commit will delete it from pending
>>>>>>>>>> list thus the bailing job will never have a chance to be
>>>>>>>>>> resubmitted even in advance tdr mode.
>>>>>>>>>>
>>>>>>>>>> [How]
>>>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race
>>>>>>>>>> condition that this commit tries to work around is
>>>>>>>>>> completely solved.So revert this commit.
>>>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>>>> v2:
>>>>>>>>>> add dma_fence_get/put() around timedout_job to avoid
>>>>>>>>>> concurrent delete during processing timedout_job
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>>>       1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>       {
>>>>>>>>>>              struct drm_gpu_scheduler *sched;
>>>>>>>>>>              struct drm_sched_job *job;
>>>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>>>              enum drm_gpu_sched_stat status =
>>>>>>>>>> DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>>>
>>>>>>>>>>              sched = container_of(work, struct
>>>>>>>>>> drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@
>>>>>>>>>> static void drm_sched_job_timedout(struct work_struct
>>>>>>>>>> *work)
>>>>>>>>>>
>>>>>>>>>>              if (job) {
>>>>>>>>>>                      /*
>>>>>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>>>> -                * is parked at which point it's safe.
>>>>>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>>>>>> +                * processing timedout_job
>>>>>>>>>>                       */
>>>>>>>>>> -               list_del_init(&job->list);
>>>>>>>>>> +               fence =
>>>>>>>>>> + dma_fence_get(job->s_fence->parent);
>>>>>>>> While this is true for amdgpu, it has no meaning for other
>>>>>>>> drivers for whom we haven't done the refactoring of embedding
>>>>>>>> HW fence (parent) into the job structure.
>>>>>>>> In fact thinking
>>>>>>>> about it, unless you do the HW fence embedding for all the
>>>>>>>> drivers using the scheduler you cannot revert this patch or
>>>>>>>> you will just break them.
>>>>>>> btw, why did you do that embedding? I do still have my patches
>>>>>>> with dma_fence annotations floating around, but my idea at least
>>>>>>> was to fix that issue with a mempool, not with embeddeding. What
>>>>>>> was the motivation for embedding the wh fence?
>>>>>>> -Daniel
>>>>>> The motivation was 2 fold, avoid memory allocation during jobs
>>>>>> submissions (HW fence allocation) because as Christian explained
>>>>>> this leads to deadlock with mm code during evictions due to memory
>>>>>> pressure (Christian can clarify if I messed
>>>>> Yeah that's the exact same thing I've chased with my dma_fence
>>>>> annotations, but thus far zero to none interested in getting it
>>>>> sorted. I think it'd be good to have some cross-driver agreement on
>>>>> how this should be solved before someone just charges ahead ...
>>>>>
>>>>>> this explanation). Second is to exactly revert this patch because
>>>>>> while it solved the issue described in the patch it created
>>>>>> another with drivers who baildc out early during TDR handling for
>>>>>> various reason and the job would just leak because it was already
>>>>>> removed form pending list.
>>>>> Can't we reinsert it before we restart the scheduler thread? It
>>>>> might need a separate list for that due to the lockless queue
>>>>> tricks. Or am I thinking about the wrong kind of "we lost the job"?
>>>>> -Danile
>>>> If you look at the original patch it would reinsert it even earlier -
>>>> right after stopping the  SW scheduler thread, and even then it was to
>>>> late for some drivers as they would decide to return back from their
>>>> TDR handler even before that. It is solvable but in an ugly way as far
>>>> as I see, you need to require each driver in his code to put the job
>>>> back in the list if they do it before reaching the place where
>>>> scheduler framework does it. Kind of spaghetti code seems to me.
>>> Hm yeah I didn't realize this all happens before we stop the scheduler thread.
>>>
>>> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
>>>
>>> I'm also still not understanding what exactly you guys have done, can someone please dig out the the amdgpu patches that motivate all this maybe that's clearer? A full explanation would still be good since I've only started in scheduler stuff.
>>>
>>> Another thing I recently pondered for tdr races looking at i915 code is whether the tdr should first block the completion fence for that job. My motivation is to have a race-free error capture (if the completion races then we might start evicting memory and everything goes boom), but maybe that helps here too. Some kind of atomic "block this fence from completing thing.
>>>
>>> Or I'm I completely guessing in the wrong direction?
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>>
>>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>>
>>>>>>>>>>                      status =
>>>>>>>>>> job->sched->ops->timedout_job(job);
>>>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>                              job->sched->ops->free_job(job);
>>>>>>>>>>                              sched->free_guilty = false;
>>>>>>>>>>                      }
>>>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>>>              } else {
>>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>>              }
>>>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct
>>>>>>>>>> drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>>
>>>>>>>>>>              kthread_park(sched->thread);
>>>>>>>>>>
>>>>>>>>>> -       /*
>>>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>>>> -        */
>>>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>>>> -               /*
>>>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>>>> -                * job extracted.
>>>>>>>>>> -                */
>>>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>>>> -
>>>>>>>>>>              /*
>>>>>>>>>>               * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>>               * their HW callbacks or remove them from
>>>>>>>>>> pending list if they already
>>>>>>>>>> --
>>>>>>>>>> 2.25.1
>>>>>>>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCMsvwyY%3D&amp;reserved=0
