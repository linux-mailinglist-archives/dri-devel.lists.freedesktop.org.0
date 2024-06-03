Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74348FA58F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 00:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B793F10E3F0;
	Mon,  3 Jun 2024 22:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=oppo.com header.i=@oppo.com header.b="ur2g7t4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2082.outbound.protection.outlook.com [40.107.255.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1510E149
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 17:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idvHuX358MpsPkIcOtjmop/fd2jzI2fNNxMhSTx7i1G0BrmigpJG+pYamRQFX5Ly3GI/kEs4J74g0S08vYI0l81G/CrreFKTRaZnF+rCSxvLye+O4xBLroftiFyz9BEF9CmnHHCbE+Bi2c9muL88sVsgm9VGOYnOO2GCMbcwOrXMAl4tzDJWfibHOqFyS+uduftbIsviE/zXmGh6DOZ4priX5KvaNRtHzj91X+mZkwBEETx66XKMgNfDtSb60/Bt+aq2Zpy+Nb7N9a0CLB41KNPOEkJ7cKBhD11V3MftDoPPXvBUoukYW7rVl30KRoyNr++923Eun9QXyiFlK9QZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8IQFPnM4F3yz329uWH6fg+C6coLIJSr27xrEvHGXFk=;
 b=k8AbVY1yPw1KJVPXhZLWmAnHgDgAV20XlzcERXm1TC6kYPQaWjDDuuxSGBjnYIcewiCGzy9t0BbSqoNMJXa2yoptePWGbHLlF1OQsac/kAKnWf1WesHVsILC5U6kpVsqvgKCtjh2lc72FavjWBHbvyxrVk69ylpFZFJ3uCGpaZiUCVtNjS6GDkeWBBpSdUvIIOIJ3OGIQ+GNiNLdIMoZ4+EwM3shQk0ywMp7NC1KiwRnwzO7UJP1Mbwp9GtDHkFXVvhPeR2EOmLvH5CpH8RnZybbLsQ63O1aKXTlLmQauKQtlxSCYc7hkZLVTDYGkYURyr6mrjETcYVNu3NuCvDnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=google.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8IQFPnM4F3yz329uWH6fg+C6coLIJSr27xrEvHGXFk=;
 b=ur2g7t4cJJocOVVxtVZuXc6wUpk55qZ4UTA5t/hZhBQGmklnO+FoO0mHHUvdFRKdLvMCQMT86dnn8wAXoQfVQOyICBo7/vwUo9NNMey8dWnmlqAWwIbKbWa3rwJ6HPx4AsCm7V5phq/jC1yKXkUZXWpXhGV4LpjZBm9MqOKmt88=
