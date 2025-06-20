Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9EAE21B3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7810EBA8;
	Fri, 20 Jun 2025 17:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2dxWVhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18510EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 17:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs5UBNGjTbgL++YfQXiH2WvH6gKDhkmer86EuhNAmnAzf3sAMBqekVB/aq5SyMaz2TvPjomjYLPPeoVCYwdHVeBB4h+aK6WDAEXKhdcIsMCDgkK3t5Z7ubQMjMiymIY5p7MlyZm9BY1uTHEkg9SelpR4HeXmsKC3GAvJrVKvFjDjdr/H9xz41EplJTPb6q4mZWG1AD3f0bpxwf+lGIN7RIK6w4zylw78nzNl6Dbs9IgS72CaxQc2pAmRhTAJ2BZFmGjdzHFQzQS2hYruiJ0JIVr9cZXd0axVMF2h/l2NbFVg3jjWv1GayoLfZc9ZFxEoRbAuTCpUwTGcurBdbHD1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE+X0KLfv72azUEc3pa7e8FBVJd6G/fxKTjzK40wnHc=;
 b=BWNe2h3NDK+14wePd/1e1vKV6x77MIVbrdn6Q1QeHTT520cJu9UsDKb/gHEv6uTe7sbwkoRaFGqMVaweAanFFkUkXnvgOdrpWlSpvxeY54TForUuncKBRcdxgo9EO4nRDWfFuRyEaeUFj57C0509aIvCklcts8kwkm2+uRUD9W/4PI9wy5z04HHVtyHNArPEEkzuuq9WX6jC4F+17HIVJe6Dk/bCpKztdVTgmiNnz7DP90zbbMh+8D4qNSncTj54cec0lamgdKyK2q9y5xjPGvQ41Q8eCHk3P/PVb6y0I2wguT3V1fSERDOqBHEaflXflUPDB1dtHem2e4yfjJgwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE+X0KLfv72azUEc3pa7e8FBVJd6G/fxKTjzK40wnHc=;
 b=n2dxWVhpx6XaQKza3uqaNQp7YI5rO85Onvpc29CFzSxsX3CMekB/emz4ffxQRauwRjB7O6rnTeOZoAcrkj2109/+dkKItOf6SdPOqBQV/IBYyJgzacrZL/7x8aUELYWfb7elf6fL24xm4IF9DwoISN1WkyMg4g34JLkrUlXPep3pkAWMBHhx5GTj77/4M538WQPUNQMdn3agc6kDp/NFqqDB0udftTEC+XpIq9DhTdixr0Qri7rIKbHGyrbx0FBInjlw4bjO4BIyg5sGPgB5G4BHEAzkdS9DlB1wZkaOXW2CJPTZnXbO1kB3jxaxAj1taJEdLtbnrvAhOnqCQKVmrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 17:58:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 17:58:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
