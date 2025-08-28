Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFACB3AB40
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC1210EAB6;
	Thu, 28 Aug 2025 20:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IftkQ3AL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A2410EAB6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756411522; x=1787947522;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r31TiDGfiIIrrveKhMiN30ef1grZeHP8CEH3M6qypNs=;
 b=IftkQ3ALTa5ynd/EhFQCtzOoE5gM2iYt7lc8XNucfKlus6ieP2S7V5eY
 FC0LbAXFTOjZHSGoaRvCtAgQjIaoUDnVuYA1qbEMmia3wvXjfiLmwjeRe
 3E5luF03qZe/RNs0+DRD8DgqaueEyOYaUQ1aJZtGp1487Vnf1NVjVz6Yw
 csv9AnN2Fi7wXxoElV6QRiMdMFTvbTLbYC8rTahZlguRVQsZYaKLyQTue
 QCe8z5UIPlG9Dl50EsXdYYyALizPG6R/WM4XUa1qS/j29HgduOfx+gCQV
 DDNwtqrl2nIfTLzijtAupmape/L3crwZN+3oDCHnZ2C6z81nizh1PSH2k A==;
X-CSE-ConnectionGUID: NrRj43LZQkeDoe68Fi6n9Q==
X-CSE-MsgGUID: Xboc7nm0Q9qQE37lOBMZ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84097078"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84097078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:05:22 -0700
X-CSE-ConnectionGUID: wqd3X3o9Rf+IjULi4BNADw==
X-CSE-MsgGUID: hPgrFCR2RPu5c/xqXLnG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169505616"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 13:05:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:05:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 13:05:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 13:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnK4tYdogx2Jqh7vpAtyr/2Mr4eIR/haTwty3gXXCIvdjuqfP1OZXgi7rx5d2hOqcXipPP0PEeJ26ShnR+aDpso4iB4jZ7KlVemOyAPekbZ8svfO98n+FVeEyzjao05s5eo2UYcm1k+xPhS1im7WQ1fTHM+ty1v/vAZ7ItyZEc/qxG5izZJ8XWcNQ7AepTyWNSSix+QMETb4NrV2FM8Brfl6Jb5rQuVYIdgp9kd1Sf2XlMBlCqqU9UWXkSj4iQGwWtR5UwlYuGVMXtAtttE+bZoLYHAMlNRqB//ydAMAmDT/8catbsTdNN/HU/xidFE0YM53K2XxI9TcLpPhyuHKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cobWRLKyR0HmZLAamDr2rsY8u8HnH8FNMbnRQIaqjjw=;
 b=Lbi0VCskI1pI4AUBItKA9ksIIId4uXveNB6fDorkcpYPTBvoXodJCwpkEgGpYTTMm7E8ptWdy6Hui613qEn0J/stzOHnLhpt0mE7/SMsZ55eVx3wje6tHx0oCdqEoIoQDLjGcf/6e5q3N+CCClfuZgG2WdgFpMRL980e04VfqZ6BRzTDfbGIREqxLcoeSgviYbbFj3HxCIChKSb/bjtW2DsXB82ERt0RWi5uKZTOsUApt0lYGA/wXiejswYlsjpq20UyGd1MfaDMsQXtXoObCFaUeHgJdtSVp17FlR9DvsI83zCdEqqOyP6r6cv8DtQ6pgfzsBHuJeL8lDkIfHtYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 20:05:07 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 20:05:07 +0000
Date: Thu, 28 Aug 2025 13:05:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, "Oscar
 Salvador" <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
