Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D1BC30E5
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E821B10E723;
	Wed,  8 Oct 2025 00:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AMuYmrz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4825810E72F;
 Wed,  8 Oct 2025 00:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVPCZN4t00toua7pkIvlich5jlyMZuaVS+q4eP0jnnzicDjopsUXu5sLcPNi0Ugggl2Q2IT0HL0V00kryhjgAdv368akX9KdutHt5xdf/fuOJHkqmsH1Fv9sPTyA9YsxKA3h0aV4++izqDmUuOpGaH92KSF1+7/Rdts+ygqWIaz4wrYJv0P0SE+MdP9WW+O+fTiY56TJvwB4ItHY8Nu0XYbTaqRgWfxv596WnDf/FdEFSF45aMU/O8PwEGe8cYqjmZuSWa1DR8S94njlhi1i7rHzmyhvbseo8E0KowniW3FK9w3CT4+GjasPn9H1iXDu+weBeflbTE1H9Iqrs+vHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cffpN8hcpRRsdi58aTwANFiqddvxpjQxxOg+gpQsxs=;
 b=Z6Oal547ZKtgZ6Lx4zLT8cKkefAWBj90bltju+bx5NyNMZ13jb4CGKZkCnMDbfXFep14jQUoray+rXDXqQW/1y9aAgKr1CMisvZfweYZHtLDVM9x9zXlSTemvyf/JpMBKhuCQhRnokdcgWQezcsAMB5RhUE+0tMauw0WH29Qh9ElxdCG24BaGbAmuIk4Ehj4JAnjmgLbqGvNrJ3xlNl6YWbfOQgPkbQfleJpzShw/2zTplrScLjXFCTqhGozv+ia/66hPDJqJhz+Y7Zor0hDlQmWrJERG5qL75RasDV5zmaf4sx6mXWg3jBD4HmRstXtvPG32HCVjb28xqlzBRSyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cffpN8hcpRRsdi58aTwANFiqddvxpjQxxOg+gpQsxs=;
 b=AMuYmrz3O1Y+I+7NUWKgkX58eL+RSWRSY30xo2z84tYd88uYXfv8kbN2JgdLhYBd/oQmnrKqcgrA9GBUqJM+Sx8cIvkN2w6Qh9BChY9Qc4zkllAZ0pBg5JiEBqqsZKeFEuDtJ2JeBPcjdAdYB3Y+KMXgM8JEkUQdGN2U/ZrlU8MoD0qxjygF9WVKMZ1Q1W6S8LjcVf54zooJQ0fayWJmw8bXzDNUHE5sFn8HmgGOfz+KayqaiiGzbz4BgJJQxVR0LCtqSxXTDQAW5m4eppB/n3CW5Nthw+6of66XGuzVJUcL2RJ4ZHAnn024P+8P555Y/CxrIn+TsJxPDBIvo7c0wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:49 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:49 +0000
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
Subject: [PATCH v4 09/13] gpu: nova-core: Add bindings for the GSP RM registry
 tables
