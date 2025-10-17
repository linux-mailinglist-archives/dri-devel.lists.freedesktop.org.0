Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD3BE6766
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE54910EAFC;
	Fri, 17 Oct 2025 05:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="psC59avs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010036.outbound.protection.outlook.com
 [40.93.198.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F28B10EAFC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3GLjf9cHlR9BUGBjiOcG2eNEkJeFppwdCnQkLtMfi7k4QO++Aokp3oVlO6kidiBdI/ogJVD1XbzDB7J+MYBY2ljP2hgHrXt62+4Y04Vkt4ErmWnCzc8tUQC+gJa3Fy7wn4e7AMkjSs9ufg2ndd3dO6P8wzZy8dBr336iv6Sry37X1+WnZYhj4UUT7cxjX1AVjBH5VgDcRYj0KPQdKz8++U3POsHGc5ZgsqOnFqMmLL/GPuLoFNOxOWFcUemwJ39jNvLXKwQk3oDZJHFtpLUqmXk3VRY/Q7xQa4Dc2hTD17LUgY5Xa3jVp3iWVhNLs8inzOYLjqjxbgcyrIPnCORQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McV+Pn+O7vXlidHissK1DRPBr+eCo0GoxhUws2qlSNc=;
 b=luEMnAPcnnzk0PLgEfqeM6oje6fwT246tCRQ8bdZ7w+yaxRJEuVs1gaJqY1uyZ9XCK75lI4mywfL7oQKGY+XYBfWMZ1vz7AToWzgOtbq3Qxog/kToQF4ACZJUkqtxApRB1S0D1i+QYaWu+4FZSuhO/Wq1sO9keUSdN/fEkxYX0jCuJTf4RHw2XbKHy7laNKJ81YnsR2IT7QFfwkf9emCNayB4hPDN7dfh8OTLqy63Xp05N+41b8r5NeNUaLp24gEBLVtN5i9jmavOlykIUdM/URdY7BG4vO2ag3hAaFBzXnEbrH/pLwE83hgnfdJ0wWb8+mZwEseNLieXCr637pkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McV+Pn+O7vXlidHissK1DRPBr+eCo0GoxhUws2qlSNc=;
 b=psC59avs/iBO4/uekbFOMAxnDWDqEK/fzTbqBt1eQx2K19qBGWTUeZGR0RIoV3+mHYbQsBHX56PO7imsVwH8dNU/uoW7MEttADXh3Ay0ziK4Fa1GLiT3tKV1jLyT8SEIRE0ppJ4nbJD1r6LBWin8XlM7epkS9/ETITsErhz9EJgtN6ogKOwwhfkdl9BQeMLPihmOm3hVvLgo7XOHT+A6sX9fj+EUMcw3wT5b1bUGh7q4Y/45RduRZp9ekaH6udBckSPXxUVrE5FbT5UKzZCvJxd+434QlPTS1tAusefb7PBEWRW0v9v6xoy2IVX1z6FsT/tdYjxO78UzA7BAIDtNeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:47:43 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:47:43 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v6 00/11] gpu: nova-core: Boot GSP to RISC-V active
