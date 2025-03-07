Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6537A56AF6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E315F10EBAD;
	Fri,  7 Mar 2025 14:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="un+CgKhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E1A10EBB9;
 Fri,  7 Mar 2025 14:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl5274jrl5xtHk64Lf+6vhWVfTVrCr/yQSFH8jMiSJl0W+QyzPEVAd3FQDBQj6cFeL40cQBp8vi2iy61y3Va3lDqFlCQvUutNryKejtsDKDeZBsPTrt5ZNB8oygPBMD/wELRMS5K+bQP3eTTD1pl3MCdCAMj3EAapgJJkd0CTEdbn/nNOSWFvT+HpvF5nWONlO8gWLwlfQ2hTItHpIphBgwaDvIEqoPQTwGnvP3QBYmK7P1yG/LBT9QJ/SjvkAHm1K6mn69lMdONUfQOfNEFYK1UBRV3uWUO52WUvNIB88/1SrQKcw+xmvg/dyBil7th9VF32EdLgTshUyHRx5foWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMdu2Q6zRg+ZxSWBsdJm5DXWOe990dhSAfgt8WMbCSU=;
 b=hZwkrEO4OwPxx0WvwsWtwP1zbjpUIeL09MEj3xern3J55NNR91CSfqbHQjovTVGaxwda8FCu4cG60zRtYKnqWO/yQb/MpJH9onFfh1ciVtANeUmMTcbBru/9OL+O/6IjB1k+LiX18YEMn8elP2eAYERWjxScrIFrizqCTXGEv4mvBUFg2DAvSw/ihlmiGzJLAl4I07kC2QeeCQGOY4uva5QsJrO1Bog4+7thomFf6Htkzoe64OeABO5rtdse0eXHldZSXKY4dVcjQBrUOxBmuQxpQbsCFtCfPjSKVsLUhpny9B++vGPzF6/uYS1WaOpmX4CCbCcS1+QJoT/CfqlP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMdu2Q6zRg+ZxSWBsdJm5DXWOe990dhSAfgt8WMbCSU=;
 b=un+CgKhAyJSKbxJweWDFNlbjHwLQn0XNFBHwTySyrcPIwiRfqRydf76eY2q4vBt/t4QtKPxLjFwuzXZapI1k5Y7U+K15Dakk9B9GeJzcDEHNktynCqF8vIMmviykck06+Ddptkh83qteVcQ53MWS57cgkjWhj/7W7pimNdo1maBFrQcz2R+dTvG2R9iTowjjAEK6zaaNqtxI3t1M6s4VVMF8NVrqfjt/JQrLDjRpBERgy1lok2cghbDoCfr0Z1+6nVvKVvrUT4JJXDfQstJbrvKycLm9YJTlINV79LXKc7BegkV7kNdyhlqx4imcRTJMViyeRM85R0aFDfFuHV+Dcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.28; Fri, 7 Mar
 2025 14:55:59 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:55:59 +0000
