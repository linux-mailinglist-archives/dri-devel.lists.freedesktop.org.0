Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2ADBAF290
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1837210E305;
	Wed,  1 Oct 2025 05:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rd8DgxMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013039.outbound.protection.outlook.com
 [40.93.196.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98D10E305;
 Wed,  1 Oct 2025 05:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGetsMlozuuUDhdAHdAcdRhqbKEzpb3YSN3SDeKyu2/Z6racOUJt9qBs3DNZERS2NwEosqqBZTHfSYKyXCT3jE9a8DPGDcZNIzkI6OpD9O4Sbq3GxkYCFHKK0l67mqd8nfNQW4HyKXqzYub4h6dHM1hnTpbXG5IYM2CbmsO+dkxMBzriis5ULPnLJoMbq+7KXjPcYsVPVlTeyxmqCBr14QXiqEm6xaagilnsCj2VJ2b3Ta1rWsA9qNUyEvL7zSRexDnL5J+o8rHU9RgxXD4h5Quo9eGgH97mMRB048+/rtxdzAU6Oxt+s7lTXnfVIHTURI9YDWQUiwnyt7pGJZfTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5tqe33OnkQDXfYejllPg35VfGVR1SrmkH8+NJIgTaw=;
 b=HfYweWa+XRZlUSHyGs6JIwhyUBu4u8i6zp8hea5pBMTztVRADzJMjUcNPYsRtIP2fiI54Hl6hBYJQPXVHycEv17/wlJpMtjntT+yTSYuKQfeDI1AFKozx/L+7WPBPFNnZQCpzuG9fNbttseexBaIxdQXKAhZum0heVcLU5UC5Iyc7uzfPqqroPiBvl2z3ElAcL00CkulEKG+H6H1rWDKNhhIQav1lnn8IqzNNk03QMF5gWHxVIw9HC+k5vEA93JDSP7X7KPTTIoWGhPzubA2tv+L9LbM60+E7Qq463HFAL+oE3P+GcKgIS8wlmGJntNtskcS39NXIU8biQyah5S7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5tqe33OnkQDXfYejllPg35VfGVR1SrmkH8+NJIgTaw=;
 b=Rd8DgxMMNhfjRhK79BSuf0nJAAAWjzRzIEKsgMVW09X+N5z4Qn+rACC0imSEmSKucyCOfOaJ6DOS2TR+J8jWiJlbu9F5VlS+xtXvrAIVrutpFyDxvVCZMVLXb85q7vjmyzzARXNuB9nfBobVOx3yN90Wombz0/JtvZIBPk4xZ/u0t4Pzytl5lIKFEkBwRXmvkuSbIrx4rd7XzUqvWQwT5dKm3lTW/o+mJVczrWhN5bggqp6lGaQ0gu+UZ2CxUbxmWNBrm2cNB28jPJ5yieHkvXbwgtMCBeENkBTMn6AnZp7zdegwhGUqRx6azdfIm8J7obebMdvBdlR8pEUVunG4Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 05:54:28 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 05:54:28 +0000
Date: Wed, 1 Oct 2025 15:54:23 +1000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 00/13] gpu: nova-core: Boot GSP to RISC-V active
Message-ID: <ymocqvbgqyf54fsmeorol5thd5kuglg2mf4fdue4mp72cms5tp@a7clilzgcnnd>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <f285b6e1-775e-47da-bcd9-b9ad7e218a98@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f285b6e1-775e-47da-bcd9-b9ad7e218a98@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0107.ausprd01.prod.outlook.com
 (2603:10c6:10:111::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: ab83f0c1-6d81-4ebe-edf5-08de00aefba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d5LtOo9t9skV/0u72M4FP7yQLcRW2bdYn84UlGxk482KV7ujHReFDuiIDIgk?=
 =?us-ascii?Q?wQYpp9rJTAt1pnvwUfpezHNXkRW+DDV+Ypc7+iVBcyWF4rfuoLmzjJuoh7MN?=
 =?us-ascii?Q?tUToMJGpfv7/ZamIICbBGSARJhMwSl2eK9ToYddkNr+qbPHTXX0aVGbtF2rl?=
 =?us-ascii?Q?6ZzYddIz8b6aBtjpE9iigsj811s1/mN6dggPBIwrIZLadQUWIiwLgRXMYAKg?=
 =?us-ascii?Q?hNBuWL8Fp9A1xKUMugVKnCZL3lnXYt0+zK8o2e1jXN5D+BT0jJVnJMqHAKEq?=
 =?us-ascii?Q?sMaW3C++XzNriSX0ETGIZGXWmEw+TLLbeQVQLVyxq77plmgpP5dbbj7QmpiR?=
 =?us-ascii?Q?+U0CTW0tcVsO6IKFvpUHTBj91uvcLaL2zxOPaKUuS9MreWMXCz37CT8nNfyx?=
 =?us-ascii?Q?+uaNiYA+gBkag+aAfDIC0s4XFcZBRzRTFZNMxFRahdjgmAgwoeytoM+/45Yn?=
 =?us-ascii?Q?BQD9THWnjS97JCo/CNUZBbv6Qyvf6+O8OYMIdtH7UxImLd1Jcj/rp6LMIe6u?=
 =?us-ascii?Q?WCtDhvIFf6hWNkZAzUY1JBlocOKZdBfIEQQFZCZuZ3ZJsY/c03P9r5CGNbbs?=
 =?us-ascii?Q?sQoNpEu5zsWU/6zesFMVOa2V8hcCcVGEYg2ifjUFdus2rFZd/olUyzlckq0d?=
 =?us-ascii?Q?QoDlJ3IXrD2/9RpAGQHSxy29AstZwuDP7iH5jSZb0PLS/1Pi19TKOG4a/8zI?=
 =?us-ascii?Q?g+QoA+CI3yfjuRMbjPg7miRvYtu0JdroR5+Mv4S3qREhbQ5/QSUkdxcAW+oN?=
 =?us-ascii?Q?cW2ViiWpzwADvu/aJfCqYhYpoJzXN23TexjLFHMSrnSmak+od9vBriIPLyEr?=
 =?us-ascii?Q?TW51MgurourBbI63ip1QpQMNq+lJ1lq6Pgh/MZDjGsqT25mXDBwddW8QNh3J?=
 =?us-ascii?Q?g/5uJaZTbSD8rRM2Lf7Gc8OfdBJIpXWL+ut6D1RDQp2NSqLLqzcmsDIKIZcw?=
 =?us-ascii?Q?I/t3er43wvIVR4owQofA3tXHaBd+lR7Emc5nFOJiWlAM+Jq9OeH9u/tsZW3H?=
 =?us-ascii?Q?KvBuHpzCzEp0JJSybP1BYafxpDJfaBISj5fOWcqmvSTpqn29KWX+oOzwcAke?=
 =?us-ascii?Q?/OGd0PbzdNYyF+Tb+Hpg3kj0QgUIqqwE4lzt3dwImLm6U+VWIKzBGFz/Wf0p?=
 =?us-ascii?Q?oPYox40EIqJime1TH3IvhpCwiMSYylcGb1iCDVckU+OzE/Blk5ktc+EgO3JI?=
 =?us-ascii?Q?TI4DRBZ657iQ/C01twMHcuEHCd+bppPoIe8fvW0zC/hINYmU64vF42fFn71q?=
 =?us-ascii?Q?AbMb8vFvS/A+OK4D7zq6JO9S1BcuKe32zOp7iFevdHAfpFJHQyM8myRIrFUu?=
 =?us-ascii?Q?vjHwbKNXnHnEASYpco6abHG8UNb6weZwDuVhmPUXdRApQiu4jxjh2o6RZa52?=
 =?us-ascii?Q?2ojJt8yZqFbKBtbTRSh1JCF9lBENH1962mtEckZ1ffxMXygkNxAc77XpOpRk?=
 =?us-ascii?Q?PEIunXOJi8EPp8X2d/VR9AjJLdsjUqNkfbn+GB38MDY27X7ubLnomw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2cygizmDVrLUId20MWliFnc6RykPv+FMqdd7GcmUGtAcfwkSxNAyvAAlIx5h?=
 =?us-ascii?Q?USkbmEZE91vAlFoID7hEdumkaUTaV3qiocwMrpNAWJHzoLjC6Lhof12xRjvJ?=
 =?us-ascii?Q?ZGZDGGNrt/m6eKyznSvbBinzXNryvyDcwswUSHv5bsqtD+tqcBOYFmSGc/jo?=
 =?us-ascii?Q?FqENlkK4A3Wo0ZrASjRw/YIuRQCV9yWcmA81viFEdzwfa9G06wUewoY647DE?=
 =?us-ascii?Q?qlPaXdvHL9OFLFcPjL/9iEgd1KnH8d6uzUXrbJ5Cvfa/9B0tY4VH/ugvLdlV?=
 =?us-ascii?Q?f0MCPgqb4lEpJSZQscBL/EeVByR2tITwq2m9Es1WItrlmEfslizo9HsVQSGg?=
 =?us-ascii?Q?nMZXQE6j59Vo624wOCNHeOC44beyone9IOgSNxR+mhBtS8IJ9auM/0QbHGlP?=
 =?us-ascii?Q?2MM27OOpB422EEVR8w0mUjnXUlU2NvJoQFwEDDLhyYL9rmZTSu782RxgVQD0?=
 =?us-ascii?Q?eJXkM+soNG7c+Mw+nwUDiITqmYOOSAi/bso1dOh4cpzqDgTKhbXl1E2VHYTT?=
 =?us-ascii?Q?YvpDahMFRQRNfeBuLDgUGaaXuoXm9f0i7BwBpHhQP4RPqHi6F25dfOIrqzxf?=
 =?us-ascii?Q?A/Sc0VUC5IcpuAp9pHWc5rKLGbh0KKiYSze7MWet+Vclv2QXsqUGRDYBH0ju?=
 =?us-ascii?Q?6MGJxfDXSntgd++4ElkWyIL6DUuiwJS6L6I/H4TkBiMeEyx92/9KiVydgW6n?=
 =?us-ascii?Q?ce8lZAt4c/gaqJzlMD8+dfcLLf/h4IfM/qUJlZlehQO8Sio2M40smgQz1sYX?=
 =?us-ascii?Q?3R7jMN20aoiUt1vmCon/mvSD5miKeVFD4JgELYTwJ8QRYr1jWdxBH/qj78oh?=
 =?us-ascii?Q?qPLWEb73dsH5maN0X0a36vyAmW3jcE9JCHc5G1BITa7hZinZTi96U6uQCOSn?=
 =?us-ascii?Q?gFh5N8smgP/Sh83PQubG6b7+J0EKvMlW/xmhGOmxSJ/8Riy7+4Q4IweCv0ds?=
 =?us-ascii?Q?BQ4hKvtlwTEptYy7apeFz13eRW70csWrfh0fk2ibHOeRp63IO8IGOWWclNi3?=
 =?us-ascii?Q?PA2BCi0KXuZh0KNRY4xufFIcLNBXWEO2tHbsz9J2kF2xTHOr0jpRfNVYRoVe?=
 =?us-ascii?Q?vasx8ZBSZLMDPWZf527C8WMmTcYw22Z165SiZSwsZmrN5Fq7n17QesqaAsc8?=
 =?us-ascii?Q?pjdpps/vEFoBnPvOt4hUT4skhZ2xW1TOKSHVNzhRfFGUL991i2T9lJANCjbX?=
 =?us-ascii?Q?WRs2jApO5exz89Qqj/xBfnwixf8hnfaBIz4ICzz9yUbVkUqHjWQPRLq7L8X+?=
 =?us-ascii?Q?GrGQCMJ+UjbkYMavRFiDvH5EKkdx4gICfUcgc5UqtVh3iUos+y5M6Nani4u0?=
 =?us-ascii?Q?CyCiMZp11zWFh7fz4SuXSFfhTSMwUUnL9KMZPSrtCH8vwBb9gnhgFnDZ9Kjz?=
 =?us-ascii?Q?sQcFuXubA5H3JDGfZngxSwRK/vN3F+Q4+awVwtYBKlKK9GmqaPXt0hZrMZa6?=
 =?us-ascii?Q?RTeusKyXcn3jrtTYfYd2KeL+/ldrIFq2Cyb3fCKA1x58XlzkquSzBWEiEq6t?=
 =?us-ascii?Q?cFZ6YcY8sSPz9A7kSwWEy75zKPRKPI6CsuGEvSNXhBb6IHu45SWUfaTvaWsF?=
 =?us-ascii?Q?jovcx0+IQZsCje8xHAfNHXFgrYKf7VMp3eaFVOOJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83f0c1-6d81-4ebe-edf5-08de00aefba2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 05:54:28.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfO3TG4Q++2wY07Id0/MEb8Aso39aXHt52g5GwpJe6g1CF+IhEVC8vtmLUC03EGjYjwINP4x+cea67ZaNdJDoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

On 2025-10-01 at 12:02 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
> On 9/30/25 6:16 AM, Alistair Popple wrote:
> > Changes since v2:
> > 
> > The main change since v2 has been to make all firmware bindings
> > completely opaque. It has been made clear this is a pre-requisite for
> 
> Any hints about where to see this aspect would be welcome. 

The changes to fw.rs in patch 5 for example.

> ...
> 
> > A full tree including the prerequisites for this patch series is available
> > at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.
> > 
> > [1] - https://lore.kernel.org/rust-for-linux/20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com/
> > [2] - https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream-v2
> 
> Could you maybe push up a nova-core-for-upstream-v3 branch please?

Done.
 
> thanks,
> -- 
> John Hubbard
> 
