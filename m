Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C416EBA8513
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0210E3B0;
	Mon, 29 Sep 2025 07:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wdhss4Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771F310E3AD;
 Mon, 29 Sep 2025 07:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZEmIGjdQ3tN7ayZXolJ+C7+2KCS3pKK6+UV26qiUfMO9p6J7bxLJywvzlHTioFU8YqEywjjuSlERmVrMIR/z7kLP1mebJWkzlidIHPg1mabC0gF01xo2VqWWRm/diXKLtedVGzdEztsNPcU0ZufS8dAZ/eoOINz8pPRPB6qLdhZLNwdoetIbjMihQ8X7hjGto477B9c75mEUeQ9o+SNDyhdasuDqaAQ+l7vCqAM5J3q4ksVM8CDzRDOMVMwkueZC/MjMMbxOSHIu4omfptaBgUScQAZcIKMLbGQ2Kbws7cyHFYnqz8l7z0j8s3SvLKYgp0XkoqdH01w0jjoH0o8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EiVDl5mQGbg8Hby5QRoGybWt8Kf7ewoM4t1hI9HTm4=;
 b=vHtv9HexagayA9DEk5LdraQiV/xvhIdgJL5KXd1/zpP6rgUIhNQYGIyS8+wYwi23PC9Dax3Xrqu22Hk7SSuR3J7guIz+B/okwoxt0yzCHAOLUZaIELbolp0sc+NWFX9eBmY+HIFysSYmW1yjBoirmq9Xc7Ra64IVrkHqCkvZPG5ZCWIozRHQmE+EHpFWJJXcWxA/JRTchXmWuCOmtZtue42nXEQJVmtC9+ffmMThohrH6uyixgp8Jy/zkr6+IxaTBKCrKr3nNwhRmUluNLRB+8gi6/B+753DzAbvUtHoIsZNP6P4PlSnqF0xg2aW9IIywEFIcb8hunhngEnImXbXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EiVDl5mQGbg8Hby5QRoGybWt8Kf7ewoM4t1hI9HTm4=;
 b=Wdhss4McBn5/cJog9vFUikmVADUMxnBXSrMs27phtVwxPWFvGNFhKNP8+GURv3+Lb780eQZtYEeK5Fw/HhsakY9+Wnnw6wsIdRKyxkNyJIIZ4o49xsE27K2jQjfrqx4tlLYSid/0vcCpjyR/AxmKdD01iyhj/u0+JZjdamQ4PwD88dkt+Xv2RusyFxYYERhBhhLeKj6i6c8qK1IxVgLBEBGdxbWBWGKTwKlkrHzu4+SOwopm0884X26rL8L1Y0q5RiOE2GvqBzRHkGuowE/cp4kIvWW/IQQWKrfHs92gbiEksRunhZzXz/eHjkFctxsOrhZ14W2xT3Tmv9nl/RRwZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 07:49:38 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:49:38 +0000
Date: Mon, 29 Sep 2025 17:49:33 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Subject: Re: [PATCH v2 06/10] gpu: nova-core: gsp: Create rmargs
Message-ID: <7o6s6pywcontekmrsplcehxvpxu3eyeesbaulen7ppz6t34c6b@xkdfoveyiwam>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-7-apopple@nvidia.com>
 <DD2JYDPBOKA8.2QCK0P7CR1T3V@nvidia.com>
 <q2ehvle73bvop6muga44cebwzgpm2g5tghf2txq2orvgsaryh2@hfmxjcymhsrl>
 <DD53NQP11F11.1JAJXDG2NQRU7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD53NQP11F11.1JAJXDG2NQRU7@kernel.org>
