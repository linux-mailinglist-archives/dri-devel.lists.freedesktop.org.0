Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02375C4F350
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606610E626;
	Tue, 11 Nov 2025 17:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BEH45LgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4410E610;
 Tue, 11 Nov 2025 17:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ck+Xx+oUgcEeH4f13Aq28n42nHGfIuHf/C7XruBzqY495u9Tx8DrUpMZ5ou66dCYr8G6QtHXAtItzXO2SldXfYSe/xVI2vdT+uJED5pn+9vN8HnNudNVxF2xL+ZtuvApJHgVVJoDB1s7K8txNbzp9ihE/5aYe3rFyNoSJQ+QTfe17f9Mx5xbw5csGjVZ5jLvN4/88tyYtoSQ3tHwbUdTJ3XedVnUU6X969/IvIvXD3IJhJXGBfYJU5xwzCqAvsszc7zCOh5M6Qj7KlpyeZsGjZB3rzg6rN1wGvZNv3CXzTFZ+3fiEwbwZhdEGcFISGpE1zlV8C9wPFjzkZIa+huCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjVqehR3yw2rRaH8F21gzgV4ivkNICrtDFVpgaskVT0=;
 b=hGpXqw29WnvF426wDyAC2YqLW8n/Yw3wOD//4qKeaAHCITbs0oftTX4EvzR8z1IsuksiqskxpkMTQRrwzAeDFrkO+KiDxgtyDul34g9QvgFEosAYabfUeLdQFTjTs/tXs35LnC1dVSEOurLcMk+KA2dgd9+rlcxtjXyOFcwic9lBRIkIvBE/QObK+3/IW8afQM685h0vyXJCvksqRzTUrzq9FHEHHxbmicL3XFfHLDuBOY1FOFZyMjjpptvLaKqa7+5e1QMKvYVdIUQv7qmSnxC6sE3jeG5RJ97oRWt8Jf2CNDEPrlEJurse/x8LyXzuakK0NDz2CngDTz1HdAKiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjVqehR3yw2rRaH8F21gzgV4ivkNICrtDFVpgaskVT0=;
 b=BEH45LgM5asd/wp5NhCS/GQp4r6RZO3edVb2CDaylWdqIRseXQOT5mQMAGXRdFzXmX2drbY1PGV9evRAUMksglexqwpUDljwLIgcX4ZP8/jZIWH1XYXRt/UgdcDJEqW5nENmCQc3iztOpPeJayL81fF0CFyuW1RrRCc7NkT+U1yIp1T3QBCWF/jCzAdCQF1DJGYhp0JMncACDInZq9XXGapROzch2tqSApDRnwNwQHZXqhisWVkyxj6NEdEC4WXXPKa9fFxLS3a343s4pVsXWl+M4HpcXdAeR56Y6Rx/5n1sjNjyLeusRQa2NGOketel3t0G3vzJBw+TvgHJUdJP0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:13:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:13:26 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com
Cc: acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jhubbard@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 2/3] rust: clist: Add basic list infrastructure and head
 iterator
