Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E611A4E667
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203F10E7A4;
	Tue,  4 Mar 2025 16:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YRSOYs3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30FB10E7A4;
 Tue,  4 Mar 2025 16:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoYTlXh0PF5NuDrqVhwLZ8I4zQ69yvUFwpgiMDcThcKeIuwmxZCioE/AxRUT4tlj+wXQ3krm/unZXA/w3dGoVVQob5SIcBJfGK0Uk7BA0ohWUzei82nq4uljimnh2qCFcVqSELzmMhE9cPndfqEm9NxndcoUHFvMOSM0vp1yRk9nE0Jt/BJujQq9WZFnKKz+bn7YiaM/yY9uuAHdyJunViujMEACi2Gu511Yn4ZKQiOzaXIJWh8tAUbBEX+xlFNDTaTfWhzueJcp07BJqSOGkTupWm+HJ5sM+rjL8xS6AfvaXqa24dSX7uDFsLDhMNO2mWm01BUqcU4Y2+zcitvKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPpxj+oNPkeZPFZ4tV7Pd4jX1p8fL2IFLsju0NH38Oc=;
 b=lTmxD4Rrwfeo7sp8s6Ok9lloIOSqMKBGK8+WebYFjQrtJySy1200kBL0mIfUjUgVu/qCJqAvOOts4LkYSVmPoC/yn5rtWkbJiCe8dX3sbxgIdbz2Nm2a8UKtmDdKmTPOkEtQOyzayCJ6TI5xAS7ixnou7kpcnkJnWGGYYYmyhiPaLT1Wd2ip7gm3mC31eE7DiaPt/cUSOh4SnR4+NEAOL+yYaD78jsj9hFuB0w4mCfVOtaQEOeBnkvHR2yGjjXXY2u61TE/BbnSJy7rnqQj5CcQmsxwNv8I3ivEV+Go332C75C3x59sM1wnA1mG7/5eOiyJOn3eNhzZ7J53G97hPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPpxj+oNPkeZPFZ4tV7Pd4jX1p8fL2IFLsju0NH38Oc=;
 b=YRSOYs3akfVQ9UF+cR28Ae6yDqu1OiZ3cOz4VdE1GnXxlDVQ4MPloNMxuFIUrZYSE8Fw0vpzMipK/+wcrpcVlD5V2VG6QvS2V9JrLtd/i49lj7XeWAyomDz6iWRcr4dPtcugsOrGMuHwv/yAmDou0RSnvYQkZwRKfGbqORvj8Swg4JXlCjpiD4tsZpFVPvzbt7Jzu+o+o10wtKOd5rZ66cEU//qJae5ztjTc1WDYUV2JDqnclPwNzmEQvUgPCnwOkx1ajCJaPYu9yDGxJtHoES2Ee6vuHklvV4pXTB8QfAF/JguKEBXMQGUKSE1lPtVT7d2fGiTz5P12xmCK8QwQkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 16:42:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:42:02 +0000