X-ClientProxiedBy: SYCPR01CA0045.ausprd01.prod.outlook.com
 (2603:10c6:10:e::33) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa38641-daa0-40a4-c155-08ddff2cbd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5LLyUPEbf9UkWa6XxCt4Dy8qN9zvkNOFj4653ffw5XZ2aJ8uHpQp6ZPDRWip?=
 =?us-ascii?Q?VWRc4SczciI9LCcDVGIPUIxSBv5PgMRQHETmChmUWefUbdafFE6MECYe/Zxx?=
 =?us-ascii?Q?AQ/hOfb4ygnR30h5P3c/ychg/nI4EXTveyEMEVaHhl1C3fw1V/XmmLA2LSIm?=
 =?us-ascii?Q?Fdx8DKYW1xW28KJr+dzx5kc3sTcPVqL4rUvFGNwhAv3FbB2hE+bvAp5CMQZI?=
 =?us-ascii?Q?95X898ffH5mGOTk95ihbPTduqyYFvY03C/wDauiV14OvJBzKEcWHtvldld2+?=
 =?us-ascii?Q?MxbbtO6Slf6JmsHioNYy6269FUlTATzf6w5M48qxK5DruOKqAjivqPQTFxrj?=
 =?us-ascii?Q?bTXkH+3KHfcaZsr/ETFlhvk1FnrZg2rpAVu2PuLSlqpHD60AtxCt5DDT1Qxt?=
 =?us-ascii?Q?gZ5rrAhDfeccB/bndXftIXjyW53b0M2PGTrmJM1Do8COQsj4MeoyS/jqFqn2?=
 =?us-ascii?Q?WMGOlrKgkvK1X0bIYyh5ZvC2NqICs1LlA93jF7srqv6/Y0dizXubBlwyDKJ5?=
 =?us-ascii?Q?3Vk+xNF9Mxajv2DK41rX5cmY+v/VY9+OTmqu6JfL7WVcsCzssk6vt1ANt0tW?=
 =?us-ascii?Q?qQXVg4DD9kdj7rzSMrXmWsY43wy9aR1ojwaS/ZrvKMTEgPWYMPDSTAFW6vOd?=
 =?us-ascii?Q?E5ZjKuY9inWjjYWFhErx8hmua5z13AeKH0wOVudcFRDQUwUFU+NUfczZpzWR?=
 =?us-ascii?Q?bqylry5xbHeyq4Ovh3IqjEF1fRrAQQoyTRCP5rQ3VTek/eMVsRmvwpI/XOkt?=
 =?us-ascii?Q?w/9j1OkhwEA/lC96/d+1mPKRvR5c49Y85OyDbgBN05qadNizyvTaR3NFhltl?=
 =?us-ascii?Q?lJJ/rOJcO0KGW+iMnnYgmmICv+IbeVKRdYA24c8+ICfzb+Uk8coGnOy6W+cr?=
 =?us-ascii?Q?h+JLvC9og2JPpg5P0qeVi+DsN6bSxlhuZj5uB+NjkH6gCCkyk/hb86KHXAfw?=
 =?us-ascii?Q?juYDfwx2h4GmXIdW6S9yp4U9iI+PVy4YBvDRxd+Tzuuq0xiddZcC/zxhKxSJ?=
 =?us-ascii?Q?zAO1i2mDLoPQ3xkETCIqzAhSpatXdM1ZOEmr0YlkuC4kCuyOyow+murb5QcI?=
 =?us-ascii?Q?lEFf4FtpDj2kJf7yt6zTdzD4zIzVSzMmj7ff4xloacWsBGyRiCaL/XQ0TpFX?=
 =?us-ascii?Q?3ESn7Wqcf/lmmm0YIc4sh2CmO3w0bnysLD7y2gv/476GzyEvx0N7PeGtZ+fY?=
 =?us-ascii?Q?FRWh072Txuo/l7LEUFTvNhTL4bXWtoTzqVf7kDnv70TlsVwCQYY1K+ZmnJ++?=
 =?us-ascii?Q?whFw60c5UxNv6X1V4t20z+P1VXxPtWL+Caf0xwBodfonxNYM0hTX63xnzaLM?=
 =?us-ascii?Q?v6Pd7rteVHGX2elgERKEQDCmj/N0Pcl3hVRHRK1v0IhRBUAva0Kr5Wm0mENl?=
 =?us-ascii?Q?LN2Ds+TJj5T7lyjJwd6wWAvCITuiHGeV4jvt1WkRclSD9KhjvH8NRhbAhk0A?=
 =?us-ascii?Q?eUSRUAMFFKvD5Ud0E22ZsFKT3BE59Fj/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iV//giyosozG8aVvgOMmrDcwDcP7jfgJqRtMU3Ni6fqToTlbuYLTgbcDx0Vc?=
 =?us-ascii?Q?+ks2PSjRjrTa6rZYACheYxWVNwVrHjEy5WcCSqnrhyUyqaByPTXzEJX8r9IQ?=
 =?us-ascii?Q?wvljzKs3jBWQbtYWK9gMcr8q2+ZQvT8LtlIuoD56Ht//ExvG91TFuQO4sXFx?=
 =?us-ascii?Q?CMC+nPktQpqQlmVII5MT1l63rOE7VpbNxzs9hOW9K0MEmIGr1OcSy9jEe+va?=
 =?us-ascii?Q?G4a0tTdOJmoLUsc4R4vCWsyfb8kuX56oKj0KXDf8y1o1K5Bf7zoJmpOLR09r?=
 =?us-ascii?Q?kuosgUaqszOg9IrgIZ6LJ2TsIh8O9upPRMoV4R8F8/oDg6Qlp9E/hPammwEk?=
 =?us-ascii?Q?PHEm6xofE90IU4uwj2Qm6rnqIqenvuBP7g0Sg0oL+Kq+aOTfOaXDqQwkezxt?=
 =?us-ascii?Q?r03mqENdxCpjaidUu5mPO1kVjcsBMsPbAcLa9jqNZF9sX014c+DuSq6xO3OC?=
 =?us-ascii?Q?oChMLKcuvx7sPwATTa9wIt6XgXCOY2Cp2jnLClM4WUQ/diQHOaJiFd39y7+K?=
 =?us-ascii?Q?3nSlvzt9ZWg7K/XhLPGRHA7BG9L/DDvj+7UlNY0lVPJe8SF+R5VuJuEYMOF0?=
 =?us-ascii?Q?DAO5VEqvOYzcJyWUv1y7D+MD8S4eq/C3MviKNbDlkWkuz4J9ZguPGQu+lRro?=
 =?us-ascii?Q?fCIdw+qJr6lF0wvtrCNz5riSBi63E1xsD9/sTqCtPBxcSE5aE9RoPO/ENaYC?=
 =?us-ascii?Q?o2pd7NwdPryVwL+YupwQCMIcn7vzCrUcmRWjRKm758xgl7YVGGoiqp+FxDfC?=
 =?us-ascii?Q?rdMqovtXbfbJNqgnh75rA4hK9Ej7Fryab6llyJuM7y5FOHMCKPpwuCB+XJTF?=
 =?us-ascii?Q?Dm+SufB6eF1pwbzN64H2mSmjQutqae82gVB2QSkUYZUBZgU6VNvHOelUlUW7?=
 =?us-ascii?Q?Mk0QyEaPQDrj6A64fRy2fKyX2CoSgq5L/GzuzdCF+8KZeeLU6AgX1RyMHXqd?=
 =?us-ascii?Q?OahKNG3gWlp50Ef30vrzLk3eLZmBp/4VX11wM8Jo07QtXpM+c4FHitsWmx2K?=
 =?us-ascii?Q?ALGAK/aU+5dQlSVd10LduRqF/Us5kALJmfxVr5IU3p7wX0Eid46ZM6nldZ2R?=
 =?us-ascii?Q?YcfgNLl9N2ETJdp0XuVaiX443+qjsqt/gYkWdwU+PGdV53CYrS5d9fhPsQYE?=
 =?us-ascii?Q?mrO0NAkvjkgQC8pZfJ5oa/Adg2ItBEOtng0J2lXMoFk/+7aBHzsrXZU2L1zW?=
 =?us-ascii?Q?RFh6pfAZyxwUjTJXn3cZYMOHJz14U/xzER104pcHofuZwAvyqcuhJqX7tH+1?=
 =?us-ascii?Q?Rd5SsAIFjzh49h4dESlQzVm9MQGTc7ZkU0nUsIDxiIki6lravCvyfLRhjogN?=
 =?us-ascii?Q?IFxiVV43HNiM4fF8pMO+xXmPGDZ9rzXKMay756Px8dYhMMVq9WJHGQrbTeUp?=
 =?us-ascii?Q?8TeM+luvpb8tT8D5hspXAG4JNEgTn7XKNf6L/5wl6uPXeOzYUHzaEl6RcziR?=
 =?us-ascii?Q?4k5vDyp2DbLc1htK8letV14EeYXaN5MYlVmEafv26nmDGZ7HAR3hP62Xetuv?=
 =?us-ascii?Q?0rKjfWHivRv3j2C4gfPLyR9leb+FVKpBboHw+QwUcI40XY8VrECPpdvLjRmd?=
 =?us-ascii?Q?kWmocOUHaOM8V6VXYb2IbF1/Ox9d73uc4gMZLplR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa38641-daa0-40a4-c155-08ddff2cbd91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:49:38.2360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM7o9MCPGztbTmquuqFuvyGsSFaRxIsaZrpMJWMi8ie1V2EunceD0Il6kvXbUKLNT5SERJ2OfmFuSC2oyJXYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
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

