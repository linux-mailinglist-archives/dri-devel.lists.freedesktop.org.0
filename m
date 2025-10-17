Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A25BEA5AF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1284210EC6D;
	Fri, 17 Oct 2025 15:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kmrWCLoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013064.outbound.protection.outlook.com
 [40.107.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520D10EC6D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:58:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBYzlbQ546ZipTizlOoOrMG3OKDmdze/FSUbA3by15gGcakBUMUQ1iaOfQm2EscqntC+H3V73jdpzHrmx4aX261zHvh7I2DnKU7Zw1Nx9ARCNMAgMyI+OtDbCwXCT9xn8Iaivd27rtQeU02Vsvzn/wf1ovJkS6bXJZTeHzrgVei4xQqbGQ/ZEqhuJDU5RBaGDQ0b0zY4XFCF7/paGWnFrSZnQ2NmeGZ9KGOekITiwlZbXQDdll13H2oJ3UtcwAEUFCa6KUPBX+10ER0qcLZYM3j2XrayBEeilBtWRi0SNre9UgQxZfUCdr/TSAPsVWVhJ/lRTvWK7anrpXIFot4d7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svbta5eVMWIObilOS5JN3V1YvAw2piDCY7UFa9bmaGY=;
 b=UlGz4YlrILMnUIpjsL+7AUrUjG6ueowH/5MQWMsda5d4pB3ETvf8T/sZo7xbA6rJQyf1n2SlWM7kKBXWviwiR88gImadzcemedlxx7gzsFffOHxwsnzF8KgjPIKG6i1/tG4Ms0YTG1gOawUhnLMF/WNsOR3S5dLlEzxd2hEKkg2OKBOlag5Jnd1vYa26D/LdJ3sx/1ZmS6qmiwQGCLnx6kc41aY5xjZKFP14D/jz7w53cgvdhIYNiseRsZTpL5bRFko6GUvORRAsNr83n0GGQoHKc/i0WgyRxjqdVL2rRVbGgPX830mbBVoeI419hHrl1wHVu977CukbjRYpwX1YGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svbta5eVMWIObilOS5JN3V1YvAw2piDCY7UFa9bmaGY=;
 b=kmrWCLoPiKOdwiqUna81rJQFbMAz3hefBhgcggsIdpvHpxlXYr7yHdwLx8Qu7RRNhWbtaCWO5SO6kHC3iJLPai8/sQAPCVWcbnplXBPMcL3UbPbtBFI6d50Ybxq/m1BPVqs0J78rNW2HTWPr5DNPgFZqADf9GYdBSc9YZ1jfdEFzTPLVm9tkbWG9pdaDA52Qgu33TBSD7isLZcGCnOsCuPd3ACJvu4RfvWScmXFIAsH+P9cDHXsifQc3ibU5osqETyIS9VI0Bp/VSwIET2bf6GsMEfYCvUVg8beDhx+lQ60wUzkX/TMEhTaYyxSuNewxkK+5M2Q/4mOv6l79gbSB/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS0PR12MB8478.namprd12.prod.outlook.com (2603:10b6:8:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 15:58:55 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 15:58:55 +0000
Date: Fri, 17 Oct 2025 12:58:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251017155850.GN3901471@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251016235332.GA265079@nvidia.com> <20251017054007.GB6199@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017054007.GB6199@unreal>
X-ClientProxiedBy: SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::12) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS0PR12MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 95429cab-9427-4719-ea47-08de0d961137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5uzwri17gsLA3O5eKSwNMpNV1VMs1Uk5wdilJwk/+UTioWW0eUNPfCC8O9Jf?=
 =?us-ascii?Q?BrgnIk2slkS9MNq+OTAjaLi7VDqHJ4zaHKwi7LQ4JZGpOprKiAeojCXd+3Dj?=
 =?us-ascii?Q?ngED92b0+ZAq/05ninrQsBayRGUfim+lAL+z0NPXv9NvZOxFN6f+TQAgk4Wj?=
 =?us-ascii?Q?alo9+yWQmKAS8BL7951vUx1gICaEmrLOxpIeL/usK15747TT9u9kFnWBbDXY?=
 =?us-ascii?Q?nZgL0/mbIU4Rc2ReP0+YaOImGzpGkCX/i2W6YBkjJ1sYvg2EtVPal+vwHaOp?=
 =?us-ascii?Q?/kQP7WtU4+iMM9hXoXwgFUIf9DDpCqgZzdCE4feLgfvTDDfLJoRqvFnIWh7x?=
 =?us-ascii?Q?LgrjlaPgN7y9JJtPuli6mXdc8dcUtUiCpyXBzRhyltQH6jqchS66K80/ihcU?=
 =?us-ascii?Q?srIUYhiBMzFv9eTliVHGbR3eHbE2Y4+RD+uBL80ghae9gqOOhYGnQOzUoTg7?=
 =?us-ascii?Q?mhIH7qDVhUgJHFH0C+hhorkPiIOFWraPHNAGTsp4OLw45lWBb92YaQ/YyKjg?=
 =?us-ascii?Q?CbFJLfTwQWUVwKvpvhaXSdkEnV7lpxRdMVOhYRUjYQl1DsUWUsuc13eJUDxa?=
 =?us-ascii?Q?fJ+ldzg4rLrTA82QdtkDakpvGjz9Tkig2fCDvHYqRIUIeGceAZ3LMv+Cty4A?=
 =?us-ascii?Q?/cvnPc9Az2vUtbSgVxnbnXGvAAiN8Er/5Qi0JaylI+hwYG+HuXnW61EToOfL?=
 =?us-ascii?Q?sjCTVcK7uTgmTUYjn6036RkrVxY7rCJF7Ds7DqzpdFaZMOhf/Ydnq0eJO4+4?=
 =?us-ascii?Q?IvBRVkXjYOmnhRF6Kzo9nU/QfGt/vigu55OH3L9y/lIPPxf4oKfXLkOErOTx?=
 =?us-ascii?Q?2nWOxovh+T/cLAt06s6KagQCgqF/rwm+O+q33sDkyB7V8w9YgHk2DhuN9hy6?=
 =?us-ascii?Q?U7cqNNFsfUxYmhU/QaLzgub5XzWd3oPcyVFEs08CBqF5jN1Kddz012oIyPn9?=
 =?us-ascii?Q?lNRjmDCj45J2quQJZzC7b0btuU6HbtQ/r2t2aHJ7lCUocCvaXfDrwEI9VCcH?=
 =?us-ascii?Q?qEvhACx3kwinP1dpWCt69kvvhc0fmOc+zFrUyxrsSL5iabDZCNbj+MKdywpV?=
 =?us-ascii?Q?qS0gSTSvm2E/k7xSaUdIQbBaPWp1f0RboXz8KPvV21TOH4dLtfQ1EAg1CEXt?=
 =?us-ascii?Q?JKX7trpFQyi7tT34N4v8PgYMAwVhSREIZHke59O89W0SQqj5l6YybnCGe7Jn?=
 =?us-ascii?Q?Ql0wA5JG67KB4rKwb8QH5ZDH3RDAW7jMoebHzUBZB7FK4dsDb9F+uHceEPiF?=
 =?us-ascii?Q?2NBK7ylZEn6sWdwyShZZ40/Ss/4frKlrUBUtnrwily0YOY5Ht+tgT3C02d85?=
 =?us-ascii?Q?bVCqgthpkgykhaFET//fDyqQ2BMJwqh0y8wyKMktHpsJZXkDArw+lhJY4SyT?=
 =?us-ascii?Q?NCvNTY51pFPgFUVFGrnp39L9VLMqyB3v1mDk3jW9/ABrtsi+E8gbF9ln4h34?=
 =?us-ascii?Q?z+3OYC23dC2weGhBU9apfxV8ynbvixmX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hMc5nzAL5ZRUewQuAJXXkCfR/854+cCiiW/oed3fx3JAhz+d3QqQ/G3RYUU6?=
 =?us-ascii?Q?ekbDzteOMa2nvfa1B6rgvKQWzNxH1eJOyQIPThCHzlkt62UIFjePZSmb7O9S?=
 =?us-ascii?Q?ql7bs3pfMH2c6TkUQrmg9XMfuUDBohOr+sDRLKY0lCv3o2tBTxmYpalODQTa?=
 =?us-ascii?Q?piZrwkchHcDDPNNZDNPDw0/ZsoQyH5LIVYVYvo6pfcpWOiRjoEbF18F7cDp2?=
 =?us-ascii?Q?kiUeVxX+E+GmwiRuTnaICB4bv31Lw0P6lc+lDq414vy6nHCBxXAyTWKdWjhr?=
 =?us-ascii?Q?kkttPhGwSIHnl2pPSkNyVqgRZaoaZW0v+Yy56Wnp3aPn9wkE0V2F3vdNHTCk?=
 =?us-ascii?Q?jYRPNYCLHNMCnKzph5TPhIltEOVo9234FiduvgpL6qUCPAEBPyYP3BS+tRqg?=
 =?us-ascii?Q?SHFq5QkxexiFmYfPTkBamAKwIg+5tu+iCzHBNpiiqspxIkM6rmTtQvVxGBct?=
 =?us-ascii?Q?/Rs6j+ta6LvaBBTT8accza36XzfgELEDB/y8QzvLj0K4SRBXZmaDZQxje2Vn?=
 =?us-ascii?Q?PSP7Mp/Ri5bisZgWcMz1dRvaxzBIxioaU2dLA10bMVSriOFCt/fDS2soIqAJ?=
 =?us-ascii?Q?kJZBcy0XkeJ9whmdS3hEPFj3L6yZY6f5EQXivlx3jGzJkN0VRfIJuFe8P3p1?=
 =?us-ascii?Q?GQ8VHhEi/mzpNvX3E4GryfVJZ2RW/ubZyclrpaZ/iY9Wa/G9rxZqemXNhUZ5?=
 =?us-ascii?Q?D8OgHdpBMMwbnvQIeOWWaThLcJuGbdRHuEVTtBnn2pTDqsJ7ZkkUUcb7exwh?=
 =?us-ascii?Q?2uOOhNiW6F7de9cyTs3NpvkSuPCZVyREv2gvF/VPLnGEjHZ8U2+IPCRO0X6q?=
 =?us-ascii?Q?p+CGMketzpcB/NZVQDQkl4zdp7vfY14WsMWxPC/XaNzmcJ70jo7c6dlYR+ZY?=
 =?us-ascii?Q?+qZIdxg2QR0D/L0SQjcLUauJ36XbvcpWuwEPkr4aTtE5N96tCJa/lDZzKANf?=
 =?us-ascii?Q?gE8a7J/AfxHaRiz9LJu3A2pB9ZR4bAFmrFz1lqmj6E7dYKYVMzq5VX/D/aHp?=
 =?us-ascii?Q?k7xoxwS7Zmr7xle0BH3BRAIvmXB0or0wrgu+GcB2VQqZSYbJGgceBSLJpFds?=
 =?us-ascii?Q?mmLgjIwz37k9RC1AzXYERDqZqzPZLHl3EsX6OMeBD1zAwugLBBM+rP+w/Dl9?=
 =?us-ascii?Q?sRucjJ4QXq25hiep9XNro9B/ss2Cg3FjKNt/sfuOUmjM6UidLzypL7Ylu9M5?=
 =?us-ascii?Q?g42mzleZ9pb5SoQ4RKmVgj8hUsg6F8iltyhqSYkVmSlgqssqSdoxnLpuFK9B?=
 =?us-ascii?Q?yc5sMzNn6UPObG5RJOnQENl9M4Gue8B3Ghuvv69kU33IrU/HG0BLYhvVELDR?=
 =?us-ascii?Q?oWvd47PURJRuqZP8/2W8JS2i2HqEf5f8WBfESzG7Y4600iq2NxBZvGs3ntpp?=
 =?us-ascii?Q?xP9cHcqP7zAPfoByyhPW5uOH+u3PHXdd8YdOvMmLCYLcrY22f2GIFHm5xfEb?=
 =?us-ascii?Q?pfW5+IXCmDv76ccyVtyoI/fl73I9T3BgC7pDYku1tBeZnluxwCu3bGxx5Ste?=
 =?us-ascii?Q?QgIh/mGCoxXNIjKlU+G5666nU4DKr8SPzfTpV3XtJ12KJt+bbY1FHEt83PP8?=
 =?us-ascii?Q?XrfR/jqwNyHD4a9cTJed9pDE2RqCyEIwBRMRP9Lc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95429cab-9427-4719-ea47-08de0d961137
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:58:55.0005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbBsp+gJoBkuBLOXbCQIqBQyKywQQl5zZb+XvfmjLzQi9TIB5YGs6Vx49YaqYyQP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8478
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

On Fri, Oct 17, 2025 at 08:40:07AM +0300, Leon Romanovsky wrote:
> > > +static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
> > > +				    struct dma_buf_attachment *attachment)
> > > +{
> > > +	kfree(attachment->priv);
> > > +}
> > 
> > If the caller fails to call map then it leaks the iova.
> 
> I'm relying on dmabuf code and documentation:
> 
>    926 /**
>    927  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
> ...   
>    932  *
>    933  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>    934  * must be cleaned up by calling dma_buf_detach().
> 
> Successful call to vfio_pci_dma_buf_attach() MUST be accompanied by call
> to vfio_pci_dma_buf_detach(), so as far as dmabuf implementation follows
> it, there is no leak.

It leaks the ivoa because there is no dma_iova_destroy() unless you
call unmap. detach is not unmap and unmap is not mandatory to call.

Jason
