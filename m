Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B7BE8898
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 14:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8ED10EBCD;
	Fri, 17 Oct 2025 12:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pzfc7b8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F47910EBCD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 12:16:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoC/PCBaeH+z5uEGiA0IapLq+0wx+FzEgbfEZ12FmfEq0uAQZjbv7HjZNMf3pToLOcGx3O6jgli300EBh0gX+llHNTWVaYzKtelickW+KNRO63vbR+ZtPqdxjNs9woVsddTITtcSa4qcSdcSrYGKxeGJ4H/P/36LrF66Qh4/PfPTHPfwSLfYp6RebW9QhixSF5LyUe5AGidGgG1lypgy7bUJVohp2zG83n+73kIjDL+AfLVAnNWOc7E0rw9wyHJPY3Ik2LjDc3msTaoVuZpgS7WDMuIWMOHiAfDsIvGM634sasHYp4+5zSRjMb3hT6twx+azhm/Ws97FGtZwodjnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCXWwpfZQF2zjZPGpnDxYq/+0sz0HuH7oVgF14+Bcws=;
 b=K+Qj6xNKAnJYIoGUGzZWdtnaChFegVZIqGxOQ7oJk9dtuzRLIYjVNk55/bN61JTWKSZZhmGtR00NMD/Xo3VJLymtN5rWNMwFJQtbPx0n+I0ibWV8kxZrvpcD/xs1NPg0+BXEEHzPJAy6vT3qnqbPgV0Cw57ZYGNx7e3PLEyy6zp467GNe3XwWNCjBL4CsvPPX3EwsijCtcRq8yIv5NXRfsIa/xkHjpu6s/8y3dR1Xu7e4PfgsUfT5cnU+DAvZvZXh3p3sjUCF8CwJNgxWC7cvof3uxIa0QzNA7wBLxDTeonylcYdk7szjeX28Vj77nDvK13aslnCSiMA6oPsw5QCLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCXWwpfZQF2zjZPGpnDxYq/+0sz0HuH7oVgF14+Bcws=;
 b=Pzfc7b8JJhduygzsqpRcall5wXQiPw7Hj3K3oPzyNLttHb4eYwf9S9yxJaBBy2hixd+LqwgY9PtfMZEVtZemtYwsDkYp+NqlTK/ckKvARKDcKVPfNtER8d/LsNnIE8VTVaKxgN7aS+J2tN5mQSPFELh6aYAzxNZ486m4FziBeS6qEPm4otgWiY/A4lJtulJfV1tJKFvr7vQnuamJPzyrfPlQCDurR5C/hgNrwi9scDJW+WKgUpO2f0LAyVYV7DYEHwvnPUONfzhty6L6lhxoWIfnE4U4rt3hwbalJQPhXf56OEjMjM5rA7cKykbL9nuTNgi5bZdOxNzU3W/lBkT3mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 12:16:14 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 12:16:14 +0000
