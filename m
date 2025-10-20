Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA0BF30F9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946AD10E4F4;
	Mon, 20 Oct 2025 18:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNUSQ9Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66410E4E7;
 Mon, 20 Oct 2025 18:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioZxLRvoRVwwpOEMSp9mugjeWDPlan171+z+McXqD0wZociNGoScHoidMnlCtNNBj/4MGDTKoORrstam2sGcw+QO+gGiT6BGeSwRe8N3wPGDG5TdDZsr8x56nQ1BnEOj+QeStlMpXuLJodwUmr0nrg8uTn3i1JoVp7EmSZvdm/yJAbHuGTbUY19CBIU/2NWXRyJ5FegO2p+4OM1QZ0l8EcWi4InnXQKZgagfGkfDFXt3b6BTblR1NGROykfQZoi02Ir35E4l5WXa8bdTXH6CXEZ5Uj818s1qrikzNUaxPWOrqBPoQBzE3z2rh1fOBGfrkdcELNTVXwCKc4CVLsGElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8AuMtB7CbQQUbY0utq6l7j40phN+7tth2SM18mMbZo=;
 b=FoXpLjdQCsmDSGxPhzIozjPtioEAv7ri5OMPwYaCo1XRhvorBKKEm6gk84prvlBhqSfcIf1wNTPc32b3Ud1cBd50/kenQRTCAKvLPzoKFwKwF1AhkHKuzFFm6pY/6k1Lg/bId5BgcY4JU46Ppe18HEWiFB88wcZyxlYblT80eJoxZ6RMNPTAvK+Y/VjxFJ96XTUJXv3TIaXZ0i1xCWTEeWOWpETlz87BIi/AXY2O3Q1NAwOWPKKg2GPYCOyBkNxlAATgcfNDSzMRmM0mWFWI2ZaSdEpTJdscTSFdDxCGOVZnankPpfoBnoJcXsb1Kh528Lx+NDi9fESRZk43PFsRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8AuMtB7CbQQUbY0utq6l7j40phN+7tth2SM18mMbZo=;
 b=UNUSQ9Hy/EgpmP9u3GFNJ80KBcn6nC2eTVpjSZrLKnLyl1QJqDJuG8UZGLvISy2rv6EPsvui4NaglWUtPlstCqarysXBucYEuErhchh9Omh70yXy4I6FqdnJNEnnJW7SWYfU1/POlB9zERbs22vfIoUcbotZYXWuU7O+x0e8V+hRLdRw4AZYxMdt6RPp3qohfdZKiYwDKY7vPRm7SmrTVYxNHuEOBl0abfqPMt1C3VeOXkyYXUBtSJqX28MPRE+OC6X11UKtwz6P8COmmS2/wmsCRXn7dCFoQ+D8VcpRCioZpFU4tP/DYmQoWh3gxcdznw8kiloDxQhHDOJpqURHRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:59 +0000
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
Subject: [PATCH 6/7] nova-core: mm: Add support to use PRAMIN windows to write
 to VRAM
