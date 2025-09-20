Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2039B8CEB8
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567BB10E2D3;
	Sat, 20 Sep 2025 18:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjqkFU58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010064.outbound.protection.outlook.com
 [40.93.198.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF25910E2D7;
 Sat, 20 Sep 2025 18:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scvrmxrM/TQ5j6W+a78F4ZwLXSserkE1krUanaX8OUoat+RVqLJcrEuDJZQOr4VyyX7zIa9Qs2fvE+MYjWtylRMuepbzqiuqJPrAKL1XDvGKdaWnwj4DKsAzc9PYFjysDUPFCQ6ZEF1bNrTGSrs/r9J8Y/rxf4TB1e+VNMVfMvfBV2pE1Gyn2FbOQjxLgk1UWbII/ssGQmpx8J4nssiYLpHZqZfbAjo6s1fNG+MEpayj+s3Bx9aJeOVSvN5KDQaaBwqfZ2BNu5692qKALAV4g/lWX9H/PO3QwI7CkbGTnJT2dIiLrbsVz+0Z5fb7bwpNZvXtA5E4qIcsUFtSMNVpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaKgTH5xVim/C10SX7dbG0pjC3BhM+8tjhPreAD/Fg4=;
 b=NSX+N7NGQrfEd/AShh2WkgbSWRxQodHNDc7CFLB4dHoOuk6gK7blSKRPC9ru7fTctLwAWnLx3znerfGbAZXsfcH5flCNSoip6Xaj2MIzy12BwoDHtlWeLxIAbKviWF08ozJG4tjmTEPcG9+EaSgXxBnderMWFU8pUvsMH1cs4J/caZUnH232ncHH4/EhrR5b0tGchO1Sm0Zvx7kDa/6sKZRoBaROCc7iCmyWx/DjggTWa0WhGijYa6KHnjhp/vbXNTwO4bDNptj/6d9T9OptQVrzhL4egOWPFGeUSDE2NGfZgwjOv16ixLWdZueTVJWGWL49Vxvh5Bg8bIN4EXoTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaKgTH5xVim/C10SX7dbG0pjC3BhM+8tjhPreAD/Fg4=;
 b=tjqkFU58iKky81TTfiCne+Hcz18DYETk2bzrYjJ1MaS5rl7Nw2ob3Ge9sqFj3R33R/C9ZqfUA+C7GBvdFdZReR9ivK8T/cFmhEpIo479Z941HKd6yYt8QRWk/UC5llHejSKs1K8qJS62C8SFVOPC2VzsA8mHobIBEgEzkH0HcymRHDMu1o0FLkYXAhcCxd3tVtQOawpa9JowtmjghpTc7BMFR/pnP6inAMmfnMAmOKZU1hiJ8QKe740+En+Q4WlAp2wYCK1/Q32H4cRPn9GrzLge2fztKzvfQ498I8f7PK6sI5ujPi/DD6I/dR03/cB5ipDP7SJtNdwnkMrTG49Pcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:23:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:23:01 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v4 4/6] rust: Move register and bitfield macros out of Nova
