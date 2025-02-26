Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68BA46FAC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 00:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A425310EA0B;
	Wed, 26 Feb 2025 23:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GjXONNDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9285610E9F7;
 Wed, 26 Feb 2025 23:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8ipJIhEENF/6MhrI0snQWcpjCejMbSzgoNUxtmSzUwizj7HieW79AyR+DEAVPFvuaRAuHSzi2w2T/YeygG102K/2m28MRntThN5rd2TUjSBvZ6+RPgknHgp7LOfLgPW5hWRWUM9jbkBu2k66WzGaDgbBIg5YhRdXL/KLpvY277KBVmeoo0EbJJ+D5NSV3x3s3EnaD47dn1NtWX0cn26P9cdW0fK6t7sKx7DiKIz6e46SlQYd7TrHPnNMxvFAFdoPzwbt+z6HJ5aAFTKjfY3p7vehhhVoJFlAiiFsjkeL+wX4W9AALcyKTs7nPq0+aDWdVJboRc3RlqTf/xtr6K1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHBHvFhVum5dof8QZtCbUerTYJEBkAW98R3V7wMpViU=;
 b=CIkSrnRaGkqTxsEkcXU1yB3LTEIGz0pmGqyFF8gYIp6amSwCj9fPRyWOKfUrBQYtK4+J2Ge1mxzCpncEtw6d+m2BJd/LDYUGf23q5vNDGNoE2xX9DQdNq8TSi+6YuKJFrVdRKwCKJYplUpLf8Ox67J/tFvHpcrr8/EO0qna0svGY/gW0MQZDBxes9kLfCKbI80FbovY6FmLlsXHjoVcrg10OE5exsGlx8oJ4xT4MNugulnsks/Krfymw92Nt6psV364WvrvnNjTcyIDYypwtPP9HxXAv0QG9P70Z4u7Cc5pxb/uehghqAPphbbZWz/QrdJAVnrdTtpCFwJFYWrpuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHBHvFhVum5dof8QZtCbUerTYJEBkAW98R3V7wMpViU=;
 b=GjXONNDxywc6AhLxMZs6XPHnAS2TrPqu88VsWvBIX2I/CKweIQ32rFHj9ANmuwQ3x1z/ciAjQW9dPjifwecHMyrXXR2uC5jziVBA+So7CjB2lg4xcrK5Hi/974BA0Xm/TXNvszwG6XYS+XMlihjVIQ1UxlU8LKKPzEjBhoE5n2dwXBEh9Gs27mVIRzR+TOzweiizZIY/R07NlrvhIPxtuGS40Q5VTVpCtx94eUAeUcNT3n4mEYZUtrAwOZiKHbX3wMOYNQZ9+FoZKIxKXL3T6iMpxNQYbZsDDa8GRWTEbVUNWlS/mRlciaW5Yw4JQSXcjvzxpR17ATR/yGsX52R1QA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB9345.namprd12.prod.outlook.com (2603:10b6:8:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 23:47:37 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 23:47:31 +0000
Date: Wed, 26 Feb 2025 19:47:30 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250226234730.GC39591@nvidia.com>
References: <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7-IHgcVVS8XBurW@cassiopeiae>
X-ClientProxiedBy: MN2PR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:208:23e::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f1d868-f4a6-42a1-bb3c-08dd56bfef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RAXoN67TTnoqbIowIgZEOUrQ1vLde052lMGcolWW8jWwFZRVvuuo+lAPtfY3?=
 =?us-ascii?Q?0kCCAguKHCEQ1vE2pMUNNa1ZtT323QghbBFn7xHQ9cqxtwiWcz956OseJPVe?=
 =?us-ascii?Q?F7MT4FfXs0uM7pEj5uRVT5hpDzZGA8CpmnAD7IgLKpRi2gBSrwsx49OkfFgs?=
 =?us-ascii?Q?psBpbwySDsRoU7pwaPvVoZxQh/9W9aM8YQiyZrJ4Z1giWpCe58V8jGAWcX7n?=
 =?us-ascii?Q?WHVfSqFgqzSDZv3dsilhI03yh0BlODLqWbwGNuCavqu9o4lnMtL50/k07O8Y?=
 =?us-ascii?Q?46yjpXUnXcs2d1YWgRlSNI7LMtWAKqDiJfGZ0wWcLTwGlV6gWjc0Dkzc5Mlc?=
 =?us-ascii?Q?Ri/Orp3W1lVpgnnHJt0CLzgQvzWQm6qs64DOGTRH4zZKVd2GhNS97KAkowK5?=
 =?us-ascii?Q?ViAA4v8wShNLseFlaUX/CjwPRvxUaFJGyJfuWHhQ2vSKjhYKhe1jvLDH/YqJ?=
 =?us-ascii?Q?mkQpOMqIjI5lqpkcJLUAVuhuzTbi/BboSSBFOHO5UQKDGnJZbEpFlgwZqzJ8?=
 =?us-ascii?Q?HwLZkPDeTlRFPQZdRn6fAUx6yahQuCuNgsUysaUMnEkhVMu1YflXUgLjxxi7?=
 =?us-ascii?Q?4us4Sh/dRYh2EQ+ALs0dsbntv3GJsTEC9Coj6HRb1LLJrd3msgYHZxL/CAlD?=
 =?us-ascii?Q?uIdKEd4erR+2IwG/7MCGddmWKhQZO2wZvHU/JBy5fn+YP6aqowLlU+N/nmNt?=
 =?us-ascii?Q?PyJu83zu48BTaSDSrIaXu5I8ml3LJ0BRUWdh2wD+4daq+KnKxw8pKpG4Tb8B?=
 =?us-ascii?Q?g38ypjJe7J337PI4ObKB6EiJojVHwDImiF3gWnhuBbBAw4Km8ahAdTdD6WZS?=
 =?us-ascii?Q?sbvdTN7AOEM4W56sXX17prpAGZuii3Udb+v3TsxZbltiv/VVoP6pH7K+vJeq?=
 =?us-ascii?Q?JQjQrOR56e/yK9lhyqAXjdEXzpZ8u+wPK4JSMrjmgAsevHTagxRBcDtnXjJX?=
 =?us-ascii?Q?m+iEVm82bJ74EUbQQO2GoVLW2xGsP0juZX4ARxqiR3/q+8wZNcl4rgIl/dLg?=
 =?us-ascii?Q?1OPwZKP/W3QKK22YVOB4dqbd1zOLgSGNLELzKgCGA464bqldoXJW4vzQWlIB?=
 =?us-ascii?Q?s3cNxcdgR6eLCuZC/lRiICNiejmwGDgdh/1dEMB0PW4EgE4nKPtVhPGArj48?=
 =?us-ascii?Q?SD0hJzm5W84mRJFi1m8K8EJJvejnPSCMXXcghIYjkrXsE/3fA0GuCqXEIwKE?=
 =?us-ascii?Q?zkiaSBB19RKi5SJKIl0HEmN0Pn/QDPE39ifIkCMXv60xinWx8gppzAmkFhVY?=
 =?us-ascii?Q?8e2/5Eh107W7xkaVY3dUYUvjICBRerqY2A86Pi37XvOf4Od/r/xBGi3bsRVT?=
 =?us-ascii?Q?pLO7G7/Q+aRqoOnYjWurFUOYtBZ6jedhBfervVR/jKDo+ErSH6fqno7ccfdT?=
 =?us-ascii?Q?rrnxHfa2ECpGwXAwNSTlb48Kmugo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bsAkToUYLeN559RvJ1GZuFS76Tfeyy7WrBnNlTUOQ+Y6ghs2gGjahtRVPjbC?=
 =?us-ascii?Q?uz5sMF1cT4ai97aDKEdkIP3LpuHXO3mDornls1HLH27HaeWGj3XCiqfjwp+s?=
 =?us-ascii?Q?jwIpofrML7XJroMAFN2NaZYYCeY+tkzUwYKbXkEiIyRIimOx21BT2sTlMsPb?=
 =?us-ascii?Q?40JjJpZPkQ3x+G+uvVEquUh301qiXFU97mdg2+tksfdmmInGHnmX7/R56sgC?=
 =?us-ascii?Q?ERQ+gpHS4swJGsma+aX+zcJpjOzDz6snEpIa1pODD54Fjlw/19RUkGbszKz3?=
 =?us-ascii?Q?Af5mZTrMvjq/FLQPx4ryhmzONYnIIuvdDbQyCvzUro4TvFkPINm2plP+JKOb?=
 =?us-ascii?Q?ApS174Htf0+BuwkRFHOlesQvBcaOefQKqfpFrjGrX7cSDwiWRfZwTrAlUbe/?=
 =?us-ascii?Q?GLDILftaXU5Ri6PzFVQAuFJdfG3jlQw8jz/4Row2GixSkgKJD8eS1j1SkemE?=
 =?us-ascii?Q?m4Dexsaygs+9iEqKEzkDs0h41LkPvxLd0lXXMEt+jhB1IEAZ2zIXI4Yn7lpp?=
 =?us-ascii?Q?quYeR8I47F7zsXZS3QNxsKvRXRQ95kJD0bDlRywdh6ufvWvU/Ua4wOEa+P+P?=
 =?us-ascii?Q?bwTieGmM8t72q5GtAiwMCl5wHQFl0oQRhqgxTvuoBJpmodzyzq4a3bkifgUA?=
 =?us-ascii?Q?TwtNU8b5uVSpaxaUB4ADmAMk7oACcFbi+zWUFMdlNS1qNMFrBtYiyrprfRUJ?=
 =?us-ascii?Q?8Oh9CxkDQgVnRxdr9JNEDkr/AoUphmSkIbkHTalk/JgGucYXRCw2keUv1wCl?=
 =?us-ascii?Q?h4PXWpmJvXwnlIumyEv/H5INE0Mj5HIOAFd1xeP8MBj70YKnQf3MjCLMPPHz?=
 =?us-ascii?Q?2TdeF/IC7JaI2BJcrGeAMIOoBwF2NHPzF939NDhd+L3h9y7B8/Uhz6Kx13Cs?=
 =?us-ascii?Q?BUO10WKCTMbtgdKxWwuK0WLzaD0G/R9zYaHJWcwmbHzjL34CT+Vcip60C9aM?=
 =?us-ascii?Q?+0Lx19wMCUdb4CcS/1wTQe+UctnG+WveHYNFq1V1SegNGsxAz2zJwa4GcpH4?=
 =?us-ascii?Q?SUDN+yi4qUWsL9kLB/979lMQTjZstzAVj2LvzhjcQJlmuTswm8D/CKjDfP1i?=
 =?us-ascii?Q?zLklbKcxwHzaY98iKdqlhy6AVab/o4vPP2Gkqzr5wuiaOO6jo9p53ojf1L/b?=
 =?us-ascii?Q?wjIvqaAjvlq7fpbWxLkk/fbz7iBKcmPjleyLRyPixl5XmgXmcuEc2UDEHQtg?=
 =?us-ascii?Q?EcEYiTsyZnHm7W+3L/lJ7OoV6/Wh3miMQ/ZH94CDe7DuBMw+A8gxK5uMJxHo?=
 =?us-ascii?Q?Ynm26NRlvmbhW1IgwpWph9Yo0YNE1Ij2cy8kNKuxwc9nZKTjizsIBgXjZpiV?=
 =?us-ascii?Q?rHrFPsJj0gohNlqIwuim/aXUxZWBQ62g6nkISHZlD91WFZC3skXFtCN+G7JL?=
 =?us-ascii?Q?rPipQYJ5rxJWDZdLcTa7tC4Sqib3ZTQHWQBbQkn44t1PRTcgA4X0CMB7FL9b?=
 =?us-ascii?Q?UOP+ULRCMk14tbDWItftA9idjm+yPwRdtu3fuDhx85uAyW0Iln66OFUfVC33?=
 =?us-ascii?Q?FCG5ReQ7aoba0IXNNsIUsEXpAw0WAmuirOvpRlTyKI/nTUGFNPLJwrLV/Ttz?=
 =?us-ascii?Q?DiG4A+lzJwFtt5jeik0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f1d868-f4a6-42a1-bb3c-08dd56bfef63
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:47:31.3809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTKvvc4n4R1fWE1QoNmx9x6JL8V77LRnBCdT/z3nIatP/JJxVKrECM9Cl1Gp+8x8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9345
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

On Wed, Feb 26, 2025 at 10:31:10PM +0100, Danilo Krummrich wrote:
> Let's take a step back and look again why we have Devres (and Revocable) for
> e.g. pci::Bar.
> 
> The device / driver model requires that device resources are only held by a
> driver, as long as the driver is bound to the device.
> 
> For instance, in C we achieve this by calling
> 
> 	pci_iounmap()
> 	pci_release_region()
> 
> from remove().
> 
> We rely on this, we trust drivers to actually do this.

Right, exactly

But it is not just PCI bar. There are a *huge* number of kernel APIs
that have built in to them the same sort of requirement - teardown
MUST run with remove, and once done the resource cannot be used by
another thread.

Basically most things involving function pointers has this sort of
lifecycle requirement because it is a common process that prevents a
EAF of module unload.

This is all incredibly subtle and driver writers never seem to
understand it properly.. See below for my thoughts on hrtimer bindings
having the same EAF issue.

My fear, that is intensifying as we go through this discussion, is
that rust binding authors have not fully comprehended what the kernel
life cycle model and common design pattern actually is, and have not
fully thought through issues like module unload creating a lifetime
cycle for *function pointers*.

This stuff is really hard. C programers rarely understand it. Existing
drivers tend to frequenly have these bug classes. Without an obvious
easy to use Rust framework to, effectively, revoke function pointers
and synchronously destroy objects during remove, I think this will be
a recurring problem going forward.

I assume that Rust philsophy should be quite concerned if it does not
protect against function pointers becoming asynchronously invalid due
to module unload races. That sounds like a safety problem to me??

> We also trust drivers that they don't access the pointer originally
> returned by pci_iomap() after remove().

Yes, I get it, you are trying to use a reference tracking type design
pattern when the C API is giving you a fencing design pattern, they
are not compatible and it is hard to interwork them.

> Now, let's get back to concurrent code that might still attempt to use the
> pci::Bar. Surely, we need mechanisms to shut down all asynchronous execution
> paths (e.g. workqueues) once the device is unbound. But that's not the job of
> Devres<pci::Bar>. The job of Devres<pci::Bar> is to be robust against misuse.

The thing is once you have a mechanism to shutdown all the stuff you
don't need the overhead of this revocable checking on the normal
paths. What you need is a way to bring your pci::Bar into a safety
contract that remove will shootdown concurrency and that directly
denies references to pci::Bar, and the same contract will guarentee it
frees pci::Bar memory.

A more fancy version of devm, if you will.

> I guess you're referring to cancel_work_sync() and friends as well as
> destroy_workqueue(), etc.

Yes, and flush, and you often need to design special locking to avoid
work-self-requeing. It is tricky stuff, again I've seen lots and lots
of bugs in these remove paths here.

Hopefully rust can describe this adequately without limiting work
queue functionality :\

> But yes, once people start using workqueues for other modules, we
> surely need to extend the abstraction accordingly.

You say that like it will be easy, but it is exactly the same type of
lifetime issue as pci_iomap, and that seems to be quite a challenge
here???

> Other abstractions do consider this though, e.g. the upcoming hrtimer work. [1]

Does it??? hrtimer uses function pointers. Any time you take a
function pointer you have to reason about how does the .text lifetime
work relative to the usage of the function pointer.

So how does [1] guarentee that the hrtimer C code will not call the
function pointer after driver remove() completes?

My rust is aweful, but it looks to me like the timer lifetime is
linked to the HrTimerHandle lifetime, but nothing seems to hard link
that to the driver bound, or module lifetime?

This is what I'm talking about, the design pattern you are trying to
fix with revocable is *everywhere* in the C APIs, it is very subtle,
but must be considered. One solution would be to force hrtimer into
a revocable too.

And on and on for basically every kernel API that uses function
pointers.

This does not seem reasonable to me at all, it certainly isn't better
than the standard pattern.

> be) also reflected by the corresponding abstraction. Dropping a
> MiscDeviceRegistration [2] on module_exit() for instance will ensure that there
> are no concurrent IOCTLs, just like the corresponding C code.

The way misc device works you can't unload the module until all the
FDs are closed and the misc code directly handles races with opening
new FDs while modules are unloading. It is quite a different scheme
than discussed in this thread.

Jason
