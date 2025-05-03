Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92532AA7E53
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 06:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE2B10E0F3;
	Sat,  3 May 2025 04:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BjPi4aLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFFF10E0F3;
 Sat,  3 May 2025 04:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+S0BODj2YC5WsEwtK3+s9uqfXK6628zd/SFLdorf+1G5eX4DG77MgpZ2GEp/KW8IuoT8HQq5B2GqypSWrEDOThouLGaIWE0+ASGZZTZCTsKpto5CP785tMMHiw/yXaxsnd8Oagzlv/Q3/ZCzliA43zCxZg9iXjLFfd70A9c+1OQhSmE6r3nojfXPmjQWcgWfv2IcbsCAiMdKjC3Os0TC/+KfNXI2n058Q7VNImIHjyn9M5yZ/uGqYWVth+4IzP04p544yZy/uhjPhF7qWpolDYDJzFLhjajQjO4IlXpUIltEixG6dhKNqjaEP5UlazIuufNLWiRZNSyZL6yEfS3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QBMiRWL0vM+gzpmMCQRNP/Clh7DhFE2t2TDroftIoo=;
 b=wPx2fny6lWwqU0Uz9SFLB/5GWzvsB/6Ri0xJkD2OtRvUChK0ztMjLOc9cfV2/qlSXHcFlRYoegFNsSrFEg4R/d4GUapCMlal7RKHTBMGVO/zL5kpoM/o9A413GKDMw52LAgUa5NFpKOmb7ohTNez8hi/HMlqoRXQTpnvnupC9BAydbIhF9Rr+D6Gkq3k3ndAX9G3Trh+QlAKcgfb9SVdUPptijvb1G2vFU0OhlXhJzWEOsRw7e81EnwiFZtY8M/itldtHOjkBE6wmU3VIk2WRUrMg/5YIFZFoE0C7+FD1hMG5M4cFhSNa7mySpPIlon7NPzjvqW8zOhmhImhHDwdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QBMiRWL0vM+gzpmMCQRNP/Clh7DhFE2t2TDroftIoo=;
 b=BjPi4aLV7wrOEhWVyjv1EcC9bsISTMnt5T4XepkgL2tyXHRktkuMqC7I4lAzHYqC8nqgLzywxrbBFlPEBIlUhkptUV8+UaAAoCBStDX9kl/cjy4oi6okp849ozMjGa0AEzFN5U+ohOuVkalQOjCgB5PZmIOr5UAeO+ulzSF6Mf+Gy4WgV8CHyGhT861cRrRpX4OPy3TK9rN50J0o1Ywu3cnuiLZKPGolHjwL0J7kFQtCaReO+bucEVMm06mxNXSdRUjtGjk+1dsvKNA0v/dY4asln0pl8wrMQBFSYC61p0We4eFNxZ8BFdn6S7vHuMmlaeH8RmGVOtJWCbOyPTRRwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 04:08:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Sat, 3 May 2025
 04:08:09 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v2 1/7] nova-core: doc: Add code comments related to devinit
