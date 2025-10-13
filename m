Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8BBD19FE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FAE10E3B7;
	Mon, 13 Oct 2025 06:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DScz5Pgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C3810E3A0;
 Mon, 13 Oct 2025 06:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJmCbZABwZ7bvzEsGfKhluKZ3rWAbiPQ9YeMO0bO9jftJLcUiEni++hkF8CInhkAFV5vkzhReaV2BPX1cv2Cyj2+Uy39WiY3ppyPf+doBdd5ENIIIWf44isnkmxUproHuzsF7nM9p+BzYCtDULVVPSDor4Rd7DOTqlTWRkVdr4OcsSXIzzUOstvy++NTBXLAGSnd4XpovrdJGzXMtvgWIY+gOAxp+S53I6ZQq336wvcFVOV863xWWby3OwkfWOcX7/uLrM0WiDmXGp4/dHc89/yQJeGOyYHJ+a9HSzUC8r6JHuIN8Wyg15a/k6dmcI5qs/XnE0hFkjdgJSff65/Ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fNUuP3an4VXMdm6Z/jskL75Vk7iZ2qjYq4g25dlglE=;
 b=bmrhGqsXQ9U+UEWFBs1oMY49PWlClHOztUjTJU9v8ti1ojGvpozGVoIsuFAQahps+PguOiAd0j8qdSJqNGzitmZ59dnTf177MYS9rn+zOcA2dNTDvjRnEybDWkT77LFgDQYjvLyMv/BB0DwQ/ND/AzPUFMc6ZMyj0dMKV84W3b96/OMsfjL1WB4TAZXeby0cl6K8cItYxGfEgqn1NN0UGPlHo4E8I3lIuyXRhOfpiEKvaLFONqnIdwqjtA5XOFBjFbVGODdfoN3Xt77F4mcf5t8luVnFEZPaRuNgSzeSZtCH1UEB1Nu1+6kz33B9dK+nvagArKz4Qinhqhc8XMbXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fNUuP3an4VXMdm6Z/jskL75Vk7iZ2qjYq4g25dlglE=;
 b=DScz5PgknvTDhjyYF2aTDwUZ79SvVSIeVPoiHyFiqnYFcRPgMtqc/+woAnC/iwSS+L0MNzUxwWtceS7PDzbdWgwLS86mFVp5hnM+H2VIPy9jwQtn8fk/J5vJ25l55/5L/PFKp8M8eRhgv6Bcn3ZPnxh2V5OuLbIpqVLVM4Uz3gNL902tDbSxjvp3TjTwe452CPjLkZGkA9VwiPn+nndZewTO6AhEyyy/ftsTdEzD3egCfuhNemEyjqt1fxL7cO/8hWdrBA6TNJMVvtekYAU+WoSwlWfD04uBOLUMOv4DsEMDSPll8s15Um6595PRnksO0XP0a85q/7jIKxg8OVYE2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:11 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:11 +0000
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
Subject: [PATCH v5 05/14] gpu: nova-core: Add zeroable trait to bindings
Date: Mon, 13 Oct 2025 17:20:31 +1100
Message-ID: <20251013062041.1639529-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbc0de8-22cc-465b-7dfc-08de0a20b404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OmOyaS8r0H5H62G5t1E8SvtoBAEiPTYrHByGKX1usFR9BHT+twAoSB20o5ah?=
 =?us-ascii?Q?azd4Jp0Z9n1LsYWcRYbgr1QTkaWQcERfqT0JOTMozuksElB/JcVriNKzNyy0?=
 =?us-ascii?Q?rgu+tBfzVZRsJDg20gXMXKTP7COB2HQHkookFtKDhHzfyehwXDU8dZPcsFOX?=
 =?us-ascii?Q?dqvPwvsF7+Ao2hkpqmhc2u5Yj7CaYpd8EEMqgjq+KcalJ8c+m0crcTvicU3T?=
 =?us-ascii?Q?5ONqMuVyrSfosdhRrgcwt5YD+nd1stVLj3Q4d59a1qC/fn0RhK9sf2iUq7GK?=
 =?us-ascii?Q?ZqnNWE6JSR0XWyKby7WWhGFvyaJ6DfrbzUWbv97MjCekJnrew8YFL7geePm/?=
 =?us-ascii?Q?Qu5GNuGR3zM4D1hrotIvaNNDncGBgdvlGdB+CRkrtxRAu7UFSU8XBmqcikIf?=
 =?us-ascii?Q?RCLnk2Wp/n8pI99CpOMVjCd+lHsNPvil2zsvYNzGGJ3UX5lbtOfuY1oO/XHF?=
 =?us-ascii?Q?i1kn0FPbzZUA4lI8gFqr//l5ZYs0d53Tvk1gXrk9HANxNB276xaA7t0JUX9G?=
 =?us-ascii?Q?1mJR2ZpRBeYCp/rPAW2YH0fgsCFi4U7ypxl87Ia1SL/cy2ZPOzi4dolUnZ1J?=
 =?us-ascii?Q?LaoidtnG9V2Qw1umbXnKLMeUFq+HA610ZedfB5yYixk2prgNS+xE0jGlffcX?=
 =?us-ascii?Q?62bR/Z746BTY2dXN3HgyVG1+w0Ailo62pkj1mJQwK4tM4opaak+zZjqg0G/4?=
 =?us-ascii?Q?gSZUezyxFxdJLL5ArGGewmokHMoo/ymOHHVAVpyCzZgFAI03fXqojM/6T5ls?=
 =?us-ascii?Q?U06LgHsFyuP++1XEU6UBt1FJK3qbdlEEsK+Xh2fjAEP+G04WPUxefknE2MAL?=
 =?us-ascii?Q?rOMBShIC5FkeBUOjU9wuG5a/3Ij9wmr5oYY3LIe5pb7vVIhsRq1juwUhGSgT?=
 =?us-ascii?Q?Jf7+IWJwhsEXsk691MhuEf2QmaFch58ipiPBcCZh6bQy1dgvTXLCVu6oqsMc?=
 =?us-ascii?Q?/0kUqow3A0u0rnAOvhjgq4cAi1OKag4faBs33LXTDKuyJfYmCvtHF4TYhTUk?=
 =?us-ascii?Q?+/McXQ4VrbZXW7q+youoSJZJokaq5ocMj/4iasfLwBgJiZ8+Vvu+e1wz+S4j?=
 =?us-ascii?Q?Wiv6ZG5qsGeWHYgyAHxsCBvgJB7a3P98xHv0bDH2cGZZsMbAB5Dbf8KVRUG9?=
 =?us-ascii?Q?rN6pxojwLFAqMMaDHSh90WkzjQjZDYp6ZtvNFw1dimtYq/ddJ6ed3cxmpNBY?=
 =?us-ascii?Q?LSdtNtc0eXfFdgAMzlVusejiNdGdFKyXf2xRfGob9M3KaBS0D2E0MTxP1yhh?=
 =?us-ascii?Q?+mpeA2Sj0dencJc2gzltWT2DL+owi3YHs1H7GTg+BHhiNt2KplDj9QN+Q2ge?=
 =?us-ascii?Q?hpbGiNMOX5DATBDcZx83g1tU/KMKngoW7+8vIOvio70I21JyhGcaB6QLFitU?=
 =?us-ascii?Q?nZgOGKCB+0amzLMi6JhHiP6MwyffmXtpyOnjA9K5MU2qZDov+HGJUsu1MJPd?=
 =?us-ascii?Q?e/TokZuGx9uj67tGazrourPTpDxwb5AL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pc99eZUYRhMN07KhMKc9We9SUTKI5zo1+BmbkIcocDULnzAY8gyESk/NfiJU?=
 =?us-ascii?Q?DbpHy3/WvfyM4T24WggD8SQEJl0Apst58rmVYDJ0X+MZkODE96b0HavecK9Y?=
 =?us-ascii?Q?Ebpfqg6TDQ9mf1CbS4JuWSbeVjx+T8qFpB+RA6d3/MzYPWgLkz1MVz54js7N?=
 =?us-ascii?Q?4wn0eTEroio7AgfE00KaZ3lZvIdzpL9JyzeXUHqT4BbezepcGxEea63so+1n?=
 =?us-ascii?Q?gbea7PvyMKOLR2eJzGrp9W/IeMSo7gp2dbI46RxUJymoxnDqvJSypapNM/p1?=
 =?us-ascii?Q?M+it28HszWPT9iOkAi8b9zm0tEnvh/I6fMM9W8BdzltKY4qxPCyXc9+vZTqV?=
 =?us-ascii?Q?euEo9YghAeF8Ef/5phKcWkExvWg8KyoyPaUIGT1gesM80i9ioduVB7lNrPYj?=
 =?us-ascii?Q?2MfvRXF8bq4PrZZCJFNF58yl7DnP6GLeZYKRp636Omwsd8MUEGPP5/B1mh9X?=
 =?us-ascii?Q?yrYBy+DeHZm9QNIl5BgC9TMbGYEfKxOKZE3G6ZKnzKnVDczUXHInrLanVuM7?=
 =?us-ascii?Q?kG1dobBicL7oIeW8u81UpECSOcDIg+mOprK8bmPPXwRTZGvLcxBQXzRUy0qa?=
 =?us-ascii?Q?/wnXQzXOoqrgMiW9l1qS7nyRVf4S9Y3fBLHGacjnUr+/8ZjRYh7Il/FG0zVv?=
 =?us-ascii?Q?BWJb14D6uwD3AkXpQ5B6oCo7DqvYd3ljK3TlFEePYq/duZCv6JG3uEtXykZS?=
 =?us-ascii?Q?3Yu/iQGViX6eA572I6OmJmvyEU5csMzODQ6eT7eGrCPMgcuI225x13e/Mnwq?=
 =?us-ascii?Q?5zazkEsxH8yqPXvKs88tgXn468CYgCOSexwfNQvWWgiAfvbORNAqWq3CETDP?=
 =?us-ascii?Q?FDQg70Ws550x8zJ8bdLm8AMPfMFSIVYiv8L8yLh8lv1nBuFa45RPjkHWrxgh?=
 =?us-ascii?Q?TEco2/HCwmSd6BqgXXXG7ZtkvJaJgLmtS1ADKYznG1OtQBOqmhPP/dja7GME?=
 =?us-ascii?Q?8UZ/7PtiCLuqVZ79lOHS6sD2EIebRoeSh+dEM+68Z5YkxH/qBQcWdwyPJ50f?=
 =?us-ascii?Q?EIQ5b+fScolT6fu9R2XG38/JmKS7sk9kSla2cKkRUQOU3RYhzmz0JTy+vaa6?=
 =?us-ascii?Q?jP0m4DLo3vH0QhGzRBvpzVPOKSlPT2dl5O+CrdgqhOxW/6mutVeysv1Ncxk8?=
 =?us-ascii?Q?unznVQhRMTrhEoU+gIdpvUsioilXCDU0VJRdYSFE53Df0OtceCHY20m7/AXL?=
 =?us-ascii?Q?EaoNee+hkKGGIDmLkO4FiBUbx0H6e1NZKYD7BjcxpoHrl5U1jlFuDrWGxSUi?=
 =?us-ascii?Q?C+2OwRuO3QeWfwUW0bIadYy+GCVjcgUd8metJXnUeiztOfZakhHjZ365Gq9L?=
 =?us-ascii?Q?w+pVC2G2ewc4mpDaaJglpnniuyIGfoXIwktsBdIFaorbLZJrGjyR0dufLqsa?=
 =?us-ascii?Q?fInp3qAnr02CXEoTJTviVmF3cROcNL4C/0ak3a/oxolVu6Ou8vC0pbNbeHDT?=
 =?us-ascii?Q?sR9yEWWFvbIfv9H49SIkrqmoo+vumBCTv+4k77tTg7v45yA29WSGg8rrM8zX?=
 =?us-ascii?Q?nZ8VAwnkmSAdKod41nwAkdZCoF1YmnWs8QZLSWSsDx5gMm1rdf06lcKwfNmS?=
 =?us-ascii?Q?6rkyY+fRvjLoZgpzaMMllw2kxABcUNJ+eeDCgTm2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbc0de8-22cc-465b-7dfc-08de0a20b404
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:11.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWUorONV2XNJyIfeHzVEr0huTpATplS1hwUcDMzHXES2yJmMZ9iHjIlJcfb9qnTPcMIoqsKpFptHfvLVlMQa4Q==
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

