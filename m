Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92CA54F29
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695B110E24C;
	Thu,  6 Mar 2025 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="isoQxUzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BC510E210;
 Thu,  6 Mar 2025 15:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLrqlb4S1kdMxHj2Y/rOhLkd6Fibtso/7mwVMV4i4rItwxUiPOgcdB7hcR3LHS2bUGFfP/PW4GXvbQb/i+lpHl1yuoRikr1XXi7f/Qkk7Qy8AEJ4UoUDu6MvxuLRSCQ9vMHfPwUPF34ZtR5pe517y2ClyAUdaNNl+VG9RHiAHnlN0ZMo+LKrAJzgO8Iix0n/F+pqpgaohkU7jv7MM5h26w6Ey2L2I3Y6KqNZSwaFJRxca+sOqAi1yyEO/xW2H90iNQM33BJrYqFi5V8b6KTAoQ2wz/ZuhuKyP1bCDTFLlyspKeJKNL6q3cXQhp9UyeovFbbAfEVmcHjuuSJYj2S/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcFXh8W+N3Wg1QJDThJA5mG6Woy/4EfSH+vxQemKakM=;
 b=p5I2qlJUg2fgGBq5eMEPr9goNY1bCZD9UiMj3xWPMqUhSYQg9DVJNHGHXuxyAWOuCo73Rylb3xva3Wdbc/+H51OSqW2m+xJ4hO9zuH7VQxL8CokVOanCB2w2lKArpaB0Lwla8nGFSezNrNA62dJ4V89R0jLaBCq8QDWx/whjFEoL+SJIwqY5AqLUjZoYDJP18xWvSejsWxdhlmx3dBQeNzDR0UScvFe1Coqgi1bZY1kn+PCBhODksh++ZhNn7gOTu8ZPvlOaN2tC9opq+W73ap6OzOerIeEJJx51jyZ5f8kX6yQCnLo/ioH4i9EajCE4dXEvsUIfFcbGKvKqTqtDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcFXh8W+N3Wg1QJDThJA5mG6Woy/4EfSH+vxQemKakM=;
 b=isoQxUzm5N33gb0ATy7hQSdnKocU+Va8zMReYpM877qbnLo/y7+WPLwzyECDe9viaHXTCeChwZO8Ln24R8YfL1MY+SHSrHZXBRzXE9nTHlJcyrduttVrE2Y7C2yeZNgJwvYDZwvKzaD6yyInATx+Udwblfv1OpT+EIiaG0BwKZPogqJ3loitQLwBW0togM3puBxIv3oP/l3jN90s40jGp0VM99l8hQswnjaKtWgAjrmoZ1HXrNW5XGBLcTHBECi6wLdyK+W25SFljIIdi1aBgwWF6sdqKvSID+xkdz2I890rJ3N2GUaHNN1SPaBTIns+eoCbVZ8zuzNxiSb9w1LHnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 15:32:37 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8511.019; Thu, 6 Mar 2025
 15:32:37 +0000
