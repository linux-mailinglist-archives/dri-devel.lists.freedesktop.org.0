Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A1A4A23D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97A510E337;
	Fri, 28 Feb 2025 18:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xp6nZzlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A405610E337;
 Fri, 28 Feb 2025 18:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koLPzgIKzgaSvJQwIVErmOABfSR4nVBlFFTsPYjYdhHi3anqcC8jIcSq+CLbL6uMwVkoShUUG4kumzbqndJwPIVfmu3iEotyL7FjzIbo1ItrmH7fnKc1s5QjALCfYWdPjbDls2wqa/NnXA638VmBkNQpfAnwJPc/Z/Oo56mnRBjlkyJVjUZRmW73gk/rkKSclq/amTqcIGZodsOvSQlv+K/bCL2vTXoT6FhW4hyT+EAB7OcxxKHkJSrX8pLgQwmZJsbBka28TWYA3ZbbSVUmbftniJrcWcqH1r3G0sGsLt7Q6gQXOEx8bVZ7RRXbIzq4FsjoweyWJ1CteETIuntRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luUy2ZQNi6pYJpbk1DDwSE+Q6iKkWHGCQ9t+VOOlDTM=;
 b=HcK5mltOPx5VG4xveoMIufNIUZRmVj/plJk3IzsgZygFl+SccUdEUWCXYLds7Wd7FM9zBeTmvXqC/rvZXRRLehpqzCZn0JuDuxA5TShik2GgB3txYX9//yiS82o5HyWa+om7ZLxv206Wl0s7UxQPaYvLa0Wtho03I1bauycFy7DR442F4PoU1wcEX3/JmSONzcigiu228udPTJLv26XNrfhqlmS75gOcQQYlJbuxvIjBKh7BtmWmpZCQ8YDteJOV4iNsXD/cCYnCzTyN1q8+cfoX3Aim+Gx+oYHb2475uXUYLAI9PhXTKXQ2YSff8A22/pv5ryeeD+LD7yf47ozPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luUy2ZQNi6pYJpbk1DDwSE+Q6iKkWHGCQ9t+VOOlDTM=;
 b=Xp6nZzlvnzYi9gJSmOT2ihmW9qVwuQzGYhLoib+aaC690cpUJhVPCJbZJPsvD7Cd+FoVXZVe1xYZRdB04a2/S4G9aFMEtjtDjxMt/85pOHMWfQW/7QN5A9lkxNaZCEk/bkTIYvU7KIUmTUrhBcv3HvwbxtVW/4Fe11C9ReapJ3H+OzcQz7b/QXnf8tOv7u82nABa+uXZrTFkBszK/yRcUnku8iPFW8JbHfQitgmOwvQYKNUWHYnQSOWhnOPBWu2BsKXJudISty7iABGXOyDwmi5NVse3e9F8ujvXwhhm0jJX5AN3/DwXZkOkk37ByJtVY2Vty3hXpSFKeiPvWX3Zgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 18:55:35 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 18:55:35 +0000
Date: Fri, 28 Feb 2025 14:55:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250228185534.GH39591@nvidia.com>
References: <Z7-0pOmWO6r_KeQI@boqun-archlinux>
 <20250227144618.GE39591@nvidia.com> <Z8CCKl_yA74WjpQ1@Mac.home>
 <20250227161733.GH39591@nvidia.com> <Z8CY7fqbtbO4v1jv@Mac.home>
 <Z8ChnwPC0UwM8xBe@cassiopeiae> <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
 <20250227220013.GQ39591@nvidia.com> <Z8Dp9dM1MxhzuvmR@pollux>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8Dp9dM1MxhzuvmR@pollux>
