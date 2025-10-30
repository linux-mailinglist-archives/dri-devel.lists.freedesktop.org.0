Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763AC21DB2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BFF10EA0F;
	Thu, 30 Oct 2025 19:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P8A3s7eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395F10EA0C;
 Thu, 30 Oct 2025 19:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hji1yRKfflvoFTWM50j6ajfn5hS10VmiMMglf5pn1qGoDlWEV5bJjFDkdtdUNv0qyUqBBYjUM54rexLj6UWtD/yQqDphKSqRJ2IaEVEMFMi6rUdCoH0cy52v1FYjGP2flTMx8EFjC3LDZaXJQ/TptXRbdrwYAvUNWiLLULs6ykL2yaeALj/zlQ6amrH4PLfacy3Lym+wbwN2y9rZOIp4QVqiXNDJBTKnVcLOB+1NsQYf2fbwv3hWo5gHiqxScAf7B4dDkvtn4wJGJy63CKruzK3WnnbW/ITzLNKhVcuvdJDH1N9uGUqcS6sHNgR8f7H0igEfEFVs4TvX90xDNYNdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M20FBJnvcmSsWDiO/hP1LroGcCpoKGyXqgZEe7BZYxs=;
 b=lybtddx6XGafwfm4j8ACD43RemXpDvkS6WOHUDuiEAJ4nCEt4mBU6MsqnNY7ABWbrdH+sgucVIDC+e0p+FpX1fpiOgslB3O2WtvtjplrGNLSezuxjaZ4jucOmxolKJZOV6Sa8yzKhcXFRdYqq4aOwMf8wNWqkviSQD+9zuXxs+q1QdB+qtdSuaHDSP1BkkEkken26ZrHrXX2FrIw9fO4DOvLpixiepsOxsqeWBbNtP7YYnDHH6q0Pm0oV3O9JsfTdfhrx+19XQJq/RyfApGsm2GuGv/1mFcRZHf+W3TyuuN59ayTjw2JjzvbUrqAtNexOfZzg3FxljQC6git8P5tDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M20FBJnvcmSsWDiO/hP1LroGcCpoKGyXqgZEe7BZYxs=;
 b=P8A3s7eFB3URrESuv8OkGfJ9aqpzGwWUPL5H5f3l5+22kONPcsAxwJt1JAL49Pe0KaB2xPt5YEL/8/uqbudQyHjcu9tcy5McigVQUmYAN9Z9MBDyuoK29tRMEgnt1CJORlp4dHLZggVlfxMlUZMxXlvRTjtfuw875X/N6SH3FelrXISL+y/tGSKZ8tQgFM6a99MAAfmFGKXSTlb+GbUtt4Fpuwt/5BUxahG1ZpIe//9ZKtfEL9JMOhoCEsUP8x+FX/lIVv6MmTUzDTk8F3cdZMexbs+gXA5gfjGdl9+Awm44Fgrpaku2d8qyRh2b9pYn+tfQ+WA0vNE7fCZLAt7lqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 19:06:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 19:06:25 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 David Airlie <airlied@gmail.com>
