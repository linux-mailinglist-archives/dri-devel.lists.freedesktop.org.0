Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED66BF30CF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5410E4DD;
	Mon, 20 Oct 2025 18:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BHqs+9HW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3BB10E4DC;
 Mon, 20 Oct 2025 18:55:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bv7+HxyNttoo5HCmKVMEw6eSzj8qHd+719nFY3SHOMepUqp3aHOX06kQI1Qix4EE5PGYWa5IIJEDEF7Y8z/cpt8B2x7Aw3YNi8X3HkxSx0NbPOBwPwdTnD3To0rJBdFb0ab+Y9GGdb7BcHpuaP5vlBQ6ul/PzV9RTD3oRhtEGITPdKE7g940inBh0IJnAgn6bI6ZOKzS1GkmXotWpazlFD2H29rwVfQFtX2pcB1YyF6jwOzqVHQ/UWOp40zbskYCdKeT7Y2qUybKtmV2WuXT21TosRBcCCruL2rfoPdUL0PNwL29vszKKom30gD6p8PeqtluUChZsbXWisU0f1kV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+U0pBSSOrevwROIXWur0DwW26sZm/I6PuFpMt3oyNg=;
 b=Jzz2vFqssKTJuOCQqCmgALPBiDcnRR4FwYHk1u7dwefYwoVYHHeHrh47/HF6MZczdUFZbYqlSbXHQw0KCRK4OVftSE1Lnb19gJS8v367ZGOivO2KtvDETRyTDuD5y3eBrwklPUISuIGDZlAKwONEWzjcmLzwddijS/JUtINmn9Q7nOfaAhYjKJze7wxSzRvGN6McNHRpz3rHCC4/4+NZLya1/AzStSXMqC7z6WyPbfK2uqqALz9SkFpqr9nFKLxgDPKEBChBDN0dMXPkXK48qTaRJSqckoarW9KbFM61e/BcWmKtFtTALtKY10KmxCOuZ9h4qIHXAsWHu/s1PR6W6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+U0pBSSOrevwROIXWur0DwW26sZm/I6PuFpMt3oyNg=;
 b=BHqs+9HWb7YRFTvaadsAa9tEpvb6+pYzfkuhZ9ggw6N0JzHelSQOMmh60C1TznKfmicbbZWB/64mThYnaMudSyiSqL0NOHr9pAAufY0Mv2N87JkkRf51JE1mPn5XBlhEXb1n5PbSF3Ft9xpclpyT6duqeqtJIH4oCfgJXpjj1I9OohX1CiBn4MUyzAOx24aIwSlGbYwsmj9EmMkpXFAijrb0G5msPyMe+bWG9z0QBOURWtkFvH9bxbjA7iaAGmxwvmi9fYZnyi5uPAzNzm1yiUaWGBb/BQYmjjvyPErz4PockBvBUvWMh3f9Hgxq83n9jeFZyjFdXK2K49+QpvYE6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9316.namprd12.prod.outlook.com (2603:10b6:610:1ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 18:55:49 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 18:55:47 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
Date: Mon, 20 Oct 2025 14:55:32 -0400
Message-Id: <20251020185539.49986-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0393.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9316:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ab71a5-1ad3-43e8-cc97-08de100a47a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUAuiN8gFu8UxXEQ9O+Bl3G6tJzHn7wd5zZx94vnBXBA4rcWo3w+kJR/CrHM?=
 =?us-ascii?Q?BTnUKi50ZeO6w6kgmwFvGtd0gyctsqMyss8dCev10jkt5Ioiuu9jd95MKcyO?=
 =?us-ascii?Q?YgiGvWoYy+J16ZybGoEl8xhyfeWea1Cm3tyfF25vXexb6JVogirymtt4bEKy?=
 =?us-ascii?Q?oxwyoC9Vg1MBWcEBAxd+EhJnF2Dkj/oPZSqRv8uaPYX5IJmd75rUfxy2EQ+d?=
 =?us-ascii?Q?GdmMSTUq0YnSrb8R7/fafV7+q8OXO/B6H1v5CeqDeUlP61/2pBhlWJsL7NgD?=
 =?us-ascii?Q?vEK0dIWmrfzLOVQ9Jl/FzJIIB59EoquwofOgyhgleol2I/kgCAnGsznqoY1U?=
 =?us-ascii?Q?ozOE9JV+W0Ml5msoct2VGB2/STuJ81sp6VHpqbBfpMdiE7dmrjFkDfDKmQA5?=
 =?us-ascii?Q?iZHxiTx/LcTaJb+CMLrT9/wtrhY6XP/lzptHbtF+zqMiuE3J5mXj4N/0uXa8?=
 =?us-ascii?Q?CFkAldqBB0EOjGNiAPlrVT7IWW9qfYKhtJHr5Q7xceWNS6SxeJrEi/A0dCk+?=
 =?us-ascii?Q?Roxi4NeiVIZqzotyu/m8Y/NbnaGzz/OkG8UEZa/Ds6lhop6v4kbz6e/s9NXc?=
 =?us-ascii?Q?G3uJGzD8+bEyQll9IvJE8rsbjU9MKy7Cwq6x0mx7IffebU5IQL/4RtEOmin/?=
 =?us-ascii?Q?2+7q20ix+NhTUHwPAt5kgERr5T5BB3wjRAG5B4H2yFZDEdMt5QWo1l/OAsFI?=
 =?us-ascii?Q?h3UdU4RBBqpZnVChHfSmioL3OE90GX0NFgspf6bXyyE1Y/r2FJOBDV6AWfkL?=
 =?us-ascii?Q?Sp8Q/AJdAivmC1zPiSn3qEiojV5I8wYylKmSaWixll+yhxRj9o5SJIBbZRIo?=
 =?us-ascii?Q?86vAmIj0Z0/q6n9UevgOOV1NbBgXt0YsRTrrMt51ke3Dnrj3cu9CxQI754br?=
 =?us-ascii?Q?HDoIM2xkoZifILOBArYFB7DR8EXnMYVP/j4t4uWaV3GsXumZmNUT8c75/chX?=
 =?us-ascii?Q?CSZ9q1PqvCczY0liuQOcr7T/UV/kvIP7SS8FgaJiVxkf7I40ONk6F7jzjfat?=
 =?us-ascii?Q?mOjEvJjnTPt9stsjyVEvgVdreG8K32xUtq1gxeqF1NsCL5hXktMxPE1+bWh4?=
 =?us-ascii?Q?+MCyp92hVSj0WyTcVuDeX52kFjppgdfHZmu2ndcyfHuL0B5Da+SrBNIyRNq1?=
 =?us-ascii?Q?DeQRLJesUeaPGw53qOX7MXFne3tz+ut9wqI7GOiZALqh11gAXx1hgfTRKsdW?=
 =?us-ascii?Q?MdRIk6VCmyQw7cnFKHttxwffdZ6G9nCgWTx/OoettkVhw9VkibzJiZg3AYoz?=
 =?us-ascii?Q?LJgJ9ibApI1sgGVyCABPi3dG9G4wJYhcO3La88n7sPNJHugzxuqBclXqqDFu?=
 =?us-ascii?Q?DcB9TZtjwE5n6A1Ek2peZ9Jp7UkC3rJMnRtTVxblTRGUm+VD7c9pa9fK4woS?=
 =?us-ascii?Q?7Z7o0PrTnEhPpsCq+1qKOVSls6oh9/Ndzfp4QaLeGyfBBgOwYuL4pTnA2rxI?=
 =?us-ascii?Q?nDMRLRz6Nnc8l2G17Mg4+HTPt+DliHBq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/rAwUGpPVptUDqB6yzlxdCMbTWhxOmexjOVrEybwZ/lgG/ww/ytUKPdeFkO6?=
 =?us-ascii?Q?KTKiafoD3l+9S9lyVR7G94ZncEm4Ai4qITQz8IPvsNDgksaHoslZhnypAFwv?=
 =?us-ascii?Q?Xs5DSsT7ag2ZAQmQZlLezlt/UJE/retxQUMFte4j68Kezmh262BUBX1WIVuZ?=
 =?us-ascii?Q?tqYrJsyEuEaEvO/RfP87CPk9Zv0BrYlBZzURrNaHHgmTQeBKoY26GCFcMW32?=
 =?us-ascii?Q?EOQb0FkZpmmv02xUfmMpzTUdETPo9nGxOaksLS8rEcErKBIKl1n2A9kBE53V?=
 =?us-ascii?Q?96Iz0cKkC/sscmAcXBhptYdV938HhGlk5aJIEK+ShvaG8tCagT7366DGrP/I?=
 =?us-ascii?Q?klfmCFhp1Nn9NHaIJog5/xwbwsxcxUUrjCbd5JOmSallpAsoia1N/njAw/EP?=
 =?us-ascii?Q?u+tV4so5rFLA4VyS5Vj1LbSUeuilRxd7lI2YkSprWjE3qEW3sj20P1vbsGh7?=
 =?us-ascii?Q?FJW3B5vY2DvYrYNXUbj0H6JA5rf2ItFj2tgHIwq+dZpJKGWIqZtCbdgGW1BP?=
 =?us-ascii?Q?9agp0XWDFk2zWb6Rlx0gxy+gy1V/0sbTdCjt6tj5JB98WF8PM2gMwikfyYAT?=
 =?us-ascii?Q?Ytfng0wOi2Q56u5m4AOREix/MqMvd+yO2nvHg7dJNy478q02PehUdQxu6EEX?=
 =?us-ascii?Q?TimAYdWGTyuqIGZ+C2WjFRhZBGjrlHqOcBoOArqdgNWYz4aBc8Q+tjpHmJlw?=
 =?us-ascii?Q?Z8WC43UE5WKRJcKHKA4/7SCXO+WsQMzQfS5MTl5C2Rdlygy66xnfB/wtfBAK?=
 =?us-ascii?Q?YT7M8V3ua3fr3NiXy09XB/lQZ2z/p63s5oOh6IW1Vp0pHPq8gmmKiAe+LSmt?=
 =?us-ascii?Q?QpI9kxuFWq55+mAzK9nsId+G93f0v1W0tUKSCb6MI9jNw3GZhPjvogVPUmhx?=
 =?us-ascii?Q?9bqtWAOBdPD+C/JHakQrIix/Eozf2762EJHV4zGMy0RLt2mDRpUp0UfGTQfX?=
 =?us-ascii?Q?wKRoDYUbh3f1ZV0r3SyaYyYUXEpd08WJvLWoMObF3MGLNXURcO2N/N2MBqzC?=
 =?us-ascii?Q?ZZef9GV7/0xGsXW44fpd8XqGku4jWEANe+5LXe/gD58H98n7quuD6nOZaeuw?=
 =?us-ascii?Q?j2FCbQ1VN6pTNGN2wjZGdYXkyQxAKwk6+LUkF7JJO+c+XFE2PJIFlblv3dHi?=
 =?us-ascii?Q?ZuhzKCMKxTybRyeBE2dn76uLVouMmvllEwFdn3BL5snIMvhhcpBJEHIQ0kAk?=
 =?us-ascii?Q?70mFselDhnlQDJegkncyM8lPBSxKsV19wN3Tuc8ugRPklx4Cg6p1P17YS0cr?=
 =?us-ascii?Q?oX/EX3Zz2ZIbYJHUnL5+J36x+pQpEvdEbII/ot7M0ZQ8lkonQy6PM39O0xaQ?=
 =?us-ascii?Q?c1L/joN/Y3hBkfYmt0ZzkhDekpyzK9OAIcnZdGIEcLMOuYUeAEpwBxvD2oWR?=
 =?us-ascii?Q?R0Ffp2fu+JZKTemQHkNeVN/Iw6B2rCBulitYQQ/laE0w1gheun6Nn4VJPdKV?=
 =?us-ascii?Q?4+e/BIxEJ7V1rpmYIox3Oze9tf1llii6Spz0VBRgDDMIXeEjwYj1u+isjJ+G?=
 =?us-ascii?Q?D7kMsuBlb7A5mC6tQK8zmW6sGR2T8oNnl0p7kZ8O9p4APGdaiPBpv3XjrGeJ?=
 =?us-ascii?Q?jn+F06OUIchm5KdTozAOjXlnbpnyAHXNcFo4rdga?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ab71a5-1ad3-43e8-cc97-08de100a47a0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 18:55:47.2480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZIEHp46PIIjJH+OLWdHxtgVnbsXBcEK1yHSxmoQbVvwe0/VWgNIjubwGA0SRZOftsAVMV+fj1ffDIFOQntvZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9316
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

These patches have some prerequistes needed for nova-core as support is added
for memory management and interrupt handling. I rebased them on drm-rust-next
and would like them to be considered for the next merge window. I also included
a simple rust documentation patch fixing some issues I noticed while reading it :).

