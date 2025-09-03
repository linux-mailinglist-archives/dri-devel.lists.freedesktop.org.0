Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FEB42C36
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B7610E946;
	Wed,  3 Sep 2025 21:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gJ514iPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4287810E949;
 Wed,  3 Sep 2025 21:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVtJSGcD1joXeJGoMajd8/sAb6Z3uJPS3Dckukp5NEfTWlP7teZFFyqr9+/cJ8FTlvknNxVfMc2dsd1An/w1imf874bbZNZvexRzNr0S2wwyEVP8tNjCz39G7R8mabjToGJtk6+MnKFF4cbl6sZZlxQDwa/qp1oYCtFDG0hIWHXzB4Y0NfiEVjEtOdgH6Jodm+tIjsBg9W47/OPG+SLpypSGO6HubSeLXV6Je813+Yj8FZWljpqqYQ2UOOBf2GEfnnciYg4a/J3Zp+W0UKhotTG9UvkRm2OW+XuD43LVzSp7es9+fYMLhwR18FpCS2720v6ZrSZ6zj9JHnx+r+C/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I0EQuwH5KD8V5AIwIblg1MQvx9Ui+sW5NgHhpdyrKI=;
 b=CqwWTIL1srvUxKrwEStsToNo2VMMbXT2G4HIaUdLQ/5ntPhCWSzYypn14Lj8DLf4XuK7Ww9kEq+XZBaW5RU6CmcDPkEsSioh+0VoCStSGAgdCJK0lqwR4Rbr2dT7F+QgshMghGH0/rZeXnrbCjpDWZqzsPzLkKPgoZHsLd3oEISnMD33GDkpNtp3JbAKIqQ6b3QUPqrSH7fCGKWH9NBfuIfuGl6OsBMtoA88E3I1WXd+f6j0GP1FYhcQx2UKWK8vePT3yxQR+kU9tRjJy2tBhvhTQTY7dU4+Hlx/bnH3RyrIrQSHvpHCLU6UwksjxOnyeKBDdYK9fhec0ExDPu+5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I0EQuwH5KD8V5AIwIblg1MQvx9Ui+sW5NgHhpdyrKI=;
 b=gJ514iPflutYhb6bIZXcpxPWYNj7/7hNI2NeTTwI6Dedv3kfUkvmHKwIaAnNF9vfOX7vPo9JXtHmJ3ZNsImg0zGZ5u+PJFI8Mf5gOpmSytXD5rlUsIi1vPaGgYdIxOylb1Xu5lb0OJdrSnGvM0jBOxVRIjODm5hTh32oFVYEiHvSdEUdrRTqhYXGXa61asGMGmXz7a1k9h+xALWB4B350Mfx2fRLPzvBUr9kFy7QQsX+FgyPdBEvY5rRfGT+WgqxcBL9E0ej2bLJT23taWw61yAEZ2rh/SIDV0popobeW8KYl/pF9NHw53K1UQGQREs79PfSy2f0Scqf8BlojwUarA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:54:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:54:36 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/4] nova-core: bitstruct: Add support for different
 storage widths
