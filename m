Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB4A45098
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 23:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304F210E817;
	Tue, 25 Feb 2025 22:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NfSvOF3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D545E10E817;
 Tue, 25 Feb 2025 22:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLbBdFrwDu1FSuYsxYsCQYWA596pwWcBR2KP17YMI0goy+vTVJpJ0r5IR+lSF/VwftNtx6QThuIm863U0RsgKvl5lWmEkVZRg4TkfxSSPHwGR4x6OHQ+2wY5Dhr6MX0rgBqaCMBvXCpn711b4m/lnASO3I9RW3JtIrs3cm+T3dNcW+LvHNqtaWBdcIMdut2llIbNqspn6tkGyJy0u7sj305kVXsd8JJvUzwHjbHKWzu9WwWmS+2LLtj6POU4/3eijpQjpApxO38BGnU1YZMhOLxuKjQ63exQ0tow9nfQFn4BU2/NdYxft+RTF+ddp7whLWk43eJ10be11ae2oybiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSkCHC4WFWu+OgmeoWy997h9lRdsCE+ZTor58SiA5kM=;
 b=CQClbZDJSdSbR2YZZOINuIzn4tGuaxdUQjrzqEwPomYe1rU7YUTiWpSocV1J58qkHJO2bOlEvdXKhV0dppMnepIoEnZmeUbNe5luyvU6Qq9Knod1KTx94MTowJYsiNn2l81Dyz9vDLEVupKha/wceOKt9mPOScKebsAmHEiOGURt1iHQvXnwtqmDr/pHcFjksyrRgr3IU+DAWuXFQWARukaMLq5l50Z4Kpypk5WzLPmwmZXcy0jC4J/TzHGRS+r1F71oyfoPJTX0Yh6BQC1idIoQZtbnobwUc1iycRbTOPewh6yqe8ceSiHmWR7SKugtbKrv+c9N19rp9G5m1l+LhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSkCHC4WFWu+OgmeoWy997h9lRdsCE+ZTor58SiA5kM=;
 b=NfSvOF3g2HuMne84eKYN3ifPe69c2tViL+k9IwRgRJF0wLvTr54nyTpsRrYVj34eU7sb3mzgFXeDMQZmG0VdCmYLiOqZRxYIxeAFyyww9ItYr9jLl69YRMFToWK03PTLYcSAlqZxZK3fO5q0NRrE5iYJb0uyQfpAgXAb2/dpAmiuqgDZvw9ViRTZN2FqhIO7FiGd/UpP7qkoWxXLcH2fO5x8d29BXptHq6t8mAgtARmsLaHgmGvxHxs1Ka/F1mGmON9qMU6VUGFGlTtd0uNWqRyy4+e4S8L5JML2haBXOaMVgEdzIi4BlgXENRI/x2WCwco5E0HcpUCuaJXY4eGHvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 22:57:58 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:57:57 +0000
Date: Tue, 25 Feb 2025 18:57:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250225225756.GA4959@nvidia.com>
References: <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <D80AK2CLL4AZ.1G6R7OBHOF08O@nvidia.com> <Z7xg8uArPlr2gQBU@pollux>
 <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225210228.GA1801922@joelnvbox>
