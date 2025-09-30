Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E7BAD010
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0010E5B5;
	Tue, 30 Sep 2025 13:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jip/2tt2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2605210E5B0;
 Tue, 30 Sep 2025 13:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/ErstnTfXuj9kxL4ifedmYuvGk5PMKGK+FHISgxdFMAqbTTtZIDsbu31e0yNAN7qxaxcFW/b8CKZH05xfsWyN/LToESGVBEWzVu5HaASL1R6NVBIAPoxvyMNgzoBaIh5tJf8IVQsx3gTXddAZfH48lNGkqfpbEoLPycKCeRpuLCQ/bmssVevkcww9lIBp+PkZKYMU7ElbCqCHfY1gcIC1IdkaDCrv2L2tJlawe9ZtCgpg8idOugFWIb4vXfY2H78TKKvrlgcDsIg/oeMFxuVHZOr+3a+ttuTA5qdpslmmfVz7IlkP89N7J/OBUktv4ZKTCg4E9NgzDX/ZxFldjqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GP75l9qafG47ivXZzVciVQ366Yk/8fjw3m0ueyYr1Y=;
 b=ILmzGRm7oHo7XgX2mTm4Pm096Lix0QMHX5YR0cs5CNGunGdP1TKS+aKImSJj64TR6N3VwueYqXdqtgCcKP/dgSeEv71qdj3jSxWsRRU6mch+qpaofbKebVtGC03pmTowd36t6SxM7UGI1JwlDzTmmYN8BAROdkXn82yLIHmh5FUPL+zeur6h32csF4ZgA/Lrznrdezz9osLVr5LJ5viCS269E6pDNDmeH+C5t3b5xm4D68L8Vx348fkVomfJKCc/vcdTDYvne/0xtT4/+1+h9J8r7XD9ISxlg57Y/YTXMZB7LoK19+/JwHAHhYgWLVGzQItFr8qY7GAl7SxjHnBRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GP75l9qafG47ivXZzVciVQ366Yk/8fjw3m0ueyYr1Y=;
 b=jip/2tt2M2myc2hKAbr9FcmJGMbBFg6w0tCaT7w/xZm/ioH++Cxv42+Rif3qyM1MI/XOc83EAojqQTDzQjMPIRqHxhnxv1jAc50vnnzKgSQv7sZse4a2kIGAvMCGnE4oezVGGDX9taW2R07IjXb+OgVSDxIZ6dLBicDMCy57l8doKNqc3GLnnanGW66l/KFz3WumZ5qm/s1apEmR5CUKXGP4SkjI06yD07/PdWB19L8AQzdv2+V5qFaIXExo9J43t6Cn5uIzulpsnx7zMk8X8kqaltPupwImyE/Ettfd4O1eNzVRPmxatZizmkt4E+XGMjWQZFX7Y/z1MbsaCKod6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:11 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:11 +0000
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
Subject: [PATCH v3 03/13] gpu: nova-core: gsp: Create wpr metadata
Date: Tue, 30 Sep 2025 23:16:36 +1000
Message-ID: <20250930131648.411720-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0193.ausprd01.prod.outlook.com
 (2603:10c6:10:16::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fd813d-855c-469e-5aed-08de0023aa22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KFU5pJuRrnGrndD4B0QDiiCXV2GW3oaSgy0L3qNpwmnzEAb3BBSsx7iyJ4D/?=
 =?us-ascii?Q?detjp1tCGIefyxWGSIId6pZjZq9tW0AHx+DzJiXBQanKZcmf8MY2GtURQ3tD?=
 =?us-ascii?Q?pieeu3rXCQZ51nFqwh1R/GeSdfDQzmTgaFXFiz9roXsfeLcuFTb3CZzEoWgW?=
 =?us-ascii?Q?6bVAFyY+7vnVPrgL8haa3QR0BavqH6SeqmF1gu6LPU6ZE7lEDs/Gk+inVe5Y?=
 =?us-ascii?Q?bK4MtUYq8a/c39KuCPSYQdq9jFOTpDwBO2ru1usUGHULJiPTHx9jsChGOhiB?=
 =?us-ascii?Q?Os41IQNq66alVipansW9rvpbvx/twQlOzaElgozfrJ4SeZVBIMqhh23UOuwd?=
 =?us-ascii?Q?HtjQIFTQRaJ/iLF40rs+BlDj0dU6TKb5tTaR1JqjuF1Q3h94xPD1PRlKS25X?=
 =?us-ascii?Q?Jedff8gpB4loE5N61GXRdWhRCa/Lm/sUJIMH/QBRgxmieuyMY8yGEpetu+tE?=
 =?us-ascii?Q?j3ngM6OrMrYtaY+pxGUDcR2l9++XIdh5PQ0QqIZTa1uAgIoVc4pAAcM4ND+n?=
 =?us-ascii?Q?J/fzMItIhYQb3Mo/kBeKbp9U+Ate/s9Ywbdew+/+RqOjk+pbJmi4C/FKlt8A?=
 =?us-ascii?Q?MhE5fKQe7+yY3EZclVBrbjzVlcqzL/kxIzZeOwlNOvcpsdjEtsJTaSqkD6Le?=
 =?us-ascii?Q?VPw65REIP7zXIdSY2hs0mKSW7YQ8nLVGsoEEzqP1QL/gkR2/v70AuIxgqq5+?=
 =?us-ascii?Q?ERFcUNTJDbz2UIxyMlr/mVJtsZSZU/Y4aDCIuY07zKmn57lKI40nKMSElkN3?=
 =?us-ascii?Q?tN33PmQE2+yWBydaIqWm0fNT4RZbuARFg9PRAAw3eXrrJJHmVFp/s4tf0dEH?=
 =?us-ascii?Q?qiCpzrknrEuGN//VEvfnT5srV/vq6pEJjo6RCCX6CxikoKBWVgpDsxDixOkA?=
 =?us-ascii?Q?kNcmjmoTB1mgrShbvKL1TfPmW066k8wsQUaivs+cLVvD3AAXTd2F6dFAhWvH?=
 =?us-ascii?Q?/gcaJLOgXGML2XE5ID1x3E2lvOAWP9xM9iiiiis9mBGdOBPXxO0Qx/Pu2uSg?=
 =?us-ascii?Q?9RLwVQl2KohpE5GdZwfUokS9QZtZPeTQUbaGbBFFg2FH6cr/PMsSx7mb8KW5?=
 =?us-ascii?Q?cUja3PPO+fNuuNVuWFJAM2JYgznuJKjr1+F/xupqbrIU2s4Z4ApwZOjdCDEQ?=
 =?us-ascii?Q?KluBDQK1Hlm/IpvFQ0SqmixOZgklLBLvtVjOLNJ9IGkxN/Lsofa9hmf8Wdy7?=
 =?us-ascii?Q?+zZSEGJXS6BTWjGaYr63F2aKEHU8OMI+DcXlC/zAYjDx7eR93xa8b2OGl9pU?=
 =?us-ascii?Q?6OyybOko8B2mPW3sBE0UTIFNKSQqUXKAJ/p2f7sAxHGlA0zC1vdXUnEsarJm?=
 =?us-ascii?Q?ZwLrR7NSsRktWK+XifkGKy1eI4h3f29v1Y7qwmiNTSLVhwfZf/6Bxl4oGkHm?=
 =?us-ascii?Q?bNZ8DmDrOq3HC61eD58DaRWNB+iefTQaZ8Xf9aQGGTyRV5RUoQUAx1GGkJE4?=
 =?us-ascii?Q?UtYTW8vLWU91FJc9DllwVaHITiuxN6Io?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TP2cF+TVnXr7ASXHrekxIHO3Qy6tggG5pW4WYdGtv0sPMCUqYneZbX2BkY2P?=
 =?us-ascii?Q?wY1rG/RrAFk5qAMlylW4mI5S28fJ2wPgWQxs5wY6IH9tPG0rmiVnhRbjS0om?=
 =?us-ascii?Q?gsLN4mBBqa3ddYz8n/Hm7V1LxRWgfHmlxbpPkO2G86n/NCe9jXSJUMAw96jP?=
 =?us-ascii?Q?RuU/wbnsJixOd2Su1f807/qIHIHzO4Gb6tvCgHyum/JRVlq2yRIIoez/jHW/?=
 =?us-ascii?Q?DKpnmCyvCFg1Zeaj8s/k/NpKpiZoHWi4XKyGhiraXMb+H+rpKen7eAYt25Zn?=
 =?us-ascii?Q?5SSUrFP2h9YBB/a3cc1slc3IsE11fFHNF37EZsC4mae7UAlNh7jllP4DkbV7?=
 =?us-ascii?Q?G9Z5mk3Cz7cNpsp6SvIE/IcTm4gS9bUW86Fk7AG3MPZrkwu+AlM6Nv/0oqZ+?=
 =?us-ascii?Q?GjH6aXoAXWgg35sAqsVjw0y1WASeWVmexrwNXdL2818/gARkm0OPwdH6GaKD?=
 =?us-ascii?Q?49l8QtZVdah2Z/kqWv/iNNRpGGKJUzpx8VFcualT5RHxcjI0+It+Md8/RyiU?=
 =?us-ascii?Q?47ra/LpXId7rLbqk1QCkJfyOlUnuH0fDKAwZZ2MUxVHa3DAaeD7nNeOZEyRz?=
 =?us-ascii?Q?GfdstUVsi6UedH9id7BWTBDFK69U1e9ve6k7hBi4ke1sllQh+w4ACjaM+507?=
 =?us-ascii?Q?WnVY9WO7Z8QcVBtGI+FktXu5TlhRmT07m4JutcQX8lAKa/BddOqb/tR35sHY?=
 =?us-ascii?Q?uwfa9YIxGuNn+BPwt2k0T2kBIxEfuvsRlUuYeGs3zb974y2bFjbAudmTcJGO?=
 =?us-ascii?Q?UQJUiB1Y1Qxey+OkKFAVOrG32tgO4AUEivQxWTovObmMAmLFJr7NhSZoKhhk?=
 =?us-ascii?Q?bYcRTcRklI2QzUky8A0ovDPI186mdxYXnU4k8C4AfJHYUh5M6yBp9Pqf8UdN?=
 =?us-ascii?Q?a/jxfOtK/OglhDSv5hn4nVUSDJK7LKLYtapaLl2u5Rf+fzftUpn5OswtN+Qe?=
 =?us-ascii?Q?m9kcjLyxcVKj3LD1FTDsJkStfSYWLCSzG0c//LGG3k/j1r2qM57uoP0gAYZa?=
 =?us-ascii?Q?shQasq4GVB0UbnwLwOFDep6ymNveedVK/GXDnCzW08ti5yiefrVt8Xs2XnCx?=
 =?us-ascii?Q?iphKgl81WBuSqZr6O6F8zyNcjZszohMHSTm1bl46IxA+6Woaqtc4VHGkggwm?=
 =?us-ascii?Q?Tb4qRQ0Jk8bNFYVKuTJilM7Jm/isxV1/zOhgdj4Acj/MFvLQekDIYm2dVRzx?=
 =?us-ascii?Q?ml1+omHflFuXRhY9KGzqrKvtTTec1mM23FSgMlJ7WEdC++yZfteF1jiEBgOP?=
 =?us-ascii?Q?9IOcwhssOI+vgHleBB5WT56RqPOFSAVcvj7KreJuWx4kHUGHQPMqVWMpO8ga?=
 =?us-ascii?Q?IJmcn2jrMc7CAUfQzul0trkVwXqqUOSX6ONDj66jjxtSgvW98cWAF0Z+D8Ho?=
 =?us-ascii?Q?h92yamg0udNB2wWjGw94Hv6PRQbVOX9ZA2kKJXQQSgDO0124fwNiHlI2T2sn?=
 =?us-ascii?Q?ApV+dHezjYXcQ5G+8Q1lPM5oCSeohc5e6pf0auenOeGVNg52qEZNKdXhuM2K?=
 =?us-ascii?Q?NLGzZasI2KvlxWO7j96TvP6lzM22aP0OPZR0L/9R+1bOZ9vI3JPmZ1ZPQxTm?=
 =?us-ascii?Q?3FrmGiwxFpHiLMckW9z15qu6Ol8QyPBIzwhf1V58?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fd813d-855c-469e-5aed-08de0023aa22
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:11.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJtuTcrAX705pbnWBhNnkr+Zm3SDxz190Yiu8QHcfhz8tu0r9GZptIf9Nh9FpNhOsi8M1hOPx7odDSLwd1ebOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

Changes for v3:
 - Don't re-export WPR constants (thanks Alex)

Changes for v2:
 - Rebased on Alex's latest version
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gsp.rs                  |  1 +
 drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 57 ++++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 69 insertions(+), 8 deletions(-)

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
index 91aa9ce17c57..537a226f98d0 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -14,6 +14,7 @@
 use kernel::ptr::Alignment;
 use kernel::transmute::AsBytes;
 
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
index dd1e7fc85d85..68a7059bc965 100644
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
@@ -102,6 +104,57 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
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
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
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

