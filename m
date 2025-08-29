Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6517B3C1C7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601910E223;
	Fri, 29 Aug 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jQh9sY0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8526E10E1DF;
 Fri, 29 Aug 2025 17:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGSL7Xak06DNoaIOtRXxRvD39jFAMZSUJjcH6SSp82xfJGm5Nlz/K3qrDB5byj7AO6uOu/Nl80Tl8TfiRyEgZ4rXauC6K9U0SCEJE1yqEIJ2zY9DdqGrF7Qb0A//qSsWJolHH+V42usyXKgVpQ9rqxC0qaUOsXvIXw58pRFMHRfISTg5fPJy/n4ef7R+jCSn0V8A+H030UxL4m0b0NEFGH+FabhgvfTb07Rvj5qkPjyuAdhltNH68d9RmsmcvNuGjB8tFMq6VpPhqWIZzi9NprxPzH0KZ8eUpJfs+6cvNk8NWrnFbkNWSOn2A4GIyTNVk/UlAf4lnE0jTOOAMDk9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krefZO7ciFBK/7Po0DW8pQq9TMhJmYGoVw/VLKsUgzc=;
 b=YMDudTU9apSfNCjEVIOHw2IRBVuw3mVreelRNBIW1Vka8EXURSa4+qubHkW0dRiObszW/F1lv8h6ogmnhh8K5/2f1ng1PYdLY0UxbiEJDbd/lsfTp4kiT1mH15vQFwNw/rDdtoiZI5Iy1n/RnKTXAcoooVu1yan6yr+Y2m1wY1lEvs0km9aDWaLlewJfQJiZXW6N6pKv5vNJ6UCyoDjaHWKyLO2RmHsnaAkliwCtHWCuDxPOjIHeMwp0lHmebHf5VJfNdwKVMhFUwIrjKfK//NdeywxSTfBvmtBbMvI3+SluZFvjBme61xrxCpflImiCnAHW7uHADDNb6HbOfwA4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krefZO7ciFBK/7Po0DW8pQq9TMhJmYGoVw/VLKsUgzc=;
 b=jQh9sY0zxdQQWzGDndTFetAk5O6NFzxQvVTwkHe/j40TCRKKvOFy+GjDwNvJ992PlAYgJiLK6HwmXLuTZMwrFJDVLpaCx5HiVoXL2WY745HVhYxGMtWTRM75UGqTWOQ4LEO8lzjBe5L3cWem16yGcgKNaLEIeYR+XhHlLQfP6zguVrYSFBD0AdYpB1xUGxRED4TRnsOpKVqMqxLThnOmwpnsa0oGhI5pNSCSbItxmioRKMIUnUffpdpxtiaDgQQWMmb2KWHauiJ5kr0u8DF3ZL8Smprfjxwy0sMTNlRgDxNciAP3s879hoRlYSe/ZiN9llU5L3yW4SufPmfJqtsDRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:21 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 07/17] nova-core: Implement the GSP sequencer
