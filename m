Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2759BC11B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 23:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE9010E10A;
	Mon,  4 Nov 2024 22:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5HrQV/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B75E10E10A;
 Mon,  4 Nov 2024 22:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730760816; x=1762296816;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fz2z7GtOrh9xNjNLYZOezJ28ZxcuINeuXAPJqPq5B64=;
 b=P5HrQV/raXgBpzIYA/Nq1TRtl+ktXP0Cjz5k7iKNqfuR5IsvJxZZSHVz
 XVZYnE/2vJsKC0TguBlN9ECtjTjZhBasGcGgVtJ3pxpHFS0Jez1CmmyaO
 7CqaptOw+ksJfqccBn+YKFTOB/47B/2t3EPyYx9Z8PPoJgvXnVqsZRVll
 heZcxbBlYsqrY8GRQFBYpyHUm4pJNLTTDeodH2Ar+qxOIlFQ6t5dCBO+F
 erw9LXw13n5hhdeWSKp9Ab7nLCUsJFnq29NabfLUto3pnI5PotsVW5bne
 bSobh64KiMH3MCL+j3DtHFTPhRYOR5ER6xmO6bv64waLDp9Xo9Bk4qN6/ Q==;
X-CSE-ConnectionGUID: u0SzZQkPTt2R05kx8FOvMQ==
X-CSE-MsgGUID: Rcvf706tRIK3+Thrq7eX+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47948598"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47948598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 14:53:35 -0800
X-CSE-ConnectionGUID: hfkGjRi/TWmdnNrUCeHBfQ==
X-CSE-MsgGUID: xs/TKrbtQX6fD2Yh3wOoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="114593823"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 14:53:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 14:53:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 14:53:29 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 14:53:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8BN5YQx/e9SeCOOKHAaeGjBFafeV8vNR3X0xEZIGVBKGhUqt0GzxpeYB7NLTctTwlWIsnhqMvYxhTZekTQqK40dtvbiGrukzdgZIUkeO0bq4s0b+sJZKN8KmTAgDvwEZhsclyITq7R7cHz4Vg3IxRsEzYm4b73aBGcplYnVqRJwZQm7N57sVh/MBMDad/wRsGTsOq5lkgyC8vY0ONLDa0Lq6zgSH3bDLCqsXH4awCjiRd6yg13ePbVW4tOWkuY3Tg8PtXAtP60UckR/J6bpyWB7j3QjIzlsFLbTQkRi9gvkw1HzQFKk4NqZNo5mYmn7AkYZlVyHifbIaatHJmRwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/JMvsGFyuX32PiGy9fRWIp8nfe9RAAYMR7tMZ0lm6g=;
 b=cP2FafERRM3V4g+INRW8jtt8n0gBpc/pzQC50+6HLUkTN5FFrcR6goZSTSyjCp3m3NaDTLT8qI1bkXx2eRzUQGMUeuRqKWkUJnl4lt/UpBUGUf8ITOHlbv0IS0DsGbSQQNv2rMQgxBZ+w3zE9IdgSb2Nf8C1Wv/AmhY3vs+/H/9dwqcjsjeBA9m5SVvmaIzWH4qxR8ElLkrxoc7yoobQgCQZCkj7T+1vyrlQl5p05hy6VtW3mOC8pI1nH4uwf6PMPEcsYu6mfVCn+rLaTWSaTC8thglCWvU2PxpOBV8wVwbWDUMjKrcQ+ykp04MUq1AJOWoOTBxFdMKMpgDJfKfL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 22:53:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 22:53:27 +0000
