Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6383B8B993
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 01:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9311610E231;
	Fri, 19 Sep 2025 23:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BMvSaHwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561C110E231;
 Fri, 19 Sep 2025 23:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP1KIGxX+jamoRioSgioE0iLWIkaWcrMX0+dFzR/kFmJSDypO/txYiyydTeN/oBb1vgmwuNVHE2W49kVv2ZFOxCNZj7x+fNVJMZA6ZG81Y1JujJ3/3EX3t2dyBgeOwZm4uf5+8oNcLS4UEg9ONO5rkj/8zd+aoDJuCr2qxfcDy11x+UukmRcndUSyPhKpKfbp014IC/3HH3885ly7106SsaS1IJ618CmQetiEaHKT7M1FuUwVmv+S7zSPROOBPxVG1PfP9fyvYsyW+NJb8ztqDWeqxlTmhzEEXJBsvbkh4slsTjvKDVK0dEDAHmgvecr2cSfhpj2tpIW9UJa5j+8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlexG0DONbiyAf0E9auLvdEXsGi6joZ4PIGE1SAmZKo=;
 b=Fq/KAhLm5BxwcTYt36JdKmwJlMAK5DsMWx1CbjCrY+0OZnFrUKNwa9bNd2/sdu43Nom6aLk0YaMhlSOP6n2kuSNH+EaAN57QR4QPCiv6Qnd17IjrFj2wCkMJXvMyTyihpAlBMr7fO8Xz1s2XlfmiFUC9nUmBJQCnPy8Oapcg8LcI9TNgsUdMNb8CAGT1UlcpvRuhI8NnPdoohvYttVdYOouU0sI47OnMLWCnlQGpNhOIoQgnZdc8QUXRJ3wTiY8y0yDnWdZNKBC2v5qPeX86t9XyXIwOlemdYKO3lFtsV/UY+vUs8qYS1wf2FxkgNXdHBZzyvYsGL957sNF7+QOaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlexG0DONbiyAf0E9auLvdEXsGi6joZ4PIGE1SAmZKo=;
 b=BMvSaHwL7tQeAYtBJpq3iRUG3NxR5754G7k9vGCKiEUsle5IVb7jwCUqCi3sRkgFb8rFzOLTpFvwR3GA0YjR2bqfIc5Bgzd7iNZ9wVTcbM429XYB41QV0DxCk1dDx1nU9YWRqSmSjhGzIAULlXQMjzfop/jHkPHWlaFmdO6x41c/AwFUnf9GB+SBTLn58zeTjq+u6BiFdoIZoVlJGXoMIKd7RFt6DEmNITEJoFqmC7Oh5t6mQhuo0sF/JqycOXxNexsuEOexjSkmL0tvTxWV4VwiPa3ytwsjyvMWS/aV1gfa2peVAk6bFzgW1lFGLTGHonb48uVbeFkPZnzlgerdHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 23:02:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 23:02:34 +0000
Date: Fri, 19 Sep 2025 19:02:27 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Message-ID: <20250919230227.GA1901670@joelbox2>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com>
 <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com>
 <aMIqGBoNaJ7rUrYQ@yury> <20250916095918.GA1647262@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916095918.GA1647262@joelbox2>
