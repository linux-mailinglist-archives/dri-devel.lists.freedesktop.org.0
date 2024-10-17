Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BAE9A1759
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 02:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3EA10E1A7;
	Thu, 17 Oct 2024 00:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdhfcRll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2643E10E1A7;
 Thu, 17 Oct 2024 00:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729126631; x=1760662631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mohvbuv2c9fjUTyDEWBb0bmC6eZSWfcXRzuAyy4aMgg=;
 b=TdhfcRllXuZ/j2CQtDmMhNPwjfhInEuYW+lM/JwLloZKyaZ3eS5ylD5e
 5myP/SJVhX5QOc7aLbsDKbol6SO6sU+9cxwfXxYnugq4gbYKcNxLSFsCf
 hmt9ITt6h/XppAQfev8oW1LDKduYyVzstFbc+MuysD/oaZNdeJ/IuwOWw
 56M0RTwGjF1DzhDv9XtNTisQgemtaSl0Dhh1oxIawJZicFVN6DfnGADhu
 U+cMfiFeYeRuH44RMuaU7ShNsZbW4LWo7aytJuRXcCrWhZQGgseUHpuBV
 /Ocze600tU8SDmAeDWMZsGhUDXUb10o25XJLkEftvi7VG5qDmY8AGb/gN Q==;