On 2025-09-29 at 17:18 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On Mon Sep 29, 2025 at 8:36 AM CEST, Alistair Popple wrote:
> > On 2025-09-26 at 17:27 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> >> On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> >> > @@ -33,6 +36,7 @@ pub(crate) struct Gsp {
> >> >      pub logintr: CoherentAllocation<u8>,
> >> >      pub logrm: CoherentAllocation<u8>,
> >> >      pub cmdq: GspCmdq,
> >> > +    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
> >> >  }
> >> >  
> >> >  /// Creates a self-mapping page table for `obj` at its beginning.
> >> > @@ -90,12 +94,35 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
> >> >  
> >> >          // Creates its own PTE array
> >> >          let cmdq = GspCmdq::new(dev)?;
> >> > +        let rmargs =
> >> > +            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "RMARGS", 1, &mut libos, 3)?;
> >> > +        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offset) = cmdq.get_cmdq_offsets();
> >> > +
> >> > +        dma_write!(
> >> > +            rmargs[0].messageQueueInitArguments = MESSAGE_QUEUE_INIT_ARGUMENTS {
> >> > +                sharedMemPhysAddr: shared_mem_phys_addr,
> >> > +                pageTableEntryCount: cmdq.nr_ptes,
> >> > +                cmdQueueOffset: cmd_queue_offset,
> >> > +                statQueueOffset: stat_queue_offset,
> >> > +                ..Default::default()
> >> > +            }
> >> > +        )?;
> >> > +        dma_write!(
> >> > +            rmargs[0].srInitArguments = GSP_SR_INIT_ARGUMENTS {
> >> > +                oldLevel: 0,
> >> > +                flags: 0,
> >> > +                bInPMTransition: 0,
> >> > +                ..Default::default()
> >> > +            }
> >> > +        )?;
> >> > +        dma_write!(rmargs[0].bDmemStack = 1)?;
> >> 
> >> Wrapping our bindings is going to help clean up this code as well.
> >> 
> >> First, types named in CAPITALS_SNAKE_CASE are not idiomatic Rust and
> >> look like constants. And it's not even like the bindings types are
> >> consistently named that way, since we also have e.g. `GspFwWprMeta` - so
> >> let's give them a proper public name and bring some consistency at the
> >> same time.
> >
> > I think there are two aspects to the bindings - one which was addressed in
> > the comments for patch 5 is how to abstract them. The other is that the way we
> > currently generate them results in some  ugly name.
> >
> > Given we want to generate these from our internal IDL eventually I would favour
> > fixing this naming ugliness by touching up the currently generated bindings. So
> > maybe I will do that for the next revision.
> 
> It's not about fixing the name of the generated C bindings, it's about not
> leaking firmware specific structures into core code of the driver.

