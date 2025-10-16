Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1139BE426F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D059C10EA25;
	Thu, 16 Oct 2025 15:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BtlJYtMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2341D10EA13;
 Thu, 16 Oct 2025 15:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg3RavisxMivMFZ4Xnf3sLry4BVJyllCMYrs7OHqj0C8AtUWDT//Y71CwbgZKvzmVr6Y7Ek7OwcOKS0HzukO6x1jfJRSm5PJNOxhjWK1eV3jb4j7+q6cPUdOmnUB19e9+DMhPG3B77JWorimL57lUKPEkbbD5AYMeMIOuFFryozpGcgOvSYSOpUrB3hlnDY1nZI86HrX1FLRFmsiOn8Vvud7BMjqt8ELzy7UjzIXRnCxYdQGQ8MEs7ucJ9F9oNmKo+ziOzbBVpeG2X04FHsXiULwP8kbgamEzyH+1iapUFxPpKmBNFLsqIy8O7zNs3B2LtU/8EjWJHI8Th2ZoHFmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Or4vegJ37dm6vFkg9XIyhJHgngzh+8yUExNw16FJvCk=;
 b=qkqZNY5WaGFMiRx97uK5WHIFmH+PDpHemm1p4xU/TW+5mf/SMIWEETpnOE8F2aPfJfesOwlHoTRoKqNGVF01hcvWDUWfazinariQkLJiKyLJ21F6/3f3Us+LlKkxFN7y0aYHaN8i5CFpXHAQGe7j50HM6iuMcCDTMIym1gD70cbcZu/tylWs8fQCT1n0BRRUm32V1D42hmivDZL87TkcRLM4StgoiLierR6YltVDSXx1iZWwLXSqBTZp15aODX5MOqf9aQF5CT+0LBhp6LyaR4R94ndNlxPlqjEI0p4umgVWNqgjxh1Knh721Jb9O1D7J8T7woKHL5NyZpEvWJerdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Or4vegJ37dm6vFkg9XIyhJHgngzh+8yUExNw16FJvCk=;
 b=BtlJYtMby7O2XD+zGAut/9JAw1zC8DL0UfKqxgCZtBS0Vu2jlLD/Tod8Jaj5q4GnvJuGqZdf5mQ+Ru9YFiGqpVdpB/x12uZ+wczzVgmZaTsABAim9C9XVSD45/paoabj4yLbr++zjNbcRgIOLNK+OU7ZGLZNvsRfhK9ebUjsLqjRyRBcS+dxz3LzobDqbv8CtYDyjfH5PIcNoNcl3KU9ncK1RpYdYN0/slhUfaXA4E8yOXOo9mKDZw1CWjXatzHk/zpiXCBg8tbs4sPEAbC6vrq2pvzxaBBh1p61N88/9pWCTyoe0IN3n7iHtnBGLF/n0r72QeYgRSFqqAqGQb8wYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 15:13:35 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:13:35 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Edwin Peer <epeer@nvidia.com>
Subject: [PATCH v7.1 4/4] gpu: nova-core: bitfield: Add support for custom
 visiblity
