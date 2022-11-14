Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CAA628329
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6606B10E2AB;
	Mon, 14 Nov 2022 14:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3310E2AB;
 Mon, 14 Nov 2022 14:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWWx4gxD5BKVCArDUTz52FJB+nq/6xHzHEPegHo7vPcoLkilJLYrifFuNG99//BU74CbUeaduO3okj1VL7urTUQcD3UDhAKPkYmMkRiWjTIvsF8Pu2GwEbnnHxLHV6xhriKJXMzpAXSNkwu8Lc6iYoNpEXhSKRN/cac0GTOQFVKWCzrRxOdtIXMs+HCAFxg1ZSNDU+tx9Id7fS80LYOjH8JsuLXiAuE1mmlnv9W2FTcJppkXagZmZNf/hdbRAW8mkJq79vXjwQE3AR7dwy9FbEp5aW56ar8pZRRRjDc3XxTnUcosyGJuWfMX290kdE04g0VFzMa7EO7RcFtSj94nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZqLGkowJlJywvLOmwJCWKLwJ0hESpt9yN5hYjmnsrg=;
 b=H3t3v0psWHEd+yb1RXb71lKhykWBa+xMWhhrQBaNZDFOE5k8qca0/mqgfQbWzCY1l5C2RmZ8AlhR3MGFC9iAAKDi4IN9FbYF41XmEcTKEm/cRN7+MSUsyZg3/jXrqsuxAwZse1qu4RdEAM2kSy+MwoIzkAU7lHUSIF7CEdaige0YzXA3oXQqwt5K0PTONGZG/HreP0bo/oXVfunsT4hCAaNGb0ROUV9WbA6NXIVu5lrS5UOIqPTanysn6acyV7SeB6s+wxkA7OfK+LQJAwaAeOAc7zw02q0Auu78LznTHWP9SoKNO9syv4vimZccgEyKR2cBozyubW49PaIPYA0qQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZqLGkowJlJywvLOmwJCWKLwJ0hESpt9yN5hYjmnsrg=;
 b=tqJWVPxDZrvRmSok6eLM+U9y/PnQ45gaLXwLKw0dUzbROc6Ctd8Hn266Vs5vUe+CYP3MDLSU6VmdPA8fyYzf2yFuZh61vvhm+Iio1Tmv2QGUXatQEqad6675hpk7CeE8ikeF45doVxDIHPQdDqsmVJ26cnxejrI4rwR/2clKJja65zviq/S4Z/1IpqgvR9jQOxPkF4ti5mUATEUCrZJ9COJr+MRduHv5F3WPd5h/c87yU5VlD/zJH64gXnhHa0ZXNVHnVJwRddGBsnbZazMBmWJYjK+imU+aEBe/iOj+upJiD2UE9rMTOU3RZQ1Oiqes3/1KHfK4X4Y6pDQIJ7rchg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 14:47:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:47:59 +0000
