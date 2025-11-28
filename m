Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF3C90D7C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 05:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F160610E713;
	Fri, 28 Nov 2025 04:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cnORAWNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E066610E75F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 04:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUQeqU2+sNFInPjxaP9xPa1L6rF99u2ElrxhXeFVP57raE4uFAD/fI3eDlQL6dLIXA5duiCOeroFU0ObqMtO919SkXy2kTlIidDYWfjRgYkwr4suN2PhhzWxNUselrhjStKo18Am/jnPtGjGggaxAxGfRPIGdDUaTPVVvlkY6Yk7YWVbs864YggP521okjs3pWt+G4QUSNIrGjFk0pl6ryjzWGKHGyTTshAK9dyA0a9IUeLVOeHmk3FzPfAtwWyfGr4tDCVtPAmeSEMTMXC3d359g40p4JwY24440Le9LQEVVu7/vT/tDT9EMUK/Esab5brtPTnFUzdPTke2igL+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCbQVhYsLzUTy2wEbA7auN8AWdyEUP1vgJe2ayHSlKY=;
 b=Jbn/j79y/eHpfeeekB28HCFki0SgPDltEYpyrxNYyVoos43VVGiXyBhX8nFbutlVXtYUj1tXNVSq0toQVAlA9JZ6YetKzf4QXPdpWvJ2hD6jgqumUP9/CG+ZCV0IFGogtND4OMF5cB+IGnMO1hakPP3lXWYvAk4WHO6XPlrkuiSD/nh9zyoyPC5FDXShCqFt3Zq4v4cRhPCst/qexj4LgqEDTKZ50AShxs0TmlKO4ZvQV27TUWM3K9YFhE81H0W7VZRCr94tWKCdzNW/hc96sYDV//nJAk5atvvlArjWDZ4Rtcfx91pP/Ei67xRifg3J68SD/84XJFsPJ9fcI7JiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCbQVhYsLzUTy2wEbA7auN8AWdyEUP1vgJe2ayHSlKY=;
 b=cnORAWNBSDw8LV74MGNC3TcqSrD1EzLOJBLfobmOmQBukR9EZ04AXtJ7pF7wuk4u7/XVqf/yRSbKVJmT9LtDkziz1HvPMP4WPtcJYmE2wc3xv/2FfzONFyuqvkiE3GM/1I/A98W0ik6QpKhvvi2NQ7qohR8cTUG6ZxKUd6b/PcISZXTH+raNInbe8Nzy3nrHTtALYzsuldoD21WgG5WwL5s/GqZRms74bhHK2zTkqp6RogOgPmWILsTMW1EDwZV+sVfYa0/RbvGfI0vKMR/mFhzosPg0L9lFZiWxXgzQcWoojfZT2IAHGJ4oqS3Jc1vflAAZxOEKFvdVYfygymO0Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 04:42:39 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9343.016; Fri, 28 Nov 2025
 04:42:39 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
Subject: [RFC PATCH 2/6] mm/migrate_device: Add migrate PFN flag to track
 device private PFNs
