Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33391473DEF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 09:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F0810E9D0;
	Tue, 14 Dec 2021 08:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B510E9D0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 08:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMMRlNJl2nYT1TQRIGtlHido9zNnokOgMWzLS3ImeL5CBDIFeF8HjGezRiVizD3Gz5aB5ku7FQ04SVCf21I6c2zQ2BqDrCHd1p5My7NYibbHMv/w7cs5dEfgOs+/bQrsrAPDh7/P1Ydu1HCHN3mWOMn4lBimvsix7zNhB2Y9GNmhFkoxGmkwJqbZ7OHAE5U+qf0T1ULWri68ScRu3wXXlrxKuy+5pUkEXQF48hKqJXjPdFjBKEpIzVpfan94Is1Ewgq6NbkjCGHMpub1k1KMRLP7vau+TQY5H28Qv/tDOZGRODN6tqGAv+Hcgb8WN5pCD+rWEr30nX3iBmtPQPUTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLcmzIxeUTHQv3CLVxBTLK4oXGEcEUu3vNUFF9W/R7Y=;
 b=clatfSfhkMam6SZFVMJlLQdwxYGveVLwHMDE959+92gWe4E3O3o8+M1QJs84d/aLxwcEeygknQdvKoQJMcUuch9pxFlamTDNCmbWeRJEqz4uIaPQxJwN3ieVw0FDKIvZns0yjjBav0OxcdHLml9Pt2Stj4T3x+gBJ710KQ5n7UOhD8YKRud+sDD/EtD7MlWcPlLQ+RPBZv6wmizj3z8XIQHB6jAtJlWvRe3RIxVP0AOOxd8kJVAXFrE3vyz7uZTI4v+Vbdcr4bI+cq4YKyYObcJek1n/cPgPSyTmG7z+gSuFIFcc2fl44jD9a0flfBSFk5nRgqgdUVStK9YRI2JF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLcmzIxeUTHQv3CLVxBTLK4oXGEcEUu3vNUFF9W/R7Y=;
 b=to1o1ZL7zxkroG+K1btNDmfQuVaDID1YJrpAzWJY84XGglY8uHmsPi43BHvbJQh9xhEELS0lzJD8WdvctuSrbCdMDq2jWJd5vaj1Bh75drIKjOSRHl5LUScWBXI2xlA9xCmMFsvY2KAf4u8iC1hXQgs+VGsQDdJzBL4KFi77ZwbgAqPjWjxOjeWglkCmO5mLFYH1rAojhoojXRxwdXfzDJRCWAWzhYcwIXMCa+5ZDjqA1Ygrxt24OUzC9JflceoQdMyDX+KpMXLtI7x4xzUb4m6y64NVrtlQyXeGaQxIQuAA8KkDIbTJeh/+gpINrtuHUUaqNgZM6fzLDybY3tPlKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Tue, 14 Dec
 2021 08:05:54 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4755.022; Tue, 14 Dec 2021
 08:05:54 +0000
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
From: Jon Hunter <jonathanh@nvidia.com>
To: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
 <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
Message-ID: <91dddccd-a6c1-21b3-34d6-6a8082a386e7@nvidia.com>
Date: Tue, 14 Dec 2021 08:05:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::28) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [IPv6:2a00:23c7:b086:2f00:c7fc:fb79:689a:806f]
 (2a00:23c7:b086:2f00:c7fc:fb79:689a:806f) by
 LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Tue, 14 Dec 2021 08:05:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac27056-e76f-4196-961f-08d9bed88d2c
