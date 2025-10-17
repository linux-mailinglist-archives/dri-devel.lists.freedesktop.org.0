Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D33BE5F21
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 02:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A4A10EAC4;
	Fri, 17 Oct 2025 00:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TyswnikE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012040.outbound.protection.outlook.com
 [40.93.195.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140C710E0AE;
 Fri, 17 Oct 2025 00:37:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5kD8aprFMihNys6N7FE+Ul4pz5wRDFultIhWRtVA8TNygsjv01SodLdpx94+gWjqGI38SaeOe/M5Cj/lJLXQIWThRHm79MzIERgMA+LFxou56ERieCy7vc8JKNzmQQnCSiJSA/ZchRQCkZHY7VuB372sy5Jh2HqKgsXpbzZlTy1DI+jLYUj/0w6i/75dftkS8lhYSwNihQTaZ2E6JiraNyPjQ1x0bQ8um0Pr3vKNRbi62XegDXEmjicmjr4fjyEskYtO+dI8p5r6TCY1R3OH/2/oz0LK0e5bi3K+p+lPO9AQego87Frrhh5M++YLH3wb8+Pjxb5LkodF8fuZR2SaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqJOZ1Xp88AgYN8HipuHZ3RuSZZfmAb1Y1uBwuMoaoA=;
 b=Q9H+iLIUYJIHh5qJdKqVYPrU5kspPLwAG50UmGi7bxR2trFHasXEwK0V6LAw/SFZJ5hInVxYtOrMXIlak7/40s4cfudJDtUK94KxyDbcQy/RzpWQ3dUdfAVz+LbxlxLwQhtmmg3o/79ZVn7o6jGZDKQEtbMpQM4a+b+2t5PMFKguUHL0csIsXOpqLzmnH9+JgpSQ/uhzfe13+jCltjKE3r0qEXcNIg0+XU2ZYmJezzLUz7jS65VZ4LhWPTO2STcjTy1yGU5lmBV+PtXtsNON+Hgbej+h8kX73XigMWrnf4MmTQbS+0VwWn8h8iqpWu7+Ee9ZFuXm4MfhLkPtz768IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqJOZ1Xp88AgYN8HipuHZ3RuSZZfmAb1Y1uBwuMoaoA=;
 b=TyswnikELQ0bJR9Xvps0MTZX2tXesoLCXmOjKyKjRG46EGCFeh+iGBS2YY/dNmtOQdOxB25tkDCVG3PBCg5ccCsR55xvRKQUY4SvwFc3u2OmkSrhjsaLEbdQdaOKotLyyDMl8IksNO2i4JQxpBf61VYhLeClEdepIm0wWTWqtUJwQ/8KaaQHIjDQryEJ5QZ+bpZzlc7L1GKywBKBjP2YIt7eq8VXJd4N7Pn9nXDFWPeE07FnZq0dgaA1P5XP9fnllbXKfEXOPZSV/cTYg6JdrQ0q7sRP3jV3ZbpmgpCSW1MHI5ZMh03CRPRYnOkGTz/J0IPBxSqxtluHg5y61vUOdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 00:37:03 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 00:37:03 +0000
Date: Fri, 17 Oct 2025 11:36:57 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <uzdfugjo3m5j73wczfbauddatvgzx5ivhimlt5yxgd6vs5ex54@abm4asouc2pb>
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-8-apopple@nvidia.com>
 <DDJJ5745OETR.3TXR3ZVYM4E8T@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDJJ5745OETR.3TXR3ZVYM4E8T@nvidia.com>
X-ClientProxiedBy: SY5PR01CA0061.ausprd01.prod.outlook.com
 (2603:10c6:10:1f4::19) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN2PR12MB4341:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c7602-4554-4ed0-15ee-08de0d154a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6hpU0mwK/fldxmgb7qd0kKLC7ZkRO5Sku8BjP8R4a7adZnIfHXVyENQmmfV?=
 =?us-ascii?Q?fhl+ckgXPKWHYOZTttGYPMUTNn61GfhDWZ2a83dzNSjvync/sg1pj4Qs7FFA?=
 =?us-ascii?Q?DhDD410MSGYx+hpu+hbmjOfb/gkaJKWHDNZqvwKnbwwnoyEk28TTdl2uvwFt?=
 =?us-ascii?Q?QlpJ7aHtJI7grloHY2aeMu5nRQvVhdpknNpzWcxE/ZtYDmMPsXrMKwBjfp9D?=
 =?us-ascii?Q?XkncH/ndO+55FVCDevPBX3VDuD45UW+v1sfHhip236Qss3Sk7iuw80jQKBrr?=
 =?us-ascii?Q?3OD+ZlEjBPw6nLNC3dNlxNEpdr3sO6zsR0JRPg2JOUVR78EulrQ39xzb7FXY?=
 =?us-ascii?Q?f5kENJtd4fkrzsLdHP0lTRI2hN87k0BYrZejl9hYCUwqnh5zUfavGhbHPjR5?=
 =?us-ascii?Q?XkX8vKTXXJlpX4ZdXM5IBnpeHx88aUeiMl8keoyCEOBkUhjPK+xQLitz6PGp?=
 =?us-ascii?Q?LpFW5y5hCwatAR6pcBgxR51jed+Ba116Mdo+d7xftchvgh2vCDio+sMW7lvU?=
 =?us-ascii?Q?K7LGZU0O3uqWEDrTaCEMj4am2opuPJfhZp1J+lxNLS0cODwTrPUCXktnjWtC?=
 =?us-ascii?Q?xCgubymbrIHTbrS1Bg0Ykf45HqSr1CVCSNtmEwxu5NvY/L4YbnffGf24m9RO?=
 =?us-ascii?Q?Y0rdMSDBguA+I0dvbaa3ua/xz+dExY9SLTfEvKMZmHDjwkyUmQtP4i3Ph/VT?=
 =?us-ascii?Q?C4nMaJjsO7BsdB5IEXlvg4eRfD+eHb3IgKDpPGb0ihUyuoFMYtC48727G6OI?=
 =?us-ascii?Q?DTtLZlF3KdwnTXkArDRZSbz7yqWwi5FezDe6+2cElJ2mbjQ/Rn+5tsYbXS5w?=
 =?us-ascii?Q?OBAbEMCIqWP972I0kqIzk3oHTJKgP4CHUabAD2Ok61hmOWML+mnRKinVfI1a?=
 =?us-ascii?Q?/12NAONVPUh8aaiFAW5yEcsNBoODuRs4GE/CXLdu1lT23h7pK7QxeVEtpPxT?=
 =?us-ascii?Q?LqMoN6LcbCMI+eXlK3EwrXSGpavd/hPugWGjGII12xrKa/8323s39EIE3F1f?=
 =?us-ascii?Q?B+RjJyxpOegzKHcWyaHcw9M7/iOYLMGd2j+uTOkmjWhm1tnCXY7BKd2f17Rm?=
 =?us-ascii?Q?i2iuopmMIQ2INj90BS+E8YGwtPhPr9fXBlPEmXg/MC1Gp4fIlohbsSsJ8qer?=
 =?us-ascii?Q?tg+XQ08NZ7MMJh3VNmharIFktmX5E5yyS+YaFwxnVKv6HbNdXF+fykL5mVc8?=
 =?us-ascii?Q?5HErMYmbS7f5TaRJPV3NZAS8khxyxqe5yDLyyV8Iy348AD+0Ko9LSAboGFUr?=
 =?us-ascii?Q?b5N3y1SP1rMeX7uUXc+OvgwB6HMXrs+C8tVWiPdDOohdiAL7DMjLEZ/X4JX0?=
 =?us-ascii?Q?YwbHu4ILcFWQBT9LL8owMAIoXgJt2h+W3riq2iCncecBpY/F0YmTTfpSppzX?=
 =?us-ascii?Q?zsdS1axShI5BVld8wyIdwA4f95tnOOL8z0ZsXh8UM3BPAfpDTdsAgBY7LCvJ?=
 =?us-ascii?Q?aWzHCtlB6QiaqDuKftSCv4QmUAQpRzma?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+n8kq1rL6+uZiRYP+kaTvUNsXRLXIFYMw3ROKj+LEICYZXvYD0Dkc6UMAO05?=
 =?us-ascii?Q?rC+ajuopRlN1Lgxv1oCXWgbuVCS0kQKf5ZYfW5Gr9mztx6mPeOWutTSPt1Xh?=
 =?us-ascii?Q?mYeSHowr82+Y2sAJ/TGyv45KdtAxbSqs7aXiXcQXp0QTrd1r+Wv2ChXBgYf6?=
 =?us-ascii?Q?oYd0GaMhkgbkCn7ZK9319v5XQIub5L7BiXOjrcyi1XkiCaeVCNsld6qJqcNB?=
 =?us-ascii?Q?1gL0QxCNWx+nt2Ka5PRngs1Y2tQtnhbMtcsRh1cw4Y0YzvDYzksuZAknE+Ob?=
 =?us-ascii?Q?i+Gi8FHEjmhqofb3q5Og2Qtc1Rqk0kaRvLHgY3ADePEfcd5Z78xOZcU4O7U6?=
 =?us-ascii?Q?m20H7sx+dY/ReUzYGXF5Eauf4GcI6ufcLj6ehVJeVcF5D8mgCSFFoe4Fh3gU?=
 =?us-ascii?Q?bcoOOey6jNEAa6YAtW3/+gPnnML/DncFh27c8fjEWDidCyxQULw+bV7Ofp2x?=
 =?us-ascii?Q?VIPfXrmQq03UftdSWbW8DCujYJq4WE602Z3KrOSQZcmUtitg0VfhxFac280w?=
 =?us-ascii?Q?cDfpJV6YphYjY6lR8boaUrTcjDjkq9IQIQgI/yAXeG1B+WeCUmtMGGounBcT?=
 =?us-ascii?Q?olFoy1bXvNX+BnjLZyGc8mYKDiJI45awRGEH0HVDdfHwlLbGV07OaX5WLAd+?=
 =?us-ascii?Q?J9LFJY2wXC4KNu1qPQ8fncr2JmQGHl0tgOW2Sdanpl8+hQPMrVVJDgoEX4uJ?=
 =?us-ascii?Q?eTSniwAoGyOfm4beLryuXOL6euqSI0pTeRe6NQjtwJde8qz8Jo0JFua/o6wh?=
 =?us-ascii?Q?0Wn55VsgZhQXO8+O/lAHHOP/PDw6ET6b0uYGkkQpKytvyWaBpEr/oNCKzTza?=
 =?us-ascii?Q?GVjZS6UtdpsGCCXxr25MB4WnLpDP9anuyVmxC3ZUWsRVBBNaQLvxl+/orIwJ?=
 =?us-ascii?Q?Kqs4FvQGaQIjnPX7HXDCJ/Ch7USnI+Iwzq4Xu0ORibXrXmv5FF8/KtMsuI84?=
 =?us-ascii?Q?EsUcDbuf32jK2bBR1tvoGHBb6ENJ5cHagTQZqYSncJLmJB8c6RwG4rNQFf1O?=
 =?us-ascii?Q?dtJbqbpBNWEdtSYS4YHo0gEtiUvB+RnsN7B49IWCTE6kmgVzwUBmULCCi7wp?=
 =?us-ascii?Q?rLP1G/OBvP52QKy+xD79aqARgMXatC6IW+PQaseeL8N9Xvz0L9scSEvZX8c1?=
 =?us-ascii?Q?EnyyUBG9i0gZT4PgIBBbQUWB9lPZk+v8CS7wRtUBq4zzvcGlodF8VrSVZH7R?=
 =?us-ascii?Q?d8L5aAOo33vOVNRqF2a1Qpzey2DXNnUmmYqo4VRSUlH7lMMshpRQ0+WkGwRc?=
 =?us-ascii?Q?hggF5I6IxfhysAVwMs4Pn/nTiQSFMmREnkvDR+v3+iQlr2NbYvKcE2TReBZu?=
 =?us-ascii?Q?MFlNPZ72XFix8lL6HnVZGpUSHjOacakSpy8NOKelhJxV55FMJQj7R6GF3Lb2?=
 =?us-ascii?Q?Vr7P/bRzJdBQvyYU3sodNKr86XSlyYx5sfa5CSA+pGYmZY8yp8bRfrTmjiAW?=
 =?us-ascii?Q?qe7f2neQ0Ne3LdyzMsWOPcetliRyKCCIc+7wuTvGOxkLKM5BT7cKJOxzD53M?=
 =?us-ascii?Q?50ZiUdqMiUbXgU8x9x+81NCqMUDqpoXbrqu/Wb1RriQ2uePl0LG7WA5G+6Qr?=
 =?us-ascii?Q?YyxHKV7soIyu5mufgi1Aex0A7wIGHaqYL3HBuLZ6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c7602-4554-4ed0-15ee-08de0d154a84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:37:03.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxuysQcGnL33l+MZTD9dNqADjnIuOvq5rjtz4BsJm7s+k5duWuF9uO53bjr+G6ZyGDmi8N7irDvB3A15r/Ih+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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

On 2025-10-16 at 17:24 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> > This commit introduces core infrastructure for handling GSP command and
> > message queues in the nova-core driver. The command queue system enables
> > bidirectional communication between the host driver and GSP firmware
> > through a remote message passing interface.
> >
> > The interface is based on passing serialised data structures over a ring
> > buffer with separate transmit and receive queues. Commands are sent by
> > writing to the CPU transmit queue and waiting for completion via the
> > receive queue.
> >
> > To ensure safety mutable or immutable (depending on whether it is a send
> > or receive operation) references are taken on the command queue when
> > allocating the message to write/read to. This ensures message memory
> > remains valid and the command queue can't be mutated whilst an operation
> > is in progress.
> >
> > Currently this is only used by the probe() routine and therefore can
> > only used by a single thread of execution. Locking to enable safe access
> > from multiple threads will be introduced in a future series when that
> > becomes necessary.
> >
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >
> > ---
> >
> > Changes for v4:
> >  - Use read_poll_timeout() instead of wait_on()
> >  - Switch to using `init!` (Thanks Alex for figuring out the
> >    required workarounds)
> >  - Pass the enum type into the RPC bindings instead of a raw u32
> >  - Fixup the TODOs for extracting/allocating the send command regions
> >  - Split the sending functions into one taking just a command struct and
> >    another taking a command struct with extra payload
> >
> > Changes for v3:
> >  - Reduce the receive payloads to the correct size
> >  - Use opaque bindings
> >  - Clean up of the command queue PTE creation
> >  - Add an enum for the GSP functions
> >  - Rename GspCommandToGsp and GspMessageFromGsp
> >  - Rename GspCmdq
> >  - Add function to notify GSP of updated queue pointers
> >  - Inline driver area access functions
> >  - Fixup receive area calculations
> >
> > Changes for v2:
> >  - Rebased on Alex's latest series
> > ---
> >  drivers/gpu/nova-core/gsp.rs      |   9 +
> >  drivers/gpu/nova-core/gsp/cmdq.rs | 493 ++++++++++++++++++++++++++++++
> >  drivers/gpu/nova-core/regs.rs     |   4 +
> >  drivers/gpu/nova-core/sbuffer.rs  |   2 -
> >  scripts/Makefile.build            |   2 +-
> >  5 files changed, 507 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
> >

[...]

> > +use crate::sbuffer::SBufferIter;
> > +
> > +pub(crate) trait CommandToGsp: Sized + FromBytes + AsBytes {
> > +    const FUNCTION: MsgFunction;
> > +}
> > +
> > +pub(crate) trait CommandToGspWithPayload: CommandToGsp {}
> 
> Unfortunately this hierarchy won't work, because this way a command that
> is expected to take a payload can be sent without any.
> 
> I'd suggest instead having a `CommandToGspBase` trait that sets the
> FUNCTION, and have `CommandToGsp` and `CommandToGspWithPayload` require
> it.

Ok.

> > +
> > +pub(crate) trait MessageFromGsp: Sized + FromBytes + AsBytes {
> > +    const FUNCTION: MsgFunction;
> > +}
> 
> Just a bit of documentation for these new traits please. :)
> 
> (also applies to all undocumented types/methods in this file)