Date: Mon, 4 Nov 2024 14:53:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZylQhiekD3O5hrDu@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
 <0d19a2b45342ba997a53055911add7c0a4d1b5ac.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d19a2b45342ba997a53055911add7c0a4d1b5ac.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: fee2e586-45bd-4b3c-d163-08dcfd237e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rEqr1nSyZOZ2imfM8kvrVOBKvQo2pir4KfC75B/tC/SRkYgYh1abU446iA?=
 =?iso-8859-1?Q?go828MGC9w6hofuXBN/42/yVmPhsQ1cQZmT8p8VXn3WI3QxFkapdP9YtZ0?=
 =?iso-8859-1?Q?gZejvCt432P5m3QLLgCypzECCcJNtCRKZR/Qo9p1aDRY2DWETSVsUScjCU?=
 =?iso-8859-1?Q?HaWbBOfnKyj9QlDnG5+5udDKYSl/ZYMg5J8ZTRzJAjFqj9X0tdK/5Wsw+r?=
 =?iso-8859-1?Q?RmxWyrnvKXQJ5/hG0Cj1L0FMHXEDzRsKAvCJLufSTsbm0fnUelp/8MHoRh?=
 =?iso-8859-1?Q?BOma9yCxhO2C/hvOuUZk7PqHpqtkDyqjKL3YHE/QwkdiJEv5W6XfPhtgOK?=
 =?iso-8859-1?Q?e2dP7P2eOaipVojE1CFafsWIRT+QkGhWwG2fUdJrVYsm1WbDcl4JqWb2LE?=
 =?iso-8859-1?Q?jUpSBh9DGhJIxf9sX1fZjb0a0uTzmPMwHb9YxOwdBYe3ORN8bzeyK8YCzf?=
 =?iso-8859-1?Q?S9ERzmjpHZhQcRFGGh66wLWZqmc0Htd/WjDKFBBqtvqdr1+5rI3OPIWKJA?=
 =?iso-8859-1?Q?XrCUHoaQXBehWAXEmzTYg6Ol4pNuA2IXJYdxa2jB1nlh2tuRelrNkr4hpG?=
 =?iso-8859-1?Q?e3t5tjMPe4XT5O3H8dZGka1C9XCgBujIEBXl/swD9nXhi4DLlkuswQkRAD?=
 =?iso-8859-1?Q?XsfICSlYi2aXRX0hI0yNKv9DkArdSQoBnocmZrt5bZ+b4hGYM1FkDntr4a?=
 =?iso-8859-1?Q?R5h6P7J39yP5YcPd08ZLzOKX7lR90rnh9Yp8vxoYjdBuzLSOOlwWfdPpv/?=
 =?iso-8859-1?Q?/vPumymkvShLC0zQW4WPJhIjjJoJcn1FYXfvPRuSYtvfXZAm/KtL+n+sOi?=
 =?iso-8859-1?Q?HMBtBcHpxMo4Wv52H+gLyDdwjjQxIyyiBv98+XhbWOUpBGlPJsla6wFDuq?=
 =?iso-8859-1?Q?uBBLOHC2Si6Nj4tJX5rtuJxEf4beWuPFgp3F0ihCmT4tgreRvhNN+vQ3j/?=
 =?iso-8859-1?Q?DJDE35Hi4EayRR6xOK8xigZ+crf9xC8qkcYhAct9+JGy8PZUPRBiSnpIor?=
 =?iso-8859-1?Q?P3Ae1T/9CRZ/Jzt+oHXUSvjt1zfDneKmGfmKekt9PLbR6IDk6+/4nvh9Z7?=
 =?iso-8859-1?Q?xbzcgkl1xjfbpFnV72CzL3CT6YnmPS4pvnIMYyof28uEtRBSTmfsdJmbhv?=
 =?iso-8859-1?Q?zpnO6IsVv4DE85sJxaqiujJVnEV7USgsuNGPZLOiBT5ZNeGL9op/QAVgOb?=
 =?iso-8859-1?Q?4ZenoPYgYClSh9pSmrtbQ5BDzIhhiamwK66QwYCXsKR+MYc3IalL9wD92l?=
 =?iso-8859-1?Q?OCqLg+O0W4I5TlGej+N4C/FgQRh49Y0pUUk2DkSB3FD83AuETH11ZW0urs?=
 =?iso-8859-1?Q?9hxh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qe1ELVphDzU0Ra6AnT4vuSUPjflyF7np4EOAxZQ1vCo9FIc4u0Z1xkCZMV?=
 =?iso-8859-1?Q?s6I2Uqmf0q6SRA2LxJgdhbPfVv1b3eTmskNnU00ju9cheZh8vYwv8HgQW3?=
 =?iso-8859-1?Q?e5UjH/vkwCH2hWPkm2lQBrRTN1O7Ps5jg/i2cy/NDaXQTG1u+bnJTLYKsJ?=
 =?iso-8859-1?Q?xXrVVYxGfKLcZbfR/RUpfXtoQ7r8hHjtrLbk7V7ODqWgS4fL+YjiZunDUT?=
 =?iso-8859-1?Q?7B/fS0oEiak6PmIeIfIvQPfjCKaclYG0w6KdEsFLzE9oeRtxZSwz4zWOmo?=
 =?iso-8859-1?Q?x3n3LuLaa4uRT3NB20pezW77VUOi0uu2miVrDi097IKRE5Qk1SRAvFWVzJ?=
 =?iso-8859-1?Q?P5Cuxdf5Xxkv7eDCL/fDCaizGQMV3YHsX96azHRlMRYuqhuJSkXkqOhik2?=
 =?iso-8859-1?Q?21UR918wPQmVAvABE9tFxZ3bn9sjjhH/2Be/4mM0BHrRAiS6bommbCUFqp?=
 =?iso-8859-1?Q?Tca0s6m4XHzTOXlcBS1xFYYQNOdc3LGHuwRijssQrYhHqfZRhZkPWrEgAZ?=
 =?iso-8859-1?Q?MHpL0AuQQzjo8hlC9XqrI3Vujz2npcztKVJz+YyzMRSR7uZ/HD5cA26Mmh?=
 =?iso-8859-1?Q?keKyJHxvGEXjSg18uLmkqYmwsN1TX+zLWos3J8ypLqcMt7qvCZKxtaa+Le?=
 =?iso-8859-1?Q?jzIkZCTjt9F9C0hTIPrggH3K+PT5b2NqMn7op6FbKDI9DzOi1FWdp6GNtK?=
 =?iso-8859-1?Q?XbIcqanC9Oq5CAJdJsGT2scAk254XHmO8QmhoUYbD7r6yvGTSdo+KppE/9?=
 =?iso-8859-1?Q?HmYlTeZkTRdRN2xlbc97n4svTkjz5L7jwKdov0zigQTZTUWCLzYA3NOnXf?=
 =?iso-8859-1?Q?7atst0cCFf7JBRI7oU5yqSBIsp9+sK0wWZGiTgzO57S4tiwkZZz4B75W38?=
 =?iso-8859-1?Q?SxMoEu/Q1BwExmP3D8prXfzNVWNAUL6jFqS9Qjissj1IGZsrRmTrbNMsav?=
 =?iso-8859-1?Q?p0om//v7s5sP1CsozfAAWH1oQHiwgMimCHr0ZH+QNXWknrZ6DRt/pX74gD?=
 =?iso-8859-1?Q?zPk0hQ1E69zanfwQkoolTW6SRPoXSfCKZ2iE4rnlCaawNCGylxfC7/xDBA?=
 =?iso-8859-1?Q?pOQgeiiGQzmJT6Hy9PZOjC0Hm2F1CfMF7LSdJRUIRmTGLRo+yNd6YcuQ+b?=
 =?iso-8859-1?Q?hjcN0lDt+wPggaTkQUSRtOeeezpWDVdf6HFS20MTImQejFVNrFuz87X9Mq?=
 =?iso-8859-1?Q?BfpL71B92fYyEQcsau0Xtq806jg6IOJTPxfFago84vbfoNzKeIquzAWilM?=
 =?iso-8859-1?Q?PG8uJhn4Yb1xoGG5WyrJGcyyDGPH2BqT8uoGU7wHwr8rK99aH3xlELUC57?=
 =?iso-8859-1?Q?XkEWk6kmuj98b6wTWglT9UXVFMfibqc0DV35agjMhIR0oqZBDi9f/7t862?=
 =?iso-8859-1?Q?bA2OfASjsLcMu2eio8Bvcf3Dx0CKW3s+3j9AKvd/ZcmtdPP+Sx06y0Qg9F?=
 =?iso-8859-1?Q?amlCPCsr7kwvAzBbsrc9c4739/3l/Y9qJbvYA6hRaVyKN4J3mSqTvqpIMh?=
 =?iso-8859-1?Q?9B3Eqprb3S3jPPyHiSmE2Ccq2hcIZmYtxjj2WQJmhAj/SwQiWLC78bkc61?=
 =?iso-8859-1?Q?0J61NtYUd6OgruYon49tQ5g4r/1fs9B3pDUD4dOrFV7+YOsGu+3o+69iKB?=
 =?iso-8859-1?Q?bjpBM/ZFd1GE4oW6Ret23ky5b6wCdsU799C4bSjC8fJh+6ni4TSE7vGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fee2e586-45bd-4b3c-d163-08dcfd237e9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 22:53:27.1584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU8LVjjspQU6OUzSYfqIrNdErze05Yv+TZovcan7hV5ucAVuBbbHVQQRf/49oM6+/+ux1dgzNmNN8kVfO2YVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