Date: Fri, 28 Nov 2025 15:41:42 +1100
Message-Id: <20251128044146.80050-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f62411e-c76d-4367-4548-08de2e388f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3lE2EmUEqgC4GtYXyPmsvnLbem5wPQfN3ofj5Vy6hGs8028Y9eXJZ+yvCins?=
 =?us-ascii?Q?C+VwoBr/NjK/dfzyhizxtD2WTsMPweSf0VYiJJ3WSQXD1fpV/PiDBMZgj2yY?=
 =?us-ascii?Q?Y+YVnvjR/Y5+5zXjRVkeJQa5+FqiqoyOHZJdR/MBLCRnhgZcdUnNpVVuXHJG?=
 =?us-ascii?Q?+WqU0cfyADEMyZoPR9BmplaqGusukuw2aqCa6ZlY2Gbzv/8d2mpBR9f5/cfz?=
 =?us-ascii?Q?U6/Ij7hOU3tpTwrmYRwTYn6xqq5LiYbpQKa3AhpNfaVCNxcIhO4o9q0To+RL?=
 =?us-ascii?Q?pTyhnIpjZm/cjOWRuwzdjSi88Eo2mVKUyqxff0jVBhcu2Ueci18Xj2S9m4Cj?=
 =?us-ascii?Q?GKUTt3NlwMkXOqdpgmQpWDncmQBBvZnXZ6kT19UpYszLTFSqH94EeH5ve2Mc?=
 =?us-ascii?Q?RBbI24cAsnBd32ThNR0VBHpHsp6ChtspvjtIwOeAvF6b2Q1r4JTWEmCt2pIb?=
 =?us-ascii?Q?iSmNgIcGUjo7bUnGjPoIP98SW1HEyDxuuZqe9jWebXOY77zLoG5RuHGDRb2V?=
 =?us-ascii?Q?W2IS9cJphwqWEIueCFEPiH5JiKofU5o1k8BIuM9xl+PWsM/2F+d/IJWgCQq9?=
 =?us-ascii?Q?f5XPKSiCdfyYOKZ3Hqj2zlRsdhfp63U3jg1Lljt4b3EjNTYTW83y5MD44712?=
 =?us-ascii?Q?s2ifF57jmk6idGh2ISysbrDVg6n3g90RDji5MQ3uRi7uNSwHs+4Drr5aRY8q?=
 =?us-ascii?Q?JXwKQ0CXCgVsgeCKzVsDCxlZEWZJW94/MN9QiaXlmtttuZoqZwpzjIyZMIdE?=
 =?us-ascii?Q?AH5U0CK5OfZjqRrZevJwLqauJo8L4N2Afw1fafJFhjeYFs26tKUYW98yb+Zu?=
 =?us-ascii?Q?698e/Bb+bN89CToT+AXjRqU+Idy1YEEyTf4bnNJ1Zr85iMtMaVmuGVCy4Jm+?=
 =?us-ascii?Q?LBbBbAhIF9MjpN6IoYga7UlW2eJLXCOVkLhv0vaWy9FWN/t+Fts5f3Gt0g9s?=
 =?us-ascii?Q?Q6YTg60Hpn7tIjh8hytOEPecXIt/9/XjufzAkSfhTHSuYACARHWKGsKupoql?=
 =?us-ascii?Q?RdQpZPk3qbhuMOKYl99hwrFl0rJo+3FmHE7g5LWhPC9VjJSbiALhWTn4zbvm?=
 =?us-ascii?Q?rdWMRLRx2IeJ0I2oNkoeR9NfYeiLwg4pUNZreJJuVZMfzHo6DMxo9q6MJtY7?=
 =?us-ascii?Q?RagE/3LDpyo36enBP9eK4ovUkjA9SWupclcroL+BPAdrhzeLf56+b/5XRcq2?=
 =?us-ascii?Q?CwznoB+cW0czgJ0r5fm1uCOxELdY844bxaN3jxv5r5CJfN2dQzOgOdRHucy7?=
 =?us-ascii?Q?v3ZAw64o6sNz1N9X2c4SQHKcAHSgi6P7afiGKM+8NX+PisK+g4fBGrWpS6tj?=
 =?us-ascii?Q?7eknkdOEWqZUTm26WPmUuEUoWFwP81y55IVLYzU/vGkGDdC1Q2PHIFOjnLPa?=
 =?us-ascii?Q?2v1TUnzNj8DDEMZzRwU58s+78MKSF06c3JRTJz3GjprNmdSVy143ROvkTJik?=
 =?us-ascii?Q?nD6V6Hg9JYOFRuo43TdWGhjOQvZEpape?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?STvp8a3djIuH5WQ7XqXMju6vya4xHsCPPZgnisnsNSdCOTdztpxozAFcfKm/?=
 =?us-ascii?Q?n7rPfyL50UVEspqUtQA80S0oI1PrLkdp5jFEqUJ5XLMGuzayOq/07Zgbs2cx?=
 =?us-ascii?Q?C7EX93Ztv0Ypog7DVW3c4UGnODeLzy2MLo7Wsj+aC3auCN2GWYirgrtoEu1F?=
 =?us-ascii?Q?CvB3K+FQ67uaEwVoFqWgW9gnQR/vw+2F6xOSADxLTuv8dCHR7XDb0OGHSvQe?=
 =?us-ascii?Q?rbqWlo2xjSPZ8LNtMtsrQJwMvsdYNVREO8PkQxc57AdWUW9q1JPTSRRpS+B6?=
 =?us-ascii?Q?CH3uiLNifHnoyH8cPzLKSkDI7GUylgNku1dXW0HDSJENh+EVP/PyuZ/l+EdA?=
 =?us-ascii?Q?ssAjbp3ayEAHYXlZyvURosPtJqYuW5XYnkUgyrbFNdutyPvRJ/h+v7Bi61NI?=
 =?us-ascii?Q?SuRsYV2Lwb6BWqyRmFAzokrBw83oBzWjNAy8VW9nGmJS83PGT+sMjaNaKILX?=
 =?us-ascii?Q?PepT9TRoX8+czopBj1DPOJn36tIrkzI5P/rOJnA58WlUNZEoiOO3vk7a6qAO?=
 =?us-ascii?Q?Cd8NyZro0ELb7+OUufE2p3pAAXJtuxWJPGAlZ/17Jwxov7eajy5nIMiR9QVS?=
 =?us-ascii?Q?L/H4UkuCnaprmfD+W4r+8SACFyC1TY2M+Rerm3pTqJFICS6T9p8Tc8xVOzfi?=
 =?us-ascii?Q?Ne2Jq6pYOjG0PM/rQG+IcNc3u+BRcJuf65pZlcPLI0wqLMXoHha3pKtwJINN?=
 =?us-ascii?Q?dSH4DbkedFf5cMezHeb5qgNlYNADcc6h9rgNzcHd72dvOxGiKaX3FxMUTQaR?=
 =?us-ascii?Q?xoUgHiSumv1bsCOY7YfihYyR/1L6g9pYXRMRKNMd2Ef2BBQLwG9oKfMY4VbZ?=
 =?us-ascii?Q?M7MA0Et8E8j4U1snNUfJmBxih85IisJe2pC92FM7ZZuGHwgbKRZ7ztspRMrY?=
 =?us-ascii?Q?2T7uKpVlqWe5la2hnaz6qXKIFYLOQKumz68PcQh3Goq6A2qbK63v6m1uW2JY?=
 =?us-ascii?Q?h2nawLvLDRBV0SdHFU8lpNmHGLPhndhGnUftpdEOUih7hzVWfkO2WL+H6M26?=
 =?us-ascii?Q?GTOkHNAlcJx6PHJpkGOl4RMIkGuRLfWEc2wkAOJmRNmVByuY2SFGB5spJREv?=
 =?us-ascii?Q?YYGovcw65URLgP7e1xyoOVxl3cW9wGCqDgedvAQOa+QIa3vvmpF1GY1pCyxs?=
 =?us-ascii?Q?fpOqfXzeSVOYW79K4Ovr3mA558Uraje/QmvmhS8Vt2TOpiia/zUKHBjgVHwi?=
 =?us-ascii?Q?p8u0LaPPg1hhD8ZudIrcZ4oVTcz+XrO5GpDW/frerGX7J6v2jJlkHpMiex72?=
 =?us-ascii?Q?/pLssQeWU745kXI6njcNxGV/hWgW/+Z9qqF51AwC6PsgePLH9srBTFyVNam8?=
 =?us-ascii?Q?yZu8yWttH9pxm1z9V8OKXPXzWjTIIeTgSGJ/hl4f7INVaNXZgb23DmsydVwV?=
 =?us-ascii?Q?JMxIAlvCmiL4qAqaTf+ianD5Jfd4IAwr794bJ38VwQIOo4TgUuLIJUaM7jDt?=
 =?us-ascii?Q?yZsvvsDvunTi+sEqfIjQKRqNByyzOT3ihXviH0mXJq+B97PmkUTz5NAyq9kd?=
 =?us-ascii?Q?jn9CBOuR1p33ni0bwqwijrywU2RI6fn35KK39oXaDwD55ZrxCLq1Lc38pER8?=
 =?us-ascii?Q?Yu1qKV3mPPry5n+/Qt/z67MLs0EBw6dzoi1+5dL8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f62411e-c76d-4367-4548-08de2e388f34
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:42:39.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6rMg+N6IdVHswlUhr4YUvEcRBolPzWpHF5D951xKV7PmzkMZvTWhq0kB6e9Jl00aj2cLANOy626G2+mVUbV2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Note: Existing drivers must also be updated in next revision.
---
 include/linux/migrate.h | 1 +
 lib/test_hmm.c          | 3 ++-
 mm/migrate_device.c     | 5 +++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 1f0ac122c3bf..d8f520dca342 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -125,6 +125,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
+#define MIGRATE_PFN_DEVICE	(1UL << 4)
 #define MIGRATE_PFN_SHIFT	6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 83e3d8208a54..0035e1b7beec 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -684,7 +684,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
+		*dst = migrate_pfn(page_to_pfn(dpage)) |
+				   MIGRATE_PFN_DEVICE;
 		if ((*src & MIGRATE_PFN_WRITE) ||
 		    (!spage && args->vma->vm_flags & VM_WRITE))
 			*dst |= MIGRATE_PFN_WRITE;
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index abd9f6850db6..82f09b24d913 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -148,7 +148,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
-					MIGRATE_PFN_MIGRATE;
+					MIGRATE_PFN_MIGRATE |
+					MIGRATE_PFN_DEVICE;
 			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
@@ -918,7 +919,7 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE | MIGRATE_PFN_DEVICE;
 }
 
 /**
-- 
2.34.1

