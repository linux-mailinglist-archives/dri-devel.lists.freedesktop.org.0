Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1CC21DB3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE54510E2C2;
	Thu, 30 Oct 2025 19:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s85n3Gbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C8D10EA0C;
 Thu, 30 Oct 2025 19:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohzp7t+3h/o/bCC/Uk0WTNNDH5H5/3+Dk8NvZ4yDqM8UxvjhVWkNlxIZuYbflLpgVB5QD0lYrbAAt67tyKL2f+M1Ys7m/xmCGNKCEY9Ej4Btt8sanG20QADCRDwxoLUwqqLiyPTn0OQld2Wi6YImPK5AX+S/IeugaAzXltNV4QZwrXzGQSm5RJVsR+LcZXtxkF5Mx1siv+5R4iM5RN9o7bZcbu27EfE/5GBuoGdTW5TScFOLCoxmLzrjmjDkPnELyJjT8MMVDOI7Sxbe593UBMi1kvZq3Dzl+l5uEJLqqgIRaZd4v5Rm9ml8B/iegbwovSWikk6fBO54hbFwrG8MCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKodteNH7w/qQblXa9jTro7UQUGCsxy1AI+CLyMuW4A=;
 b=pl3RqkK3qLIZELZ+KQGLNFmHPaYGoKm+3En+i4BkDTWRf2+7iKAu0rmrcGuZRIN9kJcnyri9QA+Yz7ar9NklcMirHq6x6p6QH727WDjQiyI6RH1jzY8Etu7OG1Uygz+Vk+66MfNVFHYRX59fLzJUzS9vlLGYU1xURVIHDHjpC1hztpCyyNqwzrlWx4g8vy790pj4q7YMCdxklKqVd8FxNl1eNr61sM29rL2kq6I3gS2JqTyRL2QuwQUeH8I1E5H2G/n8qNXUK/6JGLsqT1lP3VJV+osOmFUNVOEQvZN8YfKDeoFkQIXIRrEA/WlUBPPzG35iK0bkgfq9kEgW6LmeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKodteNH7w/qQblXa9jTro7UQUGCsxy1AI+CLyMuW4A=;
 b=s85n3GbbtetQbxGQHY8fSiBVIrr+YdPVIYHI71p997othE7L1ma8rbsceUKQuxWD5+YllHwhFakj3j+jQk6yXggKh/T0x6A6DcnIEnpQhrtOUEmcnEZL2qk0GEBHUkg6BbnTWuOASMbPZxTz2LVSiSq2SnQz3VeaDOiKbeRwzkUVpYXbDq39CDXgGLfNR/hzSHGcmdNiANkWGILRYAlfDSoQQOOVFCkXt6dnqHce9K6bh3vUT8qhLpUBj7dqr4E0xcXzvLITqFryN/gA1L3kEh+j953qtSkgs9yaUeU0taudhQICrQ1vCN45RNLT7Ih/CYs+cY6h2ygs0wDY4doXEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 19:06:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 19:06:32 +0000
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
Subject: [PATCH RFC 4/4] samples: rust: Add sample demonstrating DRM buddy
 allocator
