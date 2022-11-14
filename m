Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071762826C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4EF10E0C5;
	Mon, 14 Nov 2022 14:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0510E0BC;
 Mon, 14 Nov 2022 14:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHqkuchDTBQGkmn1geW0k1PHuZIF9FBHPsn+o7B7EPybCRa9XZ+FmjBnpBM06Phm/yb2at3ktcTPbFuBgDja7AmUhUMo6ftZk8BEAkdu9EEaJUPyYdptEFniIhS8r5wO9NprOnhUi6kZKM95349rFv37SPHkuyIcvHihZohOS7RBcF223Y6+9ySc5GgSVrg4r1Xlk2oJ2Fi2VXpj9aKMUZDFnjxeaW5FGiT9qT5g/IQnOnC10LOVrSVaS6eIeNxxfQYaTMuc/UTEbTF52RlEBfXhXfOobV9oANWAxrdz+Tbuo3hY6axQQsOHtkIXfR+bC30LzgOAE/XkKiHiXsHO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOflxrAuFEFahPkY/8FItOR1D/JtKkWgHb56I4RIqPo=;
 b=kbiuT5Nry+nqmuopNwUdMnosO1W+YrbeV2wG5FWdYhcFRPMiNgEZEuj44NzcTtu3vMRxrvVT36AGiJCXVIzgNIHIfxIkh2WPKNel97GSI+mEargS2ZIQLRcr/E/B0C2mYoXY8Q0WUpIPBh9+ic6+3Fa2OrBd06aeaKsVE9gE3xlPA6jUkRdXoI1UC9lk9O4HIy4YogXEIl18u+ubqCGzSkb3aXMV7qTWq3x1+mp0Ig1XgpYIcQmcT6Ywf2t+owInVcLTJM4l9wtPNY4iYh77dvNijhvHJ/L8PMIFrFbkNFoyWzV2d7NLc37DTkk8DzcezzebuKrbVRXuF5mG/98cCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOflxrAuFEFahPkY/8FItOR1D/JtKkWgHb56I4RIqPo=;
 b=cw3bAUux4zLhRk+mEgyQnmCVFvh7XzNliDlw9D7tJ/Hvv1L0f1p84nWnFYBsXpwF5POnGIDOsOBZl3G44iAgx67/YUQceeLbukvz1QQ4hwhSRHD0jjAmaEqgvzTPaIbLcpB3SU/+ErTyUTAH57jJSR3Ez+4FOZ5Pq4mXLuZwk3ur/cAf/H9y4OlmlvPBn7+r7jfBPKkcd7Par+HeWGWR30MGeFMgMzfvBjWy3giEFginXH8/4wnBCWwr+B0dzvhINIh1NzY+oFA/Q4Lwd2NjBRNNrVYOkF7Hvfs/a/sISC1hNC9q5hv8hncJXKI2Fm1rWimbq1XgyTPySwc/g5ov4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 14:23:36 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:23:36 +0000
