Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA9FB507FE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1610E7FF;
	Tue,  9 Sep 2025 21:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ott0RFdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602610E7F8;
 Tue,  9 Sep 2025 21:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFEmEBQpMOUyFx4uCFYhzn/IN6WE+fL8GuJyY765grFkvmH42ApQ8as6tfZCi3sZogVd7KoaFQh4udq4WDTHmC7rqaelqEcrb7GdN6I2L7TSzZeUpNlyuC0oCU1s68r2gEZV2OZ43q9iCWpNI2z6+nkG3wNqoqAmg7aG0wiyaZ/wRuPJBjb/nFp9wSGsTXIJn02a8w+y69GFhUux+VNnQB1Fcq6CqmSLXLhgvabGov0oGdMYavJ3S7EMWxaGlDGBHWYlwBDPjbQiTas2S4v4KHUCz5+74GofaoTKnw3sdQsBkrAP1l2MaFMFGRQPKOmmjts4O+bmu2fRRKzD3O7D2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdpnCgv+SBOHwmyBE6fcjxGEWIEgynJoITa+s34jpB8=;
 b=KPNgY6rYXOVE9rjkXmUZuUOqy+UystPHdeNgZB40ZbrEvH2YXHxMpS3/RXgnBgCHEMYSv9kmOrTylLPfDG1C95Q5SdqETMZpUberDjH7P+fxlhMOhBe067UDZKhp67bhbuyRb4TzISdTPbj/5bJZO6RjktNi/9neyzRmIzFfkn5trJ2b0ELvFB7+UMHjKSXR4OgXH1d012+ZTzZXrZ/5kEICuRooM6Vrv4jGgYByaH5xmyiDc1S7FPx38mY2ThJBGDW45NaFw7wsWDlPDNgqI7rekKlB+e2LHSFivFccLQ92Sw6VKl+SlrJkfdbMJdpmq7h8KrlIl33KPZj0Jtmshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdpnCgv+SBOHwmyBE6fcjxGEWIEgynJoITa+s34jpB8=;
 b=Ott0RFdlLYgJA07xEo7PyvCJea/AMo1LivpaM9OUTHQMSG2Dy7DhJKOl7/V4XPa21pmwamd1wD/PVRGdXmptXcSPRB/MF/xNxnis7mt9Idu8q0LQNGMldcHNeFtab+Hhk8gePrwS4Jkfu2XNyo+rHv1K2FJlI+LVwyfBzZ5A85MeftU7JODgRVZO0ijpoX2i7bi0Hq39G63K2VX0A2ONb0ixQZDj4IWRe5lvUW5I76Lg30dcAiueu/jGtaAvyOKpw3aNaaZ6Yw6MMcSlv8DvgZWAmtXUHxTZ53s7vu2UFgbPyejc9ALnIe3d9rqd99wmiD7XpHWorAK4GpkAnJMEkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:55 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:55 +0000
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
Subject: [PATCH v3 3/5] nova-core: bitfield: Add support for custom visiblity
Date: Tue,  9 Sep 2025 17:20:37 -0400
Message-Id: <20250909212039.227221-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909212039.227221-1-joelagnelf@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0452.namprd03.prod.outlook.com
 (2603:10b6:408:139::7) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ddd319-092d-40e6-35c4-08ddefe6c2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1sgCMiEjsHkFw//NyTXZNU4n4EJdBiKufmsEP+nSLo2he1+2kgTFZxeMszDE?=
 =?us-ascii?Q?yXXqz+sLTgszpncsjuPw62E0CB8HYcXiwmz1IUi3RXgnV+A6o2M25yf8Fcwl?=
 =?us-ascii?Q?cDPP8gkRtJgim3eR3TAiKZq2KrsNnDCblDAwW4f1IM+GUepw0GIh+tpnUwF9?=
 =?us-ascii?Q?7bIFSwpLhA2Bb66Oi0j39kb7jAeT440UXapyty6EAie2S276FSO25S1u7/XE?=
 =?us-ascii?Q?SgMr1UaG0oWni8VxI46fqZvFeo88CB9azor0I6IVhH+K7NBo/0jsEWPXVAnl?=
 =?us-ascii?Q?S85DjXHzA75alhLAwuUnb2u9N7IMu45g1Z8bJiQpWQ78WivoIPNvop7K7Rr9?=
 =?us-ascii?Q?HL+slt1FFAV3HlCxKEWKe5anpNNNLiOKEmfsTXz2TGEuyGdL7pZeqpQqNge6?=
 =?us-ascii?Q?odz8i5r3hKAFBlKlzW+5gua5gdQYY7TCpVrujrDO7KVzzxVk6teKupnVKucY?=
 =?us-ascii?Q?3HGjuHmW/JWmpMCQ5jmU8UXLTBId6a0ERxReqlUGAMecogw/NQ1QfRMMlRPm?=
 =?us-ascii?Q?RVSDynrcQmFZmyc0zp0yRSvZIMOmWYHV52rVdzpV8Z6zFajtF5ooDmV8g2vu?=
 =?us-ascii?Q?qCSrUkWgvf1cxPKOKTLe9R0fpjyoi5Fv58L4DCTjfAOgeZhezn3f6Wt9yr+5?=
 =?us-ascii?Q?7mIhWOJt8GtQYStGDzJCv2MrWlWwmwu4sg8Bqk6c11EcdaZuSTbq0+2/09aQ?=
 =?us-ascii?Q?qscThcICj+ANpsXylzT1dhjKaFB/dBHcnuyLCmmPUfFKoibU2DgZkZUQs6wY?=
 =?us-ascii?Q?kv8XtLoeW92OcKmXUuuLZAYd377P6VqYV4obbdtCbjXrfhjLaX+RWYcJP7b4?=
 =?us-ascii?Q?0X3lSzbrydG0xiLx0FOw1D0WFzOfq69XHbtiPhtQz2itChfotK58bmsv11oN?=
 =?us-ascii?Q?KAb9qFrExvuUSn/jyD5NHA1qMO2tjx+BjS1kBSuGKwvog9MHUO26wxQ+dv2b?=
 =?us-ascii?Q?0ZUeK2NA+6Ht6txN39UU7Xg3qORI2j4Rk9kF+a+AQHDLumHuBt4pd0jDioXR?=
 =?us-ascii?Q?Ed40oV9jXFJxk0JTFDNbbBmGsJt4LwNefgaznrsWYw9ucM1d1tV87aSi+SFC?=
 =?us-ascii?Q?br2x02F3cJGclYt8akjqDOBOuQAO6s4FQsx/GKTw1nNWBKbmnTL5KQ9GLn5X?=
 =?us-ascii?Q?8NZmC2IHYr+f97B4LEDMmdUra42EzoT559egH0HXsO7V1WQzz6PMF8PoO9Hn?=
 =?us-ascii?Q?rlB6CcQ695k7kb2N2QQF+Tfmwm6wGfe1tJua3M43pfaEK57mk2QA/qJK/yxu?=
 =?us-ascii?Q?J4as3KMots3SWH83S8S8/TKTLCLzaOxsiVRz3KsMOo9LvNvwu8QjcvEM/5A2?=
 =?us-ascii?Q?S1NdbKuCW4YKGMNRL06G3LGJZTv/YyKDmPj0kU8Qbz5zr8nt0xBu9gwpJADy?=
 =?us-ascii?Q?8+VGBOVwC8khgUPcu+51AECspFvB/iv/+fCwv+1KQIELM14F0FFuKytrlFLW?=
 =?us-ascii?Q?QB98DwN+3IU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xcCC39jVJZmM3ycImVLjeEeKRdA8n6bzzrrnZR6ElhBOU7q9tFEpCQIaXfmo?=
 =?us-ascii?Q?55Pf6XTInyTmRXr/R5zeikt9gvh6noUzIyWwTrn79z9muZJBAwSNsoahqguj?=
 =?us-ascii?Q?5iKXTx3CElxmpOywHyochrwBaSRM69FaV0Rg4DF6JmvQJ/ii4E4JGrqjYYYd?=
 =?us-ascii?Q?VRT1HTK4jRhFbb2m8LgoJ2Zo0XNCS3uqoc+6Qd2R1oobAkdrkhgoNipWxBQg?=
 =?us-ascii?Q?NKt88hP7Zn5agiCPLfiyX1QE3j+VmCAT9zUVu4b8ktpvpDSjjNqYK3YPmUuc?=
 =?us-ascii?Q?2whvgR+Aa/fsiFiopvPDOaD+tchaCJA0eLKjrcLQYZRFhVztN/S2eQbDpf0h?=
 =?us-ascii?Q?d8BAQ0FZ41yzzIJREi3B2tPGBW7fM3+REbmeH+2go65Gt+zJXoagHfQQita/?=
 =?us-ascii?Q?DZqlsYWJq1auLp/3+fiRwsRDe3Cii/iraWGC3RI4HNRQXPUnrT4Qhz1NW/XK?=
 =?us-ascii?Q?6C+2XsqGQyx62bxNMAj2cqNxVuBQU54KFY5MBzauk70VY/LOfF0dd4pdhf75?=
 =?us-ascii?Q?Wf5wzsktROG94abUdJ1KGKt0GPOo0YXDSQAbha9jt2utb3aru1VIEDZKRdvr?=
 =?us-ascii?Q?O9LPP/YngseHnf0nt48eESeMadTA9rlKgHKP5R5FM1LWx5gV7bA/Qefkw2s9?=
 =?us-ascii?Q?HDeVuP8E77Jpfbf2oobPHj0VfyX9iuobg1mP4HxwtuVQIi1uAmqkFPe/qLaI?=
 =?us-ascii?Q?EFuBvd3WWrg8oTI/StgtJ91EkmTCOKzKIx5QtKd7aF4v3kk06cOCeWGjXeXE?=
 =?us-ascii?Q?iTcjvUDoPEqcM3O4QNq2B3VewYPXutsl0wSmscY9M9dXy/owpalHzOeGug1H?=
 =?us-ascii?Q?XVJVV6lCgm6OufSrYXc/YQk53XOz/pCypLX+H4bl355wM+3l6xAccVI1LLd2?=
 =?us-ascii?Q?PszjTp8QzD7I77iOxgJFj8VBUzoVXru8s9Gm3HQk+/PkFJNaKnlE2Oa/dnBC?=
 =?us-ascii?Q?DZLWh+Ih2nGd6ypoqJlKxq4bJmaznDQgz7yv0nYtQhTP0u7ryfAk8lnRYt+O?=
 =?us-ascii?Q?ZHCAWKlvdtioseQtbUQVmiaWZ6PoUCv8KVTHU2Gr7PJgPeoe952LtRsK/JE0?=
 =?us-ascii?Q?khN5QKNjtcKDLuiOnUlUndjcIpHzkWxjMAX2OPBHY4JS+cUlFcFIcfCHNCdF?=
 =?us-ascii?Q?B+0K2Pd/Ww1w9Q+i8mK/KjBfBAzESk8pYpWhDCs++GPxFm2UmCaVdp1F1Rj2?=
 =?us-ascii?Q?6HPe1UUCRRNqomZ8LBpKO1Med909qDjOOJoAI6uJNitU3VKt4jPKoBu2m+Vx?=
 =?us-ascii?Q?Jw8jSRalT6Q18CO92MjEFl8Vcv2ClDaOsU0++XNQfBrd3njYZwPY/O82Fsxr?=
 =?us-ascii?Q?aCkmbfgB3tEmen5kfFaPgYQrsUmvl/mLx+9JbLIKDZa46ECIL6XQcTC6kChx?=
 =?us-ascii?Q?GXbWlbECHvTN4jedt5YhTZ4lJffniaNRRzEpzeUGPrXR9ijdoKP2MSDZFhPu?=
 =?us-ascii?Q?em9PsNq9bAG65Ps6dKDr2eccWIuNjbqO8Wp1JDPzZfbe5CyWyayuNeCM/f8a?=
 =?us-ascii?Q?ipwdT9YnXVI0X/BQmDA48OwVJS4mthVPZcPbuyoJip920gjm3yC0Fm8rfXdf?=
 =?us-ascii?Q?UpowRYO9TthDtRIYhW0tbnzytwMkznrPSMWW8jO3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ddd319-092d-40e6-35c4-08ddefe6c2f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:55.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a8cBAtLKa7E5uu17YUZg9fGPeGnGKEOwTFpWcYZvYNYwuke4AF9LYiVHOZ6eTTKvw/k9vWsl7or1Sy9M9ZBnQ==
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

Add support for custom visiblity to allow for users to control visibility
of the structure and helpers.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 55 ++++++++++++++++------------
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++----
 2 files changed, 40 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 824559c3462b..39354e60360c 100644
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
@@ -63,6 +63,9 @@
 //! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
 //! - Debug and Default implementations
 //!
+//! Note: Field accessors and setters inherit the same visibility as the struct itself.
+//! In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+//!
 //! The field setters can be used with the builder pattern, example:
 //! ControlReg::default().set_mode(mode).set_state(state);
 //!
@@ -77,21 +80,21 @@
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
@@ -113,14 +116,14 @@ fn from(val: $storage) -> Self {
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
@@ -129,7 +132,7 @@ fn from(val: $storage) -> Self {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $storage {
+        bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -144,7 +147,7 @@ fn from(val: $storage) -> Self {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -159,8 +162,14 @@ fn from(val: $storage) -> Self {
 
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
@@ -194,11 +203,11 @@ impl $name {
 
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
@@ -206,17 +215,17 @@ impl $name {
 
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
@@ -227,24 +236,24 @@ impl $name {
 
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
@@ -267,7 +276,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -283,7 +292,7 @@ pub(crate) fn $field(self) -> $res_type {
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

