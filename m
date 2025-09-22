Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA9B905F2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1B710E437;
	Mon, 22 Sep 2025 11:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="divlisP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBFE10E42D;
 Mon, 22 Sep 2025 11:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwGFlqE6u0Mp2ya2D31Y8mts5OGFTH4U89NN/JGFYb55se4z6OhovodE5JZgkR9WSlYIubrU+gG4rAn9AUSCCwUSCxk6XafhK7pJRQNIRBhE1Hi/9OHzcatFoaMs9hzCRTZkwS5Wb+IFxJVwdqWSrnoqmrnjGxMOyRtFyEeuWz5eRah0A8Cc8PdbK1hlg6sSWnSzytV6Y10acQtp8bDOMq3EgjMHFElUM4obi0lm+ItGhGekoYQcz4xM/DR6Xsti9eQn1OvIcHiuHfDUQpBPaHGzKOWLUwTn+dVJmj2YxXG1eeqr9JN9hmJnrWkCnCkuNR8W34VXyiow7OXQVyHqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcdEJqIL8VHbUL+30B4c3JRBOLB3BGwLxWSvbfzmWIM=;
 b=FZueBs1SADC/rQsQ9cMiLm3GoZtUjc2BHomtUFRqVCViukj6PAbkTjyar8e6GalPn1SkuYDC+FwTi8eMtthI9Qn+qMpxdPlLtQdP+ul1k1RdlFYYsr7wjCuXFpkpZi+fVVWdKZLj5qjo5yOTWC43DOf7TDW0ryvXZ/b94pdsOglYp5FrMGueNPruFJ7VELe99PQBK6FTC0EGxaRjt0YN4TGbykDbFnGsrfi3Lv1s44rQM0DJrIdmdkooVlJoijOct+kxkpFKwE7IGpWy71X5BOozjSFfS4Vf7ucSoJYYZ9A/sGkE9dmFSZ60t6m8HYAR3OnpTX3ZitWi7aZWUwXi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcdEJqIL8VHbUL+30B4c3JRBOLB3BGwLxWSvbfzmWIM=;
 b=divlisP18pk1elIv+mlSLj6IDR/X2dj/imdPRXWryWnRFrXA2Z9vGvMat14OipGghUuqGocIIZRuItX8ukycEP3PO0oStd0KupffKMB9Mf/T3JVwXYAxag006HR/WNXolZLqi06sgiGEdlmC0U9w70vIO3CtLj03xkG5a+Z5xJ4MpSonDx60caDhllfGf9mc+gQq7AECvpoHRRcV6UtmpvCvzvtneAAd7NRtWZRRnlsKYBLQajUbhxxZL0sL16ngAHCU1GEXcO60o+had7NknAftVMDDyI1lg5U2X/wFRka2J9S/OcdFZlR3oKUc5TQ05NbcNQpEFGx7lmhFLgJfjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 11:30:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:30:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
