Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D921BE677E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8C10EB05;
	Fri, 17 Oct 2025 05:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bADLjqKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012008.outbound.protection.outlook.com
 [40.93.195.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BB310EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIGj4ruTaqsAqOvCSzRUCMD8cU7DwEHrMkwZgj8MREzR3rk+tqyE6w2gU0EuKPaM+1HxxQH9CYtF0Bq3wsNIyDT05Vqe0qITgSY0zeLreAPTXKyP/aZLKBk1i7piRQZrYgGgUHFSSSNntV01AEiDAoW8yt2aMHOBu88PLhQ0a3BuUJ/yBEaVQxL0NJc1lEGPAguYHOQg9R1g1if0/veC+jaPt0D7uj7Z55B+2nQ3Eg6xj/7IjuD2PWXVZNe/fPAqDXAnbPxOFIFrPVhkKSkWflWUdIlAg+M1W8+xlByR8tRCWMXbte7kyAMOeq9oGpAhm6DPiT7EMt0F4AanVDvIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl4fZbmsOtFE9cRQpnggPDRPQo5Sripp55tBzQhppPI=;
 b=eJJRVDVVD8f8knMGZsKO/Bpeq3xcuR3kMFY6Do0E34m9Tl/TwWjF60tqjatQPZ5QHpEYDdC53seWzjxGBZhWqa+czWCJ/SO/DA8iyqZ6wHRyYsLZERsrkQXYEvFyzkdQloqUgoYtang1E0lyLNXym3INmzk6Jeyy9YvGP//9vu6ARzB11AyfC7zCCKPS65Wyg81q3eOckiMKIJPnCcKKD2O0wu3VTgqxHMs54lweElG3C5IqFo4wMRWy5D3t7DFOt7ptIL1dy7tNSSWxTziebMD6v04CWhkLsJJIwvgTuHf1kUxuQgnESHz+64u3QusJS0h8/EI2wHE/0p4BL5d4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl4fZbmsOtFE9cRQpnggPDRPQo5Sripp55tBzQhppPI=;
 b=bADLjqKLbIk1a+Bz5ZQC+/Ehvp8DcokKjQvioTZNPWrW4rbTtGxDJVfwgACqkRtZNksbyZ8/KsMdDxPRcKQKV2JaQFsSrIG/re6sWrzTNnG01Ax3Xgjf6MaPvs5yyomjhQoJqKxfa5OutWmyz4SjfGFJz4WdIQOj1UXGjXUidc4Irf4YyHtkNlgzKJUybyhsNgQhOlalByapiLsv2MOE4dpbz1FA0XFftoDIo60PwE1JCo/bnlitXDMmNN110JyUc0+xi9aAvHutfNqvhX4Jme+CPGbF3QSyc+zBhhyExy7K0JVkJRpoXFuBz2srPMwfBJbrzdIBQLn8aeRUuvpx2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:21 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 07/11] gpu: nova-core: gsp: Create rmargs
