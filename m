Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG7wLzxvfGk/MgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:43:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E5BB8942
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1C410E987;
	Fri, 30 Jan 2026 08:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H4anQtYd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013010.outbound.protection.outlook.com
 [40.107.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4263810E978;
 Fri, 30 Jan 2026 08:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bemdg7W/706MR7KQKM7j0Ceg4MdndN1GIHl7/mGA1Y5t+PF+Fp0b2beS6dQIzcEEZGs++SYY1HF5CCVDxRGC6zr7ohlmWfq1S51Zw7OxebaZq+KGSCIGUAr6YiWAGoKKn130OqsVXw5ky3gYg4sQHA+4+mhICbdRT0YMcvIuJ1YLgtmrp3/G2yI/7gPA+69jWP++KKr0pudqgxVEXyLpQzKuaEyQ+I4PveOua9obXxHyXYEmnmPPmoqpUlf4FeQ/UqLCMrO6sdQGaMz5IdqjOMet3YsSxsxPGNyP5epd3P17r1V7R5AtoQ/CLzpUyuKiAYwSr45WS4K6VZb6VBBeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qlwaegv6FwnogRFXtOdyThBisWMr2MvKXYwlOolBi58=;
 b=TXRQMYNRnSc8t0tuA4hK8kVEwwPawNPW191TR+uJKyoToDd0izWaSScAaqWhUtpFC85tL315FQswRi3kwwjMx3MHAHJ4Eo7QmxcJIwlFtt/P/Ic1tl6jstapIjAUTNQv91tuEjTJGGa5t4hn45rvUxkkMtkenFqM4BS2dbw+/DE3heI1ucaqNqx8GDN76Ux7ouGVeF3ileogWlBAMvBWW1xQHE7zgSUV+UlKJAIKgcUWfeqEZjeOdVcIbEiouN/t80OxjI5MpRuG7T/OqkHrO8Cq06/dP/tSmcnfqJCXt3Jm0RZTAR+LlikapGe+R0yEmSwOuImr3loxm1ix9YRqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qlwaegv6FwnogRFXtOdyThBisWMr2MvKXYwlOolBi58=;
 b=H4anQtYdlVSwpCcwQ4H6O8cJcDD9TNLQkmPNBziWH+gx7D/v7AcTl25o0Zh5UezhrqhdbOXgd+KTKIWUAdFufSswmExhaIJVfurIIgcYLr0dhA1lh1r3IF1TUy2F3TCs9KWo9XCiRH5KY7qddggLuqDoaQzTNKCh8j1f7rzx/yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 08:43:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:43:32 +0000
Message-ID: <b4cf1379-d68b-45da-866b-c461d6feb51b@amd.com>
Date: Fri, 30 Jan 2026 09:43:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] dma-buf: Add dma_buf_attach_revocable()
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-6-f98fca917e96@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260124-dmabuf-revoke-v5-6-f98fca917e96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: bd34141e-b4dc-49b7-c850-08de5fdba5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUcreVprcElEWVBKbEZubEZhVzBvY3RSZE14TW9lZ0hzd2M3aldlbkh4T21l?=
 =?utf-8?B?VVlHWGpCT1RtbVlmRkpFaE1SeUJmVitEUUY5NmJEcnZKdU8yUTNJRnh5SmUr?=
 =?utf-8?B?TDd4TXNxWEY1ckpBM0todldwenlZKytLOC92YVNBcEdGR1k3cTIzYWVILzk1?=
 =?utf-8?B?VzdkbUZjUE8rUU91aXB5V0NOT1RrejZVZThwTkNZTllPSGFCVTNtcm43WG5y?=
 =?utf-8?B?UTFPUzJvOHZ1UXJMUWdIWjViS01ITE93cVZVVncvMWJJTWVpZWMwREZTNjVI?=
 =?utf-8?B?VUJQR0w3M0YxVFpIeXJWeFlHVWdGZk5ZdjV2WkUrSDhrWG5OQ0UyejNzaTNm?=
 =?utf-8?B?S2thVGNkKzlKTVc5eDNvOEMrbjJ2dnNiMnVIOStMZ2F3a3htQXRmMFZ2cHQ0?=
 =?utf-8?B?YTdmNEJDQm5GNi9WOVVtQnlQLzlwYjU3SFBpdXBKV2gzcGJnOHdZdXlEVXpi?=
 =?utf-8?B?SGlhQjUxVUptQnNLYTY3SFZ2WFFFKytFNEVYbjIrUER1cVoySjJmRURuWVMz?=
 =?utf-8?B?K21mdVp2M3A1clk2RnBXWGpCWi83M1p4bVE2M0RxV1Zxb1JNZzNGL3hPNzE2?=
 =?utf-8?B?M1FvU3EvQmxNTWUzdGhqNWM4WFh0TjhUaUU3bWtReVpFRzlzN2syUHgrRVls?=
 =?utf-8?B?aHFJMWNxZHVseUYyekJIMkFpdElOYTFqalBZTkYrL241dHJZZi81V2ZrT3pT?=
 =?utf-8?B?NjAzdHo0Y0VKeS9YL2M2cFBqeFlZR3JaOUVBT3BRR0NwdDRBb3VNTVhUVW1D?=
 =?utf-8?B?R1VTZWNjUnN0UkpXZVh3REU3ajY2b0tKMndPY2FKczR2MXJXUDZwbDFmbkVa?=
 =?utf-8?B?aHBjUDdQSHhmdTAxNHdqMWV1a0RxM2phSEZvV0VBMW5wSzladTZuV1o3aHQ0?=
 =?utf-8?B?Z1JNSzNpbHd2UDNvSENzaXp1a1FkcWQ5Z0VRRnN5bkNEdjBvNCsxNk9ST2FT?=
 =?utf-8?B?MDREazRDb2VYb0JkQ2Vid25mSzVpNFgyQnRaVGV0WXBuR0lsblBxdnZvZjds?=
 =?utf-8?B?QjBmNTQ1SHZSYTlnUnhFeEFBS0l6UUY3bVZ1MjVlNXBhbFQ1UkZsN0hkS0Zl?=
 =?utf-8?B?d1FScFRNSG0zZmxOeVlVYTRRTHVOa0phd25NZCtVTG53RzVldEhzNXFMbStu?=
 =?utf-8?B?dzZObmFlS3Z5bjU1QitaWENEQnM4aWNjVEozV05OeUJvRGpadURwQjhuRk5i?=
 =?utf-8?B?T3IxVThGTHNzZ0V0K0c2bTlVd1ZxUUFBZy9QS3FYL1NWeGcvTGR5WklGVDIy?=
 =?utf-8?B?Qmd3R2VnSGNxYzlSQ253WVlibzhPWEJoVEpDNWhWNW0wK3RpRTdrdkhKajNO?=
 =?utf-8?B?cjFUbXpWNkpFekN2RU5JQ1YrN2ZDdWZicjVtZVBseTFjS1BVSTE4ekdac3Rq?=
 =?utf-8?B?aTl5YUplc2lQUVlXQzUxR29WSXVETEZvTWVpVDRUY1R6a0hHc1kyZXdreHlY?=
 =?utf-8?B?czJOQzJjZnV2QUlCbUZvYUNnbmFseFBJQUhJdHZGYTZBbVNhSVZlRk9qQXRR?=
 =?utf-8?B?Y3NYSWRVWnRVVUQyUWJsZDd4OEx3REwydE9ZS1BwNGlGMzd6SGs5My84MGhI?=
 =?utf-8?B?cnFmeW9EZldBVW1YWDBEa0tWMHUyNitMNkdZSUFrZVVYcXhieVVISGd3SEh4?=
 =?utf-8?B?dk0vV0ZETm9PNkxrQmpNTjUxeHQ2cGtPeEZvUHRJb3VlU2RURGpzYmNzcjRy?=
 =?utf-8?B?Mk5hQXJlRlZQc1A0M25aNS9NR281TzBLdEhYNlZDRzliK0JDVWZnUmJhWERD?=
 =?utf-8?B?MEhhUDRFQWpmQWhULzlNMUdua1dMMjdKU0IraWZXWHhadjVFUEdRM0tHd2tz?=
 =?utf-8?B?bEM3UHI4VHhwQVlvcmhhNGwydStxMUttaEE1cWQwelAxZ3JlcnU4T1RkaHl1?=
 =?utf-8?B?RWJUdkVvRVpoVm5CSEJadWxBYnVpU3RCUjdjcWR4b2dKNlRSeThoeWY0c29G?=
 =?utf-8?B?ZzlHQ1Q3UjdKRTdrUVd6eEx5VE9OWUFvZGtscGN1bWZyak9SKzlieE1QN1lN?=
 =?utf-8?B?UkQ5aDkyZmg0eTE4MFFPZWVnTHFqc2tkSnlKZ05paXZLVEdNdVRoRHh5R0Y5?=
 =?utf-8?B?WVJLdVB5cE9STXNLNCt3U0ZpYUF2Smw3TkFPR1lpQWc3R1FvRzk4RlN5dnR3?=
 =?utf-8?B?ZVd5bWlla3AxaHVGaG5OSXJuTkN3ZWgxdkxqVnl2bUF1VDVFakEydXF4UTg1?=
 =?utf-8?B?NGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE1DRUxCNUh3K2JNZEcxNTk0b29sSkQ1SW5hOUhCQk9nbWE0QWd3bDhWWVpq?=
 =?utf-8?B?UG9zaUhkbEYxLzIwQlhyZ2JTYTdiUk41VzgyUy9WcnBsUVlUbm9seUlrcFdW?=
 =?utf-8?B?NjR0UEFMcERFendQQkcrTWhzcXNHSlVQNTFwRG1xZTY3SEdHVnJ0TkdCYmEv?=
 =?utf-8?B?N0pxZkZtd21EL2lCMmZhMEN1NnJBaGNHbE1HUE56UWhPcHJRY2dIaGQ2K3JO?=
 =?utf-8?B?RFVUUzIwR2NDMkptTmVSNVZSSnk5aDNsRjF3RHVGc3FKUjNxRDVzNTB2dEs3?=
 =?utf-8?B?ekhnbmMxRlNaRmtjVTlXRXlJMnY1cmJLSTZDWDkwWk83ZzEyMHNHV3VVa3dz?=
 =?utf-8?B?K28wVjJ6UlRmbUtCMDFIdWRvVGdSbyswMVJPcy9nbk9meTJFajNhbmp1UVpJ?=
 =?utf-8?B?WGFtSkVwZHZwQzNXT09aRGJUdkRCZnI0bEhtK25MZ0xjcUgvZ1pYbXozVWc5?=
 =?utf-8?B?Y3BzVUF1TWRRNUFFYXhKTUpaNWZpS0l6dmR0Mmk0d0haMmlqQnY3NWdqL1Fi?=
 =?utf-8?B?NVNQa1NBaTUxcERxOUpuNkYvcHRlbDRSU3M3ZSthTno3VjFPbzdRZEdhQlZt?=
 =?utf-8?B?WEJJRDk0aTNHeEJjTWRja3k1OFVFVWMyQjVnS1R5aFF1Yngycjg0MW1kaEt2?=
 =?utf-8?B?VHg0cVBFVTJnSGpXVmI4Wi9tU0JhOGxTUXl5NGJKK3gxaFJJaWd3aEFFQ0dH?=
 =?utf-8?B?Ni9tOXVhbzBZVFlLVGxDUXNHTTFWMlNNNHNSanZrTTZUa3IxR3hHRExoSUhi?=
 =?utf-8?B?MktRZmVjRXFQRU1rcHd6aWg0L1kxZm1LbmpJZmlKNGRRYWxGd0phYTNzY1Bt?=
 =?utf-8?B?WEdyWTREYmVFeldKUXYyd29QY3Y4bnJIdkhmUWxLNjJpdGpxWmorL3FwTVE5?=
 =?utf-8?B?ZFpXdDJzVUE5RC8wWDIzOFNNNnZnNEZuRGFSV1NEV05HRjhNVlFLL2J4RHd1?=
 =?utf-8?B?S3RkTWs0ekFRVWszWnhGVlgxczBHTFlnRWNrODhQSGR1Z3dlWWpYNUJGVGdt?=
 =?utf-8?B?bkNUdE5waFJsejExWHhsQlpuZTdkK215amVTaEU5cHRBRDE1aVFNZUVOQ3NW?=
 =?utf-8?B?RmVTUHNtMWdBaytvOFlLK09WWnR0UFl6ZmJJZFhNbEt6UHRBcmRlbk1BcTkw?=
 =?utf-8?B?V1Y4Mm5tMUN2UkJtV3Qva3ZyRmgvVTNFTU1YcmNtMHJrS3BLQXc4WlcwWXQ4?=
 =?utf-8?B?a2U0NVZYa3RwUFBNVjA3TVkwajdhTjJTYWsyTURsTEdsT2RjZ1BvZlJRdTRU?=
 =?utf-8?B?bm1uM2tBMjdZRWZjR2puZGxkQWVNQ2FGdDExWVg3L3dRQ0wxK3hGZ0tVQUdZ?=
 =?utf-8?B?dVFsanU4Zzc3akc0ZUdrbUx1Q2VMa0M5Wmo0LzU5ZHNRbG5UbkxNRFQ2NW03?=
 =?utf-8?B?Yk5PNnRsdzNIa01OL2dyYmtLWDkwSkdnUFpxaW9UTjhCaWtsODd0UHZVb1lB?=
 =?utf-8?B?QlhrYUs3UDYxQVY4NkN6bSt4WnRZU2VEVlJ4UFhrZzAxeUZ4V2xlOFF3eG1Y?=
 =?utf-8?B?K204RkFVa1V1MlBsaWorRzJDRlhzWHNUc3ZTVmloYURRNWo3eUxadWZERlJZ?=
 =?utf-8?B?VUJDcUZ1L3lQbUM0eUhYeFJ1MTFTZHJ6cExFVnZWMndrSjdjZ2J0bzk1QXB0?=
 =?utf-8?B?RkxmZ1RKWVkydHRaVi91eit5OVhTV2NnNGFia2xZSytleC90SHJCNktSaEo3?=
 =?utf-8?B?N3QyRSt6dzRrU3d3MUltVWloZkVsczVIZEFIK0dacjdHNFluS3BpS1J0Q3JB?=
 =?utf-8?B?Qy9BeGJQZnl2L3Y2TE1pdmxHckNKZTE1aUMwdzJTR3hhMXNObWFUcExXUTBm?=
 =?utf-8?B?RFF3Uk4xSWVSS2pPRk41Z0xzS3g2K2tqTGF3OHhiM2kzY3NOQU8xWUh4c3JU?=
 =?utf-8?B?K1l2Z0wvTzFXUitLMzFaWnNraHpnL2RQYlZYZ2J2Ujg0cHYxNWZ3ZXhnNG1T?=
 =?utf-8?B?YVRyZ0NqZ0paNThucEUwaWo4MVQ1WEpvRk56WnY2KzFrcUFNdTRSVFd2dW0v?=
 =?utf-8?B?dVJKVlNqbkZsN3NDYWV2ckpFODMvakpwT2NvbU1kTjlqbitiZEQrVnlZcGx2?=
 =?utf-8?B?QXBXb1d3QlZpS3VBd2lRV21acDNTbXFwRU1ZRURKSS9lck55bWJBeTFGK1Z5?=
 =?utf-8?B?STNDNis0WHY0eW1ac1p6Mjk2RHlldEtQRzhiN2lZMjduRVJoVnJSYzgyL3hw?=
 =?utf-8?B?T2pmaWVLdUJ0M3ZBZ0MyanFYQ2sxZzc5ZmlVQitCTFZkOHAyR1JHSlUxSVIx?=
 =?utf-8?B?bit5L29xN3ZPMERGUHVDYldSYUU5ZnVRaDJkR0JFRkxpTy9VaElMWnl1SFYv?=
 =?utf-8?Q?PJ082RyvyRj6HEqxy0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd34141e-b4dc-49b7-c850-08de5fdba5b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:43:32.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoDq83RMpP2a6nMT5wToUA1QaCrp62c71SegDkJ8redjP6xTiC8hFS97HwyNRFOu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 73E5BB8942
