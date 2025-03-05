Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C395FA50339
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F4F89861;
	Wed,  5 Mar 2025 15:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sK7Blawe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6018928D;
 Wed,  5 Mar 2025 15:10:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt9nSFW1ufA5/TjwV5sOpe6Ccc3fJreJWsYpeaF/wLYfTTNsEWiE9e2ueDhjE7zOmcnlK9gT02VGftFIgoaj7box512I/Crg4wehxZ7mInDh13qJtRz6+RIqBZvRufHFyq9pHypf+ArbAbXxQ3L9ni86L1rP82p4GsbrEQfVRM8Wf2Xcb6HVwGkHP6dAP9EM/5bwYlREinsmHxqP7TIZjnVOGkbuY3Cmsf4Vr3IX5I0yR8Hj6n5U209pe795PPJlfkvOMxHO7iBr729fen09c2Q9SewQ+2GBIsI0/GHOTQhin9P/buTQb6MDZ7y+NhO2rx9GjcpTOj6i1rDYYf2BQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuc3R1xDV6o7MXN0f/LPbSZWWEUlbYuYo23+ZxdeM8I=;
 b=sl3Vfy+MMtWHiqOj8m3hJDqwPOmUAZWZig+A5SrB4jRAdZyeESfb/dL2Nx28vC/UxIqwKFUl+ZasuNmgdR2YkdCu7N+GLqL+4YZBSMk0BYete8f5RLoH+JzAgLXDLN7MJAQFVdu00aPiPZJdWtzxErVatG8QkHqcpBxf9BP0d8unJX3XVR6dXdIjg8LLgUtPB39dQdEQCiw8vTWjJAo/g2T3QoNX6w16lC+//wvimnmNEsJisrQF6G3dJPoGfV10sfQ6jSERplpFrYwvgUONJJ448LBHmybVTnHINJEKm7anvmBolqKYJa8FOy1afZWID1wPuRK9DurRX0ltREs7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuc3R1xDV6o7MXN0f/LPbSZWWEUlbYuYo23+ZxdeM8I=;
 b=sK7Blawex/x5adCpYcbtTRfsNfnLsMhBZ5nR3moS6D85XsJ0nymMpYQt+XeSmn+sWARS7M76pRTAfv7gb+8zwYoj1+sZm89zFgdzgCx98YN2mla6hdfhVtdSXuQMTHKZCkr2pCsdqTsqXzK0Z5jm65gA0VtspKhsKeGL6Tuzi9/+KlspXQeo/Wi4466czk1hWpooRb8p283N0eN0rVQGNc63lLOZqWv/LY7jX/NDDgtNKiJNUxAuYMiTnKO8ERAXf1iJuyFswQcVnZ2TtNgrqqGO0wJyAKCv/IwzDCMofEqf3v4ChsuvN4aYW0Fwif1tYGA/l5sKLZaHXGs1XWGTNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 15:10:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 15:10:14 +0000
