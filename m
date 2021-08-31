Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3153FCEDC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94A889A91;
	Tue, 31 Aug 2021 20:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8789A91;
 Tue, 31 Aug 2021 20:56:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnE1tLPDFswByxp+0u49pon6f/ZuR8Tx7g5UWyNy5+FZ6WuAdKJToz8p+mNIkfC556za0shmY3Gju4CnDZaG59csIH36jPN54Wm/+NnHLVKFhg5N+xQtN37CUWNc13RbHRiXjM2c+Z7o4jp4kaJFcc7KtC1F8U37Jm6isU6dWRfUa0OBozJ7dSss/PxMWfdMW2zmH6sbJVtDkNsKggkXiGjf8ygD8dgh0ZNbJ2/oUXlHdMSpwhjbKxj3+8BvQZvCwysa5CCmZSt015J0Y2c8DeuaLhO9Bd3R7TaK3H9/Ktfsy9eCx2UAlkVFAZv4k+PC4ksOT/OZ1SHuiEAoB41ohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8RhxPwIU3Q7D5i5NUD0v6Td8RieCXkZsCseXrzZipg=;
 b=hFNV/ABKDRCPaelsKgIf4rAMNREn46sznWNhYAV3HpMgyjX36i0KSEoctnOqFIDLiQ0jvwbbbKf1kzxKNpuFm4oCLkXaoEtiNtKAOPSZ8xLQWKub9Cg1zlcZSTTR5HQNYXHTZO4W4+9CVKKES0qOFQtkrs9yezfgDG72CA5ZWeKQ4dHzYcLX2H0HM85Fy3DcZS/PMn1CJQKvM5pbAgtMvwFatXYXvXvCCpJsT2yarT7QNZz9rJn+8FI8qQJuqqtatd3RHwL5CzemVDIkm2Oh1S8PlerPhfYn/UIQ6gfbpt9XaJc/h2Lo1waB7rFIOQN6Tvt6fdt4jzfvsJX5uv0Ptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8RhxPwIU3Q7D5i5NUD0v6Td8RieCXkZsCseXrzZipg=;
 b=rVpnndvwHTnJNkWTbFLRRYeFbTD8KwWgK/RfcjxShDkhV+SoZR7SLpQFpd1a83rZSPsLUrSQx6i/6a0R/KfAMR4MgI4SE8WoU5iwXvjKRKhWYvxwp0YutOjmvJ/5qJoLbCLqbdtv5y2r3m8zSxw96E78QpKRRf5GO+RvGnEZmrc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 20:56:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 20:56:06 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Luben Tuikov <luben.tuikov@amd.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
 <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
 <YS4+1evCjyCA50iP@phenom.ffwll.local>
 <ab9aa89a-c057-b1f0-d02b-3d79f50e97e8@amd.com>
 <acb17005-3b6e-c43b-ce2a-933c0300dd57@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <41967bb9-f1ba-3090-aedc-e22397655647@amd.com>
