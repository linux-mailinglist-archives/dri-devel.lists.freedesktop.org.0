Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27348B101E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DB310F86F;
	Wed, 24 Apr 2024 16:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AztgHZKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E351B10F86F;
 Wed, 24 Apr 2024 16:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of6tPhh8UqMjZkmhMWovf2GtvLBgk6L3KF1E4oebTI9fteGZvmZeZkdnApkrke/H5NksIHhF5yqwrITkyNNt7uyWIGWeGCkbcYs67150yD5RYx5j6NijS/UA5D0vQSbv3ZbXSO+Xa38uar2klNyyk/Nsqfi5Re1pKW/slVPBSVftFZ38fr79jiQ4utxc+QWrwycCnSnDlxtGA/uD1HHn3RD6w+Sr6C/h8tL+uAx4MP4xgTbeoSK1IldouyoQ64xarS2COWLNL+Zp8gWns4JSJS1MPsBG4Tzz5XUyBZVI8miHZXlez+f3DveRyu4k6amWXofgYS3RR+dQHzgTfjqp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZYRaeDHY038z71wJn0K617xhW+5jIUWO+h1A/HiC+Q=;
 b=cnTri/ifFWWo2MLnSpCDJkFf+++SOrt6En1eSa+OhY+waHEmOjmMhwA9ffZm8Ufot038IJl+JiJJPIQGjp44cMR/vjtp5EKQVcJB+EqLyHi0Gfy8M7FngAF2Tc13TsJy9rIgBD/qTan7U57+Yn+wtwWedzf1J2sqwP3aYBXBbNIQNpLkyzdq3F43Y7AZJPD0aOkNGEQRH3W8/0H2ylyw9mhn6jJsO3ZfzvJHRtEAftqWuFsYWT+Qw8BAD+gA7wt0cWzN77brmQPQXLe+88mfdt5if28EEqoO/NyfgYvTsB7V0jAQlqMhr+N1ov20/1zDDsi0BCM75fh0QQ3FYiZwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZYRaeDHY038z71wJn0K617xhW+5jIUWO+h1A/HiC+Q=;
 b=AztgHZKgHR6q3/CC4IQZ+zFXfkT/EeJ45ayFxsYSfRpasXK3MNdh+NXQXW7/0eXdNAINu6duFQirWF7whw4ea2CWRAZ4OkwjQMvPOSACtNT5+tmNGIOy5ifJBPwToz0Y7riWFrCAPA0vb2rRp14sgZw2ZJBu3xW/jf9kFI9gzhJUv7V38FZtTGdBfoHpzkHC5Jx7RLRuAcFDsY7CdyC8EnthrwnCWxS2QYcIFVdJ1HG5aQXzv5xo1Mj2gP2CEvigJYdHAzLC/VVKwr4xfuhG1ZfoKHBlbCqiJTxZ5who05kH+YpnjpeLQorshQeR5ymGj5cInuEFkn/tABVJPhl/Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 16:44:14 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 16:44:13 +0000
