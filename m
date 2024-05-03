Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDFE8BADD3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EDD10FC58;
	Fri,  3 May 2024 13:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OVITdeEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9A210FC58;
 Fri,  3 May 2024 13:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcM6qg7+HuOmiXwFZHK/gLbq4/lCCyfNiX5yVoDBfOCcpj10X49t096hQKz4WDUb/dJQ+tjFqqcKkyEhi7Q4DhM3xCB/KVkoCD6eUlQmg0P0rlXNx9OY6qmewdxnB1OG/nRHNveQaJTftsoV5wEU+AYQgTGGb4PuoETws7Xd6iZeGRrxheBN+dvP0JjjSjSqq/IIB6QlVVSDupSMo2lrPuP8suZKeqCT7hefPg0z/QTq2OFl0cvL5HXVO4H1N5SExbK5ASiRStPUdwtTxhB2LBkywSFHYQ/jQLMK9/MmesP6E+rzJnUs/FLhpxdxUf9qFeGFOWGtQH6U7KFphzh+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzE0wUfS1iYsHK32RUZnD77tYibkmXJYf3smeZyyqv8=;
 b=A9Cpfq6gnAXXITCrMAdrHoEFZ/odFw4v3HRmx+a6WqrKAo1g7ey6XOJhcXfa74N0rFQk4IJ1fVqQp7sOlAOP/P8COBN9HKxQPybnqImPORyMk4EwR4WJWRm3lzlKf+kWV0Mdi15jkzfj2sPg1jdcnJ9rVhahXursjWThsDjaKyf6TZaLa8wi9f3kxYCyzG9jRgAsypZV9Zy+50mPeV6HjBDAlOz/YQUH84vuqCjGX4+VGoBacBhMblSTd0CV/iMMq1PwnNtiXuESYY/MqPJml7484t6oPEni2iC31iYazGpJY+qYK0Z6jM1expAM+AUQLrbnXVbDg7cabW9SiICKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzE0wUfS1iYsHK32RUZnD77tYibkmXJYf3smeZyyqv8=;
 b=OVITdeEvJAO2qZMv0VK3/MjGGt/M2cq6DjZkk5f3NL6NeTVWEC/0KQIB0H3/fBq0E+gJTtSAutLchV0KLe3Eh0vy3ZLNNOmJLZqo/lr2hYGR3qcIXc8UIN/xEej3azyR3WIexOHbzztbROyPDdTVvDuj9+5Ai8rCL4i2mz0OkyREIxNLzKmAGl+6NbJMrvbUzz3nHwHB8rWwX5xVRIJ3uFbP9Vx348LORm3VWIHZ7pfC1MCNZkILUvT8VFqm/khh2z3JbF118tgAHtRLwsR6yMZhOavBn/LhYVcEZpIJDme+JcIA5eRhTmPbYwqeyZrbhEBe2EB/d0TrCZ/VuRrZRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 13:37:35 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 13:37:35 +0000
