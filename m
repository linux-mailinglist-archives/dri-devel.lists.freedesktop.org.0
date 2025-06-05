Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281C9ACF45A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 18:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509FE10E29A;
	Thu,  5 Jun 2025 16:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+83gpvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503210E2B2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749141096; x=1780677096;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBYUrqPKc2I00gSN/ufF5Qx3vkiRiXdyAyBS/pkbv8M=;
 b=F+83gpvrGHS/Uf66LsyDqhR87j6+PdQJZUzAgyo3ugZH0D/64l/6wLE8
 A+0M4Gt/z5Or3AleoFjIYoj9ICrkIGmUibVQ2R8rerbBdrjgvSMNIGlCe
 /rErVXXFw6V/Ch+rFzWKLCxn3oe4ZlnUy2IK9ggd2zmP5u9jPYz1gyEsP
 faRUev+4Nq2euyjnKXEVgD8bghM0LJt5j/bz/dpVrDkq+B7rBcrCJB+Ap
 fSLwk1+fxuJZGQdZ6JVrZSmiaa8w1Ix4vdm3KuNOiYK9RU2VLJuVuyTO+
 uDjsE4/wvvg6DxvI+qiFHXT6FakX1v0uJ/P1mm1LuQRrvr3l4gS3F0vWq w==;