Date: Sat,  3 May 2025 00:07:53 -0400
Message-ID: <20250503040802.1411285-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250503040802.1411285-1-joelagnelf@nvidia.com>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:23a::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ff7481-bfaf-4eb7-a43e-08dd89f81d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Be1vg5X1ADYtxhmO9zbnAoQqv2zmpRROjosAmFyyO5oP3an64fzsXDwHRd0O?=
 =?us-ascii?Q?H/joJMLW5COGzlVBlNY6wzWXFDQ8ZOmJRZUs7T2swK2SlpianyOAOj06Ua/N?=
 =?us-ascii?Q?SZQ+OWZy65s+keF/hnSfzveuZNHj/ZmhdF4bJ9WbeyhFVeMieN0F23CBlArm?=
 =?us-ascii?Q?7XH4EQiqj6c3gXVQGM8U5nLLmCp9mIVP5ql9bwxXgOs/la6IT8uLzWUKTLwa?=
 =?us-ascii?Q?2j4vSwIZehHIo0sv8TPhtQ3AJnVWWH5yXbF6OmCHDdJlVF9EZTj5xHiSoROG?=
 =?us-ascii?Q?6DzulyoPjforvXtMQ2c7j68eWXXYKnfLH4JlvheyIwxR0HKR24YaZRrK7mLP?=
 =?us-ascii?Q?xAh8Cx7/cUjwXfI61OGtfnYwiBAY/1ROEWiQQ+A6l4cdNAq5jmRAyb/QIOqV?=
 =?us-ascii?Q?xASNz3TQToMU+e8p9Sml73LSHCxqVyIjQxKT4DdXLcPiowBcxnyl+IfOFyDI?=
 =?us-ascii?Q?SE/Az0GSckcn8MwxT7g4gcbA/LIUyneYS+yciBWyN2pP/g2fITtgrUcHW1I5?=
 =?us-ascii?Q?H+h/2BbpKF5I0dBKVPqoARHQeqbF5iUEV38a2C3lhD6m1ZUBRfZXs3rju9fW?=
 =?us-ascii?Q?cYRR+/YHWtSkVOQUQAZG8tafaJiWlimW9pyQhLAOafP8akhlbaBkBCosTI+h?=
 =?us-ascii?Q?xksAJrLY0+6mwV8ae0xhKnnOKaRSMmoNzBmma77QG68AnOTuKdW3Lrn42Ngb?=
 =?us-ascii?Q?lUFzWNT+7F5tbovusqdrg2Sfa82pPF4/qIUriaxpA23JTkDrF3kJq19V4AH/?=
 =?us-ascii?Q?5daMKWnzGRkL76LXPVLcEBRy6teZL5eC+Pavp9zBMKErZP1sofqE+w1UBDxD?=
 =?us-ascii?Q?Gs9e5GmFdWiqki+M9I2B4gddIBDYAuFbvS90hkMdvG8jFStI42Iqj01LNKov?=
 =?us-ascii?Q?Lpx+DSMwrm6eEd3pDZoqA1fzXKak6Dn/48MR3dsChXD4OA05k1R+DPinukO+?=
 =?us-ascii?Q?WbBy/7NIYYPi7buxAhtflZ17ISmexPFXdtLmEZcPkiD6U3Bra9e+yqyElZVz?=
 =?us-ascii?Q?a5qsu2Hc0ed5jkzgkjDli6HN7Xe/hPO0owMGzRPnUnFKuHaD6jt9YnwWSlRO?=
 =?us-ascii?Q?tX9rkY6XZNLoqwjX2tEwsrLjo41Nr+HV2/PR+TAocyi0rpIWWKcpxZrNM6Rv?=
 =?us-ascii?Q?ts6r+4bNlFDQu2OIpaFpwCIq4Eh5Ad2zit18sG5oWQ0dlm3SS6TxW+rEErYO?=
 =?us-ascii?Q?iEc3ApGBtfX6faSf6vieLhKojYbCcB+ixyQbH7snBXd9QSej6Ezttr0m7lsz?=
 =?us-ascii?Q?CQnQRLYCbXR1DGaTvPrDM7zSa6m0S3nCD0FTXiIrsCdaDDJD1V4P5jVEQdEf?=
 =?us-ascii?Q?ykrZxhD2WltcJM4qrsqbvPDWPqhy7hX3taojiFqptiv0iXNnSNTnVei9qw+H?=
 =?us-ascii?Q?5Wb82jpUFwGF0SBNOIL9ZCNiTz0iuVNwdIaIBkPGEODqo+IJ7wKMgMlN7YS4?=
 =?us-ascii?Q?oyBKCGRSUL4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJnA9HvmRTJsN0hFfolyPxSzVNn9WQXiEcPpT77P949lAwsENgVDB9n5lWJ7?=
 =?us-ascii?Q?vuygrwGUJplF2Mluao2kN/bFSG3jh8mur02P48cOyKBxIhVNOKJm39wc62Ee?=
 =?us-ascii?Q?FXuqB1LB4m6t7AGZuMBbq4BjqceN68wLwWOBEvz3wkwwCaQgzCfrGU9LKS3H?=
 =?us-ascii?Q?JmUKF9qzyk8s+hWdu4Yr/ZfRekX3aRHb9lHNkKqgg0xY0NCP6LOShwKlYoC6?=
 =?us-ascii?Q?Xjws/DbMXxMSt4ltUyhB83rJWWhEIaX/pzecm1RLxuO3gfXEvxDsiC35/s2o?=
 =?us-ascii?Q?ViFZ4CzyQSEXSrqNUI8mVGVz8tuOk2Je1GQ9n3yQzStle7IiKqWZxbI9u7as?=
 =?us-ascii?Q?NlpFihbBmsondDzbBNC+53brwPotrAYI4Ph9FYjdG/dhrtVKm7v4uXUiNghG?=
 =?us-ascii?Q?Z9xarQc5+rrZH1zeZSO7ajuAs4//jfE95uFqStow8HMfXnQpRR3nGOByiVCs?=
 =?us-ascii?Q?SEJx709gUMdZOtXB+9m2rQDo6J81nqQOLv6aYbzPJR0d3NF3uaXNbiQoOTBZ?=
 =?us-ascii?Q?mKPFGStj0CV9n0QRkZfgsO2jXCyjUoxlYHhB3B3XJd201wHr0END0CW++42x?=
 =?us-ascii?Q?Ymf+J/fhMUhvJ3I25NpuVMJvVdgunvo5diuZyc3mRnocloszDVOx+NYGzuc7?=
 =?us-ascii?Q?KizuA8wPesVaweo6RZZAwD36tZiNaIDQ9ere5kCqPo7TIRHlgx4CPbG39XQI?=
 =?us-ascii?Q?HgcNsi4U/MaGO8JScZJk0s/n+Ka9SYteSV5MhdmqlqgedzLiKb4zErtv4zED?=
 =?us-ascii?Q?BlXkJzNdk5USbVV7ghiCYlNUxfT6BfoGW72aEwdxXBv2G1n6Yt4YhCollONX?=
 =?us-ascii?Q?3Yefh4fzEGUOfQVj5fdLZhR81IP9CFWgGl7vvBX+cRAkAasTZkKxJmK1XAcv?=
 =?us-ascii?Q?8Nlj4r8BgthSFw3Ue2TTOQQE3edOhZk0W4pj4vxND2Ptjmwne7cVU7XYw/A7?=
 =?us-ascii?Q?9qigC3HMvMzCMjJV/ejHYy9w77SuNntXFxa9V9TvJ6gmLIl4G4wHe4Y7ZaMf?=
 =?us-ascii?Q?qD91+GtQMy4SY9nZJfoFLWDouJBSrnbA6aEka+S+slsftjuzTcUV+K/Dle8X?=
 =?us-ascii?Q?Rrc2Yy4VSIuw5BU5jhs6htHh8onGezeuDKST3cEiKf/xm5LWdKT71uG+5muB?=
 =?us-ascii?Q?jiw1rYITrDfubpOD7hpjNekBvWQ73E1XrMtTWvEY5Km1ITSqAorTk3Vnnlt0?=
 =?us-ascii?Q?zybWCo4ydNGFIQJ+sbs6Xof2Uzt1O5WCBqQmGOZ1PlyRlONuR/c7vGaePL1p?=
 =?us-ascii?Q?7UcbJ+uC4kC9/UNRL5AnFMEIHfDOXwOPS4QyR8uqVsGjxM7G/joPtRv9wINX?=
 =?us-ascii?Q?CrRXIU+L+bhkwen6SVlJdFkv3xve7N/GyBSn+X3rHwSsFxckX1CqkmWSSoX3?=
 =?us-ascii?Q?L+FMGagONtYFt/McH5Rzkg6tmhS8YsrEm/DWAL/wPqzJ4FMYP6Sc81qoEE1u?=
 =?us-ascii?Q?iBtykWQgLhRR4B1FH9P8F7nZ0vR73jbU6eKhnzFGzPP52gNTsx3vQubVI9it?=
 =?us-ascii?Q?xZmcGq34mscywBowz6km1EgYH9HHP3xgXNJe+qEOKq5GKV1pZuILvrm/WACn?=
 =?us-ascii?Q?7t7w9AxRQ6/EV2DdUiZyiIC5yMxgkeTh7fVYlldI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ff7481-bfaf-4eb7-a43e-08dd89f81d8e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 04:08:09.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nnu/iTfc0x9V5w1UYR6xTXLUR+liWX3ZsPQRMkFegO0q+U7ioSCT0xinWDeYwtgiYoLP08Yxjv7S3r7FEW99Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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

