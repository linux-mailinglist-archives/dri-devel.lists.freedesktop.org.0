Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBABAEF53
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 03:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22410E1DB;
	Wed,  1 Oct 2025 01:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H557vxr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013019.outbound.protection.outlook.com
 [40.107.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2C10E1DB;
 Wed,  1 Oct 2025 01:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwpjkmLUC4fIWvxOEc4WyfZcxZX33GehMsTCoWMDbB39CkkAAWoVunbyFk14QBkHE9zrZMXPYV/OHNvsWYiKjdPjwOdlKwPjBAxtYGDKIlFWwccdzB5/kZQgK6b15UBQjwmPL0Y3jiO7GPo+I04TSStuFMrnfV+xtd7h0C2RVgHzEb3MhZOZBGa8ABU4EA3kjXJwNLkphHXU17/NPMHRNZcSktv30n8xsKp1QlzIiVZ8nKpc+i7cGQVFAkRt3GHe1xT+d0IWC5xwZ6NIQ44J1OcGPj/jrYIwk2Tkdjhr98m1k+3EA/35MZZZBfjS2GS5mq/U+xP75MgYvuXi5kDwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RqOtn6lt59NMo1/jgg8gh1Mn8lsbMfP4X+QzLITDqY=;
 b=PCf7SP27ZHURZ3FShtm0qpaD0AHD+f14iU4faZR8CSOyRpL+r//13vrYWEM3WYqXGX7ml7ZbC1OLQIp7nS8uaSOqLoGpUd0F3socsoUu21LyH6es6QL57Xeay/Spjdl4shU9/8cVjHbpaSYX3HFDNw7BWtHk8pUEgddDtnFXFS/EnWs8dtKDZJnzdhg7h2u9N+VSv9s0qEiLZ2o2fa8UyOYAsAsNCmWta2iQmqthyd/xm6ArmzN6LlaZpy0hJjSBxavXz05DPzIs03brPX6ZzvO4jnQugy3lThnlC3dtdL4ckccc73kG0RMeiT52Hd5eKZ6I7mpnZlstrqnFT4Nhog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RqOtn6lt59NMo1/jgg8gh1Mn8lsbMfP4X+QzLITDqY=;
 b=H557vxr7kEOBygijsU6HKBYgMTLIGeByR5brQF1++Z/TV5gX9dJcEXfptUaTozXAAVew+ro6N4EteAjtBb2ZxazkkiGmY9+KLdHg/r5KSQyThwmxFMhCkqL4afbaMi0M8cqnF40MBW/X1dboO0VS/vZA5ofXn5mYuRW0+nU3BQXkCvUV/vvlBJvK9wry9qIpNAN0ZZ78YeDD+n6t1jVNYE7BEG3BvUqV1CRwzAxd5xrqhQeqLYObDWK4IRmDZ94DXowsemHz7PCok5upVy7HmVhPSuCh+OTlcjKI+55EGKvPz6IeZqtHw0wWrv4Zo7u4hYA0g2TH7veQmh/QeTsn1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Wed, 1 Oct 2025 01:31:55 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 01:31:55 +0000
Date: Wed, 1 Oct 2025 11:31:49 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
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
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <rborz4q33bfvcd53jpcf7qunbzxtkhdioptylsph4ykwwelev2@r5kpvnsi3tbr>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
 <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
 <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
 <DD53EE5HJUZY.2EMREPXQ9P090@kernel.org>
 <e2twlxdothcm4vbg3vytxppdpjdocx2l54mfnvhn7dbdncbxhx@ut4kpu7qwwe7>
 <DD5AOYADIBSX.O3CFPGMX9M9J@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD5AOYADIBSX.O3CFPGMX9M9J@kernel.org>
X-ClientProxiedBy: SY5P282CA0127.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:209::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 82382214-f83f-422a-5345-08de008a4e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0J+DQoz5tsUnKMmj+weyHmopcC2dATdc++rGUMjDIx6pZEu2jes0XDG3u0FV?=
 =?us-ascii?Q?lrVUzy62pn28qiaUfvAf3VqCpPG5HQ0Q2rkVkjydPNGNsUI1i3B0+b0pZ00n?=
 =?us-ascii?Q?gYn9ucSrrzOrWfexjh7QkHllczded6MuC53ttqTc5AHjmD21kAFi1FauW3Vb?=
 =?us-ascii?Q?ZQBefGwzLZQ+y38sT2rTnCDHShcFZaLFlV5gdNAqJ7svZenYIAfGwqYSrj+/?=
 =?us-ascii?Q?NYm5vrEjiebibCfj9Pa/c4XRrHGIFnyZEDDOj93TdEq+pe+8/sNquEo1rGJA?=
 =?us-ascii?Q?aLocICI+ijFe9rI5wI9c6zn1f0Y4zdMDIGMR25Pml4ygFHKriOVINqq7Rq3L?=
 =?us-ascii?Q?AmCsVsmVFC9GaBU0EWRhlKJISNXe1JOLI1fAHLwCjifKIrqKTdB235wA/M5i?=
 =?us-ascii?Q?50eLxOMERIlz4f0kZ+YWFXCGkXnmAiO7yRMu85RX+ESplP9usqv83tp3diHA?=
 =?us-ascii?Q?a9pAYx/wuWuJ15l7PIU/vK49DqoAE4BIg1T+kqbtctKvc/9nxh8WDf8b6FXD?=
 =?us-ascii?Q?1PuhwxGWk3e0VVK41ObYQTeaJg17FkcQ8klMfdA9QynATcli0+dVxKddocWT?=
 =?us-ascii?Q?d0GW/7pY3iUUK16N9/K1wP1Afdk6dkZd3X8WH43LwY0tYcBSgBJ/i2CJOG4v?=
 =?us-ascii?Q?pzvTdEoJc47Ad0cpU7x+2AB6IxgDnOSI81x258E2+CarwWssh/iV2DB508cR?=
 =?us-ascii?Q?o5LeLaUrbLUIqvKSyeCRPsEk6uLINijqSMt5dm9n3BNdb3Z/iN7GMqmnY/M9?=
 =?us-ascii?Q?fKRQzmJii67edzmTT4GYBAy9frO8SnrpqEvcKA/Czfx+eosr4slzog4JURyY?=
 =?us-ascii?Q?AYsDBMTjnJA8PMyQJVafSTmKuKW39BAkiACbYqEiJDgnx3gysv3oajYnNefD?=
 =?us-ascii?Q?0kuA5hMk1vEj78z6uW4YP28gTJ2dsP2Owga5mgz6LtYnE88/g3ZvKG59Kicq?=
 =?us-ascii?Q?B1+ha76j2V5UqHq9DhevM5xZLeuVz7x41vGkyYk8wdetkSpKr4QF7K4BZG6F?=
 =?us-ascii?Q?EHt6xXmukjPc0/ikeC/g1zuJjiY0eQr0Xu5h7nldNRhAbgd941KG0RQer1Jf?=
 =?us-ascii?Q?F9/o3Jm40jJR56xSu9ciu9niHwqWZEdudp1lWv7zGqfkL4Nyj8mwCNRNE99L?=
 =?us-ascii?Q?rqDtoIBzKRbIlDGs8Rzl0exu4Ujx+8VR8brbLF3u3Cu7WLbZuZiP9xZoXwt9?=
 =?us-ascii?Q?sACDoXqpL6TVAwtWoJhQCOASbAviv7BJY7ahvhB80G4kHA58dss8Arr8gslo?=
 =?us-ascii?Q?q0O6wfZZU/owHVN+8nl+J6d59eonsarxr12mBlr6FbZ9iVtVk3f+Cv9BurVf?=
 =?us-ascii?Q?o/Q3zhyaCKykNW+lMedlPX6syDOXS9pfwF+3kLr1eBa86LT5ti7+E559Wj8p?=
 =?us-ascii?Q?6RG6TO7aP4ERS+MlaJdCZGIkrTPYS1apU1hWFb6vVXQttfixtbJh8Q5FI+iq?=
 =?us-ascii?Q?cj0169Ndf8x2y9HoWd507X17ggkTC40e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SsvznzPDL8RnFb/pmaTxCYpbimvHnvH4fsQXEQqn6af+BLgT86MJf0GhBqRa?=
 =?us-ascii?Q?upwRgSU8p2GMv7+ZePsoBwPmdppjFMaQYh9bbfFMWzInEW5R7dgo0Qvp2hL6?=
 =?us-ascii?Q?FdjljJUYGm5aLnMPFElc6RzqkEzX5o504onYAMpIgKUuXc2+rO8B82+9by2x?=
 =?us-ascii?Q?xIaCebnHLOYjJkL3++rKLtMhGKL4DR5RNMARWqxiEoCRm+heWwNCd5KBgiGe?=
 =?us-ascii?Q?0yt+qpY/y+1v4LOGsFVRdmkvpv6MXtRcwRjhzdedaHsBrepJuFaxmt68xpVM?=
 =?us-ascii?Q?DNdBtq0sMGq5CfSen6wpPlifI6suS8S5WSWs8PkNulW9YhfhGDXK8GljkG6k?=
 =?us-ascii?Q?9CSZ5nnzkqVNYwrCikYxfRf5ICSOFJYrAQ8nqfR1Z+KUy900KvTVmBoWd84/?=
 =?us-ascii?Q?XnhVhkP8ZZlh67uFJH/HzoxqiI+rNCvs2t0ii2R+ke4BkgIqYy/Ufs72wrYF?=
 =?us-ascii?Q?KENRc0RcAwuD7u4N+U5VeHWIIzpHOa3DWADa4Tk80yJKFM7LOFtpbDdu6sJL?=
 =?us-ascii?Q?pJgk8CUP0DfrBXxfokT5uvm9idbBP8GzooUP5LxauMxZK+2njsfzI/uGQIu1?=
 =?us-ascii?Q?FXv7u/vlcwiGOgdEqilGggRsDvYNlc4vrJOJkHKzrOvloTN6x3X6EVHDegnz?=
 =?us-ascii?Q?8NdKNnbOSTDevDl/GfJSAtEWxxR22zC+ftfdhtcGDqQgyiMMwgnSFbYph+Ky?=
 =?us-ascii?Q?3bfHj7U9irl5N7JJO2Wht6n/yRhufJdDRlawF67v/O1qygmXB7ClyWQYrGQY?=
 =?us-ascii?Q?H0IU+P2IdbFEdkyOJLtoL03uVgLqYhUxhXfm9PiwGobdQlAnjFJRJTjDBA8j?=
 =?us-ascii?Q?ES9vBqlVu1EkSNDI6XTFMPWrMQCRqRbHC0Aj/a4r81tEqd0je3ju6gqcRYXL?=
 =?us-ascii?Q?ml59B+t+nBiOn9k1P3v9ri3+mSn4k2TnJNJCFzuqFV54iIoFL6HPNIhDvR0L?=
 =?us-ascii?Q?5A4p8NitxlHxqbSTj0p/g3kTiDi6TZI4t/F1sY6w9y6Q8l1d8Q1sdgSS3fYr?=
 =?us-ascii?Q?QeQ06yzw9CYo6EYlz+sJ7sZawenOfoh3+yv818mdQ3mR6YwQxHN3YXF4S+Bu?=
 =?us-ascii?Q?VV173XKZHcXUnaGjG7GTL4wQrAm5DCGZZnKloBNdXuUBKIMFbdaqurONXMlp?=
 =?us-ascii?Q?Jkz0SsvOmo7d2Jwrkn8imsXLIUp6w/iuxoT1nCocoZJxUW9JdXHE39eX9143?=
 =?us-ascii?Q?jzd4yMD3qtr+/wh7DHMVzYvW0bT1ko6MbPnpxVLMAC6gPHgwQUshVeEl7mBd?=
 =?us-ascii?Q?i4i9v7IPJNM8bw75C8WTwn69KQ7DpiTqOB9q7ioqxV/5b9UkLDZE4ngOAK53?=
 =?us-ascii?Q?siWfdOyrhLORrHxXtJ/ncAZG8T5Siab5y8zxoDSBxvNR/CB2IDmidW3UT+pC?=
 =?us-ascii?Q?eeR2rALvB35yhDETv20RTGj83mGC7OA66KWp23KYpXHY++mxK45z28AV8fR2?=
 =?us-ascii?Q?6j6f087SK/ha1pQwBC5+FOuPrthwedO/7/Ngb/uJpVQVlxZFwV7aR2vTg7B9?=
 =?us-ascii?Q?FHMEDIvAjpcTOzCFcvOEHdZ3qB4YRJBV7WjHokVNeVLRLaTnLqjYymIxvP49?=
 =?us-ascii?Q?eMFI1/Or/8gorXVKKZx42dI8i7RfYDiNKL99K86p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82382214-f83f-422a-5345-08de008a4e09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 01:31:55.1156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/wBH3Auwban2V3J2/9JP+etZfk+Ll68FuuIT+lcYGhSuyC6e+NnBac4DXcNypw9kQ51OA8raNbFk61E8azzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611
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

On 2025-09-29 at 22:49 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On Mon Sep 29, 2025 at 9:39 AM CEST, Alistair Popple wrote:
> > On 2025-09-29 at 17:06 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> >> On Mon Sep 29, 2025 at 2:19 AM CEST, Alistair Popple wrote:
> >> > On 2025-09-26 at 22:00 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> >> >> On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
> >> >> > On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> >> >> >> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
> >> >> >> > On 9/22/25 1:30 PM, Alistair Popple wrote:
> >> >> >> >> +        // SAFETY: No DMA allocations have been made yet
> >> >> >> > 
> >> >> >> > It's not really about DMA allocations that have been made previously, there is
> >> >> >> > no unsafe behavior in that.
> >> >> >> > 
> >> >> >> > It's about the method must not be called concurrently with any DMA allocation or
> >> >> >> > mapping primitives.
> >> >> >> > 
> >> >> >> > Can you please adjust the comment correspondingly?
> >> >> >
> >> >> > Sure.
> >> >> >
> >> >> >> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> >> >> >> > 
> >> >> >> > As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
> >> >> >> > it will change for future chips, but maybe we should move this to gpu::Spec to
> >> >> >> 
> >> >> >> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
> >> >> >> patches, I'll use a HAL to select the value.
> >> >> >> 
> >> >> >> > be safe.
> >> >> >> > 
> >> >> >> > At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
> >> >> >> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
> >> >> >> > please go for it. :)
> >> >> >
> >> >> > Well it's certainly not the VA_SPACE width ... that's a different address space :-)
> >> >> 
> >> >> I mean, sure. But isn't the limitation of 47 bits coming from the MMU and hence
> >> >> defines the VA space width and the DMA bit width we can support?
> >> >
> >> > Not at all. The 47 bit limitation comes from what the DMA engines can physically
> >> > address, whilst the MMU converts virtual addresses to physical DMA addresses.
> >> 
> >> I'm well aware -- what I'm saying is that the number given to
> >> dma_set_mask_and_coherent() does not necessarily only depend on the physical bus
> >> and DMA controller capabilities.
> >> 
> >> It may also depend on the MMU, since we still need to be able to map DMA memory
> >> in the GPU's virtual address space.
> >
> > Sure, I'm probably being a bit loose with terminology - I'm not saying it
> > doesn't depend on the MMU capabilities just that the physical addressing limits
> > are independent of the virtual addressing limits so setting the DMA mask based
> > on VA_SPACE_BITS (ie. virtual addressing limits) seems incorrect.
> 
> I think no one said that physical addressing limits depend on virtual addressing
> limits.
> 
> What I'm saying is that the DMA mask may depend on more than the physical
> addressing limits or the DMA controller limits -- that's a different statement.
> 
> >> > So the two address spaces are different and can have different widths. Indeed
> >> > most of our current GPUs have a virtual address space of 49 bits whilst only
> >> > supporting 47 bits of DMA address space.
> >> 
> >> Now, it seems that in this case the DMA engine is the actual limiting factor,
> >> but is this the case for all architectures or may we have cases where the MMU
> >> (or something else) becomes the limiting factor, e.g. in future architectures?
> >
> > Hmm. I'm not sure I follow - the virtual addressing capabilities of the GPU MMU
> > are entirely indepedent of the DMA addressing capabilities of the GPU and bus.
> > For example you can still use 49-bit GPU virtual addresses with 47-bits of DMA
> > bits or less and vice-versa.
> >
> > So the DMA address mask has nothing to do with the virtual address (ie.
> > VA_SPACE) width AFAICT? But maybe we've got slightly different terminology?
> 
> Again, no one said it has anything to do with virtual address space width, but
> it has something to do with the physical addresses the MMU can handle.

