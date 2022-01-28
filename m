Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5049F10B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 03:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61710EE4A;
	Fri, 28 Jan 2022 02:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9029710EE4A;
 Fri, 28 Jan 2022 02:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktOsKHfF6x3tmBMFbLFRi3dCzPQ5NqGRn5Dsv96PieUU/26P2UvyhJglQUNIUz10Whv4FLoq685FBYKuTjQjviJwQEWWYsicJQUw2qpD+Bk9jLv/xFZBWPu1sp+kOjMCxnqvnWv/bFOm32WV8+m7+iV6r0Ye8VgPvz3RoboDMDO/Vexk3b9eoppHW2Y1gSkSLcxM+zNF/p+QIAbr5wBrXWZKv0z5o/z7KK3Y6lrDqA+/1p3iebBt0Ygw0IUEwkCnEuTHf1Be99JXiOFpZqnQP+5hXOmzrQuHxQc5kPd8QjWphmbu2Lze+TDHba4EYfzANodRGa3VhMGgLDKWHoSl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Ft8qnfGW4KotAzE1bW3wPtixzcnJsR+1Zde7Pk8L8=;
 b=XroSfXNWh3LsHblU8OlrFc1CqbEql/ad4L588J11R9rssN8fYzAbklp7gArjQHou+gutADPirNxSP+g7vwwRslW5UDsdblS4mDKWjbDSYud65im3nX6QP67knUnEUUaUyArbYA+y5DT552wuhdyjAvg9fW61aRoN0CVyGMFomOBctcUpUiJTSIhos24zZMg2YDHxku9V1cs54+T57GDyoGlOO+mS8Gavt1nClbWcSu5JjxMqGURXcTAbp7vxURC6WK+68LSAoFpld/hzFk6yAF0dIakGav/b0fAYXuKIsBCN4qsXQEsugzCfkPIISuw8bE9vMMONzDkmsg9duynzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2Ft8qnfGW4KotAzE1bW3wPtixzcnJsR+1Zde7Pk8L8=;
 b=exDGLwBzbugyYjFiIYsDCKtrT5qwZwfvZZCWTzubuBxErRE8Xb7u0e6MD09mlrDM/yrrYPdabziRNBEQH1zuELNi3m7o+fxSDHWJKPhC83RwgMzFH4PCycAibe9DbCjJlYkwxVOLso1TtZg/D4ifmTAw6unb9H9OU21AY3YkDBPDEKxaCz5e09bzWoc5lg00oOyet5CichAfVTSSYEZjVsvZGXqGxzLXFSepVoQ+K4unQLiwamUQD9KyGaVQK8QEnfcRY8n+UwofQuRyTzQ7qcyWvGGE/eZCKkzIOugnOcVXuVUwo+1m9AzzuZMnmsAJi4NlUCz56F+DLVRYst+ZZw==
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by BY5PR12MB3940.namprd12.prod.outlook.com (2603:10b6:a03:1a8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 02:36:17 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ac) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Fri, 28 Jan 2022 02:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 02:36:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Fri, 28 Jan 2022 02:36:15 +0000
Received: from nvdebian.localnet (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 27 Jan 2022
 18:36:12 -0800
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>, Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v4 03/10] mm/gup: fail get_user_pages for LONGTERM dev
 coherent type
