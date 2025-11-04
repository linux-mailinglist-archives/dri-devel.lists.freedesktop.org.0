Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02EC32C08
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27A510E323;
	Tue,  4 Nov 2025 19:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YR7hdKVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D51810E323
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai6I/nN6paCnIKl1lsGPjwKo4w2QvjtRn/XVPF30IF7a5in/Qxz/G3mQA3XJoiqHlJ0ObcDQtzozid8didrg2LOe98OFfGWmw7HCIjt3WPMDs9ZVBU5AUzfc36Nle8+Zd/qIZxPjMsxhWIB2PKnDTSff1obEDvdxAdduC1KWKOWDPb0ttoxIx59nRAsyPy05hPHJjhWrXl+JG0hLfQhAOY4Np2KzVpoYwXmmtE7b5/KVTSitnUxV3e6SPLDQt8JFNnCCXPXTNXkDvC+RR51PnX80BRgxLXug4G5Id+A4VEeb1APxPjLGdT/yTBHsDAdYY2grBFXq1kgJS1nkcnegbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWr6q1jmbGgUJvDOdl8W5U9pj06L7ge1J2sazkf8Cu4=;
 b=kuBqpgRM2bKUCCfsNtNustXhDDl9oLM9EORC6tukZmTazlLwQi1/JE9CNJz6hNQGJDG8IBadZtkau4IGO8OSJIzkpML9+VQxQ7le0YOhtLdiibyYN8/Ge8Eq3kSF7FPx+brr/Ult7fLyL6VwxRwf0BsjOLorI0j+RdpNo31H858wrEex6rL7ASBKzK/ANpZ1mrNeIBM4nU4Mw6VEBwoIz3/wgPsr/R8PzjXU1Vfw7q/mAheBrkaKOWDrPILI1myNAFH+vrbp56vFLCddI16TO82auB2LiummZ3JBVggqnrgZfLFB9OTycRmEyvXac9+IrGvqhtW0QcKKxyaAis00Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWr6q1jmbGgUJvDOdl8W5U9pj06L7ge1J2sazkf8Cu4=;
 b=YR7hdKVXbUXtQM7G5KQT9UDPbiXY4aUqnx82Z2AzHek42Saiw94IRSSfbqMkpMoei0eBsnozxVYqFCg7j8/dd08Pa3vajaumjIa+ehXlySSmS9Pz05y1wKD8ujLAnHIfHWv9vml9ballXZYMvZ70Kwbr3U+Udm6ERz2aecevauMT53RHobzBzyT/I9eM48TRy+z49jx5FO/QafZHm+fAz1FUAKKCX74+1G5TRGcE1maBPGs3doOESA+NRH657C+B99BIt13k8CS5EeJa89a9eI0UFf9CT+n4C+c6yh/iDGakp7pSDlfen/LzLInPmudOwlswexv0yD81Wq1ElemCcw==
