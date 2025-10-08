Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA2BC30CA
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696AF10E725;
	Wed,  8 Oct 2025 00:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KINd4/+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010050.outbound.protection.outlook.com
 [52.101.193.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130410E1D5;
 Wed,  8 Oct 2025 00:13:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxA85XjJziOsvygzlvSn3roITJm3trq1RfTV4XqBFR3DvyjB5aTscGMXc5ICTLd4RJGSAu7oLen4tdHcvNBv2iF0V0fL066HM6qqznTm8cCSJ3KevYQlfI4qoz3OjPysn/mBncp71Zw+btV79ijNEKkD4vDAz8lTVsrhJqTY5KUDHFXh9B3OwC5LURzamIxV7C/JFEiL+04Fa3SROLxUt6yJ1N/2JXfCjp9Ct4R/Q8aRymNYvuqbQjl9zXBWM116FU2ccedMWVbY/rpdO7bSLnS9yOZG2seKgQZGDe0ICgEFPq7AXsr1+eZ8C22ty6SmQyY+W2/Mnh7lnZ+2K3bSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcBXfzU/uxY56EyN15dFGf8/t0VHJ3jAzJKcBN8UCc4=;
 b=ep9cSnrR9Vv3ZbFQLlcCgBTWVtQKIxF4wNFDGzXwP4+tbaaa1epEt8gzmU27CvtYEcykf9mVMV0cCbtKhSmY3iPiaIYeVGuzT57CChgTviAYRFmy3273ATov6p1avhL/gHe0K9eRPRpa8v4g6KpXnVCltUEsZplEMTQMpHPFl0p4D/vuXVlwAzwPaZpggp7RZhCKgPl1aqWGfTmz9fYkGIB0BkcMd+EBqSvHTTjE4aKRYauXP7TASeqF1mZl32FQoy0WLBOX4FzLSN+SDDMb1qVlKeW5daj6fN9aZCU1NtEjly8rsVxM7mHAZB9Gws0KilPmiXaN3T9vVixvd9PBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcBXfzU/uxY56EyN15dFGf8/t0VHJ3jAzJKcBN8UCc4=;
 b=KINd4/+UN6KSFMj+znhMurwYSMHHBHN10PPQNNyBwUnKoROKIOIg5Mm5rdd+L+G8x1OT+f8FpXqeLmgDwzCWxSle16t4poW1dyYpz1+UFUsXJp3dSmOOH3aGQN3YGB2SiySMzh2h/MDCgrTVaZV8twcQMOr4SXc37iudD+v+EiFfK4aqEmzA6i/3EOVTA4I8mBBBScuW3RWnhGpsGpTyrjEUfpof2bV9zzoVvPA7loFLhfmZPHb+XG8A82NN9uaPu0noudDelc3HBz/TGbozcA7kHLLlLyQyGBtNWv51Q219ZYIBZpu75/LE0jOjX3sNZNU72rOgYoeJKOV0zed/ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:27 +0000
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
Subject: [PATCH v4 05/13] gpu: nova-core: Add GSP command queue bindings
Date: Wed,  8 Oct 2025 11:12:44 +1100
Message-ID: <20251008001253.437911-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0110.ausprd01.prod.outlook.com
 (2603:10c6:10:1::26) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d8beec-30bd-4987-ad70-08de05ff8090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LAfMsQxBgJV+yYvsopKaAlrU/+36dS/UvWrKcc3tMvstcfdV1RgkB6RlFA+S?=
 =?us-ascii?Q?v5kVmjIDNAC9xws2g9SJ2CEtXC7BYtOMO4BahKXHdnBqmFutzPE4C7/+gNql?=
 =?us-ascii?Q?XKw1sDdCbDalvr5OCoOJsmutLZM8b+tjmW8Zq4EeXg9yF0yuQAoA6pt0cfxs?=
 =?us-ascii?Q?U4C1g2VmjGDFDXCCgE/wU3RPyPTHu4wren87V4WDx8cb3EJYPloF/e0wDxRW?=
 =?us-ascii?Q?bI/LVikn22yTtHCLvwKpxuKpQamTI7fa7gl+GzwJOBUGrxI+m870OYoXZTuv?=
 =?us-ascii?Q?wPf9/iweso+OMGtYA82tz5d8law9smqLEARNJj4oHFyzlZkAp/zUbkxZB3sE?=
 =?us-ascii?Q?EWz55mNVgXq/p/qnxm8QhyjavOZ79xhjQL09wpoIIpUb1NQBIHu46K1EbosA?=
 =?us-ascii?Q?IfImtthktzUcjRk37MqafVDMDGxiTCv5NOv54zRCv82B54Zd61t/zluFGqlc?=
 =?us-ascii?Q?mBevcw5ReuNrCwDmllvArIrqLlAQZsh+COOSTtNxzRapP2hLJurhZ9f8PXc2?=
 =?us-ascii?Q?+0kJWy3xAr5IkybgBi88SgUz8l5Y+ygt1/ADK6St0OLq1CYSer142BoSRn02?=
 =?us-ascii?Q?vlheoixFAcMNJOOM2QQbQD9XH4j2ehXYtFYuWF6+R6S366r3T2BoYaanJUZZ?=
 =?us-ascii?Q?pvIfU5ett513SVm7FdXao24OD63hYZYTy4RkLiePKKvGHO7Gi4Fp2P4zWbjj?=
 =?us-ascii?Q?H+vQf+j5v1JqVnAZFrbBO5pKxemdOg0dhfssD/ftMLa5Jb0VKL6p3KxItZRN?=
 =?us-ascii?Q?6CdgDKd8xbTm9QE6tDY34NUMslRsyRtPT/CE9Cvmnsrlevh683MQbe4bFeD1?=
 =?us-ascii?Q?Mtg0kEXOmxKGI+hcKeMpMsfZ1ghNsSPpKz86+r2YWqzKCRZd1J40/TT08YZ2?=
 =?us-ascii?Q?btU9IopW2ckhGo5NSaUi1d0ZzvNEOs/n1ps+d9pS/jhSHePL30fA7pI3hQWG?=
 =?us-ascii?Q?liYyWWGpjxaOuqt21u6FilGAyP+QSPsfkq2kaSgvjYEDxcSDNRjL7b+mbD7v?=
 =?us-ascii?Q?GDZ1TEZTxPYttZyHgbYYGcZZvs7iaW2QgFhw40ksWBicComPpagEXyMZiVBX?=
 =?us-ascii?Q?pQZO0TLrEju81rKmCPAKqMMCV4H4tU8pnqjOPnH4bbHCwSe3rJkJDgDYN3Ys?=
 =?us-ascii?Q?ckfPbuOb5mAIHARKInMmI+6ZikgV+sB/SUEWizl6rPgOLpu0OZkuMI/65YUr?=
 =?us-ascii?Q?MkOWJJgwFn9J4927yRm9BxR67SyA+F/0kR1PuhhWJ7PBClo4T9UU+EDsSOC4?=
 =?us-ascii?Q?/fFedpRbGd1asFQYilrIKtgtirMv/XN6neajWkppANSd/vzZ58cCNHy8dmZw?=
 =?us-ascii?Q?9r49AzyN0mZ2rWYB7p2oT7ziymbDVoontqSQxB59AxPN9Db/kuTjicVev3J5?=
 =?us-ascii?Q?qy4qZjC3Ny2tD4LAHQU4TgYSHByroB1i6XqfrnggQSuNztuGjHxSV47PV8CF?=
 =?us-ascii?Q?jVFfS5MokXiEic8DR4Hz+b6TNCni1rGf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mgmjHAWjQLVWfmwcTQCgUOQn0DKPKECts4PDgLoee25Cpy0NpMOw5gnktsHP?=
 =?us-ascii?Q?r36N4tlM4fitrlBaBHCgGkZYvnWzSNUIywyuADRKQ2kGpGCY5g4iPHcWjHHr?=
 =?us-ascii?Q?Uwq63KlhkEBXRPEhWZnou2z7ODS8MB+R4/a1u+HXUJDbkx8q9mtplGxevMV/?=
 =?us-ascii?Q?3O4X6tv4Ze1EBWsrnEbRAWyXcTDn/5EzKNrfKnjlDj2DWk+XQ7ajF9xoXM/L?=
 =?us-ascii?Q?wEtArBNuduW0BBwNMBK/cx4FfZ1Y70OORmMOJpeoFww+Caio0UxmmDzTrpCB?=
 =?us-ascii?Q?XS657mlDxT8v0zyWbTKN/BVvXs3oP56RssqNO+sQNRJS65xqhpAvBNxB0nTh?=
 =?us-ascii?Q?oSNn314O/buY/mJFsD9ROWUlcJZkDqArGOikk1Oe8pZgAGKexU4ruCLikDoz?=
 =?us-ascii?Q?A8BwDpDsiQCtoyRgckgHYuRGZNQ1XcH44YoyxlCujW4jgwivWXVyVTo9citM?=
 =?us-ascii?Q?cb1UqS9eqRabQNKJXZLDFRa2aBmJUmxKrCUoOVVXKE/FLgfXTiL2cRnbHupq?=
 =?us-ascii?Q?zih15TZ25CKJtHjQay5MFAv//rv2jCL5HVpT8RzJdUWq1p06YPy+dhliXJMc?=
 =?us-ascii?Q?ck3hUDL3jE3MD/2Tzm0I0gRD68N9x3X93AA/flUzrtDclc0zU3NeeOmwLXbX?=
 =?us-ascii?Q?IQhQkWBf3SSEGpVcKqsGqMwGA36nPtPI69+DvLCR4jyCyr0APSTicVPEYj25?=
 =?us-ascii?Q?gFc/mZ977Q498Ech4jKBhFUR26KLp3g8KwhdP7YXgN0N8UzaVrdbcexyDPzl?=
 =?us-ascii?Q?/cetdTuM7FB+S8YkToOyRwdz6y9yPZLn+oAupzRoUCQmyOO72yc33rDLw6fB?=
 =?us-ascii?Q?HBMtuinhJupMCig/Qkq5IDQI/yLbTzbDa68JPIKNGvifuPraE37aoHnYjaLh?=
 =?us-ascii?Q?8DDL4kZmJBaqUSFBuYFa9njIBFJ7efJKq8yA2BVhWaScegPe85YBQOWHuKLu?=
 =?us-ascii?Q?pH6AB6MbyjAXD1II5aLAD49ghPTSFrkOEcjD02bF7M+5Lw9ss023KnwWLR2U?=
 =?us-ascii?Q?8PWF1hXuSEQZ0XydYkhOj3eAx6PxS1n3ukIOc6WH6bG4i0FOMVHppwpLacvW?=
 =?us-ascii?Q?GwgVwrNNmpZLXUGXsOvMNWQ2w9ijmCzxtPLM7igQmBC6a5/pEYrEJz8Be+Ry?=
 =?us-ascii?Q?oqrcT0Al2tDwblZwqFjbdW5PDQFtnA+f1n4oolRqTo/TokjRuHwIAJ2UviQh?=
 =?us-ascii?Q?l9DkHBIjYwV410jMS5uaxtXTrJIFOjsqsr0ytrUxMZiCqdUL2wyQ0Q+inyiv?=
 =?us-ascii?Q?KcfT0CIp90xlKrIWWO5aK+3xchKL/+a+4b1ZvEb7XDapyFKuiQJ3aWdFyV87?=
 =?us-ascii?Q?UK8stEyHMkLDUycpTIutm1Dk7+w+6/iSWqKnxiuzgWnC9e515xO1MLGW+rgX?=
 =?us-ascii?Q?VmKkY9Rcc87lona7f2mizUZihN+zleQ497//EUnJS06fqxp+0qCdJ5OBdM1R?=
 =?us-ascii?Q?v6zGth3rJJnhaRIk/BhFbyC/N5ZjYTFYYNKj7EsAiwjnfeJ2bWF/bqEUMedu?=
 =?us-ascii?Q?TL9LloH7fQFolivtz5ijaxfmYtcqUxy7GPnq4Fu09lRQDGB0eudCNE2ymRYe?=
 =?us-ascii?Q?cm4JFsly4PCC/n3PeLQhDLqR67TDgnmskm4lyoJY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d8beec-30bd-4987-ad70-08de05ff8090
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:26.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5CXMQ67mll2dbvDVmCvbbn7o3nsKNY2OnH36kd5CWXiuFYNGm+qif718ZPBkrkUakXR6nkrneHDCyog511xKQ==
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

Add bindings and accessors used for the GSP command queue.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v4:
 - Don't panic the kernel if trying to initialise a large (> 4GB)
   message header.
 - Use `init!` to provide safe and complete initialisers.
 - Take an enum type instead of a u32 for the function.

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw.rs               | 277 +++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 374 ++++++++++++++++++
 2 files changed, 651 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 68a7059bc965..ca3a33ab21db 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -5,9 +5,11 @@
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
 
+use core::fmt;
 use core::ops::Range;
 
 use kernel::dma::CoherentAllocation;
+use kernel::prelude::*;
 use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
@@ -16,6 +18,7 @@
 use crate::gpu::Chipset;
 use crate::gsp;
 use crate::gsp::FbLayout;
+use crate::gsp::GSP_PAGE_SIZE;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -155,6 +158,120 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
     }
 }
 
