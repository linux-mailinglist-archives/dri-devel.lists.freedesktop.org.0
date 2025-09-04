Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595CB43301
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 08:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1343310E97D;
	Thu,  4 Sep 2025 06:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pv5k0t2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6852410E121;
 Thu,  4 Sep 2025 06:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU2s03y4r1iKncH6MPzvL+Gbmqf9DR8jS4p0yJQmBsh1jrwxSjkplumNz/aAHQ9FV8BBpWFPySYeoLJNchXvhvDzKphQQ9mz/Oe92AZvnsh2F3irQcT2nBSUU3kv+OsG9AHbxNCx0KzkeR7WHUH2jDL+GKwWy+OXPO9QAfBYABaxwEWkV5DVf892++dw5BNIAwWBj4A2y+m9lpryzX6ltZic821SdvVTiByzuzzMl0ijwNPyGrkV6IxpCeZHdW13lA7uDGYUISSWLhIpkOn2l7YftIjutbljb8YBw6LdZb4mTcIHr8q8l07DR5g/wguqErMi53o/ltPCUekswgO5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vTSlG9YLQJS3ahS2yfwWDs9EEZWfejyJzD/lOSUjVI=;
 b=qtFuPw5JXXKPjTRiC91oKx+9EQZdqnoEy3bTpLn4O7BiXTAEK8JViof+0cEFKoe5SVYBjC9k6NrATVU8IM2zMw2fDAbQMCMso+YX1MvD3XO7lb3u8oOdTNwEMQxrmFCNMMvA5MizD52CX3VIlbtB4vJtKvi9kQMKpEGJbrt7GrB2caQNS6kWLodq+moL0cg9dm8oCchdJcfRFPcuiGNOaPd7B425N7H+f7bm7j5kJT+9esPxnZ+G1LpG6ehxQZj/MtZKVUKJJ7xzJ7aZ8E+knZVNirxd0ytFPbWzLP4bBa9/EPSwbnOzmzanszL9jdSAkyGq5l0dWONthfGI+vdrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vTSlG9YLQJS3ahS2yfwWDs9EEZWfejyJzD/lOSUjVI=;
 b=pv5k0t2J29NGp3S8nDT7cYAaeqXMp0LwApnrPW/WQ9wLg4UUD4XKK6bBtOJrtmCg30REGXWynw7NXQii1GKqFvF4DGPf9xeAIcCE+/xs6L2JP7voSVKXj4kTBriPfimqwmChIfpZaxA6xzIa84cvWXdI/krP8B/mov1lb0sXSfW6YVvvQtQIEetYmUNeiadHg4UA5ZbXF+kOzuXsxKEhPKVxmq34l7JNJmeBZ2pWzKYDrEf/b4Gcx6SQESIESMfVaZSUJei9KM6r/OFOsMxoie8ZutkqP3ivZvWP3O1WYOf68MSbxDQjipmZzBmwVPQivgFLY5TRO7zZ/1EOxC65XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS1SPRMB0005.namprd12.prod.outlook.com (2603:10b6:8:1e3::12) by
 IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Thu, 4 Sep 2025 06:57:26 +0000
