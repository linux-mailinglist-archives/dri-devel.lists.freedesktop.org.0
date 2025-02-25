Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27AA44E3B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8171D10E7E6;
	Tue, 25 Feb 2025 21:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BWSE2bIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157EE10E7E6;
 Tue, 25 Feb 2025 21:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fP82h7LcEhOpr4wX8dnDanYiCBPNqL96GZFbbmB3v9GffM6stfxPbkkNd7InFbL6aLaoG3aUg4lQeaoRweL0yfyxqFnuhOo/OIif4T952YcldIxeP1p8SIDI4uUxV/fWXoaV7Uwr3A3uVq1OIXp7i7zOVTMV0gSPLQ9vC+QEWdxlOTXHidOqnCAGNis4BLt/1/Hih0AcOhERMRBNFleXpzbW4kz33rDJE7Z9Vz2K/kXzstWR4qBijnj6MLwB3KBrJLA/SvfpnGREHorb7O+GsoXkEK1oqvPXAqha+HeGDdlL0aItvUTQU6JlCBXgZUL3sGXZOFdC4mFzQe0O6JDtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/JDlv985s7SMkDyrawNWQM/qQ+AzbeSVAc0b7mQ9Bo=;
 b=aZaWmBKOVuMT8Ju/mQc1eMU8oYi3idxFRQ2Rx4IOiozbKB5f12+88DfSZ0pET+fFeeRPFOnkjy2QFs5vChnb5aI1rm7jS4zj+b/pnu1Pg1AfSqbNbEuOPe7slVZKw3DVQ085juOswv6P9PfLiynAUq50VaTzB87TFaMq1B6WmpTn6vJPBrLHGoXg8V/uq/UReTBFFWTKOgYEJAO12z8ttWA0NgH4r4grMD7uLMhM1lL/wiv8pT7Oq4g5nrejYUgA6f0KKPXsLjztfxtJVUylJPkjPBpidmMnvGAZ7rk6o8LYCKM4IR55yDNDaqCv+ycOlTDcXZnkCL7NvRy0D5bNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/JDlv985s7SMkDyrawNWQM/qQ+AzbeSVAc0b7mQ9Bo=;
 b=BWSE2bIzzDUtgdfY3pTphBF8sBLZ/S81KStdV6Nezo9kEE003sDZXo5ihj8+RCLuAvX6CpkukRKel2bIUnLRUc4+bnMgKzvPv2w6IgzhoFXxBrt5b7CUv9giABmIaWiOg1DZ2kFON7xdmJ0iwXvRLOA4WMAIy/OffwcdydW+CsoBa3BJ5bvIIixTmsRZCDAN8AjzwXEtMimMQobbWmKyVC1kKLDnMC1/FuEzpHctJeljTFcqKhLsRnXfech566+P6Qb85mye1PE2qlmr/c9nXjR6LU4ESpgeSVQU49uZjc65INXWPW3HDr8h7oXIwi+nuzhgshdPUh91ksfVUMwTZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 21:02:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:02:30 +0000
