Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C13ADFC9D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 06:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A110E230;
	Thu, 19 Jun 2025 04:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uYbtWc/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32EF10E230;
 Thu, 19 Jun 2025 04:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1XyIMXsFIAB1FMYNZbLselWWt85FLzqPGZhAfDXEeW7ZUb+4dJCTi9/ZF/DV48ezX3Lev43zAbEB4UDXxZhG99VYsVMpO8/YbE4uBcURzpNtiurlxN5HWv/3SGatoR/wigZstS0Y7OttojP7fCSQXnLbKaH/9V45vNnnRc2CzRDhR0MjvH9eKwQEVNEBrd4EvX1GDK3uJ5nGAe7b5A8v75h5Rh2aDL1fb1ms/gjh+DkRTN2kjOZEtbonkYcdLIKpJqWcE6slC0rVWr/CUNX8108qTQJBYLtLL3QWXCcXvzXX4zCoLYuI4sh4bzwhPGCK3UrjULsTOvkiv4CAm9fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKWu1RjaiGA4VnPFH3d7Rnj1yXmLYoXu4XKlqmuJHp0=;
 b=xx8kpGwTK+uY2QCLFUbRpeW9etw8zbYSI/UEZkbV24vRZEvJX62Q5OgC+RP4tYi9/BHtkF36VJXMWiQh55qO4xzQo4mlzWE6wlP1FylxLWtzNs9lWTLMdYsme8Xqq+3Oc0rMXQkd4CFMiPq4bOJKS6IXzSNdCxeMqnLBEVp12DGIky4I4d4okgQvtqyx7OVh0KobGB1EY6XOvxv7aW0JgK511qvAVZhDD16aK2rvbp1EOJro1T1OXbAbv7yL5eOyCrp/dAV1ltYr1fUNshM+Ckff/vcfVJpjN/feDtuiSp0KGB+hUX94dy9tNSRgfaWvvAPihkaQXROic9EynAqpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKWu1RjaiGA4VnPFH3d7Rnj1yXmLYoXu4XKlqmuJHp0=;
 b=uYbtWc/EkeAkeq/Ag/Rv3/rbN5I3237Sj6a38iEHUpcHB/1IrA9Fk1cdLg/yRAbNipqz+AQ5fx2/7AFhGUpNnvYrYGMHcsHg0ZWIiUktozG0Ybet0o++esmxQdWs1mWc+mSmknTzNRddPYw42gv/EJmfdCEkRqpMisHPPKvDdLXLO8sawUgJT6WlWxFJJL+r/UsBhVz+Ih2ZykaGfR8zxHOlRIHAjX5acM1B+vJcSeuRrv6xCjZHVEl89NPK8iwSKRmV9eCxsF3Nhojx9pCZUwHoubc1GRp3RZ5Q9YsHEA4nwu/Kc4ikWUH5mezQAQsnDIBhxLFUqxvsBlUz5qqYyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 04:52:51 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 04:52:51 +0000
Date: Thu, 19 Jun 2025 14:52:46 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Felix =?utf-8?Q?K=C3=BChling?= <felix.kuehling@amd.com>,
 Philip Yang <philip.yang@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 0/3] drm/gpusvm, drm/pagemap, drm/xe: Restructure
 migration in preparation for multi-device
