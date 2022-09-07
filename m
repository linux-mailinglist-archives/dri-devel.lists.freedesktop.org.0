Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5745B0A9B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0DF10E7DB;
	Wed,  7 Sep 2022 16:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27710E7DB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoUZB923Eu2yMGfhFiDaKw1AK+aSV+AL9iTDoNQqlB38+tjNWWqgAqb6dx+2bNqZYY56BJXHqXf0e3wnfGBZ1YrIzGgHd4lI6Hv/BorL7u8uTBHf4AU/2nHi+AB5MseHbqDACgqWGQKztV3vq56twTWyr5JtjrGwLYAwEFZ8ORuI2XNnQfQVjxVjv/Ei6LH3mkH0RtY1zWEIT5UZv8eLH3nB89RSHNL/14fQu9m47KyLQGlQWQjMsizOWsci8CEY++2/igXtdAbjyS1IVT0A6VD4p4Jr8sFoGt1BjRMJyRCq2CnE3xsnO3pubN/KCnZhC2CVRkoYQkJKXrTZ/Xr0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vdcod2Z9Jf31G3PE3RHoyoVDpCoDWuFSRz7PqnFKB9Y=;
 b=kRD9o1zaVqv0UxjakaMLsIJZWIWWV6AOJgi8+bH5Btteiqt8xpXmVWvVl1jLHBJpKpx/AHCyuxNwTvveSqV2rkpGxYCxFjcvEcDlRZAvf1Zr3c2H9NixTe4CjFXT/rB3oNFCFW3Nk+OCnV9sxY90dok7ocMG8RFFXBAmRd3VX+u19zDyeveR+g0WYNlnCy+QRXIQRbsIwd6QhNN45rXhGHYgpX7AhPnBX5gNY9J7nka2AxLwqGKxBDfJnFScEXt8tJTgoV2UtBU471cFg2hBo7i9O0swRzE4bBMxPaYQ31xe6xTvxCIPENEFCF97L5iusvARmPbFfFOWI/D7LMKNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vdcod2Z9Jf31G3PE3RHoyoVDpCoDWuFSRz7PqnFKB9Y=;
 b=WueT0NL30khrYkJ/377+GYO30mU7uzjkMZo+zmDN7pVPLxdAzhf4tc6AJwB+tGlOO6vL/3I+MY8Lmc+KLruQcBirI4+bchET0V8JbPTxOH+VPhmi+yqS/ZjqvCWCz+W1VehTvUxJyS1F/jcUYzSCM2NcAOwPVSmNtCkbY9xD2e++P9IBhPT3SYPNp53STyJvbz8NegK1DcIz56E094tNFfsO/fgc6glQKkWHYB4eoZP+QPHpCz13vYJEPitjhVchN25sI/tTmWa4z65cBdf1eLHR1FrKUa/iiu+5j08GWgmY7GqyhKmLrRuTTnx8PC5DuzCtpt48meROQ+pzZFyPHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 16:47:25 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 16:47:25 +0000
Date: Wed, 7 Sep 2022 13:47:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <YxjLHAw6rAcS/ax6@nvidia.com>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com>
 <YxczjNIloP7TWcf2@nvidia.com> <YxiJJYtWgh1l0wxg@infradead.org>
 <YxiPh4u/92chN02C@nvidia.com> <Yxiq5sjf/qA7xS8A@infradead.org>
 <Yxi3cFfs0SA4XWJw@nvidia.com>
 <6a42a8bc-4e2e-4502-3e7b-1a616dfee351@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a42a8bc-4e2e-4502-3e7b-1a616dfee351@arm.com>