Date: Thu, 16 Oct 2025 11:13:23 -0400
Message-Id: <20251016151323.1201196-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016151323.1201196-1-joelagnelf@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e121e24-191e-402d-b283-08de0cc693a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ejUpBAx0DTn+QWn9Goy09encjtELeqNFG6gYu/CwYQACd+dkRJd9bNLkDNmc?=
 =?us-ascii?Q?QbSG+/nBrC45K8FLqwlkCJMSWdK2U9ShOtQXKFiwwfP8nw7FYTaKAw4eIW0w?=
 =?us-ascii?Q?m5n0ES+GIOvTaR2RoiVCVeLt+aErqR0AccFc9/S5vw7+2hUr+YgcQE3ANkbD?=
 =?us-ascii?Q?IAcGciY81URmLMtnMXueT4FexWjoDjHxFLBIcO+kOL/eCE8bTCZjlArs/5nl?=
 =?us-ascii?Q?9FcBoQhYqUAjQoHBajQmuGaOhXL3CVBQ1mIUxC0JdynWMEu2sT4cVR+QPFy8?=
 =?us-ascii?Q?rGQoEWjn9QMODiTZBsitHL6RfmChRl59izsq9GsWWO0gmr2HfqCQ3lAY3h0i?=
 =?us-ascii?Q?/tya9aaREoyG6lUkTjuzB12Lw3wXZdOncBgkiJCcifpfeJWxLia9Qt5SOibe?=
 =?us-ascii?Q?ZJwHwWS2foMQCxBrsSDQ2AOd/ikwehv4jZ4T/nBK/kq3xHuwW0w65zkmdzZ0?=
 =?us-ascii?Q?CAZsvQzE6eV3wg1JJwoIIsgFrPPfMo/WUYToG7Dk69etV8NBPQGEshVYN+LB?=
 =?us-ascii?Q?gGxht0+rJU654Fi0bJnz8Ps/ctlPc/k+BOjX9bUGSrpU5L+XWb2fChN771i4?=
 =?us-ascii?Q?uFWb4ErJbIgWaJssgamywj7U6ZGDsgH59X5cqsgy107awZ3hp9wnWBngG2Rv?=
 =?us-ascii?Q?BLbRk42hb0OXoN5vmtEcWXAqUNeAvH9O7rNi9yriXbZ+BosJ+lok4M3hm/Mv?=
 =?us-ascii?Q?E2KGIflBOlm+ZCz7DH0RcJL+xu1B28yDcZElUZxXUOkibGqJJ4ZRn+qTR7sS?=
 =?us-ascii?Q?ggI566wW+uuMzPYINzR4OKJwiR0+xfHBTxE5bW20jq4X7qyGKiYKgeTSKHrp?=
 =?us-ascii?Q?m0WZxU0IvRs9pbzun79n3fnTgaeR3qCTnPL12U1YntfOSFmEg0pyVPKfQSLt?=
 =?us-ascii?Q?XqW/GC6YQ+1pmn/EUDqJbIVzNuYF8jPiAlbxai+Wbm9PNnV/sRFfiLKgXNEj?=
 =?us-ascii?Q?33+FdY6KUvMYl1i3lb3qUVdfYGffZHNa1PE86HnC3yQ+JJyv6OKHpe6QwUhF?=
 =?us-ascii?Q?/yqAGUJbTqmgRf+fjN/l9BYs/YGOoezSmA04PRi+NVlkJz5c/FW7bA0/31RA?=
 =?us-ascii?Q?YkCYWunjkrCqR23JZb4a++ngtibLA4gUjEsyzCqgO7CmstEUx89mgI2hee5V?=
 =?us-ascii?Q?6unTZmX3PeHw0nLh76qH6OM1BFkxPE+ZZj3jW4oJ5z39HdvUI2iS/OacYJXM?=
 =?us-ascii?Q?6jjeEev7UNXsiULX+578NFm5UZdVNG1MzZLoqauEqvlXB161Hek/KJytWU9V?=
 =?us-ascii?Q?XkjB5mqc1xIGqmlvvoz8z2ASzY6HGD9yfXKLuHK6DY2IjkNRMc4Z72rYhTd3?=
 =?us-ascii?Q?/FYBf+rH4oaFomKA3WKNU/7BzCUFDe2brNBNwdxlhTOnx4keiiWGWVY0I31m?=
 =?us-ascii?Q?sXoVvy+J9zg/U9SCuOfCM3uAgRdJatLi8UnKurrQ/bY4u4NigHznEpB8+1Bt?=
 =?us-ascii?Q?DOH1KTE/7xHykKvwErd5jeX+eBiR0XMA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I1HzMzx+7Fxmb0lqkwiI/BDeb0ljo2rkH4WXOvrN1pVTTL6MyLAeD7Ki5PWw?=
 =?us-ascii?Q?RGLmi8yr85LicHDwInHKedSJGaxKFlgfck2F8PVLV6J8qoBCGiSZinEMtnt6?=
 =?us-ascii?Q?5wOAmWx0sm6E75hgSj4vdMQysvI75KKL7Vh3IMBcebz5KruZSxjx/N7fjI83?=
 =?us-ascii?Q?TE6WSBblAs4s5hfrLCjOSLKjt7MXmwxB+1WTYEOPniJgSGazTQdxWhtzLhF9?=
 =?us-ascii?Q?eFtWVoRMrLk4TsHLj/KoAZYUGoPtg+SO3yHA/sdUG0t1LUuhCP4NFXy0ihQK?=
 =?us-ascii?Q?vkzS9h6myFdD0rOCw6Cm49h8ZtAGdelr/V65DCYr8aW9vMcY3dO9DcrOflF9?=
 =?us-ascii?Q?jEgvZ1psKHulT0mOCN8wpf0p9WlEml2FFxJ8hdvtoaQRQG+jNNypycTrzzXh?=
 =?us-ascii?Q?+C9h5hmDC0LOZfDA6m/RyzkZn5UHQ3iz4VG1yzJLazRtE4IxYTX4Bxw0mGSm?=
 =?us-ascii?Q?QU7jkTq9D3AwXZC5Nyo5boUFDARDNnQQMfZZnweLPxxPMiXDAY5QQz+FMcEA?=
 =?us-ascii?Q?fj4rTK7NmXGY2FU1ix1tHLecV19Xn0tf32bdeQWWgRB8zvF/RK+SOVtiY9pM?=
 =?us-ascii?Q?FGLQhIDBbN9g1XMAgUA8ZVpkmtxAIrsCasJ7HT7ssTnoyyJMRg/vhTEtnNQv?=
 =?us-ascii?Q?ifCU5HBzPQW4ID7sx2RIYstl1xgd9qrsFaAZqjpe9D9aozTUl8ajWYuBmalU?=
 =?us-ascii?Q?GLyYpRo9+SNKopDqg5w6SOXopm/ViQzfg/WiEYMBpel9Vvyvse6SCah8dOFN?=
 =?us-ascii?Q?NeC812F8dLCGB92yNttZl8cI/pokyrT/FVxnfD1SWblpEd5BzIjzsJinU4nV?=
 =?us-ascii?Q?tsD8Sk9utsBnasjpOvAeCY4XF/QRVJUeBSGQjE98tPfFmEfCPNzKz5kuIG//?=
 =?us-ascii?Q?DaM/32HipJ02SmCF1vC221oyaWrx4vy1I8fWuT4+7lJK5sParbxrl4iHu9LL?=
 =?us-ascii?Q?/y6MjB15f+uJE2WvToiblkc4o3iywjyXxvQXntEpANkXAi3RBcFSGfUr3rEh?=
 =?us-ascii?Q?utdbmau1SLaqVn9M1Rh8N0lPrB6wfZrII2nPeHYQmwAQgT6dPaV8IOWzVf8G?=
 =?us-ascii?Q?x7pCDpU46gbGPKknlp7xpja6X1ZdtYIFXYYTYa7y8JiZKz2bwBr5eGt+VysD?=
 =?us-ascii?Q?Bcv0AuUZN6AEoW7MCV+kvIDmt49S7gIYHUTWCIM6JYupdd2hNKEzD+RP1Et1?=
 =?us-ascii?Q?Q3saQaAqc+0CMplHtojrtQ4qV/4+gF8LQU/puaHv/XfWisF0BB9ddjtR4uW5?=
 =?us-ascii?Q?LoR+dWDaQdnwoR4cFs95tUehh8Yk195B3IkhbXM9JAExcjcs93Yy0kRCf2uo?=
 =?us-ascii?Q?CFddWqaQ2So6879PSmQry4nTkigW4+eWkbFZyp4XVt0mQyhTapdsZR2LsaA1?=
 =?us-ascii?Q?KXA4YFFl+3EGpolSwM5BRnOIQ+1SRlPlKE1QyYcYPMF7r43bUhgFPNyS8Sjs?=
 =?us-ascii?Q?1uFW4JHMA4+T7LllLsy1DTa8HzpV6JlJZTcjCTNIVmg20gYug+hE3sfCLqiB?=
 =?us-ascii?Q?iYpu5IyqivelofVaGD1S41Z2kCVIZ2Zyqx22yJCx3wQBEnlsuOAXVpa4kxD0?=
 =?us-ascii?Q?5nE/KNhXkwVCmDkn41+QkLb7yu28xloG2jYEsews?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e121e24-191e-402d-b283-08de0cc693a2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:13:35.4750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRUeB2sVVhsEU7r7qsFyO5MtCgI3iKYnq/C9G/GFkT/VaFTZ+SJzjdJPMRs0PoXQbxT6pqSu2oJdBhnZKfvA1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

