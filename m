Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D3AA541BF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E3610E8D2;
	Thu,  6 Mar 2025 04:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBKpvPmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972B10E8D2;
 Thu,  6 Mar 2025 04:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D08nH6myRW6o5Dyoo0H9y2ZfKrCujQF3ZfCfBYkH30GX5JR55tvX2UTQeXJ+7eUxjpysnlSxI4Xlf1ow40/1wlv+8509rPsD18SyyR82t9ox9pV6war+RyeA2Le7wGnECVyHXzs2ISgVUTZBXpEAYmoK4zbpJX2Jpr1ZeHr7xk2tPR9SgjQHxG3Oy6todang2cuqqWBtks9CzKCohbrRPy/3HgeMs1JgiwXpn6+tXwAyTYoM/CpPvlDVowcp5DQZ0NNp8YG8+oQ5VRr+lQwOSx2txLLvYgCpAnTPljyMRcQJ461jEVoutjMgWvcVcnyWGcrtFqbQBq/umJeEJ5/Aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4ZWVBlCG+6xuz/ii5TjkKlEEl+1Fnjg/Kbid3vR3N8=;
 b=MIeRhOrCZN8IbYk8qjzOzUs6flYp2vwxptozsO8DkwmM3r2FD4e5YLcW9UlQUxElNQHpTv7FEC5+w1zfDOsWNn98yBV8Fm8xaudpyXTHaMYplrgUL/erXE9FMFjsqzUpUiuDT7flostiXYaItUdqcSkTCXAbE6+om0VToGFb5313DsuEdK/qnFUnb4UMltJjBZgJesMP+nZAyoVs9Xnw3s4ECP2qSBa6EZLZetoQ4Z125bxgNe1ligXaI68uwTTnOkq4SMuruX7EqdCryslZNSZaNTcYxECz8aW1v6a6d49wItRh9Jj5Fh97NSCubAnKyI1lveMZr2Tz5i3CHWgf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4ZWVBlCG+6xuz/ii5TjkKlEEl+1Fnjg/Kbid3vR3N8=;
 b=mBKpvPmURzp6GPKvuj2Rz6p9oiDNvVoUdecHACsQpjSjF+wb0dkqmRQs7gpx8WKxRTqgBvCMvLFEVjw8682tokdPLVJ4PRGR5m4PgwVFfEATg/cz9GlUvBBPyGQBygfqeoMW9YMD9Du07EFCU49z2bnbMPFJtPnd3H9D4TIsMQXi3d77slPbPso2gj+1tOdcJE3WG1jTD3zBmKq87As9W7DPQkCSt/h7Aktkj53u1EZKHH6qTP0JzhW/kEUM9IEqCHJXMudrpvEqRpWMLIBSEDhfdjc7c6yMmY5+jES0C38TDe6lj3Y7oUOBeFK1WvpYTYpQUemnJig0Cz9//QVH/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 04:43:43 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:43:43 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 03/11] mm/thp: zone_device awareness in THP handling code
