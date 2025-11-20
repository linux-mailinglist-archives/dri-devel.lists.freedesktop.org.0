Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA7C71ED2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525AA10E6DA;
	Thu, 20 Nov 2025 03:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="niAEVTKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D0B10E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7j3ez3vo0Lp4iWQD7VAuJKRn5J97vXnTMZTpqYT5duSIOXcEnxAhv1if4j1APvmsJ0iF9TeifrPKp0hGlebqLTNIg7cmHiSpEqlZ5ZNraX/x14pAjAZuW27L96UpX/r35a50dXKyJIsdn6OQTjPe7dYXtmofQOy1lU2JPTLLF8pdnmkRPHDnncOUMAR4jQ4k1gMxbzwYWVSNig/AK5ka4XrdQZoby/69quppqxxJ90MhLrCJpKHkSnHYtpFed/cYypQYaGyrkp3jskAV4aLxh4lAmkVuH/rWrYWIjQCXvuB5f63Ree9Eb/WzZrcWWbL2QWHtKSPVFwTCvL4uZpiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK4btPPY7g2HbdNv4D1dc5WjmP8kX/C3F+vSkC6551c=;
 b=U6qwTaAtmG74ZNv4zyqsT7wO+gK1uaL3k0CD9XJz2/BvRvgIwrWnLi82MPX9ODOFw4YLypx98n3Ojw3C+YTcn4VVm949poYYysaBzETvUipUwxQPdjdepV9oSuXe5dgKxeV1U4fGMV6ZskNI7SPZG6vDB6+BbFslflkALs0sSc8Gc0XAwkDpCn5ldUS0dGBn3VBeKGYE3XXboh+n2sMX1F2BlsA+FqfsBkWTcA14slB385RkPdn39dAGtBjPgrVD1tqFwQ9eH0Ip207Lv7RSDYzcUBz6delE/za0jN1k9wQsr631Yb0iZXF84saeWAMSxq4YNXRQtOkJc0rWipkHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK4btPPY7g2HbdNv4D1dc5WjmP8kX/C3F+vSkC6551c=;
 b=niAEVTKmrInxqYz32IHQ92ZUf0bJ4nUdFuRPNAtdVVcV+pDnZIPl34tPxV6KKghHYCyJNuLq7CgONqQfLBkqxEQVwTlCLYowRpQI+oqIoL4+3ireu03G1XeSHPTuMgZtghlx+xiyuxXxvZWGOtqIAwYFBpQVm2D42L1uBs7rFz6qo4hu3lQg2Oh2yzo1jzKVbLVgibxaA8jI0t0LaZFo5ABlBnNQ314ewFaMZkvTyqfebrkUEOcA36HP5YI3xxrRBzJTKi+ylVGKgCkqibnXg5CmxhlH9Q5zRNJxugGnsBhrXzz3LWe/Px5daeXP57gawxSXMkK1tlZDn4LwgKMw8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 03:07:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 03:07:17 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>,
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
Subject: [PATCH] fixup: mm/huge_memory.c: introduce folio_split_unmapped
Date: Thu, 20 Nov 2025 14:07:09 +1100
Message-ID: <20251120030709.2933665-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c635789-7fca-4dd6-5ea5-08de27e1e96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGJINVVVT2VWTHpRWVJpcER4U1VCS3VEUDMyMml3K1lpSFRlR1RhdmZzeGZW?=
 =?utf-8?B?UWd6b2hGbnVNdTRobldSMnlqTzJHdHpkU215NDJSbUdHUzhZQlZIeUUyQXJx?=
 =?utf-8?B?cEhGYzFzeUpLNHVLcS8vYi81RFQzQU1UNXpzbnk2ZDd3ZnNJRHYzK1dPRDRD?=
 =?utf-8?B?cEprbmhXeUQySm8yWE14cmozWUZTcFF2QnBGMklFSEJ6UmdUODlLd01QK2Np?=
 =?utf-8?B?ZTR2c0VTd0RFdWR4bFhad2p4Qy9XS1FiT215Q2VWSHRkRTZHN0p6a2R6OHlz?=
 =?utf-8?B?QzdFek5Wa1M3S1g5bGp2ZklER1o0Wkt2QTdmUDNDMzlLMXE3WXhsMENRSk1L?=
 =?utf-8?B?bmQ4ZEQwK0xDSUprRHQyZjVLeHJLMzgzd3dHRklBOUNKdjc2UGt4aXlOK2JQ?=
 =?utf-8?B?aUF3SFdQQ3pMWndsU0VqK3lXNnFxbTN6WGpsVVZNN0lheXNxWU1hY0txWWkz?=
 =?utf-8?B?M1lmRHQ0c0szeEU4OVNDdFYyLy8vbnEzcTVCMm5zaFpGN2I0VFpYeERTYWtu?=
 =?utf-8?B?Vm9JcHZWN25nZVl5dGNITE5tYS9nREJKQlpDNVF3WXRKbjhZM1FXT2xkQnY5?=
 =?utf-8?B?cXFLd2JrNENNVjJ5QkFoYk94RmorUVVLVitOVTU4Q2lSUlR0ajUweGQ5R24v?=
 =?utf-8?B?em1IZ21uZTRIU0NOUjdFVndrUnpDN2MzUUdQK0QyblEzeTJSWmxEaCtvcVlH?=
 =?utf-8?B?YjNyeEh2NDRiQTc3TEZXT2VJSEFSck9GeURRRWRLZkFkWkJ3SWpXNzlnMDla?=
 =?utf-8?B?N29MbGpDWldmOTltWXdvNU9xd1lTMFJQaUZ4OGZydlZxN1lCUWxOTWtZbDdx?=
 =?utf-8?B?czRXVTZVZVNrMUdiS2R0Wm83SExTNUdKdVR4dzZzSVJkUXRlTG9jQjFYMG45?=
 =?utf-8?B?N0o2SWdldmJiYk83aDdQb25heklvOXlQUlVFR3A0TWxnVTNPL0VyeHVaVWlC?=
 =?utf-8?B?MURneTZsbUd0OUljbHpxT21kWTZVd1ArWHNZZ2x5aS9CQzN4dmxkR2o2SW1q?=
 =?utf-8?B?MU1LMEVQaHQ5YUVkSG14TWpaU2hVUE5VS3RPMUFoY1pzbmhtL0gyNjY1bzVQ?=
 =?utf-8?B?dkFWcnZqM29aeE1IREZsdjJMcUpFR0FXU2pFbEUvZEw0YXlxK1NCNGdUU1Y1?=
 =?utf-8?B?dmNWQytVay9UY3FjTjVPM2pGQU1EU0hLMmxGRVZDbUJzNWZJRTRWVVF4TDlt?=
 =?utf-8?B?TEw5aHQ4Z1V5eDB3ZWFPNWhCOFN3SzZuUDFobnhDa1lJcjl1RlRJcEtoc0FZ?=
 =?utf-8?B?S2ZLc08zY1FXNGRlZ1dQK0V5MmpwZ09HSTNZWmVrNjAwck14QVl1QlZ0VHlB?=
 =?utf-8?B?TDdlRnlYKzVHMXVNTWdWdHk0cStRTldwcGovYUwyRVVBVHBNeU0rOE51azNi?=
 =?utf-8?B?ci9wNVNpM0NsQkkwYWtsSGVoYTh3S3Vmckh5bTJVQnJtdHFCeXBnU1FXMlRm?=
 =?utf-8?B?U3RpYTcwTlJxNVdFWHBoY1BDOXAzYzZPMXJpOGMva2taUGdzWE5Ob09jS2lh?=
 =?utf-8?B?N2VaR3pVK2c5YnVmbXZqcUUzL0FOcUJURGdSM3cyTEgvMUVDSkt3cEhNbUZE?=
 =?utf-8?B?Y2dmVDY5T3hISWlWcTdPRTdaQTBtTXVsNWJHWFpyVHhiS21jR01hLzhZc2V6?=
 =?utf-8?B?ZjlQUnZ1T3NEaGFvV05xNVFOYWpiT0hQSUFYOWtVcUxVUlJBWnpZOXRmTFlk?=
 =?utf-8?B?YWthZVNUV2RST0poMFdFdjQvUDRRUkZOK2FTbXdKUEVPRFFFUVZmMFNnWlpo?=
 =?utf-8?B?WUh0REUrRnhlTVVTbGhVUXBrZFllcHBvWTR2cyt5ZjQ2R0xLQkZ3MUVmNXM2?=
 =?utf-8?B?dXo3blpFQ0NKWlJMYWdVbDBERktHeGVZYkI1UHl5OU0rUk9SS2F1d3lZSS9o?=
 =?utf-8?B?eXFJTDcvOU81WVdCUjhoaGNEcGtRRTdwR0JBVWh5cnA1d096L0c4Q2J0b2NZ?=
 =?utf-8?Q?6ATECXr0/vseBDLTFsrx19sCR5HFK5cb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlZXQlpaakFMN2FLYXptd0dxYUZtcU85RmxRb0NOZjZPeU1LdVFmeUZRejRv?=
 =?utf-8?B?MVJiSzM0NUpwT3JHQkNFUXI1aU5reXVkVEFOTlp1cnB6N1VNQW5XenZhUUc0?=
 =?utf-8?B?YTNrVTI1SGxNakJJTEZBaHlGK0JQaXZidjFwQTVvT0FCNVhrdFllVWU1Rloy?=
 =?utf-8?B?UW8yYlp0TmppaHZ5RE1JMlNDTXVEUjIvbmN6MEhseC85RUVzWFpsOFVFOEhr?=
 =?utf-8?B?eG8xMk5KTHpURXh5WDF0U3pmd0F0TTVocTJaUW10M01XWk5hSW5XQ3ZvNXcx?=
 =?utf-8?B?U0EzM2hEY2xha3oyekFuVDNEaFNqYkdjRjNHR0F2cVJXZitVVitxTmNsdnVx?=
 =?utf-8?B?UGNLTmd0N00vTEdvbFpoYThYc0JoYnBsODV1SFJocmxQQ2FTNUVzWFpVNFM5?=
 =?utf-8?B?bDZHbTUxUkpxMFg0VXlpN2JjbjFmcTZpd1ZRQitLUHd6M1FUK0FPeklQQitU?=
 =?utf-8?B?U29lWkRKaThmUzQ1cjI1d2lEWHV6UVRjcEpWUjdzNllJZDdEUGhtZCtZTlRz?=
 =?utf-8?B?U2dNZTRnaWZ5UDM4L0pPeDN2aEpLbUt4YTJuZUVZeUY5M2VqSVdsYzQ0Kzli?=
 =?utf-8?B?TTBrTVZTTCtMdC93eVBCMFdmanZuNXNKWG9rWjNBVDczNU43YStkcDRmVkhh?=
 =?utf-8?B?WXlPMW5pdEhzZDgzWTg2cCszZnhvaFNxdXovd3JhazRWVXg5cGZEOWhoa0dJ?=
 =?utf-8?B?Zm5od2NMTHJhajVQMTI2ZUw4bnlNcmdxVm1pZWQwVFhjR0VoTlpQSjRMbEtu?=
 =?utf-8?B?Y1UybmE5RzhSVkY5d05tUEhCNjk2OWd4Rll1Nk44ZnpUNjRweUxvaTJKUkVM?=
 =?utf-8?B?MW0xNmMwWlZyaE9aeGJoMTR0dngvd1F2MW1UZGZsSnNHdzVmSHNSN3g5VEJR?=
 =?utf-8?B?WGxtWDJJZWFkQm9MSzlTNitTS21sdHpvcjNaQnA0V1U2Z1VITnVpTElDZWkz?=
 =?utf-8?B?ZW5MYW1hUDVJVXh2WWp2WDBlNEdXeXEvOGgvUElQcVh3aCtNbnJtQnY4eitq?=
 =?utf-8?B?OVlKNnVUS1cwTWRrL21OcElCZ0pwTm92L2RYaVJUQk9CUUh6eCtHNURhcUdz?=
 =?utf-8?B?blBFRVFHbmxZMTlVRjMzY3F5QzdFMkt3OVpaZE92ODZQRzZQVEhCeGVQZ1Ev?=
 =?utf-8?B?NU94YVFpckhBYk9jdE9DUUF6OXlPU21HcjA5aDVaYXVCYlNPMVN4L2VucllQ?=
 =?utf-8?B?NDBUSHp5N0NNMEtkemFwYldpQ0Uvb2FObEpsb1FiYUF1N0o1N3hIb3dKUFZW?=
 =?utf-8?B?TjZGZXQ1YVcrZmxTOTl1RWhxanFqMTJibmEzRWcySTRrUWhTY2dqb2pxeXlW?=
 =?utf-8?B?Smo5RGg5ZWg0MFJESm4wMVdXYVl1T1NJNUVyS2NRZG1HcEdONG5YWEl6NHVa?=
 =?utf-8?B?VEdTQmdObXI5NW4rbXJPdmhVbkdLdWFVMjhxTmxzVHNyWnpMK09ScWIxNlhz?=
 =?utf-8?B?TWM3Tm9QU1kzekJRK2tmSStrNFRMQWRvdnR6TklRWC9NMVQzK2VVeDBqdEhT?=
 =?utf-8?B?ejE2emFsUjJsRE44Yy9aVXkxd2ZZM3VYckZmR3BWV1VkaHdwZGYzQktvQ0VX?=
 =?utf-8?B?NktiYzZkNFFlQUFZSlRtb2pwUlcrYTc4V1dvUGMvWFU1Q2VSczdydTljSDJM?=
 =?utf-8?B?Zm10WTYzOVlLUGVrd2F4clBQYjNVNVpqRks5Mk8vYytBNWhPOEU1ZmNSS21u?=
 =?utf-8?B?U2t4enZ5UmFmQWVhK3JlRFg3Mkw1WmJDQVIwTHlZOWZ4MjhRdXhkS0h4YVBJ?=
 =?utf-8?B?RHZIU1JOanl2WHY4Ni9lUkxxTFYrUWJsTStBbERkT05GRUs0a05WeGw5U1Vx?=
 =?utf-8?B?MmpnRXJUR09GbWM0YWJlQUNGUEdaQjZCby9VVXlRTlFrYzh0ZFVHQm5Mc0xP?=
 =?utf-8?B?MmtHVnBYM3NXOSt1T2RRZEw5WTZ5Sk9relpsbjkrcTZ2MGdpUEtSV1FOQzlE?=
 =?utf-8?B?WXhRUmpkZUtCYWZndmR2dFpCZXY3Q2sxVHJqZWdUNUxMNU13bm5ocS8vZlM4?=
 =?utf-8?B?ZjF4VS8zQU1zdUZyR0VYMy9QRk5BSVdkQkFsaUxRd2d3T0FwdFBtRE44d1hy?=
 =?utf-8?B?akFidUhrdlJtZy8zZkJqUHd2V3cyZkl5cFBDMUtURUpoY2cxMnRveFA2bnJN?=
 =?utf-8?B?bEE3SlQxMHlTZzJQZFd4a0hoeUd4NDVnWWVGLytPa0p0R0JFOTI3eVI0THBI?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c635789-7fca-4dd6-5ea5-08de27e1e96b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 03:07:17.3208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESN3B3mC+G+kv1xzzj2gmYgjRE2LLnyZfNU/wS+C2/n/tgxBz/Zayi5MJM/RQ+YYRlEDCijLHSZPTp66XjhPQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
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

