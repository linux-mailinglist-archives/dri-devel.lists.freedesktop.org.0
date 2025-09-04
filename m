Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26978B44096
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017510EA89;
	Thu,  4 Sep 2025 15:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cG9uYC4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE610EA83;
 Thu,  4 Sep 2025 15:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKUKnNdan0EGnc1FPbFXEGDw9liQn7R/QqHIDP5MeMuDfKsIcp64xmUMcW0Yq+we2gLBMIU3RMT5OzodlzFJFLS2fj3Ml0VljgxnxydQEnuNu1nWcZUns1lZKkPi/5KYVOjlbYwbf1f1sIKUJV8AJpAvLG81tXIhHup6hJqqWn4k/Qa7gBL5dGAQqTBYAv/4tHQe5E/q/8OTdLWuBbGP71HOdSJkFUcy/RjjPw3wv6ko+DDdtcZlawO2dUhvylLSR+I4yPdZbgZvh2kZzN25QgA7BBlxX95Z1yFnS8RL1ZgAOvu4oCNU114hYZld9G4s+uGrl/2bzMeDL+1AYBFEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z3WycfbwWxWFLzrIghzqpo0gUOgXonexeIJAt1TBWo=;
 b=WltRJ5yEAxSpUqroL3hYM1/hDy4WNTQy/aGibu9Ptl0D63tRBMSrrLaQliojLUna/G7IvPYsOwtGjQcCLJBFKHQAzbky5fV+GqzE8mpY7kGex7vTiDL2q3yoGsuZebmC8q5/VYMRSxvmHwStiYqEnZ3yxGnYwVmTppHBWZLMDWUzsGRtYHse3ei8Vy10VjejcV80KhhkLuVZqNFEo3kik+Mq8ngU9nL87W8jKd1xwBZK4LmDJs6NVsUFHGwY8hbnqu8jw2tXllRiak5FyBUFJ/UsCnTRSNhCg61RBYXr7mxnSV+xpd3dT0S4efqF8wqjFN3X5yha1+Qp642VBi/RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z3WycfbwWxWFLzrIghzqpo0gUOgXonexeIJAt1TBWo=;
 b=cG9uYC4njALBAea1dqFe1m95wIjpUiVeGJjQ83Yiq2owM0hblLje6mYg3LS/tpNgtJ4aNWg2qCwFrtFb1msL4P1kJs0oroilYIUGn0itWa4BIW7gBlub9oq4zPOHTKMdUk9iAQzAaBPzRJya1QE3Mbz29lxT4TCFRkluYPbPDS4ySJsLYGuH7XTCQBGFh3SqMEp2JlA4Jztb5Hdv/35XaksDuyASm7QqhdZBjo2FyOvh/OwOvc3PG3dkYqmVwWQSRXSiCrBjw3gbAquYZJD6/GC6r4loGYZNNxQBY2RPryvBchw9X2VlqRb6weHItBWdWx3R/FkO9+X3EUdDXmOs4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 15:28:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Thu, 4 Sep 2025
 15:28:08 +0000
Date: Thu, 4 Sep 2025 11:28:06 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of `Gpu`
 constructor
Message-ID: <20250904152646.GA1967049@joelbox2>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <DCIKSL18GE9A.2R4BAGR56YVPF@kernel.org>
 <DCIZ5VVLACXO.1L0QTYM5YVRQV@nvidia.com>
 <DCJ0T81CZQ88.6IK6LG0E0R02@kernel.org>
 <DCJ3R8YQUYK1.3K5BCWHMAEOL7@nvidia.com>
 <DCJ46WGRUXR8.1GKGGL2568E1X@kernel.org>
 <DCJ5ZOH6DO2S.8GGF9FABSVNT@nvidia.com>
 <DCJ9206YBEV2.1ICN4VILLM09J@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJ9206YBEV2.1ICN4VILLM09J@kernel.org>
