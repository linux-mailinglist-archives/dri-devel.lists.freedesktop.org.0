Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210C4A191D6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 13:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A206010E6D7;
	Wed, 22 Jan 2025 12:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l6h3bVAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D384610E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 12:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSz+P4OggB+irpgBy3gvyBjL2MWzxh7gzT7CJflX6Ovbbwgv5m5D7p+gpR7mV5acd5Ug3S8I3XvGNmhqc5pV4A4R404HN3cp1ieiL4lRWSz2KMZ+3PWE6nvPc+M+XmMHgNtge60lzsp1/CRvnaAre3PrgzsR2KilxIJZC69JJO+LAcl75v7cIn5Y6n9QppcBL/bD+Tn0eqhnatqmAywKOJuGohSa+LEIcm74Fvv6KX7YHivm4lyXoJRmK4+zgSKLZTpklcraRJGKTvyWRQC6SvIv3NuCcFB5ntrEH5JKjkF2ODCCoJJA5XuDlM5aD0mgNTAzOTbDSi/iRz9RLgybsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9Rv93f99GexKSvfPx6sLDdktLNxaLWeG6NvVvAzyYg=;
 b=aWv5Vq/H4pu9CEtd9Q9EWcUiy91mllz+CqWk8XvdjiV3TFACYyB5axlIRN8CL1fItGf/NyYvXro9swz+bC1ya0Z5Dko7QMlP01DUPCvcAVBQpXWtRVRmUZ+D6IMF5hvh+M48VH5y5wjfcy0zq8j0/BR67OO/ZBRse2yYMCMb4Wfkk2jgBnejER3cvXfBev2FXfXV57VU5C0K4c8b7IGJeFZPlXTHbSgPASctJ6eESbpRphgSSng67ZAMCVKq6vZkarOShRnmsKmRwzVVN2SxRYoSMud/hZqusHVBMCs9tqdFYdTPmMUxRbIbduSjABwT0LJ54Z8x0Xzacni048b/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9Rv93f99GexKSvfPx6sLDdktLNxaLWeG6NvVvAzyYg=;
 b=l6h3bVAXyqDq8qGMuzi/5prH+9wF2gIAKbaIsO65p6pdVZ6XTOhkrFHyWRjRvSM7n8P+bJ1yLrV4gGK/CeHG1YHxTcZNtpXbGnqTl6f7+UwfWmnsDOHE9LUj28Xfid1VR+xWWa5zxePOQjjPDqkH4niJ2tq9kGQFbqxKksBOItR0EaWIlL4mou6aBGr1aQnRYnsxoOkKY4Y/jLAitHIkzrjW4q/lXY+TJNowQJQJBqo3dV8TQmkA6RCbrMH2YelZWKO6WwkRAT0KEZS9HbGWn6DjrcgB7ug9cP8rHWGFNT0hAskOawIGLEd5aNEBTLQvN7FKfUHV7OsnMMpPcYNBFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 12:55:14 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8356.010; Wed, 22 Jan 2025
 12:55:13 +0000
Date: Wed, 22 Jan 2025 08:55:12 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 08/12] vfio/pci: Create host unaccessible dma-buf for
 private device
