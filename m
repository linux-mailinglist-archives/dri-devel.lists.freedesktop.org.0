Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F90805944
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76810E382;
	Tue,  5 Dec 2023 15:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8007B10E382
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRLPBcHRSX4WPhKb8j1oc5wSI/iM3NfqB94TwDYya8dEu8XcdayOlwfs9xfG6/ajlLm/Ucl207uey05aMc3gvDQ5GH6J8Z0aQf7R+iDRCvSB9JcnR/nhW7BU8z8zPCAmWh262pVzPCx2Z/UZUfsL6wqOvJvI9W1gE+m1qsWAh62O32t1iw8/Mt/SETwe1nbIU1xG/H5XMvMkX+W+hzH+B9oYVqFD3jKZQMXK8pE70qsGdxSsT+Njb3kjFbkZcnjpRFTCFROIzmq6loyo7aX1b1HVScrRbmTTVlYnKLigGnVsn9/fSUaC+M7jL+gQgACuJFx/OdXJujoYcmN4fXMItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMPn5mkDKxqOd2Ru5oZK41Yogi1DqLxE+vjcp1V4e4s=;
 b=XJUwp9Iit+JzIi6pw+M3tHYpxKj/KEFjCG3U05Cn6uMGpyW99C5MBfA1H4qWlUv/sVfVhEx6nVmo3/Xmp26o6EPd0wOVEyjnAWGBdmp8nEa08yrjsR2xk4LiBFjtFrnTadLQ+kEyMu9hTVIb3arrvfbOqH/shbYNhQgqDI6sJxbzqTGifmJIN+B1S7XucURnDz8rVfdQnUpdezvRI6gTyc5NxZQvT2Rt/hl0L7W195DEd6asrohjwG6dheBzpqPxX942xNafeeFkHYDy3MK/Eq+Ouou96kBGveId0AErhXM6EIwBwAWbfqs+1Ml7Ni4S0TVeS1CQWJFxekfvQMPW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMPn5mkDKxqOd2Ru5oZK41Yogi1DqLxE+vjcp1V4e4s=;
 b=r8/P1nP8/r29C35gU+QO5oPC8AS6y0H/JHLXEq8b8AwYNuv2SdlXUrcrYa2XvoHLotGzZelFBN2Iw5Taje8h84apiUB7HitMcVRcFxKJTRl1nsbgHPRfUy+W1zhtFiuhnaYjMO5MarLYHxKinKqdmeed10h1cDPkIZgFcWBCwAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 15:58:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 15:58:20 +0000