X-ClientProxiedBy: BN9PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:408:f9::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM6PR12MB4332:EE_
X-MS-Office365-Filtering-Correlation-Id: b76e11a8-ec36-47ea-81bc-08ddebc7a657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EI3fX4CCBC94b7juJ0G2ThUwsnr3O2oTeXQ5TaVqehMgXX1h7Jzg2yd7Z8LU?=
 =?us-ascii?Q?ypW/Hr9jUEzMBai6MBKObhxANjlJHq+uXcJd6kHLR1eytDfFklWZ0Yuphwj8?=
 =?us-ascii?Q?3Gct5JwLIWMwnoxz16ltCzwfx8sgfAmxM5JKpc4B5WgZoyPHbsfKOx0K7B6o?=
 =?us-ascii?Q?6U3UddYA5oPlJywcGpKSzePsmL5apEPaE7h5vNIGt/yVeJiJz3y/llEaXQCJ?=
 =?us-ascii?Q?YSECknLkptTT0quRAW9dBZvYwNYOzpOJ9Ukh+gnYY/buL6L/bqBDMZc8Qke+?=
 =?us-ascii?Q?vAh3N2zL265vZdkAj/jikFt9GF8hOnWZILrj8aU2qSEWZky2EPx5NTzyG1d6?=
 =?us-ascii?Q?rFmZxZuFoXvuPjSEL0n5wvBbT+C8TR8xt4I6KUWwZEOcVE6BPzrv+pTxd4ul?=
 =?us-ascii?Q?c2b0wEVoVNi1QSYzQDy09BIKdXNoOw2c6O446Vte2reSORXdhfhJ2ZF9z6IS?=
 =?us-ascii?Q?tibsvSsDz0gCtEL6fjhofHByb5dCNmi6B2+Hj6Irt8AgA2QiHWW3PqGzUpmI?=
 =?us-ascii?Q?OTNdhVYqEgd6RA4nMbOn/zmbHRqKTBO1OVLwhdLX1WN7hlUoJwPD7M8yy6Se?=
 =?us-ascii?Q?O4tsNYyoEU72qt99UTIu1aRSZokOHUMl0dJTNW4Th5pz0l4D/szt0b3AUtcJ?=
 =?us-ascii?Q?z39KmUVLZ4z4QMjHUn/KNDty9YFpNXWsc28wqBnfWwMh4rOuK952tl4eu2CY?=
 =?us-ascii?Q?0C/TboDNLwgCMhvFxmFz68+WbRa5vjXSbbA2zlzcwNw0+/y5j070bLuUh0jk?=
 =?us-ascii?Q?waOHhwan6n3uNDpTlhszolizS1ha6KU7OayYcyiti2iqwzufW6mUWC2bCQbG?=
 =?us-ascii?Q?KUrBMYFW/PPkl4/WXlp2yUBDkjApM38eIndc6Wx+SV7mQkkadM4HEfat+cw5?=
 =?us-ascii?Q?RcfbUVwIJA+4q8dWblkt332MEmovbIFWBetiKRIjdNyOAe4GM+LxzH+Go+b/?=
 =?us-ascii?Q?Zp7ZodLngkfW+QSpIkHzgtp1S3d87D/kKmgry1E4IfTmnhNCVbqBgGO7/sML?=
 =?us-ascii?Q?VEg8WZ2w9uHuMbqxsbn/4GliUQrmdO3Ng5NdMpDDpTbHqAkKXCAycIERfO5h?=
 =?us-ascii?Q?xohdJTNAmEyLFwwUtT+1ZzVLsxZsJcNEgu1E3wFft90IUiOX+qV31TYjfHlG?=
 =?us-ascii?Q?lJY4Kv9kgM/IPsCC0C0s3rHzzaQdq4G1iX22CBO3elI9JzHgp1w/vwgZ80nB?=
 =?us-ascii?Q?x+/BsoelIXoHH+3tzFEYuzkKnG3aq3qByrrcorryecYq+CPbJUI2QNcRFn/Z?=
 =?us-ascii?Q?Re3hitoiMXBLXBq30zh93YsHGjRwgFHQK56LcAQcHUr+jd3rN7DbesbCJVJq?=
 =?us-ascii?Q?CCvKwXqvm1cTjnshJXfAN3Hd7etYXXfePp0RRkQerDpeMzdaBpwwkXul1n0M?=
 =?us-ascii?Q?FhKDOWfzkAJuUc8sag2iprGp0PTnD6dP22hdXBFe3qsghY8DiyBRkw0cjWQh?=
 =?us-ascii?Q?XUWty+WNQTY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4OFLt9A9TGUt3nJ4y64++e46NkDIzqubMYT8mnxXBZAQUWSeeH5Zssaci0bi?=
 =?us-ascii?Q?BSlLUZqsWu78QghrBM8F66YjIJG74KixDc+HYFVRrOT87y9hQudUHvGlflPI?=
 =?us-ascii?Q?Z77dq/hCfeNEaUSOSwkXG0am42wbfBX8I/L/eHahSiSUrl7N46DkXK9pxQni?=
 =?us-ascii?Q?DKtbZa0kZLJcSp4Z+rAbBftLBk1SHHjnmo8XG9Q9h/NLeQKhbQEzymmMXAQk?=
 =?us-ascii?Q?egl0VWUTBnLrvZDm2+O+FwLapXiz4ZrKN4xsifDr6HUagyW9+9/LjCMU2e6i?=
 =?us-ascii?Q?u4KRhB0h0GmNUndMm31G05o8agJPy3dlb21kCxWbDkX+hgi5lSdZEAyKBCLN?=
 =?us-ascii?Q?mvnBSAsgP6jfh43Yz7GZcIUC7Bz9XiUq0LVObL2BNiISGE01sI4jddQ8ksXk?=
 =?us-ascii?Q?UfXpkcn4xVgko8M9ns0kvAjTwsBIxt0ZBFE9s5CuVTa0l0+WnfgmQPbho53W?=
 =?us-ascii?Q?cLO6D86G7vJVVscSTg+G21kTMHz5qfdmbYLN827nwTFIGMqeelkZ18nXXeBY?=
 =?us-ascii?Q?jq6dQXjp5pfmIyQHD7h3nZIHfbputjU5yMX8g84e1i+vtoZNHoPriZslYUNb?=
 =?us-ascii?Q?hXWD117+nT3ejETlTH7/2gTGTHi39TeO/Dyne5wcXOsMv2VSllHbnmuCnOBO?=
 =?us-ascii?Q?zfqwkfrnDGKzk2YfwQSCu1pO8tJYv6Mh8Kn4/twZPl9uPIgEpIQSufMlSIXW?=
 =?us-ascii?Q?L9nOv+gNoRXaR+saBlw5xksY1g354m9m1ZviG/11PImwIGYcPHS/+d32s3jv?=
 =?us-ascii?Q?NE3DW4s3cM+ryWhEevIUSwVWkxWsp0fyaGk8BK3/J6ynzW9L6s0y9CnbMVrn?=
 =?us-ascii?Q?LtzdrOExCg9KdpfNML7Gy+RLZDrBuGHHAmsm2zWgvsc/FqTvqonvSFU65rRy?=
 =?us-ascii?Q?EQUznZk7sYlB+Y6F1Xc8PJL68a1XLlhcXmC6fhfngDfs17z9kTAUrIlmanjl?=
 =?us-ascii?Q?5634Iqd+s1nfxHbd6dvPZ7Q9l9D7vs+pswCI1sEp2NTWtJNXbYoOp8dN11UK?=
 =?us-ascii?Q?4RE7D820oX/KNnUilIAtwnzkpNruj+Fgk1DIaFGLYCJuC7uqU1n9cUVXKfN+?=
 =?us-ascii?Q?qe4hZkfs2sWJp86Js3xv3RdLEynfuATY3MBRAKXLoaLNseI8SPhneqhETTjx?=
 =?us-ascii?Q?fIRZQS3yD6tt3pucntMxz0D9RfFDLzvOQqBQkzWCpXtWm/3SpRGuWeBBZXLn?=
 =?us-ascii?Q?Q/c8mm9wABEHpumeUjdR6zK+LkAwHsS3LSREmgIkX7+jhEJknsEpofMQ8Ho+?=
 =?us-ascii?Q?aXG64hzCf8ZVDvLuC24xXor20QESnYUchkyx+FvXXq5ewL+20aXnbq/7cALT?=
 =?us-ascii?Q?uakwdx27B+oSb76GhgQDgFaPLZxAU92V0cEZjTkhFvlnLkBY8V4nvUv2g644?=
 =?us-ascii?Q?HqlznX42bq302ywUiIx6VqgbGCA+IHg/60IZM/+hDcuHyfy6BeMIhmhjITXr?=
 =?us-ascii?Q?tvVXV3VIQ3dcXr2JbG+vEyWaWBg6cF4YQWpCmeCJxvXJpZ8JN9PYcuxj9FBD?=
 =?us-ascii?Q?DnE5ZCzDq4BpHGfca6FqG2mtLOdA2h86N4LMItDVR2a6US/ZPMSo5lEBtDle?=
 =?us-ascii?Q?3/Zuz19ijGESZL8yA6ajL9bGokzjAmh6IDhQPJCQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76e11a8-ec36-47ea-81bc-08ddebc7a657
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 15:28:07.9999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TezZokajs2aoMnXAMez0bLIT4ZXtNySQjZ5UH4Ys+TsUq+2QysAf4fOpWmQ3uUNlKy6I343AE/xI0VMo65aTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332
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

