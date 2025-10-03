Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D0BB75E8
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1910E93B;
	Fri,  3 Oct 2025 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lz/ZBOUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996010E90A;
 Fri,  3 Oct 2025 15:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+8LvHn89dENH8Q/e+XYDFEfnepJ/fBFBauLKPEnMdrlXtJajXu5AKY15KJWVQ3osth3yJTSbo68XKqn/a7o8rjpQt3f8Y5NnBVinFZ8rQF/ccNEqoU9kABmsxXJY78KRHi8DPxywCq99Ecy02vqGIUrZdlDgIYTqmPSdsRk4N+99aiukE+JfauxscV3lDTy+jTu3vHooVzeJSYPNqYGsr4cIl98BtcoPDq7YF4HP8QEmU6KPo9ufS2BlUbTDl/tKoNa/Zqw4Yh0nn6mvAW5Nd1+VuofuoPA4IGbrM5JqhyCSKHpmab4J5PmbSECk5tiuN7h3rf15O9HdmKqnh3fQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WtHuucVr0mioG8hMK3CYr/acoECPocCMbDaWYL6yQc=;
 b=NS8tGEAcNWrYwbB3Joglp7GHOmWt/BOccINr3SX5s/Tc7nvBClgW0AfW93BViCvcq38ErW8lOhkJvhIIF90oqjJ40gLLgzIURW1fUMPPRbCIdAhxpy5o4rgFEBdUdjrtWodfUrwBFgKyMZ3WsTV9EpCaVM3A0c8YGtYEZgndyC+B1C5X/YLaEHkCWu0vjPgB8HnPuoxzaH7LTWg/N6kapLE16ysDt5Z83EURwrI3jsuTZ2ppp1u19OnTgVxuHUXXRKW3kTe8eXHnT+yWDZhh3E4QfaafRmzLvvoRr/cQs57DlJKZLGGD7KlLdW4t4JJgL7Uq+xeUpX4xMpvoe+enKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WtHuucVr0mioG8hMK3CYr/acoECPocCMbDaWYL6yQc=;
 b=lz/ZBOUCAuPfuRb0uzs45Ofhz1J5oWFhBwB39Ig8zWlVJNR38elMwqZ/ziw/VXzoQ55D2JOd4QZb9vYyrFDgMPJNMFmmo53o1Ox9WGgDQnCaky0nBtwMVtsnYZrLuQf1GaDNZgiWe6LtDn+usmQVWxFMjjrwsXxzJTZFy/RVCTeQr+CfoPv79bUM1T3JZBU6hib4h/EaGq2Y8H15vunaxWMTMBCqToy74axwatsJcuqOJw3sK1XHPJg68mS+jQ7rulP714NNJHM/YX84FGucnXgwJEloPiC0jRY+aODj+OEvu3U3YP3sc4cWNG1UFtR6JDpnkMr8eW3aw2WKuBA92A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:47:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:47:59 +0000
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
Subject: [PATCH v6 3/5] nova-core: bitfield: Add support for custom visiblity
Date: Fri,  3 Oct 2025 11:47:46 -0400
Message-Id: <20251003154748.1687160-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 088bd8cd-c219-4822-ee74-08de02943a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0j6PKnmBa6hyVeLasbw/li9Qpi4T9BcoFIRL+dsVRxqJQy1w+qHSclDbgujk?=
 =?us-ascii?Q?LC5ny2L0byG4PreHHNcdcchHbfDPDrXuw0KtdpcTpgh+6po+GeQ4vyV3cJtk?=
 =?us-ascii?Q?JICPgKMiT2U1utvXQv+6VcKu05rhrviBD20CxfliXGE+qPsd4T37DSGIJJtK?=
 =?us-ascii?Q?hqIzWEUWfTjyXYuXbfkXbOT04FDRnH/yRUnzdPG/YYW4XfxsmHfh4w9x+W5S?=
 =?us-ascii?Q?U7pSW5FDp0vHn5zN0PZnXtF0wE6a/Kog9CzD41pkbahmKLeNJBZbWWTFjOKo?=
 =?us-ascii?Q?BjBJCvRT35O1JljrxJ3UFrZe0v7qNzHwvZ+3fHV6rbd7hlSwks2Br/Zrhir2?=
 =?us-ascii?Q?kWS323DhrNEkdQX3UxMXCkEVmQ3JxVgarii1JIW9uqFoMS4mPZr8UrZMPITJ?=
 =?us-ascii?Q?/DcXb2GHFZnghvOMANnm99wGdNSivTUWQZEfr+rjLGDSZl/+F5sQfwQPn43M?=
 =?us-ascii?Q?DGULAS/5HcnIDRu940vsWzJZ7IgUP29I8K2qPt/PKnlbh6vUrvraWmBoZ8/q?=
 =?us-ascii?Q?lMrjwlSogsZy/k2V7YztE2kXbZJQjKL4VPAPxx+4kZ1YtbIvdshm58nsFcit?=
 =?us-ascii?Q?Et25+nVuvL7qRYL6vdZsGnPA5HJ3/YRoeXgX+JdYWN4oz2ENGaKxoJem5plQ?=
 =?us-ascii?Q?E8lEAxfHJvSeVuUSuq0y/206CCxnuPIJ2EN0KqvzwX04Qi/hHDKGRgrHJq2v?=
 =?us-ascii?Q?P+xD1lUtTQkM+dNcZQxzvZc83GZ+j7IqAxhGOz82J/UNzHnkkyhgwcSz/LXf?=
 =?us-ascii?Q?mmtnt4N9Vwj4Av9GPVvjyFcQKZmqbz2EsbFrr94NzFAJfKU7c9DZxMvW5MhD?=
 =?us-ascii?Q?JNcAuJQR6PVRaHYVCge9JYXDeLYXG2Fzsfnf4G3jePkcyqc+IIadzxoq9gGB?=
 =?us-ascii?Q?8g0nxSpI5fCiDgioSDFBVoXL9xYQ3WpOveB14koeuruLj/+odzQdaDXE0U/p?=
 =?us-ascii?Q?h3Trybzn7JSA2KcQ1+zj9SUM4xITUaasitSEV6/DN8xAaK0ljPSL/M7spG95?=
 =?us-ascii?Q?F3gHqUy0IhQy3kO0rtEASeLtoXuaqWX2NrfYzM87y7p3pQFxZ4Wc0iqlcKfT?=
 =?us-ascii?Q?TrcDU1vIr3JhDo8H2j32a1nYns3OKblL9khJK/M9ILEwGLvTo4V+kPa024r8?=
 =?us-ascii?Q?h/4Zczx/BnIOqzpLGpBuiSXLBdDN2m2S6PONC7dl5k7JeBiQUJdq8XdhLaKh?=
 =?us-ascii?Q?atVIg5eLPKK22o7PVdYbKo9Ri1FhXrp0r2l8RcRUJb5GhVO/0G28CiR8VO+3?=
 =?us-ascii?Q?x1IFssGfldNkOOGnPLZibQovrKbAI8vJa79BHIr9Jno44hk0Mz6EcGFkWwSG?=
 =?us-ascii?Q?ZADHFFSOUhvV5q6NbR1pZRA0qeUDYDEZTWe9ARSBoiIa1e3pDbR03KxspdYN?=
 =?us-ascii?Q?KvZwPvd4JV9qL2Mf6JRKxeBQ1T5urRhxX28CCNkmg1NIrk4/4LxO4m4jWUT+?=
 =?us-ascii?Q?GrE2qcjRqKNPtghUvJnUd/NKOgftSTx7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e+zkdSFWI1WB/Q3OUsGiHwjV5sNUe3sdBC8TzFgXeMXa9M+3C8kmrWb6btnf?=
 =?us-ascii?Q?Dw5KNpncWoueL0C1/M6S952AtUmU7k079B0E7lOuqcayAuGmh3FNGFFDzr5p?=
 =?us-ascii?Q?DBQ8ThS4FZtPj2LxFcsN6J+ZsLfnth+9uWTkkBZX7Qwsq/UEs/rTxn+J88Dd?=
 =?us-ascii?Q?j4L3wtYu9buF5ZMW8pezY3Ag8R5W/HJBZZM2yT1r2o+YCxuIC+nV4lQlqGAO?=
 =?us-ascii?Q?d4v1x5BbDEeIziZlztwYcRHxJUtawxVMGshsk5vSI2miEClKJNU1i0uxDw9Y?=
 =?us-ascii?Q?8ybZ8y3uTeFdWLrbQ9jfqQ8DeU8fhbpXHBjsMPlO0WTU8JG6peCAmUOKPNF1?=
 =?us-ascii?Q?phYOA0VbZItE+pu2C6BG4ZCedZwva82dh7Nd//BXZNVo7UI1ju/Ayyjk4hzM?=
 =?us-ascii?Q?ZzxsZ4LfV+DjjMEbE9+gYCNA4MvMt1NSkxPgnpsPHH+kdpYg2d6gYb4YErCs?=
 =?us-ascii?Q?XqntHv5Pi1R7WTEOO567ou8CqkUkmSu84kBZVxYsbG9aRA/BnBpbpVRb9ppu?=
 =?us-ascii?Q?rKe7rVIHt/h37b9++k/hnGXMgpc+x4hZUnBNcwJYDM//60PnsqOa0iM4zNqa?=
 =?us-ascii?Q?872KV+biMrC/ZK9FyQdSPxh+KwC4NrEFFqtPvEQe7Ae/W4uPNeWXpA7or5LK?=
 =?us-ascii?Q?FEs+3Jk07HrxYsCJlMoo1BUOTRo39+0n2qaqHQbWdUc3nKcIUtDa5vPp/3z2?=
 =?us-ascii?Q?LhCFcPh465OLxw/Dhxf+OlVBqAdhd/McaEIsdZw/5G+Wg2B2lDuyfnzrsAdb?=
 =?us-ascii?Q?u86Szs/tgRK9WR1MaOfcoObuvZYPpz1cCapQEsxf15f0qAbSkrifId/GTXQW?=
 =?us-ascii?Q?XElT1xq7snaCXx5ZdY2zC8ha2T2BVIZL53nmR2RVDosUp6DPaxW/9s6PUKlj?=
 =?us-ascii?Q?3VY52Ym4IqhYKo2BY1UHkyzbspmBq510XwIUcQiJHothpKChW+cL1IraePzW?=
 =?us-ascii?Q?rFxyJjNjTwMsM7vMas9+Ct7s/qMVTFI/6KTI1ZD6nly3ZkOk9Yf58rX7RbpT?=
 =?us-ascii?Q?xjUW+PUHHz+p8EzLaeLk2bDDnpKrcsxaqUpa2BbXZAZ5u4CT/N2iK5JMOlym?=
 =?us-ascii?Q?mfMsRhhOsFgGsLGH7W+xJAbnzHKVZs4AjS/8iKzh+ZkQ1zQhph1MULmu8FGX?=
 =?us-ascii?Q?0Iw5d3je+S71jvaVGi3q172VEZCdCUjeYrUtdIeNKRcnBW8E09UOzxu55a/G?=
 =?us-ascii?Q?R41BoYSkV+5VoO4xk4Lo4HYvRpFalbPnbXuUz+JZT3ueaofdzAtGT0FSmvUq?=
 =?us-ascii?Q?TCyOS3VPzjXu9+XXzl6vy4JcHkZDFNB1S7JRzRNzDEoa8eKOKGMV2Q2ro8yU?=
 =?us-ascii?Q?vWy3auREiQrzn3fQ+5pk5etx7RGtlETbBZQD+2tHS18wXSu5jUR4lTjRwJRQ?=
 =?us-ascii?Q?oC8RGWLw6abqwywb2xkJd2gbJz2bUXzl4v6MqlCszb4is3jzWZ/nBPqwhX4F?=
 =?us-ascii?Q?1NhbjyP2vxZ4uTPdMdMRmrW7r+1LtF/GS2YWYf55WXY4/VSffbL4uHjWiMwO?=
 =?us-ascii?Q?8uSgYPZL7q7GcFuPuSr6r601mJOq8u3SUq7dOa8Z+Q3YVhEqYQf+BkjMa/75?=
 =?us-ascii?Q?8ZqmQX1dLAK5BBshA9VCFr1OyAGVTcrcJrowNBow?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088bd8cd-c219-4822-ee74-08de02943a55
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:47:59.2386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aP1Zl45JViJHhmgKJmwIxLbnp1A5b8Y5C9C27qvfVVpnKsaJ7HZAEm97H4a0sxPfXzYZudyluq/jMpSN2Md2CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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

