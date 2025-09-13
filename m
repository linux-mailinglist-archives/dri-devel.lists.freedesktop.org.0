Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356EB563AA
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 01:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC1B10E20E;
	Sat, 13 Sep 2025 23:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YWRiNaxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7210E207;
 Sat, 13 Sep 2025 23:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4Lg0kBZ/3dK296dcmF/KWg/wZgIMASUAcQaxnFgHgrNbYtxfo4ATeAZ8/Js8iuNqu5bwXVhzMpAkOc3qwSD1VU+i22nBeYCdmYGAxT2eEF61ShswHBp2Pvhnq6m05BfJx/XDxeiOABGdBclE6YLQvyhLMgiBf+QjrN9BJsV/NxmsNY3BvP0m9hvgSVjU7Wbu6OD5UKhDV+PwWU4GNZxgdl4Awqaq6o6DWcq0Oj18oo6sjjJkN89wYCTj5nk9o/AN1qO3g+U2Vxc4EltNIRQMWygUI9LYvPMm8As5l0yrE27EFBU03lqXmYArsIfiDlab39CfW8/gtV2Yst8qZxjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AerM2TMwsuKYGx5bAEpyiucvrtTzEg676wbb5DnMqdk=;
 b=vQKPl3DMrvIuhg2SpyuRZMzKDPZWXghD+0N8cZSDHWPTb/LDR3UuzGFVmtdRBI6/Ws69PLjyokIeJzQ2Ca4uevm2L1jl3IUSkEJmnN6YwrLzU4Owmn7NorJFRL6VHCJFu2dxXC5BXq6qfvVfXcs2UvyznqMUggtqJVSuT1wsbjDkbLqVk7a5jMscnSU2/5OcB4FnWJcfV9s99jmjjr2kGvol3b1sn2yCSfnCBuOaMbUfOSv7LmmbTSoRfJZsU5Cz2mTWTHLJCa+kYm2LtBFUce/JG/o2u3X4k444Di365opTlNeYhFgufWLr1cSayGNaZi8YGXrzHHcoATbiaFqYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AerM2TMwsuKYGx5bAEpyiucvrtTzEg676wbb5DnMqdk=;
 b=YWRiNaxC8oQsTmbD+OI5vfkn32QQVtGA7YUuLKGowr57o9SV/de35RjVPbrxNV5k84D81k4xX5+OecK0Z6Y0hxLbSL7aj2ydEopFObKuYb2v9vuhJaLozFWzaRIgez44IwmMI2MEksZ5YP8ZHDN9aeL1IHkSRLwlpvW8O1fXOIRyH2U+fpvdYcoHohXS2o/PK63fNuEKKtPrEas5+t0gCuBDIw0+HxOTlq8+AbofJsf4tdFguKujzJpW4BxkHJfob8hSRq6NzPXuQyW9NkKyAuAXQnjpkmoausU/y8l4SqSQ9nBA6SRZfMDKGssJokilrXNDMM8Jcm0eVLOrSLsXXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sat, 13 Sep
 2025 23:02:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 23:02:55 +0000
Date: Sat, 13 Sep 2025 19:02:54 -0400
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
Message-ID: <20250913230254.GA1568515@joelbox2>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
 <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
 <20250913171357.GA1551194@joelbox2>
 <DCRXOMQN3Z20.2JCNP4BDEE79T@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCRXOMQN3Z20.2JCNP4BDEE79T@kernel.org>
