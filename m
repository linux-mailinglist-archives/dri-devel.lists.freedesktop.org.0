Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DCB7775CB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 12:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA2910E4FE;
	Thu, 10 Aug 2023 10:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC24110E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 10:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC02oX1AAD+5+Oo2IghqMMf3NJe7YdcisOnlaFnHvZu6dAaII4KXqeINkMpDnyydVmcdN7gW68A7vl8WO0JEaQaW85pEFVaEhKqJtCoyVmVxzR7UH4D5W4BDzcakBGMRKyGR851pZLMTJipESJ3b84kuuDmeEs+g7iWNYDyCoJd20NNruTDEYsKte4RGkqpREh97k5OdJ+42gXEVwcpSSo/naFaz87MUnWYCQ6NcXBlR0K7+NmS5jV4hWcIgVVTbSBnWzANoNG0g+t8IBl0dBfuAc5/Jt9p2olVfju37bjl0Yeec2fRac7vNJ2PdBIGFTqrF+ve5ccnp/FpXbsnv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVKaXE29Fzqmwl/HClNTrG1OlqnnuumMUr+MNQ22Nbg=;
 b=A4DP8h5Wg3QXGBXtnafuCrAuEi3HMBsFgFQK2AEZhpVvEUJ3kprOd9hpZTjRmG1pKNUr0lRyBj+wT8vYDsDlCLRikKp1Qxn9ueU4FnJ5iLfYaQAxPME2wIIn3RClU4Curnr2kjyaMyk0KbKfpwkMVvmaDqK8zmzKXKlnPqAlDV9ComzLg5nh+HwU/eY3D0PbgcykKU9okrW7sMPvY9eeQfKg91Ev7nrTHtdcqbUabACahEEu3ODladDHuV9RMIzIRCug0RhUUYcXSd3gyCw68w5zm/XlOk+kGp4WQ54vrTPGfecJb3JLpksLXvcb8wdI73IsQoyQioEqMf8FRkKCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVKaXE29Fzqmwl/HClNTrG1OlqnnuumMUr+MNQ22Nbg=;
 b=RMCWt4S939SnfkGYYEmAy3wjhYPAIbslApE1TXe/VicPV9a1XDvwMYHyBVFj52g/nhzrkxOSYBcR8jqJ1sbS5Z2QQNs/AMJkEv36rm2eNSRw23P3ddIb2FTPuejW9npD/J1S2nsDSrBjSYp84Mwq9yrB+zm2v5JXBNk3LbTBlO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 10:29:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Thu, 10 Aug 2023
 10:29:15 +0000
