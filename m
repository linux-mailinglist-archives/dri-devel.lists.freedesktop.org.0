Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71A9A000D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 06:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB77110E2CC;
	Wed, 16 Oct 2024 04:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GjpaKPje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AEC10E0A2;
 Wed, 16 Oct 2024 04:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uq1d2YsUsDJyRaDYoyYxNdCHmS7GZujN3OKxXMh6eLSyFWNIsenYO+yRZAD8vRNpJ71oenDDwSC6/xhVcFrefsJmzvx4fHqycaCVUIpQ0u14edh+3uEOgbcpXQmMpz0q2mE2rceXKu6z76LHP9lC4cWrgomMtAFq0xoWVqBj0BxHB5xHr1Iax4M1zO8MFcnAuQNhU+ZpwMVPhnSJFNiVO/gL0RxzyerF1DnGku3EPHcxFvg8qerTdWT01LBRaZOIoJrfPnNPurttCwa1/JHp/+/leihVdIpxX9ViJyjK/H0ahh+zhBhw5AewB8q94D920JlzxEYbbbA+/432z1xotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HjWR/HXcoTVCPHV2+AXpoZDLgvT065IOWNbdvRK09U=;
 b=ZI0zME+SGO+rBAoE4md/K4DprnjtKQ00sGk9M/7PMIucJB7afeNh2ool6462LSq0toDOb37XSQqKARIGLnj+OhotyMCmo/WO++RjLyM4j9dovCDkZH5/v5SpMOFkthjG2t/r8SZ9NrvEnESCgKGM0l/bI41EY/2Sd30ir+geRy44aIqCUcDdvIqvBP02FRHNIOMh3ureh7zq6gPRWMTp2+QWPR9GgwDREcg2mhAfqti59LGvC/wcr6ZQSXMP2RBJ/ocf3yfmFEl8zjU65Chf5hHaarb/gC74qQ5B0g8/cOZQlJrBPf2leJyXM32OC9BBmIIxANwZK+RpPVv2LQYeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HjWR/HXcoTVCPHV2+AXpoZDLgvT065IOWNbdvRK09U=;
 b=GjpaKPjekRXT0LGsSvF54DaBZhfoap+g2ojJFhDmAjO9GyFQKE8tImVLdzDzr4vLfs25RdDpInUuyPbaOHkDw+1sBrikHJfwtH6nHFRiGdC9Xqx1c1PJGEMPVwkr+C4GBvk4NtxPvy3wn04IOjxHM9fY1VfqsCBz8lMDgHIIReEXixsU03gf0c9bzCLKtWl1TsmChkSRyjb13uF+FdKg9yldVy1/Fa+yxcrMJ4MOLH92dC3hgYwNVGGSCN9d87V6ItIhabKu21bdIYKlUU7VWLG804gUm2F5/6AWoD6xx00JTgSGKJ8y9XyazvQ3H0CAkE0LeTTk3DewBBvQjRDAgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB5738.namprd12.prod.outlook.com (2603:10b6:208:371::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:16:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 04:16:02 +0000
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
Date: Wed, 16 Oct 2024 15:04:06 +1100
In-reply-to: <20241016032518.539495-3-matthew.brost@intel.com>
Message-ID: <87o73k8yyq.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::14) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 365728e2-39ec-4a46-7dc9-08dced993eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rxhYIVISOUDpb/LkBtm4azfiYBIDgq1B6j2Yu+fMQ4ZEaw3ozWbUppOWegBR?=
 =?us-ascii?Q?xHvePiYhwzjKKyaz05rl1Z2mg6HCGRXMepKCsW4jiuPFmzNk3uvwXaVWJ2Pf?=
 =?us-ascii?Q?ty8ZZcwTkRsCquQtzkzON/EsrmHxPcaN2ZC4QSi1BTnfJkn2z/Y0H2kySBZd?=
 =?us-ascii?Q?X8dg72zimhrIu/lAbkb40I6Vc+9JDq3TflXDn9S07Bl7UlHPlNI5SZipFR6X?=
 =?us-ascii?Q?Ne2pbwLoPKtejcb7VGd6sfDEoyv7mw27WEVGs4OrtXmBeqjeV0JHCqzfNac6?=
 =?us-ascii?Q?BcYIDS2EGaEbe5SLE5INBdvn/Ejn0igxyWiQ4ACtybJVIkkZF0kO49XYgocg?=
 =?us-ascii?Q?LJ1juPUJ+5ObQkr8fCmQN+AI0SxVCJim2rgIt2as8auxa5UTZ5vYr6S9b0qJ?=
 =?us-ascii?Q?nirJYfLh312LRrP63vN3NVgmNOR+xWoZFkrGlFsSCAAYwg/hIEAtEEJtjX6i?=
 =?us-ascii?Q?jHtZJOlAZGnNWxZKeSpVG/CV7zwhZp7niNIX79N/9+tvQDxdhVmPMc2say9Z?=
 =?us-ascii?Q?LoKQP78MTp4oj8i2X5WZVxk5LjVsmmds8kYRcky6Vijrye4Csg5qa4sgFNcT?=
 =?us-ascii?Q?/KhZDVRsBq69E0T4Hq/3ZjVFxxyGg5VdptlMVHLdf/iIaK+4P5CNcdzYRCs1?=
 =?us-ascii?Q?6T3GvRfneXfgL0tpZrNJKzI+dvWq9hgJUSVbkCFH5Ajk1fmtmwosfEh3WUco?=
 =?us-ascii?Q?8b7GgAFsCCAOcxSePbRLs3GwZa6XhuCJkVYkFbUUL1hg76NIuy8J2Vvfg+Vj?=
 =?us-ascii?Q?DiqhAjWlLdN0Wj7yjvCK2g7yrUz0RpvRa+4BXN02LCx+5/NWeQBEceUWfVoy?=
 =?us-ascii?Q?OhYdQJkTOIkqsvpRPmtv163s7OgBk/DolsVRSvo24BkGJtxnCPEpbKalbZgt?=
 =?us-ascii?Q?r0yBXA5lUvk7a7ugt8DuZ1J+T53nr5JCrS4jeQ9wMs+SCHYrO0R543MPAcMI?=
 =?us-ascii?Q?MGi3ADC148BHe6E7e/FIEKbtzzlcwv3nSpmWTGB5IjpXFQM71pdCl4AYJVGa?=
 =?us-ascii?Q?pQDdxFA7/E71Fwq1o0TYmobhYGKqydZ5lkoR7YX2qk2dvOSvlxhkW27JWYet?=
 =?us-ascii?Q?iyXMMuah+HPAOVcNydkKMeq5oj1LqArz2b+cMqZVhmgDx9Mapmt4s86QEs48?=
 =?us-ascii?Q?5cjm9xW4Y98N1+hgHO6nC+sq9TsBRKaN02PNLtc6aLkNkujGl26yvoIlA/zL?=
 =?us-ascii?Q?8+xbV+Xq+4JUsnoz7hZ85K+4b2jWURFBJ+qWsKQ5rlXrmlaQk0Kbb0WAOCh7?=
 =?us-ascii?Q?n8eI5f+cr5aGemW86RMpCuD/c6qdiy78+8er0YvClA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zUWB8nshXA6MuFs/iBfF2+nJOTntVSFv4UlnV1WGkCOMspiNfBFKzAClBQ0o?=
 =?us-ascii?Q?EzlvH8SD3QfODe06kas/D/UvvJSSxX7h8+GU1ddkldKCczb5L8FxwzL1Dc3W?=
 =?us-ascii?Q?Y/vjrPMHg8EGkIsmYNAq4Ju2H/w3bk5l+8scUQtZPumnrpsXfnaBb00UT5aO?=
 =?us-ascii?Q?mq02bp5rNPUfeHUB78LnilMdBgTDM0HuQ4SffeiudeAjaC57j75iNNkivu8R?=
 =?us-ascii?Q?rXRKFWbucyUAt0vSI7BJrdAw2VFlGnvIEAfrjbMeIXsMdcKzMd0UpduCLPAE?=
 =?us-ascii?Q?lTkVNri9ee3XFjlA1fylg5SAfoTCd6fRApJVK3lfB1+lbvy+q7skVBaASntW?=
 =?us-ascii?Q?1sat9qyyh3Ez7dMLEytOYbgs8LUkBiWWlBhNSbrnhG8lcbDpiH8tmqC57pVP?=
 =?us-ascii?Q?uuqORaCkejBrn3rA0Rv4t10Wsl1MeZduOljkOvMC5F02sjeIW5bdzmqdmwoc?=
 =?us-ascii?Q?80h0yp1xSGVA0b8+wCxuvwsOEjwPUlZAZn5/q3I8nu333PnjO46k1QzYIaiJ?=
 =?us-ascii?Q?ceYlGZgh0rqJd+TcGmwu98BZJTl4VHEBOI14jsiM7++FqdN2ldUs/4j2PvGl?=
 =?us-ascii?Q?0H2SkfjC2sUM+kUZsP+5G4fN0H62toIsRG3fwjZo2WIqZwUo+ZCzj8jEY1//?=
 =?us-ascii?Q?y1q3zbpFR1e/5AmDSMixtELuUSU6dnEWv94RVHHmLMzdqCub4tXGVuqgfcIV?=
 =?us-ascii?Q?OSSXna8jHniIFqgs+HugYH2J0EK3Lo+yAHrC/2OO6uliU74IYBdgNWB7LRSx?=
 =?us-ascii?Q?1p0eo4nuMZPkb/rFujN8R78w/YDDgUVn8+c3paCalbpGxAzaaKa+eMsw/dqO?=
 =?us-ascii?Q?oLkjHU4LoS87K7zXcahm+AWaMPnt09H+iLY4SrrbFJ/CZcSUTTVMHZuQJCJ+?=
 =?us-ascii?Q?Ry2tswvGF/cNhEdj9GeNd9YQYK54S9an8ujvja9D1ODvkFy8B+1O6bnCFzky?=
 =?us-ascii?Q?m4ad4Td3SSkGagx/KujvEHOxqXw5NwAR6Ji4pywNMamNAvWaSePgU7ss1agC?=
 =?us-ascii?Q?rEr1CF1P7b8NvMN0vFH+U1TnFYKzxBAsdABGL3w4hk4NVC2QiUgvPMxzgktG?=
 =?us-ascii?Q?eW/8MWylxX88BOK+hLW5O9rUMUk9hVI0/peerwQ6O9o/2jZGkaOLVLrji2TP?=
 =?us-ascii?Q?JEbFUoytkSPd4J8gVBEY/ZTSXZ0RV5u6cLGKk3FFNM67T37cBJvxqFEmqwj8?=
 =?us-ascii?Q?uOsbP/HRidDbus0isCv8WgsFiwWmxUUVdP/m5qA6RFJRdug/Fq6W+iOOpqaW?=
 =?us-ascii?Q?wX80A4WvMOkFCm3PRwrrfnsPiawwnj2MMF9KMFsg8MR2242n4dumPBAfk5mm?=
 =?us-ascii?Q?otH9lfM/MxuK85SYA02hClY5bWnqWF8Pvr0IQmZUUIIQVrP8rt3jvXZ4lAgC?=
 =?us-ascii?Q?W/HL3b28bsdqMTOmF6Il5Dg48Ga5qzfhX0+9rpLyOvJDEnzQmgLW9JRwm8ll?=
 =?us-ascii?Q?HgoWLuhmbvNOztSIBmEHXRd/3xAu97qFziY9YQV/ClLbJsKtLImPlBftyJyH?=
 =?us-ascii?Q?tNSSRChnGs0FAeZAFyc6zvbXGxY68p875sPKYlTvIruVhm41o1JY6v3QFC5r?=
 =?us-ascii?Q?++DNOScAxPGY+WgdETjkdMD+rWng3TklpmBM39VE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365728e2-39ec-4a46-7dc9-08dced993eb9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:16:02.3486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVyC+p+1rgR+PxsLIrdDh6OSooC6Bx/kiSd2bMTjdQZKoJig+C63GOdU8Hwcas7x5GW6daq5ICKZ83jTDRi5XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5738
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


