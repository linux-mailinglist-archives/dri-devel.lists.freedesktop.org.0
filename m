Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EE5BE678D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5243010EB14;
	Fri, 17 Oct 2025 05:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W38y1NFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A33310EB11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHMpA4HNndtCP0Wu+5xWEUf9AzMV96+bu9QNtUQuRBLVAlMEmOu0xxqbkVNhf/jXJMCugsmQOcoTLHTIVzOkMJsomjw/R4jtAg72dXbdpLIXI46s8tm7ThqeWkZ/4s3qGsMwUtkyV6ZDhQ8LX3dbjKwlVg55n41rqQfpiFkAvKks/QKGZ6MUBR0SLmBCXGSfWyYafU7iom3J9mTujoDlKY0SkqH2juos5nl/Rvi/1uyJ653Ylnrio4DdzgGh1S58LY7wS6GTB1piCZc7jp0TIaEhyB9UXt2LZoWIelmQx8ur7OEzk1r7MDBqjdwx943GGQdRIOzYbARWFgEsv8bLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/T3FweTiU+L5aErVFFQg6EpHMlA0G8JYR1ghIjxYnY=;
 b=C6RoCUTGYVX+AEQYdFFBv9gHcJ5hKz9KaD5FBTIBtJF3NoUptPDEWt545P/LJjYzc0CS6B9aO54XLyM6xep8OL6ZyLwapAvooAEXk/FJVUozgIL6iCoUzsWA+7TDDYg24QBAED+54N5deP86v4uORWZD39hN5dn1orCqFWjJ453dVhiZ/XR3qK8pZ/q20uTYWoitxw0K7kP5sWp0bRvlmoOoWCjXpnKEFegqfb8c/XIM+EMWOu5a40wsvu8LAwlPJYbolnUf4injAuL28QugSAJfUu1ld8ve2cLLzx6iGR7dm5BVftloFp96ys6xI9RvPskQi3lGj9vwuOLtS8uH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/T3FweTiU+L5aErVFFQg6EpHMlA0G8JYR1ghIjxYnY=;
 b=W38y1NFcClL+5GQR/08c2o6LG7wivSruKfUAhIzreEFDjt7BzBG+An64J97BTO6/CYyhJqcF9cS1ee+i/RVpPGmlHLctkdlObcB6iWdFleStK/YtRVSuz8LggxQB0jLfxn2yLFwG/HJRMeyu25qvjrrnei5MrdqsaWuMqZX51NEceDrGRwW7Kpp/99DVB9kQBm1RZL8hCMUDTk1oBGyndOu+ineXNgzR6KIsP48Amk0STN+26jSMfy6TrHPIjPPINKbZ0QOlAQ5GbCNg/HIDAGklkNRPwNaq38BAKMa/EB1PW92VwTLxLEJN+U1b2sDbpZmJ7+7qsBbqOAHhB4b93g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:43 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 11/11] nova-core: gsp: Boot GSP
