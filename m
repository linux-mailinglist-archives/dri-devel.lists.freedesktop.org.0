Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C489737D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 17:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FF0112BBF;
	Wed,  3 Apr 2024 15:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WOmAsDAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8DF112BBF;
 Wed,  3 Apr 2024 15:09:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJQqdqfAGyzgMEmIl7RDnaO71a7UpI1/5PgDvJXUXv8nMOVqUoWxhif/qlF61PMrodj7DKctf15l2VgQchARZBoU5bZJNiOdhbFkKhiJ6Qh1Erkoj7D0mugs1WSzUY2+GccFXQRr5Jf2tlXOZe64G7n7BIQS72ZKJZfVW6I+g4EB/2FfgTMf/EBVB33/6bAInt1YM7t3X3jI3rhiZLvqQGoY4N8ZlkCeo0DE/e6+Eg5Do7NOGujs/EnOwtVkXmra31r+nElGJdVcH1B6/YEbYMo7J/ieSTclPDTOcJ1jJq4mT07j17/OBYde6MrBy+zLKBt08jVCHqLvn50tneJgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWqIregZQtVCTeYzkx509F0Im82mKVWVlyHVYXgHSoc=;
 b=nZ04xl+QWgFOAgEloQY958+o6QcyxB0qtzxJ2BkdAYAFM6o+tHNYMAzK5Xsv2Jnvfbg5t9WTlmQjxBUsZYLco+l6bA3mcAFtzaakSQvdshUrVkO06Pf4rUuUwlnJwwDeqH0BeIRAVwFdHYFhefar7NfzBEhgdcdoKQuprFofTuaiIjewLjWenVmt7L1vNgkbHlyVOFWwr1iJ45F5ubSs+UnAtIpyd2pdL32hhAriUJiTBR25QTHv4MzfDSmDC/dWnosqfJ+/Kra0ITrKv45cRT+9xyivVZ+8ISU0f2UtDgK48PNialMvJgf/vB2qjcXcOLqO9bS7rmY+WhBfHkp7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWqIregZQtVCTeYzkx509F0Im82mKVWVlyHVYXgHSoc=;
 b=WOmAsDAGC2DB4R8hXXPuoIkGQ1lwwKSZgypxi/5RY1Dg99Wr8eUBQcZQe8cCP7bj4RK4RYa0dGX970uwN12DOBWgp/L/fS5vkpfNcsjXZLA69LzC21U/LCbbHDi2/cyN9iid8lRD0HEfd8HW7JpKHk+fmxkLt4iqbLt9eJCgcDMp2xczqYqpmDw8ic+vj6nZhSNJdXRjjzCnzpC+xMbyfbP05WXuUpBfYIUrpUGUvq4NvfFPXFmNqgvsilFPlw3BX+PkvwrcC75W4DDH9lP64Fv0W2DEUagDEoM57O+zUx9oCYl5GImEuxmDb+i8EHbuUaREaVrRYkxPNC1jCHFJrg==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 15:09:31 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 15:09:29 +0000
Date: Wed, 3 Apr 2024 12:09:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Cross-device and cross-driver HMM support
Message-ID: <20240403150928.GE1723999@nvidia.com>
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
 <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
 <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
 <20240403125712.GA1744080@nvidia.com>
 <27a15da3-57e8-4c74-81d2-71ad123776e4@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27a15da3-57e8-4c74-81d2-71ad123776e4@amd.com>
