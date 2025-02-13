Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B5A3366D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 04:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F075310E08D;
	Thu, 13 Feb 2025 03:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tmt2qZKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CBF10E08D;
 Thu, 13 Feb 2025 03:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvLhIx5/DDmZZ5VK5CuwJpE14xsT3j/iUfJmfmh4c0M2zxb/rN8jLENJElt3fEUmPZfzo8V75qF07VDGOFtAUyXVMeo43dcrHj+zZ2fRuwyNhfW1lz0aMCJUoKzw/a4wi/zBNIRN8mJSo98ZP7Fx25jc+uxEM8/fPjOn/14NoWVT0UevGsyRaG5/yt1DL3FEyPHfBUUrumnqzjHYJ8fCnWl0UdObUaaQHAe7Zh0vjOx+WinBsAKlwgaQrPwRIhlFRHt+1whLmph4hl8K8X5yNOnZPHCQZvEGltFYA/h+2I9OW48/ouMd1vo91mcxGrAMNz8aP6WEfG/lMfN9gZtFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raZho5hvk5wjMp3quSqdhjqSnntEYT9G6MGNVJwN2IU=;
 b=CuTjvdpOj3glkJ1Bb954OVHq0bJG0yOLJ5h/jtWWksv/Ck+4giovxlESZfHGX72STxwTnxZt8l/H5xsA+qm3mmOxKEhvA98GtLUJDasszRtseovE+nuiLjf2nCea5PE4+4HwWO9Kpuwq8OkyFYCIXx5hZiv7FIKXtOq+qQrqeScbgHpCeeWZ0k062+TmK6U82G2teJMUSl7WqCVanE6WH6LSo0CFDGWNE6oYCHAiNaUK8uNIwC9Axn6jit7tFb4HfUWjsRyDGs0JenWz7XlDBBA0wVugAaN7fb0L2GVUsP9/Hdrao7ygT1Zkzd5i+yz8Pt1Vk1hT5PtQYHXGU+k2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raZho5hvk5wjMp3quSqdhjqSnntEYT9G6MGNVJwN2IU=;
 b=Tmt2qZKXz5KwgSf9r+eZvJ7lrxmT8Uw7THrtBZP3Y7ad1bMdbHLr/3tM1afQI09zr4y+zha+R6yvtkpJ5XzbBukhvOv+nJeTb161QxZmw5Fbg79G0bwayKU5gRYBto76kzjq0mIlYcyb78oyZPmr1TR8CmwMKwA9fMdizJD15u4oDkuhaERr36fMOfUGu2ZhKVuv2voB9Po0iVKc0o9kZfDJn15HzbkibN29EKOUV/Z6nTU6xbxviWNehOTvgsS0ZmhNWfW8zILF93AFvyGt6/rgjdTYVCamwM5RM1F8jpf+fpLP/cZabCf9Qy5Le0Hvdkp9IuQCtbvdBVFFJW8N2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Thu, 13 Feb 2025 03:54:27 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 03:54:26 +0000
Date: Thu, 13 Feb 2025 14:54:21 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, 
 corbet@lwn.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com,
 zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, 
 acurrid@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add initial documentation
Message-ID: <jm54evphntgr6lejdb7qxcbwnuqfw4qetkwmo6iyu4cnv2lbsm@6qxefqwdke4a>
References: <20250209173048.17398-1-dakr@kernel.org>
 <20250209173048.17398-2-dakr@kernel.org>
 <xaj6mg4rgm5teesapw5d2npkr3oagaon5baqiplhzjag2fwv2j@kscfzjg3cfbv>
 <82296c50-66dc-4be5-8c56-66f891047fe9@proton.me>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82296c50-66dc-4be5-8c56-66f891047fe9@proton.me>