Date: Thu, 6 Mar 2025 11:32:36 -0400
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
Message-ID: <20250306153236.GE354511@nvidia.com>
References: <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
X-ClientProxiedBy: BLAPR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:208:32d::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: a9792c75-f00a-4eaa-a170-08dd5cc41fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yh9QTHnm/XSkt/IfbsvOExZQPDonh2TJDW3hZVy7i1y9jah7b6d08cgUrSr9?=
 =?us-ascii?Q?Wgf7G24OSjzEFfjbPCIJb4jy88NHq3p199P4hw+vYmwBWB/zOqxZASAYbW8X?=
 =?us-ascii?Q?YHg9V2RGadikAQERVLAfC1XWqPvEsEIPMrSYsf4rBEFX9xTxM3Df5p11nQJD?=
 =?us-ascii?Q?Fi4o2+bSbUHi0KVBJ+SVdC8m7zjlYpcqz9eOXNPxY6a4uXoSfq1a3I5bRkSI?=
 =?us-ascii?Q?2c+yZcXApsxzXMFDUuWwuf0knNnXwabnx++nGp2EQ+8fRigAxa9kKrfDDZF2?=
 =?us-ascii?Q?aOTuUB6lX3X4sutoEyuOLJSrDfhl5A5qAXlBQFJwsV++GNWQR91R6++NEtsb?=
 =?us-ascii?Q?BOa9LPbxtmGmNDAR6vYyjfK2w287hzjmJgPrMhix2Hj09VGLjobAicXxk2hT?=
 =?us-ascii?Q?YKhkqnW/09QfU5HXQLJPDPB0kDvKZJEi6Tji26keNr0Mhjj+I/uVHTe3D/Cm?=
 =?us-ascii?Q?7ZeHuvti8P5PwUKO+BStnkXYCaaF9lQ1YFTtVo1OIEu6V+VgfhYO3nEh6m47?=
 =?us-ascii?Q?I/MpQJFnAWZnyfyhW/OhQegvPEnlmhsSaWIVRIyWAkDgvyW0ZvEUJ8O2D7dt?=
 =?us-ascii?Q?UByJEChRyakBsriUMj6NQ4VyWGvyw3a/7S1Mxws2CI4hk1SowrRbQYTzkcSe?=
 =?us-ascii?Q?pbNOm5tsJrd3ft6XNpOu9AJA1gVwKuUFxA6IEAt5GReNN77j2hwCAnuzwPS/?=
 =?us-ascii?Q?1AdxE6r3ISM3qUgRXNsPLHEQFRDO7QF0FDyErKmVoA8DIuIZULT1eqhJbl5Q?=
 =?us-ascii?Q?QuPE1BaeR8cKXmpu1ghHe91IFeKjtsJdS8RdMA7PTCnUEz1ZZED62wqlyPih?=
 =?us-ascii?Q?ZwN4RIaqezp/5/X3kkdo8WWzW1uA7oBR7+jLsoM4Lm7LmVWEdgqHM95+uM2D?=
 =?us-ascii?Q?nMGD/EffkzjiL3qEKGy/44XeBvzsCijXbiM457rDRZNw1+Z+9SgwtT0IUGd7?=
 =?us-ascii?Q?nIJx5/rtZus8MuWk+G3oik8yWdlY/HugHK7+ishFlTdiMeDNypsD0F1RqHh/?=
 =?us-ascii?Q?cyJZ5GCLoQxJLyqLVpnHFyJpk5t1EmpWdaHf2OIyI52MUG31Dnf1plgfrUXp?=
 =?us-ascii?Q?iQkJZjZT1Go1gXE1aR9A+CTo/An1LWYYE4Sp2uO++ezoSiufiCw5Bx0spNQH?=
 =?us-ascii?Q?QM/GG6EambQRsru4g1fIFegltxur32Qx2PGH/NSi28rlNVX6tvmEg1vB84jD?=
 =?us-ascii?Q?d26/0f9ozKwVGQsUwNCikmsn7bGmbuZCXWO6KJQCGV1VkGXZXPkGeSbPibbc?=
 =?us-ascii?Q?ITaIfw97FwttAQnQhA0UJER4LIB2QpNlc8Ea6089huP597Z8Xag9BnbVO8Zp?=
 =?us-ascii?Q?LWtuQVCs3P7OyfFE6uo+PVsAxL2cBsQ2r+GpmVjByGP11V4hjPV1NWsg5e/V?=
 =?us-ascii?Q?xNZUdMgoqs9ltmy4/gPvjNST3v5SdaXBBAYRSHChNSr6/jwcpJnLFr+MScQs?=
 =?us-ascii?Q?k/Z2/ZtLbss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w/unBsU8wfaIvF2ZhiCx96r4Wa2beeYqA7Zpx0XF+DmBrg9F+SM1PIApiZM2?=
 =?us-ascii?Q?AXbYIkITh4pm0F9ovm99NXvEkHTQtuJwA0wOSrx+qX3tr4FCTfewUltoF3i0?=
 =?us-ascii?Q?uYCOXDvRsVPOiqBOP/TufuiONqshVbnk9r+P4aB51EwWGTrlJSQzAerVCSx2?=
 =?us-ascii?Q?BO3pLtzYVU7cAysQ1Zt80+kO7jvCEDDSRFFlL2JNWJlHvxaXoH+OWjTAmjqz?=
 =?us-ascii?Q?cz9Z1v7mMkOi0tKNBEuWcYUqGikVaewAByWL5QTW+798oloXafyeWa2b+QuW?=
 =?us-ascii?Q?fBzZJSvuQlVNJ9x0k2M8ujqYmhYpw2xe81nvScHqMzw/cZmh4ClBd8QRGuDA?=
 =?us-ascii?Q?2uvPZu2qzRn9dsr3pHlNSsE8SWFsa3lcsL+Sf/XwUyy1Xl9v7+0RroJ7n9p/?=
 =?us-ascii?Q?P35r3graEH8MskhSfK7MgwOQSO4KVMxJSv47qMtWpWELbj6qFBKn1wLLUfm5?=
 =?us-ascii?Q?roPOz9ZSpTIcNSi39Bgzdj8XNAxMz2PA8ip5WjeLaBFvMIDWcVIhURa5usgz?=
 =?us-ascii?Q?u4x/oe/lzSeT9tjOe0BDhZN47/gYho5xccg79olU+AYHmDk9PUDcKhD5bBrs?=
 =?us-ascii?Q?LeBCR5ym3oSv2/8f3GhvhpTlpKUcZAXvGYSxMHIifsFzulQR5bhKB00y5p0H?=
 =?us-ascii?Q?oCVbQW1jB7syOLnrBn9W6f9SHtPA2ZDBs90U3ktIvHnZsgb/CzrQL2kleZNG?=
 =?us-ascii?Q?3O5A2jFjHrLhKroRBsyhzXd80ouBNn0TO+nw1QDDP2KJQJZ4GHb/8JDu/fkc?=
 =?us-ascii?Q?61XzLyoZkbDCi5CZf0X8G6HueEftPfALvbv0GHiVNVKxQCGxogOY/saLser4?=
 =?us-ascii?Q?17OTbFojzMADdV9YwxLqh8jFdNr2t5teinq0uRcg02Xh0JSxXV2xS2k8234K?=
 =?us-ascii?Q?s8cZTzTWszd+fsoY0AnkcYNALKy0ycK8Vq8zgV2hm225/bm9kq1gdWuPL/ip?=
 =?us-ascii?Q?0f+d5+E6Xv8chJzKw0WDgFhIQ8spTC7D+7mBIz5I2KKMu9ae7Zdt1y7fWfc/?=
 =?us-ascii?Q?xntUmuhunFR8AlOV2UTyuDxDq0DwskU8LDVTAThSMgjy/NO+yAxUVdXhcnBR?=
 =?us-ascii?Q?yvxIQen9zSZqay3tGfVrfkNl9LSfpoCRS7mafQi78JtMh0w3sEFEjmc8tKp/?=
 =?us-ascii?Q?8zgXeQjkFqH9lXnLikAgUYjXAonpqVR2KngrQvGP72+LTy40KvSwNRJDXQuy?=
 =?us-ascii?Q?7xhC8rl4RqltcKPxvru1pwkIIarq2g6LyEBAulbJ91w8kRrceCbUI4Rkl+Fc?=
 =?us-ascii?Q?J54E7IOEQFs2Q/SLb/S7MVPZXy4ptuNSk9GeJb1PugAyQF4qxjjKTO3E/Vzz?=
 =?us-ascii?Q?iTen/vjpaqfea/2prz7N+A7qLwTtfCzpuSfRJR/FUEvXX5B/tV5R8Mqz9UAK?=
 =?us-ascii?Q?mKEFOCC00VQnDM5K2phhjQVMaXl52Q2CzSYorKUD3131ioz58A1UgLG3rdRx?=
 =?us-ascii?Q?nVzGA2Epsj/mP1U7SM3xPSLqA1BKf6LwkkyrbK1qICVPtMe+NahPPGvS4uib?=
 =?us-ascii?Q?3WNKPh2bCpET4g9RFA5gDWxk5NKucYujiOE74v4+2WgvZkLdkdwTjZRnakKy?=
 =?us-ascii?Q?mab0TX1H4QJHZF6mJGP4ebWMuDP9CpldxEssIqI5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9792c75-f00a-4eaa-a170-08dd5cc41fe6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 15:32:37.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFYKYObov49Mt12XTmIEDvJK2e5lz370eYCI/Y5B8wMhToRYFWA09gR2uGWaHGGF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
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

