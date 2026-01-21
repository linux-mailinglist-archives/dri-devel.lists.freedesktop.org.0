Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIBIKK3wcGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:28:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2A592EB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209010E820;
	Wed, 21 Jan 2026 15:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zq2XomQY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0010E801;
 Wed, 21 Jan 2026 15:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E08DXAPBPMwwz9P90LfK26h4LRqe3iuveW6z303H1J+wYopCle1I38N2sYNwKcHGk4Di/j8sAnPKYv4RpvLgylASyDiZu6KhMVWFntQR2SbQB435KnNrKnnjWikK+dYidd1vnB6iRl+ApBkT/ZImviUcpDE8XPTJZRJaTKVXHsEWiJDnAQ0HRDUlvktbzx+Kx7JYMLwbD8J6qO7tBdWoWPEjfVYRKpyjAPeQ0CJccxaaoidr518gHBCcckNlcoZVpgZo+i3IKFsaVtzUoaPzG9oHYIobOc61klkl72VMnYYtZH4dQPu7vQ+61w91lnMPuNh/wQLeMBb6HfQLFmrRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZclmBqj4Mr0Ba4rvFM9PQ0OGYmWIrQax2yR3AVlCtWY=;
 b=u0VuVEnFGmPKwb8Qbf/m0kYkvT3SgfKRab+hOR7iyN7H9jcjN1j6cDFg5sIlig1eH+E4XF4OT/G0p9ybqcZMgd46uoZ2XrGxoSZkAXmdYiRqQ4eApgjjfasA76rDGA/2EigqNo9BCCkc/JfzxeFAXUtIYPm1XvloVvtfrTv0HouD2JopHxeZtFWMBjmxHLP4ZLj6ZcPIyEkrA0I5Xj4av04CLFdWxgs+YVI5qAfd2Q9vWW46H18kdQhvKGvTCw4SJ2nptYW5BRBqceSPOIllX1MxCkxKVKGKlMA7EZVm8hUA3uGvdjMMx2r4bsD2STlXy8565R+hG79YcgmKEtGCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZclmBqj4Mr0Ba4rvFM9PQ0OGYmWIrQax2yR3AVlCtWY=;
 b=Zq2XomQYy7PshhH21Sk8ceOisEClWvWtgKNLWIycknhaSS4/OxkMXrgt6PqfBPe5nKrpYdWdhEEINzlieyHJpsO/3iRax1XgBBnuYz8Ledh3Wa8zwGld5UvgTidKGWwXgMuv/h3Vyh0ndQFBvDPkd7g9NvgRNRg7NcuueAxLQWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:28:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:28:36 +0000
