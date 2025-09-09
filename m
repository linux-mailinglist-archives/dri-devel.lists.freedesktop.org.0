Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56AB50801
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0510E804;
	Tue,  9 Sep 2025 21:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mmd/1fFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4D210E7F5;
 Tue,  9 Sep 2025 21:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rh0OiA/Nsvru58TEIZjFiJw9ilGw2UXIpM7j1OVxsbvgRG/OjBipARLQOVQOVSLhL/Vbr2oVETifeVxu+Je/QHnHx+T0v7rv4iAzEcfjsGGeUPkAsN9Mx7F1pm11jG0rozByJcSdfDJPKCwYmlnKrIBgkvwHIusLQQo2sCmEBwgb51vqiKAkzK0g3pSfq5NzpeCCrr55k/j+QPuXoBFnM7ygSyQp3AUCGSRng/X8G9Aog0Mb3xS/aSPPc0Q2nKjTqMqhjlkYUs48+OWmVmfBTbtLe/VB4qCJoRpVodske5mrhnrLQnOqLgTDR48xhN9WcR9yHxfTGWiepCpMtXOp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB/0m+dC+kJDCLBn5gX+R4R0eoiOjIzPaz0uX11EHQw=;
 b=FHGauCtvBv2K8pIrqwBV97k4pstBFLzR+g/9SPj6gsOdb1xccoz7bNCxDcSIZP4SXyymKdZN9X90+NEBUbuD87u9j7Go4PtAUHzarQpM+PiALkdEMLJPArK5xVfTQOIauIKSuRXzWD1jcnhOqY8iSrs0M6cdKTsondFG2Ir3JFEUSMh8OQEtFdiYHtgiQP93T95GwIwRE3FK//gwRZ5ZuW56upHwL03dOtTXxmcSrcC6SOqTXwY29tlw8LtnkHL61JtqlIzXnNIy4ug3uBKypektqrE9A17exzs0Wt0UMAV7LWVvtCOvGbIpYjHSG/OJBRrr2lRez6MEngjgW8PBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vB/0m+dC+kJDCLBn5gX+R4R0eoiOjIzPaz0uX11EHQw=;
 b=Mmd/1fFqp0QQ0+q8k+l/7s4iodikNmeeoASsCI53lovyOb1p+XUcBbhjqmyic3OhXvcxRcKMz5UaWFJyJPMowIu7zJ9E9H1K9aH5nUXoj9gwI4zkKIGa8W+FacHZrhipX1gpBErtjTcavmUl4CkpivILf3pu0lJOv/IDLm20XANSQYAPdQuuLJAEdeW/jnsYJ4m/mUMdLc795oVfdKHFXHzVYqD4pPOTRhOfjOAHFnZp5XdaJw5z8gwkz76EPM5PUu80+oAmogCiXkTw0AmtAiAaTPwoZzHmiAi1HL35cQzDSGGV3NHxWum3xdVFu0i5pLolJUJRe7wxc/Km6N/vog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:57 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:56 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 4/5] rust: Move register and bitfield macros out of Nova
