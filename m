Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D2FB507FC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1663F10E7FE;
	Tue,  9 Sep 2025 21:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJjHTIzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99EC10E7F5;
 Tue,  9 Sep 2025 21:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z30EmzpnbljIEYAUNBtOv6MAGE/u0TkeFRAWozPEk2d9zWq3XQaPAaVpIIC+vdbzhP1jVCzv7dhYIYazIGSMjcaW6QMJNlhXrK5ype++DjnlwePwGja9+JVhqJGauvcHLCjcO/vweMgxeET1AHlp4f2Pnp9XDKN8Uh38Z2Uh5c67MrEdb5nRKgaUhyEg2XaaadxrGy0ffhfWlZHLzNQt8vbaucFOecYoh1CT+rtd4GOk9Raqc8gQPezyxqiI2nYRr9xrOmmBv4s+f4WkSnLQFgRSUB/wTs/gXWQU4MRljLBLjnpMEmQlTqbyjNy97osfHUCWHLQRMhLtoS+TfrYXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCAwEOu9v0pz1g8w1oJdXF52IpYLC3MyyXBRF0Iifqw=;
 b=Y/U2SNrOo/fkhbtkFifzDzKgiCyKxNHV/XyqjzRVDteM0ns0h8YTui0AVH9jRW7Lz9RyxUK4kFefE3PAQEd+ja8ggGxwO2TP/5wvF2Z9DhM/z7Wwe46J33RPWiJM+1P7WSSdTxjqwFkFyAJguUQjuNEexeLjsU/bcjkyeFPMl+zXX9+Oz+bdmwIVp97CA+B9fKbiA0DAqypXN8MEsL0R/HPcSYe0JwsmLnwrrEgZ9UJTJp7qZY5x4UDyDD3Mvb77Cz8nF4suD62H7rfWmj8olfdGCCuS2i3irIArQEY8l0M/uvA3lu4ZbVU+qvjVMIDLoE0Mtt61rGv0RgbLWs1TVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCAwEOu9v0pz1g8w1oJdXF52IpYLC3MyyXBRF0Iifqw=;
 b=iJjHTIzoqCSzZzF/muPS1R6Yh6WxS8OEheGbTsvPoo5s7tngUrD/oBVGoIl9HnUg5qBl2iPsE+qy0jW+k8uTcJcOfWkUHh6lTo8g7RaidL9iieL71d1veJhiHhjFo3+UHEWLxMxtACgetBropJuTufpae43VcJs69S8HuGSpAlJ1WzgN4R6BuyzFXKJQWQ7TCWuD3WCpwaDtiRwV11x8GZxAco958fNoFP46TQgbWIGU5SsQi6ebBNWUYOGoF7LaQAt4YjRt7TccKOUjYiT/PGCLl6HCSILqESZkPZUItHXj3M98nekNTFdXoAWFu1RJCju+ToYi/8HvH/KZ0OlGiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:54 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:53 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 2/5] nova-core: bitfield: Add support for different storage
 widths