Date: Tue, 4 Mar 2025 12:42:01 -0400
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
Message-ID: <20250304164201.GN133783@nvidia.com>
References: <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
X-ClientProxiedBy: BN9PR03CA0566.namprd03.prod.outlook.com
 (2603:10b6:408:138::31) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: cf477202-ba55-47ef-7a1e-08dd5b3b7da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M/Q6ghid9cZXurpGYllQrCpdpe3RHN0uxBdfw/pWxC3aVQrUG9YUCIi+djzR?=
 =?us-ascii?Q?aI0v7S51o1tYva+6fn1m3X7Ts0Dj3XwnZlXc0aAvxaw8GQgr/ZNkzxzJj9tf?=
 =?us-ascii?Q?9qKdA7KNmqlDmSdW3Rro8eHf/Y+frYwnqxhUgWosUVEoocjFccEtgQYa3rP4?=
 =?us-ascii?Q?4RbzoKDhxKP7xIDgPUP5pHYL9ptTKxDUmJWdvxOMECibGiUUSTgiLJ/+eWl2?=
 =?us-ascii?Q?NNZ6+fCn1i/amb1RBNrI1GVaJrFQSEYHkSZTTmucrjnW8SxjE3a/1mVfl5EM?=
 =?us-ascii?Q?zH+pzUEXR+YzuLPCr55OXecp+GVoRIwMeb3ZBSOfh47BMDpIKQsngBtgVE2i?=
 =?us-ascii?Q?6IVVG5VcnrT9tMKNX0ZtdnXLlD/pBI9OfiXMmoBw8cNdyPXQ6qEe8BIJlbJc?=
 =?us-ascii?Q?1gAa21vR4AusbQPzxvm8caF3Cr3ZKL3zfORI0JSxb6XUcGH9EBp9wETtolXC?=
 =?us-ascii?Q?J0yiEaJtCiWW7DhFSDk2OfQTdhnzVT3DpVqfhpslYI2isROaNtdngEXAwhTS?=
 =?us-ascii?Q?LKiAxMpryt7wXlCGoPms7ghSH+mezUOlJHFFtFTWULObyaYXcpUXGXK9GhrL?=
 =?us-ascii?Q?2Od8akQXF4hnEd43/Wq+rRMwqqob/0d0btVCmkmPmaGGryDJ3i1vyqUt+SUM?=
 =?us-ascii?Q?Upd95x+pdVhAHjguB3t+EUlMVXk5Inct3aKDelAURs+T+DzIj+Ib8lyenuEV?=
 =?us-ascii?Q?nH2lS5SmXC4NgpSek05A2FlnecKPJCT8cTT+qmJV0TnSm0D8cFhTmIseHUak?=
 =?us-ascii?Q?Do1IFOG2oXNmb8OT7JcewXFCzENX79awGQ70mYoF9Nk34rOFk8gpfILicU2E?=
 =?us-ascii?Q?Fc2HyD3pdPgO+w4L7j35FcAsK25l8SPbLXUiYDUqbnXWlH2mWKcPzkao1dGw?=
 =?us-ascii?Q?orEniFtk2th/GF+tg9I/e5peSQFTUpPrbfCaj25mHSIwymuKRIvuppVCHPjl?=
 =?us-ascii?Q?TiwSMiHWmCErMNKj8XN7idC7TrMV89uiLXwT6Mcq7Aiivsz4zdXIynoP7TF3?=
 =?us-ascii?Q?g8FBaQQBnsOYTzyANtnO52dcXwVriIsfjlOXdC12589lfPcMsI0kWy/n1CQI?=
 =?us-ascii?Q?JappNIpJK+M7lO1lu5jNNrabP7/2fBcp7/YyXhwo1lTzdj6sCsA+jhOof3lw?=
 =?us-ascii?Q?3hq9q7NZG01/Ih14jKCsFmFb/u8zVeLs2btryWTxWGYn1CMYmGjWvKSNHDJU?=
 =?us-ascii?Q?cbQj1neloRK+FwhYG6nENiATnBdR2Yr7oLPHijs31USh0GsccdWhQkmzXIzw?=
 =?us-ascii?Q?zI2O/UlklTdhwgLma4qFwVIu/xE3h7+MDnbRLe1wYfHNf2s30ZOLsqc+2iI1?=
 =?us-ascii?Q?iKRuI0ytG8MEk89AHJnUgFvukLkNbum3+Tp76F3h+Q3jucrZtgWeBHQrwdb0?=
 =?us-ascii?Q?zGSqb0AN4fUgvM6mRFOLm4kL2e3fKbiRskhhPSQjnG4Xar25NvT+gd93Af0r?=
 =?us-ascii?Q?7G+6Saa1Rdw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/tKvdZoFiXEIwY7BD39OXAFVhtBmxCb/MK0cVrb9o3bC/syZAiGXIdNMZWb5?=
 =?us-ascii?Q?ASp9PEFGrSkleiys3HdTUHJXbzhAc4pnzrgQiCc7LvWzuQGvixr7e1yxVgvv?=
 =?us-ascii?Q?838bNguh7KCUQHU8+lJ0+k71Dzv/yvE/McUNIRhQkcfK1MeKTlY6rnM5NWvM?=
 =?us-ascii?Q?ZZaYJABmH3M4vW0ZV58+F+bV6a6AITFOQt+5KntUiNcUFPhTXlab5ao3+0ug?=
 =?us-ascii?Q?A9NZ9InYnJPaaUJ5SJgpz7vFevq5Ou0xlDqzYnBnKfQ0AZzK9K8pRtlXpDcL?=
 =?us-ascii?Q?+dvaj//rW/yklS9e8zDKE8YIIUWOtvZHttmQYH6Os6IrnNvzLRLB1mqITkCF?=
 =?us-ascii?Q?p4cq8pD8TqcaaFTjzA8buvDT9NmY+J8hIkzHkU6Ettida9cKFf6zJ/Fb8z+x?=
 =?us-ascii?Q?B37L1RKk4rXVIM58TAi6ppg2qSOrmnYfAgLG7RFnMEO1k6sF21GWVr0KDmct?=
 =?us-ascii?Q?33e8ZFWsv2CsbebcVSJ35m0jS60LubqmAHwOjkAAaZiObs6u2FqWLuFUoYam?=
 =?us-ascii?Q?ADLDZTs/OASoVb4TctotYJsNy/vH9CAs7Gyl8OadI8lf0S+23tGHnKH9d7vq?=
 =?us-ascii?Q?8TsOXQYgm+vnGvQdeoR106kgVLAnfKUauxo1CMx5Q7kN4HCbzDKp/l+locNC?=
 =?us-ascii?Q?X4FsRp62BfXPNb2z/PhsVS2u5eRMgbAkWdizEWgQwAmRvyl/K6kpdME0Sb77?=
 =?us-ascii?Q?wpv1IGMPlR8UJ7rzRDFTuNhSs3WTwqiGaoE1BNNe23IfiqV1dcfGj4J/Tq6t?=
 =?us-ascii?Q?Wdc0DGX+St1WnJB185EDgF+UoUU/R9TQi3UADSpMN6bt9zbdT9E30vzZJUCE?=
 =?us-ascii?Q?Rb/ZkYbaLk/aPGJ+QX1hmYiUVDFOa/nIlvJGf+Ae6bofTaEXpkV9/eIdTye+?=
 =?us-ascii?Q?9LdFIkeKsGgBU+ULXoja1iT7Rfz+lRSwyjH5l+W++vbB/BodgzWEuRfzBeVR?=
 =?us-ascii?Q?DqR8qZufDSEvOR1RDD6WTqlUI0vQXVE/jjPoWX6dPGFbIM81UCV1Mq4I1zra?=
 =?us-ascii?Q?/ty0nwKfWEIhWKoBId/5m/KOaM6Z+mJe+C9IweP0xXnjkyBvUCJFn/JPlSyl?=
 =?us-ascii?Q?Au7YmaKvCbCDnsbn0ZWWeIBn0G9xpFywO4+Qj3UT7/C5imL2lT4QCfzpYR4m?=
 =?us-ascii?Q?Eq98+gCRMAZj8t7cDFNqKRt93qNdaFKRM5SkZh6PVBFIkpdqfyDjzBREuqY7?=
 =?us-ascii?Q?FogZROusqxLCdDj0DvzXe4Uu+fxFOgvAhPNqRWST9Zm/iW97mMi9nGY7n3/T?=
 =?us-ascii?Q?sCSNycAFEdg0tMW13+WOId18cZeX4OPKoGi+gO5GtemGCUSc03c8m37TP3bN?=
 =?us-ascii?Q?EOmHQselQhy+JWxJ9xjSoxDoRxW2QlE4r3AtSQwIE1O+cSlYrLhOrTS6stHB?=
 =?us-ascii?Q?DmDzNNDBnYWPi9osOU0frxijRaqTdQtf23fNewoH81tBmdvHfoxqYpB1bZrT?=
 =?us-ascii?Q?/ynW7gKTm/ohEOPp9yskiKCfFJX+rVyv1ogskImX/sUXd5Jjn/tjTc34TaL/?=
 =?us-ascii?Q?jzAEnx+tdaa5ML6YalWqEwHkGb4lN2Mgb2Dd8U5Wr/18P0ZRheJjummFAgbW?=
 =?us-ascii?Q?WjhzERVHDEhWohBGgMk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf477202-ba55-47ef-7a1e-08dd5b3b7da9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:42:02.8455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTaL36z32RkblZ3mv6z8ymMWQvbodujlTIqlc3poe3TG/TX/pDMEkmVEvUhkzQzx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773
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

