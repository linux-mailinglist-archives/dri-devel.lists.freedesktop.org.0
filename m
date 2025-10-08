Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD308BC6CCC
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CA110E0E2;
	Wed,  8 Oct 2025 22:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LZ4vUHDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252AE10E0E2;
 Wed,  8 Oct 2025 22:34:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuHL3+m/4p0ciLvYlW7jeWSo5ciaJthqahluPw82UsJwaUKRHowjLYpRLx0TrwLe8ZefEgEPZsD7N2oTM6mV+HEVXPPhbqPWJGKqdqGR88RvGk5Gr8gO+YYMB3gN+7D4cFu/it/NTx69+4QJff01k39l6gk5l7kxE6BiinjZzaOwUgVkRQblLhG+wGoJH9C2lahst9A/57v+VZ9YyF0FDk0KRP+KUdVBpxPzF+UTmlfopKRuCTbCuBt5odvYBtfqBR2hENDQv+r9By1d/00uO4s4uYwKFyv1YE21sJN4FPYtq6TrnE9qPmVZyNhpa93SULLgKygZhKcFr25YUJkeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fbq61dFWDMiAOOae1Xbu2QzxeMoKWrnuC6SW7Jg9VAA=;
 b=Jo8b0B2jeFHqi0GlFKt+DaTU8bMmf78ZgMiQzSX9saC+w714ermKwMqR+GvRSNUV5K2qQZQ6Wi/xDYRbVqw2SCDrkUo+HNwLzbqrd+xRASJdeO0aFWJJO9dn91/nUCZ5c7p2rvBJEvMwzvYEBcSJD/dxwLFV+KpanIC3x0eX7NhAHGc1AUEQgqYtzX2q1H278pJ36a+rEG7e1UHs3jmYaNu9D/oKU7OzZkbvYiDLHcaG1K5DBNFXrrCTpRsNqm1G6YtvP+z1o1LIFhZnE7Impc00vO2hrGRsIz4aF+VGEORlhmiuI4tgA1Ldq6BTUmf8waNzg/Eq+9R8/FR2c1Wfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fbq61dFWDMiAOOae1Xbu2QzxeMoKWrnuC6SW7Jg9VAA=;
 b=LZ4vUHDqx4f1fKIwGqtahlEQBXXeKpRDdybyU+YEy8vuaGlsdZeMcC2ceTndLkFtx0DM+hqXgq6ZSkEv9Sm0difHPS866K8oW/srEG/WL7izUf4GoMqeiMeMtVI0rE+NQjfkROM2XvleKrUckyUyzIqdNr3KhFFSeOe+kDx+aoVpm8ED5h6Sw8fSxT+hFgmTQuo0B3oipBv95dq953qT5JAENJU48skm1r6935B6jKTxmQrduGDqnSp4SY94t4oRipM66OkxZK5ABZMM1saqS/2HcrYwoRrgdUvvKu6uQXDzI3SosT8blrbm3nIZIlbb4uv4U9WkEYMY1pIkJI6sQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH8PR12MB9792.namprd12.prod.outlook.com (2603:10b6:610:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 22:34:41 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 22:34:41 +0000
Date: Thu, 9 Oct 2025 09:34:36 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
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
Subject: Re: [PATCH v4 01/13] gpu: nova-core: Set correct DMA mask
Message-ID: <tmworgafsb7jgxyk3muoj4plhhc57xrlzy7g7cyqahvrj6ame6@5qykqhbtpswf>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-2-apopple@nvidia.com>
 <DDCVDASJNW9T.BUT6XK1WXD0A@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDCVDASJNW9T.BUT6XK1WXD0A@kernel.org>
X-ClientProxiedBy: SY5P282CA0175.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::26) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH8PR12MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e3ab8c-032c-42ae-e024-08de06badee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gR8g9FdR2DQIxL3T35e7zuAtYMUAAn59mHXoK6MpcZ0GWn9JWvQ9glL75Ed7?=
 =?us-ascii?Q?mPztykbdiqZbHCEvjc1Dj1o4Kc5jzDlvCFne5Bon4nUleKFl6JtNDG7HUdnR?=
 =?us-ascii?Q?HMPUcLynBqWUsr+WOcL/h/IZ/+dBl2gxUkUvrlUjdYGwu4okmiugkPBBby9B?=
 =?us-ascii?Q?+w4kzOTWn9s7QPnW8qgTAaBfXIAxwBIZ7Y1M8XnfjrLxaxsqb0ChrS7Yk3mM?=
 =?us-ascii?Q?VTiwFIsTFLl4uAZvIXavm6mgjAM8TWDbrQEWPDqXW08NbtXQxg6BSeVBUdwP?=
 =?us-ascii?Q?vA1X3umUIa5cmRCe+GdIuQpMBFMmmSIEzIqJQCifcGSaI42ceTC3l0BIjibM?=
 =?us-ascii?Q?TkfkDDdS+3VZ0r/xTgafeWyxGvggTOWwmR49dPauVAY87DHE70wmB3/ZBZNV?=
 =?us-ascii?Q?U1cxWCK/vpQwUaJQH/EBA784oIpWcxv0RO4W+Dv8/96KyJGCI8cba9PaHZOQ?=
 =?us-ascii?Q?FFIXaRQ095YbvlpzA607B5eXDVTnxyoM3c/Hk+nFKDlf1ao+4O/TVCSQ4mex?=
 =?us-ascii?Q?Fla42CuvcUo2wj/XnZaktmLMQsvixoe6CvqgYlELrA256HtLtayCNjHaYy/e?=
 =?us-ascii?Q?mmRInlqN2v1Z0tv5pSQuD/ucZQRVJuzyVmTxVFMEYvqgZLA2LQIuI7AIESi4?=
 =?us-ascii?Q?i7w3qh5gqu+gcoqxmh7wO90PPHKgFu9zQ+FpTcN56g9HetcETP+BE/jacPrP?=
 =?us-ascii?Q?6HpSCwsboaAzQnyMN7nuTkThKOHDVnusxV2Yi+TN3Ot356ZS/BwDSfEqS0gq?=
 =?us-ascii?Q?lDuUqxBUL9aEQCbVcWftjsLnLXkoyArLGxBHPxxsUYaTIdecoF9x8YvuJwdX?=
 =?us-ascii?Q?WKZta6s/VlgF0iEbiVrCWHNADXunZm5lgxO0P2KZ8gfg7Vv7unvYQXRolJse?=
 =?us-ascii?Q?ub7f5t763QsNFzCmcrNvZnuXRJyFpbKDuOiIEIapI0u/EuZB/f866V35IFnl?=
 =?us-ascii?Q?o/8Ecdsxhd8MKLHnVPTLZ/znsQSbez49lJXe1OURNCqxaNBwNvajzcILezwU?=
 =?us-ascii?Q?X6xWWD47MBgl/GkTpdYbW3hLbf+LV+AKXJskcm9eqxKksKQBJNuJI6BsDcOX?=
 =?us-ascii?Q?GrvdG8mhayY6jUMUdWeFlnpssYNp9KJS9ZEGJTFYOzSjzLUIZJ5xAGhkUNwA?=
 =?us-ascii?Q?9rEsU/7wCWk17+cgHep4okEkojjImqoo3QNO6XND6IQq/sOwvyFbfQYnMveu?=
 =?us-ascii?Q?CAkaR1LZwrwDGLGLVorhSIrJj4bPZHdt/1UB9M8yC8C85qQ2MASKbh83G+zw?=
 =?us-ascii?Q?1/yX6Fp5DPqIvppuwUAzEM55QvGTT0UCCbHr01egdWTafyKE0X1BeJnXsOtu?=
 =?us-ascii?Q?6O5smrxte+YJibTyDTtuc4mFtvcnXHffnqdU2OPej00QCcUNIzw8DAFgPccp?=
 =?us-ascii?Q?8DSF8PpMHrN/QN7O1vnUZIDm0TaZd2wnur1yzhOYkeKpwWMbrVey/WJ5VWaC?=
 =?us-ascii?Q?zBXNecnPa8PVk567ZEXeHA/+tXF0FVZm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1pwkjoI+sOxIisY558eub8rwQuk+90hVlq1jEUSy4GUZ0ImjnnWnr/YIAAr?=
 =?us-ascii?Q?MtThZYtcgnai1OhGhV1acqxYpbld9jlwC0L1yTNF7l1v+yvGRJGKJil1V/bt?=
 =?us-ascii?Q?29//w1R/6nGw54FkG7Xv3K89r0tCB9bUtEXJl8erRKqayLjg3eiMjHbhI7/i?=
 =?us-ascii?Q?QAYFNV6V+ML1qRZhYbfhNn4gJZMrADe7oGSqilrIjCPWGxuqwlhHGXstq4m8?=
 =?us-ascii?Q?IWBXNb+5M38xoC/ZKQuNCvzLGpVCjdP2CfyWWq/ETJtPCPsFxPAporriuRuB?=
 =?us-ascii?Q?Yd3TT17OTmQ7WR+AErgXRjpnV7GStQI2JiaAByQzExPWjK4W6ef9eN5PrKZI?=
 =?us-ascii?Q?BUkgygfklIEmGBlzXAN9X+O2ToaTzAw5sCc491YWN3Kv2V1dNrv/aDve0QGW?=
 =?us-ascii?Q?XSOXKny7XjCUIp6m9SZ19bXA2ai7IlvCbXzlk034ztlFoQCQPhpjRt7qgMLI?=
 =?us-ascii?Q?NPfE93fGZYoOLg2qEI6++x7mePSUR9oKbJ2oRDB2cnYNWQ86eHj07HLWNKP+?=
 =?us-ascii?Q?hKMbQfPsAVA848jOZxj7SH+J2r3UtFoMdp0I+QZ4abByoLH3qt0gUTj6Mgxm?=
 =?us-ascii?Q?sx+6ehWFnAArhauqXS2u4+P6TirjsBCHz9csKHj4rSpwLXe3B2pWRhvQ4yBA?=
 =?us-ascii?Q?rxFz8ajhhMvSxVepNNvswLQtFb4s24r0yXRNekoavgIVfOIY3UlqL2YB7sVn?=
 =?us-ascii?Q?0U+HKyfLUdd+ZszBmSrW3VQc8WD+ulrIRqeNv0ZGiybkRF9Md+GuJzwCWeS9?=
 =?us-ascii?Q?KsA3yFjxTaXdxz2bNmyGMGlFfET/bSTKBT8dYm9uheF+5B47fNDa8XmPkkax?=
 =?us-ascii?Q?Z2k9CWNwLVWnqPYM67vqKCJG04jGZbqC4dJwVWag20P4wa5QkLNvqhkiYvD/?=
 =?us-ascii?Q?jNks2CWudtdKZKoFJyRBonmU8jj3WbVlerXJVAuTmjbrHTcFUwbcqoRWd2cr?=
 =?us-ascii?Q?oKbSOU5w7DUpZhiXDVrEsp2iWxgZgifFgneiH6/Rzwzy1niZipAAtRTeNsph?=
 =?us-ascii?Q?NlpTNIBS/g0JS7ZzlLtMzlpWPZnXiYOwr7YgmKVAqVHU5xTNPBCBzSW+SQlk?=
 =?us-ascii?Q?tXbh+gOT9/RX4eKE5VelYca8Vs/Ovn5AEe3j+cmL6bjzCj5tKiKI3aParpdi?=
 =?us-ascii?Q?OI/csqcNMBZ6qBRKP3qFXcFcs8ICbCgdMpN7LJP6dlPVE9g4nRDZEF67tK67?=
 =?us-ascii?Q?Ub8fzf7caf1m77lKoQc6sD4wjYE4Bd8b7kz4TjARw70eAXTn/mYfCCuFKSeB?=
 =?us-ascii?Q?o/aXwzusWATVnP9sVcS+7sKCi1TIweFRY8ZQZA5byY6CmiEn8yXlJkyl8RjH?=
 =?us-ascii?Q?fk0oiEaOBfCGrBuMVIXjNJScpVKbjxpTSF2rNpyWdvquUwstvEBSK40h8Wu/?=
 =?us-ascii?Q?wBETrndiydQhSvTp944SNJsrErm4MtWiZXYelHwvtO14J0WsY0WWzFA+xpyZ?=
 =?us-ascii?Q?uRE1l3n221LozAy9NXV6Ekq4JEzSm5L0SiejbDL9IJMyccAmJi/Je7dnF+wj?=
 =?us-ascii?Q?70L3HDjkawY5PPOYz+ZnjOilxrCXpIvpMNHuXbQpijNuMUWvxeaCHOePcxMC?=
 =?us-ascii?Q?C7zI+aPBXrXHawir2RjhYxGEQM98Zb/cHJ7aO4kH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e3ab8c-032c-42ae-e024-08de06badee3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:34:41.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BEpOpHDfUAZ4U+4j75gtDqWcJGfzfMV16CAFCL9+V63G7Se6D6QJRG3vPRIS8HsIqs3p7HYdmtutvZ8oaEwNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9792
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

