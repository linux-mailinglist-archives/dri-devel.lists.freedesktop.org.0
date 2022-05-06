Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC651CD9B
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 02:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E5310FEE0;
	Fri,  6 May 2022 00:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A6110FE04;
 Fri,  6 May 2022 00:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVR8EXdnz+nHr1NY8/zC0uJGtGATzY2k1dIM/NYyOT6nriIAZZlTz0GS4C41xvof3HoJnOXYneHLmdUofgPevKU3uFFyGrbI3+WgpsShQuhEpsENufea44jIKQzrVT2pe0wgkWEcmSZ2jLn2l0IGuLBihV5sCjSF0PbO4Wxk8TShWoEysssHv+oprihAq7JT16qCkfzWN9Lg0dw6u1RYGaRhF5M+gYCuNZll/B/mltLCQ3dNhhTNz2QYGl43pJUOwlpMTYTKE3dY1FVRRVBlQh3GvdTLhnorf0sH9HqdiwmElZHmo3w7e3I6p3cuwkMnYKqS90jMafYAIvrIVaVQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR7awMp1FQ2riSY259fvzYvHzjchPZG58VX+4OESyo4=;
 b=CuEaajx3ZwulCUnqywvQMe0SRR6mHC3llNZ2Q1ixPdX5vj/bOB9bxT473NW3GvM7BhfrJ7wsOgAbWeKgzeHtfXaSTk55mhZ+trI4NjW8pRTkM+EtCEZjyYKCoqTkHclA6i/XXHtHZ1wdNOyxFGGlrElBRv7Aono+8BfmU/nQ/k45eexOt5Y4RVaWtH/9ne26DL2wq4+JVl4oEvkkDUnKeTBBn9fPm+vPosLQy7dS5dpHAExYzD4Q+dxzBT9TFYSf044IqP3usTpxbeL+nLrxEWKk/YZdt/0faHJfj5gd3CsVffiMSqiXoVlB9XZsma7LfxPJMPiNVMqzV/28Oojzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR7awMp1FQ2riSY259fvzYvHzjchPZG58VX+4OESyo4=;
 b=dAzGvHDk2iYqp2lFrZOuv9QbndDTa+ABUIRWqq75+YbQ5Ii1GzgGC60EiI8gO13QzjBgtFcPmSSXqdN+GwUDHra+ZrMy1aTK4e7RNZP4naLe67LigmOSsCMZkTok1SprFzwPB5WmOoHhsgj11zUBMuEWJtFEBGDkSJ1c5d0m7EcS+Ug7JdReplI+y9XzTjQMU/a2rrnzHxEpEAXMwMW0rm+3QG8v8ERy9eygKFCMNvrx/JEe9piqY4gbI2zP6gzc0h1KX2pCS9O0NRftdTzFKVsEcx3YbO3VjX9XNxkBkMjMCyHy0+fTMCZ/yeo++ysut1z5DLr7dK7TYA96ReH0KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BYAPR12MB2934.namprd12.prod.outlook.com (2603:10b6:a03:13b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 00:08:50 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 00:08:50 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 0/7] Make the rest of the VFIO driver interface use
 vfio_device
