Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24495BB75E5
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4256010E1F3;
	Fri,  3 Oct 2025 15:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pgU1ep49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC5610E1F3;
 Fri,  3 Oct 2025 15:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5ateWKaZpKywhgrTmslP/WYUBXC4wDWEUrbygQKpoWUrqrORzPfe7Ux5Qk4UTLDyiySXwBwwHJJA8u/tXnqcHqY04K2wdTjiZaVqtcvdm3YtW/XiWxYqmw973HhZcy8nE7ngAryTg9OZMG+XWzhEb0pS/mw6KWVIp70thl0g3UXVx3Xq243KNhvR89q2gtEu1YhiATBYj5/dq5ftp03GgJUWSfv0/KcvJQTGc2Jfdgu7HLk6vj5ZsE7plKDc3ury3GSpIBQEenju9ZpRD4fSU91wvcq7ZSRierKvHdZG6AKEVAvvOrOYVtkI9v8YV0hOT/xje5qdHeTCA1p82aApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77FTNcbClWOmC09KHfDOzykWUuFW3CunLJr7B7Oaw3E=;
 b=mOupyrm7nGYcs4cyyc/90zlMyNJ0+fdlJ0JhMzBZosWGN3dZ5urS9LP7DKrgFEm8if77Hyj2KtJDrkIB78jlEB0uKnnDpMl+0noTLCfhuCATpGd70LyvAO0O+jhvD051k4XAzKAPHJahikhWOf9TFBZjH3KzuoUiB7xyXdwg52zuChO1zwY9ycB8p0px7gXCK8GdWqgBLYsM/HplnCnStI5rSRJJZFEdMXjkREY4srpAtcTRtZIuo5+tNJ9/xCT6MWyD9aMPJdXTtfX+hgdubwKfDcrxLT0nlsoT/KTZdr9EvbjsGnYBj/nVRHFzbeJ8hUCD9QFZ3oFTX2BM0aFOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77FTNcbClWOmC09KHfDOzykWUuFW3CunLJr7B7Oaw3E=;
 b=pgU1ep49A2g2Io4Z6kOyvKCEgTjCZwat7mlE/hOB3du0Ya8YEp4kfJtLkKj/JV51jdR0tskVqy2Il03soK1vxI7kHhfIF5i3ssmkvq54jCSw8NKAyiJzYNMoSlgZ4sqtB43hJJ9iYq79nlywoIE9lbQxmPWoiGhuliBrY7uVbuMWan5JbeAXvyoU8EWo6yGnqrVs04m0ZPRL/lCXXG0LMWLbqadKY6lZAqlWdkby9M/MXkxIgtjqrm/LD981EQQKgmHVPT00Yl7FfT/LKHPXZ4w6HVgqEdV/IGDVyDfrDa/WJcQck94CO8B1oophHl8+lFbWS/WxN6pOs5A9EpfBSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:47:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:47:57 +0000
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
Subject: [PATCH v6 2/5] nova-core: bitfield: Add support for different storage
 widths
