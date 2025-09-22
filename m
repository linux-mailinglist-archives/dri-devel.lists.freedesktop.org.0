Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A1B90617
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30FD10E442;
	Mon, 22 Sep 2025 11:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="plmnV6lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010026.outbound.protection.outlook.com [52.101.201.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5B10E440;
 Mon, 22 Sep 2025 11:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os0+HtYLOBLetvjMZdDoyJ61YiOjtZ0DN40KMI5/sLqlpkJYGMvwk6hM9yD88iaKOikCNEUvDw4mcy+ltTqafKpr4bsMJvNVcCUjnQjnIBDsL5tgE1ZJT6QlD6DdKyPY5bbXyfkeYFKyu0xbedtOaHjwCsJuquaIp1QTmUk3O4kdaYLb2RQX6/RzQozdmW35DTlSxdKZ9STJAPjzrcURYVPOsTcSIdvTP3eRNOd151i/vuv8TmL01Q7ymydCkepMDxOsJCtC69DjGxpWYWeiF9QytXNgbyn91t4Ni6tlPe++nSqedNLoiCZCGwlyoj9YOlEHfnSUwk8D/KXV1LOhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq1Ha9JiZDJmZVms6solmmVbosFfhTdeXRWnmYwse+s=;
 b=OJoArJLOyGur3ExL/xLFm+51TisYzRyMkaQ8+WBXCpDX9Lt05SOw1CFErIAW/LuqUZ1Hl1XG5fIKEoqL1UDQ0dRnwd9uJavGfpv2O5OzBa5zEMeNMfn3OzSyj6ekdmL1ugj+V6RoO4bPzJDtk7OAVFJx5O9vr5Sn3H02Y3hxMNAfHhxfal4ze40/lJ7LJx0NOi/lq9TYcXnekGLTMRgASAId7jMeIYsFCgXVRZbR18kMqJFvim4Ov8ura1hrnt/3UKEU3AM9COpuEUGK7WtcWmzRtRcv+Yn3ozdxrNM6pI4jFq1n84Dga+TlchE9vTTkQaj3Bdm4cymIGJlyrhGbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq1Ha9JiZDJmZVms6solmmVbosFfhTdeXRWnmYwse+s=;
 b=plmnV6lfjCuce7y3pUFY3XnWgRbK5DDUSO+Y0kcHrV134H4neQqh4oJ0uwSNYGsCEwQh9cr9+/DKROEzEnmcAdWOalA3dMSJhZrGsYF0UclmaFMmqciqH56JVfcCNQZiR5sbDsKbk4L06A1+BvDfYd7YJez006gNoADRkVmxxfm9mW0+2ZOKEzFPByulZivvT6sxuviI15JpsnGeUHW9pH6aNAgVcZhLpM/dMiDlM7hMsMh6NUu3Zi7265DPNxDPPNwrKhZ3ZcIP6YPvxjiO7tc/qZPqxMQXFWGSEfYxlugxQUICyUQA+PlyPy6ivS2/R1zIdcakcXaRJQ4DUdYeGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:24 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:24 +0000
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
Subject: [PATCH v2 08/10] nova-core: falcon: Add support to check if RISC-V is
 active
