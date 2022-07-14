Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A1574803
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3C8A3B4A;
	Thu, 14 Jul 2022 09:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBE6A3B3F;
 Thu, 14 Jul 2022 09:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYk5ySgQKsnr7MPVmmbUBRhDhFJmKwx6rUxza9aDxbklb+T3W5zPz9+PGsPsIhLSnK3pV42u1fdudXa3L6g4K6EjTula4VHNT4PmiPSMzydC/3nsuDp23Q1WHoeQNXEKGrzsVHLqK425wv23KTJcx8JsMfBjO5xU5sZ/JC8N+Gg1NLW52AnsOMmFzxNj5MSInrU6Y7JC9ShgW/cFn4FYDEvuPfBbivapoFYxIbTmUB/dxTAHHjijAsj1gGHATdxJRUtAME2IjO0ivYskDANwxfRBxXdaKvOe3WySrpOr+8s0wuc/j1P8LlMBwVYfbXuPqIMcZHcSS8JOpBVTUY3bDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWMTMT+KU1gDyurIiQHQKrXQb1nYB+26FqiV7yebWUw=;
 b=jLEAX8mWvoeLZaTJUZT/LtEjROlXJKFEb5QZY5apt/uNMksumHct8aPGkgXAmWIlmKWGRcrnBApQpgobz3lgL3puv++TESdO8e+ficJoIj8VEGD4j8oaS/7uzVIOnmANPSQgH7/z6xSTj3U43QcFIS3MXD80fwaU1l/PidS8d1EFAkRFfeG0EQ7TwBQ3yrwI0s6UY6Veo+MJ8t0HZlM6YMqn1Uvjs3U1Ytc4fYwMP8CGnLdpWanhUZX80GOXKB5BCmJ0pRFFQJ2KygG4ovc6KazFtYG8eYM6o4bv7q5p1SIQyUgvV+TlgccsvAUT7y/8CNKWixSvDKlCOc9rl3HLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWMTMT+KU1gDyurIiQHQKrXQb1nYB+26FqiV7yebWUw=;
 b=tGbKlDTCdU9AQEDXlU9heINgOCaeW9csVO2eX+d43ufmI1VBZF4BgOaH0tL92CaFAUWdDQZX3Vglq12Ous1nJzIAxwtvSDX6mApWhobDEAb5y+tgdQGzIQ+6oIXNSVHjUrJI3QNOZ1/tEeAoPN/Q8kejlOi5bJnv/AQZgfWDxsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3533.namprd12.prod.outlook.com (2603:10b6:208:107::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Thu, 14 Jul
 2022 09:13:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 09:13:11 +0000
Message-ID: <25194bfc-4670-02a9-f494-9eab41fd0b74@amd.com>
Date: Thu, 14 Jul 2022 11:13:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: revert "return only unsignaled fences in
 dma_fence_unwrap_for_each v3"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <20220712102849.1562-1-christian.koenig@amd.com>
 <5b8aa549-c2f1-19b2-d0f4-26d4ea1a7ade@suse.de>
 <e3accc2e-75e5-459a-ea72-116e44f73238@amd.com>
 <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b16e783a-e7a2-09d5-a8c0-b3b8d18a3e1f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce2a93b-868f-4397-daae-08da657912ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB3533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Fbqei3L5qBjUcLmqbGWYHy6V8PLoeydpF5AnVT0mb3ythg3rKmYTW7UE3hZcoxE/VJYUe7sqduwc3ym2sy2IIwLleruPsqOIinXnglz+Z8cCkoj3iCprIePwbQyWSpSvoHUZy5pSSontJom8JCZ0PpEJz7snz2quZjo8RcKCIXrVcDTEjsr6KcrxpqsQgprmUWX+0FDVs/rxqjHqWsPkhc2hAdEH9DAwuwkPK0XzjbedJqGBfgme7BGsWWv3oak7FlK1gAj12+szdNrbhGFv//9HR6qYvU5cf7lygoDhoa/erVvF0f/Y7d0tkv5Dfq7JULR6/HinD+nJNbvH7Uw6WSZy8qRxTbzic22jBV1ZfhY52+exQKe9csfswVQ90K9Tnh3eRMfCg9UI4swxqP1ZzEqVdsIUcyVQlYkcjL1Mmgaofn8wdlUQWqGpnFcNIQWUL2Nst3MgClEf3q400gWPGBUOsYuogPZJMtlljgFWkEq8bOVvXBeCGejfqrBu8FUZnvVQuxVFTekYlY/n0zcbcApzxhb7HRiJ3q2h3OYKMBgJSOMTea3zT1xwv/QrEJp9KZKrB2j2Fhs45OR1HMvgwXDBb02BtpjAeJw0bB3gPK5r3M1MdPvAzBGQP6eupvVburzlSwH6CVsWNlVkCAoyovtJQN6DtncYlPCIGNsyXesgpSS3ePpDvy8TUsHjBk2cInOc81tKrvxiCbk6YzSRVZD8ZbG2v/mjYi4DHCzXIbaSYRIgDm5FItyiLM0vbNGBwQP3qTvhZsZgkrPLL+E6mxne0tM1Wybz/cKt2EgC8SyCtLqYpX30M5PGBOq2o3iXXSfL6W1humDgRuEyQ+PS95ZNr7SMR1HNmyxyMseQQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(186003)(6506007)(66574015)(6666004)(41300700001)(2616005)(26005)(6512007)(2906002)(38100700002)(83380400001)(478600001)(86362001)(8676002)(31696002)(316002)(5660300002)(31686004)(66946007)(6486002)(110136005)(66556008)(36756003)(66476007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVYrejMrVEZsMlNSSTErMFRqQ2ZTc0hyQWhVbXhkOWFRbjVnK25mVFIwS29D?=
 =?utf-8?B?OUJ4MGhUdHVRL21kV0dXcHdzTVJDUnVmeG8wanVIcVpIOC84dWF4SjBVWlln?=
 =?utf-8?B?c0NIbC9lRjN0ZEx4aEVhek9GSVNOL2JrSGV6MysrOERsUWZVV05Eby9QOUNx?=
 =?utf-8?B?ckdEQ0xjYnFsQjV1TC8wamk2b2liWWlOMGUvd1BwdVhITjRCaU9ubTg5ZjJN?=
 =?utf-8?B?MVFDdWtsQ2sxU1M3NS80L1haMjI4UkQza0ZoQkYxbC9DTFNyaUVpb0ZiKzJo?=
 =?utf-8?B?cUhZd1h0R2xZRHcwS1g1bldOSDNmQ1ovUjhBSFR2eURDLy9MaGI5eFprRnAy?=
 =?utf-8?B?NFlNNGtnSWJPbkR1eEtNQWNaY1plSlVSaUVMK2t5Y2RNTzdXM08wOThaRXV0?=
 =?utf-8?B?bStWZUE2RzZtaFU0YzdwakpqYjc4M2VyYWJ0aHlxZ1dHWjk4QW1GcnE1cWVm?=
 =?utf-8?B?dkFYMmx2RStvRWVrZndENkoxeldLV0dOUnZpOUhxS3FMQXF3Y2NZSW4ramU3?=
 =?utf-8?B?bW4vRUhUSmZxd2hzZEE1anIrVERDQnA5allDTU00NUJBRjl3N2loandoMktM?=
 =?utf-8?B?aE9OcUxxaUplV082eU5FZHllcmg5ekJSK3hPaUNtVm53b2pHeXRnWDg3NjQ2?=
 =?utf-8?B?YmtoRGhQWjVzNDZ4Y280a0RJR2puK21wUFFIUlV2YkNBN2RwYjQxeEtvc2l1?=
 =?utf-8?B?N1NFNld3TE9mbHk2Y29aaGpxNk9iRUpGR0drVzF1akwydWRCbFY5UkpwTE10?=
 =?utf-8?B?MGJVNHhMZUk1Q1VDd0RHeDZud3ZOZFZnZGRrUXd6NkhpRU5kQXRha1dXZUdp?=
 =?utf-8?B?S0E2OThxUDlRMVRSelVLRUlQYnQ0SnhNYUF3anZubkdsVE1DQ2M0VWdoUEtO?=
 =?utf-8?B?VHRSS3pOMHlOd0tRRnRiYmRsV0FiOFRxMDZQVmNFbVdFaE1ac242OCtYZFl3?=
 =?utf-8?B?MjdxME9XV1RuRWwzTlZURnV0T25mbUxSWTFkNEt0OFBDeWExNjY5YjQya2FP?=
 =?utf-8?B?dnpicXFhNEpTUkZDSmdOd3hWZ2NQK1BkSmtJbWNjY0UvbXhyUE9xbzR3bkZW?=
 =?utf-8?B?N3ZhVmlNWW4rdUVlRjhnOFVRVDhqTURqa1dvbjhoMUpMNDJpRG1ucUh2ZlAr?=
 =?utf-8?B?cC9uS1RlQXFKdHk1NWdLTUZJeHRrTWYvOUQ1aGFENWJZUko4S0FsdmFxMGUr?=
 =?utf-8?B?QmI4OFVvZzNSMkxTRzlLOW5Tb2UzRG5ManlsemFocWVTVVFzVUk5eFUrZkxZ?=
 =?utf-8?B?S2xkMzJkMktqdkxEZnNPQkcwMkxaTS90Qkx3NjVjQWFOcmc0KzNiZ09XYzcx?=
 =?utf-8?B?ZGY0WlhJb2VBZ2h6eVZTdDM1ZFZqNm9WcGhNdG1mUFFOVGR5ODZzU2I0aHli?=
 =?utf-8?B?bk11WllWOUw4dDFXb0pFWGNId1JHTXVkd05nMTN0czhHRlcwdzIzMTR3b2pI?=
 =?utf-8?B?WjRVOHl2aXpmeVpxN3cwUWIwU1Mwd2N0RWYrVkVUeWt4SCtOb0ZkNlBjYWZx?=
 =?utf-8?B?VVVKNEhvbHdmQkQrd0hHZ0FOZkxNOU1ELy81MDZpVjdER05jU05lNmJRMjRD?=
 =?utf-8?B?Z1ZkOTFibjJRUzhQaml1ZlJXeThBYlJJbFB0ODRZU1R5RFNVMms3MkVDZDgz?=
 =?utf-8?B?V1YvOXdvMnZlcENwYXB2K0VhaUVFYUhUL2E2K0RESDlVMmJDVEt2Y0Z4REt5?=
 =?utf-8?B?b2xrQ1R4MUVsc3plYlUvekxqdzZ1cHdzcm1aSDRpc0wzQ2JHaGFqaEJmQzR4?=
 =?utf-8?B?bk9wbkUwdzVQcjNVV2dpUFlzMmNmQ3NDOGpXZzNPUFhyc2REeCtqVisyNzdP?=
 =?utf-8?B?THJWWWt2cWI4SnZwcHBhUlNpMDExczcyVnB0MW50aDhKbjkyUUlJY1ZOYjVs?=
 =?utf-8?B?RHFtRENHcXJiaCt3elQvd0luemZRVlpqNjZ1TTFXSERUUEMwMXRnOHhFOVFE?=
 =?utf-8?B?di9zNUFmMFdEeEF6aERKUmJ0bmVBeHIzdzRFYWFaaXgwNzRpaXR0QXFkaGZs?=
 =?utf-8?B?aXNIYW5UdGpqbVI2OG40UFI3SWpwYUljVTRvNVhkdmZRWGV5a2I1UUJzeE1l?=
 =?utf-8?B?RHYraEdMclNJYXhpNWpiNWZ5cGN2OE4veDhiYnl3eFRpUWR6Unh5TlorYXow?=
 =?utf-8?Q?q/+xXL7rPduliX7KjgswT3+Nh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce2a93b-868f-4397-daae-08da657912ef
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:13:11.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYkMELlMBdl7L9zx5fAjYvOoaEUAnG18X0fluP4N283o8SXffdjhOagWZ1qt+ghE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3533
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

Am 14.07.22 um 11:06 schrieb Thomas Zimmermann:
> Hi
>
> Am 14.07.22 um 10:49 schrieb Christian König:
>> Hi Thomas,
>>
>> Am 14.07.22 um 10:40 schrieb Thomas Zimmermann:
>>> Hi Christian
>>>
>>> Am 12.07.22 um 12:28 schrieb Christian König:
>>>> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
>>>
>>> I only found this commit in drm-misc-next. Should the revert be 
>>> cherry-picked into drm-misc-next-fixes?
>>
>> yes for all three patches you just pinged me.
>>
>> I've already tried to push them to drm-misc-next-fixes, but the 
>> patches somehow wouldn't apply. I think the -next-fixes branch was 
>> somehow lagging behind.
>
> I just forwarded drm-misc-next-fixes to the latest state of drm-next. 
> Chances are, these patches will apply now.

Thanks, should I cherry pick them or are you going to do it?

And can we somehow make sure that when the drm-misc-next is merged into 
drm-next for upstreaming that drm-misc-next-fixes is up to date as well? 
That would make things much easier.

Thanks,
Christian.

>
> Best regards
> Thomas
>
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> It turned out that this is not correct. Especially the sync_file info
>>>> IOCTL needs to see even signaled fences to correctly report back their
>>>> status to userspace.
>>>>
>>>> Instead add the filter in the merge function again where it makes 
>>>> sense.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
>>>>   include/linux/dma-fence-unwrap.h   | 6 +-----
>>>>   2 files changed, 3 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>>>> b/drivers/dma-buf/dma-fence-unwrap.c
>>>> index 502a65ea6d44..7002bca792ff 100644
>>>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>>>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>>>> @@ -72,7 +72,8 @@ struct dma_fence 
>>>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>>>       count = 0;
>>>>       for (i = 0; i < num_fences; ++i) {
>>>>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
>>>> -            ++count;
>>>> +            if (!dma_fence_is_signaled(tmp))
>>>> +                ++count;
>>>>       }
>>>>         if (count == 0)
>>>> diff --git a/include/linux/dma-fence-unwrap.h 
>>>> b/include/linux/dma-fence-unwrap.h
>>>> index 390de1ee9d35..66b1e56fbb81 100644
>>>> --- a/include/linux/dma-fence-unwrap.h
>>>> +++ b/include/linux/dma-fence-unwrap.h
>>>> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>>>> dma_fence_unwrap *cursor);
>>>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>>>> dive into all
>>>>    * potential fences in them. If @head is just a normal fence only 
>>>> that one is
>>>>    * returned.
>>>> - *
>>>> - * Note that signalled fences are opportunistically filtered out, 
>>>> which
>>>> - * means the iteration is potentially over no fence at all.
>>>>    */
>>>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>>>> -         fence = dma_fence_unwrap_next(cursor)) \
>>>> -        if (!dma_fence_is_signaled(fence))
>>>> +         fence = dma_fence_unwrap_next(cursor))
>>>>     struct dma_fence *__dma_fence_unwrap_merge(unsigned int 
>>>> num_fences,
>>>>                          struct dma_fence **fences,
>>>
>>
>

