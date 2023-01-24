Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34428678F24
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 04:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004E210E054;
	Tue, 24 Jan 2023 03:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4010E054
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 03:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHvfA7M1c8f2Sy8hXk0Ydv1BhmPzFdufkrzz/xPm0NX5dwv5+2uL/NcukLs3tZkSl9uWP/qsXK5gC51oszN5Y1JnPLKNylhMVRFVlutoKt/LK22sVMMHhPxfd2OsV2rQMRj4qJky4E2ClVkpuhNE8ZrVzOxxEXqkSoadSoG9Qald6nkXR+cWtXX0lvzYD2686o6XRgF4/c+CHP7disVFkQYahJ6y4WY65JHmFzv75A2LRfpMlbOuzQPG2FTvESHjXWc/m5A0Shk12FnOAnltUmsy41NmFTwAbE71kPhskSh3rba7c8eXcTimCjDU6jZW0ZYuKVIjVCxFZDalNy5pFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQgskI2iTz1kaJnifINOo3Zccwmfbc8ZRHTOprTqS0g=;
 b=h6BudUK+EqwS3XJFAxRPYLOjOW7pRg8pI4EzrSL14MYmlNP6X84DN+CXl1J2NEKZx8iNC7WLFWEa8VoqR1C+g8uBHVXtpYNleR+lSR8orKE2rqrf4p/grxnr5WXJo2+KuH/9QyhP3+0jjLtBwKM2OsxijBBaI6uAcdT1myFWZ1iq8qv8qrK0KnN8H/2lL6oQ1e8OYyUDZ5+9XekqRpsUrjpIqQvBMKghMYG9kryfbfGytSm7gxCtcFH8jwnPWIbrI/3k/f891vpV0f1sbKW2OoIhIZzp8ZCBLpE/Tv+benPrbXqAn9CsZ0dXzuJTOdN/jT+d6LyEx3m3T1t1Ljk0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQgskI2iTz1kaJnifINOo3Zccwmfbc8ZRHTOprTqS0g=;
 b=uUDYfu2JeOCc5/7NT6CPx9P8mn6eSetzjzGwkMRpPOEKm0BGcbqRwMG2FiJHL89UEXL07HRF7Krr1jF6/O6LybDV5tlu6GdZ6KcnY9lh8BQq0aNKAPKfBvUeM4SjmOkEM1V8/GGSsbAp38S+T+nOimzYMnWaIqwM2O3Pm2c3yjuHMt0cqB57KHDkvwWwqvNlondu7Eo95XmS/0J6fhTs8dMOGla8P93FsUT0tNMnyz834HdvT8xhGeO1T1pba0CqexPtpGJopJY4wFa1Wud8XKttbDuLNcqQ3jA1sR68WAB7Nx+ns7ljxpUmPJsUgEiB/Thl9g2XklP+h1t/DM5QAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 03:56:26 +0000