Date: Fri, 20 Jun 2025 13:57:57 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <E73EC5A7-920E-4A79-BEB3-D479D87BE06F@nvidia.com>
In-Reply-To: <20250619072026.635133-1-airlied@gmail.com>
References: <20250619072026.635133-1-airlied@gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6197f1-fac5-4178-0e3b-08ddb023fe92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7MayKYM7bBgqNaNrpiyPKGbXokOhiRglBC7y1PUdLmZTr3OHe8+U306KG/EF?=
 =?us-ascii?Q?fUTZhn1lVk9yeBpMGsSl5F/ndLOYdfpNfuNNZpPb2S7IKCb3G5+6oxSF9yjJ?=
 =?us-ascii?Q?e4Cj1z0/Q6OO1f0/n1LklMtRRh/ZcbOr0RntRs6/DV/me8z7tyJVzBBzYMna?=
 =?us-ascii?Q?NtW9hmfxCkiqIXyBXmIMvw6fSvivytDPAmQIVC2wBL+eULHb090ap7bLy7Px?=
 =?us-ascii?Q?J2mdgGQbalaWeTRe4c8USNMg3W+Y7Z4bOavzujPPe5tSN+BM6tLrBR56+/JO?=
 =?us-ascii?Q?4rDTuaoaT7g94LUiDLaT1VVBOEJVQNQwqIEfap0qytqTjMMJNblXAVLb+ar4?=
 =?us-ascii?Q?+vgKXDTVsKx2V1o8/+zxLjI0Q29HnJdf2VznLSOHiutehE8yJlVDTvzGtLFL?=
 =?us-ascii?Q?MDeKjvRS/UvZKHCJ9WqJ2fl8FI/7cG+cSmX9iWiPVxpMT2Taouf0YUnKx7EV?=
 =?us-ascii?Q?IZdzyQIJDF48SqgToj800XN0TpgrlBF/lUSuw4j1witTUMENSTNbixro7PcM?=
 =?us-ascii?Q?TzlcZ0GNnHglIXjgmx20svAhmt6eGZIM6ZcpFBEAp4BhbP2O9lEQfIOcS2JG?=
 =?us-ascii?Q?zmfrjoeFgTqZJm68eZrZlQHttA6ux0TJz7tPGAkOW9GARWUAhxrw67jdUYcK?=
 =?us-ascii?Q?uUMDkCopZOEnQAEW/R7nJ45zu/h+hZiOCw13YY4UM5OZmGqTqzmFDjSo+FP3?=
 =?us-ascii?Q?ZZorkmHx+aoxdHNItsb/XpQ0So71rhMrs/zasm1ZQE9NNqkfiE78b2dqxOJP?=
 =?us-ascii?Q?o04skbX5MvwL0yNwbwT5BPrj12TeuIKFpL22q/JfRWiH69cOm6W55fRlv5LX?=
 =?us-ascii?Q?sVOFEKrrS13Z1Va5H9M/HqST6eWaDE4rxHQ2QauVtC2UHi9B+BdcXKD3rlqS?=
 =?us-ascii?Q?ixpLAYvf2ijj9lfBuMRZ01rrD1+7JA+3Ja9e/NREK0DtgtpKN2EHvi8gtiTI?=
 =?us-ascii?Q?7uHcy9fTRR6yqPA7rEPLPlG4fJzL+bgnhnswJgHCd3a9bThSFUYu5D4/uI4a?=
 =?us-ascii?Q?lXtnBHDIF0VeWZMdL4A9Y2aHLo98+o6deNN4AN1u89ws14baRg9VIkdI0pnV?=
 =?us-ascii?Q?3ZVb4itRFj2Z3rg8PnXS8LO8MCWjjiTjDGOwZJXka0Rhiapx+7qLVS/Bjrgx?=
 =?us-ascii?Q?2SNkQeJVB1FnlIPE36vKP+Dr72yHg6T9jvyp57QwxuZtiFX9U2JyX1uGhWCh?=
 =?us-ascii?Q?fgOyOuvbzmoBasdFVD+tB5SPll83otArbz+wlyDEek+vKSa+TaDOd8wiY5qZ?=
 =?us-ascii?Q?grkOzNG7FekH9JTh9gqaS+6TJW9K5fZoQkNL7YPvG69fN+M3mBP1fjUvrG/I?=
 =?us-ascii?Q?UUkmc7YqS5/p7u8AWOQx59PwU4ViRAndsCqfj+BnY85rl/aQvu4NTsfcRrxT?=
 =?us-ascii?Q?WlI2AN+erN5zQVxDbKFJCIHKk/SB67TkaEaa6RvOVMZCLPLZUn5sFNLJJRKG?=
 =?us-ascii?Q?uf+1XPknl+Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOCVRFYUizb0bpCPHpZR34YU03lT2qAxadYE99zq5QwYXy+OAdn+V1Ksj5cy?=
 =?us-ascii?Q?6rJuaOvSivqXTaGoO3BcNMJbiYozD1RE3vmiHAKZjly7nZEM2zP2zDUGy2P1?=
 =?us-ascii?Q?Lo6pjIzFINeiuJEGuBhUjpWAvFP5vY8ildLQJnBEqA5+vLn3QdeTas/43Bx1?=
 =?us-ascii?Q?yxeqrJ8NSvhTMRkG7q/bK6tswiGhSV/4QgdOKxYHKX1L3V/LF9aCLgvrn3sS?=
 =?us-ascii?Q?dq1VumKKfyjQAxMYLa+Mz9h1jn18EniqaaBKDwbsJ/e9i/Q98/+Tjw2UMjSu?=
 =?us-ascii?Q?1DAnyswOWzcfPHYLYbIB6+bVcGPsDLhjj5ZRF8Kyz/8D8kzKFTKJ5vwyXsxp?=
 =?us-ascii?Q?1ex/IDZxss2hXSwKvrUVxdD5QmFwjKBTJrzxCAnZQ/yXQu8wqbxEVg2NwjCU?=
 =?us-ascii?Q?/5XSsUQaOAWgpBrKkSPpoPUM03Z5JO+T+m4072SCcInlOMdK4XM6WHv/f47p?=
 =?us-ascii?Q?64dPfBOB55jaQ+tiL2QkLgmwz+dz2+atijFdoi9Xz1aZCEUlUvjyMc0MJcU4?=
 =?us-ascii?Q?dR4LKu0f5/M50alOj2hpIPa+8hmcsrDcrl+FKtIX2shAnWTk3QyyDLJKXNTj?=
 =?us-ascii?Q?5t27MRM2uZL4dkYtPKDrJaxAdBegG7Wc96w1bYFn7IdaWKSCjEKff7LLzjRS?=
 =?us-ascii?Q?XcCNzE2oaZ8pZKS8ynmgiPnq1Fh99Kg8E340yQYEB++6XIu+HlO/w3GED3TV?=
 =?us-ascii?Q?eedDZokUqHqakIFLXeXOdqIT/gXbXfwMAm1IdJgpzig7J9sZqXWb2zkyyFY8?=
 =?us-ascii?Q?1jya6gUc8KXntI8+ELdfwzn+vQdcNDLWUW42YlEUDEGg/Hw+LE8Qs9ALI8Ax?=
 =?us-ascii?Q?SD1LBDB1WsDGCByDrKxwRNHV/uXRmR+Ot9gpw93XkIkqi9O8WJaONCWNypHg?=
 =?us-ascii?Q?GEavZBcmcmBzt3R3UwJIn6oXmtBlZROioN9KA6hEkI/l5BdPmRZcheQDQnz0?=
 =?us-ascii?Q?LkB+wRWKNMWEhxwa6MXf0Qi9smt6wXkz9IsxRyGXTUNsioUoH67UPqTPQQ4H?=
 =?us-ascii?Q?Xzm70Xql18C1JMqZdx0AAesv/hr/bWAWgBhGiEmDHmlEnJtwcUntdtSmp6w6?=
 =?us-ascii?Q?B0U83Vfv8qSIRG9S4BNlvROAv+1P29kB+lZO6DdcBhSrB/JBTyPOd3wlgFgF?=
 =?us-ascii?Q?DkaYUt8GnwqigftsbZYqmNCwPVUAn7SJuFnWEFph297/lud1sUv+9SzUTJmK?=
 =?us-ascii?Q?GAYk2OGL67v/NYpthwJMcuT0UsQv6FzYpGORYfraGTYw9eW81T8mWKHC/Tv6?=
 =?us-ascii?Q?bu/QkCk/TMvgh3e2+DwiHBg/eePH3IBumouK1ygOIeVvVPryH2jdSmznmJeJ?=
 =?us-ascii?Q?XtaemmW1iRbel3bJ9wmAay2ZjvMI6GA5fccuyDk6Uu5lQz599LOfRZ6Q8xHN?=
 =?us-ascii?Q?Ar67Mi2hYb0fE4CWLuROAuUVGH+rWBMj/a6rnOh/eKcxUFWi2QTY+OHw03rU?=
 =?us-ascii?Q?uPBRI/4WjQOlrNHum53iuAMHOP6JSoXAbQJARS7YTLBqIAlb9bo4OXDDNO4F?=
 =?us-ascii?Q?TqWa5tpYnrAJxSYdAnK4c55E/Yl+evRrNbuAOj/DshndRYWr0E749xgtVTmR?=
 =?us-ascii?Q?H7C6J4kMeK17wXCz5mMzT7SJCgpPnx7vnph4t3jS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6197f1-fac5-4178-0e3b-08ddb023fe92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:58:00.1348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01UFakk+OT3ZAty6rejORYvd3HX29oq3dPzhSzlMD9zKS4l2fIU0XVyHUO98/Xcn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125
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

