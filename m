Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FEB5624A
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 19:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BDC10E18B;
	Sat, 13 Sep 2025 17:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f5Fi0lN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA27210E18B;
 Sat, 13 Sep 2025 17:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVixaXeivhVtt70Blnen/pnRWWw88uyHJ2JB6wK2VJ3QnW9F5++sdZVeeOUG58yRSGgk/s3W3ZLeGw14rEm2CazdWvelEQ8nmyw37b232RMESM3whL63LY4Tv5zThDJ/J9mGF1iQrBk0BW1UqoVUj41VvBx4B/xU0pZ0r109Hsgs6x+RW24+kEzfJpG+1AstBN4OIV95ZcxFRwArjNTAWIEMtVQ1zqp8B+L/CSnSGXo2bmH5Gnz73ukvkfpfVK1z//25h7mzUp9Fryxd7OP/PcFeNiC2vXZXMdDYUETOWIC/i6Wq0WCx+cIXBkTMq+FpscvBvM6P3aqe8sYfJZSDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anCWGi+rt+Y+XhJpuLf64DK2/ilgD1FRbemJH24mSAQ=;
 b=izp83gNCcE8H0Q4pvat0CDGXpRb4bNfZ1lgn5moGx+HlArmChW1D1Ayl6Lr7VoGp55tz+sFK13+FQdhVOBH5a8LHCgnjFD2X1MGItYQaYNR9fnD/i2b/xvE3HUa7WC9eicns+jXsWcQ2mvvQQEmU7SRdxqp+hQMpJwmiYs+wqRPCVG78Sh/A5kLB37d8MS2AgpJV5cFChF66ei2jvhRnuuPeNoWvoMgXIklukuA/bgTVM7uHoXJjWVDMbCrZhry+cLSxFFy48VRm78f0WmKMa9nNl0ibxuV/vsGn4OBX4mZ3iR7N9AupmdjkVQP+2J4/gW2NnRi2e8rv/mvNeYQ5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anCWGi+rt+Y+XhJpuLf64DK2/ilgD1FRbemJH24mSAQ=;
 b=f5Fi0lN5KKkyHJIV6jShHaWp7vKV1HKQwP0FH2jd2nJxqaG9JXZ4RkUh8Ogu87wZSodBLUmBfljjJVzfEfsJwT44W+NdgmiNkTEatoUTnFBMJ/WjF3qFnay5eH3ofF7J1lPKk6b5LkOIcrA0sRA1FLpEugAqeq9yDGFWGWMfAqRoPtWa1jlttPQgnVmrmgra6mxRR4utkDC296Tynf0+pRW0LQgzHc5//hN5dJ4zmyWGYD4AskhCqcQFz4eBb0PSnXXSIEt5GZ4/16PO6AUENGsfxN1ZyBCfObscvl0xtz310nW0apO4Pc2D4xVyw5RMgcWeWWoIsBhCBExezCuEog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 17:13:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 17:13:58 +0000
Date: Sat, 13 Sep 2025 13:13:57 -0400
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
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Message-ID: <20250913171357.GA1551194@joelbox2>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
 <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
