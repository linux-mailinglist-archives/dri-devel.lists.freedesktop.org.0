Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C3B943B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 06:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A442689023;
	Tue, 23 Sep 2025 04:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NaI7Zosx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A705E10E02E;
 Tue, 23 Sep 2025 04:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpiI5NZBYXmw7t0e2J5o5Qt95gEtVHEXnPHl1WWhZHP8Oa54sJE0rV0VM7IIZ18DzzlggAkSB+82aGv55fQLp4XaH4w99mQH6OGvlf/F9okc7l7Ej5pdOUAsdLFSgA4wA6jKfw4sdZIJbvLVZwpOX0QjzAHF6Jl3htNK0at36jBNIce5DFrl18WnV+s4MRMHtt67iV8jmZxnpZFiOxC0BjH/QrsuRMoJrHZ/jirGMGrVIzn0aMtkGbPN0FGNFAp17I2JBSwaMqTuDoZIONb1Y2Ht+gH/kKc/22LM4da2PcKw1CFJZY3PbOqSHDFDUx7wUjCLw2mEb+vulEKKgk2UzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwpDl0PrKeiWPsddZqCwvgaKkRDJ5lQ52uaSLzN6mLI=;
 b=XfY+wicVvNcIKsxS4OcuJSQbwBs7EM95QIEgFvrGYiX9bpIXZPFYSrIyYwijC+0um0tAZaIZcsZgx1sipqJFjmAM1+M4s99bnJDFWlyV8TFxaWmLp34cRTHc4a+hsHi/X5iqghFHMGn66tjQqeh8H3jwzP/tXWli15wUuq69gh5ml29ysSKhKaWfbTaeOGZvVR0MQgRaLg0UdY56r9sswMcWrXHmnYlGuKQnOUoKvTjYoNtjc3Ei7QLgAZMVqpAhxhTY8i3n6dxRteNbBNVvLCTRgb3bVKVlyUXR/xPcb9lr/8ISP4CuVcQGqTRJZ0CRYuguczqzpuuRT+T0bp+3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwpDl0PrKeiWPsddZqCwvgaKkRDJ5lQ52uaSLzN6mLI=;
 b=NaI7ZosxjqujDSAgcMUe6lUzp9ifdihczqD+hrU2lZWPkRZzFuD+zLdGvvacYZ+bRZM95dTV60Jer4pbf+EHST8WoUI854iCStqUMcx0AfKNfj7yikc5pTJ7K00z5tW0Nx8DhHV8ULuawKkXbxlLV8DM41htzKeVEt0yGmyzNQBEpu90DJEkxoiR+nHrPRUOZLDcYfDpFwsq0tZcEnbJr1v5esabPz/uG7o5lMI7LUewdU2+GydKHHESHVMI3AHv3Lm4q+ZwfFnezmzoOgHT1zzkQYlfiHcloD69+WdJUyB+rRSJCakkv5pqZT130DTsvmZRavV8eQKgajncGBdXtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 04:29:23 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 04:29:23 +0000
