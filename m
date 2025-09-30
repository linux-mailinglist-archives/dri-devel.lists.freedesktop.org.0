Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A2BAD02B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12310E5C3;
	Tue, 30 Sep 2025 13:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HoC5I+xV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E0F10E5B6;
 Tue, 30 Sep 2025 13:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD7mgzJ1Mv5/aiRUg12YTo8dXHfrw/5XMQz4zpUd4WTVypZQykyZoFcC5DmZqhsjaMuGdINWzidoV2IQZsr92Dpe7gzH1T3/N4HfTHmHgs67wlaz+WLAKbRPn2CGql2iY8BZVGknknl/LZivESrauTXxRLu2mrPd+1j+o1LfwI6IqTU1xNlXKjek3t4yOsrTBW4rDPBBpJMULVrCVRQuMQGAQ0qVb4MO+d5HyZc4FWxWUoQfYg2MpBFLbMet0aMx9HckYw54GDYi+dVD0IPpeVGtJ2Tg0LbloBR67UENRzJcJ4l4z/vELFul6R2BsgLAcfp6SPGKWgZNlokZiayqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmrrBp4RCsvI6wULJzmKnXS0IoD43IIUf8w6pfetTuM=;
 b=gM6pma3RgItdp2e4Gy+5W2ILk132MxIdc+8TFh2vNr+QwSNu9neCtSt3sbFNmN1RCag6GuXGoBr8rXy4Dh8xUk1mmkEWreo2KKrYbs1mXEOpRAGabgi1SI7upp1Ri8m0PbfwSAiHoaKhFLqgwOskrTdLEps8xsDS5B+rQVd+wQFpjx3NXJo9mM/zWdwzy9PAdmy243aYqkabQO6+B+zY93OP6ocyk3O89ujoae7hpk4r3l9fbRNdReU9sx0SeD4jcM/wQAnKT8+FqVUlukHf9+tBZhi2DX4Ic78yZ4rjlzdmbC1BIeSl5F1R34lIH0nOUGiv2t6iULatuQH3BT6cRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmrrBp4RCsvI6wULJzmKnXS0IoD43IIUf8w6pfetTuM=;
 b=HoC5I+xVadkZQeDcsPSrw8v9gsbCCV17F8ScQtNNYCkEZqDMhl1VnEwdnX76y7vASOSy7+WrK+cgMODVeZAEk9tpgmSGL0JIflGJOCgf9WF8tFRJVSIVI5G9KU+qqhI/bhR3pt8+6cFy6Mhda+6c3x+fZW5kKW2hQPSr9i8mqE0ao3ciKZ91egEOTpszSwEtWWPRaptBBIQ0eRmQZF4WT327Wqss38UmK1Zdx2BtQCmxPDMoo2jPAZOkKu+u5oF31soEnDdFrVIgF0QoKyg+gL0bGyteR3qdz462LzVk3udcknTFd7NUOZXsL9Q8FVORPTgyfzlSotnagyX0R40IUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 13:17:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:27 +0000
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
Subject: [PATCH v3 06/13] gpu: nova-core: gsp: Add GSP command queue handling
Date: Tue, 30 Sep 2025 23:16:39 +1000
Message-ID: <20250930131648.411720-7-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0061.ausprd01.prod.outlook.com
 (2603:10c6:10:2::25) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4ba339-5682-4620-c4ac-08de0023b3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5fT/MmdAqRUhzHYzNl+rNlFFJtOln/5C2EYMf1SUO9JTYkkxdOozgs0W0TQX?=
 =?us-ascii?Q?XffaaKyEpBjRtkcbp/icB448gR3VVN+eq9UNFeLxcQ6gj0aJsRFN08ggY+GP?=
 =?us-ascii?Q?BeGyrRmDwRz2yepQd7GA7x/6Kvcrdrp6E8MyEHyz3GvsvJXqRwKE7zSbeybD?=
 =?us-ascii?Q?1OEPK7V/OuwwD7FiwhI2pEsqVfaLGMIudZKE6cwv37duuJEexYjf5dPcVXJu?=
 =?us-ascii?Q?I40RX6oqGdEm+2oc8WZdaiesG7fmM667gQkN0NJfJjkDpk4grIu6a1IHyiOI?=
 =?us-ascii?Q?AJhOLcWlk+Peq2VGLVtT6NYTlEk5hrmut9G2OpyoFfjuiTr1EjZdR8u+4t+u?=
 =?us-ascii?Q?9L5zJwIRWEwE3r4Pt45eLHSmCmudm4jVR83ydvZY0S+scp6kyqVcc1jgnzG1?=
 =?us-ascii?Q?uZ7l8PPOzDnd6M8SUlQ5CIWIaMnpQKFY3QHPMNS0YhZ//ooLBCp72U+KS01q?=
 =?us-ascii?Q?BSEBGl9y3VbSf8TFObzbtn6UXZ9Wxw2EiyX6d529xuHseObR87asFbBSWeLX?=
 =?us-ascii?Q?GQ0ySpur/nvhEZvRHPdd04YJNBuQ1RycQ8/Ghx79+u8Fur17nE+AkfKjToP2?=
 =?us-ascii?Q?e3wBGUYHRgQaj+hfJd0KxC6/4flwfJp1w6hnPI9VA7uhOpR63hij/5D4cF+e?=
 =?us-ascii?Q?79OuA7p/L1wthJQzgI9lAQzXmPzSIDnS7h0BU/Cn4pkuh7Cd7ifKgS5NGu0+?=
 =?us-ascii?Q?IMg4/M1JjgEGWrj+k4+TIwVSh7wwkyKp/VIexp4D3hwNIcEuZyFCTFI+hOTN?=
 =?us-ascii?Q?F8NDwMKPYEZoTBlZZNs9QvVv51XGYKkigE+bJFqXPQPl/RFUPkuXxqLH+hjB?=
 =?us-ascii?Q?xauCYoH9F641kIuLGRTCSTLzEZdSQTWx6rNG9TXJyVvmLXVkbVMkcxgGaOhp?=
 =?us-ascii?Q?uSAGPI0iA4GHiJEIaLf0pSiKZavJLu2HBmv7/rnPhahlPm4jkkQI4RfjIux/?=
 =?us-ascii?Q?htG3ZR2ElDjXxGbQ7unp0WDGjzMSMD0jBRiDKRwUglqmfkvvrDbEB5nZUh+z?=
 =?us-ascii?Q?Ezu9Mb+JF3V92gDb9cLdZQRZQhjNWGgF5JtAx6xShnlB6rbCWf4Md0vXNAlV?=
 =?us-ascii?Q?xvcieVwbSvk1qhxit9QRkgM6L684tzuNbaa2huX0btr8jgr+v4cvMghi5m+L?=
 =?us-ascii?Q?VQfMG2vQCkhaVlGpYj19fK+sFfl+VBtGebbf87s/GpkqBKPmQnMh3coigepF?=
 =?us-ascii?Q?T2kGeW2c+jUTPq48+3uU0985SfM6ZExaN0VY3GZyYIBVggEy4+COIxaD/JMe?=
 =?us-ascii?Q?PnmXooQMlqINqtrL1dgdY6eXVYh5sOpVG+DLyZ90hEnDmy64+BvrO7Rbg6S/?=
 =?us-ascii?Q?vrOU/KDQlmelGuPAomfnRfNF+Ync5FpTQLf2d6Jv0LE3X3to4kSvEdNC1kPs?=
 =?us-ascii?Q?BxhKxkp34ntv0Z2V+6ZHukeA1ZoQ/hm/ABFJJSDvmubbKIzeh4lZh9TfaM1d?=
 =?us-ascii?Q?4WgRcENSAcxt4Banx1OZ6wAdc2GjdvxpcBXZArHPOh82Ed9usdlPhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U8fyA4Q2Xe6dBmPQNCbrbGEovdfvowPXD6hscD6X475O/Re/kYt1oSGsGRYv?=
 =?us-ascii?Q?sEAHVJD4G+37rehigK6jKuk+tHfpYXlPX/FHF/2ZmfoCZxhiCGrQnocxfojt?=
 =?us-ascii?Q?E0B2nnV3MpzbES7QXm2Elx5tZnd7btCw6BAaYzE9Zhn6JcLfj19v9+WUaoTx?=
 =?us-ascii?Q?iHT9CG0E2yk6Zj/QwmJ0c8wRchyix+I8ndbN5tE06BvldnrT8lm2/ira8O6L?=
 =?us-ascii?Q?pYS5zakPvYT2JiAcKHPnanP18k2RfzmkXXJ4QsAGVcPEI1xTLLIGHPU8IroV?=
 =?us-ascii?Q?jmZRP6gPFR5FYJMW2jD6BKOswmOV1QwaitKI5322QhfL937em5Y6MrH8vZwU?=
 =?us-ascii?Q?5MGoUxNaGheJYI1cS8wLmARO/wElMTKO38se/xUKAObd+Uhb78iYmUwbyiEz?=
 =?us-ascii?Q?Cd8aFaGXW8Y1imOYZPhp3So1PxufsmbRYr5C49/BuRY4EzjG9bzimxpFjF9b?=
 =?us-ascii?Q?gCpSy1x9hyd7wOp+zzHjtQFCf/8s1NhKIGeMiZYA6dIY4GrP5Al2u6mHQFvw?=
 =?us-ascii?Q?Ut3UczbpIoTan5gVWQ0UVXmb+/P0NELfLuawCKel7Qgo4XIrBEhV5xyh2ODV?=
 =?us-ascii?Q?mAsPFvhqD70Oj9XBTKQ1lWaHH/WiYc63RoVEolZGKmqYcCwdjImlwxBUos/9?=
 =?us-ascii?Q?4AwejFxoUpXj0uRIyC0yDRTIk15IuP7BBFXV/SgA3LqrcvWcdIc1kIrTzScZ?=
 =?us-ascii?Q?I1+RhUfYy2Anvt0UAy57hSlXQgAkQar7eQ6EyotiAefXl/5aX2kXmZq46R++?=
 =?us-ascii?Q?7mO+yyt4KZ4nK8QYJWZQv7E3znWN5yZfC9ZmvmWIBpaeT6X0e+C7VT5kb8jv?=
 =?us-ascii?Q?7emuo1AmW3p5dtR/+LWZyejyZIleBdPuPZSQvc4MgPR7Qbixw0kKp1req1bu?=
 =?us-ascii?Q?7h+1dBFu7TrkJaDnJXND3rQyvLme+Suxmuu05LS9aCeT5Bq8bB+bFekZuyDk?=
 =?us-ascii?Q?lGo+llBRpwk91G/otkeLDpai3qnUDL09mVrqgJxHcc/3zU6Tg8fytr7xDWxd?=
 =?us-ascii?Q?p8SC19Hg7dr6mzPKjjX585eHMH2pAmr66BGRvlGZ/fWJFQP00M2psJ2ILIP5?=
 =?us-ascii?Q?q2l8XF8o5fIXMZdZv6dgg+L5n1ypvpI1it1UPF5+yhL9Y91H01ImT4WqKArG?=
 =?us-ascii?Q?LXhgTFNKD44euE+tK9jhP25pw9DZIaa/TRtDv9b5wXvoAV+XnViB3FwyqJZT?=
 =?us-ascii?Q?ufD0JTTbzyNQIHRuKu+eNmMXAtNV+joI2F3fe7p6DEF/MfXcVU/YaM9tDhr6?=
 =?us-ascii?Q?9W1/5vWf7HlE3SB9apHMlwV2hN1XCTK2jvGBkdts2Sb6b3E51rX9IEB35raS?=
 =?us-ascii?Q?q4TPtjiptPxXq7+F4cdmHI7GKuvvd9bSzO4dCKgmebZ9wwkHNUgIS2x4lAva?=
 =?us-ascii?Q?8/OG2CYaR2gI0ZA+5KxGiZZVGncAfgGZGdkE6vjfVuGYZJG4M1XFdwc5xPrS?=
 =?us-ascii?Q?W/uMB9kpfGUDM9QnOhLK11WUg5h0AGd5BkDnc5fZOuj9lZXNPKs5ZSsNq5X0?=
 =?us-ascii?Q?aqLR0zx90IEuUlk/o5bEY2XwslPMylvNJG7L5MUCaPAuTS48bUDurWGNLAyh?=
 =?us-ascii?Q?yW2CYUdPT/e7RPThU4wFMxmgcKmDE3flxvmc+Mtv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4ba339-5682-4620-c4ac-08de0023b3a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:27.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Diht+KThqTzUuSjiU3tUlMIbk/q6GMv5ycFQECE3lccG5TDyQN5H43P1tjnCACDF2Rh0/DcBIKZp6JWxOz0UtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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

