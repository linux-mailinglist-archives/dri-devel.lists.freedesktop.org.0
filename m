Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E8C5F205
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23010EAF6;
	Fri, 14 Nov 2025 19:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ADYPcnsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2410EAF6;
 Fri, 14 Nov 2025 19:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkdXT4cIn7SP2a4u4nMs60LBGIqLSgGnBuJBLKhhWp8G6mxNUImsJ2HUOxtZLJUypWu30zS3RanYZeAESZ68IYEEyp9rs2XcAMfKOwJ0W/fXaSCnQTdFQq/bo7ga13Sl7dZ9HhTnPZ3pmBW6hGn/kYacoo2EI6CihxS7eRj9850Qa6JH94GsczakjlzUDvlL79QOkHl4e7O78QUa+Zc/BIHH2lwWoiH9tk9g2R8S+ETfaOqQdKX3yzt6mg//ptXHpsuESOAy5eLC4csa1oesHydTFVquYgRXN3l5SQ6U0OQd+zNOY0Ojw0fXRBfTMh5XZuxt32AREfQFl721OFGmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRgShepxtCgrmlAYmuXbOz9LvJgerEOg49BlDJi+UCc=;
 b=OpYm4BzlUFkbUtbNHI0PcP9eX/NkO4v4vmlxdrQAWOx4+L/cLX+NQW1jagk/4dTOJfNrmvOSv9aRaNhC0mVFMrB2Yr3fzX8nMm64+uZxRi1VPyrY0w0w4TMaQMNOyc/DQroAS/TOybLJx7hMOxlJDWlWcbQpYHynLTRxAXmrWTWoKPWa7iDmXWNnKAn+0NgJJIxgRi3fHHid6IkW69Hh7sYZubJxzLzEEY3RJ2WZ/zs6jM82hBMpXlTW9Xn8fE+kuB+SYiFUL5vVdeuTVLXaKc0ngP4MswydhdSDYpwu6X0F1vr3bp1LT8PiYYr1pzuyxaOv25GxZ7mPhSm8wyufhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRgShepxtCgrmlAYmuXbOz9LvJgerEOg49BlDJi+UCc=;
 b=ADYPcnsWRiopooMkL+kR/JpIk9ritYNqZAFIChmCHOrbXYqaeyRN7AzQZQFrv6/lH/hxudDSZorCQRpvvRGvqf6VoXmC9MgtDgYgoTfqZgBBsftdHkN9ekvktdqn9aXTMxpZRH1e8V5QLQ+VXnE+MK3n+9Xhe47GPSRpe5Zn17NzVHkjWIhTDOh7HnQJc1i8NwbT1jFBg+1BS2HXyDfrXwlkrZu67GE1+sHuXrmwkG8D1if4v4mSa4rkfBxSVASbXPJUYglIWdUIp6oERAkXFdYyyza3ygRuS/g4yQ/nEr76l6fl7noBYQMsZ5C8F8aGvA82koFDV1OptJ/zVoyIlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:15 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v5 12/13] gpu: nova-core: gsp: Wait for gsp initialization to
 complete
