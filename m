Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DEAC8B6F6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245110E2BF;
	Wed, 26 Nov 2025 18:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lAxSCL94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010054.outbound.protection.outlook.com
 [40.93.198.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5BF10E2BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 18:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vafsVq/b9FBqsWIG0D1L374AQBCC+BM0CJGEDQZtqBaK5KUf8E/x938jxeGTrks1NbyS1xL3vvgPAwwELWIUsu7qRNbAHaG4fqHrN/JBnxvpAKhodbcBaY46/zMwlDrbq/hqA5cFNl93RRQ9G3RELsDO31slu+Q1ejFXB6xb+XmNAN/JiT4Inrz/8FNq37Zm2ZtpQ1LVLIqg8AORKj2MC81IqibSEzhz0jgrrb/ZY6UTs/LCVcXVklwJwioi/738fjrPRkZkJLccnB+iFLZ31B8oQqDLsEwXIqOxeR2d7w5ZVXliYq0mwUgWFSQN8vE/72vdpU993pZ/GxiEF9r3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3nFmt+B4fmAF/bIESSKuNQLmkVWEwaX0WGmVdk6hbA=;
 b=Hz+4ZrncekOIrjOWiWnOw0kOh6GZHBf58KAZm5vw2A8r7SGkWi6SZVk3JWyZ/sa2V+9oSQc8NXKf4kHqY+1O+r89qW5ViRUVOhJ0heMrpl5M6zgQqxTvWOWY1N9FbeVZmX+/MiuuVYN4y89sVGwv+1RtyU17EhgNg3DvmXOrWs8cTRskaQKoz3vE6mLu99R4YRrACiWVAogpMv+aXwOMFVZeSUO6aL/kRxjtjhQyY/9QLvDPfcI7pOQrZ4aNeEXoNfgFQiNnH9FtH89aWOoS5U8/0c32M6RibvpGrdcKXNedDQK1t8zNQILtVxwurrFTfxksIsxPxXeyDLhIfxRqeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3nFmt+B4fmAF/bIESSKuNQLmkVWEwaX0WGmVdk6hbA=;
 b=lAxSCL949AIBf+g941572mTMKv36/TRA9rXLi6ryhhQuOBJaZ0qRLiMRyRQ/XF1yCoQUWO1rPTuJhav6ybzhH7fOd33L+FCv5xu8kPin0/TXO+SkVhdlHsdNzpFePiE1y6zQIpJFmsqrZNw4E966YyTXrEz98Cq7pyVi4rsjEVfGFvhc/m4kffuSjmFv0wsewhiKoqhpAgyUc46u+SzTkix//SR9WraHfIteKsj8RaQTpyBAQ/+rSsy7Conbt0fR6CieGYMqqEBdSsJE8+ju9UFmHsjjtHOJG+txjeQNChIFH+iP10vKHajmqQXdKw+QhNBW0N6T52ZJWmD22QMkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by DS2PR12MB9709.namprd12.prod.outlook.com (2603:10b6:8:276::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 18:27:21 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9343.009; Wed, 26 Nov 2025
 18:27:20 +0000
Date: Wed, 26 Nov 2025 14:27:18 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex@shazbot.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Will Deacon <will@kernel.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH v2 0/9] Initial DMABUF support for iommufd
Message-ID: <20251126182718.GA731075@nvidia.com>
References: <0-v2-b2c110338e3f+5c2-iommufd_dmabuf_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-b2c110338e3f+5c2-iommufd_dmabuf_jgg@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:208:329::18) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|DS2PR12MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8650e3dd-f0b8-4a7e-4583-08de2d196f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dBWQgun4WHVsEl60STw4gaglY6P9tfPCxvwa1gXnZW70Z0BNO7WHWllIvqEL?=
 =?us-ascii?Q?RyfYMRQDoyMH6W24ABFpKyHiZ3aQ5ayx88pVHVXuvlQwT6J0eWBNgyG3xbOS?=
 =?us-ascii?Q?TsiY53VTA+5uNjse31rkeBnP9h595KJhglUep8qym9EavvVSj/hoNr3leofV?=
 =?us-ascii?Q?VNxiHcL2eOi2zrAZuRZi8txNFiTSweRxgarId+u9Q8ofVcx0jwQBUJuJF4EK?=
 =?us-ascii?Q?s0iWNRSbi6spJo0MNjjTGI2QV4zEaMm6ksSxOOOOV5bENCdzXPyPK13pvu6b?=
 =?us-ascii?Q?6r8iHPpTxZQbtTPWEI145+blgCPNaNwLmJVK+4ZFYg+EJjg7lJE5Fbwz55XN?=
 =?us-ascii?Q?VABgkJRNQgawZ5nBnxTUjF9ZwMxoA59C6DXg+hrdFLOoln8IXHZhmjiYkkd7?=
 =?us-ascii?Q?ERLvHxEy5MJE26A7HWWoH7P5pBK1nT59vCzNjgYrw9QJokOxWfmk2DmpPmdf?=
 =?us-ascii?Q?0k9G4HveBYlAFRetJpCPeLUnzZhlQhsUDtHoYPzUp3Ht0+d4VAr85fcXDd5P?=
 =?us-ascii?Q?Q/fgJtE0dHoJV+mJWT1BFWkFNXsJ+L1d1RhEhJZXs0i9hs6wbZMkIQqzJIhr?=
 =?us-ascii?Q?IHrlTAKeLEutqwGmvkQ1T0qES/TxmYxpHkEsCbOP/mDihWJM+dqYvIEHKjLy?=
 =?us-ascii?Q?kVucA6stER9ZhAqXW8wyPA2NBAcdnMwgc8DdZILKAO/IuGO0blnRLDdGWJv9?=
 =?us-ascii?Q?4wF49078SmVC/OA7NEknLeA9pQA8wfCIvP31BSAbfficvj2nLHMPy54HDg6M?=
 =?us-ascii?Q?t3xuT4iW5a58ICnQO6a21YH83hBp/9uPMp9jblONV5g8QHXrzUEJZQvMwJHq?=
 =?us-ascii?Q?Nmyd4cbDqKmVwJgTAKj7kbe0b7+unCrOfH2YGaFSKaFBmOKU/rq37NhAet7b?=
 =?us-ascii?Q?B5IDFcQB3pFkK6oBsuqHi4sbn/0NIi5jzPHWFaSkg+UPMc9P6seTDpkH+H0F?=
 =?us-ascii?Q?os0yfDGngujathZpNKe0I3Smxprag2uaZHxKm1fL8Pa/FuLF4pAGYKkf9jv2?=
 =?us-ascii?Q?4HEQGZ51lPhrQFB7gKLwsLipKnJFluUXgEz5T23suVa9UBKX1panmLmGdw8a?=
 =?us-ascii?Q?bpQAYdocVJCTET7qnGbXiH2gT/rurE6oA3rxErJS7LVLM21XiYt5QwDvH/b7?=
 =?us-ascii?Q?hTxhfEAMzv0UJmBEwgbJuiYw+6ZCXoPMw3Jp1/7ZWxZUeMx9brJinUpbk+5i?=
 =?us-ascii?Q?0eqWcukxYk2OVJRzrQ3Ca7xUg+th+bjbD43Wj6WaTaEpXenYvwYRZO3y14x7?=
 =?us-ascii?Q?JjObSQHFlHDjbkcRxFwm6/GBAj0hqsCIF9uRl8G9DkNFhJt2hZt5zTUf/217?=
 =?us-ascii?Q?YtH0B05CA9OUHyfocFDP8Q/dwHDihwoll34RF/3oemzphn2wfgPz/+w71ejD?=
 =?us-ascii?Q?z2lMOPoz2S81ItDiysvpT034ueK7c+Gl6Xek+CvhTrglcrKea1e2u0Qoxy7L?=
 =?us-ascii?Q?eGQrhpxheveG56gsxutoB8LqY6ccwsRuuO4Lru5HElFmHyOb4fQPQWRqIR7W?=
 =?us-ascii?Q?F7ql0YeAwyek5rU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QamkjK7fQEfNuIYoLHDUN5v9p2+xw/1+k/DEopo1JCz4wKFCZErE68w5QnAl?=
 =?us-ascii?Q?j/s6g6KofwhRNs+yrD7QYa8I5w19T5JV6CccGhu/Sos31/4BkDb3fOQdR9cE?=
 =?us-ascii?Q?eynnQsIEDzS0an82cQnw3E38vyAdNUhyKIRBo1AREkvTqjKbDT9RO6MeE7W8?=
 =?us-ascii?Q?wIPTL657aaNhfl97pClp5+e/VU0VJmB7J8OnBEAUBEhmr2Tfu6gfA/T56I5M?=
 =?us-ascii?Q?kdQrLWIq+ccv7vBl3nZnY3woM3xmTlC3dV4CxbLBiUp/EVKRUcaLuSi2foIR?=
 =?us-ascii?Q?XtQUOLpYF19q60KoPJS2o6GAeZKp95I+D/GbLCV9MkU0iXgYPjPU5PpMGhd2?=
 =?us-ascii?Q?VAAyMtt7Jo955QFI6zsqRx4vRVxEUXGf1EyeeEKEwLdJ8SpaDn08XPymrSoO?=
 =?us-ascii?Q?IOtHnep3uQIs7oFFtTeZ7XpdXc0VlLS02KFGqT8R48bW2nSQHy2VnjRPxk2O?=
 =?us-ascii?Q?XR3syrVybCS87ron9+rZQcV5wIWxmvQsmho5xJ039a7Q+O8sexercxaFjOYC?=
 =?us-ascii?Q?Yo7NqJzBFJioFljPC0EmP7DS/Kb5Ymjx4XCll4N4wP96uHLmG6K+zRZ+MX3e?=
 =?us-ascii?Q?v/UudLvhPfKJKuNTgyHjDBJL23cQDccwpjaiPajzkLjbe4MisxrHH9mbj7GO?=
 =?us-ascii?Q?k/lNLlYOgJbxfA+NVNUDsNT1BX2isi0gtSFGjYY5lRREH+QPecyTxUNFMuLe?=
 =?us-ascii?Q?vfpa1qASSmWIUxjOEYH+PIOmGBSBGAIhFxCqBieNQb33V9FnIYHxRLzWnvly?=
 =?us-ascii?Q?PtdE09gw2m1kFzBmkFlwzyhHq3qVvgtsTW2LXJjZdVGaVrkjDy9YupHLW2hg?=
 =?us-ascii?Q?IkywpA0oy0SPCwJBc2Al68b7OXCGRvIwuptM0LvS1kJeDuJMBWKISODdmyx2?=
 =?us-ascii?Q?yvk5BLLak6kdCjmK+yGzL698+8inMNKP0N4d0zCabaS+mYSVgWk3IJswuMhp?=
 =?us-ascii?Q?zj6WSTe/1umIry6TDz1H/5j61hB7e0OGVT41fl8Z9Kdse128LAe3cE5R8Vo2?=
 =?us-ascii?Q?suxM9Mdg5zOpyvoT2P95n8490TDS/9ul7tHClP8+QiOUrWsICjuEA2E4iMxo?=
 =?us-ascii?Q?5qE3i371QGqPqouZ595ITH9+DYSsfKokZzFDiVL9H1JV6079rRSeK2LPGa5f?=
 =?us-ascii?Q?F8plOCm/Ocd0aQK+2DnjPLRs/t7LXcfrbu+ONrNj/XLLENJH57bq3RnN4Jeq?=
 =?us-ascii?Q?+Bb+rDv7QH8xWsYoek/O8Gu2D+MS6V/Lfv5SPIfKadKqQI3MksXxl8w3IF13?=
 =?us-ascii?Q?eR9J5d18jMV6fWjkZkHDBS1x20FjUZ2LsNyy1JnJQjLwHFT+HmhL5cTWgVWN?=
 =?us-ascii?Q?NBvAxe6JBs19WUxjYkk+B+Tb1WtCoXA+SRB6Ktru8gUJCtkR0L/F60lsgkI0?=
 =?us-ascii?Q?Y765eCo3R959UfxrL6FHM26c3h1tJp2hxG+yJ2frMAtYRb2YEFzmJ/rWH96C?=
 =?us-ascii?Q?ucLDgn4PiXjdLD7SfmfsfclmPTW8CIW9MOq/8PBnMx8FiycKHmyE9v1c1g7Z?=
 =?us-ascii?Q?5EZxFbSD5IdJ2QIAddwGDySzv8Mm9S950SnEsTfQtUZ7U1IPMr01M9KGpqto?=
 =?us-ascii?Q?C1PVJoON51EyYwpIgBM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8650e3dd-f0b8-4a7e-4583-08de2d196f38
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:27:20.0021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jC7yt7QwYiGkHtceo/Ftj53klf8a8JVWyrZ7IlBnwURe0L8N8HQC9F6iouAwUdxk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9709
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

On Fri, Nov 21, 2025 at 11:50:57AM -0400, Jason Gunthorpe wrote:
> 
> Jason Gunthorpe (9):
>   vfio/pci: Add vfio_pci_dma_buf_iommufd_map()
>   iommufd: Add DMABUF to iopt_pages
>   iommufd: Do not map/unmap revoked DMABUFs
>   iommufd: Allow a DMABUF to be revoked
>   iommufd: Allow MMIO pages in a batch
>   iommufd: Have pfn_reader process DMABUF iopt_pages
>   iommufd: Have iopt_map_file_pages convert the fd to a file
>   iommufd: Accept a DMABUF through IOMMU_IOAS_MAP_FILE
>   iommufd/selftest: Add some tests for the dmabuf flow

I dropped this in linux-next, if there are no further comments it will
go this cycle

Thanks,
Jason