Code refactoring of __folio_split() via helper
__folio_freeze_and_split_unmapped() caused a regression with clang-20
with CONFIG_SHMEM=n, the compiler was not able to optimize away the
call to shmem_uncharge() due to changes in nr_shmem_dropped.
Fix this by checking for shmem_mapping() prior to calling
shmem_uncharge(), shmem_mapping() returns false when CONFIG_SHMEM=n.

smatch also complained about parameter end being used without
initialization, which is a false positive, but keep the tool happy
by sending in initialized parameters. end is initialized to 0.

Add detailed documentation comments for folio_split_unmapped()

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
 mm/huge_memory.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 78a31a476ad3..c4267a0f74df 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 	int ret = 0;
 	struct deferred_split *ds_queue;
 
+	VM_WARN_ON_ONCE(!mapping && end != 0);
 	/* Prevent deferred_split_scan() touching ->_refcount */
 	ds_queue = folio_split_queue_lock(folio);
 	if (folio_ref_freeze(folio, 1 + extra_pins)) {
@@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	int nr_shmem_dropped = 0;
 	int remap_flags = 0;
 	int extra_pins, ret;
-	pgoff_t end;
+	pgoff_t end = 0;
 	bool is_hzp;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
@@ -4049,7 +4050,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 	local_irq_enable();
 
-	if (nr_shmem_dropped)
+	if (mapping && shmem_mapping(mapping) && nr_shmem_dropped)
 		shmem_uncharge(mapping->host, nr_shmem_dropped);
 
 	if (!ret && is_anon && !folio_is_device_private(folio))
@@ -4092,16 +4093,27 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 	return ret;
 }
 
