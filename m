Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88FBAD3E0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9A910E5F1;
	Tue, 30 Sep 2025 14:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gA8zfgFs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9751410E5E9;
 Tue, 30 Sep 2025 14:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNZOAvQ65XVyG0lJSaJ44wA+ToUc5APjnCM4Mc1DRLAbERXXIRDTDXbnCVeHEOHrh/KcU9Pqhzu6Phxthp0cOIJd230irm/DxJcJ7g9FNBVv7oaviFK5D69IefjQYmXo5DswxKF7M1T+rePA/G5/h98IbqKffSh0TUdsXnFqauM5dvNfkt20Kvga64UJwgUC+BgnCUNGAyO0k1CuuWyzC8BUdA8INg4OmiTWyMFRI3pc0ltfIHX4esJB7UhI3XsEaI9tMgUFq8x7DO60Ub+1FVh0WPYdy0WEjSsS2uZuM+TQEBSDCwoS1+7XtXBLEibvvlpMe4J1nWBvo8stI3Hy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIhJRefdc58Z2UKTmcSN+zxOh6XII1wN/mnhJXjHfrI=;
 b=Bk45T5DNh3NA3y6SVELG2kvxXcJP5OQn7LS9oV4yPzZ/Va7VJtXUTAhs4e/GQXcAY4NgRYPVUOtIS0oTHIkdRfV77mcT+BBHtVJri/GcViSVld/j0ORUFmmZWF10+PWIRpzJ4in32GM07ZaKndhCkwY02asDC4Qu3+wkKJ2WtLWKrN/4GuXs2tBDjvpkvJ5LGenRrPa8/zFnqhJeoF9/b/NrUXM6nQ5IaIvuinipJZZwVH1LqlbRsdxwgtv+FbdsMYDBxs45msOUJPAfWU91FuiL2VtDsAy3kZUw66nIdl9YZpBUZflUkaPpIIsxSY+OFUdUxRq/tlk+2uzUYH1NCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIhJRefdc58Z2UKTmcSN+zxOh6XII1wN/mnhJXjHfrI=;
 b=gA8zfgFsLLhi5ak0a3br1pKj++SFcaPsMSEnIbhSk6D7IayAqjwdQGRKFeR9A413YK0MDiBoIHJX8xpwWKJm1er37xdio0aiqmvDwWPA6UO4j0RN8nFTTSo/0NWGyga26hVSKIjBmYcnn3SQrImxlQqk/kQ3gDhF5wuoIRGsmt94qTR5lDWz5adThz8GoqLn39Tdt2HSYq7PyneIeQT1QnDJ+bnXPziht0yBHJHfDjXOdIHk+LqH2bkcHwPxRlw45aDYAs6RG1YRmbvhsWDtQCoawrq+eobA6SYiEer+yzntmrIDO3NaYeLR/Xng82KG5SITqF2ka4qo0fyn18p0EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:53 +0000
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
Subject: [PATCH v5 4/9] rust: Move register and bitfield macros out of Nova
Date: Tue, 30 Sep 2025 10:45:32 -0400
Message-Id: <20250930144537.3559207-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0630.namprd03.prod.outlook.com
 (2603:10b6:408:106::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf49488-52cd-42a8-e433-08de00300e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VoIMsdmZWrVDoIT9cWgmpjQtMydzw/vm/c/r/FJFi+XXrIaep2QSY2QZ+ZxN?=
 =?us-ascii?Q?bQAQdz6ONDY6Z+6E2eXgxbjebsEGroGA4YtUakIxDnlR0+QtlgZlSG5Spexm?=
 =?us-ascii?Q?WSk1/V9VhAiEPL9Rg1ruC9ZaAP8F74y78R3tgbrcFUgaVfjkMA9NSHPiT4EH?=
 =?us-ascii?Q?854GTaUg7lKaEUvLy0Tqs7ko7us8wWdv/tJTHStWIlqDguGMAjG0kSeLgEKj?=
 =?us-ascii?Q?g/ZBoYonMXWXWWRqrxvuCzbrzKPwm2fCpxQdfQnm7gi11UJpbGszZpwlEYSw?=
 =?us-ascii?Q?ghXEq6u06vlL9Cz/2N/Q9cMqNmnuk6ATG49EtuEhZAXX/VpEYEcARYctp36/?=
 =?us-ascii?Q?MUINWvONFKNpy0tsGilRmx3Bvpl6E/q4qXSmZ8pODAU0gJQCQfFfHYyboAkK?=
 =?us-ascii?Q?i8YjTvmToQn6Px9ClK0wBvPZZoIFbPrmL/aoXbVjl6uatYnqC0okqjqhD7O5?=
 =?us-ascii?Q?WNIIHLst78gMtH9B3atKOk668HJ7OXIix+0gyWs6Pbsw9eH30XrC6F7Zjgs1?=
 =?us-ascii?Q?6sjoma0ireGqj43LH1/PEMcErspjzd+tj9/qBnAKZ2sd1fnSwm2hrRUfYSDg?=
 =?us-ascii?Q?dw+ZDCLTJmBWfFB05g+GuyIuzLOUjDUoJKPuhq+FruIqgiImAAbbjV2/M/CT?=
 =?us-ascii?Q?aTfbxJxuNZhEFgpJKN+dc/PVPU836cj+8H7d5yBoF+hm4Zn2tXA67j8A8Mqk?=
 =?us-ascii?Q?2AwWLR2IV8Tl3hjtQBv8/ysfubYLdoinDCiCRfidMid7lSW6X0WJ4zp3LsxF?=
 =?us-ascii?Q?2O5HeDQASFH9K6U/v66Gk7P9yFfaHReap93ruNVq2CzN5oHEIxL6Tl5ewHq6?=
 =?us-ascii?Q?2AhGF03NYghh48WE9afVte3Z7KfuR5HZerNdpY5mDRSQ6LOIWJyrYvOfWGFP?=
 =?us-ascii?Q?3SKbBPc6TdcDsI7pGox7vpXjp6JqibNlyygtZaqjMvJ3JP5qTx1m+jet1PqY?=
 =?us-ascii?Q?o+xzu+70PEAcdc5EF2usfT93R/peBvAFKS4qAIzE2iNj6Sbdaec6N0mj3cR4?=
 =?us-ascii?Q?HWAe4p+ZpcZrEW4uKYUSobRZ/pVopmeTCDAENPIiDMit8UeQPZKIIbaLy5SG?=
 =?us-ascii?Q?Tmg1rPT3fCrQeROZ2FDyEE5vOZdrb37DD+V/XepB1WtdBjCR2v9+1UfVYvsf?=
 =?us-ascii?Q?wFUH+P+su2MOtBSE2lCP/bhjKmX6bCTVbRVTWT2rX4uFD3U6p9hFP33ZaxA6?=
 =?us-ascii?Q?V99R3xHVWTmN/9sHXUV+82hkxImRMBW6DF1lXJWSHYb4p4bQhCMIbg3qFPBS?=
 =?us-ascii?Q?pQmLlftfV08NMDTFPpn5Q1JxnwVMHWkBbTwZ8eVgGJ4/J72IXOc0MX/zS9A9?=
 =?us-ascii?Q?VrN/9tg4buHkaS7YO2EejXiVi+adqeiv/PTIEcA8myDlsvxb3PrNYh7tsJJQ?=
 =?us-ascii?Q?BcVK7SbzCzaqus3XecqyoW2YLwDST2C4+HURunHfdMWVPxOZxj84v3dTpBzM?=
 =?us-ascii?Q?0Y2kppDFfVa/DGv451wMqgI+fJFLic4c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26Er3yRKL/diartCGigbMrTO+WUUQ/aFZSh/MExsocMCegxlTjffxVa0N7ov?=
 =?us-ascii?Q?CkybwSy3cokDlRmiIDQyH72LcU67vy1nfO/Q/3KACoGaIPNFYDeoDvmN3V7M?=
 =?us-ascii?Q?MIo6RDS5+F9sDRzUX9f2MfD8SOuqSF3PKMZ9010QYJgRhHWxIFrsWAtn9KCh?=
 =?us-ascii?Q?JiFhhauO74s2BZvauCsNuXP2jPionfgIGpAxKNZ8/u3hps6z0KU3OQd0m8FW?=
 =?us-ascii?Q?JrrbMnBFsvnI3IlMPX95at7s3EzPQS8cVdThZZcIz5QwKgeheBKou8nOAW1B?=
 =?us-ascii?Q?7ZnveRWXkjeyoB/dU2CMaT24XczRBn8Aa9rBtRttcN7S5Abv948svoYNasVD?=
 =?us-ascii?Q?B7gRogWif8SmAGii1O7MqsSji+evDcagelednXALzoB6QvhaWIEAchUNTWro?=
 =?us-ascii?Q?LgTHZCqmfyhzlvJQSCVpappsaW8uN+DgT+05ujgR3uuTCsHqXg4kkDj8STJl?=
 =?us-ascii?Q?+jBYme5KtYQIrzA0A5tFmuWZXoFaPNnpXaoPat4msPy9mQocVII6trV0ux9l?=
 =?us-ascii?Q?vyru8F5dhQVnZk5pT84RFO9yLrJ0M028zy22ODSzaqv2Q+281iL4X1N5ju+1?=
 =?us-ascii?Q?0TznrZNYZDpgTwIkT7KWyLRGzYgJgweJTtxIZiKnTIjO6Fi7bKyzgaUnDckR?=
 =?us-ascii?Q?eaPuI71Q64/wmHdw7uOHK/nl3vAfLwsTqZ0S9BLFBwUzQjhKx4Dg4L/fbSDj?=
 =?us-ascii?Q?u6Zu9EDxLik2z0rIamB7rmaRoWilmtDaYVbghFtyDiNJMhB+SMxAUC4sRsSr?=
 =?us-ascii?Q?GOTSknPmlxRd0TOfx+P/OhgT32r1JZGpGcofMqo6nS4Vzuk7TyLIRNOvFvFS?=
 =?us-ascii?Q?gJeT6h28JcbMUPcwjZUflSqL68g8UKOSyDbIY5aC0apgUyeG/3hdOHjBPRAh?=
 =?us-ascii?Q?687Py+2cluehto7OtaVWwYgCJdIC1zzT0Gf7ax0mv5XoOaYdeCcIGlDn2cbY?=
 =?us-ascii?Q?s5AkiVvf5qt/Efqk+86ZgiMVgiFz+7AZzrRrUB/g5cgYY8EK8nNUqlo/0Fka?=
 =?us-ascii?Q?3aXJo4RjdMn7X13Vv8djwO5L10l7aStGtVDv0gVFigq9TO33yovbo4DZ/oOu?=
 =?us-ascii?Q?pwoNVHYVg9RDJp5V6v4xFBdWKUGmRhkQbRTgx7/Q4CEW9CoIm7eizTNWEadY?=
 =?us-ascii?Q?rTH6ui0Fe5G0+/1wUbqvqYx636m84qne4y0UEIIYm9+ztCPtfzRE6B3bnWF1?=
 =?us-ascii?Q?rI/NQ3EAi/yxhPYwwiObpECe3Fb0Dn9HUaJJrPRLiuiXJYpYIH/zV1xyjPH8?=
 =?us-ascii?Q?rYwBTbn3d/tPnDYieJTFPYkHb/r+iZtqK9BfeekNblphXnz2bF5l9C+dHEpF?=
 =?us-ascii?Q?yzw7wWQLQ7Te1eLv2xNubVUVgvXOrk1ozZZQpSLDdzk6MOGj1xieOvlqnenk?=
 =?us-ascii?Q?zTBsLYfEi/Yt9FlHehoI+ecWnCUsLI1bjAaj1C51Nx005uZh5cyqB+b7YdaH?=
 =?us-ascii?Q?vpBRbQdfv/ZC7zrZSQGqIk4FukyE4ltf989HfmeRgq2K6tXFwTdXky4MsKNB?=
 =?us-ascii?Q?e3fya193HIc9GqOnahBGKD/H8MGztZRKuddpJmP9KJZ/dVDXL9t1iDcJ8D56?=
 =?us-ascii?Q?OZNcVhd9YFZ2WO+Ns5YnrP0DUKVCMHGfJ1+mNzFG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf49488-52cd-42a8-e433-08de00300e2b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:53.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwUVTZ6dmKxIPZM5x/0f8iSegCfCxnyUp5NGukXjJhDR5V+eA7DZ8lP77OFwQqEcAm4WqLpBXPF89xvErO5OQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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
 MAINTAINERS                                   |  7 +++
 drivers/gpu/nova-core/falcon.rs               |  2 +-
 drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
 drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
 drivers/gpu/nova-core/nova_core.rs            |  3 -
 drivers/gpu/nova-core/regs.rs                 |  6 +-
 .../gpu/nova-core => rust/kernel}/bitfield.rs | 27 ++++-----
 rust/kernel/io.rs                             |  1 +
 .../macros.rs => rust/kernel/io/register.rs   | 58 ++++++++++---------
 rust/kernel/lib.rs                            |  1 +
 10 files changed, 61 insertions(+), 50 deletions(-)
 rename {drivers/gpu/nova-core => rust/kernel}/bitfield.rs (91%)
 rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 841b76234045..20d06cf4b512 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4380,6 +4380,13 @@ F:	include/linux/bitops.h
 F:	lib/test_bitops.c
 F:	tools/*/bitops*
 
+BITFIELD API [RUST]
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+M:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/bitfield.rs
+
 BITOPS API BINDINGS [RUST]
 M:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
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
index 115376c2710e..66c6219abb25 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -64,6 +64,7 @@
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
 pub mod bitmap;
+pub mod bitfield;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
-- 
2.34.1

