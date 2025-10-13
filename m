Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01533BD19F2
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38810E3AD;
	Mon, 13 Oct 2025 06:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t3nhfoqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9FD10E3AE;
 Mon, 13 Oct 2025 06:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLGMs8i7xa76rvnZ513iLz3zpQZA7uyT3OgSrbjnHpTT68w4mie0z5HU5LY8I2+57AIvFF5ycGnVkqYiAf1HcG0jtsljgqsv2sqMMFzBpJz4Djpx9mjWuLiCNnzIjJ2rJqMsur/FslYicEVX+yDGtiecAZLad2a5Rgd58p4vhvxUKAX6Bc9kkwtYWI+83tV1xAPT10enW5Tk5zSw3tYD9CsuKwjPnY4/Nro8/XN3oIoMf7XSKg9Sl4mxIKoji50UHEkfJcygqR7TFfIrebKHebiH9MfRv4VaWTqPfqBlDOZRgJmuB2lqrCxyiSLgHnEM5oXekTRue7zIi9zxy4bkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+9FiH5WbUQlrE/AjGKnyVpK01q0qgRQswIGfIy4w98=;
 b=uJihuvue3iyxJ1hxSw+Px9cQb2oJPtvaJwHRehbiAej50geSjW42vPhcthF3kIBmCPyjTpSUa6vz9mV/QZEV4rUyyJajdioPw7+elLZpiANyfshPHKyTbEx0m5TuEi7xvD2A6p0HRvbBYMPwEd3iuzFTUGQyl8upr3PTIia6gAzr51gfmvrw7lcxNBT616BS1yDHKJQdnD8lQjNP94c0DPgOqknYolhKp/z9ZeusPS6c9MCNhUGTZgC0yepLHBy+DpT1d93Xy59jpkVe2ni+CO2dnQJnAeSi6PUFscIA8t3rgi80mkDeqnDuPZ+IMjKtF5oaq3YMJ+4h/pHNquDrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+9FiH5WbUQlrE/AjGKnyVpK01q0qgRQswIGfIy4w98=;
 b=t3nhfoqKATjWOpylWB8vu1n1m7FOUlY8DiaO7+4P5ULRqNG2uW9TU+2/SYmGAkcGT4UglqQb1m/HaxSQX1Ve1VDUx8gI2qZiVXsfHgC5ijtO0cERZsROwuv1P6/xHI9+0+BwZkzZ6ue1IBOUeyqnIuyk0klfY2f7fxD8gWY/rlU+YbLwgSMGgvTs6fUGOHOMg9ddNJQRKyXepP8M4SCT9pONhqxURs5A6L9ZRnVdqneoa5Q5Ep6Q5VjuH5lIgyfEV9ZD7uaIQgFtYBLFas2w/A5TBjgWFeNSqTJlHnA/JLiggF0JdCRCMGxt8iGjFGiqWFZgyunA/kZ3UhPQYuo0Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:06 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:06 +0000
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
Subject: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Mon, 13 Oct 2025 17:20:30 +1100
Message-ID: <20251013062041.1639529-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0021.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 35737d06-b760-4af4-7c84-08de0a20b13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ezubPGF5Ijz4WCoeJSD69ro1hi3SEJICAybxlibeb4A5vv15XXVunl35Xl6v?=
 =?us-ascii?Q?expgzAah5HS57FwTeFFXL7SKB9Snny6bY221SGD7ezghDEhe48yQmDJsVvt9?=
 =?us-ascii?Q?akXunViB7F+1k2LxAO5b70TIC46YAAdPjoFv5PDChRZpxb8sQj1nkrUZpPlG?=
 =?us-ascii?Q?TaHpolDisUyYnXrJ7cFY+KlBIcedPQhpfE79ZCCcOBj8GkIrYyZ6sxRy6+X0?=
 =?us-ascii?Q?gJ/7yAoCQM2slnKjH7463yNqnjIRpG0+AFkwrd7hAnktuv1u+Zv68y+5L3A0?=
 =?us-ascii?Q?iRaL4DkYxsw1rSECZm4mdpODxcwvhIA467ZHqEMa5JoKgFbI913oHNNRdAWN?=
 =?us-ascii?Q?FptQypivLyNp8IzdKDcQUsJIWqImvgZ1rPnZclQ1b/mx0bzIKBIagIDFjE/F?=
 =?us-ascii?Q?vRi+Hzkk4nilENBsNspMMKTelgSRms4hTfr8X+pQBBE9/KgBcjqq6PoHORV2?=
 =?us-ascii?Q?m9/K8vrXO5XK8YBRat2qbuWsyvdpjiRAY7SvGT9Mzmki2xFqcRgYe1duumiZ?=
 =?us-ascii?Q?85NCcSmPDSy5LnowIyzz0cB3tFju5RnXhqiOBd3zGTJ1+DjYC4VIzOuFZsoR?=
 =?us-ascii?Q?wN8T2z+CGJpRoKXyo4t0TGxywW1r5A1opIp+tH9yajfP2IqSMznN1BpieHCY?=
 =?us-ascii?Q?DEcMLH7cWkVj0P79Jakl8JVooFYJSmI/5/URMUym7uanuH0WSA8kC1nLJBu2?=
 =?us-ascii?Q?/mjEIKAszYqRxoUrU67WDH1Fh4atwhSwH+FZES7gJ1oaye1p9BkofvcNrlmZ?=
 =?us-ascii?Q?z8h+2cOFJKa+saXr9lR3yssKolLVJ64lAsy5YnYP60MyxASqUL6Nzb/WzQc1?=
 =?us-ascii?Q?he87rzwjIysQVYMbtipwpaaAaadxE4Jy7/ZxbDVgq1bFRJ8rS6JwFmjsloPK?=
 =?us-ascii?Q?B+tt5IcfaI74P/XXBprf1ncdxjM2rkcRkYBzJN+yoC0aBtdpT0pDf1onaZqM?=
 =?us-ascii?Q?4RU2mI4WQvRmBnbAtQNS9e8Baj7TkWyCBD4+d7wi79e99RLMaaPRNVSEFHsj?=
 =?us-ascii?Q?uN4A0aRtRpkhw6nQ7wQvIo+SDtuRdsqVd5mSgIIvO7SHD7nK0Qonp1gIJ1ZU?=
 =?us-ascii?Q?zgPyVkuzaHKnYAlCN0Ae73eMsOOKzlhHnfmH7gvGXisx26FrOD7JekmUg6Al?=
 =?us-ascii?Q?0H5MMSgT85vbUt2dWHn3wwy87oZ1k1COioiiU0P2qnuaoM+8caoA0p4BJm+H?=
 =?us-ascii?Q?4egje2yEV1p7rFir0iwnDQmmWnmUZ8q51UU7kBeiTgZoO75sIWaPV4ljMe2O?=
 =?us-ascii?Q?zwUFoi5tKY47qMhTmIaVcb0juVNL66G26ZnXAg6LDxc5CDIXg5XlCyUBumJ0?=
 =?us-ascii?Q?TvuDkJRS6l570UvoYFGr+dHQOvqqt3DG2ZTwNr0bMgVhy5V7iV35Ce3n4hCq?=
 =?us-ascii?Q?QKOpnL0mRWxhylq552PV/BgAaudJp5x0G9iynJXSseyKBDT80f5+DEBFSiEn?=
 =?us-ascii?Q?tX1gypzMs8c21XaFEqYcgFGox4VPhxBg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PIWIechfUpMk8dG+8E+rCAVF5J7U5QTXNedGws7Oi3RBOJfwZ3c2qGOoqJbB?=
 =?us-ascii?Q?enAUVAYKt/TkD7HZCXTg3m6OJfWzgxkGBMEenMC1SJIKrP6a7/aozH3uljD4?=
 =?us-ascii?Q?ZbcEYecgEjp7NIXlB1e6rx9cQq0Vvjo0RUrNtU6pgqiQ4wfKt4qJ5T+u+g8c?=
 =?us-ascii?Q?qjtsVA567MgHMGF8GXXAXsl/uWgwnktuksFhegDnYB9NSODkWEx0ViK8vJvV?=
 =?us-ascii?Q?eQbiOKHx1bXERCz8W5vhP9I6fKbGS6a/euuu0wVgd7xgzzsAlciDGVu6vmzk?=
 =?us-ascii?Q?INCFRnalMw6/7Q+ONXP5m86vMRfxGcTVRSCfJtB2Eq8g+HgXt/gK5meYBZJd?=
 =?us-ascii?Q?9OzeGYPoP/ww/FLA1lbjpynNubZIiupfA557gwbDZCmAty/YZYJniROOsxku?=
 =?us-ascii?Q?JhzRcdbiJ7DIEgLgtnCzAorm90HFl+MwmZgE1M+s7ZHLRCSjb5Hpz7pOdh6g?=
 =?us-ascii?Q?m0V8ciAv3gddOyNr0jEj6ZWq3fLdQ5Eqgk6F36nbP/raaUTGAbaCgKUg9MK2?=
 =?us-ascii?Q?nLj4rFJaadZTL2ozozu3Jue/2Lczrv81air7WxB3y8X9uEa8FcBWpk8NcQkL?=
 =?us-ascii?Q?KuJPUCe1n/I/HZrusFowTy7/qVoszyTT8O+18oUiBij4DYv5Pr5D7tyrB5BU?=
 =?us-ascii?Q?8mSBb4AKPsJ0w3aOu0G/l3BcXj9kITCP3lK1+VJA9trYh0cwTh2DMO3dEfrA?=
 =?us-ascii?Q?6JRs6nv9JJ97D5RSqjWE23rMhwcCsAfl2dxznbMhOKdImDbwoZNvuqGw9t6E?=
 =?us-ascii?Q?hHa+suAPiCRQosvBQUMfpWAgNd2COWuTK+g7S7G4bq/oFXT6ehdtWwCp5ymV?=
 =?us-ascii?Q?8gJPU1MwbD9kJBOx+eiwL7bQPz2tRbA/d6gV/tUbkQSA90mthxpHQZbOq5S0?=
 =?us-ascii?Q?/MZlcjeh84zUwqLCVY9GAchvlPvKn5q/VwWODSo3VepGz2ZWySr126yclb4M?=
 =?us-ascii?Q?MfX3KrJbfBXpxtcfBxP1kj0aWFDIHh1UZDFN/CfSrux6CHP5zKclWFsEJaVs?=
 =?us-ascii?Q?9q/R/o3FlujFT2dLvp1akIeu0K4aGr1HqOLNS5eqhWRvgPTusX82vauJpBj5?=
 =?us-ascii?Q?sy/7totXrjynZK6bhLi29zp+IAxhvmeZoK1Js7jVU7DByFyVGpMtx2mYlhEw?=
 =?us-ascii?Q?k3dR1/NjSSWvavpfADEaE3oyGEk7ebiVm1Uwg7faJcllbu8hoFhrUzNawI2U?=
 =?us-ascii?Q?oCFk7JJCqGz0zbkMugAXe99PriOsB7LRjLDtlPyg97xb/M3VkexS0/DY7eT7?=
 =?us-ascii?Q?06OJ3dxva6rGTaWcpPgpISFFYx4KFSNXVsgQs/jJ9TA8E1WEA8GqP9bqNb+k?=
 =?us-ascii?Q?hqqd99fdhuu28jPexj6rGIPe6JFvqPraptKQkZ0BWCr9qA1mtbR1NG1qhBrq?=
 =?us-ascii?Q?tO5s0UihLpDhCf32eItWsXE0vo0f/36QGXljpnMxkXKAok8dBJ692YMbDkiY?=
 =?us-ascii?Q?x6HihlD7yvY2QASsRuj6UFge4jCS1BKcJYQ6sZupMir3QsxY7P0zua2wWg3K?=
 =?us-ascii?Q?htBh1IZU1gsDs56ZaFCbIMJtYXGERn3qf8J0bp7hmksw95H4Ty+rqUPeQo/A?=
 =?us-ascii?Q?7NNbd6q+/gh8BvPrTRXSgoD5XXz8f7PZdoJ8Xy+k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35737d06-b760-4af4-7c84-08de0a20b13e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:06.4022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isJXCtN5DYlWVGsYwQ9JNgca22WbCWWic0z4JYUYc1e3gc0wv4CStDWinJP+QJBxoEstDk3axJ8bRcne1Mr9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

