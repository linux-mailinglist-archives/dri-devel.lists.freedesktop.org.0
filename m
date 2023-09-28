Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AD7B1FF3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8610E674;
	Thu, 28 Sep 2023 14:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8015210E670;
 Thu, 28 Sep 2023 14:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAqyXS1K/FkqKicflV17W85p70Wa52qkhhCWGqhqar4THIkG17aM/+YT7MLKzUJdqrcKpJ9zh8S3sGNK4TKSa3VqrmXwezGmfnWU1cR2EjLqm1inTSi3eDq++0k1qNl0vyb09tJ5TF/akX34nwmEYyRfJn2eVFfD48SOFaVFRqhGgLM6f2CP5luiVM9f9CET+PKZZczINdWb5rzHwXIXqHv+qQED3j0xn8yIyHcCWkNaraXVa9qphEZU9m+RxLXd11vFP4JDg0u4aRCOBLApAYnCqGmUOfl8MbHy7uUhOfB0R4fgyLrxAx5a1xCDyBomJostVBDreFn31BZAlVyYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JxnnYJP1dMR5Vk3hz5vFWM5XxaJiiKSywNksnfJaS8=;
 b=ffd69s5ixI1Sog3z3nE7JTwS2GZqgpkjvX2Nj8xwOT+R2HktV8lXz41BK9tS8pKsXV0F23BEfb9c1j8gJvJlNSR+wqU0G2l/NsvzdGsj+UkbVnTGsdwi8O0T95fPoxLnmhZhRlZ7nCBdS3UCyV9ME+wccEB98b/Q9SS8LWzpqmk/otNc7Kx/dsSsVCkFWUVjbHRLoBMNlGutMQV+o8HnufomfRsXS4iFZ/YKOrQZiBcJ1e/3Vdx38jmsObSMIfbPCXxcLKLlXL6nZrKUoG8nvIpd6NI9Be68NSqOYYipDC7Utr5z4yc9T8TyPdR9eJe7D045mUvtMcCFMrSdJYtLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JxnnYJP1dMR5Vk3hz5vFWM5XxaJiiKSywNksnfJaS8=;
 b=pQW975BQE3143p6PlYODfsokBQAst6AtMI45JYKkeruoRdJpdmD4qeSmKRqWvdMlAwrd3VqW6NtyK+Ubgv6hQvKtXIneCpZCXeD5YFmOW9dp6xbi03R3AtFTCLk4JbXixObBt/5DPPN8an0FJoCRgfwNYZZq3XlX8qnRAL7UCwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25; Thu, 28 Sep 2023 14:44:49 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 28 Sep 2023
 14:44:49 +0000