Date: Wed, 5 Mar 2025 11:10:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250305151012.GW133783@nvidia.com>
References: <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
X-ClientProxiedBy: YQXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::46) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: cb65485c-0971-486f-646d-08dd5bf7d49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ahRNdYd8awZmJg69Vq17X7oz3/Z+vYAqfNRHZEUQzZ/ZBroX2oHEzboKJP6Q?=
 =?us-ascii?Q?w3mj3pNf1+8JyjYmZXRe3qFP1pzxPAkeWmumDG0jJymlj4TVFwx/nJaUaMjb?=
 =?us-ascii?Q?CsQyQFlMnv/+ZsT0ipS8f0qD9w3/C33Jx9X+0sfsPFW+6MRkIogBHxVsx1Nd?=
 =?us-ascii?Q?hZaBq6TVXogSFZDMQrvIrxWy80CIkfxUlEJYLhuxxNbMWjtn0JjfSLnqLDnK?=
 =?us-ascii?Q?Or1U9L5xZx/tBlh9ukBnCV0mM8/sWVv5LWFm1FbiOCh+ixSAiM0oUouhq94p?=
 =?us-ascii?Q?VUbqhm017zvJ5N/uhMvaxCRvIJnxQlaC+/C6ILhYwWVZn9WAJcI8dQ3b4izp?=
 =?us-ascii?Q?yKfoaEXcuqwnq0tB37/U3VB6iAfwtOYwTmgOmbPJD5lw1Yk43hvGYE3uWHTu?=
 =?us-ascii?Q?dR3TyPqoUJHUYDKTod1yqMEkBXTWgar4h2N8T8XGniVZ0zbjY/YS2XZMBO/v?=
 =?us-ascii?Q?JTV7JFdW7L03zt8xqeyhUpNI1iEXZJ7gqR0TI/hRSy5buU1XHLiPtvfpp0U7?=
 =?us-ascii?Q?ws//6+CCa4FBEgwL2g1ZAvjmInou1ZoLdpmPLUhJEpBHwdT1GQJzHo4I2aun?=
 =?us-ascii?Q?tf35np9QkNC/Nts/JaYLAKeEp6JbS4JQwcpjgl6OBprxF2Wwyf9MAAfwRhhS?=
 =?us-ascii?Q?1gOqTPmqQO57Y6DNOoHyuOwFT2/7EfV2fZBiO+/DQ5D6cUU6dW1gDqC3Chav?=
 =?us-ascii?Q?zHygwE7Tpm0f6vKt0NsPt+3jqvUCvRvU5PJjlyJ13n/F6N5s7LYn66dkvzDL?=
 =?us-ascii?Q?c2mAnH+JddclcwyY2w7K0uPPZW3YffP8YSzd+N5NRTOONmsLJ5q+VVGO9rCY?=
 =?us-ascii?Q?Xq91w4EcSv3EdskLI6rtSBeoqbDBalozoXpzEm47YApFvEQRxSnRauqQbWAv?=
 =?us-ascii?Q?9TOkwYpc/Ob+ZktViSXTTePCeYU9oP/vDO3ZaoeDU1tfbW/Rn99FvfXRiI7u?=
 =?us-ascii?Q?gRWoGU137y0Gh2rO6CHwUazzf2C6X17FQST2eMIwD8PiBzy7bW1Tw+G7LV/H?=
 =?us-ascii?Q?A5+/Hyif8ypm0gGaX4FLfZxuZAwNIyee06Gi75OftIgHEjUzh61ycolbt/5w?=
 =?us-ascii?Q?JfkPdb2wc2USkZVf+lmZOUUSAFhTgEr0Vrb6L+JKchpQJIgo1QKvjpaHVsJA?=
 =?us-ascii?Q?ZR+DWEm1m8troVOFCiyYW0kSwIX0cDoIYXtAWgxSCridCzwVHHIyFgGMpVws?=
 =?us-ascii?Q?p21U2YX1m8Zada70/ptV2MO49vIyVC1/pDjt1qr49XoM7KzHiwyzdYi9Dxyp?=
 =?us-ascii?Q?U2k5nSmEFwExJVWd6hDSMTD1uDHXeZqCMXL/f0B5YZXlaBOsbsMW+ILbAVhS?=
 =?us-ascii?Q?Gr+7DN7z7tQANk2E7BnXYWkzh7COinTj4o0OofjZ9S+2X4M9VkU7lkN/l0I1?=
 =?us-ascii?Q?ae+O7bW89tzrilJTgCvJHN51WKTPW+sk79DOv86W0WwhQL/yQBFoQKeK1+3Y?=
 =?us-ascii?Q?9VKr1SNKaXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mjK/Mhrz08OmyAGVKSUtLGUwBWpaCI75jb2UEI42vZdGOYV2E8t5QNmAEqo1?=
 =?us-ascii?Q?6jIRxyAHbSXqYjBQZrIhIIpVv3U5r9bTouVVNAx7/3oT7NmyRzdr7byNzDYJ?=
 =?us-ascii?Q?agesa3u14WQgMyjqOnGyYy6kvTqoksyNSFATzfXRYyOPmFSppGyPGmw+kKy1?=
 =?us-ascii?Q?/8qBmPME8Szusvr+CntETAc7AuNfJmaL8xNmYhrNO9C4bgMs+4aDdMq3dXWC?=
 =?us-ascii?Q?z34mY2knCVH6fabHdBFOfoX6Tt6cuJuOX0HkHI7H1z+Vww0IsZ+vvck4ZXcQ?=
 =?us-ascii?Q?NQZHOYnv2VQukTHHkg1kOpD/UnCHr//Wd3Yf/g2BpRysEV1Y0UTmVvRD/S0b?=
 =?us-ascii?Q?GPjiSc/xraBrv1WZ0041SCEPv5jI6yNy8vHBZjFDvlpg9gOYxUj5SVUCbL5e?=
 =?us-ascii?Q?9Fk6dpNRZvaX/P6X3GHPKvR8M+BbTf9v+T6ZvSJBfY3UaV/DYOzMEJF/ACo6?=
 =?us-ascii?Q?fCcs7OPOX76rHK2cmJ1mYhM2aseVgKM4jSCb+HhHBRhaxXrdd+J7O+cRL0QI?=
 =?us-ascii?Q?YD1eqSM52C35XpG8aVl/fqB1SyVZkSocOlG1i0P6skMi/1xi/6UK/j0gCyW3?=
 =?us-ascii?Q?50T1zNaTMD3U/R3qUsiiDxSbny6Mo8LUasr+l57kN1JqIQIL/5Qnu95cNLTi?=
 =?us-ascii?Q?Cl8PUbV6CnRM032ol6oDiFkmlykynemfWYQ26g5afQEePj4WyNpvQXpCS/fE?=
 =?us-ascii?Q?C4Zj+JQXdlJ2GQk5VFX5xWYiY0q3GWFRDONGf+d3PntRV8bOrptN1oBFqfUJ?=
 =?us-ascii?Q?mkt02pSP+fKbBQuBKLkN0rNp/IEU8YwEmRv02YikVVT2tAx09GKz0ZhN5sZO?=
 =?us-ascii?Q?vWCZ3AikLSjlKAXzVXYQla2vqWnfMitmjYsmlYGiN468jgji2OcPAkL4/KCT?=
 =?us-ascii?Q?kcAD9pjs2VHvqCPYQDLxZHoindiFyUBjhuE+x/l2rqCWibpnZ6wz2uWp0KDc?=
 =?us-ascii?Q?t2kYBq9tqSV3i0tKJr3Y0Pxed+N1o+NTACeVgxlhsGjLiiM25wGJyFYXFGqK?=
 =?us-ascii?Q?df6H+5zUmXwq2fizC/SyS/UWGX1J6PkUD9EwkPkWkqXGvBROLSMY7bckDuRU?=
 =?us-ascii?Q?aIwQ/YjH+UXJd0O3fRIeCDwosS13/Lu3dD21BgCE/jCys9LnubSGONftxCBM?=
 =?us-ascii?Q?GZDmwGoyicPCWXks2viTDTBTA4nn3Sz3PP1jF9zym+ekEMoAPQ0TXLtrv2Ze?=
 =?us-ascii?Q?ok7ljERg8VVnSYMOsPVT7ElLSSVK1lffHC8IkCccLt1R16BWhJrIpHzFp1Vk?=
 =?us-ascii?Q?ywNVkXVF5JQoz0g0HuLsNjfp2wnlOhIoYmSlgXUwu3d4jGH8O7Q01HeYLbkK?=
 =?us-ascii?Q?dNf7iKE0D01TV5/hYVKJrKgZYMbbRfdp3YglHRLB+M4RRuH8pWF8GfyvSCAw?=
 =?us-ascii?Q?olj7RmfYgoMtze9vT9xN+RAkti9zB+k03NiHApFQvoPyQ6yotkVVjyjhaQe+?=
 =?us-ascii?Q?WuAb2oo2fd301I0duAgjVjCGOetLZZhzD8bVPvrnI9f3RmyYgGaYVSOssg9r?=
 =?us-ascii?Q?MFJ0IyrtBwD8qqbiRWElinjkM3XfnMNLYddzhTI38wrBBtysmqiV9xWVbhlp?=
 =?us-ascii?Q?VVbOtuKJNbP4fXb0M8m+/cswkmXKuGkMPcYNjLWp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb65485c-0971-486f-646d-08dd5bf7d49a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 15:10:14.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKfjhoatsVHTPOxtxG7pPT9iUQ35+7Y6UTALpHP1ym1oCIChaTlgnHttf2h4JGxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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