X-ClientProxiedBy: MN2PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:c0::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4489b3-fcf7-4e06-27cc-08dd55efd84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Cq5J3doMs6y4Wd4S+sAg7H5jpLN9+IuhbvfjIW6CPFEnLHvg/S/sBsVrSrG?=
 =?us-ascii?Q?DD014U0587Ab80U60ykuiLMFqLsuTLhyUOuAbY+RmDUIzGMx4Qbay4hZ4kji?=
 =?us-ascii?Q?nu1zecH1470gxR1ghmD2MB7CojltNLZSIKu9PC5XCcrSVfkp5/W3G83S74RV?=
 =?us-ascii?Q?X9R/n0ozQ/bT4rVTWi0rXb4q4/403oZgKjW/cVQfjaaNm4KkuSHJx8IUfI32?=
 =?us-ascii?Q?/OO7uHij24czoYbk+zKq2lrZHrjSwaok5jmWIuOFN4MaLi4Owk0fGr0eOcpY?=
 =?us-ascii?Q?OzrgIC3TBogqf9OIFqNfJZXoRVX1I/zS51szCBC4FioNHEjP7KJmDwfJr7cq?=
 =?us-ascii?Q?rSJ09rwOXjo1nmMMsGUJTBifC1RDSHWxSgGf3RYFDJDxZIarYrQPgXxDIhAU?=
 =?us-ascii?Q?l2pJZidYG8ON4ZOJVCymY7yzzsWpA5/ygEwCnkPSlvBBVgGvQcJMjRvEatv6?=
 =?us-ascii?Q?4WxUqVUv1Z9P4fxkXTnX7ck/QfxY4XCK8ubnXSnVQq6/PWjoKlihuirPJRw0?=
 =?us-ascii?Q?kdYB+ol00/KCshPClifNbs/Kv4/hx+8APH0ACaLN1WwpUyUJ7llXbVh/hIIV?=
 =?us-ascii?Q?pIAqX0RVxEjhznq4jsC79yRTTJxZUEhijhr0f+C/zENbNwZBfud517kA3HoY?=
 =?us-ascii?Q?TLHvRl/lklB9vGlkRz+1sHhaTmNEXelX6jft2+EclIbWuZxzxbqND3fNWSov?=
 =?us-ascii?Q?F7BRUDMgCNQEecG4+8ToYU4XNSr6phM5xH+Wbvo6e/G054gmqw8Pg/weVkCE?=
 =?us-ascii?Q?l3k7720cHdlIKo/7rKJmB1NKDTV1mdFl97NfKEhqVY/o1iGec44gLYDzsgYw?=
 =?us-ascii?Q?eFqe/WcRl64Z8Regy8WfRXwv/G2653CmpjoMpmApeiuG041Qzba8Bjgi2Bjw?=
 =?us-ascii?Q?PDu3bvKVyWRUv8ISkdlWDOj8OzWSXzlct6sbisMcO7sKWbqVE05CCLjhzTUT?=
 =?us-ascii?Q?Bfcbe2KH1T1GoaVIlFiNOBcn6EXzDS21eaQpHkHpLCodS7UwURucQmQQfZ7Q?=
 =?us-ascii?Q?7yOhoeKkY50Loi7eN5tzVYixt7ovicZ4N8pGoOTPLxSNt4bkiTwyqnScqtCF?=
 =?us-ascii?Q?JOpaB6U2HW31GgmDSGCeztEuzKmebuAlneZc61mw/9AZZzgRXbpd3PpJ3HKo?=
 =?us-ascii?Q?IgOd8B/huWWwhhjTrLxzR42IdO04eKyHXkjfXiWV6fLP1vbnlTfupOridp9f?=
 =?us-ascii?Q?QVE+z1ByvQ1OZdwLLdYTRbffjWT40CQTcvX8IOgvFOP+hde1eCJWcQ7wKWCj?=
 =?us-ascii?Q?IOp4/ah+CE01Aw8l+90imPJePownqlkcWdUfhLwzgxbx3g1lFhQOcdrXPcB/?=
 =?us-ascii?Q?2hq+efWMG4Tt1ji/BIzELHPhLd4nEn7sfn3ED+ce5pCg+Isb24fLkhPQ0squ?=
 =?us-ascii?Q?KpdGw4rffZ+CwfeqVG0u7vkko9pZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kwcA7gV7G+epv0oIse6YfDyEd10LAEW4J37yXP1KPEKuZUWo34fGsKCuZU1m?=
 =?us-ascii?Q?pmBDjmo2c7blceevtWpb7qi/5p68TRsTs12BQo22SKGgbs9llv1fJRtoC+7E?=
 =?us-ascii?Q?FlK7qSP8WCrJ58VQ0ogaplxJWbHOlSdJgK/Wwy+PPd9zFyrNv2nadPxsP16N?=
 =?us-ascii?Q?lcbyd8NnodUIPV6caCf7MN6VavMD8Z1Zcm502dbxnG/C9oipCgw6wL++UXXH?=
 =?us-ascii?Q?O0Mj7hj3ackA9EUvAdAplI38qnivI5pOcvHDMzpbHENgQZVkrdh47MlYkuFo?=
 =?us-ascii?Q?S/cdpDg2trbvloUtOy+Aw1Z2v28cyCgDJhFfHRgli2tS4Cu/ncG4MATet/QL?=
 =?us-ascii?Q?T8L7l5CP7wyFmW3Vqa1nL2uOaLY6sOEe1+jQTzXzuKlOIVChW6bXL5QLZgxQ?=
 =?us-ascii?Q?ALQvxV7bUQTHXXxWWoO5lRqbcbD/G4YIZVCaGznMuRyBE1wbYRKHcIwIV2S1?=
 =?us-ascii?Q?sNVkuiJ1n0tkkOZyDPz5DdPaK3h/ole28Fb6fz1J+xeO70jwsX6DrMADXrON?=
 =?us-ascii?Q?G7bCWMZhmdALEgnJkjb1NU/shTaUCd2GAPO41PT7fKdZzxTrXv6T3+My/RH2?=
 =?us-ascii?Q?KNjp+GfVDRa3u+xaPyrKcWQBrPya7s5+w98Kw1pGpoYm8XAySNfBXx2tWZBQ?=
 =?us-ascii?Q?Brpo6Na0jiDRzW4lp4xHPUycOI36HY+Y+7F8W6aR3VtvJLbyYnIvnsn1qM0G?=
 =?us-ascii?Q?9IM4kJ7uffONAeu7GjMlb+C8lUxChrAYSqGM1/sLpsi5KRSABRUX/daB8i6/?=
 =?us-ascii?Q?wwX0PwdcZeLKsnnfA6yOZIBViK78u5joUMZduO3Istay5nMB3hHZ9Csfdw4W?=
 =?us-ascii?Q?53u+3NwpDIOvCoUx/G+T75SZFt6RaWPIKe5xBpciHjIB98Rix89s71HFkhv0?=
 =?us-ascii?Q?b1gcEVf2zW4j6kcV4bZ10UBCTJ55hq684OKQ4d2MaOeKWW1CTg7WajzH+cgp?=
 =?us-ascii?Q?s3hi3EL8//kOfu6oHnAeQ1xpZJVnY/+Qmy2BQ8z8HMs9iRZVtv4IZ+aLiJfF?=
 =?us-ascii?Q?R5ey8wkuNp3m0L5BQT08szLfdS8KIFvJBm5KCZx30GoMZY7+NXAgjaldCIdj?=
 =?us-ascii?Q?wLx5UL3Kp82JTT2tI3PPJCG95WxC7cII1lgKsC5oVPJDvVAq1oYW4c9nPO+Y?=
 =?us-ascii?Q?7y+vhQ8F7cNznvZ4LUYUo56DIqUKEBoltn51xgtIvq/su1EBf7B3uHSF9k4z?=
 =?us-ascii?Q?OEa1/MBIqB21K5D0RAWRogJXbz6w7sfGGmqAe6XlszVTIwpvcZj1KFNCcCfU?=
 =?us-ascii?Q?0cdRigNCuBHfpdS2M8/ZbaXE6h5BO3Cmj0f2B40OWlqh0ZMyRATTs9IYpnBc?=
 =?us-ascii?Q?dB+krgAfIKrwn+/HgEkk3ON8Xz4LKS7XYf1LgFE0bmZHmsos0QqiC4zZAv0z?=
 =?us-ascii?Q?kZ79gL/bharlJ66YA7UIInZ9qe6bB76VVqCmznk1ThVuKk2YQs1U5gxWq0fB?=
 =?us-ascii?Q?l7iihP+yizk+eTlEZkjVVTsrtIhQIrQ/eksXb5/Y6Jt1Wfg+JdP58dIjGb8n?=
 =?us-ascii?Q?ykpG92QvQu25J0qQYV6KAmFNqa6cCm8hQBiWApsXlY1qNwwoTZ4S6OBW896i?=
 =?us-ascii?Q?6kvWLaYhW8KtC4HKW/g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4489b3-fcf7-4e06-27cc-08dd55efd84e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:57:57.5504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ9C33RpAiAdfGMXsgr+/FLf/oRG9eIL39XQ+QmzC6c2AO6zmExb6rZHCSXktzAw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
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

