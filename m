Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A324BBE6777
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3270110EB0C;
	Fri, 17 Oct 2025 05:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PdPD7qxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010064.outbound.protection.outlook.com
 [40.93.198.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60910EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvFHCkz387+COYBN6r/Xp4ozYULaXvpAVZlFVdPYe3QoeTWPel0kVASJ2gpqnFQRIwu4itSPnHP1HYE4bLOLeoHGjQXDtlDRcXBeV2b27cYBguTyI+Mf//sVNh2jO61FIz0MG3oyGlWG4GIzhBg4LGoL2XP/zhT63HRqg/qNIQk/URXw1OzwlwKNvV51d6Xe8Hx3sv3GQxXBIiwTDVVBiUSJUHqvWebGkZVt3CixJ8Jmoj87MpK3MNvFVVbt+Up0c5T5IX5rWmcUwiwYtCiuLv3altfBZrhKvz6tOL461OGY86I+PvkUEpwvGxLnEx55B+MSLOVRuBjNRJyLdkDyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fNUuP3an4VXMdm6Z/jskL75Vk7iZ2qjYq4g25dlglE=;
 b=KHMRBygkObgSnHWQEfH70+glipN+0SGZjfgU5L/2M8NxL1/7P5IrLC10jdoE7UA0DXWKkB0gbOjRCyKKI3FVZ5CABbwU1dme9yp1s8k0rTm6bYS8pxyBy7s5tg0VqE2aXeuNBvx3D109FZOb8ZpRM37MDjOWl53edPVZozPfACwxB9BxTEsjeLNuk9Y/z/8HwKGaIHTi4RTPCdRIQ79ZwvTVqM4G26SYVhFgDSyfc5wRdVNV4YpwidgCFrHwmGPGfpr3sxa+bxZaSR86Xg2Nn9ANn0C116JwwMLaPET97dvR1PRE4qP9y/Qgmlraf8G/okRCTtgtF+meZ97Jn0XL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fNUuP3an4VXMdm6Z/jskL75Vk7iZ2qjYq4g25dlglE=;
 b=PdPD7qxp5IABNBeX0ZxO07s8uo53JZdfR8sR71RA4IOx/E6brVZ9nLKUDRIGkC6BHjsXt6qNnQqNCskgitGHY2o//Oqp4B4h/d2Q/IfwR78MhTQrZdYudP2CpNQYqckL+v1o8JNRKE5vhyXYPPQ99Y4Dl0tAuxn/Zzeg5LZsIgS72b7Nsq4miacn2BGrPxuNg86M1M+oIdMpjSWVuLodLHKGmnOxS63aR4QQwphy1UXN/KeHr8EnjNYpqtCJpRpkFgJDVelPkmxvPWgER9B0UdBEyizY7/G3vrbniFrLinfLLaAEQe20H83A2tf1JjhVeoTygtnPmpSk0dwVfF8Xkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:09 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 05/11] gpu: nova-core: Add zeroable trait to bindings
Date: Fri, 17 Oct 2025 16:47:30 +1100
Message-ID: <20251017054736.2984332-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0139.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: c2162662-ae14-4351-366e-08de0d40c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?egeP11w6vnbPfD+NB3ZL0hh1GeGpqHZoolkX5vq6aHln78OWojPeypFGCc4Y?=
 =?us-ascii?Q?kQ/4n6BWN/K1uobxYs76/V6PSnBwrzProydubaruuT/8gXvpfF57BBmlxcB8?=
 =?us-ascii?Q?22Mm6Ilb4OrT1yepLrk8r3ZKwM39XJKvwMYUxS4vwQm/mbRwBiWgC5T2VATA?=
 =?us-ascii?Q?pdvflvBJhK2dbnbaAIWaseGRaCeBa6KofML7xvbdl09wLkjJq/U8phRkKytZ?=
 =?us-ascii?Q?5cLSmxLGrjgN1vYuYkJsqVbwLcIkhzrZ5wTwl9lylbp2RD5H/wbRDckbcvlh?=
 =?us-ascii?Q?Asm/89IUFV1OeHh4WcuFZLKmel20bv9oHQx3ewhUDzdYWZa0tkKgi511f8Lf?=
 =?us-ascii?Q?e4/jyQfDcIS8yoXWjpMVie0vFErSEWdTB74CmqIXee3JMI68gJNIhvwAsMFo?=
 =?us-ascii?Q?rf6UUC60WAj6Hzzfwr+cc6D1t9E45aZta0ux9d0sYu3sNj5djn/iwMpFtdus?=
 =?us-ascii?Q?5IuCQCWAvIWvQ+B9dITz/N+gQaAMR0GroeaMukXxV5yIgB//3kqyOziHI74c?=
 =?us-ascii?Q?anp8hVJHA0x5de0OSVIUH6BTS8YrIDTNXy6cw7H0KZ2zyJQjRJHKkQBdLiLG?=
 =?us-ascii?Q?1EO5dTgg4ietXAn1F7+Iha0D/ye56PqYkKWbSqLd7AfAwS9ncsiuU4Psk5tq?=
 =?us-ascii?Q?aUeku7OLE3Pq1bkUXHcIgMer+9Q3xygSjRHPJjMXT9uuSivQawBpmaTazUjX?=
 =?us-ascii?Q?pgzLtdD5RMB7qR3JmhQWH7Pof07LpAq72B98FGuFUfekfnkmTPou4a9VS+hQ?=
 =?us-ascii?Q?XXyA5j+GDINLtJUbU8ffqeoP1Wspofcou/Uk+KrQwVhumvZcAVXXaELj5h5X?=
 =?us-ascii?Q?/EEwXw73nk9exn3695tshjIMxgRE4SqcjIsuNMkyy9tZ6sDIBuLuWRKC1MHn?=
 =?us-ascii?Q?tqUh6cpu6ArT+0H5hX0NAkX5AlhsCdck92Z92wLVPwKZ0fJIKhH++yQ3TTkX?=
 =?us-ascii?Q?MOd+TmTTqKt2M64+mZcv0hqlgZzxCDRbl+vqqi/wb77gbbckJH4U/DWEnPX+?=
 =?us-ascii?Q?n5JbDhdYWgD1yZyETDlny+E1eHnj2RWotPtFIdlcssB6nUbc49zCA7NCfDgc?=
 =?us-ascii?Q?30PNcd5TaV5+ybx17t7j7PKZJQTADPJyXSuZYOKy2yYDdIDHv5J893UVSiHm?=
 =?us-ascii?Q?1vqDoe5w8mOiGrNcou3VzG0TWGPg1B+w2lUkiOynCgHsl71N3TjjAscYp+v0?=
 =?us-ascii?Q?RiSMZ+gLrzAypSc6OQrQQMNk9SSPUhpTEkXO/GETwkZiKNPRMbqCRo+11rCV?=
 =?us-ascii?Q?9MF28yOn0pY7EN742M8gx4WBKfNQanch/ajYUxABCaoCGmbx63sczKaRY4c8?=
 =?us-ascii?Q?TnrHkxlXfrap05sNui/axNFcF3cRkUhP++TVRmCKrwmOgnxsgRP3a9Y9lCwC?=
 =?us-ascii?Q?SWQDZiFOe2DKzPIhMDGJEw7pGHCeIxAEpXzPYJsRz553Ls657KFNQyDJxJXs?=
 =?us-ascii?Q?rPbZLxbO1ZjzIhXLEOQmA2os6nNPQ1lw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TaYhL3sQxvyo3MY73a4ZjGR/30Qs5oLBI5FYpcGw5yE4tj5gW9boa532SXvH?=
 =?us-ascii?Q?xsSIGMrYy2gfL0532leR6eFymEG+7PF1Af1uL/YTwgUm7Ek1QMUkehHSPKWo?=
 =?us-ascii?Q?lD6VWv4WV4qXQ0oTpwe2Y4ZOHfJ75zQnb+WvS4OUzXVYKoMXpjf18z/fGc7L?=
 =?us-ascii?Q?gsIe2Jy7bspaBcD39HYumOxkLhy7gmfs0CsG3VaLuZxYsF8SLgPmwMZw9BA3?=
 =?us-ascii?Q?snUg1L5K62COTa4wnUPfzH/hFALa+G9XAVXcQ7gnHz1SgUy6E3GFM5VvxT0i?=
 =?us-ascii?Q?dg+qpuWzmyO+N7tshTdWPoZ5xNdF2MebbZmqbPzrrV/iqhf5rLTg5kUfspz+?=
 =?us-ascii?Q?6uAPt4LvdhQQpfyONQn6nVmn1Q2zfppDSslbF3r0jn+oglsH0HV5U1XbLfwd?=
 =?us-ascii?Q?nOd7AXTH5jLuZEXYkdpwKslth84c+QWq3fdd2l7+QWd9OidYpobwDBPyBMmg?=
 =?us-ascii?Q?BnmssRe+jBQcL+X/nFVpMekDFb+wZ3VmAaeIPE8Qsdp6hCv57Gm8oAye75SM?=
 =?us-ascii?Q?Y8tKaD3encTgwkYkIw4EF6mHXRfg3RRWEn5X5q6vp4L9QruMP1waZprKGoU4?=
 =?us-ascii?Q?3ytSH17NoK47+X5epQvAKyE2eXhAhvj5xB/WeZifYI/RWlcRk1YkDOD253S/?=
 =?us-ascii?Q?Oy2YLpm96eWx3CyiiZgZFVE9OHgj5EhRWwMeLSZ7oSWUvGSJ6n8Cl806miGp?=
 =?us-ascii?Q?PXb0pK3fnvl/OKdkcrje9S/9E2RwwE4jnsp2ijYGqaSAs1KXw+ti+C3ZOpdi?=
 =?us-ascii?Q?CjiysyHaRihbcI435gL89s9EsdddUR5U3Raia5ut3ir3xilKBztCgQNm68O3?=
 =?us-ascii?Q?i3Z5OX8Wp8/0+OgPTPIKmpEn9zTrIiB3fT1JiyBPxHAwA6Fw5K9kUWEAO+iu?=
 =?us-ascii?Q?vSGQmlNh/S2Zu9/qi1GKZDFfRXPdMcz+3VdaBL9G7bEIB3yHLsLRUIWTsuPX?=
 =?us-ascii?Q?z1ABKuwfbOWbfYCedM3rF1UjZNWoI8ZleR+0QcmyZzANIEY+sCKgtKu628lU?=
 =?us-ascii?Q?f4RlMp7lUEgaak/ts+nl666seUymNY1dexfmd6XE4oHVt3T4IZ20vX4On8o4?=
 =?us-ascii?Q?qf/8HG3wre7qTvMUjXRSCwt13/IQaFdtr/7BTVk4JlxhWHIMJaUZQ3mdGlYk?=
 =?us-ascii?Q?PGEVFwHi8AgaopZ68sszrWzGqoy/D5jvrKvat/uPpUMZTiDfsZYN3CLgNoe8?=
 =?us-ascii?Q?/CAaQJHqlG9tpM2CeqlH2am4A/94S4Fb2GxbnScoVZXdPtsWhyHV2NjIc7ot?=
 =?us-ascii?Q?4/wyaHyvpvLGLPztj5PJVBTvZ+j/cGc3YKvXFZgPO9EsnbvC0vzVoAH9CdtH?=
 =?us-ascii?Q?51hMbroXQuEBGsZEqgAffiOgDE6bBrCX9Ih/ecWhtNk4IdYo5ezDdciMU3jT?=
 =?us-ascii?Q?ahFriK+ORFItQc2d4F+VKH0nCNAFEg2xrDsh18iemU7WDo8GMDyje2AkophD?=
 =?us-ascii?Q?FjvHKgOmyvVVuVWO4N9xf+TrF8m4Zon4UTDo1HKxnMqLhks3j/2DPNzfPuff?=
 =?us-ascii?Q?cBgnjuvMLkci83Yyr6f2mv3iydAEOEGAovZ1eI2PwHJmlouQC2Adt/JpChib?=
 =?us-ascii?Q?bPGmo5QyQ9m4pdfiPDkblIwos6YP5fn3lIw+apqg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2162662-ae14-4351-366e-08de0d40c0bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:09.9211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u278TurPpp2jg3j7oFRfM4uClkE/hqaFSAzRHn/Xx5kUqovMqZ77sQNV2XX+650i0y29nKXlUulALxUTuQKUMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

Derive the Zeroable trait for existing bindgen generated bindings. This
is safe because all bindgen generated types are simple integer types for
which any bit pattern, including all zeros, is valid.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - New for v5
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs         |  1 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs    | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 82a973cd99c3..4f5c65ac1eb9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -25,4 +25,5 @@
     unsafe_op_in_unsafe_fn
 )]
 use kernel::ffi;
+use kernel::prelude::Zeroable;
 include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..f7b38978c5f8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -20,7 +20,7 @@
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -55,19 +55,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -83,13 +83,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -101,7 +101,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -136,7 +136,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,
-- 
2.50.1