Message-ID: <aLC2bfpIQo/a22gr@lstrano-desk.jf.intel.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812024036.690064-3-balbirs@nvidia.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d8dc04-0790-453c-3172-08dde66e2f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8F29wVnoBRA72BSmHRivrKwW7nqmBQZgTjj6PeMSWyeL5sVIM44uA7zsIB?=
 =?iso-8859-1?Q?9DKv81WjdDuQ0oZAuRhfYyfvg4MGB5UfObTYTrfhTk+MXDzdopmirkDoCH?=
 =?iso-8859-1?Q?iNDGDrjIERILBJ+VRWXG6jING5aiv+ZLIScOu/6wupnxrBba6PAvqilzFx?=
 =?iso-8859-1?Q?0Ek8PCVXxostBIrcU9URPeKxNkOnFTAK66MnJQJdDzypWhwBbeRn1KB66G?=
 =?iso-8859-1?Q?j3ekXKtDrXDvnvoGSWvbaLIiqB2L04N2z8LJxGlx4O5xVaS+0RumIOAHai?=
 =?iso-8859-1?Q?87hOE1mfep6wywS7TBnZJAC38Pxa5/EsiBtSlcvq/pdiYU4TOUSZtL8WpN?=
 =?iso-8859-1?Q?4quZvEVWVZsGCPeVqQL7C8siFRvljw+o1fYM9gqScgw2dXm87pusCzscdV?=
 =?iso-8859-1?Q?k2gOPUc3GShKMw+sO3xua2JkRu6mdqHJCQwjE1TC76lTsUuwoxfo0l7I8q?=
 =?iso-8859-1?Q?thM90XAR+YTA7AWyXk3U160ONHByPHNqb8eS3PAhLfLAJrMd3X2m3Ae2UB?=
 =?iso-8859-1?Q?wtajtj9t3ztScFfpHlBjLM1jN+iwWqcL/On55DFzMgcbBvWi1GABxOwzI1?=
 =?iso-8859-1?Q?rJtjVIqAIkIij0hXnFqhyW0Jzk5uzyMEWwhUzYzPey2rznJ9of7YUIZv4W?=
 =?iso-8859-1?Q?juP2EGpagqxkA29ubZiC32gWWnhAtBMIs4242ZhRBrd7fmkq6xPsNsKo77?=
 =?iso-8859-1?Q?TILwmfs8DRSey3hYMKEmc323iF9cpa8usy3/5m3PypeEVcgX0Pteydk4kb?=
 =?iso-8859-1?Q?YeKEdN9r6JDy8xN96lwU5K3DDJ4OHQPikQC54l72UPdMptoyAIWHg+d+dw?=
 =?iso-8859-1?Q?qI6/h8CrUFu3EHmSTC5brjojy0XBkL+/gpeuRAQLHRQ1wXKVfJdA6x78Y4?=
 =?iso-8859-1?Q?C/5DK7lXyhPeyzWJ/cSRe23XJmcYsLFfKrHx1j4ALETVcLhF0OJtCQg6UR?=
 =?iso-8859-1?Q?BC7PWo1mNaSU0Zhjy+Bvrun3jlen8ku5sJS7ifD74RlD7uaei3XsR5esH/?=
 =?iso-8859-1?Q?uZDVKxuGExWYEiNKnYexghCvmMnM/YcaceqTAPyenYaTG4rx7UQ90J1NfF?=
 =?iso-8859-1?Q?v5+od9YaLwh5UihWZDAGPIno0D5oyeVgz1ekiPlL+fFcInRciUMN+jqYrN?=
 =?iso-8859-1?Q?r4qg78vgpRGv0oi9YVCuD/h6nJHWaYLNtvt3tYtP0NlynW8Qh3LFVaU/pc?=
 =?iso-8859-1?Q?J7BRbYxbj0U8tV3bTVAO7sZwui1tUOL0z+mOAlqOnW9fwIgXE0FMPJQy5R?=
 =?iso-8859-1?Q?YZjZd6oecUZtllsU9tz8rGqNzsgGJ+U8MOtni98Pq3HyHX+iudHffJoQse?=
 =?iso-8859-1?Q?4rF0EA9idv7Jmt3TTJ9eFlLrMyNuntH0uSm2+ByIK97VvqXu5EbZixzC4v?=
 =?iso-8859-1?Q?7VsPiLdpuA2ecVHXAA2uaGduyQOPZnuwhVWJ3Du6nrs46gFZJdqQg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Dq8P3D+W/qj8qcDcyL412rCBYlTPYowljn8qFFp3KEWMCk3CgYbXnhboMg?=
 =?iso-8859-1?Q?PH6au+9RioO6io4KWQc9hA+EFZRBy7lc7yEU8aZ63dFCc+UKaVNIama9/6?=
 =?iso-8859-1?Q?pO/zfuUpp/a6Ijr2OqQRaz+6ZKM+ZDs+9Xota5SYXYNLOr+PCH3Rs5zhdG?=
 =?iso-8859-1?Q?qH77byJd+QzHkicC8fg6p/kvFGEh5zqyJhS/U5TZQcOjM+AEZTt9buIDkN?=
 =?iso-8859-1?Q?5b1A/3LT7s3nkw3jYG967u/M/39BG/GtQvtYgXZAPMykwlWjdXAR9+oC1l?=
 =?iso-8859-1?Q?V99zh2alxJ2Edv3QzCo/nhcU5+fZ6gPGb2unvZsTxxRkXXcYukOcjnupWY?=
 =?iso-8859-1?Q?NZjmsIbAqW2HCVlENZmptlV6b9FfJUmqUrJxh+JyIjhPM9yojmfOJ29uwS?=
 =?iso-8859-1?Q?G0oofYn6Nb0m7BnDetyQIqem/X/8/rBzbKz0bRfO4/QiotSmXBjJ1l5+x7?=
 =?iso-8859-1?Q?Y2lilBQTy+kEn6pEjFW9lhz8kSAFkJSuk1qvL1jXgQDW0lQUN0tkVLjQvb?=
 =?iso-8859-1?Q?8DAtRZAcT/tTwbdfQosOS4irmHOLZh/NNfb7g4BdJh+8vie63m1nsPNmKr?=
 =?iso-8859-1?Q?cP6axm91L9rJKuwx8KnGomkuNiKQ8NIjWu/fput9hK7vDLeLCzZnzKOjGi?=
 =?iso-8859-1?Q?QdX0FARe5C4eXsBCs1xnOhb7ACgfjovDn/RRHO/ZGVfinbt55nLvvBd7dW?=
 =?iso-8859-1?Q?tRwDqnaM+d1Zu6RQGSVDAx+QJTzhlMvzKHRpxIfHbNTh8PoMyEAYsziATb?=
 =?iso-8859-1?Q?lU7JCbgMMv6a/7l+Ap2m41FtWInPVwHvIycXOWhwWbMHY6tx4gtvay3lBZ?=
 =?iso-8859-1?Q?8Tv3d54NJjYGJIpic8AN6q6pu6Tx5e91x1xVkUriE350SAJmGCLdG8M30l?=
 =?iso-8859-1?Q?nLkAKSwgNHg0cUKHpAociWN5QdoxkAiiHwKigP1pGSQDT1vHXU1OiCdM3K?=
 =?iso-8859-1?Q?meYj/ResSqq/bVyH5P0UTQnfh0EY3nldfFyt+Bp3QJjIr8azElGRsoGa9H?=
 =?iso-8859-1?Q?2wffWSrdoG9DD7aMXp4OGFAOBRnScYemh0vetNJwxnw0+sUxUBS4k9pKTu?=
 =?iso-8859-1?Q?SEYsGtqqbD5n2tWEtIk83ukhgw5knbACTkfMANBzLKLFfVPPUY9kacrvyI?=
 =?iso-8859-1?Q?I17c+znmhzpZQLndwzZYcPhmL8bkGS0KZJ9h2TybirENRqpAlzTISFHNsA?=
 =?iso-8859-1?Q?imZ/F93lXLDe8/uJW3bJHqE+Ry+ba9eHEmTIApfUUPQz4qp4qir1rMAmhq?=
 =?iso-8859-1?Q?g0J5LXt4mWd94UVRWEETSehB07eaehOeIsSlL0gYNnnRRDnQESustqjqYa?=
 =?iso-8859-1?Q?MY7mUILL+NyEw5geID6nC57QclKpxlCbGmvbM973hYepBAXnJA0glOJrLj?=
 =?iso-8859-1?Q?JD66Je/+42c853kGV9HgheqQ0RBuduKatkQvgocsVrb2rs2+gDiXDzBtdE?=
 =?iso-8859-1?Q?DvK1Jl8E2aW2BxfWxOlTfs2gGg+KbyFLgY4ivqiIbRro7qdbntNbER4qXH?=
 =?iso-8859-1?Q?Pz8QPcT/bHHaY5aTs5vtriWpj5yUTIgUDFYL+bf95Q7DnXX0ziQG8KAtVI?=
 =?iso-8859-1?Q?/t8ysuvRwz60Otk4E80QO/xCBp0XEi0Cjv39BxpLL+LNh7KIDkZvA7Qjil?=
 =?iso-8859-1?Q?0OWDVk8tghCcg701Ci1LAzI+KIn8SlCmqcgh3tn8RK8yqBor98lFEL3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d8dc04-0790-453c-3172-08dde66e2f4b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 20:05:07.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/7V4rwX0MLuZ9Er2kl3GUQbrEmhliC7BYejoCptn2LWQG4DFjGjlcBXRAyr0DxDXqvhge+7uAlZ72xV0fmJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