Date: Wed,  8 Oct 2025 11:12:48 +1100
Message-ID: <20251008001253.437911-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0036.ausprd01.prod.outlook.com
 (2603:10c6:10:e::24) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 226bc0be-b305-477e-7b80-08de05ff8def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sG8AvhVxJai4Pt0cOCvhKilaN8L6y0DBul1WZvfmtDstHzFj+ZD70/+3if+8?=
 =?us-ascii?Q?eZq5oLCrRarnY3Nx89rgU1CUgVWwf5qgDPrxi4MPvhJf0MB/DhSFHbSYOtin?=
 =?us-ascii?Q?Lys/HncCXaudDLB0vh+yUsDJ3qDCg4pIWsOfQYamQChe/9QlqNazXdy7m6ap?=
 =?us-ascii?Q?tS5+NqzcHQiMSMvZsnynPQmCdCUUy+036EUG5dJteq4TSA5dCdN2464/1vKg?=
 =?us-ascii?Q?17TwWnGVpeIb70KOnat3mjiBb2daCB9oSlmYe7woqKcGpMu9LPj5Xxv2pDqs?=
 =?us-ascii?Q?aOZfdM/yyZmLZVialLYqKw9hOAEqhyspn6vtQBIylntV6C3RP4xx4gZah2HZ?=
 =?us-ascii?Q?IEQJGWBswjSSk0RKIKuL7ZmC31d/eSL1jAMsZ5R+GVtEL5K21t1Bl4To5YAN?=
 =?us-ascii?Q?slF/M66irsBbm1KP1TZXolbWIJlGSYbcQuKkq+zMqw6NvNKQI1M85deauHLe?=
 =?us-ascii?Q?KLghhO1zP2uqyTKbfi2AzARSJYxfO5OGpMgm7X1f8AxD1U/838EJnpPis4Xr?=
 =?us-ascii?Q?EWMvBuCa2aewYw/4c1misx4Vy8mh0IH5tMj8eS9VFl4SRv85Q9KLqh72yFu+?=
 =?us-ascii?Q?IWFOp7X0qiwUKEwEAxCEp1Q4OMGs9w9GJCy/fGQ78u6+MGIxJMP15lPZCVRu?=
 =?us-ascii?Q?AZRTE9fSQnLahuKowUG/4eUCuaatK+tPRU3UfBONe3TN8UdK7V9I+XKYi+uS?=
 =?us-ascii?Q?114UwafpjKBI3PFBWivEU5J+vsFMLHHDGn9bfd5zOcvrNB7NpfgnC4+i5FWz?=
 =?us-ascii?Q?v2e7LSWpCyXHA/aQBvUf/7gbPI8PFfN7dQ7XH0cryKU3TSB1axsM1DVi9p1p?=
 =?us-ascii?Q?ix4nSPRlTSrYaEfz7zvEpREAdG+rdQrIomEXHBdTIQd5yZAYICBpgVsuQh3K?=
 =?us-ascii?Q?TcbsPtw+LXYe8+A+kHNOVzUnsT23PG1pOxJePXqlU/nFec9gStLSQR/tXgn2?=
 =?us-ascii?Q?YSSIhAn5hHv3vkQRSXoI+w/DeCRKmTlexxaoRKRpSDBmO9GKnsF2X2/+qw73?=
 =?us-ascii?Q?dcWeJktGlSGIt2Oy3sEHeMus7k9gvBuefsXVa2HUQXiU1aapoGbxCGlH2469?=
 =?us-ascii?Q?atCTO2WonDe8FLuDeb59NjpSGcJIuhgFsLCH+sa1uubKOdPW2co48ya55ydQ?=
 =?us-ascii?Q?iKMIimd3FOeIAoDOtXyiGe3oJEf3oLRudPd2guZp9JN1Z1wxVGbfrYYVqijG?=
 =?us-ascii?Q?Z+HJdQBlu0DcJtQbmZ1q9BhTWejgZTpkWWQY7R2E6HRsToGaoAMsHTe6P484?=
 =?us-ascii?Q?Ne0KthiNGbW4p1XIJAyqf70JmeKPAK1PHzDY8dcI0fUNZj8Zx5LX21a0pIwj?=
 =?us-ascii?Q?4v8H78QEE59TAhNDpwV5gR/8htolusa2Dqu4ElTOGbsMQBjYzdDU2VQHIufW?=
 =?us-ascii?Q?sH9l8vVxOK1LX5qxTbU0DWZGfB+mpTXDEiR+64vBLK7l5679RVwcJhh6erF6?=
 =?us-ascii?Q?1RHxPbDD+jmmMsSVB2sR1EARXlenhQGb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?41NGDuqUSZemVgBLSJ4pgzH86uJrLs98Drki7E7BXlVwi8C7fE32efS3HXzF?=
 =?us-ascii?Q?R0GyEN2w451ZFM2EhpSOy6sG4qufvJ1Im5mK0b1MVswuiYR86pzEE3j3efms?=
 =?us-ascii?Q?BzTKRw3vpLt4nv1EpyOJRssVuNwuzYo4Pctsj0jy4mTgY3vygzJ/dceKG4Hc?=
 =?us-ascii?Q?DdIiDOnpid0dRGadha+lQtG/YgKAYF/IMs4aGSOIaz7bCM3stjdl91bqrM5P?=
 =?us-ascii?Q?3Tw5wDz0kgQ3ZABK+FcCDJYrV7y9AILEMxKpgh9XlPz4Jb6dKgZPLmiFkRzP?=
 =?us-ascii?Q?4uOrmEwZp9oTW6oAWqQiQS7mffsf4bLssNz4R1xP/tB115EoqkGHQpxpd+yc?=
 =?us-ascii?Q?PfgMi/V54qHX6+sgqDgF2meRQUuU0gkS4+LbXPvtrWY12A6KFnbL5q5Wq4BE?=
 =?us-ascii?Q?VX9YSkJi6/2sBXM06zuqrXUHH7fMAxrCc36iqyUKOyV+0wLtO6BhQYVJgBan?=
 =?us-ascii?Q?vWy/6eu8vP1/xRGxE61jpEiiGswXSvYbYYOXGnl5ajahjZSo/Q7ZSRrJI90z?=
 =?us-ascii?Q?nfItuJePJuD0x5lnNnMzLgPEWCAS/XyKmruoEHXpPEEsO/grCPk/vhQtV6ow?=
 =?us-ascii?Q?t1iDCZOq8buiEeeWv7BYy6FNrJZHs1wIDSE4bTsfSSzB26tClwiZzp7iw9C4?=
 =?us-ascii?Q?BVxIkgu8jlJiwuHRwS/yuBhk0qLrkFextq2dVFlrbI87NY9JeH70RkkYNQ7F?=
 =?us-ascii?Q?Kw4T1o9cHOY188y7W2+g5iCwDKr56IQcUrb7w9i9FlFVeunA0YVNOlh7+T7v?=
 =?us-ascii?Q?UmvsigzE9xCpSYQUCgOC3DTx/xYONJCFBbKK7VdfO16WxQI9KsIHIANKC3lx?=
 =?us-ascii?Q?655RlGTRB+knlwgIZtXfArzL25U8U54W9JlUj5YPpwpgATDkNzzIMXnPl+sZ?=
 =?us-ascii?Q?rWYtS/gc6vr0gj5Hf6zZtMvf/6a6zT1YgKDfONUjZFJuy4/92bI2qcbfo5Lv?=
 =?us-ascii?Q?sNLZ28NpQM1E0vLZx5P92z8OY5rmdPzqGJI0SN//9FV4wHFE4ZLn7eL9QDMg?=
 =?us-ascii?Q?wKtF/7xAzsT2mG1RFQ0WviSU3U/fHDCpJy9tV8hojRXCsNzOlQLEQFlq6fln?=
 =?us-ascii?Q?lwN4hm/2lCDSmUQ0GfuD68S3qU6Bm0nZL6wzR+ihSb6eHKJWlb/HfiP3bpuC?=
 =?us-ascii?Q?v30yPVNnXPfTix9UjJFxvZwAbliNQ685mjaQ3cXedcJgj9fvJw3n1BYVJ2FP?=
 =?us-ascii?Q?+htNe1/e7J7iUAc/i79drCncPlbomTBrt762JP8mrfWLHCX6DIprCRP2eupo?=
 =?us-ascii?Q?YYK/bg3lZPS+fR44HJ9A5ucXLX6YBVG2SQVg6DkCyZ4rlD+BL/r/nJ2d+RnQ?=
 =?us-ascii?Q?KTLiuabI72+3orJ/IH/q3n6EP+McHeK+wiyIO+k7oNcELgxaWoWc4/e0pqWj?=
 =?us-ascii?Q?yC5hNwmi63Uu0eCWzxVB1pGRwk2GpbREqeZ5tWev14bNCOhGHS+BsCVxRMnw?=
 =?us-ascii?Q?4Dxlx8+juP4UmgvVX98s7AY6UpSzKqgfozS+EavOqdznqF7j1mstGheGKU14?=
 =?us-ascii?Q?YMslnvz2iknf50ZpRiUvk0uRqTkDAAQ+JLqvrp/666rmJvimFiXMN7pm6JTq?=
 =?us-ascii?Q?K1ymY2qw8xZxulm35ewSi3OD7OT+nD0WopAoaM/R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226bc0be-b305-477e-7b80-08de05ff8def
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:49.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FCq+DszBqUr6iRhEX+ybS15hY9Dch0uctYLRiPwnNEbSS6LwzKmuOrarWx1rq0LJfttuhDqDKA9hxtZYNfLPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Changes for v4:
 - Use `init!` macros
 - Add comments around only supporting DWORD entry types

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 49 +++++++++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 17 +++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 53e2c9098c48..008c1331bb5a 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -53,3 +53,52 @@ unsafe impl AsBytes for GspSystemInfo {}
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