Date: Fri, 17 Oct 2025 16:47:36 +1100
Message-ID: <20251017054736.2984332-12-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0148.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f1d8b5-a7dd-4c45-0bb8-08de0d40d414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?agOCmtIgBAdaZBRdMtolVE2PEPMKsbL3cOvoA19Hen1CqrcOXHR5LySyhsLx?=
 =?us-ascii?Q?xBO8cnhvJNVs1vRClSTF8dcEwm3YLh9BopNa3GwR2rClEHdwE/n6YEblm4CV?=
 =?us-ascii?Q?Eqa5dc+JdhVrGKh+euBHeIiZH4jP+qmVumfq8gLClJTicreEmsK6OzM4+Qay?=
 =?us-ascii?Q?Yum05HqvP71NOPZnxMs+jgzHZA3npGircW3raeU0cPZLekniYKx16NseQlsB?=
 =?us-ascii?Q?9v0VZCmOmt8NBDU3gcYSDvS2/DWXAb8LEf+aSBDau5QQrzzYpZYw0envU7oV?=
 =?us-ascii?Q?VI9P5JdUCx8CzENAWjUGdqcjA4egwS38mXsxhV5kj6SUQenJtextSAWU2qBQ?=
 =?us-ascii?Q?RbleBEAY0C58qevDuF7Kz0YlJFre6N97wx1+znH+U8mF/wGMoS8xmBRsuoFZ?=
 =?us-ascii?Q?D0a9BgEP7slnl2FPSY75+Yxgn4FU2XDzkqfNyVtSBMW0pStuTasHD2IUUJ/D?=
 =?us-ascii?Q?Vkg6ffOurE4iH/tGn0G8oFY6c7dWGmAAzHTCzaTGROc1Bq9dKsl6qheSIp4x?=
 =?us-ascii?Q?aOIBl/dR/DTrAdVCahubT1TIHvBZPDMC/N+LuCAbrli4X3mfkLzAOnOc/Zeu?=
 =?us-ascii?Q?lKqMH+8R6kuMEcJCl1l3DA60ZRdRFVZBoS+/df1ixRSsJkfemkIbhVcmTeG+?=
 =?us-ascii?Q?B5uxndvaQq8zgzptqzlPSKzCH7GPCZS06bLqTSGVKdNrFiIbaXZPI//JTkl3?=
 =?us-ascii?Q?8QcgX3yDdsZlk0Fdzk9KmQZK2hYZ8VxGA0MWG6utftFWWHBxmxlTXAin6t+A?=
 =?us-ascii?Q?8vdUh0jRoyA+hNW4lDI0y+0DYx/2OOPSnCK/Q9f+RCeudA5K+i+gqIb1ujdb?=
 =?us-ascii?Q?ex5TrH4UMBCidohYF943YfMz3EloqtTKYhgT5ngMdwN9P2kyBuDEOlX2bgLa?=
 =?us-ascii?Q?x5ejcfr+OnDMCflem15rVAPcKy0u8Qp/hGjdl2HC5qj6DNdcaEJmbyauCQvP?=
 =?us-ascii?Q?fyhnE7oz7/Ui2D5Lsklx7hIEWoiVvrCaemgb6uRfKOd4mNXDMWVIhiptqo9E?=
 =?us-ascii?Q?i69NpQebANm4W3XWabUPIXyAxdaGD8/ivEwIqnx0AqIo0hRPiTVaEIJC4UCW?=
 =?us-ascii?Q?3ac6V9V44409cLp/d1v+U7a7DotKvr4SYrcN/DxsSLx4VaLophMDZmR3/TPs?=
 =?us-ascii?Q?ktMX+BPHhxiNnHz8guuk9O8jM0/Ti2uL72eU95JLOTLlssNPkQb93oAZw9Nz?=
 =?us-ascii?Q?JkQ2VQUaZo4hGicABivphAXn5cAI94pVbYTkBT6hu54XuzJ2rNFjSJUVlBC4?=
 =?us-ascii?Q?CWePEZ2Bj4pAlwo/Agkg50iXWNOytWVZW/iYOiAEFvFSK/UTV9G4IIN1QU67?=
 =?us-ascii?Q?rV29Qbd7VE80E/fcxDZ2XQMorFx1Z1dUkSoIPp7JwqtQ6p+G5jEmnySnJODa?=
 =?us-ascii?Q?1ZqXjFUVEMionXpu+tWx7wX54LqmCE7y6sa428weg04BK1Dt+K0NnJhf65D2?=
 =?us-ascii?Q?y6QLU7SbhzxjjR9iMFVhAEQ2NISSLD3j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sAzyROOOVShpRD7LqMR6NljSEXpp30N5rw7JJPf0rbdevxlz6bH/+9yyCpEV?=
 =?us-ascii?Q?k5klFfZpHe32kZEWdKC10WFWN1U1C3v0xO7Gsv5cck3q0rSS3MHYK4gVizrH?=
 =?us-ascii?Q?TcD3OZwj1JNeNcZePZeMVcE4M9WlibzycEfmgUoq719esetsbC1nplKFQvjI?=
 =?us-ascii?Q?4CE44aV7Is/dDL3+8E/0ST0KVbujH9v700srA71V4G+2kpBA+RrIcG7n2qlA?=
 =?us-ascii?Q?HHRLXi9fuiziAZQsLBe+6ktuDKpIVQetzJl0Dzzpjc+QLFuSeDRckwWCW8r9?=
 =?us-ascii?Q?h9ymYGdOnQApTmgXywyLj4RI2Cb7lVgJ++CjDr8FLOg57vzF9hRYyzrXAiwh?=
 =?us-ascii?Q?Pq/l+8/hrhRfp7zC6SsAGomg+BqiQ6gNuOE7tj4bg6az9rD8ojrn1tXfaja1?=
 =?us-ascii?Q?3oqtmKUCSrw2yvvTs++eVvDBNdY45SPUx0fo/rzRBL0C0PJczUj7jrOMeOyE?=
 =?us-ascii?Q?BmR+dfy2+lyU20bjBWCTYhFPe0OyYCC1vedLkrPCoOlMyV58URy8auBZZYGM?=
 =?us-ascii?Q?8iM/ZyccJw4aBZW5ToZKWRk1sKlf+Ou+A5rBxqH784eTJViW4qtof7VdS111?=
 =?us-ascii?Q?dk6n/m2W3MLUJhnyD4Ag4Xjg7xzjBoxPvokjbcdfCybFljUyhZoT1YPDD/XD?=
 =?us-ascii?Q?V9aL+ve/B6mQoNO9OiyAm3b80YJUp0f8mP7Bs5ogPky+2EYunqBCkX/90Tqi?=
 =?us-ascii?Q?F/Eas/dZfNLUtfvyKiDmJifFcurWPMnla2qwoYxU+qDaiITbkVshI1zEo3a/?=
 =?us-ascii?Q?QhyNQVjX8+JNISjcBWZSCQjvt6+v88SrOYdsKKxwMi3kDVp04M8FMF4anXYN?=
 =?us-ascii?Q?ufCuyve+xY1S+g0OHRxoLg42aS5+CJWtIiT6rx3rQjnRGXXLCJrYn1nx3Q5f?=
 =?us-ascii?Q?rc1L3x4fFoZxLGfKYHHH8C0976/KPex0gyXhL9i7BZtFWzVyCVEvdadAP8QZ?=
 =?us-ascii?Q?VO0bWmObNPoj9nfm1c3l3boSDwi5QXMVe9n0mgrbh7o+qllgSAALCl6SXM/e?=
 =?us-ascii?Q?ESrKkGWi96N+Mo85PbEeMICO0WPr6jA2/b8eLCgbxCnK2+xiYWkYRF+/hGLU?=
 =?us-ascii?Q?9sRFCH/CnK+NdEoMGEd7gYhVmZmPiNjiHv7XBg8AaluqxwiLcMnnEurSoGFz?=
 =?us-ascii?Q?eeofYF0PY9AERBXLSsGtjb/ep1cRxUcTLS1QzX4MyKI/Uwuum4AYTPcMEDMO?=
 =?us-ascii?Q?cenbhrp5tf0FdqwewqHhIKgPE48bzof/2duZFYb1bsklWmPcFoU89wNttY2t?=
 =?us-ascii?Q?LEqaxguFufofpsRx+c/HpoaxiwE8UDYv8E9R3sZKD5MF73zHR7imOCiLIWH2?=
 =?us-ascii?Q?5ZFme/hZIBES73Ztwol7rdKWQgc75qNozmhOm6GolJ0m7G32deO+MRaHcjSf?=
 =?us-ascii?Q?tBjsjqKKuFYr5Xq5JDZfDtuj6aHfPCtv3fSYavqwEPow8YKKD3dQ1V9t5hWX?=
 =?us-ascii?Q?UckA3lph7pk6tnzhMyXrZgg0s/OfpIXrc6mcBGyk3qGhdr8GjEqd/WN4SpE2?=
 =?us-ascii?Q?iHdCWfVhzhdBbqe2ANbq+Sl/jU7Zp3sL49WWijnIw+MM0xwN4S8/f9TAVYOk?=
 =?us-ascii?Q?/NoD9BrQ5nGK93TnUL02cyRIPSxrl1rkaGUkkfJK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f1d8b5-a7dd-4c45-0bb8-08de0d40d414
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:43.1661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb0K+w86y3uPE/leHAiI63fS8luFl63h08pluYwomwNycjGdiaNCAjPCw7S+/vkiWvwutiV3HE2x1iWp1TF8AQ==
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

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Switch wait_on to read_poll_timeout

Changes for v3:
 - Fixed minor nit from John
 - Added booter load error thanks to Timur's suggestion

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 63 ++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c871fd061987..98ad75b93ea2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -510,14 +510,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 115b5f5355a1..98be14263366 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -52,7 +52,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub(crate) code_offset: u32,
@@ -61,7 +60,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub(crate) manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 592c9b37e852..884fe0598811 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,8 +3,10 @@
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,65 @@ pub(crate) fn boot(
         set_system_info(&mut self.cmdq, pdev, bar)?;
         build_registry(&mut self.cmdq, bar)?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }
-- 
2.50.1

