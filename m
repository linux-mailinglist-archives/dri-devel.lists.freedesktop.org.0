Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEA1B8664C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 20:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399810E18B;
	Thu, 18 Sep 2025 18:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDs7SXbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012070.outbound.protection.outlook.com
 [40.93.195.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6A10E18B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 18:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH2W+QJ5+Bkcix9PKq35kB5JMg7l9jGwYQV58KxWgfbeszdN3Ukx8zBotbpVdSJgAlQZmh9FSh1+YpZmL+nZz5BbQZuf5PYGI2rjYjw4TK1bxjz6Mx2R6p+qMrrO8Gvs6kIeJ3lFgbmFPL/QoJmzNoVQtOa5eStwdX0odm9Qly1uzzW9cJmyj0WC7zT0tVpNTf2vFnlnxkGVZ7X+b9iPEF8IAAKuh78zXssjrVFHJjJFwyFnpTXq0R/BgPwkaliLYWMN7vgzIw8AREU0FZSyh2REz41AihMClPD/0TwPbc0VoefaN411xp0P62ciu1cAOYs358b4HN4G0OcAze+CVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26Nbc2e6BuIl6jFDPhuTDAHQLmmyK5pbcyDZ4mT+qR4=;
 b=XDp7fUi3IzQbUH+jddKggneICu/J7ij4iMZsNmRVPMlV1Z9WWWQML+v42qk0AwPxtEfgU9eeU2ODuoFZv5N3PyF36gVSb0BXqgfJ2QKzf6yEqzu3Ms30TW4Fvch3iuk+X/xhPfyU+rkz49dXfZBp96CES03R9lTpELs6PZrIfFhYBvUzfE09uHwxdru5kWjZ6zLMPoaKzqs9vnVBnJWRutEG5ZdkOM+NghnZbHdGv7qhIOW0ZZ1EbLT1/DiXBaS/9mHPBhn8fBxVPxn9x/DcY2pHPjgmaqT3gBwHbe/notWUq3P5BVe+k0ARbRSGreikN2mskPR+DYrgJSGl4vBiEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26Nbc2e6BuIl6jFDPhuTDAHQLmmyK5pbcyDZ4mT+qR4=;
 b=tDs7SXbCKOKEUT27YA9K5fxIsTEQtxvll2KYScmF0IUBzOYkscEzZc4pb1wsJMRZyNG8OiLEDBSR4njFIpVKkrjpKFHqbuf76Hkt+FI1gDakhb3sw/UmAYIDYHcmVjy4FuolImV8q1hHg8bgydV2DHdronr4YGGiVD90aPOPoihu7h5oXwSJsBPplzHn3rEMokDTm2YMr+i4bty+eiP+d2BwrMPLRc7X1ABjGuah8StlLsj1907MiCmv8omxFd80OoJDS+PdawJaLIjXjQ1vwYSFQsgTrS8x8+oeegqsTG2yTOVdKeIwpRiwx9qWzh0xQu8JbbI9uiuX7ajQu5wIdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 18:13:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 18:13:59 +0000
Date: Thu, 18 Sep 2025 14:13:57 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
Message-ID: <20250918181357.GA1825487@joelbox2>
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
X-ClientProxiedBy: BN9PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:408:112::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: 2510ef32-590d-4cf0-ce53-08ddf6df23bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rK/5Ecj4+RFoo5J26XdubiyKfkyw94yGoXKaEbdPbjCNNCp6EMv5e/ZhhdnE?=
 =?us-ascii?Q?Ou9Ef6BNEj+xzK0ropjbLDn+Gg7O8nR+kG+yf21BVx9umWpZCD/Z6+rJUhbP?=
 =?us-ascii?Q?x/jjUmc/8wZcBT8W+L1wYcFG3AeljESC7/T5Xo5j69l3bvNHi8ITnfKoifxG?=
 =?us-ascii?Q?mz7hlKODP4062q6cmoTwGm4M/dFu7n8dZjV2i8AG+unNvLi8ZQvqmjUX5upS?=
 =?us-ascii?Q?r8FQq6w3xjf6N71Z3qOBt4oC1mwDtNDuksvtx+Ny/SlCw4AhvchOHbUeqPlV?=
 =?us-ascii?Q?EiXxi2mAqqZw3FcGGLitFnuWIWIFVfWk5TPgC/dXeQ/P39E5gppw6Ctaxu17?=
 =?us-ascii?Q?ZRq3S8PrmaNY/TKfqlflJ96usr+QgIBrwV/UMAwCTD6+b+6sOxvEA/IqKSGm?=
 =?us-ascii?Q?K1phTVMDrHkGM+h6lXeUOHXA85Nhn/O+pmQMfkIJnEqI7YaJkA996NMA3gx5?=
 =?us-ascii?Q?Bz/UeORSTeXYgG9r1D3BSr+HLdlCwVczJM0Y0BG4dyo8nwrt3ZXda0kwEdfF?=
 =?us-ascii?Q?gcVzw3Dk2VxZNHgR0yl8CEYfWNJVYZcBWNkfCUrhZhk3G3wZj2RRZYKmsq1B?=
 =?us-ascii?Q?oD1kYPi+QmzpQDsir7kfm0j0Bb7TM0mAG6zy1WqTNexSJxyF7EPUnWot502A?=
 =?us-ascii?Q?YO8bzjYgtxxC9LGrtLlKIpCr7taPmQlBisJ22HJ2CmCiqLbC8/R0T5/w9iH7?=
 =?us-ascii?Q?wIn7CUResxS02fP5gqDX5TjpddUNvPgzoe3Jb/0GWj40zSshE1REBelYqDTA?=
 =?us-ascii?Q?iR97mFuugGXnMYZWyMqwCRvlXXOLuCwDT6jIgv/v+MqVV0xdlbi66bXKtUuH?=
 =?us-ascii?Q?6+F4L29Xjs0zwUm0RTSj9qKZ847geJI0vV2k/jMCitm2LMzhGRk8QWfBbEnL?=
 =?us-ascii?Q?cpAUd38VF06+dAA3wFQA7VJRNuyuZUn/k/3alBcJkGgAE0oyVI9qzwk7SeZZ?=
 =?us-ascii?Q?6upD40BnWg8JUlZGtMTUo7lbxivk1HzniHDJ6m1gUfNTFnjrTnavlGabgSd7?=
 =?us-ascii?Q?PhuKnv8KwqHCwrKUdGIbMEYOrVI2CifFWN3pBwiwApklwJlcXYGGWVfYbdaM?=
 =?us-ascii?Q?VZ+pPjN1LoXQ/UAvd3UfdCI3G/V3qniUTBxn01Bmgvd3BSfCx9kqXGdW11ef?=
 =?us-ascii?Q?eBjyCoAxDEIJ7Paydk1JULJbcEOALoV15oaB3c+zXkWqHGqMfrLZKGNpTkDG?=
 =?us-ascii?Q?zlo4RuQqzvNHhvIIlyb24OJt9enyXcOpGktw5vqWslQu2aoBOx8mdguUmu5b?=
 =?us-ascii?Q?7hJHi8cBL7VVrDNxPpirskTcCTXuHPXwJxpCfz5hVJrMmXxUavA6coweSoG1?=
 =?us-ascii?Q?ic/RiJVyFBXESzjU7cZ+1Twk1gvH+03FSbBxXP+kkrBzCrl4GwYLZdu9joXv?=
 =?us-ascii?Q?Yyf81HxXD4ELMA3aleSrouUk8Q6REtGKQ97KmF1w7GcUXcgBRxXXE+fJSdGJ?=
 =?us-ascii?Q?uOxcbVsJTl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEDnejv1io9NyaYROfQHXAiDZXb+wlZoh9Mwh4nj9mzxEisRYGjsH3BmRkzH?=
 =?us-ascii?Q?bfEzuISor33d3XcnshTGBUKefomW71fq1S/PbwtQ+AeS/T518adhkHv9djQh?=
 =?us-ascii?Q?nrNAN67TIbJU7QVDKiFxeX9ohYgNKmw98W9XlYabHuR0jU5mY8lld9/BElaG?=
 =?us-ascii?Q?kR1/GuaSarkLh7NlvycNUBJEgc5ObuXxyrlfDKQEuMKj26jqPOOXSetGx1ZQ?=
 =?us-ascii?Q?/G3yQxVOcizzeliGqj3xXkO6JyOZ9nhyBAFyuO0gE8kdqvY2VnD7oQDFuOEU?=
 =?us-ascii?Q?XysszAB+w/hdb6bM2HnMRJZEav9YmCHfTls4e/ez8gy8BTT+8H9DEVHEyZ9w?=
 =?us-ascii?Q?x81q3X8eHvUPzPu0IUOyWzl8Z24ju+hGZy+5ajFYjlqEPr4uEupHG38JbBPu?=
 =?us-ascii?Q?R9fDo0ceWt9coVmvIG42FkEc99+Eyoz2gPFMQn7oY60lvr5EOVmn1AnlXGLm?=
 =?us-ascii?Q?iwG62EvR/rzYRVPutu7paVvahtJ/7dih7v6I1Tyz+/E1XEu3SLxmTF6UnuDg?=
 =?us-ascii?Q?tl2ajjArVlhF5rpn9Y8FXLrOmc/ewB/AO4xoHR9o2Mf4fqZHwVMQKIlHQBqa?=
 =?us-ascii?Q?4tJuO6rnISr9BT52pKdBQgQD0jPTSyqbp+vteu2+n+EaU2S7JdwkJJVJNl0a?=
 =?us-ascii?Q?xSH4qAM4QJCGH1XotFvjjN3XSKmoVF56FIZ8mxJ6VK/Wy5xI1qdWTF5ZACHL?=
 =?us-ascii?Q?koBroAUqMtg6wk1P9XsODcUIYszsUYZmwrXLUZqgttAnKUprFv9S59eqrPP7?=
 =?us-ascii?Q?bjVsafnGfdRQFBcbM5nHmZVREAw84zlAcLJIdzHpZHwSazrGTKNI0H4BKv5G?=
 =?us-ascii?Q?97wHZdcWawaNJk0qoY/FWsBpb27mtuwVT8cofaQlyzXCFn3sPJSOeZUU+kKC?=
 =?us-ascii?Q?eV35SmlEdDTREtQgjx/0tWjpCXuDN8NKB7yJ6TDFP+cJ0oEp5DZeP6caF8Dk?=
 =?us-ascii?Q?sdfv681RsbdTvkifvWlx0ofZt3cMBSA6TiQ9BhxlaUOsK/zIi/g3IvviS9Hg?=
 =?us-ascii?Q?VW6Xo3Gy0C395SyuJW+ckfHAAr8vqxj6FOL9n8WNJaR1mdYLsb+PPihuwW1f?=
 =?us-ascii?Q?uJyYg5hSB87FYnza0z39PHgun0J0S1hF8RcrQ47sc1LPFZaFSrwctAEcoOS9?=
 =?us-ascii?Q?JS2oXqayAQJGe3JnjzDY9rGZxKycTF24HXm6MWtVe/Jg2p+4s9GtoW9DemJl?=
 =?us-ascii?Q?+01CzfNBY3uJDYkUncBf9yTYhsE3IWKzt1e9uoRU60e44dE+Ldlq0YR5PqQ9?=
 =?us-ascii?Q?9oWd662KQNt2ODLmdjSLgP+R7x6IDHHKZBoOFZYcak4Ug+K0uu4eTaIV0GcQ?=
 =?us-ascii?Q?etroET+7lVeyFBLJvIzEZAjl9n6IIVtTuXfc8u5MbG8gUTme1NarlsrpzStv?=
 =?us-ascii?Q?PclWETcBMwv/zGlaB8qlO083YItOde+chZSXdVzfKU/8D31D/4EHo6Qn/HBs?=
 =?us-ascii?Q?I6suZweyGPZnXW/wvKpKl46m0h3H56v7w4GyDlSfGTtBVbfvOsD1LL5CZVRj?=
 =?us-ascii?Q?vWVolPFeQdpy9j5W95moXyrmDS2Jw9tVg2Xdhml9gW/a/kqfDxU3APitUOCx?=
 =?us-ascii?Q?vV+FG8OXQrkBKY2VZbc1v6CxiBnrAm5Oh/IgXLBt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2510ef32-590d-4cf0-ce53-08ddf6df23bb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:13:59.5474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDfxWyz3TQDpqlRP86uON5YuJtTgLbKqB6sL60j69J71fjlxA7mBXiTljLbY4TDHzl4XX8odChpYmal1kM+FVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3
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

On Thu, Sep 18, 2025 at 03:02:11PM +0000, Alice Ryhl wrote:
> Using build_assert! to assert that offsets are in bounds is really
> fragile and likely to result in spurious and hard-to-debug build
> failures. Therefore, build_assert! should be avoided for this case.
> Thus, update the code to perform the check in const evaluation instead.

I really don't think this patch is a good idea (and nobody I spoke to thinks
so). Not only does it mess up the user's caller syntax completely, it is also
super confusing to pass both a generic and a function argument separately.

