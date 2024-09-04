Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74596BCAF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6226B10E79C;
	Wed,  4 Sep 2024 12:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MphXv6kY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39BA10E79C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:44:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dct2SBJHcXELI+gi8ROe+yw+2ML7kPr+g7zIwlni09GQOEHPcZSnni32zg3ccgejsTPvRbIeDnRocBqCexTGgnh440XWSdSvuIeJm1g0DKhBP2L3RfZno/GAEg42kVEn1Xf+fLTYdFcmsMYeAsj61ciUgkf6oKSDedg2jbsNojxAniID9PTVXw2QOAFB4ociyFzlTGH/eJtBn3FPuZtzQ1waozcRAm1XDbL1xOLJ+Coxl4LVkqqdxmX8RZx2M51O+GB6QPRLCGYq/M8iCwdNedNDQCoxOt4Fcbi3TSdUOkC1yT76T0g6fj9LZ4LP4G4p/HwVoso6K6/hHN36+kKC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLumYPqDPg7PvF2Q4xs+85cKU2fUuXlTiNQsEu7UeFQ=;
 b=Rqs/sypyEv4iN6ZV+jU64AvQz4Ekq/RMSOBGLk8fWFIkgMFhCufPIJvZ5SHmapQgpmh0kyG9m6psPVkHJFZUMghfbuvqv83joBtiN2luPH7u+MKGV6occCUHg3mDt/EDgzVV95YJ+XHfBzve3OdJ2A9U0MsW/jnLbv44MtnvVkdFLORzjsA0H1y/66GC7VpG7UXwl2YwAK6vMTOrBEW09q6cjM1sD/8ncUZO4ixuVZQqqzxxchI1My6YOvM5uaMkL7n21vKz+keQVCV84nFMJYdxBME2E+kFWhYE3/BaDji1qCtTgIKrz6ltp7o9Kmiog8vH5RWrHbaEw73AmXR4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLumYPqDPg7PvF2Q4xs+85cKU2fUuXlTiNQsEu7UeFQ=;
 b=MphXv6kYPbilm74kDLemcD9lh6ISEUeYdie+KEtjGf0/WJPR6Cd4q3Ovn+LK7HrkIxOw8lDrm0Sj021cplpLNwX5PRuwqxKgHFfQJyQ2TpveVCHQd5j9CThgur/m92i6yeojBk/jUqwCJ2KtSTOOluSUzZmQmqRx6f8np0J/TnrQBG48ACobpu6Ib6EbtNeTSCykck4TO47f09t53xUHtRArctI2lpqU16vGwOOFn4imQDYK4qDQzQqNQdml3LwcvY/6Ad+weHqHBly6HlGQ3/KFI03Tx+WOLcW/s8U2+V+p4OAHhOpHiR7rwZjyMD0pVFHMwzaGLlbW7BmOcneo/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 12:44:06 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:44:06 +0000
Date: Wed, 4 Sep 2024 09:44:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dma-mapping: Pass device to
 arm_iommu_create_mapping()
