Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FFBC30D4
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0110C10E729;
	Wed,  8 Oct 2025 00:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LE7ulsh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834B410E1D5;
 Wed,  8 Oct 2025 00:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX1y9JvcW4EiCyR8YzlhL+zYVeUpR2sEmaZJPETjV+edr+j6lTxyAziBdqdfvz12t3mP9QjO/Dyo3l7+8q5pzIDUU4eTpUJhZ5/owsdkEjJ2E0CTughw0Xqa9ywCYsueVXQDKpuBnwLvSN2D8Scj9OQ1/QJ5a0LtNqcYT1XuVjza3NS96Oi0BK1v0ERasTsyvykx5axtwgG8v5k2VzElTx6WO3fN/kc3tOWSWG8jRPoRxtf/ZZut9UNcFP3sDwLu8s6p7EbACyJjxAVOiwyzwXiWrtG041kE6X5PIid0a+u4jVSpFa2KrJgDD75OmXJtI9nBa8Ez4wHAz+GwAKuwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xofCYcLP4TjhR+s/JRcUJXvTCoxdHkhTOy1x/jKO7OA=;
 b=kPFkzw7ixk/lJUWiD1Up0OzDtJM+epHSIQLjr1V798bEkdan2HqxWjqie6FiOxp4ebKenxj2x2uYB4Rltd2claPb6iWzHmgV625xmwXuE8HDQR8Tu4t8qF2JE9b4cJ+nYdvwNZ9aT30DOy55xl8x9ctVC/pi1gFuHuLOB7ewMriN6W7EhXibweDXHn9YgbSmIlSHVwLlcPjuv/JqYPyNUl4EXRx1heYdoHs+TJnd1xWdRRK5m8bGLwqx0/51Fm112x0kpnXEKiLYtYNp/CJXp3sn1b640ZdUAjb+IJxTxmtQwTQTaven6WiiHuMDMc7GP9VRs8RPAw11MgNJS+3bQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xofCYcLP4TjhR+s/JRcUJXvTCoxdHkhTOy1x/jKO7OA=;
 b=LE7ulsh+NNuCV6WymI5BrJ2+5kJJlLqVeb2DoV1bMWv0sSmNBlWWHRKv514OAtgw+dezb4OGHS64E1zhRXR0eMpPYAj86W5bCGZISYUY1ZzIZsPMd0w16CGl9lM5nMiWyT0Na32iscipgI/7xZYq605UG7KePFVdMPetrszUnIOUN2RgDEa31n6vVzCteuxXXV5Sh7LigdvwXLIBL1V6B5BNDGifQtH7GVlppvENGcrOTzw4rFaHV7wuG6XMm8H1pv/hV+ZGYI12XXXUTmR9/8roIBlsbYrH4OB4128oAadr01F8/m7buFQEXqMCTk+ViCB+7vxqrFIAJvFONMdu3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:32 +0000
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
Subject: [PATCH v4 06/13] gpu: nova-core: gsp: Add GSP command queue handling
Date: Wed,  8 Oct 2025 11:12:45 +1100
Message-ID: <20251008001253.437911-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0062.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 170b6927-c91e-40da-8f8c-08de05ff83d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OJldByYDPhN1Z2Zc5hRbrATLAiit80DlCiI3q3oFZT8TMEak4mfaSwsOkF6K?=
 =?us-ascii?Q?xi5QfCJzZ/RJMpnh4BEnNRFWdenMQ9INJWaICiPPo30o/esobDT+AUDh3Z2D?=
 =?us-ascii?Q?Ac7uQXzHpK3UCKrNFO8my8zy62FPLHgzw6JIOEx8x3mkSIsobQBT9zYN2gwF?=
 =?us-ascii?Q?Txg/fVFcDnGht7JBc+nuugLAqdL60RYE+J+Xe5VSgd0I53lPjO5DVekIb1TD?=
 =?us-ascii?Q?N4/wMRiozuRqEYTR054oCMOsABi5hEiHLwliQgk+63PAi9pAaA5Hh2XIvpVh?=
 =?us-ascii?Q?7IFoVTGhmhjT+NkLKNKtX6OpqOQaHTFSAHKSzKJfRsQ9O5V5N8Tl+KC517CM?=
 =?us-ascii?Q?cd2niamogG+yLLxwaCHFTwdX7MgPez2JiD8u5PsbV2cS+DiSoIoGZj9MsEeU?=
 =?us-ascii?Q?H1MQlZwzOkLxaaeFPUNVx6JL4ug9ImHbJWczZJ5hD0fN7TvhfuROA7GaKcGe?=
 =?us-ascii?Q?LnDqntino5yznZRFzAyJhOpKB8FjV88DUvV1YHlkP9a8jcZD1xWTC+8fr37j?=
 =?us-ascii?Q?+vl9HwBZEQ642OD0fMY4ZvTUhJAZnKg8QiHbtL262Cu+BrxBDFge3nYeKcbK?=
 =?us-ascii?Q?8BLzVG49DaLV5vplzOP28ychZgKlG/8NEqAsjvMm7+mQDI7D5kcnscWwmomM?=
 =?us-ascii?Q?+vR1rcuMGnTTWr9vmArrZpTc4hdcr0coErCwxfujBS3d8yP6X54L0YoY9zFg?=
 =?us-ascii?Q?5M51a+qt2TLpnpJuOF0DcWxStYFvRmj1H+KdMpC/rCShXdR7206LlsYuPWyx?=
 =?us-ascii?Q?wu5KLmUC9tVMTFHfdMEkWucXiXLLHzQq/pjolmZJk1UX6metgIAAEH42ZTa8?=
 =?us-ascii?Q?HYlojCnljhcilaOYsH+VNFzrZSRnSsFc+BrBt41WcuWleFrZjPml/CJh2D+s?=
 =?us-ascii?Q?t3xIrvoItJp9JcVzetbblHBonpJb8NbYjX/rfzTAcRtpZNHWPGm6odJO+oXd?=
 =?us-ascii?Q?HVLvdTO3WEGANiAPAvEn3aE/jReA/P3AY36k21VOuQ1mThiIKBiPTWfH2mdG?=
 =?us-ascii?Q?vWooPIJEn9/96KZpWxTGRXivJgy9+LQApShY8whQ9AhtwFySCf5ZAFzeXhOU?=
 =?us-ascii?Q?pN+EfYxgVJTeVRM7ADDSRb+G2BWHgPXBCp1Dt/wCdl3fglYZIBnyuaFG8O2Z?=
 =?us-ascii?Q?TrVwbmsHX2v/gF4ph40qG5IyEDPFDffygCdn9pYTpD8mFuaeCc3iBQzYH7RY?=
 =?us-ascii?Q?V0EfPy9cM2J+MJNQIqGLEW2qVY1A9U3Tw1W726gxa6TAEHGiVJzPBXCd8tEW?=
 =?us-ascii?Q?GGvizWx7BYFs4bsvuI08pp89n0V1ZGSOypajVxZ5fJ/XmE8/GutzUS7jxpTO?=
 =?us-ascii?Q?hmJwq4C0Qt/bn8eMpoy/9SIA3p15L7NxZ7BHQESu3q/oMH6XmYzkvxLl/VzT?=
 =?us-ascii?Q?sHzE0l3O7bFdvZbLVguD21/361eKAvX02NXBGVWBkgJvmAvE2KmWvYRL57X2?=
 =?us-ascii?Q?O9vMRTZh72VYs26J7prDT0r9HCSbDGFLv4cgxX/ccCrvjCa1fjxpJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wc63wUTuVOHJzgQ5shN1OV3iwRae5jlibDSrAtL8xqCd2zOEcdmlLRC7Kgn3?=
 =?us-ascii?Q?aPY9ph7NGTtp+c/KAh5B8ujsMUnXMb0DQ5rdoVM9hE+GgtRXsk3XSrD12ZaE?=
 =?us-ascii?Q?OMI4rWhhdLtVhWFt3zdAEKux/BbH6geQO1U9+vs/sBEkbP1yumch9LH5Xji1?=
 =?us-ascii?Q?fnZjRWQI3aJS7GZ951P79jdwehfFCroACBCq5iE1Ta0GL1OP9pBF2R1DjKGe?=
 =?us-ascii?Q?ksVtK3aqtGTams+tqiArorSJBqKlHyon4VZ0PW0OypUFNRKpzeQqsDqFc430?=
 =?us-ascii?Q?VrscjL1NbBa9ZJg9diXOx3IZw5dqTHI/6gUKuqthbVTd2YaIAj90f4vHPUFr?=
 =?us-ascii?Q?FXMDGrhIrz4gSEbVELdJQBniaqkYCR/6jzYhIqwoS0oFenKvnUXVD96Oftvd?=
 =?us-ascii?Q?mxUtcj//I6fWWz9m6V0TvE4z42y3jVADIkNDr59fhKtI6TORmMs+/URK4bl5?=
 =?us-ascii?Q?NuyVE/h+Q2J+mz3ydbgzbGd7FDcJaL7FLR35Hnyq2+/kIvZZftT/Fw4emFAA?=
 =?us-ascii?Q?mfDzHrAmcQSf/qsJH7MS/tAEa4jfmZQad7qaxupEEquupXjm16H6BhQ57khA?=
 =?us-ascii?Q?wKTaq8xre02BZbTmSBRXdtI7Va0j6uUSJOQSAiLkdpFC+baY1sXpI1hh+Uqm?=
 =?us-ascii?Q?05z49gWsR477HtkaYarwyd3qqnrcRXQFb++TXsMV278NhJMmy9CL92pVCwkQ?=
 =?us-ascii?Q?AeUHN4wFo8dwG3sV3FziOEv9prV/vzhA+/jRh0MR1/2X2C4CwXoSGG6yrvuZ?=
 =?us-ascii?Q?uDUIkdaU035DCOE0aY117X0QR+szglUK/+FEa+hExoOneGh50to5RC1Q/3DO?=
 =?us-ascii?Q?8oeARA4vAyE6695bSS5xQ2glF+IG65AwOpyXMIKRZf3zSkfEvMYrtEL9rBaY?=
 =?us-ascii?Q?8YlsGf2cQ0cCayTlGhKJ1NPcLHlFKvM001OT2bBWbN7DuCakfOWQi+5YiO+E?=
 =?us-ascii?Q?y2WOCDDWuTdaTgkZMpUQMnc2ZOSF5PjUHYss2+B9GSrvHaxPdLkg+OMltm3S?=
 =?us-ascii?Q?/vVbawUHupmG/9dQgtHgySaTOGDjAAE3ANvY/SOdggWntK8R0QzOwQNroCDE?=
 =?us-ascii?Q?KHZc1VzM7uwRk60mwGc/BBJnvFXc5269vgnjN/eCsl+GcWZQKfGi3o5GJqmi?=
 =?us-ascii?Q?6+D0sIMOxmHoAo1of5qKTmnpSbKqkTXbIl62ygfK4MS98VU4Q/hbzPujEk/g?=
 =?us-ascii?Q?IKeFYGeLhdTFBmu/X62A6hmTW/e2dyvkzDtpXNniGSL3n1ziMct2seEYm9Mv?=
 =?us-ascii?Q?Jfb9cIfZ5za1PeqQ59dpyVIsuiVNOXCUYz1reCyj9TeWc0l6SLKThNa6Afg2?=
 =?us-ascii?Q?NUU6+b6jvrDY02ZG0nf2O5gh7i7xyEKWcA1C4Yh9P9exN/THVfoBK/QkzQHv?=
 =?us-ascii?Q?MNlYIc+xy4Aoq41wWK2WpUnhvr1THlwb0YUWGR4gLQfSb1UbiuZFYX01mJAb?=
 =?us-ascii?Q?yucQ0IHWwjxwHJmEqgYlHFFORu802ZS/NklY5xc/7K9SD4ZWR5fVjaf1AK10?=
 =?us-ascii?Q?5//teyZzJjJWA0gPwF4VzUDYK4RqEMPam8Hq1gdAe5pbDp5i9Z9eRrgoa0aL?=
 =?us-ascii?Q?pKV89rk77jHLvPaQXV2L3Sq5m88AchubtBajPVOW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170b6927-c91e-40da-8f8c-08de05ff83d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:32.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEC4pbbm/kUWyCSXfsLf3tn75LfGikclqhUhjRWzQ5SlsFGRtCepVuAzQlnR9C7TF7HYPFKZ6HBZfTUmaugajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