On Wed, Mar 05, 2025 at 08:30:34AM +0100, Simona Vetter wrote:
> - developers who want to quickly test new driver versions without full
>   reboot. They're often preferring convenience over correctness, like with
>   the removal of module refcounting that's strictly needed but means they
>   first have to unbind drivers in sysfs before they can unload the driver.
> 
>   Another one is that this use-case prefers that the hw is cleanly shut
>   down, so that you can actually load the new driver from a well-known
>   state. And it's entirely ok if this all fails occasionally, it's just
>   for development and testing.

I've never catered to this because if you do this one:

> - hotunplug as an actual use-case. Bugs are not ok. The hw can go away at
>   any moment. And it might happen while you're holding console_lock. You
>   generally do not remove the actual module here, which is why for the
>   actual production use-case getting that part right isn't really
>   required. But getting the lifetimes of all the various
>   structs/objects/resources perfectly right is required.

Fully and properly then developers are happy too..

And we were always able to do this one..

> So the "stuck on console_lock" is the 2nd case, not the first. Module
> unload doesn't even come into play on that one.

I don't see reliable hot unplug if the driver can get stuck on a
lock :|

> > Assuming all your interrupt triggered sleeps have gained a shootdown
> > mechanism.
> 
> Hence why I want revocable to only be rcu, not srcu.

