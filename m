Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLaEAxEVomk0zAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:05:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960E1BE6FC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 23:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADA910EC46;
	Fri, 27 Feb 2026 22:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oKb3IEgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3B810EC46
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 22:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzK1P+xFG8Bw6NBn5F3Pl5UUnfF5yPTqeKi6gJxru9uArnvvks+rHhclP9IrDU13FOdiXqIzrQFSOOla2/02E0fDXsM69BgnFrHXgeA2dB14gBD/L1XgYO5x3FPKbWqqw6WZgiboeGHneX43MNusHGpetPheALeBoajz5nE5Yk0DjQHSwKzmARRC6lqqBfyBtKKbajxXomt4xZag+cTeWOx1Njz9+ul6G3tCH7KQULbFKtiiWW7DfSEt31bXa5vd1oEKT+Fin6BZvB5fKmd6fv3CBBBWhDJg56R2rggYLCihFVbAFNABlIdBDvrvtfqt7GrDniD9X2mF0+IrZHGZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn+R7lYy6ZjU0H6eZiFtx5LQYH79IO/7HTDEdlPRtl4=;
 b=QvuuyQdPi3FDywmq5IhKJRwJbwo5puMrMbVRcjdTM6UKs+6OlCibJOIU8v0Xcz5U7eyjblyQGy2G8pXgxlnkwql/6xRoNJNDPs0FjtOeVtks7VZbgVS1LJffG6hwFqzKfCxr+D0LPcQSA5bF3v9ktS1ZTCB2ePahDu282ofallz3O/1s1fGoHxT/idVh90buwIW7S2d/w1M1q7TvvST6xcPFdWyrz54dnkJsLdWwj5uCUp/Lm6krbMKYHME6zmKFJKOxZffmR7zoPYphcyrmKyUC3J07zg/7XOD6XMV7obKKySCQTeOT/UmN3MDiUWKgQnt7m8lGGpt+K2sRrDnNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn+R7lYy6ZjU0H6eZiFtx5LQYH79IO/7HTDEdlPRtl4=;
 b=oKb3IEgt4gv2eavITl5rHa1QzkA7l31D8PuBklWNH9kx/qC8R7CGv21v0vDkxw7Tngpuktd75lXoQtTo6+s8GZuMNdWTPLUIFjWVdEz0+9BImP5mWeKa6r5/zVLAEMKe33mK9vvM0kaIgrblNc4h5/vUOhg5zvY67w1vSVns35a94zk30inbxBInrAMYdWqgzcofVVL+4jZRbASuK5P5R+2txIDXuNghRvey4iyQ44heaiYgrQvJ03H6xlgxkZGtDo9lHbhdJTwFOu1JyvgwQsE6nfD5T8OgVAgBatk+ofyn8YOdpTPacxmoyiGMdc0QAGMRRRx5ZK5GMfuPf+9m6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 22:04:28 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 22:04:28 +0000
Date: Fri, 27 Feb 2026 18:04:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Mastro <amastro@fb.com>
Cc: Matt Evans <mattev@meta.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
Message-ID: <20260227220427.GM5933@nvidia.com>
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
 <20260227125109.GH5933@nvidia.com>
 <c5a8f318-20af-4d80-a279-2393192108c3@meta.com>
 <20260227194807.GL5933@nvidia.com>
 <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