Date: Tue, 23 Sep 2025 14:29:16 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, acourbot@nvidia.com,
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
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
X-ClientProxiedBy: SY5P300CA0081.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:247::21) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: ed035c32-b391-429c-ae20-08ddfa59c542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IhkZD/Wv5cbjYUnyyKtzykXiBQA4D5knAb0Wk2tFAnXOTeHYMZ7rrU99laYu?=
 =?us-ascii?Q?iSbIU3Dua04Aqz36w3TsIMvPKv+MON/jpws4jIkYZtffDABMyFTD4ulKEDG6?=
 =?us-ascii?Q?LEQHok6NegMx52AcUCIG5uqjndZQcxxreDM4UNwDMIkKWWphZneQpMRAiycG?=
 =?us-ascii?Q?4jYfmbgYEK9bvztbVAbNocah2buePVNt0QesFIA9BH1wG+p2RScgSbHG+vPf?=
 =?us-ascii?Q?57ZO/zjzg2nwFBU+fePRJwrc7m9P96CgbuTrlvx5CRAbzNVWiwztF63G8Uqw?=
 =?us-ascii?Q?pB8UyRNePbDZxQH0t/Hg9w3feH+3JkPW1tvuK7AqHUnqfkYfcMIUrwmsrp27?=
 =?us-ascii?Q?8Mxt/QNc0ABjdj2gA9ZPsP7ji0V/d3AFWynKRNyQZ4kcw2fcnemAjX1n7smT?=
 =?us-ascii?Q?u8J2vTLlRrFj6z5i2mvp+Mdrp8PCp/NzJvI8Y8mNR/EiJps2IZ6UYUitHZ+/?=
 =?us-ascii?Q?Ss5RSEU6lhsm0TgsqKRvVOpzs3tUYhmAcl3fSaqkLu3Eoc+I1uwsmwvvROab?=
 =?us-ascii?Q?7UBolcuvF65HSv4yD50KEz0kLaMiyomV1FQtllVwF8i/DyUwRfsF323IBHiR?=
 =?us-ascii?Q?6IuHQCxXdIFt/ZK9UOc6bOSiyk/GQtziqCSvUSVmRGh7io+R8kQZA9WoQ3yT?=
 =?us-ascii?Q?g6aIOtwuuo+BksG7Hik9I2M58mBEssjyy7MeUNoM6Bg16joXcOisHBhjvKtC?=
 =?us-ascii?Q?g8Lf9o2n7LWnH2g/0VOztvBx/NgYCgy8k26FqDYvYJ4ZByCLZqabzupzbdut?=
 =?us-ascii?Q?o4Le+GkIfw7fITE4xdavRwNWadal4Y7pGK3/mOsyDCIApf1m+sE37AQC8WOR?=
 =?us-ascii?Q?bQwq7GEbeoEMeYnjEwUD+ST1BabLJ2HT/bwDoJ6X2Ncv5Cn1B4yNnv5b5VnV?=
 =?us-ascii?Q?HMr7WuK0fiNHc1QI2ypEf8CbTyG4Yk2Hl+fZOTTHA5BQkA3T4HuU/queTIYZ?=
 =?us-ascii?Q?+h1cgzL93f977aJmC02pRv7ziHpkZDmnfFl26uxrhSJsnOsQYWet3wt+fRHj?=
 =?us-ascii?Q?HJ9XfFf1PI8bi0JzhIEPZGSyz2rvMPSPdbESZdauywHrCDYbLd0bHdS/WGzL?=
 =?us-ascii?Q?YTBppcBJNyuVIByOiH8fVmgXLCU0z+Zv1lZpHu7jg6eNMEQEht7iRW33TPZl?=
 =?us-ascii?Q?1ohQrmVDifzwbD2NG17u4wlaAI+BxcfqruR5XuMuQ9QNjSHXMJwQigE00sRG?=
 =?us-ascii?Q?G0F1avCV9xUdVpOF+qD8yfgjhyezMmCLbyC9cTTjSNtYa45J7EYyhmRh+Nl7?=
 =?us-ascii?Q?cx/BZZuxX+kMoDmHsN2KhxlizV7wSOJ/NuLa0Rj7z+F81o9jFXmNmQMMlJeT?=
 =?us-ascii?Q?tW9czDOUU33JuYEA0UnG8Vv/mIRJizowkr+P6najoaYCKTKKWd+9X7m8WCnS?=
 =?us-ascii?Q?mSooICDWaxTzMWgKcfngB2MMJe1YyHQ9Tgixt9RhQHpincnwK1HJ+K+xpRjQ?=
 =?us-ascii?Q?hrQBajsIoAE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIvI8QDeKZX3Ga6chRt8U7WisQJE/QM0d8WUHqlt++biJhtYX6b6RE6dNky9?=
 =?us-ascii?Q?/jSA4mEX2VCsekFvdjmM6g+2s8X6MQV1j/4UUZG+4Ah60yVErgKdksFzGe8D?=
 =?us-ascii?Q?TfRShBwa7moK7RsjRYraWx3ME0bRXPnajuN2mFJHXucoaY6ptQ4+kJK9d+8G?=
 =?us-ascii?Q?/mdqoglKqYSxJf9gIT5hnGcFgs8dD9lwHeETPVCt02LTNDS5e+h6TPPLOhTu?=
 =?us-ascii?Q?sYvzz132yW3paNmX6Jmy5DawxWOm6IiNKcYpgHpvDAirXyD1ZZlo0tcLn6Y8?=
 =?us-ascii?Q?GTPNR5RViNsrwccx15uf69EkcebpBZwhi/xg2Q91g42fv2E7ba/NJgctb2Io?=
 =?us-ascii?Q?Mxs/MkAGJr6rxf5pgP6mqDoBc63grDKu5mckq2DXxeXIYFej9jmmP+3JLMQn?=
 =?us-ascii?Q?Dk44XHl9YfiyEgPJ44qd3FZBXnybId06S1tTS0QVrSpjcMpj5yDiPOcuKWKN?=
 =?us-ascii?Q?Gwdsacp4Ga77SdtkwR91opOBWHt3opy3266WploPZIQMshbwZDOTdjYY02Zt?=
 =?us-ascii?Q?iKdNvVUkBdejkKmbv0qb1fz0MbWarKuvwkwr/YEaV1FFWwNg6dsaHICIMay2?=
 =?us-ascii?Q?VYu7tgF1PIRlr46Iwt32haF9Lc/5sTLW7FWLw+zYUAXp35OVh5JId4fHUzSJ?=
 =?us-ascii?Q?W+xofaiv5gSvCoetmOScomr+/FVszibPsE0TZCqcN5qHpZ2o469qOkh4hYLT?=
 =?us-ascii?Q?qhkEdpWFLNrPq8rD0ZccNL/Vgsl1/q2jRFfCkmlrIv4QJtDnJTIOmcdYnJiS?=
 =?us-ascii?Q?TyjdYIU0vAcks4LWdtQCcDwdVJ1JaOJp/KIKEkVpiIyh7miYSQ0vDoauZN8s?=
 =?us-ascii?Q?//9Pw+Y2CIW2Wohze5VCiIRFs7FiS3trGpayTVYttpB6zxC2qUL3A23Dy6qT?=
 =?us-ascii?Q?R2K+vQB7+9Gq7Ixhm+SDKoHyOxniQZBEfWPqk9PbskAvfxikFzTFvoD8Sinw?=
 =?us-ascii?Q?Ex3I8ZUj7R7HQFwor3UACcjzeJixsiapzPvpKmGP8xZHfKg5Xmf37hbILrSY?=
 =?us-ascii?Q?S9exFK33FJGSePgIutM9E0g2EikxtbIkZ2s2l3hgL+yH9CBqhkeFL/LEFfkD?=
 =?us-ascii?Q?OP0OxrBJ7D9MkcgTGfxOflxIZPS+buVROUzFW0dmDW7XAWeQrGqCo3YGFNmP?=
 =?us-ascii?Q?qAzIyHI4xtrnPvWQfKoRk3bCcQi6zccY8RF236YeRIFJepDQzFdpSJPiP4lp?=
 =?us-ascii?Q?Z5Fbz9CyOhr52enxNkAM0Pe8rKB6El7d/W4WoJElMBGUzDRto7lohRVtZIdw?=
 =?us-ascii?Q?5HQTVIG1drm3Rmoso/JjPT2WnTGAXlbXrhp05XBnMfUVzwOxdtZhTMYTZHRq?=
 =?us-ascii?Q?Un4i9Jazc0pE+6mp7YyVCHgiva5I9BQVvP1HIHNt+ykBtCJyuHqeHPtFz1eF?=
 =?us-ascii?Q?oGz/CdNlnQJRx8Z1cWntH673s7bejUyolhq9UJdo0mX9HC5OT0J6HAgO5kfY?=
 =?us-ascii?Q?Hk8XiOfA4BNKha3lf5O4MpP/Y7f+uR+2Li1pCIrdOSrM6d6/VI4TZKvQ3KCY?=
 =?us-ascii?Q?mY6+XBuJnuntrM829oe5WnAcm1V1+McSgMNXZNMMOy/1Wk4mtAhWXz8wTbR/?=
 =?us-ascii?Q?F26LcChYs9v3KF16fVPEuWAX8PVZMIul+bEmjbLV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed035c32-b391-429c-ae20-08ddfa59c542
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:29:22.9038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYCHqoTGI02sLWHiTnIFfcl4fl5J72yPHYGB0FZdL3sGgWr7XaNLI0oyQgj+y5zIvPKsBFXCLMa6quKuuNF7jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510
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

On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
> > On 9/22/25 1:30 PM, Alistair Popple wrote:
> >> +        // SAFETY: No DMA allocations have been made yet
> > 
> > It's not really about DMA allocations that have been made previously, there is
> > no unsafe behavior in that.
> > 
> > It's about the method must not be called concurrently with any DMA allocation or
> > mapping primitives.
> > 
> > Can you please adjust the comment correspondingly?

Sure.

> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> > 
> > As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
> > it will change for future chips, but maybe we should move this to gpu::Spec to
> 
> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
> patches, I'll use a HAL to select the value.
> 
> > be safe.
> > 
> > At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
> > please go for it. :)

Well it's certainly not the VA_SPACE width ... that's a different address space :-)

I thought from the context that the magic number was pretty obviously the
supported DMA address width in bits, especially given the extra decoration
of the DmaMask type. Certainly that's been the accepted practice for the rest
of the kernel where pretty much all drivers just use something of the form
dma_set_mask(drm_dev->dev, DMA_BIT_MASK(44)) or whatever DMA address widths
they support.

> GPU_DMA_BIT_WIDTH, for now?

Works for me.

> thanks,
> -- 
> John Hubbard
> 
