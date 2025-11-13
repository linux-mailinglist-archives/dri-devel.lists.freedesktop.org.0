Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3823C554CC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2C10E7DA;
	Thu, 13 Nov 2025 01:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O77MT/Qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFFC10E7CF;
 Thu, 13 Nov 2025 01:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oe2NeSu566Fd4mMXuXaaZacM9N9mVujU/Av0KFMC4L6M6vGxHFNyRt+qKmZbfALDkqyHyNIYD+8Sq+s+B2+qQ8Fpp67+3XchGnixx2M4hUOEkx7qh9SQ8NgPgodhVIzgEzmxWE89Nuy+0qHDrqEOkcskLCnG4mhhIfMjzLBcn/MAJZDkS0OfxC/rGf6Esd0k4Yx0dMV/oK9gsEZMbK1BXNEEycOOmn6MquM3Q/NLtxFGenN7NbMxnYZJyt5yeusAbQYH/thhPeOdLrnl7BEoIj+Bfi7PMG1Y991YVsxf8AzTzYFu4gQKIK1iYo0e8ydUvCQiFQJpeyGC4fxm6w5o1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp00N5dClxG538EfaYlg41mNFkmIdIxdw0IBM26edZU=;
 b=Pd2cQ469R9uraYXCvYaHPIaexT90jhFQY4uYm7CHUKivJIf74euCis24l/Bs1ENKwfqNlzvG7vz9iwrm6uZWAxieb3sUGQmOjvCqQjkqg9r30oU4jgFHqN46MNTHu8yBbJHpSOVUqB6p15B0q695HGVZqs9Se0vqPlikqVGKIE3Pak/VqSl9UqFvt5J+sudBSRlZVStrSdzfI5H0PubN5LZ4xJA6V1/xXVTm2+B6+qI6Jm4VRZ7e/QoAirz6iwXVpCa/8K+rIjok/wPPpkUkqj2zOLahFptZIRPeEL8HmY7IHGl2eZ5fThGRgkFguZcqNZ17A8SeL4+LRPVPncc6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp00N5dClxG538EfaYlg41mNFkmIdIxdw0IBM26edZU=;
 b=O77MT/QsfHSA1JNm41sVjF9XDmMQ4BUeh/OdpbFVAOGkNE3GywgArYsH7zulnjDap276DXcyFL6wUZ84HpMiOXqN6Lagwg69y44hjcVKeg6kpNwVxrg0XBvYemDGhq3eIfOr5htaSrneMrF3VyrKIKD3hfDdp8jMvzA938RtY31J9odlIn5wSkfVYA93fJJd5UiVnLtyOJh9N0R8EtVaal86QZEsPGneTPAGaFeU9nMIcr+ysVCwa1nWDd1X/EDk1ThIMHBJS5ZW15Dn98YCbb6f4aXDb8wFpo6G4y2YC+arm+bkGFJ1qnsvOMGVGykmACqc6sUI47hUqXWc6kr5tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:42 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:42 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 12/13] gpu: nova-core: gsp: Wait for gsp initialization to
 complete
