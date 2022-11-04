Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1D61A194
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 20:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C854D10E81A;
	Fri,  4 Nov 2022 19:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4961C10E814;
 Fri,  4 Nov 2022 19:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLlEm/WNQKEhmCFORRT/60I/3+812MF+xtx9Xo+gC9XtXKCN0nPTXevNNwYnMeGmfg4SHR6cfyzXapmdiaI+Fs/kFpHoRsRur9eQ3c2U5FYd/uPVuU3zrOWR6ytGLnnrMzZE6P7Y5YBFRAXAxKovghja9yhJiJ9Q6ZW4dnsInceRKWzkHhMle2KZSu5VBrKoAJI+2uTfjspSxj98w1crObtL/jTcyRZg/MxuiZgT8Hq9SWEfeSWBDuaGUvgdkpwPFrAvqxJR4u9blAgE7+kU7AifSLX3edPMOvY4glNzmXQRody0BChXTAV8pITGxulCTmRneu/7RDIVXOsTN8UZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l51wZS0+AGXIRQuTOUakB7jieD+rsNrqCjdhoElO5kU=;
 b=cSi65k8gTaeFxq0mS9lhWe4YU3uGUNHJtVegT+ACgIl93dhLRIsrxcYTGRwnPnSScZR0YwIYLQuVCKL1Y9LS27GWdMOtfsocyWVeFG3yswX7sR7Mig4NQ/bUWVlqn15vLiTHPh1Elo4lHtB3z49uWDCnQh7Z7tBagiWB2U2rZqOJmZsJWkF0ituekyYjtZQy/gRLqro8EA3npIBeVX3y8R8zXf+tfCgfrvTTlmaM0KjqldsnaGTKLd36HmBvHOjUK+2YBZ1etSNqrYnNIxA1NOsGl8DkyHfdx6prECt/vfERsHqnWkY3zG/5djLrhIF8+qGiDm1D13A+Vq/SA+jBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l51wZS0+AGXIRQuTOUakB7jieD+rsNrqCjdhoElO5kU=;
 b=trNEUQBic7byMwmgevOI27bN/rGog0GoP1cyJuaIFTcw0OnDp60uUfZBb7wlcTKIXZ0DNHrv6ROhYLJqhcGzH+yZw66+QKsuZ5hr2yEUmjsmJkfK97QUV8PFjwZS7zbs0ulNOxswfkb2VV6twWKGQsYBoxbb73nx0mQ9U4Z6jQs161H2duyKnb0HT9eEUGUhgxeuMTdAhzSxFaFZ34qlMOmQW+mYbsW9FMxcrJqQsWQY1iyq3QEG6ag9ojS1rvndLlSr5GnynyCscUtcxcvR266fghOvjfCXmY/iZCEcPXVYVxHQFcngyVFD0k6CyLbahHna3uJgzMMgAZBfy39yXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BN9PR12MB5051.namprd12.prod.outlook.com (2603:10b6:408:134::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 19:51:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Fri, 4 Nov 2022
 19:51:26 +0000
Date: Fri, 4 Nov 2022 16:51:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 07/10] vfio-iommufd: Support iommufd for physical VFIO
 devices
