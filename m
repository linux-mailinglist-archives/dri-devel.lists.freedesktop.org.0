Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344557AAC6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 02:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0622AD95;
	Wed, 20 Jul 2022 00:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9F2ACC3;
 Wed, 20 Jul 2022 00:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY2QarC8UpJVklCKOv6vbs+JIPIXf/1G8Ygsz+45Vl5nNTY06imjIANWQfUPDD+peNtphF1CdUJv2+tk42ZdzxKk0bL0IQNnmhya00xgNPGbbLiNo0yA9RFt+xOfHAynNz+rciymJ3e1ZZpB1euC7NLVeD6U0taxF2/tsdIiDCxbmY1prGYnerzBxTuoOdM0q2aNcDt3Huz024jxynqGY56mCbRQGNVwKxKToIMIQ0YAcDst42vaYqqgJ90IU3IAuKP+GPMIYXDHAUvNPUbQ1QezyoXNQ16+EneW/l0hNclkCM87CUTaF7O702mtJS/MRCdMNxsdJrXyACCUM7yM+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pdkm+mf/1R8eNRzg3Gsl3scpziWrU6PYN4wWZaHi+AY=;
 b=bRAdN7RosXgIeUIyljVmktqp/q5S/ApcjP/QiWIv6+Zo0UrJRaKYgc6pTVMxpaif1dXtFCo0g1FQ7w5qnJbmZzhKcUxLximKHR/QO4jJjPE9uiloJxtkt/i9kkeQMr9WodYFv5SRBcGP9PSuABcNY63Kr+Uxgi1nLiqhdzDoPlfS/0HYE6dW6OlcyNrmSqLfZi2HcqCEE+1RLu2xsONhaR58GM5nJAh9PiZstMxzQNzLO0GeHkAqYP7b7DfOCaT6YwVr2UioDhRcD1Wjt65cN/CIlEeMmNdRulI8YV1QJiuVg7P53Q+vfyLAP78cIz+2w1WGvUsQU4YIRwNTiFlwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pdkm+mf/1R8eNRzg3Gsl3scpziWrU6PYN4wWZaHi+AY=;
 b=fqQHLTQKoWCStj62mxbjVgoSX2Q84dsWBRriTkWz5r4G//ZvpXHzsVPu2QQfW+OmDOVPqooMP0WAB03GS9bHWbrXC6vGr4kaQi3GgW5Bq31SpUbKGFiP6orq0V4Itdf/r1D7urtBeSBKY/0mLJzsPFRY+8RAoWrUvI+N3xOVh9sJIFSdXgtqos1uf3GO0os02SjMPeRPTXPesoj7y+6WUK0FQ0tj3aa/RmWz8IFciQVnfjBazG8wOz61tPpLKWDfp2R+yVm0an7QAfoGYd6tkU2WaSQKHdbkAd36NgUZGaGFUvST4EufpJDxwMWQHSS5kDN6JmDNwv5JVa8Zp5zTAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN2PR12MB3134.namprd12.prod.outlook.com (2603:10b6:208:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 00:02:53 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 00:02:53 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v4 0/2] Remove the VFIO_IOMMU_NOTIFY_DMA_UNMAP notifier
