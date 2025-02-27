Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F3A48AFE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 23:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE610EB99;
	Thu, 27 Feb 2025 22:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mjOtz/Bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E1610EB99;
 Thu, 27 Feb 2025 22:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOxNqnF9w7hsNUfxA0n4KX9Bciq87dg47N9hoXMUwhnes4OwXMeF7L/6wiEJu0L4gBfgAKOuqDm3+2jzI+Si0WpL0OATwDZ6ZtmYQD5bR2YWIl6NgcJUq5C9fKQdcaz+2I2p45cGM+L9rcKpF/j6cKGgEi+RNh7H9CmxpUEC9EGsB7dL+YryUi3QGFsCujQ22bX6nmxyRPupVA2dT6OtixgZEE476mFBddhlIR2bxGZEsjSRIPGxmD14uODIhy9/PNLyiChNvHJqzRYNobz4AeYATzR9Kt6YWZE0voJ014tLjz92mecUygdd+Mvm3VKUtIDLo/jaWS5C3MGYtXgWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owgkmLZotW/mkb0oBXTI5xKcJ6KEWmqBQGIV7p+IHF0=;
 b=NoiFEVFK5Z4B3A4/tPY+cdBHvRvWDs4+/eN46Z0JrDniIHcEupxosyOTWA97hlMrZYcEFrF3gka671KeD9Kx9zwNKRktMkaaY6HzNavxM3ZRHbiWmVyQJ1uTYc+R1pUG5OOoU5UCUYY6Z7wcK979BHi0VvvphK+Hdb3BGos61+CpFKTdusHdHqTWOzxeNorNyUsaP75LnfXTDA8f1TwIjaGiUqVkhRici63PZZfH/LZyVcBR7frCajcGucKy6flZ0jmDe3Mg3Kzt4Ft85OHm682EdSZqya5ijnSfxoP3K4u0bOi/Yt9ciPOy+O7SgMuWYhM8lkehse3nPOZGN4DGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owgkmLZotW/mkb0oBXTI5xKcJ6KEWmqBQGIV7p+IHF0=;
 b=mjOtz/BhCQzceu8yaS6V4VpNZ/T8juzLvOF8l75n3eImGYRkI7X472dey0/4qw/+UdIe1szCHPjDJLAeIlbL7keo6eaQXI2F/NvMOeAF7vw0oKIWRBlB+/MFsR1Ja8Fn8/pH3Qghbb+QXnV0Y3hcPXgFiDnbWEYGqKz4RXuXCN1yTzBe8bwNN0xAkyw964VYW2t1RQ0PI77BdqlZ49qgRZEC7GkWTWxuea2Gt0hnhi2yRPSvoS4DkUicwJzLG5doleqOw7etlOXfQRFiCaghle+vQY5NZ0QRMWIP4tfC1QowJcyifoeZ2FUeTqThwWC8gi3+FtHxceRedNAVFjvEIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.22; Thu, 27 Feb 2025 22:00:16 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 22:00:16 +0000
Date: Thu, 27 Feb 2025 18:00:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250227220013.GQ39591@nvidia.com>
References: <Z7-IHgcVVS8XBurW@cassiopeiae> <20250226234730.GC39591@nvidia.com>
 <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8DYNszfONdsKZsl@boqun-archlinux>
