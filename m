Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6554BC6685
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 21:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4BB10E078;
	Wed,  8 Oct 2025 19:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TAoH71Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8628E10E078;
 Wed,  8 Oct 2025 19:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pE5xihYmYNV9wIXj1eGTHkelrE8xZKqfQih6dzKSO04hTJH3wDXy1ADPEmNASkH91FV0LthYzxzJRh7Kc82t3vFt7NL0Tak0A+mfJ5mYo6eOWlPbXN5HL4rHCIOsSI8iyWLWQ0aHbjD/aueaac2D7kuxO4HduAa3VvIwV9kPyzry9L2OyEe9+y0iw5sR3H1u9/gVMeJXeLkE5dUqj/xQun7X2H/+5UCR60RaCUA67HKYYf5C0Rvl2hr9cv5Q0oNyIBUPbTIYDCul/Pz41uUtLMc1ISUV+7VtkxTmF9h6qhrnR/9YrmybzfICvCRkpXPeDdAroNIoWaT1zvFVUNHKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrEOdzd9Lz2jvXfkqgUhkWB2PEcB+b1bQy7cRP1tdS8=;
 b=yisXWRndasgVrRI6KeSG7wmRHTOlpHMiZy5bP8tYDB5oretK6pp68p+C5i/3pH+nkWnSJJvDdT/a75T4sQIzTfV7hYtppY0AtU/QcNLsSgagjv997SzTrKyUjMB/Z6O9KAD0KAq5Ud2yzIpgIHD+ugl12Z1ilsjSqX3UCoxHIWB885I+Wue1gE5Eb0QjymSELFYanTylzQewtp263g9S2Aa09tCowqbHKrf5OAzTYJyuhP2vP9T6omJp27NKueqDFMa16hrVDWuspPkdl5U1fgGps8COhRbRGYUl6N+jl9xioRQNOIOs03pH48xX/6kdVBbZyIxBN2/58DEbrCrDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrEOdzd9Lz2jvXfkqgUhkWB2PEcB+b1bQy7cRP1tdS8=;
 b=TAoH71Mv6tpAJyA58OUX6AfCp9AawLVsAJsfvZevk7sZ7LYI5xBR0zQ9LGS52fuo09umq9hfxRKsSafIPuMNBAJSvjNLbp3T052jCynR04DnXHYXT20YiT+7noo1yN0Qe6uJxs8UeLtL6zxwj6or7eOY/ysDGh3L/krFjhFJ1jVQ0JZx6v6jnoMaxKB6JHOh5HOvpwwltq4+gU/hMMzU/nl37Dr8vFHnr6D4DCZVgMXKVcifZzuCBGOZnGT1Xl7QkSQZIBK++JczTDy5Bgjx8ioP3R1J26/ML0PGIWW1b0/JlepPGQUo0wUdpfmlBzZsrinZcF15svWJfFTU6kVMJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6087.namprd12.prod.outlook.com (2603:10b6:8:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 19:07:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 19:07:31 +0000
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
Subject: [PATCH v3] rust: pci: Allocate and manage PCI interrupt vectors
Date: Wed,  8 Oct 2025 15:07:26 -0400
Message-Id: <20251008190726.823527-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6087:EE_
X-MS-Office365-Filtering-Correlation-Id: f212f308-9375-4f6e-4f0c-08de069dee8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BgRWtgF3YasbKdECFRtUV4mqoa7S8h1NKBBUctzwHblNeh/KK+Ohy+MlK5JA?=
 =?us-ascii?Q?NpIm4qgXaNvguzMT2PZBkmRq0zJGbyN2B0c5moCajEKKTSR1dtC3VHUecMeR?=
 =?us-ascii?Q?iROFQ2y9Vi3DJmisXKnJFlS77gehSJUUuc+IhMbJYyih7tcm2kxd/XwPQPij?=
 =?us-ascii?Q?cfyKKc2MNaycpVEIz5Z9xpCu6ffvb0VTIci9wBZXgqqDZxi5SW2JElDqrhWJ?=
 =?us-ascii?Q?hnyb0bgg8zDgUIpr6mITb/2rwpXOIYc4zDNgDYhU82TW9B6jFn25KDx1flN+?=
 =?us-ascii?Q?8Z9A56LePEuPDjeX6To1b3YSpQw8Ia1PTRFDVgBFSnw38YUPOFYmANcxOKjm?=
 =?us-ascii?Q?VvG6ZMN/hjQvUvIgBzoLE6nA/GGKeVPtaRLoranhBKfDfqg9qUVymiPA6YuM?=
 =?us-ascii?Q?R/aRcom4SxTSCH4lxEIruU0RIVXf2FtbHoXMYxooo831mI4kM/RT8heXgAdg?=
 =?us-ascii?Q?n9xC1PLYJ/PQDxS2d/pMLs+2nTzGmIV2Tn0pvgA+ELfr3X6WR8PCKUvITddV?=
 =?us-ascii?Q?eehRl0USZZUDEgVlnqqMl3ITYKHGtFfOh3yb+Q8tJT8B+jhVyboB7GgJPCpn?=
 =?us-ascii?Q?f2cBy3XlH/CwVQfFrETb/fESDPgjBu+Scibgp7I0Ohi+p+IiCw5NOzJYHpQ4?=
 =?us-ascii?Q?j4/l6kDPGxAtfR8ZftGXkPRfu0yPyDFV/ZSC3yUCf7Z75iDgss7xru/2n3UB?=
 =?us-ascii?Q?10FZRJJ0iJS8L47M6zw9A1rgumQikBs+1ktNTGDqIum/Wk8PtwhfYdPwH+9s?=
 =?us-ascii?Q?gTaN82cw+fIXzHhg9nr3WNZfuvPSkHdImswa6P8vsjkWYk9IPOVr5WKQ8Tmp?=
 =?us-ascii?Q?7C1MdA2vz49n34LuMYGVqAZNjdPd4tPp2aiUzCEVQrmcTxFVb90OQjoEwtZx?=
 =?us-ascii?Q?VnkU07AAsTxqi+zCSZ5K9RNtD2cRrDDHGPMhz3LXYv4AQ2zyhLi9GlmtrgkH?=
 =?us-ascii?Q?6ylVWPTclsqtCHRABgj6rzmHzRJuRqN106Ie3zjfm00+FP2numO/oO/tTHX0?=
 =?us-ascii?Q?cRE6ojw4bkPOMXX9Jxt/4WIZmMdQMiGf/zUCaqGuZD5y6n8oJ2xzhfpTk8nP?=
 =?us-ascii?Q?zhbcY+TECikYBSnQFeg/T/Jk+OQoz4k9yB7VMuIrOLtfsX2eHdaTUTL/9XNE?=
 =?us-ascii?Q?GcsY8o3lC0w4bLpeuqkSZyxoo+7ZSmqZ9PN7CkbVPm7yKvy6qZttx9ubEPNS?=
 =?us-ascii?Q?2gwnjOqnbqf0lVs1yIRAEr8hciwVzCMj0lr56GdbVvn3stbFzuIaA4NxDgS4?=
 =?us-ascii?Q?wUX5cZ+R8feFChqjSpgbLVG7JvzH24rA5ubrLltcHflJMqFGhqabNwdPyiLF?=
 =?us-ascii?Q?o37fO/FAR+p2suNN7pA/T9YgIYgFIzFOh9kUS/yIzUSOIW0KANG2T36PloRb?=
 =?us-ascii?Q?5N2HzOd5ftq6iaqnSQIFo5ginzbvyDWcQCfnn20nD3OzpmqQllQQPVPdTDZk?=
 =?us-ascii?Q?IwrQvaGaOkBElLuk9NpJ13O4EymWzqas2sobfjN1ofqPJL/iEuBDsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QgipSE3U2zA+MEO6L6igRDBxdixNYHwQ0efFPwvSKAdIx/F09r8vudQqn816?=
 =?us-ascii?Q?T4YacbU84u0TFaACnoyz1DELWAq5859bWLjTklDlWJMy8UdoFCzY2y7jd9RW?=
 =?us-ascii?Q?cWX+BKY51UvlQ/9hSXTSoAr/LZWsDdIhrQo1uDuxNlMVGUeB+u+T/gS6CxDK?=
 =?us-ascii?Q?MoGgR7kcVPkxoVF6lEWI+fW2RnBPTL4S24b7XZqcq5KTPJ7cZYDByO91qmte?=
 =?us-ascii?Q?sMadyApwdpZzyrOrCPQYwuhfrefLF0WtYScQBKhMn7owT7tW/YTm49FxDfEt?=
 =?us-ascii?Q?uu1ll6LV9YFotkyAprhBuvmX5HlA1ty7AH3Eq8qVeDjjSJ3t8gMToOTJisbX?=
 =?us-ascii?Q?7PftjCGvNuBMgFVWlQhJ6Z6QnhLy/SJ5+aJxZjo6RCAfui9t/7BatwB/r7Lo?=
 =?us-ascii?Q?u50JxVs9J5TDB4lAgwnQprZ5aPMz8jiOQRUVaqGONrvJzbO/b9QCWHtFmA6Q?=
 =?us-ascii?Q?9CRKUQMEhNQYna8tCdJFnEvIzCuOYP58zssOHiCMItz91FUEXwZGp1ynLebj?=
 =?us-ascii?Q?62izmPDzAejOlut2tbIXtEgXa3isxpfBNaI0BZMKVAWCxZ5RXZOKMtqa58Mj?=
 =?us-ascii?Q?9OgNeL3EGC8H4tGOizUmG1R/JByX7XikdzsHbjeEz3MgAXUH1hbYPOy8PS+B?=
 =?us-ascii?Q?wyVqY4vpjTwClZDXNUEouApkGWcP+5XD/8sEsjqh8td+jES6VWmMwJu1Bn8F?=
 =?us-ascii?Q?UFlbPifFsfy3cwNcDnNcd/io9Q8pCbxThFU7WZz7mmfpsogGTm4h3g6j2qAA?=
 =?us-ascii?Q?SJ+hqJByaF2KLLOFevuwOAxRzbw59CImLhznA45z7z829N/KNmrJeViVhNSJ?=
 =?us-ascii?Q?T9cqxVQj16P8zZKsCjRBnCMCXIIpQrXL2kjz1HTKj+sAS9pA1D8OzY+YU2X9?=
 =?us-ascii?Q?o/6yx4yqyC0R9pFDYeU0atA79TvpewcYBKX0lzLgmr8X6NWYGcxgXHRt4vkL?=
 =?us-ascii?Q?Btw97eSlN3JSAoS+sCDAKiWLtZj3LbWS3Hx6E7uGgK128JMcAOr0mfIrhWMB?=
 =?us-ascii?Q?N6dS3ocjqzbqesddWk/ndgjTz/fbyAuY7a7FhORvKfZ2ZLAI96WlZ03dD7GT?=
 =?us-ascii?Q?YN9Ps0suQxYkLMmnUSF6ji3UalJ7d1ogzuRi6+DUotaijwpLjDcBH+KdvCdf?=
 =?us-ascii?Q?qKAvC0byNoB0j/sjFkBdD3imSltMP9dyTJz95VrEoSwtC3dGvd62kJDGr0lh?=
 =?us-ascii?Q?9tmkwLrd5hbFyK/PCYtneJ0dT27SejlVM70SnHT5WlAOO19v+GR0lrS700Ca?=
 =?us-ascii?Q?eI+rpPk86KgpV9MGUUnoszP5h2+V67S+/+8mf6QKtvxbFzzCC8RuCipB6Ngv?=
 =?us-ascii?Q?wUT1DT1mAgL+xRdTElqXHL9+m5Z1an5GjZrLtvEnSP4XoNYhx1LSdKwtTg7d?=
 =?us-ascii?Q?R9fMyQXVIlDAvHt3OH2Qfsfcecm2dCNkk+JbF5azmpI36T3f99/aOEuSuW4p?=
 =?us-ascii?Q?8w6qtSG/XxdCP0QsY82i3TIhK85iet2au5S4IDZZb48fSWT3gqBSz8spYXtG?=
 =?us-ascii?Q?YmCV8l4r1RzmwbXNAPjY92n/q42clbHig3D9pxMurFZOK5ECHzVc7uxLLjft?=
 =?us-ascii?Q?bPYof3NhkGWFyZdHCdzZoItZw0CnfQBc//hYE947z97uCW8TKFB50pCiovQT?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f212f308-9375-4f6e-4f0c-08de069dee8c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:07:31.7255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiRvdRh/nqQwmxbNSjjUrPNgOvjgez/cZRd6CiJCfdaCFMp7S028XhsyNJvVPEYpCj7rqg+6eav0iI1yIZmgDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6087
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

Add support to PCI rust module to allocate, free and manage IRQ vectors.
Integrate with devres for managing the allocated resources.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
v2->v3:
  Various changes suggested by Danilo and Bjorn (mostly comment changes and
  changing the registration order of the code).
  Link: https://lore.kernel.org/all/20251002183912.1096508-1-joelagnelf@nvidia.com/

 rust/kernel/pci.rs | 208 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 195 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 78271bf88cea..8c465d081015 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,8 +6,9 @@
 
 use crate::{
     bindings, container_of, device,
+    device::Bound,
     device_id::{RawDeviceId, RawDeviceIdIndex},
-    devres::Devres,
+    devres::{self, Devres},
     driver,
     error::{from_result, to_result, Result},
     io::{Io, IoRaw},
@@ -19,7 +20,7 @@
 };
 use core::{
     marker::PhantomData,
-    ops::Deref,
+    ops::{Deref, RangeInclusive},
     ptr::{addr_of_mut, NonNull},
 };
 use kernel::prelude::*;
@@ -28,6 +29,58 @@
 
 pub use self::id::{Class, ClassMask, Vendor};
 
+/// IRQ type flags for PCI interrupt allocation.
+#[derive(Debug, Clone, Copy)]
+pub enum IrqType {
+    /// INTx interrupts.
+    Intx,
+    /// Message Signaled Interrupts (MSI).
+    Msi,
+    /// Extended Message Signaled Interrupts (MSI-X).
+    MsiX,
+}
+
+impl IrqType {
+    /// Convert to the corresponding kernel flags.
+    const fn as_raw(self) -> u32 {
+        match self {
+            IrqType::Intx => bindings::PCI_IRQ_INTX,
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
+    /// Create a set containing all IRQ types (MSI-X, MSI, and Legacy).
+    pub const fn all() -> Self {
+        Self(bindings::PCI_IRQ_ALL_TYPES)
+    }
+
+    /// Build a set of IRQ types.
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// // Create a set with only MSI and MSI-X (no legacy interrupts).
+    /// let msi_only = IrqTypes::default()
+    ///     .with(IrqType::Msi)
+    ///     .with(IrqType::MsiX);
+    /// ```
+    pub const fn with(self, irq_type: IrqType) -> Self {
+        Self(self.0 | irq_type.as_raw())
+    }
+
+    /// Get the raw flags value.
+    const fn as_raw(self) -> u32 {
+        self.0
+    }
+}
+
 /// An adapter for the registration of PCI drivers.
 pub struct Adapter<T: Driver>(T);
 
@@ -516,6 +569,90 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+/// Represents an allocated IRQ vector for a specific PCI device.
+///
+/// This type ties an IRQ vector to the device it was allocated for,
+/// ensuring the vector is only used with the correct device.
+#[derive(Clone, Copy)]
+pub struct IrqVector<'a> {
+    dev: &'a Device<Bound>,
+    index: u32,
+}
+
+impl<'a> IrqVector<'a> {
+    /// Creates a new `IrqVector` for the given device and index.
+    ///
+    /// # Safety
+    ///
+    /// `index` must be a valid IRQ vector index for `dev`.
+    /// `dev` must point to a `struct pci_dev` that has successfully allocated  IRQ vectors.
+    unsafe fn new(dev: &'a Device<Bound>, index: u32) -> Self {
+        Self { dev, index }
+    }
+
+    /// Returns the raw vector index.
+    fn index(&self) -> u32 {
+        self.index
+    }
+}
+
+/// Represents an IRQ vector allocation for a PCI device.
+///
+/// This type ensures that IRQ vectors are properly allocated and freed by
+/// tying the allocation to the lifetime of this registration object.
+///
+/// # Invariants
+///
+/// `dev` points to a `struct pci_dev` that has successfully allocated IRQ vectors.
+struct IrqVectorRegistration {
+    dev: ARef<Device>,
+}
+
+impl IrqVectorRegistration {
+    /// Allocate and register IRQ vectors for the given PCI device.
+    ///
+    /// Allocates IRQ vectors and registers them with devres for automatic cleanup.
+    /// Returns a range of valid IRQ vectors.
+    fn register<'a>(
+        dev: &'a Device<Bound>,
+        min_vecs: u32,
+        max_vecs: u32,
+        irq_types: IrqTypes,
+    ) -> Result<RangeInclusive<IrqVector<'a>>> {
+        // SAFETY:
+        // - `dev.as_raw()` is guaranteed to be a valid pointer to a `struct pci_dev`
+        //   by the type invariant of `Device`.
+        // - `pci_alloc_irq_vectors` internally validates all other parameters
+        //   and returns error codes.
+        let ret = unsafe {
+            bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
+        };
+
+        to_result(ret)?;
+        let count = ret as u32;
+
+        // SAFETY:
+        // - `pci_alloc_irq_vectors` returns the number of allocated vectors on success.
+        // - Vectors are 0-based, so valid indices are [0, count-1].
+        // - `pci_alloc_irq_vectors` guarantees count >= min_vecs > 0, so both 0 and count - 1
+        //   are valid IRQ vector indices for device `dev`.
+        let range = unsafe { IrqVector::new(dev, 0)..=IrqVector::new(dev, count - 1) };
+
+        let irq_vecs = Self { dev: dev.into() };
+        devres::register(dev.as_ref(), irq_vecs, GFP_KERNEL)?;
+
+        Ok(range)
+    }
+}
+
+impl Drop for IrqVectorRegistration {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariant, `self.dev` is a valid `ARef` to a `struct pci_dev`
+        // that has successfully allocated IRQ vectors.
+        unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
+    }
+}
+
 impl Device<device::Bound> {
     /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
@@ -536,10 +673,15 @@ pub fn iomap_region<'a>(
         self.iomap_region_sized::<0>(bar, name)
     }
 
