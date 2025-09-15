Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EECB5765D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA1E10E410;
	Mon, 15 Sep 2025 10:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PMwT/arB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B5910E410
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHLDXdvLSsmiAksPdQhHxtFA711b6w8W6ExPynmyymx7D+ZMtfbJLztIhXqz7DPDpARDwoPQrlHF74r4ukT1th8QKpuTl79I2w4YhAExgdHeC+TdbBhU7fimg2Th2HdPgKFJPjXA0AKad8tkmC2Ykgghe0+DFLmwQt/hRxyEE6ov4XVcbYaOmC0aSqMUihLc01/5EfFSbA9v4yOSyJyMHJsvpTqlneTK7aFvsZJtQSyhJbbKpntXVMbgb7czAFHay8V3AEZWrsOS3qdeE2DbVOMiQk+AoN2GbPB3nvFdEw0AX/PVOHS35zHdWAMsFj3OffaxlcsHnsCNVYAd/A2jFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lada78JN06KJEMB9CtIDImOPHqUgP3/2Itbhp2VeBX8=;
 b=RU4uxhkFQWIQq6yZDEzECo1A0Lgd8kl31JEbJ+4kHrYmA4RTxUwogMMDjmPJzZM6+ABPuiqkYOAQJ4xZXGlmNL3Sq0MLNVlu7H58NxWjyb40tIBl3NfwD7SFsG4wIR45qzIhqZ4JEZnhB2NldyqHaQQbqJS8leTCW/cEy7Tk/hUmVvRTKiEVkVUFFh267vdAosmjVE1DB4+7WeZjyn5bMEb5j5SMG2rMLIYirooben+8+vXDBwUQGgetZaTO2xvYqHr7uIWrs1olYRdY+GA2RidGHORNgSyCCT55X5ta0h7pd6VP9Le5zLHbToPIOf2Dzy2JYsrsoNm4Ct/V4Linng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lada78JN06KJEMB9CtIDImOPHqUgP3/2Itbhp2VeBX8=;
 b=PMwT/arBIXHxrzc8MXJFLVw4k8UiZIkcm1aSsVpF2Vfrsu/4dNWP0pUrOsnFg5LhHqmzcjwfTPiRsjaCEvBOarD3PmhISUZM+M704Fh6szQID2iS4BeeHD/VhQbNS+XVm6qPc2vHuxuu9pE/0Pib/6A5CxRFsiMo7jQiark6LAvIZPIJQ3DXb7Otv/9/IqmfsvsJggcb3Mu+AXe7mQZftnaE+G10sjXrfgFAB4eksXcVrgFIl6liJLRoYudAo4+ZraJiCvGjmfRotCdodHwRu+JgnT1VYv/lQiHDoArS+OoxY7vaGqxrnYK++mglIvlziKawnFsJqxdxyVmCVlWLEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB9728.namprd12.prod.outlook.com (2603:10b6:8:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 10:31:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 10:31:51 +0000
Message-ID: <37196a41-77ae-4579-97a2-2c7a1eb65bae@nvidia.com>
Date: Mon, 15 Sep 2025 20:31:44 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 07/15] mm/memory/fault: add THP fault handling for zone
 device private pages
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-8-balbirs@nvidia.com>
 <d4ae7f61-f2f9-45dc-91db-4de7f3127744@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <d4ae7f61-f2f9-45dc-91db-4de7f3127744@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 52eed491-9c0a-4d96-1184-08ddf443156b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHBwQlhBRHpSV2FIb0Zwelo2dnkxdjFaMUtwY2hGK2k1UldJT043VkhOYVNt?=
 =?utf-8?B?Y1lqb0pJTklNNWxsSWNyR2NhMmJoZjBJeHhIVlBUSHlMY0IvT00rUEVNRC9t?=
 =?utf-8?B?RUhUd3N4c08wbUFaM3RneTYzaVg0Q1g5MmdCZ25SWXhOMm15aW5xMUxiSmN2?=
 =?utf-8?B?Y1VERnhyVGJ4a0R5RzJXbDEycXlYelFpeG83aWk3YnY5NTRTeHJ0U3pPbjFv?=
 =?utf-8?B?Y0ZqbXBEclRHbVhSL1ZBS2MxdFJhWkFCQXpDcm5aTXlxMnRWNVNNNzBsZjlj?=
 =?utf-8?B?aFNUaWIrcG1MOGhjaHVjUUZYRDFRS1VHU09kZlZ4K20xZDJQWDBrMnV2MUxQ?=
 =?utf-8?B?UGh2TkVmVWdWbnBnMmNQazVCV3pyemljYjR0TEs1ZGJyY1NhWFgyd1NIU1Ra?=
 =?utf-8?B?elg4L2JxTmhDcDRDUnZCM2c2MEdIZCsvOTMyUnMzSFA3ZXllTXVlRmJmUW5a?=
 =?utf-8?B?VjVJK3Y5OVR2TW41b3YzN3A0RnphbEQraWFkVWs1clkwRFM4bVdVUXBTOEg0?=
 =?utf-8?B?WGY1MXh3L3VVU2JTN0N4WXZVd2FxSnIwVDJ1dWJ5WkVXNHNCNjhlNHpWM2hO?=
 =?utf-8?B?SE1GblM1T1N2c2wwRWFob0Jqd1lwL1E3Nm9VSmlUaWdIeW55cXVYRmloT0xG?=
 =?utf-8?B?OGZTWTJaSUd0NGROSjhXVXNjNHQ3eFlScE9BeVhKdVFYTnlTVk9qZHVCUCtv?=
 =?utf-8?B?T1oyTkkwTnAvdHhtV0NFS0d6QUVQTGtydkRHVXZTQ3ZXS3JLZmc5T2JVa2s4?=
 =?utf-8?B?aUIxT3Y2UFluOUdGTllseWkza0gwK29VVnhiU0c1Qk85N2dtckhoWkR5Wmlx?=
 =?utf-8?B?L1lNcVVKUDBhTHE1WjNlS2dlQWVQY1VmeEFJTzE1YTQ1RHdCNTNQUFNPejQx?=
 =?utf-8?B?R1FKT3FldmFjTDFodm9mLzM1c2tKVEFrUFRFY0pmTEJoUFJqQzNTc3JGamJn?=
 =?utf-8?B?Zmw0WVkvNnZxd3l6eHRtTUNBOUNITCtmbVFyTWpaMCs4ZUkvbys2RUxZN1VN?=
 =?utf-8?B?bFBpUWdzR1BZY1p6eDNZUVloS3U2cW9MTUJSek5mckluaCtiWFNKSUZiM1Fo?=
 =?utf-8?B?Ymtpdms0NjZvSGNvMTNkYk1QWWhncUZWSVhTN3cyOGpTNUhzNlp4T2hMRklW?=
 =?utf-8?B?WmdwQUJOZ2VCRWd2WWFhYzhXVlp0R3ZaNWM3Nk11Q2VJbjA1Yi90S0F0NXZF?=
 =?utf-8?B?bm9zc0hBZUpuMmFNdnpGT1pZT2VPbUxTTVFFWG9jbWJDRERuQW5GNCtBWTB4?=
 =?utf-8?B?SnpVR1pyU0JHMHdXdmFZU1E4VzB1QWdwa25HaFJUWi9DV0pvQ05ObFc5dHBH?=
 =?utf-8?B?Y2ZlN1psWkVLYW5lNnJHeTMxdGtScWJrUW1pYWFwMUsreCtVZ2E1TTBpUGh2?=
 =?utf-8?B?STRURjhEUlhFWFZYbDdFLzhwRFBZSlo2WnBqVGFYenYwUHBoazg4T003M1pB?=
 =?utf-8?B?bVkzTU44OWFxMnVtN2taeHRmMTlhb1hMd3pZaGZrUkhldjlCcDdIYTRnOFo3?=
 =?utf-8?B?YXh1YnAvTVNrTUNjSFNtS0FhZHp1VHh5REt6VFZ6R08zWHp1cVZQOXdSODBP?=
 =?utf-8?B?OHJQTC9zNU1tR1dLUzdMT0VETU9hbm9VQlpkRkVMaXhXNGZJZUhSa2Njd2Qr?=
 =?utf-8?B?MGRHRTk3MWZHT1BUZVdVd041WVcwQmZFS2lqczNseEpiK3lRYXpTRzZjd1Ax?=
 =?utf-8?B?aUw1a0lYNDdXZ1A1cFEvOHVld1MrQ0tGaEtwajNVcU83TkdlNkdmbk1TU1di?=
 =?utf-8?B?eCttZmdhUUsrYVpaWEppNy83T2JGdUwzWnpYaWF2b1lDRFZnQUpFZ08zQkda?=
 =?utf-8?B?dGhXUkZPUTZKZXlmc2pjK1p5NXErUHNGdVkzeFhZYnoyNGl5TXhMQ1dtZmdq?=
 =?utf-8?B?ci9OeTFhS2VMSkdiT2xOOEtEZUNyRlJzWGR0QVdDdURGOU1RY25Pbk82eHUx?=
 =?utf-8?Q?jLmDDwqF7gw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJ4T2tSdC9tOGpITld1VGszTUhOUUEzdGVsYXE0SmhoNE9vbmx3Smk4YXYr?=
 =?utf-8?B?OWswWnV0M3ZhTFppeHFMdzd1ZldocGVvVmppNytuNkhVRlBZK2hDMXBRYUl2?=
 =?utf-8?B?M256OWJyMjIraGJQRi9sV2NOT05NSHgvUEZWQkJTNDYyLytNNHQwT0RMaE1Q?=
 =?utf-8?B?K20xTjlCQWdLRld2em03Z1hFNlZKWnYrN1hWOEFQbUMrR0hHdWVkWmRDN1dM?=
 =?utf-8?B?OUhsUTh4UEhqckpjSVVBMTQ0MkRpY28yWWRNamV1SXpwUjJ2djRNK3lZajE4?=
 =?utf-8?B?aTc4dlhQNGlTUWplWHBSQkRjaG5hdDk3QzhBaWkwMkNBeGd5NmM3VGtMbUt4?=
 =?utf-8?B?aDAzcHBlVVdjbmVrSS9IZzVoYnZ2YUNOK1lzU1dxVHQ5SnBjMjIxeE0wZlpq?=
 =?utf-8?B?S0tqUDE1QlFzbVlRQkxTRHVuVmFPRGpNTHRyM0h6bWZNOUs2NENDNWl4VVhq?=
 =?utf-8?B?NndkemZSOS9NZ01mNUZxUVdnYU9Sa244SjYvdGdXNjVIQ0EwMXgzYVJrTk1K?=
 =?utf-8?B?aG9pbTNURjIrekNRbVBlbnM5SXM4R0tpVWVraUVyN1kxeGRvWUtQU1BVbjhr?=
 =?utf-8?B?cmlZN2R3T3BxWW9DY1RudW5JTUtCMi9iTW1OZGdUbWZHQjZwbWNBSmpvYWRV?=
 =?utf-8?B?bE45T1hpY25uMXJmc3h5V280ZFo1aVYwTEg2Mjg4TTZZMjYxYzlhQnd6M1Np?=
 =?utf-8?B?d09WaVRzS1JQYU5CaVhCSUdSbXBDaGpQakdRZkN6VmpHRVRTTGJ6bTVlNjJ2?=
 =?utf-8?B?WXRtZjFWcjlraS9pc3JqQ3B2NTg1SS9kalg5RWd3SXIyVytITkNzN2prMnFj?=
 =?utf-8?B?eUowZXMwK0xpMEk4THk4aFhmNkRicm13ek1pVWpuQldSaStnUFJCUVIxSDVF?=
 =?utf-8?B?Q0JPczBpZlVKOGVPZGF0c1poVmVFK0JQRDBJZmk2VldPbFFiUVl1Q3lmbFZP?=
 =?utf-8?B?ZWwrVGtiMjdhMHF1Y2k3THVJYXJxM0N3VTBhRVJ0UjY3bC9YUEdOYnkvbUJs?=
 =?utf-8?B?MjJNVFVFaTZnTUdORmJ5a3RVZThISytMRDFqSEpTbWgwVUJDOXd3R2pMRDlI?=
 =?utf-8?B?akhsSXYwSHR2TkRSTjEwRDNjVmJyRG1IRkhhdFBFYUtaZjQ0UmFmNkhiUHRw?=
 =?utf-8?B?d2REUzZXVDMvcmt4aS8rWHE0NjZsaHdXQVJxQ0NvSUJTeXl6LzdydDdOMWE0?=
 =?utf-8?B?SFJmZlFBK05VUklFNGtBbHBtZ25kT2pROEFFSjJCRGY1dXVxbnBCSW1XajJS?=
 =?utf-8?B?aG9VVCtjQjBQMnZxUlR0Rk5maFlwL0hxZmpQeStiL0MwWENZY1pBc3NFY3lG?=
 =?utf-8?B?eldYbmxEcXV4eWxvUW8zQUpWVUpRRXQwOVZpT08rOTB2c1pVYzlnMGk2ZnBW?=
 =?utf-8?B?RThWVnk5bFAvd2NLQTcrWEJ0TkVZKzF2RTBJY2pwNTFXVUkyNWs1ZkhteTdy?=
 =?utf-8?B?ZEsra0lNMVJVcXdRN2VROUZDQ1ZNMStOVHRTV3BiZE1CWXRjS2tONU5pL1V0?=
 =?utf-8?B?cXRRTTkyL0JOek1TN0lQeFpqMzVJb1FBc1lrdjVoSFNuNlFndFZuWEFITTJa?=
 =?utf-8?B?SVhvVFkrMUZFMm1GdDBDTFQyVUNvZEJweXEwUXk4VFppSUpIaG1lVTdIQmVn?=
 =?utf-8?B?eWVic3pDYnRuMDRPak5kZnN1MnRUVFZQU0p1dzBoVGVyVnNGZmtCai9xaTNi?=
 =?utf-8?B?bWpRblAxbWV1UHB0cXU3RVZnbjJnYUtETkpiTHpXM2NFSWcvejAycm8rU1ZC?=
 =?utf-8?B?bFVmcU01U0dJN2NQdzVWeFFtTkluVUVndVNrdWV5cU51MytEYkJNSDdZb1pO?=
 =?utf-8?B?TEZSZVM3RUZvTUJSbWtWVDQzcTgzVzBLQkpyYXg2WCtDRGE3djFYOXgxd3Fh?=
 =?utf-8?B?cXZndjNYdm50OVBrZDBsV0VEQXVsYnBUTU16d0lwN2IrMGRaMVQvYUYvZHZm?=
 =?utf-8?B?cEEzQlIydCtIdTFoSE15Y0RSYUdXR3ZnZHJWanNyZTFVSjNrVDBzVUlQek9p?=
 =?utf-8?B?VFdON3ErdExKcktaQW1OdGtHSWRwVGU3cjFOdEh6UWt4VmQ3UEtHcWF3Sldo?=
 =?utf-8?B?L3dRbjkyOE1ETUUwSEErVnpmR3pEa3NDanFpdGwvbFZ3Vk1GUHpjYXhVSXFr?=
 =?utf-8?B?Q0xaaWNOMGM3NzJmMURFSlNDR1BlaXZDenZUaGliU2lVQTU2YTV1Y1JMcUs4?=
 =?utf-8?Q?S1tV5182rtXHRoLTIaD2Exe+CV9SigwIpMLcI3epmeTH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52eed491-9c0a-4d96-1184-08ddf443156b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:31:51.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWQOvTn4+IDhuYbZpc3DFmsvpx4kvKzMQ1PRtXzO7xthKFjtYNVG3WgJDv1D6NndigzlYjKzbnvBOZPTrB8+xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9728
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