Received: from DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f]) by DS1SPRMB0005.namprd12.prod.outlook.com
 ([fe80::7629:20ac:4306:5f4f%5]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 06:57:26 +0000
Date: Thu, 4 Sep 2025 16:57:17 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
Message-ID: <6vewssmsixzbghivrehmng7pyapmidh6nx5qjd2bzfr2orgeob@p2cni6gj75l3>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250827082015.959430-6-apopple@nvidia.com>
 <DCJQ1JPNP66D.237HVGM4L0UPZ@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCJQ1JPNP66D.237HVGM4L0UPZ@nvidia.com>
X-ClientProxiedBy: MEVP282CA0073.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:202::13) To DS1SPRMB0005.namprd12.prod.outlook.com
 (2603:10b6:8:1e3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1SPRMB0005:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e7c241-17e5-4fff-220d-08ddeb804e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xLPS5Ue8oUuT+rY9mimWU7C52dYThfURUHS40J/TkGEbrWscCYzVMS3dVShP?=
 =?us-ascii?Q?oNhcGtZ+EPf8Yig9TIrObZhpK5XT2apvXlY7vu/l/pcbZaE0fWhBSsXalAVi?=
 =?us-ascii?Q?R7rVWx5ZYm8A5oU0cOh4s9JwPjPcOtLe+jPmqVb/UJRA28PwDigsV8gz3Gxh?=
 =?us-ascii?Q?AMtnfPW3agtR5MrFSK7byggtWuQPxJ5t2SsjMbrSMkOuWneUqPYgkxVl4z3m?=
 =?us-ascii?Q?lf3Uxnq5vWx1udfqiICQs0XoKmTPg8c5eJ2Ksb0g6OkDjDYmVqp9s6Pnof9q?=
 =?us-ascii?Q?miCIKqaovQzLwKif4E4vonbNbXz3Af0LcbQ/fwC+CMK3oTG3AfGGdWw1Chjl?=
 =?us-ascii?Q?9mgBRKMH3GPLq9EZ369T8JLouBmvliYel3Gczn2Ef64qjIhogIaY2wrdcXJ3?=
 =?us-ascii?Q?taFkaZzC3wJGkhdAh3zmNuhoBIl8Tnzu2Eqym7W3BQke1LSgrK2E98/Uuusv?=
 =?us-ascii?Q?umUP/5YiCM2U7pKb1zTgHWh7r2lSyo5p9nAZp40AN823YNqnqlqnTI4uPj+Q?=
 =?us-ascii?Q?MuEnw1syZmY84u2nh71dyFDkadXavureOw3qN5wLBmlM8SoWg3nLi6mvP2Sc?=
 =?us-ascii?Q?i9AITdQfzufUnt8VmgqETNXPev6FOMTZmh8czF9xM1d9I3Wm7KUuQ9WWMPS6?=
 =?us-ascii?Q?IylmgVZaQSoH2VnJM6qlPHNkvC+WxWqsmTlCY8XJrj2Y7YmtXYRTGQe1W40k?=
 =?us-ascii?Q?6Ucc5AEnD/ozN1Ag4JdWpkGvG1nHQVcm3RNrXIHUrTZhcC/q8I2GKjBT7ejp?=
 =?us-ascii?Q?QCeOhqIz+iVdo3fzo9aCxHXQO7SgV6sFjdTwJHGSEeMszj/d06coUUsIJ73T?=
 =?us-ascii?Q?gKWII4f7ryD8O16+izGdUlf63j19IAOxl0XluPEvaTcq0DxCHIga9RI892Gi?=
 =?us-ascii?Q?gdo0V58VgMCWfIiQThoehO4gGfEN9fDHBMji/qMjICCiknpLYZfnWRgUFWQD?=
 =?us-ascii?Q?dfJYaL1yDVbXff5TszScM6jSPowyUgpa7eVZgNQ5WlJiDFvD/MXkbxk+7CK/?=
 =?us-ascii?Q?33On8HYfRx9B5x2SecynDsvywFrRlQnybE3L8zJ35u9wknbhIkp66OilBKJb?=
 =?us-ascii?Q?S10vwaxzkSTEKtGD+RZVXTsCpq2xxQvjb/cqoDJYh63DtRK4Yw6aERgYErvO?=
 =?us-ascii?Q?uTmYU2Q9yXvr5iNKT3bFGHvTz64Nh8PsX7dX2smjZ2DEgzRPOjn8ULr1eLhN?=
 =?us-ascii?Q?f7QQT+Um+GNFUTZVGGs/7CvjIKwQu0ksQ90TkZ+BvB+bCHXR0uWCNxmigHfK?=
 =?us-ascii?Q?bObx0NHAdW0MOyykrCRARB5ogIwWhXorm0ggcYvqx8XXbkVXDLJA1n3ikiwA?=
 =?us-ascii?Q?SINh30EERacQwKPtQNRYZzksSTBDlBXCiUa2qfOWB155xcjSCa+bYxXJQiUI?=
 =?us-ascii?Q?wwmomJ8aoe0Fx02lC632EnLfc9HzBs207NGl+dPRy1bIz+Hin0wPaj+nAwEo?=
 =?us-ascii?Q?MFy/qsKSBls=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS1SPRMB0005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iMxPOZlSCLQzjvr2za967m1huZVVDz/LtN56N1AT5NOJEd9qFODKRnwhAc/J?=
 =?us-ascii?Q?E7wW91VBdIkmufQq1l/c5bga5q9haCeFBux+qUf9JTbZYc53NOIxMmWNqJOW?=
 =?us-ascii?Q?LrJyp14/iWjecT90Gpohbx5UTozoMnR6G/xLaFPaQ6ARmGFtVGP03FpR6ct0?=
 =?us-ascii?Q?c62gPrYUeu/SISnrql/wOp6wplSxLSzN+nnsYj20LxddLSDyH6l7TvBUP0Jl?=
 =?us-ascii?Q?jrF+uxzTRXZAcXCLh1V25TlpVJuCiRyLLCUD81HF0fWhjSnsyN3lHUgEOo0C?=
 =?us-ascii?Q?lF381T/XGFoungrMInpMCsiYbcln/q77+wg31u0ZCf6KNGqhwpmhq4lOtJdb?=
 =?us-ascii?Q?bQ1lETwF6IQ/ECqbOpXqBMqw0+d2zI2X6a6dJ3Ivi6KZnHGnS/xFHbtirn0I?=
 =?us-ascii?Q?LLf0kG4+j/HLxi2wtvzb+ROavUMgX3mXpJ97AN3U78TaVafKFiT0vFS5OLLR?=
 =?us-ascii?Q?uYZ2zGY0hHpGtctEBklcaSpguqC1c8Gw+lVfmJv5XscYD4rlAkPiavFwMWNA?=
 =?us-ascii?Q?yraVS/lSPEtxKtVkAMMlfeWN8Zc+TR9N0wXrpwzaMl1nbJrqtX8yBdzM8N3Z?=
 =?us-ascii?Q?bLgf3hQSaS2i6cYgoWlzjrdh/iZPfyWAmSME/S14vSQ21vr0+2Kq9Dwq9ZIy?=
 =?us-ascii?Q?1fIkWeNcnOCmT+bWx/ydZJLfUi6fwgUw4KhLWjQp1L4sIvqXo58Y4Pc3DTgY?=
 =?us-ascii?Q?N664A+E2K7TIzEDiXJVb4BmNz8cRFyxX7MLqZ8u4+b/HXBZfGZJ9QVhyluiO?=
 =?us-ascii?Q?iBUHxg5gM+KOf22REqXxX+CpQnjXkc55/+zCLTKrHTQZxCkos2kYHi4UOhl5?=
 =?us-ascii?Q?Hsw6ImuLEBRgJpp6lwIKvZ2k1QAAQuhJmYtg4954j6ltFP30qCMPJoOy2Xim?=
 =?us-ascii?Q?BP65n1RKudIn4xRwWCuRPimDtChp+bvaWTrjVSSkeOxiX8menajmFyHUDlrL?=
 =?us-ascii?Q?v0W9NBFA9wu7I2j7F7oL3mHIPbQJ5WH7UEq4zQFK9H7PrHTysWhTZwS8KxMk?=
 =?us-ascii?Q?OcDUg+GGnfU+4Eh3cSiBHDbTucSfan2RXs7uAg/6+i3/HUcp9UyvzwhWwsxv?=
 =?us-ascii?Q?gP1RAmxDufLRhV+/gIbsvut4/JXxH/5glYIE+l7Nn/m/ZvpXc0wgJW3Hn7L9?=
 =?us-ascii?Q?YPHeKOvInnPdL+uYJO+KxTsVCjUWQ5rRPktazDMlcA43S+iKsF6LtKdoekI9?=
 =?us-ascii?Q?M3/VznHvcuIexZn4EJFxQLoSZUf8283jfmDrWfZ98u8sPN8dYfhoZozLid7p?=
 =?us-ascii?Q?Bzcq0aRIgCq4+3qg2gXFnbTbVV8LjxrXzh/T570lTyATbdGX9WuKFWj1FP3X?=
 =?us-ascii?Q?OhSA5cm3kUEMp2CZWtHduxvxJID+Zo3GB5zaNtRpWd9s4OOmzsNBrKVZbl7N?=
 =?us-ascii?Q?kj2LamrJPLy3aKCWSFTeGaDKAZ6llp+F8YRPPpTIEvauZ+zGTR58nrNvSGlA?=
 =?us-ascii?Q?nIJlMlnz0UcSY2Pkwp/WzIn0JXWD/Ck9d4ooeBYKrNHu1Qh9J0QUt5IyHeyr?=
 =?us-ascii?Q?jWquRd9w5nwpgN2hcTgsrFnmpcWySVbk4xabAsZhPMzuu9AZMZAUntU4qgWP?=
 =?us-ascii?Q?6g1tcQG7ersKmAghWv7o2jAPKafYYkqQHDXx6rOq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e7c241-17e5-4fff-220d-08ddeb804e29
X-MS-Exchange-CrossTenant-AuthSource: DS1SPRMB0005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:57:26.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbswujGvj0wuyAZG34Ugidc6oeA1ZcSgP1p4azM/+wuTRyvhm0mdTx2XJmLyhmD5mDlkrxF9smXdGK/hsDACKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
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

On 2025-09-04 at 14:12 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> Hi Alistair,
> 
> Making a pass about the bindings only - I will check the command-queue
> logic in another one.
> 
> On Wed Aug 27, 2025 at 5:20 PM JST, Alistair Popple wrote:
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
> > ---
> >  drivers/gpu/nova-core/gsp.rs                  |  20 +-
> >  drivers/gpu/nova-core/gsp/cmdq.rs             | 695 ++++++++++++++++++
> >  drivers/gpu/nova-core/nvfw.rs                 |  31 +
> >  .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 268 +++++++
> >  drivers/gpu/nova-core/regs.rs                 |   4 +
> >  5 files changed, 1012 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
> >
> > diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> > index 1f51e354b9569..41a88087d9baa 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  
> > +use kernel::alloc::flags::GFP_KERNEL;
> >  use kernel::bindings;
> >  use kernel::device;
> >  use kernel::dma::CoherentAllocation;
> > @@ -12,6 +13,7 @@
> >  
> >  use crate::fb::FbLayout;
> >  use crate::firmware::Firmware;
> > +use crate::gsp::cmdq::GspCmdq;
> >  use crate::nvfw::{
> >      GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
> >      LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
> > @@ -19,6 +21,8 @@
> >      GSP_FW_WPR_META_REVISION,
> >  };
> >  
> > +pub(crate) mod cmdq;
> > +
> >  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> >  pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
> >  pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
> > @@ -44,6 +48,7 @@ pub(crate) struct GspMemObjects {
> >      pub logintr: CoherentAllocation<u8>,
> >      pub logrm: CoherentAllocation<u8>,
> >      pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
> > +    pub cmdq: GspCmdq,
> >  }
> >  
> >  pub(crate) fn build_wpr_meta(
> > @@ -107,7 +112,7 @@ fn id8(name: &str) -> u64 {
> >  }
> >  
> >  /// Creates a self-mapping page table for `obj` at its beginning.
> > -fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
> > +fn create_pte_array<T: AsBytes + FromBytes>(obj: &mut CoherentAllocation<T>, skip: usize) {
> 
> I'd move this extra argument to the patch that introduced this function,
> that way we don't need to update the existing callers in this patch.

Yep, sounds good.

> >      let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
> >      let handle = obj.dma_handle();
> >  
> > @@ -119,7 +124,7 @@ fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
> >      //  - The allocation size is at least as long as 8 * num_pages as
> >      //    GSP_PAGE_SIZE is larger than 8 bytes.
> >      let ptes = unsafe {
> > -        let ptr = obj.start_ptr_mut().cast::<u64>().add(1);
> > +        let ptr = obj.start_ptr_mut().cast::<u64>().add(skip);
> >          core::slice::from_raw_parts_mut(ptr, num_pages)
> >      };
> >  
> > @@ -166,20 +171,23 @@ pub(crate) fn new(
> >              GFP_KERNEL | __GFP_ZERO,
> >          )?;
> >          let mut loginit = create_coherent_dma_object::<u8>(dev, "LOGINIT", 0x10000, &mut libos, 0)?;
> > -        create_pte_array(&mut loginit);
> > +        create_pte_array(&mut loginit, 1);
> >          let mut logintr = create_coherent_dma_object::<u8>(dev, "LOGINTR", 0x10000, &mut libos, 1)?;
> > -        create_pte_array(&mut logintr);
> > +        create_pte_array(&mut logintr, 1);
> >          let mut logrm = create_coherent_dma_object::<u8>(dev, "LOGRM", 0x10000, &mut libos, 2)?;
> > -        create_pte_array(&mut logrm);
> > -
> > +        create_pte_array(&mut logrm, 1);
> >          let wpr_meta = build_wpr_meta(dev, fw, fb_layout)?;
> >  
> > +        // Creates its own PTE array
> > +        let cmdq = GspCmdq::new(dev)?;
> > +
> >          Ok(GspMemObjects {
> >              libos,
> >              loginit,
> >              logintr,
> >              logrm,
> >              wpr_meta,
> > +            cmdq,
> >          })
> >      }
> >  
> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> > new file mode 100644
> > index 0000000000000..3f5d31c8e68f2
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> > @@ -0,0 +1,695 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +use core::mem::offset_of;
> > +use core::ptr;
> > +use core::sync::atomic::{fence, Ordering};
> > +
> > +use kernel::alloc::flags::GFP_KERNEL;
> > +use kernel::device;
> > +use kernel::dma::CoherentAllocation;
> > +use kernel::prelude::*;
> > +use kernel::sync::aref::ARef;
> > +use kernel::time::Delta;
> > +use kernel::transmute::{AsBytes, FromBytes};
> > +use kernel::{dma_read, dma_write};
> > +
> > +use crate::driver::Bar0;
> > +use crate::gsp::create_pte_array;
> > +use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
> > +use crate::nvfw::{
> > +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
> > +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
> > +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED, NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> > +    NV_VGPU_MSG_EVENT_POST_EVENT, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> > +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA, NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> > +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT, NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA, NV_VGPU_MSG_FUNCTION_FREE,
> > +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> > +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> > +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_LOG,
> > +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY, NV_VGPU_MSG_FUNCTION_NOP,
> > +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> 
> We will want to declare these as a set of enums. :) It will make the
> import easier (only one type to import), and we can benefit from the
> goodies that come with having a dedicated type (more on that below).

Yes, previously these were all just imported but an enum would make sense.

> > +};
> > +use crate::regs::NV_PGSP_QUEUE_HEAD;
> > +use crate::sbuffer::SBuffer;
> > +use crate::util::wait_on;
> > +
> > +const GSP_COMMAND_TIMEOUT: i64 = 5;
> > +
> > +pub(crate) trait GspCommandToGsp: Sized {
> > +    const FUNCTION: u32;
> 
> This then could become the right enum type, constraining the values it
> can take.

Makes sense.

> Let's also add short doccomments for this new trait.
> 
> > +}
> > +
> > +pub(crate) trait GspMessageFromGsp: Sized {
> > +    const FUNCTION: u32;
> 
> Same here.
> 
> > +}
> > +
> > +// This next section contains constants and structures hand-coded from the GSP
> > +// headers We could replace these with bindgen versions, but that's a bit of a
> > +// pain because they basically end up pulling in the world (ie. definitions for
> > +// every rpc method). So for now the hand-coded ones are fine. They are just
> > +// structs so we can easily move to bindgen generated ones if/when we want to.
> > +
> > +// A GSP RPC header
> > +#[repr(C)]
> > +#[derive(Debug, Clone)]
> > +struct GspRpcHeader {
> > +    header_version: u32,
> > +    signature: u32,
> > +    length: u32,
> > +    function: u32,
> > +    rpc_result: u32,
> > +    rpc_result_private: u32,
> > +    sequence: u32,
> > +    cpu_rm_gfid: u32,
> > +}
> 
> This is the equivalent of `rpc_message_header_v03_00` in OpenRM. The
> fact it is versioned makes me a bit nervous. :) If the layout change
> somehow, we are in for a fun night of debugging. This is where having an
> opaque abstraction built on top of a bindgen-generated type would be
> handy: if the layout changes in an incompatible way, when the
> abstraction would break at compile-time.