Message-ID: <96665cc5-01ab-4446-af37-e0f456bfe093@amd.com>
Date: Tue, 5 Dec 2023 16:58:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
 <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
 <e2fa296b-9b71-a41b-d37d-33f0fac2cd4e@amd.com>
 <CAF6AEGvdVca_mnZVo9He9oKVfYp84e_kOPWaxX+K5aV4Es9kcQ@mail.gmail.com>
 <CAF6AEGt2D6Ei6OkUK5osz+jWzmkX8tmB1KGi305HaNd=bnQSoA@mail.gmail.com>
 <69d66b9e-5810-4844-a53f-08b7fd8eeccf@amd.com>
 <CAF6AEGuSexYVL2RF4yVCJptfJgN9vvTgzGWn3CminbsYvctTaw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGuSexYVL2RF4yVCJptfJgN9vvTgzGWn3CminbsYvctTaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 0657bd26-4731-4bb4-b35d-08dbf5ab0056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tOnHHjXhJXMA/PTQy0LVfDfVHN5l1Pp8PjpvynxIweFAyl6xIITpmHC8wh7YDpI8iyExV/eXOm7adZVx+U/pDiTidcRAXZNuxi0EcNbl84ea/LHAHXSnoLT08tg/EdGBVMFTnQYEeySOahylX1ci0AXamb0sCjnKACL5hNP/OPjur1CL2c0Y8PkErowArg6AGNLjZtEMtVyfUJ+oQ5sOUPMbVqBvn8RaypBXFuw69HpL8p4BqwWWY7mxPPgZYvYETzBrSf42x7G7Kj7iHNdo6NsLUO/JvL60tEpO9WJoe7D2g5yC7LNmgGqspBNToUT7KJ8y8o242F4dAHnbCXmK/Ds2dz9a1JjGqmRGdzKFyQ5Zmtw8sVHzqERkOnKkFRJRJzNS1C9/Ot9rf+YJR1cToteg5OGIci2Jt1oXsT3eHsMkOMd2gzkEzc8pO91+UqfuI8V4VugoeNcNF1y3jb6f0LIsn5xEuGrBnu3Vb169gtu1GgHdcp5WvB0jxrm9mBqm/FbFE8WRdHB0LB0uqr0Oj2E5hvaPyUs6fjF1FwBdrAXJilXXCW2jsajOapbEDQozib/mSIvbnD647SZdpKfRpuJnMtl0bS//YWfIeQTVEtffhZ8qiVDHHQQ8wJ000lHdWsBsYgytKs4C6hHQfQnLEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(5660300002)(2906002)(86362001)(41300700001)(31696002)(6512007)(2616005)(53546011)(83380400001)(26005)(6506007)(478600001)(6666004)(6486002)(38100700002)(31686004)(66946007)(6916009)(316002)(66556008)(66476007)(54906003)(8676002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhWc2dWM2FydU1UbXNJeFpYcThWcHFJWkd1TTNBSXRhV0tqTTZRRlB1c1p2?=
 =?utf-8?B?RGpJUTZFZmZHUS9JM2xaaFpIMm1FWGg1Nk1uQjdYODJNNWR4enZqd2dsS1li?=
 =?utf-8?B?UmJxWHV6T2YyZXZnWko3Z25PNzdXRUpUa2MyeTRoRUJvVGd3SjdySnUxVXZ0?=
 =?utf-8?B?aWdlQWxhci9RWng0REFuOXM0MWtlSC8wTGRTSEJGY0ZjVFV3MjZDbzcwekk2?=
 =?utf-8?B?MmNSbHFXVXZmcUd4ZGExMi9FczFPeGEwaDk2UElwOUxqRG9HYjJPVEpNVzk4?=
 =?utf-8?B?ejZMSjk1R3hzNCtSSUU2MDY1dHhlZ3hxRUpPemc0NXNDTFI5VkdJMk81b0ts?=
 =?utf-8?B?dUtBWEIxVUxSNlJnamJ0U2VwQk9YblNVdFI1U1FsSUY4MlpLUzcreVV2Wi9q?=
 =?utf-8?B?b0NZSXF0cTkzeUZwem9qQXhMKzhxTnVPNDJmVnU5TWZReVZ4ZlkwS2haY0hy?=
 =?utf-8?B?QlBHbnBNalVjeFFYYWlOUVIxNlBvSlRaTjQ5akl5Z29WYnRMY1VkNVBWcVI3?=
 =?utf-8?B?dmh5S2g0M040VWVyZVFIcXh0aUVjc1RDcXZCbzJSQ0N0RitFNm96bXlKM2dy?=
 =?utf-8?B?TXoyUG9pRjRVTjBKaUZvSGdhQ2g3ZUZiR1NNTmxoay9JMmlzbllUVHBHSkxU?=
 =?utf-8?B?Mys5N01HTzNYQnIrWXhvZDZNYitVYmJtYjE2Q01NNmxwMkNjUDVUK2VCL0ts?=
 =?utf-8?B?S3NGWmRaZGxYbU51TFZuaVFOOVcySDhLSW1McTBSemJUcjlKV29zMTNLd2g3?=
 =?utf-8?B?aUdqaDlsYU9HajREd0szOGd4Y2RjTUJVV3NBVGU5bjBueHM2ZWFUNndmVHhy?=
 =?utf-8?B?bVdZOE9ac2JkdlZuZ2doaUdSZit0Rk5tRXU2d1BOcmgrdFFMakp5THNwR1dQ?=
 =?utf-8?B?b3p2M1NwZVNaNUhHMnQwWHNmL2NMNTdGWC9KTk9Mc2p2eEdndVFlNWJrQ1lj?=
 =?utf-8?B?R1k1MXV3VTdkeDBmbks4QnBYRDBGRGhmN2lKNldOZWM3aGlWUlZaYlZVZE5P?=
 =?utf-8?B?ZUZIYUNTM25tQllLZ3R1VFJ5bllUdGQzR3JicEtTN1Y2NUhXZVFBbXpQV2ZI?=
 =?utf-8?B?ckJkcmRrYmsxTGt5dEdXeE5uN3RUSFVCQk01U2RuU2tuQmxYVGlzT2FYL25X?=
 =?utf-8?B?R2ZLL3ZmbXNwdm9WQ2xrZEZDMmRhWnJEbWNkUEZEQmc5MjAvRTlDU2RsOTFK?=
 =?utf-8?B?TFF2QjJlM3F6YTZUWWo1dlovbjhYV2lQVldTZnhKaGJvYURUdFZPWmZCMlBn?=
 =?utf-8?B?NlFaRXpXRE50RCtkNk56U0o5VGdNc0ZCS0xYT0pDczJWZWZ1MUVSdXBMa3dY?=
 =?utf-8?B?ZHd2TWkwUllhTTNjVFQ3THY1c0diYUU1SkNveUVYV0gzbFo5aUxoSnlyUzYr?=
 =?utf-8?B?U01YRkNwQXJnSXgxZzFmVDRQd0pzMm0rUFRYYnZkU3NmZW9MYkRVK3JHU2hF?=
 =?utf-8?B?cThjQy82MXZoN1ViK3J3RkdSTXJLemExcW5ZM0VGZ0p6UExnaDgwRmVvL1VZ?=
 =?utf-8?B?WWtkWldKOGgxeGtXRlNrZGkxV0ZzS1BHaUdnbnB5dnFvRnNLaG9OMmZTbVFW?=
 =?utf-8?B?RVc3ME9WaGpndTBBVTVESUd4Mi84Sy9OZksxSUhqZXNKMWpMZmcrNm5CcVJw?=
 =?utf-8?B?R0FOcUFaUzdZUzFtd29mMzVZYW1LeVVwaEV5SkJVc3lJVDRkUDVBUlhESnNE?=
 =?utf-8?B?MndxL2d5NjZRVStrdU1VR2pTbkhRTVA2UnRnRDlMWlAyNzZ1aklaVktqejFy?=
 =?utf-8?B?bWhnbzNzYVI0M3QzMDMrTjB2MkhvcmVQM3k4dWd4YWNWejVOUk04cE43MzVB?=
 =?utf-8?B?d09WekROVHNnYTlleE5RYmNGV2dDRnJXRkQxNTV2ZlVqSFh0YnZ4bjh3YWVF?=
 =?utf-8?B?eC9UYWloVWxXMC9RYllQYlhJS0RGb3ZQN1RDbVZrWTgzbFJGNWIwQW9uMkc1?=
 =?utf-8?B?cFFHNjlnVEtUZDg3MTE2ZnVZSStOWEF2N2JiOVhrSzBQSWdJWW9xUXNNa0Q3?=
 =?utf-8?B?bW1wQ0UrZkw0Y21ydGlGZ1JPZ0JXdFpwblJuendweUtkNFYyclhBbzBRZkoy?=
 =?utf-8?B?dGZ3Nll4eU4zeHBpaldvWE5vcXI0ZXVHU2R1TlpoRDIxb0kreTBheXlBWjVZ?=
 =?utf-8?Q?x/VE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0657bd26-4731-4bb4-b35d-08dbf5ab0056
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 15:58:19.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woBcwZVYT97b5EHEPTefylJ2xAVOaYYYD7m6sf78w7kHMeARM792zPtWokqxfZew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4526
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.12.23 um 16:41 schrieb Rob Clark:
> On Mon, Dec 4, 2023 at 10:46 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 04.12.23 um 22:54 schrieb Rob Clark:
>>> On Thu, Mar 23, 2023 at 2:30 PM Rob Clark <robdclark@gmail.com> wrote:
>>>> [SNIP]
>>> So, this patch turns out to blow up spectacularly with dma_fence
>>> refcnt underflows when I enable DRIVER_SYNCOBJ_TIMELINE .. I think,
>>> because it starts unwrapping fence chains, possibly in parallel with
>>> fence signaling on the retire path.  Is it supposed to be permissible
>>> to unwrap a fence chain concurrently?
>> The DMA-fence chain object and helper functions were designed so that
>> concurrent accesses to all elements are always possible.
>>
>> See dma_fence_chain_walk() and dma_fence_chain_get_prev() for example.
>> dma_fence_chain_walk() starts with a reference to the current fence (the
>> anchor of the walk) and tries to grab an up to date reference on the
>> previous fence in the chain. Only after that reference is successfully
>> acquired we drop the reference to the anchor where we started.
>>
>> Same for dma_fence_array_first(), dma_fence_array_next(). Here we hold a
>> reference to the array which in turn holds references to each fence
>> inside the array until it is destroyed itself.
>>
>> When this blows up we have somehow mixed up the references somewhere.
> That's what it looked like to me, but wanted to make sure I wasn't
> overlooking something subtle.  And in this case, the fence actually
> should be the syncobj timeline point fence, not the fence chain.
> Virtgpu has essentially the same logic (there we really do want to
> unwrap fences so we can pass host fences back to host rather than
> waiting in guest), I'm not sure if it would blow up in the same way.

Well do you have a backtrace of what exactly happens?

Maybe we have some _put() before _get() or something like this.

Thanks,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R

