Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81096B50C73
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 05:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E662A10E35E;
	Wed, 10 Sep 2025 03:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S/cA+wZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEAC10E35E;
 Wed, 10 Sep 2025 03:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWPzMBdZakd61woOFonWrRVRJnVC7DA4+DqbfrvCge15WR4sNz/EMAIBQMeVe2SbrSKdF97a7N7H9PzsXLmdeIxHhHscGz0bJQnQxXEOYwFoXegFPrks75xdmEJNYtNXauBKDb1jsqALsUoc3a7/xgZewopCvjC1As2c1GPYeUyMQ3Dv8pZpSsjLHB1D9iYkw6dTdeCQlKZhZECEsBtguCalIk2Sx7vinRL6ywS6KHPDZCPoZ/RgEg/foIJtUBJs5Tn+BfaUHrgIOc+SyDQVJVR5BOw5aIMb93vS0wv01+7Gq0ozbRxJBDM7xP0jwigWanA6TLCN6hfjppaeteMMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWhva8i+lHiKOecWjfktKttB3Sy3C6bskyCAXLR+JA4=;
 b=Lfz8AU57wD3Ny/gNfP9sfwNAx2T0wU71JqQBbeEhxd7xaTD4C4GB1DTkD3c1LHP3/R0fmMqC3QNVBZnQ6gQMto5EcH8GoIcmPtXs5YUG8BEa9qSOVrN6FJQRgy41mKPmc1xV1+mpuLDoRDTBn8hPlixFVSr8V3YWW1miOjcL8cmAn7pbuKG89rMf4k1v2o9SHBLHPSZDFuVEDn7ymavfYRGGwI9bNBmem9t3ByRrx4R7GEjgiBvNkl/ivRLA3wFm2tq3BRFGvbi53vpHuGszxXzy6Q14PnRJn84qk63DgIj15mLOoCrJiQ81r2o9YeXCGf4fLR+eM1wy8LayBa+bMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWhva8i+lHiKOecWjfktKttB3Sy3C6bskyCAXLR+JA4=;
 b=S/cA+wZ6QnZZb1oXW49F97/hNCTvMrsl/7CnXklOuUWnxyGgsOVVEGbX9mSKEBb5hpk4CoWSkVwA7JuT4kR7ZcXARgUp1quRc0FayI6jlmnFadf2rqAgy/5H9taPRCAmN6HqJki6vh/mnNZ750qg77TdSG21j60nW9hSVZbd5t202AkWYBCC/0mr75BtnFfQz+s98JHaYwh2mm/oSsDy7WUuH03NA+vQPk/eHihf92+C5erkFXXzcAk3ZTZ1ToDUwxfGx5K0Szv68eEQzpxbSiOYiRAVItHI4IAHuSDT6afjp97kabccgjwaZgs7CUhaLmTZVLkKKjb5T5h86IJ+TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 03:54:29 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 03:54:29 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, dakr@kernel.org
