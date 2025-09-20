Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A20B8CEAC
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1114810E2CF;
	Sat, 20 Sep 2025 18:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bGnpftm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52F510E2CF;
 Sat, 20 Sep 2025 18:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTHo1PkaM3CX81mnyYlP2REtKOFuCZLYpjuIVQvap7rC5jtJxkSJ43ygcvaGdR9tEV1w7/NtIUd7rVHPM52e3BKXvOlKkhAXDzdZdZGlKqh3deoXV55UzZdWkfBouMBjnktuzsHHc0RCbCOBKLq8e7YUqbF9jPpOHkGlNKYEigxjCW3x0I4YmOc2TorD0yGk9woNS7SmDnwp/rBDFu74m2IoKiFSO/BuA+Hq2OrmQzjHigoIxRrnygmoW5getBtMONrok8sI7xi/IvFNQNX3TYrypeWPEjG6KKgbhS/jGQHAAKL2QuyevDEQuuvlN7Poe9YbLWg1Ykhw5SMil2UI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCUgMFP/ID99WRhBLRx1XUrPh8nG03YWX+xxN37diiQ=;
 b=hsocxYJtza40I5LSSKKkrH+Enj2ilcJ0dBMlVl3durN1Mv3qdtCul1gJth1SLKOqTu+033vDcLo4WKboL13KI1ichU692EaF/LUKG+inXx5Ayj8doC9sRp1VH9se1eizOzfdoXBeO40gf9SJq89AFJ+cIa7keJ4grmFQD8knRTvhp+4Hmj5V4cmab9UkpciFySgtyqEWlGqSASVTUhLtBcyW0TlJPcfaPLlrKqwiQ7ZWh5N3g2RQFvWHFeG7wN0oSNYfGtFWw6seQIFdytf46z8DdAdFPbPjzCis/KKJ8gsgr5ljxOp3g0NopU2nMCRsh/yENWDHk1t3iXYvePkCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCUgMFP/ID99WRhBLRx1XUrPh8nG03YWX+xxN37diiQ=;
 b=bGnpftm/2IOadar8DlmFfE2Cunm4Wb8rYBjGJNBbdMLQ66kX358yjdqIoyfTvBAkjXY+GsR9gsK69wocQ97qRNWopRnHQlqoUT8dWE92wyAZWypiHbvhHxVz32YFCqlfIQmPQ5oBNUaY6fdwsXilkFwmiSZpzX26GHWPkh87dYbHV5VYXOStPN6UDW/9bSD35sPk6575JQVkdMJBYe0Jfxq8JItmtyO54zmgf5FiMrBYu1wqgHpgI7/fRYOn+qqxZjUcxQJdEJAg9XfwImn8b6aBRakWvt9ogtgm4mgar2GIdsJotY2NxlIEfw8u9CDLuQL/bLe7YZjJyX36yCPWSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:22:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:22:57 +0000
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
Subject: [PATCH v4 2/6] nova-core: bitfield: Add support for different storage
 widths
