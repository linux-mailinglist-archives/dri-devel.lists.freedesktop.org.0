Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9EC29ACF
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E62110E149;
	Sun,  2 Nov 2025 23:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GcIVQ5gE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010043.outbound.protection.outlook.com
 [52.101.193.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A86A10E1E5;
 Sun,  2 Nov 2025 23:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qibNJrr8Cjr733v4AKDwoA8jc9MCS1I6ehpDWhLpLd99nPZqIsHATc5RwNPCyP2a43HRHGUk2cqb8tQCt8VWt3ydvV2C81AhgaRM5ky4bSu/g37bBdBKywErM4iqnuAhYshUUC6ipXGrhOrmcNJsARYzn15l+PqsUp3Y2IwbQtbQ8e7VpTmKQyFuAKxEx19Jiyu3lcI/CE4HEOSKaIPBUB+j7RecEIJCZ+kaLcak/EltqMfxh/seF1RaCRT6KOudDrZ/zntwBEGIvka7JlrvJW0olUbe+dAd6TmIXd8zBPodXZ7YvzBfvD5TLaa4xdxemKlLsm0HNzgMovp1zcXnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQmHCPL1hKC4h3UuwaSWKU+Q/PL8fQLfsaRoTAkv5Hc=;
 b=b8+Hm+TUXEH7C22An82K6dA4aGai4kRcU6e3xlR4dnNwz6OjicJaImw9bA6/Chro+4h6Xc+7rlLlu08MnyjTnVMDm/AYH7SYW5PKA0B6KDxIAVZURh4Njt1ICMW/Iyas84D1iaaTke6WlgqJ291IFsDGn2roEjzqkJae/vlKqBH9bPUj24N4zkRV6LtWKo/3SVAFmqwnXakVO/Z3km+kkVCsc2On818rh5axqJ9KxnXLuG80P9394I29xZMvW4jLvX9JLXDdjwxxkvQ+pr3uXE/UkwVICBDR70HM5hYD+N2Ib0snMIAUCh70C/czxpJEFPA8tZaN7MMNiGio/yqR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQmHCPL1hKC4h3UuwaSWKU+Q/PL8fQLfsaRoTAkv5Hc=;
 b=GcIVQ5gEnP7GK8/NAYDlDFU1nxq/EnlBWDA5QzpijzD8eic0SiTYDTzYEwGkD5Y1xnJbqHckGBzzFIJpHpMmpbGwra8pslMyPKN3b/ckBqlzQdGIwYGUTq5bRpdmBHx7zpDn9qxOCo8maFy4zoAFCHruoTCBut1iKOvDXXozxYLCgt4Udlz6H1usUgBYPx4yO3bhH1iwFkIOaG73KgtzrP905UNm3Ogv3jVC5FvyL8V2hWAzaNhON//BGSHUMRoZM+uzu/ooDfS81zvp3IctfWNZE8CnljdqT6J5TIt/qLp9ZYxg3hTrErvmiCexjcaXu9ld4MuOkpZMZCeIhXL/Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:39 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 07/12] nova-core: Implement the GSP sequencer
Date: Sun,  2 Nov 2025 18:59:15 -0500
Message-Id: <20251102235920.3784592-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:208:23e::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c457df0-ed36-4b2c-e035-08de1a6be228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KxavL5O+OJB+wbaA1GXt4EXB3D7u7drn6LAEzNDkgA8zTiLOhEjFF2nwHTDu?=
 =?us-ascii?Q?1tZ1WRLiIE6hOtB83jOE7ZJiph/y7GAlxmxuhIpUyKOTX0LlaTqstbKZXqCp?=
 =?us-ascii?Q?WIcw7z+aUCqno7s4YOpWyfXovP67jRvw26kZQM1dIuaKEQ0wpSBTvhWJNDHM?=
 =?us-ascii?Q?Bkf/Yfz6n8XVDvmwc613HFeNg3SNkJzsD0r8Na2Bvsc9lpxDQ6P8jC0LVSeY?=
 =?us-ascii?Q?Lro2qI7/AoqullgCSQxcB9TkCyp8J+kuU4KtH5LBMXqDJVrEQvcAE8K41Lgv?=
 =?us-ascii?Q?tyjg7Dtp6cqom+uZ3OLR/VeBX/ouwouApkeI/hNvNcQh1lqp/EjfuXwSXGx7?=
 =?us-ascii?Q?1vi2BJcNK9Pkl0134RC0j2Gkye+Rrk8HAbQKYQRQzGNSglhQ+nn4E2kTuL0u?=
 =?us-ascii?Q?kxg1AcfJES4quC0yz4QvlQKepPg60dW3MmJLRpEn19WOveHEn8Ldg0VIEMY/?=
 =?us-ascii?Q?gcYLcvGa9lcuZ0la32aMaOmbemRMfrRn5A11IQRxoxcM/1WmLIaVY4o6pzCP?=
 =?us-ascii?Q?ofc9smRQLPTBijdC/OdAsmfbVUfauO7hxN3fTmz4wR1ojIzSE3/xB9M73vVD?=
 =?us-ascii?Q?NEO4qVKCq6XbRBqgZN3CHtWTwZ6Re9JyxiL2evuHVUcrkaBIMXpi4HVCLRRR?=
 =?us-ascii?Q?1ATqw4QTSDjPqybGRiUMQyjK5KFS08rheq0pjtM07RP4he9GZeZ4KTz0NvDC?=
 =?us-ascii?Q?xmIOo5NIluJUb6IJHTMNm1hvftbUvseH6YmEJYZ/cWsnJ/A8ATLblJqZSVXk?=
 =?us-ascii?Q?KGrZr49YYc6CZ+C4OOi4iOnRQ6act8BKrpVLg/f99fQPT7eVRyH+UFFZUKaS?=
 =?us-ascii?Q?d0d9DLkrmPTZqAjoUZ0fKIalCsU5rCHOZl6dbI42az2EHBODAWY/6e7cv8sB?=
 =?us-ascii?Q?pOkQqwAX3LP64497vLjFNCxYd03I/8kPjzQ+A9LTbYr2slAeyKV095QLx3ZV?=
 =?us-ascii?Q?1IrVJyFYr9QQgotTyvLneyVp9sNlsmVdP1GGHZ5xQ4jzfgKqh+OkEetH7zRk?=
 =?us-ascii?Q?NYEiKiuvG8KyOXMxix67MK1faGE5HvdHVYiMKBL0MZIG+xWIefUaXpRwIFOl?=
 =?us-ascii?Q?XvCcyknKLMHGiDxFGSIn1jLQgURgtYIkx67TDylTjNsgAofMBWnE7QroJHbY?=
 =?us-ascii?Q?e6dNkHyui36EUI49w9EIqiXkeZbkWiTpPxlzU5Csge5GDsRqINxFxLQK/37l?=
 =?us-ascii?Q?zPaqzdKAV+dRoem5hVNAnox0h2vx6oqEXjCkMu85A9RjeozRo7MIocZ729iB?=
 =?us-ascii?Q?4uJpUwh6r7iQQLnfDeou9M30oh8GD1+/9FyMEU4Ii4nqMlFZqVHt30kSpQtt?=
 =?us-ascii?Q?DVSeGEtMkEgCJxqSa1UVR17VC5tsZjOyGiucIGVNnW+PgYAfXr+Lrp+J6r6/?=
 =?us-ascii?Q?iM+0EAia2BZvoakZT/q9zSbYgYBoV9TgjWtw4uasrghH1+dxt+bhpU9/o5pt?=
 =?us-ascii?Q?Yh6/XK6Rbo48Nr5IpG1c/AUbXeyqRcpZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NX3So8jktYrr5ATm1M/jPO5J8LqyFp3sgbDUGNNw51DVpVIsoo2G00f3AY5U?=
 =?us-ascii?Q?mQaZNVSaqsD5CecZgE+ZQ7jhELuXfrllci5YceGyHGdEiEJDKQU5jNNmgW2+?=
 =?us-ascii?Q?Vws30diAD1F3trItPWqiBrE4QzhbVTMPNbx1xB+iYOlolXTClJxcTr00kpus?=
 =?us-ascii?Q?ZXRK5khegbU/3MyL9XNxN52MGaDSYem7ToCVGnKH7pJrqmiapnyI5KwPvr7C?=
 =?us-ascii?Q?QYTTmXSN5csiVgACzGloj+XDVc5Omcz2ewFTbtYz/1JdkxiXjcCQNiG45bhC?=
 =?us-ascii?Q?U28URVGucmUdaY/vy5z9u5gbLwuArb+OWfc/zUt1Qvm08wZ2tbsZpHi6+KhJ?=
 =?us-ascii?Q?lTjtILHYGUVC5CytU6ygIFoCLCGcjptXe0RNk490TCfJKOndJTGObVmK1Mop?=
 =?us-ascii?Q?SvBtjMV1c4TCYJSyFpvA88Z7e49o70lqHPFRF1qWzibDiLYm58zMWswJ5tat?=
 =?us-ascii?Q?KsFwcB4gz5GFGU/8yFSVPuf4s5FCYZPANjlYK0aGAk/JBPY/VyjV30fpoZio?=
 =?us-ascii?Q?9H2f1xinVyNlF5DJ0HxDPteLYMtyDrUpBPWkcTo9WXQfBSwq5jrd9P1ipSzJ?=
 =?us-ascii?Q?1wIvUkpg6lyWc5hNDX45m0H+hX+p9KkfK5nWflyTAP3vqqP061FzqaNDYSfr?=
 =?us-ascii?Q?RgOjVl+Fw8B6AcICMS+8324ra75EdTX1+bmRAVVFrmvU8k/RepOXSOWqA15u?=
 =?us-ascii?Q?67vqfYZqfwVQE2p2s45NWH0ck3INw2KgYXqAwnS8HJLsoJW94/vv6Klc62AH?=
 =?us-ascii?Q?SIWiayDR7lFDK1dcaPMmKLt0bhPEvfxLgjZAO0AS+CQPG8RBVX4lp2xck5M3?=
 =?us-ascii?Q?WnS7fdWyh7pyqLq8Kw0fhvdogfn3BE57xu65MNrA1gCEzkp6fd6eGgqgJVU+?=
 =?us-ascii?Q?xDUB2zBzzIE2300LB1E5FSHOPxAruApa/8A4AttJRfG67KhIv2kl0fxV+3cj?=
 =?us-ascii?Q?5pc/R1OvT+J+A2DXMRFYF08jptYDNIoy4R7GIWZBViLtyBJvcw+5zYbYTYBT?=
 =?us-ascii?Q?2ohm1VmJZr7wkIG5+nuvsrRx8o3UWOqOgImbEMjfatoNKYBDg+xiTOzqsmv+?=
 =?us-ascii?Q?vI4ABu/TdS7mD+YcX2sDeBZww47COg4/Ds6rMFa2GWf7DnOyJXbVlpYmGqkN?=
 =?us-ascii?Q?SpKNhfYmsxbilWoLIT4VLT/1StvA7I5Ov8fsW5IvijCLT+rrzHIPoE3zb3n6?=
 =?us-ascii?Q?kdSWEb0KlcFH51jNUtQ+CFVS1xV7149I1/JMX9wnZ6dHYZ20TNnrbqeUCeVZ?=
 =?us-ascii?Q?iWqoG38G7f0d57T6JVsqhzo1YfphVZAo0HgU/SyBFnRw2UYw3PYaN0B9ebT/?=
 =?us-ascii?Q?Fpy5pBRs2szRzCIhZBAUV6VIONujbpFf40NDVrtGZWbLmJJXRoG60dWcFmPr?=
 =?us-ascii?Q?ueI7Yi11SOIhRIXuqiezydoQhLau2Aiddhyn9sBNhEKI2SBSHLh9ouWLRmaP?=
 =?us-ascii?Q?vbnMlYFbvSNB9P0wFYmr4qrR1yvlDXy8iuV1gv6LQRjr/0qICB7t5znvzWXs?=
 =?us-ascii?Q?srTcn+jv67D58Zou91Ysv/d5Zl6zbp3oXOtF0dfsi2j8FtSjuqY2eXPK+gOk?=
 =?us-ascii?Q?xpiaTu+nAMaGqtrQU+mB2I8zF+5ijKX8os2nOJsI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c457df0-ed36-4b2c-e035-08de1a6be228
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:39.2436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCNRu6KgFLZZhGMBPV/ENo0cx1tgLLY/uR+NmoccNm7cV252hDWHIKEywrcleq5dWozHT/V1le8pEtArQUyikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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

Implement the GSP sequencer which culminates in INIT_DONE message being
received from the GSP indicating that the GSP has successfully booted.

This is just initial sequencer support, the actual commands will be
added in the next patches.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs           |   1 +
 drivers/gpu/nova-core/gsp/boot.rs      |  19 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs      |   1 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 208 +++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs       |   1 -
 5 files changed, 227 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 36175eafaf2e..9d62aea3c782 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -16,6 +16,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod sequencer;
 
 use fw::GspArgumentsCached;
 use fw::LibosMemoryRegionInitArgument;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 649c758eda70..761020a11153 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -19,7 +19,13 @@
 };
 use crate::gpu::Chipset;
 use crate::gsp::commands::{build_registry, set_system_info};
