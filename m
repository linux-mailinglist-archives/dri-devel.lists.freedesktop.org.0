Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD46458BAA0
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 13:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960B991A48;
	Sun,  7 Aug 2022 11:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B5810E7B0
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 15:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afbf8ZhLXPpq9GUmju6ZrtTXZa1ecXzIDj3Z6zRpHWYnQKkZ5OZDXs8Ck/aE4kjAr/8eWmOsZGHhvY66hijgXbtfPyPh41iVcIKRA+oPzojj/2Wixd5AB7SvAbRwv4NxqwornP3EQjg53LI5KCB8FVyFP2X2ZVQ7kXI0w7NR+79CygIM8mQ6cjgaeaORJzXz0bnLX1Gv2URNDU5hDaB8Yj4tkFKTumSusQ+H6h5z7Qi9UdFRLkj1wi3A/bEttc/YWusmLE42O+bIfnWyIGt7EVnnmsDNDx673xeqKf4qFtwBz20cLPji7Q05yb86ITaTafPMjq6LtRxP9Ahdbxm4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xQ0Ei4B2354OLmFw9W8u7C7od7Dl0Ay2EQaM+jESJk=;
 b=Qmlsssb8FSzWNlC5JTF09vL5m/yk0QoHcmOdaqKXyswnbtdqRMx9t9qdOQa9O/zEbepWWWOQNYTepuA4a/Yg4ocvvf8SM8qbbQaSdhBjl1Bt7dxNlL5lcBl4+tlVdL/S57WganZXLSs7Saj5IzeRqih8I3F/wiypVPEkWpg45kmW/AmY2TQ2fdG+efC9kI84xkytqSPDO1EIZp+VYj9IEDMvsm0rMddTPWQsrRk3i0Ch06Ly5V1AX7NcpHswxe1JB93xYo+VB78IZp4KIZZX8/+GBocVLqV6d4ea1iKLP7EOGqljJ6AeW+wvM+9kF+Bg2JqrVI0wbwaKw1h9A2bqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xQ0Ei4B2354OLmFw9W8u7C7od7Dl0Ay2EQaM+jESJk=;
 b=UnblRbSeH3/2TG/sL9XBC0+3ACqgwm88G3a2NA1Ml0EaA7S5nwTe58f93z0N1yacJctUSKQTgxcUtAkRCYduul5osftwggeg6c601SguIxLIb1nyGK0gJZa+Tfcs2IiXQlj6RwyfOmYtcRgLPVOwZHZ1unW1Vq7tfNrN7rm6nLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by CO1PR03MB5793.namprd03.prod.outlook.com (2603:10b6:303:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Sat, 6 Aug
 2022 15:22:58 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5504.017; Sat, 6 Aug 2022
 15:22:58 +0000
Message-ID: <7c7c2c49-a0e4-cda8-be29-0d143851b9fd@synaptics.com>
Date: Sat, 6 Aug 2022 23:22:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] [Draft]: media: videobuf2-dma-heap: add a vendor defined
 memory runtine
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <CAAFQd5AL=OejdaubnYDRF4M1EKyStZP_FAMPz4CJ=KCa_8QjaA@mail.gmail.com>
 <CF192A87-1664-45B2-B26C-A9B8B6A52523@soulik.info>
 <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <CAAFQd5DTNDkZ7W0Rs8Xfq-x+y+cmHZHkDYQys29aNt2YvCJc1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::19) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70afb110-6b8c-49be-2f07-08da77bf8adb
