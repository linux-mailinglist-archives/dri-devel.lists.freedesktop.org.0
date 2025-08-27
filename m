Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E715B37D92
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79AF10E777;
	Wed, 27 Aug 2025 08:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GLNKtEzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010AF10E772;
 Wed, 27 Aug 2025 08:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2128JBXe6Ws2VLp6BioF6BaFWlwEfCfmPux2AEhUbLZosVyT8oAxB0qlHe0zq0LeHUzf/meEmS05uiyYVK0FIwEGCbcMb1ySTm2tK1W6oFGrJPs9oO8aIxlIa7ehWaRQS2ErhoaDeEUojAd6EeuPr9kmpQWeC8jFR5AIuxQlbHEatFyzSLHiAszcJBs6/xaHNcG9f9ciJjMA/PC5FS5+Pmf8yHo82QDxOeyhU54yQcfB6XSJhFUyKLv6K+sNtDnLTgjHi+wT7G1jnj8TQuZdoHfN1Km+K4HO9eiQCBl9mjLvXEC3ACUyigU/Cii6nntXnabU8Lc0WBSy9Nn2y/6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JA6cgRRZlC0mwE7/NnQP6gQ6+hqC8EH2h7HC7cEl+U=;
 b=Ggaq1iQqEZCspYRd22BxdNfBU2Oo59sYi1KiT0gzQgSDz1JZbUPtV4cm7lJ0PeUts+3IcuThmZk6WSkQURhMJzXa/izT6kbq6dTEtJP0I3gbLjxANIEzVb4Xik2UmrxhlfbmB3BZcuqeMj2foMiBZpC0xtNYDanJK24iev6a01Xeos2Bx+LIK+fR3Yr++LGpZTPiEBGpM3ejj4jVOC3GDM8ojOtD2PEORKNEYOMXrY2Bn1QK7SieQwaIr2cnUPnPkhITLRtDE/2xj11ZtA3L1y3t/ccXT+qbcq3DfQWEe1yo05H4I+yWbvSTl8VOC57FrYSaTIwzw6j3gGe75wnexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JA6cgRRZlC0mwE7/NnQP6gQ6+hqC8EH2h7HC7cEl+U=;
 b=GLNKtEzQE1v7NaGiHwwGOm5kzMh7/n84s8JM5CqztWmR8FJZ5kfrdJ6kb3TE7wyD9kMIgfdJpFm1FS/85EHZ63uzFovFNbpazBK1ceaECx3xL2NilLCPX3hDgTR3HrzaGCsvdTqhc7hxgdQAdAZ42+Uqu+aawPsd2MAw6D7SjViBOL5NHD0Pgdx2W26ZygUgYDIGCnlVcTsvOcZF1Bc/3gDjf3z65GI08b1zsu4XIgN131BRKqFqLcOyuusxemN8f6XkhaextRzn5C8+EVhURMpl/xiDo/9eA9bjWuPmrXpRW+cKWWZcHXlHuR65Yndr8q4clUtFDEXv4BFLMcM0bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:57 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:57 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
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
Subject: [PATCH 06/10] gpu: nova-core: gsp: Create rmargs
Date: Wed, 27 Aug 2025 18:20:03 +1000
Message-ID: <20250827082015.959430-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0144.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::14) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c7fa9a-7b1e-4ffa-1d9a-08dde542a5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aj0qVTHMg5HtItfTUoYoQXPvgrXmTGTW34DXvq6YnX9k8xr9ivKJgAR/x72A?=
 =?us-ascii?Q?TXbgGF2u6GngdgBHr3Eko51g0Z98LVlLGKWQgcL+Vjt/Gi34erpNnFCvoR2v?=
 =?us-ascii?Q?lKm0jrmJawM5ZMx3V0yoM0H6IuMl0ZZGa/etJEv8py+WtVL+90myH6MEJbb0?=
 =?us-ascii?Q?D+LHLC2HxDjMcKROqVLRvFHeST4k7NiatQ6GpHzaSuvuLjLvlY1ldXapgMf5?=
 =?us-ascii?Q?ZhwOsTIfcnTp1OQ4DuCQjSidNgO1TstJ30PMxTkTsQZXxDJoUS5002fGfOIx?=
 =?us-ascii?Q?ZFGsdVx99pg64dQb0WjPWNgEtFRNRSgZrBOFFDG4iX9Ixg0o+xfOBDQNJ3Y1?=
 =?us-ascii?Q?ZBJj0LiuItmeo13dXILs53V5CgZZUGWpAoSsiUZx7kVPJWOsqQLCglUFzL1L?=
 =?us-ascii?Q?0SZfs5lhPb+Lpi2OrA5I7mjuVZ5ifPOEOoci3mqT04lLK+qFhY2Kp0YDVnnU?=
 =?us-ascii?Q?B8fj18+1jJTL+CNGD5Rphvu2damOij8jyVhSUHz9QpGyAfWtacXfUdxWT/JN?=
 =?us-ascii?Q?WGiNKVdkpjG28KyxlbWk3phpDHH75UjhWQ5tPXlOcvz96spuxj0r6Tc5WAnK?=
 =?us-ascii?Q?cPLKyE0+kgHUOqWepIW1BT7s7MZvsva8uDAO3VTCr7PpJK3DaW9bLFOuWYyW?=
 =?us-ascii?Q?ZgCAgFfabj4p6IYe8pjaV70hnAl78ZtppXwTReZG25TE/zIFNsWiJL9ywsw/?=
 =?us-ascii?Q?ylRSp4Tzp2proxgDEjUWWDj6dGtzibD6bYZOwIf3dorEdd053PTXuf/LeX0Q?=
 =?us-ascii?Q?vB3BzWO87iS1cbrmD+rUuGID9sVZgqbxuZmJKJ6YTv5mr2oc94EKvuiBOGxG?=
 =?us-ascii?Q?N3DR2PMIak0EiJ5iCG4Dv9RA1gBfgzMizMHZtS6KNfqYz/4UGkNtPy+SUkq4?=
 =?us-ascii?Q?dAxE9elgjv5q8F0hdRV8gGRxcHAcRJwJUr5TAXE9CLziu9ndDYMnUZr9ABLP?=
 =?us-ascii?Q?YMoEeORga+rsiZfcyjqnR4Yt3buv1swxMgmn7mvKAqzFYOt9f0XS52VTzhcc?=
 =?us-ascii?Q?MvbG8/M1MAupVJjDfGy36q2W5zFjPOJ9wcL87pz7FaFyV5GTbQp3qCtfCL9E?=
 =?us-ascii?Q?kIYul5ND4tmYtWFi9uf3ubn8sI1sWhk04riJ2H4Y5Z12EE/rnjCAflGKam4n?=
 =?us-ascii?Q?g6KVcakqKNjBcpmkPUDohODngFUbiACDndoUk2p10/NZGzR/MbvI5Zvh9lTc?=
 =?us-ascii?Q?l6/dwdik8ojRmnXnaMtgT4d/F/jjMI91oPbCkJ2xm6Bv+vOz/iSCqhv/8jv7?=
 =?us-ascii?Q?/6L0VRAaKPlRvb+QeTcYsb5Uj+P++Kn7QxsxPP6txHUnIJwJUpV0eFld3E/g?=
 =?us-ascii?Q?DcIHGSsgBSy7uqz/61AYWkOt4deNGq2CUNYJ4BxOiE3Z9uPEXWveyyRaCEGU?=
 =?us-ascii?Q?POvui+WmH5nXL2u9y/k4QmaYUZuvmzgFY59+Ikg/O93LdmLVXNiCqCrVlOHH?=
 =?us-ascii?Q?mz/Ojd+0v58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UCxCTC59d5/OvE9U1tl6Ovw43LDK1R+qzYa1fvb/526o5tUmjN8Pg2D+r7nF?=
 =?us-ascii?Q?JvRdzEnTWHRg/IZIYL7Mo50RuSyEiMr4mNx7IudLsNRhSx2vpVLA8kvec1jx?=
 =?us-ascii?Q?Okf78pbLm6z4SNeEit06SCiiWyj7AfZZWxyptkYfkIiEqz1Yh1Viu4SQAS3H?=
 =?us-ascii?Q?24t1SjGm6mXYmq4ibzAbvrU+Xq3UylLGy/j7B2PiMqP9vSiaaneFdAraQ1vL?=
 =?us-ascii?Q?+a7H7o+x7WHjCISLT75/KoVFAxia3ungE/sfbD4EnqvMAz7GvEep3ea7XDZj?=
 =?us-ascii?Q?EnUh3b/OgJdtT5E4fQzqVcWcuFJKTy6BS2zfwomy+SGfWw/2PloyUzEO7LwS?=
 =?us-ascii?Q?GlZ5Bln0WKhw77vB3lnlU2IkL2HcVQ+SBKryKqkIatmTH4T1mQEoULxVdzJG?=
 =?us-ascii?Q?sM58RLOAVDxflY6Ix2+SG7gOpyG466p2Q3+/2jru5mSM2x8h4KtPyz/iL9pO?=
 =?us-ascii?Q?hIVjB2RUMk7Rmy70FXRkr4xgHdu4DXAoaMxEhY+2Hd9d5HSKGng86nS9dY2J?=
 =?us-ascii?Q?B3QabWvzU3LvfQ6a+ySw3rARr7EPo5YJgctIkSbIpPJ9ooCjvg/OTkN4DmH0?=
 =?us-ascii?Q?i5H4llz4vm8ZEM9nEMYB9cuAILHLKEj97oMXxNhHKn+c+jkkE/BBNnSzDWF+?=
 =?us-ascii?Q?vhFE7FMBfngflVmjhnwQQ2kaXvyLd7V6knE/rhYq2S8K9/uWQrk2yKwwTvvO?=
 =?us-ascii?Q?K/vM7UYkSELz0rT5dEb9RffOaZuMM7PlU2zZDMMnOMyjiNKGryBMSSpJae7V?=
 =?us-ascii?Q?JUZ/4rBczkvE1wXeRD2ii1r7QfxoobIYeaRn0IwzPRVs1AYVEb09gUPvA1gU?=
 =?us-ascii?Q?Ixe1ee3b+J5hzLhUk5tH9d3XGBIrlYgG3Yv1Cg+e8kruGLSDv5KKnsHinO1F?=
 =?us-ascii?Q?+j3syTpg2UT2TxESEYgRzGglg8q/eTNJehg65Kk/UYtLdi0aehHDOFlBCk60?=
 =?us-ascii?Q?qzvmEIdFPzu+XKpOTdCdTPpjE96rW6dyTxc1dzVKKCegWin8BV+wRtzGLd9j?=
 =?us-ascii?Q?gi4gA/pYsP2+/Dzu1cdyRPsI1rW7Li5e8sYG8TvTEoO8tftiBxvK022y9p9o?=
 =?us-ascii?Q?x894OdeO04tOTzuaUz5w7rijILf4M7ONO/7rZSnwcnhU6An8wuVitQL1HKI2?=
 =?us-ascii?Q?Vrl66IJLmGUujUKfW9C2CSVYA7ndBsaImQ0OOVJ/sdtKks+7RUx9ZmGuaGVW?=
 =?us-ascii?Q?E2Gy52u9VmQ+idmJiOaZpLdnxFI8ughjOJeNjHKHN2QIG4+yDkJxaIlZjgaf?=
 =?us-ascii?Q?JQJ3VzwawAx6Bf2KEe07jConG5hi8MjU+mtdSLqak5DO56Wl4WfymTqZAItb?=
 =?us-ascii?Q?FHotMDv2y3+UUBJXThyx3HiHYrK/Q6tgM+eoVqj8E++yulJh/MyteeHtarpZ?=
 =?us-ascii?Q?OFS13bjRUOmZ6E+Yrm6Fub9lIFvJGfnBXmy0dPidj8IsTnUoZlK7hiEp4chL?=
 =?us-ascii?Q?H5CTQAsoNzoIwDHajljeAO307VxLJZR36wUSefBi2CkIL5r1IbUDRQb/G4ZT?=
 =?us-ascii?Q?CLtFii+xw9SQf8mp+GmZNSWGwoklnievtKfJKlvMwQ/aI939MVp5WohrcV9N?=
 =?us-ascii?Q?QV95eUbLDZ4cSglcOg/FM45V2z/CdarIKoMWS0Tw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c7fa9a-7b1e-4ffa-1d9a-08dde542a5ea
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:57.4546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQkHP6TIUvLB4mGxrHgsVgaHH3QKUvZ6SCa+QX0c7M8AWIGkpJMu3TrSzXMKfibJ82LU9B8qEFDQL2oFQVGETA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                  | 44 +++++++++++++++++--
 drivers/gpu/nova-core/gsp/cmdq.rs             | 13 +++++-
 drivers/gpu/nova-core/nvfw.rs                 |  6 +++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 33 ++++++++++++++
 4 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 41a88087d9baa..56a6be7b9eb15 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,8 +17,9 @@
 use crate::nvfw::{
     GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
-    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM, GSP_FW_WPR_META_MAGIC,
-    GSP_FW_WPR_META_REVISION,
+    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM, GSP_ARGUMENTS_CACHED,
+    GSP_FW_WPR_META_MAGIC, GSP_FW_WPR_META_REVISION, GSP_SR_INIT_ARGUMENTS,
+    MESSAGE_QUEUE_INIT_ARGUMENTS,
 };
 
 pub(crate) mod cmdq;