Date: Fri, 14 Nov 2025 14:55:51 -0500
Message-Id: <20251114195552.739371-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 32505863-c78d-4c9a-71ab-08de23b7de9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aI3swy34lyKXS3vRckbpQUB1udRw6WknJRrew9IvU/n+aGN/Lw3Qg+WvTlJu?=
 =?us-ascii?Q?OsDYj27Tmfwtcm0x2FrXit0n8HlYmqd/dl5Zi4Pq1rDHsqlDk481tTYb1YfD?=
 =?us-ascii?Q?gyZpzRBs6N8LHXoq6f4uOOfIPAEwDZ7AV5v/iL6YmkpgrILkL7fkor0zgQt+?=
 =?us-ascii?Q?bUXfK+GFHYcQSxifZ7jxwAcZoWLrSjvyef4qsFf4ajn66rE4n0utPerDI1ja?=
 =?us-ascii?Q?CQ9PSO4H4VOrv5o6zZNaCEPW8qWkyDVLHkxOTH3PdE7vOVhocFwwikNz/HYY?=
 =?us-ascii?Q?rYzz1B4gVU0tWFYw4Q4mVDyenT3RCnWo9hxY9u7C2XlLYPsc27bKNXOjyq0r?=
 =?us-ascii?Q?aU/8XZcXWgA8ZQ6Asl0TuBL0wAIIRvRd2/dszWvd/CwONITziEUm3gGf26Rx?=
 =?us-ascii?Q?ePq4Qnd8JTBtbVOtXLU5ERxx2JbPrdt4oxQKuuy17Y9SvlFLlSnBWMJggARq?=
 =?us-ascii?Q?WLFv+nqvZIDJQfOy7ax7ot+kP522qYB1AGMlkyWyjkQ28rU2x1JrTwINl/2E?=
 =?us-ascii?Q?DjwXBivUbckZeZ6biZ1ho7lmMbP1dhMS+LusGyJ5lrsEd7BJiLPoPEgFau+m?=
 =?us-ascii?Q?WVtL0JUCpU41iDwlY989oyEgIxdI2vLggxwc+rALnaYyADQv6le69id3vO+4?=
 =?us-ascii?Q?kxCGf0sEAiAMCnvtjnyFVFtzJiIyKdHXZ7AEieBKCLZ0EG7ZFVKMeSG4cB5c?=
 =?us-ascii?Q?aoANwfXZl2PeRyKBlLpRIGsw1wFugwLRBWXAWi7srpZwqfCq0fFacXWP9oUe?=
 =?us-ascii?Q?ti351dy2VUhCLkKztuwWavkEbd/O6OTOyfZV1NVeadhU3Dg1UOCGEKUloTdM?=
 =?us-ascii?Q?X0kTb+nax47ZUtWTqaOY88ulj6fm6hXh6MdDLcf99PrxFLjDHcXi2E2uyHW4?=
 =?us-ascii?Q?rsY3yq8FnIXT/6cI5gBhjBLzkliaUW1lPXE5+H09lE1ltTMqut+teyqoXGXV?=
 =?us-ascii?Q?DOKQl6Tmw+IrZCUXDOUniN+tw8xpIdFb0epWvh4pym6BL6tzOpoS32XOoqzL?=
 =?us-ascii?Q?KrENuhT/9PgkQhuld4+jsNkCqROrNbLa20WG2Vyg6w0B0Gy/Ik/BnhJSk7r4?=
 =?us-ascii?Q?fHTe5u3InzgEISBq5jRCwMwxv9EgWa1LHnMU3tcUxiIE9aMm+TGs2iJecRs4?=
 =?us-ascii?Q?dMJ74Mg4vwjE4JSeXLgUR/6WUoHCCyy6JUrKzSnkDupU41367Vtqb+smnbLQ?=
 =?us-ascii?Q?bAAEkknYhLJpbHmktM6+A9CTNCGLAN6gehpW3WhqY9mV3wkO4C/5ehnTHS4z?=
 =?us-ascii?Q?cqKTXmYRWk7GXeojUNqRt7bi6xaD6F5t94090cobEZYfC4QbGbrTrSKSKAHg?=
 =?us-ascii?Q?ZN93FOZo+lzt4qNerlt6eE1YzFEa+4GXnN4IXz6CF5dnO6m7FYUErmKoaUPh?=
 =?us-ascii?Q?3N+k+noSBDO3g58kTlMQNmpwrKm21oy5/RUmQAl64IDKHS16YRjFegOCDmlz?=
 =?us-ascii?Q?R5RfrcURSpGB6Z9Old+7uKIlg7/vfiLj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CLGcLNnstoGxme0ieDY+bVHM8AoJ1sgb5Ec9Kp3uVLJHTW5qUQghoUsXlIkR?=
 =?us-ascii?Q?2gURz2Qbm2a3a0D7D8ZY5ZvZh/wJVqMBwQJc2JxWexjhswHMWt5mdeUhicI1?=
 =?us-ascii?Q?VgcGIIMVOA74nETeM5Zoa2lVsQe787hCGPTftMFwiWOJbCCCag3urF8epBuo?=
 =?us-ascii?Q?DLuiG4cz0YOx/tZgdqTaSlH2tPCKIYBNhw7dAaJPfRd+l1kSybhQTgnPqPgV?=
 =?us-ascii?Q?eKfEmrTl+HmZkHVMFHjgMs/xU8p9qPUV636OzQopOQzvomMb2jEM7a5UXfMF?=
 =?us-ascii?Q?q1uHWG0WnKTRnDNwn2fm/zGzwdMcRyTEGSOVlnAATbux7RRxwXTgVB7VGkpZ?=
 =?us-ascii?Q?rqNSBgkijoCgtzSbZ7pcoCyPUM7WgsuMokESMCoxUCV9uVnjCtpgqT20XBB1?=
 =?us-ascii?Q?zrGKZMQRAyPnz/bvaKqLfp4zB1bHOjuCT6LkRAyXmm17XCDaQ+OT0KsxoeDI?=
 =?us-ascii?Q?CahlzYvp1O9++keErmryaV6p3xSNsUv5xnV436hxXLqzL+cWDcuogmJLsH6k?=
 =?us-ascii?Q?woyxh7nU1TBucXrrBI7jMLZZlmBaWimjGjFOOQMjX4888WRj4RPci8ivz5cH?=
 =?us-ascii?Q?dUX1I9hguqUznxhW6+iNKbHctynXCDz8a+WHRwqv/HMQeLZb/6S0S5Vm+UEt?=
 =?us-ascii?Q?ilpZGZQwKFsh0csjLdl/Q/miCJg13ibLR8hJdWpIdXpr3r3+mLXM09EJvOy7?=
 =?us-ascii?Q?y4epHFhtiQygPimdwDdn/ni5sqIxcTtvt0nlmD1mXlbN7G4CiaVIOxiXBi9n?=
 =?us-ascii?Q?hEgU0lon6s9xedZMUAE9SY2aE09zATAwFV6ewf47TmWYr06Cwdb0tWfcnmXT?=
 =?us-ascii?Q?StIXNe/8cW4cP+wxgG//sbuSF03edWQuspN35Nt4m3gPVtoreB62qi6F5CbY?=
 =?us-ascii?Q?d4mRrFwy4kEB0xLGUG1cEq+14ZP4UCIpngPzMUA0+TsIewP7b6eX88a7WteM?=
 =?us-ascii?Q?+BeQSA9XIR24niytgXL/Nax7qVYxDZoak7xyyVBkalKoJCUfcrTqfZ7wrtrM?=
 =?us-ascii?Q?dr3w+r8jUjE7MMTXoSJx0Gd+xXFCBl5N+hpCgZSBy4iOuK+Vka47zzQYg4yD?=
 =?us-ascii?Q?TO/iLI+Yjh5CNRiERHRuZqPv1K0IMK1Iwmge0ro+nPFZGKawvm9vr+n/s8kP?=
 =?us-ascii?Q?sZmSWAmsDxGLF7xNVvevx8Q/fkXQgIXdXkMOw89zgGs4+9ohxbIBnzc4PTS9?=
 =?us-ascii?Q?SboE4wA6x/+iI4IM0wTW+SWn1I7K+r6GHJIES46fhGLRAJSltRxMhMYk+kBi?=
 =?us-ascii?Q?nBQJFNv/Kje2AgsZkTFJmvxqbq+K8Ebn8L7ITIMGzrmApjo9W57h2uPavCDH?=
 =?us-ascii?Q?X6bxE4mKz8Wl6p/aLf2Vt/I5s31havHpvuH1wcOyYsu/ILF/SrDbdDdqXYRV?=
 =?us-ascii?Q?KuTWwrBCVi/ir9SYJR7cohJnQ4vOUsfg5rXz7H1Xne7/EMOCa90/UmzfuHtc?=
 =?us-ascii?Q?VUU9xH2UxOzz/USVet2JDGNmjJdhrq8EEk/UKOjQffgQE8Yk80Txv0iLcl3n?=
 =?us-ascii?Q?wIEcX0DYbymDRjaq4mpPnKyQddnyyUIAUb5dBhlKZQxBVabrMJG8cZWmdam5?=
 =?us-ascii?Q?bTYRdkmGnRB0vQAv6urg0CQ0RYhODEtgBFbylzSV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32505863-c78d-4c9a-71ab-08de23b7de9e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:15.5286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx8kyTmRCra0QVqSefUr0u7ECqMKlCOhuhw6UqMAWfc6Th+DIg0LAgHdE1tuufwejIfcJXnJFnrWhz6QZmK3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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