-/*
- * This function is a helper for splitting folios that have already been unmapped.
- * The use case is that the device or the CPU can refuse to migrate THP pages in
- * the middle of migration, due to allocation issues on either side
+/**
+ * folio_split_unmapped() - split a large anon folio that is already unmapped
+ * @folio: folio to split
+ * @new_order: the order of folios after split
+ *
+ * This function is a helper for splitting folios that have already been
+ * unmapped. The use case is that the device or the CPU can refuse to migrate
+ * THP pages in the middle of migration, due to allocation issues on either
+ * side.
+ *
+ * anon_vma_lock is not required to be held, mmap_read_lock() or
+ * mmap_write_lock() should be held. @folio is expected to be locked by the
+ * caller. device-private and non device-private folios are supported along
+ * with folios that are in the swapcache. @folio should also be unmapped and
+ * isolated from LRU (if applicable)
  *
- * The high level code is copied from __folio_split, since the pages are anonymous
- * and are already isolated from the LRU, the code has been simplified to not
- * burden __folio_split with unmapped sprinkled into the code.
+ * Upon return, the folio is not remapped, split folios are not added to LRU,
+ * free_folio_and_swap_cache() is not called, and new folios remain locked.
  *
- * None of the split folios are unlocked
+ * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
+ *         insufficient reference count or extra pins).
  */
 int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 {
-- 
2.51.1