X-ClientProxiedBy: SY2PR01CA0004.ausprd01.prod.outlook.com
 (2603:10c6:1:14::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a0ab54-808c-45e7-f8fd-08dd4be21c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uHp36XMKoRBgij2+K6asp2YRdx7HoGMfKWGH7Apfq6jMJziuWtUWE4+5Hqcr?=
 =?us-ascii?Q?giSoKzJhz/+76SO+5wy3oHpLUNP5kIjgsE3jtGcqU+6EKC4BLJoknS4iecsP?=
 =?us-ascii?Q?Mtti/uVU+lXK61teoJHTZBMGuGlzN443e8DbAqr2Yh55txo6nD0AaVCvJHiF?=
 =?us-ascii?Q?mT53gGDmgRist528fiytToDPgsm6BoOryfBQ7RPCLNV3rRIj79oubGHYgdjZ?=
 =?us-ascii?Q?n2yvKla18vgNuLziWu91sYQOF+qZtDWoBWO7CA0s1w9glu0vAcc4JfjMciVs?=
 =?us-ascii?Q?lK687Q2gs6JWxoO1dFCzlor6aqJNYqUkYUXkesgYj4H8DWcV3iW+JVB7/oUi?=
 =?us-ascii?Q?zUQp2Xf9enNVa6msAThmfamvIfGKOVk6wHA/eEv/phsxbPEGn9tuuUnBjkVz?=
 =?us-ascii?Q?qn0qwcwtygt4ZN53bB3n7ogBLwOFU2ewMf+cV+OaIBGLUabJ4KLgGN0laKjC?=
 =?us-ascii?Q?AoZ+DwyvWcJKJLDIs8oiTZIoxRBKgkOnj44MaMy7bWenmlgF1btSjwjzOZ1Y?=
 =?us-ascii?Q?orU0AVNwNx+p4IUAawv34XOZZRuI5dRhoFQGiP36gMIC+56Wu3/SMFDG+Emt?=
 =?us-ascii?Q?xVWW+MF45/6CJljIS7Rj8JJmtxoQZpmI7HBIQNe1gVULMgTEEVxfo+R1gmbU?=
 =?us-ascii?Q?77vlNfqANvHe0WeWNOUhnB59hBK5KXTsz2rZhhCaNDRk0F36IXqdL1W7T9vX?=
 =?us-ascii?Q?7nRgwTukqvUXhruiawrFAUEVf/PjYLqzO6+4e4IkZo8QcRsrSFXO25cfsguT?=
 =?us-ascii?Q?Dfk88QLXE3shY/t77VVVUFmzgYleRAkikZIU12nz6YOPFiSM1vDLRaLMkDF5?=
 =?us-ascii?Q?4aY4YnSKrd4/vxrvYiMxFhzkGymi8Zs2/Srg8RspqrCZUlp1y1J9emDeF8tn?=
 =?us-ascii?Q?3/DhqKDPDOeHV9qpGxbBfnyVmUouhmZ8RkuMqS7JgYOepoR/737hRjIJuuNn?=
 =?us-ascii?Q?2kuQNX9Fsiykz1XHJWp5e9ds8mwfaCVogzO5HAX2rOoKiFZ/IV9PEV6TLoo8?=
 =?us-ascii?Q?LVZhK/0y7+DtUWKzmFASSs2sAOIMl/o6l0tkNsphvqg+SPnGER5NniPG2RUm?=
 =?us-ascii?Q?7rg4j/HjJT7c7sitSZi05y9wydGb+ZOQe+e1JQG4BJgI4KTZ7XkSPfnuH2WM?=
 =?us-ascii?Q?XwcXZw1FBBYy4qiV6ai72zLHOVXi67GvllJZyYimgoVGzc6eEfjSEHJ/e+ZS?=
 =?us-ascii?Q?4UPsYxi2xKh/YeElx8MUCvuhRE8PmAT6XYTwCEQZy0cCsXxOpWI3Yi5GjgoC?=
 =?us-ascii?Q?GgTI1fL/NIjE/vBcM5sXLx6xoQ9RN3EwwiYdasY0nNnzqQzxfDoSDnumBIQS?=
 =?us-ascii?Q?nkl+tfFulj4nQ+jnohr92Vu/ozZpxzkU74TDElI0QBuN83Gs3cGvQ2zkeMMy?=
 =?us-ascii?Q?ppPhAEB/Cr8oqt51I2wDciNk8S/c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tcQFVbozqXo1CGgt0T6SI5qIiYqoAWA4v5hZLSJxkJdCCS9enDlK1Ttca3Jm?=
 =?us-ascii?Q?BwOmC9WH8Hj/3R3JvWvIRhnwzZkQAlveXq/lx8xLDlPe76BYzFgpWrnhbzAz?=
 =?us-ascii?Q?I/uI1oSZ22aVHJJgUzeyFwklF0iKoO2jz8sGQgbJJU2hLfa9K/L7fa9Hh4p9?=
 =?us-ascii?Q?ArhtZNa8CB4EvDWIP8fOOrsDsZgEOYddRDwdzOHmoGD4+QtZSNEgqPEcKNYF?=
 =?us-ascii?Q?FAqZ911KWm0gY3MerFXlRnGLEdJ2tGyqtThLZanv/qqVHtjaHEWDw4PVFoli?=
 =?us-ascii?Q?LStc/G1brQbgwkM/FpT+DjlDX5P+yisWf6/NYPILzuRRLN/IQitmgemFl/oX?=
 =?us-ascii?Q?gREqSlW8zU9dyz+4NyuAug3//M5fNVqGl7++ll/imm+ARsW99q7l2rsbReO2?=
 =?us-ascii?Q?aVSl4LXF6CQNsAtwHITyFqvEiMEl4hZT1Us+SO/P9GWgCkd1N0E2G818KPu1?=
 =?us-ascii?Q?LBjFrkkr3bspK3kN5jcgfpuns6GkLHmwB5BMEns9BwRuo1jxO+QsSMlkjQTI?=
 =?us-ascii?Q?OmFQ97eR/sSAKQCOoRj5YJ1p+6Y0AF6HATWUQtsE39mX+KZHeODl3uaKARqP?=
 =?us-ascii?Q?shFwuZPv1oQwvzKGOdAHUBnruOEIHJfo7Pg40A4AV7T8ae2USnibJuVIhmD5?=
 =?us-ascii?Q?Fq+8sLyEv3DqP/PVPOT9vIC9iff7XIblr/caNAaccVu1pmldKob4NxVaxAN2?=
 =?us-ascii?Q?nz+UpCRe43ii4Sk2goNZ+J/ldwDddX+9DguoeP/qLyT2gKTGLsz8WzmgEI3m?=
 =?us-ascii?Q?n9mV+nNXWPXZZjLo73wCwBNV9rZnVf1ZwZzb1COa12weS4ckCGM0+M9g+r9m?=
 =?us-ascii?Q?JWJCZcZDYqwiOmISaYbmJDA+cUMFWSPmS9phrkKofYQlCf0W1ljh6dB7j89f?=
 =?us-ascii?Q?G0FTMmnfzNT56Yl/e8MI6Lbbj3lrBUjOq+E5rKNXq/6Ue8Aw/K03Z9OM8HuW?=
 =?us-ascii?Q?M2YFHBFJn6W9TSJdm2LUDEH0v0o4nU+u4RxY8CT05F/+Gm8bHZkoolSmIMVQ?=
 =?us-ascii?Q?hNMvidVlry7TS4+Wn7y1g/0p+iSGbLXtF2AQTD0tHDLWV19beIfgh/7rfCrT?=
 =?us-ascii?Q?T+ozwE1Ht5/w8hpHbFPLxO0cG5bAQHk6GjZYL+bkzuNM5/Z1CwzxyT6E95h+?=
 =?us-ascii?Q?A6wtMFOJHzshVy8Thogy8sNeHwG74UsYPI56UsjBXfaraotJuAY/R+EOcyJb?=
 =?us-ascii?Q?oLZqZhqH475tjDZ55uhl4ATV9musfBt48TtPWf8pdrKY72hg4SpZTNkFLSGh?=
 =?us-ascii?Q?tZLJLn04RGucX/uueWqK3Jp7m6p9y9w66CDQaW7qIocwa/Lp8lrnaQhzMAXX?=
 =?us-ascii?Q?k/cTUxy2tWEoGW/HacvFEk2v3JNXib/SfFpmQjXD/U7Sm9zPJMCvjcOtMqt6?=
 =?us-ascii?Q?xJkVqNzxj/SrQ9g2AhguEU1Peku4GB/yYcyebKzFMw2WByz3G43sB56pwpl9?=
 =?us-ascii?Q?JSqrt4Z7omJxUBhWw++vrBpA2omzUiK7rOG5OLmtHtQc8TFT3Ef9l/qgR2I/?=
 =?us-ascii?Q?scz6r7gfqEL3ts1EftZplHmeqVn1ebmiKCL4P/lo0TNs9xCut+Mn6Qludcga?=
 =?us-ascii?Q?SAZIH5D2WpnVmUDDEiXt/SfW/KFK9zLJ6fQj3Ads?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a0ab54-808c-45e7-f8fd-08dd4be21c42
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 03:54:26.7332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2IIZuMy3B3HPVQAk1Jav5PfNbigclO2gqLVeVVCCzeaBQ15Wz7iXruT8bt2Sg956ZlhY86AU/rjdJz35ZRwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

On Thu, Feb 13, 2025 at 12:33:21AM +0000, Benno Lossin wrote:
> On 13.02.25 00:27, Alistair Popple wrote:
> > On Sun, Feb 09, 2025 at 06:30:25PM +0100, Danilo Krummrich wrote:
> > 
> > [...]
> > 
> >> +FromPrimitive API
> >> +-----------------
> >> +
> >> +Sometimes the need arises to convert a number to a value of an enum or a
> >> +structure.
> >> +
> >> +A good example from nova-core would be the ``Chipset`` enum type, which defines
> >> +the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
> >> +certain register indication the chipset AD102. Hence, the enum value ``AD102``
> >> +should be derived from the number ``0x192``. Currently, nova-core uses a custom
> >> +implementation (``Chipset::from_u32`` for this.
> >> +
> >> +Instead, it would be desirable to have something like the ``FromPrimitive``
> >> +trait [1] from the num crate.
> > 
> > I took a quick look at this, mainly to get more up to speed on Rust macros.
> > 
> > It seemed to me that bulk of the work here is actually in getting enough
> > functionality added to rust/macros/quote.rs to make writing procedural macros
> > pleasant. That seemed reasonably involved (probably beyond beginner level) and
> > not the most pressing thing so I'm not currently looking at it, but thought I'd
> > drop this note here in case it's useful for anyone else that is/wants to take
> > a look.
> 
> We're already aware of this and actively working on a solution.

Argh, great! Good to know.

> Note that we don't actually have to write this code ourselves, as it
> already exists in the user-space ecosystem in the form of the quote
> crate [1].
> Also, since this is a dependency of the macros kernel crate, its fine to
> use user-space rust, since proc-macros end up as "compiler plugins", so
> they run on the host and not inside of the kernel that is being built
> (so they also have access to std).
> The only problem is that we need access to quote and since we don't use
> cargo, it's not as easy as adding it as a dependency. Currently we're
> working on a solution that will give us not only the quote crate but
> also the syn crate [2] which will make building proc-macros feasible.
> 
> (Note that both crates are highly used in the Rust ecosystem and IIRC
> also the compiler depends on them. So it is not just any random Rust
> library that we would add to our dependencies.)

Of course, I was wondering why they weren't already included so many thanks for
filling me in on the background.

> [1]: https://crates.io/crates/quote
> [2]: https://crates.io/crates/syn
> 
> ---
> Cheers,
> Benno
> 
> > 
> >  - Alistair
> > 
> >> +Having this generalization also helps with implementing a generic macro that
> >> +automatically generates the corresponding mappings between a value and a number.
> >> +
> >> +| Complexity: Beginner
> >> +| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
> >> +
> >> +Generic register abstraction
> >> +----------------------------
> >> +
> >> +Work out how register constants and structures can be automatically generated
> >> +through generalized macros.
> >> +
> >> +Example:
> >> +
> >> +.. code-block:: rust
> >> +
> >> +	register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
> >> +	   MINOR_REVISION(3:0, RO),
> >> +	   MAJOR_REVISION(7:4, RO),
> >> +	   REVISION(7:0, RO), // Virtual register combining major and minor rev.
> >> +	])
> >> +
> >> +This could expand to something like:
> >> +
> >> +.. code-block:: rust
> >> +
> >> +	const BOOT0_OFFSET: usize = 0x00000000;
> >> +	const BOOT0_MINOR_REVISION_SHIFT: u8 = 0;
> >> +	const BOOT0_MINOR_REVISION_MASK: u32 = 0x0000000f;
> >> +	const BOOT0_MAJOR_REVISION_SHIFT: u8 = 4;
> >> +	const BOOT0_MAJOR_REVISION_MASK: u32 = 0x000000f0;
> >> +	const BOOT0_REVISION_SHIFT: u8 = BOOT0_MINOR_REVISION_SHIFT;
> >> +	const BOOT0_REVISION_MASK: u32 = BOOT0_MINOR_REVISION_MASK | BOOT0_MAJOR_REVISION_MASK;
> >> +
> >> +	struct Boot0(u32);
> >> +
> >> +	impl Boot0 {
> >> +	   #[inline]
> >> +	   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
> >> +	      Self(bar.readl(BOOT0_OFFSET))
> >> +	   }
> >> +
> >> +	   #[inline]
> >> +	   fn minor_revision(&self) -> u32 {
> >> +	      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_SHIFT
> >> +	   }
> >> +
> >> +	   #[inline]
> >> +	   fn major_revision(&self) -> u32 {
> >> +	      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_SHIFT
> >> +	   }
> >> +
> >> +	   #[inline]
> >> +	   fn revision(&self) -> u32 {
> >> +	      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
> >> +	   }
> >> +	}
> >> +
> >> +Usage:
> >> +
> >> +.. code-block:: rust
> >> +
> >> +	let bar = bar.try_access().ok_or(ENXIO)?;
> >> +
> >> +	let boot0 = Boot0::read(&bar);
> >> +	pr_info!("Revision: {}\n", boot0.revision());
> >> +
> >> +| Complexity: Advanced
> >> +
> >> +Delay / Sleep abstractions
> >> +--------------------------
> >> +
> >> +Rust abstractions for the kernel's delay() and sleep() functions.
> >> +
> >> +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
> >> +since Oct. 24.
> >> +
> >> +| Complexity: Beginner
> >> +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
> >> +
> >> +IRQ abstractions
> >> +----------------
> >> +
> >> +Rust abstractions for IRQ handling.
> >> +
> >> +There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
> >> +to request IRQs.
> >> +
> >> +Besides optional review and testing work, the required ``pci::Device`` code
> >> +around those core abstractions needs to be worked out.
> >> +
> >> +| Complexity: Intermediate
> >> +| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
> >> +| Contact: Daniel Almeida
> >> +
> >> +Page abstraction for foreign pages
> >> +----------------------------------
> >> +
> >> +Rust abstractions for pages not created by the Rust page abstraction without
> >> +direct ownership.
> >> +
> >> +There is active onging work from Abdiel Janulgue [1] and Lina [2].
> >> +
> >> +| Complexity: Advanced
> >> +| Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
> >> +| Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
> >> +
> >> +Scatterlist / sg_table abstractions
> >> +-----------------------------------
> >> +
> >> +Rust abstractions for scatterlist / sg_table.
> >> +
> >> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> >> +mailing list yet.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Abdiel Janulgue
> >> +
> >> +ELF utils
> >> +---------
> >> +
> >> +Rust implementation of ELF header representation to retrieve section header
> >> +tables, names, and data from an ELF-formatted images.
> >> +
> >> +There is preceding work from Abdiel Janulgue, which hasn't made it to the
> >> +mailing list yet.
> >> +
> >> +| Complexity: Beginner
> >> +| Contact: Abdiel Janulgue
> >> +
> >> +PCI MISC APIs
> >> +-------------
> >> +
> >> +Extend the existing PCI device / driver abstractions by SR-IOV, config space,
> >> +capability, MSI API abstractions.
> >> +
> >> +| Complexity: Beginner
> >> +
> >> +Auxiliary bus abstractions
> >> +--------------------------
> >> +
> >> +Rust abstraction for the auxiliary bus APIs.
> >> +
> >> +This is needed to connect nova-core to the nova-drm driver.
> >> +
> >> +| Complexity: Intermediate
> >> +
> >> +Debugfs abstractions
> >> +--------------------
> >> +
> >> +Rust abstraction for debugfs APIs.
> >> +
> >> +| Reference: Export GSP log buffers
> >> +| Complexity: Intermediate
> >> +
> >> +Vec extensions
> >> +--------------
> >> +
> >> +Implement ``Vec::truncate`` and ``Vec::resize``.
> >> +
> >> +Currently this is used for some experimental code to parse the vBIOS.
> >> +
> >> +| Reference vBIOS support
> >> +| Complexity: Beginner
> >> +
> >> +GPU (general)
> >> +=============
> >> +
> >> +Parse firmware headers
> >> +----------------------
> >> +
> >> +Parse ELF headers from the firmware files loaded from the filesystem.
> >> +
> >> +| Reference: ELF utils
> >> +| Complexity: Beginner
> >> +| Contact: Abdiel Janulgue
> >> +
> >> +Build radix3 page table
> >> +-----------------------
> >> +
> >> +Build the radix3 page table to map the firmware.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Abdiel Janulgue
> >> +
> >> +vBIOS support
> >> +-------------
> >> +
> >> +Parse the vBIOS and probe the structures required for driver initialization.
> >> +
> >> +| Contact: Dave Airlie
> >> +| Reference: Vec extensions
> >> +| Complexity: Intermediate
> >> +
> >> +Initial Devinit support
> >> +-----------------------
> >> +
> >> +Implement BIOS Device Initialization, i.e. memory sizing, waiting, PLL
> >> +configuration.
> >> +
> >> +| Contact: Dave Airlie
> >> +| Complexity: Beginner
> >> +
> >> +Boot Falcon controller
> >> +----------------------
> >> +
> >> +Infrastructure to load and execute falcon (sec2) firmware images; handle the
> >> +GSP falcon processor and fwsec loading.
> >> +
> >> +| Complexity: Advanced
> >> +| Contact: Dave Airlie
> >> +
> >> +GPU Timer support
> >> +-----------------
> >> +
> >> +Support for the GPU's internal timer peripheral.
> >> +
> >> +| Complexity: Beginner
> >> +| Contact: Dave Airlie
> >> +
> >> +MMU / PT management
> >> +-------------------
> >> +
> >> +Work out the architecture for MMU / page table management.
> >> +
> >> +We need to consider that nova-drm will need rather fine-grained control,
> >> +especially in terms of locking, in order to be able to implement asynchronous
> >> +Vulkan queues.
> >> +
> >> +While generally sharing the corresponding code is desirable, it needs to be
> >> +evaluated how (and if at all) sharing the corresponding code is expedient.
> >> +
> >> +| Complexity: Expert
> >> +
> >> +VRAM memory allocator
> >> +---------------------
> >> +
> >> +Investigate options for a VRAM memory allocator.
> >> +
> >> +Some possible options:
> >> +  - Rust abstractions for
> >> +    - RB tree (interval tree) / drm_mm
> >> +    - maple_tree
> >> +  - native Rust collections
> >> +
> >> +| Complexity: Advanced
> >> +
> >> +Instance Memory
> >> +---------------
> >> +
> >> +Implement support for instmem (bar2) used to store page tables.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Dave Airlie
> >> +
> >> +GPU System Processor (GSP)
> >> +==========================
> >> +
> >> +Export GSP log buffers
> >> +----------------------
> >> +
> >> +Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
> >> +(even after failure to probe the driver) through debugfs.
> >> +
> >> +This is also an interesting feature for nova-core, especially in the early days.
> >> +
> >> +| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
> >> +| Reference: Debugfs abstractions
> >> +| Complexity: Intermediate
> >> +
> >> +GSP firmware abstraction
> >> +------------------------
> >> +
> >> +The GSP-RM firmware API is unstable and may incompatibly change from version to
> >> +version, in terms of data structures and semantics.
> >> +
> >> +This problem is one of the big motivations for using Rust for nova-core, since
> >> +it turns out that Rust's procedural macro feature provides a rather elegant way
> >> +to address this issue:
> >> +
> >> +1. generate Rust structures from the C headers in a separate namespace per version
> >> +2. build abstraction structures (within a generic namespace) that implement the
> >> +   firmware interfaces; annotate the differences in implementation with version
> >> +   identifiers
> >> +3. use a procedural macro to generate the actual per version implementation out
> >> +   of this abstraction
> >> +4. instantiate the correct version type one on runtime (can be sure that all
> >> +   have the same interface because it's defined by a common trait)
> >> +
> >> +There is a PoC implementation of this pattern, in the context of the nova-core
> >> +PoC driver.
> >> +
> >> +This task aims at refining the feature and ideally generalize it, to be usable
> >> +by other drivers as well.
> >> +
> >> +| Complexity: Expert
> >> +
> >> +GSP message queue
> >> +-----------------
> >> +
> >> +Implement low level GSP message queue (command, status) for communication
> >> +between the kernel driver and GSP.
> >> +
> >> +| Complexity: Advanced
> >> +| Contact: Dave Airlie
> >> +
> >> +Bootstrap GSP
> >> +-------------
> >> +
> >> +Call the boot firmware to boot the GSP processor; execute initial control
> >> +messages.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Dave Airlie
> >> +
> >> +Client / Device APIs
> >> +--------------------
> >> +
> >> +Implement the GSP message interface for client / device allocation and the
> >> +corresponding client and device allocation APIs.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Dave Airlie
> >> +
> >> +Bar PDE handling
> >> +----------------
> >> +
> >> +Synchronize page table handling for BARs between the kernel driver and GSP.
> >> +
> >> +| Complexity: Beginner
> >> +| Contact: Dave Airlie
> >> +
> >> +FIFO engine
> >> +-----------
> >> +
> >> +Implement support for the FIFO engine, i.e. the corresponding GSP message
> >> +interface and provide an API for chid allocation and channel handling.
> >> +
> >> +| Complexity: Advanced
> >> +| Contact: Dave Airlie
> >> +
> >> +GR engine
> >> +---------
> >> +
> >> +Implement support for the graphics engine, i.e. the corresponding GSP message
> >> +interface and provide an API for (golden) context creation and promotion.
> >> +
> >> +| Complexity: Advanced
> >> +| Contact: Dave Airlie
> >> +
> >> +CE engine
> >> +---------
> >> +
> >> +Implement support for the copy engine, i.e. the corresponding GSP message
> >> +interface.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Dave Airlie
> >> +
> >> +VFN IRQ controller
> >> +------------------
> >> +
> >> +Support for the VFN interrupt controller.
> >> +
> >> +| Complexity: Intermediate
> >> +| Contact: Dave Airlie
> >> +
> >> +External APIs
> >> +=============
> >> +
> >> +nova-core base API
> >> +------------------
> >> +
> >> +Work out the common pieces of the API to connect 2nd level drivers, i.e. vGPU
> >> +manager and nova-drm.
> >> +
> >> +| Complexity: Advanced
> >> +
> >> +vGPU manager API
> >> +----------------
> >> +
> >> +Work out the API parts required by the vGPU manager, which are not covered by
> >> +the base API.
> >> +
> >> +| Complexity: Advanced
> >> +
> >> +nova-core C API
> >> +---------------
> >> +
> >> +Implement a C wrapper for the APIs required by the vGPU manager driver.
> >> +
> >> +| Complexity: Intermediate
> >> +
> >> +Testing
> >> +=======
> >> +
> >> +CI pipeline
> >> +-----------
> >> +
> >> +Investigate option for continuous integration testing.
> >> +
> >> +This can go from as simple as running KUnit tests over running (graphics) CTS to
> >> +booting up (multiple) guest VMs to test VFIO use-cases.
> >> +
> >> +It might also be worth to consider the introduction of a new test suite directly
> >> +sitting on top of the uAPI for more targeted testing and debugging. There may be
> >> +options for collaboration / shared code with the Mesa project.
> >> +
> >> +| Complexity: Advanced
> >> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
> >> new file mode 100644
> >> index 000000000000..13ab13984a18
> >> --- /dev/null
> >> +++ b/Documentation/gpu/nova/guidelines.rst
> >> @@ -0,0 +1,69 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +==========
> >> +Guidelines
> >> +==========
> >> +
> >> +This document describes the general project guidelines that apply to nova-core
> >> +and nova-drm.
> >> +
> >> +Language
> >> +========
> >> +
> >> +The Nova project uses the Rust programming language. In this context, all rules
> >> +of the Rust for Linux project as documented in
> >> +:doc:`../../rust/general-information` apply. Additionally, the following rules
> >> +apply.
> >> +
> >> +- Unless technically necessary otherwise (e.g. uAPI), any driver code is written
> >> +  in Rust.
> >> +
> >> +- Unless technically necessary, unsafe Rust code must be avoided. In case of
> >> +  technical necessity, unsafe code should be isolated in a separate component
> >> +  providing a safe API for other driver code to use.
> >> +
> >> +Style
> >> +-----
> >> +
> >> +All rules of the Rust for Linux project as documented in
> >> +:doc:`../../rust/coding-guidelines` apply.
> >> +
> >> +For a submit checklist, please also see the `Rust for Linux Submit checklist
> >> +addendum <https://rust-for-linux.com/contributing#submit-checklist-addendum>`_.
> >> +
> >> +Documentation
> >> +=============
> >> +
> >> +The availability of proper documentation is essential in terms of scalability,
> >> +accessibility for new contributors and maintainability of a project in general,
> >> +but especially for a driver running as complex hardware as Nova is targeting.
> >> +
> >> +Hence, adding documentation of any kind is very much encouraged by the project.
> >> +
> >> +Besides that, there are some minimum requirements.
> >> +
> >> +- Every non-private structure needs at least a brief doc comment explaining the
> >> +  semantical sense of the structure, as well as potential locking and lifetime
> >> +  requirements. It is encouraged to have the same minimum documentation for
> >> +  non-trivial private structures.
> >> +
> >> +- uAPIs must be fully documented with kernel-doc comments; additionally, the
> >> +  semantical behavior must be explained including potential special or corner
> >> +  cases.
> >> +
> >> +- The APIs connecting the 1st level driver (nova-core) with 2nd level drivers
> >> +  must be fully documented. This includes doc comments, potential locking and
> >> +  lifetime requirements, as well as example code if applicable.
> >> +
> >> +- Abbreviations must be explained when introduced; terminology must be uniquely
> >> +  defined.
> >> +
> >> +- Register addresses, layouts, shift values and masks must be defined properly;
> >> +  unless obvious, the semantical sense must be documented. This only applies if
> >> +  the author is able to obtain the corresponding information.
> >> +
> >> +Acceptance Criteria
> >> +===================
> >> +
> >> +- Patches must only be applied if reviewed by at least one other person on the
> >> +  mailing list; this also applies for maintainers.
> >> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> >> new file mode 100644
> >> index 000000000000..2701b3f4af35
> >> --- /dev/null
> >> +++ b/Documentation/gpu/nova/index.rst
> >> @@ -0,0 +1,30 @@
> >> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +
> >> +=======================
> >> +nova NVIDIA GPU drivers
> >> +=======================
> >> +
> >> +The nova driver project consists out of two separate drivers nova-core and
> >> +nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs based on
> >> +the GPU System Processor (GSP).
> >> +
> >> +The following documents apply to both nova-core and nova-drm.
> >> +
> >> +.. toctree::
> >> +   :titlesonly:
> >> +
> >> +   guidelines
> >> +
> >> +nova-core
> >> +=========
> >> +
> >> +The nova-core driver is the core driver for NVIDIA GPUs based on GSP. nova-core,
> >> +as the 1st level driver, provides an abstraction around the GPUs hard- and
> >> +firmware interfaces providing a common base for 2nd level drivers, such as the
> >> +vGPU manager VFIO driver and the nova-drm driver.
> >> +
> >> +.. toctree::
> >> +   :titlesonly:
> >> +
> >> +   core/guidelines
> >> +   core/todo
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 5d5b7ed7da9e..ed618e8757a5 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -7454,6 +7454,7 @@ Q:	https://patchwork.freedesktop.org/project/nouveau/
> >>  B:	https://gitlab.freedesktop.org/drm/nova/-/issues
> >>  C:	irc://irc.oftc.net/nouveau
> >>  T:	git https://gitlab.freedesktop.org/drm/nova.git nova-next
> >> +F:	Documentation/gpu/nova/
> >>  F:	drivers/gpu/nova-core/
> >>
> >>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
> >> --
> >> 2.48.1
> >>
> >>
> 
