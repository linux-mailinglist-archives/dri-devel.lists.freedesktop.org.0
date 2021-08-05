Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25623E1F22
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 01:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85C76E4D7;
	Thu,  5 Aug 2021 23:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF81D6E2A3;
 Thu,  5 Aug 2021 23:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeYMii/gH4402lhacoExGY9GMpwUalR5/6hTJzapx6NYW5TReSQq0sDVZ2JyHQyDl2X18bUbQgt1JqKtTTIwrwifwlNXadMLMYj+OrQV76ldMoXAKgegvt+qPrYp3hyyYm/2BqWt04y+W1WaXOPidhbJ+YoIEE83nMKwnHtC5I2lO4mHariRudXqFBR8gskaqEATpW3AoOcAOYl3zs9K+v1K60KTz00JpK0j31qqb/8Qyvy1pIMcrSGP0G1T5Zc88hhglYPuzF4YfsKuToLqkspOBpcXl1wkDuH+o8NT47T7+WTfQgG5cRL26AQG/67O3Oca4uiZTVNN474ZFC507Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1OmkNhs/ImC/8miMp7DzXmn9tn6S3OBgY+WZDgUgko=;
 b=mNUDtWYtR9igoz/w0F2tcgbXFIXK8MI2kkviVqBN9vDN7e0TnUjaROG/4ol1G43ZXrDJv9siAAgBLmDPuSFdw6sA5sv1f1QWJAC4rzddqLsgdMDNk/OX1P4hZp6THks8ieMyuZ9vpoHpLb1+jVO+skVjLl9zU8Ff91XWLdOCd+PMKg6U04pUUViM5mj9ZPXWjAjMpom/0SqPvSROBLiu4b7z/Lh/2YJU2E9D6wfqVm0Qrhd4+ygnRn3tvpnNZGcegLfZk/NGmrszI+msLKoh62B2sIOD7+fGg2CG0DxlcMa1gbO3swu1Li0fUXDL8YmWFPAkefv3HYwYzSc1TUkRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1OmkNhs/ImC/8miMp7DzXmn9tn6S3OBgY+WZDgUgko=;
 b=IhUC5eSz3m2uo2s84t38vMyIsBa3pxS1KKQtZBwamMf5gUDv8gkKniNNc/r7CVFXjdiMvmX5Pm7v3xzNvoDMgJg0j0Z7EjkICccKpg6W6vb6uUc6taBnJqRWpQb21eoZconyMpc8RCpdbYHegquKmmBSIvv2/4DzJMdYGNSzBND31QMpnzkN/fUdZHaGEHtVwI0bKp5gvDJjPNaBqVbD1XscROjU547D6odh/zTy/o6djAdgD2/+h4ibec/2iDjK2XvmExPeg6O/JeirAUMYG2jE539iDNJTEastzUk8x4phM2RBxbPNPmYoNcKufrYEef5NlhGQ85VtuSAGjrU2Iw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5112.namprd12.prod.outlook.com (2603:10b6:208:316::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 23:05:22 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 23:05:22 +0000
Date: Thu, 5 Aug 2021 20:05:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210805230520.GO1721383@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
 <20210803164152.GC1721383@nvidia.com>
 <20210803105225.2ee7dac2.alex.williamson@redhat.com>
 <20210805114701.GC1672295@nvidia.com>
 <20210805113311.65a16bba.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805113311.65a16bba.alex.williamson@redhat.com>
X-ClientProxiedBy: CH2PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:610:50::31) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR16CA0021.namprd16.prod.outlook.com (2603:10b6:610:50::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 23:05:21 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBmQS-00Dg9p-7a; Thu, 05 Aug 2021 20:05:20 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621a8ed3-15f0-4953-aa8d-08d958658018
X-MS-TrafficTypeDiagnostic: BL1PR12MB5112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5112C1B83152428538762C78C2F29@BL1PR12MB5112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oovYC4zbwRXsfCN8lh+OxVsvMm++lP/o2waFWf4ojo6tcFgdO5Q7AtXwClLdz14BS5x/v8CS3s2eDhnpu8B6sgCWADRdtvi3EKsACO3sgK3Ar3w6pva8cE0VPYRDJIgEnhdm+AXPZ6PMYiz6M+R41ZfuuHESFZwqcNkmxVc8xRlRc2LwxFusr2NkITYKUAZYpSU9zKe/yC8CQG8dWak1JpfY5ZcdTBBOKVZAoZk3DRDYMHLTvxK/cEc0UUw/45ndCXgfAwSceEYOOxLzHwrsor7Fs9lvtfCXbPb4Cl2EJWLm3PAVH+xGIdeJ9SYpKHkMR7/www8P5Lp/wvwimfpgeeNWfcEb8np4MFKsbDLjUBCaDBAauJCBPaGz3kci/3n+QHvbMG619Aj8x8VxyDT91We38wML56s01jfRRsDJaHSFQWdap+U2sD2hBr3ZVxW1jdD6V+10nXGAXYainR9rdS8PINecym9Vtw/8mMRGUivLsfD+AG1ctPmHZoad0hXzJ8jfU7uWi6+/pcPOcHjvtP8YFWN+vtgcrMoEIW2LRo4uh0TULXvuQtgB7Foa54CxsokRViQZjgH+k4YkFKEC6ALX1DZXGTqTQnu9EDlzhenJ+FLw8siI8+v+3DvZC5ilbOJc2EU8pgKREvcNLXA9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(316002)(6916009)(426003)(66476007)(66556008)(186003)(2616005)(8676002)(9746002)(86362001)(8936002)(26005)(9786002)(66946007)(36756003)(83380400001)(1076003)(5660300002)(33656002)(7406005)(54906003)(7416002)(4326008)(2906002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KsKh/sxcQiGYjJ26QPMhU7nR7SsWYDyXI9oL59/Y80mV21+VaLQPB1r27yPb?=
 =?us-ascii?Q?4GpRhnW8P/qkyP8+liQarLVvE8VUIaQFj+WHXEJ1JTFtc2s1zVelevAhZmKk?=
 =?us-ascii?Q?o+xezKg6xmr9yXP02WrEdqLPYoYF9joBdn0SPAnWRcSMJM/hYGokIjQD0PB9?=
 =?us-ascii?Q?+uuGPavfJW7BewyBS0sEOjgFnFErk/MfWitxcVzxi8nKw5Dn1lxo7Ep5/ggJ?=
 =?us-ascii?Q?hAx2Fxxp7cEXSFK+1bM3vSQz2cggYL7F17gsD6+qhxGB/YCNHSAGEib88Og/?=
 =?us-ascii?Q?C73WVcEeuesLes0XcpjhIjO64Npp/PDO0UVgQlqQ8MSfdh1BTjyWB4xnuplV?=
 =?us-ascii?Q?ekq7ey6c0H54cvt7/jkrn8/sXGV3lofvlRzvaoxYI0Ib3nVJnByv2y6HNq3g?=
 =?us-ascii?Q?VqIiMXizzDdfvFa5FkYrjLijNsldaAF+bO7PY75uOkZh21NopxDJTE4goLq5?=
 =?us-ascii?Q?Gv54hOroI4B53PRRKLnNnTlQ3hGNRfXb+VK/aMVfiEiymQGkm9je04gliYGZ?=
 =?us-ascii?Q?rlZWWFgcZi24BPPaEejPYKyuhDLxQO5+DDTDXI0Bx7/eLV9SC0mWLj/OKURF?=
 =?us-ascii?Q?yIXEI6xy8NvMFeCcCbEufnGdLXZeOkZ/oMk0aegNo38/dJQsPJEQBFVWPSb6?=
 =?us-ascii?Q?rN3ESdNkb/7d0zW7w7PXRvTtD8zEVETa6qbJzkRqf2JMjvG6A314JftZNA/1?=
 =?us-ascii?Q?h30XZcyawwX9IB9yjiKgP/vC6eNuqqxTzSFjO0iuqVdUWIdVTT80CVp2RzVo?=
 =?us-ascii?Q?saRuBbk7W7YuWnYkrDiXLWtQNBzP3bKeL9yIN90JTMwN4nzkTaIjhYUXj/j5?=
 =?us-ascii?Q?ellSzFlOoMWBy8NSm/QflAb5MeX5G/8e4uVU2MfFw8sWmul7VMp3zd2LmdZU?=
 =?us-ascii?Q?ssonZftoVdbWC+UPZ9zs8X8T0jKXyw+RKXfXrb44Op68hrVSQLQNNYBPdwPX?=
 =?us-ascii?Q?5xNKVTIoGvc8mhQFjrcrBFI1AejX2hxo9Yj04iEMbvx2kLzexBR+6l+gsjcX?=
 =?us-ascii?Q?5F7pjjw1945OPE/yh4x64qgVULIFQkM/Xiz3ptJj+gGSuVBZF6ofviLLXH+4?=
 =?us-ascii?Q?YWp2lnDLGZORuF7NAnbrBGndOlKGOGgOGR/zAOcR+IfbHwZbfKtllfqfIiB5?=
 =?us-ascii?Q?sZwaDlURzLPhmgxLctAUzKbtR72lVIe04VmRVFwmLvkzbjsm3RZzC9aTpbvl?=
 =?us-ascii?Q?k0NZ3SYtKNPe5ZR4Eo/JcRrpld2PlDA1V70FkMVF7pwhihsmNRUn6To4/vPD?=
 =?us-ascii?Q?B51kcfBTXMKPAsROdBFW2RWSk+zWp2xzgqqygFPIxvd/mY9B+67bOQQOZDEN?=
 =?us-ascii?Q?rNdNRxqc39ycg/8lNByZndJ4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621a8ed3-15f0-4953-aa8d-08d958658018
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 23:05:21.9202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dngc9M2/G5chTb3TaA8DxGlbJoRB8y7qXcE+pxhtaJiBkUjXZ9WuUhgM1RwacfDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5112
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

On Thu, Aug 05, 2021 at 11:33:11AM -0600, Alex Williamson wrote:
> > +static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
> > +{
> > +	struct vfio_device_set *dev_set = data;
> > +	struct vfio_device *cur;
> > +
> > +	lockdep_assert_held(&dev_set->lock);
> > +
> > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > +		if (cur->dev == &pdev->dev)
> > +			return 0;
> > +	return -EBUSY;
> > +}
> > +
> > +static bool vfio_pci_dev_set_needs_reset(struct vfio_device_set *dev_set)
> 
> Slight nit on the name here since we're essentially combining
> needs_reset along with the notion of the device being unused.  I'm not
> sure, maybe "should_reset"?  Otherwise it looks ok.  Thanks,

What I did is add a new function vfio_pci_dev_set_resettable() which
pulls in three parts of logic that can be be shared with the
VFIO_DEVICE_PCI_HOT_RESET change in the next patch. That leaves this
function as purely needs_reset.

In turn the VFIO_DEVICE_PCI_HOT_RESET patch gets the same treatment
where it becomes a dev_set centric API just like this.

I'll send it as a v4.

Thanks,
Jason
