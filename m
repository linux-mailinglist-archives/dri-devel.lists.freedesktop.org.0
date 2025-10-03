Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28478BB75EE
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC2010E90A;
	Fri,  3 Oct 2025 15:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EJUBFZSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4505910E90A;
 Fri,  3 Oct 2025 15:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENA3jw1TnnUJ1xafBjxkjf2Ny0OofbrY7YJwV18SKCHSPEQPWS9KC0eMlri4jWJv5VSg5esBKEmirQxGuV1qhFxwuyh5BX8K2i7v3Z7qBBNmNM9ZgvV0aW2d7b7T9CzcsWTOnZckHCLjd2MwVk76DSGtvpzHo1vDKTlHM54YltAW9P5ozMoRFYHri+SNtEpsLCrglX8OO5XXXjQ2XKACC1viM+0S+tY4CLjerVqgolIK+L812dcx7U5ONmbI6aqeyQLQTPtnJlGnhxkyU7MoPjAD4eB6Uf/wKa8lHb5OMZKM0gyASv/3fYKFntYTRgmZYGdLjpOkK/RnOF/Id75a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Zu4WnKxS81fwCLW/6lfcz7srFLvC/+CJNK2p1fwATo=;
 b=i6v9hds9BaC9qamAIIOPu56XiwK4XL0jdeit5P+zt/wSvzGc0QIO8qPr6G+o5JyHjf9J+vmQhJPMhYBfkkeqxbXHzmi4nGgj9oBxKsYrkBHZJWlrsWrs6SUKB70FiOcAGF2iWSsyqQ8Td6pVrVxFo7vU/73dSJeL3R4qnTsNv9Wx0QXMyWE/QpVmKaIoLeBXrOnoL2VYfar7uzmaK875zBJDCgRrYEv4BKHfFPSWKxS2dqA4EfV2U2374hi6n2cYWJnjhcU/KT08PIwQPFizeyE9L1gBV/NdYqdD4O7808yphfBpdP/n+pJUc5fa6QcdJbAeYKz4y8URhHCmHc9COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Zu4WnKxS81fwCLW/6lfcz7srFLvC/+CJNK2p1fwATo=;
 b=EJUBFZSEM46tXW0Gl5ypnEPgezCQS+9P84GvslHGNlpF0Cpn6crC48XSXTUgMf69mAx7ck1sjzItE0i3yrF09QsvzGFo/ZTicDr4DNzTGUeglxfTxeVA8CSJocBFbopiOGAuDqSaH3LIQydrm1MPPegbrhEro5trfgtIhR8UAVqALWd30TJ5245zQ+CVqEnQ5J2kYWPt+IAboxwqWZ4amGcCkdAWSlQu7NURpjnhhsCwQVpn3PCXi8QQWGB0Z/DfCdFm8YpArf+BfMdoURmplY2CNHD/pErvqLArP1IixDANSP9RDJzhD4UOOUHNAILQRcLdPwAoGL4c5KE9uw8qaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:47:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:47:55 +0000
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
Subject: [PATCH v6 1/5] nova-core: bitfield: Move bitfield-specific code from
 register! into new macro