-    /// Returns an [`IrqRequest`] for the IRQ vector at the given index, if any.
-    pub fn irq_vector(&self, index: u32) -> Result<IrqRequest<'_>> {
+    /// Returns an [`IrqRequest`] for the given IRQ vector.
+    pub fn irq_vector(&self, vector: IrqVector<'_>) -> Result<IrqRequest<'_>> {
+        // Verify that the vector belongs to this device
+        if !core::ptr::eq(vector.dev.as_raw(), self.as_raw()) {
+            return Err(EINVAL);
+        }
+
         // SAFETY: `self.as_raw` returns a valid pointer to a `struct pci_dev`.
-        let irq = unsafe { crate::bindings::pci_irq_vector(self.as_raw(), index) };
+        let irq = unsafe { crate::bindings::pci_irq_vector(self.as_raw(), vector.index()) };
         if irq < 0 {
             return Err(crate::error::Error::from_errno(irq));
         }
@@ -547,35 +689,75 @@ pub fn irq_vector(&self, index: u32) -> Result<IrqRequest<'_>> {
         Ok(unsafe { IrqRequest::new(self.as_ref(), irq as u32) })
     }
 
-    /// Returns a [`kernel::irq::Registration`] for the IRQ vector at the given
-    /// index.
+    /// Returns a [`kernel::irq::Registration`] for the given IRQ vector.
     pub fn request_irq<'a, T: crate::irq::Handler + 'static>(
         &'a self,
-        index: u32,
+        vector: IrqVector<'_>,
         flags: irq::Flags,
         name: &'static CStr,
         handler: impl PinInit<T, Error> + 'a,
     ) -> Result<impl PinInit<irq::Registration<T>, Error> + 'a> {
-        let request = self.irq_vector(index)?;
+        let request = self.irq_vector(vector)?;
 
         Ok(irq::Registration::<T>::new(request, flags, name, handler))
     }
 
