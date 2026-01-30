Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WClnJkONfGnyNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:51:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB05B9921
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316F10E9B8;
	Fri, 30 Jan 2026 10:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OZWvcIvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011037.outbound.protection.outlook.com [40.107.208.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D5210E9AE;
 Fri, 30 Jan 2026 10:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfz/8NZPLnbcbAXiqjFsr9R149O7gs1AHMlqovoJbm4QqvuxrD6P2Qg1TZSNS617e67FUmTnPUeDx1rPRYe4zD3jRwNqAckqnUbE1b1gxLTnrMDh/9dcYVNB1qEc/d+Kaq87rgJlPUnPmOqOn8PxAmkosniqQWZw75UzmUj97le0EP+QK46upBcZVg1qdH4kMibjlBxaKL18+yhXy4xFyjZjk7sn6uEiP3SMQRVJMt+8/sr0k27jvsQqt/tiHFh9f2dhLmN8q1yizbcA6mtyIeVjcMRt5lB7TIip4U3UnRZz7H+Z9GKH52Po845R88rkDaTdRdS/HLUdplfvkFpa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wy8hV/i/DFV5JHYl4XI+/zmR/Oa4YzgS4cgb92MksjU=;
 b=TEUvRv1l/tYN7sPb8O5G0asn2aJITx1rIr6RUWnscKC4C9OVE7P53m+ynrawCQ5fwblPKNqTkcAXSRmCkCnu9MXuXw66IL0d3d3oqAvzZC8TQuC9gOshVoiKqfG0jdskIvljOP08hxmryaAVuE+CpfUvT7XqEBLKRA96Yen55Jkicw79l/vDNe4l41mTnzCo6X1DTzGzgNtRlOyWJ3agIG8I2B+Kol5duGD861UfKUmJ5ZZDg6hm2A6htDZTDkIE49AiYolMKn9qJK/8tbUlRR8pcguFQcqmFl70giitBmnwwE+MJtqlBDcH6BQAer104EhmaxQ6qRWhGW/elQEuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy8hV/i/DFV5JHYl4XI+/zmR/Oa4YzgS4cgb92MksjU=;
 b=OZWvcIvIZ2oNUarOw/QfGbgb889rPR/Nxu6HIW0pFSYxcsyYlwD8+FS6FTITAoEMX1xmbc3WbiaDpvqaSKgm4Ss0xThWFEsFXVB+a3DdorhdAGHHlHo5EFLxSkKVksm9Euz9e0TPlPeri4a/AT+yN/jUWWSi/TNaYZvnzAJjOpzrIx3kTCPKTEkK2tu/msQKDwkXsIZJMGk1h1eNaeVVojWy/HHUJEK8TKJ9ZiymwXGNhx9enI34Ic9Q6sliIow3aPIWLTG17uLnTDrsE8N/6xY7dJW0oz/0hAhy1tczm7dmvMhc1TuAneIF2y5AoUDf6yJPX8ZF+5b4pykt1+XveA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:40 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:40 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: [PATCH v4 11/13] mm/util: Add flag to track device private pages in
 page snapshots
Date: Fri, 30 Jan 2026 21:50:57 +1100
Message-Id: <20260130105059.51841-12-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: d37d22df-f086-482e-096d-08de5fed8c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wG+98yHxrIaW/l+1RuxNBd8O6scludF0bbLBLvE6Jkt5Ho7BT8w2eIL1l8sk?=
 =?us-ascii?Q?lXJe6gYhg5p/yzZv/88cnJCX/BsOerezzXj07gU/l/UNoKBzw5QiwJ3xlUSq?=
 =?us-ascii?Q?n9SinrGhbXO6Xl3ft33F5MBJDvsRrOJJ3/GVkQ/8hkdnxmRhd0PerJXcCXvy?=
 =?us-ascii?Q?3m62jiB83M5rbWBmfwRlZ/6mO3yYX6ZCh/RaR1dmVvdj+QeXura/1pr+xfl6?=
 =?us-ascii?Q?PnMcyx3R9a7+qiPwc0ttIvEQ6R4QsaTx5vMMGmi3hhrLgUoknveXbM3dMHVY?=
 =?us-ascii?Q?7UCe8eSsx5vG4hlJAsFxYMmEutN18SF6InQlkvikgNuBmn/vZnCbE9Ql5a1B?=
 =?us-ascii?Q?j0jbbnFexU6iq+lNrnaTdKjiflHuj0L6IESEolgn+l2PTOLgdRvdnATW8je5?=
 =?us-ascii?Q?EIlyF898L5A+MSqq1gUObBkWYeZ68xg13ltRvPrisAHTtqdFZSR2wqDdzkkm?=
 =?us-ascii?Q?3t/ejmfhcC/ghrYd29MBOij5wklcFdSGCMjM7fdHr3WIBktvW4rKAi3OCAqW?=
 =?us-ascii?Q?zoWGHUbaCnXM6+7+3lcSXLw9C2aNVKD4OKO++jzM7MTHzcQoI6ESD0FODilE?=
 =?us-ascii?Q?dKPafDd0SjX70g6uF0iNa951laUrA6H4mhkHhZEK/YGOCdAtvMOO7NgUWGmY?=
 =?us-ascii?Q?GqPyMiV0OsAqNaW67KDAHcyuEmguo/HmxRtp7M6YC3jO0VwM9izYc8m4aC98?=
 =?us-ascii?Q?cK4G68Mya1UM3WzJll0ro6w9AN1e6OSFCNa4K+DS5+Y4XqGetQFlw0PsNrwm?=
 =?us-ascii?Q?xA3Kcwpm1/8sypZfW2ac8x/j0NyTTrvwjCPx3M+2JAbI9sz8KoYNAVsfYEx+?=
 =?us-ascii?Q?oaDS3kEX1SndexRpulMIh8wtX/CsJpK695Y1JYJNFW7yGB9kh0FtD+XBSjiP?=
 =?us-ascii?Q?TSeQ/C2XqarWfV9xop0/+FEEdr91XUqq7gBCj51tY5ZpP4VgPiJkn7TVzwHs?=
 =?us-ascii?Q?S6RrHR2x/56mH2vuycvlvsMHMSSHTt0TC2ST7UongErHrHTaj4mA9u5rC11g?=
 =?us-ascii?Q?3QV4ZdHeZ8g9+weyjOTM11L3DII6M9JxtXez7F9MAZal6HyiBYM/IRdBid6k?=
 =?us-ascii?Q?CYmCXUV2hXsV0WPTpzIRrh2utLxilf9AIiqcuapWhN1pfqJz1mRm0dRfaV+x?=
 =?us-ascii?Q?GNyRyfwcnH7zQVnuM48bDRMI0f3e1Lb7P68yMe0x0g+YdyMFeFGYPmvL+wb5?=
 =?us-ascii?Q?iUhqEIkeYXAMigMwsHXGVtU1692mTMwznuJs15a97/+ArkgfsvJGK/3ETMwz?=
 =?us-ascii?Q?Y3P3F5u2hR8i6L7wnzw/lUzf6pQ95fLlNlMMI0MzQwVX71gG8lDmke9bMfZb?=
 =?us-ascii?Q?uEOAbWw+d6Rzx1kUyF4KlNugHxYmjSnztOMAg3Lr6JRJ5RUe/HVl9z4jlpVH?=
 =?us-ascii?Q?ltuIR4ybIMcxLRxTD/AF9qGyQ1P99SvyVVABCpGdGsKZg9Xp4LeDfRaspYtu?=
 =?us-ascii?Q?beVKQfvmrrivt3/pjQOz24CkjeS1Uj1W2vqARfshfBf1VxyYpTYsIfRmeqHK?=
 =?us-ascii?Q?A7A4mgkcCyWkTd8B1Y6+rOz/0a0ubFC1eE5pn5tEX/otGZhHzprBNASLRlkF?=
 =?us-ascii?Q?BXSZR4qtzs3H3F3sXIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypNDmupN5t0VhHqHAzjfTjlbfuq92SOMPU7ggNbQylLFBe8xVLiPDf6Y/tfh?=
 =?us-ascii?Q?0clFB2E7dviMUDA3GTGW4VsO4XKmqLaa0kq8NUekgjb2j3ARZzSs1qfu2vt6?=
 =?us-ascii?Q?LZhBiCWq1MKyn+g3Z6bxsc8WbNiVL7HO1j234OhNHYpY7FThEg9+8R+xH5+6?=
 =?us-ascii?Q?rAX7vNN3Y3A9f4kCLjtZgUGMEs6dNIcBAEJCTL4L1kUu9THmg9Ez4JVlpTZG?=
 =?us-ascii?Q?ulGUX9BXJ/Nwr3L85JmIosdzP83ACihwStsqRbypV7wzVhKsHA6x0oMS9R3r?=
 =?us-ascii?Q?7R/yDiOGRds+OQ2bl1ehIeeAr3ze6DeFj8pnb0iCxhnFI8x8Xoa9NGiDDG3w?=
 =?us-ascii?Q?XOG1AlEpEhqAcbZVYrLJEC5IOyypxLzh43+QxJWNeUZ+kqgJPhIfH1BDivkn?=
 =?us-ascii?Q?2licv8ez1I7QV1Rsbb8IY94/Y2+XjLDlSB8Q55hlGhyjb0Zj+WSPXlNTg149?=
 =?us-ascii?Q?YcdsUXHJ3yxvIqTsWo2U9HMk7Pt07lJvM0Csi9dwelhOetXRydJ5+ADNaOae?=
 =?us-ascii?Q?1u9wnhTPCqc1KNTmW/Dp9XgprdXZotPF4Jf4tb/i+JK9HvDHWe8qqXrbuXIX?=
 =?us-ascii?Q?B4RruCGqLfmTI6OkuLDgQPm/zxsXKguX+FX/o9lQMki8fkvUlXhI1PNOk0we?=
 =?us-ascii?Q?lE0UlwTxB12js4Z75OE2bbIB6pcQdhhlV206FBY99Ru+K9/0y7DgJyKDC+Ei?=
 =?us-ascii?Q?VJwhzfVBimONE32F1xzlXENTi0JVhuJqt58/XIqqSc2Rz5Khhc+ZVm/CEo+S?=
 =?us-ascii?Q?UL+Ot1a1QxESiCG5ph9V69ygAtospXe0DehdnX660s1nPfL2EPipi2Pf4r5g?=
 =?us-ascii?Q?EzeAd4R/OqY9umDkfR8gD1FB42FoFGZYU1r1ZnB/vV6i6T6zVrp7IQK1XCZ0?=
 =?us-ascii?Q?MKVvQBKgEbAbSwDQHRT+a2I+LVNFkFTrGNuVk1eUTbBDWWl9NYShp3LRhvOS?=
 =?us-ascii?Q?a2QWiqPxTi5FXYhHgqLuKf5o36og99S/w+uPsGbKtDsvJyIYXxXbeMqKhUSs?=
 =?us-ascii?Q?k1R+YSMdSOFqD6lWyedhfnsKJxGXJgb3FvwILmU9zHt6rA8RmF9Xb+Cnls13?=
 =?us-ascii?Q?wO+Zerb7IMcykB6+G4wE3g2J4QZO0dUnff3xuSVHc5hjF+BI2Q8Eic+wAa1v?=
 =?us-ascii?Q?/YMZ8bSwQBxuiyEz3NhqB7TbWi+4Lj9uFufu3R7nBps7zYi7vKMhrKPiiWin?=
 =?us-ascii?Q?uWK9KMwd0buVC9ook5s6UGH7Udi6SX26nT9bJ5Uh6NDz3jjuDA0YlbtNiLoE?=
 =?us-ascii?Q?W29o96Q1CFqrg7Mlgu5V8OeADv4Mh25XKPzyLUd5XNyviX1SU2IlouAbD+iD?=
 =?us-ascii?Q?6vyECV1K21+6RyjxJyjbgivVACUJIefn2EP6pC3iYRKLLy+E12Kf6EFx09c4?=
 =?us-ascii?Q?LECDgFYURnR9P8BM4mr/H/TIGf+TdXRqVpH7J2Gh84IUXAAmuBUMGZxKlifJ?=
 =?us-ascii?Q?yVpsLMiqMg4N+p/Os8w+0qA2Dgm4UrhM6CLHbayyOx2tlVgx+sWEutIMr1KA?=
 =?us-ascii?Q?uyO0Q6xa2LNbho4a3wuibUua91Fu9W+Pb1OnLar2ZAuqakWTcC0zuZtuqbnI?=
 =?us-ascii?Q?3z+QmNAf0lKqf7xh5D+cWggiY0KZt35WqndDW3I4txteEeSbzPWIuzsm2mxz?=
 =?us-ascii?Q?DzxJc+L4axLElFHfRDiE/08mGAaNJkjqpaXKlDVJvftRAYWncQD8U0stXMV3?=
 =?us-ascii?Q?sIulE2irlRlTMlml9k4j1jC2SSr2i+0ZqgPnrSG8YpWCzflXF+g/0JM4MgpA?=
 =?us-ascii?Q?+LTYuTsT0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37d22df-f086-482e-096d-08de5fed8c9b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:40.4980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tTFEVnVUx+4vdfkD2g/z2vF5WqYD0R9ewSA2BAz0ea9CSn2ffI9dJ13dlIvs4zjMakrzzyIAL2V5vQ+5RYabA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2DB05B9921
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - No change
v2:
  - No change
v3:
  - No change
v4:
  - Move logical continuation to previous line
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index f9b2c2c906cd..bc14f7ebc369 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f0d5be9dc736..a52979536a5e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4627,9 +4627,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..65e3f1a97d76 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1

