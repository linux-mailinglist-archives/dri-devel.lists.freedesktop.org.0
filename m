Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21457968CA9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9F410E35E;
	Mon,  2 Sep 2024 17:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRmM+HLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D3110E35E;
 Mon,  2 Sep 2024 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725296711; x=1756832711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qYIyVkavbOQ4qJ4aV7enJ7a9jrfJtx0FVr/3QYjDxTk=;
 b=WRmM+HLrm+H1HRsSU9+VGiKNMedsKEUtylr8NKBcwPlPAjAlicXQwpQg
 cMyYrj2I9GQQBfWO4dBBTl6kK04YOkoWEF3vqtwQQvPgwp/j+H8M4iuq6
 vbUMenH89ebKLKPwa0dtIUsGxp8wOnf9WtGyeg2ZL/uIwT6Hh983gt1Vv
 7/p6y78iNLI68amqMKC1goDZsqzJY0o2KreLsHfHiAuQRfU9QtxSCLZ5u
 byUuWNokWQXr+aJbysLkPyqqLtguoPdqIdDaa0WKfv+Rt7inXDCJcIgDk
 4eVmNEj208PWyIHf0TRnQaOa1b+sA8Haq+L8RiumucTLhzBQEe9E/J27O A==;
X-CSE-ConnectionGUID: gauIi0b/TDuHerlPs7YNsg==
X-CSE-MsgGUID: q88Olv7wQwChsoBPirElxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34452980"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="34452980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 10:05:10 -0700
X-CSE-ConnectionGUID: Nf+je0QrSVy1DD2NJ6VtQA==
X-CSE-MsgGUID: R7VxFmDqTo636BkeVMvjkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="87898776"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 10:05:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 10:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 10:05:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 10:05:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 10:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9AC6lUsJHSnoZmpC8OjIqlioiq2ezVTFx3iy+J9qGZI87Q/WZ0OvvGNksl80Km6TSJ5tdNWBywcUwjfFfsNt35MA1kYCjcuUGhPzfXPDKzDWl53EMolbYQLMdnVAzUzSx+G/I1P7rZ1UG1AnyeQ2XX/+VEG02LsVPcA9QcAgJKmbrz9YIMVRvBX5yJNFlh67WAh86bUWI+rFFze0pHz5NpX2DGRgYbT6bX/Z52W2lTPyQDgfAD6/fccFZWWGeHtij9flys4NdklziIT0cr0Sj8FI61Mjvuw3PAQRC/E8aIFEqvATFHFamxpFxhL1fE5PGo8KBvC8wlVFUqBH2H+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlRGW24VqVmxMyVYphvMX91pfB0xR81Zaa7EvOJAFwo=;
 b=cAU6ks1CVxsdtj1R7zksY69XwQnlBBB+RJS5t47+kDsS/E7AkCs67hQ5cj4lhD9/TTpTCMdGOxHW5DS4tYKvpdNlUWhC5783SWmzcaougvWOvph4m0vQndM2r8/YaXbqQgnaPaB8TvQHnmkpbCHeSNpA35CC/qRdyPmtB0qk2/V63F0ZEHF1/aAeBVQeyKs9DWXJXERjgeCf4uePiofJCTPunvooEXjRi/bI88aCWoKn8bwpzU8u+LJNvsJ785gVtwUWzgkspnxmRDuG4GJO+h/AdO7OBZ4o++cxM60LZ5ZnZ1A5IjEEwIagaMypz7YiqA9K/dZ7RF8VA8vyfQsUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 17:05:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 17:05:03 +0000