Date: Mon, 14 Nov 2022 10:47:58 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Message-ID: <Y3JVHh8RY4XGb+Ss@nvidia.com>
References: <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <5d50d507-6cd9-5f38-23d4-85f784cb8609@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d50d507-6cd9-5f38-23d4-85f784cb8609@intel.com>
X-ClientProxiedBy: MN2PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:208:e8::47) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0247c8d8-133f-4e57-3cea-08dac64f38f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSE4f24XMLE2sKl34wqXR0SVaCD1+CL8L7eaOBC+A8yxkIZ6h4oB4Ne0fDRfS3tk4xFFEjhZtM061r+hihwe3DIO7F1EtgnsdrCG3A7lH+TxyjGiV1dWcNptgyRcFSV8Cwnf3PEPv6PhaFTCfo/mbpUMSN+Vi4anF1CteAZSSkRYF8HAo0OvOn1KRHRN8CAksdQpELGC27GDuNulxWkyGdr2Ha1Cu/OD9GbvMu+FXkZW9VqLCWaOK1Q4HFWeae89idWNGdyNGEqF+UxrWrTmAoCw0exHeCpBSFVEfRdGIJFtrCXFe8yivE2NJiny/A7/LJ2HSfkjAO7iPOuCwUf6PXkX/rWPN/+5Pq4LjwptibK8O81fgWGtbjvwPZIcszXTSpewSc6X3MGKuqjfYN9SwJpkp0velEFRKEvCU5LT473vCRsjEQ/mBkvg58hT1bldpTHnCUm2E+iSWsZxDC1O5E/xaMt7vvJ7uge+H9pk0bpd8tB0kLpg8i7GRX1+himK7Kvezq7MgQQFcNTuTcUaJV5FojH6KuKpecs7g9f2q8SQbRBOi5yuepv02B8S+DIxGrMK3jmbA1w8zZQA/jQ89PDVl9ZHeV8wzgMWsNdUv1eRFvMPQRTWimAEm8f5y2/JomrIuM1k7PApWdGVxUSWj9JfvG6m4AYBd9hhVz1joyD0SKWo1RX8cOq3tKa1kyFICsjhkQL415MfJ0eYu+p2mD07O9mNuwubKVGuB8LtIqhC+NUzu9UKKpkAMpkPP+OT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199015)(26005)(83380400001)(6512007)(107886003)(2616005)(6506007)(186003)(38100700002)(2906002)(5660300002)(7406005)(7416002)(8936002)(41300700001)(6486002)(478600001)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(6916009)(54906003)(36756003)(86362001)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2hbn8XwHyDjfREE8ffWXcdYX9cSQY9q7HT3MwAcPy64I7AVhyRb7TqdMrcR?=
 =?us-ascii?Q?1Z6kdkVlPRw8B31N2bTGRpdUv8/VbrUVT/57HqW2WlcQle9WcFliz+ARL6bA?=
 =?us-ascii?Q?s58gFF37Pb/N/dkB2G8v2wLIazQiEdu7xsVpS27kAawo0U0N7FqUWUa3zUKD?=
 =?us-ascii?Q?hn6I4OW0Z4YnJhQ8vh0BjkXQrZsk+L5qIJWNZu6FwAnoFUU2j5aSu1NYnGqK?=
 =?us-ascii?Q?zfxYjbtCp/4gDm0SK6d46u+xVrQMGA4FDmh/0ACZO/itUe9ekpqn64AopVfh?=
 =?us-ascii?Q?8qsJN295ajRKP7kxBHVCp/aKxPbGlNIpSdk1VWWo9i57/BG0Q9+5qnREXp74?=
 =?us-ascii?Q?ZjlHgLG8Jeueb9F6vA0I2mVQ+yrEuWu2HhZmdFVb+EGCE6H6nMp5hu0AmepQ?=
 =?us-ascii?Q?6iziBLowLa8APv1mrcmrU60ICF92eacZpEAi3s4Rcs2aYhGlgU3pCGYLa/BC?=
 =?us-ascii?Q?K4dK0jnwyu/+l7/1gUkYMssibGrSMPBOv4p7iOHJ5451HNSbzBGfvovNhAiD?=
 =?us-ascii?Q?8NOWy2MD93amxMXGM7x4uvxKMmEuLxuLcowuHWkOH+/wW/IZz0AU/y7IimSi?=
 =?us-ascii?Q?VQmwZRtUwGcEcXduWZ5FrlSvLbx/+Im5J8Y86JNwRVr3HErTqLQsKCJu/Ozm?=
 =?us-ascii?Q?lww6ET05vHc1YANFH7WBUBwaNe00d8lKO6PyJqw2pw/KdSBdrf3HJtQkoXAm?=
 =?us-ascii?Q?2T4Sf1ramz7B9LLOqaZxRhs5nxz2UtQIas31nRa/YXqozqrFrkIjp/KxG4SP?=
 =?us-ascii?Q?cxy/QG9Aq412i17i+oLMCl1V8bRICPXbGBhcQwM8idKZu5FMa1jYpKuUs+KN?=
 =?us-ascii?Q?EAawLjsTkwTPDAp+zS/HMCrzNYIOmfYzTWG9SsEw8LpAyC/0UHCKYGKuTkPw?=
 =?us-ascii?Q?P5FQzOQArd63ceVGyYwX64QaZUUJJqevgs5/vU4pcu4jKna2phGsu52Mkmvf?=
 =?us-ascii?Q?LYtZ64fnLGMIAe48CeDNSCrhUpnvbYwgrK5t5ZB6XdOOTeHLLxkcbzLzcoYB?=
 =?us-ascii?Q?NHaTlzl9/vHTmmKxvPSHBCJVEZQo4TYK6FpaNClINfUoILc+rQCeZpTt3fxW?=
 =?us-ascii?Q?k9qqOCCFhbu/g2QPvaLVS707EM7q4lSzcLtLgzyEjnTlh/mL3NDODRtveN+9?=
 =?us-ascii?Q?Zns/4aIS4xxq09hdBUpItdz5LJTuYcixidertFWzLK446m4HE82XExoxhvXM?=
 =?us-ascii?Q?gmvqOUXzk0Kv6pNm8vQteOSdCpcEFOX91nG5RwPpBcDIpZKQBL7aS37DydTa?=
 =?us-ascii?Q?3s3YL8XefiKKoA5uBDm9gbSDgoEz1N+qEJVnY12q5FwNDaGsvexMpV+mBfNo?=
 =?us-ascii?Q?5IX6LgsVyattPBGYR3sdvgOFavjSh0q1AoF/SI/Qm3YLefeGlSb8Lfc/0pCm?=
 =?us-ascii?Q?rVcTgUh3AnXfeuBnpddx25ialGmPlWd3BjBhpwpTHKI/V1TlPZ5xH+o0w60r?=
 =?us-ascii?Q?IQ+jtp5LIln7Yx+ygQt8pwpjeNnC4Ev4Qly9uvLw92jjRe1RgrCUOlczA9r8?=
 =?us-ascii?Q?4O+QEBBZSSHradTZ8Xc4VoZlpvQi1rXDZuBGG4NIztXf29Oi6MApzqphSBxC?=
 =?us-ascii?Q?+EZs04hHnLLXX5qF3qs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0247c8d8-133f-4e57-3cea-08dac64f38f0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:47:58.9923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2Pv6pn1Xd1UlbvRqC12pD6Bv/BYHBVBw8RFHm6O5CylrPeQSLrUD7tHsCmNGb75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
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