Subject: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
Date: Mon, 22 Sep 2025 21:30:19 +1000
Message-ID: <20250922113026.3083103-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0079.ausprd01.prod.outlook.com
 (2603:10c6:10:110::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 662d259f-18d3-42d1-902e-08ddf9cb80b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?udIzNw2XkAfkw8nnhFcrkCFlTCcAD2mBL830S3hkg1h5Nl5yMPFUnxqHUo/o?=
 =?us-ascii?Q?qPTmyBq89jXqzu26rZD2pZqecTOXZyF4u1aMYkjYXwYPeEkaD0ALDHsxPgh1?=
 =?us-ascii?Q?WE0p/WY5zOobl+sDu+mpEree0pPb23j1qun2NPE29MaGRRiYenzvgha0Lxxj?=
 =?us-ascii?Q?VtZ7FiMcrsXDvWC9u24+wlzelcmm1DWvZmXY6p3pbG+CZKj169HHel8gXQAO?=
 =?us-ascii?Q?YGbjs78nnwG8n2hLKdN/uCzt3+AwnW43y+QtmviO5dMBMR/aLAVKY3YGviD+?=
 =?us-ascii?Q?uxF/vh5Spmm6+uIjRL34/DH4EpXmOWzeazefHYqneURbIy0EZlVZJrtGSIKn?=
 =?us-ascii?Q?SkUlE66Hut6GjOr2YP1NwpPsmBOzZZMydHi6evVXKmqMMMySVNhMLgZJoN83?=
 =?us-ascii?Q?UpPEqHWRYqgwu4mH6ayLtKR2hcTbz0dczbJUBUfovhhBjUhf5g0II5jlnD1m?=
 =?us-ascii?Q?ctORObqtZ6jEww6tm1LeTaOtIc14bzmPfDR/7d/j1p7ldlzwGIlWX+Y9vov4?=
 =?us-ascii?Q?XOByvgAo0KhtLCLbAOfpz9GXaCW3YX8zQrgkMfDsrr8yBBLDFGG3OLEoNY3M?=
 =?us-ascii?Q?XQqz4Ab9i4fFwRo6Kwsq0rn767FMPMlQfTqoBjvz1ZXkUVFOQWCA11ojXkeO?=
 =?us-ascii?Q?+0np5EtoCgFA4bOcR/FhaDWKL0/OlEtTSy1YtCWEmnGHruvYrocR1MALQhnr?=
 =?us-ascii?Q?fJUpJEyv+Uzyd3q/xEDufz7PEVyfKz4/Mnmd9KR1+bV7qbhAOPrSnbcUparF?=
 =?us-ascii?Q?ROne69HBIiIBTCjEy/AYJlTJuqB1RPZKZVRc4UmBZvMqkn1jnun5pUPmibOB?=
 =?us-ascii?Q?U2qG8E6d9+TjP/4cMeAf7peOQzHAYnqwsFYE7SKfRyFex+2PgkfbpVBXt6sh?=
 =?us-ascii?Q?opayQ5fz3OwifgDsFAaDMSLP1ijq+7qrDyg6OY7AgvIHC6JTE1JJ0rrumX/E?=
 =?us-ascii?Q?R769xp8PwOf9JzmiafPUvW0y9mzY23JQFOeQO+78vGktAySS2R1naFmVu4XS?=
 =?us-ascii?Q?x9EWDevyQnDzdymQKD9xThQB70hMmRz/MFtTVnnyb6a/hJ4vXD5L7Z89aSsO?=
 =?us-ascii?Q?BImHvRIb5x/FY5shoDFKd9HZDbNagOGAxqEf5JeVubC+c6RK9uifQVeFISMR?=
 =?us-ascii?Q?dXNr/BhSPlZ97RtmVi6le63BeNpV9g+gLuVuHCzN6ifXhl5k+uOwypYOK8Er?=
 =?us-ascii?Q?CPKcL0WQZNH1E9JsxWmCiZ4yNjAeV+YYxM7hirdDItRNpAkru6NSiMfmPm4V?=
 =?us-ascii?Q?ylAOi6aFK5uw0zfW0g17Vq1Ed6M7nz+JTW7sgpQexHFNBgiXjx/uC9ecnCzn?=
 =?us-ascii?Q?XjhMJAbgtNMX+HbpsFys/ManHGtSUrW1l9/5R7CMdTi9ZPsnvKmAcPK9B1jC?=
 =?us-ascii?Q?V6RLxecWnmGFMUANvPXucY877TaQrLkC/9px4XaekBBDiOhMUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3bBv345025raRN9xrXSjWWDY8CxlBVVqXiGRUNcHvBSvEzeCDZbxDYpTTau?=
 =?us-ascii?Q?hvN6NQ5/9052eVy44Gw661ysYsI0DD0kb+iuDsEKkd03QgziAyLkJPLkS0UY?=
 =?us-ascii?Q?3+Q/bayWIvHBu9LGVVTO8jcJAKoqnDdEce+FAeMWjKzMN3sC555H7wsWhbWL?=
 =?us-ascii?Q?Bu3IXCa54ll9cqq+ZdJKlwfr/UT2FNmdzxjAlEEE17KvD3oCS9MCgDjRR6S6?=
 =?us-ascii?Q?VVrnZnyJpevTTXFTv8jJtpDDQpLPGSqEVPvrqkhG7YHwENQunTllArfm+0GU?=
 =?us-ascii?Q?XFFyCboy0y70XH2u5y8gPVPU0Qvb4XN3vZA1OfSF9EbKgaEXPWXuL7AIL1Uf?=
 =?us-ascii?Q?gPwvJoY1lIOJH010Y3AK2CutLHtKUyu7cM/zoImdHMnNc6jhv9aF5Q9yH0wH?=
 =?us-ascii?Q?svZnZmAg5sVK45X9nIjRhRQfr3AKnZ9rt8iMb/OexVWCNO5k1gAlCCmmQZJz?=
 =?us-ascii?Q?54kudcec7bFO/aa6QLTgbtMYhz8SmDFqljXLi79KEPxMaKkQt4+KGoZwyAxy?=
 =?us-ascii?Q?oVS9zAtpmD9l7hCCktCdNG1jbBQZGxxERHdeEFetOG8dPoc24MsmFD1HnqO9?=
 =?us-ascii?Q?EwlmvYtltRoeqPIavil/Ii4mflSwCxD39LOBjej9tZCmQeJPHCA5S5+KB5Lf?=
 =?us-ascii?Q?OY5MMqqYITbGiLOzRierd9qQVntcyqri10qcatKAXj6CKhISMpQXRy/L3G6A?=
 =?us-ascii?Q?aevrT1u2WMJHcy+0Fc2urrXKt/n+CMSzeMtbUU59yMRUvkZQg00Etg+dRrxX?=
 =?us-ascii?Q?h8aYo/kZP2+usY3cx0A5INXYFZxncTcwrJiHg78p98Icdj6QNu229Veo5bEp?=
 =?us-ascii?Q?6Uc9W7GRmYHnEBvv4aqOOgnYTQ5d/73fcrW9Ss5h1btdquGMjfOZoZ4qoyWI?=
 =?us-ascii?Q?K7BWkqYKW1te7cJy49S16FaobbCnB/FFTiHnCXPY1D9x58tPas45fWMmFRo3?=
 =?us-ascii?Q?BlyxFA5zd8J3+fudklYofMa0ILE10b1x/LIPHlAhjSnwjDq4ZMEpaRsk0Qjh?=
 =?us-ascii?Q?shoZq3ynmjt9dyTHh7HWXsl6mXdqBD1ElSciC1mfxfhfmC+PTs8BFOZDLarQ?=
 =?us-ascii?Q?/mnbqAn5xjlV22vU+zwWZ0KMIN8m1XF79ooNwmwYRIhpylps9px5TCUCBq98?=
 =?us-ascii?Q?/AhizdshaNTZAX0eRR1/EdLvQJSlX3GsrjrgtAf+KO0p49E4sFGP7LWmubay?=
 =?us-ascii?Q?B7KlfF5eVTEAlJfVDHQjml+SEQ7QtzFowROwsnBGwQoghsZCiNF4NOotRrPq?=
 =?us-ascii?Q?NCq7AREBKT0ZcCQ2N6K4cLJt/71kXC0d5vTYbAAz6o3ixPzt1E1tFIHfJFnp?=
 =?us-ascii?Q?FYPR4tjUy8yqZWQpTajDKyOInbLTTY88QG0HC1baVvtEFY8lZlCHWR4Wp/u6?=
 =?us-ascii?Q?wxDwvAZnAyy7pQd2tHTZ6kg6VbWhSWrCZ2AA0wlR6anxzvTe4O1JO7qnlKX/?=
 =?us-ascii?Q?0sTfM5+P4nX0CKG8xnPoKxNg+lFLu2Av8jUMLDZt1MUkND/NZJwKGUD5fuf+?=
 =?us-ascii?Q?AdrVUmpbDezYAz822l8rZOXPZ9WkpfO9UW1zMABrVhbhIOuYDGxIwHn9Exdt?=
 =?us-ascii?Q?kvhcsS7NaPf/yOU2cBsgCWUXqQCzV0UL3JSFdPco?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662d259f-18d3-42d1-902e-08ddf9cb80b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:30:59.1125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiRoCxQPugMsnYTxXlLlfgXf6WTHRmk7JtaQAc8BLQGR7iqdSvoUN2DL6GopK8wucBhzUD2WRGFClRhVGGsPzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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

Changes for v2:
 - Rebased on Alex's latest version
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gsp.rs                  |  1 +
 drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 63 ++++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4d6a1f452183..5580498ba2fb 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9654810834d9..67b85e1db27d 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -127,7 +127,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub bootloader: RiscvFirmware,
 }
@@ -212,7 +212,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index b90acfc81e78..dec33d2b631a 100644
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
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 0185f66971ff..2daa46f2a514 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -13,6 +13,7 @@
 use kernel::ptr::Alignment;
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::fb::FbLayout;
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index fb22508128c4..1d2448331d7a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
 
@@ -14,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
 
@@ -132,6 +135,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index dd1e7fc85d85..7f4fe684ddaf 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -8,12 +8,14 @@
 use core::ops::Range;
 
 use kernel::dma::CoherentAllocation;
-use kernel::ptr::Alignable;
-use kernel::sizes::SZ_1M;
+use kernel::ptr::{Alignable, Alignment};
+use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp;
+use crate::gsp::FbLayout;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -102,6 +104,63 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
+        Self(bindings::GspFwWprMeta {
+            magic: GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: gsp_firmware.size as u64,
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: gsp_firmware.bootloader.ucode.size() as u64,
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: gsp_firmware.signatures.size() as u64,
+                },
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
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        })
+    }
+}
+
+pub(crate) use r570_144::{
+    // GSP firmware constants
+    GSP_FW_WPR_META_MAGIC,
+    GSP_FW_WPR_META_REVISION,
+};
+
 #[repr(transparent)]
 pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
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
2.50.1

