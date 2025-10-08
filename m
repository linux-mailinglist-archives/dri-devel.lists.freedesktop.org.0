Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFBBC30D9
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F8C10E728;
	Wed,  8 Oct 2025 00:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dfXZIrbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696DB10E1D5;
 Wed,  8 Oct 2025 00:13:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2QWfH1AzSP5sdNd+w2YOxDGi8jyYff7SED59T27PTw4ZDRMIicWKbMnQqfdnGUOyUz5Ypu0iu7UX2BFYV5OBnTfMuxqKB2Xie+a3bpKddrjjdMmmjimpPAXKBYJFRAqyMXp+3IznZz3n28swWzYK/oiC9za3f3DbGngwLMxbVJugGCdsxfMt5ev0STcDf6+Lm6xMfueZX32zCRk99ZlQWqGKOHuDNKygUO0deU6FdFtmI5itSmainvbfbdA1ebBvl8wkwIoJWHpeFx4zFgA+cysiYbcNKOsv1V4ETWEMWgVgGhyEGyl/93bchHyxOwrMV9ZsZAaZ9BdwjprUy9+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haj6CmXWFs+KS1ndsFVx69MaimWuE7xOBWVvQg8qyfk=;
 b=Ze+dQnjCI8OT0T6Cahc5bzFD1CGZ4Hm7jua8fl2DSvjgTxpv1zVduvC7qQ7p8qO8KNSOOU5oSTStLgPhV4iFVZWEeufJOkO5q1rUgjXza/4ksqe+alr9Rywk2eX2YDygW9Io9xDQJETJCi8lhMU9zMgtjlbM23aMmryEnuwMqO1VNNYH+iLdb9kKc7iBQ+GsTLhDYB4s64eHdqtU+GCWlU/u30ggfbUVf2GPiCOIMA4owpD9qB9YNKVlCm/jRffggIgmFVvKnY7QAKEa7XFtWscw0CXqMqyxBJspIIc9FOBxnVeHArC/tPRsbPu8so+kclyXknCYpRlnWgZETWRpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haj6CmXWFs+KS1ndsFVx69MaimWuE7xOBWVvQg8qyfk=;
 b=dfXZIrbcKouRiZsLbHj3dri65I0IEyXPtBEYHmkxgl1efWo0/grZIeC5g+XQK5y9G+GcTMzhfeF7aSwLNDelf0mlXMghn/HoDPkx0T8jYB3lKlR7FZih4pHSzf37x5ISYCSLNsypWMj/81xMg4wsVFBC1BPcF+EXvLGJ0ThyaifoQHZtFnGvNZ3IS3E/u9mICtJa93Cz5dQoiMQtbvgfifift06eukNW7j3q2wxbZbeJXK64lkXcA0SjLfdSznfoDpHuMA591YStm+EqUOUphGPO0ZSnfyyAxPkypGcg5N+oLngQe5CcuahpfH440FCJ/xLBOBrCxZOewqz76f7Qpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:37 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:37 +0000
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
Subject: [PATCH v4 07/13] gpu: nova-core: gsp: Create rmargs
Date: Wed,  8 Oct 2025 11:12:46 +1100
Message-ID: <20251008001253.437911-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0068.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 71edb129-68c8-45b5-fa37-08de05ff871c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?28MmmP7PcepEmrwYHPGFUpaVSwDMm0ravEPaBzc0mgwKM+lR1aUEYC9tZ75k?=
 =?us-ascii?Q?GJdbL4GJSyKg5LsQMLyr4ToBU3uOz4KCQwMAIQnz5jQ5bqi0Cx92krRe2/n6?=
 =?us-ascii?Q?xHFXgwK8MpKblTPm26QfZadWcHZpr5pbTVpC8oIwDq2MDP88vG8mag3jnq+u?=
 =?us-ascii?Q?zQpbLKM1ZJQzpPBtlAUliI9HgTcriRF16NGb+KlBSUYbcmInvHPdZSI0xh52?=
 =?us-ascii?Q?94OyalpxdNFG+1ZWe/E2NdLrWgKavNJ/RqtU0BnEDXr2TZKujpIs8lGCB0MS?=
 =?us-ascii?Q?X5UCMUCU0nuYYnWeIuicJd79hdgWFHETg7FIBl4OGJclmiQit0kY01BXPl+0?=
 =?us-ascii?Q?O3PE83hA7f5vVlsNvNsUa/TNYZ0nCfMBpgO9Zz50NisOqhd6ahO8SCpnE+LW?=
 =?us-ascii?Q?cuiU1LrgAw0UyPOhTo9u3f6nSZSXbyv6dtBesd7WeVUduwAjON9Zz5w9dBZl?=
 =?us-ascii?Q?7Kf412SkzICxJpcKn5v/wo4CA8ygQkhB7JleKUuBzmOmCJb7tWYF0ZvEEDYF?=
 =?us-ascii?Q?X3aWCoOs4odksXzRY3BkFl3btT7e0qwaGSeR7FSAS08mWLtyBdRtLCdyQBL8?=
 =?us-ascii?Q?pzGSJ3S5Lh3gmZRj99jzfQ5s8qlBk5ZjNgi1FPJMxLFfsJ85a4SuGeMcIBqp?=
 =?us-ascii?Q?KRCTCs42qeR7Qbh36UNzPQPW+25n6suy01h6mt8Irq3aURjJmSZXaOYFU6m6?=
 =?us-ascii?Q?rEL7Us5QaB/Cvufw2lWOaFRKImXX1/yUN7KO6sRDH6T+O5ptOyTwOJGS9FK8?=
 =?us-ascii?Q?47xUW6AfVNKfeamGAiGPOIOCpQ7PVgu2kBL+bobCScDX93gyTy4nCQj67LIY?=
 =?us-ascii?Q?XTggvsrgOjibbz4CKCZQypl3oKU+8aSJsEEPfm21HW0xODiD7MGNAzQtqEqA?=
 =?us-ascii?Q?txzoarB91AIUsKn7UXctDPgM+3b6wZLImUNwT9NO66P8H5GDheeZL+gbMyOC?=
 =?us-ascii?Q?Xab0oZWj1EK3HXCuVeddG/xn/Xu6UD11W3XkGwsOX/CgwhqCZuiDw+74Px9F?=
 =?us-ascii?Q?HGxlgx8vQGKloEZSc+m7cAI9YFo44YccFoylHRIo9AUWX4RvoOS+JGxC6rpE?=
 =?us-ascii?Q?F528E12sBm2V7u693g/Z3SxHYGkEFIAAWYrLUEpQXcTpQ8zyth/rPamF8Lrd?=
 =?us-ascii?Q?6xorsPZC8A1QxAgBq0Mnb7ToBDMVLKdU/hUJtdJHpeDMP3WuJQKN3CClsdVm?=
 =?us-ascii?Q?KXj8pKYtk6xMlsTnejirQ7RRFoLzuHfpcxeJ6YEN+rhkXeklokLT9fND+LFk?=
 =?us-ascii?Q?/mCE6Q90bTEe+as6B/N5j2qCYFzQmdpy1Q+tNbYXqbnGmY3C0b+LFhyBeYqN?=
 =?us-ascii?Q?rs38AVdb7J56VDImsGC8N/PXO2qZEEnQqHYVyCc04v+CppMvFqFx2EiMBLhX?=
 =?us-ascii?Q?b4Jp5PK3f3X1h56I2ukEWWv0bdHDS/bnC1kIbl4uHHr74iqkzGUo3GBVaQAD?=
 =?us-ascii?Q?yVVOrVhESRPoyznY+mR0TcVvvTTmBn7Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4wDYu6B9FEf7OHZYPp08wh5F2PzIJ5H1P9rztcwSLgjwFWpgzOzS5VLSFe/t?=
 =?us-ascii?Q?B/V47QlCZzUxp1TiExgXKBr+EHw9eQw1xQHX6Rc2N1uf8RKWN4f1cuqaDsxk?=
 =?us-ascii?Q?ebaBpGrgLQU7T4Besvg8PQZsJo1Z9SteCurkrGvBgtwqElAmxslS4PfyQHxZ?=
 =?us-ascii?Q?TVCcNfyJpehjoqATmHgLsSM1tsYHIdE018xZ/zZObktPMKbLKeSAp/cbt6Ft?=
 =?us-ascii?Q?g9eoTUarU448rOVCGPgbRIjsLpmAa76eyNWCskk7cu4/0aY9CYx9wOUjv+dX?=
 =?us-ascii?Q?UjUnewWJ5GTfRiB08LQZmffSrgduRfmqrojkn8H0JVcV0yYkYloLKbL+Ef8O?=
 =?us-ascii?Q?NSuZv+YgbeUwC2vUIUqDc9qhBnXX6RTtT9axu8AfGndhfKPkmI84J4k8zqac?=
 =?us-ascii?Q?Zon1yFvNpSSuSGEaScqj4Gountgzgayi882TASw5RCzLGWjmG7IjlaaLXOuJ?=
 =?us-ascii?Q?xZV/KPdaQXgphblgJnBsmlt4J8FAtsJuJypEY6/+4Iveze7cgpqgsosIpWO8?=
 =?us-ascii?Q?GDS7NtD9siS0q34qi6HhP38nFSc2J8Ww1copmXWvaIFYhHW+Xfmvgvl4lKc5?=
 =?us-ascii?Q?5sRY/1zODOSG7osW/z0hwrOHkTdHaJ7Zdp0ktB4JR9hbIZM+/F058y294Ggu?=
 =?us-ascii?Q?KbLXEvAxFZ3Zkha0VNBiFARieb7/H6p6BiNW1PzYUflol7/U20zmibgnQ+0Z?=
 =?us-ascii?Q?r6flvTv/NoFUsvQR1q8QpVIgat1svOqGMJZxkUgU8wCWi9IcwLQk4izfW9dT?=
 =?us-ascii?Q?fPGM8BMIbALp+cS0hwe84n3jeAdvgAKralS+9dS8y9Xtq+++WB4iQKuHkKUD?=
 =?us-ascii?Q?LIH+hYmm2DbEIGUYPw9MrGPLsfoymxiiBE9CdNmZ03wCdOslPNZJgf4KEE8U?=
 =?us-ascii?Q?rZJwVdW3N9qKGfuCpOIbaaF6RzWwGH5jQO5B6BuuVvAPlkEOA22UoIpFpFpI?=
 =?us-ascii?Q?jWEN5xR7KxIn0UOtST5448YmWHr+acOd5Ty3tl7dzLLUxKUQWCuVK3ZYXWly?=
 =?us-ascii?Q?KJ3FIoO+0OpVV1SvF0Cq3uLHSR1g5RFxrdD5F3fQr6Yev3JZI4OGcJdno8cs?=
 =?us-ascii?Q?EE01b144UT8zpEaw51fIGA6enVJ8gGo/0OQdWxFNeCeZNU6u/EtlOxaYt7K0?=
 =?us-ascii?Q?mELMLIrpFShzsHySBu5+e/dDmGcgMbEKTazrBo7gcXbjknK/FpNCh5DxDz03?=
 =?us-ascii?Q?su4I9H5g8CTANtWHc4y9Ikhr2mc/apPfJgNFUO8BSeW4Iz4R1kh2JHv4LdTF?=
 =?us-ascii?Q?baP9FFw9NS2CzhAuDzEpmR1iNk8We0oM/VIPVTQSufyVDQzvz0hpyIhpfMUR?=
 =?us-ascii?Q?VlO+uIuWK5/cKvgKPftGm0lEWVfPTTcgpaW2FxSktQ6zPrwCQrMS5YY7DItc?=
 =?us-ascii?Q?idBRtZtqVFHsEBfb7olKNBgOpjYwWLgNZ0hPvFs4odhVhDS2CLZ1312vaV82?=
 =?us-ascii?Q?+Tv5ffCdKVGL6xkEVp/cI0uSk1nwvrohOACZOUt0gDiq6eVFQX8ZZ63SK7Ak?=
 =?us-ascii?Q?PPrGklbTg1IbjtzIVKDP8+6lMoA63q9+krQjBPYB7K6B6qT7hwYgsE5nWQ4w?=
 =?us-ascii?Q?u2yNALVX5O5grvWLom6VaiZbPURd6ck0vrNWJaSe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71edb129-68c8-45b5-fa37-08de05ff871c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:37.6703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pm6TY4wHsHjskfIejFrjAcHiGC7mdSs1dAfOWheB9vJURE+9JccqsEZppEIS0OKCp+5gsBbZ/FHfLpD9RRLuQA==
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

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs                  | 16 +++++
 drivers/gpu/nova-core/gsp/cmdq.rs             | 24 +++++++-
 drivers/gpu/nova-core/gsp/fw.rs               | 60 +++++++++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 33 ++++++++++
 4 files changed, 130 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ba385114498c..ef48da6afacd 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -20,6 +20,7 @@
 mod fw;
 
 use fw::LibosMemoryRegionInitArgument;
