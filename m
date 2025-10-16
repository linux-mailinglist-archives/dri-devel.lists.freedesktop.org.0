Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC690BE4164
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AF610EA17;
	Thu, 16 Oct 2025 15:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pUHD2G2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D4910EA0D;
 Thu, 16 Oct 2025 15:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K53inIlQo6c4GrJJPdUqjb6oG4ipPeJ5nxFTLQsZE/lrAztj0X8x9QLWF+PZIy3YfvZqmC4qdbFxO6clYDrtzJwd0aMcHfysKDlpxmLyMXzx/MXk+YlwGYaoNmPEz+zhRQiianm2mktODE144P6haz4T+hBWqiAv6CEg3XPJqFIL4vnngmpG8nPu4GvCwSfcX88lCRZxoVvwkO2QEj+fWVHjKE5eTrTTE6imlEh2kFm2AJVpbGSn6qY+oJnkVunOqJzH19sLDnH0EtxU4GGW8Bs/WugCb3yFexWpYEZlGLGKCEGkMPoRJKfi24osOL1617fJ5MfyBXsNNLU3VjoidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TazYopQhfj9fBNDwyQfsHCkjf/N0cmGySrdPC+y7YyY=;
 b=jBW6ohQC0uzISpil/P5CVJxW8I0s+DklyLAN7dMhIx2v6Xl0TihFE3fCdxxcZVVFv1m2Tb4AKlb1V4mTk/9GXmJRovHkNTKT+illuxTB+I7cxBHHLbqWBy+C7Z/dH6p/HzrApNaME87mH+Ygp/xi4ReMFh3vix8sqMiE7jl0l6KtUBwv2sSudmgQt0p9obUm8IafB/e106SdPCxBBJaJJSYkEog3WmOlENq/Iru7ZO+DXwsDLPT4k0OXFzAqNN77cK5TuW23fBZnCdLj6o9uhYrwOucORS1fXx+8mvy1fbkX5j25vJjyYkut8OF6HmYiOIxHHocNCwPzQBbd70xZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TazYopQhfj9fBNDwyQfsHCkjf/N0cmGySrdPC+y7YyY=;
 b=pUHD2G2oMzL71icmiXeHxkbALsdBcTyTyzZ3bYXpafrRRT//8/KqavvEDuZlVpg76WFo0NHRP7R+Rt6qy47pO2FtrBC4HdloazeURgtziaRB+OUNuMrJse/uhFn/WQ3wRaAp91wk44sUVcBMWa8/BMeYD2DjAOnaXa59N7bMot7wdMI3f+ZmNzGtMHHroSO3+a1nj7RY9HucqnhLjHASN+ovPTlCtFVv/n3o0slqZS03m7Nc81zJTHSUNqA2p9Ux4YneFB+WSwtKWQF6i2DJT3lJIuEP8qlRj6a9S/pVc9IpgpLJqXVWpNJtzvaVbnDNlOC+9vXInCXQxUVZtBLxQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:02:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:02:30 +0000
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
Subject: [PATCH v7 3/4] gpu: nova-core: bitfield: Add support for different
 storage widths
