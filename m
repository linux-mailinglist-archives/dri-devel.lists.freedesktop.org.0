Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB85A091FA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3C710E05F;
	Fri, 10 Jan 2025 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IS2EW3YU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2984B10E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvgg6BD/hXlMS3NiIFQrY4Ntq0xmThm3Sm/Me7P2dibYMWAxd8+Zk/jYXfz8w+IhMy+wF82jR948j8BDOqEB+D/ikPneGy9KFPy7dXlW0RmdcROzVlHB894wCgBXjREigV891bZcgz+cQb+DKK4u4pBzFklR4JFf9m/XpN+KV67RL9q2144tve7rQpCYURnYraiCsF2JInoAByX9uipTQPTxZ/BNqXYq4IiMEwncmn1WOT0TurqPmr70P227+W/QFDfqSfOkkXe0209u0POp/0A+suLt5HhcpH7rovxA+pG+YTvmSAof3MLYRgGAOf057ZzWdoUtVnxtOFqpmGGWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77aiwxsJ+58HxtiqysgzUexLC2FwsdWU162Q73ixL4c=;
 b=lLwbEM8Xjvw6Ry9j8KrgcCIbzZQcn5rjWu2AJfykZ394ibp1t9s8/O20K6sxsGjvxdvWaVFMB3jT/fxBmrkRHQwbExNzjMwOhukkjRTasWn0IdQ5I3IYlC2HBfSmJL/yYqAsxVa1rXHrtgi8bVoJuUzggKcu/oP2FU1xfJaNWGSoPJNbssB39W1DnzPhjmajZUkG3FTEOB6I9AO/b8Oxgp+bpArYU5VqRg5H/MsZhISMH6pKLRi8lIwOG0hKAoEk1VS33qiLT4k8w3jyCMvDtVxrbGuY91mVwI5Ev570x51cCinyciPfjGCyufAeDCB9CbOC0mdvWMnE7KdVdsasjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77aiwxsJ+58HxtiqysgzUexLC2FwsdWU162Q73ixL4c=;
 b=IS2EW3YU3a9/hqxE3vuNcljvm6OdPApeQe4Z9b7UJmOy1arp9PS/dbVZ0ONuUG6XUr4WG4zqp47pWhRVDy5PkR/FZurFkOzQ2ihYqKaORKV9Gj8XMYlSqy6DYS9QaJSfZC70UBunSBE6Jbjx1xD5zmCCTSRwHFU4K461MT/wZ3Ite+dn8Jpjwff31sv2qREZBl0vRto2Y7Co/sirta8cpUSJMGcT6o61WVRHw87U7VM6PuJrG8byoXaGPnT4gadmGjp2pd3FxemQPsBn8F1aQSUsVubeIxQZhWSxh7dF7Hp3Jdhfax+di1B4X3eI+lrYt/6+Bi6nPMbqKXhu6UNGQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:31:17 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 13:31:17 +0000