Hi Danilo,

On Wed, Sep 03, 2025 at 04:53:57PM +0200, Danilo Krummrich wrote:
> On Wed Sep 3, 2025 at 2:29 PM CEST, Alexandre Courbot wrote:
> > To be honest I am not completely sure about the best layout yet and will
> > need more visibility to understand whether this is optimal. But
> > considering that we want to run the GSP boot process over a built `Gpu`
> > instance, we cannot store the result of said process inside `Gpu` unless
> > we put it inside e.g. an `Option`. But then the variant will always be
> > `Some` after `probe` returns, and yet we will have to perform a match
> > every time we want to access it.
> >
> > The current separation sounds reasonable to me for the time being, with
> > `Gpu` containing purely hardware resources obtained without help from
> > user-space, while `Gsp` is the result of running a bunch of firmwares.
> > An alternative design would be to store `Gpu` inside `Gsp`, but `Gsp`
> > inside `Gpu` is trickier due to the build order. No matter what we do,
> > switching the layout later should be trivial if we don't choose the
> > best one now.
> 
> Gsp should be part of the Gpu object.

Just checking, if Gsp is a part of Gpu as you mentioned, and start_gsp() is
called from within Gpu::new(), does that not avoid the problem of referring
to fields of pin-initialized structs entirely, at least for this usecase for
nova?  Or is there any nova-related usecase where this is problematic?

