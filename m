Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97289628358
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 15:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA5010E2D6;
	Mon, 14 Nov 2022 14:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5860610E2C3;
 Mon, 14 Nov 2022 14:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcYrzJFFaDGciRm+nCGyewe6kgodYGTdxFlUmk49Nku30qrw9ommnchI3LCenj/d0HFOYZpgczSG5Ctm96/WWJnYjtkHre/I9y6yObBSlwt/vAtlRDXCBeSh/rw6KRtKs1P4HRbx7TDqEGSr6Ga2E21zQk+MKoh7JJwdfZdF7RgEvnhmQ1q211TQY055G1BWolV8ghkyLRQV3X56uG4PfZwWMmj201y2IPh1Bh4eLAsG352gW07wZf8Jddse0IrHpwknTwygsdiaFX4Efd/sUDoT2edTyCdi9/o74sDVKYqGQEa4dGjHcMtVpyfJRHxhFXbPatXqJi9TDbR5MQR2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcHq69i/R3KFtpvlq0hyBzFJJ59bvQIvZC6vqOpV2OU=;
 b=HlkaoUuh9WUlZs3YkxO894gl6ZFBQDdGMnOKkXTQfCYiXV5xJAaPxgR3lvvsl48izk0UOxcRymQBq57SBn5hHXOJwjGCbSAYz4Dd8JRT66n3QcjPCm5IhVEu3lbIcarPkdHOofu1gFF2uOhSpIhsiJ3OdOSyevJLC4/NLsN5ybI7DI/bIXcGAI5Z0nFS0oI/o8hlCOIq3Mv2eeEaRit6rejgeB++wOo99zTYIvI02YWVhCSerZZqU9iC43J0gpr1NKH1KXejxuuisYMCd+Bw7Qg+TVj3LnTZJbwRZHM6x9J+SUVq/VygR8tk4Js3ow6MriKJ3dZpxYrULAdRoaal0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcHq69i/R3KFtpvlq0hyBzFJJ59bvQIvZC6vqOpV2OU=;
 b=MOCY271AHQikX3ZxQk4A/SJYt6c6FSUi+0pcyhM85tQDc+Jq2h7ipeORBC2z7lSwnMrozgAOAhKbyOadOKtZTazev2eu5+l90xb6ado05bk0lFQ44+BN4XJ6qIh57Bd0lX1gHKiTYv4OOc0+fKu7EHkYs83Vbga+t591U8lvIUEpBkCuV6nBBIlx7aVZIJ5bxVQPydF+NWqRVj6nrx8U4Oyl5/rnIw0D4ELB0bmYLgkG+0/CYxcw0RtoWfnNZv7rA3Uk57JlpPY5VQRTMI0kjqA2UpbRTJCMPeoopUDHPPud2AfFqLMfhuZYJELiE5gNQJYbXgbMlm5drIDINnRSKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 14:59:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:59:14 +0000
