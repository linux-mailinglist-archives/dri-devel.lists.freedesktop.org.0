Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20405BE6781
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E85B10EB0D;
	Fri, 17 Oct 2025 05:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GwQ1bns7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012062.outbound.protection.outlook.com
 [40.93.195.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C0410EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHUMtsN/YxjR64KA4T46TMP+F4pISfYaCCe+sRuZyQsVLjZIw339I+G/XVqdAVNpQ+RRgtp7ZS5VqpAT/p6nZmNnEb6AjwNnISDpv1VZQDn4BKF84WCQTUIJIuxzgHZdPwBSnsAt1AscbYRwzhFaflSP2ZTUdnMXAftM1fHodURRPhS+tPvwKeOV4QEEzi/D/aVelTtkbbwD9vITnIjL4iO+BHxl3sI1HzBbqgxOEr+O16MnPm+Yc0b7a7MX6/UihFV7a9jKD1oQpKz9Lf2vyrOgdeQPClHJG8axNStF5LCUhATGoDyVgUrIBkjdnsXILpYL01oSyIvUDoJQqngDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYOx2xt/32I9c829aULwGJ8Am44FHBXe/E3KBbuklaE=;
 b=mLPlt8cg6H77KG0/7+/EKdUG33Q6jsBOqahXi6R4m86La9lu5KQLm4sbsChhX83Z1i8BANy0s7EW0VbHf9Jvi982DxvN2Qj7tvZVRL5e40xzQ2frUPZcCzdQdloVARe1yK9xu4nPW7LB6mh+NJVug80J94bDzxYUF6w9B6ttwejR4hZND/txM1dkr/mGSELOWeVM06ROSEnpO3m2OzdciioZnB9VGIzuJ+I6ZEgsuB13aXBni1dyuU7eCdYzBUKbCB1iBjRt/2APuK5ey7TL2oTyfXVt2/hFZwGibJpJVP/VlRwint6fGzZw1bJVyTXTDEvtFtOaTUUT6httU9tF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYOx2xt/32I9c829aULwGJ8Am44FHBXe/E3KBbuklaE=;
 b=GwQ1bns7PJhcfLsWlb+P66nvRqP/0x+grQr6irSHD3PR13gfx7jeR3OHTLniGw03ct8RTbdw38OSL4L+sqAEd/SPdEJYFAT/r3IVUwixyJ1dERM6BZQV8IMPP23pW90B7f49MdoMpPNd1V05VHYieh6YNz+IoaZvCAu6zw/HMnX0gRq2oU0BwF1yUaCEUQhDJsHbojDFigiLqIfk/4DY2bPSl/18Z7Xdrq0gLvCCiXiGTUFi+LLfxN/VvY4q53VplcBVshxjvG4bbyuvWIkGLaygjwn4oHuXbsrZdjxXaO6onIcmfH+w55jiecR5MsEGmPFBQSctiUUbwcfOTufXmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:16 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:16 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 06/11] gpu: nova-core: gsp: Add GSP command queue bindings
 and handling