I don't disagree. Please see my comments on patch 5, which deals more with the
type of abstraction we want to provide.

> Please hide it in an abstraction that can deal with differences between firmware
> version internally; see also [1].
> 
> [1] https://lore.kernel.org/all/DCUAYNNP97QI.1VOX5XUS9KP7K@kernel.org/
> 
> >> This will make all the fields from `GSP_ARGUMENTS_CACHED` invisible to
> >> this module as they should be, so the wrapping `GspArgumentsCached` type
> >> should then have a constructor that receives a referene to the command
> >> queue and takes the information is needs from it, similarly to
> >> `GspFwWprMeta`. This will reduce the 3 `dma_write!` into a single one.
> >> 
> >> Then we should remove `get_cmdq_offsets`, which is super confusing. I am
> >> also not fond of `cmdq.nr_ptes`. More on them below.
> >
> > I will admit that was a bit of a hack.
> >
> >> >  
> >> >          Ok(try_pin_init!(Self {
> >> >              libos,
> >> >              loginit,
> >> >              logintr,
> >> >              logrm,
> >> > +            rmargs,
> >> >              cmdq,
> >> >          }))
> >> >      }
> >> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> >> > index a9ba1a4c73d8..9170ccf4a064 100644
> >> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> >> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> >> > @@ -99,7 +99,6 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> >> >          Ok(Self(gsp_mem))
> >> >      }
> >> >  
> >> > -    #[expect(unused)]
> >> >      fn dma_handle(&self) -> DmaAddress {
> >> >          self.0.dma_handle()
> >> >      }
> >> > @@ -218,7 +217,7 @@ pub(crate) struct GspCmdq {
> >> >      dev: ARef<device::Device>,
> >> >      seq: u32,
> >> >      gsp_mem: DmaGspMem,
> >> > -    pub _nr_ptes: u32,
> >> > +    pub nr_ptes: u32,
> >> >  }
> >> >  
> >> >  impl GspCmdq {
> >> > @@ -231,7 +230,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
> >> >              dev: dev.into(),
> >> >              seq: 0,
> >> >              gsp_mem,
> >> > -            _nr_ptes: nr_ptes as u32,
> >> > +            nr_ptes: nr_ptes as u32,
> >> >          })
> >> >      }
> >> >  
> >> > @@ -382,6 +381,15 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
> >> >              .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAGE_SIZE as u32));
> >> >          result
> >> >      }
> >> > +
> >> > +    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
> >> > +        (
> >> > +            self.gsp_mem.dma_handle(),
> >> > +            core::mem::offset_of!(Msgq, msgq) as u64,
> >> > +            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_of!(GspMem, cpuq)
> >> > +                + core::mem::offset_of!(Msgq, msgq)) as u64,
> >> > +        )
> >> > +    }
> >> 
> >> So this thing returns 3 u64s, one of which is actually a DMA handle,
> >> while the two others are technically constants. The only thing that
> >> needs to be inferred at runtime is the DMA handle - all the rest is
> >> static.
> >
> > Thanks! That is a useful observation for cleaning these up.
> 
> Please also make sure to use the DmaAddress type instead of a raw u64 for DMA
> addresses.
> 
> >> So we can make the two last returned values associated constants of
> >> `GspCmdq`:
> >> 
> >>   impl GspCmdq {
> >>       /// Offset of the data after the PTEs.
> >>       const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
> >> 
> >>       /// Offset of command queue ring buffer.
> >>       pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
> >>           + core::mem::offset_of!(Msgq, msgq)
> >>           - Self::POST_PTE_OFFSET;
> >> 
> >>       /// Offset of message queue ring buffer.
> >>       pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
> >>           + core::mem::offset_of!(Msgq, msgq)
> >>           - Self::POST_PTE_OFFSET;
> >> 
> >> `GspArgumentsCached::new` can then import `GspCmdq` and use these to
> >> initialize its corresponding members.
> >> 
> >> Remains `nr_ptes`. It was introduced in the previous patch as follows:
> >> 
> >>     let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> >> 
> >> Which turns out to also be a constant! So let's add it next to the others:
> >> 
> >> impl GspCmdq {
> >>     ...
> >>     /// Number of page table entries for the GSP shared region.
> >>     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> >> 
> >> And you can remove `GspCmdq::nr_ptes` altogether.
> >> 
> >> With this, `GspArgumentsCached::new` can take a reference to the
> >> `GspCmdq` to initialize from, grab its DMA handle, and initialize
> >> everything else using the constants we defined above. We remove a bunch
> >> of inconsistently-named imports from `gsp.rs`, and replace
> >> firmware-dependent incantations to initialize our GSP arguments with a
> >> single constructor call that tells exactly what it does in a single
> >> line.
> >
> > So this would also live in `fw.rs`? What I'm really concerned about is that if
> > we're not allowed access the C bindings outside of `fw.rs` then everything ends
> > up in `fw.rs`, and worse still `fw.rs` basically ends up importing everything as
> > well, tightly coupling everything into one big blob.
> 
> You can (and probably should) extend the module structure, i.e. add a
> sub-directory ./gsp/fw/ and structure things accordingly.

This is what I thought the gsp directory was for, providing abstractions for the
Gsp. IMHO another layer of abstraction below this seems unnecessary, although
this is discussed in a bit more detail at the end of my comments on patch 5.
