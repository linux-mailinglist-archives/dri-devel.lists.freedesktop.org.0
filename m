Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0C3BBF8BB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 23:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1010E5D8;
	Mon,  6 Oct 2025 21:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nY36OQdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB94610E5AB;
 Mon,  6 Oct 2025 21:10:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgMSjgathNrh67HiaywoZW/CaQCePOVTDstf7nsWasCwWN87RdgsolgFDtyx7z9TZ4kE1JQR5Gwye7SboqdeBWD3abeM6ujh4bbF0BzG4HbIiKzu+HeVEsColwVt7oMiEgvYp2VPjmhMDWxTkTcQWd8A3odYTIBmeBhb/KSMwraCSz9i7sPjNV6J8oTQAwDBY3RgnvDQ5sTUrZU3z03e8tpXHW4pmSyecUM7cIopTXIRgcnXXUx4vTT9NZAOHlIMN3Li55n5eksiVzQ7ilaqH9pRg4PSA6Kk4hgCAcxqcX3nyYma55MOZWOQPjQhium4N3OKEWuOxE6JQBjnh1ew0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB+X8JXmGiaCiI8A4/cDXjWD6BBcQU4A/IAF9sl6Kt4=;
 b=rNWjU1xzzsIjgKw6fvENN7HVO+2gvFQWUIq6GkQTkdZ2N5O1AGFSv4YIwl948gPxDvivoArMu9SFrjLCKOG3G4TgYnoC/M8X0nKAajAqOXgGstkCBT2iXAiQfV6zWtcnrtX3N2CsK+3qZHxuULwT7Pz0rXoCofbyVhQWUsc9Nsk966KB1eWktflrgja3K194+ZFKH6M5xy0cIzjJv3VqZ27Fv20uCRL0QJlJumVorUornm53KM1cyMtPFGBOhgqoQIupVDOdVjTwZ6PYOXnJiu5kPqgbJ9Vf+id/2yOsC9bYMeURbcWv68Tt05DyCnx6HQdijWXxFgNAH/MpWbjGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB+X8JXmGiaCiI8A4/cDXjWD6BBcQU4A/IAF9sl6Kt4=;
 b=nY36OQdxyxuVrsNe0rMKwSVmSFUW9EJxwFddKUJi4kEwhY36snUMtoQs9AjCsVZ7r35r1lUGzzqleG9yZ3WK2XfJ0bFtLkXjOhFoKSBo0uly5B88l9oCyjakm1CCI1IcmGruAjmdO4l9yrN85x0Vof8/54shEjR7tJQHM4RhqdPhtrIQJQ2dg76nDF0QOu1R1165SU6nk72dq56+C0Kst39AZW2NZpr2m2pobSqg5IHMxZHvoW4WHbJ0yXop8xRq/okqVivbGMua1a8kvTk+Be5xGr8MhOGnTXjgQp85+u4BH5GsErApuPYD4y5NmZhjuZc8yktuaUCe2GSFOFhP+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:10:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:10:08 +0000
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH RFC] nova-core: mm: Add initial structures for page table
 management