Date: Mon, 2 Sep 2024 17:03:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtXv2CTjWx3dG9sC@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <ZtBDJCfWxaEOqILc@phenom.ffwll.local>
 <ZtCvcVu3SZsManOw@DUT025-TGLU.fm.intel.com>
 <ZtWnKvaV964EA6mq@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtWnKvaV964EA6mq@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b42d5de-2ef1-4b67-9b6f-08dccb716315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+bvhmvCY+Ohsgim0WITwofRFJySpTy1nQIcuoicZFA1UTxvaD4HRiHHcwm?=
 =?iso-8859-1?Q?zcUhFO4nZETVXYthrWmuoL2QgmsFYz/eqpqbPkSTjUmR0SlEWG9DLy0G91?=
 =?iso-8859-1?Q?XF5AnUkXbRAyi7shTPjw+F/AVeFxKxERKhLKoX7WaEZiqUke8VhhyWTXT1?=
 =?iso-8859-1?Q?GRzOife6Yos0aKUrJTIQUe08Ru3daS4sLbeH8czmMfV9U9apu36LTY5njG?=
 =?iso-8859-1?Q?l9M3D8qcbGmfdyrEj5LgJ7mg0lO0JTNJNYbkJhxbm6jqlKuuTU0OybBMjj?=
 =?iso-8859-1?Q?BKkokmHlZTjlXVsXNsS+cZmT3V53kN0yfwV9ERFJ+0iluYK2vjYseSiS1B?=
 =?iso-8859-1?Q?RG1xPuS3fhtAglRqmnCWdAAu0rObNK9fPDV3ebF5eNrqMAykCB8RJBzHqm?=
 =?iso-8859-1?Q?lO+pAFaokXF5Gp+yE9Xyi8DrFH3K9NCAzpvsZdbFwgKaLzoPWpDDtY9lF+?=
 =?iso-8859-1?Q?fK7n/OnuxkzrcWcSEe4BLMp5XVGUNpZTPTSLfALKehnXVKVYZNexvQYIVX?=
 =?iso-8859-1?Q?e/NnedDaWpQlcm3PqPoB054XZEt8CY46vsWQ4qbGQNMC832XJ3tEFZd3yx?=
 =?iso-8859-1?Q?71XkCCPgc98GE5pYhiiFmSYBIo271Oq2tL35eL48m6zKGuARSSC4p9ZqTD?=
 =?iso-8859-1?Q?jvzuXNXc9WW5/9X3WwxJbgGfyFAI91XZ+HYKIuVTD9UnWuE9ghDj5JG2Gn?=
 =?iso-8859-1?Q?nuWkOtFvNbeo6Nzta8r3kbmcNt9nd7MH2mdnNqCRLhq84LJtgD9DfHKs1/?=
 =?iso-8859-1?Q?pu2ABZWlguWBVJ6vqJ2ePYk3FXdazGSFnwqPJjLelpXrIrsi9yEwZMB/8X?=
 =?iso-8859-1?Q?a93H0lb7Ars604oG2pxnMXXK5Gw+DWg8pYD3mX4j70BLihtBaa77ZkXYyK?=
 =?iso-8859-1?Q?5Zg92TaSBRzMx1vddWqQP7iz4BudTU+oovLi7ss0Rxkwk6XqWvTUDEgCBX?=
 =?iso-8859-1?Q?fzvuXOyOIsImC12XnEk0Bm3c/Ek/h9a9xOccoRWNhFHTdfgkDXecrWHQQA?=
 =?iso-8859-1?Q?tDHqf1mjFRaWOM7q/r7BEF4BYfo4qDgWMnjyZlpfCkhjtrP1eNND9wNQt7?=
 =?iso-8859-1?Q?uQk3vLQNcsBa9btRkS+Zs+0WuQhPzLxNDTU3POB8FbxhaeJtJnF8G6tI+q?=
 =?iso-8859-1?Q?d7SQsiAxwpRBimFuCp3o6KwPOjytDB79Sh+YdxAZew3tJP/9QL4eO9kj41?=
 =?iso-8859-1?Q?Di8JHgR+2yPKcsEwa0gO5uU67Vq8suJDa8joicOjCQNnjIQHdwAby4Z7lH?=
 =?iso-8859-1?Q?ulNXN/7+R3gTE0k4Ke9d4vWWwvx2dcyuahIt8zIK23n+mbamonC3yrzyur?=
 =?iso-8859-1?Q?eVyjxLjZpAFqgfW2RXSzhY44CEPpRY35+3NBHAHkvrtOgms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QY7jdL8ke5o4sRCZ6lyC/trNszLsXqPQbeNgSy7swl5QgpvIv80eucZMLy?=
 =?iso-8859-1?Q?8+Dn7a3ItwuGm528Xv/6+KmzM9hLD1bB2/qIfkReZcfxHFxWQj7dvugKOI?=
 =?iso-8859-1?Q?nP6mQ+T+LjBcFmndJUCae7+378fVqD5xuRbHN/ymTnuYC9YcEJwUBeGsIv?=
 =?iso-8859-1?Q?MDs0YTfNwBujMzDViQN6wG9gx+E7uVDWC/LpjoxQmwPxrVKMUfxizGg+6J?=
 =?iso-8859-1?Q?3jQcy4wRSiHnZlhTonaKBDF0ZcB00NXnUEs5YkMkVZea6vfdWf1N5RE4aN?=
 =?iso-8859-1?Q?JGMEM5JIcxkjwJEw4y6mkMj1IR0JCtvFUHeBZJa1YwfORITYw+OKTlIchk?=
 =?iso-8859-1?Q?m2CbQ4Gi3XQLwI+JMh9nQGsE9Lrqp7m+e1493WqjfC8m11GgEwlAWNxAnT?=
 =?iso-8859-1?Q?Na+m//nTCINxtvBfP7cQVN04OQbrlNccK583It5alCbB9ozMl4K/nx2TeN?=
 =?iso-8859-1?Q?Zx9ncoOEzgc0OxQa7AwfnQ14wMVoA8d0BdsbVLPyz8pY7ukds8jzBUEgeG?=
 =?iso-8859-1?Q?+shJd21/uQ9rypP8B7Gom+orsTAL8O5/fvo7MmX3SBix4VVTKM+oqq708/?=
 =?iso-8859-1?Q?NLS9sJC06IF+Xnpz2iQ6nMyESOWApbkiKE0d7aTXlLRC6JFNmXnJsa+4z+?=
 =?iso-8859-1?Q?23LiAdudxAffdo8P7+6bwv4njnSMU5kymlnMJrKuQ4kPmutRcNyPlRt/vT?=
 =?iso-8859-1?Q?3x9J9Pw7FmsiExKj+dEh+J+Pagc5MAugUGWpGz8BcDAblBr80K2liBfshU?=
 =?iso-8859-1?Q?h53RSCalA1ASBSdlzHNWS5j44KjmUBF1+xsb2kx6UjCPTSS/Cqa3gKAVZL?=
 =?iso-8859-1?Q?g18G+D71SyYZH9TLav9vTSm48qiiKON0OIZn2VTnhgRVpSyjBa0AhGxb1d?=
 =?iso-8859-1?Q?5MncOIALRHCfaBjL7X9fjqLmLnjeBku8y/jg6dR+SR8Gg8Qcr2k9PwvJ6d?=
 =?iso-8859-1?Q?MEH6+NFwY4ndksBonipe6Kq7MV/TCDzzWfIWV26qjoLvSt8CWECKX8nSQK?=
 =?iso-8859-1?Q?3uH25KMWVsMvGwnClGL/xKqKT1bh1oVhqNpEG1R8GWckaeMaf/MSRQupon?=
 =?iso-8859-1?Q?/uprq+PKG4ZNDDIwrawliuvnOBihAl5ALXn5cI9HWsHOrJU8qBB954eQ2i?=
 =?iso-8859-1?Q?Ky1lF6ofeBuQqpaQilLW7GKPIBl/x6uW//EZ92n9agpbu30iyqpRj0YSIj?=
 =?iso-8859-1?Q?6L38B/dBbovmgaxzxzQINkcIBRpQ9UTNVCQ/j/XIs8w+pM8+fSKJ7d7lPB?=
 =?iso-8859-1?Q?fTIGV7SR5mRoc/2a+3DRyXFJ+DC7IhEh8d44Ycel3INz7RdiznOmuWPvxN?=
 =?iso-8859-1?Q?1/Ifw7aLN2mTEizs7tzFvioKStzVcP4wyXnyQpjc57rCTa31UqcHfyaK5Z?=
 =?iso-8859-1?Q?KIIbpxwsfxn5dXiy7OZqQkx+Q3hlB2rWiE2cIk2c2i+c0QM27d21iLtCK6?=
 =?iso-8859-1?Q?BteFe8Ww3vI9tnfq260c6U9VKIUgqOhP8/UTVJLMHyBzTE/5s4tbg17FmF?=
 =?iso-8859-1?Q?QUIuJHwCNavzW1JIaO7eUmvlFTlK37j0GTLwo/ybMHFMqw08jzc/ejT/F7?=
 =?iso-8859-1?Q?kfxdvz1knaFsHOX3gd1nbIiNl4WTv/eP6/QzvhDL8vAgrl9JlPQZocMRe1?=
 =?iso-8859-1?Q?DOMtDMC5/v2TBAalJYGuZaWMPsAJ9B1uvdHiN+ptmbIcW7PBVCLTEf2A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b42d5de-2ef1-4b67-9b6f-08dccb716315
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 17:05:03.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lTU6e2b67FRNci19HNkRef/YJNW8Pd7Tk1fnO4tO2455scVaDtA3reT4j+OqxjmvCVECiIWyynn0xbbYXYmeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
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