Date: Fri, 17 Oct 2025 09:16:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
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
Message-ID: <20251017121610.GI3901471@nvidia.com>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <aPHjUP7pdIXuEPIq@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPHjUP7pdIXuEPIq@infradead.org>
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: deecd648-4a2b-4792-1ea5-08de0d76f677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mtGJtXRR8FJHDn/FZVkq5w0T6lBy+XhsCU+koBx28npdLhm5FvkPoGPQsplu?=
 =?us-ascii?Q?iyDwvrrg7e4WUQYpU7AINx+KBEmGUD9Uc+ITRLOJNHJkzr6sN3uHNldoZ7N4?=
 =?us-ascii?Q?wZ2nCcNsIWCLBOdf6940k34XnISCZ6CKOj6EfjRpUBsdlUksx3nZFu1LtRO7?=
 =?us-ascii?Q?c5MmfcW+69RxgomRTMAVhrXAkUOBacj3pXWvFBDxpHz4ohi4hy6iDMnHib/2?=
 =?us-ascii?Q?9+efYwEPAB5+mjch6A9ey5Cx3ubrXpyU/82bPGtUjPeiukTWxW1hZ60kXSFe?=
 =?us-ascii?Q?2WKoZesonHudtNmHAA9zdhoNwQ4se580kRckJCvSELZqMcrT/s8absU1zuIo?=
 =?us-ascii?Q?OYfaGTLVcUSM7i5XQZHJMg/TP/+8hgKYCuzlrq8jqbBAAfcSNkGk/GwcdoW7?=
 =?us-ascii?Q?O9f9jSnU9gpCewS7akn1eRf8yuNdZM8q67VvjNuIbyvrpk7HqsZ6PiXhRQum?=
 =?us-ascii?Q?Qml4pemyQira4HiTw3Pp2cDzH13Gj41yvG9V0CkrxKNf1GCGDu+p74c8NbsC?=
 =?us-ascii?Q?laZZ7NRe2wj9oudhZsm5WsPmseHFa2vQ34sfX42wp233VvxndmTpd4NDHX1l?=
 =?us-ascii?Q?+qi/z0UU0sZ/Rjp+peRILhPcW+oJuEVzSVHMHolFG1jj5tTF0f6rZW+U5bep?=
 =?us-ascii?Q?sKGUN+YTqbz1HWZzFjyCbiFYmGAw0/iglxwsjOn7ktzG+zrRGnTYcIbdCK99?=
 =?us-ascii?Q?JzwjZ1g+0cQvb8fJlHcwWxveT4rcENldS/FD93Za6UHhYPW6MMhfJklVh0+q?=
 =?us-ascii?Q?Wis+++NI2TaBG88YR1LBypMzTgW6VcIFao/E2Yx9qQ1kVSg70dtFsfRrc6az?=
 =?us-ascii?Q?wfToK5DKLcZI7C8M5RqynDP/q1YmSJ/NRr0+z7jiQPha8RDPnv3iArKZo3ok?=
 =?us-ascii?Q?eP2EH5Up9SeFBNAugqZ5cFPC0JT1vBsp3r5CBu7qop3DBLWIWhAGN3zcAyW/?=
 =?us-ascii?Q?0rj8JXocp2TpvZeXEd6vHCwCbOIMMPtoW9VMrfCSdT2l+OYSUlL1mE/8SkND?=
 =?us-ascii?Q?rri2dUYD9rdy8JFhFa+Sm72v/3imGqV87or4xRBcdy1/7JLg3dOsN1bD2MJ3?=
 =?us-ascii?Q?NIi9JGvkNyJCjLgS6rkVOz4DywF+SE2ruylzzM0yuc8rz6twUg6RlX1b1M2z?=
 =?us-ascii?Q?cdNf93XzAZTG+8tYgUdWmXA6/6y4WmXqQfREtOpL6GbCYsPiQoH8LepSNp23?=
 =?us-ascii?Q?aWkbVKSkbEIfzH7bMUm8YKnzr3fr3Y1LEMp3fFSGLjJh90irEOQacvq7J5PN?=
 =?us-ascii?Q?+uGygTpLrX11DIYKwS4gLTgq9bHblSe0WAKzI3ErsQ802WJ3lNHJ1L8Ap752?=
 =?us-ascii?Q?pZ0/0k0OyB2G2c/ZzSa5m+Qi1lp637GmuCo9JVx4/pltVoZX7Q+MnTFWYBJR?=
 =?us-ascii?Q?Afd9thgoTgIiS0tZ7uc5o8q9ESv/OjjhtbvQj+H8RStqyB9aJwRbjkP4VZIw?=
 =?us-ascii?Q?KUabM4cpmKYChPa16sV1PmNq+MYquxMb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ycwLfysewRWGSM3Hw23SiCkLA7ecFzFA4ba+xgG+pQLG3e0TcbYMI8/4EHi?=
 =?us-ascii?Q?XCvWQhoDW4fQN6OUn4X09QAMNSD/IwKQeSpKAvmrsch2ESwjR1kK3BQ8i/z8?=
 =?us-ascii?Q?ck7/nRl1/HccRKR9BZhGOJSsUpys2IfdBJUoGpkelqgUAyVgd5iTsaL1J4SL?=
 =?us-ascii?Q?anbgEvyVihpS/eozE2RIAwF6yY1JybQ0aSMnHuF3hySTVPflSZVuAxZ191Hj?=
 =?us-ascii?Q?Ejqbk7YA4syRPpeAUuuo5E7sy70W2VIpMiIuQKBMwsM91SSpXzgHBEgni8Eb?=
 =?us-ascii?Q?JtlDN6Dtb++Pe8rFtvoqeJ2dXIFi+v6AEXpDhg6U3sGS0ot7V9E+EJuxbAAa?=
 =?us-ascii?Q?JOaQobPuzQBg93XLT6QqWt5dCIPoe1fDX4cynOGnDYAfwzVa3/uL2tZacua/?=
 =?us-ascii?Q?QE2M1qPEoNbm/9jvVd9iBCmiavayaf2P9OalSrEg8gUYBrPf9RhYLa42DmaV?=
 =?us-ascii?Q?/54hGGlQWa7mKcDzyBZXJMlqGr72PK65B+OemrxiFQPoYxuoMwmxdwBRwBKa?=
 =?us-ascii?Q?geoVoJt7VPcsRGaEf5LT5by7dW6GSwJNkP4RL2E+koQM507OhWzyXFcmiJiK?=
 =?us-ascii?Q?eOfwVMu7knx+vBWs5zRgUiHZEbNhGk0v4NK6jlXCN2KGLwjqD9QSYM3NqRd2?=
 =?us-ascii?Q?5Rzpoo/if4S5dlHGpamNZKh0uSfHAqZNwHu2cxYh2a8zXn2k2cRiEtfS3vUx?=
 =?us-ascii?Q?kBO0YZMCdXbQm8myTBsM8qBf53WUeotew9moF3jwkWgAUioa8UdybnGhjKix?=
 =?us-ascii?Q?67RljetHhiU200fKNliE5+JpOpXY0Ov0sJIPU/z/2JLqgu8SOOJ6HpmqXeHK?=
 =?us-ascii?Q?YVgANhj4g2xMqOb7Bhlu4ekStjROox2lgk95R0dGruZPVOis3JoUGW+Zz/8E?=
 =?us-ascii?Q?JxiyepL4k5Gtuf1a7HzIgt5E61k/Rx8YLhoVTFUlvHfvlXZpuLCi2BtC+g8D?=
 =?us-ascii?Q?Thc3EKUq6Cuvo++Bot5NKk0DKXrJLYhvrgAIjiw6tPj6auUf+zxdOikzEFv2?=
 =?us-ascii?Q?v23zCUgvBASzzTnyhTJuwGVPs+PtlYvUp+S8onnF18WRiFNZRh+bI2DTx7SF?=
 =?us-ascii?Q?LpZpC/m3KvLuCSeLPmm3K6tEytnYu7cXsyHUDQRWiCiV2kAFjD8gHPemPFhG?=
 =?us-ascii?Q?FrikO7QU7fEH4TLjZhAKPzlP8NE2S2usifewj/ZB/GUbC6f1t9RKb7nBZ4hN?=
 =?us-ascii?Q?GZueADyrX+Oou1P/coJ+F2rNNqz47ZL35ntUqmvZWJlMH1xD/X7Li1GEX2Jf?=
 =?us-ascii?Q?2fbThTnizl4Vs6YQXMtbEuO8TTQJB2WeWBlWLdniYDQM9WMXAzW8eo4DOZRq?=
 =?us-ascii?Q?NcxcAis9PQMdKf+ItqebkUsCE1Ri7htl79p7RlwUxcDttqLX4xTPb2KgOX7V?=
 =?us-ascii?Q?gcRG0tOaiUVKm5lN7zTI2yaF6U/D8nW0mPhbGaf1cpl79GOM5tr8GBgsSaCW?=
 =?us-ascii?Q?nxsw8BcN/NP9vlFKVUgiEauMn9z+8Y+nTW9eYcsGvTNvdf9SUO6p1kB1rLCh?=
 =?us-ascii?Q?3NYIXalImxJJ6oNUy8TmejWSl4gcoGmmasKivmDfbklYYCF26VKdEbB0anQO?=
 =?us-ascii?Q?ODEr5Iq4JGYl5HCbuUzUf8Tn1Lx2zpgC93dhIjyr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deecd648-4a2b-4792-1ea5-08de0d76f677
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:16:14.0525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTZlMYP67K2Lr5as/EYle3rK72cMc6RgQWSs+OGUgswKMREr2AnxPdbkoXyTNUKr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414
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

On Thu, Oct 16, 2025 at 11:33:52PM -0700, Christoph Hellwig wrote:
> On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Add support for exporting PCI device MMIO regions through dma-buf,
> > enabling safe sharing of non-struct page memory with controlled
> > lifetime management. This allows RDMA and other subsystems to import
> > dma-buf FDs and build them into memory regions for PCI P2P operations.
> > 
> > The implementation provides a revocable attachment mechanism using
> > dma-buf move operations. MMIO regions are normally pinned as BARs
> > don't change physical addresses, but access is revoked when the VFIO
> > device is closed or a PCI reset is issued. This ensures kernel
> > self-defense against potentially hostile userspace.
> 
> This still completely fails to explain why you think that it actually
> is safe without the proper pgmap handling.

Leon, this keeps coming up, please clean up and copy the text from my
prior email into the commit message & cover letter explaining in
detail how lifetime magement works by using revocation/invalidation
driven by dmabuf move_notify callbacks.

Jason