Date: Mon,  6 Oct 2025 17:09:56 -0400
Message-Id: <20251006210956.3232421-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:208:32a::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA0PR12MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a582dd0-b1c5-471d-ffd7-08de051cbac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WSbzmPUEjb6uuqujXv8NM5DiUWoN1WzfFOugkqwVN4YkpA8SjAZujnIr8i4P?=
 =?us-ascii?Q?eJjY/JuyCKb1en+oP7inOyOdk1lzNLld7YGXrTFe0jAJtDJg0UuljlqeuCE6?=
 =?us-ascii?Q?oyNkOW6MqTd7XjF+ynXQ0db657oygx8wXCvp8ZbK+QHsh+i4Fjn61I2Z0rd1?=
 =?us-ascii?Q?9WEys6N5g8w4Uz//J0//1uthTca2PhOBVcFOq0aTGWqMWGey+6ycMhFGfdNc?=
 =?us-ascii?Q?3JJq8kDRBKVmUzuaVygha1qhJdnUDPzF4ZwYxfIrfrgfQQcP3i0bPBJ5vF0W?=
 =?us-ascii?Q?pk0l2wL1DCg55TdxlXTFvfGkRHyv1an+O9ZyboLOrsIqsgAxksYy5ZTKE/Af?=
 =?us-ascii?Q?hXC1+AbHOnncULlil4bhs0grpwgl/TMROuCcASFHCmSzjNcE8DgWGWvYY7zz?=
 =?us-ascii?Q?1MzGoVqNIvvvEBfxty+2nrcMoyE7D6onN0+4gi5t4DoORUUaqiLW+pXuEPHO?=
 =?us-ascii?Q?aP2vVcbpzVe6/HIrEH4Bl8dIAzOgkpR+nEuADU5zvk4H9yYx9BsDDDGQvgjl?=
 =?us-ascii?Q?/iK8J3ZCtdvBtLfAdCxJaJstQbpbPY+l7zbeqBwaoJIz7h79XXCwte6CN9fa?=
 =?us-ascii?Q?nkMDngbvei0w1wn+WLVxuJhEuBZj0fcAVUOBcGq//tKd0LpLqIAdFHUZu+s1?=
 =?us-ascii?Q?nqxoMJCTy9D5dCRC2OCYQ2MNIBzsjMPMREJQomy2cix0jY+JrWce4PA0VesF?=
 =?us-ascii?Q?loIOvSnYM0SDSvZ7Lvyg2h/0pNFiRSXzbCOcjCrQ9hvM00/w3ZZyneUvIB/o?=
 =?us-ascii?Q?9xaEQXekOvPCzJzcjoySw4+Gz/C61z1xKZZSuJEwJpcjMRRRg0UNNf/btXW1?=
 =?us-ascii?Q?KLFzQnZ3huCNylf0Dyz0lFl9phEbIjc0geS8zwcGdm5681gwsx5DvuM3ZJX7?=
 =?us-ascii?Q?zJWP48nlTjvepgTnVLWgXbQf2Anz5aGv0YMOCtrj7wljkTVcs5+C76B+HEtW?=
 =?us-ascii?Q?uRrioHJgFKwheUnWrGyTOEyduvOfjus9Ab/HzuZflCV6LS1JrkDuF3CSp8fq?=
 =?us-ascii?Q?dOfxWr8kJPyWsKX1Bqinug7TuWv/bX5Uyw5WJFEH/sctNeJIYmJSB4yzZXou?=
 =?us-ascii?Q?w9GCRr8bcfLZOVgFZQmm/TwT73NPW/hlaiw2CjN7GNyDfxPuL9cb8t3zjVic?=
 =?us-ascii?Q?Ucx7BO0WUIWaqIt8xG4ke9DF4wnc2fWt+q6QKgJHtRdI+NBZmGYNr3LpT7XR?=
 =?us-ascii?Q?jgOwZLu//sRVjVcwrA9XerL6R+Jufkt4m+ZJP+VA27RRyz1T2gUxPhYh2Kil?=
 =?us-ascii?Q?XeGtnqfX0OxFShFfIG5Z+/1mxKhdRFwJ3aNnlaBn6NdNBBVfLYCuv2e+Q+c2?=
 =?us-ascii?Q?hF7QxmOWyF+L1knWCNOxSuY/YnzAUQ0XiE/GSoaeMtlUkv7db2QB4Mm3gaXE?=
 =?us-ascii?Q?q9OO1pX+1O4cEqL9SApVCUNIo8rrZOEhXM81DvVUdcuK1Rx90p5fwUo5RH6d?=
 =?us-ascii?Q?hQqHJRoxK1txw6uv7TOjFV4YTLd5n66C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ywRsLaPdrcifJF3sL9ratv3TCMfio1i8exV5jFYtAgVudZ+qeI6AcHomFcUT?=
 =?us-ascii?Q?5Qb+fyyTXlH14i+ZWvOsKC3+6p90Wrmwv6HmGXixIWZ+J0vMyicdS3NAPIJF?=
 =?us-ascii?Q?dzWCAxTvQjJ0j98YanP5juHX6OGXSMMI4oaX3tPqGbOZNT5sjJI7cJvLkZLa?=
 =?us-ascii?Q?019l8IH4PHMyOrUz76bW1AlRL5h2KZqK77jJcLIW6xBpMyB7xVn1jlXDFQeS?=
 =?us-ascii?Q?OLh4fDpMbKF96hl4NR2xftbxpbb1g5yIlXHxVgsdTgPVkhkUsVn5sQnAZyUn?=
 =?us-ascii?Q?20QwRSlk88uXvXzSu/Z+l+JpbPSmSyU9fqpOsFegEYYgQhpjiAswjqhVHi+I?=
 =?us-ascii?Q?hxmQAt7PnWgcopGW5XB+E7pDFWF4ZYKsCgsgjIiKlZzls/vWNh3aEfvopsJ/?=
 =?us-ascii?Q?+QHyg9fuWTQi1bvur9SzYKBNPcNebz1L5KHvMk/5WDfIbGbI1vqqQw2hinJQ?=
 =?us-ascii?Q?I9h4Nm43eCb4uhywU+b+P76hOUpI+y04Zb6EQ8lLhcq2KejlWn1C8JCuOKlp?=
 =?us-ascii?Q?+Awe2TAj7vOIirylzgKhl1CXvDYpnjcWiEdbLVG6gKyahexCjRVkQAQBUQyt?=
 =?us-ascii?Q?BVYWHXOUXJaHlMylMPzrjNMR+/PCAm0yA/weh8bSZ/R6matRXRboE3B+fbrg?=
 =?us-ascii?Q?eO44WxR0bl3osy2TsYCFLZHn857Z86VefEAMZd16zvt4MR0w9ZLwHUko+Ywz?=
 =?us-ascii?Q?rL/BGuA3mlKvHn/fMg6u2q8wHtJHAt8e/u61FRNafGEhYFi9pfh1xMsID8Ai?=
 =?us-ascii?Q?veOZnRQs3V3/9SRgYR47ChJgmYUA8PCIRiuVbptpANVoGxoq7jL3U3gEe3II?=
 =?us-ascii?Q?QLVCfqy2Ihj6nzDl8tfZN2Lh4mhtT0m+Q1nZkwtrJyGNd4hzhtHz/84kf9f+?=
 =?us-ascii?Q?8a0zhH7KGXt+OYSPD11JguV26tHGwZ3Im89AjQ0QHkZbw0vIyQ2bhCyqbx+h?=
 =?us-ascii?Q?qiEtE7BBwoQjJkQlDIJvKgJoiBV5t3ObpdblABwLKzDXxARDsJ07VAf6Vj2l?=
 =?us-ascii?Q?+BOKMfccrW/yeJ6Ai/f1wNzs9fL2f7BbWnyTm9RieKy6pw/chY2jVQAYn6ta?=
 =?us-ascii?Q?Z02QCjcXGJopGimvt4+YBog+vxbeq7JpuMkgmh4A6xP89KKO54bQOeenSNXH?=
 =?us-ascii?Q?VcnX7KXIHC28CblprlGrJ3NT6lFlZwSPJuQ0BmmXoSdEidDK9SmN64HAhQbR?=
 =?us-ascii?Q?EaiAo9nccvJcgilT7tw9qnzA2Tmbja2C9WknkWHc/QF4gTxV4me6x2sw0Ehz?=
 =?us-ascii?Q?4tmr4Idoyxmb6Jw+eJ68lq8mP090/Wsl6020XFCba5OJKiQBW2DnbfLY4MKU?=
 =?us-ascii?Q?q5O2rsnOUtcpUuqN1EWg/6jOJYGN+TlO+M+VpLJ6QzMzatSO7M9pRNiYNBcZ?=
 =?us-ascii?Q?flSiF4PwkJ+pWIF5NcdgsI8RuogsVpsBTTC/aNN46/ZS189KAJzYHdbGCo5x?=
 =?us-ascii?Q?jGV6SuSv6HwE8SzSY7ltd1n/LSW5qYR5avZlorvhXU4VJ8zlVqCo1fE9zYqM?=
 =?us-ascii?Q?LXTEexhrtl+a///rdvN05ydjPikwQRGr7+Ou+/HwJNzuC71MkeLYPEfdR2Fm?=
 =?us-ascii?Q?9woi6W/HEJeNsgCfJ3xouJ/uA+20CPNfyuhSV7T7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a582dd0-b1c5-471d-ffd7-08de051cbac9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:10:08.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5KmEcgxiK2ailXGEN2o++3DbYX60etVi3qC7NZCpbkwt6rnIntwhwl/26wDC1VY4e2K9wdVzw5/2J/1blTXnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4430
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