Date: Wed,  3 Sep 2025 17:54:26 -0400
Message-Id: <20250903215428.1296517-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903215428.1296517-1-joelagnelf@nvidia.com>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0065.prod.exchangelabs.com (2603:10b6:208:23f::34)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe46601-4452-491e-db4b-08ddeb347952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AXi8NfSBSJ/8fS7ic8J0XWUin83uPSKqlNFjUuraym/4t/GBasXLz5vrRkmG?=
 =?us-ascii?Q?+/P4ABNR7bU8mDRKjYo7p1IlbEbl5D0ogYE6nLDJLkgndWNorUJRZSfPqzss?=
 =?us-ascii?Q?3YFJZocBf5gDtWt2xnRyZ13Z6UVlUpzYPsY3znbZDSnCHds4ajaj/FeWBb5l?=
 =?us-ascii?Q?whFutO3hMQZAo6iZCbpssw2CSEm1V0TO85Pj5s3iAi/bLy3RWp7eX+h/nIHP?=
 =?us-ascii?Q?nhZBcxPsMy4gCdHkbr0diENYyKeRjTBlPRr34e2fLdtNqRNZdq5EN6lKOSXG?=
 =?us-ascii?Q?pLAsFukAp6PUfBk++YVmxVYJ2TfvNa47qA/u+fGt5lKyaqTQmVaE3eaJTQ63?=
 =?us-ascii?Q?deaEm5GOvRExuxaXemiTBGxf9cWyUqejF8fl5X9j5Jz2GYYvQIsP7eA/l3CC?=
 =?us-ascii?Q?Mn/QsBKKgIiuwbl7vBW4+YiGtHTN6RbpM7ImBSFtHYSB7jzpWdWXw3VNOBeG?=
 =?us-ascii?Q?y391FwcPUJQ3zg15Pl+05JUSRi303k1glCRWJdsYshe/vItkIlrrFMBq3HmV?=
 =?us-ascii?Q?kl7DUJXwxwe7ClzIDE1P4zK5eEWXOVpW7/4v0sG7leYgSU7gt9jW2UuSZUVc?=
 =?us-ascii?Q?GIeBL7C0mRM6d0tkYvIkIwr532+466fY0sVmr+RXRlGjBylT22jKDcWTw018?=
 =?us-ascii?Q?VLyqULPTW/uRMQ3Jrnv7S7o08O59G5nRg83ZkIdgsmjwMbABOzO1e3t3qkmT?=
 =?us-ascii?Q?EtEItNXQU1GAPJElgHNDItxfJhrGiXIrs/4fj+u8JikE34/dfHOBBYRERLqd?=
 =?us-ascii?Q?k2oxjVC6DEN0Fu3alZK0w5GEa8ZAN+1bJ+Bom/9W+3Mh1J5hUHNwX/eD08D3?=
 =?us-ascii?Q?NKS0dJMixDGM/UiNDLhcs28Qi98BwzQeDpEAza13ZbeonQbO60V2h48SClw4?=
 =?us-ascii?Q?vGzWnk3uebLY9WPNQOzTpM+5wNZfh5eK6FPLZF0kS7rT21MMbUM5ciA80Mam?=
 =?us-ascii?Q?SjLN/hWTmhNPpSqe6LrvYXo1v1m2kaqb2uddA488N8uvRA76fYaroiy8SCRJ?=
 =?us-ascii?Q?Wqt4TrwRaC/DUfGpnxa/eOZH8yYwwJNT54sceZwrccD2vchRxptMrucAF9Gl?=
 =?us-ascii?Q?d6wuaInzilRHqWOBo39PFRbTJoCnvxdYLhVXMfuO2cV/9QSnMZCJfTwVl6QW?=
 =?us-ascii?Q?gozKRfW9qLSMBUc3aKoQ9xisYb3rlofCJ60KwOlSuGJHwA7s4oMge2U7HLQ3?=
 =?us-ascii?Q?EATmU3ivR3qlIO0/KblOgEVA4MB0adTjKwDW7OJWH5iLUwimKD6sifO8maFj?=
 =?us-ascii?Q?sjReMVhXqe4SSQej4TPvZPMqj6XCqu+/0BGyWSxlJw1rylVjLX/wK0I5u5XS?=
 =?us-ascii?Q?9SyGPYavjI6QjhN6lCMno1kONy0VjSl7b+rxS6schYb8haaKJhhkdZxVKmqY?=
 =?us-ascii?Q?EKN2EnaKcRjSCi+EeSMRvbQtbQun8evaH7iWWFr1rFl7TG1HbttT4cHc9NgY?=
 =?us-ascii?Q?iKkWfdXMRAE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ivn24oLe7/bvZy/JGTdimY8KPDPjU34XiANVDJSbAyJZVXL9QIi9vTl6r5CD?=
 =?us-ascii?Q?aOnyL5eHAx6SSE5S2GSXha+cPWpihrTwMpatz6nh+vIT0YgChbvE4YlnE+9x?=
 =?us-ascii?Q?KKsaemkxRXCDMG5PyBVbGJL4i6N30R4xcQLwT9qHKUEfv78AXXaX6nxpPewo?=
 =?us-ascii?Q?rjY3M3A2VoGvvO6pZtC3rcBCC94ZqWmFXgk2oDWOFmW0B5Ax2En+nOZKboR8?=
 =?us-ascii?Q?bV8k8AodQ+sHJqm3Fx3N/UhXz7qJflksmdro+HysI2axxAA6etxxPhXqPFSJ?=
 =?us-ascii?Q?1jrKISoigyE3dnFuj6nssVi/dxy7HNrzUWjHtVXMS/cyGgFUF3SMOh7yMwya?=
 =?us-ascii?Q?lzrm14v5OOapNh6DhU8hS9J/cH5cw8exGWIQhOnjf0sT7XbPP0hf98IHduau?=
 =?us-ascii?Q?JUR8Tpf+Zh4REhs3o/5Ybcivu/+GnKCizFN4NfTKCMby/O2bGATPPZy0iKIc?=
 =?us-ascii?Q?IaaJoT0nkkWA+m1pJlA+gitj5FY6qD7/1ttHZNpvN+mGfbVUVrZ0lMwZwZAG?=
 =?us-ascii?Q?o2T6+pUqKkoqllNzqPyWBZ5AxX6UqZPzrAome0W4vXEfhI9EYgo1G197SKif?=
 =?us-ascii?Q?YEvofdl/b6hQj1CEECD+Tm9NCNuwDfND5srDnzyqyZy3x9N/DpmaneM17qT+?=
 =?us-ascii?Q?3ozNwbyORl7cbFCd0ClvbguHqTSj0EUz76SnhrvpO5P1EkPfyaazrP2bNhQL?=
 =?us-ascii?Q?SvGE7yroNb+oOehlOBqTBhbtXC7MSUlJQ8xnB7UxlAL3lzQ4HtgCREatC6G2?=
 =?us-ascii?Q?paOqBuSITNBrO5P7p7VL2eg0LtEUJWt2laGOUfkq7b16/yaVOCz5QNVtzeK4?=
 =?us-ascii?Q?DfkltVTQFwloJtQReSrVqo4Lm74B6MEOGIdLERtjINXrRBdKPuWz/yZOuMH6?=
 =?us-ascii?Q?BGetptVYEr1myt27GIgEeaL0Uw8PEX4tfkeguxdGzt5SAPYDQlEln2G0N4Xo?=
 =?us-ascii?Q?zDTCHHyTbFfY2foSZQR1SPv39/Yk09D07xJ6O8NGPyFhVHYul5orRu1H1Hno?=
 =?us-ascii?Q?mlBeTOD1RFRBBEJigShAwIx1S2Dxo1cgLAPvNtLmI2n1jwqSiC80CD/16c5t?=
 =?us-ascii?Q?alQkayH6EvTfYZk/nSq+tBH2kBIvZWYSBL1i598zqMxoEz3XVUIGZLfYNG4m?=
 =?us-ascii?Q?5TDaQUQqEGNpwVmvVBdgQ/V9KUiBqNntRwVnJ2iy0HbtOzoIwNgzm+smR0w0?=
 =?us-ascii?Q?1ADtMk4QWO1CHqpcR3UOsOqhvMr1z8TtKr0TXGfCex8xwqmPoFT8QKP/bh3U?=
 =?us-ascii?Q?N5leIduWzr/TeRdGzk2+CKLdICcMdKPE4D2V0I6IRgK4C7zAueYHed6WeEWD?=
 =?us-ascii?Q?McF5MXvP03KE18VWBa8RODJnasopXgyhGC+rfXS8Vh+iStiaMRKFE8Pu5IEe?=
 =?us-ascii?Q?R+osP6k0L1s6j+VkFgF/8BpScNhSpfu+TWY0cvSyObLPeSrp9blwxrl85ksD?=
 =?us-ascii?Q?5mLEmLoLhEviT6GnL8LlkV9gNWd5955LAiDHj+Jv3H1fRPwFciCszxlzuFWS?=
 =?us-ascii?Q?VKGGl3yGLbHPaPtv7gveE/PjW8zUGqUGbfexi/ghEiW2K0p3SK481lpVavCZ?=
 =?us-ascii?Q?vZyjP+ejs5SGAxKBlbgm+ghQw5dIhLof02jj/CSN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe46601-4452-491e-db4b-08ddeb347952
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:54:36.4413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bprcUb2y4b+gHH6Lrg/nv39Ec1mgwVlr/bPjsFZuIyQOXMUVqr991SqE/EP3uD5Fh6XD81/fS2wx5pEJouEGlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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

