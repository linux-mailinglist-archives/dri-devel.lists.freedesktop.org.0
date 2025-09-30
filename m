Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4561BAD001
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0C10E5A8;
	Tue, 30 Sep 2025 13:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W8HsNy3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09B410E562;
 Tue, 30 Sep 2025 13:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM8VfXy3aCAHTn8+n7Fr0yFZkYuDUO+ywL9sSXAOz12bUHT2OkMloesqcM/fxgYyJ76ppJ5ITLXNxkvN5XWM0/t6z5rVkLtKyxpQteiG2OZITCopU8g1b7gn6gPi7LG5FM/QRFswWhz0fGTfd5lKDM3vk8jyWfDCqzRUtzTnTrp0AJz+NTj+pcbKL+XJnOQzQawJx+O+uR8LMMeIcxrS9XZrEAsz+gq+g40OiOWePP3YpnKmOQeN5nANwf79B2Sh5sfpQsb9PMj013khZVzebHPSnrnkFIylbDNW3PC9R2JjsE261KKa4SIlAkWU8+EGR141iQmPFP65k9cWzTjk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnZgI/BBwK556n5+NPA2ROEslNmtawNc9cRHCSQ05Ag=;
 b=D4xYGg78wbFCy1+/mVHcSZM9O+DmGd11EiFTCSq+ozSGYjS1uPOye5U2brLWaAu3lI6SxuUCqqWX1FREZzsTBf7LHBWSQvXAwgisfUeJUMM46+LrNcUMJdbKyhKBGDWXgqQGYkFpT4qMeuKB9IpVwXlXfZJVjnHXawysK7lLwglMkfYvuFBHoX0WBhhbhQgzfGmdGIbicb5NWp6d0Gq1hkel5ckLh8TRynABuBJYzByfBmah/+sTS5KpBCCDx/TxLALHJaaqopCdyK8zySWkMc9p/JX318X/aUCyJJ2VofDuSU1nRkZ6axXiAtT6UBx+icJhq2Af22SZn/wMmUuWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnZgI/BBwK556n5+NPA2ROEslNmtawNc9cRHCSQ05Ag=;
 b=W8HsNy3x71G9BVG/MQVWiGsHtPxHN8TKjx1h0uk4X+fXcoEkLeSOykCwQfixM03fiQEGAuy7KBwbsr2mQHZBHfRawewnBCCuwUiy0huhez6VHFxZJN5p+P564C/Sewgm41vN5NGkK/vXWxNaF4d1gDE/m+XuKR2eyVouY0A6lsXeMsDIMgrb3PYfbJbnLP4fmuFnkg5BiUO4BzqxDHcaqVrP9t38M2bs7ojG/oIf+GZm6HagmaeRtAq0v5p/2jm65I5rLQi7AF3tobSa0YFiX7qGJZnQSJMQ0QaKupXWhAjiEj0D0Aobz5qmLr4JLOHDlxCYBh0apaA/wYWdOr448Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:01 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:01 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 01/13] gpu: nova-core: Set correct DMA mask