Date: Fri, 10 Jan 2025 09:31:16 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250110133116.GF5556@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-9-yilun.xu@linux.intel.com>
 <20250108133026.GQ5556@nvidia.com>
 <Z36ulpCoJAllp4fP@yilunxu-OptiPlex-7050>
 <20250109144051.GX5556@nvidia.com>
 <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3/7/PQCLi1GE5Ry@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BN0PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:408:e4::21) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d590e18-0ba5-438d-3a50-08dd317b1012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VskdYZJ3YX7xMRnH4eD1t+e3CbkOMIBf4S/9uHqPp1ySsWqYUabrgJMZKejF?=
 =?us-ascii?Q?5CeKzXMm0OA8lxJ9lPij1CLL7Aw7FYl63oLxdwq4lN30aLh+yGfbwIPQL49k?=
 =?us-ascii?Q?iXqKUyfLKbYGx/ArGFy8fMi/NuF6MSJA8hQ5T3S7YxdlKJOkVG7NMkVK6kTh?=
 =?us-ascii?Q?PEOBAMJ6UIXWwHcCWcjxV7X+eRoAI36T/zd+lJWAxufAIuHFm+oiCSzzTlFG?=
 =?us-ascii?Q?dMZ3r4omyCazGQYSyHBuGIRVyXsuztD7B4m9JM9rU9ixxSwcoiR6Vrh9H+L1?=
 =?us-ascii?Q?dPqx77a92rbEAawK5H5W3gdt4V2+WQ04sKbB8Djz2blQAb4/nLtjRlmXHdWt?=
 =?us-ascii?Q?W0rFhZofYj56PZ9VizJ3pZgvc0cRBlM4W0F8mHgdzH1pnQZGbuARq11N1UAI?=
 =?us-ascii?Q?wQHH+9uHhse5Q8xjEjN3kjYGPBAAxMzKTeGaD3vEyVRHKu/K4xDvAk6P4JNG?=
 =?us-ascii?Q?dM44ob7EzbpfpirQcTz4YqCNmJENwu2YNW/clZvoPzLrP3as/OVtAvwrgX5P?=
 =?us-ascii?Q?Qq3sQhiAAiF/luOI3CmN/8vOGmWgXAHr0GPQy0Nsk+/UkVPLah/9gvhq+7Ml?=
 =?us-ascii?Q?zSW40Mf5hDfXoDKA9NJsCH6t6V9gL5tq8fY6j5eF3GoXEd0J8VT/oQ7Y/Ls2?=
 =?us-ascii?Q?w1X5U2da1s5fzpj4q8dyCPa2VZRGOgn+h3mjOffGKoxiEXA0YHGetLZURxtw?=
 =?us-ascii?Q?mCrhKI34rLCSGfZI1gC1i7s9XJXqFAQZghOgVhFYr2OBf/umCIQo6uIkhWrf?=
 =?us-ascii?Q?5YBtFBZ3hxgRdX9QY08SEWNY9yYOSbZp5FnjDfFS5OQCHbxallIhUwVups4a?=
 =?us-ascii?Q?PFXL29CFtUbBgkknzpY2z/KbBEiHJXciTmDasHBoFzUrNK0EUzYqGLsSybOj?=
 =?us-ascii?Q?xKBTyc2as4x5TAIY7EhqCJWunj6pMmHdmrriezZUAmKxCJcaYheMXJujxua/?=
 =?us-ascii?Q?5mQK+Zm8jGaQiGndHXtiOiB02E90DP4dU4H8/7UlxrHZ5WxD97SemHn5o+bC?=
 =?us-ascii?Q?rdXIhygkjwbYirkBTO2WOy6DfOoYcwJmtDriQcnsbgmO7egtjJU3FDbU4j3p?=
 =?us-ascii?Q?vuEw0s3WjJ+JPoEWogN7YVhN5/j6ugZWWqyQnTS1ypF9nDkbymKWsHHFskI0?=
 =?us-ascii?Q?Ebx+aGZChEOH0lQQ8Y6VdiDtBqJWUJjb/7BTytEvGaeF4jgkDcP7M5wCX0To?=
 =?us-ascii?Q?lTZGflffjYfoGxQXtRiSJ1mn1AfmzehD7WWdCr2RZPxt1A2TYEZfd4j5bMaq?=
 =?us-ascii?Q?Rp5JR2FNehaIXXfeKJSOEdk4VCQcr2DrIvv7+pXiYrxjUvJ5Rb553ZQy2L1Z?=
 =?us-ascii?Q?LlesnuF72fsXthdPsfnfdqVoa27Nf5QcgBI5oq4iLfdGItnyzVLDshWYs1TU?=
 =?us-ascii?Q?dD8oA+tv5vUdCGLOVsDxTTtgZvdm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZRZmZLhSAFh/S51GvJx5xSSwXwNDyFd6B/zauuxzal9XZvhREf9r47VHl/zr?=
 =?us-ascii?Q?FySQG5Xm6MBn6wJoTOd5ucf/kApenCgghbqQ8ourjM3uX2yAt0PCuaR+WvtN?=
 =?us-ascii?Q?ah3dR6OIiBhUz8VL4aiucPQ6RqpcNiDCVn5ZwXaynr+zZ0BmLC7aemC+r+Iy?=
 =?us-ascii?Q?3qmL/j70s02ec0UQ8JqFY/GBxDzM7BFBGxn2N2SIaR7AcvlhMWm0XEaBC//4?=
 =?us-ascii?Q?XJMazZSJ1U9F7P8kc2frjd8XwetFWh57/eC/Rp+SK0MB7DVsnboeROGHrcnq?=
 =?us-ascii?Q?GOJMshvEEUHpFXSXreXsSvGaaKJv9slddWZfRJco8LVSNmdAG+0+wn0otWbT?=
 =?us-ascii?Q?ulZwo7rZ+CEjTU7An/GZgKW8/Lt1udgYGH+fQEixqLQ9MdBX0wWeGINKlkMV?=
 =?us-ascii?Q?jr261AxLxMInNgUEFGMWmdvn0Ir1Lw8FMto9xlXTJ4j2b6eJ60pDsJOVQ9VM?=
 =?us-ascii?Q?aEtEjpjeYFaoOolTsUSu0kBKFGPNT+k5N+iH7mwFcQUeRXZk3rm3Kz/IYHG/?=
 =?us-ascii?Q?tPtH5Ingso9ASBjBwQ9psq5GfeLkIo3VBB95pbcMUMKvH57O/sE3HzGWkcff?=
 =?us-ascii?Q?A36NQLTxATqkl2TBSUxJKC0IOhru77pKtTqTXolSiDKteqB17mTZrv8T+GpT?=
 =?us-ascii?Q?1n9wlgNPOiBJelNziv1DJDRXjB0jxkuUJ/qRcqV1aGF42VRCsgk8vBjqnJwA?=
 =?us-ascii?Q?3RVqSNRLp5sRTAz/HC13z43/+/KpofYCYWr95eknx86rB0TAmeLFbhZMgsiv?=
 =?us-ascii?Q?ybEwiY0jswuBzBc436aYn/NiiKaMYYnLFurB3qKXHeZiWBA2McQEAPHS4LUV?=
 =?us-ascii?Q?qHHLbywZ6AdupnpsI8aYn3Ocb+56nCpmCXIvYDzaiymWXawDt53/R/Xo0/op?=
 =?us-ascii?Q?uTmBoVYfikr5+qa3PyehK5xemK5x+1d1ECgs4NpNRpLHrDlAWkHmEnmneI9w?=
 =?us-ascii?Q?Bkb8pGBbftCLwlkmUijCAfGlWAYTY/lx0Z/S5jP9OLPO6RY1VFr1KFBf5ehz?=
 =?us-ascii?Q?oUzUeImv2n1KUT77bBFb1mj7HG/I64fv1JlGWb4jB6E6drLqtqlUjj2Jrddc?=
 =?us-ascii?Q?gl/9wXFEu/iHv3DJ66bnmSeids2SdleMgW3UDxLtjlMNq6BnGPWoSLOeChyX?=
 =?us-ascii?Q?eUMNiNg9APMSlbf5dM+O4+K99orxn53nuKtzg6ONuOS3RJYeCxeLtdgBdmzu?=
 =?us-ascii?Q?RfUuYptXG0AQlEnVwzbZwhO33xLZyu9cHKeD1w9DodPVL7PqR9WVwI7ZaT+F?=
 =?us-ascii?Q?gj/Zamb4U2v2e4+feQxGjOjPBa2I+Tvp03TBWIL0ypT1llubnSNbuQWFLscI?=
 =?us-ascii?Q?KKG5IK1NkNPl1EWsIsDS80mk1w04V4SJl+7nOzEgUneSR6ebYnayVjjgF4zw?=
 =?us-ascii?Q?ij3fmyis0AXL/bGAfVWnBEFYyrN2CZlwTyIHd4Prd8fFWpTcqXNNMLy0YQu3?=
 =?us-ascii?Q?oLYQaY87kF7uZvSxMuvSGnn6LMiBgvzrbywZ/txTJbU0qAi3Aq+VS6LI0Xts?=
 =?us-ascii?Q?zPZOkBDh0nAWFD/RXlNr0YQD+KbDAi4uWzPBCZG/jmpsyLGCXgjWhqmoXmET?=
 =?us-ascii?Q?qpt1d4ws+D03vKlb0vLelEAhYFgnv1FAwC+LU9Hg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d590e18-0ba5-438d-3a50-08dd317b1012
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:31:17.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5B6j8wP+5G338F0kZT/rNLU7j4YEQyzq9I8Pl3wXaMetklSK2PkRBYqOZhc2/5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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

