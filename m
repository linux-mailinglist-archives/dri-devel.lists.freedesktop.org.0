Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633EBE5FD8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A5B10EAD1;
	Fri, 17 Oct 2025 00:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PvhQ2JCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600DA10EACE;
 Fri, 17 Oct 2025 00:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC91/5vrjWsqS+5qOGsQvl6t0mF4HCR4F0lQmY3os1i0xz/TrZWuecAR2mnK0ST11nw7cPYxiUJ0C7BYZSQy3BsvonLxufMARvBc+BqDYcAXWwNhuhFLrsCxdF2GiVXJNVwCT+SSFVW+fTCfmSUBF1gX798UnxM5n1aWIFVlYNi47csP+ORboyhYUKkffYUrspyLENgool0Mt5Kdv0KD+2twqJJWv5qG9g1eDUtDa2T3KS4HX8rmtVCF9FajHjo66OG9Nl0lN8u3HuJ7sAu6DNJXPFbV+V/LwfzREqTdlx6KJmT3AxiFF2PQ7Xm3Vg6n65T4IDfbLiArvq7Ux0GaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPNQoVC4wfC2A858UNgqzyq5+rA8L8H4AZQAmbibGdU=;
 b=FFKOIo2JsFKeHlokabJegzB8/9h/yxAetMXQ5Iu8D1wTWFl7R2EsX/fpjuhUa/cJ4Gc5rKY1oKYhOB/80LRlaBv1gE+qLrhF1GXXCpSIMtSTt4xD2oMCyV9TIkHECWErtz6ufUtmfcACNh9CoF5RIXYTgDjL55byBP4302dYEC65Po+Zq1mZOBi4KvBWzqVeVU91QlQkB+Vw6eKPEDQmYMaDd2M0NpVSuR69ZlFPb92BoYqoKuSfNYvtKSVGX49EoMhTNGaRNjG0+UHauPjorOZsjty24z1hNBn0Tt9JdnMzP6Qs5Q1g1clwit5TTziqdfr+tWb3pueZjrh7TIw60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPNQoVC4wfC2A858UNgqzyq5+rA8L8H4AZQAmbibGdU=;
 b=PvhQ2JCg/nNKaRcbcKD2GU8ifCjEkLPSl8xoMwSlU+uyh4lGPbs+CofW82GlU6rEvvx4DuB8BvC7C5wyv+Ps1bZExulDznOWoFiTHSZ6sXBAGZDFmnS6XDkOpBmZiuhBXcrdmhBg+DCJw+NBEje3EGgJWoWM0BM+oMwPH5XGoUaboaVnBf/4eCC3Nzr9lt8/E+V9Lsz3KTxESyIA5WmMMtjFLI2O3vnVvs6T3Ak3pTWVsVzepwd1foNHwN6NuYRbPHaD2zjw2ivHVKUaqjgbH1VpLV4JaPKk7qISHj/AYj7B0zlRsd8UhJKv2F1AIdR4Tgb7MmsUKm3zspQke2068g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 00:49:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 00:49:44 +0000
