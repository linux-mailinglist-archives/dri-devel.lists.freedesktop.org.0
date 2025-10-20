Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9166BF30FB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01FE10E4F6;
	Mon, 20 Oct 2025 18:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b3hK4zM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013021.outbound.protection.outlook.com
 [40.93.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2441610E4EF;
 Mon, 20 Oct 2025 18:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SH+WEIoFmH5GE5nrnnMnJJlgKG2qL12OJEDiV5SoHXMSoWBsBaCkQ2/yq0922Tm3qFwML8/naxNjVjalUGmEZz1qrJi5oPE1DbJYwjqS0lSv4N6LdXxvQbZsJq1tmm1+ejhGg4v6W4nUQLIa/g3h/qAxXD+LjU5DTLbZg+uaO24I7yW1D0A/5VWpnW0FhJpiUd/5beNyUJO7gUH58EcT2cvytjtwd2q2lamc1WhM345G+GYdX/VV4sDK6H1ooVlI9OVLgVTvpwxIb7nIKvsUaLZ5XxQUs532S0tw2GYfQxY1PJJseSiPXX0f1Gub8OWoG7qiyhZbthkGo0X08yUN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOtV2OdowQxzPBO85qDcXejZnT4iXxuOeDwpN8lywtk=;
 b=ajdMi3BVqkRMiLvVAbib7FKqHeSbHW+fduro8iA/ksakExPO6jGBwTNCsFvvZy8hgMljuWx50NIq0ArqwPzz9zKQhv0eS62vjmrg+icqYHO/svUchls9iZBO7d7zvrb5tROlHSCOkCDNbYzIiIkapURR7DKvTDo2GLUinbh5IsBNUlR6+0MbWAjswzzsySfYyuK3BGLWmhOmKKcuZz0yLr6FpVfN7NpKcPcYKBXhMkpYO98Bmf78g88Ui7PXhQNZQausKQ9PDc/H9Br/tz4pd0kgXFiNL0CV47kysuSnnjx//63h9S22vcGdq09vp8/LLdCSmAXQptjIbZhUmhWGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOtV2OdowQxzPBO85qDcXejZnT4iXxuOeDwpN8lywtk=;
 b=b3hK4zM+yXAxcJXcVef4bWtirayKH8fhgOrUekpFmY8cFS3W+qA9HEGsb/KqEaB7qSuT3uuMyskETBH516CecJDnozEOsvDLmjO3ww3V8yyKm0m7uLSkOB+p0saaq52C2bqcuclOUEjpmGDk9Z7mxoGTnriAerb12tnanA4006Wsqm0bH3zGKDm3lFqV7I+w4psSG6np2ZV1Xp9U59GHmwn8WJWt0pRKNioVEuQzeLWr8s2t+y3MV8WKzExJ3oskwN9MICzkSpnrR2Ixt7YK7CvcIjVbe6UH7magw8Ubx1F1IG5i903IK4BXv7zO0LqEl/n8RY1LGClM0fJjXSs0QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:56:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:56:00 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Date: Mon, 20 Oct 2025 14:55:39 -0400
Message-Id: <20251020185539.49986-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0400.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 909afe73-7aae-400b-10ab-08de100a4f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqscSW8zt+Hx89CIoHZXGC3INbTHrsXjU1F34fSpT0MnlB1VrLaRTh10RcVk?=
 =?us-ascii?Q?x8kJjps2H2OZkjtW2HMVQFK60upaEPc90yUJ21EfHv4/XvymNDT7n/VM9zYi?=
 =?us-ascii?Q?0Dtt1X3L7XZeHPlUulsdU0FiEUb9lqpkWga98Rp0nMSxQc660UjQ6z8p/xgD?=
 =?us-ascii?Q?lPHrqEVr33gJPqrExh/Bdrpxbhw0/yfVmpvIems9hzGr7S/sV3IceWPhG5jt?=
 =?us-ascii?Q?9paKIjSHFgDyysf22ng7ZVtoaXj6slhfquAiy68gpnktOMsKfmf96ZhkQEyI?=
 =?us-ascii?Q?ecR4CHCK4Rpee7PlQlj9pZ5coq4i/IGSSwwJ+/NYIcFLDWZlMrghc7QlY/ck?=
 =?us-ascii?Q?RJrhHOtDAabeTJK7/CMWDmAfCXP+zxpVV4aEFlp7kX6mtG6AQmxZjA3jIqCP?=
 =?us-ascii?Q?hlYjaFSpSgp+QD7RucTOPffzAkah7em5ynFVu4e2Eu9qa0Ppk8tholto9UTA?=
 =?us-ascii?Q?5LR/XJqCPuvZmAYBQ+9tYqB3yYkxbHo+JHWhMN5H2t+jMeVXDz+QCRimzjf1?=
 =?us-ascii?Q?isBPis5R/0Uel0HlMCTfPt2UlcMyceEEGspFrs4FCIYbif1zt+Q0wDfIIDZy?=
 =?us-ascii?Q?5kgO8hZUZXgykBX1O+nIn3imNIJCcX1UaSKx6iffTOVOeWEs1UFswwNfQ1F+?=
 =?us-ascii?Q?pD+dJXjbvXktScw7fl3Dotbze0dLBepXU93c18nSQTpWvI2+Oiq4ADBeUgfr?=
 =?us-ascii?Q?h6LBthVJ1S+vrkDFFhZHnyQM1vL6q+gnst6hT4eKxgU+ey4aaDohauZzMxxF?=
 =?us-ascii?Q?3De/uog+Hj4RsM/EKo4/FF87/wkty21pNSLYH6MYWM4GNRjwTTnh4YXRbbvc?=
 =?us-ascii?Q?8AbZiE/ir08Tg6U5rrtgNfDnr1PLP9gWuzzO9Ul41APutYb44B+HGWN/tnIL?=
 =?us-ascii?Q?owjPZgmkVRuXUOmqopN2uUuMe14ixsU56gMB8NYCGPlIz1C39XsXguJcOdtD?=
 =?us-ascii?Q?lq/PKhZsUla7a7Z9mlV8uJkrM0R/AWdEITlQ8niuclx737FtHY03grOfAZIQ?=
 =?us-ascii?Q?COvHAfwfr7gjbbEMjdFppW7yYgvkr6DOiRdFLlrf2YbyBYF5iR9XTfebeBGR?=
 =?us-ascii?Q?4guGC1Fpps6V+R6hVJ3xsBms7RRrVFDu17HKEY7yaqvrV0KmMVN+oVKb+IzM?=
 =?us-ascii?Q?U1VqyTa9InfAydFbYDjL0DljYf/imy7SAFRJbDGAnuL2bItfqKcHvMpvA9AP?=
 =?us-ascii?Q?1jKDlRfnggV9/WrLylqjdvzJm8oBpujjmcGhH4UaqnckuKgnzoZAqVAoSu4r?=
 =?us-ascii?Q?4ZLQWQ0N/nvtHJK4XyR0+KSrhDU/uJj3I1i/p/VZGY/LlG7dygCNHKCrkGTZ?=
 =?us-ascii?Q?oZdb/qjh27o/xKguwGgW5554hkJAtdl0Xemqp8TlQUx5iUS+sahY5Ocd0HAM?=
 =?us-ascii?Q?SXBeMpkiMcWg91MkyLHfMInTVBSYjv8o4MGBzmb3cve3csmoWcYjriaLf4IT?=
 =?us-ascii?Q?287Rsx8nGE6wb2g8qHR4nZ78xNaTnzz1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dWBjzIRcL/wuJ2Ub3D/dpmM2GpEqMaPFC0BpPmPgVL9xKaYnHq1J8iFGfKKb?=
 =?us-ascii?Q?0fCEqMsFV8n4pJoCWMK7jZA2ZrBaM7nV3YwjCaBJWRSusxR6dLAppYhxO5un?=
 =?us-ascii?Q?SRS3MFXXd1/GyFAqPZ4tOGpkoyInBMPQM6nUesBv/aLFzHHW/X93R9ZRMDDS?=
 =?us-ascii?Q?E18O4lNeRnhenNDBoxuXrlt80gtEJYTUihrQK9iq4t/J3NeCdjZMc4tXg92j?=
 =?us-ascii?Q?bh7ys5fc7Th5bb7b3qWhiicgxzPdWxALU3sonQkjiolcayZLjOdv9J/Gmi1Q?=
 =?us-ascii?Q?hh9A0UBObF4VivNQXPI3FiaMYED3ePdKQ73D1PYFpnCeg7c2aAkYc2bWtfwG?=
 =?us-ascii?Q?2yJNGfNNGwdXex4eFPjlNX73nMuO8EuTqWnUp+XPkCBxg6P9i0Oy8owOk3oa?=
 =?us-ascii?Q?E7AwfalBdYH/0y3QIicxrAgVcSAZkzpRZ8IrbSBNtMEaHcr6kq2OKducY2pg?=
 =?us-ascii?Q?yivtluE9XkghaLHVM+5adan0NcubF7AfaFdz1EuxPYfpz1ggXqnhnZdkvQVr?=
 =?us-ascii?Q?WnB4krm6bE/NWi9VOEhJT2ARusB2w68yznCCFjXgylw0k3bzwYJ6OhPDnz7a?=
 =?us-ascii?Q?d1q86lP+VTvO9FYPzBGvGUiImxhix2U7uE7/lc6Aya9RU1xFwAgKcG2p+FWJ?=
 =?us-ascii?Q?xTMwaxkdKp9uEj2i3zC/QggxRL2pDc9/DICQtJ7C3YHhCWFax3rRnhWCZOdt?=
 =?us-ascii?Q?8dEHxHzNgEw2+8kl5+0iOVP7Mr+LrGsrDyoZXUqI+OWTpAsAOGOyOcZkGgu/?=
 =?us-ascii?Q?OJd5GUwGSy/NGGP5s7WpAyPK8T1yykTFLkgLFtLiFP7hehWUw2P/0qUJ02TA?=
 =?us-ascii?Q?rWJ0YVBPOZVWTSMUnE4BJEjgZLIVbZdoy8NeNVNm5IQri/lSWdvW46GMW1AN?=
 =?us-ascii?Q?MX5njuxqXKDwI18JiIIQHCOV560Vkqrvg2GPuOdp7/6i5PIpqNIQGZtYEFGQ?=
 =?us-ascii?Q?8jUZ74dETzyLNNGE7865sL0gl33NGxWfnKAuhsY1jpfnd+OhY8tnfToNMI+Y?=
 =?us-ascii?Q?PYBiW1E04IuESpX+HBom2M9E7sstvvx9eYOFv0EdSTMvLv6IjphnkW3sHFC2?=
 =?us-ascii?Q?p+tU0mqZXf5EItvEa+GitlCZJbfLpI5GFAOViw20xgLgHuVUTSLabbxWH2uO?=
 =?us-ascii?Q?wEwY5V6hQjlyrxJRFdqoiyQFxPg5UZ4We/sDcY16FTSUpeNIQDsENv3wRGKe?=
 =?us-ascii?Q?797GJvCHE5q0M7KA/rNYTLh6NInphO1Mfrw8UY7nLBNnH27h9J9MdLWfEFWz?=
 =?us-ascii?Q?zx9STJIueNqhun6io/FgJS7rp/hr0NH8hY591wYQiB0B73ls2URq+LjBFGck?=
 =?us-ascii?Q?1I/4MTgBmDmg9UYzKKKWQqdL9j69bizdLAgxxEGj/tL3Y1B8s4Wgs077e6Bz?=
 =?us-ascii?Q?qV/HdKsWy820JEZz7jY2SVlkL/4zA270JqkkZzfaxW22xxii2vyCZgJvoGFW?=
 =?us-ascii?Q?nqd1L0Gk9YwWTwYQ9r9/q3hLZbCmyV8f+jhI/8JL9H6FGfbQBajWWeRFGmzF?=
 =?us-ascii?Q?S1HTJn82mRL4t7FvIX/lRDt/mz/v0M3SDgHk2DUaVRU+7NL5fy+Hb+KwJIOS?=
 =?us-ascii?Q?M3ki9uUXSRZ53onmV2JR79ebrzicrcTP2EnvY0f3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909afe73-7aae-400b-10ab-08de100a4f83
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:56:00.4829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDtWrVFdU2TxXQnuzDsPlEJMgeyoWhvmIhcaDUG79DN+fPs1P8CY2Vm2X5hKUU0wyzb3knSHrrH8PMWM6TDrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
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

Add data structures and helpers for page table management. Uses
bitfield for cleanly representing and accessing the bitfields in the
structures.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs   |   1 +
 drivers/gpu/nova-core/mm/types.rs | 405 ++++++++++++++++++++++++++++++
 2 files changed, 406 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/types.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 54c7cd9416a9..f4985780a8a1 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -1,3 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
 
 pub(crate) mod pramin;
+pub(crate) mod types;
diff --git a/drivers/gpu/nova-core/mm/types.rs b/drivers/gpu/nova-core/mm/types.rs
new file mode 100644
index 000000000000..0a2dec6b9145
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/types.rs
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Page table data management for NVIDIA GPUs.
+//!
+//! This module provides data structures for GPU page table management, including
+//! address types, page table entries (PTEs), page directory entries (PDEs), and
+//! the page table hierarchy levels.
+//!
+//! # Examples
+//!
+//! ## Creating and writing a PDE
+//!
+//! ```no_run
+//! let new_pde = Pde::default()
+//!     .set_valid(true)
+//!     .set_aperture(AperturePde::VideoMemory)
+//!     .set_table_frame_number(new_table.frame_number());
+//! // Call a function to write PDE to VRAM address
+//! write_pde(pde_addr, new_pde)?;
+//! ```
+//!
+//! ## Given a PTE, Get or allocate a PFN (page frame number).
+//!
+//! ```no_run
+//! fn get_frame_number(pte_addr: VramAddress) -> Result<Pfn> {
+//!     // Call a function to read 64-bit PTE value from VRAM address
+//!     let pte = Pte(read_u64_from_vram(pte_addr)?);
+//!     if pte.valid() {
+//!         // Return physical frame number from existing mapping
+//!         Ok(Pfn::new(pte.frame_number()))
+//!     } else {
+//!         // Create new PTE mapping
+//!         // Call a function to allocate a physical page, returning a Pfn
+//!         let phys_pfn = allocate_page()?;
+//!         let new_pte = Pte::default()
+//!             .set_valid(true)
+//!             .set_frame_number(phys_pfn.raw())
+//!             .set_aperture(AperturePte::VideoMemory)
+//!             .set_privilege(false)   // User-accessible
+//!             .set_read_only(false);  // Writable
+//!
+//!         // Call a function to write 64-bit PTE value to VRAM address
+//!         write_u64_to_vram(pte_addr, new_pte.raw())?;
+//!         Ok(phys_pfn)
+//!     }
+//! }
+//! ```
+
+#![expect(dead_code)]
+
+/// Memory size constants
+pub(crate) const KB: usize = 1024;
+pub(crate) const MB: usize = KB * 1024;
+
+/// Page size: 4 KiB
+pub(crate) const PAGE_SIZE: usize = 4 * KB;
+
+/// Page Table Level hierarchy
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PageTableLevel {
+    Pdb, // Level 0 - Page Directory Base
+    L1,  // Level 1
+    L2,  // Level 2
+    L3,  // Level 3 - Dual PDE (128-bit entries)
+    L4,  // Level 4 - PTEs
+}
+
+impl PageTableLevel {
+    /// Get the entry size for this level.
+    pub(crate) fn entry_size(&self) -> usize {
+        match self {
+            Self::L3 => 16, // 128-bit dual PDE
+            _ => 8,         // 64-bit PDE/PTE
+        }
+    }
+
+    /// PDE levels constant array for iteration.
+    const PDE_LEVELS: [PageTableLevel; 4] = [
+        PageTableLevel::Pdb,
+        PageTableLevel::L1,
+        PageTableLevel::L2,
+        PageTableLevel::L3,
+    ];
+
+    /// Get iterator over PDE levels.
+    pub(crate) fn pde_levels() -> impl Iterator<Item = PageTableLevel> {
+        Self::PDE_LEVELS.into_iter()
+    }
+}
+
+/// Memory aperture for Page Directory Entries (PDEs)
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePde {
+    #[default]
+    Invalid = 0,
+    VideoMemory = 1,
+    SystemCoherent = 2,
+    SystemNonCoherent = 3,
+}
+
+impl From<u8> for AperturePde {
+    fn from(val: u8) -> Self {
+        match val {
+            1 => Self::VideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::Invalid,
+        }
+    }
+}
+
+impl From<AperturePde> for u8 {
+    fn from(val: AperturePde) -> Self {
+        val as u8
+    }
+}
+
+/// Memory aperture for Page Table Entries (PTEs)
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePte {
+    #[default]
+    VideoMemory = 0,
+    PeerVideoMemory = 1,
+    SystemCoherent = 2,
+    SystemNonCoherent = 3,
+}
+
+impl From<u8> for AperturePte {
+    fn from(val: u8) -> Self {
+        match val {
+            0 => Self::VideoMemory,
+            1 => Self::PeerVideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::VideoMemory,
+        }
+    }
+}
+
+impl From<AperturePte> for u8 {
+    fn from(val: AperturePte) -> Self {
+        val as u8
+    }
+}
+
+/// Common trait for address types
+pub(crate) trait Address {
+    /// Get raw u64 value.
+    fn raw(&self) -> u64;
+
+    /// Convert an Address to a frame number.
+    fn frame_number(&self) -> u64 {
+        self.raw() >> 12
+    }
+
+    /// Get the frame offset within an Address.
+    fn frame_offset(&self) -> u16 {
+        (self.raw() & 0xFFF) as u16
+    }
+}
+
+bitfield! {
+    pub(crate) struct VramAddress(u64), "Physical VRAM address representation." {
+        11:0    offset          as u16;    // Offset within 4KB page
+        63:12   frame_number    as u64;    // Frame number
+    }
+}
+
+impl Address for VramAddress {
+    fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> VramAddress {
+        VramAddress::default().set_frame_number(pfn.raw())
+    }
+}
+
+bitfield! {
+    pub(crate) struct VirtualAddress(u64), "Virtual address representation for GPU." {
+        11:0    offset      as u16;    // Offset within 4KB page
+        20:12   l4_index    as u16;    // Level 4 index (PTE)
+        29:21   l3_index    as u16;    // Level 3 index
+        38:30   l2_index    as u16;    // Level 2 index
+        47:39   l1_index    as u16;    // Level 1 index
+        56:48   l0_index    as u16;    // Level 0 index (PDB)
+
+        63:12   frame_number as u64;   // Frame number (combination of levels).
+    }
+}
+
+impl VirtualAddress {
+    /// Get index for a specific page table level.
+    ///
+    /// # Example
+    ///
+    /// ```no_run
+    /// let va = VirtualAddress::default();
+    /// let pte_idx = va.level_index(PageTableLevel::L4);
+    /// ```
+    pub(crate) fn level_index(&self, level: PageTableLevel) -> u16 {
+        match level {
+            PageTableLevel::Pdb => self.l0_index(),
+            PageTableLevel::L1 => self.l1_index(),
+            PageTableLevel::L2 => self.l2_index(),
+            PageTableLevel::L3 => self.l3_index(),
+            PageTableLevel::L4 => self.l4_index(),
+        }
+    }
+}
+
+impl Address for VirtualAddress {
+    fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<Vfn> for VirtualAddress {
+    fn from(vfn: Vfn) -> VirtualAddress {
+        VirtualAddress::default().set_frame_number(vfn.raw())
+    }
+}
+
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry (PTE) to map virtual pages to physical frames." {
+        0:0     valid           as bool;    // (1 = valid for PTEs)
+        1:1     privilege       as bool;    // P - Privileged/kernel-only access
+        2:2     read_only       as bool;    // RO - Write protection
+        3:3     atomic_disable  as bool;    // AD - Disable atomic ops
+        4:4     encrypted       as bool;    // E - Encryption enabled
+        39:8    frame_number    as u64;     // PA[39:8] - Physical frame number (32 bits)
+        41:40   aperture        as u8 => AperturePte;   // Memory aperture type.
+        42:42   volatile        as bool;    // VOL - Volatile flag
+        50:43   kind            as u8;      // K[7:0] - Compression/tiling kind
+        63:51   comptag_line    as u16;     // CTL[12:0] - Compression tag line
+    }
+}
+
+impl Pte {
+    /// Set the physical address mapped by this PTE.
+    pub(crate) fn set_address(&mut self, addr: VramAddress) {
+        self.set_frame_number(addr.frame_number());
+    }
+
+    /// Get the physical address mapped by this PTE.
+    pub(crate) fn address(&self) -> VramAddress {
+        VramAddress::default().set_frame_number(self.frame_number())
+    }
+
+    /// Get raw u64 value.
+    pub(crate) fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry (PDE) pointing to next-level page tables." {
+        0:0     valid_inverted       as bool;    // V - Valid bit (0=valid for PDEs)
+        2:1     aperture             as u8 => AperturePde;      // Memory aperture type
+        3:3     volatile             as bool;    // VOL - Volatile flag
+        39:8    table_frame_number   as u64;     // PA[39:8] - Table frame number (32 bits)
+    }
+}
+
+impl Pde {
+    /// Check if PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
+    }
+
+    /// The valid bit is inverted so add an accessor to flip it.
+    pub(crate) fn set_valid(&self, value: bool) -> Pde {
+        self.set_valid_inverted(!value)
+    }
+
+    /// Set the physical table address mapped by this PDE.
+    pub(crate) fn set_table_address(&mut self, addr: VramAddress) {
+        self.set_table_frame_number(addr.frame_number());
+    }
+
+    /// Get the physical table address mapped by this PDE.
+    pub(crate) fn table_address(&self) -> VramAddress {
+        VramAddress::default().set_frame_number(self.table_frame_number())
+    }
+
+    /// Get raw u64 value.
+    pub(crate) fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT pointers.
+/// Lower 64 bits = big/large page, upper 64 bits = small page.
+///
+/// # Example
+///
+/// ## Set the SPT (small page table) address in a Dual PDE
+///
+/// ```no_run
+/// // Call a function to read dual PDE from VRAM address
+/// let mut dual_pde: DualPde = read_dual_pde(dpde_addr)?;
+/// // Call a function to allocate a page table and return its VRAM address
+/// let spt_addr = allocate_page_table()?;
+/// dual_pde.set_spt(Pfn::from(spt_addr), AperturePde::VideoMemory);
+/// // Call a function to write dual PDE to VRAM address
+/// write_dual_pde(dpde_addr, dual_pde)?;
+/// ```
+#[repr(C)]
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct DualPde {
+    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:0 (lower)
+    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 (upper)
+}
+
+impl DualPde {
+    /// Create a new empty dual PDE.
+    pub(crate) fn new() -> Self {
+        Self {
+            spt: Pde::default(),
+            lpt: Pde::default(),
+        }
+    }
+
+    /// Set the Small Page Table address with aperture.
+    pub(crate) fn set_small_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
+        self.spt = Pde::default()
+            .set_valid(true)
+            .set_table_frame_number(addr.frame_number())
+            .set_aperture(aperture);
+    }
+
+    /// Set the Large Page Table address with aperture.
+    pub(crate) fn set_large_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
+        self.lpt = Pde::default()
+            .set_valid(true)
+            .set_table_frame_number(addr.frame_number())
+            .set_aperture(aperture);
+    }
+
+    /// Check if has valid Small Page Table.
+    pub(crate) fn has_small_pt_address(&self) -> bool {
+        self.spt.is_valid()
+    }
+
+    /// Check if has valid Large Page Table.
+    pub(crate) fn has_large_pt_address(&self) -> bool {
+        self.lpt.is_valid()
+    }
+
+    /// Set SPT (Small Page Table) using Pfn.
+    pub(crate) fn set_spt(&mut self, pfn: Pfn, aperture: AperturePde) {
+        self.spt = Pde::default()
+            .set_valid(true)
+            .set_aperture(aperture)
+            .set_table_frame_number(pfn.raw());
+    }
+}
+
+/// Virtual Frame Number - virtual address divided by 4KB.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) struct Vfn(u64);
+
+impl Vfn {
+    /// Create a new VFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get raw frame number.
+    pub(crate) const fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VirtualAddress> for Vfn {
+    fn from(vaddr: VirtualAddress) -> Self {
+        Self(vaddr.frame_number())
+    }
+}
+
+/// Physical Frame Number - physical address divided by 4KB.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) struct Pfn(u64);
+
+impl Pfn {
+    /// Create a new PFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get raw frame number.
+    pub(crate) const fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        Self(addr.frame_number())
+    }
+}
-- 
2.34.1

