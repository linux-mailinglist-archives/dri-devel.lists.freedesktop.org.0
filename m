Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30208B90618
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66E910E445;
	Mon, 22 Sep 2025 11:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FmcsYsmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD2410E43E;
 Mon, 22 Sep 2025 11:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg1daVoXOSLdvdRPw5gnBx0DY6sW7OQYArth68azUbN7NWJJmvs3v8WzI792AV7cxkjgKSmC53V/itraZ9quWkVzr+SNXtI/+66HUeaAlsqvqNDN5XMHPPtEH8XlLy0HXtHMnDVeuOwM8yjp2z1e8mUhZ/1fDDiiMPNG6iIRpt+vI8IL48Ij/OT0sBj6d87nh+tLqaFvusBlVsyVi9gHBzPB2aaNAsvulFV7cdEei0XXxzhR+vdl3eOcmsNU5od3XNNomdsbzTD3/EWEF/pUINrzsElNFivLU7UL8O/LCeo0QFSNBshXyKojXLkCR+6c9wFsxMmShf2Qj5EpdPbKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zChhQdQ7q4+Vc7HZL0GPJy7Tt82TgAIFxAq31oYPVlI=;
 b=D230WDWUWzrziuY4yHnlnJtOMPnZj2QA/QfzZt8XnO1i4EZU66ewiZLHvDs9LKT2j+mlz5bNeOMs0+v05AOJ/Js5ILWstiLyNH+zckLaGzwY9TzpiY/QZLseyWJIgvrEO9SFQmA0yC9/2w+719nviGa9LSkp7Cl0GMWzB1IJPoUVyg6C/z8heMOo6Y8JnJERC6YdA+EGVsE0tRWcoF2mwivIqRMH31/vtGG4gd4ztcylqoyC54M0mhrvGhiovA6QW6atNk03dBl9f1e34bU6JDf/dJ6ZoJH6ZHvQShZLSIivCXxpXVSUvigfnSd2XesgOo9AkA/fugEl0NIbMEh0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zChhQdQ7q4+Vc7HZL0GPJy7Tt82TgAIFxAq31oYPVlI=;
 b=FmcsYsmGmbVS+S/LJkmwU5y/95BthgZ+flvrHf30dIyRpJ245mZ5QtY/D8mKVXH3AyFS/x4GPKhhVTI55fCkEfig3k5ytenMiJGM+Cv7PoXcEqTu+6k2qVQIqslD4BufRX4Pwsxwjt2yNgdNCwKjTXTi3TuSNP+7EtHb73ZoT5rR5oLRqSMZzAtI/wvJJc4Y0R27lZLVJsjQiTDpmC2kTmgCSzZXGfsCuL91lHzHVSAIrQ8TmkbV+ZgKJk3cQc2XG2YaCJr0tZKxej8H9YOXdLuJjviECMSPIykdbyGJqjz4xS2dqyns9P2Ew+mQdgAJrT++w7LinoH+MZZLoPFIQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:19 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:19 +0000
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
Subject: [PATCH v2 07/10] gpu: nova-core: gsp: Create RM registry and sysinfo
 commands