Date: Mon, 20 Oct 2025 14:55:38 -0400
Message-Id: <20251020185539.49986-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0777.namprd03.prod.outlook.com
 (2603:10b6:408:13a::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6595872d-71a9-4d67-e7e9-08de100a4e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bsi3lQqRhvpxXgQEUgHUJ+zbgHdWw80ffgQRCgexQytpKwOiV+Zel3H4J0wq?=
 =?us-ascii?Q?bxDrWtvhW7DW1OpQCz4HVAc0BnvZtgB6O0XeCfTyOP/4zAz1nZkvSOWV6/F/?=
 =?us-ascii?Q?CXOXF3tjGg59OENIlCLp+c6HZKoK3tKzJD8cFx4FECnaEO7qRPDKtUMh4yxs?=
 =?us-ascii?Q?+1Gsjf1QGOVmig+H/KKhLHmgWmoizjW4rRMzF2j5fQtamH7Hs5QF/1r6Y3jy?=
 =?us-ascii?Q?unV4K0eNYP4l///4hIxbN4ymQUjwfkIAnUG/5mTU9lfzfHtKSn9vSWEYU8aH?=
 =?us-ascii?Q?KGzg3vQqsW8l4+QqB5TFgFrV11z4VyhkctK0Qoe+/mY3hJDZru+rmd1ezZrb?=
 =?us-ascii?Q?iyof1LUMU/bfjHK/o/CT2kLIhfQ+KhW5QAIuHJDQ5os5vBf13pB924qWYEyN?=
 =?us-ascii?Q?aQUR5ZfKtLPyzTrO/Q096/5/I4YK5kXID1CMpeJUUXIu2ug6X34hjGulld9G?=
 =?us-ascii?Q?cS6Y04PEwxwmc/3HUPQ2wDr+2GUC++nHUkJMCaVexsa9hKWAkj2GwBhds/Ah?=
 =?us-ascii?Q?wzVtwNWlzncHt8v+syiemJvlp7smrFqCY5/j03K+RscP52qjZQDzgjt2kH+N?=
 =?us-ascii?Q?3I0dYnVSbYqEUu++k4HIwPv+VWCyjNvpCyN3Q7IaWOdE2OpgAVcZz2hFVV0d?=
 =?us-ascii?Q?gqzgQwtpeBLbWAiY7EGZoh5Tiv9rJ7il2BcL5bH2gvgoYwqxFVasVq4eSF9f?=
 =?us-ascii?Q?VMdhDnh+g1M2jZNJbjryCC4yEgp/jHmrk1PU4cg+NzpbLS+52KUC5hYOjjXH?=
 =?us-ascii?Q?0fsxtjX3SzsDOqd09NbhYJTl+jA6VJTh59sHkP1aHSueYHATnmDq6hY5lAQu?=
 =?us-ascii?Q?h6H5RqWJUa3/rY8ztdYgEcJc7niAKsDlvTUviCKMAF7PXrWoCzrKiWo0UwM4?=
 =?us-ascii?Q?AwDAkoXT859XGvvgfU+U9nhtmVeOYgyKQtXV9/WwC1baFeBI/y9q6szqo0gw?=
 =?us-ascii?Q?7k28R3BxICwYSbyfJVOlLxZyvASpJa7m40sQxy56nurRK5mKZ+tn7Toe5tt7?=
 =?us-ascii?Q?/zUwWZmhSVt2A8lkkhkF/bGE7tfnOltCiRq4A7V4iHwxmX88jzgYrS2EzqQX?=
 =?us-ascii?Q?PuBYrtIA2SqjpiM0R2/tvvf2WByWps8moZzOjO3cdhOT1UlPsG7y79CJeBoi?=
 =?us-ascii?Q?akGQW75ZQGQPu6Jq2azVrfspYtoVhDQ63hIELmCrVoU3HJ+t9kAjW8O2kJPO?=
 =?us-ascii?Q?JBkXWyvxVNW2rPRSYTpdgQPrhU1pUVtdBrhD53RiIDjlcxRXAUMny9z4xywf?=
 =?us-ascii?Q?8SkV6iskFXi6GfQO/zM3iAv5OCuJiMEir5GEOzt37BVHE6ldp+/14jGAtLnb?=
 =?us-ascii?Q?6aYeUYfNcIz445X6OChXgNNmPWS75GUD8vFwkHT8OGXqgoE0nskbD1LBltfn?=
 =?us-ascii?Q?bknlo3qJqbLb9FyqKwfeSHyqq9I4gyvNUGWaXncxVXYX6jGdwGoBocSPr7EY?=
 =?us-ascii?Q?wjDN+C1xCe5FeXRU2FH2GsQCkX1oBhap?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+q1Ow1P0rMsMyUJAG0r+fKg0Un9OpK/luOT2tdxtoFFLuQ6gWz68QfnJwkO?=
 =?us-ascii?Q?g3+kXq4ETYOxGhgofevLyFOe8kQKLuMwTHZ7NAsPwaeX9tiXy+xyHuDhpmWa?=
 =?us-ascii?Q?plO4laOb578rJIlgZvwIyzlgCE+/SBLQPKFc7clvg5TqTnCU1atQOruu1RrD?=
 =?us-ascii?Q?KoTphYztkxNOfpsSWN5oeO056MWltCqnhUPCDl4C2CKQ56UjmYMqjF5n3PJY?=
 =?us-ascii?Q?VDTQTIDjte+NS0YAROVBG7Cz6Z9Uo8/4MwHtk2j5tl1UilpICzHhGWWRy4EY?=
 =?us-ascii?Q?/CYBgVmPEszYDxgkQbBFXw6H2Ianz+lrriv0ZY7FqUx4h45bB5g0hMiTGCm1?=
 =?us-ascii?Q?CXZ5HwL0LIkovy6uiz7jgwcQmSB3XfrMGP6kT1roAJJiGohnsRaIG5FHnxTF?=
 =?us-ascii?Q?7/bVELWgC03weu/TRO07c4q032vwT6iO9Ah/XrUQR5CZZJ+VSV3r0wOZ7ArB?=
 =?us-ascii?Q?S7WIK+92gqS1pEpleioN4e5228GqfleDBhkMcUtkI9Jm/wLjPuMA3w9xZeVr?=
 =?us-ascii?Q?MHFaCncmYpCkLyfN2Ul3hPupLgN2RIj60xT7RL9XfyhMlq0xwQwDKrQW5ndB?=
 =?us-ascii?Q?+Z2IChFDr+t0hGz2F9qgtvJ8Sr/EEoM80zmKdr+VaLJ8ZaAHl6drEgb/Prh2?=
 =?us-ascii?Q?N3p9mzvgp+Eny10D7qzqm8LNk03/68/Wp+PPP6PTV0/p/Unc36vuroYk18mW?=
 =?us-ascii?Q?NE7pW8TuQ/1TksaVcCBeyM5GoPwbvg3BEC59ddj6O/JcKXXfmQkyeF93oM56?=
 =?us-ascii?Q?yD/nrglFUsHNoRju2wwf7ZQWN7iJYo1zLlz4qG+k45PdP7sIrQxu/wNwyF3T?=
 =?us-ascii?Q?Ec4H53z9N0T9QMqpUitYrs437n9B1mf9cKrHaQjvsxNjufmVWZRtNGM/+evU?=
 =?us-ascii?Q?GSA+y4d1JqUJLv3cQmqism7L8T79PQ03U7+mpEZqtTRnw0Eqx8bVDMQp6w8T?=
 =?us-ascii?Q?pxkEs2zFEOkq4YjSLT0TIYzs02zd5q0NvMfIIkz/W3K032NbdMtaKp7msolY?=
 =?us-ascii?Q?yJmbCcIyg0v9kn6wLARxtR8VB8CEbOWmR5DZkcUpyHmjocqyWQDoQK1PRvUe?=
 =?us-ascii?Q?byXqCNsflqMj0RQR9n/zAFRTYGfZRD2GnEhngNLjExNt0NkB31PQPpGazLP6?=
 =?us-ascii?Q?m4omvpE+IHxMJGEa+9OMm3Kxy25C4wkmWyzrSDlnF+Qhf6nPwZbpNLnaE2jg?=
 =?us-ascii?Q?KVhRFf5UlYiBnZxSaASYnYs2XmYcEzYF3LWlDMFS8Ja9IweIaiYhzQw0fwfB?=
 =?us-ascii?Q?ogMAp1RjaYyeX3Td0NvQuQRzlgTffoRd1scT8hQ27TXyHnr7SAPRnELqbYXX?=
 =?us-ascii?Q?uErRweewT6xFvnzxGJkSEh9nakc7HiLTmmTXhv/0oovL/RBqVOt3L+iQz2Ke?=
 =?us-ascii?Q?7BlKl/1x1t96iwYUZT1CUDIC+CWaWtuLbECNb43pWNCxtsU5fSNK4IAreRc9?=
 =?us-ascii?Q?xh4/VCHTHoQyRLnF4OEFRaHePA00OMC/zPSSFwoyfXteTqwMWGKBI572ro6n?=
 =?us-ascii?Q?mJzC5t9KQGsSSOkcQArSiU45POp0G5YQVxhAnQE0VLLVQ66R9sl1suouoQxD?=
 =?us-ascii?Q?jNogY7FZmPA3UUp0S1sVLi1I60i9iwLx7nTO4jty?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6595872d-71a9-4d67-e7e9-08de100a4e9e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:58.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjAPaTJLYVZP+YBs00CizE9ovn3Rnlj+k0vr7NH1g0gtXcoS5siaX+91qTDyCX8m7mORxq69sXd8HKgc7kuLSw==
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

Required for writing page tables directly to VRAM physical memory,
before page tables and MMU are setup.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs    |   3 +
 drivers/gpu/nova-core/mm/pramin.rs | 241 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  29 +++-
 4 files changed, 273 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
new file mode 100644
index 000000000000..54c7cd9416a9
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod pramin;
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
new file mode 100644
index 000000000000..4f4e1b8c0b9b
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Direct VRAM access through PRAMIN window before page tables are set up.
+//! PRAMIN can also write to system memory, however for simplicty we only
+//! support VRAM access.
+//!
+//! # Examples
+//!
+//! ## Writing u32 data to VRAM
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin::PraminVram;
+//!
+//! fn write_data_to_vram(bar: &Bar0) -> Result {
+//!     let pramin = PraminVram::new(bar);
+//!     // Write 4 32-bit words to VRAM at offset 0x10000
+//!     let data: [u32; 4] = [0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x87654321];
+//!     pramin.write::<u32>(0x10000, &data)?;
+//!     Ok(())
+//! }
+//! ```
+//!
+//! ## Reading bytes from VRAM
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin::PraminVram;
+//!
+//! fn read_data_from_vram(bar: &Bar0, buffer: &mut KVec<u8>) -> Result {
+//!     let pramin = PraminVram::new(bar);
+//!     // Read a u8 from VRAM starting at offset 0x20000
+//!     pramin.read::<u8>(0x20000, buffer)?;
+//!     Ok(())
+//! }
+//! ```
+
+#![expect(dead_code)]
+
+use crate::driver::Bar0;
+use crate::regs;
+use core::mem;
+use kernel::prelude::*;
+
+/// PRAMIN is a window into the VRAM (not a hardware block) that is used to access
+/// the VRAM directly. These addresses are consistent across all GPUs.
+const PRAMIN_BASE: usize = 0x700000; // PRAMIN is always at BAR0 + 0x700000
+const PRAMIN_SIZE: usize = 0x100000; // 1MB aperture - max access per window position
+
+/// Trait for types that can be read/written through PRAMIN.
+pub(crate) trait PraminNum: Copy + Default + Sized {
+    fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self>;
+
+    fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result;
+
+    fn size_bytes() -> usize {
+        mem::size_of::<Self>()
+    }
+
+    fn alignment() -> usize {
+        Self::size_bytes()
+    }
+}
+
+/// Macro to implement PraminNum trait for unsigned integer types.
+macro_rules! impl_pramin_unsigned_num {
+    ($bits:literal) => {
+        ::kernel::macros::paste! {
+            impl PraminNum for [<u $bits>] {
+                fn read_from_bar(bar: &Bar0, offset: usize) -> Result<Self> {
+                    bar.[<try_read $bits>](offset)
+                }
+
+                fn write_to_bar(self, bar: &Bar0, offset: usize) -> Result {
+                    bar.[<try_write $bits>](self, offset)
+                }
+            }
+        }
+    };
+}
+
+impl_pramin_unsigned_num!(8);
+impl_pramin_unsigned_num!(16);
+impl_pramin_unsigned_num!(32);
+impl_pramin_unsigned_num!(64);
+
+/// Direct VRAM access through PRAMIN window before page tables are set up.
+pub(crate) struct PraminVram<'a> {
+    bar: &'a Bar0,
+    saved_window_addr: usize,
+}
+
+impl<'a> PraminVram<'a> {
+    /// Create a new PRAMIN VRAM accessor, saving current window state,
+    /// the state is restored when the accessor is dropped.
+    ///
+    /// The BAR0 window base must be 64KB aligned but provides 1MB of VRAM access.
+    /// Window is repositioned automatically when accessing data beyond 1MB boundaries.
+    pub(crate) fn new(bar: &'a Bar0) -> Self {
+        let saved_window_addr = Self::get_window_addr(bar);
+        Self {
+            bar,
+            saved_window_addr,
+        }
+    }
+
+    /// Set BAR0 window to point to specific FB region.
+    ///
+    /// # Arguments
+    ///
+    /// * `fb_offset` - VRAM byte offset where the window should be positioned.
+    ///                 Must be 64KB aligned (lower 16 bits zero).
+    fn set_window_addr(&self, fb_offset: usize) -> Result {
+        // FB offset must be 64KB aligned (hardware requirement for window_base field)
+        // Once positioned, the window provides access to 1MB of VRAM through PRAMIN aperture
+        if fb_offset & 0xFFFF != 0 {
+            return Err(EINVAL);
+        }
+
+        let window_reg = regs::NV_PBUS_BAR0_WINDOW::default().set_window_addr(fb_offset);
+        window_reg.write(self.bar);
+
+        // Read back to ensure it took effect
+        let readback = regs::NV_PBUS_BAR0_WINDOW::read(self.bar);
+        if readback.window_base() != window_reg.window_base() {
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
+
+    /// Get current BAR0 window offset.
+    ///
+    /// # Returns
+    ///
+    /// The byte offset in VRAM where the PRAMIN window is currently positioned.
+    /// This offset is always 64KB aligned.
+    fn get_window_addr(bar: &Bar0) -> usize {
+        let window_reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
+        window_reg.get_window_addr()
+    }
+
+    /// Common logic for accessing VRAM data through PRAMIN with windowing.
+    ///
+    /// # Arguments
+    ///
+    /// * `fb_offset` - Starting byte offset in VRAM (framebuffer) where access begins.
+    ///                 Must be aligned to `T::alignment()`.
+    /// * `num_items` - Number of items of type `T` to process.
+    /// * `operation` - Closure called for each item to perform the actual read/write.
+    ///                 Takes two parameters:
+    ///                 - `data_idx`: Index of the item in the data array (0..num_items)
+    ///                 - `pramin_offset`: BAR0 offset in the PRAMIN aperture to access
+    ///
+    /// The function automatically handles PRAMIN window repositioning when accessing
+    /// data that spans multiple 1MB windows.
+    fn access_vram<T: PraminNum, F>(
+        &self,
+        fb_offset: usize,
+        num_items: usize,
+        mut operation: F,
+    ) -> Result
+    where
+        F: FnMut(usize, usize) -> Result,
+    {
+        // FB offset must be aligned to the size of T
+        if fb_offset & (T::alignment() - 1) != 0 {
+            return Err(EINVAL);
+        }
+
+        let mut offset_bytes = fb_offset;
+        let mut remaining_items = num_items;
+        let mut data_index = 0;
+
+        while remaining_items > 0 {
+            // Align the window to 64KB boundary
+            let target_window = offset_bytes & !0xFFFF;
+            let window_offset = offset_bytes - target_window;
+
+            // Set window if needed
+            if target_window != Self::get_window_addr(self.bar) {
+                self.set_window_addr(target_window)?;
+            }
+
+            // Calculate how many items we can access from this window position
+            // We can access up to 1MB total, minus the offset within the window
+            let remaining_in_window = PRAMIN_SIZE - window_offset;
+            let max_items_in_window = remaining_in_window / T::size_bytes();
+            let items_to_write = core::cmp::min(remaining_items, max_items_in_window);
+
+            // Process data through PRAMIN
+            for i in 0..items_to_write {
+                // Calculate the byte offset in the PRAMIN window to write to.
+                let pramin_offset_bytes = PRAMIN_BASE + window_offset + (i * T::size_bytes());
+                operation(data_index + i, pramin_offset_bytes)?;
+            }
+
+            // Move to next chunk.
+            data_index += items_to_write;
+            offset_bytes += items_to_write * T::size_bytes();
+            remaining_items -= items_to_write;
+        }
+
+        Ok(())
+    }
+
+    /// Generic write for data to VRAM through PRAMIN.
+    ///
+    /// # Arguments
+    ///
+    /// * `fb_offset` - Starting byte offset in VRAM where data will be written.
+    ///                 Must be aligned to `T::alignment()`.
+    /// * `data` - Slice of items to write to VRAM. All items will be written sequentially
+    ///            starting at `fb_offset`.
+    pub(crate) fn write<T: PraminNum>(&self, fb_offset: usize, data: &[T]) -> Result {
+        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, pramin_offset| {
+            data[data_idx].write_to_bar(self.bar, pramin_offset)
+        })
+    }
+
+    /// Generic read data from VRAM through PRAMIN.
+    ///
+    /// # Arguments
+    ///
+    /// * `fb_offset` - Starting byte offset in VRAM where data will be read from.
+    ///                 Must be aligned to `T::alignment()`.
+    /// * `data` - Mutable slice that will be filled with data read from VRAM.
+    ///            The number of items read equals `data.len()`.
+    pub(crate) fn read<T: PraminNum>(&self, fb_offset: usize, data: &mut [T]) -> Result {
+        self.access_vram::<T, _>(fb_offset, data.len(), |data_idx, pramin_offset| {
+            data[data_idx] = T::read_from_bar(self.bar, pramin_offset)?;
+            Ok(())
+        })
+    }
+}
+
+impl<'a> Drop for PraminVram<'a> {
+    fn drop(&mut self) {
+        let _ = self.set_window_addr(self.saved_window_addr); // Restore original window.
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 112277c7921e..6bd9fc3372d6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index a3836a01996b..ba09da7e1541 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -12,6 +12,7 @@
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
+use kernel::bits::genmask_u32;
 use kernel::prelude::*;
 
 // PMC
@@ -43,7 +44,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
-// PBUS
+// PBUS - PBUS is a bus control unit, that helps the GPU communicate with the PCI bus.
+// Handles the BAR windows, decoding of MMIO read/writes on the BARs, etc.
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
 
@@ -52,6 +54,31 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     31:16   frts_err_code as u16;
 });
 
+// BAR0 window control register to configure the BAR0 window for PRAMIN access
+// (direct physical VRAM access).
+register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control register" {
+    25:24   target as u8, "Target (0=VID_MEM, 1=SYS_MEM_COHERENT, 2=SYS_MEM_NONCOHERENT)";
+    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
+});
+
+impl NV_PBUS_BAR0_WINDOW {
+    /// Returns the 64-bit aligned VRAM address of the window.
+    pub(crate) fn get_window_addr(self) -> usize {
+        (self.window_base() as usize) << 16
+    }
+
+    /// Sets the window address from a framebuffer offset.
+    /// The fb_offset must be 64KB aligned (lower bits discared).
+    pub(crate) fn set_window_addr(self, fb_offset: usize) -> Self {
+        // Calculate window base (bits 39:16 of FB address)
+        // The total FB address is 40 bits, mask anything above. Since we are
+        // right shifting the offset by 16 bits, the mask is only 24 bits.
+        let mask = genmask_u32(0..=23) as usize;
+        let window_base = ((fb_offset >> 16) & mask) as u32;
+        self.set_window_base(window_base)
+    }
+}
+
 // PFB
 
 // The following two registers together hold the physical system memory address that is used by the
-- 
2.34.1

