Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C911B37D95
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8548710E77A;
	Wed, 27 Aug 2025 08:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R7RL+4fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB66710E779;
 Wed, 27 Aug 2025 08:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVxcaG8TqxrkH5EAcW2dcOrgSewml+/U7gHn42w/Kii6t4lK+QaJtSG1JDXUNYcBe6t+A/vsR0G5BxDBoKs0ifpFIyLF0rad6B7UEu3jPGw0bglHhlD5zcpwyQxtaH4XJirt5o+X6auJ0bPuEpm8F/1vTmD0yLtNgo3pFGp3LJ+cc7EsTrkH9HfMv5ft+r6w0RNttjMdrGwhfn81qn3wLmHAe0wl+1J2+ay8nR+8oSkJvMfOj0ltlVb/wSxcmAhaKediRbqm9jxMKFYYz9LsboF7G5LnbiSK7TqFXEqBYZGzR1AvMLoy6WzI5sArPBxE6rhKb2VMFcKhdfL0xTbF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt8eldJzem8aLSB1VXovOC9dKwNRTw44RZW54vvRQ7Y=;
 b=YJ6Xl2Uvu5HSURCrgleDqVvptZr9yaiuc/esS7wTJhSXm74B8rmMkjLTAcSvPspRA/JBbuydTezG+FcU+bwMRBDXHBNkPeaSfvRozBLW8Ho6B+s5QKCEOGPetUhXsa0J4KoUmq6mIfiFR8cKbvhBsM6ivBg+QPAkZh1fgjB+tJS0o3+zyJX5+ZkfYzV9oLyovanvzBF1bLkohHTujL1ZceWp8TWlX0L5xioYXjoQloskeJoQR9C0ZfL4O0pJrP/S1y89HRPaR/vV2xy7uvE5PiNJs3dly/5JzIM4+0GhQeLIA7X8sakYD8R9fbRphNVQ/e4hk0ImJxydOUYJr3l+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt8eldJzem8aLSB1VXovOC9dKwNRTw44RZW54vvRQ7Y=;
 b=R7RL+4fyH7sIuOEzkqJ5nc6hY76WAWQDsxgFZCD5QIgUK4z5tndo2h2p5/Wh76rdnbOrvZ3G6vwfOClp62qqYc0pmqFK5/PhGyYCpZXthqnXOr2LM12NoqcsM/te0sBbrsg4ET2kcrSyKdZtodyX0o9o3Z16xbmMsjtmCUWtGSj6QL5wc1KN4kMObOFFdTjbabtlSfnPG11wP+hWr7RLsqG6kTgl2WsctrrK/TQph2ThcVcrD1Ava0evxauo42KIuzC8LNjFLYuOEUwnGWQPoRkJEhvbc3sxsD0YpYZztw2Tg565vL5j/Yo4rnWfUpgLMcwrXW16GZ797wtVsgwFvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:21:03 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:21:03 +0000
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
Subject: [PATCH 07/10] gpu: nova-core: gsp: Create RM registry and sysinfo
 commands