Date: Thu,  6 Mar 2025 15:42:31 +1100
Message-ID: <20250306044239.3874247-4-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d3cc62-0c2c-47c0-e260-08dd5c697953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rSaix4kFE0KoVLCcaxlsH08DBjCu333oIm/ypZU+cl3NVZD8mBz3CN/e7CMn?=
 =?us-ascii?Q?fFdyd0T67Xvs2K7JyB0MxJDBVyWXoLIYNNcq3iX3Q0qELUexdZ+dl0YGL/m8?=
 =?us-ascii?Q?fRGFeK940kPcIO89hUsSJaYAYfPuuTCqq/HOiFz8L5tafu0uwQqGpPmYFyIA?=
 =?us-ascii?Q?bhXP6vb7NKjdMugfliPVgaj4Xb4risQMztE2Cu8dkHDEMlkrAQIvBk3ayXCL?=
 =?us-ascii?Q?PULcXf9WmWkE8//SU/FjW2yMKw2yNLL0zipcoXG8kzrLzYB0Dvmw8VkcANf/?=
 =?us-ascii?Q?kHmLrR6GcFBZ/2x6j5dZ96k1bViYMbOBh2GKSM6kiAuOZI0cc47KxuJPF/Ql?=
 =?us-ascii?Q?VDEdWK8814v+HpajL23J9UtTKMgW8xE9AxSLAyPX3/Oi8aGU6Fh12Ob+bTet?=
 =?us-ascii?Q?xSgZL3W9egU7zapx002zvaQ/hHEOIzHzRJTK7wKGpUoO2vlQR+SGY3x/TX7g?=
 =?us-ascii?Q?LmhCeH76G2ZpQnCYc1j+pQmEJs7Z2+ZnKWSjthLBeTBfKT4ZsVfyQHF5bOCN?=
 =?us-ascii?Q?BAlPfCDSFQbRHG69lFI7n/x+TCmdvHqkatog0xlQHT82QlUR81ACX1pXD+FF?=
 =?us-ascii?Q?Jof78JPt7WE44+SE7qcruNqB0B+3cyCKupeQILtVHSlYcLnoPnE7Mhqyp0ab?=
 =?us-ascii?Q?gZM+g0LRtyv77onTi/+Gil7MxIh0I0xxvKYxR3ecbMKgaxOaQgXJlni0CDiz?=
 =?us-ascii?Q?Zqg05Q79DVTGZoiArfMrJ3FVbwfqKh3SPR6jAPQ2wHFbkImNmsHDJ3wT79Zj?=
 =?us-ascii?Q?K39MsZXTsS8eoKKls6NWa2P8wQ36vu6Pv0f2Xrpnr8F7tJu8H1yDuQO2Qw/s?=
 =?us-ascii?Q?J1Rjo/M71HPjnot5sEcGOGtGnAZ9CDhuQN4yqajWu73hZ0JoTNSNsbuc0ZaD?=
 =?us-ascii?Q?R6f+yfPf+K/hvqt0Y9bs1bNxZi33Tth/cUyQ5GDD9NMLbQr1iUp03lqv3blb?=
 =?us-ascii?Q?SDApWbC1EwH8dQRnoItyFnmEPYJek4aeErYXB415R2EQRKbBpWd2pdydChup?=
 =?us-ascii?Q?q8Qfw3KOGYHQHgB5+bdocPbmNpxDv6m/JiUi8xxZ1lUjt420jNtgvU8+48PS?=
 =?us-ascii?Q?O+EFavKj9t10JxMHVaYIAGKhx/LILedOLH5oET6beofKemt32JB6XB2cm9Jz?=
 =?us-ascii?Q?hDRqk6cCc3BrBwOKkmmm8su0sJ2QBSx+8IbUgyFrRHxub7Wdz59afYynidaX?=
 =?us-ascii?Q?72QmMqAVQAuhB5NJV/1Nv0y2rKaYWhA+anMxeDyaId+6BVnZ4ecUrLFwlRZl?=
 =?us-ascii?Q?iE52X+Gv8U400jcXULwaTrdKhlqOHnyu4guoGw0opgg+PaI+rX8I92zRdcj/?=
 =?us-ascii?Q?7Mr29E0xPSH7iKOXUmALIOkqQX6XgQYJIk41dC7paEQcultqUOGiR4IEVZ6X?=
 =?us-ascii?Q?0F7caDXupKn3hwUQjdNXammXTuxt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cs/q9rCx8fZUVJhYQSpw2PYK94HaynvidjWCmlpjqcbrJBG23dBOIynbqz72?=
 =?us-ascii?Q?vIFn9WYTcLRTQmEA0hE3cDqDoSkQoYx+J4xWWsEUYPlK8huDF+Wm2DrQuBV4?=
 =?us-ascii?Q?VST4zPwn8aek/Uurisa/iH8mx9huVowGNrOyxg5Jny1Z+P9k1XH6TocMqvPm?=
 =?us-ascii?Q?8YjppfekAKelEoBYEqESQ766gewSoRhcZ14x57Nk+itV3XeJYsNvYVNTkBcJ?=
 =?us-ascii?Q?8zxngAiN73wxJz0CThAg28QydP8o3mmV0uHIUEjf9N2J19lYqirS+YHUFi1n?=
 =?us-ascii?Q?GAFCpTwjWw/badj428znsyh+fOyipiUQDHaHWchNLmrBNuQaYKrh3aWIb6ar?=
 =?us-ascii?Q?VzWrg3WnJ/y0Y9OnEgEBJ3kdE10jSwPajI2L8nhETQxkfwmxtmTYN0VTMHk6?=
 =?us-ascii?Q?glqZb1mL2O6OVIu2GSvkuUUoH5XWTkyQqa5PsRgMNPxzb5vQ4qku91l8/Y5q?=
 =?us-ascii?Q?U/p4qSzIOYV1GSRELijI77Dm9QrdmgBZ0ZK7QwM+MDd1dtZyc728xCuY8t5S?=
 =?us-ascii?Q?HQf7nIAojDlX/xgu62rTuqKSiIpQFGweCDccudBpLrLooYL3nd76fMamzsrq?=
 =?us-ascii?Q?B5f4pGkETdkhfYcxj5+6mE4RaIELEpPsxqWNbA/iVjHaDlnzF1KlP05eqRnn?=
 =?us-ascii?Q?DnSD/TF6nvxM/elfYrkJ6aDJ65ToN5qsjVlMDAHc8H9sFou+9YE9ve1R0+2Y?=
 =?us-ascii?Q?7IPQUYBRXEqQasFUw/9vHE+um1RHM7q3oh7/+2KVzHOfm6Lx2mwDMx869qOX?=
 =?us-ascii?Q?ORL2LPGr+zMWcLwN0db5LgaajSJKijZInXl0UFeVEfMlSP83AaLCkaqRlG21?=
 =?us-ascii?Q?YCpdFYdrBR9C5cWKrlC863UgWIGN4n/Z+WiAykZny4Amv2kcOiNmadTQlc0L?=
 =?us-ascii?Q?OFi7oKgydo3ci4zeG8Tu2UKq7L/RdiUm9iPli/9TVM23DsJpzPw5+dFJuCMk?=
 =?us-ascii?Q?8HePNbscSrfG0l+gypm+gRvShebGXy44hTxmMhB4z86NUl/DX6KN0slYI2/k?=
 =?us-ascii?Q?hq44ufkzLEdzhcjrNa2Ybew7KsoMTlktTz3WDYpls5qM7JBETgxw9dlrgPrp?=
 =?us-ascii?Q?UaDmPnYDZtrfRcoz2tkF+2iN0qfYW+ETV37S5x1JJRlHc21dk9dO3TRKKI6D?=
 =?us-ascii?Q?fPpq6Km6pZ0CFFkY0P9Q31gwMXZSTadwONRQa1HsWZY8MQNylEIemdPTyneZ?=
 =?us-ascii?Q?c+azWgM6cmSWpkKbg/jrdF4kSSsOBRKen4wTtk6DTEwP1haTYQsKou22N7gN?=
 =?us-ascii?Q?/4MwRd2FSMepyYtVDq4x2HkT9X4J7C3YfdaaRNXHdmvLeK0akEa97WznyYZk?=
 =?us-ascii?Q?JEwjCx6uuYHeiiw5dztCwVdZok/MSl3aSPEqYaWeKmbfuGMX9SzCh4jb28q4?=
 =?us-ascii?Q?Y6EXZR8oSOmCZIupUWMOoXACrjTVeX3qF2D9TD7C1aaWRTXW1e4/pRC/qLRL?=
 =?us-ascii?Q?6HjTr1j7RtUjxH9HRwYYGQ22hf3P4SfAXLy64QZZ2T2xnx9I0qKkN5HT2XLD?=
 =?us-ascii?Q?DAote8/HGLsrAMCaRBSWs/L2XXqGgSxPPymag/46jMKc1uiy79crK18v/efK?=
 =?us-ascii?Q?KznxVwyfiz21At8F4yqWr+V/4/CGofou1MArVtIC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d3cc62-0c2c-47c0-e260-08dd5c697953
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:43:43.4461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3fWZQgZqDQI6+esUH4icRNu8WvQMtrNDkrIJgfuQkW4+HFFXIPY9bTIf/8+NCt+D1cR+UpVo7QApeV1KHvWLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
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