Sure.

> <snip>
> > +impl DmaGspMem {
> > +    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
> > +        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
> > +        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
> > +
> > +        let gsp_mem =
> > +            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
> > +        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
> > +        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
> > +        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
> > +
> > +        Ok(Self(gsp_mem))
> > +    }
> > +
> > +    // Allocates the various regions for the command and reduces the payload size
> > +    // to match what is needed for the command.
> 
> Let's also explain what the elements in the returned tuple are.
> 
> > +    //
> > +    // # Errors
> > +    //
> > +    // Returns `Err(EAGAIN)` if the driver area is too small to hold the
> > +    // requested command.
> > +    fn allocate_command_regions<'a, M: CommandToGsp>(
> > +        &'a mut self,
> > +        payload_size: usize,
> > +    ) -> Result<(&'a mut GspMsgElement, &'a mut M, &'a mut [u8], &'a mut [u8])> {
> > +        let driver_area = self.driver_write_area();
> > +        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
> > +        let driver_area_size = (driver_area.0.len() + driver_area.1.len()) << GSP_PAGE_SHIFT;
> > +
> > +        if msg_size > driver_area_size {
> > +            return Err(EAGAIN);
> > +        }
> > +
> > +        #[allow(clippy::incompatible_msrv)]
> > +        let (msg_header_slice, slice_1) = driver_area
> > +            .0
> > +            .as_flattened_mut()
> 
> We are going to have a slight problem here. `as_flattened_mut` is only
> available since Rust 1.80... and we need to support 1.78.
> 
> I suppose we could work this around by defining a custom function tht
> just calls `as_flattened_mut` in Rust versions that support it and
> provides an alternative implementation for those that don't, but I
> wonder whether there is a better way.

Oh I didn't realise the function name had changed, I thought we just needed to
allow the experimental feature in older versions. I probably wont get to this
this week so have left it as a TODO for now.

> > +            .split_at_mut(size_of::<GspMsgElement>());
> > +        let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
> > +        let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
> > +        let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
> > +
> > +        #[allow(clippy::incompatible_msrv)]
> > +        let payload_2 = driver_area.1.as_flattened_mut();
> > +
> > +        let (payload_1, payload_2) = if payload_1.len() > payload_size {
> > +            // Payload fits entirely in payload_1
> > +            (&mut payload_1[..payload_size], &mut payload_2[0..0])
> > +        } else {
> > +            // Need all of payload_1 and some of payload_2
> > +            let payload_2_len = payload_size - payload_1.len();
> > +            (payload_1, &mut payload_2[..payload_2_len])
> > +        };
> > +
> > +        Ok((msg_header, cmd, payload_1, payload_2))
> > +    }
> 
> We should probably add a few comments in this function to explain the
> steps, otherwise it can be a bit difficult to parse.

