Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8DB37D8A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C254410E76D;
	Wed, 27 Aug 2025 08:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qkz8IXMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1EB10E768;
 Wed, 27 Aug 2025 08:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q28ga74eztX7TpM4XXqaG1AURn/gjDVuEwVTOAvfiaicWytLWj0gjl1D9Y59UDIB9RdWi+oKHPgI4rKX+aab6fBkiSz352gD6cX6rDtKt67N5JEgMXGjk7N95Z7soJ3gq64TjlO7Ig211MddE0JqMJYe8WKWRIORlJ2xxuo8BtRqaiWZlPWnUdmW/82/aZo6f+WSGaelnqYtOwPwEadnTyMwkSAsdUwqEb0qT05FNq5DmyNXrpmQokEsXhpr3z6N5o8fLj8s6Kdg00WD2fGeU/8KpFStpryrjIy0MvOV/CiYcCNHf7wkvv7XcG6nCRRwP1JIxmtcoaGsR6VOC+eeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsK5JJCC/GT+9lKWmNXBgb/uD7ZMc1VwW1OlMKetlpw=;
 b=WzVb5bK+ibXzb9eJkM2mkhgO8la9Hhj/bE9LezjPTnzp5+S0T/2IlMGGgW3H3+NxSKOezxrNbtLiDn3VKcbMys0pJxUIdpq9sJK47dnBW0rENNV4K4y/nQ3aVwmyx4kcEa5wV9DG3E0DUdAEeQBkkYBxGXcn2TD5MZ+I0xflu6AmUr6vd8Nw1kvmAsFDuWdRhBFlYyM4eUVIAelE5HcdmLJqhRjyKd6SUx7gHIlSTPl1UnMzXz1pVewJDzk8Vxl7qcZyyYfrcL9qLAVex5dNIxTR5LfTn8VAj73jpdtZRngpnThWVcYmk91QYTCfIGDUzGJotZdq0syVQeTMeTVfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsK5JJCC/GT+9lKWmNXBgb/uD7ZMc1VwW1OlMKetlpw=;
 b=Qkz8IXMlUHCocdiETzylYeSdsSKIVKz4NlQStMGgZHy6nZFXFu9hInaxBoNNoLH6wu8Mwji4hyi9L5hpT+C8IkD8F9/264XVSj6x60reMOJhqGBQzgHlOxFfsR79HuL6o7RuYonYYcRY7QwU3Pl3Lsbup7efdxfsyjCVCzZeGp1yc0t7yidwMJ5SbB6Bvmzo8hb2mJ8V4KqVrmTY+GQpVdyjFZs/NgqdCBFlh+sq/sgoA6bGDUj1E+Y42T1i2Eoab9C/UkgMwK5rmhkIuojjenoCVkk210SwHUWteKUKtpUmARBZGKYh7Lh1HVdMHTqRqQfQuwpEkBsdavvhx3JZjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:40 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:40 +0000
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
Subject: [PATCH 03/10] gpu: nova-core: gsp: Create wpr metadata
Date: Wed, 27 Aug 2025 18:20:00 +1000
Message-ID: <20250827082015.959430-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8P300CA0030.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::32) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e6e7d1-9320-4406-8e5e-08dde5429bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r8KGulIMPhI2fkhDBgcvX1SmKnkASFwAOfdvCTrMpLJ44gvpff2DuLULXnQG?=
 =?us-ascii?Q?zCIYEEgUtFiwatEKu5j5Iu0viJRYdU6r5j89siWrJjh7VYSN1IQNxNwU7nFS?=
 =?us-ascii?Q?fnHYbCbU844d/bXcSygWmZbDaUhsy0iq8/k2pHbsJuCRd5sWDOqR4E+9AlON?=
 =?us-ascii?Q?z636FARo5ym9ZOkAqDkJQNPqjhccF3xrzkrDW1mXjOzJKyEhdM/xpYv2Vy/H?=
 =?us-ascii?Q?xv/uMMhA8JWuTXx8p/y7OXxk2wZy2iEEjuTiMLOFLq0TC4P9m2zEFHXSPkg4?=
 =?us-ascii?Q?JUg7qmn0JyIsxR5MZRlCpZE183z6sLYEmbni38mY3Hm5BQUXh8StQbqtDv1r?=
 =?us-ascii?Q?FGYBzwQFTjxocHmRbgn3687QC5slSGIYHBdk8c8BURgILcHQS7+I462eOqx8?=
 =?us-ascii?Q?6wVKDriMmDQVBOxVU+GRY9mQYiFJ7Y2YKKANaab+G0xwuLt1DwWTQlIfDmWj?=
 =?us-ascii?Q?f9gLbBvNdPPac5Qp6g8vAUqocsCTLjhTZkv8hHu/vnQoxJIuFvY9+S0LetjG?=
 =?us-ascii?Q?kUPifBbmAKSxtSYTCOuDv6de6TJvCVoCMrJSuOOE/QgKM7so6brmBdIBmkX9?=
 =?us-ascii?Q?ZcZr5wfdcoF4FO8HgJlKY+0s0NuUDG5E9pH/1ee3m2fqtzk108rksTbnojlb?=
 =?us-ascii?Q?rncZIGObMQXAXGb31Jc5vktGkljNEGtGD40GgVKCO7fOiAtERmhpclUnDuFR?=
 =?us-ascii?Q?QR8aYLzu33Vu3dqrV6Aian660B5Gzj79x2XvwW9pjhz5ZeX7H5joLQELsK0f?=
 =?us-ascii?Q?Mxwg97uF+Jo8R6BpHOwl0HSDRhaHDr6nFl1xhatZNgRIwvLz6BtrX7tb+gU1?=
 =?us-ascii?Q?v1TWOMBPHpYhV20rCoyjdiAgQlGYyeYUD/CmS4W9AHhuNd+vA1RHfceRPU+4?=
 =?us-ascii?Q?LJoMf1sv4yQho7c5jlcbziSCgy24PkYAHfF2TJ4jlTenY+jr24sRatvx9pA6?=
 =?us-ascii?Q?PbY7dON8+BcRQzoIV8Q0Hhyw71aDi4ozUMxK2C4VGL763179v/SKTyYV8mPA?=
 =?us-ascii?Q?L6usNKgwTUs3DtOBSIsI6Ott0RFD7JtOXKmx4xzyPpsrseWQFHTcM4TV0gag?=
 =?us-ascii?Q?Zh21GvU5OzhUy9l0KaF0LJbOy1UkfrNEeBM/iKJb3fP5xpOGn44osqj/3t97?=
 =?us-ascii?Q?HWjJIixqthfs/lcTddKJYx0viSoFA0Cfrona3v4NO3vY+XvhBl+Phd/infk4?=
 =?us-ascii?Q?u9tGoGidykL5j/HYgz5QAbuI/GA73NExeVukFAZvjIyNlGnXXykxN4vDU8Ap?=
 =?us-ascii?Q?9M24mY2XpvAKCO5z5Gg4Jy5LERjr17WoDDyiFGY5iH/pvfF7mkiV8e5hMZQj?=
 =?us-ascii?Q?ym3yPPL0hvRNSxXaA/loaBvy0q9I5dEGnK12o6M3ni4MOsTw8Av+6jKp281h?=
 =?us-ascii?Q?qRTCFKDX2RuK5D3yHjxii7ri50/Xg3pwea3I9RwhJz/pbqjFKtJj3u3jfHVj?=
 =?us-ascii?Q?jVvCGFE3D2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RmGK5pQpB82rSsF1Scd7vratWA3tl8IPc9wZ7xegFGeb2CkILKmwwdAzs3uK?=
 =?us-ascii?Q?V17x3QLLznUN7ObzJSrfA3gAoJNn7CwuuzajqIYtyanzjc7/4M6NBlYs/OBK?=
 =?us-ascii?Q?dB1OWlcQRYewNIhqjp+BwHi80g4CQOGYi1yvf/JJH4JxUOsafzX+Y0TlvVpU?=
 =?us-ascii?Q?uI8hI5x6Rb8b3PmBW4PdHk/uPu8rafdB4UYlevgUe/hQinivmZE7t1JRcFHJ?=
 =?us-ascii?Q?GAATpXD5ySba0+2CJMXxvo1/h5A2hrj0iMY5f+2ge5VTq63Fd3P640ff3ccV?=
 =?us-ascii?Q?DztrO/MfKd8S7GtjtTDsAtRj1O9oX789dmkGUsVrFddPuRWcJFXlfRnBz9fN?=
 =?us-ascii?Q?Wr5g1Hz3jGtQ4j9FymRAsFaMS4WCgV4wYZ1eFvH3d3IQwcFo+sJFSe6SMhK6?=
 =?us-ascii?Q?2sVC2FA8ZQFFqbmvhJiPeNCq8NGmEKBxKLpi6er78Bw1zxUd+QccekfzHjCS?=
 =?us-ascii?Q?4/kiLPK0DLNn/wESFJNBBkL+wtp8smG12X7IdRk6MzUz1exns6iRrfiGG+m1?=
 =?us-ascii?Q?ciYsJEnSAVwCrxUWdTeEFIsiXcfo+pyqzTpthjMLP+qXuR93u8hIX36jipzO?=
 =?us-ascii?Q?aUNwMT7+1d9NXAWJDDR7UkmkKkfvOutLigzzGs+fb1dfacMY4XYiekQmxlB5?=
 =?us-ascii?Q?+16DYrls9xlzZa3hnHG1cWinzsVx90e7I2pDdkHU00XCb0Ry4pvP8HbGBRU8?=
 =?us-ascii?Q?+ckEDJ8SLk2Z0iynd6EP4rgO64d6YDtvlACJKG7johd91ubN1lIOIR/gPBMJ?=
 =?us-ascii?Q?SMzuuwvctGyy0a/8/6v2Eh72M7oS3jDUUL2uNQM96B/zPS2wW4RhiZd7YVZt?=
 =?us-ascii?Q?lCGgQR6XWqW4q97yjnasXfjhSkBjBHgMJE5BXNMdARZnl9vZQkcyBLL9UELf?=
 =?us-ascii?Q?1LcE8aeAqbiQtdfZokA6kqNf2xN7GINNkddqfu5xVErpMHCAfjy1G9sYXCjm?=
 =?us-ascii?Q?G4BVUt1H34A8rYyQeFtE+uanMZlinNoeCMPFGB6j5Zv1jqaK66jxzf/vQIuT?=
 =?us-ascii?Q?GXwEMLa+zmkpkNfAQO7phiqpyZlCeDK8FZwGZvw7KkYLKwIbZ5k0EppOYClj?=
 =?us-ascii?Q?7BGhrrgBiyWHQxNz1K+MCnIgmc+xXaYriLSqohHMkXSv8fI2M73l3bfR8sRt?=
 =?us-ascii?Q?ToehgFW1A85a58nJQx5HfnUMDkTl5Euwfo+c6G77f9rKhqV72jE03Qu4hQKb?=
 =?us-ascii?Q?gi0qzCS1kjeffDTfZfy+2PHi7xUEyJP+nsbe9Dl1hVkIE+o1l5Pmy5xtdxzv?=
 =?us-ascii?Q?sy0aonvLPIQs+z8sOi6hRxzeRQlct9ThsxRJWN8lWi/KtPlpeXgXHfnS/97D?=
 =?us-ascii?Q?aMvyKnAy+LEoDgjq58yiHPsxd9K9741hWbBIor5uFTysD+sHuvXP/lZXWZSx?=
 =?us-ascii?Q?ugW+ANMjxKxRWf2DNGjUx/Tv6nK6fEPNDfuibyI0Z2S+DwmhnWkN68xpBOnX?=
 =?us-ascii?Q?bpc2fwbUfAXZtpeqqLARcviYmtQiQvVRAVrsXmiVoFmbnUjh14PRttN6x7Cp?=
 =?us-ascii?Q?PXhe7qyvdDfEZghMgGDBBIO0LMYGdfdhY6Jqimc1Uzg2wocEBRCUFwVjzXOg?=
 =?us-ascii?Q?QXf+s1Kv3YE4QpxB4Pcc52d4HhanwWIkiASddTPT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e6e7d1-9320-4406-8e5e-08dde5429bf7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:40.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZd9QfnSZ5GSVGHCGm/bZMvDZXRUFgNbgJryKKoVZpYWXqzpAzDgomzFNzUCHpKXj41j4BUcN8aSxunDl/nSJQ==
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

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware.rs             |  2 +-
 drivers/gpu/nova-core/firmware/gsp.rs         |  1 -
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gpu.rs                  |  4 +-
 drivers/gpu/nova-core/gsp.rs                  | 77 ++++++++++++++++++-
 drivers/gpu/nova-core/nvfw.rs                 |  7 ++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   |  2 +
 8 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index a3eb063f86b3a..b1131a94389c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -130,7 +130,6 @@ pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 05e57730a3c6f..6c210e668d541 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -126,7 +126,7 @@ pub(crate) struct Firmware {
     /// GSP firmware.
     pub gsp: Pin<KBox<GspFirmware>>,
     /// GSP signatures, to be passed as parameter to the bootloader for validation.
-    gsp_sigs: DmaObject,
+    pub gsp_sigs: DmaObject,
 }
 
 impl Firmware {
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index f37bd619bfb71..69322fa7c1466 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -94,7 +94,6 @@ pub(crate) fn new<'a>(
         })
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the level 0 page table.
     pub(crate) fn lvl0_dma_handle(&self) -> DmaAddress {
         self.lvl0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index b2f646c1f02c6..81bb348055031 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -53,11 +53,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 6190199e055c2..bf762353f1d91 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -13,6 +13,7 @@
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
+
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -311,8 +312,9 @@ pub(crate) fn new(
 
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let libos = gsp::GspMemObjects::new(pdev)?;
+        let libos = gsp::GspMemObjects::new(pdev, &fw, &fb_layout)?;
         let _libos_handle = libos.libos_dma_handle();
+        let _wpr_handle = libos.wpr_meta.dma_handle();
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 161c057350622..1f51e354b9569 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -6,12 +6,17 @@
 use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
-use kernel::ptr::Alignment;
+use kernel::ptr::{Alignable, Alignment};
+use kernel::sizes::SZ_128K;
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::fb::FbLayout;
+use crate::firmware::Firmware;
 use crate::nvfw::{
-    LibosMemoryRegionInitArgument, LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
-    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
+    GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
+    LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM, GSP_FW_WPR_META_MAGIC,
+    GSP_FW_WPR_META_REVISION,
 };
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
@@ -25,12 +30,69 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
 // are valid.
 unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
 #[allow(unused)]
 pub(crate) struct GspMemObjects {
     libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
+    pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
+}
+
+pub(crate) fn build_wpr_meta(
+    dev: &device::Device<device::Bound>,
+    fw: &Firmware,
+    fb_layout: &FbLayout,
+) -> Result<CoherentAllocation<GspFwWprMeta>> {
+    let wpr_meta =
+        CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+    dma_write!(
+        wpr_meta[0] = GspFwWprMeta {
+            magic: GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: fw.gsp.lvl0_dma_handle(),
+            sizeOfRadix3Elf: fw.gsp.size as u64,
+            sysmemAddrOfBootloader: fw.gsp_bootloader.ucode.dma_handle(),
+            sizeOfBootloader: fw.gsp_bootloader.ucode.size() as u64,
+            bootloaderCodeOffset: u64::from(fw.gsp_bootloader.code_offset),
+            bootloaderDataOffset: u64::from(fw.gsp_bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(fw.gsp_bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: fw.gsp_sigs.dma_handle(),
+                    sizeOfSignature: fw.gsp_sigs.size() as u64,
+                }
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new(SZ_128K)),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        }
+    )?;
+
+    Ok(wpr_meta)
 }
 
 /// Generates the `ID8` identifier required for some GSP objects.
@@ -92,7 +154,11 @@ fn create_coherent_dma_object<A: AsBytes + FromBytes>(
 }
 
 impl GspMemObjects {
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<Self> {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        fw: &Firmware,
+        fb_layout: &FbLayout,
+    ) -> Result<Self> {
         let dev = pdev.as_ref();
         let mut libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
             dev,
@@ -106,11 +172,14 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<Self> {
         let mut logrm = create_coherent_dma_object::<u8>(dev, "LOGRM", 0x10000, &mut libos, 2)?;
         create_pte_array(&mut logrm);
 
+        let wpr_meta = build_wpr_meta(dev, fw, fb_layout)?;
+
         Ok(GspMemObjects {
             libos,
             loginit,
             logintr,
             logrm,
+            wpr_meta,
         })
     }
 
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 9a2f0c84ab103..c04b8e218758b 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -46,4 +46,11 @@ pub(crate) struct LibosParams {
     LibosMemoryRegionInitArgument,
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
     LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM,
+
+    // GSP firmware constants
+    GSP_FW_WPR_META_MAGIC,
+    GSP_FW_WPR_META_REVISION,
 };
+
+pub(crate) type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+pub(crate) type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 6a14cc3243918..392b25dc6991a 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
-- 
2.47.2

