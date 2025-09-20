Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37703B8CEBB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511EE10E2D6;
	Sat, 20 Sep 2025 18:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t0ZVfgqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010064.outbound.protection.outlook.com
 [40.93.198.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3B10E2D6;
 Sat, 20 Sep 2025 18:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6I7eMBUoE6a1g0Eu7rNbpDlVvx2eOseWXImDhWKfP7kYWYEjPufS4mt0cUtAWYnjlVyujBIR/m86iEc8SuqmQmV6G7Tkg0w4yGjaU4Q5mtNzCCMV73O8J2GwzhpMPpP4wpSPwhBperVJ0iEsonalCxxUmXfdTGThdhFJFItR7DC3aQenao0cd/zEx53Mr+4+s0XvwQnBedwgyD4Bpx9vIM3rJqMnuE5Q3xKZsDL3G4B4Bu45xAnZalM2xpxEWeYOr8V8DSfaMGsO2tjdLPSjoD2hFPpcRdmhYSF50B2VUbFmeyuu4NwMnF3cxRwvUsAD0/hxloB37yOYzrsaltbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMYC79PMjCTklVK9VTOXuJdHLqHqdF1k+Jlv6Aqu7i4=;
 b=dAFCq6zu/RK00inZxulXBw14v7HrroLIzml3z57fOmrj0O9HdGAcc9/8ALhZw7pM9ry64E2tzG73MG3P7RtyMMg9YGeDz6YwbjvdOxM+G5zgxJTm+VmOjtgdlKuMEePcCGinmbQB7SDp0W3FBDl4WIhFmN3PzY0gabVH1lGY45uCBtEHCRvK73U2GPYWz3V2uOI9KFpEB07oqgqDEml+O5pkDkOd7I7m7zWmspQYMdfKGMV1nWgZOJCc++meLu5nt0XZpSF0weM0SQNpbRIsBmha2TsHYwgVhMTYN47MYBwP+tAlSGzBG8Eiqan6ubpXaK1VefNFMXMRYNnp/tzuHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMYC79PMjCTklVK9VTOXuJdHLqHqdF1k+Jlv6Aqu7i4=;
 b=t0ZVfgqPbo+txTGxC7BCIJjUsI++B3Rbvokmv3cz49h2/ibQ2Y2Ff00H24NCaatsugoUI30mnLaPcacLXKiCOP7E7pc1uqzme4OX4x57vpJiBVQFZHDlhUIY76Rot0EdcGAY7U4w94YZrFBzQhAF/HzD0UlzBIMNoEXUbcg16zLxf8wPOOoR5VoYBqjyKBn9igPUFt5UooQjJQqCUTHFRd1JGBnIEvWCfv5Gf+io7AbRZVcDZQWpypDTrbnDu9rGZXV5Nb3yQHG8ZOmCxXTXPDh+qw5Rin0I8vVimt0pQkUm8Qv6VesSOXVHw5WtmMvkGje2nww6/b8IJgZDaP8iGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:23:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:23:13 +0000
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
Subject: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Date: Sat, 20 Sep 2025 14:22:32 -0400
Message-Id: <20250920182232.2095101-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920182232.2095101-1-joelagnelf@nvidia.com>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:208:23c::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5316e8-bea9-4e48-c3d9-08ddf872be2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ezSDaYNG2juOtYDr+MMQ8ysDV3s6OUabG23GZEaidnyzqbCUTHU10MyZym52?=
 =?us-ascii?Q?2O/asE1OPE4NeZesDUaFypn6mAghzLE91YrFcYAhAnj2keZL6I5Qf4Qut7/C?=
 =?us-ascii?Q?LPwDPFanOyJXK6wooEFMY7Ugh8a3fnDuD7wFxnkYyzN2RC2LMeIATG5f1O7R?=
 =?us-ascii?Q?+OPsPtsLHr1UBsRq9tHZyK5hjV8UL3sW6Jst8IG3yU+KL0An2b5UG6cDKmXS?=
 =?us-ascii?Q?J6RYKTFA9C3SRvTWPaaJH/JzRpIjA6evHhnBm44QG0PzuvINB437yVOrcS2p?=
 =?us-ascii?Q?88pc2l8x2xoT06g7l2bO/m0qP66f5zE2F9jPV1gYkHxDfQtg/qIl0kioc4pl?=
 =?us-ascii?Q?rL88s2cO9Lzsm32xreX9nGRJOUUr3BP5kEzo34L5EUD8sVfxvVqNUv8CBoI/?=
 =?us-ascii?Q?36/ZxwHNfNNeZKR5nWyS13+pVkUNnJgXvlx9VJz0NNKoMpPX8EgiIdUBnVlj?=
 =?us-ascii?Q?PItxyDybqqq/p/BUEEW3QvKDnNEOBbJA0fSl1F9psmpPA+PgTITRbXQIiQ+a?=
 =?us-ascii?Q?tCZUS/j/8vtU9rG9H9zLwHLB9MKb+dCMLTyobOrRs/r0jqk6lL2HfptT9LPi?=
 =?us-ascii?Q?UzYpx/4NQ1LMnVW5+Zsimuw/V7SH9WUxIDW40SgZ56WOt8e8aMgFGgn/dpBW?=
 =?us-ascii?Q?kbpQRF/xZm3VRl2cZGoTJlR4qa59DryDKz25sx9KnTfR1We4eVhPVRNtWyX0?=
 =?us-ascii?Q?zxWyit4cj3/fPvKgtGVdytDwe7HRAdlMt8CGZsCZiKPQEbHccvArSfbD30/u?=
 =?us-ascii?Q?P/YLhduwDoAYu9ApDeixDyw/EGCo+uUrxJlfauG7FZVTor0UBnSfIqtiir0l?=
 =?us-ascii?Q?oSuUYkNU7YXX4OqyOcXfl21tIGej0p5aD6cBIY9u4u88irZdflmAQko29oRk?=
 =?us-ascii?Q?S16kcqgfcYM0rU4AFsAbBc0vgeDlUXJJs4STp2w/qH+7AtWP04J67/fAgcQg?=
 =?us-ascii?Q?SWOVDBg3f3rkLDKrTrvJJztnPP6ftKZlMrrpeOGHtLU4L9DBSq2EgelY3UXA?=
 =?us-ascii?Q?88Osh3/wOEwWcKZd+vHu9PMkAHY7z4RcWZFpV5qrOq0buEP59oiFjbKQS/Hw?=
 =?us-ascii?Q?U39n0FORIgrhGKR+VlAYX59vM9tXVltBJQEi3E8jNWQG6ZlmKY9D2MPDpUFv?=
 =?us-ascii?Q?Kh7oEMaLDoyEGERotk+EfQoRIpVWQ6mBUceHbz1w+9dBwwh14TqjuLQX94zr?=
 =?us-ascii?Q?H6ZJ7l87vddouN1HpUtgzVY4wWl4FOZDSMY5r2OjQgJZTZxYVUB1f4nbOfrT?=
 =?us-ascii?Q?dIjrdiWot1d612OG90u7KXyS0OBkStmbhEy45+h835JURe5znwxbtpRkJKZ+?=
 =?us-ascii?Q?SdPigy5uAEuZVgp/gH3UpgijUlKgeB1/3XN4mQGTbuuzlpavQHKPYVb/RFWZ?=
 =?us-ascii?Q?cZoUbNsfIQVPT165cJ9d491BKVNdYcjokvsahMY5XUkwwDP2mX82yol4HRyL?=
 =?us-ascii?Q?KPMTncPHe3s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?360JQ8iCtMABa/KJlsYjyWx3R++Rf7zw90A3S5SbPATuQ+dw3xlE0ZqTNOwu?=
 =?us-ascii?Q?hJJ+CYBK/w0LMnkALWMtKfxr1Ia85q5k9d1lX/hqdoRalYdUfEULCQucEib3?=
 =?us-ascii?Q?E169KKxhqqD86uOzZc1F7cwQcSuXSZMjsnTDjN8ZibrwyfBucoaCMHIXxfdW?=
 =?us-ascii?Q?Qm//v7A6gTS+wCKungy34Km+zlTXTKiKv9HcEhsNqjP3In0WI3/P/w6XGTVl?=
 =?us-ascii?Q?fsC1A1kCgaYkuRPpG8fBIlUYUHwreCYU9hX5DLf8RQ8qcMiWWSWtVnqo8bgW?=
 =?us-ascii?Q?2HmaH8RsheUo4rcFv/Qv4aI0lytyeZe2apHKOopxLox1egSPZREuEI/owoZX?=
 =?us-ascii?Q?RJNFPIpbupmfnO9S9Hm2cwdeiUNANavs9Pe0b8yL/NXiUYAokqXSwLesHkpm?=
 =?us-ascii?Q?1oIbA3LPLwuq1g/YtPY1hssC3UOxJf/UOfGHhXTxTZg6jtfKo7JB5VdzyDsL?=
 =?us-ascii?Q?VEkhECr32hcPyyJvh2jBHK2wJFHSuN8dVykPSJz8269ahpwoWTdp9SYAD/4V?=
 =?us-ascii?Q?PKqmxriW9jTLwKbXKMUWFAYQo6m22tM89siMT8enOyCRjdog6r3yxxgtA69b?=
 =?us-ascii?Q?cMSwpJpdam9DkIqv1Sztoj0vH7WVOmeQu3+IEltQlcz0GWZx0+rjzWKLKZqc?=
 =?us-ascii?Q?9jQt1ElLzOYMP1+0I4gdnThNswkAZOLvrlajs6NZfzIFpi6mXREbtVxGGx7D?=
 =?us-ascii?Q?klZxKJiOyEidxuHSXTUkEAL4dAYOtXz72LDho2snhY5Tx6Zc4q83JYF+ZyTh?=
 =?us-ascii?Q?x8zEjZqdzecySSz6PcmttnoAmj5Aai+Ulb27fKJOd2YfpYgXFJe/S1JZ1UJh?=
 =?us-ascii?Q?Mhx18vveS7lAlKONJmTw1+wRP5czBLu2o9k9YwIoe4BVFF5FgkoOEcj03sTc?=
 =?us-ascii?Q?Mq7oyKl3bS+OpXe+pdQLZvGidB1Jw1g65GdIUWPf71hCE4BfY0WXB0fnd8Jp?=
 =?us-ascii?Q?9xAIQQHzv56rzhPbyeFBirNKHHeOAaAYufr08wTk75aezJqv2Y/iSWGKqn4o?=
 =?us-ascii?Q?hFJ5IEiAhoMxkzpyYiTAsZs8Y0YXvT+pO2p5v7wQR2BIRRL+BwRSbcwKFm7M?=
 =?us-ascii?Q?4zUKGoawDOG5SxeaOpxR8+JqD5FX0MhoNsYQPjOWCBMrbcCZe65GxOr8Zz9+?=
 =?us-ascii?Q?VTUWblX1uaZzcU9IgbICO33wsYm35IJlsCd4hixU9z8nB11W6Yv6M+XVkETz?=
 =?us-ascii?Q?UxRdu29A+XFDYMQjetsl+t2/zyCc3qCegQJXjMti6bExpVNQHxnRxtWlReWE?=
 =?us-ascii?Q?HOpi+bIptCjWfXqvfiSNgJcuIUs5FJxKo0lqiVoH/mMGWc/pQ383If+L99B2?=
 =?us-ascii?Q?2DJFrl5mpD+mHcxAj5cHCiSGoKaaiuOVqxZEmxU8DxO6yQkZY214mIxbbNNU?=
 =?us-ascii?Q?0VBXV6fe7SpcR59wfzf6xavWLC6/7YlCU2AJMhI2PSllG+PAVTOSX4m2n1Nn?=
 =?us-ascii?Q?CZsxY45zAvO1yIJy63ZEv1OJDr7j1eqbtJ0YxpVGX3Lie2R5n+AqT9KuNruh?=
 =?us-ascii?Q?YPLhkMiQCqzbkexj9mg3wZOpjWal2eyP2q9rxJBKxpm3UVvB+mWA8u3m5JhN?=
 =?us-ascii?Q?hz5HI5Lu4w/Y8bg0nV+xi5eN7ZWr2Tax+L5T/4Rc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5316e8-bea9-4e48-c3d9-08ddf872be2a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:23:05.7843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLQSlc8/YMIyX4KZiWDVT33zyJq5wsHUBYrzJ/YZwqgiKW8rQyntkTsYMd1g21qAK9G7kg3DLhiUGrRsVD+fPw==
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

The bitfield macro's setter currently uses the From trait for type
conversion, which is overly restrictive and prevents use cases such as
narrowing conversions (e.g., u32 storage size to u8 field size) which
aren't supported by From.

Replace 'from' with 'as' in the setter implementation to support this.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Joel Fernandes <joel@joelfernandes.org>
---
 rust/kernel/bits/bitfield.rs | 46 +++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/bits/bitfield.rs b/rust/kernel/bits/bitfield.rs
index 99e443580b36..6342352891fa 100644
--- a/rust/kernel/bits/bitfield.rs
+++ b/rust/kernel/bits/bitfield.rs
@@ -300,7 +300,7 @@ impl $name {
         $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (<$storage>::from(value) << SHIFT) & MASK;
+            let value = ((value as $storage) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
@@ -452,6 +452,15 @@ struct TestPartialBits: u8 {
         }
     }
 
+    // For testing wide field types on narrow storage
+    bitfield! {
+        struct TestWideFields: u8 {
+            3:0       nibble      as u32;
+            7:4       high_nibble as u32;
+            7:0       full        as u64;
+        }
+    }
+
     #[test]
     fn test_single_bits() {
         let mut pte = TestPageTableEntry::default();
@@ -689,4 +698,39 @@ fn test_partial_bitfield() {
         bf2 = bf2.set_state(0x55);
         assert_eq!(bf2.state(), 0x1);
     }
+
+    #[test]
+    fn test_wide_field_types() {
+        let mut wf = TestWideFields::default();
+
+        wf = wf.set_nibble(0x0000000F_u32);
+        assert_eq!(wf.nibble(), 0x0000000F_u32);
+
+        wf = wf.set_high_nibble(0x00000007_u32);
+        assert_eq!(wf.high_nibble(), 0x00000007_u32);
+
+        wf = wf.set_nibble(0xDEADBEEF_u32);
+        assert_eq!(wf.nibble(), 0x0000000F_u32);
+
+        wf = wf.set_high_nibble(0xCAFEBABE_u32);
+        assert_eq!(wf.high_nibble(), 0x0000000E_u32);
+
+        wf = wf.set_full(0xDEADBEEFCAFEBABE_u64);
+        assert_eq!(wf.full(), 0xBE_u64);
+
+        assert_eq!(wf.raw(), 0xBE_u8);
+
+        wf = TestWideFields::default()
+            .set_nibble(0x5_u32)
+            .set_high_nibble(0xA_u32);
+        assert_eq!(wf.raw(), 0xA5_u8);
+        assert_eq!(wf.nibble(), 0x5_u32);
+        assert_eq!(wf.high_nibble(), 0xA_u32);
+
+        // Test builder pattern
+        let wf2 = TestWideFields::default()
+            .set_nibble(0x12345678_u32)    // truncated to 0x8
+            .set_high_nibble(0x9ABCDEF0_u32); // truncated to 0x0
+        assert_eq!(wf2.raw(), 0x08_u8);
+    }
 }
-- 
2.34.1