Date: Tue, 11 Nov 2025 12:13:13 -0500
Message-Id: <20251111171315.2196103-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111171315.2196103-1-joelagnelf@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0358.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b7fa4d-a2d9-4eca-399f-08de2145a05a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5/hNygIlJGyQajA310xxWibajrvAr9kzRJhMde8LmgiWUOe9Pilrb6ZbIO8w?=
 =?us-ascii?Q?Nbsa50P+csMKwanqhcnC3m3pnMR+o74mp9aiXHtSeSJ/I7Mt7cbSj+4xmVHD?=
 =?us-ascii?Q?zigj1IcUvvd6cDphMVmTBz2u0gIvvZKreElkos3Tz6VtEu0VNarAH6ApMhoW?=
 =?us-ascii?Q?J/yX2jWwgg9zrthjdD/VMwQtchSxRxlOwhChUdXRko83ew6T0tAsy5vSMHSl?=
 =?us-ascii?Q?Es+qHQbAWew7eC4bFCL4LPgHQ+srYtJWSfK/BKh8nkuBqn1k7fWD9BZAEzeF?=
 =?us-ascii?Q?7rJPa7a1HlJwDb/RarM8Y2UzwXfdaKUJZ735SH7fJRl69BfiYesGsCep9Xo/?=
 =?us-ascii?Q?o2SVgPNhhqHPIkbiqzFfZq9NK4+Qi5D6hsolcch32YTAfNLdcS7OpXJpplat?=
 =?us-ascii?Q?mQ84kOVjQVTHADLdRvgFFXPCAHIn82/qrF3DExfCMr+ZcMkjD5kvuCN9e7ST?=
 =?us-ascii?Q?9OdsiiXjtXcIz63LfXa1fy3ALQ3ZSPjoyLh6vhqwafcCXvpQdKPS4E+bR3W8?=
 =?us-ascii?Q?9jTMdWNu8sH+xv2xQFSESO6JL9xgfBWgTPE6OkVGii7sYPL7jDLpIkUdMEaX?=
 =?us-ascii?Q?EzgfQBOVUL5vjRG9hLUDrQ45snHXIUpT500xHuGv7zbfB6GH4KeQqOK9yBQR?=
 =?us-ascii?Q?1pMUB0+ISTpUL6Z/gZUENA5FcGyt4X6P037WeRFAUkmImwUswGuvPZjHTyQV?=
 =?us-ascii?Q?3I+meACBXkgSBFrUsJWcsejJE53LhPWeH0sHzDtgiXaGOuJkm9aAnTEtGXGK?=
 =?us-ascii?Q?4oBQmadAAfG5nGvxAl1q0m1DVLd+niANxD+7gGynTSa7ITZKewADoiWi0uIV?=
 =?us-ascii?Q?YjELStMaqFsnClgXiz8H42hgOADnC6P4jPjhmlD0HKfXCAjq10PxsSLgeKq4?=
 =?us-ascii?Q?9VRRvRTSfzMP2MeJLh/jAUtbEZrw9/WRlRxAlORQWvzIO0sSVTzK4LPC82xL?=
 =?us-ascii?Q?1cNPwDV1O94LiJbBbdpdgyl8x5pNRHnl6omEeIeD1WV4fv+ybM7OPLGIwW1I?=
 =?us-ascii?Q?B34DGbpjNkvuyQFC10GzBM7VkcMlnS5dE/YOsHCXL5I8rTScuDZL/WWPKO7m?=
 =?us-ascii?Q?1vEoN6mhdbo7MVuADPtk0buHKx58Gqo58sQ3wY9qp299dh85bIFqftSPm8oZ?=
 =?us-ascii?Q?yXDYKrfZeS1nncfCHy+o8PS18iNedn2L0mpUIBD47BlFbpXX3HC4tZWoRzIu?=
 =?us-ascii?Q?AlhwUIH0ZJ+hXOY7Y3FtzbRPV4/x2c9Tn9TV4ud7MWRAqS4oom2fLhCRVDBa?=
 =?us-ascii?Q?HSw49wlzg2k7Rq0M3xW8JQ5CI7OTPQfVNnSYlrdTiPx6DSo2Bu2akxvPNoYS?=
 =?us-ascii?Q?mwup9vGZUbqN2wauUrf3YmX9rertjFa/6ITtsnG3yBFrT475kd8oEWFgpXij?=
 =?us-ascii?Q?IA0Q+eBXEhdoz3ZxIUQ2yqbvs96xo0hkk5zGsQaYa14DjG4osxi8kjK5PmTS?=
 =?us-ascii?Q?nHzC+pDFOOt0IAs1EcoXfX6QcWQ52rzN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zAUIKjdQVndUvgVJe4NZbqgEBQZg1MZsx5QjNhEhvrDXs55Svswpng5T9XmM?=
 =?us-ascii?Q?+yAa6PvCTZX/BDQytxvWG0wME9z22dWjhy6ORjjXrES7mU+5YB1KORE1KhIU?=
 =?us-ascii?Q?MGTZo6RGH5VB4FvYPRCXdr390s+BfrIaJlp+36byGwhUPME4WfdkZ6TdH3uv?=
 =?us-ascii?Q?qxT373AOyCIlYhVFuH+lkL+hQqiVe8G7SeWueF6JufpKS9VDakoxH/AVXh7+?=
 =?us-ascii?Q?x/rXVXhdcRcbXFSbvan5jQ2HqsIp40tijG/Ef5Tr2o6NKYbx13JfyJt+aykV?=
 =?us-ascii?Q?8P5bIv8OP57OH1l+jHTjOuCt95iwV9lO1mkeXgdx0sxufG3YqtbFZ7EhuZN+?=
 =?us-ascii?Q?834TalG02Cf817XG6G35IurA9ZsK/exqh4YVo2q6M/KeGMtWzF9N+89z1g2M?=
 =?us-ascii?Q?VceRdedNZzoF3QjDSLKfwcN4bq9PxOWPfCB7KmUdwAw6swBy8Ju248Q3Gd0C?=
 =?us-ascii?Q?RfZVVlu8u9OYmGrXmrMNMIJhtkWfJfoZBmWSqqPkrADMW4z1HTJpsy9yxFEX?=
 =?us-ascii?Q?46paOk8RTyQHDKOusclTDQzyGOXeNalScm52SnFqejREt6VtuHL2atjVkMjj?=
 =?us-ascii?Q?UzKhQnXlnKKPxFkJoLYQfuJ5WJ3YqKJE/Dhvc6ASpKp4cClzXzN2X8vjb+we?=
 =?us-ascii?Q?VkrGTNXdoGvcYxbugrUJL1gjh6DiD7ZPcQK+SNQOuhZLdVSwSPR46lQyWsYi?=
 =?us-ascii?Q?ia8jA7Yp62MTV0uYOOqRJ+QdcQTYQIdm+Bbc7fFJXJZ8l8NwsGK5Dv3BvCom?=
 =?us-ascii?Q?/3Mfe4c/XQeXZNXtaXScetUr6PQzB3vkRbP0QhSh4Hqga4+LJmlNduQQsL/D?=
 =?us-ascii?Q?kwIMvkCgszGczggbltiMYi0E3B1mQ7u7SH6ST1HIklkVlX/w+7SsiqkOoBUm?=
 =?us-ascii?Q?a47mXqYsoTASFFLjDg4T4+AUS2wS34GzUPB/xMuoB5TEos91+cXFHvZ73msP?=
 =?us-ascii?Q?eGUdyfdtWXCpVtKGoC8xwZ+bJZh5hUd7vr6XKBJF+RCm+G6yY0wPCnRquyWj?=
 =?us-ascii?Q?XxRlD9u4O8Kp9UayA2jsKcxybrPK9HDoGbqQ9ffg4NLspi90pk7N41hWUGZy?=
 =?us-ascii?Q?dFK/H+64GS8gA2fQynTEVhUn4RuAjXCX+W/it09gS80bkN54V4yun9zVMW5m?=
 =?us-ascii?Q?5GMcTXf29WOv2M3MTlORbpG7kNzomE0acTxe6NIAkpWJxL7Qd6O8qdBKEqRm?=
 =?us-ascii?Q?QeHKepDylPytnBNuE3SmNyawQC5CsaA/ulmT0VMiQEKqNRVQ9AA22q4vTvCE?=
 =?us-ascii?Q?B+2yAjLjcV85u1fiGbG57j8VJPIvUbBd3XYvrlvk8dBYY+CQBLwK6CCOC8Gz?=
 =?us-ascii?Q?oMFBPAt/VUe052iLDydD70za2/3dIJzfI9JxZ6K7oUnU4QCRZO9fj8v4Ds3b?=
 =?us-ascii?Q?qJX6IUs+hA7xBnYYFTOLaB2/cIfljdmvyRwWdLQQ1j2Kb0Q/iq9vqRIf9q/a?=
 =?us-ascii?Q?Zdj5kiqamhADhrPHS5rLQVbJBMTIbeL2XQG4UDOhyd7O88Lzp3NitwOucW8Y?=
 =?us-ascii?Q?0Ohl/4xSaTFMh8INfWmZIdiXxsJgX7QZ1+TCr7vXjYdtZUjIo7e1UJacMrk8?=
 =?us-ascii?Q?tMV14iBUENlhPhbW12e9kouyyt0DxmhxX1hA8PTp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b7fa4d-a2d9-4eca-399f-08de2145a05a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:13:26.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jCzmULhQIoXwC+X9QT//NwRcbx4wtRbrWtwoUIMhPB2CG8onF2sIxXRcsOUIo/LZg7u+T22iu4C/c9VR+Y4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