-    /// Returns a [`kernel::irq::ThreadedRegistration`] for the IRQ vector at
-    /// the given index.
+    /// Returns a [`kernel::irq::ThreadedRegistration`] for the given IRQ vector.
     pub fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'static>(
         &'a self,
-        index: u32,
+        vector: IrqVector<'_>,
         flags: irq::Flags,
         name: &'static CStr,
         handler: impl PinInit<T, Error> + 'a,
     ) -> Result<impl PinInit<irq::ThreadedRegistration<T>, Error> + 'a> {
-        let request = self.irq_vector(index)?;
+        let request = self.irq_vector(vector)?;
 
         Ok(irq::ThreadedRegistration::<T>::new(
             request, flags, name, handler,
         ))
     }
+
+    /// Allocate IRQ vectors for this PCI device with automatic cleanup.
+    ///
+    /// Allocates between `min_vecs` and `max_vecs` interrupt vectors for the device.
+    /// The allocation will use MSI-X, MSI, or legacy interrupts based on the `irq_types`
+    /// parameter and hardware capabilities. When multiple types are specified, the kernel
+    /// will try them in order of preference: MSI-X first, then MSI, then legacy interrupts.
+    ///
+    /// The allocated vectors are automatically freed when the device is unbound, using the
+    /// devres (device resource management) system.
+    ///
+    /// # Arguments
+    ///
+    /// * `min_vecs` - Minimum number of vectors required.
+    /// * `max_vecs` - Maximum number of vectors to allocate.
+    /// * `irq_types` - Types of interrupts that can be used.
+    ///
+    /// # Returns
+    ///
+    /// Returns a range of IRQ vectors that were successfully allocated, or an error if the
+    /// allocation fails or cannot meet the minimum requirement.
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// // Allocate using any available interrupt type in the order mentioned above.
+    /// let vectors = dev.alloc_irq_vectors(1, 32, IrqTypes::all())?;
+    ///
+    /// // Allocate MSI or MSI-X only (no legacy interrupts).
+    /// let msi_only = IrqTypes::default()
+    ///     .with(IrqType::Msi)
+    ///     .with(IrqType::MsiX);
+    /// let vectors = dev.alloc_irq_vectors(4, 16, msi_only)?;
+    /// ```
+    pub fn alloc_irq_vectors(
+        &self,
+        min_vecs: u32,
+        max_vecs: u32,
+        irq_types: IrqTypes,
+    ) -> Result<RangeInclusive<IrqVector<'_>>> {
+        IrqVectorRegistration::register(self, min_vecs, max_vecs, irq_types)
+    }
 }
 
 impl Device<device::Core> {
-- 
2.34.1

