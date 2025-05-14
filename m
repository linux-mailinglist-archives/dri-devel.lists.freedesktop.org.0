Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C097AB765B
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACDD10E71C;
	Wed, 14 May 2025 20:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+5e0rg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D9E10E701
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:05:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3g0H61irAmh0CXNwsneeZSOcvwknJJg+RnZZfjaLVAWQt4ofhUZwiyuRIOpEYO2yjLRB7VHw01tJLiKMmgAKhJm4GXEHINMGvqjZkWy8ckjI9Y7Wer34UtMxYGXZ+lmfw838QVPZrUlGGIXD4tZVbqW9TioiPs4bDVn26dUdYUk1QJYs+fFRicVFFHJMRFKHmoq1IiZjRqhnhTnlC2L8lj8BsxlvxNPz/m6X9Tt+xBhZtmuLYdBzER9A3T0Lf6QhaJ2W0uyX1D3/aQmLJH5EDRx8gSLVjUn956yYyS5vmS8eCZEXNbnEqJIhdpeZcZyPHRPHdaK5CWI2ekvpngTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LMaNDKdd1AKrLPHqbVwhzBvq0gkRQIcizeMA4Gc4LI=;
 b=m0Q3sFImgouwCla3B68x43WQ+o/7UY/gDWDnznn9JrfK7vZWhZYmin73Q/5ZuZB9oUKAgYevGXGZZH6Obej40ah6lqY+o+GL8PZoX7WqpJlfgxVwvjJjqCC3DKx1bfPEdyV87oiZ8jlcR79lCWnfrEc5ijWiCaXzvXIc44QSTILzJtd0/2MalasVc74iQmJZS36GheLB2QNzyx0Tw9z+W4vVC+6J+Bx8oGrbCbLLSOOcB+X5upHDw+N4ro8V/rH2nfbtzJsQKiUd1vncsJqg/w3cq57hFzI2WlAvHf0jBCdHaXOjJctCafxQavrCDSXEcw7/ivZwORW3uDGskG2GDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LMaNDKdd1AKrLPHqbVwhzBvq0gkRQIcizeMA4Gc4LI=;
 b=d+5e0rg/nrmzHpbm+8ew9dd+NPhSh0HrKc0K8pJH1tqL4Gi1n149IhzBEZV90oIe0PUdteyetN3oPJHNcgGQiGnjBVSsxPKWMnCuWuM/Xgt3z0Fwv6DVf5Zxmyc/ywgP76rVSnXRfhGCafgbrQsbbMlZZbXbj4v+PMQCULKYPWXI6iGcMtVFmdS8x+byW5i5w1VA1xlDcCkSQ473oeiNz0XWPQXjgG6AlIDcwLGrcisBRQU36u/bZ0mmcOes5eXDam7Me6qvClIu3an3RNiVEtCoAAJYpGPm1oCBlICPyIK+B4VBwVY20Gw1pcKTJbf62SmSsWKky7Cjkti/I8VRbw==