On Tue, Aug 12, 2025 at 12:40:27PM +1000, Balbir Singh wrote:
> Make THP handling code in the mm subsystem for THP pages aware of zone
> device pages. Although the code is designed to be generic when it comes
> to handling splitting of pages, the code is designed to work for THP
> page sizes corresponding to HPAGE_PMD_NR.
> 
> Modify page_vma_mapped_walk() to return true when a zone device huge
> entry is present, enabling try_to_migrate() and other code migration
> paths to appropriately process the entry. page_vma_mapped_walk() will
> return true for zone device private large folios only when
> PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
> not zone device private pages from having to add awareness. The key
> callback that needs this flag is try_to_migrate_one(). The other
> callbacks page idle, damon use it for setting young/dirty bits, which is
> not significant when it comes to pmd level bit harvesting.
> 
> pmd_pfn() does not work well with zone device entries, use
> pfn_pmd_entry_to_swap() for checking and comparison as for zone device
> entries.
> 
> Support partial unmapping of zone device private entries, which happens
> via munmap(). munmap() causes the device private entry pmd to be split,
> but the corresponding folio is not split. Deferred split does not work for
> zone device private folios due to the need to split during fault
> handling. Get migrate_vma_collect_pmd() to handle this case by splitting
> partially unmapped device private folios.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/rmap.h    |   2 +
>  include/linux/swapops.h |  17 ++++
>  lib/test_hmm.c          |   2 +-
>  mm/huge_memory.c        | 214 +++++++++++++++++++++++++++++++---------
>  mm/migrate_device.c     |  47 +++++++++
>  mm/page_vma_mapped.c    |  13 ++-
>  mm/pgtable-generic.c    |   6 ++
>  mm/rmap.c               |  24 ++++-
>  8 files changed, 272 insertions(+), 53 deletions(-)
> 
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 6cd020eea37a..dfb7aae3d77b 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -927,6 +927,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  #define PVMW_SYNC		(1 << 0)
>  /* Look for migration entries rather than present PTEs */
>  #define PVMW_MIGRATION		(1 << 1)
> +/* Look for device private THP entries */
> +#define PVMW_THP_DEVICE_PRIVATE	(1 << 2)
>  
>  struct page_vma_mapped_walk {
>  	unsigned long pfn;
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..2641c01bd5d2 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>  {
>  	return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
>  }
> +
>  #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>  static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>  		struct page *page)
> @@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>  }
>  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>  
> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
> +}
> +
> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
>  static inline int non_swap_entry(swp_entry_t entry)
>  {
>  	return swp_type(entry) >= MAX_SWAPFILES;
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 761725bc713c..297f1e034045 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>  	 * the mirror but here we use it to hold the page for the simulated
>  	 * device memory and that page holds the pointer to the mirror.
>  	 */
> -	rpage = vmf->page->zone_device_data;
> +	rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;
>  	dmirror = rpage->zone_device_data;
>  
>  	/* FIXME demonstrate how we can adjust migrate range */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9c38a95e9f09..2495e3fdbfae 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  	if (unlikely(is_swap_pmd(pmd))) {
>  		swp_entry_t entry = pmd_to_swp_entry(pmd);
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -		if (!is_readable_migration_entry(entry)) {
> +		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
> +				!is_pmd_device_private_entry(pmd));
> +
> +		if (is_migration_entry(entry) &&
> +			is_writable_migration_entry(entry)) {
>  			entry = make_readable_migration_entry(
>  							swp_offset(entry));
>  			pmd = swp_entry_to_pmd(entry);
> @@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  				pmd = pmd_swp_mkuffd_wp(pmd);
>  			set_pmd_at(src_mm, addr, src_pmd, pmd);
>  		}
> +
> +		if (is_device_private_entry(entry)) {
> +			if (is_writable_device_private_entry(entry)) {
> +				entry = make_readable_device_private_entry(
> +					swp_offset(entry));
> +				pmd = swp_entry_to_pmd(entry);
> +
> +				if (pmd_swp_soft_dirty(*src_pmd))
> +					pmd = pmd_swp_mksoft_dirty(pmd);
> +				if (pmd_swp_uffd_wp(*src_pmd))
> +					pmd = pmd_swp_mkuffd_wp(pmd);
> +				set_pmd_at(src_mm, addr, src_pmd, pmd);
> +			}
> +
> +			src_folio = pfn_swap_entry_folio(entry);
> +			VM_WARN_ON(!folio_test_large(src_folio));
> +
> +			folio_get(src_folio);
> +			/*
> +			 * folio_try_dup_anon_rmap_pmd does not fail for
> +			 * device private entries.
> +			 */
> +			VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
> +					  &src_folio->page, dst_vma, src_vma));

VM_WARN_ON compiles out in non-debug builds. I hit this running the
fork self I shared with a non-debug build.

Matt 

[1] https://elixir.bootlin.com/linux/v6.16.3/source/include/linux/mmdebug.h#L112

> +		}
> +
>  		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>  		mm_inc_nr_ptes(dst_mm);
>  		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
> @@ -2219,15 +2248,22 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			folio_remove_rmap_pmd(folio, page, vma);
>  			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>  			VM_BUG_ON_PAGE(!PageHead(page), page);
> -		} else if (thp_migration_supported()) {
> +		} else if (is_pmd_migration_entry(orig_pmd) ||
> +				is_pmd_device_private_entry(orig_pmd)) {
>  			swp_entry_t entry;
>  
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>  			entry = pmd_to_swp_entry(orig_pmd);
>  			folio = pfn_swap_entry_folio(entry);
>  			flush_needed = 0;
> -		} else
> -			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +
> +			if (!thp_migration_supported())
> +				WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +
> +			if (is_pmd_device_private_entry(orig_pmd)) {
> +				folio_remove_rmap_pmd(folio, &folio->page, vma);
> +				WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			}
> +		}
>  
>  		if (folio_test_anon(folio)) {
>  			zap_deposited_table(tlb->mm, pmd);
> @@ -2247,6 +2283,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  				folio_mark_accessed(folio);
>  		}
>  
> +		/*
> +		 * Do a folio put on zone device private pages after
> +		 * changes to mm_counter, because the folio_put() will
> +		 * clean folio->mapping and the folio_test_anon() check
> +		 * will not be usable.
> +		 */
> +		if (folio_is_device_private(folio))
> +			folio_put(folio);
> +
>  		spin_unlock(ptl);
>  		if (flush_needed)
>  			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2375,7 +2420,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		struct folio *folio = pfn_swap_entry_folio(entry);
>  		pmd_t newpmd;
>  
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_WARN_ON(!is_pmd_migration_entry(*pmd) &&
> +			   !folio_is_device_private(folio));
>  		if (is_writable_migration_entry(entry)) {
>  			/*
>  			 * A protection check is difficult so
> @@ -2388,6 +2434,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			newpmd = swp_entry_to_pmd(entry);
>  			if (pmd_swp_soft_dirty(*pmd))
>  				newpmd = pmd_swp_mksoft_dirty(newpmd);
> +		} else if (is_writable_device_private_entry(entry)) {
> +			entry = make_readable_device_private_entry(
> +							swp_offset(entry));
> +			newpmd = swp_entry_to_pmd(entry);
>  		} else {
>  			newpmd = *pmd;
>  		}
> @@ -2842,16 +2892,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	struct page *page;
>  	pgtable_t pgtable;
>  	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> -	bool anon_exclusive = false, dirty = false;
> +	bool young, write, soft_dirty, uffd_wp = false;
> +	bool anon_exclusive = false, dirty = false, present = false;
>  	unsigned long addr;
>  	pte_t *pte;
>  	int i;
> +	swp_entry_t swp_entry;
>  
>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
> +
> +	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
> +			&& !(is_pmd_device_private_entry(*pmd)));
>  
>  	count_vm_event(THP_SPLIT_PMD);
>  
> @@ -2899,18 +2952,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>  	}
>  
> -	pmd_migration = is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>  
> +	present = pmd_present(*pmd);
> +	if (unlikely(!present)) {
> +		swp_entry = pmd_to_swp_entry(*pmd);
>  		old_pmd = *pmd;
> -		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_swap_entry_to_page(entry);
> -		write = is_writable_migration_entry(entry);
> -		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_WARN_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));
> +		page = pfn_swap_entry_to_page(swp_entry);
> +
> +		if (is_pmd_migration_entry(old_pmd)) {
> +			write = is_writable_migration_entry(swp_entry);
> +			if (PageAnon(page))
> +				anon_exclusive =
> +					is_readable_exclusive_migration_entry(
> +								swp_entry);
> +			young = is_migration_entry_young(swp_entry);
> +			dirty = is_migration_entry_dirty(swp_entry);
> +		} else if (is_pmd_device_private_entry(old_pmd)) {
> +			write = is_writable_device_private_entry(swp_entry);
> +			anon_exclusive = PageAnonExclusive(page);
> +			if (freeze && anon_exclusive &&
> +			    folio_try_share_anon_rmap_pmd(folio, page))
> +				freeze = false;
> +			if (!freeze) {
> +				rmap_t rmap_flags = RMAP_NONE;
> +
> +				if (anon_exclusive)
> +					rmap_flags |= RMAP_EXCLUSIVE;
> +
> +				folio_ref_add(folio, HPAGE_PMD_NR - 1);
> +				if (anon_exclusive)
> +					rmap_flags |= RMAP_EXCLUSIVE;
> +				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
> +						 vma, haddr, rmap_flags);
> +			}
> +		}
> +
>  		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>  		uffd_wp = pmd_swp_uffd_wp(old_pmd);
>  	} else {
> @@ -2996,30 +3076,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	 * Note that NUMA hinting access restrictions are not transferred to
>  	 * avoid any possibility of altering permissions across VMAs.
>  	 */
> -	if (freeze || pmd_migration) {
> +	if (freeze || !present) {
>  		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>  			pte_t entry;
> -			swp_entry_t swp_entry;
> -
> -			if (write)
> -				swp_entry = make_writable_migration_entry(
> -							page_to_pfn(page + i));
> -			else if (anon_exclusive)
> -				swp_entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(page + i));
> -			else
> -				swp_entry = make_readable_migration_entry(
> -							page_to_pfn(page + i));
> -			if (young)
> -				swp_entry = make_migration_entry_young(swp_entry);
> -			if (dirty)
> -				swp_entry = make_migration_entry_dirty(swp_entry);
> -			entry = swp_entry_to_pte(swp_entry);
> -			if (soft_dirty)
> -				entry = pte_swp_mksoft_dirty(entry);
> -			if (uffd_wp)
> -				entry = pte_swp_mkuffd_wp(entry);
> -
> +			if (freeze || is_migration_entry(swp_entry)) {
> +				if (write)
> +					swp_entry = make_writable_migration_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_migration_entry(
> +								page_to_pfn(page + i));
> +				if (young)
> +					swp_entry = make_migration_entry_young(swp_entry);
> +				if (dirty)
> +					swp_entry = make_migration_entry_dirty(swp_entry);
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			} else {
> +				/*
> +				 * anon_exclusive was already propagated to the relevant
> +				 * pages corresponding to the pte entries when freeze
> +				 * is false.
> +				 */
> +				if (write)
> +					swp_entry = make_writable_device_private_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_device_private_entry(
> +								page_to_pfn(page + i));
> +				/*
> +				 * Young and dirty bits are not progated via swp_entry
> +				 */
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			}
>  			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>  			set_pte_at(mm, addr, pte + i, entry);
>  		}
> @@ -3046,7 +3145,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  	}
>  	pte_unmap(pte);
>  
> -	if (!pmd_migration)
> +	if (present)
>  		folio_remove_rmap_pmd(folio, page, vma);
>  	if (freeze)
>  		put_page(page);
> @@ -3058,8 +3157,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>  			   pmd_t *pmd, bool freeze)
>  {
> +
>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
> +	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
> +			(is_pmd_device_private_entry(*pmd)))
>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>  }
>  
> @@ -3238,6 +3339,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>  	lockdep_assert_held(&lruvec->lru_lock);
>  
> +	if (folio_is_device_private(folio))
> +		return;
> +
>  	if (list) {
>  		/* page reclaim is reclaiming a huge page */
>  		VM_WARN_ON(folio_test_lru(folio));
> @@ -3252,6 +3356,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>  			list_add_tail(&new_folio->lru, &folio->lru);
>  		folio_set_lru(new_folio);
>  	}
> +
>  }
>  
>  /* Racy check whether the huge page can be split */
> @@ -3727,7 +3832,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  
>  	/* Prevent deferred_split_scan() touching ->_refcount */
>  	spin_lock(&ds_queue->split_queue_lock);
> -	if (folio_ref_freeze(folio, 1 + extra_pins)) {
> +	if (folio_ref_freeze(folio, 1 + folio_expected_ref_count(folio))) {
>  		struct address_space *swap_cache = NULL;
>  		struct lruvec *lruvec;
>  		int expected_refs;
> @@ -3858,8 +3963,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>  	if (nr_shmem_dropped)
>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>  
> -	if (!ret && is_anon)
> +	if (!ret && is_anon && !folio_is_device_private(folio))
>  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
> +
>  	remap_page(folio, 1 << order, remap_flags);
>  
>  	/*
> @@ -4603,7 +4709,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>  		return 0;
>  
>  	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (unlikely(is_pmd_device_private_entry(*pvmw->pmd)))
> +		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);
> +	else
> +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>  
>  	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>  	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
> @@ -4653,6 +4762,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>  	entry = pmd_to_swp_entry(*pvmw->pmd);
>  	folio_get(folio);
>  	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> +
> +	if (folio_is_device_private(folio)) {
> +		if (pmd_write(pmde))
> +			entry = make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry = make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde = swp_entry_to_pmd(entry);
> +	}
> +
>  	if (pmd_swp_soft_dirty(*pvmw->pmd))
>  		pmde = pmd_mksoft_dirty(pmde);
>  	if (is_writable_migration_entry(entry))
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index e05e14d6eacd..0ed337f94fcd 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -136,6 +136,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			 * page table entry. Other special swap entries are not
>  			 * migratable, and we ignore regular swapped page.
>  			 */
> +			struct folio *folio;
> +
>  			entry = pte_to_swp_entry(pte);
>  			if (!is_device_private_entry(entry))
>  				goto next;
> @@ -147,6 +149,51 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			    pgmap->owner != migrate->pgmap_owner)
>  				goto next;
>  
> +			folio = page_folio(page);
> +			if (folio_test_large(folio)) {
> +				struct folio *new_folio;
> +				struct folio *new_fault_folio = NULL;
> +
> +				/*
> +				 * The reason for finding pmd present with a
> +				 * device private pte and a large folio for the
> +				 * pte is partial unmaps. Split the folio now
> +				 * for the migration to be handled correctly
> +				 */
> +				pte_unmap_unlock(ptep, ptl);
> +
> +				folio_get(folio);
> +				if (folio != fault_folio)
> +					folio_lock(folio);
> +				if (split_folio(folio)) {
> +					if (folio != fault_folio)
> +						folio_unlock(folio);
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				new_folio = page_folio(page);
> +				if (fault_folio)
> +					new_fault_folio = page_folio(migrate->fault_page);
> +
> +				/*
> +				 * Ensure the lock is held on the correct
> +				 * folio after the split
> +				 */
> +				if (!new_fault_folio) {
> +					folio_unlock(folio);
> +					folio_put(folio);
> +				} else if (folio != new_fault_folio) {
> +					folio_get(new_fault_folio);
> +					folio_lock(new_fault_folio);
> +					folio_unlock(folio);
> +					folio_put(folio);
> +				}
> +
> +				addr = start;
> +				goto again;
> +			}
> +
>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (is_writable_device_private_entry(entry))
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e981a1a292d2..246e6c211f34 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>  			pmde = *pvmw->pmd;
>  			if (!pmd_present(pmde)) {
> -				swp_entry_t entry;
> +				swp_entry_t entry = pmd_to_swp_entry(pmde);
>  
>  				if (!thp_migration_supported() ||
>  				    !(pvmw->flags & PVMW_MIGRATION))
>  					return not_found(pvmw);
> -				entry = pmd_to_swp_entry(pmde);
>  				if (!is_migration_entry(entry) ||
>  				    !check_pmd(swp_offset_pfn(entry), pvmw))
>  					return not_found(pvmw);
> @@ -277,6 +276,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  			 * cannot return prematurely, while zap_huge_pmd() has
>  			 * cleared *pmd but not decremented compound_mapcount().
>  			 */
> +			swp_entry_t entry;
> +
> +			entry = pmd_to_swp_entry(pmde);
> +
> +			if (is_device_private_entry(entry) &&
> +				(pvmw->flags & PVMW_THP_DEVICE_PRIVATE)) {
> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> +				return true;
> +			}
> +
>  			if ((pvmw->flags & PVMW_SYNC) &&
>  			    thp_vma_suitable_order(vma, pvmw->address,
>  						   PMD_ORDER) &&
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..604e8206a2ec 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>  		*pmdvalp = pmdval;
>  	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>  		goto nomap;
> +	if (is_swap_pmd(pmdval)) {
> +		swp_entry_t entry = pmd_to_swp_entry(pmdval);
> +
> +		if (is_device_private_entry(entry))
> +			goto nomap;
> +	}
>  	if (unlikely(pmd_trans_huge(pmdval)))
>  		goto nomap;
>  	if (unlikely(pmd_bad(pmdval))) {
> diff --git a/mm/rmap.c b/mm/rmap.c
> index b5837075b6e0..f40e45564295 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2285,7 +2285,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  		     unsigned long address, void *arg)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
> -	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> +	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address,
> +				PVMW_THP_DEVICE_PRIVATE);
>  	bool anon_exclusive, writable, ret = true;
>  	pte_t pteval;
>  	struct page *subpage;
> @@ -2330,6 +2331,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  	while (page_vma_mapped_walk(&pvmw)) {
>  		/* PMD-mapped THP migration entry */
>  		if (!pvmw.pte) {
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +			unsigned long pfn;
> +#endif
> +
>  			if (flags & TTU_SPLIT_HUGE_PMD) {
>  				split_huge_pmd_locked(vma, pvmw.address,
>  						      pvmw.pmd, true);
> @@ -2338,8 +2343,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  				break;
>  			}
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -			subpage = folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			/*
> +			 * Zone device private folios do not work well with
> +			 * pmd_pfn() on some architectures due to pte
> +			 * inversion.
> +			 */
> +			if (is_pmd_device_private_entry(*pvmw.pmd)) {
> +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> +
> +				pfn = swp_offset_pfn(entry);
> +			} else {
> +				pfn = pmd_pfn(*pvmw.pmd);
> +			}
> +
> +			subpage = folio_page(folio, pfn - folio_pfn(folio));
> +
>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>  					!folio_test_pmd_mappable(folio), folio);
>  
> -- 
> 2.50.1
> 
