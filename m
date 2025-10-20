Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA31BF30EA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEAA10E4F0;
	Mon, 20 Oct 2025 18:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BFdOt3vH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ABF10E4E7;
 Mon, 20 Oct 2025 18:55:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V66CtW9x1wyUpt2UORpogzu+ouFvuz7dORF6HEOMXDmn595wvmhFTytEcTm16IUxHGfGXyqG1SdBJow0K5Q/tNPPagEnvhzk39O7Xktoxq5ycaDql4XNsyC8OQBVy02wbo33+3x2S3goFIib95ozvzlTvZL+xvgIAZnnt+brFqKE3dqC5PDVu7sWJA0Rh56UvsRkz/tr/EWzy+f1I3g4LhBVT/cv92hrUTLNYNbirvpP0h3JUea/4Mw2o5HNpdYcJ1GgzjNViMbtp2Oj/03uATV5K60hwCzTz7DNrqUFNPCuvjdDKahjj79BNdPXkGgPOwcPwVLZyDnsCiETfOKi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0Bz/jrMG+Y1wKZnOwME1AjoM7U6KTF17WoB0QPH0Es=;
 b=A+ECXIuOv3HBldMVz2m0sl6oVT+SwI9dZDD5lvRKguIBOGYZNw/XbaOmBWbc3utCaCpJLa8O5FQaXmBaImexjCp2aah9qx1ZziDGqDuiC6kLUCS/2Gmvo2xT8MGCJJiy/WsqcVUGrc4jj+H6Y2PNePZl4RnW/whUEBRlmSyshBDOjNYZeg+/fvcVFlgewhDhjUZhFQUrCc+lpKZwtJs14vxrlko+u7y7K7Ka4qO6hb5SeiecfF6ODhVHMtxC+anED1qn5A8COSzESdbYH+Q0Xym9WYynj96xUi1wiFNMEisTl9U93+xNrFRwb3reLd3LKUqKdiJqFGrAhhIqTFmAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0Bz/jrMG+Y1wKZnOwME1AjoM7U6KTF17WoB0QPH0Es=;
 b=BFdOt3vHLZC0OKLDgECRJ5Xyj3n97binpUcLQg4frOAs/Z6SmgAQIGDtQEbotw6YYt0TnTook8E62xw46Zd/qxlDYklLheVmjt6Y1hk20uyvYqsoF69mgBfzYJOlGdgUiAoJJ1P6pK7ivCEe+W1RUqEs6UUojjWwO3PLS4a6flWuM7sx2G99oAYggtuqwE0Ur9Kb3/2MRhsng7edYb+VTnrmvRB6fuB5lqZoa+YAGe3o3eTs6ciEktExnIjYcs+m8ZDSlb1YfpZ6DW9f3V4Y/sn+NLN8ypJVtOxu9qU8O+8NCPK1h0SJjkn6ZY2z8bltK3czL7VxYY65Dwvq3qbEOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:56 +0000
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
Subject: [PATCH 4/7] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Date: Mon, 20 Oct 2025 14:55:36 -0400
Message-Id: <20251020185539.49986-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:408:143::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: aea642e7-34c0-4f86-170d-08de100a4cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hEN3EQ+6+zhjGCG1qiUXJXWFGe12nJoqAxkKDuyUFMdv5k28mRQyBDfScnyg?=
 =?us-ascii?Q?qY1Uhyjng5gSYaurWGHjxOie4Sp7paqkn3ZFNlryo8rd0X3hlmG/23sFvj5R?=
 =?us-ascii?Q?HIDdxeZ3ibdbYgyzeuuDAr9YqfN1gbHBjsVe9D6+ldghtec41XuoKfKFkBSN?=
 =?us-ascii?Q?8IFHqOB6uaOsWSUHoLEJynSfYyMeRz2uboND0MsRV1jwq9gWXaVM5GKx7XI8?=
 =?us-ascii?Q?jnpHWy02LFfY4t+LMUbGf/pt2cp2/AHh3vq4EMQOaGKzGZudji2dZfWRanrc?=
 =?us-ascii?Q?elu5tCmm+nUDde2QisUhZT6+ppuflbixhHyVl+uaTIZ2EqsAIMlB3pnYkaY/?=
 =?us-ascii?Q?hcSPfDqmUiQIslO4gOalp+GMJ2ffn+kkCaRGV36khdEfQtl3t1gWn2waEVIb?=
 =?us-ascii?Q?/RO7FakmZ8M9BBfDImbqPI8Z7RmnCV8zyIB8rpRFeGG2vXzsb2w/9pmgyFEa?=
 =?us-ascii?Q?ym89H7/TgtY2T/7WECEQRXZiuWjqKXdbq/K9lgqrDwyYOIPkRsjBNrxZXUUc?=
 =?us-ascii?Q?1diIkHWYbY8XaqsH9T4UXHnNoZpGNziEh3aWFIzu7SFYXc9XMUQPT+a1heD2?=
 =?us-ascii?Q?1noCSwG9c1cSmOGrYjiuFsDK6+060WskTjoz27LMI3WadblBijvxF4gzvQuU?=
 =?us-ascii?Q?5kSrhqXQgDPObARpSi8ybHkQzw5i/MJ7PooQQ/VArJ0XCCf396BaZVxC0uLo?=
 =?us-ascii?Q?Vgn+42RFvmX1V89AdURsxktSES8lgWtiieSdMAO2iEY0k6ZcWqaKArYo9FPL?=
 =?us-ascii?Q?GIPfCxMk4Q6OhPpQbC1XYA2RwuRflhFFE/0+r8VNAnyKe7wVQo6YMEXKyIF5?=
 =?us-ascii?Q?clGIhzqfV1FcQJHnRphqjdmeb1vc/lvrJqDcduMreTcLzcAyVgkWvaFwM9aJ?=
 =?us-ascii?Q?Er+MVV7to1PFgs4lDKUNrcLaI5vWbCb76vTFd2sYB2BlS+kuyteFN8reizcT?=
 =?us-ascii?Q?yGBWeRVLdoVpKCCZOFG6lcgtHxjuj3qQWazJsaYHNZ5z9i008Jj49jTRl+ZV?=
 =?us-ascii?Q?YLzF0MHwMpIPR/wXZ2fqbCOwZEu+aSnU/nj+TJcXJwYWECEvVoqYHrUHWugv?=
 =?us-ascii?Q?M568gO1MZpiStdiFP3t4jlmIsBzlx9UvlK4hSccKO8P1Q/WMRPk7tjLBp6kJ?=
 =?us-ascii?Q?jQUmtT1VzSQcxtd8+CAiVb8Aviwq8oCHk3rohdrcNTzmcYE5XsRlIuK8a4LE?=
 =?us-ascii?Q?0fYGX/9N3riMlcL//wrhtcFEKghw4QPagghSfm6eaHVKQTE5BZJvsSkDJVah?=
 =?us-ascii?Q?KHy7k6ekLby/xF0tRxBYH5/ecuQX2Xwma0LK+9Z2gChSnJ+mB0ZAGv3b/gmI?=
 =?us-ascii?Q?AVqMOry4yCP17x7lEFtvBzjwM9EW9FP+fV/pMczG1P1fXJlxfG2P4bHsYhy7?=
 =?us-ascii?Q?tz+O0mz5ItLLmFikSnm/O4rBRDZnwUyy6Vtyj4AQJCNUfm0hQ9ImKLK1kAHf?=
 =?us-ascii?Q?AgBVah/BPaCKWD+zwuqioVc0i5GTQ5o4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ro+2VPRxlq280nC0mSp+LZUFzEe9tfV/R0yRBc4/bEE9zhfdPDhoEE2AQVz4?=
 =?us-ascii?Q?MgHXqpJ0qGehha5ZPgraaf7unp3JkPt4UNFv9f9/FQ2lsPtLBDKcomD0EY8q?=
 =?us-ascii?Q?BNaYdcrJHff2OKuPQ1BARNrPErnGL+2mfR7hxrvXdMJIxJeOzxxYE9wWH473?=
 =?us-ascii?Q?9RSOBBPqU4gr7EcOheqHwxNgoeNLeRdZ9PF6QiVHln40FuHXjk5Oz0U3CFTX?=
 =?us-ascii?Q?i0CJQ95hpG1LXW5itih6FCuvlvIqkyTxgbMQm17nuwZl2AY86GI/pFfNBzBI?=
 =?us-ascii?Q?dGW/FOImORvS/TqHvhs2si1xP+xefKD8UVqDWuH264he8G5P6/vH0NlBSOsy?=
 =?us-ascii?Q?Nyt8IROdPhPpDTCdlPhEtkVMkhAiE/UlsVfbJ7xIu4tM89JiPuGC6ueWQ6fL?=
 =?us-ascii?Q?hExcrRrZb+PFIVjtr1Jw8FYyS1B/hRxnOWluY8tAZ6gpbMutOJ0f5HGByvHE?=
 =?us-ascii?Q?twV/DeNUP7REHyMi9IHZeSbmMOzA5wa2FgRxvqApOFWQHyofTGclk3w903b1?=
 =?us-ascii?Q?OWlBtqpAI1Cq1T4ORfk1Ha01akinRuaUahJe+J/H7tLH69izG0QGRPbzGWFJ?=
 =?us-ascii?Q?n5CdH/VFj+wQzb+3uznrDtGGpKs446gFSt6pXMDHFTu0kTvdYqIe47JOOk5f?=
 =?us-ascii?Q?b6M93x6WCciqyeA6gmOcQxQwY17rQ2IZLV9u2IU2liuRQ720CAUMEWumtUsx?=
 =?us-ascii?Q?i+AdaTIhjWBXBu5fgIeWlKorUAarykGRPt9VL3Pqvjzv/Ry/I7PUMbYnGnAo?=
 =?us-ascii?Q?p1ZQaNKaMQjF3ReoCbdSb8JO208itOZeqeBZ7XYYGW+/RYX44yh+9WPJY2DI?=
 =?us-ascii?Q?PjnPGqYarLEuxwBWBFZY2A91u/PQtOBPX3PzuT5bzHNPnBqjoMtK6vQIt+Sm?=
 =?us-ascii?Q?Zt/R8o0j/LjUdndsfTg30V0aRCptqxMSAEQINuwMMboS9jMcmYQ/hXWqrkC7?=
 =?us-ascii?Q?6nqyrI48Rz7m8i5OoR541sFLNVe9/CUjh4CCPPeOZ6DhslVo3eKq5fkK/Ita?=
 =?us-ascii?Q?+5F+Xeffy2dA3Zu6PFmben1jLxqxq+fVBUYqOKzs0hhwCojVvgg6oOKD7yzI?=
 =?us-ascii?Q?Ymhz0CSXt3KwbzY7fYSeZ3IlU4iAA9N1hGsDlkfdEFOzgurKXqFsTzl/hVUI?=
 =?us-ascii?Q?aefKc5AtU1unCQwT08P6hvKbKBK+EPv7raT4FMGdW7Lmr7yCr5bakKGll0MW?=
 =?us-ascii?Q?WsxCI7PuggHzq2yuTUEeT6nZmTTiEuZgepaLxZngdNj8sujByhxxqxy9eSuv?=
 =?us-ascii?Q?N5gH/oDlapjfUxjx/76ouTfo/0fPnaAfEVCYgbqKOCs3jY3NgUunLrCPzMLj?=
 =?us-ascii?Q?1c1++Zyg4KPfdiItHz39Hap3k2qQ3pXAd+IC0Srt6K0s3U9rYQ91Apqpvc3S?=
 =?us-ascii?Q?+m2hmuLSfZ+JcppaORq4FdKPbXtk1pmqkkEjSv6Vrs52MCdDBIGBTP7tmJuo?=
 =?us-ascii?Q?wyHRHEQy4fsPvC90ZUWJmVfRr3B+lT393sC8LUz4o+Z3mueH4bWwQQ3NeHSF?=
 =?us-ascii?Q?hAdtmbUTYcPAmDQakhmMZmtRXq+4TB5AiHnYeY6SnECHpJZPkZXXfqrkdOe8?=
 =?us-ascii?Q?g3NnJX5hQd1aT1yj97mX7f9F3CwT9/NV984svKvD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea642e7-34c0-4f86-170d-08de100a4cc2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:55.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EDHt7RyXvBaMCLbd5eaDlZhBh5FqCGquDt5McagFoL4MOHT648qlp7rMPZWFmDPZrjAkSmO9PYxSXjLKBMBVA==
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

