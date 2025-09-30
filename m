Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205BBAD3C2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549D910E5E7;
	Tue, 30 Sep 2025 14:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hw8ljfZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011006.outbound.protection.outlook.com
 [40.93.194.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA93810E5E7;
 Tue, 30 Sep 2025 14:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0G7axpNgG5XqCHoQZz3TSZwgXY22unMW3U0l+5MEW3/5hQ1Lh/Wylk8+on4/+iJqWlnXaX1FbdnQKxdH7cwdFR8gEERN3UWuNXKhfmOm7DyZScFSsXZXwVX9c7VYmlcu7TF0x8WjDF6iVGJ7a4WlS0d7CMZKNUzYhAbclBzu8eZzd8bsFIwpSf4ksgQlldQ1f23RBFfXyPAlFmcPrXQpTS33+Lza+2Eetb2u40TGWlu2RFbTOJ8ib1AfE19CBd25Jy04vC6w3gvqc9zzhHkXZ/H5jQM5C61Kjho7h6LezJqVkRjsCmQBnwhBLLjgM6nPdXkdQ+2fAWcVFGmfyZJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87WKxs7Jc0jKmEphFCZalvKa4d49vCf3u/nKNnPustA=;
 b=dfNeaFFrgGJIVA2kXfe1ogktvq3D9YSEv9T6ifi6y8Oj9INxavxdIVaR4zGkX2Y/Iv8+M29FayrqtndOCDSTjyMcP1S6EDpWwEwYrGh7IL98mlsVn6P0ugBLZka7dU1719Lr2gshSXRcIhGyr+826Ak14dfU1GBy4HlgBeztl6ic3+QGrSFo+4x39OkEWfuoTFNubQ+eAECEVwLcxPBgxcl9hhkKWzRt19q7WwFFmoWTyb5NZw5FgUBvP/vl8BfX7yJd0lpihZx78nEslohufPFApKk/6pb8dbEdYFsWthyMEeDii//QQeJnfoBRyVHvsAMJmUQceba6JFwPyAn0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87WKxs7Jc0jKmEphFCZalvKa4d49vCf3u/nKNnPustA=;
 b=Hw8ljfZ5d3t/RQFFzKLYqRj6Tzkk5wOQxkS3aab0ZIGNzP425fflhHZ0GOXYxFc8QKD4deMajZmTMJqjQDfLCUZS+KgQ32X64TkYuKy5XyTp1kbAGeMkcniwP4bxnquZ1ud27++cIbww0JetbhEOb29o3Q2DfL/z+mg6g/q1veV1tHSsrAWi/FTGIOyhnj3fwW1IECf58koxKbF/KWUItGXfCsEEmfnyLWeOp6Olml5iADQNv/dxL8CVS09fpcmNhBfF2UwFQ+XbXmYB8T5gF9+DneilAqfzo7q+aAHxbTZtr2vASe8YuU/ty3dCSANJ4lo2o71+LwdX+dmDzw0Srw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:47 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:47 +0000
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
Subject: [PATCH v5 1/9] nova-core: bitfield: Move bitfield-specific code from
 register! into new macro
Date: Tue, 30 Sep 2025 10:45:29 -0400
Message-Id: <20250930144537.3559207-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:207:3d::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 2beef687-d10e-4996-0e57-08de00300ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zw/WO7liEaMLQOyQr3fwc10Fsr5W5B+avZQubyqCFW0gXCHuerTpxNqBw6Zc?=
 =?us-ascii?Q?gGxw8qBcscZkoGinitvXeT1a3TP6kDW7LRweUpQBkt1KeQixIcXCcrIN7/oT?=
 =?us-ascii?Q?eONXreCR4gdOgSBUUsxIb9cmDgH18XyMjMfUMXYjL4roZ22HrVZsDR18d+Yg?=
 =?us-ascii?Q?YAM1qp45cwp7wpD32ERAsRLp3gGHKG+EiY5R42PJu4XJCcgqANLh20WtDtZG?=
 =?us-ascii?Q?lxNbbs1JaXNiJ7hc/dSvkKkn7tyl+n/YOcnNTjQmOQpZNEGHqBgNQjSyz51W?=
 =?us-ascii?Q?8rMRV2V4SgktMb7ms0iOi09RfXKuctRg9NUCZXxj+K2cjENd39tbcyHajU0r?=
 =?us-ascii?Q?DK2yc+E8TDapkS4csSOY2zjICEGE4utvnOH8CY6KeJcXP8BfLI61+uyVueKx?=
 =?us-ascii?Q?GTq9JJIc2LT/cDGJo/sV5C4xBj6wDzgve9mzby+ZqMky9NHSHQ0JzAW8eETr?=
 =?us-ascii?Q?pkfc7Y6Fa+kM5l8v9ehLmK36yVTCmyODcebqS5kbw7ytRcY0+XPq2dVgX1fq?=
 =?us-ascii?Q?pU16Nj6bo3O0vhOfFNQfSyZpTqurNB6dAsEJFITaX+Ho3HoqkAvFEqPQX7Cb?=
 =?us-ascii?Q?SIMk5/WaElFUQL6KBgfBTmZUrqwxoyKfNZcLH4F+NUNeoUnOADUk/OctfhhZ?=
 =?us-ascii?Q?0xcx8JSnyumog+/HG7+DogiH8NBL4KgbU/0+pZOtUNhF1PAUvCOazkqIBpVC?=
 =?us-ascii?Q?tQj+5hw5SD+WW4WFSktD+wJt89Om38dFMPnNp74Ymd4inNeTjmdRuGIE5+I2?=
 =?us-ascii?Q?1DKQyc+hz5o6Q8KXHKRnc1+LwcUp+IpRVKt0x3MzAFhE72ASnMvVwh1agNBx?=
 =?us-ascii?Q?3KiXUsIfYlbIV3Iku579BPYKY0huMg6UGkOYPuJcmixGvYeI5USCsNxnWYZ3?=
 =?us-ascii?Q?tQlXKQuC6FJW8YFk2XMXIFwJiMpQNyGpt8b6AB2Pk2TNtZ8yEzTqdoNL+Rb7?=
 =?us-ascii?Q?cIC8T9lPeWlcSarOU1w4mPQ54H+3ZQSyDZmsiLDjAUIn9fcGGgo0v43DFbsg?=
 =?us-ascii?Q?gorBKKFTWM6bxz3G2LDY5zD/EEHVeY3zcimK0iPcB2kysYc7ftuf0SzTrRbI?=
 =?us-ascii?Q?4Op9/gFKG596jL1QN9G7JmCkFuEHxn2UOfZjZS4C0iGmh3byqKZI7/KtkyPc?=
 =?us-ascii?Q?i5S/w4uyPQ/JMIa0KEM2xsGBO4R1bzB1Y13+Z0rLT6Ce4oTcUocCgu84ld3k?=
 =?us-ascii?Q?qFSBLw4eE9fY8EJI5fHdIfU3CY+mPn2Vk1gNg4Hrq4n8u82iUM0kMIXTAlm6?=
 =?us-ascii?Q?/5RryT7bylt7vvpBhYvgvfWfJ/c6BwzXjg0jPdpOZRLM77uQzoCcsSYIrNS9?=
 =?us-ascii?Q?0zLOyl+j3WOyo2sAuCMfUc2paj930vYoblD6DG8zLEWuzUk7JaIQZS15JSyH?=
 =?us-ascii?Q?Tuc//hdhBxRGoAv8IVOIFQUw9U2317hzLge5MF3ugFhMma3CA6Dw4RFf4KQy?=
 =?us-ascii?Q?Mk3jba9ACp1j2D0OjJ+AdbCjphNgcomM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14yLlxgZ08MR3mNA9e5eKv6S+sLgqzgXKfGkG0OsTSmVCw5skEUd9E52uccA?=
 =?us-ascii?Q?qP48GfBz6gl0c5qvVZUE8Lgvj+vYNtIxotspki5+uhSvyu2FJn18AMFYyLLK?=
 =?us-ascii?Q?NH2qeXqtSAWaZfd3KCKuQCfXH+/HWHuoDBWkmhqpJAuIL40T2hnYZBTjmzD5?=
 =?us-ascii?Q?nlPb4JakvMPeayE8kDcWJaLJVqD6Z9At9bKGGfy8kIKpxKTC0FmvjjHuIDZR?=
 =?us-ascii?Q?9+fc0zOYaINc2zY7bwT6e/wHS6g5gaTTBMKfs63o8psUlfHsGTBbnTJBPCtO?=
 =?us-ascii?Q?mAmvM5vweXyUz5XfVGlsV0Fk0gw7T+m7TO8Dx8TBzI1iXXcHCpSaj6SXW4YM?=
 =?us-ascii?Q?w5mhDSl4//sOGpf/mtSd1X1hrTJ2VZIrDmmeatJoI2o81lK0khGb75DC6Rv1?=
 =?us-ascii?Q?swRVXgdmWUwXdVXHxt1P1N+C6X7KaPiW1SnssuFShvzP7O5L99DoOlzC2GBI?=
 =?us-ascii?Q?v7y0VywnYztv92cduMCN9WtFGLY5tvpZuYoBe12SjfZoOUZq5K/qJ8Jzz1U0?=
 =?us-ascii?Q?uNEOAvylB8UQX1LctRv4S2S5HhLgRChGbIpmSLiLCnclZITQgrOB4+O1R9Td?=
 =?us-ascii?Q?ceoTqlNXqk4rnUELCjMRW3uHMDGhN4V6qvNVWV9h0JY/0HdAe6XvfUZuYeYs?=
 =?us-ascii?Q?pCTKsba8gZa4kxEpIiROmspMTCan36Z+X036z5YYJhKfPhXGOjJoaxOIsecO?=
 =?us-ascii?Q?r2KHH4WiPwLMhR/Ah+bzU7F7pHBOUFyfH822RzZJ5vaVWh4kMRYE/MyN+hxd?=
 =?us-ascii?Q?xYkj1vvv4DfZAoZSWnETJpKzvTvOBsAcRyS9w5zPRdJjhzqWd5uzhFSXVJ8l?=
 =?us-ascii?Q?hXd0RK0o74f7+kB9gwAFCE2YOXzWruUBil/sDXWuFDIqr+dRRnl8fQH2CSRO?=
 =?us-ascii?Q?vZe2gsXeyLww+jd3Nf4cA2oW9EeGw/rih2r2yg2mLT8uhRlq8I8QmQIlPojo?=
 =?us-ascii?Q?HqD0yKzNr/r5OsuNT0hXfrCQPIIMBibMI9WMwWAlw29E3ZI6YVUZ31NrXvKv?=
 =?us-ascii?Q?PfEB+hO55wIxTPEqVI+jPoNs6nKqaIT1E64JxgzxflhpANDdnFcNvrRi3tdh?=
 =?us-ascii?Q?SpRgxi/f0tYVyF7xiaaeaE8CFhbKv6ipVDC1qC1zjhM3gNFLniHxBJKegpWe?=
 =?us-ascii?Q?6xYHUMxrNsauwuPCPkNTJ/RWjWm/+V2cCpBV2jqNNf6Wvsugq2lzHLgoh7EA?=
 =?us-ascii?Q?EBRo3srpDrUbW5UUR66d7k3FY8kNPmsfMc8RA+XFCYXCIAK3xzoWQlLeb7gz?=
 =?us-ascii?Q?cpAezvd6UJSxXYd3Eype4R9Yi8YzHMYjsZ6L2mX1W9KJaJTcuh5JiQFjW6Bx?=
 =?us-ascii?Q?Fl18N+bqilyW/EY4WB7Q6H5yNAhYzTpT05qGhqDsrA7Z3nG6g23MSqgDmpfs?=
 =?us-ascii?Q?84DQbnnZRJykXSnOhBMTmgWJseSfbv7yhfW7sjlwvHCx8H6COcGxbw8uhAFr?=
 =?us-ascii?Q?ZTOvmWnE8P8KREojbkHu1Wjgdm4J6ltH/lhb0h2XnJFka3Ao20wMFAHjzYlo?=
 =?us-ascii?Q?HrlzzMLpGDpw/ZeTm2ETkbtGkj43Gz627kQIsWbgHTahX1qQj6jxI/FNu9t1?=
 =?us-ascii?Q?eS44PQfweigq1tKx+VhOlZkHtvu6a9Tz1cbhIE2Orboe6K1wpmd51dQ6YbmB?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2beef687-d10e-4996-0e57-08de00300ad1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:47.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZgDjXCqL/FiVzJLNdirX4BHnNwiv1L4fZ1qbzyrwYPGFwr0ky9pnJHSXchSZYjgabf5/lXTHkh4XwGv5niAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 315 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
 3 files changed, 328 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
new file mode 100644
index 000000000000..b1e1c438b8a8
--- /dev/null
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitfield library for Rust structures
+//!
+//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
+//!
+//! # Syntax
+//!
+//! ```rust
+//! use nova_core::bitfield;
+//!
+//! #[derive(Debug, Clone, Copy, Default)]
+//! enum Mode {
+//!     #[default]
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
+//! #[derive(Debug, Clone, Copy, Default)]
+//! enum State {
+//!     #[default]
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
+//!         3:0 mode as u8 ?=> Mode;
+//!         7:7 state as bool => State;
+//!     }
+//! }
+//! ```
+//!
+//! This generates a struct with:
+//! - Field accessors: `mode()`, `state()`, etc.
+//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+//! - Debug and Default implementations.
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