Date: Fri, 17 Oct 2025 11:49:39 +1100
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
Subject: Re: [PATCH v5 08/14] gpu: nova-core: gsp: Create rmargs
Message-ID: <npxngncbzvf6js4c3buteqedwmxyptffb2l6dvk6a2qwyr7zq7@oamzi7eatbh5>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-9-apopple@nvidia.com>
 <DDJJ5D7K8MC4.301XTWWSLD7YT@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDJJ5D7K8MC4.301XTWWSLD7YT@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0074.ausprd01.prod.outlook.com
 (2603:10c6:10:110::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca612be-80e2-4866-715f-08de0d170fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZpCRIs0TLHx9WGYBBbDn304Ad+OLOWKIxmE48UceqjykPoeYHBTF2saCTAd?=
 =?us-ascii?Q?C90CXKYwIh6u8DTHYouZrLIRAHSgON8q0/o8F/Up6FySpHVs6FJj7xDlGFHD?=
 =?us-ascii?Q?TWGLHxW0ujCZKyk/ZIto8FSbYI/TgcBpbw7p5a8Z52RSZgW67uDs6Qlm4msA?=
 =?us-ascii?Q?RA4yVBHa62Pz+obegfpQr+pbQDFtDUIsylEVQXvrxo4LvRmuORoG3y01F+XF?=
 =?us-ascii?Q?gdm35nEMPvfGzjg1cixuKpWkMIDc44BLqqSaYrL/F3D7gFc32YGZhsNe6Tho?=
 =?us-ascii?Q?13ffVAnsfNF0OpTaFrdTuai91jNPe7yriRus+SzyBpgIWM/NwB78Oat/cE4O?=
 =?us-ascii?Q?oh15UaFGie2z1kd+NwAGaPlbh/+OTIcb7hfsRGuh+fnmg1MBkmWxsV0JSlmi?=
 =?us-ascii?Q?/BVmH4I3n0zWMMcRdO/WuX51A6WHbKKQmlXpplcUda2Kzuz2hKi3Ehj5SNTO?=
 =?us-ascii?Q?IqDz8lutxzeSu/mK4+NcEvHKLCVeMRFGUbX/cOrtmf7c0didxmItioYhF9dT?=
 =?us-ascii?Q?p44/9ukSCZrtNMsO+Gjpz7yA2qIIvUQ+1Ut7Xmdevfmb5YDksCzgxBaVUVvI?=
 =?us-ascii?Q?lsPQuGdVQ/pgB7b8e8fE0fuphrQJ/BBjRc1s+Ra10L0E+1hlb+FG1WlWknuF?=
 =?us-ascii?Q?TMP7JfAjJBFwq5EXVezvqf9zo2E6756VM5D+Nc/tD2nJUGP6zq3+dHsKdz5l?=
 =?us-ascii?Q?kT5VSdJZcLDNI0qqFPevguG016JrGRYbgWOJTQXjvGI5O988txi/tW910V+w?=
 =?us-ascii?Q?X17xH4PugoDilz705Dpo4JxaZ+5KjSrfT5ifFNI1syrpKVPGmqRPhaeefP1R?=
 =?us-ascii?Q?mFVBpFbu/Zl99qfb2rxt5xm6p2Odda7mwnLvczWT4K7fHQiGQGUK2h1wdQuK?=
 =?us-ascii?Q?gw7BOUsW+2f/Z/a39XBRwzr4947MbVFL2wjQxiteQlhEGFZsUeiTPoAwuHgN?=
 =?us-ascii?Q?DzXMyEhmXsDjCvQAfrFYtiG4cb5VTMFHu9+wscSuxIxMA5fIa7wBWAZyXcaQ?=
 =?us-ascii?Q?EL65QIj0VVA7/h5IH9yMXuWHdC9/Zr4by/pxYsJ+2t//2rGGuMcJx4fWgJp9?=
 =?us-ascii?Q?1IndIjO1vEFPA8BkhXK5I5eogFCyhR6aAW7UzsqjRCpVetFcgg4QSDR1VCTv?=
 =?us-ascii?Q?UJiqltsaEa+A6nsnsGYEevvsVfZBzcjRTOQWfAta7f8p8x0TzlPh+Vx2OhyO?=
 =?us-ascii?Q?2ujs4kqEFiMg19wDCaTLWKEx6nsY48o6l+CR/QtPlRu3jrgfHK2XsPk/56dA?=
 =?us-ascii?Q?ddhNBk5w8cfeLOBetf5VPNz3XKIcQGzHCCujbj9bXJ/res6XnSjPcpHwP6LS?=
 =?us-ascii?Q?Bk+s+DPOaD4twbox3c+BhOvT8SrZZ1KuwrSAOjRh6m3S4O3vRYAtRFU41LYa?=
 =?us-ascii?Q?aBO+nVy+QS/jkp4wxYTuCgdWvcQ0ZQcUMkvIfwj5so5lWoFT25RTzfgE7cRN?=
 =?us-ascii?Q?dRhxnE7xzO5HkOJtHLdi8g3MZUe2X+4b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FJWONy/xN2cZhKCox3Sf+7ULLIhyRhySDfrw3KdSDQBswpK+nslgyF6Zni9j?=
 =?us-ascii?Q?HhbXyVFySNzwA/M2RRMJXQoqm4KVvO0/NqgO/qLPydvc9FlVEEKBYYKm9vPg?=
 =?us-ascii?Q?a6q3XUaduCp2Usyv7JnVoMV6pP4McNBk40bDtlpkkYTCmygKN7OhdYEW7SvG?=
 =?us-ascii?Q?Cx2eVJYhD9piVg+8UVwV7xAG7GcYRP1nHsys+zWKdUpSF9Np571Lvi9giFpW?=
 =?us-ascii?Q?gDJIGdQlPAnc3Ex6ZvKW+uQMZrRH9xkijrnicbuWVB1DFLnPKitYT/NrUOPY?=
 =?us-ascii?Q?CPUNc7QhKhGB0MjthkJjthngrmTZuEYAF8+WNCYNUGwWYll+uLRbpOPhH95Y?=
 =?us-ascii?Q?8r+293+UlW4cUFSTr0WYxAEZiJLgQ4ZbAr7mGMeiqm14pDiFv0opmBiON0kg?=
 =?us-ascii?Q?dezo0LJwvB5dOYCUtfwMrsY1AczWXKpcyoOBOTI+wfD2njf+joWN72plKq2o?=
 =?us-ascii?Q?CM3zK/2kkPAnQNPGJurb/WL67r3iWM+srDsZKfzivXPNndoVqTyCqnNHmg3j?=
 =?us-ascii?Q?Rwsdwd6t8FwYsZPQt+vuoKIwuO7KIlHt4mIMh5AfFcja48VgC7bwsw/DZKti?=
 =?us-ascii?Q?+vNPPIs+9Z0ZU/M79GkFz+o10LzVhRJveZDVzLtATybCkG/T13wvLTKAvn2M?=
 =?us-ascii?Q?4+KpXiRdGC3f60CpJWtn2Ot73jdkM8qoIJT0h/cJj8A03UDcpohWcq5ZERPT?=
 =?us-ascii?Q?ZZWe+H4JVBHkMCafZ2rQyXwZWTsdX+tl9HwmwzuhhRzt7j/HwXK8gjeAXtH3?=
 =?us-ascii?Q?e7TEfugCQMYqquSHwk+LeEqjv146OZSr0GKluCOQB2aIpo5I9ETeYNemh1Ng?=
 =?us-ascii?Q?0MiVZeD6oAt/pGH5AcPaMeXtoCmLvDT6Dkom2nQLMNSS6Ka5pDBIT8pxzLgp?=
 =?us-ascii?Q?pW4bRYrNhBsGMeAYwEmJnHgc+OPlNISkVo4P6Y24d0SSjlNjdwPwkIXzl/5r?=
 =?us-ascii?Q?XH1MXQW+rR4C+QaXErM0arTbluUAxr6A4bFRzc5QHRch6rpy3E0xOON4asi+?=
 =?us-ascii?Q?GDNZOvmc7q5Fb3xruI4we06eQgqTN9fwjQMNtsknsyubfgFOQ6NPxDftIve1?=
 =?us-ascii?Q?PCajcvqmzJAXE3zYca8xRdwiuQDsqN9v+JneaccKno+uHnMMtBWy2ZWh9+Md?=
 =?us-ascii?Q?07SJ9h+3D9t1PUOiQKqkivTknyb+jRPoD+x8VXlOTOoNocpTMOtzA7HdtY/A?=
 =?us-ascii?Q?yz46ZFvLnzDOP9lgQJjetC1h3VcH6FQzjEWAsjtAG3W14DuFkWfZq/qZ5WBp?=
 =?us-ascii?Q?eOpHn732T/ypIbQ5irwdhO7rZ3hfrETAnvEqz5g7Cl+3mhhtkMwiEXT2cuaj?=
 =?us-ascii?Q?727dXik2vQEjfpPH/3PdvbRJto++il7FQk4cyTbN5fFI+6/aMCwHESE2UbP2?=
 =?us-ascii?Q?nG8OuHFrfkpjpgIqrn5NpIfDQJf5envPZ3zIic951QyNjRhdZadkyk7I872+?=
 =?us-ascii?Q?Rf4gYXgCJLdP9EQ4bcNt7DdIqWbmB+Le3i9IhWUOtQzsQrxATA8ynBTdy8g7?=
 =?us-ascii?Q?eiKdZzmMTzjwyE+8G6TjHSQCfHHL6iQKYHIVQ4G115bCv+Bi9HFaaj77R2Og?=
 =?us-ascii?Q?KXZ0w1dE2e4txLwb2qM1ghwc6kO4ffQxeH5nCbBT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca612be-80e2-4866-715f-08de0d170fd6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:49:44.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bluvOUwUoyEquCx1MVnaCd+Af3kvVOunPDP/jvQhZJYx4R+OlYmQcJth0IHxxns2EhxAgL1WgNrXO6Z81sd9XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134
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

On 2025-10-16 at 17:24 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > Initialise the GSP resource manager arguments (rmargs) which provide
> > initialisation parameters to the GSP firmware during boot. The rmargs
> > structure contains arguments to configure the GSP message/command queue
> > location.
> >
> > These are mapped for coherent DMA and added to the libos data structure
> > for access when booting GSP.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v5:
> >  - Derive Zeroable trait
> >
> > Changes for v2:
> >  - Rebased on Alex's latest series
> > ---
> >  drivers/gpu/nova-core/gsp.rs                  |  16 +++
> >  drivers/gpu/nova-core/gsp/cmdq.rs             |  24 +++-
> >  drivers/gpu/nova-core/gsp/fw.rs               |  60 ++++++++
> >  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ------------------
> 
> Mmm, looks like we are removing bindings. Can we not add them in the
> first place? :)