Message-ID: <Y2VtPZeLTG94ywho@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <7-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB52765B9F0F2E56A973F58AC28C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52765B9F0F2E56A973F58AC28C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BLAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:208:32d::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BN9PR12MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: dda3dac4-02ea-4065-6af1-08dabe9df55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+fXrxnT08FbeL5vV0TSB8ARjS7EvvbnGhNuKk19kHUJkFciOiZAS4s4vhHqz80ACh1eHw7husKUaIhZCvfof02f9jFq8Yi9d7YCuK52EUy7474BxavZq791DpTkhuu3SeacRPOeMLyzH07grnpb+822403ZiqHijmTwHC9npgHGyDzgz3pJQzkEvOKydvEL5emLk2dX3JiGrbuXq+bpmIEiSwXufXnr6LhAGH7Uc/MZkIKKhGN8WwLrd2fYs3Njn3T63ujK2tOUh66tHQXZ+Eb/nNPfSm7ei64fXA8pY4eeiKXAUfKFzSKCeG/Qe/V+fTwJPCzwSWPEGhr6nLGVl2UON3hYp1TO1Uqs86oAdCkR/qSD9+V0DTMnaInvo4LtgK/aRvcosCmllxT1bW2k7j5DMCyS4ImOdPKyXTJTRUKanA8KEHFzYWSSYjOSPbDzSmUCKJUyn/3XYGj3EDKzT1CmjDACSrj8+9qyfPlzri56gaRESf3UP+UQnVAgpCCnh3HmI89RKtSd9okU+EhcsW+P/Uj2XkrWNyftA6uDPcepGnzVYPTZKeqDXC9KYWvq0LCLK9MZoY0RgoolBbDt1Muxk0xrfC5rEaVqhUyNHC49Yhvf1a38TfBaQsxyh0iZHiCYgPGnT+WMR+ehwBEIFb2RGd1ir5usCrzMCF9djPD6XRWmak6pzJSIuwAA7BhyWcAO1E2tgnj7Wqa2xB2/Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(38100700002)(4326008)(86362001)(6486002)(2906002)(478600001)(6506007)(5660300002)(7416002)(66556008)(54906003)(6916009)(7406005)(8936002)(66946007)(66476007)(41300700001)(316002)(2616005)(8676002)(186003)(26005)(6512007)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kfFubcRbe6OT5cexpBfRsyDiDIJxSHuIk+bK637yiGT5gNEFB3en5/0gtbWU?=
 =?us-ascii?Q?dLXn03E/5eqppDkuI6LVUlY2onFeX3jFbEQOkiID/Jn/L1nIWrfSyoLsvyxL?=
 =?us-ascii?Q?doQRtmkr2jXYxNr34DJPz8c+NOwjWn/5oVfxMzYhM6IDlaytdi9/MKTN7f//?=
 =?us-ascii?Q?nt9zJteMfXNMmS7JyiQ4wbMc8M+VZAevoZ6E5zyyYK72shp5TeDTO0NoLjwY?=
 =?us-ascii?Q?dzPh42axWEwH8QnFcOrSvunACVdUgS3N0D2yRtrdzORkz0iPOWYSv/BqhvQh?=
 =?us-ascii?Q?xsOdEBHk2u5Zo+9qcRv2gIODPGH1+AP2qfTckLRSIds1flDVal/I5fJJN6Kt?=
 =?us-ascii?Q?Daa+/8WwshC59nf57zndTfLKZsrdIbxaNFnrY6CoJ8YjceNE5LVfYMbSgzeO?=
 =?us-ascii?Q?P3rUxAUeceyOl1Svvr5oagYI5PDCfIck1GAyDRAMAkVPs+5/ZUSfzf/76PF+?=
 =?us-ascii?Q?obi5f/OA7/ahDmV8vV5RecG9kQ6Xm7EtJmdj/tYJf5225qH2LG1xs8z5Anzn?=
 =?us-ascii?Q?lVff8dIGTvL1GyHpkQCoefKgWkNJS1h9F/ZFC79JeI8i0jVkF7JzH21iG5ac?=
 =?us-ascii?Q?B9X7aITQHWcFTf95PzpuVQI4wNKWGt6yfcHszlSXohye5pqdrvD9JAK9Ua2d?=
 =?us-ascii?Q?/dMVKUVPxxgw1XkcODoVDuNbTkc8bRl5Hj8Bx0tGOc/9oeA95gQR5Q+0LtM1?=
 =?us-ascii?Q?QnwyYR0Z+XihX6M7XTO5t5/5dyyoUZ9z2cWfnrImZrcEwatkzBE0PRJ0/AYq?=
 =?us-ascii?Q?87aCVswZ6Qzw2PxF4yadR++dbt6sfsdpgSm54rsceCKGMCRshb1O+4ovDxOC?=
 =?us-ascii?Q?7plaztsjNtHoCV5lNvTzvu0mKHQ80Ih43PYZsCFp/Hr9PnVr5dZjK3hZc5SG?=
 =?us-ascii?Q?QeD2/Og4iA4cLQEijY3UtPOBuvhbvCJ5248cqfag1biEC/hV+yewNhTsfelv?=
 =?us-ascii?Q?CM02yfhHsjFNzIT8RE/ldeTKvXw7Nz5/r4I0YwkvpaL7O7cBsUK1hF2tOWhF?=
 =?us-ascii?Q?Sjsy2FsJmnV5k4nSCkYyG+JywQLIMrvrki4jQShhRaRHDkOKtyz+Jg0N/PIY?=
 =?us-ascii?Q?PZIi4dBQ5TzZ6ZZ038UxYmBVypCUBjc60bddjfIDHWPHdMkPy38AycSh9qrK?=
 =?us-ascii?Q?JNCZD6yQu8tpOhrzAwXN97chWsCMe/184Nb51d5Nsobd08qxte7f1e5+pj7C?=
 =?us-ascii?Q?qHM6K6fal11MQGsP6op+P/HIcMnvO3wG13rBuXo0gwcinFcIDH5WtmzaBtT7?=
 =?us-ascii?Q?Axv04dLQb+DiEKjs8Qj3ApDq9cwUMZrxNOC9Oxa5eidxIyKMuAd9RFm9RO2t?=
 =?us-ascii?Q?Od5tpl6u6wiBEVX5cs36uRro0lzvigWRbFtaX6QTnhbB8rSSUZyVW3BPFG7v?=
 =?us-ascii?Q?pvG0DX8cE4FUZQhyEHZ2FUUM69at/pMJ5oaCUaiDgDkCLYnKyur+nsjo6yy9?=
 =?us-ascii?Q?u72g2e9Aa4j0ImOfd5tRw/RJJsI5K5s8cl9LHlMnJQtbc+zU0w9CR1QoT/GT?=
 =?us-ascii?Q?Qb47o4tPH4sjgeScC0pNf3tqW1lIu7UXR/OqH0qpbQNPmyiihfXX2Ls9BUCH?=
 =?us-ascii?Q?f7Saon6/VHNJAP7R1/E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda3dac4-02ea-4065-6af1-08dabe9df55d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 19:51:26.5154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chHEstVV/2wQEOHnUbpbxO5f42K6uLOesBDM4hU7TUjH8BEJCzuYTEtVmEgIwsuX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5051
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 08:21:20AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, October 26, 2022 2:51 AM
> > 
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
> 
> Nothing to do or return -EOPNOTSUPP?

As in the other email, nothing to do, driver is "bound" but doesn't
actually need iommufd at all.

> > +	ret = vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (vdev->ops->attach_ioas) {
> 
> __vfio_register_dev() already verifies that all three callbacks must
> co-exist. Then no need to check it again here and later.

Ok

> > +void vfio_iommufd_unbind(struct vfio_device *vdev)
> > +{
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> > +
> > +	if (!vdev->iommufd_device)
> > +		return;
> 
> there is no iommufd_device in the emulated path...

Yes, this if should just be deleted

Thanks,
Jason