Add support for custom visiblity to allow for users to control
visibility of the structure and helpers.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Reviewed-by: Edwin Peer <epeer@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 49 +++++++++++++++-------------
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++-----
 2 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 998970ff0bbc..0994505393dd 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -60,7 +60,7 @@
 /// }
 ///
 /// bitfield! {
-///     struct ControlReg(u32) {
+///     pub struct ControlReg(u32) {
 ///         3:0 mode as u8 ?=> Mode;
 ///         7:7 state as bool => State;
 ///     }
@@ -74,6 +74,9 @@
 ///   struct's storage size.
 /// - Debug and Default implementations.
 ///
+/// Note: Field accessors and setters inherit the same visibility as the struct itself.
+/// In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+///
 /// Fields are defined as follows:
 ///
 /// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
@@ -84,21 +87,21 @@
 ///   and returns the result. This is useful with fields for which not all values are valid.
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $storage $(, $comment)? { $($fields)* });
+    ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
     // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
+    (@core $vis:vis $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
         #[derive(Clone, Copy)]
-        pub(crate) struct $name($storage);
+        $vis struct $name($storage);
 
         impl ::core::ops::BitOr for $name {
             type Output = Self;
@@ -114,14 +117,14 @@ fn from(val: $name) -> $storage {
             }
         }
 
-        bitfield!(@fields_dispatcher $name $storage { $($fields)* });
+        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
     //
     // Used to simplify the matching rules for implementers, so they don't need to match the entire
     // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident $storage:ty {
+    (@fields_dispatcher $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -130,7 +133,7 @@ fn from(val: $name) -> $storage {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $storage {
+        bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -145,7 +148,7 @@ fn from(val: $name) -> $storage {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -161,7 +164,7 @@ fn from(val: $name) -> $storage {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
+            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -195,11 +198,11 @@ impl $name {
 
     // Catches fields defined as `bool` and convert them into a boolean value.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
         bitfield!(
-            @leaf_accessor $name $storage, $hi:$lo $field
+            @leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             bool $into_type => $into_type $(, $comment)?;
         );
@@ -207,17 +210,17 @@ impl $name {
 
     // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -228,24 +231,24 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
+        @leaf_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
@@ -268,7 +271,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -284,7 +287,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = ($storage::from($prim_type::from(value)) << SHIFT) & MASK;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index ffd7d5cb73bb..c0a5194e8d97 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -276,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +357,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