Date: Thu,  5 May 2022 21:08:38 -0300
Message-Id: <0-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba4bd95-89e2-42c9-aa58-08da2ef49792
X-MS-TrafficTypeDiagnostic: BYAPR12MB2934:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29342C7E8A146783E8A3B449C2C59@BYAPR12MB2934.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ko3O1NrvPSbsYpsdi12u69YqGn0LEnKit/InZKSUWTDlidXjNihZ4jtMEJ/C2Az+lFi/9BniFRVC2gwIlSV29eIHZGfy2PfWx41kljX1WqER9qiWtz2tfUC+teHfYoZ/uW/T18aJq0WHyL3sJ7ONjWHWVKJxctFA7w2qwOANwLE20jHv1FOu74hKYnrC9eh40KjADr4GzoZHHag//vqVZJg9unEzE8BOUFt6cV4HenAqJV8bjjRy4YwpwC8bVMT4bO1d+eH1B2PfdgNcONzc7ABjTV3Lv03sdq3XebtHF2REqcqBVYxnvtlf0eDRO0FW7jHHm7N8NZgZKjF7z2yjhbTcOlJ3pPks4A0WotGTTACndkwWD/O67vkIA0mNkvJ6exJ6vaDalxTNGJkSGqWeSvCNXT1lalPQ+/sCybAwcwOX3C+VXOFtsYXtdNHZ4S5V3YNYH4l6QodEfj7IobSjUVCZOo929y502YBXFarsQ/DpXPmIS6jTnJwHgRi5eFX/XcYUm0VZN6/G9e91zcYeqObZTfJ/Vv8aOTRcTlBKYPU/actChxEQyPcnZfdv5vsMcxd58dN+5g2UqJxipo7CPRW5VpCW8u4SqAGhde/KHQvNRIR3LHy2f1kan/BVNYuH8zvnRAWkZokKBGIgWL0gA870fJMw3mDQ99VwmAHOcG93S/59/bdj3+NDHRlqTa4dUjKwlJinoAhb/v3So8C2oKrmMLzeQBTdXz+V2gEK0kYNPmPUKdOQD0QXgsrSMA54n7a7hVL73NMtzSfC5vYZrwj4ijuNITGSphdwDZbBQMYYlva654bp3llmHL9e1+FQhJNmcJnUtsaOsJx29wr8aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(2906002)(66946007)(66556008)(54906003)(8676002)(86362001)(110136005)(4326008)(6486002)(38100700002)(508600001)(316002)(66476007)(966005)(6666004)(6512007)(6506007)(186003)(2616005)(921005)(26005)(7416002)(8936002)(83380400001)(7406005)(36756003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nXpbs3eHNE/PJfDyc0lGF2mRnNb3tIuZX4KJ6N+PUPiaV4S+WSlU00yRAGpN?=
 =?us-ascii?Q?0ZLF9ztHRzE1L6tr/iP1IgT8CBQGOOwDdSmOSgWMciB041LNgAqpU5KFZh09?=
 =?us-ascii?Q?sZ9BzVCCVg1Qhm0tpPYMQD3Liqa6+1z6sCfWyiP3yIiN60u0yWTrwFjPJ7vE?=
 =?us-ascii?Q?fOXhZQZYP6lmtP/bSoSGxVL739Y0YDB6iDR7Voshrq91FfxdBJ6Fhrcs9A+g?=
 =?us-ascii?Q?inU9EM9s5xgmJ0nSPkzfMh52yaoIpMyBcaonGChdLspvn/ddwdWU9KjZG4gA?=
 =?us-ascii?Q?h7WRAeL6EIQaGzicxiXZUpp/9LDoEbqEKEMWYDCL1SgREqZXjgmd7EjjJV9J?=
 =?us-ascii?Q?Gyz+2PGqoaxCDg9bZAXcTAJOuLhaCKzvF4She23ONp6EMTw+6pPpKZkiWScP?=
 =?us-ascii?Q?SB0t2L2sSEagdmSOqFMpeES6l81DLuXytJtNzcLbSM9KfEf/8dPuyAGWQCFD?=
 =?us-ascii?Q?/90gCJGU8gDlFKGbEG4Wb62KKalpj0Esbg4NgmuW5bjoJZnNz6sGmN8D6tG5?=
 =?us-ascii?Q?OjAtfOWnxKP2rJGuoTJ76fxzSGz+/6zHXdNcqVf3iCdhkss3g+eiGbpb9bOb?=
 =?us-ascii?Q?O8JjELv6raKvjOyv9Ac8R7bIthi/t9zPuQhLusEOBvxALy5vm7eLxqz4FbIn?=
 =?us-ascii?Q?xy9Z4ijQo33LqPpBk34Rt8idgpcdvDF5alpTgVTgb66Yung3H0gt7WVBxsaQ?=
 =?us-ascii?Q?eJ4koA3O59o7Gc1ofW4eP7SffHDmdywnNFh/CRSbUQj7cvu+BZLT4Pck+Eq5?=
 =?us-ascii?Q?TFrNsc5h8jDHfHo1sSUSRLG6+ammQmWG47+d0+7Q/lCork0uBRkk3AHPre3L?=
 =?us-ascii?Q?xG6mGp5JmgmsqDlZoi9Q45Mv34TkaloLpJYkkFrsQJkNaePiHnyRz1VldLw2?=
 =?us-ascii?Q?KCf8FVfhan5UyogD+b6bi1C4PqpNPIpq9T43qDHnNOsl4QvXfK9CPQVf3bto?=
 =?us-ascii?Q?vWDHt7xqAVmg4+TK0lI+dA9cv7l1daa92vFJCrX95vkpjvg0O1SIi1jBK6Df?=
 =?us-ascii?Q?pqY0yywClLnF2hrFfIrjxMGK9zmxCXLZDLdHq93PH6z9DlMRmHnv8uyw0K1Z?=
 =?us-ascii?Q?kgy7VMbIw9jfWbPsyL8AmP8penrp1qXBPvO1+d+jkG7Dw8wtSTka77q4pRdz?=
 =?us-ascii?Q?2+hcX/g1IjdhQMUZHBphaAouhHpcWEpR/FDR6zcJV7MV58PMJiWT/QsNN/xS?=
 =?us-ascii?Q?RXrJyDkeMflNrhJ6Y8zCI9+UeLhnvioG6LTGiZDwzfJ5rB2h3eRdOgYnQ4YA?=
 =?us-ascii?Q?P0FlbAL52iAjRPFsQmqrpyr7mxBaoutS9YSdq08sohwRSiUlEGQmdIOR7U/4?=
 =?us-ascii?Q?NpSwfl6qWxxUITHtFxQxpND5wf6exCcAF/WmM4dxruoV/Fws7mqasHkCPsOI?=
 =?us-ascii?Q?CYnYU4FbnxePowrKsoQ732wf9IEe0RvnGnK5xH587wC3BGA4Cgy0VyIqFUaw?=
 =?us-ascii?Q?ydaBDtRwFGopR2nb2cNqkvmliAphSq+b6F/hKNX9zFDhH289+NcQXjUErRqz?=
 =?us-ascii?Q?183NVwUMSv/bYgi1XRhUEwmTzwkJq2UU3vNoApU76kcHcwC4PYe4SxQAY4eh?=
 =?us-ascii?Q?shgue1bux9+eMA4haUnVilODC1RhauXWiNoB1lgm17ctHEqLZ4KxPsLvwmyW?=
 =?us-ascii?Q?rYKmVyBlxfv7C27VlTbq9Gf529SVO14xAjKF5JZiJKuu+4FgQHDCdYuM2Pk9?=
 =?us-ascii?Q?PWnbrRQ3DDXHyxTNttnWNcRC8tSUCobtzMgNYYB9vCkqOOoIEQs/icqyMJNE?=
 =?us-ascii?Q?NNbMzGuxeg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba4bd95-89e2-42c9-aa58-08da2ef49792
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 00:08:47.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOnOWnxu0J4hY9K85fmgjU/UpamKtbQhD7TfvlHEZ/YaQQgxE2sSSp3mAx1ZEoFj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2934
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior series have transformed other parts of VFIO from working on struct
device or struct vfio_group into working directly on struct
vfio_device. Based on that work we now have vfio_device's readily
available in all the drivers.

