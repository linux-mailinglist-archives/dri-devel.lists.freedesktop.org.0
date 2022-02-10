Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55E4B0B44
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2E510E7F0;
	Thu, 10 Feb 2022 10:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419F10E7E3;
 Thu, 10 Feb 2022 10:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyzGYACUC/35ai1j5TbxIDPq8PzRG0AlyV1L4AsqdSjfWGW2pV70wnutJYwq3af1Jk0hSc10C1iF3HktspBa2SM7Z0HSJGgr+5c9A/eg+Y+V3bL6XWr9R+1zEUWpDxbERWDjK2WRzvJocDGWeg4G+cXOZRqrCBdRM/Y30icUGUk4OWA3S/Z8yH5jeaNFw5uoYWirFTRm0XjBCtqk2ub5wYQ0JrMNCqSBGL3hXEJuj+SsBwbZy2ikrvsnIgKtZ+Li0ikqmCOHbt06CHnvxD7w5cHH8YcRagdPIhD/5mZE67IF4Kem5yT+Bg8VqAhwLDMI+CN4fee+SBTVGNqTo48edQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SErtgkIgyuVgadPKZGz7qUjjLK/jm/m0zNewLjxJRns=;
 b=k7mgr6Rjs/mCz6O1Elm/bhUTdwHYI2u8rC3jvOYZ2Gjo3WhD0HhvGeSvFIot6jGOu5E5PNqgFRhsTFidc/rMQnM0x5rN8rFA9auewvawW80dCiOr98SNVUM2K0boFKay6VLn40F4UjJc9yKfTp5+oUyq3oeIc9ZW8LRrHXuA+hPRI9jiCnqQ05OME81AqdWQpJwcU43ayNrUTc2hEjJoJoyxja4KGVjNuSrE8tmyGdC7KDX71Omrbb4YBYdrZ+vUbVZCtywjyjbqsfWEyFmByvT8FW8TEdaLQYrn1IyX2NsjLrFPDjt2yblzwrKSQl3WN9cl63wi4oT0fy+5zbb28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SErtgkIgyuVgadPKZGz7qUjjLK/jm/m0zNewLjxJRns=;
 b=Buk2V+Htmzt7BUu+Es7Y8be6u37AEhiTQwMKKYYgaGcFuphQe2jiOeUmtxLlnmNGVzL3Kmq74moculE3eKRyg9+v0u/a/JSjfpl9mJHUN4ZFnUq7CyciDxriEE7caiZZjNRQgd3QczQD8QleE4fuU4F92fSkxmGJTzUW4tBVPYKOKcTewkONs73oKrRvIDM+/YBst7R3pZeQvg5KPvzYsxFp6DHtRhuoeCFRpTRE4O+zTMtFFh2XykaNERZy2vDy/6NYroJCoJ9U9B3d1mvlMIo70fjsmI2UZEaKUkcY42DqThLdH9/2DZxoDaLCCl2DdibpQDfnmzh8boACbrD8rw==
Received: from BN6PR13CA0032.namprd13.prod.outlook.com (2603:10b6:404:13e::18)
 by BN8PR12MB3186.namprd12.prod.outlook.com (2603:10b6:408:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 10:48:40 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::4) by BN6PR13CA0032.outlook.office365.com
 (2603:10b6:404:13e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6 via Frontend
 Transport; Thu, 10 Feb 2022 10:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 10:48:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 10:48:38 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 02:48:34 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams
 <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/27] mm: refactor the ZONE_DEVICE handling in
 migrate_vma_insert_page