Received: from MN2PR20CA0022.namprd20.prod.outlook.com (2603:10b6:208:e8::35)
 by IA0PPFB67404FBA.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 14 May
 2025 20:05:23 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::76) by MN2PR20CA0022.outlook.office365.com
 (2603:10b6:208:e8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Wed,
 14 May 2025 20:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 20:05:22 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 14 May
 2025 13:05:08 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 13:05:07 -0700
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 14 May 2025 13:05:03 -0700
Date: Wed, 14 May 2025 23:05:02 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Alexey Kardashevskiy <aik@amd.com>,
 <kvm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>, <pbonzini@redhat.com>, 
 <seanjc@google.com>, <alex.williamson@redhat.com>,
 <vivek.kasireddy@intel.com>, <dan.j.williams@intel.com>,
 <yilun.xu@intel.com>, <linux-coco@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <lukas@wunner.de>, <yan.y.zhao@intel.com>,
 <daniel.vetter@ffwll.ch>, <leon@kernel.org>, <baolu.lu@linux.intel.com>,
 <zhenzhong.duan@intel.com>, <tao1.su@intel.com>
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250514230502.6b64da7f.zhiw@nvidia.com>
In-Reply-To: <aCRmoDupzK9zTqFL@yilunxu-OptiPlex-7050>
References: <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <aCRmoDupzK9zTqFL@yilunxu-OptiPlex-7050>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|IA0PPFB67404FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 1083feb4-670c-48c1-b82c-08dd9322a8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CYKDfFJHYYpl8DptySGI40bXgq/o/Q2T1QzDmxgoqc19Vx9qctN0Au8b+2U0?=
 =?us-ascii?Q?FOwKHPBte4GwbLt+sYKl+eYMUdmyj/Q/hi89bafZXyzQtIZgylhytjv50ykJ?=
 =?us-ascii?Q?WNQ2M2xHqcN7Zo3CHxJrnvezigjqsnHyWr8yccuqOf80ySoPefoOqJuUQB9v?=
 =?us-ascii?Q?pJVwwpuzyR9c8e4a3ykXBhY0ux86CrMbpvbKZE/zgXrmNpX24h9tc7BjveLA?=
 =?us-ascii?Q?LzDcCQcS3ntWiWoSWCa+lnQsFuQDmF9FKaJ7/tM7cbA2dpyLxVFQoV6TyxlL?=
 =?us-ascii?Q?xIkI/VQ/A3x+NdufKf+d6JFmfoLncuIWwuaAaS1Lq7nyEth2iaGtI0edoJmG?=
 =?us-ascii?Q?fT9QsLrzBhOQ5BgZ4hUGSKuvZwr3IKRDafwQp28xPqMrrhAlkGQKi3Je/7TG?=
 =?us-ascii?Q?+gw0WKqZWP+YsLBT1a7Lw3EIG6BJ/WHqSA1GemCVPuhLhA9D0JlMnIEwCUdA?=
 =?us-ascii?Q?KwSlCLXBEiQOtxcgNc6wwXO1w9syFtmhMCiKdbGnoHPLxNJX+Z8C5gWYqKZN?=
 =?us-ascii?Q?/BPMvjr/Ddjy4vm8eRrS4w4HkyxplWFcWKkeajjM/UcOBStkjLgNLm7CkCeL?=
 =?us-ascii?Q?y8V0yY3zKWS9jFsdSquuGdAab8CaeF2PW5NIMpnRVx+jaVJlw8PL5ersFasS?=
 =?us-ascii?Q?ERqQxy/Zfcwm/DM5PiHovwWw5yKMUzd8gghXdvflFIxBH46ZwpoxXEI+55J2?=
 =?us-ascii?Q?Hq2ENWNAdOlX3rZ3tRo1UKjkNF6MCN2pogeXmmB60w8HlhiZIwYzSHQA3FYz?=
 =?us-ascii?Q?+KCNariJ0l4W+tKbAjEElNVYJWSVmzuPZKw9jbSCfSNWq/zAyPNUSlZ2VOgV?=
 =?us-ascii?Q?yEvtufC5A28z2uG3+njX4eAPzVCh9ye7wXKAhOxHLaRjoHIx5W1r9Haa2x1x?=
 =?us-ascii?Q?zikZu4h6tdt2ovBol3JnAIq4JbbGNMlddTZ/N4bpx3s23B4hMFECVtuxZT4G?=
 =?us-ascii?Q?6nzcutlrBzYmmL4iQVNGb2sQKrHj3ex70CIXfItF2+W7I8v7XmhZ6b9rUOD/?=
 =?us-ascii?Q?1hPAUsxGHWpYDcIzl4D0F8nw8nqefI9H1WDP/FzKT6QbwhgV5GsI72ruuwe2?=
 =?us-ascii?Q?4kBJaVeSqvuFNlOwcqR3ak8Is8aIS8d4n8tZeWj6GUOFfoC7/syADnjDqjB4?=
 =?us-ascii?Q?oxySzYIYNAOTq7STxNO5ZdLxoaCtu5/tq46eiGvH66IUai6EB79O62wkTgMq?=
 =?us-ascii?Q?F9seK2xR4Qjw6krzJqQHLP2uPS9M4iEsh4GKwZFaGXCElHGvLXL9M0rBKBN8?=
 =?us-ascii?Q?aso2qNNp89gBzKHVtZfGPrErbHymeO3VTW2ZHuCLEtWLQVx6JCAHtaO4J/Dh?=
 =?us-ascii?Q?BT8lAffGspvFJvvq9HvnJMak5h9cYNynvIpoTuVEfXTUW7T2VbjcQPB7jYQq?=
 =?us-ascii?Q?fqLyAJjQssAYr2MAVBpw5Mci/fFUpSJZbOfhZ8YUKWNJxH3U8VZieJRjSZXC?=
 =?us-ascii?Q?SNXcYFJeGz+DNukEniOS6OOW/h0upskxxxvNui79t8358V+i2V5gvJszxhX3?=
 =?us-ascii?Q?3FoeRzcqH1JjkWPVkSEzElwyWCF5ZXMSuzjM?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 20:05:22.2748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1083feb4-670c-48c1-b82c-08dd9322a8af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB67404FBA
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

On Wed, 14 May 2025 17:47:12 +0800
Xu Yilun <yilun.xu@linux.intel.com> wrote:

> On Tue, May 13, 2025 at 01:03:15PM +0300, Zhi Wang wrote:
> > On Mon, 12 May 2025 11:06:17 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> > 
> > > On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy
> > > wrote:
> > > 
> > > > > > I'm surprised by this.. iommufd shouldn't be doing PCI
> > > > > > stuff, it is just about managing the translation control of
> > > > > > the device.
> > > > > 
> > > > > I have a little difficulty to understand. Is TSM bind PCI
> > > > > stuff? To me it is. Host sends PCI TDISP messages via PCI DOE
> > > > > to put the device in TDISP LOCKED state, so that device
> > > > > behaves differently from before. Then why put it in IOMMUFD?
> > > > 
> > > > 
> > > > "TSM bind" sets up the CPU side of it, it binds a VM to a piece
> > > > of IOMMU on the host CPU. The device does not know about the
> > > > VM, it just enables/disables encryption by a request from the
> > > > CPU (those start/stop interface commands). And IOMMUFD won't be
> > > > doing DOE, the platform driver (such as AMD CCP) will. Nothing
> > > > to do for VFIO here.
> > > > 
> > > > We probably should notify VFIO about the state transition but I
> > > > do not know VFIO would want to do in response.
> > > 
> > > We have an awkward fit for what CCA people are doing to the
> > > various Linux APIs. Looking somewhat maximally across all the
> > > arches a "bind" for a CC vPCI device creation operation does:
> > > 
> > >  - Setup the CPU page tables for the VM to have access to the MMIO
> > >  - Revoke hypervisor access to the MMIO
> > >  - Setup the vIOMMU to understand the vPCI device
> > >  - Take over control of some of the IOVA translation, at least for
> > > T=1, and route to the the vIOMMU
> > >  - Register the vPCI with any attestation functions the VM might
> > > use
> > >  - Do some DOE stuff to manage/validate TDSIP/etc
> > > 
> > > So we have interactions of things controlled by PCI, KVM, VFIO,
> > > and iommufd all mushed together.
> > > 
> > > iommufd is the only area that already has a handle to all the
> > > required objects:
> > >  - The physical PCI function
> > >  - The CC vIOMMU object
> > >  - The KVM FD
> > >  - The CC vPCI object
> > > 
> > > Which is why I have been thinking it is the right place to manage
> > > this.
> > > 
> > > It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
> > > stays in VFIO.
> > > 
> > > > > > So your issue is you need to shoot down the dmabuf during
> > > > > > vPCI device destruction?
> > > > > 
> > > > > I assume "vPCI device" refers to assigned device in both
> > > > > shared mode & prvate mode. So no, I need to shoot down the
> > > > > dmabuf during TSM unbind, a.k.a. when assigned device is
> > > > > converting from private to shared. Then recover the dmabuf
> > > > > after TSM unbind. The device could still work in VM in shared
> > > > > mode.
> > > 
> > > What are you trying to protect with this? Is there some intelism
> > > where you can't have references to encrypted MMIO pages?
> > > 
> > 
> > I think it is a matter of design choice. The encrypted MMIO page is
> > related to the TDI context and secure second level translation table
> > (S-EPT). and S-EPT is related to the confidential VM's context.
> > 
> > AMD and ARM have another level of HW control, together
> > with a TSM-owned meta table, can simply mask out the access to those
> > encrypted MMIO pages. Thus, the life cycle of the encrypted
> > mappings in the second level translation table can be de-coupled
> > from the TDI unbound. They can be reaped un-harmfully later by
> > hypervisor in another path.
> > 
> > While on Intel platform, it doesn't have that additional level of
> > HW control by design. Thus, the cleanup of encrypted MMIO page
> > mapping in the S-EPT has to be coupled tightly with TDI context
> > destruction in the TDI unbind process.
> 
> Thanks for the accurate explanation. Yes, in TDX, the
> references/mapping to the encrypted MMIO page means a CoCo-VM owns
> the MMIO page. So TDX firmware won't allow the CC vPCI device (which
> physically owns the MMIO page) unbind/freed from a CoCo-VM, while the
> VM still have the S-EPT mapping.
> 
> AMD doesn't use KVM page table to track CC ownership, so no need to
> interact with KVM.
> 