On Thu, Mar 06, 2025 at 11:42:38AM +0100, Simona Vetter wrote:
> > Further, I just remembered, (Danilo please notice!) there is another
> > related issue here that DMA mappings *may not* outlive remove()
> > either. netdev had a bug related to this recently and it was all
> > agreed that it is not allowed. The kernel can crash in a couple of
> > different ways if you try to do this.
> > 
> > https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c
> 
> Hm for the physical dma I thought disabling pci bust master should put a
> stop to all this stuff?

Not in the general case. Many device classes (eg platform) don't have
something like "PCI bus master". It is also not always possible to
reset a device, even in PCI.

So the way things work today for module reload relies on the driver
duing a full quiet down so that the next driver to attach can safely
start up the device. Otherwise the next driver flips PCI bus master
back on and immediately UAFs memory through rouge DMA.

Relying on PCI Bus master also exposes a weakness we battled with in
kexec. When the new driver boots up it has to gain control of the
device and stop the DMA before flipping "PCI Bus Master" off. Almost
no drivers actually do this, and some HW can't even achieve it without
PCI reset (which is not always available). Meaning you end up with a
likely UAF flow if you rely on this technique.

> For the sw lifecycle stuff I honestly didn't know that was an issue, I
> guess that needs to be adressed in the dma-api wrappers or rust can blow
> up in funny ways. C drivers just walk all mappings and shoot them.