On Mon, Sep 02, 2024 at 01:53:14PM +0200, Daniel Vetter wrote:
> On Thu, Aug 29, 2024 at 05:27:13PM +0000, Matthew Brost wrote:
> > On Thu, Aug 29, 2024 at 11:45:08AM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > > This patch introduces support for GPU Shared Virtual Memory (SVM) in the
> > > > Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> > > > sharing of memory between the CPU and GPU, enhancing performance and
> > > > flexibility in GPU computing tasks.
> > > > 
> > > > The patch adds the necessary infrastructure for SVM, including data
> > > > structures and functions for managing SVM ranges and notifiers. It also
> > > > provides mechanisms for allocating, deallocating, and migrating memory
> > > > regions between system RAM and GPU VRAM.
> > > > 
> > > > This mid-layer is largely inspired by GPUVM.
> > > > 
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Still not sure I've got the right race that you paper over with
> > > mmap_write_lock, but I spotted a few things, commments inline.
> > > 
> > 
> > I've replied to this issue several times, let's table the
> > mmap_write_lock issue in this reply - a lot of other things to get
> > through. Current thinking is try to add a range->migrate_lock like AMD
> > which I state here [1]. Let's continue discussing the mmap lock issue
> > there if possible.
> 
> Yeah I wrote replies as I read code, so there's a bit a mess from my side
> here. Apologies for that.
> 