Message-ID: <4w2pw62mep3tdfyouusm334izjhsqajnxkzjbgg6kd7llia72t@nevp4u5hikfz>
References: <20250618201617.54100-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618201617.54100-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SY5PR01CA0060.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::19) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8c39a-7c2b-42be-8d98-08ddaeed24df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SAjw3qJM3CRV9EdmojAaleave/cjtVJPK/cdZWTj4VBLF7p5wwD17PVAdy?=
 =?iso-8859-1?Q?/ppShz6TcgXa/0fjKmVcchgXs4lpdUDLKJnUAA9B4eE0AOPi2T8WkH65MH?=
 =?iso-8859-1?Q?I3zpae4szqebIMam1VHZNcytESGuO6WXmtGfABIOUACD5Gq7pZxo9GVQ29?=
 =?iso-8859-1?Q?tIPXWAMHBHPymCcAROXsL3hE6pTgVluv6g3KBmh0/9WOtvEeLYGUih1uyY?=
 =?iso-8859-1?Q?TW1t/UpvimGXCN9hjzIZ682BPxkrGcMS272ORCZmscrTnL09sRBvY5bRhy?=
 =?iso-8859-1?Q?VB/wxf40/XQK6/wOalC+WwblfBdq0BBvmCw0qsl8yEs02nSXm+XgxE4Hqa?=
 =?iso-8859-1?Q?TJr49gFwtGhsAIg3IGCvRc/yV7hapGMMApmRISGlwSQNQTL7SadXBMKl6l?=
 =?iso-8859-1?Q?GWO86BeWWY0DTR5KBFG4XIf243UENBU+XakwDEsMrX2VDKNeiOJyveJ8cf?=
 =?iso-8859-1?Q?E0P1V2g1BQNcgblATrCssXKEvFQyAgPeWVQZBZwT9z5gyw5xOaYiLMYRmF?=
 =?iso-8859-1?Q?MgS4mA4GjAR/HO+146uKKnbTYUE7Hl3FhKklc94ASBw2u1dFYYBtJUfgco?=
 =?iso-8859-1?Q?xYeiFxfQjH5krpdg42kSutx98JqhPgxTrrEd+La2pxoOKqTp7qigJ0WRDX?=
 =?iso-8859-1?Q?QI6rtE1F0J1NLnQFIxRDPYLyyK0z3ijdKhyZOcGe3ge+oROO6dXD6rVN8U?=
 =?iso-8859-1?Q?dg/HA/wEOOLWXghdaNoSjyZ0yK+Fc05fRoOPtzU1E8Q0VyMHzUbnHEu5xe?=
 =?iso-8859-1?Q?SZOB0/AUU+mqi3NL1ileoeTnGluhqPSocb80iQyEtym/fJriRlV+unSoob?=
 =?iso-8859-1?Q?5TOqaTitTC9CbKn1gK/AYK/HNnR8zWFisgoXYTOPKtnuwWvpcttjzI4cU/?=
 =?iso-8859-1?Q?1WFp+8Sm73RqjU9x22Foa54j2KCkKql6PmfokWfBuqnHvmCIbDP+ynfN6r?=
 =?iso-8859-1?Q?whq++k/jLg81nxtO0tp9t3KeS9rQaS/q1BYDXaVbzL/8fY2Ls0WZoQLEid?=
 =?iso-8859-1?Q?Ri/n5G7MEubWTbE5j/ZGwCPhQvq4KzITktbUfIcnhmaVA52xNbTP090RHO?=
 =?iso-8859-1?Q?+c7FANlEt4RkHtfCOntkNTxUwHERVs/E4T1+iZa1vhfxYCWhUNL0bbuOEL?=
 =?iso-8859-1?Q?anlkhpYXZrOwyHvoVvFQAnunAoeLekwQG2KKkq7hn0q3gjYxGTsr0US1XA?=
 =?iso-8859-1?Q?di5tLpF5UbN5YGYM3uudtArVuCGkyoYDclLn8/5+kloGjM3cVGsQ0DhmpQ?=
 =?iso-8859-1?Q?TpNRNIEX1efBoloMwfHeE4Wzb3VpOHdKczOJGlIrCE54OJ6yMZbSvWOcUp?=
 =?iso-8859-1?Q?wB7jOzm7jP4fIoil5HSfIkrDbaIYqZCzpn2/6Qzf/bOI8mK86o2bv7mKNl?=
 =?iso-8859-1?Q?7PnpeMoqZQch76YXPfVUfZtbJHbKnMgqCk3ytpHVWwnnxM93iuaR17Xk3D?=
 =?iso-8859-1?Q?/O2ulrYEBd7rGV1MbLdlSJnptnN6kVmWxTpp9hCVaASE763mysBDc6EsqB?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wQ9VDZXaC1cEablSeI84rua9IEKzBhoyXvBsigaPA9u7rwg3oinaaPzQ7g?=
 =?iso-8859-1?Q?Sq5XbDB3ICuVLtVhJdyzU+83Y6tA6SqiRUN7mu71O7ovcg/t1U2aS1JV0N?=
 =?iso-8859-1?Q?FZdcULii7Kkr7jhkUTr7A1ifohnqbMBj48H6nUXdDLGj+B28ZvSkKQrkQt?=
 =?iso-8859-1?Q?icjsbSIeYNUbbKOAqKen9I5f5jkFgH0j2Bk0ZiBgqx0vxQqoKxhNVai8Pt?=
 =?iso-8859-1?Q?uHIDrM9nxr/6++mfVo0q/V86pH0/OrJFH+x6Y5+V6fe6crAU4+3M5MSxy3?=
 =?iso-8859-1?Q?tu6YqhKYHYIrnKOqWQTpRbCEp9BsKQej9/py0U7OfYVvq/zaaAl+Q/CwGg?=
 =?iso-8859-1?Q?YifMT8bGbLvAb+qe+Z9TNCmJ4DjbcVCsBBO49Mopx+6LJ5w/KwVSWb0kBe?=
 =?iso-8859-1?Q?vinqwbNkrYxSmUFllepPID93xHY8+3vfn/ZdoQSDTLiDFi4NG+GvpX6pMo?=
 =?iso-8859-1?Q?XeRD4o95Yq6iivaQQN61aW+BaPK/b1Khbn4RaPJBzmlVdKzBAytNUgnJSQ?=
 =?iso-8859-1?Q?GdNfIquI0V5FMdPdXXsTalqmdq8MV6rMVkMuWqCKRqBfbSNPBMV0Hups6F?=
 =?iso-8859-1?Q?SSMt3E8Ana1DPQcwZ3bVpKRmqm7DN6Ba0Dpl3RHNzdmr16Ci5QZsomsWkH?=
 =?iso-8859-1?Q?yocoxaa9RwqfWZzHU9quvTZOsmrU8aXGEUQXq+lcxc3By7fgMjPmcriqet?=
 =?iso-8859-1?Q?POSyo/aWNV+2CdIzB6e6NZDNOoj46aF0lNFKpOKbcEIGxsSqJlse2Vd1YG?=
 =?iso-8859-1?Q?UnYq63VSqke19NLKppl5bhbu4GXUgeYYmOLuv/M9J/3M0wfHNZ3dDdOGcr?=
 =?iso-8859-1?Q?i/NIdhWz+lQTgTJ1QVwcehCS8pIluCUOWXLlIBaSuekM/38fzycZb5qOyW?=
 =?iso-8859-1?Q?ygq0LabvEjewA+I4CfKRhxCP775RSnVFPhnuTPEEL3/j6QtCRT79dIvA0l?=
 =?iso-8859-1?Q?oLnXOL0P7mJ+WbVrdw6jfTeV6Vfwh0MwzoXT3nIks7JeE2z6YNOGn7dKY2?=
 =?iso-8859-1?Q?Umj9FwX7KjSO8HeagZnv0f7zbEqS6DaBrh3PFDnpbMzF1cTSSJcZ/Ej6Hh?=
 =?iso-8859-1?Q?o209/9/BbsMFK3qKYVLOLSC1zJ8PcbSFiIBQGie2JrCPFHWNqxKM3NCtWh?=
 =?iso-8859-1?Q?N55FeSUGyvkpz503dredl+AWxQRPsYpMxcYh1oaBvZfvx8ElFZC+uig0z5?=
 =?iso-8859-1?Q?OW4faRhc3Vs6RaSPguJVYu5TPKRWMtvsdTGcqywTev40twv6sjKFN1oHQl?=
 =?iso-8859-1?Q?Eh0+whet6+bCGWAB/bSphLzWBYH6rgIoQG7Ez3T0qRawN2ubPstkNXrp6H?=
 =?iso-8859-1?Q?PLeGUycsuN4qpVZCMzE3LwgyGpc+pCjngc8VG+e4WT9cH71GyO2oeG83UP?=
 =?iso-8859-1?Q?OwTxCUkfCbza5ee999Mxwgn/eG6hlIfNE3H8tZ+H6kKOjsJ9fEwcOkZ10F?=
 =?iso-8859-1?Q?lnm2Mmzq5RxI5g5xjDJy67dtJjzXhTA4L94HxOUTsR/Z5eGOo8e9gn6jy0?=
 =?iso-8859-1?Q?XGLoZwd0ZNyl+UzL7w0tLWOoqizupFvBPr1SfXMbm13hwwmwnrht13nGZy?=
 =?iso-8859-1?Q?pCgx3J0Og+vFGobNXA8rRMohhbrl1Vjjsg3yZ/bRg5p/C6vswhjp+PwYR4?=
 =?iso-8859-1?Q?4E9ffHDh7GUP64PkMikdeMvZ3OcYW6a4zJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8c39a-7c2b-42be-8d98-08ddaeed24df
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 04:52:50.9333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZobDS1jfC1VcgstwHpFFHMGS6KwP9Dha6FShFF3WEGHTlDeuPThWKKR3M1n6r6O9JvCKVqbPv8ekqpxjp6a0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
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