Date: Thu, 30 Oct 2025 15:06:13 -0400
Message-Id: <20251030190613.1224287-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030190613.1224287-1-joelagnelf@nvidia.com>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:408:e5::22) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: 78faeea4-686e-448a-277a-08de17e76f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PYYsZ7fTwjKGwT8lrXONnM3BF3YAmSpYZlZbM0ZsA39W/YkJtPm7tuvARelb?=
 =?us-ascii?Q?+cz+uEd6FiUHVE8vTE8VVhjAmpqNqzmS52MdyFi2g9pvVQqEyEYSGfm64eXe?=
 =?us-ascii?Q?Po3Uw9RpJy785cghCFNtad1mKn/VGRkmxTHUx60v6laYm+FRE02930cayOjT?=
 =?us-ascii?Q?GYDC1EpqlEf668vqk1+pvZE2ZYgFrZDIMaLqImshprSk+8ABpULD4vWygGL9?=
 =?us-ascii?Q?8giakSQSLcr/fOnQ9jS9Uib7yDkqMXLs5qwhJh7dGHfaDkDrAVNor73Aw9nu?=
 =?us-ascii?Q?6x+4ajrtv91nu/qhHsWT4S86j9/VZ9jOkZTu+H9P0ksy1AV3uIvDRtF6AQva?=
 =?us-ascii?Q?7P7gCZhYt//hmHMr0egvOSRmAkTOxBA3o8xDu2WHXb6EFVBlEmtRUpKyllxK?=
 =?us-ascii?Q?iUShaZs30yGLJW56FyExPhRZeEs9c1AYn/bIkrWxbmB1Nt9N8Np3yWF9/vGA?=
 =?us-ascii?Q?34hW5yYrB8G/jmJRgyWdResKbOrdX8nX4NRTTOQ78bK5MTPNsogODAZUxZHi?=
 =?us-ascii?Q?S1y4vlLGaeVw/JqZ3LMuCDz9Gx2LjFjLfUUXFEz07EvxGDTl/wKDBj8Qk8D9?=
 =?us-ascii?Q?ckED9+yLGMK+/tKjYRIwy2r9ygSkl+cDrXm73fjaWHVqsO9DGjfV/qocdTvZ?=
 =?us-ascii?Q?MvMPpu+8GBjKze7o+uBUOMUNv8baEkSf/ltS4xg2IWG15PnF2hNGbfpfFV47?=
 =?us-ascii?Q?uxQaO18i2XXdOtqNi4mI8PoYxmbfU3mQNiuroLIwjAguPzsiNakOY2fr6563?=
 =?us-ascii?Q?AV3gsFDx1LH5HXJtHYbJOT/A7z3bHVG+s86p6tuvqOp9vR1FCjuNPN+zgk4C?=
 =?us-ascii?Q?pyx+2Sj6tyzPSB6p9WU51XvCfYAmWYeQJNIzfHngQIl4wWnPE/4IXAUMum6P?=
 =?us-ascii?Q?o4BlbPSpqilZbWdM13xtVksFgj5uVbixaoCQi0EkQMbuDxj+3dtox8T3pvLp?=
 =?us-ascii?Q?mBsa4yeGVnpWwoXC4eHllIWXaep1QKzdsWOzh6Rkirr7VYedGtrkgOreoRR4?=
 =?us-ascii?Q?wWO9Ccng1hgSOOSYJjj0cwtiokGBd8hCjRW2onLYDEzY97fjTRPTtZOY5hOE?=
 =?us-ascii?Q?NhjAaRJe5L3Sbo5frFv25J/vMb+pvr8oiaoAvrVV46mG+MxYi6Bp9ASrAgxt?=
 =?us-ascii?Q?wFJsrAxYbg8ef03sUIy6SyTtbhYjjzAoazzaX9/OT21MD0P9rmTyrcwf+94O?=
 =?us-ascii?Q?248grmliLei8DBYhSXl9X4Ey8Ee+5FsoCyjiW5OQ+TfzLKyIz3nhKNOmcuti?=
 =?us-ascii?Q?pMO+IPyTo3C5vNUjverhlKqqwwe8wJfAXFglzsj2vsm5TL++NyAHCQOA/Ugk?=
 =?us-ascii?Q?LuOt2EqRfhv+56CAFBnuFP2gseMizHdGbzCyN0ThktzI7hiArS1mrMPz9l7M?=
 =?us-ascii?Q?VA1kj/m+ciIvjuiGWudVQCPPRqzyNkuB8lbnZ4xU2PARNagXFc89rYUxk3R+?=
 =?us-ascii?Q?4eBLOoXIsgTADWNXtNvQS60tDR/kLip8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dmhqgWBt3sv4J2opAbZmw0SxZW9N7J/u6E3JpzneX0fDgZa1yYh6Xxjj2lK4?=
 =?us-ascii?Q?GSpYLC3HrD43C1oxzr+S7UOkPSPKRZmjC2UOgwIRG/YWOoqS7gjqb7Mx+3cH?=
 =?us-ascii?Q?aKr7D3ufApMVrYemWVKAcmGcrbVcH4HEOaDn0K4hRXXnpsFXv1YrBQw41jN5?=
 =?us-ascii?Q?XBEXDS1xb+VbQjrDhuasNmmYqu9o/Iu4ZL7ucIAY8AqVKECfmp9eQqCwR37A?=
 =?us-ascii?Q?N5/6zwrudZI9kz6ctonLDNjQWQt6/oghpDTLADAhHe5t6Ke75M6TqCQYxBkq?=
 =?us-ascii?Q?yd2c48et3iG74edPe2oAePVotWqb3xKekm8ACZUIYLwCZpWqEXiOYMOfnhF6?=
 =?us-ascii?Q?r4sX/8s9opIL8aiPSlyJq4F34V91eB6+VX7eTeUJGwUs2e68RYK3orJwY8PD?=
 =?us-ascii?Q?ZDeZgUUilu18RwM93jYzcNirlVY+AvBxO9uOG6V/P017V7g8wJMjpBsX6ZA9?=
 =?us-ascii?Q?hpP6bwQcJGgvYqFmNtuRbdKSo27fWxl63HLJmDprie2XWywFI02N5R7fKnDB?=
 =?us-ascii?Q?7JaRwxOefTtrc9yHyTVjwEKhcXAVAF8sPS6QOdhcT8I3mpKZnEUVPcifOaIZ?=
 =?us-ascii?Q?indSire/qRnUIHGiHIKrGKfluOa13iQ/oDB39B6GxG+27HBO4Qy+XNFjuAvX?=
 =?us-ascii?Q?QbbAFSeEINTOdk6BN1jHY8KZ1AL14krvvrLMnEQmZs2ane+zTsfViSfPPZFM?=
 =?us-ascii?Q?/AUBkGPGfgzScOpn5gY1KFAolX1zV08iZ0XOb0C2Jvu5s2gXbtcusvzZhrGV?=
 =?us-ascii?Q?sQKgdpoc1Fg4osO0W1LHSmlMvUgsJ0ckxa3vznYmaVXoqzlrhZcLTJr9w/eP?=
 =?us-ascii?Q?upxDoRXnGCPd7p0khISSEKdhpqPYqwFJmM16G6ZSKqhYcTniN+Umf+hTBUvc?=
 =?us-ascii?Q?C/6GmWyg4GORy6yG2odEGnbVrWiBoCms4hS4+OfrnFvpLmRMxME3cKd2KXLF?=
 =?us-ascii?Q?b0MRv6A549OB55rsazZPikN40wfSNFKrqz/n/z+VJpq647xAqt2iF+FPPrXd?=
 =?us-ascii?Q?64/bUdoIROVVtKvZAOgHAWoNgm+jjoneZwCtxe9MLhPjrFhZpYdUO6GVeGx1?=
 =?us-ascii?Q?MWSg7Q+CcZsRlc6VRrefadzhpkxy7gUUhj1SugQylvOCGHQIQYWC+xwsRRqW?=
 =?us-ascii?Q?mwgANVSqfAHClqpUQKfq9IiVgCPsHq62AJyX+ZgXvYKjpeU2NmoyEOsT1bSK?=
 =?us-ascii?Q?IvdkuMdGqB4Hhp6Hgqphahvk7Wa2axSJDHB0xP9NKGuUpMDq9Fr+AzYOiQk8?=
 =?us-ascii?Q?tSnFd26CBgv1jruUHI8OPaHS7mLF0c8WAMhBWv56gw14ccv/ilMXnsw7YU+0?=
 =?us-ascii?Q?4gc/NAnYTIzGwd3wudEBN5S9vGtVnUwRPGkhCQvjXrwQjuhD3/6PsYzqHnal?=
 =?us-ascii?Q?XmGRPVnBi4E4SmruH5N+L1p+fHpVP9uIRdw6AhVczShPEDlRyWkBEwLv+F8C?=
 =?us-ascii?Q?U4GK3KR2MCuJN15xvoOTHvPG4kepdmuuD8jt/pROTPGknsObTXQIDHcunU+u?=
 =?us-ascii?Q?UD2MrHrXFNaJuMllpk1GOvti7++ICJCl9zHY2GrTXUJPkw5rLnjLwygX2hRF?=
 =?us-ascii?Q?prIIES/xzKDynrZSM4XcYFuxfOWmSBWXsFfezOf8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78faeea4-686e-448a-277a-08de17e76f57
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:06:30.7459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MW9jvN3H4NQVG2pNCQpjtP+d5n9qr/jeXQwZD68kk1PthwdKqxoXvYUiqz5YKFx1kAygaRc0aShJovayWIfP8w==
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