Date: Tue, 30 Sep 2025 23:16:34 +1000
Message-ID: <20250930131648.411720-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0209.ausprd01.prod.outlook.com
 (2603:10c6:10:16::29) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a99f321-96a1-48f7-c748-08de0023a3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eS8jDXp/+1K+5LsF5IIGTkHj/plJdUzJ2v5W4zg2RpGPFqjwhIJwGMg7Fxwl?=
 =?us-ascii?Q?A4vfq+aW1YmdIcH/ZJmAiE1hqsejkhxekmoPh65VQwwyzMKVsX0xFpvyiB+j?=
 =?us-ascii?Q?NkVhgTR5iKZ78NpVAKnR1pYgPkX5UMPNhMQRs5GqQd+LR18jRnuMgPlHVCOP?=
 =?us-ascii?Q?LO22uhoXji0S+WFtwxvD0ZUJhVu9Tt43WSMvDOxFfzBrujQh0x9P5gayvxjU?=
 =?us-ascii?Q?cjGQFxOyY3rqUtDvmue4aWeD8ck3ofCoWc9mH+qACRT2Bq50MWOACufh3ukS?=
 =?us-ascii?Q?5gEdeFIEMtX0LxHi9YvCiCD+Nt72jS4JlYj7Ud742w2KBJRuH76aPQCmyKzW?=
 =?us-ascii?Q?8vjIZkhHerm1Szk9FkDZFEXfU/WVZRbE8QRT++wXJKi40XtpVaVcBUvy43Nf?=
 =?us-ascii?Q?9Mz2fAO6ZkUE3FZE688DtZDv/bde36opMG77qiPYq8bPZl/hgWWjrWrSb/bg?=
 =?us-ascii?Q?Gg+7LHRyCY/STRhw4YKk2F+f8wW6OC5e9VAtBWgAyNdOxJcPWPEqYIhNSaGH?=
 =?us-ascii?Q?eG8POVGkgyuSR7vPNF87A5iKirJ8Ic6o6GLpbz1utDeN/Iakyhjg1VQsA9m2?=
 =?us-ascii?Q?iucMzOi/CvG/ER0kbVlKRYZu0SwsWbFXBED1du1OaWXmkJkScVic3R3T1FMD?=
 =?us-ascii?Q?akNSyB1NPkwFqrcBlk0vkLULK2MirFtpi+ms9gJY+M91+HVTvcopkoYlaI0D?=
 =?us-ascii?Q?rSe5wx4iHZo0TdAZ8PTrqB6CVU10q87zbLyKmdgVLHB6YRTh0AILzUkXcptP?=
 =?us-ascii?Q?DlRjxHZnOnKTRPPwKWEcbY6HFTQ3RHWEzn15JOrMaI39S46N+ThYRs25SKMa?=
 =?us-ascii?Q?Fes94+GhSGg75Qhh7OTD0ifolNe/OghyQRUs9AbJZg7x+NqUD80FJ+wb+e/m?=
 =?us-ascii?Q?Lfnu/tkXyJ1KWA0TT3kpt6k79i0cz8l/eURTJzsjggzz8gEO/K8LAWX1M20F?=
 =?us-ascii?Q?D6w9sAnMdd7KR6nM5sXYgQjguRyAqY3RscBU7ozwbLoaT2MJjBQihEwf3NZv?=
 =?us-ascii?Q?XfNQTnwxsK5Nv1M6bu0hxzXlCJ9rcjNY0eu0iju12R2FurUSE61Xhrnt5j21?=
 =?us-ascii?Q?2YG82fxWVW4wDMvFQ0LnCWM2VtHCmCVqTpOW87YB2NieRqH94rq+IqQ6K7ks?=
 =?us-ascii?Q?F6/HppeIwtK8MPNTByvl1xqGs/XvBQKJtDQL+nAq8MlZjRL4XbXXF+Mw5FvD?=
 =?us-ascii?Q?SQet+OigkGOTm0V3opkx/knY1jEdW9YQfxKfxzw6cpcp+4hfY/sMxhL92r3O?=
 =?us-ascii?Q?ZT7H+qfTn/RNYUllkR54GWJmZMPPzIVTfL74iXHMLNlUYVjOul32KnCM2E6D?=
 =?us-ascii?Q?HZYQnprt9uQzc0eYrY0i/JGWmZSkxUsxbUkkcA5hWcqTmwO3zjl47jXOk3lI?=
 =?us-ascii?Q?AG444NUMp3gnp6ZlKjJazjkUhTCLLFAt27kGe/qNKqXymDye2OOj6ketpFOX?=
 =?us-ascii?Q?jJEyFDBQjApNoYWcIL1hjXxI9MRVWRPN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1fD87H/8nefIi+n2ho21ufiXLkK2vJcuoSOFZgkw+lyVKTWNysOOXu3wQ97U?=
 =?us-ascii?Q?JC3m6RFAkufsTdNIQMv6M60ZLJfD9ebs9mQlyjGl6T3WCViecu7du3xqz5Yj?=
 =?us-ascii?Q?71BdNundNgERxB6XYtZAtXeI0pzaYYCYkEMP2VkY+w7NOYVHnHrYvq+RoYnH?=
 =?us-ascii?Q?6sVOyN040kie4H59TIoaKS8ze8shy7rfVpBXv2epfenb7vWOIsRMOgrme1Ds?=
 =?us-ascii?Q?E+WL74MDKgBMOewArAXodeeKn9//Bi/RNbi/5Bca5biGZ/kiZ7aAdw3k7jh0?=
 =?us-ascii?Q?0uqI7a3+s7VETM71yJ14p7P+WsIflcJYSLkx1OyfqwAM4NJ0vroFu86RrytM?=
 =?us-ascii?Q?KYlBPOrnd+z4osu4KAw4GSA1pEvZi3B42n3eDsMQi5na4E1ZAsX7//Hgas7N?=
 =?us-ascii?Q?0semvqHqtuOnPNfQuD1cBDRjKx2wlaFhgMer9Rd9PTQQuyD50e4KFQ2CGmjT?=
 =?us-ascii?Q?aYa8LgkMAR8NCLMh9emYodo5o3sF65awXPsKAOst9CYLXQ/lGlEns3AxDpuS?=
 =?us-ascii?Q?0Ob4NV9oXTWNCN+jUDzkGbA2F7CHsvyXRZemJEgHpsUqmwBtxMVaLxG5KkHo?=
 =?us-ascii?Q?ICacsil50v5lISzU13OcBngf1y9LS7+5hELx4gjfmftn0BjRxpbAR5JSQDDW?=
 =?us-ascii?Q?lDVpZiIozGTWIwuW/lRYWoxx87Am7AQ3RmaJKBJkg0WjewY8KB3dylIzUL+j?=
 =?us-ascii?Q?Eqg591bwBgWReGu1AkhtIGifeJIaGfY3g+Q3FxTCXAiBZBicNBKuhY5W2VdK?=
 =?us-ascii?Q?efs1oIQjj5Eh4IYmAClKz9NuXao65YO1/885cp+o437+DRR/Kj2KZXiN1sFB?=
 =?us-ascii?Q?loybP3YdRWqizy2LEOlf2/XInjMtwzwH34Kk/fkCbFVYMPh+mOo7SyKAgLFD?=
 =?us-ascii?Q?sIUuENpI7e0vGkf7hn4EW3NRq649DGRtqjmjL+C3HQx0rkGcWPWVWOzvdGK5?=
 =?us-ascii?Q?lNX/AQGVwJ8/9YSxEMaImuW8fIScvWxPAgGMXdr/vosi+y9hsCgE0NoTcU3c?=
 =?us-ascii?Q?RdsRQAIrYiTiaHYpaCTncuB8NH2SLC0jl3C8uhz+Vqh2Aw5tDb82oFijZ4EL?=
 =?us-ascii?Q?y7XjC5CjTaWFfASnM4W0Aoetk/gY7SQWjpYqVu24iRGny6LtUAfxW1TrY/7A?=
 =?us-ascii?Q?8S6WkEwWwhBON98JvZdR7QLdppg0Gl47MImgTkW6JGB3TL650k1f1RuyR5v3?=
 =?us-ascii?Q?u/J+M0MgGfQq4IRiHWGhE0Sdrba5DsgmSz3ixWG3mK48vhqSsg2Io1TBQTtX?=
 =?us-ascii?Q?FgFuI2i5cMRUM4ZOA1u0ynk2ztsM6vb/M422bxe93PUXEu39gKX5pbGcYf/A?=
 =?us-ascii?Q?1kT/cOUJwd5JIe9KxeEWVI6eSJH8f8eOuPdI9j7xK+Jtb82YO9ECA7fc3EQh?=
 =?us-ascii?Q?U7SrRkKUXC7DfYguXwTIkMxjxiFSIJ7p7K/vtETv+FbfxEtrxhDmET8IUo+/?=
 =?us-ascii?Q?OMZ5Rv8bFpkZLvlxvQ/cx32IrteOYgqN5lloPVNCBV88kmK8HweL7VkCa+96?=
 =?us-ascii?Q?JjBAMJlAw+iVa3ujDQMGNObhssmtLbLMBKaw+3M7yq0ke6Qpvjt2w3zVFl3o?=
 =?us-ascii?Q?SDZn3FgpZyn8L7VabZqARzN/boBpnET/HWoHENnp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a99f321-96a1-48f7-c748-08de0023a3db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:00.8930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8acGT6LKRiij3lq97u+/gSpsxSn3k/N3eiRL+x66UYIlokbX7fcS0qDCiPi0au1NYhUSP9y3Me+1LDFrVonng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:

 - Update DMA mask to correct value for Ampere/Turing (47 bits)
---
 drivers/gpu/nova-core/driver.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 1380b47617f7..ccc97340206e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
+use kernel::{
+    auxiliary, bindings, c_str, device::Core, dma::Device, dma::DmaMask, pci, prelude::*,
+    sizes::SZ_16M, sync::Arc,
+};
 
 use crate::gpu::Gpu;
 
@@ -34,6 +37,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No DMA allocations have been made yet
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
-- 
2.50.1

