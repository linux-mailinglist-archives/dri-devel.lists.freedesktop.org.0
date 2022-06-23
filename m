Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C60557658
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 11:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5A112ED1;
	Thu, 23 Jun 2022 09:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1610E64C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 09:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSTmVCpckexbFuOO1WmYVhfqDRKJKZ7OnjNqdvWGG4IqZY0Jx9t34NODjknUzOrEv9RvgTCDr+L/Xam16lz/ygfCB5w4kMYICLhcF7ll1XPzyjiufmXtp0pM7Yf2WrSMB5Mdf6FotrcRZFQ0IAw4X0l5NkkwT7W/jJJMz+H5b8fWO+cCZb564JbvVE2d0vSX/dFZcoY5FtDu4g83nMF1qFe6D1arQWGqTrPjmVwK1ISAIuW0e16pqjLEMZnVqblGc86IDrRBCjj2eThy++X4b41i5PtCtF3zu5/Sqp+ggG3f1mbv6A15BryUwwl4ghIrt/9Fybw0OifjLmRCr5mutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb7BzAlONp8QWxaeq2BiBfjjhw1SnQWtEXrKTlEy2lE=;
 b=OkZQ26LIQgLmyL5wiD/0HcMaD0wQFmkkvwIiVTXp/BZuapoWW2mT11P7P5Xpby9b1bWsA1qzX7QU+esNIxE83hbZF4UPf11ZcqXrFDtOq5vn0g5MLCO7rFholFlXQznAnH7xmJREawxp/6Ecm4h07xGre6xdIXvioG+83DwwxjlKZCMGAwzjo/Uh4BoSxiTnHx7NX/yFBbRRG+9jSh3cQ+lX+ZlF0Xc8vy/YL8LH7YKtTvGH1C1F5/Kboz0GJnRmt0dpxlMB/xG5sp+yB82QSALYqCSRDzSjj3BbK4jm7Ifs0LJSxwwX9v53J5L7rwuyWzhCTLHLxG1Lkpv4rBp2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb7BzAlONp8QWxaeq2BiBfjjhw1SnQWtEXrKTlEy2lE=;
 b=kyafKdft1TQGMgILoP2vMfO5Lwgh/4mkqMMIQI1NXidwq5jk+XZxMKhuYLNL44oSrWlSk31UTWM2dN9ZJ7qPJgcZ958qSxOKwgLQOE8LDEyBbpyQ0XTDpdj7nfC+44TUP2zj+WdYlsN2Hecdfpl3DA5uAuudcUIx9V9tID7EdeI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2485.namprd12.prod.outlook.com (2603:10b6:4:bb::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 09:09:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 09:09:25 +0000
Message-ID: <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
Date: Thu, 23 Jun 2022 11:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Pekka Paalanen <ppaalanen@gmail.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0077.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4178d734-02ef-4281-4d8a-08da54f8115e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2485:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB248558243134D1251D389B5983B59@DM5PR12MB2485.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79WkSCg7+xBOe3bjMvmga2qUSKkyz9yXMxGC2NsWb3GDOJ1wZvzpSHxOvgv5/XaYl8Ps0LwMvRMSI6cJivQzgo9s8h85jFxDZFlKVMcBZ48tKgP6HgJmh6pELYVVQdR3gs1xJ/eGbbftIJ4kOZswYvW+gdN47GpqECFuxfX73tJH50j9UHFdNAew+5FaDDRxM0S6cznbrBytWgQf7xNN7vz2v2IyVtSuISIKxlsqPLEWiT3g+BTJyGVaJM0Gv4JguDb25Fv6tXtcS0a7ZVItFYuz9/oWXAuQfx5eyRZwCG1tzv7Xsz0ROTS6SE0wn/ol1hhbf+VDQ1YpaoW96vrRK2qzFXsilwG7FRa4RqLTVcR++cJIBw31R3FzPr3jdZiOXac8eio71Zo4mrVO6v1tVLZPDxGPsvJ/FNoUwIqDphiafZyj4T+KfFRtnYb3kT9no2E2cNrVmogQx68MXhjsYzoLcsvXIhRuqGXN3ctzcy3raCrt7yK7qKd15uqX5Qatun4ZkxVD8qkMOj0yhlgGNpJNbYhG9Y5kAyZImEsNTHGLEbLBa+tIGiU/ntyA7aELuKtBy0Dk4BPf2XlXStQsH2LSo3tiMi/OafnV3gUqyrSLLkIB5XkCswrRkVJsf4f2cPwItFVi+rsVGjVknVeXCqX6B6I983TC8CX8p3Mp8t1FMl5RwZUwAKFmNUyYFG8HFeQE20K6UYfBuUtIsV5w5F755LfH1IlpjLABigUAe1jk/mzgEiTrOmo8d7ou0Y+P86YYrGayCEo8mrDpYtRvA8H6rJrK9eLcuMBe8iAvPvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(86362001)(66556008)(66574015)(2906002)(110136005)(54906003)(6666004)(36756003)(66946007)(38100700002)(66476007)(31686004)(31696002)(26005)(4326008)(8676002)(316002)(6486002)(6506007)(478600001)(83380400001)(8936002)(5660300002)(186003)(2616005)(6512007)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjQ3NFQ3Mjk2Tm90VUlHUlNWNlpQdmRBVGFwMjE0aDhQanYrZk9SSER0Y3Vi?=
 =?utf-8?B?RXZCZTI3MXlUNzFraWpiRTcvQ3VxaUNKOUZuOTZ2cVBUZkt2VGYwNGQ1S2lm?=
 =?utf-8?B?RTc4c1E4RzZwUVhnOFdSTWg1MEFXU2tkdldkUVdDREdON1BMQXpIQmxtOXRI?=
 =?utf-8?B?dFVSaFdWbWV0NDRiMmF3SEk1RWdxVUZoY3RPOTRXcGErdk1leldRNVdtajN1?=
 =?utf-8?B?NXBEK2lFY3dXUHZCdnoxOHM1RlFhcHMvZEdjdGkwNDVZdDJJbEpxcDU0RHF6?=
 =?utf-8?B?cjE3bVJtamlmUmkreE1kTUw4S1RSMUJ5ekJoWXh1Qi82VFZzV2d4cWljZERN?=
 =?utf-8?B?YXBPTjNBQ1MvbHlZYVlLNlZPS25TdEp6L2N3dFVrUUFPV0lKMlA1NlhMaUpX?=
 =?utf-8?B?Q1RMekU3clowUzc0R2NkZEJLdGxxZHN1eXgyMjlBbE1ORVkrVTlqbElwVkJq?=
 =?utf-8?B?TjRIaUl0YzE1OXQyNDJKUWlwc2NBZHg0QWhkZzhXdndOdEUyY0picVl3Tjh4?=
 =?utf-8?B?OXdLZFFJM1NZTDZPekhXbUdubzI1N1ZhTzMvZVFvOXZGREFJUTBLem1RcEZm?=
 =?utf-8?B?L21mbjlJb2tPV1hDYnNsakhyTU1jcnV6NWZkWU1XMmYxeS94OEpnTUwwbEli?=
 =?utf-8?B?bktSZVZsMVdSeWJETk5Uc2cyeWFyVXdTRlhNS0JXZEJSdURYdUZRanhGSUhP?=
 =?utf-8?B?VkxJWGNsbzBWTnQvb3RDQzF0NGNFUHZFNjVEUTI3U004cC9ObTZ2eUdFcGF0?=
 =?utf-8?B?VGVqWUYyWk15cHFRQytUL1E2MFVkU2hMcHkweTN2OUR6RkIwRitqUVVKSlYx?=
 =?utf-8?B?TkdhSkVJemxPQ1puNEl1elFGczdFMTI3NCtTblorNVQ3SDN2UURITUNUOEV2?=
 =?utf-8?B?Mmh3ODI3bHdnMktPcldSWms5bFdhTkdvcG1HbTlSUlZkcXNyRVUwYlNUcFE0?=
 =?utf-8?B?T205dllvSmoyTll6UGFTaFJYREl6UmJIeTFqKzFFK1lFNmtQR1g4R1FmTXlC?=
 =?utf-8?B?OHUxd2ZNeWVJNjZzekJ5ZzNiR1oxZ0IwNUVna1pWZjBNWk51S0VGeUlHQzBR?=
 =?utf-8?B?WEg2REJjSGEyYnhvR1lmZGovNTArUDNZdEJkdzk1bVhiUGR4WUNQbDBGdVFl?=
 =?utf-8?B?YlZnU0duRUdYMWRmR3I3dmhYZ1RyL2tIbnNzZ2Z4VmtpSnprNnZPNjUvOW1O?=
 =?utf-8?B?azhWb1BYNWlSQzR4UytQZmVCOFBoS0I1V3RuNUp1UktZczJaZE4rQjFlT3hO?=
 =?utf-8?B?VTJaSDdDbGtpc1N0STdrRyttNi9pU01YdmxhakUwQXVrRjU3SGVCMWRRZmlo?=
 =?utf-8?B?cFdJU0haM3YyNFhQVlM2cWJCSjNnQXBKT0E5UG1YdWgwU2M5a3c3MDF5aUhQ?=
 =?utf-8?B?dnRUSHI4K3pPTGNIWXRvekJ2Qmd4bmRBWHlEcGErWVhLa0wzN1dadGNJRTlH?=
 =?utf-8?B?YVJNNlBWZm9iQkkwWDltdkNOaEo5cEZxNWVsT01DWklJMGQ1WGg3Sk0rem9i?=
 =?utf-8?B?LzR1SkZjZUZkZFIvdFZwSVMwb2RBVnhON3grT2dFZlAydFlaNCtCVzFBb2wx?=
 =?utf-8?B?YzhxSDVJNGN4Q254TVMxd25BbGtwdmNjTm5MWkljQ2puMkRZcmVGaFgvSTRh?=
 =?utf-8?B?eTlyd3pBNWZXTXo0VEVURzNHZk5vMm9BU0FBbUxPeHBXMHFaM1dUZ3psOHpX?=
 =?utf-8?B?V1Fxd3JGdUxKeE9FaVgwMFlQK2dPc3VQWFgxQldWbmh1RzVoa2NaREFHMWFm?=
 =?utf-8?B?b2hXbHFKSEdRanNGWEc3YUp1VDVyOWRPOHMzenNCK1RuWjY1T09EelZZSmxW?=
 =?utf-8?B?VjlML0QzQW13aC92YUNCQ3VMRDhzQ3FpK1NCdTdGdVNydWdDWU5lR3RjUVNx?=
 =?utf-8?B?WEdQOFZJdDZFLzJsOEhIeXgzQXJDbGk1N0JNcjEvY3cycTRybHkwUGgvV0VF?=
 =?utf-8?B?QzV1TGpPaVRwSjEwcmFoS21oOXVVNDJwVDM3UFdnY1crVkZvSllVaEplSExn?=
 =?utf-8?B?eXA1TTUrN0tWM3JCQW0vdWJNZExua2tWTDAvdndFWTZ3clFYN3dFdW5wdFlI?=
 =?utf-8?B?TVdJUkpCQkNHdzJyYTZ0UWRlZER2LzZHOWdrQVNwOHkvd2NubWxsM1BUYXRE?=
 =?utf-8?Q?Bcxix3cKj8zsjgkNR0OaEdS5h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4178d734-02ef-4281-4d8a-08da54f8115e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:09:24.8861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nq8L6qXdxVRpG9r4LYfbJDJeo6X5gt+e9KtUdYdjX5E30Z44hvVLPIYUMiq2Lqw+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2485
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 10:58 schrieb Lucas Stach:
> Am Donnerstag, dem 23.06.2022 um 10:14 +0200 schrieb Christian König:
>> Am 23.06.22 um 10:04 schrieb Lucas Stach:
>>> Am Donnerstag, dem 23.06.2022 um 09:26 +0200 schrieb Christian König:
>>>> Am 23.06.22 um 09:13 schrieb Pekka Paalanen:
>>>>> On Thu, 23 Jun 2022 08:59:41 +0200
>>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>>
>>>>>> The exporter isn't doing anything wrong here. DMA-buf are supposed to be
>>>>>> CPU cached and can also be cache hot.
>>>>> Hi,
>>>>>
>>>>> what is that statement based on?
>>>> On the design documentation of DMA-buf and the actual driver
>>>> implementations.
>>>>
>>>> Coherency and snooping of the CPU cache is mandatory for devices and
>>>> root complexes in the PCI specification. Incoherent access is just an
>>>> extension.
>>>>
>>>> We inherited that by basing DMA-buf on the Linux kernel DMA-API which in
>>>> turn is largely based on the PCI specification.
>>>>
>>>>> Were the (mandatory for CPU access) cpu_access_begin/end functions &
>>>>> ioctls not supposed to ensure that CPU cache is up-to-date / CPU cache
>>>>> is fully flushed out?
>>>> No, those functions are to inform the exporter that the importer has
>>>> started and finished accessing the buffer using the CPU.
>>>>
>>>> There is no signaling in the other direction. In other words the
>>>> exporter doesn't inform the importer about CPU accesses because it is
>>>> the owner of the buffer.
>>>>
>>>> It's the responsibility of the importer to make sure that it can
>>>> actually access the data in the buffer. If it can't guarantee that the
>>>> importer shouldn't import the buffer in the first place.
>>> This is not really correct. DMA-buf inherited the the map/unmap part
>>> from the DMA API, which on cache coherent architecture is mostly a no-
>>> op or ties into the IOMMU implementation to set up the pagetables for
>>> the translation. On non cache coherent architectures this is the point
>>> where any any necessary cache maintenance happens. DRM breaks this
>>> model by caching the DMA-buf mapping for performance reasons.
>> That's not only because of performance reasons, but also because of
>> correctness.
>>
>> At least the Vulkan API and a bunch of OpenGL extensions make it
>> mandatory for the buffer to be cache coherent. The kernel is simply not
>> informed about domain transfers.
>>
>> For example you can just do a CPU copy to a ring buffer and the
>> expectation is that an already running shader sees that.
> Yes, that one is not really an issue as you know that at buffer
> creation time and can make sure to map those buffers uncached on non
> coherent arches. If there are no explicit domain transfer points non
> coherent must bite the bullet and bypass the CPU caches, running
> performance into the ground.

Yes, exactly that was what this mail thread was about. But this case is 
currently not supported by DMA-buf.

In other words, cache coherency is currently mandatory for everybody 
involved.

>>> In the DMA API keeping things mapped is also a valid use-case, but then
>>> you need to do explicit domain transfers via the dma_sync_* family,
>>> which DMA-buf has not inherited. Again those sync are no-ops on cache
>>> coherent architectures, but do any necessary cache maintenance on non
>>> coherent arches.
>> Correct, yes. Coherency is mandatory for DMA-buf, you can't use
>> dma_sync_* on it when you are the importer.
>>
>> The exporter could of course make use of that because he is the owner of
>> the buffer.
> In the example given here with UVC video, you don't know that the
> buffer will be exported and needs to be coherent without
> synchronization points, due to the mapping cache at the DRM side. So
> V4L2 naturally allocates the buffers from CPU cached memory. If the
> expectation is that those buffers are device coherent without relying
> on the map/unmap_attachment calls, then V4L2 needs to always
> synchronize caches on DQBUF when the  buffer is allocated from CPU
> cached memory and a single DMA-buf attachment exists. And while writing
> this I realize that this is probably exactly what V4L2 should do...

No, the expectation is that the importer can deal with whatever the 
exporter provides.

If the importer can't access the DMA-buf coherently it's his job to 
handle that gracefully.

See for example on AMD/Intel hardware most of the engines can perfectly 
deal with cache coherent memory accesses. Only the display engines can't.

So on import time we can't even say if the access can be coherent and 
snoop the CPU cache or not because we don't know how the imported 
DMA-buf will be used later on.

Regards,
Christian.

>
> Regards,
> Lucas
>