Date: Fri, 29 Aug 2025 13:32:44 -0400
Message-Id: <20250829173254.2068763-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:408:ff::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2cd239-8bf4-42fa-57d9-08dde722262d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cME3q8SI3P81P/hc9K0VD/ElktURHIrYnKetgX+KDrI3OrPShvV0YxmWEkT+?=
 =?us-ascii?Q?Pzapq+oN7aCf6OvRk794gE/aT5+qRzjM2yGkfFtumKuvHWSvsr40eCfu0SKw?=
 =?us-ascii?Q?L6oqSJlatcuUZpLgvhoaEUbgMQzXhdupNHfEDf9dzT6eb+DeY313ZGa1fqKK?=
 =?us-ascii?Q?VxCT0fI4hF36Nc/8GN3BpIuxTSrafzPnzTAD5uLoKyoFzAmxNG/rTC+1yAbL?=
 =?us-ascii?Q?I46DDRv8ceOk1VNwCWxD++XbM/qtTvkP5IISN0RrMaI20Rn0zqxGYO40CAT+?=
 =?us-ascii?Q?KSnqieWU+ASNo9nRO8YLiTyzwu0s4OvsjScq3bn2mxnlH37PBrHdXjKqWnvW?=
 =?us-ascii?Q?GxcPVQ7sT1YSx+sk8675YYTI7MUQHTEhlAZ6NL0S4le/JxUZRQ6JgqgLJx+O?=
 =?us-ascii?Q?82yG2b/CYlD/EubLMH0MFUMopxw1RJqj65rdpDIHews+LyOpVgqEwn2oeJCg?=
 =?us-ascii?Q?5/p/O6natiP6WiI1xMdSLGa1N4SSaC8pG7cfNQAqvw8Xpa9XgZPBr4UbRm74?=
 =?us-ascii?Q?9UQFKMJNMnT8x4D04LQljGHILcyYpR+kj9rLPMLRyUctd5RPT9UJR1/y30IB?=
 =?us-ascii?Q?P0kTdRxkcPDEeGoJW0Hy4VHHTP3EISKuFKcpWe5bdG5kjv+kdCuHXptSXP4I?=
 =?us-ascii?Q?PBgd7875L97/KemXu3ZVsmiL7gJrPdcxYmuvd+ecDfhX194c0+hlCC4VPMyK?=
 =?us-ascii?Q?JypvkP7pEPsIFvpe4ffC12GRyQ2EbSHAJlrIiZeM7sn10dnwBbWnBeSxtV9J?=
 =?us-ascii?Q?WGHDLiuvD7qDRmIYAMXnYzp7xsrw9ONMWBKUYwW/sOn+zzn63rK2nyoUcgq8?=
 =?us-ascii?Q?kFRxENpVHLi6C6Iek216toHL5JDyzbNTBCBp1wjPIwvGpo+FD0a12xkH/HoN?=
 =?us-ascii?Q?546Vc7i46KqpOYijduCFsoRLXdkksR0wkEsWxBp3qCGLWpYJB7zecZ3gkOZf?=
 =?us-ascii?Q?a3Y4o0N3WJqGBTT5FLNEIa8FYM0E/Wknlz8rLwShI+uLv7hOWzgqBHYpU60m?=
 =?us-ascii?Q?X1eqU/B4cmrbp5Cq9WiDQ6FeSjJ4GZpwecVINSXEyzH28e49lYJHF+VwFRiD?=
 =?us-ascii?Q?uV5AJ5n1emPp4ost0u88tppucYVldpol2ywkxuLqRZqrxg4dSGdHWXmY+k9k?=
 =?us-ascii?Q?y2sFbLLhHZN0Ju36RIeXs9FEJW+jjSJgL9DKlDSR0QyaxI/Zasr6BEO4Et+B?=
 =?us-ascii?Q?mdiLH3xE28nWeZ/2MtxfUfYHwajq7NklNykzrsvJp6TWPBtGD9SzO1kNADB0?=
 =?us-ascii?Q?3cBm9A/L7GgwPlDANPso46RtAcD6n3vmYpwvjsZB7GCc9Lm1ROKCpoACnZcW?=
 =?us-ascii?Q?eSbya6CrXyUJFVXuhQe29e8zVx6VaP8RZJkVtEAYon78KPw2CFye673d+vDc?=
 =?us-ascii?Q?TruTLohRK9M+lCNSvrF3/mnpmJR3dAWxSG8vjINfCGfvcR7wuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fJcaZOfjit/7HH0FL46vI/mwhWkQ7DKnFxyXheErCQyyc6cqMVIPxmxvO/q7?=
 =?us-ascii?Q?hSponboLAr4Ue7WFQxKp+jQ0fHdF9NlylMWCg5GvHYcg3v+Y/7b31HD9tHY2?=
 =?us-ascii?Q?NMmYjZrrGXsfY6OPGyCPTmyslXjDrPyoFiApxywG3O4nr1LFIAPqCc4afAUq?=
 =?us-ascii?Q?FXaGpWvPCnym56Z3TKnUsjLQCwAsGWjb7MTrzaGCbVOgnUdGD3vIeloqLX4C?=
 =?us-ascii?Q?1eY5a/et2ZaJIP972trnA0Pbs5+V6r3sphzzbw2dZHm8JkDO22le35CMapsO?=
 =?us-ascii?Q?Kczb9kWrfulzXmpe8bkFYda/iERVLEUI9/bA5B3MtB3tvHmpfi+jRHUT10dV?=
 =?us-ascii?Q?qSRG+FQKduZdAGq7TVFmxGWDAdizSb2/ooklFw0TS0Uh9xmprp1uUutHl1Fo?=
 =?us-ascii?Q?YTPqNk9OkKjtSggeDlhbv2wSv6b5NnFM/w9Z1RaN+o3yG8eqXvYuyw42X9dI?=
 =?us-ascii?Q?nMPkmm4UR1wvikxgWsF9aX7tTQhzlS79q8njrxr15r9zWCazcTfVEBkuzxpv?=
 =?us-ascii?Q?iXzyRZPNqWTp6fTUSFVPro4rLkd8/HDMfzY4Azo9ikiFNTLtK04531IewsgU?=
 =?us-ascii?Q?6zFbbwHJPRGP+JwO2FoNYVvUcLlphesxBqRH+uVlIIrkT/cVynyUr0pwxFz8?=
 =?us-ascii?Q?oINWSGMYc9kW80uWrkehMYdQFZvt7Da2BIqGpGZqkUzOe1P4nXPgX3CyuKxg?=
 =?us-ascii?Q?50+OGMFHdJmN0GjlxS81zYw0mhYjd4QMzuwS8g3LyfO0arFvFiO5X7J6SQyj?=
 =?us-ascii?Q?CfMoxnNmBZS12g8VtaUfUNzXokRAjvjzzY9BqIsimJxZ5S2/E7xajppsPmdk?=
 =?us-ascii?Q?XcEdsn0QAg5ZHvE3JoIS3QaHx8RTIda3w9BCIE/Lq/rbAB9C3JA8u09LLGXi?=
 =?us-ascii?Q?dxkFDA9R+7SnW7dtQOgzlN9ze5zT2mjweJ/WF+N52Pyu0fvVtvE4P6edDUug?=
 =?us-ascii?Q?PLxtqaFXDHpryxogPTC9rot+B565eot/tT7prPytmVWfqFhfiOmWxtTxS4+m?=
 =?us-ascii?Q?0PdE0vfJQlJUi7h0ZOn6CdUv8MD58luqkzRA3VICZ4ikKRdhIMXAYB1SH9LS?=
 =?us-ascii?Q?69DhKmqABFr4tHzKXpwZV/O8DYWV5PyZflrN7q5+fwTuSl6dVj1FCjTygb2+?=
 =?us-ascii?Q?MpzOqNDgQ8T06P+3ZHWu5WntWDHgQOyyVBC2H9IKp1JPtWbbINUoZGlMZXaH?=
 =?us-ascii?Q?T5HUwn2qivbBM6NtqLw1yRvkpz0g14C0fGZERsFf8eg2cFGeh6vL+5hTLmUz?=
 =?us-ascii?Q?7FjyPx4MAlaaTsvPCw0zhot+PUGfGDN9grTVuBmqe3lsUtu9nKUS7lg9NnjI?=
 =?us-ascii?Q?G5uKp7WjXYIzXzMhzxX4/IePxgmakOuTTchEX4ghs4zSuPTbE+Pe+bNKP40a?=
 =?us-ascii?Q?PmFh4+7NGlIac2vms+UGP/04mFY42ytduaOy7alSqWwt/JMNSp/wLATUsLV6?=
 =?us-ascii?Q?gelJC5MywrH+cBRMbhc02pEzcAZ0Xrw9irXP9TsNq2fqvTDyrhZvBYMTXDz5?=
 =?us-ascii?Q?+wkVW8pzTSiVr3BYm2VZGAKUiXw3ktx2R1oK7xtce0xS9XLrVVaRw79yQjYp?=
 =?us-ascii?Q?U6KF5rLD+z7FpOVDqq3pmWpii7lumYG+w44DHCLJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2cd239-8bf4-42fa-57d9-08dde722262d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:21.3617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ4HtoqR3xvcXvprlk+I6NSQM1xXCEsJJiRSqo/VXY1Gy4bKqfOJinX/z81XU6DcOCGDooCzYRs2a3Qq6mOl1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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
 drivers/gpu/nova-core/gpu.rs           |  16 +-
 drivers/gpu/nova-core/gsp.rs           |   2 +
 drivers/gpu/nova-core/gsp/cmdq.rs      |   4 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 212 +++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs       |   1 -
 5 files changed, 229 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f86221a681e2..bf670f6b6773 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -312,7 +312,7 @@ pub(crate) fn new(
 
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let libos = gsp::GspMemObjects::new(pdev, bar, &fw, &fb_layout)?;
+        let mut libos = gsp::GspMemObjects::new(pdev, bar, &fw, &fb_layout)?;
         let libos_handle = libos.libos_dma_handle();
         let wpr_handle = libos.wpr_meta.dma_handle();
 
@@ -366,6 +366,20 @@ pub(crate) fn new(
             gsp_falcon.is_riscv_active(bar)?,
         );
 
+        let libos_dma_handle = libos.libos_dma_handle();
+
+        // Create and run the GSP sequencer
+        gsp::sequencer::GspSequencer::run(
+            &mut libos.cmdq,
+            &fw,
+            libos_dma_handle,
+            &gsp_falcon,
+            &sec2_falcon,
+            pdev.as_ref(),
+            &bar,
+            Delta::from_secs(10),
+        )?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 9776c643f527..467d0453130a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -27,6 +27,8 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 
+pub(crate) mod sequencer;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4e4fbaa81e8e..1a7785627af3 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -182,7 +182,6 @@ pub(crate) struct GspQueueMessage<'a> {
 type GspQueueMessageData<'a, M> = (&'a M, Option<SBuffer<core::array::IntoIter<&'a [u8], 2>>>);
 
 impl<'a> GspQueueMessage<'a> {
-    #[expect(unused)]
     pub(crate) fn try_as<M: GspMessageFromGsp>(&'a self) -> Result<GspQueueMessageData<'a, M>> {
         if self.rpc_header.function != M::FUNCTION {
             return Err(ERANGE);
@@ -204,7 +203,6 @@ pub(crate) fn try_as<M: GspMessageFromGsp>(&'a self) -> Result<GspQueueMessageDa
         Ok((msg, sbuf))
     }
 
-    #[expect(unused)]
     pub(crate) fn ack(self) -> Result {
         self.cmdq.ack_msg(self.rpc_header.length)?;
 
@@ -519,7 +517,6 @@ pub(crate) fn msg_from_gsp_available(&self) -> bool {
         true
     }
 
-    #[expect(unused)]
     pub(crate) fn wait_for_msg_from_gsp(&self, timeout: Delta) -> Result {
         wait_on(timeout, || {
             if self.msg_from_gsp_available() {
@@ -530,7 +527,6 @@ pub(crate) fn wait_for_msg_from_gsp(&self, timeout: Delta) -> Result {
         })
     }
 
-    #[expect(unused)]
     pub(crate) fn receive_msg_from_gsp<'a>(&'a mut self) -> Result<GspQueueMessage<'a>> {
         const HEADER_SIZE: u32 = (size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()) as u32;
 
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
new file mode 100644
index 000000000000..918c3405b33c
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
+
+use core::mem::size_of;
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::device;
+use kernel::prelude::*;
+use kernel::time::Delta;
+
+use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
+use crate::firmware::Firmware;
+use crate::gsp::cmdq::{GspCmdq, GspMessageFromGsp};
+use crate::nvfw as fw;
+
+use kernel::transmute::FromBytes;
+use kernel::{dev_dbg, dev_err};
+
+unsafe impl FromBytes for fw::GSP_SEQUENCER_BUFFER_CMD {}
+unsafe impl FromBytes for fw::rpc_run_cpu_sequencer_v17_00 {}
+impl GspMessageFromGsp for fw::rpc_run_cpu_sequencer_v17_00 {
+    const FUNCTION: u32 = fw::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER;
+}
+
+const CMD_SIZE: usize = size_of::<fw::GSP_SEQUENCER_BUFFER_CMD>();
+
+pub(crate) struct GspSequencerInfo<'a> {
+    pub info: &'a fw::rpc_run_cpu_sequencer_v17_00,
+    pub cmd_data: KVec<u8>,
+}
+
+/// GSP Sequencer Command types with payload data
+/// Commands have an opcode and a opcode-dependent struct.
+#[expect(dead_code)]
+pub(crate) enum GspSeqCmd {
+    RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
+    RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
+    RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
+    RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
+}
+
+impl GspSeqCmd {
+    /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD
+    pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
+        match cmd.opCode {
+            _ => Err(EINVAL),
+        }
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
+    pub seq_info: GspSequencerInfo<'a>,
+    pub bar: &'a Bar0,
+    pub sec2_falcon: &'a Falcon<Sec2>,
+    pub gsp_falcon: &'a Falcon<Gsp>,
+    pub libos_dma_handle: u64,
+    pub fw: &'a Firmware,
+    pub dev: &'a device::Device<device::Bound>,
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
+    current_offset: usize, // Tracking the current position
+    total_cmds: u32,
+    cmds_processed: u32,
+    dev: &'a device::Device<device::Bound>,
+}
+
+impl<'a> Iterator for GspSeqIter<'a> {
+    type Item = Result<GspSeqCmd>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Stop if we've processed all commands or reached the end of data
+        if self.cmds_processed >= self.total_cmds || self.current_offset >= self.cmd_data.len() {
+            return None;
+        }
+
+        // Check if we have enough data for opcode
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
+impl<'a> GspSequencer<'a> {
+    pub(crate) fn run(
+        cmdq: &mut GspCmdq,
+        fw: &'a Firmware,
+        libos_dma_handle: u64,
+        gsp_falcon: &'a Falcon<Gsp>,
+        sec2_falcon: &'a Falcon<Sec2>,
+        dev: &'a device::Device<device::Bound>,
+        bar: &'a Bar0,
+        timeout: Delta,
+    ) -> Result {
+        cmdq.wait_for_msg_from_gsp(timeout)?;
+        let msg = cmdq.receive_msg_from_gsp()?;
+
+        let (info, mut sbuf) = msg.try_as::<fw::rpc_run_cpu_sequencer_v17_00>()?;
+        let cmd_data = match sbuf {
+            Some(ref mut sbuf) => sbuf.read_into_kvec(GFP_KERNEL),
+            _ => Err(EINVAL),
+        }?;
+        let seq_info = GspSequencerInfo { info, cmd_data };
+
+        let sequencer = GspSequencer {
+            seq_info,
+            bar,
+            sec2_falcon,
+            gsp_falcon,
+            libos_dma_handle,
+            fw,
+            dev,
+        };
+
+        dev_dbg!(dev, "Running CPU Sequencer commands\n");
+
+        for cmd_result in &sequencer {
+            match cmd_result {
+                Ok(cmd) => cmd.run(&sequencer)?,
+                Err(e) => {
+                    dev_err!(
+                        dev,
+                        "Error running command at index {}\n",
+                        sequencer.seq_info.info.cmdIndex
+                    );
+                    return Err(e);
+                }
+            }
+        }
+
+        dev_dbg!(dev, "CPU Sequencer commands completed successfully\n");
+
+        drop(sbuf);
+        msg.ack()?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index b1b8c4536d2f..528ff8dc6062 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -129,7 +129,6 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
     /// Read all the remaining data into a `KVec`.
     ///
     /// `self` will be empty after this operation.
-    #[expect(unused)]
     pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
         let mut buf = KVec::<u8>::new();
 
-- 
2.34.1