Make THP handling code in the mm subsystem for THP pages
aware of zone device pages. Although the code is
designed to be generic when it comes to handling splitting
of pages, the code is designed to work for THP page sizes
corresponding to HPAGE_PMD_NR.

Modify page_vma_mapped_walk() to return true when a zone
device huge entry is present, enabling try_to_migrate()
and other code migration paths to appropriately process the
entry

pmd_pfn() does not work well with zone device entries, use
pfn_pmd_entry_to_swap() for checking and comparison as for
zone device entries.

try_to_map_to_unused_zeropage() does not apply to zone device
entries, zone device entries are ignored in the call.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/huge_memory.c     | 151 +++++++++++++++++++++++++++++++------------
 mm/migrate.c         |   2 +
 mm/page_vma_mapped.c |  10 +++
 mm/rmap.c            |  19 +++++-
 4 files changed, 138 insertions(+), 44 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 826bfe907017..d8e018d1bdbd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2247,10 +2247,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		} else if (thp_migration_supported()) {
 			swp_entry_t entry;
 
-			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
 			folio = pfn_swap_entry_folio(entry);
 			flush_needed = 0;
+
+			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+					!folio_is_device_private(folio));
+
+			if (folio_is_device_private(folio)) {
+				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
+				WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			}
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
 
