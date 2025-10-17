Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A46BE676C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2337410EAFF;
	Fri, 17 Oct 2025 05:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FRnXwDbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6D710EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKlluxD+lBlrIHOzgdcpq0a4Pi7exEb19SEbmIDbPD9Loo+y2MAEvRYpytWRyPDYoE6xv9v2Y3g0c/iBmj9furoPbncKtIqis+zFvhZzyUfQB3nkWaWaEPZF1UkwrjyVqvFgu7CrTtCF7Bnc34H/qP4HSggYJV+ZY7O4UoqwFeI+yrBx3xTUwdXHsZpahFixhqtN/rEHdJmIjRlpXrPHWpMtkqATnwEXvgLLxBL375ZtDXfl4MEt1Jnj+40kcSgey+S5HLN17GlFr1wMATYkE3dv9Ne3NXXhqcf96B7SozgHoOb0R4lHsPKlWIcPOiSQuvs/55mKWS86fdwa9dcLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FZJyBWca6d79asUN580Cmt9UYfxWkNoK9JHvgF7HgM=;
 b=H5fpFQFHgAcrR+dLyoXPuytPm5N7x5NmzQnwtI0CieFKGFKHnOpdVYgXdUISnc/3xzEu0lqn/ixk6mONUX1hslj4WCyJfpFMwSUHclzXvpGvK0xzZ6G9bjLwDwWoOsmHr0oIDNWlJaQ+9S2VPbnWpfiSAipCco+vU4Yd8Aoi35RdWOMsuVE3+6nfFK6rCFDTWAF/Zrhpok3iD0RqXILVN511O8ZD64qOn4DtzWL27C7uj4iGw9qloG7fV/e1dKfp/HyZyqj/k2pUO/LpdXsTy4METIlo22cJymiMzsUWYf+mCYjtBYvseuCQDZqj9aeMGVG8oGptWoMXazRNFDVGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FZJyBWca6d79asUN580Cmt9UYfxWkNoK9JHvgF7HgM=;
 b=FRnXwDblYAQYVwCn6BCCD6GSZvcQz8bBA3tyyPiuK4Rjc557tmtsfB2mLS5Zd4nvrkZlJoghe0QnQ+mBZ1tNK+4GzPWKx7YFgoDBpmpA6ObrzeSZ/tVLPmn7QG+j/toeZz8Yvx3IggXPJKVYxYysWMi+7TLGKvMED+t2t5FzBcKe/tWecL6tclf3e8t0YOPSk/zsy9uamTtbP7Ns4V9c7/iySs242lEeRp14b9g1PK8YKEvDd/zm9YFRwMxG3U5OjGo5Dqp8imxWm91Z0hteVCnE+1w8NdVFbCgvSQb7OOO/Apv8ll8/SGuWE6mSxeNwCyxrrVclHDSw57NAsV9a2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:47:50 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:47:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 01/11] gpu: nova-core: Set correct DMA mask
