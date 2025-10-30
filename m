Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62CC21DB4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CE710EA16;
	Thu, 30 Oct 2025 19:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UcYqluqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A96910EA0E;
 Thu, 30 Oct 2025 19:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+mKagy0F1P3WHk0RVYJ3X2r3tVYDTs/BeGchchP2O7uutog/uvCnx1TCRwFUdCWcOXAJwg57Yf9eq+2KstekiWiB3qxQYz0yqFW/exLxwPCDU27lJmlDyxURn1WoNqSWIQvoHLvbg2QYM2fQgTNc25JOKJ5tu70gTnQVluZEcIh3NpHQXUWt3iAq0lttOzV5wE/D781vSQHSesycf4r/uo4JJlHhBFm5A42xTZKQTogSn2aM2hqhUp00esaQu4rW+/6NMdASj/5WpJo29JdwvXGpyBvx8PssD0nTI+3csiv5vPMFI/eBBU4Od+gi6UpOgAhqBdvpbjVm/Q0WOfCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiVTJHiNiDjnr2NxwkAK6VVz42WDCXEUP9b3e+gcK3Y=;
 b=Ne0Zhw6MmfSONywTmO2JzLBY2vWCY0oMZSKToze7xRgv7I2XlprRjJMVixY5mVJjYELmHd8bnvRDRQSTnn/ZmJp2b8vcojW149rc/eNlwmMq7bgbxgPB364HIlGYR8aVGWicI5U385CIyockXLziWvcFtj1T7b8ALt0eB61LTa0VOq1tH6XSiaBNTJsl41L02AEDzBVEGSLqeECGrKRePrC4lTx8zZPyDYSpKfrqZWfwA/zVRveDrCijutKWbl+BE5h4XpexBasB52AZM/jI4P7eJmuZeRJpSO7nkTTmtJPU+OY7m7IRsqZI+0LKAWEMjNCmC+bM7V+MspA42u1RFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiVTJHiNiDjnr2NxwkAK6VVz42WDCXEUP9b3e+gcK3Y=;
 b=UcYqluqFz3we8cmtBMNRU9sqKbXUtSdxvQjSzdn9OMTlV30UCGpTwRCcWn7SJz2UjqP/0YIuXfdwE9gms2QzIB0R03QBNqab4j38on44pE5Wrs4yxN8iuT+AMUbE5ziwnYs7K2QHgZIFr3uWuAlS+ztCgQOC9CdgDqIwIodHKI+buFVvnga3gD/+asuCxLY9WQ3AKiJPJUSjXpqI9vhET+Pi44CRgbi+rbHF7GyJQymdhS2IRRglED6TDQ9Qe77bMscG4UudCIwRuGS87Vj+oIewS5xqDWSQGURZjLoMsNjNAhy6wKQ/UY7R2uYZYf1oAjHN/kUlb7IUc+CXrZ4yGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 19:06:32 +0000
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
Subject: [PATCH RFC 3/4] rust: drm: Add DRM buddy allocator bindings
Date: Thu, 30 Oct 2025 15:06:12 -0400
Message-Id: <20251030190613.1224287-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030190613.1224287-1-joelagnelf@nvidia.com>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abe587f-a4e9-45b3-d345-08de17e76e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZWf7Y/9J/IMP+lnG/YeGMgPKRQ76ncUvuSszILzNtqAqI7xtQu0SS3aYMNj3?=
 =?us-ascii?Q?YIunZgzjyrPybOUDzBfeY4ZSB39WcvwgUOHDXDmNhxVe7xhuPXiVTH88hVnq?=
 =?us-ascii?Q?IYBXLOF6uH46vGYkQl47RgLzTbQgcxtpIxBQzEBN0Pm5RbYJtGcY7iiIphUG?=
 =?us-ascii?Q?zayUnOUA3Fspba7LyslyMaaUtZzubQAW0pYnsRc+CXrw0wBzAb7RVD3qFDW6?=
 =?us-ascii?Q?JfmFo4IyhckVmHj7dzGzLFoyASKXBuErcQ8mYePGvuAHfULpQBCSspUcYaCw?=
 =?us-ascii?Q?b0f/QY/z+yjfo7cQLoW58AOiiojWU7IzzxJR3SHifjmGnXHKBDpf1JOb4467?=
 =?us-ascii?Q?ilVMuK0uln0DJc/qfvzPmMja/a2+uoXxRJV70bikXY5Uj8OqTlhuKsvH9NcB?=
 =?us-ascii?Q?aMx8HagUnWL2ApLmEQ4wFW5ior+FXdNDxcR4EcaVvgONjSnj/oNOcDX3kEWh?=
 =?us-ascii?Q?Rv26AfTTxvjc5CfurIbYQnCf4k8k2ZMo3a3E7TAere+y+KeaDXnkoXzoK7gJ?=
 =?us-ascii?Q?m1fu9ua+aAUFl9nf3xTLjTlU9b3I3h2Fa1vNlLCu0Xy9NcmheVdsCtc7ZCMv?=
 =?us-ascii?Q?hOSVYYJZy12CpsCwpPvoUspVIO4maocKR736+1r2XHeOJVcys6dzmLdDe8Yt?=
 =?us-ascii?Q?sGmP6/xecbxd+S40UGwFM3eJqdqXSgVU3HjJgl7U8kRaO9bTXzzzgknYT6tE?=
 =?us-ascii?Q?ffgb2tzVM+rgN4iuLrNOzIrznxuUTHglCywJyTvoDcCdMSxUSLezQ0cvvs+E?=
 =?us-ascii?Q?ZlSjMQxbus72dRJPHJHlLI+4KXWK5Ujst34deenPabNrMRNPcVXxlNQnP+t/?=
 =?us-ascii?Q?27mFhrDG8qDP1npCSyRxfNjZqmMHJzgAQd4m2nQPrgncVmDT9Y1PmT5rpGZ5?=
 =?us-ascii?Q?DtdtW8VqNERAYb75+KxuQQW2a1IwMTwzoAJF9HX+9j/eCuff8Oc2KQyELM4f?=
 =?us-ascii?Q?XoNWACVGuWhS/g6XZ0+4TUSFcVESpwgPnv8J8V/Z9YkM4J6nC+mshf1E3Cgp?=
 =?us-ascii?Q?v600MUmK1COeLli78JG3rLX7JLUhGkoQlbZ+pxXz6HfHRPQuRXglUFooOIZn?=
 =?us-ascii?Q?a46CvVZ/MYAHTVdVhVk0hlHe6Vcqr5R6Ojo4hsskW5BamNLPibAmtdIJKI+J?=
 =?us-ascii?Q?yXSRRFLoVm0OWC+px6AUjJ0Hsb+TuLRnWk/RaR7X2OVwGSteCaU5rO7AKIbq?=
 =?us-ascii?Q?OB2+sD8P4UH0aWY53jnio7wR7tScJKwGPFFw0lk5QMG13H9gJ3k0jK10jyGM?=
 =?us-ascii?Q?tf/uZ7teeyLAvz8MvUTOSPeLYoWgbUb2KT31fkhcM5bQnooy+i+of5jtbmb+?=
 =?us-ascii?Q?4spp+PNbdVDrY+zLBIwCTQvL6NbzaR5zVpFKhW7jAuIKxU6iQCNDWSOj7mTf?=
 =?us-ascii?Q?I65wanQF6nAYf79S2UNpRhy53Nba3BUGCTVRqXwwl42KQvj+cfLyY4Bsyr4e?=
 =?us-ascii?Q?MvXv4E8PKUBmE5BOvyMtHI94CnS2fkF4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSgbk1r+jRbzAFp0uxlXmlO2CxHsGN341O7YMnKABRbT+rrwnzD0h2W7Q0TJ?=
 =?us-ascii?Q?J8VrsYPPEWXm6iNliM5+G1sSfkpl2Jf4YfqPwPb5A7CJD2ZuCA3tQCnKBmxx?=
 =?us-ascii?Q?zFJfGj2uWl5AiHQZz8PVgBkTRuMKDTMW5hWzDu69/JAmIDz7g7rZQFBTf7Jm?=
 =?us-ascii?Q?s+a9K/LqPGKsrC4ovUnySwYle7KkVe5q7WBj3puCTEP/rMO4a2Ga3fv0CG1P?=
 =?us-ascii?Q?Fh0boCDWMyftmW4dT6xz+uJ5L2+HbY9JoPyAAxYL69IIBT5xPLMQC+S7n7XT?=
 =?us-ascii?Q?PyjyaOM1g5Mrx1XFY8Hw2njQHGxA2Uqc7ijvGxHsKG37qZHTPg/jdIkE7fpn?=
 =?us-ascii?Q?r04j+jWVYKQHomCiit0FqdOE3PhEGs0lOSFEQyWP8YpFPin2I9fxOjUoWVwV?=
 =?us-ascii?Q?pd3JBWMK79a1iaP2BjMxIUIm1MNc+LGayN+Ss/N372BQj1AW+O/8nWQxvrpr?=
 =?us-ascii?Q?h/vORXp8Obdj+9zXnfXoFijd3CRwGCYwMfIzfreR8RN8oeoDtIGRG/xxJD2G?=
 =?us-ascii?Q?avGapw8zJYDp0rGajQSH91opY3bDTITh2bUT/ASQhBT8Qht2mqIuPsoGmrRy?=
 =?us-ascii?Q?eZwuPIjI6fGuy2grHG1FUTm4W7ZOeYJ6uSoysJCg89kRp3KFNRofl83hhT2/?=
 =?us-ascii?Q?Y22O3NolJHA/ZqU6ez4Cn6anhb7MaxCfxzd5KUMfWOf1RCPb+VMFEG49Md37?=
 =?us-ascii?Q?C+64OoWvSTS8OgCA4WET6BoMhteAYUBV82Qmb1pelaU4F4Wz1J12tWPYUnkw?=
 =?us-ascii?Q?OlTstiUyxzTEYBlZ5wY8aSvk3yWwBwGGrcpPLCHU0JR4E4LkwHgTJABUIYI/?=
 =?us-ascii?Q?hx7AAn5+YxYzQnZt4b6RhXEK3NFrKkloZg8CEG+Yfvqy0sFZARZ1U/wuSNEe?=
 =?us-ascii?Q?btAR4hdykjqjQ8sWNEDJqWnyv7UtHApo+nOt2DDFd37pkRDrmXCbFWNMj06Z?=
 =?us-ascii?Q?MvKKuWnLx0TA7Y8S+t9MkwgJNNGmx72syEEUkkrVdMKMUdhRMjY8aorLa67j?=
 =?us-ascii?Q?/zi6JCW4HRJ1R6PK6Tcpxyc8H7vAqLEXvkUjIXJhxaI+LLrER/P92r2lPpu0?=
 =?us-ascii?Q?a4U4/odk+74bdB7DxiNJV82ZDez93H1PoUP6+/jTcOaX8pNvmiCC3UQkVSsn?=
 =?us-ascii?Q?A6qdraq2xVEgJ6lMcEzRfl0BvUlV8rtvbWzk78G4Ww9lK0UNGafm7Cvxm7wR?=
 =?us-ascii?Q?tvBZmPzBBsAlR1WqnKa+U6h5Mb+6gG2HnGAtT7BYIGTJ0bPU0ySQtFah14dY?=
 =?us-ascii?Q?2OfY3tB4xcMXUCcUmcfyA4y03SIA4tcxeEeaJ7mt9eiAFiAfk/Typ7cATYwY?=
 =?us-ascii?Q?eg6Y3Yda5gVcnfQ+QpykZ/+0ri16m4YvXEMxexj8Si48sUE1BMmOrazUE5WZ?=
 =?us-ascii?Q?4DbQ3qclas6AWfcIGdxJFqlbPqEcXNwvfeeVmHxysug3Tng3c5Usdr1L0Rkf?=
 =?us-ascii?Q?sFCjhw+pzauh3j+WkHcltG6jRAZ+TW0PjlSk7AJ0PoEabK34ZkPkPGA9qV8j?=
 =?us-ascii?Q?0wbCuXoTNDtIjXBmsIj1LbmCsyxeR25RL85qRZMnvxMgcisdjsIevklbSVrT?=
 =?us-ascii?Q?i26ptVzCSoWKv/u5eJSTDkPg1XqojoI4GuUtS+MU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abe587f-a4e9-45b3-d345-08de17e76e5d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:06:29.1549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+6/SMIOOprH8FvHwK0XM9s2gqJ8Cb9VHE7PasktjYN9fycRXp2+qw1pBiGzT9u/aySt5+Xde+7Ewfh/zxP+Nw==
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

