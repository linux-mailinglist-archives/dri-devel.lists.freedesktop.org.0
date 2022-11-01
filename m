Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDEF61499E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 12:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBAF10E39C;
	Tue,  1 Nov 2022 11:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D087410E397;
 Tue,  1 Nov 2022 11:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTdZPP8/7hy2AqmG/YGq8wRrEtKlqrrHBMmgUx7oPxIlwdYuLEJWojBtW2QrzMYY4uBXrizY3BcvJjQ8qf6lhSszkebDA0142ZjiilYamfSZH2ChLC7grEInefeo7jqxIEW3CE0AOj4X5vMICkj3gS0FjaukJMGvt858mujoNCRxgbp8hW2IK52782kdHPeZQUHbwe6HNp8Tx++/HCQbTd+Gb3xa4GxCBh4UWg5z2lwSlZ6JNOfj1onoU+fP2j+hVmPG+vtQvAOxDB/ze/JOE5uNsWEgN/4C86hTMYFky7J9JtbpjrzbfG4GkfmzDub89XQ5Sm1E7vXz9i5IVMnXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fmz2hcFcb4og7U0APjgn49HxDs99fBuT9yALUelGSo=;
 b=nFEP++q5xBSb7ClSsM4q7e/YW+iWrbOPexOv0nF2agmJib3yflUrzhZhOJv5xHGqzWS83BHhboF672d8xr/8TG+gg3XyeB0qJTq5kCr4dJ5B0Xv9zKU/DjEI+13PmkHPlCdwhYTPkH7MFiXsOESH/JvrW0JHMAE4QXMTUQ11EH8zesVaQv2CCN/z5XynWnRYHmu3OxcEeqg/w2F83aM/zCDka7RrWWe3KzxKg1Hbj4S9pneTyXFVOntpOg2QQl+lGpBhRu55kKSNbcHrhTtM2Y9EopulSyLi2iflWCuCXO3sN/AycAlh6Y+GYa1KTiAb3zlAUIH+PjJ0Wk0mGFzgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fmz2hcFcb4og7U0APjgn49HxDs99fBuT9yALUelGSo=;
 b=rLC13e8eyQCMUZ7DgS6JPuLAhFe/FGLZpnYzOh4eElRq2UzUKU7BKNyffa/0xVbBi8iJtwmsEzAgd4eBHhyS5LRzavk0yFKYjmI3IzGopofIYXn9AIS5/2wmhCGq7wEfXC/CAJ8LFFV/cxaykCl3ntC7OddnL19KsfhpFVzqmtohJqVae4IZ1iY1H7dAuyOTC8qWTrluQ4njy9TBjvIfmB8BsPBZbfzz7kotW9DkiyDohAk/I5jcAiOXLWaSNiBvzaQYIlKdXMj0ffPkMQ0vaeak7mgn6692Y3OPqKQ4VG/1tMZ9enoUQ3kNVavDKvai1qiKkRKYm75JT/jEbYZpaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN2PR12MB4455.namprd12.prod.outlook.com (2603:10b6:208:265::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 11:41:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 11:41:04 +0000
Date: Tue, 1 Nov 2022 08:41:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 00/10] Connect VFIO to IOMMUFD
Message-ID: <Y2EFzjYn9IqbRmQs@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <39eb11ed-dbf2-822a-dc79-5b70a49c430b@intel.com>
 <Y1+9IB+DI9v+nD0P@nvidia.com>
 <d8a0352e-9e1d-5b01-7616-dccc73a172a6@intel.com>
 <Y2BZHZXJwxF5C4a8@nvidia.com>
 <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ba21eb6-5050-d9ba-d988-a939bf6c821b@intel.com>
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN2PR12MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: d804325e-0d3e-4f07-073f-08dabbfdf544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qGQgBJOSdTb2qPsDgTEpaI6hg38yzSj3A67/VFFMzMhrCx7sRY/0txf8WU3H1jMQX3srl8Co7bJwgZxyY1FL+uFw75QtjeDGYTbslUdZthbuELAn3eZxUMkWADFIY38RNa+tbQchfdsWDXPtXwWribDrt6yTx74ZpONAweV7mXflCL1y6E/+VsbAOGW900ilNA/35kYygy3tur/A8jsRTrpiCREJoRxTrKrzE0cgKdmCC3WaZQvfLVnWikUFdaXX5UuNcSSWC2VxsZ0pNgT7RadcA24Xp9gWvbH/LQwcnWMwko0YJ6Hf89HUAA24XY/n4v6LlXvj9dTF19T+zcfhPbPULksiSkbnyKpGmbAvdFopnklj9VxsYe6iQi97xJCHERt4a7OuzrxbzYQ4furd9SvGO313MAZPAiUaYzV3D2vfkNxyWNujZo0dxtHzDHhzGDyxKNfDxBV4EUSn2BXaRzvYW6R8Wkx1oGRP2JmwCpJvSet3dkFbcNX3ohFECJ0u93w4zoskUbGES6VfqPnp2wV7hcp+SIc3HykBFvvil9ygnQrjLy5DdMgQ3LslQxIDon3lhjltAcFf1l61IhwmougWADnDecAOinGJsmb4ab+Ic2QgU1HUCc1e3ep9dZXy2Tub5UocXp2wdeDXW9fuvsXK/81sJ+O5SOBx9rAzNNT0ayYXq4nix8FeUAxeEvB8LJix2mN3ZHfMT0eOuhzY+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(2906002)(38100700002)(107886003)(53546011)(86362001)(26005)(316002)(8676002)(66556008)(41300700001)(6512007)(66476007)(6506007)(2616005)(186003)(54906003)(8936002)(6916009)(66946007)(4326008)(36756003)(5660300002)(7416002)(7406005)(83380400001)(6486002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dmxh8p5V8aie9pSHhRvz6cldgWMgzh6VJ8Watrd7l5q0xSwDa7B4JYpOOKeE?=
 =?us-ascii?Q?OwOAtUA2CcDDA9bEeFZC91wwzjsCvS+3SZrSzaXMs3nNHld0Lse0FJc3R+ZZ?=
 =?us-ascii?Q?kk8T3931+0w5AkFn4QYuI4yHZCSQKSuCukm+5xmJYHF5e/XMrlQp7sE7ZUQT?=
 =?us-ascii?Q?OewMN9YeGC09KeBU/c0h2ZgY/4EJx3yd8XO8eS8aWHv49cWATDI1IkZr3H6Z?=
 =?us-ascii?Q?Ev8CVHC3T/KxpzJkIREH9k3z7uQvJqfiC2E0MmYpZCyiD5vxHkmnl6VO9+Hg?=
 =?us-ascii?Q?XLlWVLcri9FMo0N8Sakp+fc90AxwextUeHNbo/kaE/sw36DNyYZfA0kLtjdy?=
 =?us-ascii?Q?ZgNmz3ihBTLTjTjQKdPTKgXzDGsjKO3+f/vkjjfMwJEWfQHWHTtybyxZiOLj?=
 =?us-ascii?Q?pkSngogX1CbWz9RZ2kpegcL0RSrH/Bh1+hDLitTrm32laNU6zknr6pbhcTU2?=
 =?us-ascii?Q?xkPgglyrBNkZTf6JtU9wxW3nU7df6EngHnWKBpkvwDjGvd006OJh0fH92r7N?=
 =?us-ascii?Q?pXjNbVUTYjxRbcy/fhBgLMTDdPZ3k+F/zmIMDl+YkWqQbbVrEMUw9T3uSuxx?=
 =?us-ascii?Q?8TIeBVOAp7Ou+4BeBmv7NUPeV6PFzpnn6AzxezX1tqyqKIsOgBDNBOB45Fyd?=
 =?us-ascii?Q?vy+AhT7BdFjhx/583/+DYH3CYmoQtTEAlW0bm0hMYGcQyWW4gUYDELiHdXw5?=
 =?us-ascii?Q?ckhWUm8wVcllJineFqQesajwj04bKGBRTBpMRsU4uubfbXiyaeUKZtxxoEA2?=
 =?us-ascii?Q?eC7njFCGEQGaBJ+3SxKSptE6FV6Es5FHqWWfwsI8KJ5hCuk4IeG3Hr7CFNt2?=
 =?us-ascii?Q?vYYHjPgHWJzcVpJ5iEern6n4+XNqPI3WNpLzKGNp1u/QFcs5r6URR9hCNrP0?=
 =?us-ascii?Q?wQOcWBKrFn/gqsbCR84hFL8DYfxbzgLynJN0/xnBs3IJw3eqAbd3kd+zyd9l?=
 =?us-ascii?Q?0esG66oKXYD8sXDkSfE2VLebIvvTbBVuanvwBRASfSaFE+FMaCaAef3EKe/b?=
 =?us-ascii?Q?e/2s/q66Fp8DCZVZn9QobUGbRL6Y3WVIkD+8o1iXpgLJIz6gIrXFUlKwo2EZ?=
 =?us-ascii?Q?ZUuGvMXeMC5pL5NGmS8PkFf1cuuyvwgfKSOCSlkX8PhnfHgi4IRO5gT9Plnw?=
 =?us-ascii?Q?pejPEQmGH8bZhVpob3v5o16RxD8fUaPq3ZTG8A65kpCBp56SCvoD1X1jm+Ax?=
 =?us-ascii?Q?ssDhWaFcz7z4xl5nwozQ52sKoLqLBDvZon9NBSoMD/DfV/bfSD0lRi36JiZH?=
 =?us-ascii?Q?bapj1i/u5Q3465SaiuCp5sAXxv8bXXZyNcJ8j6jTjKFJ8fCdWb/V5dMIjyfQ?=
 =?us-ascii?Q?m5qUbRO5LgN+WBrew8HSNy5NNLQD0Vs+XsHrfyrpqOfWLUP9TqQ7aFEY/dwg?=
 =?us-ascii?Q?miZvW7EASfT9Pj3c9SCWChwvXDDGFSxGmOxXgLB2D1irrwCyqIlK6FoffdK6?=
 =?us-ascii?Q?BPI6zLTx7ZxWdeyy9a+Y8UqM3VH3ZTkOb+hK5UGMHSLuJ3ckYL5QkSKidx6W?=
 =?us-ascii?Q?FJshi8KWGD0SYzN+zkyqnpWH/vXAmsGsk3ESrRi4WSCTkiZlt6T3is3b2ClS?=
 =?us-ascii?Q?gdQCEPEFo0YxgtMQvAwpEN4yDFk2F1cPhFx9iVcY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d804325e-0d3e-4f07-073f-08dabbfdf544
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 11:41:04.5623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHJs+3rK6RRjcL6huc4yHGNZiYtMxKPNDWAgHensj0USe7zsUgFbs7PGD+71+172
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4455
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

On Tue, Nov 01, 2022 at 11:04:38AM +0800, Yi Liu wrote:
> On 2022/11/1 07:24, Jason Gunthorpe wrote:
> > On Mon, Oct 31, 2022 at 08:25:39PM +0800, Yi Liu wrote:
> > > > There is something wrong with the test suite that it isn't covering
> > > > the above, I'm going to look into that today.
> > > 
> > > sounds to be the cause. I didn't see any significant change in vfio_main.c
> > > that may fail gvt. So should the iommufd changes. Then we will re-run the
> > > test after your update.:-)
> > 
> > I updated the github with all the changes made so far, it is worth
> > trying again!
> 
> gvt is still failing with below call trace in host side. vfio_unpin_pages()
> is still in problem. Any idea on it?

Oh, this is my mistake, I rushed a bit getting updated branches:

diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 40eb6931ab2321..29e7b1fdd0cd4a 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -118,6 +118,7 @@ static void vfio_emulated_unmap(void *data, unsigned long iova,
 }
 
 static const struct iommufd_access_ops vfio_user_ops = {
+	.needs_pin_pages = 1,
 	.unmap = vfio_emulated_unmap,
 };

Thanks, 
Jason
