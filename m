Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ACFC29AEA
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E8C10E27A;
	Sun,  2 Nov 2025 23:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ha+YEB/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010027.outbound.protection.outlook.com
 [52.101.193.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2568D10E1E4;
 Sun,  2 Nov 2025 23:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGDnkOEI1BhJASiUMN/CZfRBd9iQOxaGunuFkVxjqS+k6W22lZNZcPmwbJXOrnF4Nb3HS3hFAFZjgEMdcAxBBalyaJ9cZofXqStoB88MGUl3Pb7oRPcdsdZfYOr/wduyzyI+PYUd5DFgApgzbTFCG769TCvVxGmy3TJo4dETTUm+4dXeEGPshf7IPGXiOlg3+BriikIU8etemI3069iecjiTnr6b/ui/BxpQKZfYpYhnthiF04/kMtm3usxHpMjbqPX0wgyapAkbbxvDa8DYDMKS7pE2tJATwq+8GRereizPozqt/UkBfyJwxRFFHRfRhv0Ijp517z5Si5RVotm92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1JDMj/IkI6/toDKY4KrdYX0i7uYWmc/8koh4S5UELI=;
 b=Y99W37LJM1rsUlRY6USWMmqfh9qlb7lsBRGeEEoCTafpFgcFPOjnVVQfNi8ViP2THeQtMdQ8Ek2y9qcjVCMQxDAZrEbYi22Gf0NxA1071rGb0n6DSwrsGe5hYxy+n0RyF816OT5issje3orcrCpuI1+udNgqKKrZaCA/lWg++cuCZYxIYBRiZfvj3ALKvRvk5WB4gPf+oMjIw2A0ml1zSQzMoVnNRSDbueBQgYFlXFph8hhhAyovaZU377YDG7D1cxChM9eduKVHIzjaz1/7rEL1IQX67DxpTHDfG3s3LRD/1MlejiMo7B9MrHh3WoXkIdi72EjcjdoOCe1VjCUNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1JDMj/IkI6/toDKY4KrdYX0i7uYWmc/8koh4S5UELI=;
 b=ha+YEB/DoBL9pyqqV2Z75pQZ+gSbeRRlVAqMXqecThxtT241jkbrpfMlNM5fzAC6tBbmSZEKJNSrRl6+WpgnZ47HqGHjbfbp4uC1CMZPSuMUrHlFhU8McdBhoLnYD2QpaS7crtfC5peonC11jlJLA+MolriVcBxfcizOVBOaZxJdyUUN8u7TdyDh0NP+wFJTjp68yfRtuHMzalIdJh1BUi9VZXZfWJuIC0kV+ArN0CZ2kV5ErbSfbJfKFi4MwZeXvhtAgW2SIVYscq4j7bk8Y+12aE3ubM9wTTKgeHFjblSQD+0NaejJPgMTbGjKOECmi34T76AZ6jXUsSqGVohCgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:47 +0000
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
Subject: [PATCH v2 12/12] gpu: nova-core: gsp: Wait for gsp initialization to
 complete
Date: Sun,  2 Nov 2025 18:59:20 -0500
Message-Id: <20251102235920.3784592-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 14013850-7c64-4fd7-2183-08de1a6be726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3YKDnl888rs4VDhWEQL+WDr8POXOTC+TBV92Tc+lgj2xfeWLM5iQC3DG+rPP?=
 =?us-ascii?Q?8rO2J7SA/ri/OPr39JJuCObYinOggJZn5moK21Y7byqXb5sWs6j9UtV84Gbf?=
 =?us-ascii?Q?lP+ajm6k8mDP8I0atjodEWGwDDh04rmxv0hwIujC7box4Zev8oEAQzIy3VeM?=
 =?us-ascii?Q?Ji3x1OIZwWXs6diyyppbYbbUARu149SLbr4DmdSq855NUhqYG56rb+xYb/oW?=
 =?us-ascii?Q?Azl0rOYqOd96gV07Awgb+/2V+1GYVuDPqiparkFwmqCPD95w3xOWyYE1EEVJ?=
 =?us-ascii?Q?ynJ7L8xLXPBIVS9P4s6xNR2uP6oCfjSjxfZC9FjTeqHlspDF3kAf7D6aqovZ?=
 =?us-ascii?Q?Q5ZqXt6QkUykW4SrIwyDhPSTDmz5Fka9nWWIdWcGn/xWkjJrk7YYIaQmC4c0?=
 =?us-ascii?Q?DcV1MexsEGeGUAPJVH5VcdNyBKMnqPE3lqEBxB6svjMvF0MXEtwST8vaMvL2?=
 =?us-ascii?Q?ITmFsuFmpTbQiLPBv321fiTJVt8QVvHlB7sXsF/pKHC0PEMc65ThIL55Yrzt?=
 =?us-ascii?Q?zuJGIgMRwak+KWQ84y3naOYmSn2zh7qQp/u0+2FMgFXWq1RjzlROqiL353rD?=
 =?us-ascii?Q?Gpn0fcGOK6bsTKb+0oPr0aXFtPqMCfQ7DhosdxRRhdL8o3rQ68HXCrAIxuru?=
 =?us-ascii?Q?XZWUB7Txue9FUvLW1OX1sbONA217zs7y6QdWvMbQYzbtnGZhWRF4HMP1HPIn?=
 =?us-ascii?Q?VoHnLcKV2s4OtuQhAstgZUmeU9GslTpPIMPQc3cSt57kBWV+/g3buD+gc2kP?=
 =?us-ascii?Q?IlaWRzoHGLuJnBqqulo7quGWInobtdz6Zvy+VXk3JQNJXQW/5m4Flgz/s7SO?=
 =?us-ascii?Q?NjwY8m7f5ZijEFSvcQcD5LoJiXo2dTGuJ0zZXYbquMx2jGCH2d2R5aEilxJ8?=
 =?us-ascii?Q?8on404s/guDODW/flJGye09QTOt0eW6yrRYA8OoQl65OCtMFN8J0ESPN0P/F?=
 =?us-ascii?Q?5fjh3AfBzCKNPq/4n778QBIySw65tGFtbGgHB9tzwyT/bFCXMmXsO0anKVIn?=
 =?us-ascii?Q?zC+1Bl+dzGQ3GFGGZLZrqCE35G+LV7eb6cc7CQtVL5GyRVA71ZauGtxjVtZp?=
 =?us-ascii?Q?lPKmknG4RL5hnPwXUENbRLueVkweLfdPUZ0ayJmmbm5EkjgCuhfoEiwaouxZ?=
 =?us-ascii?Q?Xm/qjeid64rYWMQVAGfxJtrzSA4Y2nIvkM90lyDEun8YmdkzrF+pLHWtmF4a?=
 =?us-ascii?Q?/Zjd5JN4ys2LkZkuKLFJVeLHbXk/CSnUOwE9Ww2H0ZkRxXa2lacRRO66afwJ?=
 =?us-ascii?Q?XWOcdDDS2GeWiKym1STnIQNiPx0N5o3bfs1IgyztsUZSj+VhtOt2pJIHi9Kv?=
 =?us-ascii?Q?schrEfGR23z1nH6XtXdC9IuZXCEcU5oRy8Iw2YRgG7fxbooVLbwoN+c6C1z2?=
 =?us-ascii?Q?DQmINm8ygR6MkFcQ0JSKNLZe/bmfNLxR3tGpjLTyw53OLbUUO8GFieqrUow0?=
 =?us-ascii?Q?2jg9hFVYgvf2OvVLmSaS/6Z01viMXBcG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xdQ+Y4hxODDXANsTiYX00iXcR7Kn7xUNGDaboz3ZdlDkakWoeZScFjuiDR7F?=
 =?us-ascii?Q?WOZ7/52Kxl1KEshHFNP0TaJlIgg0RgSbGMtuiKv26lVZQaS8fH1RFLQtYnP+?=
 =?us-ascii?Q?KZBH1u4G7jEsYwz7GurYv+QnF7YIiPV0nHYvqtqFXhycmfdS1/oPk8wI2v03?=
 =?us-ascii?Q?ZfGaeyBv6WVtd9IglciaPKaC+lz7gG9IXNtxQ8JpYvHcfUzoQOuitwDWDkqW?=
 =?us-ascii?Q?rVXqYR730JyOLnTeDsq4Hwmk3axxGjKRe68FigvXjd5FSnyrt9UhQsZIoMp7?=
 =?us-ascii?Q?Bts2+NEiro0FOOVkPmb++wvUKDU+NV0TALS2rgBpvIv6QEbllFVrVJr7IgRl?=
 =?us-ascii?Q?dzgyqqaOVo9MbhwXzjuQFsfgSk4zhLRHuqeOoaHBD3zV3LTVgeNrSx7sZTrF?=
 =?us-ascii?Q?2BPrDlm92aLBWElodg7zJXZr9ocjuoerfTLOVqdQNO3kNgwa6TlA9wOiOTDg?=
 =?us-ascii?Q?bczRNK+ixe95oQKFh77DbTk3aPqdExZx9s4e/+OmOZd0Sd448kZKo87D4gKS?=
 =?us-ascii?Q?6Z8zjkQb336t37tebPjXN8Ie6d3zt3ttb1x7UVM28i5voQ7C+UIvwZ+Zrh5t?=
 =?us-ascii?Q?foBQHMgRIXmaRPu6pNkYdBizi+cstOKfYqZQ7A+Jr6MVv4tccHTSE3rjVDCR?=
 =?us-ascii?Q?yVrlaoueXoSFOfgl++sAp70qbPtVWEZGd5GxUHdvqRcWvcFyuwyPvZy35H7p?=
 =?us-ascii?Q?1a0Lnjz9Jnf7X9r50aokW84UMoCIB8pQtjsYzLa/IXKD2txSCDdd8g30972o?=
 =?us-ascii?Q?YxEAK+7p84RHHkJU+f3ISH59WGbmUJrJpzlaeTlTsUcRWJ26MeRgPpyvyQOG?=
 =?us-ascii?Q?2bWE+nk4dSTma3Tr6Iy3cmdmFhW7RCJuTWrXSvIzY9/buNQ6yiWKX2cK++if?=
 =?us-ascii?Q?Te0vsG6bWiSVlf/l+nOyxtTMr5K9NxI/EpQVdq5S1b0YYfAK5S130Gm/TrMO?=
 =?us-ascii?Q?RUovE2dsweZ/1LAJeFIBmf5jESQnGKbCXwADb3WliwlG8HM4JI10OKAyrScD?=
 =?us-ascii?Q?7QgYDkOSYNkmoV6vWRX8qlMXSb4P4Jo21OgBoLtbA82apjuxmKYrm0UnoCyP?=
 =?us-ascii?Q?59qFrBtqT2qRQYNp5Vs4AhN2gB2NFR60ecBTm4wxkxoWBI1ORl5NZzvOX8zH?=
 =?us-ascii?Q?0aJvMlf/rNTSqINVUzTwtNzPpSKtQxsUYQXHKu+6HemRWU5VRsZIs4iDgfmK?=
 =?us-ascii?Q?M8ddSRVStMbdEN/evH6Upc9aJlx/SypNED0ZDrZ1Nl4Jr9CYjP56a0JIvD4s?=
 =?us-ascii?Q?2TlOBqGAetEkZpZEA0uRHUexeQusGSf2HE7dq+/nsq5t9I0Xo+F4m5hCPWEn?=
 =?us-ascii?Q?p38PQY7YZn19h363uNg5o+2ah4uFzrbDh1iOKnnzAuUCzCCZEBZ4qdOPbRuV?=
 =?us-ascii?Q?X9kAmrLMXLSQYcjEkrcooh6+SqUF1ltFmP6GM0ee369ZslnuFeYMghtZrdmx?=
 =?us-ascii?Q?X/RX+zDHu6kbuyAKQeBXzuxUDVX3tM+uLPQCLNQUo62qHqQuiytl25oPymKT?=
 =?us-ascii?Q?zJ1PVoyNJTchajZ5Y54nyabPkisyPo7Ud2hLZMqLkYAqMvE5e6jw/F5oE/fp?=
 =?us-ascii?Q?XA8Jxf894RwWjRRXFlsAEZ1XKRYp8TYj11z9ePem?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14013850-7c64-4fd7-2183-08de1a6be726
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:47.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zZuXZYgQUNHNSHLSPynSUSO3BMAVimPxf+uBKSXI9hJj6l5mvfIrEDX2uSD3RoSntlL1pgV556jHxAVosiV3Q==
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
index 338d1695027f..475c6d9410c5 100644
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
+// SAFETY: GspInitDone is a zero-sized type with no bytes, therefore it
+// trivially has no uninitialized bytes.
+unsafe impl AsBytes for GspInitDone {}
+
+// SAFETY: GspInitDone is a zero-sized type with no bytes, therefore it
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
+            Ok(_) => break Ok(()),
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