Date: Wed, 27 Aug 2025 18:20:04 +1000
Message-ID: <20250827082015.959430-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MEWPR01CA0032.ausprd01.prod.outlook.com
 (2603:10c6:220:1e5::15) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 956d5372-60cb-471d-ef82-08dde542a984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EUb3q9Z8B/Xuj5ZzgTng65q2ESjPPXSpQh4i2x50c4j1h3FLFRQ9pJxMjrW3?=
 =?us-ascii?Q?VJF1h56bxTAGfWD3Rdp16wpWV+Vj94ycBSNGzbIijlMV4Siys/KZGuTsPRgX?=
 =?us-ascii?Q?cqktnrQlFDksmmcZO5192jBHIhVZkWMlXNBjY8nhuKccN1P05kPFeoY+agL0?=
 =?us-ascii?Q?bOk9FMRYbav43biV642Am77Ykko+ySykRp7kMj4LtwRePkR1UjlO5w0tuYjR?=
 =?us-ascii?Q?myEOy1oDWkwZq11ozg4kO1uanKXSHg0Acva6fUv/yt3ljGWYjIT3nZJA7WEy?=
 =?us-ascii?Q?MaIIALjoGWJNB7pwHpemw4q+mzAqHkmdgcL9a1cQURuUuAcZOQu0i9wuNFbt?=
 =?us-ascii?Q?nCEVP7niOHM0MOmDHdPaIchL1hx0LE6FCD3w1RABI/f8SyUfJGlsFGQs0x9y?=
 =?us-ascii?Q?zCBh/0m9BsmVtjsk5tipJS/8soa9Fx93POph0X/5h/WkvR7V6tzCCopq9aws?=
 =?us-ascii?Q?QWDCGVhgytkLmcjqxWTIj9xVBFNyfivNq3P2d0QFNHYJ1qYVonCW5YZVb7z2?=
 =?us-ascii?Q?UEq/7agTQrADS1/MXNjtPyE1G0euz6I1Mxj0PGAHJ9PIPfPCGSRnGQNp5pKb?=
 =?us-ascii?Q?KlK4f9K/nq/tbcv9pj3d0h1MBog/EnZvXAfTXOywD4WmxxRmM/MMFKj7fvQW?=
 =?us-ascii?Q?J7nsIh4wlPUnkcSFwiTnvS0wrMekERPXLj4CJLrmTOoZWGAiLjHLs4C1c3hp?=
 =?us-ascii?Q?2/uxU19x/kyRycgsHQE8cHes6JBmZgQbMpXFccN+fDgwNXVqlyj0KM7tiZeI?=
 =?us-ascii?Q?OnAt7au96mrbqP3O6ZmSZ9gDDpift7Xwgdx0yOTYks29YGlRWgbErrMrKY0o?=
 =?us-ascii?Q?uhhmKI1UqwUvLpEZOMmez8S4JtWUsxK1Ah4xY+uobKAfiBhYut5CKoX1kjTl?=
 =?us-ascii?Q?rGXGukaMKZGZmdBUX2ctLK7MXrZx99kjNkaFFb8uP4KnTKKkt0yxW8Dw0ifa?=
 =?us-ascii?Q?5qoqMZCEI62RIr1MDhxst5fatuSvtaUt0sOgHd79CjKZ1toY3UhXMncGDbTU?=
 =?us-ascii?Q?qYzBDqLQEZwYmPcCeVn0fxikRqzwyvspThwFI5kbFKcx/+VzIuy2yI5fQ9xG?=
 =?us-ascii?Q?MNCe5Zouy5W3+pCceWtgYh6V0uoMLpN2VngC1zw8SaQ03cxolgwTaSU2XOa8?=
 =?us-ascii?Q?lhz2biWD6dPP40MKpoc/i3tzJmz8laR8wxGk3kEDn2ZY7DAfwybN0iFrHxBl?=
 =?us-ascii?Q?zSKHtQaWD576rB96f3qFdokuL3QAxs5m2UqoPxw4uUHmpfT4zIL5RpWHqow8?=
 =?us-ascii?Q?K8XVOP6+hgNSgS4fsG8oDbCkSYwNxykLffYXKs0Rvd2jMiZBYIWsUEBC4UKB?=
 =?us-ascii?Q?uFtMVbfWmingwlj1tmuWeTHmTzxpFrVhl9Yi4kgY3UeSpX7Jp++hBJV0RP2O?=
 =?us-ascii?Q?pRqDMfBql22UTpcknIg+hHw2tPfXW0JASIrmmn0CbWG+SrqwpqxDGtkrwgi7?=
 =?us-ascii?Q?lZc/ay/lhgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oIZrgbcdZ0kmTKdwb+E0y3BruOfMaTpg6tidaBDbPWS0yd6qaOEJHuxFtkeJ?=
 =?us-ascii?Q?P2siZ72VposCptJFHAhCDo7SU7LuQm9iLvKdynaWbNNzZkvRAEfzH5HtuvWl?=
 =?us-ascii?Q?MmS31E3jZ+ja2hbR0fvfBxTlduED/qJGrSwrTR4g/1S+mn/ULeiJdKiXapYu?=
 =?us-ascii?Q?RsPrF+IytePorjLWCghRAaJPXb+CgE3s5xdDoZlBEHuS3l8rymTgoixwkIlE?=
 =?us-ascii?Q?3FPv2jd3pvu+8gXPx2m0QJLHqsYlPWFI1hK9Qf1t+vrbQLdQgOwtFfKyWcZC?=
 =?us-ascii?Q?g51s9UDMG972lU5U5dqmLPxaI2Fw9JN/YSl8GI2k6ylV5YkZYlPnydBnq1K8?=
 =?us-ascii?Q?G61/wLbAVTvbiT4v+72BLZGyRQTEAzprJ12yHr9R7yft21foqYi3B2Z8Sxc2?=
 =?us-ascii?Q?M7VFpRZPGVC4z3cufR0uoe3Y+CFXi8dwZRzMadwqFHYMuB1dPxiwgMPlwZ4q?=
 =?us-ascii?Q?VgDYUcELJBx3bXQrCDN0cqkV0M2TRcXz87N7ipkkqSSmBa14RVNOxD7E8Kxq?=
 =?us-ascii?Q?1vvmcCfQa98x5C/KPESRBYvDG4hH+zn0jIC/pCfovQ3kH2zsx70/YSmbb7GT?=
 =?us-ascii?Q?Kz20VuPhgngGHK0YiDVvFSrdyOSaXg3HDMd/nmzQEwNpum2MHzWYgHs5yzZ5?=
 =?us-ascii?Q?+3HSq7sUe2F/5Q6kVD0z3LHbn0iAMXuzkxkOBIKcHGXFHD2jUyoCFbZSDgUR?=
 =?us-ascii?Q?hAqqw9+4nLvBkaxIOZfYROH86/NM3asvtx0NfAytWAvmZZyi4bBAsfAqVYJG?=
 =?us-ascii?Q?wPlyMesd0k30J61gjcS/0r0jny/xltdP9IjRehiuUWjLPP1L9gTP5TUAM94g?=
 =?us-ascii?Q?HuJjPIhhZA0/eUm6bdDxIdQO1RebbKJORDGyavPV1v/+ARpevfpSpZ9rDm1J?=
 =?us-ascii?Q?E2/IwviJp6E5GVii8l7p9sLzgdqffNwWql9Z/6dm73low4IkV8GsVrxP8ncq?=
 =?us-ascii?Q?WBP9yfetn2HiW9Nm65gEsWftPjD51Ku9Mr2W7jQ4ZQBH3IBCOTdXdAXBdlHA?=
 =?us-ascii?Q?NRlDXztqkrO0+Kas1ib9FHxOIUps+TA8Rabu4/00Vx6X3x7OFedqKKMk3kI1?=
 =?us-ascii?Q?OaizgzOMA5SgDtbD6TbZgVt94OuIDCjFa+nNHx/o7IKlZI+EP4yATSoeYH1c?=
 =?us-ascii?Q?/le7LA/QGNkiA698yH7CE/3/OYm/tZvqsdUxrhS0DGqPlPdfo0eJGkGn04/1?=
 =?us-ascii?Q?V5AIw+Tvnz0Q3oJktYxIbR1EBZgRv3NII/8is98JwEzFoFh4MN5JZg0NaXI9?=
 =?us-ascii?Q?qTne4tmQ7cSkgC3GSzSsc/PZlk2Fz0C7fB/L6/lMyjxkZ8YwZs1mIs075fpd?=
 =?us-ascii?Q?iPd/M0/aHOYOiOtE4y9qttQ++5dJQkLAYWuITOnCkcMGsegSS1A4ucYaQhiY?=
 =?us-ascii?Q?3YcSc6RDzQ6YRCJJEiJsv7hLhMULMSKalZ9JS/yXJ4SStASvf5tYyduKtX2l?=
 =?us-ascii?Q?1B5P0B79byHiK5ApxkN5HwbFhyoVLuooLFdXw+HQ5j+CUg1qKMsjBgFuN+V1?=
 =?us-ascii?Q?VFF60WlQj4CoAbUTfT9/HpPF4RVI/+7vnNpUaI5KcxT5pSrALiztm6GET3jh?=
 =?us-ascii?Q?BuKQjZcVO4hOb1ltFEtA/rI/63rEwCDKuRccz4G8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956d5372-60cb-471d-ef82-08dde542a984
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:21:03.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1OMrQ7/T/E+UTVYcumJwVnvo/as47M/aMdDVlMQuUaiLwMfrY2TD/91nqz7L2pKIRjESHrH3hQn3Wu1PQDvyA==
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

