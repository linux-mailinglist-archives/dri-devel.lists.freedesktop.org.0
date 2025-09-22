Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81486B905FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D125A10E434;
	Mon, 22 Sep 2025 11:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AZVw1ob8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94DA10E439;
 Mon, 22 Sep 2025 11:31:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3Kw2FbbEPV/WzNf1dhrZSU9cgSN1jfaAQfa82IMQnZk2Jvt3HwBVDjc2arX9C44SC1evpYxjKM5Ilg3hjQHcFWJp50E5apntvgsxorLwv1Ypjh2etRsqFYZqnDYOR6WYv00sQTs6gsCF3d6PSn8tlA6+uv9rEviINGVzjSG7vtpLhOtjEd5ax5hC9tGM7zRYXDST/QFv5w0MsIOjaq/PB2D/UE4vVHymzO1g/4nwbuddnpcrLj1fzB8wd+MkCviZTVNfEiIoC9AX9wOn+Dsu2UuHWa1llHoFzuLv8GkYsOkRXuTo6s7L5ILcE2+UstNrpRLaN8H2wS5yjvWRpWB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNHhAF2+/Zg2qJmdhxLn3Rxtezhfa7hDgLnZnW7aJNg=;
 b=Br75FZJCuau9yjknmIYw60Mvy/D52RReen1QPvJ7176hCkkjNj8tToiLtXtOdzq1G/c7rM+BbnhT3a2b03dC4C6tecs7vHefu+NIR3MS5oVoGohr3reVBLDSefw7AKLo/qFdJkoXR0OGcOwAKa8u021UTHr6V60wL+sd00onSm8/kVCafufX9t5Hf2OucrslIz8TdWE+RxMAfFRm2ERAzgVYaU+4DLD+Pzhs8cNLVwngnCSaxFbNeiDqjSzRo1bhulJSl4P/gzMNnHyaXFKkKqaVSyFYLIkRAHCvhvrS/5J6DoCPeDANKEgjH65tkKndVz/aU1vD8pG7yPTc8hbd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNHhAF2+/Zg2qJmdhxLn3Rxtezhfa7hDgLnZnW7aJNg=;
 b=AZVw1ob8tB/IvGKwBb/3Y6eyZ+4taAoxuzJVMVHTH0kJoVNXwU1hbmXWHeodvWY0oT6BOWZhQ7qN5neUIB7gXAl8qZ5MHlWqzxLU9AfbB8X4wUdmml8M5+CgGJNKjfU6Ty62uLZLTzxMHFv3KXHQru8nNm1asIsrY8co0MCSKk514scY9wp2H+75tLlPSBG5wT8dwHXwKXwr67mFFeQImfSSIMoEv2Qx394Xh6C4KAybJOdAppTNhJgbJeWwr+pF6Q9FKH9HaoIB5AA+/veEa1ETcmAGN5QNGWL6Y6puHIhVJeYGyGMQKGmBuGP1AHdgkUGYE9xZEqKdd5xVET7bXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 11:31:04 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:04 +0000
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
Subject: [PATCH v2 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Mon, 22 Sep 2025 21:30:20 +1000
Message-ID: <20250922113026.3083103-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0038.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: d4238faa-9a6d-4443-1d64-08ddf9cb83b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oVEqa6fohGUkx2SAnwvl4KAnBmDjF2a+WfdU2xA2vVzA+e1YDG3GjDyqdX7V?=
 =?us-ascii?Q?+lnDdVhtKvtjdx5l5SHmFc2D87EGnIeknhqdtf5TM4GYTRGPdJgGcX0KMhQr?=
 =?us-ascii?Q?sHOiGD2NelczaAJWdWnRI3hScbIt1f+0Jkw1oUdLCAX6Mg7NdhO952LpB8Qt?=
 =?us-ascii?Q?iM1WQaoTo20d+y9hDQYgWa+2fK5APBRWg9+tLGj2/VHYRT8hfIGquxisS9w/?=
 =?us-ascii?Q?LcdG6F4POC43pHS+LX8+RGsWr0DVQLpf6AFFcF1bOKklVTJsWXeUlTW0eqgm?=
 =?us-ascii?Q?cP4p9aUk2Wkad6SI6RKKZ8aI8a5ZR3+4g/of68BCxS7N08pnipSpo4YHv+cF?=
 =?us-ascii?Q?MrGfC97DREbiJnh4uJcvCnRAE7FpM964/YSh/ffz58EW3rPMLCVxe/KFiWGa?=
 =?us-ascii?Q?7Va6EAQIuz0kYd7WLbV47qzmImfwqrDCzmzz/GHXA+GB8ngow3IyKimxzW7X?=
 =?us-ascii?Q?0bLnJTobCpammLp82KzBPC+O4yIPYyaqn0M1sC8E09vhzNI0e3KTG/850cxY?=
 =?us-ascii?Q?4aeH+FSc8oWQ+evogCIti2ZKO1MM6ROSRUAWYh+XiWKJGZAxSQb/OhZpBJWI?=
 =?us-ascii?Q?nGdHRVa1PMNjoOlYFKQqF3+2JwLlUOxQXMLkuwFIVV8w67MyRNCfn1TVkx8s?=
 =?us-ascii?Q?y15/ktD78QRMJ3/888iuhnMrhWTmh/VmGQYzLR442IKGb86o4TvZAgsDX80S?=
 =?us-ascii?Q?tsDahFy7+MBWx9JbTH2Ky4l9CInQ+yrr1VKEMwNVai5X5Hu0HtMWh8+Wo0DF?=
 =?us-ascii?Q?AbFc+zsiEkOVNDmRLEa29CZkTQgorwnrlIn1vnSgu4ug8y+5alb1CPMGNd3c?=
 =?us-ascii?Q?xeuPSeGd+A5l7N4AKbvB4cAUUvZiCLD2plAQGjlayrojvMWdLi4BHPf5M/KM?=
 =?us-ascii?Q?pkfIB+PYWQ/O1qnb/SVj13RwBIbnIlPaL3nl4prquIi+tUTF1LuIieorSaey?=
 =?us-ascii?Q?fAlgUYjun1ClXHjjRXAsmC5JI3Z7vIsYIZYGuTVUjIs+JSIM7G1p1YaZdKqn?=
 =?us-ascii?Q?iIhhH+pdt4l1QwIfNFzi0NLNjFTkAA8CJP3P1u4uOb92T1oj5Ej+qIwhhzbW?=
 =?us-ascii?Q?xZQJ0kybYL4PFfHIBqndGGIog2DehVZHTXyeq8Fa++t5wfH2n5Rc4LAbD1y2?=
 =?us-ascii?Q?1wZZ646oumk4dH7kbh/DHV5fW+xYeKT+hGE5ITYzInhyD2rEvBJVON0D9H00?=
 =?us-ascii?Q?cBkuIdRTBELN+yTZz3rVdZjMcqy+5u8GnL0Wlzvcf27oaOLldJvbyuSp/Jyy?=
 =?us-ascii?Q?v6yAj046abCNSvommWpPbx94BpRe1QclGrIXFWp+w5AuBxzE4+/t3bEzdA3b?=
 =?us-ascii?Q?82PYfLbyhaJ7Bwec5LMvXj7Ol/1qbU6OSNhnLn/z27ojDOXvd0dnBuUHjGcD?=
 =?us-ascii?Q?s1Hc4rUxi8hy/mwdRCYI8ISFgUoHOPW/Dq5xsmRazqIER8JdiCyoWUyFyXCF?=
 =?us-ascii?Q?e0oIDgSRV74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6b5iaJpQ+piQmHURuNqlteU6XBX+hDl65xGzNa4+L59v7h6aTcLbWbNgiTX3?=
 =?us-ascii?Q?lqjOXiyxn6j5WbTAWbDdUYDyI0gYRHSBLPaK/G4VJwQlYeOuJO78ljJog8fI?=
 =?us-ascii?Q?fUS3fXkLb+/o1uIWbJhuCbUGclhCE85p2+sSwOUswQSvGpVpNbvuaTuYWdWp?=
 =?us-ascii?Q?SapfDHiVBqzv5+CzQ5i5RGk5bwFJN/eaaEIzpGhnuwNNI4BiuL0Q8bK7yCZW?=
 =?us-ascii?Q?GjLvS6RD60CQlwu0PaWb9mDVw6t0Fb8T3TiZnuZtbiPzDescd8mS23EJP1+f?=
 =?us-ascii?Q?wawEBK/BZqubh/hY6Hkb/lV0PrTrtQm6gE/LWW3DaKvcRcjh5DUtb4OYa1Uv?=
 =?us-ascii?Q?6OuJX+FI6PeNg6KslwSFrOBzgjcbFPN3syhJgEMrdvAIFeEXyb3yYoHi4IZi?=
 =?us-ascii?Q?T8dTN0phWrltGiz5xlbg3naVXGviEbkMeIlU+lwT0h8wcyrHzyR8npVvRX4J?=
 =?us-ascii?Q?42pBMoliqGOcKP0Wgk+4ia2WkOgv10XDMWxmcRNRu4OmfjEjTU+vWN/QlVfJ?=
 =?us-ascii?Q?2FUyDlfdasOvy15D7izXu2trIbhLLu+ZUTzMnmToQl7YvNXJgLay6ZZ5Fttx?=
 =?us-ascii?Q?AHkkY5HzIjj9IJ3hM2aDpZvvbLfJd+kXgru2Kbp9BOM7PY10wp0EuYkSepO4?=
 =?us-ascii?Q?Vjhvcy42axEFXK/8iaN6SfUjV5RJRyP8pciLYe15gTqzY6sFU2C30CHcPFQW?=
 =?us-ascii?Q?q5Tm7S96284CszW6Jxqv34xdNsj0zkZhqaSSRPq7iOIu+QFHdlEkd7V8bfov?=
 =?us-ascii?Q?BuBdSfBM57dyEHDem024iuoQlcTDTuaENyhBPfbqQsYEdj2PM2xsM/e1pbj0?=
 =?us-ascii?Q?RqOSSEmrybSup0Uh68jQO4j7GBvtjBxi9muPTwabeObr4BurQnDdFGKz9P+u?=
 =?us-ascii?Q?5f4MkWuDAVN7stsDjMzfrhAxevYaOKh5QkpMNkhAPXBzrQB6/eBG1eEoEghz?=
 =?us-ascii?Q?eqVZfJxWk1aToCFRJLJm5Be//+qXHkd8J2xQd8yhYuEuOCSKX4x4x1C+3oTB?=
 =?us-ascii?Q?TnGsaFBKcyduGxl5g2j/cYRbaDAwY115iAp+QOOJcqz5sQqI5SmVR0yG/2/F?=
 =?us-ascii?Q?54xiYsUz85RNgPS6EUdJYUr8re82kOckTYAiQSsk3DmZ23+m9Qhj5vJ+p43X?=
 =?us-ascii?Q?JrQlwFw43Q9qblwSF4ISNMPngtHi7uP7TCWHgYO9EVcEjPMbMtTu6UxFKQsQ?=
 =?us-ascii?Q?zihzcSI+eOJZ25Ke02uazjqvRUNdxSf5mAJeB7eGSDIbt8nsh1U4JDuhVE/o?=
 =?us-ascii?Q?SLbpFBoeO/jMoSFGCCqgzFiq9nnxqJkdlc9owWUurJ0lXV+xiwike9H9hmtb?=
 =?us-ascii?Q?/DZPE8G66V3TfyHL4qPwflPY5knBimrzL4jv2JWy/zuMPwpayFi0OrVMORMp?=
 =?us-ascii?Q?m8vu552N97RcODSfo66M6fewI3zTzSu8jXMqAW30BzEW/fuNXtP6RwtgGuij?=
 =?us-ascii?Q?6J8IG+o98vrbuJjWunU7fE+Thzh/HZJh91UKRpMyALDXuCvT35JkpWLR3hvY?=
 =?us-ascii?Q?D3VIlrszpI+yWoX+MpdMJ9SjlEA8zGsIPA48ErYyMQOWC5B6/9co0Paa5LFh?=
 =?us-ascii?Q?G+okaZkeG4GBbuIW9j16gt2j2wy+9FRRu5ZmdUte?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4238faa-9a6d-4443-1d64-08ddf9cb83b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:04.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTZNzR0qx0wWyU9BC9g7kv8JVzqqW3jBchxshj23s+QCx4u4atRcB0cmVqygeyNmwEZQ/KPHMYcWC3jTxNoorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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

 let data = b"hellowo";
 let result = sbuffer.write(data);

An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
gsp.rs: 37 insertions(+), 99 deletions(-)

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
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
index 000000000000..e768e4f1cb7d
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
+                    self.cur_slice = self.slices.find(|s| !s.deref().is_empty());
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