Sorry, I was not clear. You also have to make the PCI interrupt(s)
revocable. Just like the MMIO it cannot leak past the remove() as a
matter of driver-model correctness.

So, you end up disabling the interrupt while the driver is still
running and any sleeps in the driver that are waiting for an interrupt
still need to be shot down.

Further, I just remembered, (Danilo please notice!) there is another
related issue here that DMA mappings *may not* outlive remove()
either. netdev had a bug related to this recently and it was all
agreed that it is not allowed. The kernel can crash in a couple of
different ways if you try to do this.

https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c

 > a device with no driver bound should not be passed to the DMA API,
 > much less a dead device that's already been removed from its parent
 > bus.

So now we have a driver design that must have:
 1) Revocable MMIO
 2) Revocable Interrupts
 3) Revocable DMA mappings
 4) Revocable HW DMA - the HW MUST stop doing DMA before the DMA API
    is shut down. Failure is a correctness/UAF/security issue

Somehow the driver has to implement this, not get confused or lock up,
all while Rust doesn't help you guarentee much of any of the important
properties related to #2/#3/#4. And worse all this manual recvocable
stuff is special and unique to hot-unplug. So it will all be untested
and broken.

Looks really hard to me. *Especially* the wild DMA thing.

This has clearly been missed here as with the current suggestion to
just revoke MMIO means the driver can't actually go out and shutdown
it's HW DMA after-the-fact since the MMIO is gone. Thus you are pretty
much guaranteed to fail #4, by design, which is a serious issue.

I'm sorry it has taken so many emails to reach this, I did know it,
but didn't put the pieces coherently together till just now :\

Compare that to how RDMA works, where we do a DMA shutdown by
destroying all the objects just the same as if the user closed a
FD. The normal destruction paths fence the HW DMA and we end up in
remove with cleanly shutdown HW and no DMA API open. The core code
manages all of this. Simple, correct, no buggy hotplug only paths.

> Yeah agreed. I might really badly regret this all. But I'm not sold that
> switching to message passing design is really going to be better, while
> it's definitely going to be a huge amount of work.

Yeah, I'd think from where DRM is now continuing trying to address the
sleeps is more tractable and achievable than a message passing
redesign..

> > If the C API handles module refcounting internally then rust is fine
> > so long as it enforces THIS_MODULE.
> 
> You could do contrived stuff and pass function pointers around, so that
> THIS_MODULE doesn't actually match up with the function pointer.

Ah.. I guess rust would have to validate the function pointers and the
THIS_MODULE are consistent at runtime time before handing them off to
C to prevent this. Seems like a reasonable thing to put under some
CONFIG_DEBUG, also seems a bit hard to implement perhaps..

> > If the C API requires cancel then rust is fine so long as the binding
> > guarantees cancel before module unload.
> 
> Yeah this is again where I think rust needs a bit more, because the
> compiler can't always nicely proof this for you in all the "obvious"
> cases.

But in the discussion about the hrtimer it was asserted that Rust can :)

I believe it could be, so long as rust bindings are pretty restricted
and everything rolls up and cancels when things are destroyed. Nothing
should be able to leak out as a principle of the all the binding
designs.

Seems like a hard design to enforce across all bindings, eg workqeue
is already outside of it. Seems like something that should be written
down in a binding design document..

Jason
