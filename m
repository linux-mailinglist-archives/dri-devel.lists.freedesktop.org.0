Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C899BAD043
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9AB10E5DF;
	Tue, 30 Sep 2025 13:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O51RaYGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CADB10E5CA;
 Tue, 30 Sep 2025 13:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6ylE6LvEfBiQCkstycbvUmknH30wVFk1sPN9eqAfG7qQc+jRl+pNf1Rv7zoVMiqlNuoKzbkOHXCyqDwo0yBThxrH0biq7qNVN5xQaXDmET0n/b/N4JoP+UtE4KIzikEyTi6NdqRny6ifkVaq7pTCmDqhqfjtAnrjP2jTy8QI4tSYVtyZZJAsLWD3N/RKDuzMo/iTcCEQY6tRfDi4Ws9PEELzlMD9ADNCXryDZVNiSm16AqPYfE+Q/3P6jsX2dEHja5spPxno6q2jb4VW8eCdh80Kpwr+5YIuz2zs08scwEnrAbU2UHxOhp9qWC0FbVHdvFLigecruhFWQbLRC1rZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgtdr3PXpPMUJDjZ9zyJ9LG6Yd4Ynzii9wizSl5hDNM=;
 b=SRYQXNM++IvONzcyAhDwLPQLPp+U8ORnijGQLNHxNH4C6c2K08jdIQCbuWj7y2KsRuugVE/Xu5Pk5dGnhZOLx0IK9bdFYt9YDfyYC+GFQ836HON3jECoHljizTGCxcu+VvLclIWo3kBJY9YC+rU/xnnhJ0Nq+Pb2e6GLcHQK+PGcavt0oRYV2VtOzuNS9pNLsXpUgPfYv5jaUZ2MXo74VzEevFtIo/Ir/ZumoBN/KhXmFZz6Ff4GyQWg5CK7SIOJoLTfXvwc0JrR3luizUsRv78yRVwz/pBLTJJXdejvOAnip4EaeTtXcfAclH8FdCoLgP+xdn4aJMxWz8xrgM47nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgtdr3PXpPMUJDjZ9zyJ9LG6Yd4Ynzii9wizSl5hDNM=;
 b=O51RaYGScsh6Z1deGAQDdmHAfhQSmn2tkdEYDxmiHdG+3q5Cmq366u15GkuVPGoAbYDPaLeYkR7mDKiwT6o3pExSewySlis23OBBpMrRNy2w64An4OGgo84FCj/KGooxqfTBCfOPtXQAOh1gCeIFtFA44iWss7bgyMJf5bE4TBJmskczh7vl4atcVwQzsGinyXBDlPFg5ukX7aE7dhGEJEk488I85Cgpw2XjKTlpOeRppBZNy5/eVTo/kdTlz/GT2bOz+cPSeI3OwG7hFBcWnfrWax9m3jaNmQ7pc1K6AOlufgp4HEqlr1OzH6fDxfagg+dgkHw/Ys1UUfQQWTsk3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 13:17:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:43 +0000
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
Subject: [PATCH v3 09/13] gpu: nova-core: Add bindings for the GSP RM registry
 tables