Cc: acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH] rust: pci: add PCI interrupt allocation and management support
Date: Tue,  9 Sep 2025 23:54:15 -0400
Message-Id: <20250910035415.381753-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0072.namprd19.prod.outlook.com
 (2603:10b6:208:19b::49) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c3771f-1edc-4999-8492-08ddf01dbe17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TLyVIJSKQJhbdTQfOHfD4YzsJsosOCse+S06eEaG3dgc38ZsY7i+6ZNYbAbO?=
 =?us-ascii?Q?dJrdjNKbISrOUxoy9yALIUc8glzJ+q39R9TXL7Q82JETOHsCgYXTCstLroXp?=
 =?us-ascii?Q?f4vwRRh2zIQx3G6Zan7XJ1hFbL/PbydGXbXk3Kr4kIGWup9/bCME1s3pU1mo?=
 =?us-ascii?Q?DhwCNCFlSMivq8X68B0D+RAE73XoyJkP1e4hczhZE7lL+dbL1pfOgfhFmoqc?=
 =?us-ascii?Q?2iX/peQAKatEsxJvenyH0Fc2IuAKsvf9aAXn/X/B4saJ6h2KFrhscCSZGvto?=
 =?us-ascii?Q?opdrNSICJAkDfqBY4XRMzvIPoobJciUnqoEHz9j6asCz3dlz6NKjAzBxQO6u?=
 =?us-ascii?Q?nkrQwjg1B+mcmpQ08GkrQI0hMJ30uQUzS7gsqJfnCe56U8Zmc5QSyxOSnf0D?=
 =?us-ascii?Q?phTMe8+EHqelmRlO67LQtR+qNITdqdU0EZOafAsfuahDVUUCZ4Vxt5qYN+SU?=
 =?us-ascii?Q?9LUNJyL9JNdmmFgJ10PMCqbQFqP1IXuSDXzR2U20egALDX1DRopdcv78OKhz?=
 =?us-ascii?Q?Pe1vKBqjNLHLjaiTqfWISTxr9Gv5WVzs/hXCLBFG9h7RBcuSrkP6yfXRJTGO?=
 =?us-ascii?Q?W5aDKttObX3+MkxQ1R3Q9pMvRgdCes/L3LjOWAQgnYabtL94tooZa8raeDGO?=
 =?us-ascii?Q?RUfJo+xZ8rJeuVDrPr6ZtsnYHwBzaWH00gOKQ3KrOzellnT2W18rCFVPCa6C?=
 =?us-ascii?Q?jAaGtfHU7Ir62x3AHIjrMDxumDgpCEk4aH9g27JiYc7oHYJYoVruhhNn7u2V?=
 =?us-ascii?Q?Ifla9k/QDpx2QgpCW0HBA7RInkrFd4UhIeKA4EVe3kM61kZ51mKo0Ox6G3kB?=
 =?us-ascii?Q?9loq6cgEyc5Qm46xx4WFZvBPTpJ94OiNvF08utUl1NXKyxy95U3toC7lfh9E?=
 =?us-ascii?Q?1g3PgVqx5xEy++rwO1nT6IehjSLpu48CtrBz4JfOwGv5nxRnuyBQ2xeMh0Gl?=
 =?us-ascii?Q?zxODVxU7FesA+cswJrpEUek07+riy+lg3NMiiUgslvBIkS6AcnoYy2pSGsJS?=
 =?us-ascii?Q?rFe0wiziaUc6XoGKfCN3Bn9kkDWND03ndicE8OTNHkLGUv1qxc2m7QIcoVWj?=
 =?us-ascii?Q?WY+XhFs5UeQtir6VAMnsOcQ18v+YHBxKPO9m0LGMXJDGD6F31i15bKg39Ag1?=
 =?us-ascii?Q?4h47P0K7QlDTKm6MUziSdlxFDQfi0hOWetpF/lDhQtobY3W0fRFVkjrCOWRg?=
 =?us-ascii?Q?p0isOH9iZwRs/apjMyntdxXHONRZf0bg42m6BePcZOaUbIt790GBPYSMGVgs?=
 =?us-ascii?Q?/ZoQPJJ9vD1LzgcgCFbDsZZFySKJk/S1uG29APoe64cY04S0aIN3AALTLrd6?=
 =?us-ascii?Q?kkHt1lXEFeEsF2ihUrBSJe1t5dUlMKBbiUXAvdzOwIbtzcUy04FHlPEmcGtB?=
 =?us-ascii?Q?2EvsYsh5Jg3y4lj/HTpLRQ5r5BKlmcG4CePKxLBlrUhPX50un0W/3QypK/B5?=
 =?us-ascii?Q?OhUNcLpv2aE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtLPaavU+5OnDobSQRllhqp804nhtryr8UdXaMvIQwTMl8Rijwdl7Ssi1ZIR?=
 =?us-ascii?Q?5kybQvYDMItqxIMnA0nGzVGkrbdNegGGG+1uI0qMIi4DwwHd7APhcevIlZBZ?=
 =?us-ascii?Q?tiJ8j+ENH65zQGRpV1J5zTNwLD5xlfalcDz8afThIhdhxLG1s8YcBni++4UY?=
 =?us-ascii?Q?Q3YnqIffOGkVTW8G1otR4jM158KJkQUkVG9RukVwJhqaSX6bJheSda6nIUnm?=
 =?us-ascii?Q?7HfgOxgIfjQ2SmTOrE8Mv5e4d7HYERlecKc5YVG9Ul88OKZHw/scwV7WVXCA?=
 =?us-ascii?Q?L0U8uG7UXBQ60Trq3EXgzX5Kw2aqEG23QvEY+b5FVIT1H8wx2zlZegkNvusy?=
 =?us-ascii?Q?lDPBL33FI96FwEAAZzG9S5CVODzfCOX3ER9Yb0hbKeuYL+v3IaVCBY2QwbTC?=
 =?us-ascii?Q?RTpJAfeKvEeIyiHB5wZe46Frms2xXuFHNeDgnMA5381FCSPHUuTxAp/NCCpk?=
 =?us-ascii?Q?OdPA3CBfZ5CLBQIK94QZ0asxV9kWVGgo/t5fjXibzCNy/BDDYixve9Oz+yn4?=
 =?us-ascii?Q?ICUjTnofajcypZ0L3nerPV9bbFdPgb+4M+oh4KT8/lPTaZm4BlAmtHshYnIu?=
 =?us-ascii?Q?ISAgK8yrlWJMyeBaKGCnNGz+dn4Fx9qDp08aEIadf7Ves1fgf+9X5U2Ni4mT?=
 =?us-ascii?Q?elA7C3W1iZ504rWuqGqDXa9qHtkO25Fw7q/JUL8OK3l7NDra0iVDsDjcwKBU?=
 =?us-ascii?Q?rrKr2swOtuphNhlcYMkPwvVshb+hPyPzrroHqUVsMbvfjHzfHC4CPfF0yw/x?=
 =?us-ascii?Q?UR8u9eJvzFuepJf+oUetNnfuAOtK+yhq5eb4Id9PaeLm+v+sHnYo+RxYChbc?=
 =?us-ascii?Q?padH5+qCFJX6z7Y5gQkNXK1zbejBc3TNU7yjvbA0MHQOq3260AjNA6kwLdDe?=
 =?us-ascii?Q?mYS3baX7iFgE4N2pqjdcYkL35O2korqBQR4h0JM6LIO7hm1VO1No9eKrEnnq?=
 =?us-ascii?Q?Eja0TB8QAFw5L4v9GuKt4jaEHej26FWw24CmWCQleD9WnE1H1Kmy4rdsIDF2?=
 =?us-ascii?Q?MFCH7jA79+vzGOlnJvk9Vks4Vzky8Wlqt8SisYtt5EhUNh/HkRPi23DUOcg0?=
 =?us-ascii?Q?drIPCahEK8xOXObFcJVFzAU9ytXZsbez97MLqI+X9WwfN8q1cALzwtQUAZ93?=
 =?us-ascii?Q?7UkYqXjPDs59+08LYk6bDGCukUIi9Zb1KnR7hizKpWCsGFU18Du9Iw8eN9rD?=
 =?us-ascii?Q?UwRPH3Shk6RVYyx3ciWpe5ktIURrxNA4pU8TeWY0auhW93X6WRm1G0S3QT+h?=
 =?us-ascii?Q?vpeVnPmOIu0Dqa7+DtT+lEPynvnzwCOu4JNAIQvlpBl9A/7ffZ052VpK8FyN?=
 =?us-ascii?Q?GWC3gXK2OqUCbdNkxBTaykSZQE5mPGzB2KVwNokBDJmPrZBMEDjfb2t2o6as?=
 =?us-ascii?Q?q16nqALGvpH1J0WMKlOoJ8BSqSX36idwq7GhafYys0O55xiY2vmGc764GdxE?=
 =?us-ascii?Q?8GZjO2ezvhVXVu0cupCM5CEN4F46rlyWtfbC8u1z9rzQG/p2e0LJ95cNkYcm?=
 =?us-ascii?Q?ziPfEfuFd2V2ZuwT7LVfc+WIdp2fMtfnY0xmhO6cEjTuG6DQ2cyXX20uK6aN?=
 =?us-ascii?Q?Wykg9glfDLgXIAyGGHwbA89DgCafhH2b4pTFBtMT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c3771f-1edc-4999-8492-08ddf01dbe17
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 03:54:29.1853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58WAGbjUvZVz0O2BYurA0w+8Q9v74tZhK1vrQeC5HeJUL6E8f468WtX2A86FkTaqvW9xkDrTi3vfoIgndYcNGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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

