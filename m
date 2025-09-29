Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E22BA79FD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 02:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE24C10E1B2;
	Mon, 29 Sep 2025 00:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="exVK1RfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFD610E1B0;
 Mon, 29 Sep 2025 00:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YINTMjQ7+wj2mekIAm15q7y+WSwetPzR2oqMYfoUmVEqZXPdgBdGWq1Vjaz1r9On3X1iRnrYZ+7ENrDgONScoPVcx0zjICnG+diwy1qez75xa/6AEeTpU1LjF1n/LoHHDTX6ky0NKSA67QK1CpTsr8Y0Ag2nFixbXZHq1knuB/xGd3rn4NNaOqgZzpAC9fNUu9GnZqw298P3EtG/l6pdovpF3o1/1gYOX9bA1sfvEhLMBISOB1bjDCzxSH5cYQcSy/q6HqcUS8DF3JVs+11nQVxEYh7amohBXIMZZO90lvNwzmLXn3UJE7rYZL4+B9IetiF11LxIMiAlYWW9wUaZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H47JqkeolYnsmKIZ19f6zBihNQTNlTZIihkcuiArdGw=;
 b=x4/YhpNPiNhkiLd/xQAk1NGRPuMD6pbkLDlnM/swQIZRBKlpyPAHMV99OsmDnn1ajbA8oFtVdYO1UcoJKPNwq1zoxX3YBKZKoX2MD6lCmGYU6mtxPnWJHNOSgz/kaFC0u4y865EzhdeBb8DNK0ZdioXdoQRLAOlFoMkrVjiPxyJGfg67Xaw3TXuCxiKiS0yI00QdrB1atRG9tZexhEPaLF5fKyCPUxGa6v7axnQWaz3blFxjN8DsfS3mvmYw8NmgCY5PW1ZOHhZRoILbbFAgljGWQBlVonen1SYuUb6e0VLTmm/I2MyBYkeVXs31OFOy5u3lP+fl1Mslg6BAEfbE8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H47JqkeolYnsmKIZ19f6zBihNQTNlTZIihkcuiArdGw=;
 b=exVK1RfRFuF2SSeiWkYsf1sN1Y703gW5rpWymPQF9YE1agGPNinzZjzaJ7u5YKlQlBKP8tfnzb/rfpsX7IFWzjZk3bpNRs3sVI1D2zD/8ES+LQQ4Vx7019IrpD+DmuHxqXGisqDPRU4eEm+Iww0ocH7vN8LjubGDL+yf7wDr6i8bho6iW//DwD1cDFSO6+YmBWLQJtdjmDxJ5ee0hfoUaS20KDgq8PP777XylqB+AVJNDRCNYEEaIJeo/v51seLMzsN4thPjPHXzGThGV5udaWRTIbOUsHkFIQAGB6njvxIuuH0BO6tHtwx+EevhS3n0PXzubreMn4/GiA2byLyNng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 00:29:36 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 00:29:36 +0000
