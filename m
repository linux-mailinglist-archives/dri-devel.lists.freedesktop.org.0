Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF66135BC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1B10E1FF;
	Mon, 31 Oct 2022 12:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937DC10E1FC;
 Mon, 31 Oct 2022 12:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4XBtghjymsmgZp5QxiBuJ2C4tl2qVDz9ymIX2bdG4x9O2ZSIzIYjf+6w+qu19+Fbo5tiwP2ZGaFYNXUf+inPVaVZ0G0el7ShEwGxMDYwjCRtjEmBtkqeV+zlmh3fT6Fa1XGfgv/g52dnbcbcoCby+eySV5H8ohhqbV8CbFHLCbS9v5RxYBFRdB3UJr/ZDzd2LliLKls/+tYBAEUXCbnHjbRqRqhe0pn5D8r8AiDAWn+X5NIK6bbvoo9vmnRppIk/vqwQUVgy2x+KufSvSw50PqETf+UHizZpV20Ut4Fv5RQHPDh8xHQryZDsyhwM2xjfeUjwGixTojSXLT4PXF1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjmT/YYYPHAhdO4+HxP8VEHTGSctun0rbwsC4hkNH8Q=;
 b=dzM+GJDZ4t70dQQs+ARbpwBU8qKTC0eL+a4DcfhNYzFxnnFb2cYS137juUGD1/0pR+z5XHb5QqZjfOAyBBaqPSG1zP3f6WpXM8uKO6Y9JYKT6DbvMFob686uTGNxV7d8mBiy8pPcnkCqtMBOWUmPQJENpIqqviIc609uIDZVuEvudvcTh+bwDEZ1tO1JOL4MPBbV96LbXbnDEK32HQGq4YMXLCvuBA1aBvRRjXdqdidxHqsYVR5T1NjJyvo1lpqUrEjrnorSigjywIoyduhERRmziDVLOgJWk6By4wonWdcmXN/otcSb3IYj5//3sVZfSS8g4cnHHGhH5CHEO/rLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjmT/YYYPHAhdO4+HxP8VEHTGSctun0rbwsC4hkNH8Q=;
 b=As43O28+svtejjYJTsb9tX00RtMiyoNYEL33759WN6lVBNltqcZIu3UVOlkvsEjnCSaIBW6k+XuDWSCvgDoB9nXJ9ej3SIT0UrxWzT0d48NxmVRa9sYarKGQDWU5M2BTdOcx3bL05fQx3nHTMb3OpQYhR2usiDlUGMpEmcbn2PDfpw60a9rK0GEpxIBh83T3DkAT8RYwxnskZpv1OE9QhasNjs5rshGs2KkUEklP6ka10WyhHQOSFlLDrxxDOvVlz5adta59bKemomTxqn6J+D7Xf8YzBf+jJ1GQGuphVpfEx7xVJ95qQGC5ZX2hdGLBjyKnxUkPQv79EuZnzKENaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 12:18:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Mon, 31 Oct 2022
 12:18:41 +0000