Message-ID: <1009bd5b-d577-ca7b-8eff-192ee89ad67d@amd.com>
Date: Thu, 10 Aug 2023 12:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230810015751.3297321-1-almasrymina@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: f86ea6e1-2f3c-48cc-ce5c-08db998ca560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6QLVPpC8QQCSiiMg1ruhAVKOjScH/nZpPTpvcJ+ZlAvVEbUsDTgFpb4IFFOk4lM5/lyPBQF9Axyh2FrnzRyPrThBRhbURaOiTttu3/wv4NeXNQ7I9TWcbOpAKuGKyQS0LI+OqFFy1SFzq1bIO9wc0YVhtvWbdkpMf7/0tT+m+6m5BMCsiKzguce7cIafGXoNR9OADIqFZGC7EfgE/Fef1sxbKAROFV5etjKGBL2/ShenVfAwPf0M4cPWj+BAwyOQz2VEUnWr8FctIEes/6LGI6vaP+O/FLYRh1gSdS83rDXhgqL/lpatUtc8YI656zWnp3m6Ubc7qzc+W2ln/lFaKD1u9anB4gnkbubvxGda6KuTh58TmQ3wOaZZkwrt0pbuEnYIU6fa5y7mdIh2S4Yh2k2SxOsRhphRN+Dh+8Tzn6msywwzbq1x1/yOtM8iyPqrL6BMQzgVUIREOT5tIiGxb0XYfgoPHlW9Yg6jQFLBBXvNCMbKjUAl3Bkxc/BxD8cbHNLqzlLg6P8qijVKUrDOc+JBx2fj0RCFTar1ggCdRtujVOPcC34sB3h1aJHdGTjOFUWpQF3V4+EhZSlJf1U0YEzBDwlB3S4I87NpAPDWspXx7AV8VsHTPewLOBREFM75WslGsj05LE8QmwNNTZrHQVFJTHMXBsnUsx72tDQQDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(186006)(451199021)(1800799006)(83380400001)(2616005)(478600001)(31686004)(316002)(66899021)(966005)(6512007)(6506007)(41300700001)(66946007)(31696002)(8936002)(4326008)(2906002)(66556008)(6486002)(66476007)(6666004)(8676002)(36756003)(54906003)(38100700002)(7416002)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2IrcHM3bUFLVGNHSWtkdHhoR0xHS3JLbzI5d1dmdVpNYjJ6TzB4VVJLS2Rm?=
 =?utf-8?B?cUxsRUljaDd1TW1LQjVRZ0lSaW1rN3YzOVR6bGVGSkViUjUrbG1NanduZXZI?=
 =?utf-8?B?T3hJK3FoMzBiYjNHSE5keDlXNnZYb3laL3JIRkI3Uk1nTmM5eGpSSHVkYUFk?=
 =?utf-8?B?czIvS3ZnZHVmVThOYm5VZzEwdHl2Vm1kazdRYjJsQ0h4N3ViYkl4TFZYK3Fv?=
 =?utf-8?B?S0FIVnlVcmk2dGg4c3FQaEhPMklJamlPaWFRWm9VMld1OUJnamZIOHBVaHJK?=
 =?utf-8?B?NjV0ZlFRek9nZVQ3Z29JeHltUjNQeDdvbW8yZnlOR2NNR3pVdE5LTmhRVGZX?=
 =?utf-8?B?d2N1N1p3eSs2aXFYcHFCL1hHTndpdXVYZ2pMVjkvb0tNVWZQUzh6NHcyUk93?=
 =?utf-8?B?dlR5L203M2RKNlZKdkdWMXdYSXg0UkRaeFk4bUl2b2s1d1htSlBnNVVSREtV?=
 =?utf-8?B?QTFPc1lZZUM2bkJPU2xYY1N3NVRoZmRjS1NlTHU0Y1EwQ1hhUXRxZjhwV0F6?=
 =?utf-8?B?L1BPZWE1VW1aaWQvdzk3dXNMZjlGc3BBYlhOSUZLcUZ4emtJaTZlY0k5UjEy?=
 =?utf-8?B?SnlOeWdNc0pMdFAzaXN6Y2FLRFlHOWd5cTJaTnZ5YWpYdVRjTVdMM0VRU3NU?=
 =?utf-8?B?eU9neHRKeEM2RnJwdHFCdDYwRTM2NXJFeURQbVlqcmUwRjU5QkpqZjJ5S3U3?=
 =?utf-8?B?TDJqblZpa2JjbjM1UVZweU5UMVIvZWhsZWVlNWFEYStYbjZNb3BmT0szY0pZ?=
 =?utf-8?B?MEYydElId0trdkpsTGdkSndGSGdZcVlGYTEvajV3dUZYZlV0ZTdUaEVzWUxT?=
 =?utf-8?B?K2plYXN0RkYzR1BCaThQK2pTZzdZUXZPVkwyWG4renJWZjlkZGJteEp1dkIz?=
 =?utf-8?B?UCt0dFQ0ZFJZQ1RlUFpvV2JoSkIxbTlXS3M5Qk1FMmM0aEExN3JYTHdCYkh4?=
 =?utf-8?B?Z2VQV1o2cmtaeHNWOHBrVnQzVzhiakRhRFVYSmFOYU4zRGdaanlBS09ocVFC?=
 =?utf-8?B?VVJKa1dZM3VLOXpVMWEyY01CTVFEeFlqckhER0pRdmhNUG10NUF2RmQzYm9o?=
 =?utf-8?B?WmhmT0R6K2x1aWxrMk1lUVlmL1hHVU1aM0ZyeGoxZVhxM3Urb2pLQ20zZ2ww?=
 =?utf-8?B?UnJIT01wUThmNUxBYnRIc1JTNmhBSlR2ZXp4dlh4YjUva2FZcUZxZmo2ZUsx?=
 =?utf-8?B?cStwb3I0dFZxZE1xbmdyVm9YMVdVMDBZVXhBbmRCM2NyT29zSlZxMlQwNWJY?=
 =?utf-8?B?R1N5MGZtOTBmMllBTXRHWmhtYTMzdjBvL253cm13eW9yUWlEU1pkdmROV1pR?=
 =?utf-8?B?dnY3R0RwZjVqUmx0ZXZFMkhvc2s5NXBRYW80SDMzREE2MzgzOWJuTHBkUGxt?=
 =?utf-8?B?dlFEdnF6T3VveU5QTnNRdFlRK014Qit5K3JnL0tmaTV6bjE3RHY1S2dmc3cv?=
 =?utf-8?B?OWFNNDFaS3JlM3FFaTFMUWdHazFDL0JSM0R3Zk5WS2tLU0VnZWh6OTBvaWlr?=
 =?utf-8?B?YUticmd1M0xnUFROZDhaNTM2c2JQaHEzRUZ0UjRWcGRJQUhkQVFDVGt1YWdQ?=
 =?utf-8?B?VDhSWlZFeWIwczh6M3FYbFNwV3N6UzFNQmxxODBBbHJwdDRzalJ1OWhkZ1Jo?=
 =?utf-8?B?ZWR5aGpXUFAveVJZb2JJeUVWS2xKTHF2cE5jN2tqNUd5c0t2MzNQU0RKRkxO?=
 =?utf-8?B?NkRsTVNtYmZXTHhpd2xRSlIrT0JuRVJwU3hyUjNBVXdWQS8vQ2huQmx6TWgw?=
 =?utf-8?B?M0VSaTFmWTB5aUxOWWVSbW0zeEltWmdBd0o0ZGU1dVl3bVJDME5JREpaUmhX?=
 =?utf-8?B?VU4yYm5ldSsrazA3TElmdXFjSTJWTUR4TG5GQlJEblo3TmVCTGF6aWxUeVZ2?=
 =?utf-8?B?Z1VnUWNQaVgvdmlod0JxamdtVm84cWpyUFA1WmJnZG1CdjE2QXo0bHNqZWxW?=
 =?utf-8?B?R3pvRW5hcXNJU3U2V2JpVU81dHpjMTBiWWtzQ095V3VhNFR1N25nZEdTdUxl?=
 =?utf-8?B?dDFMUDBiY0ZzMTRPYzVXMjZFbU1UTzlMQXlHUE03dkdiWkE4S3hxazkrSWVQ?=
 =?utf-8?B?RHNHTjJQeCs1WG9KTmE0c1pZNFdidXZjQmZzWXQyaThGSVo5Sk5VYUJzZWQw?=
 =?utf-8?B?YjE3U004dnI5VGEzVE5pSDlMS0lMODN3dFR6SCtObXBaeUpPWkRSV0RXVWtq?=
 =?utf-8?Q?QD00qRF24ONXkpmjeis7s2F8fc8sS4eJMqxAXEfbCdCu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86ea6e1-2f3c-48cc-ce5c-08db998ca560
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 10:29:15.3881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlTlwlAAMG/IyNirVUNd1Do87A40CIplfuJqx1gYJDBS2JDTZb/BYX1W4M3b9gDL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.23 um 03:57 schrieb Mina Almasry:
> Changes in RFC v2:
> ------------------
>
> The sticking point in RFC v1[1] was the dma-buf pages approach we used to
> deliver the device memory to the TCP stack. RFC v2 is a proof-of-concept
> that attempts to resolve this by implementing scatterlist support in the
> networking stack, such that we can import the dma-buf scatterlist
> directly.