Date: Fri,  3 Oct 2025 11:47:44 -0400
Message-Id: <20251003154748.1687160-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:408:ee::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: f252f711-0c4c-45ae-bbb2-08de029437d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xlwTS7hDRpp4WcFn++vUp8wPXAxmRaV41S+tt8QFZ/q5bLwXgy3IOLdIb9vE?=
 =?us-ascii?Q?GJ5KuSLyPRV+90OLPwipGqAoGmSDY50mExAGIvB014YPQoVytF/eJZtYLw4u?=
 =?us-ascii?Q?NKI17iPD0Lc7NgjG3sRU6ZLHyNBBRA6oWRMHruwCO/+WfHwc+kBxZRc1/XUF?=
 =?us-ascii?Q?OQwkYQ9bcsDGwvszFh5T1WCoaoSYsQyXCHWyGGEU4dlAqkA60DAgQbGLEeDH?=
 =?us-ascii?Q?JHorBkSyeCMZ82lV+dLxeZ+iOsR1HA1JiyhZoL3N+JQxFgjz1sLUPu8avMDV?=
 =?us-ascii?Q?FR3XO69/0kCHu3Y4zaOZNgbSzXt4P1/Cog40/Ol4bMgZh32O7NOIpjMUfHoy?=
 =?us-ascii?Q?bMLBRCkTIg9kd0kFf124lP22Ezxvz7v/2e9n6kjnIXzQImZSXbSotboEyHCe?=
 =?us-ascii?Q?/fFKm15cM3hOXGTEy3tFebDJteiu2R7BhhroJqNox7OKhX4fkejBnJ0GbPKW?=
 =?us-ascii?Q?e8DobvhGyBBHXeQoVTL0T3cVpaE5US+Bi6q9a0QHNxdccwYS2gUc8VPyJnKw?=
 =?us-ascii?Q?sEQtWbqwWOuznhXFMcoQL4H91qz2Z/p50Z/sFuG0kG6D/bobpnDgGmMMT7+k?=
 =?us-ascii?Q?GMw/QHjbK61jw5X+U8YOz1zP0GiOX7zUcaHKygizsndaRo5JZvA7j5vAIFx0?=
 =?us-ascii?Q?cvCK+vn+1GLR2t5KHW3neInKlvnTTmdk7oFpsDFogzjgM1oMy/NvRKGGSuI0?=
 =?us-ascii?Q?rLRPOCr4SKen7luzxMb3097ZxMBh8n0p/CqUDJhmtJGxbVHWQXlb8DbQMecR?=
 =?us-ascii?Q?AGVargsFlaDsdHpFYGc6ruTe58UTozduTk50yvjMJocTgMf0HfvFsvpUXLGi?=
 =?us-ascii?Q?u67ejWcmB42YXLoQsnyRKVEN8g4UQ9E5sQ0Qw58TxUUdCuPohatfTKXVFJca?=
 =?us-ascii?Q?+GUBrBq60QDYhQJoxCUm3zofJ/tJSzvO7pfhBi6vCFoll6BMzESNTY/Sqpyi?=
 =?us-ascii?Q?G9LcV3I9mXI8iX9w51a4UMnZzTmEBaz8mfJSUMhs71Is5qMzDHdzGyA7q7wR?=
 =?us-ascii?Q?xlLd9QyGXURz/8V67nNNIBzBiT8i3teEJkSeXWZTLEyaknO+f+yfnd9ekJbO?=
 =?us-ascii?Q?7yLOnzhnpjiIfkQunnXvliWu1Oh1QWToRm14cYcl6VQSbdWq5FhMq2eCShbV?=
 =?us-ascii?Q?lomUjtx5DdSsD2B2VEeVl41O+4/JkH83HFegLH+RwE6JaYSUSNit3VhuhQIx?=
 =?us-ascii?Q?arBjXREUV36LslZXIJVNk7onFL1aJe79utjPeMXafdOduhSpPpfAjJa1HWUp?=
 =?us-ascii?Q?pjuiUflT5+JH++1RhnNl5l4NCrLy0TyTKUnyNQmjUPx3jQQtg1LBU+IEsnfd?=
 =?us-ascii?Q?RVtg9fGbgOfytZmW0/zxAGDrObtuaOWFOaUiABoVDur3/RUGmKHwuYmxNetx?=
 =?us-ascii?Q?SfxiVpkqj1XXmOs8MpOttTu/eY4FlCu84rHioH13CLYf+VQr7eXG5TqSABzS?=
 =?us-ascii?Q?fxfiJSeIPUwXCK3mkt10yPbJDQ5AyakT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxOJyjtgeCt208FW88INEC90LI3X4mh8zVoWEQq+0Bdhb3gmVFF02PiyQ81Q?=
 =?us-ascii?Q?47QiPDN2MCmOUrTPwNLIRjApl/qDpJGKy3kMVEdbMiDi1uxpV3u06cvxwzyM?=
 =?us-ascii?Q?KeukABLurnKHZ/+FKITELuMLII5YTouhnTDE7Ahkks7CFo5W+A5kKo/HauEv?=
 =?us-ascii?Q?SrUD2OUErY29VuhhsStpopKq+b19I5pUkc3AwlNxhTcyL/zXsJgUgl3yYHFM?=
 =?us-ascii?Q?OtafuruQG+Pm9Llbpa9dZtP8A6JQIy4HZEOber2GcHWIp3qesj+M5KtMYlrT?=
 =?us-ascii?Q?Adqlu6cr36xPlF869//ss9AWjpv689zUojbW3FaCR7NTKFZz8TRqcgtPTwx9?=
 =?us-ascii?Q?+o7HLhPVbRXubiAkmPyJfKylY6oSVMk1MolkjEEtd1KlIyirKsFhZEA+U1+v?=
 =?us-ascii?Q?atwvpk5P9If/2+7WSb1U0Cjp4Cx56MODS8IuHbeoooqlzOzEssl4QDZFt3h+?=
 =?us-ascii?Q?A21QIfQZCbBf8HnO7RgMxVFr6PxUmzM/UAOFYn9rfnX7EOWyQ1vhH5/NOCuw?=
 =?us-ascii?Q?K8kpxzYsPpIKzK5EYPK9MQpcBPCgd3pfFailERCdo52GbBmB8UeFmfwfoFS+?=
 =?us-ascii?Q?dYUeCPBNJq9z6SPASyPUPTJJPYdgvrXTG3kF+S7u+SvmgWaJwC4PNFWY+Nfs?=
 =?us-ascii?Q?sF1gq6fg6RaBbzOLvkOd0TpkcSGWdZYEghhPqyS6LT+pqvHetnHtLuvuhIkB?=
 =?us-ascii?Q?6wEAoTgbfUk2hon8v4EDlHSgwDKl67DHLNcG7+aV71s/jjAopHANtkqk0h9z?=
 =?us-ascii?Q?l93b5CjUnz+f6NOq946VG+3Lf3HGydLORpRViQHSI4DtSJGCIFLIyydU0dGV?=
 =?us-ascii?Q?86fAxlHEExuWXgNj5CsiYV6oE6kRYlskwipvMaz7fuKEiC9UGxjSHTiN1oLj?=
 =?us-ascii?Q?4Z1SpZQSjw3vWjOZlZkwXKxyXUUtJYVG9O5/CdksxFkrWWXk9/Qr6kZIy5Ar?=
 =?us-ascii?Q?jU0DKV4aU6XF21SQ2XmUMGR3np6/mVjLvl1W5jEa9QNetgA2munwsfA7Tx67?=
 =?us-ascii?Q?aL3pQc+lkJm4U3RpmVtvZFsztfO4rGQoxkhD9H7W+yxeT2B057lWMlOwIjtu?=
 =?us-ascii?Q?PA0kzc3gOG8usQCTYMiGEfhdkn0QiccEY1NhhiPdZPNQC6V3DCkYc0n6wkgc?=
 =?us-ascii?Q?3ui2aNO32uhuIOGZIJctKm4zWgeSIv7sOGeGl2DR+q2Y1CqYF13aenAB2M4y?=
 =?us-ascii?Q?gUXDpMccc5z/Xas3uaNvVQjDowTCHbE1XedHIW25Msj2Aji5Fe69eay0dVXv?=
 =?us-ascii?Q?hlgUlZgtCP9pb5U/fc2PoZRf64RGuumPgOEhr3wBLYSfG2bwr65/tm3X2vX/?=
 =?us-ascii?Q?NrKyNPNkLPPYY9XalqZMQYMbKWX7y7mBp8US0ddLGkJjWXaL0ahJREYu2Rw6?=
 =?us-ascii?Q?zCn3pmEfus3FYU81aF1NLtVSwmNoj+XsmZtbBNJeJ7Xng8Ze+NSfasmF6GYF?=
 =?us-ascii?Q?cIGOrLNxI7mSXIPBTy2xDqr9KJqHf1N1ZWGLkOE9/8pcSFEM77eVrqncYPbA?=
 =?us-ascii?Q?oQquvdYYXWVRRdkyXplsw92uSQZR6dn65Mi1kA2RceSoyGVvtJ7dS7HydBtz?=
 =?us-ascii?Q?C2BS9jtYdbytP5TAkpGiOokJXHFge+KJDVMne9iq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f252f711-0c4c-45ae-bbb2-08de029437d2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:47:55.0304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5CTIsFmhoY9+yBpjkn1OS7JzKDijEUbPLRaNsL4ZVdZH2BkkX6G6Dko95NVWeSVjm62/Xj6rOsoerzeNHWHUw==
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

The bitfield-specific into new macro. This will be used to define
structs with bitfields, similar to C language.

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 316 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs   |   3 +
 drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
 3 files changed, 329 insertions(+), 249 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
new file mode 100644
index 000000000000..dd0ef2016ff8
--- /dev/null
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -0,0 +1,316 @@
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
+/// impl From<Mode> for u32 {
+///     fn from(mode: Mode) -> u32 {
+///         mode as u32
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
+/// impl From<State> for u32 {
+///     fn from(state: State) -> u32 {
+///         state as u32
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

