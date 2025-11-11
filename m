Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45216C4F351
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4710E62B;
	Tue, 11 Nov 2025 17:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dfUNNKp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7932910E619;
 Tue, 11 Nov 2025 17:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpzJlf0AgBVRAHdx28Cp/XtNmQNMfoMyUKUa/PIWFUz9hEljib0uI99+E2MWg2pYu/DoOZ+P0Fph4YqAQqbP5SBnus9Em4sYL/UYwcW9ENN21uxFdO60FOB6OIV/XcpIuw8EaA6+VoA9UdNHkK6AMCR6UbJdjlrCLB+c7uRCJRUVCBs+2Z5E53bU8qN9Mo8CXMMyIoCgiw8on7x1y//02xVyHRGJw/43Kq6lll8nYAnthC+IwmVAV9+f/nk7lk9Rci88bFPBTgLnN0iZEkEV5Dve3gryxvPMl986KEdqD8l/po5HJTKXid3CdYSR6I+WpRn3V4ZMzWvRw40dz15CCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6LQiLh8Op22Q4ggimWx5zPUtpq3KuEHtGwKBa1hsy0=;
 b=Xl7MZh76QFFlsiYcwB0M9OAc5zJIRF1gDxQcaS46T5jfOyotyDxtBSPfO8hkmdwRIHz2aaGnRmCiEeu2PcPLxXRkBiU7kw/PqrZ0Jp+AP6CkDrc9AqkPdvsWAg5MQ3n7g68qEZRiJvozIKIRdCeA/mKHZFbOeUVLm4ct2SOonl4EmBB1rqen67TsQ8OX/GcrzrFtC/9gJzjUPeJz1ZPKx9y+EFk5GW5XYEQzvusq5tZMkc2phqt8hVR2vaBhdgnB+faPi+UUZoL4RaDIL8l+a/Voa2x1OKFStYDbC/32tI0Gh0ABXA0x99V4CAT0JUX2sYix3pOzJ2sEf3SOyDYirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6LQiLh8Op22Q4ggimWx5zPUtpq3KuEHtGwKBa1hsy0=;
 b=dfUNNKp2HOPk3uqO0/72+GR2sIuMG86U58jSSL34/v59E5uz5mCA4/MEvXVlgNJt1ivyjkuteOrQUH0FoIJUrLyyocJ57AWjrAm3mOGr5fay200G++9+WpzmsSTYP4CL2R8hGXUjeX2/6IVygWeyeeU3sOmQ5KMI7R/GxMGE0OKzSqwTYDgu9BMkoZBX2RSzimHD+O6Wf0s7CoKelTiVB2c7u0Oq1/2YFWrMa8BS5lIgV/9wu+utvly5PI1NKjI/LbO8e1WcX/MlKr1C2i8/2RSiIqMZo2aMfuLX0qAZ1hMo++oNwOMzx9zjSR0Aw91HCTGJSTcOgFokQqyqv2dgRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:13:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:13:27 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com
Cc: acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jhubbard@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 3/3] rust: clist: Add typed iteration with FromListHead
 trait
