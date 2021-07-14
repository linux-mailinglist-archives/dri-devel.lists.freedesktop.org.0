Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C53C846E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C326E23D;
	Wed, 14 Jul 2021 12:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E66E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xjub7o9o3TSdrJUrMwIt0zy70RUftidZ6c5rvROxkmKUak3DuvfPTPNB/ZDqXUPS9FOi6ieIJ8ftggz0V0liuWxdhw0m6dUnXtVXq7fkXlLzNHL0qsX19e4leyyrBFLEJ4/khGQuKu3bw4JhuWkzjInagbrimqSOT9gwNxgfz/pyj3JWRcnKjJADQKY6bUrPJW+RNsynHezQLeDU7E3dSh9c2yj6Q+1vSShVthjtGCZ+v27mpwBYi26fPbSoFX97jPjVsGVWWNpHaMFm2TqqER216/I6DIQjCejHpvkzD+CW81ErRlUksigBaBgDPM05seiIgaSKomRUTlttiywYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/gy52FRMaxQPPeGwy+desjrZUKF5oZoddgTqGemPuM=;
 b=k42IStvOsVvK5D0tmXOdHX0bMpoIjZi1uPNVP1X9z8QJJXMPVFedALWhzyMVs6zp+et3YguHVrHlO8guo4YOxUyHmbkluilxYgC1bNFtIzDCdQ6xzZP7hw7lpcVfsavUHFdOLwOw3nmU2YH0eJm2y18LvRSKmrUPzm93Vs7ALpoykajlbw26LIn2WbHNd6YAbK5oO4bXkNlab4Ta/NdgSt+yjCbYqVJECqvn9y/jq3gkcpwd9ExXS7mdq9O6XU5Nr0M7WQTG/UVl+lZON3voriaBhIKjNdCA7mJyRGR/YMALFBbGueoB7slIGG2AXfbZi41xvAUrQjow3d5y9Rg1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/gy52FRMaxQPPeGwy+desjrZUKF5oZoddgTqGemPuM=;
 b=wZWws4pM/WlTkJCkayvF2TYmXjP4DQyYP/cK/wN3VX1J6nocK77L+H46CTCe+2jL7J0rzyRYwBGyeCWO//HNdPTteuhIiZ88dlagMR08yGwD99WIHSMzLpfprEEsjfsWCOLpxcNgmGaSXehEgoLThHNI0uj2HXfsH+vVgwIvtXw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 12:28:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 12:28:24 +0000
Subject: Re: [PATCH] dma-buf: add kernel count for dma_buf
To: guangming.cao@mediatek.com, sumit.semwal@linaro.org
References: <371c6f09-2bba-a9d6-18e8-114bea97a18d@amd.com>
 <20210714120305.70720-1-guangming.cao@mediatek.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <424d5f2e-2ad5-cc33-5615-7d4a235af3dc@amd.com>
