Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1AAB8CE0
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ECA10E91E;
	Thu, 15 May 2025 16:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oKXpZkj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174C410E91E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zxd+tOy30a156S6tQKVhZ/Xh2gkFvIODkKsY//MyS8e5gJaqgOSF3fKYi8q9aEhuqKsfkKVJrwWXNWX15S66bDnxHYgJMe0q/Xpg8sBhwl4fPf7Z44jj1S+/HbbGgooiXjiG2pgYTdlPoS213y+6LNSp6s5N2k761R+S01jm0LOXAjUHOuZqjQLwuoHBeGZzhIJSeRcSqGhJIOVQYr2JLBlIPc3ZElmBF1ayauG291E90KD7NJO8FjhseMBZ15W/Waz/EpTmtwRLc4nu5uGc0ge27njXZ17BoWwaDgTHICqNV6T94u9Q5Kh85+Z4hAKAAJa5/uC7wP5/kH+AjNtcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuloNeOJuA4LuWsQxkm/ZW0xgxn9hOyd9bN7zUfd0a8=;
 b=pxsAM+RlUOkSrySP/j2vtGTv4Er2B55XTp7+GeFeOd/MhVZ+xtUhs+nIoPpoPXD7CVqjYIVau0gsuyxgLzPdVTZjMv53JtU93jUM3j+v281fgWkhlX+Hn3vjTnW2IpEOmKP3LCZo6C9L7+o1qrZCnJAmud4OtenffKxHXV8f7cHNhkDqWAhxe0tn+1526UZLLlZwour0oiSaBpTnFMrkfMhu711ocBZhPDs0vgW96w+DDfkLUrTcQgByrIjOkbLMsRyZxx4iMagxN+O067qQ/zF6GqH/F+GyZ8r6DXWM75HjxHD4lBPZHWjCK6TQ+zyn3+EcZCDGR09wN5uUyf2r+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuloNeOJuA4LuWsQxkm/ZW0xgxn9hOyd9bN7zUfd0a8=;
 b=oKXpZkj1CrOXNUXefYQxWrCTohpzHoIhyz0m0xBSajEXSkxyDLDHC2fAlbsE4k3d0sjB9YAVldVLTQJb2OgHpcI+8Ou1nDSr2vvJQWW0lrIqNHMeDC3k/qudZZTLFMWpDbVzX+CJfIv8WE03H/+/KxCEP7jJ4UXS3QYUtFtGBt1RTW7Lr1mUQ/EYQDzP8B8+Y4Q5wsSv7O8g0m3nL4b1EfT2zFJTZzns6SDEXGOZ3XupvnpOBRvsF9VRdm6DINa8/JotwuSc7CgZ9J8nbhIG6JPWXH5uy8xJOki+aBXiwHevSp53DDIS1HTTpgf9eeVm52li2ODCtLKST6HNJFrs5w==
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 16:53:57 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::8f) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Thu,
 15 May 2025 16:53:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 16:53:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 15 May
 2025 09:53:37 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 09:53:36 -0700
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 15 May 2025 09:53:31 -0700
Date: Thu, 15 May 2025 19:53:30 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "vivek.kasireddy@intel.com"
 <vivek.kasireddy@intel.com>, "dan.j.williams@intel.com"
 <dan.j.williams@intel.com>, "yilun.xu@intel.com" <yilun.xu@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lukas@wunner.de" <lukas@wunner.de>, "yan.y.zhao@intel.com"
 <yan.y.zhao@intel.com>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "leon@kernel.org" <leon@kernel.org>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "zhenzhong.duan@intel.com"
 <zhenzhong.duan@intel.com>, "tao1.su@intel.com" <tao1.su@intel.com>
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250515195330.1d63be34.zhiw@nvidia.com>
In-Reply-To: <dce6c363-20ea-49b2-9cd1-9cc5e697162a@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <8bc605ad-54ad-4d3a-9547-caa9d15887f2@amd.com>
 <dce6c363-20ea-49b2-9cd1-9cc5e697162a@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 59726472-cba1-4ab9-eaee-08dd93d1155b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXVJTUQxSHNOblEvU0hOVzQzTlFwL0UwRkg3cjliVTBtcTM4TGV2N09nVzht?=
 =?utf-8?B?WWpPaDhlQzNVb0x6THY3VzFld3N3TmdCNCs0L0QrYWphUGZ4N05PK2VXTFFa?=
 =?utf-8?B?WHhJMERpQTQ5YWwwczBlR2RGTW85M0EwNEZ6eXBSajVQMzdzNTZ4WWdLWFpx?=
 =?utf-8?B?UHUweGRCeVRDVFUzV1lmN3FNTEdybGY5ZG9CSG1JRjVYMTZ3MFR4N3FEYzEz?=
 =?utf-8?B?enZucXdLQjQ4eERWRTY5YUwxZ2hSTDNwY1o5K2RLVWk1bnVqNkNydnZzZVZC?=
 =?utf-8?B?eTdaSldrTDlUUHgwdUQrelRtNXFXSFhOM0c3SnQ4eHdwOHkzKy9NaFZNcmho?=
 =?utf-8?B?Q2pjWFJQYjFIK2JUSnVxcUN3MUJEaFhQMHltRGZ0Rm80eUVLRXpBdWRESG8r?=
 =?utf-8?B?c1psUzlsVm15S1ZENlZQMHpCOEdGVlZ1VTkyaEJCZnlLd3lvakFsVzdMRjJ6?=
 =?utf-8?B?RFFQdkNZYm1iMHBKVjY4WDVvc2dwUVRpU25VVGdHc1R6bGllT2RRRGhtbzdn?=
 =?utf-8?B?MWRNZ0dycGNzUnZPOFQxbWZnM1ZINGg5YjFJNUhCL2ZPL1V1NjdTa2pJUTVV?=
 =?utf-8?B?akdaWFF0THAwQ1JvcnpIaGhkNFhBcFRDSHhSVG15b3BYdGdhNUFRMkpRSjhz?=
 =?utf-8?B?TEFsNmczMWpRckZtWjRZMTFuR3laREVnaHpEL2hxcFFOVUZObDNXUk10ckVS?=
 =?utf-8?B?RnR4T2wvY0t5TVFhUUN4NWxaYVlrYjZ6WjlqM3VyeWhwMFR5Q3VDSmtyZ282?=
 =?utf-8?B?RklTelhSYkFDcElySWRKTW1Sd1lnY01CcXhYR3dNbGpOUkxoZHhGS0JTblcv?=
 =?utf-8?B?L0EwT2sxQ2NtL21KSGFNVlFZSXFtQnBiRE9wdVpDdndtK3R5VlhhSXhNN1pv?=
 =?utf-8?B?VEQra3o2NGcreVo0ankwcmh0L2Npc1M3eERzYlhZMDY3ZGpYUnlOWkFPemRD?=
 =?utf-8?B?dE16MjFJODFNTWZ0WEM2WndBelNNdTV2U0NNQUNSczJ5cVU4b3FOU1B5dGRl?=
 =?utf-8?B?eUo1endBaUkwQWpXRW9SRjFjMzJUQVpvcXRsdkU1UTI1V0VEZmhlSExKQ0Jh?=
 =?utf-8?B?Myt5QzJwSjdWOVNyRkdsYkJpNnVvdTNqQWluK2J0UUUvdUZhU1hmSS9lYVh3?=
 =?utf-8?B?M1ovRkZtb2V5L2xFeGlvYzAwMExySkpxdlIrdnJBbU51OThpZ0xRR3VmMElx?=
 =?utf-8?B?cW1LT2pza3Z6ZDRJcHpjTUwzWHlqSnIwUkxGVHhQQTJrWm9QbDFVeHEzVXRQ?=
 =?utf-8?B?YXZLbTY4a1BzN3BodzlBQWJOYjBrWUJZZmdGUmNFSXZqdS9kcmZzV1AydlFk?=
 =?utf-8?B?UG1MZVlLQ3E1Sy93b0NHSXo2c0Z4bnNtMis4ejF6dFZqdEdXenkwUWtYa3Vm?=
 =?utf-8?B?c2NXempPTGdrRys0ZjNKUXdsL0ZzSXhPd0lnVFJYSXVNWXFyejVqbmRyOWVT?=
 =?utf-8?B?Ym83SEFxZXFJZFVRL203NXlXam1oWFBVWHJFL3UyQlFLUmFFM1phc21vVTdD?=
 =?utf-8?B?a1gwVTkyOXpsUXRoWFRGbFI4ckE2ekdzckZya1hvTFRlT0pKT0szRGZmbmp2?=
 =?utf-8?B?aFpja1UxV0x4bTZ5L0tzbUNpdXZMRkdlRHZ2ZGZJN0djNW1UbVM4T0VMeUo1?=
 =?utf-8?B?MXhnQlpWUWxWVFVndzUvK1VOVlF3cFJDN3RDTWVsR2N4OTZVb0Fsbnp6aHhZ?=
 =?utf-8?B?WVFENDFDVU1ScDk2M1p4eFlVUkh6cDI5QWVKQ1BmUytUZjMxSytGdndSeFdQ?=
 =?utf-8?B?MTBvWWVEUklTSVBPVWJwYWJzWjljaWJTZXJXK1FKTU0wNDBzN0U5V0JZVXVD?=
 =?utf-8?B?cktGOWJwamVKVGlwelNZcDhYT2FKOGhEdHZ4MElZbjZvYzR2RWpQVzdIY0Fp?=
 =?utf-8?B?QTlCcFhXdTd4YmZqSFFxc1RVMTVvRUJZWDhiYzM0R0tteGdwU0JxR05nK1I5?=
 =?utf-8?B?bWR4QWpwNjY0Umx3TmNUVVdKSFBvYlMwM0V3NHBxem9iREtQVmVKaUNzbi9l?=
 =?utf-8?B?UWZKdTc0cmdRZEdrYmlmMVRGbTdIbzFVc3UvWlZra0lzSXZ3VmNUNFVRcU9V?=
 =?utf-8?Q?4O2UiE?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:53:57.1903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59726472-cba1-4ab9-eaee-08dd93d1155b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
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

