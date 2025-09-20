Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078EFB8CEAF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 20:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4328E10E2D1;
	Sat, 20 Sep 2025 18:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="byEflrYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D609610E2D1;
 Sat, 20 Sep 2025 18:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NthBs0e9jscPspjAhUG1V7f9Q33nslgeKNsLv9yAdZxNe6yQzgfuj+mlnd/GvtgnRBR+Zk5WMvivZt/NxP7wVa/3XzdxSG3snooCha+CIJLTK+7zQk4eXuwqf/m1F1+ZYm6f9TXjwcXDgLOy0bVf/DeMn6Cfd/HeCcPbhdvkWLuSfJJb8k22tPOWcesmkSRSmowAGgfDjB2zULaE/2HPkXClSwPI+oo73KTKwzQFnuEOphsBXmKs7Xwwa9IPdsUcyBrs1ymPZIC5FOwiBC8f68l21zd8IfAJym5hGYGlXoP4ODlS/18ix0xfpfqAjoGF8gWfdDtvhRtWhCO1mrDwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZoE0cAKvdKb6RBArTn56m9mDkV23ManqZEb1TGstDg=;
 b=oL28ip2xMQ224+VxixleyqBn4aeDO1GcPic+tWML4emWChjqrBiTOmh+Fx0OfZI2wEXh5nIfZJu8qekSAOSGr38F8WmeA7d2REvNolTLL4qIOfsOUy8lMkCNJa0PXHV+ZImjklWvbR6p1NxIcIojZMErZaOIYPD2s3f2Aa+mivnyog9FZyRO/WK0rgD/DISy1IU2q+NCC2BTPrGuMKZZpu283ofD/6F4sfjdoSd74T9XPfji+FXCxqsDKpKfzjEES4B4qjEhmfw2b0nLq6TE5FLUixZK7LgmAJQomzfVh7pAtgxPNpnGRzNC0DARXWI7PfYz1wLnMHAeSilOQXvBVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZoE0cAKvdKb6RBArTn56m9mDkV23ManqZEb1TGstDg=;
 b=byEflrYaD0QnjzXFxAylkNjzLNib/oAcjjBCt6dgmBzwIr0NvK/rLtoQDSqjvZFPdrXXTFGLK4HzfJ/xMGQ5KTZKBd9xRIzR8FeBCnL5HJ8oTX4G6xYFqOvFvmTn5vavIOn7T5PAWN2yncrOHDPbtCI8+BPRcW8hfry9PlPU6mi46VO9ovF2KrTNz3bZeVGtTx5SobYEMb/CXsS6oGTsaSLrpdTQoBqAtqls3WpaIWk78r+0Smcp6dEX9/kTX9dZqoAEIYIOV6HHSPZlx3LJVfv/cZgrwmRnTVlBNnnHEA7jFOSsNjFqkYt96H6bwoKt2xyn4b/rWrFGrplC/xDy5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 18:22:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.018; Sat, 20 Sep 2025
 18:22:56 +0000
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
Subject: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code from
 register! into new macro
