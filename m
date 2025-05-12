Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA8AB3A08
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09AD890D2;
	Mon, 12 May 2025 14:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q0fbEKHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5074A890D2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvCQk+tpsjT2/JyY1b4qUdnhBLbty59gaYFwSpwVSVLvDgkTLZGdkJ9PWCGnLCoTmVFw5PLqYAcsHOyujmeG+LX17xqfSPg7ImCbtiVHpUKN6EQJStxpEwdlFpE38oOEyGu3X4j0KAVyp5+1Nr/hw0LCRVatCRu/OZjetBF3FPSK7Eu1ndhhubFfPczXNvUJVXNLaMGyCwgh5q0RldZNY7heajEZLMNBfXLeCz56N6vCG4k7S8WcK70p2tRtXZzJFNUwNKVo8N84Q3D2J+7y0KPegFLxyoFsPO9ZccVexyEzi0Dx/r2FmPm9fP+F2+XxPbjzjvVY09FDbKnC2yVmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o85sQUDWwWszXK15xJS1kXTPd2+acIxkgDRszjYMk0=;
 b=JynhR5pbr1GDf6XmT5qR/fe2Rtyx7aNpNZmMr+3lenEf//Q2JMeH4ILel+ovyXZxCp1KpiChE4gP61RSYQ9nSq4duAw9Ydhu8wnCQ6B6nsmEntk7Qw3bBG+dQ3qXmOPaWDCxWDHE/uKwry2l+QdX7+pDchdskk7TcnJ0kvn2JOnVuWcO/B7UBGkkUOg3C7SBtpHrmiZnJ3vVa/S8Hsc5thl5XLP5HzF7pS+eu3BbL39ub7U03EWmznkZiBmwLXxtDx3JSaQ6QwKRhNIPkVOU9OzYeWvYOA9sZwkcgf7evohMLfP/YtGX70D1T1sMjxF69FvGzZXT6TgWuj81vD7L+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o85sQUDWwWszXK15xJS1kXTPd2+acIxkgDRszjYMk0=;
 b=q0fbEKHL/hBnZGjjj8SyslAHdgymWXfFJ0mMIpKYeyqUmr925eWsxGzRLYqV+5X7h0LqZAhD5P1Idy0qeOTAA0d6w9ac0RTGQIjqV4RndxM7h+AX/pvC9mzIg3WA1CYZtBLQv9eLuDXEe4LvSKQPFEGa1P1KPb4x0P3VMFXAoxcFjKGVUUGYR9enbmVFRdlXmVrBj+LwvoOQCFwOFBH9EtcPOMzNjhBrad/zkPx5d2e3UI9QUmjZMcaJBLbwO/TrSzJnynK8xPARHMV7WeICKxeTbpLM05RzbXFruHEUhqil+DKg0axn86FZnubMjaz9agZTBtZQrSOeFoBc7Id0PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 14:06:18 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 14:06:18 +0000
