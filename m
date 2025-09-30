Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989DBAD3C5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5671210E5E8;
	Tue, 30 Sep 2025 14:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N9ANqMpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011006.outbound.protection.outlook.com
 [40.93.194.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785B810E5E7;
 Tue, 30 Sep 2025 14:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjLdBYLBFugJLdq1ZP8CHnXqCVBrL1QEvchZpGvk/YTAVrHcuE63eTVEJWTAIPC1p4Z9csm3YrY4eQJAiSYzVVbXFFoOztWg3NpVWRyCWsEDE7gQlDv5TffiGvp9CG1Hx4HN+UtQL9+yy/4CZ3/h9ZTs1T620w4Qo86AOPz88eZDwBIIHyn3GvUrQUdhqpeQDRANt2vTR46Tk8d6QWbSYqnVTm6s3JxI8IACVxahl6aPebmgxA8BVhi9lzLDfTt7eqUhzrgUN/JkbCmT7JvOgXB/y2a310pkQTiAiKv5t1cW2tAWQ7XedlIfWKMP7L0uVRipby2Jfk7xr4V9LQNDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yP3mDrKIlTJDj1l+CMjvQGZOLqUl7qVCiHV8mPogE0E=;
 b=LRG/SREcuptETM4WvbPLTEIyaYvCbUk3RAGfBEsFhmEedi0EljMKJBK/Ju/f4FJAzTypktfxOYLfDy4+0Spdctsj8TOD43uKwKJrzyh8zJP3BPXi013Bkd0cJmcKf+XneSnMox7YQcLtOxH4TgrQZZi6s5tyJxGBKNKQNWFDDod7epSJj2X6vbTiAPs1QTccIU9RnykowSJ4w8PgOgWl7dvkiVOlcvZTZFgcwTnM1C++HPlnsYaa6OKoDS9iUHY0Tm0l5ajO0mLXC0ZgSQJB1Fqz/UyH38uM/t8Kq7+ZtfXz9iRvXCMyZvp/fUHImAYF/aktGF5ZmWl4GUKui4TybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yP3mDrKIlTJDj1l+CMjvQGZOLqUl7qVCiHV8mPogE0E=;
 b=N9ANqMptkAqkIe5FKSSveZN5Q29cZuV/yxyiv0BuaE2bnyPpwTB+tjzjVBmywscQnrtIwpqzPSGMfJIMaRaWJrzfmhGTeIbj0MYgDBE8zYA95ncXmeGzN36qO0107p6GLI+ock5wD/7tQoT3CCbwoEbw25MlBOJ/daicUVixiFaQK5SsfsSZXAVDa7gHfz47jBC/EdROlQTs1J/M0UUo+Igj9DGO5vq6IUl4NnrRoDC1XmEb3JGkrp6Yrkcc458zoa/pN+uHaa1Izob5lJ3ROmRbwvjOF5VeEu56GM5dsJsVDO3eul8Q+RYjZT14KiOFNQYlYy/LmLHfRtUNQpu8VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:49 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:49 +0000
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
Subject: [PATCH v5 2/9] nova-core: bitfield: Add support for different storage
 widths
Date: Tue, 30 Sep 2025 10:45:30 -0400
Message-Id: <20250930144537.3559207-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:408:f4::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f14ea3-8762-4c5e-f86d-08de00300bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kcORPHhXM5FHQS/vxvrESu3Cpv+J2EUH1YRPf9d3P0ZefJ//xwI2oRSJXtJp?=
 =?us-ascii?Q?/9f2SNjvoRGNbBPlXZStfXtfeacuM1eo7YxS215AmFHqLtV+LG35aLnEfRg3?=
 =?us-ascii?Q?AJ0X52/GuighkzqjfhxzKXmglQ2l+yIZXJu7jLpyOsTA8nnPmAQgS6Ia+2bZ?=
 =?us-ascii?Q?R0m3Mijk6KlAPL1cou+OSKcC6S3xmMnMYw+MOLZfslI9O1Z0fx2uMG6Jii3k?=
 =?us-ascii?Q?/CdpDwl8scx6qT4IJ7EEvgGHNipxuJWqL9ms6CVSLQr5rkAe0hLTfIC6H1Qx?=
 =?us-ascii?Q?vd0TUnYtNDFCCBVedkmp6qFKiBGSdE7qq45FxYB1KGBcal3MlClv+Au9Saxy?=
 =?us-ascii?Q?hLS7UhB4/FtChkhTwuCqbxtr0vYEbR3wvESXaV+YatKMjsqLJJgtw6JG2mcI?=
 =?us-ascii?Q?Ck+Mp7k0va/FVV35f3bGWvCXG2NuYhOhtUkmaAvk2fykLDD3MEU15q3J6POk?=
 =?us-ascii?Q?gFPjAfxOCm1hirPe3D0XRQ2ltc+rOsAnUt/eXEVRk1/Jrw5G0eTfp4rJJkIW?=
 =?us-ascii?Q?oEFO/Ow8fXcNcntWjoI2pEiVJuxRimTtxxOsqshA5omTp3XviTSWqVrFgTc+?=
 =?us-ascii?Q?6HtmKhvALC9kqITyrsJ2faqAbhHHksSxCpzyETI2zkytBffg8Q4O1GoTOdQz?=
 =?us-ascii?Q?7qU+jgsbEWDeYMHJac5qg4QNTKc44mh8NcLKwJsMOSu4fmxKrvnCwknGaer+?=
 =?us-ascii?Q?ZPFMg/tKr+1ijaEDTZ4I7gC8BVDaOxRf7hNn4rpM53424fKudpeAL1WePNTU?=
 =?us-ascii?Q?BkQv78wrBneHjnd0cTr53aCSeYxnqXawrrzvUg8iFjYYk5NBSz06jOFGfCAs?=
 =?us-ascii?Q?suj61JrWg/gbOBRzP2ajEXwafNBiIIcV8S1C3CvX2hJyz9hyTeRN0ikqfc5b?=
 =?us-ascii?Q?wR5/2Vft+hxEV8cLfCdifUYLv30DClxyQmCUjHJFbOfOuQ5iDTXNykrnvgFE?=
 =?us-ascii?Q?skZnnE9uM2LQS7BgqKsj/DthRKxcUIzRgMjkHycdey0HLBOdLhn3liq546DI?=
 =?us-ascii?Q?40lHTOMT7KWBQIifgrAidrrJNkDXAQaVYzpnx0CmGv2ofWq6SvWybLXzZJ6r?=
 =?us-ascii?Q?NClFDWAoWTyzdW2zBb6ERJg4JE/d0/n2ncUcEOUTRC6EzGj8gs5zOVp3yHe8?=
 =?us-ascii?Q?SvCyknQMf7zXzjXtCw3MkgwK9dDPeIyZOCT4BeIvQAZdZQbpKf/FZXBObUCj?=
 =?us-ascii?Q?CG4ED6YH7VOhaiC/UgqCG+jtk36qIvHH6Ow//0nz6OaT1kR5OVKErCZsnxJz?=
 =?us-ascii?Q?31q1nn1j3NprdtJelvFrXaIbcEgXpUcdrP5ZOrs7qh7ajB2Zt/DPoOaPiv/G?=
 =?us-ascii?Q?0AXzxSGNthzGFPHLfgq58PK36vJFryq/5j4b52gMc8AAWTi5DhEwUyq0uLa7?=
 =?us-ascii?Q?JSoM0RZA70it7QxgMBcof6iVWsKTgL71TdNfNexMunb7pGk9ZjDYZAvTAvEH?=
 =?us-ascii?Q?r92U/hY+TnAO4ERo2Bq3qd54oxOgrg8c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2JM2xiO27zw9nNMA2fN/ApA5kJ8fbgcwozpsE32vOTMoa4L7R5HaOujXrxi?=
 =?us-ascii?Q?Sze4Ey0Tba5AvmH9wiFkthGkc8gjnD5GGT154ZMlD04Dv/aArz1sy1aOVp2I?=
 =?us-ascii?Q?ocpJJXQD4q7RgOOIiWBS24Ltb/nyMDePNpGe5YsgJRNl9h15TINmTmUqK5CX?=
 =?us-ascii?Q?MkligwbEaTZnXUaJ3TS4jCH2xgRMG2HX0hw18qNt11b/Tfr6rBpNiKoYZzoJ?=
 =?us-ascii?Q?31IcTww6YklLyqeASk7GyLYGI+vj1eX1Jhi2GcS0Up6dTpGYfbBx6fkKulfq?=
 =?us-ascii?Q?zTyvi18iz4CCin164AQ+rMyGjVsfYN4kelUUVdr6gj9423aGmNYHZPjMb62G?=
 =?us-ascii?Q?EqQ7iz+m4sa28YsHKLnIL39euLrGn2jnJa+MQEJg+TrmQUoef0QSHValFQPK?=
 =?us-ascii?Q?uLdcJg/cD/AmTOSSPXEGsm8GeMviw6cPaT0AOHM9tbl2gUb0nfUXdcf4Eh7r?=
 =?us-ascii?Q?+uACu+S6h+nkGgB0BMbd85lsGT1OTD4IHwluk3fXVcIwoyvixjzVZxEHue4J?=
 =?us-ascii?Q?4qW9ccyJsgaL50gMF1JvFTgxNsOZ8pB4Uuz1MiG9FW8hKsML0rLSbBq25kWE?=
 =?us-ascii?Q?Fk0ePoXb+t8bsQZvA23Qfj/CzvOeEl9izafi/mm4Zsuq2GNqU9OghqhvvfHi?=
 =?us-ascii?Q?alLG00tBT/8UBtmOAhT7wYfeXb5eGanq7NOeXV+tkobi+zbFsNmj2GkYkUno?=
 =?us-ascii?Q?buDmo71PZOYeHf/t9scT1bsVOO7t9dEkKQGonEtHLLC3NF+U1jBmmsuC5z2e?=
 =?us-ascii?Q?UNjR2klcAfqS4KppTa/vm2sXJqLVlmn1jFopzFVMbSqsgCFTxOO0/ETCv12R?=
 =?us-ascii?Q?4i9spHFwM8OcZpI443XJhthU9tH7e2X4BHHEtX6y25q66FykOJVLOWj448zL?=
 =?us-ascii?Q?KMOvH3U4+YmdrEvXbiPi8R7N4m48xKxHVl//Ip8+laitAVGjhPMGmWvZNrUg?=
 =?us-ascii?Q?OfcX7Jw9D13Dl3PJ6Xmo6ZMbJFg2uVQgKMyoKN4f1L8EZOBHHJBSaZ202PVE?=
 =?us-ascii?Q?Jgr3re/6frQpMbqbgyTg1c/aaHTLpIw7RHYCIxpspeXYBepjP9CXtObGrkC8?=
 =?us-ascii?Q?S2Hevs/Lus7sT2RLLJlI4hB4sy7niBsyvvzkMxDYmFtuc/5333tHSUweup39?=
 =?us-ascii?Q?yOIVs5Agq2DccneVfwkGc7VwgK60d815Kq1+bZL474uPgaqtsJ3y+Y/vpk3j?=
 =?us-ascii?Q?V8qT9GT6KdPnLfyjqa9dRRp54JyXNte6oQyfuK2/Qat3AQfWZDMrfJRBEdLS?=
 =?us-ascii?Q?bCBqNv9ZtlsOdk7oBpFNKx8B38aqNibFx6IgLTyAvRLh8uOEgubFqA9XOwt0?=
 =?us-ascii?Q?280Oa6oLniGq3fknXteZMR+DLHQnIWRlXv1lSld5j0wrzOn//nYzjL71O3Lu?=
 =?us-ascii?Q?QU+WFWtpN3Y5Qu/Brw5DAFoPJ4mzqf8K8V2pHprwdjwGnPN5OmdHBhpW4Ghb?=
 =?us-ascii?Q?yE7jsHfO3te+XC3oy+AcID3I5zbjCRDXfM43G2BMjRZQuZVkFE1et1iGfVal?=
 =?us-ascii?Q?vY8dlIjnXngo52UFEtq+svwJGBqkWXo+jan+Frjv46FAwUUZJE/qeLddRTfm?=
 =?us-ascii?Q?ooSEU55Ax7xECZL17g3K3H4EdJOaaBzFqkEzbZo7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f14ea3-8762-4c5e-f86d-08de00300bfa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:49.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDzzQ3GPGTfh/joesonRszJ3MY812sX44E1sDNY/OqViHpjx6pwZs5VecQ3k900imykDZoxvZ3hm0xkI7uEu3w==
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

Previously, bitfields were hardcoded to use u32 as the underlying
storage type.  Add support for different storage types (u8, u16, u32,
u64) to the bitfield macro.

New syntax is: struct Name: <type ex., u32> { ... }

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 210 ++++++++++++++-------------
 drivers/gpu/nova-core/regs/macros.rs |  16 +-
 2 files changed, 119 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index b1e1c438b8a8..75de1c0fcb3b 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -3,96 +3,99 @@
 //! Bitfield library for Rust structures
 //!
 //! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
-//!
-//! # Syntax
-//!
-//! ```rust
-//! use nova_core::bitfield;
-//!
-//! #[derive(Debug, Clone, Copy, Default)]
-//! enum Mode {
-//!     #[default]
-//!     Low = 0,
-//!     High = 1,
-//!     Auto = 2,
-//! }
-//!
-//! impl TryFrom<u8> for Mode {
-//!     type Error = u8;
-//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
-//!         match value {
-//!             0 => Ok(Mode::Low),
-//!             1 => Ok(Mode::High),
-//!             2 => Ok(Mode::Auto),
-//!             _ => Err(value),
-//!         }
-//!     }
-//! }
-//!
-//! impl From<Mode> for u32 {
-//!     fn from(mode: Mode) -> u32 {
-//!         mode as u32
-//!     }
-//! }
-//!
-//! #[derive(Debug, Clone, Copy, Default)]
-//! enum State {
-//!     #[default]
-//!     Inactive = 0,
-//!     Active = 1,
-//! }
-//!
-//! impl From<bool> for State {
-//!     fn from(value: bool) -> Self {
-//!         if value { State::Active } else { State::Inactive }
-//!     }
-//! }
-//!
-//! impl From<State> for u32 {
-//!     fn from(state: State) -> u32 {
-//!         state as u32
-//!     }
-//! }
-//!
-//! bitfield! {
-//!     struct ControlReg {
-//!         3:0 mode as u8 ?=> Mode;
-//!         7:7 state as bool => State;
-//!     }
-//! }
-//! ```
-//!
-//! This generates a struct with:
-//! - Field accessors: `mode()`, `state()`, etc.
-//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
-//! - Debug and Default implementations.
-//!
-//! Fields are defined as follows:
-//!
-//! - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
-//!   `bool`. Note that `bool` fields must have a range of 1 bit.
-//! - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
-//!   the result.
-//! - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
-//!   and returns the result. This is useful with fields for which not all values are valid.
-//!
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
+///     struct ControlReg(u32) {
+///         3:0 mode as u8 ?=> Mode;
+///         7:7 state as bool => State;
+///     }
+/// }
+/// ```
+///
+/// This generates a struct with:
+/// - Field accessors: `mode()`, `state()`, etc.
+/// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
+///   Note that the compiler will error out if the size of the setter's arg exceeds the
+///   struct's storage size.
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
@@ -102,20 +105,20 @@ fn bitor(self, rhs: Self) -> Self::Output {
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
@@ -124,7 +127,7 @@ fn from(val: $name) -> u32 {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name {
+        bitfield!(@field_accessors $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -139,7 +142,7 @@ fn from(val: $name) -> u32 {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident {
+        @field_accessors $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -155,7 +158,7 @@ fn from(val: $name) -> u32 {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $hi:$lo $field as $type
+            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -189,11 +192,11 @@ impl $name {
 
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
@@ -201,17 +204,17 @@ impl $name {
 
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
@@ -222,29 +225,38 @@ impl $name {
 
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
 
@@ -255,7 +267,7 @@ impl $name {
         #[inline(always)]
         pub(crate) fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
-            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
             let field = ((self.0 & MASK) >> SHIFT);
@@ -270,9 +282,9 @@ pub(crate) fn $field(self) -> $res_type {
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

