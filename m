Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1587ACE7D1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 03:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE68810E0A2;
	Thu,  5 Jun 2025 01:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBrR7rnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89810E0A2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 01:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749087761; x=1780623761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CZWOYrP0yauDQ2h2C9lgJfvMSuVRPqIgNYt5I8vjZSk=;
 b=RBrR7rnwo3gps1XzSEC4OkO/Ag/tatt9z4NF//SCKvu3Y1KgOeV5Pxxv
 zmBc/3FtXGOXyBKr7Pnoek8rvf0PFhUC8zHy7ZqfM0OhgqI+QmPE7XIum
 TKb7clnEt4Zr9oaUIS8VeJFKE3Dq8FAdqNQm7KZSmkTIcNFEMjdANJHo/
 YVfyk86Ycol/B3hAbzCA86GA2XaCKsXLQMxh6ycH5vlq9igQIDoqviUVf
 fyoM3AA8BlxdL0ex6HazCED5j7GmbyXCjjXsOV1EmqqNdEx8TMtG621vs
 kbC3OVTFG1wOrgp/kXjP1AaVTasSnOARCZMFu/uLzJQ/Jr36n/Q6obfwO Q==;
X-CSE-ConnectionGUID: 4Zc0OUwURxa4HpqBHLWmDw==
X-CSE-MsgGUID: sQlqsNIfSKCvmIqg/Kx/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50307035"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="50307035"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 18:42:37 -0700
X-CSE-ConnectionGUID: F3dFQ5LMSAi6awq3NVTR+g==
X-CSE-MsgGUID: XbiD6OEFQ2q7gX7rZO+6FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="150229485"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 18:39:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 18:39:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 18:39:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.46)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 18:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p59HILs9+FY7Q5xBB2Yzbbmdwlw5ncXf0EV9rZ2S+RRGaiiESJOzuzN9l30esuFX59YbcLeaJcU01Rt1ROKZHhGfQaUdrHZulAGzggTfp8XMT4+fKX8BFvrj/R9OHTR5VQRvZjpFFc2LROASOiFcODOdL0rTo/5NguFfeLRbN3GukTifz1ZydrK8EmZRwj6MM5muN5fCN2r0fq3gTDae+LhCV2cBqFKEwMv0ljwOJ6mhnc15v8QWL5rBBESFVmSCLhHmSRwJ4FHqMXOT/AUGFJuQbOD+PZ1UIE+8UmMUwG9zEnReYGfDLuMqO03W0nOT1t+CaIxAZtQTevkmAiHKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i/rP31qF3JI9NzuuIO3GTSvtgnYf7oBvUgMayrGmH4=;
 b=aHvP+jiH3af8+VM0oKDKPmAMoQD0HUhHhWABjFuyGoRYl6D/xVfkrr1C0tDrQJby8RbsLCR//A2draZU1oLd5zL+p1s5TEUzlsBwV+9P96LkjycHDhlNdtonBh/6+Dqdx3a1ny88Xwwr7x734lqc9N/6T3KUy2FnAn2K+wEeUFSRxGvszGPGMFreGkRsB6qKQ0JZTVfbttpWNgfv6VIQNOpXUspERLv4QPhUbjBxNoOIdxFlkbpZMLwi4eC6cAaonTW1LfrHgbpS6L/ppF0dIzFkKAtrKe/wMRZ3+O2K0WJTyvTEW0Qodping+pqHSZZVfolVC6vuc4P9xV0TPkUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 5 Jun
 2025 01:39:39 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 01:39:39 +0000
Date: Wed, 4 Jun 2025 18:39:35 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <gerald.schaefer@linux.ibm.com>,
 <dan.j.williams@intel.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
 <david@redhat.com>, <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>, 
 <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
 <zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
 <balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
 <linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <John@groves.net>