Date: Wed, 12 Nov 2025 20:41:18 -0500
Message-Id: <20251113014119.1286886-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::19) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fa815f-e274-47fd-e948-08de2255cbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f1yOYKSd2cH+OanzDSa1evnmxFJLn8V8PRvF9wpvLubEQA6VnmpvGweumK8s?=
 =?us-ascii?Q?mU0ltlyBpW8T50gOREBB6i5PJAGo2h/HurE3KAlwmCdlvGxr4LYKl+FiQ3JZ?=
 =?us-ascii?Q?dR4rdUKuNCmTXJ+o3fo3+yeFA5t9aQ1wJk1h8Nz1sd9LSJQcg6Ebu36KKegq?=
 =?us-ascii?Q?5fY0n6qN880VqdR6qVMLDCWHWKKqgsVJ2hgxOHgqZNoHVTa54GsaeOzy8EEE?=
 =?us-ascii?Q?5lcAa3NfhXRjqgrRLZF8B2d42c5xH91C1qVlHl9O7HkkDaE9fuAwyWZbzdhq?=
 =?us-ascii?Q?Di3pyvD+nEsLDKqlone/g0HuyY2cNhzeOJa+NrZSRiWHc4Bnpj7vGdWEb7MW?=
 =?us-ascii?Q?0quHmWHZcT1/BkJX6i7xR8Yf2qLLk3+umLMH7Y6h4nx9X4G25WWnP6bZNvY/?=
 =?us-ascii?Q?FAERbATNipQ2m+W5+c9dxTWU4VdodKGN1oo8yEdbCsKbTRKEWP7FMcKsmOgt?=
 =?us-ascii?Q?xB+aXxCPFoO9bLpFKmBDmGdDlieAUaGqvEcNQNJbvGyOVowSteP+LnCghQoy?=
 =?us-ascii?Q?OBjsAK0Yjyl6lrYv8WJbFZ5M48U7mDHG2k6HkvMGcHzJVBLEK1KarODjOO1b?=
 =?us-ascii?Q?u1AmeeCZTMLlXSOz23nWCey4ETpwcKF/JaUthFpjB2fe3nPa8Jqke841UxBC?=
 =?us-ascii?Q?krRHGShbOZAalVyeSuwffb94iv2YCtS8OP215N0IkARpwVdPO2L/PjaWO2v8?=
 =?us-ascii?Q?1oyy9Xn3aA58Mvf0ovcyqWUDs/93doSX56labR37b/SNyj3r7SoCqa+8yrcj?=
 =?us-ascii?Q?gmSaibF8PrqW/tRc3G4FABHP/54VJV7dpS3TQgR1II45eTIFHBPrwB+Kz7ez?=
 =?us-ascii?Q?AhPbxt3vSR5K9gg6rHBIxPotUM+2lVc5J/4TrLvmsMeqNKJ/YlL7QisqSCgH?=
 =?us-ascii?Q?YE4KhKM0Qj1odKlaOP7La0aU7zH5z6n7fcsgd32Fc5SUQa5qQbM9aPtUB72m?=
 =?us-ascii?Q?BKPDIPPOff43CONUO0ZfXa/hp5RPVtLfo8X134kUMnVCUGnUzWcCGnVZ5M6x?=
 =?us-ascii?Q?6WkbI5XdodiO9ZwX43mo61TaOr0DPxHvmUSrGU9QmgtKv79YS9IuqYmmhd/h?=
 =?us-ascii?Q?z3xHQPeEwAaSDJGB8cWdbDPQGQZqwiJZ4swUaBvGFW7FNsv31toWSVs6a/jZ?=
 =?us-ascii?Q?S2I+wrOyf8hR0kA8vF2aUAg6rrnd+SwmgWzGvw9dEjcNqPwvDvNh+82TUbRR?=
 =?us-ascii?Q?pdvwYw+kauabFnwCndSh9Pv1aqxKYhcsx0/oV/JH6CmYnbeixGBfCBH2ecOS?=
 =?us-ascii?Q?E4aFCN5OEkBZhvDudf7MonNSsGd0+5hU1S4haGBJGVJBLpc526LWyznYJ8wF?=
 =?us-ascii?Q?OTNY862MJX5Vo2xMlyGVmbN7PIcSpAVCzMGOCYUxF8SHx9J2Txcxoe7ef091?=
 =?us-ascii?Q?9c9cvGDPz848F/LeGL4hozR1Vfb/bjVFUSvdRbIkgx90qhflWdsLfN7acdH+?=
 =?us-ascii?Q?KOEg6/Wu8PIUHOt9XQgD1JkdvkP1wemH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2U3o7Ty5rvy9n2Kjg1Wq96VBMDd8n8/hH35Ku61O1iXIf27JflxB+87zoIG/?=
 =?us-ascii?Q?PUzZytcpZGD02/4jbiuh8j6FogGAQ8WIqEEQRuWFERdWb8vQ8DBRjkQFLqhu?=
 =?us-ascii?Q?6T1aw2XyABRNe7CoATNrUadZSAXLA7Gbq2n4FMIQMqdxbzTLQ4xo80OqsvwX?=
 =?us-ascii?Q?0nUB2sr1oOpxRbjey7T0DbVyhtl6DdJDAZmNy6aWhnLyTnM99zPdMHAy9Jsz?=
 =?us-ascii?Q?VrP11//kYYROu0RKEMHu55ovmK2EfD31NV9wFZAAAqxiZkZmjgEJUoZil4pq?=
 =?us-ascii?Q?SGtaA2ROlCXO0kLk/ohizY1vWazgigK0frAKsG6wTFe7oUeK52Vh5zmaoNI6?=
 =?us-ascii?Q?l5IRw1z//oorhzS/MKC3jLYksJCBj8Pm/qu9r5v2pmgzc+3JA+YBikLSrF3t?=
 =?us-ascii?Q?vgZRpRHt3tSPLUDRm/4AJo1qrAgG+eR+k4oAf/XQc042tRT7X03cs550f+u9?=
 =?us-ascii?Q?Bps1MqFTeRB/ouqJjmtXstldTf4WQM9mIWalpey0EkPKitCUn8lWqsTTs8DS?=
 =?us-ascii?Q?jlqmJDfv8lLnQIRW+B9EdeT/8YSf1o9+FAraaEs7vAQVMWB9bVDgu+Zc3xag?=
 =?us-ascii?Q?XD0xgXoPWUx75gV06jBT8Q8JMdmMqSLeNAIai2X1ZNRy153u0PmEEvDQ51kj?=
 =?us-ascii?Q?sWqdAhfA8o15HXNsrzRdKm0nirCHWVIi5kzXhmxJzl0nOGJJeL9imcKI0RTc?=
 =?us-ascii?Q?UX+cVkNkvIkkRPGyW8XlPiRu1HK8OS8ouZa59CvFFQvJUCO/R904ximnnnkx?=
 =?us-ascii?Q?gbb/413wvKistha13t3yHFFYQjERPMV8IhQMCV8vrMRWn3nJeiXuVbDPKS5N?=
 =?us-ascii?Q?Io+Qql+9q8GhOd/CK+emPMIiWD8jtsNMcdvPgoQp8O79N5PVLd0hokL8pPtE?=
 =?us-ascii?Q?DQ2Tl/ROo+jn0PvpJMUedfool0ArZkSZ9mjI/bWBNnSJFE7YDZ7dSVDcL4V2?=
 =?us-ascii?Q?C/8Pty74B0pkHUKn89mPhtvBYV4fRnHgnwCQfvnOQB0n+wQdvcLjmYH80EWO?=
 =?us-ascii?Q?Bad7DZ+GjWAOsduCdXQQjqyQOpBSR09VwN/nBLjTDh6dTYDEVlD6H64Hx3K0?=
 =?us-ascii?Q?7fHlE2sILfWfimXaK2cWr0P/t76v881WpbCONdocBtKFr05xVkcOpdnFs9/W?=
 =?us-ascii?Q?LJUDNxAMbGRP51m67F2HCBxX7hwzD/EU7yxmSi5MwugFCk7+zIBtqZT5mgHi?=
 =?us-ascii?Q?5B38PkGjwD08U5Lg6JUqJsHf01N6RtTKlLPecGasmcBvFmnyNQH35DGzFu16?=
 =?us-ascii?Q?KfTOFdQapDIxsMUisv/p6sVEKw3K9Kl/VYNP/5Tz091qLs8eS/oeSBouvPna?=
 =?us-ascii?Q?yFVMLzXKN5TUDetCTyiF8T3xrV2fvPUtSWcC+Nslmygq79FjsW2vO8yeirNB?=
 =?us-ascii?Q?ZfNttiIZoo+iAm782KUP6wE14ybz9obfoaeVyRmR6CHbdvcW31RZh3Fjf7RD?=
 =?us-ascii?Q?bC2bvunvDOSFerO5D9Ib7KkMzhPJKHcea14yS64q7b+/jApnYRZIKyFP7sTm?=
 =?us-ascii?Q?o0vVYXfmN/1eQ6mlMzw91WseEvgBWSOVt53xU/Uo5zJr7apb5GQM8AlILJN7?=
 =?us-ascii?Q?KA0r0y71PFct6B625Oksbpxa5XmdS4p5SyIF702g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fa815f-e274-47fd-e948-08de2255cbd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:42.1926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCijXmZeAg79qUz80ExUKbp1LghltXxn42XBg5Xaw9dBHjgzIshtZX1IV9O4rLU7sPBX2keZ9Oq+t+MLEdazJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 ++
 drivers/gpu/nova-core/gsp/commands.rs | 48 +++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e9be10374c51..c0afafbf35f6 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -236,6 +236,8 @@ pub(crate) fn boot(
         };
         GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
 
