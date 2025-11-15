Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14853C5FBF7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F4810EB6A;
	Sat, 15 Nov 2025 00:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mzI3rJJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA4E10EB6A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:34:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4dZMSDm0oS0uvoOGn7MIIX++EmW9RN8EpD36ter0qsaMNOwYzk8Vjc9IrQEbtPQsPlsJkfYRLTS5T3Z+zRrpvZl/0qsTdMhhL3G5AmwnKmdgXC64vqmu4NrGPvKzwbH57jhAbN1N0kv4e75LKreFLEg2e5W04uqwR3dnAkOXmcXP9U+VTrZIvBv3ZBicoANhdeU5Gdznfj8fAFT3hWRi/Xdla4pnihPQ5FhELDN8sW6gtWZvhHP54gNOYExuHkZtdsMbMdY171lVfpan9Az4ZZxpzqQDIXQR7DcnLvaW4nTayqhWilyNdXD3nrftyDh491wun6N9W0iJof5HXXO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8TSwAo3ZPvSNFBFW253pZ3tV5nEnSQmmMBKbt08fbA=;
 b=hqoKEo0s1acjA0Duw3ph2OpvdoCLV+W6v7+zozHz/63bzmRux9YPmmaYrkJjCsLSbzow6EvazoqxZPkXMwoqTVQWbM49lt+K5rpiTZvkiseeAZ3dhVMjSdLryTn2FQN/UkzsQqOXiuxA1XB/RclVSC6D0dSzfihIoQf7xq+rLGXeOV+UJdmnhbfrwTwmjNB7CW6KQhkHfTse2FFbA4SofHb9a1hVS83njLksIQChkTZ+oE5MkTemvDKn5sOdccHRJLnQlPorqwMgbOLCK35qHCrVMVKG1pO30TUmC20Y71mjY4+COx32p4nvAoKlcyTJE4JPNIu4B+ECMLVd9VqfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8TSwAo3ZPvSNFBFW253pZ3tV5nEnSQmmMBKbt08fbA=;
 b=mzI3rJJruzfm+kQWddQ71c6GJtWEgs16xNJYC7VIS9yrMCUVfFKPolD5ugN8EKiMPqNeMF8TQIuOV/3uVooWZZQuM8rHvqeUqL0/07N/RuQn4Hs6jyN8TaoRrg9JNGskGjEzkLOPGPcw/zn4/X73jdlaxseiUQuJgz01H2UYIKfQtbLVlgUavCL5FGPk2qOy4P6dJ8xqx/BGwlLkCfdB6AeCaCl9MyEmwZtcs3IQ4ZUV+67I6qJ/G5Ykuzacz5O0wTdDZguAmQuDvSu6c5Shvg+21sjzwB/kEas8g7/YCDB30fTAWIogRgIo1ThBpCUf/u8tHXRE6VFZFJ+3RmX8pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:34:14 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 00:34:13 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Balbir Singh <balbirs@nvidia.com>, kernel test robot <lkp@intel.com>,
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
Subject: [PATCH v2] fixup: gpu/drm/nouveau: enable THP support for GPU memory
 migration
