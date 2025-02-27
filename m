Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8FBA4826D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B1110EB22;
	Thu, 27 Feb 2025 15:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N2CW8q2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D310EB0C;
 Thu, 27 Feb 2025 15:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+vnDIRRa5YXr2DvoJriuc3GUGb5cFp7EsvFi8Nxlw1gJbDpU3mzb+xzZoTpoBwe4uW8Us1D0PRT9tYc1N9SBqGs/WjmU1aXh8cZbDHu2XissF6XmHc6O0bjbMBYn8s7TQ0WXfiUvQpufhwJPo7/YmF+UVpT1sBVtydDRC27k9kc0F11hTLvnX1n1de1wtWA31A4RrwJQsIl3z4i6CD9cxDomd8MTD/jpXuZLtsYvQ/nS2ItwtMBwDkaoFPvBuyf9suhHCMuTgBUmQRJu9tsZDIpx0DxuG2RhrtDgr0fORNrQXk6l3CYE/bYvpZ+JwjVZTwTgQ3xFk2jKDXGKXLdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51Ptewq/Kws0Em0ekFIyNglr1Au2EBY4WW2AvDVBkVE=;
 b=NxBysoK5jqByVdqPiXCfR2iuFdSGuJ9Bj0he5Z6S+5JFnJQB0R6O5atJwiNwUoZQewW69JkJ78zx2mttmlv00Crwk4L8d9av3rNkCNK8NRIjZDmoWMKzPGL5YYjOSLW1dvI8Qaxg1pa5ZslaUaaTK1EpLvKRNgHDhw/1dvf4bheSVIoqz7G9/RhnmGz/6/f+xM4VMnZJty0Y7tIpSoAtwINNGEfQvl9JpIa/4yRdaTHhx22aXtppFnq2VszfsNkYk0kGxhrsDhanVwAvWNjHrY9M+w5xSQcYCXVHplgDIHM32nccSqpf/DD5I5TiaFVoSiRBBL+64wsMKxtIteaLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51Ptewq/Kws0Em0ekFIyNglr1Au2EBY4WW2AvDVBkVE=;
 b=N2CW8q2CwM/sf8Wkp/nPOmFmwBlnXRqcyTu+9qIYMSHi+BiA7iL5ZySh1eEp55oOWpijEN0rOVmDaXYc4iaWR2PiYeuVBtWRXbBP3LD2t5zWEGzlSb6jCgH4t1X0Rz+aqflIooTIyjNSiC7dUPcnGSNT4lPIdUihrU4Aao3BEtbwGXfRUWCWnK/q3e5WnGGy4iFRvXfcPCehx7vPAvtXtdfoAoiIQFoFYWY9UEI5d1IInFnszhwxRmWN3WFjr8fAZv1bTChT2bhsGlD45aOnIKKX+a+eR9wvgr8pZ0SH5IKueRqc+0uZvaLbeyzqTCpe96sgZdatpHs20jZrgmfb9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.26; Thu, 27 Feb
 2025 15:07:11 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 15:07:11 +0000
