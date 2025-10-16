Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A50BE1686
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 06:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82B010E080;
	Thu, 16 Oct 2025 04:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PMipPDug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538DE10E080
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 04:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9M/liqiJwoZk5d00vmFdvfSU7hbjTCmMLDgxS+AVn44GPNGODF9UNVg3dRGSdIAxV2GY2VqJ13jv402AHqapH132mMs5BZ1E/fvy07LUkpPDPPMtpUdVjAoqY6vg4AO2ruawIlltsZhXQDErkUyZW/y41flK6ait44esut/gfEcJeKXNWA6KVDxHd0bGfbPFXarVFSx0SNaqm72VMGvIzcfwgtIvyozDCwM/KUv4Ki/Vw1Spu+tm5vLQ7/n9NxvbSCbQWlxAY3c1ec2jkAR2Ej2W3MpRPXy7ndfG0xPxUr/gQqFdnCEY5fmhBACH3NJR9mK9+gw7nAYHQNJ6ibr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzQ4tnfmli0RcUF7968vYelvjg1xf5gzjtt5FmtxTN0=;
 b=sGks4lc2bbPlylbNLQ+fumZ64dLAVLo8RT50HJ6hmCjWQSsEBYP7f7yyQmMS1DMoPTe+yiIDqI8qAqP0q2gqftgUA6xYeZ4xx6KkSb8OWDGvfaJmtkCUrcaXYUbhyajBhtZaao1kyXKE6kE/u9rXYvdcbRpF588gQMSpFTYt1uxMAklunL5QNGhJVtmvxFK1C2xW0pb2x9TMj+JtLSxqKyB0PSrlvVIHHEZ6t5GaXrrQoUTHqKldZxdN2HwzfIxr3X41XYflnT/rHr9+k9y8B3KOZcia6gYbiMNs496Lto2u3+r/WYhCTb+nlH3OpYS7lBkJXqlE1V6SXpas2748Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzQ4tnfmli0RcUF7968vYelvjg1xf5gzjtt5FmtxTN0=;
 b=PMipPDugQKjH9U6e7JuO/pSKNbrtB238aHm5C8LQrrsk+aTmzTRBh2Ox7qaI98tCvyK+DYqt5OxcEvsTx2AGlJyOI9MrrHEz7rdEfb7eHbHTEQLosUr4vKPxO11ZthBWoSgLsu7TVa9/LIpbYpPiH3b/6kGGsG27m9wFmR+o6TTQulq/MZvUm6X7aNNzvKtkZpz4HCmu06hUpgK7IadPA23exlnDLNRPZL+BWEgTnB8SKzwDiQHEtO0ab0PSJveno5kflAg+QPfCK7CRj0z5pyjLkmja11c4uXjsncs61SYaim3FqDDCyz7+AC4ha5uNv5YbOFtlcYKA8GYSx4SyZQ==