Add several code comments to reduce acronym soup and explain how devinit magic
and bootflow works before driver loads. These are essential for debug and
development of the nova driver.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/devinit.rs | 34 ++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs    | 16 +++++++++++++--
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
index 31a313a0652c..21fc9b96d498 100644
--- a/drivers/gpu/nova-core/devinit.rs
+++ b/drivers/gpu/nova-core/devinit.rs
@@ -1,6 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Methods for device initialization.
+//!
+//! A clarification about devinit terminology:
+//! devinit is a sequence of register read/writes after reset that performs tasks
+//! such as:
+//! 1. Programming VRAM memory controller timings.
+//! 2. Power sequencing.
+//! 3. Clock and PLL configuration.
+//! 4. Thermal management.
+//!
+//! devinit itself is a 'script' which is interpreted by the PMU microcontroller of
+//! the GPU by an interpreter program.
+//!
+//! Note that the devinit sequence also needs to run during suspend/resume at runtime.
 
 use kernel::bindings;
 use kernel::devres::Devres;
@@ -9,15 +22,28 @@
 use crate::driver::Bar0;
 use crate::regs;
 
-/// Wait for devinit FW completion.
+/// Wait for gfw (GPU firmware) boot completion signal (GFW_BOOT).
 ///
-/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
-/// considered unusable until this step is completed, so it must be waited on very early during
-/// driver initialization.
+/// Upon reset, several microcontrollers (such as PMU, SEC2, GSP etc) on the GPU run some GPU
+/// firmware (gfw) code to setup its core parameters. Most of the GPU is considered unusable until
+/// this step is completed, so it must be waited on very early during driver initialization.
+///
+/// The GPU firmware (gfw) code includes several components that execute before the driver loads.
+/// These components are located in the VBIOS ROM and are executed in a sequence on these different
+/// microcontrollers. The devinit sequence itself runs on the PMU, and the FWSEC runs on the GSP.
+///
+/// This function specifically waits for a signal indicating core initialization is complete before
+/// which not much can be done. This signal is setup by the FWSEC running on the GSP in Heavy-secured
+/// mode.
 pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
     let mut timeout = 2000;
 
     loop {
+        // Before accessing the completion status in [`crate::regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05`],
+        // we must first check [`crate::regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK`].
+        // This is because the register is accessible only after secure firmware (FWSEC) lowers the
+        // privilege level to allow CPU (LS/Light-secured) access. We can only safely read the status
+        // register from CPU (LS/Light-secured) once mask indicates privilege level has been lowered.
         let gfw_booted =
             with_bar!(
                 bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3acec36f2d57..a2b506883654 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -74,8 +74,20 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     31:4    hi_val as u32;
 });
 
-/* PGC6 */
-
+/*
+ * PGC6 register space.
+ *
+ * GC6 is a GPU low-power state where VRAM is in self-refresh and the GPU
+ * is powered down (except for power rails needed to keep self-refresh working
+ * and important registers and hardware blocks).
+ *
+ * These scratch registers are "always-on" even in a low-power state and have a
+ * designated group number.
+ */
+
+// Privilege level mask register.
+// It dictates whether the host CPU has privilege to access the
+// PGC6_AON_SECURE_SCRATCH_GROUP_05 register (which it needs to read GFW_BOOT).
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
     0:0     read_protection_level0 as bool;
 });
-- 
2.43.0