Add support for allocating and managing PCI interrupts (MSI-X, MSI, and
legacy) in the Rust PCI abstractions. This provides an interface for
drivers to allocate interrupt vectors and obtain their Linux IRQ
numbers.

Add the following methods to PCI device:
- alloc_irq_vectors() for allocating interrupts during probe
- irq_vector() for obtaining Linux IRQ numbers for each vector
- free_irq_vectors() for releasing interrupt resources during unbind

This is required for Nova's IRQ handling to allocate and manage
interrupts using PCI interrupt APIs.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/pci.rs | 131 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 887ee611b553..98c3a7a04e88 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -23,6 +23,59 @@
 };
 use kernel::prelude::*;
 
+/// IRQ type flags for PCI interrupt allocation.
+#[derive(Debug, Clone, Copy)]
+pub enum IrqType {
+    /// Legacy INTx interrupts
+    Legacy,
+    /// Message Signaled Interrupts (MSI)
+    Msi,
+    /// Extended Message Signaled Interrupts (MSI-X)
+    MsiX,
+}
+
+impl IrqType {
+    /// Convert to the corresponding kernel flags
+    const fn to_flags(self) -> u32 {
+        match self {
+            IrqType::Legacy => bindings::PCI_IRQ_INTX,
+            IrqType::Msi => bindings::PCI_IRQ_MSI,
+            IrqType::MsiX => bindings::PCI_IRQ_MSIX,
+        }
+    }
+}
+
+/// Set of IRQ types that can be used for PCI interrupt allocation.
+#[derive(Debug, Clone, Copy, Default)]
+pub struct IrqTypes(u32);
+
+impl IrqTypes {
+    /// Create a set containing all IRQ types (MSI-X, MSI, and Legacy)
+    pub const fn all() -> Self {
+        Self(bindings::PCI_IRQ_ALL_TYPES)
+    }
+
+    /// Add a single IRQ type to the set
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// // Create a set with only MSI and MSI-X (no legacy interrupts)
+    /// let msi_only = IrqTypes::default()
+    ///     .with(IrqType::Msi)
+    ///     .with(IrqType::MsiX);
+    /// ```
+    pub const fn with(mut self, irq_type: IrqType) -> Self {
+        self.0 |= irq_type.to_flags();
+        self
+    }
+
+    /// Get the raw flags value
+    const fn raw(self) -> u32 {
+        self.0
+    }
+}
+
 /// An adapter for the registration of PCI drivers.
 pub struct Adapter<T: Driver>(T);
 