@@ -2264,6 +2271,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 				       -HPAGE_PMD_NR);
 		}
 
+		/*
+		 * Do a folio put on zone device private pages after
+		 * changes to mm_counter, because the folio_put() will
+		 * clean folio->mapping and the folio_test_anon() check
+		 * will not be usable.
+		 */
+		if (folio_is_device_private(folio))
+			folio_put(folio);
+
 		spin_unlock(ptl);
 		if (flush_needed)
 			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
@@ -2392,7 +2408,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		struct folio *folio = pfn_swap_entry_folio(entry);
 		pmd_t newpmd;
 
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
+			  !folio_is_device_private(folio));
 		if (is_writable_migration_entry(entry)) {
 			/*
 			 * A protection check is difficult so
@@ -2405,9 +2422,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
-		} else {
+		} else if (is_writable_device_private_entry(entry)) {
+			newpmd = swp_entry_to_pmd(entry);
+			entry = make_device_exclusive_entry(swp_offset(entry));
+		} else
 			newpmd = *pmd;
-		}
 
 		if (uffd_wp)
 			newpmd = pmd_swp_mkuffd_wp(newpmd);
@@ -2860,11 +2879,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	struct page *page;
 	pgtable_t pgtable;
 	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
+	bool young, write, soft_dirty, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false, present = false;
 	unsigned long addr;
 	pte_t *pte;
 	int i;
+	swp_entry_t swp_entry;
 
 	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
 	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
@@ -2918,20 +2938,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		return __split_huge_zero_page_pmd(vma, haddr, pmd);
 	}
 
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
 
+	present = pmd_present(*pmd);
+	if (unlikely(!present)) {
+		swp_entry = pmd_to_swp_entry(*pmd);
 		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
+
+		folio = pfn_swap_entry_folio(swp_entry);
+		VM_BUG_ON(!is_migration_entry(swp_entry) &&
+				!is_device_private_entry(swp_entry));
+		page = pfn_swap_entry_to_page(swp_entry);
+		write = is_writable_migration_entry(swp_entry);
+
 		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
+			anon_exclusive =
+				is_readable_exclusive_migration_entry(swp_entry);
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+		young = is_migration_entry_young(swp_entry);
+		dirty = is_migration_entry_dirty(swp_entry);
 	} else {
 		/*
 		 * Up to this point the pmd is present and huge and userland has
@@ -3015,30 +3040,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	 * Note that NUMA hinting access restrictions are not transferred to
 	 * avoid any possibility of altering permissions across VMAs.
 	 */
-	if (freeze || pmd_migration) {
+	if (freeze || !present) {
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
+			if (freeze || is_migration_entry(swp_entry)) {
+				if (write)
+					swp_entry = make_writable_migration_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_readable_exclusive_migration_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_migration_entry(
+								page_to_pfn(page + i));
+				if (young)
+					swp_entry = make_migration_entry_young(swp_entry);
+				if (dirty)
+					swp_entry = make_migration_entry_dirty(swp_entry);
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			} else {
+				VM_BUG_ON(!is_device_private_entry(swp_entry));
+				if (write)
+					swp_entry = make_writable_device_private_entry(
+								page_to_pfn(page + i));
+				else if (anon_exclusive)
+					swp_entry = make_device_exclusive_entry(
+								page_to_pfn(page + i));
+				else
+					swp_entry = make_readable_device_private_entry(
+								page_to_pfn(page + i));
+				entry = swp_entry_to_pte(swp_entry);
+				if (soft_dirty)
+					entry = pte_swp_mksoft_dirty(entry);
+				if (uffd_wp)
+					entry = pte_swp_mkuffd_wp(entry);
+			}
 			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
 			set_pte_at(mm, addr, pte + i, entry);
 		}
@@ -3065,7 +3105,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	}
 	pte_unmap(pte);
 
-	if (!pmd_migration)
+	if (present)
 		folio_remove_rmap_pmd(folio, page, vma);
 	if (freeze)
 		put_page(page);
@@ -3077,6 +3117,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 			   pmd_t *pmd, bool freeze, struct folio *folio)
 {
+	struct folio *pmd_folio;
 	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
 	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
 	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
@@ -3089,7 +3130,14 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
 	 */
 	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
 	    is_pmd_migration_entry(*pmd)) {
-		if (folio && folio != pmd_folio(*pmd))
+		if (folio && !pmd_present(*pmd)) {
+			swp_entry_t swp_entry = pmd_to_swp_entry(*pmd);
+
+			pmd_folio = page_folio(pfn_swap_entry_to_page(swp_entry));
+		} else {
+			pmd_folio = pmd_folio(*pmd);
+		}
+		if (folio && folio != pmd_folio)
 			return;
 		__split_huge_pmd_locked(vma, pmd, address, freeze);
 	}