X-ClientProxiedBy: DM6PR02CA0165.namprd02.prod.outlook.com
 (2603:10b6:5:332::32) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|MW4PR12MB6825:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5mND6yNAQMaYxTj2t2HNbur5To86KB1YiJPg1uVIEumXmZ4uPxm+p/h6xeiiYJx5N115Ckk53mcIcFGfJqmGpMzhs4wEe2pjpE221XDx91wnhBci4E8ws1pMn8uS8EBvwcxh5YPmecS07UvAWfmWeIGt2sWk3Cm7rZrJ4RB4bJ76hRW8hlGqruCzecWEWmz/9KuLAHzNLTjicszvAN9/3hXDRcyad3r61BsBEkgxjf/hJsV6l2Pj2GFG7NLwgUH6UkAG6UpEdBTBS+yyulOD0U1bCVKoTJJhEZs9vxwnaPLcMg7B15gAZ2BTFp4Xq6YBe83FBEnKZqh4I+hdh2ihNH0KYGkyxgbSRwz5z06rK1+dejw2WO/zWo/XUH4GkJEQdmXNDzDK+dke5NwbZ3wY6yIG2BbZtUVGlUgedI0GmwJOZxIJ/X0zbFSGmCi+eqVaRs2YtI5akofUCsZwJK0ZuRR4NvoZnqHiBXNo3aFOMSJtHbbi+rWr0pjdwC+F5//2kQUO/95WmWfAN8vu4Dn66/mPlXJCbpu86qXKXP+auQVROaRpz+d4sKiMLGLdebIeBCom4hWBDh5C7UK1TIiC/rUxxPS6Tbz0NrToPYHEVoAPBT4QeWi+LSxxoMtJozKFzbq+I+0hvsuZZXqjcU4n2Eyrf41/cmdjrkOP1/spGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTZsYWJmbVBZaS94dmJpTzJhd3RvSjA0TjVGZUF5dy9DVWJLSkk5Q0lFSGo1?=
 =?utf-8?B?WW9GT3RMZUFTbC91U3R4c0VhOE94UDg1SXlpNXdTSTBSLytYODlwOTZaS1A3?=
 =?utf-8?B?MFpJc1lqOXhrajJxMUdhSDI2dW9qYnZodVRjWWYxZC9JUkNmRlVLd1pJMGpS?=
 =?utf-8?B?NjNxc0xJdk1ZbU5hRlpDazEwVDJBUjhMVkd4L29DamcweHArZWRKY0l2VWFt?=
 =?utf-8?B?WUY0U2ZnWktTMU1ab3c1eUFhZlRZakl0M2RkYmhhK2JXVyt6RDBjNHFvUGZ5?=
 =?utf-8?B?ZXdibks0cG9ZdTQzL3A4T3lUK2hlNi9XVjM2Z2g5a1ZlekwyZVQ1WFdQa04y?=
 =?utf-8?B?WEdJQXRPUnRzM0JtRUtxa1lnOVlyY3lKRU5rNm9JOE55b0J4MlVSUUg4RXpQ?=
 =?utf-8?B?MmUvMUZERXhMRnpyNUhSZXFrM2R1V3M5SDhNM2h3TzVhdDJqQS9kR0JJOUpi?=
 =?utf-8?B?aS9kMzVDRnVkYW5nQzlzbjBRanpHSG9lL0d5VEZyUmxpV3QvVEE5UUVmT2Fk?=
 =?utf-8?B?czhSWjVTMHVRNWloOU9SdDBuM21GMmtXU0l6MmRTRERLYjZnUlRqYXJEQlpv?=
 =?utf-8?B?RnQ5TWw3VlNsaXFUR3g1VnJ3dHJpbmplaStwU3lBa0JYTnpONFpSREdDT3Iy?=
 =?utf-8?B?aGNRNU5USHVoN1R0bEpPUkthNUtHNmlabXlZTWU0eS80dklYb0lNdy9EbUt4?=
 =?utf-8?B?WTQ4cmtOTGo1SWl0a1k5ei9LU1NsQTNST1VHV29IWjJoMDd2WC90b2RIaDFa?=
 =?utf-8?B?cUNwdDVCSU1MVCtqaTRPUTV4eVB1R2s0bmVLYWt2dXVabW11a2l5dVRvS2Iw?=
 =?utf-8?B?NCtpRTl5Q3FWNnNQdk9TTzJaVnFCM2p2ZVJMSEhrMXZTSGtveExZaTdKeUd4?=
 =?utf-8?B?TXZ1TGFyWXg3M3E3WUdDQkU1SEF0ZHBWaXYrelhjWjlzUS9rcy9GWWoyeUNk?=
 =?utf-8?B?bmtSc1E3b2s4ZFRSUkVlYkNlVFd5YWtLMzJ0bTVML0tYb1hQS0NEYVRwbnNO?=
 =?utf-8?B?dkZnOEJRK2lWdTIwSHo1Z28vOHNDZmRsT0JjU0ErcmdJYkNISnhadlR6REZW?=
 =?utf-8?B?cko3TXN4Y2FzYXBpSjBhZms3aDNvdXA3YnZucHEvWkdPU1ZkWSt5azIwRFkv?=
 =?utf-8?B?Y3BqQ0x6UmFHRDJLSjB4NzJvWFZhWHR5MFMzQktObXl3SHIrQUhmeVZjNCtq?=
 =?utf-8?B?U29TNW1ZZHU2a3JiNjB4OWNQcFBtK2lMTWNHR3Nza2NuMzRBWG84SC9Ld1Mw?=
 =?utf-8?B?RnBlZG4yNWZBd2NvS2k2TmdJY1RTM0tVUFVERG4wZEtSc29OQ2RMTmZsR3d1?=
 =?utf-8?B?c3lGYkdTdERRMVdSTlF6UUQ4K2orYnFzd1I5Zk5GWnVTWG1zTG1nM3c3cFcr?=
 =?utf-8?B?ZTVYYWE2ZGZFb3pmdlhLUjFMQnlYdDFDLzYxaEdCOTVhcHptUUxGUEpseU8x?=
 =?utf-8?B?UGhPaERPaXJkZnN4eDQ3ZzJmd0V1N01Ha005dXMxRmZNOTUwU0hQdDRzL3pq?=
 =?utf-8?B?Ty9Jb0NwZ2RKL2JQMFNBZGVCd2l6Y3hNUW1LVEl0aWhoVXdwME1kVWhqUCtE?=
 =?utf-8?B?YWxwVU90QnZWNWEzS1JKeU9oRXRkeTBmOHZpTVIza2ZjSUdYTmU2N3BPcE9R?=
 =?utf-8?B?NW9YdTJMMWJwTzZxbFRXdVJmMXgyVFhJZVFvczB6ekVYYjduMjR3TVB1U1dI?=
 =?utf-8?B?dDBkWklpOGN1T0NWQjAyYXdSUVI5Y3EvVFNmR25laVRHWHhsNVVEbVAwUjg3?=
 =?utf-8?B?K2k4Y1lEa2NWWnZuRkFSVEZ4MUYyUUEwZ0RZbExyeGpJRG5jUW1DTlBKakxz?=
 =?utf-8?B?dldBaDlMTUNUS0FKejdDT0ZEbXRraHdGeDVDb29aZDBrQjNpRHNidndzZ0dU?=
 =?utf-8?B?aUsyNG5kQ0dKQUJtMVd0c1hsbWxaek9acGV1OWc3d1ZmaGZYUVRENlRhNmNs?=
 =?utf-8?B?TlBDSm5LUmdLSGxNM09BZ2N5RWZocE96ZmVIREtlTHozaldGdE5ad296Tnp6?=
 =?utf-8?B?L3djSm9hQml4MVRpZDlhcFR5TWhjTVF0YlE1YUllNkZDbTd3R04yUzlwVlc1?=
 =?utf-8?B?ODRqYUNhdFAvVlpMaXhXYUdaZFo4Q1hvTStDZ09TK01jcGhzNk9saUp1VmJa?=
 =?utf-8?Q?nM5iQ7OeJWZVFQwlTOouTFMfi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81e4c29-7185-4c5b-fdf4-08dc53f00f8a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:09:29.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3OLFZSfWoev/r8cKcBfqv+mVBUeVoBJd6cGEDHmOzamraSr6ELC4NcgVwgcZkfH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825
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

