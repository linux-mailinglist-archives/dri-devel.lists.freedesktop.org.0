Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A867C0B7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7114C10E297;
	Wed, 25 Jan 2023 23:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3910E297
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 23:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEIZhMo6ZeR3QBl7udnSpgr5BFA3EYPkltvdsdpZFn82ZHq+057BrJ3su0SoUKQV0reRkCyUOwQ+Pd3PqBgrbY6jXDokkZn8LARn36lliZW1xlD87PL/jOxCd8/Ga0T18Dmy29FFhfpLXh4umM9jH1rNkb/Qwe+V+tq0l7eIPLGlGA31lqj3SN675ChTetd4eHrXPPEV1pZVsIYexl6HbpZtTchj4ieG5/rT/9FyFkokqLA2If7wnMYJnSsgo4csqw6iUlS2jcSgcLcu5GxLUwZRgGpkmBbMsgYX7TP2n8w7sO/ZTbP62ejTkB6JSJce+OUGuTCeAZUStP8fCcvCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnQq5f8d9qKz6ENUahD08WTND7Olf7rUSA9qRq2O3SY=;
 b=fOL5bEQcpjsmiL9wQVDQ98ZhrI2zHdVPv9T6t2TnSSrW6G5ejbDAv6QdFppRTQA6s3zoxGv/QL2MQ9oSV5s89B4v30LvvVrt7KGcwXL9LHQA2LoyWnLGOqHCeniyMxZG5cUnoFvS9OpGuZBi10mkj5gi/A2PJUkLMouXUlgRQxYRwAJg/vlW3WpMxWWiFxo7sXh7GHh0Z0UNCpqZ7LpJr+qqeWadNyHAnqCMkzMLgDlr6XqR7YLjJW1B2qUCbhpZhwybujxExgIt/xA4Y1PHp6j8HPtgiNT2jJnkIYqDglEpCAyg+ccfR4YLGXyPTkSQz/LQ23o9qkSY1U4KasIVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnQq5f8d9qKz6ENUahD08WTND7Olf7rUSA9qRq2O3SY=;
 b=mZNova7jQ0dAXpTNkgawq+as1hocqdKyzleH1JH3gkB4Ym4RuIo0gGVyKU38/x9wHVSrdJVqPOY2c/XXdU2aoiEBtg+kYlJZh1/2mVMPXpFL9fWEOacnMH0ILAQ0w+xJJlFqgvRRw/t/OIQBy0P3oqeKL5w7qv2ko9Myy4RBHcHGe//HYGTwe0T0QX1iz/VCnEe1sj77UvGrTqQaBWY/jL6iZGxlYX5NdZIdV9qH3VBndsWSnbmm2qzrcLe+yQVVxQIYTHZqnXfMVfTI3skp29U4vAo8fs6+KmrINABKxne/e3hvRWI1HunhSz+e/Yl2dTpaK+roCli+qZN1Ohmxxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2935.namprd12.prod.outlook.com (2603:10b6:a03:131::12)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20; Wed, 25 Jan
 2023 23:20:25 +0000