Date: Tue, 31 Aug 2021 16:56:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <acb17005-3b6e-c43b-ce2a-933c0300dd57@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 31 Aug 2021 20:56:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 814b1866-df8d-48da-bdc9-08d96cc1c031
X-MS-TrafficTypeDiagnostic: SA0PR12MB4493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4493FD651EB6F7526A567867EACC9@SA0PR12MB4493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruabQAQlC8EwUpo1dx//Czel2U4tNIbFOnR6k9WqrZ8P44FZ3W1iEkl+h32AKYU8cSgiRpK++skhTYmUpfh35Jz3dFocraC0sBQ26ofpAZ8WILj3B+y3eLp4xMWLggGTwLF705S+csnOyE/x5D7qxYnBooOr5NY9kSKLToCYLsg8EPZ/Hq2axomOgCPCu6cr1TASGOgANoOywRLvecYTCkJMwEAzwO8OJnOAtH55dpP+USR+qGgGPVYmSqPUUNJmvVVTSa89dJNONLRfUtI2cfslY7Fn4eogXPI/VaLff6QY9RcAh+jlKmsYPRe7jgZgYVLeSexqRzGa2+1XVLV+rVNVttKSlATdfuIuYB+Wd8BoKwWDbDgw3wVhc0Ls2ItaQndxD0w2UIsnSgk66/4lBSwRBgMvIYSCQG1983cmPp3+7Q6zBEL2N9NhcG8ZTQaff/NKEP19tgopR/fvHCPMhIH7zdPkIbCdP4uSq97LB5z2e9bzHQFP7OreDtRxNiN6qXSEwtCb47I2V0ag2XnYUj8+Unc9eVl4JjXoi+knLQ9qRGWrnjdKwudr3wxdHBOgsInXEiCjUlvq1Ax3hzh7iZNOvbXMKdnnfDLJ2+B9SgGpF49KWdRrDbbdYbVlbcLZskO8JXqVKyqINKAAK4NJsnZ7BVBtj+8dmzYjFGlsbWxqqk134Oxw8QE9g/3ZD3NRDvSvgj5b50y2AD4c3NLAUfIRz544l5Jyar/NORuZv1olDYyTKVIzAUSqOSnTNKfL3Wxna+20lqkKILQ+1loWf3ou18Axr4MfD0PW22nL1sxg2fOK54CzHMX2XEaLU1O106lk0GtRWlV+Pkx/LVVzHgfWuYW+rc+zmcAFfOSd8E8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(8676002)(31696002)(38100700002)(8936002)(53546011)(110136005)(508600001)(186003)(45080400002)(66556008)(31686004)(5660300002)(86362001)(966005)(2906002)(316002)(36756003)(4326008)(2616005)(54906003)(83380400001)(44832011)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1CS2szaFhDbHFqNCtrVjB5WS9VYzYzdlVZcEVuRXYydTVhc1ZaSFNJK2dO?=
 =?utf-8?B?dUx6amJ0bTdrbzZDNXIxSkFkdVBhZ0VwM0pkdEhCQUFsa0F4N3FSbTFKYUts?=
 =?utf-8?B?MmJueHNyT3BvWGZGVEJkRHN1d2VUOEJoV24xeFpFeExSclRPQzc5Wi9WUjhX?=
 =?utf-8?B?ZEVWMXZyYU9GNmtVTGlzdzNvbkxjQXBxcjdJdkQ1ZzhBY0tObVd0VTdBTzVP?=
 =?utf-8?B?Vi9VWVZrbENHOW9CUGRTQWdDR24wYkJlSzV1WEF0ZU4xeXp3aTdwSlh1SEhU?=
 =?utf-8?B?NHBVVlViS09QYk94M0NvU0JHMWpQWEk5bFBxL2l0NG1EYzA0SnY1RlB6TkNI?=
 =?utf-8?B?Vzk2UExPbDd3QWpJWTFobTdKbTF5dWdZaG93VHBBSUNEb2ttSnZka1VaV091?=
 =?utf-8?B?K1g1L2pjRitVMFV3a2NBWXNSSHozMFlTRWt1Q0dHMHB5RlZoYW1iK3JKU3BR?=
 =?utf-8?B?NTB1TG5DSHhUakpJR2lvTDJFNVo1RGx0L0lzSCtEbEtwOUhzdHg1QWxCLzJB?=
 =?utf-8?B?aVVrTTV1ckxpTlQwQnA0L1BPWnlSVTRNeWd6ay9CMTdrU09JL1VuaHJhazh5?=
 =?utf-8?B?cmt6dERMbzRRSXZjWlBKZUEzMjJkamgzTU5oWUtlWnhOZW1SMzR0Z2lGYStT?=
 =?utf-8?B?MEJ2ZWpqU1phc0UrTm9PL1pOYkFNYmpQajQwRFNHSE9keEppK0lWR2NCTFRX?=
 =?utf-8?B?S3gyZUVXU1VNNkp2Smt5eXVXazBHbHcrNW5NbUh3OGpDNENMdDEwMzY2aU9i?=
 =?utf-8?B?SUdFMytucmFTdGM0OVo3bWZNUjlubmdjYy9LSzNJenZZbzFJTWdYMmdhdGhU?=
 =?utf-8?B?ODlLWkZTSFlWMnp5MXo5NFlIMjdDbGo0U2NIUFJ6WWhLVHJ1UEw5MlUyeXNp?=
 =?utf-8?B?UmZyNWZkbm1JMjRxK1dia3VsajQydXJvVXhIRlpVNkwxM3JBOS9teUZnekN6?=
 =?utf-8?B?bWttYnk3Z2hvaUR3QTFpRTBHRWQrWnNuc3hzT0pFMGZNUlF6ZVdLMUgzUUlG?=
 =?utf-8?B?enhWQnRRMWxOcjJiZlBGZzR4eFFKMzNYTUwwT1VIU2svN3I3REFkemViVGhI?=
 =?utf-8?B?M00rQWZ0c1Bsc1lvK0tERmx1TjJtSmc4UFltRHRCUjNaRDk0d1pSa1FzUDMz?=
 =?utf-8?B?VmFNaDhhY0JnM1gyTFB0RW1LTTFWa2VtTyttdGduMmRBNEpCNkVWVWNPd0Uw?=
 =?utf-8?B?RkxQai96S29lQjdIZUJxWDBrcFhSbzJSUmpkMkdMMnFvSnZMNExWM1YrUmdk?=
 =?utf-8?B?RWdUWWZMTUxKVjNYOVhZVWpQbHA2ZGVWOVFaZ1RPckQ1WndHM3g1TEQ4WWhB?=
 =?utf-8?B?OXFpeWU5K1BNSzhBZEhETFpzaFVMcXA4OEFQT0NtMllTenE0Y0R1eWNlY2Ny?=
 =?utf-8?B?TVpQNHlTZUFVSXZMUlUySmJKSXhuQjhEOFdVb09XRU1yZVpNRlB2ZmFGTGx4?=
 =?utf-8?B?c29oS2poN2p3a1JFZU1IU1ZyS2xRTVp3TnNJOVkrd09saERUc1dJOUJaU0Nz?=
 =?utf-8?B?QXNBai9ERTBseTZPRVZmNlU5bkV1U3MwdHl0eEVYYThrZFlHMGFoTzlINGFY?=
 =?utf-8?B?QW11OU54bklBaHRra2JmUzkrY1U2WWFhSHFWRGhUM04vemdPQXZNUWZRVG9o?=
 =?utf-8?B?QlVoTHhRNnA3YUlsQnB5Yys2eFZjTndOZUdtakh4OEl4UktwWWxYUVZkZk00?=
 =?utf-8?B?QlgycVAyUHo3TG9jMy9xOStuSGVNVWM2Q0QzZjJjeWp6MnhxZGhJZzZoWVRH?=
 =?utf-8?B?SUlHL0wrK1VNYjMyMFN5ZEJ5L2xsTm1nQlR6QW5zbllSbTdwc2kvUmNrVmFL?=
 =?utf-8?B?aG9sdHdCblRlcjdyWDM0L2ozUEoyalg3RXg2aGxmZ0V6WmdtQWFubmtPSjV3?=
 =?utf-8?Q?bjcplCRV795Af?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814b1866-df8d-48da-bdc9-08d96cc1c031
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 20:56:06.1207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsGiBNzFHegcZJcKytV1PqEdZsdySUrGSj5BDRsdsBhqU0bkaGDYFpnqz+Urua+y6aRedDb1gRDPoaVUR180vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
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


