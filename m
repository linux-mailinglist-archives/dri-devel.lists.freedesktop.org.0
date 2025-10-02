Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C1ABB4E64
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 20:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BABA10E37E;
	Thu,  2 Oct 2025 18:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qixTgRDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012009.outbound.protection.outlook.com
 [40.93.195.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B8010E37E;
 Thu,  2 Oct 2025 18:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAVSnVjRlzNdEy833nrR/WpWE5kRXjAO4oKQ8wgHxHY+S/yUq0FPXGDbSIrStAtXe04IX6gz6cXHaUMwIL3plwt0fq3fb1IUonpkpPioZNrZlAZ/GEk8ozSvWfoMNcJhOz7i+ABPVXotb4odtXLiTgActbJsB2emNtx7nOKdSg/cDa7wjCLxrq+D/OfKs6Ic6lEAvIkpP0pPEhsKQT5WGPVwAm9mvAqsvMxYXVPVjje41SxAhRZttjcX4ctubvc2wuDFqLJDpmsdbbAGgi715uU3IJeDKzkB2WytrSz5A4wa3NdeTfmktgS4P8rT34JsaeOEsBj4oAqYNEB/ps5NpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kklKnTVz/rS+78gfHIPB/CTw3jB06c3vvIJfJC4Z0Q4=;
 b=Ri/+blWqLOceEx8Ra2ZhJGu0C1KSWYQDLpf7KZT1oDhR1kRNeMiFJnCx6C/Y+eYw3D/9r4UBCi2lhydRgM8VeZ3pvwnN0ySIu/ySrnqI+Yg11AYTVaVLuMqZ28el1TR4TMEfLXPN1ilslry3ipcvrrRgGzFufUWmTvEPiwlV1eOlN3P5hwBoEvaYGKKJKBLeJWbC6yHDdeZlOn44k7XD8YWyhrPHz7CphtTyMChlPaobPD67wmj49OJ8kPgMT/p9zJqfygadvXPUSznRiD2pUMXowCDDlGCThAvkOB0uzJXISJi3+d3GJsdXevsXjdRdJkO+1664xQnOaGxOcos9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kklKnTVz/rS+78gfHIPB/CTw3jB06c3vvIJfJC4Z0Q4=;
 b=qixTgRDS2A0UQG+11+EMJCaeiYmlPkP0uypxAwgA9ny6v9ObWZ5kCAa1DvHQFTn/tg+9yMbu7rm6yUqsFcsYV3B/NeGiBQm1/h9YKfNBh/BXXlXEA3nIHtgDNxcE+7+zjBiBdpa9cYMWqmO7C5AsKWznH2BFuOAQVpAH5lI29VYpVsCNLg69xJRSU/2C1adgpclqt44TntOqz7GRoDEjH3bEqzWvg/UBeTHMTmUITIs26cWgiHCSB64AAoRhSDfIlxc+hn51gzeXllqDKcRljKWXjYWwalyFPecYaLvakDM2SpCyKp7YvzZ4AMdEwM2HB6DeSiC1uM3rIOIEhTvvrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 18:39:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 18:39:34 +0000
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
Subject: [PATCH v2] rust: pci: Allocate and manage PCI interrupt vectors
Date: Thu,  2 Oct 2025 14:39:12 -0400
Message-Id: <20251002183912.1096508-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 4815df2c-4aa5-4767-a04e-08de01e307fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S+j9S/ShscR9HmZz0eH3zsWtrc0srqpOw9iFezNpv/LsZVF+4rQu7dJlpA2v?=
 =?us-ascii?Q?wqQf1uuLZUd0tXz+PcmBMkh4DFXJdGe4Z4NFjn+im4mrBRKqMrdKWlCWofLe?=
 =?us-ascii?Q?b5lnXI2I75TMfY7Zqtk/0IVwXdHJS2+VkeyX6gBFd21TLF8NNh5Yzhj5S6AW?=
 =?us-ascii?Q?2hxtyW4D/Q+kUIrgZMfnedi/7vwciA1XB5uRh/5pyfAwIIMUNDzXBEmJRTqy?=
 =?us-ascii?Q?fkIesWqVX+Cmx8xxW7f4w84WJMPlkkszBs7cHtKRG2XsiMnDWDz91YCgYL9f?=
 =?us-ascii?Q?2YZ6r7YAqSw/mF7UtYAoK4YP67t5xZtYda8MGYRUHTMV0XNzPL7NbeNXhiZ2?=
 =?us-ascii?Q?RBmfeW5E4vdx1Hi7AaymCXlAIUPW/4u9F0WDJ+GRPa4X7R9EV0UCYSxRqiqd?=
 =?us-ascii?Q?qpQLnivSa+cSCLJ+Fy4AM/vradb5U168l2/uKkuIcR9kJyU72JZppfF9pheV?=
 =?us-ascii?Q?tNba9x+pL7+YdsR3G14wM83gDpy3qVpzpxmEJ1RL1pyVwNT12X1U5oph1uEi?=
 =?us-ascii?Q?5ByXNLe7giccOAtSAuuowmCvzvBHByVjl+WXhDDokezzfFofKDgbH/tQORJ0?=
 =?us-ascii?Q?uWS85CW702mkbMVpbZQ/0uY0NPYhro6NbV4F4XnCTS6MUnkAvsgmxFlC0ADK?=
 =?us-ascii?Q?oh+B7Rz/q8eWyNW8QvTgFYz3xCn4cPY5cfKSTnon1y6PsmlZljRLR7WB0vF8?=
 =?us-ascii?Q?hCskSyq8AwiNADK3u0BUwMSvCFv3+Hzy+d7nmO/ar+grug5Gp+dPuD29o2SN?=
 =?us-ascii?Q?ytXj7f+INIrSpw4pn+YDt0ladwjfoKH5IFh3VOLGErw99LX/ZpBUiu22Tesb?=
 =?us-ascii?Q?lmjXLi4Plbs2v20UJKrsJQJVlkL0V/292yJ1XQRNwYvhFe4pcTBwODVvpbFa?=
 =?us-ascii?Q?DiECDPZhtqlWYm6wakBTQCP2egArL2oaAj6eIOfKxjIPh/gqcAtYyenPYZKo?=
 =?us-ascii?Q?nuhtudqlfuDLZ572S2AsS1C1KKBnAQvwXYMGkRAd1OF7vQVe00LXqwhj6w/u?=
 =?us-ascii?Q?3lSMzC20A15XdUwUYJWrsoClqrDlphrwDSireuGRkItOzgkDDaoVJYgwlEOe?=
 =?us-ascii?Q?k0HTpFa3EylVKHWJm08Mq8MPrU65ef48LFm4+siSw4IGaTJivAgVfN7uBh9U?=
 =?us-ascii?Q?YC3tJC1Q5TWis1Eeh3vGR12nxLBP/JiDbi4V7pgbD4wiS+iErjqhamM+xVqQ?=
 =?us-ascii?Q?2hb7FPo2F4xZjOJ6/fXIFmqsTgSzvWXV/7sZvHa/AuCWMum6U5pjXPiys6VL?=
 =?us-ascii?Q?14nvIJzqKL8lEi8IM4gxgvYpiyDAfyZaMZGCnf2IYi1Rac39CtcZyprMvl2q?=
 =?us-ascii?Q?c4Nbpxsd+ALMJ6JmNMnT9WX1jDhC6aQsyYz8QWDShCZOKf3rbxhM1mzkp9ZG?=
 =?us-ascii?Q?YDjeCsgFK4AwRpdSYEHZ+FTPkw5djOHdv4nztvND2acso33j0gC2rFEH8zGF?=
 =?us-ascii?Q?ghIim3PlePDLqyQQxf6w6rgO8HNf8LKUxd606qy9xcDq1a4r5YJEGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EqqNSqNR3fabiZhfVMsUt56V7XAMyQZ75lnQjxQZL195nx+yb1g+hWXsYNqX?=
 =?us-ascii?Q?c99SkcFmrDL1w67yKCDIsfU5FqxkoXWbKauEzhAzbwE/pt3ecnJxMMInVTxp?=
 =?us-ascii?Q?XjORRS0RxMKYfEnd4iw7rseEACIfYDpQyDTUk6yR77YkWAT7cCeYgOWE11A8?=
 =?us-ascii?Q?dRLeXWRpplbPXYgjMvcUcG2NY6Kv/rp9j5wOSLHIVqJb262tklwNbObE8xCy?=
 =?us-ascii?Q?dMWoNNPJpKbn9pvbz7oe4x2/C7eVp26i1dz4nAO2cmLaWltoQSXR8j3zBe3J?=
 =?us-ascii?Q?xCD/opu/Si31bQvboOnxuJb0g2svTDovLkOv26LS7JI/RDbr44oZw47iavfQ?=
 =?us-ascii?Q?av84p7Wh6TuG/hoaMUp0LgEwPQGHtTKN/hODf5XkM6IpST2xjjEKZVfNYlo+?=
 =?us-ascii?Q?4+mPyPs67pYFZpilk8PCRVk0o9+bqn03TYHlO2MfaRpp6rc6jsnRlVcz1sKZ?=
 =?us-ascii?Q?IV1seyPdpwg8GSEZok1pBolTomyWSXAfKZpvGs8MnG5o0q9E1RjVxDXCqH+P?=
 =?us-ascii?Q?2Jko6M/Ny5UIE7uVfRHeEE8OmRYl2VsJIZxSEGO/ouRjmlp5LBiqrcatI78j?=
 =?us-ascii?Q?TA3H6bDgl6ozze7wI5Vh8Nr1yqs9Sda6a5cktuQJob/Nj8Fc6nwY6KH+Su39?=
 =?us-ascii?Q?qFWQ4Q1fKbF6QSDE+mh+140ehbGMGjdT5EgxZ0OnYxTgE/WtvK1xC/tUJ80e?=
 =?us-ascii?Q?g39H5Glgvyz24Ud4pIOM08xgC+C6U/sMIvAMOHwReoe11yRTTVG8lhtmO4yW?=
 =?us-ascii?Q?IGHYouAlU5IYXgnK/ItH5xkTdmAcVZdiSYsQUfRZm12yInSlfxGlO1BLyyDi?=
 =?us-ascii?Q?60UD1yw59Wqwz98p9kCF5fdiMlrE6VJVIKXZ8Lg4lbxbDwLMvgS1uZ/EJKpv?=
 =?us-ascii?Q?H12PTV7jDYuclv+FIkOxdqEFfSoie9v2PPv5HPU6l4heCl6viphlumiJ1oxB?=
 =?us-ascii?Q?3g0ynJrUCRY6BxqjgRIjXKuwtc0tvWm/Jma44MzuBtZQt6CUnW2dwM2GCVto?=
 =?us-ascii?Q?1LL0Lf477CKWzyqKv83ZQAy99ICmaiGx7bd2Jl98losrMMMytxgncj7e0hQu?=
 =?us-ascii?Q?zDKRu6wlMhL1j9VbOSd9KFQc9loV2MY+3YXHWv0E/Bp4UROy26I/QaO27Yyf?=
 =?us-ascii?Q?MzEzdWhGTQHhD0f6uzlFQkHesuOokd3oExVQyGIDmzrosK1nQFoRFgaduDi9?=
 =?us-ascii?Q?u2BtxdtQomXLbox4JDCHzGT698yOh7HDhxZC0VLyzjUIYC5RzzKA5FFJ5TJH?=
 =?us-ascii?Q?+9AYbADgLKAkx23bGhyI80kuRGfPpQjS4xUCd5D7nIjaMWuwQi+yzMbHRzFv?=
 =?us-ascii?Q?+zNxVJ0rG79CuxVhnY2MZMWkCR5nZ+gUG+jOWTz1wloAxOEGu+LkXmhxU0F2?=
 =?us-ascii?Q?z8YwQubjdwcJmxOphHX4dnJXlscrizid3iIeVWkUk54wkhbu21olp0MDUJ2m?=
 =?us-ascii?Q?0NQHL6XTh11NahXObhpBpU+DnFwBY2KJzSa2bfudgCjVdC7Z4S2KYuLRCp4v?=
 =?us-ascii?Q?hdmEbMZMy0GNoK+Qhiy0yDh8moejQz78nNqSoO1WsU/NerdFi7oxy4s98y6S?=
 =?us-ascii?Q?1ZGOpZx47bZYePV/KCYf8DAuWzFg2iF5DM9Y7/7K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4815df2c-4aa5-4767-a04e-08de01e307fe
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 18:39:33.9284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BS7cXztn19tMr/PybXhDuX1EdYW4d7HtLAgRodaFfJUVIGMrFZZyhr+Li1DddFxUtdm7cEQrVk3Ia0BGowGyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
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
Previous patch was here:
https://lore.kernel.org/all/20250910035415.381753-1-joelagnelf@nvidia.com/

 rust/kernel/pci.rs | 199 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 186 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 78271bf88cea..f97a6a36cf5e 100644
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
@@ -28,6 +29,59 @@
 
 pub use self::id::{Class, ClassMask, Vendor};
 
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
+    const fn as_raw(self) -> u32 {
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
+    /// Build a set of IRQ types
+    ///
+    /// # Examples
+    ///
+    /// ```ignore
+    /// // Create a set with only MSI and MSI-X (no legacy interrupts)
+    /// let msi_only = IrqTypes::default()
+    ///     .with(IrqType::Msi)
+    ///     .with(IrqType::MsiX);
+    /// ```
+    pub const fn with(mut self, irq_type: IrqType) -> Self {
+        self.0 |= irq_type.as_raw();
+        self
+    }
+
+    /// Get the raw flags value
+    const fn as_raw(self) -> u32 {
+        self.0
+    }
+}
+
 /// An adapter for the registration of PCI drivers.
 pub struct Adapter<T: Driver>(T);
 
@@ -516,6 +570,76 @@ pub fn pci_class(&self) -> Class {
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
+    /// - `index` must be a valid IRQ vector index for `dev`.
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
+struct IrqVectorRegistration {
+    dev: ARef<Device>,
+}
+
+impl IrqVectorRegistration {
+    /// Allocate IRQ vectors for the given PCI device.
+    ///
+    /// Returns the registration object and a range of valid IRQ vectors.
+    fn new<'a>(
+        dev: &'a Device<Bound>,
+        min_vecs: u32,
+        max_vecs: u32,
+        irq_types: IrqTypes,
+    ) -> Result<(Self, RangeInclusive<IrqVector<'a>>)> {
+        // SAFETY: `dev.as_raw()` is guaranteed to be a valid pointer to a `struct pci_dev`
+        // by the type invariant of `Device`.
+        // `pci_alloc_irq_vectors` internally validates all parameters and returns error codes.
+        let ret = unsafe {
+            bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
+        };
+
+        to_result(ret)?;
+        let count = ret as u32;
+
+        // SAFETY: Vectors are 0-based, so valid indices are [0, count-1].
+        // pci_alloc_irq_vectors guarantees count >= min_vecs > 0, so count - 1 is valid.
+        let range = unsafe { IrqVector::new(dev, 0)..=IrqVector::new(dev, count - 1) };
+
+        Ok((Self { dev: dev.into() }, range))
+    }
+}
+
+impl Drop for IrqVectorRegistration {
+    fn drop(&mut self) {
+        // SAFETY: `self.dev` is a valid ARef to a `struct pci_dev` that has successfully
+        // allocated IRQ vectors.
+        unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
+    }
+}
+
 impl Device<device::Bound> {
     /// Mapps an entire PCI-BAR after performing a region-request on it. I/O operation bound checks
     /// can be performed on compile time for offsets (plus the requested type size) < SIZE.
@@ -536,10 +660,15 @@ pub fn iomap_region<'a>(
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
@@ -547,35 +676,79 @@ pub fn irq_vector(&self, index: u32) -> Result<IrqRequest<'_>> {
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
+    /// * `min_vecs` - Minimum number of vectors required
+    /// * `max_vecs` - Maximum number of vectors to allocate
+    /// * `irq_types` - Types of interrupts that can be used
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
+    /// // Allocate MSI or MSI-X only (no legacy interrupts)
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
+        let (irq_vecs, range) = IrqVectorRegistration::new(self, min_vecs, max_vecs, irq_types)?;
+
+        devres::register(self.as_ref(), irq_vecs, GFP_KERNEL)?;
+
+        Ok(range)
+    }
 }
 
 impl Device<device::Core> {
-- 
2.34.1