Date: Fri, 17 Oct 2025 16:47:26 +1100
Message-ID: <20251017054736.2984332-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0013.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe9d0e6-f6c9-4cd6-3e53-08de0d40b4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tej83Z8s4C2vN+fvTtGFFSkt+73lA1smo9s5Pmqlg5weayRuJVoVWQB4cfCd?=
 =?us-ascii?Q?8Ukiy+50emIxxqpmAR7eDva8XVXCMy8++4bzsidGsUMFc5RNqRnlpLCT+fJO?=
 =?us-ascii?Q?2wZk31rr+o0SprktRCcm+AcO1tHKydktlWKABsiMn7UR5qc20Rode54ED/2I?=
 =?us-ascii?Q?85xX6GmvxATuXniWiMePQvHDXgaK/X4XLEiaQYUlVoUOpBRL7EoT35SPhUlX?=
 =?us-ascii?Q?CLfXz/LbJ2eIVaEkGBgJPFPGQHVWhwVmz8ysRoJ+rbsCOjvct/RSbdv+o+VS?=
 =?us-ascii?Q?w/ABi7c8ivgjweY3GSMcNEl4XIXo4yeTPswntaFuDdlIJKEQLKOg9rCXI/e7?=
 =?us-ascii?Q?/9n4DaEMO7zftbvciCPxccTgumnClqW7DbPeXxKC34ETpdZpgZn7lw6bSEJd?=
 =?us-ascii?Q?StT+3mWm4Dmlxn0pRzzZ7V/QmUJqneJlbhjWeB/g7dPGkpNtAlkegWYTYRzY?=
 =?us-ascii?Q?sYqEwvF6OrSy2EKJ09ya5Tde+DEWulp9v7HRFyWPszN2UeqashvDIRYBPmHg?=
 =?us-ascii?Q?UGjc7pizOfMTAQtQ2b/MqelXWCf7zR4u814Ar30K/mJRXxEjEABFHziz7vvK?=
 =?us-ascii?Q?kj7x90aQybuBklbPln/Fox4pi+0h4HVJV+4L4tx33NhESOEE3Rgzgm84YwEo?=
 =?us-ascii?Q?qxuPuudz/BdlNyTVQo6Fb2FXa5RhwRMyfr3c0si2p2BTKv54VxGmLtJkGhbX?=
 =?us-ascii?Q?LgwzNtSw7EbcZHv9C87aifq8jL2Nd5vQzYPZeTFzgoFtv68jHfe69wYZUMiw?=
 =?us-ascii?Q?x16FUrmdvXavSLyPSFyzMD7KU3FKqSpZR3ZQfvu5k27XhRnaKvzJVEk5ec9n?=
 =?us-ascii?Q?MGYP1HJs3aA/3B/mZmVQY/2be/lAU8hr3okDb3JdMGUSPhZCWiiBvLNlmEzL?=
 =?us-ascii?Q?ITxSCJQ+oc17BJJTwNEgC4ar/Sz/ues0CrpzpPBo0bRfVMF+R/VB/zhUPS3/?=
 =?us-ascii?Q?uAuPlvvHt5dLa5VtmKYIsbXPQOBtrB0M+2wwMCId7L01aF1CZsyYjHzazINL?=
 =?us-ascii?Q?FKhCsQtlVsOTHLFRqfJBXdJDb4CGB4wP8oLNDikRZv+FJieVPKsqULKoV35g?=
 =?us-ascii?Q?wJ+hmJRZjI+1kSWNL5AqOKVrICNW4MfuMzcSRmpHTbYbU7iqWPVniTUnTu71?=
 =?us-ascii?Q?fyYTRQbI9tUtXEBvjl3Uke8/3YhOuxsNTcFI2xTfk/7YEPsuQP6RUtw+17Ph?=
 =?us-ascii?Q?s/Bx3hUX0VTj8cDBYS/jYI9Za6UMx5pDAM1LOLeZFdziw3+PiMw9wPOOfNlt?=
 =?us-ascii?Q?55ZK/EuLy7x2embYp3CjcaCEQbNxyTdfdzAtttlUJUkJFx+8hvCEgHAn24Ms?=
 =?us-ascii?Q?u1lapUI5bm6ytNAVOWDncDnebHo2vEG7Wf1PtSrnx9iFqnzjRW1+aNRgOlow?=
 =?us-ascii?Q?52t236p0r6CaBW1e4EXgyjcHcmgqj6nuIVLyROFeAdpzS9t34U8GDNmC8f5/?=
 =?us-ascii?Q?Z8N8X8IVrDpr145e1iwqleSnx++6JmFw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QcwzBa1mvr4TT5NfZ6dHYvcNxhOUmo1mPxyRVWKy2O7r362l6i4bu8yrF0FE?=
 =?us-ascii?Q?SJuNxQXOtCPz5E0NJUDnzyiZ/NBvrvJ5udG8V9oVpAnAqDNy86h4gtdxp1T6?=
 =?us-ascii?Q?5gWGBhuckhJu+5U6Crikp1+jCIeCvAxfNmA/jJQS8OC2ihfwp4z+ysmU4fy2?=
 =?us-ascii?Q?niwA+yIEt7OXT7Sp6r3LRS9+DLYESNIa1tr+qRN59LIujIUaYyiWpI/rXGu9?=
 =?us-ascii?Q?4AawI6wBUI4SXqbmwSH/jCh4HOxM8K16xw3fHO9wkk7eMzTqq6VbNqZhmYxI?=
 =?us-ascii?Q?gc9HYOeuq0VBUSoS18ifCS2zaluuyeLspy5loBX1RzpSWSlHDTDyryxAvaCe?=
 =?us-ascii?Q?butjZ0gIxxLd+sIWDyI+6/qQfPIR4XuYwWW+neRggBpLw/r1XWVRpUBKthHS?=
 =?us-ascii?Q?GZsHXyMxjD4kj4sZVljRUUWT1qaqkPUQ7cV+VBhuYOeKSeOjAJP3lLv1jRtY?=
 =?us-ascii?Q?y94U9m2nEg0+gUDWUGNlLN6Pkh6w1Aq3hcOsNnypfUDyapbShd9fjDwWTXer?=
 =?us-ascii?Q?1a96ictlMCvxbY6GIAm3MvCrAj5gda6GVU6y5H64hlgRNU1v0j+C2anPyYGL?=
 =?us-ascii?Q?Aas/KVATDIGjxtLGM2bV7cZ3G84Ie0D/sk3MTNw/PCNDWRr7EzZo2frJ8EaG?=
 =?us-ascii?Q?rVQeQVFZBTPJS9A/FNVnq0YhRjJR0j+XZ+ERec88qkN025UErpPv9maJD7Xd?=
 =?us-ascii?Q?ZDNu0BQCAfNo8CbUT6tN0/PSJiAJ8DYwZ9PdfBOQEDxS9hOY0EXRivzxkAE1?=
 =?us-ascii?Q?WodZgpoha6czJPeMBeQo6oE8QqWDSBrTXWorR5cwNmwBiGrDdmcJMp0kZhdN?=
 =?us-ascii?Q?qJAMpwOLczrEPVvFRTaAFfgR2P9CMNI7rQ3KyrSYW3giWvZrLIIW89I/Zlr6?=
 =?us-ascii?Q?RaRza/iZ3s1/NtL7ZHTCh6YOsP/g5W3ivBcTinM/q36KJwBBg0xbIxA5LeMs?=
 =?us-ascii?Q?3iJJqi8JMT6Hyh9CpfjeMFdxZn3hJmW/pfzOTCQA4Y0oe+WtmJF8JUUzXX7b?=
 =?us-ascii?Q?P4dGiO1QZ/ZR3gMVxt/etNRmnkPzmAfjJg9aStrZNDN44l5LOi0oN3V2GPZB?=
 =?us-ascii?Q?3sIrtLTjDCOH8upmEpqYxn8UYqy6s3Bszxv6o9OjyRJocG1e+HbxoRqlgyzs?=
 =?us-ascii?Q?KfGv4A3wORuwWFqfijXkjEKth4Xm6ui6XB2qfEtol2Q9m0Nfpxn3mV0xfYMw?=
 =?us-ascii?Q?p9ezrtq0BIuwuL4ZVHpFp4cPYy5QEEKOXx4HF/G9zpoaY3RB4RYOOKk/CFCD?=
 =?us-ascii?Q?N82ty60OD9XMAASs6lUqHFJbAE5oj/MRqK3RuH+b8QZIdhwARGLGHOFM2MGR?=
 =?us-ascii?Q?tJ8wGVuQwAkrVI8hJ9AtAAKQCRddCXpTMwJgJkcLNxxAj0fQRjxgbzuNTzOy?=
 =?us-ascii?Q?9hApLcaxpLmoRK3zQHzJ51LAWtg/KzHsu91iNWPLJvOqbA/WNPQW7n0D1XMz?=
 =?us-ascii?Q?0HbWzkIdV4yHnkGhwn/e/Ugjva5ROtsA3zYj1sYOEwIZbS+ofVb+uNcEKQSQ?=
 =?us-ascii?Q?qyjMVhLQo5TO3Uj3GHcm4sLz5mdTuZYeLbjKOXXj/yXBh01l6YbKBJMXWnXr?=
 =?us-ascii?Q?+/ddAgEfYt0xHCW2JmrcPUNYs83us+Xezj4U4uFp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe9d0e6-f6c9-4cd6-3e53-08de0d40b4d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:47:50.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VYlPQQjLsubb8aiKRoCEYyp5LVxXhdJ3LWbH9IzYKjTmSm75hId3T5r1aMxmZluT3ovCFNbi/5rvVcB4M4M5w==
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

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - Update SAFETY comment for dma_set_mask_and_coherent()
 - Add TODO for using different masks when we support more GPU models

Changes for v4:
 - Use a const (GPU_DMA_BITS) instead of a magic number

Changes for v2:
 - Update DMA mask to correct value for Ampere/Turing (47 bits)
---
 drivers/gpu/nova-core/driver.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index edc72052e27a..2407d0ab15e2 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,6 +3,8 @@
 use kernel::{
     auxiliary, c_str,
     device::Core,
+    dma::Device,
+    dma::DmaMask,
     pci,
     pci::{Class, ClassMask, Vendor},
     prelude::*,
@@ -20,6 +22,15 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+
+// For now we only support Ampere which can use up to 47-bit DMA addresses.
+//
+// TODO: Add an abstraction for this to support newer GPUs which may support
+// larger DMA addresses. Limiting these GPUs to smaller address widths won't
+// have any adverse affects, unless installed on systems which require larger
+// DMA addresses. These systems should be quite rare.
+const GPU_DMA_BITS: u32 = 47;
+
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -57,6 +68,11 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,
-- 
2.50.1

