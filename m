Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C9B9061C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F043810E446;
	Mon, 22 Sep 2025 11:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lL+fvKK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9F510E444;
 Mon, 22 Sep 2025 11:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGvf1TIRfj/V0SQEkbfX5iF7sRtJQD/0iFezSz5Nmmnp9Cf/aBPf7zrjsg8ibV6XBqIYPh44QaKLL06dqa6NiASIUq9+64C8gwCL1/DiOOqxShHlg8x1Zgo6DNbcFyRzdSQGbEM4v3Vrdwfk8YtlnN+emZc3q7Ftym/AV42Bwyk1U3ki+iTOqTJ2O5SfHTVUhPZpUga0pZRReTXNyKyCPLBZ24G/MqVtufbU2+bQwEHwVaw1lrr3A1ARoQiYCQk7oN2GRjnoxneplFQvEB91EeEj7EBnkRr5TOkvHDAI5ZiyelralUoHP0YP0gKp4D+vBtNkEbWsTsghNBz108Lj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1e9QGFcEP4ebWxKjWLsj6czelCKRQbCh1G1SsbIMrg=;
 b=GPS37WRafsiUETRW8b0xBtn02A77lpgsvZmLFjv0BHRWTbfC1Ty6ZrHy/xk4gpUo535E2vtlJAQ6ije9f1mfDrMYP8+B5sT00IRGf/1crA3IItLSQqRAwaQ+cMSH3s1Jp/329C+Ldb340lMOHZ3haqecpXJoyQgSBoSOcyJfitmy4DEsZ69Bhy0cc87SaQGcpVJu3absf2niqAWFp9vdzyf1BmxJlZBTxRjSG1lyu98IdOsNc6zmu67S2IkoZ7OsO4Kb1B8WTGnPQee7xlCWGYUd9op9oA3gSE0unDGZBnQ/Z+lNW4AS1ygBJ/OEvlAzVd+L3WBEkapktMf0jieC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1e9QGFcEP4ebWxKjWLsj6czelCKRQbCh1G1SsbIMrg=;
 b=lL+fvKK1w7rxbn6kml6iuGAFV8BST9aXJvRJt6Ix3EgbsYb4Cj6xLzXALgWorJKuyBGYSGB5gRLy8EsqLaWJna4TXWFhfioHeXcMJDxH/KMdmi28pnJZl2Clk4YGyFDgDENY9bZEWIm9yxXDVwLj6i5d8L6409IykvhB+1s/qm0ItxWNFu6m6J3MoG5fRafJh6TiO7QmC4CHTbhcdRzBIjT6W0Pk8LrAGX78Kgk0Ac8U38LxopZj8AGoxepylOL9xBTkog3jJOvcFMExAI2J5ZmqGMf/T76UdRvpiHYwWKMAXaNrx6WYBL9Cz6LVFlrjOfIaAoVf7P2E4mn9f1SwBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:34 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:34 +0000
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
Subject: [PATCH v2 10/10] nova-core: gsp: Boot GSP
Date: Mon, 22 Sep 2025 21:30:26 +1000
Message-ID: <20250922113026.3083103-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0057.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7b0237-19e5-4ff8-34d2-08ddf9cb95a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZKDvc5i24tQEASw0UiKds+bNH83vpAZpWI4ibF9W5poaertJ+eVLEYdStD4n?=
 =?us-ascii?Q?HaZiK/dM8PYdGHlzhWnYneG4lnMqg07KGG48ezJXRTHzre7yFceqIQ64mpUt?=
 =?us-ascii?Q?H62JBXmW5viXKGRrGhVdRHHUubsxOZWWWceINCDT1xmUQwZfD9Wzry+NgNrs?=
 =?us-ascii?Q?+3FFAJjapscWo78eo3Iha2sxiFHGs/Vrc47Wr175/8L2UCK4crWwWlz+ZpYn?=
 =?us-ascii?Q?HRRPPYHeAKsPzB3nc7eMS6eq56D+GV06TLmCunatkTL+C866jOSqfMeOeJTL?=
 =?us-ascii?Q?O56g0yq36EDQ24Ay8oNIK/UQpH7zip/mchCQicm0ZOTC+m5BaTqKkCIiKvr8?=
 =?us-ascii?Q?xP2QCnT+4fCune/9iqEG0Y113S6WDNPpAKQGJePVttoXQyaoOhQCYunPxwRm?=
 =?us-ascii?Q?nP5IkLRk+v3OIaw2QXdNCbwoMSmEADkxFa6KMHc/yU/YYRHXWzgOsa1iUrlu?=
 =?us-ascii?Q?ddSvU6YzU+n9NEl/N/JnmzsoutBxbgoQ6zOYD0CiO6ghNgF3bqcfiWCczWgT?=
 =?us-ascii?Q?TuxzpFsWwxTIyVAxF8jhVRc2q2xtETw1unVsSQvsVLs2Lvx2pMr37c5s8xZB?=
 =?us-ascii?Q?QUP8Q5KWL9RVGb3U/z+hLY6m9JCn+GaXwTIfCo48BuHj0TGrIRFVo8g6I39j?=
 =?us-ascii?Q?8w0FjkFGFwHHwOG97Mfk+SQPB7ow1VwtOng1qrxYTYmAK6SRLggZYALaSRqA?=
 =?us-ascii?Q?BeXf1C+BvyMgfthFQxfZ4/8A+z1GaWOXcR3r2E/5WKgkewpsqSduCGgpotVm?=
 =?us-ascii?Q?DtMCbtmjHODfOLTOPdUe67m6S+1zJ3vBtww5mw8G4hoolmfYpD+ozpU2aZjD?=
 =?us-ascii?Q?hfxSxH2xXH7MmC9y2tdB3nI2HYayhqoRjZo7oCubZr1wF7f+5yNljhDa0+Y6?=
 =?us-ascii?Q?zWDd/7q1JdjaAtIDE66lA9uagNul7ofPccrc6HC0xgEJQ+zsw6nvaVOSl21v?=
 =?us-ascii?Q?mVvZU2YB7gx2M2BkXO+bn3PWutXZK6+7PLHug/q48bs/W2SYvJjxJo28UlaB?=
 =?us-ascii?Q?esj09HfAKz4KQ1H85MtALYlkMFM5MiS7A5cI1QzP4v3J52gQt2WtWUdlg+ro?=
 =?us-ascii?Q?SHCa0kSiyU/Bje3kpD9iK5LICDWsV+lIK3c6ivr8qOXhXh/oEG23yZrMP41N?=
 =?us-ascii?Q?lq2zOMxZ+jRTzSSw62UoqATOelMg9olpud27YbCiwuMyIgn3ptJFs61PwjWN?=
 =?us-ascii?Q?cMH5MyAoJySoAbJacNQNtG73HB+pJ0VTVljr09nX70E4ulvr+yVZnH9K049A?=
 =?us-ascii?Q?tmzrlYCnA17OJ9w0PWwPr8PZ4XgpMf+HndNPYbmpc75hqZDP4mp2/8bKoP/A?=
 =?us-ascii?Q?2JIvYXq/Oq0zWEOsuy9EvXpb1ytiVkA8z9sPcn8eVXJ1HQklyPR+2Ogiy28y?=
 =?us-ascii?Q?FPkQ1j2n1yJSOQrlF4+y0pSQQ+hAUyCe2dcSh462Gwg9iPmZ9uycee8AqP9n?=
 =?us-ascii?Q?EwYHa1mDK9U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6sAZG8GmWDVWTYhaH8FHy0kdzJ9SGo46IuYjCrm/+g6/gUntp8ATTheqEBT?=
 =?us-ascii?Q?R53cFH1qj5v8ZR7OF+mXNsl8j20PWZi64KRE7VZUkQKrt7CZT9w95F+z8BUC?=
 =?us-ascii?Q?5ZxuzdlEILnBxD+4DXHj60lQclioItlztjbu53qTOKYjg3b22xkFvFT6pcww?=
 =?us-ascii?Q?UGYNzMUjcfNFgOGEmfSZCDis9ObwkiEFGFpAXmuDDMeMRtyojzj6slyZm/IV?=
 =?us-ascii?Q?Q5Nf6M7tS7QUOoJbvubLd/ucXLRkP4Kjo8drUvheeXE8pKF6sHUzfaY/0syo?=
 =?us-ascii?Q?aO0Hguc4sUYbG+qdE67J4518yoX4KHM0kziFh5nEwlRpf2KwD1nqSj4aaLsT?=
 =?us-ascii?Q?cD9mQs/7/FxXBZ5BKKx7/sTke4i7jDhtSaLY8p5ijebHz98r8yxee9w/UhCZ?=
 =?us-ascii?Q?Yx8Z1sihZNB053WlAn/PyhQp2ynPEy1qQzPyDar4vfHNNQeR3a0p18wlFeDD?=
 =?us-ascii?Q?q74hdC6fDxfHYOk4qbJDj1uEQGlOUcQPsrUs1C6bNRw5vSKY3JVbhzc1A3fL?=
 =?us-ascii?Q?aEedCCGzYOaIzjpPvzKVIypfpgmmjISUDWdBibJ28KjOJz77Hsr0BvepD8Q/?=
 =?us-ascii?Q?5c4RhwdUXkUESQOHZWfzo8SDJR1B8aML3odsYFfnTSPetjNwshyYO4qi2uTO?=
 =?us-ascii?Q?ujCFzO2nHDBHrrlK4yIAUzkUP+ZmmJy1N0FYrsKtw2NDDvcNgFS3y/w4iNE/?=
 =?us-ascii?Q?N1kng9/6Co4OVLY5BXpZpgAhEIEVbGVrFftWXO0CU4OLrAFk2fGlSAG26wZt?=
 =?us-ascii?Q?tFro22kUL2rKa/i6qxKFxKoyyjYislCqUBRIFGXsF1s72cg5oLnGnyWUZ2VT?=
 =?us-ascii?Q?n6HVQIfSzEZNyV8A+8/yP2IterT2VKRROtSQg5BbSqZDyufi8ncZecUbb5BE?=
 =?us-ascii?Q?Gibi86vC4I4hBGSUdGnPIos9ThNeovd6AbXZ2+WE50Z8rHVbwV7FTAajevPv?=
 =?us-ascii?Q?an5X08HNdBV2nwtnkRybxg7VkXi7wK3EUfGp7Kmd6ycNr1TaQ6JFqbO5GnNy?=
 =?us-ascii?Q?2FNo+Lz2FFTkf3YauQGcomU0eRuNM/XYVCLKV6ofGN5Eo9WZZ9eJyO7+C5+Z?=
 =?us-ascii?Q?Aeo6JHkm3LzIJfwIK+3b+k+vFl+d4gdXbtWEd3J5uOFeWhCTzS2pvHfecAaD?=
 =?us-ascii?Q?lFCOtIXYw5F/ddPQc02ADxcIENSI/7OqncnDdBjtjcGkwhBXoa2zyGLExlp9?=
 =?us-ascii?Q?duoznaE9V+HrJ0y6agH1ud7FSgCFkNUPyDQQ/w2iRc8tKvzx8OlB3dNorya1?=
 =?us-ascii?Q?0hM/gt5No+VMp7ygfv9pkc55sDADNesdely4i/JNWaA/wurf2U6j8epsQgsX?=
 =?us-ascii?Q?qTjOjbU/NCm4ghKwRjEmADI5XEJW3EuQym7rTzjdbCg3y4i5FYOAt3Rwb2nT?=
 =?us-ascii?Q?mqL5dG31f7sOaStF6SZ324gx8uIRH+juU5KDZLnFE3I5uAiMjydJw6BGJUiq?=
 =?us-ascii?Q?2QIgVFhioDdf0Zdz9NleVMi5eyoxCiUyLRz0pqnBcHZO0RIIqBzctoNfVS1H?=
 =?us-ascii?Q?DTPcKhELU9nkL24Z9K9Z0yjDtInKN7JLhAV1gEZCUjxmVhzVY6jpJUVVqglR?=
 =?us-ascii?Q?kp6R58Ru/4CPyQjJfxAH9vQWVYf7EaR9eYmMNlR/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7b0237-19e5-4ff8-34d2-08ddf9cb95a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:34.4019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+UAyTeENeoZOn1LElt5wrBPSlhaOB5bed/vukm1VtOr0mvEqV3UIT3qNkThE6Znp2b9Lujn+Cbfsvnp/GQ9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp.rs            |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 56 ++++++++++++++++++++++++-
 4 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0cb7821341ed..960801f74bf1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -614,14 +614,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         Ok(cpuctl.active_stat())
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index dec33d2b631a..d1a9e027bac3 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -50,7 +50,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub code_offset: u32,
@@ -59,7 +58,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1f7427a530e5..8fcfd6447101 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -32,7 +32,7 @@
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
-    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0b306313ec53..0f3d40ade807 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -5,6 +5,7 @@
 use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -19,6 +20,7 @@
 use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
+use crate::util;
 use crate::vbios::Vbios;
 
 impl super::Gsp {
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,58 @@ pub(crate) fn boot(
         set_system_info(&mut self.cmdq, pdev, bar)?;
         build_registry(&mut self.cmdq, bar)?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        // Match what Nouveau does here:
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version)?;
+
+        // Poll for RISC-V to become active before running sequencer
+        util::wait_on(Delta::from_secs(5), || {
+            if gsp_falcon.is_riscv_active(bar).unwrap_or(false) {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar)?,
+        );
+
         Ok(())
     }
 }
-- 
2.50.1