On Wed, Apr 03, 2024 at 04:06:11PM +0200, Christian König wrote:

[UGH html emails, try to avoid those they don't get archived!]

>    The problem with that isn't the software but the hardware.
>    At least on the AMD GPUs and Intels Xe accelerators we have seen so far
>    page faults are not fast enough to actually work with the semantics the
>    Linux kernel uses for struct pages.
>    That's why for example the SVM implementation really suck with fork(),
>    the transparent huge page deamon and NUMA migrations.
>    Somebody should probably sit down and write a performance measurement
>    tool for page faults so that we can start to compare vendors regarding
>    this.

Yes, all these page fault implementations I've seen are really
slow. Even SVA/PRI is really slow. The only way it works usefully
today is for the application/userspace environment to co-operate and
avoid causing faults.

Until someone invents a faster PRI interface this is what we have.. It
is limited but still useful.
 
>    The problem is the DMA API currently has no idea of inter device
>    connectors like XGMI.
>    So it can create P2P mappings for PCIe, but anything which isn't part
>    of those interconnects is ignore at the moment as far as I can see.

Speaking broadly - a "multi-path" device is one that has multiple DMA
initiators and thus multiple paths the DMA can travel. The different
paths may have different properties, like avoiding the iommu or what
not. This might be a private hidden bus (XGMI/nvlink/etc) in a GPU
complex or just two PCI end ports on the same chip like a socket
direct mlx5 device.

The device HW itself must have a way to select which path each DMA
goes thorugh because the paths are going to have different address
spaces. A multi-path PCI device will have different PCI RID's and thus
different iommu_domains/IO pagetables/IOVAs, for instance. A GPU will
alias its internal memory with the PCI IOMMU IOVA.

So, in the case of something like a GPU I expect the private PTE
itself to have bit(s) indicating if the address is PCI, local memory
or internal interconnect.

When the hmm_range_fault() encounters a DEVICE_PRIVATE page the GPU
driver must make a decision on how to set that bit.

My advice would be to organize the GPU driver so that the
"dev_private_owner" is the same value for all GPU's that share a
private address space. IOW dev_private_owner represents the physical
*address space* that the DEVICE_PRIVATE's hidden address lives in, not
the owning HW. Perhaps we will want to improve on this by adding to
the pgmap an explicit address space void * private data as well.

When setup like this hmm_range_fault() will naturally return
DEVICE_PRIVATE pages which map to the address space for which the
requesting GPU can trivially set the PTE bit on. Easy. No DMA API
fussing needed.

Otherwise hmm_range_fault() returns the CPU/P2P page. The GPU should
select the PCI path and the DMA API will check the PCI topology and
generate a correct PCI address.

If the device driver needs/wants to create driver core bus's and
devices to help it model and discover the dev_private_owner groups, I
don't know. Clearly the driver must be able to do this grouping to
make it work, and all this setup is just done when creating the pgmap.

I don't think the DMA API should become involved here. The layering in
a multi-path scenario should have the DMA API caller decide on the
path then the DMA API will map for the specific path. The caller needs
to expressly opt into this because there is additional HW - the
multi-path selector - that needs to be programmed and the DMA API
cannot make that transparent.

A similar approach works for going from P2P pages as well, the driver
can inspect the pgmap owner and similarly check the pgmap private data
to learn the address space and internal address then decide to choose
the non-PCI path.

This scales to a world without P2P struct pages because we will still
have some kind of 'pgmap' similar structure that holds meta data for a
uniform chunk of MMIO.

Jason
