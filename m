Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22165B481A3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 02:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E3810E327;
	Mon,  8 Sep 2025 00:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ow9Wo3Vp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABCE10E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 00:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQu52xoVL7XsBho2Im/zSpw7BOfJLq4nZXWFTP/Hw1fKL2HLgNvYURSAv8GnKY5peJSJSYkuDQdvLPToOzWYXZgkx3g3LBmihAcQxLO2pcb6LcziAFeXbs0Eoz658B1vLSbqxEuNIurqb2YDD2kioNAMFNTJgkZjHcXt2/DWw+P7GUH0DW5BdTZJ1jLhKW0NXSqIXcCMYVympT5SPsXNGC+jlR+9RwLeCmzI8wUZIhdVu8xnSQBWgXMd1BReGito0rqeW/ibHr9ZEVe5kdCNwjFYTC4B66sRtGzoYZqMR1jKT+IM0NKtoDEJLqJ6B9oHCb44NRUjCItgJOKA1dvCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7Gb8kyHDWG3YTr/2xyERL2yoR14rvhNRW78EViJ0sI=;
 b=jVSPVCFKO6lZy9bPbQO8olCZU4WR8dPqRMkoJN75Gor1Kheet18prNZCVJ32oQqh9j66TCciqMxwxh5c9OXhWIW/yvn/8Ooz/naFM4cWUXcRHF6FbaKXwQE1GoZdIsOpTRZ0ggZhRyImZVq17PfOemfSuWF/FBH8frvdA8xG0Nio8kpW3wa2M+FvI+5ObgfRgx/vK6pwarM0ZhZZSjh3rdTlhuV01kvpeqzRVigZzVmdayIZGNXb49qW6wEEjw0APInUlBECuxJaD1XOgBwnuc+EBcB2xjm1HoTKWP4V+DQxF/DvqhRuFqjpo5uw1U6ewPnNYR6W3HECv5j/i+vOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7Gb8kyHDWG3YTr/2xyERL2yoR14rvhNRW78EViJ0sI=;
 b=Ow9Wo3VpFlrAOCE5XC5MzcfFQOhjE+nBGShtxs7Y1O9uQJFH816kGXCNHgQtTBMXUfEbUWCRdNCHvGUDfe/S8Uy+md79rlgg0cCf121oCceUc3+mlVSvCqujSlzrMgFVK5dzCJ8gduZgQOJdp2TRxVpe4zWRdo7qc7sGFtoRwxqjG+Fug4YQDoHoYlIqZ3X9MS2YGy+8ppvciE1mBfY3TsDPJbCFJsOoYFN3j4RTMSJdf1oZZBfke0D9EWov6kfDmdpDTdn0M+W8XPFJkedhkVzOv3BfHG0iEa6DvqqTP0wceuOmJLQuv0qILfpQqVX6HZnUYymEvJKawbNEDZkeZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 00:05:50 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 00:05:50 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v5 14/15] selftests/mm/hmm-tests: new throughput tests including THP
