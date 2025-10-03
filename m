Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802DBB75F1
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D32B10E93D;
	Fri,  3 Oct 2025 15:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dmqhBFSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2B10E90A;
 Fri,  3 Oct 2025 15:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j68Es+gorUStgmlcSPyYwhep6mwccuc1EyemYvd5gStBcSzXDwSvUD/IfDnMkiVwXMXs2RVSpiWiZFeAVjcc6aWhdJ03cS62sQWPC00qhpg1mzk/vTdVvv62/EOvJ3GF0B6t+V3O477ApF09en6FZxp44CdjkkDKJHCEBNCaRWqXdM7A/+KP83w3A0qo0qwAFWTEWIjv0WlmNF+2SiDtKbUj5z5aKiGIbKl4KTRZ5Nt/GBh1ILnKA11igdNdjDUNln4F0KOpyBJaAavol7+ksUtFiIFuu30DgSjiON6+0vQOxux1HP2H1X1I+0J/l6GzNwBu0kM/kOXg1zPgGziZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYkGffdK/7EZ4eJV/r/RfWgSSUu2+ttVya1KH/5bFNc=;
 b=I/qwEFqVetOuSfDTwqYU3T7ovlllELjd0yhwCI0qQ+DTfpc16nwBAmqbwWA2FW4SlNeULNdlep6G39DElYFnVty0H2RpNP5a5XdZlHt8489fJO/dD32wIibl6QN16dB4xlRAzimpeofx91xzUsSTlpezbEkIr2Lcl7Xfx2UMcxhyg4ErkEUegjtFTgQnzcfdrRi9WrH71EN/rEHEO7FtWjTKadXcn/BrJ84etDsjBnFrxAc3sNvk8YpPMP6J7x4xZe2dfqLWI/cpRfB/+YejPpdUSJwttNvVXx4nx5tx/RxSGAwGZVHPg0BcgIgrnCayzTZuuq/yPSWhBocegEl4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYkGffdK/7EZ4eJV/r/RfWgSSUu2+ttVya1KH/5bFNc=;
 b=dmqhBFSbNKo0Ah+ShIhCOygmu7SiNVjy+pJgg8VfZm5mVss+EhzbmnMUCkIuo+olRgJ4YAd/iWg+l2RcQREdhNg0vLZbJrSQAsmHnemCyOj5KdKOBCJ9qzECNY8SSmeF9H+PF6O5Uy+9UBJQf5/j0P5MeHH3W0lKlsfChM+kRgxhgBkAe3mZf4R70d+MBq0cH2hAk7jMpF4HXUmXjI8hi9Mlgvolo1OACHyrDB819MAM1Z5RcUpXTwNpKjqNkgMoRmJn1xt7j2EZSQOAnn9i9qB1ukeVkLr/Jua4jRGlSMlDseF7P+w8bHtm2jOzGLV+VpB+BDJhCdVEhWgx/I31pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:48:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:48:01 +0000
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Date: Fri,  3 Oct 2025 11:47:47 -0400
Message-Id: <20251003154748.1687160-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0652.namprd03.prod.outlook.com
 (2603:10b6:408:13b::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4abf4c-ca11-4fe5-959b-08de02943b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cpa2eAIIOBrJuvUe1vOCMmr/dcOFjYttdH/MS4bJgJ4Z33qF7ccxTyRpGtwn?=
 =?us-ascii?Q?X6huhSZoHwNrfYdl47iwwSpyAFIzRJzm7qY1qJP1j+konI7xrIGlMb2QuHhP?=
 =?us-ascii?Q?sZIg1skt3irFcynQxMpLpX1lFBg5G4DJGqG6tSwu0apF07VTqM5j+Ic1kMjQ?=
 =?us-ascii?Q?7DPWyOACu0/QeO4Pq4z/XbRMx2xv8JIILkIH+nJe/KnMiuglXSu5N1qhT4bu?=
 =?us-ascii?Q?nE9fCA+MQBiq1PmR6TXfGjoKS10c7/BM/Pyd91mjqLa1UA2jzh5Yv3TvbnRP?=
 =?us-ascii?Q?FQkXdZOE75LFLYPrZd5OQXaUQ0R7EFgYdZ1vIH4XIjDxhXj2bIkFiNXDfDrD?=
 =?us-ascii?Q?A7OQ2p/qeEhNp//vEcxUcNjIQwMdE7IHraXjt7LRSfd7RIRvC5BytQN5Nr3p?=
 =?us-ascii?Q?WmnJ4ZLxM2Ln/drpbdYyRsgM95SSPEOBMMf0J8fz3dF6E+P1K3UBA6ldc6AX?=
 =?us-ascii?Q?xGn5PrhaEkIp+15HHd059s4zW1QADZ4p7zMMjXu4iGcA3mwDGazbU7pguFjU?=
 =?us-ascii?Q?78Kv48PKwXEODnPmGaBeIrKBUjduumUHDENyehscZCUfpCkkXHRbp5zYwTGa?=
 =?us-ascii?Q?vbwXr7DSZmuPda0/hM9waWByVzCGUDVlQR16t0Z3zbjmANc76mNH9lCuLFaw?=
 =?us-ascii?Q?X9gbrqbXE+0O8alMXJvWYJKGe1n231meghVs1qJhDT9HrSbHz+Kst+8/qABl?=
 =?us-ascii?Q?aRshujkBCF6C9Q3qVlnGfP7CMZZSXRnz0Yal29OAJZBwsC1w3dkbIwD7vNc1?=
 =?us-ascii?Q?6XQZ1LzBauDifm2ODmfDyAbICBkrBhL73OLGM6M+cmluM0DWezvWLIZ+mL4a?=
 =?us-ascii?Q?NgMkmt0f6pStI6D3OhWuq8YnTbeu9EJIHHOxi8Vn4soPjEKIlyjfrFhP/+he?=
 =?us-ascii?Q?ZuakQ4UUbrcRwIIjwyweAJk/i1eyco/OlOM5tg1uQrWc/mCY0IO3mymYcdXi?=
 =?us-ascii?Q?DFjorF8xzA8Tbl9tMr6k49orynfcE9hISGjKQ/TykyltIehXJLUP+k/LsANV?=
 =?us-ascii?Q?C4/HMHMEOzg+6u9KRXNND12ngEsnpydT62OSUY+KGpKE1IHfE/ZcCxcoyQBF?=
 =?us-ascii?Q?aOaMzLiZAH7T1sDEhVZTAVkQa8tTOZXepnRfP/8JzNXDT1paSIc4UCOi5p6X?=
 =?us-ascii?Q?zdENsBjgb/nOyGg0GAGE0oH6lFIKglskBmiidYFzxc77XtkWDTXP4IH73Ujj?=
 =?us-ascii?Q?BTvtw/86qEdhLAQNknYwEIDaIaM0BNzwGmtyKbsuquqC79e49y//1fOGDDaa?=
 =?us-ascii?Q?owMB85k7b4xPFmUid1IkUwD+kYBAlFdOb8tfN0h0eHchmX3bz6C1AX6zuBTi?=
 =?us-ascii?Q?G0pvOJ8TJWB9ChcV71WWktFKxkILg+xWmtT9l7Y5YO5SIa/kBleN1JNBIuy1?=
 =?us-ascii?Q?0FDAp+64gce8j2TSCcRIrq+Cw3mz0mh/7WrsWLhcAJo+vxzUyFi2qGzs5pJi?=
 =?us-ascii?Q?SZ3qIqjFjIshcOpbpCml5qmGYsq8SNA4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?464XkfJWsTLuM1aqGX1YHMPjB9S6cJWz/xVYc6ps+nIxmwekQQWjwOpfr6qU?=
 =?us-ascii?Q?zxqD9GFI/I6EapijRq1oXOu7Qf7TKjfJUOHWoLzXfi7E3YvraOCK6oRFsZO+?=
 =?us-ascii?Q?44NUMWpKxgEyYObHv6dARWbvnVW04uf+WxU9z7SyLCLzGXm93ycWegQEHB7H?=
 =?us-ascii?Q?iTXK4/lQT07GKxn6E1IhU4nxKWl+7GZQDR3PmVvu8frN8gBe+vRgnG4v1sI3?=
 =?us-ascii?Q?XRTysQaTIbrVk+0x6S5PHRQGPldh1sbjdd1Sk1fCmfXhwZKHcWa5GSzST9Pz?=
 =?us-ascii?Q?pT5dXdEU2L6UYwhN565OAqVLMjDp3jp6AS0+4S+LW5OM92N4tJRj543cTOWR?=
 =?us-ascii?Q?uhXKBloLPVClcXD6K0YzgJB7DpEOqs34poj9Evp7myQBJ46qtpsdI9z4JmIN?=
 =?us-ascii?Q?i2ZJKDBHQryQSp6DGptdqBha8EFcLKazf5RariVKb0u/HPqQUfE34sgZSQXQ?=
 =?us-ascii?Q?2FAZsw51wGQv5mBeZmCudyLeMbeKCBLwWDier3RWSikWFDntxUfMQpPuTYQT?=
 =?us-ascii?Q?deG2ZnOkRJOPu/17z1q0+bPQV2fjT/aS1M/2jMnZFlaMK3iMHmgwvL93P1nk?=
 =?us-ascii?Q?oOsYuBldxLCcyxDydU0tg33muLTSrv5iUZOMq7VQNXCq7xMUwoF+5crghFnh?=
 =?us-ascii?Q?O5lKOjnSmiIVzk0do7JyRQuE376NZTEuaBmu+bxmEoHf8EvoVAqnUPCjH9TL?=
 =?us-ascii?Q?QcLs0Q3wT76aybpfbglOElPMKf6U6FL0eCl1/kYK+jM+wsxlcyEezHIFV2X2?=
 =?us-ascii?Q?vXkQnReUg+afOI7J+Z9P8btHUSJ/q6IxtMhEipR6R9GLQQqyB/8Xyl1ByeJG?=
 =?us-ascii?Q?RE98L+ulKnOMXtTRkMU9IA81UEeFOABpgQJTfHsmxcqoPcK0hy8BslpFr0nD?=
 =?us-ascii?Q?P5J0/adMEZDv7VMl/9Ybp0RPyszJBqXTDL2JwdI9Q1UnH7Mey69mSl03UeEI?=
 =?us-ascii?Q?+651dGMonyBeGlszxQFbY6p7LcHu8NNBiUvJq7wQE62HMtEZ5Wy8grHmB1Ss?=
 =?us-ascii?Q?EfOox3Lj4WTXTOerMe3xEg2v5VSvLU3AcmN3xGnvBlQUeJcuoILgZBUbVi4X?=
 =?us-ascii?Q?xTd4sfVHebF3nXOixkI/UgiulJG1TMC6vOykxr7P0Nh1GIAsWk3pvjD6niTN?=
 =?us-ascii?Q?8WLI4HuSOm3Oyrl78FqvTRcVbB93r77UzBMk/GOpoYunuJU0to1fiJmwr1Xm?=
 =?us-ascii?Q?pW1jdIwwUvjHnyx+vEYC/YerwdAElrON0hh72XFGkPVeNwkt5btuq2EvbePI?=
 =?us-ascii?Q?sdIWTI1TDm5HcLg382yuzHddbqNLhLTqux1xokLzr99LJye7DV7+BUTDToW8?=
 =?us-ascii?Q?s3KgGedi/nhW5xQCw0VsFQYJpY6J4gHCufQvwEay3gi3+r6PNRKrthUhg0Pe?=
 =?us-ascii?Q?Kj09dmXx4od8tsY24pGReCjOhwcmc3EiDCLQWtNaFoNdOfph0FuteWh2xF5E?=
 =?us-ascii?Q?xO7qcJUjsDiDkwLAmfaw9RWTqZwzSpjnQe7iNuXNq1ruDHRefxoUn0LZrKSk?=
 =?us-ascii?Q?H/TKYRFx8heQRoD1XOnPg73uLCnweY2AqRnjfgRunTovJGxbe1F7bcT9A/nM?=
 =?us-ascii?Q?gf0BH1FsbH/7QyP76IEz4dwsM9gYQcUdj8h2s0o3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4abf4c-ca11-4fe5-959b-08de02943b79
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:48:01.1758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnEbOVLydpvy5tAMKW48cKMixicDlpN8GGTKpuJgUqs1srXbspvyrYkUdJMSViTWeZD8lO4JS2+ajmuP7/ROVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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

Out of broad need for the register and bitfield macros in Rust, move
them out of nova into the kernel crate. Several usecases need them (Nova
is already using these and Tyr developers said they need them).

bitfield moved into kernel crate - defines bitfields in Rust.
register moved into io module - defines hardware registers and accessors.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 -
 drivers/gpu/nova-core/regs.rs                 |  6 +-
 .../gpu/nova-core => rust/kernel}/bitfield.rs | 27 ++++-----
 rust/kernel/io.rs                             |  1 +
 .../macros.rs => rust/kernel/io/register.rs   | 58 ++++++++++---------
 rust/kernel/lib.rs                            |  1 +
 9 files changed, 54 insertions(+), 50 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel}/bitfield.rs (91%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)

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
diff --git a/drivers/gpu/nova-core/bitfield.rs b/rust/kernel/bitfield.rs
similarity index 91%
rename from drivers/gpu/nova-core/bitfield.rs
rename to rust/kernel/bitfield.rs
index cbedbb0078f6..09cd5741598c 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -9,7 +9,7 @@
 /// # Syntax
 ///
 /// ```rust
