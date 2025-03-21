Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8CA6BA44
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 13:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0DD10E124;
	Fri, 21 Mar 2025 12:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LfaJ3WYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85C10E123;
 Fri, 21 Mar 2025 12:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCax0S6fUQ/esI4uZPR+S/MBejympJywjyzrWbCvWHqNP6bfjAlX92YzY+brWSX51GPvoML4IWbiBW/hcU1vgbX899rrf9gSWsT5lucKdARjuR7aAVqApQIbhKdFw9dCWJkNm6zfnDq7DhRQ6szxZ4JZ74+lJulgKUFRhsJJyo5NOf1B4tcO0dLsJX3x5hxF5BSiC1ZqOdX6tyM+OFYL+rAxc94Bwg8BGynt2lLWwWoQd72D0FKdIDIn4zA6yQRNHa8yZkq4d1/oqH9McCe2NQZJJ5K82BTGckkiJ0h7G/wZ5RMRzG/Uhhr9HYwoiSa3A+9MiVKFbx1tGTIAWNuU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnQukxjp0bMi30beZqA36jQv4qo0dV1I8mAWhzRKfDo=;
 b=rGqczML8swm422OD+DOj2ZR+x8A4q6MOqLpMer3hSMqOW4nLc2yjgVDuOmgcLZEmYCFxbR1z10W6FdjBAvEr0TYSdTqpe4Bmimlt9/LSmZadKGPUTn+6cl04V9yp3iJMfYG/TTa4Zl5u5MQWlA/eryc/py2KxX3Al2UIkBrkNYUmVhlJ2rGPiAmwMACFccwHc/uf9LsbwSGTH9dOPRc9jzyVoYa8nH7Wi4gsC8qQ2SWxf/NjRIZ7AXhnf1aqmV6qLOWbzCq89IDI/+V8s/HVl3lFT5ILpayzdkjuCGnMjOVGawOpgt/nUjk0NRklO0JA2u3N0lw1E2a375/gj6S9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnQukxjp0bMi30beZqA36jQv4qo0dV1I8mAWhzRKfDo=;
 b=LfaJ3WYO72SGC2dx2dPwG0CY/SlWDRNE35yS1ulH0quGn1i/SKpUJZg39cez0ulTQeDdYghxnwVybdOWyEsk3qo/eSmozDiNBT5ACt7LXeka+By8fdrRREVTIjXWvsWhVuO/CrACjvRsUlcwzNxkGUd52Rc0pbcsGlyXQYhMJ4+6YauUlYnKY4kW4DYqF+o3Qy64ggF2jsmR4lemMUwHXjXxGRBwh+ZywH4FMPuzuUBV7EoWAagCjTkvdR6rQrDPYIpSgwsW/iaVeEN3teYEkwJOZDhk6IWiYRB+52/6ssWgtDPpK6vx7OKOSYM37DaSDV8rztfsJtkl8hwIUp+sig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BN7PPF02710D35B.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Fri, 21 Mar
 2025 12:04:17 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 12:04:17 +0000
Date: Fri, 21 Mar 2025 09:04:16 -0300
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
Message-ID: <20250321120416.GX206770@nvidia.com>
References: <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
 <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
 <20250319172132.GL9311@nvidia.com>
 <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z91A_Dz-nY2iFqYb@phenom.ffwll.local>