Changes for v5:
 - Typos
 - s/ETOOSMALL/EINVAL/
 - Add documentation
 - Fix up examples

Changes for v3:
 - Addressed minor review comment from Lyude
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 218 +++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)
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
index 000000000000..d9c412a68bd8
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,218 @@
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
+/// of the same length as a single stream-like read/write buffer.
+///
+/// # Example:
+///
+/// ```
+/// let mut buf1 = [0u8; 5];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SBufferIter::new_writer([&buf1, &buf2]);
+///
+/// let data = b"hello";
+/// let result = sbuffer.write_all(data);
+/// ```
+///
+/// A sliding window of slices to process.
+///
+/// Both read and write buffers are implemented in terms of operating on slices of a requested
+/// size. This base class implements logic that can be shared between the two to support that.
+///
+/// `S` is a slice type, `I` is an iterator yielding `S`.
+pub(crate) struct SBufferIter<I: Iterator> {
+    /// `Some` if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    /// All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator,
+{
+    /// Creates a reader buffer for a discontiguous set of byte slices.
+    ///
+    /// # Example:
+    ///
+    /// ```
+    /// let buf1: [u8; 5] = [0, 1, 2, 3, 4];
+    /// let buf2: [u8; 5] = [5, 6, 7, 8, 9];
+    /// let sbuffer = SBufferIter::new_reader([&buf1[..], &buf2[..]]);
+    /// let sum: u8 = sbuffer.sum();
+    /// assert_eq!(sum, 45);
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    /// Creates a writeable buffer for a discontiguous set of byte slices.
+    ///
+    /// # Example:
+    ///
+    /// ```
+    /// let mut buf1 = [0u8; 5];
+    /// let mut buf2 = [0u8; 5];
+    /// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+    /// sbuffer.write_all(&[0u8, 1, 2, 3, 4, 5, 6, 7, 8, 9][..])?;
+    /// drop(sbuffer);
+    /// assert_eq!(buf1, [0, 1, 2, 3, 4]);
+    /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
+    ///
+    /// ```
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
+impl<'a, I> SBufferIter<I>
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
+                None => return Err(EINVAL),
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
+impl<'a, I> SBufferIter<I>
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
+impl<'a, I> Iterator for SBufferIter<I>
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