-/// use nova_core::bitfield;
+/// use kernel::bitfield;
 ///
 /// #[derive(Debug, Clone, Copy, Default)]
 /// enum Mode {
@@ -82,10 +82,11 @@
 ///   the result.
 /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
 ///   and returns the result. This is useful with fields for which not all values are valid.
+#[macro_export]
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
     ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
+        ::kernel::bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
@@ -114,7 +115,7 @@ fn from(val: $name) -> $storage {
             }
         }
 
-        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
+        ::kernel::bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
@@ -130,7 +131,7 @@ fn from(val: $name) -> $storage {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $vis $name $storage {
+        ::kernel::bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -139,8 +140,8 @@ fn from(val: $name) -> $storage {
             ;
             )*
         });
-        bitfield!(@debug $name { $($field;)* });
-        bitfield!(@default $name { $($field;)* });
+        ::kernel::bitfield!(@debug $name { $($field;)* });
+        ::kernel::bitfield!(@default $name { $($field;)* });
     };
 
     // Defines all the field getter/setter methods for `$name`.
@@ -155,13 +156,13 @@ fn from(val: $name) -> $storage {
         }
     ) => {
         $(
-            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
         )*
 
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
+            ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -198,7 +199,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(
+        ::kernel::bitfield!(
             @leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
@@ -209,7 +210,7 @@ impl $name {
     (
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
@@ -217,7 +218,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -231,7 +232,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -240,7 +241,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 03b467722b86..a79b603604b1 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -8,6 +8,7 @@
 use crate::{bindings, build_assert, ffi::c_void};
 
 pub mod mem;
+pub mod register;
 pub mod resource;
 
 pub use resource::Resource;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/io/register.rs
similarity index 93%
rename from drivers/gpu/nova-core/regs/macros.rs
rename to rust/kernel/io/register.rs
index c0a5194e8d97..c24d956f122f 100644
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
 
@@ -26,7 +27,7 @@ pub(crate) trait RegisterBase<T> {
 ///
 /// Example:
 ///
-/// ```no_run
+/// ```ignore
 /// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
 ///    3:0     minor_revision as u8, "Minor revision of the chip";
 ///    7:4     major_revision as u8, "Major revision of the chip";
@@ -39,7 +40,7 @@ pub(crate) trait RegisterBase<T> {
 /// significant bits of the register. Each field can be accessed and modified using accessor
 /// methods:
 ///
-/// ```no_run
+/// ```ignore
 /// // Read from the register's defined offset (0x100).
 /// let boot0 = BOOT_0::read(&bar);
 /// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
@@ -61,7 +62,7 @@ pub(crate) trait RegisterBase<T> {
 /// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
 /// for cases where a register's interpretation depends on the context:
 ///
-/// ```no_run
+/// ```ignore
 /// register!(SCRATCH @ 0x00000200, "Scratch register" {
 ///    31:0     value as u32, "Raw value";
 /// });
@@ -111,7 +112,7 @@ pub(crate) trait RegisterBase<T> {
 /// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
 /// into code:
 ///
-/// ```no_run
+/// ```ignore
 /// // Type used to identify the base.
 /// pub(crate) struct CpuCtlBase;
 ///
@@ -162,7 +163,7 @@ pub(crate) trait RegisterBase<T> {
 /// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
 /// an `idx` parameter to their `read`, `write` and `alter` methods:
 ///
-/// ```no_run
+/// ```ignore
 /// # fn no_run() -> Result<(), Error> {
 /// # fn get_scratch_idx() -> usize {
 /// #   0x15
@@ -211,7 +212,7 @@ pub(crate) trait RegisterBase<T> {
 /// Combining the two features described in the sections above, arrays of registers accessible from
 /// a base can also be defined:
 ///
-/// ```no_run
+/// ```ignore
 /// # fn no_run() -> Result<(), Error> {
 /// # fn get_scratch_idx() -> usize {
 /// #   0x15
@@ -273,28 +274,29 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +307,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +328,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +350,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +359,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
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
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fcffc3988a90..8f8260090c02 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -63,6 +63,7 @@
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
+pub mod bitfield;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
-- 
2.34.1

