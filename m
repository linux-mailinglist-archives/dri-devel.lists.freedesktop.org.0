Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04AB5052E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 20:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D771D10E344;
	Tue,  9 Sep 2025 18:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I4CoA7JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA1610E343;
 Tue,  9 Sep 2025 18:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvLGyICWWYCULQ5W3/gOMgPrnkU4B0Pao9Mha+J0KEdoytn6IC5UB8FqCyWd0ERiETvv2B10Kn7fQQsX4oqSs120VeaULerFOSSXfZwUuyDiAbiA9H3VPMXb0BlsGmz7gZfd3ZuEwXljIsxNm0zE1dB1ouogPY9NV0NxPt/Vufg0rDvRApZDJMJcb0QHIfYDfemrxYGzNYouPC7XrZ6gSlOg7NloQtzVdpx5Cv1SgDqVOM/claQYNzIQI9UClOUcO4YUNDGioB5o+NBWs4JWGnui0V0JknrknrYlTSQW7L/XJEotWki6bx1hmFLnihUPSnGeQztT5qzGOsSl3qGYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2foIwEdKwjDQCW+Vj5nS5yi0G0Rp2crHrzUtu/AwAI=;
 b=e0Lx83seI2Aa5A+ePS8q7YZb/86I6yzSJRw1xztL9vJ0js7TWvEmJxDY4ng0AYS4s15em5euPMGFOYsMS3ncUZi9QCAgiB0xlSOgvLMBLHSspgYcNmkF93jYAhwJSdiQYFU/Cmy7rYMAoGpY3ggSeW4laPCeIuP1ouJYvSPdmYKaufaJgKQcDmYtD+I7pwTxOCALGoiN2uuBkVspstA6ewgmyGGw80jK8GURwY4TqWhlcIuswRNe2fqy8RQRn6lerfwNKtNl0aD3PpRuTgo65C8WFKDRbeRX0bDX365Q652Ghr5k6dyeaQwviato55ZTPOzVZGLIlf61rYnuD48OfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2foIwEdKwjDQCW+Vj5nS5yi0G0Rp2crHrzUtu/AwAI=;
 b=I4CoA7JUgwiBMRRn38JlHbL/s+QJ2g7Wy8FjKqdyw3tmBjZDNWc1woe0RHzq/jr9zmgGbkoEGNWQoXYWLgkcWaOW1R09q6hEUxwE4r085LzkeKUxjJkzdhVW0E+2snez6Fy92j5Jgi0zI/vUQB4fsY//ejexUUT2qsjW1rKWkt6MDXFMbp+lJg08V0ejBSBVZJHpIMqca++7p//jQJDmyIuzEQ7+7nHfrsWEmtHRB4yMzEeDnVw3w6DuyFEXBGCDASZDbROY8wbwkC/tLmBgmsfG+gmC6/6Q77onbWFwrHzmLeWRvwJDtEeML8pdXkEkAiZ15MXhdmbEzM/Sm6KnyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 18:26:06 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 18:26:05 +0000
Date: Tue, 9 Sep 2025 14:26:03 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/4] nova-core: bitstruct: Add support for different
 storage widths
