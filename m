Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72101BC30B5
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB65410E71D;
	Wed,  8 Oct 2025 00:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iOZgQem8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011051.outbound.protection.outlook.com
 [40.93.194.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF73A10E71A;
 Wed,  8 Oct 2025 00:13:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APN6cJB+185z8DhL0/Q88a1HNL50o7eaNE6rOLCeLeLkV0paYlKZHottlNeTMqEWItPlqWHwpCTX429BWbzctKqXp7mTv7kkAzuxI66LJ8UIp4glW4GN56QfehpopOREg+MXWmm9XWVfJLV4UqevHyJS0RmS+xj2APgHhctkQlBDphCl8gM5EFF4MwO20OBH3TY0zt4puB/fVgrJDoInFopLAmwK4B/QfQhpI9Fl5hkvsoNQE22j/WJMBScaO/tiyU4rFXd4YpB0ua1+DlB2IOTXtF6yc5W5NyaA1bYhg80F5mGMP6yrg9h9gZ5C1zoidRMvHzRupFR1EbgErOi1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dko/wWidHD8joPGknBqsA5MAfDvAD/eyVJhKCm5iqQ0=;
 b=Vj1V33t66O/QKVpVpVc1O1+mMt4paDqJQr3uNWUYLaDXs9U8Im9Hml8A1lSS/MwKdhdRW+dNDHYs5cMgjroqgPpvG6rwriKvKyKU+g8USgbSj5p7MS+igPSrVQ4qZTHTpwZqvav1ASozVMZe7DPsBUkC64go9v23NrC+DaDAcLkSDzHU+FXVvynTabZlB3VYv50dQ+voFgAhqoHK07OLFIxxN6qahpwhUwTWa1cEEU9Moe2QbC5JvN2iIAeU309BDc5p+O/e37YmFG9RGn5rPKaDLiA4GgwOv6wmEEuND6ViECpkZnJCuMiFRZCVi9Li4AnqXEpABnTZtcGtk3KH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dko/wWidHD8joPGknBqsA5MAfDvAD/eyVJhKCm5iqQ0=;
 b=iOZgQem8Z55ds5ANvUzKqNwkFI6dGKAW2I99e3ReC23l7vArt+oA9hvulc8HlKx2Y/yPbh/l69GzJcH+3Gz4iHKQmMDflmbbKFzxae1IHPbtPMjtWWOfc1qsTWiJsZLsn33qvHTM5SMEQ+XdUG3ADyCk+iErcYcbG3V7h8Fp7vM+8bVgwjo6JWQUfU+3hzyOonCpjh+fRomX6D9gTsd89X9GdtGPkVaN2Fx6BhGnac4pkR4wmBPVmXbxvkT9JJaWaoOca7MYcvkKvqIZioF4SluddjneFZrZg76UcN6Zh17tl9q54YNKcTaSANUvQSbCqZXCwWud5SbbgrvWqkRwqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:10 +0000
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
Subject: [PATCH v4 02/13] gpu: nova-core: Create initial Gsp
Date: Wed,  8 Oct 2025 11:12:41 +1100
Message-ID: <20251008001253.437911-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0093.ausprd01.prod.outlook.com
 (2603:10c6:10:207::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7a2207-5916-45f9-f69a-08de05ff7692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZldX3fcFo3FV0xOknPQpeqmlXRnfwZtfjDqDBEzvFa3nzM5V+516HuBU3cC?=
 =?us-ascii?Q?mE6kNLI8WQAI1D8HAgGEAMQf14f5dKX2Cw0pv3UaRJ8eTOJ/bPoq3s2yw/AB?=
 =?us-ascii?Q?WsOguzCr6XTZNtM0Gt4Q5VMx1+So1F+F9AS/kclZ5rV4nDUC8M96OAHUkJwO?=
 =?us-ascii?Q?75pbciIp7k0TdyNlSDEHM4TSAJSltX/p7kYU+vPVhfvuEE3EYFbzQ13//kSf?=
 =?us-ascii?Q?OWF4qfyTm+N10450Vy28fIRjCS1M1wCHcIvgdQmIk8mdqL54i0HRfzS74jH/?=
 =?us-ascii?Q?CX9SxclTnTzP41jERznb5qlOg4sb6KKQsmE2TWCgPdL5iJGXfLuH+Mb0MMlQ?=
 =?us-ascii?Q?5Y+jChei6vsNMOyfo31rjzeJ6LOsZYWSxXieliEPysLbuMgjQl491hCYFRVM?=
 =?us-ascii?Q?Zsl7+gEFsSyp8jIyMGnFZTcjYViMtqYB2jCDBQ9DaiMcEpmv8ile0iz3yHIy?=
 =?us-ascii?Q?Hu+PQzetPxKgl9Ho2umtPhjI96Gb6YPTZoTja6s8Rx0XFsKgP+1SOwmsYG+7?=
 =?us-ascii?Q?Y/GM5Y64SHILppbHkaeacnYJ8psfoGqjA3v/FTtgmcJyWiX/0H0DoO1l8fJL?=
 =?us-ascii?Q?hwmgijO4VIEt0UznAsEJjeCGeumMpzPEx2Kg4T9G6k8d0pJDY+XS+vzM2LEQ?=
 =?us-ascii?Q?8ZJzlVjogFMJGbz/UGdVbOSO4Zws+0dIG1oue/9jel46G4eclFioYhJlTR55?=
 =?us-ascii?Q?t6w7+Ok8zRLpdc0minv6oq7j73S6EqVGzANXfs6V59e7bXCwsIXbrfaTK5Bk?=
 =?us-ascii?Q?L7r8ua7pH6boZRSkNhKMBJL2Yltc9QdjE8oXEFr8OfkMXxBrxBbmwo6H1kxq?=
 =?us-ascii?Q?3aMy5YzluUTgrNhb4TTTwLxmkfeQd1XEI2S0yow3GL6K/r1B3uSfOsaIUZdV?=
 =?us-ascii?Q?cKgMEJz2Jpvn7f/1GhM7NhiiId9Ik0k6dCPlguy5YmhOG8qpnKlPMGS9Stpb?=
 =?us-ascii?Q?5TgZHEJNDLRP0vqtJXBl4hDMnMzuFP+cxD+cfzvpaYR85vmoEBaRlcZGtHR1?=
 =?us-ascii?Q?RV2GY0uSQalnllonwnbM977A8LVmOejySwyoYecxxJMjPW/AsjNKgMm6PGPh?=
 =?us-ascii?Q?QmRhaqpycWthnbKE5wBKET79hk8zmBqScDOXeWphutUPabKZrRZBT8wQdZDs?=
 =?us-ascii?Q?WBvvN2KjoJ8RUgIESNPi40yfeGnEAQasVmaC4enPEaxhiCL6bOUxIhg1tslW?=
 =?us-ascii?Q?+VyzKHSer1x/m43FJOo25Clw1hA8o5BS8VYdzrg8K3+upw/w2UZIYZp/3O19?=
 =?us-ascii?Q?iQGvgjTm/L8aROuupQNSkfUdsG4dJX3WIvK79syEAz9PM/gEZ6q5VQC4t027?=
 =?us-ascii?Q?dAQZZhjJYnIMt4NfBXr+NxSQIcZ8QCeFMcQc37B+q3k8YVI0JOfClFE+sc6Z?=
 =?us-ascii?Q?1eUpEooibOOO8q3/0iTVJ7TVWEqB08+iM3gHHp56v4/XVUo9h8vTMgcxDak9?=
 =?us-ascii?Q?EehXbOvGd7CWKYndhbLHxnR3gPjPUrSu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3TqMYgRTDBi6Up+W7yIVPByeMy+lQYbgSv79Q+Z7KUYrjgirJiPw0DKwMf3?=
 =?us-ascii?Q?0Bsl6v494taVs6UeXIM5eYtoVCSqCDkNSGx3kCR/5PxzNJfIIHJWtLtD2Hd+?=
 =?us-ascii?Q?rQcKgTmbBOyLazekD5bAbmWmDLh3VHMIM5EVlrOv/uhX6BIw5seStvr0Ftwt?=
 =?us-ascii?Q?TA22L9PjYdXzPp93iiby08bwCDR/pvF0ncetPgqz0kwymoclQkGBTrPWG7Ah?=
 =?us-ascii?Q?E3/eRZmjiTg7gsZz421qQQogTwYmx4ohlo2Edfqiy6lQRx4BdnHBnxqUZgzb?=
 =?us-ascii?Q?Nbk7VmE+9WaNUKDkqxLIjPuwdqWa/tbrH8Vv6M04VaRjNyIHikZlVwZpJl1Q?=
 =?us-ascii?Q?iFI1AadVYN1fOllbsoR2EB9hVeTxI64bgYjg6hTbCnTl/ziolSbJEzDvMJcr?=
 =?us-ascii?Q?uUwsfHZp3DyWx0SjYNpmlGQa2n9Sj1II+wZE5pOPJxAzuI3oITsYSsHssUyC?=
 =?us-ascii?Q?tEEfGm1A6jb01pjPjAa88Qipe9velQZcE2OM+DEsiF/oOcttaFHsp5IhYyci?=
 =?us-ascii?Q?tQguwIwjTeF5LonWdscfOIsg9RlJ1n7FwJp4kemlSBepU1Fehd/c4PGE9hms?=
 =?us-ascii?Q?kGE9Avk3BFtq4OKzR+55QPm66TLsrw7KYd3PPEBpxujo0DIALdS8CymSKoLr?=
 =?us-ascii?Q?QCImkv4pJ/qmyqp1HunxpQxYTcXcOmwHVdomhDe6oFYs0qIajqR2FyPJ4gPL?=
 =?us-ascii?Q?TfbI/MayWioGyJqa7V01zZaF4io7vT8KEwDn6edF4lSuqlUHj5Kco/nBsI5X?=
 =?us-ascii?Q?qK+kuAD4I53D3gTIzfaFy8LR5oQc3fR36wPTqx4fyWd8tslUIAZ2lx+twJ9E?=
 =?us-ascii?Q?/pai9qpuR7JsL3uue+4j76SjATd8GsRktwXl96cEB0c1eSDDGYoHHqgcbsDM?=
 =?us-ascii?Q?mpUJG/DmhpyVy2EY+QtkWjP7NDDKRK5kNfqidludOJqjIVsVPlwFEsaPQ02t?=
 =?us-ascii?Q?/u0SRsDESOqJE2gHG+mcBxc0vopaMoos/6MSpq6QgQv73Q7ldBs1jFmwta8J?=
 =?us-ascii?Q?rN1XTDUVIchJoknvIo/6FFiz6lyz0RzPqchDTTSgy7Yg8N+abiD5hQbB+dv2?=
 =?us-ascii?Q?ZBsVWWTQ8NrDimykG/nFh08yko8KJEylPwQSuGwO5Czhv0Ix3PVRVaIKr5Kl?=
 =?us-ascii?Q?B6bRzI7/r/zewbOe/b/o4joEq3+mv5+KEAECJdmjMayth4+AyORgEvV08V0P?=
 =?us-ascii?Q?9bmX6WE8D9YL2CxLrbv6bOBDwnKK4xXRslD9k5BBtJnEAZSCgNjXAiTepL5u?=
 =?us-ascii?Q?zeD/4PDpsC8l4BE1fenyR0uIBFbBF9e//Gq4o+CGLc+M2Ew3uAO0/o35stfr?=
 =?us-ascii?Q?LldZDGlVjPFRLA6dftr15jlN0hBV8Hr6CqZyK03yvHtxgZrYixpsLiP3vzq0?=
 =?us-ascii?Q?Vs2sLgLoa0woXE4lUPdYUSapfEeOAX5X/CJOcTdFENKo/qCqs61CvkshsKVV?=
 =?us-ascii?Q?Y5S23PMiC4hALb9vU39Fny1IrGuMxqGSXcxeIn2O1f5MPdr1CXJFkL54UTYC?=
 =?us-ascii?Q?TMeK9kjbMTWRUmjAxrviednC2l3CJe6BJGWGTRB09Gq1scaltGdj6Sxp/b1J?=
 =?us-ascii?Q?X/V+9HBGDHeshXzUjtMEGlxYOVa49PNqrhQkX3M6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7a2207-5916-45f9-f69a-08de05ff7692
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:09.9485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6J+8fKewtqG98AEwXgp59McCaoLeeYFkeDshBlBLaSE7qswEVFKJC9yEzEnl7uxgwO32m1lx4OJd5FydqVvVYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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
 drivers/gpu/nova-core/gsp.rs                  | 79 +++++++++++++++++--
 drivers/gpu/nova-core/gsp/fw.rs               | 39 +++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 19 +++++
 4 files changed, 133 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ea124d1912e7..c1396775e9b6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -197,7 +197,7 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, true)?,
 
-            gsp <- Gsp::new(),
+            gsp <- Gsp::new(pdev)?,
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 221281da1a45..63099df77348 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,25 +2,94 @@
 
 mod boot;
 
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma::DmaAddress;
+use kernel::dma_write;
+use kernel::pci;
 use kernel::prelude::*;
 use kernel::ptr::Alignment;
+use kernel::transmute::AsBytes;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
 mod fw;
 
+use fw::LibosMemoryRegionInitArgument;
+
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