Argh! I guess I wrote that before we were generating the headers and I never
thought to go back and change that. Will fix these to use the generated binding.

I will sync up with you offline but I'm not really understanding the point here.
If a bindgen generated type changes in some incompatible way wouldn't we already
get a compile-time error? And if the bindgen generated type changes, what's to
say the rest of the logic hasn't also changed?

Whilst I'm not totally opposed to something like this it just seems premature
- the ABI is supposed to be stabalising and in practice none of the structures
we care about appear to have changed in the 3 years since 525.53 was released.
So IHMO it would be better to just deal with these changes if (not when) they
happen rather than try and create an abstraction now, especially as this is only
supposed to become more stable.

> I've experimented a bit and we can generate this type while avoiding
> pulling the world if we just define `rpc_generic_union` to e.g. `u8`.
> I'll share how I did this with you.
> 
> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> > +//         that is not a problem because they are not used outside the kernel.
> 
> Doesn't it? I don't see any implicit padding in this struct, it is just
> a series of u32s.

These safety comments are all wrong and need updating. I switched to using
explicit padding (not that it's required here) to ensure we did meet the
requirements for AsBytes. Will update for the next version.

> > +unsafe impl AsBytes for GspRpcHeader {}
> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
> > +//         that is not a problem because they are not used outside the kernel.
> > +unsafe impl FromBytes for GspRpcHeader {}
> > +
> > +// A GSP message element header
> > +#[repr(C)]
> > +#[derive(Debug, Clone)]
> > +struct GspMsgHeader {
> > +    auth_tag_buffer: [u8; 16],
> > +    aad_buffer: [u8; 16],
> > +    checksum: u32,
> > +    sequence: u32,
> > +    elem_count: u32,
> > +    pad: u32,
> > +}
> 
> This one is `GSP_MSG_QUEUE_ELEMENT` in OpenRM - it has a macro and might
> be a bit trickier to export, but if we can I think we want to do it
> the same reasons as `GspRpcHeader`.
> 
> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> > +//         that is not a problem because they are not used outside the kernel.
> > +unsafe impl AsBytes for GspMsgHeader {}

These also need fixing up.

> > +// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
> > +//         that is not a problem because they are not used outside the kernel.
> > +unsafe impl FromBytes for GspMsgHeader {}
> > +
> > +// These next two structs come from msgq_priv.h. Hopefully the will never
> > +// need updating once the ABI is stabalised.
> > +#[repr(C)]
> > +#[derive(Debug)]
> > +struct MsgqTxHeader {
> > +    version: u32,    // queue version
> > +    size: u32,       // bytes, page aligned
> > +    msg_size: u32,   // entry size, bytes, must be power-of-2, 16 is minimum
> > +    msg_count: u32,  // number of entries in queue
> > +    write_ptr: u32,  // message id of next slot
> > +    flags: u32,      // if set it means "i want to swap RX"
> > +    rx_hdr_off: u32, // Offset of msgqRxHeader from start of backing store
> > +    entry_off: u32,  // Offset of entries from start of backing store
> > +}
> 
> This is OpenRM's `msgqTxHeader`. It's declaration doesn't look too
> funny, and the only useful member on the driver side (outside of
> construction) is `write_ptr`, so it wraps pretty well into an opaque
> type that only exposes a couple of methods to read and set `write_ptr`.

Huh. I guess these snuck in for the same reason as the previous ones. Clearly I
didn't properly review why I was defining these by hand.

> 
> Doing so is valuable for clarity as well as future compatibility, as it
> clearly shows in a single page of code how the header is used. Here is
> all the code operating on it, in a single block instead of being spread
> through this file:
> 
> 	impl MsgqTxHeader {
> 			pub(crate) fn new(msgq_size: u32, msg_count: u32, rx_hdr_offset: u32) -> Self {
> 					Self(bindings::msgqTxHeader {
> 							version: 0,
> 							size: msgq_size,
> 							msgSize: GSP_PAGE_SIZE as u32,
> 							msgCount: msg_count as u32,
> 							writePtr: 0,
> 							flags: 1,
> 							rxHdrOff: rx_hdr_offset,
> 							entryOff: GSP_PAGE_SIZE as u32,
> 					})
> 			}
> 
> 			pub(crate) fn write_ptr(&self) -> u32 {
> 					let ptr = (&self.0.writePtr) as *const u32;
> 
> 					unsafe { ptr.read_volatile() }
> 			}
> 
> 			pub(crate) fn set_write_ptr(&mut self, val: u32) {
> 					let ptr = (&mut self.0.writePtr) as *mut u32;
> 
> 					unsafe { ptr.write_volatile(val) }
> 			}
> 	}

Yes, this makes a lot of sense although I'm still not seeing the value of the
[repr(transparent)] representation. Hopefully you can explain during out sync
up ;)