Add foundational types for working with C's doubly circular linked
lists (list_head). Provide low-level iteration over list nodes.

Typed iteration over actual items will be added in a follow-up
commit using the FromListHead trait and ClistLink mechanism.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/clist.rs | 190 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs   |   1 +
 2 files changed, 191 insertions(+)
 create mode 100644 rust/kernel/clist.rs

diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..5ea505d463ad
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! TODO: Doctest example will be added in later commit in series due to dependencies.
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+/// A C linked list with a sentinel head
+///
+/// A sentinel head is one which is not embedded in an item. It represents the entire
+/// linked list and can be used for add, remove, empty operations etc.
+///
+/// # Invariants
+///
+/// - `Clist` wraps an allocated and valid C list_head structure that is the sentinel of a list.
+/// - All the `list_head` nodes in the list are allocated and have valid next/prev pointers.
+/// - The underlying `list_head` (and entire list) is not modified by C.
+#[repr(transparent)]
+pub struct Clist(ClistHead);
+
+// SAFETY: `Clist` can be sent to any thread.
+unsafe impl Send for Clist {}
+// SAFETY: `Clist` can be shared among threads as it is not modified by C per type invariants.
+unsafe impl Sync for Clist {}
+
+impl Clist {
+    /// Create a `&Clist` from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    /// representing a list sentinel, and it must remain valid for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - `ClistHead` has same layout as `list_head`.
+        // - `ptr` is valid for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw sentinel `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.as_raw()
+    }
+
+    /// Access the underlying `ClistHead`.
+    #[inline]
+    pub fn head(&self) -> &ClistHead {
+        &self.0
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.0.is_empty()
+    }
+
+    /// Create a low-level iterator over `ClistHead` nodes. Caller converts the returned
+    /// heads into items.
+    #[inline]
+    pub fn iter_heads(&self) -> ClistHeadIter<'_> {
+        ClistHeadIter {
+            current: &self.0,
+            head: &self.0,
+        }
+    }
+}
+
+/// Wraps a non-sentinel C `list_head` node for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - `ClistHead` represents an allocated and valid non-sentinel `list_head` structure.
+/// - The underlying `list_head` (and entire list) is not modified by C.
+#[repr(transparent)]
+pub struct ClistHead(Opaque<bindings::list_head>);
+
+// SAFETY: `ClistHead` can be sent to any thread.
+unsafe impl Send for ClistHead {}
+// SAFETY: `ClistHead` can be shared among threads as it is not modified by C per type invariants.
+unsafe impl Sync for ClistHead {}
+
+impl ClistHead {
+    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to an allocated and initialized `list_head` structure,
+    /// and it must remain valid for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - `ClistHead` has same layout as `list_head`.
+        // - `ptr` is valid for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.get()
+    }
+
+    /// Get the next `ClistHead` in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe {
+            let raw = self.as_raw();
+            Self::from_raw((*raw).next)
+        }
+    }
+
+    /// Get the previous `ClistHead` in the list.
+    #[inline]
+    pub fn prev(&self) -> &Self {
+        // SAFETY:
+        // - self.as_raw() is valid per type invariants.
+        // - The `prev` pointer is guaranteed to be non-NULL.
+        unsafe {
+            let raw = self.as_raw();
+            Self::from_raw((*raw).prev)
+        }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_in_list(&self) -> bool {
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe {
+            let raw = self.as_raw();
+            (*raw).next != raw && (*raw).prev != raw
+        }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe {
+            let raw = self.as_raw();
+            (*raw).next == raw
+        }
+    }
+}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned `ClistHead` to an item (typically using `container_of` macro).
+///
+/// # Invariants
+///
+/// `ClistHeadIter` is iterating over an allocated, initialized and valid `Clist`.
+pub struct ClistHeadIter<'a> {
+    current: &'a ClistHead,
+    head: &'a ClistHead,
+}
+
+// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
+// which is Send.
+unsafe impl Send for ClistHeadIter<'_> {}
+
+// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
+// which is Sync.
+unsafe impl Sync for ClistHeadIter<'_> {}
+
+impl<'a> Iterator for ClistHeadIter<'a> {
+    type Item = &'a ClistHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Advance to next node.
+        self.current = self.current.next();
+
+        // Check if we've circled back to HEAD.
+        if self.current.as_raw() == self.head.as_raw() {
+            return None;
+        }
+
+        Some(self.current)
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