X-ClientProxiedBy: BLAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:32b::6) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BN7PPF02710D35B:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b864be8-05d6-44d6-3d6b-08dd68708181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jL4TpqM079bbrXt6+oDeNnTd1GeKNL/J+UL/699OR/zisO51LrVO169jOUcS?=
 =?us-ascii?Q?lODa8bs858F523UgDho9nLVdlbNE7905HzfIwe1LzyjXQReTD2Hxueihw0Xf?=
 =?us-ascii?Q?7q//6evB8uFZe4MbU4VvH40ETirnapBPo/9j4+3ncC3dU9sFXSjgcr3sDK2Q?=
 =?us-ascii?Q?0pGjqNi2fNV3f5JAKBrrhmULRdgygQaqv3DeUde4nyRL9iw+Pw1dmpPvCdKr?=
 =?us-ascii?Q?KKhxOWblR27198VJDsP8PWOvqJSdOIfg090l9KnTYQWkHqHaShw9rUbYGAmC?=
 =?us-ascii?Q?iltH6IIUisFao3bonlCfUCKts7Ci3aHGS7e4PsXfDouMRTSfc1RsY+S4xHuP?=
 =?us-ascii?Q?c8P3T+VY6AgURrMzzJrmqFoxF/f1FfckAA1sqgZZ0uGoWBCecCXRTJtM652f?=
 =?us-ascii?Q?tL3geTkkJ9q5mg4MIYktYidrZI3XaYirwDc8SK9dtwvzlvLjz14KXC3HeYez?=
 =?us-ascii?Q?yzaGkXQH04OdantD+3w4tgVOxGQJKHOxCj9zqOnk0hEI8MKGa3gXnkixBdYi?=
 =?us-ascii?Q?qjwFdISIKeRZJF0RdFgYUf0Tg9G5vohASwW7dM/f4NdZrNeaz4+bSY98A7F3?=
 =?us-ascii?Q?CgWDdSVdmD9/tmatX2HJk5E1+GPn18pgyTFN/q1fDS5RuX2+NJrluDypWbg/?=
 =?us-ascii?Q?G5AZEWeDGgxtonUtBBhQ8s7E+Wr+hGA7utsvxLXpwnvvLMWlklHooPWBffmg?=
 =?us-ascii?Q?hN8nAekSrGP7dxLIr5eU/+NYtfD7XjnwFBLnad2sh3Sl/9fTKWQg7+uqlZZr?=
 =?us-ascii?Q?H5C49z/kZWUHoJwGkxCG5oGP1baJLB+zP+zdD/Yy13V9EKroooixjOiK2eIj?=
 =?us-ascii?Q?fy1ZH7QQUwSrQh8RmAyH8220xucv6BzmoBxtFFgUG/ltETNx7VZbDhfP7Hvc?=
 =?us-ascii?Q?l5v4YbbJyeihjLb7MiDI3uqp5H/LkERD/nulV8HIkvJwjQfrfgocMv+2A432?=
 =?us-ascii?Q?S+lXCxKW9lbYXL4JC1xUtf8roTzhl5KIqH/Wrj9lqjyQFED6MEO3V3zmnOEq?=
 =?us-ascii?Q?PC+jLqhHeGU2zJ7fp0mgpneekAvKONb6ps+1+T3OrW7sxqRfhQ86yZw33ong?=
 =?us-ascii?Q?lGIc/tcstrplBU2glCE4o4fFlLrfINzab3//Fm+NWf8QDmUKBTzgRs1en1nP?=
 =?us-ascii?Q?MYBxzjrgSR6B99x5kJxcQvKCCbElrSecwvK45yIN660WPtHrCIko1Wd62w2d?=
 =?us-ascii?Q?ue7TrfMfve2T9uL+cJGj8ikyQAJ6z+4teelM951RpzUVtXSK6Hc/V1AoFyFy?=
 =?us-ascii?Q?NM/+FXcnSAMnPvNrbNpd6iUppsltfpWDhlBKUn5hIJ2ldgXqWAWG6gWa94+y?=
 =?us-ascii?Q?rlxR7/DbjiFjp1Q0zadQKPBiOo+N5BauST+KDHl5dkvZH3JHHUBbXGm/7j3Y?=
 =?us-ascii?Q?jdG43n2Wp6TbqkcMZXO2Jzt4SD6fxAXl7G2XxkQmRePvY6wTCNeMKMZLipof?=
 =?us-ascii?Q?K5IINsarPg4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVnXSKLRV5J/4URwudDCTsYKb8omIRrfLN8zyRn85DV6u8x2nTZzdwbNVQa/?=
 =?us-ascii?Q?7o/nHbtbvONP9Cz+ywyKDxqUkCx0C4oLxhJR/qrEGgLT/1ebs77M0ROZ9Lks?=
 =?us-ascii?Q?Q7aSSIL2FEC1/m8eM8ICYpRe5f+nE9H4dndd65q7GFJTM7UoGBKm3xhy+ypU?=
 =?us-ascii?Q?KIcW224cFnorMVu+/wDW1+qtLoegfbRrPwBuNrcG76b3pwwwNUHFl/+umEBl?=
 =?us-ascii?Q?JpY7hia4AaJzoHWz/fGGvnB1JB9OsgwdOJGv/OW3F9quEpoRgbJ7qQAzqULS?=
 =?us-ascii?Q?+Z0rwXRCTkUlltM9PFU+vuYg4xszzoonL/gHoFtfGI5o1TtQD0ZM/0WaXE+z?=
 =?us-ascii?Q?JB7IOvE5rXxYDrvncLd/uy1InwB9OsGcGepaDgCRIYRg+Wuw6hQePquTW2dC?=
 =?us-ascii?Q?Y68VKXzzP3f54rcOZqd/HOQcdFulj+yRmD+5+G/zX6k7kdva0v7kwjfuTYJL?=
 =?us-ascii?Q?RkjYV/6GzFN/QYCm9QJ4lXphTR601E4hGnqZte7bp2i/lYT+k0SseX+pQYdd?=
 =?us-ascii?Q?IByyL8tTTbH1J5ZJmqaNxWiuhLoINl+UTzgsCbaBRLwykIuuhvexePntpcXQ?=
 =?us-ascii?Q?YDy7wx+lOwWmRHuyHddtf7poOpcThvgZjv6pvsyVtMuwWozhNKNdUbXMPiP6?=
 =?us-ascii?Q?XXVKVMHzq3knnnSB5Z11FaYAe2cZR2/mQ7UZWPuApWBY/L/0FDlr48xNVkFE?=
 =?us-ascii?Q?4TdqjozGb0MoPGbZMucPAjItiYpfjK6oxrvXUjKhl37OQgigzSQi6ehJjbYZ?=
 =?us-ascii?Q?ujWBB+o1/u9Fx8YM2PznqRvSKb/zOVQoi//w7r/JA6wlSyMM+ltApOE9gkc6?=
 =?us-ascii?Q?dLdPVXrkzN/2uMma9zN/kAx/wLrfkWPqkiXDmX79aXJX1loRrIDRBgCWS+JH?=
 =?us-ascii?Q?nPghLlMtXwJ8x66kiR9ZeUo+KKmX/Z52aTxwNMMlnBCB8oUSMjAg86UIE6Xc?=
 =?us-ascii?Q?MuoYYH3/8bGhrPs6yUwW5VgaKAKIatdUwFh3h7DHGYfLrzyFq1Xtn1kS+bGE?=
 =?us-ascii?Q?geAP8Ci4zHn5n8UJDk8axNlMQa5/F1vrt6kmQpuYb0nX0zv1xjnokzAgO1J5?=
 =?us-ascii?Q?EYaEo8KVoIt/l2uQtwNMIRpJJE+geZIiAKdVPN8XSUg+AXF/Qr3o5ptDG2jS?=
 =?us-ascii?Q?2D8KYRTCGVEsavnlJrqYWGY7PnkMSnoKIGrrZyJpvhy5Njw39t8uJquEaDMe?=
 =?us-ascii?Q?paL92Zukghcxjgm1DmDaLIOb7qIDyugcPu0nx8+P6tDHw5dkk7c8ercp6HOd?=
 =?us-ascii?Q?BW+TAAD84Bj7xbEjBvLvS7APKnG89G5xmBIWgvfY1Gt5Ke/zfyglwP0Zad7Y?=
 =?us-ascii?Q?MmXvOd1b9PK8JCDgHGBL+0MtxqOVI43my3R8qTWdEMILc7MWZvsEF8tpLJ00?=
 =?us-ascii?Q?UNlAEHZwrF713SQ8jClxXplZ3w8UBIVtps+D6VSFXWJFW6d5nxB9qnl+xOOv?=
 =?us-ascii?Q?VvIKy/Bm/IXJCRxMyI2QygUTRfD8pDzqcoDQ8L0jt2xsrLCn5z2QibrYhc3b?=
 =?us-ascii?Q?QKKugbVWpHJtH6pzfp7VjHTmDEgUDuIZT5JauG+Sk/Nh3HAZGh3xKklmJxa+?=
 =?us-ascii?Q?E4iJ7KX/pFtIgItDnhv9ZCsRN1Dxh9+7Bjgv5PDd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b864be8-05d6-44d6-3d6b-08dd68708181
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 12:04:17.6439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxXCSXqGJ4AWCSnT8w6qDrNUCE2eCVbk9EDiNqoRSfWTsfzGdb422EuE+40Lvw8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF02710D35B
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

