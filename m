Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B441BE4260
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B062110EA1C;
	Thu, 16 Oct 2025 15:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tRGhKJGV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013041.outbound.protection.outlook.com
 [40.93.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089D10EA16;
 Thu, 16 Oct 2025 15:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVlVEXe5vKuUlYvuawUbMs1IPljQ1pu6jKf/K1azr9SXQey7nfsnKUYI5L5g6bxA4zeBgq0PgsXy6g5QtAwrCSMUQeO++mPEz3oIKvJe34BYzVxkZbuAvYKU4tTSVqdJuhV7RwhKP++LPnLeVN3pPHyFZ0ITJfqgYjwNglmhDP2aOlwt1afHjKrBx9j2bVIvx031w+Pjuol16I/xrNa5Rz95fiijjr/xieHP70V6GoE3KFbl+o7LnkOVlEVpBCACRpBooG2t3AQBK+PzeaFRKit0A9MaLmQ3UcEhNFJCI6TmRrJPzrrm+Y9nSGiQ+DjdwM8ecpiF6tw4YbhPdqd8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98hQqApuNbYCGknsmr/qe6ay65FjvLPUkzya0UdGw+o=;
 b=XCnYK+ISfKk9iJxaD0USi3DUnuZ0kH0lL7f0y2CpIxJteBViT9RaXMBmLGSMMhr7aeKHWFDr6It/BK3ub2m8ZkmtAchsoAA/lJKeg78PhZkvwXNvfzPXiNt7OxQLuJI7B6O2L6BAcUAbMHpxkdjPR7N8JUXiBsQSExULyw70ukdwGDklq8X2KZUsWjLUveDzQIMZ09TKEvxa9snOAIZzAg0tp5a+SKZTT0sZbmdOKxjoWwYFC0FSJbugaaWiPX7jNFViXCjpQM+GNjjUco6iiRiCKKyFl8wMVD9mKtow3UV8Wf/QmdEFk09nnec3p4qxdjIY87riQTBRywrhxRinVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98hQqApuNbYCGknsmr/qe6ay65FjvLPUkzya0UdGw+o=;
 b=tRGhKJGVQdAyasbfnR0xs8wr2KnlxSmahmpwLmPWvgRx1+Inm79PQWGO2X8yBGPoThuZrG+k1uLn6CSU1p4+cG+4aNtt54V4rfr0biq9d6xO6tby75ThbjB5iZ7egt9gUB6qaGKzFNZc1nkhQzse4XK5GLVcDMNcXc1dlgN6idWB7/hfIy6Y0ubxY9+7x4mfVQ5j6ODGo5ZVKy6Vb6uhuebzVWpIh6iFC1LJw0R2MU8MOPYxidmaj03axbVl6ILBLYltTUyZpLRbpl+xNpuUCi+BmUg3o4jzVjR3h6SoUGU8eDouPGhcK0lJa/bRQyyuJQArHbPsLVLJsCSpV5IYkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 15:13:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:13:31 +0000
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
Subject: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
Date: Thu, 16 Oct 2025 11:13:21 -0400
Message-Id: <20251016151323.1201196-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016151323.1201196-1-joelagnelf@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0864.namprd03.prod.outlook.com
 (2603:10b6:408:13d::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 481ef0d7-b195-4930-4ce8-08de0cc6911b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6OzItX7Ty0pVuJNnj/Hll9SD+wrsYdBKC1KP2sbtnhEG46iAEWCB/eSI/dy/?=
 =?us-ascii?Q?N98Kk5tIYV5EU6/IlBJPONYOu7LWaiQV/YBypUrfdo2aEQnG3ue9xuh5smQb?=
 =?us-ascii?Q?iXMh6W2lGngd63pOhfZsySWAITiPQKhg/dFN+JnmZTIjcxlrqbxg42hjex3o?=
 =?us-ascii?Q?m2LHoReuIB4kkmPyHOXH0TbSeXKKO4wUW4Jrq5k3GFBWTYygT/tdYgBbtPFK?=
 =?us-ascii?Q?gqE6eUKSW5AzuXvfc7XZ9xy8APVe40wi2Pk+yUstrRX1EFfDkHYL6JryA7iU?=
 =?us-ascii?Q?1Z4mEp3F1OukEZjM10VUG6YAZ6UAFKlcgDJL4JA36rjItDKEe3Zr2cX2da1c?=
 =?us-ascii?Q?6FJIlFwGkCidkLkhfiqcxXFu1LS3vuy9ZOi15pwR19c8PhxgDmWArmUClSVt?=
 =?us-ascii?Q?pVhyVcBRkcn8wv8bf7ZlwN+y8bOE+/UVxqUAMYUlr0nIp9P82oKkI2LKXXBw?=
 =?us-ascii?Q?QC2yjPsCXVMHOGUAAFpdJvg93iHT4tthu7wKmrfETuJSdpJlyFcKe89+KyaB?=
 =?us-ascii?Q?7ZhsokYO4EnlPHGyN4nOuNTfZtSmYke4xM/6bfz/OYHrUfWNb8lVjwUBsxee?=
 =?us-ascii?Q?j8i9Q3A+Qd4c4CSa2LYC+E+xdzBVk+3LSLcL2IzYgjBsD2BC1+y34WRmFkMU?=
 =?us-ascii?Q?kQaOfbzoowEJdh5HSEygtF/W+INJlqQZsvukM2vFwGiifSGm9rwsbQyjwZBE?=
 =?us-ascii?Q?zcsIgwBMZ8tBzt4y5hIl1fo3Bl3bRzNB082yOqjii6oHHHBORMRWQq8OHOTq?=
 =?us-ascii?Q?qVn/NSMof6M3CvwD3at3hbAJa13OYoK6z+Bx6Y/MXDep7Eks25S/yhqoYVkY?=
 =?us-ascii?Q?YMP1z9QHsPzvqcQqj1VO1BenQ41NZStykHyzTd6WE1nPsFFqbi+3qZ1/rgKy?=
 =?us-ascii?Q?m8XOiJ2S6WLN+BofJFDGEoxMCCQ0ruUfVoNOhAT+MW7/Xtc4tJhhWJ11MLMi?=
 =?us-ascii?Q?Ogahml+hIiHxzp08JnPcJufBGxB1jvFCF5nINc8Qk2fsvwy68STsqiZTsh+B?=
 =?us-ascii?Q?Mrwqgcc1qdMJ6GwHbPgDB53A2AO4fOiEZrAR1fAQRX3D9zwDVqRiVzNX2hIO?=
 =?us-ascii?Q?c4IwEeYp3AE3RdlAAwDR+RYZnZCRDwM8a+K8jG44703ZCXqmrcODWBV7V7P+?=
 =?us-ascii?Q?kOh8cQyJh02QIGL3akMKgfBoEI0N5egXWLvYY78HKvYc8wGPZ4eReHSLg8rP?=
 =?us-ascii?Q?ECZEZknL+zXpbfwvCVl1ysJKd4nJ8r0Jl0WK7QIH42gyySG58Bo71sNQApjZ?=
 =?us-ascii?Q?tVVKMxpS8UogHGTX/uWmhhUf4tXPf6JFLFeCeaUMhVyJtTyoA3/QToNd4eiu?=
 =?us-ascii?Q?Hm4Feroj0oKEQN7xydvuRgiz3P4P84k8Gd27TNzNjzSU552KMBTdbmTWHgef?=
 =?us-ascii?Q?heAklmwTZAmu+5WWtQZPxf3l4FAm8QXavFP7g4iTEirLvCi1V4PLkrxeBHtq?=
 =?us-ascii?Q?rr+ku03VLpjlvLCpsWjaIF/7Htz+Xvkq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TcFdjqGtB9kWSI8hf3y0qkESHMpAsy/1IgxeomFfBB+ipY4yax+TCh82MgWJ?=
 =?us-ascii?Q?QBtFGm/8PUoUs7mjLWmMABXvTz17Ah9PXK0D02pxlSojjXZL8lqJe6a2IjFu?=
 =?us-ascii?Q?azyifEtgrTGfL9caA3i/lipT+TNiFRwTiRLKSdK6TIah/lv3Q1+zlQsB6J6H?=
 =?us-ascii?Q?oF0dTKf2okSgaTIcd+tYwO8q2IMGK1c05F7D33h7JtIHE1HDGfgwCklnjfwN?=
 =?us-ascii?Q?ceKEzfbvfoFjd2FFBMAMDNmcaMKws1oBd4yoRsww9uC5y571wmI++bVgFcNU?=
 =?us-ascii?Q?5je8zBZ+a5Ik+k9Q9EW8GStSp3f44MM2R+oPKPPad5vaJb7DG+d8AwB5HBOx?=
 =?us-ascii?Q?8GkdT5aqdMTisRTM7jQlZMBBdsFPPRJpIQqKix8RdwKWqnxFSgphEISZjf0p?=
 =?us-ascii?Q?9J76l3AFCkWxvazB9SAgisPKHlowoUqQ/F83+dp0jLmPy2hXhR1sYICXsqbx?=
 =?us-ascii?Q?6S1lILzqIbx09HNAQfscoBBTLH+ODhnUUheTpHdUEebkRVA6zpz3lCN7HmGz?=
 =?us-ascii?Q?Uu5cRsyU8gSDNxQ4Ofl/2tIz93FSB2ZEwAbpL6ps4pvR78m08/phhEL/KDyM?=
 =?us-ascii?Q?NirK+R7MSPHJfFwkRFc3TFWVGonJKt7mCBR4iLmug0CwvwYJHvftoIlOk9Pc?=
 =?us-ascii?Q?H0AKMLyWMQwzTwAi2z2WR+ieUtd3xo/2x0JNRHLZeW4iJ1m5YMQkbQv7I1ID?=
 =?us-ascii?Q?sW7XIZXuCF35PYioWUCJZ0od8rqdE0nV4kpo4Ud8jshIPZ5ZFuwJWDiCBN/3?=
 =?us-ascii?Q?LEqncYan+rHOkd1OCBG1palyDmSZkIvhtZvqSOUX461mdfwf3V5wl5aAOk+I?=
 =?us-ascii?Q?71uYvYOqRCjVYav9UEFINqUFI4JvXO7m3SC0dx5qPko3Dtt877WuYMEAQa2A?=
 =?us-ascii?Q?Ecj2Bj6RgFd6CD2sIUz+2BIonJFCS9zJi+vVpxZcPX1VqI4vMDKa2fGr9kBO?=
 =?us-ascii?Q?H7s7HRUS+6FYmUx47OhLcS3TdRaC74MioMoqAhUiqseKuY8FDG/Tjr70aCDF?=
 =?us-ascii?Q?ZJvwDHFgH7lfmj2rEdCWNTR89HztcuMT4LxRRI3hvPh1WidIQynHTeqztkjt?=
 =?us-ascii?Q?P/2sKSQt8x6/0n18fjZB/T8k/j+YSXQyxmndmqhRdKBB9TvJNcCX3I7Z6dgG?=
 =?us-ascii?Q?GgIviCgeRyS6oXyFhmBbk4HXLQmNG3YP9H3jbm+/1jfxsZ7yK3VdOn3FPdsq?=
 =?us-ascii?Q?MDq8o1stZQ8Mjwz96TQq0WWAd/5tyR4FD5kSzBOvVTOazQ4t4EyJsAI1vjds?=
 =?us-ascii?Q?FQI+/UjBUAGqQ546Is5i2YDmrV8clouIsUadYwumo4sLQ/YCtIGBXqDks8d6?=
 =?us-ascii?Q?H3EnhEZ0qsPIFoKbQ9buh7k5cQCB3LqTemC5/YwEP3YguqAFzY4z74wc/D57?=
 =?us-ascii?Q?707nqUlh+9XUHKRsoX3s1IAr4vqUv9Yre2k2fpNjOx6GjwKq+dN2DjlCThB0?=
 =?us-ascii?Q?Km6Txf2NkIIYCHqqe1itwxlYMfWlNvuXu/5UAuNjf+sSHgsSMQm7x+UKPtm2?=
 =?us-ascii?Q?HoGlPXBQc4U01lSScwjeQmwMxFaOMj/arbZCniiIrDK9+68YeIUFbEMaEA90?=
 =?us-ascii?Q?Sl3sK8A6qvI/7/MySItXkhrFy7m4ADLt62bnwl3b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481ef0d7-b195-4930-4ce8-08de0cc6911b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:13:31.3960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNAQ5U0RaKdBUXdeAnlbCHHaA2/8aamviOGsUL29KlQrfDFOrpuN9X/Q2yqXuCAA0yJdwec4uM6Iw7jxhllBdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

Move the bitfield-specific code from the register macro into a new macro
called bitfield. This will be used to define structs with bitfields,
similar to C language.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Edwin Peer <epeer@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 319 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
 3 files changed, 332 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
new file mode 100644
index 000000000000..98ccb1bd3289
--- /dev/null
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitfield library for Rust structures
+//!
+//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
+
+/// Defines a struct with accessors to access bits within an inner unsigned integer.
+///
+/// # Syntax
+///
+/// ```rust
+/// use nova_core::bitfield;
+///
+/// #[derive(Debug, Clone, Copy, Default)]
+/// enum Mode {
+///     #[default]
+///     Low = 0,
+///     High = 1,
+///     Auto = 2,
+/// }
+///
+/// impl TryFrom<u8> for Mode {
+///     type Error = u8;
+///     fn try_from(value: u8) -> Result<Self, Self::Error> {
+///         match value {
+///             0 => Ok(Mode::Low),
+///             1 => Ok(Mode::High),
+///             2 => Ok(Mode::Auto),
+///             _ => Err(value),
+///         }
+///     }
+/// }
+///
+/// impl From<Mode> for u8 {
+///     fn from(mode: Mode) -> u8 {
+///         mode as u8
+///     }
+/// }
+///
+/// #[derive(Debug, Clone, Copy, Default)]
+/// enum State {
+///     #[default]
+///     Inactive = 0,
+///     Active = 1,
+/// }
+///
+/// impl From<bool> for State {
+///     fn from(value: bool) -> Self {
+///         if value { State::Active } else { State::Inactive }
+///     }
+/// }
+///
+/// impl From<State> for bool {
+///     fn from(state: State) -> bool {
+///         match state {
+///             State::Inactive => false,
+///             State::Active => true,
+///         }
+///     }
+/// }
+///
+/// bitfield! {
+///     struct ControlReg {
+///         3:0 mode as u8 ?=> Mode;
+///         7:7 state as bool => State;
+///     }
+/// }
+/// ```
+///
+/// This generates a struct with:
+/// - Field accessors: `mode()`, `state()`, etc.
+/// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+/// - Debug and Default implementations.
+///
+/// Fields are defined as follows:
+///
+/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
+///   `bool`. Note that `bool` fields must have a range of 1 bit.
+/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
+///   the result.
+/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
+///   and returns the result. This is useful with fields for which not all values are valid.
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
+            bool $into_type => $into_type $(, $comment)?;
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
+            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
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
+            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
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
+            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
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
+            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Generates the `Debug` implementation for `$name`.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", &self.0))
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
index 1c54a4533822..945d15a2c529 100644
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
-            bool $into_type => $into_type $(, $comment)?;
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
-            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
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
-            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
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
-            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
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
-            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::kernel::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", &self.0))
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