All good, has been quite helpful thus far.

> > [1] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169
> 
> Some more replies below that I think we haven't covered anywhere else yet.
> 
> > > > + * 2) Garbage Collector.
> > > > + *
> > > > + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> > > > + *					struct drm_gpusvm_range *range)
> > > > + *	{
> > > > + *		struct drm_gpusvm_ctx ctx = {};
> > > > + *
> > > > + *		assert_driver_svm_locked(gpusvm);
> > > > + *
> > > > + *		// Partial unmap, migrate any remaining VRAM pages back to SRAM
> > > > + *		if (range->flags.partial_unmap)
> > > > + *			drm_gpusvm_migrate_to_sram(gpusvm, range, &ctx);
> > > 
> > > Note that the migration back to sram isn't guaranteed to succeed, so you
> > > might be still stuck with partially migrated range. This might be a case
> > > where hmm gives you vram pfns, but the range you have doesn't have any
> > > vram allocation anymore because you droppped it here. Not sure tbh.
> > >
> > 
> > Hmm isn't the picture here nor will a VMA once the
> > drm_gpusvm_evict_to_sram path is always taken as discussed here [2]. I
> > might have a corner case BO refcounting / TTM resource lookup bug in
> > somewhere in here which needs to be resolved though (e.g. eviction
> > racing with this code path), will try to close on that.
> > 
> > [2] https://patchwork.freedesktop.org/patch/610955/?series=137870&rev=1#comment_1111164
> 
> So maybe my understanding is wrong, but from my reading of the device
> migration code the exact same non-guarantees as for the sram2sram
> migration code apply:
> 
> - There's no guarantee the page/folio doesn't have an elevated refcount,
>   which makes the migration fail (in try_to_migrate, where it checks for
>   surplus refcounts).
> 
> - There's no guarantee you'll get the page/folio lock, which makes the
>   migration fail. Worse the core mm seems to use a fallback to per-page
>   locking as it's extremely crude "get out of deadlocks due to acquiring
>   multiple page locks" card.
>

I think this circles back to basically the design must be able to move
VRAM -> SRAM because the host can't access VRAM. Certainly in the CPU
page fault path this can't fail on the fauling page at least or if it
does the app gets segfaulted. I'll investigate more here but that is
still my current thinking. If VRAM -> SRAM can fail / make partial
progress in eviction paths, then mixed mappings likely need to be
supported which shouldn't be all that painful - basically just need
cursor in the bind code which can walk mixed mappings.

SRAM -> VRAM certainly can fail which is handled by just aborting the
migration.

> > > > +map_pages:
> > > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > > +
> > > > +		for (i = 0; i < npages; ++i) {
> > > > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > > > +
> > > > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				goto err_free;
> > > > +			}
> > > > +		}
> > > 
> > > You can't do the above, because the pfn you get from hmm come with zero
> > > guarantees, you neither hold a page reference nor the page lock. The only
> > > thing you can do is grab the pagetable lock (or mmu notifier locks) and
> > > check it's still valid, before you can touch any state. I think the
> > > range->vram_allocation is probably always valid since you clean that up
> > > under the same lock/thread, but there's good chances the vram allocation
> > > is otherwise already gone for good. Or you get an inconsistent snapshot.
> > > 
> > 
> > I haven't seen this pop in my testing yet which is fairly thorough. My
> > thinking was migration always being enforced at range grainularity we'd
> > never get mixed mappings from the core as migration is completely under
> > control of the driver. Maybe I'm not understanding what you are saying
> > here...
> 
> So one scenario is that you race (without the mmap write lock or the
> migration_mutex design ofc) with another invalidate, and get a partial
> view here of mixed vram and sram pages. Until you acquire the mmu notifier
> lock and have made sure your pages are still valid, there's essentially no
> guarantee.