On Tue, Feb 25, 2025 at 04:02:28PM -0500, Joel Fernandes wrote:
> > Besides that I don't really see why we can't just re-acquire it after we sleep?
> > Rust provides good options to implement it ergonimcally I think.
> > 
> > > 
> > > Another colleague told me RDMA also uses SRCU for a similar purpose as well.
> > 
> > See the reasoning against SRCU from Sima [1], what's the reasoning of RDMA?
> > 
> > [1] https://lore.kernel.org/nouveau/Z7XVfnnrRKrtQbB6@phenom.ffwll.local/

> For RDMA, I will ask Jason Gunthorpe to chime in, I CC'd him. Jason, correct
> me if I'm wrong about the RDMA user but this is what I recollect discussing
> with you.

In RDMA SRCU is not unbounded. It is limited to a system call
duration, and we don't have system calls that become time unbounded
inside drivers.

The motivation for RDMA was not really hotplug, but to support kernel
module upgrade. Some data center HA users were very interested in
this. To achieve it the driver module itself cannot have an elevated
module refcount. This requires swapping the module refcount for a
sleepable RW lock like SRCU or rwsem protecting all driver
callbacks. [1]

To be very clear, in RDMA you can open /dev/infiniband/uverbsX, run a
ioctl on the FD and then successfully rmmod the driver module while
the FD is open and while the ioctl is running. Any driver op will
complete, future ioctls will fail, and the module will complete.

