Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F37B03AE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B8510E4F7;
	Wed, 27 Sep 2023 12:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4298C10E4F6;
 Wed, 27 Sep 2023 12:15:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m86TSNg1JL/5+R7uGDRCUtBnG2hHj/vBm3jqZg0tAJsZaOtk0ytTq1AAJhe5mT68VPNIUnHl30rDqZWFXCUn8zUQEWrVNiaewmU0tItkxOti9rZy1JLuuK/V+gyyugYXqdOxw3CLTqSCEIw91VvM7gyjhCrNBf4vo59oBWbdlgOtHJhs9U+JWowm+jRAj4a/jjQEDoC6AP0BfQkVVR8p5aU7gjo0jE2DsbnLXaeUgETC4QGfXpajZM7wXVD2E2IGXGuMMJhiGVi2yB9X9jZjHaGTiK9sfZnvb4aOkm8KId+d19kXeLjT7z6MWkSWPBCVI15x+ARPFGiwoFHFvonWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oak6BCI6PT44CTOwfWS7mxOANzf+NJiEVtdgvDH2vEI=;
 b=GvcypE1lTzaOUZ4wxFaSwWupFCpuUyndDqzqzJ/mSvadKA3tbe057GuKGuxsFrhluGYUFn2dDcrlJKBHeeLf6ZlSANyHl3dckJYC8Wft4c6ccl8M0IGKgWMtlLwpwzlF6DLD6xHk5nQcXl/tIrQ7yr0jSPwVlL57m+3rz9BhVXvxZlDxjEfXo5lIVbNJsrkq8WlQF6eE1LvPHvhupu46IUgYRoypaxKRm2w6Pn4oCR/3M09/rSqAjVK6aJqzXJr8BLj8jBqjxsprfmzkXAAwaU01CtHHIbb/xwZTxn0B4W/Pt3zKglpnbCKUWpx4Z3UK5cflcmv6Xfu+c+5PB4nDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oak6BCI6PT44CTOwfWS7mxOANzf+NJiEVtdgvDH2vEI=;
 b=QT6wTLFvY1y0adY3dGVNI1J/Uj/IMjF1CS/lzFpNHTGVfWmtdSVOVwwrdkIzmnyOugkrMJcH6NV0NWtcP5Ta7o8jU0/BM2NXRHdOI83euYtrCifHBM6fYYG44uji5ku/9P5NRDNx1OVghlJ+yfo+RGNWWBnG7VxaqfvomHsAUAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 12:15:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 12:15:34 +0000