On Thu, Oct 31, 2024 at 07:58:45PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > This patch introduces support for GPU Shared Virtual Memory (SVM) in
> > the
> > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > sharing of memory between the CPU and GPU, enhancing performance and
> > flexibility in GPU computing tasks.
> > 
> > The patch adds the necessary infrastructure for SVM, including data
> > structures and functions for managing SVM ranges and notifiers. It
> > also
> > provides mechanisms for allocating, deallocating, and migrating
> > memory
> > regions between system RAM and GPU VRAM.
> > 
> > This is largely inspired by GPUVM.
> > 
> > v2:
> >  - Take order into account in check pages
> >  - Clear range->pages in get pages error
> >  - Drop setting dirty or accessed bit in get pages (Vetter)
> >  - Remove mmap assert for cpu faults
> >  - Drop mmap write lock abuse (Vetter, Christian)
> >  - Decouple zdd from range (Vetter, Oak)
> >  - Add drm_gpusvm_range_evict, make it work with coherent pages
> >  - Export drm_gpusvm_evict_to_sram, only use in BO evict path
> > (Vetter)
> >  - mmget/put in drm_gpusvm_evict_to_sram
> >  - Drop range->vram_alloation variable
> >  - Don't return in drm_gpusvm_evict_to_sram until all pages detached
> >  - Don't warn on mixing sram and device pages
> >  - Update kernel doc
> >  - Add coherent page support to get pages
> >  - Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
> >  - Add struct drm_gpusvm_vram and ops (Thomas)
> >  - Update the range's seqno if the range is valid (Thomas)
> >  - Remove the is_unmapped check before hmm_range_fault (Thomas)
> >  - Use drm_pagemap (Thomas)
> >  - Drop kfree_mapping (Thomas)
> >  - dma mapp pages under notifier lock (Thomas)
> >  - Remove ctx.prefault
> >  - Remove ctx.mmap_locked
> >  - Add ctx.check_pages
> >  - s/vram/devmem (Thomas)
> > 
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile     |    3 +-
> >  drivers/gpu/drm/xe/drm_gpusvm.c | 2074
> > +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/drm_gpusvm.h |  447 +++++++
> >  3 files changed, 2523 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> >  create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index da80c29aa363..8d991d4a92a5 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -25,7 +25,8 @@ $(obj)/generated/%_wa_oob.c
> > $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> >  
> >  # core driver code
> >  
> > -xe-y += xe_bb.o \
> > +xe-y += drm_gpusvm.o \
> > +	xe_bb.o \
> >  	xe_bo.o \
> >  	xe_bo_evict.o \
> >  	xe_devcoredump.o \
> > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.c
> > b/drivers/gpu/drm/xe/drm_gpusvm.c
> > new file mode 100644
> > index 000000000000..1ff104d2b42c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/drm_gpusvm.c
> > @@ -0,0 +1,2074 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + *
> > + * Authors:
> > + *     Matthew Brost <matthew.brost@intel.com>
> > + */
> > +
> > +#include <linux/dma-mapping.h>
> > +#include <linux/interval_tree_generic.h>
> > +#include <linux/hmm.h>
> > +#include <linux/memremap.h>
> > +#include <linux/migrate.h>
> > +#include <linux/mm_types.h>
> > +#include <linux/pagemap.h>
> > +#include <linux/slab.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include "drm/drm_print.h"
> > +#include "drm_gpusvm.h"
> > +#include "drm_pagemap.h"
> > +
> > +/**
> > + * DOC: Overview
> > + *
> > + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> > Rendering Manager (DRM)
> > + *
> > + * The GPU SVM layer is a component of the DRM framework designed to
> > manage shared
> > + * virtual memory between the CPU and GPU. It enables efficient data
> > exchange and
> > + * processing for GPU-accelerated applications by allowing memory
> > sharing and
> > + * synchronization between the CPU's and GPU's virtual address
> > spaces.
> > + *
> > + * Key GPU SVM Components:
> > + * - Notifiers: Notifiers: Used for tracking memory intervals and
> > notifying the
> > + *		GPU of changes, notifiers are sized based on a GPU
> > SVM
> > + *		initialization parameter, with a recommendation of
> > 512M or
> > + *		larger. They maintain a Red-BlacK tree and a list of
> > ranges that
> > + *		fall within the notifier interval. Notifiers are
> > tracked within
> > + *		a GPU SVM Red-BlacK tree and list and are
> > dynamically inserted
> > + *		or removed as ranges within the interval are created
> > or
> > + *		destroyed.
> > + * - Ranges: Represent memory ranges mapped in a DRM device and
> > managed
> > + *	     by GPU SVM. They are sized based on an array of chunk
> > sizes, which
> > + *	     is a GPU SVM initialization parameter, and the CPU
> > address space.
> > + *	     Upon GPU fault, the largest aligned chunk that fits
> > within the
> > + *	     faulting CPU address space is chosen for the range
> > size. Ranges are
> > + *	     expected to be dynamically allocated on GPU fault and
> > removed on an
> > + *	     MMU notifier UNMAP event. As mentioned above, ranges
> > are tracked in
> > + *	     a notifier's Red-Black tree.
> > + * - Operations: Define the interface for driver-specific GPU SVM
> > operations
> > + *               such as range allocation, notifier allocation, and
> > + *               invalidations.
> > + * - Device Memory Allocations: Embedded structure containing enough
> > information
> > + *                              for GPU SVM to migrate to / from
> > device memory.
> > + * - Device Memory Operations: Define the interface for driver-
> > specific device
> > + *                             memory operations release memory,
> > populate pfns,
> > + *                             and copy to / from device memory.
> > + *
> > + * This layer provides interfaces for allocating, mapping,
> > migrating, and
> > + * releasing memory ranges between the CPU and GPU. It handles all
> > core memory
> > + * management interactions (DMA mapping, HMM, and migration) and
> > provides
> > + * driver-specific virtual functions (vfuncs). This infrastructure
> > is sufficient
> > + * to build the expected driver components for an SVM implementation
> > as detailed
> > + * below.
> > + *
> > + * Expected Driver Components:
> > + * - GPU page fault handler: Used to create ranges and notifiers
> > based on the
> > + *			     fault address, optionally migrate the
> > range to
> > + *			     device memory, and create GPU bindings.
> > + * - Garbage collector: Used to destroy GPU bindings for ranges.
> 
> Perhaps "clean up GPU bindings for ranges" to differentiate from
> unmapping GPU bindings for ranges which needs to be done in the
> notifier callback?
>

Let make this more clear.
 
> > Ranges are
> > + *			expected to be added to the garbage
> > collector upon
> > + *			MMU_NOTIFY_UNMAP event.
> > + */
> > +
> 
> - Notifier callback, to unmap GPU bindings for ranges.
> 

