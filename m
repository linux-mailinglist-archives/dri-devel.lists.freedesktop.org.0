Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD0A124CA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7310E159;
	Wed, 15 Jan 2025 13:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jlWMk9vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2EF10E159
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 13:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsn076l5c9GSyJsvQZfCiQ7lSv8WAFzWn6O9PfqEqyAgzjD4Q6NX7sWjyJF7gfwRLuXEaPiC+P7ZX85N18xCfbs3biUPjdzzv1k9NdllqT3k+7Gxx1Z+doXSzjasc5eRKpDqhg0NH6eto6uR58fnyjPiu+6FutztJ8HlJg2RRDf0jrKBctfVURQo5zdUDAUET6ujd9NsMfAY0kBEDSA5byhm0wdCZJGP6d3OWxXFte7Xb3tW3ckYKksUaBwBGi3YsGJUH/N2MgpDRX/9hT6aCsGYoaEPmxxXJPCNipKTsGuFiLtlf6MXWi9tPqIcEWp9m79xYhKPb5CFWr/x0wNoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpgzETYc+cxXYHTchEJ+v9vzRZyT5cHZF1MlTHKL2H0=;
 b=qgtAEkrmG7ZB5pZCGNMFzbI+cCurdoo4gYANMeqyXvQ/jH1H07JzEeLFHzD85i51mtTbe2oac0bzoPn/Yrjvh6FQUL1dn30WU2D0WuJt5RV/HtprEXAF97a5+IECaGZtOI7Xy1Da9nFnxg4INh5uQl0I7a1uK7WqznsiNnjPXFtXxjWl/sNhShUd6CR+gsz1Ux8pBbkamY05qsFDCYwgt6/xXcEKf/tQ9UDZiNxSPr5eXRa/E2+h52UJiCK2CIVomw+K5g3gxjXKrNFVIiLydeI8Z3Io5hSnMA47EHiM58yVOQpRIivf9WK5nZYXh36QsGaAPDTCGKiDETvi/Wy/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpgzETYc+cxXYHTchEJ+v9vzRZyT5cHZF1MlTHKL2H0=;
 b=jlWMk9vFTUDD6U4gmOw15IAtLw+cDYy53r0SFnrVr9CalYVaVJYr4iDRxYkBT8AVJmuQ9BiNiOepVE5L/2lQbqxi/ClqCDyPC58/ePPm7+IcvDYrHecFLvPWnS6pkD4Zdk479FYuECGxnwKaCKT+G3nuc2dQLUgSpf9ekSehDgGHVpUanyJMPFvdZ7Vz7tcMqa/tPrDRkYdkua/2aAG8Fu+rDXdBu9H8LPzsMVqZUFG2j2SSGFWMJbUo+aPqWpOdmY3GDpivkv/S80xLbg3HhoR0inz9at/g5mw5tKRCyD9+1UkpPNeh+6zJOfCQow/HCHUxWOn14D/cBJ2r1Sa2UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 13:34:21 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 13:34:21 +0000
Date: Wed, 15 Jan 2025 09:34:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250115133419.GN5556@nvidia.com>
References: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
 <20250110203838.GL5556@nvidia.com>
 <Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local>
 <20250114173103.GE5556@nvidia.com>
 <Z4d4AaLGrhRa5KLJ@phenom.ffwll.local>
 <20250115093234.GB6805@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115093234.GB6805@lst.de>
