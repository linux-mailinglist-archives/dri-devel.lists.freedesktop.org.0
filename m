Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBEB905EC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E4310E435;
	Mon, 22 Sep 2025 11:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CdzV/aYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CD210E42D;
 Mon, 22 Sep 2025 11:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x222M7pWcXx0cX+yulXwgYvgnZDaObGniqtk/syscsmxRcE2TS7OXYjoLybiLJlSuwfEb3Lp3UQmusaxiDDHS4ZO1PiCeP1ChS0kSE6YqtEPUlwzZA8GDmHGIVEDMdnmUDtAG2Chw0uDJSQT+wgmsTt+HHts99KgDXSrquoM34N2exdGK++RE5xsXl9DasI13qs9LJseZKWeTZ8Csi9E5EhD2gqjif2Aqi37VnO+SKMibtpz6eVgmIoRMsUheIPvWX61D4aeDA+1dVwMcDs6NAGjGK70vj7+QC+CtzNar6c8NdvdUU6d2yzP1SubXZZYqLBniHu9HabqLMGaG1MDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgHBP9cr9orfracRgK2VXKOddPliLzKMujCMLrspxwQ=;
 b=TcTUcqhfLcPcy2pxKJK0tmel38M+xivr8HFnvmU2rdtTq4v5I8+4sE5lT1yumIn18UIgSicvyxrg+KPVQidoRUQq2a4xmaBssiccTEIERxDUefV70OBntGdbISs87BcTOz3uv58IWTBsBAStqIG8063ah6dm98EalXZCEkekedJlID40/yl4jXW7cnjIOYVUmfFc+uemac0vFYbGK9h2wE8mrD9QSxRWWd/S65Y6JIbMhScPU4gj6nuOCO4cM77RHWt4rVSTCL6r8wwGOMZ4uGhI0jfdi+DCrPNnufMtN/ti8g9cPdw3tTOUDX3FzSHrAtR8YrRrBA8qnn8jp9E4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgHBP9cr9orfracRgK2VXKOddPliLzKMujCMLrspxwQ=;
 b=CdzV/aYeNQNMrOeQx/vyjQ6h8bjjkpr5rcqq6pEvPlmoynWI+cTp8l6VvFZiJ3aYUuWrA+Afyq4uSFFEZEopVG6SYomIoJN5uVAFb5BkcKMPDJ0PU5HsbkkAc5Cv0mpLkWraXKyLC8v+2OHx/6nY84IXjDpvsktCUS9a8N5p5/rqURgLFrbGyedmcTVDcPU6J/pyR+w1NSmUlFckeSPgK+2WRJ7YxLFWjNVDqJmo3yYiOi0xtcnM6pPOzybvTlZzVsU0FKhDBXs4HJB9ppHVpjsMkVZAzBDuEu/N8Mi4A4aD7PctAA6GXkWNdN5/SgY+rxS/0q5hC9lpZSIubjNIuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 11:30:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:30:54 +0000
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
Subject: [PATCH v2 02/10] gpu: nova-core: Create initial Gsp
Date: Mon, 22 Sep 2025 21:30:18 +1000
Message-ID: <20250922113026.3083103-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0021.ausprd01.prod.outlook.com (2603:10c6:1::33)
 To DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a2b837-24c6-4b94-2409-08ddf9cb7da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?altn/fV22i82SgCZt1DzaFDp+b15v5Qqh3jQ5hgwhXcbum2TvZrOVpFmtFNc?=
 =?us-ascii?Q?6JUwpFXLhP4e8KA5gJlEVp7YBJ3GpkHaxwNDAlLqWLKXfCehL1ZH2vn7YvJ4?=
 =?us-ascii?Q?Mi3DKnfbMPscZ2NXhMQBedVFWi0m5uF7bDATLXkieLjXQG9w41JAOM7/RILj?=
 =?us-ascii?Q?Fw7XK37XLN2Dqo1BCCZeU7yMjL1wOvoGVsBlVCulkgC8ZwZuCdEG4IkHh0r+?=
 =?us-ascii?Q?vveDJXO9iogcCIiwVB72DD2erahEFkwJS8RwmurbJaEpoZQmVRtSO1ygOEKi?=
 =?us-ascii?Q?PwI9o+WaDgkKJItJwarT9/39451ahE9usVePjTRvmJTVMA0+rmwlJloLSmBP?=
 =?us-ascii?Q?4qD6b5vAc2dPftnR0+AFhJZL1pm1I5puO1/o8T990Uoila+HdgzKvOwDRaZn?=
 =?us-ascii?Q?XvTUDyplJCF1iBq8PIJk4MDPuSlWFpAr1ZEg60PxhCxknf/QayjFKplrN9JN?=
 =?us-ascii?Q?3QwufA51nAQAxj2vZ0luO7dPqsUfzlyljZL6Tx1lTsbf1rdS17BYpO4gfGJE?=
 =?us-ascii?Q?M1j+OGLyY/znBvh57EmTJqddW3BV7cw87I7IAOnrRW/gCGJrO4squghyFwbj?=
 =?us-ascii?Q?m0uqH8NdzDWmHZoH+LjLT3b9bvE543p3PWk7QZTizTPy55tTQrcNMIo9GEJw?=
 =?us-ascii?Q?+pip5xwLi9QlP6EMOuTnOuWLvSAQ7P3RCT1tFk8l5O7JudoRZic1Jk9ICAiN?=
 =?us-ascii?Q?wKeKNQIFgxUbrCBRxNqr1Tp5z0NBEIdZDrID5Hl6CYMt4iy2OB9SbcNRkRWC?=
 =?us-ascii?Q?1NTeMOOX59DcS1dCuLRuTR8yjxaXxmgQZQDBqsk+vBP0oXYaVOx3pvHu3uz2?=
 =?us-ascii?Q?hQ9erjPlvuKjie0oBYhs5I+tj9Xr2kPzKoijUnBG2SfMeT/X2Doi0sUEYJgl?=
 =?us-ascii?Q?Bm9IEgIHd5q/kwPjdX5gzKXacVOh9NiKDz7ypdSfD65MS3BpnsM7Nz0Qbsff?=
 =?us-ascii?Q?NEVYLvNe+jKVEr/pQwILiQevpuDSmtdGISNJEbztTfiELM5KEPORbZ1iv0H+?=
 =?us-ascii?Q?KlC+gRA4uhc7OwyhxISvVhK60gc+Qdoyyu3Uu5c0wW+zgjK7kMg6tfVmYOt0?=
 =?us-ascii?Q?AUA12Y0NA63iK9skrsLCyRv3lPepKm/dMr7DI3ouKtAORblHfYdsvsrDN2As?=
 =?us-ascii?Q?iZSmJVWmoJcec4sXEMsnLBFqshRz4eRYnKXNWOliB48H1KkjtNlLdKLSeUC5?=
 =?us-ascii?Q?BNwkLEtshZRZ1SYML2BqZP68DvIfxWZOpJwP2RTlr3WcW+s0tCQv+L2bkw/J?=
 =?us-ascii?Q?2WtBnLyw/eHiKAEA82YOAIIPZxQAhh2K3HYPyYvnbaUuegV2loQ4QgiE8oGb?=
 =?us-ascii?Q?Fex7LhcLIVIA3u0/ePgSthDUrgBEsSFTBgjEVbyEYHoNev2F8nnAC5Sk6oC2?=
 =?us-ascii?Q?5l+R5GdKUjAf6JtLZybfPSoXUuKH0d9WnwVkiO57IWp2C8kFkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8IYpXh+JOSJmpCKfFlBQq3SSdAr3/ecigu7r9x6W1TYXQOgwhSMZhBZhqlw?=
 =?us-ascii?Q?Y3Irq62b3Rd8zy0ZhJT74MR8B8OEZsrM/5PMo/DfHnzzXJaCfuSsN5/BdxaH?=
 =?us-ascii?Q?RgAPTgxoV3yFw4Huu0GzPchsHjGIImNabQZsFCe15Bht0L9fZc4Q70DihD+5?=
 =?us-ascii?Q?H+EtBmJloL5yVGi05Jwob4mvT0px8iSdHmbWpYQuZYm+FnPYTxQ9qAHY9EWU?=
 =?us-ascii?Q?HGPjm1/v1Q+/hXMHSm2t2vzrTzPHaeVAyeLdygWd658YSBUdGQUAQaD5h+h7?=
 =?us-ascii?Q?Wafg3KoWrHRK93QfsGpZFd9fLXTuDOLU0Bv29PcKxMzFKnsLv3INMkamPgjt?=
 =?us-ascii?Q?vyWnXt1rchF7oU5qEBbWXMZSdOQrV6t7Ytory7S8uZKq9F3/2Ba6hVBJlZmP?=
 =?us-ascii?Q?X+0cWNUgF8vNTyxbfRpKUads16hQkWvrfbCF8LWB91NVRbF5Jtp3o6rLKBI+?=
 =?us-ascii?Q?83APzJ7RO2DVcVviJJHaEozAzQKCINK959Nw0Oo8h/9U1uGuMtFmUcBugpDY?=
 =?us-ascii?Q?Z5AkRxGvMo9rEEVqz7WPuumOhjgiph26PAQhTOVYLmA0m322MYvbKwv0XXFW?=
 =?us-ascii?Q?2CCix4WdiCI5F6apMrG1ZbNv6sLUP6/1ts/pXg2w+ol9Vl9EZUdmF5vWezjG?=
 =?us-ascii?Q?vV4YZqRYgDatJKL9iOKjIsmTcZ/6SUunXYPSYIGThDC6e4QCUik0dIPyZ58f?=
 =?us-ascii?Q?P7y6Q0xcwVcOL1xCNmleiNJ3m3anhZBaJBAVYpP/f3tIO20paW/+Nz9rgpv5?=
 =?us-ascii?Q?aKNbzt6cXjexekRB0v1rJhaWvlKoHIw860DletjOFwbhPe8dTwG+RRJdmYEA?=
 =?us-ascii?Q?e9NS0esIW5nu9VN8jMd6puxEfazJsnnZHzjGfGs+eBWhFsleoQMlLxq1Q7y5?=
 =?us-ascii?Q?W6mbBCqHqFtqsUSDW73jHXHlQDigaED2Ysvt1RKZTuDyCq/VyiYJkVxGKvDI?=
 =?us-ascii?Q?1vU76kr2bN4Yt2ZcK+IGAuxAJhrpUC881uMlrOQiMbeVnvQ8imFs4H6FyUYo?=
 =?us-ascii?Q?Y/AUQ/AuPNIpb3hzAXPIdCcESxoPBsYnnG3O1cDW39PPawq63HZ9jwOcduBD?=
 =?us-ascii?Q?C3xds2gSvocooGQXn/yWyJ58Yssj3okSxqxoUUP4Wm5TV0S14d1eD9ifm5RA?=
 =?us-ascii?Q?3GA/oG/YKfg9a03jEANzt/vMNUkpqAFeMVOizs+Y3kOFBXFlWX76dEBoM+KI?=
 =?us-ascii?Q?nIgpNefBtPakIBRTpX62RRYyJ/pgXo1Fpuq8hkjkdwayAwQ2f1C4KkAjpU6I?=
 =?us-ascii?Q?/mCWPlYcbnMRqe+CmPU53nTQ2DZdOVRojBs4Q5mh7TU4guhtONESU9CNOx6O?=
 =?us-ascii?Q?p9P8L8Fm31kStoouxyPTvVdWD4KKnBlLDpo34ak0yaNovqFWZwzKiBbJdUEk?=
 =?us-ascii?Q?+J7Zs5j3CjHoRYDGvdCkHMLxQdM3oT4ZAjJSAE6m/BndeJ3+KFxEAtWLMVM6?=
 =?us-ascii?Q?y2pjBI3CSn+fREgTyjyPfFIE+v0pSE/g9keF6Y9aQpWBsg22Ct7wHteSCYTc?=
 =?us-ascii?Q?IEH1bDjdNpMrTx5VFc0XCwiJRpnpEmQwqWjQn8Sm3Us1D+2wToSrwDxfwi51?=
 =?us-ascii?Q?t4MT66Ak2HthbD122fRyq8wHcicpdLuqpA1wl2vJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a2b837-24c6-4b94-2409-08ddf9cb7da6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:30:53.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xvy/9GBtr+KYe7gtukqlQb6Hp3LcRtDsIcKUxQxJrbb+RZvwDrUES6pt7cRkUOU6ZUW7RKHAdqclF55oucgu4g==
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

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:

 - Renamed GspMemOjbects to Gsp as that is what they are
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gpu.rs                  |  2 +-
 drivers/gpu/nova-core/gsp.rs                  | 80 +++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs               | 39 +++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 19 +++++
 4 files changed, 131 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5da9ad726483..c939b3868271 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -221,7 +221,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 503ce8ee0420..0185f66971ff 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,27 +1,91 @@
 // SPDX-License-Identifier: GPL-2.0
 
 mod boot;
