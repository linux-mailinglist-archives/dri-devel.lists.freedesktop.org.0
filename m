Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C902A89A3D1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF59B11369F;
	Fri,  5 Apr 2024 18:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PiRREsWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2112.outbound.protection.outlook.com [40.107.96.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C860A11369F;
 Fri,  5 Apr 2024 18:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqH2KmMcde0Dbiqc3PbXSlJAxvB1C9JWt+d/c/SS8toymhbSXteLC3a+WuZ8S9zwBW+iDZNL34GnTCveEYH3G8AY8ZW15dQFpjpRrTpRYgs8gHXH761lPv6Y9uUu4J8wcz8b7K2DylfjvgnMswg+IghF4s0eQ9jgrdeu6/GSULZlbh+e2zjb9S5VmMsqcKHYjWUJ2oYfrbxG/koFxR+phk3EdxhyV2lhy6NT0MotAn6ux+fA4qy2cza0DZPhsakNz95LoNCsGSHdnwhxtPrR96+hcr7oUHbH1rMY0iMcJPZl1AqtLv5SbSo6mLz5MjB8bOk1keQa18jbq0OiP2BR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIVmMS9f23ki02g8s16tBUvlavcKzHu8QcZx3Tkwp2U=;
 b=kTgYXmzyOCT+4fnE5399wmhs+jsSW9NOA2H10yRHFXlX8feSQTRjV9QvqXiL/EWf97Vs332oZJmHy2gnlrgYMFB8Wyck6nmIXncrvygF9dgjC1BOaY+1BtiOgG0JklcL4mBu0HsyHnhEzNuqr33hw/rMZbJ1cnNX45tayhBJ69YgMyFHsrT/QP5jdJtRSMUUxXY6Yb8WAQGxACLTEpi285wfMGKBQnMclWW09lOd5tCoMpFSszdTI86GJvF+sAOT2Fiwc+fOdSqIHmghLXLIWfhUXVqybfor/7TcmUWQoMsQNnnnZ/2iL10r+xD1mP+i1OZLompGtH4YQM8ElxktdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIVmMS9f23ki02g8s16tBUvlavcKzHu8QcZx3Tkwp2U=;
 b=PiRREsWcCP4zHpZmQstF0OxieQuMRGXKAxuuN+KsCCV0xwRox6ntFHMbKG96qD07tqOejTqxaPVywRk4ipUqvnHnAUwV+dOT55pokmb0md9D6bY2OYPVM5+ZcRU1odEovNUd1pEBVjjSKPkpiLewWTdFV9PrAr73HQzL0CyQiZIYyYZBnvcVHtYIt2d8aDTNrK6fIDdhF9+EvO1gF8YGHcXdEZnG498LvzCxFYBvDjV/XfmBkg7S/pHLJyDh/1GkeZeMRIUpxwnUM57UHf9A2AAhFLP55ImAA7Ds+qD28rntaD9okKW1QzmxC/SHokuu4jFbUt43o+9M1s3BwCxKGA==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.54; Fri, 5 Apr 2024 18:02:14 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 18:02:13 +0000
Date: Fri, 5 Apr 2024 15:02:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240405180212.GG5383@nvidia.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR15CA0066.namprd15.prod.outlook.com
 (2603:10b6:208:237::35) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB6012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+ffDDoJNFvBA1g7IN8xaqfVTb0f/siQZaxD0p9Nxik2IEbtLJqBFL9U4AOraIuZo2jxaUgW001XBuTgT6FGmoezLtbXuzlY8yJPRcCpp82SgsLsfZ7ijh4fcONEE2JH/CTZxYj/cC3bWVjuGYqb2VnC2/k83lPPSlrEZg+Hqq8EHAite+uMlS4DAhVkI7Q78jI+Q5HMkgplGEuVjwaiPnRt59JHfZNBmLgRgfF94wPHYe8UtdQHV+Q4/cLKNIio9rwiwfKmQea6JnTaTLo9CUdpw2TmheUlcPUKm6K432obQT8ePfE/mnRLpt78IdtYSUvkPCIgYz92mn13ipG7mOt4GX9CWMn8d3mvrjN23+ryY5SRKEtBicTXjfeoV7o+QET1xcaIdpDQDEMvZyH6T0wpu9+uVTJp4HblD0M9cebnnOCyI01ly6uWbAfio8QtlOssH2RU2BzPd/PdfrBvYJ9nhzom+5oCCbhTgyMGpLWRpEGCv0nmS8R0tamPRDUS2IxTvKbOqaksFh52gEB5ny3FKonNeGLoLyh1GeFBuXVewU0/mQCzqi4JYDnfx2gSR6UzGiW/MT7d81GsR+UoOaRbIgIOpAbv/Mczc1R6SkX0kpsby+G+KXzYD613kKJ573GtrpsELt0ePvPztN6omZK0d6aqFNnGmU1KIO3SeBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?42PU3dInKHmtduY2DnB3R+esG2eAZ0aLTxBp2LUG/vO1zduJl1AnWlS+bnJr?=
 =?us-ascii?Q?S0VROeKh2hPdey0kD7KDnWHlqyjmUJoYsgb3heDHA0KtulSjvUXYm2Jc6cbj?=
 =?us-ascii?Q?JEXgthG1iG3WcCprYSNjL3jKuffNesC1amgb9aIPODD4o0xoq/o6OjF5Dv4G?=
 =?us-ascii?Q?jcW3d8c/6URaV/IFFwUkJgKUovhFPHfcjv9uxhqsfGnCSKaahjmP+iT7pqer?=
 =?us-ascii?Q?0m0DdT+6pwp/bEbfm53opGVBALLcVHxi4/QLGOYpmMxF9u5RD6kJ5pUQyqwe?=
 =?us-ascii?Q?/2fM/ksTWX7LOd8I90/RuFgan6p8NC3SHKVB8rRAOsxYE/9JuYlRxinACHzc?=
 =?us-ascii?Q?lstCfG9f/P6m1RWRNXVNlXsuzn54H30FE8TZMMSk7Axys/UFwF0UcIxbFN5v?=
 =?us-ascii?Q?k8S5hgnfELy1aAjYY4AeInpmcFjHyvGisK4bBNBIweB2Il0nCG1cbisHU1C6?=
 =?us-ascii?Q?QCDEcsM2vLDhsXEddql9GaUzgg0szRZG636Rmc4UhDYWk2Yz5l49ZVIycLfx?=
 =?us-ascii?Q?MxHKsl7ao/r0nkyKNbKTahFRhQZ+6nOv4ytroUxLHcqjsZunR2ggHLIucDLt?=
 =?us-ascii?Q?xXnU33M2YITiHncCpn0Ajd4W63+0ViyRP6V/t6f2MmwNLVdePeHRwaeZVK1P?=
 =?us-ascii?Q?yxtsEEls8cnB9Wua1VAj0XF+eTxeCYS6Kfv4V8I7S8PUaMeUtd3w635pQZox?=
 =?us-ascii?Q?w5z3GOqI9TRbizAweS5eFPfDp7dT3YsQ/sxqVWO1S0ucuWhqLw4EgAjT0Wlc?=
 =?us-ascii?Q?nkb7V6iK/sfCn6V7ReupwQCGkj/0aJ0jOXDO5xP+CXdSCtON7AeRqo4bFEIN?=
 =?us-ascii?Q?I0XHVib3TNVmY4fPkgJ4D5OT6r82xBDSSFC2YrLBRFpSXVOynUEWjBd5EVQ1?=
 =?us-ascii?Q?dIUEqrC07CsV4DnheCgiNvEpjs/DNc2w3cF/5iDL5mix59BnRsWWUBwWtfP6?=
 =?us-ascii?Q?Rcn3jay3UGGDdq1VZfNCLJiMj/pzRg7Ohv/C1alebJ62gG7cRgAwwRnrDHVF?=
 =?us-ascii?Q?Yx0tFDE3/fgEWrCzllyGCzYRxVgx88imt7JIj3oeo0h+UxyV68AbDUk59buF?=
 =?us-ascii?Q?GNeI/Jbfzx8gKFqNvFwME3RYaqnzf33pngwvWDl9kZAlx2VR3eF+QIAtFV5Q?=
 =?us-ascii?Q?XYbLbPV63NtsynqlknhP8NUS8jWSJt/6LQfvORCV8Hi8t7UH8YJnDyHcPXmM?=
 =?us-ascii?Q?ru7FTUCvNcCCsmjrQtmYnpHFb4EELRQXKQIOqvbJJrOfzzJw0YObBeO2DOkY?=
 =?us-ascii?Q?De/JRIdC0AbY27i0sMo4UF4cqG6WRWUegSaXqRSxM5PhW/jf8+39mhtvFhAC?=
 =?us-ascii?Q?qEsRc4QGMvrHT30N+IQCMm/YAf5A6TqfLjo5gFnGD7hydBhhgMBPeQKgfXvL?=
 =?us-ascii?Q?MCeOgEOA/o2Tfqu8KgBmwtGJBNiYfvb2oJzp1v8dKFr9QgrjCH1itPx1cTRY?=
 =?us-ascii?Q?4TiSx3UZWNSgIdYz7CdDDNYpbOh1zQTJMlaVAHjnvVf1QnHWqdD3Q5fYx+pP?=
 =?us-ascii?Q?PxBWP5y99K/wunCSROZaZeXMcMxRZ+lv1sSaw/qZbbrvJeExXAr0c8nG55GY?=
 =?us-ascii?Q?NMBt28hjNVCSr7On78wfgbzh16BflJy10gaEnxIK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdbed74-8cf0-49fa-4a96-08dc559a8576
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 18:02:13.3715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Noavqk7h09TnzyJebwGeVeK/yC1pcC/LFk4ng8XLIHwx0CEh3ay0rpnws0kO6GJQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012
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

On Fri, Apr 05, 2024 at 04:42:14PM +0000, Zeng, Oak wrote:
> > > Above codes deal with a case where dma map is not needed. As I
> > > understand it, whether we need a dma map depends on the devices
> > > topology. For example, when device access host memory or another
> > > device's memory through pcie, we need dma mapping; if the connection
> > > b/t devices is xelink (similar to nvidia's nvlink), all device's
> > > memory can be in same address space, so no dma mapping is needed.
> > 
> > Then you call dma_map_page to do your DMA side and you avoid it for
> > the DEVICE_PRIVATE side. SG list doesn't help this anyhow.
> 
> When dma map is needed, we used dma_map_sgtable, a different flavor
> of the dma-map-page function.

I saw, I am saying this should not be done. You cannot unmap bits of
a sgl mapping if an invalidation comes in.

> The reason we also used (mis-used) sg list for non-dma-map cases, is
> because we want to re-use some data structure. Our goal here is, for
> a hmm_range, build a list of device physical address (can be
> dma-mapped or not), which will be used later on to program the
> device page table. We re-used the sg list structure for the
> non-dma-map cases so those two cases can share the same page table
> programming codes. Since sg list was originally designed for
> dma-map, it does look like this is mis-used here.

Please don't use sg list at all for this.
 
> Need to mention, even for some DEVICE_PRIVATE memory, we also need
> dma-mapping. For example, if you have two devices connected to each
> other through PCIe, both devices memory are registered as
> DEVICE_PRIVATE to hmm. 

Yes, but you don't ever dma map DEVICE_PRIVATE.

> I believe we need a dma-map when one device access another device's
> memory. Two devices' memory doesn't belong to same address space in
> this case. For modern GPU with xeLink/nvLink/XGMI, this is not
> needed.

Review my emails here:

https://lore.kernel.org/dri-devel/20240403125712.GA1744080@nvidia.com/

Which explain how it should work.

> > A 1:1 SVA mapping is a special case of this where there is a single
> > GPU VMA that spans the entire process address space with a 1:1 VA (no
> > offset).
> 
> From implementation perspective, we can have one device page table
> for one process for such 1:1 va mapping, but it is not necessary to
> have a single gpu vma. We can have many gpu vma each cover a segment
> of this address space. 

This is not what I'm talking about. The GPU VMA is bound to a specific
MM VA, it should not be created on demand.

If you want the full 1:1 SVA case to optimize invalidations you don't
need something like a VMA, a simple bitmap reducing the address space
into 1024 faulted in chunks or something would be much cheaper than
some dynamic VMA ranges.

Jason
