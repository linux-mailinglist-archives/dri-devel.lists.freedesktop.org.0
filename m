Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FE59866F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85465A3D4A;
	Thu, 18 Aug 2022 14:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF7A3862;
 Thu, 18 Aug 2022 14:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bcl0WlRB7ZsMMCHpAziidHSkNSiY3oFFHQYaBhHpwXpGJwYwmLrLOeyXtIBG5mdzPPQyWNuJXpd34nzt/4bY3JmeS36XcZM7CpFxa8i8ni580CAs26Vgy4ARoClLriDAcrLCRsbWPmaNHgjQQLm+pnJ4jpZssVLBSGC6VVemoSVElz/bdGNV723hVTSHFqK+CC3YZFrRvR7aOx4yjeeHyO/oEXWMp9HXmiF4PtEcIOHx3Scx6bOvbZ4c0Z2K/aSU50oX2C7Q4snKbUUu7Z6scbSrZCIdPte2SSuSkLcdzrQ+C1K/haF2RZU1mdb3q+aeGm4PRM99U80A6Gszf0HZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQfUHk2FuXycX1ZsKRVp2dGiAA4K/c+77P3+m7fWl6A=;
 b=SjQCc/84jMkm1RFDWDgq5vCqfYZRKigDirIN/slD+IZB1A80m9NNpsJrIQOxWYAR/kTSCYJhD3O7Iax5uKSJRGh5uB9JDx/06bYMbuwSRfqGUZIpvU93WnEux4+QLvtCxH1oJMeCMaTYvLaDdMs26QGKw6Wzc7Wnt8vex8RSPRrgssH+yDk1BclqhOlW4f5FbJ0AUG+AgQLlwf/gKN9yAcqVgT3/DkIa503iz/Y/EcJLO2h6jOfv2mmSGb9IUhlDaezF0o4N9ZV12q+u/nQIgV35gLm/sZnrW2bdc0TUa2foxx+2u0ieLtN4Eav5ImRavjJRjhVhpHV6NYTrKO2IXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQfUHk2FuXycX1ZsKRVp2dGiAA4K/c+77P3+m7fWl6A=;
 b=eTYoEDg4ePgbNpwEentLNl9q1EKnNwtgXp+gikDy5oD9l8KMumV+j3fvxtXGjNG4cLDdtsbnVjPOyBtXdUmYIriayXfZaRSjkchvF8dM1s39Kshu2OPvdntPgL2mQiPjNaRLtbhqfNgODV6TzTL5LvKyp9XBaW6PoxFiIgljdZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB2637.namprd12.prod.outlook.com (2603:10b6:805:6b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Thu, 18 Aug
 2022 14:54:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 14:54:09 +0000
Message-ID: <1d9da979-7d09-d80b-bc0e-f9641422b962@amd.com>
Date: Thu, 18 Aug 2022 16:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
 <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
 <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
 <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGtVMAzqECSTUFX1Zmb8BOLiq-n04nizO22J2ENcGTgQBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f451be-ee19-4ce6-1356-08da8129816f
X-MS-TrafficTypeDiagnostic: SN6PR12MB2637:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UGHBJqsUVOiHEY5XZ9230+LUudtz76LyxUGAvI2ZrgVl74UuYDZ6dOjKgpCXEhi1JlIY5wxmay4IncM9z3NscONZw3n2BWh89M9ujKFYSSJc2wjScUZJo0yNXjC56W1G/gmSXzEqs92lkNGtbvLhrNhpFBLTyMCsuqYuflDfB6NRHDXtSKNWVEN4obN2F41a1vCDJbjtVjAKwssDOlIsRueXgGnF6RyDidu01JrlFho/YwqxCGNK+k+huauriXX+7PV+L2od0sqjqYZypweKSIz0ilBYKwPGwtUprD704ruZdLZ85HtXa0bJPj8B+lwcr2Lky7W5AztgkuqIxJJiBhWm5kRKdTiRTBbc5z4Qm3DWe1FGCPCrU0T0BbjBOp68eWgnJlxqsd30Cobt8EaPs3sm93UD0EwdkukH6g9sq7EzC6QVumP6pR67Poj89ZKAD+1mgx3ZcPPqhOdL1JRdrC1RWxh3+WsENkXTvlncV5YqSLYWUQq+ZNj2LZq50QcTaBwxjtH2gUAQEETeuLsdCwCwpDGWZV4fyR9tUAkGQLd8lcGcc+RgAHsTc23PUTbUGiKK15NqU2eGfpBg2NHIJ1dcrm6vbI1QJCsttqPenqio9dnhBU59MQqWh3DRTObuikYBxo3Q13lzctqrJ9axnHCF5iuAqysaX7DXPpjYnPc7S823lrFfNwyLYU6QhX9XDIX7RhA3ta8zZjJAWf7cRYIo1v5spXXb5b/PPvMoi3VykhUQK5qt5+ZGek7+EPPGRTpaemE4l0JiOrvZTvyaWK+vX5JsTCPX2yAtKpLkfVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(5660300002)(66556008)(8676002)(31696002)(54906003)(66946007)(31686004)(478600001)(316002)(6486002)(7416002)(36756003)(30864003)(8936002)(66476007)(6916009)(41300700001)(53546011)(2906002)(4326008)(66574015)(86362001)(6666004)(6512007)(6506007)(2616005)(186003)(38100700002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdSejJMNG03a1krclZSU2ptQURpcmRVZ1JDckdyaEZ3YjQxWVZLVk5rbjdp?=
 =?utf-8?B?TGlsdkVGMWJUV2kxUXNTYndJclBLUFE2cTN1MTNmMHJVVXBFNkV0aVY5N2tt?=
 =?utf-8?B?eUhwTkxLT0N2UkVaN0J5SG1ZZDkvQlE3endxSzNtQzFJTkVKV3pXWUlIOWd4?=
 =?utf-8?B?d1JLQkRPcXNpVjlwelRvLytRd3FwQzFlMjAvWi81ZjFBZUdXNGpmd2Ntclk4?=
 =?utf-8?B?ZEdmOHBEQUdBQUNJUHV1enh6eHBwQlltNG9zcWJkL2FBMnNYTitLK1l4SFBq?=
 =?utf-8?B?NndrU3NUNFFMQlhwd3oyaFFpWk8reDVYRVdGRkFMWTZuUWtpTmdsemFBcEJR?=
 =?utf-8?B?R1dkVGU5NGRMZXFUWkttWU1kR2JiZzVxNWJYSmY3cC9FT3NBUW1Ld0lZTXJs?=
 =?utf-8?B?MkVuRDRZdzJLVTV5cHdHemkwdm1mSXczeDFDbWMwTU8rdDQxZVpGaWZia0lt?=
 =?utf-8?B?dzRaanlsZDhGdFhrNXNRUE9rdTNBd3RDTFpBcng5OVFIdzJFK09kUnZvekox?=
 =?utf-8?B?NUR4djRaZFp5UG1YdjdEOWdmaVEzWUR1T0VBa1RvTW11REhRYkQ4SWVCSzRj?=
 =?utf-8?B?Z05GSGpScm1BWlI4d1A2THE5QWVDb1A4aVZTUGF4Z1AyYlNGZm5SVUJhR3Zs?=
 =?utf-8?B?bi9LeldwWDVUNXprMUpWK2JYb1NZZzU4M3NMcDJOZk5ZZnRham1INzZOZjFL?=
 =?utf-8?B?Ym9xRE1qdDNQaDVwd2JpYXhPZCtxT29kZFVHVFdwUzd2NE9wRHdJaXp6WjJ2?=
 =?utf-8?B?YWp6bGJvZXJ1VUZBMVM1Q3pLK2sxN1ZYaVF6bWM0SDNRWVU1bHZ1Y3ZOd2g4?=
 =?utf-8?B?bCt1c3hUUlozeVBSWHdtRWc1cDZ2K2NTQTBNTUU1NjJiYy9LOEVZYnNvVzl5?=
 =?utf-8?B?NHdPOFA5ckpFd0FkajUzb1AvdmZLU2hrbjI1bDNFR3c3djhqK1FJRjFGQzFZ?=
 =?utf-8?B?dlo1OTh0STA1c1JIV1pkWTVuTit3WS9EU0VHMFUyY1lSQnVXVmplcjc3RkZl?=
 =?utf-8?B?ZFhlSmhDVWJBaGVvRWdhc0xSYVUwZHdQeFh0L2srTmVmZlRxNzV4aTgxKzU2?=
 =?utf-8?B?enBVcW9KaHNrUkNrK2ZjcENwc09FSVYxVDlyK2IrRUZ2WUtEZ09MZEpaRVFv?=
 =?utf-8?B?REEzTXJHV2YvKzVRVkwyREdtSmUwY2dRUVF4Zm40aVY1eGJiOGdqdFM3bWEr?=
 =?utf-8?B?a1UrRmJycVFQVjRlOThZOVZZanpNNU94U2cvT3NTWWJkRjJQQ3UwdzBvWXFw?=
 =?utf-8?B?dGtCazVveHhGWmh6T1BYS2hnVmgvRlk5S3RQNzMydy8rRFdvZ0lUM0taUjRj?=
 =?utf-8?B?ZUtoNG5MbENFSkwxNUFPSi81dlpVTVBXVkdodXhsemlkell0djlHcWl6UjdZ?=
 =?utf-8?B?dGkrU1h5eXFhQ0xPRjhQN2VrUC9pRmV1Ti9yWHcxV0hEcnAwNVIwQ29xZjJ5?=
 =?utf-8?B?SHVHQkErMUpQUGpaWUJlZzAxbCtOK3NhNzdQUFZSb2Q5aUllS1l2N2haNUxw?=
 =?utf-8?B?UjFXVFppazRPWkpNeVIzeWxLYVFZSDhjaklYb3hDZGVYZ0h0aEJFeE91UmxY?=
 =?utf-8?B?d1RHdUhRZU9ocEZHZE9XdGt1VGNCeFdKU0ZzV0JISytJVnRVS3pic3A2dE1E?=
 =?utf-8?B?VHFEc0hsZjg5VDc4VEJFa0pkeGk0TVc4WTNUWERTd0U2OEQrRTY5T2h5SG1u?=
 =?utf-8?B?dysvM0hWM21FclBoZlhhSExEeDdwUEV2d3NuRENkM3E2VWJ0N1dCaVIzSDdh?=
 =?utf-8?B?dVkxWnk1TWlUMVF4SE1sNjJYa0FqOUZaUEVTeXloWUZCcGR4Sm16MWVjUEx2?=
 =?utf-8?B?M0w5WENxMjdBVjZKN1N5SzlvODRUQzNpN1pXS0Q2bmZtYWhoTlVOVzl6bGFI?=
 =?utf-8?B?cE1MTTFNL1ZsRTRvVmNGYkRJd0w1enpmNHdUMEdWUG5FNWZoNmJmTnJSM055?=
 =?utf-8?B?aHYvcElEMm1ieFI5cmRwRm9QQVVsK2NkL3BCR1hacld0dDM1dDZZcjdJR0d5?=
 =?utf-8?B?YytxeEdHV2g5b1BsQmg0RUNuWTluQUNZYkdDTEdrWng1UENTSTBzWTR4TTVO?=
 =?utf-8?B?QVNCWVhSOGVxK1ovMHpvV21QUXRYRlowQ3ZSdmJLN29RbXBFeTRLVUhTTFFp?=
 =?utf-8?B?Y3Z2QkV6MWtRR1F1eUpvRXh3N3RCbURvUmlJRkd4YWQwVEUzOGxDU3FvbEM3?=
 =?utf-8?Q?4KPRueuj6qIKz2946P4NbEtweEWZRYSbZPxLN6vSEYbo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f451be-ee19-4ce6-1356-08da8129816f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:54:09.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4aiWmr4OrFUyL3Nd4cBQy9hlCPzHDMD9T6ari/vmd+MEi3WN5YUTcniLO+RS6ux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2637
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
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.22 um 16:25 schrieb Rob Clark:
> On Thu, Aug 18, 2022 at 4:21 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.08.22 um 15:44 schrieb Rob Clark:
>>> On Wed, Aug 17, 2022 at 2:57 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> [SNIP]
>>>>
>>>> The resulting cache attrs from combination of S1 and S2 translation
>>>> can differ.  So ideally we setup the S2 pgtables in guest aligned with
>>>> host userspace mappings
>>>> Well exactly that is not very convincing.
>>>>
>>>> What you want to do is to use one channel for the address and a
>>>> different one for the cache attrs, that's not something I would
>>>> recommend doing in general.
>>> How would that work.. mmap() is the channel for the address, we'd need
>>> to introduce a new syscall that returned additional information?
>> The channel for the address is not mmap(), but rather the page faults.
>> mmap() is just the function setting up that channel.
>>
>> The page faults then insert both the address as well as the caching
>> attributes (at least on x86).
> This is true on arm64 as well, but only in the S1 tables (which I
> would have to assume is the case on x86 as well)
>
>> That we then need to forward the caching attributes manually once more
>> seems really misplaced.
>>
>>>> Instead the client pgtables should be setup in a way so that host can
>>>> overwrite them.
>>> How?  That is completely not how VMs work.  Even if the host knew
>>> where the pgtables were and somehow magically knew the various guest
>>> userspace VAs, it would be racey.
>> Well you mentioned that the client page tables can be setup in a way
>> that the host page tables determine what caching to use. As far as I can
>> see this is what we should use here.
> On arm64/aarch64, they *can*.. but the system (on some versions of
> armv8) can also be configured to let S2 determine the attributes.  And
> apparently there are benefits to this (avoids unnecessary cache
> flushing in the host, AFAIU.)  This is the case where we need this new
> api.
>
> IMO it is fine for the exporter to return a value indicating that the
> attributes change dynamically or that S1 attributes must somehow be
> used by the hw.  This would at least let the VMM return an error in
> cases where S1 attrs cannot be relied on.  But there are enough
> exporters where the cache attrs are static for the life of the buffer.
> So even if you need to return DMA_BUF_MAP_I_DONT_KNOW, maybe that is
> fine (if x86 can always rely on S1 attrs), or at least will let the
> VMM return an error rather than just blindly assuming things will
> work.
>
> But it makes no sense to reject the whole idea just because of some
> exporters (which may not even need this).  There is always room to let
> them return a map-info value that describes the situation or
> limitations to the VMM.

Well it does make sense as far as I can see.

This is a very specific workaround for a platform problem which only 
matters there, but increases complexity for everybody.

If we don't have any other choice on the problem to work around that I 
would say ok we add an ARM specific workaround.

But as long as that's not the case the whole idea is pretty clearly a 
NAK from my side.

Regards,
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
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>>>
>>>>>>>> If the hardware can't use the caching information from the host CPU page
>>>>>>>> tables directly then that pretty much completely breaks the concept that
>>>>>>>> the exporter is responsible for setting up those page tables.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>       drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>>>>>>>>>       include/linux/dma-buf.h      | 11 ++++++
>>>>>>>>>       include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>>>>>>>>>       3 files changed, 132 insertions(+), 10 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>>>>>> index 32f55640890c..262c4706f721 100644
>>>>>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>>>>>>>>>           .kill_sb = kill_anon_super,
>>>>>>>>>       };
>>>>>>>>>
>>>>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>>>>>>>> +{
>>>>>>>>> +     int ret;
>>>>>>>>> +
>>>>>>>>> +     /* check if buffer supports mmap */
>>>>>>>>> +     if (!dmabuf->ops->mmap)
>>>>>>>>> +             return -EINVAL;
>>>>>>>>> +
>>>>>>>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * If the exporter claims to support coherent access, ensure the
>>>>>>>>> +      * pgprot flags match the claim.
>>>>>>>>> +      */
>>>>>>>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
>>>>>>>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
>>>>>>>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
>>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
>>>>>>>>> +             } else {
>>>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
>>>>>>>>> +             }
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     return ret;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>       static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>>>>>       {
>>>>>>>>>           struct dma_buf *dmabuf;
>>>>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>>>>>
>>>>>>>>>           dmabuf = file->private_data;
>>>>>>>>>
>>>>>>>>> -     /* check if buffer supports mmap */
>>>>>>>>> -     if (!dmabuf->ops->mmap)
>>>>>>>>> -             return -EINVAL;
>>>>>>>>> -
>>>>>>>>>           /* check for overflowing the buffer's size */
>>>>>>>>>           if (vma->vm_pgoff + vma_pages(vma) >
>>>>>>>>>               dmabuf->size >> PAGE_SHIFT)
>>>>>>>>>                   return -EINVAL;
>>>>>>>>>
>>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>>>>>       }
>>>>>>>>>
>>>>>>>>>       static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>>>>>>>           return 0;
>>>>>>>>>       }
>>>>>>>>>
>>>>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
>>>>>>>>> +{
>>>>>>>>> +     struct dma_buf_info arg;
>>>>>>>>> +
>>>>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>>>>>>>> +             return -EFAULT;
>>>>>>>>> +
>>>>>>>>> +     switch (arg.param) {
>>>>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
>>>>>>>>> +             arg.value = dmabuf->map_info;
>>>>>>>>> +             break;
>>>>>>>>> +     default:
>>>>>>>>> +             return -EINVAL;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>>>>>>>> +             return -EFAULT;
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>       static long dma_buf_ioctl(struct file *file,
>>>>>>>>>                             unsigned int cmd, unsigned long arg)
>>>>>>>>>       {
>>>>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>>>>>>>>>           case DMA_BUF_SET_NAME_B:
>>>>>>>>>                   return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>>>>>>>
>>>>>>>>> +     case DMA_BUF_IOCTL_INFO:
>>>>>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
>>>>>>>>> +
>>>>>>>>>           default:
>>>>>>>>>                   return -ENOTTY;
>>>>>>>>>           }
>>>>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>>>>>>>           dmabuf->priv = exp_info->priv;
>>>>>>>>>           dmabuf->ops = exp_info->ops;
>>>>>>>>>           dmabuf->size = exp_info->size;
>>>>>>>>> +     dmabuf->map_info = exp_info->map_info;
>>>>>>>>>           dmabuf->exp_name = exp_info->exp_name;
>>>>>>>>>           dmabuf->owner = exp_info->owner;
>>>>>>>>>           spin_lock_init(&dmabuf->name_lock);
>>>>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>>>>>           if (WARN_ON(!dmabuf || !vma))
>>>>>>>>>                   return -EINVAL;
>>>>>>>>>
>>>>>>>>> -     /* check if buffer supports mmap */
>>>>>>>>> -     if (!dmabuf->ops->mmap)
>>>>>>>>> -             return -EINVAL;
>>>>>>>>> -
>>>>>>>>>           /* check for offset overflow */
>>>>>>>>>           if (pgoff + vma_pages(vma) < pgoff)
>>>>>>>>>                   return -EOVERFLOW;
>>>>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>>>>>           vma_set_file(vma, dmabuf->file);
>>>>>>>>>           vma->vm_pgoff = pgoff;
>>>>>>>>>
>>>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>>>>>       }
>>>>>>>>>       EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>>>>>>>>
>>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>>>>> index 71731796c8c3..37923c8d5c24 100644
>>>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>>>> @@ -23,6 +23,8 @@
>>>>>>>>>       #include <linux/dma-fence.h>
>>>>>>>>>       #include <linux/wait.h>
>>>>>>>>>
>>>>>>>>> +#include <uapi/linux/dma-buf.h>
>>>>>>>>> +
>>>>>>>>>       struct device;
>>>>>>>>>       struct dma_buf;
>>>>>>>>>       struct dma_buf_attachment;
>>>>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
>>>>>>>>>            */
>>>>>>>>>           size_t size;
>>>>>>>>>
>>>>>>>>> +     /**
>>>>>>>>> +      * @map_info:
>>>>>>>>> +      *
>>>>>>>>> +      * CPU mapping/coherency information for the buffer.
>>>>>>>>> +      */
>>>>>>>>> +     enum dma_buf_map_info map_info;
>>>>>>>>> +
>>>>>>>>>           /**
>>>>>>>>>            * @file:
>>>>>>>>>            *
>>>>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>>>>>>>>>        * @ops:    Attach allocator-defined dma buf ops to the new buffer
>>>>>>>>>        * @size:   Size of the buffer - invariant over the lifetime of the buffer
>>>>>>>>>        * @flags:  mode flags for the file
>>>>>>>>> + * @map_info:        CPU mapping/coherency information for the buffer
>>>>>>>>>        * @resv:   reservation-object, NULL to allocate default one
>>>>>>>>>        * @priv:   Attach private data of allocator to this buffer
>>>>>>>>>        *
>>>>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>>>>>>>>>           const struct dma_buf_ops *ops;
>>>>>>>>>           size_t size;
>>>>>>>>>           int flags;
>>>>>>>>> +     enum dma_buf_map_info map_info;
>>>>>>>>>           struct dma_resv *resv;
>>>>>>>>>           void *priv;
>>>>>>>>>       };
>>>>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>>>>>>> index b1523cb8ab30..07b403ffdb43 100644
>>>>>>>>> --- a/include/uapi/linux/dma-buf.h
>>>>>>>>> +++ b/include/uapi/linux/dma-buf.h
>>>>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>>>>>>>>>
>>>>>>>>>       #define DMA_BUF_NAME_LEN    32
>>>>>>>>>
>>>>>>>>> +/**
>>>>>>>>> + * enum dma_buf_map_info - CPU mapping info
>>>>>>>>> + *
>>>>>>>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
>>>>>>>>> + *
>>>>>>>>> + * Importing devices should check dma_buf::map_info flag and reject an
>>>>>>>>> + * import if unsupported.  For example, if the exporting device uses
>>>>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
>>>>>>>>> + * CPU cache coherency, the dma-buf import should fail.
>>>>>>>>> + */
>>>>>>>>> +enum dma_buf_map_info {
>>>>>>>>> +     /**
>>>>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
>>>>>>>>> +      *
>>>>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
>>>>>>>>> +      */
>>>>>>>>> +     DMA_BUF_MAP_INCOHERENT,
>>>>>>>>> +
>>>>>>>>> +     /**
>>>>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
>>>>>>>>> +      *
>>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>>>>>> +      *
>>>>>>>>> +      * The cpu mapping is writecombine.
>>>>>>>>> +      */
>>>>>>>>> +     DMA_BUF_COHERENT_WC,
>>>>>>>>> +
>>>>>>>>> +     /**
>>>>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
>>>>>>>>> +      *
>>>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>>>>>> +      *
>>>>>>>>> +      * The cpu mapping is cached.
>>>>>>>>> +      */
>>>>>>>>> +     DMA_BUF_COHERENT_CACHED,
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * struct dma_buf_info - Query info about the buffer.
>>>>>>>>> + */
>>>>>>>>> +struct dma_buf_info {
>>>>>>>>> +
>>>>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
>>>>>>>>> +
>>>>>>>>> +     /**
>>>>>>>>> +      * @param: Which param to query
>>>>>>>>> +      *
>>>>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
>>>>>>>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
>>>>>>>>> +      *     caching of a CPU mapping of the buffer.
>>>>>>>>> +      */
>>>>>>>>> +     __u32 param;
>>>>>>>>> +     __u32 pad;
>>>>>>>>> +
>>>>>>>>> +     /**
>>>>>>>>> +      * @value: Return value of the query.
>>>>>>>>> +      */
>>>>>>>>> +     __u64 value;
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>>       #define DMA_BUF_BASE                'b'
>>>>>>>>>       #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>>>>>>>
>>>>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>>>>>>>>>       #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>>>>>>>       #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>>>>>>>
>>>>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>>>>>>>> +
>>>>>>>>>       #endif

