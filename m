Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC96AE00B7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 10:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2510E9E4;
	Thu, 19 Jun 2025 08:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="biOVyghj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132B910E9E5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 08:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gppDhny/ixnX+dNhTmy+FlK0eX2Siyda1GplE0u8w3oXrNh+Vv4UYw9lnoLASxgKL18RbsaX4QAq0s4/hpZ9B8IV2RMXkrcwXaDB0OTLFWaKoNcUK4ZUNpJDgVQfky9iH/+1doWzXRTQLFhxv06SxZb+J64YkYNEZb/XhQQbdXkScaTwBXns37qUf1xSOJEdjW3xM/N0v62oI3hF4ofK2AfDknGmHtVQYAf/t+Ku5VbxOwq7VaZmNzvqod1uTmMC370K3YC4v+ojP20nAW1dDoO1UAWGVPM7oy8RNyaId5DkSZ3sBnvWw2GDFNlZ06NFsPbKL+b/3PQOAUYlOmiKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgIho25SVuP3oTv0CcT+yAcsNWpXBwGaaPXHFpDqWG0=;
 b=MWmvG49hlBijTk1NXAxamA7BHW0tW5IBpac3+z61XxfmINw/ePrmPwIaBUX10t9JPrgWT7CadmHSJ1ebE1Nbgn7WLAQsvn9G+aasg30QW9iyCWr07Oux1YOUaUmQRexnS72LcuGpPTI1T/VMxijRtWK9eaHpUV+STfqOxWpINDSLCD/9Gw4VvQ+TO53aHJJvMfDS7s/eUdnnz8oZLv9/Ja4MIouZvlcmVYESHr78n0JPdy/aGOy5o5MkD8D0J4GtoAfx4vmoYFQpsrpqLky5esaDPDf1UuJhNV4CiheiEmemh+9ICWPY8PlKT+20Q1UR1nN6Vn48T8XXTl63y3r+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgIho25SVuP3oTv0CcT+yAcsNWpXBwGaaPXHFpDqWG0=;
 b=biOVyghjjQZMnf7YOP7Xu+ao/RPUZq+T86YHfRNDITJDPJBc9T+vaprm1TWE8jrWj2zydF0dgoB7gO5gTrtLZ7W2x1Sr8Xw4ttNtQrGuu4whAtH3jFx26RU7Mi+nEM+e/yXBSU9OS0sIAMuzuFdWJNudgGq6hABwdJbFjvLtGcZRM3iSZQyi0hbK3CKIdG6pETiJtsFhAExfC9ZT/Xo5kxQ+EhvEqk0e/sBoaEucZgRJZ7LkhHqDOZBrOb9iTsrW5FXo0YffkL20N8hxTVMOZFAJBoiTni/c3dgsNKO+218Jw0bG8kSAxa88Gp77jPV678g77nY6NEHLiKei4AruFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 19 Jun
 2025 08:58:58 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 08:58:58 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, Alistair Popple <apopple@nvidia.com>,
 gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, david@redhat.com, linux-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com,
 hch@lst.de, zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 John@Groves.net, m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v3 08/14] mm/khugepaged: Remove redundant pmd_devmap() check