X-ClientProxiedBy: BL1PR13CA0287.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::22) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: c40c9cae-b326-43a8-64f8-08de764c2d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: xDXQbgpoLbH8oWyN9bbildDSV/HnaSJa6TRipngZBHmk2B+EdynokXJ2FcG6MSqyy8TYdVaqI0ntKw7jWTb2rLWG0ZZHMC9s4+hVokQXo4IFSo5b03jkFTx/mfNB/jA6HTfqwbNiuTyRm/pSeLRT7mxXOSGiIwk5sP/0NVS6Qya+eRIgpPB2Fo9pJJ4FQzveywNbUZ9AVMMK8iHrrDMQKFTCGCYqe7M1ybU0vmKAjXHWx+j6lJgvlJXzcr/PLeaN8gjL2r+jMZtpDNkTVh6HidbdmDuQbypCyoHMMBeiXqDHPg/aF/YcmdNCQbeX/lUH6S4RqpipOnVNGmo2Gdn4sRz6Bnlu/X4EzgUEcg90Vgyn5sebqp9QywRqt7unxyiQdetkuX5LKw7NwQoqIvGhXatDuY9o0KN+CXqeVq/UIMZ0nxK6RX70uRbsJn5PGxS7y/zcXWOszUFSlSDUMLYDExtj7/AUljSfkd2KuqDdct37fYzti9RcFJ8BmRz8kNW/VU3zJ3SkyoHofJp699bRBn/gKQhH+L+QcwzTZH64f+unSP2m9zlEae5bWk37o0k25xmgAraTTE3oRTQTYCWj8nJ8mc+1tDmJh5dSdZy7QNb9L50Y4Jzeaq/u9iWONz/UaC0q3VaaAtVzraj09xpJ8v/Z+suNjpfb0okwtMu0WS5eXg6RDAFBOqjq+8qaJAazQNIx11/653AwfBwHavg0dwXVK0Vlz/aJVymskckCB00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/U2ACUaOMh/nsuFmNKVaYdkscFJ3H2uZEEnmtjkFdzuuLRN+nD9Osf+DTzJO?=
 =?us-ascii?Q?gf4pu3Ki6bTi8kC1Bzrde2pepwW/nuIrmuhO4IcKqAW9WHfDC2xLBgUCegTS?=
 =?us-ascii?Q?KFWV8OrOqaixAH3qNlhvJx4vEeYCk2WSkcD1k++YC1klHkfyiLypsZ16b7kP?=
 =?us-ascii?Q?W5xxxdwPbLAazQ/r7WrFrrUJTXyBGRfUBQQxcNcRvi3nGQUKsN6S+MqeKGi8?=
 =?us-ascii?Q?yATRhHR10VoqW1dsIfiUxSx4eNg7BZUYyKo7vac5wr3bCEDecawPg24Am0bX?=
 =?us-ascii?Q?pD6rGfmjvkFw0MnosSgZOFMGtzeQAavaZw4xAg7fEsDzXAGaagkGDgYv2kRZ?=
 =?us-ascii?Q?DiNzC8FFGfA5PWtuc8bgh0nvNkV1q3Lnxx3XjT6WqpQo9l5dFTRbSmE6/baq?=
 =?us-ascii?Q?1a8MPipNqyjyH2SuOPd5FoC0hSRl5Sm1GRw0TuTkJ01Go6nDHSR8SnVfC7zo?=
 =?us-ascii?Q?yn3SXsCKCabU7TgehCvxOgMe2tspwGuPrz0crCZZPzjJvmYp59+zI2I0zZ2A?=
 =?us-ascii?Q?UniSut3MN1PJubJXtyaCL9hhVHzAWvPSRXwmmpn2/EaNfMvUh6mMRHEX64qC?=
 =?us-ascii?Q?NcEzFMhzuRhz3XsG+bjbzzG2FcJUtEGynkkjkS5GwwE1qBuWpQPSBjV2bNUW?=
 =?us-ascii?Q?A0zCKc6z3loNHZXsRaJQZvf77/ns8RtDz16M3chcpl+7CO8WbnPjhzxQE/td?=
 =?us-ascii?Q?7O1U8Ut+V4uhAN3pefaugo2PplKHvDPrC1TFIUlIhH2mzwtzlB4gp9IBNDx5?=
 =?us-ascii?Q?6YOM+uQtOGshz2zipR6ejhW0HSniWw6SMjU+M1Kyn95YPROjlOfZgeUwZeso?=
 =?us-ascii?Q?1ZC/n3Bo9PMjSjPqoiyb0lirDQ1LVyu2MRYCi2I8cSjT/ISs3Rj9ckpIWEmz?=
 =?us-ascii?Q?Ot/3rKie0iEkmSS0XZYM4mwhH/DuUfmCRFFXqpaQiYhoNjDSvoaNHrmIZHJc?=
 =?us-ascii?Q?toDo+ZRMHs+hqsqG2ps12EexJ4oORqbZ3iFbz+42ABQrmvrv0sYxWegth9Vq?=
 =?us-ascii?Q?JhJ/p7slF68wnR6ejbhYHug5MZ0Y64RhCs1Wbi3/XX3zwuHezNdXVtEzfurN?=
 =?us-ascii?Q?feHngX+f0Y1ruMuwQcKgcjK1KDq6ancvF/OMp90ybxaH19gU0rtpuhMNAPf8?=
 =?us-ascii?Q?KUJsW7DbmN3zKpWd59BV6+9V00el25BGhvMYtWbC4IWIFh8nwnFe+O2BgwVp?=
 =?us-ascii?Q?T7oA4pMlVvRsyavSoS78/9Unb91Yx4mEJ6Y+6/sqpQ5Iv0Po9RKw4TwgKXcH?=
 =?us-ascii?Q?axM9ajnZRWQnamlwyPtauEcSsaJG645aTSJAOTfqjBZ9RwKakwEapMB96rnh?=
 =?us-ascii?Q?HkMY0SitCDXVCq/JdPsWsVwlsJxfXLE/FPdP5iTn/gsmEzyyDg84ULAXW9e6?=
 =?us-ascii?Q?bfoTFX4tb+KFGbyUJal+lZBx4dASVyuKAdjvfm6f9FPGxRUYjGlYIGxEEPf2?=
 =?us-ascii?Q?uZX2zT9w2lxVelbIGUvlPJbqp/9x3eCnr/rwBnN5WNm+0E47DLlK5uYyska2?=
 =?us-ascii?Q?BnEYuK4m5B0/ZEBoxCE7BeM1bg+K4nsskbg8l5WxTOCDO7bAl0Dy21nMlfZQ?=
 =?us-ascii?Q?pYMKiBDrXydlfm5qL9ahIh9NyDKnj21MIe1UwBNhe66wCr7g2y+lMplvHcMv?=
 =?us-ascii?Q?9Jvw1bDQH3RCSaqjFJTtC34hT7PJiYHllLwsAYvOgUrboTWNjj/a25hZ5kqQ?=
 =?us-ascii?Q?2g6JhaLORKVn7cSnxFTqOU+3btyMnJKnHd1FPSVOEa5WfeLggW6eZv/HTH5u?=
 =?us-ascii?Q?KCWzUgCsfw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40c9cae-b326-43a8-64f8-08de764c2d4a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 22:04:28.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzZLenXnMcipM0rt06bUc98paZj/OJii8lKDxy6XTg+EWQ2xlY41tY1ZR7F7e4Hq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amastro@fb.com,m:mattev@meta.com,m:christian.koenig@amd.com,m:alex@shazbot.org,m:leon@kernel.org,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2960E1BE6FC
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:52:15PM -0800, Alex Mastro wrote:
> On Fri, Feb 27, 2026 at 03:48:07PM -0400, Jason Gunthorpe wrote:
> > > > I actually would like to go the other way and have VFIO always have a
> > > > DMABUF under the VMA's it mmaps because that will make it easy to
> > > > finish the type1 emulation which requires finding dmabufs for the
> > > > VMAs.
> > 
> > This is a still better idea since it avoid duplicating the VMA flow
> > into two parts..
> 
> I suppose this would also compose with your idea to use dma-buf for
> iommufd_compat support of VFIO_IOMMU_MAP_DMA of vfio device fd-backed mmap()s
> [1]? Instead of needing to materialize a new dma-buf, you could use the existing
> backing one?

Yeah, that too

I think it is a fairly easy progression:

1) mmap_prepare() allocates a new dmabuf file * and sticks it in
   desc->vm_file. Rework so all the vma_ops are using vm_file that is
   a dmabuf. The allocated dmabuf has a singleton range
2) Teach the fault handlers to support full range semantics
3) Use dmabuf revoke variables/etc in the mmap fault handlers
4) Move the address space from the vfio to the dmabuf
5) Allow mmaping the dmabuf fd directly which is now only a couple lines

I forget how all the different mmap implementations in vfio interact
though - but I think the above is good for vfio-pci

Jason
