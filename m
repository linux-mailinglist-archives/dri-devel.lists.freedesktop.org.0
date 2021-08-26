Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F73F821D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 07:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A2B6E4F3;
	Thu, 26 Aug 2021 05:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A26F6E4F1;
 Thu, 26 Aug 2021 05:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjaxZsYDrxWidWXC9XW+WczmdVQaleG+wNfHTlHJHHPzyhYYBalVlbjdj4BL3KRhdIZUtynTcvoRRyb8VTTCowHMVjHYX6gvCihZ/oh0fzkddJPKBDYrQDjjE1teVTYuSU8pVsB4C0O3V/IXiLQtfy3Omc4scB3IuXJMVuac4n0fGab7SsM4nqgX/JKcyiANF82SPQZXzytDYU8P0wq/mGwe5+h8oCUVPVQAy0+nPr7dFY+9m+RRDxpANhP4PbwXFcXkvihQ+tCffDB0nCPeyuvoaXTKARpfVB2lRwQlCtjP2m6VNJG/hQlVPMxiXY0ZAbDQ7OwioZYDobGQ/sUrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hefpOOIV8NqmenXcul7UfZjt710FhDceHVxvp+wQ7RY=;
 b=cMrjMbA2yZfrsGcmsl2g47lKjkgu/gLPL+KVkzgExkdu5BaUypEmcC2li1vJtGli50igM4Gww1TCalhxj+uriqi0NjgfFmUFXhVbVLIuydtKIZ1XnbQt1RGdU5vsueze6PRO2VPu5BlcRVB7wCFgdVyVigGWx2rlNxzjrFL8iAvigO42sONdkq5JURv1vyxe/rCVgeV+k2rgzjOeSL5if8vA+BU3+zdWFaytie4BYxaS8AaW3gYSnQbIa7pxwPtwMKnQVT6VaJqBud92+wjSa69JDwFRA9HvYo0l9tsgZrY6D7DCxRV3Lz75SA+C/kRoowirrdiAae4zCArZHsKT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hefpOOIV8NqmenXcul7UfZjt710FhDceHVxvp+wQ7RY=;
 b=D72VBYRWjd24NvIZ+OzX4n6mAaZzudj+ykEYP7edfpQs3Kj6e1hRXz8KOhEy+4+JHHFpMG0OTqHnzeaHrA5Rbo5vy+ioyeGeL2bXxJwDl6ZPSq2mBJY9V7G4Hptg8XTLkn/9Ek2kW7r/fcpj7b/UeMEMNhucr0fKCTZqDOnJbao=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2653.namprd12.prod.outlook.com (2603:10b6:805:6f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 05:44:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 05:44:07 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
To: "Liu, Monk" <Monk.Liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1629864857-4252-1-git-send-email-Monk.Liu@amd.com>
 <1ef452fc-1f76-8dda-1c74-c540576fe6c6@gmail.com>
 <BL1PR12MB5269567906F233C0B938C32C84C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269E736907243FDF42D97F384C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <fff92742-6d09-430d-1dd6-5e0bb7f6a311@gmail.com>
 <5d0bbee1-599f-1a84-a9b0-0d70d6239255@amd.com>
 <BL1PR12MB52693FF44158D94EB516458E84C79@BL1PR12MB5269.namprd12.prod.outlook.com>
 <e6b8ec75-6378-f267-8f3f-7593b997d014@amd.com>
 <BL1PR12MB52696BB353B97B55C5163C3E84C79@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ed3644d9-2070-9c6d-5a81-de577ffd163a@amd.com>
Date: Thu, 26 Aug 2021 01:44:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB52696BB353B97B55C5163C3E84C79@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d]
 (2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d) by
 YT1PR01CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Thu, 26 Aug 2021 05:44:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 334236ff-df7c-4f50-aa06-08d968548549
