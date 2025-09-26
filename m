Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92616BA227B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 03:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F210E9C6;
	Fri, 26 Sep 2025 01:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PC8r5+Kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012048.outbound.protection.outlook.com
 [40.93.195.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3487110E9C6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrsz1uuOchSlWhARqLJ1d6ztQJy+Aj8+S2EKJqUAfE78UWjCW1ceNMBS6KnBocifYE7CEwchMU6+CfC3N1/8/1S+N2SqDC4bAKcvWgroc+V5mgCD+JQ1liqpqfFMpPUmYTQNrtzz7KF8VdcUfOCkXxqcJqtEtdcTaxbxu2vVmH12IUVqcg8Y6G54qn37aKfJbOB8AfYZVGbbnxmViid7/XxoKzI4MXTd8fltWit2me0S5rxqunKFV7/KuhGoLxeCjyZJUB3RrsR9SWCWnyGYtn/8VEcirlV79952CpqmTnLBHOhJbCvYQ80kEIdPSBnOR97jxuLPWY9+AHcbmbd0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNwpk/hpzh/Vt1ZRUf99oEBdtJbdMfIHzFL8bqa8R9I=;
 b=aqP8lbhHSQUtfGvD8rflgC2rlWdHsvcQ1FWB0myXWxpuG0MQNOFyLkTEfX91Xj+VzVIM2duxOen0wqLesSZ8vGOtV+Kao9kGUOa23RSmzWfwaeacEYESQYZZFHjASJtYhJzkOta0TRiXZfL27HwiTL8Wca82Yg9M9uGobkjdQOzbobl3FD0buQkOFskjFjoSdaWQ0ayk7ZXYZUcn4yfu0Syq6nSDc5TfCAXJ/UJHdMajrW/MuZ4qEj09YdOkxTogQBd0Gbb+wz8edY3zFfT837ZW7ZHZ9Lc7ruqc3Gc8DYj9wb2eobtWjo8ld475wuVwpIlq32NPBBAIrq3bMfbGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNwpk/hpzh/Vt1ZRUf99oEBdtJbdMfIHzFL8bqa8R9I=;
 b=PC8r5+KwJfQn9gAeM0VOOxbgqJS9CTUOHTaRxGxcN2+UKwTRiuuQCCr68OnhQTdFlX/ujJfoIXKOFyjyajLq98/IWTtcB3ipIiRHiSFViKh3HrfPWO/zk2t2vB3/nIvYeUOeqiQs37gaH8/h6FQ26aw8bW0dWJ5g/qE9+VpD1PF2Tl4znXOw8xJxgm1a/5rg25sxO3HTKfp6sb5+/0sDLket2duVl/L4DNDdT/XYhjWR3DLO046Wi33JgPqFZUJnvEIppgDjtanpG8H8dv8OsOW/PMlFo6KMPL6SeP3aW+eTNiBEPFIVCDoz0nRDZ6qjaLiNAfRzyHHvE2HKg5pbDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH1PPF2D39B31FF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 26 Sep
 2025 01:44:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 01:44:44 +0000
Date: Fri, 26 Sep 2025 11:44:38 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, 
 Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, 
 damon@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, 
 Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Message-ID: <s4drcxopxb43gia4izfwal5cdancvpjb45vksgipy6zdhh6ge7@gsgm46o2bgpv>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
 <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
 <891b7840-3cde-49d0-bdde-8945e9767627@nvidia.com>
 <c7a2ad6e-68cb-4689-b72e-6e7ebfcf5e64@redhat.com>
 <4534DB6E-FF66-4412-B843-FB9BC5E52618@nvidia.com>
 <tz2rrz626f7667i2wtwb4pegqm4ga7sr2xfpzipy6y5qchxycb@acx2unx27zsi>
 <7E859D31-9C00-4B08-84C8-2EC34D2B06FE@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7E859D31-9C00-4B08-84C8-2EC34D2B06FE@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0086.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e827d8-7edc-4c81-2930-08ddfc9e449e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1ZPRjN5ZlZIZXNPdExJM01DMStFWm56Q3Q4ZGhtd214ZXFMZkJRMzBxSGh5?=
 =?utf-8?B?YnJZbTlOVE4yKzNKY2VncFY5QVlUSllWc3VZS0xQUHlveUFrbUpMVE9GNHpK?=
 =?utf-8?B?OVJQVGd3ODNJR1BkMWJFRk9SSXZjOHBldlFEUlJweitxUEg3TEVmMHhNLzR0?=
 =?utf-8?B?ejNaUzlsRXpmdXQ3VG9hWHJRc1luNGJJbXJXMGE1NU1BYUhPZVVoQnVpZWdT?=
 =?utf-8?B?V2JOK0xsbHM3VmQrQ3Y0amlRZktXZWt1YXJBYXNnT3VUZDhMdURJeklMaUZC?=
 =?utf-8?B?ZzJHNE9xN2RuWUtRREhuMWdJZGxEVlNyb2ZRNnk0YzM5L0lyWnhFWmdYYkox?=
 =?utf-8?B?VHlOUTdrMHZRTFJrbklUZ1A4Z0tUeU5TaTlSdlIwY3E5cWVlYXVhSjJQdzN5?=
 =?utf-8?B?aXZLWEJCWElwT0RxTzJuRTJDMG90ZXF4TWF2ejVTU211akQxejIrMkJVc1Az?=
 =?utf-8?B?WUhxZUJxbldNanlvdzFxTFJoVGF4aTR6WFZXRmJFczB6anBFa3hVUUJDWWIz?=
 =?utf-8?B?RnZyek1taU93b01SYm9zcmtiajNvR2UvZVhad2hWTU5Ca2FBYkZTMFQwNFFt?=
 =?utf-8?B?T2U0UjhhNjJJZzRtVko2RkpTelQvdVFHVzhkVXR3dUM3Z2dLc2xXSzFpVUNX?=
 =?utf-8?B?NlBPS3VYVUUrcTdhWEVhcUdza1NmREQ5WkhzeUV4VkplSkdKOWFkNlVGRzhD?=
 =?utf-8?B?bEJIN2JUa2x3bC9ZZ0ZSNDdXVjVHWisrOHh2QnY2YTBrZTkvRnNQZGNFMnhX?=
 =?utf-8?B?TEFOa1k4QVFHMGtaZnNWQlhPZXBSb2JQb3UwbFpueGwyYnhiSUoxdFZ5VFNQ?=
 =?utf-8?B?TFF5cmcwclJmYVFFM0hGYzEwWGhZZWhBZERTYm1pbWc2clRNT0dYMVVvNzd6?=
 =?utf-8?B?Zkt1NzJiRWw3R0ZLcituTFN4cDN6RzlteWhWMDFLV1VJeWNwZ21wSG1YZG1q?=
 =?utf-8?B?azFVTm5WRHNhTU5laHJxam5US2t0SWRPbFZoMm9lYUlGNlU0N1JKQUJyb1Vt?=
 =?utf-8?B?My9HeGxyOXlLTkdMc0ZLandwREIzMi9KTE4xOEliQVQ2V1ZDMTc1Zm80dEZF?=
 =?utf-8?B?Ti9wY1FBNU5KSVNwbW45cXBTc0RTbTc3SXM5MWd2cGVxR1NtVDhXU3VybFJW?=
 =?utf-8?B?MG5BQk52NzVYSUdIOHczTjI1SkxueDlCZkNuTWhsN1ZadVJmMlJsSCtTRVhj?=
 =?utf-8?B?amRYR2s5SWNoWTZYSllkYk0zNFNQb1o3L2JZYlZYR3N6aTVJZkZGamtVSmRv?=
 =?utf-8?B?ZnI4T2IyQ3NlRGxEc3o5bXhSaDFQa2R2REZyV1djcE45QkFvd1ZCSDNkc01K?=
 =?utf-8?B?S2NPS3VwMU12K2ljUU5oUGlGWmVUL3p2QXZkU3JDYXZXcHphc21VeU12RWV0?=
 =?utf-8?B?N1R1QkI3TjZ1ZW1MaVZBaXB4eURwZE5PaVU0OXB6VWJiMUJlalY5djc0WFE5?=
 =?utf-8?B?NXFWVVJIR2wvWmNla3R3cGdXc3QvV3hrR2tUNnVGcTdiM0dRM3FpRGRVcW1B?=
 =?utf-8?B?M3lUMzVtZUV1R3lOcnJ1T1lWa096a1E4UndQQzZ1UXI3VXVIMmRpNVhtR2Ra?=
 =?utf-8?B?MmJmYTJXcmx6MFNseWhFR0Nra3dVbHpsNFRyUkFtdUhLSmdnYmx6bGYwWW13?=
 =?utf-8?B?YXZmTnBBb3ZXN1A3MFA4VEQ4MkNXaW1aNlFwTkNxSFhEejhsMnFacTRkd0tr?=
 =?utf-8?B?b05kZ2pmTVUvL3V4RnRWZk9UUk5JNFFYZWRDUC81VFJ1VmJMY1Jrc2R4eFdy?=
 =?utf-8?B?M0JXNmdzQXh2UTJDa25pUjZiSVRIOGpGSkV6My9lL29zQnA1Z2NlWEFPZkJl?=
 =?utf-8?B?NHRRSS83WG5VMWVBa3JFUzYxbFU2ZWh1bE01WGJURTVqbFNIalJTdkZhVXhl?=
 =?utf-8?B?NEhlcXVWRTRPdlZNT1ltcVdnM2hTK2IxbStKT3VkdFVPcXN4M1VBQ3FSOWxv?=
 =?utf-8?Q?rgZhG91uw6y9oyxJlV/SJsyHZKR1c/4c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2RteHBuZnJQaTZFKzJyY1BoNGhqV2d0dWt0NU4yRTFYZUl5QXl5LzZxRUNo?=
 =?utf-8?B?eXRSWlo2dTZSL214MFdTeGVZMEVpK2JLSjZ2UUM3TS9UZWJ1MzJ0TFo4QnJO?=
 =?utf-8?B?UUhWMHArcWZmRS9iZWFZS3RRRWhUMyt5WVFaV1Ura0VRV3Yxakp5d2t2RU5q?=
 =?utf-8?B?NVI3RklRcWxOSlBMeTdpU3ZQZUtvdnRlTFBQWVF3bDd4VHV3emJZL1ZHNHhT?=
 =?utf-8?B?b21TSzFEdjh0ay9leFJmbm52TGVYeUM5SFFwTTlRNXNVdkFqbFpJU29jRGxu?=
 =?utf-8?B?RGFGU01ieGk3SWZ0STQ3b0gwU1NQbC9kOWhUcEZEOUpoakE3Z2Q3bFYvbmha?=
 =?utf-8?B?ZXN3d0hSK3dqVFQ3MjBoZzgzb2hDY09CWUsrU0dhNG93WmlWRmlsVFd2Q0tl?=
 =?utf-8?B?ZWF4TjJBK2N0SldDQzBoRlRnREZ0ZnhoSWdKMnNUeDY1OVdyVE5LRTQvcHFO?=
 =?utf-8?B?QzVUcjdJdDJEcUQ1Q1QrKzNSckxzYTNXZ2ZJR3Yxa2EzRE9DajE3TGZhRmNZ?=
 =?utf-8?B?KzVKYVBoU1Y2MktXMGJOQmIvNTB6ZFJIUjNtNHgzclhva1lHcXg2OFBoajIy?=
 =?utf-8?B?VWpzNWJuSlQ4R3BQa1JVVGFXWjVQMHBkNDhjQkpEenloQ01FSnoxRFp3ZFBX?=
 =?utf-8?B?T2dNejhvbWpPaUVvS0c2dnMvWElQblVoRzFFMUFIZU9QOUlSRi9uVm5ydWJC?=
 =?utf-8?B?VG5SdHhUWFFtNHY5blMrL25maTlKR2w1QVBrRUtwZU0wTk1lZmE1ZlNUM0hW?=
 =?utf-8?B?Q1h0V1p2OGZlbDE5bTRia05xUlI0d3AwYks0YmhqVjVWNVhBU1MvVXROVHgx?=
 =?utf-8?B?aXVNckRzTm9rbEt3cmhrdlkvajFkR2s5alBKbExockJIeWM4ejl5aFJHVzdJ?=
 =?utf-8?B?OGNWK1pYWVlVQ1M1UGxUNThwbDJlY2w5Q05UMUN6c2JzUXdldUtwVDJjUEUy?=
 =?utf-8?B?ZmZlbENwNXMrRVdKQmRYb2VLakMzTEVQa0JpRGpnMVVjOUpxUVFBWnZGb21S?=
 =?utf-8?B?WGVZQnhGMW9VeUlmdDFQZlMxZ0JOY2p3SUN3aFIwdGIvZ3ptTVlEdS9zQXEx?=
 =?utf-8?B?MnVncUpXNEsyRlRpQUFJOUhkeW1vWVZaY1Y2UzF6R0Q2SjAwckxLQVUrNDlF?=
 =?utf-8?B?Rzl1ckE3RGRTR1pZUE1NVmtGVC8wM2NCZ1VueXN3Zk9ibWJ2N2xmN0huSnpC?=
 =?utf-8?B?Z2hJdVV6dXRSdG5ucnN0aXpETnFXemMzMGU0bmxSS0o4V1dYQ1ZTenRwZzkz?=
 =?utf-8?B?dHo1NmlyeGFwMVAvWWdBalJiVExvb3I0Wk53UTB3NnRIaUdPZHNUcGtsRDRV?=
 =?utf-8?B?d0xWUEVKUGpNVW81ZFg4UWlCelRKbzlJb1g0cTJDbVhBV3A3U2JVVGJubmFp?=
 =?utf-8?B?bnAzTmFwVVppR3NYektyRnc2RWVqUC8vTE1USFdNa2xRVythMjNPbzBLc1RO?=
 =?utf-8?B?aGdQYnFTdk1vSUMweDdFbStGZjNCT09CY3NHYXc1TTY3S2ZxdzRBUmpzYVVi?=
 =?utf-8?B?ZkYxK2YxMWd3VkRWR01qam1BblVQRE9xS0UrTXdmU2dxWWplQmF1c0hMd2cw?=
 =?utf-8?B?Wkc0ekV4Ny9HUmZZUDNGRTJhVERhVmhBMFA1MjZUa2JIdUxLem0wSTY5bWlH?=
 =?utf-8?B?V0Z2Vlk5UmJVcElEMjJkQUY1SzdPOW9CbDNCUnRaaHpjZ282NDRjQlZJaFVM?=
 =?utf-8?B?Z25lKzZOS1lCSm5Cd3FzeS95RmxlUk5yQWw2YnZTdnpsMEhQTnBjcnJRTjRo?=
 =?utf-8?B?Qml4VEIyREYwWmtwL05yUlhwa0RxS2JlSDdnWXZDQ3VEREZhdHh4TmZxZURN?=
 =?utf-8?B?dC9ORkdRekV1cm80QmJpRmtXakxma0g2TEU5N0FjM3NSeGVyM0x3WkhxQ2pn?=
 =?utf-8?B?N2pwOTUvd3E4dENNVldSQ2FDSi81K1JtRU9UWCtCS0JvNE14SzRSdmFYWHcy?=
 =?utf-8?B?c2FNeC83b3ltc2pFMWxpTEZHTGpPeXQ2YlRiWi94cFlWS2doY2MrWXZwWDVs?=
 =?utf-8?B?SXFhSkxKVi9ZeHZLcUZEUUh4OGRNaTc4UDcxUlU5SHpGWFBMcGdIUkNhc2ZG?=
 =?utf-8?B?V01JMnR5QlU2UEdubWdwK24vL3VQbXcwR3lHU0ROVUFSblpJOUpCSC9hQzBz?=
 =?utf-8?Q?5RloGKx3RouDbO4eMytCyNyCY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e827d8-7edc-4c81-2930-08ddfc9e449e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:44:44.6124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ca5BB3LpCvHsLb41lzDEz3mYssaWs9Qhw6/WMSM2pZUXksqp25re6hoLDB5ImcF8AqA7q6AWEHzmGnUxf5Pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF
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

On 2025-09-26 at 01:27 +1000, Zi Yan <ziy@nvidia.com> wrote...
> On 24 Sep 2025, at 19:45, Alistair Popple wrote:
> 
> > On 2025-09-25 at 03:49 +1000, Zi Yan <ziy@nvidia.com> wrote...
> >> On 24 Sep 2025, at 7:04, David Hildenbrand wrote:
> >>
> >>> On 23.09.25 05:47, Balbir Singh wrote:
> >>>> On 9/19/25 23:26, Zi Yan wrote:
> >>>>> On 19 Sep 2025, at 1:01, Balbir Singh wrote:
> >>>>>
> >>>>>> On 9/18/25 12:49, Zi Yan wrote:
> >>>>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> >>>>>>>
> >>>>>>>> Add routines to support allocation of large order zone device folios
> >>>>>>>> and helper functions for zone device folios, to check if a folio is
> >>>>>>>> device private and helpers for setting zone device data.
> >>>>>>>>
> >>>>>>>> When large folios are used, the existing page_free() callback in
> >>>>>>>> pgmap is called when the folio is freed, this is true for both
> >>>>>>>> PAGE_SIZE and higher order pages.
> >>>>>>>>
> >>>>>>>> Zone device private large folios do not support deferred split and
> >>>>>>>> scan like normal THP folios.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> >>>>>>>> Cc: David Hildenbrand <david@redhat.com>
> >>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
> >>>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> >>>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
> >>>>>>>> Cc: Byungchul Park <byungchul@sk.com>
> >>>>>>>> Cc: Gregory Price <gourry@gourry.net>
> >>>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> >>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
> >>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
> >>>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >>>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> >>>>>>>> Cc: Nico Pache <npache@redhat.com>
> >>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>>>>>> Cc: Dev Jain <dev.jain@arm.com>
> >>>>>>>> Cc: Barry Song <baohua@kernel.org>
> >>>>>>>> Cc: Lyude Paul <lyude@redhat.com>
> >>>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
> >>>>>>>> Cc: David Airlie <airlied@gmail.com>
> >>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
> >>>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
> >>>>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
> >>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>>>>>>> ---
> >>>>>>>>   include/linux/memremap.h | 10 +++++++++-
> >>>>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
> >>>>>>>>   mm/rmap.c                |  6 +++++-
> >>>>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> >>>>>>>> index e5951ba12a28..9c20327c2be5 100644
> >>>>>>>> --- a/include/linux/memremap.h
> >>>>>>>> +++ b/include/linux/memremap.h
> >>>>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
> >>>>>>>>   }
> >>>>>>>>
> >>>>>>>>   #ifdef CONFIG_ZONE_DEVICE
> >>>>>>>> -void zone_device_page_init(struct page *page);
> >>>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
> >>>>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >>>>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
> >>>>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> >>>>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
> >>>>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >>>>>>>>
> >>>>>>>>   unsigned long memremap_compat_align(void);
> >>>>>>>> +
> >>>>>>>> +static inline void zone_device_page_init(struct page *page)
> >>>>>>>> +{
> >>>>>>>> +	struct folio *folio = page_folio(page);
> >>>>>>>> +
> >>>>>>>> +	zone_device_folio_init(folio, 0);
> >>>>>>>
> >>>>>>> I assume it is for legacy code, where only non-compound page exists?
> >>>>>>>
> >>>>>>> It seems that you assume @page is always order-0, but there is no check
> >>>>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
> >>>>>>> above it would be useful to detect misuse.
> >>>>>>>
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>>   #else
> >>>>>>>>   static inline void *devm_memremap_pages(struct device *dev,
> >>>>>>>>   		struct dev_pagemap *pgmap)
> >>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
> >>>>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
> >>>>>>>> --- a/mm/memremap.c
> >>>>>>>> +++ b/mm/memremap.c
> >>>>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
> >>>>>>>>   void free_zone_device_folio(struct folio *folio)
> >>>>>>>>   {
> >>>>>>>>   	struct dev_pagemap *pgmap = folio->pgmap;
> >>>>>>>> +	unsigned long nr = folio_nr_pages(folio);
> >>>>>>>> +	int i;
> >>>>>>>>
> >>>>>>>>   	if (WARN_ON_ONCE(!pgmap))
> >>>>>>>>   		return;
> >>>>>>>>
> >>>>>>>>   	mem_cgroup_uncharge(folio);
> >>>>>>>>
> >>>>>>>> -	/*
> >>>>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
> >>>>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
> >>>>>>>> -	 * PG_anon_exclusive on all tail pages.
> >>>>>>>> -	 */
> >>>>>>>>   	if (folio_test_anon(folio)) {
> >>>>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> >>>>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
> >>>>>>>> +		for (i = 0; i < nr; i++)
> >>>>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
> >>>>>>>> +	} else {
> >>>>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
> >>>>>>>>   	}
> >>>>>>>>
> >>>>>>>>   	/*
> >>>>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>>>   	case MEMORY_DEVICE_COHERENT:
> >>>>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
> >>>>>>>>   			break;
> >>>>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
> >>>>>>>> -		put_dev_pagemap(pgmap);
> >>>>>>>> +		pgmap->ops->page_free(&folio->page);
> >>>>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
> >>>>>>>>   		break;
> >>>>>>>>
> >>>>>>>>   	case MEMORY_DEVICE_GENERIC:
> >>>>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
> >>>>>>>>   	}
> >>>>>>>>   }
> >>>>>>>>
> >>>>>>>> -void zone_device_page_init(struct page *page)
> >>>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>>>>>   {
> >>>>>>>> +	struct page *page = folio_page(folio, 0);
> >>>>>>>
> >>>>>>> It is strange to see a folio is converted back to page in
> >>>>>>> a function called zone_device_folio_init().
> >>>>>>>
> >>>>>>>> +
> >>>>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>>>> +
> >>>>>>>>   	/*
> >>>>>>>>   	 * Drivers shouldn't be allocating pages after calling
> >>>>>>>>   	 * memunmap_pages().
> >>>>>>>>   	 */
> >>>>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
> >>>>>>>> -	set_page_count(page, 1);
> >>>>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>>>>> +	folio_set_count(folio, 1);
> >>>>>>>>   	lock_page(page);
> >>>>>>>> +
> >>>>>>>> +	if (order > 1) {
> >
> > Why is this only called for order > 1 rather than order > 0 ?
> >
> >>>>>>>> +		prep_compound_page(page, order);
> >>>>>>>> +		folio_set_large_rmappable(folio);
> >>>>>>>> +	}
> >>>>>>>
> >>>>>>> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
> >>>>>>> is called.
> >>>>>>>
> >>>>>>> I feel that your zone_device_page_init() and zone_device_folio_init()
> >>>>>>> implementations are inverse. They should follow the same pattern
> >>>>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
> >>>>>>> zone_device_page_init() does the actual initialization and
> >>>>>>> zone_device_folio_init() just convert a page to folio.
> >>>>>>>
> >>>>>>> Something like:
> >>>>>>>
> >>>>>>> void zone_device_page_init(struct page *page, unsigned int order)
> >>>>>>> {
> >>>>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >>>>>>>
> >>>>>>> 	/*
> >>>>>>> 	 * Drivers shouldn't be allocating pages after calling
> >>>>>>> 	 * memunmap_pages().
> >>>>>>> 	 */
> >>>>>>>
> >>>>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
> >>>>>>> 	
> >>>>>>> 	/*
> >>>>>>> 	 * anonymous folio does not support order-1, high order file-backed folio
> >>>>>>> 	 * is not supported at all.
> >>>>>>> 	 */
> >
> > I guess that answers my question :-)
> >
> >>>>>>> 	VM_WARN_ON_ONCE(order == 1);
> >>>>>>>
> >>>>>>> 	if (order > 1)
> >>>>>>> 		prep_compound_page(page, order);
> >>>>>>>
> >>>>>>> 	/* page has to be compound head here */
> >>>>>>> 	set_page_count(page, 1);
> >>>>>>> 	lock_page(page);
> >>>>>>> }
> >>>>>>>
> >>>>>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
> >>>>>>> {
> >>>>>>> 	struct page *page = folio_page(folio, 0);
> >>>>>>>
> >>>>>>> 	zone_device_page_init(page, order);
> >>>>>>> 	page_rmappable_folio(page);
> >>>>>>> }
> >>>>>>>
> >>>>>>> Or
> >>>>>>>
> >>>>>>> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
> >>>>>>> {
> >>>>>>> 	zone_device_page_init(page, order);
> >>>>>>> 	return page_rmappable_folio(page);
> >>>>>>> }
> >>>>>>>
> >>>>>>>
> >>>>>>> Then, it comes to free_zone_device_folio() above,
> >>>>>>> I feel that pgmap->ops->page_free() should take an additional order
> >>>>>>> parameter to free a compound page like free_frozen_pages().
> >>>>>>>
> >>>>>>>
> >>>>>>> This is my impression after reading the patch and zone device page code.
> >>>>>>>
> >>>>>>> Alistair and David can correct me if this is wrong, since I am new to
> >>>>>>> zone device page code.
> >>>>>>> 	
> >>>>>>
> >>>>>> Thanks, I did not want to change zone_device_page_init() for several
> >>>>>> drivers (outside my test scope) that already assume it has an order size of 0.
> >
> > It's a trivial change, so I don't think avoiding changes to other drivers should
> > be a concern.
> >
> >>>>>
> >>>>> But my proposed zone_device_page_init() should still work for order-0
> >>>>> pages. You just need to change call site to add 0 as a new parameter.
> >>>>>
> >>>>
> >>>> I did not want to change existing callers (increases testing impact)
> >>>> without a strong reason.
> >>>>
> >>>>>
> >>>>> One strange thing I found in the original zone_device_page_init() is
> >>>>> the use of page_pgmap() in
> >>>>> WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order)).
> >>>>> page_pgmap() calls page_folio() on the given page to access pgmap field.
> >>>>> And pgmap field is only available in struct folio. The code initializes
> >>>>> struct page, but in middle it suddenly finds the page is actually a folio,
> >>>>> then treat it as a page afterwards. I wonder if it can be done better.
> >>>>>
> >>>>> This might be a question to Alistair, since he made the change.
> >
> > Hello! I might be him :)
> >
> > I think this situation is just historical - when I originally wrote
> > zone_device_page_init() the pgmap was stored on the page rather than the folio.
> > That only changed fairly recently with commit 82ba975e4c43 ("mm: allow compound
> > zone device pages").
> >
> > The reason pgmap is now only available on the folio is described in the
> > commit log. The TLDR is switching FS DAX to use compound pages required
> > page->compound_head to be available for use, and that was being shared
> > with page->pgmap. So the solution was to move pgmap to the folio freeing up
> > page->compound_head for use on tail pages.
> >
> > The whole percpu pgmap->ref could actually now go away - I've debated removing
> > it but haven't found the motivation as it provides a small advantage on driver
> > tear down. Basically it just tracks how many pages are allocated in the pgmap
> > so drivers could use that to determine if they need to trigger migrations before
> > tearing down the pgmap.
> >
> > The alternative is just to loop over every page in the pgmap to ensure the
> > folio/page refcounts are 0 before tear down.
> >
> >>>>>
> >>>>
> >>>> I'll let him answer it :)
> >>>
> >>> Not him, but I think this goes back to my question raised in my other reply: When would we allocate "struct folio" in the future.
> >>>
> >>> If it's "always" then actually most of the zone-device code would only ever operate on folios and never on pages in the future.
> >>>
> >>> I recall during a discussion at LSF/MM I raised that, and the answer was (IIRC) that we will allocate "struct folio" as we will initialize the memmap for dax.
> >
> > Sounds about right.
> >
> >>> So essentially, we'd always have folios and would never really have to operate on pages.
> >
> > Yeah, I think I mentioned to Matthew at LSF/MM that I thought ZONE_DEVICE (and
> > in particular ZONE_DEVICE_PRIVATE) might be a good candidate to experiment with
> > removing struct pages entirely and switching to memdesc's or whatever. Because
> > we should, in theory at least, only need to operate on folio's. But I'm still a
> > little vague on the details how that would actually work. It's been on my TODO
> > list for a while, so myabe I will try and look at it for LPC as a healthy bit of
> > conference driven development.
> >
> >> Hmm, then what is the point of having “struct folio”, which originally is
> >> added to save compound_head() calls, where everything is a folio in device
> >> private world? We might need DAX people to explain the rationale of
> >> “always struct folio”.
> >
> > Longer term isn't there an aim to remove struct page? So I assumed moving to
> 
> Right. But my current impression based on my code reading and this patchset
> is that every device private page is a folio. To form a high order folio,
> each device private folio is converted to page, prep_compound*()’d, then
> converted back to folio. Based on what you said above, this weird conversion
> might be temporary until the code is switched to memdesc.
> 
> I am looking forward to more details on how device private will be switched
> to memdesc from you. :)

Thanks, so am I :-P

For device private I think the first step is to move away from using
pfn_to_page()/page_to_pfn() and instead create a "device pfn" that doesn't exist
in the physical direct map. That in itself would solve some problems (such as
supporting device private pages on ARM) and I hope to have something posted in
the next couple of weeks.

> > folio's was part of that effort. As you say though many of the clean-ups thus
> > far related to switching ZONE_DEVICE to folios have indeed just been about
> > removing compound_head() calls.
> 
> 
> 
> Best Regards,
> Yan, Zi