On Fri, Mar 21, 2025 at 11:35:40AM +0100, Simona Vetter wrote:
> On Wed, Mar 19, 2025 at 02:21:32PM -0300, Jason Gunthorpe wrote:
> > On Thu, Mar 13, 2025 at 03:32:14PM +0100, Simona Vetter wrote:
> > 
> > > So I think you can still achieve that building on top of revocable and a
> > > few more abstractions that are internally unsafe. Or are you thinking of
> > > different runtime checks?
> > 
> > I'm thinking on the access side of the revocable you don't have a
> > failure path. Instead you get the access or runtime violation if the
> > driver is buggy. This eliminates all the objectionable failure paths
> > and costs on the performance paths of the driver.
> > 
> > And perhaps also on the remove path you have runtime checking if
> > "driver lifetime bound" objects have all been cleaned up.
> > 
> > The point is to try to behave more like the standard fence pattern and
> > get some level of checking that can make r4l comfortable without
> > inventing new kernel lifecycle models.
> > 
> > > Yeah maybe we're not that far really. But I'm still not clear how to do
> > > an entirely revoke-less world.
> > 
> > Not entirely, you end up revoking big things. Like RDMA revokes the
> > driver ops callbacks using SRCU. It doesn't revoke individual
> > resources or DMA maps.
> > 
> > I have the same feeling about this micro-revoke direction, I don't
> > know how to implement this. The DMA API is very challenging,
> > especially the performance use of DMA API.
> 
> Ah I think we're in agreement, I think once we get to big subsystems we
> really want subsystem-level revokes like you describe here. And rust
> already has this concept of a "having one thing guarantess you access to
> another". For example an overall lock to a big datastructure gives you
> access to all the invidiual nodes, see LockedBy. So I think we're covered
> here.

Make some sense if Rust can do that.

> For me the basic Revocable really is more for all the odd-ball
> random pieces that aren't covered by subsystem constructs already. And
> maybe drm needs to rethink a bunch of things in this area in general, not
> just for rust. So maybe we should extend the rustdoc to explain that bare
> Revocable isn't how entire subsystems rust abstractions should be built?

Then why provide it? Like why provide revoke for DMA API or MMIO as
mandatory part of the core kernel rust bindings if it isn't supposed
to be used and instead rely on this LockedBy sort of thing?

Jason