@@ -3581,11 +3629,16 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 				     folio_test_swapcache(origin_folio)) ?
 					     folio_nr_pages(release) : 0));
 
+			if (folio_is_device_private(release))
+				percpu_ref_get_many(&release->pgmap->ref,
+							(1 << new_order) - 1);
+
 			if (release == origin_folio)
 				continue;
 
-			lru_add_page_tail(origin_folio, &release->page,
-						lruvec, list);
+			if (!folio_is_device_private(origin_folio))
+				lru_add_page_tail(origin_folio, &release->page,
+							lruvec, list);
 
 			/* Some pages can be beyond EOF: drop them from page cache */
 			if (release->index >= end) {
@@ -4625,7 +4678,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 		return 0;
 
 	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	if (!folio_is_device_private(folio))
+		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+	else
+		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
 
 	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
 	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
@@ -4675,6 +4731,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	entry = pmd_to_swp_entry(*pvmw->pmd);
 	folio_get(folio);
 	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
+
+	if (unlikely(folio_is_device_private(folio))) {
+		if (pmd_write(pmde))
+			entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+		else
+			entry = make_readable_device_private_entry(
+							page_to_pfn(new));
+		pmde = swp_entry_to_pmd(entry);
+	}
+
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
 	if (is_writable_migration_entry(entry))
diff --git a/mm/migrate.c b/mm/migrate.c
index 59e39aaa74e7..0aa1bdb711c3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 
 	if (PageCompound(page))
 		return false;
+	if (folio_is_device_private(folio))
+		return false;
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index e463c3be934a..5dd2e51477d3 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -278,6 +278,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			 * cannot return prematurely, while zap_huge_pmd() has
 			 * cleared *pmd but not decremented compound_mapcount().
 			 */
+			swp_entry_t entry;
+
+			if (!thp_migration_supported())
+				return not_found(pvmw);
+			entry = pmd_to_swp_entry(pmde);
+			if (is_device_private_entry(entry)) {
+				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
+				return true;
+			}
+
 			if ((pvmw->flags & PVMW_SYNC) &&
 			    thp_vma_suitable_order(vma, pvmw->address,
 						   PMD_ORDER) &&
diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..67e99dc5f2ef 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2326,8 +2326,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
 		/* PMD-mapped THP migration entry */
 		if (!pvmw.pte) {
-			subpage = folio_page(folio,
-				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
+			/*
+			 * Zone device private folios do not work well with
+			 * pmd_pfn() on some architectures due to pte
+			 * inversion.
+			 */
+			if (folio_is_device_private(folio)) {
+				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
+				unsigned long pfn = swp_offset_pfn(entry);
+
+				subpage = folio_page(folio, pfn
+							- folio_pfn(folio));
+			} else {
+				subpage = folio_page(folio,
+							pmd_pfn(*pvmw.pmd)
+							- folio_pfn(folio));
+			}
+
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-- 
2.48.1

