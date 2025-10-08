Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8ABBC35F4
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 07:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824A310E08E;
	Wed,  8 Oct 2025 05:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eQnmDOhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDBC10E08E;
 Wed,  8 Oct 2025 05:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZKZXbT91LmtSGgvW0x5t2FimMzzpN8lXSu8LZzL/r5U7SV3fq/aWEBMuMRpqAnBSS6rrdQUelBUoLcUIhkXbV6w53yH0xcl8LT7v8pa+MhUFu9FGFtXUtdreCuWpNAZyH6uSMjgvZ3fTKDUFkJnstbKLQ9KOrB7b6jENU6xJ/1UAXT/p0BH7uRyb7nuRleYyECbBE9G5z8ZeYDq6nfK6KjCsyBnCeNv4sKLmC8NjQiTEQfafxWkN6wTbWIBaCt/2RiHX11d0TOA0U8F3cgl5Gs2joywlsrYpLa7UvwfPj3GQ5+t7i/kvODoM0EBh0GfXq640nwUWlOui7a5+htBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnMhS8J0pU37AuKDKpXj2xoIgm7hTaRGeUYiRxVnuNs=;
 b=lYgxjy1O/171FVyOwdM4eICNdT5tu6qoSMVv3J1HQFpQTJZXf4joIiV2SRNBxzJmSdgpOlmgh2SW3klomU5NB4b+aGJnZieMvFAXoGOk7f31ZwDaBWwSTCKhTFaKxh80ar8SB+HWnMBxXj/5GzHT65w0NTR2fQwsovml+x4f8bDsD4KbztiPrUP/mHUxk5m7xs1izEbyQF5/FXU5uwsHhE7JbgbRdsbm5shEYdSfon4Q7wvv/OUmEO6cdpbwaNK0p8uy9obDw2CeQNC/2A4J1jGfuaduPQrLXy51qEpp5edqDUO8dK2MsPczGJp+qfh+yg1l773Mh6QZ8xipqND1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnMhS8J0pU37AuKDKpXj2xoIgm7hTaRGeUYiRxVnuNs=;
 b=eQnmDOhVJw2kyEsdcY0kM+uCmP+wqBj3Ap02e6jfQ5Rs+ntKoUHcRNrjrEzvQach3wUbKooMtUFsbtkwtOR8n6Ld+Kkag65/xOl0EODCZo+ubLLTP1nXiBq9egQAho3URfWrT7v33AZtGA/oVSr6leQoI2d1BStuhrn6LBxNGO20L3jrdZsCErhaFBtjwkCBPtt0jVEtBP07T4TeyfTdm80sKF1SYhTG/oLEq5/2tfXVaK9G0QenBT+No3W+uP1AfnGbnsvOBQgwsmjUa333sTPLZWW77rmXaZmQWPqJdvToUTIXT73fXlxuiLr6+ZHFq9LZpffHJVvhDTDRtAxQ+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 05:16:42 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 05:16:42 +0000
Date: Wed, 8 Oct 2025 16:16:37 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "lossin@kernel.org" <lossin@kernel.org>, 
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 John Hubbard <jhubbard@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 "gary@garyguo.net" <gary@garyguo.net>, "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v4 12/13] nova-core: falcon: Add support to write
 firmware version