Date: Thu, 27 Feb 2025 11:07:09 -0400
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
Message-ID: <20250227150709.GF39591@nvidia.com>
References: <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com> <Z8BNXdf3CgqGYjPV@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8BNXdf3CgqGYjPV@pollux>
X-ClientProxiedBy: BL1PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:208:2be::20) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|BY5PR12MB4049:EE_
X-MS-Office365-Filtering-Correlation-Id: d416755e-7277-464c-d0ea-08dd5740691f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mIw10QfzbmbPJhY7G3AFo3FEQ8tnPPNnT7UokD0lJLhwjlZSZy9q+3zrm0i?=
 =?us-ascii?Q?vBVM+UeNgl5CnhsZjGd30ttMBNaQ53OIvWOI2Ldo+IYDjd6y9pRM1n68MITQ?=
 =?us-ascii?Q?AfOKRDVjd90ksuFcrUJZZya2f6QFb++gmk/ALg4Uqc2qyNYUzXDCh3NJjlJD?=
 =?us-ascii?Q?K3EgB5kYsj2NFZ8xIxHBei9ZAzUgn8y9JKVOPILBWnN37b163ug27o2LcFQu?=
 =?us-ascii?Q?YK76JdTXy96P5O7wVO+zzhijapAuerotr8mMDtP1IyM3qticrEknJa0bfVMW?=
 =?us-ascii?Q?5rKRgEI7RGeYc3yzs54OHLUJoYkp7Na99u8gG2Ey73DUQeStf8fvl+OBCl/f?=
 =?us-ascii?Q?F8Rv7MKMwQGFbRgfgFLIqWZn+kGJ4tbtZJ311RJZA8NOX0TAQjlPo6zjRrVt?=
 =?us-ascii?Q?c5G2OK0XscQIkgrX7akH/fc6apw1ZFTTI4o74QehN7Quep6IhNPQiHpcqWB3?=
 =?us-ascii?Q?zM7+8hqkY/86GHHQ7i8NbzU7mNqX7l6FkazMcQgV4iXpRB+oM7tbwdUNxr5q?=
 =?us-ascii?Q?wQkicoLXs8F5MaMD5iCD92I5mlPY0797q5FyKJeErk6IspiLkL2Egp58hqxB?=
 =?us-ascii?Q?ZCVzk04nk42T4JtGY12zblSZQ9jNRazFkhDRHLD52B1qBd1lXFMe3k4Y6yWn?=
 =?us-ascii?Q?wo5l16vfCgh3I1ZZipecZZOdA1BxfB0g4fok2qI0285Sz8vZTLr/fMxN+Us2?=
 =?us-ascii?Q?EoeOPBSR0ZsZMWxNKylh7ezknyNSPX2MldByLtGoybg30GcLfm0c+dj9GO9e?=
 =?us-ascii?Q?ZRhn9qrZyMrJeSZiKuthvFyi041+9btog89evYzyLg/I2/AuQ6DV9TNzBtgE?=
 =?us-ascii?Q?HKoYED7UhKa/ABdwgRfLcBzNvNp0SK/hRo+HUaOpalc5jNgjIHhbk7y1reLv?=
 =?us-ascii?Q?rZAi+rJnED+QplGcyIYyeam9Jm1j//LpuvRd/WFEd9lrjkVbElrn7q4TNKCL?=
 =?us-ascii?Q?PQYfvkGLvPmkz20KCa5WvE3z58+SNxw75AUHMEeMfScjzz7q5NMzZFFOnT0F?=
 =?us-ascii?Q?A1MBnD04jMLoBaKoXY2+eanMrZR2X8ax3aj2NSxlaz2cwIzgAcvltxMvZbhf?=
 =?us-ascii?Q?6CpqYXNJDFcKbN5knsxZr3KYbHl2WeAbFyB3/6BWjhDgrLXam/QqKJV5+A0G?=
 =?us-ascii?Q?3E9LeeB0+d/7nWmOOhFBKp+j+LOyTVoLYNL+L+nr7IZTejIUeZB9ypBIQ6/M?=
 =?us-ascii?Q?UJHjcR5j8REA/9A9Tm7zf1MgzB3X8BjvBSenWZKzdG+n4mCoG+ovI2byMfT4?=
 =?us-ascii?Q?yl4YWBjjLboc8r1kqS/xaQJFYeYtTNks+EsZbLgTuMCzBJp7fcxc78rOQOQw?=
 =?us-ascii?Q?HOASqAU1mPj7GAjlvkgcN11uIyS8gC9wfzHCZZXmgn7SoOLX/GIDsYl1rnXx?=
 =?us-ascii?Q?F/OOMOWiaJ5chgAC0tmy4DPF0yTL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gUmC4ZocrpQOT3rhjtUZjDetKbWtIE9hG8B61IwdcsvwFkZYZsij0OldKRwY?=
 =?us-ascii?Q?w0tJWnS/rsV6tVlMybOFk5ph/QeYCiAe+83iXRV4/yg0yPi8YtdxKeR///Y1?=
 =?us-ascii?Q?YBquAiZ1zCtvFUh1Udps2E8Vim0Vuw5lKl+rjM1lwIQIFiDebyBKTdMU6fd9?=
 =?us-ascii?Q?QbjFJYf+qix9OYGCJK5AKb8R/jeKwcJkM1qFFVaYIeXTss7zDb7yATu+8CKG?=
 =?us-ascii?Q?xaHfj+Hmg+8jjpLu/W2BO/KjeHNeUM3aIuwCtso8qkBBCMWVj4jS8R1nxmHD?=
 =?us-ascii?Q?NSSgUX6o3q/r1ZGb3yOrAEjGmYAmF7ydsf00bM1LbqR9m4DXRUbFg0HaehAt?=
 =?us-ascii?Q?Qn2sZu3/AM4KciOvCcWOmd20cl8SNfeFu/PEuxN5Ub3OjsjKarqoSb9TWTna?=
 =?us-ascii?Q?qJCuCyQ2NjoHotGAg1QjCPdekANsJfgo/B44Q2IYFC5SZbPYMD2SSjKWc21X?=
 =?us-ascii?Q?Uk1A0Se7KSiKkETCnV3hBodC4mH50V3daPb/a3/uj29IZJRd+fR5DtmThlES?=
 =?us-ascii?Q?GNGqgcLk0wLPkOvi4IlNdHxFa4RbW6n8YqcquS7cZfxDhfi5pLtLc5pF3lKH?=
 =?us-ascii?Q?p2NGrjHVzsfrBUfFfcpspUW/by/8lvX6YX/VqwmQGRYl/1kviomlXtG8Pzhy?=
 =?us-ascii?Q?5F351cBdq44bLRL5WEBtOwl9b09Dio9AjntKH62vKeDZeXGY/C7SK/z2UBbq?=
 =?us-ascii?Q?IisUexT5CtyKf3bqPdhtAhzSoADXUATukPnVSZGuTPyYixbVfrI6usSQiewQ?=
 =?us-ascii?Q?092MaVZDV0VKs3Ke52i1PeX4dLKJu1+g9+Ku+3Iac+6Wj443AhWtNhZUKwKx?=
 =?us-ascii?Q?DxRaObTWuWXMLAJAL+TaKC6NlPrV5XL+x9yGv37ADFZ+aOn6GOfcPxWgmlPH?=
 =?us-ascii?Q?w7lRsC+HqtS0oEOlI2Pe6p3xI1Yt+8WUnYgkEKOlnBYTVXKIyQhVzYBGxF9O?=
 =?us-ascii?Q?A7lmcF3uv5d+gcS7HdYrz45n5W3iQt1sbqn0bch1IpMiaXuM1DVc/cR/r7cL?=
 =?us-ascii?Q?0hHq5stRdLcgdhuxf+qDOGz5vTqqvMrRPUvoBI/TSaSxfvdIvxCrRBEJgoir?=
 =?us-ascii?Q?iMsClndjDHyXlLV+6mb5B875/j/3omdK2lzmPiJ4Gdo/Md0xc5457PcO89+a?=
 =?us-ascii?Q?wMNaY13lnxfgllaitgp8Z7wd3D3aTAGhT57TVnr8IA/p8xDPSs4gHDK41pKM?=
 =?us-ascii?Q?7d9xEUmAxb+EcTLn5ISKUwvko+1WXy1wKPRZ2d9ADukIpwcf+xxsw0bQEI/5?=
 =?us-ascii?Q?lBssukZ4KBPnC29tpBw2BO/PoJtsDs7NxczD4Gytu8sLAsNLs5GE53l/QMq7?=
 =?us-ascii?Q?ZOBjxntxwRKxriFihZvoNxCVb+pc/ptLBOSa29hvYBO3CrzNLB4UicMN59uq?=
 =?us-ascii?Q?lrG0FjJGUZf2iRP4t2d9/FEGrsQrvo5Y+k8SRlaxML4Nkd5APLK7xOgiKBLM?=
 =?us-ascii?Q?0kZTKlFXfHgXedgDzNyQaJo5DIbWGnAv95MoH0FF7wZq0UfDcZ2Bzhb2I2qp?=
 =?us-ascii?Q?KMhT82FWPg3LMke8EBBjq6sjC0aiTWXxSXw9agxLKruRUvTmEAcpj6bCMsuG?=
 =?us-ascii?Q?XvJTv71EBMSBjShXHOs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d416755e-7277-464c-d0ea-08dd5740691f
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:07:11.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8SQ4KceAQHQGw2IerIrMzrUHE6MFG1qPmQraDbDZ4Itb0VKhUB/PsEnJkfuNyFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
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

