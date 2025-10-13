Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D2BD19E6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88E10E3A9;
	Mon, 13 Oct 2025 06:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WqnhEAa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A0910E3A8;
 Mon, 13 Oct 2025 06:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQL2736tcVxqBBg0OMUS2xs3TcK7rmSuwlOcOK1eKohi2XCHLjKhtULoaFUzCUO2E0+hE7lA2I+75D/mQ65Nusj0OexwCii7O+q0N4DM8DXeT2FOL0mw793kvl/11jNCZh7P8FzgKzfTIytZeGmfTJwZBMRtDbKlxg/UJGhzk2GVFI4iLpwvPhREUmF7KyfaJcGoRyjvenoS1BzH50bgT1xOgF73E9MDT5JWXDoR3Rx0W+bWy9wTV4kEeybp8R8K2QDLPPg7Z8aKVrgOFGEQEejC+qejU9W/2CKMDdDhrJLW3zX7lkV0xMmd0mcx+eiKDmj8OvFfeuPWF9MSy8gwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35XTRaYFo0R/WN+yrs0MhitwQ1uHkbad8KmuKbf82NE=;
 b=VXsbl8KZHVk8z/ybMgGe9Hts8J7UEY2TQvKTy10piQk5c2vDPnI28tUgoKKf/V4yDcfq8EeRFrdt1rshP6KGtc6wJPqNy0SGBl93/HB+24amEEhR6h763NXDgjaNgpj2eY4v+2W3v7gb8LCabN1EFB29DDFMbuuBtSxcKWOET0mss60xoFKo8aPIqYnArWLT9V+3srAjiuoXL9oS3PK3OIyqxVG9SGnmtNQMs0sbst4/9si8f7Kpt1d6o5vuKHt0HLlapXyOt5QQ50PkDowK2tOf2k68logj0A62wg3ymqcCjH49pPlwauk09X6JkRhRCFKCg3EI638NYqaBrQ3ocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35XTRaYFo0R/WN+yrs0MhitwQ1uHkbad8KmuKbf82NE=;
 b=WqnhEAa/ruF6q31tvSl2Kv8+OOtdpeR5NTL0X/eN5yvAn0zS8LfqsRpLImiNryMKK7N5XLYanv8u0czT/ZsIWGdfeHr54szX75hofAQ5lONQpiGoGIwWM+6Msi34S3UFE/iK4DmMAvc3Jkujnxvxj0zZnh1IJTo+j+K7jls0MCdk70W6jaTY6N3PqaAy0e721adGBgpj9rgb5beBkxJ4xBqJOwnZc4ZRWjB3fuxfkDCunQlhWoZrgCzFmHTv0i7ivT2KbL+CK6KAhS802JJln2V12AykL2m75BXWGPRxy2RJ0R+XX/yZEWgwRYnYmQV3/4D7UhN0Arsm3Mso7MaqnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 06:20:57 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:20:57 +0000
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
Subject: [PATCH v5 02/14] gpu: nova-core: Create initial Gsp
Date: Mon, 13 Oct 2025 17:20:28 +1100
Message-ID: <20251013062041.1639529-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0036.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 139a5a74-6e91-48cf-6208-08de0a20ab91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MVRCuf6D/rMlEKrkRXmn97RpWxcSgXVF1DFRqKMGeaa21+m2q3/I/9CpRpEl?=
 =?us-ascii?Q?woJ8eQGqPmZ+tvpnKEfebZyR9dgsM/5xIfdgoDBXYEOMB81eKtakfluP0dE5?=
 =?us-ascii?Q?z9RcK4b54yLcDl+zjW1ZHdGHfhQavZ9bK1Y4faEUML7kHqFOkYFLRHyn1dPY?=
 =?us-ascii?Q?eLU+TFowaC3Vxkq5iKjpgAgxjyt1ExOxn1gnf21624U11E9/0o/XLH5bnUE/?=
 =?us-ascii?Q?Znp62kTFRW0s1F6UMqJnnI5HKILn2tz9DH1mVvffzHv01pOI8xYhHOHwdFDL?=
 =?us-ascii?Q?NW4Kxfa9bgvbjHoQ1vlTdrNKKmKT2k02/Qly23b78eM8+T2lcIQcYK+l4p7s?=
 =?us-ascii?Q?nHCP2Ru6g96YqeBbWKbM5q6D1/CWEBbEr1uB7XMQsMMsy4afb0PwXlDYzZZi?=
 =?us-ascii?Q?ZnzdcYIWeuo+ETvta0Jqe0FnMdZFP2yT/ar+TW2xufn1PwxB3XouYtgF3Oob?=
 =?us-ascii?Q?oqRR0jOQ53aEz2I8729N8jIN7CCqDe0vLsji/AFKdOZ+M3ivTo0kDcNTYcc4?=
 =?us-ascii?Q?i7xXeT3Tl+fFjxjM3+Bb3Oo/qN/sWRIxi57SagHfPodLRBx22mFnIZqGsbaU?=
 =?us-ascii?Q?2pnYlcFmtvOOBC6gb3Jw6BO/g75Sk8RGfqJY452dNnFruqScxIThOzoZfnRC?=
 =?us-ascii?Q?TpotaiHJsqpR7Um57KqgjtKdz5oWt/+0cwdq3Vav62HYJEY2C1TshYxz3u+t?=
 =?us-ascii?Q?HbbJtOd5supeX3IoTK01+btT6GczGFG5oagyU+TzNuwHPpVN+/7TU7UE6DPZ?=
 =?us-ascii?Q?KQRDzdRguH9HBnUnKdns60nPZVheDmTcq1FLn7Rzx2o8u25tu6B844ojRtUi?=
 =?us-ascii?Q?U7fqLANq1aBks+ByTZj8OfjPQQlROv8QITMgxHbrjB6cZffuT8XjCamjypkv?=
 =?us-ascii?Q?prQMVtitTXWS/NRggSt20inF0uj+1rV1cIimh0FBHYJIy6bSBUce3b51TPq2?=
 =?us-ascii?Q?M8Mqpm4CZrkOPE4P1dO/wDrESg8HnN2oj/tuWW25N0nGnkMITEsHuldpdfPK?=
 =?us-ascii?Q?phZM5obBWDiNisAaHvjCcXmwK5jmFq+D/iI/zjUJ99jxmIMGiB+v6gC7oVIL?=
 =?us-ascii?Q?duKU1FtXnbsXSHZPqB2M1hKTFPAFV94WTnED7DV2VIcQWP67JA/rvMziSKOi?=
 =?us-ascii?Q?tlwWWS03OA7X3Zg3cMMAFujltkekmF8m3GgY3LUHtlnC6oZx3WaM4IJLsHR4?=
 =?us-ascii?Q?B+XBAXnOOuHzleCaQM3JdmjYFtThu+LQ7FjMuaLlQ54FH752fHKaw9cCZm4/?=
 =?us-ascii?Q?1CYzYhp5WWJXC/92L3AzOQksU1n38LOeLZPDzdedv1R3s6f9EKavz6buokv9?=
 =?us-ascii?Q?fOVY6iJ8CbD7RtD0yG/cW5S9qRA4wl5DtUeDoNmVH//YY4eZ55h1PnD4sOBp?=
 =?us-ascii?Q?KvCrZB0T594RFBwQzzSL+jDrZNpVaS7YLfWQtsENBMiBA8ST3C5zyOCZ1DcJ?=
 =?us-ascii?Q?sSl//wE/cm2wVMkmTLFobT2MySXhwla1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EuxTE1jnQ/8QzkdDwUFRCsRJv4lAZ71lc8t4OCoKTY+aS2S68S16OM4xBrtM?=
 =?us-ascii?Q?3/t7RrnxFDSKSLn7o4Mc6XU/tooQAWclqfYY+QbEP75zJ/EdfFYcrxncQ8ET?=
 =?us-ascii?Q?EHaS7iAyUglixHrHdX1sQQn9UKn7Ydxpbw/11NLK1bjfrrTbuZUIw2arDBlO?=
 =?us-ascii?Q?GQkQheJukJFk+fyugaxSmhZ0zt+4asfojYPZLjD3taBoB3VWBmPwa5us3Hg0?=
 =?us-ascii?Q?gSU4Zz/2VoclnSOpOD5TQW9zjZ9gs93e8N+qeoA7a6z0pISQx/svv5G3G5rj?=
 =?us-ascii?Q?V/Na3rCjBEIQ4ac38AGoZN5mPkxTJXL2As4JGQoXisbxw8RKvztbRtr8bgB7?=
 =?us-ascii?Q?TWsxk9zOf3BCEDKLceXVcNZ9rjv2vnUyHE4ZBzRahh3LebR78NnZk6WteOIm?=
 =?us-ascii?Q?+GwbCQHKxMaw/uspeEQpEkVm8hlTnkS5R0XGMYnejH6QudRMpUHJf9dFTDFB?=
 =?us-ascii?Q?oDVqSafkfptwpfbQrVS+rMao2CxEllzbodNyH+Wd2YnzjYxzRryLqZD6oIv5?=
 =?us-ascii?Q?jLq7Xi9oD8MBLz7SLj/ZVCsYhTUskqM/Hi2NMq+NAF9zQ7qFqF8aGSzLekrW?=
 =?us-ascii?Q?fStnIaeVqqg3kdL+fn3r/uJIVFXCPHeVC8J6Jcfz+zpJ5jA34JgRB3S+ngk2?=
 =?us-ascii?Q?Az7UOyeDyV7j9v+QjHtlEiHFOpJzQEJhdrdfE5O9Na6O81kVL6HCJl1mFj15?=
 =?us-ascii?Q?J8p2nY/QGmUZLN61cG1yHeZT6rhWIifPQKVG1AheOMNiq9DVjlM9kh0JgEOT?=
 =?us-ascii?Q?Ede1DAUyh2RM1/UhKtRjieKZRK5OC8ZOzB9qDaGzcEgRF5qd4Zfs2uQCiVPe?=
 =?us-ascii?Q?7bBctQhyjzHv6k53RD2xkm0uAZgmmD9JPGW/T92p0CDZnjjy+2Zsfg852uSk?=
 =?us-ascii?Q?Gt49xLpP2oPTBmV/dItH43GbafxKkqXIDMn4t48q8xyOkKx3DtujaFyWQT+g?=
 =?us-ascii?Q?BK2CXtucKf5FwrDdA8X29t6X5Mt9tA3FYEl6covPx6i+nU9wNFLWtp66A+7w?=
 =?us-ascii?Q?9y0jYyJlF0nuy7bM3K3ol7vJkkMyfgggy98Ku3aK+5XAwfzz9RTc5bUDBOSe?=
 =?us-ascii?Q?wy06PZMnpizgKc7y8PUeuhSQvIkuLYY92nZk8yNlBLuGFf02OnZItX7SksQX?=
 =?us-ascii?Q?SYmuKkzWY0SnUaNLLweAB/ZJidD2GxhZa8Bh4S4aa7PqDXrG/iX6J0SLwVyC?=
 =?us-ascii?Q?kQ18qWhzAIAj+ioajQ4H/AK+VaucKnTKrIAOf0WiwK/7DOgcXHGyJkVnfRTw?=
 =?us-ascii?Q?7YytF13w1fMug6m5XmQAT4nmxoh78QIID+MG1bEHng1FnaBLsmKRkn0lrfG1?=
 =?us-ascii?Q?D6meM619OmfO22bqJiA6vQltPOFDVHjD/WuaRRvzIir1b4bT2PjVMjCRdv1M?=
 =?us-ascii?Q?ZAdVjaOZ6ejgoACMGOuvgTbUwSY26jEeWb3AG+ZRcMMWJc1HNAW41w/m6Dh1?=
 =?us-ascii?Q?gmtF35Irp4p3ArnkyMvNo2Sar3N021aNPwjC4VUBDXR05/b5CMkVPgrkYMlD?=
 =?us-ascii?Q?tk+DB4D0D9FkV36Op9o+CTOCDQTwupoU7yii+y+EOutv7XRnqMQTpJ2XxEuP?=
 =?us-ascii?Q?oRp9UGyUp3CN9FXRDgnIT8xAumYHJWrghYYy9Epr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139a5a74-6e91-48cf-6208-08de0a20ab91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:20:57.0522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyVfbkjZKwQl1x2vN6Fnpos3Q83gjA8DuawxBEKOmU/3tzRHijt2ICyCDjGH/TLZqjYi7WQma9JAAqRR/FtFqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406
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

