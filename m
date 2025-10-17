Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B6BE676F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F8110EB04;
	Fri, 17 Oct 2025 05:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RFe9a1Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522B710EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbNuxTkfZiACDYQyh3sWwnLwrC9qN1DgXVb54lVY0sg7IISHtMLvQzPKNTarNb3DG3KjWLcxPDovyLb320DrLLWIR5viLA62DqHC1/69MTLIecqU9f7RPcR3cbGDWe2aFhmZSxoZWXlLyOZhEu+gc07C5NLpMO4AbSxudgjHGbgvhP14XmPtJHdwNoTEJtPyrrhturwz0ivbKj1rPReD4QbXjcrKl0oSGwH/FyA0CjHx1m9Oug/LAVEil2MyeoJRHnK0ToErZ1QTr8ZEdcBGjgHV/+nplnorTnFO8m/Q1IXVGNWKMXMBtgCrNkJKoaaVfzVd0w4ckdVV7JM8sJOrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcUMq72Yq9ex16HxLI2yj/3e4OGyP9rWcdf+Yu9bv8M=;
 b=H4+nOzS+QlAGJ5KtLmipw94a3oAbLD53uAQrZ0oYjekHeV59Rab4LaTI1aWCyHwdkhmZdTW0X3mWVGA33Po5PsQjSLdIoDUoF621Q/R1Bbu2gHMKtFRfvYZOJEOc0Fgl8DcqYSNBCrOf9yD4/BWynOH2+rrwz2fDh4lvjbHGF+z6GOF8eJLJ3HKP5tSLiIkVUO7mI0t70CcVeDZI1mEQ6ufYE8ehWasJatRMiz9+5VgyN44KT873jQC8/4ykzeicYprmkCth/tJDJNMvHIDy5v2vYusJ5SyMnT1BgfSNHV9TTAti2QyN/qA/YfnNdfF1xl8SkJgL7Ql3pvc7Dg1i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcUMq72Yq9ex16HxLI2yj/3e4OGyP9rWcdf+Yu9bv8M=;
 b=RFe9a1ThKIS6rCSXLeXHkSmkc0yygH9F9Mg/ib+rBFUFHId7ve6ywz7hpOQ6DIluRxR96QrffX6EcrUCplxyXw/joSEwMQOntaSOMtTCJh+wZ1/jN2xwhsqiDhx04mCWyWTwA/d9hvtIqskzMGzEHqV+Q9Qfj8Mfn4t3g63/1IrDxlvyTnPJaioSVmR6Fc2Kr7KI+3UVf8ro4iJPHTaKDWPHYzDFfZK76gcaxw3dxZwRtWEvquirX+A0lI0ULp2ePHILWAvwNkJ10OGl7xdnBCzImKhsXtphwZREa+z+TLxnRpjDT5Au5VLnwt5sOvlOtnCOYEo3UlNqVZREvEZcfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:47:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:47:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 03/11] gpu: nova-core: gsp: Create wpr metadata