On Thu, 15 May 2025 16:44:47 +0000
Zhi Wang <zhiw@nvidia.com> wrote:

> On 15.5.2025 13.29, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 13/5/25 20:03, Zhi Wang wrote:
> >> On Mon, 12 May 2025 11:06:17 -0300
> >> Jason Gunthorpe <jgg@nvidia.com> wrote:
> >>
> >>> On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy
> >>> wrote:
> >>>
> >>>>>> I'm surprised by this.. iommufd shouldn't be doing PCI stuff,
> >>>>>> it is just about managing the translation control of the
> >>>>>> device.
> >>>>>
> >>>>> I have a little difficulty to understand. Is TSM bind PCI stuff?
> >>>>> To me it is. Host sends PCI TDISP messages via PCI DOE to put
> >>>>> the device in TDISP LOCKED state, so that device behaves
> >>>>> differently from before. Then why put it in IOMMUFD?
> >>>>
> >>>>
> >>>> "TSM bind" sets up the CPU side of it, it binds a VM to a piece
> >>>> of IOMMU on the host CPU. The device does not know about the VM,
> >>>> it just enables/disables encryption by a request from the CPU
> >>>> (those start/stop interface commands). And IOMMUFD won't be
> >>>> doing DOE, the platform driver (such as AMD CCP) will. Nothing
> >>>> to do for VFIO here.
> >>>>
> >>>> We probably should notify VFIO about the state transition but I
> >>>> do not know VFIO would want to do in response.
> >>>
> >>> We have an awkward fit for what CCA people are doing to the
> >>> various Linux APIs. Looking somewhat maximally across all the
> >>> arches a "bind" for a CC vPCI device creation operation does:
> >>>
> >>> =C2=A0 - Setup the CPU page tables for the VM to have access to the
> >>> MMIO
> >>> =C2=A0 - Revoke hypervisor access to the MMIO
> >>> =C2=A0 - Setup the vIOMMU to understand the vPCI device
> >>> =C2=A0 - Take over control of some of the IOVA translation, at least
> >>> for T=3D1, and route to the the vIOMMU
> >>> =C2=A0 - Register the vPCI with any attestation functions the VM might
> >>> use
> >>> =C2=A0 - Do some DOE stuff to manage/validate TDSIP/etc
> >>>
> >>> So we have interactions of things controlled by PCI, KVM, VFIO,
> >>> and iommufd all mushed together.
> >>>
> >>> iommufd is the only area that already has a handle to all the
> >>> required objects:
> >>> =C2=A0 - The physical PCI function
> >>> =C2=A0 - The CC vIOMMU object
> >>> =C2=A0 - The KVM FD
> >>> =C2=A0 - The CC vPCI object
> >>>
> >>> Which is why I have been thinking it is the right place to manage
> >>> this.
> >>>
> >>> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
> >>> stays in VFIO.
> >>>
> >>>>>> So your issue is you need to shoot down the dmabuf during vPCI
> >>>>>> device destruction?
> >>>>>
> >>>>> I assume "vPCI device" refers to assigned device in both shared
> >>>>> mode & prvate mode. So no, I need to shoot down the dmabuf
> >>>>> during TSM unbind, a.k.a. when assigned device is converting
> >>>>> from private to shared. Then recover the dmabuf after TSM
> >>>>> unbind. The device could still work in VM in shared mode.
> >>>
> >>> What are you trying to protect with this? Is there some intelism
> >>> where you can't have references to encrypted MMIO pages?
> >>>
> >>
> >> I think it is a matter of design choice. The encrypted MMIO page is
> >> related to the TDI context and secure second level translation
> >> table (S-EPT). and S-EPT is related to the confidential VM's
> >> context.
> >>
> >> AMD and ARM have another level of HW control, together
> >> with a TSM-owned meta table, can simply mask out the access to
> >> those encrypted MMIO pages. Thus, the life cycle of the encrypted
> >> mappings in the second level translation table can be de-coupled
> >> from the TDI unbound. They can be reaped un-harmfully later by
> >> hypervisor in another path.
> >>
> >> While on Intel platform, it doesn't have that additional level of
> >> HW control by design. Thus, the cleanup of encrypted MMIO page
> >> mapping in the S-EPT has to be coupled tightly with TDI context
> >> destruction in the TDI unbind process.
> >>
> >> If the TDI unbind is triggered in VFIO/IOMMUFD, there has be a
> >> cross-module notification to KVM to do cleanup in the S-EPT.
> >=20
> > QEMU should know about this unbind and can tell KVM about it too.
> > No cross module notification needed, it is not a hot path.
> >=20
>=20
> Yes. QEMU knows almost everything important, it can do the required
> flow and kernel can enforce the requirements. There shouldn't be
> problem at runtime.
>=20
> But if QEMU crashes, what are left there are only fd closing paths
> and objects that fds represent in the kernel. The modules those fds
> belongs need to solve the dependencies of tearing down objects
> without the help of QEMU.
>=20
> There will be private MMIO dmabuf fds, VFIO fds, IOMMU device fd, KVM
> fds at that time. Who should trigger the TDI unbind at this time?
>=20
> I think it should be triggered in the vdevice teardown path in IOMMUfd
> fd closing path, as it is where the bind is initiated.
>=20
> iommufd vdevice tear down (iommu fd closing path)
>      ----> tsm_tdi_unbind
>          ----> intel_tsm_tdi_unbind
>              ...
>              ----> private MMIO un-maping in KVM
>                  ----> cleanup private MMIO mapping in S-EPT and
> others ----> signal MMIO dmabuf can be safely removed.
>                         ^TVM teardown path (dmabuf uninstall path)
> checks this state and wait before it can decrease the
>                         dmabuf fd refcount
>              ...
>          ----> KVM TVM fd put
>      ----> continue iommufd vdevice teardown.
>=20
> Also, I think we need:
>=20
> iommufd vdevice TSM bind
>      ---> tsm_tdi_bind
>          ----> intel_tsm_tdi_bind
>              ...
>              ----> KVM TVM fd get