Subject: Re: [PATCH 00/12] mm: Remove pXX_devmap page table bit and pfn_t type
Message-ID: <6840f557bc89f_24911009d@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff58ba6-256c-43fd-156c-08dda3d1d613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N66LU0Dw4fJJtta48YhRqz4HKa68+8V6hdIwjxdc2DwQaHQ0TwyZwtvv+PYX?=
 =?us-ascii?Q?LMr9xRk5EUMjRaOwZTuGsxeKqnO5aZ9OKfgdQigfSP+RSMppmD/EZmdnNeOI?=
 =?us-ascii?Q?g428Ltv7kCf4/vMyYYIz2QLVcuTmhJtE34KZwJWvR8lYYWlrsNKL1mqErVSH?=
 =?us-ascii?Q?w9Z8jjeSBOMhtcgHhnWU6G5uYK4MAd6cRTs/OWek64y1H8LgXVifG9NNu3YU?=
 =?us-ascii?Q?mugI0Vp0Lj5RMufMM/UUDe4DPTv1XQdRd6oAb9kGhdJA72Mxu0c1vD+RhiSs?=
 =?us-ascii?Q?QVCayP7yiED8OkWWXAzCgT5InsnfMYoD9ywtCf5ysyxw/4CAgGVndmZLN9/o?=
 =?us-ascii?Q?wYlZ02hefw6SgwR530sE16KZycbtzPdXBnnLSGD0HgKOqQvouNeLhBx2m8Gp?=
 =?us-ascii?Q?RzFIRiA/PEZqrvIkj5pYXypsji6RuZuNk3UKdpzeTpuGkX1QgxVJMKOWYgOj?=
 =?us-ascii?Q?JjGA+9FZlypOJ7MwqWGo7hYB/aMQ04RDj55x5iQcPAhbI8OH5fByEdO73v9W?=
 =?us-ascii?Q?a2pVq+uu+v4XUvKtrPg05Qn4VaIh0sl2Cq/F+j1mnUHHJgFbDVX91KnWh98t?=
 =?us-ascii?Q?ekfc2ACjYsKCnDKITr5UtpLk0xH4cH6A99a/7TvXS8s35GEGCTViPlZF+U8D?=
 =?us-ascii?Q?7FjAE9ail1BzHFFjM4YoIlkTe4txPhfnzRHG8iD+8N4Jq7lAQ/ilRD2MG/e7?=
 =?us-ascii?Q?z7e7Ir9BYF3wxXTmmMqOIvEnNf1GuG5r35z5lcHlDL4fIfJm+CAXIvmrKh8U?=
 =?us-ascii?Q?WQH/CFCAt+jGSy5uotB1AbHrxmuf1MBKbZkaGdEqNv6SrDBZXWSHqT19E9jT?=
 =?us-ascii?Q?SJ3lTTJW1DM/AeDTQkerXqGLo13nNhAuBpYARcGZqKIkmD9/c49X5DUP80b8?=
 =?us-ascii?Q?rFfD2YVCeKsLkEI6kThTfrCIH0FDouWbsLgJfCxQ2GQTHbTKIq/DbnnnfsmW?=
 =?us-ascii?Q?27EMm56SanYqtCE/L2LSnQ6dBoyHb9dXIjYsGnwqdrG1+oxFQ7hfHPQINH5J?=
 =?us-ascii?Q?rNRasyWD5o92lN4QJqLGofEpSa5JYOrRHWcPSSwy3iOnTQZxqUAC9L3Lptta?=
 =?us-ascii?Q?+0Ag/uZtlI3HJiFEdge6mcjpSlWYedY2zGNpaUmWU1GQBKqGUzKRQ/nl1dxe?=
 =?us-ascii?Q?8VqsNMHPt+XOt42CUCB7RYipRLqDYdP+5UpoIRXpDa3IynksTg1FZLj29hoG?=
 =?us-ascii?Q?gSJumivqZREp3kVhw5+IoyT9GFR6PvDyI8jxJ355qJXBMR4+ffWi4tfoHFcf?=
 =?us-ascii?Q?6H/BHIUiIqhyTQeqc7YgqwdSa7WxvwtkjV3rk/GUSs9xWW+odni2/+PP1u0a?=
 =?us-ascii?Q?cq79dAysbT/tuz1SBJiH+LIdnpSlN/IJZm/gfqxPiZ3w9dLGWcMM9ezKVpXH?=
 =?us-ascii?Q?vJxI47R5iX2sz1V1L4wgyj8G96pczaCekPCVy4CaFjVe37h3A3SzB64VMeFG?=
 =?us-ascii?Q?j4+Wslmcooc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5EqsXWYYJH5JSkAUDmIZLbfzQ+aFSlSLLjeI3H9TCAOskf2qscy+26LHcB7h?=
 =?us-ascii?Q?Q7gHRrXYKAs2JPlGyHxORoB2eJfGJOe8WboArsBOjEeAqHSXTCI3uLR+s7av?=
 =?us-ascii?Q?Y63O5lOwl669CkynerLFXClg2/2iE7qKf1gLVrn8ZMf1GeUkiKA7mX81UJHw?=
 =?us-ascii?Q?wm2KYWjW7FPQt3FYf1hI2myr6kECfcZjTev9dA7iLrHxW/kSohvItXuxEtQK?=
 =?us-ascii?Q?DIq5CI79bsbFOmtmLEG6jLmu2jKCQW5sFSVblzRTQtntp0d6lkeXrckg0h+w?=
 =?us-ascii?Q?xBsDqCZio82Uut43DiFkId0e2LAhzVBaj0Umu0SFCuYkXgtOCQE+G4n/iDNg?=
 =?us-ascii?Q?ufMZuVG2hZyDTTVoYEtZrlC1eWZJxjzjw1X6XCAhAcB7pgovY69URyoCp4oF?=
 =?us-ascii?Q?Stkw5jPNpAQTYOYUWdl9WDQHaqz0lMFED3mJ6TM/Hsz0tllYnFzS4KS/oFzP?=
 =?us-ascii?Q?ecWlc4OX0LmBJQJL6AzSLSMwEq6Su0ayoJiFNmlMFTWmeZqh9B/c5H3FOh2A?=
 =?us-ascii?Q?u9szr0sdL8ymfTUh4lhMGurgdxGL7YRApduNMPOij2W2acYRTZDj+veRvq+1?=
 =?us-ascii?Q?lz+oX+k5h9AcIS5IwpMkVKzdCWuWl0G+mIwhjhgk98NJ+2be7s3oE0pFInGz?=
 =?us-ascii?Q?AVcYOBMkw/ZtDrsAiAcTTKTRVC6ibbOYtyMyOcm3tk4ffuQ3VnE77hBOWmnc?=
 =?us-ascii?Q?1jx4xLyXFND5EfMa7XFFFxfKyf7cUk+Vl99fDqInx8SDZbvKTYE3nE3q2fXy?=
 =?us-ascii?Q?6NOs2J12vdZL5KwiqHJNh71S4ZOyrx6sLQduYh6vj5BhsuciplIA6lagVVu4?=
 =?us-ascii?Q?5/aH2QI+HbkxLSYjg+04ip9GFjJLQQM8EWRTXeL56qQ1HKU+Jbqr4lplCrs2?=
 =?us-ascii?Q?sMbc9fN7h7U/SkWkwtqUZJL3seUqSU56OgkSATrcoQQVfI/q+FbE3BsuAD50?=
 =?us-ascii?Q?N1VlG4dZCtZiCMc5gbPpvt8ThoMdtZ20KDh6hOrhI7zfqD9y3PeteGKHylmJ?=
 =?us-ascii?Q?Ip9TP4U8QXxVXqFwv0Bo4bS8Grd6POolNksjE/qEz//0Z9mSb2UgnU1pRBtR?=
 =?us-ascii?Q?vxMuj7zqA/qTNMDeT7vhYh9eTXZOp2s7wMuLpDZ4k8UKcFyPq09zHEQrV9AQ?=
 =?us-ascii?Q?LeWLLD8AZO4qLqCfQd+nf8LCly+zDIJbaJtULEo18QnHwyDiuE6QIz6eLePH?=
 =?us-ascii?Q?rsWhuvDKxmVGGC0+GAEhjnfNLjAF9MYhzx/iAmREIDiSoEPqVvullo++0i1R?=
 =?us-ascii?Q?qq+ec1+G2E7/gcRfAtBn/3GuZRGlt8Ea+lQxYOLbLDFjNr8JZd67QXbsc8Pn?=
 =?us-ascii?Q?96zdf28GJf9z2XgAmr5RB1TZ+zLWSd/IC1BAHdMCrr/5avpcgejvs9B4qAqo?=
 =?us-ascii?Q?6iwQxkjzud6j2NXP0gMov/DQUYgNq14BRNVvWSJOpBWjKI6kUnDNTb7C9UMo?=
 =?us-ascii?Q?t9gooAg1sftbx6/MPaJA7irFfYEo/oibvTSh50gk7s8iiI8NreY/xC5kTBBR?=
 =?us-ascii?Q?xl+R2+BzHJzTV95jS51USRjV1EgY/tc6g61N+2hC1cyeWV6/EhFGac0kltHo?=
 =?us-ascii?Q?ySCdXaoJJJjlu6vWCUFspPaBxWLMzpfQW8FbDCnXYZOBP3MFKYjjnNcdF8kQ?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff58ba6-256c-43fd-156c-08dda3d1d613
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:39:39.3861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQuZLWzVW61eV9XsWqc9F+3k1vPt3Kk2ZVlXlX//etK3Pdzn7Er5BIcyeqYcrFZp1CWPoR4xt4TvHR65DoNhY5kgbWFSWNVfOmxIP5oQDwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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

Alistair Popple wrote:
[..]
> Alistair Popple (12):
>   mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
>   mm: Convert pXd_devmap checks to vma_is_dax
>   mm/pagewalk: Skip dax pages in pagewalk
>   mm: Convert vmf_insert_mixed() from using pte_devmap to pte_special
>   mm: Remove remaining uses of PFN_DEV
>   mm/gup: Remove pXX_devmap usage from get_user_pages()
>   mm: Remove redundant pXd_devmap calls
>   mm/khugepaged: Remove redundant pmd_devmap() check
>   powerpc: Remove checks for devmap pages and PMDs/PUDs
>   mm: Remove devmap related functions and page table bits
>   mm: Remove callers of pfn_t functionality
>   mm/memremap: Remove unused devmap_managed_key

I am still reviewing the individual patches, but it is passing my tests
so you can add for the series:

Tested-by: Dan Williams <dan.j.williams@intel.com>