+        commands::gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d5be3bf10684..07abfb54f9d7 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -1,17 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::convert::Infallible;
+use core::{
+    array,
+    convert::Infallible, //
+};
 
 use kernel::{
     device,
     pci,
     prelude::*,
-    transmute::AsBytes, //
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 
 use crate::{
     gsp::{
-        cmdq::CommandToGsp,
+        cmdq::{
+            Cmdq,
+            CommandToGsp,
+            MessageFromGsp, //
+        },
         fw::{
             commands::*,
             MsgFunction, //
@@ -20,6 +31,37 @@
     sbuffer::SBufferIter,
 };
 
+/// Message type for GSP initialization done notification.
+struct GspInitDone {}
+
+// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
+// trivially has no uninitialized bytes.
+unsafe impl FromBytes for GspInitDone {}
+
+impl MessageFromGsp for GspInitDone {
+    const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
+    type InitError = Infallible;
+    type Message = GspInitDone;
+
+    fn read(
+        _msg: &Self::Message,
+        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        Ok(GspInitDone {})
+    }
+}
+
+/// Waits for GSP initialization to complete.
+pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
+    loop {
+        match cmdq.receive_msg::<GspInitDone>(timeout) {
+            Ok(_) => break Ok(()),
+            Err(ERANGE) => continue,
+            Err(e) => break Err(e),
+        }
+    }
+}
+
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
-- 
2.34.1

