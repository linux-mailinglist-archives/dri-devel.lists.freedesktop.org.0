Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7798BBAD00A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967710E5AC;
	Tue, 30 Sep 2025 13:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kkAuN1g+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED6810E5A4;
 Tue, 30 Sep 2025 13:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvLhyGT68it+K9BGaIlVBG7lgcRugkPrYsTgfcKiPxj5agLAqgiepb/HUk6bEm3YhlLUAFncO5a3gfgM5JX9xuzc3sYnmE3iX/QDFhmrF4WrEMvrBO1CIycoLV/EsvjJT78cbzeJsbCp2XPF1eSSd0V1q6MwesZ/NNQUBAvAgYJy3T0R7wGKrbw/s+ts+TiDWiDWbdOs06xeADB3sz4/1gw4JSmo3CS4+SP3G6Ih9y71+zKqQOxPPpoXZMHhq51M6S5tv2JgCqOTieVLk5fh+BQulmvWQ3Y23EwiLCTMVN0+9RGDZ95mYHr+XXnmnMuQdxlDKoCCd0hV6FG7EVhAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJx/iMpT8qAQOwFuua8fVl1MCv+VVkYthUmpqEhUlNQ=;
 b=vmlWu1ZMVUeNfmbA66cj7h1G3P4elo/H7V0ocJSKshvrWPfUryd5wwG89XZjY8p2WWzpfEQgXWjnW8yZ0+r56RllPqBiVam74pkwqkjicqxZbfz6Hgoasi5XWrrrGkco1xO38J3jVfb3976iXsTdtL/s+nlpCAfAJKNcAlvcci73e9tCcsARfogrXoxjzm7YF6dBypTvinhDIh23dWjvuoCRs6YmwkzZgIkjXITKKnkLzJvExeioQ+Z+68PTu64XbQbnSUpbqLoPpidqidcpcd9z21Ze3gG1W7e2nPpH7Xcq6Y5X8yBUlzppIb3IbggZzbUOrZXnzkhSM+vShlILPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJx/iMpT8qAQOwFuua8fVl1MCv+VVkYthUmpqEhUlNQ=;
 b=kkAuN1g+7+jsYDik20fzplCnyjcj4AWJYlQA4vIINDfopgwJ8Yxt43EUENQLsVNWubsJWmG7+SFSqa31RsXmrCqZ2MNbiOrAfBtW+Hg7UUVS6E5HepUgajvLbuWl24G2ySaQ/WvIwHIWFAUVXbPZPv1mkUNO3wo2HdUnvvaeMFfEIuDq0qvmaaOEZxPBTT3h0UbhP3R4vNacrH5cvcnu+24QTCu1wHL5FnO74OXlPNd3D9+wy9o/5idmjvIg4XRx76Hx7rPusn+OGxxpPrUe7aNgSSYqUT719S5sFZ4LIjCde0kr5v8DMDQGi/0P47Hign4jtt783PEa+AFceZrj3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:06 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:06 +0000
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
Subject: [PATCH v3 02/13] gpu: nova-core: Create initial Gsp
Date: Tue, 30 Sep 2025 23:16:35 +1000
Message-ID: <20250930131648.411720-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0017.ausprd01.prod.outlook.com (2603:10c6:10::29)
 To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 298367e5-3600-496d-dce8-08de0023a702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pTQW0dI5F7JgSe66gXqiI0z56y3s1OB8YAJx1WrY3//1h8XjRpwilsTJN91K?=
 =?us-ascii?Q?aCzO73rtbeMQH9b++X6/ZxuXWmaPdQLo/4T/8DpIQXs+odgHed3R0gcCL2vo?=
 =?us-ascii?Q?sqYlzUtN9Dw1A5WP6ShHLUh9s6TSzskeYVVhfk5lQEtDO2H4tky8Oj83ZiLD?=
 =?us-ascii?Q?LSMu3g4AV0gFyl66cqWt7anRoRNtP2RbijQ0LTF/BTzkgb2OHNgFb7rOcoHR?=
 =?us-ascii?Q?Y4mCezpV8EoidzD9Zcq4IzoNwr+ERijBa1VqtPJ0rAZnlnYQ4nyIhjfWUcUm?=
 =?us-ascii?Q?B6uqFubaxebJLXa+DMaMOTBe9xt7CopTst+TYXaNfCNR0LsV1drXuBLOLnBo?=
 =?us-ascii?Q?8xkiMiW/+6iAewQnUwTUza0ud4sJRXlkq2vLpKhSWGwzfL0sXJY/GQwtJJvn?=
 =?us-ascii?Q?Fca5bWmovr5pdaY/IFiMXvP8GheWAcMuLLUOIT1WauagRPXA54+Rmhh5RixA?=
 =?us-ascii?Q?yyZYsy0sa2V/HXqeAwyhdzClnjgob9O3ovOQHqAuT2Hsjvk6VBfg9sjuiPRu?=
 =?us-ascii?Q?3oOV979LbKiuqTWHDYoxy1za/mVuItIxLjemYRWeOou/1f/ZNnpiy4ygD/fG?=
 =?us-ascii?Q?eTgYEiLLdds6hdTU1SCWv/5j/ntQqtZZEOCSXTSjmmz+q7PoRmDhcVW5fXOM?=
 =?us-ascii?Q?6gNioSH2J35voTRaJXIVBx73bF2K+nYLNu+7vmecGjxtBIjghArwHl6/rmyd?=
 =?us-ascii?Q?zh+5MKfgzksWpPfBhFNiNyZiq13h4ixlQ5nCIcTpxirLdq/wni5irl6hdYad?=
 =?us-ascii?Q?Nz3hEwfgSJxCRHUfaLj4FMspTvAaFopiW9rHaltwFTOhRES//n4IlKO3R29z?=
 =?us-ascii?Q?xQ+Gua+aUaeebpNgPIr7I5EP+LFv0kzD+aR31p15FIjxWIpb6FrCKvy/YvQH?=
 =?us-ascii?Q?TZqOiIEWlATl6mzP/L02RxB1+1fU4PM8KyIrvBzjEGzfYXgyjpCn1/MTBGb5?=
 =?us-ascii?Q?wdNUnndJMSsDYjCzGOjZD4OjEbZ/YBeMDV1fYrtZ3fuWSictyuJjKBuI/4hd?=
 =?us-ascii?Q?Akb74U1wywnY443MpFIz7dEKHTLWNNDO1UfLKayC55TPIE5g7H93O6hM+i6P?=
 =?us-ascii?Q?zjpELWjOVXCMb1TrM4fKxWhsb6F1eO0Um+IxIrjJu8YtLSlhGrCGI8v1uD6W?=
 =?us-ascii?Q?eDpXRChE2lSutOO7+XmstLSJjhsdhr7BtnJuQBRnOshTNO/ntEQc/KsgGgQd?=
 =?us-ascii?Q?lH404q3Yk0GH9pfN4rsfK6NRl6U3FSWQ3pi1Ly/Cvz+cTz/Z9JQ2Xyix6JEf?=
 =?us-ascii?Q?Wysi/hJKXK/z/2dGUP8yxg8yYq2jFhwSSIU3DrEGFANjS7YBeXYQuaK8iSCF?=
 =?us-ascii?Q?b+DHJ4unR0M+A8TbAEFmKzXnxir1VsjDderE59XPEzehDhv3FNutw6ESXsAF?=
 =?us-ascii?Q?q2E1E2z31d+F9HQK1hsO00VxYMAFrvjTBHv66YxNubXUi6UkfVJhRgLNZqmb?=
 =?us-ascii?Q?ka81xCy/ib9zCJd8V2a3mb2bkEacFO8C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sE0t5bsLluJUERZB3AR6bw/uM88UeGbJQtx53RPuCPL4D76czWGNzvKfYPA1?=
 =?us-ascii?Q?xjBasmD6WX61Gt31MC/ZWfY3oZGO8y89Nsugg0kbMfMVEcVjY3r6lM82N08J?=
 =?us-ascii?Q?NG4YhRRD/EBcTr7p5sYPHILrRDdFm0dH89FxkW7HzPD5D2ZKQrd+0Mg7aoxw?=
 =?us-ascii?Q?xYFl73Mjhzq1fUMxDUOqy8+A/UUtFbZ3MLxuaOItm+cW52jxPd2WyumVfQpI?=
 =?us-ascii?Q?XAN94Mqiw4Xt8E8dCovax5fixo2uUFChAz0vOEWU8NoBzPubh2y6eHqDPBUN?=
 =?us-ascii?Q?fwkTunRaTmO1n3WY7KhgLqQJ2GTZrREeDLqnSJp5jp1B+4Ay3uGlZYsx5Imk?=
 =?us-ascii?Q?2yAF5rNjrXUsezkj4g+Ya3UPtUJTaMk596GDMH0ZDLGcnP845IbQgddMABRj?=
 =?us-ascii?Q?CT4DJNYyLHYbud8PufWlcRMuxWBQ4xm+TaiOyfF7gUbPe1fgDV+yhVaQkdDc?=
 =?us-ascii?Q?R/VLjbZIUn69b8mQianL1FI302VijJR6bmwo+Ao9LngLlfAFXVLbNGiyAGXn?=
 =?us-ascii?Q?GEfnMqsfpOvy/2EuTkLRHD5f21TA6OqcLrPO4PAk0xnvJY2YItVYabEu+5M/?=
 =?us-ascii?Q?Pv7+h/zsNCeh89CZjvKjBOkrHCbDndMwp8XmA29jxGgM2hfERvf0ZlO5HEwB?=
 =?us-ascii?Q?4lsd09f4e+6l5NPYI6HVbffmlZg7/OS5SrVf6BaPkWf6Pjcssm0RgcQIS23F?=
 =?us-ascii?Q?y+j23UBSdGD46pU8pFjtWjWQRPGrl6kn0AzEriUJe3ijK4iNiVs6IfcOm5kh?=
 =?us-ascii?Q?7oA5XDojwIkTCcVgiHYYo1uePvB3SvaOi3DTicwIfmPt4HVPvjPjEY7hQVnd?=
 =?us-ascii?Q?KGRAcb/Q98BJTH4MVjMz7Er9zFvmmYL2nruPHazmujvk7/ueZDOTFwll6FRb?=
 =?us-ascii?Q?rkglKsUOquS1SIT9unDKQru1ODzFemHSbvA8+HCQo7Obi+19LfT1Cw6v8biD?=
 =?us-ascii?Q?1CZ9IRdNgjXLOkDNC6o0r6T70U9B9YwE8aofgriV5ANBIik2oDGR5n/IwoXj?=
 =?us-ascii?Q?vlDmFx1kbKsVi7q+CLl+wfJSxmva3SNo9R8IrO8LPRi10lWLFM6ojZC99yfW?=
 =?us-ascii?Q?38SOTBO7stV6Bm2TZ9GqtiJ6036UCTHohXSZb6j3IX8ooFYPv+wlKjltU0Mi?=
 =?us-ascii?Q?1jWfqo94Ua7xmru7UpJMyAzYt47Hlb+eAqo6HapHbEXt9AoMryfsszvu0klb?=
 =?us-ascii?Q?h6RkN0HtcEP7BWT9ZSA9VrrxYbEI4sabHgN/R5YwRgij8rFirRvlm/1QkSjP?=
 =?us-ascii?Q?QK9XuebKdZi6FkCAU+EvnCJwsP8yscLVfr0if2lFjSzIpBRSDskrE1G3WJa6?=
 =?us-ascii?Q?Pf/Sjgmz9duV2+3GlhQb+s7C92P9gnLC7PyVcgyQUBZq4EHmq+L3JvANorcF?=
 =?us-ascii?Q?ujaxCORBCAgmKECtZKAV7OlH5WQofKuV824uQS1SQme0Goc5Ro4Ze6oJdh1T?=
 =?us-ascii?Q?mwnmeSeH6ziBER+BFU/ycKxaMb1vJ+6XdfOq3h0NlZ6iTcXe5i4AMA9I1uaI?=
 =?us-ascii?Q?bHKWTLw/7VOopQ51BqZbrn7xTBN6hU57i287BXzbxcxTef3hkSusxpawf5iw?=
 =?us-ascii?Q?WjXix0vjqNEvLiYr63cgYNRUjgH5kzWuLJLQ/XXH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298367e5-3600-496d-dce8-08de0023a702
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:06.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnyI5vLD9KhrXy5ezoGZzC0tPsRIj6rX/bLi5pQrRM8LnrK5hRfoqlX8hNCbyanwDT3edpEvXg65B0WZ9I9EYA==
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