X-MS-TrafficTypeDiagnostic: CO1PR03MB5793:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: il+ALKrKapmh+gSs1phNm1UUic4IzmDOra16phXr4PMSGw0QNeahTZdffMTNT/AncwOuUcKgUD/qdSp6A7du5S2tdF+IpwyrQOlJrFLlLdrJeBfTqNtwddESrh1R7bchwYV3lCnnQNSIJ2FUarjHXdPDDVD2aduetzWg9SH01BJlGsZOe5kA37z8vxZ6ch8huKS8Mb/dnFbOcGFJHXe7J06HqohBaO4u0AC1CJY5BjkBg2khMMF97QkZTuDDC4W08DoiKBxTiXpcuQCj1tyxGo6Aw4lqhfojXXgOALNA5SUA7DhCCFYQC4SpzwL6VoTlwqL5hdslO+BVOA63gSAoZ4AAa86pzfwmgcpOk8O89n5ImavgORJxbER0G01OJUe/o8qtwuAytP051XpVR+O3cxLH7mJUjB1Dl1qFcZRad3s6GXqPbXBV+POSEohiuC0s5Sdkhe8RaGriALOg641h5+BBdMAAT9avTps1JGuHCI5sQd+FEu/YLRZ0WM96dY+Hxxdg0ly35/H6nKvLDzlmFHnuNyMXDVvWSoJOLi34yB1G/2OSv+IPBdeMn6hZc3Q2VpoqLckzw/aOLvYcDBZlQSNJA07lzaa2IPI0QLlgqg3DN+iLLTs1YlDe6zygi1xrOOFphaIrlAsfGSgkMxv2C33HZYYmtlUqHYYTJ5b64qmpMtlaynx+hB7j+QkFQ8XKZ4T69V5TDI7sWnml4eW7IN8o6CoLUDljlEwJj0r5Fy85wHLpIDnrka+kGNRh64oRQbQ99kh/1Wb3fuepp+q1WuMGlrZutdh9lT0WkkG+1Y6EioYckvnwylwj4PVSgfiqvjSfM6czz/zTWJnaw4k5XC+IPIbsG3lMzIS3kyv+fdI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39850400004)(366004)(136003)(396003)(346002)(83380400001)(8936002)(6916009)(5660300002)(31696002)(26005)(6512007)(86362001)(186003)(2616005)(66556008)(66476007)(4326008)(8676002)(66946007)(316002)(36756003)(31686004)(6506007)(2906002)(478600001)(52116002)(53546011)(41300700001)(6486002)(6666004)(38100700002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2NSbXovWXRmSjI2d3J2eE90TFp0eFZpQXdBZnRkWGRIWjZsZ2pvajVoMkpV?=
 =?utf-8?B?Q0RIKzd0YVpLSnVMeUR3MUN5R1JNZFZud1ZUL0UrSUw1Y2F1QWdzb2ljTHhP?=
 =?utf-8?B?WVM2SDBObm9XK3FqUXNocTNOQndCdnFWam5sQys2VTRJOStCWlBJVHhvWSsz?=
 =?utf-8?B?dHFiMkpyNEJ3UHFiOUxzUUNiZElxalpXYVhDbW5hcjZITkZxdWVTd1JWMlYy?=
 =?utf-8?B?SGRTa21nbThDcTNhbzFiakNkTDAvb1NsVGE4QnRCZUlNSytlcUhMaWllWEp6?=
 =?utf-8?B?SzBib2cyZE13MzcwWXo4Z2FmSzBEZWZtTHNTVGFUQ0FLUUlSdHJ0TjJaR3Jl?=
 =?utf-8?B?U2NHdGl5NlBVM3A1YjRuNko2NmwrNHR5QjVCU0tIdjFVZFJqUTNJTXZHczkv?=
 =?utf-8?B?VnJDRFU0MGpyV3pQVWlObW1HZzdaY1c0alhXUVBqQzRxSkQ4OVk1TmRpT29m?=
 =?utf-8?B?ZmhNSW1Tc3gzaHhFTVZueGpCZ1ZpbE1RUUhCWlRFRWpyZDd0bUdRUlNuYlIw?=
 =?utf-8?B?NEM2cFBqTVQrL3RPZXN0c1pXaTRueEpuNTQrSERBaWV3YklsMlE1T1hMcTlL?=
 =?utf-8?B?WjVsd1d4OVB5YUsrNDY3d3BnUnJaSGZySnRIeHhjOFZzQmRvVHpoWjUxd1RG?=
 =?utf-8?B?UTN3Tmcwa3VaaTFWUzBpK1BzS213bE5rWFFLUFNPeEtFamJYRnc5TlFnSWRZ?=
 =?utf-8?B?eEpXTXF1dnB1OUlqNUFjUDdGcGxsMUsrUDZWUTJQNVFyelJ3Y1lxeE12L1dM?=
 =?utf-8?B?N3ZKNEg2L2Z4TzBMTTFZVElsV1FWa05KVGNRYUUzQnAxdUdqalNuRFVsa1kx?=
 =?utf-8?B?dGhIZXpzZEtOaFRxQURoME4zNy9naGpqQkdiUmczVlkvL3o4Y2dmcnNNOUla?=
 =?utf-8?B?ZUJyZ1EzMWxHWmwyYU1OYjFDQ2Vsa0lFOE00ME5GaXlwQk5PcmZZWWlaTHAx?=
 =?utf-8?B?SHZydWlNTXJEUFJiNkdpVDlmeDhQQlNHZDVYSlY0UjZ3WjF5UWQwMUN5VTZ2?=
 =?utf-8?B?alZHYncxaTFFcXh5WjhxQ0h2TllxUFpWdVhlQ3FJWlhoOG53THVZMTVHSnJz?=
 =?utf-8?B?VGRETWozOFZ5amRuNHpLS09ha2dYN2hFNGp6YWhMazZ3QUY3Vmt6c3Q4MUxN?=
 =?utf-8?B?U3JoY3o3Nml5VUJyVytzVWs1UGlqM1ZrYzkrRk51VW5nT2swSlVlRnovaEhI?=
 =?utf-8?B?djJmUW83S0QwbitDN3czOGtjZWQxVi94TS9yVndXc2YvUjhiOG15WlYzYTEw?=
 =?utf-8?B?VHVkR0U1VUZ6V0t0YnlQRlFTV0RkTHJrTUNJajNDT3Z5Z25VOU1OUFNQVFNN?=
 =?utf-8?B?OGQyaE9oUTd3N2ZGeHJIbGtWeUEwaUJQTDJ4UUk3bG94Ui9ybURCbVdnTkZN?=
 =?utf-8?B?YVVRcG5iTC9OU3QxaWI4VGNKb3lQczZ6b3BLQmJDVU1CTHhvVUs4RVBsNU5X?=
 =?utf-8?B?UkxQR0ZGK2ZjZEwzZ2phOG5wQTlXZ0FyN1FneVFGNkpUUytKeWoyMzNPZ2sz?=
 =?utf-8?B?QkNMZG5kRUl0MDk0SWJxd28yYmRwNC9SRzRjN2hMZzMrWGw1VVdSd1U1K3FF?=
 =?utf-8?B?L0c4MzVOYUF5UWZZSHhHSjlMVWtiSE1iUEVudWRCNnhxVm1FQk1GU2pvb1RW?=
 =?utf-8?B?RER4bER4YmtIdHBSdUxYdHV5TUdHWkxCQmg4b0Nrd2lOL0RTQnNCTllwdXhi?=
 =?utf-8?B?OFRrMk5UM2tJSWl6U0RNR2IvN0pNL2ZaVytaR0kxNnRNSTVZVjNZbXNKZ3dE?=
 =?utf-8?B?VG1xNERyY29IejVRR1VFcndOWWs4T0N0L0lmMEx1MS9sQTVXaG50MHJFYlk0?=
 =?utf-8?B?UkVYeVJBQlJpR1QwWUFlc09lYXVxZ256TUhsMkZkQm11R1FuV1BUNjA3cEl0?=
 =?utf-8?B?Uy9xSVdFajNPNEpyVDgyK0pZYXo0SWhKWFFUK1o2VFMvZ1NHaUFKNnU2b2Ft?=
 =?utf-8?B?bHNlMDdEbmdYV0dPTGhpZ2p1dkhsa2xNRWVsbEhKU0M2bkZ2aWxWRDFnWVBB?=
 =?utf-8?B?eW16bDVZUy90dnphN1RsK1lyeWprYTRqd05mamkyUmd5cUNwN1lmVkRudldQ?=
 =?utf-8?B?SWsxWTlTeGtma29nK3VuaElwaFJqOFlxY3M3MnBaNlFlYjhCanNNc0p3K21J?=
 =?utf-8?Q?9s2KxbuQLkyEAsQvHC5rfHvCw?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70afb110-6b8c-49be-2f07-08da77bf8adb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2022 15:22:57.9362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubVbc2ez1J+hg/7LdgmLQ6QJd2dz390dHt6C5iJNLMUk/BhSZZZ+83qcxV1eFfBzJ049d09t0cWOCpB/SenUBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5793
X-Mailman-Approved-At: Sun, 07 Aug 2022 11:14:18 +0000
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
Cc: ayaka <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 christian.koenig@amd.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/5/22 18:09, Tomasz Figa wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Tue, Aug 2, 2022 at 9:21 PM ayaka <ayaka@soulik.info> wrote:
>>
>> Sorry, the previous one contains html data.
>>
>>> On Aug 2, 2022, at 3:33 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>>
>>> ﻿On Mon, Aug 1, 2022 at 8:43 PM ayaka <ayaka@soulik.info> wrote:
>>>> Sent from my iPad
>>>>>> On Aug 1, 2022, at 5:46 PM, Tomasz Figa <tfiga@chromium.org> wrote:
>>>>> ﻿CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>>> On Mon, Aug 1, 2022 at 3:44 PM Hsia-Jun Li <Randy.Li@synaptics.com> wrote:
>>>>>>> On 8/1/22 14:19, Tomasz Figa wrote:
>>>>>> Hello Tomasz
>>>>>>> ?Hi Randy,
>>>>>>> On Mon, Aug 1, 2022 at 5:21 AM <ayaka@soulik.info> wrote:
>>>>>>>> From: Randy Li <ayaka@soulik.info>
>>>>>>>> This module is still at a early stage, I wrote this for showing what
>>>>>>>> APIs we need here.
>>>>>>>> Let me explain why we need such a module here.
>>>>>>>> If you won't allocate buffers from a V4L2 M2M device, this module
>>>>>>>> may not be very useful. I am sure the most of users won't know a
>>>>>>>> device would require them allocate buffers from a DMA-Heap then
>>>>>>>> import those buffers into a V4L2's queue.
>>>>>>>> Then the question goes back to why DMA-Heap. From the Android's
>>>>>>>> description, we know it is about the copyright's DRM.
>>>>>>>> When we allocate a buffer in a DMA-Heap, it may register that buffer
>>>>>>>> in the trusted execution environment so the firmware which is running
>>>>>>>> or could only be acccesed from there could use that buffer later.
>>>>>>>> The answer above leads to another thing which is not done in this
>>>>>>>> version, the DMA mapping. Although in some platforms, a DMA-Heap
>>>>>>>> responses a IOMMU device as well. For the genernal purpose, we would
>>>>>>>> be better assuming the device mapping should be done for each device
>>>>>>>> itself. The problem here we only know alloc_devs in those DMAbuf
>>>>>>>> methods, which are DMA-heaps in my design, the device from the queue
>>>>>>>> is not enough, a plane may requests another IOMMU device or table
>>>>>>>> for mapping.
>>>>>>>> Signed-off-by: Randy Li <ayaka@soulik.info>
>>>>>>>> ---
>>>>>>>> drivers/media/common/videobuf2/Kconfig        |   6 +
>>>>>>>> drivers/media/common/videobuf2/Makefile       |   1 +
>>>>>>>> .../common/videobuf2/videobuf2-dma-heap.c     | 350 ++++++++++++++++++
>>>>>>>> include/media/videobuf2-dma-heap.h            |  30 ++
>>>>>>>> 4 files changed, 387 insertions(+)
>>>>>>>> create mode 100644 drivers/media/common/videobuf2/videobuf2-dma-heap.c
>>>>>>>> create mode 100644 include/media/videobuf2-dma-heap.h
>>>>>>> First of all, thanks for the series.
>>>>>>> Possibly a stupid question, but why not just allocate the DMA-bufs
>>>>>>> directly from the DMA-buf heap device in the userspace and just import
>>>>>>> the buffers to the V4L2 device using V4L2_MEMORY_DMABUF?
>>>>>> Sometimes the allocation policy could be very complex, let's suppose a
>>>>>> multiple planes pixel format enabling with frame buffer compression.
>>>>>> Its luma, chroma data could be allocated from a pool which is delegated
>>>>>> for large buffers while its metadata would come from a pool which many
>>>>>> users could take some few slices from it(likes system pool).
>>>>>> Then when we have a new users knowing nothing about this platform, if we
>>>>>> just configure the alloc_devs in each queues well. The user won't need
>>>>>> to know those complex rules.
>>>>>> The real situation could be more complex, Samsung MFC's left and right
>>>>>> banks could be regarded as two pools, many devices would benefit from
>>>>>> this either from the allocation times or the security buffers policy.
>>>>>> In our design, when we need to do some security decoding(DRM video),
>>>>>> codecs2 would allocate buffers from the pool delegated for that. While
>>>>>> the non-DRM video, users could not care about this.
>>>>> I'm a little bit surprised about this, because on Android all the
>>>>> graphics buffers are allocated from the system IAllocator and imported
>>>>> to the specific devices.
>>>> In the non-tunnel mode, yes it is. While the tunnel mode is completely vendor defined. Neither HWC nor codec2 cares about where the buffers coming from, you could do what ever you want.
>>>> Besides there are DRM video in GNU Linux platform, I heard the webkit has made huge effort here and Playready is one could work in non-Android Linux.
>>>>> Would it make sense to instead extend the UAPI to expose enough
>>>>> information about the allocation requirements to the userspace, so it
>>>>> can allocate correctly?
>>>> Yes, it could. But as I said it would need the users to do more works.
>>>>> My reasoning here is that it's not a driver's decision to allocate
>>>>> from a DMA-buf heap (and which one) or not. It's the userspace which
>>>>> knows that, based on the specific use case that it wants to fulfill.
>>>> Although I would like to let the users decide that, users just can’t do that which would violate the security rules in some platforms.
>>>> For example,  video codec and display device could only access a region of memory, any other device or trusted apps can’t access it. Users have to allocate the buffer from the pool the vendor decided.
>>>> So why not we offer a quick way that users don’t need to try and error.
>>>
>>> In principle, I'm not against integrating DMA-buf heap with vb2,
>>> however I see some problems I mentioned before:
>>>
>>> 1) How would the driver know if it should allocate from a DMA-buf heap or not?
>>
>> struct vb2_queue.mem_ops
>>
>> int (*queue_setup)(struct vb2_queue *q,unsigned int *num_buffers, unsigned int *num_planes, unsigned int sizes[], struct device *alloc_devs[]);
> 
> Sorry, I don't understand what you mean here.
> 
> Just to make sure we're on the same page - what I'm referring to is
> that whether DMA-buf heap is used or not is specific to a given use
> case, which is controlled by the userspace. So the userspace must be
> able to control whether the driver allocates from a DMA-buf heap or
> the regular way.
No, it does not depend on the use case here. We don't accept any buffers
beyond the region we decided. Even for the non-DRM, non-security video,
our codec devices are running under the secure mode.

