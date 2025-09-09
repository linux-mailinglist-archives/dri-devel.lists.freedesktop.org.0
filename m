Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3247B50544
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 20:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31FE10E343;
	Tue,  9 Sep 2025 18:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R6qlWpay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D94710E343;
 Tue,  9 Sep 2025 18:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPcPAh7ema3rdgaRz+2oSMFvCNHSShiWp1KY4V8NfqMan1mxc6XuoyiScVwBupWqwIYceTiQKU6vk4Mxurq6QZIRey3f3+CbzveuOEN0XfW77ggCv87ruGXXlvmwBIroSrcYJPB2BUWzCYVYbKRXBKBSmRKDcU5nQiV+f+Aty4UqON5rAKRgsUPp2HzM2W7dJkUwW+ClxrWf0dVh/+zDbSD0k6rzburABX1iuQvHBSGWlnhuIRv+SN89M0Uh5jRst9vkjb/vJP5Pv91sHO+CnlZdhD9c8vbMoi59VjNuBPNo2JfO1rlEElxxHbVbIDo6dN4m85KfC1RxbYUSuKHx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKKnpJXxxuSSmvpGOxIE5CRm2/LKeEtnO0yu+IH71Uw=;
 b=xPIOBxdEViT45MPIKd/pS33cYOElv8ttEj/vNr9v/0voR8wdDl1+SomlkwV10CnNuNPEVX839WccP3AgPro8IBuefLjgED5Ge1e8so8BiRAnyWf38nOhh1XgI0O+uw3GsxK1YIru2fabRem/Jb5pH4KRLA7ad7TAu2HZG2NYP6vTjDnXMmisnArgpsKqw77nBaNs1gkulvlg2GS8B+LFMJD64t6mkU+56uloHk4BRtDkEWi/RwHvugGIFptYKAhbCKB5sELs15i6RH6rslB4b9K0/HgHTLHDOzssnt4y9KTe7AFa+QvtcmqWbbcBPFLJa8qoZQaLQLTE1p4+2YZRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKKnpJXxxuSSmvpGOxIE5CRm2/LKeEtnO0yu+IH71Uw=;
 b=R6qlWpayUyaiMapAL2nkeZwM+B7cv+hTLKLTkbUyeCQaaAIYqkiQwn8LP+xXtspA5eXkYW1xNx5qiIXaElFbXQODMeMZPFX2BXy4/ipe+6HLDOFNobiMRld2zioykVbna09KikLj+ouvmMSTCyySxMouxgd9SSnKZD5z9vyAk6lBAZk7jxbl4LRwNdKGRU6ecFHp9sCBWMgcVB0fwGMNjS2Z9+VBsIvldjjgAvJL2maVvnlcyuZtR1qh8volZu8rxFTeUDE07viV/jp6KY1YYwdbO5xGF7FgtWMmUiWj7wvxNta2wAGMlIzz07H0a+ZLkxlUOLvF68x1uJYz0+lupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 18:30:40 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 18:30:40 +0000
Date: Tue, 9 Sep 2025 14:30:37 -0400
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
Subject: Re: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom
 visiblity
Message-ID: <20250909183037.GA4154417@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-4-joelagnelf@nvidia.com>
 <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
