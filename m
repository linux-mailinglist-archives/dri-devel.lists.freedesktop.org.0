Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E270BC30BE
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70E410E71E;
	Wed,  8 Oct 2025 00:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o1zRspxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013033.outbound.protection.outlook.com
 [40.93.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB110E724;
 Wed,  8 Oct 2025 00:13:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBcT2AzA0VjeKAoKFhqLA3x3kv5c9eDy0sGnmLdp9tSXq0xQjjEtgi2tNj0Dpj9nmePEtsvpH+BleJWcEPac483QW9mAfGFNXZt6gKxNYzY7V2seMM9FFJ9rrcAqufo/ovN4AXeL4KPxxwr0yIVYK32VJ5QzRknBoNY/eAj6LVtPvFR3JefiiJRE9b6zJIO5fUN4L1HqOvbN/NwYxDAzRfYoVebDGeyml2mwcie9cfzZsvox++ZLdb0NLIWXnkvRHV8P1C6VBNTqHtKywQXnQAv0PqOcaLx4b5FwaZ4wq45fimRY+BJqe55YcOvwCKi1vu5B3aCWeZ18ii4PrX8H6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53tGN4UwNmKwwEuS4jT5M7mquZuTfQLg6qO8ouA+/qM=;
 b=McohUKPU6tY8y7zvHp0InjAKM0TDiqvvPTH5YPhMUXK9qr23dGgaATdokSsCgaaUklBlia39UDe5hU8rOoeeNvqkALpr9Tmwwn7xdJ6l3NQ5Qw9Au2zzGW7QBiPF9E+QqBgd01iMx349c+14cRD6E3M8+hbCSLX7BKpbrHN6iO2oPD1DV7mSvnrcnMZt3Ut5X3wTU/jxK+V1+a9mi8K9LRIpj7V5W41UYY3UN9sz52hab66Ha3QIcz8tPtGCs1Sh26+oAPXlHhMfHgvv96B487ry2julv01jK4Zb+rrz4nlhz6iwu09FaC4+BSmu4vNaouJaAIxsZWEL+hG22ZS+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53tGN4UwNmKwwEuS4jT5M7mquZuTfQLg6qO8ouA+/qM=;
 b=o1zRspxY4tOA+rhq9YDC/bVPB3Sl2OAfHkt1LTj4JibQL53latdwC+id9+mAPZpbeZvxz/ULpJXf228Bgp1nIotDFVr/pqVZfWmG8okczEYCaHKTRETibrRNrtE0hYroAzugOhD++dIhKVjoCVNkEymGTbQbxffD5cUyXnqwQU47/49NDU1TyTRFdpArmyjgjwKFv4PHkGv4GzC2Wqha9r37iPXM51cJjEuZva0CERG/d1002haksdVBKXfOLIfdoxcudB3JHyqz4BZRKXTIMDCNxUAgoUJp98cNxCqFHs0+v5QyeisVICPL+l6PxLqpzPwDuA5wtGc8EhAcD2jQbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:15 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:15 +0000
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
Subject: [PATCH v4 03/13] gpu: nova-core: gsp: Create wpr metadata
Date: Wed,  8 Oct 2025 11:12:42 +1100
Message-ID: <20251008001253.437911-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0138.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d079f31-6cbf-427b-6da5-08de05ff79e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WvVW2F618ued8NxUY7eb04ivotpz4jsLU5dWbcCsbNgyhsGkqouZlrrT2TAg?=
 =?us-ascii?Q?7uQG9/xeC0UTmtBCs/UowWf7n+DpUwjmotdqGV9bqos4H3y0KLJTNZ1Da51i?=
 =?us-ascii?Q?WGt3ncJycB081kG2/JfAUNMDD3BIBWnsxuxIxXEpxpQkdUJlw6h1td0xBAha?=
 =?us-ascii?Q?Hrd50ozvkVykEP4QHQ2oUNgsx9OtoXxgqNkPxeBjxRbZ61U8uriv2Y/Z3kQN?=
 =?us-ascii?Q?wqrN4lYMiL36sI3OAbA381xwPdUKOoAB12xGYGEhtfgUn9uuqplIE0/9+tuE?=
 =?us-ascii?Q?6XuH21CRjmAX/cLjdmJSqLrhSJoMxfKvQtk5G+iNnG+Q5CF8twmn3UBAOVLL?=
 =?us-ascii?Q?xzIDYYAD3glzlwwqr1P5LsPEvQK/+QNq6/spNgmEUHvPldZivK9NfUmN+2jZ?=
 =?us-ascii?Q?uUZESlrn+KKa24wAxcrXWiUAL/ZOfX+Xc4AKG7EFQlOk35wwNKFdn8LquZzs?=
 =?us-ascii?Q?O3mT8eBdrh44z5hx3vd9FfmJrC+50bqznsfy0WNvfxd691pXqiN/irQ4oLIZ?=
 =?us-ascii?Q?GlG11eBKARCIk2lbHAjktj1zHcnvwc83qTM6YRFgkxOO+8IOB8Dr31+bnSvB?=
 =?us-ascii?Q?kIglWT2IH1cTskFpjZoaLH3JBh/oDlTf6Uz/zQVUTt1Id8BBg8XavAqxZYH5?=
 =?us-ascii?Q?j/wY28dPj28pcREuZhXTJK8xJSuKCg/ECFktZ4Efe4nCHWHKwW/POya2gmbc?=
 =?us-ascii?Q?9BXMM3fBRrW0nfv84A6izHWqMOt51BYAlukVcolGxqdl38Wl2z8L0MaMLQtw?=
 =?us-ascii?Q?6We2IQzwOpP6+ZWMEDvGpCzGweGSuu1y4PhnFLHy+2IaRrfE4wQ760wqp/Id?=
 =?us-ascii?Q?oTGBG8jD3EdSUh0I9iflc0mStjKApqkysNRTE1u+OfUX/kH1/5TCbgDrGdfr?=
 =?us-ascii?Q?1JnImqhlhvHcwvMnx4nZlefRjyrK3DVm27RgZkeGggJf7Kbj45wxb6Qnc/Tn?=
 =?us-ascii?Q?ArLa6+mYs8aTbI0pNtz/8tmLMUyiGeyghqcYZByw7s8ZYZQADwN/wg03Lrmv?=
 =?us-ascii?Q?50wU3YjEfS4gjMUFcFqmjZ7zJBTfPnA9HPDkZH+cyCwNVFx5rXwWsjlAXZwG?=
 =?us-ascii?Q?ie3/OwLYuUOC0cQkCfqQEIXdTs7u4biNVFrYJnC00+/rlp4xfHjH9wbZwzZC?=
 =?us-ascii?Q?scqeBgNzLnHWuIc9r9NDTxE/E+Vb39Tr1yrvnja4RGBwt14hEHdj/3PW+LfT?=
 =?us-ascii?Q?yjwc3ti+7AmrU4Cm/R9oPzQ2ImsaIUq844S4Ll43c9s0J55iTDs+cWhVBpYA?=
 =?us-ascii?Q?69AVGg4/PNJD/dz/k+GUF1E4dzB1sEvHS1sRrV94jrfdyaKKGA9WEHcF+7H1?=
 =?us-ascii?Q?h5PMcsNhKfrDAw0TCpUllT55+xwRkIQzVZZ7OczceI1HtrjyKWJ97EXCE8Jv?=
 =?us-ascii?Q?ZbP9y/PRImB79dRbQTdr5R9L8mOBm2Qw3RWIekoTLMo48Kp0pKKWO8BS9Dsq?=
 =?us-ascii?Q?MuSkq009W6QZflXb8xYlehJdrgM9ptrY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lbdltScgklf6wwc3SVlJlqenhRrJS+9NWDO2abvp+4ZXefMeoc8XxciQcddv?=
 =?us-ascii?Q?ccYNbY6Kx0LAa16yOS2IeEgNh8q3TuIP3LaTrtzsvp6N3EYI+wi+8o1Qiqy4?=
 =?us-ascii?Q?Ji6J6tnme0G4fvIfWhV4OqRN7x7qfGEwOF/9M0ImV8P0nsFmAVEFie1HkJnt?=
 =?us-ascii?Q?8SPNLbcFX6E3owq+r2i7dcEQfhxzN9LtfhG7fLakvMNrXWq6C07tdbGeafKe?=
 =?us-ascii?Q?LH1g5yzAOW4aZ5p7pliXmxNCTf+/pMsDFT3Ti6BbiHAxV14fA82nA2SUojdo?=
 =?us-ascii?Q?7qW/85df7tibWBSpg9oQJ4dYpthlYXRXHndmreMJNWueVqCKMQifIsa3NeJY?=
 =?us-ascii?Q?ZxzeiTLcxuvWrletdbjM8L3DLTEipzqWs1EFm1hs6v+bY8/C8PN7kl56TTyt?=
 =?us-ascii?Q?/f/93Q1ZrIlJEYd2YLacofOK7gSmU4ADSEkiccEZhUHJ6DeZtQCD+s7n6+MW?=
 =?us-ascii?Q?GXavJYkEerpH6BM3Tjol3K2oy2oPb3rGO0sw5WhAEXWoeUi0G0TrdbQJ1Pj4?=
 =?us-ascii?Q?g0ta746VlpjVbIXvufU4Qtbbn7J8NS55QdS3g6OXZG2slIvGpsRC93SQ9umO?=
 =?us-ascii?Q?kqZw1JiwdSl4zWFmEIE8eStOhPR2BvPpHjMmPcW2INcNho8A3fvGkpPM6uEh?=
 =?us-ascii?Q?cyvZ0nsJ5M+Ept2nzvQBzfhmr0/khpjbkO+Yu8YariICHnv2e+ZpcAOpvi1Z?=
 =?us-ascii?Q?hJGuxOQ/4+CMSU+r05DDKCl78D2ptzEYVjix5297IccRfdVJhRLVuoNurjg8?=
 =?us-ascii?Q?VH1m9Vh99ymPcJ8ynj38BaYZel8i9RKzyyMc4A+O6TNcWB5hJRvcy6pNw1qC?=
 =?us-ascii?Q?DN0YbgSr6CBkHUB65MiWMaJu9U4siu6xr0tssvC5Gl+QJoq5GP7E75rvtweI?=
 =?us-ascii?Q?Pr4MIkFitlnNBliD8z3noNgr7r9emdCrXwYMw1GKcJh0zEOYy9Yb3iwz710g?=
 =?us-ascii?Q?+pwMOcVD4Ws1yYGMdw02bLgIkKytaTu2ScdC8RnE4FMlNdLC4lpdnmZFMwHM?=
 =?us-ascii?Q?0w1sf0aPdqRPoYgkEQYWgb1Qf7w5R/At0n9cuiN+a+qNhafPSCjFot2g8acN?=
 =?us-ascii?Q?06cLHhtNt4pBgC4ngqSmwn+GhGKs17VeUec2svluaGLWPXkmJssYUUG9V0w8?=
 =?us-ascii?Q?eEKEyuyxT7u/5FV+9EC3Q1jKIZi+NmiNafADXyySrIYLdkPJihm1eID5IH/t?=
 =?us-ascii?Q?+BtoNVwu2Jt3uOUtOsI5qJa1pQE7yVqtD/YxyQJECGfw7FMRCCB+6u9ZeC1b?=
 =?us-ascii?Q?mJBI8OF73fBucrLN6G+PfJBqofE/aCFf4RGr3CUtqjLYp/reBHrWsp9Sfig8?=
 =?us-ascii?Q?nvZN36ZVN8My+9y+1vqdGD2A8inhMaCyu97E3aALtFRdCYk6JtKxeEtHMP9P?=
 =?us-ascii?Q?xeLmB2HnMDzVHQgqsyfgXxzC4amt+SbcW+SYxMdV8dt1csvaS0wEAbvDzTB6?=
 =?us-ascii?Q?xJ9DUUZ/7PxaQLhzGoglCj6h9/KQ+RhZJplaudiChQhZ1Zie09fhwUExBmO0?=
 =?us-ascii?Q?ZMbGrJ/OjoyNo/cbKNWkxXk9jbQJhg4dmNfzB6pCP7YGUneAUEwGfdxvznIP?=
 =?us-ascii?Q?r+fEAQhRCc/pnwBZO55FF5bpfH8vq8pdYL83s5tt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d079f31-6cbf-427b-6da5-08de05ff79e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:15.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2NJ6nz0e2/bsfjMY0l4p3AKy4irc+jsfkXScSCY29Ch0CGsvaL7ZQw3a/0p+kHCYFQKlMhPGg0na9jbnCdfXA==
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

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v3:
 - Don't re-export WPR constants (thanks Alex)

Changes for v2:
 - Rebased on Alex's latest version
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gsp.rs                  |  2 +
 drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 57 ++++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4d6a1f452183..5580498ba2fb 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 3a1cf0607de7..c9ad912a3150 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub bootloader: RiscvFirmware,
 }
@@ -216,7 +216,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 04f1283abb72..76d0d36fee3e 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -55,11 +55,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 63099df77348..fc8fe6ffe439 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -11,6 +11,8 @@
 use kernel::ptr::Alignment;
 use kernel::transmute::AsBytes;
 
+use crate::fb::FbLayout;
+
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index fb22508128c4..1d2448331d7a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
 
@@ -14,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
 
@@ -132,6 +135,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index dd1e7fc85d85..68a7059bc965 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -8,12 +8,14 @@
 use core::ops::Range;
 
 use kernel::dma::CoherentAllocation;
-use kernel::ptr::Alignable;
-use kernel::sizes::SZ_1M;
+use kernel::ptr::{Alignable, Alignment};
+use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp;
+use crate::gsp::FbLayout;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -102,6 +104,57 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
+        Self(bindings::GspFwWprMeta {
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: gsp_firmware.size as u64,
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: gsp_firmware.bootloader.ucode.size() as u64,
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: gsp_firmware.signatures.size() as u64,
+                },
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        })
+    }
+}
+
 #[repr(transparent)]
 pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
-- 
2.50.1