Changes for v5:
 - Move GSP_HEAP_ALIGNMENT to gsp/fw.rs and add a comment.
 - Create a LogBuffer type.
 - Use checked_add to ensure PTE values don't overflow.
 - Added some type documentation (shamelessly stolen from Nouveau)

Change for v3:
 - Clean up the PTE array creation, with much thanks to Alex for doing
   most it (please let me know if I should put you as co-developer!)

Changes for v2:
 - Renamed GspMemOjbects to Gsp as that is what they are
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 106 ++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs               |  64 ++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  19 ++++
 4 files changed, 179 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ea124d1912e7..c1396775e9b6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -197,7 +197,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 221281da1a45..f1727173bd42 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,25 +2,117 @@
 
 mod boot;
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
 use kernel::prelude::*;
-use kernel::ptr::Alignment;
+use kernel::transmute::AsBytes;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
 
+use fw::LibosMemoryRegionInitArgument;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
-pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
 /// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
 #[pin_data]
-pub(crate) struct Gsp {}
+pub(crate) struct Gsp {
+    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    loginit: LogBuffer,
+    logintr: LogBuffer,
+    logrm: LogBuffer,
+}
+
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    fn new(handle: DmaAddress) -> Result<Self> {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = handle
+                .checked_add((i as u64) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+        }
+
+        Ok(Self(ptes))
+    }
+}
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+struct LogBuffer(CoherentAllocation<u8>);
+
+impl LogBuffer {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const NUM_PAGES: usize = RM_LOG_BUFFER_NUM_PAGES;
+
+        let mut obj = Self(CoherentAllocation::<u8>::alloc_coherent(
+            dev,
+            NUM_PAGES * GSP_PAGE_SIZE,
+            GFP_KERNEL | __GFP_ZERO,
+        )?);
+        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        // SAFETY: `obj` has just been created and we are its sole user.
+        unsafe {
+            // Copy the self-mapping PTE at the expected location.
+            obj.0
+                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+                .copy_from_slice(ptes.as_bytes())
+        };
+
+        Ok(obj)
+    }
+}
 
 impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Initialise the logging structures. The OpenRM equivalents are in:
+        // _kgspInitLibosLoggingStructures (allocates memory for buffers)
+        // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+        let loginit = LogBuffer::new(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)?)?;
+        let logintr = LogBuffer::new(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)?)?;
+        let logrm = LogBuffer::new(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
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
index 181baa401770..c3bececc29cd 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,15 +7,20 @@
 
 use core::ops::Range;
 
-use kernel::ptr::Alignable;
+use kernel::dma::CoherentAllocation;
+use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::SZ_1M;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::gpu::Chipset;
-use crate::gsp;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
 
+/// Minimum required alignment for the GSP heap.
+const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
@@ -29,7 +34,7 @@ fn base_rm_size(_chipset: Chipset) -> u64 {
     /// Returns the amount of heap memory required to support a single channel allocation.
     fn client_alloc_size() -> u64 {
         u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 
@@ -40,7 +45,7 @@ fn management_overhead(fb_size: u64) -> u64 {
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
-            .align_up(gsp::GSP_HEAP_ALIGNMENT)
+            .align_up(GSP_HEAP_ALIGNMENT)
             .unwrap_or(u64::MAX)
     }
 }
@@ -99,3 +104,54 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+/// Struct containing the arguments required to pass a memory buffer to the GSP
+/// for use during initialisation.
+///
+/// The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+/// configured for a larger page size (e.g. 64K pages), we need to give
+/// the GSP an array of 4K pages. Since we only create physically contiguous
+/// buffers the math to calculate the addresses is simple.
+///
+/// The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+/// ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+/// buffers to be physically contiguous anyway.
+///
+/// The memory allocated for the arguments must remain until the GSP sends the
+/// init_done RPC.
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
+    ) -> Result<Self> {
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
+        Ok(Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: obj.size() as u64,
+            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS.try_into()?,
+            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM.try_into()?,
+            ..Default::default()
+        }))
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

