Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3821FC5F211
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFE410EB02;
	Fri, 14 Nov 2025 19:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8RhAYFe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B2110EAFE;
 Fri, 14 Nov 2025 19:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWMNGFZW22DAofVEwiXcT0CF0pmu135zUvxiq6peW/SbmXX/S7SF1YIuF9wDray8nwSdyQCNTVTE/cyW19WoDETqcxqdtCzbTd/kmoB9Uzm7HTqqNH3aVq7AcZAEWqlTZC89W6SSTTvOQjg4zZ3qOHAgvTPJ06Nw/b306gF457rXauZOnu1HdYl8QOgOankVPvLPw615lJWOdZ3LZ7pJLT1F8426rFuwzGHRuzkfN74IJ1rn4Uh5kbfzQ5xlQTfL5NONq6UBwCfi0yBWayWWt6AUyEywcg6Mc25fyak4QCQQCexThtxvfZIxkw7xktPDKYl+vGqJ9Epzyk7Cb1wWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgA+d3AoOJdY8dG/mxH1giFpIKgfJdF5aZi1e2oCYQk=;
 b=Ws2LDKBKWHTkDpZd9ErI4PkDKZyKvighKbyAEBeJtW1Bv6xbtrigmrXX2l4zbPqYkcyD90jC1loL94Ua/MoJTsPzUmD6bUvxNBWWcROgn68WuBQH8EFoAMdaTIyyzaN92XMIVGB9uKgdf9E0FEGOsO+PZXSKUg38MYZahlVen7OJ417OJlJ9W3QbaWwIJJA8izvFDqyjeVm9GDV1yz5ei1vE554RcUTSPNA1bQ52y5b6yWgqplW7TWNdiCtLLusTj/z7kDmfAYjtET44f59qQDf5R0QblWoZ85jM4WJlKbt4y/0I4xofB+ISB3v4o/STH1l5YAgJm2MgSpnAT5Jx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgA+d3AoOJdY8dG/mxH1giFpIKgfJdF5aZi1e2oCYQk=;
 b=N8RhAYFedAjrlG5eF8tYLTWTGdiF1RmJZpFSmLwWkfqgRVY7602bBxwm6Qf46McN44bigP/Mscj8/3OciZyLkQwvuwOtG1VGXaKTsYWx2U5OqfRdwGs9ftkLz+zTE47cC8BRZZ4ddD8EiEx0EZIUxoRwUYsXsHDeGxrZdgJ6WH+18USVkSNm3Dle/x2XcI+Dr/C3TrSZLayQ7sswCOk1Qvnp0+L+TxNBVuWgFCil0bqOkoIo7/uCLW89g4FofP1ESAsyM7Af/gUWM0zTYPQammS1V8bplI5uOzKro0aZIf6XrrUKVnoVILWJwU9LEn0rtsQ398aE8r3bJI3r3ZWJcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:11 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:11 +0000
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
Subject: [PATCH v5 09/13] gpu: nova-core: sequencer: Add delay opcode support
Date: Fri, 14 Nov 2025 14:55:48 -0500
Message-Id: <20251114195552.739371-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5d7128-7b55-427d-0d00-08de23b7dc1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OehD3lB/efkPoLJotvTvxVC6oeIzMwLOiPJ5zwpsV4LGSW3tiVvRSvXck8y2?=
 =?us-ascii?Q?8w3w5h5WZo4MuJCw0hz5JxGiG2E/R0+rIhCv2IhrKZbdmqrK5Igs3iI2n1V1?=
 =?us-ascii?Q?yeKkVRn1rpvVh2l8Lz0jC1Cjf5eO4HNRGm0cwXAaC53wvJ5yNDnqMb/SmU86?=
 =?us-ascii?Q?3dKgOhBOy+EwNEqNSkUvEto4buOs7UJU8qdJWVxLL5kqJ+BOwefTfJ+onw06?=
 =?us-ascii?Q?vr6L3UUnWWe/x3OCbfcDBIEZwC9ENOLbHV5gkQvuscgTTEiu/o1mdTNPbQV1?=
 =?us-ascii?Q?3HhC0UN7AAuAhPLBASERYFgIvoBO555M7nbXotTgMg9pwzCpWYKF3c69uy0n?=
 =?us-ascii?Q?tUO6bSM8YdKsRBHSM1f5WCohr3ZuZ3yDVcJTS2q5YgiZp4DIbbusex46oMMw?=
 =?us-ascii?Q?YCLEJqmsfiBQmtPZs4HrdPVsdoUNA52nPCceoOxO4BL1oXxvl58yB/qTiGOc?=
 =?us-ascii?Q?wtASViD6Ap8TtHyKMhdc6dBUBOuyAL1AUypJk7s6Nng/c3Y5vwh2rp0Md6uW?=
 =?us-ascii?Q?f4zHzkqm3gvMdEceeRWQDYkfJCkCo3a3PAU4+kcfiN++fzLtya9+jeByT51/?=
 =?us-ascii?Q?DurqwBBqML5JS5Umj5xnknTxsxDSmah06EidEB7RUmisAEL9vsHB8lzG2x2c?=
 =?us-ascii?Q?tqFPoZx2gS7uo7znRZSqjTlH6MC3PmVkI+t+Wyoq5oJ2p68Aik7Op/hwAtRt?=
 =?us-ascii?Q?SGIHZcubKU5Cj3wADullkRy1S5SVsLFLoQDHQqX6t4fcTKdtVPHm93cg5t4Q?=
 =?us-ascii?Q?pJR+rUNY8+v5L8UWCF/SUcJlGW1XzwtXw1EorJjMcq4Rm3dYoMFkixoc4y5W?=
 =?us-ascii?Q?b2XqYWQEZjEtKGqqEyimp9tbCpykyZG+TthgFj7z1CIKPPBR/4URoGb3A9lQ?=
 =?us-ascii?Q?B+Rb3UEYYR/WU9y1hfIE9sLElCIbLHyc1f2Kdp2HKKx2gZvN1Q/71YxhtUYg?=
 =?us-ascii?Q?iORdpCkLPyLJCwQsN+nFY4TrmQxmm2lPplyz/XHSbe6egNb9tSopAWIa8pAF?=
 =?us-ascii?Q?r8QRvwxB7GpH+mRB/UmeUy1cRbJ2LjoFrIBGJXQzXyrItTzZ6aDRiJsi1eJJ?=
 =?us-ascii?Q?11Zl3tgf9vVEmh3nO/wUubLR6NqJRxLSQFR5jGyZdkncTDtbBujRsH+nM/9X?=
 =?us-ascii?Q?4YeS3qdCrXBDh5Ha63rJL72wWQl52zq3jE45Td4+49wWhw4J/6yTwXUQIWdM?=
 =?us-ascii?Q?5JkDrpQB4tUPZLYYfPSP556y0rRkntzYVyZ7W2x0cxpaWpGWoDRMRPg1enpF?=
 =?us-ascii?Q?0+NmcutUUv72hIOnj/pfyy2oXRaZg1KHJBBxwErNPTspI39cGeBztr1CxkCx?=
 =?us-ascii?Q?M+1w2p85g1RcD0Bv2Ue2oqMVsyqQc8opkpyF5oAdXsKlhMwISHHxtc+p6LKE?=
 =?us-ascii?Q?UlluQOSphBH9eO1dHeLNr2sAfnz2JjFM8Z89dQslJScBUXgl+7XO4+890g6H?=
 =?us-ascii?Q?fSB/iLATLSoifFmCQF+UKVMa6C12q2V+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a2SM4PXhcEEauUDqdzR8xvAoI6i8kLHwWEMtfb1SzsOd03JicvAYteA28Jzq?=
 =?us-ascii?Q?RX8xYFbWvCavI/xzzYN9l5nK3c2ObOl5DCQk3sWIgzbmz6Nl4Ktq2Z8TTIRB?=
 =?us-ascii?Q?omfWLOI/avYzE1Xf9mP+dCqmugFLlHCfnTIg3li5yQh6xZuxWQe33Yt/9Ws1?=
 =?us-ascii?Q?MmxxCx3iyklyHipc38JKsivP8esYW0UCI52/eijK+OBbxJlDCvz2oEPhgY0c?=
 =?us-ascii?Q?At5t8b5Usvo9HX7325U2NEUkeTsXM1dsmsbvqinfyXPj71Cjf6jc/FruVlP+?=
 =?us-ascii?Q?kieqLB8vSRPiKg7yf++WI6trSdFPgwYEYY/x/45czkCnI+mvLhQ1HocYtC6Y?=
 =?us-ascii?Q?GuPaaAwbkxEoGIhEFUZKg7DvBri3OFF6c2yHOX0BzTLSWx7f/ripmp1taYyu?=
 =?us-ascii?Q?0wKNG0ZmAdBhhFlUcQK2TQw08oIxVnPqCJP6gvikhci3WVN0JOk/7JTSg4QI?=
 =?us-ascii?Q?thLGczyfxbSE1Ib//Kl1AhPeHZJ+0jO2Vz5jjWJ+FTR34b28RKVjqNWJLg9X?=
 =?us-ascii?Q?eOY2x7DezOPgE3fngsHl3tyKGNaf9uchIBHK5Qf15lh7L7SzCF6gWkQqjQP3?=
 =?us-ascii?Q?8+gD0eHuYTX69rB1Js26f+zNJK2etApwigByM0l6E6ZqA32wC6hTxe1fY/Mk?=
 =?us-ascii?Q?AAeIzHInn9uBVLPbmCoGqzZXJVs+L2tPk2Uej+j9KOQIxu2qt8RBp7a71Qe+?=
 =?us-ascii?Q?T6QbGHvSy/o+IgRETYAvNiR6NponeXNxERUr8CO8SDe6F4dxCz53V0oExJiq?=
 =?us-ascii?Q?EsCEfY46qBe0o0v2/z/l8KP1l+OxgvQLLvtoqcXf0D4SZTVB0R2pyjrGKd+b?=
 =?us-ascii?Q?W0jiVf3KrlN2/3EaRug1YBiWhQCOA4ZYHNybmiyiI2PJ0MyPwW7F5PBY+Jnq?=
 =?us-ascii?Q?V2PTbQUuYNpk6goyK2zKLJDdxrVu9GVM/xet/M+m/8K4dhVfCUbV7Ngp7tdj?=
 =?us-ascii?Q?odu9r9NAmcHHk1Vl+heRZiXLMknR8O52oV1QYfzwwl4JPnsbujE7MxhvYiE0?=
 =?us-ascii?Q?dyE13mOy4IWY9dJ+ASEP1bhDRuvp61mogCzxteHRLO6BJaYPSQaNWi29oqZU?=
 =?us-ascii?Q?UwJ1FJJ/OxyOpxSJWzyzh8nG0Y5pUyWxMrfusdNHhEtF5OxWhQ+u9OGKUc3+?=
 =?us-ascii?Q?Ny1jTbKlBR1+wzRHH889oq8gcA6iNu/cXRPMBZZaCPLLnWs8Qh8FjhASIULo?=
 =?us-ascii?Q?5qJ8Qyj2IftAA8chjBYtrD/VtFj/5DZHk3giFB5sP6LH8dzl4yfeO976JniN?=
 =?us-ascii?Q?w872DxFWDrjn3aPTlYwtHvTRN4Hdgo/gfnw3pox0XSl7w9KqYvqVil5RDCMt?=
 =?us-ascii?Q?t981AhwChxt75muujPd3d4iytfBpyssVygHRtJE40b2w3Ogd17BsO2bMdNEh?=
 =?us-ascii?Q?9FYDH4wn1cjKdqDRqo+2nKPVX/hrb1I8hqjp15VJPWd8VcSQwXvTQ9uYHbOr?=
 =?us-ascii?Q?qK1S5efZVInsBnU3x+2v57feXXzOIiB/OYeSZrxuQsHJLh3gVAc2DepwfEGY?=
 =?us-ascii?Q?wlKsgpgmB8oG8x8i6t/to0FyOTp6UTAqQpyhbV4HOCsT99vx70aS194Rmh1v?=
 =?us-ascii?Q?jFGDOaFXWyeH7s4cF1u0YyntiDVo6+XwI0fbdBYf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5d7128-7b55-427d-0d00-08de23b7dc1f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:11.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBr/AdhtcjRMp1V82SqnziBGCxPJc23lBp4MqsGYa1b+2kEiTZPW09Ro/+FINwLAg35JNAqEfT9gazJTiEJpiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

