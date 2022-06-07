Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17805541F48
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD07112046;
	Tue,  7 Jun 2022 23:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A1112037;
 Tue,  7 Jun 2022 23:02:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/LPojUX5Ja/hyVyyJnFcM+rsi9h1nrQZq4DNzKypCI0mwIwN2BcC6PS2HMhyyNc3vCtP3rMQOLT2ILtRMYTzo3tHhfzQ8Njuf8D9704bmjIPn4Dpt0wIHT5tq56VG/s+bhKMVU3nEKwCmgNIx6HKeAi+bb8wpKHfpU8ew1QLUIGCBdON5wA6QbWj/U9TkdBdY7i6BrkSALI0Gshwmg6VoICZJrflhv6VqHbJDWPdsryi8pPb4U2HtCrZiKiN+fKl5yuDSextWmrke1vrt3i4refPtzh75SMJP/U/w6dIfZJqerWx84YHb9LuGrZA2NtgqKx8azCaBEFNqgh0PLaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV4Nx8Nj9rzmjeh1yLrq5Ewd/LUXiSdM8QPoNcJJjZE=;
 b=NTiXZDwd3hPUz6xGchdQcieQu2EFc6bAEyXL0p7rFtoaYAtZJvfxgPIKfjczeyJVQz2cNFcHFiFsjUv5h/b4RdAz/+xBwWK1+SsLyE6Csgd+mvJK6w6w6RXHSNrXviVeiPfaXlk/2FcHXOxWwEoyswyyNKnxn4yq1wuFIq6vy3Mq4lF+WXPAS6kuf4HUlq4E7G5jYYHeDW2hoICis8cqeYF/pER/DuM/GLW4RqkomSm6MZt75m8T1UGHvzsZOQiUXoEAuAl8Qo4iq3htm3af/NZx1nbdpvARUhxqDIQylYmOHYvcT8+Uy8x0gl5MuFIGn+0NOdcHGBL4ACnDUFEm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV4Nx8Nj9rzmjeh1yLrq5Ewd/LUXiSdM8QPoNcJJjZE=;
 b=rF4ki9EfaTrMyw/PtxHFkYqOqc/SXZNLwbaLRpxtZhUVYiFoPSMZBQGUlriuuBc4updMRuPNDbm4Y7wVc6O4bkfyOqihWqEIvX5rJxT6tP2gHspq1IO2kX+dfode4ccscg9TJr654xVx0Kw1yMaTH1RB1mPhfZriColu57mIwjgd2PsMnOO/vC7Q6e2E5cAaYhUHdAEt3gcDqiqg4tPVgabF0tyqpvbcgzMWlbWmXJlinruvvfWubnDvhVci6JxD6wcbUcWg1rKXWOPOGiTIJGsujEYSjpj3aKKV+MoI8W4PjXn2MUtcr5KpCcaQt0r2OB9VTuuuZQliSCln2e9VUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB3593.namprd12.prod.outlook.com (2603:10b6:5:11c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 23:02:13 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:02:13 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
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
Subject: [PATCH v2 0/2] Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier
Date: Tue,  7 Jun 2022 20:02:10 -0300
Message-Id: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:208:239::7) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e02a3d-54b4-4ca2-8482-08da48d9c281
X-MS-TrafficTypeDiagnostic: DM6PR12MB3593:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35931032834B1E536FEB0BFEC2A59@DM6PR12MB3593.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YwJMSkaxFPGuMBM+rzMZmhfc6ToRkdXvEfoiL7WKkfAzQz5FFRXGa2XgPJYXcAJlM3N2ET8ukZFuWQKmiMyxqH4gIouPwFC0NrtJHVGUXf7rlpbPpIc/J6gI8Y95u3XAfKdLwV65V6QSI0N/n7wr/R0kffbBGJjU55Dq5JiyIlrZhN3PCO6UupY5woeQIkVR64yTYGFXnmbF5Zpghi5iBuhrZfb8Cw1a+3EQ1/DwRQD8TjVWlwhWsc/1wxkYWG3JYtCM2UMA6xhsYhQ/kPa6SLI/hGcH2CfZgJS+3edNvuiV1VgEbXiHTFVsVPQFRTl04k4yEA8EWt8857UWDb5zvP65+KzVW4ymrE1c5pDX8haxRVFDB0RsTER/VkkNnpv4aWeyzhM24bzu4TwtY7/fJM8I4md2zBZ26OqD5Po/iOYW4tkXC0iOBPAn+duDFCw/f95bfvwsa7NnKUAUKea49zhE7Ejz1BVdPFDZLgLCor2N1t+pNr3IT5ytIp1u9yQEa39VmYYDAKzdMFlSsQiA8Or8IzJodUQuQQulktjZcB/tc9QOnUWTI9vhJN+zbZAqGqBk0FbUvew4c/02BJJ7em+T5pZ8q8TeCLGrb9vbQp9cU0mJW4dBmAxrjwIbuUEpXKkcETL5EmF1VNkIZauMnUJPITKiAEVPFr7h7hUivyFR/Tr//42xY+Z184jgBHqON22Eel20KqJzqRcO+Oe+pCG0ivvjBXGqlFxFyZaMx8jueCBxXwSk4qUYnR9GuZO3WkFKDGjPeaTsG7htYEREiS93jPlPR2RjAxAZ1q6lHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(86362001)(316002)(110136005)(921005)(2906002)(66476007)(66556008)(8676002)(4326008)(5660300002)(8936002)(186003)(2616005)(83380400001)(966005)(6486002)(508600001)(6512007)(26005)(6506007)(36756003)(7416002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tejelr2/pQ2FmI03R7KRmJcERBpuwPJNXJMXq6O1vNWGrIFW8dKoOkVill9C?=
 =?us-ascii?Q?zZllsPpvETY8uhMO90m9vX2JW8xmpk/dWEoLW7QSxPlk9J2HMXj7mdUUm/92?=
 =?us-ascii?Q?NxrfwohrcwJ6cINzdeA0SlOtB03Da7t0gEYK9kcfcT496MGZRgW02mp6Ci2V?=
 =?us-ascii?Q?4skcDGTjI63BPGMzmTy3fssHHD9BRJk+sLtmD8++Go0UG/qw21Av12CyPX0k?=
 =?us-ascii?Q?QX4gOpIugzz6qdjnQVEAJBNyxelxD0ePovLv6KD096nmTMjk0LUCwU/rTatA?=
 =?us-ascii?Q?lhRRF7WG6OIiQyKIpDKM18PSDgRycOuTLYAEz3wcV+ZKDAJ8jbQ3ZqdD3K5G?=
 =?us-ascii?Q?I/l00/mM7B3PsviuyR3qnbVFbPYVs3nmFIHpmtrXS3CuZHfnXbRnXfrEE8vL?=
 =?us-ascii?Q?I35uCosUK0FHQhDiixgy5jtLoMUCjncYLHgEe9leCTgOBcQrdJ8Y6PL3jmB5?=
 =?us-ascii?Q?3AAbG8BQZ1K7Dd+TjsN6QkzJ3/RWK7YdRpY/Fq1rDveSraOBFk5nDTZsn5Vi?=
 =?us-ascii?Q?2KzmnI/Hbmb7QQmPCXxuTqxpXcQjdC2pa3hGM46wS/Nc1HgXJUU6mjpGdoIP?=
 =?us-ascii?Q?PDaf10p7cBFMEPySgIPfZ6C0+dRhsEGQKS51FAyZGSRRtqvGNruUoKHlm+q8?=
 =?us-ascii?Q?AizCp3rjISE850IRMPd+Zt+XT7U03YKHpj4W+wxr+4VpfXgNvkFE+5IYx/xJ?=
 =?us-ascii?Q?fQNu+aRCA3h/GxjkM/229Iu29uZxTncVA302BBpQytlRowUcpNgkxxMlWaPN?=
 =?us-ascii?Q?4UL272f2SeHEAs1VE85Z7CtfHXl3AjuATnRsgomAzlDG58CcGrPq4E/sC557?=
 =?us-ascii?Q?HkjhdsdKo3kQjMd26eXTmBhpNWXVsGu4KbiIzO4f8Zt4PAU7ESTRxKSmwuv/?=
 =?us-ascii?Q?P8hRTVMZTAjJgEIwpCT3HTNs5k+bGAPDCjB9PJAqjC6UlhFg3bxd/R/mOpN4?=
 =?us-ascii?Q?7/ZPo8qvMlQjTsyU7qsySQdSQKPuPOl7tpl1aUjEjalIPbTT7XIEYVI+x+1U?=
 =?us-ascii?Q?9hJy9REmM/aP/uLwozAaAJr/BKkpd20cfAGl8FHI2kFrgAHilDe88XEaq8CF?=
 =?us-ascii?Q?ZAbpvp9T1k3LNr0lYodWivEknPR3h0ct+/zXWpf3Cfh62hE0iEimTwn41xPK?=
 =?us-ascii?Q?/9Uks2ve4Z1imc4Esw3qcdbsMhH2oEb5KEjVgH5M5hgZLeU7wdsPUl1RwYx+?=
 =?us-ascii?Q?47LcxdKp27pyPPJxmYeKgPlKzZqS50nCh1FDbRSGpR99+0RMewqWJ15WgYzR?=
 =?us-ascii?Q?QiJFALcWa7mC4g8a9FCmH+PNA+RIgRhvLUqlNrE3GwsSPflAtNF0jVBihtvh?=
 =?us-ascii?Q?OnMazkAgsTl+BRZQEdj8D0NsnLfl+Wawa6ov1R0nqKcD+apUP/RCep117cA0?=
 =?us-ascii?Q?gxxPN4IWFZGeZ4kxAVMtIk/3TdUMMoIuqRhrUAKX/46ffvMEzSXnGotmkFuF?=
 =?us-ascii?Q?aCHQv+Zj3DkV/VVgkImGRKJz1+wmvVs2+PjpYN7B1lst+NLKzKzNcgWS0SNV?=
 =?us-ascii?Q?u3DSSSpUz7rtMop12qvy3uEALVzD1vktPod6ikGBiH3bHJuWtWq8hwQL+Etx?=
 =?us-ascii?Q?1GBGRF/0oZ1tZQTcp5S5nt0ry8ncQbC+rAjABvb2GgS4h1ANsn+/r91xcGhk?=
 =?us-ascii?Q?rzW9tZ6reZPNQGna62MYhHzvmPoodZYtOE/bx/yrXPfJfkdZR6pj+UfMvIpR?=
 =?us-ascii?Q?RPTZNlTkhg0voVKJDQwQG7lcuXUEHwp2BrXdsy2cetkoQpzjVrQIWkXhKP3Y?=
 =?us-ascii?Q?Qp8TrU84cw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e02a3d-54b4-4ca2-8482-08da48d9c281
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:02:13.6747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzA7npUfYY1CM4yVUFrZxO3xxGh9ZGBBmmmmcVuyDKQqax+/fYxYZVNXOZmcwDRa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3593
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the last notifier toward the drivers, replace it with a simple op
callback in the vfio_device_ops.

v2:
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
 drivers/s390/cio/vfio_ccw_private.h   |   1 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++-----------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 108 ++++++--------------------
 drivers/vfio/vfio.h                   |   9 +--
 drivers/vfio/vfio_iommu_type1.c       | 103 +++++++++++++++---------
 include/linux/vfio.h                  |  21 +----
 10 files changed, 134 insertions(+), 281 deletions(-)


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