Date: Mon,  8 Sep 2025 10:04:47 +1000
Message-ID: <20250908000448.180088-15-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908000448.180088-1-balbirs@nvidia.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: 50867726-5469-4bf5-8067-08ddee6b77f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmxZV2Q3YXhvTlFEY28wYjN1K3lkOFVOVjhIdU1RMkJMRnZEdEIyVEx1Y2J0?=
 =?utf-8?B?MDdYbVRYbzF3ZVZYUnJXNFRqOVVxc3c3eG5PRFMyMENVMDl1NjRHYUlQbkZw?=
 =?utf-8?B?cm9GcWhPRjJON1FNWWFBcTViVGdpTHErU2s2SExTd29nSDlOKy9Qbm1QMlp0?=
 =?utf-8?B?Q3d5b28rWjdPblNJRkduV0MxdUVpZXllUlVZRktqUGJZUWxOQ3p5RmFtem5y?=
 =?utf-8?B?ckNucGNIY2NQenczQ2o2bjRUb3FNWDRXYVFCc1ZyVjJUR05qQ1JnMEEraWE1?=
 =?utf-8?B?OHRHM2tzZ2tGcUxjdW1XVVhQYlBiaXJEc0dxYjRPMElJMWx2SXU3NjBmQXFX?=
 =?utf-8?B?MTlhUUFTRm9XVlYzQzEvenNleUs1Z2JNUXc1eGtvK2JUdjczcWVOUFdkUW1S?=
 =?utf-8?B?dGRKQ0lUWVc3NlpHNnc4RHZsVDJVWlh5RGt4RE1rYjJHb3NEY2VheXVCRGhD?=
 =?utf-8?B?R3hwcjFTSWpUMS9HeGRQWExoMVZUTmpBcXhDVFRTOVN0SEZnYUVhWUtqZFpt?=
 =?utf-8?B?dUUwUHNHZTFyT0lLK0dhcXlGcTlpNHhtWW9NS3JCYlpzRlhkbC94ODh5ZVF4?=
 =?utf-8?B?UlMwRG1yTjdKUlFxOExCbHloWW9tYXY4RlNweitiQVU0eXEwTUF4YkpUQzBY?=
 =?utf-8?B?QXIwNFoxeWxWQ09vVnBYWWpMQktNVWVmOEQ1aWkxenVJYmhYUXNqWWlBMDgy?=
 =?utf-8?B?MDhFWEM5OWtOemhmcWF5N2hDNlZJdDhraFhab1NXLytQeERCTThrb1FOUndr?=
 =?utf-8?B?RDN3cTRrWkNJV3BQUnVLYk1aemhlL3ZJYXJlM0lPVWJnTzRYZXhnaWtTWXB4?=
 =?utf-8?B?SmROUFhSVlc0WXFyVHl0RldyWC9BNkdsTzJYT04vd2NjeVVhS015R3FadWk3?=
 =?utf-8?B?OHIrU2FiMGFib2Vxd0hsUW80Mlc2aGRhbE95b2Z6QXhML2hBbXdCNGZvVG4r?=
 =?utf-8?B?MlVaTWxOVWV4NngrYkhrTkFMS3VEc0RXVzVpZWhMMmJud21CWld1RHdScDdS?=
 =?utf-8?B?NUhEZFJxb1ozeGZyMzZvc2NHRm9LT0FTTnlmOElOVWY0Sis3K3lKSVNCakMx?=
 =?utf-8?B?SUxzcXlENEtmMlp6cjRudXhWWHZ0RjhVamhuZFFQdThiY004MG1JREhVTW1l?=
 =?utf-8?B?RzBJU2VIa3hlT1UvcDEzS2dnaU9IU3ZhK3NDdysraGxFbUFYeXM1YXV2YUVa?=
 =?utf-8?B?YmptOGZBQmJOOGpBbUdmUEUzb3kyK0VidGtNWU5rdHNpMkk0SnFiRDFUcUdk?=
 =?utf-8?B?bmxDakxuTHBhWlYxQ1p6Rk14VXF2ZDNHLzhFL0hIVXlLdjVDczdYVmNuMXhr?=
 =?utf-8?B?bUZ3SjR0Z0llcG15dlBLeElJY2Z2K3JVYlRBZWFhTlJ4YW1ya0d6aXBLNTFS?=
 =?utf-8?B?T0xiakYxdXRnaWgvdCtWLzlvaXZKQTg3YlE3cGsySmtWNnhSL1NjZXlSUUEr?=
 =?utf-8?B?dzBBTlRyWEVjQWNQdnBtMHBJN0h3UngyM2ZMaVlRQkhsY0JQeVBoZUI3NWIx?=
 =?utf-8?B?MVI5TFlWWUtzRHlOdzJrOW5UUlB2ZjlobEpRQzJYQUl4TkxUYnZ2WU4rTXVB?=
 =?utf-8?B?ZksyM0t0Zk13V2pCOGI3cjJTalFIbmpkb1JPRTBMWlFwRVNFV0ltQzYrTEZG?=
 =?utf-8?B?Q29EV1ZTclB3OGxzWWg5WXQwajd1OXNoZzRWTkpxV3pNNzJYWGVFYzFHUlNq?=
 =?utf-8?B?a1BKVEYwamdPZ3VZZXlHS3NoU2p5b0RZSU5Kd2JQSjZ4ZnZUaFZiUEpSa1NE?=
 =?utf-8?B?Wklrd1pyOGpHQ3lxaGZQNDR2MUU2cjhuYVMvZnZpWVA5bjBFdGhJMi8rTmdF?=
 =?utf-8?B?czhaY3FqMDBOVXBpZWZqREU0L0tKVUV4RGpKUy94enUwYWJzZ0gvU1BrUkZm?=
 =?utf-8?B?NHhlaVBQbWtjUmcyV1FWVlV6QnpXNzhTUDNYdkIvWlZ6RlJTQ0JwRUtBdkR1?=
 =?utf-8?Q?JFWWkJTydKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkdwR1M0RmxXbFBEVk5RMUFKZVRhby84c3ZpRVU2cTdlM1E2VkYwWVFuc0h6?=
 =?utf-8?B?KzNwK2dWTkNrWFNncndKZmRITEsyVTIzZExXT0lJbWNjQ2ZVRzVRT29hWVNE?=
 =?utf-8?B?VW1qdUI1ZXYyK25seHp3RWlVcUd2ZDdsRG5ic2E2YmlGT2cvditESTFIR1NQ?=
 =?utf-8?B?dlR5TitQUWk4Mzd1bUF4MloxU1FHeHUwUE51USs3Rk1oRGxqNFM1MmM5YUt3?=
 =?utf-8?B?MkVhd2JVTDRMS2lHWVdoZG1VcnlqVWJRM2R1bHNSV0NvWW1ucHFnWHFrUWZl?=
 =?utf-8?B?cGoyQzhlbGtzcVRQa2xVcmMwcG5NZHc5dFphbzlMcXl3TDF4VStGTkthS0Fw?=
 =?utf-8?B?Z3RkMHMrK245WEp0OEFwMzN5elRka1JzdSt2Qjl2WnJwakdNZllING8vcUVW?=
 =?utf-8?B?MHhOVEJLaW84WVFyc3ZzVGJNdGxXdXI0bUcxMVlUL1hrZDY1ZmJmSHdyb2k1?=
 =?utf-8?B?REhvNEozT2lWdVVoTGduWWJnbmdEM3diNktRN2YvMzIyZHBEVFNaV3R5WXRJ?=
 =?utf-8?B?enBmNXV0bUUycTgxTmE5LzBtR0ZkU3JqdlcwZ2FiVFZGdDhrR3FTNThMOGFp?=
 =?utf-8?B?dGNIanUwNnUxNEU1WjNnVWJXN0c4RFNhNENHZ1lRcndGMzlrckw4Ym5RSjhR?=
 =?utf-8?B?QUpKRmV5a1Z4V3RqaEpObTRLM1E5SXRzNzM0bEVoZnZTbTZPY09wUlZua2o4?=
 =?utf-8?B?MERkYVk2eWtDUVl5dW5FeWRIa2xLNGJFQlVWSUFKTEtlaVc0cDJCOEtWaG8z?=
 =?utf-8?B?aWI1Smx4clJ0YVNDZHJxaXpVRW9pUTVjNHlwcERydXRNZmx1aDR0dHl1Qks5?=
 =?utf-8?B?emQ4TjIzWDRFS0E4NkR0UjcvZ2Q1L1dPaG5tWEFaV3UwRmgyOWFIbUdSSitC?=
 =?utf-8?B?eE15c0h0ZlEzSUVHcXBLR3dMZkx5MDRLelpxNEkyd1lYbEwyZHRhSDgxRU9G?=
 =?utf-8?B?QUxyT29XK0pCRmc2UFhobi9vOGF4T0Q4Z2NtWC9IT2s5b0VXb1lkSXVLRzd5?=
 =?utf-8?B?bnZhU3ZVbkxnUHRtaFZhc2ZVVFRoWjNrcXlIR3lpNXh2VkJhK1FXWkZMM3Zm?=
 =?utf-8?B?R0pUU0s3YU1oQlNwWEVDU1ZkcjhHQWJpM1V2aG1GUUM4QlFQNmViVHlJdkZn?=
 =?utf-8?B?emlLOWh3U1hzYTl0M0s1UmptYUNsTVBuQXYzc2ZCUXZ0dE5FT0VhSVRTbWox?=
 =?utf-8?B?OCtRVi9FTzZBb0JjSldlMmwvc25kN21uQ094Wkszem1NaStZeDM5K1FjYXFM?=
 =?utf-8?B?Q0psWUZ5RUlsL0g5Y05vOTM4Sk8rNS9ZRDVoWExlcDJPZFBNQzFyVUVhZ04w?=
 =?utf-8?B?SVBQcVJyUURMK3VCT2s0MG9wK2lpT3lvTnIxU3FOZ2xaTENDamIrV0orTytq?=
 =?utf-8?B?MS92VDZoeGdXeGtSSkdFZzU0WmMrYklxYk54clJsLy9mdzMrSm04aDBReXYz?=
 =?utf-8?B?WVFYUWR1SHdzT1lEKzFESTJGZ2xXZkpMY05kdnZRUm82TDgvRUt1YVdLNTk4?=
 =?utf-8?B?b0dmVkx0ZWYvZlNPVDRnRDZOU0NRdjdRVmZZUjErSklJeEwrd2kvMDk1T1JT?=
 =?utf-8?B?cDNBREtiL1VJUDBPTmFFcDYyV3lWRFFSclJrYzc3V2R3ZmEvc0hHK0c4YTZk?=
 =?utf-8?B?Y2RFckh4b01hMnBMK1ZyTThrK2dKdmVDSHlKeWRiN25XV0ZQNndRS3k3a2E4?=
 =?utf-8?B?ZXgrblpjMXdScUZ5RzdydXg5Y0ZBbmZyRjdxS2VhT25sVldla1RWZ0VlS2VB?=
 =?utf-8?B?em9nOEZZRG0xRGpBRHR4UE14NHRiYTBjeTdvcjNLVi9qZXZoYmR3MHBkdWhR?=
 =?utf-8?B?cTlqZ3ZQYlBnaFNuNmkrK0VxMFI3TkN6cFlYa2dJM3VXM0x1ekJQUW11V2pQ?=
 =?utf-8?B?WTJoLy9kMUpDbHdBVnVkbUdHejhmR3hLUjRMeUttOVlURGVNZmVJeld6bFRR?=
 =?utf-8?B?NlllYnFOL3NrWm1tTXh1cTNOdjcyTktFK0IyUmk5akdGVVY4OFlNckNCL1J2?=
 =?utf-8?B?eHIxdzVuNjhoNXdIeFV5dVB1SG4xNjdBMDNaSkhLa1FuaGwyVDdwbStTTVk5?=
 =?utf-8?B?eUJZWjB5WXF0c1ZORkZiV3J6S0UyNDFpZkR2b2JSNG5aMFQ0b2VrOFNITUpz?=
 =?utf-8?Q?/xi54znBatk0inGHJ2WkD0Kf1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50867726-5469-4bf5-8067-08ddee6b77f2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 00:05:50.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hpYp21lmWv4JX83YWmo8Gm8Y2oQfNS57QbFrysUAio/QY1ZzZ58enrwTLTaXoD8jxXKj07ntEYw5MezCLh2IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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

Add new benchmark style support to test transfer bandwidth for
zone device memory operations.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 0e6873ba5845..96d3b994a93d 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -209,8 +210,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2658,4 +2661,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

