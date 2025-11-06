Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E2C3DC1D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DCB10EA00;
	Thu,  6 Nov 2025 23:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kgAlmRAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFB210E9FC;
 Thu,  6 Nov 2025 23:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzZfQIWUW4we1sui2o1NDm0377DJX4X7eW16J64i098IcOPc/FyTdbFrbO/VTpTBudO6DNGgwYGZFo/0njVZ3elDG5S+qZjRf3SZT/WQtLLse53uxLW52s+hFiwMiJD+6ktxtv8Y4u9sF4hrQOLBPV2AG58ry+coVQMbG9f0PrgUyJcHZzs6xk2UeNd74CZCmn2RiyowpLxDUbyAe+AYk3PxOvz2pSJFT5a72+BgKggy8d8/5e+AHAvsucOwRItBBtqdwrcAJ8OXUImcuIf3oeEJJ76h0l5iAKwh/aA+sLa6OrswJRs6Tv1+7n2TBqhOabUpeyP6QbcwqZgwgbL6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj22Pju9ZckBsjOOEr6TOSg9HcN1YwNTRPlP9xR51Qw=;
 b=Fr62HOYC8P0uf5np7TNOLrvHpku6Je3VRBh4RHRzNFPEvtqw1EInXmkdy3VHdcMnR2wDq4j66b8S1uKaj3vqBbRuCNhvtsY752dB/4lejkYUyIjZIOtie1BeutbZYXD5QN5LPSmAgFfrDqIN5uJcogJBbJWowFXw0Jo6ima6vkLE+W46p7w3986RqJce8uD5v5lt1FQtf6XWJTiVmWYJ2pAmRCv/Ps55VsmWeG5U1JWIxVTm4ylbTpRf058JlrxhBtMC5CXWcHP5sT+jFlTOlsou9ohZMbsvnTeNiDyD/dmvA5uzOulNH69aIBfFHMB8Ar9C1z4nw/h3Lx+/nAPw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gj22Pju9ZckBsjOOEr6TOSg9HcN1YwNTRPlP9xR51Qw=;
 b=kgAlmRAbhjEkdZmF/XmdmSvT60vxrgwlCO338Y9D+HLH9lmBpr5Ea29LpPDQGtxPERQopY2H3ku72c8aO2qtwhW/byN4gvj77isa3usxDmZhqlnIQ38QsflXRbsPoj782MwxKJfxEluMLbo1i/SmIgp/7tT1P86PEfNAk0SvCcyxleUC62v3WH8g2Myumb0ZB3QBUClwChCY0F+i2JknTfliknKcsZnHJd6F2zyWk5Vzx24Z6X8HzVBmFaqc28LtbDpqRSCMoyq4vXmCg/wsngsof03AW1sp7bsckp/er34A1ivdr7MZC+2L9x7awJDQc46Jr5hLKtbEOE8OMZADiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:14 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:14 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 12/14] gpu: nova-core: gsp: Wait for gsp initialization to
 complete