While not terribly complicated, a little bit of documentation will help
augment the code for this very important mechanism.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/pramin.rst | 113 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst

diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
new file mode 100644
index 000000000000..19615e504db9
--- /dev/null
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -0,0 +1,113 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+PRAMIN aperture mechanism
+=========================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Introduction
+============
+
+PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
+the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
+located at a fixed offset within BAR0, is essential for setting up page tables and other critical
+GPU data structures without relying on the GPU's MMU.
+
+Architecture Overview
+=====================
+
+Logically, the PRAMIN aperture mechanism is implemented by the GPU's PBUS (PCIe Bus Controller Unit)
+and provides a CPU-accessible window into VRAM through the PCIe interface::
+
+    +-----------------+    PCIe     +------------------------------+
+    |      CPU        |<----------->|           GPU                |
+    +-----------------+             |                              |
+                                    |  +----------------------+    |
+                                    |  |       PBUS           |    |
+                                    |  |  (Bus Controller)    |    |
+                                    |  |                      |    |
+                                    |  |  +--------------.<------------ (window always starts at
+                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
+                                    |  |  |   Window     |    |    |
+                                    |  |  |   (1MB)      |    |    |
+                                    |  |  +--------------+    |    |
+                                    |  |         |            |    |
+                                    |  +---------|------------+    |
+                                    |            |                 |
+                                    |            v                 |
+                                    |  .----------------------.<------------ (Program PRAMIN to any
+                                    |  |       VRAM           |    |    64KB VRAM physical boundary)
+                                    |  |    (Several GBs)     |    |
+                                    |  |                      |    |
+                                    |  |  FB[0x000000000000]  |    |
+                                    |  |          ...         |    |
+                                    |  |  FB[0x7FFFFFFFFFF]   |    |
+                                    |  +----------------------+    |
+                                    +------------------------------+
+
+PBUS (PCIe Bus Controller) among other things is responsible in the GPU for handling MMIO
+accesses to the BAR registers.
+
+PRAMIN Window Operation
+=======================
+
+The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
+the entire VRAM address space using the NV_PBUS_BAR0_WINDOW register.
+
+Window Control Mechanism
+-------------------------
+
+The window position is controlled via the PBUS BAR0_WINDOW register::
+
+    NV_PBUS_BAR0_WINDOW Register
+    +-----+-----+--------------------------------------+
+    |31-26|25-24|           23-0                       |
+    |     |TARG |         BASE_ADDR                    |
+    |     | ET  |        (bits 39:16 of VRAM address)  |
+    +-----+-----+--------------------------------------+
+
+    TARGET field values:
+    - 0x0: VID_MEM (Video Memory / VRAM)
+    - 0x1: SYS_MEM_COHERENT (Coherent system memory)
+    - 0x2: SYS_MEM_NONCOHERENT (Non-coherent system memory)
+
+64KB Alignment Requirement
+---------------------------
+
+The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
+by the BASE_ADDR field representing bits [39:16] of the target address::
+
+    VRAM Address Calculation:
+    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
+    Where:
+    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+    - pramin_offset: 20-bit offset within PRAMIN window [0x00000-0xFFFFF]
+    Example Window Positioning:
+    +---------------------------------------------------------+
+    |                    VRAM Space                           |
+    |                                                         |
+    |  0x000000000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x0000FFFFF  +-----------------+                       |
+    |                                                         |
+    |       |              ^                                  |
+    |       |              | Window can slide                 |
+    |       v              | to any 64KB boundary             |
+    |                                                         |
+    |  0x123400000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x1234FFFFF  +-----------------+                       |
+    |                                                         |
+    |                       ...                               |
+    |                                                         |
+    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x7FFFFFFFF  +-----------------+                       |
+    +---------------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 46302daace34..e77d3ee336a4 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -33,3 +33,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/fwsec
    core/falcon
    core/msgq
+   core/pramin
-- 
2.34.1

