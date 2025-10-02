Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D9BB59E4
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 01:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41E710E0CF;
	Thu,  2 Oct 2025 23:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nIM6+T5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ADB10E06A;
 Thu,  2 Oct 2025 23:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArhyoL0Iau/h+6i+3g6Q0qwayE+NAFIOmX+DpV55Rzg7QURcfZgnbN8b+/PMxRpbzK0ousBiZBEEDlVhIA1ph/agPZ0KSzYzYqUOoHpj2vsSoWLMIm+E9rjGTaioy7SLCzhO9G/ZElbsbJDovAN3LvsJ1rSK4KypwrHo5jWs80lU5jJAIu/yHVHqm9znXbegX+IcOHPqGjXNOZIbQtGerU9V6pzvDNJV300DLKDizY+yCtCR+RyODY59I/6zISbgmEM4rVykJPclxv11r4KkfIidqMfKj6kQycxDu6+nP+0ELaaJSH35XAb8UfJTvEE2G//f1NaMFdyBs9cjHzXxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=093II70DBPp+ZQnH4bwwgJy2iBS/ZeKxkyiLAiudFIY=;
 b=cfiE/dSfkfnfdzeT9EyPZ0ekA7+wLY9DUBUcmKoGDz4x6MOeRXeUOfI6V3XN1Z7hqzDxYzNUQVXCz4UYuamyQeJE84n5AmTrVOBuovH6kFYlG3XVb/OEl2TwoWDWAEdcHzjWg37QCGiY6+HYQUa7daPsOICS8Q5Eo4cku6fKHMCen19Qm49VjoiY98+gW70ZTwpzfvvIvfH4Cii6LXMrnURJk7g51FyR4Sjxt531haB4bmK637ARobBatAjK/iHDl6GLFSH8fh+r6cJz9RGuKyIciKGUHJsNBTZsszb850nn5ueXGtfxYkqevfHhNf8eVj8JXhP/I5CgtCEfkdwXDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=093II70DBPp+ZQnH4bwwgJy2iBS/ZeKxkyiLAiudFIY=;
 b=nIM6+T5KVeaSDNWIlcxt6pl/D+0WtNVjf8I3CX4skJU5niKpQ0OmBLbq9pDXYQ22m8oQ9Wq3j5yLY1IveLreTgSUR1DacKIKydiBkl7zgjj23nn4YMuNpQQHscJ0M+G2xThGIXq2cUVdVHc17SqUSKH3f4yiKM+DkbnXbieHNacHtBRTaVvPXUODgYaRcWpXUivvzPsPhppKKzXG5a07de5e2WElxAADJhPDjOinsauzLdCZZDSOdp7v7u7Wl2YJZsDWXGRHRtcUzI8sEcvqR7a1kR1locXnwCFzMuwitfTcCHkoA0orHAXz6CR0i08UTCQOik3NgJKLsVqbKxiiQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 23:38:12 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 23:38:12 +0000
Date: Fri, 3 Oct 2025 09:38:05 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Message-ID: <pv7bhr5tsbszgql2zoisz4bwanzs75y4wu4lorc3bzgwahhbzk@f22lcgcnqbdj>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-9-apopple@nvidia.com>
 <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD7VU4239GS2.2MKVFPBFEY1R4@nvidia.com>