Date: Thu, 19 Jun 2025 18:58:00 +1000
Message-ID: <a68175fd3a37e9b72cc82c1d63fd8b69691a85b5.1750323463.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.176965585864cb8d2cf41464b44dcc0471e643a0.1750323463.git-series.apopple@nvidia.com>
References: <cover.176965585864cb8d2cf41464b44dcc0471e643a0.1750323463.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::24) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: d860f664-e576-4066-a372-08ddaf0f872e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dJMKoikkFLOFEJ+6AlDFYBDYcYYc2pt6jeSUjJ0lKN9NNT7b3jq6QrT8dDg/?=
 =?us-ascii?Q?i/edL/dhW7CDHzAJDQqa8HymKM/ZZWEn3iwYH/R5heKzY6vbvsQvHzSvwka0?=
 =?us-ascii?Q?MXeYtJYW/q4alZqmpmMo6KSEhjIRH1wBiRwGszWBjFWGWAyAQq2USdIhwDgV?=
 =?us-ascii?Q?4FjID+Cq1V7ZxLntr/o8e+nABzitef+HWRsM4b+5A3hMFErMukiQu74Bp0k/?=
 =?us-ascii?Q?3m48F8Q5NqP8A8M4eXg/Xop+xfcEdHcjF1t1b6YB1HQlzMnP26fozY+u8Asl?=
 =?us-ascii?Q?sgLDAWGwZXE1HFQVkRLvUhSha9LRyGCaLCu0arLKKmpWYhA3UG/AtvX/BtNG?=
 =?us-ascii?Q?1TBpFIDJtCnfbKE4T9M/VmHsVrzvqyLs7uD4OXOUo3srhnyh3uG30XoYh2mB?=
 =?us-ascii?Q?98y56Jb66pXKZ4jVGkw3qIHtL4x5K5c9zrtJowodpdMYuka6en1nBZm2O7xF?=
 =?us-ascii?Q?PImU8UXlcok6O9qYdmZJ2IthJxwIfoGFltnX6yTRPKK0RA6UekwalcS3bFPv?=
 =?us-ascii?Q?3WNdSUkoYXGkX8P9vrcOnqZjDAk5A16uiFujf3Tqnom2Y96BfYACa+qZvDEk?=
 =?us-ascii?Q?R1djFepiNvrh4IrLpFGJ2nMf8VRzMSwWScs41ingf/rUPhZ7MDe2LP5Qc/Zz?=
 =?us-ascii?Q?OKYLuDXzL3NS3W1a76AWh5DK6PfTBcmGXQswYJnyl2xBlHJcg+tdmQJUiIzN?=
 =?us-ascii?Q?fDTiEp3b86wBex91FWrLMB+NS9NpV8Xi6N9Tw9pqdn/LPx0XpxwNxhTD9v4X?=
 =?us-ascii?Q?tncQ1Fjh11UPsaAff5PxlNhEbEPpPoOCFu2HvG+BQ6FgsBJzSXF0QLW0aU7W?=
 =?us-ascii?Q?y+LNOLgPzPt7akl0wOVMWixBy4bJ5y4vjW981NcWHOqy2x+S0ZVmlF8iVzia?=
 =?us-ascii?Q?sxeyQJm6Kz+j1coXAotzKPFp5J9PLN33wBSkumW3Q76rcsihMY0p6tO/jAz/?=
 =?us-ascii?Q?FXKfXeZQBecqnGdsdJtOybJacuXRWdf6HPp5JRjlZYUCMxvz18E1wmYvjaQo?=
 =?us-ascii?Q?NtB9GIbUmVWCyi9U0SNAYe522mw2ba5oLCywLXIW/vDPhqBafrcEQaSik8o+?=
 =?us-ascii?Q?Gl46PJOOLQOtv7+CuoHJthHhEo5cTQGVT8+9dHGpo6ob39uLdoB41/5OryiM?=
 =?us-ascii?Q?ix1UVNJMRjsrWGxZLdsiswHaKIug4KrmzINSSFSCeDWsVZPSKBRwqn9DGTZv?=
 =?us-ascii?Q?yJbzpsLVCXpnkJ38iqcydTEgWAdF78YbgFJwRf/SJblegNIooUrS7dkb6n2l?=
 =?us-ascii?Q?fpN2nTfI41jl2K2xltVEtGk9zZqxVO1YoAUaIB9YdlN7UJ8bN2k+6pl85cpD?=
 =?us-ascii?Q?kkLqNmowRBHNqZwkZTOTCtZLazeVeNXhTk3gfkqXvf0chwmGzeRKcB+l8EIi?=
 =?us-ascii?Q?9BQeEjwgVUT9JCeJomUxJtiHfgbLOWxhkIBAC5x3d+1O2y6K2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2s7devffcFHX9rJ1qE0UPxw+KyVONXVGYYlfmyDExcUHDUz0NY9wIRQ0c8l?=
 =?us-ascii?Q?/VBOwKUQJHqypKJgaLL0Pg8ldOT9dPpaJtKKir/DCR5txzsS91e43qhjMElS?=
 =?us-ascii?Q?X6Sm9Si/n8Lt/3JhzA1T/i9qnSaMVAlpGVqw4vt8MBytXPkYsLGszaEHsRJ9?=
 =?us-ascii?Q?2jJX9p8biOxOvIrtKqYvzxEMQX9QdLgh775FI5wa9on0epVgZ0OKgRReW5sv?=
 =?us-ascii?Q?ArXCyP3rjn0GZHX1WFYJNXN3aD4EglCEhvTAB5v6dG1anGsaizN9I6RCF8RP?=
 =?us-ascii?Q?QcOdC88MufKFTOIE+BPNCUquKII1wTqwXzI+ijoGp+i7E03c2BJA1zS/J/gW?=
 =?us-ascii?Q?Vn3AGq57bEWn5yumB6JiL+8I11GxnGosq2GTSAGMzRGecj6/N5Dq5fPLBxnW?=
 =?us-ascii?Q?seOh7/scK+WYGx0sT+/EWWysDcmZ6JRzxNn7IeO5E7suQXfr3M6Rye58PCUe?=
 =?us-ascii?Q?1Qf3JqIzTV8SLqYuo8qKUfBcyDVrUWln11+jQ54suAQ7VwT9qP0wH035ondu?=
 =?us-ascii?Q?AanDuFkubkSPjx1jRQ5lj2S9jbOThTuasL7C14FnT54uueAmKesJ0hu1c0/x?=
 =?us-ascii?Q?zLw0pi3USZKihb1G4BaBR94tmKsjXKNNdbyeFPXXi/KP7R1+yuoK5F3q5DKV?=
 =?us-ascii?Q?lCkXxqNQn8Dilx3pjwXdT74iYY2SSkD2e6SHp61jqEB0wZmCqpGe243oWYRb?=
 =?us-ascii?Q?PFHD/ecxJst09MquB00E6HrWnGqI4VgELhbGGiBSgeq9DESP1Pgx9LjHpvN8?=
 =?us-ascii?Q?fkEMoXc4vp3x51Bbfj4CSqnJ3XFa0AH9XZrSSHXeZ59nxCsbgsRLOI5JcBSD?=
 =?us-ascii?Q?gmk+d+fNeeXH6sdWzs69uEKJQlNRThAqVHvR86KA0Y7u8HO4LfLvvROVE4RA?=
 =?us-ascii?Q?QRQ5bhsKlbrEjlAGviwL8zK6AfzHGu1gD/jZRzqmWAdvbt1cXnyLRhnSao4u?=
 =?us-ascii?Q?2V78cz2j4z4yu/gePnGDxvOLX7WtYF4YGGWBuOSrYDS2roWjhT/fPL9Im15x?=
 =?us-ascii?Q?uGK6TFOLEGJZe/vCY+dfqq3wqNnw24bd57ehIJRpkgF/cjPtQZvYhot4jbSj?=
 =?us-ascii?Q?Y3jeDf/fSXjJaTFhEegkQ/2dFe1l/2wdYxuLQDf35y4G2PN49afa6muANOGZ?=
 =?us-ascii?Q?Z30fQS2XVLH/9XfgYlB/UZTjf03O7eH5SU8IFpdpNsmtQscoaw8m4+T4U+Rs?=
 =?us-ascii?Q?484ywCuhZ1sPCpPCIOS2e71/REa39yvKc1KmM8oPe5z6YhMX1lA/v7hU/tc3?=
 =?us-ascii?Q?ods6dKi2CHu1pcvFVHFP2uzYMC0Z/mVm2hgQrfk4pNumcusn8sBRE4tCtJpB?=
 =?us-ascii?Q?0wabRyIR2bns+Wx2YG6lM+5ufHaRpby03BCGNmR+8B0P0nncxphkFPllny50?=
 =?us-ascii?Q?NpLfjNhBXcLQO1VRz+dXlPIUw4bgoA6eUsEMduPYePqchQEIbq1+FQyW6vlP?=
 =?us-ascii?Q?v5lWzCBqIXnOq13EjGlB3+lkd9Ov+n5kLqo45ahPB5Lq5heMOiOegCj4vklQ?=
 =?us-ascii?Q?JFs9xmSIH5uHf/5T/6Hj2PioxwhAN2C+zoRxLvrt03Xp5MuqfT75sahs0vLE?=
 =?us-ascii?Q?hLg9o9UXlvlkaL7YGoME+nQtXRFReAd97jvPj7Fv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d860f664-e576-4066-a372-08ddaf0f872e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:58:58.5539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04RdNuJILE7L79jWsQiL7UyZ6na2BnLCBsRDsTdI5uLnSgc4zNQjyWX98TTCXxLOxrg/aqVWXwAchyCp+Bjjyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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

The pmd_devmap() check in check_pmd_state() is redundant because the
only user of pmd_devmap were device dax and fs dax. However all callers
of check_pmd_state() first call thp_vma_allowable_order() to check if
the vma should be scanned. Except when called from a page fault this
always returns 0 for dax vma's, hence we would never expect to see a
pmd_devmap entry.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

---

Changes from v2:

 - Update commit message to better reflect why the check was redundant
---
 mm/khugepaged.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 15203ea..d45d08b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -945,8 +945,6 @@ static inline int check_pmd_state(pmd_t *pmd)
 		return SCAN_PMD_NULL;
 	if (pmd_trans_huge(pmde))
 		return SCAN_PMD_MAPPED;
-	if (pmd_devmap(pmde))
-		return SCAN_PMD_NULL;
 	if (pmd_bad(pmde))
 		return SCAN_PMD_NULL;
 	return SCAN_SUCCEED;
-- 
git-series 0.9.1