Date: Thu, 16 Oct 2025 11:02:03 -0400
Message-Id: <20251016150204.1189641-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016150204.1189641-1-joelagnelf@nvidia.com>
References: <20251016150204.1189641-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4436de-bc25-4ec7-c848-08de0cc5073c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?upUFFrefxbncbQEIkUInISJHPmYMfkKqSchyP4EpjQYVwT7M+ck7h/TFgmg8?=
 =?us-ascii?Q?bZP6+3qPlx0UBRPoyr6TdB6yt26Z4O5SnF37Eg8ZZ//rDzhX37rulbMZ1iF5?=
 =?us-ascii?Q?0C4Fxd7xB2R0gDqIxCNJb1QyRlUnUCNd3yvBUrtRinL8ynvzrf39a7SviKcs?=
 =?us-ascii?Q?zCEciUYEH4Pj8yoC9aB1U31MlHUJ3M/N34SLZNeUMAMeZZum4U2QBbE1ETmO?=
 =?us-ascii?Q?GUdm1XjaYQsPGFb50YedImm1x1KM6SYd1XfdZTCIukgNICfTFHxOv3ouYVhR?=
 =?us-ascii?Q?fSKmbPmD/75NTIGs6IZ+X9Fwb8/EzMUUNNF8zQgv2gWdKOWVdFsC0rXHVXTw?=
 =?us-ascii?Q?sIU6gIck+sbWaPkDTuM5L2YmZk21HzuUTtD+3g3eReMlApN+7nwJW4/laM/R?=
 =?us-ascii?Q?/hhsBu4pEfWyciout4gIP3Cd1yIPhmhlWopaMD72/v8Bt04rbl+TXPswrd6D?=
 =?us-ascii?Q?csW7o97LllwT+6IMiPFNLTHHtjtzODlJ19rdPltTdJ9KBHZK8hxNCjHS5GzC?=
 =?us-ascii?Q?ILr0fbxP9/Iz8y1/EwD1vdeBJJ4c/A8B5Ua+33i3Fdm1nFbAM/9MYPR/AVJD?=
 =?us-ascii?Q?qDaoOaBAqkbqMu3Q66KaAcYMiP1er23SobPjv8k+2vsfbZoCaKbfgAmLpPnT?=
 =?us-ascii?Q?j3kIly3p8Kdt4axOEuXg2DvHsefkRDxv/fyot2C2P/FEM145ZIpwLW1sfcvP?=
 =?us-ascii?Q?fUxyoMSh8aG49x4hqJrup/YGBVbVqAMIBKOX+FEysc1h9CgW8K3NHQuzSSrW?=
 =?us-ascii?Q?94Tpw4VdSct5f14BS0MZ7SWOZ7xVIIBbIUlIPk9m1DhqPUtShuC1bJFGc4TR?=
 =?us-ascii?Q?DrVn6mx0Dug7fe5WsAgLJ3kONfdW5EKWLtnEM/MHDO0j3e/6fpznEpUgXhTT?=
 =?us-ascii?Q?0RiRFSABcphlz6LY0lFxP579mdx7k9HxgQJstTq+lBUKAOTSsa2QMx6bn3OG?=
 =?us-ascii?Q?wRAphLzuVwDxH636MeXly5rMlWyefziNmJifcxKgoITAWIzqy7M60oAp7sir?=
 =?us-ascii?Q?UUdrize9+sO3sltcdHZpPu8C29qmY8OKL+phMgcA3d2RldYcP9xCuj2bILv3?=
 =?us-ascii?Q?4tcnpnW13ki5pXr7YRD0mVOn1aS1zIv+Or4ph1pOdwxrcBFX59u5x4xMvYGE?=
 =?us-ascii?Q?u3vUrD3pnu7yUlHe6MIjocRovbXSFEs+DlsOrpH2B9kLq76TRgnGFefXy+m3?=
 =?us-ascii?Q?/9DviZOTR3bXYff4PrFiNMX4iMwFKodHLa7SDJWu0GU8i/XSXOykcopvXrL0?=
 =?us-ascii?Q?jgWjvUJf0wm5xl6RApcozrutVU5Z9rbGF6fVedCZYMB8O5StO2QNIbKLiv0i?=
 =?us-ascii?Q?OFxTvlsVsWiEa3/YS0ozPiq8c/aIxmVmNw5HxGJaPbEvRst3icSGUaUwbGEz?=
 =?us-ascii?Q?hqPh1omyvS2X+vi7wdMH5MejyLzNlUbzpubOyNp2jl+6zgQgBkrWbKhiTG+O?=
 =?us-ascii?Q?Pq9tuEP47VlC3aavNvXE8YAmijY+Ajx/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ktVVVBQ7ZZ8si/8d2vZKnXNNoXVtllBLms9VFnlve5TFM8UjzkWOPD/1lhRf?=
 =?us-ascii?Q?dxk1WiczeJjZK8KEwTeHlS3TZNlgq1Cg5W+zWrP3FePjAh0CSJvkHTYjbOlT?=
 =?us-ascii?Q?FO3K5PzkyQaiEIuZbvpjIVxKe3IeQ9TwNgHKxtGpD9RsY4L0C/MjiXYKZYn+?=
 =?us-ascii?Q?RpxRmMLGC/DAUemNJcClp/yyeArnBb9iP/xlKK76bFzw+TCL26biDOmH7kuM?=
 =?us-ascii?Q?Mh33jsFs1zDmgycAkmRdx7jw0FITWCVMemXNRRrspS1IEyBYMXDhDQUHzTHx?=
 =?us-ascii?Q?eOsiZN7FvEDK6sCH0SQ8DPI3gAdPgacSVQrChobr2zE7J302x1LGTsep4rAV?=
 =?us-ascii?Q?tW2JliBn4Pvqwj7sztQL2hUxFZBQaXPmXX5pjjVybVf5RXV/311eu14VcG3Z?=
 =?us-ascii?Q?yeVAiT5p5AV89B3nqjhKgizJa6FlSJOaBZjy9b4PChVvLmhj4u9RXm8p0V2l?=
 =?us-ascii?Q?CVH89SNsbZkl0qx3PmduZjcstaiy+whZsTYBReSnNSvMZ1Rtv9W+hzVL4d/A?=
 =?us-ascii?Q?5XmwT1oJackw5CNStAOdeMR74t7GLNVfFHu5pS7cdR7uIrZ+9267cxHlKA5A?=
 =?us-ascii?Q?TI3HViONa06yZHago3migdiymD1V3oOGE0BhkD/m57x0XjJNQSfr9R1MrsCK?=
 =?us-ascii?Q?IgvD002p8eV+/6yNR9f/yl3OpKaPfvggsQdzOnmUANEL+opcnwOqWN3Auoy6?=
 =?us-ascii?Q?45gkAqrwyT+3pbC+svgfbqQ4JoeaaDvjSmJVdMXpZkWPQ3ZCff6podqyJ4r5?=
 =?us-ascii?Q?jdgrMba8B7df9tYP+C9GKDJC0acvwBowLlI5lP63FV0kgQEYSj35sO2MT6lQ?=
 =?us-ascii?Q?48P94tdYHptj6xc8UJH0Z8aXCjkBqljLirPZLX3l8wLGYRHk1VHbuF7OYORZ?=
 =?us-ascii?Q?pnseYYjcImrOdUia3Ar8GWgCjEadCV6g6f82aSNPyNlSZ2oCxiu+L9XbO8zh?=
 =?us-ascii?Q?Zb5j54deAtCV02QQqncUcX+icEESS0pFyoiBWCv+CADzPIJdoQNLnMssVZOU?=
 =?us-ascii?Q?KghkXnoCqNALSyuDPXgyziNEMvjaHnyx0Kbl2f+jtfk1FNgZWJYku8ORnGUz?=
 =?us-ascii?Q?rfdzPAWNJXRQPWgSRtqex/0cu4dTYf5EmndAf1sazn+tRI8gwSB+Gp30/NBQ?=
 =?us-ascii?Q?gNegFVQ2lioPVDi72jBZFYI3ddWXgCOEZHLRIXY8RP5NWOd8PEstJ4jk/yHj?=
 =?us-ascii?Q?HdrZNlvBi0DozC0e6Pe8d2ogxD4YneAjXjv8I08BNLPQJg2gEk2j4dUZR8J+?=
 =?us-ascii?Q?Sa8GHaOOixa0IgmlURagamdbScmaPBHUkm4ITuxP8uGZgrgbq7QatPN0P4io?=
 =?us-ascii?Q?QAh3H+djTvHVUhAuAoKMjL5bStonhh7BBBHOJlZzqrE39Ty6NeuNoPwc9vtd?=
 =?us-ascii?Q?IZ+dc5eHMAgV84jMUN3Ld17ND/67DfaUWRE4MpAIFLM4Oh8I8PxHlYDp+B67?=
 =?us-ascii?Q?VpboXsq/B99hNwsuVfqmDVOqtM8r2IGV5jr4RzS8HLzGWsiytX0CNVKrTG8H?=
 =?us-ascii?Q?rTf6XVPP9KfD/WCqBWdOh+i2ZJOST/VYSV6uqz/aL/0TMsvf/Kkp8MxkhauI?=
 =?us-ascii?Q?JdEyXm544jWP2i9UAUmHD6BGC8Fc8Ep/xh+ii2zS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4436de-bc25-4ec7-c848-08de0cc5073c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:02:30.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+vDj58j8ciCWXqv1KY8A5fDRI0wH75j5UBBr9qFMw2J+LIRKgE6peZsbsftTnMkJRZZH45MBODKiPN8DgjMzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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

