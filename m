Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C0ABAD01D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4F10E5B3;
	Tue, 30 Sep 2025 13:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ds6WH1bJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012031.outbound.protection.outlook.com
 [40.107.200.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579B910E5B3;
 Tue, 30 Sep 2025 13:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSwqZGTsoFMF87ZnFSum6qE82P5I3S7YsjRLYIPnUhMBzzE3cuzaUgLgixwy6DSW1SEgL24MikIXz3yhoSaEYx3CriNRwuZad0NEH/Lnjq0RAtlmU/RIljuaTp/VQQb4IZwOuW/VNmTgoksKXP7yCCMZWDyffrrwioDlVR12nEu75xTWD9ngo6EYPuSs10/CswrE+fpXy0YLdpyKA0kJxOVzKQ1iSfhaElFmaU/Un05NerT4t3lI9DSdl9rBNaU4JrYZZZkRpiqbH5vp+o9j89st/3JRv6BnwmePFZ7ZuC8hxGK8D5mb17bgPe/IFjzVsyyfWS9lPwJcTTx1gWeMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOWlqySJYqmaqVVjJ9kbX2P7Epwe6TjAUQ7JG9gSIjM=;
 b=chCHIILo8OAF84fzWz7rMR7HOz5qhKudpSjRjlKxKAMAKFmxheRmbEQjz6Y77N0FzT5JrWrznhxzD49aDt3dFUZWeQctUpRdFl4gZM9k8QIkzv+gfFAw7M59TnoGzPPDVBSTKidxWtxT5ogOYT3WsbQCLh74dTDad98O+LbYiQlvQveRfMsbdxtm+j21r9Ln+KWhYlJ9ROXrvLRXuX6oSPX6E6+pxSq5RzSR5xEwt9ynqZZbOkEiNJUMB90wurgJHkhmz72KwXhRKkit/r+OEmxOu2oD9NnLotCQvg4oHtqDGUzXvdxr6cru7iaX7SQ2RkQ4p09pZvKxIY7AC6uVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOWlqySJYqmaqVVjJ9kbX2P7Epwe6TjAUQ7JG9gSIjM=;
 b=ds6WH1bJ+953XzfPpfTq9skIiZMfGPGbErqZ7xLKHRtwrhNDVbQm8czJaSMKiOSeWUDfRgUr5vt3WYyvZ2MIduXaqIFl8V1yEaFytEmzMwl2WjOkyxxNC8qorqxziuivuQSRg4t55Lh9GTHFMRVRqLmOxE54c4bj7oaI8fMEFEZpaOlu3bUtAnhGETZkN0xDh2SPK1TNVaFQFfI7KCB70NhaVZyC6cLzpGE+HY0iumXjvAwHHF1nL2fwA+nBZnj17raN2k5G7/yfK05vn8H3Smys8G/EwqcuQ/Q85Q4Q8XQ8SkdHwokB2bi4dChfFSBm29VoB7m01b5jC4WWOXWaPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 13:17:17 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:17 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Tue, 30 Sep 2025 23:16:37 +1000
Message-ID: <20250930131648.411720-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0097.ausprd01.prod.outlook.com
 (2603:10c6:10:111::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b96447-25d6-4146-7462-08de0023ad8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SPuakh1wckYXXatEGI9cIFFRfRt91CuFxHOY9lgIkzeqKK5D/TugtPGiYRAX?=
 =?us-ascii?Q?g2f9tWDcDHp91C2wzhhzYRPVLMb1AX3i/jVa4qeSM76kjdf65aOTZXWAvik7?=
 =?us-ascii?Q?OKtf4H7lnLJpWbOSNhfZpPS+oWt9YV697yVaCnUlxksKkwkxahz/QqHk1o62?=
 =?us-ascii?Q?djZztG4+HV/xKLWk+ckI9vDqkkifpdO4r7mnxduzLhurQLL7WDBBGrE0P76W?=
 =?us-ascii?Q?4skesxQMNwcRR+yCP7DJFn7aSY2QFtRqz1Biph5e5r4xbcMj7a2lJdRQHL2A?=
 =?us-ascii?Q?VrEq7vXtLdFNzQ8OujxuW8XIDFzOs1/Q/V325QY7rLYNztNX4at7VUE19Jc5?=
 =?us-ascii?Q?0YlcxgLKZqQTYZbD/fY/HlXDLoXMew9Vihhn/GGckndO0ITFyxdxAQwClSRe?=
 =?us-ascii?Q?nvQ7oaNrlhFCmoaizT60TBeyMk+p7VV/M9LuUBJ15exXhCBze1ysdKsKzRoD?=
 =?us-ascii?Q?b6zBWolxgA9r+bJ2T6OfTSce1hzm9mQ9h/UWSwDi9YqnNVOtqdPV9uMvXfQX?=
 =?us-ascii?Q?IvzVaqA/WqeX0GbNd5X94LWTizqUXkASdihGs8LjTRJdILneqHgfC5jT2sKn?=
 =?us-ascii?Q?2/AacSOKwLklNUpp163zzjQBDNSX+216SbjHep1oXAStHj6n2jnPgm/jP6c3?=
 =?us-ascii?Q?tzkFAzz/+wXPNdbO+0WO4JF5/p3EE+HvzD5m+G2KLmJUFdU/ynxzlk0rxu6o?=
 =?us-ascii?Q?JkBdpwqfOyNxaKF7ggPibbULDw8RcLAoiuZhd93wwW7KipcNFYh+1qq5A111?=
 =?us-ascii?Q?Wmrz0dbZFjlkCIlsCLBM8RcYcv737opSxzZtmXRlEV3oJ/0r8OXz5vapFa02?=
 =?us-ascii?Q?Wz1XvzaIZ/HvnyW9RFNZPBvuqUXdec1pw3bvGrBp5QhDk46dTSH5qiWHfvbM?=
 =?us-ascii?Q?3jE2DfZNJaxx01qKB/vwx3ZbP+1B6YdUqEthwr+ykxHR4aFzI9bhCv+tdMUn?=
 =?us-ascii?Q?XDj5DrjKCNGcQqK8lkW667y09ndW9bi6b/d3WXoDAO3w4KYlWLRLpEP/vrh4?=
 =?us-ascii?Q?PTxI7GK6OFyZ+G31RUGyiCxIv2hoGzaCsGEaNMdWq+J1xwfYjm5lwH/FFiOK?=
 =?us-ascii?Q?bkvt7Fs/bxUgxCccYz05sdXxZlG2SmpkDhYreOf+0z4BVXNPN/Fqk9v71zPO?=
 =?us-ascii?Q?jvmDn4EUm1Y8kAWIDzbRWPmvsYbhxq/GGnOoiFC7uGfxQIjTeP8jeAQ95z9x?=
 =?us-ascii?Q?gIdn/cxSqFA8+FbYCT6nj6JVPFZblgYV02SdiG6ghpUMWdWJ+8qe4An9UHHJ?=
 =?us-ascii?Q?xrsH7Na3RZ9RUXnqbpKmsKdxUzpIwQIfP3+mUEKe7QtBkWDX5ogGFZxLqvIN?=
 =?us-ascii?Q?RQCf81dSUkBR1qqG+d/QXsopQdN3avCRfw4cXi3hj6qb4Vr5BnWcjazzLeVM?=
 =?us-ascii?Q?HFYUVHt1Y6ILjWDzYxCg93WFOAzmSrJctdhsOb8ll52LTKX7xMQd4PsrQQ/m?=
 =?us-ascii?Q?LluPeMnveyX0vOZk38dhmixJGqo8CR3k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8CGaPBUihZzfvSF3aeDU9mwD48zM6WcDzZfXvdeFK8/HYv8KAxy3LYjlmoO/?=
 =?us-ascii?Q?6I6rfqTBujMWU8vpqMmGSEOChXmP/PZVeS/+tR0dq0eV7rpSIhhxgx5vyhut?=
 =?us-ascii?Q?uM/EDAKrRKREq0WNOhA5DjfXQ1MlHA0womC48zgAAyRevAtYuQXtQ3/VFiqM?=
 =?us-ascii?Q?K3rtrTd9+Gv/PmyC8Npjwf6tez10XyoiBzO6Os54m4d2sPc5QU+SIy2H8Jv+?=
 =?us-ascii?Q?U/c14skuZhP99hokxJKLylJV9C54uGE0ayIygF63LMXfJR14Y9gOJt0isl3n?=
 =?us-ascii?Q?XzdXLLI7dVK6T9gabFPFvRlQMMyP4qx6HOzigtkVZUFyQiR70JkQoIg7ulH+?=
 =?us-ascii?Q?hBSiETCGwqYJvRcX1gg8h2w12fHid1iGNnc6wREmdLfysKezczSjOq2sDNrP?=
 =?us-ascii?Q?F/X2NE7UhJCOdcm6ZxcXC5Gd6iSblgZpIYsKIVzjUzKuZOxCquFrA+mLp3Wp?=
 =?us-ascii?Q?/Cercibv/x2HWSegC1X/v2H82NdzHBneX59iJgWusICVQgIrTtYdX2BSMQQ/?=
 =?us-ascii?Q?hnzNuniA1gkZCY/RY52Is+O1ZecEEUsxjmBSIWHnVWJq04MO19gv+B0jsZqb?=
 =?us-ascii?Q?+5OnT1qgwdG2lnSIizgDk0lLjRNHvB4pGY6ETOfbf7Cv2x7FZHgOUkccXb41?=
 =?us-ascii?Q?R6aNhmqk2NLBnSDKBMvt/aOSXxES0w9p6Gaw/MJfuHdxQSjcE+7qs044zHu9?=
 =?us-ascii?Q?F74JtCkpegbK5kf21rDvyU4qKdp87o8XL/22VHH4M2sz6NOYf+OnAkwu53ux?=
 =?us-ascii?Q?sjTMorp+I62fxmQwRfRPvVtxVS2ccQ7PPZy5RgN1lXHIPCjGgUGqTxkiAPo+?=
 =?us-ascii?Q?z5Wp1LrCQWkW4HBZQFB6KUVJYhYkmlpIm3E2KEg4/M0HPn/eab3fnRq6/3Nb?=
 =?us-ascii?Q?VT4laF/u7DpiZPzyd1XlR0DSmBHfV60YaWW+GcM3AhnALj/WswC3kQbeUoEH?=
 =?us-ascii?Q?GB/DYVFMjG/1FS4KPy5jde3WeCw0BXLL4S6Z/lO7meaWea0htGGWa9mR5ReK?=
 =?us-ascii?Q?i6pJeP/3rpTctiYbS3/p79t7CEfJ4NqvtgVbskcAtehwhuK5a59FvtN3JntL?=
 =?us-ascii?Q?Y1GneNj3bY/l18zic/eUp7o7xoxpxt3bJG3CpPVyAAJAyQFUI8/siwmzbtmx?=
 =?us-ascii?Q?IksJlkRsiw/dnWsNHAdoCcyd90HnKnQcDj5n8EErTOz77roVvTT82tlQol3f?=
 =?us-ascii?Q?ZR6VRM+0PWC//+wUYQ7d627S53+seF2dxXhD8TOkTp6vI5yHoJJgKDBDiPsA?=
 =?us-ascii?Q?PCeLcBEamudIC14j5NIb4yIuQ0EQ+l4m4MtXsHFkbOKlxorWYo8JA8Z/IPNb?=
 =?us-ascii?Q?RdcS9jgwAnG7IuvbXcmnFmvSknGxmx5w8U+4Woqeu+bJQ2uy/KxCRcjqRDUQ?=
 =?us-ascii?Q?zq0u2ken96kAzO+gT3ih36L+w+St2jziR5O/ZqOUxAshQSutIGsWe5egut4t?=
 =?us-ascii?Q?cOwTOQaOc1SBIQPansPuuZBWlb30NwqqUjuXDeEw2PvVC5GQIrQOLVuP18EM?=
 =?us-ascii?Q?v8GTe8RF4O37tKbWVK8R41X5D0FS7UzYRqmsejg32ysIlh4Z1I7qpIXHiPwH?=
 =?us-ascii?Q?d6UHsfz8OA5TFOSEqTYvWDhkm52t+HA3TDVjdl1s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b96447-25d6-4146-7462-08de0023ad8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:17.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijPgBkQUp2OGxbs427VeNl7REe+xt15Iju98IEJ02CO+YyrvmMI9V0may7atgLNB5HBbYbZp0Luqy1RJbxcm/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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

From: Joel Fernandes <joelagnelf@nvidia.com>

A data structure that can be used to write across multiple slices which
may be out of order in memory. This lets SBuffer user correctly and
safely write out of memory order, without error-prone tracking of
pointers/offsets.

 let mut buf1 = [0u8; 3];
 let mut buf2 = [0u8; 5];
 let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);

 let data = b"hello";
 let result = sbuffer.write(data);

An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
gsp.rs: 37 insertions(+), 99 deletions(-)

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v3:
 - Addressed minor review comment from Lyude
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 191 +++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249f..a6feeba6254c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -11,6 +11,7 @@
 mod gpu;
 mod gsp;
 mod regs;
+mod sbuffer;
 mod util;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
new file mode 100644
index 000000000000..e82f9d97ad21
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Deref;
+
+use kernel::alloc::KVec;
+use kernel::error::code::*;
+use kernel::prelude::*;
+
+/// A buffer abstraction for discontiguous byte slices.
+///
+/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
+/// as a single stream-like read/write buffer.
+///
+/// Example:
+///
+/// let mut buf1 = [0u8; 3];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SWriteBuffer::new([&buf1, &buf2]);
+///
+/// let data = b"hellowo";
+/// let result = sbuffer.write_all(0, data);
+///
+/// A sliding window of slices to proceed.
+///
+/// Both read and write buffers are implemented in terms of operating on slices of a requested
+/// size. This base class implements logic that can be shared between the two to support that.
+///
+/// `S` is a slice type, `I` is an iterator yielding `S`.
+pub(crate) struct SBuffer<I: Iterator> {
+    /// `Some` if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    /// All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator,
+{
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    #[expect(unused)]
+    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a mut [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        let mut slices = slices.into_iter();
+
+        Self {
+            // Skip empty slices to avoid trouble down the road.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
+    fn get_slice_internal(
+        &mut self,
+        len: usize,
+        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
+    ) -> Option<I::Item>
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        match self.cur_slice.take() {
+            None => None,
+            Some(cur_slice) => {
+                if len >= cur_slice.len() {
+                    // Caller requested more data than is in the current slice, return it entirely
+                    // and prepare the following slice for being used. Skip empty slices to avoid
+                    // trouble.
+                    self.cur_slice = self.slices.find(|s| !s.is_empty());
+
+                    Some(cur_slice)
+                } else {
+                    // The current slice can satisfy the request, split it and return a slice of
+                    // the requested size.
+                    let (ret, next) = f(cur_slice, len);
+                    self.cur_slice = Some(next);
+
+                    Some(ret)
+                }
+            }
+        }
+    }
+}
+
+/// Provides a way to get non-mutable slices of data to read from.
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at(pos))
+    }
+
+    /// Ideally we would implement `Read`, but it is not available in `core`.
+    /// So mimic `std::io::Read::read_exact`.
+    #[expect(unused)]
+    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
+        while !dst.is_empty() {
+            match self.get_slice(dst.len()) {
+                None => return Err(ETOOSMALL),
+                Some(src) => {
+                    let dst_slice;
+                    (dst_slice, dst) = dst.split_at_mut(src.len());
+                    dst_slice.copy_from_slice(src);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Read all the remaining data into a `KVec`.
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        let mut buf = KVec::<u8>::new();
+
+        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
+            buf.extend_from_slice(slice, flags)?;
+        }
+        for slice in &mut self.slices {
+            buf.extend_from_slice(slice, flags)?;
+        }
+
+        Ok(buf)
+    }
+}
+
+/// Provides a way to get mutable slices of data to write into.
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement `Write`, but it is not available in `core`.
+    /// So mimic `std::io::Write::write_all`.
+    #[expect(unused)]
+    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
+        while !src.is_empty() {
+            match self.get_slice_mut(src.len()) {
+                None => return Err(ETOOSMALL),
+                Some(dst) => {
+                    let src_slice;
+                    (src_slice, src) = src.split_at(dst.len());
+                    dst.copy_from_slice(src_slice);
+                }
+            }
+        }
+
+        Ok(())
+    }
+}
+
+impl<'a, I> Iterator for SBuffer<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    type Item = u8;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
+        self.get_slice(1).map(|s| s[0])
+    }
+}
-- 
2.50.1

