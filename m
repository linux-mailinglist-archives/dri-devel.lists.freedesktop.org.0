Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BDBD19EF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D9F10E3B3;
	Mon, 13 Oct 2025 06:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N3ebDcin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542110E3B2;
 Mon, 13 Oct 2025 06:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnCTXpjdmBQNmxpiMaCdQMDOvvxIQyYR3vEUCVBTCuRjFYPlxTMT8rRRbh8RYroWvYXmsKScBS+PK3SFsBvhcIpQJa7Tb6sG4R9kM7Tciygo/EI2igSNNCnjVLxetgIuFZGos+TasSWFnRUe8kM6bt1ASN84Nt6vIR9w3bPRuzNixlkdVfpKtMAwhPVHur29BBN8KgOBWpwWevHaJwzwM3SlFDpN9XrJDqHpGVL2f9E7GqqcED0ksBQHCIbuRigYMO5hd8/AuN6H7el1J0eBPaj0vgpTwRbqhTwaYOf5bDnt6hYRcZHHbKcq89tN2mSL48NUvKirM4Xms05aNJrH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMxgtfYnxrkPfZg40RE6PlAH8crcr9IG1xdHRFWJe8k=;
 b=F2S0beJlnNW0x9avTBFxm/qaeHRC6EnmE7rqywiybXEmQMbIH7mPG5Dg/fhlocVFdBV910aQrbpnQ+Na56Xkejvt1shdizkIWDiaR8dXH3pQGdU7NIQj/+6z/MTZ43N8YPvAbXO71l9+1Jem7KE6ZQLhkoEyWSmoGeLKvjt3ywnCxzd3tRot0ti2ObkUhUAsIHU6FOQPnc4QVzmY87rgW+g9O2vov02/fzrjF+WPCxX9hAnPTpVa0ikxGgbSPqkFM+GPLEooScLuRZ27VY6UCki/wkKtEltBn9j2Wr2i56BWGBQNZ7RZoQcvDLZAmDC88vOd8+lU992nF1PmWspxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMxgtfYnxrkPfZg40RE6PlAH8crcr9IG1xdHRFWJe8k=;
 b=N3ebDcini7DVUcxwAVD1l7IurkkpSqX3DGDXSgsiu2KOE9Eu/C74IFt8xUL6OhiqmHpgX03ek7KHNkBfojEGSyzFkz3FuCZGYUpkhJqK4IQF/2belWdCRlnKfPbWnhchpV4CCWvg54OzBqhntQIPBfobWvBbXY2rPGl8py5CUIySOxK7lmD+IdfcA/URc7RSLhOxD3erH8BE6gJx5nK0DqRco3ng//usm5w7e8NI7Vl3rr2oYWOMcKAiYiu5zn1BVuID/d5Zl0Z+z1co8J7v9b/ZDb9WI/rslya5IwYJL0Se77NwlbXynwj2CEI1o1hOG1Z3jfvTLj2hYP4YjycZdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:01 +0000
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
Subject: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Date: Mon, 13 Oct 2025 17:20:29 +1100
Message-ID: <20251013062041.1639529-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0084.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:201::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: eb89df28-5d35-427e-1aac-08de0a20ae85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RNAblgds79I7yf7EwRmM+FlEnvJUnFbKrMU+LhMkJHlWferQ2boJCatU7tv1?=
 =?us-ascii?Q?LSUXFmTFPzPaezu22qh2KhJK8j6d/XXj/HbHm7ydtzf7QVWXamVLRY9dc3i8?=
 =?us-ascii?Q?+bJ9I0F9HNmH5/B4j4/2ZSwi74ShkNrlMhUrwnEr8dcJ5vkmt/04Cwo25KHr?=
 =?us-ascii?Q?ZDuzOp6IGRnm+WSGODUR956ToFSbGM3do7AG3FvY24FtUYLJMphTtfp4Ti8/?=
 =?us-ascii?Q?fTxCHaISVvT0V2u/UwsCLXwBuIVZeuLtaHLhOTfks4M3I0iHgx9VHnmphnK7?=
 =?us-ascii?Q?ToiONBjjnTFW/gyMxeQgEfgGDnlK+4ij1gAlN92UCQ/a+0y2h6BZ8WFyq38F?=
 =?us-ascii?Q?YBcptwaOEG36OMHrGlAZrHYu+2xPzaaqKRVmHf/tzOZoYlkiWQir9nQGFtb5?=
 =?us-ascii?Q?WzGgmHjczIm8kSUkmS2Ig7lmP0pcTJGq4aGZqrzBCldYr3WxvJh260XBqmoV?=
 =?us-ascii?Q?kmsNgZTQjwzYsMTAlp1Y9xCZ6AuEPjHOd68hlFemqtKxhcBKlVLQ4zcxPFEW?=
 =?us-ascii?Q?Nt0febkbaTka6MYrQoIuVv7uZTtpMUkGa5JLdDJU/aSkZpIuZJPT5WLl2q8Y?=
 =?us-ascii?Q?50Ap+Qt7OAdykERtM5cb+DingiFMxV7ymqS7If2T3VRtGpST+Dg6wpHMhQaR?=
 =?us-ascii?Q?Tjk89p9OFCEBj0FemWHxMySyoXs+Wt7YES+Goxj+6EhRRP+enXYpeOkO/YmD?=
 =?us-ascii?Q?Hq2qaqtHR/VsSZVgKygMewpnIqOVO4G6eemLcHucPgolIvd3gRMMyX2SDW5N?=
 =?us-ascii?Q?lG0QBohLae4Pa+P0DPW86TJ1K1dU7l5dRwaqWXwSAC1Vi3PIEmuoK0VDdgJ4?=
 =?us-ascii?Q?i/+SI44x+Y21+1gSozhmE1yLzszy9MphB4UWP6ak0X7eU6NLdb6g+O7NVCpW?=
 =?us-ascii?Q?i0KCmsA4SNaqvHobEiVVjroVCfekpA9cPRs2Et8RJc49DDrE+kRbZ5uDfG1W?=
 =?us-ascii?Q?+dfMjWpXE59xuLdkAjusA1ieT5AjXb7UpC7/Cb3TPwAxyNoh3MdNl1cTuXuN?=
 =?us-ascii?Q?NuRciPuGfqbngqCWfexJFGR2t3boJIlS2UXD4tJZHlJ1IaFC6vtjuBZ0JyfL?=
 =?us-ascii?Q?NJvtxclwX9lMEPLl7Mnl3YgWfHSwjdMPfSWywP0+9FpYEAA/Wqp73OqItSWj?=
 =?us-ascii?Q?EKEicsMqgMvkpX4y7teLnuUJowRlb9KYfdojcFmosHRr2z8X3X3pOwEc1jjQ?=
 =?us-ascii?Q?41Usuuoh4tC7gMYCmlSsE6KuRWVCa7I2iEYXFNHU/nqlvbp1vRqRL+8+GoBn?=
 =?us-ascii?Q?46EBQ0547RbKg1xs/UafOFnE+FtmAnz3zg7PAuuXwSmNw4lTU2c9kXP9Xrye?=
 =?us-ascii?Q?s3dxQj9wme4d/grR7NBizQTh56uOYaObxJkKe4440Bq+ZhUv5aOvP0Fiwxo6?=
 =?us-ascii?Q?xkj/+Ape3avkcM+CtFp55N/YRhcP61SNCi2P7tlM4+KB0sO4lU2icLNhtzaT?=
 =?us-ascii?Q?nv2QmI/N6nReWEc0YGDRbviv9wcSZIZ9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XddllS7sUpE4YbxJl01JuIbOOHIeOra9qBOO7D+YHmROBfHBsmnbWYrig/JI?=
 =?us-ascii?Q?phGbtcPCkRV6NO5HkCTyYqk6mPTxjH/FqcKpbXfRVesy0cHB8DRYNRx+zYsC?=
 =?us-ascii?Q?CfxZFuNxDlSkjr4wCYOH3MRtWiD2uoewl6nOVjXTXlt3GfgAEk6XmyhJowOE?=
 =?us-ascii?Q?YiOeQkZ4MnJcwAWN+Q3pU1u/wnwTAeFKvPeIZ7nrYjLV7IqujYqYEJb5ovgs?=
 =?us-ascii?Q?ajE6UE6JxakFMgJoK5DGCw3//P2dQuQ6PWnMZ5IHP5MUhGqAUBnUU1OsVYYn?=
 =?us-ascii?Q?yKroL6W1zBeu7mS88uxTK7XigSW0ag3ls48jEQGkfcsHhDem1cYajqNINpXc?=
 =?us-ascii?Q?NA59tTwYt/33JS+B51wSoTMQ6QD9hENSN5zhXSbxQ48Q7W2OnAnAAIb1YJ6V?=
 =?us-ascii?Q?KtngKyMl6+fASvWIInJL6cI3B75lCH8Gmd6spU85zfscKHvMbhQ+lCkoOrZE?=
 =?us-ascii?Q?A8AJkWoP1/PEQ+k1Gv0cquGcp0R8J2DJMg6Z6vZhr32aolEXMLKBj0a3uL16?=
 =?us-ascii?Q?so1wngVeNPvJqOjhINIW18g99R4+xVFnMLfq93VrkfsanQqlLakZvRz65nUx?=
 =?us-ascii?Q?V0YaHTNjKqCgSFCVnyPNQ07MZ4UnJ5eikkwMwAowWPfrNzfGGPVwjKDw2Lym?=
 =?us-ascii?Q?oWiSW8eWskN09i/uwRGUomSyhji/CId0aNuw+tu16WoOAL9k/Iy8cCI9kSN/?=
 =?us-ascii?Q?qCejELCfurD1O3atc7sAvR1oWFJUDNRE1wNF9bietzMBEUH4a702tF1O70lg?=
 =?us-ascii?Q?YLOhWjzSSVoYQJW/i+d+Lu4M12pZdBdn0yw6ZprhpF0WKJ3Y5gydgcETYWhf?=
 =?us-ascii?Q?N/6PdnsY4TqWDVf8HfIBtGF62pIAoXZW3WiRZtqvzaTORIFmEvesPCRAPIbQ?=
 =?us-ascii?Q?JQn0gBO3NKkXMHcG6jwD9zUyqaI1JMaNw/EXLYfe7R7mgd34YWR/tYiSnTrM?=
 =?us-ascii?Q?4o4rctVxJIDuDWzoIFzwTIq+TVMmPmXyVKApSAWOTXQM8LE7Q/944AxnfgMU?=
 =?us-ascii?Q?5z6iy1vkqyUnGEvbWfWdGw+vRZ9p0g+SJBUXxt/gs/lPveS9QYfB0HbV8NLI?=
 =?us-ascii?Q?B9ohBmDjTXa2bri0AeZY2uIWu5HvYCPocR/LqtlgA0Ois3VyLGLupVSFww1N?=
 =?us-ascii?Q?BRYBZ5sevqQ9bATcC4mw8fqdIL9JVwIxcm9H74w5AScSFDoRnkUMRicB+S3l?=
 =?us-ascii?Q?Fd1OXXgiauy1vRwj5ce9b2M/g0On1kN+9Q6eyWkgSNpo8/T3fp44/p0pcswv?=
 =?us-ascii?Q?7AEJ0XNG3UGhFedThU37NTGNWxii/PMthoAxAequc2hNKd69r+OkFBPB2OQA?=
 =?us-ascii?Q?TvAXnpTyS0sEja9YlgV+UnjjVB+5u+TGJsC+bwtZsEpuWRtlWhho+Ri+mhhf?=
 =?us-ascii?Q?xqOUk7iz2RBChxnaC/Ts7gb0CRpmxTGevaUgzKmEKOPXcE5SHQAvmMxDTCeZ?=
 =?us-ascii?Q?DVg1C9MHzSIoaaeG6UPRLriv104TwIzRNuCQfvMnK+i0Wxeaj4rt9j2qJOfQ?=
 =?us-ascii?Q?NcjWRqMTWoqzKHJMdR+b24fC0Z50sd7IwiHlZZJSupCoJ/xXwrVLHpV9EHwF?=
 =?us-ascii?Q?Sce0Np5nukomyFDKPMfzTq4VByi60gVk5IPpqp1Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb89df28-5d35-427e-1aac-08de0a20ae85
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:01.8148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF7Xy28W7qhj3NHbEWdakjd6BcFqUzb6IIOicLzU3vA1nFVaAzVPCJSAGKuV7xE3GYuv5ZlNV62m+N29ODpgbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