X-Rspamd-Action: no action

On 1/24/26 20:14, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Some exporters need a flow to synchronously revoke access to the DMA-buf
> by importers. Once revoke is completed the importer is not permitted to
> touch the memory otherwise they may get IOMMU faults, AERs, or worse.

That approach is seriously not going to fly.

You can use the invalidate_mappings approach to trigger the importer to give back the mapping, but when the mapping is really given back is still completely on the importer side.

In other words you can't do the shot down revoke semantics you are trying to establish here.

Regards,
Christian.

> 
> DMA-buf today defines a revoke flow, for both pinned and dynamic
> importers, which is broadly:
> 
> 	dma_resv_lock(dmabuf->resv, NULL);
> 	// Prevent new mappings from being established
> 	priv->revoked = true;
> 
> 	// Tell all importers to eventually unmap
> 	dma_buf_invalidate_mappings(dmabuf);
> 
> 	// Wait for any inprogress fences on the old mapping
> 	dma_resv_wait_timeout(dmabuf->resv,
> 			      DMA_RESV_USAGE_BOOKKEEP, false,
> 			      MAX_SCHEDULE_TIMEOUT);
> 	dma_resv_unlock(dmabuf->resv, NULL);
> 
> 	// Wait for all importers to complete unmap
> 	wait_for_completion(&priv->unmapped_comp);
> 
> This works well, and an importer that continues to access the DMA-buf
> after unmapping it is very buggy.
> 
> However, the final wait for unmap is effectively unbounded. Several
> importers do not support invalidate_mappings() at all and won't unmap
> until userspace triggers it.
> 
> This unbounded wait is not suitable for exporters like VFIO and RDMA tha
> need to issue revoke as part of their normal operations.
> 
> Add dma_buf_attach_revocable() to allow exporters to determine the
> difference between importers that can complete the above in bounded time,
> and those that can't. It can be called inside the exporter's attach op to
> reject incompatible importers.
> 
> Document these details about how dma_buf_invalidate_mappings() works and
> what the required sequence is to achieve a full revocation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/dma-buf.h   |  9 +++------
>  2 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1629312d364a..f0e05227bda8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1242,13 +1242,59 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>  
> +/**
> + * dma_buf_attach_revocable - check if a DMA-buf importer implements
> + * revoke semantics.
> + * @attach: the DMA-buf attachment to check
> + *
> + * Returns true if the DMA-buf importer can support the revoke sequence
> + * explained in dma_buf_invalidate_mappings() within bounded time. Meaning the
> + * importer implements invalidate_mappings() and ensures that unmap is called as
> + * a result.
> + */
> +bool dma_buf_attach_revocable(struct dma_buf_attachment *attach)
> +{
> +	return attach->importer_ops &&
> +	       attach->importer_ops->invalidate_mappings;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "DMA_BUF");
> +
>  /**
>   * dma_buf_invalidate_mappings - notify attachments that DMA-buf is moving
>   *
>   * @dmabuf:	[in]	buffer which is moving
>   *
>   * Informs all attachments that they need to destroy and recreate all their
> - * mappings.
> + * mappings. If the attachment is dynamic then the dynamic importer is expected
> + * to invalidate any caches it has of the mapping result and perform a new
> + * mapping request before allowing HW to do any further DMA.
> + *
> + * If the attachment is pinned then this informs the pinned importer that the
> + * underlying mapping is no longer available. Pinned importers may take this is
> + * as a permanent revocation and never establish new mappings so exporters
> + * should not trigger it lightly.
> + *
> + * Upon return importers may continue to access the DMA-buf memory. The caller
> + * must do two additional waits to ensure that the memory is no longer being
> + * accessed:
> + *  1) Until dma_resv_wait_timeout() retires fences the importer is allowed to
> + *     fully access the memory.
> + *  2) Until the importer calls unmap it is allowed to speculatively
> + *     read-and-discard the memory. It must not write to the memory.
> + *
> + * A caller wishing to use dma_buf_invalidate_mappings() to fully stop access to
> + * the DMA-buf must wait for both. Dynamic callers can often use just the first.
> + *
> + * All importers providing a invalidate_mappings() op must ensure that unmap is
> + * called within bounded time after the op.
> + *
> + * Pinned importers that do not support a invalidate_mappings() op will
> + * eventually perform unmap when they are done with the buffer, which may be an
> + * ubounded time from calling this function. dma_buf_attach_revocable() can be
> + * used to prevent such importers from attaching.
> + *
> + * Importers are free to request a new mapping in parallel as this function
> + * returns.
>   */
>  void dma_buf_invalidate_mappings(struct dma_buf *dmabuf)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d5c3ce2b3aa4..84a7ec8f5359 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -468,12 +468,8 @@ struct dma_buf_attach_ops {
>  	 * called with this lock held as well. This makes sure that no mapping
>  	 * is created concurrently with an ongoing move operation.
>  	 *
> -	 * Mappings stay valid and are not directly affected by this callback.
> -	 * But the DMA-buf can now be in a different physical location, so all
> -	 * mappings should be destroyed and re-created as soon as possible.
> -	 *
> -	 * New mappings can be created after this callback returns, and will
> -	 * point to the new location of the DMA-buf.
> +	 * See the kdoc for dma_buf_invalidate_mappings() for details on the
> +	 * required behavior.
>  	 */
>  	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
>  };
> @@ -601,6 +597,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>  void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
>  				enum dma_data_direction);
>  void dma_buf_invalidate_mappings(struct dma_buf *dma_buf);
> +bool dma_buf_attach_revocable(struct dma_buf_attachment *attach);
>  int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  			     enum dma_data_direction dir);
>  int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
> 