On Wed, Jun 18, 2025 at 10:16:14PM +0200, Thomas Hellström wrote:
> This patchset modifies the migration part of drm_gpusvm to drm_pagemap and
> adds a populate_mm() op to drm_pagemap.
> 
> The idea is that the device that receives a pagefault determines if it wants to
> migrate content and to where. It then calls the populate_mm() method of relevant
> drm_pagemap.
> 
> This functionality was mostly already in place, but hard-coded for xe only without
> going through a pagemap op. Since we might be dealing with separate devices moving
> forward, it also now becomes the responsibilit of the populate_mm() op to
> grab any necessary local device runtime pm references and keep them held while
> its pages are present in an mm (struct mm_struct).
> 
> On thing to decide here is whether the populate_mm() callback should sit on a
> struct drm_pagemap for now while we sort multi-device usability out or whether
> we should add it (or something equivalent) to struct dev_pagemap.

I'm still looking at this series (sorry it took until v5 for me to notice
it!) but my immediate reaction here is why do/would you need to add anything
to struct dev_pagemap? The common approach here has been to embed struct
dev_pagemap in some driver defined struct and use container_of to go from the
page to the driver (or in this case DRM) specific pagemap.

See for example dmirror_page_to_chunk() in the HMM self test or
nouveau_page_to_chunk(). Is there some reason something like that would work
here?