Date: Tue, 11 Nov 2025 12:13:14 -0500
Message-Id: <20251111171315.2196103-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111171315.2196103-1-joelagnelf@nvidia.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0346.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 5555ea14-b1bd-4af9-3b4c-08de2145a149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5SgQOgjd0I09m1fBG+Ip4uD07pWeXehlAefS3rB2S1ABGz7+irNfnReD/WU1?=
 =?us-ascii?Q?TZlaQOeDuDkcfRFpIWBfrFNmap4GHGt8/lG0/8XW/VWbuGSm0W1mT/Sf9RSN?=
 =?us-ascii?Q?4j8/k1LXLZVLNIdmFenRnaQiMFFLeDQT/+9x7pY1LrrBd4jiaU17JgnynitB?=
 =?us-ascii?Q?jZ/lKuAw6eaX1evjIBizXr4+bxbYCR9R+n+S8NOkyOC50wui502mwxDZp1E2?=
 =?us-ascii?Q?MBbGlDDP2+xxpjbtaG0FXd0Vh7gAt84yTjDlP2UollKKgdO+kYC6xFsr5p0f?=
 =?us-ascii?Q?9RzFXyg6yILvSKS8+XFW+x/8Ztn/L+UmbkGLw1jDTPb0hlqtjnAQtppYd67K?=
 =?us-ascii?Q?p+Wc74zYTkIpVWs6MQOpTFgdj3jWERS6L/QIp1gHzANudTZWWRrg4eDrxCQf?=
 =?us-ascii?Q?YB/GJwVG8N5YM8C4xU7eSRIhiOUQpjx0Fu3MeeTx8Qz7gpEsFCNWUh2sMfso?=
 =?us-ascii?Q?61zTR/L9y1JLAtel04TG0YiD6Bhq16mePaNwuTHCYltxj1yUVDxIHGIAI8r/?=
 =?us-ascii?Q?54pe6CNH9O25THW70G4Y0nB5MztQIzdm9zS+zvKYOwmplnT/d/kgWcvndSnM?=
 =?us-ascii?Q?Si2imoT+zEmOHZyzThGq1Bs1RFCXnNOS//ek/DcoAYUW/lQS8lI6W13a/olz?=
 =?us-ascii?Q?SKScAPf9xtccuYAPRTKL5/ThO9Fi57WFSqbVWkHNwnOmfXUajjsjh6PAICWx?=
 =?us-ascii?Q?F6ME/r7EM4y1FTb7/n3riqsxWgw9/06kW3t4ekZReNIavBMfSHsZZtJoiIIG?=
 =?us-ascii?Q?hMq8MfcN7FMMuPhu1VpMP5EaP/aMfbQ/UOuuYgN/m6/1r2/F1qYrBh7VSH2+?=
 =?us-ascii?Q?kSLIgerOOBNwGp4qx3IbN6RKVqUTLONV6K5qjOiI/HIUN1UbJAGn9/AcRSua?=
 =?us-ascii?Q?KXbYVoEUGMRDhcm7LXVoG93Ne7+S4dZf1B/oBjS8Pwn5m3e5O+tnf9LGLgnM?=
 =?us-ascii?Q?IVM0uXfwK+r/sGP4s7t7m5zV3Gpary63qHG4w2Z00hm3VZYQNCr6xh9Gw/hv?=
 =?us-ascii?Q?1YSQbjWBRDrfxVvPFpIwySM5EnC8D4BnppEjBfUYhTZzvdb4v+mIoyiacfAf?=
 =?us-ascii?Q?8mCRXzuUd+Osfoq9PG4LNgkvEJobnXtOIE0RJDOlroXVKpYeyqejRbSc3zQe?=
 =?us-ascii?Q?/cWrjr8m2fuT8SNus+a+6CwecQKY/BgNsNwXoBMkSoIyTDTFJIUatLbEkzfS?=
 =?us-ascii?Q?6w0eQEyL55eEfKSB3t3H0veVlUKnfnUAeTynmqmeOeHTCjxjhtIvfbRTjeUi?=
 =?us-ascii?Q?10wrm+KJV6OmiWB2StBkSH5YiNAvaMXqDkkb69lu9es5Y0/t9R/mLA4kTL1G?=
 =?us-ascii?Q?UQMIO75cWRSODWPIwiuxgZJnjeZ14uUi/aC+IA8wZvFUyzpkIx/BBosQc5HP?=
 =?us-ascii?Q?7kZrseebawNva40ZnfSkUUSDXYG61O+/PFZvkczcP3Qk6dhydUO89MKSlhXg?=
 =?us-ascii?Q?TivHXp1c2vGV5E0W+Ap146EeGf1e408X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oEwHfrOU30oMMiL6wwv4QFMJwWXeZr7Zn1haZQiLoxlUsE6eF8iio9cKZQ/?=
 =?us-ascii?Q?RnSbjKOR8a35XVaYUQIwb2AQ1ZlP19fixNTXoCEN9yvJYZYozN50Zo6wgSAK?=
 =?us-ascii?Q?/tI1DWkZUhVEYLrzg5unKHZ+NAs2zGRZ1I08wQpv8JH9IBKvjPdAB/G3gmUc?=
 =?us-ascii?Q?Ifo9vsoFTCkxkNOP1QtMnadaLPttT5Yyq+UY/VqJnSkOyV6tTP8btsjicji3?=
 =?us-ascii?Q?dtLtKOPW9JWpPtxBC0OJaflOK7NriVBUj1osr8+lFBcwpopNqiL9dPY18mDL?=
 =?us-ascii?Q?/h/6kYqN2r52mRiVM3P2KHTEq/Ri+C1rYyAuw//xXq9UBVXvcqLsVA4qzqwi?=
 =?us-ascii?Q?n6HPwr8xqwZL7ku9zcHyqWfCKi2M98o4B30rL/zXOR4GlMj/Ww6zI0bWIhIW?=
 =?us-ascii?Q?ENZaatSjQkBfq5+ImOPaQsBpskoyrBy71nezpOFgYi8eGvk7mLtSmuGkHbuW?=
 =?us-ascii?Q?1nL91RUIwJrusx0IefxPDB1pdjW83AD9mhbsgo2KdsO76mj8WXrb7rKbhzro?=
 =?us-ascii?Q?vAKIAVST55HmQkFtIcr+/lX4qJxm8/pkxO678ya8ab0aW70dadvihyNMgAV/?=
 =?us-ascii?Q?p1Q9G7yeDWmu5+Krx0e2CGYCBxmKWSf+7cf40BBelRuz8GJkgt/JZbk3Olko?=
 =?us-ascii?Q?nI3khi7BRSRc9Fg07QTqE2V6ApmQb/UInhBqf10KGcWRSna1PgcDRMkjQHJC?=
 =?us-ascii?Q?6x8hz0Mw2Fhm+JU43RXS2Kc4f4UojR9i5c0YKWBYaEhc7Q0gNn3nLOQRRcUS?=
 =?us-ascii?Q?UWEz+Q+CxQ/s49iG5JWKmlG3FPhBENkr4O0eXE009TsTqMENRC6D1aWefdMl?=
 =?us-ascii?Q?fzKqNyWTNQgE9beLeVtJU4AWBcykbr64NdQn2D7QBryoXj7Np+Sa9Xlng2kg?=
 =?us-ascii?Q?0t9LMNlfTsX9MgBy0R0pzo93942T3SUE7NVPYmL62bl1ItWXZTrPMFxYPa+L?=
 =?us-ascii?Q?O6Rc6vtEF7KfpHWqeRbQ39wxlsC8zYEocUG32RuycnzBkDTGEkXomBY44Qh7?=
 =?us-ascii?Q?lIIr6NyNUOB61ZM8g4jDbCrgJvy9C/Ux1F1nYX9PR0lc388BrciGF4XSqz3+?=
 =?us-ascii?Q?Sb1nF95ZCk76/iFhzd9RrBMu8B2Mi7bOQljsF2T+EnDSqMYjxVKPNpP7qKw9?=
 =?us-ascii?Q?5SxGANhS6qAjfig2myF9xGCCcAG4Uaclk0K1Qhuz9ZU+WjpD4VtFuofnLbnj?=
 =?us-ascii?Q?SzryfNOIAexg0vgTPHggBAmznPuiIXbABfw+u3+x/cZ9T0ahnyEVgpTPM7Su?=
 =?us-ascii?Q?y/xWbnqtUxhCp25pUABIMu75tLlfuYag9VhKDyPs0vOHrzwHGGz5d3yhrzkj?=
 =?us-ascii?Q?rzSb+kc8oyNSkgF/YCh64fkMcyh1PQ08Wy1VXdSa1groFdRQORydxymCqGa/?=
 =?us-ascii?Q?Bxc2ssnN69HNcvz71IoB4c6MZjOCeY5TEcG+9lqdJitBEfZ9Uk2lNvPh8rAx?=
 =?us-ascii?Q?W6EgP1UUeNjKhbvrtrGjRceWIy+j/fEN+6pAJ6bRrJr1lOUvkItYtGMLxiWJ?=
 =?us-ascii?Q?hL5jJKvHYgal5eP3uCM4knVG3Uf2JhD+SMGZ9wWFLn3we8mRXj+zvNPYWqL+?=
 =?us-ascii?Q?Xr624yfyZW5QvfWeHcY8fgkEE6jaPv6a/YfkUnbJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5555ea14-b1bd-4af9-3b4c-08de2145a149
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:13:27.7266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rckn+DGKH65Nq4uDQcDkZnnR2wliP4wsHuqHtUum14IJw/sXO5FUzuS9tsXETsPl4ACCgdmqMOW7VWOPnaWSog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

