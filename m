Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27410B8C5D7
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC70E10E2B2;
	Sat, 20 Sep 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="otsPn8O9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65AB10EA97
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 20:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5C4v8cjpWYr79bAmmYUh1IKssWZnpW3HnFHNoKwtXNTzgca23ItIGm36SX0hpW/CY9994/VAlNMAX4a2Gc6mukAitldPepd9iYbEgotXcDBSTVYEjaXc7DWpz/oa31peuDUF2WfJl4y5Edcm07FmFOMDi3umKydIYRSdJbPUGsUVtYOrZFGQz13YFQKv+wEQlvpVCa/RbdhPAZClF8GAvfxXtWIhVibU6sMcwT24xi6iuUdAH8KxDdNaDTzyCx+O7TVN65YzsZfTX3XcS8OoeEWF+VkC81xgs2919lRzdSLS/HTbi9tmWANdZWilXFzNQuRPh/Zv2xVWIjmtTN58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mziERtBd1QmSRcEw95xnSViq2nvvtp+DTHgI8aBcuEo=;
 b=TcYVwCcHUcA3t/ql9FOf8UAJHlkKKYKz1AbMP+vMvxnikp4bCBHMoDdCdfYaPH/R3GnnjmKlA9rPurmzevt/hoBZMukP0sOKZed8BKhLifMBUQl1RTcSmPlIDGN/2+xlclmtZ2jqp9nih97OVWFaIDLLKtvNvWq+NaDICkJUMPiC7pfKz5Ee7uTYTVw6y/i8TXjQVoXDk7P3eMTpLv3VWtUV7WRE46jxcJ8Kc0HDFx6Rl4u9/BbkZFOsNJgJkIvq80ZKm3NWrfJ6z4IdGTIx1A2HKgRiYdus3ggktK59HOOccn6SbeedYdltEm9xF1w+WClgGNPgqZuN+fN5/o6N+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mziERtBd1QmSRcEw95xnSViq2nvvtp+DTHgI8aBcuEo=;
 b=otsPn8O9COQQgJOlZXIxTJmFyHl4tjAq0ZzhpWu6Dd8NuJJ/J9dvnGSHZcqdA//0AEx+k1urG+kTrVLvjllaQkkT+j5V2d0mGWPkV1Fooocb6f+pgoUwDQGEhYs0PiyK0Sg4dYhGsWeaF8lPxngQu9gD87I5wYz+Hx9++ssSC9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB6822.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Fri, 19 Sep
 2025 20:56:58 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 20:56:58 +0000
Date: Fri, 19 Sep 2025 21:56:34 +0100
From: Gary Guo <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Bjorn Helgaas" <bhelgaas@google.com>, Krzysztof =?UTF-8?B?V2lsY3p5xYRz?=
 =?UTF-8?B?a2k=?= <kwilczynski@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