Date: Sat, 15 Nov 2025 11:33:33 +1100
Message-ID: <20251115003333.3516870-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY0PR01CA0014.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::17) To MW4PR12MB7286.namprd12.prod.outlook.com
 (2603:10b6:303:22f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fde640-2178-4120-efa6-08de23deb30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blpyZTgvR1lDR1QzWkJ4WTZiVHcyNDNqaWVBTjhTaWZSVCtFWnZJME8rUkNh?=
 =?utf-8?B?eUYwYXpFYTBZSkMrMDFKZVYxdHo2ZkprSVJNRlAweFFqODNScjQvV1JXRW5P?=
 =?utf-8?B?YjYzdlBnbWhEUkMvbTU0Y2NCMkNyelc2TnA1MlBqYzRIUWxFN0VDNW8vWmZO?=
 =?utf-8?B?cUpGTGlzREF4Y0ZzTXdLNElQUmZFYzdtMjFNYUU1ZVlHcjRqVExJY3NGT1Nj?=
 =?utf-8?B?b0pIaUJ1cExib0xJcERkOEJOM0orZUhzTlBLeGs0eVJFNStYaVQ1NmRBcXA5?=
 =?utf-8?B?eHJneUNpeHFDOS8xSTd3aVRGS092aGZHT0hTOEYzZmJyTHNyeXdpdEFaVWdL?=
 =?utf-8?B?M0p5azhLUTVwSmtoUy9peGxsNStqSWVEZUY3aHZVVlU2VXhqS2VVaWFQMXNP?=
 =?utf-8?B?TkY1ejRRVVdvWnFwYlNSMEROR2gvaU1SRkNoTWt6K0pQRUt3N0NKOExLN3Ev?=
 =?utf-8?B?V0lpeHVHaklPeXRVbGhUYnl5ckNQU0MxT1hxNUNNQTU0T0hSUlVWN1pOVGF2?=
 =?utf-8?B?bnVPbWhzRmFPY21lQUNPeElMeWZUODdicklQZlFOMlIxTWZmVXFWRVl4MFNO?=
 =?utf-8?B?Ynd6aVFWMnFaR01sZkhwTUxNMXM0enpQdndVTGhpd255cHRacnJhOUtHUXBj?=
 =?utf-8?B?OXJ4dDFrRDJuQkhDWGJUVjhXMGxWNkFFeXZRcmtxRUR2L3pRZnQxb0R1Mi9E?=
 =?utf-8?B?TXhnV05WUmlYWDJ6S1czS09YRmxOT2VXbHprT1ZYa3llc1ZtSEwzdVpmOUV0?=
 =?utf-8?B?TFI2VkQxNXY0Qk5mTVhtNmVrWmhlckpBY0pGZzV1M1daY2p6YlJWZ3pzQWNy?=
 =?utf-8?B?ZWRtYVFPaVNPOHZWOVZvRnFkTlM3QWtIK3IvQW1PTGtucWRVeDVvcFZLUEFE?=
 =?utf-8?B?ZzgyYkVlZmVGYm9hOHR6NE82NFIvMWN5cnJVdWxUS003cno3cUpzdXBhU2tJ?=
 =?utf-8?B?Wi91Q0dWU3ppd3pEeWtEN2gwelQ1NWhJQVBBVklXUFdUZWhIazNGZVZMY05V?=
 =?utf-8?B?R1F5TDFZWkQ0WTRVNWwwclZnUDF4b3NsSkJCSzc2TmNBUSt0Mit3R3Z4Wmc1?=
 =?utf-8?B?UGFjTnZDOEFKZ3JHV2ZOUGNHem84WnFSSTIrTGdUYUdja1NqRklGQUtoRGVl?=
 =?utf-8?B?OXpYYTJsRHZBNzdhaVVLKzJXTXMwTnhpTFRycm1HUStWL1huSjY3ZTV5Mzk0?=
 =?utf-8?B?SmpKWHJVUm16bkJhQlZqWk84VjhReHdjWmsxTjk5YWxsQkswb2xiclMvZVlI?=
 =?utf-8?B?RGc1UmRWN0daQWJsWVY4S1pNZjk5TmNJbEtVUlM4SjZtOVY1K3lnQWhuRkJO?=
 =?utf-8?B?d2M2Vi90aE5IeG01aG5XdDNlUFoxYldSeTUyVFZlRHBmNFJQcEdpWU9aVHpM?=
 =?utf-8?B?SENRT0M2aFlERjRQNGtTeThqbkluT1Y5SlkwQ05PWlkwY0pnVzBEcTZCUEtq?=
 =?utf-8?B?WTc2dXdGSnVBdTNYdFdHQWM3L2xraFdsd2U2emw1anZTRFdvcllVYWdsdFdV?=
 =?utf-8?B?YzBlMGxRV0NBVWtnTFhBRlkxU3VhWWtjRHo2Z1RqZUljTFo4ak5NV1g3ZHQx?=
 =?utf-8?B?RXJkUUtGem0rVkg0ekhYUEpVSkVhV0cwVi9KTW1adEIySnZLK0ZmODVLMjBV?=
 =?utf-8?B?N2RzWk5QVVVZY0dEUDBILzA0NjhhMEVqZ2F4Z01pbEVEUkNzdVhhbGhuZ3Ry?=
 =?utf-8?B?NUtZaVR3b2dDdWhvQm5Wcm1pOElUdFZ5cnAwL2RzMUg3RmVGbGFrU0RMUytq?=
 =?utf-8?B?WmZxc1dtbGVxYjE2M0ZlUVZNRUt4ckFXcmVrYTdQSTZOdDFJTVJYZzNrS2p4?=
 =?utf-8?B?d2tMakFtWWtnYjl4SzZtTUsvWGs5aDJldVlLTnpCUVFxWmtQQk9xM2RORjRr?=
 =?utf-8?B?V3pZdHJEQ2F6TkhscEd2aFU5SnhMTFFlVEhqM2lubngrS3cvbkNhM0lIM3hT?=
 =?utf-8?B?b2swZ0RBMlRDQVBvQ1ovRUtiK0JIYnc2NzUyOUgzV080ZzVXcHcvazVwYWVh?=
 =?utf-8?B?VzI0aHNwNDVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXE4RW1jR1FNN2RtL2xtRG15UTR5MmNIdGp6S0M4R1BYa3p6TVplUFBNSmZZ?=
 =?utf-8?B?TmJKWDdscHkwdzhQdmZtR0x0UXBKSmlSNWV3dG12VFp1SzVoVDQwcFJsZCtZ?=
 =?utf-8?B?S1ljU0xBdEIxTllVajh2dmJXcUJTL0NlV2Y3THF4a2FZYjE3VEJHU1QxYkF1?=
 =?utf-8?B?a0ZVWk1icHdKeVEycGZlY1dhU2s3VUI5NGt3VmNuU3ZRZnNVcUMrWG1WL2s2?=
 =?utf-8?B?QXQrVE9FZEVqOW51V1BDcUsvWVMzd3BJMytSSGo1UW14ZzBtczdsR1JpR1dP?=
 =?utf-8?B?WWtNQnF0WTB2MXNYMXo4YzZhQ0hYUEo4RmpRYXdwZmdMZGlwejdTQjllU2Zx?=
 =?utf-8?B?SGVGa3dRNWFZQkJvOURRdUtiSmdDQ0h3a0lmckg0U05ZWjB0VTRNSjA5UUo5?=
 =?utf-8?B?RFNIVU1tMlhhYWc5M3UwUmt6Q3VwR2VVQlBZUVdHbG1nTFFNYVNPMjQ4d1VF?=
 =?utf-8?B?dUtrbHl6V2JSdksxZ2FHcUo1RWNKN05vZldXa3o1NUVYMk95YjREZnRybHc2?=
 =?utf-8?B?MCtKMkxQWmpTaEh5R3dNZHZaSmpEbi9VYmdJKzBWTm90M0p1b08vWGRWT0hr?=
 =?utf-8?B?VVVJTExEVFZhdlhTUU1JUEJoZDZHanF2MkRvUkVJVTNhemxRdHBBRm5Wd3R3?=
 =?utf-8?B?Z3dmV1g1R1R5bnhRVWlmNmhVQWlqQUx4eitUaTkvU1lsZ013V0FHTWp5RDhP?=
 =?utf-8?B?c3VYWGVheW8yaWM1L0J3Q3JWMllpdWorQ1N1ZG9PeFF3MnMvbXhXWGZMU0I0?=
 =?utf-8?B?TGJZWDlmUy9yWEIxYjM5ZkhiN0lVQ01od0hWMjR4NjFJZTdFQjJXWC9kU2Rs?=
 =?utf-8?B?aHcwdk9CeWNVaWRZaUVBL3k4YVNaN3ZlRlZ4Ym13Wk5RbUlueWYrVUJ3M0lY?=
 =?utf-8?B?K2F2cnlubVduTDUydnd0YVQ5dDJGc05WWkRZUFpBWlI4eDZ1aW9EYWc5Zk82?=
 =?utf-8?B?eldlekkzajFFbTgxR0dzU25SeDNPbmljYUkzeVJDQkZOZzBac1hoekdsRUxq?=
 =?utf-8?B?cmVyOVhFSFFMUDUyWTYyS3h2b3NHZnE1dnVYRzgzTU1pT3krZlhGcnVwa0s1?=
 =?utf-8?B?eXVLRzB3ZHdJTFBVM3NJTEhHcGU0RUlOb1BXcDlzRVBwYXJtSjJTc1krZXJt?=
 =?utf-8?B?SWZYT0VZZktnYWZzWWU3V0xVOHJTSjZSNUZRbmh6OWc5OUpkQ1NzL1ZSV00w?=
 =?utf-8?B?bVBHeDZsUDhpdHVWZjRNdHE5THV4QUFodlAyTGtwTGYwM2c1TTRrNWFnNFpC?=
 =?utf-8?B?RXdXUkRTaHlPNi9hYm5aa1l5ckw5NW5CMXEzL0pndm5YNnFjQU10U3VUQ1lU?=
 =?utf-8?B?QjRoeTdDK3BucUNaYzMzV3pHb0RQeG1ORFNaK2NIbHZkRVZUaExVVWk4dUNK?=
 =?utf-8?B?aDhYTmNFY2lyc3paUTl6d3ZUaVZvd0FGbnNibDRWYzIybUtKblVTUkl5Tkg0?=
 =?utf-8?B?MFJ2QUVSaWlkbElZSDdFd2k3NzJmdFNXcXV0eUExRjBVdXMvRDc4SkhxaWV1?=
 =?utf-8?B?bHZUTmswNEMrcjI1bXpLcmhRbi9xNjRQM29ROXJ5RWQvYit3LzRiVUZTUEJK?=
 =?utf-8?B?YmhMajdyVlRpbHpQVkRUYjZNV3lKSFZtbWw2bXdRMzViWWhnditwVE5RY2xV?=
 =?utf-8?B?R05GVzlXeGtNNE1GcEx4citmWHZZYzhNNUI3U0N6emVTckNyYkNPam0rK2xu?=
 =?utf-8?B?czBmTHhvOGVHeUNSbllYN1JXMDI4M0tvN21Fa1NzMnlZZDU0dGl1dHk1ZVI2?=
 =?utf-8?B?RG5GRWJGNWNBYjJ4M2s4ckdqWHNFTFFrWTFScjFtQ0lielRJbzJNM3lYcTAy?=
 =?utf-8?B?VEltZmtJWHdwUEhtSW9seSt4UTJqQmZqOTQ0UUNXWEhkVEx4akFoeTFvUmFX?=
 =?utf-8?B?bHh2UGFwU0hxQ2s3dlBIZW1lcm9DU1pnSGVyNjJPQkl1MU5ib0hRRDhEL05M?=
 =?utf-8?B?MFUwYWlsN3lrUGlOdnFoVHNEcWpNMkQrWENqcWg5NFNGRDc4eUUybTZuS3g5?=
 =?utf-8?B?SGVZWFJCWlo2UkZHajFDT3paWkluNWU3clUxdnNKOC9ZUjV5UW91VUlhbE4v?=
 =?utf-8?B?YjBuZ29VbndkWE5oYjRNVzhaV3V3cW9NdTQ4VVhHS3hTaEFYWm53bkNaZU5N?=
 =?utf-8?B?QWdBdXBYZHpRUWdOWkhNNzU4WTRPY01ZRm5BZHFJVWRIRldid1VEc0l5dDNM?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fde640-2178-4120-efa6-08de23deb30a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:34:13.8248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+bkn37AiPlyfZKh+o8O1eBonkoneALX9lKFQbI9zDdriFC4UIvJ3tCJ64Yh+MVHHLZxHJQUaT4hBOfIR0DA8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605
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

Kernel test robot, reported a sparse error with the patch

The sparse report states:

>> drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got int @@
   drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse:     got int

ret of type vm_fault_t is reused to capture the return value of
nouveau_dmem_copy_folio(), which returns an int. Use a new variable
err (of type int) to get the return value from the function to fix
the reported issue.

The reported issue is not new, prior to this, the function called
nouveau_dmem_copy_folio() was called nouveau_dmem_copy_one() and
ret was used to capture it's return value.

The reported issue also does not cause any runtime errors. The
return value from the function is used as a boolean value, to check if
nouveau_dmem_copy_folio() succeeded or failed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/

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
This fixup should be squashed into the patch "gpu/drm/nouveau: enable
THP support for GPU memory" of mm/mm-unstable
David wanted me to change the patch prefix to drm/nouveau/dmem, I can
resend the patches, fixup and this one (squashed) if needed.

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 244812e7dd69..58071652679d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -188,6 +188,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_svmm *svmm;
 	struct page *dpage;
 	vm_fault_t ret = 0;
+	int err;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.pgmap_owner	= drm->dev,
@@ -256,9 +257,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
+	err = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
-	if (ret) {
+	if (err) {
 		ret = VM_FAULT_SIGBUS;
 		goto done;
 	}
-- 
2.51.1