X-ClientProxiedBy: BN8PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:408:4c::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 310d8bb5-6aea-430b-e919-08ddf319ace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a+knFJ+13oNGof7q+8nFYloj8ziSoKFGoSuXhRjwMXoaTGSjZAd1/nNEJ4EO?=
 =?us-ascii?Q?7K0Znvhc/sehPKMBKzMthkdE4rut/VFZuKYTh2Vm91UlVsM3eJmLDjL1QrbJ?=
 =?us-ascii?Q?O7VlbdNt688RVixa5bRy/qitpXgie/WtSsxqsak4tpdouCwwSfl1j/IKzAUo?=
 =?us-ascii?Q?mU1X6kmKmxktY1WCQOysLIBKiq9mG/xulyYqpQHkXCd4JmkJE6XCRX6v/Xye?=
 =?us-ascii?Q?9y6L4hrpfWBVhqA01dVCpU+f0i+AuYAIM43HHV19TVY9h7vNEYYE4fGk1Yve?=
 =?us-ascii?Q?r4YHsP7WOTBXPDKAWEN3iNeKeXCEzrwZ6auLuf5BCdQpBMsTyvqFjCdrUWUG?=
 =?us-ascii?Q?hFtXtrxvbhtI/Q3SkxcWAwGn+C35ZLxkyMrZE0eoIPo3B2p764Uou9gvhylF?=
 =?us-ascii?Q?EMeTtiziOlIDhbqMdS1VCydUdS87o/JENyAUObWLV16THcdMxGKw0twBB8ox?=
 =?us-ascii?Q?9rOJPx9yJbgci8cSAfWQloAmS09nC2TLNQ2ZSdufW4k6zJo+aQW0IW14FL25?=
 =?us-ascii?Q?35ih8nSDFM3zz5yr05Nvyw8zB//aZV6iE2ahcboLCoBPQwBn2xf/2RbyJGrk?=
 =?us-ascii?Q?ulJunTnFZkDgKZqUjicctdlAjiwyFYjicWATEZdZbRLMfMVlgHACxvl5sPLt?=
 =?us-ascii?Q?xT+Xlyxbew84O5talYUlEbeNNoH+9WMdmS01MVOuYvldlL2rj5T+XMtuv26B?=
 =?us-ascii?Q?HFk8iB0QutMWpDXarn/INKHq91DAS0zKfT8uqv4Ns/8eJBOyhH2VJj/DPa+m?=
 =?us-ascii?Q?baA3Ce7Q+Og73x0RwIBhEPr+hcqGZgnaC55N2I1AABpxEXrMKB5CRbcpgyEH?=
 =?us-ascii?Q?7/stMQ3fUot9usfyS2dcjckxobMnGGempkNcYY4CyD6XLUXyl20w7OXAewsT?=
 =?us-ascii?Q?SVB+mj3JL4ZxbviX+wy4X1t/uEArPwY0sVACPdmkEDm0mI6R4Gqq9uO9xtik?=
 =?us-ascii?Q?wD5it77Kgj/GDrlBS3UYkMAVOZDB/9xPZ4lfTtRhyUnsehGXzjlL3o/Ul/Hp?=
 =?us-ascii?Q?43tRS0CCvov9kAA1GXkkLstJdnfT3V+TcV9+aDMRuk13rPyKzzUyjmySOo03?=
 =?us-ascii?Q?DVPrD9alLdMZ3TcZa4NpClDHUWeUr6MAflr+ids+WpCnhJHhdechYzp+C/KF?=
 =?us-ascii?Q?EIyL3hDdUqqMVql6ylkDNVyVWZYBeQcXbquMg11loJFqim9XbpzF9nkdDvkp?=
 =?us-ascii?Q?+MRSZ7xqGVtFoYcjqBWBKrPe7mF9xyeEcHNLn86UR1AuIi8vd14dV1Jnl4zx?=
 =?us-ascii?Q?E04XJcklCw55G1lJq1YkV8GWdRkRq06lJdQfdkBqr2Tfru24fS1L/YLUOcxm?=
 =?us-ascii?Q?7MMpFMkM+yU1XymoidYRLfb1FrXzL98MnZ1LDLsfk8WW+Bk4v/hwMm5V7kvU?=
 =?us-ascii?Q?GNC1dkDZQnN/MPC9HH/VJYUANz2eNNJhuTeH0IzyxgA7kKaVm/qQOuK4RFUA?=
 =?us-ascii?Q?P6rfFxbLDfA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7w6mEHC8EAMD6HJVUNpahf6LuBTwqVi0mkEaiKtltz7J4nODZFeCcXVGutf?=
 =?us-ascii?Q?t32hdKHScJRBmx0Mv5SP77j+r0NbLHa+7qksh7af94kIKXH340+83IwmnPlO?=
 =?us-ascii?Q?RRhIN2tnY8OzhKMaRhhh/rcOqSwT5JagRq21HtFwT3aKgFCp8EPXk5/2D8Qk?=
 =?us-ascii?Q?wHgncV+u2TM3eWZdP9P7RnHVNirvXOZcXoKkwAXMCWPMPJ/+o2sjDXprcoX5?=
 =?us-ascii?Q?HW6Y1tNEFu9+f82to5juEKsvd6Wf2r1nq1A0dvPCHBZ19mCZbkwoTeOoNNz7?=
 =?us-ascii?Q?XEppVx7ZBnhU1RYYoXFTEdqfnMvrt1UISeWYX/7ttpyNwSv1g5oWfczp1OE9?=
 =?us-ascii?Q?C7RhAluKlWNq6/Q/44rqQNjUhV7/w75AkAfvdyDp+5V5QPJzCMEPbJlH4KRJ?=
 =?us-ascii?Q?K788bihMm0PywrdMSKz7cax6ym7s5E4vzMsR81wa7UtpgJJ5MPLlqkUESnfq?=
 =?us-ascii?Q?+uPV2CW+l9XrPml6O0ZLVDnX5x8lBZY8lr37i4JXWISax4vyGczG1Sgo3aps?=
 =?us-ascii?Q?M9uhof+gYTbjO2eyPeLQMgTKcCQMmiqPA4mnAtnUPtaoCTAXUrcvTOCD1IuS?=
 =?us-ascii?Q?BsOeIejjU9j+sbIZ/5+iJntFmDvTg+q4fOxlEf11DQnUXZxTZpcH/rxPIiRJ?=
 =?us-ascii?Q?P8bYWnadWWmP84hyHu4+BgtwKH+BNOZnVoZcS8UXJUsgGOkCUm48Rg0p7ySU?=
 =?us-ascii?Q?IqvETK+r8hVtB/CxKJDBdsQwFs9V+QT3BGY652CDS18NIHNPxAylPvyUWweK?=
 =?us-ascii?Q?uARP9i0qam/9CQDEVO9q3H4sJ5tHzHFLJiVxDKT9aMOwJVBZoNTTXEZr75Mf?=
 =?us-ascii?Q?dQpOvQeY4OQwnr9q5s+wXBFY5Lv7G3nj2N+RuAjYFX/xA1cD5rVH5GWpiJDo?=
 =?us-ascii?Q?Nzv6OofKfcWNwmf1VRkDCly2c1YEx6Xi1Y+r1mzm9U4B+2CZZ9SFLeLEU6RV?=
 =?us-ascii?Q?3oSXm1scBMYlaFnd07EZB6ezpFxUsgOLoz+X85gPMZZ8WDlUGny8PB98dtH6?=
 =?us-ascii?Q?NxHTj9tYqc1Dc9g4VDobGw2p68PxShJwoWb+cJFCxsYO/hK+06gA9zvQ7nSZ?=
 =?us-ascii?Q?XTugENEy5IONaOTZplAWBHN5W3p/GPjiMQRYWgwI04ZcA76n3WNBdHHdVXHv?=
 =?us-ascii?Q?Jj3b8ks3lup1bQmM/0nKYxTD5ZX1p8Nj5xmiAnx+OaMZ+Xb/PC+w9cT7P22x?=
 =?us-ascii?Q?wNeeAZVB//QHUPLpxzEuGSo1UPVGjSvH0CFnGt+73RK53S3iYoYxSvpwp9zO?=
 =?us-ascii?Q?WuUs3m2lpzntaZSEBn4sV8IheCFoY4eJtTPtp0FOkoDnNLr2yYSKn4CVospB?=
 =?us-ascii?Q?aB4x5XdeMqP0fVyZvEd1neEnh5WZc0a4XUzzssTbSpM7RHYJj9pQd0fa/vR2?=
 =?us-ascii?Q?/JsNmjqKL0MnPX5i3PWR41/+UveFEd92piToUZi+rD+leUdUPO+5NJtBZjVw?=
 =?us-ascii?Q?ZdOigDwpJdcV5Q0G6Xf8y4IP5nyyNmYgkbY4PuPGfcFqzoSBqfB+z4u3HoTW?=
 =?us-ascii?Q?NNWqrdOltUuTyxyHIIBQJfXLWTqSa3sY7o3flsQp/Qt47QFhfIrw6g4doGAo?=
 =?us-ascii?Q?2i1g0T8nz6qi3mMib9HD9hbFNloagsvDREGgOI0t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310d8bb5-6aea-430b-e919-08ddf319ace7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 23:02:55.8987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjHS44G+WFpuLQH02cVMdJPr6LRoXiaj3xcoySBDYAMfIF6RqJAoYzDrxKiWAEH63D8ryf9ng8ZZ59FCawEbcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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