Date: Mon, 14 Nov 2022 10:23:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y3JPZwEHjGDU4Oyq@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <f54c2a93-539f-4520-0561-fbe5cea7772f@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f54c2a93-539f-4520-0561-fbe5cea7772f@linux.ibm.com>
X-ClientProxiedBy: MN2PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:208:23b::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f406f3c-90b0-400c-5e10-08dac64bd146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7u/C852C+L5RwoCbs4t51+j0dyRmUI7oIRPKCadvkricy3+kfPopRAZ4f7LNxtqi4ihXFzzhD8R8kNCI+ZUQEdhn/4Qk3PcaGRL/1nABVmxnl78xKTcpDeMDi24BMmObaKy6r9fyY0Py1adbc+0NyfiGlaqEKEWSjF3tpgmxMgcqRpfDx+1LNhw2Sco7kC8xkBJaQrCfO3YiTuToGElSMSRgbuSnnUtgGWieC8L8/ea8ujkBtAFL7i76eTkae7rLfdJAD/W3HvP6pIxKHAbvGjWWlR+lgLDS0NbCIM2oipDizELpRRZWfc8sjgdAH9oaLS1YKnjDq4Nnxdxz204GmoNMN3Wc4H6yagHvpcoKnPw9oLnzTZSbCgB1flgLyJBdQsVWDoh72Z2kSggTY73Ws1YyEvWYSNHKnTb2zLEfnZovXkPd33P/ipW82DPWzsuQnG/RH3Mwhzz1taYNV1+xhwl4imVn3BxgABKbeJ3s1Rs6bCQV7njq2q+2V6DV2pjoylfIwVfzeiJzk6fznGNr1fSHRg6AaZd4tT1Ev+0jk9zreJT6f/ikfjsRrBcPgTGQZZy3zo7WJ4EX1I0izJ5qaIdNpudutINpEzEM0adD/B0O98uh00ZJxIxVPv30xJCM5iYt/xf0EYibVyU9OynDS+YdV4NPmBVVE9c42/t7dvZTfdil/nV5GpQIGyPuUh6zETa8a7/4eNZT+y6UGMPBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199015)(2906002)(41300700001)(8936002)(2616005)(5660300002)(186003)(86362001)(7406005)(7416002)(36756003)(6506007)(8676002)(66556008)(4326008)(66946007)(66476007)(54906003)(316002)(6916009)(6512007)(478600001)(83380400001)(26005)(38100700002)(53546011)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3kTfEnHqvnK24X1cG5nriTcNOlNAORG48kj85yyd/gf0++C7+ppPskW2n3N5?=
 =?us-ascii?Q?RLb0Sn7hEgbgf521jALZjMpglceM3+Jbzi8JyoW7i4E1zURhOZEonbP86jPl?=
 =?us-ascii?Q?osUyFYjsRxg2TSHdZ14bqDuWEx4G2A+sE+LiieDQzDMnFmwfgxHeGFkEqN4j?=
 =?us-ascii?Q?Z2vVyrhOQiRlIjElJ0tLMHeGXtWzjLZg4iRvE36ZtH3CORR0mi4G6B2yR9WV?=
 =?us-ascii?Q?1x1+DpADITwMBt7yQ8nWkrEhygAasJVu6wNIH7PluQbKmlJaIvNy+PW9q9Mr?=
 =?us-ascii?Q?yhHx+4nNqmlOqWlnJrSVF4uZjGa6R5EONQ0Xt414CdM5fSW0Xpu5e6fLBKYD?=
 =?us-ascii?Q?BxIBiBtsGF0QcpdSIKbNexUxzHK2q268pFwxcniRI6wda1qApngi1Se092lk?=
 =?us-ascii?Q?ObdNMVknkm/DE0lSKvdPcp1oCeB1pYj8yZh4YEV5VOGXS/po5/n9EHTRwMdT?=
 =?us-ascii?Q?ALJWasncY69d893FkYBznFGNBJltwA30ehsBhUZOn4t3st61j0d/j3tJgQZD?=
 =?us-ascii?Q?wgOnPRTFTbWugoefRNOH6iiZ3QAy3PokdhRcHXu4Toxq5Wh2zLyqqXFSYq+R?=
 =?us-ascii?Q?NtULuKNzP0AxF0mFBKU63SWloJpRu+AgupkYrBLVD8oNN8KuWUiBMgqSxRVY?=
 =?us-ascii?Q?L7ykEsty25z6WAylF7RbJz0cGaq2EbR+0Q6tA4uEFNyabd9gF1hDmXgOGpUF?=
 =?us-ascii?Q?1JoH0PxfAiIU1vqi7NnAUmfLc1O0ycxhbTFT46J3OYztglWGgKsoRDAPYCqX?=
 =?us-ascii?Q?InCz8S1QZ+sN3d8uhisM85oNxUvU0Slw4i9mc6n+D8E4Zx+hgNGCoX8wN+4P?=
 =?us-ascii?Q?mL3gQge28HcWAX5j4xbEnES6pe4rpMlPXfzxkUCrPGqOg9tIkowiGPugUfRz?=
 =?us-ascii?Q?eNIGmgK0sfWcShmpXNMtLIIYEp3jTn6nXRpax4+MG4LKkmzCoMgnyGAMgpSk?=
 =?us-ascii?Q?SsCZITDpX/jLbM5oe4OWimi712nVjXHrj/UvfMeQle7Z8+TLG9G2FjSvUrV4?=
 =?us-ascii?Q?OjwVuWspWf6E0XwAm5mEt6MoOwOCfSpUKbxD/461WI8/Sg0XufoaP+m56YoV?=
 =?us-ascii?Q?b5oZxJP6AwygbyKHNoDwarmhEEw41Jl2NYCPrJVKrubspVnksHVGhc23RdaW?=
 =?us-ascii?Q?29hoORvsaFHjmjDw1R7f1iUTp+pf8cbQK57D05EXuvw0trN1Ljueb3MIwv9T?=
 =?us-ascii?Q?BwyBvzJzQHxlXRbHhakKJ55+8qjVGnxrfo19sHT2l28hcO5DUCfVYy3GKPOe?=
 =?us-ascii?Q?AJ2JkNpFKNcRgQJjGSvDRju+PHK1wNiSQ0Rn4BSCnUn0Zum2YmlPrfs6sVlx?=
 =?us-ascii?Q?z3zt23qNK9SM+0CZCMHFh1QkjkddqJNICEPPXRGyQWHS9LTF+3otMYVrn6En?=
 =?us-ascii?Q?3BT2l71/aFIUREHvsy8fLCgkIrukH67NzMj9Sh7XKagmQzykp4qTDipJhY2t?=
 =?us-ascii?Q?QlFMzg8U8wKPyA5x53oP7fSJ9YX5nh+T7hkwl38HfzBwBRltly5+WqO6SFEG?=
 =?us-ascii?Q?I9AVbl849SsZEzPOcFzV2cfhitBnZvJUK6F6iQWTpb+/yhBSR9Ey2dXxhQxl?=
 =?us-ascii?Q?1T9Obnh4DDLjP0i4SSA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f406f3c-90b0-400c-5e10-08dac64bd146
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:23:36.4273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyOpqxz+5Q6mS9tDQnYf81m1x6u6K/uNRTSmzLrKRcbHSSGYjHEJInjA3MsBxHcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org, "Liu,
 Yi L" <yi.l.liu@intel.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 10:01:13PM -0500, Matthew Rosato wrote:
> On 11/7/22 7:52 PM, Jason Gunthorpe wrote:
> > This series provides an alternative container layer for VFIO implemented
> > using iommufd. This is optional, if CONFIG_IOMMUFD is not set then it will
> > not be compiled in.
> > 
> > At this point iommufd can be injected by passing in a iommfd FD to
> > VFIO_GROUP_SET_CONTAINER which will use the VFIO compat layer in iommufd
> > to obtain the compat IOAS and then connect up all the VFIO drivers as
> > appropriate.
> > 
> > This is temporary stopping point, a following series will provide a way to
> > directly open a VFIO device FD and directly connect it to IOMMUFD using
> > native ioctls that can expose the IOMMUFD features like hwpt, future
> > vPASID and dynamic attachment.
> > 
> > This series, in compat mode, has passed all the qemu tests we have
> > available, including the test suites for the Intel GVT mdev. Aside from
> > the temporary limitation with P2P memory this is belived to be fully
> > compatible with VFIO.
> 
> AFAICT there is no equivalent means to specify
> vfio_iommu_type1.dma_entry_limit when using iommufd; looks like
> we'll just always get the default 65535.

No, there is no arbitary limit on iommufd

> Was this because you envision the limit being not applicable for
> iommufd (limits will be enforced via either means and eventually we
> won't want to ) or was it an oversight?

The limit here is primarily about limiting userspace abuse of the
interface.

iommufd is using GFP_KERNEL_ACCOUNT which shifts the responsiblity to
cgroups, which is similar to how KVM works.

So, for a VM sandbox you'd set a cgroup limit and if a hostile
userspace in the sanbox decides to try to OOM the system it will hit
that limit, regardless of which kernel APIs it tries to abuse.

This work is not entirely complete as we also need the iommu driver to
use GFP_KERNEL_ACCOUNT for allocations connected to the iommu_domain,
particularly for allocations of the IO page tables themselves - which
can be quite big.

Jason