IMHO, I think it might be helpful that you can picture out what are the
minimum requirements (function/life cycle) to the current IOMMUFD TSM
bind architecture:

1.host tsm_bind (preparation) is in IOMMUFD, triggered by QEMU handling
the TVM-HOST call.
2. TDI acceptance is handled in guest_request() to accept the TDI after
the validation in the TVM)

and which part/where need to be modified in the current architecture to
reach there. Try to fold vendor-specific knowledge as much as possible,
but still keep them modular in the TSM driver and let's see how it looks
like. Maybe some example TSM driver code to demonstrate together with
VFIO dma-buf patch.

If some where is extremely hacky in the TSM driver, let's see how they
can be lift to the upper level or the upper call passes more parameters
to them.

Z.

> Thanks,
> Yilun
> 
> > 
> > If the TDI unbind is triggered in VFIO/IOMMUFD, there has be a
> > cross-module notification to KVM to do cleanup in the S-EPT.
> > 
> > So shooting down the DMABUF object (encrypted MMIO page) means
> > shooting down the S-EPT mapping and recovering the DMABUF object
> > means re-construct the non-encrypted MMIO mapping in the EPT after
> > the TDI is unbound. 
> > 
> > Z.
> > 
> > > > > What I really want is, one SW component to manage MMIO dmabuf,
> > > > > secure iommu & TSM bind/unbind. So easier coordinate these 3
> > > > > operations cause these ops are interconnected according to
> > > > > secure firmware's requirement.
> > > >
> > > > This SW component is QEMU. It knows about FLRs and other config
> > > > space things, it can destroy all these IOMMUFD objects and talk
> > > > to VFIO too, I've tried, so far it is looking easier to manage.
> > > > Thanks,
> > > 
> > > Yes, qemu should be sequencing this. The kernel only needs to
> > > enforce any rules required to keep the system from crashing.
> > > 
> > > Jason
> > > 
> > 
> 

