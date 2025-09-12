Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950ECB541D8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB0210E42C;
	Fri, 12 Sep 2025 05:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LVawIgOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAE110E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqWx9tq/v4nyDLKb+8gqrmhx+FLl6qK/HA/fNy0olFMhLu5RqmGMMd+n22WnMWE0apff9P2h8MU4rHBFsEiKTCMPDXpFdsLHpWj28CQiMuDqWRq3NCofcoJ1VHBd6iYyolXmjqeoidtmWSe3LTGBdO2q+Mxp4uiNi1WHVXDuH8xV6/UOfw0zDzlteZsTfjvH8cFFoLD+iXw6xYHwOE4A2/DlSsYecHO2/pWxaHRNqra0eBElXqaQdhfy9vka6oQC5m7Le0C2IapkATadX4W3lIVUhwZIOed4yQIiM60DuuAQ+gMc+l8dW7hW/ZfS10Y0jy+Ekkvp6fEYtCEjHClFDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shYW0/0Cb33urwRim0LXX4Dis0iSZiRz7cmDqKGwBps=;
 b=GKjdqBiBu+c3vhuhDcEzbuxs/o4nCf+wi0pWZFSiz9pLA0L/Y5U9/R7+lARhUct5T2MtxrlFV249HgqSAIZzf4HnqfFalgjIq7kYf3KQOub8PAYxwWyurzQzP6U0y0eAD9C+fCpTwkcKFgd1hyDLrXbcH+Nif5f0Kva5r6AoIjzngLWdYThQ5upwGPo44gKXImcptkeKuTTtHx9bto69Db2N6rjVp1cRzmrvw3Vp3V3Zb8g7TYwMZl42qvyIYTZTDtCR2ZFgVrkQ70N8fh7dzr396802qzSLifpaicVnWDmWXmeGfN++8hiNoHEewU7lHExPAvfFL9z3NTbx87UUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shYW0/0Cb33urwRim0LXX4Dis0iSZiRz7cmDqKGwBps=;
 b=LVawIgOqmMSLgyF9swcuaDdBVP1E62pc2P0hYTRX1EAIFTKbFZw4CjIBtsENnTajiEU9RTe8H4UPZOKgmnEXNqByfDhzja2BGj6xTf+x/ZIbaMmGEsJF0Y9sBYta4VPf+Ox6N9QQMo8/5oJ6y/VzdCCh1RtZHytSciOE6k0iOHs8j30u6okD71RM7G/7/LRPdcq/9j20cyh6zG1BsYl+2tJ0KnDmFHZVbEG/1WIWsbEkyQfCNJZRW6brOGooCmXtAKyqGpyDa1XMv+KJne1nn6gh/ku9Pj9ZDFxWcxgOTW9OTEqONCfucwDVgQRuus2BGndQn61TwYoznT3uCg8j+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 05:04:57 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 05:04:57 +0000