Date: Sat, 20 Sep 2025 14:22:27 -0400
Message-Id: <20250920182232.2095101-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250920182232.2095101-1-joelagnelf@nvidia.com>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:208:530::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f45418-5292-4bd7-20d5-08ddf872b869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A8wYylNnkVQITZM8S2CS90f8Vfh9DwPK3XEK83FG0PmFpPSuFFBneCaORAds?=
 =?us-ascii?Q?KvOhR3p9Jp0kJTdLKyIP9/JzuOvlrSb42ERs10uu4Wq1ycpaxaoV3O0n3LlA?=
 =?us-ascii?Q?oMo8MOm9UN98k9TH9gerllOheuU0R6glbQhqKatT2Z0QEnBPkSHIdHvT+fgQ?=
 =?us-ascii?Q?P8Q993pfsqOc6qsMzUqAKLUimJEU5pdsNNnxTIvxh4ofxkNzdsRQMSg+7I5C?=
 =?us-ascii?Q?vwUKCR3hFPAiu4++SRrPmRU7MZHF0CQeCFATFXacM5WX8UsekGppjuh917bp?=
 =?us-ascii?Q?lmpxJAp30F75Pt6sYT3Fzyk6mRjDH/IidbQawH5laRSJp7IKUIdbW4CiUjkr?=
 =?us-ascii?Q?oByDXmzBD1zRmpUQCuhHnu6ug2XaonNfZfKtNOrMGS75JxNh3cSV5iX5B6qw?=
 =?us-ascii?Q?QZvUchY9Qgw8EmguCKxoFKrpwOFBft0xPKZ64lSlaLUNA915A916+vgoI4dl?=
 =?us-ascii?Q?AYSVdjpG4xhmz1uuTdPPrLLVt0Mz0hJ1yFdD02fJrVX9O4ilDmjfsulnXqoS?=
 =?us-ascii?Q?Wyz7Wa6A+5eF8RYEf+v+VvIIgbBGu91mZ5akmYHkkAm+gaCOuwBriHO+10KN?=
 =?us-ascii?Q?/QI0kTQpeewHoZLDOluLQG++LYOUjPoIy6LkZJkM54U0HkiZfnrTTn+oSuVi?=
 =?us-ascii?Q?vrScMOjkzsBVaa9mim1JW4kTuZRXAVGth2KBFnoZf0LPTETgpimElVOKqluh?=
 =?us-ascii?Q?FLAZt/TJSAi5b5CJkw01SH72wA9boJfqeRGSzXq9D29iKz4DD9BYbcDhL+SJ?=
 =?us-ascii?Q?AAdNyC1YW/yRHiDkJUkKZ7MR5LQ2tJyqIiuxnapGuPPJTbp8gemWCxPxHSwI?=
 =?us-ascii?Q?5f2hsojbvPOGXVTQ1+jWweuo+3bdpN1lxYBCy5/D/EB8PtS1m3W+D40aicWi?=
 =?us-ascii?Q?VCwTuT5hn0nQok7ObnzsduzsthN33ul2zwVL8a6A7n1u3eO0zvEhBLcKXZlA?=
 =?us-ascii?Q?war2O7bU+wBhlDjaBrnco/DRlupKLr61r1dMojjQs6j8JbGKv1umeor+a7Qu?=
 =?us-ascii?Q?2yEx7H+yQ9H0hUbhLBN1Fnoj0pL62/6QKXaerNOCvrxdu0kx6Aov2Z+aAZwi?=
 =?us-ascii?Q?jKLd4BnO1IhGCp/ZmuocJZwtKa8t0IbJpULrgx91dYdcxqjdAWRF1K8yc+RM?=
 =?us-ascii?Q?oEobHZkGkaNicYIbWbUql1zW2Krn+Apk90LipVrwGBoNFIpS2LpiNr2U+F1R?=
 =?us-ascii?Q?8uNrBsfuWqeRPT4Q8JqK7C+oZwfWbT8zVQ1oT3ihNpDO5SS9iC6SHZsuMNg5?=
 =?us-ascii?Q?mPnKiysHVd9n5qg2f71nsCqnLq2XPWP6x+xQUntddoV06xVhBXEj4eDOT1Rj?=
 =?us-ascii?Q?VzsPIPB+aWTlJ3UcVgrJ4FtWRLEKRFPjRPZkZDkvzoe+jHSj6p+lQxNDm5cn?=
 =?us-ascii?Q?lQzPUiPtKxMmDK2ZUwOvvtWrzHA0XpA87otF2UyN109fcWNR6G32zGkhBbxt?=
 =?us-ascii?Q?SPE3OFGlm7s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B95EanWFLbn8LDBtitm+jS27ga9ZO9fDW+ctR1A4kdlsQsK8d3XOob35LsJX?=
 =?us-ascii?Q?c/tCAh1Hn+nLpwAEQAVFTnvR4mbdtuA0lC0RN0RDgiFd7OtkVQgiqPLIBOW7?=
 =?us-ascii?Q?LDj+6qh8s4QPbJr54QxfiKr0xpfXjYx9p98uyfc0bngc9yRgKCqFUdUGd6mv?=
 =?us-ascii?Q?PqZX6qRX9G1f8GGhe+PuWLPQ8QyEUO2AtdmSMWAS9YZH8knzLRcDiOESqfLJ?=
 =?us-ascii?Q?nYxenNiZe18esDydvNVzt3//hR3Nr2kgROAF09EAM0mgLbNaM6nKKr9vBc9g?=
 =?us-ascii?Q?9d0CyHEGoxq/YUAG99EQMW6wJjHoI+daRy2Xd0CWgX6z6kFlfoSwG2FetqcK?=
 =?us-ascii?Q?p80nfAiqL/KTOuOMm6gU5o3DOr1FfaY2HIjNHIgAKhGX0CgGeOsMGPPTHKPK?=
 =?us-ascii?Q?BLKDqM99fzCPW0NIN3/5akFF1R3boaXuI4rHIxgkBfZ1cVZ1Ac2OYH/MgI9O?=
 =?us-ascii?Q?jcdpSNZzdU4Y8UznjuJkRHDJA2NN0yCIZ91ftdUMh55QsDA0NCYZVypxLGWp?=
 =?us-ascii?Q?gq2Hm1FpQs1X7BmpFyMDeZIY1ehS4tJ63ZnHEd3OXu8/ox2/vWaPt9QP/L7s?=
 =?us-ascii?Q?+bu2i5RvcogVMPZba2o+N91KBcAJJjbrh8iNP99cC/tn5DO/Mk3LbdYvAmDW?=
 =?us-ascii?Q?petPIOJKd6vEqw6BaIaGeYWrOWRoZ438cd/yaiq8oUPDx465KDqaX8uwIBAB?=
 =?us-ascii?Q?t4L5MsLjbxNtLlapKy8mKyhTJ9SqMUlEEaQmkGA0MJnmJOcrxrMl2BdU/vWP?=
 =?us-ascii?Q?bRU+1ay+qB8u3hVS+3haLMxPVAJ7Ga8cCaxtQzWivKGT2Z2NKHFDdDkV4xiW?=
 =?us-ascii?Q?nGnAdxacxSBrwAykH0t/Nc2M8Es5oUt7CjNbxT4ttQxQraxiXn/jdNwpdNdy?=
 =?us-ascii?Q?GU/uT4Zk2WQbu9hs5dRz8vQqgZp/QH29a1/obHVS3qLSN2zbdElATdkQL8/4?=
 =?us-ascii?Q?fRFsExMYui4pwXgCZmin5bewatN/sM94SWh58okh9ul76HcNZn5erdNoHTN9?=
 =?us-ascii?Q?1E7fjvEi3R0TFMu88/wXPbWcpbtSu6PpJ0b1cJnlwChxbrCyJeYFvfCDFJTQ?=
 =?us-ascii?Q?1wvMQcb8d7Rw/ety3WK1JMuN6Z3UmVBt/PVYNpxj9LKv1IbyxMb/FWeJ+k5A?=
 =?us-ascii?Q?v7hgrPHTUa2iUy51chIzAKFVi06Ye3gnLottMnpU/K7V/UAokuLzyC7jJZuf?=
 =?us-ascii?Q?EtvX1BusJPbc1L/nCYvR2LpZaWrVZnIFZILMMhXle9tuXaPgOdHjHf6te+8U?=
 =?us-ascii?Q?FwvSZjbqvA3s91UYkXAXREJIAaiaUrz6ohtqsKmW1tDkQUFIfwgJSfGjRG9V?=
 =?us-ascii?Q?EX9oobUunonHVqsTcymGlYxjZ2beAy+h3RvB6apjLlQIHI26+cKndBgdQes6?=
 =?us-ascii?Q?md0ruB0l/xz3QL6QCNSNSZrsfj9D2B0La+Xx0UhWVszVqCoAj3rA0zF5OTZb?=
 =?us-ascii?Q?4J+kInc69hT/nJTvgEEgcg+nZq2zFI1shkti6rDsoMqTu47cm1z/FWU4uyAO?=
 =?us-ascii?Q?fxItRAOiGvUVXAj15E+Odbqw6nQeDplL9d3EDRr/8aXveMdx3Tu2eG3eytQS?=
 =?us-ascii?Q?xc+em/OfeDUA4+KdZTovOkY0roGNIfY2B7QjzmAY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f45418-5292-4bd7-20d5-08ddf872b869
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 18:22:56.1775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZoVrX8GenF4j1abtG1wak08so39b25o4fpMqELqCMCUCjNwEQwuXd+U5mx+sGBaLQyRMebiOL5ugRCPO7UbBg==
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