Add initial structures and helpers for page table management. Will
expand and build on this in later patches. Uses bitstruct for clean
code.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
Rebased on rust-drm-next + bitfield patches [1].

[1] https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.com/

 drivers/gpu/nova-core/falcon/gsp.rs |   2 +-
 drivers/gpu/nova-core/mm/mod.rs     |   3 +
 drivers/gpu/nova-core/mm/types.rs   | 382 ++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs  |   1 +
 4 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/types.rs

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index cd4960e997c8..839c803001b5 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -5,7 +5,7 @@
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::self,
+    regs,
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
new file mode 100644
index 000000000000..4cebfa3cf184
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod types;
diff --git a/drivers/gpu/nova-core/mm/types.rs b/drivers/gpu/nova-core/mm/types.rs
new file mode 100644
index 000000000000..6eca8bcb24a6
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/types.rs
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Page table data management for NVIDIA GPUs
+
+#![expect(dead_code)]
+
+use kernel::bitfield;
+
+/// Memory size constants
+pub(crate) const KB: usize = 1024;
+pub(crate) const MB: usize = KB * 1024;
+
+/// Page size: 4 KiB
+pub(crate) const PAGE_SIZE: usize = 4 * KB;
+
+/// Page Table Level hierarchy
+#[derive(Debug, Clone, Copy, PartialEq)]
+pub(crate) enum PageTableLevel {
+    Pdb, // Level 0 - Page Directory Base
+    L1,  // Level 1
+    L2,  // Level 2
+    L3,  // Level 3 - Dual PDE (128-bit entries)
+    L4,  // Level 4 - PTEs
+}
+
+impl PageTableLevel {
+    /// Get the entry size for this level
+    pub(crate) fn entry_size(&self) -> usize {
+        match self {
+            Self::L3 => 16, // 128-bit dual PDE
+            _ => 8,         // 64-bit PDE/PTE
+        }
+    }
+
+    /// PDE levels constant array for iteration
+    const PDE_LEVELS: [PageTableLevel; 4] = [
+        PageTableLevel::Pdb,
+        PageTableLevel::L1,
+        PageTableLevel::L2,
+        PageTableLevel::L3,
+    ];
+
+    /// Get iterator over PDE levels
+    pub(crate) fn pde_levels() -> impl Iterator<Item = PageTableLevel> {
+        Self::PDE_LEVELS.into_iter()
+    }
+}
+
+/// Memory aperture for Page Directory Entries (PDEs)
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Default)]
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
+impl From<AperturePde> for u64 {
+    fn from(val: AperturePde) -> Self {
+        val as u64
+    }
+}
+
+/// Memory aperture for Page Table Entries (PTEs)
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Default)]
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
+impl From<AperturePte> for u64 {
+    fn from(val: AperturePte) -> Self {
+        val as u64
+    }
+}
+
+/// Common trait for address types
+pub(crate) trait Address {
+    /// Get raw u64 value
+    fn raw(&self) -> u64;
+
+    /// Get the frame number (upper 52 bits)
+    fn frame_number(&self) -> u64 {
+        self.raw() >> 12
+    }
+
+    /// Get the offset within the frame (lower 12 bits)
+    fn frame_offset(&self) -> u16 {
+        (self.raw() & 0xFFF) as u16
+    }
+
+    /// Convert to usize
+    fn to_usize(&self) -> usize {
+        self.raw() as usize
+    }
+}
+
+// VRAM address representation - used with Pfn for GPU video memory allocation
+// and page table entries.
+bitfield! {
+    pub(crate) struct VramAddress(u64) {
+        11:0    offset          as u16;    // Offset within 4KB page
+        63:12   frame_number    as u64;    // Frame number (52 bits)
+    }
+}
+
+impl Address for VramAddress {
+    fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<u64> for VramAddress {
+    fn from(val: u64) -> Self {
+        VramAddress(val)
+    }
+}
+
+impl From<usize> for VramAddress {
+    fn from(val: usize) -> Self {
+        VramAddress(val as u64)
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> VramAddress {
+        VramAddress::default().set_frame_number(pfn.raw())
+    }
+}
+
+// Virtual address
+bitfield! {
+    pub(crate) struct VirtualAddress(u64) {
+        11:0    offset      as u16;    // Offset within 4KB page
+        20:12   l4_index    as u16;    // Level 4 index (PTE)
+        29:21   l3_index    as u16;    // Level 3 index
+        38:30   l2_index    as u16;    // Level 2 index
+        47:39   l1_index    as u16;    // Level 1 index
+        56:48   l0_index    as u16;    // Level 0 index (PDB)
+    }
+}
+
+impl VirtualAddress {
+    /// Get index for a specific page table level
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
+impl From<u64> for VirtualAddress {
+    fn from(addr: u64) -> Self {
+        Self(addr)
+    }
+}
+
+impl From<Vfn> for VirtualAddress {
+    fn from(vfn: Vfn) -> VirtualAddress {
+        VirtualAddress::from(vfn.raw() << 12)
+    }
+}
+
+// Page Table Entry (PTE) - 64-bit entry at level 4
+// Note: PTE has V=1 for valid, and includes aperture bits
+bitfield! {
+    pub(crate) struct Pte(u64) {
+        0:0     valid           as bool;    // (1 = valid for PTEs)
+        1:1     privilege       as bool;    // P - Privileged/kernel-only access
+        2:2     read_only       as bool;    // RO - Write protection
+        3:3     atomic_disable  as bool;    // AD - Disable atomic ops
+        4:4     encrypted       as bool;    // E - Encryption enabled
+        39:8    frame_number    as u64;     // PA[39:8] - Physical frame number (32 bits)
+        41:40   aperture        as u8 => AperturePte;   // Memory aperture type.
+        42:42   volatile        as bool;    // VOL - Volatile flag
+        50:43   kind            as u8;      // K[7:0] - Compression/tiling kind
+        63:51   comptag_line    as u16;     // CTL[12:0] - Compression tag line (partial, shared with PA)
+    }
+}
+
+impl Pte {
+    /// Set the address for this PTE
+    pub(crate) fn set_address(&mut self, addr: VramAddress) {
+        self.set_frame_number(addr.frame_number());
+    }
+
+    /// Get the address from this PTE
+    pub(crate) fn address(&self) -> VramAddress {
+        VramAddress::default().set_frame_number(self.frame_number())
+    }
+
+    /// Get raw u64 value
+    pub(crate) fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) - 64-bit entry at levels 0-2
+// Note: V=0 means valid for PDEs (inverted), aperture=0 means invalid
+bitfield! {
+    pub(crate) struct Pde(u64) {
+        0:0     valid_inverted       as bool;    // V - Valid bit (0=valid for PDEs)
+        2:1     aperture             as u8 => AperturePde;      // Memory aperture type
+        3:3     volatile             as bool;    // VOL - Volatile flag
+        39:8    table_frame_number   as u64;     // PA[39:8] - Table frame number (32 bits)
+    }
+}
+
+impl Pde {
+    /// Check if PDE is valid
+    pub(crate) fn is_valid(&self) -> bool {
+        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
+    }
+
+    /// The valid bit is inverted so add an accessor to flip it
+    pub(crate) fn set_valid(&self, value: bool) -> Pde {
+        self.set_valid_inverted(!value)
+    }
+
+    /// Set the table address for this PDE
+    pub(crate) fn set_table_address(&mut self, addr: VramAddress) {
+        self.set_table_frame_number(addr.frame_number());
+    }
+
+    /// Get the table address from this PDE
+    pub(crate) fn table_address(&self) -> VramAddress {
+        VramAddress::default().set_frame_number(self.table_frame_number())
+    }
+
+    /// Get raw u64 value
+    pub(crate) fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT pointers
+/// Lower 64 bits = big/large page, upper 64 bits = small page
+#[repr(C)]
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct DualPde {
+    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:0 (lower)
+    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 (upper)
+}
+
+impl DualPde {
+    /// Create a new empty dual PDE
+    pub(crate) fn new() -> Self {
+        Self {
+            spt: Pde::default(),
+            lpt: Pde::default(),
+        }
+    }
+
+    /// Set the Small Page Table address with aperture
+    pub(crate) fn set_small_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
+        self.spt = Pde::default()
+            .set_valid(true)
+            .set_table_frame_number(addr.frame_number())
+            .set_aperture(aperture);
+    }
+
+    /// Set the Large Page Table address with aperture
+    pub(crate) fn set_large_pt_address(&mut self, addr: VramAddress, aperture: AperturePde) {
+        self.lpt = Pde::default()
+            .set_valid(true)
+            .set_table_frame_number(addr.frame_number())
+            .set_aperture(aperture);
+    }
+
+    /// Check if has valid Small Page Table
+    pub(crate) fn has_small_pt_address(&self) -> bool {
+        self.spt.is_valid()
+    }
+
+    /// Check if has valid Large Page Table
+    pub(crate) fn has_large_pt_address(&self) -> bool {
+        self.lpt.is_valid()
+    }
+
+    /// Set SPT (Small Page Table) using Pfn
+    pub(crate) fn set_spt(&mut self, pfn: Pfn, aperture: AperturePde) {
+        self.spt = Pde::default()
+            .set_valid(true)
+            .set_aperture(aperture)
+            .set_table_frame_number(pfn.raw());
+    }
+}
+
+/// Virtual Frame Number - virtual address divided by 4KB
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) struct Vfn(u64);
+
+impl Vfn {
+    /// Create a new VFN from a frame number
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get raw frame number
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
+/// Physical Frame Number - physical address divided by 4KB
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) struct Pfn(u64);
+
+impl Pfn {
+    /// Create a new PFN from a frame number
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get raw frame number
+    pub(crate) const fn raw(&self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        let frame = addr.frame_number();
+        Self(frame)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249f..ff994f1ec9b9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod regs;
 mod util;
 mod vbios;
-- 
2.34.1