Will add something.

> > +/**
> > + * DOC: Locking
> > + *
> > + * GPU SVM handles locking for core MM interactions, i.e., it
> > locks/unlocks the
> > + * mmap lock as needed.
> > + *
> > + * GPU SVM introduces a global notifier lock, which safeguards the
> > notifier's
> > + * range RB tree and list, as well as the range's DMA mappings and
> > sequence
> > + * number. GPU SVM manages all necessary locking and unlocking
> > operations,
> 
> How difficult would it be to make this per-notifier?
> One of the design comments we got from Jason was to prioritize avoiding
> core slowdowns and any fault processing might block an unrelated
> notifier during dma mapping and page-table commit.
> I think this should at least be considered as a follow-up.
> 

I don't think it is particular hard for SVM but if userptr is built on top of
this it gets tricky. The reason being for userptr we can have an array of binds
with multiple notifiers so taking multiple notifier locks will confuse lockdep
or worse we could deadlock.

I'd say let keep it as is, see what the userptr rework looks like and then
adjust based on that.

> > + * except for the recheck of the range's sequence number
> > + * (mmu_interval_read_retry) when the driver is committing GPU
> > bindings. This
> 
> Perhaps add a discussion on valid pages rather than valid sequence
> number, since the sequence number might be bumped even if pages stay
> valid for the range, as the sequence number spans the whole notifier.
> 

Yes. Good idea.

> > + * lock corresponds to the 'driver->update' lock mentioned in the
> > HMM
> > + * documentation (TODO: Link). Future revisions may transition from
> > a GPU SVM
> > + * global lock to a per-notifier lock if finer-grained locking is
> > deemed
> > + * necessary.
> > + *
> > + * In addition to the locking mentioned above, the driver should
> > implement a
> > + * lock to safeguard core GPU SVM function calls that modify state,
> > such as
> > + * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove.
> > Alternatively,
> > + * these core functions can be called within a single kernel thread,
> > for
> > + * instance, using an ordered work queue.
> 
> I don't think not we should encourage the use of ordered workqueues to
> protect data / state? Locks should really be the preferred mechanism?
> 

Let me drop this comment.

> >  This lock is denoted as
> > + * 'driver_svm_lock' in code examples. Finer grained driver side
> > locking should
> > + * also be possible for concurrent GPU fault processing within a
> > single GPU SVM.
> 
> GPUVM (or rather the gem part of GPUVM that resides in drm_gem.h)
> allows for the driver to register a lock map which, if present, is used
> in the code to assert locks are correctly taken.
> 

So something like drm_gem_gpuva_set_lock? Sure. I think really the only
functions which need this assert are the range insert and removal functions
though IIRC from my fined grained locking (concurrent GPU fault processing)
prototype. I guess I could just add it everywhere in this version and adjust
when we land finer grained locking.

> In the xe example, if we're using the vm lock to protect, then we could
> register that and thoroughly annotate the gpusvm code with lockdep
> asserts. That will probably help making the code a lot easier to
> maintain moving forward.
> 
> > + */
> > +GPUVM (or rGPUVM (or rather the gem part of GPUVM that resides in
> > drm_gem.h) allows for the driver to register a lock map which, if
> > present, is used in the code to assert locks are correctly taken.
> 
> > In the xe example, if we're using the vm lock to protect, then we
> > could register that and thoroughly annotate the gpusvm code with
> > lockdep asserts. That will probably help making the code a lot easier
> > to maintain moving forward.GPUVM (or rather the gem part of GPUVM
> > that resides in drm_gem.h) allows for the driver to register a lock
> > map which, if present, is used in the code to assert locks are
> > correctly taken.
> 
> > In the xe example, if we're using the vm lock to protect, then we
> > could register that and thoroughly annotate the gpusvm code with
> > lockdep asserts. That will probably help making the code a lot easier
> > to maintain moving forward.ather the gem part of GPUVM that resides
> > in drm_gem.h) allows for the driver to register a lock map which, if
> > present, is used in the code to assert locks are correctly taken.
> 
> In the xe example, if we're using the vm lock to protect, then we could
> register that and thoroughly annotate the gpusvm code with lockdep
> asserts. That will probably help making the code a lot easier to
> maintain moving forward.