Date: Wed, 14 Jul 2021 14:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210714120305.70720-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0062.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc]
 (2a02:908:1252:fb60:fe2b:fec6:eeb5:c7dc) by
 PR3P189CA0062.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 14 Jul 2021 12:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2802ddd9-31a7-471a-d88a-08d946c2dfbc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43195A8A16EFC2BEB218C73D83139@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asMsq4QCW2vnO2/MZf2oVmR6xJQp/ORD6kLQL6pSsvl3RpK3Bc7oISfy4CSmptSkW10uL4INVhrwn0duLI/dU/RuuHfv57Qnf4rjJYMDYl7XcdGYmwVIQ3k7MngnLfMeUQclyEpFg/TdgtwQAmrweuFWfG39S661Bsf+H5lJWo8YBTud7Lbl7LCuB2XiTZ2CFE4wEpd7p+K92Ddd1iB0v/w/ifPSRt/VpiC0/o1FqZepT+jCiIWw732iYzjEoZ9QwmLhBqjRdQCj1h3DY4/vlWiJCrYnwzGvnbxCaQ33LtvTxkZ65lIBnlWfswqizD+Z67uX0Mqc0+nTlLWQ97qzzFK2HaJaHz6DsTLveCzPV222LPj7etMTzpmmSCFYqphYdY9C85T8DOuDZBl3AewATTtlc1bikefJaAyApVrN9dCZlMkbjKv0QoDFM4Mm7RcQbzzmRZ1vLZ3jkHdYsbF04pc5p0GK2DJsEa0YuZT36y+ijjh24GR1aACY27GgNqFzt9QlHZyhSsI38JXwGMS5BDLIRtekNolLvFfWVm84Alyx4J98ypvWXn7M6SG53yJFTjL/GBsje83pxLZXNPwl0cMrac0ffwP+uZ4LeOf708UTarlae03wojhOjJE6m1URIoFvc3cQ+RVCQU8Vnd3eNptJvgK+1z5EAkM7n98JJgfJuOxnYh4lzSIQnnw7+l0m9KbN5ASWYRV9fGX/4XMW04IEjnFrrgO1RW9O3gk0lZYs/35J9SZpb/buBLQhVxWM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(83380400001)(6666004)(86362001)(31686004)(2616005)(66574015)(316002)(5660300002)(38100700002)(45080400002)(8936002)(66556008)(66476007)(66946007)(36756003)(4326008)(31696002)(7416002)(2906002)(478600001)(186003)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1hHUnROM0w2cm9CMVEvWU82VWJwRWcrRWpXczRGQndUZk5NcTdlTFFLZ1JM?=
 =?utf-8?B?clpHQW9xUWRtalNud2U1VWxvYTdQVDlQYVY0YmJIMXRjTU8rMStFc2VLMFk2?=
 =?utf-8?B?aUJrcWxMTG5oZVVHQ3FlL2ZlcDJrRTUxWWxVOUl4c3NRQi9rcUdoUkJ1dFEr?=
 =?utf-8?B?MzdKTnFzWHoxQjA2R0hUeDlSK3ExRTh4ejllZmd2Z3ZpbjUrM0trNHk5UEF5?=
 =?utf-8?B?VU5GUG42Rk9kcUJpSGdqMk5sdW42QWhHb3ZUOEFwY0ZRVGw3ckFSTUVFNWFo?=
 =?utf-8?B?NHl2dGV3SSs0S1puSWNsNGRkSU9abGpVajlWenpDYUEydFp2Smh6M1I4cmhp?=
 =?utf-8?B?MWY4K3RhczVnWGEvclNZeDMvNWpHMk9EQ3lVR3F3WmFGRTFidWd3ZVR2VEFR?=
 =?utf-8?B?VUFYTjJNNnNOdTlFT00wWHFqenJCZHJ4UzU0UEFhZ3J5SERSQ0QxdmFvT3BI?=
 =?utf-8?B?NldFYkk0aEZwTXNqWk14UHdxT2Z1a3BTdmpwMXdVa29BRjVIb0NJYkl0WUFI?=
 =?utf-8?B?MTlqa1RXaDNJWURXME93Qm9CdUM4Nnd2RlViQmxxbWpKalJIN2MzL01OcFUv?=
 =?utf-8?B?VmkxeVc5ell1Y0NRZEUreW5jemtxaU9ybldOVFRMRnV2MnUyeE5YcHdMekFR?=
 =?utf-8?B?ZzVMTlVyQ1kzUE5RbzRNUzE1bWx0NUtVdHl2K1lRWGhyZTlzZ2t1QzRoVE4z?=
 =?utf-8?B?cEtPN2pZZU9mU1ZIbCtLZ05qZHFodGRsRHQ5QXdtQVJLcnNWS243UmdPKzA5?=
 =?utf-8?B?YlNreXVRNlJUSlhSdDlCOGZyektERjB3U21nbXpOcGtNd1FNb25EVGpIQ1dF?=
 =?utf-8?B?UklRbVI0UkRGRFdnbmtxajd2dFpJUldvRHowc2UzaHJFbStCMHNQR3FEUlVy?=
 =?utf-8?B?Q3hNU0NzajhHRkVxTVhZdVloY1lQSlhyVCswbUYrR1FKYkdKNk5NUit4UHli?=
 =?utf-8?B?VHV3WUVyS1E4Y25BZEo5eWhFakJwRVBoMkNLK0pWTTRaVGp6Z2M4aVBKQU1r?=
 =?utf-8?B?MEM2MXpCaE9VOWFLNzZoak5NSUs1TjRmY0FXK0psQXRldUtyQjVYaDBnSTk2?=
 =?utf-8?B?T3EzeVhTR0h6UzNzM1VXZ2xiTHJaWnQwbzBHN1VTNG9CUVpBbzgrK3Q4Uk5n?=
 =?utf-8?B?T0Z5d0tvcXAvVHpMb2hETFl5R2NOeFhVVWZYZGhNTkJQZWRTSjVjMTBpaStI?=
 =?utf-8?B?b2NvU3BaY2dCRjNoUG9LZ0JWRTNTWTRpSVJsd0trbnFWQmlRMzJ2ODBZMlpv?=
 =?utf-8?B?d1dxdHJvS1UyQ0J2UkdiWXNDaVlWYW9xbnVPWHI4OEt3cDNJbHI5b1BZZk9J?=
 =?utf-8?B?bVU3c0hKK1ZjSkpWZTVINUdUTGdud2IrakxlTS9KMTVpVlR5SVF6dW53RklS?=
 =?utf-8?B?TVAwZWxLd1djRFQ3TkxYdmpSQlVjaStzRHhFZzM0dXhkSUxRdE90QmVxL3Nt?=
 =?utf-8?B?NEZrNGVCeG9Rd0JYVWFSN2swb0FuMTBTdTl4NVBPazdTU3dtYWdsKzJmSS8v?=
 =?utf-8?B?NU51eHZneUkvQkhmdXRDbENzK0YxU3hHYkFSRXBZTU8xaEVqc2RVMExSODZs?=
 =?utf-8?B?RkNYUlNJYUlHYldWS1RBeW9Wd2pQWVNYUWdCZCs0b1UxT1lsWkREd1hkcDM2?=
 =?utf-8?B?RTVyWE90YUdSd0xGUHRGeWx3RURoenV3bDEwb2dEMFd5SGd4SzdZb3A3dVB2?=
 =?utf-8?B?NWpHTFdlSlZiZ2JPN3IwcW5FOWlYa3BicFh5WXp0Tms4U05SOWxlbVNRODdT?=
 =?utf-8?B?ZGgrb0F6VEkrYmFqc29OVGkxTWhObC9KOUdkMlN2ZmpGK2ZRVFhVUHFaY3d6?=
 =?utf-8?B?bllaRVlTNS9ieDVUeFlNL1IwYzFDT2oxYmxFRU1DU2NkQllpKzA0R1RQSUUz?=
 =?utf-8?Q?Vg7OJMdG2Zdx/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2802ddd9-31a7-471a-d88a-08d946c2dfbc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 12:28:24.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkh+YHNF1Ekl3qzN2xoVeMBkkZB1nLx5PdP4RqbQn66dHLiKUqcj1HIvKMoj1ohy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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
