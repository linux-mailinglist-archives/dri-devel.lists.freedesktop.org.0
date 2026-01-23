Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEz3APRJc2mHuQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 11:14:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC874181
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 11:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E593D10EA9D;
	Fri, 23 Jan 2026 10:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4QIwRsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB7310EA9B;
 Fri, 23 Jan 2026 10:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIDjrYi3rUTdahj+eBTLUkdNwuqnhXvjJR5rtX9bn/5ywIltTq4VwsJ2XMqrFherAEf9tyF9JBvVZW0VtIlWT4c4spM8bSdjg7owM8/1Zkn7oxhI+Q4ZEtMEAbj1YnHMEEHdhAYbh556pW58NqlXrunTrv17UU5s3ctpjnqvHYfDgPopb0j0QnkvhU//T8AmZNC3Rk6Cw+dWCflEzBvvjiveuy5EZOaiMMAxxGjZThi/5f8eBmae3we1vd63Th4fskekb0eIZVlx9w0p8VXgRgP2yD8Re3pLuvU8cpNtKYvMCxDomGOqbVr3oQgVXzwIP9Gni2mO1Dwwz9/LZg63gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mReL2HqlLw6k9N55UDV8jQDAy80aTJhXhTqdfjp68Wk=;
 b=u3Iyau23IchgZO6rzajgc5eK4GP7O3erBsutGqoFbgaTTQ6Iuy48lqIjY822OTRSufPkpo11MVQVZyIc7sDqjc5zHiSnbB8q2+5x78yinipgCZg5A/m2ZhslBc8IXA2TkaMMWkmYbDzd3rSIJ76CbpZRt6G1fhZarBYbaDRZfK9IICxPrfCKtDwqcgMxxg9uIFW2hfkMlNAX6Ffl9qJKiLqzzZyXNJj8qmUwiE+cIN9Aa/K64QyHl0JXiFYmgCaupkSVgSlhW/FFWDMHJNaEzRmss2e4dDws3hLf9lxpoxK6HynYknL/nBRJC3LFnbYvpGPzw0N2QKTLpAgtz9WoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mReL2HqlLw6k9N55UDV8jQDAy80aTJhXhTqdfjp68Wk=;
 b=W4QIwRsXKJvFpri3OE5Ur3jy/oCgOFvgMTpTmzUkHMvIHqkR5g0hlqVKOFqcsxRCdW2SXqMgGHTndxj+pJdYY3MbkzqHbCgrCMuQy4Y3Ul5P6JFnDmXZ8TlMELm3OEtHtZXf0+g1y2rpAccndordHgBTJ2zZ6SHvjIAOjFFo/5WbBVuA9tKfFZtHd4OvhffPEXJmB8whfsKDLjqZeCTFunaG8O0FozOOQ3zf7BueQtKFqngdO9b6XNToHa1j+SAMcDN8B5+rgBAQ/HorG5rj+EV6bsXPpLOp+Cqe8j1vVECREqrZ4IB2HWnwmyz85z6EWoEDWPF+UHYN0kY39yX0dQ==