See above, agree.

> > +/**
> > + * DOC: Migrataion
> 
> s/Migrataion/Migration/
> 

Opps. Will fix.

> > + *
> > + * The migration support is quite simple, allowing migration between
> > RAM and
> > + * device memory at the range granularity. For example, GPU SVM
> > currently does not
> > + * support mixing RAM and device memory pages within a range. This
> > means that upon GPU
> > + * fault, the entire range can be migrated to device memory, and
> > upon CPU fault, the
> > + * entire range is migrated to RAM. Mixed RAM and device memory
> > storage within a range
> > + * could be added in the future if required.
> > + *
> > + * The reasoning for only supporting range granularity is as
> > follows: it
> > + * simplifies the implementation, and range sizes are driver-defined
> > and should
> > + * be relatively small.
> > + */
> > +
> > +/**
> > + * DOC: Partial Unmapping of Ranges
> > + *
> > + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by
> > CPU resulting
> > + * in MMU_NOTIFY_UNMAP event) presents several challenges, with the
> > main one
> > + * being that a subset of the range still has CPU and GPU mappings.
> > If the
> > + * backing store for the range is in device memory, a subset of the
> > backing store has
> > + * references. One option would be to split the range and device
> > memory backing store,
> > + * but the implementation for this would be quite complicated. Given
> > that
> > + * partial unmappings are rare and driver-defined range sizes are
> > relatively
> > + * small, GPU SVM does not support splitting of ranges.
> > + *
> > + * With no support for range splitting, upon partial unmapping of a
> > range, the
> > + * driver is expected to invalidate and destroy the entire range. If
> > the range
> > + * has device memory as its backing, the driver is also expected to
> > migrate any
> > + * remaining pages back to RAM.
> > + */
> > +
> > +/**
> > + * DOC: Examples
> > + *
> > + * This section provides two examples of how to build the expected
> > driver
> > + * components: the GPU page fault handler and the garbage collector.
> > A third
> > + * example demonstrates a sample invalidation driver vfunc.
> > + *
> > + * The generic code provided does not include logic for complex
> > migration
> > + * policies, optimized invalidations, fined grained driver locking,
> > or other
> > + * potentially required driver locking (e.g., DMA-resv locks).
> > + *
> > + * 1) GPU page fault handler
> > + *
> > + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct
> > drm_gpusvm_range *range)
> > + *	{
> > + *		int err = 0;
> > + *
> > + *		driver_alloc_and_setup_memory_for_bind(gpusvm,
> > range);
> > + *
> > + *		drm_gpusvm_notifier_lock(gpusvm);
> > + *		if (drm_gpusvm_range_pages_valid(range))
> > + *			driver_commit_bind(gpusvm, range);
> > + *		else
> > + *			err = -EAGAIN;
> > + *		drm_gpusvm_notifier_unlock(gpusvm);
> > + *
> > + *		return err;
> > + *	}
> > + *
> > + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, u64
> > fault_addr,
> > + *			     u64 gpuva_start, u64 gpuva_end)
> > + *	{
> > + *		struct drm_gpusvm_ctx ctx = {};
> > + *		int err;
> > + *
> > + *		driver_svm_lock();
> > + *	retry:
> > + *		// Always process UNMAPs first so view of GPU SVM
> > ranges is current
> > + *		driver_garbage_collector(gpusvm);
> > + *
> > + *		range = drm_gpusvm_range_find_or_insert(gpusvm,
> > fault_addr,
> > + *							gpuva_start,
> > gpuva_end,
> > + *						        &ctx);
> > + *		if (IS_ERR(range)) {
> > + *			err = PTR_ERR(range);
> > + *			goto unlock;
> > + *		}
> > + *
> > + *		if (driver_migration_policy(range)) {
> > + *			devmem = driver_alloc_devmem();
> > + *			err = drm_gpusvm_migrate_to_devmem(gpusvm,
> > range,
> > + *							  
> > devmem_allocation,
> > + *							   &ctx);
> > + *			if (err)	// CPU mappings may have
> > changed
> > + *				goto retry;
> > + *		}
> > + *
> > + *		err = drm_gpusvm_range_get_pages(gpusvm, range,
> > &ctx);
> > + *		if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > EPERM) {	// CPU mappings changed
> > + *			if (err == -EOPNOTSUPP)
> > + *				drm_gpusvm_range_evict(gpusvm,
> > range);
> > + *			goto retry;
> > + *		} else if (err) {
> > + *			goto unlock;
> > + *		}
> > + *
> > + *		err = driver_bind_range(gpusvm, range);
> > + *		if (err == -EAGAIN)	// CPU mappings changed
> > + *			goto retry
> > + *
> > + *	unlock:
> > + *		driver_svm_unlock();
> > + *		return err;
> > + *	}
> > + *
> > + * 2) Garbage Collector.
> > + *
> > + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> > + *					struct drm_gpusvm_range
> > *range)
> > + *	{
> > + *		assert_driver_svm_locked(gpusvm);
> > + *
> > + *		// Partial unmap, migrate any remaining device
> > memory pages back to RAM
> > + *		if (range->flags.partial_unmap)
> > + *			drm_gpusvm_range_evict(gpusvm, range);
> > + *
> > + *		driver_unbind_range(range);
> > + *		drm_gpusvm_range_remove(gpusvm, range);
> > + *	}
> > + *
> > + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> > + *	{
> > + *		assert_driver_svm_locked(gpusvm);
> > + *
> > + *		for_each_range_in_garbage_collector(gpusvm, range)
> > + *			__driver_garbage_collector(gpusvm, range);
> > + *	}
> > + *
> > + * 3) Invalidation driver vfunc.
> > + *
> > + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> > + *				 struct drm_gpusvm_notifier
> > *notifier,
> > + *				 const struct mmu_notifier_range
> > *mmu_range)
> > + *	{
> > + *		struct drm_gpusvm_ctx ctx = { .in_notifier = true,
> > };
> > + *		struct drm_gpusvm_range *range = NULL;
> > + *
> > + *		driver_invalidate_device_tlb(gpusvm, mmu_range-
> > >start, mmu_range->end);
> > + *
> > + *		drm_gpusvm_for_each_range(range, notifier,
> > mmu_range->start,
> > + *					  mmu_range->end) {
> > + *			drm_gpusvm_range_unmap_pages(gpusvm, range,
> > &ctx);
> > + *
> > + *			if (mmu_range->event != MMU_NOTIFY_UNMAP)
> > + *				continue;
> > + *
> > + *			drm_gpusvm_range_set_unmapped(range,
> > mmu_range);
> > + *			driver_garbage_collector_add(gpusvm, range);
> > + *		}
> > + *	}
> > + */
> > +
> > +#define DRM_GPUSVM_RANGE_START(_range)	((_range)->va.start)
> > +#define DRM_GPUSVM_RANGE_END(_range)	((_range)->va.end - 1)
> > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node, u64,
> > rb.__subtree_last,
> > +		     DRM_GPUSVM_RANGE_START, DRM_GPUSVM_RANGE_END,
> > +		     static __maybe_unused, range);
> > +
> > +#define DRM_GPUSVM_NOTIFIER_START(_notifier)	((_notifier)-
> > >interval.start)
> > +#define DRM_GPUSVM_NOTIFIER_END(_notifier)	((_notifier)-
> > >interval.end - 1)
> > +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node, u64,
> > +		     rb.__subtree_last, DRM_GPUSVM_NOTIFIER_START,
> > +		     DRM_GPUSVM_NOTIFIER_END, static __maybe_unused,
> > notifier);
> 
> Did you look at removing these instantiations after the RFC comments,
> and instead embed a struct interval_tree_node?
> 