On Thu, Feb 27, 2025 at 12:32:45PM +0100, Danilo Krummrich wrote:
> On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> > On Wed, Feb 26, 2025 at 10:31:10PM +0100, Danilo Krummrich wrote:
> > > Let's take a step back and look again why we have Devres (and Revocable) for
> > > e.g. pci::Bar.
> > > 
> > > The device / driver model requires that device resources are only held by a
> > > driver, as long as the driver is bound to the device.
> > > 
> > > For instance, in C we achieve this by calling
> > > 
> > > 	pci_iounmap()
> > > 	pci_release_region()
> > > 
> > > from remove().
> > > 
> > > We rely on this, we trust drivers to actually do this.
> > 
> > Right, exactly
> > 
> > But it is not just PCI bar. There are a *huge* number of kernel APIs
> > that have built in to them the same sort of requirement - teardown
> > MUST run with remove, and once done the resource cannot be used by
> > another thread.
> > 
> > Basically most things involving function pointers has this sort of
> > lifecycle requirement because it is a common process that prevents a
> > EAF of module unload.
> 
> You're still mixing topics, the whole Devres<pci::Bar> thing as about limiting
> object lifetime to the point where the driver is unbound.
> 
> Shutting down asynchronous execution of things, i.e. workqueues, timers, IOCTLs
> to prevent unexpected access to the module .text section is a whole different
> topic.