Date: Fri, 17 Oct 2025 16:47:28 +1100
Message-ID: <20251017054736.2984332-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0116.ausprd01.prod.outlook.com
 (2603:10c6:10:246::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0646aebe-d55d-41ca-891d-08de0d40ba99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UWe57fxIxiJWyewHcg79PhDppYw+SdBkgqwryP57h7EmfiIZaMwQkNXb+yTg?=
 =?us-ascii?Q?zTy7e6w3s5Runt5p3enJ8TNNENVNDRIAFjLeHmAZ0Q/neGIKrG4PaEu6zLVQ?=
 =?us-ascii?Q?OIBYg2Nb9KpOwPJocF3cKZBOXPnQ0RMg2sY3Ih5wFFqdPK8dC0J7QKgzSLHl?=
 =?us-ascii?Q?pg6JzOjWr/LUOo8zl9R6z5pYJ7tHe0QaQ0ZKSbterG7WZY6/0Ubugb3MMce2?=
 =?us-ascii?Q?vrqxGWF65yxKs9NTEIy4k+Rd22zZPWL54UyDwSakmH/cVwb9nuy0Y41I9YKH?=
 =?us-ascii?Q?codSktEUimaGI8shmPozImU9QfHpqo4obM10gc/HqqqUyydVW2bl7RiOvVy+?=
 =?us-ascii?Q?kQ4gngx77c49HX2L5UZrEaoWTR4ze6IYjzRPwZPPayBEf9jSH3OegcfTiWEd?=
 =?us-ascii?Q?rJCuoflDsTs545f8iOsC168cn7yTTuuTDOQXRTXUENQcvapdoe/FPU1OphDu?=
 =?us-ascii?Q?amQtZ9L7lwDd21yVgcb56JYb3i0bFY6znu1U+jEQ4vLcVrBR+jhcLAPAzLv7?=
 =?us-ascii?Q?kksko/YcVMDBKqlIut5MGUX84FxolDGMzxGDNGUOM4WqqSX433jBF+9QybIa?=
 =?us-ascii?Q?lwtwYzV3Es3uXcOBLXVTNt9luQH/0UgfgxBEr3kXrohXj7X7dhH5tigFI4pr?=
 =?us-ascii?Q?0GrKncW5XAnumpkiyFg7zlChx10+zFWp/34qgZBz0ruewiqPbwDjl9EmCEvl?=
 =?us-ascii?Q?7vgm+LJe6qPgC8se6jPMRoSUhzVi+dvd2cEIeu46sv7WMLtYSsqIhO/aytzG?=
 =?us-ascii?Q?OI5pEpvdQ0ppB5I0f+WPRxHMmLOx+0naZB+SV0eVH+lKa3FYPShbUmlFJp/Z?=
 =?us-ascii?Q?Vj5iEjx4n/U1H2vzCkVApvpzn30ZnbLmHXB9btIqNnJLk1REuEl/yAGhJcKo?=
 =?us-ascii?Q?wndLQLqJttZ9xB+nUNo9UljrS2WG90WJhHB1cdzuXZJbZAwOs5sp7QehPvS8?=
 =?us-ascii?Q?9JHMeCAH9P8YCBz6hLevoqriBTaFTaTd4DCTbcN3MbtuF676/uSBSx4kdM2U?=
 =?us-ascii?Q?Sj//oZpP7hmDeG6pjfm+3S2QUfVBkdCcrUVBjfhKf6uBWEfe4RyMhzEQLygU?=
 =?us-ascii?Q?r4BnOcKLexUCtDnuzCiPMY44+/67h4ofC0uuMldSwG+5vaydcdbXqQf7TCX1?=
 =?us-ascii?Q?mDCz3+sIX5lC8B6+Ko9Ybi51dgpMfKAUiwuS43g+OHeosBaA+3+W7T4bbOL7?=
 =?us-ascii?Q?ejHdhU9MWZ8hX4ke29M9M81i8kxsXlYCpSKf+Xvzx6evOQVFHvhbg/BfLeAW?=
 =?us-ascii?Q?9mQoh0eLxJSgz97Et8lspIazM7cJX/TvJsutDL5DNhx7P3lCCI6CkfNn0pZj?=
 =?us-ascii?Q?XqSBgMVH9a+oRcWSsd5aqlLC16sHEhRjFFtz30xZCxIl+gkQCfrBCLzxp7RM?=
 =?us-ascii?Q?kdHWEQxXibJWmw11uutGKsagnvI7R5FCuV4WOlmQY1twcjSa4x4Op1kL+7ha?=
 =?us-ascii?Q?l6KAnsqOFuJPByjuGdPkbdNE//6F42Bl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xsA8si/FQ+MiiERdmwN0ZXjUgil3dKdpf5dSAvjQebnAiiKMy8bmmIhWITPp?=
 =?us-ascii?Q?Lq403FY5jhswXnmdnUWQYhoecPUer7InWkKAqcEomZwOtnjdsC3j7kUpjVAX?=
 =?us-ascii?Q?NM7IT+b8Mb7Mnbeo3mqFvfPE8jkqw8dL55Y414hDnRNVm7KzGH9InGjrgUu0?=
 =?us-ascii?Q?OXAQzAaOCYOgCTRmpV/LibRIEZqKzDExuSpu7VA0k3zYdbwWPGsdeqkWw6s2?=
 =?us-ascii?Q?+dRRq4ofjdBlXIj3IjsGNh7NLOGTaKqcGpiok7KrtBEE4rpJgVXazxd7QhLX?=
 =?us-ascii?Q?90aqkNHoNqomhzNwkrX2v+ST1Cwo4+R1wHH+Ot744tElGoMK8o0CvCvKULov?=
 =?us-ascii?Q?w8vFIho9cXazTaX4T2+umw80BNytbuRDr1s4NH+O3MzfH4c6JRZGjAj92IvU?=
 =?us-ascii?Q?kMgcOg8vpN8cl+osAkYg5LURJ9tWI3NkzNwu/C5MWWXFvSgaoL4C2pLrdsa/?=
 =?us-ascii?Q?fuYT+zMS9BvumDVv1NBLXV/UV13Gt0MXSAcpRz078FHIsWIEgztuUixvi140?=
 =?us-ascii?Q?B/7S3kUgWBHxYIDR5Eci664J8aS7B6vlw4TEfn4LjzWMyde03zNf9ws4IjAU?=
 =?us-ascii?Q?mn03ip/QhquawkERpRw9ZUkbebOigOc5JSvWsgH3MtapKjaOU7CmrlS2AzOJ?=
 =?us-ascii?Q?VVqpkhTs7zf61OUAGQJXkOWL19jvjkJU3KaCN6u3rWE/8YDy+bFiwOg796lY?=
 =?us-ascii?Q?o6hGdrTIv33Pm5e7ilofJnWrkLojgXYWWfPdtEekB6FW6X7CqlOMIvYot7Eo?=
 =?us-ascii?Q?pXa+TCP+bs+rrekYTxDFb/FGdIIWQhrlnq37V8pEUTT+Zz7OoSR7j+MA9Amj?=
 =?us-ascii?Q?mmvSPSanYBW8KmszUWMVNcbcvol5u/gzPT//z6xHTOVZBTs52d3uNLoi5E4x?=
 =?us-ascii?Q?nElP6ri5aLsXHVxQ5oFzpCHi1f6UCv7tAA6Qoau4c1UUg8byuK2LbP37vEKM?=
 =?us-ascii?Q?QyOl72/DX8ljFk4gJuytHzIT7MF3uBjiWe4ijNqI2djrE9uPEbiCRTttTP8R?=
 =?us-ascii?Q?3djXQJtz3L+9MkVaEcIF4toLI+Wd4y5tmGvDaeKywUec/8KJeyW7Y48EAfZM?=
 =?us-ascii?Q?2b7gARx3u/CQEuwQAtphQR8aNFwwR0m2g5gZ/qQx26WOAMh6WOb8cY0BQU51?=
 =?us-ascii?Q?nUO9wB914Irwec97PXiaCPzR9vfw3KhTUm5N2vyXJ8lMkua6GNy+/YM5EigY?=
 =?us-ascii?Q?IVE6Bs2qf9DvK2imD9mLDnUEWa2jFct1kXpDQsnx9WSYNMSrG4A9Qv7glTRI?=
 =?us-ascii?Q?zXyNks35wZAPMpWHSpVSRVWmJY1O7x8IRKMdyPaixKvzA31IyMFJ8e3nslez?=
 =?us-ascii?Q?6+eHf/AglGtQr6/avQD7wVodbGl4OwQO2RwypJ1j5Mfnoo0csAGnTJDmSnRj?=
 =?us-ascii?Q?SBdx9dUSNfB4jd9sX41blm9evRCrJV5GiY0wjVTY1EuZbz1lJVNr1ZMPYv6G?=
 =?us-ascii?Q?lqV7u7yGamrIgg8+wwEn74OIY2YFFS4K293olTTI2cdJ2X5qR5ccOzeZJPdM?=
 =?us-ascii?Q?z1QE/3y8BKOWSNC3oD9C1+i2DG99JjD8qDY836KrUxx35Crz1g2Opz1rWFr+?=
 =?us-ascii?Q?Y7p6LvMCoVUbKLChFAD+OZm4hXkZ/vzmFmHTZZUU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0646aebe-d55d-41ca-891d-08de0d40ba99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:47:59.5316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ1Gm7u6RLLCLgWoST1eiBuPoTWerytP0Tn0SZdvjT7Qz0I3MYYVZ5rJqbAsiV5eOT2BVV0/HSXHLNJgMa8M+A==
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

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---

Changes for v5:
 - Make member visibility match the struct visibility (thanks Danilo)

Changes for v3:
 - Don't re-export WPR constants (thanks Alex)

Changes for v2:
 - Rebased on Alex's latest version
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gsp.rs                  |  4 ++
 drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 55 ++++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4d6a1f452183..5580498ba2fb 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 3a1cf0607de7..fb0f69d04ef8 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub(crate) signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub bootloader: RiscvFirmware,
 }