The GSP requires several areas of memory to operate. Each of these have
their own simple embedded page tables. Set these up and map them for DMA
to/from GSP using CoherentAllocation's. Return the DMA handle describing
where each of these regions are for future use when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Change for v3:
 - Clean up the PTE array creation, with much thanks to Alex for doing
   most it (please let me know if I should put you as co-developer!)

Changes for v2:
 - Renamed GspMemOjbects to Gsp as that is what they are
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gpu.rs                  |  2 +-
 drivers/gpu/nova-core/gsp.rs                  | 83 +++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs               | 39 +++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 19 +++++
 4 files changed, 134 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5da9ad726483..c939b3868271 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -221,7 +221,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 503ce8ee0420..91aa9ce17c57 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,27 +1,94 @@
 // SPDX-License-Identifier: GPL-2.0
 
 mod boot;
-
-use kernel::prelude::*;
-
 mod fw;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
+use kernel::prelude::*;
 use kernel::ptr::Alignment;
+use kernel::transmute::AsBytes;
+
+use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
+
 /// GSP runtime data.
-///
-/// This is an empty pinned placeholder for now.
 #[pin_data]
-pub(crate) struct Gsp {}
+pub(crate) struct Gsp {
+    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub loginit: CoherentAllocation<u8>,
+    pub logintr: CoherentAllocation<u8>,
+    pub logrm: CoherentAllocation<u8>,
+}
+
+#[repr(C)]
+struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
+/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
+unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
+impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
+    fn new(handle: DmaAddress) -> Self {
+        let mut ptes = [0u64; NUM_PAGES];
+        for (i, pte) in ptes.iter_mut().enumerate() {
+            *pte = handle + ((i as u64) << GSP_PAGE_SHIFT);
+        }
+
+        Self(ptes)
+    }
+}
+
+/// Creates a new `CoherentAllocation<A>` with `name` of `size` elements, and
+/// register it into the `libos` object at argument position `libos_arg_nr`.
+fn create_logbuffer_dma_object(
+    dev: &device::Device<device::Bound>,
+) -> Result<CoherentAllocation<u8>> {
+    let mut obj = CoherentAllocation::<u8>::alloc_coherent(
+        dev,
+        RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE,
+        GFP_KERNEL | __GFP_ZERO,
+    )?;
+    let ptes = PteArray::<RM_LOG_BUFFER_NUM_PAGES>::new(obj.dma_handle());
+
+    // SAFETY: `obj` has just been created and we are its sole user.
+    unsafe {
+        // Copy the self-mapping PTE at the expected location.
+        obj.as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
+            .copy_from_slice(ptes.as_bytes())
+    };
+
+    Ok(obj)
+}
 
 impl Gsp {
-    pub(crate) fn new() -> impl PinInit<Self> {
-        pin_init!(Self {})
+    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+        let dev = pdev.as_ref();
+        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
+            dev,
+            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        let loginit = create_logbuffer_dma_object(dev)?;
+        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit))?;
+        let logintr = create_logbuffer_dma_object(dev)?;
+        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr))?;
+        let logrm = create_logbuffer_dma_object(dev)?;
+        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm))?;
+
+        Ok(try_pin_init!(Self {
+            libos,
+            loginit,
+            logintr,
+            logrm,
+        }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 181baa401770..dd1e7fc85d85 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,8 +7,10 @@
 
 use core::ops::Range;
 
+use kernel::dma::CoherentAllocation;
 use kernel::ptr::Alignable;
 use kernel::sizes::SZ_1M;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::gpu::Chipset;
 use crate::gsp;
@@ -99,3 +101,40 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+
+#[repr(transparent)]
+pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
+
+impl LibosMemoryRegionInitArgument {
+    pub(crate) fn new<A: AsBytes + FromBytes>(
+        name: &'static str,
+        obj: &CoherentAllocation<A>,
+    ) -> Self {
+        /// Generates the `ID8` identifier required for some GSP objects.
+        fn id8(name: &str) -> u64 {
+            let mut bytes = [0u8; core::mem::size_of::<u64>()];
+
+            for (c, b) in name.bytes().rev().zip(&mut bytes) {
+                *b = c;
+            }
+
+            u64::from_ne_bytes(bytes)
+        }
+
+        Self(bindings::LibosMemoryRegionInitArgument {
+            id8: id8(name),
+            pa: obj.dma_handle(),
+            size: obj.size() as u64,
+            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS as u8,
+            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM as u8,
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 0407000cca22..6a14cc324391 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -124,3 +124,22 @@ fn default() -> Self {
         }
     }
 }
+pub type LibosAddress = u64_;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_NONE: LibosMemoryRegionKind = 0;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS: LibosMemoryRegionKind = 1;
+pub const LibosMemoryRegionKind_LIBOS_MEMORY_REGION_RADIX3: LibosMemoryRegionKind = 2;
+pub type LibosMemoryRegionKind = ffi::c_uint;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_NONE: LibosMemoryRegionLoc = 0;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM: LibosMemoryRegionLoc = 1;
+pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
+pub type LibosMemoryRegionLoc = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct LibosMemoryRegionInitArgument {
+    pub id8: LibosAddress,
+    pub pa: LibosAddress,
+    pub size: LibosAddress,
+    pub kind: u8_,
+    pub loc: u8_,
+    pub __bindgen_padding_0: [u8; 6usize],
+}
-- 
2.50.1