You MUST allocate the buffer for a device from the DMA-heap we(SYNA) 
decided.

I believe some other devices may have much limitation for not the 
security reason, for example, it can't access the memory above 4 GiB or
for the performance's reason.
> 
>>
>>> 2) How would the driver know which heap to allocate from?
>>
>>  From vb2_queue.alloc_devs
>>
>> What I did now is likes what MFC does, create some mem_alloc_devs.
>> It would be better that we could retrieve the DMA-heaps’ devices from kernel, but that is not enough, we need a place to store the heap flags although none of them are defined yet.
>>
>>  From Android documents, I think it is unlikely we would have heap flags.
>> “Standardization: The DMA-BUF heaps framework offers a well-defined UAPI. ION allowed custom flags and heap IDs that prevented developing a common testing framework because each device’s ION implementation could behave differently.”
>>
> 
> alloc_devs is something that the driver sets and it's a struct device
> for which the DMA API can be called to manage the DMA buffers for this
> video device. It's not a way to select a use case-dependent allocation
> method.
> 
I see, then move to the last question, we need to expand the V4L2 
framework's structure.
>>> 3) How would the heap know how to allocate properly for the device?
>>>
>> Because “each DMA-BUF heap is a separate character device”.
> 
> Could you elaborate? Sorry, I'm not sure how this answers my question.
Because a DMA-heap, a heap device itself is enough here, may plus HEAP 
flag when there is.

