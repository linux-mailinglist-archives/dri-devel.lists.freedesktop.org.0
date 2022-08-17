Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADE5973D2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 18:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0899A1E;
	Wed, 17 Aug 2022 16:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476F6999DC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 16:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZukfhgwsWlPd2Q+nu+S+C3YcD8btfo0WnxgCckTP9TMNNtnF3HHW6ve3+RhlMtboLmrvypaEOUv3Gjpd1CBfVYGUXrz8JV3fZhOBeBN1brXcMCzpJ4jVATX6sjCXXSD82rsE5/oZOTyXc6e3GOb9jcXpgyyw4b/tYBqVW8lFnPygWM1Vzg+BVlSuFqMkOHbKb+7zuCNwXWqYMPdLT557Khh4aNs7mRvFrV1NHIuQ5Qcsv3KvF5wsAagUpdsZWyGqExe/CWDIzcZlWmPXWC6AqzR+JfXTKvzBI8Kamg0y4SimhPGsjuEUzNuL4O10knDtIKCSih0G6AHV0hDHBIC8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUwqgU7qtimCfBxz8fg3w0NBWnWsDwpQ1O5ISVSDW74=;
 b=XoFEfiVQUMSncOh8t9qGntV70XTTyAhoK76bHXZXO+Pf3IeFmvwiuK1EqBqnr5EAty1Srqu7rzI5UP9byVhECL8wfEoanLv7HsrmAYgPV7UmnORD4rnUgT33bQTqZfkOCZEYS0rjh5Pn4WDW+At4GaKIfAT+ERdPKwQOEKwC4ZUa2Ak6KgCZFfdnUZDoVOWyPjnXdvnXC6qB5Nj7fNbHFtcxtrrNLxx8CP5bTEbNB4LKIka06PqDmca/LcZ3wrjs5bhvYCjFJk4yW5MGHwG8vBsS9JNjnW8eA3eALxvRJMhlNLP3jnmJz/NOIdedcCd8o2o+/yJDVYYSEsCteXwrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUwqgU7qtimCfBxz8fg3w0NBWnWsDwpQ1O5ISVSDW74=;
 b=N/wacVt5OZ6OCdpHXPq/k2eDldbCcA3ZCN2Nv3Zc07puhgynukzD+dwUfELPcgvv3cKQStE/bPwfVIPUknpUEPsYrGKrURqOSAD9p8JUPp1mivQnlZIehuf6SvI4mlggP/TAuIceTG9XZ4JYzsJgYW0LdmafkBj0fq/MFPXwpP87qHvHPtb2jyeMUwR4uvqv4Bcn0c9TT0dHVpykXi1mJAGjEe21vEAb8oC6nkgnUvgCBYLWYol/BDwPTTrNKFndynWWDyaXZTAtXyZXTH78oYw3tufVjlyprFLTv0BQIO2Fogz4cs2urNWKJ1vNL2mYQSYrNRcnxn/CGe9LH5azOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CO6PR12MB5458.namprd12.prod.outlook.com (2603:10b6:5:35b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 16:11:45 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 16:11:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Date: Wed, 17 Aug 2022 13:11:38 -0300
Message-Id: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:c0::14) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7fdf4ae-6102-4c63-626e-08da806b2d5e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5458:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnqG6xOGK0ctg9WxTPc+N29Pf3TfjrSDJ/1uYIpQPX0WfzHZh7EIVl2et99DVo5Lp8V6HQypg2ZLHZEjEXliKoafs93XrcQ0HURomBV2aLduv6r1QNinhz881T560gLg65QAy6huoTCGGdb05pjwMFoTpsCwmS1U/v7ThHVTu3AzL9tvVWx/K97gSLLrV3Sn51/6O17LvJvMLiz11qj0puFIwrut1CBLfe1ZCletP4eQMeS+Nr3DHDu2X5iN7joFY2O77qBNk9YyB6iAcG5D2Mvbm2DGJTvLnwjS4pSEl7JDm2x3cFYY199qjUTJA3wDBsQt+RzfPtmBIUHqOptqZQOjlAlBzMPlkPp1s/o/rzFb2VuhKIFLTFxem7iRTXFZHyLAO0koH/mIKW7LW0PUcXZfgx9SiTgQGfNVV0nmmbfjedGWzLYS71j+V1LX5tMzbj2Ozq4QCXKf9XBp/y0QTjFNRNjezzf0Le5ihmXWJ6rH0E8gTNK2gmELCcd0m66eXJRWgIXyjWSqIgX+42ZWVScufst/cX3CpAiLodRZn3KDrU/OHWdm493w2NbEgmgfp6fqc0Ne9tI6pQ5jidmnyl2cp4PU9jE41F/RWkspEBspEpqdN6RDL4xUUt6yGlajqHUE1fSEzbMQYivru8MUwezlBEXtaTP5o7eGZ4QIW54vll1bVSUo7C9u3p1a0N0byM0IjeDNcgCSSeOiEiIopXPklqeDKv7O8oCXz/Am+O2RrtOr4JM0zcbaAgYaDK2MbofsNS9+vtqBT3isBhbLZO6gfTnGe/7G2RG01c94Sfi0VPagwI+9vwywSAYBGEY2y9o9A19YTibhK0r3+pf67usEeMaSo2r4mNLYUgmdZIYPGii0qXKmEyI26TY3eelX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(26005)(316002)(41300700001)(2616005)(7416002)(6666004)(6512007)(2906002)(66476007)(66946007)(8676002)(4326008)(38100700002)(66556008)(186003)(5660300002)(478600001)(966005)(54906003)(83380400001)(8936002)(110136005)(86362001)(36756003)(6486002)(6506007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q0Q/4WWl34twXwKm2JshZa9m3YT1W+z1E741UIEaFBS65uqYBJCKFX/DL5iy?=
 =?us-ascii?Q?kzQjejMYdjsIVnWbnwwTV9vym3FdYWZxm1yJ1TWDprkkVv2/RlC80gEyiYeO?=
 =?us-ascii?Q?w+gUWKm9yR+SLNhTyyFovHsCdAxyip3NV0DyUSFH/rX/erczZmtS8vZZ6Jav?=
 =?us-ascii?Q?0CWFJIMzlVRSr9mZ5LJ/OkzW/s/5L8AHYK7GCpqKck6hHn2jdPFIikgmU1wN?=
 =?us-ascii?Q?2QF/ASgXWFRJ+Ild1GaYoUcR7XB4P73wuGa9jw3/KIQXbyDQb7lYr7qFus7C?=
 =?us-ascii?Q?Lu5f+lb9FRuV9PzTkYfI6BY2ZpugSDLdWGUlBqV9peTGzEV9smUgFDTY/dS3?=
 =?us-ascii?Q?BHuooh9lA6ZmMlOhg22c9aNRR2SbFZJlARuoUztOoQzB9qo2NwffJ85GCLMf?=
 =?us-ascii?Q?0K5VuieT9f0T2Gr4ndAf79aKwm8YpEBK9p02LNBiTHTGD61pokPN9RaKN4N0?=
 =?us-ascii?Q?e4GuG7m1+Lf8kpik3F+Ww7wcOJGNB5zPU7oaoP8OjGASqKLYNbam0NED5wyu?=
 =?us-ascii?Q?EFP4jbGnUWbY9RPITfMzqL5l+dVOILyrSwtTrqzSE2ONz2GLHnA5U8wuzEBQ?=
 =?us-ascii?Q?5o9A2SAsum1sZ2Az4jb8EvKycQyXXFaVNt5HZMQkH7EYoz5GSIiwmiyVbt4h?=
 =?us-ascii?Q?CCIGBUV03bxxK9kSNxbfZQYOy04TVlYVsKVS5EeGNzt/0CQksxm0aGLZxkEP?=
 =?us-ascii?Q?lJfwu3TmhhiwxBAiqSSrM77tOmZAcfVj/8vvanWCGUC1MXIIQvaT9Aevkco3?=
 =?us-ascii?Q?kXPXhZ2Cx/AcLPZCOGh5H73GC1cdG0RovsqB4HeGX/LnICx5KkPsnW243au+?=
 =?us-ascii?Q?cK6tXeYSh0lU9dHRk0r5IVm5qwe6MOGEVaTh6WJy9Y0eDkYUs6heENPXBCEG?=
 =?us-ascii?Q?GXbtah14W/nntExswk01HF7dmF00GR9yLVCw7SZvT6KkswwVBwqc42Jm+Mvs?=
 =?us-ascii?Q?dDSrJNIl+xyfr7lYqfCzF+7DmzRS4TgjL3bVZ70ULgRSsie9eM0XDumcM8ru?=
 =?us-ascii?Q?B6ZkoMQOxkCxyjdwfmK794s96O53RCB6TTslxgAhgCr74ctI/daPHCejd1rf?=
 =?us-ascii?Q?uhB/f5NAIkMCxHWHmuIyqFNADPVljjJ3l+mqGHqI4xklEWtlNxrtfzdcaHQg?=
 =?us-ascii?Q?FCyXkn9dS6+/N4NBr7KywYZ6lyoHiaQUPqAE50ENHUIK6Y4CAvM0Oev4X22O?=
 =?us-ascii?Q?J9HFgvV3urjqjwVbeZ/Q8T3nbXJvzOvuB0/irEc0+h2rUdDYQfEzH334OLG3?=
 =?us-ascii?Q?XGBW9Q3ZtE4Uf5ARhR6NOJl4PRG7OuPB3Z0+xp3BwbvlI7A9S1TGZ3Ukf3gQ?=
 =?us-ascii?Q?WhflBXY0137lR5WiizMvSiHp9ERcmdRfpdFj6LLyKczYh7S1di8yVQOyyz7y?=
 =?us-ascii?Q?l2pKCdO2KLNia/5Is+dbmapvQ1XH3eNj8WHpXeLg9nkCI0yQvXJ9/CmkZnWk?=
 =?us-ascii?Q?2HiTrWN1rvwdlX4afzd3JhCTAOMnu//teqi0ku1Cs6x1UCmks1iZibcvfbmi?=
 =?us-ascii?Q?DS6b5rthl2UKYAIXZCnRKV1ImHlv4CFeS1wvb6nvV1gnc8l9vxZPV9tRE6V4?=
 =?us-ascii?Q?y2vvBKij8Un/9Supo7uppIPHdoulpLtoGNcc+sfL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7fdf4ae-6102-4c63-626e-08da806b2d5e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 16:11:43.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsyIIgueehJbpOxHVC9fbcFMWsWfDZ/CXFAbj/XlNFBG6EaZQhLny1ZzC44SDZvZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5458
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

This series supports a use case for SPDK where a NVMe device will be owned
by SPDK through VFIO but interacting with a RDMA device. The RDMA device
may directly access the NVMe CMB or directly manipulate the NVMe device's
doorbell using PCI P2P.

However, as a general mechanism, it can support many other scenarios with
VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
generic and safe P2P mappings.

This series goes after the "Break up ioctl dispatch functions to one
function per ioctl" series.

This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf

Jason Gunthorpe (4):
  dma-buf: Add dma_buf_try_get()
  vfio: Add vfio_device_get()
  vfio_pci: Do not open code pci_try_reset_function()
  vfio/pci: Allow MMIO regions to be exported through dma-buf

 drivers/vfio/pci/Makefile           |   1 +
 drivers/vfio/pci/vfio_pci_config.c  |  22 ++-
 drivers/vfio/pci/vfio_pci_core.c    |  33 +++-
 drivers/vfio/pci/vfio_pci_dma_buf.c | 265 ++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h    |  24 +++
 drivers/vfio/vfio_main.c            |   3 +-
 include/linux/dma-buf.h             |  13 ++
 include/linux/vfio.h                |   6 +
 include/linux/vfio_pci_core.h       |   1 +
 include/uapi/linux/vfio.h           |  18 ++
 10 files changed, 364 insertions(+), 22 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_dma_buf.c


base-commit: 385f0411fcd2780b5273992832cdc8edcd5b8ea9
-- 
2.37.2