On Sat, Sep 13, 2025 at 09:53:16PM +0200, Danilo Krummrich wrote:
> On Sat Sep 13, 2025 at 7:13 PM CEST, Joel Fernandes wrote:
> > On Sat, Sep 13, 2025 at 03:30:31PM +0200, Danilo Krummrich wrote:
> >> On Sat Sep 13, 2025 at 3:02 AM CEST, Joel Fernandes wrote:
> >> > Any chance we can initialize the locks later? We don't need locking until
> >> > after the boot process is completed, and if there's a way we can dynamically
> >> > "pin", where we hypothetically pin after the boot process completed, that
> >> > might also work. Though I am not sure if that's something possible in
> >> > Rust/rust4linux or if it makes sense.
> >> 
> >> We can't partially initialize structures and then rely on accessing initialized
> >> data only.
> >
> > Yet, that is exactly what the pin initialization sequence block does? The
> > whole structure is not initialized yet you need access to already initialized
> > fields.
> 
> No, having a reference to a partially initialized structure is UB. But of course
> you can have a reference to already initialized fields within a not yet fully
> initialized structure.

Fair enough.

> >> However, we should never do such things. If there's the necessity to do
> >> something like that, it indicates a design issue.
> >> 
> >> In this case, there's no problem, we can use pin-init without any issues right
> >> away, and should do so.
> >> 
> >> pin-init is going to be an essential part of *every* Rust driver given that a
> >> lot of the C infrastruture that we abstract requires pinned initialization, such
> >> as locks and other synchronization primitives.
> >
> > To be honest, the pinning concept seems like an after thought for such a
> > fundamental thing that we need, requiring additional macros, and bandaids on
> > top of the language itself, to make it work for the kernel. I am not alone in
> > that opinion. This should be first-class in a (systems) language, built into
> > the language itself? I am talking about the whole pin initialization,
> > accessing fields dances, etc.
> 
> Yes, that's exactly why people (Benno) are already working on making this a
> language feature (here's a first step in this direction [1]).
> 
> Benno should have more details on this.
> 
> [1] https://github.com/rust-lang/rust/pull/146307

Ack, thanks for the pointer. I will study it further.

> > Also I am concerned that overusage of pinning defeats a lot of optimizations
> 
> pin-init does the oposite it allows us to use a single memory allocation where
> otherwise you would need multiple.
> 
> Can you please show some optimizations that can not be done in drivers due to
> pin-init for dynamic allocations?

Aren't the vector resizing issues an example? The debugfs discussions for
example. You can't resize pinned vectors without boxing each element which is
suboptimal due to requiring additional allocations?

But agreed, it appears maybe this isn't as much an issue as I thought. I
think I confused prevention of stuff allocated on the stack from moving, with
pinning. I think the only other reason I can see, is to not to reduce code
readability if pinning is really not needed and if it is used, to add
appropriate code comments.

Thank you for taking the time to explain this to me. I really appreciate it,
and please let me know if I missed something!

 - Joel