I don't know what else would be need to do here.
If you allocate a buffer from a heap which is delegated for security 
memory of that device, the heap driver itself would inform the TEE the 
pages occupied by it or the memory allocated from the pool which is in a 
region of memory reserved for this purpose.
> 
>> But as I said in the first draft I am not sure about the DMA mapping part. alloc_devs responds for the heap, we have a device variable in the queue that mapping function could access, but that may not be enough. A plane may apply a different mapping policy or IOMMU here.
>>
>> Would it be better that I create a interface here that creating a memdev with DMA-heap description ?
> 
> My intuition still tells me that it would be universally better to
> just let the userspace allocate the buffers independently (like with
> gralloc/Ion) and import to V4L2 using V4L2_MEM_DMABUF. It was possible
> to do things this way nicely with regular Android graphics buffers, so
> could you explain what difference of your use case makes it
> impossible?
Without keeping the backward compatibility, it won't have any problem IF 
we could tell the users the acceptable DMA-heap for each of planes and 
DMA-heap's heap flags.

We don't have an ioctl for this yet, the most possible for the decoder 
is doing that at GET_FMT ioctl()?.
> 
> Best regards,
> Tomasz
P.S. we would disclose our pixel formats soon, it could offer more 
information here.
---
Sincerely
Hsia-Jun(Randy) Li