Date: Fri, 17 Oct 2025 16:47:31 +1100
Message-ID: <20251017054736.2984332-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a8f846-4f03-49ed-3d47-08de0d40c442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sk056J6rjda3arZoACZRLdjFFb2CfuUQDdvix+DgE0UmAAOcF9+Z+gp3FCCC?=
 =?us-ascii?Q?Ta3tj6rCM+osig7lkelGkGa6lLmHMy8lkFLf1KK0udQSvknsBPVJ5UFaIbsB?=
 =?us-ascii?Q?UpGxrkcRjVEfPf+CgBogKqGV9QMj2alsfo0rT12evhRLqkpDnM0scms3CwhS?=
 =?us-ascii?Q?DrSh1MNL+YUKAgx8GrLnQrSRmpBJJaWubcteHwhLX9h4J/gXnoXHUgo1+bpW?=
 =?us-ascii?Q?+jttFm0E8b19sytufjUOQ54D8E+ggL9TDH6Wcrtg/Vtjdj2VcvjRr6AzGKuI?=
 =?us-ascii?Q?0B+VACK+DkL+YF674wXY+0oANRDmu+4XzJHZagKybPCc9612oteIO3k2f1t4?=
 =?us-ascii?Q?q6M/ZS0ToYT2DF7EhvQiQiwPgzKZupT7SDInfw9Li/wqfjXBjRUOGLxEJO7Y?=
 =?us-ascii?Q?nOncIzSKLVGW1ZCvitFMTg4g0wyyQS8DaRPeb2mM7oLrPMgqTBJ+2ewL0aGM?=
 =?us-ascii?Q?i4gICwL2u5ikXoDCw5RsY5Dj/OK6QWvGvxgJ7DaS9yVcC2ha4HkCT2QPljb1?=
 =?us-ascii?Q?EgNEDiHRsjxRFxNPp+3vuHuFnz0trFIimcnqvM/iqT+hp9/UEeziI/HZ9yLK?=
 =?us-ascii?Q?HfiJ+ue3ikBNwMszIHWBm/NAEj9IpEsqW/gcq9kZixu6gSgQ+ueskdr/FuPj?=
 =?us-ascii?Q?JUs8n9rgKmMOP2qqWhcxs0TZaML+7ZvYWw5etK3yxJxL/qWHWfP4/cjRiaGz?=
 =?us-ascii?Q?Uy7yxA/Ghz1paASSU/87/CI0fZIqPdTB81ZUXN2W6GQG+h7bjqtsWItOoNQ+?=
 =?us-ascii?Q?rO/WSTqZuSCDByUs80TajnKSt5Y8fPjbBEDq3Bmr77bK0mRuDLLk8CNdR0LZ?=
 =?us-ascii?Q?ZQWlh2cYV9mfQg9+ChvQxgMGNLo8pgmUOCcCOYQGB/n9p9WN88BAWeTfH+/u?=
 =?us-ascii?Q?WV32ceCaCdAmlr9iv7kd8AyGD4P9RpwMZTK5L5eA46WuoyqGnCaZWCHkQA1c?=
 =?us-ascii?Q?/RDkKaQd07L9jATNUjhIkkqL/1y1wCEcF3QfOzh+fcLM0DA72FEVnuQWSFWG?=
 =?us-ascii?Q?2ljGcyg7gXCnuLvhUJKsB37g/yunSW6FXpoaMsJhmc3yY3r5GR66Au8Sq4HD?=
 =?us-ascii?Q?6GnI5xn4YKWc7BtuDQEXZXP5ZXIcz5yu8HoiqDQmdUNwfcFAM5jydQsQzxx9?=
 =?us-ascii?Q?pXXNuppLiOv/qOyLUz1Ccb3AzippqrSAMOGTJrX2aPokQVs+xK2yFh4CXI4E?=
 =?us-ascii?Q?e4LDRLzxs/BQ9lCd/Ipakc0/LU9PRqHrBPmiHPOUNqjJYzOEcF8rlaNYjHKF?=
 =?us-ascii?Q?47KytI4655CQJXokmwFanoyA5UO0FlVhZRHDvQDYP8OJ3nK+YNX/dxceRhg2?=
 =?us-ascii?Q?70BMo4bDzg0PcOwQE4WjA68TZSmZy0tz8YP8WYRfjXS9f2Esdsi/ernJYQ7A?=
 =?us-ascii?Q?MbHo/I+mQOEz7F4pFjfprMm9daTfeOBzQ8ULGImBK9sGTDqlyg0UajF8umm4?=
 =?us-ascii?Q?ljfHMjQV5AL4pH6NqnOVcZxyFa+rWD92?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wK3GhG/vyiG53lgiqJHRQjMJeNfvN9pprcsKbby2igLvyfDDdjcAlGSvNloE?=
 =?us-ascii?Q?MECC5SIjoZ6FPj0Osq/H74i9auX41j/pgE6u9WkvyxkKiseQkMBs08YZew01?=
 =?us-ascii?Q?slva39nCzmRqRsmpGA1Iz4SpfulB6uMBaswOa278HeVqClVV8bimo4pDIcar?=
 =?us-ascii?Q?nUrK3QESZO7cQSo1sC1tSC75yJItd6wcfK6oYfy2i699+48xT0cLGKnfBWiJ?=
 =?us-ascii?Q?QRqgNNT+vOKfKHNwFFez26yoOE1/5zxXta9cPkY5t6U+xsASp+sNyP9mWM+G?=
 =?us-ascii?Q?Ree4Xv4AXBVtJJ83KwxILNaOuXXrxF3DS2XvLaft5clvuMcEsbMKwII8D/ut?=
 =?us-ascii?Q?625hb4uPayAegeuWlrLQ1IpFc6sPXC5V+V/5tU9joxVe9arwXd6EH5GIBpZb?=
 =?us-ascii?Q?4ClYJrOVf2SJiqdC/8hdQgClVbcGskdzx5refVZx/B3VNvwKqyudL4c2+vAR?=
 =?us-ascii?Q?rshpcCTEiuDMfH+crYRsLlvbauqrQMACrLenFrA3mKQ/UtopFbl5UHh/4awI?=
 =?us-ascii?Q?eolwiwJdxvBmXkz2zTE+tt/HPTi49NCK3UnfL4fj2EEWiT0VnUAZQy/E+TuN?=
 =?us-ascii?Q?jCl5ZtvYlqlEGca7QM9LyNAN5OhFe+0Sq1Jo3zrd/BySSbL3lDzhbKseF/YK?=
 =?us-ascii?Q?Zamgj+njEVJGBcIOz31Yw914xF/W8b9xLR5VBhbCXmcdq0UaEHF7z9KL3eCO?=
 =?us-ascii?Q?nJzKnMKf9MfazeGfz1+eoVpOJAp5NVZSdeRgeN5pAoC0sIL5FDEs+A8UbIXL?=
 =?us-ascii?Q?D/1ByT+Hvk025R/++JPEMCVyEjKGK/czbyil3P0AtCFcRfRFdu1BavpxlQ1y?=
 =?us-ascii?Q?Ynmb7djPR7BZg3eDREORgw2lGZdMijsA+jcwnyfC4uaAJS9h2NZfXb5tipU6?=
 =?us-ascii?Q?UCGCQw4ml3jFQ12y5Ma4nomDtjZndgdtNh1VKJq+Caw2+sNkCOfTwpV35L6h?=
 =?us-ascii?Q?lAur8I7VHS3d+YU3Bqdcr1sNeh0Mb8NZsEUD76Bs+sQXNMRwDxt9Rqs2L0Kq?=
 =?us-ascii?Q?GuCPdhkjK9ZP0Qu7PfxcYvOHSypoJ1xkQbPfinS45tBPqPCbieX5T4Ai2Ser?=
 =?us-ascii?Q?+IQmR8hhhZbvypR4/LfyHR0KC71qDN5Ix8oraGDEvuKmyeYY1STMsggcBvfR?=
 =?us-ascii?Q?5yQA1rU8aRZG+hAb0IOlc+vsIJFA7Wlls4UzuQBUHbeKeCfCsMLripkYQB/7?=
 =?us-ascii?Q?aLJxZ9r4IhfJNPUsMmTt+uu24XGBej9+wAveHws99idTqt20lUCOIndl0817?=
 =?us-ascii?Q?quAqjr9gih/Yt1hlN6qPaUFC1WhV+ILnehLcQr0SrCsPqGiUpcqCXIcIPfd8?=
 =?us-ascii?Q?2I8SbB9IUlKtBzms6lZ2f1Lsdu/9p28bCWTPlRD7r1WqDcjk4+5OPc59s0L1?=
 =?us-ascii?Q?s+JaPo8Lp4wHLJOZhcagYZk/P113mwaCK8eFcFll6Egrv1q0p8XWI9vZ9Jdc?=
 =?us-ascii?Q?nepdwAuWZgQWRyBJmSsvLg2TLsV4ctJrBlw8AEcOhnw0TvEr0GNdzIlZ2Shs?=
 =?us-ascii?Q?Sd/e5Rt91xjsImYs72r1c/dFBrykNq1WuxZx4KFiGbBH1u/U4kjI5ICGYTnI?=
 =?us-ascii?Q?D9RGkrpWyll19sDAm6MoapJmh8VXxSa6Zx37y99q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a8f846-4f03-49ed-3d47-08de0d40c442
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:16.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAMBQ9rLdXVwERqCU8TV3yVMjM67RTzqbi8xSrsa7i3OTAqe4wBwRng451VZ6faTyjwDrFhmIWR/SjrhieyKFA==
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

