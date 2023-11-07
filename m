Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A827E374A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 10:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFFD10E4DD;
	Tue,  7 Nov 2023 09:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BF910E4D7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 09:13:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoaO/QgUYcifhAlIkR2XV3iRz2KkcWMqXFO4KGvA++mU4tr7k5dLQTsZGoIsgbuM1jIa6tX9mhLoxf62iRaqxP9E+f2ZrcTOqJijU0pTMP+lwJZuXtM7o+Esh5lbus5odQ9biNtL4evNlkKX/hlcKnrzECexHaXZp1fsBof9czz0N/SpciKGnEmodLSnb1Ys+JfYD3Db2OL6vdiOsoqzfY7tPalbzIfMJ2fBlHEHdZ84BvP/dek63tZ5mSO1hErAIMySLZ2Lv3A6P6MwncZaOFRS8x90DTHM28VU+Hj4RfrfaXucbdL6D0yeJgImyIF2W+x5xGcJp60KtWl3VYyP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT3WTE7+o9DPl4ibAYQrZN0LIK1JBFy1E0Ddt5NZZ3c=;
 b=WTA7Xz0omg9I8LplOLENAxi2MFiiq9Z8Mo0ZrKsyLjKZwAIFvrr3jmKEwG0TZFJf3sSIvrBfLqzOqsYiVjngotrQGQgogsyJEqpbgnoxEGuI9HaaqABMToWg+952g/Bhgx9z9RQQgxVhjZxzeQCtmRG82Xighn6BeDREv1swmvgOgsvBEkPwN+H1ROYH2mkhq0qU+SEBM0Z3zhPDQt0Y2dfaEsRk2byDrCdbe+feR7z+npS7hZUr6Y/z+AamQBrr87mvMyFXs96myuHlSGPhOGtUIW00Ml48wKlTjKk1/3RL/sfzDuwgHn6fdsdVYziCHr6y40/vxgyjbHSU4skCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dT3WTE7+o9DPl4ibAYQrZN0LIK1JBFy1E0Ddt5NZZ3c=;
 b=AOXXYm2JSpfY3ve+SkvxLJ/oj6Lw7a+b+KLObSa6Fw5ojRSQRJKkH+/a9ebOHsYnomLB8gT0JXyDXgU0S6MT4TfsFWYKnr7NxRbRGI2QmFBdFjMs/L4ZtU+KZZqwqQdUIWFKAsPsU1oT3q3/K/8UHO3P8Xv+dJ14UZhDA7/DStw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 09:13:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 09:13:43 +0000
