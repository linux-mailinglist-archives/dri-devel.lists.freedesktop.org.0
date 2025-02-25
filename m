Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902AA449ED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825E710E78C;
	Tue, 25 Feb 2025 18:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5IEfGg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4B510E78C;
 Tue, 25 Feb 2025 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740507344; x=1772043344;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2HjpJcD1l0LXoAD5KAnbpPSjnp87xhPPUk++xyekpms=;
 b=i5IEfGg3rf9wqjOtPPe/WDwEJYFG4G6+nPZzbFMt7Lgvl0V/BPHUgYVq
 G2RjJgUENwiEuMSd4bPOzOsKVNSQCsEFjuc2pGYV+8JWQaGtgsv6snynW
 luV7WxzsuOuZoZvPHP/L9Tymc3qsvEzApFQNCeXueRCp7vgh2eVg6oDeb
 7lalfBcMeU3HEK+BCZwTOiF3GBpLmpauF2Nl5tVOJkat1fKivxpRi5dtb
 FCMVI75lWYpMc9+52OS9mdVHgmDuc96ZdlLmSdmWLY874oDhbKkej90sm
 8ShmIMnE9Wmvid1N1jiJZh+8n2OlI6YLy1nrIXb9DFc54ehRLU3ZeAmxW A==;
X-CSE-ConnectionGUID: iYHP2xrIQdeSZx4iwOVdig==
X-CSE-MsgGUID: 9kJe/B/hQc+LIAZp3RhwHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41245064"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41245064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:15:32 -0800
X-CSE-ConnectionGUID: vN4RH+5+RtSLckzcKlsmsg==
X-CSE-MsgGUID: 2SgJnS0SR5KqckBbGyUBxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="117079173"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 10:15:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 10:15:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 10:15:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 10:15:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc2Uf2esNA2fglr+T52/8ssl9LADv++oFk/5S6wZaBmpF9bG6QgJSjw/x98yos80YKI0eOJ+lYzfppmhCUBCLNSLIb9AvQNWGYNlyw/M+QM/s2hUkkT7YlRsBcJf5/KNcCqKAD9noZI1goXir4Zl0Myt7PKE/n8c3NTxi5nsYhpBnZk3N7JyUBzRqU5Uok5eDN+26gcYw71BGnIljIqt+CWYTF+Ay++A5RJD9UL+cXSSsLpxoYwBozP+dI0P5+2KDFdhwPn1oWUHnPP7Zl1CW5u6m1stfsrQWEwcYMW8cPbLgmxg+LzCsK4v91Qubx3HXWEmt5tisIxGo4/3MxGs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HxSU5c7dM/oXYmIOOY5b4rlalNXTCc1NOVuNifoNrE=;
 b=KWuwZFYRpoEH638i8JS0l2gWsLpFVCzKberLf6pUNw6Xpwv7BBdfgyRpdnnmWrq2uQ7TxUJhvOZpzlUn0cOK6drPzxM1KdWfaw9C+S1yQz3JZucVpGGPZgkiFKseYzTkOupaFhROPr7FR37Zmw9wD5jxeejc09qW5lX08ruxbzFn8fjVxdce8FMYKF2AKywW1CfS+NxCmFLTXh6NHHn4IUqnRgoEnN3GMDqQZGdQKb8knzGJI9l/hB43R3ArARSaMF4OFl2cCLCReX+8/bdOnu266r1kQ2CpqZzbWFi7FT8bTBov0/LmK19WGL1QclCWAnIflFTSjHHiAJkntnm2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 18:15:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 18:15:21 +0000
Date: Tue, 25 Feb 2025 10:16:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v6 06/32] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <Z74I+Qq4QvnY7tjo@lstrano-desk.jf.intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-7-matthew.brost@intel.com>
 <bf92727d-8d06-4fd4-9908-cfce46a8afb0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf92727d-8d06-4fd4-9908-cfce46a8afb0@intel.com>