Update the rest of the driver facing API to use vfio_device as an input.

The following are switched from struct device to struct vfio_device:
  vfio_register_notifier()
  vfio_unregister_notifier()
  vfio_pin_pages()
  vfio_unpin_pages()
  vfio_dma_rw()

The following group APIs are obsoleted and removed by just using struct
vfio_device with the above:
  vfio_group_pin_pages()
  vfio_group_unpin_pages()
  vfio_group_iommu_domain()
  vfio_group_get_external_user_from_dev()

To retain the performance of the new device APIs relative to their group
versions optimize how vfio_group_add_container_user() is used to avoid
calling it when the driver must already guarantee the device is open and
the container_users incrd.

The remaining exported VFIO group interfaces are only used by kvm, and are
addressed by a parallel series.

This series is based on Christoph's gvt rework here:

 https://lore.kernel.org/all/5a8b9f48-2c32-8177-1c18-e3bd7bfde558@intel.com/

and so will need the PR merged first.

I have a followup series that needs this.

This is also part of the iommufd work - moving the driver facing interface
to vfio_device provides a much cleaner path to integrate with iommufd.

v4:
 - Use 'device' as the argument name for a struct vfio_device in vfio.c
v3: https://lore.kernel.org/r/0-v3-e131a9b6b467+14b6-vfio_mdev_no_group_jgg@nvidia.com
 - Based on VFIO's gvt/iommu merge
 - Remove mention of mdev_legacy_get_vfio_device() from commit message
 - Clarify commit message for vfio_dma_rw() conversion
 - Talk about the open_count change in the commit message
 - No code change
v2: https://lore.kernel.org/r/0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com
 - Based on Christoph's series so mdev_legacy_get_vfio_device() is removed
 - Reflow indenting
 - Use vfio_assert_device_open() and WARN_ON_ONCE instead of open coding
   the assertion
v1: https://lore.kernel.org/r/0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com

Jason Gunthorpe (7):
  vfio: Make vfio_(un)register_notifier accept a vfio_device
  vfio/ccw: Remove mdev from struct channel_program
  vfio/mdev: Pass in a struct vfio_device * to vfio_pin/unpin_pages()
  vfio/mdev: Pass in a struct vfio_device * to vfio_dma_rw()
  drm/i915/gvt: Change from vfio_group_(un)pin_pages to
    vfio_(un)pin_pages
  vfio: Remove dead code
  vfio: Remove calls to vfio_group_add_container_user()

 .../driver-api/vfio-mediated-device.rst       |   4 +-
 drivers/gpu/drm/i915/gvt/gvt.h                |   5 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  51 ++-
 drivers/s390/cio/vfio_ccw_cp.c                |  47 +--
 drivers/s390/cio/vfio_ccw_cp.h                |   4 +-
 drivers/s390/cio/vfio_ccw_fsm.c               |   3 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   7 +-
 drivers/s390/crypto/vfio_ap_ops.c             |  23 +-
 drivers/vfio/vfio.c                           | 299 +++---------------
 include/linux/vfio.h                          |  21 +-
 10 files changed, 109 insertions(+), 355 deletions(-)


base-commit: 676d7cda1a3c19872428a9bc818577a1aafafdd5
-- 
2.36.0