Received: from BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::8e66:3769:a62c:6e08]) by BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::8e66:3769:a62c:6e08%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 03:56:25 +0000
Message-ID: <349797d3-2406-cb78-4d3d-61a4628f762b@nvidia.com>
Date: Mon, 23 Jan 2023 19:56:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DMA-heap driver hints
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To BYAPR12MB2935.namprd12.prod.outlook.com
 (2603:10b6:a03:131::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2935:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: e97f5d0c-bfc2-4ce4-ef0c-08dafdbef6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: umFNnwSI5uPLusheYg7ZP3HT2SjRpyDJAzktPYgO2UfgkbtJg2JWx3SpZ6ytpLsi9fIfRFMk+vwrjRi1Ca3quvse5PU0XYTpfVCMtqGUYBqXI3WOZ2hEVRqICr7Y5vmnsCfHPE19ZwTaNUuJmWttBAG8XO7r+KPm3Zvb4MfvrRYOlIlMr4/2Y/1OCZnIj7/w3B1wLjRR5cU/5Pn1UmEsABrXxuLcjO2emDUFa/xZgb0bA3RDJvCNzKsOVMrKIAY9fofo8u4JtuJED46FD7z9nATu9PgJZyFGgjFil2g2IYmp7c3p7a52okSrhgQUeex4NJJ8//PJfa6AYOIwoX891B59U68DItUuVmicvuyIdStHwcRLVJysPf+UThhqJcaFYbnulwkQ5e0vDL8TxRfjjCyPHm+IyT8ciLMekd/Pl1iueFNlXH3fW00osLMZH9g79nJrW4S7TKK9GsFX7JaaNzBShQgrR+GlURhuRj+XgkKd7XbrbqhXXJMvN/qcEc8NPjy2vXzVDeDhcfGS9Gs781Fi+b21dCAIoMZlBUUOywx6smqdE6t8k9WAyIPV6LhAqj2PxyCwnT5heOe8SsWD6suMLT/2yMxuLDaC+N81nfwmTKxZs/b1BsLbV9Mg/yFoBHKqGUGCA3tRcPliF6t9Vu/6RTAOpgOZ3WnfrNRCye/JjWkmbcx5YH6Hw0T+/UE2NNp6sF9HCI++pekfHrRMM6MBpdSEyYDuqvECrbiKMnd/HG9bmsvXAc8yJH18J6bLqTyVmgHHFtmNRhcUQplbgEfzN8qZQpL+yZToBdsnn+jY3oQJ9BAgDf0VKzgnltHc6ptSbFKsIynHFCRTy7IqgdWR9b46WqhRDXySj/53jz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2935.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199015)(31686004)(6486002)(66476007)(4326008)(966005)(66946007)(8676002)(66556008)(66574015)(2616005)(26005)(41300700001)(66899015)(8936002)(186003)(6512007)(7416002)(5660300002)(83380400001)(30864003)(6506007)(53546011)(2906002)(3480700007)(38100700002)(31696002)(316002)(478600001)(110136005)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bllmazhIUEpTL0VIZTFvYncrYk83NTN2Tm9ueGd3bnk5WjNkWmFDZFlWakUz?=
 =?utf-8?B?SUIrUlJrWmRTM0YxNncvOC9udXBmaDg3dEp4VEg3N2MxS3kxcWNZZzJZcFFr?=
 =?utf-8?B?aUprQ1dyOUM1OGFkNWNWNXIxcUp2dTZxeUM1bEsveVF3RU44dkhZd1NhMTJ2?=
 =?utf-8?B?WktiVGRENU9EeE5zbDZpUC96OFlpVWtwODBXcnhDU293VWZEMTJ2QUhCQXRW?=
 =?utf-8?B?a25wN0dxNDZLbkcvSHRveWptZXNqNTlpN3NuOHR2Uzh5OG53THYrTlR1eDkv?=
 =?utf-8?B?ckFUb3M3Wm5Gc3QvSVRtVml1S3Z4YjRhZnlHcGUraHZXNHgxd1VGVzIxRi9U?=
 =?utf-8?B?QU5wTmRuS2FXWjB3akhpY1NkZFNGY0NpUS9uLytnY0lRVnlVSGVXdEZuWnFL?=
 =?utf-8?B?R3huU3NXcE9jLzNuVVlNbWVzNkZ3Mzc1QVBJa3dhS1lMMXpwYmp2ZnFIQUIr?=
 =?utf-8?B?RHVuWHdMSXVpdUVHNnFmTGFmQmZDUjl5V2RZblZCc0l5WSsvKzJKQUVPMXJs?=
 =?utf-8?B?NE0yMWU4UVNWNmw1azlDVGVIM0cvY1lCMEtIbHpZWjB1WlVya2lhaWFadE9t?=
 =?utf-8?B?aE15Sll4RnpxenlRUkZwTUJGbC9Yb1Y1QURycUpSM3ZNYXpscVNPSDJjZVla?=
 =?utf-8?B?YUd4dkZCOWtxRWxWTnAyM0ZEZmhCc1BGenhjUENZMmN5TGcza0pEZGN1TXQ3?=
 =?utf-8?B?elBwMDh6OXpHdkhielZkc3NpZXFCRlZodjJkcE1tb2wxZ1A1NlM2bjFncVdX?=
 =?utf-8?B?RE0rMHVsTXp4ZUJKYW55MFJCRGRPOVRnNFNrbllPQzVIb1NaWjFXQ0Z4T3g0?=
 =?utf-8?B?M29zVkJoSnk3dmtlSG9SWng5cFh3K3o2NmpHWGVWQXF1VlRMaHhCaWhmSmVJ?=
 =?utf-8?B?TXVZVktFWWFzb3B5V3RmQ3Roc2NhV3hDcWtFajVQc0lQZ3FNM1h5WEUyNVMy?=
 =?utf-8?B?ZXozUDVydFpxRXVKWGNrK04xTzQrRmVOK2l3Uk9aOG5zUVVpODVodDZBZlcv?=
 =?utf-8?B?cmgyS1dieEZ3TXNsSGNDaUNUMGRESEdRdC8xdzl1cHRxYzlkbmZSeUR4VElP?=
 =?utf-8?B?Z1BqRExobXoxUHFYNU5QUmdCcFp4U2JxQVRwWGlXZWpScnJZdVdDa1EyZzZt?=
 =?utf-8?B?QitrS0pZYlRLQ1I0b1F2cFpsclFKR01UZ0RxMEhJelJKUW1NaXU2YjVML1BV?=
 =?utf-8?B?SHR1Qis2TGdhK0lkam9NV2poOU5qWjNhRERKaEtCUjgvSXlpbElkTEI4bm14?=
 =?utf-8?B?UzJPWmFUeTZ4Q01xVUVKa3FORTM4S2ZFVVFFZW5URTJkWURFNHdhRW1GSndn?=
 =?utf-8?B?cmtUMS9NU1lNdkVqY0VIaTg3blNhQ2Nld3l6OUhBSEJqZStNT1NyZTJOVDB4?=
 =?utf-8?B?TDdwRlNmT2dUT0pxUUdKZlY4TmZJZ2xoczdBcnFEQy80VE02VUtwZVlLSWo0?=
 =?utf-8?B?ekdFL0M3S0c0Unpjd0ZuVWhmc3ZpWTc1OVdtN0ttRVlwQmVwMEtNcDJTQWR5?=
 =?utf-8?B?V0szbVpQZzNZdDIyTXZITEJCeU1rclJrYXl0VXVrU3BCcVhna3A0cy80M0kw?=
 =?utf-8?B?QXd6SmQybWZlUy94UHFheW90ZDU4YVIwajlpemEwanNVUGY1K0NmcW1zQ0VK?=
 =?utf-8?B?RGN3a3dyeEJDUHJqeDNrc0lZR2FObFJrQ2tmcERSOHdNNFV5ZlpKU3d1bW1R?=
 =?utf-8?B?cHVIUGdQQlFFMEErQ0JBd2RpK0p1cmtXSWk1eEJncjQ1SFlkSW1MSE45eUpX?=
 =?utf-8?B?ankvVHBwWVVKVFZkYzdEcUh4T2tnZndIelZCWVRHekRXaXZnNDRHbTNQZ2p2?=
 =?utf-8?B?elBHY1NZMVhTRklEYWw3aGo5V24raCtCbDNpdGcvYkVvN0pPVzJOZXptL3Zn?=
 =?utf-8?B?K0svRmlyYzRjRmh6QVRuckxwc04xN001MzBGU01aMUFnWDJkOGhHa2RXYTht?=
 =?utf-8?B?MjJwc3d5UXBsSXdiOGY1UitGVG9DK2NQNS9ZM1B4cVFsbkgzNG85b2ZpUHVW?=
 =?utf-8?B?NWZ3VUFwd2hmTzk4OFdKQWk5bytTSTBPUHg0ZWJRUDhieGtvY3RMbVFYSFZW?=
 =?utf-8?B?MmRQT2taNEJpOVovRFpQOEVjZHEvalNCa05mdHlNbWNGOEVCSXhlalBoeEc4?=
 =?utf-8?Q?jH43+urtHhI6/rB/0MxSvHiAI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97f5d0c-bfc2-4ce4-ef0c-08dafdbef6f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2935.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 03:56:25.7016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2SyO11Aqt7TNFtGRXGIzhFyKUsMoDIbNh/G12fFRVTwLt7Fd67rldMycHga6yEWrXkzFJ/Tmp3pPWoMHVlI6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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
Cc: linaro-mm-sig@lists.linaro.org, sebastian.wick@redhat.com,
 labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 08:58, Laurent Pinchart wrote:
> Hi Christian,
> 
> On Mon, Jan 23, 2023 at 05:29:18PM +0100, Christian König wrote:
>> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
>>> Hi Christian,
>>>
>>> CC'ing James as I think this is related to his work on the unix device
>>> memory allocator ([1]).

Thank you for including me.

>>> [1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/
>>>
>>> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
>>>> Hi guys,
>>>>
>>>> this is just an RFC! The last time we discussed the DMA-buf coherency
>>>> problem [1] we concluded that DMA-heap first needs a better way to
>>>> communicate to userspace which heap to use for a certain device.
>>>>
>>>> As far as I know userspace currently just hard codes that information
>>>> which is certainly not desirable considering that we should have this
>>>> inside the kernel as well.
>>>>
>>>> So what those two patches here do is to first add some
>>>> dma_heap_create_device_link() and  dma_heap_remove_device_link()
>>>> function and then demonstrating the functionality with uvcvideo
>>>> driver.
>>>>
>>>> The preferred DMA-heap is represented with a symlink in sysfs between
>>>> the device and the virtual DMA-heap device node.
>>>
>>> I'll start with a few high-level comments/questions:
>>>
>>> - Instead of tying drivers to heaps, have you considered a system where
>>>     a driver would expose constraints, and a heap would then be selected
>>>     based on those constraints ? A tight coupling between heaps and
>>>     drivers means downstream patches to drivers in order to use
>>>     vendor-specific heaps, that sounds painful.
>>
>> I was wondering the same thing as well, but came to the conclusion that
>> just the other way around is the less painful approach.
> 
>  From a kernel point of view, sure, it's simpler and thus less painful.
>  From the point of view of solving the whole issue, I'm not sure :-)
> 
>> The problem is that there are so many driver specific constrains that I
>> don't even know where to start from.
> 
> That's where I was hoping James would have some feedback for us, based
> on the work he did on the Unix device memory allocator. If that's not
> the case, we can brainstorm this from scratch.

Simon Ser's and my presentation from XDC 2020 focused entirely on this. 
The idea was not to try to enumerate every constraint up front, but 
rather to develop an extensible mechanism that would be flexible enough 
to encapsulate many disparate types of constraints and perform set 
operations on them (merging sets was the only operation we tried to 
solve). Simon implemented a prototype header-only library to implement 
the mechanism:

https://gitlab.freedesktop.org/emersion/drm-constraints

The links to the presentation and talk are below, along with notes from 
the follow-up workshop.

https://lpc.events/event/9/contributions/615/attachments/704/1301/XDC_2020__Allocation_Constraints.pdf
https://www.youtube.com/watch?v=HZEClOP5TIk
https://paste.sr.ht/~emersion/c43b30be08bab1882f1b107402074462bba3b64a

Note one of the hard parts of this was figuring out how to express a 
device or heap within the constraint structs. One of the better ideas 
proposed back then was something like heap IDs, where dma heaps would 
each have one, and devices could register their own heaps (or even just 
themselves?) with the heap subsystem and be assigned a locally-unique ID 
that userspace could pass around. This sounds similar to what you're 
proposing. Perhaps a reasonable identifier is a device (major, minor) 
pair. Such a constraint could be expressed as a symlink for easy 
visualization/discoverability from userspace, but might be easier to 
serialize over the wire as the (major, minor) pair. I'm not clear which 
direction is better to express this either: As a link from heap->device, 
or device->heap.

>>>     A constraint-based system would also, I think, be easier to extend
>>>     with additional constraints in the future.
>>>
>>> - I assume some drivers will be able to support multiple heaps. How do
>>>     you envision this being implemented ?
>>
>> I don't really see an use case for this.

One use case I know of here is same-vendor GPU local memory on different 
GPUs. NVIDIA GPUs have certain things they can only do on local memory, 
certain things they can do on all memory, and certain things they can 
only do on memory local to another NVIDIA GPU, especially when there 
exists an NVLink interface between the two. So they'd ideally express 
different constraints for heap representing each of those.

The same thing is often true of memory on remote devices that are at 
various points in a PCIe topology. We've had situations where we could 
only get enough bandwidth between two PCIe devices when they were less 
than some number of hops away on the PCI tree. We hard-coded logic to 
detect that in our userspace drivers, but we could instead expose it as 
a constraint on heaps that would express which devices can accomplish 
certain operations as pairs.

Similarly to the last one, I would assume (But haven't yet run into in 
my personal experience) similar limitations arise when you have a NUMA 
memory configuration, if you had a heap representing each NUMA node or 
something, some might have more coherency than others, or might have 
different bandwidth limitations that you could express through something 
like device tree, etc. This is more speculative, but seems like a 
generalization of the above two cases.

>> We do have some drivers which say: for this use case you can use
>> whatever you want, but for that use case you need to use specific memory
>> (scan out on GPUs for example works like this).
>>
>> But those specific use cases are exactly that, very specific. And
>> exposing all the constrains for them inside a kernel UAPI is a futile
>> effort (at least for the GPU scan out case). In those situations it's
>> just better to have the allocator in userspace deal with device specific
>> stuff.
> 
> While the exact constraints will certainly be device-specific, is that
> also true of the type of constraints, or the existence of constraints in
> the first place ? To give an example, with a video decoder producing
> frames that are then rendered by a GPU, the tiling format that would
> produce the best result is device-specific, but the fact that the
> decoder can produce a tiled format that would work better for the GPU,
> or a non-tiled format for other consumers, is a very common constraint.
> I don't think we'll be able to do away completely with the
> device-specific code in userspace, but I think we should be able to
> expose constraints in a generic-enough way that many simple use cases
> will be covered by generic code.

Yes, agreed, the design we proposed took pains to allow vendor-specific 
constraints via a general mechanism. We supported both vendor-specific 
types of constraints, and vendor-specific values for general 
constraints. Some code repository would act as the central registry of 
constraint types, similar to the Linux kernel's drm_fourcc.h for 
modifiers, or the Khronos github repository for Vulkan vendor IDs. If 
the definition needs to be used by the kernel, the kernel is the logical 
repository for that role IMHO.

In our 2020 discussion, there was some debate over whether the kernel 
should expose and/or consume constraints directly, or whether it's 
sufficient to expose lower-level mechanisms from the kernel and keep the 
translation of constraints to the correct mechanism in userspace. There 
are pros/cons to both. I don't know that we bottomed out on that part of 
the discussion, and it could be the right answer is some combination of 
the two, as suggested below.

>> What I want to do is to separate the problem. The kernel only provides
>> the information where to allocate from, figuring out the details like
>> how many bytes, which format, plane layout etc.. is still the job of
>> userspace.
> 
> Even with UVC, where to allocate memory from will depend on the use
> case. If the consumer is a device that doesn't support non-contiguous
> DMA, the system heap won't work.
> 
> Actually, could you explain why UVC works better with the system heap ?
> I'm looking at videobuf2 as an importer, and it doesn't call the dmabuf
> as far as I can tell, so cache management provided by the exporter seems
> to be bypassed in any case.
> 
>> What we do have is compatibility between heaps. E.g. a CMA heap is
>> usually compatible with the system heap or might even be a subset of
>> another CMA heap. But I wanted to add that as next step to the heaps
>> framework itself.
>>
>>> - Devices could have different constraints based on particular
>>>     configurations. For instance, a device may require specific memory
>>>     layout for multi-planar YUV formats only (as in allocating the Y and C
>>>     planes of NV12 from different memory banks). A dynamic API may thus be
>>>     needed (but may also be very painful to use from userspace).
>>
>> Uff, good to know. But I'm not sure how to expose stuff like that.
> 
> Let's see if James has anything to share with us :-) With a bit of luck
> we won't have to start from scratch.

Well, this is the hard example we keep using as a measure of success for 
whatever we come up with. I don't know that someone ever sat down and 
tried to express this in the mechanism Simon and I proposed in 2020, but 
allowing the expression of something that complex was certainly our 
goal. How to resolve it down to an allocation mechanism, I believe, was 
further than we got, but we weren't that well versed in DMA heaps back 
then, or at least I wasn't.

>>>> What's still missing is certainly matching userspace for this since I
>>>> wanted to discuss the initial kernel approach first.
>>>
>>> https://git.libcamera.org/libcamera/libcamera.git/ would be a good place
>>> to prototype userspace support :-)
>>
>> Thanks for the pointer and the review,
> 
> By the way, side question, does anyone know what the status of dma heaps
> support is in major distributions ? On my Gentoo box,
> /dev/dma_heap/system is 0600 root:root. That's easy to change for a
> developer, but not friendly to end-users. If we want to move forward
> with dma heaps as standard multimedia allocators (and I would really
> like to see that happening), we have to make sure they can be used.

We seem to have reached a world where display (primary nodes) are 
carefully guarded, and some mildly trusted group of folks (video) can 
access render nodes, but then there's some separate group generally for 
camera/video/v4l and whatnot from what I've seen (I don't survey this 
stuff that often. I live in my developer bubble). I'm curious whether 
the right direction is a broader group that encompasses all of render 
nodes, multimedia, and heaps, or if a more segmented design is right. 
The latter is probably the better design from first principles, but 
might lead to headaches if the permissions diverge.

Thanks,
-James

>>>> Please take a look and comment.
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> [1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/
> 