Date: Thu, 10 Feb 2022 21:48:32 +1100
Message-ID: <1871470.rkCPzpQqbp@nvdebian>
In-Reply-To: <20220210072828.2930359-12-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-12-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d03788f7-1242-46da-26d6-08d9ec82e616
X-MS-TrafficTypeDiagnostic: BN8PR12MB3186:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3186AD5BA233CAE4545D48B5DF2F9@BN8PR12MB3186.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXQLtQ0ePTl1WE/8Ie0WURgR0h+yUWKTEZIWLYqmDM3a5ldh39fEYd4jyHUWqIalz+sZ2KzBxns89eYP28cB5ukqLDlorCop0r8l1VdWteDgcPR7dswIhDaYuySP0GuEi/trJitulhcBXmbRcXce/RGSspA5wckyzrEWpNyE9pHQwVkyWl7g19cVN6KRymPYtg2ZHJFbbZaDUP8TXxpeHDi+zsJSg2M1VKzpYHyXGBcJLVODov5vxbkXU6o2Uzen4z2MkB6qlStpHjTY0GhWmM45RN50RN3IzfUHeidCu4J5zes5y1u/LJzkS1WJg7QmMdGlZfMXYQgB2fdBik/3D1Cj7etaLViWUTwwdV8xvY20bQs/o7isagzecqlor/nZfqs0MBO30WrEWtpOySAP+uWB7/pMjmhl0FAGsasez0LyZIU+gOmvVLhqig/gP2lPuVo8US5MkU2iapZ5aVw+YWouO9/x+fnymH0D6P0YUX1VgL8aLzWG7qY+lSs15UwmG4IQSldM0RX+neh8I6aaTkhovz6qc5q8GOsjV55QCkngngiHStKyfAWJRS925YG1hV97ZNVQ3SprkXfaDalqcxxGS39jp816W9gpxw5jgklWwbUYKlmxto6t+jYxFu7bZdu1lByf+YMCX/E0B298PFyoZVx6dYdZpx7qgaaDsQ9OIRUxaPZTkKYU1+llK1wasIRY1/ux/wj+NDyu8h1rgA==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(9576002)(8936002)(47076005)(83380400001)(40460700003)(426003)(336012)(9686003)(36860700001)(186003)(16526019)(26005)(33716001)(110136005)(356005)(316002)(70586007)(2906002)(82310400004)(508600001)(86362001)(81166007)(7416002)(5660300002)(54906003)(4326008)(8676002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:48:39.8032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03788f7-1242-46da-26d6-08d9ec82e616
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3186
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Thursday, 10 February 2022 6:28:12 PM AEDT Christoph Hellwig wrote:
> Make the flow a little more clear and prepare for adding a new
> ZONE_DEVICE memory type.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/migrate.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 8e0370a73f8a43..30ecd7223656c1 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2670,26 +2670,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
>  	 */
>  	__SetPageUptodate(page);
>  
> -	if (is_zone_device_page(page)) {
> -		if (is_device_private_page(page)) {
> -			swp_entry_t swp_entry;
> +	if (is_device_private_page(page)) {
> +		swp_entry_t swp_entry;
>  
> -			if (vma->vm_flags & VM_WRITE)
> -				swp_entry = make_writable_device_private_entry(
> -							page_to_pfn(page));
> -			else
> -				swp_entry = make_readable_device_private_entry(
> -							page_to_pfn(page));
> -			entry = swp_entry_to_pte(swp_entry);
> -		} else {
> -			/*
> -			 * For now we only support migrating to un-addressable
> -			 * device memory.
> -			 */
> +		if (vma->vm_flags & VM_WRITE)
> +			swp_entry = make_writable_device_private_entry(
> +						page_to_pfn(page));
> +		else
> +			swp_entry = make_readable_device_private_entry(
> +						page_to_pfn(page));
> +		entry = swp_entry_to_pte(swp_entry);
> +	} else {
> +		/*
> +		 * For now we only support migrating to un-addressable device
> +		 * memory.
> +		 */
> +		if (is_zone_device_page(page)) {
>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
>  			goto abort;
>  		}
> -	} else {
>  		entry = mk_pte(page, vma->vm_page_prot);
>  		if (vma->vm_flags & VM_WRITE)
>  			entry = pte_mkwrite(pte_mkdirty(entry));
> 