X-ClientProxiedBy: BN9PR03CA0660.namprd03.prod.outlook.com
 (2603:10b6:408:13b::35) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 081d4146-ff11-4ff2-6b88-08dd577a1e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4FPIEh17SLbvctkgpXOU6xD4BhpFU6AciO/MCCbV8uoNyEn5iRhzU8Q0gXyW?=
 =?us-ascii?Q?iqIfomZEnv1M+q2X9h1MxINXPdseRtkHbFRscxs4F+p1gddu80Qv/q3JpvsO?=
 =?us-ascii?Q?g9I1hQS2LrmYo3BDqEAS6GK2TWyGFrOOQU5NTohjRPh1MM+4KSZY/440RXni?=
 =?us-ascii?Q?gJwwB2lywV1k8jy6g6l68+1wRCCcRabrjOwAy9WPeg1zJ+Mufft+87vIb0w3?=
 =?us-ascii?Q?ysUJuHvusjUJaH9WN+o8Wi/fgq06NljqZKzceLaFsUM4pVnKhaQIT4WUou1w?=
 =?us-ascii?Q?+ERRRWtwPgVtw+PH+fS9Ykj8troITm1mFugguz8UtK6mDSP5tKSwn74Co50x?=
 =?us-ascii?Q?VbQX035rPhAUxP5+VqRQC+xFqU26YQtfpHwyB1kYwt75zxnnWBxGZgcoayRs?=
 =?us-ascii?Q?L7IEih24JttBdmHIb5ewEYjRs3UlNgNAe32Pr9FyhmXK0aCcJwqp3rgrVMGq?=
 =?us-ascii?Q?hBAUtBY+W0m+8aQG1s/X/jQk3pTsRsajsOT7HAnwumlY3BS8kTW0ibMZ9oX/?=
 =?us-ascii?Q?TZCICRerT/WrEsfcyh4TbWPjiBjuUiG+IavURTTHkSyh0/9tkYpRNuKoWmxL?=
 =?us-ascii?Q?ZDnNvhglMIdPXzMuSuBVGmPGjbuKEE800qNHO3VVLiRMHhckvIXdnk/CZfxh?=
 =?us-ascii?Q?UOt2eN+HGxM21K9Lx6O8eX5+AVeg99qJOZFy28VPMQWy4t4BPS54SCrG3kx9?=
 =?us-ascii?Q?X+2Wq45ujgwAXmnt1ED6YPgIBQzNXtqyMfDDZMXiTvRO1NemSGvpJjmu5+KI?=
 =?us-ascii?Q?9gzVqGADsKoxS8EWVHvd5RE8qboPGez0JFHm8JdkVjqSXt3cD63SK/8rM22q?=
 =?us-ascii?Q?aginLSqZlA1sYk/4kGz+tdU1gP0+i5kcLynqLuS5GRNkv4ErRzdI4yXOVPxW?=
 =?us-ascii?Q?bthj8aWVlzofFbpzh+Z60GCaYYjLhJ1YQqQYIdHR9x5lQaC26C5wohh8y6pV?=
 =?us-ascii?Q?9FVANGqCf1MWtZgksowfDsb0CYeIt5TWQluURD7j5yCt4pA0d55owOQpsFmB?=
 =?us-ascii?Q?KfTG/G43aLfqse65POI51/4dcSaPVPn2UsWjqnJ4FoDaYI0cSjWTP/2cNrn6?=
 =?us-ascii?Q?HxorhCfrZx17wKyFip4t/FfLqjjgu1VsLcaQAXMFuAZk1U26ZE8C33rzuxNQ?=
 =?us-ascii?Q?088Eg07/jOTAM2/+kXkM7rR55OMAV4Hj2ODKPRbrBDfSTHelDk6OvjQK6FsJ?=
 =?us-ascii?Q?HesfFj1MqSqPmtJ+Rnvjpq0yaDq2zi/UBtjnE/uJuskdcMHG+ppDevatjvvY?=
 =?us-ascii?Q?3wFSzqcT/YkdyB4qhx5/wgOwqiM55BLOoOQYoQizR64EvNUMmBCvVvJwCJ8o?=
 =?us-ascii?Q?yRAmL5FR6U3vZ0a0DByzIn9ipuwQbm8+rHZn1sm8iu2D76nPUb4JqlMXNd1z?=
 =?us-ascii?Q?TzntnCAQYic1JfmWbpSRYsDUV1XY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jpO65VMjpuIwlqG+PRv2c6OUHE4WKjRINetGojbFFBKOG6/cRYo8J+Cu2Q6V?=
 =?us-ascii?Q?zS4UzwiDoMk49oQ2gAYOXxWY/E4KsW4WzyTDpkFsWxzl4btDW03IkmGY3pZa?=
 =?us-ascii?Q?4qJ/lKDw1eHOcqQ+IiWFlK8MOIaLbPDkHJKhd6fbcGn4+hJilDMpEOhvKj77?=
 =?us-ascii?Q?T56zNG3LpttJb0xFgFFHNJX51XHO/of6Is6BDndnSRTD+nf2e2YIm480+S/C?=
 =?us-ascii?Q?ZhslYksZMWYx0C7BpCkOUmzlhwcln9ZAGQEZ3PBZGMnIhj2tA+9Pl5mHjN/9?=
 =?us-ascii?Q?fch4Im2MAKXSXUJk93DM+uCw7i04Ax9Tlf/1tdhkOOXvKyJIqbMUFLYdxu9r?=
 =?us-ascii?Q?fYioftrlLFOa3DGHv1CSZpQGtj4xlV8Vp2py08IPI9f3S5pv/qJGnfx+sfMf?=
 =?us-ascii?Q?Rpb8r090Ea1h4+YWWLeVIf+VV0xTuS7sPfJ3kUR+wpP3ENRx6MZBsFYhfFHG?=
 =?us-ascii?Q?klYuGbhfgAKXBzuRVvDUwpcRzBUFruBXFm1+CGqh6/O0GyTHpxUue7H4qmYT?=
 =?us-ascii?Q?8hy1+r77U1uuV4vjLmSzP46JvZSyvBrX6csmPeQSl7LgidhrbBBr6Ld7ngo/?=
 =?us-ascii?Q?vkvfsjo3XJU7jmon08t04AAxD0VHSSgQG1OlyPrLbGt4CFuH5uPTLTOpVJLR?=
 =?us-ascii?Q?PyxiH00J0VutcMjY7gsU65d1ewPR3L69SJqmTxOoc9a9G+29liTJfvcbTL8g?=
 =?us-ascii?Q?x19WkgdunYDZ0ra9Ex0Fr/NATqDhH9+bU+v2iwUBZcrSgINXXu0BAehYyDyg?=
 =?us-ascii?Q?Pz5UfUiShXj7W978kN1Sud3SbAYMBOBjRZYk1Rm9WCj2ovYlZbFTwGFP05oB?=
 =?us-ascii?Q?Q59g+1LYblRqLMB4NX2dbkBdI/lMzNECDyHwTLyDSg0qX+8x1AuXcOu6YVze?=
 =?us-ascii?Q?mf/UV+USsZIvIYHLL+pSjcebVGoqdb9RzCB3lDw8bRWAlOEZ383kLfrVjtMa?=
 =?us-ascii?Q?ndJ/zHA0/Bf5fpUCUajqYAOhapvVPKf4Q3zbgkizDbyQaf2n1pNOu6a9O2RK?=
 =?us-ascii?Q?K2idl3ri3qLNcV22fRtkdcZp2FxF+L4RFhyu2eg7KwTks1MX7mImO2pFAGf0?=
 =?us-ascii?Q?lv3Gm8qnVpFg48hdHn7bCRR3yJ0dAUKZDeX96XmUzNutE9uL58fPLHdntYxE?=
 =?us-ascii?Q?YKtVm4LcmfcijiJyi8MyW9UHZhgt7uH1aVfejEcKeAaL20+If1tC4xPw/SX/?=
 =?us-ascii?Q?LKMX/QGh3no6HRGxFRGrCISEpA04RxQp7NgEPzT0YBPYTC3flF9A2ipjoFTB?=
 =?us-ascii?Q?0wvZ/t2Zy6yGPttSpL5e7y0C4wa+21Amr7Kes/Hdu6teGmjkMFAQU4SYjR2Z?=
 =?us-ascii?Q?lRWNviVdp4LIxWjUC9iLk39XMJrEPDfhhSEYXgN3bg4rj7zT+92J/98AJCOV?=
 =?us-ascii?Q?9hoFzwxsnIAuWCyTZqFja3Eup0Ylkey0735YVp3T0nbuqsDKloOtUMfaQFQH?=
 =?us-ascii?Q?mQZJKsUD8wgOPxX/BzoxqLiVlfA9IP3L3A97HknQ6ZfZZCX7oQ4KJ+PMGYbU?=
 =?us-ascii?Q?ugj0skvTUerSeCmfSZ9dJHoPMNE5LVcMWXVedHnoYtZPQiQg5V1I6B4gvFga?=
 =?us-ascii?Q?vKZP3Q/gHzq3q8Fkt1o=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081d4146-ff11-4ff2-6b88-08dd577a1e09
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 22:00:16.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2y2gJxn/77NAMkS3AS+mHY/Ku+HKsN/lamOuVvkz7Q0rHDYVUblnX34nlDomuw1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
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