X-ClientProxiedBy: MW2PR16CA0025.namprd16.prod.outlook.com (2603:10b6:907::38)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5963ae-5761-46bb-3fdd-08dd55c85dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aw+sEHURtGncQOKCX+8GVUOqCMpkyBpXvQZ4CxP2hjeVPzD7MmOZ7h6S6u?=
 =?iso-8859-1?Q?GFDbc91lj2KRePiTPJWEELd750fDC2kh1KdNJJPvMxVCJBXRJwAkChOXBo?=
 =?iso-8859-1?Q?X2Nmn6emNwtZOToHjjJifaE/pGpgZ/E60D5gG0ieBO2mpGnUney9lhbDgR?=
 =?iso-8859-1?Q?UZmExdXON83n4tX6OufVcIrl0nM8emwkdDybG4MDtMjt395hqHTzLJg6Q3?=
 =?iso-8859-1?Q?ufaJGrkdJEWjZwF2YtmLUSonKXHjl6KBJJ8fJx11RmXDquyk7EDlKadxBi?=
 =?iso-8859-1?Q?irkWVaxdLBy8OmQYX0nGTenmUOtZ2yNZTJ6L/KAO+1omz4GPGZKdxF9fRA?=
 =?iso-8859-1?Q?t8AZeJu50RbnLw3ujjNEZ6O0LSY6OMnzwzz6uVc8JD6SH+h82Yah9sBZQb?=
 =?iso-8859-1?Q?pleOdHun1VrqPCIh83/ES1BkQCU/2BGYfj8I5zV6CW8NDSUCmOZI88+o5v?=
 =?iso-8859-1?Q?KmSIoqI/e4ou8yiqWnMgv74nl+dx4ALU+VKS59DCtWfh+rfFiQ/HGAbDJN?=
 =?iso-8859-1?Q?ar6U1b9ay/L17LQFKrWnNDucbqiQFo2KZx2mW6IN4w/96i1QD7uSWqOyH8?=
 =?iso-8859-1?Q?oBu1P2rurV905oMN/0ju8wGRsYSpu+qt+4BgZb/Eyr5sfbAFfOXO0zr5tU?=
 =?iso-8859-1?Q?vO3cc4GaBqVPVtQwj85g8hjDTxKRkd9Lox5lMhPJyyESewzPShSYBW45l4?=
 =?iso-8859-1?Q?JuLOLMX0SDrPn5axrDnANYIpgkry9XUgCyledISJVTxwjJ8GKl7AoXnegL?=
 =?iso-8859-1?Q?iKeN29j2dBWnOirt5KKiAeFF4LN8LzoZivXpzu9RZGyRgWLWC0CoIMyXKI?=
 =?iso-8859-1?Q?YiywyOhv1rCRxXZt1fOaSrFGQ2Fu3AiV9EKllKeMY8jbUrYMbe5ZQxpEDQ?=
 =?iso-8859-1?Q?lV6emG1VGt6e+batYtiaLxYXq8vElvFsogZ6M7q6vxdzk+GLKs8X6MCtBc?=
 =?iso-8859-1?Q?/RCkOm1XHVkkrWN6UIk84HjbYgB7C/k/Fhou1I9txv5nVRKj/8MgJ/V7ts?=
 =?iso-8859-1?Q?mcfuz6S7plNLgbmFwD71tKCl4OQrGrelT8CRdrLCx0yllWuPvRM/q7JkZR?=
 =?iso-8859-1?Q?iot3+MqcQ5M0Yyzed2b7N0qQk+h+t4uX62xoA2bqpNzqU0l43u2JVbrvZN?=
 =?iso-8859-1?Q?TBoWUvANepYW5rv2xfpzTDSfCgv9YyzVkBHtHM84devHp4I9hNWU0WvoKQ?=
 =?iso-8859-1?Q?fYSgKS9d9660F9zB1GAmnKlqxlFOMhcGxq+dHPqFwWfixdFvqlyYrN/Nll?=
 =?iso-8859-1?Q?eiMiN8aIfdJhxqfoRiXjcByFUz9yZ0kUJyuyF6quX4QenNqdR/wbTwhCXx?=
 =?iso-8859-1?Q?yrwcT+dClwPRhKtRfy9sYIZ3V6JlKpbasoguNe+HqNX1MiAnYGebLBwEdf?=
 =?iso-8859-1?Q?6P77xr1BMO2mZSJ0m+DLXPfBpK0Qmk5ZnAhkvuVeFQIYfFtioUNCSx7PI1?=
 =?iso-8859-1?Q?JLO5J4SLgUgTO0qz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hKcN4zZ01gkZhLLqne+ERPhOPCN2CrZJGv3NyoZaKVQAv34jDPt7ivt2gZ?=
 =?iso-8859-1?Q?SJ31Sy5XF0NiZIwjajQ8OGCx16KCYeEiYoZFbtww7TnJeklNLQWUC1lOhY?=
 =?iso-8859-1?Q?Xv7Tv56HeY41OP8NEKNmSnmbHojIWWZ2P9V2g3A8uC375wQIXtSwUO1epW?=
 =?iso-8859-1?Q?3v7KCjfRzfk682HLju3GQuGVnb4dqMX2NaSlXTg/O1Gw3Q2G2gcCB3IUr6?=
 =?iso-8859-1?Q?owVrYAwB2ltfFeXHFS+KKVyJGOxmlQgAks28dI38UgVGU5GtI5o/G+1LyS?=
 =?iso-8859-1?Q?fecj7/56gIs/gA/N8/98l6xF+poeWyi/lVcBmvr92VWKbraH6/CGufkr93?=
 =?iso-8859-1?Q?VIH+HLQVZm0d/OLTF1Yfb4Hogu7Gue0aOcAOlQ24kmgUyeABrJnP8TLWe3?=
 =?iso-8859-1?Q?AbvjnyGAL9ENw4wEPMamXPTU1IiCmspcEc5WwEzRTVdDgGXDEDYXUSRUnA?=
 =?iso-8859-1?Q?e2jVENjlEPOCdDuJnYBGORLvRfMMzDWxwDxH+5hWrIW/lEDLftnT0C+wNN?=
 =?iso-8859-1?Q?bHkHjU7pUckBylfIOvWR59+ZTnJe4zFaJxRzS2AXNS6bGXmFHkfiojk+2L?=
 =?iso-8859-1?Q?C2fzc7wIyrxYo9CQ0JC32CjJTR2kmQwaloe9gS3mxOIyqh0TkJakl+iOyj?=
 =?iso-8859-1?Q?BQVsNY+eL5PyL7jd9kzT3c4vTrkPD+i3DjTrYcrEUiADhK6in9POSkQNoZ?=
 =?iso-8859-1?Q?A3perNBVVsijfm4LQCI2wamKiXFO/sfXDIrMFv2A1Vz4nvwIYtp89Lmr+O?=
 =?iso-8859-1?Q?OYMsZs1UrwhrYGsf4K0+mrPGfmpaeZ6z7Ef+Gkgvl+kcFMzq6o9kHd8ERc?=
 =?iso-8859-1?Q?HiATAL0PXlB4YjriuIbbYRs7MqmXGMUo9M5CmzpdEl7+H0jnK+8eP7dhjs?=
 =?iso-8859-1?Q?iO9XDGEfItmes1zdTWyPje4SmNnTwsl7qqkIEV5l2tCvxPJbu8+1rKh8kn?=
 =?iso-8859-1?Q?vkxnSnxfEBOub+Fj4lwtEaBD5Rvj4EezIL/TdbUHOOMFQuFwF1EESDeMf5?=
 =?iso-8859-1?Q?ev0VTwzCefUDAiC346F4ijMnD3k2WM2FCNvaotWZwMT/WpP+xhheZsZtIM?=
 =?iso-8859-1?Q?PoGHeEHWoY7LP7dsbgkWfBtetbSc3GStcnr3JTb8/bx9D4lfWM2ZX4w3/B?=
 =?iso-8859-1?Q?HNXcewWkRijl8u9KGHSDlmTPqFMyGUFNAhaMkRFN64ejvgFp/aVncssdX7?=
 =?iso-8859-1?Q?1q4RAkCs9CI6seqdvMKltPSZ7XM+lnl7raxI6/efQd3xdPi2k1oakZAQpt?=
 =?iso-8859-1?Q?kQTRtS6+rGk1pBVfNnCNwic0B0bu3ytuH3bhifZ5ttCYAgynRXpKxvZupr?=
 =?iso-8859-1?Q?ZK66XAamlA8h0I2XgvYk/7lfAZfnIbPsFFGhNnTwpYBTwD/+ZOh9wcO4Ny?=
 =?iso-8859-1?Q?y/j+AD5XrGhlvSYP2/eECSEhO2YWRJ4c+7gt1DOF5POKznNY9lIV4eSDFV?=
 =?iso-8859-1?Q?xCKJ/XqqB7HDXpylgT+mM1WhH4rGZkCFE31zN7COOGDFdc4UJawRxi9VTa?=
 =?iso-8859-1?Q?Zge8Xm4HxhYmg0K5AOpOPecROhZBYrLOY84pm5nZz8MNPwEmvbF/6vzS4Z?=
 =?iso-8859-1?Q?cuDUWM1SZ2yZGm8lIdKCouhKP5/yw33e3A39tHPWrxqo9damo3a4n7sCWe?=
 =?iso-8859-1?Q?krkBKu4qD+idjhwSxk1WRlb6CJYcARAFFgrivTTGe3DkpZs+92vWIYMQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5963ae-5761-46bb-3fdd-08dd55c85dfc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 18:15:21.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFjgHb3k6AUAdwrVkSN/OEJok9LwGHAHsrNNZu9RULE9/JUuxsJ2EK/vaLErEvfw7Wq3JTRO0DkHIEl3Ulzchg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-OriginatorOrg: intel.com
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

