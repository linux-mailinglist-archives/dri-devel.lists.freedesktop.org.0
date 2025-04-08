Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE5A8111E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 18:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945210E6ED;
	Tue,  8 Apr 2025 16:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t7bkH6Uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4097810E6ED
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 16:01:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVzdBwwLvrxk3l0tzicVlxYxi+MM+LLKQ9bhJJA/5cfToKPw0wDa+36Oc6r3QTfePsml0qWjCMMcLmmfLQKkKszVf5FAl6TPYGE0JBJPSaDwYnrX7LsPGy/QTe87XwaQkYu0TpurYBXt+1v8DuOtpygFFhwtCWBVZWbZpsXKdYB4F1b4NeeGWzGzO3/1UEUkLyiX4kn09QZ7Df6dCOEn7T7jcZWcH5Ka/bDsnP6vw3DEL13u9gXcidueS0uqPW47TIzDZbDaE/18BdxjNeRrv8xpMqtnsCimnkX/UzIxGi8S/nL0amCbLTqJRNjAO686PFvrW611tM1tqXsgHM3rrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm/reINI2aZCAFkFR35fN05gzrTbnJUQgT6R7JbJc0c=;
 b=HavHu6Py9rZa/Um9WF61te6zO5HPh9GHZnkmkGWouYgWQv2Arx1izJ5vS6MnCn6n+kQiMKt1Pk2pt/DGQLSQOj47CKv6rwlqt0FaXWHCs/1BHP0yH4Ly0yxJVPUjYjJ63SbjbggFRXJwZniy11OIvq9UA1MmSsUZMawoBSWeVXuOOZ2Gsf1zY7RScyQ3GGIfUTSpeVrYxmPSdJefJpK6YZcMWIIXpKl17tFLPxK/cT2jRZWyWlpT2R211YoTnRhRmYZ6SIHBjxDTd4c9W9lzueiG6oZF1OPCayHNjG2NP3t+u5XcXlx2tItHSE87c5s7XSr6cHJtendXSP0hxVQMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm/reINI2aZCAFkFR35fN05gzrTbnJUQgT6R7JbJc0c=;
 b=t7bkH6Ucrn/tT3UOgHOC+RCD1ldfr+SpzYCadUmo0phkUgqkBtmsa/8kyLNdLnR+npx0HocT+vRntbSLGT2h18Q63KhyjbtQBDdPJmUUDlvkWceYrwhvXIcEe4pY/auHDUD6Zd+jtL6VDgBwvsvJimzy/X+AingO/MZYILJqbz4eC+PgEFKO72z36YDzYWa0U4BjHz1Zoi/6W0JcNMQHkQ39naPcNn4M4kYXE8AzfkAcwLt3A9swvQd01cihbgSVWcU8Ev/78xsQ9OT4hRI9m382E/gm1aN4rZC+koCVqTWh0vG55nhAxdKJqshZlPeYoGoXMZxN3iJpX5vnCclw9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 16:01:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Tue, 8 Apr 2025
 16:01:28 +0000
