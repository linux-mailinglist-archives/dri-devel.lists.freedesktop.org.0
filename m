Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C74693D3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D553C7AF77;
	Mon,  6 Dec 2021 10:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB073CA6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 09:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBkYViaiGnbDzfoTvkz7SrsvEsiPoXjYqNkVqLkOdf18b/rYFPzDs8WlQXYj7SrErRpi8OlaYilCPZjrvgnCgK/OdpRBTQA8/KVFqkfrBJBGsO9ceeQgYYEBitHlVzERSxbU6uzlfCZnzjL5uH0WJEifBgn9OVqW7PUIl+b2ABFHocME7Wu/bskR6i0waxW79fgnYVu6FYEnnyDq3LcI7egMxo+mmnDvxkDx9lODq0JlRvtqLlNyDGvoO4pZv9TQq6j2vTvr7TDmZFOFR07mBhipt8NLJC4YcpHbZ0liNZ+WBMzA64vHx9gCLv5nLa3u/OYHWxNFdE8j63qoiuNozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QTjCuoHORsIaYoDA38EAYujltYQA5bCxi4W2CzFP50=;
 b=gM6MCu7eplmoNDBHzJQU9YB7JmFd89URusbcDPqxusDFzNlIIBIurAtE2++Kl5iwprPdtYxC6SqKnYdQ2Ey+k6hAKdWL2ppON+XoaOf//F+yP2Um9NI/1o/giKx+UWXuLy/qxnGVkwPM7N17y5po+kEKad3xSQ3d0QwGJUaMjBAsaw1ePQIQs94PJNQulduYKoddsVAPfwv2KpdJk3uTQJbD7tdyzhPMqproKO1mbtNXRdZwaBIhzwyRxo/ExRtg8rl0CtjKRE08P41sEjh1apTrnxbwuSjRVAviLyrvOBifFym/u1i2MGledAAhkR5UUHkh8Ue0K8wGU9j4tv+Uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QTjCuoHORsIaYoDA38EAYujltYQA5bCxi4W2CzFP50=;
 b=kNps0xHo7R2Nd4LFsEgK08J0qS+VhJ3lCoCgzgTr/V4gG81Pe198IbRRxtRcKAp9o34pYnSgq5xZ63TsLGLgxZ2+cLPIAa6lQdBx7Ex4hzprJl+kz12D9tUIy0L1CeXW/jqrqnUzJ8xZAPPYOZEkxlk4t53w0ctRU8TWDiBaNa1BQtxgsjEaaniiTcRFRrNR+O63wqXpQ9e0yhmSyK51EmLoP7045Bt1QV5sH2WdT74LNPLInZbPMJp05Tr9YRsEvM1Xx/xsd6DugX58RKf2igq4jQ4GkCLvNG8zCuSTymB9LZ4FkMZjkjvPNEOf1JN/D5iCXZJS280Hi5HQGF2Dvw==
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5457.namprd12.prod.outlook.com (2603:10b6:5:355::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Mon, 6 Dec 2021 09:55:19 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 09:55:19 +0000
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
 <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c382fb0e-6b73-5ca0-7f63-d2843351325e@nvidia.com>
Date: Mon, 6 Dec 2021 09:55:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0283.eurprd07.prod.outlook.com
 (2603:10a6:800:130::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [10.26.49.14] (195.110.77.193) by
 VI1PR07CA0283.eurprd07.prod.outlook.com (2603:10a6:800:130::11) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 09:55:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0ed521c-f8a8-4317-5592-08d9b89e82d6
X-MS-TrafficTypeDiagnostic: CO6PR12MB5457:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54574CC72F3FB1535F0CB7BCD96D9@CO6PR12MB5457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUdvvjnWnYGJffYlgouwPVkuIeReDOsiQXuDRXHyDW93Idoj5O7JFMW8jZ0Eod23MRcVoD1j1J6K+PZliJHpune8Q6Ihegjcx5GXx9KGW5Sc0h++tbaKLKAUdU21aF4SuevjLEGbZT8/sab/lRvCcndxl6HgUcvEWQiIgZID5Ah1D5AijrViOGUx/hQn2CxEwiP0AOwutxYpMVj74VciW49gx1gTToRvW1ZGGSThnb30PamEuKH9ucsVqYXElZBrhbxLdbOu2Aj8JdtP13zcpYJLFcR25KQbIo4bO0OHL/S4Iqxx8pvSY+6aRvVIyT+erYroCAXRyG7+OqGLemr48ExK3tN9JkNQQNWY0IPVxpPtl+ItRkNXQ9z5SOUTAuCGEHJ/O8VU8Yr61Pf1JqZn/xhpToQy5UIYQo/StibPiKWEAXc9CEFfvL+zaSFzQ0xW0aZj3kD2Y0vsFjv1KFkWh7gzl76ciHfi4YTv9UvW92b70LyprstAOgoRSKTSQzYnXeTe577x7UJUhMiR7zh7cWyzZYhfds4RoAS75g0QtGNTluNmAFM5Lq5yqrVsih2kiBeaw1scWZ0YrfhK7q8Xsc36UzY7v/0q9VfoO746rGZeqXnryfZUz01LL0EL0tC8WeAQDIepMusoEboNmlWjX3ihKV3GeWRChDovOQ64p1oq33+Fobl430I9Ffw4JGSl1QDZ7mTxuKQSPheM9YFYELQzPkkyuA573GUOvgrgGQgBAVNadux8CC6jKXhvgHgxyvwppWFHkC0hzDGdj3/aHhBGXs8nNP7ouurQWGPO69g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66946007)(83380400001)(38100700002)(6486002)(956004)(2906002)(36756003)(508600001)(2616005)(31686004)(66556008)(31696002)(8936002)(66476007)(8676002)(55236004)(316002)(4326008)(16576012)(7416002)(54906003)(53546011)(6666004)(26005)(186003)(5660300002)(32563001)(45980500001)(43740500002)(357404004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9PZ3IvNXBnUVdVcG11NXRZYnFWeXZCT01QSUVadFBlVUZhZ0dEcGJVY3ho?=
 =?utf-8?B?NDJHSURJVzZjKythK04xcVNoNGtHVFdiMUkxTkhWQkFzS1FGOGdRc3BnOFhT?=
 =?utf-8?B?R2xENmVSQURhYm1VVkdqcVFaV2hXMVRMck1xejFCK2FjeXlzQStGdnNPcjIr?=
 =?utf-8?B?V0RlYXMrazVsZ0FnRm9WenA3NkZZKzl2WGVKRFAvZGVQNXVxK2JPVzVVYVlv?=
 =?utf-8?B?TmhaY1dWQXBCNGFtWEZyZk9DUEJSNk04NUJlTGQ0K3FaUUxTWFBWKzQ5N0xj?=
 =?utf-8?B?N21CZ3FmcWxHQWp6Wkw2SkJZUGZzdFMrMWxxamx4VUEwTjcxZWkyV2ZFL1hT?=
 =?utf-8?B?T3dIYkE1YTVDODZiL1pJc2VsYUd5RTc3MkZHdSs3NDRxMVNnazRySnJ2UzN3?=
 =?utf-8?B?bnhwY3I3ZXRkUzhFUi9JQWdxYS8xcCtvL0lxMWxNK0NJdEozS1M4YU9QeGgx?=
 =?utf-8?B?eHJIY2w5SlJUbzM0bE1lOWZKOVBFV0hFN0IwV05tZkZXQkJINlVndW5zeFdr?=
 =?utf-8?B?VmhnbFl2V2lMejVqR2J0aFdkY3ZZL0EwbjVkQ2dtdkROVExJbTM5L3RTSzZL?=
 =?utf-8?B?MExJWUowdmxpeExDd3VnUVY4SXlydlRqREpNdUZrbVg1L05rTUtnRXRONjQz?=
 =?utf-8?B?SnJqMGdsVEFkRTVmVHJSQmpRS1dlMzkxTmF2a0pFVjQ5L3JCU2hNRjZwUEZJ?=
 =?utf-8?B?NFFXT0p5K0RGb08yZmtZeWR5Y0hweW95ZTh4eGFSVkRaVDNPaTR4VnlPd3dW?=
 =?utf-8?B?cGlObjl3U1BCOSs1QUlOZHdBY2NSdlVvbGh6bC9FTFdEYmZDdisyMjlqaXd2?=
 =?utf-8?B?UmdkeTFMSksyYlpkN0J6cG9WVURuK21tNzY5L2FQUWs1am9qTW1EMXVuZnQ3?=
 =?utf-8?B?MEFvUXlwN3pMUWNmZ29Rc2RFaFc0MHF0OVRDN1hGNEpSVU5zaXlxQVZYVXJp?=
 =?utf-8?B?bUtDUWJRSDV6R2ltWVhxK2F2VDdzcjJVQUpnR3RGMm0vOFMxTWJyTmQvRTU1?=
 =?utf-8?B?Wnk3ck9pWEZQTjc4ZUpydGhYVWJLalRGSWRHYzN5OTJrTEd1T0tLUUl3Skpj?=
 =?utf-8?B?akRaQXNZdnQ1MWFWZ2JPUEhHcm5JV3NuL2J2VjMrQStiZ0J2TG5aZFplamFH?=
 =?utf-8?B?M3hMWjl2ZlpKSW10aEZhaG1XZG5jM21mNldscTUvbXNGaldJL3hJVUh1aGJk?=
 =?utf-8?B?UWx5V3VMbzVtVW9CT3BaU0xwbjlxeGYrenBQK0hiV3V0c3dlMU1NbHRWK2VW?=
 =?utf-8?B?UUdJSnBhT01YUzBrM3FoN3RVRThEMFZSeUNJQXFtR0RKbXdRSFNGVDFLQm55?=
 =?utf-8?B?TWVENURLUGVYdkhVOEdXZ1pvdk5HcHJCaWs4c3cxelhmS2duZDM5bG1USVFR?=
 =?utf-8?B?VkVGQWVvYlJreUhlYzNMMUJrNko1dmlxY3A3eGdES3JHbC9zczVZQXkwRDAw?=
 =?utf-8?B?WjlEenoySTN6TzBEcG9KcnhtUXllT3E3WGZ6VXByM1NuT1pUdzVhUGYyZ3lh?=
 =?utf-8?B?VmNVNFF6dGF4UEdhYnhuemNFNVJob0piTVJpOW4waldPaEp4WkNMWVZnQ0pL?=
 =?utf-8?B?Vzk0aFZTNytoOU1tNFpMNjJBOUNNRUw4OVliRHQ3Z1YzK001MUlvMHZ5bU5E?=
 =?utf-8?B?SGxwa21tRDNVcWwxdHc4cWN2U25BcCsyRk1mVkJkeTRyMlg2NXJFcXlQaHpO?=
 =?utf-8?B?dkRPTmhDakFvUStRSHptUnprbXNDNTc3RVVCa1dqVnFPVmxub0h5Qm1Mb1JB?=
 =?utf-8?B?dHlNTFFWTTJIb3JydlJJVnR6L0w1VlJhUDFVbG1nVFovQzY2UU5yUVJJSFhR?=
 =?utf-8?B?ZXpHZ2V1ZFZwRVAvamtLNHhCaFRkMEdlOEhWd1czM1Bkd3FDcFRqZ0hUQ09Y?=
 =?utf-8?B?K1ZqUnJ1M3BTV2UyYnUyUmJ6VFZmY2d3RmN5R0VvRWU3S1YvaEZ6QkVhN2M5?=
 =?utf-8?B?bE5jaVVlZXRWS1JlME1SWXNnMllxdk5NR3ZORHBiWGRYQW5GNGpYOFdkZjEx?=
 =?utf-8?B?VjRDWCtybFBvb0NZd2g1ZUUydVVwSlByNk1wTkIrYitROFYzTzA4RFN0ZXU5?=
 =?utf-8?B?SldPNW5Cb0g0QzBJcm5XcXQxNjlnSzFqY2VtOEtocllaQUgrOVplN2o5UVNJ?=
 =?utf-8?B?S3U3SitLbmhBREZPU2Y3YjJLeTloUHUxYmlpL1FkVFd6NSt2VXpiVFZoZHpm?=
 =?utf-8?Q?1eOwKwSPgfVsGBwiSiVZrUY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ed521c-f8a8-4317-5592-08d9b89e82d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 09:55:19.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtbvDo+wjHKJEbk0XCITUl8jRFiKTRxRc4W2iGvLHnK5ZsJeRkJuZSaDuKNjDN51+Ci8q055zizRrUQIdtuzGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5457
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

Will, Joerg, Rob,

On 08/11/2021 10:36, Mikko Perttunen wrote:
> On 9/16/21 5:32 PM, Mikko Perttunen wrote:
>> Hi all,
>>
>> ***
>> New in v2:
>>
>> Added support for Tegra194
>> Use standard iommu-map property instead of custom mechanism
>> ***
>>
>> this series adds support for Host1x 'context isolation'. Since
>> when programming engines through Host1x, userspace can program in
>> any addresses it wants, we need some way to isolate the engines'
>> memory spaces. Traditionally this has either been done imperfectly
>> with a single shared IOMMU domain, or by copying and verifying the
>> programming command stream at submit time (Host1x firewall).
>>
>> Since Tegra186 there is a privileged (only usable by kernel)
>> Host1x opcode that allows setting the stream ID sent by the engine
>> to the SMMU. So, by allocating a number of context banks and stream
>> IDs for this purpose, and using this opcode at the beginning of
>> each job, we can implement isolation. Due to the limited number of
>> context banks only each process gets its own context, and not
>> each channel.
>>
>> This feature also allows sharing engines among multiple VMs when
>> used with Host1x's hardware virtualization support - up to 8 VMs
>> can be configured with a subset of allowed stream IDs, enforced
>> at hardware level.
>>
>> To implement this, this series adds a new host1x context bus, which
>> will contain the 'struct device's corresponding to each context
>> bank / stream ID, changes to device tree and SMMU code to allow
>> registering the devices and using the bus, as well as the Host1x
>> stream ID programming code and support in TegraDRM.
>>
>> Device tree bindings are not updated yet pending consensus that the
>> proposed changes make sense.
>>
>> Thanks,
>> Mikko
>>
>> Mikko Perttunen (8):
>>    gpu: host1x: Add context bus
>>    gpu: host1x: Add context device management code
>>    gpu: host1x: Program context stream ID on submission
>>    iommu/arm-smmu: Attach to host1x context device bus
>>    arm64: tegra: Add Host1x context stream IDs on Tegra186+
>>    drm/tegra: falcon: Set DMACTX field on DMA transactions
>>    drm/tegra: vic: Implement get_streamid_offset
>>    drm/tegra: Support context isolation
>>
>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi  |  12 ++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi  |  12 ++
>>   drivers/gpu/Makefile                      |   3 +-
>>   drivers/gpu/drm/tegra/drm.h               |   2 +
>>   drivers/gpu/drm/tegra/falcon.c            |   8 +
>>   drivers/gpu/drm/tegra/falcon.h            |   1 +
>>   drivers/gpu/drm/tegra/submit.c            |  13 ++
>>   drivers/gpu/drm/tegra/uapi.c              |  34 ++++-
>>   drivers/gpu/drm/tegra/vic.c               |  38 +++++
>>   drivers/gpu/host1x/Kconfig                |   5 +
>>   drivers/gpu/host1x/Makefile               |   2 +
>>   drivers/gpu/host1x/context.c              | 174 ++++++++++++++++++++++
>>   drivers/gpu/host1x/context.h              |  27 ++++
>>   drivers/gpu/host1x/context_bus.c          |  31 ++++
>>   drivers/gpu/host1x/dev.c                  |  12 +-
>>   drivers/gpu/host1x/dev.h                  |   2 +
>>   drivers/gpu/host1x/hw/channel_hw.c        |  52 ++++++-
>>   drivers/gpu/host1x/hw/host1x06_hardware.h |  10 ++
>>   drivers/gpu/host1x/hw/host1x07_hardware.h |  10 ++
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c     |  13 ++
>>   include/linux/host1x.h                    |  21 +++
>>   include/linux/host1x_context_bus.h        |  15 ++
>>   22 files changed, 488 insertions(+), 9 deletions(-)
>>   create mode 100644 drivers/gpu/host1x/context.c
>>   create mode 100644 drivers/gpu/host1x/context.h
>>   create mode 100644 drivers/gpu/host1x/context_bus.c
>>   create mode 100644 include/linux/host1x_context_bus.h
>>
> 
> IOMMU/DT folks, any thoughts about this approach? The patches that are 
> of interest outside of Host1x/TegraDRM specifics are patches 1, 2, 4, 
> and 5.


Any feedback on this?

Jon

-- 
nvpublic