Date: Fri,  3 Oct 2025 11:47:45 -0400
Message-Id: <20251003154748.1687160-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0766.namprd03.prod.outlook.com
 (2603:10b6:408:13a::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: d8216167-4dd7-431d-bf33-08de02943921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9YTsrBYkh9yzJFVUz6B2UuYbndv6/iLx7ChP2rw4kRyTe/5yGWHzzSaV+f50?=
 =?us-ascii?Q?+xV0Am9Si4O8UxaLXtJStlzderoy5X2iVJ5NSFtHzWakgDh3xE4t8xmS7UIn?=
 =?us-ascii?Q?o3xoyMfEww1u6wRrTJjSSXmQbrVigIGe6x75pA+qhWPdzOP4ZOgpNIKntLFA?=
 =?us-ascii?Q?q9oGAFzsQ8C0OB0PkFhgvStFRxWcLsEu5WSNUca4h2tO5kJyfvmEam/WGLie?=
 =?us-ascii?Q?gMPIc9rxa9dXYVAhcN+VKmucoJ6tju984pwp3fOkKvp+xgr/aFg1CA0NJZNs?=
 =?us-ascii?Q?kMjZbWQ6cTzeCiS6rHQNHZlhX8BX0k2hKlL2umAa0Xxp0ixxpmsMOzI3knww?=
 =?us-ascii?Q?PiIgVjTLlyTEWejq4IwhbYIxcM6A9TQC+p8k/HEP5zjxeTBlfynZJa/F9UXH?=
 =?us-ascii?Q?2WrYjhwp4vRca3jJVmHnTBhgrqRWpzkB9bdmMXDjcodIznRM5KQaPU5yYydX?=
 =?us-ascii?Q?oWsk6Smsw39lIehEPjntsfircBVxGVvHiqUGN/seA+ukT4Y3QBxd7y+r0Up4?=
 =?us-ascii?Q?WRiTBD8t9vJLGrEo1vu1vlsijrJsDjXWE7zSLVYA9TBW/LkSAS0GsM0/y07l?=
 =?us-ascii?Q?cMi/vkUKt7GqciQOZI12n4Vuz5QQ3Z4Mb3V1I7I+ewZtD55TsizOcHpBLk+L?=
 =?us-ascii?Q?OfOzGO3dIGF1G+qfNoR+tB6N3wFjXnO0KKvYowC16laxF7yD7L9PZX/dG1DL?=
 =?us-ascii?Q?Xy6QsmBC/N4vDSsKloHnRitu8+z/luJX60y2uCcI5R86+NuqZlQPQ+AInfWN?=
 =?us-ascii?Q?bUEW+GPaBp6xOjmcZPkSCbgZq9TloUBGPdDvd21H+gWDC3nGBUd10+Zqay9/?=
 =?us-ascii?Q?G2+kpfLH5dYlOnYlyFLl3VwB1QMJ+Hfh9bXYapT5KIW7EnSCNdf361l5S5dY?=
 =?us-ascii?Q?lbhnWvqPatWyBbaWntHBXG2qltkb/R+x0lb2c+q82Cse8oCr21tKOm91gyeh?=
 =?us-ascii?Q?YB849NDgZ2P4KZeFSc/9aWhU+MhkwcSJ7dqcNH9G7ndWgqRI7/c+Gm/xDwEs?=
 =?us-ascii?Q?ibDJ67s95b7FLBkd3B/nF00LhaJVHpKTnOcq4zBszqLBOG7RdcWbCVhXklMi?=
 =?us-ascii?Q?VLQDrBaazFCQq6zRWrZTjcrXveoXlkKxrcygBDoQ1ydQEV9rMLDtkLZNwS+h?=
 =?us-ascii?Q?yV4LiF7WmnqywOWK/VRA1zyl2qOLtUmyIaKQcJbbjfOvmDX3HxHJcoBrQySa?=
 =?us-ascii?Q?lAIiuvJAgXQBiGUs9a0ykBIFS8ZK3TmQv0GBdCFTdxwoPuVNXCR8mUHuU8XH?=
 =?us-ascii?Q?Lfvt4aR9E4p4UTYvTjPSKktmhGwgIs7rvoHkvaXBg626Nz5SC8IAOKpxjQql?=
 =?us-ascii?Q?DaPA6XjmlZEVKwVWE0TUGMeqxW8FTdc6Tcw38EpB8yoFRtMD5XIiadpRNj7s?=
 =?us-ascii?Q?5JjQ4dMpKkmMfYBj1quaR6LdCByk8euTmYJhxi3/+1fQhqz1iKPLMseJ18rb?=
 =?us-ascii?Q?w0y6CaebaBMvJvfJ9NkgSOsD+kzi1KPV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CRkRrhAjSA7P2MpYHpUlWLfuTSUVrUTb//901zcTMX/wXT/mp3E/MnP+ST74?=
 =?us-ascii?Q?bYZzGvJNsP5jfDAGvNBfQOSfwFt1HlTuJgGF237atp87MS9NlRUNBboD9vyT?=
 =?us-ascii?Q?pwty53RlHdQqFW9bWrFINCW/t3K/MHuSIFC/xfH2bwEwBh5RpoR99DeSmtLa?=
 =?us-ascii?Q?azuWIUuLsWUQy2kbanWwmhjDiSw337cEZHC/zo+sUl5aGz1e7uiKEKLEzwQU?=
 =?us-ascii?Q?YZhT8cMLgTNKC15pgTuCxL7USIQ1zjYvVap/rOQ5GzzQCfV0SythcYKNx78k?=
 =?us-ascii?Q?7DNpm2Vvobx3znxrEUzOE8PDqC7BwLrd7lSD2up1BK5/QpbmMVQ8wCThqbgI?=
 =?us-ascii?Q?brs8ZNfAjKfxKlrp5T2HFeyv5PmByHT9xaraAR4BLNPl1FXxXtaPbbHS9QDo?=
 =?us-ascii?Q?VQPEfMfGei+X3voh+s5nQ9KAbRxIQakTQOWbZ+LvvU9We9V6V3QYfiURRzqv?=
 =?us-ascii?Q?MpnU1jGbhy5BuN2e5RKhoWBhYfzfweqwe/kUlxK8dVlO1RxfYqdjQ4otfsEK?=
 =?us-ascii?Q?iv0hSU7NCyyqi60gNfPOs/jfhcxmhfo03JN1G7NE+bYazsLpXSy0dW86Mkud?=
 =?us-ascii?Q?OEox/R2CZp4KNSJMMgLZY7KCTBHoprygjj6rHqtowykzY7AaOJJ/mJ9UPKUB?=
 =?us-ascii?Q?2TkFmz4xoAMaP6E7QnxMxpC3DN6nPpRYann2xQvMQdlrJeQNAtcF7ipdOoWM?=
 =?us-ascii?Q?ywCLj6yyhacnCQuOQlrhoBMcjmQhtnAHs4Su+yuLk9o1K1/0TP/PbA15y3Fu?=
 =?us-ascii?Q?H9leGil7Vqt0Pf1wM+8iWaTtJ0x8tAKuPVRBFhlGJ9Iubb4M6cAu8P4H/Lme?=
 =?us-ascii?Q?gf3WmpwbnVTVm/1XioCta+vftSUbqQl9UXOl93xiAWqHLf6HrEkMksOSlo9k?=
 =?us-ascii?Q?OMCZj71IMOUhRf71iik2Q85iigMQFs57QWFokNZ8zjmMhl8WkQf1ET1W18ZL?=
 =?us-ascii?Q?JDFHPNa2PrHKjdyYU5ipeNWu9DttMpIEO1L7XVdt7ZQg1/vPrFEBsYt9HzUo?=
 =?us-ascii?Q?cp5/y/R8SUbPbYhrrPK7TeIJSElu+5oCJOszf74mzdeM15NEfQOAAmg0G5d0?=
 =?us-ascii?Q?qZjTua25tW3/xeOY/94TQXeN0Sg03DXz4FdCfBcVdCZCIt6rLbGxKTdZnX+C?=
 =?us-ascii?Q?RDT2GSYdgRCHnvifRHps+uGS3plXhaIIsPHjraX0q6FWe0GSxpf2bFoPavpf?=
 =?us-ascii?Q?4/8fqr1V+CERfns8euUHCMxCZTwoCD/savl09sq1Gov3s1D522Qaxsrz5IAa?=
 =?us-ascii?Q?6D0b3WTBFT/1ONsE9z4sucfzQQdkgxhGlnRqjuQcOqpKuODXvmO6tEe+MsP5?=
 =?us-ascii?Q?el5K4GzKZ7Bn7/6VACaSkChULg5Lmyz9gM7DT3QeDLvDUzzD3exvwl47rQ4N?=
 =?us-ascii?Q?RwmtzTwld2j/ZAxFSQuU7DXxs79G5jkBpr75t5CFEyRiEaN674KXdzWQdUqX?=
 =?us-ascii?Q?DDwwnhv3Vr/vakEYszc6gfyG/k1lvUbweoWl19i1gHttgempnOyWVYYEMr2a?=
 =?us-ascii?Q?Sjsmp/WE/41zmw7thNK1ERZHWT7ZvhHDHpqowGSgmRgzUtkcW6Z4irXlKQZ0?=
 =?us-ascii?Q?IjvbJn+VHrsKgNO3slZEubmql6DONHT7nAHB2iP6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8216167-4dd7-431d-bf33-08de02943921
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:47:57.1800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NbSCBJlZgDehdxA4sSUk/04hXA7NLnSuONWM7Gb/wswXcbh6Fsfcdhg5xaKlMCueH85JD54qZ1VA/IomtOt1g==
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

Previously, bitfields were hardcoded to use u32 as the underlying
storage type.  Add support for different storage types (u8, u16, u32,
u64) to the bitfield macro.

New syntax is: struct Name(<type ex., u32>) { ... }

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 65 ++++++++++++++++------------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++----
 2 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index dd0ef2016ff8..75de1c0fcb3b 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -57,7 +57,7 @@
 /// }
 ///
 /// bitfield! {
-///     struct ControlReg {
+///     struct ControlReg(u32) {
 ///         3:0 mode as u8 ?=> Mode;
 ///         7:7 state as bool => State;
 ///     }
@@ -67,6 +67,8 @@
 /// This generates a struct with:
 /// - Field accessors: `mode()`, `state()`, etc.
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+///   Note that the compiler will error out if the size of the setter's arg exceeds the
+///   struct's storage size.
 /// - Debug and Default implementations.
 ///
 /// Fields are defined as follows:
@@ -79,21 +81,21 @@
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
@@ -103,20 +105,20 @@ fn bitor(self, rhs: Self) -> Self::Output {
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
@@ -125,7 +127,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name {
+        bitfield!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -140,7 +142,7 @@ fn from(val: $name) -> u32 {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -156,7 +158,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $hi:$lo $field as $type
+            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -190,11 +192,11 @@ impl $name {
 
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
@@ -202,17 +204,17 @@ impl $name {
 
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
@@ -223,29 +225,38 @@ impl $name {
 
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
 
@@ -256,7 +267,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -271,9 +282,9 @@ pub(crate) fn $field(self) -> $res_type {
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