Message-ID: <20250919215634.7a1c184e.gary@garyguo.net>
In-Reply-To: <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2>
 <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0307.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::15) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b533b3b-6efe-4dc4-fcdb-08ddf7bf12e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YmlSGMoUZNNOtny1Ey29MlBJr30X45tzL55H8gAsuzMrSEET6+FiXNKzwjCz?=
 =?us-ascii?Q?Yj8qGxVp2dUN4FsE7gCJQ4nq2/MVeiYZGGiW/Qx/IFCg6UR0/fxyuWfydFEd?=
 =?us-ascii?Q?aYh4y6RF5UWXQ9vIrACDnncnNpo4sFJnJJtgVTIRbAQj7mG8FuootCmxmAkq?=
 =?us-ascii?Q?y8VQ3Oldbq9dAr9d7+V++2sP9wUomg1ISQHdx7VGT59SQHRKErbEAEJ/CQ3X?=
 =?us-ascii?Q?EMxQakSZ3jv+qTDV69gWCW0nsS1Ai+QyiAMXSf4UnFcKcpwA8kpNEC45+Bgk?=
 =?us-ascii?Q?JC0xSl5UJaRgVNP0Z0HWpkyQLcuU0/nGCICjvF8mu9py0J93tShpnpITlIMn?=
 =?us-ascii?Q?qHO7JzhJQ9xdgLZX1gKtdM79RNsJ6VbRmWpEIvFz+fXGFUwakNKXmlaXEirr?=
 =?us-ascii?Q?Mo77pv8bLQV0qTt1x3prXHB5+P1+2VKC52Qd9MW61B6LIz7C0HzTwSDtMPa0?=
 =?us-ascii?Q?OsLx6gKhlKbOm5oGGsX/EczZ43d4tUE9cIUoNJ9uTvd9guRGby2GNseCJoj/?=
 =?us-ascii?Q?a97bU/aiACm0SaOh908OX/Ddd/rEBvT425cWU7ff1zd+vf10GmyGYWEjyLOP?=
 =?us-ascii?Q?7DJcwDLaExfYliQMZTblJ1i/8QkrI4iJr6/ErxH7nalOaIAbwlS+IJIim8dQ?=
 =?us-ascii?Q?gERY9ujpG9OYB94c2zN59bLmzo0KlX0Xg/R5zqeJOmrxXKW8jl2+TFhJLW/+?=
 =?us-ascii?Q?Db1o4N2pauttkRpIXWy+BhG/1l31A9VVGeJmZkDhcczYLKbrLA7zYuBCHBPG?=
 =?us-ascii?Q?w9u1I4MP4xjrqmEpJz+AGfDdtRm6XRfcU9Mv/+HXViG4d26D7p0d2HUV0BSL?=
 =?us-ascii?Q?R6nqE5djncxU/UpsiRN5pvOTxTyD2zebx946/sB032w8RQuUFvW3OXH7juwr?=
 =?us-ascii?Q?lWgfVBrmMMOi27sJGrDe429eqE/locl57pI5Ys196OjHbO5BHhf5cyTrDMY/?=
 =?us-ascii?Q?XqD5yZPuBEG99UVz15f8WxseFTgAxdTxSCmJBuOX80J1HaKhelWVgHajo1Yq?=
 =?us-ascii?Q?jBlY9TOvgvVDmKX0fhNf8JTy5eQ/2OCHAwN7w1S2sfADX1IPCMIZW4ilw5w6?=
 =?us-ascii?Q?yR/6QJIUdmmv8el9jTb+dbQ7L3mo7N0SXg6quIFsE+MbrwQldoSxYM10qVYg?=
 =?us-ascii?Q?LmFSbkWHHO7nfe4A33z+5TPwp4iONvxJ/J+SgF63ZuuHI4PgFuTt+nTMOi8x?=
 =?us-ascii?Q?yLP+eKsMDgGEW4rDkxwtGsUfDnDjEkl0n6UMWogK+lRqrPNY/hpxIV0iR+iZ?=
 =?us-ascii?Q?P3pRzjYXaWyrNl73E2QHDohgHU403247Fq6+hFZPSOaukjZKr8m0m5EKg4Y5?=
 =?us-ascii?Q?NRhbCs3EbB8rsSvnwaKSLwA/gUHvvsVNlfOMnKrTlCrBiFIuBJ7Bsc12ofq2?=
 =?us-ascii?Q?NMqB78U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AAUEhx9G3DzSoWIW4S/AIJ7kVZ/RHkj2jpVr5DvdlTwzNvIo8ozsOlfuRrfe?=
 =?us-ascii?Q?D5xC9gbZaaQhR6EZLvFw2JOq+KDL0RgCkF2+3IKMIWmyNcXP0TKZ7e2ffzPX?=
 =?us-ascii?Q?yRQbkGTL9bkZXMqWr6D/CP9J4XT4/JLbnjVDgsSO0zkBarjLfx29ZQLy2xgu?=
 =?us-ascii?Q?EcV1rtpOe96t0lJUapf1gOCCDL8fceZG4JdpiJjYP+8YmBIr1GLKutuq/Os3?=
 =?us-ascii?Q?lygPQPrGswx/SouflEvz+9v5OhX9EOake+MkeEwfivqBYaUpujeHfPHtsOBL?=
 =?us-ascii?Q?KephUOHVUDL/m93wTVrnt3orh/Zmkl4iX3arGRaIPgpyaV/9p0X88Xt3nEju?=
 =?us-ascii?Q?EvGd50PvuWJZk+H50AXJVWBC8wYeWEWDZmtRSkHUAlYGoCS5KyUI20dL0wTB?=
 =?us-ascii?Q?EnB9c/72gZ/cwXttOwK5J4f5zhC+QR3K9yXs15AFILgTUIWnVneGN1yHGBrr?=
 =?us-ascii?Q?vcrTV/zh2OusQg9gAgq5KBIVGPX4F29hc5zCQsxhFYP1fwCEuFsNCR77PzrS?=
 =?us-ascii?Q?IrQ17g27FiUyOsWAX1TeRuwYczYVdllaZgaRfPxNa8KKjkISlZv2hkcGzu8L?=
 =?us-ascii?Q?PjTO5FLjwgOV7ZZ/+KZf5u/LyCEYDId7VNLUTsIJvAKIxfjSQvVHqjVl1NLV?=
 =?us-ascii?Q?nelNRT7AQo6qxyVFqHysbxp+6pOu8oXwqm0kwrPaqw150XLFgJtfHnAqLH/F?=
 =?us-ascii?Q?SPH9ePZBmTUNqx3alNcTFj9MsLS59UN21pCI3J0ovZYN7QCcRZ+xwMa0Xi0U?=
 =?us-ascii?Q?pWm3NbxJUIUQ7Z/NSryO/qKkyIxmQG4qM09gvWyopRl4cP+v+SPu98GMKLQU?=
 =?us-ascii?Q?iIFcEuoANS70k3QBigHFvaYidduUEarxrc7dlT/LILCEPNl+PdAto/t6DcDC?=
 =?us-ascii?Q?y7llCpAntmCNNtYEr+6L1YbW7ApHAzs3D4pVe0IuORg3mMQmxUt7/idmXJlv?=
 =?us-ascii?Q?LDC8mEhsHNNIK8dlMLJBERY6pzMdzAXyDPDRYzbP2Rx3DKFZzCe68m5fX6hS?=
 =?us-ascii?Q?kaCICnAV3CSbMGdeW4D5qFxjOCAQ4vHttshEcTWmQodHpQQyLjGwoANPN8OQ?=
 =?us-ascii?Q?tZne5AmNB1QlFJ2TT3V8b8YviieJ6Y7mT5koBcPIRgpqW5NpPxixg4gou+WW?=
 =?us-ascii?Q?9vH3fZuutLIL6cf6JVyymrMT+q5tZC8CrY7nOcSd54sYrLHKWdkJizA3qh3L?=
 =?us-ascii?Q?xEy2CRTnAwRJRLsruQSz7TgxL/twoxQYHE14JZRgc1ju+e95Zj7+3HSoyVXY?=
 =?us-ascii?Q?4iWIHjFIo1pLUxZ6Gz83Xb8B0qHwv5n8e58Po/GMsNiVNEE8Gr/uj0HYw0wQ?=
 =?us-ascii?Q?iRL4PObnwPtQ1UfY3ZQOAEyGiA5oSG+dMQ+C+5AWsla9bt17yVjt7UrWmELW?=
 =?us-ascii?Q?r7z3J7STPCHiqS3NIEtuRj9dmuF71ZUhYYwJb6MwvKfS6eLZbZfy9u0uFIl4?=
 =?us-ascii?Q?hFNkpcLyab4LisAp6lEVXu0z2l32ppCnEDjZvqzeKIO2c+6qF2j4T2TUb/9j?=
 =?us-ascii?Q?gLg+8HnYUcAmDjE6ctWKTa/FhhDBLh32L2ff9hRg/qfpIqksgFArg4CQ9I2h?=
 =?us-ascii?Q?nl2XlCXKVDewr00t8ipmFRGaoxhsskbaSc+40YSTXDbHdr60cI0wva2KCMf7?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b533b3b-6efe-4dc4-fcdb-08ddf7bf12e2
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 20:56:58.5716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0mdSOfpOSTLbq9sGAZOrxDupF86OYwvj7nICrNed4HvlvaDMt/TcTy0uMK1KpiMVkESf95tfjjswu/+t0VOOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6822
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