X-ClientProxiedBy: IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::16) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5e1f36-8598-4ad1-f57a-08ddefcefa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bhxRhPdfFr2kfLi4mrh1HCKcVF03u0aYLuULU00oVjjXPxlaeuCDUCh363Ew?=
 =?us-ascii?Q?fPa/20+jCCwcP9Vx5a/4No1nvCPrNSqe1LTlJX9DzeoJ2fImXuuB2ri0ANiw?=
 =?us-ascii?Q?IBC6eqQ/G4m64svQCHNzWTXmL0cmpKh6TLv6veP1SF+9TAnNXAzsbhEFax4B?=
 =?us-ascii?Q?BlyoYO7J/jJSf0Xf+sVlRmmdkt8RKFmfNQKzW3RkIkuxhTGY2K9xJ78CzebY?=
 =?us-ascii?Q?7gcawfW9UbBvHvrRJfiwwhu5ejnq+SmZHel1bxY7GaFhfjgZ/XDT0yYIEdLm?=
 =?us-ascii?Q?NchhYmZvHzJYnKd5nLtxagxRYazC04oZiguS4bawwDCZ+BDLY7y/cykbTzN0?=
 =?us-ascii?Q?tiCfuR2gatqREMSPRnlNuB4i9QoM+e58wYnqdXuRtl4f6/+tacBRJbCDvvDu?=
 =?us-ascii?Q?Hanspe3a7Vt+jbapMQnglY7FCUqnLdStW0DMzulaIcBn9w9Q2JTEYVDMHctU?=
 =?us-ascii?Q?1XFMWj7WraCzpZcp4zVEWKK2f/bDOPOCCdRIDCBAxZ4Nh6ZdI4Qx5wcYiNMj?=
 =?us-ascii?Q?m6ayRnn8eUn2i0kKpAGDOuljTGWz2obxSFDkmXpFbjkJAQ9r1qY6JuBo3nga?=
 =?us-ascii?Q?8k25gOjzl7IQR5E0yaHsshhhEkMlYIx2dnsRhXyT+bVG+SYG0bPMA0pAXz+W?=
 =?us-ascii?Q?pE+sKdTreIdlI+oVwOXjGzO3AjMP8fGG7U8KVro+jeow0zsbJShhaHhX2u4g?=
 =?us-ascii?Q?semQJ4Wa8ILPF3ar4vNQZ/f4Gf8kZpbJkBlb1z8pd3s0wI0hsSpCzXIy5COS?=
 =?us-ascii?Q?zyFQEab+a0C9kpHzazJf/CtC3f8pYvxzHsnNaTz/43/Rex+0y7o7fMDixn0Y?=
 =?us-ascii?Q?m4Db93f31WmIexbKh638vrm+JsHA/8PjiWbrglHXMUy1j8Mp3v0oPYmmQI2t?=
 =?us-ascii?Q?HRtpBhRJ0mqO1hGHLCqd2H85OcDi8uvMLiL4UVsRYjOMu5v29jqg0fvncU2B?=
 =?us-ascii?Q?o0yc5UBgVUjQ2vlrql28nGH3TdyO4VsU9ZB7UV/pONBvz7+qEbwcJviE6yt4?=
 =?us-ascii?Q?tvvhM6Xa1I0OKSsDCrGMPYk3h6oyzEOrlrHsw6D4RNh9m5SkDen1NXe2GrtP?=
 =?us-ascii?Q?AIl96VYOTCmxaCn/7qx5klac909I2VZTFu6yorccy8SQN58HVc2navFG8/FF?=
 =?us-ascii?Q?FfbrdBAN5ApoPHreNSMwqsefiICa7Gd8x+HWSCXD/D9ZbBLRdV4yNmL5pyAq?=
 =?us-ascii?Q?bWmZGFODwr+bhV59Fn5NSD0E4RwEcvSrCBTFb8iQI632Rl9X+gJpWgl7bvlB?=
 =?us-ascii?Q?vi/oQk71QG9uF7stkrXBxUfPbYUEzZsRzgX3ZwJWo65F+kNxYWaPbtTWmbsU?=
 =?us-ascii?Q?lAfZfdQ+ApA4CtTSk7ZtEQ+5ANUBHMQtivROP3WQNjCxwr18PSbWEcwkMVPU?=
 =?us-ascii?Q?S9yzWVCWpM9Iu79DXu0KkvAhtReHtzFASr4DNsBpLey5dkOFPZ3nNefRtSdY?=
 =?us-ascii?Q?jcUr7ipM4YE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M0qWJEQf9iHXGnXW/pL0s5HXXDBZPm78gJH8xKOp8obpAu8/7eAzud7PDr6y?=
 =?us-ascii?Q?7OjSG54yvE4ArFVLeoEE8IYLzFx3R/iH+nHHN5srWoDoa5tZGwkdHuMl2J6A?=
 =?us-ascii?Q?MPrWxocTU0mH3LA4HhbEf3BuIuTuCYL7F9p0rRh3vrfqJPp+5y9n5YByOahy?=
 =?us-ascii?Q?7huGhxCNXaZDTWUldQHIR7GfvF4heZ/DKMSVJf/6JX3Aez0Hy9iCA3odmxhK?=
 =?us-ascii?Q?kajXfaRpRQt1mRAqM7rK+uE4rhYasCQbbAexjCJmuUpQkPqvXVji+LJ7B0kA?=
 =?us-ascii?Q?eavGslB+z5V4yxwiQs4pi+727srLh4ZjOdIiWtKsgLAnLclRW+W8Vlzq0XtA?=
 =?us-ascii?Q?Uv4iOOtwPlp4Y3sJBcf3pHaSGqqRYtIMpmGIylU120I5i1nRVY3StQi7FOm3?=
 =?us-ascii?Q?9Dbf2ux26rLXATo9aNW79fJWQdTlW+ODRPwxO5Vg6wnahdPFTr8ipq8qocmo?=
 =?us-ascii?Q?EYF85J60TAWZzWr0hiUOTFGPrTYhMozcxqLkSV1V0S34vVUPhQH+lCAzE5Dx?=
 =?us-ascii?Q?WivLbmPWvJLNTigYP8IOGhprbpmSgfcaWQw/NOslmFfqILfeVxm1YgFWwTKx?=
 =?us-ascii?Q?1pdupdNHa5NivEzKvSoMvlOE5LVKsga+leFZoivsxVQWlK9oU49/57urbkOt?=
 =?us-ascii?Q?IfMspM82enCrPghz+eQKJP2ui8SKvR7qhgCGQ/3zMKZaYLiiuQMq/py5cKxD?=
 =?us-ascii?Q?SmemyBRPOChXHKEMIKdbF8cYXMPjpSsLJXyXUzNr9gwfFhui6TvyoDeAAyl0?=
 =?us-ascii?Q?ldNVpWbQ3ctz5MuLtTV0klRpn3P5s0BHKUwFrEZwpqSHjz856v6gBT2gwQZT?=
 =?us-ascii?Q?KkLm8AMlF395I0EwI2nR4Rgt8StLr2L8+a0yUPn9i+ifyhQ/xqh7V1p2qa4P?=
 =?us-ascii?Q?ziVtrdi9z54LOKHIW+t6qPAavf50Dvk5H8An2iyyx3FTdPUCVyYgnK0bGjq+?=
 =?us-ascii?Q?7tYWRAmk9+9npWgRCF40qcZXZvVbAtWKn59byvA24HcUT3WNUNS/vDN2xcnp?=
 =?us-ascii?Q?KKMTXhA9yZQhXc4v+rJDoB83jm+jg/qwzuEwjI66fHkQNG7qKQmKJSJ7wsp6?=
 =?us-ascii?Q?BxDyYXQeraRypOZgSqj7bu4L84sPRDCjogJvkbq+imfC5kkiXosmLdkNpq7M?=
 =?us-ascii?Q?gmwR5gIfK4rR2y8mvDNwo+tYC1NfF7jBtPTeIg0cX+scqKFS/DmNzNeNYW02?=
 =?us-ascii?Q?oPG9//kpYCMWjZOYZxWE57Qqb4XT6Uo7iFZeuEQgRhzZj8NtFS/lSm2wxej7?=
 =?us-ascii?Q?rgg17dAvX1zj8VAJc2h1D56QiV0DW6AiknOWgvfK+2Fa6L4dcrVd5Vz8CPeB?=
 =?us-ascii?Q?OcLMo5uG6D1+EN/UiRUOhamjGZEVGH+A1ClUByXluGtCfi9bwYWyS1MXV1cE?=
 =?us-ascii?Q?bs0BeZLtCDcxcJe546RpQloYhjAMy3uMcrjdGz9+PGrjJaPt3t4enLi0UU9q?=
 =?us-ascii?Q?8Ojx4YEG+Q15ZLeicibk+1tGqSYFAwU1DiTsOXIw6Zp+dDEuHpxP6vkjayQF?=
 =?us-ascii?Q?QODCGNBUJ//s8MYoYoQ4HHn2RW1UHAmz7vzVBITW3/v0QKIcEpBZmCTeqQgp?=
 =?us-ascii?Q?gTnIy0rgvU3IBuxA+0RKo3z48BaxBDQFjNb+FJW5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5e1f36-8598-4ad1-f57a-08ddefcefa08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 18:30:39.7689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmIdp8Kgs19wiSAreeQEFXJoNyf9IsyLrq6uKOWnKoSqZ5mGTMw/SISyfSltzgWEgOFMKtunr5JZeWAlrEeSOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318
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