Huh? I'm confused - this started with the name for a constant and the suggestion
was this constant was called `NOUVEAU_VA_SPACE_BITS` in Nouveau. That very much
implies to me at least it has something to do with virtual address width? I was
just trying to point out (maybe poorly) that it doesn't.

> Otherwise, let me answer with a question: What do we set the DMA mask to if the
> DMA controller supports wider addresses than the MMU does? We still want to be
> able to map DMA buffers in the GPU's virtual address space, no?

Lets be explicit with terminology - which MMU are you referring to here? The GPU
MMU (GMMU) or the CPU MMU or the CPU IOMMU?

Not that it matters because the device driver needs to set the DMA mask to the
maximum width DMA address that the device HW is capable of producing, which in
this case is 47-bits. Theoretically I suppose it's possible for someone to build
a GPU which could generate DMA addresses greater than what it's own GMMU could
address after translation, but that seems pretty strange and not something I'm
aware of or expect to happen in any of our devices.

> In other words, the value for the DMA mask may depend on multiple device
> capabilities, i.e. physical bus, DMA controller, MMU, etc.

But that doesn't impact what the GPU device should set it's DMA mask
to be. If the GPU can generate 47-bits of DMA addresses it should call
dma_set_mask(DmaMask::new::<47>).

IOW it's not up to the GPU device driver to decide what other devices in the
chain are capable of, that's what the kernel DMA API is for. For example if
the physical bus the GPU is plugged into is limited to 32-bits for some reason
the DMA API will ensure dma_map_page(), etc. wont return addresses greater than
32 bits.

> Hence, the DMA mask should be the minimum of all of those.

Right, but I don't think that impacts the GPU device driver in anyi way. The
GPU supports 47-bits of DMA addresses, so we set it to that. Obviously different
models of GPUs may have different capabilities, so some kind of HAL will be
needed to look that up, but I don't see a need for any kind of computation in
the driver.

> Whether we define all of them and compute the minimum, or just create a global
> constant is a different question. But should at least document it cleanly.