Demonstrates usage of the DRM buddy allocator bindings through
a simple test module that initializes the allocator, performs
allocations, and prints information about the allocated blocks.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 samples/rust/Kconfig           |  14 +++++
 samples/rust/Makefile          |   1 +
 samples/rust/rust_drm_buddy.rs | 106 +++++++++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 samples/rust/rust_drm_buddy.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b45631e2593c..8ccb4064ba91 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -21,6 +21,20 @@ config SAMPLE_RUST_CLIST
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRM_BUDDY
+	tristate "DRM buddy allocator sample"
+	depends on DRM_BUDDY
+	help
+	  This option builds the Rust DRM buddy allocator sample.
+
+	  The sample demonstrates using the DRM buddy allocator bindings
+	  to allocate and free memory blocks.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_drm_buddy.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_CONFIGFS
 	tristate "Configfs sample"
 	depends on CONFIGFS_FS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f8899c0df762..a56204ee4e96 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,6 +2,7 @@
 ccflags-y += -I$(src)				# needed for trace events
 
 obj-$(CONFIG_SAMPLE_RUST_CLIST)			+= rust_clist.o
+obj-$(CONFIG_SAMPLE_RUST_DRM_BUDDY)		+= rust_drm_buddy.o
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
diff --git a/samples/rust/rust_drm_buddy.rs b/samples/rust/rust_drm_buddy.rs
new file mode 100644
index 000000000000..96907bc19243
--- /dev/null
+++ b/samples/rust/rust_drm_buddy.rs
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust DRM buddy allocator sample.
+//!
+//! This sample demonstrates using the DRM buddy allocator from Rust.
+
+use kernel::{
+    drm::buddy::{
+        BuddyFlags,
+        DrmBuddy, //
+    },
+    prelude::*,
+    sizes::*, //
+};
+
+module! {
+    type: RustDrmBuddySample,
+    name: "rust_drm_buddy",
+    authors: ["Joel Fernandes"],
+    description: "DRM buddy allocator sample",
+    license: "GPL",
+}
+
+struct RustDrmBuddySample;
+
+impl kernel::Module for RustDrmBuddySample {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        // Create a buddy allocator managing 1GB with 4KB chunks.
+        let buddy = DrmBuddy::new(SZ_1G, SZ_4K)?;
+
+        pr_info!("=== Test 1: Single 16MB block ===\n");
+        let allocated = buddy.alloc_blocks(
+            0,
+            0,
+            SZ_16M,
+            SZ_4K,
+            BuddyFlags::RANGE_ALLOCATION,
+            GFP_KERNEL,
+        )?;
+
+        let mut count = 0;
+        for block in &allocated {
+            pr_info!(
+                "  Block {}: offset=0x{:x}, order={}, size={}\n",
+                count,
+                block.offset(),
+                block.order(),
+                block.size(&buddy)
+            );
+            count += 1;
+        }
+        pr_info!("  Total: {} blocks\n", count);
+        drop(allocated);
+
+        pr_info!("=== Test 2: Three 4MB blocks ===\n");
+        let allocated = buddy.alloc_blocks(
+            0,
+            0,
+            SZ_4M * 3,
+            SZ_4K,
+            BuddyFlags::RANGE_ALLOCATION,
+            GFP_KERNEL,
+        )?;
+
+        count = 0;
+        for block in &allocated {
+            pr_info!(
+                "  Block {}: offset=0x{:x}, order={}, size={}\n",
+                count,
+                block.offset(),
+                block.order(),
+                block.size(&buddy)
+            );
+            count += 1;
+        }
+        pr_info!("  Total: {} blocks\n", count);
+        drop(allocated);
+
+        pr_info!("=== Test 3: Two 8MB blocks ===\n");
+        let allocated = buddy.alloc_blocks(
+            0,
+            0,
+            SZ_8M * 2,
+            SZ_4K,
+            BuddyFlags::RANGE_ALLOCATION,
+            GFP_KERNEL,
+        )?;
+
+        count = 0;
+        for block in &allocated {
+            pr_info!(
+                "  Block {}: offset=0x{:x}, order={}, size={}\n",
+                count,
+                block.offset(),
+                block.order(),
+                block.size(&buddy)
+            );
+            count += 1;
+        }
+        pr_info!("  Total: {} blocks\n", count);
+
+        pr_info!("=== All tests passed! ===\n");
+
+        Ok(RustDrmBuddySample {})
+    }
+}
-- 
2.34.1