Add the RM registry and system information commands that enable the host
driver to configure GSP firmware parameters during initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only two parameters which are required to boot
GSP are hardcoded. In future a kernel module parameter will be added to
enable other parameters to be added.

Also add the system info command, which provides required hardware
information to the GSP. These commands use the GSP command queue
infrastructure to issue commands to the GSP which is read during GSP
boot.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  |   7 +
 drivers/gpu/nova-core/gsp/cmdq.rs             |   3 -
 drivers/gpu/nova-core/gsp/commands.rs         | 201 ++++++++++++++++++
 drivers/gpu/nova-core/nvfw.rs                 |   8 +
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 179 ++++++++++++++++
 6 files changed, 396 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index bf762353f1d91..c070bd581e2c9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -312,7 +312,7 @@ pub(crate) fn new(
 
         Self::run_fwsec_frts(pdev.as_ref(), &gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let libos = gsp::GspMemObjects::new(pdev, &fw, &fb_layout)?;
+        let libos = gsp::GspMemObjects::new(pdev, bar, &fw, &fb_layout)?;
         let _libos_handle = libos.libos_dma_handle();
         let _wpr_handle = libos.wpr_meta.dma_handle();
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 56a6be7b9eb15..9776c643f5276 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -11,9 +11,11 @@
 use kernel::sizes::SZ_128K;
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::driver::Bar0;
 use crate::fb::FbLayout;
 use crate::firmware::Firmware;
 use crate::gsp::cmdq::GspCmdq;
+use crate::gsp::commands::{build_registry, set_system_info};
 use crate::nvfw::{
     GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
@@ -23,6 +25,7 @@
 };
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
@@ -176,6 +179,7 @@ fn create_coherent_dma_object<A: AsBytes + FromBytes>(
 impl GspMemObjects {
     pub(crate) fn new(
         pdev: &pci::Device<device::Bound>,
+        bar: &Bar0,
         fw: &Firmware,
         fb_layout: &FbLayout,
     ) -> Result<Self> {
@@ -218,6 +222,9 @@ pub(crate) fn new(
         )?;
         dma_write!(rmargs[0].bDmemStack = 1)?;
 
+        set_system_info(&mut cmdq, pdev, bar)?;
+        build_registry(&mut cmdq, bar)?;
+
         Ok(GspMemObjects {
             libos,
             loginit,
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 134ed0e20d9e3..4e4fbaa81e8e7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -228,7 +228,6 @@ pub(crate) struct GspQueueCommand<'a> {
 );
 
 impl<'a> GspQueueCommand<'a> {
-    #[expect(unused)]
     pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQueueCommandData<'b, M> {
         // SAFETY: The slice references the cmdq message memory which is
         // guaranteed to outlive the returned GspQueueCommandData by the
@@ -247,7 +246,6 @@ pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQueueCommandDat
         (msg, sbuf)
     }
 
-    #[expect(unused)]
     pub(crate) fn send_to_gsp(self, bar: &Bar0) -> Result {
         self.cmdq.wait_for_free_cmd_to_gsp(
             Delta::from_secs(GSP_COMMAND_TIMEOUT),
@@ -361,7 +359,6 @@ pub(crate) fn wait_for_free_cmd_to_gsp(&self, timeout: Delta, size: usize) -> Re
         })
     }
 
-    #[expect(unused)]
     pub(crate) fn alloc_gsp_queue_command<'a>(
         &'a mut self,
         cmd_size: usize,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 0000000000000..12ea8cdec21db
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::alloc::Layout;
+
+use kernel::alloc::allocator::Kmalloc;
+use kernel::alloc::Allocator;
+use kernel::build_assert;
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use crate::driver::Bar0;
+use crate::gsp::cmdq::GspCommandToGsp;
+use crate::gsp::cmdq::GspCmdq;
+use crate::gsp::GSP_PAGE_SIZE;
+use crate::nvfw::{
+    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GspSystemInfo,
+    PACKED_REGISTRY_TABLE,
+    PACKED_REGISTRY_ENTRY,
+    REGISTRY_TABLE_ENTRY_TYPE_DWORD,
+};
+use crate::sbuffer::SBuffer;
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSystemInfo {}
+
+const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
+struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+struct RegistryTable {
+    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
+}
+
+struct GspRegistryTable;
+impl GspCommandToGsp for GspRegistryTable {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_SET_REGISTRY;
+}
+
+impl RegistryTable {
+    fn serialize_registry_table(&self) -> Result<KVec<u8>> {
+        let entries = &self.entries;
+        let total_size = self.size();
+        let align = core::mem::align_of::<PACKED_REGISTRY_TABLE>();
+        let layout = Layout::from_size_align(total_size, align).map_err(|_| ENOMEM)?;
+        debug_assert_eq!(layout.size(), total_size);
+        let mut string_data_offset = size_of::<PACKED_REGISTRY_TABLE>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>();
+        let allocation = Kmalloc::alloc(layout, GFP_KERNEL)?;
+        let ptr = allocation.as_ptr().cast::<u8>();
+
+        // We allocate the memory for the vector ourselves to ensure it has the
+        // correct layout to cast to a PACKED_REGISTRY_TABLE and subsequent
+        // fw:PACKED_REGISTRY_ENTRIES.
+        //
+        // SAFETY:
+        //  - ptr was allocated with Kmalloc as required for KVec.
+        //  - ptr trivally meets the alignment requirements for u8.
+        //  - No elements have been initialised so this is zero length.
+        //  - The capacity matches the total size of the allocation.
+        let mut table_vec = unsafe { KVec::<u8>::from_raw_parts(ptr, 0, layout.size()) };
+        let table_slice = table_vec.spare_capacity_mut();
+        let table = table_slice.as_mut_ptr().cast::<PACKED_REGISTRY_TABLE>();
+
+        // SAFETY: We ensured the alignment was correct when allocating the vector.
+        unsafe {
+            // Set the table header
+            (*table).numEntries = GSP_REGISTRY_NUM_ENTRIES as u32;
+            (*table).size = total_size as u32;
+        }
+
+        for (i, entry) in entries.iter().enumerate().take(GSP_REGISTRY_NUM_ENTRIES) {
+            // SAFETY: The allocation meets the alignment requirements for
+            // fw::PACKED_REGISTRY_TABLE which includes a zero length array for the entries.
+            unsafe {
+                let entry_ptr = table_slice
+                    .as_mut_ptr()
+                    .add(
+                        size_of::<PACKED_REGISTRY_TABLE>()
+                            + i * size_of::<PACKED_REGISTRY_ENTRY>(),
+                    )
+                    .cast::<PACKED_REGISTRY_ENTRY>();
+
+                // Set entry metadata
+                (*entry_ptr).nameOffset = string_data_offset as u32;
+                (*entry_ptr).type_ = REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8;
+                (*entry_ptr).data = entry.value;
+                (*entry_ptr).length = 0;
+            }
+
+            let key_bytes = entry.key.as_bytes();
+            let string_dest_slice =
+                &mut table_slice[string_data_offset..string_data_offset + key_bytes.len() + 1];
+
+            // Can't use copy_from_slice() because string_dest_slice is MaybeUninit<u8>.
+            for (i, &byte) in key_bytes.iter().enumerate() {
+                string_dest_slice[i].write(byte);
+            }
+
+            // Add null terminator
+            string_dest_slice[key_bytes.len()].write(0);
+
+            // Update offset for next string
+            string_data_offset += string_dest_slice.len();
+        }
+
+        debug_assert_eq!(total_size, string_data_offset);
+
+        // SAFETY: All data has been written to as asserted above and the
+        // capacity matches the original allocation.
+        unsafe { table_vec.inc_len(layout.size()) };
+
+        Ok(table_vec)
+    }
+
+    fn copy_to_sbuf_iter(&self, mut sbuf: SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result {
+        let table_vec = self.serialize_registry_table()?;
+        sbuf.write_all(&table_vec)?;
+        Ok(())
+    }
+
+    fn size(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        size_of::<PACKED_REGISTRY_TABLE>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PACKED_REGISTRY_ENTRY>()
+            + key_size
+    }
+}
+
+pub(crate) fn build_registry(cmdq: &mut GspCmdq, bar: &Bar0) -> Result {
+    let registry = RegistryTable {
+        entries: [
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+        ],
+    };
+    let mut msg = cmdq.alloc_gsp_queue_command(registry.size())?;
+    {
+        let (_, some_sbuf) = msg.try_as::<GspRegistryTable>();
+        let sbuf = some_sbuf.ok_or(ENOMEM)?;
+        registry.copy_to_sbuf_iter(sbuf)?;
+    }
+    msg.send_to_gsp(bar)?;
+
+    Ok(())
+}
+
+impl GspCommandToGsp for GspSystemInfo {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO;
+}
+
+pub(crate) fn set_system_info(
+    cmdq: &mut GspCmdq,
+    dev: &pci::Device<device::Bound>,
+    bar: &Bar0,
+) -> Result {
+    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
+    let mut msg = cmdq.alloc_gsp_queue_command(size_of::<GspSystemInfo>())?;
+    {
+        let (info, _) = msg.try_as::<GspSystemInfo>();
+
+        info.gpuPhysAddr = dev.resource_start(0)?;
+        info.gpuPhysFbAddr = dev.resource_start(1)?;
+        info.gpuPhysInstAddr = dev.resource_start(3)?;
+        info.nvDomainBusDeviceFunc = u64::from(dev.dev_id());
+
+        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+        info.maxUserVa = (1 << 47) - 4096;
+        info.pciConfigMirrorBase = 0x088000;
+        info.pciConfigMirrorSize = 0x001000;
+
+        info.PCIDeviceID = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id());
+        info.PCISubDeviceID =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+        info.PCIRevisionID = u32::from(dev.revision_id());
+        info.bIsPrimary = 0;
+        info.bPreserveVideoMemoryAllocations = 0;
+    }
+    msg.send_to_gsp(bar)?;
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 3d934cc95feb0..aa883d4588388 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -42,6 +42,9 @@ pub(crate) struct LibosParams {
 pub(crate) use r570_144::GspFwWprMeta;
 
 pub(crate) use r570_144::{
+    // Core GSP structures
+    GspSystemInfo,
+
     // LibOS memory structures
     LibosMemoryRegionInitArgument,
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
@@ -87,6 +90,11 @@ pub(crate) struct LibosParams {
     NV_VGPU_MSG_FUNCTION_NOP,
     NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
     NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+
+    // RM registry structures
+    PACKED_REGISTRY_ENTRY,
+    PACKED_REGISTRY_TABLE,
+    REGISTRY_TABLE_ENTRY_TYPE_DWORD,
 };
 
 pub(crate) type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index ab331fe6b1c81..3832d0b7a0b92 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -1,5 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
@@ -11,6 +41,7 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
+pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -289,6 +320,138 @@
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -446,3 +609,19 @@ pub struct LibosMemoryRegionInitArgument {
     pub loc: u8_,
     pub __bindgen_padding_0: [u8; 6usize],
 }
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
-- 
2.47.2