Date: Fri, 7 Mar 2025 10:55:57 -0400
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
Message-ID: <20250307145557.GO354511@nvidia.com>
References: <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8rv-DQuGdxye28N@phenom.ffwll.local>
X-ClientProxiedBy: MN0PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:208:52d::20) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: fe64e87b-3939-4edb-50d1-08dd5d882be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DSBf3TDuYZxpHXsbm6hj7aZXq1BJbShIELTES6+l/y8SDkrURaosYRQVhiTo?=
 =?us-ascii?Q?ZXIv7HZ4Dy6encowgrb4gNM7ifjfri5H3HSm0pQlmQcADRs4cvKLYYxO8Ddk?=
 =?us-ascii?Q?LlKfLrXrAmamD7H1qJiLzY08zYiRv83KBSGBaf8UGj14gR3O68vquIgDmVTy?=
 =?us-ascii?Q?w3fcyjc+io59guB7VTEqvEQZm8coOdO5GG/fFl5ZQZl2cR3ToM1zE4VNyOXZ?=
 =?us-ascii?Q?wiJFKe47uDji7ka/4qeD4/8XRkKHO3kxlzKmJdNBV0T4o22Im/EDFCq2M+Jv?=
 =?us-ascii?Q?ffUwrPHblG3goSWR0lu11zUeNsB8W2qYzYDCdlvmXHD3AYk1uF1DOBVAR8q0?=
 =?us-ascii?Q?gbRIVwQZ4dJCMFKRRMr1qe9OqwOr0diEZihxW6xSGARXs1VzsGYvm2AvcsV8?=
 =?us-ascii?Q?5ZXJfK20Y+J4JC9ChltkHQSxInwxqfTmN1UbAVhkOz+3/HcOYbIrlmJgVZ1Y?=
 =?us-ascii?Q?4mmhXGxfESZ765Nm/DwUBNDJb31B3T4EKYryE7d79/CRfIOhe3nimR7kL130?=
 =?us-ascii?Q?fALilvWO5bbLkAv7PgR2za9MLtkSFrqxLojyWeglAbUYXARrXk/M+DpgtP99?=
 =?us-ascii?Q?yMkFwYx69HDAKOuVDa02txuaI+VkOQOaZBCahnxpALAneCxhWbSaMBN29+kN?=
 =?us-ascii?Q?DftkU6/KeZzeFha1gM39VvG+n2GwqCSJeoQGLosVHYgDe1slSMTg+LgvkNC2?=
 =?us-ascii?Q?FoaPl5A3FJ3dQ0e2Qtl61v0xaNF5mQaGcifU6o3O4tW+4MS3ImXsFgDb2Obt?=
 =?us-ascii?Q?o7Z5wmD+el/I5mnXKXlAD+KePevDtcjcNiVhpFTgvyt05bPMOF6C2Y/M6Vn2?=
 =?us-ascii?Q?6mKTs2QUMxTI/3IzHBn1mz7hsX6KBfmvZqgIaBPRlAqXKblOv38huC0gCePx?=
 =?us-ascii?Q?h2Pr294J4gFlmKvZ09JU7kvqxCZTw2AqqyuYsfhKWrDOPcYJVsNl4y8MVNCg?=
 =?us-ascii?Q?ulCkJyhbUE7PDP9VHSPj8/WENd5Bkh4OfT13E7VbctUNrKFu/TJkdugTz3wm?=
 =?us-ascii?Q?q9Qml3eP3tn+l38K9/TmptObYbWVo23bbTD4+z7VXN+DB/AUXQue7EIp19al?=
 =?us-ascii?Q?sdSJpA4HSrK5vFoe9lXhMqh71K08LVeC7wQnFV9eHEH5avNiH5IqHA/QYRW9?=
 =?us-ascii?Q?4YVgzLi0Uqg5MN+OyZG8UE5U7mc7GH3skRg2E0BEXaljkR8f1f1Rhq3+JsaE?=
 =?us-ascii?Q?jSMvfnXg8ebTwbzNQ4aLCjLxJ60FbIbPbUyzw3CK7wLT6vlnfScR1l9gKt1H?=
 =?us-ascii?Q?92lxshGN3/Fo2gPeny8tG7iYk8aUkV56Cd/naquX6kdGT2UqZtz9ALbZ1D5E?=
 =?us-ascii?Q?qKHgVOe6DZJlyqDgBL49lvyB9tFRJLDKORfySXRwK/pW4flMWHG4Ub7kYoqK?=
 =?us-ascii?Q?vDuXZ63IbkbXA9IBQmm5008+ObuQ6IscQLZIdP+8l7QYkukJSYlkhs2I5Uxa?=
 =?us-ascii?Q?CYVtijKCkcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VG7ALMoxdsL5MX2k8blA1LAuYpg969a78ntd2pjQBiwmuzINOZWLpCfRDffd?=
 =?us-ascii?Q?/iozN9ynP/KoQjSjw/FShcQjyR0y+wALqDQi5R3qw0YFn+bX/bEnQa6UDch+?=
 =?us-ascii?Q?qDc4MI3Z297xcjgoDfiFcAzvysy9X6k8gLPEmEwyP4F3vqB7B8Ke5qx1MttR?=
 =?us-ascii?Q?Rib0t7Zq4lj38bYYkBphrrqrH577/dpIYI44wUFOgQAuepmZIQj6i8fxnCW7?=
 =?us-ascii?Q?5as9BK9N/Mua+j8RRvgp5LkybYnzctT6J7kbXOfi75I3xh4GhHDzLrRdgs01?=
 =?us-ascii?Q?mXr6wcy2QYym/ROYkHhabOHiwbI40DxEAtAe1aTibYjqfHLjeXUAXGlqW+rp?=
 =?us-ascii?Q?v8+Ij+7TLcsWNVuSN8Bl9Z/U/RZ4l26IAhhEhPfV8euyN8Sa7+kg99Gq8Thn?=
 =?us-ascii?Q?UnfXmdWluM8c3gL6hjOSP2Mm+EjlVlNhVLwookllFxLyLxWEVXW14WqgrxcP?=
 =?us-ascii?Q?8z/7Rxb346kkcKCw4sCflJ1U4Ygm4aHU3ki0Gn5ZQwFA2apIWAlTGyi8e+Kw?=
 =?us-ascii?Q?/wy2EoSkKHOwTAQ0M9LytYnGisDf2HQpfgk9qHocMMSdMWIeyfZeF4AbebLt?=
 =?us-ascii?Q?s3pQFQCiwjURzaGx/25hXfXnvrbE4wU8yelD4bb1ChF7rdJ8w8L79MgG4olN?=
 =?us-ascii?Q?LoK+hMPaLGspKgoAqHTztHcJhk8COsJMQprSzJ61KTUoydyFuKLlGFr/FOz6?=
 =?us-ascii?Q?phaxKRaz4++RglNf43Qj38S9WZce4oG+lQuEjBtoNNXIh70bceyFVEaG56ni?=
 =?us-ascii?Q?4dxeqLgVEy6NKIm/RZa7Zp2nJOH2r+otNcx7nLJcuNsStgGqP5LOY3oiAo5N?=
 =?us-ascii?Q?W0Ka9WYa/Wh8iDz3ituRnAT/LfcT2Tu12ghrEP1ZXxYjHtWYegkFYNOoCwz1?=
 =?us-ascii?Q?JyO52StTtx2eIUDNEc+r+I2e8hdwa4UlmxFS1M86yOmw0VRQFhM3zG9WS+eV?=
 =?us-ascii?Q?e/Gm04VNvVLg06aAbGQZsbvV4HSKBc3QmmqFIPa7fc+hH8LHooRTtw/Yp6BH?=
 =?us-ascii?Q?k8twUrfTghe26eKAcefhWZbty1AQMdrnNvJYds0jR4trssGw604CGA2Cd04k?=
 =?us-ascii?Q?a/WK5x7EJyL2GURfVzxD6O7ZVtesu7r9KT8K437xiP9+ickXK4ECCub5eNoU?=
 =?us-ascii?Q?hZJ0fwcPdkNRtLDkXYMFuv71q3A8xvDr1B+WvZG36H/DpeE3IU81B3jlIhUP?=
 =?us-ascii?Q?dlWylfHT5iBWcRdX4+EApOOvux16EYO5kQJBH+wDmX5CrDPeZXWk//FFljB8?=
 =?us-ascii?Q?331uUA05MGBK4i7x8jDMpT+Jk72ZcubnpOMaIgsZPswfQUzuMkft/IOYlPPu?=
 =?us-ascii?Q?/pni/fUtAxpzOMucon+71j5d4iLJ89VE/XFqOBZ2IVuGdg+Wk07dFYXYONZq?=
 =?us-ascii?Q?2RBAW2mdTVuniUTZs3WEukiKCG4Lsm1rZiK7+42IESvz5uUTwcc1/ucQjxSV?=
 =?us-ascii?Q?jJdH6dSvgcC9EirBTjoSKl7ZX7c2jZXoJcsN4mxSSlhh/xnHTvBfHBgLPqVu?=
 =?us-ascii?Q?zKhPGyPbg6AG18ai3/rbBBzGURzGnYCQTxi2uE1nnBUWfNw8q5FRi/JbZ1wy?=
 =?us-ascii?Q?Ku7zINaIOM/pM/0Ii4A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe64e87b-3939-4edb-50d1-08dd5d882be6
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:55:59.2454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yq6LiDJ2YrG+0DShFMdNtHCWUw7tA0WX+3sq1NrxkDX7U8imgAxj6p1Fkc9V4nL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877
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