On 19 Jun 2025, at 3:20, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> While discussing memcg intergration with gpu memory allocations,
> it was pointed out that there was no numa/system counters for
> GPU memory allocations.
>
> With more integrated memory GPU server systems turning up, and
> more requirements for memory tracking it seems we should start
> closing the gap.
>
> Add two counters to track GPU per-node system memory allocations.
>
> The first is currently allocated to GPU objects, and the second
> is for memory that is stored in GPU page pools that can be reclaimed,
> by the shrinker.
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> ---
>
> v2: add more info to the documentation on this memory.
>
> I'd like to get acks to merge this via the drm tree, if possible,
>
> Dave.
> ---
>  Documentation/filesystems/proc.rst | 8 ++++++++
>  drivers/base/node.c                | 5 +++++
>  fs/proc/meminfo.c                  | 6 ++++++
>  include/linux/mmzone.h             | 2 ++
>  mm/show_mem.c                      | 9 +++++++--
>  mm/vmstat.c                        | 2 ++
>  6 files changed, 30 insertions(+), 2 deletions(-)
>

<snip>

> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..458a3465dd8f 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -241,6 +241,8 @@ enum node_stat_item {
>  	NR_HUGETLB,
>  #endif
>  	NR_BALLOON_PAGES,
> +	NR_GPU_ACTIVE,          /* GPU pages assigned to an object */
> +	NR_GPU_RECLAIM,         /* GPU pages in shrinkable pools */

"GPU pages" seems confusing. These are not pages from GPU memory, right?
Would the comments below sound better?

/* Pages assigned to a GPU object */
/* Pages in shrinkable GPU pools */

Otherwise, Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