This commit introduces core infrastructure for handling GSP command and
message queues in the nova-core driver. The command queue system enables
bidirectional communication between the host driver and GSP firmware
through a remote message passing interface.

The interface is based on passing serialised data structures over a ring
buffer with separate transmit and receive queues. Commands are sent by
writing to the CPU transmit queue and waiting for completion via the
receive queue.

To ensure safety mutable or immutable (depending on whether it is a send
or receive operation) references are taken on the command queue when
allocating the message to write/read to. This ensures message memory
remains valid and the command queue can't be mutated whilst an operation
is in progress.

Currently this is only used by the probe() routine and therefore can
only used by a single thread of execution. Locking to enable safe access
from multiple threads will be introduced in a future series when that
becomes necessary.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

---

Changes for v6:
 - Squahsed the bindings in as these are standalone and it eases dealing
   with some unused linter errors.

Changes for v4:
 - Use read_poll_timeout() instead of wait_on()
 - Switch to using `init!` (Thanks Alex for figuring out the
   required workarounds)
 - Pass the enum type into the RPC bindings instead of a raw u32
 - Fixup the TODOs for extracting/allocating the send command regions
 - Split the sending functions into one taking just a command struct and
   another taking a command struct with extra payload

Changes for v3:
 - Reduce the receive payloads to the correct size
 - Use opaque bindings
 - Clean up of the command queue PTE creation
 - Add an enum for the GSP functions
 - Rename GspCommandToGsp and GspMessageFromGsp
 - Rename GspCmdq
 - Add function to notify GSP of updated queue pointers
 - Inline driver area access functions
 - Fixup receive area calculations

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs                  |   7 +
 drivers/gpu/nova-core/gsp/cmdq.rs             | 517 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs               | 275 ++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 409 ++++++++++++++
 drivers/gpu/nova-core/regs.rs                 |   4 +
 drivers/gpu/nova-core/sbuffer.rs              |   2 -
 scripts/Makefile.build                        |   2 +-
 7 files changed, 1213 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 8cb389c97733..31eeaf76526a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -11,6 +11,7 @@
 use kernel::transmute::AsBytes;
 
 use crate::fb::FbLayout;