X-ClientProxiedBy: SY5P282CA0074.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 69284cb5-904a-4bdb-2105-08de020cc02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/yDohCZ56yPARX7eSZruM2tQz4wEu2UpXXSKRALsdtxEJsEhmZeLZEP5XIcV?=
 =?us-ascii?Q?H4MM0bSggSlQfJnA1y3GqtjolX02oPPN6kHNGwUmO+zJzc2vAGprl+feHDy0?=
 =?us-ascii?Q?KF0YjG2dqEYu5/zz1hc4XQmAOx+us8jJPo7K6hUDwQrbwQMUWvVMmJy04wcy?=
 =?us-ascii?Q?b9bgL5AT1zqd6xgJ2na227keKKslOuNQ/sO9tRSBGrpujvBGMy1WPIAhJLEh?=
 =?us-ascii?Q?S9gsoz7+sMGSWnRUAxxxadf8+s0LROtxlYAwYaPpraJlqyquhskvzaQFkDa5?=
 =?us-ascii?Q?0yWmMxPlQWsH7k2WWQlkM9KGs/EnGSiI1Nzl7SwD8atXjhJ4HkCsrfEa637X?=
 =?us-ascii?Q?ahIrMx2m6986hpQJhCHfxYm8jL+VyAocdGbVS67msUQvOsN8LOSQ44hzWKGA?=
 =?us-ascii?Q?AeM4LquSvYIXuiK7sY1s2GFmwCyR3BHGkA3e2+YUx+sFZlZIi+SGHL2TVStt?=
 =?us-ascii?Q?kJXjll19/ym9gKoJ7tfAi2o84eCysBuuLgxsSzkLCd3dXDf//STakZtoTRph?=
 =?us-ascii?Q?GlTQyqJUrjp/DfedFiHSHAL8nsnJWJrQDLbG24gHJ4EF91b05hx6J7jfNTlM?=
 =?us-ascii?Q?VDFC1wK3t6m8lUr3I5jm8VnZP5EtO7ShjD6mOkuL9qJb6zgFF3RogbDxANz7?=
 =?us-ascii?Q?zzdcHpMf6feBUnX5g8ENcTLOS/my+gKUsyZ/HT9dwOblG0Zvge3yTtFwplSC?=
 =?us-ascii?Q?iLK2NFpGnXgGQsrCYLmpeQ4HMAJVPbdcmeoKgoloEUjpc9CPQ5SY1sxTmTFH?=
 =?us-ascii?Q?fCKAiL8TfobPTgXhm7n3Z1oWp+mClzjT937v8N2r3Cd/TnXi3+x9x9LfuVC1?=
 =?us-ascii?Q?61x1dvc1M/ZX3cYrbFa1EMc4Kj/QXTJlTHq40YMpk4Di050teDs6nqSJYRoI?=
 =?us-ascii?Q?KhcktkEDkJkiTynO2NHrLkdkmv+sZxxtl2iPv3ZG4ryG0iyxmslYuLYnoSzS?=
 =?us-ascii?Q?egdoXfRHGeYAqkb9PmbhVPhMzK3rpVpSlz2SGia9L1hb1lZDvUVPd9dSs1xy?=
 =?us-ascii?Q?6jqoro4ioPF3ZOnoe8DHtUeTAK9CZOY1fubeqA2E9R1uVZhZS5AOhv7+aj6C?=
 =?us-ascii?Q?0CvsPbLE3H2ceU66PDgBotXFRrVajsWUy+xbt8jtlyV1xcwqzuLlwepYtaqM?=
 =?us-ascii?Q?0Bi6AeKw+uzDdM1zvHKuXkpSs7jcnX6P67ZvLzJ1tl4ynBWNDpGRgHD2Ajv2?=
 =?us-ascii?Q?oF6Wee1bTS4uoykZCbeYCMiCMEE4HEx7QnwI4GsFbmQjYLrM6Nb8ymzJkvvj?=
 =?us-ascii?Q?T+e0aiobqzenDoy5pKj1NFtKNb4OwopjoqJXfU5mLIHCdQCPK/tR4oFo1mNI?=
 =?us-ascii?Q?jiScMzsmR5adPgcHVRWeQSq5zQEoJvxhQYc9d0t4J/cYQIgy0bbQh93IaPp5?=
 =?us-ascii?Q?xm1n6fdXc9zvL2Uc9Vou8rzhISF575Rrj+/NJftMONbGSQsJ84HBr5UzHR1M?=
 =?us-ascii?Q?eYHJhkSwMpEvmmzrjzCFgHpsedDqVR5J2iSrqLLCPmozSwebPGWUDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hn/fxObWQzv39tgPBUvjEy27L0ttgmgcicG9petl2ylauc63+MuKvW5zdak3?=
 =?us-ascii?Q?jPVt1UH8ttM+38X/QSiTyTq/P4VayhnbMorC2t2sfMs1b6z5+7YP1WQ5qcK7?=
 =?us-ascii?Q?6qyybtJT1Af6vTH1XnFtr+juheBxIbpt+igagHqRKs1cp2y0le4oP91624g+?=
 =?us-ascii?Q?YNJNJAwoXjXe5H0uVkl3pIX74oHlUYWtqOjLdToVeQ4R1vqAtNjM7RKNPT1q?=
 =?us-ascii?Q?Cr8+cdPPF82Ip5jR9zzOAM9Mod8TbWoJwR4suoLMRCO34yfGZtqctWQ86GcS?=
 =?us-ascii?Q?w9YLvLZPPvzr7ljGO1RII6drAI5NgToA5myCJeTogY/RQ17+fKWNBuqwfEV+?=
 =?us-ascii?Q?cby7WVhlPzpnFabehMLNckJs3qF5DjLdm+ZNasvU9Bu0ccnsgrBjGrsDRDPa?=
 =?us-ascii?Q?FYB+pN2B/FNAePl5Zvm7lM0b6IgWG7rW05kQJClsRucx1AnvQzrl9wdG2R57?=
 =?us-ascii?Q?slcRsr5eFxME9D3/yJW3UN7ZAi+ZcLQrVzK7ZD38u/sgZNiB5RDYuf8Oqu7t?=
 =?us-ascii?Q?GSNBCBH7d6OAtff/FSOV5W+XL0TKIURUWdiXajjTMpjNOjM5tOeItI4Vq10Y?=
 =?us-ascii?Q?HiIxX8zRIZQyF2CDVaWc3b/XmozaeQjB98QY+/jw9oH4f4LiBzhZccazl4vN?=
 =?us-ascii?Q?vvbJTGKRxvFepByjdxLG/d545nc0ezpcCXkd+TsE+WVe/BGrCZt3CL/p5Yl7?=
 =?us-ascii?Q?KNdHLp3G6IN4USrGkDvqJ9nnoWclQAAz9TlHyUf2cr4lmFfnyN+dFyj7ZNI1?=
 =?us-ascii?Q?EpZuxiKTO/jjkNQxSzJcQbIr8muNmFOGXVN0z9DqIdrmSfe9Q/Erp5nR0o4N?=
 =?us-ascii?Q?oXdsb8thM4NNCvTFmWK4GJFGQ9HYsYVXc/yAI0hlooz77CmaVXrf5kdg/2+9?=
 =?us-ascii?Q?8rC3V4qBizROBwnijO1ucHzwE3/nYlAB9VMeg5gaLyv2uR85NhkOa42WY+8m?=
 =?us-ascii?Q?ePryr+AbnRWiM53my+8Rqk0kTFKYgC1CnsF64Qywv2gLxeNDWHiGX5LTMW9X?=
 =?us-ascii?Q?MhLwLEt1e/cia1hUYnqQjbifNloEOeTAqGxhw9so3qK6XvxcqFImjDnYdtiW?=
 =?us-ascii?Q?0F+FR2bxvwhajSNM5zIYhLMzcEIFzlC4E+du4e6JK/UZchl1zwpCAvV0Sjw6?=
 =?us-ascii?Q?qDvdlD4gwNHisqhyD14Iqj8HB72VE5dhMy64Pf5pVAohpDNDmAFHjmPDHwSV?=
 =?us-ascii?Q?N83EkcEK/ciKNGyNw1f7JhlnhHmBQh3BDs5o/wt2l3ywOU5Avk9OwXXjCRaG?=
 =?us-ascii?Q?A6cpFQ8PUJRz3bdBBKlpt0hOv7jI3jByGg/DYogUnTzJuf2MGFCqdjseXmcx?=
 =?us-ascii?Q?oJ9vN5dnnXEKOvTWP4oXWgRHTYQF/GFtmqcQSf/9JQZbCXkorfhBuWsNwvtd?=
 =?us-ascii?Q?Dh+KwgQeFERc4Ndr6J0eVknk1//ZEL1ze9u3EHu+Rrq7iDuhzXf5jLn+YOD0?=
 =?us-ascii?Q?2t12fEzJGcz9oxYvEEX53ELsAHa+Kr+T8G25OCABSkBi84wF4MGTiL3t45pt?=
 =?us-ascii?Q?d4fInwFUC5+9mxW+PnQtL30u6cWKdo2sS7Fo8arlUxTIXn4cP2q/55BiN7rE?=
 =?us-ascii?Q?Sfs0o1OnFKAIBzf+kfxCl97XvclgEh7pHfTxRNmH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69284cb5-904a-4bdb-2105-08de020cc02d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 23:38:12.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n9VVNRN2pliKAyGWYvDIN5Ur9VU0d+rewqBXvLmht1qbFLmLpW9xATDVPO4LxiIqT3mboUKIutNXMSufncizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
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