Date: Tue, 8 Apr 2025 13:01:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
Message-ID: <20250408160127.GD1778492@nvidia.com>
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pu3ys4x.fsf@intel.com>
X-ClientProxiedBy: BL1PR13CA0256.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc61884-e9ec-49b2-8ffc-08dd76b69f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C3Wq+SjdOFyYtGQNnfY50ilm346HNkyPQhLb9CEZK1FjYIInN5Vl5P54qyTT?=
 =?us-ascii?Q?usspmVzja0+86GpT4pXRRpL5niuRbmhuR6ZlG8zmlLacX5NngGcJ04xPxUwh?=
 =?us-ascii?Q?oWRbNNjHjBStqGwfbbJg98PAlCt42OwGDxV3lCwu4y8Thx6GjCxQ1Pr5eB2/?=
 =?us-ascii?Q?FR17VUiBIR0OtEy/NXc2pxYc68XXYhupsAMSGrqvwKu4Byf8soZaA3TiLQtM?=
 =?us-ascii?Q?tY/myNbzIJVdK2PpcTc8Bi2CWYscVFLx/Gp8cfYzMDWrTBCt3hvtEi6RJKZ5?=
 =?us-ascii?Q?gmkA5XPxZKQYD3O/cBT6xx1Q5MhAi8GQ4XqgHcHJkX846/J+/hCduR96tEbp?=
 =?us-ascii?Q?DfddiICch/SR+orYU5CcLFKHYKipZb/IM7De/cE1Pj6AtMHs0+6TniX/qpMm?=
 =?us-ascii?Q?+OAg/XSb6/Ftn/Usm9PutgfNV7x4oo9ZYpK0PBw7w+bRzkdQkJGbLPJi+IQ8?=
 =?us-ascii?Q?PwyyQncP0jp1kcNUMOd6c56p6+8Wxc0M9AuFKXHikZXWYoK6u/IaDAohj3nQ?=
 =?us-ascii?Q?EElQuKpQg+8B+D6Q3XZtJK/kni0SEYXTi+sNBiowpqT8Tl199InOl41jAzpf?=
 =?us-ascii?Q?Z67uBsEyoK6djUM/J44cM2Zt+dPrEw6qooSWn7km0C0ydsABXQeEWyni6HUq?=
 =?us-ascii?Q?3vOHs4Gzp34otM7ZnZELf62tVHFUAa2vDKli8vWHm4L8HEdCjuWgd4nop05V?=
 =?us-ascii?Q?8B/c0jOAelso0pNEFL9v/wke7as7AFW5yY1tko3aQpnbwDyN7bwoP3X6XaC/?=
 =?us-ascii?Q?gtfwIEUXVhx+zp708DnJePe1MSEJNcnpwqgbISWUmEeNcLovOeQueSm/zX82?=
 =?us-ascii?Q?u6wBWdIdB2aWH1mZl7H2yuFvdIEgZlRJ+NILzj8DsLjPblI/YeKv8W4FJqFO?=
 =?us-ascii?Q?vzUZqmgeHMTLEVQbJsNpRQF5Mm+xeqiIObwPPXLCbwJ595JkEQQ1LUN2TAds?=
 =?us-ascii?Q?Zpt60BMKy9fyDPrcRaV8Ye5/EMfOuaPf1eBtQ7oZ/U9pypu58sseji2KAF4A?=
 =?us-ascii?Q?FFFCxF2S1uMxh0jpFdlE6TZUAgdgbWp6RKnuZcyTJCuZwnAH/JBk6CF3sem+?=
 =?us-ascii?Q?CVYRYVLpPInBB0PVFLARZjPO2f8SnL7VFh4vTLx22rKAK2YA60wdzilogRtO?=
 =?us-ascii?Q?RlntRgH0CgtOeGIx42cm93C6CAmD5Ea72vkwHCMYadzjeggUDm14+AUwU7Tr?=
 =?us-ascii?Q?faPCAYCk6B2SCNWwE3ReNquAmMuFaCcKKMcIyx0kyctvxHJj5s3fgo0ldMIB?=
 =?us-ascii?Q?d9vgP0EqVfG49wAhmx4wmGUPOglp/3mhUflZrbgaSjX5sQuBBoQteSIE2Okc?=
 =?us-ascii?Q?yoGZOj3DrsCqls8WrB/dYPdy4VBRjcuLMTTvGz62bkRob2Z0fEDWNcaJA2Gg?=
 =?us-ascii?Q?T3GM40Mwvnp+pLheY2qkXSsKcDms?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oB0T/fBUSCwaqnQr8ZEFR1meDRYdqIAYaTAuB/A2T1OEQB9+RtbeZdUIkrrB?=
 =?us-ascii?Q?dkOvQN2e4aiu3eUOIUqdPsMe7KetMwjhQQl+BbfqDFIeYgc/Gfj9ajTjZ85z?=
 =?us-ascii?Q?GTmyDjiGc33ULVcgZJwwghNDA+UZ2EMR95C+0vKKRGNLL853dPXNlHLWq94A?=
 =?us-ascii?Q?jwn6l9b4A1clBpIjBxPrh0LYjAvS9k2dH/BPOe3aMBCwUd4/Y9/ofIY/8CNX?=
 =?us-ascii?Q?SL0lEFPbzMbeIqIu7kDqRz+0LxfhfjHbPjpXUO8jYvGe2BZ3J/WPRT/bI+s8?=
 =?us-ascii?Q?h5+RfN3WFD9oRidXsrua00led47rGOSMi4kjydDoJlUisCohBSdWXsfk+9rj?=
 =?us-ascii?Q?e3sB7RPyfQzA1q/VPhMcX5A0X1WFq6rH1pXhYosxpi15qwYG8wqgvD5hbT+e?=
 =?us-ascii?Q?NE1ndTj1S+4aIySmeU5hZ7AtyE7jeNDYs+lBDu9hJJ93w/ZCyGi2iwV6QfYX?=
 =?us-ascii?Q?GLdVjQnTuEFizE9z3i2EENNaaq/FIvqFj8Au+ZlJwnWcFHoAfY+XWtqpWTB+?=
 =?us-ascii?Q?R5lsHYOU6J8HB/OgrCUU+iel0wEVsIni0s9GXib8N9er6BBKn9/epZqkyuAy?=
 =?us-ascii?Q?Vqh7x4Y1fBHd7DDXy/VNtvbZm7GNmuk4o2LG+sl3ToG1t5JNDvk0J9ihfKcu?=
 =?us-ascii?Q?ADg+sc3K2UR0YtXTJCQTMsn4nLdB/Fmrgdhp9RMIdYtYiAiXyFRk3PP5oZKT?=
 =?us-ascii?Q?tNtGvCOxHQ1OnsuUazTQpYG4qtnxBQuPdRXHesyoYvTzAS64w1SnScB5ahE7?=
 =?us-ascii?Q?81KSNHnR5/dxfqPwBB0dfq/+ewjD2i82/b0MDfR7zofp8tyL7A8Sz1ASvlRz?=
 =?us-ascii?Q?mzNazCxETr7jvA7sww2O1I9vZXlXK0RSjKZnlN/rNUPNPvtZyPThlbmazs5l?=
 =?us-ascii?Q?b4YcfeJYwER699LYLSKHdZ0ugdc9HFzDQigTHrk8590wOSTZwI712EdHACp2?=
 =?us-ascii?Q?HrgH+CMT/7RyC0FhUzz0A3TytU68tH0ae5NjggsVoVz57H+uEUFjdN48ZaGb?=
 =?us-ascii?Q?1ZJDX+anoNV5SYjpZ9YHd6+9lvjRwpuJGmoYzbJsQhmqDqV3uJKQ7PcXE630?=
 =?us-ascii?Q?t0e1e6UyyXaLqRy23efrCnmJJxKkh8UP4Eb1ZEyeKRZs5qwv6eZb2aND9sNm?=
 =?us-ascii?Q?2vtihtQBAMNAzLP3ZeYpOeNLSwpAJc2H1DSPENJBad4/ZPS30JARTimKVWhn?=
 =?us-ascii?Q?sMOQeZKmqlUvxGtzvZedEbdJ+niEMuEscDb1qbF2nKw9eTXpf//C87GGI/Oo?=
 =?us-ascii?Q?w3kiO3Ng4aGgBO1kJYVW7gTBUwasWCto8voGHk/LzQohcDmp7saIz58JGRKk?=
 =?us-ascii?Q?3yVuXO9Ia8jeDdLwunNauHFRBgJ673jhAvC7bFwhq267qA4FvRnY0xn5FdNb?=
 =?us-ascii?Q?YMFC0u7R2dHmFIsyxXlTTTsHJhv8BO2Pv9b4mfk9OkbB0H18XL10LSpaYY7v?=
 =?us-ascii?Q?HqjCE6t/Y6fLBu27aPWXtsJe2ATFGv1Ij6J/tcD54bDuf4mRo7aRXi9CPVuD?=
 =?us-ascii?Q?ii1tEMg8UNJtdB1+BinzOzp38cCmAr7IhFE8UIu8Z6qCqFwTAJBDgXkR+DFE?=
 =?us-ascii?Q?zk+HWSwtOyFjyE6bkHXppPoR2canxXiZ+Lxncihe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc61884-e9ec-49b2-8ffc-08dd76b69f03
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:01:28.2168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUpd+aaOZvDrohzlGOKS9C/gmE8MjhI00H8nQ1Im/hiOfQSBo4iv3ungcN29Lxms
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817
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