Date: Sat, 20 Sep 2025 14:22:28 -0400
Message-Id: <20250920182232.2095101-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920182232.2095101-1-joelagnelf@nvidia.com>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:408:e9::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fa61cf-593b-450d-5be2-08ddf872b95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XOlrCdu7yv3EA6tpqiliy1tOQ/J1qZCrGZgs6NC0JOkVgeOI5sDFqny22tDX?=
 =?us-ascii?Q?sKvuaQOtdPTLwgVGAzsMkEJx+VNrR691JqXrkKf6iJnT82zkGawYnhYPm/L0?=
 =?us-ascii?Q?wWgTQvADhle22OY6OaQJbVyOjmwqtKS+TA43an8QIhVU+nAhFJSD0SGCUszU?=
 =?us-ascii?Q?3853NXQ6jnBPaCNPDLFe0tzLfKP5F1pf76MuXobZiWSyt+u2BEKjVdweCgLK?=
 =?us-ascii?Q?4Dd8gkPT7ptgfmbHTMLPQz1T23/Z1YelRF+CMSYW1MQuAMgo1jd8b7Q4Z9z9?=
 =?us-ascii?Q?nCAgKV/y+aBCx8WN46WdLwnFhi4/Xkcw2G7JIcog/2SfzE1km5sAYhL2k1t1?=
 =?us-ascii?Q?Nx+hm15MrbSy3kOrSdiZq7kOg+87KzEXQ3xnNcb01nrOqu1JqSjXDbVB8p1D?=
 =?us-ascii?Q?F1KtUI8A9XeGfHI44Ptesaj867hbkFHAy/X54v2wcOfYEfkXGMQU0+HhdTf5?=
 =?us-ascii?Q?3zlmKVaTG09+BkfPXglH7o6CT7pt4Rf7lFJu8UUCz3vbPDENymV4UXaoSLR1?=
 =?us-ascii?Q?/zau+6bG1EwdTPV1bzH6a4lepCH6B/FRvALGFfg9Mgo5PrqNbDCy/d31F4HJ?=
 =?us-ascii?Q?sNiQjaI787gBZzBcSTPmc6dw3xB7vZh3E9rcJ6PD42gqpvxtMt4RvJKOI/jE?=
 =?us-ascii?Q?9iH+MgZS5iv8zalQQNQDEsTk75DnxZdNFICcij7zDIIpEV/W/tvbPw12N0kk?=
 =?us-ascii?Q?vSuOPmS1pBBLqFtDcJfiE5ffp4G3itfPqWqiITn7JvneDiy6LETnigCTYzxe?=
 =?us-ascii?Q?RwGclBD3IKVv5wuaHxyCJ1jP2QxO9zKzK2n3keJvtEobTFPOZrvDjMIqyOS8?=
 =?us-ascii?Q?U9+6UPrf3q8GcR8L2VT8nmjcmc2kCqGokiq6Rewm0mSyjsvGoRWriOkYUcmI?=
 =?us-ascii?Q?Br6d1rzCrl5lopwbt53t0uyasuDNqZqOOUZnmG4YHhFV2xU1Sa8236FqlJqU?=
 =?us-ascii?Q?QpdJUpgzbdHj41i9wvxeGpCYBRprIE/l+dkurqlp+kYuLMVQ1cXHP9bsNtOX?=
 =?us-ascii?Q?x/vGEDmn0SwSjE399zp88IGb9XTyk1nKknv/IpI1KDnjkgrjzV7O7M+rpxmG?=
 =?us-ascii?Q?+F7rFO5+762HJ1PL5unnsyD8Uy3PZ1pXCx1y5rAb80RYc1B2nqly9fyiHra5?=
 =?us-ascii?Q?N6pOr4KWG6izsr5H5b2bZqKzwzM7XxI+TUh0RD9Aqsy73YzC3egWMzyu85YU?=
 =?us-ascii?Q?QT3DJkKoWV3SLJYMstQFDmSELyP5qDMvYNCMEjMwcDuUDiqKKjszDiUJa3GH?=
 =?us-ascii?Q?+X0A/sH0pNfcRxR6d1kYpxkQUjeKCMAk5fy76dY4iyADcefA+PYBaGlQwzXO?=
 =?us-ascii?Q?6L0gce1I/aBagxxjBS837odYMf4oQ6Ar/0OAC4ZtGFGzLemCvI51S7W3FKkt?=
 =?us-ascii?Q?fRTnLLorFJD+zi+v8+Emh3mwI+AVKvqbK+D7nA8AUMqt5L51cL/pGSEumCBo?=
 =?us-ascii?Q?26Z/5HxnGgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IIrJoKR37keZQjRE00vyQ+w5ojGlQLvLK9fYlIvaTvJ0n7/t8/cVx38SCABZ?=
 =?us-ascii?Q?0VN0D8Wi4LwmahrQKlwdq1umwbEXwWA4B3tJ8hcrOEesxD9tFUZ8j+B2fkqa?=
 =?us-ascii?Q?7YinlbNg2ca45ab1PucAPkHAJ8ZWhtUI+43Hhegxvr85wv5FEFGwTBnwvcT2?=
 =?us-ascii?Q?SsC9UqmQQZvNuruAt0HNpHr+5dDUh0ctVYuSSWW4M2jDMxmBUAwiqQP9uPWS?=
 =?us-ascii?Q?eICvF74RLGnC2s3ohCwrPe2GSvDu7bITyi6NzCd7q19a5KDyv63eBz4UbnSJ?=
 =?us-ascii?Q?YKXD/wOy/7bRTGglaCuRBFU9Lzt6DEVjd1SN9AuBuPw+9UNOpX+EFrtDdCiR?=
 =?us-ascii?Q?pu/RaMQ2mEAOG4rKUynTwguA/XEELt0yZpuZqX5t4lMRa3cZjdz0mtf+qZgf?=
 =?us-ascii?Q?F+CKgaL6p7ahQDx3KHPuFBxX1jAtyy12Mo0R3ZWVyXUaizxH5qkuogiWNiUG?=
 =?us-ascii?Q?E9DGcEN5qpJzFugRVXX/T662dBT4jJA8jGQpUEiaXU84c6bxS0UsUnxhHi98?=
 =?us-ascii?Q?QkwEnZTd/aZxEWI5C82HyQD++Uube1t2z/fE/cKlX/+3qgDOdIiVFIGAIaAj?=
 =?us-ascii?Q?0WyzifhN+5vGBRKXrkcBQYXRemdOmCtAigTulxWGrVwlCfkpHpAyxsMqz6yG?=
 =?us-ascii?Q?cDPBvJknzCjHkwqrVz+iG0VYsFZ2T2g7r3efGPYbGwn2g9QovidhZ/r2TH6B?=
 =?us-ascii?Q?5xCS+5Bb/pDrkA0tJmugILPxuXqlS3kKhqHEo5v6j3dkLFIk8enSBzihItjX?=
 =?us-ascii?Q?i6Meq+y+n/qLPo/FaHIjru0QxbHXdEK3WStHxWYvqWiYZhlqepQf2J0COWD8?=
 =?us-ascii?Q?28boHfHRdlX0xkAhJOe5fHXAj8+JD6mcL6kcw0YoJ/agNe9fKzOnXIXhj5My?=
 =?us-ascii?Q?+MCQg5Mez3dMsje2ZNLaduG/+OSodByMU94byWsv0jUmGDOa/8zkJP4Rc25A?=
 =?us-ascii?Q?wMhN0jSccjhOsvClXy0pXUcYobpbBd6UKpI6xYZE5S3THqMdqfzZdpJvd9bE?=
 =?us-ascii?Q?5KNvUUmhykLm1B3/tRSv8BtnKR/FBzp67Sp6AEEpaWAWNgzn0COL0phZAJvj?=
 =?us-ascii?Q?d3VHpKFMNd6szcYG3hIhb35PDYysF5Roc5qC/ZuU4MbFpY6gS1Nqn/6fwL7P?=
 =?us-ascii?Q?pvq4CGjHxdN1Wm9v7iN0pfy5sBu7MjtkjnM7J3tjtloGj1wi03IxREt3jJV8?=
 =?us-ascii?Q?+szTynOxVmnCN3SSoLr3ThydRHkEB4WGD40HWYxCgNm61QgenuuD647qWqvU?=
 =?us-ascii?Q?vkK2l+M2TVyVW3RmAY41BQUndc7FPLsxOSzE1bqv6D8JVIy0vG2DRTT1gcVC?=
 =?us-ascii?Q?TFwQ00clPxgXS0F2uT409ud2cx4VYq3ZYPZNr5qmVffsmHvmKIPI4n9Orv04?=
 =?us-ascii?Q?JZyr9g26WKYrYkmT2DgoUAXiOro9JpQKl/at6N8wudQIN62QPeuJLVDHJ92F?=
 =?us-ascii?Q?xEd11JqZXriSWJtpedo+7t4pPc49SI/M3t/ZKvBT4HGTQzsJEHQ9BcovIAkf?=
 =?us-ascii?Q?jqAsLhvwnnl29CSXlIh7a0MzgwhsbqYFhbqrK9rUgOPtvDmesmHtM+hdiQMe?=
 =?us-ascii?Q?d/FJ4GdnC2R1vcHPJeqc2rd9hercyaVea5HZJi5P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fa61cf-593b-450d-5be2-08ddf872b95c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:22:57.7481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxc9WXfTm0qFIjt7jZg8bAIJ4GqDK0UL+M7jyXj8M6lFgerBO3fJ01halnNNuIYGD4JbTx7nFDp6L/lQBOE8XQ==
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

