Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600C7B8CEB2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3FC10E2D2;
	Sat, 20 Sep 2025 18:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EMXO3ex1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04510E2CF;
 Sat, 20 Sep 2025 18:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqMzXIdDcnNbK/j9tgF05nvqpUJRe4CVG0aCsCs/V38DoI9jKol4C4kSVqfbpg1AGzr7GGrJkKjtVJKS8qLHIo77wO25ClWZlJt2l6bpasJBev9THSmq8W8rryHlk7GUMngm44RVbSSNceywo7HBBaTb/BkStnXcUxWBkDJ3SgbR9QKhqI3VhBv1LqRRqTA6iMOv6EADR9ZvgLeEMLNZ4hssbl6/4klyTBq05quVD8F/yw2RB9ixHCqGk+M69osUIA2iWxs31Xn3u3dIdlpP20b2nKN6NEfTI1rW74hAva9ylatsptwGSdHueH8z6cBy0YQ/foI1/majEjnP38KYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNoiL7B8fEtJ9MOUwLuG5ru/acGE8hBMJAHxC36pubk=;
 b=QDx1AvuvkIfJSSyVJASy4dx46fpGSQYE3D5Xi6SI4bcw6Rd4VZXYOHhCxi5UPBLpfoyWTQ9ntz+XAZKesQQhpgmMKFzZQo5RXoIjzfw7IU6qgsIMPUX0QegcRNEMPhZs4v1tbnOcUkk2zOi31DyqvmS5D3eDnP7uIidPEhYDe7+mn65RC4AMv+tCJNGj1RRWbu3Rq6aVP6nFuXXx9/PymFyn91cY6VHhCyuk2t4AyUwxXKnwZes138iPIo4P5MvG5JYgOjlQjjCmCifIKCeU6kX8WaR4Wc3qMF5Mtl+reF8M4MK2y0sT0lI2eQ5N9VUIZZgGkJCQmCVjHsFAxpOQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNoiL7B8fEtJ9MOUwLuG5ru/acGE8hBMJAHxC36pubk=;
 b=EMXO3ex1MA8wSsKy6+UhJhqFww51pJ+ie7gOAHCAJutcvJNBRvmB+yEYcp+WvaAveH5yFCgdsQ4JcYXbJfOxmXe4XdHzqM7VB1LGYsbyOW+suIQuKCRCXdCM45Wrz4En1w7/ACT5RivrIpdrmMJLkHu2V0B/NOBbYwyQQfEGfxCojnKyYiO2HnX6EFth+SBIoCSdV2mL0jiUt/16N93+6IBm1qNRov+qKwUJqUTfKxMqKyM+2Oh1/FIRc0VYjy1NKiM/q5lCtvbq5vmO+bBiP+oBaIpryLW2vvMKYt1SlsySzP/lgBAoz3eE5dZvFFfU91L++JHmNxL7Hbef8Ol1/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:22:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:22:59 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v4 3/6] nova-core: bitfield: Add support for custom visiblity