Date: Sat, 20 Sep 2025 14:22:30 -0400
Message-Id: <20250920182232.2095101-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920182232.2095101-1-joelagnelf@nvidia.com>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:408:ec::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 50531985-0a4b-4f7a-56d4-08ddf872bbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WjqayT2j/BZB/RGJ1t1MTqvIPlQFRX/N19Rrb8CaaBkneODA3W0u9wBD7CTE?=
 =?us-ascii?Q?K0hBOLyVNktkJYFLHO/EI0Gs+cJ/791a5ARce/4AR1S7Q01PXlr6NZJZsAQQ?=
 =?us-ascii?Q?JyW8UmbmiT/Xvzj+LNsztgjJWSJDyB/Eaux/QCe7CEteYoYt7Ke1yOP2iciM?=
 =?us-ascii?Q?PSH333iby20BjRt2ow98pmG5Svc3ZMUqXCtTBRCqRzm+229yChSP8quPanLO?=
 =?us-ascii?Q?UiqaEbq5TZyrF/AWnHAaNenR5yOBR32HtaTPR1sPAyRLiU3wAwxU4Q5A65mF?=
 =?us-ascii?Q?QkhxtrBBSteDwpKqAe1xXu7HXU2cswdb6F8gr/3grEYLxznkxpsdX54dIBH2?=
 =?us-ascii?Q?mnLHy7ec5ZZ2OiEmwUzB28pTR3Y9qsD5yc3ypPiEcyTTmXjeoUGpOMl8hjEW?=
 =?us-ascii?Q?Yiw80CHUmWob5avShB48e7qUx7101Kx3KONEl1cGuZ5tZzqUmcbVGFiishve?=
 =?us-ascii?Q?apjwA4PSmMXn82h2AOZvKbmQq7iyAGDS/kffsV8aoxvMmqMiITAG6+fkQOJR?=
 =?us-ascii?Q?fuhWSAPD1yrAAUt2m5oBXJ391eBct1aqPjzH1cVIkOmoG9KByIIIQBIYCZgj?=
 =?us-ascii?Q?qnJq7TDs8Zuu0/5YeIMOdrqnTXZmz6WiXcV8u8W2kifyxKnle5QjSNH8XmSi?=
 =?us-ascii?Q?aZrY467AYRUpzUFEaz5UZGZx/6namsaINgbDnOw2/RAxRk+yEfIb5yVHrqsn?=
 =?us-ascii?Q?ttZvmlEOGLGj6kOjmMKrIIOeWEJ3w1byOBlL54rlpiBm3h1aeoLD5/aFFX9f?=
 =?us-ascii?Q?JBHnS4jl8Slzp+jO5PZzSL0oIJDPB9U1wRxcc4AC3s2WptWP/Wsupnixipud?=
 =?us-ascii?Q?Cg5iOm6bSbJLcscHeSgpWdMYmzp3pL1M1svUewFcQLdRiCoAPQLAjQDGuUEQ?=
 =?us-ascii?Q?Q986lhzc5zstp/nzzzhftW9ylBJvM7LA7oGYOsL8Fbn8e1ERPcdcZ2rGEA/N?=
 =?us-ascii?Q?pCKY4MLhJ1UhQp6RDkSdd0Fa8aD2fWRz6caGulnCZhuKJQDDkP4iFwsUc3Jp?=
 =?us-ascii?Q?QIpGKsKzCU0g9HjtKJLvQHQdjy3OQgzNQmdJc2sVsbLbn6o5xfbs+bjyPeu2?=
 =?us-ascii?Q?RpypeRbnWBS+jEszuhIIHpBTe/plSTO5Oqj9ad3d/ra0ba9qORQdLqxquKNe?=
 =?us-ascii?Q?Dio2KGWem0MhkUTNPDwDl2J5eZzarGOfr6vta6c4zeOwixd/1X1FlwDYXCvv?=
 =?us-ascii?Q?NEPNmEtQTN9thopaQnt5Am7GVYiXtrU/yMccIeKLgEqzt7fXGiAXszzsTlkv?=
 =?us-ascii?Q?PxdL/gGJWco+NrgDJ7vxfPIMX4uD40i60y2d/3819IcYEFrwNI580uTxTiGJ?=
 =?us-ascii?Q?ZePxRUNvJrY8ThYUenPMMn8KjiYZsGUmGEMXdkqvO/iowXpa+ECFMtG49ik5?=
 =?us-ascii?Q?NXAXOa1QTy7BEBmxbuAtz84da5bt70PdKwRhcIHr/6I/0fdHcNDna8a8GRx4?=
 =?us-ascii?Q?ZXhzME0EYMk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JM1mr8DCiIm0MDW6vESaB0gkz8GzwT2nBypA0JGQBhlKHkdBF4iKPYDX6fSK?=
 =?us-ascii?Q?2GBj9xzNf3GgNTp/fMmN0WY99G81Ctpnc5U41sHjIUiK9d+1z0BD1F0Zk081?=
 =?us-ascii?Q?GVCKHOTezy5rn2RuvNvJdXzRTTBw3eQ2nWaCxuXOQHKRoTmq8imgrx27f4Ps?=
 =?us-ascii?Q?lr7ClsSBUvT+7llVoALBAx9W0Z77ZWmm+ewzkp6C+/stHcNqGxNWOB3RFeGz?=
 =?us-ascii?Q?R4fa9tUuX/4vEVRsSGob7cu0LWeW/DNG+K2otsrn2Vu2c92eANmHyRzcDUtS?=
 =?us-ascii?Q?MySMkx2n3sFUyAiEHfrJYKDR1Hq2hheuirKxPFKOc736hZOTEfUusVZI/alt?=
 =?us-ascii?Q?AsikSVVigj5uAsLpBmkIDFypovF4ojF5YuvwFGJhvJg6QjdEa07GAMyT5E54?=
 =?us-ascii?Q?6UapImx/AbUShdl9qhQukHSrm7+8yYSNZVJSm5pVzQtwWuYbtw8fxqjdtZKE?=
 =?us-ascii?Q?c/siNKVqvXBpCVi5Rb/52g+2+4LDBJ0yfjWJ+JwdriEZYnkPIX04jEH8u34k?=
 =?us-ascii?Q?S7yCT3F3o4M731x7zSFjVSZviaLv8520XcpR2Re+tyOHLuKzguD6+edlqzEx?=
 =?us-ascii?Q?Dmd3Fdf/FmpC32b/+CDgc0dVL4wo7grnOaFGi3vs6QJi48NRhJlbYJpApeG2?=
 =?us-ascii?Q?oKufQvmmbqsqP8zJxh+742j0MiqwLKIpmbDx/1m4JhWcah90S8DYSzqECGSF?=
 =?us-ascii?Q?iZTz4Xf/+KKJ4TnTogn2V3OogQIJxL87GkYFHNJjrE3AWw+3bwRxjmByMLuk?=
 =?us-ascii?Q?F36UsXTbN4g8gSR8E6HqxPEqTV17hQKOvtClwoiX+UJetduUTlM9UgbF1O+i?=
 =?us-ascii?Q?UeIVEzZz23Ywd+jlruaGZcGRNVSYlkiNbdA7F94ONOg96CF/ihhBtQDx6KPH?=
 =?us-ascii?Q?bnMoGmYEdHYYu/TWfakXxDzyyOfjxQgjsnJwD7JYfj39l5YxPtUiCZNH0bjX?=
 =?us-ascii?Q?uc7ZBsFlJuvp70l7i2+801/69Easf0NHhGZLx95D0Msq2mqIDSytLS+0rotQ?=
 =?us-ascii?Q?3pd9WFZmsvuRHnnvLJEgjpX/R8YK/Cqz0m/19ITXPXbyrtdL8zpnFfqKISPp?=
 =?us-ascii?Q?xK0Mwm80INjXH9Ey7e5KOc6ia54j1QZJAUI9JxQIKicikBbS40E7X1fehxWh?=
 =?us-ascii?Q?syCxINXcO/ZHJfpgG8efukX0IaY2XB4XSHi6rUPpGqtVjBaLbFrLqRMaiX59?=
 =?us-ascii?Q?108yj4EST5unoV7hqIdl8cmebgsDQ3LhxTI+OYva6mFAS/A3EbP5FHPdPI9f?=
 =?us-ascii?Q?Hx5QzqnsWirbfkBlyInhNoKGbRlJKltMB0fdSbd7Q2oYpLs4NC8M6UY4smKr?=
 =?us-ascii?Q?lt87ZW8dk0WKanDI0nox1g6FYFlCWf9Xd1CklkE5ol56/awr7hhvGloQOeai?=
 =?us-ascii?Q?cU4U+mfPgziOlsejRxPh2rjtTXW9dZn3Pw4yGYJog0W+cMRbekN7YW5SZrph?=
 =?us-ascii?Q?Bi9O42n8FpaI3whWYLZlrdctRmULdpCszBB4SE16IgEVoN3uzbT1RDXgN80M?=
 =?us-ascii?Q?MAnsPnezfy0R6ysKCvVM+JRcjnp+by9l9U95LvUSp9t1uj0lNwFIXvtNDsFv?=
 =?us-ascii?Q?jffke2OChNSB9XpmujW7cLuQOO2hbzSG+A2lYshZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50531985-0a4b-4f7a-56d4-08ddf872bbd0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:23:01.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIeux4NpPx/5e2c63fmJxF2GbfwN6SYCp/s6ADP9ZTbW5iLdn4NQe2OkOFaMNACJ/Q/XBDeayEdBl1vgmFeDUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