On 2021-08-31 12:01 p.m., Luben Tuikov wrote:
> On 2021-08-31 11:23, Andrey Grodzovsky wrote:
>> On 2021-08-31 10:38 a.m., Daniel Vetter wrote:
>>> On Tue, Aug 31, 2021 at 10:20:40AM -0400, Andrey Grodzovsky wrote:
>>>> On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
>>>>> On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
>>>>>> It's says patch [2/2] but i can't find patch 1
>>>>>>
>>>>>> On 2021-08-31 6:35 a.m., Monk Liu wrote:
>>>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>>>>>>      1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index ecf8140..894fdb24 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>      	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>>      	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>>>>>> +	if (!__kthread_should_park(sched->thread))
>>>>>>> +		kthread_park(sched->thread);
>>>>>>> +
>>>>>> As mentioned before, without serializing against other TDR handlers from
>>>>>> other
>>>>>> schedulers you just race here against them, e.g. you parked it now but
>>>>>> another
>>>>>> one in progress will unpark it as part of calling  drm_sched_start for other
>>>>>> rings[1]
>>>>>> Unless I am missing something since I haven't found patch [1/2]
>>>>>>
>>>>>> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PrrvFHAwDeLlbcOctlKHsCFs9%2F56XNVzoLVcT1RoJgI%3D&amp;reserved=0
>>>>> You need to have your own wq and run all your tdr work on the same wq if
>>>>> your reset has any cross-engine impact.
>>>> IMHO what is problematic in serializing vs. locking (with trylock and bail
>>>> out like we do in [1]) is for multiple TO events arising from same reason
>>>> like maybe one job just waits for another and once first is hanged the
>>>> second will also appear to be hanged triggering it's own TO event.
>>>> In this case multiple TOs event will trigger multiple resets if we serialize
>>>> but if we use lock with trylock the second one will quietly bail out.
>>>>
>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L4903&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kxSWBoshVTLMMFIFZdPsP4MBgUAoC%2F3szo9GUemSRLY%3D&amp;reserved=0
>>> Hm so I guess a single wq here, that will hold up all other TO. And they
>>> should recheck whether the job is moving meanwhile.
>> Can you clarify about this ? What job should be moving ? The dependent job ?
>>
>>
>>> Also unless you use hw semaphores the job shouldn't even start before the
>>> deps are singalled, so not sure how this goes wrong?
>> What about a simple example where
>> we actually can submit a shader on one ring and a simple
>> WAIT_REG_MEM packet on another to wait for the shader to write
>> a specific value to specific memory location. Here you have both of them
>> started
>> in close proximity and no explicit dependencies involved (at the
>> scheduler level)
>> and yet if the shader hangs also the WAIT_REG_MEM job will hang.
>>
>>
>>> The vm_id flush stuff can make things a bit more fun for your specific
>>> case, but in your specific case you have to run all TO handlers on the
>>> same ordered workqueue anyway (because trying to paper over this in other
>>> ways doesn't work imo).
>> I didn't get this one.
> So, awhile back I tried to "serialize" this by moving timed-out jobs
> into their own timed-out-dedicated list, then freeing them asynchronously,
> but I never got it to work reliably due to races with low-level drivers and
> assumptions made way back.
>
> My idea was to atomic-move timed-out jobs into their own list, at the time of
> timeout, and later asynchronously to free them (or better yet, inquire about
> their state, and free them or move them back--ideally the inquiry is atomic
> and done at timeout time before being moved to the timeout list). Anyway...
>
> But I found out that all these knobs and levers weren't in place and I was
> getting problems with it and it never materialized.
>
> The paradigm was loosely "let someone else do it", like, "on an event,
> move it to a list, and let someone else handle it", or "on an event, mark
> it, and let someone else handle it". (loosely borrowed from an iSCSI target
> I did many many years ago--it worked well and there were no races, even with
> out-of-order executions.)
>
> If you guys have any ideas to that end, maybe we can try it out.
>
> Regards,
> Luben