On Fri, Jan 10, 2025 at 12:40:28AM +0800, Xu Yilun wrote:

> So then we face with the shared <-> private device conversion in CoCo VM,
> and in turn shared <-> private MMIO conversion. MMIO region has only one
> physical backend so it is a bit like in-place conversion which is
> complicated. I wanna simply the MMIO conversion routine based on the fact
> that VMM never needs to access assigned MMIO for feature emulation, so
> always disallow userspace MMIO mapping during the whole lifecycle. That's
> why the flag is introduced.

The VMM can simply not map it if for these cases. As part of the TDI
flow the kernel can validate it is not mapped.
 
> > can be sure what is the correct UAPI. In other words, make the
> > VFIO device into a CC device should also prevent mmaping it and so on.
> 
> My idea is prevent mmaping first, then allow VFIO device into CC dev (TDI).

I think you need to start the TDI process much earlier. Some arches
are going to need work to prepare the TDI before the VM is started.

The other issue here is that Intel is somewhat different from others
and when we build uapi for TDI it has to accommodate everyone.

> Yes. It carries out the idea of "KVM maps MMIO resources without firstly
> mapping into the host" even for normal VM. That's why I think it could
> be an independent patchset.

Yes, just remove this patch and other TDI focused stuff. Just
infrastructure to move to FD based mapping instead of VMA.

Jason