On Fri, 19 Sep 2025 01:26:28 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Thu Sep 18, 2025 at 8:13 PM CEST, Joel Fernandes wrote:
> > On Thu, Sep 18, 2025 at 03:02:11PM +0000, Alice Ryhl wrote:  
> >> Using build_assert! to assert that offsets are in bounds is really
> >> fragile and likely to result in spurious and hard-to-debug build
> >> failures. Therefore, build_assert! should be avoided for this case.
> >> Thus, update the code to perform the check in const evaluation instead.  
> >
> > I really don't think this patch is a good idea (and nobody I spoke to thinks
> > so). Not only does it mess up the user's caller syntax completely, it is also  
> 
> I appreacite you raising the concern, but I rather have other people speak up
> themselves.

Joel asked me for opinion on this syntax during Kangrejos and I said
that I hated it.

> 
> > super confusing to pass both a generic and a function argument separately.  
> 
> Why? We assert that the offset has to be const, whereas the value does not
> have this requirement, so this makes perfect sense to me.

In some peripherals there are also cases where there are a window of
registers and you want to use a computed value to access them.
If I have a window of registers where the first address is `FOO` and
the last is `FOO_END`, then I might reasonable want to do access
registers in a loop.

> 
> (I agree that it can look unfamiliar at the first glance though.)
> 
> > Sorry if I knew this would be the syntax, I would have objected even when we
> > spoke :)
> >
> > I think the best fix (from any I've seen so far), is to move the bindings
> > calls of offending code into a closure and call the closure directly, as I
> > posted in the other thread. I also passed the closure idea by Gary and he
> > confirmed the compiler should behave correctly (I will check the code gen
> > with/without later). Gary also provided a brilliant suggestion that we can
> > call the closure directly instead of assigning it to a variable first. That
> > fix is also smaller, and does not screw up the users. APIs should fix issues
> > within them instead of relying on user to work around them.  
> 
> This is not a workaround, this is an idiomatic solution (which I probably should
> have been doing already when I introduced the I/O code).

I don't think this can be said to be idiomatic. Syntax churn is a real
issue, and quite a big one.

Turbofish is cumbersome to write with just magic numbers, and the
fact `{}` is needed to pass in constant expressions made this much
worse. If the drivers try hard to avoid magic numbers, you would
effective require  all code to be `::<{ ... }>()` and this is ugly.

In the design of generic atomics this is taken into consideration and
is why the `load`/`store` functions don't take `Ordering` type
parameter itself, but additionally takes a value of it and just throw it
away. This is so that you can still write `.load(Relaxed)` rather
than needing to write `.load::<Relaxed>()`.

If we have argument position const generics today, I'd say let's make
the switch. However with the tools that we have I don't think it's a
clear cut. I would even personally prefer a BUG than to having to do
turbofish every single time.

Best,
Gary

> 
> We do exactly the same thing for DmaMask::new() [1] and we agreed on doing the
> same thing for Alignment as well [2].
> 
> [1] https://rust.docs.kernel.org/kernel/dma/struct.DmaMask.html#method.new
> [2] https://lore.kernel.org/rust-for-linux/20250908-num-v5-1-c0f2f681ea96@nvidia.com/