Received: from DM6PR06CA0047.namprd06.prod.outlook.com (2603:10b6:5:54::24) by
 DS4PR12MB999075.namprd12.prod.outlook.com (2603:10b6:8:2fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 10:14:04 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::e1) by DM6PR06CA0047.outlook.office365.com
 (2603:10b6:5:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:14:04 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 02:13:54 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 23 Jan 2026 02:13:53 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 02:13:44 -0800
Date: Fri, 23 Jan 2026 12:13:43 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>, Helge Deller
 <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>, Alexandre
 Courbot <acourbot@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, Alexey
 Ivanov <alexeyi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, Elle
 Rhumsaa <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Message-ID: <20260123121343.396bc4cd.zhiw@nvidia.com>
In-Reply-To: <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS4PR12MB999075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e977e9b-bb5f-4136-ef9d-08de5a6822ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8gUNWX/O8eHZBAUr3VJTeDyjNuSbOr+741G7nKhZJQDVJ7sdcQTJfAm70gqp?=
 =?us-ascii?Q?K6Lx2xUI/SWi6nckOXW5hkZZTXv4bHE6YiFZ1AluMO8BoEqVpfBhrr2rHF+j?=
 =?us-ascii?Q?vUR20aNwcmo/+rE+8QIHa0/80OM3vmVmBvPypYtA18XSub9eHMEX/kJxLfPT?=
 =?us-ascii?Q?qlB/Posk/IZ+KFAVgzbV5hhZSh/aOHvOBLrKzVlk8iaBr3FHCf9ajmB++p6x?=
 =?us-ascii?Q?ktRdsxPH3uI3SHgQsyD4mPZxILqQdnr+fQdiADfXxhXCnYIEX+SWiI+SacPM?=
 =?us-ascii?Q?6lE1hdNYParyUs7bQJZi6wGdelz5n06Fyk2Y6uouW0CR5aN7zyn4rHedwnd8?=
 =?us-ascii?Q?ErlTHLnxNjH8I3o4NLW1GqDgXn0i9L26tn6AxIkSY+5hVqjvlf/XcvdBaGst?=
 =?us-ascii?Q?xk8yTggDO4YWaq/Bl9grT5gXdSpVTARJfaBzi1GjJ1AZSVFWQaBV5SjnwrnF?=
 =?us-ascii?Q?EwmEMuxhD23C7dnnPpm+lNwmEmIqvpr46X4+4D3T8quRAFz8You8G0NzjjBk?=
 =?us-ascii?Q?bcEhX0WC7p2mqC4KZEA/Rplyt0g8LANjCbf8VUXlCn4/2mFXCibnLStRzdxB?=
 =?us-ascii?Q?bXhVpDhnU1GY8RVHRNJsIT957jl+/PW2+Sh8y50wdHfQtI1p6ABPjDrMMmhl?=
 =?us-ascii?Q?YajnsvULAiMCOTZlOxguQllgJN5jdzCysrgCUnVkYwmp9NbzeJDj2oZFa0ul?=
 =?us-ascii?Q?LQjUA0Jd3WzXEUjEC1OhJ2OHJhf+Br1QnipPsAZk0K8lDVDxB8Q378M8cXi0?=
 =?us-ascii?Q?gOK52UiOj76v3NPdlD7ZaiORHFwA2mumZa3UO5GKkWCXrF40KxSzZ1g/SFXt?=
 =?us-ascii?Q?cn+WwnEuJ/5HlVEuDrIonv+bNmOIh/f2bexUMmzUT2wGKGyzbtln4SN6/jcM?=
 =?us-ascii?Q?AvMZNWFpXeW6K3ND4ehGfpulI7iEnaz5f9XBk8BqM4uJ4LUNmINP0Aj/s8kH?=
 =?us-ascii?Q?MO+1ktsIcyvi107CxgqsUbzSKrPDiXEE665yowMRKj7rT6e56NfabeUFcgTC?=
 =?us-ascii?Q?6mSAWuQvhFzsSKgmgUwCF7e9FZc2F3o76YeWqpqOB5J9Qlqt30kK0MHKsCg+?=
 =?us-ascii?Q?NcOueIgVf8FqKUFhXgrbB+wJAgF8cUzxCzPeEafBQVnuEQPOU+jPRj9njESQ?=
 =?us-ascii?Q?UGuBpLQIxQYssC45tRVkIPdj0ayAvC2b7kI1QohAv09TQ92fMgIVfbruRcty?=
 =?us-ascii?Q?1TuWhpF+KVIhMb9DOyirHzz8ZQBuYgr8jDIbcTfl/h7MOBxh7/dHPQ64wbxa?=
 =?us-ascii?Q?0z3B2yGggDE/vRIbA3PABq//GL4RIJqe2AjEg19M5XLIGplk6t8ptpeVxaO2?=
 =?us-ascii?Q?1YKZt8xwYquzmrh4PMsYL7iMDEDbPCUUY/SdsVgf7iv7LsnRGaxq9mUyqe34?=
 =?us-ascii?Q?TRyIYWTHIB1phhYIGBrd9Y6kBajku1fD3h4u7TuKxe7DNphP8Jndvs8NPIIB?=
 =?us-ascii?Q?s3JNu/nqmMGcrvLs+70/XVXHA7Jpv874sqS/ZNdx+4ivQ/nIsKwgg7WNlP2g?=
 =?us-ascii?Q?wKxDqX01kMQq37FtebGNkWEtyUbRur5tL6DEredmGysfTyr9VBzE3zyRBTfv?=
 =?us-ascii?Q?4ltnESy4ZzsfIyGnBu3CUoo1xh2VPdnUffU8afZqXsdpbssLrE0C6ORvhqsW?=
 =?us-ascii?Q?HSdIU7yjGy6r1eGhJrUhT+s+mOqZRH/YYsRfXn/1nZ+TRFy1FZAQVtetMm3K?=
 =?us-ascii?Q?i/9/4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:14:04.1322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e977e9b-bb5f-4136-ef9d-08de5a6822ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999075
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A3CC874181
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 18:16:00 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> On Wed, 21 Jan 2026 12:52:10 -0500, Joel Fernandes wrote:
> > I think we can incrementally build on this series to add support for
> > the same, it is not something this series directly addresses since I
> > have spend majority of my time last several months making translation
> > *work* which is itself no east task. This series is just preliminary
> > based on work from last several months and to make BAR1 work. For
> > instance, I kept PRAMIN simple based on feedback that we don't want to
> > over complicate without fully understanding all the requirements.
> > There is also additional requirements for locking design that have
> > implications with DMA fencing etc, for instance.
> >
> > Anyway thinking out loud, I am thinking for handling concurrency at
> > the page table entry level (if we ever need it), we could use per-PT
> > spinlocks similar to the Linux kernel. But lets plan on how to do this
> > properly and based on actual requirements.
> 
> Thanks for the discussion on concurrency, Zhi.
> 
> My plan is to make TLB and PRAMIN use immutable references in their
> function calls and then implement internal locking. I've already done
> this for the GPU buddy functions, so it should be doable, and we'll keep
> it consistent. As a result, we will have finer-grain locking on the
> memory management objects instead of requiring to globally lock a common
> GpuMm object. I'll plan on doing this for v7.
> 
> Also, the PTE allocation race you mentioned is already handled by PRAMIN
> serialization. Since threads must hold the PRAMIN lock to write page
> table entries, concurrent writers are not possible:
> 
>   Thread A: acquire PRAMIN lock
>   Thread A: read PDE (via PRAMIN) -> NULL
>   Thread A: alloc PT page, write PDE
>   Thread A: release PRAMIN lock
> 
>   Thread B: acquire PRAMIN lock
>   Thread B: read PDE (via PRAMIN) -> sees A's pointer
>   Thread B: uses existing PT page, no allocation needed
> 
> No atomic compare-and-swap on VRAM is needed because the PRAMIN lock
> serializes access. Please let me know if you had a different scenario in
> mind, but I think this covers it.
> 
> Zhi, feel free to use v6 though for any testing you are doing while I
> rework the locking.
> 

Hi Joel:

Thanks so much for the work and the discussion. It is super important
efforts for me to move on for the vGPU work. :)

As we discussed, the concurrency matters most when booting multiple vGPUs.
At that time, the concurrency happens at:

1) Allocating GPU memory chunks
2) Reserving GPU channels
3) Mapping GPU memory to BAR1 page table

We basically need kinda protection there. E.g. Guard/Access on immutable
references, which is backed by the mutex. I believe there shouldn't be a
non-sleepible path reaching those. This should be fine.

I can see you are thinking of fine-granularity locking scheme, which I
think is the right direction to go. I agreed with the above two locks.

For 1), I can recall that you mentioned there is some lock protection
already there.

For 2), We can think of it when reaching there.

However for 3), We need to have one there as well beside the above two
locks. Have you already had one in the GPU VA allocator?

If yes, the above two locks should be good enough so far. IMO.

Z.
