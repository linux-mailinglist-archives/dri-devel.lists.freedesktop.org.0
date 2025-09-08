Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8122B49AC7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72A10E5C7;
	Mon,  8 Sep 2025 20:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZEkZFZfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3010E5C7;
 Mon,  8 Sep 2025 20:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF3UNWs+l+qKCZOQ4Ae92DEL686aIlWHuRl0kC9hA1pcHvoP23b9TgYQedr4Ffk6PDlZQKAOxPCQHn57PwWbNU+NeqXa6Bf1jXVD7NVj05AGduhR3OiCZxc6LEryhN73woUBO83NJVrWiKOEnZJ+gZiObHB1+dUciDz4qWuNDVrPM2kdFeZ+SsZfzCJURcfKl6pgl3cr8Fc1DhuwyoSY4rMZg+FiPZwxjwNnBFnH1PFtOv9ltT3LMKIot1ja2QEaZLC/qMWJ4GZu+13wNOCFaDB7sv6HYLRcnxvG0zeZ3uGFUj6OdidWBhOQVt23+hzML1k0L9Bu8C9lIV6lVURcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ79x99QF8HMenGArfJpVQ2JOWSLnDm/+NztC1pYti4=;
 b=XTuvfE3uNR9ltV8RfO1wlNv1llb89ucLZfk83dPpTGXrbf8rl1B+RPWuNUNM0d0sVxJ+D/LDvkRt3c90NOiDpmFaCrfDrSnh7lQYq45KhX8MK0hk+UpUumEvmncxAgxbAM0udR1H23It9vBVT086R7SyVyDFGColf8s/BpQM719hiWbCVLgiv4dYW4L1Ha+Qk5I8ITVWSh1UY7Pl4s57SQN8PPBU+npsH/7ABSB0mT4NJxhiqvJhpk06XOyiic2jpyg3LiOLohiYmlpaFlBrROEFIIhNL8ulSDPhiSdEGCIK/I3dbF0vputP4C8bh8+JGpdVpzrAFX3980OznXIXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ79x99QF8HMenGArfJpVQ2JOWSLnDm/+NztC1pYti4=;
 b=ZEkZFZfgnl6rG4Df/6fPjZu9JHhAiIAyCYv9Zb46RcivO/EDdo5knmlC0naTRgbfIsr/YkEW4SmLmGy+tlsfluLJEoWzSYXY5OyS4MmzuTmJ7QDC7Sqt4xewUwSo7dszGIFvR+MPPG6zVjaJy8eZlSf9q8PMnNunX+mCQAu2W1Fd9fStKzQbHRGUDRuQCmYLwxfGKwVSZJ9ZskXwR8nY7g2tpd3wcth1pOpMqQMz6dmAhf3vrQZFrxV4qTv0HwLTR97gA4NsYfXa4H8fefTxV5o7zWRo7D3A+UPpE80/38Qfr7f0Ki/etnbA3Q5jaurUEAbggzxgXSWmGhJHMeU+Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Mon, 8 Sep 2025 20:14:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 20:14:07 +0000