On Fri, Nov 11, 2022 at 12:12:36PM +0800, Yi Liu wrote:

> > +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
> > +{
> > +	u32 ioas_id;
> > +	u32 device_id;
> > +	int ret;
> > +
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> > +
> > +	/*
> > +	 * If the driver doesn't provide this op then it means the device does
> > +	 * not do DMA at all. So nothing to do.
> > +	 */
> > +	if (!vdev->ops->bind_iommufd)
> > +		return 0;
> > +
> > +	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
> > +	if (ret)
> > +		goto err_unbind;
> > +	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
> > +	if (ret)
> > +		goto err_unbind;
> > +	vdev->iommufd_attached = true;
> 
> it's better to set this bool in vfio_iommufd_physical_attach_ioas() as
> the emulated devices uses iommufd_access instead. is it? or you mean this
> flag to cover both cases?

Yes, that is probably clearer:

@@ -50,7 +50,6 @@ int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 	ret = vdev->ops->attach_ioas(vdev, &ioas_id);
 	if (ret)
 		goto err_unbind;
-	vdev->iommufd_attached = true;
 
 	/*
 	 * The legacy path has no way to return the device id or the selected
@@ -110,10 +109,15 @@ EXPORT_SYMBOL_GPL(vfio_iommufd_physical_unbind);
 int vfio_iommufd_physical_attach_ioas(struct vfio_device *vdev, u32 *pt_id)
 {
 	unsigned int flags = 0;
+	int rc;
 
 	if (vfio_allow_unsafe_interrupts)
 		flags |= IOMMUFD_ATTACH_FLAGS_ALLOW_UNSAFE_INTERRUPT;
-	return iommufd_device_attach(vdev->iommufd_device, pt_id, flags);
+	rc = iommufd_device_attach(vdev->iommufd_device, pt_id, flags);
+	if (rc)
+		return rc;
+	vdev->iommufd_attached = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_physical_attach_ioas);
 
Thanks,
Jason
