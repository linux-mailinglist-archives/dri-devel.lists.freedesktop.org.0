Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BBBF30ED
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BFA10E4F2;
	Mon, 20 Oct 2025 18:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rs6D4Eqa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E766610E4E1;
 Mon, 20 Oct 2025 18:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9vpy+r/DFh8HVML8F8IIyUdldyVloRnu40iXhiHa7LHQt3BwIS93BUYA4KGYW5XDuzpx9khxtABvODNTkVQiX7QezRVYHIQm1NFM6O9yKNI5FPHO3tZepiMWHmeSFx6W+6/cM66Y0uM64lXMKrRltY8CljCqaXAgI7Zp9p+zT6rlb/vDJozqi6jKJBny5uK6nKaIGdbaWSNRaLw5fa4QC9Yr1/ab/qZqpqfEJ5HCKXaL6NTaKi2ucXq+V4FnvJzK1zRfyj5nHE8H5bpWSKUviMkPlkX7HZr7ardTf5L3PpY2F7dUHJy5+OvMR5yW8tK5jONpFPAvjG3xL0TM+TgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrKdIs3/h04VVCdjJUe4Di1idqqzTXwYNxzsveTKnVU=;
 b=PD7kTV+23rzQrCmwD7nT6hnQxQkwZHUH5e8e4SehJKqyl2zb/heHYBQedJ1EvU9lQGlcvP/ny/uowpoIihjGlv3BIQOnnbGMJpfpdifWtO+ko5Lg1s4rPFiNnBB+SDxx5kLGK4bDvMMxB1Mip1tubL2pRq5IsnlJuXJy/h/kLAWI9Mr9TsoBWklpqlAJ7d6ieD65o2o7lSTPf8RNHoINK6rWT7oCUx3cRuGsNEWOHv+o1+cQGebhR2tGCP01n0uq6A2kWYsrdEJbcGl0xYLkjU8aJuz8aMXGt1RbM0OlNb8+WXQ8Uv/aDgNKmB6htMgsHjRFHUzquy2fjZ2PXTjWEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrKdIs3/h04VVCdjJUe4Di1idqqzTXwYNxzsveTKnVU=;
 b=rs6D4EqagcW8y8gWjpZHW+R1TSr7m7KVJow6ErhEju7RFcGsm1wvNGYvrffnxNkVJeFNd6x30wED5saQXPRNEU+Kku4az3KpPQAA4RLA2j6Dq1pkHdO3tKEikVDZUJQ5EGAe4SuR0J8wMO4rR2xLWjWJbrswiubIv45T2BojJbm2Oq0RdYPrhOAMv/hDxb1fVkYROaDE2lcrCsFRpUrVAq4QPj8BWQ4aAElmNqWvDOHTfZgBM316yTiqaZxw5uWvxYOlDiF+IA5KG2z4nFm++mPsBX//EgfBnbiaFRXnA2LFyNReXfzEII2MmjF0GlO8UoeacchVKBu5trlIwhPYYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:54 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:54 +0000
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
Subject: [PATCH 3/7] docs: gpu: nova-core: Document GSP RPC message queue
 architecture
