Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E35669A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED7F1128DA;
	Tue,  5 Jul 2022 11:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E047010E6A8;
 Tue,  5 Jul 2022 06:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUu+IHF7fs85ACRCQ6wccWKLwfFtZfssxIledqd+rY+xLuqu2I+77WTdAepF7nwnlE1SwnKhQmiV+nF7lya1wYSUgfsNfkdjWkN6fu1R7s7ygOq30iAzZSiCAGlNLjlhhklGA7dcK/MOBRIncnvhunNnHF+JfFJ5r+GtVzL0UMm1kBm6Z9PE4fve3K+5gu1E11ZyGXh5TdM5z/a5VwmWPp7LDQjGHiLOPI8F9O72i9N18fMaZPzYmZgn/cvhBBNdcfpWvTiM1HUp2vCgHDU06VEzRF/Tn7TCjLjahxWB6+iETKKmdVKbW+MF9GWRarWN93lxcXM8VP9EiH7fTqBTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH6UrHgCnx5y/EIF5ZWxdzyK3bzafV3gVtEL9z2izpI=;
 b=awKAb97SVWQUkhCteIGopZ6A1LIZgpZoZ4VlpZt0QanCev7MqnRhaz0UbYcFEQYeSqwlAWHvYlanGVx3Py1hqM6tWB7jf3fy+PLhOokbsWjzpHtft6r7RdgZjXFrlRJ+NjeJnppaTAyNVkAul+7ClLvTt137oBSX1mbHZ42ns4vwasPVqTpxxurKx/8gweJFoPk2nAlC3/lmp4a/9vke9+u1pzjiRmqkajinrl54pmMFQSTMZj4S01DOURJzO87IzVBxNEHITkBz3dWuofT6ULgNs/CyDbcr8Wm3bZMeOaZO0aaF8qIMi5h4Iki2kAps1rmTYDa8k4qBXwqaicRBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH6UrHgCnx5y/EIF5ZWxdzyK3bzafV3gVtEL9z2izpI=;
 b=CzMivfX8sqO+ZGzjoyQf5y18BmKlHVLV7p+SdnXH+nrEQ07Y9KBb+P/k4O4Vf2J6qjDek1VDD3Hj8dvXqcR1EhOGWNCCYdroQku4FMGMI7Q52iS9Z4E1zmtmwS1OcFKSWcI+pBtblq3zKkj6Yg+EskYNxX74zpUHyQkWBdZTig742cA4WdD47aCskPPb+Fa14FGXWm79zdhQ22Ceghjrlkv/+rJRDbyeo8ec06pZb7UJ400CgcQn3t+gT4583k335X6L0ewBi++esVFGdKmj6TjHhoO4oUdirxeCicr9cg1ignjkw+xQD3P8cLHrr95Ot9sLWha0++LVHqOjcaXBgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1173.namprd12.prod.outlook.com (2603:10b6:903:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 00:59:05 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 00:59:05 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 0/2] Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier
Date: Mon,  4 Jul 2022 21:59:02 -0300
Message-Id: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 212edd3c-ea82-439e-fc40-08da5e218eea
X-MS-TrafficTypeDiagnostic: CY4PR12MB1173:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0J+1V+4OhxAa2Kpl3gofZZXy7bnEh4bGSSYtscvCfgjCP064dyesdyvBnZ84u55MwZmm/kw7FlcHlxhNYXVtPHbR6We5hw4qrF6V3bbhKGmxOTfU9oEt2/o05zrQKawZDLHQWF+bU2D6PLsMiJwCHNxH4/eJv5xnWTWT0YD4z6WlyKcQXfoKKwvkT1Cx1QJGk73nI7Ux/cPVt0JIb1Tg0eTYBPJrCVIPFJOxlNsIpnamIkrSRO+GUen5GMkOfMGyJhf4mO2WMiCh2W+UV8KGaNTI60fxxHltOK+JWLphP4CgtPvV150vDN3c0HmX8bVDhFyUDNY8btIh6gNWq0/QwQ4Jbk9tvNNR42dEmI7wXTk9a0AausWwcfZDXqZIHigATgikDAp0DvFVwF+U+ZZjqjwXBxOPORfaX9EyF6s6uNw2ARg7p1xgXtvin0aCVtHHUf7gDejaiKhXwPMSB3XCUrrq+UMSj2N6W1wuHIS16r9myBMkO0X6nDwNLvdEK1P41qKrusAkHaDilQq1Ir56HRiGvYQ6GnIX5H86fPwMSig7YA9dLuSOKn648HqM9C4Al5oBhZuwxoq4qhti8AEml98n8s5C+4Out+l8oWS3+i7wwOudrf/2Ud7kOkYdXLqZm0eyVMvXPbjT3cSpmKYBWOr4U8xL4hNmfr+4UgyyaJr71eVqcKNVkR8NKWvXqKoopui+d6e8UUrrT91CwJK9cexKde+sgRcSZLJZjop2ysTa5yQV5EDg2nfcR8lSBB3nlY6YKUMWXM4l30eNYJIZTDBiy2+6Izx2ZcGwgfeSNR21dDXzcSVYLCRUps8IgmB8mD34zXzm+weL7ULzFZZCzSph4uqose+C8TvKRqEEvzWFwL/OjaAwWfAH8WMQjVFCc6WWYTw0DbsDe/lto9Leyqsi83ypAMjkeXPOR/K9+XaNmOVBJOnSHYCiqI1Rh8gf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(110136005)(966005)(6486002)(26005)(54906003)(6512007)(186003)(36756003)(316002)(83380400001)(66946007)(86362001)(2616005)(5660300002)(2906002)(7416002)(7406005)(478600001)(6506007)(8936002)(4326008)(66476007)(66556008)(38100700002)(8676002)(6666004)(41300700001)(921005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FZ8POEGdePzTRBnwTcXYGvz9lWrULQFDi33MwcMUifEkXSxNfpFXcGmvCG2y?=
 =?us-ascii?Q?8XcSwgj2STMcMCpgpyl4j9z/85oRt5YnxLMlgbwKV0MN5Uw1BDbHF3kOSogt?=
 =?us-ascii?Q?m/zFtC6HctCOMZgC3LYIxaEkPHaibtyvjUcXYTAA5loJnyTcGdikD0HIDuO7?=
 =?us-ascii?Q?yVxQt0Fl7J9DBet89f2OXTkQx4/2ED73zUDNrioQH5+HPk9d9cpPSFE2Zx9C?=
 =?us-ascii?Q?J/3DoMXnpk/+VmUBcT/CWOp+mzwgBHUDmGz64dHTZkBJJPF7AD3CLBBCeq0L?=
 =?us-ascii?Q?n5pNJBADG0b8nGUqX20rTgwtg8M75UqRhgDaF69eqyJZvRI4ffmOVeePuCbU?=
 =?us-ascii?Q?ZiOwcokJlB7vjkwxur/B93c/eTy3vIidfy68e88/Prs4S7FvwOoZdGHsTsT0?=
 =?us-ascii?Q?dd8bboI4gfxPBhJijwcAh7mkT4gzKsj2hIr4pqMkzFI73HZdnZdPdCyy9f3a?=
 =?us-ascii?Q?sL9MHO864g9cGDUQW6d0Y4ErwIE3pAUI+6m4KUE8jRiOlfDD11b0FxUtdSYR?=
 =?us-ascii?Q?SbMlfHTvgRawWSw1BMj2oV4dfLK/Z8V89hUdMw8gpQpAt2M2iIqfzLgl6/Vm?=
 =?us-ascii?Q?2MZqBvEs26u7frMksXMpB6axYq8GsPzr36YFyj0uHFp98YIYudx+nkdjSTeS?=
 =?us-ascii?Q?2atXCI8xk0K7y/rwl27XCS87W9ACzvLigNtYotgYgSWlr7p0iNMzVSOFpoWU?=
 =?us-ascii?Q?d0iVEWxqpFDIBJYSY47DbzomTaK7dG/RHH0MgTyQ/dPz4rtqFJ/ae+XllGBx?=
 =?us-ascii?Q?6iBB3U4IEUiFnLjuPrA/P0c7ii0sdU/k5CJyJIOF/MZnHtBhxXtvX4hdM+c7?=
 =?us-ascii?Q?yOm0Zj4jtLJq8HigS6hCODgOFCRMswtxpo1rG3LPjHm5oQs6PRqg3WtgMPE1?=
 =?us-ascii?Q?ZK5DTIO8N2oD+dYq5Q35iYNlIomL1hTBra/MEIx51onbjGSomG3HP42hKY68?=
 =?us-ascii?Q?zjdu5/wtSxrBfR3Xk3lb3DkoIPj1KbzrGZfqHGDiCr8e6NMOXlM3bAnELxpk?=
 =?us-ascii?Q?RHYD6dCA+nHui39oxZeZlUOPfEd2Eqf9fIyGjocUqpZa990Ch6A1EEsFYAfh?=
 =?us-ascii?Q?O87EnMj0Ha9WgkYC2E6QynxszVmMOTlq8mx7ACc5Yhx17bQK9Ons0qEaii1s?=
 =?us-ascii?Q?dMnV0qeXrdmJmqkDlU3UPUHC3wfL9Rp9CGmBEgpnL09Ker+HJWSIP1vTBZbj?=
 =?us-ascii?Q?gEMvX+woIHEk+QXDcVfKpac3xAWbCQ0WkuKfoj8ISsbZESltf0XoPtKTzgO5?=
 =?us-ascii?Q?wCeXuRnM2wFrx/pcgzqXT5CKNVi01D9yTodaPI+1vXEGKHIuS/pN6Bd23SIO?=
 =?us-ascii?Q?hSMdvYfwxfe8jCNehJU/ienf1ogHaHVNYM3YlRMFU/dHxVWMOh49B2752Chz?=
 =?us-ascii?Q?nfNHjbZe2qUVutzHje5zJwzLfNzrsFQnT0E0AIV+OwF7IF9XpQwiCyLxsxgy?=
 =?us-ascii?Q?naPivQAVvbnw1gWkeWv2qaHFS0WQ18bZDkIu6/mZJxbwDUrDyQjisdFQ2Xk9?=
 =?us-ascii?Q?Vwrr77AWxz9+LUGoaFHC5GWCV8nvrsTOa4+VUDhVZTT4V2YE+TFCJ3yJ6MZH?=
 =?us-ascii?Q?kTNXoJ7hkxyWnFyWm4mv6db1mJGrpDdGN/1ApDA4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212edd3c-ea82-439e-fc40-08da5e218eea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 00:59:05.2448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qboS67LafY7z9suGXn6BaMBf+Dv3pB7mh0bq8wYFk7IjLnR3KkWxyRni6cA17div
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1173
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
 Eric Farman <farman@linux.ibm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the last notifier toward the drivers, replace it with a simple op
callback in the vfio_device_ops.

v3:
 - Remove 'nb' doc string from ccw
 - Rebase on extern removal patch
 - Check that register_device/unregister_device are either both defined or
   not
 - Remove check of dma_unmap during vfio_register_iommu_driver() as it
   would break the drivers that don't use pin_pages
 - Don't change VFIO_IOMMU_NOTIFY_DMA_UNMAP to an enum since we are not
   keeping it anyhow
v2: https://lore.kernel.org/r/0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com
 - Declare and initialize variables in intel_vgpu_dma_unmap()
 - Remove 'vendor' when touching comments
 - Remove kdoc for vfio dma_unmap notifier
 - Add WARN_ON to vfio_register_emulated_iommu_dev() since dma_unmap is
   mandatory
 - Move dma_unmap call loop to vfio_notify_dma_unmap()
 - Document why the double mutex is being used and why the mutex lock is
   dropped when calling dma_unmap
v1: https://lore.kernel.org/r/0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (2):
  vfio: Replace the DMA unmapping notifier with a callback
  vfio: Replace the iommu notifier with a device list

 drivers/gpu/drm/i915/gvt/gvt.h        |   1 -
 drivers/gpu/drm/i915/gvt/kvmgt.c      |  75 +++++-------------
 drivers/s390/cio/vfio_ccw_ops.c       |  41 +++-------
 drivers/s390/cio/vfio_ccw_private.h   |   2 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++-----------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 108 ++++++--------------------
 drivers/vfio/vfio.h                   |   9 +--
 drivers/vfio/vfio_iommu_type1.c       | 103 +++++++++++++++---------
 include/linux/vfio.h                  |  21 +----
 10 files changed, 134 insertions(+), 282 deletions(-)


base-commit: d1877e639bc6bf1c3131eda3f9ede73f8da96c22
-- 
2.37.0