Implement a sequencer opcode for delay operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        |  2 --
 drivers/gpu/nova-core/gsp/sequencer.rs | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 376c10cc8003..0cce54310c35 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -473,7 +473,6 @@ unsafe impl AsBytes for RegPollPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
-#[expect(unused)]
 impl DelayUsPayload {
     /// Returns the delay value in microseconds.
     pub(crate) fn val(&self) -> u32 {
@@ -514,7 +513,6 @@ unsafe impl AsBytes for RegStorePayload {}
 #[repr(transparent)]
 pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
 
-#[expect(unused)]
 impl SequencerBufferCmd {
     /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
     pub(crate) fn opcode(&self) -> Result<SeqBufOpcode> {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index b564523b64e7..19bde9b8bf1d 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -12,6 +12,7 @@
 use kernel::device;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
+use kernel::time::delay::fsleep;
 use kernel::time::Delta;
 use kernel::transmute::FromBytes;
 use kernel::types::ARef;
@@ -65,6 +66,7 @@ pub(crate) enum GspSeqCmd {
     RegWrite(fw::RegWritePayload),
     RegModify(fw::RegModifyPayload),
     RegPoll(fw::RegPollPayload),
+    DelayUs(fw::DelayUsPayload),
     RegStore(fw::RegStorePayload),
 }
 
@@ -90,6 +92,11 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
                 let size = opcode_size + size_of_val(&payload);
                 (GspSeqCmd::RegPoll(payload), size)
             }
+            fw::SeqBufOpcode::DelayUs => {
+                let payload = fw_cmd.delay_us_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::DelayUs(payload), size)
+            }
             fw::SeqBufOpcode::RegStore => {
                 let payload = fw_cmd.reg_store_payload()?;
                 let size = opcode_size + size_of_val(&payload);
@@ -177,6 +184,13 @@ fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
     }
 }
 
+impl GspSeqCmdRunner for fw::DelayUsPayload {
+    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
+        fsleep(Delta::from_micros(i64::from(self.val())));
+        Ok(())
+    }
+}
+
 impl GspSeqCmdRunner for fw::RegStorePayload {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
         let addr = self.addr() as usize;
@@ -194,6 +208,7 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
             GspSeqCmd::RegModify(cmd) => cmd.run(seq),
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
         }
     }
-- 
2.34.1