Cc: caoguangming34@gmail.com, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.07.21 um 14:03 schrieb guangming.cao@mediatek.com:
> From: Guangming.Cao <guangming.cao@mediatek.com>
>
> On Wed, 2021-07-14 at 12:43 +0200, Christian K鰊ig wrote:
>> Am 14.07.21 um 11:44 schrieb guangming.cao@mediatek.com:
>>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>>
>>> On Wed, 2021-07-14 at 10:46 +0200, Christian K鰊ig wrote:
>>>> Am 14.07.21 um 09:11 schrieb guangming.cao@mediatek.com:
>>>>> From: Guangming Cao <Guangming.Cao@mediatek.com>
>>>>>
>>>>> Add a refcount for kernel to prevent UAF(Use After Free) issue.
>>>> Well NAK on so many levels.
>>>>
>>>>> We can assume a case like below:
>>>>>        1. kernel space alloc dma_buf(file count = 1)
>>>>>        2. kernel use dma_buf to get fd(file count = 1)
>>>>>        3. userspace use fd to do mapping (file count = 2)
>>>> Creating an userspace mapping increases the reference count for
>>>> the
>>>> underlying file object.
>>>>
>>>> See the implementation of mmap_region():
>>>> ...
>>>>                    vma->vm_file = get_file(file);
>>>>                    error = call_mmap(file, vma);
>>>> ...
>>>>
>>>> What can happen is the the underlying exporter redirects the mmap
>>>> to
>>>> a
>>>> different file, e.g. TTM or GEM drivers do that all the time.
>>>>
>>>> But this is fine since then the VA mapping is independent of the
>>>> DMA-
>>>> buf.
>>>>
>>>>>        4. kernel call dma_buf_put (file count = 1)
>>>>>        5. userpsace close buffer fd(file count = 0)
>>>>>        6. at this time, buffer is released, but va is valid!!
>>>>>           So we still can read/write buffer via mmap va,
>>>>>           it maybe cause memory leak, or kernel exception.
>>>>>           And also, if we use "ls -ll" to watch corresponding
>>>>> process
>>>>>               fd link info, it also will cause kernel exception.
>>>>>
>>>>> Another case:
>>>>>         Using dma_buf_fd to generate more than 1 fd, because
>>>>>         dma_buf_fd will not increase file count, thus, when
>>>>> close
>>>>>         the second fd, it maybe occurs error.
>>>> Each opened fd will increase the reference count so this is
>>>> certainly
>>>> not correct what you describe here.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>> Yes, mmap will increase file count by calling get_file, so step[2]
>>> ->
>>> step[3], file count increase 1.
>>>
>>> But, dma_buf_fd() will not increase file count.
>>> function "dma_buf_fd(struct dma_buf *dmabuf, int flags)" just get
>>> an
>>> unused fd, via call "get_unused_fd_flags(flags)", and call
>>> "fd_install(fd, dmabuf->file)", it will let associated "struct
>>> file*"
>>> in task's fdt->fd[fd] points to this dma_buf.file, not increase the
>>> file count of dma_buf.file.
>>> I think this is confusing, I can get more than 1 fds via
>>> dma_buf_fd,
>>> but they don't need to close it because they don't increase file
>>> count.
>>>
>>> However, dma_buf_put() can decrease file count at kernel side
>>> directly.
>>> If somebody write a ko to put file count of dma_buf.file many
>>> times, it
>>> will cause buffer freed earlier than except. At last on Android, I
>>> think this is a little bit dangerous.
>> dma_buf_fd() takes the dma_buf pointer and converts it into a fd. So
>> the
>> reference is consumed.
>>
>> That's why users of this interface make sure to get a separate
>> reference, see drm_gem_prime_handle_to_fd() for example:
>>
>> ...
>> out_have_handle:
>>       ret = dma_buf_fd(dmabuf, flags);
>>       /*
>>        * We must _not_ remove the buffer from the handle cache since
>> the
>> newly
>>        * created dma buf is already linked in the global obj->dma_buf
>> pointer,
>>        * and that is invariant as long as a userspace gem handle
>> exists.
>>        * Closing the handle will clean out the cache anyway, so we
>> don't
>> leak.
>>        */
>>       if (ret < 0) {
>>           goto fail_put_dmabuf;
>>       } else {
>>           *prime_fd = ret;
>>           ret = 0;
>>       }
>>
>>       goto out;
>>
>> fail_put_dmabuf:
>>       dma_buf_put(dmabuf);
>> out:
>> ...
>>
>> You could submit a patch to improve the documentation and explicitly
>> note on dma_buf_fd() that the reference is consumed, but all of this
>> is
>> working perfectly fine.
>>
>> Regards,
>> Christian.
>>
> Thanks for your reply!
>
> Yes, drm works fine because it fully understand what dma-buf api will
> do. Improve the documentation is really good idea to prevent this case.
>
> But, what I can't understand is, for kernel api exported to
> corresponding users, we don't need to ensure all api is safe?