Impressive work, I didn't thought that this would be possible that "easily".

Please note that we have considered replacing scatterlists with simple 
arrays of DMA-addresses in the DMA-buf framework to avoid people trying 
to access the struct page inside the scatterlist.

It might be a good idea to push for that first before this here is 
finally implemented.

GPU drivers already convert the scatterlist used to arrays of 
DMA-addresses as soon as they get them. This leaves RDMA and V4L as the 
other two main users which would need to be converted.

>   This is the approach proposed at a high level here[2].
>
> Detailed changes:
> 1. Replaced dma-buf pages approach with importing scatterlist into the
>     page pool.
> 2. Replace the dma-buf pages centric API with a netlink API.
> 3. Removed the TX path implementation - there is no issue with
>     implementing the TX path with scatterlist approach, but leaving
>     out the TX path makes it easier to review.
> 4. Functionality is tested with this proposal, but I have not conducted
>     perf testing yet. I'm not sure there are regressions, but I removed
>     perf claims from the cover letter until they can be re-confirmed.
> 5. Added Signed-off-by: contributors to the implementation.
> 6. Fixed some bugs with the RX path since RFC v1.
>
> Any feedback welcome, but specifically the biggest pending questions
> needing feedback IMO are:
>
> 1. Feedback on the scatterlist-based approach in general.