thanks,

 - Joel



[...]

> The Gpu object represents the entire
> instance of the Gpu, including hardware ressources, firmware runtime state, etc.
> 
> The initialization of the Gsp structure doesn't really need a Gpu structure to
> be constructed, it needs certain members of the Gpu structure, i.e. order of
> initialization of the members does matter.
> 
> If it makes things more obvious we can always create new types and increase the
> hierarchy within the Gpu struct itself.
> 
> The technical limitation you're facing is always the same, no matter the layout
> we choose: we need pin-init to provide us references to already initialized
> members.
> 
> I will check with Benno in today's Rust call what's the best way to address
> this.
> 
> > There is also an easy workaround to the sibling initialization issue,
> > which is to store `Gpu` and `Gsp` behind `Pin<KBox>` - that way we can
> > initialize both outside `try_pin_init!`, at the cost of two more heap
> > allocations over the whole lifetime of the device. If we don't have a
> > proper solution to the problem now, this might be better than using
> > `unsafe` as a temporary solution.
> 
> Yeah, this workaround is much easier to implement when they're siblings (less
> allocations temporarily), but let's not design things this way because of that.
> 
> As mentioned above, I will check with Benno today.
> 
> > The same workaround could also be used for to `GspFirmware` and its page
> > tables - since `GspFirmware` is temporary and can apparently be
> > discarded after the GSP is booted, this shouldn't be a big issue. This
> > will allow the driver to probe, and we can add TODO items to fix that
> > later if a solution is in sight.
> >
> >>
> >> I thought the intent was to keep temporary values local to start_gsp() and not
> >> store them next to Gpu in the same allocation?
> >
> > It is not visible in the current patchset, but `start_gsp` will
> > eventually return the runtime data of the GSP - notably its log buffers
> > and command queue, which are needed to operate it. All the rest (notably
> > the loaded firmwares) will be local to `start_gsp` and discarded upon
> > its return.
> 
> Ok, that makes sense, but it should really be part of the Gpu structure.
