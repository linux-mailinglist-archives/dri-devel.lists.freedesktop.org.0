Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748CA4A52D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE68D89DB2;
	Mon, 31 Jan 2022 23:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210C789DB2;
 Mon, 31 Jan 2022 23:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP48YUKHN7XJ/3dIjrMDwIkRTQH9kLJXzb0aOpTG1VuIgg1l96kGE79aBho2pw56DZ0OGSgNggd+VmN3uO6wjODe6PUQawaTdTGBF7KlFizrKXfBYgDsKXsosDeel5d41rINDTIZkvxQP5swsKZjmXMa+M5l2cpH33zp2ZkrnJ9Ix0O7DXoVvQYK4WOve/pIPw76J78FmUdwtNScihTAcPQPtU4JBZyXRp/dJG+SrktUBzkFkhIwjS0d/l8zX381dpEBM08rwmpzjQ/etWJ5zPGF+uELwIIqFTOpYQc+0ojPT7uq2ugItjhZWeTJZyXsvziU/XLWAWhmZrRs9mUtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpT9/AoMPpMhkIBMhwwWbKM5n4ZxMeFXAU3BRsxnEpM=;
 b=A2hhxlgfhLLxcHWk617x2oxsoDQQ/XxCDGO9YlWjqBdc6esPDqpMnAmfEzjte5RVE+KiaAtfTPSDwwedSogU6z0OTDkcRvuLIdx9hrIaDy3vT4fR/W+Dtu8GKRemnYQNr9N+bDX+SG+BlQEVTlR91MCyu6tv4TIX/zucqdYIYOnviVhdbWRAiy+XJDWf+5P/blFByrN7IsriCdOpD40y0tojxvg6KDjnVERtrVNhUXVsfuVReSWVjZywZ/fZnVzi6bvWOGeAbDIyWdDl1jdEeAGfQMvTC3Lwi/cytYbjJHGfYaZMt/AdA/vnC7la3l01VYVoaaWIJwLe9EjZRzFvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpT9/AoMPpMhkIBMhwwWbKM5n4ZxMeFXAU3BRsxnEpM=;
 b=lozWAvbxp5ctIklrav0l1LG75jcp5UQe2gJnXg0W49YDiMBqwNf6FJ6AM47VO/ZOoGO2ml5ToR9PiQB9JxbRtXXlxA/h9uwqH+5qx7W045AnAxTlt+TNAhMrcDPsgysRl4LVHO+IR6wpJfsBtpNcovuyaM8IWElTHM38wyYS2X/HsJxt0EwqRF/ti7hgCn6q9kcYj8UduZ3TyAbjezLWW7PacEJc3xjGOMLTqNyneXscoCABhAE2LykFaX1wKVy0BsxYS6s/fJ1IPWzNR7f3LsTJP3VrP1CKGbJmxVZi0Jg7u1S7u6sAt9XJULuZXyZf6ztQaA3dl0455LzgF1PeVw==
Received: from BN0PR07CA0028.namprd07.prod.outlook.com (2603:10b6:408:141::27)
 by PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 31 Jan
 2022 23:04:08 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::e2) by BN0PR07CA0028.outlook.office365.com
 (2603:10b6:408:141::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 23:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 23:04:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 31 Jan 2022 23:04:06 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Mon, 31 Jan 2022
 15:04:03 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH] mm: add device coherent vma selection for memory migration
Date: Tue, 1 Feb 2022 10:04:00 +1100
Message-ID: <9299270.MvJvtvgxUe@nvdebian>
In-Reply-To: <20220131194813.31779-1-alex.sierra@amd.com>
References: <20220128200825.8623-3-alex.sierra@amd.com>
 <20220131194813.31779-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a2cc934-ecd9-42c1-3a62-08d9e50dfc02