On 2025-10-02 at 23:49 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> Hi Alistair, (+Benno as this concerns the `init!` macros)
> 
> On Tue Sep 30, 2025 at 10:16 PM JST, Alistair Popple wrote:
> > Adds bindings and an in-place initialiser for the GspSystemInfo struct.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > It would be good to move to using the `init!` macros at some point, but
> > I couldn't figure out how to make that work to initialise an enum rather
> > than a struct as is required for the transparent representation.
> 
> Indeed we have to jump through a few (minor) hoops.
> 
> First the `init!` macros do not seem to support tuple structs. They
> match a `{` after the type name, which is not present in
> `GspSystemInfo`. By turning it into a regular struct with a single
> field, we can overcome this, and it doesn't affect the layout the
> `#[repr(transparent)]` can still be used.

I was thinking we should fix the `init!` macro to support tuple structs. Is
there some fundamental reason `init!` couldn't be modified to support tuple
structs? It seems like it would be nicer to fix that limitation rather than work
around it here.

> Then, due to a limitation with declarative macros, `init!` interprets
> `::` as a separator for generic arguments, so `bindings::GspSystemInfo`
> also doesn't parse. Here the trick is to use a local type alias.
> 
> After overcoming these two, I have been able to make
> `GspSystemInfo::init` return an in-place initializer. It is then a
> matter of changing `send_gsp_command` to accept it - please apply the
> following patch on top of your series for an illustration of how it can
> be done.
> 
> Note that I have added a new generic argument for the error returned by
> the `Init` - this is to let us also use infallible initializers
> transparently. The cool thing is that callers don't need to specify any
> generic argument since they can be inferred automatically.
> 
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> index 5580eaf52f7b..0709153f9dc9 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -247,12 +247,20 @@ fn notify_gsp(bar: &Bar0) {
>          NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
>      }
> 
> -    pub(crate) fn send_gsp_command<M: CommandToGsp>(
> +    pub(crate) fn send_gsp_command<M, E>(
>          &mut self,
>          bar: &Bar0,
>          payload_size: usize,
> -        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> -    ) -> Result {
> +        init: impl Init<M, E>,
> +        init_sbuffer: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> +    ) -> Result
> +    where
> +        M: CommandToGsp,
> +        // This allows all error types, including `Infallible`, to be used with `init`. Without
> +        // this we cannot use regular stack objects as `init` since their `Init` implementation
> +        // does not return any error.
> +        Error: From<E>,
> +    {
>          // TODO: a method that extracts the regions for a given command?
>          // ... and another that reduces the region to a given number of bytes!
>          let driver_area = self.gsp_mem.driver_write_area();
> @@ -264,7 +272,7 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>              return Err(EAGAIN);
>          }
> 
> -        let (msg_header, cmd, payload_1, payload_2) = {
> +        let (msg_header, cmd_ptr, payload_1, payload_2) = {
>              #[allow(clippy::incompatible_msrv)]
>              let (msg_header_slice, slice_1) = driver_area
>                  .0
> @@ -272,7 +280,6 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>                  .split_at_mut(size_of::<GspMsgElement>());
>              let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
>              let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
> -            let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
>              #[allow(clippy::incompatible_msrv)]
>              let payload_2 = driver_area.1.as_flattened_mut();
>              // TODO: Replace this workaround to cut the payload size.
> @@ -283,11 +290,22 @@ pub(crate) fn send_gsp_command<M: CommandToGsp>(
>                  None => (&mut payload_1[..payload_size], payload_2),
>              };
> 
> -            (msg_header, cmd, payload_1, payload_2)
> +            (
> +                msg_header,
> +                cmd_slice.as_mut_ptr().cast(),
> +                payload_1,
> +                payload_2,
> +            )
> +        };
> +
> +        let cmd = unsafe {
> +            init.__init(cmd_ptr)?;
> +            // Convert the pointer backto a reference for checksum.
> +            &mut *cmd_ptr
>          };
> 
>          let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
> -        init(cmd, sbuffer)?;
> +        init_sbuffer(sbuffer)?;
> 
>          *msg_header =
>              GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M::FUNCTION as u32);
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> index 69df8d4be353..6f1be9078853 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -79,10 +79,12 @@ pub(crate) fn build_registry(cmdq: &mut Cmdq, bar: &Bar0) -> Result {
>          ],
>      };
> 
> -    cmdq.send_gsp_command::<PackedRegistryTable>(bar, registry.size(), |table, sbuffer| {
> -        *table = PackedRegistryTable::new(GSP_REGISTRY_NUM_ENTRIES as u32, registry.size() as u32);
> -        registry.write_payload(sbuffer)
> -    })
> +    cmdq.send_gsp_command(
> +        bar,
> +        registry.size(),
> +        PackedRegistryTable::new(GSP_REGISTRY_NUM_ENTRIES as u32, registry.size() as u32),
> +        |sbuffer| registry.write_payload(sbuffer),
> +    )
>  }
> 
>  impl CommandToGsp for GspSystemInfo {
> @@ -95,7 +97,7 @@ pub(crate) fn set_system_info(
>      bar: &Bar0,
>  ) -> Result {
>      build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
> -    cmdq.send_gsp_command::<GspSystemInfo>(bar, 0, |info, _| GspSystemInfo::init(info, dev))?;
> +    cmdq.send_gsp_command(bar, 0, GspSystemInfo::init(dev), |_| Ok(()))?;
> 
>      Ok(())
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
> index 83c2b017c4cb..e69be2f422f2 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -4,31 +4,50 @@
>  use kernel::transmute::{AsBytes, FromBytes};
>  use kernel::{device, pci};
> 
> +// Ideally we would derive this for all our bindings, using the same technique as
> +// https://lore.kernel.org/rust-for-linux/20250814093046.2071971-3-lossin@kernel.org/
> +unsafe impl Zeroable for bindings::GspSystemInfo {}
> +
>  #[repr(transparent)]
> -pub(crate) struct GspSystemInfo(bindings::GspSystemInfo);
> +pub(crate) struct GspSystemInfo {
> +    // `try_init!` doesn't seem to work with tuple structs. Work around this by declaring a regular
> +    // field, which comes down to exactly the same.
> +    inner: bindings::GspSystemInfo,
> +}
> 
>  impl GspSystemInfo {
> -    pub(crate) fn init(&mut self, dev: &pci::Device<device::Bound>) -> Result {
> -        self.0.gpuPhysAddr = dev.resource_start(0)?;
> -        self.0.gpuPhysFbAddr = dev.resource_start(1)?;
> -        self.0.gpuPhysInstAddr = dev.resource_start(3)?;
> -        self.0.nvDomainBusDeviceFunc = u64::from(dev.dev_id());
> +    #[allow(non_snake_case)]
> +    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
> +        // `try_init!` interprets `::` as a separator for generics, use a type alias to remove
> +        // them.
> +        type InnerGspSystemInfo = bindings::GspSystemInfo;
> 
> -        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
> -        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
> -        self.0.maxUserVa = (1 << 47) - 4096;
> -        self.0.pciConfigMirrorBase = 0x088000;
> -        self.0.pciConfigMirrorSize = 0x001000;
> +        // Initializer for the bindings type.
> +        let init_inner = try_init!(InnerGspSystemInfo {
> +            gpuPhysAddr: dev.resource_start(0)?,
> +            gpuPhysFbAddr: dev.resource_start(1)?,
> +            gpuPhysInstAddr: dev.resource_start(3)?,
> +            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
> 
> -        self.0.PCIDeviceID =
> -            (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw());
> -        self.0.PCISubDeviceID =
> -            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
> -        self.0.PCIRevisionID = u32::from(dev.revision_id());
> -        self.0.bIsPrimary = 0;
> -        self.0.bPreserveVideoMemoryAllocations = 0;
> +            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
> +            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
> +            maxUserVa: (1 << 47) - 4096,
> +            pciConfigMirrorBase: 0x088000,
> +            pciConfigMirrorSize: 0x001000,
> 
> -        Ok(())
> +            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
> +            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
> +                | u32::from(dev.subsystem_vendor_id()),
> +            PCIRevisionID: u32::from(dev.revision_id()),
> +            bIsPrimary: 0,
> +            bPreserveVideoMemoryAllocations: 0,
> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        // Final initializer for our type.
> +        try_init!(GspSystemInfo {
> +            inner <- init_inner,
> +        })
>      }
>  }