+use fw::GspArgumentsCached;
 
 pub(crate) mod cmdq;
 
@@ -38,6 +39,7 @@ pub(crate) struct Gsp {
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
     pub cmdq: Cmdq,
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 #[repr(C)]
@@ -94,12 +96,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         // Creates its own PTE array
         let cmdq = Cmdq::new(dev)?;
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
+
+        dma_write!(
+            rmargs[0] = fw::GspArgumentsCached::new(
+                fw::MessageQueueInitArguments::new(&cmdq),
+                fw::GspSrInitArguments::new()
+            )
+        )?;
 
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 07504d15bfbb..317767d8f521 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -6,7 +6,7 @@
 
 use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
-use kernel::dma::CoherentAllocation;
+use kernel::dma::{CoherentAllocation, DmaAddress};
 use kernel::dma_write;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -247,10 +247,25 @@ pub(crate) struct Cmdq {
     dev: ARef<device::Device>,
     seq: u32,
     gsp_mem: DmaGspMem,
-    pub _nr_ptes: u32,
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
         let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
@@ -260,7 +275,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
             dev: dev.into(),
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -490,4 +504,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
             .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ca3a33ab21db..d2ba6f98d05d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -17,6 +17,7 @@
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp;
+use crate::gsp::cmdq::Cmdq;
 use crate::gsp::FbLayout;
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -468,3 +469,62 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    pub(crate) fn new(
+        queue_arguments: MessageQueueInitArguments,
+        sr_arguments: GspSrInitArguments,
+    ) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: queue_arguments.0,
+            srInitArguments: sr_arguments.0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+impl From<GspArgumentsCached> for bindings::GSP_ARGUMENTS_CACHED {
+    fn from(value: GspArgumentsCached) -> Self {
+        value.0
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+#[repr(transparent)]
+pub(crate) struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: Cmdq::NUM_PTES as u32,
+            cmdQueueOffset: Cmdq::CMDQ_OFFSET as u64,
+            statQueueOffset: Cmdq::STATQ_OFFSET as u64,
+            ..Default::default()
+        })
+    }
+}
+
+#[repr(transparent)]
+pub(crate) struct GspSrInitArguments(bindings::GSP_SR_INIT_ARGUMENTS);
+
+impl GspSrInitArguments {
+    pub(crate) fn new() -> Self {
+        Self(bindings::GSP_SR_INIT_ARGUMENTS {
+            oldLevel: 0,
+            flags: 0,
+            bInPMTransition: 0,
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 3d96d91e5b12..b87c4e6cb857 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -319,6 +319,39 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
+    pub sharedMemPhysAddr: u64_,
+    pub pageTableEntryCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub cmdQueueOffset: u64_,
+    pub statQueueOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SR_INIT_ARGUMENTS {
+    pub oldLevel: u32_,
+    pub flags: u32_,
+    pub bInPMTransition: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED {
+    pub messageQueueInitArguments: MESSAGE_QUEUE_INIT_ARGUMENTS,
+    pub srInitArguments: GSP_SR_INIT_ARGUMENTS,
+    pub gpuInstance: u32_,
+    pub bDmemStack: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub profilerArgs: GSP_ARGUMENTS_CACHED__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_ARGUMENTS_CACHED__bindgen_ty_1 {
+    pub pa: u64_,
+    pub size: u64_,
+}
+#[repr(C)]
 #[derive(Copy, Clone)]
 pub union rpc_message_rpc_union_field_v03_00 {
     pub spare: u32_,
-- 
2.50.1

