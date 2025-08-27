Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF9B37D9C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897C410E77B;
	Wed, 27 Aug 2025 08:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HUyul/yY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFAD10E779;
 Wed, 27 Aug 2025 08:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQZiGKvmnUL+D9uI9Hlet0RWCvlNvYWHfad10zH9FG/Ke5RwIJuvmGm497HeJ4ckO3YalSLPyegqD0JiqX7SLxIgUdDhaOwx0Ouugyxmds1hm/QDZSRiYost5rkyMhBVvifNgIDQ4EUgiOnfRFLMZH4GGYOgX8dHvXpVB9geWtVvB3/X62BNzwtO95aBGnVxeLW7iXadk3nvy12rVKtc1qyp1EDQtY2yWcXBwHW3L2nCxh3ysLZXLx718uMy7A7Z/8cjbp0Smxg+9+SwRaNHa315Vqhl/tqDl9xUWtMCaapeSp/oQBBFZZe8gTCJ2lpGIcXtxhDbLlPAxtbXsxoUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjIXWcMU53bqJBDnRX1JmVgAj8OXu9moj1sybM5lp4A=;
 b=JOsEhHKs7C6drd5zNcS/bpHYCYze4TWyjIkon2qVQSmJhb+Yqup7qVIUyuqGiLjxwBc+c5/Y+dtUiXiu6NJ6poK2Q8g1iVkLtab5Eh6zxBsu1g9ZifBvkM58mw5U/4iM/uyntS115ZpxnAxqH3YYlPC7IGGINK8S6kwnKXhv+b67wmrZZAyqVV7MQ6Ex4UiWm4X31x99vnTvrU6j6+nGBXMUBEa6AneRYReOpB5650hXpYodGzK9XgaAS7Ji+RF3+NPT9Fc/vuRTGfCSXnfGV5PEVe/oLsf/axgARCANXwnfD9qluWhSgyo3Ac1Ln+0ZYnMniWkESc3oxDRhZ1aTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjIXWcMU53bqJBDnRX1JmVgAj8OXu9moj1sybM5lp4A=;
 b=HUyul/yY0wjJSaEakZHy+sv28PgzKT2ZaVcUDVz2A9p8eaufSBpZ6dYFYp3xC8lpNtITfKRaCr8yg8dRFFpUs3UwHCd5iPoMHQNONt1CDtJxE8fKbaK4Qh/5M2OjcJly8CtEgKHyGhJiyhnbxgYU1IUMTvjK/PJJllpkhWiq72gsWlXcvG40U8PVSHzcxUQVprlhHl/sNtPN1CR8PyBf8MvycO1mUKUlkhC4UxNrtQJ0c9v8QdNFkJttXCBJSmpFBVrvX+bMFJyiIvN0SsfhTwmp7vbx5YASf9L0pAFTIRiIflkp4cGXE7SCC+kHmy6SKoJ0tXXhV8TuQXRXmYP5RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:21:20 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:21:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
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
Subject: [PATCH 10/10] gpu: nova-core: gsp: Boot GSP
Date: Wed, 27 Aug 2025 18:20:07 +1000
Message-ID: <20250827082015.959430-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0034.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::20) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f29528-3599-4403-b8b5-08dde542b2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?izlPDd0/0mJnyQYAGvcSmniRvnfYE8kJTHR0Q9DtqUsTcRmpiM9HBWwu01zm?=
 =?us-ascii?Q?oYjh66sYpNUJTMYUWCm2KcjiZ3xk6QYomDj1qSTjOwJsXRaUhW9S7xcU8Sow?=
 =?us-ascii?Q?07TQRDJpcJkkAS4z0zbLQaT86Jd8ntwqFMYaAJPx2rnFyLpcR2odpUjVyhR6?=
 =?us-ascii?Q?/ze+TRR7C4jWorBsKBbi1g3W76KH9IbHjXNsXJ/31rEdUR4AAWRRY0IRRLsB?=
 =?us-ascii?Q?UID5NksMAfARjWQn6rUrgjEEaDXV2oIwiXXkTG4KFIIDO7YIBBswGzPVvlir?=
 =?us-ascii?Q?gy4k6k+8aipL5Swy3y49p1Eu/4CY4oekNw1STzOO0BrUTrsNPi8SuRgGTr9j?=
 =?us-ascii?Q?4gOjYv1w6dfWc25lzFQxe6dEcz0Krg447XXsShX9dRE9kqoJd+/WFUlAea4B?=
 =?us-ascii?Q?cWU1Nsa+X1aUaHBGQQP5XqvdW6H2TBdrS/Terrgpvy5feoniiK4ICLzMEIZw?=
 =?us-ascii?Q?ki065fVXQ+L+O9bH9HJUYig9b+C/ermfxP7dTPNG+JnF1U+fyanKBMwjl5Ml?=
 =?us-ascii?Q?JOXbAjD3Zg++95JyldWTMXAKPc8DcvJoFnFanunyMCQYO6JlO5rhEEnQbNXc?=
 =?us-ascii?Q?vFuqYRYTdKYdUakws6IXPw9n1/4gWhhxFc9V//ZWDDrWGPC4lsZa00DqVOLT?=
 =?us-ascii?Q?E0dBJ6YKlxyINrP4xpCfepKUjs4a95c/fMUaAw855NBUWuAax4krC5aVwdnG?=
 =?us-ascii?Q?BkcnpA8LG8aMKZ9qAym8dgWjFWfz9SEs3RmGKSFl5rkxWbDh2AIpfBDYoDjc?=
 =?us-ascii?Q?04U4dOeIolUOYpDhPGBedL0FaV37sQHzWV96gWfbYSJ2gF0TRPo1Le53cUnW?=
 =?us-ascii?Q?ATDHxC/2HBXLfYTx0dwvODPqojiHBW/I/eBI7pte30lreHYOCKDIvJBf2Mxp?=
 =?us-ascii?Q?S0k+QGygw99vFN7cMyz3wMCus2e4mSz6Fiq7NjOYeniVlU4f0tcduufhAn6L?=
 =?us-ascii?Q?8LruFYgrhm4+3D2rJslnc7fcisINbdo3HmdKe6CqdYlk0jM6wem7cqa4j787?=
 =?us-ascii?Q?/UkN3gzzAkTdBQ3cC15CWV7cpY2xydZlQCEQzQ60yeJih0BjoMu1lfh88dyi?=
 =?us-ascii?Q?RPwNnAwEDxnm2dSOjwWp7sQDcBMmF9DUQsBYM9SV5E3KlMXwmYtATes45OfR?=
 =?us-ascii?Q?b/87rp/Hbnuv64q04HBvKi0o9hIHjVjCQMEusXOGwvsQcGMDFoZrc2MR060Z?=
 =?us-ascii?Q?VfSbTS71UNqZdYwweA7rkvyyLf37jJKLq7h/cZ/i4oQc5lz05Pka8ypO1luD?=
 =?us-ascii?Q?8Mam6VteuE1LnVFLiDxXd3joGJ2KALrEjMlgsP1aAUY+YatQJGlrYOEQ8nDU?=
 =?us-ascii?Q?2y9mDUJXqYp55s8oTkKiCxmusf0KOMzwuP5fcdHWfch9xpnq5ND1ft+EQpXL?=
 =?us-ascii?Q?UPMWYNUyK6mov6OyjGe/vt+pP3vxxujXuW1FYWyuPExcloZS5sErzYks73Rl?=
 =?us-ascii?Q?qrCTGOQEd8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XiIKeDd4bn9gzIbiX19gBhrqh06jjv8KZL7u/ZnzZb7OW99/qxY0/gmzxuAe?=
 =?us-ascii?Q?7yxlInYmfEIEykP2i+H001Oa0TlyTnNUhRreb11Pg+pWyU071zLlnIKTLC+i?=
 =?us-ascii?Q?iq/zCZDuvhgf/aoOtpTNYGLlutaa0kS6+k1TcAIxZxkRIVqD1z7ahiWCaR/W?=
 =?us-ascii?Q?KF8C5iErB0nTRr/cYaTEJ1IhONRW1a6Mh1NEMGnBMdsyIuPFEnES25eoxBsz?=
 =?us-ascii?Q?KmlebSzaG7XyXUR9LGheko9NQ/N3e9Kjm+WVuns1ADqpNaLFxKwwMyAkJiN5?=
 =?us-ascii?Q?CU8hmoYPCx+uKyj/VXolZwWL2t+6Bto2NsCcd2eQOxN8r65G487Qq7gdBKcB?=
 =?us-ascii?Q?wDx3s4vtJLxt0cRq4XQJ+dB1Jbsay/366bKHY/oOi5Kk7oLCLzfALuwGaSCq?=
 =?us-ascii?Q?PnqtCyGxugbW6IODnZFN6q0ms0Y80ZNCil8huAoJeEOZbVHLBHnbkQyIRSc4?=
 =?us-ascii?Q?MmlEpZVDBmCa7qVs/mf9csENjun/1Ky9HAoeGrHin4m1T3agZjEHo2j08mKJ?=
 =?us-ascii?Q?2s6DrPNkC+d1yRzV76JMfob63qFp+L1+7bU3m2yNKuUdvzl5WlFqNYestcco?=
 =?us-ascii?Q?Uq1cDacS6DiHHTMcxtXZHuqJYivlox+gDeLVjqJm+I3p32BCQsKPA/unnG8U?=
 =?us-ascii?Q?ojkNGOQf013Yq5A5qCVSVPzfHh8Q0zXm0XSkWZrbL/hpJO/pOAr902ci7+8T?=
 =?us-ascii?Q?I5mYWlFgr42NbVPBlO/MKzlbkFbTQufU0Eq3qzxmeXPDX6FzvTfwYaL1ORN/?=
 =?us-ascii?Q?AzmyAKi687pSDDlbDGIlFQdo1GmxgzJLJo6AjwTgdnf+Ttl/Yn/WmNI8Usgm?=
 =?us-ascii?Q?jV3RMeFMUoglw10jlGVFsV54q6CqKqWwn5ZTY1FoP/dmovu357CyAQHgSlsp?=
 =?us-ascii?Q?T7NUAisf7Z4DEKBP1iDeVcOs7hKwbfkP2r23xRClXnFTbcgfJ70AgbM0rxPF?=
 =?us-ascii?Q?U6VFa3K2pImhQTSJfCO1Z6xFzYhcJW+1LXSuNV8JCGK+xHOKbRe26tsKWqHd?=
 =?us-ascii?Q?B0Oq10hEm3V2Prnw+PoKiE2QJb6LmchmZXBjRVknOpk9NrJqrSzr5koZh+vi?=
 =?us-ascii?Q?x73bIxuyQrkCLUHn/q6UOCz7NknSniavg+21vAksUrF/sxLVb52hFY+aQnSW?=
 =?us-ascii?Q?Y6tmXFNObbmyxK22pAVinmS5PjNk1vTmSPQD8UYVTwoujYcpqYJhQmDUKi51?=
 =?us-ascii?Q?aK3aCkO+4urKy+SlW1zvO/JhPZXiPei92eaBrJX30As25+unfwGwAyJOEXDT?=
 =?us-ascii?Q?UMLO65UQcxNgs01HsLvLT8OgaJFwxCQBvoZ8qPlG/RIID4sdQTy7fLhfe63v?=
 =?us-ascii?Q?yMCgbG2XCQCUf1uZYFzk8MxycAgT55jdAz4F1/hNSJ8SFAzwT6kmirOy1/3c?=
 =?us-ascii?Q?trp1oOomKCRMXsArDffgdYMgNsM1NLZ+nuAOCyU5TwUw0AXuxRAA6rSwAtao?=
 =?us-ascii?Q?+3X3Fd5d7830yMFXXmgAVBxAwGw4dgq+lbWaYNUlDYERLSTL6jmER4qqiYl6?=
 =?us-ascii?Q?SsDLdxEzylsmpVsWxCEKT+gTWCs9PPcqawk4kbo2HnMq2FM4H4SvfDK8QugC?=
 =?us-ascii?Q?3rb9V5wvd7nE0WRgGayypuJgPGsZClf8xh1CWbFn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f29528-3599-4403-b8b5-08dde542b2ea
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:21:19.2254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zc1yo1hvTyIlFxIXLCsOOWETJk59L/OKO+8WrfntmbO4iYby1l90nj2WgrNROrPgAQFyVMVi6For8kR5HRgQeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs         |  1 -
 drivers/gpu/nova-core/firmware.rs       |  4 +-
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gpu.rs            | 56 +++++++++++++++++++++++--
 4 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 875804499b077..0c8ee7761f705 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -620,7 +620,6 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6c210e668d541..d35f1affaa28d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -115,11 +115,11 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
 }
 
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
 pub(crate) struct Firmware {
     /// Runs on the sec2 falcon engine to load and start the GSP bootloader.
-    booter_loader: BooterFirmware,
+    pub booter_loader: BooterFirmware,
     /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
+    #[expect(unused)]
     booter_unloader: BooterFirmware,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub gsp_bootloader: RiscvFirmware,
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 81bb348055031..b67e130e06cd6 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -50,7 +50,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub code_offset: u32,
@@ -59,7 +58,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c070bd581e2c9..f86221a681e27 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc};
+use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc, time::Delta};
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -313,8 +313,58 @@ pub(crate) fn new(
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
         let libos = gsp::GspMemObjects::new(pdev, bar, &fw, &fb_layout)?;
-        let _libos_handle = libos.libos_dma_handle();
-        let _wpr_handle = libos.wpr_meta.dma_handle();
+        let libos_handle = libos.libos_dma_handle();
+        let wpr_handle = libos.wpr_meta.dma_handle();
+
+        gsp_falcon.reset(bar)?;
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &fw.booter_loader)?;
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        // Match what Nouveau does here:
+        gsp_falcon.write_os_version(bar, fw.gsp_bootloader.app_version)?;
+
+        // Poll for RISC-V to become active before running sequencer
+        util::wait_on(Delta::from_secs(5), || {
+            if gsp_falcon.is_riscv_active(bar).unwrap_or(false) {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar)?,
+        );
 
         Ok(pin_init!(Self {
             spec,
-- 
2.47.2