X-ClientProxiedBy: BN0PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:408:ec::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: c91e5f9f-2971-43ce-f264-08ddf2e8ed6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/rLflRsoQpdCWRLTZIGqJeR1tyL9DxlTiGm4368ujmMWNO+I7RXQAwgC9Tvn?=
 =?us-ascii?Q?fWe4Yv+bTAS+39HMPEU6juZGjn4EaqwLjGGAvquAN8lt5EFuzX8JU+ZYOdu4?=
 =?us-ascii?Q?SKJI//BlpL/OfumTdIcwYaDToqWiiiH83LMq21Vut/V2vUj1OhRYTsl6oGel?=
 =?us-ascii?Q?TvxjrkoTDTvSf0Cj0wku/8FvxcCtsTsSrennIRa8P5aLjz1WCOnSUUxXJ5dQ?=
 =?us-ascii?Q?Bg+QrUNIbH5I0U3KBi9RLcYaKYffDDOjgWLFtVEsVxcMS+fq6F2D5E1K00rw?=
 =?us-ascii?Q?7nAZ6xfQnFvchIMODJ1uO2+ViKdVZzQr1wLzRAXqcgPo/bSWSwz3rKLMI9xa?=
 =?us-ascii?Q?dW8oWQQxlwYV7M4/B/VIpztNFrJZF+PIWTE2wreUMZzQlqNgEfzV0iYyiuap?=
 =?us-ascii?Q?OICVMGLIaojkYff+LRCsdpgpiTBzhvicVCXxPHbeWDrJJjoyi8GK9Kh58f0d?=
 =?us-ascii?Q?OAbtFdFBBhYo8J0I3UAQBWFGo2W9xdgT0mYXIvDunES8xusJ2T6RAFtywiLU?=
 =?us-ascii?Q?KYPblo0g3iHIgshGQ1m8b0wjb+EnPhPqEkfRoMWnJTCiQtob7m6FOUUaZ8fj?=
 =?us-ascii?Q?Jcfwab6TGlTBFxyKl3ItFP1meZCz6yKzlzFoFLKOybGoA4ztWal1CLFw86FP?=
 =?us-ascii?Q?tdibrCs0oE6kvcCHqONVcPwMrb8YwClehL7SM4X8NWdjUnRIVA2ck6hdw+JZ?=
 =?us-ascii?Q?kNSRgzwY9rjE0Xh4nZMpjT6jC06iLscfaULykQzCp3g4T6NiEYd/H8kzW9+f?=
 =?us-ascii?Q?1AQVlmQ2L/CyVRtpEfO/35wtGV+YebUuJjDPmWU319TOJsqXXIoiqWAv/zJM?=
 =?us-ascii?Q?HhNbBooSuSqxWgnLSY2WrhZNZY8zDDh6t3WIq8xC9SeqhSm9QbjDSsxxDojE?=
 =?us-ascii?Q?lZr2rtKJXWKEK0UMPI+5PXeqjL0EDq/JwsFGUjaKCBJKdLG/imAtdwgnaGxB?=
 =?us-ascii?Q?SUBDpJsgKCb6XezN6MV3Czu9yed6Pb36252Ku4t0eo+B0NRnopcTN5l4JQiu?=
 =?us-ascii?Q?zeAzR2U590pNzGu0o3767kFe15TVde2WIYMbB4J8z9tlKIiKB224syd3LS2q?=
 =?us-ascii?Q?NdDf62RO0QkXVkGRfXt6kyk1I86KYWK/kv5ROezg+uQC+OuhBwbAyQyrL1QS?=
 =?us-ascii?Q?QOcPAjKm8GmNF6waFeOdXoJcHDjegPJ7ET/j8jvl0WFbHGH54kqpPxj35X+6?=
 =?us-ascii?Q?ClbHeqV70/3C8hzFqMyVzaBvmx89AlEgRpNaVWXJWBzZzewbPgbD9xyU7JVs?=
 =?us-ascii?Q?9U5YmK9zybLwa3H5H5CJTP+vPkHnUNWxmvtHmJdltFU6hxOjZNADbV+2IJWE?=
 =?us-ascii?Q?F3g2RLtx9wgKeSDcQH9EQRU+pc/po8foCnYrH6dXtkH1VSdfkWos1zGxgpB0?=
 =?us-ascii?Q?aQCy9hjxZmOiKutSf6nYgokbyWU20tn/LOT3QkE4/Jq34sMOR0XVAWDU1tCY?=
 =?us-ascii?Q?kqaK9xFJcmE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zVYrv2pUhQKjzwHpNvXx3hU0sZ+t2cil/6MUhlhp/sl1CUq2BW34aK+YyHhO?=
 =?us-ascii?Q?Exbb8HRGFkCygzuq2AaqHOB4KlJpFD1bl21xcfYUNTlgMjM4mGeBuXzNxUfj?=
 =?us-ascii?Q?6GMsoyB1ytSuw8/kifupHpyfZ7yRKFqxYEIolfYlrB8Efaa4AWbRP+Vzpjf2?=
 =?us-ascii?Q?LLPhKvPa6cLsiaRbOqlzUtgiPU87k5+L063KVGFE8ZLK+4pSHdi5PTA/Ewm3?=
 =?us-ascii?Q?VyOEGVVRylAIZ93fld0RQ75/spoSQkqPtqVtpdMJ2tOCdLVXtS6ox8WgIyuz?=
 =?us-ascii?Q?q9LwztMdIzj7vSvs6QjafapD9vMWBIAwUFWWJ1+wx4LcpPyHmF2xoR0e29KJ?=
 =?us-ascii?Q?H+Z3bPF53Fn20qe353rOFl/XaHFGr+myvf/lvqZuRK8xf2Orc4biANCJJhVD?=
 =?us-ascii?Q?0gnnfqcv9BKOYGwVIGW3v5xNYxaWPGQ3mCoA5kmmf/S2774f/G2NKIfHPiud?=
 =?us-ascii?Q?7jHfIPVYwXoDUZU4Mattm4UFX3k6xFbVAxHU4h4aJnFbeTu42YX9t48RoK7/?=
 =?us-ascii?Q?FTN4Q0SITjgQRxKKAIKS9amB7uB5kW6BtIxe26ofqmuL9v+9t9pQDAaHimHE?=
 =?us-ascii?Q?Zjh9qTyfhOLjX3EcZY827m/WpvJ9bv5JjQtZfySD92ndYGs8+5sfr/cEaw8K?=
 =?us-ascii?Q?ChlnAwQgJMvgcKKmxC2/lH7/RGMTFGIc6SSCojswnFS9SneV5squrHLNGQWC?=
 =?us-ascii?Q?mwTx6fOR6pMiNYrnhNDTEzDZzAk56NXXv0uhzQhJ8dzahq6rHNUxo1zKOwKF?=
 =?us-ascii?Q?wFc16jL/8Ls/eRYvVtk9P+z5aRUFs135TTUXgdRAsGtJQAlt3c6zgefIdF8V?=
 =?us-ascii?Q?o/dVdGv0+xTL+5ogGYJKoL3REgy2/sRZ5AsjSR78a9+u42zwH1Q9LIPIc8na?=
 =?us-ascii?Q?/02OnooLCnuZTFaNBxNDhUAq+uijLaDI2qOk8IxAjz72fQ7k4eofA95fDyVl?=
 =?us-ascii?Q?uWriLakQr92nv3C6lh9OAAGJgLluOO6jrJMpTyLaJ11CHu96+9KnYwYbJV4V?=
 =?us-ascii?Q?rFolyyxyzmoDZc6Tirm5jW4s1+BDTplj5IoEIhwUviRfcnB4b/FzbCWsaRw2?=
 =?us-ascii?Q?zy6h4ygFto71vpyyEbWsWVXsh8r9s54BqjtrNg3ivgiSIyl0tykH/9BKjuk4?=
 =?us-ascii?Q?0U9WLNNa1JQDPyhkfUFuLxkl87d38e9z/HejHTNrC8R/1LdPwAkFWCEFLS0+?=
 =?us-ascii?Q?8g/9C8gxnKrPqvDw3rnPq6kx4hKeUFl1Ft9RFjbzkWvHbPXtoU+1O/Jx9cvL?=
 =?us-ascii?Q?j9+se+SN5/FRq5SlqlRDzNEegXFBFnPrYnblQIetZVBnWTQy1C64Kg+k782X?=
 =?us-ascii?Q?9VNXk2ufB7MTE4QPVlTffNHXmIBmnHcIbgaE/uLYC2odPmE/zgwSI2xG9uAm?=
 =?us-ascii?Q?CXG90CtIJkuCWTD4dVGAq9Tk9OP3OGW34wTYR7UAJW4eh287w59U1lUHJrXR?=
 =?us-ascii?Q?mDxRoQ1kniojSKEgJadbfjO5XcKpQ8zF9n76VgMZeEA/78FdBw67qx8ycPsL?=
 =?us-ascii?Q?SkxvbChJmW5siiDqg8xLREnAAHK8MiAaLX+TiqAZcZEgTd3uZLqhldEehKvx?=
 =?us-ascii?Q?X+pwl1vwgoGLt4TuZNvJmgfadDbc39q8WnzLxi1K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91e5f9f-2971-43ce-f264-08ddf2e8ed6d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 17:13:58.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzd5VToZb0N5KXe15X543LF1SoeTA0NmnDVynuXDi8fWCwKuqSgxIBR+nVhAtzFA7NvDGFx8AyKbmYy0eBFUvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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