I wonder if we really need this serialization at all, if we do HW fence 
embedding
at the drm_sched_job level instead of doing it only for amdgpu, and 
modifying all
the drivers to support this we can both remove this hack and solve the race
against concurrent drm_sched_cleanup_jobs job freeing just by taking 
reference
to the hw fence of the job at the beginning of drm_sched_job_timedout

Andrey


>
>
>> Andrey
>>
>>
>>> So I think this should all work, no need for tricky cross-scheduler
>>> locking.
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>>>
>>>>> See
>>>>>
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fpt%2Btho2W4woHKQ861cEbBzoOidS6zuDhFi%2B1UTwWJg%3D&amp;reserved=0
>>>>>
>>>>> for the ->timeout_job callback docs. I thought I brought this up already?
>>>>> -Daniel
>>>> Yes, this discussion is a continuation of your comment about serializing, I
>>>> mentioned before that you proposed it.
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>      	spin_lock(&sched->job_list_lock);
>>>>>>>      	job = list_first_entry_or_null(&sched->pending_list,
>>>>>>>      				       struct drm_sched_job, list);
>>>>>>>      	if (job) {
>>>>>>> -		/*
>>>>>>> -		 * Remove the bad job so it cannot be freed by concurrent
>>>>>>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>> -		 * is parked at which point it's safe.
>>>>>>> -		 */
>>>>>>> -		list_del_init(&job->list);
>>>>>>>      		spin_unlock(&sched->job_list_lock);
>>>>>>> +		/* vendor's timeout_job should call drm_sched_start() */
>>>>>>>      		status = job->sched->ops->timedout_job(job);
>>>>>>>      		/*
>>>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>      	kthread_park(sched->thread);
>>>>>>>      	/*
>>>>>>> -	 * Reinsert back the bad job here - now it's safe as
>>>>>>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>> -	 * bad job at this point - we parked (waited for) any in progress
>>>>>>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>> -	 * now until the scheduler thread is unparked.
>>>>>>> -	 */
>>>>>>> -	if (bad && bad->sched == sched)
>>>>>>> -		/*
>>>>>>> -		 * Add at the head of the queue to reflect it was the earliest
>>>>>>> -		 * job extracted.
>>>>>>> -		 */
>>>>>>> -		list_add(&bad->list, &sched->pending_list);
>>>>>>> -
>>>>>>> -	/*
>>>>>>>      	 * Iterate the job list from later to  earlier one and either deactive
>>>>>>>      	 * their HW callbacks or remove them from pending list if they already
>>>>>>>      	 * signaled.