Sorry if I knew this would be the syntax, I would have objected even when we
spoke :)

I think the best fix (from any I've seen so far), is to move the bindings
calls of offending code into a closure and call the closure directly, as I
posted in the other thread. I also passed the closure idea by Gary and he
confirmed the compiler should behave correctly (I will check the code gen
with/without later). Gary also provided a brilliant suggestion that we can
call the closure directly instead of assigning it to a variable first. That
fix is also smaller, and does not screw up the users. APIs should fix issues
within them instead of relying on user to work around them.

So from my side, NAK. But I do appreciate you taking a look!

thanks,

 - Joel

> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/gpu/drm/tyr/regs.rs     |  4 ++--
>  rust/kernel/devres.rs           |  4 ++--
>  rust/kernel/io.rs               | 18 ++++++++++--------
>  rust/kernel/io/mem.rs           |  6 +++---
>  samples/rust/rust_driver_pci.rs | 10 +++++-----
>  5 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index f46933aaa2214ee0ac58b1ea2a6aa99506a35b70..e3c306e48e86d1d6047cab7944e0fe000901d48b 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -25,13 +25,13 @@
>  impl<const OFFSET: usize> Register<OFFSET> {
>      #[inline]
>      pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
> -        let value = (*iomem).access(dev)?.read32(OFFSET);
> +        let value = (*iomem).access(dev)?.read32::<OFFSET>();
>          Ok(value)
>      }
>  
>      #[inline]
>      pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
> -        (*iomem).access(dev)?.write32(value, OFFSET);
> +        (*iomem).access(dev)?.write32::<OFFSET>(value);
>          Ok(())
>      }
>  }
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index da18091143a67fcfbb247e7cb4f59f5a4932cac5..3e66e10c05fa078e42162c7a367161fbf735a07f 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -96,7 +96,7 @@ struct Inner<T: Send> {
>  /// let devres = KBox::pin_init(Devres::new(dev, iomem), GFP_KERNEL)?;
>  ///
>  /// let res = devres.try_access().ok_or(ENXIO)?;
> -/// res.write8(0x42, 0x0);
> +/// res.write8::<0x0>(0x42);
>  /// # Ok(())
>  /// # }
>  /// ```
> @@ -232,7 +232,7 @@ pub fn device(&self) -> &Device {
>      ///
>      ///     // might_sleep()
>      ///
> -    ///     bar.write32(0x42, 0x0);
> +    ///     bar.write32::<0x0>(0x42);
>      ///
>      ///     Ok(())
>      /// }
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 03b467722b8651ebecd660ac0e2d849cf88dc915..563ff8488100d9e07a7f4bffeb085db7bd7e9d6a 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -103,7 +103,7 @@ pub fn maxsize(&self) -> usize {
>  ///# fn no_run() -> Result<(), Error> {
>  /// // SAFETY: Invalid usage for example purposes.
>  /// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
> -/// iomem.write32(0x42, 0x0);
> +/// iomem.write32::<0x0>(0x42);
>  /// assert!(iomem.try_write32(0x42, 0x0).is_ok());
>  /// assert!(iomem.try_write32(0x42, 0x4).is_err());
>  /// # Ok(())
> @@ -120,8 +120,8 @@ macro_rules! define_read {
>          /// time, the build will fail.
>          $(#[$attr])*
>          #[inline]
> -        pub fn $name(&self, offset: usize) -> $type_name {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +        pub fn $name<const OFF: usize>(&self) -> $type_name {
> +            let addr = self.io_addr_assert::<$type_name, OFF>();
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$c_fn(addr as *const c_void) }
> @@ -149,8 +149,8 @@ macro_rules! define_write {
>          /// time, the build will fail.
>          $(#[$attr])*
>          #[inline]
> -        pub fn $name(&self, value: $type_name, offset: usize) {
> -            let addr = self.io_addr_assert::<$type_name>(offset);
> +        pub fn $name<const OFF: usize>(&self, value: $type_name) {
> +            let addr = self.io_addr_assert::<$type_name, OFF>();
>  
>              // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
>              unsafe { bindings::$c_fn(value, addr as *mut c_void) }
> @@ -217,10 +217,12 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
>      }
>  
>      #[inline]
> -    fn io_addr_assert<U>(&self, offset: usize) -> usize {
> -        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> +    fn io_addr_assert<U, const OFF: usize>(&self) -> usize {
> +        const {
> +            build_assert!(Self::offset_valid::<U>(OFF, SIZE));
> +        }
>  
> -        self.addr() + offset
> +        self.addr() + OFF
>      }
>  
>      define_read!(read8, try_read8, readb -> u8);
> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> index 6f99510bfc3a63dd72c1d47dc661dcd48fa7f54e..b73557f5f57c955ac251a46c9bdd6df0687411e2 100644
> --- a/rust/kernel/io/mem.rs
> +++ b/rust/kernel/io/mem.rs
> @@ -54,7 +54,7 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
>      ///       pdev: &platform::Device<Core>,
>      ///       info: Option<&Self::IdInfo>,
>      ///    ) -> Result<Pin<KBox<Self>>> {
> -    ///       let offset = 0; // Some offset.
> +    ///       const OFFSET: usize = 0; // Some offset.
>      ///
>      ///       // If the size is known at compile time, use [`Self::iomap_sized`].
>      ///       //
> @@ -66,9 +66,9 @@ pub(crate) unsafe fn new(device: &'a Device<Bound>, resource: &'a Resource) -> S
>      ///       let io = iomem.access(pdev.as_ref())?;
>      ///
>      ///       // Read and write a 32-bit value at `offset`.
> -    ///       let data = io.read32_relaxed(offset);
> +    ///       let data = io.read32_relaxed::<OFFSET>();
>      ///
> -    ///       io.write32_relaxed(data, offset);
> +    ///       io.write32_relaxed::<OFFSET>(data);
>      ///
>      ///       # Ok(KBox::new(SampleDriver, GFP_KERNEL)?.into())
>      ///     }
> diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
> index 606946ff4d7fd98e206ee6420a620d1c44eb0377..6f0388853e2b36e0800df5125a5dd8b20a6d5912 100644
> --- a/samples/rust/rust_driver_pci.rs
> +++ b/samples/rust/rust_driver_pci.rs
> @@ -46,17 +46,17 @@ struct SampleDriver {
>  impl SampleDriver {
>      fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
>          // Select the test.
> -        bar.write8(index.0, Regs::TEST);
> +        bar.write8::<{ Regs::TEST }>(index.0);
>  
> -        let offset = u32::from_le(bar.read32(Regs::OFFSET)) as usize;
> -        let data = bar.read8(Regs::DATA);
> +        let offset = u32::from_le(bar.read32::<{ Regs::OFFSET }>()) as usize;
> +        let data = bar.read8::<{ Regs::DATA }>();
>  
>          // Write `data` to `offset` to increase `count` by one.
>          //
>          // Note that we need `try_write8`, since `offset` can't be checked at compile-time.
>          bar.try_write8(data, offset)?;
>  
> -        Ok(bar.read32(Regs::COUNT))
> +        Ok(bar.read32::<{ Regs::COUNT }>())
>      }
>  }
>  
> @@ -98,7 +98,7 @@ fn probe(pdev: &pci::Device<Core>, info: &Self::IdInfo) -> Result<Pin<KBox<Self>
>      fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
>          if let Ok(bar) = this.bar.access(pdev.as_ref()) {
>              // Reset pci-testdev by writing a new test index.
> -            bar.write8(this.index.0, Regs::TEST);
> +            bar.write8::<{ Regs::TEST }>(this.index.0);
>          }
>      }
>  }
> 
> ---
> base-commit: cf4fd52e323604ccfa8390917593e1fb965653ee
> change-id: 20250918-write-offset-const-0b231c4282ea
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