Message-ID: <b88b500c-bacc-483d-9d1a-725d4158302a@amd.com>
Date: Wed, 21 Jan 2026 16:28:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
 <20260121133146.GY961572@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121133146.GY961572@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: b12601c8-a27e-4ba1-b9c6-08de5901beba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBmVXlPRSt6S3NDUE1TdlE5KzRuUlFEOVdKb1U0VC91czhBR3l5SEcvRzVu?=
 =?utf-8?B?SWtwbkswV1pObC9oTEt4YXZvbUtZTEtSYlppWGl1ZVhlc3FveGx3amVMK3Ew?=
 =?utf-8?B?OXEwQlFNVjBTQ2dhZTczMHFjRHdRUHlRK09IWGFFU1Q3dmh5LzFoVkNyY1Vj?=
 =?utf-8?B?emQxZDhzZFdrUFUrcHFVYmRnVjdBSGJycTdXSE9COS9JVW1OZG4yV1B0dFIw?=
 =?utf-8?B?aklyS0lWd1E3bUluYU1UWFNYSEFkWWhzQVZDT2I2UkU5cDZydmpQaWxKQnNI?=
 =?utf-8?B?NmxIZ1F6RUt3VzNlYVIzN0JLU3hCa2xNMmNaWE1XQ2RsVGFUNk1BdzR6UmxN?=
 =?utf-8?B?SExnaVV3T29wVEdrbGFzZWtrLzRKaVd1b3hTclEwckgzOUNXMW9YZmhVQStN?=
 =?utf-8?B?eEtaTDZMMjdMeTJYT3VRaURRMHNTdW1kZnVsQ3Naa2FaeW5wdnBCM2k3RlN5?=
 =?utf-8?B?bUszZU93aFlheiszODY5b2FpY3hiNUMwM2psRWJSYjBYclRLaWRFWkdhQUs5?=
 =?utf-8?B?cWJVcCtmZUhvNWMzR3pqSnRtQnFrN0h5UzFPSnUwUUI3ZUhSZllmTldMQVB0?=
 =?utf-8?B?Y05LY1h4WGZrUUhwdmhlb0k3azNJN1IzNkxVeEJ1ZHkxTHZNc1ZhT0ZTNGNu?=
 =?utf-8?B?VHRrME5MRUZCZ2Fha1NYZ0U4SGZXclNrT0tzaHVldnFicEVLZDU4QnA1Szkx?=
 =?utf-8?B?SVByNWk1ekJ0aVp1RExWWjdEVnV4endqQUhEU1lSWkdFUVVyVHRnTk8wNUwx?=
 =?utf-8?B?aDQ2WUtUNmk1OHVBQUFKKzA4eU5yMmV0MVY4WkNJRUNQUDRLOGd3VFI3VVlz?=
 =?utf-8?B?SFg4WGlGN3QvOVBlaWRnOC9xTVJpT2Q4eENUM2RNWHpiVEJpYmlBSHpPdzlG?=
 =?utf-8?B?R29JZUZPZ000VmJsU1NtVlNNbXd4d3lCZUxvVEdWRi9TZnF0cjhTVk9yWmFS?=
 =?utf-8?B?N2RzWTEwZG44TEZtLzRBejJDZVJIQTN0VTBreGNnY0tBRTlsUElCWHMyblNN?=
 =?utf-8?B?c0ZHczl6T0h1WSttcmFpc05NK3JjbzVJN0w3bHJvT2xKQXN4WGROUzNRa2JE?=
 =?utf-8?B?S0FRRTlxbDlDQ2JXK3NqY2NyU0gxQVNDWmdSdVZUTlJpNzJlWk91bm1ZT3hQ?=
 =?utf-8?B?aVpyd1pDNk5PbEp0OTl1NHBkKzZkODRrQi8rdWxuZEd3eU1hbkZDNSs0aHlX?=
 =?utf-8?B?Q0YyMEh2OXF1ZHozdU1uUllJM0ZpSThQQVM3NDgwdmt6VDMrZEx2dVNLckFX?=
 =?utf-8?B?cHRDclZEYXVLQkgzRkM1SkFBbVBWZVlKcDNwRklCVXdlQ3IrZmpOYXVVQkR1?=
 =?utf-8?B?dHVDMnJOUUd3MS9kaEdoV3J1NzZDaGd0SmVkRmgvdXdXTkpjM3ZQdUt2eTlT?=
 =?utf-8?B?YTg3ZzZkRGMwRnl5RHJValdsaTNVL1FwTXFiT2FiSUJ1U1EzeHFQbDJwS1Va?=
 =?utf-8?B?bDYzMEg4WkdmdFNON2tPRUhJMGRlQ1lIbkpqVFMvekRrYmducTRlNi8vK3FJ?=
 =?utf-8?B?Y0RwUlZZZ3BxbTlSR3RWTmRZZDJQVjJnN3k5eldCdXd2WC91eGdNM2hORXlB?=
 =?utf-8?B?cTdPRGwvRTBzdXMydWtrZ2NicFZCWnZHOWV1MjF0aTRlQlV2bllYOEpSbDJ5?=
 =?utf-8?B?RGNJUDZ4WHZmUTNUWkhZd1QydmxCVW5SL0NTalI1aTFmbWtGbnptZUtzQjJ6?=
 =?utf-8?B?UlZvaWZ3V082RVVJRnVyTThtMHUvVHRrTlhXMktQQWlscGJEODFMNjZsSUZl?=
 =?utf-8?B?Mk43OTluU2RxQmxoS1UrTEtGbEdLNEJCRGs2dnpmZ0N2RERobmtMLzQvNzdC?=
 =?utf-8?B?MVZCR2xZYktreGlpVlFGYjhNcnhaSEp6OGgrRDF4YWtwTU5SZzRxSjc4QVlM?=
 =?utf-8?B?QVVtUjM2TlhCMytzY3E4U3FYWEF2clU1SG5wWUphTCs3UGkyTlN0bjl2UitF?=
 =?utf-8?B?NE9KZ3c4bG9VUXRpNThNM3J6ZEF0YXlGcEhjd1o1b1owNGxUSlFNcE9EUHA4?=
 =?utf-8?B?b2FQMUVIbFl4Z1F6VTBnSzBvbmRsZ0N4TGZGRUNFTG5md2Q3ZnUxMmtQM1J0?=
 =?utf-8?B?Zjhvd1loQUcwUWxMc3YwVmdDZGMwYXZKRVRQdUtheHBTeHE5eWw2ZFRDSURk?=
 =?utf-8?Q?r/vM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW9YbEpNbDNhQm1OOHliL3VkOEhHdkFVRk1pd0FEbERmNnltc3NDaUFUYm4w?=
 =?utf-8?B?eGpXaDQxak5US0dxd29TWXZxenVKUmxMbkNmK3BJelA3V1JMRldlbGdEVGxx?=
 =?utf-8?B?Unk1S1lxNDNNYXY0SjVKejNNbURpVERWT0xEMFlobzhVVVpSY1lBSHNTeGxv?=
 =?utf-8?B?SDZVVHB4VXVOT2ZxZzdGOVczeVI2RmYrREVpT3dyYmkyckNwTmRHQ3I5cW9l?=
 =?utf-8?B?UzVPUXFoWjJEZE00V0tVU2dXaGxiUDJISEd5R1JQMU5KQit0TlBBM1VTV281?=
 =?utf-8?B?SjRBV3p0MTNTMlRqUzJmSnNmbzdETGtxbUdQaUJYZll3R3lVanBhSC9KWWNq?=
 =?utf-8?B?cHRBNDRPN0RlakF1OVBFeXNjOXV4M2k3V1hVRm5PSGJZaFVMaFRQazBjYnZv?=
 =?utf-8?B?T24rdk54UHYybTZoMmVYVWhaUDhPMGN3SVB1L2R4K1ZMcFBLYlN1aFd0K0V2?=
 =?utf-8?B?aDY3eEVRQzdBUVdnQ0M4OEg4dyt3SUxTYTBxcFdRS0N3UHRkdDIxLzVKN0NN?=
 =?utf-8?B?WjdkYmhQekhaN0pXL2tTNVgrMittdHNBOEZWNEdsdjVOcmdOdDcybW41Rkwy?=
 =?utf-8?B?WG5xRWg4MlJacUZ6R3NkbTNaRlllRk5rS1IrWitFRDVkZFg0bWtyUmpZblRP?=
 =?utf-8?B?NThzVUNTajI0aEhDVnZZVmUrN0J5NjdEeC9paERKcVVGNCtOUWdGdkZYWVdq?=
 =?utf-8?B?bHhMVkRDQ3kxSVBSN1FqR2JjenlYeFQ4R1JMZndRakkySXVDVGtuV2kvdGx6?=
 =?utf-8?B?UXVENGtuR1g5cy9tTnA1MWI1UVRiVit0Y1p0S3NCOERUY083T2V0QzA0aFB2?=
 =?utf-8?B?bm8yM1h3b2lnMVF6bFY3bjFiKzVQcFRseStLcEVqNHI0OFo5cnNNSU5adHh0?=
 =?utf-8?B?SXlmM1lmUXVGaytCZlRFVWNlK2NESW5YVmhRT0hsM2lwRHNuZDhFcC9vTHZW?=
 =?utf-8?B?SHkxaXRGcjdOck8xY29URUVjRGwzbE81eDZzOGNsVXc4OEJuMHNHTkRYZGdD?=
 =?utf-8?B?ZWRoOW1MZysxaFFSL3lhbWZOYnlCL2pINVZYTTArMU1IN2FlRzN4UlA5VVhv?=
 =?utf-8?B?V1d6V1NLSjRUVVJFTE8yMzlEaFhXdzN2WW55cG1DazlWamxKcnJ3QUN0b093?=
 =?utf-8?B?NG15cFZOL0U3SG5QKzBBVVQ0MDR5aURQaSszcTdDaFJXd2dVcFBKVnB4Ylcx?=
 =?utf-8?B?MEQ5NkRiU1dmbStnaFJuRWJVdnpKWGNoQUEybVNsT3pCS3ZmWEg1OWljYStt?=
 =?utf-8?B?Ym1ONmUvNXhzYUJnZ0JZVWNCc2E0bElsLysyaW02bm14U1ZEaFBzbnBEcTJv?=
 =?utf-8?B?cFJXNHB5Q241S0drd1gxYnd5alhFeWIrUXQ1ajd0K01ETDdNWFd2TzFyWlNK?=
 =?utf-8?B?WTIxYUs2aW42dDFXejYvTWdmSDlVanlKYmUvNHBwRWhDVmhCR2tUeTlvTFBa?=
 =?utf-8?B?ZXdhMnU2SGtLcEVmSkxaY2JHNUhKeVRBbE9PQzh1bXRodllXUk9WL1pGVStm?=
 =?utf-8?B?UnFBTzBwMkZJOHoyd0Z0UXhCclNtSTNhMldUaFNPY2lNdjZ6eVBjelBxM3Mz?=
 =?utf-8?B?T0dFTGxhK3BqQi9hcXZ1YkJkTkZrYVlCVjJBcjdwV09HWGxaMVB5MTJTNVRl?=
 =?utf-8?B?cmVVdEJCL1BlZy9XWDRQbU9LKzJsbTZkM2VwcnFRUkFvbmRseFhINWlsYjVp?=
 =?utf-8?B?UVp3bGQycmx4TVJMYmNiOFhCbUFlNXNOQ01CMUc1dk5nUmEzT2ZxanZoOTFT?=
 =?utf-8?B?dTU1dnppQ3E0N3JHWTRSVTl2UitrTS9DRDJBS2Y3YnM1Nm5tU0VjT1BuVWYx?=
 =?utf-8?B?ZEhHS1hFOEVGMGJlU3hrYTF2Z1krYWp4eUV1NzJmUTNTWkZ0M3NHdTdBZHZ5?=
 =?utf-8?B?RmlqV3NVT2dmayt6ZEFqeERteU1GRWplVS9HT1psdFBxN25jUVFkY1dlbE9j?=
 =?utf-8?B?eERmUGptRDBnMk0yWHYyUXUrbXdVa3BpMDUrTFBJem50VlhxdjZsbndSK2Zk?=
 =?utf-8?B?QU93aDNKMDc2aytCaU9KNVNJMllQQmZVRy9HWm0vUXdqN2pxcmU0UFRFK0Fi?=
 =?utf-8?B?TFJWc3Z5bmdLajQ5enUzTHphY1BNYTVLZHV6UzNGazZ4MHpiSXpCNGdpbkNC?=
 =?utf-8?B?OEFzcWZ4U0tUQ1NRK3ZQMFU0L3cvN0JwYmJjZXRMY05td1V0ZWwwc2hPWkk4?=
 =?utf-8?B?YURzVnJSd21zL1hqY2ZlNWtYTCs2NmEvbGZmanR4RGgvZmdyS1Y5Q29xcllB?=
 =?utf-8?B?R3FyNnJ0eE9YckVQQ2E0ekVweFluNDlzODhuQU9mZ0dwQ24welpMZGsvc3d1?=
 =?utf-8?Q?4+ifT9xZ0h73/FkrYx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12601c8-a27e-4ba1-b9c6-08de5901beba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:28:36.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ows2tTmRAun6pWABXfitH47ZmRTPKjyVVhmTOV4sYjeGisFbSAS/2h1yCH13nVzQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:dkim,amd.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 53F2A592EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 14:31, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 10:20:51AM +0100, Christian König wrote:
>> On 1/20/26 15:07, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> dma-buf invalidation is performed asynchronously by hardware, so VFIO must
>>> wait until all affected objects have been fully invalidated.
>>>
>>> Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Please also keep in mind that the while this wait for all fences for
>> correctness you also need to keep the mapping valid until
>> dma_buf_unmap_attachment() was called.
> 
> Can you elaborate on this more?
> 
> I think what we want for dma_buf_attach_revocable() is the strong
> guarentee that the importer stops doing all access to the memory once
> this sequence is completed and the exporter can rely on it. I don't
> think this works any other way.
> 
> This is already true for dynamic move capable importers, right?

Not quite, no.

> For the non-revocable importers I can see the invalidate sequence is
> more of an advisory thing and you can't know the access is gone until
> the map is undone.
> 
>> In other words you can only redirect the DMA-addresses previously
>> given out into nirvana (or a dummy memory or similar), but you still
>> need to avoid re-using them for something else.
> 
> Does any driver do this? If you unload/reload a GPU driver it is
> going to re-use the addresses handed out?

I never fully read through all the source code, but if I'm not completely mistaken that is enforced for all GPU drivers through the DMA-buf and DRM layer lifetime handling and I think even in other in kernel frameworks like V4L, alsa etc...

What roughly happens is that each DMA-buf mapping through a couple of hoops keeps a reference on the device, so even after a hotplug event the device can only fully go away after all housekeeping structures are destroyed and buffers freed.

Background is that a lot of device still make reads even after you have invalidated a mapping, but then discard the result.

So when you don't have same grace period you end up with PCI AER, warnings from IOMMU, random accesses to PCI BARs which just happen to be in the old location of something etc...

I would rather like to keep that semantics even for forcefully shootdowns since it proved to be rather reliable.

Regards,
Christian.

> 
> Jason