Received: from SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) by KL1PR02MB6627.apcprd02.prod.outlook.com
 (2603:1096:820:112::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 17:21:50 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:189:cafe::83) by SG2PR01CA0188.outlook.office365.com
 (2603:1096:4:189::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Mon, 3 Jun 2024 17:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 17:21:49 +0000
Received: from oppo.com (172.16.40.118) by mailappw31.adc.com (172.16.56.198)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Jun
 2024 01:21:49 +0800
Date: Tue, 4 Jun 2024 01:21:48 +0800
From: Hailong Liu <hailong.liu@oppo.com>
To: John Stultz <jstultz@google.com>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 "T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, <21cnbao@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
Message-ID: <20240603172148.gb7txpg2ya43jyxn@oppo.com>
References: <20240603114008.16235-1-hailong.liu@oppo.com>
 <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|KL1PR02MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: fee480b1-7dfa-449c-3053-08dc83f1a771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|7416005|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRxbStURit3bWU5VDA2MW15Vk1nbGtpYXJ0cEx2ZFIrWDNKaERwT1R1R0pJ?=
 =?utf-8?B?cDFjVWI1eXk0eDlGSmpzQm9HZlNmellXZmE1cVJvcnRTN05JRUZXMlQ0Z2xO?=
 =?utf-8?B?QnIrMWVKNTJNZ1ZKZjZvdzJhN0RMUU5YY0gydnNHWUV0Mm9kSGdqeHlwU0tH?=
 =?utf-8?B?TC9ZRnJFR1BOeUhmajVKVkl5S1BmQUxIQkRuMXNWR2dPeTYwb1pUZUN3MnBD?=
 =?utf-8?B?cjJUUFBvTEdvMlNjY3M4emMzckN0VVRyMyt3RjFmK2lIaVQxckFWKzJ6RVJu?=
 =?utf-8?B?Z2RWV2w3L0l6ZEt1MSt3WThGRHdZdDVQZkdhVVFjZm1SNEdSalYxajNxcERO?=
 =?utf-8?B?ZFJobW5UTzJxUVcwL3NGaWpZTS9Dc3RWeGhLTlcxOFNxUyt0cE96NWJqZVdh?=
 =?utf-8?B?dXVHaXhTNGljc0RvdUU4NkRPWXFRUTNlSGFDQkNIcjc2dllPNkt4c3p0c3J3?=
 =?utf-8?B?YkZsa0F2elN1a21ZNUpTOEV1dGJEaktDV0NPRmQ0cUhMRVRTallHT3V0TjYw?=
 =?utf-8?B?eGpQUnpHRXR0c0hPMEROTjgrZUhQUDhYU2hsNUY4MXBWd3J0K0c5ejlzMHhS?=
 =?utf-8?B?TG54OCtROVRBSm9wOW0vYTUvVFlzeFQzNjNuNkFTSmNSSVdGc0ZwSjhDZlBX?=
 =?utf-8?B?bHYxbC9BMkl2dUtoc3k5NFJZVFIxRHoxS3lUSVc2N1ZtOHdEZDUvdFVtTHc4?=
 =?utf-8?B?d0xKL0VvdlNyRzExTVFzVzN1OXBTdWJUV3NPTi9Ka3d3Q3g0YUJ2dTlMSmIy?=
 =?utf-8?B?aVI5MnhuS1pPWnYrV2ZLaCs2bWk0OEh4d2hvdTR1Q0hyZ05ORW96WElPZVIv?=
 =?utf-8?B?My9lRnQ1czhBRTNxZXpaRE1nTER3WXdjenFPR1JPRUd4ck4wVHV5OVRwZzc1?=
 =?utf-8?B?ZENjdzJwdnU4VVEvQ3MzTWZxZUYvZndmdklzaXdScmROdTlRSEo4VVZYUkFO?=
 =?utf-8?B?cjRHQWFDZitiM21WSnRBbW1EWnU3VVhyU3dTSFVjeUEwd2lFN1RHNi9WWTQr?=
 =?utf-8?B?dlNIbUFFTW5PMDYrVHo1NDJtRzI5b2FicHVCbnNaRHlDbXpWUmx4aWZoeDVG?=
 =?utf-8?B?c2FMbHlwUXRFTTNXUG1ycitQVTlXMjR0aEd4SEY5WThZNjVhMDE5U0FYYWJy?=
 =?utf-8?B?Tjd1WVphTW5tdDBjYktKKzRycGlQSm5RUy9GbnlTdUl4dWZDbEpqV2lmNEFa?=
 =?utf-8?B?VEduZit3MzhIbGk1Nk5JeVVEL1N6eVk2OGFFODdRalAvSUhpVkdub0NmSml2?=
 =?utf-8?B?S2I5NzFYNUkzaVVRV3hXNDJJSjlhN3BaMFM1OXM0UWczZjBRZ2tqSVRYOEtH?=
 =?utf-8?B?clpzZmJ6WE9PbjkyY3NiTmpNSHpvc0hBQnQ5VWlXLzcwZU9hWERVY3dOSFlS?=
 =?utf-8?B?Qko5ckpKYW9pdDE2VlJLaG4yZG5kTU9HejBOU2Z3dUpZS2hjOEJ5VGhKcG5u?=
 =?utf-8?B?RDdrOWtvV3g5TzVSdS9GRWFjRkVkcC9URVAwMEh0M0JwenZPeUo5T2p0ZmhY?=
 =?utf-8?B?UlNtaC9peUZtOE1VVDlHK0ZZUndONXd1dkUrTFRTU3hsakE0SS9tNWxTL2E5?=
 =?utf-8?B?eVh4TVF5Zy80eHNqeDdQT3kyYTlyd21XOWM0Nyt0VHRQMndzY1JxMXZmTEwx?=
 =?utf-8?B?M1JjUTFOQXJpUGxNTW1oSE14SW40cEJCVTBnQ2JlbjA3c2hsSmxlVkZ3aElG?=
 =?utf-8?B?ajV4T2JJNTlPdzhNRE0zWHBHdStPNlplTDdpMzU1L0RYaFZVRGk4Sm1sSHB6?=
 =?utf-8?B?eklqL1lmZk53SXFqUkd6MGJxT1pQSWQ4dVRabXNBTzNFUVBwaTdGYjdkbGRF?=
 =?utf-8?B?Nm1yQThTT3hJVmxYUTZ6enprV0g5c1JEZ2drVFFBYTcrSTdnS1k2Y3dhVUxC?=
 =?utf-8?Q?ThFJOzIK539Vo?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(7416005)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 17:21:49.8244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fee480b1-7dfa-449c-3053-08dc83f1a771
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6627
X-Mailman-Approved-At: Mon, 03 Jun 2024 22:31:24 +0000
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

On Mon, 03. Jun 09:01, John Stultz wrote:
> On Mon, Jun 3, 2024 at 4:40 AM <hailong.liu@oppo.com> wrote:
> >
> > From: "Hailong.Liu" <hailong.liu@oppo.com>
> >
> > This help module use heap_flags to determine the type of dma-buf,
> > so that some mechanisms can be used to speed up allocation, such as
> > memory_pool, to optimize the allocation time of dma-buf.
>
> This feels like it's trying to introduce heap specific flags, but
> doesn't introduce any details about what those flags might be?
>
> This seems like it would re-allow the old opaque vendor specific heap
> flags that we saw in the ION days, which was problematic as different
> userspaces would use the same interface with potentially colliding
> heap flags with different meanings. Resulting in no way to properly
> move to an upstream solution.
>
> With the dma-heaps interface, we're trying to make sure it is well
> defined. One can register a number of heaps with different behaviors,
> and the heap name is used to differentiate the behavior. Any flags
> introduced will need to be well defined and behaviorally consistent
> between heaps. That way when an upstream solution lands, if necessary
> we can provide backwards compatibility via symlinks.
>
> So I don't think this is a good direction to go for dma-heaps.
>
> It would be better if you were able to clarify what flag requirements
> you need, so we can better understand how they might apply to other
> heaps, and see if it was something we would want to define as a flag
> (see the discussion here for similar thoughts:
> https://lore.kernel.org/lkml/CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com/
> )
>
> But if your vendor heap really needs some sort of flags argument that
> you can't generalize, you can always implement your own dmabuf
> exporter driver with whatever ioctl interface you'd prefer.

Thanks for your reply. Let’s continue our discussion here instead
of on android-review. We aim to enhance memory allocation on each
all heaps. Your pointer towards heap_flags used in /dev/ion for heap
identification was helpful.

We now aim to improve priority dma-buf allocation. Consider android
animations scene:

when device is in low memory, Allocating dma-buf as animation
buffers enter direct_reclaimation, longer allocation time result in a
laggy UI. But if we know the usage of the dma-buf, we can use some
mechanisms to boost, e.g. animation-memory-pool.

However, dma-buf usage identification becomes a challenge. A potential
solution could be heap_flags. the use of heap_flags seems ugly and
contrary to the intended design as you said, How aboult extending
dma_heap_allocation_data as follows?

struct dma_heap_allocation_data {
	__u64 len;
	__u32 fd;
	__u32 fd_flags;
	__u64 heap_flags;
	__u64 buf_flags: // buf usage
};

Do you have any better suggestion?

>
> thanks
> -john

--

Best Regards,
Hailong.