Message-ID: <29f85d25-fb9f-4474-92f1-32117101eb1d@amd.com>
Date: Tue, 7 Nov 2023 10:13:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
 <20231027121707.414810d6@collabora.com>
 <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com> <ZT/uPhLK7gan61Ns@pollux>
 <e9c6af32-8d2a-4f04-9c12-1170a3aa1236@amd.com> <ZUEW1mxwGO3bxxGM@pollux>
 <8d4a0870-f7d0-41ee-aa25-6488b6ea037a@amd.com> <ZUPkfKzgKqhqQhMI@pollux>
 <c91cf097-2ed3-4669-b9ae-b16b5f875b02@amd.com>
 <ed187c95-1a6d-44b6-88ab-0866167bb5cd@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ed187c95-1a6d-44b6-88ab-0866167bb5cd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf3ddd3-3b30-493c-8bac-08dbdf71d6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZF6HYInqnKjzf5pxGsC3pHQK9w49Rk3K74tjhlJrFMVC31jAz2tdLooZh18b6Q1kVJKXzNsBSYs78J99UYfIpwIeZKUbp43//N+Q6fLdIDe+qnYwjddxiU7NJsS2UwCJhkgTI9A8p1LT2o4WLbBJAVIssqCJcRkgEU756Te6/OU5psnZCLBpEwOOVdsZllMvqNZU5oMm5xwrG3iYdCXAbwFsbfBWWtWQ/0W9Kpr3Iu6RRjVOquV9oLiEoiiRudqTsIJutTSkLKWHPt0hBZQQ/8CNJkgZhp9XxM/Xn0FUefB6cBdnO26SBLMP3krG600wWMODiq4SYXQrDyHPQkQamCD5mJR/IN0BW2NXO/4rSUfAo4HzlFf2raGcyi1tLV9ca+a2S3mnUBRMbz+rbdylsmPOU2Wk1nd0yqGUqeiDrHlu9+g/lmDycvYPfAS9n2muZFPeJDdzPe+g9sYEr70aPFJngiQeotu1vRToiGedx6pnRJvX9rZHuSIKcudynpWvnBZoKsFdXDHNBRe5kUm1XLVnxwamvzMK7JQWlk0lKntn1VFiM7jySBKyBw1IG53bnLFySs7BABAAniUzeRbgvFsuYOQi4jD1xdeS/NTYsOua5JPsgMYvpJIpsQge2Uj32jq4PMnOqFiXrbrAAqGhRc1fxKEjvVQjAQiznCXC59UvOFpXt8pggYuglwkFtN1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(230273577357003)(230173577357003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66574015)(6666004)(26005)(2616005)(41300700001)(6512007)(6506007)(30864003)(8936002)(8676002)(4326008)(2906002)(6486002)(5660300002)(966005)(478600001)(66946007)(66476007)(66556008)(6916009)(316002)(38100700002)(36756003)(86362001)(31696002)(83380400001)(66899024)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2o5VEVFd0NkbytYN1huNWNPVmJ0MzREemhmOVhjY2xJYWlBMnJGS0xkRnRP?=
 =?utf-8?B?K0RQWldsMHBoWmtzZGJCZUdFSFpZQkRKV0dNU0xmYVNLZlU2S0hMdEphaUo1?=
 =?utf-8?B?ckJzYmJNSmRkMTBUQUpESTRPOXVwamRDSklncE5jZlV3NmpKdE56VmE0YlpL?=
 =?utf-8?B?akcvT1pkbmxYbGJ4QWRhMmN2N1JVWW9ZdHZNRERhMm1MVXRUWXQzSDB6WWVz?=
 =?utf-8?B?azNlcDNGZnJXZVlQZ0RYa2dFNFh0MFB5Q3RDYTRFNmRqSE91Q3Uzdk05Z1U1?=
 =?utf-8?B?MzZKOElUMWZBazVac1FpSzRUUzg0YVdsTTJPRmoxRjRGZHFsU0ZVNmRWZi9F?=
 =?utf-8?B?QlZ6V2JYdk5MYW1za2FXK1Z1Q3YrQ1JwWXV4WXBUQW05TjBRNUlHN2p3VUhZ?=
 =?utf-8?B?Rm51RnJIdHM4VjV3MTVtb28rV0NjaGRsKzB6cUI5NEhXV2xRMnpWRFZHLzJG?=
 =?utf-8?B?eTk5bmhHd09PSk1MT3I2VEYxaTRBcHlCOXlJaG5GdmYxS0MweU5tS2YxUmJF?=
 =?utf-8?B?VnNRcm95TStGUHd5Q2lkMTBTWW5NQ29MREppZ0FhUFVNb2RMd3QyQm9VeE9G?=
 =?utf-8?B?eHo4VUd0M3UyRmUzZGc2SE5QL1M3RElqUWZ6cUFVN3VGdUYvYnJGNUZCZWVx?=
 =?utf-8?B?NUloTG5hYVJkMDk0NEU2eDYrRmtQRVlrTmxLK2wvQ0JuMkVoaGxoUUN1Y0pW?=
 =?utf-8?B?NTVYbHFDWVUyY3hmVWFTSHlDZ3kweENTbG5PY1ArVjczM0U0a09EcGNkdHNw?=
 =?utf-8?B?TFp5UFlmemQ0NjVPSnhkNFdZY3VRTzV5UjNOZTIwK3F0cHhsSW9aOU5QWWdt?=
 =?utf-8?B?dm1yUXhQdXlrS0VRWkJNQjRlOE95b216ZEFuRHo4ZFI1WXZ5YVJsUFA0TUxv?=
 =?utf-8?B?dkZoNmYyc2pSRDFSajN1Wjk1VDJRV3Z0VlVrWDFyTUV5dWc0eDd3THR4Qy9X?=
 =?utf-8?B?S0NMMjFDeVIrajlTVnM5TmxBM1FqSjJIcXc1TnhlR05Fd3RybFN6dFhaNXRp?=
 =?utf-8?B?Nkg0UlRPR0hjeGRUUVNtYXZrRjJIbEY2ZUlXbWlWbS9XRDRYai9KZzk3eUFI?=
 =?utf-8?B?OER4TTIvMzRKSlBkVTVxMjdrR2s3SXVuMERoWnkyYmViOHM1Wjh4Y0pnK2c4?=
 =?utf-8?B?VGlmWXZXUlh1SDhqZ0NGRE93ckUybWViVWZtb3k3UWZOb3JxdjduM09kL3Fn?=
 =?utf-8?B?M0M1UHR1UlRxZk5LQW0xd2JackM5MW1ibTgxbFltYlRLOFVsSFZkcXFxQzVv?=
 =?utf-8?B?QUhvT0RVM1Vib09pQWhKWlR6SFBTSlJ1QUNwd1d5cmZBRHBYajcrbFhOeXM1?=
 =?utf-8?B?YzlwU2xEbjF2bFNuTkZoOVdGbzNrWFhpVFRSM2ZpWHlvSDhPU1R2OURjNFRQ?=
 =?utf-8?B?Tk5vY01MN1VBaGM4THZwTjg4VGx2NkoxbGxCMGFwdjBkRWkxODBuRnNJZHFI?=
 =?utf-8?B?TFJZUjQ5a3Uyd2YyNWhlVS9wZWtCbmdHVmFVaUFzOHNodnpVcWpsL2UySTBn?=
 =?utf-8?B?QkxyRmRBYUUxMjQrNzdodkZCdmxQaXV4TmgwSEYvTzJPelNWR3A0S0FOYXB1?=
 =?utf-8?B?QWVUV0pROUhZQjIzSU51TG56dmNhWVdKUXcyUTIwc1drc0VSWUhza2hPaFg5?=
 =?utf-8?B?bEJ1RGRGYUVCczMvSjZGQ3F2TGZKWDBIN1krZWlGQW95UDk2d2pFZ3dQNUZq?=
 =?utf-8?B?elhMT0NVcHp2cEQzMTZFVUVzanJCME1HUDUyVWl2MXViaFEyZWltdllNbEVN?=
 =?utf-8?B?UXRqTUk1MmxmT3dadXh3MGNROHJIekVHYmFpcmpHUDhLMEIwSmpEbDdFM0Iz?=
 =?utf-8?B?UG1rVUFYSnlTQXdDSWR2S2o2NUJSRTIyTW1FQk8vODNoaVd1YUdTc0lGeE1p?=
 =?utf-8?B?cTVTM3NLTWNaL2FnaHhPNEpuZjRuUGpzUzVMZ3NDeU04OERQMy9WMmw1TGhj?=
 =?utf-8?B?RDBaS1Z3emFtUGF0VGovcVd2SHE5Ym1xL0QvR0p0cHRwN2NVb01TSDIrSlBK?=
 =?utf-8?B?RHZlWkxBUzdYZTRqNk93STdMRFJwUHhzOGxWU2JINmE4NEtwcG1vY2FzcTdK?=
 =?utf-8?B?SjIva1lSb0VLa1AxeWgwTXVuWnhXYVZrNzlYQ1h1YnVLR2ZlRm4rUkFyMUNh?=
 =?utf-8?Q?W1u4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf3ddd3-3b30-493c-8bac-08dbdf71d6a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 09:13:43.0347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IF+FuMGFFHBX/EcVqbhZAWfgs8k9dKJdSdfJTxazO0t5/ZqR1GE6FjSt6O15shy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.11.23 um 17:46 schrieb Danilo Krummrich:
> On Fri, Nov 03, 2023 at 09:15:25AM +0100, Christian König wrote:
>> Am 02.11.23 um 19:03 schrieb Danilo Krummrich:
>> > On Thu, Nov 02, 2023 at 11:07:32AM +0100, Christian König wrote:
>> > > Hi Danilo,
>> > > > > Am 31.10.23 um 16:01 schrieb Danilo Krummrich:
>> > > > On Tue, Oct 31, 2023 at 02:20:50PM +0100, Christian König wrote:
>> > > > > [SNIP]
>> > > > > Yeah, I see the intention here and can perfectly relate to it 
>> it's just that
>> > > > > I have prioritize other things.
>> > > > I don't see any work being required from your side for this.
>> > > What I wanted to say is that I understand your intentions and can 
>> relate to
>> > > that, but other aspects have higher priority in this discussion.
>> > What aspects would that be?
>>
>> Be defensive. As far as I can see this callback is only nice to have 
>> and not
>> functionally mandatory.
>
> I gave you quite some reasons why this is desired.

Yeah, but I need something to make it necessary. Desired is just not 
enough in this case.

> And generally speaking, even if something is not functionally mandatory,
> rejecting it *only* because of that isn't a good idea.

Completely agree. But what makes this at least questionable is the 
combination of not mandatory and giving drivers the opportunity to mess 
with submissions again.

