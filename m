Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE47A4CDAF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 22:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E9D10E4E4;
	Mon,  3 Mar 2025 21:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MRgBN3Wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5D10E4E6;
 Mon,  3 Mar 2025 21:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugGyputwS3PLZlvX2layQTqq5e6bfjADnwBjpSVDnt6TsI2rBVXtwvX0K6dq62BiGo+mAiuGyyznsYObESum+AfY2hU0/DSS1kaVumPoOeLCD5oYdgplc1jlFzmMON/hSYtHhB1WTZqflxeBN7+UOpf1Qf+TGrD30csYKH59gNh28lFQ+V8pZ4nqI1bdUcHNaBcpDLNDZIIcl3uBF+2gv2memkFXZypapav9XTn5urwC6oAhnJ4SAksWMeBkBBihSy9n+i5NiVvYYENyc8qTEA+hz7WZrU0Da9L9xntR+JgWo6dKw1FltkyEvAMb/LxNQg8eQfxDxLHinMlyk8Xwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R92nYZ1LYQ9FoZg2MFqb2fYXIiDRvRBgWVA9PdKS+SQ=;
 b=NBGf9xgZee5Qb+qwiKgw6A7/hBCKIvnyMwJ3SPeOgKalHn7aTzLZu4UNt0pgqcSW6bdRaPkDLZ2dBVMX1fRXz0bq/3lomOH0rq6tKP9rR3mqUPMLwofNTaFZ4FiD5Jh+44TgV4OKGL8fmLtF0uMHd21IY6NGxX5sM8kYd+yTuDdF97KOt3XsDKhaEoSAM5+xYTXkq/nmhvaQWhUvwFZ1+sl7rCKF170p4nLSPgwxRZ8TD+SAiDjhTUV46DHYbVc3BEzGp7qswtDBHHxwBRvnIYzM6g8EiM8qzNmAWlvy8cXWO9fbfp+BILZ4gt2CdrZ9h7ujtcega7Mib5qY3ellRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R92nYZ1LYQ9FoZg2MFqb2fYXIiDRvRBgWVA9PdKS+SQ=;
 b=MRgBN3WxzAjvkGHvmbvNp5BDLeULTCS22TDoQCcvf1QpSuEYrCftv0GagMauI9oPT4J4YM0FBbzRJwb6O73stw716RekfwrRqN8HfmOkJlAgYaGZAo37/3IOfi+M8VMMNCDbSdTD4pBQ14gPLcmjCd+7SBamzDxm5jdbav7OaC8HmrF0u/iNkRhuCWndf1Rij/mWnUXp6zHa+sc7dAOrceuNj4ljKe+Ek793YQfQqJ43/jRupl2LuxLZ0GfauO1Y5SKuoCQArNxjZ+94rZrilscNyNmr1FHrG1hkMFD6GwCQl4dGhb4YSqQvbqJoj+WyphbsVBvbGe+B/sHcJiNwYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 3 Mar
 2025 21:50:04 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 21:50:03 +0000
Date: Mon, 3 Mar 2025 17:50:02 -0400
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
Message-ID: <20250303215002.GF133783@nvidia.com>
References: <Z8CCKl_yA74WjpQ1@Mac.home> <20250227161733.GH39591@nvidia.com>
 <Z8CY7fqbtbO4v1jv@Mac.home> <Z8ChnwPC0UwM8xBe@cassiopeiae>
 <20250227192321.GA67615@nvidia.com>
 <Z8DYNszfONdsKZsl@boqun-archlinux>
 <20250227220013.GQ39591@nvidia.com> <Z8Dp9dM1MxhzuvmR@pollux>
 <20250228185534.GH39591@nvidia.com> <Z8YEwrBJyLYL6sci@cassiopeiae>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8YEwrBJyLYL6sci@cassiopeiae>
