Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8763FCB23
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 18:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EA96E0E7;
	Tue, 31 Aug 2021 16:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9F889933;
 Tue, 31 Aug 2021 16:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VK68FSJQdk7hPDB6p40iy98mMa3qi/4BDM3Zjmo0+ucg3SBSb8Qa/fb2ZOrM85//BJCceXdG/SQ/Jfa+yM+hlnebHNwXy8DGymq5YbMVTbDTsqurgxJiRYYkz0LxQhvHF1/R3QDeDXyS6136TqtDcIZ8Cmvq6zIglgjwEQZjjR4KEqDWOecJALF4zwaxl7zHd4YRRM7iCofNqQds0MsVg4zGDFveLYDb0U5iWEV6VvcVA1c+V/+K2q8SjM4LeQ+gy9EQe5YEjAxgAg29QF2ph4pbdDt5k2izSo9ZenL1nzknyWRB4ClkKfz29eqby6iYtDkHSkANzC/qIyx+m9XFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW6capdfZa65gKjMkRg0zbdK5naFiBbuKaEDOmjbEsg=;
 b=GxNw2g8HkrLtqbe/eV3RiHbnHEnHWLqF5fMh+jY15wo7uY4YNu3NnH0CqMA/+FZbgIILdSueCxQ64adaa8UbmJFQJkHtYwveiVrVCfeQ6Dlgs/tYAX5/qs1Or38f9XgMcbYIUm4d01rrK3d7o3mqkfscQzfYj/oLeIxkEF0Ot2E+gCSvA0lerdpB9/0tiHcOyqouIXsm4iKLudHodeEYHMdbc6JU6oZT+YDnh0I3mky1m1ZubdIEiE5Fx1ntJBxYK9w/4WjG+HI2eUH1+aXYjbpdL0UBjwA7NmIP0IUWdlfFjhR5Rt2OYOhk+IuiTMTiz0Pwza2Oehl2LOmdU7CZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW6capdfZa65gKjMkRg0zbdK5naFiBbuKaEDOmjbEsg=;
 b=cAr5B7Jd10m/VjrMccfetLZWORtPJQSxOqGBmcGopos8Hc7F0FDEdw2I8t0vaCk7SKXVs/NdoL818LQbSWzWaCd/2xg8V9XpZsUQTW+0w4fllWhEncOfr/WMJMz3YPSWrFqxVrjIP1fm1AM0iG0rgwVHgbccpp/2OtS8c1EBW1I=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3957.namprd12.prod.outlook.com (2603:10b6:610:2c::17)
 by CH2PR12MB4038.namprd12.prod.outlook.com (2603:10b6:610:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 16:01:58 +0000
Received: from CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df]) by CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 16:01:58 +0000
Message-ID: <acb17005-3b6e-c43b-ce2a-933c0300dd57@amd.com>
Date: Tue, 31 Aug 2021 12:01:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
 <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
 <YS4+1evCjyCA50iP@phenom.ffwll.local>
 <ab9aa89a-c057-b1f0-d02b-3d79f50e97e8@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <ab9aa89a-c057-b1f0-d02b-3d79f50e97e8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::11) To CH2PR12MB3957.namprd12.prod.outlook.com
 (2603:10b6:610:2c::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.46.5] (165.204.84.11) by
 YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 16:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb85afa7-6c6a-4fa2-0364-08d96c98a944