Date: Mon, 31 Oct 2022 09:18:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Message-ID: <Y1+9IB+DI9v+nD0P@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
X-ClientProxiedBy: BL1PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:208:256::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5db1f4-eeb7-43ab-7e1d-08dabb3a0c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkTbtVBOOgS/W3+mZ3xw/3IT7DUgXkGQdQ1iqKTQxuGQbk/nz4RUuBvdaiw9KM2xhxfVQRZ6pi2R2WQBvezYDNi/mwbXWPet5MD1V6u+5+ri1uTTu2EzqErx2bwOEHzU4qCoA7Y89H4gnSPph84PBFve0+/076SLTQeX8JZJdjOHAYh5K7QtPAOUzvDPpfzFx7F5CYxHCE1Ii4oH6/NV33kilhYNjUUwOzBH1WzGreh722BTceRqG/ki53mVxG7jeB3Z9UA6jcEop2tzBt2NN4YZ8/RSEReTKl8i25IAf/1b0MR6KIUnCBItjzo5R2BwYm8jnXaF1qHkR5rG8iZh0HMUwyLeWsWkzy4yKaKMGI26tZxWNZdgvud7UceoXlEPtsm114xtNopGW6sVx3TkuHqzJPOFoIrIbVGF/7x5Sa/cEiUl1UBlcHNxyATSjrM/rpffvaihmIochg3pTfQ03AMT2spE/nTazYzYnkqwA8IIZeRt2FqGJ7bS4SBke0/lNa7AwE8ZIDafFq0LJaO0TjrDXWoKUgbW5TNxsWkY45gdOI2s8opPy7AuN9JipU6+MOkqGxYqIcD4igVTnueExdYZEveNkqWpkAzeY+7AtqiDePopiy/zk7b77ccSQEPLBmOMkkMmvN8jIwerVoPE2bU3OiaCnw4M8LoeTi0LNpsL9Qwnl3WAGPtdmFVC8BtZk5UFxpsVN+9IQqXW4hz6PilotGwtnMWD8XQVKGy+0YYWMP6kq/jjXUSFzz/Ksm4Fnj0DZHsZzU+quLUoTccL/2R6FvO+8HnglBLsIzRpHRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(83380400001)(107886003)(966005)(6486002)(2906002)(36756003)(86362001)(38100700002)(6512007)(53546011)(26005)(2616005)(186003)(5660300002)(66556008)(66946007)(8676002)(66476007)(316002)(478600001)(7406005)(41300700001)(6506007)(4326008)(8936002)(7416002)(54906003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J4WqxdEMQrsb+NvZZ9YiAKXFV4F2W6r3o7ltGAPrtWozRtuN3OurjRVK6FLC?=
 =?us-ascii?Q?8Uj4fT11fG84SludrgeB+xRQuo1ArFBmSoedVYTHR0+cPfWShEQgVB2TgcJP?=
 =?us-ascii?Q?22MP0sudFrtnBa8jCMHb72AvHduxe+tnrdP2BxZXQzNLVc1VOfr5unw6p7Ev?=
 =?us-ascii?Q?V3JaYSXQ+ggy5dpFu3ZfUss8taL0COErWFmPDisfBGRyL1E4qHdd+qCqPXOZ?=
 =?us-ascii?Q?NLXyiQU+0MUtWMvUzugvUeky2Afe9udQOpec9dbifAeWtF9Jxjfjphcbtdc6?=
 =?us-ascii?Q?DQbeBakiAfg8OxkLZjHw86+3fu9/a04In/78iL7AakLx73dRf5rkhXbTetHD?=
 =?us-ascii?Q?+0ur5tLzHINgy9vcV5z56K8l6Leg9ZKzgS495VouoLs9BSox1DB09GZ98VqV?=
 =?us-ascii?Q?7pLn0ws4ade1fR8wKgXvrU9wN9JCZBS/4BAzTF2ASLjhmYrfznGARUspW2xv?=
 =?us-ascii?Q?LtsLOTBBVU3tF+xAwsByx2kI9Vzodpn1f8cLgCT8e/03sNGul61ct1XieS3x?=
 =?us-ascii?Q?xmsPvxlZrZ8+zdPcJWybDZ8x/EEsSkPyRZ2NmOdziax1Ixo8U9kowGjAOA1w?=
 =?us-ascii?Q?VaN6iHPI3FONE9tkxIHRzAMYM9LgjE/K6Zu1AQoHbUqqoNqIJLtbW1Me8Imt?=
 =?us-ascii?Q?gxI3Tz7ALlfhDEo14D5HH34zI0BNes7DtK8kY/zJM4HpjW8LObvf1tuN7yK1?=
 =?us-ascii?Q?28mCjM1AMb1teZrJsbWRaLMIeNZ5vn3I+0pshmQtj//ZMXmkBgOAkW1JYdhz?=
 =?us-ascii?Q?nZ9YmZSmoX14lm+dTBCOcCX3x5lwcyf7O9YB743QZz7LFWCf5aqAdbO/F312?=
 =?us-ascii?Q?amOh0ZTurIv8Hn/T/MibPK+8cIomoMG5bCA3zutr2Kj+kGxvBJ2fd/L6YD1x?=
 =?us-ascii?Q?M/OExNyqcHG2EOvRNt/32ntfzlWnO5VoS+kl1UiMPd/cCQW9N7uVmxZ6uBBC?=
 =?us-ascii?Q?fQGATX7Jkc7UucMu3f6/tjJ3Sk4FiaSati+//TVi1k4CoyVY0Qjgl4lkCsTg?=
 =?us-ascii?Q?6h6dcHexbUiXGqNzTrWLfESb0zgDpgHN4bnIV2cXahLCDea1u+mk1pjBEKUA?=
 =?us-ascii?Q?/F+zOPYCV5a1QD7gxYfVRM+JIrHqnZu+qcB0yJL3oCa0EZLIRk+8l6UYC8m/?=
 =?us-ascii?Q?TVBW3mkdvxsxKFWJATAhftNK/KNVH7RoK9XQ+rVm4TddOPM+uc6F9taUSD7U?=
 =?us-ascii?Q?eBA+WLhfoZVJfqn5yVf1eJBwoIea6XlVbJCkCdkKji+tuxTKW3jpPVQwj9qq?=
 =?us-ascii?Q?nbNy7w6Das1VilDu2itUcV0WLwTqOkmx2sT2DE0sLZswyWVLaR/t2ttNCaTB?=
 =?us-ascii?Q?VRmhbj4hJJnwB1n25B57naT+2XZuIizEZncBaiumBtTVCflX34ZDB8UkKM3d?=
 =?us-ascii?Q?DzUrCzNfyseMnyX77JUePA3Fwze4t9pun27G+XWe7zw75eGXePFqX0s04z7R?=
 =?us-ascii?Q?Qt8+Vhw1G0nbVSyi1RPbn4PnsFgTHV1LCRm4hYgnGrdgToMQx841jqWOEFDX?=
 =?us-ascii?Q?1Y/AvjFZ9r7rVFj099uNK+0a+8oax3cGQK96ysaxD739ZdvOzaaJrF3U/DXv?=
 =?us-ascii?Q?RzeTuVEh2EQncV6YFtU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5db1f4-eeb7-43ab-7e1d-08dabb3a0c23
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 12:18:41.5455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VncR3exM/jMdIsfOLagq1gDXnanI3TK0fxHSKZNnkvZ013sMqyLrfw1MeyzqAQXu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4875
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

On Mon, Oct 31, 2022 at 06:38:45PM +0800, Yi Liu wrote:
> Hi Jason,
> 
> On 2022/10/26 02:17, Jason Gunthorpe wrote:
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
> > 
> > This is on github: https://github.com/jgunthorpe/linux/commits/vfio_iommufd
> 
> In our side, we found the gvt-g test failed. Guest i915 driver stuck at
> init phase. While with your former version  (commit ID
> a249441ba6fd9d658f4a1b568453e3a742d12686), gvt-g test is passing. 

Oh, I didn't realize you grabbed such an older version for this testing..

> noticed there a quite a few change in iommufd/pages.c from last version.
> We are internally tracing in the gvt-g side, may also good to have your
> attention.

syzkaller just ran into this that I was starting to investigate:

@@ -1505,7 +1505,7 @@ int iopt_pages_fill_xarray(struct iopt_pages *pages, unsigned long start_index,
        int rc;
 
        pfn_reader_user_init(&user, pages);
-       user.upages_len = last_index - start_index + 1;
+       user.upages_len = (last_index - start_index + 1) * sizeof(*out_pages);
        interval_tree_for_each_double_span(&span, &pages->access_itree,

It would certainly hit gvt - but you should get WARN_ON's not hangs

There is something wrong with the test suite that it isn't covering
the above, I'm going to look into that today.

Jason
