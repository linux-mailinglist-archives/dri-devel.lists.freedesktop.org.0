Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7CC3DC26
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B70410EA05;
	Thu,  6 Nov 2025 23:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j1L8JjC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3646510E9ED;
 Thu,  6 Nov 2025 23:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THDk8qTCNtl3wnJ078RmFvMJQ5WfMoEU05gPRvNxQrNliTsGdy0NVrWo9LmeKC66vl7Iz3Jwkcv0Vep7stk+OtBphvD3F+lLK7FNNwojvmZaNPzrPXyccg4mME8Jkbr6dLuVZ0X/ofnFVS8SuWont9A8ZSfnuZlluf8GSNzoWcBvBcKHRmeSMMc2Rv6dW4nEvtMq7yZGhmLZP8srFIvaTpgGZFZF0Zp5yOEEG+gFkt3zXInL2iAyne1mqHhg2Uyu3sB/yR6BhErL7aRd32BE1wZdyY6SsflM4zOA54QZW4jUkFqcg9rkKD3zxRMuxN8JkXPfRj7C1cfJUMsXqdJ0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+6CZiEQUv6MUIO0TL68t28TCq58rxk7ss3oDq525/c=;
 b=kvub7IUfL26+kZohyXSKlkR4WTK8zQTfD0Eitck3ktU5T3G8v7WQRMqbf8/MU9TyfBrAPSk5dI3U6QUkczvAUNKk5NOM0DXF8HirDfZZNdDImpud3BEW+wPh9tuG+Fha18d9zvLdpFdQq3IH0HB2whDUh8FPIQgs4UIjUATLbz4OQ+cVq30nqrfAYH/jUbko1OcaHS5b3aVc/yIwEvG75mV/1uzJA0lBKkk1RRfAwQgM+VchtZ8983Q7FBrWwUnCgbltyROIaGTyp49HFMbAfb72epHKpp3Vxt7huWMGYLkRpQv6G1E0DjBtMgYCjqh1beugGnbKdgCkyMwvDxZLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+6CZiEQUv6MUIO0TL68t28TCq58rxk7ss3oDq525/c=;
 b=j1L8JjC7Ix6i0oJaxeR3FbzesxGzcmWNZ5jE23zpfpG4T6NlErkg81l9kpSiXdR48zGgPJuhUXy1gs5O0H+hf27Hc8GnMgAoLmm6IVwGEw+Cd1rUfAXvacz0fUnuw/SpweHswyaZAEzgSHAkH+T32csR0oLnukmauvpqtkXPCv3WxgdxvmZhqV7ki988LjJDmkTwQ8p+8XjBcA2ZaqMvBnQV2TDnpzzeyqztH8Xbdd9Rqqn3KmwgoBcSMc0R1OTBXVydK0m+6Hj4P71OC5/WiCQCI8DmRil5+T+9YvMLHuIcOa4IMDN/5LUiW0dZckFk+49qvqSqmnEKyPL1iNH88g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:07 +0000
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
Subject: [PATCH v3 07/14] gpu: nova-core: Implement the GSP sequencer
Date: Thu,  6 Nov 2025 18:11:46 -0500
Message-Id: <20251106231153.2925637-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:208:32f::12) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: b518b4d7-fdb8-4f0d-9c55-08de1d89e812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MuGkAIYWmrAnGR1ZNaKvio0/rcXPLLK25c4weAAMCY8ScfhJCDaqxDDKSSQb?=
 =?us-ascii?Q?x851fcqRVpcRIEqQHlhPGZ4NvhkwIme9DT8CT6kmk0g8MzljGAnzb/eKm36A?=
 =?us-ascii?Q?NQf8uanf4iMxi7FxFrxoY6SCMDOpy1ZJl+EWBSV9cWQdI840Tjr6fzjl/nTi?=
 =?us-ascii?Q?ZEfuy6uC4E+eOT7MDKG82CTD7CgKO71QJS2gxeIfFJezb4DCEYC9qFg9vcDk?=
 =?us-ascii?Q?1S+n8kB37moeUZ8hvUrYCDkOUZGSdtxfF5UQSDumzAcEOPdK5oyG7qN8na99?=
 =?us-ascii?Q?meYof9KoJKVtQ/KUXTiJ3zbqO+yqwv03bcUkKAbo3TQ585E9gto1ufNBZuYf?=
 =?us-ascii?Q?2po9zVvY2LIsscOcurVDROxvnqfTEQDAQckIpt0rId7vQxcw+Q/pCNOZgTck?=
 =?us-ascii?Q?a1CcRcRzeyrPzrcLlc7wDN/pkhGqli4qjjRU85/C62XQyhv1t0iur1HtTmfI?=
 =?us-ascii?Q?GX5+t6Ez//z69HMzW3RgAlierv9WaYnAOwhkPzGC+rjPhwpO0oCCVCwrd1JD?=
 =?us-ascii?Q?fMjkFhd4Uim4+d4ztEDw6SWl8U+OkAPrD3bUvIclkIBue4T+tErJkl+fHMGE?=
 =?us-ascii?Q?A6bJZsyPrV6L+Gog52Ejb+i1ipQl3sAmHJvWUwx7Ju4KIuAZF9tYciblWXaW?=
 =?us-ascii?Q?c6l/14R3Rc5bZmd8fEPFi23oNaOleH2blrLRP+EEDl2LzvTDwnsRRHdcivNC?=
 =?us-ascii?Q?kcmfn5O7B9xrd20ucq6p1AGGAcf43DiNOtFKiXy1H/CRCPuYrV5QLFWRlIm0?=
 =?us-ascii?Q?vaALJQp4bkNQZgBw90vUi96jeWg84O/rgwEe0KAZ+dufTztxD2mk+gf8g0Wz?=
 =?us-ascii?Q?xr3X3PWikT2Q0KIfBLvvxZG1NS9Uv/cKaM12JbEoh9jxwEILHW1efZJT91C/?=
 =?us-ascii?Q?uq+6tvhkdH9vB+n4ETvuy4aONJhNrDQEG9Y1L6MMa0e9EIZPhZXu5jv/E5LA?=
 =?us-ascii?Q?w3gKCZMsawXjzphPEPPAyCCHg37/eqTIcHLlacuZ6+Jh/6IrZHb7ls0aqO3U?=
 =?us-ascii?Q?2i3XR0OlCvcfE5iwLeceG2ms/a9qzqGmvfeRBCtrBdBeyd+FBwrtDDNKQtK7?=
 =?us-ascii?Q?gQ1loEkO0xnMBFxVxP5AlTeYPNumhmzoIrrkdhPDI0wFSztxfy981q9hFwPE?=
 =?us-ascii?Q?fieCw1YpRLFJ2WFBLym0pRefv0mZ+LR+/aFlPWq/J7atnd5A3YwE+L0eqQ5f?=
 =?us-ascii?Q?WFSsUOf0XxYpRbWYliru3bTFAbfCCNUP4zozT3rlcD9Fncqu2+THSnYWiUE8?=
 =?us-ascii?Q?QgI0GfrfYzeXqeUT6K2TLRzrBVp/vFg2bvGe8CR2uEPElbvv6TWOMRrExcg8?=
 =?us-ascii?Q?jeZHiggTNcpZmU8HJ3Df/Pi5Ge7rS/BjHFoy8ubz2ToQghrHm6TI1pumPPZ0?=
 =?us-ascii?Q?LVyc/qzTZfC0a1WTC0bHIEvwRXY48n/IuozPOwatw2YNUIAjhRyrzT988fD8?=
 =?us-ascii?Q?ZE7iPF65qOnRvEPhsgBMouCvVDOmakMy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuve3iuScvuyMeemQG9iyzrLG1zorReySvp77hdDnpZgIze1Sl1lJ2z9/DWV?=
 =?us-ascii?Q?KzcmbYzz5jBTyYZwxSY2gjjUIn4CWlVUqvvuEwhBX9Y9AGfKe8SXN4lKzRO4?=
 =?us-ascii?Q?zvMxnVy/Cf3nl7IjB18JGO68OQBm681MC5xDn5jjCvPYE7nLS+4SDJ+skuaq?=
 =?us-ascii?Q?ZuN1RVLq47Jl8Nbem/RlId9hLP6upNpwAuvp1/sBt6g89P+dDSvrtsCWwtDM?=
 =?us-ascii?Q?DrWbKYaTeUUsCBfACFjYJeAwJ6pFBKUkFzhOKZ0f7OsLCvWBR71kVDwBhJ9S?=
 =?us-ascii?Q?jwqn5ZjL99ksbI4On1+tYO4RJUkVnwIsNl+EYwn4TivijYpXoj8/ke1zIiLA?=
 =?us-ascii?Q?tl/0v1vRD3vB7/yb+pX+VRUHW5rJgcMY5UgVkLM0bqyCilnXppf8DfHbxh4p?=
 =?us-ascii?Q?0qmS0whLgYaJ7QEhYk1FoqFfB4WYOM9olSBadGwa3QA1dvznjooZDKiejSUU?=
 =?us-ascii?Q?0LeAeQ5TC+WWDBApg4YDXLwZtVx5GsffXK0SV2Ebbl+qapcjTpSuM5/yy3M6?=
 =?us-ascii?Q?an+EwHcZkV7cwzf8XGGr2Lk8R23aQIxG0RrdXrUWEp2tlcV4gt9FbXIEYHB6?=
 =?us-ascii?Q?eUkKaceKo90qHsMltigAPsNopYnXGLr5QWDULCoaPiIfabyO7a9sceG7rJLy?=
 =?us-ascii?Q?xD+0LNY+1qz2VxPUq2OwE5M6C29WgxRERZ17CvnQsj/Azh8vsgH0CB0Zwy+f?=
 =?us-ascii?Q?vz2ydfIT1CIT/Oaa5VukniH6fZMzALsONxBLNUaY7UiuBdvw+fZJu1OtsdoE?=
 =?us-ascii?Q?kSNO/aUvFSJI7knpO8W+7qc/e2rlRh+eE0crtiXNo0DjLmA6OsxBwmaSxDlc?=
 =?us-ascii?Q?3NNhRQsXlphVZe7N5070ggrbw15STsztsiVW8BQv3QmB8YQ72l6s1puj9KZl?=
 =?us-ascii?Q?mEOTThPrV/CDmvC4qTAnLZkKr2+iMrQ/s0o70sORDwNaBF86ieDe9FuDHyga?=
 =?us-ascii?Q?KuVzjHtgWKVH8fjvFnIsevA1rE9Obias64Fxvtv6Cu6krKoy6Vm9vhrAkh0L?=
 =?us-ascii?Q?EYYgPzmpKzoesTTMTQ1f0/5ySjHmkiLsNqGktPb9lEBd1CYVBxZmTmg/N+VQ?=
 =?us-ascii?Q?mn7kT1a5FSHY43VY7b/OxWoZ+30coaUFLx1bcAwon/N5vqS6c4asG0vmHsMi?=
 =?us-ascii?Q?wfFjVXRp8CBPU6/fGTdZugBCacLJ8mkN/5ZfwkxwJU3TKI71qHJE8KMy662u?=
 =?us-ascii?Q?PhzXw9fIBlI7DpVPelN1wc505C9Z9rIjBtWAGgaT2AeFSeeaxEcXNsVwjtmX?=
 =?us-ascii?Q?o62pqwzX/PtTOXrS/k61qJ92J3Kh83V4SbCAMrNBYi2fD+AQgODIqk/juOIG?=
 =?us-ascii?Q?XQiqVvZ8r7jAWjxzdrMTikI6iHFCHowyTrUd+/oS1fXSf8uccBdclW7qOmJp?=
 =?us-ascii?Q?HXMl4Y6s5JUJ398RdK6QdgYTc9Sm7tmNdWixyo83uQDaNOcz2xcqTX+BhICw?=
 =?us-ascii?Q?ETI9YCyyb4JhoFXGbjQYsEQhln5c0DflJq99We0TSWJYqA7twGtwDZEFvnQj?=
 =?us-ascii?Q?mZ64ZWAY4DS0WqNUcPozpb/TrpsKu+e8WQgNiGnH7e5pEiGFJ9F6mY93Cg03?=
 =?us-ascii?Q?gJ3UNYwNPfDUUXdfUo6N7tqts4zmC3vxPZi6zfcV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b518b4d7-fdb8-4f0d-9c55-08de1d89e812
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:07.5795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5xeUINw1f0fipsWXWU3ALEsFNACnNt+13CYSnaF8b00Z9WgLWA2y/QVZHU2/Uc+VwN71vQxiYRILM4FDWevag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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
 drivers/gpu/nova-core/gsp/sequencer.rs | 205 +++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs       |   1 -
 5 files changed, 224 insertions(+), 3 deletions(-)
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
index 000000000000..ee096c04d9eb
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -0,0 +1,205 @@
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
+            dev_err!(dev, "data is not enough for command");
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
+            dev_dbg!(params.dev, "Running CPU Sequencer commands");
+
+            for cmd_result in &sequencer {
+                match cmd_result {
+                    Ok(cmd) => cmd.run(&sequencer)?,
+                    Err(e) => {
+                        dev_err!(
+                            params.dev,
+                            "Error running command at index {}",
+                            sequencer.seq_info.info.cmdIndex
+                        );
+                        return Err(e);
+                    }
+                }
+            }
+
+            dev_dbg!(params.dev, "CPU Sequencer commands completed successfully");
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