Add safe Rust abstractions over the Linux kernel's DRM buddy
allocator for physical memory management. The DRM buddy allocator
implements a binary buddy system for useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/drm.c              |  23 +-
 rust/kernel/drm/buddy.rs        | 357 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 4 files changed, 391 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/drm/buddy.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 6b973589a546..747d4c7ef935 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <drm/drm_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -112,6 +113,16 @@ const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
 const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
 
+#if IS_ENABLED(CONFIG_DRM_BUDDY)
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_RANGE_ALLOCATION = DRM_BUDDY_RANGE_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_TOPDOWN_ALLOCATION = DRM_BUDDY_TOPDOWN_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_CONTIGUOUS_ALLOCATION =
+								DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_CLEAR_ALLOCATION = DRM_BUDDY_CLEAR_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_CLEARED = DRM_BUDDY_CLEARED;
+const unsigned long RUST_CONST_HELPER_DRM_BUDDY_TRIM_DISABLE = DRM_BUDDY_TRIM_DISABLE;
+#endif
+
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
index 450b406c6f27..bd8748ade3f5 100644
--- a/rust/helpers/drm.c
+++ b/rust/helpers/drm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <drm/drm_buddy.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_vma_manager.h>
 
@@ -20,4 +21,24 @@ __u64 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
 	return drm_vma_node_offset_addr(node);
 }
 