X-ClientProxiedBy: BL0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:207:3d::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: f7282722-181e-4963-b7aa-08dd5a9d5a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s/Kwu47WrWW/7BKVf5kB/p4p7Xy8uJAk0TQKlVw7zCwwOglizr7E3eu95tZh?=
 =?us-ascii?Q?e5iRvYrKGqpaWostfD8rZ6Ac1MZBcmB40OdP/iEBpiOllV4vVpTLq/Mhr2v9?=
 =?us-ascii?Q?o3MTqDJOyhLHMD0PWmKAumvhCWzskVuDB5AOjr3oYIp1P63Ce76bqPyYCB+p?=
 =?us-ascii?Q?JqkPktYshNk2c6q1R7sYodib38KTefRhdrbN0UoZZ3VGiwZJ47GulC8yz7PX?=
 =?us-ascii?Q?fBcatrj0Ooa9ikJmrt3dgS6E4HALilUXFcnBRPp1D2UWGlOfM0jskhGbebSC?=
 =?us-ascii?Q?p5YhTjCY8L3j/rD50cFGhObbWtTnxG3Rh4hKRXwjgWLyRbMohrV7BUjhueHI?=
 =?us-ascii?Q?5YRxPIEFhNJBGSxeY1Km1N4qfDsGfn9eHzSj57zZZmt/QMja8htUaxg9Rf2/?=
 =?us-ascii?Q?fyrFqFa4vQFdy6ZGQzMGtUPE8vUZzCU+v35Gf3wrt9/mvcVdJ+gmwdlQbNLP?=
 =?us-ascii?Q?rYanGWL9XXKax+WsaGc6DbYmiPFgqHhQ+InlMKQZwqakQCRxGYyjtWHjMJUO?=
 =?us-ascii?Q?RxQ29LFvfrAejTFKlodEMcPTJ00xNCX+gjo5NVODchKa4HwZBceHxXmldtr4?=
 =?us-ascii?Q?M7I83l2rlMVC3bvOIPzLqKLF3E6UB1lDzPWmYFfIPNuBuSoe5FY46rXssVAJ?=
 =?us-ascii?Q?kbXrdNqv7BFobq1uIdbBJd+x4iQjaudaXP69OR4YRnDFS9mX13VrYjxcyx9Z?=
 =?us-ascii?Q?EPFzzRVSSDvfnXwGkGr6bUeDqlvV8eH40PI/u5MAWbZPIOORKXGxeNhBE/gy?=
 =?us-ascii?Q?QQMpFp2DglQxR76OZR6qAwWlnkjjZXVDzxOCCOh8VGxHO9J5F353BfIzhwZH?=
 =?us-ascii?Q?B2nqtgYM2XC7BbeT7UsJmtAy+9FVqZEElbh763aDTZ8+EBJA0k014DvOko4T?=
 =?us-ascii?Q?gog2uLD9g0AA+wdCGrWdInQ3JcIKKwonnyQQ3EjAIJ3McEnOJUSqVxoM9+FF?=
 =?us-ascii?Q?mDd/lVNzKr2TlRzECi3aIK5OAJxLPBQC2K+dTirtL+KNw+oX3pML8pGep7dL?=
 =?us-ascii?Q?ZjwhD8peMAxP6zFxXllE/EkPZmhKMCdCcA92cjbawt/+FOT3mit9Z/mBma00?=
 =?us-ascii?Q?/6zJt4lCeiroP4BaeXfZxKGGMBHkwYfDA7UlLgr52Szk1gQZkn1dSWZ9PMsc?=
 =?us-ascii?Q?pX1UJlJJy9zWBw2ufy9B3NFlFRObQiMDcY+aAv9rzSgSL1+6WrwwGSNIACiu?=
 =?us-ascii?Q?RjjuNY8lT5War4fe/ikJJewB2zBNtKV2h5SNGY0Soq9Imk5GnAK+TVfgRxua?=
 =?us-ascii?Q?UZ49E/v50k4IWlbOiRMThPPXHdY4qAeHswZjlyk7yoX1M6sas5bPWOjj//uu?=
 =?us-ascii?Q?D/0VyEZsow5w58d6EPnUW3LIOibnIQcAIrb7klhlyVmWE4XrU8YfrxVj5bTi?=
 =?us-ascii?Q?VqgMKtmX+2BfyybANbBvooF1EYFD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bOI55/kA3rVTXxD8qvTGbrYgms8rXat2BeGXu37Jhp614KwYJrR8c39dJf3B?=
 =?us-ascii?Q?8/pMRaZDi2ypdlD/EfaH8h+MS6cus473S06QZIrMikVGE015WjFD7lHm7kAV?=
 =?us-ascii?Q?Kzd6+ZkBbVoX7Jx4x9mS8vAlH69a7HT+z/BvOV4+lTvF68RdbXIkweeXuio0?=
 =?us-ascii?Q?lUmmU90AekhGZinoldKF+pzaG8sgydHCI4RFuyIDPbhmFTyo0S/sld7ixP/B?=
 =?us-ascii?Q?5K1XKcc4H8r0PndUfP12Jrjkt4j+1MFYVLdmQWhFCU6u0KouejzdaWoXHXaF?=
 =?us-ascii?Q?SS1+ZTEyOH6gtRCkwzx6PMuykwzRRTNV+Thgrf4pUmjO6DPBJiKagUiX6M8f?=
 =?us-ascii?Q?OXJ5Spbbm21zjStDHvOYJSka/vhu/ytSxcI/1qUx2ywTQj+741bWqa1h6a2O?=
 =?us-ascii?Q?QClUeIheMKPHQ3sJVk3koSrYiyFaY95r7c5Ho/sE9Vqb/R8O9twsmwJsTT9S?=
 =?us-ascii?Q?+nOSMZynX+oM9mpqIQ1YSYwoOA7rex4f3gjnELYmAsGFPfm66vu8Ei+wAIL1?=
 =?us-ascii?Q?Qg43IxpPltU0IRHuzZVvvABJvrWN8K443VHVzX7vy8p8TAVHZtrxRQPeZ5w3?=
 =?us-ascii?Q?9IRNgnYJvyopPuHA2ZU2fli0GGLv+oMT93dUe1R21g1juTnUJuXGR0Uav0a6?=
 =?us-ascii?Q?X0xNghzvuTAfa5chRmG8tMwyGqs9SE6enh2w9WVsIsh6YQFY9TngoKRw8vSX?=
 =?us-ascii?Q?/08QBZJItIm0NsDUod823BsX/Pr9zR+HXCVN2eEVmRX/Bx+jbwZAey3sKS10?=
 =?us-ascii?Q?3blZPlrs9KT6ms/cvei30hbzcwkFh9C09aThfNPTXJe9mQRXKPQuyv+nF8n5?=
 =?us-ascii?Q?QUXpIJw5sI74mv1SRirIiGVVydbWWLs5ikq5n+8WixanzgSEkn+8viri7RFn?=
 =?us-ascii?Q?5WzyGxTorJHRdElgst1B7tTgzgk2/1+lS96/a6KnFStTka1nqSKxNnWFTr+j?=
 =?us-ascii?Q?ufVcG4uJZB+erfDBA2h9CKBSuzAqdjYpXyFsAa55x2BWd0wL+dLDZDMufYGh?=
 =?us-ascii?Q?CAcsG+23QiIXd1HmuRQCGu23XKAQieFM6E60b+06l2bn9FwM2/wEsB+d0ih5?=
 =?us-ascii?Q?HPWXH35+ltrVKJyOCl1BKuafZ+rBzX4SLLJNzo7aUh8i0rULnuqB/60B1dPN?=
 =?us-ascii?Q?1pYuTmeiLLZ9IXpleI6dbv2INGQSHHF0E1shJWD7E13++ZClpVTwiOu0VkRY?=
 =?us-ascii?Q?+9xyeimxQVYQ/v4nOtob9d1rBoK7osalLB6+WXHEOpvlsCil9doeerp+Mfaz?=
 =?us-ascii?Q?9/149Q3BnrxI8H5SIoYPbQjiyg9yUqWVjXtADEsrMZtIUM7QWOjSJnUz1eWj?=
 =?us-ascii?Q?KDgBE8FqJa1QP8rSfEr160Jm3QqSKj7zuHoqakJkvDjRzw11TkxTBy/GvKHu?=
 =?us-ascii?Q?uq98mzY3lXHHUH3/bX58PMUtiVD3BgJXo2Nf18O91dTFfAzE9drU9f472bqM?=
 =?us-ascii?Q?+Istv7mmIv1VWNoK9VepeEGINvKlRx/PmSd2kAkCuS6qntcNNDK4jnH3tGG5?=
 =?us-ascii?Q?7auPE2jIBj9hvhzQX6lY+CYvOF7jiXsexIGfMzUqGvHvaFDYTZ39UC2XL5V6?=
 =?us-ascii?Q?7fUlGAC6uKy3ILXfJdk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7282722-181e-4963-b7aa-08dd5a9d5a65
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 21:50:03.1489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7+KnQwLQfhfE5iewKL3WGGII7LXIFUiB2gx30LN+RgjJAqS0e7QG5UFYGh2rdqf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