Message-ID: <20250909182603.GA4151568@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-3-joelagnelf@nvidia.com>
 <DCN3KJSVTTEJ.3W07PK2E85XO3@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCN3KJSVTTEJ.3W07PK2E85XO3@nvidia.com>
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: b258903c-1d05-40a9-a0d2-08ddefce56b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IhQpI+lmmD9yb3/iGAclji1MDN+ijmoOFi8urL735TrJirIIG3JsusVEY7Rj?=
 =?us-ascii?Q?pa8y/uLqVX//CKoVK56AP7BdlwwLgif5ic1794L1tiBXmbwtqIIkj5qZkkAK?=
 =?us-ascii?Q?6tyhHgAIBtYTia3yUOwN8s/KEYbU46ybAz1mCrTzC0b0HM8E+roIOV/OZ9W8?=
 =?us-ascii?Q?l6DVrngOZwx6jR2/AibfhcbUbWB8Oi0u1iZm9GqF7RcnHgpSkd+ADFtlua/R?=
 =?us-ascii?Q?ykZgY9Q51KvRGivxg+MlmUjv8HymnOwTqE1YncyMhiQ4Et7q66GUPOX5128q?=
 =?us-ascii?Q?7+EvP4UT0rOeHB5Ry6/CH6y2jIODUKD2dJ7/9UfQrqDlhhyC4V1pZXrJ1KZk?=
 =?us-ascii?Q?HExYQnJ/+2wxdvXT0b8HKEyuoiSMO39KLPTgB+xvGa7aEs3L+CHQc241qq7v?=
 =?us-ascii?Q?YC0ex8nEhfSVldvKIJzUg9DFzeu2D9/AQbXZt+nK6c+Na8WTs89YwTCiX6Ds?=
 =?us-ascii?Q?hUOrfB1QEKUl13BEx86PjqY53w0FzrqxNAg/TCIRcT/6MvN+KM0a30VANcmU?=
 =?us-ascii?Q?7fOXCXeKCrPQR0IGL+2jSPcC+6BcGEQue2fKF8iFrHl+rTZYvd/aVGznL0mT?=
 =?us-ascii?Q?y4xdWJZSVqRenqvXLHUeuSP2pWLXZyV1PyyOzltVAefskJiMmXSS2jkH1zG4?=
 =?us-ascii?Q?8c4t9CHieITvBxaiEa7D/5HqHsjOckispSURY3cwZafVUSmfa8tHFe/uajoX?=
 =?us-ascii?Q?1kw3bbE2/0J0XbAgE35r9oct/TP0IMWTSGHSBa4lGl/Ob3LTLLb5aFsGEYpa?=
 =?us-ascii?Q?k+/b0syD3AB6Oo4nWpThNqopuM9Oi7BRTRcUKBy+7NknTlyHs9f+EQiyPAuu?=
 =?us-ascii?Q?XUEvR+pUTuuQJs1OB26E+bvgNVw3y7XehMaeAQe7SEsqy6JJ/R5TDhSvllsz?=
 =?us-ascii?Q?RDH7RMHFNZeG6FoPYvZ54gymLraCd/2o1e6CpKo+o2U3SfM9pyvUlftfg7OA?=
 =?us-ascii?Q?u6IBXo7vbFrzTGF3vTKmGbg96Ci6IiE1FMSBCCBbqzH4RrT1lnw2AKPQ9P3E?=
 =?us-ascii?Q?Ni6CuKabCwBn/Zv93KbQnIWOXO3+/mzl2z8oR8y/vAJvgcXnWZLr+28sN+Nb?=
 =?us-ascii?Q?zKyIXAcLrTbXaQcriD5iGmRW6UqSPmdYmkWNmixfdbinbVR4El2tVUHLrfUZ?=
 =?us-ascii?Q?u8PWMasOevmLPMJIkzIJeKQ2cIpLTGDwPa3y/FweQVYRhryQZyOrCIsXB2dm?=
 =?us-ascii?Q?sI9s6EUZAREzQaci19a3DycxlZvyPaKDefTLgDX3Ix9d+JgSxeSAWNRkWzrD?=
 =?us-ascii?Q?/jD5kySy69824RldEBOMoeF/LDtNHPPhIb3UvfEJ81b9RZ1tTaMQm9TOShXE?=
 =?us-ascii?Q?KTHAb2U/B3EirM1kXsuCaNSzajkW0Itn/RXNDhjqVfRi4J9wOyFJ2qCVhlEn?=
 =?us-ascii?Q?Iw7cGpKc03jTdGdrTMk2w439TqcNYO47F8cGO65/xZm92WvJIIbGX73Vdtku?=
 =?us-ascii?Q?4WsrV5uYVYk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jO6zNgM7B6dH+QvObg0tsVuURVzJSob2+Ay6KKI5XmwczDJtpPCnx0tUq0WA?=
 =?us-ascii?Q?n+aA+shoRtvvD2LqHVzBro8bu8MPd2577gToKqagvHDdxXBY1yeVuCfkNy51?=
 =?us-ascii?Q?TRxNW6aOWbExbIvhpJi4YUGlAzyzF6twsCNQU5MYirp49OrA9DWcM+oCb1jw?=
 =?us-ascii?Q?F+EtfYGHDdOnfZ3mr8LShWz8iK3kmarKA7pWymYNp7T3Eo40I8D9pJ8zfWc1?=
 =?us-ascii?Q?N4WdA7pu4RxYJNBd1jaYxASzRtpbL6lcn8sEabqnOvAJMZR8wsZ44vcl0bXz?=
 =?us-ascii?Q?tRJ0/p6FzgqIkSbdi+g9dGHVXnRp2GREwqkMfvqaIriFpSjbPLJDUTsBAlCG?=
 =?us-ascii?Q?yJNe1mCgdXyLpTj2UgdmzUqJxGMXyXfIqdETDwByqXxUpd+vihuNRWtnoNuz?=
 =?us-ascii?Q?RsZ9PAUdA8x9ygnsciPRa75jDCZVEPkbsXWikB7UsAhAy930/NzUyg1TOoDE?=
 =?us-ascii?Q?yq6Ziy9Pq2QPjHqgjKQkycBQCgd/2kqXb6JiOqaVKfBYGYsWwtpZhW0ZwoeD?=
 =?us-ascii?Q?Y3QH5G3so/Jma/t5POQLT6GvYxJj+FzSR4khEerLshLJUJ74ganWK/amy0C+?=
 =?us-ascii?Q?Jx0+VfZMZyTMs4UoKA44I2EYjAaFRg/1Td3XLI4WYYhsDxDl//60/8lGg0A+?=
 =?us-ascii?Q?+P6lqm5qnFBqrz9lLrmzIchWpkPdhiNkRrK9xdow9RyY+0j6ghrdrg6itNoZ?=
 =?us-ascii?Q?9QhvKkM9om48RQcMndS+Z3ZfV+P71jwCKt8RSdcjpb1nnW33N1SMvYoDaqMq?=
 =?us-ascii?Q?345sltZSqP/j8eYyT9kv+zOxpP719Yxgkeu9vSB/1HSYGadMQ5EwHFCT/0HR?=
 =?us-ascii?Q?54INhIHMbfJrBaMGRHTPSoWzxAfcscImHL9U+P9qk2HYvzLIHVzLaHPU1WME?=
 =?us-ascii?Q?CiAw/6mriCnLoYh4WSEF1PLoWsBNsibw/kfJQ4Q81MFTDcd1W5u0+oTGbzxG?=
 =?us-ascii?Q?tzg8P8nZrAJ37RHXfuJ3JoRm3JukP3SQadvpIulbTGjmMQaKopYHofIdnBwr?=
 =?us-ascii?Q?+E5Fj/YcfHaRekAFgQdKhK3CPwtz2HVsjBrmi85wwtSphrmCIJE2ofPoG3je?=
 =?us-ascii?Q?JPAm26wGSBSn0bd+AsUGCzf8SuUKScFYzvPmFt9G5xx++zPtKgGVG14XZ1WV?=
 =?us-ascii?Q?qfeKwPeSyPgnNET+7CxlUkM02lLVw0EA2oD498Mj2QwatjGubyO8l0khgTOl?=
 =?us-ascii?Q?BZHJrWOf74pELvQhefrjEIkb88X3gXC4pmH4UyE+V7jdQaeaAztgFYC9qU3n?=
 =?us-ascii?Q?AByinJwelPjQlekIoqXuntFwE/kZGcl/EVb0wrv0OErML3HZy+ahd4UDRfSQ?=
 =?us-ascii?Q?ov5UqQ3uo8/C75VojL3Bk8YjEj8KBbgKycBv16uBfaiiJpuiNTgbtY2CbVHn?=
 =?us-ascii?Q?2RfYCdFzr0RHtYAfTuK6oDNgProWQtGsfpeeEJAID5x0JfEVlcZ5z5BMd84O?=
 =?us-ascii?Q?aFqczPYNBx/m7RDl8FjoIF5sN7Il9RH8Ht9zlC8YbNDwXOHSVbFs0YwgUSnr?=
 =?us-ascii?Q?P6WNPdc7zQxzBl8QZH97+6BXkb4zmYGuRLlXD9R3t98XHeprNqOEFb3EcnTB?=
 =?us-ascii?Q?1Arbk3Clq+mNuZSqcRiRciVNR8LJOiUKOde8Q8vI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b258903c-1d05-40a9-a0d2-08ddefce56b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 18:26:05.6708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmVVcQaIU5KHV6xVLhc1A4p4YHHI3KTHhtIpUgXVkPXgDORNj5hy0ArOGIIyZFx38v3BDlyCTBS4XBuyMussGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
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