-use crate::gsp::GspFwWprMeta;
+use crate::gsp::{
+    sequencer::{
+        GspSequencer,
+        GspSequencerParams, //
+    },
+    GspFwWprMeta, //
+};
 use crate::regs;
 use crate::vbios::Vbios;
 
@@ -204,6 +210,17 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
+        // Create and run the GSP sequencer.
+        let seq_params = GspSequencerParams {
+            gsp_fw: &gsp_fw,
+            libos_dma_handle: libos_handle,
+            gsp_falcon,
+            sec2_falcon,
+            dev: pdev.as_ref(),
+            bar,
+        };
+        GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0fb8ff26ba2f..0185629a3b5c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -418,7 +418,6 @@ struct FullCommand<M> {
         Ok(())
     }
 
-    #[expect(unused)]
     pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
         &mut self,
         timeout: Delta,
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
new file mode 100644
index 000000000000..48c40140876b
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
+
+use core::mem::size_of;
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::device;
+use kernel::prelude::*;
+use kernel::time::Delta;
+use kernel::transmute::FromBytes;
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    gsp::Gsp,
+    sec2::Sec2,
+    Falcon, //
+};
+use crate::firmware::gsp::GspFirmware;
+use crate::gsp::cmdq::{
+    Cmdq,
+    MessageFromGsp, //
+};
+use crate::gsp::fw;
+
+use kernel::{
+    dev_dbg,
+    dev_err, //
+};
+
+impl MessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
+    const FUNCTION: fw::MsgFunction = fw::MsgFunction::GspRunCpuSequencer;
+}
+
+const CMD_SIZE: usize = size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
+
+struct GspSequencerInfo<'a> {
+    info: &'a fw::rpc_run_cpu_sequencer_v17_00,
+    cmd_data: KVec<u8>,
+}
+
+/// GSP Sequencer Command types with payload data.
+/// Commands have an opcode and a opcode-dependent struct.
+#[allow(dead_code)]
+pub(crate) enum GspSeqCmd {}
+
+impl GspSeqCmd {
+    /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD.
+    pub(crate) fn from_fw_cmd(_cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
+        Err(EINVAL)
+    }
+
+    pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Self> {
+        let fw_cmd = fw::GSP_SEQUENCER_BUFFER_CMD::from_bytes(data).ok_or(EINVAL)?;
+        let cmd = Self::from_fw_cmd(fw_cmd)?;
+
+        if data.len() < cmd.size_bytes() {
+            dev_err!(dev, "data is not enough for command.\n");
+            return Err(EINVAL);
+        }
+
+        Ok(cmd)
+    }
+
+    /// Get the size of this command in bytes, the command consists of
+    /// a 4-byte opcode, and a variable-sized payload.
+    pub(crate) fn size_bytes(&self) -> usize {
+        0
+    }
+}
+
+#[expect(dead_code)]
+pub(crate) struct GspSequencer<'a> {
+    seq_info: GspSequencerInfo<'a>,
+    bar: &'a Bar0,
+    sec2_falcon: &'a Falcon<Sec2>,
+    gsp_falcon: &'a Falcon<Gsp>,
+    libos_dma_handle: u64,
+    gsp_fw: &'a GspFirmware,
+    dev: &'a device::Device<device::Bound>,
+}
+
+pub(crate) trait GspSeqCmdRunner {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
+}
+
+impl GspSeqCmdRunner for GspSeqCmd {
+    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+        Ok(())
+    }
+}
+
+pub(crate) struct GspSeqIter<'a> {
+    cmd_data: &'a [u8],
+    current_offset: usize, // Tracking the current position.
+    total_cmds: u32,
+    cmds_processed: u32,
+    dev: &'a device::Device<device::Bound>,
+}
+
+impl<'a> Iterator for GspSeqIter<'a> {
+    type Item = Result<GspSeqCmd>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Stop if we've processed all commands or reached the end of data.
+        if self.cmds_processed >= self.total_cmds || self.current_offset >= self.cmd_data.len() {
+            return None;
+        }
+
+        // Check if we have enough data for opcode.
+        let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
+        if self.current_offset + opcode_size > self.cmd_data.len() {
+            return Some(Err(EINVAL));
+        }
+
+        let offset = self.current_offset;
+
+        // Handle command creation based on available data,
+        // zero-pad if necessary (since last command may not be full size).
+        let mut buffer = [0u8; CMD_SIZE];
+        let copy_len = if offset + CMD_SIZE <= self.cmd_data.len() {
+            CMD_SIZE
+        } else {
+            self.cmd_data.len() - offset
+        };
+        buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset + copy_len]);
+        let cmd_result = GspSeqCmd::new(&buffer, self.dev);
+
+        cmd_result.map_or_else(
+            |_err| {
+                dev_err!(self.dev, "Error parsing command at offset {}", offset);
+                None
+            },
+            |cmd| {
+                self.current_offset += cmd.size_bytes();
+                self.cmds_processed += 1;
+                Some(Ok(cmd))
+            },
+        )
+    }
+}
+
+impl<'a, 'b> IntoIterator for &'b GspSequencer<'a> {
+    type Item = Result<GspSeqCmd>;
+    type IntoIter = GspSeqIter<'b>;
+
+    fn into_iter(self) -> Self::IntoIter {
+        let cmd_data = &self.seq_info.cmd_data[..];
+
+        GspSeqIter {
+            cmd_data,
+            current_offset: 0,
+            total_cmds: self.seq_info.info.cmdIndex,
+            cmds_processed: 0,
+            dev: self.dev,
+        }
+    }
+}
+
+/// Parameters for running the GSP sequencer.
+pub(crate) struct GspSequencerParams<'a> {
+    pub(crate) gsp_fw: &'a GspFirmware,
+    pub(crate) libos_dma_handle: u64,
+    pub(crate) gsp_falcon: &'a Falcon<Gsp>,
+    pub(crate) sec2_falcon: &'a Falcon<Sec2>,
+    pub(crate) dev: &'a device::Device<device::Bound>,
+    pub(crate) bar: &'a Bar0,
+}
+
+impl<'a> GspSequencer<'a> {
+    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>, timeout: Delta) -> Result {
+        cmdq.receive_msg_from_gsp(timeout, |info, mut sbuf| {
+            let cmd_data = sbuf.flush_into_kvec(GFP_KERNEL)?;
+            let seq_info = GspSequencerInfo { info, cmd_data };
+
+            let sequencer = GspSequencer {
+                seq_info,
+                bar: params.bar,
+                sec2_falcon: params.sec2_falcon,
+                gsp_falcon: params.gsp_falcon,
+                libos_dma_handle: params.libos_dma_handle,
+                gsp_fw: params.gsp_fw,
+                dev: params.dev,
+            };
+
+            dev_dbg!(params.dev, "Running CPU Sequencer commands\n");
+
+            for cmd_result in &sequencer {
+                match cmd_result {
+                    Ok(cmd) => cmd.run(&sequencer)?,
+                    Err(e) => {
+                        dev_err!(
+                            params.dev,
+                            "Error running command at index {}\n",
+                            sequencer.seq_info.info.cmdIndex
+                        );
+                        return Err(e);
+                    }
+                }
+            }
+
+            dev_dbg!(
+                params.dev,
+                "CPU Sequencer commands completed successfully\n"
+            );
+            Ok(())
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 4d7cbc4bd060..36890c8610c2 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -162,7 +162,6 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
     /// Read all the remaining data into a [`KVec`].
     ///
     /// `self` will be empty after this operation.
-    #[expect(unused)]
     pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
         let mut buf = KVec::<u8>::new();
 
-- 
2.34.1