+#[derive(PartialEq)]
+pub(crate) enum MsgFunction {
+    // Common function codes
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP as isize,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO as isize,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT as isize,
+    AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE as isize,
+    AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY as isize,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA as isize,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA as isize,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY as isize,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA as isize,
+    AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT as isize,
+    Free = bindings::NV_VGPU_MSG_FUNCTION_FREE as isize,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG as isize,
+    GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO as isize,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY as isize,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO as isize,
+    GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU as isize,
+    GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL as isize,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO as isize,
+
+    // Event codes
+    GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE as isize,
+    GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER as isize,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT as isize,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED as isize,
+    MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED as isize,
+    OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG as isize,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD as isize,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE as isize,
+    UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT as isize,
+}
+
+impl fmt::Display for MsgFunction {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            // Common function codes
+            MsgFunction::Nop => write!(f, "NOP"),
+            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
+            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
+            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
+            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
+            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
+            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
+            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
+            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
+            MsgFunction::Free => write!(f, "FREE"),
+            MsgFunction::Log => write!(f, "LOG"),
+            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
+            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
+            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
+            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
+            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
+
+            // Event codes
+            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
+            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
+            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
+            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
+            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
+            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
+            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
+            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
+        }
+    }
+}
+
+impl TryFrom<u32> for MsgFunction {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<MsgFunction> {
+        match value {
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
+                Ok(MsgFunction::GspInitPostObjGpu)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
+                Ok(MsgFunction::GspRunCpuSequencer)
+            }
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
+            bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
+            bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
 #[repr(transparent)]
 pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
 
@@ -191,3 +308,163 @@ fn id8(name: &str) -> u64 {
         })
     }
 }