Add an iteration layer on top of the basic list infrastructure,
enabling iteration over the actual container items.

Enables users to iterate over actual items without manually performing
container_of operations. Provide macros to make caller's life easier.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/clist.rs | 210 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 207 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
index 5ea505d463ad..01b78ba157a1 100644
--- a/rust/kernel/clist.rs
+++ b/rust/kernel/clist.rs
@@ -2,17 +2,104 @@
 
 //! A C doubly circular intrusive linked list interface for rust code.
 //!
-//! TODO: Doctest example will be added in later commit in series due to dependencies.
+//! # Examples
+//!
+//! ```
+//! use kernel::{bindings, clist::Clist, clist_iterate, impl_from_list_head, types::Opaque};
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded list_head (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub(crate) struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { bindings::INIT_LIST_HEAD(head.as_mut_ptr()) };
+//! # // SAFETY: head is a test object allocated in this scope.
+//! # let mut head = unsafe { head.assume_init() };
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         bindings::INIT_LIST_HEAD(&mut (*ptr).link);
+//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
+//! #     }
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub(crate) struct Item(Opaque<SampleItemC>);
+//!
+//! // Generate the link type.
+//! impl_from_list_head!(pub(crate), Item, SampleItemC, link);
+//!
+//! impl Item {
+//!     pub(crate) fn value(&self) -> i32 {
+//!         // SAFETY: Item has same layout as SampleItemC.
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create Clist (from a sentinel head).
+//! // SAFETY: head is allocated by test code and Clist has the same layout.
+//! let list = unsafe { Clist::from_raw(&mut head) };
+//!
+//! // Now iterate using clist_iterate! macro.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in clist_iterate!(list, Item, link) {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
 
 use crate::{
     bindings,
     types::Opaque, //
 };
+use core::marker::PhantomData;
+
+/// Trait for associating a link type with its container item type.
+///
+/// Implemented by "field link types" that are `list_head` links embedded in intrusive
+/// C linked lists. Each link type is unique to a specific item type and its `list_head` field,
+/// making it possible for an item to be added to multiple lists.
+pub trait ClistLink {
+    /// The item type that contains the `list_head` field linking to other items in the list.
+    type Item: FromListHead<Self>
+    where
+        Self: Sized;
+}
 
 /// A C linked list with a sentinel head
 ///
-/// A sentinel head is one which is not embedded in an item. It represents the entire
-/// linked list and can be used for add, remove, empty operations etc.
+/// Represents the entire linked list and can be used for add, remove, empty operations etc.
+/// A sentinel head is one which is not embedded in an item.
 ///
 /// # Invariants
 ///
@@ -69,6 +156,15 @@ pub fn iter_heads(&self) -> ClistHeadIter<'_> {
             head: &self.0,
         }
     }