On 2025-10-08 at 21:30 +1100, Danilo Krummrich <dakr@kernel.org> wrote...
> On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> > Set the correct DMA mask. Without this DMA will fail on some setups.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v4:
> >  - Use a const (GPU_DMA_BITS) instead of a magic number
> >
> > Changes for v2:
> >  - Update DMA mask to correct value for Ampere/Turing (47 bits)
> > ---
> >  drivers/gpu/nova-core/driver.rs | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> > index edc72052e27a..84fe4a45eb6a 100644
> > --- a/drivers/gpu/nova-core/driver.rs
> > +++ b/drivers/gpu/nova-core/driver.rs
> > @@ -3,6 +3,8 @@
> >  use kernel::{
> >      auxiliary, c_str,
> >      device::Core,
> > +    dma::Device,
> > +    dma::DmaMask,
> >      pci,
> >      pci::{Class, ClassMask, Vendor},
> >      prelude::*,
> > @@ -20,6 +22,10 @@ pub(crate) struct NovaCore {
> >  }
> >  
> >  const BAR0_SIZE: usize = SZ_16M;
> > +
> > +// For now we only support Ampere which can use up to 47-bit DMA addresses.
> > +const GPU_DMA_BITS: u32 = 47;
> 
> IIRC, the idea was to abstract this properly with a subsequent patch worked on
> by John. In that case, please add a TODO.

Yep. I have added the following for v5:

// TODO: Add an abstraction for this to support newer GPUs which may support
// larger DMA addresses. Restricting these to smaller address widths wont have any
// adverse impacts for now.

> >  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
> >  
> >  kernel::pci_device_table!(
> > @@ -57,6 +63,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
> >          pdev.enable_device_mem()?;
> >          pdev.set_master();
> >  
> > +        // SAFETY: No DMA allocations have been made yet
> 
> I think you forgot to address my comment from v2:

Indeed I did sorry.
 
> 	It's not really about DMA allocations that have been made previously, there is
> 	no unsafe behavior in that.
> 	
> 	It's about the method must not be called concurrently with any DMA allocation or
> 	mapping primitives.
> 	
> 	Can you please adjust the comment correspondingly?

Have changed it to this for v5:

        // SAFETY: No concurrent DMA allocations or mappings can be made because
        // the device is still being probed and therefore isn't being used by
        // other threads of execution.

> In general, I recommend having a look at the safety requirements of the
> corresponding function.

Ack, that is my general approach. Whether I adaquately explain how they are met
is a different question :)

> NIT: Please end with a period.
> 
> > +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
> > +
> >          let devres_bar = Arc::pin_init(
> >              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
> >              GFP_KERNEL,
> > -- 
> > 2.50.1
> 
