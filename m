Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47781BAD03A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5EC10E5C7;
	Tue, 30 Sep 2025 13:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ecnGvC6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013051.outbound.protection.outlook.com
 [40.107.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20C10E5C4;
 Tue, 30 Sep 2025 13:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/3HvCUcLyJSrspyP04PQRlKR73nl0l72KqL3FSu5BQ/0Q2vw7s6z+lYWMjmk20n4h4bnfTTNUIkVi2XBIY1vi4JAraXrC0CbKwUGj12Eq1xgyyKj6hc0rAs7t17MCUF49YkawJkAj55+tRpyVspQsjTi8UR6JoCmgr8y7JNqOT3SX+yQPtaXAWbUiO6QM2lfWX9v/tQb3Zi+BGT3bqqZOsdk16e0SRt518QX/6NfqxX2MN22fOOA0L3zB5B5p0AWi49qkxznwWWLlDq+e3qiBZwr2al3OhhSn05/oFC3Tn50KmA2Fi3IA5KQzsn8lajVqjtljo8e6i1S86Xi5wg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6Fx4RrVp93IXe5aH9EEz0Cwjmd/cdBAOJ0R8//yekY=;
 b=eWgEPd5iy3RoMg5RlOaYzyznshgE+qYyzEBDludMOLOVB4pUGU4OTLLwf134GzGqLQCUGiHY9BVDvfa9b7cBOfQThFq426x+u8x7X5FWU6VxlAz4ItobfgHlgoKQiX+odKuXy19lygbDepDuAEezRzAxuyBt4zJ2QI7w8MWMBiX5brLSmXAW7OUQpGy4fkVIhLcbuOqALuEJOJFAZFdwCBD66HAzUHzkhMQN761eGLzKP+pVrA0ObmiofiVn0vwrU0vZiV1qM8FAEFvRhxeDWRaZf2lHwMSGvpotuTwzQtm+criJHWEgA/D91HPdAdku92+Mm8xu87lg6vEmENqt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6Fx4RrVp93IXe5aH9EEz0Cwjmd/cdBAOJ0R8//yekY=;
 b=ecnGvC6E6SXoUyn3eby17z26dly15gaXar09G5UiZQ2mX82u1ivXd3tE5+8ECZgAZX9j+IF2GRVJL5HHTz7GtiJtQdPd6qDwgE4MLs6/XFi5LrUn1NqbuEdXiVzpOAMQHAzkKZQVaBJu5WWoEIngsvcnaboC+modpNsm9uBYt0r+qfbfOw5iHVW4K8ZnIKff3SUOD38G3B/3dCj7GQf2RIR7RcGDyptbrgC73c7bnVd0ByuZexM2+HN91NHicFemIpT0yIzNmSkCLqpsqLUGcvn5hwzbVXztTTtFFq5+aImbpsbihcBm33RF0+Wpi31Hp6xz6t61bMK1QvfJtJGDXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 13:17:33 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:33 +0000
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
Subject: [PATCH v3 07/13] gpu: nova-core: gsp: Create rmargs
Date: Tue, 30 Sep 2025 23:16:40 +1000
Message-ID: <20250930131648.411720-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0004.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b45f464-3fbd-4697-6d69-08de0023b703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/jAVwO341Z3V1m5cgSBduCj8H9RjM1xDf1X5G5ALdJdHQog6rp1z0/tT/D4B?=
 =?us-ascii?Q?rTS84e+mYpu5LD2ePFA9zXEDsD6VbURch3nfWu2V4K2bNnMK6e56bOqnERBz?=
 =?us-ascii?Q?l7AXSR8K4Q4oVqKMBDuV9eHdkGge7Ymbs3qH76cxhNPMk8zTXqljV+aYYe/V?=
 =?us-ascii?Q?bGhl5yT/mWiAqBMcqXq8+2ik8a/KQmqdHHptN6XtCFxvuBXdxwcr6gMe6Rro?=
 =?us-ascii?Q?ROk1yixrLJP/67qMORZKT9zfFuYyqU1K99vRy1773qzCb+op3pgLKL2Q5LYq?=
 =?us-ascii?Q?p9a6cRn54fAvm31R1bK/FT7MVaS+154qMDadXhN2dASrWZq3xpvajZAOpcJX?=
 =?us-ascii?Q?lFUSuCXZ1OOuCnK6obAMt9NR/jgHRzJUTcAc1paNdKBu5AR9cxFwkdQZn0Mv?=
 =?us-ascii?Q?hEVK0DZMpHviQgkJECI29FvZytZ/ZLEz+bxBATSLEuq0FY1GhYwZLQ6nDWet?=
 =?us-ascii?Q?5UkSVksSm82E49RqCkBcnnVumieYdbySl3gXrgD8ehqD7k4QUA2xFzdVtulq?=
 =?us-ascii?Q?lZsLpa4UXIJViK2ZmFFM5e2y9MZ4UnPRZE7h/aGlPtTARaBXDjHE6s7FGN9A?=
 =?us-ascii?Q?mhuXB9NfVu/p7NUBwtE6UZuUQvUcELrGWCVldkF9L/oweUQai4g4EC4YGAzu?=
 =?us-ascii?Q?lbXCWrYVSddruWnYJlgcTl55mBaijfS67IK55qkagrmgcWBgF2hiiHJbyRFW?=
 =?us-ascii?Q?5LpytD6VOoV90jU9yxmA+RS8x6MHlih4pK/m/+rRpQX1szwbPXzaK7dsx4Jy?=
 =?us-ascii?Q?qEJhjrVIQ4PiM2M8YCy0KAqg/WblPS3xKR2hF60RZKKgQKqEDD1mUZN56ltD?=
 =?us-ascii?Q?DvW5vBCdNuQ8SIDmOS4BwoGkUKWTk39aAh/VgfgBFBESXLRZQhtr+YnQuBKw?=
 =?us-ascii?Q?6Wdt9oESOZyuxrk2l7GWfPpv9aXPNQVjuTARkfimGZ8KnDfIq6Vwyeok0Fq4?=
 =?us-ascii?Q?LNt9c2uFlYX+MgXzRsaLvezzbiALeGmhaasxFD7fZ412MQEyDr4TKUFsSXKs?=
 =?us-ascii?Q?0oYHNl2jbuoXJtHu4K8A4S456R4VHXP8WuyfwkfFdLTGvsF1eIYX7zIwiI6E?=
 =?us-ascii?Q?q1AkITmgLEx0i9WckigJLSn7dm6w7fwbJbH4qkqPB34P+8n54+qpg+a/+mTP?=
 =?us-ascii?Q?kEtnvP6Pj6ru3jDy9mWs+IS+dOXSgQXxDJBGPUuN3j4T56uK5M4YNNSE8mXP?=
 =?us-ascii?Q?grlYs7LR/4DPup0+4dJBrOXWzNoIRUSqmSNMv8pYpXhjpYHwuuHJd5wlzqZJ?=
 =?us-ascii?Q?eCOtTgZh/hXnVV+VIEp3FijZqobFUyJ3H8a7PxO8VnWkwFrlPF4dlEwoLAQp?=
 =?us-ascii?Q?Lq6ilhX4jUYHv9FeFHpj5f3Wq40z1bPqyaV0eJnKBQdn1VAz8o6w0kT2DZml?=
 =?us-ascii?Q?Tu3yKYUl1TGbdMSn/khNqvdtm2wiq7xEtIYSGOyhxc7YX+qdSsWXe3garjpB?=
 =?us-ascii?Q?L4V9rE7C4M11dxg6Y2B/FJkr2HcZb4JV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?13SreGR7t9kpC9a2Se2Ch+6x4KwuIEQImdANzoaik1vQ7OKr8xkr/8wEd2ek?=
 =?us-ascii?Q?+/m26y669n6URUYVcGS3kcGaaHgA3Z71y3ko4T5MsYnPE3qrLgWZxFybchKL?=
 =?us-ascii?Q?J+e1+i9WKhC6cShgxv/umT5ukr7XZpuHSjs1Es8iUEOvHmvsnR7o/t9cq904?=
 =?us-ascii?Q?HRaWs3HlCdkv9e0yUVUst9CjMYuGlHOK3oETGepTy2WtdX/6rIuvNwtjAo2/?=
 =?us-ascii?Q?wNq6dNR+V+Tx+fovf5IjwnNpq74i5Kvmlk0F6+EVL1CBx4rc5t9q6r+PhHHM?=
 =?us-ascii?Q?cCPX39VqdCFphhO7XHazPYdxToR1aKSEQqZyQFCgHavxrRUa7rI9kPsK+cAp?=
 =?us-ascii?Q?817v1BxhAyxlhj3K8e7xe2WgL4O1quCnIO2D6dLfWCE+yt2VSuNIMl6APtoh?=
 =?us-ascii?Q?DIBfUPrxV76myxhVj3Qwp8n2spl8g+Wd4Zx5jnRgv58Ymy996A+Sgcu6x1kX?=
 =?us-ascii?Q?JuBjD4R7x1j17f8liV4cQy3T2V3FFuLfWKFCycFYRWVEAElrnzyqW6syl4cP?=
 =?us-ascii?Q?6iCWbYjtlpwHqJUHbOATABlN5SAa295hXIAjZgyPm29ldzf4Pw5NTUqdLw3C?=
 =?us-ascii?Q?Pf1ir5d+1jX0b1c3W8M/8ny+G4iQd+OM3qtfUmoZXHdqDWaWrk26iLUHRYtG?=
 =?us-ascii?Q?bycxGHlvRSchAWGan3DAbJ9bukoyGTm2R10rHYhvjSdTrO/iDp4JI47efBzX?=
 =?us-ascii?Q?biSuBUjGLR9/NFFTxRQIuxPupHeWuopmfxMMm1P+Ur+1+1dubVgfBwUKydbG?=
 =?us-ascii?Q?qI5fWf5X3jkv4TzLnTsVHMnYl9x3BmaHz8wa6KFJ+edRgf5Iqy4RhOMO0+BB?=
 =?us-ascii?Q?knNaD/xxZCaYBeDynGRURD9QmW/VvEAvAZ2CFM3qo8Rz+biEz3g2KjbfKrNG?=
 =?us-ascii?Q?OZrR0/PybplRtSfg8ii58MzsYbeYiJmDNbvFiucMzHuR+iy/oDw+NMz4r/WG?=
 =?us-ascii?Q?0XMi8oSIN6MtA6lCc/5xuWpo2X3PW2/pa92BxPgLBlzhTPCrgbSRod8i6fhu?=
 =?us-ascii?Q?w9R3dew7kGUIBA1Bk/PxqRN4J016ViLuQwDRLpPrZsrSUZijMvs9lMSq294S?=
 =?us-ascii?Q?4tFbjCqSz0zSMNDrs99fXouSUfdBauqz1JCdKHUawd+MgccFe/JIX/xUxz7u?=
 =?us-ascii?Q?GcFRANBYUy05JIagZjSh3cDh5BAZfdhiM0aqBwnwVvI3fQDgPtrjybCZx21M?=
 =?us-ascii?Q?bByfCSiRMZgmLT+1520KogFHHugDpg469ESqocPVl/CnNyQQKva0LgQpbVn1?=
 =?us-ascii?Q?kA4LC/Vrbrzbg27dQaw4xFnJoWH3tldbZOp2tSPYl76ACfdpGmUh84eP9TWV?=
 =?us-ascii?Q?VlTqRuabekXjbxGvIS/9gcZcQ+JisVAZFCaD4yF4iSfMHGAUJgtnySIOnIZD?=
 =?us-ascii?Q?NGfXImLyECjJtqkU9kaiBu9V/PnCu4ShFi1XX7KQJ+SzZb+aX8KaOA2wehxX?=
 =?us-ascii?Q?mJ9+E/6sHHiL+U5vqO7vsISDFs2CJN1w+ch2Ht9wTHyQRlHns2TJADD8VMkQ?=
 =?us-ascii?Q?+9cORpc+N7r/GR/i8RAWp74ZSMwNipaJhSV2igP9xTvi5zGWbZyLM0Gskfgc?=
 =?us-ascii?Q?FFxs4yxdPzHJd8aHxakCRcfclYavJmDU6HmaaqYK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b45f464-3fbd-4697-6d69-08de0023b703
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:32.9853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bch/aMsPt6Gz/TgEimMmYijAiBNnFP5nqoSKV8T+/SEExoeeTt27K2yxTvqYL3Hn4qEz8H5wljET2EwXw3sk9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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
index 3132f1009897..9e5dd9e5a316 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 mod fw;
 
+use fw::GspArgumentsCached;
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 use kernel::alloc::flags::GFP_KERNEL;
@@ -37,6 +38,7 @@ pub(crate) struct Gsp {
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
     pub cmdq: Cmdq,
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 #[repr(C)]
@@ -93,12 +95,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
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
index 7d43dc987ba2..2fd6b31db9e9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -6,7 +6,7 @@
 
 use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
-use kernel::dma::CoherentAllocation;
+use kernel::dma::{CoherentAllocation, DmaAddress};
 use kernel::dma_write;
 use kernel::prelude::*;
 use kernel::sync::aref::ARef;
@@ -202,10 +202,25 @@ pub(crate) struct Cmdq {
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
@@ -215,7 +230,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
             dev: dev.into(),
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -399,4 +413,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
             .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ee86abe7ea10..aec0db50adea 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -17,6 +17,7 @@
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp;
+use crate::gsp::cmdq::Cmdq;
 use crate::gsp::FbLayout;
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -453,3 +454,62 @@ unsafe impl AsBytes for GspMsgElement {}
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