+
+    /// Create a high-level iterator over typed items.
+    #[inline]
+    pub fn iter<L: ClistLink>(&self) -> ClistIter<'_, L> {
+        ClistIter {
+            head_iter: self.iter_heads(),
+            _phantom: PhantomData,
+        }
+    }
 }
 
 /// Wraps a non-sentinel C `list_head` node for use in intrusive linked lists.
@@ -188,3 +284,111 @@ fn next(&mut self) -> Option<Self::Item> {
         Some(self.current)
     }
 }
+
+/// High-level iterator over typed list items.
+pub struct ClistIter<'a, L: ClistLink> {
+    head_iter: ClistHeadIter<'a>,
+
+    /// The iterator yields immutable references to `L::Item`.
+    _phantom: PhantomData<&'a L::Item>,
+}
+
+// SAFETY: ClistIter yields `&L::Item`, which is Send when `L::Item: Send`.
+unsafe impl<L: ClistLink> Send for ClistIter<'_, L> where L::Item: Send {}
+
+// SAFETY: ClistIter yields &L::Item, which is Sync when `L::Item: Sync`.
+unsafe impl<L: ClistLink> Sync for ClistIter<'_, L> where L::Item: Sync {}
+
+impl<'a, L: ClistLink> Iterator for ClistIter<'a, L>
+where
+    L::Item: 'a,
+{
+    type Item = &'a L::Item;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Get next ClistHead.
+        let head = self.head_iter.next()?;
+
+        // Convert to item using trait.
+        // SAFETY: FromListHead impl guarantees valid conversion.
+        Some(unsafe { L::Item::from_list_head(head) })
+    }
+}
+
+/// Trait for converting a `ClistHead` to an item reference.
+pub trait FromListHead<Link>: Sized {
+    /// Convert a `ClistHead` node reference to an item reference.
+    ///
+    /// # Safety
+    ///
+    /// `head` must be a valid reference to an allocated and initialized `ClistHead` structure
+    /// valid for the lifetime `'a`.
+    unsafe fn from_list_head<'a>(head: &'a ClistHead) -> &'a Self;
+}
+
+/// Macro to generate `FromListHead` implementations for C list integration.
+///
+/// `FromListHead` trait is required to iterate over a C linked list using the `clist_iterate!`
+/// macro which yields immutable references to the Rust item wrapper type.
+///
+/// Also generates a link type named `Clist<ItemType><field>` implementing the `ClistLink` trait
+/// that associates the list node with the item. The link type is used to iterate over the list
+/// using the `clist_iterate!` macro.
+///
+/// # Arguments
+///
+/// - `$vis`: The visibility of the generated link type (e.g., `pub`, `pub(crate)`).
+/// - `$item_type`: The Rust wrapper type for items in the list.
+/// - `$c_type`: The C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct that links items.
+///
+/// # Examples
+///
+/// Refer to the comprehensive example in the [crate::clist] module documentation.
+#[macro_export]
+macro_rules! impl_from_list_head {
+    ($vis:vis, $item_type:ident, $c_type:ty, $field:ident) => {
+        $crate::macros::paste! {
+            /// Link type for associating list nodes with items.
+            $vis struct [<Clist $item_type $field>];
+
+            // Implement ClistLink trait to associate the link with its item type.
+            impl $crate::clist::ClistLink for [<Clist $item_type $field>] {
+                type Item = $item_type;
+            }
+
+            impl $crate::clist::FromListHead<[<Clist $item_type $field>]> for $item_type {
+                unsafe fn from_list_head<'a>(
+                    head: &'a $crate::clist::ClistHead,
+                ) -> &'a Self {
+                    let ptr = $crate::container_of!(head.as_raw(), $c_type, $field);
+                    // SAFETY: repr(transparent) makes item_type have same layout as c_type.
+                    // Caller guarantees the container_of calculation is correct.
+                    unsafe { &*ptr.cast::<Self>() }
+                }
+            }
+        }
+    };
+}
+
+/// Macro to assist with iterating over a C linked list.
+///
+/// Returns a `ClistIter` iterator which yields immutable references to the `item_type` type.
+///
+/// # Arguments
+///
+/// - `$list`: The `Clist` instance to iterate over.
+/// - `$item_type`: The Rust type of the item in the list with list_head embedded.
+/// - `$field`: The name of the field in the `item_type` that links it to the list.
+///
+/// # Examples
+///
+/// Refer to the comprehensive example in the [crate::clist] module documentation.
+#[macro_export]
+macro_rules! clist_iterate {
+    ($list:expr, $item_type:ident, $field:ident) => {
+        $crate::macros::paste! {
+            $list.iter::<[<Clist $item_type $field>]>()
+        }
+    };
+}
-- 
2.34.1