The pages are collected in notifier stable state via the hmm locking +
seqno begin and recheck. Before they can used (e.g. program a bind) yes
the notifier lock needs to be taken to ensure they haven't changed
between collection and used - at least this my understanding.

> > 
> > > > +
> > > > +		/* Do not race with notifier unmapping pages */
> > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > +		range->flags.has_vram_pages = true;
> > > > +		range->pages = pages;
> > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > +			err = -EAGAIN;
> > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +		}
> > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > +	} else {
> > > > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > > > +
> > > > +		for_each_dma_page(i, j, npages, order) {
> > > > +			if (WARN_ON_ONCE(i && order !=
> > > > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				npages = i;
> > > > +				goto err_unmap;
> > > > +			}
> > > > +			order = hmm_pfn_to_map_order(pfns[i]);
> > > > +
> > > > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > > > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > > +				err = -EOPNOTSUPP;
> > > > +				npages = i;
> > > > +				goto err_unmap;
> > > > +			}
> > > > +
> > > > +			set_page_dirty_lock(pages[j]);
> > > > +			mark_page_accessed(pages[j]);
> > > 
> > > You can't do these, because you don't hold a page reference. They're also
> > > not needed because hmm_range_fault goes thorugh the full mkwrite dance,
> > > which takes care of these, unlike the gup family of functions.
> > >
> > 
> > This is a left over from our existing userpte code and it does appear to
> > be incorrect. Let me remove this and fixup our userptr code while I'm at
> > it.
> 
> Ack.
> 
> > > > +	vas = vma_lookup(mm, start);
> > > > +	if (!vas) {
> > > > +		err = -ENOENT;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > > +		err = -EINVAL;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	if (!vma_is_anonymous(vas)) {
> > > > +		err = -EBUSY;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +
> > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > +	if (!buf) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_mmunlock;
> > > > +	}
> > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > +
> > > > +	zdd = drm_gpusvm_zdd_alloc(range);
> > > > +	if (!zdd) {
> > > > +		err = -ENOMEM;
> > > > +		goto err_free;
> > > > +	}
> > > > +
> > > > +	migrate.vma = vas;
> > > > +	migrate.src = buf;
> > > > +	migrate.dst = migrate.src + npages;
> > > > +
> > > > +	err = migrate_vma_setup(&migrate);
> > > > +	if (err)
> > > > +		goto err_free;
> > > > +
> > > > +	/*
> > > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > > > +	 * always an error. Need to revisit possible cases and how to handle. We
> > > > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > 
> > This is a bit stale, can update this comment.
> > 
> > > > +	 */
> > > 
> > > Yeah I think especially under contention partial migrations, at least back
> > > to sram due to cpu faults, are pretty much expected. And you need to cope
> > > somehow.
> > > 
> > 
> > I have seen these pop if the IGT calls mlock on the memory. My thinking
> > is migration to VRAM is basically optional and fallback to leaving range
> > in SRAM if an error occurs rather than doing a partial migration. This
> > is what currently happens so it is coped with.
> > 
> > If the memory is marked as must be in VRAM (NIY), well then the user
> > program has done something wrong and can kill the app (akin to
> > segfault).
> 
> Yeah SIGBUS for "must be in VRAM" sounds like ok semantics.
> 
> > > > +
> > > > +	if (!migrate.cpages) {
> > > > +		err = -EFAULT;
> > > > +		goto err_free;
> > > > +	}
> > > > +
> > > > +	if (migrate.cpages != npages) {
> > > > +		err = -EBUSY;
> > > > +		goto err_finalize;
> > > > +	}
> 
> What I think is more fundamental is that I think this one here doesn't
> work. For migrate_to_ram you cannot assume that you can always migrate the
> entire block, I think to uphold the core mm forward progress rules we need
> to allow partial migrations there. And I think your current code allows
> that.
>

Yes. I had similar checks in migrate_to_ram at one point and that did
not work when multiple CPU faults from different threads occured in
parallel. Each thread can grab a random set of VRAM pages to migrate I
think.
 
> But that then means you also are stuck with partial migration state here.
> That was the point I tried to make.
>

The error path with migrate_vma_pages/finalize safely unwinds the
migration in these cases leaving all pages in SRAM.

> > > > +/**
> > > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @vas: Pointer to the VM area structure
> > > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > > + * @start: Start address of the migration range
> > > > + * @end: End address of the migration range
> > > > + *
> > > > + * This internal function performs the migration of the specified GPU SVM range
> > > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > > > + * invokes the driver-specific operations for migration to SRAM.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +					struct vm_area_struct *vas,
> > > > +					struct page *page,
> > > > +					u64 start, u64 end)
> > > > +{
> > > > +	struct migrate_vma migrate = {
> > > > +		.vma		= vas,
> > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > +		.fault_page	= page,
> > > > +	};
> > > > +	unsigned long npages;
> > > > +	struct page **pages;
> > > > +	dma_addr_t *dma_addr;
> > > > +	void *buf;
> > > > +	int i, err = 0;
> > > > +
> > > > +	mmap_assert_locked(gpusvm->mm);
> > > 
> > > That's the wrong mm, at least for the ->migrate_to_ram path. You might be
> > > called on a anon mapping from a child process. That also means that the
> > > vma you're looking at might have no relationship with anythign you're
> > > tracking in your gpusvm.
> > >
> > 
> > Hmm, as discussed [3] I haven't added tests with child processes yet.
> > Let me do that and update the design as needed. This likely isn't
> > correct as you say.
> > 
> > [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1111169 
> 
> Ack. More tests should definitely help here to figure out what's up, and
> what's just me being confused.
> 

Starting to add tests this fork() appears to work after dropping these
asserts. More thorough testing is needed though.

> > > > +/**
> > > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > > > + * @vmf: Pointer to the fault information structure
> > > > + *
> > > > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > > > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > > > + * the internal migration function to migrate the range back to RAM.
> > > > + *
> > > > + * Returns:
> > > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > > + */
> > > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > > +{
> > > > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > > > +	int err;
> > > > +
> > > > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > > 
> > > So I think zdd->range doesn't work, because even within a single mm the
> > > vma mapping a given piece of anon memory does not need to be unique, you
> > > can duplicate them with mremap.
> > > 
> > 
> > This is attached to a page, not a VMA. Both AMD and Nvidia drivers use a
> > similar lookup mechanism.
> 
> Yeah the page->zone_device_data is fine. It's the zone_device_rage->range
> which I think isn't ok.
> 

Yes, this gets a little confusing with fork() and mremap. The range's
start / end can be nonsense in the remap case. Also as you mention a
range->migrate_mutex doesn't seem correct either. I can make it work but
maybe not worth even typing out why here (I can provide a little more
detail in another reply). New thinking is zdd stores a size field and
has the locking - I think is akin to a VRAM folio then.

> > > So all you have here is the physical memory and the vma, which might or
> > > might not be from the same process as gpusvm->mm.
> > > 
> > > Also the child process scenario means you using mmap_write on the fault
> > > side doesn't stop all cpu faults migrating stuff back.
> > > 
> > > Somewhat aside, but I think that means amdkfd's svm_range->migration_mutex
> > > is busted, because it's va based and so misses concurrently ongoing
> > > different mappings moving physical storage around underneath.
> > >
> > 
> > I think all of the above which falls into the fork() + child process
> > issues which you have raise. Until I test this out I can't speak to this
> > any level of confidence so I won't. Thanks for raising this issue and
> > let me write test cases as discussed and educate myself. Once I do that,
> > we can engage in further discussions.
> 
> I think fork + childs will still result in zdd->range being unique (albeit
> confused about which mm). You need mremap of some of these mappings to

Agree for fork + child based on initial testing.

> change the addresses and really cause confusion, which I /think/ (but
> didn't test) is doable with a single process even and duplicating anon

Yep, remap changes the address so range is confusing and really size is
sufficient aligning within VMA's start / end upon CPU fault. AMD does
this but with a VMA search which I think is a bit overkill.

Matt

> memory mappings with mremap.
> 
> Cheers, Sima
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