Date: Tue, 30 Sep 2025 23:16:42 +1000
Message-ID: <20250930131648.411720-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0135.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: f3785c76-5e83-4ae0-4f54-08de0023bd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fpf1dNy87Li4r66jAWoHgmPRFckmuGQLHIo8zPwo5uS7BN79DMvBpTfv8riQ?=
 =?us-ascii?Q?e6qmFuz7kcvtUu6633vUjT/ppz++g/rvW9Z1J+BXA2nyxQTilHMh+WPbCpeS?=
 =?us-ascii?Q?dlIPURlgCtMtHjeuEcwVIiZ9Tp8pgm17LsZHZOvbnKitk6Qy4Bs2WHOfHJuk?=
 =?us-ascii?Q?e5qwv31B4a/YOk5OFG5/qCaJItDUqq8V1nszNCImDt9nDb15SB25wh4MeU9t?=
 =?us-ascii?Q?4nKZDXYVbSjesvnWbIbLiCEBsRoF/kYkId7v1yr+vlbr2K3Epx4K5fMvkhNU?=
 =?us-ascii?Q?0dLzlV6JnV4pLv5dRHfXognsDGTa5tKkuHmA9BAeBIiUD2AK/rN/mUPOCY1H?=
 =?us-ascii?Q?xU11xQnNtpws9fVUEy2dh9nB1lohct0WNmW834q4JrSLIFiBOxujnLJ/Tzl0?=
 =?us-ascii?Q?AwvQ7Ms5wkgEfhKRxSVqkk0ji+6wNjDz+uHPROqXJJdnS4l3a9KAF6jwLXIC?=
 =?us-ascii?Q?xjxaYjlXdfCW5FFi4TsVt19rDOZcnoq1YdUM1SRipnvuVGC4kDBq8wmyPBjY?=
 =?us-ascii?Q?nc3Fq2OAPAogGdBsQdmk6N83nVDQ8yZTjh3ds7R2L3PUMb/wUfhmp6/5jUAy?=
 =?us-ascii?Q?wOeeueZi/M5MHnWw6dKE1gc324wumyMpsjlihExccrhizqGHi4NMwShUV4BL?=
 =?us-ascii?Q?wbMlXQwr45BVhVdJwOyEUupimheTS1iHXiLFyEWQ6RwEAQlqBc44tlHHQlYF?=
 =?us-ascii?Q?6X90xYyhhKFeoDzC32zPot/r3DUnolnK2II8wezkI4uz2A9APaNKxaTyu8uv?=
 =?us-ascii?Q?wX/aHDN3Ndl/1LfD5hjuhQtTwDbNqRAVIW8y9f7JR9lNuypbKwn5eM6ACtB/?=
 =?us-ascii?Q?GHzqaHOuUN4d5Nt6XhEEgBWikWsM3S9S5aqvcYH8RcCLgXdVIU9rLMYt/ENI?=
 =?us-ascii?Q?Cvcw1SFXHleahYfXCPK37+HvQBmW5+Zt0cZ7qsrpTiAa9C33E9oFCoKwgpeT?=
 =?us-ascii?Q?u6U1IUDyiFVU8nSCtLmHtoxalO1TxH9TVFNeknmjSuJEAibLtEQN+6eYvBwo?=
 =?us-ascii?Q?1JUx82jqThz7TdB1zYQAf/j6qFeXhOix/hmka1JoSgnEnzty7c9VxHdB4pAD?=
 =?us-ascii?Q?E26QfFGHEc3av65157nrxyBfpCrEbJCk/vrdLx+zltMH/K0QWUjCsB3L4SA9?=
 =?us-ascii?Q?JbYle70rMKmGJgnXFVloclrA9D88lLqvLKWIdAsClgr3MASTLO4J14xUTUMA?=
 =?us-ascii?Q?B2aTrecRKof++65ooKWhrn1eKCTIKM4X/yvkxkZBZZa6P8tMlVmTHRr2UWIt?=
 =?us-ascii?Q?6pL6/x6Fu+a/CEcir6tAY+GnNvi+d9RigpIQsPhI7cxYgCzrvMUHyut0IDhf?=
 =?us-ascii?Q?gL2Wfm6Rl8yAUxxJI9QHcYvoIs3GfT8nvuJzhdnWOz970wERHHhrdxg80jTT?=
 =?us-ascii?Q?tyKpnuigwPBO972l8y39w54eBUxWZveQWKSP7hcEwmt6tz9MQQN9x/p9Qr4M?=
 =?us-ascii?Q?bvcOvtcrSq7dLm8pCOBtXVe/s/KmBCqq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GudAfOIqFZeC2THRkhZVMdlbcB1EDBiS9cWMyH7Rp3pLMHsDwPAV/uwCmalm?=
 =?us-ascii?Q?fRMIfWlrboBRVht7SglxzqW+zwkKmuAJEhs4601TBa8RToTnwqlSyicEfdC8?=
 =?us-ascii?Q?HZrWST0tju8tB31mK6amAHgDsV1IOL3Earb2XrbUMlnl8psdixDrn6Vg8LOB?=
 =?us-ascii?Q?5geMJQ3VJL0st0TewO0HK/9gOMcJuG+S5flGmr+8uCnqI4SEgCBHp2lVa3Jf?=
 =?us-ascii?Q?dMQNkdV1b0BoG4newaun3obplhyuAMdxaPXy6hRD2dO5tNVnZ5HwTwJN2VLd?=
 =?us-ascii?Q?7YUqmsXd9UH0Boc+49REBDGldqM/nxnW+ZKxSsaCAJIGSqmPz1r6S1twdu7K?=
 =?us-ascii?Q?Dc97hENu581EIaId+Gy2ct4v+4II/7xRq1uvVPWdV2UMZhVHl88AQrlURiW2?=
 =?us-ascii?Q?Ft7V3gikvonCxK/9Q7F5FLCVVxZ1DCi1aTC7AtR/r0BLcw2tIbfnSwFiXm9N?=
 =?us-ascii?Q?Gn9epmT+y4ApI3U7bvEnjuF5K6lTx0F449BkXyUETl08WvkC9VSIq9R+q1qc?=
 =?us-ascii?Q?GOzY+spIQQ26YOci7ZaoDxdRUYDf2caN51dXdyE4ooBqK6z/dZ8+/G/JUm7U?=
 =?us-ascii?Q?GyBw2GxFhQZxKRGr1C4Yg5wbM5S4Fj4YYo45h9MKvadnDWR+dhAt2O2Sy5zg?=
 =?us-ascii?Q?g4Pao+uyq5wYsDfTZGGwM0GKMUwXxsk6r1wJE+c8is3iQ4G12RTnbRuliEW7?=
 =?us-ascii?Q?aU1ZD9HetTQje0x6xW5Bp1AGrdaAReXPbqz1TGdWnfJG1DMxinKW39exPFtI?=
 =?us-ascii?Q?s1BmU4bjOoGiVZu/CGfAcwSn6wPJqSrcIzPWcpyGl52N5em8j0Mie5T86xN9?=
 =?us-ascii?Q?7bZf8Y3BI+rBV+erLWX1ItdLwdo+sEEo88faf9tifuE4Y5vPRuLql8RJwS0q?=
 =?us-ascii?Q?88Syx9pTPRR6UQvS2FT5XGE7qg0wUnpV65wqWqZlGjS5f5LkhNHxQCvvmdjo?=
 =?us-ascii?Q?gIo2FGmgX+SOAF5M+sNrK5Xj5Djcd2Jun0H4EFoFZqArePRS1OkEb3CuIByS?=
 =?us-ascii?Q?tYYUFWOJ8/5wrg6c9IXsiSdcGjCJvwA15ZSsZFfFcQ7U9MeZIhKzbSEbM3qO?=
 =?us-ascii?Q?yGPW1HeoaKONpnRmUxsj0ij9sUK6UcHImuR990lVbO3WQzXmo0UX+rvbXK07?=
 =?us-ascii?Q?wTSH4F3l62lyqCJZh2j60rilI6LXF7C/ynq8YRFY5RrgC+4Z8jn2nVPfURM3?=
 =?us-ascii?Q?Ys7CCZ2lvjwN9PJqrf9xK+ZsaUwbhAlRZM/WhmhPqcSyWW9IaiNErm9+g8vk?=
 =?us-ascii?Q?79qq9ZzBbRPgQWdMlC0ORcio7BJ6qbV5KfmNiCEUYmzEUbEDsgI45JdQf7CY?=
 =?us-ascii?Q?wl6wBwOkmmy/Y3N0QyDk0Bf1eyyvZUroWh1XGEPGpMv0wkfsISbVLB7jxGv3?=
 =?us-ascii?Q?x4KtatmIkRkd9ZimsU50/zcvdTAmaTSTXnp6Nq4yZwLFkoecwHcVNPNOVusR?=
 =?us-ascii?Q?/7jp6MJnvo5JCMIE29H4/Mh+8ft9MCombeKZIzgtp3saFJfHOaS2vV7N3h2A?=
 =?us-ascii?Q?G4Mp+OOhvuCKwekDlnzokSD+igMQxM1qNcUHmrkEzqrMgB1pWYZO7kuONbe1?=
 =?us-ascii?Q?AXGcAqKs3KZhAN6GQ8QDQ5TUm+zpcWoCYIPvI80J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3785c76-5e83-4ae0-4f54-08de0023bd0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:43.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lveOlSFyMkhYEM1rT5yokuYaX4BA/YG9WkhCXWWK4RikO5QhOQPJecmiHHpHCC9Ja+HIrD/usVyX84NhZRFLw==
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

Adds bindings and constructors for PACKED_REGISTRY_TABLE and
PACKED_REGISTRY_ENTRY structures.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 40 +++++++++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 17 ++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index f28779af2620..3037425902f7 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -38,3 +38,43 @@ unsafe impl AsBytes for GspSystemInfo {}
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
+pub(crate) struct PackedRegistryTable(bindings::PACKED_REGISTRY_TABLE);
+
+impl PackedRegistryTable {
+    pub(crate) fn new(num_entries: u32, size: u32) -> Self {
+        Self(bindings::PACKED_REGISTRY_TABLE {
+            numEntries: num_entries,
+            size,
+            entries: Default::default(),
+        })
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
index 427fff82f7c1..7ad1981e471c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -42,6 +42,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -649,6 +650,22 @@ pub struct LibosMemoryRegionInitArgument {
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
 pub struct msgqTxHeader {
     pub version: u32_,
     pub size: u32_,
-- 
2.50.1

