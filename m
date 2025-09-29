Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5CBA7AFC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 03:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE6110E1D3;
	Mon, 29 Sep 2025 01:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bTdfBuGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011008.outbound.protection.outlook.com
 [40.93.194.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC66610E1D3;
 Mon, 29 Sep 2025 01:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1a8WzK+U3dtwhHUc2sBiM2916sYI0x3APqtLWxHVhLCkOm+DikoQJGCnHnEG6dHPLY7o2U8vsCDu6lJYC4szCjG156pvsgAQmH0oWFw9uPe7IpelwqxXG6JMAnteBrE9/Be8aWLCtms1FOOldZYqr+s3MiAMXtXmBCriisVOgprrzyhaJC3lenoYylaL/4DD6mgXEqWeuhRRh6SsxON3kGyrUapnZdQXT7+HPwQ5nBEXjGeMT612W239bktm5AKYrp4a6XTNN4wNxPsyTpzR0c5+dIecrkT52Ku6yJqY2L46je1B1BqeuYgw4h5wpQJlDVMT0djLMIChFHIjEKs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6IRGwN2HwCbARvo2pFA5EGmh+xb/3Hdj8aGs3PcLes=;
 b=tXz0C4hkRXBcaHeKLTEwmTeI2lXMnrTqCwMUXdll1M0huVawTpBRW5RN8UYifOiaUDEkeVljl7GxpxJmAenxTv4ncgZ6qQNPdDlDtyZKL28jIIeP/1Z4EfbaeFhnSCPQrJn2bpyw1RBko1XCZVvmXy/AHxpk6X+wWQC5oIEVAC0rJT9gE4vv/evxQ6HBLTnEAteCThv6pURg5aB2mYFe5dRQ2zW2uaXwQgpBamqvVfn+IFrxxU2JcNmvky8VJ/G7bl9x64t8eQ/GFXDYofotch3vyTeazSzfWrVoPgR+hPOLIEC72vGEJDFiYfhMMYV0kTOlzoMyKbdCmzkLO0+lkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6IRGwN2HwCbARvo2pFA5EGmh+xb/3Hdj8aGs3PcLes=;
 b=bTdfBuGuK4lyqlJC0vVC75Dze3zM/w/XA9s6FHSM6QWym31fjxcWS+3+3iL+AKyQgRaakcd+QfuSCXl/fKltHLWKeQ2iOSVOOD3yJYOx2FyhFFZBn4vh7JcstS07Y2ptyKDckiP7N2q/+ktsQhytbEW6q12siAII4l4xf0xYcwiQUo/lZGKgWEbEKrIZzBytN04eioEnLkjwCkIZ/TmXAFukQ4sX4z5/0DPtjou2kbcZh33iKDt0vTtO4St5QJSs1uqyGb3/i7dR4M93kyLLCXC3eKcz+GK//BvfS+UAIwDb30nEiKf7ZZORrJahG/S6oZW654zilRaZ54ZLs1KPLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 01:06:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 01:06:32 +0000
Date: Mon, 29 Sep 2025 11:06:27 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <mkecw5p2eb6bsl54ccpxrdezeatr4sxjtkvsteu4klx6u3ldka@p42jqjvoi275>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <e95c59cc72145c05380d0d81d767c6ce97fbbf0a.camel@redhat.com>
 <fiwv6movnoliptvjdlxzx4rggv5a7mid4zyvmqowvw6kt5auhh@r4dmizzmykwv>
 <DD2DFKZTFIGS.2HDVZRV6WGXHG@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2DFKZTFIGS.2HDVZRV6WGXHG@nvidia.com>
X-ClientProxiedBy: SY5P300CA0015.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 287ae8da-803f-40b0-b374-08ddfef46d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x0K58PJsu5UNWNnOC5turzrv8FV1GFl1mJOzDf+YdSjusJTupdNMgQIB1yrp?=
 =?us-ascii?Q?mjzL2kdHg0NHXpi1TSADZ8+iGbUm/qwf4EcH+p2G4jNgp/T65cu48NVMj0w9?=
 =?us-ascii?Q?ht/lOu/Bo9Z3z782oxn9mORID1d1oGZ5axwWtT40F6IhaM/JXVqow0fi+yxC?=
 =?us-ascii?Q?YT+Qd+dmziKZBBLE3UwyJeyi2jAJwOKMLOb0WXSeI768wpPLS0U+DvPi4lH9?=
 =?us-ascii?Q?yorjImu8CD1Y66ud/uGRUhRzrKHFblorhexN1/Pr9E5WJCEuITA/tpd4b3w7?=
 =?us-ascii?Q?BgKB0LJAURBiu1R5Nwl1sj/E/pHOfBCELFVX6833F8WWtU/XuKXF0kcZTRDn?=
 =?us-ascii?Q?B2EdFS1NV4biNBh6C2UjmvDSXHu1lWhX6JdTAa8/aVhYqPze0GsXrybtPykN?=
 =?us-ascii?Q?Zb1bee3jY5U3AtUWN+leQBXrBPlgwHxiQ73aE7fgiAKK4A3RA4zjmX4peOX+?=
 =?us-ascii?Q?rXGrqRpBZ/1cTqqF+/qxBXv6tr2G9N3Sc4O/t5aGIjwNULKA3UOjQ+H5NcaI?=
 =?us-ascii?Q?a1MqDFOKfODyIcXgFC9Tk3U/Yu7ienzD3V9Aoy6sxjN6LBAdsR1JbwsB+qKD?=
 =?us-ascii?Q?KC5EnIAyiFhifoOMBzGWhu+DhqVFXO2l/sjPZ3vvKysV1Jha7Y6gha2FepBg?=
 =?us-ascii?Q?pNsGuJ6wjr3L108djpeYfeA51oX9D63ZN0maTnqF6U6M2Run5lPzoRlNVPFA?=
 =?us-ascii?Q?rCWys8gBlpfNxAAxww6xiGRGbIbATgNNQcOx2MyL3aLIB0xHkviYlbpBe7SR?=
 =?us-ascii?Q?SLeqXZ7+DQs2R236Z/OrsTi6JUIF71rjDp9QJAsH58wARl9iccdubYKj8IHa?=
 =?us-ascii?Q?NFfLN4FhMRAI26YmcbVwujy246X8tahnMyBQuGLrUVOF8pEpqcFxs2X7bUPG?=
 =?us-ascii?Q?o9iz+DF9L3POaG6q9jmPrzT8afHgFQRFyTluY87lV1obBsukcJrmCwsLjabK?=
 =?us-ascii?Q?2HcWrxM58Dq+Cv9vNsTLpcDUZbPToJWFnhWt4FCkOA5fpWFt9g/9mMSTE5c4?=
 =?us-ascii?Q?TNcM3B2eH4+Y/sFFCD/m8ZncMihfj7iplwAyVDlFb6aZWK0VaH1ZD/BfAiFK?=
 =?us-ascii?Q?VwtJRDnoSlXb40eT5DZmegL/n0pU5bPqLZoOLKlobOIdXk9Sv0/LzI8A6sMB?=
 =?us-ascii?Q?d6AJVOgwVf1BEMiuE9WDM1SCFN/hAbTg7mEFgHXtpCHSFLt0EDJwD6RXwpOa?=
 =?us-ascii?Q?hPdhF/6Mw7wTwSV8RCz7WNVd3tZmawlY9KWvX4hO8Jdi8rTlBdBro3i5gAzY?=
 =?us-ascii?Q?KH34cD7zwflvpeIr14sFQe7azcpo4aHevlhqJxkVqOB4se5dPrEaIsrz5Zwv?=
 =?us-ascii?Q?t6N+6mG8mwOU7x4xJraVyjBjm+t5V9zfMFY07Zs4n1jKyTVT1rkvZApm1IDR?=
 =?us-ascii?Q?VukJIrmyyhfPCcQuQ9oxQlRjCtH9mZHpOEMIhRP6zde/oLg9JUZpT4OpmgIS?=
 =?us-ascii?Q?lhJdOJ8Dhlf4IQfWSCMTusjrYvJqNY1R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?avTuqSQ3kKGzfDMce4u+c6goSnWYUULL1LbhA0QXG/IePo85Jv7vAZvkwGh6?=
 =?us-ascii?Q?W3xpKKDhvxmLergYzxJ8xedzXUMn774r7/uY+UokHFeFNMCyxkzM4VYd54ve?=
 =?us-ascii?Q?IvsFSA/kEZyNtyJLkpIjJtFWNBaIAGraDwzjnUAV0uhWFNH0MII5rT2tnrJ9?=
 =?us-ascii?Q?VDQSoAGcOWxxSxw+jQIQdPLPjY0AvUFJmNsk3X3JweEGHkIhjjW8IKB1Kyfz?=
 =?us-ascii?Q?X2t0BCXimK7ITi4DSlQv165KpOu1EYgnPg6xAK2UtYDEIDBIJ2gcGbnVG/IH?=
 =?us-ascii?Q?/q8FsOO9Mr2V0jUQjLnyfHmL6N3D9knQC9eA6zgDr5gqvvCH4Dx0ssx4/P8R?=
 =?us-ascii?Q?FhrlrvTWU/Y5qWHijZEQxed5ZoPD3yauRJ5rx7a3f/w4Yt8cvmu+2eaD4Wzn?=
 =?us-ascii?Q?RffDJFnX1UtrEewXP9Fkbk/1LUE1RRiNsaoNLumkTB3FdI/TyyE4bu7G2uc+?=
 =?us-ascii?Q?5owxsknreSiqHGapiiT7EjlXaNBngVn9FPH/+ESueORKGRm3ZPo3ltd7Yf2o?=
 =?us-ascii?Q?T58NdJ/sP2YMaGClakE7VurLDSUqYmnXrH2C15szN6ZXgmLj7mpOpfGxdPwp?=
 =?us-ascii?Q?4fdlhRPk4uH0LBpAZRK7UAIiCHt/P9iWJ+XeO+fz/r7NTH1VvekeAaI/zK4S?=
 =?us-ascii?Q?ZEYxXuV5ar1vCuc8tykpFB/xfmKE2VVP77VypM6vNzeoTfSjjSMC6BpxC1wW?=
 =?us-ascii?Q?du4BwYeN/2FMF06WNpG2UlCbyQNJXnJ4GXNx0P+rY1JRZySgwDo2k6XGL4lc?=
 =?us-ascii?Q?ojNIeUZUFNDhfIoMFvQiVuJhvt7o+lhK1qKGoVKYVcR/9uJj/o2F+JyF2qN3?=
 =?us-ascii?Q?EWBOhPhMrTObBEPw4U7bEbnsnssnEG1nSdQR9jyfWmdFdOe/9LosxybaVac9?=
 =?us-ascii?Q?RIgZPRONTE0qMfW1UgN/C56G4ISlgWtgJbwDPrP+Ywt3Z72p6O5WCRc1ZEVa?=
 =?us-ascii?Q?UOLq7EtQ2N9Yuw/3VqUpI193vbrE+ZlvncsPy5bzbOOZ5bbQy6TInqxbRk1X?=
 =?us-ascii?Q?EA6+6+ONjAaczCqub5obX2/y/tPtOErwhewuZlxpefC3hhl5bW9ZNuQnVMw2?=
 =?us-ascii?Q?1enp49DWCBI6oOw9fOxFJKBlf99c8xtn6oVByYQ5rnXfcbl6Ps1VStgE1fQP?=
 =?us-ascii?Q?fxBN2lvS6gUS8vLDpvCf7W+5RjZAtqNiXkT0lI+5eJJYp7KndhqmxAH3kS3t?=
 =?us-ascii?Q?bqvo0HBFJ5rCCDfqC+KjneRBk+NUuVHeAWfQajnqpwNcRWF9IFbV3co6LLBe?=
 =?us-ascii?Q?1ej/P1ztb9BUybwPzv+yTKX+DWxFovfcXP95oCTGol6WGq+HwPKNPIBF5Fnh?=
 =?us-ascii?Q?+PDrAEGmIfhy9G0P+q55/T6s4hocfd5ZBCp/QYdePZ8dews1LYNCmLj7rZcN?=
 =?us-ascii?Q?Uzl/jGDVr8PeJtBFGtCG7UGQGs46ps+W643xQL7UoROnh4sQiV9sQ+w8jpw8?=
 =?us-ascii?Q?wWLs5bqNGLAeAJdBXpMxVuVVFDsM9QctRdBI6NtcP4FQoZflzA2ueZcm6xlb?=
 =?us-ascii?Q?5WKoeVxBFjYbXcVTdzyc8k+zCMzSNzDK8Roqp0egRKG4Krm+pL6VMQbirhwy?=
 =?us-ascii?Q?VrD3ByYyoymppSlXTnD/79Gkkgy8oi5xsoAw1SIj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287ae8da-803f-40b0-b374-08ddfef46d82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 01:06:32.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUG1sAI7/Myk4aZyya9aaSU3N0BgacoAHa+vkMMgUFHVdGHQ3ykVeec4m6wN/L6gv9O59kDrFgZ4uessnldEnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
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

On 2025-09-26 at 12:20 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Thu Sep 25, 2025 at 3:32 PM JST, Alistair Popple wrote:
> <snip>
> >> > +    #[expect(unused)]
> >> > +    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
> >> > +        &mut self,
> >> > +        timeout: Delta,
> >> > +        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
> >> > +    ) -> Result<R> {
> >> > +        let (driver_area, msg_header, slice_1) = wait_on(timeout, || {
> >> > +            let driver_area = self.gsp_mem.driver_read_area();
> >> > +            // TODO: find an alternative to as_flattened()
> >> > +            #[allow(clippy::incompatible_msrv)]
> >> > +            let (msg_header_slice, slice_1) = driver_area
> >> > +                .0
> >> > +                .as_flattened()
> >> > +                .split_at(size_of::<GspMsgElement>());
> >> > +
> >> > +            // Can't fail because msg_slice will always be
> >> > +            // size_of::<GspMsgElement>() bytes long by the above split.
> >> > +            let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
> >> 
> >> Any reason we're not just using unwrap_unchecked() here then?
> >
> > Because whilst my assertions about the code are currently correct if it ever
> > changes I figured it would be better to explicitly panic than end up with
> > undefined behaviour. Is there some other advantage to using unwrap_unchecked()?
> > I can't imagine there'd be much of a performance difference.
> 
> Here I think we should just use the `?` operator. The function already
> returns a `Result` so it would fit.

Actually note quite true - this is in a closure that must return `Option<_>`
so returning `Result` doesn't fit. However it still fits because I just noticed
`::from_bytes()` returns an `Option` so `?` will still work.

> I'd be willing to consider unwrapping is this can prevent an
> obviously-unfallible method from having to return a `Result` - but here
> this is not the case, and handling the error doesn't cost us more
> than the `unwrap`, so let's do that.

Agreed. I assumed from_bytes() returned `Result<_>` which would not have worked
rather than `Option<_>` which will though.

> <snip>
> >> > +impl GspRpcHeader {
> >> > +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
> >> > +        Self {
> >> > +            // TODO: magic number
> >> > +            header_version: 0x03000000,
> >> > +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> >> > +            function,
> >> > +            // TODO: overflow check?
> >> > +            length: size_of::<Self>() as u32 + cmd_size,
> >> 
> >> (just curious, do you mean overflow as in arith overflow or overflow as in
> >> going past the boundaries of the header?)
> >
> > Actually this snuck in from some of Alex's suggested code improvements (I had
> > intended to credit him in the commit message! Will fix that) so maybe he can
> > answer what he had in mind? I assumed arith overflow but maybe he meant ring
> > buffer overflow or something.
> 
> I was thinking about arithmetic overflow, but maybe that was just
> overthinking. :) We're probably not going to send a 4 GB payload anytime
> soon...

Lets hope not :) I guess we might want `checked_add()` to panic if we've gone
insane though so have done that.