The series adds support for the PRAMIN aperture mechanism, which is a
prerequisite for virtual memory as it is required to boot strap virtual memory
(we cannot write to VRAM using virtual memory because we need to write page
tables to VRAM in the first place).

I also add page table related structures (mm/types.rs) using the bitfield
macro, which will be used for page table walking, memory mapping, etc. This is
currently unused code, because without physical memory allocation (using the
buddy allocator), we cannot use this code as page table pages need to be
allocated in the first place. However, I have included several examples in the
file about how these structures will be used. I have also simplified the code
keeping future additions to it for later.

For interrupts, I only have added additional support for GSP's message queue
interrupt. I am working on adding support to the interrupt controller module
(VFN) which is the next thing for me to post after this series. I have it
prototyped and working, however I am currently making several changes to it
related to virtual functions. For now in this series, I just want to get the
GSP-specific patch out of the way, hence I am including it here.

I also have added a patch for bitfield macro which constructs a bitfield struct
given its storage type. This is used in a later GSP interrupt patch in the
series to read from one register and write to another.

Joel Fernandes (7):
  docs: rust: Fix a few grammatical errors
  gpu: nova-core: Add support to convert bitfield to underlying type
  docs: gpu: nova-core: Document GSP RPC message queue architecture
  docs: gpu: nova-core: Document the PRAMIN aperture mechanism
  gpu: nova-core: Add support for managing GSP falcon interrupts
  nova-core: mm: Add support to use PRAMIN windows to write to VRAM
  nova-core: mm: Add data structures for page table management

 Documentation/gpu/nova/core/msgq.rst     | 159 +++++++++
 Documentation/gpu/nova/core/pramin.rst   | 113 +++++++
 Documentation/gpu/nova/index.rst         |   2 +
 Documentation/rust/coding-guidelines.rst |   4 +-
 drivers/gpu/nova-core/bitfield.rs        |   7 +
 drivers/gpu/nova-core/falcon/gsp.rs      |  26 +-
 drivers/gpu/nova-core/gpu.rs             |   2 +-
 drivers/gpu/nova-core/mm/mod.rs          |   4 +
 drivers/gpu/nova-core/mm/pramin.rs       | 241 ++++++++++++++
 drivers/gpu/nova-core/mm/types.rs        | 405 +++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/regs.rs            |  39 ++-
 12 files changed, 996 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/msgq.rst
 create mode 100644 Documentation/gpu/nova/core/pramin.rst
 create mode 100644 drivers/gpu/nova-core/mm/mod.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
 create mode 100644 drivers/gpu/nova-core/mm/types.rs

-- 
2.34.1