Date: Mon, 12 May 2025 11:06:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250512140617.GA285583@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
X-ClientProxiedBy: MN2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb15a4c-035e-46a5-6c7c-08dd915e2a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HjDhY/9fnVMhfYk56xZo9aisjPv89IGExNaZvTNZrUGLV2J4mu1RGmx4pIPH?=
 =?us-ascii?Q?Nl4Y+CK7Pgyi27v4WxBxhfNgJvLr7qOehtgna4Burjjwkwn0HkDf6gW8u7hg?=
 =?us-ascii?Q?3S2mesGa2u2062nVXRwltgHvyMrCqwxgKWJpvx3xm/G6sSvEbE01HApKQI+g?=
 =?us-ascii?Q?vIEug+Yi5Py97ipixqjS1DtJDotJMatRLR+PqStjqwU47/m4nJRISVG3BXVr?=
 =?us-ascii?Q?8iIIB9LgIgwfEF4Od/zLnhykqVpFtZyN2nfEryZCU/lkbQDZihK+su7V05uW?=
 =?us-ascii?Q?epXca11c9+hrbPbWdSiYlkzowXg3oVTOj9/hwsDQV0UT4SMEAGaVpBSs17pL?=
 =?us-ascii?Q?b6BKr3nQnmb8VcPW7UsguXZGu3M7RbUL1XiJjluhcmK5jXx0H6veyvhjOqLl?=
 =?us-ascii?Q?Ny82I+np/9fh5o0et8ue1QY4uYB7Y82xO44GzPMyanKVWfm9AWbfD5rdqQlV?=
 =?us-ascii?Q?wuZzc28z2YIPoVJwxJtl1Hslr/1zxikKVl9uL17igQ7r8Df3t+DdSdYx/lR1?=
 =?us-ascii?Q?CljTN/oaUTLDnslFxtNWgSjL3O1U8JsD4lD90jhSRxqRqOfmflWvnLd7jdfW?=
 =?us-ascii?Q?nkgx+8ThqTI/vf7WiuV5RVRJHmyOV4Q1wRf6DTl7jvk8gijhCTvQzYWtskie?=
 =?us-ascii?Q?98h2rEZN4m5M/0FDTMy61y343c9EMSx/ss18MZWUr+NJUQnjFRwLDwv4tgy0?=
 =?us-ascii?Q?Yei9w5QJLJQUa3UhhrdAOFdwGIeQmMvlLPD7ZrHfmam1c8Y1aLInxvQzPBT2?=
 =?us-ascii?Q?47xu5lQkY1N/zt4o3KR/JtTqDxHYNj6TrVcVbR8MdTTpMUvcYQN+2LU2rU+f?=
 =?us-ascii?Q?wZak2SQhpy2fNyjNg4pTyPCZIbmuIC3/NGDv0DMoPb5TZZI9J1P6PKU9wrw2?=
 =?us-ascii?Q?keuVgjzaw88oYaBgwklnJOxQQX/4AfHMAU8JxKXM5Jh38cQuCCAwkNrqLqUq?=
 =?us-ascii?Q?qnKXrIsphM9N5YBP4ON6+sRSdYbGTZJYs2gnuEZWW00yxD2G7WAVU3is4BPZ?=
 =?us-ascii?Q?RQqU6P/P66yu7GAr+iLD/HGFZ3EQYpaQ47Vdii2YdHxWaI1fjUdc1gyL74Mk?=
 =?us-ascii?Q?qJUBTJc0I0pVYkXgZkmbH3csgKrStGxp0w005QT8HgLmHI1shyUB+fIHTlsd?=
 =?us-ascii?Q?pwWujpBhJTQekCof4EJ9qEcBVWv9IyB1uPa3PMqFRo7b+415Lgp3dTxrs3cE?=
 =?us-ascii?Q?Ee3S9fbPX9/ISbB/PTzLTe0sbk/1hXPy6TziEM1Vz98S+lCQ17wuwSBzaeyL?=
 =?us-ascii?Q?ATAMZV0AGtuG6ssiT8R8UiftzmkTezj0vdJYvJbJmcUtZO40OIBeeUoFqXSt?=
 =?us-ascii?Q?+oaUOWnK7+ndZv6x6Kf5Div0BzRhJbGGXLGfHAJCpjqzn2Es09gLNTUi28+J?=
 =?us-ascii?Q?RaaRh4Vnph3+UtKeO2jM9/ZuE7eVhNKTCQFDCi1cRn/VB+/Zbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3uGB/wh5uxdfI1I7Heq7qH0Og9FzlyhrYFKDSA8z7YwdokyYoK24rIKLZe9b?=
 =?us-ascii?Q?NCBjeHuMOkgOZ5KB1yOXXf7NvO8fIyFi6pP4dKX4eGZuSY6yAgmXHKFfk05h?=
 =?us-ascii?Q?MmP1JZXen0v0e9yTRIdIbvPH1lBMNwhvDFteR3AE2SFshNiqd7Ewn7bXRgkV?=
 =?us-ascii?Q?q7Q0+6Rbj0AXMyhk17cgYbWozzq/91/mgCjjVA25qQ513HZnvf6mNms0S43t?=
 =?us-ascii?Q?Pa6q1pxYZxHHi3tNePUm3KI5buNY5bEVbzDLM3FEtt0pvRVXQLRju5ArOxUP?=
 =?us-ascii?Q?JFJVRIKFnwoDmoiMHMKnu+akIiTQLrhY/LkoKA4Yqa5Tij+RSN1DnOshss/Q?=
 =?us-ascii?Q?CvySJxvEVVUSjOkUIBxOhxRoO6PZw5U1zQaO7YAAx0QCRFa+CeWCcU+pRAml?=
 =?us-ascii?Q?o/UkKvsawvIgyhhlLcpwtZsVMLuZvY9MYBjzh3BtowMyI9EDtyoDV1XGCvn+?=
 =?us-ascii?Q?xnFv6SAFgCzU15sV1o8qb5pKOov/bGIHZXeAIZjxr5Ab6+z7dL41QD3+Pjc3?=
 =?us-ascii?Q?pLoGLBSJSDfO73KFYCeuzbZfnZ3HB1JSnT4Hzsh/at0JkiQfsvp7LqVmpXPO?=
 =?us-ascii?Q?UlUm0ulNxUpLjK7oLZCk9jKuDbyTn3XSac9LBNPc4b6E7aZ5GavkM98+bYBz?=
 =?us-ascii?Q?4a/GEPdwmNWKM0Mcoh6RpB2pycO3NVGZTNqqI++TRI82jzbLTPtgSJ1L+hpT?=
 =?us-ascii?Q?j/+qNnn++kL3BR2O4q82U0/sNa4M4z9zUkbbMnfdflVanOF9INc6wNwfSJly?=
 =?us-ascii?Q?gIiXNQAYj1wdwzgzWbKIPbn5eceBhEllsiXXWxaM1/A5Ul0PldOpaq/WKiQR?=
 =?us-ascii?Q?DaCGf/S8wvPup2EoqK25qywSFksP9SzL7MXUp4gLtXKd5kXgw+GxnsWRwZDA?=
 =?us-ascii?Q?wQLSDERRcOA2L1TlZwAsrB/u1fJwgqXSXFyLPEoDlb1i8Tt5yNkbSDygwjGs?=
 =?us-ascii?Q?6nIO73A9ohThl0Wc2tbUGV3OHWdH7X08mahVp2piKkXWgVc+UqD7Y5qKk9mB?=
 =?us-ascii?Q?V08B3Ty+/NTYyyUtvDLqz7nBh14Kv/pjn4omiXHKNWK88C/985XLKz6H00M8?=
 =?us-ascii?Q?CiG9ZxnD55iMazckYiLKyk/13F+cjNHQ/+7X3r+pynvekP9HC2KvqqD0GEJK?=
 =?us-ascii?Q?515CvM4zIZp+KZswzxfXqL0jgku0wOykm5mh2kDqG1FWSbfdSTOdpE8KdoB2?=
 =?us-ascii?Q?+2tvXfT9Iwpy2C1FnXV7pNGhrsa/ONpx7tHQdyipriG4I2aZd9J2pT5jqw70?=
 =?us-ascii?Q?KAS9aqe1HBUcQxuoX32QMFc1gBb7dFxd6g2/N7Cp1H4fnjn8JXEDxXxOqa6Y?=
 =?us-ascii?Q?/v3et32XnvXWVctg5hchv9Fy8u6Y37Iy4wzg31zZHqAnZ3EzO7wdMVwGDbbJ?=
 =?us-ascii?Q?lIjvgin+kP1PWhJ0hc0G/ZFhNvXEBN1RkFQhgRIIzw4sY2sJjEKO3o4SUuro?=
 =?us-ascii?Q?J0uDcN7LPYna2ezd6uowRCpxOv17wW8fguTN+Y6lRHT40S52W0+569mcc+NI?=
 =?us-ascii?Q?V9kmQJZH9Vxwfo/5EYZ3zIaP1NdrZmFScdoCBV2aHPkZKwOEO3Vg8EWtEtit?=
 =?us-ascii?Q?B3rsYMB5daOVdmqfDOk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb15a4c-035e-46a5-6c7c-08dd915e2a32
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:06:17.9431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XOPNpXo0izY4ZK79J8S5SOXnrLwVISIq8DobohJUXZEmtI86dR9kuogaBjNEe/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302
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