Date: Mon, 14 Nov 2022 10:59:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Message-ID: <Y3JXwd4sZJfm/Il2@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <f54c2a93-539f-4520-0561-fbe5cea7772f@linux.ibm.com>
 <Y3JPZwEHjGDU4Oyq@nvidia.com>
 <2890d53a-2437-c74c-2082-1ee29414878f@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2890d53a-2437-c74c-2082-1ee29414878f@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0411.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 6992e931-78a6-4340-8ec9-08dac650cb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHD5DTENRskcRS3rZ6cW0unLo9yE24E0Tehcki6S6yCx7fqWR74NdtxW8O0RWXsPlO+T9J+JS+p1HJRgM+peTKBDnSaAQt4A7e1O4Nw27loBiCAgG5Of2z5cC4i4JIuFUNBQUPRjRAGWmpSfmxJTwzwjGHIZO7ZyLgbAZc0nANpsVDB7JgJ3s7ft+Ja+36KUOCFW9g39VpDYj+J/hlVMoZkTpVbYSLARqcpii/TkrzNnrLV+Fjm5nREdhjglbWzqnVQeYJfpt8ZTMPRI0DCmPkgKzAatvmiU3bSf1yp2PzQ3dizt8iz59x/Z8GBul5rCIvcZDH1nPt2EK/c4wmqBbaWm4IoRq5PC79HQRwG8sNwzAZwZVofLZjMyenb6ClBuW7fJKoRtkX4pD/5XBYWeC5VHxc+s+pI8ngL6cQUZZi0I14MFo6e3FeccUGjtg49Uoyv/KUpHtR0P2W632X+vlyvfFJIMRyeGyhBXnRVflwPG/dBtrP3E3wQJsmRlInjRfVQrCmmnisSTvBxaSy6Mcz4+y8W0eMwhgvO6Vwlv7HepBo1SP2W3C7JeyKsW26Ah79MjxSXUG1JS1hu8i97+IJd9f9u6cdJ5MZTfXvWPxT7QsX+Vzoymy857PMEYFZkpTXOb+4gxdrIihR/mgKX8LHeifI1l9LFGK3exJbwXD8v6E74JVhxYZg3+RK/nFtaafUPVlndosaaCQYzA8Euevg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199015)(7406005)(4744005)(7416002)(8936002)(5660300002)(66476007)(8676002)(66556008)(41300700001)(4326008)(66946007)(316002)(54906003)(6916009)(36756003)(6486002)(26005)(6512007)(6506007)(478600001)(2616005)(186003)(2906002)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ssMh4Da/KpTmoeaMwDSQvY5ZhVLXnpRX8OYVeYwy9LWIqcxX3Ltub08l9UR?=
 =?us-ascii?Q?8iKSCisU1/DMZnAlWmt8lPO2isKhQaW7pHCnqt7IuTqlc5D29X/ZwZhmwaWm?=
 =?us-ascii?Q?5IAsUiIHjqSDUvKTXeoT9rSf58KpEKWn90PtN3aDZMXuH+aQ8qKsG6uQxJ8J?=
 =?us-ascii?Q?8XqpuWCNTi0eDuScc8urz6UhYO2k/95/QvpsYyMLQuy9LeYtyVC1wEgqvoT/?=
 =?us-ascii?Q?ARNhFOi9oTkNIiPfbi8rTyH0vNJKIFdqT+3Sr9vWnQP6eTZr0Pf0/H3rxV3U?=
 =?us-ascii?Q?HMd82T4zNT21j4DVI1HcphFWKqxGbsai6szyj7oEQXwG+EabtRwtDFMtdrNq?=
 =?us-ascii?Q?QfZER9QYD72LKAYGHhGBRA965wuh1NBcPAKsaJNV2faScQnyXgk1UclwMcKP?=
 =?us-ascii?Q?taOXmBVRhr8Jz7j1eiQQQWN9FXK2hGbKGIUoGOFvRwCQE89kNLzFrqYLlC9i?=
 =?us-ascii?Q?N7VVrH6ksiCFfGDVORTJqtiKvtVPPh/OtmmH3jsHDjqMhuMz+LH/Lv/LaAlk?=
 =?us-ascii?Q?2H4j5S/cJeP4ik9Bx0an0U5A58K5vkqZX9o2fiU3O7cNIUJqRA3DVR6IDJmF?=
 =?us-ascii?Q?oFgExer/fewCqQZd5aSqaNfh/Y476jjyuKZiCGg3g3+zOxef8/tydMFWaKqL?=
 =?us-ascii?Q?/s0MnV/yqhVxDKb0xsmfuP0Xf9CS+6sTHNnF4tfk1/O5uxDuzN3mTKKUjftg?=
 =?us-ascii?Q?zPhXEM8m7pYKBpUR02gpfArHBkBJYh1UjX7jImLd44NzZhA8dU6sAr6tuEJ9?=
 =?us-ascii?Q?sjbszLuFd78WG5OL+bB5m0MOxhUAmBotuAfuVQKkCopL2+1TeoqaaWqp0Gfh?=
 =?us-ascii?Q?P+UDFGIJp1uA55UBhSiMl2qQ7P6d9ZEz2u+juJeoFha1sEmM87wcdHb37Puq?=
 =?us-ascii?Q?COz7vtKEH20XqQ661WrgulXYK/aifnh71mlqqmEVGCj67DaifaA4B/6yQyD8?=
 =?us-ascii?Q?WzPuFiZaqBZI9Fx7xoerTL3j4GOVcA6U+c00pfd7TsLeum9CCIoClKWroMQ2?=
 =?us-ascii?Q?/YOCqIi1F/S1NGurzVqCWLxzcgCyMuygvgbgM3cE6me/o1KIIircj1OuZ9mg?=
 =?us-ascii?Q?pFlxURLIdoH0a5twNojbRX1Lw3v6HwA5RgIJNOmTHg/fzENbsVi/vQvtEYjn?=
 =?us-ascii?Q?rx3whiLBnHJD/Z5WsgrqWW8lWC4P8unvewKwpkzvGN9MGfMi28V1EKg8U/31?=
 =?us-ascii?Q?KvPHwYYUo1qFMyftJ9U8yf2fGseA9ce+XuarsTrsKWCWC1AQOpH+5BabqZgJ?=
 =?us-ascii?Q?ma9LVGCN8DURu9EcF7tOLt36oN8g5Qv9I+EFA6nj/EwYiCfGp7vYQNmH54pq?=
 =?us-ascii?Q?dMwnz9qs7do8smtNBYb2nYCGt268xTNnjpQgo2TAoPwcXlUGHG3e9XY1Y5gD?=
 =?us-ascii?Q?vkjTJf7CRr6ltA+d61OhKEyh38Q45DOUaD5MPWsKSq8fc5V2OoiNotqFNVWp?=
 =?us-ascii?Q?mRX37P1liw2wkaDbtMcfpfBaOnLFmwfA3iLNNblTro1WAkfiVT7hM8VV7GtL?=
 =?us-ascii?Q?HxSUAHNOUiy5I7pHmdV9PZE0FDMH3ka+a7HKINOS5ecRgHvUujzmO/4Q6f6E?=
 =?us-ascii?Q?Ojuea8w/s+egdZpwTmU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6992e931-78a6-4340-8ec9-08dac650cb8a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:59:14.4009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: beVLXJPTWV9Vi9RX7z/KzWtr4QUUCyew+PpPHsMnMbHqyZTiZqnL4zAh0KYchw55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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

On Mon, Nov 14, 2022 at 09:55:21AM -0500, Matthew Rosato wrote:
> >> AFAICT there is no equivalent means to specify
> >> vfio_iommu_type1.dma_entry_limit when using iommufd; looks like
> >> we'll just always get the default 65535.
> > 
> > No, there is no arbitary limit on iommufd
> 
> Yeah, that's what I suspected.  But FWIW, userspace checks the
> advertised limit via VFIO_IOMMU_GET_INFO /
> VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL, and this is still being advertised
> as 65535 when using iommufd.  I don't think there is a defined way
> to return 'ignore this value'.

Is something using this? Should we make it much bigger?

Jason