Date: Fri, 17 Oct 2025 16:47:32 +1100
Message-ID: <20251017054736.2984332-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0173.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::27) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5174d550-f560-4328-6de5-08de0d40c76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6sO1mLKIVLIYZSkBKDHKRgySWSGeXqtaIQEYN1T681Z75wJ5wUEDx00ARIj0?=
 =?us-ascii?Q?R6rRTLPYKlk26yBdZa/L1jI7BaR3GNtB827xfS+pyNuegkSWdiQMl2dF2ckW?=
 =?us-ascii?Q?NrCLYYZV6+PbWZhaoywCY8szPC/PB6N/prwsVv5kJOE7McMqduDI/5LiCanY?=
 =?us-ascii?Q?IcJeCFZ01LhHg0mJCFdZDB00OnAUiOaxQrhBcG9aJcierd3ci7EQyGHc3NBn?=
 =?us-ascii?Q?5fWx8FYCbOWZKv5/wfs1GCisoOd01MQiwy8f8coOoYQe34d8g7CzZs1Wj/if?=
 =?us-ascii?Q?Ij812Eg7Esy45RcVgol53fmYK90fggX6EX9ZYEJr3q8nK+BJnifNdGTxszjl?=
 =?us-ascii?Q?JoEnCsq9rkiZ6OMr621RfM6j58DpXmujg0weRvm0s5pkyO6FlgmBKy4YxSGe?=
 =?us-ascii?Q?F4Ns3V5FF30Tm6PEK9XpoA5fu4PAZph82rvjyYDofdDK7LcWdsKXsas0kxts?=
 =?us-ascii?Q?AL5oPi6IhvvoxhyPe2sJrq5brFf7bse2k0nzP6dyuQZY9m+XgH4oj9pEzF3/?=
 =?us-ascii?Q?GeYhlmjIcJNtyxRJjF9LMjh5H6RNcqBvatkU88vVVudldiN+e7MPn2LnPZwA?=
 =?us-ascii?Q?MpV6wvru2hX7A99iQLLNHKEhtoUQR00/WpwqjdI51qjbrhus2LeSwtjJk46h?=
 =?us-ascii?Q?p1Vo8zvOShO8oJK0bbC6ZXJ21JQ3fLq0sHNNMZlDC9Loh3zpYWApxlT9j0dD?=
 =?us-ascii?Q?6Dr6Lidt8WLgbEZlob+8/WXuECPgr2TW0l8AzqR7OLn2v4j/01QOsJHBpmpP?=
 =?us-ascii?Q?PMuvQn4238CN6YhJrQSSOsYHGuP9gw+BF11VDwK74NCMxCaiPTAG5gm1QLuu?=
 =?us-ascii?Q?Dezml1Te8nm+DTc9fcrh4BkAHJx5bv1LeoeLF+hDWmdjIc/p4AQa4tXagpVl?=
 =?us-ascii?Q?SymwKs+yd9ktp0J+pzOYGkqaJ4h1+8kmr2QOzHJK0EgadHmeRYGLkuyW3pAZ?=
 =?us-ascii?Q?QYiLDYS2FpB3iuia98tYK8jP16C+YNtkmy2Tcko4sA5uToc//mDxoxAsqN0N?=
 =?us-ascii?Q?gId/zj5e7Cx6SRElK9tfhzx7/RSbkPOQFMMWZk4VOmFSKSINtmYz5tO02OGJ?=
 =?us-ascii?Q?MsJhu5afSmwGqcAf5uy7sU+ydOFb0n0mZHxdXdmy/aAk1zvb4ZEIeK7x4Kev?=
 =?us-ascii?Q?tL/MnD4UuXkRCWDiTygHG6t2X+VIWOffR27jlcrjlkvTAJ8Cw9gmDK2CCQnM?=
 =?us-ascii?Q?ZkhtiiFT23EhofzvQj184WB/cTfDXEm/yBqBsi9GEwPmMD0MM6oTUtrl1A2t?=
 =?us-ascii?Q?L06KOjELdwR8NhZLb6Tz9pYliHsWcTq0eSG05dOwNXYxp9HZABn598Ymrc7B?=
 =?us-ascii?Q?z8ipYeUPukY544GH65p1Y49J4ItTAOJ5wE3rKZJAchPSZRuZqHtRgNO18HDx?=
 =?us-ascii?Q?/8R9Mhj9UkmwMTVDz1ZlpCtIU8lvs1hXWx88Hreg8oQlrCZuAnyxknmerddo?=
 =?us-ascii?Q?csJUBTmXawinWlq1ElVq75JCShNZQSsh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5TLRdyY8LCQnxwYUjgCkP35lPrim0kuuGKdSp1eLXKQp2Cy2D7PnYj+7m/cj?=
 =?us-ascii?Q?WSpuOD+UoKq8sBilA4E6GON6n0FhrSqfVLCO5DMvYMIeNB7l/Sb/Svu2uegO?=
 =?us-ascii?Q?k7BOKE2sdMvS7f7gRMnLjWt242Levy+50f4DJScFzsEYctwgGpNba+1cX+fm?=
 =?us-ascii?Q?aL7las4fZBhT0vhrseakyHsUi6zwbuNB9GX/3x9Nk3urOB1EBqeOnAXpzCQk?=
 =?us-ascii?Q?7oUjJL4hMDxXanVRjnwQOxqlFFZxNlFVefH7PzJJ0gqOpT/5AtJYfPU3odFO?=
 =?us-ascii?Q?Bww8ZFEIavzmNsgJgJLWb7GgUG8SF25wIfNUKYAcdQ2PzmUKFYMyu4EJvABW?=
 =?us-ascii?Q?tqu0qpf/shZjmmVLbkOMSSg+4YkvTI/9y+WC09pYIhzT+SodltZ5MICiFalz?=
 =?us-ascii?Q?WTIopnxclpJrlJfVV+vE9zR/9Dtcj5JGodrJ2Rxsp2wALTqeV+vE7Ty6Kmcw?=
 =?us-ascii?Q?x39YvLvCu22mUtssbv2JCxqueAmfpkEsXsyQbChJTCm48NzyU21a194f2Tn4?=
 =?us-ascii?Q?oD45s3MWXo/tlwkzRf101RCiORux6SAl6Hwk3D8QCzSALyqOXPpZZxS1THbW?=
 =?us-ascii?Q?gktA755Psrei6aEVT75FROEKGODdCAFk+BoY+Gb6tMlfiSiglJQJbLb02Sv2?=
 =?us-ascii?Q?Y6P3r/i5JwAK9anISzVl9P4WXqOromaUQrdXb6jIGT26a6Bc9aB0PlkOsY+p?=
 =?us-ascii?Q?IN8flmwThyZ+zqLitZtSr7stw3Ce3oyzstHulom7p1eIJpiniN5HV2ANk3FY?=
 =?us-ascii?Q?QRMDRuWPLqFEnmhsUjwOXlpIZ1d2QeSu0iskPgAr2b/I31lOnKQzqGcCCTGn?=
 =?us-ascii?Q?SEFT/AVtNwRMHI/EKbKzTOXVKL1afnetC662r3+NQZNojb+Qi6LEjxjNKDoe?=
 =?us-ascii?Q?4CXuOqGSPjrISqQ1HlMGW51+jOuvZf+rrJGmC9te9rqNvI8bX08FdVB9mK4N?=
 =?us-ascii?Q?20tCqGmF/jI7BJzYI/wfuvCWNWgFwFM/8uPqbDaegI8feI50AmjViMKkH9FP?=
 =?us-ascii?Q?TmfCb4CST1eIIpH95TKCHq1T25Wi5cLUEbbme2aeT06wNsTm4lhGGr80sRTL?=
 =?us-ascii?Q?ZM9Y2EhVpYxc0jLjE/0/GZRA51bnyUwbwqyLNQzSbIgUhEjWNA37g7WtEbiE?=
 =?us-ascii?Q?d+jMoJmOE1q3i81A0CPH350y6DT8lp+qm2KbEDyhiybPXJFieNuRQOSfQh3e?=
 =?us-ascii?Q?VrYB86ADeQsZ+jD9PXBQuHeDGhA3h6S5a1NF6yP5sQ/YjcMXTNcFLeSStKE4?=
 =?us-ascii?Q?gImkh37XmzLuEPWPYAIxVW+n+UQWaKqY3g1KAa5CzSRQsQFhx1xqJmvXilQV?=
 =?us-ascii?Q?StCpX1aixSQcQHUmauJ/5tc5MbOgkg2yMk5LI9p5cQKP1MqRa8jFv6m+8z4C?=
 =?us-ascii?Q?Iv0FWWG1RewW2omULBRum3g22SYhenmQnP2RqzgsMfJKPjh3vAsOdrA/uOgg?=
 =?us-ascii?Q?LaJwMakuTjeMb4ikb2H3j4mNsz/FrIcpMf5IkbGLo9bE53dBNlPGxydf+1tw?=
 =?us-ascii?Q?TVHnkRoOk4b+5t4GpL2xWVt/S5u10nNv5XF6TDWUChsZkNbkBkd9bzbjUZTd?=
 =?us-ascii?Q?LsZlNbjVIdPyAUGTlTvialjf1IKxjkPR/9WY/wzo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5174d550-f560-4328-6de5-08de0d40c76f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:21.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+09qqKp15HAKozqVPzU3qyGlh5AZRN7pVto5guOePfcaRionE4BlilLe5HKKwrmvVgkbRVnlPbINQ1j3bJzTQ==
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

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---