Received: from BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::8e66:3769:a62c:6e08]) by BYAPR12MB2935.namprd12.prod.outlook.com
 ([fe80::8e66:3769:a62c:6e08%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 23:20:24 +0000
Message-ID: <a8877261-70c0-6cd5-e827-ee464d9aa43e@nvidia.com>
Date: Wed, 25 Jan 2023 15:20:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: DMA-heap driver hints
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
 <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <Y868mG7Oa5bI1wB7@pendragon.ideasonboard.com>
 <349797d3-2406-cb78-4d3d-61a4628f762b@nvidia.com>
 <ece8638d-01a3-6e25-c68c-c9e225200b08@amd.com>
 <CABdmKX2ufe2ufuoZL8GzSJAT8mNGOcrb2P2=Of27cWhCNtLEPg@mail.gmail.com>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <CABdmKX2ufe2ufuoZL8GzSJAT8mNGOcrb2P2=Of27cWhCNtLEPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To BYAPR12MB2935.namprd12.prod.outlook.com
 (2603:10b6:a03:131::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2935:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc2f6d4-7ca0-4366-2d7b-08daff2abcad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5JmU5YMI50uxp9kDb7W4+lCykoxg5kKuKPenax+3OvhuKlYGfvjLXtwEHCHPIFZp21PdaXeVUHZCK58kUBxIGf0AIjEMEn7U2AXe02ulTj7ReVPg7OVwrPMy5HG07ZMm9b9UZVHP1s99GuoLaf+WiX6Anu8BeJt8oSTSS8YlcJT9yPOXaRu5CuIkwh44q7GMTcQ7gvAYbGykJlRX/+amf0kucgOywI9nPPifDQiq+Q+C3z2NF5tnbBJlNnrGbS6TLbGtwIal5IWOhlM5QnoCfMcn4i8e9XpmC06aFC5mgz0GvY8uKQKVxGOUSFEWNnS9Ajp0RJuLaD1botix7NkpHHkBXrdhcc88Rn/TZwFxhap9RorHrhfgdsh960wJbpgTjSJcTvRJnpPcb6agpVoyPdvsZV31hDGDQylNIjsxhFOqC7AWrkH/55dy5qiF53gVWUXzTk0dZ6cDUedxy0Ofz/7VEYMpaTQXyET1D2YbhGEmim2k7atNDCbekWhrs5dRENnL6VEtSXnskJls0z27hnd0z2SyDMe0qAwr5Z9uAxzmJ5zkxaCjf1rBLovTurrVJJnXfwaCalLSaMaOLyrLauwniyky3k0Fk5OQCJZDQHLrGBopyeeJdDHuBD9g6TlRobIRhjYgC+yEexIMcXJvxSyKyldAf4FuR+Q5690n42wgefwYyZ+4JjgR7JvcsuoxsXIOyhr09kzSJbNXbPh5tO6wpS+WRsb9OlMVmLqeBcosF6A9OpKyc6bRFq4PLEUDl/RcGXkQxGJgX4mKa+Zz2cnTIO/uyj7h+dHcl9sGafKsBdl2K34cgaKqOxw5wQ5gbZbDOmRg1kbqsQnCxBzuCMoNotIsttLwIZBErZod2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2935.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199018)(3480700007)(66574015)(38100700002)(86362001)(31696002)(36756003)(316002)(110136005)(7416002)(30864003)(478600001)(2906002)(41300700001)(66899018)(8676002)(31686004)(66476007)(4326008)(66556008)(66946007)(5660300002)(8936002)(6486002)(26005)(6512007)(186003)(6506007)(53546011)(83380400001)(2616005)(966005)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZPVU9YSFF2QlNBY3p3V2dva3lEUjMxaGEzei9zUTFOeVhuZURtL2ZwRzBZ?=
 =?utf-8?B?VGM2bFBLNC9SNkZpNHVkRU5ETjVoWWxFS2VKNEowWnlXeGtPRVNuSW9ycFFP?=
 =?utf-8?B?RkhJRnlRdXdmbzhUMzlQYjM1RlJMN0RkSXVkN0xsdGFuNWZaYVczZ0JCTlJp?=
 =?utf-8?B?THlSem1BaGx4a2RaTm5VWm5VcVJxcHpSSWJLMklxN1VBVmJCNnpYQlMwUUNh?=
 =?utf-8?B?TVFxMm5mMFZ1OU5GSUhCWG5GVytybi9Tdk55Y1BPMWFCRGJ1ZXpxQnlTQWZr?=
 =?utf-8?B?WUtGOE5aT21RSUhDOEdXV0pKK1JGQ3pvWml5NEhjY2plTFNNZ0cwRGF6cU4x?=
 =?utf-8?B?QjRYOCtMUHZWQmpPTGtiSDBTNDJUTnFaampjUHBGSTVUU29XcXI2RnlRb0dx?=
 =?utf-8?B?emFVU01ZWE11Z0g3ejFuY2JrTzBUZkVXaURlaUZsak1Ya0ltM25RcGRzSEZW?=
 =?utf-8?B?dG0zdm56VU53Sms4VEUreVFvRmR5S0EwcDc0aTJRc1ZLQXZRZUxTZFpQYzU1?=
 =?utf-8?B?eGs0UGZKWUU1SkNzSWRVUVQrY2lzcnFPNXpINFNxRW51Q0Q2V2tvTjQzYTU4?=
 =?utf-8?B?TEMwVFJNaWNzQ3FZdWZ2TnZ4YktPYTY0TTlGcmNVcVZpV002bmhUL0g5bGdq?=
 =?utf-8?B?WFU1TXZKM2p6MmtHN2drZkxwd3NRQTcwZ2xqVnRmaU51c0llME0wUWxuM3Fu?=
 =?utf-8?B?TWozSWVKLzVYTzBWVmdxSURhQXd0SnI1QnlUb2NQUXhxR0w0SjRHaUp0MmZG?=
 =?utf-8?B?N3JEeitteFkwWVduSmcyS0k3aVMrbEZUZkxGdDE3eDA5QVFscUt4ZERSeG91?=
 =?utf-8?B?RjF3R3BjME5yYkJMVk9INm92bFl3Y0FmWm1ia0ZoWml5cHhwUDFuRnVUN2s0?=
 =?utf-8?B?Q0FFS3hjdjk0d2x3NTRUK3p0d0wxa0JCMzZNUStNR0JjSWZHYS9EY2I0engz?=
 =?utf-8?B?aldkY3hoZ1crdmlFYVdwdWo0TGdka3M3SHY5K3U1UE12MHFRMGtHVUxCR1NI?=
 =?utf-8?B?emhCd0ZXOFAyQ0JSK3RxRnRhS25abjRzUThJVHhJUTNWMmR0RmRnOWc2M2g4?=
 =?utf-8?B?NXFuUnVoR1FXU3RtY284V0ZZV2xyZWRieDNwYXR3WmRReTk4YmZvYkFHbTlO?=
 =?utf-8?B?bFl5TGp2RVpja0ZqQmJGUk1VblJBMCtSTjExeSthaDdja0tBZHR2anB1Zndx?=
 =?utf-8?B?UmJJVFpmV0JYY2F3aDVZSnI0ZEROS0xidlUyRXppeFh5U0djY1gxaTYxTFFu?=
 =?utf-8?B?Uk1OZkhZa1N5QWVobUdWUmNGQmJ6ZDQrOU5ycURSZTFhWHJ0Z2JxT3dXT2Fo?=
 =?utf-8?B?RTNUTVAyK3M3aGVNeExaMnBmYnE3MmNGNDlmVnE2U0RSZUswYUtUdE1RMkJD?=
 =?utf-8?B?N1FxVEJDSmFUZktTUmphWENaVXNVK1FhOUlDWjE2UXYrd0piT0VUZmNOWTNJ?=
 =?utf-8?B?RnFNRUhVRGgyMTVOcWhXZHc2YmhCRU9SZkVJeDFXdVN4NXkzb1lObjZYL1JL?=
 =?utf-8?B?dDZXSXdyVlFXQ0c3d014MHMwQ3JyMitNVDFqMWw4ZVRuYmRCanRmKy9rSU81?=
 =?utf-8?B?cnJKWVFBN0FMVlppSEFSVmtYTGlOT2pKTlRHTXZJbG9tM2l2SEhLdzFOQmlH?=
 =?utf-8?B?LzdOMDVtd0JoTmFuRkM3V0xKZm5zRElRdWdxL0tVWVIyMk1TcXRMZmVJeWlW?=
 =?utf-8?B?NkJDR0Z5ampGMGtORGJEZWxhK0hpVEl2SURRNHJTUkV5NHNoUGp3ZUcrbFY5?=
 =?utf-8?B?MlJEVG5oVmdFVGhqOXFQbXJTTzcyRFlGQXlreVdvd1JPaVRZajJOa3V3SVB3?=
 =?utf-8?B?MGE2R3oxUCtUNGpkald2eFNjYkt2Mkl6NDFSTmlFbFZEOW9ZUEdJUlp2YnJN?=
 =?utf-8?B?dmNJVjFOd0dVYU5mWTgyakZLcHVUQTE3QTVkdjcyaDNkUlJLY2xQenZEUzFV?=
 =?utf-8?B?M2VtL0dQUEJnekVUOWswT1lhMGkzaUZheFRPbjdMM0haWGR6L0dFZHlENEho?=
 =?utf-8?B?cHEwWDJFUjN0Q1pIVjlMODhuMlFNZkllaC9SM3pKUThrcU1PT1VDdlNRanRa?=
 =?utf-8?B?LzJvRjA4M3plSE0xK3R0VGcvekg0S2tJM1B0cTFqbUYzY2Z2UGF5dHB6MXhF?=
 =?utf-8?Q?Vr/SvZeLpuu740YItBInsYJNE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc2f6d4-7ca0-4366-2d7b-08daff2abcad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2935.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 23:20:24.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ5aADaJBDQ2FKztsRl903agKw7Ll70EfxAfxLCR1W086eGAnYU/Akr6W3QCXCs969XkT1iDRQbZuAW4x7t9+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
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
Cc: hverkuil@xs4all.nl, sebastian.wick@redhat.com, mchehab@kernel.org,
 benjamin.gaignard@collabora.com, lmark@codeaurora.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com, jstultz@google.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, tfiga@chromium.org,
 labbott@redhat.com, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 15:14, T.J. Mercier wrote:
> On Mon, Jan 23, 2023 at 11:49 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Am 24.01.23 um 04:56 schrieb James Jones:
>>> On 1/23/23 08:58, Laurent Pinchart wrote:
>>>> Hi Christian,
>>>>
>>>> On Mon, Jan 23, 2023 at 05:29:18PM +0100, Christian König wrote:
>>>>> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
>>>>>> Hi Christian,
>>>>>>
>>>>>> CC'ing James as I think this is related to his work on the unix device
>>>>>> memory allocator ([1]).
>>>
>>> Thank you for including me.
>>
>> Sorry for not having you in initially. I wasn't aware of your previous
>> work in this area.

No worries. I've embarrassingly made no progress here since the last XDC 
talk, so I wouldn't expect everyone to know or remember.

>>>
>>>>>> [1]
>>>>>> https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/
>>>>>>
>>>>>> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
>>>>>>> Hi guys,
>>>>>>>
>>>>>>> this is just an RFC! The last time we discussed the DMA-buf coherency
>>>>>>> problem [1] we concluded that DMA-heap first needs a better way to
>>>>>>> communicate to userspace which heap to use for a certain device.
>>>>>>>
>>>>>>> As far as I know userspace currently just hard codes that information
>>>>>>> which is certainly not desirable considering that we should have this
>>>>>>> inside the kernel as well.
>>>>>>>
>>>>>>> So what those two patches here do is to first add some
>>>>>>> dma_heap_create_device_link() and dma_heap_remove_device_link()
>>>>>>> function and then demonstrating the functionality with uvcvideo
>>>>>>> driver.
>>>>>>>
>>>>>>> The preferred DMA-heap is represented with a symlink in sysfs between
>>>>>>> the device and the virtual DMA-heap device node.
>>>>>>
>>>>>> I'll start with a few high-level comments/questions:
>>>>>>
>>>>>> - Instead of tying drivers to heaps, have you considered a system
>>>>>> where
>>>>>>      a driver would expose constraints, and a heap would then be
>>>>>> selected
>>>>>>      based on those constraints ? A tight coupling between heaps and
>>>>>>      drivers means downstream patches to drivers in order to use
>>>>>>      vendor-specific heaps, that sounds painful.
>>>>>
>>>>> I was wondering the same thing as well, but came to the conclusion that
>>>>> just the other way around is the less painful approach.
>>>>
>>>>   From a kernel point of view, sure, it's simpler and thus less painful.
>>>>   From the point of view of solving the whole issue, I'm not sure :-)
>>>>
>>>>> The problem is that there are so many driver specific constrains that I
>>>>> don't even know where to start from.
>>>>
>>>> That's where I was hoping James would have some feedback for us, based
>>>> on the work he did on the Unix device memory allocator. If that's not
>>>> the case, we can brainstorm this from scratch.
>>>
>>> Simon Ser's and my presentation from XDC 2020 focused entirely on
>>> this. The idea was not to try to enumerate every constraint up front,
>>> but rather to develop an extensible mechanism that would be flexible
>>> enough to encapsulate many disparate types of constraints and perform
>>> set operations on them (merging sets was the only operation we tried
>>> to solve). Simon implemented a prototype header-only library to
>>> implement the mechanism:
>>>
>>> https://gitlab.freedesktop.org/emersion/drm-constraints
>>>
>>> The links to the presentation and talk are below, along with notes
>>> from the follow-up workshop.
>>>
>>> https://lpc.events/event/9/contributions/615/attachments/704/1301/XDC_2020__Allocation_Constraints.pdf
>>>
>>> https://www.youtube.com/watch?v=HZEClOP5TIk
>>> https://paste.sr.ht/~emersion/c43b30be08bab1882f1b107402074462bba3b64a
>>>
>>> Note one of the hard parts of this was figuring out how to express a
>>> device or heap within the constraint structs. One of the better ideas
>>> proposed back then was something like heap IDs, where dma heaps would
>>> each have one,
>>
>> We already have that. Each dma_heap has it's own unique name.

Cool.

>>> and devices could register their own heaps (or even just themselves?)
>>> with the heap subsystem and be assigned a locally-unique ID that
>>> userspace could pass around.
>>
>> I was more considering that we expose some kind of flag noting that a
>> certain device needs its buffer allocated from that device to utilize
>> all use cases.
>>
>>> This sounds similar to what you're proposing. Perhaps a reasonable
>>> identifier is a device (major, minor) pair. Such a constraint could be
>>> expressed as a symlink for easy visualization/discoverability from
>>> userspace, but might be easier to serialize over the wire as the
>>> (major, minor) pair. I'm not clear which direction is better to
>>> express this either: As a link from heap->device, or device->heap.
>>>
>>>>>>      A constraint-based system would also, I think, be easier to extend
>>>>>>      with additional constraints in the future.
>>>>>>
>>>>>> - I assume some drivers will be able to support multiple heaps. How do
>>>>>>      you envision this being implemented ?
>>>>>
>>>>> I don't really see an use case for this.
>>>
>>> One use case I know of here is same-vendor GPU local memory on
>>> different GPUs. NVIDIA GPUs have certain things they can only do on
>>> local memory, certain things they can do on all memory, and certain
>>> things they can only do on memory local to another NVIDIA GPU,
>>> especially when there exists an NVLink interface between the two. So
>>> they'd ideally express different constraints for heap representing
>>> each of those.
>>
>> I strongly think that exposing this complexity is overkill. We have
>> pretty much the same on AMD GPUs with XGMI, but this is so vendor
>> specific that I'm pretty sure we shouldn't have that in a common framework.

I disagree with this. That works for cases where all the devices in 
question for a given operation are owned by one vendor, but falls apart 
as soon as you want to try to allocate memory that works with some USB 
camera as well. Then you've no way to express that, or to even know what 
component to ask.

>> We should concentrate on solving the problem at hand and not trying to
>> come up with something to complex to be implementable by everybody.
>> Extensibility is the key here not getting everything handled in the
>> initial code drop.

I agree with the part about solving the problems at hand, and don't see 
any harm in adding a hint as you propose as an intermediate step.

However, I think it's worth keeping the harder problems in mind, if only 
to guide our interim solutions and to help us better understand what 
kind of extensibility might be needed to enable future solutions.

Furthermore, while I know many disagree and it has its own risks, I 
think it's often worth solving problems no one has brought to you yet. 
When solutions are developed in as general a manner as possible, rather 
than focusing on a particular use case, it enables others to innovate 
and build as-yet unimagined things without being blocked by a subpar 
interface in some level of the stack where they have no expertise. I've 
been bitten time and again by taking a shortcut because I thought it 
would never affect anyone, only to have someone file a bug a few years 
later explaining why they need the exact thing I left out.

>>>
>>> The same thing is often true of memory on remote devices that are at
>>> various points in a PCIe topology. We've had situations where we could
>>> only get enough bandwidth between two PCIe devices when they were less
>>> than some number of hops away on the PCI tree. We hard-coded logic to
>>> detect that in our userspace drivers, but we could instead expose it
>>> as a constraint on heaps that would express which devices can
>>> accomplish certain operations as pairs.
>>>
>>> Similarly to the last one, I would assume (But haven't yet run into in
>>> my personal experience) similar limitations arise when you have a NUMA
>>> memory configuration, if you had a heap representing each NUMA node or
>>> something, some might have more coherency than others, or might have
>>> different bandwidth limitations that you could express through
>>> something like device tree, etc. This is more speculative, but seems
>>> like a generalization of the above two cases.
>>>
>>>>> We do have some drivers which say: for this use case you can use
>>>>> whatever you want, but for that use case you need to use specific
>>>>> memory
>>>>> (scan out on GPUs for example works like this).
>>>>>
>>>>> But those specific use cases are exactly that, very specific. And
>>>>> exposing all the constrains for them inside a kernel UAPI is a futile
>>>>> effort (at least for the GPU scan out case). In those situations it's
>>>>> just better to have the allocator in userspace deal with device
>>>>> specific
>>>>> stuff.
>>>>
>>>> While the exact constraints will certainly be device-specific, is that
>>>> also true of the type of constraints, or the existence of constraints in
>>>> the first place ? To give an example, with a video decoder producing
>>>> frames that are then rendered by a GPU, the tiling format that would
>>>> produce the best result is device-specific, but the fact that the
>>>> decoder can produce a tiled format that would work better for the GPU,
>>>> or a non-tiled format for other consumers, is a very common constraint.
>>>> I don't think we'll be able to do away completely with the
>>>> device-specific code in userspace, but I think we should be able to
>>>> expose constraints in a generic-enough way that many simple use cases
>>>> will be covered by generic code.
>>>
>>> Yes, agreed, the design we proposed took pains to allow
>>> vendor-specific constraints via a general mechanism. We supported both
>>> vendor-specific types of constraints, and vendor-specific values for
>>> general constraints. Some code repository would act as the central
>>> registry of constraint types, similar to the Linux kernel's
>>> drm_fourcc.h for modifiers, or the Khronos github repository for
>>> Vulkan vendor IDs. If the definition needs to be used by the kernel,
>>> the kernel is the logical repository for that role IMHO.
>>>
>>> In our 2020 discussion, there was some debate over whether the kernel
>>> should expose and/or consume constraints directly, or whether it's
>>> sufficient to expose lower-level mechanisms from the kernel and keep
>>> the translation of constraints to the correct mechanism in userspace.
>>> There are pros/cons to both. I don't know that we bottomed out on that
>>> part of the discussion, and it could be the right answer is some
>>> combination of the two, as suggested below.
>>>
>>>>> What I want to do is to separate the problem. The kernel only provides
>>>>> the information where to allocate from, figuring out the details like
>>>>> how many bytes, which format, plane layout etc.. is still the job of
>>>>> userspace.
>>>>
>>>> Even with UVC, where to allocate memory from will depend on the use
>>>> case. If the consumer is a device that doesn't support non-contiguous
>>>> DMA, the system heap won't work.
>>>>
>>>> Actually, could you explain why UVC works better with the system heap ?
>>>> I'm looking at videobuf2 as an importer, and it doesn't call the dmabuf
>>>> as far as I can tell, so cache management provided by the exporter seems
>>>> to be bypassed in any case.
>>>>
>>>>> What we do have is compatibility between heaps. E.g. a CMA heap is
>>>>> usually compatible with the system heap or might even be a subset of
>>>>> another CMA heap. But I wanted to add that as next step to the heaps
>>>>> framework itself.
>>>>>
>>>>>> - Devices could have different constraints based on particular
>>>>>>      configurations. For instance, a device may require specific memory
>>>>>>      layout for multi-planar YUV formats only (as in allocating the
>>>>>> Y and C
>>>>>>      planes of NV12 from different memory banks). A dynamic API may
>>>>>> thus be
>>>>>>      needed (but may also be very painful to use from userspace).
>>>>>
>>>>> Uff, good to know. But I'm not sure how to expose stuff like that.
>>>>
>>>> Let's see if James has anything to share with us :-) With a bit of luck
>>>> we won't have to start from scratch.
>>>
>>> Well, this is the hard example we keep using as a measure of success
>>> for whatever we come up with. I don't know that someone ever sat down
>>> and tried to express this in the mechanism Simon and I proposed in
>>> 2020, but allowing the expression of something that complex was
>>> certainly our goal. How to resolve it down to an allocation mechanism,
>>> I believe, was further than we got, but we weren't that well versed in
>>> DMA heaps back then, or at least I wasn't.
>>>
>>>>>>> What's still missing is certainly matching userspace for this since I
>>>>>>> wanted to discuss the initial kernel approach first.
>>>>>>
>>>>>> https://git.libcamera.org/libcamera/libcamera.git/ would be a good
>>>>>> place
>>>>>> to prototype userspace support :-)
>>>>>
>>>>> Thanks for the pointer and the review,
>>>>
>>>> By the way, side question, does anyone know what the status of dma heaps
>>>> support is in major distributions ? On my Gentoo box,
>>>> /dev/dma_heap/system is 0600 root:root. That's easy to change for a
>>>> developer, but not friendly to end-users. If we want to move forward
>>>> with dma heaps as standard multimedia allocators (and I would really
>>>> like to see that happening), we have to make sure they can be used.
>>>
>>> We seem to have reached a world where display (primary nodes) are
>>> carefully guarded, and some mildly trusted group of folks (video) can
>>> access render nodes, but then there's some separate group generally
>>> for camera/video/v4l and whatnot from what I've seen (I don't survey
>>> this stuff that often. I live in my developer bubble). I'm curious
>>> whether the right direction is a broader group that encompasses all of
>>> render nodes, multimedia, and heaps, or if a more segmented design is
>>> right. The latter is probably the better design from first principles,
>>> but might lead to headaches if the permissions diverge.
>>
>> The main argument is that this memory is not properly accounted, but
>> this also counts for things like memory file descriptors returned by
>> memfd_create().
>>
>> I have proposed multiple times now that we extend the OOM handling to
>> take memory allocated through file descriptors into account as well, but
>> I can't find the time to fully upstream this.
>>
>> T.J. Mercier is working on some memcg based tracking which sounds like
>> it might resolve this problem as well.
>>
> Gosh I hope so. How Android currently does this is with heavy use of
> sepolicy to control access to the individual heaps, sometimes even at
> a per-application/service level:
> 
> raven:/dev/dma_heap # ls -lZ
> total 0
> cr--r--r-- 1 system audio    u:object_r:dmabuf_heap_device:s0
>        248,  15 2023-01-23 16:14 aaudio_capture_heap
> cr--r--r-- 1 system audio    u:object_r:dmabuf_heap_device:s0
>        248,  14 2023-01-23 16:14 aaudio_playback_heap
> cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
>        248,   3 2023-01-23 16:14 faceauth_tpu-secure
> cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
>        248,   4 2023-01-23 16:14 faimg-secure
> cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
>        248,   7 2023-01-23 16:14 famodel-secure
> cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
>        248,   6 2023-01-23 16:14 faprev-secure
> cr--r--r-- 1 system graphics u:object_r:faceauth_heap_device:s0
>        248,   5 2023-01-23 16:14 farawimg-secure
> cr--r--r-- 1 system graphics u:object_r:sensor_direct_heap_device:s0
>        248,  13 2023-01-23 16:14 sensor_direct_heap
> cr--r--r-- 1 system system   u:object_r:dmabuf_system_heap_device:s0
>        248,   9 2023-01-23 16:14 system
> cr--r--r-- 1 system system   u:object_r:dmabuf_system_heap_device:s0
>        248,  10 2023-01-23 16:14 system-uncached
> cr--r--r-- 1 system graphics u:object_r:dmabuf_heap_device:s0
>        248,   8 2023-01-23 16:14 tui-secure
> cr--r--r-- 1 system drmrpc
> u:object_r:dmabuf_system_secure_heap_device:s0  248,   1 2023-01-23
> 16:14 vframe-secure
> cr--r--r-- 1 system drmrpc   u:object_r:dmabuf_heap_device:s0
>        248,  11 2023-01-23 16:14 video_system
> cr--r--r-- 1 system drmrpc   u:object_r:dmabuf_heap_device:s0
>        248,  12 2023-01-23 16:14 video_system-uncached
> cr--r--r-- 1 system graphics u:object_r:vscaler_heap_device:s0
>        248,   2 2023-01-23 16:14 vscaler-secure
> cr--r--r-- 1 system drmrpc
> u:object_r:dmabuf_system_secure_heap_device:s0  248,   0 2023-01-23
> 16:14 vstream-secure
> 
> I hope we can get to a point where we don't actually need to protect
> anything but the unicorns. One of my earlier attempts involved a
> counter for each heap that would allow you to limit each one
> individually, but that's not what's proposed now.

Glad someone's minding the details here. This sounds interesting.

Thanks,
-James

>> Regards,
>> Christian.
>>
>>
>>>
>>> Thanks,
>>> -James
>>>
>>>>>>> Please take a look and comment.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Christian.
>>>>>>>
>>>>>>> [1]
>>>>>>> https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/
>>>>
>>>
>>