Again, the standard kernel design pattern is to put these things
together so that shutdown isolates concurrency which permits free
without UAF.

> In other words, assuming that we properly enforce that there are no async
> execution paths after remove() or module_exit() (not necessarily the same),
> we still need to ensure that a pci::Bar object does not outlive remove().

Yes, you just have to somehow use rust to ensure a call pci_iounmap()
happens during remove, after the isolation.

You are already doing it with devm.  It seems to me the only problem
you have is nobody has invented a way in rust to contract that the devm
won't run until the threads are isolated.

I don't see this as insolvable, you can have some input argument to
any API that creates concurrency that also pushes an ordered
destructor to the struct device lifecycle that ensures it cancels that
concurrency.

> Device resources are a bit special, since their lifetime must be cap'd at device
> unbind, *independent* of the object lifetime they reside in. Hence the Devres
> container.

I'd argue many resources should be limited to device unbind. Memory is
perhaps the only exception.

> > My fear, that is intensifying as we go through this discussion, is
> > that rust binding authors have not fully comprehended what the kernel
> > life cycle model and common design pattern actually is, and have not
> > fully thought through issues like module unload creating a lifetime
> > cycle for *function pointers*.
> 
> I do *not* see where you take the evidence from to make such a generic
> statement.

Well, I take the basic insistance that is OK to leak stuff from driver
scope to module scope is not well designed.

> Especially because there aren't a lot of abstractions upstream yet that fall
> under this category.

And I am thinking forward to other APIs you will need and how they
will interact and not feeling good about this direction.

> > The thing is once you have a mechanism to shutdown all the stuff you
> > don't need the overhead of this revocable checking on the normal
> > paths. What you need is a way to bring your pci::Bar into a safety
> > contract that remove will shootdown concurrency and that directly
> > denies references to pci::Bar, and the same contract will guarentee it
> > frees pci::Bar memory.
> 
> This contract needs to be technically enforced, not by convention as
> we do in C.

People do amazing things with contracts in rust, why is this case so
hard?

> Data that is accessed from a work item can't be freed under the
> workqueue by design in Rust.

What? That's madness, alot of work functions are freeing
something. They are often the terminal point of an object's lifecycle
because you often have to allocate memory to launch the work in the
first place.

Certainly if you restrict workqueues to be very limited then alot of
their challenging problems disappear :\

Jason