-
-use kernel::prelude::*;
-
 mod fw;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
+use kernel::pci;
+use kernel::prelude::*;
 use kernel::ptr::Alignment;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
 /// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
 #[pin_data]
-pub(crate) struct Gsp {}
+pub(crate) struct Gsp {
+    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub loginit: CoherentAllocation<u8>,
+    pub logintr: CoherentAllocation<u8>,
+    pub logrm: CoherentAllocation<u8>,
+}
+
+/// Creates a self-mapping page table for `obj` at its beginning.
+fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
+    let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
+    let handle = obj.dma_handle();
+
+    // SAFETY:
+    //  - By the invariants of the CoherentAllocation ptr is non-NULL.
+    //  - CoherentAllocation CPU addresses are always aligned to a
+    //    page-boundary, satisfying the alignment requirements for
+    //    from_raw_parts_mut()
+    //  - The allocation size is at least as long as 8 * num_pages as
+    //    GSP_PAGE_SIZE is larger than 8 bytes.
+    let ptes = unsafe {
+        let ptr = obj.start_ptr_mut().cast::<u64>().add(1);
+        core::slice::from_raw_parts_mut(ptr, num_pages)
+    };
+
+    for (i, pte) in ptes.iter_mut().enumerate() {
+        *pte = handle + ((i as u64) << GSP_PAGE_SHIFT);
+    }
+}
+
+/// Creates a new `CoherentAllocation<A>` with `name` of `size` elements, and
+/// register it into the `libos` object at argument position `libos_arg_nr`.
+fn create_coherent_dma_object<A: AsBytes + FromBytes>(
+    dev: &device::Device<device::Bound>,
+    name: &'static str,
+    size: usize,
+    libos: &mut CoherentAllocation<LibosMemoryRegionInitArgument>,
+    libos_arg_nr: usize,
+) -> Result<CoherentAllocation<A>> {
+    let obj = CoherentAllocation::<A>::alloc_coherent(dev, size, GFP_KERNEL | __GFP_ZERO)?;
+
+    dma_write!(libos[libos_arg_nr] = LibosMemoryRegionInitArgument::new(name, &obj))?;
+
+    Ok(obj)
+}
 
 impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let mut libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        let mut loginit = create_coherent_dma_object::<u8>(dev, "LOGINIT", 0x10000, &mut libos, 0)?;
+        create_pte_array(&mut loginit);
+        let mut logintr = create_coherent_dma_object::<u8>(dev, "LOGINTR", 0x10000, &mut libos, 1)?;
+        create_pte_array(&mut logintr);
+        let mut logrm = create_coherent_dma_object::<u8>(dev, "LOGRM", 0x10000, &mut libos, 2)?;
+        create_pte_array(&mut logrm);
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 181baa401770..dd1e7fc85d85 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,8 +7,10 @@
 
 use core::ops::Range;
 
+use kernel::dma::CoherentAllocation;
 use kernel::ptr::Alignable;
 use kernel::sizes::SZ_1M;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::gpu::Chipset;
 use crate::gsp;
@@ -99,3 +101,40 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Self {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: obj.size() as u64,
+            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS as u8,
+            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM as u8,
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}
-- 
2.50.1