Date: Mon, 29 Sep 2025 10:29:31 +1000
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
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
Message-ID: <btrbmoivzhslvirfj5ourlmtr5mah4brrzbyhibneb7j7bdqhk@qclukqco4nza>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-4-apopple@nvidia.com>
 <e024e964c5e79b1c86dadcb8c19d14d175bcb0a7.camel@redhat.com>
 <DD2C8MKHDRCA.1XRV8RNPCXAN7@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD2C8MKHDRCA.1XRV8RNPCXAN7@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0048.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::18) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e99919-8be0-4c8a-772f-08ddfeef445f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zreAi+lXdRYb3pmUhZOrWL9UOzLvQ8oxYYP8PMCRHtV9dgK9iZm7fhUmiaT8?=
 =?us-ascii?Q?756efQBZxr4BLhyVlsa0Fc4cfB2p75Nraq3/DXQKi7pXuw5xvR4z+VMVFz6L?=
 =?us-ascii?Q?65ONnGLhCyOB1RwO0kDCaqOwb3qpJQX7wFJVwy1s9NtThwajn8vBtXRK+dKh?=
 =?us-ascii?Q?BzBAW6eElpmusUb05UxEmcl6ADlsB8c9695Qeds6mjmsj74CPCQL2hmmE3Mz?=
 =?us-ascii?Q?/OhouhZHiPOMJJWZ91HbWYOQHUKEW/Ak33+zNBSizWh7e5Ja8ZWunkiP58Qu?=
 =?us-ascii?Q?xZTb7mcAw3y97u93OZa/CWzw4Yx9TId4NdU3aMHDTZlJB6vJcI64hz09qe/o?=
 =?us-ascii?Q?ZtHKvBZDWAowEWY8440qGj3AbNKqv41EKEd8Isdc7n+WzQQyAGosPCSbFyuz?=
 =?us-ascii?Q?F9te8YRSFmUzVhMOyiBrELtGWOaBsUqauYADNEKeVFNw+sLSoNd998s7GM50?=
 =?us-ascii?Q?yPCkWKC1PqyxqRODrNl+ua0nx24yMNr/a9fPdh22rE1xmJ91kIIbLY7sorCW?=
 =?us-ascii?Q?PbuuR9ODEg7qaM8RljGWaMVj7VhIdueuhVqzTkcp4bODxQ/z3SGPrxHonPBx?=
 =?us-ascii?Q?/QdGJVu2+Rw+na9XtakuhPJTTopTKtELNjq3ff5zUrD1LrDWEemgkug1t2OT?=
 =?us-ascii?Q?UP+LGF2mwsKjL9NvGgjXQRlxO1pov56Q+1fqh5/qBJWDuKlpwUMXnqmTsaaQ?=
 =?us-ascii?Q?Rz1F/KHicrpCLDw81gYTG81rhoaic42TyESW76zviakhXOJte9QvbdyfgiMe?=
 =?us-ascii?Q?y1Dc76UcjzAqJ0HRJWjGs4kaCyPzPanQL9YYr+6haOfu/1k3dWKfFgMB/oUs?=
 =?us-ascii?Q?HNguC18zWKo/tvVT5eunHzQRcu0Q+ae2P4hSxhje28aGZh9q/GTREP0JWbzi?=
 =?us-ascii?Q?RzRXFREElYsQAH8fR/P+QgYql3TT8lIJl37Ej59KLfYgT/F1O4IvXFaT2cdI?=
 =?us-ascii?Q?wUlGsNt6dUsuWy4oDEUIcFIL0eYIDW7gNLd4kUdS5ujUXOk3cl1ovAMUfQxF?=
 =?us-ascii?Q?UwUPVCpy2L+cc+cm44G3LCUaAz0rVyD52tENCDdxgKiKiUi5Q81RTd4F53J0?=
 =?us-ascii?Q?BuKo+z1wynRoG8DZKWIHn0GAj5YAbFRDB0JgeTsQh/ceONJSb7GbfwuI11pt?=
 =?us-ascii?Q?o+I95gUS5Li6apy50M8IvpcoFsexP+6DRUE/Z4jVm/tODTZ3DkEzQ09TDVN6?=
 =?us-ascii?Q?z62a6aW+rYpCsZrt+S80RDuGzVOgzlu4qUou1BN0qYbCtRWt6vViTokqp4OT?=
 =?us-ascii?Q?NOP6MkjqmfjPmIRBh5kngD4J3vcla1eFAXpJU654ZBrvYPfPA06pjNV0fD5I?=
 =?us-ascii?Q?/oTJet3k5nv2eO9dHYhl5E0gvBdgFm/JWIWPKo6FoALsf6bJAAl6270MOX4P?=
 =?us-ascii?Q?+Hl2vRDnFwkFkOWedQ1xWn7o1O1t0dDsmSaWig28aD1LFUrdX9UeOeSbvWZo?=
 =?us-ascii?Q?AoHRlMIVsV/czhEM8wIkGnNj/Sx9vu1Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tEoQjztz1+r/lPlP8CEaT7Jk43e67Wt2PAI0poU6sFez+awOxGz1M6ksMzLD?=
 =?us-ascii?Q?NhyAIzNWAsB+A94aezra8h8dnbUy06e0uHSroPHYueiMQNJQrR8FL6d2bV5j?=
 =?us-ascii?Q?COX/13k761xBuE5nFvsW8Nm+2dBrcaj2jGWjs9o/w83opl8FIxe/SSfrHZj8?=
 =?us-ascii?Q?Rg+z0rt4+rVOf+4xrtzd9h6+RA0opc7SmWyGNchw6vg1iVpXnk2Nx5VHNHrh?=
 =?us-ascii?Q?4oMnHUaOxRS0p/AtiuqBeZoX81oBpXlnkR+H8k+0dMCQ8BghB7AWYITpQaCE?=
 =?us-ascii?Q?3H079ayW5OHFPAE9cIEOcHn+2gwBK7fOL0oNJ3pAVkzJX35iK28CumklXP3J?=
 =?us-ascii?Q?ZZiyZzroXYMpEieGc+jofWJM0nPSnf9IKx38mMPWngil8fst8T1ZbeqgDHKp?=
 =?us-ascii?Q?aa7Xq00He/R70wai6/yE0P3eERZQ4RgZreNe7yktvN1hwhUh4IUfx029oz2b?=
 =?us-ascii?Q?3LNXoinrcEOjR8GPglrgwd4Voh3adS4U3Ho0/dUNn4/LerV2mubtacr5o0iQ?=
 =?us-ascii?Q?DWtPFRfdYTPpLMmNHe4W2ZtI5/DgzUL5SSycfBD6ngNQjRDnnQsjlVQuBhiS?=
 =?us-ascii?Q?sOXvn36VvXVnFJCKVQ56Z2GQUD686Y5X+Or/hxYL2RCTOXY7c/1TKxOzhdOu?=
 =?us-ascii?Q?9LlKud2WE9hxNxTHc5/ZIXi2aWb18Vg9FhaA9gYX4MxkKavx4fYqg1E0RS8Z?=
 =?us-ascii?Q?CiTJDQ5dt9pUcAUSuohBnkFBI1TSL4QvEanr0vP3RiMUsdgO6Gkx7cblKgar?=
 =?us-ascii?Q?6RjyRSkwJAmCa0B4ZSnBf0O0qlzCGfo/aJYfHYGz+jdKIt8F4jR9zonesgwU?=
 =?us-ascii?Q?wXqxVO4oOpEZyt0MZQdpxKDSgcKjJDp4iXhtqYgHwMLzT1BMbffxhy82HnUZ?=
 =?us-ascii?Q?3knV6qN8Z/H6ajsaAL1Giwh3BDKUyUjOfxoMwHxjXJt7kI2j2GaY5UxHRuhf?=
 =?us-ascii?Q?TfcpWuNqhTF4k1oLTvujS0+nDa9gtYdpxGbp3q0P6kbp6OUIjC+I7KVkq0at?=
 =?us-ascii?Q?Vc6R9CTLncA+w9yd97dGIPFDMa1jLjORnJA+p/4p1EaTPwZ/y12xlDJBBvZa?=
 =?us-ascii?Q?qBOUAhOHgVIP0tMlGU8eYd0dF0Q0TAkGS+xvEn4l6+jOz+bqcotOkzVo/iJt?=
 =?us-ascii?Q?rk72xeN6ctnZ4DPv03m18mhYiCIEDUcAB0azzypol7r8B0k5Kmj7U+A/gs8B?=
 =?us-ascii?Q?XJY7/OUeKwEB1upVri5EKmJNFLu2ZWpvky2sZozI/pXVhbOFSgfHj+MdXxaW?=
 =?us-ascii?Q?snSjZp+F6WL1kx3obLH6HDq7nPSFGVnIs2wabE88ZQP1JIq/epWoVhvyu8EN?=
 =?us-ascii?Q?DJhR2KMdhTSURKFwJ1T3eiTyLbJlnL91oA5PoofRvQzVdrcxN8lW/u9bcUBQ?=
 =?us-ascii?Q?pK8Oq9GDtOVQm2lm4UmjMk6GFU2ZXXsZF2F2UEqy1RZGcO0I/oSuWs2axKCS?=
 =?us-ascii?Q?FxmwD/mdbmBqns3LCt4eOFcxKRZDZT0qai6V2pA5CFEFc/estGYxwI5aaNaP?=
 =?us-ascii?Q?9gdw2TdgxrNvQeKcggvtHDLmaovkinupB2y5M1UuURUEHQmFMtb6q68ukYM6?=
 =?us-ascii?Q?Sa+ziDBq71VGf3Y7tC+LVojbzK2yy87VMlASTy8O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e99919-8be0-4c8a-772f-08ddfeef445f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 00:29:35.9851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCTew/1HK+KgkTemwSCdbyKKPRHWvU4gGg2p9QROXvgev6Bn56efr+88EAUMyWPwBnqISAEbZr9GUCYfJigNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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