So, from my perspective, this revocable idea would completely destroy
the actual production purpose we built the fast hot-plug machinery
for. It does not guarentee that driver threads are fenced prior to
completing remove. Intead it must rely on the FD itself to hold the
module refcount on the driver to keep the .text alive while driver
callbacks continue to be called. Making the module refcount linked to
userspace closing a FD renders the module unloadable in practice.

The common driver shutdown process in the kernel, that is well tested
and copied, makes the driver single threaded during the remove()
callback. Effectively instead of trying to micro-revoke individual
resources we revoke all concurrency threads and then it is completely
safe to destroy all the resources. This also guarentees that after
completing remove there is no Execute After Free risk to the driver
code.

SRCU/rwsem across all driver ops function pointer calls is part of
this scheme, but also things like cancling/flushing work queues,
blocking new work submission, preventing interrupts, removing syfs
files (they block concurrent threads internally), synchronizing any
possibly outstanding RCU callbacks, and more.

So, I'd suggest that if you have system calls that wait, the typical
expected solution would be to shoot down the waits during a remove
event so they can become time bounded.

> > > I have heard some concern around whether Rust is changing the driver model when
> > > it comes to driver detach / driver remove.  Can you elaborate may be a bit about
> > > how Rust changes that mechanism versus C, when it comes to that?
> > 
> > I think that one is simple, Rust does *not* change the driver model.

I think this resource-revoke idea is deviating from the normal
expected driver model by allowing driver code to continue to run in
other threads once remove completes. That is definitely abnormal at
least.

It is not necessarily *wrong*, but it sure is weird and as I explained
above it has bad system level properties.

Further, it seems to me there is a very unique DRM specific issue at
work "time unbounded driver callbacks". A weird solution to this
should not be baked into the common core kernel rust bindings and
break the working model of all other subsystems that don't have that
problem.

> > Similarly you can have custom functions for short sequences of I/O ops, or use
> > closures. I don't understand the concern.
> 
> Yeah, this is certainly possible. I think one concern is similar to what you
> raised on the other thread you shared [1]:
> "Maybe we even want to replace it with SRCU entirely to ensure that drivers
> can't stall the RCU grace period for too long by accident."

I'd be worried about introducing a whole bunch more untestable failure
paths in drivers. Especially in areas like work queue submit that are
designed not to fail [2]. Non-failing work queues is a critical property
that I've relied on countless times. I'm not sure you even *can* recover
from this correctly in all cases.

Then in the other email did you say that even some memory allocations
go into this scheme? Yikes!

Further, hiding a synchronize_rcu in a devm destructor [3], once per
revocable object is awful. If you imagine having a rcu around each of
your revocable objects, how many synchronize_rcu()s is devm going to
call post-remove()?

On a busy server it is known to take a long time. So it is easy to
imagine driver remove times going into the many 10's of seconds for no
good reason. Maybe even multiple minutes if the driver ends up with
many of these objects.

[1] - Module .text is not unplugged from the kernel until all probed
drivers affiliated with that module have completed their remove
operations.

[2] - It is important that drivers shut down all their concurrency in
workqueues during remove because work queues do not hold the module
refcount. The only way .text lifecyle works is for drivers using work
queues is to rely on [1] to protect against Execute after Free.

[3] - Personally I agree with Laurent's points and I strongly dislike
devm. I'm really surprised to see Rust using it, I imagined Rust has
sufficiently strong object lifecycle management that it would not be
needed :(

Jason