Date: Tue, 25 Feb 2025 16:02:28 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250225210228.GA1801922@joelnvbox>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z73rP4secPlUMIoS@cassiopeiae>
X-ClientProxiedBy: MN0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:208:530::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9c7ef6-dd9e-4271-43e3-08dd55dfb75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cG13QlN2croAkAZi1497K3iB35kpgmV6DuyLPkCJ1KFTzcN9tbGiljMZO1jJ?=
 =?us-ascii?Q?9gij6uD3XJXdwEJEMFhNjSOsybROu71PwB7/T+deB1wA0kFw4UbadDQs0khw?=
 =?us-ascii?Q?F9zYcS1zpMAwmxpsWmf+j6T9rrJrpgr7J9fRuq7pXX5nRDQ6MtFgU4Nd6fzU?=
 =?us-ascii?Q?Pg7keeAs5409xWB7VHMlA7GA+XH/4ZTl5BajdA7Y8s6ScaEBSEB3zu3TcYUm?=
 =?us-ascii?Q?TFgM0MAQ7X55j4h3M+i6kfpxvf6y6ZcIUusaRitrwxNCv/SLRAa+EVEHfN96?=
 =?us-ascii?Q?/OpYP3qvBJPPayv8QbAEV+sfQYCO20IwO0VeHI7iuV3aPPW79nD06RKZSk6c?=
 =?us-ascii?Q?hu0tNWeje7Z9bQ44NXcY8o2WY4jrgywTZkXxhKxECqAZn/slEyhZtFdt9yFK?=
 =?us-ascii?Q?VvnK5nkHu03kTK1ruhQJmAswKaelK5fKRsrZ6COCoQSU5c39do+/Y0TUCgWR?=
 =?us-ascii?Q?b+u5hRE6lGDloH/W5Qyi99YcktgcQ5UU0Ol6gwOM8dWIT26YGdSxW8lU6LVx?=
 =?us-ascii?Q?kdsGh+XEEK+Lk7Wt0CQyYmGydt5zPy1p/Db6vY/WwwWKCOwbEZ0Sy0httEqx?=
 =?us-ascii?Q?dqdadOftcw+33ugfxvoX/K5dp1SM9xSYKblQeMWSEl6Nkw7FFfKRGCVzRIN2?=
 =?us-ascii?Q?23mAI9JOUqHTy5/aL69ob603KTXqFOEsvqMxYDqgzu3yN8GYK4xzpLLVoc2Z?=
 =?us-ascii?Q?C/GZ9X/Kg+LSesNZdgD1hOM52H/HRqmQBKo2oDuy0jjXqhG6OQ6jkb+cWido?=
 =?us-ascii?Q?fFrdfzvNZYxdHH0J14Et1KXZW0quDm4qbm0AqdPZZ4SqJleSJV6Kh80TRI1C?=
 =?us-ascii?Q?58wYwEZ7l/KIA0NnBe/i9NvzR0tFhLulhIwQ4+kOsVMVWU/AUKWLK1gXclHL?=
 =?us-ascii?Q?cQHgk0umil8tNUfi6jtLXIe7rNQjrkv+bApX16MV3OyrbnfOz5psL24sHXn0?=
 =?us-ascii?Q?P6r9PvnlY/dD4xCbTmZX9tJh/ssPi3OesJdspabSo3Sn+PQkwReNnfoddlmW?=
 =?us-ascii?Q?gAhX4KdZxfrVAvshBxDkx8YGDvBozlsQFlckhmuyQH6G1Hvw1I77ILjMcIig?=
 =?us-ascii?Q?F2xUrVJNRc6G9Rior9/Y0tBMFjCIzf6mCq+OZaWhAwjXgkLTcRs0UsaYFW/i?=
 =?us-ascii?Q?F7lEGqrTVdbjwNb5tX/9Px4+2tOCVeS9Vk/fj+vtwCwHOUFEOq0TXfhTUzDi?=
 =?us-ascii?Q?Bleqb3NRhOJVSSbAm9NVSFwTsWWL7fan/4/XRezPwSD4SukKRBb1Z/j+Hdm2?=
 =?us-ascii?Q?wo2lq8vk13qIcUyf+rF1y4j/Fksr6CVhl92ci3G7D0FHSqJl2B242UPg+khb?=
 =?us-ascii?Q?QW6vyOx3MWrqABhm7jczdOcEERFOJtX5C/J6g2iND4rF3+NZbHotwlsOTHdv?=
 =?us-ascii?Q?PJGQySy7mhCAF1k9YNKq8Baz3yWu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTz5Y6D+rvRIE9rB+SMu/NOTM83sKPNXHC5l3P2lHT5tZAFzXqYjv860Mcoc?=
 =?us-ascii?Q?cNEMAzZVTCYKyDNIdxQx0+f4aYoQb/4f3feqU79U3QL9RSHiD6FoT9O0p3P1?=
 =?us-ascii?Q?HyhfKc1uh5g7X4yK3RBz71DYwlfYgfsnKJ38n14/PtSZuX3igq5u1oqAzK4T?=
 =?us-ascii?Q?Bf9RqA3xJBBn84QixJZwXIFt96AXwV5n3BJqDt57jBbm5BiQJJdH4hiwy1FE?=
 =?us-ascii?Q?VSyBQjjiAphihyr93R4uV+plgxUef3+KTWjeemNdpslaNJLaz105vLJqhlfi?=
 =?us-ascii?Q?6tRBaz0X/0sCCcJwxgqoYkZXskuSJz+CwaDvC/ga2TopEW2SH5q4dyIaL86J?=
 =?us-ascii?Q?oSmqaK8zZtWgVxfVzK3cbQjbmF7WgiOCi/pHlIg0vRubc9f3vCxBIkhvexVJ?=
 =?us-ascii?Q?FP8vDA0RBrL1wVMxy4DdKAQl7MoNqcHFdHR3166Gl+FTPAtLUktogO18e3c+?=
 =?us-ascii?Q?61LPZhLijmJpTlngT7DF6noCZ6QhIsHNni7h/zTS0ByWva8mzjVILnlrRqEw?=
 =?us-ascii?Q?UUC4OmHVq4msEn2bUlk5rtoQJ/O+iWHFTxfFW28jjyoS5GssLIzhKaXiAjFP?=
 =?us-ascii?Q?fG28+iwLQsAfvxBBdXXWwEj603T9iuCy2JdHznmWn8lH+lJqLsp/6ZW3NHev?=
 =?us-ascii?Q?n5rSrqeb6wCOXqEEQCspKGAbrmq7cfc7jLJsmc53gZFODODyMVkJ+pkFCAyd?=
 =?us-ascii?Q?gy2wcXydNWmsilGW2drS5To6zYmwRbPY2lSl346XnuXOiA+pGhIrObxltQLS?=
 =?us-ascii?Q?Wi/VmXO4Owcb26SEAWJK0jiNdZAsZ7wJMzgkLTGGyqtbrxwRxXldDIeuns6q?=
 =?us-ascii?Q?OKspkWk/ovIUPWnNrsRQ5SB+HetbGfqsT6jmJShpyf6rAJtbljE/7Xw0q/li?=
 =?us-ascii?Q?SOsqWTk2SUTFm61saJEDAFKiVrghsLaaJceEgkvIyI9i+aHtwVEEgP6ul9f7?=
 =?us-ascii?Q?U6DzZPzcARWEfi86BVvyeC+WEWVP91LIKRhw/g6HVLfJDW1lSt6XkxebdiZp?=
 =?us-ascii?Q?MN6YPauaMJFaPI0d/tZVWpx5HtoEPwri+h/Q90n67t506UaVW65uvm3BvjuZ?=
 =?us-ascii?Q?cS9W4huJRb8HQN3Xd4WUpV75adMy0xpMIz1BCDz3X9bQOEiodWaQuKp+DxsC?=
 =?us-ascii?Q?a+pCVS2nXs3ga6S1JzzI61uJRVdJlb5QNU76R1Rl29A98J/wsSXkuhyEKr8u?=
 =?us-ascii?Q?XcSjpR0oqDXQapwrppSAk2bIx0Z+atU1/AwhV1CsJpU/62ksBVwsUPftl37m?=
 =?us-ascii?Q?DyWkix6/rrl70aWvl8dBrEEqRwZncYuC1lfJqU8ePASqXsvXp4VaVganirnF?=
 =?us-ascii?Q?42n/Z+eNnvNvjfb4oZ/9CKjE8TNGQEVpPHeK5gMgtqUnz9Sh2JFUUwBbHKD1?=
 =?us-ascii?Q?FOHPK4bjPTZMfqECHS1T2NBvZXdToD90Z4YiN2F2ege3RjWDGDEnwkoSgBUX?=
 =?us-ascii?Q?xiEK77wXpQRe1n0hu3mzJ0TnZfw4+6xWuXghVMFadkVdWY4dfU+QxnRNqLH8?=
 =?us-ascii?Q?7hpNU4oo45L9lOR/GjZmSm+lv+J9V0OWlSM0ezD0FSt17TzF7WNroWblYU1+?=
 =?us-ascii?Q?r3UFTex9ps465dUD3UaewZWry1Rpx1Awh+xWeukD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9c7ef6-dd9e-4271-43e3-08dd55dfb75e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:02:30.0536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VnS5BsuIDwkp/w4nE5uxcg7Xpab2mSS/5NmPSNKpVk7/YjfnBatXb2/9tsq2t3d67w9/HA35vDletdmrSaOvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576
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

