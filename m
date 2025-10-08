Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD4FBC30FE
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426710E735;
	Wed,  8 Oct 2025 00:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SetMIuje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013005.outbound.protection.outlook.com
 [40.93.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DAA10E733;
 Wed,  8 Oct 2025 00:14:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb6+DyuAB57FKt8jFy5qgpU5jSYKAJT1i3ZuMdKidNB4RpcI0vdYtMI5iN5xc/KyPqADGTQoiBMp4L5bkUF9Gd1OKa6GHZ5rAYa+Pis6Mihsyr9V6M4d+1gfMisQRyaon6vEtQfyxwWp2U5jm1RdAPMufzlyKO72YkkoZ29EBoY0jQf39c0mTwcZo2rY+gzTxCKPHfo/QBk4skw9siSKkIeo+47B1uLvyAzjMVYcUuMSKa/wW6GjQPwoPxMv/gVgHx/w0J1aos19r/fdVg8ooEM0ZL8wA6ootByJpg77MEcAlenzKMuJ3jIrDBDC6BgMFPUsCa1ArtklkfRc+IJ1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHaatapRNvMbAXgzB6/M6wcUhgrt3jsXdoWldNwUI54=;
 b=mJjTbrLWqDyawHfhPOMJ76PCvyfU3fqzMoRuethhZuRcp2OSO8j3q2abxn7OobddAylE3cuCej/Z61wgbex4P1WlVKGQQ7xOVBtp8l8goD74CuRnhyrXcs0kqQY8N3cuMP953JWfssvZ+KCMY4P51i6tC4dAr/T8pF/3uo4ftOjnqDAuyQBd7jDcKOuNzYCch/X+MsWx87Oj16P9Qpr46LYI4Sy+biBMODUsIYmmZ8wm/Eb7zVlOJlcZz/CjPTeZ7gN8rkYkBuyUZaMIu2xzuXmtcwcLgee4wgyfH27hM4YUAfLF5ES5YSkIJaQwgEuxMYeq7hQceuqzn8OSkJmihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHaatapRNvMbAXgzB6/M6wcUhgrt3jsXdoWldNwUI54=;
 b=SetMIujeFKaqCH5gEO39vZ01354XxDSmMihCs7z8mTdQsJjmSPtXBaAs8KC65n7elC3PIpyrIxy+mq5laAwmoXWVZpTk8B33jewpE15McWPm7r1nuNGRJRkSFEeNhAWG9DRI1tNEKvAsE8fs+yI5iFllkIEv27UnG1uHSR0zkxOqbE5qQj2514tF9Rb+BlL8Ki2z3INviOcizqBLRimTAhiyDogxmJeKuwXqcjhZZP/GYMNKvuJjUScFUmrjQS2SK/GVtAgO86ynknVv6BGZGckNVFWg0Om3h0W8wXMWaOaz9fUSFtTLzE4T3pw3tdt2Zhng6MyqHwiw7RMapHKdqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:14:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:14:10 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v4 13/13] nova-core: gsp: Boot GSP
