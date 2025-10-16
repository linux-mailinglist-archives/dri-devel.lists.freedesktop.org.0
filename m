Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA80BE5C20
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 01:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E9310EAB3;
	Thu, 16 Oct 2025 23:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qsLsbK82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012060.outbound.protection.outlook.com
 [40.93.195.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7684510EAB3;
 Thu, 16 Oct 2025 23:03:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtWBFIIVGEV1FZ/24ZTHxnX7Ni+pC4+a89Dhw9OCr6DQwUmdkvTun0qk2odeTryvDoQv+QclwR0t9iICCtX3W3pX2FnTzPIFdUB8ZbWbXrnCYdRxQql+Cg+0Ks++hdTnvLQydReBiCxUGXlT+INWpLYgb0CKeNplVAiey6d5eY1Ljd+qzz4XFrkDShZDl8JTqUEicSaK+zMoW6G8odUmOgvksgoXOAdxTuHSM5+rcF/6aRUrVX5avxF0iCtNvSrsF7Nl7dg0NTmtSP6LLqZS4J5BP4FSlclaFHkasaX2GYb6JLUFKf+Jpbl10WgJPF4BcTEnySyBSTV8jS37tisEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QM4fQPfFX4Ijt6r1MesXJlQH5etqwA5Rsi+Ou10POMk=;
 b=t/y7qpAa5siqPRuB1ROUvLH0pnePz9i7S2wh7pJ1OaaUmV8knbaJ3dO01n1CF83sRekLOFK2FhAWr1zt/pMbBh1B4HzT8PCv9MDCTxZHI79b9HhBnOp7nfE9orYobJo01ve2Sk7gBH82kD8IkRV3SnmArI+9f68b3Huc/yDbHGmkK6ETg5nVxxOG0v9rVXfJhtwoPAwzbKskE1/QWbfjTBVGSoqTK/bkMBdqHQD2zLhAiYZNT79a8LlkWXGYlsShVmuwwBBK8ElTroB0FdeGiRZTmKvqtsNhd549Iaqk3XPQ6ewOgNctvshfYC6mFr3yqEkNxJKGNIusdX4xx9yZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM4fQPfFX4Ijt6r1MesXJlQH5etqwA5Rsi+Ou10POMk=;
 b=qsLsbK82uu9da6Cbd0TaYsMLgUAC4BFn/jmkaHCOB3RqgRQtHoQvbbDzVkMRrOmhYAhmE9j3ySvn4/Ve6I6lx53Al3HaUVOz1uG0o4kGa2Ysz9cZKf2ea4fBAwVZtEiBJz+cdoYtSmVtvIv+KdsiCHYyO77gwDzuDGZevqufBs5HUsvIcNVRreBiLLYOYmax2OrGspZRiZyKh58MLh1DVR+SizjDox6/uZu+55PXVNA/yDJ1tT3CZFWJoPVam9/Fxrrb8/HFw7FLG60xlENMvoY9sH3xH8cWpnr1Uh/vXL5xyh1VnZOkXBDikfB0JyJ0sMkMEo3rGKbiviPA9UEfqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Thu, 16 Oct
 2025 23:03:09 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 23:03:09 +0000
Date: Fri, 17 Oct 2025 10:03:04 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
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
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
Message-ID: <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0152.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 171ace57-e9c4-41f5-4bca-08de0d082c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1tqXdbkdVbVSptskOfkIwPaKvhLy/H+O/VX4hxxfUs1Rwb+qTnd1nEpsqypo?=
 =?us-ascii?Q?98Q1NxP5vipefgTYVjaS6nErcLj0JhVZzlLcch6/CaxOAhgsZ3aezSycFqXo?=
 =?us-ascii?Q?1rzKdEBG49lVWUjpeuOWjs+suB0mX61oJgsgP5dGcGf+f/nWR5DOxVbi9UMn?=
 =?us-ascii?Q?MEp+hVhoStbs4I4DmOFTF5+nXX/of7kxE726iOWQLG9Msms6jZUt8B4DqAgs?=
 =?us-ascii?Q?M2LFbATj+d50wFXYpBpIhBmhNiqGkbBFCi1sR3OZCTbykAm/ZgYRpQvHQYnx?=
 =?us-ascii?Q?KA+7jfMYU8brkeEsxi7kjhXQ5D/es8E1+o0VyocwhGoPgnsraItAEQnm99v3?=
 =?us-ascii?Q?UzDwQZLm1++JCLtpIaElzbaxI5tZEbRrClSHe4SLj8GusgSuSrg0wAR5oJxN?=
 =?us-ascii?Q?gbkD6oiQiDHprYxgk2n0mX5dupAB9ghWuca58IMlJXjX+kceAj1WG4wKUNGi?=
 =?us-ascii?Q?pV56bEorT0K7JV+x8XoKbahg9cJPSA0CjrT7EWlsX/OTFb8CDOIOpKgi6jHZ?=
 =?us-ascii?Q?kabYxASH6PEPazWUF5v+EGFRDKELMJXCt6ZKFCu7sjqYbooucDKKIFwOYX7P?=
 =?us-ascii?Q?wdzjhPaSWrcjeSSX74AGdsB1jNJ1veT/DJY1UJqaVwyXUV+QWlXXZbnvk7Ha?=
 =?us-ascii?Q?RH4/UfcPynuTKZ7cs/vCyUKpsokZXY0A4p3vfd3zlXftu3Xmqrfnz5qEpnM6?=
 =?us-ascii?Q?KN+rWKDMtcEc/WQxGT0W+yxE5v7scUPLAWkdhaKwLruYN/0KykhmO6si5e2Y?=
 =?us-ascii?Q?zotdrB+Ntb/lhZ06IAAkSrM+DgbuFYX4xC+eNZN+PdAVj8SwLOuYIw+Op8mf?=
 =?us-ascii?Q?bAqWapnEMJgEgBfvP8MgI/0AzhBUmJHPV7zdALEC5uFLSr8CzF1DN/IcSwvj?=
 =?us-ascii?Q?wLnE/x0ISTm7qFlkqtrRCJebWMDl50MAEWhsnFOhJvuOG6siOnFfPa9ZnCQW?=
 =?us-ascii?Q?vn4dVfDK/ZuI6fnXu60PBXgfXdpJLhpVUmM1NUq6Fk37pIAbqdsMhBnINmX7?=
 =?us-ascii?Q?cOcebut4hDbq9/6/i8irbDq3I/22Xkwt1SSB/qaYlIIDdiYOhydGCD9bleEy?=
 =?us-ascii?Q?o/hmXeMAPsA+zvegm6MSslMHiBVbaxoWVgdxaWpxU3xI5F+XiaXFliHWLAdq?=
 =?us-ascii?Q?Xw/vUbUXw53HFOyl+kabAKjju3CO+VnEv80Kaa3/BrlHQvyknf3LcPiUVN0I?=
 =?us-ascii?Q?TXeBa48Afbke149cCLWXPts0mqDLFLF6ukEVVNGUK2nD4gAIuY4CaudncOMr?=
 =?us-ascii?Q?ES26SoGGy4PBhzgl4ky35TOKjHkwdkeu6j/MlfDYpgCR4ozZ95uGVrDt5s6Z?=
 =?us-ascii?Q?l0AHb9YF+PlvTpzTReBpDWtpcWbIabQt2wcMhJRTseJxK9fvRDqU0ZWNlBYH?=
 =?us-ascii?Q?wsgmr0M4ApkdFd455ZQ6liAnfxi3jh1fOEsA4nzHBaz/2NyDlSBYQxKMg1YQ?=
 =?us-ascii?Q?3W2A8WuZwu5680L107k8aZgCjv81uLUD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcDPW5v1OvJEVfaaTxfRGLw5CBcxwCKW4ZkGeX0WzhZdeQqRE54do4aadwJv?=
 =?us-ascii?Q?4+M7kVOyYzKh5QK4h17l0FdzOb/XYlPFGdhNkovyK+onB8CgKrio+hIdKQs/?=
 =?us-ascii?Q?hULgIimeeieAnBn7K2acr4Arm41Q861pDTauKhq9Tbmno/xd7tgeZYxcjBsL?=
 =?us-ascii?Q?mfqb2nn7sOn8ogU4xaEjyhciL8ro9sDHT5MHMIuItsgs6Jbg5S9TvEpa+cJZ?=
 =?us-ascii?Q?tcw+A7OmMwiO+bCCB/H/0m3LU4gZfRGOF0SETvYB8MsjiVtihPvGqyT+jutZ?=
 =?us-ascii?Q?YUyOemuimSUylLvGeYJjg2DbI1XSqmAS9Tt2+t0+NNIqfEpyRmXK9syKmBHK?=
 =?us-ascii?Q?0HVlrOT+hgKQLsIwYuQyeccfDnmn01pwF1onkW+skU5KzogpMtthWIFmHp3S?=
 =?us-ascii?Q?5ZosfeB0gElMqD7tfLXIi8I3g4bTi5Xo0fQzLueJFiqYRAXjxZFxY3XolBXb?=
 =?us-ascii?Q?YzZkfm6HKj1+Z+JuuKiOuM0QA8x2Sg8fGJkifWAjSNDKiD6jUGiC1TfA3hOY?=
 =?us-ascii?Q?wEWr3eTTTZu3iti27o+79i20XnXrWb8Te1K+exGNQCNNbwZ2OMgrdKyongbI?=
 =?us-ascii?Q?RMMT0C1qk6lxjcv3XELgDMUvExu91zparD9CAI5d+vFlluF3D6G30f9oHz0L?=
 =?us-ascii?Q?dtJLFPycBXY6hzLAbOQMlciQm/k3uJpFmH4SF9+6H+h29OFGyXlNygbc75J2?=
 =?us-ascii?Q?oqS1ViRlsVSt1jBLsoiLbp71EN8VsRpZ2tXTBPyanjKeFeje//B6kbzhDY99?=
 =?us-ascii?Q?rmBXBg5xKKz29ulo4Vuj9Ze0cBXKqJ3lUFLsxj8EqD8Vio9ey2pkIbmMj4Kw?=
 =?us-ascii?Q?Xzrz0wLQmT+g7KuIWFjLY/CqxTkRUbApzTBKaPGS9KE9RdHINsjoiU2wwtaq?=
 =?us-ascii?Q?5yxBSW7C7Lil39i3Kmiy1F4efp7T+De3MlK+eg8AOr+GyZHepQkntY1vSZ59?=
 =?us-ascii?Q?UBweFl+3LsYuhkokga2YcnBvxqt2hBcQxt+dRv2iJSxHAXXD/64LVwY6wSo9?=
 =?us-ascii?Q?5axmDs09YDyN+3LbED4/k0/BMKL5UR0cTGV4MvvLMYIKi0tRlUiSc/o5a7uk?=
 =?us-ascii?Q?fBrGA+FP0lRgqIuwSkNt8OsAy0af+z9Q/VcdYexWat4g2gHTZ9nF6gpiDL0+?=
 =?us-ascii?Q?mVzah/BkNQPnuLVOpKCADT28oHIPTpraHrD4SmAwE1uHTGbfGbmArhIKXvs3?=
 =?us-ascii?Q?vuHrwlvyivn0fzGwEL9OqiuwYxWojhxYkx5keBy8qux7wf7X7fC5mwM4WyK1?=
 =?us-ascii?Q?6cZkFFua4eLW3Q9qd0M9KrSWyAkjKpYAQ+Z0SXQYLHXceY/+OMjHUfCG+lzq?=
 =?us-ascii?Q?obqcjGV1AmyV5RcJxhXx8XUVMEuqHV0MwAqMMKfJxDUJAyqs5oFOlqE0C/xc?=
 =?us-ascii?Q?vfPLNQGMBLKCpv/PTeWOY0cmKmyYKnBsIqHJgk/fzkYDj6So2HKjJkRjyTGv?=
 =?us-ascii?Q?9mCJvBKRolo3AMMZDi+WT8M+2c7J1MLZNCdLXw/EqtJIV78djBXecGdno/Jp?=
 =?us-ascii?Q?Rhy2EzsYA8FZcC/rkx3s3SAWJzyLsj7A8eR7w/xT4tH1yB7mpBMi07yqdjOk?=
 =?us-ascii?Q?kkkd+CySBM2W6wh3qzVBLlvt5aSyk5CAUyWw+mHI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 171ace57-e9c4-41f5-4bca-08de0d082c99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 23:03:09.6849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTmKEwyNasS9XDosYJiD7U6QRm0LPHZc4PijxNYa5UR5APP4TsT2x+Sr3Z/xgGLKsCu5Fb4B61q5/ytE5kKwew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
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

On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > The GSP requires some pieces of metadata to boot. These are passed in a
> > struct which the GSP transfers via DMA. Create this struct and get a
> > handle to it for future use when booting the GSP.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v5:
> >  - Make member visibility match the struct visibility (thanks Danilo)
> >
> > Changes for v3:
> >  - Don't re-export WPR constants (thanks Alex)
> >
> > Changes for v2:
> >  - Rebased on Alex's latest version
> > ---
> >  drivers/gpu/nova-core/fb.rs                   |  1 -
> >  drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
> >  drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
> >  drivers/gpu/nova-core/gsp.rs                  |  2 +
> >  drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
> >  drivers/gpu/nova-core/gsp/fw.rs               | 55 ++++++++++++++++++-
> >  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
> >  7 files changed, 69 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> > index 4d6a1f452183..5580498ba2fb 100644
> > --- a/drivers/gpu/nova-core/fb.rs
> > +++ b/drivers/gpu/nova-core/fb.rs
> > @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
> >  ///
> >  /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
> >  #[derive(Debug)]
> > -#[expect(dead_code)]
> >  pub(crate) struct FbLayout {
> >      /// Range of the framebuffer. Starts at `0`.
> >      pub(crate) fb: Range<u64>,
> > diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> > index 3a1cf0607de7..c9ad912a3150 100644
> > --- a/drivers/gpu/nova-core/firmware/gsp.rs
> > +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> > @@ -131,7 +131,7 @@ pub(crate) struct GspFirmware {
> >      /// Size in bytes of the firmware contained in [`Self::fw`].
> >      pub size: usize,
> >      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
> > -    signatures: DmaObject,
> > +    pub signatures: DmaObject,
> 
> This needs to be `pub(crate)` or rustc 1.78 emits a warning (I'll also
> have to fix the surrounding ones in my own patch).

Thanks, missed that one.

> <snip>
> > +impl GspFwWprMeta {
> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
> > +        Self(bindings::GspFwWprMeta {
> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
> 
> Very unfortunately I'm afraid we will need to replace the `as` in this
> method with `u64::try_from` and make it return a `Result` for now.

And presumably most of the other `as` keywords in this function dealing with
usize as well? Have made the change but would you mind quickly explaining
why this is needed? Is the concern that usize might be more than 64 bits or
something?