Message-ID: <20250122125512.GD5556@nvidia.com>
References: <20250114133553.GB5556@nvidia.com>
 <17cd9b77-4620-4883-9a6a-8d1cab822c88@amd.com>
 <20250115130102.GM5556@nvidia.com>
 <f1ac048f-64b1-4343-ab86-ad98c24a44f5@linux.intel.com>
 <20250117132523.GA5556@nvidia.com>
 <Znh+uTMe/wX2RIJm@yilunxu-OptiPlex-7050>
 <20250120132525.GH5556@nvidia.com>
 <ZnnhKtA2n4s1CLyf@yilunxu-OptiPlex-7050>
 <20250121174303.GV5556@nvidia.com>
 <Z5B0+OcLWsiHLRIA@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5B0+OcLWsiHLRIA@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: BN9PR03CA0861.namprd03.prod.outlook.com
 (2603:10b6:408:13d::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cef4729-a565-4b50-7985-08dd3ae40317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ypWP5+EccDxdzVgMbsUrmY4cawKBKRg+d6JnwQ/Gl052BlG0UPTBbqhUavTD?=
 =?us-ascii?Q?zOuJjmX79J/6llkxWZ5d+RSrAhjWi4pV+W1t+2xVtCw4qlWkTjfeIYbNWen5?=
 =?us-ascii?Q?VJtfjWAL91BYUhQmo7z40xFfsE25lbMEZncHYfR9KSJCpqLgI+qE2QTCQu34?=
 =?us-ascii?Q?IYz+z4/01/PzRmlwOWm1cHQmJ//CYz0wW5KYphGVkyunS6ueUyTBvKIWEgd5?=
 =?us-ascii?Q?Q0NFSbw09J7HJv0Hd3M/gO2YYWtX1SqdyClw7dadXAZnvho7vlNwD47D2n0S?=
 =?us-ascii?Q?iXYLcALXvDQMSsZs26s0x7QWCH1ntoVmLMWDla6SJhcPMM9AHTl3ZL+IOcuQ?=
 =?us-ascii?Q?1msXIbiYRZLDry+IuHboQ2CtdmvEQJpl6/ah9Af3kwU60m4o0Jug1mUnwZHk?=
 =?us-ascii?Q?6UtXRThZKJEMGw06q4QGeVOLqbD4p7c7MAAZguWnUlK+gBuxxQYjHUt5HbAQ?=
 =?us-ascii?Q?PbC9Nbp+9HcFIDmUJpjQytR0ZM2fwxWxnsJOBKlscMLBQzgSTl0s2hVolp9A?=
 =?us-ascii?Q?7XTNlYJZznOiU5BH9wwyP+TFVysJJjXvNs/mGBoPaBCILPSPgVr4oBDfWny5?=
 =?us-ascii?Q?RxfYD7d5cEiS/PgxV0emRx2BjcRAkG26dCcxGxBOKyQzcPfAGEBQQeZHIcw9?=
 =?us-ascii?Q?fIBDmymMSvPVVrlAgiEAbn7ef4486H/iETO+IR43QPwCKUN8muqsWESUK5u9?=
 =?us-ascii?Q?nYnuCDtZibQnTZ5r0ssYcfSHgTA6KckIxWMVfo2oEPLCNTwjFXF+QlJx6+Vo?=
 =?us-ascii?Q?FCdzMNpON0e8xjcKS9gPbHrWiwhC9/u63gPNoHJrk7yWFg5nThvo92GtEMAv?=
 =?us-ascii?Q?o5Fb9xxxNYZY9l4Pqlep7abX6vJiCzgyEwTMJO3lCJ5RMtS1naSM2Beeu0OL?=
 =?us-ascii?Q?LkZ0yjRJKvnG8d5JRj3WSBZQ5tbFEazduxBIRzDnhtAySSZJy/VOj3EN8ITn?=
 =?us-ascii?Q?SZjOr8VEYj9IE8xQVVxF52BS6shnXd8MrUzPwDu15ST1Dl1LMm5zq9qrZrgS?=
 =?us-ascii?Q?Y8Z72BeDTnPMsklX5XysDpqtFF+7xXreYVDabdERI1noBgiVH07azekkGbZk?=
 =?us-ascii?Q?i0mB0mzZzRxZTT/OS6j76NvM4OUdeoBqS7e9AavuWxyMug+pBvfk7I+V4lEr?=
 =?us-ascii?Q?N8h+KX2EKt6IIzi19iT5hjKDXNdXFOrirLzW9EJLpb2jjtghs3+CHEj5slYh?=
 =?us-ascii?Q?N+dS3PhJks5x0Kxq6pyEsjCf6ms1b0RbrA5akTFffVkiZ8NaB54m6NTgiGsa?=
 =?us-ascii?Q?8/zFqf4UDRNWs22+UbRgRZkCb6/lXmxl/aLVNncimB/xTiREApUywCZLtoBz?=
 =?us-ascii?Q?G+yLDh2FZoX37tcyuETGh5TSlmj07Ls86eMp2ugWZD+Jvoz9Q2Sq/hjedO69?=
 =?us-ascii?Q?c+lBF+TaMGfUcESunh+ULcP4JisJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MgTgMVQvEEhxijo+a3IYTWsXV56IBmU4HZuyRxoiPN33rzVVL9gkcKa9uLDV?=
 =?us-ascii?Q?KUXppY3aXl6G7SpUcSmRQPUYjnsnzx42/Baa5Mqg3FRcvGHmerKqbuvmtTtM?=
 =?us-ascii?Q?olI0/knLt6O3GJrJTxysvMTY9vOdoyE+zLl7eVMSXe2lc2uBU4ooN3Y1Xrk2?=
 =?us-ascii?Q?fsEgUBeKZCKy/RwZ2h4dYlEV9Kekyminftmuy8GeL9f7/0LqdGh6ltDZ6vni?=
 =?us-ascii?Q?Dz3nnNeZ4FM1Hxky7Ptfcz3EnEHXg+uuH2IpYCQXYPE3wH+OHQwCFJlFkgh8?=
 =?us-ascii?Q?jYFxop3jG6BO6+HnSlnZ2OPoTseDU/NW4M+tLiOGCvA5L5HRHfPbkSzsDeX+?=
 =?us-ascii?Q?qnGD9edsHISe7zqeBCI4cCeN47eOHThgcnKVMT9NcDWjmS6J2PKPYaDhsi6S?=
 =?us-ascii?Q?zRodaOr0+YrGSBN/2zB4VwPpOW3efF9p5thOMLRMy7NSt9i0ORTLU88uFWDF?=
 =?us-ascii?Q?SPNNe+H5+4QSyjrUxMsUtfznHBzB+8NeKvVPiFkNcZZRrvkJ74AlUJTLhHe9?=
 =?us-ascii?Q?qDqLEUaW9Et3rjC/5i5qMv1JnY1WncaygKJ4mFhFYmAdBxTtZB9DgOn7jk3L?=
 =?us-ascii?Q?LcAzuxGraXo3V50YFnx3TmOZFGzwNd5C95W5Y6e0osxsQIOur7h3O3wYuY2o?=
 =?us-ascii?Q?GuoRvlnp8OmzYUVkYoYZKsfjK2udkT85FgKVjZDO0RV4eG4HopibIu0owRuA?=
 =?us-ascii?Q?d21TEBg78bOIFQfQ4eM3VOY1Snu7kLmKYoWrhqKYBcY0IChBkPeKZRdzarWd?=
 =?us-ascii?Q?TogpEEGCcaviSfjL1UJ6fdEJbZ43G6yG+gAROTXeoKoEAWJBmH+4ydVNo6oY?=
 =?us-ascii?Q?Z9PJJrRdHT2ECpJnyJVkpoxUR05GlLz37Oe0nIfU10n3vQC0hyHsy8zQKR7E?=
 =?us-ascii?Q?NJ8wdTExLRrEACNvDE0a3FeUuHIT2CIvbX6PxWbyFHPKdYVk1fknCODrfLsA?=
 =?us-ascii?Q?GlGPTi3FZN5sVz5XvEsW3oUqitJjUK9inY36JSbcghuzA6Msnlj749oniZgy?=
 =?us-ascii?Q?jBDwLXvwyB55rGZN/QGdP3cCdCk5SYPF/zFgjb53jdk/2oRHhR8imcH0oNf7?=
 =?us-ascii?Q?623URapheZBiaArWvfluHaVMtSu/G/5zH19OUI9qBeV1LczvqjxKCXTBB0za?=
 =?us-ascii?Q?hE4oZ+n9rwWkmxgqp7myDtLDX4xme18LJXeOd3GfRi5iT3Ff4csfAdDf7wM3?=
 =?us-ascii?Q?angBMw9dE23YVL/Gb3/3S2HIopT7mNRvDQ02ftm3z1ATVZaVL10tlbcaJvt7?=
 =?us-ascii?Q?SHTUK02cktVpSFSccTPK1pjavNBfB6uR52WWk50tAw491VdDnYwx78L7W3Vz?=
 =?us-ascii?Q?mNsAZDOZ1A5X2CSzvw2hEjswcR2bWpG9LLU5KalIIGEsqvjqUq19Lz3zFyPw?=
 =?us-ascii?Q?yGWWRTIrpfZb6Gd148x2Z4YJaeRfwU6HWjVYG9AbBAyaPZt5A1d9nQcavCBd?=
 =?us-ascii?Q?kuH1uXCK3RuTwC5RT+iNhYWo6KQ482YdV3aYjsSGiwPsl0z1JKFw2rG6c+bd?=
 =?us-ascii?Q?HvSXQLupJoTPwmy8wxsn7BS1qTKiSFC4NcqkSpCunuQtlJAnJtcT67LbKt1y?=
 =?us-ascii?Q?C4rC1D+hu2dpccBDaQY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cef4729-a565-4b50-7985-08dd3ae40317
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 12:55:13.7515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5v7XMHBFL+4AML48zTwXP9DvSQvnfINNuZcP474hf/Qtp6ODlDDBcDb7IBNG2+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
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

On Wed, Jan 22, 2025 at 12:32:56PM +0800, Xu Yilun wrote:
> On Tue, Jan 21, 2025 at 01:43:03PM -0400, Jason Gunthorpe wrote:
> > On Tue, Jun 25, 2024 at 05:12:10AM +0800, Xu Yilun wrote:
> > 
> > > When VFIO works as a TEE user in VM, it means an attester (e.g. PCI
> > > subsystem) has already moved the device to RUN state. So VFIO & DPDK
> > > are all TEE users, no need to manipulate TDISP state between them.
> > > AFAICS, this is the most preferred TIO usage in CoCo-VM.
> > 
> > No, unfortunately. Part of the motivation to have the devices be
> > unlocked when the VM starts is because there is an expectation that a
> > driver in the VM will need to do untrusted operations to boot up the
> 
> I assume these operations are device specific.

Yes

> > device before it can be switched to the run state.
> > 
> > So any vfio use case needs to imagine that VFIO starts with an
> > untrusted device, does stuff to it, then pushes everything through to
> 
> I have concern that VFIO has to do device specific stuff. Our current
> expectation is a specific device driver deals with the untrusted
> operations, then user writes a 'bind' device sysfs node which detaches
> the driver for untrusted, do the attestation and accept, and try match
> the driver for trusted (e.g. VFIO).

I don't see this as working, VFIO will FLR the device which will
destroy anything that was done prior.

VFIO itself has to do the sequence and the VFIO userspace has to
contain the device specific stuff.

The bind/unbind dance for untrusted->trusted would need to be
internalized in VFIO without unbinding. The main motivation for the
bind/unbind flow was to manage the DMA API, which VFIO does not use.

Jason