Date: Fri, 17 Oct 2025 16:47:25 +1100
Message-ID: <20251017054736.2984332-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0088.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:201::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d01f8e9-4e45-48f9-774d-08de0d40b0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UwuLgmHq8tcSxNiBEMp7GRLM9JW4Em67nNyLJb7tDxzN0ap1Hkd2kT+NpVNS?=
 =?us-ascii?Q?XMMXgRka3mZIBEPkScM8iXOWBc4W6D74zCU7RLrXG19fK06E9ZhG+411MCAb?=
 =?us-ascii?Q?gsH7qGGLmFm3dCkyCSJVX97PmE4jAOgUK32LRpe4deMlobPLzLc7l4UsgQLU?=
 =?us-ascii?Q?MBqOUqhq3hQadsS5v6+A9o1FvQ7JgS/Hd4sG5LhbrY4vtlOgikp7h7Kgh+kz?=
 =?us-ascii?Q?01JrlZAuNOiWCyCK8DuJQ/wW/XPqX4TJMZT/eTAmoF8T0JTmov1sy55L7fCh?=
 =?us-ascii?Q?CBmyO+oqly0v8TFZWQtZwoV14IYr/cDCuVqsrRTHHIpJQiIEThUkWJUAwDWj?=
 =?us-ascii?Q?0jJSDGHgw4bRtmrlWloE0gy+qifUd4eiCnxazGBxzFIp+ooeGz9zzcY14mzC?=
 =?us-ascii?Q?UWj56XOgtgmBK0/2u8XliijO74z8RV9cIuNvo2JhxnfmSttvdAXXfoGdJYhK?=
 =?us-ascii?Q?ApEL86wqF4dGP2le7pZGGqQWRVG6ZeQFPev+rAKvP4gmO0TCtj3+OCXmJJdf?=
 =?us-ascii?Q?mjqb3c1LNvmazOjjvn7+2PDi5i2pB9VHf3My4HsU1yGGXJu/q/25xMn50klb?=
 =?us-ascii?Q?/XgZJCnXcBjn0TKwFy4cWQwZTKz+j+4X+3CENtsnJxhrnGXskYg4JJ2+XPgE?=
 =?us-ascii?Q?ZR+E5Q4+ENEw10fidj3lTBWJ0k36PlWr9saIvcgej2EbfpjN9o8twqjPmqYm?=
 =?us-ascii?Q?asGybisOizU3g7eEbf0XOlD8VfOsd7kd068mUQBqwo2iQdTLKXxGBu1eo8mR?=
 =?us-ascii?Q?yPhORR348V3EQnaaych302tvEbWkptXXjDjZ/ZUZIbfUX8xda7OwvQHJW+ry?=
 =?us-ascii?Q?lHKC8lnY2IyAU0HXO9P4L2MdqNHJipclAx01taoASwswvlXzaFKwsU20R2yB?=
 =?us-ascii?Q?qt/7Ls9bk83MjnoNiwyqe7BAYbmA+695YHzdL6P444gmvQB+Qnni54PhO6PC?=
 =?us-ascii?Q?XmYSEL4WuV4LermxWcP5BiYV2kYAfrWOhOGInnX9IEJeLJlpqY28VbhimNya?=
 =?us-ascii?Q?jdzM276VZvfv/m5Y1nKeWE37sWH5Z83GBtxM8eaOevz3gXSO2/pwtkibZzKJ?=
 =?us-ascii?Q?TiURRlhC3BK48XqaNSRApZ8bzyggsrfRwe5YU6LNVXvQj8I5C5jsEjmh2dFv?=
 =?us-ascii?Q?7pugsUfcXDr+18Y0nwil5TDI2MVAPr73b0N4rP3nJs0NT1IBhYQOwXGBbl1v?=
 =?us-ascii?Q?wQVsbfeN9OUIlvH6G7a4LFCDcxs+n6Q9UIng13/r82HwN8Z8XnqPyM0exCHR?=
 =?us-ascii?Q?CBMYsf1VqL6hla4cNjRNzIJxGOOAFoUO7fHS4eKx/ODX+GpEgNj0A49aqwYy?=
 =?us-ascii?Q?m3ybOlxTB07KeUriHaFQlCtYRMOArmS0KHM1h7pVBGNkUzBKRDygQbRMZ1cz?=
 =?us-ascii?Q?BgOaYQ+XZX5axl+evzCYXt3kdK9zpw68AAtmJfLSZnVRzSOMWLz1I+dEyjyK?=
 =?us-ascii?Q?RONtBXzVMOt2ekoy1gg7PfzjZrVsW2fEaWcXt5+k1utPuqpDMwsugw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JNaFM1KMZYTqgY2jAaPDel6YKGrkWnSTlgNYN96K+g+8YcZEhKKR0MTwEohs?=
 =?us-ascii?Q?xADVuhOLZn80Ot5IdPzZ3fIjnDQGshUp+To7kr5MvlVE8X6v1LQBtP8v4faN?=
 =?us-ascii?Q?dlZgFohV69vm9VJ6R8VdRmDdcUCq8H9bLJL1ZJsnpKDr4ouFJVRl9E4WxTWL?=
 =?us-ascii?Q?FkJgJoQiwJQWDR7p9oPKSNJhB7jyY2oj7+R3RCZ2PEH5dXMH0SpsXAC2+cNM?=
 =?us-ascii?Q?ZFxdeqNV68I1adW7ExU4kGyZa58AGB77uQ0lyOS9VetQ0LE8NRKqtC84K0y+?=
 =?us-ascii?Q?2qxOJOhduwp1VffZBW0rjuSNF11TRHshTj/TT/95z5N1YaFOOizAS3Gt5jZd?=
 =?us-ascii?Q?/YNqHWdXIPzCsDkUwJHcWGAY0fOqATX6WLooo6RSU1TgMklBy2610vc6ATcC?=
 =?us-ascii?Q?EZ8NHP9kT6uSYkKV3znfLpxBjI052hXnHqe/f7VdHT4MGVWyr7v23j4UhOic?=
 =?us-ascii?Q?agYG2DGGgRUqioy8k4oEpN+bdo9mCI2ObJxUeYZeGvVB+1JLBcd2tAHdqTme?=
 =?us-ascii?Q?z6OjRQuhoHjR/Tjlp+YXOkzZiTq7Z4s69V5URE6c678gA2ORp882hjU+wjQD?=
 =?us-ascii?Q?/YzFv6jCvbJSO6iBxW4uPB8Bg3A4xIxIe5fi+OWCbVnYlwp7P8izTvFNI1f8?=
 =?us-ascii?Q?Bw2j5Qk0Sr9yNvut/F4TDWPXxsnIGCPmr4UpJ15wdEz2ZC72n6B7e/g7AZsc?=
 =?us-ascii?Q?imje2l2Z4USOV14fl4qKxGxQHbNsBckj25dORzQbCrRMksCDx9Hwk61g2xYJ?=
 =?us-ascii?Q?RyMyiDMT3S5BTpEEX7zPc17U65+G7Umkdc+OIhJFC5PfK+D55xNqkuqTglVx?=
 =?us-ascii?Q?+zPzNXXqNR2CeIlmrUlFKE4Wrc/ZW1qLgJaYj7YnoPjZJCyNJD3i31VTWKHr?=
 =?us-ascii?Q?tZ5/A+EAcUxMhRTF6j35mxi2fRVa2eeBSHPQUfCcgyI7LvSU6HMGjMjGlOnh?=
 =?us-ascii?Q?/H0wF2A8Ooknwqd+Opa0zKexYmI5XvlsAGVRAFz1alIuf+2a9WRa+d/8g6z0?=
 =?us-ascii?Q?NNWG9nRQDwVn7YH2UgA4WFNdJbyciBc/3qML8oJs0UQjiye+amaH27JALp17?=
 =?us-ascii?Q?1mcIRokqjkc7u/S2SWbVjMNvTSvJ7/OcPDLWHjoLTRA6ymyVAlHnhSBtAjpJ?=
 =?us-ascii?Q?i1T1Ey8pYCuVhRXPGG8B6fOLSw+kfvXIZIIuzPdv6zoq1EsEo9sHghte2+KM?=
 =?us-ascii?Q?zUzKl+MudpqWYBeRlxKhwP3cGQlbTUAIDgKd4+pZLxL4DfvwBGkaMXC9TwYD?=
 =?us-ascii?Q?g/SNdcHARBPlliRwFyDK/96IxQkIwPRkzbwR6nuTgCYYfPWOQb/XaY8RuYPo?=
 =?us-ascii?Q?HOh9pavvBeUGBN3Hfl+20udkyYvHTi2Z13h/kxe3U1LxiA5Rotf8wdQJ8c4w?=
 =?us-ascii?Q?wRfq0FYzEKBRj79S9WTHJNOgboWp+4x0jdV6nqm+9JYF3ftGM5wbTCCANStA?=
 =?us-ascii?Q?63wvIROgj9hkoflMfdb+3x/pcqA8aGac8BBq/suk5+vdhHzh02/oShUNUJfg?=
 =?us-ascii?Q?dSoOvWwp9u/fADsjTo9ZNkv/joccE36Qsd6YuMV8wXTmdDNzHiKc9RU09Ihx?=
 =?us-ascii?Q?dBifz6GRLCT8HiOcJPbbcwWxjFNYkrRTcCwdob2D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d01f8e9-4e45-48f9-774d-08de0d40b0bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:47:42.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JN9yBYcGlYsBcyA92rR+H7Nb5inPRRsDeH0KbYJbsPvsZBTlK/TK4g8psglL8sP3dKQUwGoMnDnPmNofcaBDFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