X-CSE-ConnectionGUID: nMrhgavNSLmW6aM1zMaLjA==
X-CSE-MsgGUID: cM7ms+HXRBWq/Gnnj7O9vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="54935029"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="54935029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:31:35 -0700
X-CSE-ConnectionGUID: ub2WhcZAS5Kxdvilq0LDxA==
X-CSE-MsgGUID: 1wPnfQC+STiyZLE4yL/c7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176425040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:31:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:31:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:31:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 09:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laUdAWcHIYyN9rWLJcz3L1tFvAQSVzF9nNJLiFfM9zQRtOqUpGf0QZfobx6hUgqvKxdzUXI9aAITVbV+na7Yk6JDklJfqYZjtDQO6L7rxpR2Eg55B4Y2nHeHHJjuqX6ZmOX9LxAH6DcxG9U8U9ONVEXuHO0V1XP79LABR2wjp9QNqA+lPbIVNInhglsZqpxoltlgfznijNBDMpIhWLhSpB4qMbDqm8zyN5z9lqQd+6H5L1qW00SCOeFooyIsKdr+bEZTdyNuCOfixgX+ZvF/vk+oPlrPyLyKc1w/yLO+3QXrXjY64uwi0iCtdpJEJRuEFUiWCVQAl/c+faugc3vuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk6pPERnC0FEmsVvQU1C07BBO+/HCYJHro38f3lcw2w=;
 b=uHuxxSJz9M3xk5DgEZTvoVf0ThG3eBAPUGnuuI/+B0oXcMojWG92Sb0jb4FJihxYGLotCUGhY0qxAQkjeoOyx8u12NoWjFT9+vvCGuIj3utbPM9cbF73LEzvLZCIQJo/LPfwu0c7+7GbzfUFh/FkzzwgvxHDuChUbLyBAxEdOb++LknSllw2IkS5LWczFOjavAA4DA33VYZWwtdM4DoR6+r+9hOlzVyoaZjtChg0zinTYzT9pl/fVfoOUBG+akhg5Lo773iYFQmWhT2i+q4fhvn50gXSagr4APX3cUxbljLQW2ojNJXZBs3KbEPmp+u1W0Nvzt5cdxGv8lR8zIOOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB8543.namprd11.prod.outlook.com (2603:10b6:806:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 16:30:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8813.021; Thu, 5 Jun 2025
 16:30:54 +0000
Date: Thu, 5 Jun 2025 09:30:51 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Dan
 Williams" <dan.j.williams@intel.com>
CC: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <gerald.schaefer@linux.ibm.com>, <willy@infradead.org>,
 <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
 <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
 <zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
 <balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
 <linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <John@groves.net>
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <6841c63b3cb25_249110060@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605120909.GA44681@ziepe.ca>
 <897590f7-99a5-4053-8566-76623b929c7c@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <897590f7-99a5-4053-8566-76623b929c7c@redhat.com>
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2544048d-e731-4a23-86e4-08dda44e57c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sJzLfGNC240TTEUnTLxunlvkgCbaNFFhLLcLonf6LqhcZvqqKAfrdV8QO4yw?=
 =?us-ascii?Q?Bvk9EfulqrUFt4RoiOpiDLsNbTVkfU1WKZqoXfN0kScBykN7ndWffKwTrPto?=
 =?us-ascii?Q?IPQLDXcJTEvxmzJOopPxT2NOZDSQ6wHPDXa9iMv5Rg+uU0HDgDpii7IsLr01?=
 =?us-ascii?Q?pIZ4k/4YBwCoaWh1MwnaJsQd6khdas6ykrBbkNc0zTFUUBw9Ta9zKQfhgroU?=
 =?us-ascii?Q?Mo1Ob+PwzILb0fMelZ+GbPX+qpp7IAJi4s5qji+nm0setPDhv54akWswSEFz?=
 =?us-ascii?Q?tuZ2gqGgBQ0n3Pll/dGTN3UDHNLLr+ryNWpyD/NR1pIj9LoT8KCCvUL4yNWj?=
 =?us-ascii?Q?hH3qLFJ+464ttdTUwzzdZSVRbdztmtmdBswPsLKmsNzF1aCxivB75yDfKIi2?=
 =?us-ascii?Q?gCg9lq9tCbNPVM9TaGxaaMGQa6yygrsGTmeMTpc39d1NOvocE6Ul+kb+BI99?=
 =?us-ascii?Q?uWTsQMJMyJIP1m5cC9bwwPoURlML8350+yP+qMXtRrO3TkRUTtK/cunujIP/?=
 =?us-ascii?Q?Hop+Glzv6wA2PNTvohLusvknbJip4orZ9BiA4dLsQdBWTz1N3poPhu0r3jWF?=
 =?us-ascii?Q?S5cEgos6/lr32F0lnSyZIkjYdhW90y5MY5M+NqBbsLfHnKkwHXkivOFV5khf?=
 =?us-ascii?Q?yzIvLkdy21RF+VFD1cRDaAO58M23NMmMxMOxBZI/WLy5zOi2C6xg5jbVjeYW?=
 =?us-ascii?Q?X4jmSinmH3Sn5HhIeUuDT01ZcPvXNYO+tZX1k2+NOmvvmj13AD1Iw5LgZRFi?=
 =?us-ascii?Q?X+/6OSsrt2tV/hH2mySCGcqpR973T4PdqGD2v1sKwAakh40qM8NLmcFpYW61?=
 =?us-ascii?Q?LljgZfc0fT504/2BgwOlNkJ8hW84uCmGXyT4cYS9lp6i4fFundsQoxpxlaVk?=
 =?us-ascii?Q?9joTDeMWNzbrwLcvSMlnTFxrRjB5v6mF1MZIXte1vrRE9ep9ta+Ico0yNrqX?=
 =?us-ascii?Q?8fex5DTWbes1DhfZJDQdXYOWHToScplSuMqtCIK7kZKEQeBd+T86yJaspgY+?=
 =?us-ascii?Q?JmsdbJ/pEMgDwjCzkrBsfP5Ur5KyXOxQnbKdXCD4LTy6nFup2WFFWpMlP7EQ?=
 =?us-ascii?Q?xcO/2WDESGO0W8PyjaaliONWisEeZlY5TwCv8psnC85IWobz91nMfyCOh/nP?=
 =?us-ascii?Q?WRV4875mUrji11560pUc9q0wVic3puJsW/TynY9c6QhBgmUHgyCrSghWhnDq?=
 =?us-ascii?Q?FqniKAa2P+0uz3wMrw8iiorPKv0uK1vjiAjo+M/TTSlS6K8eScak5/1yRJ3c?=
 =?us-ascii?Q?9AJYxznFjvMp0FAFI1BBhG5KyQI1m4KwdDFLfYCOXHBc9558/QtIWIM3LGn1?=
 =?us-ascii?Q?F+owvRO4IYhC121uRoKgKtqyV1O5iywh8NCaprP0gLJNVvoop6mqcKef9dg4?=
 =?us-ascii?Q?r1UL6jerBqZo/TXk4IICEPhaJ11Ose5Y15N4Zpe5po7NuXEGsAfdMUnQ+LI0?=
 =?us-ascii?Q?vEVJmh373sA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4cBmw+g8W9hrDmqFXP0relF6x50Zbscf+ba+Y4qNS8txLVpjeAEbhdsSqE9?=
 =?us-ascii?Q?C/91NllnUgW+JSj2eoK63vwQxz7c+t444rXqTxiowZs4ywxcymZspgx/ODDJ?=
 =?us-ascii?Q?D2KxEuDI1UyczU17LAru6MoS1NJUUkOfQH5jzj8jTM8fnDNjMrep2eFbLLR1?=
 =?us-ascii?Q?pKmeofFLRj7HcDD+Dj2pz+LZI8XF94Brhi1hlA167m9hZA7NrRmd2NoroB6T?=
 =?us-ascii?Q?/pVKVWllMHKqNa7rS/NdzJSsrdMBOaHa5T4AqZwELDgegWuw2Tax1xbCYk7d?=
 =?us-ascii?Q?T0iMmpXnxBvVfWh7Rsg1PTjgzUU+xNhykX3NCtrV0om2tBKtYQnlOIkH0gP7?=
 =?us-ascii?Q?pbhvZJ5E2rMAK7vOeXxP86OFpy/4uDI1XoKr/mDrDOHuQagLM2Ypo+taWD/f?=
 =?us-ascii?Q?3zDmmfy3GwwotGx6SGMx1M3VWAP3R4tsFGggiQnpRb44SazdtcLfNiqWQ3Na?=
 =?us-ascii?Q?gFU56SARHJxddHE/IWsGIgY/pbVDW6Lg/GXGUVd6WSjFtCDpEi+fFYp6EFq/?=
 =?us-ascii?Q?NrQ4bI+LLHFVHqhYOa8nGIuxOWiNRj9UtlB/WIVl8itwgr67h2/PMTdwuF6p?=
 =?us-ascii?Q?4t6GZZL5U9PgLrY0pGtp8Fednic/0IZRbSlRRiZa96apWNnAQ36pXxyGBamp?=
 =?us-ascii?Q?BPFz1T6sef/ntlOQtui8bOxk4eKQH1NJD4j48Rqq5GlnbXbwkTY+c87k74/d?=
 =?us-ascii?Q?4jzKnZaa3SdSE8aRa8HpiWtasMGRZzvuKzU7unnTvB3f0DgM8zRggyAB9Ei1?=
 =?us-ascii?Q?Geq9ngnRM2gXCevR9l2iv16msiaUVr3sMP5lSBfQw9lTpQE2RZ3I51Jhf6Tk?=
 =?us-ascii?Q?FiIPFWqW2wFdwXT65EZqQgqMKVv63DRzDVnAQHqZQUAaBR0KLDxgHQvV/qdA?=
 =?us-ascii?Q?XmXHFCAKU6vH1/1SekS5pehIo8wblZJTx4xESoI+dUJwo20j75L06E8B7T4W?=
 =?us-ascii?Q?24SOssMl0l3tW8Z+bYPBydjNhY3ku8QOfFCX8s9BrFmALn7XhF/1s+jZjgDw?=
 =?us-ascii?Q?B/U5cjsNe/qB2GcnSKo04aHw2IrN+2r19H/C9UZyaXI1ncpV/Ow1mOguKvmY?=
 =?us-ascii?Q?TUVsesamh5/kfaxldMAB1r06ErkU5x0JP6abmR+OjeCYq0m136DSFSQT1zJp?=
 =?us-ascii?Q?HU7B0yQhkcJBt16bNJm0OaKSRecGpy1Opg02aBpnhyR2w/PAywbIK+sbvRi1?=
 =?us-ascii?Q?jigRyzk6fmOdZ993L44ExM/kA2Kz/tC8BpJkgxYMnoehE9msu3/BmnhNG1/o?=
 =?us-ascii?Q?wxxUPP1pCm1YLerlkWsGFy1Dz5e3SImX/iDG4ILfFXlQXNPQK3D5QCbIX9Q4?=
 =?us-ascii?Q?ZZ464mc7n11ClGGKruULzYM3BCxbLnzR2wTovsLT/NdMAR84TBzZ5wuT7taD?=
 =?us-ascii?Q?1Bf16b3uqLGSaXHNZCO61/f2dhz0Fb0UrJIW3jIUQBjCceuDiSR+3tgkyvos?=
 =?us-ascii?Q?eJNxhG8SmlUq/ClgEtLL7y+VwZLcCYX717bhLaiX+k7KGqVERnKpowK17c+4?=
 =?us-ascii?Q?lGzMvH3n/oy1Mb4gRSXUmnVJo3rH+eT3SnH9d1gHMhVwXYyhOmncYz85xGS2?=
 =?us-ascii?Q?nX233rceWdq3MVExrNdSqF7grUNxTpZJj/eZOkQ5qWo+OEKcalX6TfNZGaZS?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2544048d-e731-4a23-86e4-08dda44e57c2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:30:54.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j55aE6Pe0Wc7hVQi+avr7oaSws96io9InlOvYCmMgEHk5I9kO5aaqeMkvTbxskTpx8gGvblOPvY+vYh15aC/uOdayetWrRVpnUrXq1Eev3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
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

David Hildenbrand wrote:
> On 05.06.25 14:09, Jason Gunthorpe wrote:
> > On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:
> > 
> >> If all dax pages are special, then vm_normal_page() should never find
> >> them and gup should fail.
> >>
> >> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> >> 'special' is not set in the pte path.
> > 
> > That seems really suboptimal?? Why would pmd and pte be different?
> > 
> >> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> >> 'special', right?
> > 
> > There should be dedicated functions for installing pages and PFNs,
> > only the PFN one would set the special bit.
> > 
> > And certainly your tests *should* be failing as special entries should
> > never ever be converted to struct page.
> 
> Worth reviewing [1] where I clean that up and describe the current 
> impact. ;)

Will do.

> What's even worse about this pte_devmap()/pmd_devmap()/... shit (sorry! 
> but it's absolute shit) is that some pte_mkdev() set the pte special, 
> while others ... don't.

As the person who started the turd rolling into this pile that Alistair
is heroically cleaning up, I approve this characterization.

> E.g., loongarch
> 
> static inline pte_t pte_mkdevmap(pte_t pte)	{ pte_val(pte) |= 
> _PAGE_DEVMAP; return pte; }
> 
> I don't even know how it can (could) survive vm_normal_page().

Presently "can" because dax switched away from vmf_insert_mixed() to
vmf_insert_page(), "could" in the past was the devmap hack to avoid
treating VM_MIXEDMAP as !vm_normal_page().