Date: Fri, 3 May 2024 10:37:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240503133732.GD3341011@nvidia.com>
References: <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com>
 <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com>
 <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: DM6PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::27) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef13ac7-91cc-4c22-28a0-08dc6b7630d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wv5v/fKgxwxCP5N2+K8OnhKasFEpxsG4cTyg7ImpkpykPFUPAYiXNsGLNG95?=
 =?us-ascii?Q?A8ODnBj12ZFlQk3ZqnHxT8dDKMumED8+C08uZSuBItjrvYa9IHAoaQdLIyWh?=
 =?us-ascii?Q?clgOAXS3aZ8AwXUR/W3EQmgRyAURxM6CKVvJMswivbIwx0lISZGGBlJsIe+o?=
 =?us-ascii?Q?LqMQzM+bRNs4sO/9ejP9YB9qMPtZRzbmgAMUSpG9ZqlZNsDsOYrnDKUBPKLc?=
 =?us-ascii?Q?VsZdeIRw4rQzIqoX+VRSS3ZS0PYjywHNaK3Y4xqdn39PJ8cP1UST9d3sCfCV?=
 =?us-ascii?Q?LuW7DhmXjlSJljBXVkn0SyfeB5MOlf61ssksB+1jTt2gfd1Xo7p+Qj2Rgaa7?=
 =?us-ascii?Q?M0NGGWYFRv+GZ4nBrHQN1Dk+BsclkZhk3BKzizlR8ckYzednvuVFTgNsblUG?=
 =?us-ascii?Q?n8szJo273QrZ96KnP87oZw0ZMQzNaNujtib0Hho/DGoPUAW2emV6+DdNWRQJ?=
 =?us-ascii?Q?TvahRi7xoEdbMCqsOUY+jVmR2pZJCeLoMMvK6bscwLpaC/DjZrOVLWxBbMR0?=
 =?us-ascii?Q?rD2sw1dAsu6s9SLB1iWNVa8Zns/ajb9hRBrE5fkJYASkXRjvJT1kY39zvmuk?=
 =?us-ascii?Q?hTC6PZGCKDA1GaaaMUmO+A48dYCgkgRMt96wtQMduF2ZIl2s9Ts1vfc9S8Xc?=
 =?us-ascii?Q?kvO588OcNVW1aocgPbxc2T6KSyxFbxj3Jy/glWzYTGsnjJLlYNoZl2EqYoJq?=
 =?us-ascii?Q?3+AwLqNGFpSFvHbYdDv+1T6wc045o90sRd1bUU2DkcbCHtHh+dOOD/dvUhAV?=
 =?us-ascii?Q?MURKUa7VAYOxt45ZWzO/U5DdHFDh2C45vGl3NeYCq1GFIhUKqv5TmgcbYKMC?=
 =?us-ascii?Q?0bTXJucXtEqAlXWWxnzOGavBIlAKCjW8duqEEdVFEfO11rvt9JYMW7+ESHCD?=
 =?us-ascii?Q?ybXjV9EhyxNr0vngnYxUDerfel+tgdHyBPoL+O2iboOG2N5A0svFBVD2o4op?=
 =?us-ascii?Q?aoyaVdW1bUBdyRJgDcC7n97YsP47xY3JXYpz5EPzpp4DIv1ICzwEaJxenuuq?=
 =?us-ascii?Q?z9DoIcTl3jGfYBbhe3cQ74Px3f+zqtr6+O2RxXTgHKWKHVAXo2ad36VR2na9?=
 =?us-ascii?Q?Fg9bYzTzmaiCr55dq3/t0nSh6WJ1qA1zGRpDVPt6rJci1oXHJgyg9lIJ7L9p?=
 =?us-ascii?Q?93wzOz5PczpzDkhWuZgprFZvbn8T5WcSNMdBXXpwlEt3V8z/I9Qn93+zGoUB?=
 =?us-ascii?Q?uiV31WyHCSbw5xxHz+TsqfjPrcP+/Eu5A9rCJl5kybn8T5/6cvjGq6dx3Pbb?=
 =?us-ascii?Q?T8J8eRYOmhDPqQDAH7sBJRehnUo+9TR15UJ8S5KhhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+TU0+CZiEiVLudjqB67I8hbORJN4z7PKSqwCD1ZhQtpmLIxrlTR9rrLiN0GY?=
 =?us-ascii?Q?G/wAkYsR8FzRkKLpBj1MAifOmK3MQePqmHDbJOapeLSSuG4sRaIzQgOb0WTZ?=
 =?us-ascii?Q?lp4FLdTcwyqgsUYbZjkr2lsfVDH7m3nzQT1wlKcKQCNyfjZjnvR8EoxfXm1g?=
 =?us-ascii?Q?5a6gdB2vUc41yJRtGYUzvgCnGGc+OnkLuyRybhe24idqxaveO5AjNuaVyBdw?=
 =?us-ascii?Q?/D0egn+2P1Zm6MYSiE0/fHlIiPr513OLjpoV2btyd7en9sb42jj+ZDvHSNSM?=
 =?us-ascii?Q?XY3v3w2ZP8TSSaqPzw6iFod9FUN/A4xcOUo28Uy0CcRFS4BJwdoMfmFoBKSO?=
 =?us-ascii?Q?vrmapwqxr7bP9eilvDJWQonSFYA+jeTmnBpYIVXygn8Ee3ROlWByADuZzSG6?=
 =?us-ascii?Q?phNu4c+yeAxfRGLYH0ol6lWdfY9n3mNS6y5pTeifxr82SPdpVnqrNPrWt7p6?=
 =?us-ascii?Q?FEjfkaOhBS9MI6/tEE0sZdLxRxF5Huc8K35aPiiwZuye6rogY+a+IufsF8e7?=
 =?us-ascii?Q?WdU5Kt6nLeUZutC0FWhm1o8xDpTrR4j9/CMmtN2OHHXtHpzyljBRXJqXxjrW?=
 =?us-ascii?Q?RZtkns7AuIa5uRe2OOfZ/2WVhv4RSCQQWPVY/ey+5gcvir1UZUsG6v2eNghk?=
 =?us-ascii?Q?aNPKxCcIl87ocOz3xKkoGc20YsOql4mRxC4Y5t0EkG+egARM7gvoQRMfhDQg?=
 =?us-ascii?Q?B8GtLCEcVRlbOOJS3mOPEE4453ecQw+VU5r8wEKbHGFvEzBk2rVwzAE+Zzjj?=
 =?us-ascii?Q?P87SdRYUuWe+B/nHR+OsBy93vlDGy5fjK5v69KNDjJAqahb9zqDHVwx4gL+L?=
 =?us-ascii?Q?EEGtzqfkLRLxn63YAQUmDAv6w+7PlqlHSaWdtLxADJJQn+hs5la30wWIR/bJ?=
 =?us-ascii?Q?Vn8ZDoBDKROn5G/y3+5KKlUUmZw5woFHItjZWnvhONvtlS4Kzb4YO9FTqEeL?=
 =?us-ascii?Q?IhasuoS9hAJ4gYzSbiGejNiZZWjYtCL9sR6u1QkRC1ZMy/PV5Vp7BINFNn7G?=
 =?us-ascii?Q?UAeWymWN28HuRijW8wMPz65UEyxGjgCdxhNmFLjKSaxpq7FxxRpl3pUQW+MO?=
 =?us-ascii?Q?dXvVKtxVqg3hLT3KUZ/AqPoXc0CsLicZbRJ3IfbwwOI5fHIJkGVFRv06Dnlf?=
 =?us-ascii?Q?I0lnC06RUldCVF7wwP1NxmBq3SYzsfO6vvaE4gRu+hSkljHC34C70BXdHUmt?=
 =?us-ascii?Q?4WCHOHjxlQMrMX3NtgP3Azpqt+l50Wh3SW6KyF76i3+xRA6WkMRRqalpyj+t?=
 =?us-ascii?Q?OooHcl+yD4HP6qXFbQMyWqgdO4pGv6BS88x1ZxjTUyysitagMr4azsPtgIZm?=
 =?us-ascii?Q?SuU5q6stf0DnvfA0DjthcZr1o5wCYwzl/0JS/lstIPq9VKpLAOjVoPCkr3ch?=
 =?us-ascii?Q?zwyh8FlsDqg0rU+QH+EFlg3HfgxKIaPLIrW0jO0Br/KUfSuZy6SLwKeV0InF?=
 =?us-ascii?Q?PHxuWz++lfvb3wgb2XOFmvtckSCl6+DVR5O3exn3QHq0hSPOkxRGgHkzb+zH?=
 =?us-ascii?Q?ZDYLOc3w1rxak0yhYQZ7UsTHPbbp8YaDyoGQdYS2OJeA0buEnO/N6ljY1PlR?=
 =?us-ascii?Q?Y3vclNJcLmk6u2X4+82BVVcN4xnwGNtEzmjeeEOL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef13ac7-91cc-4c22-28a0-08dc6b7630d1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:37:35.0530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FkfF9d4m45QJ0nplu0/O7/1LAfNpQDKwN3kWBXFJsTX+3sl5cQp9EtWq4K8O5kN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775
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