On Mon, Mar 03, 2025 at 08:36:34PM +0100, Danilo Krummrich wrote:
> > > And yes, for *device resources* it is unsound if we do not ensure that the
> > > device resource is actually dropped at device unbind.
> > 
> > Why not do a runtime validation then?
> > 
> > It would be easy to have an atomic counting how many devres objects
> > are still alive.
> 
> (1) It would not be easy at all, if not impossible.
> 
> A Devres object doesn't know whether it's embedded in an Arc<Devres>, nor does
> it know whether it is embedded in subsequent Arc containers, e.g.
> Arc<Arc<Devres>>.

You aren't tracking that. If Rust has a problem, implement it in C:

  devm_rsgc_start(struct device *)
  devm_rsgc_pci_iomap(struct device *,..)
  devm_rsgc_pci_iounmap(struct device *,..)
  devm_rsgc_fence(struct device *)

Surely that isn't a problem for bindings?

> > Properly written drives never hit it. Buggy drivers will throw a
> > warning and otherwise function safely.
> 
> Ignoring (1), I think that's exactly the opposite of what we want to achieve.
> 
> This would mean that the Rust abstraction does *not avoid* but *only detect* the
> problem.

It is preventing memory leaks. We would like to prevent memory leaks
in the kernel. Currently you can't even detect them, so this seems
like an improvement.

I am using the practical kernel definition for "memory leak" of memory
outliving remove() rather than the more philisophical rust version
that memory is someday, eventually, freed.

In an environment like the kernel the distinction is important and
desirable.

> The practical problem: Buggy drivers could (as you propose) stall the
> corresponding task forever, never releasing the device resource. 

Should't be never. Rust never leaks memory? It will eventually be
unstuck when Rust frees the memory in the concurrent context that is
holding it.

> Not releasing the device resource may stall subsequent drivers
> trying to probe the device, or, if the physical memory region has
> been reassigned to another device, prevent another device from
> probing. This is *not* what I would call "function safely".

It didn't create a security problem.

The driver could also write 

 while (true)
    sleep(1)

In the remove function and achieve all of the above bad things, should
you try to statically prevent that too? I've written stuff like the
above in drivers before, it is an easy way to make thing safe when
working with FDs, so don't think nobody would do that.

So I don't see alot of value in arguing you can close of 1 way to
achieve something bad and still leave open all sorts of others. At
least is more philisophical than I prefer to get.

It is better to focus on usability, performance, and bug class
detection, IMHO.

Jason