Date: Fri, 28 Jan 2022 13:36:10 +1100
Message-ID: <4020316.vcUYH0acAp@nvdebian>
In-Reply-To: <20220127030949.19396-4-alex.sierra@amd.com>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127030949.19396-4-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: drhqmail202.nvidia.com (10.126.190.181) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 752936b2-0a5d-418c-e1df-08d9e206f59b
X-MS-TrafficTypeDiagnostic: BY5PR12MB3940:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB394058B36590C10336E690C5DF229@BY5PR12MB3940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cq9kis35zANw/MRit+kNbBFGJM2oHskMfcHzggsE4hFY86qPD9mSxysoOwslnpD8YqAdORTvN7ev5Uoqxen1BXibIMGTk59yjls7cYvPSaVUrmRIYw/kmAdj20d9qF938+4LfR8bTdO/xJ5v0EufpnKEyiWFSSifmyksofmeVnNHt0a2XeXOpyfn22wzSyLyEXGsCd+tanNvqkeiXvnMVa/ogDObyDnKi+6nUZEb2kpOrL3tU5IousQE0rm1JST3aK76hKfQKD+Nrx16Y/QEYAwIybmEN6f5olCobS87emEztfFCoySGTuPXqO7HwvVjqhStoM2iCDpX0VPUWBaCAokrcPnzst4iqsR3b6pd/ksLctgggux8IeLeLzjZBa7CW6FX5k8TGdoRFTYfu2qNSAJr3MafjzJHkk7A3nQn3s9jqQSLMGDTxZykpjeR5pKaOALeUCK8ndoXI5xXVRYmHoYVRKPhtTjDLXk+LmCL86edHUZNSdmCpKHUeceh9tq5jeC4WT7MX8MzGAvZc09HtGm/nj4cixfYbsdeEQaDL/UmiYDtNtt9CbEK5DyosqqR9oxB08SWZOgVUTo0nY1J/LkIvDANcbaD7Y/oiA6x4/z0nV1rAS/vg6bmURVz33edrXvEZNZxFzRrqDzsok7dH9GjvEWpRrUPVsS/4GoC3VhU1F4rNeyuQpYmCalCCSZST7Nycx1vpNHiFuW6rMwzJYQQTwm2YutuJnnEnVbhshIIMKpAJ64+/tbCuxLocAZVAFdws1K19thaTjRlumHN/JpI6xN1TbBsDfO8lPRS+hx2KJ2U2KNUUcCTjnaLIn0e0zcWGgghx38L4y/w0MEXyg==
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(9686003)(54906003)(8936002)(26005)(5660300002)(82310400004)(47076005)(186003)(33716001)(356005)(508600001)(70206006)(110136005)(70586007)(2906002)(7416002)(316002)(8676002)(426003)(36860700001)(336012)(9576002)(86362001)(16526019)(81166007)(40460700003)(4326008)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 02:36:16.6232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 752936b2-0a5d-418c-e1df-08d9e206f59b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3940
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

On Thursday, 27 January 2022 2:09:42 PM AEDT Alex Sierra wrote:
> Avoid long term pinning for Coherent device type pages. This could
> interfere with their own device memory manager. For now, we are just
> returning error for PIN_LONGTERM Coherent device type pages. Eventually,
> these type of pages will get migrated to system memory, once the device
> migration pages support is added.
> 
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>  mm/gup.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 886d6148d3d0..5291d7221826 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1720,6 +1720,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  		 * If we get a movable page, since we are going to be pinning
>  		 * these entries, try to move them out if possible.
>  		 */
> +		if (is_dev_private_or_coherent_page(head)) {
> +			WARN_ON_ONCE(is_device_private_page(head));
> +			ret = -EFAULT;
> +			goto unpin_pages;
> +		}
> +
>  		if (!is_pinnable_page(head)) {
>  			if (PageHuge(head)) {
>  				if (!isolate_huge_page(head, &movable_page_list))
> @@ -1750,6 +1756,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  	if (list_empty(&movable_page_list) && !isolation_error_count)
>  		return nr_pages;
>  
> +unpin_pages:
>  	if (gup_flags & FOLL_PIN) {
>  		unpin_user_pages(pages, nr_pages);
>  	} else {
 
If there is a mix of ZONE_MOVABLE and device pages the return value (ret) will
be subsequently lost here:

        if (!list_empty(&movable_page_list)) {
                ret = migrate_pages(&movable_page_list, alloc_migration_target,
                                    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
                                    MR_LONGTERM_PIN, NULL);
                if (ret && !list_empty(&movable_page_list))
                        putback_movable_pages(&movable_page_list);
        }

Which won't actually cause any problems, but it will lead to the GUP getting
retried unnecessarily. I do still intend to address this with a series to
migrate pages instead though, so I think this is ok for now as it's an unlikely
corner case anyway. Therefore feel tree to add the below when you repost:

Reviewed-by: Alistair Poppple <apopple@nvidia.com>