@@ -413,6 +466,16 @@ pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
 }
 
 impl Device<device::Bound> {
+    /// Free all allocated IRQ vectors for this device.
+    ///
+    /// This should be called to release interrupt resources when they are no longer needed,
+    /// during driver unbind or removal.
+    pub fn free_irq_vectors(&self) {
+        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
+        // `pci_free_irq_vectors` is safe to call even if no vectors are currently allocated.
+        unsafe { bindings::pci_free_irq_vectors(self.as_raw()) };
+    }
+
     /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
     pub fn iomap_region_sized<'a, const SIZE: usize>(
@@ -445,6 +508,74 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Allocate IRQ vectors for this PCI device.
+    ///
+    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
+    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
+    /// parameter and hardware capabilities. When multiple types are specified, the kernel
+    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
+    /// This is called during driver probe.
+    ///
+    /// # Arguments
+    ///
+    /// * `min_vecs` - Minimum number of vectors required
+    /// * `max_vecs` - Maximum number of vectors to allocate
+    /// * `irq_types` - Types of interrupts that can be used
+    ///
+    /// # Returns
+    ///
+    /// Returns the number of vectors successfully allocated, or an error if the allocation
+    /// fails or cannot meet the minimum requirement.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// // Allocate using any available interrupt type in the order mentioned above.
+    /// let nvecs = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
+    ///
+    /// // Allocate MSI or MSI-X only (no legacy interrupts)
+    /// let msi_only = IrqTypes::default()
+    ///     .with(IrqType::Msi)
+    ///     .with(IrqType::MsiX);
+    /// let nvecs = dev.alloc_irq_vectors(4, 16, msi_only)?;
+    /// ```
+    pub fn alloc_irq_vectors(
+        &self,
+        min_vecs: u32,
+        max_vecs: u32,
+        irq_types: IrqTypes,
+    ) -> Result<u32> {
+        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
+        // `pci_alloc_irq_vectors` internally validates all parameters and returns error codes.
+        let ret = unsafe {
+            bindings::pci_alloc_irq_vectors(self.as_raw(), min_vecs, max_vecs, irq_types.raw())
+        };
+
+        to_result(ret)?;
+        Ok(ret as u32)
+    }
+
+    /// Get the Linux IRQ number for a specific vector.
+    ///
+    /// This is called during driver probe after successful IRQ allocation
+    /// to obtain the IRQ numbers for registering interrupt handlers.
+    ///
+    /// # Arguments
+    ///
+    /// * `vector` - The vector index (0-based)
+    ///
+    /// # Returns
+    ///
+    /// Returns the Linux IRQ number for the specified vector, or an error if the vector
+    /// index is invalid or no vectors are allocated.
+    pub fn irq_vector(&self, vector: u32) -> Result<u32> {
+        // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
+        let irq = unsafe { bindings::pci_irq_vector(self.as_raw(), vector) };
+
+        to_result(irq)?;
+        Ok(irq as u32)
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.34.1