On Tue, Mar 04, 2025 at 05:10:45PM +0100, Simona Vetter wrote:
> On Fri, Feb 28, 2025 at 02:40:13PM -0400, Jason Gunthorpe wrote:
> > On Fri, Feb 28, 2025 at 11:52:57AM +0100, Simona Vetter wrote:
> > 
> > > - Nuke the driver binding manually through sysfs with the unbind files.
> > > - Nuke all userspace that might beholding files and other resources open.
> > > - At this point the module refcount should be zero and you can unload it.
> > > 
> > > Except developers really don't like the manual unbind step, and so we're
> > > missing try_module_get() in a bunch of places where it really should be.
> > 
> > IMHO they are not missing, we just have a general rule that if a
> > cleanup function, required to be called prior to module exit, revokes
> > any .text pointers then you don't need to hold the module refcount.
> > 
> > file_operations doesn't have such a cleanup function which is why it
> > takes the refcount.
> > 
> > hrtimer does have such a function which is why it doesn't take the
> > refcount.
> 
> I was talking about a bunch of other places, where it works like
> file_operations, except we don't bother with the module reference count.
> I've seen patches fly by where people "fix" these things because module
> unload is "broken".

Sure, but there are only two correct API approaches, either you
require the user to make a cancel call that sanitizes the module
references, or you manage them internally.