+
+#[repr(transparent)]
+pub(crate) struct MsgqTxHeader(bindings::msgqTxHeader);
+
+impl MsgqTxHeader {
+    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
+        Self(bindings::msgqTxHeader {
+            version: 0,
+            size: msgq_size,
+            msgSize: GSP_PAGE_SIZE as u32,
+            msgCount: msg_count,
+            writePtr: 0,
+            flags: 1,
+            rxHdrOff: rx_hdr_offset,
+            entryOff: GSP_PAGE_SIZE as u32,
+        })
+    }
+
+    pub(crate) fn write_ptr(&self) -> u32 {
+        let ptr = (&self.0.writePtr) as *const u32;
+
+        // SAFETY: This is part of a CoherentAllocation and implements the
+        // equivalent as what the dma_read! macro would and is therefore safe
+        // for the same reasons.
+        unsafe { ptr.read_volatile() }
+    }
+
+    pub(crate) fn set_write_ptr(&mut self, val: u32) {
+        let ptr = (&mut self.0.writePtr) as *mut u32;
+
+        // SAFETY: This is part of a CoherentAllocation and implements the
+        // equivalent as what the dma_write! macro would and is therefore safe
+        // for the same reasons.
+        unsafe { ptr.write_volatile(val) }
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MsgqTxHeader {}
+
+/// RX header for setting up a message queue with the GSP.
+#[repr(transparent)]
+pub(crate) struct MsgqRxHeader(bindings::msgqRxHeader);
+
+impl MsgqRxHeader {
+    pub(crate) fn new() -> Self {
+        Self(Default::default())
+    }
+
+    pub(crate) fn read_ptr(&self) -> u32 {
+        let ptr = (&self.0.readPtr) as *const u32;
+
+        // SAFETY: This is part of a CoherentAllocation and implements the
+        // equivalent as what the dma_read! macro would and is therefore safe
+        // for the same reasons.
+        unsafe { ptr.read_volatile() }
+    }
+
+    pub(crate) fn set_read_ptr(&mut self, val: u32) {
+        let ptr = (&mut self.0.readPtr) as *mut u32;
+
+        // SAFETY: This is part of a CoherentAllocation and implements the
+        // equivalent as what the dma_write! macro would and is therefore safe
+        // for the same reasons.
+        unsafe { ptr.write_volatile(val) }
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MsgqRxHeader {}
+
+impl bindings::rpc_message_header_v {
+    pub(crate) fn init(cmd_size: u32, function: MsgFunction) -> impl Init<Self, Error> {
+        type RpcMessageHeader = bindings::rpc_message_header_v;
+        try_init!(RpcMessageHeader {
+            // TODO: magic number
+            header_version: 0x03000000,
+            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
+            function: function as u32,
+            length: (size_of::<Self>() as u32)
+                .checked_add(cmd_size)
+                .ok_or(EOVERFLOW)?,
+            rpc_result: 0xffffffff,
+            rpc_result_private: 0xffffffff,
+            ..Zeroable::init_zeroed()
+        })
+    }
+}
+
+// TODO: Ideally we would derive this for all our bindings, using the same technique as
+// https://lore.kernel.org/rust-for-linux/20250814093046.2071971-3-lossin@kernel.org/
+unsafe impl Zeroable for bindings::rpc_message_header_v {}
+
+#[repr(transparent)]
+pub(crate) struct GspMsgElement {
+    inner: bindings::GSP_MSG_QUEUE_ELEMENT,
+}
+
+impl GspMsgElement {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(
+        sequence: u32,
+        cmd_size: usize,
+        function: MsgFunction,
+    ) -> impl Init<Self, Error> {
+        type RpcMessageHeader = bindings::rpc_message_header_v;
+        type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
+        let init_inner = try_init!(InnerGspMsgElement {
+            seqNum: sequence,
+            elemCount: size_of::<Self>()
+                .checked_add(cmd_size)
+                .ok_or(EOVERFLOW)?
+                .div_ceil(GSP_PAGE_SIZE) as u32,
+            rpc <- RpcMessageHeader::init(cmd_size as u32, function),
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspMsgElement {
+            inner <- init_inner,
+        })
+    }
+
+    pub(crate) fn set_checksum(&mut self, checksum: u32) {
+        self.inner.checkSum = checksum;
+    }
+
+    // Return the total length of the message, noting that rpc.length includes
+    // the length of the GspRpcHeader but not the message header.
+    pub(crate) fn length(&self) -> u32 {
+        size_of::<Self>() as u32 - size_of::<bindings::rpc_message_header_v>() as u32
+            + self.inner.rpc.length
+    }
+
+    pub(crate) fn sequence(&self) -> u32 {
+        self.inner.rpc.sequence
+    }
+
+    pub(crate) fn function_number(&self) -> u32 {
+        self.inner.rpc.function
+    }
+
+    pub(crate) fn function(&self) -> Result<MsgFunction> {
+        self.inner.rpc.function.try_into()
+    }
+
+    pub(crate) fn element_count(&self) -> u32 {
+        self.inner.elemCount
+    }
+}
+
+// TODO: Ideally we would derive this for all our bindings, using the same technique as
+// https://lore.kernel.org/rust-for-linux/20250814093046.2071971-3-lossin@kernel.org/
+unsafe impl Zeroable for bindings::GSP_MSG_QUEUE_ELEMENT {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspMsgElement {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspMsgElement {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..3d96d91e5b12 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1,5 +1,36 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+pub const NV_VGPU_MSG_SIGNATURE_VALID: u32 = 1129337430;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
@@ -19,6 +50,312 @@
 pub type u16_ = __u16;
 pub type u32_ = __u32;
 pub type u64_ = __u64;
+pub const NV_VGPU_MSG_FUNCTION_NOP: _bindgen_ty_2 = 0;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO: _bindgen_ty_2 = 1;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_ROOT: _bindgen_ty_2 = 2;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE: _bindgen_ty_2 = 3;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY: _bindgen_ty_2 = 4;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA: _bindgen_ty_2 = 5;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA: _bindgen_ty_2 = 6;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY: _bindgen_ty_2 = 7;
+pub const NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA: _bindgen_ty_2 = 8;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT: _bindgen_ty_2 = 9;
+pub const NV_VGPU_MSG_FUNCTION_FREE: _bindgen_ty_2 = 10;
+pub const NV_VGPU_MSG_FUNCTION_LOG: _bindgen_ty_2 = 11;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIDMEM: _bindgen_ty_2 = 12;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY: _bindgen_ty_2 = 13;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY_DMA: _bindgen_ty_2 = 14;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY_DMA: _bindgen_ty_2 = 15;
+pub const NV_VGPU_MSG_FUNCTION_GET_EDID: _bindgen_ty_2 = 16;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_CHANNEL: _bindgen_ty_2 = 17;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_OBJECT: _bindgen_ty_2 = 18;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SUBDEVICE: _bindgen_ty_2 = 19;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DYNAMIC_MEMORY: _bindgen_ty_2 = 20;
+pub const NV_VGPU_MSG_FUNCTION_DUP_OBJECT: _bindgen_ty_2 = 21;
+pub const NV_VGPU_MSG_FUNCTION_IDLE_CHANNELS: _bindgen_ty_2 = 22;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_EVENT: _bindgen_ty_2 = 23;
+pub const NV_VGPU_MSG_FUNCTION_SEND_EVENT: _bindgen_ty_2 = 24;
+pub const NV_VGPU_MSG_FUNCTION_REMAPPER_CONTROL: _bindgen_ty_2 = 25;
+pub const NV_VGPU_MSG_FUNCTION_DMA_CONTROL: _bindgen_ty_2 = 26;
+pub const NV_VGPU_MSG_FUNCTION_DMA_FILL_PTE_MEM: _bindgen_ty_2 = 27;
+pub const NV_VGPU_MSG_FUNCTION_MANAGE_HW_RESOURCE: _bindgen_ty_2 = 28;
+pub const NV_VGPU_MSG_FUNCTION_BIND_ARBITRARY_CTX_DMA: _bindgen_ty_2 = 29;
+pub const NV_VGPU_MSG_FUNCTION_CREATE_FB_SEGMENT: _bindgen_ty_2 = 30;
+pub const NV_VGPU_MSG_FUNCTION_DESTROY_FB_SEGMENT: _bindgen_ty_2 = 31;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SHARE_DEVICE: _bindgen_ty_2 = 32;
+pub const NV_VGPU_MSG_FUNCTION_DEFERRED_API_CONTROL: _bindgen_ty_2 = 33;
+pub const NV_VGPU_MSG_FUNCTION_REMOVE_DEFERRED_API: _bindgen_ty_2 = 34;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_READ: _bindgen_ty_2 = 35;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_WRITE: _bindgen_ty_2 = 36;
+pub const NV_VGPU_MSG_FUNCTION_SIM_MANAGE_DISPLAY_CONTEXT_DMA: _bindgen_ty_2 = 37;
+pub const NV_VGPU_MSG_FUNCTION_FREE_VIDMEM_VIRT: _bindgen_ty_2 = 38;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PSTATE_INFO: _bindgen_ty_2 = 39;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PERFMON_SAMPLE: _bindgen_ty_2 = 40;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_VIRTUAL_PSTATE_INFO: _bindgen_ty_2 = 41;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_LEVEL_INFO: _bindgen_ty_2 = 42;
+pub const NV_VGPU_MSG_FUNCTION_MAP_SEMA_MEMORY: _bindgen_ty_2 = 43;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_SEMA_MEMORY: _bindgen_ty_2 = 44;
+pub const NV_VGPU_MSG_FUNCTION_SET_SURFACE_PROPERTIES: _bindgen_ty_2 = 45;
+pub const NV_VGPU_MSG_FUNCTION_CLEANUP_SURFACE: _bindgen_ty_2 = 46;
+pub const NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER: _bindgen_ty_2 = 47;
+pub const NV_VGPU_MSG_FUNCTION_TDR_SET_TIMEOUT_STATE: _bindgen_ty_2 = 48;
+pub const NV_VGPU_MSG_FUNCTION_SWITCH_TO_VGA: _bindgen_ty_2 = 49;
+pub const NV_VGPU_MSG_FUNCTION_GPU_EXEC_REG_OPS: _bindgen_ty_2 = 50;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO: _bindgen_ty_2 = 51;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIRTMEM: _bindgen_ty_2 = 52;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_PDE_2: _bindgen_ty_2 = 53;
+pub const NV_VGPU_MSG_FUNCTION_SET_PAGE_DIRECTORY: _bindgen_ty_2 = 54;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_PSTATE_INFO: _bindgen_ty_2 = 55;
+pub const NV_VGPU_MSG_FUNCTION_TRANSLATE_GUEST_GPU_PTES: _bindgen_ty_2 = 56;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_57: _bindgen_ty_2 = 57;
+pub const NV_VGPU_MSG_FUNCTION_RESET_CURRENT_GR_CONTEXT: _bindgen_ty_2 = 58;
+pub const NV_VGPU_MSG_FUNCTION_SET_SEMA_MEM_VALIDATION_STATE: _bindgen_ty_2 = 59;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENGINE_UTILIZATION: _bindgen_ty_2 = 60;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPU_PDES: _bindgen_ty_2 = 61;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENCODER_CAPACITY: _bindgen_ty_2 = 62;
+pub const NV_VGPU_MSG_FUNCTION_VGPU_PF_REG_READ32: _bindgen_ty_2 = 63;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO_EXT: _bindgen_ty_2 = 64;
+pub const NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO: _bindgen_ty_2 = 65;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_INIT: _bindgen_ty_2 = 66;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLOSE_QUEUE: _bindgen_ty_2 = 67;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLEANUP: _bindgen_ty_2 = 68;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_TEST: _bindgen_ty_2 = 69;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE: _bindgen_ty_2 = 70;
+pub const NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD: _bindgen_ty_2 = 71;
+pub const NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO: _bindgen_ty_2 = 72;
+pub const NV_VGPU_MSG_FUNCTION_SET_REGISTRY: _bindgen_ty_2 = 73;
+pub const NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU: _bindgen_ty_2 = 74;
+pub const NV_VGPU_MSG_FUNCTION_SUBDEV_EVENT_SET_NOTIFICATION: _bindgen_ty_2 = 75;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL: _bindgen_ty_2 = 76;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO2: _bindgen_ty_2 = 77;
+pub const NV_VGPU_MSG_FUNCTION_DUMP_PROTOBUF_COMPONENT: _bindgen_ty_2 = 78;
+pub const NV_VGPU_MSG_FUNCTION_UNSET_PAGE_DIRECTORY: _bindgen_ty_2 = 79;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_STATIC_INFO: _bindgen_ty_2 = 80;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_FAULT_BUFFER: _bindgen_ty_2 = 81;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_FAULT_BUFFER: _bindgen_ty_2 = 82;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 83;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 84;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_VGPU_FB_USAGE: _bindgen_ty_2 = 85;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVFBC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 86;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVENC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 87;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_CHANNEL: _bindgen_ty_2 = 88;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_ISOLATED_CHANNEL: _bindgen_ty_2 = 89;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_HANDLE_VF_PRI_FAULT: _bindgen_ty_2 = 90;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CLK_GET_EXTENDED_INFO: _bindgen_ty_2 = 91;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_BOOST: _bindgen_ty_2 = 92;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_VPSTATES_GET_CONTROL: _bindgen_ty_2 = 93;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE: _bindgen_ty_2 = 94;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_COLOR_CLEAR: _bindgen_ty_2 = 95;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_DEPTH_CLEAR: _bindgen_ty_2 = 96;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SCHEDULE: _bindgen_ty_2 = 97;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TIMESLICE: _bindgen_ty_2 = 98;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PREEMPT: _bindgen_ty_2 = 99;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_DISABLE_CHANNELS: _bindgen_ty_2 = 100;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TSG_INTERLEAVE_LEVEL: _bindgen_ty_2 = 101;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_CHANNEL_INTERLEAVE_LEVEL: _bindgen_ty_2 = 102;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC: _bindgen_ty_2 = 103;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_V2: _bindgen_ty_2 = 104;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_AES_ENCRYPT: _bindgen_ty_2 = 105;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY: _bindgen_ty_2 = 106;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY_STATUS: _bindgen_ty_2 = 107;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 108;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 109;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_EXCEPTION_MASK: _bindgen_ty_2 = 110;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_PROMOTE_CTX: _bindgen_ty_2 = 111;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_PREEMPTION_BIND: _bindgen_ty_2 = 112;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_CTXSW_PREEMPTION_MODE: _bindgen_ty_2 = 113;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_ZCULL_BIND: _bindgen_ty_2 = 114;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_INITIALIZE_CTX: _bindgen_ty_2 = 115;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES: _bindgen_ty_2 = 116;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_CLEAR_FAULTED_BIT: _bindgen_ty_2 = 117;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_LATEST_ECC_ADDRESSES: _bindgen_ty_2 = 118;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MC_SERVICE_INTERRUPTS: _bindgen_ty_2 = 119;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DMA_SET_DEFAULT_VASPACE: _bindgen_ty_2 = 120;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_CE_PCE_MASK: _bindgen_ty_2 = 121;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE_ENTRY: _bindgen_ty_2 = 122;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_PEER_ID_MASK: _bindgen_ty_2 = 123;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_STATUS: _bindgen_ty_2 = 124;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS: _bindgen_ty_2 = 125;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_MATRIX: _bindgen_ty_2 = 126;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_0: _bindgen_ty_2 = 127;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_PM_AREA_SMPC: _bindgen_ty_2 = 128;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HWPM_LEGACY: _bindgen_ty_2 = 129;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_B0CC_EXEC_REG_OPS: _bindgen_ty_2 = 130;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BIND_PM_RESOURCES: _bindgen_ty_2 = 131;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SUSPEND_CONTEXT: _bindgen_ty_2 = 132;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_RESUME_CONTEXT: _bindgen_ty_2 = 133;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_EXEC_REG_OPS: _bindgen_ty_2 = 134;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_DEBUG: _bindgen_ty_2 = 135;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 136;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 137;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_ERRBAR_DEBUG: _bindgen_ty_2 = 138;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE: _bindgen_ty_2 = 139;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_ALLOC_PMA_STREAM: _bindgen_ty_2 = 140;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PMA_STREAM_UPDATE_GET_PUT: _bindgen_ty_2 = 141;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_INFO_V2: _bindgen_ty_2 = 142;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SET_CHANNEL_PROPERTIES: _bindgen_ty_2 = 143;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 144;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_KGR_GET_CTX_BUFFER_PTES: _bindgen_ty_2 = 145;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_EVICT_CTX: _bindgen_ty_2 = 146;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_FS_INFO: _bindgen_ty_2 = 147;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GRMGR_GET_GR_FS_INFO: _bindgen_ty_2 = 148;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_STOP_CHANNEL: _bindgen_ty_2 = 149;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_PC_SAMPLING_MODE: _bindgen_ty_2 = 150;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_GET_STATUS: _bindgen_ty_2 = 151;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_SET_CONTROL: _bindgen_ty_2 = 152;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FREE_PMA_STREAM: _bindgen_ty_2 = 153;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_TIMER_SET_GR_TICK_FREQ: _bindgen_ty_2 = 154;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB: _bindgen_ty_2 = 155;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_GR_STATIC_INFO: _bindgen_ty_2 = 156;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP: _bindgen_ty_2 = 157;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_TPC_PARTITION_MODE: _bindgen_ty_2 = 158;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_TPC_PARTITION_MODE: _bindgen_ty_2 = 159;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_ALLOCATE: _bindgen_ty_2 = 160;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_DESTROY: _bindgen_ty_2 = 161;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_MAP: _bindgen_ty_2 = 162;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_UNMAP: _bindgen_ty_2 = 163;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_PUSH_STREAM: _bindgen_ty_2 = 164;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_SET_HANDLES: _bindgen_ty_2 = 165;
+pub const NV_VGPU_MSG_FUNCTION_UVM_METHOD_STREAM_GUEST_PAGES_OPERATION: _bindgen_ty_2 = 166;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_QUIESCE_PMA_CHANNEL: _bindgen_ty_2 = 167;
+pub const NV_VGPU_MSG_FUNCTION_DCE_RM_INIT: _bindgen_ty_2 = 168;
+pub const NV_VGPU_MSG_FUNCTION_REGISTER_VIRTUAL_EVENT_BUFFER: _bindgen_ty_2 = 169;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EVENT_BUFFER_UPDATE_GET: _bindgen_ty_2 = 170;
+pub const NV_VGPU_MSG_FUNCTION_GET_PLCABLE_ADDRESS_KIND: _bindgen_ty_2 = 171;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_LIMITS_SET_STATUS_V2: _bindgen_ty_2 = 172;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM: _bindgen_ty_2 = 173;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_MMU_DEBUG_MODE: _bindgen_ty_2 = 174;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS: _bindgen_ty_2 = 175;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_SIZE: _bindgen_ty_2 = 176;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 177;
+pub const NV_VGPU_MSG_FUNCTION_DISABLE_CHANNELS: _bindgen_ty_2 = 178;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEMORY_DESCRIBE: _bindgen_ty_2 = 179;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEM_STATS: _bindgen_ty_2 = 180;
+pub const NV_VGPU_MSG_FUNCTION_SAVE_HIBERNATION_DATA: _bindgen_ty_2 = 181;
+pub const NV_VGPU_MSG_FUNCTION_RESTORE_HIBERNATION_DATA: _bindgen_ty_2 = 182;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED: _bindgen_ty_2 = 183;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_CREATE: _bindgen_ty_2 = 184;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_DELETE: _bindgen_ty_2 = 185;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN: _bindgen_ty_2 = 186;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX: _bindgen_ty_2 = 187;
+pub const NV_VGPU_MSG_FUNCTION_PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION: _bindgen_ty_2 =
+    188;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK:
+    _bindgen_ty_2 = 189;
+pub const NV_VGPU_MSG_FUNCTION_SET_SYSMEM_DIRTY_PAGE_TRACKING_BUFFER: _bindgen_ty_2 = 190;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_P2P_CAPS: _bindgen_ty_2 = 191;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_SET_P2P_MAPPING: _bindgen_ty_2 = 192;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_UNSET_P2P_MAPPING: _bindgen_ty_2 = 193;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK: _bindgen_ty_2 = 194;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_MIGRATABLE_OPS: _bindgen_ty_2 = 195;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_TOTAL_HS_CREDITS: _bindgen_ty_2 = 196;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_HS_CREDITS: _bindgen_ty_2 = 197;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_HS_CREDITS: _bindgen_ty_2 = 198;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PM_AREA_PC_SAMPLER: _bindgen_ty_2 = 199;
+pub const NV_VGPU_MSG_FUNCTION_INVALIDATE_TLB: _bindgen_ty_2 = 200;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_QUERY_ECC_STATUS: _bindgen_ty_2 = 201;
+pub const NV_VGPU_MSG_FUNCTION_ECC_NOTIFIER_WRITE_ACK: _bindgen_ty_2 = 202;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_DEBUG: _bindgen_ty_2 = 203;
+pub const NV_VGPU_MSG_FUNCTION_RM_API_CONTROL: _bindgen_ty_2 = 204;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_GPU_START_FABRIC_PROBE: _bindgen_ty_2 = 205;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVLINK_GET_INBAND_RECEIVED_DATA: _bindgen_ty_2 = 206;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_DATA: _bindgen_ty_2 = 207;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_208: _bindgen_ty_2 = 208;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_GET_INFO_V2: _bindgen_ty_2 = 209;
+pub const NV_VGPU_MSG_FUNCTION_GET_BRAND_CAPS: _bindgen_ty_2 = 210;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_NVLINK_INBAND_SEND_DATA: _bindgen_ty_2 = 211;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPM_GUEST_BUFFER_INFO: _bindgen_ty_2 = 212;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_CONTROL_GSP_TRACE: _bindgen_ty_2 = 213;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_STENCIL_CLEAR: _bindgen_ty_2 = 214;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_VGPU_HEAP_STATS: _bindgen_ty_2 = 215;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_LIBOS_HEAP_STATS: _bindgen_ty_2 = 216;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 217;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 218;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HES: _bindgen_ty_2 = 219;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_HES: _bindgen_ty_2 = 220;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_CCU_PROF: _bindgen_ty_2 = 221;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_CCU_PROF: _bindgen_ty_2 = 222;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED: _bindgen_ty_2 = 223;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_CHIPLET_HS_CREDIT_POOL: _bindgen_ty_2 = 224;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_HS_CREDITS_MAPPING: _bindgen_ty_2 = 225;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_EXPORT: _bindgen_ty_2 = 226;
+pub const NV_VGPU_MSG_FUNCTION_NUM_FUNCTIONS: _bindgen_ty_2 = 227;
+pub type _bindgen_ty_2 = ffi::c_uint;
+pub const NV_VGPU_MSG_EVENT_FIRST_EVENT: _bindgen_ty_3 = 4096;
+pub const NV_VGPU_MSG_EVENT_GSP_INIT_DONE: _bindgen_ty_3 = 4097;
+pub const NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER: _bindgen_ty_3 = 4098;
+pub const NV_VGPU_MSG_EVENT_POST_EVENT: _bindgen_ty_3 = 4099;
+pub const NV_VGPU_MSG_EVENT_RC_TRIGGERED: _bindgen_ty_3 = 4100;
+pub const NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED: _bindgen_ty_3 = 4101;
+pub const NV_VGPU_MSG_EVENT_OS_ERROR_LOG: _bindgen_ty_3 = 4102;
+pub const NV_VGPU_MSG_EVENT_RG_LINE_INTR: _bindgen_ty_3 = 4103;
+pub const NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES: _bindgen_ty_3 = 4104;
+pub const NV_VGPU_MSG_EVENT_SIM_READ: _bindgen_ty_3 = 4105;
+pub const NV_VGPU_MSG_EVENT_SIM_WRITE: _bindgen_ty_3 = 4106;
+pub const NV_VGPU_MSG_EVENT_SEMAPHORE_SCHEDULE_CALLBACK: _bindgen_ty_3 = 4107;
+pub const NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT: _bindgen_ty_3 = 4108;
+pub const NV_VGPU_MSG_EVENT_VGPU_GSP_PLUGIN_TRIGGERED: _bindgen_ty_3 = 4109;
+pub const NV_VGPU_MSG_EVENT_PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK: _bindgen_ty_3 = 4110;
+pub const NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE: _bindgen_ty_3 = 4111;
+pub const NV_VGPU_MSG_EVENT_VGPU_CONFIG: _bindgen_ty_3 = 4112;
+pub const NV_VGPU_MSG_EVENT_DISPLAY_MODESET: _bindgen_ty_3 = 4113;
+pub const NV_VGPU_MSG_EVENT_EXTDEV_INTR_SERVICE: _bindgen_ty_3 = 4114;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_256: _bindgen_ty_3 = 4115;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_512: _bindgen_ty_3 = 4116;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_1024: _bindgen_ty_3 = 4117;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_2048: _bindgen_ty_3 = 4118;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_4096: _bindgen_ty_3 = 4119;
+pub const NV_VGPU_MSG_EVENT_TIMED_SEMAPHORE_RELEASE: _bindgen_ty_3 = 4120;
+pub const NV_VGPU_MSG_EVENT_NVLINK_IS_GPU_DEGRADED: _bindgen_ty_3 = 4121;
+pub const NV_VGPU_MSG_EVENT_PFM_REQ_HNDLR_STATE_SYNC_CALLBACK: _bindgen_ty_3 = 4122;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FAULT_UP: _bindgen_ty_3 = 4123;
+pub const NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE: _bindgen_ty_3 = 4124;
+pub const NV_VGPU_MSG_EVENT_MIG_CI_CONFIG_UPDATE: _bindgen_ty_3 = 4125;
+pub const NV_VGPU_MSG_EVENT_UPDATE_GSP_TRACE: _bindgen_ty_3 = 4126;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FATAL_ERROR_RECOVERY: _bindgen_ty_3 = 4127;
+pub const NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD: _bindgen_ty_3 = 4128;
+pub const NV_VGPU_MSG_EVENT_FECS_ERROR: _bindgen_ty_3 = 4129;
+pub const NV_VGPU_MSG_EVENT_RECOVERY_ACTION: _bindgen_ty_3 = 4130;
+pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
+pub type _bindgen_ty_3 = ffi::c_uint;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union rpc_message_rpc_union_field_v03_00 {
+    pub spare: u32_,
+    pub cpuRmGfid: u32_,
+}
+impl Default for rpc_message_rpc_union_field_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
+#[repr(C)]
+pub struct rpc_message_header_v03_00 {
+    pub header_version: u32_,
+    pub signature: u32_,
+    pub length: u32_,
+    pub function: u32_,
+    pub rpc_result: u32_,
+    pub rpc_result_private: u32_,
+    pub sequence: u32_,
+    pub u: rpc_message_rpc_union_field_v,
+    pub rpc_message_data: __IncompleteArrayField<u8_>,
+}
+impl Default for rpc_message_header_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_header_v = rpc_message_header_v03_00;
 #[repr(C)]
 #[derive(Copy, Clone)]
 pub struct GspFwWprMeta {
@@ -145,3 +482,40 @@ pub struct LibosMemoryRegionInitArgument {
     pub loc: u8_,
     pub __bindgen_padding_0: [u8; 6usize],
 }
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct msgqTxHeader {
+    pub version: u32_,
+    pub size: u32_,
+    pub msgSize: u32_,
+    pub msgCount: u32_,
+    pub writePtr: u32_,
+    pub flags: u32_,
+    pub rxHdrOff: u32_,
+    pub entryOff: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct msgqRxHeader {
+    pub readPtr: u32_,
+}
+#[repr(C)]
+#[repr(align(8))]
+pub struct GSP_MSG_QUEUE_ELEMENT {
+    pub authTagBuffer: [u8_; 16usize],
+    pub aadBuffer: [u8_; 16usize],
+    pub checkSum: u32_,
+    pub seqNum: u32_,
+    pub elemCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub rpc: rpc_message_header_v,
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
-- 
2.50.1