Ok.

> > +    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
> > +        let sum64 = it
> > +            .enumerate()
> > +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> > +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
> > +
> > +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> > +    }
> > +
> > +    // Notify GSP that we have updated the command queue pointers.
> > +    fn notify_gsp(bar: &Bar0) {
> > +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
> > +    }
> 
> Can we move this method to `regs.rs`, as an impl block of
> `NV_PGSP_QUEUE_HEAD`? It makes more sense to have it there imho.

We could, but I think it belongs here. If I'm understanding things correctly the
value of this register is FW/SW defined. For now GSP doesn't look at the value
so it doesn't really matter what we write, but it's possible that could change
which means we want it here in the code that talks to GSP.

> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
> > +    where
> > +        M: CommandToGsp,
> > +        // This allows all error types, including `Infallible`, to be used with `init`. Without
> > +        // this we cannot use regular stack objects as `init` since their `Init` implementation
> > +        // does not return any error.
> > +        Error: From<E>,
> > +    {
> > +        #[repr(C)]
> > +        struct FullCommand<M> {
> > +            hdr: GspMsgElement,
> > +            cmd: M,
> > +        }
> > +        let (msg_header, cmd, _, _) = self.gsp_mem.allocate_command_regions::<M>(0)?;
> > +
> > +        let seq = self.seq;
> > +        let initializer = try_init!(FullCommand {
> > +            hdr <- GspMsgElement::init(seq, size_of::<M>(), M::FUNCTION),
> > +            cmd <- init,
> > +        });
> > +
> > +        // Fill the header and command in-place.
> > +        // SAFETY:
> > +        //  - allocate_command_regions guarantees msg_header points to enough
> > +        //    space in the command queue to contain FullCommand
> > +        //  - __init ensures the command header and struct a fully initialized
> > +        unsafe {
> > +            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().cast())?;
> > +        }
> > +
> > +        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
> > +            msg_header.as_bytes(),
> > +            cmd.as_bytes(),
> > +        ])));
> > +
> > +        dev_info!(
> > +            &self.dev,
> > +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            self.seq,
> > +            msg_header.function_number(),
> > +            msg_header.function()?,
> > +            msg_header.length(),
> > +        );
> > +
> > +        let elem_count = msg_header.element_count();
> > +        self.seq += 1;
> > +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> > +        Cmdq::notify_gsp(bar);
> > +
> > +        Ok(())
> > +    }
> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn send_gsp_command_with_payload<M, E>(
> > +        &mut self,
> > +        bar: &Bar0,
> > +        payload_size: usize,
> > +        init: impl Init<M, E>,
> > +        init_payload: impl FnOnce(SBufferIter<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> > +    ) -> Result
> > +    where
> > +        M: CommandToGspWithPayload,
> > +        // This allows all error types, including `Infallible`, to be used with `init`. Without
> > +        // this we cannot use regular stack objects as `init` since their `Init` implementation
> > +        // does not return any error.
> > +        Error: From<E>,
> > +    {
> > +        #[repr(C)]
> > +        struct FullCommand<M> {
> > +            hdr: GspMsgElement,
> > +            cmd: M,
> > +        }
> > +        let (msg_header, cmd, payload_1, payload_2) =
> > +            self.gsp_mem.allocate_command_regions::<M>(payload_size)?;
> > +
> > +        let seq = self.seq;
> > +        let initializer = try_init!(FullCommand {
> > +            hdr <- GspMsgElement::init(seq, size_of::<M>() + payload_size, M::FUNCTION),
> > +            cmd <- init,
> > +        });
> > +
> > +        // Fill the header and command in-place.
> > +        // SAFETY:
> > +        //  - allocate_command_regions guarantees msg_header points to enough
> > +        //    space in the command queue to contain FullCommand
> > +        //  - __init ensures the command header and struct a fully initialized
> > +        unsafe {
> > +            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().cast())?;
> > +        }
> > +
> > +        // Fill the payload
> > +        let sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut payload_2[..]]);
> > +        init_payload(sbuffer)?;
> > +
> > +        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
> > +            msg_header.as_bytes(),
> > +            cmd.as_bytes(),
> > +            payload_1,
> > +            payload_2,
> > +        ])));
> > +
> > +        dev_info!(
> > +            &self.dev,
> > +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            self.seq,
> > +            msg_header.function_number(),
> > +            msg_header.function()?,
> > +            msg_header.length(),
> > +        );
> > +
> > +        let elem_count = msg_header.element_count();
> > +        self.seq += 1;
> > +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> > +        Cmdq::notify_gsp(bar);
> > +
> > +        Ok(())
> > +    }
> 
> I think we can factorize most of `send_gsp_command` and
> `send_gsp_command_with_payload` into a private method that requires a
> `CommandToGspBase` and takes the same parameters as
> `send_gsp_command_with_payload`. All it would need to do when called
> from `send_gsp_command` is take a closure that doesn't write any
> payload.