-#endif
+#ifdef CONFIG_DRM_BUDDY
+
+u64 rust_helper_drm_buddy_block_offset(const struct drm_buddy_block *block)
+{
+	return drm_buddy_block_offset(block);
+}
+
+unsigned int rust_helper_drm_buddy_block_order(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_order(block);
+}
+
+u64 rust_helper_drm_buddy_block_size(struct drm_buddy *mm,
+				     struct drm_buddy_block *block)
+{
+	return drm_buddy_block_size(mm, block);
+}
+
+#endif /* CONFIG_DRM_BUDDY */
+
+#endif /* CONFIG_DRM */
diff --git a/rust/kernel/drm/buddy.rs b/rust/kernel/drm/buddy.rs
new file mode 100644
index 000000000000..b1cd23f81838
--- /dev/null
+++ b/rust/kernel/drm/buddy.rs
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! DRM buddy allocator bindings.
+//!
+//! C header: [`include/drm/drm_buddy.h`](srctree/include/drm/drm_buddy.h)
+//!
+//! This module provides Rust abstractions over the Linux kernel's DRM buddy
+//! allocator, which implements a binary buddy memory allocation system.
+//!
+//! The buddy allocator manages a contiguous address space and allocates blocks
+//! in power-of-two sizes. It's commonly used for physical memory management.
+//!
+//! # Examples
+//!
+//! ```ignore
+//! use kernel::{
+//!     drm::buddy::{BuddyFlags, DrmBuddy},
+//!     prelude::*,
+//!     sizes::*, //
+//! };
+//!
+//! let buddy = DrmBuddy::new(SZ_1G, SZ_4K)?;
+//! let allocated = buddy.alloc_blocks(
+//!     0, 0, SZ_16M, SZ_4K,
+//!     BuddyFlags::RANGE_ALLOCATION,
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! for block in &allocated {
+//!     // Use block.
+//! }
+//! // Blocks are automatically freed when `allocated` goes out of scope.
+//! ```
+
+use crate::{
+    alloc::Flags,
+    bindings,
+    clist,
+    container_of,
+    error::{
+        to_result,
+        Result, //
+    },
+    prelude::KBox,
+    types::Opaque, //
+};
+use core::ptr::NonNull;
+
+/// Flags for DRM buddy allocator operations.
+///
+/// These flags control the allocation behavior of the buddy allocator.
+#[derive(Clone, Copy, PartialEq)]
+pub struct BuddyFlags(u64);
+
+impl BuddyFlags {
+    /// Range-based allocation from start to end addresses.
+    pub const RANGE_ALLOCATION: BuddyFlags =
+        BuddyFlags(bindings::DRM_BUDDY_RANGE_ALLOCATION as u64);
+
+    /// Allocate from top of address space downward.
+    pub const TOPDOWN_ALLOCATION: BuddyFlags =
+        BuddyFlags(bindings::DRM_BUDDY_TOPDOWN_ALLOCATION as u64);
+
+    /// Allocate physically contiguous blocks.
+    pub const CONTIGUOUS_ALLOCATION: BuddyFlags =
+        BuddyFlags(bindings::DRM_BUDDY_CONTIGUOUS_ALLOCATION as u64);
+
+    /// Clear allocated blocks (zero them).
+    pub const CLEAR_ALLOCATION: BuddyFlags =
+        BuddyFlags(bindings::DRM_BUDDY_CLEAR_ALLOCATION as u64);
+
+    /// Block has been cleared - internal flag.
+    pub const CLEARED: BuddyFlags = BuddyFlags(bindings::DRM_BUDDY_CLEARED as u64);
+
+    /// Disable trimming of partially used blocks.
+    pub const TRIM_DISABLE: BuddyFlags = BuddyFlags(bindings::DRM_BUDDY_TRIM_DISABLE as u64);
+
+    /// Get raw value for FFI.
+    pub(crate) fn as_raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl core::ops::BitOr for BuddyFlags {
+    type Output = Self;
+
+    fn bitor(self, rhs: Self) -> Self::Output {
+        Self(self.0 | rhs.0)
+    }
+}
+
+/// DRM buddy allocator instance.
+///
+/// This structure wraps the C `drm_buddy` allocator.
+///
+/// # Safety
+///
+/// Not thread-safe. Concurrent alloc/free operations require external
+/// synchronization (e.g., wrapping in `Arc<Mutex<DrmBuddy>>`).
+///
+/// # Invariants
+///
+/// - `mm` is initialized via `drm_buddy_init()` and remains valid until Drop.
+pub struct DrmBuddy {
+    mm: Opaque<bindings::drm_buddy>,
+}
+
+impl DrmBuddy {
+    /// Create a new buddy allocator.
+    ///
+    /// Creates a buddy allocator that manages a contiguous address space of the given
+    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
+    ///
+    /// # Examples
+    ///
+    /// See the complete example in the documentation comments for [`AllocatedBlocks`].
+    pub fn new(size: usize, chunk_size: usize) -> Result<Self> {
+        // Create buddy allocator with zeroed memory.
+        let buddy = Self {
+            mm: Opaque::zeroed(),
+        };
+
+        // Initialize the C buddy structure.
+        // SAFETY: buddy.mm points to valid, zeroed memory.
+        unsafe {
+            to_result(bindings::drm_buddy_init(
+                buddy.mm.get(),
+                size as u64,
+                chunk_size as u64,
+            ))?;
+        }
+
+        Ok(buddy)
+    }
+
+    /// Get a raw pointer to the underlying C drm_buddy structure.
+    ///
+    /// # Safety
+    ///
+    /// Caller must ensure the returned pointer is not used after this
+    /// structure is dropped.
+    pub unsafe fn as_raw(&self) -> *mut bindings::drm_buddy {
+        self.mm.get()
+    }
+
+    /// Get the chunk size (minimum allocation unit).
+    pub fn chunk_size(&self) -> u64 {
+        // SAFETY: mm is initialized and valid per struct invariant.
+        unsafe { (*self.as_raw()).chunk_size }
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        // SAFETY: mm is initialized and valid per struct invariant.
+        unsafe { (*self.as_raw()).size }
+    }
+
+    /// Get the available (free) memory.
+    pub fn avail(&self) -> u64 {
+        // SAFETY: mm is initialized and valid per struct invariant.
+        unsafe { (*self.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns an [`AllocatedBlocks`] structure that owns the allocated blocks and automatically
+    /// frees them when dropped. Allocation of `list_head` uses the `gfp` flags passed.
+    pub fn alloc_blocks(
+        &self,
+        start: usize,
+        end: usize,
+        size: usize,
+        min_block_size: usize,
+        flags: BuddyFlags,
+        gfp: Flags,
+    ) -> Result<AllocatedBlocks<'_>> {
+        // Allocate list_head on the heap.
+        let mut list_head = KBox::new(bindings::list_head::default(), gfp)?;
+
+        // SAFETY: list_head is valid and heap-allocated.
+        unsafe {
+            bindings::INIT_LIST_HEAD(&mut *list_head as *mut _);
+        }
+
+        // SAFETY: mm is a valid DrmBuddy object per the type's invariants.
+        unsafe {
+            to_result(bindings::drm_buddy_alloc_blocks(
+                self.as_raw(),
+                start as u64,
+                end as u64,
+                size as u64,
+                min_block_size as u64,
+                &mut *list_head as *mut _,
+                flags.as_raw() as usize,
+            ))?;
+        }
+
+        // `list_head` is now the head of a list that contains allocated blocks
+        // from C code. The allocated blocks will be automatically freed when
+        // `AllocatedBlocks` is dropped.
+        Ok(AllocatedBlocks {
+            list_head,
+            buddy: self,
+        })
+    }
+}
+
+impl Drop for DrmBuddy {
+    fn drop(&mut self) {
+        // SAFETY: self.mm is initialized and valid. drm_buddy_fini properly
+        // cleans up all resources. This is called exactly once during Drop.
+        unsafe {
+            bindings::drm_buddy_fini(self.as_raw());
+        }
+    }
+}
+
+// SAFETY: DrmBuddy can be sent between threads. Caller is responsible for
+// ensuring thread-safe access if needed (e.g., via Mutex).
+unsafe impl Send for DrmBuddy {}
+
+/// Allocated blocks from the buddy allocator with automatic cleanup.
+///
+/// This structure owns a list of allocated blocks and ensures they are
+/// automatically freed when dropped. Blocks may be iterated over and are
+/// read-only after allocation (iteration via [`IntoIterator`] and
+/// automatic cleanup via [`Drop`] only). To share across threads, wrap
+/// in `Arc<AllocatedBlocks>`. Rust owns the head list head of the
+/// allocated blocks; C allocates blocks and links them to the head
+/// list head. Clean up of the allocated blocks is handled by C code.
+///
+/// # Invariants
+///
+/// - `list_head` is an owned, valid, initialized list_head.
+/// - `buddy` points to a valid, initialized [`DrmBuddy`].
+pub struct AllocatedBlocks<'a> {
+    list_head: KBox<bindings::list_head>,
+    buddy: &'a DrmBuddy,
+}
+
+impl Drop for AllocatedBlocks<'_> {
+    fn drop(&mut self) {
+        // Free all blocks automatically when dropped.
+        // SAFETY: list_head is a valid list of blocks per the type's invariants.
+        unsafe {
+            bindings::drm_buddy_free_list(self.buddy.as_raw(), &mut *self.list_head as *mut _, 0);
+        }
+    }
+}
+
+impl<'a> AllocatedBlocks<'a> {
+    /// Check if the block list is empty.
+    pub fn is_empty(&self) -> bool {
+        // SAFETY: list_head is a valid list of blocks per the type's invariants.
+        unsafe { clist::list_empty(&*self.list_head as *const _) }
+    }
+
+    /// Iterate over allocated blocks.
+    pub fn iter(&self) -> clist::ClistIter<'_, Block> {
+        // SAFETY: list_head is a valid list of blocks per the type's invariants.
+        clist::iter_list_head::<Block>(&*self.list_head)
+    }
+}
+
+/// Iteration support for allocated blocks.
+///
+/// # Examples
+///
+/// ```ignore
+/// for block in &allocated_blocks {
+///     // Use block.
+/// }
+/// ```
+impl<'a> IntoIterator for &'a AllocatedBlocks<'_> {
+    type Item = Block;
+    type IntoIter = clist::ClistIter<'a, Block>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        self.iter()
+    }
+}
+
+/// A DRM buddy block.
+///
+/// Wraps a pointer to a C `drm_buddy_block` structure. This is returned
+/// from allocation operations and used to free blocks.
+///
+/// # Invariants
+///
+/// `drm_buddy_block_ptr` points to a valid `drm_buddy_block` managed by the buddy allocator.
+pub struct Block {
+    drm_buddy_block_ptr: NonNull<bindings::drm_buddy_block>,
+}
+
+impl Block {
+    /// Get the block's offset in the address space.
+    pub fn offset(&self) -> u64 {
+        // SAFETY: drm_buddy_block_ptr is valid per the type's invariants.
+        unsafe { bindings::drm_buddy_block_offset(self.drm_buddy_block_ptr.as_ptr()) }
+    }
+
+    /// Get the block order (size = chunk_size << order).
+    pub fn order(&self) -> u32 {
+        // SAFETY: drm_buddy_block_ptr is valid per the type's invariants.
+        unsafe { bindings::drm_buddy_block_order(self.drm_buddy_block_ptr.as_ptr()) }
+    }
+
+    /// Get the block's size in bytes.
+    ///
+    /// Requires the buddy allocator to calculate size from order.
+    pub fn size(&self, buddy: &DrmBuddy) -> u64 {
+        // SAFETY: Both pointers are valid per the type's invariants.
+        unsafe { bindings::drm_buddy_block_size(buddy.as_raw(), self.drm_buddy_block_ptr.as_ptr()) }
+    }
+
+    /// Get a raw pointer to the underlying C block.
+    ///
+    /// # Safety
+    ///
+    /// Caller must ensure the pointer is not used after the block is freed.
+    pub unsafe fn as_ptr(&self) -> *mut bindings::drm_buddy_block {
+        self.drm_buddy_block_ptr.as_ptr()
+    }
+}
+
+impl clist::FromListHead for Block {
+    unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
+        // SAFETY: link points to a valid list_head embedded in drm_buddy_block.
+        // The container_of macro calculates the containing struct pointer.
+        // We need to account for the union field __bindgen_anon_1.link.
+        //
+        // The link is embedded in a union within drm_buddy_block:
+        //     struct drm_buddy_block {
+        //         [...]
+        //         union {
+        //             struct rb_node rb;
+        //             struct list_head link;
+        //         };
+        //     }
+        //
+        // This is why we perform a double container_of calculation: first to get
+        // to the union, then to get to the containing drm_buddy_block.
+        unsafe {
+            // First get to the union.
+            let union_ptr = container_of!(link, bindings::drm_buddy_block__bindgen_ty_1, link);
+            // Then get to the containing drm_buddy_block.
+            let block_ptr =
+                container_of!(union_ptr, bindings::drm_buddy_block, __bindgen_anon_1) as *mut _;
+            Block {
+                drm_buddy_block_ptr: NonNull::new_unchecked(block_ptr),
+            }
+        }
+    }
+}
+
+// SAFETY: Block is just a pointer wrapper and can be safely sent between threads.
+unsafe impl Send for Block {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf..ee173729eac5 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,6 +2,7 @@
 
 //! DRM subsystem abstractions.
 
+pub mod buddy;
 pub mod device;
 pub mod driver;
 pub mod file;
-- 
2.34.1