Cc: acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
Subject: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
Date: Thu, 30 Oct 2025 15:06:10 -0400
Message-Id: <20251030190613.1224287-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030190613.1224287-1-joelagnelf@nvidia.com>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0600.namprd03.prod.outlook.com
 (2603:10b6:408:10d::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af55669-329c-4741-e0c1-08de17e76c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?islQ4wSWQ/VkZaGKxWqYAdyTP/Z7csUJsCLSSJbhL2JSexkkmRrkw1lJZFHm?=
 =?us-ascii?Q?VyLy05Nb8hmyPqBuVNYGL1tnV1ACTLmPFm+jgbGNUEzTafhzcGjg6xZRUdij?=
 =?us-ascii?Q?8e5koBdFEuqV+kINKVpnuYItCdB+nh0D0Akynk5gLRwncj26ix1gyBPWHoAR?=
 =?us-ascii?Q?cxNTaeoNN4fi6Etn6HsgNUNlu+BTZI7zeWCM02H74NPSDVb6AmfmJvYHJLgj?=
 =?us-ascii?Q?K+a9gHGHE/clJ/DlcOxH5xy5BqKY1yxCaakiVMtJtdKJJheiesjIycsppUTo?=
 =?us-ascii?Q?l00oiZgmt7rFQugxXtq96dVnDZHmsyKvDwQVeYoPeagG+aT7GaJSMfGlB9qI?=
 =?us-ascii?Q?oLjCmecqFpX38CCvYw3DQYLM/uab1cmognzb32hdA3W0DyJycvxyS0fiLTfb?=
 =?us-ascii?Q?B1T3YUsfDO8VazIi0Xm/eMMZ5+jK1oskgOO0KlUk8wNi0bGT+VLRg02opUdK?=
 =?us-ascii?Q?fIGvFyH4siTPkFGoDF5ZqMhkOJSxSMcnnCLM4x+FJNvGVlyepVdzUj7RhGKm?=
 =?us-ascii?Q?co9BwYFnsjbBXN0OdPxfNuM8jSkS2OABDpnBkEc9CS+AFOFTLJ60PxIAJ0Zc?=
 =?us-ascii?Q?oA0TVBHsliRilQJLYBxl2KG22/OV/gvpiiRBCeT8u1eMCo+rTsWNeQCUhb8V?=
 =?us-ascii?Q?5rgGA6HtPUmTUJJl6k//QDih6tg1WICgjEStL8R5YO8DSEUhUuCKF46wKfOS?=
 =?us-ascii?Q?mB66ijF4ofZsIqqmdx+9bxowu5XLrjnYOEc7A8zgE92ksTHDZDNzkvVnYF1N?=
 =?us-ascii?Q?sX4SrC7n4HHBQtzeZBzuNrvGMxxErnrhqG/t3Awu50Jhz/YgAg2A79u5VWVP?=
 =?us-ascii?Q?tHAIYcx98/LeLS0xghehfBCxLp1k7Lc9NdCEirC3m8npslkgYW1ro48c+3E1?=
 =?us-ascii?Q?iLgnC60hZb631/qczKpxjaxjq108iDYbqLCn+A8gO1KNnaX0Xb9NCcAeWfz1?=
 =?us-ascii?Q?OjvG6LCjpL6SR4qbw7VwbHOcvqzb3ZcW5sdHzsLYStyUfwfLp1bMg3zrN5Ms?=
 =?us-ascii?Q?k1G1JWjCbVPueES4u5jicJa8qAugvH0g7krQF6eKUFAulDFHIxCgovpGVCMf?=
 =?us-ascii?Q?y/c8PEo7WHEJGqL7N5MZm9bMIJH7O7cYGO84o5dJMGD9VlG8TRQXbtl9eFfL?=
 =?us-ascii?Q?Thq7Q+OHRSqWwONf/7mCQ2hLhpN+LA9b85nGTxnwHjuol2KdR9QOnnG/NKGE?=
 =?us-ascii?Q?KGg7i6bqghIfT2TQ2fOGIryEy1YvWadzbPOfBiG+3f63aXqvB9VW4og+/ek2?=
 =?us-ascii?Q?0vKrPeblB2M18bezq7dAnZFWer4IC/3BmAj1e1lSMSKCwCflF0bIK6izsEaO?=
 =?us-ascii?Q?IGvEm8Y9skbPXkpROdhjWu4dd+2FNPExSen00en5Vzk4eL+hVK7mlrVeCMIJ?=
 =?us-ascii?Q?bDL+VS58Bg6/ZBSLUpBHxNsPXlItbAN0QKUwP/7YN4tWo3ySpsUvPj0cJzDz?=
 =?us-ascii?Q?kDPQhgNXIdkjxF6r6cEN0cg5hwS8yvH6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ahRjXoVKhbhGcq/DWNfJuzXGNipFOw2mKtRPG7nGFX+Pw7ybKJDi+UyY5gr?=
 =?us-ascii?Q?VGnoQVhE/eneHCHpuLx8ae32QZDfJlltHDG7iopBnf+OWOlXmK5XuW5qRoox?=
 =?us-ascii?Q?wIbELnTJx5x2he/zdHn8Y9nvrFTAwY2F9R6ORsXCwA0i1qvMqo3VpVPeqhXw?=
 =?us-ascii?Q?rBh2aIucKzf/BKr/5D/yCfGUJhgjgapq0GKKhsgirpQLjmp7k+adrU8ZGXbD?=
 =?us-ascii?Q?Ryz3xj0XW0n8HAq3P74E1DYq9tIjwmTOYm/7deagdrItojXt2LwBUq/L+UHW?=
 =?us-ascii?Q?25/7JlqQqhEP6NDk8gxElhb/0R9i4WDZtHpal4Bqp3H2cX6Zvu//KFcIt0va?=
 =?us-ascii?Q?pPcvFQ/LZO8uoz6LkuwrobxX2YE6o7YOdtQpyFoSioSgG7XSWe70nYMz3y5r?=
 =?us-ascii?Q?ZL6EZN7KdlAWylSAqdTDzms8X085jeVuyTc+nwsnERBwU8Hbe9ypwvtYymBI?=
 =?us-ascii?Q?W0///kF8yRzjIDqzStR+Yz9qVxzZIkKbw5VvnAAhuvCzGBThRH4Xb96adEYz?=
 =?us-ascii?Q?s2/mVWXzszqASF7PHshYmYXIBJjBVcXNJqn7+SsqWk3c+HJ8TcweZsqHpsoc?=
 =?us-ascii?Q?axziANQ2dB8LV/QSWadCTgst8APxopZzPVdp7CJB9Vz5U59PM0UbhidYb+yc?=
 =?us-ascii?Q?F+q6wAQIzn+S5M5DIUrtAbsNcvf2vlGcE1004TwPj86q3CgrfZZhAb//QXHz?=
 =?us-ascii?Q?z/Nfb1OyMU9O9YbArtF9FAELEPI3OVxwrqpd/1TIZWz5dqTz+5BBpGV8c1Ne?=
 =?us-ascii?Q?zsPaFYW4Nd+0r14DK4EFAqacaef/GQDVn1hPydjBG+J5M/HV6lfS8/V7oi5Y?=
 =?us-ascii?Q?sbNo02xBq8kQVIC1KApZGLoKFoVOl9JEXHo4w+9cKqYGzuHLALWsP75wEYAs?=
 =?us-ascii?Q?CKmCNOfLUBJCrXzCx1NLnya4uOl1Hiy/UjR+ysqppfTv+kjMFy8uKyOhHRiL?=
 =?us-ascii?Q?BjLX9IL8efb0lsBGKjLMPUAxs2WfnSA0Q0yF6jdDNNSHFDUNy0Ua/etQNxHc?=
 =?us-ascii?Q?THGP7FVA4o3FHm9MXsYPqnu4EZOj1D5mA1LXLQYNP4SUxKZJqCvoqzm1za/A?=
 =?us-ascii?Q?dMUgFwFVKwHgU4TEBbm/1q5voUGvcO0zkeJKQ8Y3odeRRb3Wn6BGuVG/1t1u?=
 =?us-ascii?Q?60zXs5Lwpt2fHCTLSXr4ePzr5KBLqrAxxTwXSw5bwOvF0fMJ/zYIet6KnEtJ?=
 =?us-ascii?Q?ho4xPC3ObBFDiTcX5YQsPzPPRcd07rjrdCxp3lqhns2HzKaRLE4Z1MpONTCT?=
 =?us-ascii?Q?kxENXfFxwgKmG/R1PuQHaR12m3b9FqCZEuAVPpOas72UGYNmCNTvwQGfY9ov?=
 =?us-ascii?Q?CHgGMDKyeDGFzB5Dc/MR4THavBPHAyrEFKq/VXqRfWi/5Cothjd1DBUUAkaA?=
 =?us-ascii?Q?PFknG7vTvi9/eka99mIzcz4tjnrUXLdo3N7Sgnh5gL0wpAPJdN9k1aTugnTm?=
 =?us-ascii?Q?KaiqUGb85G4zmYlIJp+slAZ1+SI8k7VxEAsutgTqM7J+lqMeerMUtKlUA8iv?=
 =?us-ascii?Q?3rsd5TLDtxE5EB6eE2kprzRwRyw8AHmO/8QCCkZPlVAvwLffpwcBySs14CUK?=
 =?us-ascii?Q?ZMDUhks7z7Msl9/ea5Xa28dt4ryu2IdxQJxrov0s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af55669-329c-4741-e0c1-08de17e76c61
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:06:25.8170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWrhZROS1/TsOTyUKQK2jIvDJFHF8VZsjgDdJu23yO4EzpHMwWN+TIxfApXPEN4eiFvYyNMy7/rn1iFRBZhMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
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

Provides a safe interface for iterating over C's intrusive
linked lists (`list_head` structures). At the moment, supports
only read-only iteration. DRM Buddy bindings will use this to
iterate over DRM buddy blocks allocated in a linked list.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  28 ++++
 rust/kernel/clist.rs   | 296 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 4 files changed, 326 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..634fa2386bbb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..74e8f40b7141
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/list.h>
+
+bool rust_helper_list_empty(const struct list_head *head)
+{
+	return list_empty(head);
+}
+
+void rust_helper_list_del(struct list_head *entry)
+{
+	list_del(entry);
+}
+
+void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+void rust_helper_list_add(struct list_head *new, struct list_head *head)
+{
+	list_add(new, head);
+}
+
+void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..e6a46974b1ba
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! List processing module for C list_head linked lists.
+//!
+//! C header: [`include/linux/list.h`](srctree/include/linux/list.h)
+//!
+//! Provides a safe interface for iterating over C's intrusive `list_head` structures.
+//! At the moment, supports only read-only iteration.
+//!
+//! # Examples
+//!
+//! ```ignore
+//! use core::ptr::NonNull;
+//! use kernel::{
+//!     bindings,
+//!     clist,
+//!     container_of,
+//!     prelude::*, //
+//! };
+//!
+//! // Example C-side struct (typically from C bindings):
+//! // struct c_item {
+//! //     u64 offset;
+//! //     struct list_head link;
+//! //     /* ... other fields ... */
+//! // };
+//!
+//! // Rust-side struct to hold pointer to C-side struct.
+//! struct Item {
+//!     ptr: NonNull<bindings::c_item>,
+//! }
+//!
+//! impl clist::FromListHead for Item {
+//!     unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
+//!         let item_ptr = container_of!(link, bindings::c_item, link) as *mut _;
+//!         Item { ptr: NonNull::new_unchecked(item_ptr) }
+//!     }
+//! }
+//!
+//! impl Item {
+//!     fn offset(&self) -> u64 {
+//!         unsafe { (*self.ptr.as_ptr()).offset }
+//!     }
+//! }
+//!
+//! // Get the list head from C code.
+//! let c_list_head = unsafe { bindings::get_item_list() };
+//!
+//! // Rust wraps and iterates over the list.
+//! let list = unsafe { clist::Clist::<Item>::new(c_list_head) };
+//!
+//! // Check if empty.
+//! if list.is_empty() {
+//!     pr_info!("List is empty\n");
+//! }
+//!
+//! // Iterate over items.
+//! for item in list.iter() {
+//!     pr_info!("Item offset: {}\n", item.offset());
+//! }
+//! ```
+
+use crate::bindings;
+use core::marker::PhantomData;
+
+/// Trait for types that can be constructed from a C list_head pointer.
+///
+/// This typically encapsulates `container_of` logic, allowing iterators to
+/// work with high-level types without knowing about C struct layout details.
+///
+/// # Safety
+///
+/// Implementors must ensure that `from_list_head` correctly converts the
+/// `list_head` pointer to the containing struct pointer using proper offset
+/// calculations (typically via container_of! macro).
+///
+/// # Examples
+///
+/// ```ignore
+/// impl FromListHead for MyItem {
+///     unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
+///         let item_ptr = container_of!(link, bindings::my_c_struct, link_field) as *mut _;
+///         MyItem { ptr: NonNull::new_unchecked(item_ptr) }
+///     }
+/// }
+/// ```
+pub trait FromListHead: Sized {
+    /// Create instance from list_head pointer embedded in containing struct.
+    ///
+    /// # Safety
+    ///
+    /// Caller must ensure `link` points to a valid list_head embedded in the
+    /// containing struct, and that the containing struct is valid for the
+    /// lifetime of the returned instance.
+    unsafe fn from_list_head(link: *const bindings::list_head) -> Self;
+}
+
+/// Iterator over C list items.
+///
+/// Uses the [`FromListHead`] trait to convert list_head pointers to
+/// Rust types and iterate over them.
+///
+/// # Invariants
+/// - `head` points to a valid, initialized list_head.
+/// - `current` points to a valid node in the list.
+/// - The list is not modified during iteration.
+///
+/// # Examples
+///
+/// ```ignore
+/// // Iterate over blocks in a C list_head
+/// for block in clist::iter_list_head::<Block>(&list_head) {
+///     // Process block
+/// }
+/// ```
+pub struct ClistIter<'a, T: FromListHead> {
+    current: *const bindings::list_head,
+    head: *const bindings::list_head,
+    _phantom: PhantomData<&'a T>,
+}
+
+// SAFETY: Safe to send iterator if T is Send.
+unsafe impl<'a, T: FromListHead + Send> Send for ClistIter<'a, T> {}
+
+impl<'a, T: FromListHead> Iterator for ClistIter<'a, T> {
+    type Item = T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // SAFETY: Pointers are valid per the type's invariants. The list
+        // structure is valid and we traverse according to kernel list semantics.
+        unsafe {
+            self.current = (*self.current).next;
+
+            if self.current == self.head {
+                return None;
+            }
+
+            // Use the trait to convert list_head to T.
+            Some(T::from_list_head(self.current))
+        }
+    }
+}
+
+/// Create a read-only iterator over a C list_head.
+///
+/// This is a convenience function for creating iterators directly
+/// from a list_head reference.
+///
+/// # Safety
+///
+/// Caller must ensure:
+/// - `head` is a valid, initialized list_head.
+/// - All items in the list are valid instances that can be converted via [`FromListHead`].
+/// - The list is not modified during iteration.
+///
+/// # Examples
+///
+/// ```ignore
+/// // Iterate over items in a C list.
+/// for item in clist::iter_list_head::<Item>(&c_list_head) {
+///     // Process item
+/// }
+/// ```
+pub fn iter_list_head<'a, T: FromListHead>(head: &'a bindings::list_head) -> ClistIter<'a, T> {
+    ClistIter {
+        current: head as *const _,
+        head: head as *const _,
+        _phantom: PhantomData,
+    }
+}
+
+/// Check if a C list is empty.
+///
+/// # Safety
+///
+/// Caller must ensure `head` points to a valid, initialized list_head.
+#[inline]
+pub unsafe fn list_empty(head: *const bindings::list_head) -> bool {
+    // SAFETY: Caller ensures head is valid and initialized.
+    unsafe { bindings::list_empty(head) }
+}
+
+/// Initialize a C list_head to an empty list.
+///
+/// # Safety
+///
+/// Caller must ensure `head` points to valid memory for a list_head.
+#[inline]
+pub unsafe fn init_list_head(head: *mut bindings::list_head) {
+    // SAFETY: Caller ensures head points to valid memory for a list_head.
+    unsafe { bindings::INIT_LIST_HEAD(head) }
+}
+
+/// An interface to C list_head structures.
+///
+/// This provides an iterator-based interface for traversing C's intrusive
+/// linked lists. Items must implement the [`FromListHead`] trait.
+///
+/// Designed for iterating over lists created and managed by C code (e.g.,
+/// drm_buddy block lists). [`Clist`] does not own the `list_head` or the items.
+/// It's a non-owning view for iteration.
+///
+/// # Invariants
+/// - `head` points to a valid, initialized list_head.
+/// - All items in the list are valid instances of `T`.
+/// - The list is not modified while iterating.
+///
+/// # Thread Safety
+/// [`Clist`] can have its ownership transferred between threads ([`Send`]) if `T: Send`.
+/// But its never [`Sync`] - concurrent Rust threads with `&Clist` could call C FFI unsafely.
+/// For concurrent access, wrap in a `Mutex` or other synchronization primitive.
+///
+/// # Examples
+///
+/// ```ignore
+/// use kernel::clist::Clist;
+///
+/// // C code provides the populated list_head.
+/// let list = unsafe { Clist::<Item>::new(c_list_head) };
+///
+/// // Iterate over items.
+/// for item in list.iter() {
+///     // Process item.
+/// }
+/// ```
+pub struct Clist<T: FromListHead> {
+    head: *mut bindings::list_head,
+    _phantom: PhantomData<T>,
+}
+
+// SAFETY: Safe to send Clist if T is Send (pointer moves, C data stays in place).
+unsafe impl<T: FromListHead + Send> Send for Clist<T> {}
+
+impl<T: FromListHead> Clist<T> {
+    /// Wrap an existing C list_head pointer without taking ownership.
+    ///
+    /// # Safety
+    ///
+    /// Caller must ensure:
+    /// - `head` points to a valid, initialized list_head.
+    /// - `head` remains valid for the lifetime of the returned [`Clist`].
+    /// - The list is not modified by C code while [`Clist`] exists. Caller must
+    ///   implement mutual exclusion algorithms if required, to coordinate with C.
+    /// - Caller is responsible for requesting or working with C to free `head` if needed.
+    pub unsafe fn new(head: *mut bindings::list_head) -> Self {
+        // SAFETY: Caller ensures head is valid and initialized
+        Self {
+            head,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Check if the list is empty.
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// let list = Clist::<Block>::new()?;
+    /// assert!(list.is_empty());
+    /// ```
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        // SAFETY: self.head points to valid list_head per invariant.
+        unsafe { list_empty(self.head) }
+    }
+
+    /// Iterate over items in the list.
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// for item in list.iter() {
+    ///     // Process item
+    /// }
+    /// ```
+    pub fn iter(&self) -> ClistIter<'_, T> {
+        // SAFETY: self.head points to valid list_head per invariant.
+        unsafe { iter_list_head::<T>(&*self.head) }
+    }
+
+    /// Get the raw list_head pointer.
+    ///
+    /// This is useful when interfacing with C APIs that need the list_head pointer.
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.head
+    }
+}
+
+impl<'a, T: FromListHead> IntoIterator for &'a Clist<T> {
+    type Item = T;
+    type IntoIter = ClistIter<'a, T>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter()
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c2eea9a2a345..b69cc5ed3b59 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -72,6 +72,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