Derive the Zeroable trait for existing bindgen generated bindings. This
is safe because all bindgen generated types are simple integer types for
which any bit pattern, including all zeros, is valid.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - New for v5
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs         |  1 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs    | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index 82a973cd99c3..4f5c65ac1eb9 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -25,4 +25,5 @@
     unsafe_op_in_unsafe_fn
 )]
 use kernel::ffi;
+use kernel::prelude::Zeroable;
 include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..f7b38978c5f8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -20,7 +20,7 @@
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta {
     pub magic: u64_,
     pub revision: u64_,
@@ -55,19 +55,19 @@ pub struct GspFwWprMeta {
     pub verified: u64_,
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_1 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
     pub sysmemAddrOfSignature: u64_,
     pub sizeOfSignature: u64_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
     pub gspFwHeapFreeListWprOffset: u32_,
     pub unused0: u32_,
@@ -83,13 +83,13 @@ fn default() -> Self {
     }
 }
 #[repr(C)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Zeroable)]
 pub union GspFwWprMeta__bindgen_ty_2 {
     pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
     pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub partitionRpcAddr: u64_,
     pub partitionRpcRequestOffset: u16_,
@@ -101,7 +101,7 @@ pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
     pub lsUcodeVersion: u32_,
 }
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
     pub partitionRpcPadding: [u32_; 4usize],
     pub sysmemAddrOfCrashReportQueue: u64_,
@@ -136,7 +136,7 @@ fn default() -> Self {
 pub const LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_FB: LibosMemoryRegionLoc = 2;
 pub type LibosMemoryRegionLoc = ffi::c_uint;
 #[repr(C)]
-#[derive(Debug, Default, Copy, Clone)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct LibosMemoryRegionInitArgument {
     pub id8: LibosAddress,
     pub pa: LibosAddress,
-- 
2.50.1