Message-ID: <20240904124405.GA825382@nvidia.com>
References: <20240812070202.9366-1-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812070202.9366-1-baolu.lu@linux.intel.com>
X-ClientProxiedBy: MN2PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:208:fc::16) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6a926b-25f4-47a5-46a3-08dcccdf43bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+CpYUaNmsekbDvKPQiLIRtkg9M7ihALcMrTJkm1SOtSziyvV3kvq8HWe2rX4?=
 =?us-ascii?Q?P/GeFNdLCKvKKA00l+kZcMO4zBhN7AsIGCeRIhS2uYcChGEeRX6kBErR4RMQ?=
 =?us-ascii?Q?E2mZqEM7SYhfm4qzaaUs9Rb2z+sBPd3A3Rpzb77L8XHsipWzObDAfi9Gw+J2?=
 =?us-ascii?Q?zqNs4rhcn2XVldN7C/CLmvFyuz2oGIojxPCeA3RoneSLBXNteBNXLYvtT6o0?=
 =?us-ascii?Q?gFi3MJF1pY7LHm5DZqYDbQHixD/LvgAofFSKurI+heLDvNz1dHpLmPayGYL7?=
 =?us-ascii?Q?Z0DvDY1M5rmJW8l18MYx/ZrFAdtC2+oGO6novLoDvoTPF9BC8mBXEJJi350X?=
 =?us-ascii?Q?/hzl2RBkXxDl8UWTQDaeHlFGS1tVYmBGVnDhPtFSPGTxmC30BAtm8h/YFFBu?=
 =?us-ascii?Q?m9OslObclvoh2FdUnRslO3QjUvGFI2Von7Tj3+ZhWlT4i/EwIIXB3GxHUsx0?=
 =?us-ascii?Q?wPXBf7nmdpf1SdS2q/n1ZNuqKg24jVc1lwH4dZOgopqCbONs/PlGV4Dqs7jB?=
 =?us-ascii?Q?BIeOK4exNc6n2xwUyfHcuA5YgJ/uSWGXd5D/kPsvYkeR29nhw5KpKGFugWwT?=
 =?us-ascii?Q?agbQspKEwolghONJWHY+wA0SYFhHTQyetADiSJWfQU/Vdsa6pHJHAwHMV/G0?=
 =?us-ascii?Q?W63fG5A3YB+FrBLp1gDHTbRihyvUqqJy2c/YEg1spX+YxJPS3qbMrPcsylzH?=
 =?us-ascii?Q?fnzNvyXZ4WBJhOjv1tzLSByiZplEh8dp9qT2PVIOI2whhzKsyd/Yqc+4VRga?=
 =?us-ascii?Q?V9leXD8mBG+5EJRH5UPfmBySX2hhP+YJ0WtH5v6WMwsbm3WoXaUFqb3gAgJS?=
 =?us-ascii?Q?ycOLSh3olTYUJnuK3LwpfwYtZq3Acx3h0UrhTBq3TAaBUBpR2MTl3oOB7hQ7?=
 =?us-ascii?Q?rnBhxbBXE3jUaiEafpy2H2m4AnjEyYmE2+pJDyMRKS4mThpsjeoQcLpO12H+?=
 =?us-ascii?Q?31DguwQswKPQcRK3NSs6mZi2qyi8Yb8QcBLWO6E18+mCNLWU4LZHWv081W6B?=
 =?us-ascii?Q?cHiIx5Mo1JEMmzdprn1txLxQljeEg/ntTYuolkPyiTe4CzlyTHQu8WBTH8nZ?=
 =?us-ascii?Q?rPFpnYew7h5Tz5nBYL6JONFUtYE9tisMlDtsRDH7O7QkDtbYm8d2NJkb6r9r?=
 =?us-ascii?Q?R/EObApOjCYKQ5YT3k6gl9oJ7TsawvcTqleS18eatenRc/babxJF+FQNmpTD?=
 =?us-ascii?Q?IejiZcW33L4kJkg6Oe/HrE2SEEbF6zdtkROXYHQacrukQQ2G8y3FX0ES9vhy?=
 =?us-ascii?Q?mb8salmXmIL/CCnbja7np9kdDm8Cghbp+GXpEA4b8/dUHN+KC+7TIX7vTze4?=
 =?us-ascii?Q?cD8iloWiiHw4Eyle9DNvDs5dus6oEcWxc2mIJ0ofaha4oQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB7763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aya/S+XFF80Biy5EhfBDGr1swBYCiMzxTK0m3KUkhvw5O6joI1qyA1hr7WVZ?=
 =?us-ascii?Q?mPeQf5eqp8Kx/Qupz4ZAoAtg9GQI/do9Owb9b2zV4fFJoDEHREgh8ncrsu5j?=
 =?us-ascii?Q?GXZ05bddQyD1DM65Zysjj4Sr544098mrvP1CYAjbgomcM9n1n9gr0SPoLKr/?=
 =?us-ascii?Q?7JaPGRsWyXXX7f6xKgV/XY1AUP1u5tlasR61RoAMaTl6+6nS4B65c1ojYy9Y?=
 =?us-ascii?Q?m2RkZW3uLh4URglZ0g4XBYCvCW4Ab1dO9TDyNuDsqTeDlhbt7z8zPO/6y/IE?=
 =?us-ascii?Q?Quq5AFb6eyRF5iBBoctCZ3zQMryf0+doEc6S1F3/1S0N2lWbAMyOPWfclhw0?=
 =?us-ascii?Q?PmG+6WfsqmV+9E40RZQbaWqgciDFKWoxW5VoNjORlW58TEHwtazs050wQ4vC?=
 =?us-ascii?Q?siXVPin3meITQz75gPVLRxm8Akca9HGZ7OZ0wgcRx5pibSa2X2IjHcHjObcX?=
 =?us-ascii?Q?J368hr3vjefRmIKYts+7ZPG+SdE990kscUYHKA2ff1uCXjs7nPjjHUVFOFBz?=
 =?us-ascii?Q?9Ugvaj94oQe7WayNlAXQfYuLFPXJ9vW5AxeZYEGnr8CwDIxUuS3h+N1PstOz?=
 =?us-ascii?Q?ynWlYWFv0wt/Y4pPjX8vapTvpP5uBvq5E3O1u33Pvpo9b9YI5IlEUkBE6vhI?=
 =?us-ascii?Q?2q/oZx9KfGKb9TZvNk3iNJhbtkHIsMdQwrnTJclCIUlzKTrMpYulmPWvW+BH?=
 =?us-ascii?Q?DJVkhyOgPLt5RSeKgmAyoT9upiUy52DTGAi9d3ROoa4uAE6uhyv5HNMklLfa?=
 =?us-ascii?Q?VbRzZeUwCCBA52GNQWgi9y41F10fCpqoQEzd89k/ukx/JpmrEy4lhQTjBIn+?=
 =?us-ascii?Q?y5w81sys48bQjFrNbIMuQk6+7YzpllJCz6fuBH2OvDrm+M2gCdN+zCIyzqSo?=
 =?us-ascii?Q?D5YOPY2iey4ar2mBcwGpmhMGxutghtcH5MVXEDZj7nlmOOd4sKUJNpU+sb9B?=
 =?us-ascii?Q?vJKj0E4Ly0pWHKwPuHFZd5zLdVxNfeJQkliG5eOe/NQF1TsZ/Nx03OYOWPqH?=
 =?us-ascii?Q?B1c3FNOJJVmrqaydzF2CdI2Q5LTTnKA93zPZZ8iLYDUaxmgv8O2gAQCBEg1f?=
 =?us-ascii?Q?FNX775AyvVMtSBDjdyQa6vqsu9DbeFl0WNCofEa+M7MclSFMsJoOPlFqX+ne?=
 =?us-ascii?Q?jBN3f+aGhbau3Q46o4LmSgZ3plxnivz8Hx0iOEmkJsg5Aor0Q4cVOXJI5e1E?=
 =?us-ascii?Q?sDf7HQMKNVUJ9AO5lzojbGA1JTeSwKyKAi1lnImVoUVGXM3eZagy1f4V0pPB?=
 =?us-ascii?Q?wmxK+kvcDKBE/1K7x5zjjYZ4+3QtEvgR0JtA6diMAOqSQDxKXsEOYoow0B7m?=
 =?us-ascii?Q?DO0pCgTBH8k1nKlzueAzc/8nt82FvIchbNaOqjtnfaG2myMzRG9Ffw4kottb?=
 =?us-ascii?Q?wBWYnC60zF3R4xy9hjQ0TNjn7sSOOJbpCQpqjn4Kggz7bNXwWZPPPnaDeQ8z?=
 =?us-ascii?Q?lxpIYuaNYAxUn3lcTB2R2nVklYO27rGSJJnmgQ2EazqQ/RFzjCJ3N/IAmgRk?=
 =?us-ascii?Q?sHTiVb3PrhdMxoXZaCjRU0r3rO7GFlL11hTHJHQT4S/Zu4ecLMwRNgDsyNrE?=
 =?us-ascii?Q?HM8kVRrV4yGI0UgSoHE+uo4pcVUt2YsE+QrCOA0Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6a926b-25f4-47a5-46a3-08dcccdf43bf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:44:06.7307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhJxfBaFLjsrgusx1U2tckyU02cq9A4vPaPyRg5YpUG8GuGdFhQlq8X5jP/IzeVP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
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

On Mon, Aug 12, 2024 at 03:02:01PM +0800, Lu Baolu wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> All users of ARM IOMMU mappings create them for a particular device, so
> change the interface to accept the device rather than forcing a vague
> indirection through a bus type. This prepares for making a similar
> change to iommu_domain_alloc() itself.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-17-baolu.lu@linux.intel.com
> ---
>  arch/arm/include/asm/dma-iommu.h         | 2 +-
>  arch/arm/mm/dma-mapping.c                | 8 ++++----
>  drivers/gpu/drm/exynos/exynos_drm_dma.c  | 2 +-
>  drivers/iommu/ipmmu-vmsa.c               | 3 +--
>  drivers/iommu/mtk_iommu_v1.c             | 3 +--
>  drivers/media/platform/ti/omap3isp/isp.c | 2 +-
>  6 files changed, 9 insertions(+), 11 deletions(-)

I still have an account with RMK's patch tracking system, so I went
ahead and put these there so Russell can pick them up:

 https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9417/1
 https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9418/1

I think I did it right, though it has been a decade since I last did
this..

Regards,
Jason