> > +
> > +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> > +//         that is not a problem because they are not used outside the kernel.
> > +unsafe impl AsBytes for MsgqTxHeader {}

Also needs fixing.

> > +#[repr(C)]
> > +#[derive(Debug)]
> > +struct MsgqRxHeader {
> > +    read_ptr: u32, // message id of last message read
> > +}
> 
> This is is even simpler than `MsgqTxHeader`, and can be abstracted
> equally well.
> 
> > +
> > +/// Number of GSP pages making the Msgq.
> > +const MSGQ_NUM_PAGES: usize = 0x3f;
> > +
> > +#[repr(C, align(0x1000))]
> > +#[derive(Debug)]
> > +struct MsgqData {
> > +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES],
> > +}
> > +
> > +// Annoyingly there is no real equivalent of #define so we're forced to use a
> > +// literal to specify the alignment above. So check that against the actual GSP
> > +// page size here.
> > +static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
> > +
> > +// There is no struct defined for this in the open-gpu-kernel-source headers.
> > +// Instead it is defined by code in GspMsgQueuesInit().
> > +#[repr(C)]
> > +#[derive(Debug)]
> > +struct Msgq {
> > +    tx: MsgqTxHeader,
> > +    rx: MsgqRxHeader,
> > +    msgq: MsgqData,
> > +}
> > +
> > +#[repr(C)]
> > +#[derive(Debug)]
> > +struct GspMem {
> > +    ptes: [u8; GSP_PAGE_SIZE],
> > +    cpuq: Msgq,
> > +    gspq: Msgq,
> > +}
> 
> ... and here is probably where we want to draw the line with generated
> bindings. I suspect there are definitions for these types in OpenRM, but
> if we generate bindings for them we won't be able to take advantage of
> the abstractions we defined before, since bindgen won't know about them.