Date: Mon, 20 Oct 2025 14:55:35 -0400
Message-Id: <20251020185539.49986-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:408:143::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fd9e52-f9a1-4fe3-39ed-08de100a4bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f47vv5jNK55VcGOOAQ5mmj4EBiUt9MZTn3tHsqIueKTCBrN/oRpgPraAEbwx?=
 =?us-ascii?Q?y8NSiIPioAtR/PBkdfyNaGhwu4YSiDoIOSe0gUBUXoGzjQ/9RIqWOQQ7B98n?=
 =?us-ascii?Q?WC9qoagypbNCff7hWxiSlTa5lVryWCBcTDhSwuJ31lDcv7yUMx5uv8MX2ye8?=
 =?us-ascii?Q?iIVc0E/LmtiU0OPhMsMkll1+UjQ1V7Pex9sjivhfbP+atxF6C/JKbp6z6LQ6?=
 =?us-ascii?Q?9BwlVl9XC/UNenmphAd+eLB/BedgWCPo4sY5mdBywLAQ7x4Y+lLGtzQktue9?=
 =?us-ascii?Q?E+qz3AXP0KyMK3U9y3sf2+GONRySSoBfYnpNwJU3i0xH47LbBLhxwFDIp9sI?=
 =?us-ascii?Q?zUy5kbzYVUCbnwUc49ALJ1u9+z5P0kB7sGYwHDRuyrO3WtYYDEzXr/UubFJE?=
 =?us-ascii?Q?/O8nxsIT0fWcpQDLX84icsN0JX6Bay0IGs+xmGj47voTvk7XRf4v7MeqO127?=
 =?us-ascii?Q?lW2dcCiO4ZBVmez4OQty/cbcEww3iazFiosGjhv1CJqy67lFRC6pzI0ulaiR?=
 =?us-ascii?Q?qQaoAcNZeShbB2/PLjMDdnIYgyMi8wUVRmuK5juQqpqJLIaAm8kmlm0yc4+W?=
 =?us-ascii?Q?XNvnRq8Dd2N6sGu2x+kvR3OwplSZIkJLPRIHYIYyA1y8+ujFxWCdLHXuqOzX?=
 =?us-ascii?Q?7oTkErrpB5ZrmNh7wAGPUcqM3PwERNSuOx7ucX4f3edVOQ6ew2deRcKF2OL1?=
 =?us-ascii?Q?SzLgE4LIwCqb5C4SU/hV5dEqQpG5SDkkwpYd/UfDb0pdAYMIZsoA3QKO1Nj/?=
 =?us-ascii?Q?X0XROROW817F9iJHkQzlDwtZjQlz0z0t/junUVqhi0JSlpATTLeNbRq6fk9g?=
 =?us-ascii?Q?vp4WtDLDNZGlU8ymPJHX8PztFGI6Qxj3hk84sZwJzWY5tMYdTyTaufKTiLCE?=
 =?us-ascii?Q?T4D8+E29zPwfEWR4lXo6q0aVjcaDo++ygFN7r/NdOOEOPG8Yq6Z0FQ/YPNjj?=
 =?us-ascii?Q?mTMjH074j/VztzM35lSI42T9G81DGiXZ9TsDnBtBUgeIsDkf18mR6IOrLYeL?=
 =?us-ascii?Q?ItWw9SX9y8r+IAz1tBK0Oy082EMuy3AKa3mhTl0cM073QZTjO5FgSENHT1Lh?=
 =?us-ascii?Q?ZUHw6alUgOhhD40cA9Tq9wBX4Mov94iYknJRfDbd/I7x6c0o1+bLkcduq9GN?=
 =?us-ascii?Q?V+ms+bJPc6OeHvDwxhsFzntUbkrreje9mCbd+dliBwyW1ImI2PJvXcdb5NQw?=
 =?us-ascii?Q?9iBeRz/Bz7awNb6XptbRJnZVUF8WaTKMYmokOcHt25xxwLX9ykhr4u9HHbMs?=
 =?us-ascii?Q?rQwLAFrObUUNg8FG4W5SQB78RbuGN968qDCBE/TL1S6cY6EXzgBfGcd673HR?=
 =?us-ascii?Q?LPaPYPNjSEbLdF+xoskygxLRH6eMGeptvjkqc2MttBJXXpazi3UuUyzAxKyi?=
 =?us-ascii?Q?NgCLxhgwoVrKivarASkTQAzF8BatOKApR7Vi8yvOfXjUzdFjD+WAKqDaJ6LR?=
 =?us-ascii?Q?nW5T1NgmECFk3Ye5d1GLgKWtiXaN3tz4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhEHhmtAyxUkeeJx0h0/b/kxZZDJC8/1mhJzVA8wdq4yl0NBS1ENAujqcq1y?=
 =?us-ascii?Q?nVKpNquRG61jqQap1TvjZHbPcaLdULfOLttg/rnSaaxbyexycOzl+x8cRF1p?=
 =?us-ascii?Q?EseXdVyTyJsbfbZt4DWT3XD/A9+eBllCKRpm8S6qBau1NWZ9IUNeiLM1mlob?=
 =?us-ascii?Q?diKmNGTc0Ba9tNQ4j4xItY2QdqdArQGC/er/mWaadGmyu/A90L2k897SJCP9?=
 =?us-ascii?Q?4vW2KvzQ66whwe0HWs/cdInd37M0yZzDD2NCw/ON1KIuAbVvCmpoScLFXr9z?=
 =?us-ascii?Q?SU8NZgBWwK7NU48HaNrba1NpNc2OwJ1W4GOzVUVDJ7eV0t1auyKe1QZSIbd7?=
 =?us-ascii?Q?Kgf15wZT2phZ+ihfJL9StJMr8HHQQ7xVWdhP3EdhFWUH0ZXXmeyitMqXycD+?=
 =?us-ascii?Q?ctb5Lw8KBROJb0KRPrYTM+1YQKjdNMr11M0puASdqjbkjgbiA/B8FzarWfQv?=
 =?us-ascii?Q?2EKnoFliZ1GhRjJHINULU688zUzWIioW3JQY++x7jmtdaLqsRxvoMPUlGiyE?=
 =?us-ascii?Q?nSeBZR72aFW7FYSGU0maF62TxZnITSOxG/x4TeA9gvdQ6EUtezYLurqqaMfj?=
 =?us-ascii?Q?J23AZ2tAJgeKSp65/Mbokz3EtCf5mE4cScRqwV559ezCJKk7D3YA+mL8CST2?=
 =?us-ascii?Q?OxMlfajOCYYL5IN9t+bWZ+BBVy+EHOdLES5xNkHmy98w8Ea2LDtqQzOTCnpB?=
 =?us-ascii?Q?tI7ONvZ8I4Gubx7rb7ARDNaZ5FRy8XsSt7blCXRqxrZ4RaJdrU3HYtGg2xxW?=
 =?us-ascii?Q?MHnWxG5v6qGWav9x2r6dct6CPYgjdvEPEq6xTeLfm4LCo6F/QGASNZ3wT8EU?=
 =?us-ascii?Q?xaXk3TP05I5dpBhyg2oO/ZJzBNA9yy1V7ltdyKAMozauABbiL7h+itQNzKFY?=
 =?us-ascii?Q?M051bMrPBhBpD8KAFW4RwLVGPsZQNYCXd6J8FQnH6o3bGeQiUfgav0LVpdMX?=
 =?us-ascii?Q?RFgT7avKLJOMQbID7TnRmTNnS8EP20IMarStU2erUU9dnjJidCL8yQsXawdN?=
 =?us-ascii?Q?eAijtzXtrEDXVj9sJf+gXruub6XNLiVBakgci5QKqBQYbRTyCzwTnuFM3Mel?=
 =?us-ascii?Q?m2XVFsOeA77wm9N4z1+VaQ8Y6uYkOIzrH+45mej3WIynQ6TwRLAYgp5AEl8l?=
 =?us-ascii?Q?L+K2Wd0YQRObDej45x7LB61dRynKW/gjLY4caXuXWjtewTA/iRYPW3DA2qm7?=
 =?us-ascii?Q?eQ2/A4qkToXHqNTk3GgMfWh+WPIppZaalLVDEG6QwS2Ukv0ZuE8kWw1BX7N6?=
 =?us-ascii?Q?oVL45+EmS2pNRR1wvuFkHp7SbL1wouCuKgv6JdLLiLLyQooTk3y3wbRl3aSF?=
 =?us-ascii?Q?Rqt4oEYr5hTOkFkATjSu33DLg0tsaXXsk05+xh5o74QRLza/iskdooLnwkgQ?=
 =?us-ascii?Q?1g2owuc9HG50dOihyVo/Utu7LpSG64zix+3RbjERLdna2VS9EhMza7WdV3aq?=
 =?us-ascii?Q?MqK39x9DInR6GM+ffHRi5i4gHk4eDOasspvgG6qUf9GnEjEamDyGxkieJJWi?=
 =?us-ascii?Q?enU53gsV3bIBlWPq7+3rW822JZYYiJ7ffYeVeAPcw4y/Y4myJI54zpGTCKxv?=
 =?us-ascii?Q?RxJPl9Kin9/zb4Ze2Z/V50ATVsg+Y1tQ5MMM1K8p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fd9e52-f9a1-4fe3-39ed-08de100a4bd7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:54.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nevxwV0YUprTMGv1906odz2PN5TwoSGOmuwcrC62bUHFzYMKB5POn6H4HHT8qsNYyu4zXqLcjtdbb9pvUzVifA==
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

