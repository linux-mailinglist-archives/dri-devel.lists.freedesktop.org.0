Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC6357BEF9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 22:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A849E11BA26;
	Wed, 20 Jul 2022 20:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0BB11B4E3;
 Wed, 20 Jul 2022 20:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7Vv1tHoh8XNfOkcW2qPnQ2GhdNEKsYx3Gy6duOarqMG8rE4bksOR27aELOzoKTfWZh16ypW4JnvU2PNbXadN9XarkyvaVvb1OHqmyj5Lwvauh+vPXzZZlld7fHBBOJGNzIXY7704c+GX/V/0utRMPdgWzaUO4eXCJo9xsyad1DkD5oheOZQjFcMNOYbMoe90mBe2RIn+i7iq7xpye64iNWBiaZl2RHB2pSq7zgBbCy5AEE/brmr4EgyBCTD1Crjt5HeAHXSEk3hQoQ9KqB/Pi1xW6hOLdVJbybK8yHnRANomD2uTdx+p7AnlgHpTsQCJEhJewVgcMb/Oyn6zr9yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFIV/uobVcUsxlqWI/QapcqAfKZu+w2VoltTiRmWEuU=;
 b=b/zNR3VeaxC/rjRF1MXukl3kHZ1v8pua346nG+LKAjqvJ3rxeJuuIh3RvcYdFG9k7tuuZT9k9osrUrWExQtiJTy8L6hIt6gxabXn/hA8W1Y+K5iEJcDpI+3nRaO3rL/vSbsuBWIjPEy3hvd+RNKi0mAsK8XnFpkOU+8CmCCqWzGtqk58s6/12XeRkSr0/Clsres67AydM6b+0WapsD/qTBc+zDgPe0OYKxzR4NltKMm5ktwA/yCvsu2mHEntVcpLkTq2zo8ZAIMJsrMcFIpnYzVUXFcXLrC+V4Z2sPAHKtjLZgdMxEq8E4nxeA4eiFtS6Xu8rN87MPpaYCEFsyhDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFIV/uobVcUsxlqWI/QapcqAfKZu+w2VoltTiRmWEuU=;
 b=D8WjuBh6ZGgKl1mZndxxpKc84EJIpcI4CNnoJH47MrzIVXF+85zd5vdBwioiJiZ7VKFK7IS3FmmIX84Pu872+1BW65aFY2tr9tqaWFz7P+AQtCr37wvlp32KX0wD8AHKV0yZpeTM1JVyqL8ipkMXtXajaSU9UMPquIeANRZ5XAN8Cn/FaDAZGIRrI/mCFtWmJayYlwY1ReRym8MkCT5ghiCwC/A90Og35pZV5DMhN/4ouuFXywtJOxW9meykusznPJfqUBjkId/0KkmwRhrfZtNAuNgd6lltpfVPkdvKp06nY+qh53cvNfO34qFu8R9VlypHZo+eR6pZLUJ8RP9OrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB4783.namprd12.prod.outlook.com (2603:10b6:208:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Wed, 20 Jul
 2022 20:08:31 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 20:08:31 +0000
Date: Wed, 20 Jul 2022 17:08:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220720200829.GW4609@nvidia.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <20220720134113.4225f9d6.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720134113.4225f9d6.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0265.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::30) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63e8c680-5a38-4349-e819-08da6a8b9e08
X-MS-TrafficTypeDiagnostic: MN2PR12MB4783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpu+Cv5x5vqm8Yu+AgAkuOYAaP+lqB2Yvn0rnogh/qQ4ARw5NbRoZ60m4/ScyfLz2i02aOgJ/utDeLeK/YCWutct4m/4eVz4F3cCNHw1wEBCuPbpupclDFYHbv1lrDdru+WhuS1caatLg/6TPpzUQyw3WL2tJRgW7msaEwEZcjpnOGa2fJc5afuhjHPir9qXlZMnDdxwDeDCvYUl3rVyrn8hnTEa5xnW8mbDxZHeqnKGb8nUJv3BOE6lP8HgREtw7qPsYsyWn70Oa9tNILgy1crZJfBV+3OcdnF4RIjsjKkIUyKDWsLxSKcaEt6CuwLUgHI7UZvTxLj8HCwya4VgInWYrGUbADDnOchvzX8iRFEs+oZts1uuFzApupnM4IYTycMJUczfhOHVr2WstlECoa/0FJem42Wj+nB4B6lrJDLxiPNN7G0N3xgIxTlj7B24Drb/oVkqzBC0Wu06TtgCvgfAI4dvo8U0UtQFa32c1zsdflQ1/m1a/g4H0xaEtimn8Ttuv21JoOFXNQPMsbcF4PqZpnLbP4WzAa3oROSBEKgJ3rxDj9jVBna2gs2JAPRuvpUIPqFYph7cJNcXJ1fhpHYTQmq+xKA0+qvH/YPTglR1VqOxCNjXUxgPyAI2De+jcYRNnsUcjVLefH4Ov/sWKjFETvb4vRTgXiqB4U3nIXdDnXMaEFR9o7NZ6b4nxi5xlgI8Ku6Beuq6z6sMEtxPJm78Zx7dTjMF9scFlz41yJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(5660300002)(8936002)(7416002)(7406005)(33656002)(2906002)(478600001)(26005)(86362001)(6506007)(6512007)(6486002)(8676002)(107886003)(2616005)(1076003)(186003)(38100700002)(83380400001)(41300700001)(66556008)(6916009)(4326008)(54906003)(36756003)(66476007)(316002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m5O4tfz8WmT8mit0zKYsuq1NArr8EDAaGnEAW75ZquZisT8K52BgYjwek6vo?=
 =?us-ascii?Q?R5vR9Q24ad4Thkc+b644rL1mlymfWiv3uGB/P9i5eddDBS+npuIH0H6K8x0p?=
 =?us-ascii?Q?Y4aBo8MbYxcytmqPkqEGtEqqDXL5li+V1a+xNXPqFgt9yYPE9EoVFYkfYcdj?=
 =?us-ascii?Q?Busv6FT12zAWSMgL3ryrWW6M9jEIp16pac68PJhuIexkTlITruPqzwlihuIG?=
 =?us-ascii?Q?94ifwlZppWwlvqMb77KEh/IoZytAaQJMBPSWSoZW2CwLZzrA2D6w6Ex98H3G?=
 =?us-ascii?Q?/7wb6O8PMcsKmBt3RV2svB6eN16FsMbFg6IHLDHY3Uxpn/m0BvgqHXcBaOB2?=
 =?us-ascii?Q?nlT0A92rijjEEoR81XRIeGSo26IDu4gDzDW7CWMwtiC5NryqFkVK/ea8Vjd7?=
 =?us-ascii?Q?MBvjGk3FELJC85Rh+vs3ccvQyk+olOetUhNnxZYV0qBtcnsn03UfazMt9mmu?=
 =?us-ascii?Q?j8Uye+7HYzwTeSjDZrn4bBN2WK7gVWO8rIfwdxHd5OVbA2i80FRrDUM0XOmF?=
 =?us-ascii?Q?84891zJs5nwVj1DzJno4El/JrluxCFUqHKZ3TiksaU9MSTNNqOkSiLhkv+ZH?=
 =?us-ascii?Q?la4i9P9ZPgIdVWgGBtJHT+pBZU8/JDs1bp+CkMuNSSQMCUyZsj1zS1I4vZYR?=
 =?us-ascii?Q?U6cuxCY+HcepkMMA556rU/3wS2LB7s/Idv0w17V9Cu1K5PectQ1j9ssVwHPj?=
 =?us-ascii?Q?cqamtNPopKkfQMmjY4LMVtd87rFhSB7rIhXIawp8k1H4W97hcIWw8SliWSbG?=
 =?us-ascii?Q?sQ8Nzu/HZfq98lpYV6t+2KfkeCtUhA8Sv4OGxXIvOR1JLpsNDa5QgthXjEMY?=
 =?us-ascii?Q?x95gleeci8S78HIDkmsRIFDbFZJXdKs24MdbwO2cxkWIQI5SNb99UcR4g0Ve?=
 =?us-ascii?Q?hubtUpMQ7+P94boHgJQxjzKeMSQgAD+POkDPWGIMmCJde77gm6l4JyqBnn9o?=
 =?us-ascii?Q?LtOTAkXLNPsQD+OGRiGll4TpFUuqEC1hFZq7wiqwcFtMYXvmE0cnD8yOSUxb?=
 =?us-ascii?Q?BPj4K/dSpEgIEyFnsYq98QddT0km3g0/MVUmzb4MCbs6xaQ5RWCdSZd0vEY3?=
 =?us-ascii?Q?rNWSVZVpt7hF/sfFZuSo8aY9a3/dhjUPYC2xYmS9gXl0mzdr+6n10lWOiLYG?=
 =?us-ascii?Q?kT/bYokelZM51R7VRQWW0sFZdbOCeUx/ONGeDEydMB+eca7mjKecPe8ofeRl?=
 =?us-ascii?Q?CX8J9vqB6xbpvdGKi3qKvOcn40/dnW+s5QQUNcsOXU5rovuq3r2drFFAnk8q?=
 =?us-ascii?Q?DlPrUZSeUPe91O3TY7QZRMOj/bwS4H6cwZbLZ7Y67Co3c2igEOzLCrcNsleA?=
 =?us-ascii?Q?s5L+XrBeNCnNuxaNB0t4uUCAYG1CxrhOPpNq8P1LlVp+yNQPj6od4hrGfKoF?=
 =?us-ascii?Q?3PVtA1BNHa1bAe4FryQK0l6jvF3qP2C1xD2KvaQ5ln5vU9M9kYSMNmtilEgb?=
 =?us-ascii?Q?ojdjr5PUhVJHK6vSxHXD0s/JkesS08/qjryWgk7IHPgkzS2qS4Y55MffYOR3?=
 =?us-ascii?Q?Iw9QlN4XkximTZuTTsS+2ZImVwQNvgXofpzQl+9tjtXMqwBOdgAkoPCyQerq?=
 =?us-ascii?Q?z2s1DjBByfthAT2on6Fm+gqEWIr7FjZyGU2ALPBL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e8c680-5a38-4349-e819-08da6a8b9e08
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 20:08:31.2135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9MiieropZOiHFi/DBbO/QgDICEon2BdheESMjxTfFqHvMd2zqkxDJayXqLFJ76T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4783
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 01:41:13PM -0600, Alex Williamson wrote:
 
> ie. we don't need the gfn, we only need the iova.

Right, that makes sense
 
> However then I start to wonder why we're passing in 1 for the number of
> pages because this previously notifier, now callback is called for the
> entire vfio_dma range when we find any pinned pages.  

Well, it is doing this because it only ever pins one page.

The drivers are confused about what the contract is. vfio is calling
the notifier with the entire IOVA range that is being unmapped and the
drivers are expecting to receive notifications only for the IOVA they
have actually pinned.

> Should ap and ccw implementations of .dma_unmap just be replaced with a
> BUG_ON(1)?

The point of these callbacks is to halt concurrent DMA, and ccw does
that today. It looks like AP is missing a call to ap_aqic(), so it is
probably double wrong.

What I'd suggest is adding a WARN_ON that the dma->pfn_list is not
empty and leave these functions alone.

Most likely AP should be fixed to call vfio_ap_irq_disable() and to
check the q->saved_pfn against the IOVA.

But I'm inclined to leave this as-is for this series given we are at
rc7.

Jason