The bitfield-specific into new macro. This will be used to define
structs with bitfields, similar to C language.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
 3 files changed, 327 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
new file mode 100644
index 000000000000..ba6b7caa05d9
--- /dev/null
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitfield library for Rust structures
+//!
+//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
+//!
+//! # Syntax
+//!
+//! ```rust
+//! #[derive(Debug, Clone, Copy)]
+//! enum Mode {
+//!     Low = 0,
+//!     High = 1,
+//!     Auto = 2,
+//! }
+//!
+//! impl TryFrom<u8> for Mode {
+//!     type Error = u8;
+//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
+//!         match value {
+//!             0 => Ok(Mode::Low),
+//!             1 => Ok(Mode::High),
+//!             2 => Ok(Mode::Auto),
+//!             _ => Err(value),
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Mode> for u32 {
+//!     fn from(mode: Mode) -> u32 {
+//!         mode as u32
+//!     }
+//! }
+//!
+//! #[derive(Debug, Clone, Copy)]
+//! enum State {
+//!     Inactive = 0,
+//!     Active = 1,
+//! }
+//!
+//! impl From<bool> for State {
+//!     fn from(value: bool) -> Self {
+//!         if value { State::Active } else { State::Inactive }
+//!     }
+//! }
+//!
+//! impl From<State> for u32 {
+//!     fn from(state: State) -> u32 {
+//!         state as u32
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     struct ControlReg {
+//!         3:0       mode        as u8 ?=> Mode;
+//!         7         state       as bool => State;
+//!     }
+//! }
+//! ```
+//!
+//! This generates a struct with:
+//! - Field accessors: `mode()`, `state()`, etc.
+//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+//! - Debug and Default implementations
+//!
+//! The field setters can be used with the builder pattern, example:
+//! ControlReg::default().set_mode(mode).set_state(state);
+//!
+//! Fields are defined as follows:
+//!
+//! - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
+//!   `bool`. Note that `bool` fields must have a range of 1 bit.
+//! - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+//!   the result.
+//! - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+//!   and returns the result. This is useful with fields for which not all values are valid.
+//!
+macro_rules! bitfield {
+    // Main entry point - defines the bitfield struct with fields
+    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitfield!(@core $name $(, $comment)? { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
+    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
+    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
+        $(
+        #[doc=$comment]
+        )?
+        #[repr(transparent)]
+        #[derive(Clone, Copy)]
+        pub(crate) struct $name(u32);
+
+        impl ::core::ops::BitOr for $name {
+            type Output = Self;
+
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::convert::From<$name> for u32 {
+            fn from(val: $name) -> u32 {
+                val.0
+            }
+        }
+
+        bitfield!(@fields_dispatcher $name { $($fields)* });
+    };
+
+    // Captures the fields and passes them to all the implementers that require field information.
+    //
+    // Used to simplify the matching rules for implementers, so they don't need to match the entire
+    // complex fields rule even though they only make use of part of it.
+    (@fields_dispatcher $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        bitfield!(@field_accessors $name {
+            $(
+                $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+            ;
+            )*
+        });
+        bitfield!(@debug $name { $($field;)* });
+        bitfield!(@default $name { $($field;)* });
+    };
+
+    // Defines all the field getter/setter methods for `$name`.
+    (
+        @field_accessors $name:ident {
+        $($hi:tt:$lo:tt $field:ident as $type:tt
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+        }
+    ) => {
+        $(
+            bitfield!(@check_field_bounds $hi:$lo $field as $type);
+        )*
+
+        #[allow(dead_code)]
+        impl $name {
+            $(
+            bitfield!(@field_accessor $name $hi:$lo $field as $type
+                $(?=> $try_into_type)?
+                $(=> $into_type)?
+                $(, $comment)?
+                ;
+            );
+            )*
+        }
+    };
+
+    // Boolean fields must have `$hi == $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi == $lo,
+                concat!("boolean field `", stringify!($field), "` covers more than one bit")
+            );
+        };
+    };
+
+    // Non-boolean fields must have `$hi >= $lo`.
+    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
+        #[allow(clippy::eq_op)]
+        const _: () = {
+            ::kernel::build_assert!(
+                $hi >= $lo,
+                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
+            );
+        };
+    };
+
+    // Catches fields defined as `bool` and convert them into a boolean value.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(
+            @leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
+            $into_type => $into_type $(, $comment)?;
+        );
+    };
+
+    // Shortcut for fields defined as `bool` without the `=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+    ) => {
+        bitfield!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
+    };
+
+    // Catches the `?=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            ::core::result::Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
+            >
+            $(, $comment)?;);
+    };
+
+    // Catches the `=>` syntax for non-boolean fields.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@leaf_accessor $name $hi:$lo $field
+            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+    };
+
+    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
+    (
+        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
+            $(, $comment:literal)?;
+    ) => {
+        bitfield!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
+    };
+
+    // Generates the accessor methods for a single field.
+    (
+        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
+            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+    ) => {
+        ::kernel::macros::paste!(
+        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        );
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn $field(self) -> $res_type {
+            ::kernel::macros::paste!(
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            );
+            let field = ((self.0 & MASK) >> SHIFT);
+
+            $process(field)
+        }
+
+        ::kernel::macros::paste!(
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            let value = (u32::from(value) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::core::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
+    // Generates the `Default` implementation for `$name`.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the bitfield where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value.[<set_ $field>](Default::default());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249f..112277c7921e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,6 +2,9 @@
 
 //! Nova Core GPU Driver
 
+#[macro_use]
+mod bitfield;
+
 mod dma;
 mod driver;
 mod falcon;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 754c14ee7f40..945d15a2c529 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -8,7 +8,8 @@
 //!
 //! The `register!` macro in this module provides an intuitive and readable syntax for defining a
 //! dedicated type for each register. Each such type comes with its own field accessors that can
-//! return an error if a field's value is invalid.
+//! return an error if a field's value is invalid. Please look at the [`bitfield`] macro for the
+//! complete syntax of fields definitions.
 
 /// Trait providing a base address to be added to the offset of a relative register to obtain
 /// its actual offset.
@@ -54,15 +55,6 @@ pub(crate) trait RegisterBase<T> {
 /// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
 /// ```
 ///
-/// Fields are defined as follows:
-///
-/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
-///   `bool`. Note that `bool` fields must have a range of 1 bit.
-/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
-///   the result.
-/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
-///   and returns the result. This is useful with fields for which not all values are valid.
-///
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
 ///
@@ -284,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -313,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -334,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -356,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -365,241 +357,10 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        register!(@core $name $(, $comment)? { $($fields)* } );
+        bitfield!(struct $name $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-    // All rules below are helpers.
-
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
-    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
-        $(
-        #[doc=$comment]
-        )?
-        #[repr(transparent)]
-        #[derive(Clone, Copy)]
-        pub(crate) struct $name(u32);
-
-        impl ::core::ops::BitOr for $name {
-            type Output = Self;
-
-            fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
-            }
-        }
-
-        impl ::core::convert::From<$name> for u32 {
-            fn from(reg: $name) -> u32 {
-                reg.0
-            }
-        }
-
-        register!(@fields_dispatcher $name { $($fields)* });
-    };
-
-    // Captures the fields and passes them to all the implementers that require field information.
-    //
-    // Used to simplify the matching rules for implementers, so they don't need to match the entire
-    // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-    }
-    ) => {
-        register!(@field_accessors $name {
-            $(
-                $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-            ;
-            )*
-        });
-        register!(@debug $name { $($field;)* });
-        register!(@default $name { $($field;)* });
-    };
-
-    // Defines all the field getter/methods methods for `$name`.
-    (
-        @field_accessors $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-        }
-    ) => {
-        $(
-            register!(@check_field_bounds $hi:$lo $field as $type);
-        )*
-
-        #[allow(dead_code)]
-        impl $name {
-            $(
-            register!(@field_accessor $name $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-                ;
-            );
-            )*
-        }
-    };
-
-    // Boolean fields must have `$hi == $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi == $lo,
-                concat!("boolean field `", stringify!($field), "` covers more than one bit")
-            );
-        };
-    };
-
-    // Non-boolean fields must have `$hi >= $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi >= $lo,
-                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
-            );
-        };
-    };
-
-    // Catches fields defined as `bool` and convert them into a boolean value.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(
-            @leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
-        );
-    };
-
-    // Shortcut for fields defined as `bool` without the `=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
-    };
-
-    // Catches the `?=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
-            ::core::result::Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
-            >
-            $(, $comment)?;);
-    };
-
-    // Catches the `=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
-    };
-
-    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
-            $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
-    };
-
-    // Generates the accessor methods for a single field.
-    (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
-    ) => {
-        ::kernel::macros::paste!(
-        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
-        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
-        );
-
-        $(
-        #[doc="Returns the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            );
-            let field = ((self.0 & MASK) >> SHIFT);
-
-            $process(field)
-        }
-
-        ::kernel::macros::paste!(
-        $(
-        #[doc="Sets the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: u32 = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::core::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &format_args!("{:#x}", &self.0))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
-
-    // Generates the `Default` implementation for `$name`.
-    (@default $name:ident { $($field:ident;)* }) => {
-        /// Returns a value for the register where all fields are set to their default value.
-        impl ::core::default::Default for $name {
-            fn default() -> Self {
-                #[allow(unused_mut)]
-                let mut value = Self(Default::default());
-
-                ::kernel::macros::paste!(
-                $(
-                value.[<set_ $field>](Default::default());
-                )*
-                );
-
-                value
-            }
-        }
-    };
-
     // Generates the IO accessors for a fixed offset register.
     (@io_fixed $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
-- 
2.34.1