X-MS-TrafficTypeDiagnostic: CH2PR12MB4038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4038D1238511F89BFBCE592199CC9@CH2PR12MB4038.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsacTzBle1/D5dabOZ8tPv0LWrS/TZRctv8GOb7MFtAyE0wvI17i7mfNN17iwBmMWtJKPAVO45kO8oWPJ8Ey1wBAwQJV/wNhCe6zk7QM4Xi9Mmn0PwkW6IbUsAKxLMf0wVdcFjnyJiJzwNuld/vlECmCZQtjzjp1VxK95kOXzrQdW2QEBwdfc3UudU78QDg5L94My0YKuKWLosvL3U82Zh0Ql0qu1sUv+O2oQqFtil4e+COx1HEig/bML+UovQzW/qoi07MHSErwREKN/C3RzHoNa0qsJGZard5wk/v/Gx2K3O1yf6pr/em8FbTqSKS1bPPFk3LmnATg2BC0W9QCODsIRG/l7qETvTYy3HrgjFgrllcLpE61gj3ciI2N1hxJFO2v1fXMOqnDKy9TwmJu5LqpdilyOLTALcpbgpKqBG0pdqQNC2yzBasGEDT6sKy04ZNfKSyf5WWw1KYVxLklNV0VJ3OY+oIUVZXdwljAGIgk9MxSryhS0qdmEQy7bKGPfKud+GyM4EjqZQeJoJJTVthwV98tSuym6LttXjAh7wIEMVxSLJ39w2ejcI0Q/IoiLNuJNM1dMyxyCxqPOCbvITthog0TbgHaSQh9LsdmridDFOw/9RPhzffIbPO98SOMxI9EukZ2aRmirbaai/dhqfp1lxH/kkrlpHEGmhwjZNuHoylTLH2mt4kaYbwxFOoUQkPoGIKhzcXcvZ+MaW6QECi00irQITR7xJ9hA05lexD9pdPHoQFrKZojndDsxCq7Ap1ZFGhvb3/3m8vpEPL7+XYgsy7CcXNzlAfYn/vajNgCBeHKsLHyT7L36bjcmp0464M6ROrz4E46iIap77vH3ttQPhU2ThhJUcTPzfsOWlM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3957.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(316002)(31696002)(53546011)(44832011)(66946007)(66476007)(6486002)(2616005)(186003)(8676002)(54906003)(8936002)(86362001)(66556008)(45080400002)(36756003)(31686004)(38100700002)(4326008)(110136005)(16576012)(956004)(83380400001)(26005)(478600001)(6666004)(2906002)(966005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBpRUhobnl0QUZLZ1VIWVMyVG41Mlg5bmx3T0NnMVVzMVovNFc3clpxTnpu?=
 =?utf-8?B?R1hnSE10aWVhMlljZTFkVDArUTlRT1FzeGpiL1FRd1BKU2lBQUNjMXo3UWs5?=
 =?utf-8?B?VVRMLzdVa1Z6VEFrb1ZwSzFpa29PNk1NU2NuQXVScmRZY0tBTnFoQXJpUVpz?=
 =?utf-8?B?WUFkM083Z25OY1dNd3dNc2U3RlhiQ2pMR2hmbTVaMXoyRHJjRE0wRElnNnhZ?=
 =?utf-8?B?cmNmWGd5SnVKQWpINGcvcmVDeVVSbDZ5QTdHTHFyTjVzSnMxbnptazJrMWQz?=
 =?utf-8?B?aUFxUW9nR1F1Yjl2QlM1czVYYVBPK3ZURHhLUnpqcGwrem9Yc1dwdk5mVUZU?=
 =?utf-8?B?MDZKMFNnWStCUW9VaTlHcis4K2YwaUJRVlRsQkVTSTRDTHhuZ3BHYmZUbzNZ?=
 =?utf-8?B?VTdLYmR0YTM4LzhtNHJGSi8wcnZuUHluWFpmWUhBRzk2czM4SSt3RWEzOFZa?=
 =?utf-8?B?eUFzY3RVVWdDRnpEcTdMa1JOZ0R5UWdoSkhuNDFDcFMvaXdRNUFidnJheVlK?=
 =?utf-8?B?UnRhY1Y0eUU2QjF0MzF3Q3ljWUlTMndlZGlUVXJCZTMrUmVxWElTZ0xiYlB1?=
 =?utf-8?B?bzlCNncybTh0MWZuMmtUZGtqL3pkL0ZUai9ORnI2c1pxbUpidVJDMGdwUWNR?=
 =?utf-8?B?Um9qVG5tN1NEbHpuMk9YRTN0ZlJPVTZrMUUrTHNLUmtvb3V1Wkc1Z21HZ3k0?=
 =?utf-8?B?L0Z6MmJVUjF5a3E5eGpYUFNFdE9mUGVoTjc0S1BqWEZtWG50TXdnN3p2ZExV?=
 =?utf-8?B?cTVYVUVxaWxGT2RXdlZxV3I1SnVTa2lYbGFucHNtUDJLVEVjaHR2VGdqejZn?=
 =?utf-8?B?bGZSUmRWZGxWZU1sSGpaTi9sTzB6SzkrdXI5NjRzc3FBYi8yMytCazZFdzFw?=
 =?utf-8?B?OHpUdjhsRDd6U1VNRmJVWWRoNmFQdjNZOFVLOTJnSzhRTWNZYWpuU0gwQ3d0?=
 =?utf-8?B?Q2V1S0R1bzdybHRUMG9EMDZZcDRCZ1lnQUtVbWkzTG81NGZCczJTclo3K3B4?=
 =?utf-8?B?OHlCeDZ2WW9xVHo0RzRva0RUU0EyWS9rUFVrZEh5MWRER0FYYVRab1NMdGt0?=
 =?utf-8?B?V0RaQmFEVFRLZ0VtVmI3TS81ZHViWTM4QVNreXpzSEpKMzdMMjh0N2RqTDIz?=
 =?utf-8?B?QnRxeTFvVkdGSjhPU3o0ZHZLeERYZUd3eVRDaURlOVpFL1FwUkwzMkVSWXBi?=
 =?utf-8?B?ZXFwVDhCTUUzbFpvcEFHdklTU1VnU1FkTktxaDhJQytrSnlGYTVzMEVtbmZC?=
 =?utf-8?B?QkdwQTRDUFFsVXNGcnBnTHo0aGQwMGExZlk5ODFXcnpiRmluajhYdFQ1cUx6?=
 =?utf-8?B?Zm1SbWpmNUxYb1NvdFJEU01HWDIyNVRlSHZ5S25Sd2ZUeDM0RUVpY1YvVmx6?=
 =?utf-8?B?VVVzNUtwOC9kWSt5ZDBNR240TGlES3hIYTBadWcxd01zM2NlSGFQWE5RSTVK?=
 =?utf-8?B?ZzIxdFNldXlJeFBDYUg4eVdFWE1OUUFnWVZOaGJ0YWVHVjNxZ0VlYWZ2VEJ5?=
 =?utf-8?B?M0c0UFExVndINCtVSHkzaWdPMzNoc2hRYUpDU2JtOVBEclA5Qk43SEFHWis3?=
 =?utf-8?B?amt3ODVKQ1c1TXR1dHhHRUpnQUZOdWhoWndseVhtR3lpY1FaelM5NE1ZRGpD?=
 =?utf-8?B?aFovNE5DQWdRNlZQZW9IcEZuNld5RktiMUtjT0NjRlV1MUJMdVFuaTN4TkVh?=
 =?utf-8?B?VTJ4a2V5WGFMTEk2dE9TeGtheXNwY0tkQmtkY3BnOXhSNDJGRitFV1RBeXJE?=
 =?utf-8?Q?/YxVd9e+s+98WW9yU5ptNX2/gc9CGgWiRBYBGwn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb85afa7-6c6a-4fa2-0364-08d96c98a944
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 16:01:58.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/X9YMHCRrwlY0d0kDOyvqZFE5yuT5euZmcqs/zAyEdyaUfay4yjoaT3cF+8LsAu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4038
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

On 2021-08-31 11:23, Andrey Grodzovsky wrote:
> On 2021-08-31 10:38 a.m., Daniel Vetter wrote:
>> On Tue, Aug 31, 2021 at 10:20:40AM -0400, Andrey Grodzovsky wrote:
>>> On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
>>>> On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
>>>>> It's says patch [2/2] but i can't find patch 1
>>>>>
>>>>> On 2021-08-31 6:35 a.m., Monk Liu wrote:
>>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>>>>>     1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index ecf8140..894fdb24 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>     	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>     	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>>>>> +	if (!__kthread_should_park(sched->thread))
>>>>>> +		kthread_park(sched->thread);
>>>>>> +
>>>>> As mentioned before, without serializing against other TDR handlers from
>>>>> other
>>>>> schedulers you just race here against them, e.g. you parked it now but
>>>>> another
>>>>> one in progress will unpark it as part of calling  drm_sched_start for other
>>>>> rings[1]
>>>>> Unless I am missing something since I haven't found patch [1/2]
>>>>>
>>>>> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PrrvFHAwDeLlbcOctlKHsCFs9%2F56XNVzoLVcT1RoJgI%3D&amp;reserved=0
>>>> You need to have your own wq and run all your tdr work on the same wq if
>>>> your reset has any cross-engine impact.
>>> IMHO what is problematic in serializing vs. locking (with trylock and bail
>>> out like we do in [1]) is for multiple TO events arising from same reason
>>> like maybe one job just waits for another and once first is hanged the
>>> second will also appear to be hanged triggering it's own TO event.
>>> In this case multiple TOs event will trigger multiple resets if we serialize
>>> but if we use lock with trylock the second one will quietly bail out.
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L4903&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kxSWBoshVTLMMFIFZdPsP4MBgUAoC%2F3szo9GUemSRLY%3D&amp;reserved=0
>> Hm so I guess a single wq here, that will hold up all other TO. And they
>> should recheck whether the job is moving meanwhile.
>
> Can you clarify about this ? What job should be moving ? The dependent job ?
>
>
>> Also unless you use hw semaphores the job shouldn't even start before the
>> deps are singalled, so not sure how this goes wrong?
>
> What about a simple example where
> we actually can submit a shader on one ring and a simple
> WAIT_REG_MEM packet on another to wait for the shader to write
> a specific value to specific memory location. Here you have both of them 
> started
> in close proximity and no explicit dependencies involved (at the 
> scheduler level)
> and yet if the shader hangs also the WAIT_REG_MEM job will hang.
>
>
>> The vm_id flush stuff can make things a bit more fun for your specific
>> case, but in your specific case you have to run all TO handlers on the
>> same ordered workqueue anyway (because trying to paper over this in other
>> ways doesn't work imo).
>
> I didn't get this one.

So, awhile back I tried to "serialize" this by moving timed-out jobs
into their own timed-out-dedicated list, then freeing them asynchronously,
but I never got it to work reliably due to races with low-level drivers and
assumptions made way back.

My idea was to atomic-move timed-out jobs into their own list, at the time of
timeout, and later asynchronously to free them (or better yet, inquire about
their state, and free them or move them back--ideally the inquiry is atomic
and done at timeout time before being moved to the timeout list). Anyway...

But I found out that all these knobs and levers weren't in place and I was
getting problems with it and it never materialized.

The paradigm was loosely "let someone else do it", like, "on an event,
move it to a list, and let someone else handle it", or "on an event, mark
it, and let someone else handle it". (loosely borrowed from an iSCSI target
I did many many years ago--it worked well and there were no races, even with
out-of-order executions.)

If you guys have any ideas to that end, maybe we can try it out.

Regards,
Luben


>
> Andrey
>
>
>> So I think this should all work, no need for tricky cross-scheduler
>> locking.
>> -Daniel
>>
>>> Andrey
>>>
>>>
>>>> See
>>>>
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fpt%2Btho2W4woHKQ861cEbBzoOidS6zuDhFi%2B1UTwWJg%3D&amp;reserved=0
>>>>
>>>> for the ->timeout_job callback docs. I thought I brought this up already?
>>>> -Daniel
>>> Yes, this discussion is a continuation of your comment about serializing, I
>>> mentioned before that you proposed it.
>>>
>>> Andrey
>>>
>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>     	spin_lock(&sched->job_list_lock);
>>>>>>     	job = list_first_entry_or_null(&sched->pending_list,
>>>>>>     				       struct drm_sched_job, list);
>>>>>>     	if (job) {
>>>>>> -		/*
>>>>>> -		 * Remove the bad job so it cannot be freed by concurrent
>>>>>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>> -		 * is parked at which point it's safe.
>>>>>> -		 */
>>>>>> -		list_del_init(&job->list);
>>>>>>     		spin_unlock(&sched->job_list_lock);
>>>>>> +		/* vendor's timeout_job should call drm_sched_start() */
>>>>>>     		status = job->sched->ops->timedout_job(job);
>>>>>>     		/*
>>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>     	kthread_park(sched->thread);
>>>>>>     	/*
>>>>>> -	 * Reinsert back the bad job here - now it's safe as
>>>>>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>> -	 * bad job at this point - we parked (waited for) any in progress
>>>>>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>> -	 * now until the scheduler thread is unparked.
>>>>>> -	 */
>>>>>> -	if (bad && bad->sched == sched)
>>>>>> -		/*
>>>>>> -		 * Add at the head of the queue to reflect it was the earliest
>>>>>> -		 * job extracted.
>>>>>> -		 */
>>>>>> -		list_add(&bad->list, &sched->pending_list);
>>>>>> -
>>>>>> -	/*
>>>>>>     	 * Iterate the job list from later to  earlier one and either deactive
>>>>>>     	 * their HW callbacks or remove them from pending list if they already
>>>>>>     	 * signaled.

