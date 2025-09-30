Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C0BAD3D1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AF410E5EF;
	Tue, 30 Sep 2025 14:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UBz6WQZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24BD10E5EB;
 Tue, 30 Sep 2025 14:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlR1to6iF0fLV8IL9DyAk0D+oDXAygnPGiuPYa2DQNl9M/MWkmwIpKB0Z4/1U+aVdAfyBPak96++BPFEFauH4ctBIYO9jL6pRC8b6doomhTm5gSpC93EkGdyfnLXCTLwr/UHVExez9X4e8jPUfrc8Ktv0zD4JzpDjZ+HA/QYO4vTOVhhIhgDVQ4JSHB3qFfdk9q6nNzCh72JlsfRyW449O6ehI0lAEWNwSHtfdWoakF/pCzdCJUL9yfuZVFL+2grlpuC9C0yWfiTXrhiLTkBGKT+NYBl4FNleEODQWyJBLxCeSxB07fJtqM5h8NkTp78e12NQWU1skVfsb4rUejQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WtHuucVr0mioG8hMK3CYr/acoECPocCMbDaWYL6yQc=;
 b=D1RdjsXcBxNNKIMHANA00BnpLX2sOXjHBRhmG8XsUPGmIgmRO0R2veZRPQ127D7x92OA+Y6JWIe2mjzIxZ9T8kJsvfowddCOAYDRKgvy1s5kIcYQ4cUerEfU7Au7KVDaFt4PBCVzQfMWAy2y0BjGTDcujazJDfC05nbuhYIZ/C9M5WOCrb+lhLtYmA2ReziILupCcAdL01kIKuR6vGVXUZt55WpQX1CjeKbc9455qyz671mE+BxiFUz5/f3LfilpZSG9WBvEZ22ATu8ExNn1dMWzCeQdVi051x/ZRtUGcTA4iab3arszcVodVoZ8YvRLZ/kLcw0BjhkyXSkET/a6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WtHuucVr0mioG8hMK3CYr/acoECPocCMbDaWYL6yQc=;
 b=UBz6WQZn+b4+ZeNX6wfWVw/gt7C794NErMWvb2p0iM9lQM/PKlHnGWmLXgAdmf18EO7PHTBA/XO/aOYUlHYG0kYwfCNXyn9DQhl/6iD1d62r4JxAQFUxVbHI6DwVJ6QfcIzG8a4MaAkhZ81ShkLOX4680b3/fKepcVs4mPphVp+iZxFkT2zv3h9oGmq3iAkP+Gut5Uv+wsM9Vh+qTpaAS4NPE8ollh8aai/9GQMkPIOvwQWfEH7EoV3yULwE6OmJ2OQF/PfN60SpQyG3LcD8ksnA/Cc3m4USZ6zTVQEOhQe2bOLMjVGszmxb5TFPXIsWTUbkjf79NM+joJ3NfYZojQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:51 +0000
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
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH v5 3/9] nova-core: bitfield: Add support for custom visiblity
Date: Tue, 30 Sep 2025 10:45:31 -0400
Message-Id: <20250930144537.3559207-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0630.namprd03.prod.outlook.com
 (2603:10b6:408:106::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d35806-395c-4e1b-cffe-08de00300d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3sz4nkNNfwrM/Ea5Xg+DQVG+vlEFzAKS6l2JTIYnJWnOsXIta6dSg4fk/jzB?=
 =?us-ascii?Q?E9phsQv34UoP++0/wcstKO8/5SdR44IAs3/BN020VFsfXeYO5K+LEBJ5SjSd?=
 =?us-ascii?Q?A2Q9e62UR3BSChcuNqE2F7AhxV5q7rl+Gh/LOINrnhkca8X3mp6HPWlavv4n?=
 =?us-ascii?Q?lQ7SwKJAE0iNTKtWrg1JF2l7YPC3Ac7vE92prh+1YQipVfzgVpXpMPwSkMNC?=
 =?us-ascii?Q?JGNlOyzWSE3J+YDAQ7BCPcrs1WSzn2Jix0vfLQGyHLg+D52BkORcPNAvDXYd?=
 =?us-ascii?Q?i0OOnTjHdLKeUChOpzslHmyGFR6Y72e0G4iJ/C+IsG97s4Oe3Wj8V6J+1yof?=
 =?us-ascii?Q?XFMZAeTTndC1Ri5uMSSNlheXEw/TSLdsfRTY9kRLc8yVK5zeGGliU2X7QHsA?=
 =?us-ascii?Q?RAr8eAezhuSSuT9+YLNVP+EfXzrPHnt2T0JmNNr0NRHCeVePynE8yzpT+aW7?=
 =?us-ascii?Q?ShjgQdwXA8PGMV3r4kxE/2oi3+r7GGrzrPVTMPkU0go3RcVoHaMeonJwVYbI?=
 =?us-ascii?Q?ItfNUf9r4jvWMwSBXYotNhuOghOihIRSXh8PrjDg+oP8kyO8YDMJeqAFgBse?=
 =?us-ascii?Q?KThfHY6LzHSuNmgLzq/V3dtDqKPd3w1oO3FsvloJC21ksWplzCqF9Oi1gBJG?=
 =?us-ascii?Q?bdbTxJR7W0g0LDkuEN8xxTEZBgB35UpHnoRhf9VROCVifdghenyEK4iZSEl7?=
 =?us-ascii?Q?SlOC/h0EvuOQAJRKwqO10jyjiN+BhzWlzMXztUTXEsQLxaXZ0geoVZyFhUlc?=
 =?us-ascii?Q?WrG9jWl5HMSAf7lmdbRhaWW540jOgZixaWTxSkeIvrNF3UKPu9E2jDZ0cmYv?=
 =?us-ascii?Q?QrsRTvn8LqWDMb+OAiqxWgdOzNDkP9OMlj0sXBsBgxe2gzADZ8DSLF71okVt?=
 =?us-ascii?Q?OA5dzkuoU3mcY/TpsvKps3EbzwwI2gL45+w8LCvnwIJHGrpY8NjDr7dUtk7s?=
 =?us-ascii?Q?j/1msoaOlz1osu/oEGGGKGfVpbM37tK8NRgsNZpHz/Pjl/GU42vs8UiZaGDl?=
 =?us-ascii?Q?ZgEK5GTRIQ1lSgNtStVc5IzQhqyt6YpKXPlW/Q/hDz60nXmD2t+NChVYThDx?=
 =?us-ascii?Q?oOKloKdTISpg0Vmxfx/gHvvoOtj94uK7q+dfpBIiUaJqtRT2CcM13MPMT3IL?=
 =?us-ascii?Q?9kLOw2+ZFfp5HUouDpj5o3SFujcIuql7Qj91sOD8jLxDt4puloLQuhozvN3V?=
 =?us-ascii?Q?N6Jqbb3Ti2vD78fr1kdwMHcDbSYMmA1g9Euqt0/GiZVcgwgqVogijabD6naS?=
 =?us-ascii?Q?yx3uKQx+gMY4eeQkB/j/mw18SaUG+h40FHjy0qGSzT2fp6+0CE1Iw+Gi9S/x?=
 =?us-ascii?Q?d96e4KnWMj3iOzoAI7WYksftSe6QkXEwu9mblQc2zPG4nkE3N6A5aw88XY2e?=
 =?us-ascii?Q?RaN725bZEjDq8loNez3aZsDpyqX9Ms0mAYp6BbCVObA20esu0nh9pCTWkVAD?=
 =?us-ascii?Q?E5dztrBjgjbJB0nNnNPTcvW7Jeosk7pP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ef5EaXDPJihD3mG3ufJU7VypVh0iAqkvfFbxL36dm+geMWtaxYDKyYbjUqrM?=
 =?us-ascii?Q?PAOR0bm5AuxPbqr2OUxGqUpgYw2dFRXxaoHxiP6ouEhH5yqsZeX6haiArwJr?=
 =?us-ascii?Q?6wH+QgylH/NVQoOl2rppPx3Foqo8j1+Cf8vxFNGIpPEEHrAU8JX9TtTechlv?=
 =?us-ascii?Q?CvwyYwBmxGF2HovkN2qOAnKbH5x9LAOKZyLlP3R9rEkjUX2GrUD/YrfadB/9?=
 =?us-ascii?Q?57qo+U71DEB9hPmf/L+mycn0fX+lXuLU36667XELRPXc0fYgXgnB/h0f8nV8?=
 =?us-ascii?Q?u2jyy+AmErJXxmOeTfMhg1hWuX+1l/ZLwwWhAnRYViTGf6Oo+82BdRL22PiB?=
 =?us-ascii?Q?19yOA79MqIpw4QGQJYMhIsrR9OayZpZ6YXBrZpRazLiKlRYqG+cKhoSs3SWB?=
 =?us-ascii?Q?0t922uQv1drCxHQY8I7lWzeK7M4wBSlztK1qiEIM+FuDb0AdwleMw2qiSJqn?=
 =?us-ascii?Q?03b7DBlH+hBX85EkybFFebr6+ZTJDqW96sHNKAGIbC4xtzOqayqokgh+E76j?=
 =?us-ascii?Q?FP7dLlNF5Qud8C/I/g2Z48vqIDYV7aBHHQAiFu4D/TTjyZZc5Yd4clQ+V2IJ?=
 =?us-ascii?Q?3guG+6msQYd4Hx+5hrC0/h1DkjWlDFxEQX1iUPvkEahW4ku2ODeFhs2MTY1T?=
 =?us-ascii?Q?PkNCkDzZd/HHWtaFfrpTXyLIRBTXpYv7ZfpVP8LZbMuy0y9UMOplKN9262sh?=
 =?us-ascii?Q?UJYTirYpJ2qXEsFocFlb9preRfvwluNeJkFRByLkJ5otxID/afl9YAtIYEut?=
 =?us-ascii?Q?ZqkLmm+v2hMku7YE9QYnXXBN1lya0f3V4Hat6z8HqtkXWaf5aubAiDTDGSMU?=
 =?us-ascii?Q?O2MkiJAdtY4WrvyyiOMDEvVCbX3KtyQHVjfVdJirPO1LWt/OR0I6Gw5ZWOAe?=
 =?us-ascii?Q?BtPvmCwHVvZmbNoWOrSc141+gPLX8yxzJPn7v6r5MOCZD/DtFihLr7gTR8mr?=
 =?us-ascii?Q?pVqwgijy/zj6h34f8yY57IkJP/4l3Z+wNMqNSmcYC6qOagMB5x/UQStWwozp?=
 =?us-ascii?Q?fCzyesCT4d+eEUoOzdbPh8UWTc4htgUH5Nv1Oahgp+OzeK07yS+rlMKZp9MR?=
 =?us-ascii?Q?+qPgs+8EQ77M4DVC19pwYzfnJUpVMnai5OuUKC2/KYZ8eZz0p/5zEvQstEno?=
 =?us-ascii?Q?MYPBUFsyA3cbmD24Xr7u7x/NeLUTvQ0FLQMRuzoA2AZF72x9X9Q+ZXo2MFtF?=
 =?us-ascii?Q?/sjYft8ttq7H90ZknjDfWDbE178YJV0KMhNgaKbH2gD/M0+ofa+d8yl3Uk1J?=
 =?us-ascii?Q?DmqDjkkBCQDpFlNF8hS0JIz7cDXen3AJbitHlsWeYmyzQD25DTonCthBnM9P?=
 =?us-ascii?Q?IOvZmJX9j3yy3OHHv8xqDdfUf5wdRx0ojAIhe68wjDdoE87upjSw6wvg6a5K?=
 =?us-ascii?Q?kM3m8g+WbKP8RnPbaqk5iPNW/dWmuYgFnpIhk+yc50w58n4HdvkuviCRMu0y?=
 =?us-ascii?Q?OLWqFy0z6oj6W81ZvOkqOb6hBzGVNXKIXVKfjaQpjXlBW3y31Nkiii1EtpDp?=
 =?us-ascii?Q?+4b8p7rOm6/RuPoGz8zzZUEq5LUXeCcomd/fBwGXty+kxiw3gqJX07VrEBKK?=
 =?us-ascii?Q?rpEHEyI0m8YL6KWFcOdki6QyVXHc7wUrMv3R37+V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d35806-395c-4e1b-cffe-08de00300d22
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:51.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoMSOYX511cPj6YBNR/6xqhnpomYLrrT6Cy4h/jX7F5bzGVIx5ByTIDVgWbilWsP30TaI2MAMdwalMsVaEmkJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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

Add support for custom visiblity to allow for users to control visibility
of the structure and helpers.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 49 +++++++++++++++-------------
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++-----
 2 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 75de1c0fcb3b..cbedbb0078f6 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -57,7 +57,7 @@
 /// }
 ///
 /// bitfield! {
-///     struct ControlReg(u32) {
+///     pub struct ControlReg(u32) {
 ///         3:0 mode as u8 ?=> Mode;
 ///         7:7 state as bool => State;
 ///     }
@@ -71,6 +71,9 @@
 ///   struct's storage size.
 /// - Debug and Default implementations.
 ///
+/// Note: Field accessors and setters inherit the same visibility as the struct itself.
+/// In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+///
 /// Fields are defined as follows:
 ///
 /// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
@@ -81,21 +84,21 @@
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
@@ -111,14 +114,14 @@ fn from(val: $name) -> $storage {
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
@@ -127,7 +130,7 @@ fn from(val: $name) -> $storage {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $storage {
+        bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -142,7 +145,7 @@ fn from(val: $name) -> $storage {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -158,7 +161,7 @@ fn from(val: $name) -> $storage {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
+            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -192,11 +195,11 @@ impl $name {
 
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
             $into_type => $into_type $(, $comment)?;
         );
@@ -204,17 +207,17 @@ impl $name {
 
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
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -225,24 +228,24 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
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
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
@@ -265,7 +268,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -281,7 +284,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = (<$storage>::from(value) << SHIFT) & MASK;
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

