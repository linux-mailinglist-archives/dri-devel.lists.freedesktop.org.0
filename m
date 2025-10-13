Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867EEBD1A1C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE61410E3C3;
	Mon, 13 Oct 2025 06:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KFQ2hvkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDD610E3BB;
 Mon, 13 Oct 2025 06:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y271IqOc0Ml4l9cw0Q4R1NFhmcfSClm/phXl246WenOaFlPZXRIKT7JTwo1P4whzIHF7NSJr8ydeMpVKqLbaqfM2COInVrviGAbjMOiOUDg3zk1JGg9RRjfRHkQe+x/DuPqmnpTk5tRAKhhA77swG+Phj/AsdoEUR7qj8FRmgcpVQZkn2viA2eQkk/crHFUInQTD0gCkxUcIrY1Qs0NcJwSC1WnJcME82mI5xHIsCSFlXgphJK+xYsuRgyTkUy5TLx0/WyZPNugCpsuoMjSu924/2NU+SYCAkPOtAg57KA7laNjSPsX+kyF3BCZcXnCEn2JYhttKKTU918MvYUPS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSSHmbboFk9B65s4L29peCD/EJI57WWUXSyby5EbhRE=;
 b=ENJyhfXM0c+9li3EtnA2iWA5HipMf1ixJuKd/qpIFSNrFmEeIV8OFeCXpK1IDHMP/0gciXMA8jc3/tZYOp63dK8L2KfX1jGQF0B6Msr+lwr2xZQW8Qk1XhbIXCvIxuRCUJ3H1QR8iDSq55p95bEtocXOzf9C99yg1vvuBGhiPbWF+H/K2Hn7bJVLtryvneuQotOSP9A08xHzbScenuZmCacQjPLrXtc26yDOzsXtWgUvAXX7oKy7tPT0LaYEsPhZTJ0Mxto8ufhW5bbt5p7Q9rJPyU+XIGYjgVVHjntMAFMP3z+2H1xORAdZsTNft5tKRN92LmAo/vskrdGXsAXlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSHmbboFk9B65s4L29peCD/EJI57WWUXSyby5EbhRE=;
 b=KFQ2hvkJawc8sjpz3PXpVE2wfdDPJ0YpzMT39X0fMFqtQ2oAGM3Su0P0W9/VjlgcN0xA2afRwYaFCWEcHSw8q4Uk0p1aEo0vG3umE5m7wuEKCULVbwfqiHuAwt0ZNKHQmgZRca1tD+sf1vqSD3nRXdLKaIaSyMxMLuOp3Yagg5fRjjj0+WHxZJKjesSfVRLfhPoQxsnjYmy4BsRKcOE1NsQ9q9kUWlZHOMAaDA74Bc/M+yPNvLX/NDBHR1AHLlv/1F6zMrA2Tnh2PBQTxOZtU2N4WY5SnIu37YgFCxpp2ypZwlbJklNT7/GHuITwnS5KKsVxPhqd50Jdwu0cVfXcwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:36 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:36 +0000
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
Subject: [PATCH v5 10/14] gpu: nova-core: Add bindings for the GSP RM registry
 tables