Especially in the scheduler and dma_fence handling we had tons of 
patches which added a nice to have and seemingly harmless features which 
later turned into a complete nightmare to maintain.

The takeaway is that we need more big red warning signs in the form of 
documentation and try to not change things just because it makes them 
look better.

> It is better to deal with it in terms of content and consider its pros 
> and cons.
>
>>
>> And in such cases I have to weight between complexity by adding 
>> something
>> which might go boom and being conservative and using well known and 
>> working
>> code paths.
>>
>> > Not breaking other drivers? - The callback is optional, and besides 
>> that, as
>> > already mentioned, the callback doesn't do anything that can't 
>> already go wrong
>> > with the inital credit value from drm_sched_job_init().
>>
>> During drm_sched_job_init() time the fence of this job isn't 
>> published yet.
>> So when the driver specified something invalid we can easily return 
>> an error
>> code and abort.
>>
>> Inside the scheduler we can't do anything like this. E.g. what 
>> happens if
>> the driver suddenly returns a value which is to large? We can't 
>> reject that.
>
> This is all correct and I recognize that. But again, the callback is 
> optional.
> I don't see how drivers would be affected not opting in for this feature.

I see this actually as cons argument for the change. If many drivers 
would use this then the code path would be much better tested.

>
> And for drivers which do, they'd have the same problem (if you 
> actually want to
> call it one) doing some driver specific workaround as well. And 
> because they'd
> not have the correct hook likely many more.
>
>>
>> > Keeping things simple? - The workaround PowerVR is considering instead
>> > (returning a dma-fence in ->prepare_job()) doesn't seem to 
>> contribute to this
>> > goal.
>>
>> I don't see this as a workaround, this is essentially the desired 
>> solution.
>> All dependencies of a job should be represented as a dma-fence if 
>> possible.
>
> So, you're saying that given we have an inaccurate way of tracking 
> credits
> (because you're rejecting the callback making it accurate), the 
> desired solution
> would be to use an existing callback with a whole different, more 
> complicated
> and hence more error prone approach to overcome that?
>
>>
>> The background is that dma-fences have a very well defined semantics 
>> which
>> through a rather elaborated hack is validated to the extend that 
>> lockdep can
>> check if drivers behave correctly or not: 
>> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-fence.c#L194
>
> I fail to see what dma-fences have to do with job-flow control of the 
> ring
> buffer. You mention it to be a plus that there is a hack to be able to 
> validate
> dma-fences with lockdep, but you miss the fact that the only reason 
> we'd need
> this in the first place is that you think it is desired to do job-flow 
> control
> with dma-fences.

Well I consider the hack better than this callback.

The hack Daniel came up with allows us to validate driver behavior. In 
other words even if things seems to work we get a warning if drivers do 
something they are not supposed to do.

>> With this here you are actually breaking this because now drivers have
>> influence again on when stuff is scheduled.
>
> I'm not breaking anything. This flow control mechanism is already in the
> scheduler, it's just that it's inaccurate because drivers need to 
> calculate
> every job with the worst case credit amount. I'm just making it 
> accurate, such
> that it becomes useful for some drivers.

Well, what's wrong with assuming the worst?

> I also do not agree that this breaks anything dma-fence related in 
> general. It
> doesn't give drivers control of *when* stuff is scheduled. It gives the
> scheduler an idea of *if* it can schedule a job without overflowing 
> the ring
> buffer. The influence of when comes through the hardware finishing a 
> previous
> job and the corresponding dma-fence callback creating the 
> corresponding space
> in terms of credit capacity of the scheduler.

That's a really good point, but what if the driver keeps telling the 
scheduler that it can't execute the job?

>> [SNIP]
>>
>> > However, I don't see why we want to be less accurate as we could be 
>> and hence
>> > risk issues in drivers like PowerVR that are hard to debug.
>> > > AFAICT, whether we could potentially see a ring run dry because 
>> of this depends
>> > on the workload pattern submitted by applications. Breaking down 
>> such observed
>> > performance issues to the scheduler not being accurate at this 
>> point in a few
>> > month or years would be an absurd effort. So why not just rule this 
>> out in
>> > advance?
>>
>> Because correct dma-fence signaling is more important than driver
>> performance.
>
> You mean because drivers could return more credits than the scheduler has
> capacity and then we WARN() but are still stuck?

Yes, exactly that's my concern here.

> The easy fix would be to still WARN() but set the job's credits to the 
> maximum
> credit size the scheduler can handle.

But that has then the potential for overflowing the ring buffer.

As far as I can see when the driver does something wrong there is no way 
for the scheduler to handle that gracefully. Either we don't fulfill the 
driver's wish to have at least X credits available before executing the 
job or we ignore the fact that we need to guarantee forward progress.

>>
>> Those signaling bugs are even *much* more problematic than anything the
>> driver can come up with.
>>
>> Please see here for an example why this is so problematic: 
>> https://patches.linaro.org/project/linux-media/patch/20200612070623.1778466-1-daniel.vetter@ffwll.ch/
>>
>> We basically said that all dependencies the job submission is based 
>> on is
>> expressed as a dma-fence, because dma-fences can be proven to be 
>> correct.
>
> I'm pretty sure that it's also possible to prove three lines of code 
> updating
> the job's credit count to be correct...
>
> Maybe we're better off using our energy for that instead?

Yeah, those three lines inside the scheduler are indeed correct but I 
can't validate what the driver is doing.

As soon as we have this callback the calculation to come up with the 
credits is outside of the scheduler.

>> When we add something like this callback we circumvent this whole 
>> checking.
>>
>> Maybe we can approach this from a completely different side. 
>> Basically we
>> have static and dynamic dependencies for a job.
>>
>> The static ones are expressed in the dependencies xarray while the 
>> dynamic
>> ones are returned by the prepare callback.
>>
>> What if we completely remove the credits or ring buffer handling from 
>> the
>> scheduler and put it into a separate component which drivers can use a
>> prepare callback?
>
> While I honestly appreciate you making a proposal to move forward, I 
> really
> think that this makes everything you're concerned about just worse and 
> even
> starts me getting concerned about it.
>
> 1) We'd trade the complxity of three lines of code to update the 
> credit count
> with a whole new component.
>
> 2) You mentioned that the concerns about the prepare callback were 
> proven to be
> correct, now you propose to extend it even.