Bah. That's just bad rebasing - updating the bindings to add Zeroable to them
was as much of a pain as I thought it would be :-)

> >  4 files changed, 97 insertions(+), 135 deletions(-)
> >
> > diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> > index 1d472c5fad7a..58b595b8badd 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -19,6 +19,7 @@
> >  mod fw;
> >  
> >  use fw::LibosMemoryRegionInitArgument;
> > +use fw::GspArgumentsCached;
> >  
> >  pub(crate) mod cmdq;
> >  
> > @@ -36,6 +37,7 @@ pub(crate) struct Gsp {
> >      logintr: LogBuffer,
> >      logrm: LogBuffer,
> >      pub(crate) cmdq: Cmdq,
> > +    rmargs: CoherentAllocation<GspArgumentsCached>,
> >  }
> >  
> >  #[repr(C)]
> > @@ -117,12 +119,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
> >  
> >          // Creates its own PTE array.
> >          let cmdq = Cmdq::new(dev)?;
> > +        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
> 
> Let's add a space between the declaration of `cmdq` and `rmargs`.

Ok.

> 
> > +            dev,
> > +            1,
> > +            GFP_KERNEL | __GFP_ZERO,
> > +        )?;
> > +        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs)?)?;
> > +
> > +        dma_write!(
> > +            rmargs[0] = fw::GspArgumentsCached::new(
> > +                fw::MessageQueueInitArguments::new(&cmdq),
> > +                fw::GspSrInitArguments::new()
> > +            )
> > +        )?;
> >  
> >          Ok(try_pin_init!(Self {
> >              libos,
> >              loginit,
> >              logintr,
> >              logrm,
> > +            rmargs,
> >              cmdq,
> >          }))
> >      }
> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> > index 3f8cb7a35922..da074a2ed0d9 100644
> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> > @@ -6,7 +6,7 @@
> >  
> >  use kernel::alloc::flags::GFP_KERNEL;
> >  use kernel::device;
> > -use kernel::dma::CoherentAllocation;
> > +use kernel::dma::{CoherentAllocation, DmaAddress};
> >  use kernel::dma_write;
> >  use kernel::io::poll::read_poll_timeout;
> >  use kernel::prelude::*;
> > @@ -247,10 +247,25 @@ pub(crate) struct Cmdq {
> >      dev: ARef<device::Device>,
> >      seq: u32,
> >      gsp_mem: DmaGspMem,
> > -    pub _nr_ptes: u32,
> 
> We probably shouldn't have introduced this unused member in the first place.

Good point, it's a hangover from the implementations in previous versions.

> 
> >  }
> >  
> >  impl Cmdq {
> > +    /// Offset of the data after the PTEs.
> > +    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
> > +
> > +    /// Offset of command queue ring buffer.
> > +    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
> > +        + core::mem::offset_of!(Msgq, msgq)
> > +        - Self::POST_PTE_OFFSET;
> > +
> > +    /// Offset of message queue ring buffer.
> > +    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
> > +        + core::mem::offset_of!(Msgq, msgq)
> > +        - Self::POST_PTE_OFFSET;
> > +
> > +    /// Number of page table entries for the GSP shared region.
> > +    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> > +
> >      pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
> >          let gsp_mem = DmaGspMem::new(dev)?;
> >          let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> > @@ -260,7 +275,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
> >              dev: dev.into(),
> >              seq: 0,
> >              gsp_mem,
> > -            _nr_ptes: nr_ptes as u32,
> >          })
> >      }
> >  
> > @@ -490,4 +504,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
> >              .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
> >          result
> >      }
> > +
> > +    pub(crate) fn dma_handle(&self) -> DmaAddress {
> > +        self.gsp_mem.0.dma_handle()
> > +    }
> >  }
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index a2ce570ddfaf..70abda1c2af8 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -16,6 +16,7 @@
> >  
> >  use crate::firmware::gsp::GspFirmware;
> >  use crate::gpu::Chipset;
> > +use crate::gsp::cmdq::Cmdq;
> >  use crate::gsp::FbLayout;
> >  use crate::gsp::GSP_PAGE_SIZE;
> >  
> > @@ -483,3 +484,62 @@ unsafe impl AsBytes for GspMsgElement {}
> >  // SAFETY: This struct only contains integer types for which all bit patterns
> >  // are valid.
> >  unsafe impl FromBytes for GspMsgElement {}
> > +
> > +#[repr(transparent)]
> > +pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
> > +
> > +impl GspArgumentsCached {
> > +    pub(crate) fn new(
> > +        queue_arguments: MessageQueueInitArguments,
> > +        sr_arguments: GspSrInitArguments,
> > +    ) -> Self {
> > +        Self(bindings::GSP_ARGUMENTS_CACHED {
> > +            messageQueueInitArguments: queue_arguments.0,
> > +            srInitArguments: sr_arguments.0,
> > +            bDmemStack: 1,
> > +            ..Default::default()
> > +        })
> > +    }
> > +}
> > +
> > +impl From<GspArgumentsCached> for bindings::GSP_ARGUMENTS_CACHED {
> > +    fn from(value: GspArgumentsCached) -> Self {
> > +        value.0
> > +    }
> > +}
> 
> This `From` impl seems unneeded?

Indeed. I don't remember why I added it, must have been needed in an earlier
version. I'm suprised clippy doesn't complain.