@@ -216,7 +216,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 04f1283abb72..115b5f5355a1 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -55,11 +55,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub(crate) code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub(crate) data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub(crate) manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f1727173bd42..8cb389c97733 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -10,6 +10,8 @@
 use kernel::prelude::*;
 use kernel::transmute::AsBytes;
 
+use crate::fb::FbLayout;
+
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
@@ -103,8 +105,10 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
         let loginit = LogBuffer::new(dev)?;
         dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)?)?;
+
         let logintr = LogBuffer::new(dev)?;
         dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)?)?;
+
         let logrm = LogBuffer::new(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index fb22508128c4..6959581c538b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
 
@@ -14,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
 
@@ -132,6 +135,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout)?)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c3bececc29cd..42ba4739f890 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,10 +10,12 @@
 use kernel::dma::CoherentAllocation;
 use kernel::prelude::*;
 use kernel::ptr::{Alignable, Alignment};
-use kernel::sizes::SZ_1M;
+use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::FbLayout;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -105,6 +107,57 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Result<Self> {
+        Ok(Self(bindings::GspFwWprMeta {
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: u64::try_from(gsp_firmware.size)?,
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: u64::try_from(gsp_firmware.bootloader.ucode.size())?,
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: u64::try_from(gsp_firmware.signatures.size())?,
+                },
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        }))
+    }
+}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
-- 
2.50.1