X-ClientProxiedBy: BLAPR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:208:32d::28) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a36620-d55e-4835-1b8c-08ddf7d09e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dDD6WmqmxFug9+Iq94Rj0dXA7TyXPJBrDzMtm4W5vd20v4tvMjOw2645RKKe?=
 =?us-ascii?Q?rsQuNs1ZzLNoxiHuADkEUIfGMxACmDPWrFJattsL0ylPxsVylLm9inaFm4on?=
 =?us-ascii?Q?N9bNBE4pqujfcsW7efI/gigqLH0RxXnbrGlTlbymyC0zaCWTfBeu9qmICS5/?=
 =?us-ascii?Q?0BJtsysBP7t/AcQ6LsbJbxB4+o1R8wLL08cJgksrhXTLZQM6xOuB5hUOt2En?=
 =?us-ascii?Q?ZXYaaQbGp7muPO6rtmklisusriB2ixdensUSE1Z9pYhGcBveEx16RnkyjByz?=
 =?us-ascii?Q?9W9Aho8Bl3xBt+cHVENYNz6H2uI9EdOj0ESlJ1//PnKvQoWfADbRFfYDvMRs?=
 =?us-ascii?Q?eBVaaH57e/Jhh/8FDC1JnBH4ePAP5l5PU2ZomGPYGjej8tbQ1MjYkWpWsGIA?=
 =?us-ascii?Q?6wM2Lcqtn/MbJbOEgHCVwrjgovVAZLPfWYh6CSbY72pB13yKkJjUxChYT0yr?=
 =?us-ascii?Q?VmAnEGVrZjudnuOxCyXoJwcEbx++/vnYE9PJ2t2PGX5JF8Eg3OtERepECbGN?=
 =?us-ascii?Q?QVc+sT4Hlef8+G0XEHaSv46z7DVYRWCmK1UjJXxqzE/Cy+/8OodDtig7XA3i?=
 =?us-ascii?Q?X4fa2CW1b2z2tQptbA3rPBUhnhc9oLnxEClZ3+lELEib9XlFLVGwTyFxG19I?=
 =?us-ascii?Q?B4KDBsEz+wUAA9oIzY5R0tP2s1Nz0EHkPmzoRZT6J8bIC0nennjRh9/ymimN?=
 =?us-ascii?Q?5pCCGEyKwpfvyqXtk/4GGSrEdOdko9nsCWIOYtm+AAxneog9XIuI3Mesz0Jt?=
 =?us-ascii?Q?OKZdwm1qDvicmleg6qfvhVMcj2fRmfrR4b8/KOHpvmHNnDPus5vK1EHycFKF?=
 =?us-ascii?Q?drUwvOFfflRBe4ToDgfHp6NXP9bafWqGelkUV6FCM1Bc8PDMowDynxhBzMrv?=
 =?us-ascii?Q?xQtFL8VcNeQshym8BODkDwmLwExuIXCTGenMeI4ZhnQmKyqPkd2ts+WcgLJX?=
 =?us-ascii?Q?9vVneelFTCqehQBgzjQIER0xeIDI6BeKs/598MStw7ZkvU/lAMmKpyTw5Xtc?=
 =?us-ascii?Q?oQb4dhzjF1OOw86Y2QVeGQjF44wrfFX2ajpiR3e3jaLzi78fB+/p5O2tK/jl?=
 =?us-ascii?Q?GkimZuTpmxVjUHAt25cEKtln2FOSBXJQR8mQMBBZlBJ/Y1u3bTPrxnIeY+o7?=
 =?us-ascii?Q?y2H3+B6ObesevUDZeCXXSPnnuz4nXP4bcSAUKknfn1w2PDK1vjrd4KY5csgY?=
 =?us-ascii?Q?CDoc+LXexc+tRmskU3kD7FH78Hbf4Ci401fMRnmJb/NmDHc63jxqwisu+iuw?=
 =?us-ascii?Q?8LopiWkXCD8lD2H+/9/QbKJO6cTG0tPtwOU3GdtB2qKBGSGWn8Tlxo7yZHP5?=
 =?us-ascii?Q?i9lddRoQY14iKJIe4HOMVM4vEPkgdm5ORHrtdg3JCVMtD+sNFK+g4thcfkwC?=
 =?us-ascii?Q?7mrlBGsxPVANIZ8lt/X4f41ij9lU81UmLHb2/nlBDKXousDkk0YzgwAmbR/R?=
 =?us-ascii?Q?23RYkqJncj4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g2MG3tgN9J2nSbGb0aLmYVyELgTIf5VO6UYXCnkAxGY1E/MnHDT8t/KglJwu?=
 =?us-ascii?Q?fBvpF3PIrJzyAHxNt9OSjkmxYoX4rNb0iT7tR3nA6hmNfD2XU6n4RXb28G2B?=
 =?us-ascii?Q?kUhfK89U3fRDM5HAPWDISLSEAlsbw1QJ6J9fz7WNgtAfIQepJfGruZJet/sb?=
 =?us-ascii?Q?9hvbC+iOvaNxFudVKm5nqYihmW0v3cFlqHw6YpDszpFmm4MvDbnGOnh16pw4?=
 =?us-ascii?Q?MOvx0IZ0vnGmYFNiUjP8/NVI3paqSHBJZvUj5+1u/ndRjskaYTIb9G79SrDm?=
 =?us-ascii?Q?lUoZIHLAdJcYuPYzjBbi8RkmkiIZJhgLBZJRDyMi4420tSh2v0/AiGnrVyB4?=
 =?us-ascii?Q?EYzlc3iXQ9ALAtSPAgUu1vCdV6Y0VIt5XkBzvmkazhL4rGDt1/XEPwZqxkLq?=
 =?us-ascii?Q?Uryxvq3fRon4jjjfx1pneoW9UQqUyeCOOyYi1SVzTuh7CWJExcouz1ZCzUqh?=
 =?us-ascii?Q?swujC6g+BrP5zwE7mf0V/JbhmKxLx5eMD0MsO1bCEF3kEwMHWjrf0NlC7jyY?=
 =?us-ascii?Q?pFDXJ7YAQt6Z8XWsYhFfq+mNbAYd+qncgTcWgIj/gPH4VqNXcwkoy1fYXAqQ?=
 =?us-ascii?Q?EKYlxilD9h1u36E4k7gKnmiRaBE9hozov+r8SQ0dYmnAK4G+BLaYE6sKb4IJ?=
 =?us-ascii?Q?uh4ir5qxIDaT5xpedEIR06nnSmTrK6vH4OGhNDUU7SxdxLz5Qz10j+B4lV9q?=
 =?us-ascii?Q?DyTMdI+Vt7AOhSA7DXql0zk9blnoblUudyNvgm0juXqu+DlDzx2DZAnMhvcy?=
 =?us-ascii?Q?v/3ulEf5vokwOk3VedBhiiV2uXvJbQbkpSS8q6XRJ5Nl7T7hLVZ9uaFVoAgb?=
 =?us-ascii?Q?93exT6HhcKa3nYSJRWgfSVNAL8TDj3pNi3LD2E8+Vzf2KgfxLLcJ5XQ7ofIv?=
 =?us-ascii?Q?s/HzzxRCdn3k0xjgvDZtjrAwTJVoePFM/qY0KOTKyLYl083ny7qVJyFvUJZE?=
 =?us-ascii?Q?gwPjO/5OodbVa5i1J7izbyFnZDShdlo56Uc2YeAIfTdNwyAuxyF8rBP6i4cA?=
 =?us-ascii?Q?5Zqlt+gg72ahfQ3tMK6tjo4784tjN4c0xF/58ww1OCkKNm3ISTjoav1k5CKl?=
 =?us-ascii?Q?AYCXs3HqCdfY/xvvSErBj4w1zYPiOX847w5unjFm3tFeQ4WYPx1ID2AZ0ZRe?=
 =?us-ascii?Q?4V8U0XYvS7i7cecLm1voeXNMbN0CuZYFVQqZv4/7OLBpUGfusUEnN7MXbxyw?=
 =?us-ascii?Q?bY1NTSngeqIvMvnJiWrtD70DgitTK/mjvF0fPIhanTrIrqf65anUqzo+A2Y5?=
 =?us-ascii?Q?bZRbbaytpYj2bR5V7PQCWtF+Cs5DpBAThEUCUK0kn62CCk+lDieuS/KoisG4?=
 =?us-ascii?Q?q+z/drD5l2XF8CGxKzHyPIaksxCK/poc8WPO8vf3SZt/jJadxTHu0NkqIUf+?=
 =?us-ascii?Q?1W0FNLrz7lsDZUqJp1fK4tndiHoKcWrV0OTpca2gfXumy4aH8Ul8skEG+1HC?=
 =?us-ascii?Q?SnGHgKk+wETk2+jY8q40ytFKlUZugVem0qlCsdz7C12Vwaj3e+PDFOe1XNaP?=
 =?us-ascii?Q?Gh+kFuuebaQk1IVbWPHYKrhtT0JCw/OeMusD/+aag6ZgtY4pGvCEfkfwGEmq?=
 =?us-ascii?Q?QsPfCfuga/F2B/RvVVW+od134FDVmiIaJnGVLtB6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a36620-d55e-4835-1b8c-08ddf7d09e5a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 23:02:34.0205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdkdCs754P8q7RyXIzeI5iZLI1Pj8oS2zXVSnLyHntcxw273c9zIcwAwGlo24+ujQR5g6UfcnFR+4ZLjiWqvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163
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