As far as I can see this sounds like the right thing to do in general.

Question is rather if we should stick with scatterlist, use array of 
DMA-addresses or maybe even come up with a completely new structure.

> 2. Netlink API (Patch 1 & 2).

How does netlink manage the lifetime of objects?

> 3. Approach to handle all the drivers that expect to receive pages from
>     the page pool (Patch 6).

Can't say anything about that. I know TCP/IP inside out, but I'm a GPU 
and not a network driver author.

Regards,
Christian.

>
> [1] https://lore.kernel.org/netdev/dfe4bae7-13a0-3c5d-d671-f61b375cb0b4@gmail.com/T/
> [2] https://lore.kernel.org/netdev/CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com/
>
> ----------------------
>
> * TL;DR:
>
> Device memory TCP (devmem TCP) is a proposal for transferring data to and/or
> from device memory efficiently, without bouncing the data to a host memory
> buffer.
>
> * Problem:
>
> A large amount of data transfers have device memory as the source and/or
> destination. Accelerators drastically increased the volume of such transfers.
> Some examples include:
> - ML accelerators transferring large amounts of training data from storage into
>    GPU/TPU memory. In some cases ML training setup time can be as long as 50% of
>    TPU compute time, improving data transfer throughput & efficiency can help
>    improving GPU/TPU utilization.
>
> - Distributed training, where ML accelerators, such as GPUs on different hosts,
>    exchange data among them.
>
> - Distributed raw block storage applications transfer large amounts of data with
>    remote SSDs, much of this data does not require host processing.
>
> Today, the majority of the Device-to-Device data transfers the network are
> implemented as the following low level operations: Device-to-Host copy,
> Host-to-Host network transfer, and Host-to-Device copy.
>
> The implementation is suboptimal, especially for bulk data transfers, and can
> put significant strains on system resources, such as host memory bandwidth,
> PCIe bandwidth, etc. One important reason behind the current state is the
> kernel’s lack of semantics to express device to network transfers.
>
> * Proposal:
>
> In this patch series we attempt to optimize this use case by implementing
> socket APIs that enable the user to:
>
> 1. send device memory across the network directly, and
> 2. receive incoming network packets directly into device memory.
>
> Packet _payloads_ go directly from the NIC to device memory for receive and from
> device memory to NIC for transmit.
> Packet _headers_ go to/from host memory and are processed by the TCP/IP stack
> normally. The NIC _must_ support header split to achieve this.
>
> Advantages:
>
> - Alleviate host memory bandwidth pressure, compared to existing
>   network-transfer + device-copy semantics.
>
> - Alleviate PCIe BW pressure, by limiting data transfer to the lowest level
>    of the PCIe tree, compared to traditional path which sends data through the
>    root complex.
>
> * Patch overview:
>
> ** Part 1: netlink API
>
> Gives user ability to bind dma-buf to an RX queue.
>
> ** Part 2: scatterlist support
>
> Currently the standard for device memory sharing is DMABUF, which doesn't
> generate struct pages. On the other hand, networking stack (skbs, drivers, and
> page pool) operate on pages. We have 2 options:
>
> 1. Generate struct pages for dmabuf device memory, or,
> 2. Modify the networking stack to process scatterlist.
>
> Approach #1 was attempted in RFC v1. RFC v2 implements approach #2.
>
> ** part 3: page pool support
>
> We piggy back on page pool memory providers proposal:
> https://github.com/kuba-moo/linux/tree/pp-providers
>
> It allows the page pool to define a memory provider that provides the
> page allocation and freeing. It helps abstract most of the device memory
> TCP changes from the driver.
>
> ** part 4: support for unreadable skb frags
>
> Page pool iovs are not accessible by the host; we implement changes
> throughput the networking stack to correctly handle skbs with unreadable
> frags.
>
> ** Part 5: recvmsg() APIs
>
> We define user APIs for the user to send and receive device memory.
>
> Not included with this RFC is the GVE devmem TCP support, just to
> simplify the review. Code available here if desired:
> https://github.com/mina/linux/tree/tcpdevmem
>
> This RFC is built on top of net-next with Jakub's pp-providers changes
> cherry-picked.
>
> * NIC dependencies:
>
> 1. (strict) Devmem TCP require the NIC to support header split, i.e. the
>     capability to split incoming packets into a header + payload and to put
>     each into a separate buffer. Devmem TCP works by using device memory
>     for the packet payload, and host memory for the packet headers.
>
> 2. (optional) Devmem TCP works better with flow steering support & RSS support,
>     i.e. the NIC's ability to steer flows into certain rx queues. This allows the
>     sysadmin to enable devmem TCP on a subset of the rx queues, and steer
>     devmem TCP traffic onto these queues and non devmem TCP elsewhere.
>
> The NIC I have access to with these properties is the GVE with DQO support
> running in Google Cloud, but any NIC that supports these features would suffice.
> I may be able to help reviewers bring up devmem TCP on their NICs.
>
> * Testing:
>
> The series includes a udmabuf kselftest that show a simple use case of
> devmem TCP and validates the entire data path end to end without
> a dependency on a specific dmabuf provider.
>
> ** Test Setup
>
> Kernel: net-next with this RFC and memory provider API cherry-picked
> locally.
>
> Hardware: Google Cloud A3 VMs.
>
> NIC: GVE with header split & RSS & flow steering support.
>
> Mina Almasry (11):
>    net: add netdev netlink api to bind dma-buf to a net device
>    netdev: implement netlink api to bind dma-buf to netdevice
>    netdev: implement netdevice devmem allocator
>    memory-provider: updates to core provider API for devmem TCP
>    memory-provider: implement dmabuf devmem memory provider
>    page-pool: add device memory support
>    net: support non paged skb frags
>    net: add support for skbs with unreadable frags
>    tcp: implement recvmsg() RX path for devmem TCP
>    net: add SO_DEVMEM_DONTNEED setsockopt to release RX pages
>    selftests: add ncdevmem, netcat for devmem TCP
>
>   Documentation/netlink/specs/netdev.yaml |  27 ++
>   include/linux/netdevice.h               |  61 +++
>   include/linux/skbuff.h                  |  54 ++-
>   include/linux/socket.h                  |   1 +
>   include/net/page_pool.h                 | 186 ++++++++-
>   include/net/sock.h                      |   2 +
>   include/net/tcp.h                       |   5 +-
>   include/uapi/asm-generic/socket.h       |   6 +
>   include/uapi/linux/netdev.h             |  10 +
>   include/uapi/linux/uio.h                |  10 +
>   net/core/datagram.c                     |   6 +
>   net/core/dev.c                          | 214 ++++++++++
>   net/core/gro.c                          |   2 +-
>   net/core/netdev-genl-gen.c              |  14 +
>   net/core/netdev-genl-gen.h              |   1 +
>   net/core/netdev-genl.c                  | 103 +++++
>   net/core/page_pool.c                    | 171 ++++++--
>   net/core/skbuff.c                       |  80 +++-
>   net/core/sock.c                         |  36 ++
>   net/ipv4/tcp.c                          | 196 ++++++++-
>   net/ipv4/tcp_input.c                    |  13 +-
>   net/ipv4/tcp_ipv4.c                     |   7 +
>   net/ipv4/tcp_output.c                   |   5 +-
>   net/packet/af_packet.c                  |   4 +-
>   tools/include/uapi/linux/netdev.h       |  10 +
>   tools/net/ynl/generated/netdev-user.c   |  41 ++
>   tools/net/ynl/generated/netdev-user.h   |  46 ++
>   tools/testing/selftests/net/.gitignore  |   1 +
>   tools/testing/selftests/net/Makefile    |   5 +
>   tools/testing/selftests/net/ncdevmem.c  | 534 ++++++++++++++++++++++++
>   30 files changed, 1787 insertions(+), 64 deletions(-)
>   create mode 100644 tools/testing/selftests/net/ncdevmem.c
>

