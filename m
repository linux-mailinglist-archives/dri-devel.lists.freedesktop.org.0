Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD385B144A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 08:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEDD10E95F;
	Thu,  8 Sep 2022 06:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E191B10E95B;
 Thu,  8 Sep 2022 06:01:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg1G/nN5xNL9zrmw4GyI0SNk5C4qGC3zdITtQq/WamalMxcMo+fIPMQMyU5cluWGs2UFjZtjw/SdCbWogR7cF+ObALndOMG5Z0sxJESYAg84xR8xQUeUKqPa9ZdUKa073NCQTGJog7SgXZ8rzHe0nV8MwjWqEgssc8QItWfqcLbRhjdoMhg3s0seznkSqKm6w12kcjOW60usILFhQQ6CGECKA5y7+mDybrmWOcTe5HYVFMRhVfKtAWmiQHomMnvhavO6c6wdiF1XKR9goJCBc+9z42vtJEqJx04JpPyTS6dZ4AIdQnbI88HlGt4vUGedqbCn3AQbINBA1dw1OgwJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eK+qoBjzsn1uanRr5rTqz5Ww85Mb+v3bFG5Vi8r9LWk=;
 b=Zvr0H+u+WPcn1D9bR7XQVHLv8okTq5lroDS0XHH4QdBi+w3PUFQ0p479FE0lXe1U+1LldA0YV3huyQtSfOwL17J2WHpl8BQmmgQRmvMyuOweBlweGuu9BVF1w1lU2/OtJ4Q4X6B/UiR9iTLjKsez7UfwJNCGGzi8NC7jJzUnB917fyFuTDIBbygRIoCM85fureSaRJrVScae2hiVQi1JO6vdRzH9PoAGXzQDDSAwqjqzYuw7ORok5qDe8b2IsX06dPIUEI0VEExv1vE5GUF4Mn9GEJ6n24XuK21BGNPa9mWeYPJz+y8JjeHMQCw63ZHQFBT9TpkPwWAIK/yBwvwPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eK+qoBjzsn1uanRr5rTqz5Ww85Mb+v3bFG5Vi8r9LWk=;
 b=0vyPCfsmsFZ6hUKFFaf67vTFgsbAF66vmiziJ2YYxb8cknvIsq4vfATAylFZSaHUCIsAdMu7qjhJyaaSVcLVvAwrOtErO2YzZ84HyZaOVl3KF5RvaAvlemqVUyudJQwzg/oE4kZPnnYsSZfzD+RRD0AQ7GpKUHI9e4o6/S4f/c4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4965.namprd12.prod.outlook.com (2603:10b6:a03:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 06:01:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.015; Thu, 8 Sep 2022
 06:01:29 +0000
Message-ID: <6be40bd0-f5b8-b672-4b22-4f6c5ec4059d@amd.com>
Date: Thu, 8 Sep 2022 08:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <YxjKHg8wBYCkQskJ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxjKHg8wBYCkQskJ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0037.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3c358c-8a71-44b0-a0aa-08da915f92c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdBAdm8YyvdIa6KSa6u9OdIzyuS/v6qatLvxcqG/6VAdiRXsbWkSY4F0ciUcFT/2iscMlVVYzEptnKNHElDS8uu6gQbp2260VL5IOu04QcfkwGGHbgF+Rwgs64wpqC+96uZadxGR4j0ZFo0ydZz9sDoiFI3CWqAFW0AjjR1gBQNVuTEzORPAKxTddlSSns3W7NU2vcSqf24mRo6ukbIciW1/EvRggJW4rSp6mTIZgFCQs/id1nt1qraQma4rTAhUyWHyj8TYKCaBw7jSTIjeYm0NacWupFuA4flwsDawX2kq1m+LTCaR353LlsCcRllkg0H3++ySbH9p8kUjofE0ioVYDPK2lN/bELgPbFTekAZwiyDNdk9wRKc7/OFP1hCyYPwxJSbva1/9z/bhLdU5jD3mIu+YDTYkyh7GwgbnFg648J+3tDKZc/OTrZeBvy7NOq3YGuNzjC+LpBtj9m02/1KxKoN0DNfdgR61aMHEw4RXDYskEA6ckwaoQV3MKZlP7UiQf9xUtauBdTN50b1/hCt9jY8EPtO3wZAc1SKhh7kGz0SRTlo8hkB/ewTademFzeku5JRgVamKNlB0gAr4z1LMssfqEAJhRnJzs16wuhC3P9+brcpn9aj7gJP/NtA18y6V1U7RdNJxSJSlL6EyK2vpDuyu8Of2CXFpxeyIHKIcS5gCXsMKMroDXAazwsDSr8OTSGD9sDf4q4yiJrcVQB+x1To24dxdG+EO4xYR8RqYLP7fPz0AZmb4Jb1lNVoqVXdicEZ6eeEhquDoU4yRYqrZJAxcRs1JJ1T75dOI5aI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(186003)(2616005)(6666004)(26005)(41300700001)(6486002)(66574015)(478600001)(53546011)(31696002)(6506007)(6512007)(86362001)(38100700002)(83380400001)(31686004)(36756003)(66946007)(66556008)(66476007)(8676002)(316002)(5660300002)(110136005)(2906002)(30864003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHg4c2FWVEJSOVNkYjk0Uko0V0VCOHNwbDR3R2FrdkcxSkdiWTU1NkFsOFNK?=
 =?utf-8?B?eFlFK09MQ28vNU1ZMUVBWFhCWkppRUtZd0xWTlBDUjdlNW1xWXhKMDNnbGU4?=
 =?utf-8?B?eXNlT0JYenRXWDVUU0Qyb08yRGozUlRWbzNYbTNFTTk1TVZWVnY4SUlVbHFF?=
 =?utf-8?B?M0FwdWhTVytkRHhseDlsamltQ2hBcHBPdE1ISjZjbmFoV3pJdXcxcUV0TTl6?=
 =?utf-8?B?aEJzenp4V3NYVmgvem84WGMya2k2N1M2RmRHZUhKT0gwTkRSQndGdG8yblg4?=
 =?utf-8?B?dUtySEhEVTgwT1ZkTzkramxJa2JveEFOc3NlNS9GSmFMdzFrZVlzWktjd1Q4?=
 =?utf-8?B?NnpoVHVLa3RsVmtnTUdkVVZDQjQxREtRbUxOczJmYnlNN2t2YVRLUXRMM21a?=
 =?utf-8?B?RHRlVUdLeFpLWlR6ZUQ0eXBkZk90U3JOU2J6Q0Q4ODIxcHNtNVVIUUVkVWpH?=
 =?utf-8?B?djd0bEZ6a0JNRVdvMTFNZ2JQZEUwbjd4cEVOQUZoWXNOdkxZc2FZV09SajFO?=
 =?utf-8?B?WHZsbFgvMFQ1WU5DbHZnV0lubytBOTg4NlR3S3R4cVFsT3Z4NjI3MzJDMVRV?=
 =?utf-8?B?V3V2b0ZEZExLVGxvVGc4N0s3STRCSlowOU9JU0d0OUJtbDlCRSs3bFRTTGhG?=
 =?utf-8?B?OUQ5dzk2dGV3UEhRcTY3TlFnZzdwaXEyTnYwRDF4ak5hV2lQQWtMUWxnQWgv?=
 =?utf-8?B?QUlpVWNxVGF0ZG9Ra0VPUWZCL3IzdWpkUHVLN29sWUJBMDNSNXBvL2Y3SldH?=
 =?utf-8?B?RE8vK0N1YmdIS003aHZJMDY2SVIvRnNtNWY0S3lhcnhWOXBJWmh3b2xlK3Bx?=
 =?utf-8?B?YXk4dVpSUnVCQWhRTDE2SEdSeXJOdUR3SmhZZXlEUkNCalJORnA1VitITFRG?=
 =?utf-8?B?MWtIZTNMOWFCVnhObm5wUU9IL1ZuYlAyTDd4aytnTDMxa1EwNDB3WGhrV1l4?=
 =?utf-8?B?SEF3WGJlTTNqdTJLUVNYbVZUL21neTVjUDFrM1c4aDFibkNGOGNUckdMZWJQ?=
 =?utf-8?B?bmZmOU1NUTZMNmxjcWlwUjNINUxmUzJzbmN4VWJJNzdBUnBZTDBvMzY4cDhw?=
 =?utf-8?B?aW42OTE3RGNNRzRKZ0MrbGViMk52ZnFpS0VUWGZvbFVBYktJaC9aVEVFeU5T?=
 =?utf-8?B?SENrMXdpK0NpZkwwNy9oU3JnSGgwRUlhQkJtUC9ScXNyeFlxQUNCaWZuQWZt?=
 =?utf-8?B?VVVTVUdCUVhFTFlrUEt3anM3NmRMY0dyN1NDNkxhc0h4NWFyblhwQTFYcDRH?=
 =?utf-8?B?ZkFJNC9kS0xvZGZHam44NVhxY3VVeGowRFBjN1pmNnJCbGJJUjFhY2VMaWtG?=
 =?utf-8?B?UThFTTIvME5aUHpsWWY5NGkybVROcFRCejQvOEk3bWRWQnQzMUFMUnIyMGVz?=
 =?utf-8?B?VnlHOXp1V1JtMW10UFJCSG5JTTV0M2xFTGxoUTVsNkY2UHN5aHpXMWxyeEd6?=
 =?utf-8?B?S21vei8rT1FNUTk4VlRiaWo1WCtJbEtneUJOWkdoMkYzMnRPSWZEdGVkNzky?=
 =?utf-8?B?akdUZjVBb2JMMmtBU2xiRVdkQ2M3dEZmWE9mTkNmWFc4Z2RuVlhkdXdiYVJS?=
 =?utf-8?B?VmdxMXlCczJOU0VEa1B6SlVacDRsZS9sTUpXQjZUaVN5YkxJZjFoRno3Q0VM?=
 =?utf-8?B?YXhHbU1tVHFsZDZueDRxckZvM2Z1ODl4QlM2YmwvanowU2FicmtCZFRjZjJQ?=
 =?utf-8?B?OW90NGZnZmNOb1dGVHdtdDFhTVZrOVdkSXRHMGlMakFvbkloSS9ZU3I1blk0?=
 =?utf-8?B?dXdzRThubHlLemNiV0JkYlJ0WXpJMlA5L0JkN0JpR3pGU2dhZUE2Wk9tZGMz?=
 =?utf-8?B?ck1sZ1k1alRRQTNmY1VvdzBBQlFpbFJWK3NnbkdwbmhVSmVwY1pDNFR2MFJz?=
 =?utf-8?B?YllJL0V2LzJmYlpoTmp0cFlQdlV0S2hXaXpYVkIwVEpNOUtxMjR3THBmTnli?=
 =?utf-8?B?OU1GREEyd3FWVUVvbTZpcXB1elRrbnFRYVpkYzB3cm5oMFJVeHAyOG5WVkVz?=
 =?utf-8?B?MVdZRkR6Rm1XcnArTjd0aVc1aW5sc0RjLy83dW9hWFExdXJzYVJRQ2d6dElE?=
 =?utf-8?B?SWJHZG9DL2htVE56cVh1UHc3YzUwaHB1SHdVVTJXZzErYUNCdGg0ZGVWZ0Nz?=
 =?utf-8?Q?jG006KJWLoJhgZ/SKRDAcoai6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3c358c-8a71-44b0-a0aa-08da915f92c2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 06:01:29.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeeJ5XFMCd4cAlMeSWT27iLIqWLq38yyzo6YEJjljTSDPfMH4dhUIiO46qF1r4EN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4965
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

Am 07.09.22 um 18:43 schrieb Daniel Vetter:
> On Tue, Aug 16, 2022 at 06:50:54PM +0200, Christian König wrote:
>> Am 16.08.22 um 16:26 schrieb Rob Clark:
>>> On Tue, Aug 16, 2022 at 1:27 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 15.08.22 um 23:15 schrieb Rob Clark:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> This is a fairly narrowly focused interface, providing a way for a VMM
>>>>> in userspace to tell the guest kernel what pgprot settings to use when
>>>>> mapping a buffer to guest userspace.
>>>>>
>>>>> For buffers that get mapped into guest userspace, virglrenderer returns
>>>>> a dma-buf fd to the VMM (crosvm or qemu).  In addition to mapping the
>>>>> pages into the guest VM, it needs to report to drm/virtio in the guest
>>>>> the cache settings to use for guest userspace.  In particular, on some
>>>>> architectures, creating aliased mappings with different cache attributes
>>>>> is frowned upon, so it is important that the guest mappings have the
>>>>> same cache attributes as any potential host mappings.
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> ---
>>>>> v2: Combine with coherency, as that is a related concept.. and it is
>>>>>        relevant to the VMM whether coherent access without the SYNC ioctl
>>>>>        is possible; set map_info at export time to make it more clear
>>>>>        that it applies for the lifetime of the dma-buf (for any mmap
>>>>>        created via the dma-buf)
>>>> Well, exactly that's a conceptual NAK from my side.
>>>>
>>>> The caching information can change at any time. For CPU mappings even
>>>> without further notice from the exporter.
>>> You should look before you criticize, as I left you a way out.. the
>>> idea was that DMA_BUF_MAP_INCOHERENT should indicate that the buffer
>>> cannot be mapped to the guest.  We could ofc add more DMA_BUF_MAP_*
>>> values if something else would suit you better.  But the goal is to
>>> give the VMM enough information to dtrt, or return an error if mapping
>>> to guest is not possible.  That seems better than assuming mapping to
>>> guest will work and guessing about cache attrs
>> Well I'm not rejecting the implementation, I'm rejecting this from the
>> conceptual point of view.
>>
>> We intentional gave the exporter full control over the CPU mappings. This
>> approach here breaks that now.
>>
>> I haven't seen the full detailed reason why we should do that and to be
>> honest KVM seems to mess with things it is not supposed to touch.
>>
>> For example the page reference count of mappings marked with VM_IO is a
>> complete no-go. This is a very strong evidence that this was based on rather
>> dangerous halve knowledge about the background of the handling here.
> Wut?

Yep, that was also my initial reaction.

> KVM grabs page references of VM_IO vma? I thought the issue was that we
> still had some bo/dma-buf vma that didn't set either VM_IO or VM_PFNMAP,
> and not that kvm was just outright breaking every core mm contract there
> is.
>
> Is this really what's going on in that other thread about "fixing" ttm?

At least it seems so. I haven't looked at the actual KVM code in detail, 
but from what I've seen it looks like KVM implements similar 
functionality to GUP to figure out which struct page a virtual address 
points to, but without the correct checks GUP does.

I absolutely don't understand either the why and what. Especially for 
the user case of KVM grabbing a page reference doesn't seem to make any 
sense.

My suspicion is that this should have been an MMU notifier instead, but 
this is really just a gut feeling. Maybe there is a good reason KVM 
grabs this reference.

Christian.

> -Daniel
>
>> So as long as I don't see a full explanation why KVM is grabbing reference
>> to pages while faulting them and why we manually need to forward the caching
>> while the hardware documentation indicates otherwise I will be rejecting
>> this whole approach.
>>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> If the hardware can't use the caching information from the host CPU page
>>>> tables directly then that pretty much completely breaks the concept that
>>>> the exporter is responsible for setting up those page tables.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>     drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>>>>>     include/linux/dma-buf.h      | 11 ++++++
>>>>>     include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 132 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>> index 32f55640890c..262c4706f721 100644
>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>>>>>         .kill_sb = kill_anon_super,
>>>>>     };
>>>>>
>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>>>> +{
>>>>> +     int ret;
>>>>> +
>>>>> +     /* check if buffer supports mmap */
>>>>> +     if (!dmabuf->ops->mmap)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
>>>>> +
>>>>> +     /*
>>>>> +      * If the exporter claims to support coherent access, ensure the
>>>>> +      * pgprot flags match the claim.
>>>>> +      */
>>>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
>>>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
>>>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
>>>>> +             } else {
>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>>     static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>     {
>>>>>         struct dma_buf *dmabuf;
>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>
>>>>>         dmabuf = file->private_data;
>>>>>
>>>>> -     /* check if buffer supports mmap */
>>>>> -     if (!dmabuf->ops->mmap)
>>>>> -             return -EINVAL;
>>>>> -
>>>>>         /* check for overflowing the buffer's size */
>>>>>         if (vma->vm_pgoff + vma_pages(vma) >
>>>>>             dmabuf->size >> PAGE_SHIFT)
>>>>>                 return -EINVAL;
>>>>>
>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>     }
>>>>>
>>>>>     static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
>>>>> +{
>>>>> +     struct dma_buf_info arg;
>>>>> +
>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     switch (arg.param) {
>>>>> +     case DMA_BUF_INFO_MAP_INFO:
>>>>> +             arg.value = dmabuf->map_info;
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>>>> +             return -EFAULT;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>     static long dma_buf_ioctl(struct file *file,
>>>>>                           unsigned int cmd, unsigned long arg)
>>>>>     {
>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>>>>>         case DMA_BUF_SET_NAME_B:
>>>>>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>>>
>>>>> +     case DMA_BUF_IOCTL_INFO:
>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
>>>>> +
>>>>>         default:
>>>>>                 return -ENOTTY;
>>>>>         }
>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>>>         dmabuf->priv = exp_info->priv;
>>>>>         dmabuf->ops = exp_info->ops;
>>>>>         dmabuf->size = exp_info->size;
>>>>> +     dmabuf->map_info = exp_info->map_info;
>>>>>         dmabuf->exp_name = exp_info->exp_name;
>>>>>         dmabuf->owner = exp_info->owner;
>>>>>         spin_lock_init(&dmabuf->name_lock);
>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>         if (WARN_ON(!dmabuf || !vma))
>>>>>                 return -EINVAL;
>>>>>
>>>>> -     /* check if buffer supports mmap */
>>>>> -     if (!dmabuf->ops->mmap)
>>>>> -             return -EINVAL;
>>>>> -
>>>>>         /* check for offset overflow */
>>>>>         if (pgoff + vma_pages(vma) < pgoff)
>>>>>                 return -EOVERFLOW;
>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>         vma_set_file(vma, dmabuf->file);
>>>>>         vma->vm_pgoff = pgoff;
>>>>>
>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>     }
>>>>>     EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>>>>
>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>> index 71731796c8c3..37923c8d5c24 100644
>>>>> --- a/include/linux/dma-buf.h
>>>>> +++ b/include/linux/dma-buf.h
>>>>> @@ -23,6 +23,8 @@
>>>>>     #include <linux/dma-fence.h>
>>>>>     #include <linux/wait.h>
>>>>>
>>>>> +#include <uapi/linux/dma-buf.h>
>>>>> +
>>>>>     struct device;
>>>>>     struct dma_buf;
>>>>>     struct dma_buf_attachment;
>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
>>>>>          */
>>>>>         size_t size;
>>>>>
>>>>> +     /**
>>>>> +      * @map_info:
>>>>> +      *
>>>>> +      * CPU mapping/coherency information for the buffer.
>>>>> +      */
>>>>> +     enum dma_buf_map_info map_info;
>>>>> +
>>>>>         /**
>>>>>          * @file:
>>>>>          *
>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>>>>>      * @ops:    Attach allocator-defined dma buf ops to the new buffer
>>>>>      * @size:   Size of the buffer - invariant over the lifetime of the buffer
>>>>>      * @flags:  mode flags for the file
>>>>> + * @map_info:        CPU mapping/coherency information for the buffer
>>>>>      * @resv:   reservation-object, NULL to allocate default one
>>>>>      * @priv:   Attach private data of allocator to this buffer
>>>>>      *
>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>>>>>         const struct dma_buf_ops *ops;
>>>>>         size_t size;
>>>>>         int flags;
>>>>> +     enum dma_buf_map_info map_info;
>>>>>         struct dma_resv *resv;
>>>>>         void *priv;
>>>>>     };
>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>>> index b1523cb8ab30..07b403ffdb43 100644
>>>>> --- a/include/uapi/linux/dma-buf.h
>>>>> +++ b/include/uapi/linux/dma-buf.h
>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>>>>>
>>>>>     #define DMA_BUF_NAME_LEN    32
>>>>>
>>>>> +/**
>>>>> + * enum dma_buf_map_info - CPU mapping info
>>>>> + *
>>>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
>>>>> + *
>>>>> + * Importing devices should check dma_buf::map_info flag and reject an
>>>>> + * import if unsupported.  For example, if the exporting device uses
>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
>>>>> + * CPU cache coherency, the dma-buf import should fail.
>>>>> + */
>>>>> +enum dma_buf_map_info {
>>>>> +     /**
>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
>>>>> +      *
>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
>>>>> +      */
>>>>> +     DMA_BUF_MAP_INCOHERENT,
>>>>> +
>>>>> +     /**
>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
>>>>> +      *
>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>> +      *
>>>>> +      * The cpu mapping is writecombine.
>>>>> +      */
>>>>> +     DMA_BUF_COHERENT_WC,
>>>>> +
>>>>> +     /**
>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
>>>>> +      *
>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>> +      *
>>>>> +      * The cpu mapping is cached.
>>>>> +      */
>>>>> +     DMA_BUF_COHERENT_CACHED,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct dma_buf_info - Query info about the buffer.
>>>>> + */
>>>>> +struct dma_buf_info {
>>>>> +
>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
>>>>> +
>>>>> +     /**
>>>>> +      * @param: Which param to query
>>>>> +      *
>>>>> +      * DMA_BUF_INFO_MAP_INFO:
>>>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
>>>>> +      *     caching of a CPU mapping of the buffer.
>>>>> +      */
>>>>> +     __u32 param;
>>>>> +     __u32 pad;
>>>>> +
>>>>> +     /**
>>>>> +      * @value: Return value of the query.
>>>>> +      */
>>>>> +     __u64 value;
>>>>> +};
>>>>> +
>>>>>     #define DMA_BUF_BASE                'b'
>>>>>     #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>>>
>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>>>>>     #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>>>     #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>>>
>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>>>> +
>>>>>     #endif