On Mon, Sep 08, 2025 at 12:26:43PM +0900, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> > Previously, bitstructs were hardcoded to use u32 as the underlying
> > storage type.  Add support for different storage types (u8, u16, u32,
> > u64) to the bitstruct macro.
> >
> > New syntax is: struct Name: <type ex., u32> { ... }
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> <snip>
> >      // Generates the accessor methods for a single field.
> >      (
> > -        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> > +        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
> >              { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
> >      ) => {
> >          ::kernel::macros::paste!(
> >          const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> > -        const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> > +        const [<$field:upper _MASK>]: $storage = {
> > +            // Generate mask for shifting
> > +            match ::core::mem::size_of::<$storage>() {
> > +                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
> > +                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
> > +                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
> > +                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
> > +                _ => <$storage>::MAX
> 
> Since this is a const expression, you can use `build_error!` to make
> compilation fail in the unlikely event the `_` is taken due to bug in
> the code. 

Makes sense, changed.

> 
> > +            }
> > +        };
> >          const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
> >          );
> >  
> > @@ -211,7 +220,7 @@ impl $name {
> >          #[inline(always)]
> >          pub(crate) fn $field(self) -> $res_type {
> >              ::kernel::macros::paste!(
> > -            const MASK: u32 = $name::[<$field:upper _MASK>];
> > +            const MASK: $storage = $name::[<$field:upper _MASK>];
> >              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> >              );
> >              let field = ((self.0 & MASK) >> SHIFT);
> > @@ -226,9 +235,9 @@ pub(crate) fn $field(self) -> $res_type {
> >          )?
> >          #[inline(always)]
> >          pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> > -            const MASK: u32 = $name::[<$field:upper _MASK>];
> > +            const MASK: $storage = $name::[<$field:upper _MASK>];
> >              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> > -            let value = (u32::from(value) << SHIFT) & MASK;
> > +            let value = (<$storage>::from(value) << SHIFT) & MASK;
> >              self.0 = (self.0 & !MASK) | value;
> >  
> >              self
> > @@ -237,7 +246,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> >      };
> >  
> >      // Generates the `Debug` implementation for `$name`.
> > -    (@debug $name:ident { $($field:ident;)* }) => {
> > +    (@debug $name:ident $storage:ty { $($field:ident;)* }) => {
> 
> This rule doesn't make use of the `$storage` argument.

Removed unused arg, thanks.

> >          impl ::core::fmt::Debug for $name {
> >              fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
> >                  f.debug_struct(stringify!($name))
> > @@ -251,7 +260,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
> >      };
> >  
> >      // Generates the `Default` implementation for `$name`.
> > -    (@default $name:ident { $($field:ident;)* }) => {
> > +    (@default $name:ident $storage:ty { $($field:ident;)* }) => {
> 
> Neither does this one.

Removed unused arg, thanks.

thanks,

 - Joel