Date: Mon, 22 Sep 2025 21:30:24 +1000
Message-ID: <20250922113026.3083103-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0072.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: b9082c97-459c-4515-1e62-08ddf9cb8fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?REqFh+iG1WKCBmxZmehrlik46o8QcLAdILtZ/+fUenVt1i6bzVovPZjFEctT?=
 =?us-ascii?Q?X5cojG5xJam3lgQ7mGtAHsDXnXhIYY8CiI99PUbyNMhxEOGGGFcAGY+5yWf7?=
 =?us-ascii?Q?3vwNYO8vfRS/iGCmBdDP2wKnueckF6u9XepROk8qu2xSZpsDZQdnXsOTjfzI?=
 =?us-ascii?Q?2fuhzPqY9rM7nbIn7+KKFvO365xjvMbIPCQhQt2RnUTUr8kxOMJci0M3Yw1C?=
 =?us-ascii?Q?k//SLH7l0l7OWTA4fnhgJIC/OzD+uPF89vqneQeyv2/vm/c7AbF/McoNkcgT?=
 =?us-ascii?Q?LO9V+CYo06M62z3VmIEH10q7tvkaxWYeYbBjXInWmcUteSGALXkfOtIL1n1u?=
 =?us-ascii?Q?t4dhA6yBOZ3TlcLP20nncDNYjuMslnEmOOcF5Re5JWpMxf9fY7iKk5zEJWSY?=
 =?us-ascii?Q?XAp8fW///qkbZCzBRibv2dHuUDe4o+rVcswy4+qtbMkP9Webs9mfFJn4BERJ?=
 =?us-ascii?Q?xERA8IFKzuqn3vmSlMe1apg2XnsObrMqTmA9EM7lB7DpB96ihiUEAqie164N?=
 =?us-ascii?Q?5CEsRWAQBsQ5ofV+CKdik4B/dNQs0Jl3cKyTOnC1+mg7ik0toK4CQ6XYfENb?=
 =?us-ascii?Q?V7O8ADc2PlAbadHc/Xjvhtd1d8ctqkGRva2zdmjR/6Hi/b/4xxu67GfFY8XI?=
 =?us-ascii?Q?QwSSMkRF8vJLUSzT2Ok8fa9ln+8Qda2PgtB+4Yla43JEVJAuMWD0N2O+eurB?=
 =?us-ascii?Q?vlTltHx+dBDGtt/iLtxNQSyZ0d7EqEZVEBKgxybTjA5Wpi7WRr3ByAKEnnUv?=
 =?us-ascii?Q?Q1wcfQiZaEpK4pDLuTdsceUd5ChNrCGunt9hltNw+ASAWlYOuWslyvBFzZBx?=
 =?us-ascii?Q?6QM2Kbgqe+KMiZHzJvWehprDNnlLCwN2G04au53xZnYI4HP3M/DcD9S7JCgp?=
 =?us-ascii?Q?bk/W1Sm2cjBQC2wivZoXJBGeERs6kZbi1gQFTHlTHi8TGFWK4q4YChRVdOnl?=
 =?us-ascii?Q?ox4xabN/wnqc25v2DXlKjhc85NFGkCVdX5IuDsApvQwqjzMT4B3HyEI1I57C?=
 =?us-ascii?Q?t9ow4ayeWY9eagyoKfG2YSO1+Co8Ka7FNsyFGg9p/eJxGjoZLc1B4heEYoAj?=
 =?us-ascii?Q?j/6fB4mkQcosHrvLDeG/d+oEaG0NSiyeSmp60Auc7K/kaOZ77WfJp3+La4lh?=
 =?us-ascii?Q?P0GShSUaL1dDR1G17hKtF7cVB88fbkaaMk9nW8BLVsYTY+7sKlSQx+x14+1k?=
 =?us-ascii?Q?cyGU6XpgSMJRMxJ7A8fJKD70aplJi7n9GmDtEDiMShbb3xDJrbVl1IdXThPI?=
 =?us-ascii?Q?gmGP8W9UWZy0gKuoTg36DJbexH16yvhw8VeFdRjGaBCweVgVTuuON4RuqJYo?=
 =?us-ascii?Q?s2aHsO0r99NrWRQWB7hGt8zmeO074g/u5AfJui29EFQpa3jjI/5HP0oSyc2k?=
 =?us-ascii?Q?xyIGeDYUK8uKSa/3Hq2RNhaPdRNbMPpqtynjHNylzFOFILSwsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n91e1QdsYqigkLGwkpGBKQaDUuNsieYqj182yJNEbe/3p2DyR9szsf7lSDy9?=
 =?us-ascii?Q?k+DS+pcIqfC104VPr7Nypk5kgEGadvUDofuh4hTJSM/7z6AOjgIOcG8QFGN3?=
 =?us-ascii?Q?5wSnKFFAMra2rCBJ0KOB/yCycL6gsfeFediCs8koiqUYIjWFQhERaJ4knNwV?=
 =?us-ascii?Q?k7j4AphviJDbDL6yGzEsC5XkLUiiCqLPEzNH+bqnfmstw6BKcZM4JXylievF?=
 =?us-ascii?Q?hlgg8w/TPq/RX5IYvILcWK4BcmQP69rMNxnFmQ4EFkGrFCEGHaZfzV2OQ2Ix?=
 =?us-ascii?Q?q/BRSoirViqJ2eqBDFfjaratBRPP+zqoweOFLVYyNLhRh1waaEwQbR8kzorm?=
 =?us-ascii?Q?M4y8GtCk8WdnJPY5yGw356IjyK3W9b9xeZjQLw4fXYDeXYQSHb7iPR2AsudB?=
 =?us-ascii?Q?fmis1wg4lyuCjQS5dYkYf9LrCGSHqKz4sz29ACzsnUQnKKNxSRRK89bohd7j?=
 =?us-ascii?Q?m2TOWE3dLOQ2lZcGFixowERKlzlIrM+vy0OuE9oH4n36F+5V9Je9BhKLeYto?=
 =?us-ascii?Q?poGpF5EEjuU7+tpR/UuvmrBpnXfyt5mim2uZ68t3TERLDmHwYcV/FoopCUQ8?=
 =?us-ascii?Q?j85S0MTBz+ZsbghtXgqUKRm9wKta2PC3iqcBEDldXrFNFAkDnocneJJWFHzS?=
 =?us-ascii?Q?7TssVaohYMsrpf02+RJPIj3V6qkbsPXutVg6CgIA+PYqrb1QgKfQgOO7kUoG?=
 =?us-ascii?Q?Pc6t3KKo6/NrK1sOubzG0N5CDthOq6/1SZhyB6D9vt9Igonkf8joSQ9BmqIc?=
 =?us-ascii?Q?9wtoRSHOFVGXofkx0CJWhKDEtw/8K6Aiefg0z1khtdGRZ3QQiUsURdzxv8zz?=
 =?us-ascii?Q?MDXXUeMf4O2FtNyILjSDqLrNnXfa3/51QKX+mpnO1zxhvJaTTwiocYqEKi7N?=
 =?us-ascii?Q?e5hCb5mpMUZ6maDxqsLYal4BVw+T4VONOyxJD0ExphHi1BU/PyaS8j1o9/BN?=
 =?us-ascii?Q?llgzTkzGwfbSwmvzx1QacX2XaQsI21nlSIv1jV4HXWXxMWm8FPdi+1/+fOec?=
 =?us-ascii?Q?SdOObyQRUajc0NM8VkVFMFvDR8PJjBMw2CfC9kH0x2oy4D71ng+EBGVIxsJD?=
 =?us-ascii?Q?zq0a9NNCSRhz2xVtNyjIaBv5URfbI/0MP2xfCXG0n+tvTbh4SzKt9myVX3dV?=
 =?us-ascii?Q?auHZn7+w/hGee/H3anNlVj9JOQAEd7DWyc0UjCktvR+TROAMShui/sIeXnUo?=
 =?us-ascii?Q?MmT7sM9Rl1Dd+RXtalq3WmAztm5TmoPBBdkDt8y0ifYUjMroyuhvQzRP9pXq?=
 =?us-ascii?Q?1JYkpD73TsA0p1A1fpK1SGPCx0Dd/uLZ9CexQ5Km+QBQWuoL5HbIzax4jpLr?=
 =?us-ascii?Q?ADw8rcUtBSR2Z0tL0pA4iGT7y27o/27mBiMQlsfFMON+ekxeSssihkZLdt1r?=
 =?us-ascii?Q?wW/8ZFxePm3tBsk1HFNXuSDG6Ayvoe1bD7AeU+8E16VV+9wWw4NaZQa4kl8I?=
 =?us-ascii?Q?l3v3G5ysk2lG+VHhRIkf2fhnVXuUNamMjTZoxe09R0hfmNRDrwXRBx2/XsRZ?=
 =?us-ascii?Q?3umCk/kQVlRlbiJt+uHhdfvhjkTeo16lo4T9n2TInUiDKAAM+zODExKvmIw0?=
 =?us-ascii?Q?4AN01TFa6HdbmrVPUuX7FM+b6fv6VLJpog0rJIsn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9082c97-459c-4515-1e62-08ddf9cb8fc2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:24.3643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGoxOAqRurWuG4UqS5t+Z3Mp16YB1osBuv7N4kr7YbzGv2dLqJFg5NmGLI+CzAkR/aAqJHXU1+GEygcDwS1C8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..c7907f16bcf4 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -610,4 +610,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        Ok(cpuctl.active_stat())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae951..5df6a2bf42ad 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,6 +324,11 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalconBase[0x00001388] {
+    7:7     active_stat as bool;
+    0:0     halted as bool;
+});
+
 register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
-- 
2.50.1