Date: Mon, 8 Sep 2025 16:14:05 -0400
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
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
Message-ID: <20250908201405.GA3815232@joelbox2>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <DCN44MKQ8IMO.2PGDTZ0HC1M6O@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCN44MKQ8IMO.2PGDTZ0HC1M6O@nvidia.com>
X-ClientProxiedBy: BN8PR12CA0018.namprd12.prod.outlook.com
 (2603:10b6:408:60::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe2d757-f6a8-40f2-8770-08ddef144411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HtlUToseidEFMQnh7lk/hWHgEm3qKTVYWQXh9ocH5uLvC4zsnfN8YE9lqSHq?=
 =?us-ascii?Q?QmWzjTpAeyTs7aGyDytd5Fru9XNBG2IE8TtFAToWj9DCLUKYj9d6FzPU9v4e?=
 =?us-ascii?Q?7tjnUrf7YvuYk3E0BkCMLm3ZpnkhQvNr2M+gsQQ0ozqsLcdqEOz3PewEnnb5?=
 =?us-ascii?Q?NamftF7KdUVXf2FMvMagyzjRgC3mHG/KDpt5cdy4YU9haO9QGqH66d6auGUK?=
 =?us-ascii?Q?PmuluauSr4DQs+PDSA8TbMV5Se3MSzaRAYwmIA9vAmT/l8tNyNTi6PzIlKpJ?=
 =?us-ascii?Q?ajENP8y/4vuRaxAs2q/gQ9n2b52vSwA4j2rsJK4tY+KKLKHvcS6X/k1CbcFe?=
 =?us-ascii?Q?BnZcPNq4s6QxRT6kqYMYDM1HGlJC/3Q5b9kCXCNjLdfdwrCPNo7EYXewZgag?=
 =?us-ascii?Q?XpvFn4pmqCn1eOn7WqHYE3zJJttwxKIus4wwJGX3Kk+APD32fGQHykEPZnZe?=
 =?us-ascii?Q?3kgK8KPLVkIUKvKRyjzoviRc3wEfFMuti/TUe/l2kekckP06wdli2FmteAbi?=
 =?us-ascii?Q?cXgEANdghebe9HdDm+4xX/3aNOZEm7xD+BsRaG09qrjOoogCLquRr/UeIw9/?=
 =?us-ascii?Q?ma9Ktk3Y9kb5KMpbsbfkj9QF+5H2fhlM7zONHLnnw+ZPqch/PUa5Q1L94Ga5?=
 =?us-ascii?Q?f37ppI/JQi9UuI2fyDC/r0hXA6I7TfEpRezJ4Rv5kIo7ZFhueO0AZvrmeUEC?=
 =?us-ascii?Q?lxxXwbaJrCaQ4cINoeNHRvqX4ahGF2vYRYB5Z20J1CBq3Mrec/HOKn/LQZsi?=
 =?us-ascii?Q?IaHInWY9oWjzo+SBx31LuhA3IpXNWK+dE1osqdrhw37J6HT07ayjuZa0GXD9?=
 =?us-ascii?Q?8W+zk4ICRFn8C0irzoMnbpXsdZwnGhTqclZi0jWS5DmB5cN1/Y8Mg3XRa45U?=
 =?us-ascii?Q?hPEGMvUTrobkG3EH6cAn/VDDWclSqoybMwsCu7ije7IuH70fw5NFnr47t4SV?=
 =?us-ascii?Q?03IX2w0LY1s6U5KdzAsu/tfMmlCjJxLS5GAnf8w1gaU0Cxuxom+BWtT6Vbay?=
 =?us-ascii?Q?saLdzMkkOzF5y2GP3gd/AgQGwGN4DKD1bBt72RNqYIwMEm9NXlLmeDMYoB5J?=
 =?us-ascii?Q?pcv5SddPQ5DEzctsmC3aeM9fliR1Dyh6Exyk3bod5mVrh99QEOdOgLE2SPb8?=
 =?us-ascii?Q?r0m3z+Avcm8vDHLr7a0/H2jOlMGZ0F7buY/grL7DQYjS52EvctzqAmoYgRrp?=
 =?us-ascii?Q?U6QjCIJauZLVvXS8I4+rg3b/LuCx2kL7O7DNTpp7uBgMnlNPUHW+REa/F80+?=
 =?us-ascii?Q?psn6RZ7KvU4heBKqMTwmPcrwYB3+N3TT+sQVrcCD+XI2UGSNoRbgQDaKnCfL?=
 =?us-ascii?Q?mN3uCngYaFectCtJDai9XGqYfp9YeCvCXwH2WXr1KUKZlx915EKzWK8rgP8M?=
 =?us-ascii?Q?kRi/p9fpOgNoGAfnQ8kBCRgdJksU9ABQnL1Ew4Q1Azm4f/KEedwNp5NYFZwl?=
 =?us-ascii?Q?tsos1DGG+dE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XVwQD9dFxjkfdv6GeVBopPIIhoU2U1mPBZQRsYAM0BGScgwRoAUjxx/sHMxk?=
 =?us-ascii?Q?UccweIl34uOttLaoIMyG9iwGp5Vrfay/nMGPsOX/o44/77UrHPs6xmgUua9Y?=
 =?us-ascii?Q?cSKprckZVx+lml18XBypzqWO4BZUyMf43t+dwI2jr9yfL0YjwrC0SUSYIMdz?=
 =?us-ascii?Q?WosuD3H5ph++lacgybGdXIziWNQIBuEqVA6T2/h/VrfPV9ZL9PzBsF1f0Lwt?=
 =?us-ascii?Q?5dAMIUTJhCCmG/CtNwlOw/zcWR/ldvYe4JYOkRrdyPkFg3KJjw4iSb7tj5gP?=
 =?us-ascii?Q?Quu1lG02V7Ro3yCqxRKWEC3zzurV4eHKU0dVITWWh8gpevhujNlW0ux3GUwW?=
 =?us-ascii?Q?ZdSlDDrIzVu2+uhWI0K9nM7oinx1S1eRKFADNmEialUQZ92Xdhb1uza4ABi0?=
 =?us-ascii?Q?k7X42FBTuaeTXzbBaVub8GsTtHOwEQcAOOYUF9wmUIrEKPbu90a3djEIfe6U?=
 =?us-ascii?Q?phMy28vgx4feZAfWJuZ+8APu08qUborHB0QztpK/HqXuqQ7LMw7TUkjNEJlU?=
 =?us-ascii?Q?IGI4K1L8/MJK0gS8PrMqF4Tst9D7n2/r93pX7FZFfpibw0suaqngDRiq36KC?=
 =?us-ascii?Q?l4ABKHGv6gQPCzwjAaWsyk/qBH46PpojVNYcCYFFeACGnPAg1dFHeRCjBXDg?=
 =?us-ascii?Q?MyIP4WCTy09b7TcKvKWQ8zH/+jyDQGh2oIGR/TKYdSEg0M6VF2g83WK6P9EC?=
 =?us-ascii?Q?VVUF+xoxTSD8mg6tDhlelGOdqx6/4Lbz83zc0SF7Ka+0aqMe/kwxabJ4Rrfa?=
 =?us-ascii?Q?YhJRXvga538tgd5hbJ2GPivUa2pqS61db20inwCKndBHJZh6SDLMJbcTeI1T?=
 =?us-ascii?Q?sn8Z4rUYFgzrx7l1hi4/+8ZV7MoR8Hj5Ffa0vSS/3zoauzvsqc9s8Ndbk+XL?=
 =?us-ascii?Q?UCAZR0GanECqedWqSFNIsx0ltNiReyC8CpkE/k9xqr3QGvAhd82CGi0F6aB7?=
 =?us-ascii?Q?nuPte3NHey0zjOlQaSrYTcT1zVPVuC987bVoyN1OhXfmR24ESEEF002LGYCp?=
 =?us-ascii?Q?rIdW6BS3S60aFDQNsulhX9krYJcTuLGI5CYM38GPNiriALnrbQCpnxqkaI+d?=
 =?us-ascii?Q?GUE2d96zjzMWQbk35grmtH9A7C4B9N4/QojAiPqKB0w0iRU0m/XEmFN4QHSZ?=
 =?us-ascii?Q?LyaNbDXiBA2eJAndoGeDEqbR2Dclhe6YcJzxUBG1jWqob9j08hU0dFK7VDGO?=
 =?us-ascii?Q?IZ3FCjSbc8dGn+bHFreVtvet49KWMihsFqcFyCvj2G38M2UxrJWtT8OaA8xL?=
 =?us-ascii?Q?RPWgWoQaKCXlewzbkMLFbHbhQ50vUSpCR90i/bT0ismFPpY5ssxA9s1Z4e0I?=
 =?us-ascii?Q?ZV9VR22yo5rOgfliWk3uMx+GNSVrSbDYYP6HlHRNCO5OfuMQ5iC1yhjQEAO8?=
 =?us-ascii?Q?n9K7eYpi8EEPuN3bR5EfOpwfvkjb0vhO794luggdnr4wd/EMWd4iuinsMDCN?=
 =?us-ascii?Q?urMXa4tjxf0pxSxJUblRpXOL8kmKe1PMA/VvQpEgJXDS6v9CcwQoNTZewe04?=
 =?us-ascii?Q?UkBy4esh37ArQFR8tThA30byU2lG+YgGek4ksf8R3f/0/cJOj2muXBnMvTcM?=
 =?us-ascii?Q?yXilZbkmQjuRwbTzSi8746xK/m3QlXrVArAQWPxQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe2d757-f6a8-40f2-8770-08ddef144411
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:14:07.8687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMR3lWZZD0FVUEVOm4ZInHock7+9v3IeSfAG4WGWjDsKDwaJEWJLAuJ5nyRSkkgCOTNSJJRt6NkhBv23dHF94g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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

On Mon, Sep 08, 2025 at 12:52:57PM +0900, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> > Out of broad need for these macros in Rust, move them out. Several folks
> > have shown interest (Nova, Tyr GPU drivers).
> >
> > bitstruct - defines bitfields in Rust structs similar to C.
> > register - support for defining hardware registers and accessors.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> <snip>
> 
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index c859a8984bae..9c492fa10967 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -64,6 +64,7 @@
> >  #[cfg(CONFIG_AUXILIARY_BUS)]
> >  pub mod auxiliary;
> >  pub mod bits;
> > +pub mod bitstruct;
> >  #[cfg(CONFIG_BLOCK)]
> >  pub mod block;
> >  pub mod bug;
> > @@ -112,6 +113,7 @@
> >  pub mod prelude;
> >  pub mod print;
> >  pub mod rbtree;
> > +pub mod register;
> 
> I remember a discussion with Danilo where he mentioned the register
> macro should end up being in `kernel::io::register`.

I talked with Danilo, and I moved it to io for next revision.

> Also wondering whether `bitstruct` should not be in the
> appropriately-named `bits` module standing right above it. :)

I think now that I renamed it to bitfield, I'll move it to bits. That does
make a lot of sense.

thanks,

 - Joel