X-ClientProxiedBy: BN9PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:408:f7::9) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ad8411-05a4-49a0-b2d0-08dd58297be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ysGOHKeXLJZsqo3lRmqNccYxPWdKPkHF/wsuGPxtNshekzNR2fGMnRY7iM/R?=
 =?us-ascii?Q?SSOB3ieND9ErkuK6j3t51uzaqxmWiXvDlKZ/XO3B6pdAQCNRsbDf6YbjsuXK?=
 =?us-ascii?Q?pccsfFaxWY/j5fsFDCYOhuoLS8AR1rvhNNChHjz3x5cnzc/IYIM780Ety5KK?=
 =?us-ascii?Q?BnD0vB4KAXFWiOEOQ4qvXr0geJ0aoWWaysJfmHJb9+m0ytjpWpem8yqvPQaD?=
 =?us-ascii?Q?jsShsZyPsyfm66FxO1TJswZgWb0whLpi4Hlq3hW6CmmB6KnJTmBeZhTaY2Bg?=
 =?us-ascii?Q?WsO2B+e3DTvdNwPRRYvQq9v8e5ElFz1CBGQWKJgzGwL5yxxeJP/Dqhg8BOTn?=
 =?us-ascii?Q?sR/zTLr6lxqdT84iYhMErlrq4ub0QNPNR0ybV210cuy/nxBjZTPyK4VyqrOf?=
 =?us-ascii?Q?hfDYq9atC/DHK9iLWjV9W5S6ARL/X43x6UnE+yY8nLV+fVh1NYAfXjSUAgR0?=
 =?us-ascii?Q?hji7QYX61agt8PgFd9mzAvE1Pted/sMrVdBfDSPHkaKKBrDcpQ+6mZVPoyZh?=
 =?us-ascii?Q?hvjCEfWMU/iEzX83AKl9bWYJ5clf25LJ/+regcqK3gnTEyfsCoPONmHzOnw6?=
 =?us-ascii?Q?nC6WOjTzF9do8ioNwLa62NrRF7naVnzdseQ4LH/8HSzM8h8+i2xoUAjQfvKx?=
 =?us-ascii?Q?0Jxq3BR5EIgi48bR2NyO4UfDv6cQiuULo7RCDcxLzmcs9KG66LsYQ7vIAua9?=
 =?us-ascii?Q?FE9dtfeAxv2APq8lk6yY4ZeMs33IxDpfrj6VGxOvNbBu/BKGhn8/nG8fzSXg?=
 =?us-ascii?Q?s7qbbYKO2ZUfj0a0b6vS0JCtHVkRrurTBQwqfmzfrs5ZLupyKfY1KodFl7mT?=
 =?us-ascii?Q?QsIvgiIOA7nhlozbbWNkuObMvkR20XiJxChXg8JuAPxoIA263NHG3CL+h0IY?=
 =?us-ascii?Q?onJayHS5P9yzjEmC9t+JBKMkhnYEYawXCyCc8Vm0kYVaPqbZXat0YRP2nJsn?=
 =?us-ascii?Q?Sg8NQ4MroE0DofJ5lfSz5Ngztplj86y9+vVavEopaOir1yUiwvTMFh/sl4e6?=
 =?us-ascii?Q?XSLFILPvCPJ95g/61EZBX0I0EZmBi5TcSYlz5J9KXjosQGb4F5waK4pFNkJd?=
 =?us-ascii?Q?oaE90GJ0o9s8nx15gtAQDFAmUovtUUsXQ7nwWgSoh43Lc+hRwlXCCTBF7KeS?=
 =?us-ascii?Q?lgjSdKUcLIfOx3bvudtNS6Qf7SaeppVGa0/up2+EA4fH76J6t1BgydJqRT6Y?=
 =?us-ascii?Q?Yr2H4kjjwrJTiNnglWQ8MBUCWPAOn/BjwuhSSeM5ZRrdJ9D1bwnJpQD+c/l1?=
 =?us-ascii?Q?U8DlcmSynYLVHL4d4uEQv0AH9xtprqwXZC7lX6mlakb5G9QQlX0+80upE41t?=
 =?us-ascii?Q?5HCGyPbFXEgesGBXQg3KFFS+cXkTaue2a3kapuUnp7KOXCoD3K8895BA0AKJ?=
 =?us-ascii?Q?jHwvKbli5/65B5SuQt2ilY1/Ljdi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eVF6dXc+dUlX/0quwdBLIhINoLbOl3PxCqm4Av3iOD3PpImnTuamHQhdHo4L?=
 =?us-ascii?Q?EKS7PPTzwcG3iY+wQs02p9zpc89EOpmruSJT4AmCEagCzS3wCbufi8PuAN8j?=
 =?us-ascii?Q?/XHLxLH3uAAz3GPmWwAFm5ENeOjAdApcm30nKyYO0qJvca/7n/rXNOvsYVEv?=
 =?us-ascii?Q?ul5TmJSqyuRe8N/8jeB5O7Me9tiyBAEz8f2XdSBU7En5ULYqu63iU4VYkuB5?=
 =?us-ascii?Q?ZOmO25AD7li8uSeWIIsRRVgsI33H2LJCjPQLCmYrrJffexsLTLSmYruEadsD?=
 =?us-ascii?Q?eoQ0oTlg6W+vJs0GqlRDo7sdc397Z5A7IPG9YhRkPsk6QwP4qtaNCAGM8n1Z?=
 =?us-ascii?Q?sUa6nuauWd/cb31duK9/VadFW3/2eQlUwqcAj03BxdUrGCsAAc4pM9gHX9eV?=
 =?us-ascii?Q?otXnbgCkZYvR2ksZSWfQdVK6c3dUPqyzggi3G2fnVubL7hCgHi0SO8dE6A37?=
 =?us-ascii?Q?rwAKh78nt+Gi0VxKc49qX0tNlXPwzF7kTj1IJL1eWuxTHdIdiDScT8Ap+xWF?=
 =?us-ascii?Q?+QdY4SIp9xTX6Vk7qn3CVSsPee5bjTWkr+ZpyFem33l7cX+fyhg9TY4AU1MT?=
 =?us-ascii?Q?V5UAjZSKEYRWB210KOxOnZ20IR796PxEZe92QLKNWJTqTmDkggwKxJt2cc5z?=
 =?us-ascii?Q?AAHcAeVUc4O0jLWP4reqyYncxEAdjUXcR7OKvyC6VCH9IyLbLWX/prPSOvEW?=
 =?us-ascii?Q?w5CuJMf//LpOuhb0v6wEsKbwD1b/P7tk5uUTh8k7RDOzfczssloT5Z1MTIlA?=
 =?us-ascii?Q?HDH77d2h0UAF4iIaXyEfv4JNl5y23KOvV/cmBaPqyeGtMswWdW+TrmSQ9qlX?=
 =?us-ascii?Q?U7lzeRAXvpnvNMYOO2d0KEMynHK9ChNGCJFCBXKDYHM0HbwxnGi2LGHMGRc7?=
 =?us-ascii?Q?pM3wllYoaxpxSf4txeM9pDGoNE15sbc/z5JXHMv9iJPmzMngNnG47ocBfx98?=
 =?us-ascii?Q?w84IIiaunbtgxIUhhT//ZYaHLKoWSv8ISE0JpLkdg+JnmUPPKLOUUxXDDh+q?=
 =?us-ascii?Q?ha3DIAF4ZfK2uCnYqFjiG8F/PO70IkNh7meiYRoENfwxIJ2VPwYOGOGd9kQ1?=
 =?us-ascii?Q?cJCdPQ1RrBGW3XHIiJWK7JYkFYSMLFFUGKmuw4ZfBoWJTKeRV1s5PL/X0//A?=
 =?us-ascii?Q?+v0WuLy1at4gjsSlNQOU3t/JzvdCOlj4QU/9z2kMNhTcrxnoz+FIP1rCPov3?=
 =?us-ascii?Q?Yn93jg319Ke1qUH9MFTbeccTfM3DUx/qK1SJccQusk3AaX1T14gmG+tvW2Ln?=
 =?us-ascii?Q?p+rjqDdwGqeRkC+MhKynaTeLZQP0xZxKg5P/fKyj3EFwlLDhm80m0R1QevXC?=
 =?us-ascii?Q?MnIHBgr11ugLyB0olpEci34i4hsvKDeD9cunGsBl72mpUEDupfORR4RZOeKu?=
 =?us-ascii?Q?9gNyGeP+psYnC+ROPMEj96YBY7od8OSLMWVJi9zFuzumrjQzZlda6TP1LCx6?=
 =?us-ascii?Q?vgMMosIzdZKj6YCsPu1XSi+vxjcT4gpU9MvwillumhnhQZpXq2efMKHdl2JW?=
 =?us-ascii?Q?6/gVuV6DpAIRp7f/tNIiFnzWUCrzBPdsh5hTT2uMA8MLD/DYOjbff0ykyMvk?=
 =?us-ascii?Q?wBSqOdwtYPEG6maMOyt7e7pnJQM2pzgYRXDltXZ8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ad8411-05a4-49a0-b2d0-08dd58297be4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 18:55:35.3559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvKw/jKqxp4mY9AEa33NyM9I2+8j5QRLXrvDYxcshr15NEUO/eR53MSQmbaUn8q1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
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

On Thu, Feb 27, 2025 at 11:40:53PM +0100, Danilo Krummrich wrote:
> On Thu, Feb 27, 2025 at 06:00:13PM -0400, Jason Gunthorpe wrote:
> > On Thu, Feb 27, 2025 at 01:25:10PM -0800, Boqun Feng wrote:
> > > 
> > > Most of the cases, it should be naturally achieved, because you already
> > > bind the objects into your module or driver, otherwise they would be
> > > already cancelled and freed. 
> > 
> > I'm getting the feeling you can probably naturally achieve the
> > required destructors, but I think Danillo is concerned that since it
> > isn't *mandatory* it isn't safe/sound.
> 
> Of course you can "naturally" achieve the required destructors, I even explained
> that in [1]. :-)
> 
> And yes, for *device resources* it is unsound if we do not ensure that the
> device resource is actually dropped at device unbind.

Why not do a runtime validation then?

It would be easy to have an atomic counting how many devres objects
are still alive.

Have remove() WARN_ON to the atomic and a dumb sleep loop until it is 0.

Properly written drives never hit it. Buggy drivers will throw a
warning and otherwise function safely.

I'm thinking the standard design pattern is a problem that is too
complex for static analysis to solve.

Jason