Date: Tue,  9 Sep 2025 17:20:38 -0400
Message-Id: <20250909212039.227221-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909212039.227221-1-joelagnelf@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::8) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d36632-35f7-49a8-2c24-08ddefe6c3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?atyHYDPmx5c0MsYYyreeRQ6HtWnJhIjGGWx7MZ4vXWnbrjD3UbRqh6PM9Xc+?=
 =?us-ascii?Q?PA6vGtxLjeJJ+rzn0HSnhutr+FIXj+Ey75+fytmdxLq/Ukj8WHwJye6W6UxS?=
 =?us-ascii?Q?Fa8f3mixOT2eput+Lrymiy2yzLLGJrz891Tv3Q1a+6T34N55MEc54uJMrnDJ?=
 =?us-ascii?Q?Rr6OhcXZSGM3WFICzdHH9gebRgMDQAHnDdA8fvpcUX+CAwaQ+m0mHb4tKRo9?=
 =?us-ascii?Q?8kILyMr2mysrVAO66k3CqajFXjvjyYHDESmGM2mZcsYpqTqD7NaK24zVIeXn?=
 =?us-ascii?Q?IqSb6H9ZXYqsV+ExWpdsFbQDdTYPVPfVc5UjXPuapPNToWICl82oCxETXbcj?=
 =?us-ascii?Q?oAp2rd9dl1JkfV9wV+zN85/IMAH16qUtjSQtH91oq/jhxYz/8l40BsJ5fwNE?=
 =?us-ascii?Q?WDAT5qNRaWvnOVAuNatyrBhKNzdR55CoZv2JYft1JFBZPrWjIGdTBo2Io3G7?=
 =?us-ascii?Q?FTsGryjplwG2Rb+Icnz+HFASKnTNqvHL1Q8JKriB8JaU377dvhzRC1jfgz/e?=
 =?us-ascii?Q?3EPzHTU44Knrv8SGXT3Ra5ZTPJmE8oyZrqXYZcS6NADcp2wdUMg1KbCQbsoM?=
 =?us-ascii?Q?srOXSMnW+gtw00io62yTUtUrDMuvqWnnhhVjsXphXZDXza6Ts3FdSPbdT3TF?=
 =?us-ascii?Q?EuiY6Dd6eKK4BLaAxunNd4ZBmQmREvmjzqKMLUhNj5g+ltUqK5bPItPx/9ta?=
 =?us-ascii?Q?Ohi3wixAcuDj3KETw0caMjxZ14MrEYqs70Mf+zsvF1JvHFNPwAhDlptPdJEE?=
 =?us-ascii?Q?H19nJfF+vNxbd8VP+N8fceuGVHGg2MOzQOd7MXB8OS8fkYrmYYK9KUqAxdv+?=
 =?us-ascii?Q?06qTrVJaiy4gzeq8bavbKijG7dv2e6BqiP/lZMaF8Jctlng8yi1UtCIgJijx?=
 =?us-ascii?Q?UDcT3o0Er8RVH1k656RBE3N0wggwJQutCvN3nwui95lejuKATMuEoNZisSID?=
 =?us-ascii?Q?mDxhvBPhY4gzucGI1VqRjnCxAOyiHXxYMlq7zxzHPlZBFipJs2Ys8XREl/1v?=
 =?us-ascii?Q?cTqsjCq1vgEmZy0JpAKKbkB2TSD92NN/1d7tpSIGcslgVrre930RDYaclbR8?=
 =?us-ascii?Q?Z5/i9CC+ym5o/9yUG7fV0cz3rrbi6lUPwBaxJLda+eL2DZsrAhBbfyfCHqyM?=
 =?us-ascii?Q?ZtNkHPbc34gl4PCWoLA6Il1WFd0vkpEMq4OOWejFml9jSqJzZE3zGowJg6as?=
 =?us-ascii?Q?W8J5YdKy2V/aknxhGoXjUoPOj47AJL5Agq8OVQF9HaTyDGx25pPXVGvKru9m?=
 =?us-ascii?Q?BBw/WLeL8hlbT0CXGi90KF2eknxovAxWBctPJF2JclA6D/evfboqMujGy+a5?=
 =?us-ascii?Q?73coDxp5cFF0oXA7BIRX2D4yBmzUx+Mn0/82l4f9iliRJI5s6m8x3fff7VEn?=
 =?us-ascii?Q?jrRXuxEELaHrE7eM77uCzmyAaLexkl4VYfMfGIz04UL+6ghYZmzupq/5jGDj?=
 =?us-ascii?Q?szb0LGuOxL0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m432szmTzqhSuk3qfovH/OrFx3Wma81EDBYBYuW8QnbeOw0OfqgK2og6FxLm?=
 =?us-ascii?Q?TgwycRHgkXTWSdne047A1b5dMWno69y4SfYlPJ6ZDh0YabRhzCF0oh+hzM9D?=
 =?us-ascii?Q?L3I7O0v3eyIXdv1kgHTMkCFBjRyKSiIy1oFvL1EpUS2PpBJM3Fq6nBAROHRz?=
 =?us-ascii?Q?Bxy253/SQacJtaU8dJXV46OOupKd8sDWxzu+uYYjLX8lA954YwD8SmBb7YqV?=
 =?us-ascii?Q?3myNgXhvDC3aZlFfEr5/uE+lM5BcVEOdP41148dOg5al6oRLVyBTJGefurK6?=
 =?us-ascii?Q?J1ODg8nSkHJ4nuqJsVHsO12NhYyHGZ/TE/qZHpbMqrP9ANYE2cC37mZPfI/t?=
 =?us-ascii?Q?uTmHe5J7KD9Wek8fA7UXSv+yc2BjALYbEVs4NHB/3JpxoLg23qPLvnmNMRvH?=
 =?us-ascii?Q?sDwZIk1/C0N4waySY+3oVrz18MUrfGIZ4aEmkFQWy8sQuDAfuIRO0L52fDpT?=
 =?us-ascii?Q?lU2g7S+QOip875K1jr2mfvIazn900w6EMeXgpz7IZFODGsVzHBVfAlcF4zhF?=
 =?us-ascii?Q?5lA65daMtlbpmEhGK/d18Ov6LGIQBBbgpec7n1AOX3IFf3FdQNhulqJvzwDz?=
 =?us-ascii?Q?o8DucNJg4lp/sVKTXskCWeK303xNFgNpY26yGNaDxehe0Vd5iU33ALz3QIAx?=
 =?us-ascii?Q?kK/j4v8IbwEP6u05yDzi51jMWSvd6oBDIKGMEEirWgrjma4EPaQ2UTurblgx?=
 =?us-ascii?Q?HTkHYzRA5QKEdmv1hyKmyV5sOzjAMmoDaOchvQAZ1zkiG8F9nViRZJmE9l0G?=
 =?us-ascii?Q?pasKrqiBZpJ327D4Uju++mK681qWy2ye1wKbaemb9FlyehqZS7+qArohFGmZ?=
 =?us-ascii?Q?u0NDLxzGhb2X/bVAO3RtxpTXorg+ojAsn+2aYcwizlcK1iMAms69N4WScApQ?=
 =?us-ascii?Q?YrUuALV6V86huEHDVICsjifTgtreOg0aE5x2n9CAEEowWQJ9NprssDQL8VGL?=
 =?us-ascii?Q?M9CAdrVgEup0kT+5VTHHzXgFEeWxNnihgOXyEOE2qrNKnv2ZzQXsuMYKYLDO?=
 =?us-ascii?Q?pgieAp0oHRV5SHAE2DauQ96m0ONq5MIP2WP771cW23Qbv3CDQWynCmghSv6w?=
 =?us-ascii?Q?9j8K4O8NbnKxch3Dls4OaLTcFA8DeAOEIaKLBQHnyOAprT6qDWyu23kASdJR?=
 =?us-ascii?Q?2WFfzbOjp0FRebpHlOWec0DxsQklraRx2JCa8vg4xqIuMa04Ctx5Diqp9FKQ?=
 =?us-ascii?Q?cFGiH3N9ACNFTzQMh5jkcAtlSqmNAA4s1I4ffW728ewH+EjEgNylTOoZyOyf?=
 =?us-ascii?Q?DuUV8t1MdrcStQutro56lZyd1AhYn6rTLUxrOR5l8UPYzkgehnAFOZBEjy8B?=
 =?us-ascii?Q?JMURTBqRKOROvXlmANmMG9W8xMe3rhntTtzXajj+j1A5pE76xD0+7T1wBMyh?=
 =?us-ascii?Q?Z+BCr9XN9fn4ARl4bGNYIcZBPW4LHqV0jjd8+LcyPEEfpmBc8WQzQOIlVU72?=
 =?us-ascii?Q?Yt/C5SJo2fKYsHPy1OqA7J24Nl914Q0b/So6Rzg7sZvLlE1pS/ziNssWFeAR?=
 =?us-ascii?Q?sH+6tdAB9c+TKaA4SDAspQJ2EyiRaUxogDmYSJHcUmB+dppMYE92I3uE4L5b?=
 =?us-ascii?Q?Gz0Vi9aOeA9GLYs1gt+G455Q0MCEGivp7HsXSQFi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d36632-35f7-49a8-2c24-08ddefe6c3f1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:56.7733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aulbIjhxZoI8Mu0rN/cf+qcMSgUpgjN82ROYbxfJXI4SD12rW1BSAIwldnUpPsN2B9Q4UJ6J5iUK5BWLIb+E5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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