X-ClientProxiedBy: BN0PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:408:143::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 420abe2c-bb44-46cc-debc-08dd35695174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?92nnR2Hk7R2PSPZjk+aAYvPv0N4JIgbD9E9ONbTddet/DA6vo8m4WxHCWa7a?=
 =?us-ascii?Q?V0uQR6/i8ey4X9WC5Cllf/OSl6NqGLGyAaL2eBFKcbXILEwOaIi1O32VQ9YX?=
 =?us-ascii?Q?AvUo8qWw3vvn5mFxx8etSMlTSrLc2YczWTH4AHMFLZ7nW9K33uaYd9Cgw+7x?=
 =?us-ascii?Q?1ZBcL6dyMSF2GV8QLqZVqNwR+m48O6Z9TemFRZYUg7jFjbqCXqdbWiWKDniF?=
 =?us-ascii?Q?cGQ8bIKbde0U4vUvCsRR+IwluTW7xrAH98+PzxF9QdgMQscr349hHURFn+Ou?=
 =?us-ascii?Q?6O6z4+v95faW58RaMTsTwjeypGaQqC6RSFYw263Ubs4XtRRv/KfHV7UmvIOo?=
 =?us-ascii?Q?0HxUuZO+Q1RcHj5encbutNebUiH7SbAKI9fIJQATkfLj+OjX6InXz1P0S6jq?=
 =?us-ascii?Q?nHriBguAtXlTPbmJ6288iOrHkHepFbmD4FiiXnrJc/pSJs/trKsTfW6iunVW?=
 =?us-ascii?Q?DbPhgh0CzIpIEnldXQCd6H+aWMCyg8Ynx9ZW/C1d/Ye7sQM+OMDfAJ8u35JX?=
 =?us-ascii?Q?5fP5O++fWIbjCBPFKGy16zRLHcy3JWyzUGZoZWGzq92juXt6aYlBbSqazudY?=
 =?us-ascii?Q?URZ6GAN4bgA/7jB3c/E78BX/uP4Eqy6Ap54zQC9XFF7Rd+ZeHVzYp9ETq30Z?=
 =?us-ascii?Q?jfMB04pdlzvY7XW81Z2ALqd4D+MRQTSX39rwWwe/DGLWCSVQMU/bT0YJx2Nx?=
 =?us-ascii?Q?9hQoXH34YoBhrlTleDG1Wt0emZuNsMbCr/6/W1YV1Er9fkJL/+LFYhUiJzro?=
 =?us-ascii?Q?/npgBmU9XdctvCtNTusrXXdDl8nobVAzgR77Isi4P98IZ/k3ctcCCPIbqpaP?=
 =?us-ascii?Q?nlNwnBkIuibh3N7jDXgSvZ1gIbiem+2TLdMVx19JHOFiodGWaeW2o8zWvCA1?=
 =?us-ascii?Q?vP5oXhLawxLv4B45tYkzR6zl2YMAxRIXWy4qUMsXqmcnaxU7vBIFxmQuj+T1?=
 =?us-ascii?Q?WX/ElPpOLioYOHtsxljcdfhOxrj0Gapv06IOugBd7CIw0X5omNcMSvlRWd49?=
 =?us-ascii?Q?T+LVmI0D4I2+XJGH0HPUEirRDX6m9kbK8QmVDxHYIm6xjFKY1UR8MPLaczu7?=
 =?us-ascii?Q?dFxpMis8oiCjQ3gbbmL5YPDVK37e2zEsewgvYlCLn8B5daejVCuheNphPRJH?=
 =?us-ascii?Q?EOL8ENeK1ggut32VRQKDfi+2kU4KKJuA4qcQ7OWXjqwLSBffHrOJ8w62241w?=
 =?us-ascii?Q?v8uHHu5hAWHJqCTY87odz+sU4+a2ieVgAl5aVRDz0hSuz+TOf+1c0WbV75er?=
 =?us-ascii?Q?MJH18zWZQ5n+n5q9KlJ2zQwQmFV4N4l1e1yoD58d4m7mi5egatq7IMtosVEc?=
 =?us-ascii?Q?MKdkXejifOTUH4t3xfz0mukOQMCtK1l+96JftiprETgBA3qxp0YGlt8rfGa8?=
 =?us-ascii?Q?udCxzGkGwm5/FFpv79RzWkUrP1TM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ND/N+wOez73RZOVC13/g2d6Xl6m2gLDmWoKtzubrvxVQW+L+jo412bpS1Rd1?=
 =?us-ascii?Q?OsYFJx+nM7Vpn2b6Yqpnktj926dTQgMHlfJyNbK5pNuRQF0vxEuSG2a3pDCo?=
 =?us-ascii?Q?LxLnPU1aM3/XwWFpTurM+dgXZFW3rFLVwhC+kTh5mJ3JmD+Fh776Jg1sm15L?=
 =?us-ascii?Q?X9wY28ZzoYPumNhxGo+pykKJEXt/ntv1lmH3Rpj7ElIFB5Z0MI9i0ujGI3fd?=
 =?us-ascii?Q?vzTmd4P67f/ESjtCDHjSHKVuJU6ZePGTV3Mh4DwFWjMxqYwqUCrUPGWLvGuB?=
 =?us-ascii?Q?TvHDOCygIeYes41BVh8TuYAM652R6M0ZGIqBT6zQ6GKuAaQk9EfuQeXDNvqH?=
 =?us-ascii?Q?20PwpgY9sxVGscG+zVoAlUI9m6ABBn+3uRj/H/qp5UhDKlG+xNbcW1tYGXvD?=
 =?us-ascii?Q?MSx26QKMlEN8kAWHTi3sxCeOsj2+cVd9QRy67MwnUoKKmE+S1NVIs7eNCYau?=
 =?us-ascii?Q?XTRtEzMQBarV7i08VlmvK9ijNKUsZKJeD0ggjX12aN72IjjJHUArCBz1vKOV?=
 =?us-ascii?Q?SyhPL6tiQX0comIR8XgAhSXVQAbTpAniRmxkpkrULuWIqLghJQg6GbL7OEkl?=
 =?us-ascii?Q?TMeZ+LC3Gz+kplFo88Ijr0V3h3b8YHBXCGzm7rv1c5DJ/FM+3ilQoUiubls2?=
 =?us-ascii?Q?SMZA5OqRRo+N3lQRP5vLlnhrQDD+j9HVuIXFDGzY7XIpU+ryYmjv7B7h5LeW?=
 =?us-ascii?Q?RQo/piC2/u/3MH14Wf4BovLS9G1Lb2F7S+DG7GBI9QlhOZVozRTIaYJFZcVX?=
 =?us-ascii?Q?Xwa1fQ84wBxYqSHYjSt4VKjsEUEmUNAyJVSfHeQzCEWWqAsSKmviLD5mpGT0?=
 =?us-ascii?Q?4xUw6tv5M8hINKrIaBN8Wk+/UJX4sAH79csbfRtuQwMk4Tcd7tNLUV+DdF2X?=
 =?us-ascii?Q?IOarg3YXx0vNdQUuBQIPounsW6M60c4LNt7FJcMUzyfYIdpQ9r71+pOBksyu?=
 =?us-ascii?Q?Dvjs9S6/J4mmT/ugZBiT6jkCdwMzXQ/XkOVFkzaXfE8KfolhETb4R4PhzxQ+?=
 =?us-ascii?Q?ITJ93Dkb/905CY/ILDDwNu4KdUg5YgDNwN/4XtXJvcPYS4ulKBxyl35LwUav?=
 =?us-ascii?Q?1WvyHkGohAqlmHwOqfZKo1N1c05R0m9LxQ/fYaQMcpLtWzkG2UFgmRaEe9s/?=
 =?us-ascii?Q?Eq++J5X07FMlrokmhjGcuKxfVahqn6+9asA+CmCPoEUqLQKlJzXTvfaV0k+e?=
 =?us-ascii?Q?26xP7Ytg7MwkhEksGYz2Qu1UKJTzpePluntoOF3CKgftwOCqNpiniwMztwSn?=
 =?us-ascii?Q?hUbFqBqN2MUCOV7oEkIbWFS9NxX/jYl+fZowGYwKEj6bj1Z2NYhIP6V4IWBG?=
 =?us-ascii?Q?JyiwBUWFTqY4+vj8kx607606Dd9yQDXTLPucUlvi97vZNoSJ6cKLcmEgFNVq?=
 =?us-ascii?Q?/pd4tEHQ+wg+/h81nGZCC8uQgW11V56Elhg5IXOWFrnErRtqrSXAm2VqSM7E?=
 =?us-ascii?Q?K4CPkRPuxQGGnKwZq5RceG6gP9e07X82E5c/PKg87FpkSm+QbModVnm1vGH9?=
 =?us-ascii?Q?dFiFIHaJ93DoH8Rlx77k4+Czosbf52lX7v66FyNrpURSd9dDiFPD2cuwJdhW?=
 =?us-ascii?Q?8R4OtXeMTRqZNh2XMg1KKJhstBra3A311UG/NmSw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420abe2c-bb44-46cc-debc-08dd35695174
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 13:34:21.2462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQvX3q9hv7IBWVq90oBvQIfBFXczpwEmx4uzWZMiEEPlMqye7K/07pCglXx8mjBU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531
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