On Thu, May 02, 2024 at 07:25:50PM +0000, Zeng, Oak wrote:
> Hi Jason,
> 
> I tried to understand how you supposed us to use hmm range fault... it seems you want us to call hmm range fault two times on each gpu page fault:
 
> 1.
> Call Hmm_range_fault first time, pfn of the fault address is set with HMM_PFN_REQ_FAULT
> Other pfns in the PREFAULT_SIZE range will be set as 0
> Hmm_range fault returns:
> 	Pfn with 0 flag or HMM_PFN_VALID flag, means a valid pfn
> 	Pfn with HMM_PFN_ERROR flag, means invalid pfn
> 
> 2.	
> Then call hmm_range_fault a second time
> Setting the hmm_range start/end only to cover valid pfns
> With all valid pfns, set the REQ_FAULT flag

Why would you do this? The first already did the faults you needed and
returned all the easy pfns that don't require faulting.

> Basically use hmm_range_fault to figure out the valid address range
> in the first round; then really fault (e.g., trigger cpu fault to
> allocate system pages) in the second call the hmm range fault.

You don't fault on prefetch. Prefetch is about mirroring already
populated pages, it should not be causing new faults.

> Do I understand it correctly?

No
 
> This is strange to me. We should already know the valid address
> range before we call hmm range fault, because the migration codes
> need to look up cpu vma anyway. what is the point of the first
> hmm_range fault?

I don't really understand why the GPU driver would drive migration off
of faulting. It doesn't make alot of sense, especially if you are
prefetching CPU pages into the GPU and thus won't get faults for them.

If your plan is to leave the GPU page tables unpopulated and then
migrate on every fault to try to achieve some kind of locality then
you'd want to drive the hmm prefetch on the migration window (so you
don't populate unmigrated pages) and hope for the best.

However, the migration stuff should really not be in the driver
either. That should be core DRM logic to manage that. It is so
convoluted and full of policy that all the drivers should be working
in the same way. 

The GPU fault handler should indicate to some core DRM function that a
GPU memory access occured and get back a prefetch window to pass into
hmm_range_fault. The driver will mirror what the core code tells it.

Jason