Received: from PH8P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::15)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 19:20:10 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::3e) by PH8P220CA0009.outlook.office365.com
 (2603:10b6:510:345::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 19:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 19:20:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 11:19:47 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 11:19:46 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 11:19:44 -0800
Date: Tue, 4 Nov 2025 11:19:43 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ankit Agrawal
 <ankita@nvidia.com>, "Yishai Hadas" <yishaih@nvidia.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, "Kevin Tian" <kevin.tian@intel.com>, Krishnakant
 Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <iommu@lists.linux.dev>, <linux-mm@kvack.org>, 
 <linux-doc@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>, <linux-hardening@vger.kernel.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <aQpRz74RurfhZK15@Asurada-Nvidia>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 265e2435-1e4d-4ae7-e2ae-08de1bd72b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7nLGBN468PB9gU5i7TxbYYTv5OfDTp2lGe7C6fsUsjG93dvO3a51nQY13Yb4?=
 =?us-ascii?Q?6xKf98FSA9X2pod3rsOKsvCSbJvAXRsmkuEADyYW9Xk53n1NHLyDDya1vj9b?=
 =?us-ascii?Q?fEwwsEREV6vkXfu2cRb/8VASQaDYZ5mb45KaNNxgDYMt0dFkTWI8qvESG03P?=
 =?us-ascii?Q?Kfj05CZqp2H+7NrWbQKEfMul+j/luNYr9Y3sQSbeBis+d/hlXlO8SNr9oZCn?=
 =?us-ascii?Q?CN4CzH3tDLfjH5NvOGG+QiXnX/o0HkYDQSHIFAD037Nc/BclvQYACJRFpHMz?=
 =?us-ascii?Q?pe/bRcK+2dNtJ7i1fGZGcv+Mzr3/feu9ZIKfxHr0lRm5MmesEm5uBLfLXenF?=
 =?us-ascii?Q?Ym/BZkR0VwSwtmjUn/SWlGC9Dd16syo9Ai2xtH5GjWsYUdwo21ic7EvcYQsb?=
 =?us-ascii?Q?43fym9/baYv3KVvKbFD9T3HMRn+dsXPOg4UiHuU2btAwNYNJdmr2ok7sx7lu?=
 =?us-ascii?Q?qyUHlbVn8G61vOr26CnDIc9ZIReOCznMEXVX1IDLcqe4VJVnzGti7BIAwST3?=
 =?us-ascii?Q?BkEUnaD7hGrEnhVN4yO07mjPCGFDowXA+7qcmHNsMkl/rOef1nLaxfBlqfFm?=
 =?us-ascii?Q?D3nc9YWYDX0beCCNBHY+eWSQqCcdLmKKW0mUVi9d6/YYy6W1rlAGPIg7G3AL?=
 =?us-ascii?Q?na98x3cb9+7GHFf1JhRq9B5rQVkgjQDNHyTTZSNmywfq96G/KWcAPTxq1JsQ?=
 =?us-ascii?Q?++oDOIIK2pdjE6gO4DesyopU/ndj0UWe3w1guJrPvqLqLGaM9Ksz4+QJv89M?=
 =?us-ascii?Q?uhx+HQ4QUWqpPS8pnIrcZIBVH+zW7OZM4KgrpIPVoJn44GV9uxmL/xgYw7l7?=
 =?us-ascii?Q?TkLpm1ArSYJMn6UusNOT/saB1AQSbSN3cczrkAuKt2MCJaLkVwWNO5EoTNCB?=
 =?us-ascii?Q?SBuGHeX85AOjeVl2gPGYO34nJv5jG7llAc+qoQ4/vN6ar1IvVE3TEeW9bVri?=
 =?us-ascii?Q?6YHjHgq1t0ZOLL29O8NWLFL7URFhFmPY15/hjsNMbMBKOr/J4dk1cAGMpyLS?=
 =?us-ascii?Q?KVp0CHmrXvqCV6b1MTu3WcZlfXH3PegRVt1UW52PMl/cMeWsM8YNM2PAzY4R?=
 =?us-ascii?Q?if72VpdmDZAVfAdNp9qv1aP4jw4CcTLBTb330jvNb66WoD38TqhIUbOBgM0P?=
 =?us-ascii?Q?WF5wyog2E9m4qThLulfjJYqNSBOwXYFTQehhKvFL1zVwdpAf8JHA67azyrQm?=
 =?us-ascii?Q?RFavBTCxVnnr/rs+weBABksssjBk39O9QImtbZR1ZwtA0urgtTqE9iVlOKEa?=
 =?us-ascii?Q?nc1+qsIjZeNe4NnSXlFgXJ8WZXyMb87VuhYO/R6BwbZi5+91nDvcxeZx7Pf8?=
 =?us-ascii?Q?eSareoFfZ5snvvsmhJlR5RTrnFNmPI+4/iMgpOKAi86ZsKNydBadLrciFRRh?=
 =?us-ascii?Q?hJbLtDJyJWkMWgN0Wm5xJ+Vd68kcyI2t4PdetZrtfX3cDnY39Gie3saLoIFh?=
 =?us-ascii?Q?X8dHTV1+uVWpMIHiWQkYBT0/hzZZ+EThupYOPiQ4o04B2ag0tz8dVomGphAN?=
 =?us-ascii?Q?dF/qgko0U+9JtGm9b7g+cvNTJrQBBAhc9LhnY7Ws42cowCACjLKET513G4aC?=
 =?us-ascii?Q?XHtrAIQIOPYo7kOxCooM+aIHoGmDjg1AiL9SaGEp?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:20:09.1344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 265e2435-1e4d-4ae7-e2ae-08de1bd72b54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707
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

On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
> Changelog:
> v6:
>  * Fixed wrong error check from pcim_p2pdma_init().
>  * Documented pcim_p2pdma_provider() function.
>  * Improved commit messages.
>  * Added VFIO DMA-BUF selftest.
>  * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
>  * Fixed error unwind when dma_buf_fd() fails.
>  * Document latest changes to p2pmem.
>  * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
>  * Moved DMA mapping logic to DMA-BUF.
>  * Removed types patch to avoid dependencies between subsystems.
>  * Moved vfio_pci_dma_buf_move() in err_undo block.
>  * Added nvgrace patch.

I have verified this v6 using Jason's iommufd dmabuf branch:
https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf/

by drafting a QEMU patch on top of Shameer's vSMMU v5 series:
https://github.com/nicolinc/qemu/commits/wip/iommufd_dmabuf/

with that, I see GPU BAR memory be correctly fetched in the QEMU:
vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 0", offset: 0x0, size: 0x1000000
vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 2", offset: 0x0, size: 0x44f00000
vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 4", offset: 0x0, size: 0x17a0000000

Tested-by: Nicolin Chen <nicolinc@nvidia.com>