Message-ID: <49039b9d-4c42-480f-a219-daf0958be28e@nvidia.com>
Date: Fri, 12 Sep 2025 15:04:50 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 06/15] mm/migrate_device: implement THP migration of zone
 device pages
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-7-balbirs@nvidia.com>
 <d35eea42-ed32-481f-9dcf-704d22eb8706@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <d35eea42-ed32-481f-9dcf-704d22eb8706@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 828fa678-fc83-4a3c-31c9-08ddf1b9eb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFQ0aFcyKyt1enlsamxDc3NwdEM2Vi9BZUJ2OGlBMGpqcmJLRmc5T1VHeHMy?=
 =?utf-8?B?Y2NabG54Y3g1UkphL3E0bVNFNnNON2liSDRPdXBPUStoTGIzZzNBVm5pcWxw?=
 =?utf-8?B?dlJVeUVuZjRoRkRmSnUzNlZRV3lPNU42RXViaGJ2N1dFSEJoWEhkM2M2ZFpE?=
 =?utf-8?B?eWwrMUlKV3JlVUR4Ym9mdHpLdU8yU3NNMzZMZVlzd2g0Wklhc2VlbHJxU0RQ?=
 =?utf-8?B?eStYNWZDcDZFOU42NzVEZ0RleU8vSFVNazBQMElIZjZKOXU2N2ROdXZvYjJW?=
 =?utf-8?B?WTc4V3hyZHBJYTV2T09nbGZpeXY3VFVvVTdCRllocU5Mb3p1VGJVMDJQeEs2?=
 =?utf-8?B?Z2lOMlE0OXo3LzhIbFdwSWwraHI5VDMvTzE4Ty9vRmRhRTJoR1gyZkpXS3Zq?=
 =?utf-8?B?OXFjRmlHWGFKTm5ocWJxTjZ2SkFFMm16S2hUZHBSYlhOUHhRQ251dERwTTRB?=
 =?utf-8?B?cVNHNUxaQStQaWUrL09PNHhSSUpObWdzekFVUWY3dXJmMTNld09mdFcxd3Jr?=
 =?utf-8?B?a2EwZXJlSjd5dUlpM2RxeEVzeUY1MWM3eDZ2MEZ0b090ZGprT0ZWVlFHUWZh?=
 =?utf-8?B?a0dqSkRSRHphRVk5V1ZHV0RoOGRXRk5Dem5PSldqSFN5ejFibUdUUVJ1YjIy?=
 =?utf-8?B?enJsQzZmZGV5T2lFVGJYQWJGS0dLS1Yva0RueUt6clBKSDhnVzBIWjc1SkVJ?=
 =?utf-8?B?cHl2QlBjaEFrdXNwUVg1NUxwY1cyVkZ3YWxUU3RVaHdHUWp3NjBiZCtqdWE5?=
 =?utf-8?B?UmNVVlM3amRXMXNTeUtmdjEvRmJyZ0xuMmdmaWd0ZDM2YjM4cUQ5Tll1NCtM?=
 =?utf-8?B?NlE2OFdkQXFzRGNUbWFNaEhKMmxwYUU0dHNiVEpndHFiT0FPcVJhUElQYmtJ?=
 =?utf-8?B?RytjUlRzVjE3RjAxRitDNHlFWHhwcm9ndGdSQkRNaXFpek1TQ2FJVlVmQWIv?=
 =?utf-8?B?TklUaE9sNTNoMlhVZitYcndpTUtzNWE0cnNHMjFUMDY4NTZtL2JxMlgrMWxs?=
 =?utf-8?B?MEkwdmUza01TTVVYSGpOU1M4RS9tU3hhZVBwYzVDUVN0aHNZMzFXNnVkWTNN?=
 =?utf-8?B?YlI5dmx2SzNvWU51UFZ3S1lzZkFDMGpwVEJyTVNFR2loNnB1VUtBZzZpSENz?=
 =?utf-8?B?LzRTNDBWWUpZVCsvRllSK3k1bXBhcmh3RnBYSWJkSTM4RSs3c0tmMXZZVEhZ?=
 =?utf-8?B?WWZrMnM2REJkdy9KSUtCNXp1SUEvSWZhc0k1ZW1RSEFoWmxJRGpGdmRKOTNz?=
 =?utf-8?B?bmdLYzFYZEpFdEc5Szc0czRoeERiczI1Y1BkWDBYRXkzVzVPaEV2a3pnd3VK?=
 =?utf-8?B?TjA2ZXJxQXhxb1dsZi92UEJZWHIrRDNETjZIV1hHaTB5Ui9odDZhdVVySlB2?=
 =?utf-8?B?YWtUa2JtZFV0STdUclpwaC9FM3lUVDFRQ2U4ZE5XYTFBZUxQbnAxcmQ0dG1C?=
 =?utf-8?B?QVVJQ1VpRGlNRUJnNXFJZ0JXMEJZWHptQ0N1clNKMU0zMXRoaEVLcG5iaDho?=
 =?utf-8?B?LzMwclBndEwwNXIwUDIwYjlXV3hKV0dNOC9GVGJmUjlhcC9Tb2M0R3p5U0JC?=
 =?utf-8?B?ZitoOHdVMkxhczB2SHJINjFoRVEwVnFmSzdRRGc1dTltV1ZiS3llNGlSQ2xp?=
 =?utf-8?B?NktUR0pDMTZBd1ovbGxka3BQNzZxczhhL1JoYkEvdDY1ZU5SOUpRK2M2cXR3?=
 =?utf-8?B?a1AvdUVJOUdYRkNqUTVOSVU0VnNrQWVxaTZDbWNCVnpPZkZGYlQ1dDNtVCs3?=
 =?utf-8?B?a3pYTndQcE13djhCcjBvTDd5NWV5ZTVMN2k1ekw1YlYyeFFLTDZkcHFCU25S?=
 =?utf-8?B?UXlUejc3UlRRWHliSEZRMm9RK0FqSW5KVmQvY0xkTlFXUWloV1hyVFU4U0tM?=
 =?utf-8?B?N3lFS2VLSDNWSm5yRkJkUXBLNWtvNDdlSUhiK29MK0hUQk9mQk9adWQ3OVh2?=
 =?utf-8?Q?7C6eWgklyNk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFNanhVM1ZWYTV1czExWEt1UEYzemQrd3ZPbHkwZEEwVG1HR3Zab2drS3Jv?=
 =?utf-8?B?WS93dlNWY3FTc1VIekRqaGJld3hhTlp4bk1OWTZzMVViSzlhNkhSLyttOHoz?=
 =?utf-8?B?ZCtpQmJ1Nm1zNzNiMW5IMnI5T29IeVRKVWNsUFBWMXJlYzBtT1JzZjF2bFA0?=
 =?utf-8?B?WVJCMlc3eEVYL2NiTDdQOTIydEcxNWFscDVvTFl3T3AyR1I4RWltVzM4L3k3?=
 =?utf-8?B?bVd2VHBPdXdBOWR0Y0FZN0FqSE9sMGhxbW91RU1PbjFvZ0UvQytubU9hSzE2?=
 =?utf-8?B?MnVBNG55Q29GT1VHdlpmdmJyMktpbnhYQU9pUm9EYWJMbW1SUFAxa2JxazJ4?=
 =?utf-8?B?L21TV24zL3ZEVUU3YkMvYjZpbVZ1OUZ4ZjE5VDFnYVFkb09xRmVvKzJNNWxl?=
 =?utf-8?B?QXF2cXJCT2pETDFsRm1RaGxoM3hrdERqM0VJWm41UkVEZVRnbnVvalAwelRk?=
 =?utf-8?B?OEMvQnVPOS94R2pucjhqZDcwOWVybFYyVHNFU3lIRmJFSnZxc0VuVnAraHhm?=
 =?utf-8?B?TTJkWmVMZTQ4ZGE0Q0xEaktLajVQckJoRllaTmp3RnFsN2ttQ1FsZC8xSkFN?=
 =?utf-8?B?cW5DZE4rdEIrS3ZCMmNSZ1ladEZBbTVCclE5T1dwNmV0Y1NmR1daS2NCcTNq?=
 =?utf-8?B?cG5QZzFST1YxQ3VKd3kwUzVpdWZtSEpkU2dVZUdSbkdpek9ISzkrMDl2dTFW?=
 =?utf-8?B?U2xUWjFTK0gzNm0xcUc1bTMrTFJpbXJ2UnhXKzluUGViTEI5OU1PQW1tMGw3?=
 =?utf-8?B?WTlZdGIwSlM5cjBxbUQ4MUtkWnQrK3JDQmF1enlKOG5PVy9SVG1YQkZXSDUy?=
 =?utf-8?B?UloxeTJUdWlkbUV1Tlh3bkRPWk8wTDdBQmE4QzAwTm5HTTRYWFd4bndrYWJs?=
 =?utf-8?B?Q2M5aW5aTHhVTHlRYnl2Wk9BZUcxU0ErWExpaTU2VHFMOWR1b2xqMHMrYjVs?=
 =?utf-8?B?bUJERVh0ZVRlbTNEaXF5dWxMNCtnU0VvQVBkK05aWVNRd2FYRXBlNDlqL2RI?=
 =?utf-8?B?Q0NXNlZmcW8vbkVSUWhCbjZvbnlsaG9pM2tKSTVFOEJ0VEFZMThSWXdqcXhJ?=
 =?utf-8?B?TjVtTXhJeHJFKytMQjVlNHA4Z2hjNUJ4SmtGRkN1cndRYVFOYmFjbEsvbWU5?=
 =?utf-8?B?d2dDWTdwNGNldFpWbzY3NnpIZzNJL3lwa0Q0MmRXU20xTis0SnlsTm1Cb2o5?=
 =?utf-8?B?Tzkza1JubmdxU0h0cWVVZHRER016TzRieU5Ja2xDeGN2Vi8zYUQyWTJkVHFr?=
 =?utf-8?B?V1Z0bTBoMytkQWkrdjg5V1NOcHAxdFdmOW5wcDdVS25FQWlEcGpvMjlpQzYr?=
 =?utf-8?B?UjQ5Z0VvQ3FES0dVbFNQRzRGWXJJYk5WZFNXRk52dmV6ZE9ZcWp6MlNXZkxW?=
 =?utf-8?B?cGNpeTFXYk9RRzcvL3VtTHd3ZG5qTDE5ZUxjRnpOSHk4UEZ3QmVzVlhCQ25T?=
 =?utf-8?B?WGlzS29EbTlkUmtEQzh4d3hzRzN5OUNSR0lPZ2lqV243WVJlVWZ1VG1ybW5F?=
 =?utf-8?B?ZXoxWENQVy9qczZ0N015MmMraHpXczR2L0hVSmtMbytXYk8yNENaRmVUcXI4?=
 =?utf-8?B?VUtmcE05UUZXekdEa0Nxb3c4dEVZRWRpMFJKclhtT0p2YUczSUpGOVN2NVp4?=
 =?utf-8?B?bVRsWWEvK2lqUzlBVjBQcTJxb1lScm4vNm4yWUJlc2tLaW9pOXlSeUY1dFNq?=
 =?utf-8?B?SmNkTlN1SFBlbjNHZC91NUlJWWpGQ3QwMldKODY2Njc2OVRVYmdGUncxeW1L?=
 =?utf-8?B?Y3ZMcFdvZjMyVVovV3lxbHZXYWlJNXZpTkxWRjZGZjEzUjR2K003VGxyY292?=
 =?utf-8?B?MjMzV2g4V2ZXbEN2NmQ0TWpxVmlTblk2eExEalVXc28zU216MU92Y0Zralcz?=
 =?utf-8?B?bkZtN1Jac3lNak1FVlk3amVhSCt1ak1VMmlydWRwSkdrQ0ZMSS9SUXhxMXFj?=
 =?utf-8?B?aTEzZkhyc25tY2ZaVTQ4Yjl0ekFQMmpsWnZGVGZCaVlBcWdjNjRPSWVINy9T?=
 =?utf-8?B?UnlORE9KSkRnSWhqeW1mZ3JiUVJuTDlTRWgwNDVFZUFFMFdVbTUrZFZDVW5P?=
 =?utf-8?B?ZFIyTFN0M2MyNEg2cVV6Qi9FaWJQdWNoWERUTEJnZzM0dXZ6VWw3MFc0T1J6?=
 =?utf-8?B?SDVyNXFrWi8xQlVFbUFTN2xmNk1KZVI1M1haUkNTeVo3dGR2L3pLT1kzUC95?=
 =?utf-8?Q?7jZXXan/aKw0F7gurp1KAf2L4e3FAet74bLNYNiUxmz/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828fa678-fc83-4a3c-31c9-08ddf1b9eb10
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:04:57.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOPJBlkWRLQ+ocM8yaJlrSFzmxWtwJp033MkThqZMJRZDCw0HIhNc48rqUk1mxw2ytuz6ehXPAIbYSQ2lkVkSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420
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