---

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
 drivers/gpu/nova-core/gsp.rs      |   9 +
 drivers/gpu/nova-core/gsp/cmdq.rs | 493 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs     |   4 +
 drivers/gpu/nova-core/sbuffer.rs  |   2 -
 scripts/Makefile.build            |   2 +-
 5 files changed, 507 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fc8fe6ffe439..ba385114498c 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,6 +2,7 @@
 
 mod boot;
 
+use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma::DmaAddress;
@@ -12,6 +13,7 @@
 use kernel::transmute::AsBytes;
 
 use crate::fb::FbLayout;
+use crate::gsp::cmdq::Cmdq;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
@@ -19,6 +21,8 @@
 
 use fw::LibosMemoryRegionInitArgument;
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
@@ -33,6 +37,7 @@ pub(crate) struct Gsp {
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
+    pub cmdq: Cmdq,
 }
 
 #[repr(C)]
@@ -87,11 +92,15 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         let logrm = create_logbuffer_dma_object(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm))?;
 
+        // Creates its own PTE array
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
index 000000000000..07504d15bfbb
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::mem::offset_of;
+use core::sync::atomic::fence;
+use core::sync::atomic::Ordering;
+
+use kernel::alloc::flags::GFP_KERNEL;
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
+use crate::regs::NV_PGSP_QUEUE_HEAD;
+use crate::sbuffer::SBuffer;
+
+pub(crate) trait CommandToGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
+
+pub(crate) trait CommandToGspWithPayload: CommandToGsp {}
+
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
+/// `GspMem` struct that is shared with the GSP.
+struct DmaGspMem(CoherentAllocation<GspMem>);
+
+impl DmaGspMem {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
+        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
+
+        let gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle()))?;
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+
+        Ok(Self(gsp_mem))
+    }
+
+    // Allocates the various regions for the command and reduces the payload size
+    // to match what is needed for the command.
+    //
+    // # Errors
+    //
+    // Returns `Err(EAGAIN)` if the driver area is too small to hold the
+    // requested command.
+    fn allocate_command_regions<'a, M: CommandToGsp>(
+        &'a mut self,
+        payload_size: usize,
+    ) -> Result<(&'a mut GspMsgElement, &'a mut M, &'a mut [u8], &'a mut [u8])> {
+        let driver_area = self.driver_write_area();
+        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
+        let driver_area_size = (driver_area.0.len() + driver_area.1.len()) << GSP_PAGE_SHIFT;
+
+        if msg_size > driver_area_size {
+            return Err(EAGAIN);
+        }
+
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            .as_flattened_mut()
+            .split_at_mut(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+        let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
+        let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
+
+        #[allow(clippy::incompatible_msrv)]
+        let payload_2 = driver_area.1.as_flattened_mut();
+
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
+    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access wil be performed.
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
+    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access wil be performed.
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
+    fn gsp_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        // dma_read!(gsp_mem[0].gspq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    fn gsp_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    fn cpu_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    /// Inform the GSP that it can send `elem_count` new pages into the message queue.
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
+    fn cpu_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    /// Inform the GSP that it can process `elem_count` new pages from the command queue.
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
+        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
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
+        #[repr(C)]
+        struct FullCommand<M> {
+            hdr: GspMsgElement,
+            cmd: M,
+        }
+        let (msg_header, cmd, _, _) = self.gsp_mem.allocate_command_regions::<M>(0)?;
+
+        let seq = self.seq;
+        let initializer = try_init!(FullCommand {
+            hdr <- GspMsgElement::init(seq, size_of::<M>(), M::FUNCTION),
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
+        msg_header.set_checksum(Cmdq::calculate_checksum(SBuffer::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
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
+    pub(crate) fn send_gsp_command_with_payload<M, E>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl Init<M, E>,
+        init_payload: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result
+    where
+        M: CommandToGspWithPayload,
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
+        let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
+        init_payload(sbuffer)?;
+
+        msg_header.set_checksum(Cmdq::calculate_checksum(SBuffer::new_reader([
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
+        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
+    ) -> Result<R> {
+        let driver_area = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area: &(&[[u8; 4096]], &[[u8; 4096]])| !driver_area.0.is_empty(),
+            Delta::from_millis(10),
+            timeout,
+        )?;
+
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            .as_flattened()
+            .split_at(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes(msg_header_slice).ok_or(EIO)?;
+        if msg_header.length() < size_of::<M>() as u32 {
+            return Err(EIO);
+        }
+
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
+        // Log RPC receive with message type decoding
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
+        let payload_2 = driver_area.1.as_flattened();
+
+        // Cut the payload slice(s) down to the actual length of the payload.
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
+        if Cmdq::calculate_checksum(SBuffer::new_reader([
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
+        let result = if function == M::FUNCTION {
+            let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
+            let sbuffer = SBuffer::new_reader([cmd_payload_1, cmd_payload_2]);
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
index e82f9d97ad21..bde80cc3fa63 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -37,7 +37,6 @@ impl<'a, I> SBuffer<I>
 where
     I: Iterator,
 {
-    #[expect(unused)]
     pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a [u8]>,
@@ -45,7 +44,6 @@ pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
         Self::new(slices)
     }
 
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