Actually I notice the Xe driver currently does use this to point to a struct
xe_vram_region which contains drm_pagemap pointer. If I understand correctly
we're trying to move a lot of the SVM functionality into a generic DRM layer,
so would it make more sense to have dev_pgmap embeded in drm_pgmap and have that
contain the pointer to any required driver-specific data?

Also FWIW I don't think zone_device_data is strictly required. It's convenient,
but I suspect it only exists because it could be easily provided within the
footprint of the existing struct page due to not using all the fields for
ZONE_DEVICE pages. I can imagine we might eventually remove it, once we no
longer need struct pages and move to folios/memdescs.

> v2:
> - Rebase.
> v3:
> - Documentation updates (CI, Matt Brost)
> - Don't change TTM buffer object type for VRAM allocations (Matt Brost)
> v4:
> - Documentation Updates (Himal Ghimiray, Matt Brost)
> - Add an assert (Matt Brost)
> v5:
> - Rebase
> - Add R-Bs and SOBs.
> 
> Matthew Brost (1):
>   drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
> 
> Thomas Hellström (2):
>   drm/pagemap: Add a populate_mm op
>   drm/xe: Implement and use the drm_pagemap populate_mm op
> 
>  Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>  drivers/gpu/drm/Makefile             |   6 +-
>  drivers/gpu/drm/drm_gpusvm.c         | 761 +-----------------------
>  drivers/gpu/drm/drm_pagemap.c        | 838 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig           |  10 +-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +-
>  drivers/gpu/drm/xe/xe_svm.c          | 125 ++--
>  drivers/gpu/drm/xe/xe_svm.h          |  10 +-
>  drivers/gpu/drm/xe/xe_tile.h         |  11 +
>  drivers/gpu/drm/xe/xe_vm.c           |   2 +-
>  include/drm/drm_gpusvm.h             |  96 ---
>  include/drm/drm_pagemap.h            | 135 +++++
>  13 files changed, 1098 insertions(+), 912 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
> 
> -- 
> 2.49.0
> 