Date: Mon, 22 Sep 2025 21:30:23 +1000
Message-ID: <20250922113026.3083103-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0069.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: db7f4d5a-c88d-46a1-9268-08ddf9cb8ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TYWSRkbCyjdKMHUJls9eSupHA59daabn3SnZEzSyYQY69yBbkRR/Hli8z2+q?=
 =?us-ascii?Q?exKede8x9/m8XX2yY8Khpg9k7EJnwrGiiK1AFWcUbuBbXcjM9SiR05ToS8lf?=
 =?us-ascii?Q?CD733pJV0uLWRmLYTMU4rlweircKb2AkSvsBPyLYtcRXFMxCUHq/8jAIGquS?=
 =?us-ascii?Q?j89GVZRGtrKZYKum9zp1YRJkU4mMQgnorwAw48E8CDcxR1/uy2ZfTPKYSZEM?=
 =?us-ascii?Q?7BXExDfXQlyV28Pw9UReHyWZUC0xLlvtEW6lCiqxj/4nRoYdyPll3onMLeXS?=
 =?us-ascii?Q?RQ+AjX6AffhwbcfrbSlGCkzQupy8yTlh0j+BdMMBEZWOMT3jXZjFCcP3XK9Q?=
 =?us-ascii?Q?XEE/mPVbyWPU86ojeGsfBPLN/Ji+WkFdGhVIPV0Bhsrk82f/vR+tykBPDDBZ?=
 =?us-ascii?Q?ttkHkc5UrYmQdncZbCTJCGOa2N6NBu5dldMLOqrPyGiSaUOOL3FWlP1KafFS?=
 =?us-ascii?Q?yuAwm+Hjlx9wL9x7yEz4i0hZ+dE5MB+ByGXRMDCe4bbVQCwQObSOhgABJUWf?=
 =?us-ascii?Q?W69csqle6zOQ0rJNpXz2S4Tb177jUemqMAvWK0MOOAe7hPOcYKQtJA2Ax31S?=
 =?us-ascii?Q?yj+Djp+85z0B11wiQImPBcIpOlnPH8fRUc3+1nFgA6ncln699Q2iJOGJWGZP?=
 =?us-ascii?Q?pJCvo+4CArT7ITHy/HdX+X7Umjms1wX5js9urtDiM0j4fGu//mH8fFWv33He?=
 =?us-ascii?Q?mxvqzl28ktuh36ylurTTumuP1n7wG3tno8jBwD3YudagJHb/lB7ylbXKGkW0?=
 =?us-ascii?Q?OOfmB9lcegNooUd2Z3il5kHG0EJXul+o1y/gw3akIWXW0smPuKX9aGaBVUke?=
 =?us-ascii?Q?f8X6nleYoNvvw3WqxLmbHJVl+YKhtGay8tY6aRsMyvNEBzaOj7PMIThaBGnp?=
 =?us-ascii?Q?hsqqlgZFEtSATXjNqmuPzQuqgN1F2SwQjvYNOvuM8Bfzh5RQs9MmrMb2Z4bL?=
 =?us-ascii?Q?66EUJX7+FXEkO5mq+C/du7c/FgYeFdmfy4pjtnEEMCP8hb4UeR1Z2YP3xE5S?=
 =?us-ascii?Q?YFvr9Eqqzn8ZFStk5glDqaasZfpQrAgEEYUd+mE5NQpt9Hp1XKJg8+32jpZ5?=
 =?us-ascii?Q?qeAZJM9XHc+PHuue8yPmViMDfPrfT/cLGyaOW8E/DuMFWHWl9BBxNC4rAs+Q?=
 =?us-ascii?Q?JPb2UoDpe0JAmRs34ihFchVPZ5jZ9slvgsNYE+UCUj5wdeXprGbJK5e72lIe?=
 =?us-ascii?Q?9SYXYg0flOEDBOXv4MamOk3mWq74JHoXXnmDG0UCzTUjOJB7eccjNPT0Qamw?=
 =?us-ascii?Q?jIXMt6GwM+ATZlImEfNyYWhckxz1+4/ryGOMvY1ruAcB0Qi3h9b6KxcCaGuU?=
 =?us-ascii?Q?UYLGvyn1L+IsCcMetTFYWRfk9gT/Cwi+rgXqFOOwlUk8vhmbzuuGtd5qeOLF?=
 =?us-ascii?Q?6O9Iu5kgK4a4jvmQT9yT3cyF21xsfYAdPNN01EsQKvpAsr2eag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tSGjEMqyzhWp+UgMijOiYfQO5yyrSScwQq3e4yj0erVanU795/e0XkVQRu5?=
 =?us-ascii?Q?1BL0Uax+To6lJfxEqSnfmbFMOnLRDRgBt8IR3lmUCOxBZdOjqJumX2HTDMMn?=
 =?us-ascii?Q?RCpeyhtybdbCzMWQPK97CNiVgcUgOkWSMHiz03mpXqle+aQlyolk3XMbjqOo?=
 =?us-ascii?Q?leEIluYZnwx6abYix6TCxWyfmi2EzkKPhPYVjX92W1otMWYIagA+ndSJMEwK?=
 =?us-ascii?Q?kc4BHOkKBQWQVWAwSkLrgexv9iSuqeNV7OyXdsOYMjVcvfhiqLUyCNwFewMk?=
 =?us-ascii?Q?iJLONyPOuFZQTMP4cByG5g/pgoV7fahDoSalcJb67PAJTrjmz0hufSRe9WHR?=
 =?us-ascii?Q?VkpEOrtdBiVy8Jtgr86UAzuUjvjusLHXrjke3kdsyQh0zpdwlF+xFvF5s16L?=
 =?us-ascii?Q?ybqVj76Jr0Oo/i0Nz7RA+gnzMnlAulkw6eM1uJp86JJMzzS3tdAW4TUBpk2N?=
 =?us-ascii?Q?Qx7lpsOOXPYMTZn/kHaI14SLl4Q/25EXWDoa+j3z7yd+rT/cHwEnMOgD8pTq?=
 =?us-ascii?Q?Q4CXMlttfrl7NJPiT4OrLEez4yGy9ziydzeGrbYfAPV5Fatx0cQXwbW7xRGU?=
 =?us-ascii?Q?s8hbrLoM0GicHAeNxgjqhR3yG0dhIEEw5TXZgdxY8nwQruwbf3vg004xStGk?=
 =?us-ascii?Q?kXPDW+2ro2n07cD8iEVkhfC73wUk3k4pZk9E+LNY4idmOCqqL1BaP627QoxK?=
 =?us-ascii?Q?zQDZo9QkIZ+wZ2b2UzQWVESLlNs+vbfsHDsumkj85t7ORZDaM5lxmD9nlm94?=
 =?us-ascii?Q?5SGkYbWx8npdPAt7nyscBUUySfWUhv1XntaVuDrivz9ZLPxefkJKwhhjF4tY?=
 =?us-ascii?Q?bZhLTOAwNzORZzGzAbMA5NyAP4rRGCCDy+Jr9BaSPzQL/BQjLZi4wwH2KA9d?=
 =?us-ascii?Q?Rxw3j4VY4/JtltlXYkC5CvgkhSbwDZj2MPgHpTYqc6CYF51BpdIfw5SIa3Tr?=
 =?us-ascii?Q?pR4bKOnxRbWkgJ+YrSplgmHcPwAqynxDGHVfOTP+LdseJ8b4J1QKlZ6cqr62?=
 =?us-ascii?Q?B8BMi6JqgFl4U9Vkhwv4Z9SW3tdmMSRrPsULHURslsC/UdasLjgaAWSGD+G5?=
 =?us-ascii?Q?qwox3OFG3pG4T1AkNryl//zM6eoSaKTLcfmsgujKeKr81eCp6Mo8spZ3rv/b?=
 =?us-ascii?Q?iJxoOJEXODNEKSkK7ZhAzaE8YS00efC4rQcEC3GAhlH4Tug+cbd/Kp2kORss?=
 =?us-ascii?Q?tu67Y8+uOMkDnusSJuS8bs/2jZEB8rTGrLpaX2c80l9NeBHEA+7oARMjs56t?=
 =?us-ascii?Q?xochJTjQp1Rn+rRIbyRhsiDDtidpzXoJW1ILEuG3/LaYP80Stt8yGS3CV5Fb?=
 =?us-ascii?Q?tJsoJHta5xf+RqWGYfvOx2D0E3eaHyez2AoCX8BsEKTnmYzDO6zRgs+53pxw?=
 =?us-ascii?Q?RBAOqcAdblY4mz5wpbdyxa0N2Zf3SZ84+KHHqeP/r5liIKfpnRLZNzIvc1oS?=
 =?us-ascii?Q?JNPXn+8h0hdw5h2G3RZdXNSPMwSTXpJb/MVenujFwNczF1JRG7Ue18F+zrXS?=
 =?us-ascii?Q?cVi4wjB2E52vzYSB5HEAzIF4hw9KFEHvB0GUN5M2Rn49T4L/4hDsJdW+FsFy?=
 =?us-ascii?Q?ujInLMgH7oSzrptbb4s1qJF0qRswl5NH5+QAvzQc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f4d5a-c88d-46a1-9268-08ddf9cb8ce7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:19.6035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nb7I/iOXRlFXzIX3FHsm1/xBy4Ky3+JF+Rb09yxOQcjZJnKUtPXKgZ8zZjw34Bz/MLasJILIWuV97zl5D8qtGw==
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