Previously, bitfields were hardcoded to use u32 as the underlying
storage type.  Add support for different storage types (u8, u16, u32,
u64) to the bitfield macro.

New syntax is: struct Name: <type ex., u32> { ... }

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 71 +++++++++++++++++-----------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++----
 2 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index ba6b7caa05d9..687ef234be75 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -51,7 +51,7 @@
 //! }
 //!
 //! bitfield! {
-//!     struct ControlReg {
+//!     struct ControlReg: u32 {
 //!         3:0       mode        as u8 ?=> Mode;
 //!         7         state       as bool => State;
 //!     }
@@ -61,6 +61,8 @@
 //! This generates a struct with:
 //! - Field accessors: `mode()`, `state()`, etc.
 //! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+//!   Note that the compiler will error out if the size of the setter's arg exceeds the
+//!   struct's storage size.
 //! - Debug and Default implementations
 //!
 //! The field setters can be used with the builder pattern, example:
@@ -77,21 +79,21 @@
 //!
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $(, $comment)? { $($fields)* });
+    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
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
@@ -101,20 +103,26 @@ fn bitor(self, rhs: Self) -> Self::Output {
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
+        impl ::core::convert::From<$storage> for $name {
+            fn from(val: $storage) -> Self {
+                Self(val)
+            }
+        }
+
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
@@ -123,7 +131,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name {
+        bitfield!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -138,7 +146,7 @@ fn from(val: $name) -> u32 {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -154,7 +162,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $hi:$lo $field as $type
+            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -188,11 +196,11 @@ impl $name {
 
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
             $into_type => $into_type $(, $comment)?;
         );
@@ -200,17 +208,17 @@ impl $name {
 
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
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -221,29 +229,38 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $hi:$lo $field
+        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
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
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
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
 
@@ -254,7 +271,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -269,9 +286,9 @@ pub(crate) fn $field(self) -> $res_type {
         )?
         #[inline(always)]
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
+            let value = (<$storage>::from(value) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 945d15a2c529..d34c7f37fb93 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -276,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +357,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