Date: Tue,  9 Sep 2025 17:20:36 -0400
Message-Id: <20250909212039.227221-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909212039.227221-1-joelagnelf@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::17) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: c276a733-deb8-4152-ef48-08ddefe6c1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fMk0gLkht6i7lAzq39ZbM5lR7ICeFVYPMtWvodptu55Y1pkc81QFQdGZA+0D?=
 =?us-ascii?Q?XoqZL011RDbKbsnLYgJlNKRjyqd6i1umjxs576AHSRRSu6ANvqYhrpbzEirY?=
 =?us-ascii?Q?/lqc5qC+e5E2N7nKTAmYZe5CivkjGLIh265RodplggdyS0/Rbi2/IhHbRCnQ?=
 =?us-ascii?Q?YLqNFsWwBA5aNn2isixtPjwQbRvkLf+INGCtyv8lBdP1mYEAWEmIKfMcWtlT?=
 =?us-ascii?Q?REk/Vd1k4UqDNMAbIn44xYPXkcMZCaYTtEYDmNvOEkqOTnuP4VLqho58w3lT?=
 =?us-ascii?Q?ngwcpV9tLDzGm4IDHKUhnHXkr7V9dzeoLymLucBif9w7DVpxxdYAkutQcunB?=
 =?us-ascii?Q?lermLz2xyBFTGaykjRw+QFFi5hVHr0Mc5CljzzzN8DCfbersZO3TEmop1U19?=
 =?us-ascii?Q?2lA/E25z4X2UsZgV3kLoHJJrf/N9ory948o870+iYH3UvcQArUmPf5BPr1+w?=
 =?us-ascii?Q?Ljsh5sp52Xi0HdCXZPfhOfhSp01IfD868PbcksWq9zR2bl6iD7VDKEMoZxFc?=
 =?us-ascii?Q?p2deMa2RTU8rDHbzDRh3quuziB0LZ0naoNCHTdaEkIUuldb47zMzqzGP8+M9?=
 =?us-ascii?Q?QAMoSWrNl8Bgo2CuabNmcO5F6XFQqmZZuBS3lD2xgfU8TuxIHjpP2EexZulb?=
 =?us-ascii?Q?lywd4DAunXvMelL1FQgYlLmGdG89oFTWPqHs4wvbRp1cakU8BlmdnAJsVBQT?=
 =?us-ascii?Q?igqxeRf4UNRoZYd/qVUOp0/5pppt1tKo61zkL2PfThD9B1/aB6mHupKXXbU3?=
 =?us-ascii?Q?w2FHfTSZluU1qfSt/jaHCx+Yx1qQutdkpTKLi9LF/0tRxsELYnpMaVBlYTMF?=
 =?us-ascii?Q?eQNxK0xFLOQsD7TnwyvSzxDBtdprdFbEEKOd/eddCvYmigA/SdmAhcwMjsNf?=
 =?us-ascii?Q?v0hTIiF8PzBRrZZa2mcT8FCD6qqco9MfX7NRry4JNTOnuGqGa9cTd9733QaX?=
 =?us-ascii?Q?hDtBfO024x1+Itz/gK1uRVhca/Vcz+t5zzFyIxkpgad3vOmzU6RnDXvWHTQp?=
 =?us-ascii?Q?SpS4QXKtx+KeXd0OxS38/m47IScwp4rl6Rh+KWVvECNgseKqLLMHtGPi+JAu?=
 =?us-ascii?Q?0i8AUJMyiPB1lcXGXogD4dUZD4kVRXht4wTLyIK9dTJmtOSzldbvjdhmm2VQ?=
 =?us-ascii?Q?QIaRVjP/Q/cKyIktcXPLuSmDe1KtB1n9hDz7oTI794iwKypacwSFcrk6N+JV?=
 =?us-ascii?Q?L41TfiUXGuSCOhDaeo6gHjxmfFL5Mq9dksepFh7wDoieBp5nh7V1u8VSAhMa?=
 =?us-ascii?Q?SVky26rH4zTALyGMvlhvOkqDucabIw+PegJVTtSqk2lOqFVYQ9quxdQQK2zv?=
 =?us-ascii?Q?J9pBWDoNESdMVelADGqfi0HjMe/H6WBGdl7Qihm1qpYk8bFTSlrsHFNFDJrw?=
 =?us-ascii?Q?0im8RMMySyn1VQ+FwHgVX5cRDMK0jgiEQiuuwpJCKX3VBHvD+6piQV/lm36f?=
 =?us-ascii?Q?fBzwT1qoGgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Il1vHpV8dhiogM+9WFYNtNvBUsg3b4T11CHt/Tt/cw0oGzQmh9Owao663Wep?=
 =?us-ascii?Q?EOaCvvF3Dr+vVFFB3Gh/PjmNWDR7k2vUmBn1CirlVUu24Up2j+3ieWr/Tva2?=
 =?us-ascii?Q?PV+suXI2AxYtbffjoeCpSkWHAgJ+AqIjOJbZIkTiYhV5nBc/6rm0oQn+RQe8?=
 =?us-ascii?Q?wz5x66c2HG1o033/Pq1Itk9cqsHg3oEe0Wp34U0i9vknQ01eLA0cqYUZJJGs?=
 =?us-ascii?Q?lAmBui8S8a0nSVmA4/F2y51vyxGjZHtVFqmpPBs18gSoNUepOqXrK7cJovwe?=
 =?us-ascii?Q?Rf1SDFbCswsrMSqI+AEHzKcxX1b2hYTZeWbBsX1W3i9qsiA5WPHuNAJCpUh0?=
 =?us-ascii?Q?waj4Xkmd9roxbaflMz2TOQWdQjkipk8bUD28DQWBBGNP5v1OtDRq5rpM6M5C?=
 =?us-ascii?Q?ejVaEfICJZtpwran0C8WttJccZDCtIIVC9nxtqiIzFMZVV1Hj6crNrc8/9BU?=
 =?us-ascii?Q?MFkoJWRC//Pe9kCxayR1IF5kLrsM+T2AyyCKhunF+xDj0gG2ktEiTkcX1Iof?=
 =?us-ascii?Q?RP4RA2nLzwSBql2+K8H6DV1ONg6PjgTwWVpw1VEqgNE5WEUflGVtZYFMuAtq?=
 =?us-ascii?Q?rxqyjQKCIG/S1VbiTVvsxwFcG2Eo9R0R5dvm3kEDb+MWBHjkZN8mS8hm9sDt?=
 =?us-ascii?Q?a48llv9ncGSOwOjWGTQPydSIvDMD+225x8j5JlY4j2QaT20yOKlAp/WZRwkm?=
 =?us-ascii?Q?k0k+N7eBPKUTPUPWcw0hmsYdPhA+F82iu2gz9CehFvR6GNCxIgHzaF8TXBNs?=
 =?us-ascii?Q?rtg2AJeiOQgfE4q4Ae99ti93bjvMKAlGXaLd39yBW5pQZYUZAKp6HzTY1wDZ?=
 =?us-ascii?Q?zAF0o6lLYh9zd5AZRt5S/4xecJApZBYr3kdDknjpaqyHdSIfJvcgLLpGvxD9?=
 =?us-ascii?Q?gwsBcg09ZZLfUkaXFuL7g7+P5Evg+uREYsGtk5B0CRLjETPPUkIwJHksHjEi?=
 =?us-ascii?Q?Uv0pC+vVbTiCOK8Ha0j3722EIIZafCSwzgdccqyKw2eiSh4E9sTujjdxWyqa?=
 =?us-ascii?Q?ETPYFW4eqYHXT/cXKdkA+PwXSPnEQMQP4P/G+HKPGhMnqW+2lqhvMkuftJLd?=
 =?us-ascii?Q?BTtz2cFN1/vb7dHgBRhHoKjya08LDX1kNqYIH+ipVAvSpAgkZlezkPSmpFzI?=
 =?us-ascii?Q?NWJkahhpEkYlF+T9ocD/i36E+HN/IN3FpOR7NtPM3A/erz/NlzM44DEyMKOw?=
 =?us-ascii?Q?F0VHcY60LICAeAYqs9i77I7aGrkhq7ECgo22Ewo1uYF8K9CodjNNkJSeH3lL?=
 =?us-ascii?Q?s4BicNtF0ZBho1KDqK6Z/7BHZhk9ld/Y6fjWTIqp7hLzOOWBL+EhUqmcRyYK?=
 =?us-ascii?Q?kAuF21exTS8ll/mIydvZ/aBLKzdwNcCQOYxFfgxt17R2wr4bn7bH2Afq/lHq?=
 =?us-ascii?Q?WxGMDsVjdx6pJEfpOplQF6DDmouqRG3Lav5Bwyiikk2+sCnn9aLdHdsdUIyZ?=
 =?us-ascii?Q?RYr0y9z60YgL3d4kc172FZ9D6O1CuXR/oKnWWSZdjG7KbDOFhzprHjD/hEC4?=
 =?us-ascii?Q?8HO90LxyJXvsQ6JqOTD50K5A8LLz297Y5liPqpUedLAaTMwAuC6NMDnJQJsq?=
 =?us-ascii?Q?TjH2aQb20mjrrOZewGR+Q3vl39v4hqL+sQK7APT/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c276a733-deb8-4152-ef48-08ddefe6c1cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:53.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjXBuoRZJ3aHiKcidhuu0Jke5+IbqoSusorkHpEmuSMDjdZn+DgOmlOC+1ODiM36Atg+gQdcG7bc7n67DiRShw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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
 drivers/gpu/nova-core/bitfield.rs    | 69 +++++++++++++++++-----------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++----
 2 files changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index ba6b7caa05d9..824559c3462b 100644
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
@@ -77,21 +77,21 @@
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
@@ -101,20 +101,26 @@ fn bitor(self, rhs: Self) -> Self::Output {
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
@@ -123,7 +129,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name {
+        bitfield!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -138,7 +144,7 @@ fn from(val: $name) -> u32 {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -154,7 +160,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $hi:$lo $field as $type
+            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -188,11 +194,11 @@ impl $name {
 
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
@@ -200,17 +206,17 @@ impl $name {
 
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
@@ -221,29 +227,38 @@ impl $name {
 
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
 
@@ -254,7 +269,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -269,9 +284,9 @@ pub(crate) fn $field(self) -> $res_type {
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