Changes since v5:

Most of the changes incorporated here are minor documentation and comment fixes
based on feedback from Alex. There are still a couple of outstanding comments
to address, in particular dealing with the Rust compatiblity changes for
slice_flatten as suggested by Miguel.

However I am going to be unable to look at these for a few weeks so Alex has
kindly offered to help finish addressing the outstanding comments and will
likely post a more refined version of this series shortly. Thanks!

Changes since v4:

The main change for this revision is to derive the Zeroable trait for most
of our bindings. The rest of the changes just address relatively minor review
comments made for v4 of the series.

This series is still based on a merge of drm-rust-next
and drivers-core-testing made by Alex. A complete copy of
the tree with these patches applied will be available at
https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v5

Changes since v3:

The main change for v4 is to switch to using the `init!` macros to ensure all
fields on in-place initialised structs get initialised. This will require our
bindings to derive the `Zeroable` trait, however for now I have left this as a
TODO with manual implementations for each trait. That is because rebasing the
binding changes is a bit of a pain, so I want to give reviewers a change to see
if deriving `Zeroable` for all bindings makes sense or not.

Other changes include addressing most of the outstanding TODOs left in v3 and
addressing review comments from v2 and v3. In particular some of the comments by
Timur that had not been picked up.

Changes since v2:

The main change since v2 has been to make all firmware bindings
completely opaque. It has been made clear this is a pre-requisite for
this series to progress upstream as it should make supporting
different firmware versions easier in future.

Overall the extra constructors and accessors add a couple of hundred
lines of code and a few extra unsafe statements.

Other changes include addressing a bunch of other comments - see the
individual patches for further details. There are also still some
outstanding comments and TODO's to address which I have not gotten to
yet - these will be done in the next version of this series.

Changes since v1:

 - Based on feed back from Alex the GSP command queue logic was reworked
   extensively. This involved creating a new data struct (DmaGspMem) to
   manage the shared memory areas between CPU and GSP.

 - This data structure helps ensure the safety constraints are meet when
   the CPU is reading/writing the shared memory queues.

 - Several other minor comments were addressed, as noted in the individual
   patches.

This series builds on top of Alex's series[1], most of which has been
merged into drm-rust-next, to continue initialising the GSP into a state
where it becomes active and it starts communicating with the host. A tree
including these patches with the prerequisite patches is available at [2].

It includes patches to initialise several important data structures
required to boot the GSP. The biggest change is the implementation of the
command/message circular queue used to establish communication between GSP
and host in patch 6. Admittedly this patch is rather large - if necessary
it could be split into send and receive patches if people prefer.

This is required to configure and boot the GSP. However this series does
not get the GSP to a fully active state. Instead it gets it to a state
where the GSP sends a message to the host with a sequence of instructions
which need running to get to the active state. A subsequent series will
implement processing of this message and allow the GSP to get to the fully
active state.

A full tree including the prerequisites for this patch series is available
at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

[1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
[2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2

Alistair Popple (8):
  gpu: nova-core: Set correct DMA mask
  gpu: nova-core: Create initial Gsp
  gpu: nova-core: gsp: Create wpr metadata
  gpu: nova-core: Add zeroable trait to bindings
  gpu: nova-core: gsp: Add GSP command queue bindings and handling
  gpu: nova-core: gsp: Create rmargs
  gpu: nova-core: gsp: Add RM registry and sysinfo bindings and commands
  nova-core: gsp: Boot GSP

Joel Fernandes (3):
  gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
  nova-core: falcon: Add support to check if RISC-V is active
  nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/driver.rs               |  16 +
 drivers/gpu/nova-core/falcon.rs               |  15 +
 drivers/gpu/nova-core/fb.rs                   |   1 -
 drivers/gpu/nova-core/firmware/gsp.rs         |   3 +-
 drivers/gpu/nova-core/firmware/riscv.rs       |   9 +-
 drivers/gpu/nova-core/gpu.rs                  |   2 +-
 drivers/gpu/nova-core/gsp.rs                  | 135 +++-
 drivers/gpu/nova-core/gsp/boot.rs             |  76 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 533 ++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs         | 117 ++++
 drivers/gpu/nova-core/gsp/fw.rs               | 449 ++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 100 +++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs      |   1 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 592 +++++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/regs.rs                 |  17 +-
 drivers/gpu/nova-core/sbuffer.rs              | 222 +++++++
 scripts/Makefile.build                        |   2 +-
 18 files changed, 2259 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

-- 
2.50.1