X-MS-TrafficTypeDiagnostic: CO6PR12MB5476:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54769290039DCBA5F5708A68D9759@CO6PR12MB5476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6trM5rUuLPkfKTldYclRGkOtp+QdJ8Whc09GMRLumuJQPZFJFasAG4otZxrHgwWarI99YwGUSxI+shbV4BIsTy0aZBmj8QmAXnAIJpsnofV+obYb1++NPhlH761waBioQfOg2MC3/vRlzifgxsjy9oXFhu56OJVZH71ZCH2GYTPLzBZAOfDSLH2ARTE8sxXqQ49wXFFx8st4QQaH/oMltDEpSnXdRjS5dyZNGOM8on5sbEz6vlwqBHelq8edsRF/pKPzWoVSZxqQ/8PmmQLeVldqGRxZ7kqUHqZB/aJgXUdbGVCjb4Znh34xeifyeq/JsE7LSYVmMu2UEXLfCYJ43RO8rtfDPclrl4ar9Ww+UTFQa7JnlG200M8LbXYgZH5+bEYKXUTDUtJiQ53xnyHg52pKH6Sqt7H4bLxr5rV8cGokdX3bOQq4zzrLGz5fgZnRVJKnNHtETHkMpkxvfkVsD4E7ZRLwc43chXhTsaD9+yCxLoDGS+yOQFtoyiCFcBRKbu31pIpwlykKs8X6WqaGiUKhNC86nzDDbxdIx9MOD9pT4j2t3tFNm7V76q9yIxPLRjy7qqeI6LT1m9EqMpbI1WkUGWQGb78cfOQJqAwgXvXyl/Ukdx7BYqpXvcNnRD1TtV0oifJlygsA6YY1aHLxilWfWCm9N1gaPKf02I6haoxoRvPbYzlHdaIuROzB3vzn8gRgNJG3mBnh/uXWfOGyuwFPMyGv5oKGObUW6+1m2MKsxW1fYnM6aN5VSl2wU03Qbvpb/IEshz5UO1GnTeduvnl92H/JYiIiMkcBbdmbcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(31696002)(508600001)(4326008)(316002)(186003)(83380400001)(36756003)(38100700002)(2906002)(2616005)(31686004)(54906003)(8676002)(7416002)(66946007)(6486002)(66556008)(66476007)(86362001)(5660300002)(53546011)(32563001)(43740500002)(45980500001)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3p6bC80YlBBaDdWTlNmZ2xaZ0tFQ1F6bVJaVE5WYTVRV0gxYmlYMU5RL1d6?=
 =?utf-8?B?TkVWNGdTSm5QUThWNnB3T2k5Q3RENVhUKzNtVXN2NFBaRDNzWTJ5TGRuRVg0?=
 =?utf-8?B?UERMcFhDQXUxNkx4dTVETlozc0xRUE1RZlI5NmNaM2JQUGV1Ty91TnFqUW1m?=
 =?utf-8?B?K3hBZlAzeUV4cTFRTzFwbyszOUxxRHpXVGpjOTdiRzFic0hxOTBDakorVkQz?=
 =?utf-8?B?TjJLVGRSbHFFYkF5TVIrUzZySDltWXk2MWVUKyt1QzZ2UmtsMksvS0FucDU2?=
 =?utf-8?B?VTZmT3dyc1o2bHgzY25ZZzNRRlJqdUxkcHNqMXg3TXY3RjA3ZlRmUVpwMUVq?=
 =?utf-8?B?bExjV21aOXFWb3dSYWVoajFBdi9wQXFTcTBVTDlBTGhOZ0dsdituRDRYbWRz?=
 =?utf-8?B?c3ZEaVdqQ256V0M0ZDFjRkdXaGdRWEFJMWxkaVA0cUtkcDQ2ck1kbTcvVy9R?=
 =?utf-8?B?THdaeU9INFg5Qjh2SFlwMkg3anJmZUZWZ0lDUVNWendoSnBSMEVyQ2RDM2dZ?=
 =?utf-8?B?YUlrSU95c0xpMjVLRUU2M2htWlRKZ2lrcTlMbXVtZGRxcjM5SVQrZWducmhi?=
 =?utf-8?B?ejVTK2t3eFNoenAxVVdSUXFyNXZWRkphbk1VQjE1REhDUE81b1E1bjZ5dHgz?=
 =?utf-8?B?SVFaby9OZk1wZFpRU0FmQWsxZWp5dG1EaXdkc1RaVCtRU04wdXUrZFZzNXFS?=
 =?utf-8?B?SVh1RHlyQThobzVrS1JpWnRlSjU3cDZod1RHdnZJWTdhZUErWjR1aUVTWHdk?=
 =?utf-8?B?MGdFZTE0c0I3MDZURTBzUm1JNEVOU1ltV1d3eFFWV1p5aU45M2NNZ1pYdk12?=
 =?utf-8?B?SEpSR1JtSGlKbEtscU1NT1F2RHl0VFNBaDJQY05qN1FYOUYwRHI1c3NoZ0dN?=
 =?utf-8?B?QnQwRWluVThLYW1iejZhYmNpeFRiRVU3YUtDU1M5akNCKzlScnRTSHBxc29H?=
 =?utf-8?B?dG16NHpRU1JGd3dsNnV4bHlTOFJSa1hRa1E1YWtXNXNJc0dKNGlNMk5RZEhj?=
 =?utf-8?B?V2JPQ3R5SUZrWDZDMVJwZHhOK2pzM0lxR1BDSk5EdkpuaVdQa2JJbTB1NG5W?=
 =?utf-8?B?bmFKakNPZHIxbk9yL2htd3pNaE43TXF4ZjhjTVFuV2xqa1U4ZWFsSklVSVBl?=
 =?utf-8?B?TnhSQzFjK2I0WlZaUVZCYWR2OVJvaDNFTUhuU3JCSmE3cU5OdGpMblV3MEJ3?=
 =?utf-8?B?cWVmK0grc2tZaTRWUWF1K3crMmxjaUxCS0ZWZGxFRHNNTC85N0xqM3VpdEw3?=
 =?utf-8?B?Q0F1b3U2S3VMamdabHZuek1rc1p5VEhCdGwzWDhLUUVUNXowdnBNZ0VEY1Zy?=
 =?utf-8?B?RXBETzdNQTRPUWRlSTBTVE5WbFVNcnQ3c2U1NXVIdzRPdVBmRVcxR0M3UEIz?=
 =?utf-8?B?REhjYTFlUndzelEvejlHWUFnMXltUkZmYUNrTFZmeFFQcXpuOWkrTWVNTTBT?=
 =?utf-8?B?NFBKSUlWTnF6QUx2b1FHWUdIeDU2bXNPaGJ2Vzc0eFQ4VFJ5bElRelpDeWxa?=
 =?utf-8?B?ZDVicTdObm5ncTRyZk04R0RQOHh1Tm4rNm0veTZoQnRqWmtZUzVtdmFNdHh5?=
 =?utf-8?B?a0d1UkdLNzRaMnhaNmVQQW02cEJ2V3N0Y3duL3dzcy9nK0JLM25teHptYW9T?=
 =?utf-8?B?UEdiOWNkR25RVGFJc1NKc09qTFNHVDdzZDcvY1g1OEVNM3o3NXloUG9URnJt?=
 =?utf-8?B?cG5HZTdUZUdhcWUxdG5zUnpSL0pjQU5MeFVybmpFTG5ET3JJYkZEOXpZZmF5?=
 =?utf-8?B?Z2hTSEdtUGNMMlJieEFDY1dtWXFpNWZmWVJ0aXU0ZkwwUHAycnRTWWFCMHNH?=
 =?utf-8?B?eWI2emFmTVBGdmY0QzdUTStzOXJ1bEEwQ0FXUHQrUE1nRFVNWXBoaHlNbE5R?=
 =?utf-8?B?eDhEUTFJcTNXcFY3WjNCMGxuWE9ObDM0MW1yQldtZFZFR3V0QTQvR1VOMnpM?=
 =?utf-8?B?R2g0VEkyTm11T2Y4OXdRdHVQL2xaZ1IyU3UwWnJRN25yelV0RVYrbEpwREtR?=
 =?utf-8?B?blNlck5YVnAzclpKeVp5dmM5V0xnYmhQalFRaW1JOWs4R0hzUWhnMFZtSUpn?=
 =?utf-8?B?TTk3SCtqZGcySEVkb1Ntb1BDSUFqYmUrc0RjUFNZLzJudHk0RHBDd25RZkNQ?=
 =?utf-8?B?Q1BaNEhZRFFhS0Y1dkI1TUpjS1FQcWpROTZOR0ZjdG1MV1hRT251alVRbE1F?=
 =?utf-8?B?T21tUTh2SkJHNk5xQUxLWGdiRHRCVDQ0WmZGd1c2ZmZFV1FXWmZZY0RsaXZT?=
 =?utf-8?Q?lrUX2HJZxZzMFbHvzdqbtWku8D9fx65tli8E5jIUKw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac27056-e76f-4196-961f-08d9bed88d2c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 08:05:54.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr/laM2gf2391lqf76QI+Q+ufSyZH1ijF025YSeXUQ0MlmiLVthb6ZfbpeH34ZTNwPwBEAka2SmgVYwX/o8ZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Still no response on this :-(

On 06/12/2021 09:55, Jon Hunter wrote:
> Will, Joerg, Rob,
> 
> On 08/11/2021 10:36, Mikko Perttunen wrote:
>> On 9/16/21 5:32 PM, Mikko Perttunen wrote:
>>> Hi all,
>>>
>>> ***
>>> New in v2:
>>>
>>> Added support for Tegra194
>>> Use standard iommu-map property instead of custom mechanism
>>> ***
>>>
>>> this series adds support for Host1x 'context isolation'. Since
>>> when programming engines through Host1x, userspace can program in
>>> any addresses it wants, we need some way to isolate the engines'
>>> memory spaces. Traditionally this has either been done imperfectly
>>> with a single shared IOMMU domain, or by copying and verifying the
>>> programming command stream at submit time (Host1x firewall).
>>>
>>> Since Tegra186 there is a privileged (only usable by kernel)
>>> Host1x opcode that allows setting the stream ID sent by the engine
>>> to the SMMU. So, by allocating a number of context banks and stream
>>> IDs for this purpose, and using this opcode at the beginning of
>>> each job, we can implement isolation. Due to the limited number of
>>> context banks only each process gets its own context, and not
>>> each channel.
>>>
>>> This feature also allows sharing engines among multiple VMs when
>>> used with Host1x's hardware virtualization support - up to 8 VMs
>>> can be configured with a subset of allowed stream IDs, enforced
>>> at hardware level.
>>>
>>> To implement this, this series adds a new host1x context bus, which
>>> will contain the 'struct device's corresponding to each context
>>> bank / stream ID, changes to device tree and SMMU code to allow
>>> registering the devices and using the bus, as well as the Host1x
>>> stream ID programming code and support in TegraDRM.
>>>
>>> Device tree bindings are not updated yet pending consensus that the
>>> proposed changes make sense.
>>>
>>> Thanks,
>>> Mikko
>>>
>>> Mikko Perttunen (8):
>>>    gpu: host1x: Add context bus
>>>    gpu: host1x: Add context device management code
>>>    gpu: host1x: Program context stream ID on submission
>>>    iommu/arm-smmu: Attach to host1x context device bus
>>>    arm64: tegra: Add Host1x context stream IDs on Tegra186+
>>>    drm/tegra: falcon: Set DMACTX field on DMA transactions
>>>    drm/tegra: vic: Implement get_streamid_offset
>>>    drm/tegra: Support context isolation
>>>
>>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi  |  12 ++
>>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi  |  12 ++
>>>   drivers/gpu/Makefile                      |   3 +-
>>>   drivers/gpu/drm/tegra/drm.h               |   2 +
>>>   drivers/gpu/drm/tegra/falcon.c            |   8 +
>>>   drivers/gpu/drm/tegra/falcon.h            |   1 +
>>>   drivers/gpu/drm/tegra/submit.c            |  13 ++
>>>   drivers/gpu/drm/tegra/uapi.c              |  34 ++++-
>>>   drivers/gpu/drm/tegra/vic.c               |  38 +++++
>>>   drivers/gpu/host1x/Kconfig                |   5 +
>>>   drivers/gpu/host1x/Makefile               |   2 +
>>>   drivers/gpu/host1x/context.c              | 174 ++++++++++++++++++++++
>>>   drivers/gpu/host1x/context.h              |  27 ++++
>>>   drivers/gpu/host1x/context_bus.c          |  31 ++++
>>>   drivers/gpu/host1x/dev.c                  |  12 +-
>>>   drivers/gpu/host1x/dev.h                  |   2 +
>>>   drivers/gpu/host1x/hw/channel_hw.c        |  52 ++++++-
>>>   drivers/gpu/host1x/hw/host1x06_hardware.h |  10 ++
>>>   drivers/gpu/host1x/hw/host1x07_hardware.h |  10 ++
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c     |  13 ++
>>>   include/linux/host1x.h                    |  21 +++
>>>   include/linux/host1x_context_bus.h        |  15 ++
>>>   22 files changed, 488 insertions(+), 9 deletions(-)
>>>   create mode 100644 drivers/gpu/host1x/context.c
>>>   create mode 100644 drivers/gpu/host1x/context.h
>>>   create mode 100644 drivers/gpu/host1x/context_bus.c
>>>   create mode 100644 include/linux/host1x_context_bus.h
>>>
>>
>> IOMMU/DT folks, any thoughts about this approach? The patches that are 
>> of interest outside of Host1x/TegraDRM specifics are patches 1, 2, 4, 
>> and 5.
> 
> 
> Any feedback on this?
> 
> Jon
> 

-- 
nvpublic