On Tue, Feb 25, 2025 at 03:14:23PM +0000, Matthew Auld wrote:
> On 25/02/2025 04:42, Matthew Brost wrote:
> > This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > sharing of memory between the CPU and GPU, enhancing performance and
> > flexibility in GPU computing tasks.
> > 
> > The patch adds the necessary infrastructure for SVM, including data
> > structures and functions for managing SVM ranges and notifiers. It also
> > provides mechanisms for allocating, deallocating, and migrating memory
> > regions between system RAM and GPU VRAM.
> > 
> > This is largely inspired by GPUVM.
> > 
> > v2:
> >   - Take order into account in check pages
> >   - Clear range->pages in get pages error
> >   - Drop setting dirty or accessed bit in get pages (Vetter)
> >   - Remove mmap assert for cpu faults
> >   - Drop mmap write lock abuse (Vetter, Christian)
> >   - Decouple zdd from range (Vetter, Oak)
> >   - Add drm_gpusvm_range_evict, make it work with coherent pages
> >   - Export drm_gpusvm_evict_to_sram, only use in BO evict path (Vetter)
> >   - mmget/put in drm_gpusvm_evict_to_sram
> >   - Drop range->vram_alloation variable
> >   - Don't return in drm_gpusvm_evict_to_sram until all pages detached
> >   - Don't warn on mixing sram and device pages
> >   - Update kernel doc
> >   - Add coherent page support to get pages
> >   - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
> >   - Add struct drm_gpusvm_vram and ops (Thomas)
> >   - Update the range's seqno if the range is valid (Thomas)
> >   - Remove the is_unmapped check before hmm_range_fault (Thomas)
> >   - Use drm_pagemap (Thomas)
> >   - Drop kfree_mapping (Thomas)
> >   - dma mapp pages under notifier lock (Thomas)
> >   - Remove ctx.prefault
> >   - Remove ctx.mmap_locked
> >   - Add ctx.check_pages
> >   - s/vram/devmem (Thomas)
> > v3:
> >   - Fix memory leak drm_gpusvm_range_get_pages
> >   - Only migrate pages with same zdd on CPU fault
> >   - Loop over al VMAs in drm_gpusvm_range_evict
> >   - Make GPUSVM a drm level module
> >   - GPL or MIT license
> >   - Update main kernel doc (Thomas)
> >   - Prefer foo() vs foo for functions in kernel doc (Thomas)
> >   - Prefer functions over macros (Thomas)
> >   - Use unsigned long vs u64 for addresses (Thomas)
> >   - Use standard interval_tree (Thomas)
> >   - s/drm_gpusvm_migration_put_page/drm_gpusvm_migration_unlock_put_page (Thomas)
> >   - Drop err_out label in drm_gpusvm_range_find_or_insert (Thomas)
> >   - Fix kernel doc in drm_gpusvm_range_free_pages (Thomas)
> >   - Newlines between functions defs in header file (Thomas)
> >   - Drop shall language in driver vfunc kernel doc (Thomas)
> >   - Move some static inlines from head to C file (Thomas)
> >   - Don't allocate pages under page lock in drm_gpusvm_migrate_populate_ram_pfn (Thomas)
> >   - Change check_pages to a threshold
> > v4:
> >   - Fix NULL ptr deref in drm_gpusvm_migrate_populate_ram_pfn (Thomas, Himal)
> >   - Fix check pages threshold
> >   - Check for range being unmapped under notifier lock in get pages (Testing)
> >   - Fix characters per line
> >   - Drop WRITE_ONCE for zdd->devmem_allocation assignment (Thomas)
> >   - Use completion for devmem_allocation->detached (Thomas)
> >   - Make GPU SVM depend on ZONE_DEVICE (CI)
> >   - Use hmm_range_fault for eviction (Thomas)
> >   - Drop zdd worker (Thomas)
> > v5:
> >   - Select Kconfig deps (CI)
> >   - Set device to NULL in __drm_gpusvm_migrate_to_ram (Matt Auld, G.G.)
> >   - Drop Thomas's SoB (Thomas)
> >   - Add drm_gpusvm_range_start/end/size helpers (Thomas)
> >   - Add drm_gpusvm_notifier_start/end/size helpers (Thomas)
> >   - Absorb drm_pagemap name changes (Thomas)
> >   - Fix driver lockdep assert (Thomas)
> >   - Move driver lockdep assert to static function (Thomas)
> >   - Assert mmap lock held in drm_gpusvm_migrate_to_devmem (Thomas)
> >   - Do not retry forever on eviction (Thomas)
> > v6:
> >   - Fix drm_gpusvm_get_devmem_page alignment (Checkpatch)
> >   - Modify Kconfig (CI)
> >   - Compile out lockdep asserts (CI)
> > 
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/Kconfig      |    9 +
> >   drivers/gpu/drm/Makefile     |    1 +
> >   drivers/gpu/drm/drm_gpusvm.c | 2236 ++++++++++++++++++++++++++++++++++
> >   include/drm/drm_gpusvm.h     |  507 ++++++++
> >   4 files changed, 2753 insertions(+)
> >   create mode 100644 drivers/gpu/drm/drm_gpusvm.c
> >   create mode 100644 include/drm/drm_gpusvm.h
> > 
> 
> <snip>
> 
> > +/**
> > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: MMU interval notifier
> > + * @itree: Interval tree node for the notifier (inserted in GPU SVM)
> > + * @entry: List entry to fast interval tree traversal
> > + * @root: Cached root node of the RB tree containing ranges
> > + * @range_list: List head containing of ranges in the same order they appear in
> > + *              interval tree. This is useful to keep iterating ranges while
> > + *              doing modifications to RB tree.
> 
> Build is failing here. I think just missing:
> 
> + * @flags: ....
> 

Thanks! Will fix.

Matt

> > + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> > + *                 removed
> > + *
> > + * This structure represents a GPU SVM notifier.
> > + */
> > +struct drm_gpusvm_notifier {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct mmu_interval_notifier notifier;
> > +	struct interval_tree_node itree;
> > +	struct list_head entry;
> > +	struct rb_root_cached root;
> > +	struct list_head range_list;
> > +	struct {
> > +		u32 removed : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier
> > + * @refcount: Reference count for the range
> > + * @itree: Interval tree node for the range (inserted in GPU SVM notifier)
> > + * @entry: List entry to fast interval tree traversal
> > + * @notifier_seq: Notifier sequence number of the range's pages
> > + * @dma_addr: Device address array
> > + * @dpagemap: The struct drm_pagemap of the device pages we're dma-mapping.
> > + *            Note this is assuming only one drm_pagemap per range is allowed.
> 
> Same here:
> 
> + * @flags: ....
> 
> > + * @flags.migrate_devmem: Flag indicating whether the range can be migrated to device memory
> > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> > + * @flags.has_devmem_pages: Flag indicating if the range has devmem pages
> > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> > + *
> > + * This structure represents a GPU SVM range used for tracking memory ranges
> > + * mapped in a DRM device.
> > + */