Document the GSP RPC message queue architecture in detail.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/msgq.rst | 159 +++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst     |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/msgq.rst

diff --git a/Documentation/gpu/nova/core/msgq.rst b/Documentation/gpu/nova/core/msgq.rst
new file mode 100644
index 000000000000..84e25be69cd6
--- /dev/null
+++ b/Documentation/gpu/nova/core/msgq.rst
@@ -0,0 +1,159 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+Nova GPU RPC Message Passing Architecture
+=========================================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Overview
+========
+
+The Nova GPU driver communicates with the GSP (GPU System Processor) firmware
+using an RPC (Remote Procedure Call) mechanism built on top of circular message
+queues in shared memory. This document describes the structure of RPC messages
+and the mechanics of the message passing system.
+
+Message Queue Architecture
+==========================
+
+The communication between CPU and GSP uses two unidirectional circular queues:
+
+1. **CPU Queue (cpuq)**: CPU writes, GSP reads
+2. **GSP Queue (gspq)**: GSP writes, CPU reads
+
+The advantage of this approach is no synchronization is required to access the
+queues, if one entity wants to communicate with the other (CPU or GSP), they
+simply write into their own queue.
+
+Memory Layout
+-------------
+
+The shared memory region (GspMem) where the queues reside has the following
+layout::
+
+    +------------------------+ GspMem DMA Handle (base address)
+    |    PTE Array (4KB)     |  <- Self-mapping page table
+    | PTE[0] = base + 0x0000 |     Points to this page
+    | PTE[1] = base + 0x1000 |     Points to CPU queue Header page
+    | PTE[2] = base + 0x2000 |     Points to first page of CPU queue data
+    | ...                    |     ...
+    | ...                    |     ...
+    +------------------------+ base + 0x1000
+    |    CPU Queue Header    |  MsgqTxHeader + MsgqRxHeader
+    |    - TX Header (32B)   |
+    |    - RX Header (4B)    | (1 page)
+    |    - Padding           |
+    +------------------------+ base + 0x2000
+    |    CPU Queue Data      | (63 pages)
+    |    (63 x 4KB pages)    |  Circular buffer for messages
+    | ...                    |     ...
+    +------------------------+ base + 0x41000
+    |    GSP Queue Header    |  MsgqTxHeader + MsgqRxHeader
+    |    - TX Header (32B)   |
+    |    - RX Header (4B)    | (1 page)
+    |    - Padding           |
+    +------------------------+ base + 0x42000
+    |    GSP Queue Data      | (63 pages)
+    |    (63 x 4KB pages)    |  Circular buffer for messages
+    | ...                    |     ...
+    +------------------------+ base + 0x81000
+
+
+Message Passing Mechanics
+-------------------------
+The split read/write pointer design allows bidirectional communication between the
+CPU and GSP without synchronization (if it were a shared queue), for example, the
+following diagram illustrates pointer updates, when CPU sends message to GSP::
+
+    +--------------------------------------------------------------------------+
+    |                     DMA coherent Shared Memory (GspMem)                  |
+    +--------------------------------------------------------------------------+
+    |                          (CPU sending message to GSP)                    |
+    |  +-------------------+                      +-------------------+        |
+    |  |   GSP Queue       |                      |   CPU Queue       |        |
+    |  |                   |                      |                   |        |
+    |  | +-------------+   |                      | +-------------+   |        |
+    |  | |  TX Header  |   |                      | |  TX Header  |   |        |
+    |  | | write_ptr   |   |                      | | write_ptr   |---+----,   |
+    |  | |             |   |                      | |             |   |    |   |
+    |  | +-------------+   |                      | +-------------+   |    |   |
+    |  |                   |                      |                   |    |   |
+    |  | +-------------+   |                      | +-------------+   |    |   |
+    |  | |  RX Header  |   |                      | |  RX Header  |   |    |   |
+    |  | |  read_ptr ------+-------,              | |  read_ptr   |   |    |   |
+    |  | |             |   |       |              | |             |   |    |   |
+    |  | +-------------+   |       |              | +-------------+   |    |   |
+    |  |                   |       |              |                   |    |   |
+    |  | +-------------+   |       |              | +-------------+   |    |   |
+    |  | |   Page 0    |   |       |              | |   Page 0    |   |    |   |
+    |  | +-------------+   |       |              | +-------------+   |    |   |
+    |  | |   Page 1    |   |       `--------------> |   Page 1    |   |    |   |
+    |  | +-------------+   |                      | +-------------+   |    |   |
+    |  | |   Page 2    |   |                      | |   Page 2    |<--+----'   |
+    |  | +-------------+   |                      | +-------------+   |        |
+    |  | |     ...     |   |                      | |     ...     |   |        |
+    |  | +-------------+   |                      | +-------------+   |        |
+    |  | |   Page 62   |   |                      | |   Page 62   |   |        |
+    |  | +-------------+   |                      | +-------------+   |        |
+    |  |   (63 pages)      |                      |   (63 pages)      |        |
+    |  +-------------------+                      +-------------------+        |
+    |                                                                          |
+    +--------------------------------------------------------------------------+
+
+When the CPU sends a message to the GSP, it writes the message to its own
+queue (CPU queue) and updates the write pointer in its queue's TX header. The GSP
+then reads the read pointer in its own queue's RX header and knows that there are
+pending messages from the CPU because its RX header's read pointer is behind the
+CPU's TX header's write pointer. After reading the message, the GSP updates its RX
+header's read pointer to catch up. The same happens in reverse.
+
+Page-based message passing
+--------------------------
+The message queue is page-based, which means that the message is stored in a
+page-aligned buffer. The page size is 4KB. Each message starts at the beginning of
+a page. If the message is shorter than a page, the remaining space in the page is
+wasted. The next message starts at the beginning of the next page no matter how
+small the previous message was.
+
+Note that messages larger than a page will span multiple pages. This means that
+it is possible that the first part of the message lands on the last page, and the
+second part of the message lands on the first page, thus requiring out-of-order
+memory access. The SBuffer data structure in Nova tackles this use case.
+
+RPC Message Structure:
+======================
+
+An RPC message is also called a "Message Element". The entire message has
+multiple headers. There is a "message element" header which handles message
+queue specific details and integrity, followed by a "RPC" header which handles
+the RPC protocol details::
+
+    +----------------------------------+
+    |        GspMsgHeader (64B)        | (aka, Message Element Header)
+    +----------------------------------+
+    | auth_tag_buffer[16]              | --+
+    | aad_buffer[16]                   |   |
+    | checksum        (u32)            |   +-- Security & Integrity
+    | sequence        (u32)            |   |
+    | elem_count      (u32)            |   |
+    | pad             (u32)            | --+
+    +----------------------------------+
+    |        GspRpcHeader (32B)        |
+    +----------------------------------+
+    | header_version  (0x03000000)     | --+
+    | signature       (0x43505256)     |   |
+    | length          (u32)            |   +-- RPC Protocol
+    | function        (u32)            |   |
+    | rpc_result      (u32)            |   |
+    | rpc_result_private (u32)         |   |
+    | sequence        (u32)            |   |
+    | cpu_rm_gfid     (u32)            | --+
+    +----------------------------------+
+    |                                  |
+    |        Payload (Variable)        | --- Function-specific data
+    |                                  |
+    +----------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..46302daace34 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/devinit
    core/fwsec
    core/falcon
+   core/msgq
-- 
2.34.1