On Mon, Sep 08, 2025 at 12:40:17PM +0900, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> > Add support for custom visiblity to allow for users to control visibility
> > of the structure and helpers.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > ---
> >  drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
> >  drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
> >  2 files changed, 31 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
> > index 068334c86981..1047c5c17e2d 100644
> > --- a/drivers/gpu/nova-core/bitstruct.rs
> > +++ b/drivers/gpu/nova-core/bitstruct.rs
> > @@ -9,7 +9,7 @@
> >  ///
> >  /// ```rust
> >  /// bitstruct! {
> > -///     struct ControlReg: u32 {
> > +///     pub struct ControlReg: u32 {
> >  ///         3:0       mode        as u8 ?=> Mode;
> >  ///         7:4       state       as u8 => State;
> >  ///     }
> 
> Maybe mention in the documentation that the field accessors are given
> the same visibility as the type - otherwise one might be led into
> thinking that they can specify visibility for individual fields as well
> (I'm wondering whether we might ever want that in the future?).

Sure, good idea, done.

> > @@ -34,21 +34,21 @@
> >  ///   and returns the result. This is useful with fields for which not all values are valid.
> >  macro_rules! bitstruct {
> >      // Main entry point - defines the bitfield struct with fields
> > -    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> > -        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
> > +    ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> > +        bitstruct!(@core $name $vis $storage $(, $comment)? { $($fields)* });
> >      };
> >  
> >      // All rules below are helpers.
> >  
> >      // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
> >      // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
> > -    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> > +    (@core $name:ident $vis:vis $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
> 
> Being very nitpicky here, but for consistency why not put `$vis` before
> `$name` since it is the order they are given by the caller?

Perfect comment, changed it.

> >          $(
> >          #[doc=$comment]
> >          )?
> >          #[repr(transparent)]
> >          #[derive(Clone, Copy)]
> > -        pub(crate) struct $name($storage);
> > +        $vis struct $name($vis $storage);
> 
> `$storage` should probably be kept private - we already have accessors
> for it, and the visibility parameter is for the outer type, not its
> internals.

Already done for next revision. Thanks,

thanks,

 - Joel