Date: Wed, 24 Apr 2024 13:44:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240424164411.GR941030@nvidia.com>
References: <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZihvCKYRRw1NzoNl@DUT025-TGLU.fm.intel.com>
 <20240424135754.GK941030@nvidia.com>
 <Zik0xY55VBXbgJxs@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zik0xY55VBXbgJxs@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SA1P222CA0096.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::23) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c87bb4-13c9-4760-9577-08dc647dc5f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VJ+jKSHUIQqRXZprQINcMptAjz6UjKOSxPFjVll4OGOMvfsTEubcNYuHJE6K?=
 =?us-ascii?Q?mew2qP1LqhTShvtKDeFd8uEFukLG6c12FPRxhzdGprdHZ9HlVx23fswycieD?=
 =?us-ascii?Q?WAphG1IYaazxYmlbGbZT3kd92MYv2QE1b7Y4prPgTRREVwREVBm5uiEJZ3Fm?=
 =?us-ascii?Q?6npf+RxU44CSbJpuH2/QOlrmoGmgC3bQz84BGvPPobfItnamrdUFD1/opBZx?=
 =?us-ascii?Q?TaEPnvAO8yA99jpUO7f1DXivLmdEu/D4n29KYyWxxKSvUkM1zbDHFoH0Ji1m?=
 =?us-ascii?Q?RmiRhHemVQXXeSvc366wQFtYsjfktU49K3E10wLrrGVTEanjjnmom9vPqz6o?=
 =?us-ascii?Q?VA0d6uQwmJRQF5w9fV4NEQ2UJHIMCMpzJTQ5000qu2iCQX3W+DjflOHKyKq/?=
 =?us-ascii?Q?nZTdpZPGgSngR/YqHpfjOeVaiL+90SUX/gANQMLYTyPyBCJMg41exdUV13J1?=
 =?us-ascii?Q?Rq79VZw2Qw6lcjw2HHSYbTsNAo0zki2kIjPr2EKP2BJOyS31WYWneDb78JNy?=
 =?us-ascii?Q?+Vg5Og5F0kJKzZrv+h7BI+Xec3a/AnfoqYPX5zEXvD2I93jmbLxHCY1l6kru?=
 =?us-ascii?Q?X8U5Os4sKtZAe8SGEj9E2+zwa73OoN6L2HYpJDImHaYepOYco+8Lx0+ugLxv?=
 =?us-ascii?Q?IfsdCTAjzHpQU2l4nlGICcF1GT6ySjmaTjetKet1B8rzCojNUqrWbtmuO6v7?=
 =?us-ascii?Q?Yxsb96MPbkPjEl/YOUK85Sp+5dQ4J+sMuBHocZUDsMTcr6N48HwhErvbVIAF?=
 =?us-ascii?Q?XiKd1zGr5g2G/R3cythkA3xCaqe2Djk8fMPTNbzXIrigQxuxFCzY5Y76gnlS?=
 =?us-ascii?Q?7DRaiiH65x3EJzp8L5FQ4SxfLKrDGM0Jr/cvSc8FXfxMEqBhnAsQYtBUEX0R?=
 =?us-ascii?Q?SjPkzDoIVRCaOWj8E280nahnXiO+XHsEWu1eipXpdIn3WTMtKmVE6PqMmmUl?=
 =?us-ascii?Q?T5EnSS6SKw0HBmbrY6EIWHXQexEbHLUHuGf8btXID2kw6znlbG3YGfPuysfO?=
 =?us-ascii?Q?tJs7Umn/KJmNELBIvDke8tykliohJdjHHdv6WkLGGnn9usEfyxwZoE/s0L3t?=
 =?us-ascii?Q?CAdahdJvye4t3gFrlahuZMwK5WqmkGPcN3xXDkKCfB9l46dmv4b8j1jJfP+v?=
 =?us-ascii?Q?bY7tiMn7e4d3OVNnlqHFMBOlR8J4zLBcS5q3Lqqu/CDv3tBaLGe4BdFGB12i?=
 =?us-ascii?Q?ivYvq0mRDQFaLzfR52O1ZLozTTHm5VkHLVcZNBJ+seC9JERn7WaRskw18wna?=
 =?us-ascii?Q?//Nv+5xvrr29n8CuYDcI6FddpDoOHHD82Co7IQM3QQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuWJ+sFIMaMKx6xPP9BsB5LeFlUwFjzeSpJgMRvKaOPbV2BWvCfp5ddgOIBD?=
 =?us-ascii?Q?UVcD7JsfSUtrh9LrhOESL98vQ+IV0RZXGI4Wd4mOy0PcGEXbR5cKTjtZ67LX?=
 =?us-ascii?Q?YIGx3txOYEYlA0/zhRqAXH9bUkKBESyVn8OaqXI3MR+uBlFDSmb3RtVtQ0sj?=
 =?us-ascii?Q?GqGxjARw4X5nHJ2N4ixIhR1Jj1uHDm9J6aWNleStT8pKip6Imsk6sXDAv102?=
 =?us-ascii?Q?dGJASGnbQUQZ95GCqIq0DAWPseEOVOGFAyP+BplP3urr7L4Chmek8GTdsw6Y?=
 =?us-ascii?Q?UjlaXo0ck37+ja6WkWbevUz2oGuIx+ZFM5wELS8DDc6t2E0cV5UjXMP4r52A?=
 =?us-ascii?Q?/8DmW90/z0LI1A803FrwA+4+BUmwcBDD96AEBjJSW2357BK4SY+/SxKIwDFP?=
 =?us-ascii?Q?e01nIGb2euTnJ25B3/ASDFEudJBR0DkCCcCK7KnCCxwSgvlqWQes348cdj6T?=
 =?us-ascii?Q?Hp2t8xFpbS0lfXO8mtWJgEHLymQNFhIi5/UOtSsPHwH8mK2ILDXiEd/3PZfU?=
 =?us-ascii?Q?jcSwe9Qv+MG42rUR65m0WxYAl+q6g78cxuby0v19dL6a2WZntuBVRgs7pXQn?=
 =?us-ascii?Q?Allkny4JUri1f/Phh5p1f57yu2b4LlJoeyg+pg1lQgz1W2Gv2yeFhI8ZDC7B?=
 =?us-ascii?Q?ATaHTyIB34666xQZHT6wrY3w9bpjX4Su0N+M/MzVS2NbYKb/2dy7dWqcXeuD?=
 =?us-ascii?Q?fso7WZaJDXSH89o0h2HcAQtz5U1AoG/L1PTVV1ormp3TNYhWh7V/PhTK66t4?=
 =?us-ascii?Q?5AFIsESBPqhYRI6qMhXwnDxXs6U9m/6hknNWufMrzTtNMBjIpa1LR2ip6dal?=
 =?us-ascii?Q?BsVI7V9H9I7NkhE2Ll164rkKspD2MY2xkfU6hBm7GmGC09VEEbZtELeKiPIf?=
 =?us-ascii?Q?HOQ/Q03fqbk5QjQoIkYKkDsRsMT8lMzSYfkxChx9GCpkF2hi0+IoUa6+x41p?=
 =?us-ascii?Q?qe0QKoaRAUf40r8auZQyH3EFB6Z5dOQ3u1ezq7CVgiCgztLbF1+mH1vxf2po?=
 =?us-ascii?Q?XP5krZWr9FUukSS0MuNonCMK7Gg+aNe5I3scOHqngaa4wZsSYrIZaFCfbJUH?=
 =?us-ascii?Q?xIeUSK2sOtgmPOE1e6DMlHj0NsxcN7+Z1Pn5W49prJpiz8Oc+HbWkJbcv6+H?=
 =?us-ascii?Q?npM3PVXjA3XcKU4ttTSBfIFaWxIITwEpuSio4S0EoiIiNqt0SnX3TcYRp0t/?=
 =?us-ascii?Q?cAYEPrkD02dAmP8rvmQ712gNh4xHWWgytJCfVJtJkUY2NRpl+uc0axTuWP9L?=
 =?us-ascii?Q?N9EfH4U16KL8c5ad3Rlt2HLheMBvE7CQUU5EMYKGx2fh9Xkp4vMFDWVOBeC9?=
 =?us-ascii?Q?TUrO66breBO73ds++dKgM+y151AjXQ/lekpFYKULh+jnYopXVzbiQOuKYEiY?=
 =?us-ascii?Q?d4LThLLNhiR6HWzMvQVdJtJgNqJS0IjmVku8iD0FNlTT/t8HqhB/zTztaEJN?=
 =?us-ascii?Q?PbOS3A5MDz3cwPAozgoPr0TDgKVJUVNCOm3z/+DpZboS34ALJGqpVTUJrOAB?=
 =?us-ascii?Q?Mjq5907X3C7KdWdMexFaV47lKeFgdtgbx7PLqAKGOChma83Z+0fZi4+xJBfG?=
 =?us-ascii?Q?iJ5yPTdVz2WeG7PNdsE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c87bb4-13c9-4760-9577-08dc647dc5f3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 16:44:13.5726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS162IuD45eyc8TWAU0OaUb0bQblyj4UNiFeJHPRDyzsbk+lhSFNFSY3n4AHKY22
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371
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

