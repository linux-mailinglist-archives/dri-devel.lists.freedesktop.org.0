Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA0BE4156
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D594110EA06;
	Thu, 16 Oct 2025 15:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7OnKQIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0D410EA06;
 Thu, 16 Oct 2025 15:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI2kJy7K+MvGMbcmKwyNobYpVaLVrmcAOzUq9DEDYwU8sRCOtMZ9/zkI+XqIzMoYa4TnD+xelMRK/UWhX/xEGrk5L5WUo7V6wcescQUg8ZcIICsPs8kLC38YhLtWp86PxhEKZ3ftaZmkl00daB+mP2NzJYpsChDnmPiGod47WgLR0uoRj+RRf3At2U2ttSt79yWoPB9m1trsK4jFtNS7/K8dg6jt/yBFC6egF/jh1rioQIWVfqNdOTyBKwycyCBEdDjCP4EoGLYIy1OxpMEuTjVdcM1yfI/4haYMR487K1J9f4oMzhrcAVNosCmayXPigsdvlY386N0GfpKR/6deIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6meS+H2iiaBUmgHMHRC9IKBgy8PhGVTZ6C6trHfL+zg=;
 b=THeCr0uKj6ai9BnGYH5KvcvdaBvq4KxCMQ2JDaZBxs7kkYYCqnYHykH8vUvrBXWLeCLATSH/sJRBfT3vpAJ+m3sEmcOES+We5oks/oeXaTe+yPR0+Wqrx7DmC2YgfjU8KVqS0UgqyDtL2gbk6NdlkRaL8PBZvAAikZcnzWqLWi6mj5FcUbUTZt6KT/KloY4c8idSnCYobZL3mVUc1obfEJbhT0Sic8KR8IQeeQPDY8rlY7VWX+q2LVKvYSC9fogssnyiFrfNR0Z0+jE3/1Od7WSgpb8rBiEcKi4eWU1EftE6W+TnpqzjdvO719oZRR001IsEmHWIKgST0BYgbPL/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6meS+H2iiaBUmgHMHRC9IKBgy8PhGVTZ6C6trHfL+zg=;
 b=f7OnKQIoIzyKvE1rcAR1YKWRXcwIIQOxThRxGevF+zwiD8CJDL0i+K5u1SqhuaGbIoE6SBhbcRQITBlhLUOCzcY8bujbdvrGcfAabr4fyhAdSwDMQB3lVdQR60jRdeITuwi9JCvy8FawllCL2cuhs9Cc575mGkFyt477mnpJaMGiZGCOd8ICKsCFGSk87rfan5NKPWMu6taEtEyo3Hb5vzEUPUSQcHQpbZrbyQA1MARcgZ4MJbz9cnCy5+iSXT3R7o7FcCty/ZGvaBV3gdijdM99xjC3zvKATL6RiuhTPtkaLw5iIvz3Trkz5O0QTqQcf4zURWuRdEi1v4PSzmlHTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:02:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:02:22 +0000
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
Subject: [PATCH v7 2/4] gpu: nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Date: Thu, 16 Oct 2025 11:02:02 -0400
Message-Id: <20251016150204.1189641-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016150204.1189641-1-joelagnelf@nvidia.com>
References: <20251016150204.1189641-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0593.namprd03.prod.outlook.com
 (2603:10b6:408:10d::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 3083c798-cc53-4cca-15ce-08de0cc5026d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dzudhJFNmubVqQtLeEPwzgp6/jG/tTNeSNRCeiH2SiTNhG3QXI0J9nWgL+ti?=
 =?us-ascii?Q?qNC/EQOX9hM8i/GhL5JK3VbVl1qOVvbeOe9QDkOAHjkWpkifUBeLtu9B903x?=
 =?us-ascii?Q?uEzosKApbuYUqTZh0yOUUTUfZehFss3CMujzFxPnT1AwUtdHlfjzbmM/zo2/?=
 =?us-ascii?Q?JdhbNKWn461+AXFIvY6h4EV0+6R2LJfW4fAy3USlaHjZ7+D+E7gbBNZLK1xi?=
 =?us-ascii?Q?e8ZltIERDRt3Mjy6oM6uCMCVijwbRNg58owJpj7WnQtzMWvOyZHIRgLxplCA?=
 =?us-ascii?Q?j1aJ+9a2wnBUS/tr4VjCzSGirfqob1g/YfHFF+hwbJufp4/ZKgV8inKaiTM7?=
 =?us-ascii?Q?366Zx3SrU0MUQbeTX1ItSa7t3MHMtT3FHbjXq8rm05PccLbbLqneNzdy4vvZ?=
 =?us-ascii?Q?xekciGihuZdKmzkDhlPoEgCVhLvy9t3u8M0Uwnp8TsnqjgnIEHcSWsKChPAt?=
 =?us-ascii?Q?TS49oXavU/R2VD6GsK/E+xz7R87NS6/SUwW3eDqm6cYZG4fzyItnkyxHyaYH?=
 =?us-ascii?Q?xGuY6PA97gCt1vQ6kSWkryLt2eSIxxuO7Of/fozTNXP07+rVPYDqL1PjjeQk?=
 =?us-ascii?Q?699J1DcfCZvCMCq1TiJBEeL7dqB9i/fAtXCGtuwHmQPzwU+0g126sFuWhLOK?=
 =?us-ascii?Q?ZqyTyyd8w93L8YJ739sE0vZK10wLHlh3ZZyFy8LArwzPpfvNgM802CmWIPu4?=
 =?us-ascii?Q?55d6pDSDutDaA3s+Zz0eBP68lQhSDujHer1YlzcvqdVUvrjGH88UlKgY1/LT?=
 =?us-ascii?Q?du2BfERCVcdB5gkJtBHufYoJWj08AZO6RHzqgxrD6a2QVR4xX2wt3YZ9Jgx9?=
 =?us-ascii?Q?o2Gz6vqFNEfEMpnnfEOKobDFA0RUMtOCHTsR+koVfdvnCNxw1OnS3vyjyF0q?=
 =?us-ascii?Q?R6079T+XE4W623XaT6NcjMMXNrfCPBmdhFmtOJnzcOLgAO4A92rr0CcNsw0V?=
 =?us-ascii?Q?QZzldHCcax7MDsoubR38Zzj8N8uLkzdhXyb4TWgnnXTE2I3neV8RnsLLoJ0d?=
 =?us-ascii?Q?JeQGBSfirY7YfZ2QlOm5g8ebh8sV+pHPukQj9sxVdrbu4/b19fDqOP9m+BW8?=
 =?us-ascii?Q?Ph7qFlzUsHtkox4dVso5YU+U/Z044ZKt3dVFhflbjO3rTs1wIWZfy4/F+uPl?=
 =?us-ascii?Q?Sc7vpFq7Ot4M3C/IRPZU0EAw/MzvlP8nAbu/1xf6qKWYKKFB6Sp5gXwNZMux?=
 =?us-ascii?Q?RqJCcXnIBmIsOsT5CsDaVz8SUheiv1anhTD2FDFBSSdLewxAP2UzeGqpL0A0?=
 =?us-ascii?Q?ihxOMGXId1YoUMJNvl4Uljgtdp/9UZQmdmcrafrCztn7rOis96JOFN5zyZ78?=
 =?us-ascii?Q?Ml97QzA32JDVdEXbKmYbNsSFUoVmMiformsWdcv2YirW5jKT8LX8i/RNxTP3?=
 =?us-ascii?Q?F/eGHK7fTdv1mjnR/gzyzLLZgcLjiYoaQLynkEW/KR+b/Fl2mUf+T4hFeJQy?=
 =?us-ascii?Q?mLNdP3qbJJqdP2kpToAgY494jFVhN3wk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cuuwIX9FelBUlJfZT+LDiP1GmsxrxfIEguKAnXBlS/Y8kthZUJ91AltxVAvh?=
 =?us-ascii?Q?x1JNNgPiGDJxv2S/Nk/frAqhRJJkP1h1WYWfvbqdZ8Lq3/v4NEqUVwep82wL?=
 =?us-ascii?Q?lXEXCwbaKSSb/QdF16Lg9mfQROYRlfGG7y9P8+kIP1ZnzVa5P5CohXW9kqt3?=
 =?us-ascii?Q?524FpzlNkNp7ZYT7uiIGCjZfZitfB3MHCkB5tTpOHBn23hAr+Sv3ubbISi/E?=
 =?us-ascii?Q?bVceD9OoaX+G7kVQHo1Jzs+YN6teucAt3dKAREhkdqzSIaFm2QgheF64x5hh?=
 =?us-ascii?Q?qQZaaPGCPGMUTiqHczFP9+eOorUsMQpCxuDemJhTPKro6WLVyUFoFDbmok2y?=
 =?us-ascii?Q?Kk9U9CEBSwJmO3BbmGdEBMDSDRXkTLgUiprWe/YWnH8Eoynhx2YOW0NfmiDX?=
 =?us-ascii?Q?OV04MMsmiBuRyklrsie22JWmVO6Y0ABoKuraUBuvU+T+bZvt22MlEdt8A/0d?=
 =?us-ascii?Q?qSG06fSzQm4eS524W2aJ/Gqk3gV5fxhgyurRSQMZ83+Do5NzI4YSdgbb9H8j?=
 =?us-ascii?Q?x+Gc0q5a/vz7PtPQA5oj8NuW4gPxBsCjs9PbVS+vU4hl6R+wp1q2v/O4cVdg?=
 =?us-ascii?Q?8wcWBiqWj2W31mq04JmqI0YryAifahl+/IhqyV+ghlSlJ9pZ+P8BrH3yt24g?=
 =?us-ascii?Q?K+K2hlzpQ1mMnrg80rxLKkxUGC9JiE0mqZj9fiiSDSYmAVFTD//odXe9BKhp?=
 =?us-ascii?Q?oiV90U+hAcUtaj6y4H1+Ml31W0c2q2FD96J2yrswsfD1GPEwBV0jdWqjOylc?=
 =?us-ascii?Q?T4/ASma1dCG7r0JnPIKttn9rBwE6vBDUuRA38cMGonwE6anGsLVD6vAsl4bQ?=
 =?us-ascii?Q?4U4U4Z0nfOkZcz54IuY2jNrRmZNORe630XEioetJLH0mLOADxKAgM81Kod3C?=
 =?us-ascii?Q?++++8iFLNL7VgdzVY3b6qABVvk6HzfdVIk+0RC3q9Pe3EUx9eH6XMuH4v/yw?=
 =?us-ascii?Q?p8HXO0OOXjfge1MHwNQIsdKk97Lurjw+BzUc5vY0CptHuPGski/9NzHvI6bU?=
 =?us-ascii?Q?Phx8uc2MyaU3v8oxTqFVU79VD2CnqQYSaYlGjnGEDG4p2a+PbocW4QiUzDdN?=
 =?us-ascii?Q?0C0AHuHVYGKEpgYIn4pPkorEa9+H2JwXsy3OxMGhtgbAJSup41TaTa/h9iHF?=
 =?us-ascii?Q?ceODEk/+4W2DK1adcZ/OAYA6Rpdxl7cN78p4aOZjIKeHS3D66iXnk02Zs2DV?=
 =?us-ascii?Q?LSZEElkw+yh9bsuoOwjjPfrXhqay3ZZNKU0d86YV70qQea4cDDapNMEwRl9f?=
 =?us-ascii?Q?0dFdNGcttvVSaW3b48Z2C098+dFFQNPV2v8LMjCjjRDvtbJK050OIqlOPTqu?=
 =?us-ascii?Q?f0RNC/nQdiVM1LYRyeHkcXoQ0mbrbt7wt+FDY9epyRaewiuPIOB8eTjkTbkA?=
 =?us-ascii?Q?4WmxOzmeEORE3RGXcRHEHrCDTI3w+mNXHbiBEl+E41tpNJmA+V6SOASuja+p?=
 =?us-ascii?Q?7gJ3TJ3z+75sHoVw5xp8RFsYFgsyRRgP8eFj+nri4bF6lL2ljGWveAxlfWGu?=
 =?us-ascii?Q?8jh1LVZFJ/A/FwJFFXtsEkWTLYoYmdaDvgmO2cFW4L7lDxEgTTX351ThQjGF?=
 =?us-ascii?Q?g+oumxCuu3WBFMttXA5rJxn7LhEh/lHWTA3ZRD3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3083c798-cc53-4cca-15ce-08de0cc5026d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:02:22.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YHCJpUTYBKDjxMVeC9kjQCHz86JNldyjORWPMkPqoYjbLQ8axiwA/MJ7RCc3Xe1Sofg/UkAmd37nz2pchJ0yg==
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

The bitfield-specific into new macro. This will be used to define
structs with bitfields, similar to C language.

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