Date: Sat, 20 Sep 2025 14:22:29 -0400
Message-Id: <20250920182232.2095101-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920182232.2095101-1-joelagnelf@nvidia.com>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0003.namprd18.prod.outlook.com
 (2603:10b6:208:23c::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6891d9-fe49-449e-1af9-08ddf872ba9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4CGrEu0wxUwwhGDbALNeE7cx2oco3fm5e1+NSt/ELlk0SyKFbXZXZ5p+fh28?=
 =?us-ascii?Q?8TStG1xXLDXzVJkCSSOz8dn9+TJi7nysaZAFbB7+kzyR6xMbSs/7AKni9j2o?=
 =?us-ascii?Q?bm2/VoX1jIfaTCtuAr3YByb0d+PZCuVrpLX6UTL7h1wlK+Z3WFXDdA9thIWr?=
 =?us-ascii?Q?mxl1xezZHj2vZSw9KGpAkn0BMx9MXVKk6uhqeVTFov4RHZVOWAj3V3mQ8yBx?=
 =?us-ascii?Q?4dUAqCU6C3GJfcRcMT5Ec7A16pMyW7vbVnXvmRFkF2ZUo+lP5MggGWCMDwPu?=
 =?us-ascii?Q?VstyhHoK5g1CuAcnjMUZ2tni6o/yjoqk5BfaNS2FEh026lLQoafzPZ1NMrVe?=
 =?us-ascii?Q?1ReEdSyrpsl2iH2Z0TVWeGX1V0UeeSR/xLH+rog6b5U9XiR1GIR+aQrKnMMd?=
 =?us-ascii?Q?FLUIqGLViVuziRP8zo5XduzCEvWWJXU3tCLFbcs8Y99Y8kK9+IbsVGB+2RSt?=
 =?us-ascii?Q?80owqDMsj3FamAGlm4p6U2aa4EYQx2x3+zVyM6er7vQMv3NFjI00m6t2lPHM?=
 =?us-ascii?Q?HxGpbKIvR9STm+Zw3TUkL6WDbsY6KapoQjhlsAum5bOQ8/JHOTGAH+7kG0nM?=
 =?us-ascii?Q?24Ifjf395ztfhsltuC5Hjo9gCK8u0Z1IMfO9i9LlUjfBy4T2hatI/4k4vGhG?=
 =?us-ascii?Q?x/EVRpoZKXC77al24zZpBhhkAuqDymn87+HLWoksOb1eMdW0uDoYRYUcWcDA?=
 =?us-ascii?Q?HO/DlkgrixYsqQZJGvbclraf4FwiD/UJ62GH9/SxfRVPmg2MhjuX/TRZH8LN?=
 =?us-ascii?Q?GMD0GFgVCLIWdA8HPY4YOCHGA27QwaqZgcW0F6NMbQ7n1GP/sqtj85h/f9xj?=
 =?us-ascii?Q?QfRu7Q4R9QB/FVdQvwHp1lqbjZDVwxQPlRJC9hoKbNJbNsWST4f7uuY751lV?=
 =?us-ascii?Q?wKamUDTjAuUAI23c6guXQrkfyeT2PqHkb93UcP1SUyFHns43aTv+b7sRp4yn?=
 =?us-ascii?Q?ZVcH//zC+aPs6qg8I4rKHm973ScwoxWsCkYZAFmNNpzYHdx/tOu40Ak4lUWY?=
 =?us-ascii?Q?wPkP02Wwg2qkIs+QvIUzlpdxaL471RSllAljXnsdLUJU4Qm9clo6ZfJPEXJ7?=
 =?us-ascii?Q?PAAb7+P+gP0hZKvg3fYb9c6SIl6GbUSb8wWyQBzQtiMUTZJ+/EFEcefS3pzD?=
 =?us-ascii?Q?vzFZbVAwJIC1uCie3hRTYa6ZfWLz06St6q/T4YccfscKjwJKvZDJvq+Kmusq?=
 =?us-ascii?Q?CiT/LSGFYNPBs7cPHbS0z42cFYpEQX0Dqv95FC+MAyKX+vV7E3cxb7ZyE/yL?=
 =?us-ascii?Q?liw2J6M1m4H/SX/qpiToN8ZjoDvCW8saUeexry8HJfFk28FcGIUndfJXg0JC?=
 =?us-ascii?Q?TJgoUzoEaV4PN5ZYJj6YnvxbEFVysgWc7/u9wYml8OHV4s5T0OyHCnhNq9Rx?=
 =?us-ascii?Q?noyu/VE7AjyoIJ+8S7KZXV4meYCeaTES0AM17zAkg43QrrfrCCsXT6z0geln?=
 =?us-ascii?Q?V2Mn7hWfhSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehAWYnHyhgv6czbPhnRKRxK8Y1QDD5veK17p6woqFcBoIz4yknxdSH2UP/VG?=
 =?us-ascii?Q?GoCkNCyoHoxRbWb7NG8VauLyCnB0QOggDF0ttLjQhTWugimRz+N6FVWQeb+W?=
 =?us-ascii?Q?lqBYL93im4S0dpSE7m2TsGGk9Fj8dX2XfqcvV6nVthyBHendD8JtIEd2Ea7r?=
 =?us-ascii?Q?QU2BjmneKi2BWdQUpk0b4jBaLy7NX8J98lemai/JCliUrS2WcxWoKa+Hjuxk?=
 =?us-ascii?Q?W3vQQWjGJTXl8BF4eUSNg15Ak223cA4x5GguRaOflaqjNjUnT5ld+e845APQ?=
 =?us-ascii?Q?w3c56VtlolQqofhO2K+5I3AmR+qNK1IO/mQ8GLPJIMEG8aRp6WlDkaa6NtnW?=
 =?us-ascii?Q?Eg8iEIIhIbWwQab3+mvtE7Kd3bsp1/hAHOQARiN94B/fDYFhl1Q/CGPWvPf5?=
 =?us-ascii?Q?PObb2OUO/W+0X04j/9Nm19387ogbqv9tPC0RcRFWf8myxjmkDAj+u36YgANt?=
 =?us-ascii?Q?4i6w8fvDEbH75Pm9Y6jjylcYXQcUED9wdxkYptmSfcc4KIq735VouUI568Fx?=
 =?us-ascii?Q?k1MzbwSSqBgA3M9AiA+yFRqvIqrZHYqKliiAqj5mlFH9xPXpOph7v+Atpxwi?=
 =?us-ascii?Q?4CPGt2utwIXj2ej9qEY7zXgy4lvP5T4z49kaGB8/CmSOt/eRxvqjrBaoUpse?=
 =?us-ascii?Q?oCwXC1jcqaKRx/EHOQ6DSWaLLvv61hUDVGA+UQ/TC9ArzEOVXJU34iWPiVZQ?=
 =?us-ascii?Q?gWUaQsfoZv0mKtF0WbqMI4T782Y3gAfLc/Rp+9hRiw+DV4VVDWEqkGv952i8?=
 =?us-ascii?Q?Us74Hzevsw+is9W23Ib68TNJn58RSQhJjR6w0g0t/xbrRJ/8kMzVCKWUrCl6?=
 =?us-ascii?Q?HGJaRWKI0FkC9Przv3R3/t0yQtWavEtlFMI5hfEcf19CYgAVkI7Nx2RUWBRK?=
 =?us-ascii?Q?R2O2kO88fR9d4CBlYhTbl1oH0rnHBkWAMgXJ9cCDOaBWoc+l9PPdu014VQkX?=
 =?us-ascii?Q?NI8OrIfmp7BNsnWMTdAxttuLQ/4IUYyYPdhPvastU9B39VcmV+/ZPVkScMqE?=
 =?us-ascii?Q?dLXuUngerFXJZiR0iJFos6DPfCvnQ/5khwk98NI3Nfpp5z7Zj8ssPD5YvRl9?=
 =?us-ascii?Q?QsGCaCg5F2YzvwZ4x/c2cgLswq0NKYUNQoqfVu/ZSxlRn4z56uvYHOE7VgT7?=
 =?us-ascii?Q?fZnJv1lbUex9ztuKj5LzMAwnaidd+NPqDh5m88KzusDhStTTLASJ+L26tYzj?=
 =?us-ascii?Q?P7r9yI2nYNwgffbw/fzL2JVSmcZtB49mZaVnPk+9L1C5RK/uJgKvjU3QuSuN?=
 =?us-ascii?Q?EGciyQ/kU7OCuGOxB+opbXIJsDBG9frPOo5HGPD7Rvxu1VyQUXtTVgjOA0gM?=
 =?us-ascii?Q?Xbskw7lgpBgbtDxr6/t86O18p3Fn/mWbvB3+LtiZXojjR5EyEcq62FIluFac?=
 =?us-ascii?Q?y3nEe1mgKeNxGMwgF07fce7UA0uFrGbWF99FfYoa+ejIRedeJlo06lfC034w?=
 =?us-ascii?Q?XBDfKJvtT2/d4bfZvAV/v6iXO+wp4QOpy61zeLwfBmVFuJ95FH304TCPX8t+?=
 =?us-ascii?Q?Q9v0C46N6vjWBe/FD/RrCDyn/NbMNB6+EFXOqtxnNzGYvVoDZOGSPMAm0WKx?=
 =?us-ascii?Q?NIXUDO+9BByY7ksEIHj61m7jkBQhvEwlBBIjWHSO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6891d9-fe49-449e-1af9-08ddf872ba9b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:22:59.8367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4ewPcGQCtjRViT0X9pu28Pz3U4zIYMC3+SVWh/+7JsmIvw8F3Gu2990P2DASogAQIkZwkmjBsdzxrPVGKjC+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 55 ++++++++++++++++------------
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++----
 2 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 687ef234be75..9c022fc2bd6a 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -51,7 +51,7 @@
 //! }
 //!
 //! bitfield! {
-//!     struct ControlReg: u32 {
+//!     pub struct ControlReg: u32 {
 //!         3:0       mode        as u8 ?=> Mode;
 //!         7         state       as bool => State;
 //!     }
@@ -65,6 +65,9 @@
 //!   struct's storage size.
 //! - Debug and Default implementations
 //!
+//! Note: Field accessors and setters inherit the same visibility as the struct itself.
+//! In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+//!
 //! The field setters can be used with the builder pattern, example:
 //! ControlReg::default().set_mode(mode).set_state(state);
 //!
@@ -79,21 +82,21 @@
 //!
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $storage $(, $comment)? { $($fields)* });
+    ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
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
@@ -115,14 +118,14 @@ fn from(val: $storage) -> Self {
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
@@ -131,7 +134,7 @@ fn from(val: $storage) -> Self {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $storage {
+        bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -146,7 +149,7 @@ fn from(val: $storage) -> Self {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -161,8 +164,14 @@ fn from(val: $storage) -> Self {
 
         #[allow(dead_code)]
         impl $name {
+            /// Returns the raw underlying value
+            #[inline(always)]
+            $vis fn raw(&self) -> $storage {
+                self.0
+            }
+
             $(
-            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
+            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -196,11 +205,11 @@ impl $name {
 
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
@@ -208,17 +217,17 @@ impl $name {
 
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
@@ -229,24 +238,24 @@ impl $name {
 
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
@@ -269,7 +278,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -285,7 +294,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = (<$storage>::from(value) << SHIFT) & MASK;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index d34c7f37fb93..6a4f3271beb3 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -276,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +357,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

