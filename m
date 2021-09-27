Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814234193FF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 14:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F4989C89;
	Mon, 27 Sep 2021 12:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B0789C83;
 Mon, 27 Sep 2021 12:17:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agiqaOpuocXNn2VBHnrxJf1JY6DLxWs4kozlMSIR8SyBkzmO0x2blwz8KIni6eP3EbSS+JFCzjmdr4l1DLROD9SOh88cNdMuYWEvXfvOS5EpjtFuBt0FCCqdDHtap/rjNpotTJvg3qdKxKXgWT+8b0+wFvLAP6aZoHUeSSvFiI/9in46v0dmwPLbzP7FYGrQkVYmXaw6xECG0/npXpx+NnmoZb5q0bdPbjyB32xj8qCfxKDNZfkLo3Frc83UFDN8vlSuqcbELO5BPmBc3t33t3UuWbTNRz47Jun+RUTSEEY1rNMr9xHQtOzKBEKZht55AVO7Hi0uxXDdHnhQvwQE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=W9m1z6xvN3k5+zHge28fDda3iAvvFB0YAk4Z5uEN8Jo=;
 b=ey24yywDABUcFCSR8EhC11BTnAy3/ZBY2YjeMW3I2tJt8jjphSQx0Sl+vJxh0L0ion1PARm8I88tPEpVPhLz+/ChNbVQm5hYDRkKA3W6BsYjJb0gNApNV8fL52xUaq7OPCRvryRc4lLjndl+z5Av1vPtgtt/GDcEa8aYJz2NctPdTID3kPzkCNIx5FKREJbZoTMAtE3wHixfZ5ZwF4duIyJXBhBvC1dSVT2l0dzijy/STVdpSW/Caad1ViCiu5SfFwd1ZcK2DkNCNVft/r18862pcHS5ITPPULjUR/MOQpJqUNBLlVjhQllUaJPEA0MBbNSk+izgv70RyHJRKcYKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9m1z6xvN3k5+zHge28fDda3iAvvFB0YAk4Z5uEN8Jo=;
 b=tDFfRXf2aDbTAMo3HQJVfnLAD1yag6U9LIHHwCyUz2v2azBAsOsPccpL9x73EYQBzz7NmS655SXkZVIFV/yGMAYKFQzYLoK4Pn1a1LkZ6N8W8FNbjRIlLANWGnTeCqY2BmEUIu41poPJjQkNFVoZa97x6rtLtsVZyIKHcXFemhjDyjUWgDHntENmszGRxO9fOO4aa8fY6BEnLk9V3hdvOZK8BiuGsdNAfZF1Z+MF2/ZUN7B87nb1JxqrzKaZhU5iDFm7c0KHErAqyAaGxlVC3ko/a1aLzcCRzRHhGp3Ovr3MTJbFMUdqQl9XcUkv0u/6BSQPFq/WNNMLbGeqPGRVng==
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5191.namprd12.prod.outlook.com (2603:10b6:208:318::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 12:17:23 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 12:17:23 +0000
Date: Mon, 27 Sep 2021 09:17:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 3/9] vfio/ccw: Convert to use vfio_register_group_dev()
Message-ID: <20210927121722.GX964074@nvidia.com>
References: <3-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <9c1f3f9321f595e6d42dab1413637ad927b6bf2d.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1f3f9321f595e6d42dab1413637ad927b6bf2d.camel@linux.ibm.com>
X-ClientProxiedBy: MN2PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:208:d4::41) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:208:d4::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Mon, 27 Sep 2021 12:17:23 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mUpZS-006JTb-4t; Mon, 27 Sep 2021 09:17:22 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85cb061c-2c0b-4d98-bb6e-08d981b0c2ee
X-MS-TrafficTypeDiagnostic: BL1PR12MB5191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5191455014FD8C64340F31C0C2A79@BL1PR12MB5191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PydL8Z43D7kRV1YnJvw5OsK8MVNMSkbwTqfIS2UtrK0dpYok/A7khynwjQWOWY+6MzFFdDVSQA3x9r/b38cP+iVewJeMmPR69VMtu96QcPC5VTMMF27/IOah0qPl/l8hN5khZOY84r3hDCpskXeAMd4NvRAp9lods8FnlMoyRve8kNActkKmrqJ/A5dn3S1KKJd+jZssfxPHbNM6FpE7hBm0iDJpgKo+lLh4UT+WQtZs5vZMfmPMQbVnRtMuGSoyPQa/4+j2wv/J1POIkeSw8YiOqwbrYxKCEzoLe1KfQ85uQ9poXEVbwSdY/+9r8Iiy+W8MaxRRBtVTd7mr4xajRcU2Kv72j2LAY5aQ9K5U4YlOGsBQwnZPw6dbCC1rZBpjmQQtmBrVxVGYkbtPyAUlAqblFadN9qzYVw1ZoWJ3dH80THBOLEw2nglqW8t7YwD9Yz0GciERBlcSS4cmzYyzbV4NxTmF1NtBmsP6G5O7TerIUUBbxxHgdtvt3SKXIdGCvdXV9SWmJV+tuXyXmQF6oiJOanEC4mH1E20QGkaai5NGc7y1VlYfOwP9RuGLhUMVGj/jSFtRgh8klJjxUtcK+URlIABuLNUu67IL0qf426aKM8DSQdzyTHe+dR4sfRl83MDQU4jQvyhcyzUJFbGOee023AC+izCCyhNha64d1vqsI3FCUpXyD5bcafAqJdZD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(5660300002)(36756003)(8936002)(33656002)(8676002)(4744005)(508600001)(66946007)(426003)(1076003)(66476007)(66556008)(6916009)(186003)(86362001)(26005)(316002)(2906002)(9746002)(9786002)(38100700002)(7416002)(54906003)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g0wmhpp3IIh19Csj5jP8ziRWiWtLpnLmiovJqKF98JdrSXTLFGzKt2tfggax?=
 =?us-ascii?Q?70+kcPj51dAwfvfeCe9lZInX7zfjxVwZVP5gOuK/tneSPOwg9PUfMIlWzND4?=
 =?us-ascii?Q?xoXHf8bmDjD8iSiMCTS6V+3Fpsuw78iOL44PQ0PcaLgUjEzCIxWzB5gjm1PU?=
 =?us-ascii?Q?IS8RMruHud0CGQhKEylmTVzicJN6GUNUha6mnf9nlbQ+GBWVq3WkfVzqXFFJ?=
 =?us-ascii?Q?OAxhRBQwgn6ofVNoqreEs2CPA+k6dvUqi7MaFJ5yXjsKmieQhGEd7gEe1WLW?=
 =?us-ascii?Q?c6hHllDt7jTbeo2kMWtD7J6l6WSmIevIgRzYvTHbz04hCvB1WeoXOBIDxl25?=
 =?us-ascii?Q?m+CGYrtBKeBpb0yKYpE5JzcQASG94MAzIXq8bOiRHQazq6/NBCDuBM8SBs8X?=
 =?us-ascii?Q?SgtnqVMcnA0aqxgDJKc3aQA6xXPOY9OjYvJ38tEqT6aJwpxG2jU6+Xw8VtWc?=
 =?us-ascii?Q?WlLjIln1zRkCbViu9tLs6YEm9ao45SDggBKStl/CqE9z/BxXjka+yu7jNq0/?=
 =?us-ascii?Q?cbycu+Ph66oB0KwTCOktKRcYt/eOJw0CSEPtU4RcqHKxq/io39bQO4I4QhZR?=
 =?us-ascii?Q?qZNkurAeOueyS6sHxpRyBiuOu9IUSq/tBRRPiCqaPGo7nkygHqGYvhbvGIZB?=
 =?us-ascii?Q?RZlBML9Mda85HUM3TpmS59kPOvGDehcfRvS3NuHP9sT9pYPeAhLU7ZWlNaPK?=
 =?us-ascii?Q?bt+diP5UXaf//2sOF5lhX3bQO5HGV0nnPtjnePLBZrTJD23l0Le9idWUN0JR?=
 =?us-ascii?Q?sziXbfP25yURQcJHfmh9cxP5lPNW70X2U78Rp9y/wKFqbr6EN4RKVVa1b269?=
 =?us-ascii?Q?FeMOvLVrzJNmykoKYS5lTHDUT6Q9QvRzI5UAHfWBqISM5LvkYRJweCutxpVC?=
 =?us-ascii?Q?zUoS0g3l7q/tvxjVJG9IAAxTsPEiNICNzPovR4rNGIaBf1h5g1nIAJmWShgG?=
 =?us-ascii?Q?ksykAZjOPaHMfijMos8/HWAx/9TP8TiomQ1VsHKLulySmzfqmOZqn6AK/SiC?=
 =?us-ascii?Q?DHdYMalBUyfaAwJkJ/9TnER/Y1EqXZRI0j0vk4mNKmU8suk5YgEIeOCt17Jv?=
 =?us-ascii?Q?X1is/TKedMhk5XeYtMNiF9iVaf9KGKGEGWe7E1PEuf7lZOWXlf5f2qCa6PSC?=
 =?us-ascii?Q?gnEJ/I69clXIjp/yhKISP+J92ZM0T6j3pkq0i/QmI1YpYFl/687HdRxpUuT+?=
 =?us-ascii?Q?JQ7s7ddaXEdUkpdcvWccomjexOprBYGQiWjqQha/lxE4nciLarjnGj3H2o3v?=
 =?us-ascii?Q?o3V+ot/uzSiQvnsmxPZ2WNApdhkdvvlDHQvMcuvO4udcwzsLw0YNmFEOetf7?=
 =?us-ascii?Q?kB6JKW8Gpcu+ItDUK0aK1MYG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cb061c-2c0b-4d98-bb6e-08d981b0c2ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 12:17:23.7823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI6Wm4NByBe5XA5JY5yE4LhyA1LMaoEkYeX7WacJrElvanwBo7ciT4fAiVE9svOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5191
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

On Fri, Sep 24, 2021 at 04:37:43PM -0400, Eric Farman wrote:
> > @@ -528,6 +534,7 @@ static int __init vfio_ccw_sch_init(void)
> >  
> >  static void __exit vfio_ccw_sch_exit(void)
> >  {
> > +	mdev_unregister_driver(&vfio_ccw_mdev_driver);
> 
> Wouldn't it be better to mirror the unwind-init case, such that the
> above goes...
> 
> >  	css_driver_unregister(&vfio_ccw_sch_driver);
> >  	isc_unregister(VFIO_CCW_ISC);
> 
> ...here?

Yes, I switched it

Thanks,
Jason