Hope and pray isn't an option :)

> gpu drivers can hog console_lock (yes we're trying to get away from that
> as much as possible), at that point a cavalier attitude of "you can just
> wait" isn't very appreciated.

What are you trying to solve here? If the system is already stuck
infinitely on the console lock why is module remove even being
considered?

module remove shouldn't be a remedy for a crashed driver...

> > But so is half removing the driver while it is doing *anything* and
> > trying to mitigate that with a different kind of hard to do locking
> > fix. *shrug*
> 
> The thing is that rust helps you enormously with implementing revocable
> resources and making sure you're not cheating with all the bail-out paths.

Assuming a half alive driver with MMIO and interrupts ripped away
doesn't lock up.

Assuming all your interrupt triggered sleeps have gained a shootdown
mechanism.

Assuming all the new extra error paths this creates don't corrupt the
internal state of the driver and cause it to lockup.

Meh. It doesn't seem like such an obvious win to me. Personally I'm
terrified of the idea of a zombie driver half sitting around in a
totally untestable configuration working properly..

> It cannot help you with making sure you have interruptible/abortable
> sleeps in all the right places. 

:(

> > Like, I see a THIS_MODULE in driver->fops == amdgpu_driver_kms_fops ?
> 
> Yeah it's there, except only for the userspace references and not for the
> kernel internal ones. Because developers get a bit prickle about adding
> those unfortunately due to "it breaks module unload". Maybe we just should
> add them, at least for rust.

Yeah, I think such obviously wrong things should be pushed back
against. We don't want EAF bugs in the kernel, we want security...

> You've missed the "it will upset developers part". I've seen people remove
> module references that are needed, to "fix" driver unloading.

When done properly the module can be unloaded. Most rdma driver
modules are unloadable, live, while FDs are open.

> The third part is that I'm not aware of anything in rust that would
> guarantee that the function pointer and the module reference actually
> belong to each another. Which means another runtime check most likely, and
> hence another thing that shouldn't fail which kinda can now.

I suspect it has to come from the C code API contracts, which leak
into the binding design.

If the C API handles module refcounting internally then rust is fine
so long as it enforces THIS_MODULE.

If the C API requires cancel then rust is fine so long as the binding
guarantees cancel before module unload.

Jason