Changes for v5:
 - Derive Zeroable trait

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs      | 17 ++++++++++
 drivers/gpu/nova-core/gsp/cmdq.rs | 24 ++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs   | 54 +++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 31eeaf76526a..f08bb0924edb 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,6 +17,7 @@
 
 mod fw;
 
+use fw::GspArgumentsCached;
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) mod cmdq;
@@ -35,6 +36,7 @@ pub(crate) struct Gsp {
     logintr: LogBuffer,
     logrm: LogBuffer,
     pub(crate) cmdq: Cmdq,
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 #[repr(C)]
@@ -118,11 +120,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         let cmdq = Cmdq::new(dev)?;
 
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs)?)?;
+
+        dma_write!(
+            rmargs[0] = fw::GspArgumentsCached::new(
+                fw::MessageQueueInitArguments::new(&cmdq),
+                fw::GspSrInitArguments::new()
+            )
+        )?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 42973c52cb03..5589bb333c16 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -5,7 +5,7 @@
 use core::sync::atomic::Ordering;
 
 use kernel::device;
-use kernel::dma::CoherentAllocation;
+use kernel::dma::{CoherentAllocation, DmaAddress};
 use kernel::dma_write;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -283,10 +283,25 @@ pub(crate) struct Cmdq {
     dev: ARef<device::Device>,
     seq: u32,
     gsp_mem: DmaGspMem,
-    pub _nr_ptes: u32,
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
         let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
@@ -296,7 +311,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
             dev: dev.into(),
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -514,4 +528,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
             .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c74088bdf7c0..f862422714db 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -16,6 +16,7 @@
 
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::cmdq::Cmdq;
 use crate::gsp::FbLayout;
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -483,3 +484,56 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    pub(crate) fn new(
+        queue_arguments: MessageQueueInitArguments,
+        sr_arguments: GspSrInitArguments,
+    ) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: queue_arguments.0,
+            srInitArguments: sr_arguments.0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+#[repr(transparent)]
+pub(crate) struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: Cmdq::NUM_PTES as u32,
+            cmdQueueOffset: Cmdq::CMDQ_OFFSET as u64,
+            statQueueOffset: Cmdq::STATQ_OFFSET as u64,
+            ..Default::default()
+        })
+    }
+}
+
+#[repr(transparent)]
+pub(crate) struct GspSrInitArguments(bindings::GSP_SR_INIT_ARGUMENTS);
+
+impl GspSrInitArguments {
+    pub(crate) fn new() -> Self {
+        Self(bindings::GSP_SR_INIT_ARGUMENTS {
+            oldLevel: 0,
+            flags: 0,
+            bInPMTransition: 0,
+            ..Default::default()
+        })
+    }
+}
-- 
2.50.1