Message-ID: <1f113c7b-975e-c72f-e6f0-ded55d10d64f@amd.com>
Date: Wed, 27 Sep 2023 14:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
 <5c6e1348-ec38-62b1-a056-1b7a724d99eb@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c6e1348-ec38-62b1-a056-1b7a724d99eb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 1783816e-a120-4a27-c38d-08dbbf537118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nng4QxjjTzaoppOo8HiRGlom3EXi0u4jd6QzSmAlR7UXBL7mevwLuOQJroGxbbJT5zWerg478+tNTeauaYBEBDsh6OsNBy7otmraA/lTsBPAkvktah5auC6EfDktpH/WUtlu2GRzOKN6BYz5ub/Dggak5HPdz+WfW+FWwUg9FCZpu7DPjO48Q/qnvNaAw/JBYOl+jwnbdt8C2ujrUHYIJbBtkyyc4en2vLZtmCay1jtUSfbUsLPiEgCbUTJ+mNBx49KReCNOhE/tlmsO3397RCKp8xPG7PXSrCC0upTNOQpNhldUsVGBESi7IR1J+LfmXzWJikW/u7NiKjJduO82h//zbxo90e48gA1NpxZd6wk7pc+bXGZXLRj7c12Lai+yfTuLa+GcpAz7zSZgiTQr2dx+qEYMcPx9h790ZfrQfCqIi+Wobdbbtt7iTphzrGtx5zhRb7J+5ItMWk9E9h1zGVUo+2AYVOSJGdRWR9YSjusWtthbbvJnZF/HPaXEw1tIzvYax/UPn9t7fJah/UzOfNS9xBnVFoGe5m3aqFF/yvOmhpOb02wGPLBfGpSI4m1YqW6lbPa7LjzRfggJqj4axXJNi2k4zgw8aZMOO70+zBWuKy1uTrbPzT7PSIUmyJHyOKK5LZSZrEvAIL3PzXXfbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(31696002)(31686004)(8936002)(8676002)(4326008)(5660300002)(41300700001)(66946007)(66476007)(54906003)(316002)(110136005)(38100700002)(7416002)(66556008)(2906002)(478600001)(83380400001)(86362001)(26005)(66574015)(6506007)(36756003)(6666004)(6486002)(53546011)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUpJTUhrc3NySnRJWXluY1F5VkdSeTlrWjNKMEFxMGdRZ1pCWmRjMXlCZm5G?=
 =?utf-8?B?aXhYWDVXaVJST29PY1hIcWRUdzBuZjJkcG9FUFlvZmkxdXhJbUNueG9wa0FB?=
 =?utf-8?B?WEdnZU1UYkEzWTZFenNQNTJtNzU4TW91eGFWc2JqOVJUS2ppaHZqR0lXUVND?=
 =?utf-8?B?dXlDZjBGWENVNGdiRExmR2RkKzRsR0V1M2Y4dFNPeThZbE1kTzdOMGxJbXZ1?=
 =?utf-8?B?d3RVdFFIMHdOd1NNSXN3TkY4WGZKbnQ4ejFNdGszOWRxeit2UENRSUQ1eTNk?=
 =?utf-8?B?V08vR0RSYzQvTnI0UjVoamFwbnJZakZZbmlLbnl2eXIzbGZ2dnhFaGIySG5a?=
 =?utf-8?B?VFRnVkhJVzA1emN3enozNWRYTEZRZnV3bWU5T0V3VkdJNmM3WmtESHhCa25j?=
 =?utf-8?B?Z1NWWVYvWUYxbVEvU1B2Z3RtNU1ZTEVTT0tCNmpBSG84Q2txMGxSdlBUa1Na?=
 =?utf-8?B?Smt2ekZrcjBFLy84QWtJb1FBVUxDNVBobXVaY2VTV2ZVanUwUEcrU1lkQ28r?=
 =?utf-8?B?Z2dXV3FCeFEwYklhU1NWMWxYUG9KN0MrUzRpRGdoT2MxMU8ybythYnRja09K?=
 =?utf-8?B?UUk3ZSthWUVRTzQwN0drYUNLNlkzQXlpZko2Z2g3enVGYkl5S0FBZ081ek1R?=
 =?utf-8?B?dE9Rd0VJdHZJWll1QTY5TmNpb0NjVGtwUCthdFJMMU5oMXU1bGk5cGFUaysw?=
 =?utf-8?B?dDZmTWIyQUdSU2JXbU5oTFVvZnFxb21OWkFCR2ZHMHBxWGUyNTFKamNxRjhM?=
 =?utf-8?B?aE5YNFgzR2ZBOG11Y3E1OW1ZT3RlRm01VXkwSDlSWUVmdFduRjJyQzVSRkhR?=
 =?utf-8?B?TWVRS2xhMldVbEFxYTl4dVZzZ1VlYWVyczJaRlo4UURUZVdJelhVOHN6MXg5?=
 =?utf-8?B?MnVrUTdJNTMrT2tna0Rva0dqWjlxZTI0cHhVcDBJNzljeU5kTVlWSzJQczE5?=
 =?utf-8?B?dEJBcUE2M01OcmhZRmtzTno0eThjT1hwR3JHY2FZQ2U4b0ZxUitqN3pzRFhP?=
 =?utf-8?B?Uy9OdmF2RU9sdmdZSFU3dDVhMHZHUyt1RHlLNlJiVVFzYkljTjViVmVvOGp6?=
 =?utf-8?B?OUJQa2RmNzUxaWhZRjZDblNLQUFCem90OE5aUjgyTWxadThHUEdSNEVJMjNJ?=
 =?utf-8?B?RmNyQ3hSRnREZ1ZyTVRveFIxRXJmRFdvZ3p2eCt1ejN4VlZQSERURWhad05Q?=
 =?utf-8?B?RExYM1Uzdm1oclh1WDVDSlp6V3hGaHpUdnlGT0pJWmRRZHo0L2JJcVo5UENk?=
 =?utf-8?B?eFI5VWQrMUswRFhUMGhGQVd5MzN1OThyQmlmOENOZkhCQVNJSnR2VkExRDNr?=
 =?utf-8?B?UlBpSzlYekRGWXhHQ1hudEdJbWUyL0V2dEZrbXQxUEhkWGg5VE9IbFZTL2Np?=
 =?utf-8?B?WTk3OVhuTTZjMzlaaGdLRld2aWt1b0htS28wOHJERTZxc1JFNVpxZ1lIbWRH?=
 =?utf-8?B?M0VBWWx1ZzBuNnc5OGJqbDF5RS8yK1ZGTituRXNlOGNmc2R0ZG5pRDU1a2VD?=
 =?utf-8?B?RVFtQlBiMld5WlpGa21mT1VjMmw5YnJQaEh4RWovbEMrUkh1OTBtOG04R3JK?=
 =?utf-8?B?eVR6Sk0waUR2a3lVd2t0UWxvTGRPMVpBZGJkZWp4bTRJSEJTNWg0K1QyUlBm?=
 =?utf-8?B?Tnp0Z1p5N0pVZzcwR1FIbWk0RlRxVlF2MWJqZjNHSTZoUkYyR2pBeXRvWW9l?=
 =?utf-8?B?a0s1ek5WZ1NwM0N6Zms0eXFSaCtNcitZaTJ6am1aQWN2WDNYUzJ2N3dNUFBV?=
 =?utf-8?B?RWVuSHVQTG9SWFVGWUpZV1ZrRE1NRER4eEN6WnNOcW1FMVJCWHRPeEs2Z1Zl?=
 =?utf-8?B?MFhsMmxhLzk2UEJ5SkRlUk1GTnJvcWd6cU9RaHFuV3V1WHpzUTd0eGdKb0d3?=
 =?utf-8?B?WWlIcTI3U1RhZ0wzL2Y0NUZtbEpQWm5uZHdLckZ0Y1BDVCtOemZhVmZNU28x?=
 =?utf-8?B?d2IzMzlURm52Y2NwRVVCQTdQMExIcWlsMjlsQ1psWVY0cFl2YVBWMXkvYTVU?=
 =?utf-8?B?am5xaHo2QTFPUnYvalFvRlVnK2NIOHNkaXdkSFdPUHAyNUIvd29rZUNHMWJp?=
 =?utf-8?B?anM2Z2pqTkxXTjJaVkwyOG5DbktJZEN0eEtEa2Q3Tk1mY09PK1FVRWFEb1Vi?=
 =?utf-8?Q?sNaYXXjxuiyC15k3T/64vsD0t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1783816e-a120-4a27-c38d-08dbbf537118
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 12:15:34.2893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mn96RlO+jPDmIQJxuVhX4vwdaR2oF8cLS8vHTX5nYdn5gJ/HS8UPAFBOdYzHak9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Donald Robson <Donald.Robson@imgtec.com>, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.09.23 um 14:11 schrieb Danilo Krummrich:
> On 9/27/23 13:54, Christian König wrote:
>> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
>>> On Mon, 25 Sep 2023 19:55:21 +0200
>>> Christian König <christian.koenig@amd.com> wrote:
>>>
>>>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:
>>>>> +The imagination team, who's probably interested too.
>>>>>
>>>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>> Currently, job flow control is implemented simply by limiting the 
>>>>>> amount
>>>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>>>> submission limit that corresponds to a certain amount of jobs.
>>>>>>
>>>>>> This implies that for each job drivers need to account for the 
>>>>>> maximum
>>>>>> job size possible in order to not overflow the ring buffer.
>>>>>>
>>>>>> However, there are drivers, such as Nouveau, where the job size 
>>>>>> has a
>>>>>> rather large range. For such drivers it can easily happen that job
>>>>>> submissions not even filling the ring by 1% can block subsequent
>>>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>>>
>>>>>> In order to overcome this issue, allow for tracking the actual 
>>>>>> job size
>>>>>> instead of the amount job jobs. Therefore, add a field to track a 
>>>>>> job's
>>>>>> submission units, which represents the amount of units a job 
>>>>>> contributes
>>>>>> to the scheduler's submission limit.
>>>>> As mentioned earlier, this might allow some simplifications in the
>>>>> PowerVR driver where we do flow-control using a dma_fence returned
>>>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>>>> dynamically query the size of a job (a new hook?), instead of 
>>>>> having the
>>>>> size fixed at creation time, because PVR jobs embed native fence 
>>>>> waits,
>>>>> and the number of native fences will decrease if some of these fences
>>>>> are signalled before ->run_job() is called, thus reducing the job 
>>>>> size.
>>>> Exactly that is a little bit questionable since it allows for the 
>>>> device
>>>> to postpone jobs infinitely.
>>>>
>>>> It would be good if the scheduler is able to validate if it's ever 
>>>> able
>>>> to run the job when it is pushed into the entity.
>>> Yes, we do that already. We check that the immutable part of the job
>>> (everything that's not a native fence wait) fits in the ringbuf.
>>
>> Yeah, but thinking more about it there might be really bad side 
>> effects. We shouldn't use a callback nor job credits because it might 
>> badly influence fairness between entities.
>>
>> In other words when one entity submits always large jobs and another 
>> one always small ones then the scheduler would prefer the one which 
>> submits the smaller ones because they are easier to fit into the ring 
>> buffer.
>
> That's true. Admittedly I mostly had DRM_SCHED_POLICY_SINGLE_ENTITY​ 
> in mind
> where obviously we just have a single entity.

I also only stumbled over it after thinking Boris suggestions through. 
That problem really wasn't obvious.

>
>>
>> What we can do is the follow:
>> 1. The scheduler has some initial credits it can use to push jobs.
>> 2. Each scheduler fence (and *not* the job) has a credits field of 
>> how much it will use.
>> 3. After letting a a job run the credits of it's fence are subtracted 
>> from the available credits of the scheduler.
>> 4. The scheduler can keep running jobs as long as it has a positive 
>> credit count.
>> 5. When the credit count becomes negative it goes to sleep until a 
>> scheduler fence signals and the count becomes positive again.
>
> Wouldn't it be possible that we overflow the ring with that or at 
> least end up in
> a busy wait in run_job()? What if the remaining credit count is 
> greater than 0 but
> smaller than the number of credits the next picked job requires?

The initial credits the scheduler gets should be only halve the ring size.

So as long as that is positive you should have enough space even for the 
biggest jobs.

We should still have a warning if userspace tries to push something 
bigger into an entity.

Regards,
Christian.

>
>>
>> This way jobs are handled equally, you can still push jobs up to at 
>> least halve your ring buffer size and you should be able to handle 
>> your PowerVR case by calculating the credits you actually used in 
>> your run_job() callback.
>>
>> As far as I can see that approach should work, shouldn't it?
>>
>> Regards,
>> Christian.
>>
>