Matthew Brost <matthew.brost@intel.com> writes:

> Add migrate_device_prepoluated_range which prepares an array of
> pre-populated device pages for migration.

It would be nice if the commit message could also include an explanation
of why the existing migrate_device_range() is inadequate for your needs.

> v2:
>  - s/migrate_device_vma_range/migrate_device_prepopulated_range
>  - Drop extra mmu invalidation (Vetter)
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/linux/migrate.h |  1 +
>  mm/migrate_device.c     | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 002e49b2ebd9..9146ed39a2a3 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -229,6 +229,7 @@ void migrate_vma_pages(struct migrate_vma *migrate);
>  void migrate_vma_finalize(struct migrate_vma *migrate);
>  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  			unsigned long npages);
> +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages);
>  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>  			unsigned long npages);
>  void migrate_device_finalize(unsigned long *src_pfns,
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 9cf26592ac93..f163c2131022 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -924,6 +924,41 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  }
>  EXPORT_SYMBOL(migrate_device_range);
>  
> +/**
> + * migrate_device_prepopulated_range() - migrate device private pfns to normal memory.
> + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> + * @npages: number of pages to migrate.
> + *
> + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> + * array of device pages to migrate.
> + */
> +int migrate_device_prepopulated_range(unsigned long *src_pfns, unsigned long npages)

I don't love the name, I think because it is quite long and makes me
think of something complicated like prefaulting. Perhaps
migrate_device_pfns()?

> +{
> +	unsigned long i;
> +
> +	for (i = 0; i < npages; i++) {
> +		struct page *page = pfn_to_page(src_pfns[i]);
> +
> +		if (!get_page_unless_zero(page)) {
> +			src_pfns[i] = 0;
> +			continue;
> +		}
> +
> +		if (!trylock_page(page)) {
> +			src_pfns[i] = 0;
> +			put_page(page);
> +			continue;
> +		}
> +
> +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;

This needs to be converted to use a folio like
migrate_device_range(). But more importantly this should be split out as
a function that both migrate_device_range() and this function can call
given this bit is identical.

> +	}
> +
> +	migrate_device_unmap(src_pfns, npages, NULL);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(migrate_device_prepopulated_range);
> +
>  /*
>   * Migrate a device coherent folio back to normal memory. The caller should have
>   * a reference on folio which will be copied to the new folio if migration is