Date: Tue, 19 Jul 2022 21:02:47 -0300
Message-Id: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:208:160::21) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ce9382-d4d6-48a1-af02-08da69e32fda
X-MS-TrafficTypeDiagnostic: MN2PR12MB3134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V57e80dR4Yg7EWE2pDYjiedfceaaF7D+Uh2CS5bB/MqZeo8Wo6ESK7z4EYTjIHwg4zM1DKMig4Vj/9mUI4xNGqZWxpqJ1OpRoAmG8osCEWxNep/UEGm19y32AfCvWOtEsGge8UELuDC0LOmtq8P1X7fqQhhTHD9n45WcEts7vSqXcgyPjLnTQzVdvHm5m6Z65UTk9smulUDjmZtJu8xxGP3rGqzb6DE77/egGX2e6gY/F2apPZg7PZLBTpWq+hUR2qKOUg+8WHTGUJ35/3etKy8Pai8SJxNksEhRGft2PC5Nk87GOP/WcGgQejX6vhY4om+PvORoEuQAaHzZTqFNyfX8sGB32vLHsfktBfsFFy18IRs7yJ2/e9ZFhb73VFZnEZrTmOjQqL+EzUudwRnVge455gIQf9ur3CunOGwZ0YUPhSFUG9vM4r+74hr3ep7wqUBPp65+P36IyEY2h80XyB/FJwcC2CrFJmgx6MXe6LhkfZhj5RA/9NV0xvqB6WL0q5G2hfvxPzctceOIJYiKn8sjYfoBUL3z6XlYcXTIYOW0JQlPGYF7bGy5/Qq89Oh07QYj5ESLMDzQQqiEIgruszLjYnvAPBFFqeWwkelJNT80DUpZwbqYBxpO82WLcVnoFRQwdFrPrGgz3XMdeN2cZ9mrBDX0NoD7mivwcKW58zsUaf3oAMen6HnY4ssf2ufRp+VSx4xcxmUsJXRc4ZjwhIHtAUQkg7rNFb2wJWDKi1h45cvVFmM52L9qX4cEtyzxXcNL5Sf1kD4nws4FK6ySEz4vj4iLLsyz9+bqLo3FOEjddAJtxsfLAZpZ/XS+cREm4teXyCkDvjRGDOe366gpkQNCUjBPOtxfU6E020CblBpBOcGknTjNsRjID2DJwz6253Xn95CGe87yp+TSzKYZekJa7wMq/n0hq1y/UgZRjZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(36756003)(83380400001)(86362001)(186003)(921005)(38100700002)(8936002)(6486002)(41300700001)(2616005)(26005)(54906003)(2906002)(7406005)(6666004)(4326008)(6506007)(110136005)(478600001)(5660300002)(7416002)(66476007)(8676002)(316002)(966005)(6512007)(66556008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4qYxPsmNiw9UWVUFr3bSdHSXycaGWculQo093nsH2BtNSr1M7aZKpUnx411g?=
 =?us-ascii?Q?3+KTo3dzXxeAiuquOwHzsNZJlGrNroKwsMRPagWZ2v/aNXqVDxyLv/EbGF4S?=
 =?us-ascii?Q?jQ4rcpPEGNhs8mFtQbmGETPFlRXIT3pgkzl2661gtDo3BGGPjnJmUHxvXCuw?=
 =?us-ascii?Q?BNpUOgtOZPkXkUPyElCrgeGgVja+w2o/MZBPzETIjA+bzrzr+dY7SJq11deB?=
 =?us-ascii?Q?g5ZASI1jBKT+hELMlTMihiqoXgGZ4gIsLUYPdMyE+/FKw9gDINnL1qDGtVY6?=
 =?us-ascii?Q?Nmxe1ril2lnVRDB4M8WSXQH7qod7YDzzrelatWV06BJ7oHhdFgGHkGSS1+sJ?=
 =?us-ascii?Q?la+a+Gq/6Ec2HV+zbB/Wq/nkFZXw3iMoAclwsA5Mwjr74r60i/zx9ZPdmqrv?=
 =?us-ascii?Q?7REqDBoqiVRxUWJUZduo7tVqpEDhJvwSbfE5rJ8HLOWrsyx1BB/rIJ36ieDe?=
 =?us-ascii?Q?CwPB/h6ZAl8nFwm3G1f50a36L4EfsKluGmFshhTvhGN9GWQFJwS7I/qJe/Fo?=
 =?us-ascii?Q?HxHicf/aEL1c48closjy4ysIRdL7kW8c1U3yQs0h0WfDIQMQQXEdgZL5hW5O?=
 =?us-ascii?Q?9gke3ZyHDUB3m6bCXJVzEjLWOZFGWs/HEpZbnErNEaTOy3W+v9c74oduAIuX?=
 =?us-ascii?Q?jFvDK17mQI4eezqzNd5bwb4HOrmGVyObcM3XfzuEwQNiNP5ri+bIlEw/zJZp?=
 =?us-ascii?Q?xshtRfmvlCDG7WkW39XZ9hKP8mxTQ9t8Tw0Hs8dorhGvhq648EVfJtvWydJz?=
 =?us-ascii?Q?1jUQ4tH0Io5QCpEqakf3xelI3MrVcpqs36MhJ3rjITbUEoiqvbsPPZ5erxzA?=
 =?us-ascii?Q?MJemR1VBEzbxMYwZmxMWDc223ygkTm1JeqNkg5SSCRLTPN/kYT8YX+svwiID?=
 =?us-ascii?Q?TKotgLo5alTDT79fJJ+pjA0ikq8xq0l7ahaU+i+7ZFSwQBnlyVgltJ4oD2fa?=
 =?us-ascii?Q?jdTVc3HYeqqvW+nj0C2pUkTwGM/UE2gMqswGJunmE66J5EDC/My8h7isUxYr?=
 =?us-ascii?Q?8AKdfChf6hYI+SZFzm5160SjZiWQ8vpsux4ugXOM6VKeNHYZR4X3Vjt8YZSD?=
 =?us-ascii?Q?QnFfheTmXidrE1zOzhFF0J2p0X3REgv5YL+XI1o7/7lmu4nezAAbBR7P0jfl?=
 =?us-ascii?Q?KjpOmqfdjR441wClZoX0lFBeWPjmY0xfbdU4nQJejtQrxLXBa6avxUidNArH?=
 =?us-ascii?Q?Hc7iarYhhaycRG3entZFYrkxyCeTGsmZv2S3K7kq9zHVcIB2Ckl+4aNEaRB1?=
 =?us-ascii?Q?dNAor6q1fPDewaVO5nKU9M5gm84YnV4tZVAD8tyZqfxO4hGFQ7DyWjWnmyLD?=
 =?us-ascii?Q?7+SKVKsA6wG0ddUxA2Il0HeAR8IverT1jIai1JxGEkaawQHrEmWmZOuRt3bb?=
 =?us-ascii?Q?9FTRj4Z3AQag46VlHD7SaHO6hm1qd5gfOhi6Vqgj3KCyoz6m4RK7ij1LCnrq?=
 =?us-ascii?Q?le/PCDY1paurEvG6znydqSqo0LjFXZp1eOU1KP7coppdRRp6j/X4vh5tpREd?=
 =?us-ascii?Q?4+11v9kgxDQANNHQvV7ce7DDe1mv+jYK3Ie2S0k2bDVlWR4pv6cZAK9PUL2u?=
 =?us-ascii?Q?gdMkV3tGpndeIbXrQZg4Qqk+jawLPcK/LLKRuapM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ce9382-d4d6-48a1-af02-08da69e32fda
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 00:02:50.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G5WTjKX1PdXnOs8RBZkg9EmyZg6SAq7pbqqj9pfttaP8QyDkDj/0CDCd8mCpBLh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
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

v4:
 - Rebase over the CCW series
v3: https://lore.kernel.org/r/0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com
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
 drivers/s390/cio/vfio_ccw_ops.c       |  39 ++--------
 drivers/s390/cio/vfio_ccw_private.h   |   2 -
 drivers/s390/crypto/vfio_ap_ops.c     |  53 ++-----------
 drivers/s390/crypto/vfio_ap_private.h |   3 -
 drivers/vfio/vfio.c                   | 108 ++++++--------------------
 drivers/vfio/vfio.h                   |   9 +--
 drivers/vfio/vfio_iommu_type1.c       | 103 +++++++++++++++---------
 include/linux/vfio.h                  |  21 +----
 10 files changed, 132 insertions(+), 282 deletions(-)


base-commit: 2a8ed7ef00b939fbcc98b948f780bd03bafed227
-- 
2.37.1