Received: from PH8PR20CA0014.namprd20.prod.outlook.com (2603:10b6:510:23c::24)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 04:10:09 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::d0) by PH8PR20CA0014.outlook.office365.com
 (2603:10b6:510:23c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Thu,
 16 Oct 2025 04:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 04:10:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 15 Oct
 2025 21:09:57 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 21:09:56 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 21:09:55 -0700
Date: Wed, 15 Oct 2025 21:09:53 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, <kvm@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pci@vger.kernel.org>, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Vivek Kasireddy" <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 8/9] vfio/pci: Enable peer-to-peer DMA transactions by
 default
Message-ID: <aPBwEVJSzezdii1V@Asurada-Nvidia>
References: <cover.1760368250.git.leon@kernel.org>
 <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc8bf67-cbb6-4b73-e83d-08de0c69e53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aOPCMNXt69vGompbXz9hLA4vo9aZ8TdLP4131mGwisgZM9JQ0s7SfGcop+Km?=
 =?us-ascii?Q?Tg5BJ3EwtevNrg5gDIu9jC3/iS7Ld/qr9XoNMoVGt5dEW9UNnPTVP1labE0k?=
 =?us-ascii?Q?eQy0QHU3dsWh9ettL8EUXUIYJ+nnqrdjoAvJGJQN11ZsmsuNhVpsMEx7C6ez?=
 =?us-ascii?Q?lKVro4LjLvnvoQyrJv8Wrx2KIY8KgJwZv03KcSnbxBGr22vVrRg1rcT7swKC?=
 =?us-ascii?Q?dEJ+W1nP9PeZNd9/gblFUhuNCvpp7otniTdh2s7q6zwciioi1aDPljx1kl4n?=
 =?us-ascii?Q?S2Fs26i8xXvlUd8iVI+OUGdnRwNyQL4bMAydGMoaem3oXjyzu2jw/dDdTJmw?=
 =?us-ascii?Q?kdx9/HWjWY7KMLUNGEoCyLc1DC1T7n3XgcfXZZeRBnZ5/SFOXvumpe+nf2PH?=
 =?us-ascii?Q?+EBTL7CKRsXt4GsWP9AFlUGnTFC+t1DyHQdOn1cIFSJzhQyvm24Tj8OsR+tC?=
 =?us-ascii?Q?zHrynP6axdGREtF/9pmapYYflLZGOi+AajS0BlCWVCpsYtxYjcOdRHi/Qadj?=
 =?us-ascii?Q?/VmB2zZPprh6Eb+1GOUbjx/qfYABOIJq4ybamo7+U+WSkchwkCeHFqi4+H6/?=
 =?us-ascii?Q?Xs/PyagljB8zBTx/z+F73a4k+y/3kfGX9OppNeCDLyatuYNss/LyyLjKNKRN?=
 =?us-ascii?Q?AQzwoh4+E2v7yPhdm6nGmCBCL4kug108xRi/byv03GPj3Se27ZNf6WTbPeST?=
 =?us-ascii?Q?M3Y95nlWhlicY1WA84dXzDAAFZOoP56V3T2UrxakQa1E81QOBGyYTkUaWpbB?=
 =?us-ascii?Q?5c7J6vARdGNuZ95MGK65zgVXTngNr3/L5JO6SqNwrIMFfS3Lv7pGYVbkfFNQ?=
 =?us-ascii?Q?sdwXQ7AarYkmmD7ZwoFyDg6E6raeXLMZBBishTIMg54CIoI+w5p0oOESHQa3?=
 =?us-ascii?Q?3Euz+9uTqBG9WYTcUxmughI1yjWebiVUiFz07BgEc+1wlvZroFbtW7OS7pLi?=
 =?us-ascii?Q?54OunjQUKVCFn5x8G19okZeCP4Iwrz4lQ9asPV0M0YOVkzB5KxL6OtC8T+P3?=
 =?us-ascii?Q?DEDkuIPIQC+fHmp+5+cf5o13XM3/YWYPUUnnOuKTaJibHZ1+oiSCXxoGZRXQ?=
 =?us-ascii?Q?dEr14GYEr/mc6sTD8e2UK8ZHPnZvclhz2lTtcD7S2Si2uP58teIOc/M12UIL?=
 =?us-ascii?Q?NOfNBy5wVav7SJYS6VbJrKfNoDRl1Ec/u2WtXjyCoSf7LPMvWzuXE8EFIf/N?=
 =?us-ascii?Q?Q0Pp7KML1SNADmnH0o+6DG44ktax5X2hOwSlCfCxd4jETQn1M1C8vGGPoZC/?=
 =?us-ascii?Q?62Bsb2txx+aoSr0FNjQo9nSqUdzYDUgLfzZ6JtM6aJ0pmhSf/bZc6o8Kl6Wy?=
 =?us-ascii?Q?/8LfQfy/oGAEJDzKkHDKKA9UW8/dFcQQc7GIdyEg9XddEfXr7Z30iL+8Z6GW?=
 =?us-ascii?Q?zsIr4TpHJEO++okrgar0EmUx6DQFL99CLIBeUs9Xv43n6Wu1bmnRLhdi3XOc?=
 =?us-ascii?Q?S9hM0eF3Xt+ujsKctSZVGQ6F/aEEzZ2R9lmQtlUZ+3IEaZ1tzHVLiK6QXMWR?=
 =?us-ascii?Q?747Ni/xiClJcO8q0XeKXjpGGiDnf52zhtfuxu66bBvsvik3z8DhuPZGVcxqF?=
 =?us-ascii?Q?hAI03rVVLexi0Ff3nTI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 04:10:08.8892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc8bf67-cbb6-4b73-e83d-08de0c69e53f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906
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

Hi Leon,

On Mon, Oct 13, 2025 at 06:26:10PM +0300, Leon Romanovsky wrote:
> @@ -2090,6 +2092,9 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +	ret = pcim_p2pdma_init(vdev->pdev);
> +	if (ret != -EOPNOTSUPP)
> +		return ret;
>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);

I think this should be:
	if (ret && ret != -EOPNOTSUPP)
		return ret;

Otherwise, init_rwsem() and xa_init() would be missed if ret==0.

Thanks
Nicolin