You're right, that is nicer. I was thinking it would be good to have a simple
function that ignored the payloads, but it didn't really end up any simpler.

> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
> > +        &mut self,
> > +        timeout: Delta,
> > +        init: impl FnOnce(&M, SBufferIter<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
> > +    ) -> Result<R> {
> > +        let driver_area = read_poll_timeout(
> > +            || Ok(self.gsp_mem.driver_read_area()),
> > +            |driver_area: &(&[[u8; 4096]], &[[u8; 4096]])| !driver_area.0.is_empty(),
> > +            Delta::from_millis(10),
> > +            timeout,
> > +        )?;
> > +
> > +        #[allow(clippy::incompatible_msrv)]
> > +        let (msg_header_slice, slice_1) = driver_area
> > +            .0
> > +            .as_flattened()
> > +            .split_at(size_of::<GspMsgElement>());
> > +        let msg_header = GspMsgElement::from_bytes(msg_header_slice).ok_or(EIO)?;
> > +        if msg_header.length() < size_of::<M>() as u32 {
> > +            return Err(EIO);
> > +        }
> > +
> > +        let function: MsgFunction = msg_header.function().map_err(|_| {
> > +            dev_info!(
> > +                self.dev,
> > +                "GSP RPC: receive: seq# {}, bad function=0x{:x}, length=0x{:x}\n",
> > +                msg_header.sequence(),
> > +                msg_header.function_number(),
> > +                msg_header.length(),
> > +            );
> > +            EIO
> > +        })?;
> > +
> > +        // Log RPC receive with message type decoding
> > +        dev_info!(
> > +            self.dev,
> > +            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> > +            msg_header.sequence(),
> > +            msg_header.function_number(),
> > +            function,
> > +            msg_header.length(),
> > +        );
> > +
> > +        let (cmd_slice, payload_1) = slice_1.split_at(size_of::<M>());
> > +        #[allow(clippy::incompatible_msrv)]
> > +        let payload_2 = driver_area.1.as_flattened();
> > +
> > +        // Cut the payload slice(s) down to the actual length of the payload.
> > +        let (cmd_payload_1, cmd_payload_2) =
> > +            if payload_1.len() > msg_header.length() as usize - size_of::<M>() {
> > +                (
> > +                    payload_1
> > +                        .split_at(msg_header.length() as usize - size_of::<M>())
> > +                        .0,
> > +                    &payload_2[0..0],
> > +                )
> > +            } else {
> > +                (
> > +                    payload_1,
> > +                    payload_2
> > +                        .split_at(msg_header.length() as usize - size_of::<M>() - payload_1.len())
> > +                        .0,
> > +                )
> > +            };
> > +
> > +        if Cmdq::calculate_checksum(SBufferIter::new_reader([
> > +            msg_header.as_bytes(),
> > +            cmd_slice,
> > +            cmd_payload_1,
> > +            cmd_payload_2,
> > +        ])) != 0
> > +        {
> > +            dev_err!(
> > +                self.dev,
> > +                "GSP RPC: receive: Call {} - bad checksum",
> > +                msg_header.sequence()
> > +            );
> > +            return Err(EIO);
> > +        }
> > +
> > +        let result = if function == M::FUNCTION {
> > +            let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
> > +            let sbuffer = SBufferIter::new_reader([cmd_payload_1, cmd_payload_2]);
> > +            init(cmd, sbuffer)
> > +        } else {
> > +            Err(ERANGE)
> > +        };
> > +
> > +        self.gsp_mem
> > +            .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
> > +        result
> > +    }
> 
> Here we probably also want to comment the different steps a bit.

Ok.