ident problem, I mean KVM TVM fd is in tsm_tdi_bind(). I saw your code
has already had it there.

>              ...
>=20
> Z.
>=20
> >=20
> >> So shooting down the DMABUF object (encrypted MMIO page) means
> >> shooting down the S-EPT mapping and recovering the DMABUF object
> >> means re-construct the non-encrypted MMIO mapping in the EPT after
> >> the TDI is unbound.
> >=20
> > This is definitely QEMU's job to re-mmap MMIO to the userspace (as
> > it does for non-trusted devices today) so later on nested page
> > fault could fill the nested PTE. Thanks,
> >=20
> >=20
> >>
> >> Z.
> >>
> >>>>> What I really want is, one SW component to manage MMIO dmabuf,
> >>>>> secure iommu & TSM bind/unbind. So easier coordinate these 3
> >>>>> operations cause these ops are interconnected according to
> >>>>> secure firmware's requirement.
> >>>>
> >>>> This SW component is QEMU. It knows about FLRs and other config
> >>>> space things, it can destroy all these IOMMUFD objects and talk
> >>>> to VFIO too, I've tried, so far it is looking easier to manage.
> >>>> Thanks,
> >>>
> >>> Yes, qemu should be sequencing this. The kernel only needs to
> >>> enforce any rules required to keep the system from crashing.
> >>>
> >>> Jason
> >>>
> >>
> >=20
>=20