On Tue, Apr 08, 2025 at 11:27:58AM +0300, Jani Nikula wrote:
> On Mon, 07 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > On Mon, Apr 07, 2025 at 10:17:40AM +0300, Jani Nikula wrote:
> >
> >> Even with Jason's idea [1], you *still* have to start small and opt-in
> >> (i.e. the patch series at hand). You can't just start off by testing
> >> every header in one go, because it's a flag day switch. 
> >
> > You'd add something like 'make header_check' that does not run
> > automatically. Making it run automatically after everything is fixed
> > to keep it fixed would be the flag day change. It is how we have
> > managed to introduce other warning levels in the past.
> 
> That approach does not help *me* or drm, i915 and xe in the least. They
> are already fixed, and we want a way to keep them fixed. This is how all
> of this got started.

I imagine you'd include a way to have the 'make header_check' run on
some subset of files only, then use that in your CI for the interm.

> Your goal may be to make everything self-contained, but AFAICS there is
> no agreement on that goal. As long as there's no buy-in to this, it's
> not possible fix everything, it's an unreachable goal.

I didn't see that. I saw technical problems with the implementation
that was presented. I'd be shocked if there was broad opposition to
adding missing includes and forward declaration to most headers. It is
a pretty basic C thing. :\ 

Until someone sends a series trying to add missing includes and
forward declarations we can't really know..

> Arguably the situation is similar to W=1 builds. We can't run W=1 in our
> CI, because of failures outside of the drivers we maintain. 

You can run W=1 using a subdirectory build just for your drivers.

> Even if I put in the effort to generalize this the way you prefer, I
> guess a few kernel releases from now, it still would not do what we have
> already in place in i915 and xe. And, no offense, but I think your
> proposal is technically vague to start with. I really don't know where
> the goal posts are.

Well, I spent a little bit and wrote a mock up and did some looking at
how much work is here. Focusing on allnoconfig as a starting point,
293 out of 1858 headers failed to build, and with some fiddling I got
it down to 150, a couple of hours would get patches made for the vast
majority of it.

https://github.com/jgunthorpe/linux/commits/hdrcheck/

I don't see the same dire view as you do, it seems reasonable and doable.

Jason