On Wed, Jan 15, 2025 at 10:32:34AM +0100, Christoph Hellwig wrote:
> On Wed, Jan 15, 2025 at 09:55:29AM +0100, Simona Vetter wrote:
> > I think for 90% of exporters pfn would fit, but there's some really funny
> > ones where you cannot get a cpu pfn by design. So we need to keep the
> > pfn-less interfaces around. But ideally for the pfn-capable exporters we'd
> > have helpers/common code that just implements all the other interfaces.
> 
> There is no way to have dma address without a PFN in Linux right now.
> How would you generate them?  That implies you have an IOMMU that can
> generate IOVAs for something that doesn't have a physical address at
> all.
> 
> Or do you mean some that don't have pages associated with them, and
> thus have pfn_valid fail on them?  They still have a PFN, just not
> one that is valid to use in most of the Linux MM.

He is talking about private interconnect hidden inside clusters of
devices.

Ie the system may have many GPUs and those GPUs have their own private
interconnect between them. It is not PCI, and packets don't transit
through the CPU SOC at all, so the IOMMU is not involved.

DMA can happen on that private interconnect, but from a Linux
perspective it is not DMA API DMA, and the addresses used to describe
it are not part of the CPU address space. The initiating device will
have a way to choose which path the DMA goes through when setting up
the DMA.

Effectively if you look at one of these complex GPU systems you will
have a physical bit of memory, say HBM memory located on the GPU. Then
from an OS perspective we have a whole bunch of different
representations/addresses of that very same memory. A Grace/Hopper
system would have at least three different addresses (ZONE_MOVABLE, a
PCI MMIO aperture, and a global NVLink address). Each different
address effectively represents a different physical interconnect
multipath, and an initiator may have three different routes/addresses
available to reach the same physical target memory.

Part of what DMABUF needs to do is pick which multi-path will be used
between expoter/importer.

So, the hack today has the DMABUF exporter GPU driver understand the
importer is part of the private interconnect and then generate a
scatterlist with a NULL sg_page, but a sg_dma_addr that encodes the
private global address on the hidden interconnect. Somehow the
importer knows this has happened and programs its HW to use the
private path.

Jason