On Tue, Feb 25, 2025 at 05:09:35PM +0100, Danilo Krummrich wrote:
> On Tue, Feb 25, 2025 at 10:52:41AM -0500, Joel Fernandes wrote:
> > 
> > 
> > On 2/24/2025 6:44 PM, Danilo Krummrich wrote:
> > > On Mon, Feb 24, 2025 at 01:45:02PM -0500, Joel Fernandes wrote:
> > >> Hi Danilo,
> > >>
> > >> On Mon, Feb 24, 2025 at 01:11:17PM +0100, Danilo Krummrich wrote:
> > >>> On Mon, Feb 24, 2025 at 01:07:19PM +0100, Danilo Krummrich wrote:
> > >>>> CC: Gary
> > >>>>
> > >>>> On Mon, Feb 24, 2025 at 10:40:00AM +0900, Alexandre Courbot wrote:
> > >>>>> This inability to sleep while we are accessing registers seems very
> > >>>>> constraining to me, if not dangerous. It is pretty common to have
> > >>>>> functions intermingle hardware accesses with other operations that might
> > >>>>> sleep, and this constraint means that in such cases the caller would
> > >>>>> need to perform guard lifetime management manually:
> > >>>>>
> > >>>>>   let bar_guard = bar.try_access()?;
> > >>>>>   /* do something non-sleeping with bar_guard */
> > >>>>>   drop(bar_guard);
> > >>>>>
> > >>>>>   /* do something that might sleep */
> > >>>>>
> > >>>>>   let bar_guard = bar.try_access()?;
> > >>>>>   /* do something non-sleeping with bar_guard */
> > >>>>>   drop(bar_guard);
> > >>>>>
> > >>>>>   ...
> > >>>>>
> > >>>>> Failure to drop the guard potentially introduces a race condition, which
> > >>>>> will receive no compile-time warning and potentialy not even a runtime
> > >>>>> one unless lockdep is enabled. This problem does not exist with the
> > >>>>> equivalent C code AFAICT
> > >>>
> > >>> Without klint [1] it is exactly the same as in C, where I have to remember to
> > >>> not call into something that might sleep from atomic context.
> > >>>
> > >>
> > >> Sure, but in C, a sequence of MMIO accesses don't need to be constrained to
> > >> not sleeping?
> > > 
> > > It's not that MMIO needs to be constrained to not sleeping in Rust either. It's
> > > just that the synchronization mechanism (RCU) used for the Revocable type
> > > implies that.
> > > 
> > > In C we have something that is pretty similar with drm_dev_enter() /
> > > drm_dev_exit() even though it is using SRCU instead and is specialized to DRM.
> > > 
> > > In DRM this is used to prevent accesses to device resources after the device has
> > > been unplugged.
> > 
> > Thanks a lot for the response. Might it make more sense to use SRCU then? The
> > use of RCU seems overly restrictive due to the no-sleep-while-guard-held thing.
> 
> Allowing to hold on to the guard for too long is a bit contradictive to the goal
> of detecting hotunplug I guess.
> 
> Besides that I don't really see why we can't just re-acquire it after we sleep?
> Rust provides good options to implement it ergonimcally I think.
> 
> > 
> > Another colleague told me RDMA also uses SRCU for a similar purpose as well.
> 
> See the reasoning against SRCU from Sima [1], what's the reasoning of RDMA?
> 
> [1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/

Hmm, so you're saying SRCU sections blocking indefinitely is a concern as per
that thread. But I think SRCU GPs should not be stalled in normal operation.
If it is, that is a bug anyway. Stalling SRCU grace periods is not really a
good thing anyway, you could run out of memory (even though stalling RCU is
even more dangerous).

For RDMA, I will ask Jason Gunthorpe to chime in, I CC'd him. Jason, correct
me if I'm wrong about the RDMA user but this is what I recollect discussing
with you.

> > 
> > >> I am fairly new to rust, could you help elaborate more about why these MMIO
> > >> accesses need to have RevocableGuard in Rust? What problem are we trying to
> > >> solve that C has but Rust doesn't with the aid of a RCU read-side section? I
> > >> vaguely understand we are trying to "wait for an MMIO access" using
> > >> synchronize here, but it is just a guest.
> > > 
> > > Similar to the above, in Rust it's a safety constraint to prevent MMIO accesses
> > > to unplugged devices.
> > > 
> > > The exact type in Rust in this case is Devres<pci::Bar>. Within Devres, the
> > > pci::Bar is placed in a Revocable. The Revocable is revoked when the device
> > > is detached from the driver (for instance because it has been unplugged).
> > 
> > I guess the Devres concept of revoking resources on driver detach is not a rust
> > thing (even for PCI)... but correct me if I'm wrong.
> 
> I'm not sure what you mean with that, can you expand a bit?

I was reading the devres documentation earlier. It mentios that one of its
use is to clean up resources. Maybe I mixed up the meaning of "clean up" and
"revoke" as I was reading it.

Honestly, I am still confused a bit by the difference between "revoking" and
"cleaning up".

> > 
> > > By revoking the Revocable, the pci::Bar is dropped, which implies that it's also
> > > unmapped; a subsequent call to try_access() would fail.
> > > 
> > > But yes, if the device is unplugged while holding the RCU guard, one is on their
> > > own; that's also why keeping the critical sections short is desirable.
> > 
> > I have heard some concern around whether Rust is changing the driver model when
> > it comes to driver detach / driver remove.  Can you elaborate may be a bit about
> > how Rust changes that mechanism versus C, when it comes to that?
> 
> I think that one is simple, Rust does *not* change the driver model.
> 
> What makes you think so?

Well, the revocable concept for one is rust-only right?

It is also possibly just some paranoia based on discussions, but I'm not sure
at the moment.

> > Ideally we
> > would not want Rust drivers to have races with user space accesses when they are
> > detached/remove. But we also don't want accesses to be non-sleepable sections
> > where this guard is held, it seems restrictive (though to your point the
> > sections are expected to be small).
> 
> In the very extreme case, nothing prevents you from implementing a wrapper like:
> 
> 	fn my_write32(bar: &Devres<pci::Bar>, offset: usize) -> Result<u32> {
> 		let bar = bar.try_access()?;
> 		bar.read32(offset);
> 	}
> 
> Which limits the RCU read side critical section to my_write32().
> 
> Similarly you can have custom functions for short sequences of I/O ops, or use
> closures. I don't understand the concern.

Yeah, this is certainly possible. I think one concern is similar to what you
raised on the other thread you shared [1]:
"Maybe we even want to replace it with SRCU entirely to ensure that drivers
can't stall the RCU grace period for too long by accident."

[1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/

thanks,

 - Joel