On Wed, Apr 24, 2024 at 04:35:17PM +0000, Matthew Brost wrote:
> On Wed, Apr 24, 2024 at 10:57:54AM -0300, Jason Gunthorpe wrote:
> > On Wed, Apr 24, 2024 at 02:31:36AM +0000, Matthew Brost wrote:
> > 
> > > AMD seems to register notifiers on demand for parts of the address space
> > > [1], I think Nvidia's open source driver does this too (can look this up
> > > if needed). We (Intel) also do this in Xe and the i915 for userptrs
> > > (explictly binding a user address via IOCTL) too and it seems to work
> > > quite well.
> > 
> > I always thought AMD's implementation of this stuff was bad..
> 
> No comment on the quality of AMD's implementaion.
> 
> But in general the view among my team members that registering notifiers
> on demand for sub ranges is an accepted practice.

Yes, but not on a 2M granual, and not without sparsity. Do it on
something like an aligned 512M and it would be fairly reasonable.

> You do not *need* some other data structure as you could always just
> walk the page tables but in practice a data structure exists in a tree
> of shorts with the key being a VA range. The data structure has meta
> data about the mapping, all GPU drivers seem to have this. 

What "meta data" is there for a SVA mapping? The entire page table is
an SVA.

> structure, along with pages returned from hmm_range_fault, are used to
> program the GPU PTEs.

Most likely pages returned from hmm_range_fault() can just be stored
directly in the page table's PTEs. I'd be surprised if you actually
need seperate storage. (ignoring some of the current issues with the
DMA API)

> Again the allocation of this data structure happens *before* calling
> hmm_range_fault on first GPU fault within unmapped range.

The SVA page table and hmm_range_fault are tightly connected together,
if a vma is needed to make it work then it is not "before", it is
part of.

Jason