Add the RM registry and system information commands that enable the host
driver to configure GSP firmware parameters during initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only two parameters which are required to boot
GSP are hardcoded. In future a kernel module parameter will be added to
enable other parameters to be added.

Also add the system info command, which provides required hardware
information to the GSP. These commands use the GSP command queue
infrastructure to issue commands to the GSP which is read during GSP
boot.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:

 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             |   1 -
 drivers/gpu/nova-core/gsp/commands.rs         | 140 ++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs               |  18 +++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 149 ++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 7 files changed, 313 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index bb08bd537ec4..1f7427a530e5 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -23,6 +23,7 @@
 };
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1d2448331d7a..0b306313ec53 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -16,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -105,7 +106,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -139,6 +140,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        set_system_info(&mut self.cmdq, pdev, bar)?;
+        build_registry(&mut self.cmdq, bar)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9170ccf4a064..27d40c5ed23a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -243,7 +243,6 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
         ((sum64 >> 32) as u32) ^ (sum64 as u32)
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
         &mut self,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..2df0dbc6f0b5
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::build_assert;
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use super::fw::{
+    GspSystemInfo, NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+    PACKED_REGISTRY_ENTRY, PACKED_REGISTRY_TABLE, REGISTRY_TABLE_ENTRY_TYPE_DWORD,
+};
+use crate::driver::Bar0;
+use crate::gsp::cmdq::GspCmdq;
+use crate::gsp::cmdq::GspCommandToGsp;
+use crate::gsp::GSP_PAGE_SIZE;
+use crate::sbuffer::SBuffer;
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSystemInfo {}
+
+const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
+struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+struct RegistryTable {
+    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
+}
+
+impl GspCommandToGsp for PACKED_REGISTRY_TABLE {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_SET_REGISTRY;
+}
+
+impl RegistryTable {
+    fn write_payload<'a, I: Iterator<Item = &'a mut [u8]>>(
+        &self,
+        mut sbuffer: SBuffer<I>,
+    ) -> Result {
+        let string_data_start_offset = size_of::<PACKED_REGISTRY_TABLE>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(GSP_REGISTRY_NUM_ENTRIES) {
+            sbuffer.write_all(
+                PACKED_REGISTRY_ENTRY {
+                    nameOffset: (string_data_start_offset + string_data.len()) as u32,
+                    type_: REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                    __bindgen_padding_0: Default::default(),
+                    data: entry.value,
+                    length: 0,
+                }
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        sbuffer.write_all(string_data.as_slice())
+    }
+
+    fn size(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>() + key_size
+    }
+}
+
+pub(crate) fn build_registry(cmdq: &mut GspCmdq, bar: &Bar0) -> Result {
+    let registry = RegistryTable {
+        entries: [
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+        ],
+    };
+
+    cmdq.send_gsp_command::<PACKED_REGISTRY_TABLE>(bar, registry.size(), |table, sbuffer| {
+        // TODO: we need a constructor for this...
+        *table = PACKED_REGISTRY_TABLE {
+            numEntries: GSP_REGISTRY_NUM_ENTRIES as u32,
+            size: registry.size() as u32,
+            entries: Default::default(),
+        };
+
+        registry.write_payload(sbuffer)
+    })
+}
+
+impl GspCommandToGsp for GspSystemInfo {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO;
+}
+
+pub(crate) fn set_system_info(
+    cmdq: &mut GspCmdq,
+    dev: &pci::Device<device::Bound>,
+    bar: &Bar0,
+) -> Result {
+    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
+    cmdq.send_gsp_command::<GspSystemInfo>(bar, 0, |info, _| {
+        info.gpuPhysAddr = dev.resource_start(0)?;
+        info.gpuPhysFbAddr = dev.resource_start(1)?;
+        info.gpuPhysInstAddr = dev.resource_start(3)?;
+        info.nvDomainBusDeviceFunc = u64::from(dev.dev_id());
+
+        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+        info.maxUserVa = (1 << 47) - 4096;
+        info.pciConfigMirrorBase = 0x088000;
+        info.pciConfigMirrorSize = 0x001000;
+
+        info.PCIDeviceID = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id());
+        info.PCISubDeviceID =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+        info.PCIRevisionID = u32::from(dev.revision_id());
+        info.bIsPrimary = 0;
+        info.bPreserveVideoMemoryAllocations = 0;
+
+        Ok(())
+    })?;
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 06841b103328..c6c751b95717 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -158,6 +158,9 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 }
 
 pub(crate) use r570_144::{
+    // Core GSP structures
+    GspSystemInfo,
+
     GSP_ARGUMENTS_CACHED,
 
     // GSP firmware constants
@@ -198,6 +201,11 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
     NV_VGPU_MSG_FUNCTION_NOP,
     NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
     NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+
+    // RM registry structures
+    PACKED_REGISTRY_ENTRY,
+    PACKED_REGISTRY_TABLE,
+    REGISTRY_TABLE_ENTRY_TYPE_DWORD,
 };
 
 #[repr(transparent)]
@@ -332,3 +340,13 @@ unsafe impl AsBytes for MESSAGE_QUEUE_INIT_ARGUMENTS {}
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GSP_SR_INIT_ARGUMENTS {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PACKED_REGISTRY_TABLE {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PACKED_REGISTRY_TABLE {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PACKED_REGISTRY_ENTRY {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index b87c4e6cb857..7ad1981e471c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -42,6 +42,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -320,6 +321,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -517,6 +650,22 @@ pub struct LibosMemoryRegionInitArgument {
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
 pub struct msgqTxHeader {
     pub version: u32_,
     pub size: u32_,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index e6b18ecb7a55..b1b8c4536d2f 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -159,7 +159,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement `Write`, but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {
-- 
2.50.1