Message-ID: <1c0b9e1d-c990-437c-a8ba-5bb58e5872a0@amd.com>
Date: Thu, 28 Sep 2023 10:44:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
 <20230928100209.37df66f3@collabora.com>
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
In-Reply-To: <20230928100209.37df66f3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc36f2b-afc8-49c3-3555-08dbc031775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPd23O8on8b/BF5aOazxFIbwwcJzL4EQH/y2KNHo9ychbTSzTA29RSCNjvbvBFf7+WGYZb4W16J4pU0bbRRpHMRxeQqQVs1Z7br3jCOQ+fVplh8qmsItIDPghR4/omVGsjvtgv/RUp57BC7oIccpUZ6Wq1DOtaR461r80A78UkWZESqQ/3IW/1B/uFW4FudVLSdVHiVLOnGylPknRpLdOWHz46KZMzK6wvYs2SlWGsMe2ZOP+2QO8OOJsBym5qu+E7gsQ1t91NKcS1ZnmTVTLOGBEVHr5gk8x1mlqomDrJOKIeCW5d18/qeDZ3lgAxTfVmfQfFnO9iyzB7HQVE6oQuFfR5kI1hJBdFLBFw7lriSYqFljF+gXj+Z6hziqbbeSkt2YDkoMYAainrA9RPuexmVamFchAl6EqIYMLBf6ld8R1v/H/IjOluhuCMeHXrA//fqiL/EHOeTuvP+yWaEJjxUk1K9FJEW32CKp6Z5+Idzxtep9y2OLx68hvks5Ix+FX9gNwdN/Cv12zjkkVQm/D1t9bqEwKdfJWAze8VehtYD87bJ1AP9aJldxDJDkWRHgTWq5/taWFnR02Ll8RfZ9kDopp/T8Zp84lT2AtcMZqf5h0uw+rNz1+JAzTFf7UxA2MArQmsfNALxI2iRkuasyaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(478600001)(44832011)(38100700002)(6486002)(5660300002)(6506007)(53546011)(41300700001)(66476007)(66556008)(66946007)(54906003)(110136005)(6636002)(316002)(66899024)(4326008)(8676002)(8936002)(36756003)(83380400001)(86362001)(31696002)(2906002)(66574015)(31686004)(26005)(6512007)(7416002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlIrbndsaHhnU21XdTl6cUdPZEJ5dk5NWGwvcE5OSDNVZlRwQzlBb28rTFBh?=
 =?utf-8?B?N3J2SUFqL01nZ3NVSUZvZEJvY01wZEtNLzJOK05RdmdTZW1MYUpySWVjZ25G?=
 =?utf-8?B?ZFV0ajRidU1qKzFsd0dJNm5Yb09EUHpRZGUveWxVWmkzUU5DTHFOQTg0WFNJ?=
 =?utf-8?B?eXA2R0IrMHRPUXlHdE90SklsaUZIZ01FMkIyMDdPQ2YxRXRXcDN5MTJUalYy?=
 =?utf-8?B?MVN5cVY3bmYrdDlwQ3gyNzFrODlEeC9Ib045RER0U3Zjd1loWnBDNmxhYmlj?=
 =?utf-8?B?MnZWVjVOc1pKR0tPS3loODJod0czZ2FPby92bzJsMnYvQlMzeWlNaVB0aElO?=
 =?utf-8?B?MVZITDJEdTIvVVZMVkh5eFNaZDUxcDZDRTVJaktLOWdUcisvTFRqckUyOXRz?=
 =?utf-8?B?YmdsdEVIaGpQSjNWU2pBeVA0cmlsS3RrTkVuajNxTzdHQ2N3NHRtcVRmZmtP?=
 =?utf-8?B?ZFhqRVRCa1BGdXFSeWNJVTV4N0d3V0t4WmJQa1RnYUgvMlBMRUpRQTFqMG1U?=
 =?utf-8?B?OWhvZm9OS3gwQzc0bDBQcG1tQkxMVVhuaTkrb0hpRzF5TXdXdklaS0hXejBw?=
 =?utf-8?B?eVBMdTB5dzl1VURpeDRIdDR1dGpqMHd4R013QklHWU5TQXFBcWZJd053MDgy?=
 =?utf-8?B?QmFXOVYzVVdEWitoMWxqc3UrbjlJRUxjMGlvRVFIWldmV1B5NTcyZ2Yvc1h3?=
 =?utf-8?B?ZFByYUJuQktUWUlKcVNQRjd6UUd4VUlCWUVaVlEwdXNickVVS3JkRnlJL3RR?=
 =?utf-8?B?dGg3ZHVCSkg4R0d4OGlRcGNEK1dDOFNacmJ3elVMcnVGeUtOWWR1S1VtMzln?=
 =?utf-8?B?aVJOTUExY0FUMWQ4cVYvWDJ1UXFHbDVBVlNNWWxndUtSYk91YXpjbDhObWxq?=
 =?utf-8?B?c2EvNnBiYnEwTlFaTkFtNUlKek14WVFuRFl6cy8wZ0VzN1dwekIxQmlTcXo2?=
 =?utf-8?B?MitUTThvRHZvUzkvTzJ0UitiaDc5NlllQ2w5dWFYdlMxeW9vSTFobTVRSFlG?=
 =?utf-8?B?TGZQMU4vdGdJV3ZBV2I5aEZUT2pWRGFzQzk5VVhHZGxselhndlgrQlhHWTNu?=
 =?utf-8?B?YVdTUXlHemcrOHQ4MUFWeTdiWUMrL01BYTkyT016UHIzSHYwdzdRQVVyWHh4?=
 =?utf-8?B?WC9aVnM3bER0aVNFNXBtcWd1OGFnMEtSbjUrOFNaR3VjNm1VZjVHbVJtL0l2?=
 =?utf-8?B?Q29kMDRQMTVkcy96MDQybzZSeFdJazdqUUtkYktpY2wvZVdjcVlJcW9lOFVM?=
 =?utf-8?B?QTdRWFc5TlFJeStaR1N3RnFKeXBkU21uRVlYTmtYRDNpaFhrWjl2d25OZnJV?=
 =?utf-8?B?ZnZTODFDc1hieE9mdkdQbFFtK283ZWdXQy9UbFNtUk9MdERTc0V3MmRqQVJU?=
 =?utf-8?B?RXRTWVR6NnVqeHNUS1BOclAvR1dkZ0h6bHdtQU5lNkN6a3dBdk5YN01ITlFG?=
 =?utf-8?B?UStRQlhGVjFwK2RBRkhMbm9BcnJvT21EKzJ2NlNlVzNhZjRHelBrUWlVRlMx?=
 =?utf-8?B?RmJZeVByblRJMVp0VVdNeC9rR2NQQ1BGR09FZ0xlTW1vSjJnN2tLOTJsK01E?=
 =?utf-8?B?aUU3NUJGTE0xTjU3ZmJ5NHdUYjIyWFVydklSWmdzY21pNkdsN3pLeTA4WHdW?=
 =?utf-8?B?RVJGSVd5MlNTblhNT1RQUlRPdE5kUjIvand2eGpZdytUWlQzdFQzZ2VQdWxo?=
 =?utf-8?B?dDRVM1AvbzVsSUtJNURidTB5ZmFaVWMzZnlWZnZMSi9BMGlHUnY3dEhPSUF6?=
 =?utf-8?B?azRwd2NPd1l1dTBKcVN1YlhMWnFsYk5OcVFQTGZJVEMrNTFUVlcyVFd3VWwz?=
 =?utf-8?B?QXR6TjZ0VWxYc2Mza2pLV1pJdVR2RXNSMFBGUGg5ZXdPUENic3pEbEVKOHVL?=
 =?utf-8?B?MWUvOFVodWF5Sy9abTlqSm1KNjVaSFdTTFNMUGMrWDhSKyszOFdWZFJuWkFO?=
 =?utf-8?B?bHhGOVQ5aTEzeXN2aE9IRFpyaU9QVXBiOURXMi9oMThrMUlCazhDdWNQWFEw?=
 =?utf-8?B?YTBITDlHQWdzcXp6WVVLLzN3d1JRT3BMN003ajlObEhLMUtZZlJ5Q2FDQ2lJ?=
 =?utf-8?B?SXI3Y2l6R1RKcHFnUlR6R1ExRlpEZ3QraXdpRTNXNkVBcFlsMjR6OERHS3l1?=
 =?utf-8?Q?4UaD6V6B3aXeEsI1ycpGhrwuU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc36f2b-afc8-49c3-3555-08dbc031775f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 14:44:49.3483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3LxVCIw/E9HqfWCwUg1AGTJDNRLjUhS5+YkEVFZ4OUm4gbnS4hCV351OrG4pOi/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Donald Robson <Donald.Robson@imgtec.com>, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-28 04:02, Boris Brezillon wrote:
> On Wed, 27 Sep 2023 13:54:38 +0200
> Christian König <christian.koenig@amd.com> wrote:
> 
>> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
>>> On Mon, 25 Sep 2023 19:55:21 +0200
>>> Christian König <christian.koenig@amd.com> wrote:
>>>  
>>>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:  
>>>>> +The imagination team, who's probably interested too.
>>>>>
>>>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>     
>>>>>> Currently, job flow control is implemented simply by limiting the amount
>>>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>>>> submission limit that corresponds to a certain amount of jobs.
>>>>>>
>>>>>> This implies that for each job drivers need to account for the maximum
>>>>>> job size possible in order to not overflow the ring buffer.
>>>>>>
>>>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>>>> rather large range. For such drivers it can easily happen that job
>>>>>> submissions not even filling the ring by 1% can block subsequent
>>>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>>>
>>>>>> In order to overcome this issue, allow for tracking the actual job size
>>>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>>>> submission units, which represents the amount of units a job contributes
>>>>>> to the scheduler's submission limit.  
>>>>> As mentioned earlier, this might allow some simplifications in the
>>>>> PowerVR driver where we do flow-control using a dma_fence returned
>>>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>>>> dynamically query the size of a job (a new hook?), instead of having the
>>>>> size fixed at creation time, because PVR jobs embed native fence waits,
>>>>> and the number of native fences will decrease if some of these fences
>>>>> are signalled before ->run_job() is called, thus reducing the job size.  
>>>> Exactly that is a little bit questionable since it allows for the device
>>>> to postpone jobs infinitely.
>>>>
>>>> It would be good if the scheduler is able to validate if it's ever able
>>>> to run the job when it is pushed into the entity.  
>>> Yes, we do that already. We check that the immutable part of the job
>>> (everything that's not a native fence wait) fits in the ringbuf.  
>>
>> Yeah, but thinking more about it there might be really bad side effects. 
>> We shouldn't use a callback nor job credits because it might badly 
>> influence fairness between entities.
>>
>> In other words when one entity submits always large jobs and another one 
>> always small ones then the scheduler would prefer the one which submits 
>> the smaller ones because they are easier to fit into the ring buffer.
> 
> Yeah, I was assuming SINGLE_ENTITY sched policy here. As soon as we

Right--it's a job-FIFO.

> have a ring buffer that's shared by several entities it becomes tricky
> to be fair if the job sizes are dynamic. In the multi-entity case, the

Right--for the job credit scheme to work, you need to use a job-FIFO
at the DRM scheduler level. (Once the job is received into the hardware,
the firmware/hardware may choose to reorder/parallelize execution of
several pending jobs, but that's beyond the scope of this thread.)

> ->prepare_job()+dma_fence approach addresses the problem, because the
> first job to call ->prepare_job() and add its fence to the list of jobs
> waiting for ringbuf space will also be the first one to be checked when
> some space is freed, and if there's still not enough space, we won't
> test other jobs coming after in the list.

Right--you shouldn't.

> 
>>
>> What we can do is the follow:
>> 1. The scheduler has some initial credits it can use to push jobs.
>> 2. Each scheduler fence (and *not* the job) has a credits field of how 
>> much it will use.
> 
> When are the credits assigned to the scheduler fence? As said earlier,
> on PowerVR, we might start with N credits when the job is queued, and
> (N - M) when it gets submitted, so we need a hook to force a
> recalculation every time the scheduler is considering the job for
> submission.

"Credits" is something the firmware/hardware engineers tell you. It's a
known fixed quantity at ASIC boot. It changes only as you submit jobs
into the hardware/firmware.

No hook, but rather a peek. You'd peek at the hardware to figure out
how many credits you have available to submit new jobs, or you'd keep
a running count of this quantity--depending on how the ASIC works.

When a job completes, you add it's credits to the available credit
count (or you may ask the hardware how many are available now),
and add/reset that amount to the available count kept in the scheduler
struct (for instance). Then, if the next job to be pushed--which has been
known from the outset as we use a job-FIFO--is using less than or equal
number of credits than the available ones, then you push the job, and
subtract from the availability count (or, again, peek at the hardware
for that count).

> 
>> 3. After letting a a job run the credits of it's fence are subtracted 
>> from the available credits of the scheduler.
> 
> Uh, what happens if the job you picked make the scheduler
> available credits pass under zero? I guess that's relying on the
> fact you only expose half of the ring buffer capacity, thus enforcing
> that a job is never bigger than half the ring buffer. The latter is
> acceptable, but the fact your utilization is then half the maximum
> capacity is not great IMHO.

The credit count you keep should never go negative from the action of pushing
jobs to the hardware. If it did, it tells you the software design is not
consistent.

Hardware/firmware engineers will not appreciate the fact that only 1/2 credits
are being exposed due to poor software design principles, nor would
the sales team.

(See also message-id: 61c0d884-b8d4-4109-be75-23927b61cb52@amd.com.)

> 
>> 4. The scheduler can keep running jobs as long as it has a positive 
>> credit count.
> 
> Why not just check that 'next_job_credits < available_credits', and

Yes, see message-id: 61c0d884-b8d4-4109-be75-23927b61cb52@amd.com.

> force the scheduler to go to sleep if that's not the case. When it's
> woken up because the parent fence of some previous job is signaled, we

"pending job"

> re-evaluate the condition, and go back to sleep if we still don't have
> enough credits. In the PowerVR case, I'd need a wait to recalculate the
> number of credits every time the condition is re-evaluated, but that's
> just a matter of adding an optional hook to force the re-calculation.

Right.

> 
>> 5. When the credit count becomes negative it goes to sleep until a 
>> scheduler fence signals and the count becomes positive again.
>>
>> This way jobs are handled equally, you can still push jobs up to at 
>> least halve your ring buffer size
> 
> I think that's the aspect I'm not fond of. I don't see why we'd want to
> keep half of the ring buffer unused. I mean, there might be good

We don't. We absolutely don't. Hardware engineers would absolutely
not appreciate this, and you shouldn't write the code to do that.

> reasons to do so, if, for instance, the same ring buffer is used for
> some high-priority commands sent by the kernel or something like that.

Ideally, you'd want a separate ring with its own credits for high-priority
jobs, since a high-priority job can be as large as the credit capacity,
which would force the code to insert it at the head of the FIFO. Anyway,
I digress. 

> But it looks like a driver-specific decision to not fully use the ring
> buffer.

The full potential of the hardware should be utilized at any point in time.

> 
>> and you should be able to handle your 
>> PowerVR case by calculating the credits you actually used in your 
>> run_job() callback.
> 
> Hm, ideally the credits adjustment should happen every time the
> scheduler is considering a job for submission (every time it got
> unblocked because available credits got increased), otherwise you might
> wait longer than strictly needed if some native fences got signaled in
> the meantime.

Ideally, at the time you're considering whether you can push a job to the hardware,
you should have the credit capacity ready--i.e. you should just read it
off a variable/register/etc., possibly atomically. "Calculating" anything
might induce delays, and future temptation to add more code to do more things
there, thus degrading design.

You'd calculate credit capacity when a pending job completes, i.e. returns
back to the scheduler from the hardware.
-- 
Regards,
Luben