Previously, bitstructs were hardcoded to use u32 as the underlying
storage type.  Add support for different storage types (u8, u16, u32,
u64) to the bitstruct macro.

New syntax is: struct Name: <type ex., u32> { ... }

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitstruct.rs   | 71 ++++++++++++++++------------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++----
 2 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
index 1dd9edab7d07..068334c86981 100644
--- a/drivers/gpu/nova-core/bitstruct.rs
+++ b/drivers/gpu/nova-core/bitstruct.rs
@@ -9,7 +9,7 @@
 ///
 /// ```rust
 /// bitstruct! {
-///     struct ControlReg {
+///     struct ControlReg: u32 {
 ///         3:0       mode        as u8 ?=> Mode;
 ///         7:4       state       as u8 => State;
 ///     }
@@ -34,21 +34,21 @@
 ///   and returns the result. This is useful with fields for which not all values are valid.
 macro_rules! bitstruct {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitstruct!(@core $name $(, $comment)? { $($fields)* });
+    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
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
@@ -58,20 +58,20 @@ fn bitor(self, rhs: Self) -> Self::Output {
             }
         }
 
-        impl ::core::convert::From<$name> for u32 {
-            fn from(val: $name) -> u32 {
+        impl ::core::convert::From<$name> for $storage {
+            fn from(val: $name) -> $storage {
                 val.0
             }
         }
 
-        bitstruct!(@fields_dispatcher $name { $($fields)* });
+        bitstruct!(@fields_dispatcher $name $storage { $($fields)* });
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
@@ -80,7 +80,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitstruct!(@field_accessors $name {
+        bitstruct!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -89,13 +89,13 @@ fn from(val: $name) -> u32 {
             ;
             )*
         });
-        bitstruct!(@debug $name { $($field;)* });
-        bitstruct!(@default $name { $($field;)* });
+        bitstruct!(@debug $name $storage { $($field;)* });
+        bitstruct!(@default $name $storage { $($field;)* });
     };
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -111,7 +111,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitstruct!(@field_accessor $name $hi:$lo $field as $type
+            bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -145,11 +145,11 @@ impl $name {
 
     // Catches fields defined as `bool` and convert them into a boolean value.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
         bitstruct!(
-            @leaf_accessor $name $hi:$lo $field
+            @leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
         );
@@ -157,17 +157,17 @@ impl $name {
 
     // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitstruct!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@leaf_accessor $name $hi:$lo $field
+        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -178,29 +178,38 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@leaf_accessor $name $hi:$lo $field
+        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
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
+                _ => <$storage>::MAX
+            }
+        };
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
         );
 
@@ -211,7 +220,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -226,9 +235,9 @@ pub(crate) fn $field(self) -> $res_type {
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
@@ -237,7 +246,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
     };
 
     // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
+    (@debug $name:ident $storage:ty { $($field:ident;)* }) => {
         impl ::core::fmt::Debug for $name {
             fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                 f.debug_struct(stringify!($name))
@@ -251,7 +260,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
     };
 
     // Generates the `Default` implementation for `$name`.
-    (@default $name:ident { $($field:ident;)* }) => {
+    (@default $name:ident $storage:ty { $($field:ident;)* }) => {
         /// Returns a value for the bitstruct where all fields are set to their default value.
         impl ::core::default::Default for $name {
             fn default() -> Self {
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 3fb6852dff04..bbfeab147c9f 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -284,25 +284,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -313,7 +313,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -334,7 +334,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -356,7 +356,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -365,7 +365,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitstruct!(struct $name $(, $comment)? { $($fields)* } );
+        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