On 9/11/25 22:42, David Hildenbrand wrote:
> On 08.09.25 02:04, Balbir Singh wrote:
>> Implement CPU fault handling for zone device THP entries through
>> do_huge_pmd_device_private(), enabling transparent migration of
>> device-private large pages back to system memory on CPU access.
>>
>> When the CPU accesses a zone device THP entry, the fault handler
>> calls the device driver's migrate_to_ram() callback to migrate
>> the entire large page back to system memory.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   include/linux/huge_mm.h |  7 +++++++
>>   mm/huge_memory.c        | 36 ++++++++++++++++++++++++++++++++++++
>>   mm/memory.c             |  6 ++++--
>>   3 files changed, 47 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 23f124493c47..2c6a0c3c862c 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -496,6 +496,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
>>     vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
>> +
>>   extern struct folio *huge_zero_folio;
>>   extern unsigned long huge_zero_pfn;
>>   @@ -675,6 +677,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>       return 0;
>>   }
>>   +static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
> 
> Is this a VM_WARN_ON_ONCE() or similar? (Maybe BUILD_BUG is possible?)
> 
>> +    return 0;
>> +}
>> +
>>   static inline bool is_huge_zero_folio(const struct folio *folio)
>>   {
>>       return false;
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index b720870c04b2..d634b2157a56 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1287,6 +1287,42 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>>     }
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    vm_fault_t ret = 0;
>> +    spinlock_t *ptl;
>> +    swp_entry_t swp_entry;
>> +    struct page *page;
>> +
>> +    if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
>> +        vma_end_read(vma);
>> +        return VM_FAULT_RETRY;
>> +    }
>> +
>> +    ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>> +    if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
>> +        spin_unlock(ptl);
>> +        return 0;
>> +    }
>> +
>> +    swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
>> +    page = pfn_swap_entry_to_page(swp_entry);
>> +    vmf->page = page;
>> +    vmf->pte = NULL;
>> +    if (trylock_page(vmf->page)) {
>> +        get_page(page);
>> +        spin_unlock(ptl);
>> +        ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
>> +        unlock_page(vmf->page);
>> +        put_page(page);
>> +    } else {
>> +        spin_unlock(ptl);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   /*
>>    * always: directly stall for all thp allocations
>>    * defer: wake kswapd and fail if not immediately available
>> diff --git a/mm/memory.c b/mm/memory.c
>> index d9de6c056179..860665f4b692 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -6298,8 +6298,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
>>           vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
>>             if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
>> -            VM_BUG_ON(thp_migration_supported() &&
>> -                      !is_pmd_migration_entry(vmf.orig_pmd));
>> +            if (is_device_private_entry(
>> +                    pmd_to_swp_entry(vmf.orig_pmd)))
> 
> Single line please.

Ack

> 
> But didn't we have a pmd helper for that?
> 

This is a single if that handles is_swap_pmd() and then is_device_private_entry() and is_pmd_migration_entry()
under that

>> +                return do_huge_pmd_device_private(&vmf);
>> +
>>               if (is_pmd_migration_entry(vmf.orig_pmd))
>>                   pmd_migration_entry_wait(mm, vmf.pmd);
>>               return 0;
> 
> 

Thanks,
Balbir