X-MS-TrafficTypeDiagnostic: SN6PR12MB2653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26539286638E46DF31E9DBC0EAC79@SN6PR12MB2653.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7gaCPs9gpNceTUKEyCgnmJ383JwmrFAUxFghZaoBBJmxTUrLYu7tAlh9Hk+z92Alrd/tj5oxlYBVa5vFbM4jA2VIIIgBW/9kH+8YZs333U/cCGGMtsYaojZTW9le4PwcWR/MzhmgxP90efOrVpE98fvAyRfc+mryShsbjYOs8nmvmC6Z8wevrK78C8Fvb2LqLKn5DegCTBTydW9ShOi/qWLh8y0KhtRiJd0gVu/t5aBr8OMoZdd0IuveG1LvLkyQkPy2WwqQ5jLxF9XfceZ/p4B2T5cu2C1zsyp/k62BFcnhtyz49ks+Y2YMQGpr1/B1lftJPkqmGYo5fvyFVW/BWVPkfMsa0dVwxso4soM+e2N9k2xvpC7VzwG1+c4o45ERzjX8jIUpBTWPrRPA9W2ck0OWKvOBj9w8fPvob6IpU0t46Att5mH6oFuj2q/8p6mmPQy+uCjguI8zJX3DFVy1vpBfZ4k60gmW4SkSK6j63CKN+lByjkU/l4qB2sz7Vixs2QoXddivBHj/B0ax8ManKHeiEawu+U/LedI/B059cAFsfJ7cm8lZjcXJagPJ9+M/N3rONJOJLgd6nIKhhwkEZFcJfN0gwse6ZyVvfGOoaQGjDk6KE0HrBD0f14VRK4JegqzdzMrnOuT23okGInJy9rPYY+kbKtYgIvwRPon2G4yqmGk70DcQEzFYwiD6sYdSireMK7t+5eTV8Dp1Lp+txqY+5F3FbkpWMU14A8oUdxQz0M7MY111Q04bZU11syW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(30864003)(36756003)(316002)(83380400001)(966005)(5660300002)(186003)(2906002)(86362001)(8676002)(66574015)(8936002)(2616005)(66556008)(66476007)(44832011)(38100700002)(31686004)(31696002)(66946007)(478600001)(6486002)(110136005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxsV1MrQmxvUG1yaVdKV1lVRVgrY2gvamlMelRUd2tjM3hxczFjN2tacXhX?=
 =?utf-8?B?SGNnVkM3ck9pZkxwZmk1bVlNZHo0MlcrWHJhcE8vUE11bXJ4cXRKUHlyL0NT?=
 =?utf-8?B?TkNISU5sbjB6SUhQMGkxTm1lUzVTRTZtQ3RDdHBSaXBlZjhYYndlODF1UjlZ?=
 =?utf-8?B?b0tKTEFMY0FHVXlUSXdYS0l2YVdpR1MrelJsaVFaM2RDT1J3YVBoMGdOSkIr?=
 =?utf-8?B?bEhPSzdMdWc4Y1VYZTgrUlZZZll1TkRhVGI1VGZ3dFBQcmdOdTFUZkxiamcw?=
 =?utf-8?B?amM4Y2VXWjJMQlFPbDd4c1J6UG0rNHcvU1NZNmRxbWdIdjBiYW5XUVQ0aDN5?=
 =?utf-8?B?L2tPZnhkUENwdTdJaTI2N203bVBHR1VEbHIzd1ZNSjEwb1hZcVd0dExZY2FC?=
 =?utf-8?B?c0tlM0hFRHAzVE4zQ0lWY0dnY2licVlDM29SM3FSVC9YdGJWeVllNUZnSDdh?=
 =?utf-8?B?UUN5SXlhZnVoWlVOV0xYTW11ak1Md3pwRDBTRjI5VWlrVWVzaSsyanhlUTAr?=
 =?utf-8?B?dUZWRENzcUpGdUdhdzJGZnV3VC91c0lkSU9vVUw4VW0rYUttYVUxN0djQUQ0?=
 =?utf-8?B?TzJaVWZZTG5pUDZObUoxUk9PdFV6ZGFtc250b1NMRTA5T0FTYS9ab0g0a2lQ?=
 =?utf-8?B?c3lOSlRsQUh4WVRiOHloanNxZ25PdmpyY1lHbEFRd05vUzdJdGlqZnV5SkxD?=
 =?utf-8?B?YkFPcUtzTXRlSzFDSzZLV3k2dmo1L3ViMHpWUVhrUllXaklrRnc0YTAvbHdu?=
 =?utf-8?B?VFlCeFppNDBUS3JkV0J2T2lVVVlXbll5ekVKSkhCM1B3MmM2dkVtQ0NxUGZX?=
 =?utf-8?B?NWtiVTY2WFozY2J5UWJDMnZaZ3ZuU0lqQlphazErWktaNlA0MHc2Rkl4Tjcy?=
 =?utf-8?B?TzlpQXJKYTl0a3BCbDhQdHhUNi9oNUFJZk9kamdCQ3ZVU0R3dk1yV0JHN3VK?=
 =?utf-8?B?U3JET0RxaGk1Z1RucUV2bTluM3V3WVJUT000dlp5L0lYTDFFMklHUjZHWWl3?=
 =?utf-8?B?VUFjTk10V1U3andrUmcwbXpkdW54QkZkNlZtbWx3aHFuaDg3V1hqQlEyUG5N?=
 =?utf-8?B?Ly90NDQ5VnRURkpPZk5qdGxXeTFWblppU21PU05YeVZ0MFFlYWxLSlJzbS80?=
 =?utf-8?B?Sk9NRVpvczJaV1Y5KytzbjFBUFY1dXBsQnRpTjcrVms1ZkxaWUJqYng0Qnox?=
 =?utf-8?B?VHpKbWRNbzNXU0xKQ2kvSTRLWE5hU3NBdUUyaElyK0hsSjhHUUtLL0daUTY0?=
 =?utf-8?B?VXRKV1A4eHUrWVNXbzZ5ekw4TFZCRjlQM3NncUg5SFliK2o4MkJLc0IzMWRr?=
 =?utf-8?B?aTVuWFFqWG5NL3NPdE1qOGZLRjUreURVekIyRHNTbzhGQ1Vha2ZTckwwbnl5?=
 =?utf-8?B?M0dUbjdSUHFPYk8zOHduSXl1ODZTRTRXL0pyQ3FLUmVYcWI3M09nSWd2Z3JO?=
 =?utf-8?B?OWJ0R1RYMVpQZkxuQTlxRy8xNzVKWlFJVDhWNTdnV2NEVkRwNzA3WnNtVEx0?=
 =?utf-8?B?Q1hSVFFNK1kzZzdEcytPUkgrY3NnbHBIYjc1aDhKR3ZXU3hnVko1c1pPK1l3?=
 =?utf-8?B?cW1zRW04TXZMZzIwRkV5SjhkU2FpVDlRUWdQUzVyY0wrUW5QVEpGOXlncGZB?=
 =?utf-8?B?elVjdGJjL0p1V3VqWXNGS2xlSHdvN2dVYXFGakpEd0Q4TU9KYUQzU1dZQytl?=
 =?utf-8?B?L0RZRE14NUVlMCtqL0hCTUdTTnRzNksvL3dVOCsrOTFGdkx6K2V2c2locGxk?=
 =?utf-8?B?cEJaMktGSjlNeG92dEpZNWhFSGRiSm1EZmVTVmIwTmpNU2xEREx2YkU5WExt?=
 =?utf-8?B?alh3RmVYZXp4SHN3RkhtYVJ1RlVGUE1TQTQ4N0pLUXhNK2cwNXd4ZVdXNGpm?=
 =?utf-8?Q?WovTjDC1R++W9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334236ff-df7c-4f50-aa06-08d968548549
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 05:44:07.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0Jc5aFl0WJP979AZ+I+rUS2dKVAyebaxXSTqWIjoEoxYf+4eJWsaYpfR+DuvWToaFliTaMHgGBJjsk76AJfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2653
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


On 2021-08-26 12:55 a.m., Liu, Monk wrote:
> [AMD Official Use Only]
>
>>> But  for timer pending case (common case) your mod_delayed_work will effectively do exactly the same if you don't use per job TTLs - you mod it to  sched->timeout value which resets the pending timer to again count from 0.
> Ny patch will only modify the timer (restart it , actually) when the heading job is signaled, which means on HW ring the next job is just about start processing.

Not sure this is always true, see this specific test we added long ago 
https://gitlab.freedesktop.org/mesa/drm/-/commit/bc21168fa924d3fc4a000492e861f50a1a135b25
AFAIK a ring doesn't have strict serialization of processing jobs one 
after another, especially when 2 jobs are scheduled from different 
contexts like in the example above
which means that in this case the second job might be well into 
execution for some time when the first finish and restarts the TDR timer 
from scratch.


> If the job is not signaled (your common case) the timer is still not touched at all ...
>
>>> I just wonder why we stopped using per job TDR timers in the first place ? Isn't the simplest way to count accurate timeouts for each job is to actually measure the timeouts for each job separately ?
> I'm not sure if Christian can recall something, and I believe it is due to some limitations we found (or some race issue like two job on the same scheduler TO in the same time, which is probably if they are scheduled to the ring almost in the same timeframe)
>
> Anyway I have a V3 version patch, please take a look, it looks working for me


Will take a look tomorrow

Andrey


>   
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Sent: Thursday, August 26, 2021 11:05 AM
> To: Liu, Monk <Monk.Liu@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; amd-gfx@lists.freedesktop.org; dri-devel <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
>
>
> On 2021-08-25 10:31 p.m., Liu, Monk wrote:
>> [AMD Official Use Only]
>>
>> Hi Andrey
>>
>> I'm not quite sure if I read you correctly
>>
>>>> Seems to me you can only do it for empty pending list otherwise you risk cancelling a legit new timer that was started by the next job or not restarting timer at all since your timer was still pending when next job tried to start it again (the common case).
>> I don't understand above sentence, from my understanding for the
>> common case,  if the timer is pending, the cancel_delay_work in
>> beginning will cancel it and then we will get to the line of "queue
>> timeout for next job" since the heading job is not signaled (align
>> with the timer is pending), then the timer will be restarted (for the
>> next job)
>
> Ignore it, i realized from looking that i missed the timer restart in then end of drm_sched_get_cleanup_job or the alternative one in drm_sched_main
>
>
>> And above sequence is actually wrong to me, because we cancelled a
>> pending timer and restart the timer for the scheduler that its heading
>> job is still running there, the whole counting is repeated from zero
>> and inaccurate at all
>
> But  for timer pending case (common case) your mod_delayed_work will effectively do exactly the same if you don't use per job TTLs - you mod it to  sched->timeout value which resets the pending timer to again count from 0.
>
> I just wonder why we stopped using per job TDR timers in the first place ? Isn't the simplest way to count accurate timeouts for each job is to actually measure the timeouts for each job separately ?
>
> Andrey
>
>
>>    
>>
>> Thanks
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Sent: Thursday, August 26, 2021 2:20 AM
>> To: Christian König <ckoenig.leichtzumerken@gmail.com>; Liu, Monk
>> <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel
>> <dri-devel@lists.freedesktop.org>
>> Subject: Re: [PATCH] drm/sched: fix the bug of time out
>> calculation(v2)
>>
>>
>> On 2021-08-25 8:11 a.m., Christian König wrote:
>>> No, this would break that logic here.
>>>
>>> See drm_sched_start_timeout() can be called multiple times, this is
>>> intentional and very important!
>>>
>>> The logic in queue_delayed_work() makes sure that the timer is only
>>> started once and then never again.
>>>
>>> All we need to take care of is to cancel_delayed_work() when we know
>>> that the job is completed.
>> Seems to me you can only do it for empty pending list otherwise you risk cancelling a legit new timer that was started by the next job or not restarting timer at all since your timer was still pending when next job tried to start it again (the common case).
>> For non empty pending list you have to adjust the currently active TDR's timer from your's job TTL to TTL to the next job after you or just restart it as Monk does it here which prolongs the timeout more then required but still ok i guess.
>>
>> What about returning to the old scheme of timer sched_work per job so
>> each job has it's own timer and we don't share it and everything is
>> precise for each job, using the locking scheme we already have today
>> the actual TDR handler will execute only once while all the other
>> arising from the guilty job hang will be rejected (for amdgpu, for
>> other drivers it probably requires same locking or we can move this to
>> the scheduler layer)
>>
>> Andrey
>>
>>
>>> This here works as intended as far as I can see and if you start to
>>> use mod_delayed_work() you actually break it.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 25.08.21 um 14:01 schrieb Liu, Monk:
>>>> [AMD Official Use Only]
>>>>
>>>> I think we should remove the cancel_delayed_work() in the beginning
>>>> of the cleanup_job().
>>>>
>>>> Because by my patch the "mode_delayed_work" in cleanup_job is
>>>> already doing its duty to retrigger the TO timer accordingly
>>>>
>>>> Thanks
>>>>
>>>> ------------------------------------------
>>>> Monk Liu | Cloud-GPU Core team
>>>> ------------------------------------------
>>>>
>>>> -----Original Message-----
>>>> From: Liu, Monk
>>>> Sent: Wednesday, August 25, 2021 7:55 PM
>>>> To: 'Christian König' <ckoenig.leichtzumerken@gmail.com>;
>>>> amd-gfx@lists.freedesktop.org
>>>> Subject: RE: [PATCH] drm/sched: fix the bug of time out
>>>> calculation(v2)
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>>>> The timeout started by queue_delayed_work() in
>>>>>> drm_sched_start_timeout() is paired with the cancel_delayed_work()
>>>>>> in drm_sched_get_cleanup_job().
>>>> No that's wrong, see that when we are in cleanup_job(), assume we do
>>>> not have timeout on this sched (we are just keep submitting new jobs
>>>> to this sched), Then the work_tdr is cancelled, and then we get the
>>>> heading job, and let's assume the job is not signaled, then we run
>>>> to the "queue timeout for next job" thus drm_sched_start_timeout()
>>>> is called, so this heading job's TO timer is actually retriggered ...
>>>> which is totally wrong.
>>>>
>>>> With my patch the timer is already retriggered after previous JOB
>>>> really signaled.
>>>>
>>>> Can you be more specific on the incorrect part ?
>>>>
>>>> Thanks
>>>> ------------------------------------------
>>>> Monk Liu | Cloud-GPU Core team
>>>> ------------------------------------------
>>>>
>>>> -----Original Message-----
>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>> Sent: Wednesday, August 25, 2021 2:32 PM
>>>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
>>>> Subject: Re: [PATCH] drm/sched: fix the bug of time out
>>>> calculation(v2)
>>>>
>>>> Well NAK to that approach. First of all your bug analyses is incorrect.
>>>>
>>>> The timeout started by queue_delayed_work() in
>>>> drm_sched_start_timeout() is paired with the cancel_delayed_work()
>>>> in drm_sched_get_cleanup_job().
>>>>
>>>> So you must have something else going on here.
>>>>
>>>> Then please don't use mod_delayed_work(), instead always cancel it
>>>> and restart it.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 25.08.21 um 06:14 schrieb Monk Liu:
>>>>> the original logic is wrong that the timeout will not be retriggerd
>>>>> after the previous job siganled, and that lead to the scenario that
>>>>> all jobs in the same scheduler shares the same timeout timer from
>>>>> the very begining job in this scheduler which is wrong.
>>>>>
>>>>> we should modify the timer everytime a previous job signaled.
>>>>>
>>>>> v2:
>>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>>> signaled job is the last one in its scheduler.
>>>>>
>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>> ---
>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 29
>>>>> ++++++++++++++++++++---------
>>>>>      1 file changed, 20 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index a2a9536..8c102ac 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -305,8 +305,17 @@ static void drm_sched_job_begin(struct
>>>>> drm_sched_job *s_job)
>>>>>          struct drm_gpu_scheduler *sched = s_job->sched;
>>>>>             spin_lock(&sched->job_list_lock);
>>>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>>>> -    drm_sched_start_timeout(sched);
>>>>> +    if (list_empty(&sched->pending_list)) {
>>>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>>>> +        drm_sched_start_timeout(sched);
>>>>> +    } else {
>>>>> +        /* the old jobs in pending list are not finished yet
>>>>> +         * no need to restart TDR timer here, it is already
>>>>> +         * handled by drm_sched_get_cleanup_job
>>>>> +         */
>>>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>>>> +    }
>>>>> +
>>>>>          spin_unlock(&sched->job_list_lock);
>>>>>      }
>>>>>      @@ -693,17 +702,22 @@ drm_sched_get_cleanup_job(struct
>>>>> drm_gpu_scheduler *sched)
>>>>>          if (job && dma_fence_is_signaled(&job->s_fence->finished))
>>>>> {
>>>>>              /* remove job from pending_list */
>>>>>              list_del_init(&job->list);
>>>>> +
>>>>>              /* make the scheduled timestamp more accurate */
>>>>>              next = list_first_entry_or_null(&sched->pending_list,
>>>>>                              typeof(*next), list);
>>>>> -        if (next)
>>>>> +        if (next) {
>>>>> +            /* if we still have job in pending list we need modify
>>>>> the TDR timer */
>>>>> +            mod_delayed_work(system_wq, &sched->work_tdr,
>>>>> sched->timeout);
>>>>>                  next->s_fence->scheduled.timestamp =
>>>>>                      job->s_fence->finished.timestamp;
>>>>> +        } else {
>>>>> +            /* cancel the TDR timer if no job in pending list */
>>>>> +            cancel_delayed_work(&sched->work_tdr);
>>>>> +        }
>>>>>             } else {
>>>>>              job = NULL;
>>>>> -        /* queue timeout for next job */
>>>>> -        drm_sched_start_timeout(sched);
>>>>>          }
>>>>>             spin_unlock(&sched->job_list_lock);
>>>>> @@ -791,11 +805,8 @@ static int drm_sched_main(void *param)
>>>>>                            (entity =
>>>>> drm_sched_select_entity(sched)))
>>>>> ||
>>>>>                           kthread_should_stop());
>>>>>      -        if (cleanup_job) {
>>>>> +        if (cleanup_job)
>>>>>                  sched->ops->free_job(cleanup_job);
>>>>> -            /* queue timeout for next job */
>>>>> -            drm_sched_start_timeout(sched);
>>>>> -        }
>>>>>                 if (!entity)
>>>>>                  continue;