There are still a couple of TODOs left to address here, in particular
switching to using `init!` (see "gpu: nova-core: Add bindings and
accessors for GspSystemInfo" for why that hasn't been done yet) and a
couple of other minor refactors of the send/receive functions which have
been pointed out in v2 (eg. methods to extract a command region, etc.)

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
 drivers/gpu/nova-core/gsp.rs      |  10 +
 drivers/gpu/nova-core/gsp/cmdq.rs | 402 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs     |   4 +
 drivers/gpu/nova-core/sbuffer.rs  |   2 -
 scripts/Makefile.build            |   2 +-
 5 files changed, 417 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 537a226f98d0..3132f1009897 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -5,6 +5,7 @@
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma::DmaAddress;
@@ -15,8 +16,12 @@
 use kernel::transmute::AsBytes;
 
 use crate::fb::FbLayout;
+use crate::gsp::cmdq::Cmdq;
+
 use fw::LibosMemoryRegionInitArgument;
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
@@ -31,6 +36,7 @@ pub(crate) struct Gsp {
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
+    pub cmdq: Cmdq,
 }
 
 #[repr(C)]
@@ -85,11 +91,15 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
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
index 000000000000..7d43dc987ba2
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,402 @@
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
+use crate::util::wait_on;
+
+pub(crate) trait CommandToGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
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
+    pub(crate) fn send_gsp_command<M: CommandToGsp>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result {
+        // TODO: a method that extracts the regions for a given command?
+        // ... and another that reduces the region to a given number of bytes!
+        let driver_area = self.gsp_mem.driver_write_area();
+        let free_tx_pages = driver_area.0.len() + driver_area.1.len();
+
+        // Total size of the message, including the headers, command, and optional payload.
+        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
+        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
+            return Err(EAGAIN);
+        }
+
+        let (msg_header, cmd, payload_1, payload_2) = {
+            #[allow(clippy::incompatible_msrv)]
+            let (msg_header_slice, slice_1) = driver_area
+                .0
+                .as_flattened_mut()
+                .split_at_mut(size_of::<GspMsgElement>());
+            let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+            let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
+            let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
+            #[allow(clippy::incompatible_msrv)]
+            let payload_2 = driver_area.1.as_flattened_mut();
+            // TODO: Replace this workaround to cut the payload size.
+            let (payload_1, payload_2) = match payload_size.checked_sub(payload_1.len()) {
+                // The payload is longer than `payload_1`, set `payload_2` size to the difference.
+                Some(payload_2_len) => (payload_1, &mut payload_2[..payload_2_len]),
+                // `payload_1` is longer than the payload, we need to reduce its size.
+                None => (&mut payload_1[..payload_size], payload_2),
+            };
+
+            (msg_header, cmd, payload_1, payload_2)
+        };
+
+        let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
+        init(cmd, sbuffer)?;
+
+        *msg_header =
+            GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M::FUNCTION as u32);
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
+        // TODO: use read_poll_timeout instead and error if we don't get the
+        // whole message.
+        let (driver_area, msg_header, slice_1) = wait_on(timeout, || {
+            let driver_area = self.gsp_mem.driver_read_area();
+            if driver_area.0.is_empty() {
+                return None;
+            }
+
+            #[allow(clippy::incompatible_msrv)]
+            let (msg_header_slice, slice_1) = driver_area
+                .0
+                .as_flattened()
+                .split_at(size_of::<GspMsgElement>());
+            let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
+            if msg_header.length() < size_of::<M>() as u32 {
+                return None;
+            }
+
+            Some((driver_area, msg_header, slice_1))
+        })?;
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