Well the API is perfectly safe, it is just not what you are expecting.

> And for general cases, dma-buf framework also need to prevent this
> case, isn't it, it will make dma-buf framework more strong?

What we could do is to move getting the reference into that function if 
all users of that function does that anyway.

This would then be more defensive because new users of dma_buf_fd() 
can't forget to grab a reference.

But this needs a complete audit of the kernel with all of the users of 
dma_buf_fd().

Regards,
Christian.

>
>
> BRs!
> Guangming
>>>>> Solution:
>>>>>        Add a kernel count for dma_buf, and make sure the file
>>>>> count
>>>>>            of dma_buf.file hold by kernel is 1.
>>>>>
>>>>> Notes: For this solution, kref couldn't work because kernel ref
>>>>>           maybe added from 0, but kref don't allow it.
>>>>>
>>>>> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
>>>>> ---
>>>>>     drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++----
>>>>>     include/linux/dma-buf.h   |  6 ++++--
>>>>>     2 files changed, 23 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-
>>>>> buf.c
>>>>> index 511fe0d217a0..04ee92aac8b9 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -62,6 +62,7 @@ static void dma_buf_release(struct dentry
>>>>> *dentry)
>>>>>       if (unlikely(!dmabuf))
>>>>>               return;
>>>>>     
>>>>> +   WARN_ON(atomic64_read(&dmabuf->kernel_ref));
>>>>>       BUG_ON(dmabuf->vmapping_counter);
>>>>>     
>>>>>       /*
>>>>> @@ -555,6 +556,7 @@ struct dma_buf *dma_buf_export(const struct
>>>>> dma_buf_export_info *exp_info)
>>>>>               goto err_module;
>>>>>       }
>>>>>     
>>>>> +   atomic64_set(&dmabuf->kernel_ref, 1);
>>>>>       dmabuf->priv = exp_info->priv;
>>>>>       dmabuf->ops = exp_info->ops;
>>>>>       dmabuf->size = exp_info->size;
>>>>> @@ -617,6 +619,9 @@ int dma_buf_fd(struct dma_buf *dmabuf, int
>>>>> flags)
>>>>>     
>>>>>       fd_install(fd, dmabuf->file);
>>>>>     
>>>>> +   /* Add file cnt for each new fd */
>>>>> +   get_file(dmabuf->file);
>>>>> +
>>>>>       return fd;
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(dma_buf_fd);
>>>>> @@ -626,12 +631,13 @@ EXPORT_SYMBOL_GPL(dma_buf_fd);
>>>>>      * @fd:   [in]    fd associated with the struct dma_buf to
>>>>> be
>>>>> returned
>>>>>      *
>>>>>      * On success, returns the struct dma_buf associated with an
>>>>> fd;
>>>>> uses
>>>>> - * file's refcounting done by fget to increase refcount.
>>>>> returns
>>>>> ERR_PTR
>>>>> - * otherwise.
>>>>> + * dmabuf's ref refcounting done by kref_get to increase
>>>>> refcount.
>>>>> + * Returns ERR_PTR otherwise.
>>>>>      */
>>>>>     struct dma_buf *dma_buf_get(int fd)
>>>>>     {
>>>>>       struct file *file;
>>>>> +   struct dma_buf *dmabuf;
>>>>>     
>>>>>       file = fget(fd);
>>>>>     
>>>>> @@ -643,7 +649,12 @@ struct dma_buf *dma_buf_get(int fd)
>>>>>               return ERR_PTR(-EINVAL);
>>>>>       }
>>>>>     
>>>>> -   return file->private_data;
>>>>> +   dmabuf = file->private_data;
>>>>> +   /* replace file count increase as ref increase for kernel
>>>>> user
>>>>> */
>>>>> +   get_dma_buf(dmabuf);
>>>>> +   fput(file);
>>>>> +
>>>>> +   return dmabuf;
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(dma_buf_get);
>>>>>     
>>>>> @@ -662,7 +673,11 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>>>>       if (WARN_ON(!dmabuf || !dmabuf->file))
>>>>>               return;
>>>>>     
>>>>> -   fput(dmabuf->file);
>>>>> +   if (WARN_ON(!atomic64_read(&dmabuf->kernel_ref)))
>>>>> +           return;
>>>>> +
>>>>> +   if (!atomic64_dec_return(&dmabuf->kernel_ref))
>>>>> +           fput(dmabuf->file);
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(dma_buf_put);
>>>>>     
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index efdc56b9d95f..bc790cb028eb 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -308,6 +308,7 @@ struct dma_buf_ops {
>>>>>     struct dma_buf {
>>>>>       size_t size;
>>>>>       struct file *file;
>>>>> +   atomic64_t kernel_ref;
>>>>>       struct list_head attachments;
>>>>>       const struct dma_buf_ops *ops;
>>>>>       struct mutex lock;
>>>>> @@ -436,7 +437,7 @@ struct dma_buf_export_info {
>>>>>                                        .owner = THIS_MODULE }
>>>>>     
>>>>>     /**
>>>>> - * get_dma_buf - convenience wrapper for get_file.
>>>>> + * get_dma_buf - increase a kernel ref of dma-buf
>>>>>      * @dmabuf:       [in]    pointer to dma_buf
>>>>>      *
>>>>>      * Increments the reference count on the dma-buf, needed in
>>>>> case
>>>>> of drivers
>>>>> @@ -446,7 +447,8 @@ struct dma_buf_export_info {
>>>>>      */
>>>>>     static inline void get_dma_buf(struct dma_buf *dmabuf)
>>>>>     {
>>>>> -   get_file(dmabuf->file);
>>>>> +   if (atomic64_inc_return(&dmabuf->kernel_ref) == 1)
>>>>> +           get_file(dmabuf->file);
>>>>>     }
>>>>>     
>>>>>     /**
>>