Actually I'm pretty sure this was just hardcoded in OpenRM, but agree it's
unlikely to change.

> They also seem very unlikely to change, and we can probably negotiate a
> stability guarantee for them.
> 
> <snip>
> > +fn decode_gsp_function(function: u32) -> &'static str {
> > +    match function {
> > +        // Common function codes
> > +        NV_VGPU_MSG_FUNCTION_NOP => "NOP",
> > +        NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => "SET_GUEST_SYSTEM_INFO",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => "ALLOC_ROOT",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => "ALLOC_DEVICE",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => "ALLOC_MEMORY",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => "ALLOC_CTX_DMA",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => "ALLOC_CHANNEL_DMA",
> > +        NV_VGPU_MSG_FUNCTION_MAP_MEMORY => "MAP_MEMORY",
> > +        NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => "BIND_CTX_DMA",
> > +        NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => "ALLOC_OBJECT",
> > +        NV_VGPU_MSG_FUNCTION_FREE => "FREE",
> > +        NV_VGPU_MSG_FUNCTION_LOG => "LOG",
> > +        NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => "GET_GSP_STATIC_INFO",
> > +        NV_VGPU_MSG_FUNCTION_SET_REGISTRY => "SET_REGISTRY",
> > +        NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => "GSP_SET_SYSTEM_INFO",
> > +        NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => "GSP_INIT_POST_OBJGPU",
> > +        NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => "GSP_RM_CONTROL",
> > +        NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => "GET_STATIC_INFO",
> > +
> > +        // Event codes
> > +        NV_VGPU_MSG_EVENT_GSP_INIT_DONE => "INIT_DONE",
> > +        NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => "RUN_CPU_SEQUENCER",
> > +        NV_VGPU_MSG_EVENT_POST_EVENT => "POST_EVENT",
> > +        NV_VGPU_MSG_EVENT_RC_TRIGGERED => "RC_TRIGGERED",
> > +        NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => "MMU_FAULT_QUEUED",
> > +        NV_VGPU_MSG_EVENT_OS_ERROR_LOG => "OS_ERROR_LOG",
> > +        NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => "NOCAT",
> > +        NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => "LOCKDOWN_NOTICE",
> > +        NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => "LIBOS_PRINT",
> > +
> > +        // Default for unknown codes
> > +        _ => "UNKNOWN",
> > +    }
> > +}
> 
> This can probably be implemented as a `as_str` method for the enum types
> discussed above.

Sounds good.