+use crate::gsp::cmdq::Cmdq;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
@@ -18,6 +19,8 @@
 
 use fw::LibosMemoryRegionInitArgument;
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
@@ -31,6 +34,7 @@ pub(crate) struct Gsp {
     loginit: LogBuffer,
     logintr: LogBuffer,
     logrm: LogBuffer,
+    pub(crate) cmdq: Cmdq,
 }
 
 #[repr(C)]
@@ -112,11 +116,14 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         let logrm = LogBuffer::new(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
 
+        let cmdq = Cmdq::new(dev)?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            cmdq,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
new file mode 100644
index 000000000000..42973c52cb03
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::mem::offset_of;
+use core::sync::atomic::fence;
+use core::sync::atomic::Ordering;
+
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
+use kernel::prelude::*;
+use kernel::sync::aref::ARef;
+use kernel::time::Delta;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use crate::driver::Bar0;
+use crate::gsp::fw::{GspMsgElement, MsgFunction, MsgqRxHeader, MsgqTxHeader};
+use crate::gsp::PteArray;
+use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
+use crate::regs;
+use crate::sbuffer::SBufferIter;
+
+// Base trait for a command which is sent to the GSP. Commands always have a
+// function associated with them but may or may not have a payload.
+pub(crate) trait CommandToGspBase: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
+
+// Trait for a command which does not require a payload to be sent after the
+// command.
+pub(crate) trait CommandToGsp: CommandToGspBase {}
+
+// Trait for a command which must have a payload attached to the end of the
+// command struct.
+pub(crate) trait CommandToGspWithPayload: CommandToGspBase {}
+
+// Trait for receiving a message from the GSP.
+pub(crate) trait MessageFromGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
+
+/// Number of GSP pages making the Msgq.
+pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
+
+#[repr(C, align(0x1000))]
+#[derive(Debug)]
+struct MsgqData {
+    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
+}
+
+// Annoyingly there is no real equivalent of #define so we're forced to use a
+// literal to specify the alignment above. So check that against the actual GSP
+// page size here.
+static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
+
+// There is no struct defined for this in the open-gpu-kernel-source headers.
+// Instead it is defined by code in GspMsgQueuesInit().
+#[repr(C)]
+struct Msgq {
+    tx: MsgqTxHeader,
+    rx: MsgqRxHeader,
+    msgq: MsgqData,
+}
+
+#[repr(C)]
+struct GspMem {
+    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    cpuq: Msgq,
+    gspq: Msgq,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspMem {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspMem {}
+
+// `GspMem` struct that is shared with the GSP. This contains the shared memory
+// region that both the host CPU and GSP read and write commands and messages
+// to.
+struct DmaGspMem(CoherentAllocation<GspMem>);
+
+impl DmaGspMem {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
+        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
+
+        let gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+
+        Ok(Self(gsp_mem))
+    }
+
+    /// Allocates the various regions for the command and reduces the payload size
+    /// to match what is needed for the command.
+    ///
+    /// Returns a tuple with a reference to the GspMsgElement header, the command
+    /// struct and two slices to contain the payload if required. The second
+    /// payload slice may be zero length if the ring buffer didn't need to wrap
+    /// to contain the command.
+    ///
+    /// # Errors
+    ///
+    /// Returns `Err(EAGAIN)` if the driver area is too small to hold the
+    /// requested command.
+    fn allocate_command_regions<'a, M: CommandToGspBase>(
+        &'a mut self,
+        payload_size: usize,
+    ) -> Result<(&'a mut GspMsgElement, &'a mut M, &'a mut [u8], &'a mut [u8])> {
+        // Allocate a region from the shared memory area to write our command
+        // and payload to.
+        let driver_area = self.driver_write_area();
+        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
+        let driver_area_size = (driver_area.0.len() + driver_area.1.len()) << GSP_PAGE_SHIFT;
+
+        // If the GSP is still processing previous messages the shared region
+        // may be full in which case we will have to retry once the GSP has
+        // processed the existing commands.
+        if msg_size > driver_area_size {
+            return Err(EAGAIN);
+        }
+
+        // Split the memory region into an area for the command header and
+        // struct + payload.
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            // TODO: This won't work on Rust <= 1.78
+            .as_flattened_mut()
+            .split_at_mut(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+
+        // Split the remaining region into command struct and possible payload.
+        let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
+        let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
+
+        #[allow(clippy::incompatible_msrv)]
+        // TODO: This won't work on Rust <= 1.78
+        let payload_2 = driver_area.1.as_flattened_mut();
+
+        // Create the payload area
+        let (payload_1, payload_2) = if payload_1.len() > payload_size {
+            // Payload fits entirely in payload_1
+            (&mut payload_1[..payload_size], &mut payload_2[0..0])
+        } else {
+            // Need all of payload_1 and some of payload_2
+            let payload_2_len = payload_size - payload_1.len();
+            (payload_1, &mut payload_2[..payload_2_len])
+        };
+
+        Ok((msg_header, cmd, payload_1, payload_2))
+    }
+
+    // Returns a region of shared memory for the driver to write to. As this
+    // region is a circular buffer it may be discontiguous in memory. In that
+    // case the second slice will have a non-zero length.
+    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
+        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
+
+        if rx <= tx {
+            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
+            // to `rx`, minus one unit, belongs to the driver.
+            if rx == 0 {
+                let last = after_tx.len() - 1;
+                (&mut after_tx[..last], &mut before_tx[0..0])
+            } else {
+                (after_tx, &mut before_tx[..rx])
+            }
+        } else {
+            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
+            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+        }
+    }
+
+    // Returns a region of shared memory for the driver to read from. As this
+    // region is a circular buffer it may be discontiguous in memory. In that
+    // case the second slice will have a non-zero length.
+    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
+        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
+
+        if tx == rx {
+            (&after_rx[0..0], &after_rx[0..0])
+        } else if tx > rx {
+            (&after_rx[..tx], &before_rx[0..0])
+        } else {
+            (after_rx, &before_rx[..tx])
+        }
+    }
+
+    // Return the index the GSP will write the next message to.
+    fn gsp_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Return the index the GSP will read the next command from.
+    fn gsp_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Return the index the CPU should start reading the next message from.
+    fn cpu_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Inform the GSP that it can send `elem_count` new pages into the message queue.
+    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
+        // let gsp_mem = &self.0;
+        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered
+        fence(Ordering::SeqCst);
+
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
+    }
+
+    // Return the index the CPU should start writing the next command.
+    fn cpu_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    // Inform the GSP that it can process `elem_count` new pages from the command queue.
+    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
+
+        // Ensure all command data is visible before triggering the GSP read
+        fence(Ordering::SeqCst);
+    }
+}
+
+pub(crate) struct Cmdq {
+    dev: ARef<device::Device>,
+    seq: u32,
+    gsp_mem: DmaGspMem,
+    pub _nr_ptes: u32,
+}
+
+impl Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
+        let gsp_mem = DmaGspMem::new(dev)?;
+        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
+
+        Ok(Cmdq {
+            dev: dev.into(),
+            seq: 0,
+            gsp_mem,
+            _nr_ptes: nr_ptes as u32,
+        })
+    }
+
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    // Notify GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        regs::NV_PGSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
+    where
+        M: CommandToGsp,
+        // This allows all error types, including `Infallible`, to be used with `init`. Without
+        // this we cannot use regular stack objects as `init` since their `Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
+        self.send_gsp_command_base_with_payload(bar, 0, init, |_| Ok(()))
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_gsp_command_with_payload<M, E>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl Init<M, E>,
+        init_payload: impl FnOnce(SBufferIter<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result
+    where
+        M: CommandToGspWithPayload,
+        // This allows all error types, including `Infallible`, to be used with `init`. Without
+        // this we cannot use regular stack objects as `init` since their `Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
+        self.send_gsp_command_base_with_payload(bar, payload_size, init, init_payload)
+    }
+
+    pub(crate) fn send_gsp_command_base_with_payload<M, E>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl Init<M, E>,
+        init_payload: impl FnOnce(SBufferIter<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result
+    where
+        M: CommandToGspBase,
+        // This allows all error types, including `Infallible`, to be used with `init`. Without
+        // this we cannot use regular stack objects as `init` since their `Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
+        #[repr(C)]
+        struct FullCommand<M> {
+            hdr: GspMsgElement,
+            cmd: M,
+        }
+
+        let (msg_header, cmd, payload_1, payload_2) =
+            self.gsp_mem.allocate_command_regions::<M>(payload_size)?;
+
+        let seq = self.seq;
+        let initializer = try_init!(FullCommand {
+            hdr <- GspMsgElement::init(seq, size_of::<M>() + payload_size, M::FUNCTION),
+            cmd <- init,
+        });
+
+        // Fill the header and command in-place.
+        // SAFETY:
+        //  - allocate_command_regions guarantees msg_header points to enough
+        //    space in the command queue to contain FullCommand
+        //  - __init ensures the command header and struct a fully initialized
+        unsafe {
+            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().cast())?;
+        }
+
+        // Fill the payload
+        let sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut payload_2[..]]);
+        init_payload(sbuffer)?;
+
+        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
+            payload_1,
+            payload_2,
+        ])));
+
+        dev_info!(
+            &self.dev,
+            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            self.seq,
+            msg_header.function_number(),
+            msg_header.function()?,
+            msg_header.length(),
+        );
+
+        let elem_count = msg_header.element_count();
+        self.seq += 1;
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        Cmdq::notify_gsp(bar);
+
+        Ok(())
+    }
+
+    #[expect(unused)]
+    pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
+        &mut self,
+        timeout: Delta,
+        init: impl FnOnce(&M, SBufferIter<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
+    ) -> Result<R> {
+        // Wait for a message to arrive from the GSP.
+        let driver_area = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area: &(&[[u8; 4096]], &[[u8; 4096]])| !driver_area.0.is_empty(),
+            Delta::from_millis(10),
+            timeout,
+        )?;
+
+        // Get references to the entire memory region available for the driver
+        // to read.
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            // TODO: This won't work on Rust <= 1.78
+            .as_flattened()
+            .split_at(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes(msg_header_slice).ok_or(EIO)?;
+        if msg_header.length() < size_of::<M>() as u32 {
+            return Err(EIO);
+        }
+
+        // Get message function.
+        let function: MsgFunction = msg_header.function().map_err(|_| {
+            dev_info!(
+                self.dev,
+                "GSP RPC: receive: seq# {}, bad function=0x{:x}, length=0x{:x}\n",
+                msg_header.sequence(),
+                msg_header.function_number(),
+                msg_header.length(),
+            );
+            EIO
+        })?;
+
+        // Log RPC receive with message type decoding.
+        dev_info!(
+            self.dev,
+            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            msg_header.sequence(),
+            msg_header.function_number(),
+            function,
+            msg_header.length(),
+        );
+
+        let (cmd_slice, payload_1) = slice_1.split_at(size_of::<M>());
+        #[allow(clippy::incompatible_msrv)]
+        // TODO: This won't work on Rust <= 1.78
+        let payload_2 = driver_area.1.as_flattened();
+
+        // `driver_read_area` returns the entire region available to be read,
+        // not just the area containing the message. So we need to cut the
+        // payload slice(s) down to the actual length of the payload.
+        let (cmd_payload_1, cmd_payload_2) =
+            if payload_1.len() > msg_header.length() as usize - size_of::<M>() {
+                (
+                    payload_1
+                        .split_at(msg_header.length() as usize - size_of::<M>())
+                        .0,
+                    &payload_2[0..0],
+                )
+            } else {
+                (
+                    payload_1,
+                    payload_2
+                        .split_at(msg_header.length() as usize - size_of::<M>() - payload_1.len())
+                        .0,
+                )
+            };
+
+        if Cmdq::calculate_checksum(SBufferIter::new_reader([
+            msg_header.as_bytes(),
+            cmd_slice,
+            cmd_payload_1,
+            cmd_payload_2,
+        ])) != 0
+        {
+            dev_err!(
+                self.dev,
+                "GSP RPC: receive: Call {} - bad checksum",
+                msg_header.sequence()
+            );
+            return Err(EIO);
+        }
+
+        // Extract the command struct and payload if present.
+        let result = if function == M::FUNCTION {
+            let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
+            let sbuffer = SBufferIter::new_reader([cmd_payload_1, cmd_payload_2]);
+            init(cmd, sbuffer)
+        } else {
+            Err(ERANGE)
+        };
+
+        self.gsp_mem
+            .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
+        result
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 42ba4739f890..c74088bdf7c0 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -5,6 +5,7 @@
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
 
+use core::fmt;
 use core::ops::Range;
 
 use kernel::dma::CoherentAllocation;
@@ -16,6 +17,7 @@
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp::FbLayout;
+use crate::gsp::GSP_PAGE_SIZE;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -158,6 +160,120 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Result<Se
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
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
@@ -208,3 +324,162 @@ fn id8(name: &str) -> u64 {
         }))
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
+// SAFETY: We can't derive the Zeroable trait for this binding because the
+// procedural macro doesn't support the syntax used by bindgen to create the
+// __IncompleteArrayField types. So instead we implement it here, which is safe
+// because these are explicitly padded structures only containing types for
+// which any bit pattern, including all zeros, is valid.
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
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspMsgElement {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspMsgElement {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index f7b38978c5f8..17fb2392ec3c 100644
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
@@ -11,6 +42,7 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -19,6 +51,345 @@
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
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub sharedMemPhysAddr: u64_,
+    pub pageTableEntryCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub bInPMTransition: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub gpuInstance: u32_,
+    pub bDmemStack: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone, Zeroable)]
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
 #[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
@@ -145,3 +516,41 @@ pub struct LibosMemoryRegionInitArgument {
     pub loc: u8_,
     pub __bindgen_padding_0: [u8; 6usize],
 }
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
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
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct msgqRxHeader {
+    pub readPtr: u32_,
+}
+#[repr(C)]
+#[repr(align(8))]
+#[derive(Zeroable)]
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
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..0585699ae951 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -71,6 +71,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+    31:0    address as u32;
+});
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 39c973ee3e10..acde73132ba0 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -49,7 +49,6 @@ impl<'a, I> SBufferIter<I>
     /// let sum: u8 = sbuffer.sum();
     /// assert_eq!(sum, 45);
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a [u8]>,
@@ -71,7 +70,6 @@ pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
     ///
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a mut [u8]>,
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..4ac6304332b6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -317,7 +317,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg,slice_flatten
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.50.1