I wonder what people will come up with. DMA API is performance path,
people are not going to accept pointless overheads there.

IMHO whatever path the DMA API takes the MMIO design should follow
it.

> The trouble is that for real hotunplug, you need all this anyway. Because
> when you physically hotunplug the interrupts will be dead, the mmio will
> be gone any momem (not just at the beginnning of an rcu revocable
> section), so real hotunplug is worse than what we're trying to do here.

There are two kinds of real hotunplug, the friendly kind that we see
in physical PCI where you actually plonk a button on the case and wait
for the light to go off. Ie it is interactive and safe with the
OS. Very similar to module reloading.

And the hostile kind, like in thunderbolt, where it just goes away and
dies.

In the server world, other than nvme, we seem to focus on the friendly
kind.

> So randomly interrupts not happening is something you need to cope with no
> matter what.

Yes
 
> But for a driver unbind you _do_ have to worry about cleanly shutting down
> the hardware. For the above reasons and also in general putting hardware
> into a well-known (all off usually) state is better for then reloading a
> new driver version and binding that. Except that there's no way to tell
> whether your ->remove got called for unbinding or hotunplug.

IMHO it doesn't really matter, the driver has to support the most
difficult scenario anyhow. The only practical difference is that the
MMIO might return -1 to all reads and the interrupts are dead. If you
want to detect a gone PCI device then just do a register read and
check for -1, which some drivers like mlx5 are doing as part of their
resiliency strategy.

> pci device was physically unplugged or not, and so for developer
> convenience most pci drivers go with the "cleanly shut down everything"
> approach, which is the wrong thing to do for actual hotunplug.

I wouldn't say it is wrong. It is still the correct thing to do, and
following down the normal cleanup paths is a good way to ensure the
special case doesn't have bugs. The primary difference is you want to
understand the device is dead and stop waiting on it faster. Drivers
need to consider these things anyhow if they want resiliency against
device crashes, PCI link wobbles and so on that don't involve
remove().

Regardless, I think the point is clear that the driver author bears
alot of responsibility to sequence this stuff correctly as part of
their remove() implementation. The idea that Rust can magically make
all this safe against UAF or lockups seems incorrect.

> > Ah.. I guess rust would have to validate the function pointers and the
> > THIS_MODULE are consistent at runtime time before handing them off to
> > C to prevent this. Seems like a reasonable thing to put under some
> > CONFIG_DEBUG, also seems a bit hard to implement perhaps..
> 
> We should know the .text section of a module, so checking whether a
> pointer is within that shouldn't be too hard.

It is legal to pass a pointer to a function in a module that this
module is linked to as well. We do that sometimes.. Eg a fops having a
simple_xx pointer. So you'd need to do some graph analysis.

Jason