[Added F: record to MAINTAINERS file entry as suggested by Yury.]

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS                                   |  1 +
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  3 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 --
 drivers/gpu/nova-core/regs.rs                 |  6 +--
 rust/kernel/bits.rs                           |  2 +
 .../kernel/bits}/bitfield.rs                  | 27 ++++++-----
 rust/kernel/io.rs                             |  1 +
 .../macros.rs => rust/kernel/io/register.rs   | 46 ++++++++++---------
 10 files changed, 50 insertions(+), 43 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel/bits}/bitfield.rs (91%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b97760467f09..ca9132fa4055 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4313,6 +4313,7 @@ F:	include/asm-generic/bitops.h
 F:	include/linux/bitops.h
 F:	lib/test_bitops.c
 F:	tools/*/bitops*
+F:	rust/kernel/bits*
 
 BLINKM RGB LED DRIVER
 M:	Jan-Simon Moeller <jansimon.moeller@gmx.de>
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 938f25b556a8..55f03f435138 100644
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
index c9ab375fd8a1..04920a619246 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::io::register::RegisterBase;
 use kernel::prelude::*;
 use kernel::time::Delta;
 
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
-    regs::{self, macros::RegisterBase},
+    regs,
     util::wait_on,
 };
 
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
index eaba6ad22f7a..4dbc7e5daae3 100644
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
index c214f8056d6e..07533eb6f64e 100644
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
 
@@ -352,6 +350,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 pub(crate) mod gm107 {
     // FUSE
+    use kernel::register;
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
         0:0     display_disabled as bool;
@@ -360,6 +359,7 @@ pub(crate) mod gm107 {
 
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
index 39354e60360c..0837fefc270f 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/rust/kernel/bits/bitfield.rs
@@ -78,10 +78,13 @@
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
@@ -116,7 +119,7 @@ fn from(val: $storage) -> Self {
             }
         }
 
-        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
+        ::kernel::bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
@@ -132,7 +135,7 @@ fn from(val: $storage) -> Self {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $vis $name $storage {
+        ::kernel::bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -141,8 +144,8 @@ fn from(val: $storage) -> Self {
             ;
             )*
         });
-        bitfield!(@debug $name { $($field;)* });
-        bitfield!(@default $name { $($field;)* });
+        ::kernel::bitfield!(@debug $name { $($field;)* });
+        ::kernel::bitfield!(@default $name { $($field;)* });
     };
 
     // Defines all the field getter/setter methods for `$name`.
@@ -157,7 +160,7 @@ fn from(val: $storage) -> Self {
         }
     ) => {
         $(
-            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
         )*
 
         #[allow(dead_code)]
@@ -169,7 +172,7 @@ impl $name {
             }
 
             $(
-            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
+            ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -206,7 +209,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(
+        ::kernel::bitfield!(
             @leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
@@ -217,7 +220,7 @@ impl $name {
     (
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
@@ -225,7 +228,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -239,7 +242,7 @@ impl $name {
         @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
+        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
@@ -248,7 +251,7 @@ impl $name {
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