X-ClientProxiedBy: BL0PR1501CA0011.namprd15.prod.outlook.com
 (2603:10b6:207:17::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddbcb250-cc03-4284-b104-08da90f0a441
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6781:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQSZS9wr5PdfIAaC6l+QowKGqlf9/JgjmY7w4YpGhKN60mI5Ab+URSz82a+j3YGxsuo4g9RSFWSOjEJ1GM9hZyYZ+olMzOWum+0un57rHoCcglMHMwCllvIhCc2tEn5Zt1A5HbzxawEX26jq0Hne7txWtvdmV29ERHiuWAAE470KrWfojAtoqoMCcLqZmuceDbmUkCHa4duq+BZv2KsW9pTvvWUrwwhoh0knL71LKVhhY9ZJpRz0PmPYx/PrTZ1nTURBDzHXv20Pn1ZPMEObYXcKJrh2YYBr8zcV26MVQAIL5HSpsVuNGcQkQk0eCFLwfV0UI7J+QZMv10iHYrGxZ7bOuU22/XhJqxi+bUsO2naZU4Xn2dzdKERMcPD/a1kCrztgHb8VQdHyKIjereNXGjmzr/xoirQe69OO5O49DtZEh6PpCc2M0sCLjs0zuVCAUz/Tqp81JSO+LHL89FABHCqSp+b/OYd4cZiJcCPft/KfG1PWprcI//eJEhRoTchOy3L3c/pm5t1rtZTWELLVJXOIot+ZinxsVotsKf/SJQxIZPIhZ8tKZ0ykqBMZsnD6RFpJw9W2YLUQunP3+kVRaoFiG1x4NFIiUyLU0Bv84k19KIMyxCxXx/FZRYaH+i3YFjHgj/YjFVyjFfgHiltlXSWJLusaMfbZBuA0n64d5zXeuOeBduGC6GrWpY8jXcCl1rQNMGDV782SD/u7Fi1frg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(41300700001)(86362001)(54906003)(6916009)(316002)(26005)(478600001)(6486002)(6512007)(2616005)(6506007)(186003)(8936002)(2906002)(4744005)(66476007)(8676002)(36756003)(66556008)(4326008)(5660300002)(38100700002)(66946007)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2f+y9KGuC/ViakE8e3FozVPKVWpAUDudfjRXI69MUi+snDtSAHz2MRHwjb6s?=
 =?us-ascii?Q?bH6pcjwlvFgl+owVWSt1MUc3usufVxRUuGFYq5hDFszrmhFE/a8klMUpIwQp?=
 =?us-ascii?Q?mnOB722H/wVg0rP/lvh2mlCH4DWueuEKgRM40lonruG/rZuF120YPVWzJkno?=
 =?us-ascii?Q?IiDAx8W7zt+xdqMKg2L/EeVRra6DjOFmCDHM7VdG6rkkF24qSN1A6PLRsK4+?=
 =?us-ascii?Q?szTY+Xps5xucClRQI/KMN9PaBtgE+duauDr3f1Thqgacr/jooEJd/mgH9LVn?=
 =?us-ascii?Q?eInHUFdBpoCV+rpTMjRMSGWI/pI/noi06weMgmNfZEHBhto7coyJP+eWXBzQ?=
 =?us-ascii?Q?1kcybpB2fc6UpBHu6TNDxCn+K9cvrOcfzVNOFBUv+50AStPK/bexHQ5Zgz4Z?=
 =?us-ascii?Q?vjYc0FM1ZBKEvhemsENcrcWdJY4xO2mGfT2UypV9S7Jn2fOVLlvECjVn/CYH?=
 =?us-ascii?Q?wYNiaVdZZ3J5LFED45Z7maMoo3PKYNEggJy3AS3UHqZ1LnxEJ0nfoJheV21L?=
 =?us-ascii?Q?RZcsIoCJOOcX4wW1VRehZo7wDzG/AAEJo+N0bUopbN+wDl/Gm5Mh7HZn4230?=
 =?us-ascii?Q?nrMj/InfAAExdZ3KCJBMDZsSZHilAFeKSvNOO7x0P+jniRkYokbEnf/zSyOZ?=
 =?us-ascii?Q?CiHOYC1Jj9OyxIaIvMdDypJLcvBKWvz9h727GAvdgMTsqjetYA7oNDfEPx6J?=
 =?us-ascii?Q?fHM9TOeujm0BzzhdrmomqpnH2+UdW3NmS7BIWUj43yW9hy7WcqD7+xlx8ewn?=
 =?us-ascii?Q?sRpHSY2ugjj3VjAuAeImeSJoa31Tiyaeu+ZM4sTxBbDt3i6/8p2HnmPq4Ye1?=
 =?us-ascii?Q?SeNuQYU5teVF560fC1EBueB9zrZnk2bZWFn1GGC3QM4AfUGVloOf8eRwAh/r?=
 =?us-ascii?Q?RIm5N5hjsaGNXwl0+l2ON7eo9Jslv1ERbqOHXKPBGg3FB5daHKzK1PTbCU6w?=
 =?us-ascii?Q?3cpmPMcxGhLxhxfDs7xkTIXYXPv9BgHbFYbl3LMecYEyS1PY0y3taWxpRN8h?=
 =?us-ascii?Q?BIoxG8F4KSC+vsPareqPjPf+WQmCJ0nW8KsMYVEE+fiFeecAG9xxEoBBkWDI?=
 =?us-ascii?Q?u7n4K0VWRHbdjIDJDGxHSESgJtF1Yvo//fkgqW5Nz6Q/OjNUa+VKbKhJV+lD?=
 =?us-ascii?Q?lnrVfKq37Z5QYlBlzSdP77Ii3k24n7tPP8Dpwg4j566fjhV5XVRZ+/vc2nzR?=
 =?us-ascii?Q?FiYd4vkaDdGqECiDgtShFJoli1CSeD0otX5pAB6yonn3dEANFq1wLgQfLK7Z?=
 =?us-ascii?Q?VTG2WrnpNjFEhxR/4x4SMs0dJUJeju00pmi9R0IwXK03duYeRxnX98Gptdl7?=
 =?us-ascii?Q?RgZpkyRmBA3V9I7G28BXHCjJL7uImCkbvP4H94ujHgduU5alUX5ceWvz4EkE?=
 =?us-ascii?Q?YIsh36Jme9ECfTeHgTISD2g+8inCS3aWknaRXGPt2xoFEglLKSAousNq9wUO?=
 =?us-ascii?Q?xtz9ztY/5LCjlR1FWE+eD6AEO10T3Eiyk326pZPx8ry3ewO9EigdmimSFM9d?=
 =?us-ascii?Q?6K9/q3lqD80NRBS7WpneOhfz26rlvaDWymm8ndynIrX+T/xYq6KcSjJnfmPu?=
 =?us-ascii?Q?qzLUVvui22I1td0Lol5BUkJDZIvbNjlK5HLaoLF7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbcb250-cc03-4284-b104-08da90f0a441
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 16:47:25.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjY8SEi+nD24r7GryHw/U/El1uRnqIOJa/esnz6HClGUUXJEB4IFB1U7ECZ5ElAq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
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
Cc: linaro-mm-sig@lists.linaro.org, Leon Romanovsky <leon@kernel.org>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 05:31:14PM +0100, Robin Murphy wrote:

> The only trouble is that it's not geared for *PCI* P2P when that may or may
> not happen entirely upstream of IOMMU translation.

This is why PCI users have to call the pci_distance stuff before using
dma_map_resource(), it ensures the PCI fabric is setup in a way that
is consistent with the iommu. eg if we have IOMMU turned on then the
fabric must have ACS/etc to ensure that all TLPs are translated.

PCI P2P is very complicated and fragile, sadly.

Thanks,
Jason