Date: Wed,  8 Oct 2025 11:12:52 +1100
Message-ID: <20251008001253.437911-14-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: cf05ad43-01b3-49e0-4a36-08de05ff9a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueRvtxEFWjhoSMCmhWoqsfTcCGCf+KOb/1fuECMVlTUqdJR6/0XQgk69f3zw?=
 =?us-ascii?Q?reFuovN6eqQBZqGenfEqSz7ACH6+iDb6yrDY208bhHZzUb5PuAppIJz3dK+J?=
 =?us-ascii?Q?Ke8crdODsXIIs6aXuVcZuPdrhoLX1N+Dax/hV2KtPSenAJJQ7T+I1XpY4NG5?=
 =?us-ascii?Q?gViVfTPH3X/ITRIony4g1EwRlOeHfzJOt/w0y8bcJgztADvbby9TVY0x6pP8?=
 =?us-ascii?Q?ct/0nWpuqAGGsjA9R31tajfcdvCblnhHY00ggLcz0TGBD5u5tB9696pcpn6Z?=
 =?us-ascii?Q?IE+4x18qJGsjIA5lQdz4g0dFcX6FVk0beaqAdq8RsPw8XKgTglBHXGtlfHTm?=
 =?us-ascii?Q?CIKdEtVPx3Vf5X4TS/vvVa2HFoUfY5Y8C0YZ2jiayoueosPVFEVbuaextz76?=
 =?us-ascii?Q?YfLWq/OKBJZgW/JPfcW01D6jeBp75qVepI/8R9sn4gH5N+YCkDbVtnORCXy1?=
 =?us-ascii?Q?PelE5EQj8LmGCqjnrcke4i2kp5b1MI/l5mXK5PEi0sUZx7x3kRmioD0myaJj?=
 =?us-ascii?Q?jZNxnk33V3yfW0jyhQ6JAk7hF8I1C/oo8A9zvljXJaKaSp9rNkqcjTtQlyVR?=
 =?us-ascii?Q?jV4FYp2lDPv7YRLJl3bhmeYDHArYAt+GcT7oD2sXOqM2hzA3uqUDbVkxtNWb?=
 =?us-ascii?Q?/99RRumbiWJaGAGIBC5yfKPwrd1+PIZ3nHqiblpX+rMQgw+e/iU+/sWdt/Rc?=
 =?us-ascii?Q?TF07ARR6A7i2HWSUdDDjmcMwRirmhgcDbWZlzWZwR61GFPlyP9C78HszN8Nc?=
 =?us-ascii?Q?7r0NfnSFASqUwicXYi0Be+oC8WbXpERbgykKcquttvyVzW5lpIBsdWa0OEwg?=
 =?us-ascii?Q?5GOqf6Ix/YLvuFYIs/QKeB/IORoWPSNyWssoD0ZUtG3qQR5FXZfB9Dvf+pOK?=
 =?us-ascii?Q?UFiFuvg27GIxRzS6rc+aXcXPPw++dv6QJOEhvFe80Wv3gXmAI8yNDFruFnWj?=
 =?us-ascii?Q?TOkUHj+NH0CHxPq/wXQ5MPsMxKjK/+xwdUfZrhi4oy6qdlxRwAtb3BMBtc9T?=
 =?us-ascii?Q?S/+p3ZG8Ckyw8h04ujr59aKmJzg60Fuux1MAORvV2jgGKnUBflSG0d2fc+Pf?=
 =?us-ascii?Q?vDPUP5wcbVKgEh812PX8KV3Sjfy86XbSsxd0KmJYMHb/Czp94ayOoIsTTEi2?=
 =?us-ascii?Q?dbnfXiEdjuSW2Uyz5Kb6no5jHx9E8VKChoN2JBuAuGcKhONO9zqhJYNs/Bln?=
 =?us-ascii?Q?Q5pQhfA89NipWRfvzAEgVt29l5Mo9nVR8IBQ/Ct3FY7ggaYfjBV5md1sjIIs?=
 =?us-ascii?Q?rSNtTJvEn8WCU1md1Tjvw330xv9+Q5JrlIGw3wCXOl8gfrxtg2XoAOm5UkU/?=
 =?us-ascii?Q?/s5AR62jVlgcSjzuYxPypvWdhfLXiCNY57AiiZGEzAvgkO2CB6RfMDvxFIca?=
 =?us-ascii?Q?9Dz3m872sV4sU1bOAVto/T8DS1WyDS0hgKnkdnOiV5BetDjrwQsd+7EtIeCm?=
 =?us-ascii?Q?zN+lkJr2Wd8DBSS+Ze1sov6iQ1KPhHg1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/u/M3KlqKdWqkXd2DKrfw3nfP00QRX9QL9eLdjF5q6HU3dsZriECNVpkRe9V?=
 =?us-ascii?Q?q6Xls5iUEwcCoL0gRybUzLPYn8xBrwYxD6wpSEZ9byraCHzOhKgQHK/bwoC5?=
 =?us-ascii?Q?z1h2aT4TYD6ixOVYPoiUqinGXPpzD4UEXfet9o02XrFH+AdCJKOvZfxkX82k?=
 =?us-ascii?Q?fQcUO+YNJCayrhew6028YR81ZN7EEwbkRDHHNGNpt8rp+ydXNPlORua3p9Di?=
 =?us-ascii?Q?VL0zKJh1/i4QCuHs0jhEJJsOnIY0oYn705fvw3Rp09BgED7sLsNT6RlKCeWM?=
 =?us-ascii?Q?ArMEMg0Ku5+gbK4yXtRKjK5Cbr9Yudotn0OKK1n29j/jIaz5oJXwsVwKc9bS?=
 =?us-ascii?Q?ulVmXHeWZtsOnHFxHcArekkH0ifAKNxIk0HR+pC2wGQgmzc7ByM7ZNK/Nndq?=
 =?us-ascii?Q?c6rFysed26oiwLYm2r9enGhPyahH2la7owlmN1+u8//6/II++PJOqhJDrpNf?=
 =?us-ascii?Q?edRBXSDH47OFRnjB+iSFrKNzeVN7ZO9cB4eBGm1YqDIub2cRj134sPE+GL4Y?=
 =?us-ascii?Q?6f58pWJCrNrMxzw9TGAXzqj975NqAgllRjMNFEheNub0hO/mby54rAPlM008?=
 =?us-ascii?Q?Phph+UGVCLB/04GvTirEtrEANk77b9JXyfytO5TZayx1zq06hkor7UsFwmjE?=
 =?us-ascii?Q?nM8ID9jv2gOmaxKvjUM8wyFliFd4lOg4le5/bj6FUzZa90++RhQ2S5/uMGdK?=
 =?us-ascii?Q?OFNU3Cz230phFCN7HmiYYjm9hGb7Wo5Wfj9sxR/bL+a2I/QSFtafLoKetOGg?=
 =?us-ascii?Q?UE+R+i2CVAK/YEOx6rDh2zhO5phA/BBFqGBjFPt0D0VeeEc3eshkkB/zFjWH?=
 =?us-ascii?Q?v2ptQxM5WZzrIhq/klzMWXim5IbU9lunUqYjurlRvIeZxSS54neIYhS5dFJl?=
 =?us-ascii?Q?w1E5AUGf0N1dezRgn5wHV6UD6y4f9ri9wjnfHkkT7ZtC5Fb7UZDanAlNuI42?=
 =?us-ascii?Q?XQveFetPzl3foIszaF+kvW8Tjtp6LRk3e0Z469xSDqyWudV+cCcFgVELPmwq?=
 =?us-ascii?Q?pK77/0eo5WdR/LnnFw/0rmduUlNdprdxMDPvP6IgRQhBeUI2ZWZSpvF1F9ck?=
 =?us-ascii?Q?T8/Hi9uVDZ4F7fXbizkjWD5BsL8AEIdjuQSljyZi2pMGad2QFsxhMwbvGjrh?=
 =?us-ascii?Q?UlQ1NnD2SPXOTDmls7G/U0mjfoc5iC5oY7fVOoCs1WINn3KDWZsVk2tKoRq4?=
 =?us-ascii?Q?sXqlfzXWeCTivjYPcXHIsar8cfgOH/siiNNgoUKzVinhYnPGzqvXNhzVz64a?=
 =?us-ascii?Q?u9r65+b2zNA54oOGgAPd1j9tXhroexus1S+UwhzSOiOmaE+1+N4l+dCO1MZW?=
 =?us-ascii?Q?F1w+PveMN4sF9FuWfpUfocsNO0twl6Zo/jFnedTzMXxkibl+15xcja36ZAGR?=
 =?us-ascii?Q?DhkWofzXVItZiH0dbEMJAOEJ8nbNjAKyle5sCeFd/+ZpdGI7RMPNhgkvL8rI?=
 =?us-ascii?Q?58BJV8vv84dmpSEif+P7t3DXyyiK2dUKlnmfdnUNd1MJa3WlvJuZNJK54bm+?=
 =?us-ascii?Q?TLBahpFXBldtuEuTNchJbVZH4rCPuIAqrA/0LJ61S25w1IgHq1qM76MidIeC?=
 =?us-ascii?Q?sYllxH0IRLh3ZV7SuyRSlumP44w7xmPdMvl0BSyu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf05ad43-01b3-49e0-4a36-08de05ff9a85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:14:10.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7CPo8cTigldr2IrqkFTJ9KgDHOGu7OGc+bareTDhdRYaxxgNWkhUFTY/pI2teWjaSUu6ifpzDJzG4bUVs9Y3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Switch wait_on to read_poll_timeout

Changes for v3:
 - Fixed minor nit from John
 - Added booter load error thanks to Timur's suggestion

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp.rs            |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 63 ++++++++++++++++++++++++-
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 01869b8deb8a..3ee41aacf488 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -510,14 +510,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 76d0d36fee3e..87f2e16bc216 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -52,7 +52,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub code_offset: u32,
@@ -61,7 +60,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 9b6abb9755ba..0417da8525a8 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -35,7 +35,7 @@
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
-    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0b306313ec53..7ba7932119e9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,8 +3,10 @@
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,65 @@ pub(crate) fn boot(
         set_system_info(&mut self.cmdq, pdev, bar)?;
         build_registry(&mut self.cmdq, bar)?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
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
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
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
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version)?;
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }
-- 
2.50.1