Date: Thu,  6 Nov 2025 18:11:51 -0500
Message-Id: <20251106231153.2925637-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0054.namprd15.prod.outlook.com
 (2603:10b6:208:237::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a5165c-a342-4fcd-eee7-08de1d89ec3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kIPbXap+Uz2w6h3/0jO0PM/UMdTvzXl9nWkujfecC/newrNARIQCMLXrS/vE?=
 =?us-ascii?Q?qU7FiocjrnA0Fm38qdhdNLNIs/0/YXnSxeQQS3KZvwRtB+SNFgPp30C9LWqK?=
 =?us-ascii?Q?iwpf6lyAyNUM0zXPN0/CqOdMciUEQhXGedace6YahE4heFCAkEhaXt3n4h3I?=
 =?us-ascii?Q?19uq0FBZNsu+XYZVCg4fL+Xsr30w8rMoNc6v8hFTgGFk07VGlZhy+HiqXRlA?=
 =?us-ascii?Q?heemJ5U8LKFbD6dS/OSdBqd73DkwGdmXpZ72EFakXk7rUlpLjlOWd1sfsAou?=
 =?us-ascii?Q?sf5x1aQv9HJ5bn41kdlbg0C1BgcueAknPqaWsmRSpKPvP8OwaFThwkxv2ENc?=
 =?us-ascii?Q?RCljZuAurqHWSYLrM2Lfm4jVa98vXT1Rm1dL0W3u3M4b0iJuh/n7aJF/qkwc?=
 =?us-ascii?Q?qjYuYrEIQVgCe+rnL+/MrT0MVRLsYYqNnNNWDBe1uFRkAgPJb3HyP3kF22v3?=
 =?us-ascii?Q?rlBGpFNXuJ7kPJtplDQDWlIj8BRXBCD2oNQbP0daBhnR+vhCM5L4crKBd6rx?=
 =?us-ascii?Q?k2h1icluh6f9pViyFEpH6X3pYFmDAuq4M91OtOSVnktTljnFDVWbL+3SExYW?=
 =?us-ascii?Q?h7doy5VCdSzEse6h0Yz3mCvClxUxyfYm4lP5g+gQ38Ej2s4KpvzR1YJBvCb1?=
 =?us-ascii?Q?2agGS6Z4cP7MZKhu1F6L1LCcdHax/JdUQD7YXTx/RkfgLyBr+ixiowjLiAvP?=
 =?us-ascii?Q?u2Y570qM2/5rC/n/ySmhtXLg80baWaggpRN++c78+yaDue+LBSh0DdMeeGB/?=
 =?us-ascii?Q?Nzcj7yrOLBERS1NOVcqUhxg7xKYoaB9bTuBIQI4wS+nb8HkJq/+3mnvXzH57?=
 =?us-ascii?Q?//DKU1BlxNbJtrj1zPpCGAbAZTbka+RnkDVFJtLldrOhYhVcm1/jdE0YuuKn?=
 =?us-ascii?Q?m7i9JbL/thKuwirfE0VgkZ0zjVfh/IBOC8nyvbd4YcHAt+wGynxhdd7c+Wuq?=
 =?us-ascii?Q?p+ZSeseu/sM+czQG1dt2MibiNWOwXdZ2OmHTppCiznvae66AOApZecGEbVKy?=
 =?us-ascii?Q?I5d722h3ZdJBBnfIrjrlCBc+eOediDF6jD/WpCNqm+9lyZxXW04Jv+eXUY7y?=
 =?us-ascii?Q?y1umVQtGHR0FaqtqSwVZORviBTGeDbXEaVaPcMQSJihSK+NUK/S6Yr6o6T9P?=
 =?us-ascii?Q?Yil7ap8tuJjI5SdbpIuAWmBM5j52Xxl34FJHbNc/OWbVaJD9nRdiCD/lqRZD?=
 =?us-ascii?Q?A0qmkOU1fxnvbq8LmkHfKlthlKrm3b5avmYfAVRbfNlFXzBqcYOTBCbWuiy3?=
 =?us-ascii?Q?mjXLqjO2DkK7WnBTIBAEmO8mcg3tLJrNVeBIORkO9Lq4ENkHDT6zuUZoPulD?=
 =?us-ascii?Q?6xb4ix0K1jHYtJCkLubfM82Asxb6Oo3jZEwtA2GP+QhmBLHqtMr4h9gTcBZ0?=
 =?us-ascii?Q?d9P+/jeNDaBCa9ZddB0jLVFmxeU1I/pX3rQmx8yU4ssa1xCuzZyfQ92FG0jD?=
 =?us-ascii?Q?gZNUONrv3xaMZqXI6VE1EVWrr5toTFUE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yYU+/swinh5dAIerp51mS0g+vMpiIrg4TQKHPG2xZVS2sdrSAsIg7rh3iZOo?=
 =?us-ascii?Q?lzRBUl2xM8gsd238Wl0r7JIwSQhFIOCID6Iq6Vvwu/iozMCkzH3GvDCaDKDc?=
 =?us-ascii?Q?NuRQabqRwk1zJbhVa6ZSUuEFULGvHHnXLC9wY6yN9xnYwdS5hf0BYsyVfATS?=
 =?us-ascii?Q?tXxDxp/wuEotjTFsz3OhAkFfwYQD19bwBUXbs/Fci2OOniALPMGdclKuRzwj?=
 =?us-ascii?Q?M1XKc1uO9Ul8JFnUMwNU1dZnB3Eh9+cNXDtjQRXajZptcAb7bLsvdQx85J/+?=
 =?us-ascii?Q?HNvc7RhMYlsIXBx+yhYsxzdmk07AFCbCGt2Tbdgayz3aXa0B3c9ueVLsli8P?=
 =?us-ascii?Q?++pQvkWdAs13QEIAE+Cuho5ISUnfY3fFLRNxuAGl9l1+IcLZ7aIEyGuUXiDK?=
 =?us-ascii?Q?Ni73qZVhxEJdxQB6/sN6OcTlJLaXSb4lcKPPDJrpcYC6ihecWrpUfk8YuyuZ?=
 =?us-ascii?Q?xmWTvqr5SDSP1UHhpJxx89l5rJhYf0vMyxnBnYvrSPP886vbbWkZIs8v8c4a?=
 =?us-ascii?Q?IOB1YiLtIHYgv7fz30bxEvqVrX/+6wmzF7mr6Q4JFI5S1Tx1x/6cPEcRzKtt?=
 =?us-ascii?Q?CvVbeIBpuIt/T8i4305TVjjmt5BUMgnFXIlMa7hlMUQHKhdpW8KbLiePHygz?=
 =?us-ascii?Q?RqOQoIqm89C+wp5yQAkAX46RfCB96Wkmrb2vR9hpxieaVS6nrWWSQTMySjgQ?=
 =?us-ascii?Q?+OaIdqMJcyDg7ntPbbh7Ql0fA8fOBoI4XofOK0kdzdvTbGYHJnNg4qKHHBqI?=
 =?us-ascii?Q?8YZtbaN3N9glusiktGI5IdJTgGYmsn2TQNanJPPkpVkCyDbT6kG35Sap447I?=
 =?us-ascii?Q?EVgQa59YP2VNoi6tJweKnTMiy9E66JrMbsgT6l3T4cyWhoL5NAMKJUP+x6Zt?=
 =?us-ascii?Q?okjdxxdJRVDSqbIjvq/0wUrF68Nu0mCPX8fMK9dN6qByVXT88i9X11hJ6nqX?=
 =?us-ascii?Q?lmBBv/aHed2RFTVrk8NipgI2kmcSFzzLZE381O3WgvDOedGVm9d6qKELTWBE?=
 =?us-ascii?Q?Zue7QoTIfjXxxDDVT5Hy7P8jkbqGokIKksD50y8lfXMWUyyd4jfikQZkcTMj?=
 =?us-ascii?Q?diGWhWM5mnqCBQSVfB31klZ4NiWSPzvIcBQM2xQVVOhBeSJZnL8T6PMqe9BW?=
 =?us-ascii?Q?AFCupSM9J5/d0GV38ni7WC1x6E2b8O44UY3AOSysEfiu/aj8ydJzUT7PwXiR?=
 =?us-ascii?Q?N/jWvoXXR25ISDG5tiS7zAhFr/pILj82fCLpTagvnEENKhMxUcsLVGAiLj/C?=
 =?us-ascii?Q?C8LDNw93aZ6INQmu21XNoD3RfU5xSh5M6OHqzNc11O2TVPgmLDIaUQPqqvhL?=
 =?us-ascii?Q?bejXQeKRnaIvdgOLxzsCl4l2P61cNKhgT8PXohF7svSn9TImHcGlEptUkC71?=
 =?us-ascii?Q?phZ76xX/1X2jJsYD2MGA2wjvMHxFNUN3k0hjI/Xoe8GwnRauuFL72v/X7o5T?=
 =?us-ascii?Q?r3iMb0FYPEIiQrn+ODHjFsbQhmjxLcCVpR41x9qUHahokku3cBeJx/K6LCD9?=
 =?us-ascii?Q?ZSx7Fq0R8J433EzN4GOS31QOPFATmZC/sFg+wgio7R0txNowSVjjChhZO0uL?=
 =?us-ascii?Q?3W9ssZbGg8b0VIz2Es7WrqP+ZofvCV2mvXqSqt6y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a5165c-a342-4fcd-eee7-08de1d89ec3e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:14.5657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjx8NU8Fe9saces9E9rycEQR14m/RtdLg9cKfGF5LBt4jQcsy1rmVX6gSTZApfNQgLUEUpq+2LooVQsZZVA0XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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

From: Alistair Popple <apopple@nvidia.com>

This adds the GSP init done command to wait for GSP initialization
to complete. Once this command has been received the GSP is fully
operational and will respond properly to normal RPC commands.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  8 +++++-
 drivers/gpu/nova-core/gsp/commands.rs | 39 +++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 761020a11153..0dd8099f5f8c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -18,7 +18,11 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
-use crate::gsp::commands::{build_registry, set_system_info};
+use crate::gsp::commands::{
+    build_registry,
+    gsp_init_done,
+    set_system_info, //
+};
 use crate::gsp::{
     sequencer::{
         GspSequencer,
@@ -221,6 +225,8 @@ pub(crate) fn boot(
         };
         GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
 
+        gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 338d1695027f..521e252c2805 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -4,16 +4,51 @@
 use kernel::device;
 use kernel::pci;
 use kernel::prelude::*;
-use kernel::transmute::AsBytes;
+use kernel::time::Delta;
+use kernel::transmute::{
+    AsBytes,
+    FromBytes, //
+};
 
 use super::fw::commands::*;
 use super::fw::MsgFunction;
 use crate::driver::Bar0;
 use crate::gsp::cmdq::Cmdq;
-use crate::gsp::cmdq::{CommandToGsp, CommandToGspBase, CommandToGspWithPayload};
+use crate::gsp::cmdq::{
+    CommandToGsp,
+    CommandToGspBase,
+    CommandToGspWithPayload,
+    MessageFromGsp, //
+};
 use crate::gsp::GSP_PAGE_SIZE;
 use crate::sbuffer::SBufferIter;
 
+/// Message type for GSP initialization done notification.
+struct GspInitDone {}
+
+// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
+// trivially has no uninitialized bytes.
+unsafe impl AsBytes for GspInitDone {}
+
+// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
+// trivially has no uninitialized bytes.
+unsafe impl FromBytes for GspInitDone {}
+
+impl MessageFromGsp for GspInitDone {
+    const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
+}
+
+/// Waits for GSP initialization to complete.
+pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
+    loop {
+        match cmdq.receive_msg_from_gsp::<GspInitDone, ()>(timeout, |_, _| Ok(())) {
+            Ok(()) => break Ok(()),
+            Err(ERANGE) => continue,
+            Err(e) => break Err(e),
+        }
+    }
+}
+
 // For now we hard-code the registry entries. Future work will allow others to
 // be added as module parameters.
 const GSP_REGISTRY_NUM_ENTRIES: usize = 3;
-- 
2.34.1