On Tue, Sep 16, 2025 at 05:59:18AM -0400, Joel Fernandes wrote:
[...]
> > > > The same question for the setters. What would happen for this:
> > > > 
> > > >     let bf = bf::default()
> > > >              .set_state(0xf)
> > > >              .set_ready(true);
> > > > 
> > > > I think that after the first out-of-boundary in set_state(), you
> > > > should abort the call chain, make sure you're not touching memory
> > > > in set_ready() and returning some type of error.
> > > 
> > > Here, on out of boundary, we just ignore the extra bits passed to
> > > set_state. I think it would be odd if we errored out honestly. We are
> > > using 'as u8' in the struct so we would accept any u8 as input, but
> > > then if we complained that extra bits were sent, that would be odd.
> > 
> > That really depends on your purpose. If your end goal is the safest API
> > in the world, and you're ready to sacrifice some performance (which is
> > exactly opposite to the C case), then you'd return to your user with a
> > simple question: are you sure you can fit this 8-bit number into a 3-bit
> > storage?   
> 
> I think personally I am OK with rejecting requests about this, so we can
> agree on this.

It is not possible to reject values passed to set, because it returns Self
and follows the builder-pattern, to do this we will need to return Result,
and have the caller unwrap it, and have to rename it to try_set().

Instead of that, I would just extract the bits from the value the user passed
and ignore the rest (example if 0xff is passed for a 4-bit bitfield, then the
field is 0xf.)

Alex what do you think, should set_ be fallible?

thanks,

 - Joel