The difference is that Daniel has found a way to validate the prepare 
callback functionality.

When the driver gives us a fence which never signals we get a warning, 
when the driver allocates a new fence we get a warning etc...

We have found tons of bugs around this inside the drivers which ranges 
from allocating memory to taking locks in incorrect order. And we 
haven't even fixed all of them yet, I can still point you to code where 
amdgpu for example is still broken. It's just that this source path 
isn't exercised this often so we can live with it for now.

I really don't want to repeat that stunt with this callback again. At 
least not for something which is only nice to have.

> The update_job_credits() has a very limited scope and hence is way 
> easier to
> validate for correctness. The only thing we really need to do is to 
> guarantee
> forward progress, meaning we just don't allow the job's credits to 
> exceed the
> schedulers credit capacity. And that should be it.
>
> 3) You seem to imply that you want to use dma-fences to do job-flow 
> control,
> which as I mentioned above has way more complexity (separately 
> allocated object,
> locking restrictions, etc.) and hence is more error prone.
>
> 4) Why would we remove something from the scheduler which can be 
> considered to
> be one of its core responsibilities?

Yeah, good points. I wanted to at least throw out some ideas how to 
solve this instead of just bluntly rejecting it.

Regards,
Christian.

>
>
>>
>> Regards,
>> Christian.
>>
>> > > Again, if this callback would introduce any complexity or 
>> tradeoffs for existing
>> > drivers, I'd vote to wait until we actually see issues as well. But 
>> this simply
>> > isn't the case. And if you think otherwise, please show me the 
>> complexity it
>> > introduces that is concerning and the tradeoffs for existing drivers.
>> > > > > > > > If this here has some measurable positive effect then 
>> yeah we should
>> > > > > > > probably do it, but as long as it's only nice to have I 
>> have some objections
>> > > > > > > to that.
>> > > > > > Can't answer this, since Nouveau doesn't support native 
>> fence waits. However, I
>> > > > > > guess it depends on how many native fences a job carries. 
>> So, if we'd have two
>> > > > > > jobs with each of them carrying a lot of native fences, but 
>> not a lot of actual
>> > > > > > work, I can very well imagine that over-accounting can have 
>> a measureable
>> > > > > > impact.
>> > > > > What I can imagine as well is things like the hardware or 
>> firmware is
>> > > > > looking at the fullness of the ring buffer to predict how 
>> much pending work
>> > > > > there is.
>> > > > > > > > > > I just wonder if we really want to ask for real 
>> measurements given that the
>> > > > > > optimization is rather trivial and cheap and we already 
>> have enough evidence
>> > > > > > that it makes sense conceptually.
>> > > > > Well that's the point I disagree on, this callback isn't 
>> trivial. If (for
>> > > > > example) the driver returns a value larger than initially 
>> estimated for the
>> > > > > job we can run into an endless loop.
>> > > > I agree it doesn't make sense to increase, but it wouldn't 
>> break anything,
>> > > > unless the job size starts exceeding the capacity of the ring. 
>> And this case is
>> > > > handled anyway.
>> > > > > > > > It's just one more thing which can go boom. At bare 
>> minimum we should check
>> > > > > that the value is always decreasing.
>> > > > Considering the above I still agree, such a check makes sense - 
>> gonna add one.
>> > > Please don't send anything out until we have solved this.
>> > I did, but don't worry about this, it helped me to finalize the 
>> rest of the
>> > patch. We can keep discussing this in this thread either way.
>> > > > So far I haven't seen any argument which would not let me 
>> reject this and I
>> > > don't want to waste your time.
>> > > > > Regards,
>> > > Christian.
>> > > > > > - Danilo
>> > > > > > > > Christian.
>> > > > > > > > > > - Danilo
>> > > > > > > > > > > > Regards,
>> > > > > > > Christian.
>> > > > > > > > > > > > > > Regards,
>> > > > > > > > > > > > > > > Boris
>

