Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0CB37D88
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567810E76E;
	Wed, 27 Aug 2025 08:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gWrojqkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AE210E76F;
 Wed, 27 Aug 2025 08:20:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc+aq5fX9ar+JXPbsTOBRIejKHSPmWOUK5dq0A4QrQqMmUXrZxnyFIMOswWsE6ezWrlhalXu6BTXeyv4fNnLwivuOCsi5Pa3sVYSHfi5W9U2IKzRi38uPjNslBTX2+6tsev/jHpc/pEpYjKlpQ7dwx24WoYmpF6Q7PkvwGyZPM6Xy6uIjNe8i4wtAgBS9bNHErPN/WYP5LSxzCxV9K7gHj70mYSc8l+mBNaBEWyGZRgnjJKExZ87b0VoaXszQDmaDJbc2RvyWkiR4TZgGijpuzSkZAOjfHU8xRgxRfxglbImY5oLgyMrmO8vs2GgkAGAVopMfzwL2wVbpQSmV1939Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDKAHvoAV/D0gx+D/TYqS3sYt/TGPaOynhqKr0yp+OY=;
 b=B397XTXAXoMiaFOVeVqfVibw3eNrbIaPHpF49ipGNPA9a+NIne5gmVe/6QfuGA/S5gSNEXHf3/e7xouIOHHJZZ3fJOSZz322JXnNdzqsxQVQQtFTFrQeLajWPaKIj7id8WtCo6ilMPnin6fDCHWizdHIVL+LDCpxSHMX+UOXBp2lS6G5yUuiIc3I6/217wz5U/oPTdugQzmMLJZzE0VWvBCGOUMcUaFen/KZA5aZdmqpmYhtfDi1GohFaplgNwX1uWdI2gcAHUHmpTrN3c/kb4JqpzhKipiOQjLRvfIdmIaGokdarz2AkCjuB9z7RQu6WgJnvhBca9VOQdUaBtGaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDKAHvoAV/D0gx+D/TYqS3sYt/TGPaOynhqKr0yp+OY=;
 b=gWrojqkp4v0Tm9JxvDkzv1QVquP/a3ruFGRfPuYNC1WPqB3at/wLubkoRMYGlh4fF0L6fphuURWMLbV53RKi8U3x++vovLmSSjobE8S5rT0D0r3ZYn9MPzRfz5eHfd/EZAw8RiFV+UySJ1DCg0MPldhUs8H/AkmGhbUiPDUqP8+sU4LTS2W6jJ7zJ0KAtHhEoIZiMNQZaO8JzVA1HvefXhDAK/0Zds+1Sg8OK5GllYKmp3LmpiA5bQhSB+HY7Aaa99KYOQl7Hc9u7fNfFhn/2GMPK/7/Lt6VmR9fnCgzVJ/H/t3maOqnxRqKm/BUZFMOuex4abEfO8jTwyCNDUt99A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:35 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:34 +0000
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
Subject: [PATCH 02/10] gpu: nova-core: Create initial GspSharedMemObjects
Date: Wed, 27 Aug 2025 18:19:59 +1000
Message-ID: <20250827082015.959430-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0045.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::15) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5869fa-e3da-4f45-2dd8-08dde542989f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a+S/fILJiCGuzUdrky6LZLBThoh4NBOdrlNatlJAcB8YjhghPK44hT+gaDNc?=
 =?us-ascii?Q?gsAiTeny/aeVHqjFv/d1vCf/+QRuzeuSdbyCB6l5DAfkEJ19TotK0n1CLBkd?=
 =?us-ascii?Q?Xouuw63fIX37uLmKmKcJ7ejITUWCoX/3lzQLSZSTSE1UqZXlCazCuOgDfW7t?=
 =?us-ascii?Q?5kz5hAOLVCcMXicXzOUfkjlGF5eIlDXTmZK3WCkvjQUmtFPx77Ub1FNb8THq?=
 =?us-ascii?Q?elmJtYjAL61au+7EjgG19vpd+kDosDCmCmS6zUyjBv9aEvj9+KGgb5CsF3tN?=
 =?us-ascii?Q?Zx7kIzutecfyKTM1wptQh1jNd/2e6zAz5kYdKH6Tjty+cF4Z+jNOO5tWn9kb?=
 =?us-ascii?Q?6yFjoYfl0vGY+NVe4uhjPsJbT05aLS9q3jWtmZ9pYxh6OmmYBc+6IYJuvfQd?=
 =?us-ascii?Q?miW+vOXFT/969AtMeTKyutcwdlaiqROR5E9m9ycdiWi6udhDn08NtaEKE6aY?=
 =?us-ascii?Q?tEpOBi72b/yixz7hjgYMicZtTtE3wYEZefNyeUIgDu85U/xhulfkn8j4f223?=
 =?us-ascii?Q?BMfU2D0g1LqPFvLO7UtFiCNqF751Ln/Iza5/LgNCAG5yLQ5OrIYp1OYBSk+/?=
 =?us-ascii?Q?UvwtKpI5IKOYUXGDOslPCu60JDfDPN/xom9/jBZW06L/Daphe2nk5fyCJkKH?=
 =?us-ascii?Q?ydRPWG+2L5Gkavv/Y/iCku8H6RzuqCbkODMENz+ZEQ+8gIlqNKoJMA4hqr73?=
 =?us-ascii?Q?b2uHiSlqzpDhyM28IS1ic2UBVkuVtN6rNH6DdGTGTxb0YUB1bp3LOQRQVuCl?=
 =?us-ascii?Q?z8L0FJWl4hM1TAdyw5O+IW3wxL1HzSamSIsD3w38sIh1WOxZQwguzlADdKUl?=
 =?us-ascii?Q?mJnvrYsFCAnFhnQecnoKfl8ftpmkAJTCICfOzHJe4HOPWMxa4D63am8g4ZwZ?=
 =?us-ascii?Q?OlVLabLtGlcsUVBKh+zXoPs27+b7KmYXRDrnWJcvXizB07SnoD9QKLsqbkq6?=
 =?us-ascii?Q?YQdrcQwWJMXm8hArcsRGMVUkokdCgHrLUtuYleCGDdeR9X9tH1jav/z79Fn+?=
 =?us-ascii?Q?RcojBOvyUbOcTEjpPg/GLxy1Nk7a94IvQbAKEti7Sa7bvyv3uU32njlQ4/Rj?=
 =?us-ascii?Q?mRpKqS5Cpas1G/oIEuJGEOYI0Svrk8ufibgQPd67hUsoSLSMq/VPqq7zL9ty?=
 =?us-ascii?Q?++ozOIP/YvAEarPSvsbo+peJ7blmRV18TYo85LkG4jOzt77sa/R9BAO1qzEG?=
 =?us-ascii?Q?lDQgTNjz3vR20a3vOqDxCYdrC5JbOuODW9gDkJQFmANXfz3Jh5v92z87C4U9?=
 =?us-ascii?Q?A/1+HAc5T0Ycbr47RRKYjAMwXOz38yrwRGcxffuaTfieMgl4jcc+5+TxRnKq?=
 =?us-ascii?Q?5u50ACXX/1tEl7MroisjooyyiKFQlwa06QGxGBqDwWGeFhpgJBiY1yrxwrCK?=
 =?us-ascii?Q?6AzwqnJDBuOIT2Dj5M5ICl2M5hm8knVokzPRsKYixaiPPQVH6MU2tgt7MvNu?=
 =?us-ascii?Q?0BgI5it0q4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E3qYmJ+AZ1as48mCDo7i1jL/MUGpEej/aAg/630YM1ubCe4vNPlVgX+hpL+X?=
 =?us-ascii?Q?VERAMLQM/KVaW71dGibHPAryjeU1v4KatmSmYVsN9gWwKL4pIWZbtOoBpoGk?=
 =?us-ascii?Q?d5dgWbMp+6fHm/1mGDR4gIXstR9r11FifHSer32LWU95mTd8Av/uOprIV4mY?=
 =?us-ascii?Q?omciiGuMUJfq9GfSIlFq+3omhsQQ2ke5PJhDhnXSDqMOSLjlmi4sE3pyXbbw?=
 =?us-ascii?Q?QpRDd1YmCEtYQ9fDVcWqQn0ihIYYo1nTY4vA2ZCTOM6/ebcSdvvtOvAkzVXF?=
 =?us-ascii?Q?SkJgiysKBoVWN9wCVjdn4ZGz1y5MeOMgbLasU9FThdHc8T5/eMdPi2ke1gdr?=
 =?us-ascii?Q?r1v+JebcxsNiOlTtg97F4F48DFe/SlQR4z6poMMN68mMxRTCPkWoAw0qp5Fj?=
 =?us-ascii?Q?hPEqr3cTL3zBtETzCiLdEzZQu4mgahdI8nCdLg0jnNbTFKvFdhZEWHqApRr5?=
 =?us-ascii?Q?dRZ4Y77jRikE1nTRf2T1UOlQX9mlhTW+mABG7CVnsMHUKeljIhpv44r2uk+m?=
 =?us-ascii?Q?j/lXzJAVWOYSWm7efQtCpsIOdOlfsc/lJzcMv+ByFa1KFTp0OQQ14Kx7Vb4B?=
 =?us-ascii?Q?YVwjQbRJADqeEv14CHXgFhF+5PvT+gVjhw3wvAF61jr1A4oLpxIsNNbpekWF?=
 =?us-ascii?Q?13qHTEEjzivKpfFfKJJa2qc132xS9iI7tkoLJMaXSTmApoO7HCxzBOSHHYLH?=
 =?us-ascii?Q?AnquYpexV2RtPNCToT6OSe1+IrXjtQRUBr9+IfcWCmmgLA+GlI1dqfggcJBL?=
 =?us-ascii?Q?IIGd/tMHhLuluIyWaAE8WwtJ3WZfihlbcj+p0c2XO9/0W5+k8whEO3mZEqqc?=
 =?us-ascii?Q?KUSL0xGnpSaZTomUQMdyGWtjMlQZBT82eDf7G86ZkKvju5zrE/1nyKqRhqtN?=
 =?us-ascii?Q?PbwVW8+DrMTKoIL5eTNPU8G3dhZuwokS5hhl5w1fxO9PWAWiqWV/TDZrQGCF?=
 =?us-ascii?Q?YVYG9hYBAa5gy5EPBTiKOX9d7Esild8lU+aoXNQi3oDYtBglsnzZXvyofmIh?=
 =?us-ascii?Q?Fy26lbZaUFtMbesKo7AIPJRpzB4XYDpuxXFQvdLCZCk4oJra5MM1359Bla6B?=
 =?us-ascii?Q?iGJbq8nfWAMOzvOdM6S5J2MKfXawHZN14tVfZ4PZ1r5zk12tpVX3+k8O1YTl?=
 =?us-ascii?Q?Uh7Tz20a3+lAxm74mSYbgV8wISGNs4LF8k5aPXptZgXVCOllxtEAnLAwPRQC?=
 =?us-ascii?Q?kQR/ahbl7zPjsp6epjbcehbcM6jss3R/dozOH3XLP+N07FhqLZ1vGF2YaqPG?=
 =?us-ascii?Q?gkqWV43MURf6zd2JqBvHuiIKrA0Fq4hGODrJmr/10zbOTBnIQ76pCW5FnQ+q?=
 =?us-ascii?Q?Pja4ARH14/mrGQjqhxxv4EOk0ijDaWoW8ZaaLvIe5B4z2wpBLPXj7C7g3HzF?=
 =?us-ascii?Q?ss0wobywPwHoP4FVmo3QrySnZbLXQJcM/XOzP652LAGqEhq5Lww+kGW6E2Mo?=
 =?us-ascii?Q?1mKUzSI5sgmPLkZvLLfajm7q/GjHPBv2c6S6lkDBDo7l1meBGMd4pLRJIu+Z?=
 =?us-ascii?Q?YNxl3k5/IqW731x/9MdE5YU881heNaOP3tsxX2oRNlVq1DX2E1qUu9nCBRBK?=
 =?us-ascii?Q?QvOA5khMrsBifqkwCrecW24bXlxqtJNV9IcxnuPv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5869fa-e3da-4f45-2dd8-08dde542989f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:34.8823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btIuhpXNKSUpUBfGHGF8TXnaSpDd084uGBWDG6RMg9eakonMQg3ehwUVUdIY10jX1U6e2HNlyAOt8xY3TniX8A==
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

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                  |   6 +
 drivers/gpu/nova-core/gsp.rs                  | 113 ++++++++++++++++++
 drivers/gpu/nova-core/nvfw.rs                 |   7 ++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   |  19 +++
 4 files changed, 145 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5c1c88086cb0d..6190199e055c2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,6 +9,7 @@
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
+use crate::gsp;
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -172,6 +173,7 @@ pub(crate) struct Gpu {
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
+    libos: gsp::GspMemObjects,
 }
 
 #[pinned_drop]