On Sat, Sep 13, 2025 at 03:30:31PM +0200, Danilo Krummrich wrote:
> On Sat Sep 13, 2025 at 3:02 AM CEST, Joel Fernandes wrote:
> > Any chance we can initialize the locks later? We don't need locking until
> > after the boot process is completed, and if there's a way we can dynamically
> > "pin", where we hypothetically pin after the boot process completed, that
> > might also work. Though I am not sure if that's something possible in
> > Rust/rust4linux or if it makes sense.
> 
> We can't partially initialize structures and then rely on accessing initialized
> data only.

Yet, that is exactly what the pin initialization sequence block does? The
whole structure is not initialized yet you need access to already initialized
fields.

> This is one of the sources for memory bugs that Rust tries to solve.
> You can wrap fields into Option types and initialize them later, which would
> defer pin-init calls for the price of having Option fields around.

I am not denying the need for pinning. Also regarding Option, just thinking
out loud but if something is optional temporary, maybe needing a new type
like TempOption, and promote it to a non-option type later, I am not seeing
that as completely outside the world, if there is a legitimate usecase that
needs to be Option temporarily, but not later, what's wrong with that? It is
"Optional" for the timebeing, but not later.

> However, we should never do such things. If there's the necessity to do
> something like that, it indicates a design issue.
> 
> In this case, there's no problem, we can use pin-init without any issues right
> away, and should do so.
> 
> pin-init is going to be an essential part of *every* Rust driver given that a
> lot of the C infrastruture that we abstract requires pinned initialization, such
> as locks and other synchronization primitives.

To be honest, the pinning concept seems like an after thought for such a
fundamental thing that we need, requiring additional macros, and bandaids on
top of the language itself, to make it work for the kernel. I am not alone in
that opinion. This should be first-class in a (systems) language, built into
the language itself? I am talking about the whole pin initialization,
accessing fields dances, etc.

Also I am concerned that overusage of pinning defeats a lot of optimizations
that Rust may be able to perform, especially forcefully pinning stuff that
does not need all to be pinned (except to satisfy paranoia), thus generating
suboptimal code gen. Not only does it require redesign and concerns over
accesses to un-initialized fields, like we saw in the last 2-3 weeks, it also
forces people into that when maybe there is a chance that underlying
structures do not need to be pinned at all (for some usecases).

These are just my opinions.

thanks,

 - Joel