Out of broad need for these macros in Rust, move them out. Several folks
have shown interest (Nova, Tyr GPU drivers).

bitfield moved into bits modules - defines bitfields in Rust structs similar to C.
register moved into io module - defines hardware registers and accessors.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS                                   |  1 +
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 --
 drivers/gpu/nova-core/regs.rs                 |  6 +--
 rust/kernel/bits.rs                           |  2 +
 .../kernel/bits}/bitfield.rs                  | 27 ++++++-----
 rust/kernel/io.rs                             |  1 +
 .../macros.rs => rust/kernel/io/register.rs   | 46 ++++++++++---------
 10 files changed, 51 insertions(+), 43 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel/bits}/bitfield.rs (91%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 841b76234045..a94af8607b6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4379,6 +4379,7 @@ F:	include/asm-generic/bitops.h
 F:	include/linux/bitops.h
 F:	lib/test_bitops.c
 F:	tools/*/bitops*
+F:	rust/kernel/bits*
 
 BITOPS API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..a15fa98c8614 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -6,6 +6,7 @@
 use hal::FalconHal;
 use kernel::device;
 use kernel::dma::DmaAddress;
+use kernel::io::register::RegisterBase;
 use kernel::prelude::*;
 use kernel::sync::aref::ARef;
 use kernel::time::Delta;
@@ -14,7 +15,6 @@
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
 use crate::regs;
-use crate::regs::macros::RegisterBase;
 use crate::util;
 
 pub(crate) mod gsp;
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..cd4960e997c8 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::io::register::RegisterBase;
+
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::{self, macros::RegisterBase},
+    regs::self,
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 815786c8480d..81717868a8a8 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
-use crate::regs::macros::RegisterBase;
+use kernel::io::register::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 112277c7921e..fffcaee2249f 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,9 +2,6 @@
 
 //! Nova Core GPU Driver
 
-#[macro_use]
-mod bitfield;
-
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..1f08e6d4045a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -4,15 +4,13 @@
 // but are mapped to types.
 #![allow(non_camel_case_types)]
 
-#[macro_use]
-pub(crate) mod macros;
-
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
+use kernel::register;
 
 // PMC
 
@@ -331,6 +329,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 pub(crate) mod gm107 {
     // FUSE
+    use kernel::register;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
         0:0     display_disabled as bool;
@@ -339,6 +338,7 @@ pub(crate) mod gm107 {
 
 pub(crate) mod ga100 {
     // FUSE
+    use kernel::register;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
         0:0     display_disabled as bool;
diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
index 553d50265883..590a77d99ad7 100644
--- a/rust/kernel/bits.rs
+++ b/rust/kernel/bits.rs
@@ -201,3 +201,5 @@ pub const fn [<genmask_ $ty>](range: RangeInclusive<u32>) -> $ty {
     /// assert_eq!(genmask_u8(0..=7), u8::MAX);
     /// ```
 );
+
+pub mod bitfield;
diff --git a/drivers/gpu/nova-core/bitfield.rs b/rust/kernel/bits/bitfield.rs
similarity index 91%
rename from drivers/gpu/nova-core/bitfield.rs
rename to rust/kernel/bits/bitfield.rs
index 9c022fc2bd6a..6089f3cdbd1b 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/rust/kernel/bits/bitfield.rs
@@ -80,10 +80,13 @@
 //! - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
 //!   and returns the result. This is useful with fields for which not all values are valid.
 //!
+
+/// bitfield macro definition
+#[macro_export]
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
     ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
+        ::kernel::bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
@@ -118,7 +121,7 @@ fn from(val: $storage) -> Self {
             }
         }
 
-        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
+        ::kernel::bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
@@ -134,7 +137,7 @@ fn from(val: $storage) -> Self {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $vis $name $storage {
+        ::kernel::bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -143,8 +146,8 @@ fn from(val: $storage) -> Self {
             ;
             )*
         });
-        bitfield!(@debug $name { $($field;)* });
-        bitfield!(@default $name { $($field;)* });
+        ::kernel::bitfield!(@debug $name { $($field;)* });
+        ::kernel::bitfield!(@default $name { $($field;)* });
     };
 
     // Defines all the field getter/setter methods for `$name`.
@@ -159,7 +162,7 @@ fn from(val: $storage) -> Self {
         }
     ) => {
         $(
-            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
         )*
 
         #[allow(dead_code)]
@@ -171,7 +174,7 @@ impl $name {
             }
 
             $(
-            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
+            ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -208,7 +211,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(
+        ::kernel::bitfield!(
             @leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
@@ -219,7 +222,7 @@ impl $name {
     (
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
@@ -227,7 +230,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -241,7 +244,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -250,7 +253,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index ee182b0b5452..da1384fd9ab6 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -9,6 +9,7 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/io/register.rs
similarity index 93%
rename from drivers/gpu/nova-core/regs/macros.rs
rename to rust/kernel/io/register.rs
index 6a4f3271beb3..088a8590db92 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/rust/kernel/io/register.rs
@@ -17,7 +17,8 @@
 /// The `T` generic argument is used to distinguish which base to use, in case a type provides
 /// several bases. It is given to the `register!` macro to restrict the use of the register to
 /// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
+pub trait RegisterBase<T> {
+    /// The base address for the register.
     const BASE: usize;
 }
 
@@ -273,28 +274,29 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +307,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +328,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +350,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +359,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
@@ -414,12 +416,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 base: &B,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
 
                 Self(value)
@@ -435,13 +437,13 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 base: &B,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 const OFFSET: usize = $name::OFFSET;
 
                 io.write32(
                     self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                    <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
             }
 
@@ -455,7 +457,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base));
@@ -600,11 +602,11 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
                 let value = io.read32(offset);
 
@@ -622,11 +624,11 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 idx: usize
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 build_assert!(idx < Self::SIZE);
 
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
 
                 io.write32(self.0, offset);
@@ -643,7 +645,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base, idx));
@@ -662,7 +664,7 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> ::kernel::error::Result<Self> where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(Self::read(io, base, idx))
@@ -684,7 +686,7 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
                 idx: usize,
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
             {
                 if idx < Self::SIZE {
                     Ok(self.write(io, base, idx))
@@ -707,7 +709,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
                 f: F,
             ) -> ::kernel::error::Result where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
-                B: crate::regs::macros::RegisterBase<$base>,
+                B: ::kernel::io::register::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
-- 
2.34.1