From: Alistair Popple <apopple@nvidia.com>

This adds the GSP init done command to wait for GSP initialization
to complete. Once this command has been received the GSP is fully
operational and will respond properly to normal RPC commands.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  2 ++
 drivers/gpu/nova-core/gsp/commands.rs | 48 +++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e9be10374c51..c0afafbf35f6 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -236,6 +236,8 @@ pub(crate) fn boot(
         };
         GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
 
+        commands::gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d5be3bf10684..07abfb54f9d7 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -1,17 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::convert::Infallible;
+use core::{
+    array,
+    convert::Infallible, //
+};
 
 use kernel::{
     device,
     pci,
     prelude::*,
-    transmute::AsBytes, //
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 
 use crate::{
     gsp::{
-        cmdq::CommandToGsp,
+        cmdq::{
+            Cmdq,
+            CommandToGsp,
+            MessageFromGsp, //
+        },
         fw::{
             commands::*,
             MsgFunction, //
@@ -20,6 +31,37 @@
     sbuffer::SBufferIter,
 };
 
+/// Message type for GSP initialization done notification.
+struct GspInitDone {}
+
+// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
+// trivially has no uninitialized bytes.
+unsafe impl FromBytes for GspInitDone {}
+
+impl MessageFromGsp for GspInitDone {
+    const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
+    type InitError = Infallible;
+    type Message = GspInitDone;
+
+    fn read(
+        _msg: &Self::Message,
+        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        Ok(GspInitDone {})
+    }
+}
+
+/// Waits for GSP initialization to complete.
+pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
+    loop {
+        match cmdq.receive_msg::<GspInitDone>(timeout) {
+            Ok(_) => break Ok(()),
+            Err(ERANGE) => continue,
+            Err(e) => break Err(e),
+        }
+    }
+}
+
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
-- 
2.34.1

