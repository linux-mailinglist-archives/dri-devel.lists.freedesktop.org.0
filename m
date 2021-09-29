Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB8E41CC2B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 20:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE376EAD8;
	Wed, 29 Sep 2021 18:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F4A6EAD7;
 Wed, 29 Sep 2021 18:55:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvfEOkr4zvOa4vl1vthN54iEgMaNOjjI7TyNvR5n1uPq48J2MHYR2tp9BcSgJgZfqEoKui01AtuwKX6697FqkOcF8Yg72O1xZW926x/DGDeE4U9X7xDmq7OLQY4URAJzPoSVvOF32I/MQ3LIdyS9gmUtSKjAc4A2zYr0sdKWgfXg3LBUA3gC74Pf3lmlqxkjYcNilLJn5TphhzA65t5HyqU71g3ykFG96ep8DkMZazYzmufCThdycKZSvHbiz56ht32U1RC6phZRauPEeT346fXMaGx0N1ZqsFhdiJrFSGwhrqsRbOf17j78xBpN58nybLSt4XIqan8zyYVmlg38zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YvwwBJqJxbCSUrMjIoXJYVRepxBaK1dYcnPDEjaDFEw=;
 b=S1L8JGgZ784DNv10/+nzIkp2iib3P56h8N+l5UFWu3TGGVypOvHREHKkFG24JzR7yBkE9ZSkzfs2IqT2hWVY1Vy85VfnaBYsxQw2tCQ/VcZhtpXtxmwfns6fXmjozQfZtdkDGT4K/6zf3hyc5LwiuuauXXAtDVWRL8gdEAH3zYSylwbKhQm7bdi6DS413fDYjCj9JcjtQbzNUZXeQYbQvyUSigDYPlfl77AMVX27MdPvMC3VuWOFzy0oPFco07pXR8NkahKGi33gl84idlOrwBXDM4QiR4vkVSMqoYUx5/sUHI88VhTZcnMH2NMYlJ+4OWe/EHKOmYFKz85JelwQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvwwBJqJxbCSUrMjIoXJYVRepxBaK1dYcnPDEjaDFEw=;
 b=jyUJtjZAeOpjVNmBiwtKdJUtR/7ZXp6J3w6qC1Q3owKkkfe7D/nSehi9ulYoYYIMtYrPuvId64cEMEDE3dR25QXIA3OyblVehX0mK1u9JS1b0rAgG+b17sGGJKYtG1k6KTnxotL1lgigpd+lumLLUrgEPDx5Mx1wvFtQpe02bR1QDmQf6e3Q2zbG9f0uw/BlStf3qaUm7E3vEKcfithQDkwW4mpsgwkcC8rj9oXvgAk3x/Jp7g8cRZl+YjJbaEZ3JPvWexIvFmD98X6EnTkPpw4quNW5yWZ8Ebum4f9snMdbiJWLz/zHCl3+PtxU6eyWu9+oc94ros1LIGvElRGNnw==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5158.namprd12.prod.outlook.com (2603:10b6:208:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 18:55:43 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 18:55:42 +0000
Date: Wed, 29 Sep 2021 15:55:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210929185541.GW964074@nvidia.com>
References: <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com>
 <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
 <20210928150507.GM964074@nvidia.com>
 <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
X-ClientProxiedBy: BL1PR13CA0301.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::6) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0301.namprd13.prod.outlook.com (2603:10b6:208:2c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.12 via Frontend Transport; Wed, 29 Sep 2021 18:55:42 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mVek1-007eNP-Vj; Wed, 29 Sep 2021 15:55:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b1b814-fe1f-4f62-bfa7-08d9837abcdd
X-MS-TrafficTypeDiagnostic: BL1PR12MB5158:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5158FD829BEA36AC25C78E1DC2A99@BL1PR12MB5158.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DD9MMc6IK4IpGpX73nGBj3hG84kQR/JBZc0GklsBjLGoEjfh7Hu8KvAdiv6qRuV47U7e8IUjkC/gpMEq2Si5CFsyCV0AEtUZhWQ5KhnHUMR4T1wC/y6BizukvdMw9XiJ3lOAcSHp2E86EThvPt/KIosU+d3zHFlPdCVEPmtw+UrgkL5UI+zFgn3bYCur5Sw5AFfdar24K8hKKa9F229BPxs913Qf1Dk9nJoLXLriBdOgMcp1cQd6cVmxJjv6Ftvn3DPntJwuFWX5s1Z0qZEJu6+WTGUPMS1hy4+uAFvxp6PlSwkKTZoQTMTc1rEWu3BAG/l+8I42++biE6oEp5VgTo40DFGMd5Rzv04bZaFbrzDnn7zchgBQ+QxMoQvtPAJ0ijMV3zqvJU7ZOh3zNueYMH0z5qrqXUXd7e6jYdRdXr8PpXKFDnB1ZL1y6g3vNtcZiUVf7oprW86IFdIiq7k3aKjx5moPjOxwT/vXOLRBNoEIm0+xKroqs7ZGJ+Awrb9ITv6oML9iEQshdcqSZvus2F7I9Do2aMlbIWfepmuIGXC0EwwJrJzEPI7q3vDBw9FCsjrL1zf1hx0kXbKJ8cm3w2mVXtTTMWI/To8IcGD+iIKz+JuKczJpSoTtBWwmtVdzdYakwaANmlU8MaggmqRAAwr911f5a8ku0fHQNGj96Sp9ZTrB017FK4iHshDbx1VSzqEd/8dGxDeiO4dSNc/sGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(54906003)(53546011)(508600001)(5660300002)(316002)(1076003)(2906002)(66556008)(186003)(9786002)(36756003)(4326008)(8936002)(8676002)(66946007)(33656002)(2616005)(7416002)(6916009)(83380400001)(66476007)(426003)(86362001)(38100700002)(9746002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FPXaFNRgGk7n+jhy3PjT0+xLZr+gHD2teAQ1dTYJZk5zsrsb3yFm8Rao7Riw?=
 =?us-ascii?Q?2qDJ9nNTrR3x87cZsPYXaD/tcWY/En6b0SfTVWWQk4WSkkicy9NEJxPT0kfA?=
 =?us-ascii?Q?K4FNBI73iIYn5qBPLD+yGMQVcOtpdXXFhOy2W/Kphr9pedI34QOkSG9Hti27?=
 =?us-ascii?Q?OB41PhOMMxQXm64bXehLbY3LtIAv/kUr4OAvcR0+KCRKQjKb5mEoDRb/MZ03?=
 =?us-ascii?Q?A1r1jRgkDP6ULUdgKlpDObb8ZNTsTEcRbwRTHSF1kYm1Np8d+sRAdHm3R4uS?=
 =?us-ascii?Q?Rbvyu5yqmOBNVpOYqKO75aEH7XMncAe7fWyCF/Ey5g6/Dt/mppLChUrolICY?=
 =?us-ascii?Q?LKFJLinJngRezRn8gdyJBJtmHKXvFOJ26Nz2E7boFoAAFfLlXHXSIlcN0wqK?=
 =?us-ascii?Q?5eGG4tyb4Hlg4s54Owyqw/f2/VIC1i2tVU5b9KqQ2t9sGnMiPpFWpHRTo9dV?=
 =?us-ascii?Q?hzypliLrrfwyoy0rnos07dLlYVnUGqHqg0H51NB8rMVrY4iXlZGIxUdj52HO?=
 =?us-ascii?Q?tglCv+/8OlZxbHak3iIRYzQBvYcgr5HvLw5GzGLjJ1JcDsi1rlVaC/qgIJFC?=
 =?us-ascii?Q?7vOEas8oyfBUKXL9PC0FrgYiUzLuZqzcMziq+DY7Ab0b4ff1H4iGIPqVMCJW?=
 =?us-ascii?Q?YTEGQmqrQsvF/ytO8CQEZR7XpXit1VlJ9W9fwVwmNNe7lpawAHZrX/+vioA0?=
 =?us-ascii?Q?W2Wl5WhNJcS3FUu1F5iTkyaObK4m2McvCWqxf2VTovfYh6R5I1hgWmyW9e6M?=
 =?us-ascii?Q?SLPoHQS8QheOeoYzZQVs8/bEJxpvFZsrOZ5EpMdj10K6cu3LAsmXz7iNv7FZ?=
 =?us-ascii?Q?8dh8zq++faHmsTC5lWfinag4CD5YpYFYR/7/64xw1kld3YCFyRW2g8qk9ocB?=
 =?us-ascii?Q?wnTE8iRGzUoBK6ynGpXRkiReFJv53ldDd5nABhbZb+iG3azVzZ/prGR1sbYX?=
 =?us-ascii?Q?h18bypSZIA+klZNESoplMIN4YnOIC89/fNGTDdMK/3kFTsxa931fgsqU15uq?=
 =?us-ascii?Q?brZsX39Rh9kgEM9Vhb2w+8/JVju/wGr4L/zK7TzhfmWrPW3wMGzVMSQw7MkK?=
 =?us-ascii?Q?2QBPACTlZjDkoVNsWpDoFcFFuDETXKxbvL32PAY9PIiwq+BZcUoFjh+S+O+8?=
 =?us-ascii?Q?ZFgBC6riawGsNy0LSIQyHlAlfhD2jY6QVU6MbbzKABRTEzvPXE17cJUxXIX5?=
 =?us-ascii?Q?dz4TGCeq6c+/gyTe4hdRh3TCHdsTIck4uq9sspuykXjSowUST+Q81wvahkzY?=
 =?us-ascii?Q?VYQzwcMKpCbIiY1NadSnt7AZd8Xq+aS2R0gAGmEnBafULTA8eryQxUuEwAzS?=
 =?us-ascii?Q?BxQib5alCvo6sBc55DEI5SCY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b1b814-fe1f-4f62-bfa7-08d9837abcdd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 18:55:42.9007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5r0wJpETa3q69/4wUDgC8u9zu7YK7n7yd0rP+MxR2TyXNIBiPUpjwri2Fahv6tK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5158
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

On Wed, Sep 29, 2021 at 06:27:16PM +0000, Wang, Zhi A wrote:
> On 9/28/21 3:05 PM, Jason Gunthorpe wrote:
> > On Tue, Sep 28, 2021 at 02:35:06PM +0000, Wang, Zhi A wrote:
> >
> >> Yes. I was thinking of the possibility of putting off some work later so
> >> that we don't need to make a lot of changes. GVT-g needs to take a
> >> snapshot of GPU registers as the initial virtual states for other vGPUs,
> >> which requires the initialization happens at a certain early time of
> >> initialization of i915. I was thinking maybe we can take other patches
> >> from Christoph like "de-virtualize*" except this one because currently
> >> we have to maintain a TEST-ONLY patch on our tree to prevent i915 built
> >> as kernel module.
> > How about just capture these registers in the main module/device and
> > not try so hard to isolate it to the gvt stuff?
> 
> Hi Jason:
> 
> Thanks for the idea. I am not sure i915 guys would take this idea since 
> that it's only for GVT-g, i915 doesn't use this at all. We need to take 
> a snapshot of both PCI configuration space and MMIO registers before 
> i915 driver starts to touch the HW.

Given the code is already linked into i915 I don't see there is much
to object to here. It can remain conditional on the kernel parameter
as today.

As a general philosophy this would all be much less strange if the
mdev .ko is truely optional. It should be cleanly seperate from its
base device and never request_module'd..

In this case auxiliary device might be a good option, have i915 create
one and the mdev module be loaded against it.

In the mean time is there some shortcut to get this series to move
ahead? Is patch 4 essential to the rest of the series?

A really awful hack would be to push the pci_driver_register into a
WQ so that the request_module is guarenteed to not be part of the
module_init callchain.

> Also I was thinking if moving gvt into kvmgt.ko is the right direction. 
> It seems the module loading system in kernel is not designed for "module 
> A loading module B, which needs symbols from module A, in the 
> initialization path of module A".

Of course not, that is a circular module dependency, it should not be
that way. The SW layers need to be clean and orderly - meaning the
i915 module needs to have the minimal amount of code to support the
mdev module.

Jason