On 9/11/25 21:52, Mika Penttilä wrote:
> sending again for the v5 thread..
> 
> On 9/8/25 03:04, Balbir Singh wrote:
> 
>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>> device pages as compound pages during device pfn migration.
>>
>> migrate_device code paths go through the collect, setup
>> and finalize phases of migration.
>>
>> The entries in src and dst arrays passed to these functions still
>> remain at a PAGE_SIZE granularity. When a compound page is passed,
>> the first entry has the PFN along with MIGRATE_PFN_COMPOUND
>> and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
>> remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
>> representation allows for the compound page to be split into smaller
>> page sizes.
>>
>> migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
>> page aware. Two new helper functions migrate_vma_collect_huge_pmd()
>> and migrate_vma_insert_huge_pmd_page() have been added.
>>
>> migrate_vma_collect_huge_pmd() can collect THP pages, but if for
>> some reason this fails, there is fallback support to split the folio
>> and migrate it.
>>
>> migrate_vma_insert_huge_pmd_page() closely follows the logic of
>> migrate_vma_insert_page()
>>
>> Support for splitting pages as needed for migration will follow in
>> later patches in this series.
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
>>  include/linux/migrate.h |   2 +
>>  mm/migrate_device.c     | 456 ++++++++++++++++++++++++++++++++++------
>>  2 files changed, 395 insertions(+), 63 deletions(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 1f0ac122c3bf..41b4cc05a450 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>  #define MIGRATE_PFN_VALID	(1UL << 0)
>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
>> +#define MIGRATE_PFN_COMPOUND	(1UL << 4)
>>  #define MIGRATE_PFN_SHIFT	6
>>  
>>  static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>> @@ -143,6 +144,7 @@ enum migrate_vma_direction {
>>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>  	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>> +	MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>  };
>>  
>>  struct migrate_vma {
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index f45ef182287d..1dfcf4799ea5 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/pagewalk.h>
>>  #include <linux/rmap.h>
>>  #include <linux/swapops.h>
>> +#include <linux/pgalloc.h>
>>  #include <asm/tlbflush.h>
>>  #include "internal.h"
>>  
>> @@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	if (!vma_is_anonymous(walk->vma))
>>  		return migrate_vma_collect_skip(start, end, walk);
>>  
>> +	if (thp_migration_supported() &&
>> +		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>> +		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>> +		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>> +		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
>> +						MIGRATE_PFN_COMPOUND;
>> +		migrate->dst[migrate->npages] = 0;
>> +		migrate->npages++;
>> +		migrate->cpages++;
>> +
>> +		/*
>> +		 * Collect the remaining entries as holes, in case we
>> +		 * need to split later
>> +		 */
>> +		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
>> +	}
>> +
> 
> seems you have to split_huge_pmd() for the huge zero page here in case
> of !thp_migration_supported() afaics
> 

Not really, if pfn is 0, we do a vm_insert_page (please see if (!page) line 1107) and
folio  handling in migrate_vma_finalize line 1284

Thanks,
Balbir