Both gpu vm an xe_range_fence define an interval tree like this so figured it
was fine but also some of this was lazyness on my part.

> Perhaps the notifier tree could use a maple tree?
> 

Let me in earnest follow up on using a maple tree. My understanding is a maple
tree is designed for exactly this (VA tracking) and the only reason GPU VM
doesn't use it is because it has memory allocations which break the dma-fencing
rules. I think there is a version on GPU VM out there with a maple tree so I
don't have to think to hard about this.

> > +
> > +/**
> > + * npages_in_range() - Calculate the number of pages in a given
> > range
> > + * @start__: The start address of the range
> > + * @end__: The end address of the range
> > + *
> > + * This macro calculates the number of pages in a given memory
> > range,
> > + * specified by the start and end addresses. It divides the
> > difference
> > + * between the end and start addresses by the page size (PAGE_SIZE)
> > to
> > + * determine the number of pages in the range.
> > + *
> > + * Return: The number of pages in the specified range.
> > + */
> > +#define npages_in_range(start__, end__)	\
> > +	(((end__) - (start__)) >> PAGE_SHIFT)
> 
> Could use a static function?
> 

See my other reply [1]. Will changes macro -> functions where is makes sense.

[1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2#comment_1133611

> > +
> > +/**
> > + * struct drm_gpusvm_zdd - GPU SVM zone device data
> > + *
> > + * @refcount: Reference count for the zdd
> > + * @destroy_work: Work structure for asynchronous zdd destruction
> > + * @devmem_allocation: device memory allocation
> > + * @device_private_page_owner: Device private pages owner
> > + *
> > + * This structure serves as a generic wrapper installed in
> > + * page->zone_device_data. It provides infrastructure for looking up
> > a device
> > + * memory allocation upon CPU page fault and asynchronously
> > releasing device
> > + * memory once the CPU has no page references. Asynchronous release
> > is useful
> > + * because CPU page references can be dropped in IRQ contexts, while
> > releasing
> > + * device memory likely requires sleeping locks.
> > + */
> > +struct drm_gpusvm_zdd {
> > +	struct kref refcount;
> > +	struct work_struct destroy_work;
> > +	struct drm_gpusvm_devmem *devmem_allocation;
> > +	void *device_private_page_owner;
> > +};
> 
> I think the zdd and migration helpers should be moved to drm_pagemap.c
> We should consider looking at that once patches for drm_pagemap
> functionality are posted.
> 

We have another thread discussing this. Let's continue this there.

Matt

> 
> TBC
> /Thomas
> 