Changes for v5:
 - Make member visibility match the struct visibility (thanks Danilo)

Changes for v3:
 - Don't re-export WPR constants (thanks Alex)

Changes for v2:
 - Rebased on Alex's latest version
---
 drivers/gpu/nova-core/fb.rs                   |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
 drivers/gpu/nova-core/gsp.rs                  |  2 +
 drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs               | 55 ++++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 7 files changed, 69 insertions(+), 7 deletions(-)

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
index 3a1cf0607de7..c9ad912a3150 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub bootloader: RiscvFirmware,
 }
@@ -216,7 +216,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 04f1283abb72..115b5f5355a1 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -55,11 +55,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub(crate) code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub(crate) data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub(crate) manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f1727173bd42..554eb1a34ee7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -10,6 +10,8 @@
 use kernel::prelude::*;
 use kernel::transmute::AsBytes;
 
+use crate::fb::FbLayout;
+
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
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
index c3bececc29cd..1cc992ca492c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,10 +10,12 @@
 use kernel::dma::CoherentAllocation;
 use kernel::prelude::*;
 use kernel::ptr::{Alignable, Alignment};
-use kernel::sizes::SZ_1M;
+use kernel::sizes::{SZ_128K, SZ_1M};
 use kernel::transmute::{AsBytes, FromBytes};
 
+use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::FbLayout;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -105,6 +107,57 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
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
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
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

