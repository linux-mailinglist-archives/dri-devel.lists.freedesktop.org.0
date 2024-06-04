Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635C8FAACF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 08:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEB410E428;
	Tue,  4 Jun 2024 06:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=oppo.com header.i=@oppo.com header.b="eRGmsJZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070.outbound.protection.outlook.com [40.107.215.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B62A10E428
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 06:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVkkoCryysiGlg6bh5DWIcuFLsJz6eEHrXzNiwElP3FGa5Xg8u0gX9a5Ygpy9UaeKxvlaX2TBNKc8E2OT+FJ99SNUKIx4+t9k08P8Kk76qEhRbq2vUT6aWyzHkb9a1e3sQVey7cIvbEwCCBg2SVQAt5AAmiAbMtpW7DqOi82EXwzZbIDLDC97+sKEtcMmy8rGLKqYVCtummoZpQ7WntcpK/pDKSxM9CHzGCUqy7/xf0OVpNHtDyjDI0j8Hjv+Dfdpsj2hQyD2DlcWBktfC/fPoErHL0gBGn1Q8TQIB3OZ29jylmtbt/CfuEQLcjRQOm9dKpId0dQRBXs4OwU/O05vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6mocaiFbUti81GdwyW9uAFSeKItB+OxSg0cMJZvewA=;
 b=LsR4jdJzkw46jJutB7fuCQvlvJZn9JzP/5LwR4sEhlGQt12kCcFhPDDRisxhFm68X5QZZ/jux2tqwyDdPgmxMotr71/T9A22fCBzrZJ2vi0sIbcV6tQvByZRiiTafOj2GqAQlhlmFvrQsVQWTlRr895D3RQM3Mz9o8J12scbMCBNxmtrglUU7gjhhPattiQU8f/lWyJBzZ9YPSTV4+y/3NMOJWc8kctcxiBiVZa/9dDch72NusoEx1RjZoeL5QeTNbkneijyOg1ox2JSG5VBwoVLSkFkISQk7GWjco3D7EtW9nnMqSXXn/42va68TI4Jsgmy4tDNmhdIoVME4jrfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=google.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6mocaiFbUti81GdwyW9uAFSeKItB+OxSg0cMJZvewA=;
 b=eRGmsJZCnWn0Do0qSkCkVuvvcefOsUjsattPom5QWMnwS+6FX4ny4GoSA5Jf3CDXeu7bEvf69W6BXxqZxK8hOMCYr7X+6iLpRMJMFmg+jkmadRSv5kIMC26pmqXEWQyb9Hk1fYTOREcPRKOGga1ReKPSpnfOHnc4fOggbEU+sdw=