Date: Mon, 13 Oct 2025 17:20:36 +1100
Message-ID: <20251013062041.1639529-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0058.ausprd01.prod.outlook.com
 (2603:10c6:10:2::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec68129-ae26-4038-9b63-08de0a20c2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uY/ZIFY02ipOxJvkxi+wsAKXrsBfMIrG3eVXUg9hB6Hl6AGPQ5PUk7+MgwKX?=
 =?us-ascii?Q?x+Tdei6cQ8l5UzJCoUAKzivl7z+32qIx7fhZmOng7T4ncvdm+fxX54IYU35D?=
 =?us-ascii?Q?U3V4AbydibXs1iJ3DtD5sSlzrTdCDdGUvuXdJlddQbyVZ30v0YPy25qZRKs/?=
 =?us-ascii?Q?XWCdxrY/TflMrHGHBfZc8DmTSHl4V02p8iXtLY35lSNHOG9PHImVAp8e59CW?=
 =?us-ascii?Q?pAlH4hO0WtuKm/2JWYaqo9Ufz6QC/JqDKdgaoRdIvN5C4XKnWOD/pSZeHwxo?=
 =?us-ascii?Q?7k51iVE6+5RmGs5Gw/R6M/ndONHZy7Ok+6lgpM4S4QuCcYUkycHBdHGRAboD?=
 =?us-ascii?Q?/l8ejqOhoxdcNf9WWjL9sbYpBnMbxcHgXauokC1cc8SQtgXPQxJgUCob8Way?=
 =?us-ascii?Q?o5I5kK/So5Ha8iqLtpetjr4/QRNS8TGTtP48Bh6pLCcOU4xP8yHskxTGzXuX?=
 =?us-ascii?Q?weiERSliSKGAaYSeBSVVirE7sNdHq171Mlo1KCb0zjebxNLU6jBpKOiSdLH7?=
 =?us-ascii?Q?yLz+WaD4/HyB0pbVhZbUv1hM/g2awWmiwA+kh7M4ALxrqKt9aCZwO1P4hfy1?=
 =?us-ascii?Q?74mT5dZz2u+SWI+sow3wQ9AAcUtDB23tRP29s/vYMv2tNtqAbgajF6nVcHVi?=
 =?us-ascii?Q?PQy55LebpSQ97/40KeiF46GkXlUK44CoO/vpth/qAxfD4e6tvYZ+4iaYjLUe?=
 =?us-ascii?Q?Fdyz/nVDLDqCb4pbUhR/QKuyqLkiruMZcNHP3sJjnrcHBbReUHrb81XarQ+k?=
 =?us-ascii?Q?WuZZ3a6kbJpU/DVvl9yHJiqNX4SL20Wcg7R/ZekX/sZCgN0mYipSNX17uv3l?=
 =?us-ascii?Q?30fkGIB0Tuhpjufa+pNu07xkXrB8tvKpmjFwEhOa9t9M/r2iXQlKSjoJ8KDe?=
 =?us-ascii?Q?NVXjOP/AscbqStp7peZX53Qq+htB2s3TqyB7/+tw5o77PeCGhIxIkNhDr3Ye?=
 =?us-ascii?Q?4/TuTFJgDu+jtZD4rlS3yBIbh8gmdFo5hAWjMYGkYdx+Q6n2OA0WHh8YnKAd?=
 =?us-ascii?Q?McighjFl4hQ2YJZWFpIMIrHCNm24gcAbNEKtoXZ9uBYBdCxlkGCSrSKSrM14?=
 =?us-ascii?Q?5fOLsxq66ABFQEAGaqIVetkkpIJ9PQarsHgOpW8PKWoe/t3TMbgCUzBaed3I?=
 =?us-ascii?Q?2jC9NxB3TPj9B8pzaWU1C92d0hR8Hm/5Q0KG2Z2WZ6G0zjJ4x2XC49uGWjVh?=
 =?us-ascii?Q?0RNiRpcRG9ZV/JWhvVFmrbH93RM7D1SCgI6hd94CGK2Vylp38zP1iL0qrFOs?=
 =?us-ascii?Q?npj0yWWINhKJ6tJkHZqEw1XWzg4awE4VMkshGYXgBQ8P9Oz67ZR7lCyG8PRP?=
 =?us-ascii?Q?UK5LjBPAckzKf6UnyX6Mc01HCh8qfkI+zYPlMuWfQqo2eavEMBYRADwS1McK?=
 =?us-ascii?Q?/IwyBrfYFtlTSDZ0/IRP19E8E72njdFBgrBt8Zx3Z2+JsL2KUdcYCl3rV2/C?=
 =?us-ascii?Q?QfA9dWtEdJYgfsKkeF/T6XsWfF23I4Vq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+keYBgE0X7X2Gdvyp2dVM/xZI15/OzRnr3I8AlFhqyn/bkiH4/7ve9YJ06t?=
 =?us-ascii?Q?VFsBioyoyJJPMEjG1rkdber/VUgSgoHe2tG7xEUSNIQRcwe58NcwrTRCJE5k?=
 =?us-ascii?Q?PDJVXNyXyjQZYmrGE5NO/85mvXXb7fh5wZWuNO0prWXaZQyAtFlhoVpcoQ7o?=
 =?us-ascii?Q?21fY4Q3TB0bxE2M5DzEFSh5Y9ce1gHAsGtY7DNKDAukoA5TOeFnvCBi/l1p1?=
 =?us-ascii?Q?upFAO7HSfA2HAalwpvfKc8kJ6vBCAqbIhD5m7F+uo5MwB9Qj6hpiUo2qf9C+?=
 =?us-ascii?Q?mVrPCQEsY0ZaJO3lS7rswc24ueyiQMHpIu4M7PiouiDN3FFzxNTJDBNhF/b1?=
 =?us-ascii?Q?dNo8bgRuHvVi3GkvMWxKRE6dKBKs6ogibslpofKuoyQZfpeKl/10wdpRawwG?=
 =?us-ascii?Q?87OgRbfCx+TnrfXE6lhe89NPnhG75FJFg/I2dTvNT6Hmiej1VXJ5cWPqyJrF?=
 =?us-ascii?Q?vP/ZCjtoYXQt9BpNBiOS+qp0j4vd2ngHjN9xPOZVnxbqjS12UAtvKFvUzKbk?=
 =?us-ascii?Q?Pkq0PTjUbLSxfLA83QlvaoX3cpjVXAmciiVmH1fgnCy/w+XItK4JL2VfcgP7?=
 =?us-ascii?Q?mVRY+GX4qV4py/nnLftC2zEwfSQlONZ1kd30VI6XlSYAGsc37DB3/+4n+P89?=
 =?us-ascii?Q?ZArINcLhSJcqWwOPsuvqV6jquaz0TW3IKq5O/CvghM4ZmauunaFBvoBYdkWQ?=
 =?us-ascii?Q?ax3cllkaeWqa4+ucW383rUTHepOzsRV0YFlVm/A18+X+WZUkQ9lMdKXUMJnp?=
 =?us-ascii?Q?1bLAfsKYTSPmHF5deRXo97gr0lWQAO/6Fhp25ivHLRL8fst0ULtkDW61ZNyY?=
 =?us-ascii?Q?K0WOmtQmoySrvlA7/ZQIpIyr0mBbhOfF8jRNRPn6PwKZ0zG0UgxsWjBFhQ5j?=
 =?us-ascii?Q?2XDrEM85EvMae+p/HTz6vSKsAvPXQfom7q6HAVfTsfxDG1KOS5LiRumg5lkF?=
 =?us-ascii?Q?fk+sc0NK8+a2FHTi3fkbJsjy3fRQ76pS7cSaK84iqYSjisFDOVXehsHxafDp?=
 =?us-ascii?Q?ZPz92O7wa9yUCmjSr5fgPDbZFK10Z8V1tQdeXD2VRyoLKQaQBK7nRv2A8X5d?=
 =?us-ascii?Q?gugGNyMdIAx/tJzIMmsCwMHlpkFHRj1yxOTjxaakQK4E+L9P95g5EBSLTKQ4?=
 =?us-ascii?Q?/XQyGekiyhuBeDn0S5e5jC++e/JsyPeUC9SJ6QQtvz9ULjDR4ACYaJ/vDmAu?=
 =?us-ascii?Q?/vC6F8tQ8d7LrzEMTMUxakBraThx909RZ6r6Nqp5GbdOf7PsNBa0gLDJMyjY?=
 =?us-ascii?Q?pzpKqH0z/dirO4X3JoUFifKlrST24IhaYhlEnkVllR+ep5wKpMt84CiXp386?=
 =?us-ascii?Q?cs5Ij58ycT5O7p5fWyyxogM82DNLWD+BNhFkdhXeypYQbKs5eIhZdMjdRtp0?=
 =?us-ascii?Q?QwgnAd5gF6zyQcd9Ts6E+WifEIX0sNmAxxgu7ABaNALi3NDZjWWRz3gboiKy?=
 =?us-ascii?Q?icvKBrJZPv89G3XhQVTotnF6/voPXZvaQvWILjv/O6A/46q75WEEAAFpv/+t?=
 =?us-ascii?Q?qaUmSGnc6tOfgqi/p6D6qRWxElZlXE4lhMZwAGNv6R77nQKevWWzQcb18ULn?=
 =?us-ascii?Q?kIjT+Yi1zSSxvf69QowU1mdJ1wCNjtpcviSBIArm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec68129-ae26-4038-9b63-08de0a20c2e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:36.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpRrx2xumITIhL+9rOW8xJds0szn1flnno7YxkhfH2+Xs9vsGUSsGd7uhnIfkqTo4etZiuEli1gHy5F3Qqh0+A==
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

Adds bindings and constructors for PACKED_REGISTRY_TABLE and
PACKED_REGISTRY_ENTRY structures.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - Derive Zeroable trait

Changes for v4:
 - Use `init!` macros
 - Add comments around only supporting DWORD entry types

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 49 +++++++++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 16 ++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 9a524bba1ac4..79a69c6279e8 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -49,3 +49,52 @@ unsafe impl AsBytes for GspSystemInfo {}
 // SAFETY: These structs don't meet the no-padding requirements of FromBytes but
 //         that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspSystemInfo {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
+
+impl PackedRegistryEntry {
+    pub(crate) fn new(offset: u32, value: u32) -> Self {
+        Self({
+            bindings::PACKED_REGISTRY_ENTRY {
+                nameOffset: offset,
+
+                // We only support DWORD types for now. Support for other types
+                // will come later if required.
+                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                __bindgen_padding_0: Default::default(),
+                data: value,
+                length: 0,
+            }
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryEntry {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryTable {
+    inner: bindings::PACKED_REGISTRY_TABLE,
+}
+
+impl PackedRegistryTable {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
+        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
+        let init_inner = init!(InnerPackedRegistryTable {
+            numEntries: num_entries,
+            size,
+            entries: Default::default()
+        });
+
+        init!(PackedRegistryTable { inner <- init_inner })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryTable {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PackedRegistryTable {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1251b0c313ce..32933874ff97 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -649,6 +649,22 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
-- 
2.50.1