On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy wrote:

> > > I'm surprised by this.. iommufd shouldn't be doing PCI stuff, it is
> > > just about managing the translation control of the device.
> > 
> > I have a little difficulty to understand. Is TSM bind PCI stuff? To me
> > it is. Host sends PCI TDISP messages via PCI DOE to put the device in
> > TDISP LOCKED state, so that device behaves differently from before. Then
> > why put it in IOMMUFD?
> 
> 
> "TSM bind" sets up the CPU side of it, it binds a VM to a piece of
> IOMMU on the host CPU. The device does not know about the VM, it
> just enables/disables encryption by a request from the CPU (those
> start/stop interface commands). And IOMMUFD won't be doing DOE, the
> platform driver (such as AMD CCP) will. Nothing to do for VFIO here.
> 
> We probably should notify VFIO about the state transition but I do
> not know VFIO would want to do in response.

We have an awkward fit for what CCA people are doing to the various
Linux APIs. Looking somewhat maximally across all the arches a "bind"
for a CC vPCI device creation operation does:

 - Setup the CPU page tables for the VM to have access to the MMIO
 - Revoke hypervisor access to the MMIO
 - Setup the vIOMMU to understand the vPCI device
 - Take over control of some of the IOVA translation, at least for T=1,
   and route to the the vIOMMU
 - Register the vPCI with any attestation functions the VM might use
 - Do some DOE stuff to manage/validate TDSIP/etc

So we have interactions of things controlled by PCI, KVM, VFIO, and
iommufd all mushed together.

iommufd is the only area that already has a handle to all the required
objects:
 - The physical PCI function
 - The CC vIOMMU object
 - The KVM FD
 - The CC vPCI object

Which is why I have been thinking it is the right place to manage
this.

It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
stays in VFIO.

> > > So your issue is you need to shoot down the dmabuf during vPCI device
> > > destruction?
> > 
> > I assume "vPCI device" refers to assigned device in both shared mode &
> > prvate mode. So no, I need to shoot down the dmabuf during TSM unbind,
> > a.k.a. when assigned device is converting from private to shared.
> > Then recover the dmabuf after TSM unbind. The device could still work
> > in VM in shared mode.

What are you trying to protect with this? Is there some intelism where
you can't have references to encrypted MMIO pages?

> > What I really want is, one SW component to manage MMIO dmabuf, secure
> > iommu & TSM bind/unbind. So easier coordinate these 3 operations cause
> > these ops are interconnected according to secure firmware's requirement.
>
> This SW component is QEMU. It knows about FLRs and other config
> space things, it can destroy all these IOMMUFD objects and talk to
> VFIO too, I've tried, so far it is looking easier to manage. Thanks,

Yes, qemu should be sequencing this. The kernel only needs to enforce
any rules required to keep the system from crashing.

Jason