Received: from SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17) by
 KL1PR02MB7310.apcprd02.prod.outlook.com (2603:1096:820:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 06:30:26 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::96) by SG2P153CA0030.outlook.office365.com
 (2603:1096:4:c7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.5 via Frontend
 Transport; Tue, 4 Jun 2024 06:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 06:30:25 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Jun
 2024 14:30:24 +0800
Message-ID: <cff79c75-4c9c-46e0-a3ac-b9c0e8cad6f0@oppo.com>
Date: Tue, 4 Jun 2024 14:30:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: John Stultz <jstultz@google.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <21cnbao@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20240603114008.16235-1-hailong.liu@oppo.com>
 <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
 <20240603172148.gb7txpg2ya43jyxn@oppo.com>
 <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
Content-Language: en-US
From: Hailong Liu <hailong.liu@oppo.com>
In-Reply-To: <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|KL1PR02MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0853c1-991d-4d2b-5aca-08dc845fd206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004|7416005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjJZWGpla0VCNGZWc3hLb3BxRFVKNURWOWsrdExpK2V3eks0RUVGZmVycGNQ?=
 =?utf-8?B?YVh4dUVXK1Q3cElTWE1aUzF0U0tmUlFLNWtSYU1OMTNTL3JzQzlSMXFja3ln?=
 =?utf-8?B?aEl5d3o0YnJISXR1bC9aSFZYdzVQKzRGT1JWdWh2Z3lMNVhrZFB1dTVEWGhY?=
 =?utf-8?B?dmRVcC9qZVFYdEJNQWxNYmIxNUhSWEhCVGNnOXpCQVMrbjhUeXBPU1VxeW9Q?=
 =?utf-8?B?YTdpQUtvdXo0MmgyaVc5Z0I1SkcvYU02VjFaaWkzenJDdmpkTnVtSGdVbXFW?=
 =?utf-8?B?Y1RtcGxsejhFTUFBMDMxcnhUQkYxN0R5NExwMzJuSVRQZ1ozMGk5SzNmVVRh?=
 =?utf-8?B?bXVkMDkwNDdjOU5lRGp3MlFZU1hGQTR1N1FHa3hwM2tNbCtuRm5SOUwva1Zj?=
 =?utf-8?B?UkIvVkdaUVFFN0xOeDkyMDR2d3dYRzRNdUg2cEw0V29SWXErRmNuUSt2OTFF?=
 =?utf-8?B?T3JsbkluaHJpQ1hWcnh6Rk1yNjRGK0RxR1hRTUprR0ppRTU1TU91RVNMQ3d1?=
 =?utf-8?B?b2NPY2gxdEd1ZGJiQ2E0bjFoN0tLV09wbFdtTEp5cENINkJYcFE1M3Z3NkhK?=
 =?utf-8?B?Y0RHaE94dWNTc3RMT0RNMkk3Q0RrTUtWaXpwK2xEd0tjNDI3dGF2Y3MwNzJN?=
 =?utf-8?B?MS9lcmhNWUFyYzRvdERQM2tqU2tLb0c3TXVueXRMZGlLcGY5ZE14VVluaXBR?=
 =?utf-8?B?azRvUDAxSHBpeHkwY1Y2UmlSK0FCZ29GeXF2NGVCb2p4anlWYitQcFhDZWor?=
 =?utf-8?B?MXA2SnozYUVCWmoydmFCU2pOTkk5K3M3S3NrQlljZS9LUFZ5VHZUeHhlYnp6?=
 =?utf-8?B?ZzhyNjNQUnNnZzVmWnlER2c5WHllRlY2RHpwbERvalJDTFJtamRRQjVEMlFX?=
 =?utf-8?B?eHhyUnUzWWFpeFRBdFFFbHpPcGtZMGVoV3d2dVVGN0RKN3dCR0NCOENBa1JH?=
 =?utf-8?B?aWg0Q29hSWtxTzdueDlURGhmbThKN3hKMVMwUEY4Y2NKSlBwNFpIVEl3d29v?=
 =?utf-8?B?WFJ3cE5JdjFsUlZMWndIYkpxVFZkYnNhQTBvcHdpSFhkTlIxOFl1d0UzTzhi?=
 =?utf-8?B?aUdGSHRJeUQwSjNmTXh2WHgyVkUzZ1dMRzlsVDZXQkl4NmdZM0xzaUJESEdt?=
 =?utf-8?B?c1NMV1dBVGwxWVZJQmhjbko0eGpmbHU4OXo0TlR1SHNrTDBxTkJZTVF1TEx2?=
 =?utf-8?B?MUN4VEdJd0RQMEtaN3N3a3JabVVkZGZMVCtxVzlBZW5aNlJLcTcxc090c3lj?=
 =?utf-8?B?QWlUVTgyMDRvb0hpK1EzM3VQeFlQOXhLR1E3YlJLekRSMUR2VGM4aG92VTdW?=
 =?utf-8?B?QmVGWlJqbUJvU0FDcmpVaS9abktZRVFQNUx2S3pSUHE3S2lQVFdUaXhGWE9U?=
 =?utf-8?B?R0FrQURKYmZ2cFM4aFhSdGF6akcxVG5zVU1DRk5HcnZHN0ZuY2o4Um55OFZk?=
 =?utf-8?B?Njd6eXFXbkp0ODQ0bW5WUUhwNWdIUkJzaVVkemxGdTBSMlJ2YjcvUkt0UEY0?=
 =?utf-8?B?bjhnYVk4d0RPMUtBR29leUc5SkdGQTBOcGx4VTlHaHZiQ0g2bXRaRHJaNWd5?=
 =?utf-8?B?TGRpOU1QMkVLSGdEUmppZW1NMHNRRWNQK3hHT0pXelI1RjV0d29aSnh3NHJL?=
 =?utf-8?B?dnIrK1ZzS3Q5L04xcmVtNTNHQVIva3BNb1E0NGpkOGx1THRXaDdUQW9kZm5T?=
 =?utf-8?B?MEtqcmt6QWZ1SkF6TXJHTWhQSjR1cGVTNUlLbzJBMVNuZy8xcFR0YUhtejdO?=
 =?utf-8?B?NU9DTG4xcEcwKzA2UXF2bGxVanRzR3NkaWw0Z0g3Q1U2ZEJpaEpia3F3QWRK?=
 =?utf-8?B?NEpqZjBTYTk4Wk5rcWFPaVFldU5HSnZKaDFhTW1DZm1BSnJORWxjSWp2SHh6?=
 =?utf-8?Q?6dBXDblZwOSvN?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004)(7416005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 06:30:25.8596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0853c1-991d-4d2b-5aca-08dc845fd206
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7310
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

On 6/4/2024 2:06 AM, John Stultz wrote:
> On Mon, Jun 3, 2024 at 10:21 AM Hailong Liu <hailong.liu@oppo.com> wrote:
>> On Mon, 03. Jun 09:01, John Stultz wrote:
>>> On Mon, Jun 3, 2024 at 4:40 AM <hailong.liu@oppo.com> wrote:
>>>>
>>>> From: "Hailong.Liu" <hailong.liu@oppo.com>
>>>>
>>>> This help module use heap_flags to determine the type of dma-buf,
>>>> so that some mechanisms can be used to speed up allocation, such as
>>>> memory_pool, to optimize the allocation time of dma-buf.
>>>
>>> This feels like it's trying to introduce heap specific flags, but
>>> doesn't introduce any details about what those flags might be?
>>>
>>> This seems like it would re-allow the old opaque vendor specific heap
>>> flags that we saw in the ION days, which was problematic as different
>>> userspaces would use the same interface with potentially colliding
>>> heap flags with different meanings. Resulting in no way to properly
>>> move to an upstream solution.
>>>
>>> With the dma-heaps interface, we're trying to make sure it is well
>>> defined. One can register a number of heaps with different behaviors,
>>> and the heap name is used to differentiate the behavior. Any flags
>>> introduced will need to be well defined and behaviorally consistent
>>> between heaps. That way when an upstream solution lands, if necessary
>>> we can provide backwards compatibility via symlinks.
>>>
>>> So I don't think this is a good direction to go for dma-heaps.
>>>
>>> It would be better if you were able to clarify what flag requirements
>>> you need, so we can better understand how they might apply to other
>>> heaps, and see if it was something we would want to define as a flag
>>> (see the discussion here for similar thoughts:
>>> https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com/
>>> )
>>>
>>> But if your vendor heap really needs some sort of flags argument that
>>> you can't generalize, you can always implement your own dmabuf
>>> exporter driver with whatever ioctl interface you'd prefer.
>>
>> Thanks for your reply. Let’s continue our discussion here instead
>> of on android-review. We aim to enhance memory allocation on each
>> all heaps. Your pointer towards heap_flags used in /dev/ion for heap
>> identification was helpful.
>>
>> We now aim to improve priority dma-buf allocation. Consider android
>> animations scene:
>>
>> when device is in low memory, Allocating dma-buf as animation
>> buffers enter direct_reclaimation, longer allocation time result in a
>> laggy UI. But if we know the usage of the dma-buf, we can use some
>> mechanisms to boost, e.g. animation-memory-pool.
> 
> Can you generalize this a bit further? When would userland know to use
> this new flag?
> If it is aware, would it make sense to just use a separate heap name instead?
> 
> (Also: These other mechanisms you mention should probably also be
> submitted upstream, however for upstream there's also the requirement
> that we have open users and are not just enabling proprietary blob
> userspace, which makes any changes to dma-buf heaps for out of tree
> code quite difficult)
> 
>> However, dma-buf usage identification becomes a challenge. A potential
>> solution could be heap_flags. the use of heap_flags seems ugly and
>> contrary to the intended design as you said, How aboult extending
>> dma_heap_allocation_data as follows?
>>
>> struct dma_heap_allocation_data {
>>         __u64 len;
>>         __u32 fd;
>>         __u32 fd_flags;
>>         __u64 heap_flags;
>>         __u64 buf_flags: // buf usage
>> };
> 
> This would affect the ABI (forcing a new ioctl number).  And it's
> unclear what flags you envision as buffer specific (rather than heap
> specific as this patch suggested).
> 
> I think we need more details about the specific problem you're seeing
> and trying to resolve.
This patch mainly focuses on optimization for Android scenarios. Let’s 
discuss it on the issue website.
Bug: 344501512

Brs,
Hailong.

> 
> thanks
> -john