On Fri, Mar 07, 2025 at 02:09:12PM +0100, Simona Vetter wrote:

> > A driver can do a health check immediately in remove() and make a
> > decision if the device is alive or not to speed up removal in the
> > hostile hot unplug case.
> 
> Hm ... I guess when you get an all -1 read you check with a specific
> register to make sure it's not a false positive? Since for some registers
> that's a valid value.

Yes. mlx5 has HW designed to support this, but I imagine on most
devices you could find an ID register or something that won't be -1.

> - The "at least we don't blow up with memory safety issues" bare minimum
>   that the rust abstractions should guarantee. So revocable and friends.

I still really dislike recovable because it imposes a cost that is
unnecessary.

> And I think the latter safety fallback does not prevent you from doing the
> full fancy design, e.g. for revocable resources that only happens after
> your explicitly-coded ->remove() callback has finished. Which means you
> still have full access to the hw like anywhere else.

Yes, if you use rust bindings with something like RDMA then I would
expect that by the time remove is done everything is cleaned up and
all the revokable stuff was useless and never used.

This is why I dislike revoke so much. It is adding a bunch of garbage
all over the place that is *never used* if the driver is working
correctly.

I believe it is much better to runtime check that the driver is
correct and not burden the API design with this.

Giving people these features will only encourage them to write wrong
drivers.

This is not even a new idea, devm introduces automatic lifetime into
the kernel and I've sat in presentations about how devm has all sorts
of bug classes because of misuse. :\

> Does this sounds like a possible conclusion of this thread, or do we need
> to keep digging?

IDK, I think this should be socialized more. It is important as it
effects all drivers here out, and it is radically different to how the
kernel works today.

> Also now that I look at this problem as a two-level issue, I think drm is
> actually a lot better than what I explained. If you clean up driver state
> properly in ->remove (or as stack automatic cleanup functions that run
> before all the mmio/irq/whatever stuff disappears), then we are largely
> there already with being able to fully quiescent driver state enough to
> make sure no new requests can sneak in. 

That is the typical subsystem design!

Thanks,
Jason
