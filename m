Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B727B97B56
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 00:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D649610E1E0;
	Tue, 23 Sep 2025 22:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LC3+T3Rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013042.outbound.protection.outlook.com
 [40.107.201.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65710E1E0;
 Tue, 23 Sep 2025 22:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCYfPNcyvuUiv5l4kUCyyu43M/5JMV4gfBz0AHKt1kcGPmcDtEsq5hIV5bW1XNCxqi64JnQVAGElVIc0X6odCxIIYoBUl2vnAPfKh6GTNDxv/Qv7puCQqOuzPJ61UzL8lR0nq0cwckz1yyNq4A6Lg9oUl9MCFYN0yiOUgG3kSITbqXH+D4NbzXS5uU4LwCfOurp6jXvoqdvGwAk5ymA4hcpKmEiK1Hpz4VAPeSn2/oNDBP6h7xVQz27QB9PEaNW4Ma4t4FoSbTK3s2xc3Bngim6TzSzUYdepnoIGRJ6Lt/rpa08xyIm0wdjUd5TgYiQZSBRSD0ClriX1dOppqrt4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd3M27roUi8nRJ6CgQ0KqkLijot+AokPQHpICI5k8FM=;
 b=N3eawoKDOL7x5ORyE3VMyQ7hWKad3QtKUU423JmKhEl3z7rd/Pn20FRZCDPSZ6VnFmjQyVodrFkldPxo3QIsOJkaP3D5Oxfzc6U/HjsE7Irvpehfc9sXLIZ2EoANt1nm0wqV3Zt7ehNkL+i+zQYvoTmu/Yve3EKRlADyHo/g0VGRnGSrPMJlA0iI9IX9wdAfju2yhelGyIUmnO6PBYO2YFFPYAVPtmgxQB6GD561Tl+NbBFm8JowK1qwWP9Z8Ac28xlfNjRjl8h1iGCdLZhC5NzrZgHAtEoSFMCM8R+8VWNadqkeKao8vbG5SVkEqBYhkOsmOlxL/rd9/uwN1SZcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd3M27roUi8nRJ6CgQ0KqkLijot+AokPQHpICI5k8FM=;
 b=LC3+T3RhzyiR1dc4yC3prNK/5yp53QxCjO40EBJscpY3HMuV3/jQj5RftNXAfHDABz53PEPQYeIe5vf5ZFfX0ou2kkBWFP0VijmhHuuqedPnfm7P8GLMlfUG/c1Ls9DzAxjKLseUvitwtuoKGqMzd6CfY6zOfcqg3GjDGKyQuUbiyMi0VOVjJsgC8oI2RJ0el9lb69axkb7NkWi2XJckLBrQOsBw/OQ+qOLloPDrooQE+0r7tJtiWR9mjOx5leYluVxniTULWWob+6CGCG8qNYnmwWfKjgqVL3pIM/19O4oOvvYTrZuY7ogxDLQx3WPmDHOUy2Y4NqgDh5DAD1swpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV8PR12MB9716.namprd12.prod.outlook.com (2603:10b6:408:2a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 22:24:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 22:24:36 +0000
Date: Tue, 23 Sep 2025 18:24:34 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Message-ID: <20250923222434.GA2479829@joelbox2>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025092125-urban-muppet-1c2f@gregkh>
X-ClientProxiedBy: MN2PR19CA0036.namprd19.prod.outlook.com
 (2603:10b6:208:178::49) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV8PR12MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 636de200-35e9-40ee-6022-08ddfaeffa44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+N3uTNEQbLkzKuMBrwa0dGkIQmWJQJMCuT51UpT4YNOx9tKSlYvrFXazWV7q?=
 =?us-ascii?Q?4bqpq1zP35CsPjyJdxLKCsJPCDJUcfDoheYU5X2OJoY6rB3YTj3CmZf4pKbn?=
 =?us-ascii?Q?cBZohKpBtLDDVsd1k/s7GyfvvHS/WkhT8hRkohlJtC0lwfbFU4INY+w6yxd9?=
 =?us-ascii?Q?rxtbnHRZPwSXOKzfANPYvV65q4zh/ooOM8Gyi6qRi3wFZSFoPTJa09Hi/37l?=
 =?us-ascii?Q?Y6cWpIl/n3L/BockmXpoq85kWM4lJlxuh7plVSG/81q5omgJOZFRDK4fnn1u?=
 =?us-ascii?Q?wh0TWrfyPObXNzrip7JlQRnJycOzzZlVFI1JtAwUYjsAHOJthyzjc1uT7OOM?=
 =?us-ascii?Q?uZIZRGFijPSBKtbTcOQYVY5NoAy2yqmfF19Ufb55o932PzRQn25tgILJ3fqW?=
 =?us-ascii?Q?3D/KnQq423chGG464Uj2VnwLPYOfGjCB4Kq1KVRjN7Ba4JMUobPZOHmaog5j?=
 =?us-ascii?Q?7ivl3e3uAesgOUiJWBVFgBRpeRf0I6C8JV6ZL/Ud0ZjWdtrO1rhc7ATq8oF+?=
 =?us-ascii?Q?TI3g8fU2oDF846W5ikKX9zQhdlXdtxdf3sXLMkDNy1+SAg0K+nX8hsB97O7L?=
 =?us-ascii?Q?lsTP8jRNOLTqEDIBeEDd97A4QgspeuYbZ+Npbsa4YNr94zcZ1KnXdVpWiNJe?=
 =?us-ascii?Q?pPq2bBppO0OXGbRgzljJU5B+FF2/N6P9frk6btkPECfQLOjzyJy8oYVP/0cu?=
 =?us-ascii?Q?XBQ31+2SspnTPJNEqbSGdnul/eZi5eymhiOduGNWqlo1nCZZF0d9EhJ8e+Gb?=
 =?us-ascii?Q?pb0xgFFRnWDGnjhQZF0TxHTV4/DYscn+4tiW11ozLEC8ufn9gjYjZwbcP3g6?=
 =?us-ascii?Q?xtzczvt18CZpfAXCmL2GnppvGN41i/WNDPiXSeOsBpBZNJ18qidBWaL12i4w?=
 =?us-ascii?Q?B5fUXgy094iAbRAaxGeWzlO+Pq7tnTEt0O6pwWgJg0lA3Qo0s7dSyPNrd3yc?=
 =?us-ascii?Q?mvrM/xNl4HkwIXQDo1Ga8uQcG9qOM71OqAFjKifSuO0j2LaAfinjOeORadhm?=
 =?us-ascii?Q?tzzCTD5REScIcH2W4rj3EFumXR2AwxWPXQQhMA+TjXIEF6JkD7c5zx7Neyv6?=
 =?us-ascii?Q?gT0gAwcoEvLq4Pwnrhgir8J4mJ6gBMBgpQqQLuox5SsKifqRF9hS7OuiauFC?=
 =?us-ascii?Q?nqUl7rCe44ib6Bq/go4SNAUMsIMdVbse20uZnUaFC1GqBK0iOPCHtz3fjgTk?=
 =?us-ascii?Q?UZr6XNcXxbD/A3XFQzPey3O2HLip+NCxkTUSADVygFGJqDUK/HP4+l3ZRbw6?=
 =?us-ascii?Q?RNNBqG9bv4dTxbBjvdr6cdY5q8uhNbsTL99R7YRZgw73ucHWgtCLC/xijQop?=
 =?us-ascii?Q?02W7+THjKhA8V+vbuWaWNPmCd255QIdTcyffZo3zcDSmqNWtL/1tqpNT+n5C?=
 =?us-ascii?Q?Eh8KqIcPZkzgQNY5OTwKLcgYr8hPLXpx6ApxRqx+KjRISd08scovmRXdTe0o?=
 =?us-ascii?Q?cOCdadVxPAo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dDYG5/y8GKMlcOe4JG0PAhAf423UFhzlvYYLLcpGdi/6AZ/rCECVNduXGpW5?=
 =?us-ascii?Q?S0yPWEVmgGxCI2549M1a5LBkFAuNeI3VqrpVP9bCDYQODVv9hSj3XnkD/ZwO?=
 =?us-ascii?Q?zym0xoOAvyafwwDavroJvDWQSNhqwZ2N5J4DvNMSrvfv/7v2ptdrRhSFLlQO?=
 =?us-ascii?Q?7/3dppUmNRr0u5hfwB70BQq1J9BUFid8qHx+MuksKHoch8cQmAfxFuLnl4y0?=
 =?us-ascii?Q?HV2eKtSGIC/2HhEw9ohwppKjE9tuC8wF/hR6pb/hbn+9lfhPNYZ8fxnrXvF5?=
 =?us-ascii?Q?jkL1RO8yaUvaU5BCDEjsk/R4Dwo2eIKsL3hG3L65+kzQQ7JtUK7MVYEGu7w/?=
 =?us-ascii?Q?urswJPFgL2rPkp3zMYv02LM42nO+FzFD/QLRqj5oH56OxHwbFluAkxTzEK+M?=
 =?us-ascii?Q?WbOBExj4ogNVPXCO0Z3q2BIv+Bnk934SWS5Fu56X1Cap5SBUBFADClkVynQN?=
 =?us-ascii?Q?/Nfhk7Uocz8g1yUy9pUoR/lR+oD2LwKCKDl50YQ2zz091KtFDBc9L5z11np+?=
 =?us-ascii?Q?lAzcJdInOoa+VYqj+nwDKBYlx9WfxPranhde7dvRfvxXZCK3RBNYP0qc9b0m?=
 =?us-ascii?Q?Mdjyot2HZqwbnf+YgCBNSLzC55QuGPWmOmTEzbyt13FLAga9OsLmJSNxrzxX?=
 =?us-ascii?Q?vdU05ZWXdJSstxh8M0cwmtUEtgUmhdrbmVkAHtpzjmLLnduh4KnjtSnPafGZ?=
 =?us-ascii?Q?hcJu15kMdjovzypTN4+SwiuAC/pA6BBCUSN/pRd8lt2raGBxMO2Flco5EeeJ?=
 =?us-ascii?Q?UbDWWl6CaUAVZK1C3AcxJuU2K+h8duDiMh3RJw3d/Ci15a4avWSble+OkwHg?=
 =?us-ascii?Q?AlI+VmOsx1nXDKjve+JvE45lPNhH0W3kcZBLH7Yd6vPIWqPWyYO8c+O9eyU3?=
 =?us-ascii?Q?rOQM/UjC6SQdWTK7NwI3jETsX6EGgKKWXh+6uEUgrN4xOUxP0BrFqFc930/X?=
 =?us-ascii?Q?3P87ByWkDYE6qnPcLmIsVYW2LlpPsgGLDvg4w4k9y8AXMqvg+ifGa0vipfXG?=
 =?us-ascii?Q?zyiGO270mYa6oCcVXDrnTAsh87j3HfMv9YBsLCWCj8YyAA7dDDQGgj190nU8?=
 =?us-ascii?Q?N9FCHZ203MvBr08zGPZOndBM+eB3glwMc9i9fagQOSGkCcZOkleM6zbZg7di?=
 =?us-ascii?Q?GL2jIbwXinBXsCVjVlELbOx1RWM8OLlsKaIkLqc/KaouydSX47xhtY++eGiV?=
 =?us-ascii?Q?jBw3Z7nOdhvfwWhtk+5zIHnM5laNk0I5LjmgCjzpCFDjHHWbeyFxAGmUTAST?=
 =?us-ascii?Q?sVZdSloBzgo1U8tBNXZ8mb/+k6QlaQHjhmb+zQWPajH15ZdQz2dnNrR8Y51Y?=
 =?us-ascii?Q?/wMxFybAtwnMOx+C/0vWI/kX495rBdjDY/82vP5PTh+tbhKEo5VXiUbyIqJO?=
 =?us-ascii?Q?NAD5WNCMN3KyznIJz38CH4sKqZhCKWZCCqG1pGmVyGTxEZDyzzSi3u/vnY67?=
 =?us-ascii?Q?8+6Yv6vhOxxd0c7tJ16o3vWDD62y0x/7IFu7z1daawfutJAvJ228tNqgxTUf?=
 =?us-ascii?Q?OFVdgiIc0n/f1f5D9Ju1JpHHvuWf+AkLfaBfSYuf5CSk2g/qmFJremP/G7bS?=
 =?us-ascii?Q?5FPe31XZSDal+ksaeUfhUT8UM6u8fliZOIMdMk+J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636de200-35e9-40ee-6022-08ddfaeffa44
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 22:24:36.1097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOCkBQj9/zeVx+Ux6ZqaNNCN/IioRX1zfrWlJ2f5DAnlGgEU09FN8q55hGjCtdntCw0rO0qsMv0EJGWA+Hi8Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9716
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

Hi Greg,

On Sun, Sep 21, 2025 at 02:45:27PM +0200, Greg KH wrote:
> On Sun, Sep 21, 2025 at 02:33:56PM +0200, Benno Lossin wrote:
> > On Sun Sep 21, 2025 at 11:36 AM CEST, Greg KH wrote:
> > > On Sat, Sep 20, 2025 at 02:22:27PM -0400, Joel Fernandes wrote:
> > >> The bitfield-specific into new macro. This will be used to define
> > >> structs with bitfields, similar to C language.
> > >> 
> > >> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> > >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > >> ---
> > >>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
> > >>  drivers/gpu/nova-core/nova_core.rs   |   3 +
> > >>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
> > >>  3 files changed, 327 insertions(+), 249 deletions(-)
> > >>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
> > >> 
> > >> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
> > >> new file mode 100644
> > >> index 000000000000..ba6b7caa05d9
> > >> --- /dev/null
> > >> +++ b/drivers/gpu/nova-core/bitfield.rs
> > >> @@ -0,0 +1,314 @@
> > >> +// SPDX-License-Identifier: GPL-2.0
> > >> +
> > >> +//! Bitfield library for Rust structures
> > >> +//!
> > >> +//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
> > >> +//!
> > >> +//! # Syntax
> > >> +//!
> > >> +//! ```rust
> > >> +//! #[derive(Debug, Clone, Copy)]
> > >> +//! enum Mode {
> > >> +//!     Low = 0,
> > >> +//!     High = 1,
> > >> +//!     Auto = 2,
> > >> +//! }
> > >> +//!
> > >> +//! impl TryFrom<u8> for Mode {
> > >> +//!     type Error = u8;
> > >> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
> > >> +//!         match value {
> > >> +//!             0 => Ok(Mode::Low),
> > >> +//!             1 => Ok(Mode::High),
> > >> +//!             2 => Ok(Mode::Auto),
> > >> +//!             _ => Err(value),
> > >> +//!         }
> > >> +//!     }
> > >> +//! }
> > >> +//!
> > >> +//! impl From<Mode> for u32 {
> > >> +//!     fn from(mode: Mode) -> u32 {
> > >> +//!         mode as u32
> > >> +//!     }
> > >> +//! }
> > >> +//!
> > >> +//! #[derive(Debug, Clone, Copy)]
> > >> +//! enum State {
> > >> +//!     Inactive = 0,
> > >> +//!     Active = 1,
> > >> +//! }
> > >> +//!
> > >> +//! impl From<bool> for State {
> > >> +//!     fn from(value: bool) -> Self {
> > >> +//!         if value { State::Active } else { State::Inactive }
> > >> +//!     }
> > >> +//! }
> > >> +//!
> > >> +//! impl From<State> for u32 {
> > >> +//!     fn from(state: State) -> u32 {
> > >> +//!         state as u32
> > >> +//!     }
> > >> +//! }
> > >> +//!
> > >> +//! bitfield! {
> > >> +//!     struct ControlReg {
> > >> +//!         3:0       mode        as u8 ?=> Mode;
> > >> +//!         7         state       as bool => State;
> > >> +//!     }
> > >> +//! }
> > >
> > > As discussed at the conference this week, I do object to this as it
> > > will allow the same mistakes to happen that we used to do in the kernel
> > > for a long time before the regmap() api happened, along with GENMASK().
> > 
> > Have you read the following macro arm of the implementation?
> > 
> >     // Generates the accessor methods for a single field.
> >     (
> >         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> >             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
> >     ) => {
> >         ::kernel::macros::paste!(
> >         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> >         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> >         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
> >         );
> >     
> >         $(
> >         #[doc="Returns the value of this field:"]
> >         #[doc=$comment]
> >         )?
> >         #[inline(always)]
> >         pub(crate) fn $field(self) -> $res_type {
> >             ::kernel::macros::paste!(
> >             const MASK: u32 = $name::[<$field:upper _MASK>];
> >             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> >             );
> >             let field = ((self.0 & MASK) >> SHIFT);
> > 
> > Here you can see that it's just a mask + shift operation internally to
> > access the field.
> >     
> >             $process(field)
> >         }
> >     
> >         ::kernel::macros::paste!(
> >         $(
> >         #[doc="Sets the value of this field:"]
> >         #[doc=$comment]
> >         )?
> >         #[inline(always)]
> >         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> >             const MASK: u32 = $name::[<$field:upper _MASK>];
> >             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> >             let value = (u32::from(value) << SHIFT) & MASK;
> >             self.0 = (self.0 & !MASK) | value;
> >     
> >             self
> >         }
> >         );
> >     };
> 
> Yes, that's great, but that is all done in "native cpu" endian, and
> might not actually represent what the hardware does at all, which is
> what I was trying to get at here, sorry for not being more specific.
> 
> > Now I too would like to see how exactly this will be used to read data
> > from hardware. But at least in theory if the conversion from hardware
> > endianness to native endianness is done correctly, this will do the
> > right thing :)
> 
> That's great, so we are close, but it's not quite correct.  How about
> something like:
> 
> 	0:7	reg_X	as __le32
> 	8:15	reg_y	as __le32

I don't think we should force endianness requirements within specific fields in
the bitfield rust library itself, it is upto the user. bitfields are not only
for registers even in C. If you see on the C side, we have rcu_special union
which uses 'u32' and does not enforce endianness within the fields or bytes
of the struct with respect to the fields. Its all native CPU endian and works
fine. You're basically saying in terms of C that, the designers of the C
bitfield in C standard force the C language to use endianness in the types, no
they can't / shouldn't be forced to.

For the separate issue of enforcing endianness with respect to (across)
multiple fields, I agree with you that if the user's backend (the consumer of
the data) is not doing such conversion, say via regmap, then that becomes a
problem. But that problem is orthogonal/different and cannot be solved here.  

> and the like.  There has to be a way to actually specify the
> representation here and for C, that is using the "__" types that express
> the endianness (i.e. __le32, __be32, and so on).  Then we have type
> checks that enforce accesses to those variables to always turn the data
> into "native" values when the cpu accesses them.

Sure, it is upto the user, they can decide to use whatever types they want.
In fact we also support conversion to enums, not just integer types :)

thanks,

 - Joel