@@ -41,6 +42,19 @@ unsafe impl AsBytes for GspFwWprMeta {}
 // are valid.
 unsafe impl FromBytes for GspFwWprMeta {}
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GSP_ARGUMENTS_CACHED {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GSP_ARGUMENTS_CACHED {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MESSAGE_QUEUE_INIT_ARGUMENTS {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GSP_SR_INIT_ARGUMENTS {}
+
 #[allow(unused)]
 pub(crate) struct GspMemObjects {
     libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
@@ -49,6 +63,7 @@ pub(crate) struct GspMemObjects {
     pub logrm: CoherentAllocation<u8>,
     pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
     pub cmdq: GspCmdq,
+    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
 }
 
 pub(crate) fn build_wpr_meta(
@@ -179,13 +194,36 @@ pub(crate) fn new(
         let wpr_meta = build_wpr_meta(dev, fw, fb_layout)?;
 
         // Creates its own PTE array
-        let cmdq = GspCmdq::new(dev)?;
+        let mut cmdq = GspCmdq::new(dev)?;
+        let rmargs =
+            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "RMARGS", 1, &mut libos, 3)?;
+        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offset) = cmdq.get_cmdq_offsets();
+
+        dma_write!(
+            rmargs[0].messageQueueInitArguments = MESSAGE_QUEUE_INIT_ARGUMENTS {
+                sharedMemPhysAddr: shared_mem_phys_addr,
+                pageTableEntryCount: cmdq.nr_ptes,
+                cmdQueueOffset: cmd_queue_offset,
+                statQueueOffset: stat_queue_offset,
+                ..Default::default()
+            }
+        )?;
+        dma_write!(
+            rmargs[0].srInitArguments = GSP_SR_INIT_ARGUMENTS {
+                oldLevel: 0,
+                flags: 0,
+                bInPMTransition: 0,
+                ..Default::default()
+            }
+        )?;
+        dma_write!(rmargs[0].bDmemStack = 1)?;
 
         Ok(GspMemObjects {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             wpr_meta,
             cmdq,
         })
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3f5d31c8e68f2..134ed0e20d9e3 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -162,7 +162,7 @@ pub(crate) struct GspCmdq {
     msg_count: u32,
     seq: u32,
     gsp_mem: CoherentAllocation<GspMem>,
-    pub _nr_ptes: u32,
+    pub nr_ptes: u32,
 }
 
 // A reference to a message currently sitting in the GSP command queue. May
@@ -289,7 +289,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
             msg_count: MSG_COUNT,
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
+            nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -639,6 +639,15 @@ pub(crate) fn receive_msg_from_gsp<'a>(&'a mut self) -> Result<GspQueueMessage<'
         Ok(gspq_msg)
     }
 
+    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
+        (
+            self.gsp_mem.dma_handle(),
+            core::mem::offset_of!(Msgq, msgq) as u64,
+            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_of!(GspMem, cpuq)
+                + core::mem::offset_of!(Msgq, msgq)) as u64,
+        )
+    }
+
     fn ack_msg(&mut self, length: u32) -> Result {
         const HEADER_SIZE: u32 = (size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()) as u32;
         let mut rptr = self.cpu_rptr();
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 0db4e18f7dc97..3d934cc95feb0 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -47,9 +47,15 @@ pub(crate) struct LibosParams {
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
     LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
 
+    GSP_ARGUMENTS_CACHED,
+
     // GSP firmware constants
     GSP_FW_WPR_META_MAGIC,
     GSP_FW_WPR_META_REVISION,
+    GSP_SR_INIT_ARGUMENTS,
+
+    // RM message queue parameters
+    MESSAGE_QUEUE_INIT_ARGUMENTS,
 
     // GSP events
     NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 8820c488cd25f..ab331fe6b1c81 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -288,6 +288,39 @@
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub sharedMemPhysAddr: u64_,
+    pub pageTableEntryCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub bInPMTransition: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub gpuInstance: u32_,
+    pub bDmemStack: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
 #[derive(Copy, Clone)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
-- 
2.47.2