On Thu, Feb 27, 2025 at 01:25:10PM -0800, Boqun Feng wrote:
> > The design pattern says that 'share it with the rest of the world' is
> > a bug. A driver following the pattern cannot do that, it must contain
> > the driver objects within the driver scope and free them. In C we
> 
> I cannot speak for Danilo, but IIUC, the 'share it with the rest of the
> world' things are the ones that drivers can share, for example, I
> suppose (not a network expert) a NIC driver can share the packet object
> with the upper layer of netowrk.

I'm having a bit of trouble parsing this sentence..

In your example a NIC driver passing a packet into the network stack
would still be within the world of the driver.

Outside the world would be assigning the packet to a global
variable.

It is a very similar idea to what you explained about the module
lifetime, just instead of module __exit being the terminal point, it
is driver remove().

> > It appears to me that the main issue here is that nobody has figured
> > out how to make rust have rules that can enforce that design pattern.
> 
> Most of the cases, it should be naturally achieved, because you already
> bind the objects into your module or driver, otherwise they would be
> already cancelled and freed. 

I'm getting the feeling you can probably naturally achieve the
required destructors, but I think Danillo is concerned that since it
isn't *mandatory* it isn't safe/sound.

> So I think in Rust you can have the "design pattern", the difference is
> instead of putting cancel/free functions carefully in some remove()
> function, you will need to (still!) carefully arrange the fields in your
> driver/module data structure, and you can have more fine grained control
> by writting the drop() function for the driver/module data structure.

That all makes sense, but again, the challenge seems to be making that
mandatory so it is all safe.

If you can show people a sketch how you think that could work it would
probably help.

> I feel I'm still missing some contexts why Devres<T> is related to the
> "design pattern", so I will just skip this part for now... Hope we are
> on the same page of the "design pattern" in Rust?

There is a requirement that a certain C destructor function be
*guaranteed* to be called during remove().

Ie if I told you that the C functions *required* hrtimer_cancel() be
called in the device_driver remove for correctness, how could you
accomplish this? And avoid an UAF of the hrtimer from other threads?
And do it without adding new locks. And prevent the driver author from
escaping these requirements.

Then you have the design pattern I'm talking about.

Is it clearer?

Jason
