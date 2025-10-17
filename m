Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D46BEA630
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77C510EC71;
	Fri, 17 Oct 2025 16:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sEhuEtYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013029.outbound.protection.outlook.com
 [40.107.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EFB10EC71
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3jFsuGPVx0bitpaVgd9TTjdTV8XKZ+9Ww3d7fiJK9TnOmtsHhk4HbX9aB6E3H/qpBTCnGb1CIrNpgbo46p8Ytz4AwH8xEOAd3dy4Vx2NoMDWKBib3iomOEnKj++g07/b9J+LdK/pt6yMgpufXuEPT14P81KPR9sMV02UaakL9T1i9Z7y6tNGl5BB3VitTVl3AbwWdKCdqJx+NGzcdiDY6s0X6GGxi+TJLsrWqEhwe5idh8MeWJWB1V3MHqgKh+35GIm62A9IpqvQFQMQA1exJ1fsl3w7JuYMSS+S7JpROER7fn89L94bmcPvy2qjhUp0o9rkVeZBmHATP/kwtEnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y82xXlZCCoWv3AoNxPuBst7fTgDKzhDGPAn+Kop7zYo=;
 b=axukzX1XduhM2fAflbh4qt9SSQoQ2umhUlxZBP89bOmboD6VM/wVvOG+KoazJmGS/0wZDrkFtvspxCPdKmnaelIcKAq69T7Aw8A2CJIK0xrpfqLZc0RubuIvaZEeZdhSAjF8ZkBqojaH9a0Y1HimU14fMApAGmXbrruWZ6HavTSCXa9+AWitoPwv1Cx4BsbOivcDFLqUIvAZ8+Fq1cRFFDn5Ekda+TB21+Uw+M+nspSTv+EqSHflvGx7Vz2/DqIDzqRoUSZbkvKBGGwuo8pYbvxkdcjiKJieyP5Bbe0Bk7co6CQ9MTQPCrxkS+kuUlNn5/23R8ueqHR2YYhR0hRHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y82xXlZCCoWv3AoNxPuBst7fTgDKzhDGPAn+Kop7zYo=;
 b=sEhuEtYyzNwULX5+Nc/c6rJPVRbjxiVIF9Q3713xNNVhu7hzqCmnM2njJPC9wKh1lLo/sB0q/PpI+g55uMSGzUdOzDUi4Z0eo6CqdnIKKbgs2DquI2zujWzcEy57He5FYsaJtW5waoXmjq+J1M6f/96n2gTbYKAjlzKNHGvIlrMHc3UW2OQ/GrFkHPt/Iqy5xHtPCpr1pNu0GRfOGzhtCfppV2QcxG40K75oIkGszeBawVLbJGUcXrasY1PQ63qPKMbfpc4cYvqcqHh87W49uPqH5/YscghEq1m1KREni8D1Gs266eLNq/EBjl//7Fboo9jrQ4DVfnAny3uy5DMWTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MW4PR12MB7237.namprd12.prod.outlook.com (2603:10b6:303:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 16:01:03 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 16:01:03 +0000
Date: Fri, 17 Oct 2025 13:01:01 -0300
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
Message-ID: <20251017160101.GO3901471@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251016235332.GA265079@nvidia.com> <20251017054007.GB6199@unreal>
 <20251017155850.GN3901471@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017155850.GN3901471@nvidia.com>
X-ClientProxiedBy: SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MW4PR12MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 4155e212-d03a-4d0f-841c-08de0d965f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lH1mN6ye+aIC3KjEo2L2o6rOhp96eiRtLcFlMlpCyUnfvCUeJa4qHEhYdcZf?=
 =?us-ascii?Q?y331eYoRRMw3g2HbwlNrGnskKwVC4RHKODe2yU8X1GeGhwmVv1HH5vr0IrEo?=
 =?us-ascii?Q?6BNO2QewT00Nf2UaZPwb/OaLBdc+xUAOmL3JZEgbYdSi1OTGxs7U+C4OStaB?=
 =?us-ascii?Q?GrUQEaQpxOKffZg7G9uiBoPQ3SUa6wjFdTQcJFd6oB64n7qIuQg9mO7Xl6Il?=
 =?us-ascii?Q?FOwkXkzPjZyQXUK445u2GK0ajbZMvKkS7pBBazk7WPftW7l8PUS6sgllOmzg?=
 =?us-ascii?Q?KUsX2oFjaPanRBR983xvL4U30YlycrIeRUeNB/wN0gpCXZnXPxkk7aoQkZO0?=
 =?us-ascii?Q?ajTxGmlhMJ/5l/ThJlZ+BOxT6u64ddze56TRAFexgDZINPXPkEBKve2PS1BB?=
 =?us-ascii?Q?CM0+dLqxKaEyUDQXmecHM757sTSI1iis4USqYs5owqWnjO87j0Q3VXdYEQch?=
 =?us-ascii?Q?HwhPphELrhLCWxU0pIPp2AbTuVLJQUS71cEpVjFA0DzT46urv66ToD5ogi68?=
 =?us-ascii?Q?+IdqPRITVrhX+2UCATkiP1GX4eaJ1qyvSRXe6lmVUEx053ihW0mmwQsUJxrQ?=
 =?us-ascii?Q?19LHWhWZb4PXktIU3ZBuRbIxlPZ4+JINnCfYULDybw0fNQb4HQV6OmLUGsm9?=
 =?us-ascii?Q?yRPDAERTbR7oLQAAY040tdfMK9HrrCkvBSS9ERZVqZfhAoPyHL8o+SDYM4s2?=
 =?us-ascii?Q?KpLOivo8xeupZzRKYlT4qTWNNPtOqi18R631O5SLwtTbbE09GqNXO68CvVp+?=
 =?us-ascii?Q?SoXPhF1fs7/0fFuqMlo7dFd6zZ7s34pZEeFaQa7n1XgY7FkytSctBsXmp31K?=
 =?us-ascii?Q?yKcA2kns02b4EKRsHpEV8EAo2MsxjKL1a5Xi9GmzONn/6W7ldHl8rcSDYBlr?=
 =?us-ascii?Q?AbMj0twZQkE2Uu90FQeRuPgKRAZQIcSimOlb1WGA3eX958NyPKPYSn7lyWl/?=
 =?us-ascii?Q?yov0owrMWbgjSwuSBGEmCBR0OU7EHGNDjQftL/VRes7rzU80vkpPnko+9l6C?=
 =?us-ascii?Q?JqvCFOrGOYpo6bty3Xt9IgYRm/NgjR20Xrs+aqgH845irXaJW1AKdaZOPVUn?=
 =?us-ascii?Q?/0H5NjysFNpSjwuw/kUk6B7P2RaKTTlqXYu2Fa3kDzCulvu0jtX+FZB47eXz?=
 =?us-ascii?Q?I4P9JuIMUCHuIV4Z9cr+4S4Wo0qiORzgZHeoiqlp9ulumQwGBN/ifeEHUZrQ?=
 =?us-ascii?Q?1KWSSWl8YQmeHMRVPMw09IrWql+3BiG5OyWdmhsOkabpxremEg2KH+2c5CA9?=
 =?us-ascii?Q?2M/gsYYmncZqGC0qlS+69aNScatx7JHmnf2DHT1hgNlFUFND8qOABGQNzO2Y?=
 =?us-ascii?Q?B4v88iqQD8nju7I0ja3BzXFLdfcanei6MdOieycYrePZkMO71AMW4p0TPsI6?=
 =?us-ascii?Q?3Cj6p9sVAqpOzfUOORriKPTi1FnDH7UsswLMOdi0RHF2Rex2oVqrBs5HIggH?=
 =?us-ascii?Q?dNhU+sBnVlSg3k9XR87rqZmqVAUZoXej?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kBu9N7hZGGARp37UosIoW//cgPBrRqdAZA+mqc+l5/94XwDqWRqpo4/POhX6?=
 =?us-ascii?Q?ZZ9824nQntoxhlAmeYlWBWMiN49uw+YpAtwVqziJ4XgDaRpl363/7vytMIn+?=
 =?us-ascii?Q?7tXVk53dPXpXYfS56vPTMf2iKSCY2qeQH6AXkn3W2zcXofZd4nyuS2YXO9if?=
 =?us-ascii?Q?mtOVScR33LaWhwIRdXwuULx+HR+WD6HnqGpilDVUYna9ZYYiALGrr61gLeKt?=
 =?us-ascii?Q?PK62+xyEKaiWAGP6iTiWSpZZT1PCdbbHkP7LRwPEGJWq8soytl8kMR7oQ2Bz?=
 =?us-ascii?Q?NVz/gA/kP52BCDE4ieAMLpbA4U7+PlYO2YVZtipqvR0+NxrotWzxTY2Fr2DF?=
 =?us-ascii?Q?ze9kjcIcsXrEAqtNOw4bDfnk/PXVCFQFuH1B/6feR1NvrfzgkK0wJNjhuLUR?=
 =?us-ascii?Q?GnKsrJfT8b2mx+AgxLqDTfbOIVYS2SVug+HWH1O4oM7FSFkDIf7SSEYc7NSI?=
 =?us-ascii?Q?MicdlyB2kLQzoK13fTKSztcPmVAbPAj2Xogsggb0FGRMdX5DC3YheBL3yUSp?=
 =?us-ascii?Q?iuERtwhWKPTDXRvFTOOw6o+/FhQkBLLfQcKUdz4I5tm18GbZpbtdueS5bGZc?=
 =?us-ascii?Q?XyxLcPsI8Y4Oh8bJp5d+bqkqLWV7kD5UZ6SnxJJYF28AKOPd0BnC4zEoBo5u?=
 =?us-ascii?Q?u3igsTttS14LBJYdzi1OI2i6WUpfcgPQucQei1vozXYjcjMdTJcprTswYUeD?=
 =?us-ascii?Q?51LdXJqurdOVvWn6gix8i3w49t/ZE00viBs/p5uq4Yp+n8IGkq5BKMNsJAie?=
 =?us-ascii?Q?1UQx2BiETHkUncI22lYKhx3SxRIJBq8rLZhF/4nhM1qp1Vt0eDmnFkjxp+hJ?=
 =?us-ascii?Q?cQR7A2DhYfzVDiHzHiwM4AKfU2XLYIZh1J94D2K4c58KUsGqO7rNpCtlh6wR?=
 =?us-ascii?Q?T90e66/hWenRUf6FZWg8YMW3E+U9i11vI43P8EoQ8D1DtZOat3y84s8ezf1o?=
 =?us-ascii?Q?vi6eV7LSUTvimz9eCJ5yAN8FviJOnl4pdRA5MsZ9KfZPat9w3r3nD6D/NUWe?=
 =?us-ascii?Q?B49wmSRynmwxOxfVgR9QlYFDL5hSq/B4BkAK2VAkzc9qrq5L4fDsZeoiQGG1?=
 =?us-ascii?Q?4rW+AwmlD+UJEQdfJTavha48z1pS/mORBALUcEZuw2/JDD9ZcjCUy+2shyQM?=
 =?us-ascii?Q?K/wGTPgAr4bZeRJHg0RRAbfLCnT36BfYLl857WOCJ87ukgftkSslk4AzYLzz?=
 =?us-ascii?Q?nYINUwtGLXnsHauByAvtxJnGa2h2mfwHEvo73seue55UseO6rprfGwGiyRwt?=
 =?us-ascii?Q?glEO6GII+SaUZL+vMy9T5S8v46Mn4zy40upCQwxQrC9NMEs7Ri6sXB7scg9l?=
 =?us-ascii?Q?qp4Q4hCA1d5Bv4auG2H74kXDOZwZMeNS0okh+CvLPABJVzoQjIFJkjbbf2TE?=
 =?us-ascii?Q?V8CaAz3OJMEPSkdU22Cb4qbldxDBi/q9KUrxxy+XODloTiQ4MkC2fCdl4TMD?=
 =?us-ascii?Q?aQoxrhWNpgHI+TUb97/YP4pCvY7EaUp7yefBEZkIU43grZHC3qJOz7rrnkY7?=
 =?us-ascii?Q?xwSSVAxTxLTqD2NaqfbGkSdatDfwhwaLrHYiU7cRBFh3YYeWUMYUFObbL5qh?=
 =?us-ascii?Q?cb4+9B0IaDFLxqXN+BGNIUFIQBsY4yzhUuVPM8AQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4155e212-d03a-4d0f-841c-08de0d965f8a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:01:03.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePKq45QTNlb4TNCVnqQR7loqjURQiQSxnhbuExu1lF6dfCbBR5wDwPyM6le85jcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7237
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

On Fri, Oct 17, 2025 at 12:58:50PM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 17, 2025 at 08:40:07AM +0300, Leon Romanovsky wrote:
> > > > +static void vfio_pci_dma_buf_detach(struct dma_buf *dmabuf,
> > > > +				    struct dma_buf_attachment *attachment)
> > > > +{
> > > > +	kfree(attachment->priv);
> > > > +}
> > > 
> > > If the caller fails to call map then it leaks the iova.
> > 
> > I'm relying on dmabuf code and documentation:
> > 
> >    926 /**
> >    927  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
> > ...   
> >    932  *
> >    933  * Returns struct dma_buf_attachment pointer for this attachment. Attachments
> >    934  * must be cleaned up by calling dma_buf_detach().
> > 
> > Successful call to vfio_pci_dma_buf_attach() MUST be accompanied by call
> > to vfio_pci_dma_buf_detach(), so as far as dmabuf implementation follows
> > it, there is no leak.
> 
> It leaks the ivoa because there is no dma_iova_destroy() unless you
> call unmap. detach is not unmap and unmap is not mandatory to call.

Though putting iova free in detach is problematic for the hot-unplug
case. In that instance we need to ensure the iova is cleaned up prior
to returning from vfio's remove(). detached is called on the importers
timeline but unmap is required to be called in move_notify..

So I guess some kind of flag to trigger the unmap after cleanup to
free the iova?

Jason