On 2025-09-26 at 11:24 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Thu Sep 25, 2025 at 5:24 AM JST, Lyude Paul wrote:
> > On Mon, 2025-09-22 at 21:30 +1000, Alistair Popple wrote:
> >> The GSP requires some pieces of metadata to boot. These are passed in a
> >> struct which the GSP transfers via DMA. Create this struct and get a
> >> handle to it for future use when booting the GSP.
> >> 
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> 
> >> ---
> >> 
> >> Changes for v2:
> >>  - Rebased on Alex's latest version
> >> ---
> >>  drivers/gpu/nova-core/fb.rs                   |  1 -
> >>  drivers/gpu/nova-core/firmware/gsp.rs         |  3 +-
> >>  drivers/gpu/nova-core/firmware/riscv.rs       |  6 +-
> >>  drivers/gpu/nova-core/gsp.rs                  |  1 +
> >>  drivers/gpu/nova-core/gsp/boot.rs             |  7 +++
> >>  drivers/gpu/nova-core/gsp/fw.rs               | 63 ++++++++++++++++++-
> >>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
> >>  7 files changed, 75 insertions(+), 8 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> >> index 4d6a1f452183..5580498ba2fb 100644
> >> --- a/drivers/gpu/nova-core/fb.rs
> >> +++ b/drivers/gpu/nova-core/fb.rs
> >> @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
> >>  ///
> >>  /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
> >>  #[derive(Debug)]
> >> -#[expect(dead_code)]
> >>  pub(crate) struct FbLayout {
> >>      /// Range of the framebuffer. Starts at `0`.
> >>      pub(crate) fb: Range<u64>,
> >> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
> >> index 9654810834d9..67b85e1db27d 100644
> >> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> >> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> >> @@ -127,7 +127,7 @@ pub(crate) struct GspFirmware {
> >>      /// Size in bytes of the firmware contained in [`Self::fw`].
> >>      pub size: usize,
> >>      /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
> >> -    signatures: DmaObject,
> >> +    pub signatures: DmaObject,
> >>      /// GSP bootloader, verifies the GSP firmware before loading and running it.
> >>      pub bootloader: RiscvFirmware,
> >>  }
> >> @@ -212,7 +212,6 @@ pub(crate) fn new<'a, 'b>(
> >>          }))
> >>      }
> >>  
> >> -    #[expect(unused)]
> >>      /// Returns the DMA handle of the radix3 level 0 page table.
> >>      pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
> >>          self.level0.dma_handle()
> >> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
> >> index b90acfc81e78..dec33d2b631a 100644
> >> --- a/drivers/gpu/nova-core/firmware/riscv.rs
> >> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
> >> @@ -53,11 +53,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
> >>  #[expect(unused)]
> >>  pub(crate) struct RiscvFirmware {
> >>      /// Offset at which the code starts in the firmware image.
> >> -    code_offset: u32,
> >> +    pub code_offset: u32,
> >>      /// Offset at which the data starts in the firmware image.
> >> -    data_offset: u32,
> >> +    pub data_offset: u32,
> >>      /// Offset at which the manifest starts in the firmware image.
> >> -    manifest_offset: u32,
> >> +    pub manifest_offset: u32,
> >>      /// Application version.
> >>      app_version: u32,
> >>      /// Device-mapped firmware image.
> >> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> >> index 0185f66971ff..2daa46f2a514 100644
> >> --- a/drivers/gpu/nova-core/gsp.rs
> >> +++ b/drivers/gpu/nova-core/gsp.rs
> >> @@ -13,6 +13,7 @@
> >>  use kernel::ptr::Alignment;
> >>  use kernel::transmute::{AsBytes, FromBytes};
> >>  
> >> +use crate::fb::FbLayout;
> >>  use fw::LibosMemoryRegionInitArgument;
> >>  
> >>  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> >> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> >> index fb22508128c4..1d2448331d7a 100644
> >> --- a/drivers/gpu/nova-core/gsp/boot.rs
> >> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> >> @@ -1,6 +1,8 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  
> >>  use kernel::device;
> >> +use kernel::dma::CoherentAllocation;
> >> +use kernel::dma_write;
> >>  use kernel::pci;
> >>  use kernel::prelude::*;
> >>  
> >> @@ -14,6 +16,7 @@
> >>      FIRMWARE_VERSION,
> >>  };
> >>  use crate::gpu::Chipset;
> >> +use crate::gsp::GspFwWprMeta;
> >>  use crate::regs;
> >>  use crate::vbios::Vbios;
> >>  
> >> @@ -132,6 +135,10 @@ pub(crate) fn boot(
> >>              bar,
> >>          )?;
> >>  
> >> +        let wpr_meta =
> >> +            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
> >> +        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
> >
> > Not something I think we need to block this series on, but this line does make
> > me wonder if we should have a variant of dma_write!() that uses
> > CoherentAllocation::write(), since I think that would actually be faster then
> > calling dma_write!() here.
> 
> Can you elaborate a bit on this idea? Would it be faster because it uses
> a non-volatile write in this case?
> 
> On a related note, I wish we could make all these accesses to
> single-instance coherent allocations non-fallible, as this is a pattern
> we use often in Nova and the only thing that can fail is
> `item_from_index`, which we know at build-time is valid as we are
> accessing the first element.
> 
> So if we enforced a rule that `count` must be >= 0 in
> `CoherentAllocation::alloc_attrs` (which is not currently enforced but
> would make sense imho), we could maybe add a new variant to
> `dma_read/write` that matches a non-indexed expression, and makes a
> non-fallible access to the first element of the allocation? How does
> that sound?

Would this have to be limited to the first element though? I assume we could
make a CoherentAllocation variant where the number of elements is a compile time
constant and therefore dma_read/write on those would be infallible except at
build time.

> Or we could also introduce a new type for single-instance allocations if
> that makes more sense.
