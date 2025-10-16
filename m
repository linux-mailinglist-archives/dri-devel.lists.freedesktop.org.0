Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D5ABE4263
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142010EA1E;
	Thu, 16 Oct 2025 15:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aqCQM8zJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013041.outbound.protection.outlook.com
 [40.93.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DEA10EA13;
 Thu, 16 Oct 2025 15:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB3MmFQSz5pyb28gCiw8bpmesMWt6AwzIkfRdb4ATReTiOwrEjoOVCmOUBn8pjNEkAZ1OzS+KT/ssoJoyDr/tjdWYKOdNajGYj7/HVbtzoegqcipKnnPHYOX/Mf1iFxgSfZfwKvBM3dYRQBdvEi6SGhRXUdbab+Bf7SkaBh2VEpPMRRH16L/HSXmhCWP1H+M0UWgEzzdEzd9u+iBno76Itqphl5TCXExbbeyrJiByNkWjHKoiQ0IMZI1InZXalYi+JRdVGwZZkxo5KMo7F9ez++4uUUizgVhQQfOKhUNOs6pOlKTmCELD8FZVTq7/A6NkvGQNfbteQ+/p2ipYBP/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TazYopQhfj9fBNDwyQfsHCkjf/N0cmGySrdPC+y7YyY=;
 b=WJJqS34d+O7sBZA+oqR4bzFlSn9o776Z+tIXXZ2wOdt5Vw6sZsMUvohd00Iq6yjTo1QQy2keszPgOExaBg/Ds2O9BUDPjc60UKTRn8hQq/gXyfKEf4J7jcTNul36pGnd/fm2KfNhEh2DYUICpTxNjVM/OclYYo2f55oqN4dX64xhnHZwzjGKp4w9fI0LMWu1PL3lqC4f+4lbJRyG9reByMedBdlRf0ZqwrqTMoaDUJuKweE0Ml1yzn5nHfY2CQXqIDjj4dUcSGdu2wYNKQ8f08THhxB107zskXXCRMUh54RbUQUD+NFTTIggdH3O7mCF4TVS9XbqRW5sSUBXOshURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TazYopQhfj9fBNDwyQfsHCkjf/N0cmGySrdPC+y7YyY=;
 b=aqCQM8zJ6BoTFg+/09TNdY3gJXDgdFcOeJHGOsm+Zk8zgWU3b4OiZjMneRl6o1EVFSUJUO6N4AuRwCT3X7OqE9XGwsfClRdMIRKwzJAtYE8uvs2m6975muBAdqv0z38AGZIwuN4z0vPnlK3IPs0AGtrT8/Q9lJsgQiXYll+JLzyJr8K4T3vgHBTO29MZR3jARiCxuN/MooH+AX6j2PKyCOaJL0BiK19w8J1VOEsE4m6tShcvvNcZ5mkMgCBsjEtKf2sXqwITLGumpqiwwyxCLtoDGhMydJQv/jyq22mtDil6XW5eGMsi+RcUKtsB31kjOBlas+8+XRxam0o6lcOq4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 15:13:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:13:33 +0000
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
Subject: [PATCH v7.1 3/4] gpu: nova-core: bitfield: Add support for different
 storage widths
Date: Thu, 16 Oct 2025 11:13:22 -0400
Message-Id: <20251016151323.1201196-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016151323.1201196-1-joelagnelf@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0321.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 21011d9b-9504-46ab-b5fe-08de0cc69271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E3pHersiJs6n1lFW8unyY43Zjb26iFrzMpJDmbiShSpRnBV3oQxccwLOJ7ro?=
 =?us-ascii?Q?0vHoLjaKSUtvfK2inxmKCZYaZBe8a1UZwyQX3+UCeD4rV7LwkQEQf3rT/q0+?=
 =?us-ascii?Q?E+q1EaoOVuUjGAoy0oqi2xlEADafTbn8GbbdWe8Lq0rT9jKi5faODCqbZjQd?=
 =?us-ascii?Q?lUAss5BEcoZSl1svJf0CnCq3tC7M/1lurOKkkgb5QY7t3AqQuunFoZTuZR6a?=
 =?us-ascii?Q?IvmQvDp2kit8As8/n40Y239FD1HDFBwURd2uCx+vIplOk20q9E4aKIsNlQfl?=
 =?us-ascii?Q?9QG7PpxraurSvF7Zzmn3FyjIZWDq4JefnPhTYL8KbqO6T/I2y/r9nU3pbZmy?=
 =?us-ascii?Q?OTO3ho3FsJt+TqgvJTz6rZDV0v06GzXMDoaycrxNVq+BmWEp/6gTR1tpgyN9?=
 =?us-ascii?Q?rG9cJoj//rAPeTHFhe5PYHlqSxi1o4BI6yoPfwe58IeTKqnO1jBY0dOQickt?=
 =?us-ascii?Q?O7qIWsllrbLELXsQMeHHM6KWOP3R18IbUdIzb7qcALDMXySMr0fj1z5ZFlLV?=
 =?us-ascii?Q?MzB8mKC/KDGaYNlQYDVIVOHJycL3MJelO5e//3RRluPchMcxz46/tzZFl3ds?=
 =?us-ascii?Q?dMqPpV5D/8JJWRMtSGEAPbtmqqICNvwFWjvcLsYtR9XJp3E+6pZ5lXb/YHN0?=
 =?us-ascii?Q?ma6f1k36NElvQM5v9SrQENdF3guBY/gSOi3I4nbJnnEI2x6Sc0msrJqt8yF3?=
 =?us-ascii?Q?ShvSk6qkfhqwnfU7KmNa1BOAt/XQACcG6coHVfEby8jvBrEQBGf7kQI8v+NP?=
 =?us-ascii?Q?beYDLxXwviKQmi34IbOmzvLUp+pH6km4fIbZCylJ97TcAzLulTGDqHuvsPRk?=
 =?us-ascii?Q?9j4RN8Yb5fueJ1YmTzJxxrsNpLxorQ3wwLQpPfwCI6bMIwVMbm/Pcxv3nl9j?=
 =?us-ascii?Q?chHUyrYGqPB2wW+B0bOPWLu/jQvGSLCYsqAi8LQyzR7PR6nmUYJdSt88QFdP?=
 =?us-ascii?Q?W3M/huC8rQjdDWkxII2OjX7T0Ru2ZfXbooYI0LwrijC7HHGRLqfgCoQPSNVN?=
 =?us-ascii?Q?s5Ocm9I8KzXVGkbgGzQxNvrdU2i1rJWpgakVfS0jOKKG9gCKM9wqTSBH39Ab?=
 =?us-ascii?Q?pN6eYWp6R9MS3TWZ80/gPTkhI9GkEIZVPjWM2ul8Sg11vSOfyBbg6EjTbg0S?=
 =?us-ascii?Q?fZa5dVd+0I325m6pe8pUoFtmpHT+ih3ySYfdlel2bOGN6CqOz11Fsa4mZp32?=
 =?us-ascii?Q?06raHyxkL0/j/eyQuxek33m6YLRcDLLJv10RUrst0zD5ML1/slHu2Nm4hBm1?=
 =?us-ascii?Q?jg3MpwjrRAs9STMg3ECDM8jRqoOZHqFY8dO3CbOc3wZNYZZNSVSFzTQhBJkh?=
 =?us-ascii?Q?9mfE1Vq0195OkCGUANafeDXe2DjPramfC4M9zfhgtn/MJ9iUVp5ulE1d2440?=
 =?us-ascii?Q?Kdn5QCpi3Npz28lTKRPknNY7KEY3D1AnOicQyr/ln27Rxa0kOGT7wtU1RwJn?=
 =?us-ascii?Q?1jU3Nn0xNE/gLO1Z8PpcC0EWR6AvHmRq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2RfIT6ZVL99CDnPNIe74gyGZBmZC2kKY8U8DISu+vcKkxuyebDMHTYJfDbfG?=
 =?us-ascii?Q?jfp9xd0UlPdc1Ez8vg+pTCmio936NSx1uS+zPf/58oS+W9vyVLzTDCxneSNP?=
 =?us-ascii?Q?2QNssQiZDTcbP5tBGvccYjpddhj61zA1WoPQr+sF1MZJRmGrl/Z00u4dDTw2?=
 =?us-ascii?Q?SKXN1vWOzEqACIvM7m8f6b8lX+wzjBZ0/guSQl5pZ2UJyUwI9pxISBffznST?=
 =?us-ascii?Q?dKm3xJd42tNA1LRX7wJRUAJuW+AbumHT6lRrft5hWJa7gOohJILrArIzIusK?=
 =?us-ascii?Q?Ward/Hu6Wz/NnEItBaP2tkNI9gXdGcY9UqgCFymWPX8VRSCBWF/VbU5lGnA4?=
 =?us-ascii?Q?J89tPGwjMwBLIw3SFO/gEwvUkignH2nNmVL8N48pJY3nAPLrvNhnl6Zaa006?=
 =?us-ascii?Q?HlWn1kDzyY+tIcgTZ4/WuGTbU1sXKj0ksiHK8R6l2e0A0jofpLHsb/5aSn8z?=
 =?us-ascii?Q?7I2I6/TqwuNdOpqzRnwMGrOQU3J+EfPFA3GKzTd8JVo+AiixTA0XbXHQ3U3R?=
 =?us-ascii?Q?PVE/QABlm5wQnb+Ss2zQ5yvF3kMJjirgwCHD3uwayMSD1vJEYOgHi8jV5sqB?=
 =?us-ascii?Q?UZoQ68jKcc2KFX9zhudyxOh1ELi64m9u3rTZrKFEqLQCVlVsAbGSLadBufsu?=
 =?us-ascii?Q?p5sLOKo30YxPjCzH+F/mFX/o+Kle5g3Jb7BVj+i0RHVNcQuLt67CqOclMDjn?=
 =?us-ascii?Q?l3WYo+aN54YuC0sbAmo6w5CnVmjOIlgQvuSNwT3Zv232vfuWcvI74AfflFHG?=
 =?us-ascii?Q?0fXCk9gwX5fREZ3yxT0ZpQTELAU51sEamkc/qILzMEgEqhmfIK6mkaxGMfdy?=
 =?us-ascii?Q?0U6TjmjklHq3WJNZoefI/X0dOW+g0DS+hSS036pIcQK/qvaRIeKLgDboYf4k?=
 =?us-ascii?Q?MYlzn8Gjh52YMxh1FKvpz3+NHb34AjPS/iyLBQU/F/RpvQL15oaufVqzcXpS?=
 =?us-ascii?Q?8lETAhc2i8pa6oMsQBPqGHNpd7msLqP5LxMGELsfqKSuUvyOhonP/J+QIG7b?=
 =?us-ascii?Q?66U31iz7yKFXP/O87lbj+13ud5G1jaBwinc3mbGhQ611lGset9+LJkO+2DLd?=
 =?us-ascii?Q?zUPPHIJVzJb38tADJo5PXvmr6f9WGSOH0iaqR8sIL1MrCsOwcsUQS8xKkFew?=
 =?us-ascii?Q?Tx8ZePb5c+5jl0X6+ll0CF//s51gB3xkNsOn+hYE/vYxkTWe1xwk7wzcSfEg?=
 =?us-ascii?Q?yTu6h4NT/O6W889yTTBsd+AydLePUE8AW+UN9SfcnNs62Oj23Rn0Dpy6/UcA?=
 =?us-ascii?Q?jrr4kE9jSD6lU4gPBbzDW7/HjCwxAcK33shlE5Yadiv/VwgJY9dhrZd/Mksg?=
 =?us-ascii?Q?ZrIApzmUvaEKGVvTPrpQ89waH5ErgU21W6G2d0X67Bbfc/aGh942i/3bXoev?=
 =?us-ascii?Q?a9Ey+rtAtkBxHgbCkO+Rhx+hGpwTAQ5WzTfAn+tSwlz6gxdUOSdGbZVkH5/u?=
 =?us-ascii?Q?gMRvRE11pcm4uxZiEBQn+79JnKdJKNsyZ96JxzYw4JoWjiYEGxETPiDjO5zb?=
 =?us-ascii?Q?CfAwaX7sIm3taM+d6MYU0mgjwDvjyuqfcoUxgGjnpQcBCJGAwjQXmZ2rwsMB?=
 =?us-ascii?Q?qiwJIG0uG8tyWq+yHoRj27g7aXD1Bhkbkfx6iAqR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21011d9b-9504-46ab-b5fe-08de0cc69271
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:13:33.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL/Zqe53/nc5+C28Bez9FYYgggaVEGz1z3oetrSHwPI4P174iB6xjGk64gMVGiSWBIeUN/Z7Ej0ZdfMv6loFoQ==
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

Previously, bitfields were hardcoded to use u32 as the underlying
storage type.  Add support for different storage types (u8, u16, u32,
u64) to the bitfield macro.

New syntax is: struct Name(<type ex., u32>) { ... }

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Reviewed-by: Edwin Peer <epeer@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 65 ++++++++++++++++------------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++----
 2 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 98ccb1bd3289..998970ff0bbc 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -60,7 +60,7 @@
 /// }
 ///
 /// bitfield! {
-///     struct ControlReg {
+///     struct ControlReg(u32) {
 ///         3:0 mode as u8 ?=> Mode;
 ///         7:7 state as bool => State;
 ///     }
@@ -70,6 +70,8 @@
 /// This generates a struct with:
 /// - Field accessors: `mode()`, `state()`, etc.
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+///   Note that the compiler will error out if the size of the setter's arg exceeds the
+///   struct's storage size.
 /// - Debug and Default implementations.
 ///
 /// Fields are defined as follows:
@@ -82,21 +84,21 @@
 ///   and returns the result. This is useful with fields for which not all values are valid.
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $(, $comment)? { $($fields)* });
+    (struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitfield!(@core $name $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
     // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
         #[derive(Clone, Copy)]
-        pub(crate) struct $name(u32);
+        pub(crate) struct $name($storage);
 
         impl ::core::ops::BitOr for $name {
             type Output = Self;
@@ -106,20 +108,20 @@ fn bitor(self, rhs: Self) -> Self::Output {
             }
         }
 
-        impl ::core::convert::From<$name> for u32 {
-            fn from(val: $name) -> u32 {
+        impl ::core::convert::From<$name> for $storage {
+            fn from(val: $name) -> $storage {
                 val.0
             }
         }
 
-        bitfield!(@fields_dispatcher $name { $($fields)* });
+        bitfield!(@fields_dispatcher $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
     //
     // Used to simplify the matching rules for implementers, so they don't need to match the entire
     // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident {
+    (@fields_dispatcher $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -128,7 +130,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name {
+        bitfield!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -143,7 +145,7 @@ fn from(val: $name) -> u32 {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -159,7 +161,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $hi:$lo $field as $type
+            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -193,11 +195,11 @@ impl $name {
 
     // Catches fields defined as `bool` and convert them into a boolean value.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
         bitfield!(
-            @leaf_accessor $name $hi:$lo $field
+            @leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             bool $into_type => $into_type $(, $comment)?;
         );
@@ -205,17 +207,17 @@ impl $name {
 
     // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+        bitfield!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $hi:$lo $field
+        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -226,29 +228,38 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $hi:$lo $field
+        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+        bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
+        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _MASK>]: $storage = {
+            // Generate mask for shifting
+            match ::core::mem::size_of::<$storage>() {
+                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
+                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
+                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
+                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
+                _ => ::kernel::build_error!("Unsupported storage type size")
+            }
+        };
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
         );
 
@@ -259,7 +270,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -274,9 +285,9 @@ pub(crate) fn $field(self) -> $res_type {
         )?
         #[inline(always)]
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
+            let value = ($storage::from($prim_type::from(value)) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 945d15a2c529..ffd7d5cb73bb 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -276,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +357,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