Message-ID: <5kxodbtwdynnvdats34aroj423nphas7jw2s3n3eh5eiwkbp7s@dyzoc2lzkkky>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-13-apopple@nvidia.com>
 <aaf218306186aa8959d8f3971a62afb9f229548b.camel@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaf218306186aa8959d8f3971a62afb9f229548b.camel@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0094.ausprd01.prod.outlook.com
 (2603:10c6:10:207::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bda385c-9fd4-497e-fb28-08de0629ddc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?t0ibq9sBs5FGD36/fg2aWFqjx68HTTGYIINC/bd06ORd6oqXVqiKE4zhYh?=
 =?iso-8859-1?Q?G4LjIXbNLVI+nOJ3zzbYMVa4CQCF08o8NU7zj/mxzeulxpv6r9JyZeg6vJ?=
 =?iso-8859-1?Q?9xhg3Um6H0CW74Ddo7jYN2aPNqqn+D501GpkcyU99MZD8KkUe7YJB5HtXn?=
 =?iso-8859-1?Q?gGf0prScjOxk1jchZjC+B4AxxgdpdOlfGbjjm61cmvallGquqns0slmGH3?=
 =?iso-8859-1?Q?i3/mnMkeZSGM09kwcuK9gSZPPTWCxtCK7c400AjWW+QW5U4lN3lDiiVKxv?=
 =?iso-8859-1?Q?RhfIuBjXi+etwEn9hyKFAC1Q28QvK2sGLsND7udmLjow+wvtjOpYfBQpTJ?=
 =?iso-8859-1?Q?bGPHg2i+7lsJmAUN8oziBIYVsKfIlgUBbFlmHkFrD6oEiNe9bfFNbYrTwx?=
 =?iso-8859-1?Q?O/UPkrnhkioNHONp8bkG52mw63kQ+P6faXUrAndp2ZziyvuLEUSkV/320d?=
 =?iso-8859-1?Q?o7HmjJr1RlH2pJE6X0M8ELQD+Ii3bP76z5s1y2/zllrF44U2MYAOHYhEpe?=
 =?iso-8859-1?Q?LXJu9CMoe5xs6Qrts2+w/zjBUES2oT5JD3+JQH3MCqjtPGeBwiCLMrGg/H?=
 =?iso-8859-1?Q?vXBKeTyiye4f6wuDv2mfHrSusiWeZd1mLJpyApjCheLdMUG2FVP6rPXFXH?=
 =?iso-8859-1?Q?IXjp4BNPS4vxe3Yem+3Ypiuj7xDs37GMvvoMltEZagrkFoPiwIF+WMUPjh?=
 =?iso-8859-1?Q?cGL/+aIJihYFz3o+1hx33ef3EXbbxmkniAihrZb0blHAPEa1FqSOlmhLgx?=
 =?iso-8859-1?Q?DROMHb0mF2QEdNQ85IcEbIYRct9bKoBQaZ/rc3I8r3O5LQ4kIgl3B4Dop0?=
 =?iso-8859-1?Q?Kl6N1zT4BiJUXGgfkcCGuVXQ1WpPVQYanZJhCHpsW/ObNROw3OxTr9YFp3?=
 =?iso-8859-1?Q?qZE6wDhe00mEFVgV6IokLpMDHNhXsBEjTZINfAvk/eRsKwccCuF6LWMx3T?=
 =?iso-8859-1?Q?42zIDkTAENOZvyRAKVhlcpTrw/KxuMBsACa6xCz+WsOF7K+5wlnAUaDoeW?=
 =?iso-8859-1?Q?Qu7pfMOHVP53s9Bpd0H0IwBh3WWjN/LTvnnh/76J6KgxtrVgnZ0769Vb2s?=
 =?iso-8859-1?Q?CT5mjZUlbSkX1xbVWUJV1qymdKKBvUG3xnj4/hwCGCeNxeI2dlMGiiGj0R?=
 =?iso-8859-1?Q?wqTPBMwhODYkCZ2u53lFJeDzaOgMNq9L34XTw6TKfHIq5LOaFqz9qC3GLK?=
 =?iso-8859-1?Q?ahg42JXT2Y55+HKIySpWQA0akFMptuDOousk87AsRhXslNLouIOtCmceEJ?=
 =?iso-8859-1?Q?JS29mDLewgKwNuYj+UlRlQJPDpWE+Uus8WQpAsDjFn2nB28n3xxNbHlEtN?=
 =?iso-8859-1?Q?sd7Y2F2v+ysfqNOFSJrlkeQ2lVs4XmxK401AY7fzwTo7ca6VrGBZjEE4zB?=
 =?iso-8859-1?Q?fq1Yhn+XoTOlR38dsbcBs+06yaMWoWDvj+jDDVcSTi9H4vnad0vm8cO6i4?=
 =?iso-8859-1?Q?BGlVJiKCV8Ey/uUHueZIRzFCFOIKAP1nQD1QkqvnCJXjt/QpTnyUleRrM4?=
 =?iso-8859-1?Q?zNFSJDa4BMLnPVZ/SM2wU/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EHm0klG9ug2Qj2y+d2otjDHHONz36YP7EuQklhn4CY0vCjz9GaQk5kZVr5?=
 =?iso-8859-1?Q?DiJlWeB5JW/tiP8g/JCbe6tV6K+FhJGCmQlT9FoivOzAnd6Zu/5QV/IbYD?=
 =?iso-8859-1?Q?+2nqhw7zQMKyUJUs4JHfeeypwBIyLRhn6CA0j1QbypOu3SzHRUaLRh5NXG?=
 =?iso-8859-1?Q?CN2DyC1V+ujQy51AfOuyPz6FQ2h5BdiquLZ1J3S2haddPPh8XdVqCzA9ir?=
 =?iso-8859-1?Q?XuGjYcSj+rniaFHTjLM7KDELXK6Of2h9ycz7YTU3p7SBjJJ33wJur42+y0?=
 =?iso-8859-1?Q?N2eWo4YgZciEjKazVw5ILqA8YswgIUlrw2gjdDUwasMkgJTY2Ld7V3VUBn?=
 =?iso-8859-1?Q?W+9BVN+HRv2sj2bVuqNhRGyWaR8d5lW9zMbtGyva6N+FNpcawTL7nCfk9l?=
 =?iso-8859-1?Q?CDHu0w5fjLk7INQtQ2NDm/1KC0ZyEi3XaEl/rptH0FcFopAJx8F4Rgrjhy?=
 =?iso-8859-1?Q?RT9z+jaXlI5ZC/2LeJofTi9lh82a0tNsRgDw9TvPW3u2kJDbGStVbNdXBE?=
 =?iso-8859-1?Q?LgHKrKL/Di4kxMBXHNZ8Zbwng7HkhMIGF0pbutERLQKpeH5NMK5zafcG91?=
 =?iso-8859-1?Q?xTe5CRcwfu6em8hsflw1WFoBDVPtOwmygL0WHF9v9RNt8UzCo00ttjBALt?=
 =?iso-8859-1?Q?zs8hiyYnEknQ40urlMXij4w1wJmlpKf/cNIQw0/4ogFUjE7XI47ahmewZs?=
 =?iso-8859-1?Q?PsgXsL3cF18Lg3y4QpanyM5zIB+Zfq+YKKQCR+tQAC7UdtuHUqxU4tZjhn?=
 =?iso-8859-1?Q?mkis0V8nsdiN9YQrbqrQAV+6wloqkBNjaLp8FAHgqMSF9/73JgVBFO6Kw8?=
 =?iso-8859-1?Q?u9a2j7kc4XPLgigqgGWThHuxpKWoDnoLqFDHnqGc/83vCNw+46GHfy8a/c?=
 =?iso-8859-1?Q?oo3KGUvj2WxJYgkJvU3k5PRxzHCB9U+lFo0O2awmGu36ZekmU04A+mWBEt?=
 =?iso-8859-1?Q?XusORdA++blaktlHW/yus++BPbPqlPJVfIqS50MIPFI/OuUZDLiTjofVKh?=
 =?iso-8859-1?Q?xxsFcTM8pnCzuklV+KQ9orHbQ5+vQSqFspCc85zn2gxWQU2of6q2XyFKaQ?=
 =?iso-8859-1?Q?Amp3+qxNxM8wBB0dNUE8M2I9af5F/ugVaREWjF4UeZFS0EgJ1pOb55jPJ1?=
 =?iso-8859-1?Q?4+FdhK5jYgHFgtpwhO6gZX9w/7GK2S7STeCzPWMmIU2VL5GVgYlB+v9ECX?=
 =?iso-8859-1?Q?Jj67+1dFfbh3RAhJdl8CKycLopTUrJe1YnyXj+tO8Y60CJwzM3sDBw/a3T?=
 =?iso-8859-1?Q?flVUoyh4KOjirpZeQ6P0cZ8mQCWGoiq8ZxHlVipW2giF2E2X8Sl8PnVtHn?=
 =?iso-8859-1?Q?mPl/7kvUnqKT4LDAEBHbiPEaTDtUlqHlAgyjgznH7NyrmSHFCf1/6Oh9ju?=
 =?iso-8859-1?Q?ufCJXxej20/xU5XIP06+V2BlrGDrAd9Y6dn6tO8I0aT3zqEPSaeESf79PU?=
 =?iso-8859-1?Q?mIpGR8xYgDw/cT/M0QVlRomGJ6R52sNLXfES+KdOZ8ALwioWo2nbhRGeDu?=
 =?iso-8859-1?Q?fcieNZF/QAkHpuIyuLHyhd5tDqjIZ1M58eOQ6p4fyKQ35TGhBN6ycuFdyN?=
 =?iso-8859-1?Q?kUpsJ56+8jMYfJvK7JMWnFkuzt8hPAolX3Q/XZhaZBoXFOtUOx/8KnwfXW?=
 =?iso-8859-1?Q?KXuQ9VL0ZDb09xLP2Y2VSED08qEp0VIpdq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bda385c-9fd4-497e-fb28-08de0629ddc6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 05:16:41.9161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhBDVH6DQhn5n9S/HI+fLVKuHep8nhBmMFEsCnPOAFoLjikmXxvVbNZp82tjdRBTmRhwJT15xeSxWwT8nwskNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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

On 2025-10-08 at 14:21 +1100, Timur Tabi <ttabi@nvidia.com> wrote...
> On Wed, 2025-10-08 at 11:12 +1100, Alistair Popple wrote:
> > +
> > +    /// Write the application version to the OS register.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
> > +        regs::NV_PFALCON_FALCON_OS::default()
> > +            .set_value(app_version)
> > +            .write(bar, &E::ID);
> > +        Ok(())
> > +    }
> 
> I should have noticed this in v3, but why return Result here?  This is just like is_riscv_active
> -- this function cannot fail.

Oh phooey. I recall noticing this but must've missed it when splitting the
fixes. There will almost certainly be a v5 so will fix it then. Thanks.
