Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E253EC554B4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C5D10E7DB;
	Thu, 13 Nov 2025 01:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvngo93y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D35410E7CD;
 Thu, 13 Nov 2025 01:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoIdcA0Z3Nbo2vHntmEZccq+6aVvlb10q+YQr4OebikLNsRk+bn2TAILVgyGJVvp2Zr2R96Oc0qZeXZw+E3SQXkarcs2Sdvb+alwbMNXKvoqjLtzySBceyJJdUDoS+2muObd/wd04i7+1rpa+CEbokuXNTWRHHVQadq4arhR6wOvpANB1A0OaByAbT87/3MvWkHytYflhXIxNx0qI/fn4YdxpBLhS5KzJYIOMcBjxLFZv6PLs5QLS4ffgxfGHVEqRw2kizOB6E3Bg+sbE60eSWrAPtC906eYd9VBLaEeH8eQ3SYrIFgLpPE0+4I6dYSx8wQTo1l/DtGt3WHuFjgKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bwMd+KhsTnIdmUM2e7VbiT8BXRIPn013QJ41uoNMH4=;
 b=jX+tVbkiStCbtwbhlyI/uanFQumfOZsLo9qmJQgf5REpIeS7Q6vvlVFs3Wi3sth87RBwh3sfJUOyCgxPB7s+dIDwGhm2m2WFwnWmeBG8t+G/zLf+kw5ngIly4nsTnCDGQDbS7vwkmONOIyWQX2P/Igdf0NNckGyLHsRzZfNPwqOz/ecKwm7xLjgRyC0Mzl56uoPnOEPm1DOITk7VojFDDVnAHGfNrH4DbmS9K3y2fFTZ1N8QZBxM8MohoQChAYKKNZ2ETNYPmWrsyRQurjpn3XpbJZIN5OMkHpgOtQAX2jzdMgKr7CK45oDJLod5XchoWdiVpvJIw3afMhqpVd+riA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bwMd+KhsTnIdmUM2e7VbiT8BXRIPn013QJ41uoNMH4=;
 b=hvngo93ycE4eW2xgW6jHFODUXqRo9+b9LTsw5BsXX+bKkTHbizzQO/O17PSo2NbxBsNa6DawOu17jnJfl4R0umMdqxmLKOZ0zFq61zquoOBi00LZ6lORizyEUqFu4SBbNQ2tBia1/Ao15nxc653Cfq/+7giaY6PU/aaW6UKT/qgmd590fHHNCb/ZiJaIByIz1hMvVdaLJ0FqnakIEKFzpl5k6csyeXY14/fvQEuisUqVS3YukzMGKuhcUrNypGMxdPwt6UnUFU3kTyQ/gSNzdqq157AJHbJ6XpeprFyYZ5Uw/HLNp9XGNGjSgY233t6bt0B3eFjERtocUkTFeMFroQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 01:41:34 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:34 +0000
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
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 07/13] gpu: nova-core: Implement the GSP sequencer
Date: Wed, 12 Nov 2025 20:41:13 -0500
Message-Id: <20251113014119.1286886-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::28) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 59051e33-947e-48fd-d413-08de2255c707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bU3XH2uASIlvLWjriHwibIrwQNYza/KPqlciAPhJ6+H8yvw+fehDgynvE/9y?=
 =?us-ascii?Q?ycKPcefCw0eSyosWieb8GyxTENwMCWJGBA11jFD3wPcQ7uNXhqvjcdQvIndK?=
 =?us-ascii?Q?42dPQ31KIld0sgkJyb+S+kqGd9K23J0fzYFFjFLbL4M6LOYjg5ws8nUNzO44?=
 =?us-ascii?Q?vfd75ABfw3jPa2VhflcexZbiveDgS/KLHd6+h1me8Hh8prWvCS5WCh5l3D6e?=
 =?us-ascii?Q?GMup2CT6Z5AbGgnsCpFjwXB+yo/2LJjRAc5Mhm/Vr0AExCsAFXYdrxtIpICr?=
 =?us-ascii?Q?baVQNfV4ZwMu3pIJj8/TK4RoIXCFXiOGpwKgAhgJKQRVxcWY2f6GzKFSlTzS?=
 =?us-ascii?Q?MP5EVD0lNZDY6/OuRx25aG2/N+4n57yLmxk2GMUbXFMXOZlnzV/s5rdCVK9H?=
 =?us-ascii?Q?F7eaLFyGI2fiGovwktakb/NQzSev/vPyJYQyk+v+gJX1/THfmdQvlydLEehq?=
 =?us-ascii?Q?8NP8S1Kn5+UWUlmeaUnAnN+ZtYZQZ5DybJtOZ5sglwQVbRypG+th/p2NJRJI?=
 =?us-ascii?Q?Pa4++MqGDmuIxE5kU/8f9cQrvO+HvEG1yIomXYYQ95rIS7QNqHMrOUT5KT3e?=
 =?us-ascii?Q?XDQXGKsV01TiV+KomXS1q94v/WTc8nN2S7bq4pcggrL7lpvGdBXui/855fEN?=
 =?us-ascii?Q?1T8iQqNCgtwU2ZdxPyH+ealvjKivSTk2uJ1LKOIGxd7oixPazUY3LrEMtINK?=
 =?us-ascii?Q?drjmK9SkQaWyHp7IFrEN8OTzgqnhrME9jz2kXppv8lmdbuGhxztGWy/sQqMV?=
 =?us-ascii?Q?e0h9kjLHSNISy2Xb/sC3dEnZUgqEweidsCRPRptyC5o8dGIkrJhZr5pf4lPS?=
 =?us-ascii?Q?FgYcYpWYeyaGevwA57d4lCrAw8o+6dVvVsshROrT4e6LY9M2p2j8A6AsAe0Y?=
 =?us-ascii?Q?2EVX1sWjCDt2jTpa4YNOMmb65PAA5woEBLzfJkntmCmta3M4UQATcWDYQD4e?=
 =?us-ascii?Q?0NP+KRUs3bhBC3cpyST4arLeIXv3kI3v6kWF+SclKwUYqc2rhic/NJS2wfoG?=
 =?us-ascii?Q?mtdd56WOVgpyrDDkS+ls7iarBJYE8JlffWu78UB9O0cuxTzCP0pZI6dWgaBS?=
 =?us-ascii?Q?aGhfEM5+Yu6gbUwjECr1rXgOkdabCWkgYdVwRYdWlhOSF0qkDP1bz9J9QVeS?=
 =?us-ascii?Q?2FR0zMMOj0O5Cb2Hp/2PDGyTq1gUJo1BUssF59YIF4KXS7vbMcsm1g+H6Akp?=
 =?us-ascii?Q?M9hWHi+zOKGdqnNa8ByzCAfTvyiiRsz2pNJYTvmYJtF4eNBhn5YPidyU8jvR?=
 =?us-ascii?Q?zIB6K1NLqJ/FxZd2RkPG4ypEr6npX3JEqGRmqjuH131Q1KcQE5/pUhWnpHs5?=
 =?us-ascii?Q?SbmDvcvjRb0+Tcam4ElaXrrMJYLU9CtHPlN9pHZQeWc+okfWX/IoQBVEN2sQ?=
 =?us-ascii?Q?7pGsX8JhehwFMAuhYAUW2ZtX+hJfzMkBrSEQE1fvyrjPgJ1b+CWFPNgqx0gt?=
 =?us-ascii?Q?6OGgBG6N0IcDyCl1vYSFMiJm5pA6CuII?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kyfGDq0UqfGrspMNbCNxF2secWr7y+kgxMvrqGDdnD5tMrQ3BRroZ0Tg+n/S?=
 =?us-ascii?Q?CPTwzYylitmVllw2rCx3Wca5ETmtS4oH7Nyqn1bhKQMqAr/l66PIWAfalexS?=
 =?us-ascii?Q?e6onRpsuAGwGYgCN1g7QAosDgoEkGExwVo46Jgt2hC4eMY9S0tOo/0owzIpD?=
 =?us-ascii?Q?0XDaiS+nSPzywWkyDFadzI6xYUIvIXEfHYnO+b1P3oevYVOo+qVoFlR2rE1o?=
 =?us-ascii?Q?t9p+PPUd332hBLU9LsfMuHI+4ibr6QLDgcgdmD88OXlSvqy2f28nmjd+b5L2?=
 =?us-ascii?Q?b3evuvfkrzs+JvCWyyRtUKUhGRRUT09zHjpKXUt9DoPKqkhfEUeyGQYV7u5D?=
 =?us-ascii?Q?Eh+LfqBai+kP3rd/t3tQLXf+wmRCQnp4EQhca2/x0Wr/uWPIMgSCBbdLi56K?=
 =?us-ascii?Q?uYeroOg7ydV4BaQUjBiOVNorF0/EzENHjrsaoNCyIFia5XMkUryXzFjMJe8u?=
 =?us-ascii?Q?bA+2sIUr5X4BzwzvtBm/ygg7XRGHNop+VCDOgYM5J/XkJ5aj4dnDF88eG04x?=
 =?us-ascii?Q?HD10VJSc3g8hKWJIO9pbx2dxYVfnCCgxMno3X3PkePzX0WZdPEmb6AWdrhAZ?=
 =?us-ascii?Q?ywQSx6qNwMkXQnvZby9LBhmEPx5ZMrudWuYyHH1mllNZQGOkDIjGSgIKHXqU?=
 =?us-ascii?Q?XCdCg8bB4DizRuTyUSZ736ai+9NrN9UTd22tV4bVURFj5IhHMRN+G9C4KnaW?=
 =?us-ascii?Q?0ktEMZRJtzC1We1kLw2nsD0gq+Isl27vcUcswy0B1AcxXQ3rn80OoMgtD3Of?=
 =?us-ascii?Q?WzNXyzuuZXm2eKhxNGIagIgTWjQI/wvijImFToJnztcYY+f3elzhM9+8fNYO?=
 =?us-ascii?Q?q2WEC6PSmLFKutRRp0k2if1zaGviaSLh7FRQBgaIuep0S/uyvg+pxiBO+F0N?=
 =?us-ascii?Q?w/OQJhoBZ7kDnyVNnNThwoXkkBLa2uXnNQlR8hMk7pnQdvDh/ZHQY/3C6nlV?=
 =?us-ascii?Q?hYrA11ouKIFm9R4HV7v+V/4Ap7wr1bPaw1Wyrgm7MUd0itkkeVwv9YwIob1M?=
 =?us-ascii?Q?rB+qQKn0gWeAfcyLWXhhyppU0Eu8fH6XfItxyAkRxO7WmSF9ahy7ZO9fNjG2?=
 =?us-ascii?Q?o7XfjK6T1eb9Uj9ICjLy4fFPnrDE9ViPeqUy4KzfZBoJCuoyQTTT6ozaUwdW?=
 =?us-ascii?Q?uHA7lOMoNDc5NnrRF+Tidae7dPRjPJpTqyl61H2yAZO/2Wn5fNCPMtr/seKq?=
 =?us-ascii?Q?M8ekg7KAoAqck5BX/ySQfvrsQQxJUiO6gmsHpcFqsP3Ibv8DbffgjopdYN20?=
 =?us-ascii?Q?O/MDlkqzFz03veanZY5wQGUpFdzPgGKymCBsnGD1uwBaFqEZ/SOy1NbODinn?=
 =?us-ascii?Q?2CKCNQVQ7nhl8mYBS+XWP0t3vvZj+V95oHow6eS39A64FbxybM/Mu7GLAUkp?=
 =?us-ascii?Q?1tL/YLMh4wuUz+ZUqvcpCr+rLwaDn8FYUQ3T1gCPhAYDuIe8mShVy8X1eHEp?=
 =?us-ascii?Q?eA8lJoNa2b3djgUO8bGsXKTT4H9tPeSrvDwHwYf87XDO09JsqiiMqB9ZnJg/?=
 =?us-ascii?Q?9eyb+6AWb5zO90k6e/PFXR+eWwBVGTbjUXY91UxFe08vjnWe70GuMNLhyX8n?=
 =?us-ascii?Q?MaaKO30pkOHZFPknWdaleQ+g+9xwIaOvWncWGGSd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59051e33-947e-48fd-d413-08de2255c707
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:34.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVnB8zG+rImm9xbF76VF5atFeLMbiGhrICIgDgyC8b16CVsaNOtRfA93rHB40WJy/0Nftxs7bKqJZuS5z+nxZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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
 drivers/gpu/nova-core/gsp/boot.rs      |  15 ++
 drivers/gpu/nova-core/gsp/cmdq.rs      |   1 -
 drivers/gpu/nova-core/gsp/fw.rs        |   1 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 251 +++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs       |   1 -
 6 files changed, 267 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index e40354c47608..fb6f74797178 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,6 +17,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod sequencer;
 
 pub(crate) use fw::{
     GspFwWprMeta,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index eb0ee4f66f0c..e9be10374c51 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -33,6 +33,10 @@
     gpu::Chipset,
     gsp::{
         commands,
+        sequencer::{
+            GspSequencer,
+            GspSequencerParams, //
+        },
         GspFwWprMeta, //
     },
     regs,
@@ -221,6 +225,17 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
+        // Create and run the GSP sequencer.
+        let seq_params = GspSequencerParams {
+            bootloader_app_version: gsp_fw.bootloader.app_version,
+            libos_dma_handle: libos_handle,
+            gsp_falcon,
+            sec2_falcon,
+            dev: pdev.as_ref().into(),
+            bar,
+        };
+        GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c0f3218f2980..6f946d14868a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -645,7 +645,6 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
     /// - `EINVAL` if the function of the message was unrecognized.
-    #[expect(unused)]
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 05add7cfca44..bca89f3969d4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -624,7 +624,6 @@ unsafe impl AsBytes for SequencerBufferCmd {}
 #[repr(transparent)]
 pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
 
-#[expect(unused)]
 impl RunCpuSequencer {
     /// Returns the command index.
     pub(crate) fn cmd_index(&self) -> u32 {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
new file mode 100644
index 000000000000..de0a7137dcdc
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP Sequencer implementation for pre-Hopper GSP boot sequence.
+//!
+//! The sequencer is an interpreter that executes instructions on the CPU to perform operations
+//! on behalf of the GSP firmware. GSP firmware sends a sequence of opcodes, some of them with
+//! payloads, and expects the CPU to perform these operations in order.
+//!
+//! The main reason for a sequencer stage on pre-Hopper GSP-enabled GPUs is that there is a need
+//! to run an HS (High Secure) binary on the GSP. However, the GSP is already running GSP-RM
+//! firmware in LS (Low Secure) mode. There is no one but the CPU that can load the HS binary on
+//! the GSP due to root-of-trust establishment.
+//!
+//! First the GSP (still in LS mode) sends the sequence of instructions to the CPU via RPC. Then
+//! the  CPU sequencer executes these instructions. This causes the GSP to switch to HS mode,
+//! execute this binary, and switch GSP back to running GSP-RM (LS mode).
+//!
+//! For Hopper and later, the sequencer is avoided by an additional dedicated controller.
+
+use core::{
+    array,
+    mem::size_of, //
+};
+
+use kernel::{
+    device,
+    prelude::*,
+    time::Delta,
+    transmute::FromBytes,
+    types::ARef, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        gsp::Gsp,
+        sec2::Sec2,
+        Falcon, //
+    },
+    gsp::{
+        cmdq::{
+            Cmdq,
+            MessageFromGsp, //
+        },
+        fw,
+    },
+    sbuffer::SBufferIter,
+};
+
+impl MessageFromGsp for GspSequencerInfo {
+    const FUNCTION: fw::MsgFunction = fw::MsgFunction::GspRunCpuSequencer;
+    type InitError = Error;
+    type Message = fw::RunCpuSequencer;
+
+    fn read(
+        msg: &Self::Message,
+        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        let cmd_data = sbuffer.flush_into_kvec(GFP_KERNEL)?;
+        Ok(GspSequencerInfo {
+            cmd_index: msg.cmd_index(),
+            cmd_data,
+        })
+    }
+}
+
+const CMD_SIZE: usize = size_of::<fw::SequencerBufferCmd>();
+
+/// GSP Sequencer information containing the command sequence and data.
+struct GspSequencerInfo {
+    /// Current command index for error reporting.
+    cmd_index: u32,
+    /// Command data buffer containing the sequence of commands.
+    cmd_data: KVec<u8>,
+}
+
+/// GSP Sequencer Command types with payload data.
+/// Commands have an opcode and an opcode-dependent struct.
+#[allow(dead_code)]
+pub(crate) enum GspSeqCmd {}
+
+impl GspSeqCmd {
+    /// Creates a new `GspSeqCmd` from raw data returning the command and its size in bytes.
+    pub(crate) fn new(data: &[u8], _dev: &device::Device) -> Result<(Self, usize)> {
+        let _fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
+        let _opcode_size = core::mem::size_of::<u32>();
+
+        // NOTE: At this commit, NO opcodes exist yet, so just return error.
+        // Later commits will add match arms here.
+        Err(EINVAL)
+    }
+}
+
+/// GSP Sequencer for executing firmware commands during boot.
+#[expect(dead_code)]
+pub(crate) struct GspSequencer<'a> {
+    /// Sequencer information with command data.
+    seq_info: GspSequencerInfo,
+    /// `Bar0` for register access.
+    bar: &'a Bar0,
+    /// SEC2 falcon for core operations.
+    sec2_falcon: &'a Falcon<Sec2>,
+    /// GSP falcon for core operations.
+    gsp_falcon: &'a Falcon<Gsp>,
+    /// LibOS DMA handle address.
+    libos_dma_handle: u64,
+    /// Bootloader application version.
+    bootloader_app_version: u32,
+    /// Device for logging.
+    dev: ARef<device::Device>,
+}
+
+/// Trait for running sequencer commands.
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
+/// Iterator over GSP sequencer commands.
+pub(crate) struct GspSeqIter<'a> {
+    /// Command data buffer.
+    cmd_data: &'a [u8],
+    /// Current position in the buffer.
+    current_offset: usize,
+    /// Total number of commands to process.
+    total_cmds: u32,
+    /// Number of commands processed so far.
+    cmds_processed: u32,
+    /// Device for logging.
+    dev: ARef<device::Device>,
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
+        if self.current_offset + core::mem::size_of::<u32>() > self.cmd_data.len() {
+            return Some(Err(EIO));
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
+        let cmd_result = GspSeqCmd::new(&buffer, &self.dev);
+
+        cmd_result.map_or_else(
+            |_err| {
+                dev_err!(self.dev, "Error parsing command at offset {}", offset);
+                None
+            },
+            |(cmd, size)| {
+                self.current_offset += size;
+                self.cmds_processed += 1;
+                Some(Ok(cmd))
+            },
+        )
+    }
+}
+
+impl<'a> GspSequencer<'a> {
+    fn iter(&self) -> GspSeqIter<'_> {
+        let cmd_data = self.seq_info.cmd_data.as_slice();
+
+        GspSeqIter {
+            cmd_data,
+            current_offset: 0,
+            total_cmds: self.seq_info.cmd_index,
+            cmds_processed: 0,
+            dev: self.dev.clone(),
+        }
+    }
+}
+
+/// Parameters for running the GSP sequencer.
+pub(crate) struct GspSequencerParams<'a> {
+    /// Bootloader application version.
+    pub(crate) bootloader_app_version: u32,
+    /// LibOS DMA handle address.
+    pub(crate) libos_dma_handle: u64,
+    /// GSP falcon for core operations.
+    pub(crate) gsp_falcon: &'a Falcon<Gsp>,
+    /// SEC2 falcon for core operations.
+    pub(crate) sec2_falcon: &'a Falcon<Sec2>,
+    /// Device for logging.
+    pub(crate) dev: ARef<device::Device>,
+    /// BAR0 for register access.
+    pub(crate) bar: &'a Bar0,
+}
+
+impl<'a> GspSequencer<'a> {
+    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>, timeout: Delta) -> Result {
+        let seq_info = loop {
+            match cmdq.receive_msg::<GspSequencerInfo>(timeout) {
+                Ok(seq_info) => break seq_info,
+                Err(ERANGE) => continue,
+                Err(e) => return Err(e),
+            }
+        };
+
+        let sequencer = GspSequencer {
+            seq_info,
+            bar: params.bar,
+            sec2_falcon: params.sec2_falcon,
+            gsp_falcon: params.gsp_falcon,
+            libos_dma_handle: params.libos_dma_handle,
+            bootloader_app_version: params.bootloader_app_version,
+            dev: params.dev,
+        };
+
+        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands");
+
+        for cmd_result in sequencer.iter() {
+            match cmd_result {
+                Ok(cmd) => cmd.run(&sequencer)?,
+                Err(e) => {
+                    dev_err!(
+                        sequencer.dev,
+                        "Error running command at index {}",
+                        sequencer.seq_info.cmd_index
+                    );
+                    return Err(e);
+                }
+            }
+        }
+
+        dev_dbg!(
+            sequencer.dev,
+            "CPU Sequencer commands completed successfully"
+        );
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 7a5947b8be19..64758b7fae56 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -168,7 +168,6 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
     /// Read all the remaining data into a [`KVec`].
     ///
     /// `self` will be empty after this operation.
-    #[expect(unused)]
     pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
         let mut buf = KVec::<u8>::new();
 
-- 
2.34.1

