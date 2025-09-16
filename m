Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CC3B59604
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C61810E7D2;
	Tue, 16 Sep 2025 12:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ieNYk7Pe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013033.outbound.protection.outlook.com
 [40.107.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAE310E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a30EPzCE2Z8josfSvuh7y9ClrJzNnrN9LQFnlbgphbD1vTZRKBGjhG6b+KvRV2kH2LBgwyeXgAz1vXi7tNL9yE9gbKM73m64um65VMI+a3cILllwv38Ti8KvXCm2jrQo3kOI9IxsuZf7ROeknVave6vN6juSf0W8vf5aChqwkV6VM2c7yhKlN6ZfLPKeUM/q/T9wB4CQIgVWsuZ7lqowUdvZiTfwpHpKPf8pq7bItFqw1PnrDyfp8Xg+OvJtmmHWRO+KTGnzGSWh57Jv7C7Y5wzFAWcW4xxumEzyiDjO27CFSC34T+chf1Kvbkl2uYO6sBQYcrpugNMX5mWLjA8SEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDa1eJPezaDhV0EmDjjpy0AXPfxJwTP04n3KhhrsePo=;
 b=Gw4i/2r1Ai3phtYu6ohodDP7gvoT6bsDGEyTMHW3AK9aMAmCfLLeWy9kjqshzCgAeMMN0O3HJSPgE6Yq/51JgjbPpY8WP48F4yk3hzRudmGzP+fSgPU3hIccezlM2nXyNT0tYbpjw3UPd1izgMV8S1o7q+zQXN9FE7x3pqSgHYRK0Of3SzexoojlMuhIosf7z9am+Zl22nL8LrtWCUJtRJPd4KaDwMJjdzsN68RJlsQJ9uSZDzXKiOhgALmrjMmakzGVTP7nmoKgu+w4zg/PJuCwZWENDwj6opnSraY14TadTcBMHS4P5Z6FHm2UQkUCvBPpVQuEyCDQzPIQgPXxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDa1eJPezaDhV0EmDjjpy0AXPfxJwTP04n3KhhrsePo=;
 b=ieNYk7PeyZaZ2hUb4+Ke40Igpou3edLL232sRQ8/ruNUohqq1K8TirEYS22ojqxEJWIm8eTk2II+4hQid1Y88zXieTvKfmuUmh3HP9xLO/yAKNtmIav9qQ5jDwWch9p1evukZ7GG95MTZubUhLLWS5eDtjlkwKLLrSM/0K7XA8vQufeRNS1LsvcGtmWgcJ0GXc6rqNmlZNKluB1t6zvXbhGhVqtEVyb24EV4TAlP6uygmIgl3dlEBFStLG1r575xnkj3ss/OiKjW7YFReODp6shPAOAqKx9kOEiiLFIELIW7zPGPYq0ScTAlxF/CqgzoVVev/CgDFu7R+Sc+vtnUCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:22:30 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:22:30 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
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
Subject: [v6 15/15] gpu/drm/nouveau: enable THP support for GPU memory
 migration
Date: Tue, 16 Sep 2025 22:21:28 +1000
Message-ID: <20250916122128.2098535-16-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0061.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 403c5a72-a454-4847-5a0f-08ddf51bb4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGZ3MTBlWm5xMTYzc01sTVZGb1pFVWxqN2dKbGhuSm9uUEk5WW1HZ3dlR3N0?=
 =?utf-8?B?dE0rZFFJTDFBSnkwSWUwTXVlWGxqTncrRUlaaEw2cm83dktXaTk4dElNWThO?=
 =?utf-8?B?TUNpcm9vRFRqazBwUVJiYk9ibXp5NWRNd0hHenhtb2RQSHpxalVvQlh2OTlV?=
 =?utf-8?B?UUxta1FBMHlEdC91MURBUW5tRWJYalFaVXFHTHM1NGtkdDFvYkNaSjFmbm9r?=
 =?utf-8?B?QzUwLzVzcVNhVkdVNCtBTjgxckxJaHg1aGMxODc0WFFKdmFuV1AwME12ejRo?=
 =?utf-8?B?MTBFTkNQTTBPSDVQUlBBMHVmOUNnTzE4blFMMkVzSDlhZU9BRmZtZ2Z6VW91?=
 =?utf-8?B?QnBmZUdoWjhLNVZLS0tYTWd2ZDhkQlQ4d3ZveGRMNjh5dVprdEVSaURDNVRG?=
 =?utf-8?B?WVpka1hZR0x0ODFSRDZJb01VK1poMFF2SXBWRy9wTWR3NlRCWXNKajUxRWp3?=
 =?utf-8?B?bThXU1hiaUNZRGhwZG85SkJXZzZ1SFpOa3l3TkprRXV6NC9jSzRSWmJPV2tK?=
 =?utf-8?B?MTM0dEU3TTdMTHRJMU9lM3hxdEJwU1BOYXJtRFhFZ2ZqUi8vUTVFWUp1bTh6?=
 =?utf-8?B?QkJxQ2M3b24xdy91eEo0NUVBZUJCWGh4Skh1UzFCdTlla0ZVWTVHVW1yNmx4?=
 =?utf-8?B?SkVYUUZvcGxhVk5nRVgzT01GL25Xb3dCYUxyWW9ydXppbnBRanBkUWtkcW9U?=
 =?utf-8?B?akRSeHBTVVRYM2tWczIrOVFUam14N2lhN0VEcVhMUUpobVBOY01NMzg1Wmlx?=
 =?utf-8?B?eC8xZ0p2Z291dllZek4vRURGc2pVaFNBZkJGMVJZUmluMkFtdU1Yb0k5eHdv?=
 =?utf-8?B?NWVyeWNqQUpNeDVEK2RLQ3piczhrR2kwZjl6YWRMVmhvUzNmWlJsaVVieFZs?=
 =?utf-8?B?Z2l4NjRxcGR6ZlhKd3FXc1QrZTlXbk5sV2ZGbGVuMmloQVJHQldtcktlcUti?=
 =?utf-8?B?QnNIaEZ6S3g4MytDUEtHaWRQb0l6K3F0enZIb2s0aVo3MDhSdkcra2szc3VE?=
 =?utf-8?B?UjJhRGtxbHc0MDc1LzVyQzVNNkxsdW12SUQvS2JQam9peXk3NFJvR1NnVjNE?=
 =?utf-8?B?Z05tdnZhem5RVEhCcnVHaG1zOVhEaGhSbWQ0MEpmWkk0dzhFZFFmU1hTbk5N?=
 =?utf-8?B?dkYrbU9OS1oxQk5NTVNCRnF2cVd4bzE3aVpKUnd4UjF3TVpTSXJHSUdPTm5o?=
 =?utf-8?B?NjlNakIwd2luSWQxbnhta1FBc1E4MFFGUjFlMHVHaGVjRzNjVmpZTlZlVjhR?=
 =?utf-8?B?c2NlbkRqeUVrL2syK3FEZWw3UUVFNFdDdjQwRTBSZjQ3R2RXQWhINXVUb1hE?=
 =?utf-8?B?dFg0UVdMbWd2aU9KL010S3JxUFBiWW9DbEdHQ3lCK2RDRy9qMmNScXAyWlIz?=
 =?utf-8?B?YkFqYWluWjk0K0Q2Yi8xRkhFRnNxWURlSzhsM1FHUWtpbUlYM3JYL0dkWmR0?=
 =?utf-8?B?TUhTV21MMDBLV1hKa3FjY3FoVmVSc095TUxZSU1OcTR4Nm10OWtyanV0MVBW?=
 =?utf-8?B?NTVUWXU3aytnMDA4ZWlWMlJCRUJpSEYzSE4rbXhYYlN2dFpIak5OY2x5cTlP?=
 =?utf-8?B?U084bzZtVkh1blFTWjQxK0dNdUgrNDdQZjJHcXVSOC9PZjZVeFZ6Wnd0eS9x?=
 =?utf-8?B?bWJLYlRvbVo2UHcwNWFKOU5tTkZ3Mk5xV0pTbTZXYlhKeW9CM3puK0ZTZ1pC?=
 =?utf-8?B?TU9vS0ZGdWk5YUNmNzlzZVp3OXBkSjlxUVZ5QjBzSVptSFcxRjdiQjNxWlN3?=
 =?utf-8?B?Z3VMNDBqd2w3aWhDVkZVaExSM1ZITlYyL3VhWkJBRlI1RHd5VVlQRyszVE5F?=
 =?utf-8?B?UlY4RWFxNmQzOXNOclc0bW4wMHN1Y241bFREYWJOVXNReHIzVFk3ZU56bzRC?=
 =?utf-8?B?dStSRTNNUnBOVHhKM1hNd0VFSnlCcUJvVUZEKzRCL1o4ODAreWFMWG9FNG85?=
 =?utf-8?Q?xXWYjMdpGnQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJyRHczQkpWU1hteUkvUGR0OVp0aVZ4NzVsckJQaWdWL3BjU2ZRZ1JOOW9Z?=
 =?utf-8?B?clBDSjl5VzFXcHhvelMveFMzYW5RQ2Y5eHJqTkdsSFhvUmlrWFcybnNEVTYv?=
 =?utf-8?B?NHNUV0J5dFEzVlFRb2lIWS9iT1AzazFIWXl6OFk2SnBySTZMOVJtcEZKdWg5?=
 =?utf-8?B?enZHS1FTRnZ0UFZ0NVRNbXlxeXhBYzV3WU5YUEVjcng1U21oZ3lPTHgyZXZC?=
 =?utf-8?B?U084eFArVjVkN1N4ZzVLL0Zva0QxaTZSQUNaRCtLcEk0R1hzY05nSlZPVlB3?=
 =?utf-8?B?UzJpQkw2VGVUak1JYjJ3RVlUTVlDSnFzcFZnYnRndHFKWXVtb1BRUlIxRWtx?=
 =?utf-8?B?eHpaUDBId2ZETFd0cEZYQ1gwMFpOanN5VG1wYnVJRFZTbFcvWEJWcjU0NHJH?=
 =?utf-8?B?QzYyNmJFNzc0Yk9KNHRwVWtqSXJmNDBsTWJzQmdLV3pKTmRPR0trcUJOT0k0?=
 =?utf-8?B?c25RUE9WeDY0ckZ3UDRVZFp2ajN1cXhub0lmQ1FoL3FOSnRqUHFMdGJZTTNL?=
 =?utf-8?B?U3pkZWFiOWt5MGJvRCt0TUp3cytNN3NXb2VYZDZNWVhQcEdJcWFZYWNtQThv?=
 =?utf-8?B?ZWZLYnVhOGhyd1N5TjBPTTVDMWJTQzl4N25wYlI4SmRoRXJpTnBaYXdkaEho?=
 =?utf-8?B?aHJaU3d0YjBxR0s1OEpaN1Nkc09OYzg3eExCMWZycUM3K21sdlFzalVYNE5O?=
 =?utf-8?B?WUp3SEdaQkZhb0MxcWRMOTZtRDBPWmY5R2drZWQwK0lIS09zb1NoRlVaSTR0?=
 =?utf-8?B?REFNQ3RzVC9DUm1HdGt6NGVwcDU1VTZTSkNpOXp3SG1mVjlFbEVaTG9kdGUw?=
 =?utf-8?B?Z2R3NEUvbnJUS3NTeCszVTBkSE5YdjFUVFN2ZzJ1bTVZb2N5RmtiOHdXM1Zq?=
 =?utf-8?B?bVdQNzMzNnRsZEozSTdMMFFCUEZiZHFSYnAvaEZQV2tRdlo1Y1JjUllnb2k3?=
 =?utf-8?B?VVZMcFZMazNCOWxaRFdacFJNYTd6MWdqN0pvUXJnY1E5YmxkQkMyeHJvREFB?=
 =?utf-8?B?OVBBZy9LR3lOM2xNZFNsQzQzSUJiTys3ZHVORnB0QWFWbUwwM3FnT2s0UytP?=
 =?utf-8?B?T0FVR2ZLOFA1a0x6ekdLdnZUemlYaUZvUXFlL1VycDZKOHRZVVdqZDQvOTUy?=
 =?utf-8?B?VW5RTmo5OWU3RXFzYk56d0FkekVrR1ByVHlObnc2NytwWkVIUjlvTGJUVkJ2?=
 =?utf-8?B?a2t3UWVEUVpkL1E5bk1qdEpCZ29OaUgzeWJMWGU2RGg0L2R2R1U2MzhzQjg0?=
 =?utf-8?B?Tmp4Nk9HWTE1UE8vUmFZWFF4emEySDJkcGQ0Rnp1U2RlZnFWUVhYcERyM1Ey?=
 =?utf-8?B?WCt6L1ljZjArZjVMUHhkUmpOejNoR2RIdVU5UVN5by9SaEk3bDJEQ2dzazdU?=
 =?utf-8?B?cVlUYzFMcW96OEpGUHV5ZUdkZ0JGeCtYVW9kRi9qekZoVTZ5M21qU3h4ODg5?=
 =?utf-8?B?cXRVbkVzMUxWdXNLY0ZVNFVXenV2dTFLMldTWTA5dFFUTkl0dGdhRFB0a2R3?=
 =?utf-8?B?UmxrSGc4ZENyWUNjMWVXQUM2TU00R2YxNElFdkZ0V2lYaWcwbnpzTHAwUFBt?=
 =?utf-8?B?OHhxalBNWEVSN2VIcDVDRk5JRms1dVRnRngwM3RQUUVsUUtHbUF3MVFiSHlx?=
 =?utf-8?B?aXFpWnBaa0FHMC8yaDJFcjRmVTZlckZ1RDN6WWdJcWVycHlGMkR5WlVtMXBN?=
 =?utf-8?B?M3B1UGc1MDhGKys4UWxNRnk5UmtLdWtESkMwY0ZXVUhjMEZHQ1FHaWxwQ1N3?=
 =?utf-8?B?eVpWSVFLOGFGa3NSNmRCNVo1RjVZNldnRTBvZGRpZ2dpRkZETTZFaUVRcTA3?=
 =?utf-8?B?MXZWYzB3UzYzMXRQbXVIUWJTM1Y1c1V1RkRFWW90Q1BwU01qd1pndzB6enJU?=
 =?utf-8?B?VnMwdjZKRmsvZWMybEZXZTYwRSs1bUN1VXZLOTJ6OWVGWDB1SUMwODhlTTBo?=
 =?utf-8?B?aEdlNnhjUFhQQU1BdGpzejIvWTZvby9nbnVIRU1EQ2dHWWhvaXNlQnpFbmxK?=
 =?utf-8?B?MVJZZDZwS1VRYk9iTHg1SGVLRno3cGwvVUhYOE1EcnovTkZLdEVjSUoreHY0?=
 =?utf-8?B?QWdBaGRHYnM1cEloSmV1Y1RoUnZuWS9jVExhQ3d3UDVMeXVCdDhJMkhjQ0N6?=
 =?utf-8?B?Y1dZNVpQT3J5bm92b1huUjJFSE9TbG9Kam1HWllsMHNWTTg4bXF3aFBaL215?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403c5a72-a454-4847-5a0f-08ddf51bb4bc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:22:30.3472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nv/nCo+oietgjzCqPd+R293LNx+MgHX7I+UCW7tPikC/3GbmSlOpWgTKvnoBFh4yvtDpxhDt6gins6m6cyID1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684
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

Enable MIGRATE_VMA_SELECT_COMPOUND support in nouveau driver to take
advantage of THP zone device migration capabilities.

Update migration and eviction code paths to handle compound page sizes
appropriately, improving memory bandwidth utilization and reducing
migration overhead for large GPU memory allocations.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 ++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 230 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..3bcfd2e5ee4c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -50,6 +50,7 @@
  */
 #define DMEM_CHUNK_SIZE (2UL << 20)
 #define DMEM_CHUNK_NPAGES (DMEM_CHUNK_SIZE >> PAGE_SHIFT)
+#define NR_CHUNKS (128)
 
 enum nouveau_aper {
 	NOUVEAU_APER_VIRT,
@@ -83,9 +84,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +119,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		page->zone_device_data = dmem->free_folios;
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +152,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +186,47 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
+
+	/*
+	 * Handle partial unmap faults, where the folio is large, but
+	 * the pmd is split.
+	 */
+	if (vmf->pte) {
+		order = 0;
+		nr = 1;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
 
+	args.start = ALIGN_DOWN(vmf->address, (PAGE_SIZE << order));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +237,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,25 +266,40 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	tail->mapping = head->mapping;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
 	struct page *page;
 	void *ptr;
-	unsigned long i, pfn_first;
+	unsigned long i, pfn_first, pfn;
 	int ret;
 
 	chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
@@ -241,7 +309,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	}
 
 	/* Allocate unused physical address space for device private pages. */
-	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE,
+	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE * NR_CHUNKS,
 				      "nouveau_dmem");
 	if (IS_ERR(res)) {
 		ret = PTR_ERR(res);
@@ -274,16 +342,40 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	pfn = pfn_first;
+	for (i = 0; i < NR_CHUNKS; i++) {
+		int j;
+
+		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+			for (j = 0; j < DMEM_CHUNK_NPAGES - 1; j++, pfn++) {
+				page = pfn_to_page(pfn);
+				page->zone_device_data = drm->dmem->free_pages;
+				drm->dmem->free_pages = page;
+			}
+		} else {
+			page = pfn_to_page(pfn);
+			page->zone_device_data = drm->dmem->free_folios;
+			drm->dmem->free_folios = page_folio(page);
+			pfn += DMEM_CHUNK_NPAGES;
+		}
 	}
-	*ppage = page;
+
+	/* Move to next page */
+	if (is_large) {
+		*ppage = &drm->dmem->free_folios->page;
+		drm->dmem->free_folios = (*ppage)->zone_device_data;
+	} else {
+		*ppage = drm->dmem->free_pages;
+		drm->dmem->free_pages = (*ppage)->zone_device_data;
+	}
+
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		NR_CHUNKS * DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -298,27 +390,41 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		page = &folio->page;
+		drm->dmem->free_folios = page->zone_device_data;
+		chunk = nouveau_page_to_chunk(&folio->page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = ilog2(DMEM_CHUNK_NPAGES);
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
+		folio = page_folio(page);
+		if (is_large)
+			order = ilog2(DMEM_CHUNK_NPAGES);
 	}
 
-	zone_device_page_init(page);
+	zone_device_folio_init(folio, order);
 	return page;
 }
 
@@ -369,12 +475,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -382,17 +488,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -403,8 +520,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -607,31 +725,36 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
+	unsigned long mpfn;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -642,10 +765,13 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn(page_to_pfn(dpage));
+	if (folio_order(page_folio(dpage)))
+		mpfn |= MIGRATE_PFN_COMPOUND;
+	return mpfn;
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -655,27 +781,38 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
+
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
 
-	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!args->dst[i]) {
+			i++;
+			addr += PAGE_SIZE;
+			continue;
+		}
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -688,20 +825,27 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 unsigned long end)
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
+	unsigned long max = npages;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
-	if (drm->dmem == NULL)
-		return -ENODEV;
+	if (drm->dmem == NULL) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		if (max > (unsigned long)HPAGE_PMD_NR)
+			max = (unsigned long)HPAGE_PMD_NR;
 
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
@@ -710,8 +854,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -729,7 +873,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -738,7 +882,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.50.1