X-MS-TrafficTypeDiagnostic: PH7PR12MB5595:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB559598FE86CDB633BBC61BD5DF259@PH7PR12MB5595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxU7VWuRuzi24PNGsiTioZHfZRAunYIQ0BINKyQA7erCAUD2zpND0ksuuFMiRc8/gdxY+aQ434+R1VFiYIgkPHOClJNdvT8VXm8nPYhwpf1F0tFYYHM3ce+CcJz1+YDMAJL2Lq6B8uMy1WYVIeUJV/xpQGFA0Uy9v7/Oo4AO7kDtaT9+gs9URvG2aVz57y83rRYujCvdFKpm8nVwonZT9oevgPPYnLyHW/ZWRFfNF8B9Jy6SHMV/zA/o9EvMSi6VZM+mjt5Q8quM2E2V3Tb6JtxSxOnsb5xfJGAF+VKDOAA/bFF/TSwigyPuHqvRKDVvf8HX2JSqn7B1sJsogXnamZgPtIemL6OQdmMeQrjVuAz62kxZjPaeTEHrVYplj6avvCpbh+yfwtpDRFa1tPNeKbYqP3HRKE/VbKXbslNipy4qaEbJtcEyFJQxIGsEBx4EH/yGdF2d4hjA+xuq4pl1US1oO5jBf8N5NVacQ4ll9rUxy2CCBIz+RlgnSwQrrDBPxEBQ2elcTYyLJV4vcGGYr75oapajhzFCne6sAf+i+vKX7ZPLJcaj9JLhiKmlFJ8SMz6bGJOSvmSdtLt8qTqgCT8J+Rq3oErx9q8Ncrlw5/HwhrS1cwJ3eoz18dBuKez5qNfDRw9liwKVG10AiZu7fIpu7PGOFcgwdIn9ZoEQV/g+VLCVuNFPF7eW34MSgF0kgNhWnrSmuVc0YNgHN1qfI6Wg09reSMowlLobAbknQ8oDPnkFxDs35fNI4tkPdYDLiSY5U5yPWSyUDiJjOg/rMUgucgfsFpMWxhcOm6YKzxE=
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(426003)(8676002)(26005)(508600001)(70586007)(9686003)(5660300002)(47076005)(82310400004)(86362001)(9576002)(316002)(36860700001)(33716001)(356005)(4326008)(81166007)(2906002)(186003)(70206006)(7416002)(54906003)(40460700003)(8936002)(110136005)(16526019)(83380400001)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 23:04:07.3257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2cc934-ecd9-42c1-3a62-08d9e50dfc02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for fixing. I'm guessing Andrew will want you to resend this as part of
a new v6 series, but please add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Tuesday, 1 February 2022 6:48:13 AM AEDT Alex Sierra wrote:
> This case is used to migrate pages from device memory, back to system
> memory. Device coherent type memory is cache coherent from device and CPU
> point of view.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
> v2:
> condition added when migrations from device coherent pages.
> ---
>  include/linux/migrate.h |  1 +
>  mm/migrate.c            | 12 +++++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index db96e10eb8da..66a34eae8cb6 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -130,6 +130,7 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>  enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> +	MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>  };
>  
>  struct migrate_vma {
> diff --git a/mm/migrate.c b/mm/migrate.c
> index cd137aedcfe5..69c6830c47c6 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2264,15 +2264,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (is_writable_device_private_entry(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;
>  		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> -				goto next;
>  			pfn = pte_pfn(pte);
> -			if (is_zero_pfn(pfn)) {
> +			if (is_zero_pfn(pfn) &&
> +			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>  				mpfn = MIGRATE_PFN_MIGRATE;
>  				migrate->cpages++;
>  				goto next;
>  			}
>  			page = vm_normal_page(migrate->vma, addr, pte);
> +			if (page && !is_zone_device_page(page) &&
> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +				goto next;
> +			else if (page && is_device_coherent_page(page) &&
> +			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
> +			     page->pgmap->owner != migrate->pgmap_owner))
> +				goto next;
>  			mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>  			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
>  		}
> 