@@ -309,11 +311,15 @@ pub(crate) fn new(
 
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
+        let libos = gsp::GspMemObjects::new(pdev)?;
+        let _libos_handle = libos.libos_dma_handle();
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
             fw,
             sysmem_flush,
+            libos,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ead471746ccad..161c057350622 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,7 +1,120 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::bindings;
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
+use kernel::pci;
+use kernel::prelude::*;
 use kernel::ptr::Alignment;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use crate::nvfw::{
+    LibosMemoryRegionInitArgument, LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
+};
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+#[allow(unused)]
+pub(crate) struct GspMemObjects {
+    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub loginit: CoherentAllocation<u8>,
+    pub logintr: CoherentAllocation<u8>,
+    pub logrm: CoherentAllocation<u8>,
+}
+
+/// Generates the `ID8` identifier required for some GSP objects.
+fn id8(name: &str) -> u64 {
+    let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+    for (c, b) in name.bytes().rev().zip(&mut bytes) {
+        *b = c;
+    }
+
+    u64::from_ne_bytes(bytes)
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
+    dma_write!(
+        libos[libos_arg_nr] = LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: obj.size() as u64,
+            kind: LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS as u8,
+            loc: LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM as u8,
+            ..Default::default()
+        }
+    )?;
+
+    Ok(obj)
+}
+
+impl GspMemObjects {
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<Self> {
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
+        Ok(GspMemObjects {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        })
+    }
+
+    pub(crate) fn libos_dma_handle(&self) -> bindings::dma_addr_t {
+        self.libos.dma_handle()
+    }
+}
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 11a63c3710b1a..9a2f0c84ab103 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -40,3 +40,10 @@ pub(crate) struct LibosParams {
 /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
 /// addresses of the GSP bootloader and firmware.
 pub(crate) use r570_144::GspFwWprMeta;
+
+pub(crate) use r570_144::{
+    // LibOS memory structures
+    LibosMemoryRegionInitArgument,
+    LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
+};
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 0407000cca229..6a14cc3243918 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
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
2.47.2