X-CSE-ConnectionGUID: CafMdW0+TkOI2Lh+tsErXg==
X-CSE-MsgGUID: CmeYAbUERQKW9NRqN80aQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39180795"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="39180795"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 17:57:09 -0700
X-CSE-ConnectionGUID: XqCpf952TpWzUiWsCXGEHA==
X-CSE-MsgGUID: gdDCzbi4Qiu6qvM70+a0xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; d="scan'208";a="78733973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 17:57:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 17:57:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 17:57:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 17:57:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 17:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRjIvFNzxj9P62/HG9HgG45cmYCnYn4Iz9Qi2JlsUA5aMvv1zExwT0gPfW1+fMG94s/BmGEA0C5OUyKDYzw3SlBy3PTlz1+XL/ELlrmaHm5JhkYT5OTdsLvYrSIxfj1il77LhNqscSxYm9dP91PbQ10xJnYN94zBUmh5lC+l/m3yrVI3eeFx3X49suFvOR4mpmTJjnMdpjF4DgKLflPnznbBeE0svaHXCaRskLt6T7BNji5Bx9QFl8Tgpzmw9mM43S6i3ErCrHRBm2OsyxMlOU9Dd3F0Ju2QqH8zrt7QN8Pa31h+jB/H3AoVk3N94gOXdn/HNoqF6lGH2AxUSYme8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIyrDMRvv80Snq6hub7vgkXzM65Tgi14yNP50BGdLv0=;
 b=IkUd2QfU16AufW08fzP3NauNNw0xUrMx5GVaayxqdlzJYp0KJhVrTNttbOqCwjTxqObyY4WtJ67nje6wLP5l718PkA9dS/4SzKCq/ZIIX4Fd3i1saGKQgTJy+o6hDqoSCvblp2QGvt6HBZR5Doc4eVjGBjrjvvFSNCSCJKPl0jNJiOktdbAwfYSzwJr7p8XIrabZCxg1jVDpMDOUIeZeoaWBmiBHZ9K6UHmxVNJ79qoZLhmAejx7jBY+Xkc0XcpmGGr183uAanNo9PxmID11WQkR23qOY65ETSUQcnyMQ8t+aX+ayqcoqUswrV5SpN8tdRy+N/TjwdOGf+jwEXzgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7762.namprd11.prod.outlook.com (2603:10b6:610:151::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 00:56:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 00:56:53 +0000
Date: Thu, 17 Oct 2024 00:56:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Message-ID: <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 70aa8603-7927-4343-317e-08dcee46977c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qo9SrvCeKkfMcza+V4w0LJ//ql8HoGddfxzLYdrEQmDRht9r/l8Sc7BgKO0C?=
 =?us-ascii?Q?mH2Al9CDAfgQGindL53KE0wC2qtSy/A0Q1bSPYeGIfIcFdBdxgVDkuWQa1DF?=
 =?us-ascii?Q?hU+wFn6uoaT+139JLxkeIhBzZla5GJKZ9gm1WW+hYaodKV+6B0UgBRgz5gW/?=
 =?us-ascii?Q?83IMksRLWPyUJdJytTREjnxM9TDRyGZrV4WKzmPTujvhu7FR+go7Rsy/lfYi?=
 =?us-ascii?Q?qZqFHB/sZNjKWcO1dWZAOcwqcQHN911T+X3XFtE0Z4urk6WU+mzm6V1EBbPn?=
 =?us-ascii?Q?yqJgtYDs/wpv4ULzUvQLJgz7hlMXrEOM9Wwu1uVg5evn3MUqIMRcY/foJdVF?=
 =?us-ascii?Q?LB//3brJSsB8erGOZP0nF8sMG/5T3A8rhzp1Ehc9QfdYY2U1N+4LVeCynr+L?=
 =?us-ascii?Q?k1EsuqwRe4+PcEoIGfr8Yu32vw/KCA3d7lks0QgkSmWnotkGxhNft/iW/QMi?=
 =?us-ascii?Q?24GFeRuNNhoVypVWafPfjnR3OTGLq5y1ke/18vVgGgiOUiGEsoOaz/9X7o6U?=
 =?us-ascii?Q?1bWI6VAAdnImf/N2dyPjctnCx+CXcEbX+OY7hX+HShrp3vWCO7HMHe4YHr9G?=
 =?us-ascii?Q?aPc06CEXYmD7jvxHSraD0xIg/eKFs9jN0FPL+z1ObPAdnb4JY02yp70SwK99?=
 =?us-ascii?Q?8Vu5DqZ5sBe8Qu7uk0lBjtGiVCG5MuRGn8x5gVQ2PRG4oLlka/pBDLbAXsVQ?=
 =?us-ascii?Q?mLQ3GbmXi26WCtL4HJBXIbPqj6VIu+uYYLNbALLpzCz8UVUfMzVfedXnhGnE?=
 =?us-ascii?Q?DIauOqonoaxjzlnP7u86p8W7T4+Gi1ft2e4PxfggpfB9I8VilNa9Sm2fSJUh?=
 =?us-ascii?Q?H6nC24Zts6wwT91ezdyvGm6aMqU6374Z24shCHd1J27w+mG+zxQNwsKZqSeI?=
 =?us-ascii?Q?yoIM5TyUNvtYlcRZ4C9BuOFH7UtVhWdUzJISP+qN7fzjqnpruERKT8HIL625?=
 =?us-ascii?Q?A9a8t7G3Mvji3gHOw4ZXA/jdCRDG5d5XyXbIUFv3pJzNYVKsq4fMxRH+QE7h?=
 =?us-ascii?Q?lmJ6ZPWDr5CJmopOrCiFJcs8IPok3qFFEZOPAhpivrfahbggurWfGyjo1u4t?=
 =?us-ascii?Q?0vEzUAuQNVeAZUyuDD4LDQyKeC284rNNkgBh248SVgBudutvjAr305wUm6L0?=
 =?us-ascii?Q?MyvZvrgHUrw8N4iqRtEBcC6VmNPM2q5XzvzR9ZSLJOuq97eD6VpRWcAD8l5r?=
 =?us-ascii?Q?3UfdgcC0taMDzEhUo9kuo3gPEDwrPUyCmxd0fMhXm8aLlmurdiTN0pEmOIdO?=
 =?us-ascii?Q?QUf1m6i0+02yZu27m2mI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+pjLtT2rtiZaUD65r0jj14nRbJZI5B3wEdrh2pIgKZwuGXduV8piVDEoSAYj?=
 =?us-ascii?Q?wPBGp1xjbqnH7vCIVbc+I0aGgWRFl1NhVWGKqI6rKlR9B9LJYzQkGOv5oAar?=
 =?us-ascii?Q?/SCleh6W6OrMy76qtLFiL0wp10ymhCHiuv6pXj0zrXX0s+mJ6T+f5uVZceZy?=
 =?us-ascii?Q?T2ZWNThapWjDte7Qw2l7zQUh74bERgIp0dnVuHHfYWNw+jG8ndq/7l0YEqi1?=
 =?us-ascii?Q?Ywxjun6jZtS3yQZssZfwMK+RxubR4mrHmLuAjx7gjaf9+IOash/VfYqvL9Nw?=
 =?us-ascii?Q?GXCsYTs4xKrOrPaoZZCRo/x92+f0WOlXppk3fq+IUCMWHfraY2R6BCy8vASX?=
 =?us-ascii?Q?+8JcNJ9ekSA/5p6lpp58FgINb9jxIetOanoRZpfnkz413Y7rxoWO1kEyb5Li?=
 =?us-ascii?Q?GCzMmRAz0kcnViKtaLgq73yDlobqQvvUauon/tJwte48NwuYN6pg1hCbQH/d?=
 =?us-ascii?Q?a/gqVkxnPA6+cFFRJJlHh0W+oMMncXfRTPqNKZ0BTsCqgTrBuK4yEvNNfhZh?=
 =?us-ascii?Q?/kS4qRduKWf77286eiQGs8zPqgpI39MP2C1AIu6BOvEQYh5D8vlzufas15Vp?=
 =?us-ascii?Q?2wT9eYDIo/hmMqy/EDTEwQiJMaG6VkmJA4iRzE/KKNpfzTqMOm7+sen+DhVf?=
 =?us-ascii?Q?evwpiqQv95yKzHVVk6OfAXnJci2e9C18cMiwDnDB7bX7vipr0rak5Xhvnebs?=
 =?us-ascii?Q?K+zgX6y3i8TR7fyTX0DMpe/7YCNaYfq3PxNFcnyrH91+aOfo4rV5s/xHsaGC?=
 =?us-ascii?Q?wgzHXerdalO4sgBQJiR65xfzoWSZ0eQdGt4bixHxbE/mN7WdXsA6K2rYpRzK?=
 =?us-ascii?Q?I0kSzxYM4mGcupUMGRSsC/LQLX7CQ2OgPZkK88K22dOggiBeaPqYsa+WNKlk?=
 =?us-ascii?Q?VR96hepuU1k/wDapsqwiNjfq4L+W1/dImpXjAr7rn14A0tTofs1tZ660Jl0d?=
 =?us-ascii?Q?Cha0xTMsi2uBpUfoA1JtGxnHuqgpXrRgFpoaqEWFS1amS6ngj+zbyxNfCLYj?=
 =?us-ascii?Q?DBsC4S8XRpRgh4XnKA5uo5S+SQiTKsdU38ohqOxSaruwf8xSFMzru8TX6q1R?=
 =?us-ascii?Q?Fu4rYMR8j0mv7aceTg6c9iHhNZcWkc8k3+csVKINKJvZaRy5Al/zRWGgjg/i?=
 =?us-ascii?Q?/UaEdIL1nV2E5Xfa9bevOwd9hBpvmRZbXKpQV5jq/bhv80N0J76cDgsytabp?=
 =?us-ascii?Q?QAzTT+S/lbxC6W5IplAZ+kHE7ZTKybZcWH697rvY1FaR+/gjVs4E9+PIrxO6?=
 =?us-ascii?Q?BeGsajY11ihf2Rc25YaHJNe/I4DFFTaWR5HSGSG4DRj1Zd2ntnKGYvzkmSyu?=
 =?us-ascii?Q?ualkmOp+UU6Nl8QaPqkVe4tc+JK3B7QHdUWjuItMjQoh5eU0T1OhZyad6qxy?=
 =?us-ascii?Q?/ltZ+Q0uTe09uoaHWkpyOTCxWH64p4YL3eGsfNi57Kdn0ZaWXdZNn9Ev5d/d?=
 =?us-ascii?Q?Ew/vaTF1ZnIhefClskK265IGW/m2QleFv1J5+UhDApJpYjNL+ZBk99S1oU9u?=
 =?us-ascii?Q?tfh0MPnJ2vsvQl7x1T+Fwyj+fcgRlwp+WdAvZiIRRhK6B9f15GzQlxYsLdVP?=
 =?us-ascii?Q?m0POVxgtLcooi15zZn4jQqfsJLkePG3u447QSbWTxFjJbuLLG8DOv9Z19/sa?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aa8603-7927-4343-317e-08dcee46977c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 00:56:53.7520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6N2ffCuavPeL0Y8HjLNoc4MiDmAhl74oF17CK9OWdHu+3y+yPVzRwEokVgaWbfuAhZlyo9ssWbflENrwlsvd1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7762
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

On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
> > 
> > Matthew Brost <matthew.brost@intel.com> writes:
> > 
> > > Add migrate_device_prepoluated_range which prepares an array of
> > > pre-populated device pages for migration.
> > 
> > It would be nice if the commit message could also include an explanation
> > of why the existing migrate_device_range() is inadequate for your needs.
> > 
> 
> Yea, my bad. It should explain this is required for non-contiguous
> device pages. I suppose I could always iterate for contiguous regions
> with migrate_device_range too if you think that is better.
> 
> > > v2:
> > >  - s/migrate_device_vma_range/migrate_device_prepopulated_range
> > >  - Drop extra mmu invalidation (Vetter)
> > >
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  include/linux/migrate.h |  1 +
> > >  mm/migrate_device.c     | 35 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 36 insertions(+)
> > >
> > > diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> > > index 002e49b2ebd9..9146ed39a2a3 100644
> > > --- a/include/linux/migrate.h
> > > +++ b/include/linux/migrate.h
> > > @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
> > >  void migrate_vma_finalize(struct migrate_vma *migrate);
> > >  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> > >  			unsigned long npages);
> > > +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages);
> > >  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
> > >  			unsigned long npages);
> > >  void migrate_device_finalize(unsigned long *src_pfns,
> > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > index 9cf26592ac93..f163c2131022 100644
> > > --- a/mm/migrate_device.c
> > > +++ b/mm/migrate_device.c
> > > @@ -924,6 +924,41 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
> > >  }
> > >  EXPORT_SYMBOL(migrate_device_range);
> > >  
> > > +/**
> > > + * migrate_device_prepopulated_range() - migrate device private pfns to normal memory.
> > > + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> > > + * @npages: number of pages to migrate.
> > > + *
> > > + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> > > + * array of device pages to migrate.
> > > + */
> > > +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages)
> > 
> > I don't love the name, I think because it is quite long and makes me
> > think of something complicated like prefaulting. Perhaps
> > migrate_device_pfns()?
> > 
> 
> Sure.
> 
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i = 0; i < npages; i++) {
> > > +		struct page *page = pfn_to_page(src_pfns[i]);
> > > +
> > > +		if (!get_page_unless_zero(page)) {
> > > +			src_pfns[i] = 0;
> > > +			continue;
> > > +		}
> > > +
> > > +		if (!trylock_page(page)) {
> > > +			src_pfns[i] = 0;
> > > +			put_page(page);
> > > +			continue;
> > > +		}
> > > +
> > > +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> > 
> > This needs to be converted to use a folio like
> > migrate_device_range(). But more importantly this should be split out as
> > a function that both migrate_device_range() and this function can call
> > given this bit is identical.
> > 
> 
> Missed the folio conversion and agree a helper shared between this
> function and migrate_device_range would be a good idea. Let add that.
> 

Alistair,

Ok, I think now I want to go slightly different direction here to give
GPUSVM a bit more control over several eviction scenarios.

What if I exported the helper discussed above, e.g.,

 905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
 906 {
 907         struct folio *folio;
 908
 909         folio = folio_get_nontail_page(pfn_to_page(pfn));
 910         if (!folio)
 911                 return 0;
 912
 913         if (!folio_trylock(folio)) {
 914                 folio_put(folio);
 915                 return 0;
 916         }
 917
 918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
 919 }
 920 EXPORT_SYMBOL(migrate_device_pfn_lock);

And then also export migrate_device_unmap.

The usage here would be let a driver collect the device pages in virtual
address range via hmm_range_fault, lock device pages under notifier
lock ensuring device pages are valid, drop the notifier lock and call
migrate_device_unmap. Sima has strongly suggested avoiding a CPUVMA
lookup during eviction cases and this would let me fixup
drm_gpusvm_range_evict in [1] to avoid this.

It would also make the function exported in this patch unnecessary too
as non-contiguous pfns can be setup on driver side via
migrate_device_pfn_lock and then migrate_device_unmap can be called.
This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
in [1].

Do you see an issue exporting migrate_device_pfn_lock,
migrate_device_unmap?

Matt

[1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2

> Matt
> 
> > > +	}
> > > +
> > > +	migrate_device_unmap(src_pfns, npages, NULL);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> > > +
> > >  /*
> > >   * Migrate a device coherent folio back to normal memory. The caller should have
> > >   * a reference on folio which will be copied to the new folio if migration is
> > 
