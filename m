Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8BC3D9A7D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AA26EBFE;
	Thu, 29 Jul 2021 00:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CA96EADE;
 Thu, 29 Jul 2021 00:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5p5KNKfs95FZ9UiCtUZlaid+68LBpOu3SkZY90tC+RfjP0IlyEzurU4dpWmMkSRmfzFfQOZ3e9RvGay/fcVWsG7tdFa+Rb15J/hGe8o+QQP5mj6mQE4N81O8N9HAiv7dUwBZU7u9mSQioUCPLLv/lVCPpPHczdAevxJRBtg8qF+tEwg/JfgWvR1jsafMVDi9K1TGVV+NSgZKdo8V5f9PHqI+li6p/HH2Z/xmL419/XjjJPSGjOdbTseXQkUYKyt2HA+inPf8uWPTI+JMb15EZoeFVSeoGYkNezvLyLcLog+6+p2mHlkXAiwPA2eCrzQvtL3/8cssEEpZaMb341y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T9Co41XNdb794U0C4CUNz9k6AqD0LbtOYmBf9HqKVE=;
 b=dgyorBQ4hOMDrlvYzLFsJwzcVBtQBKG+LKFSOH5tF4Nzif7ouw+xtdRVACe2svsveL7QwUHxpSXCOScTmpPH3Ev4Ww4tshIJhGsyAg9xJwM2QMWVdq2clCd68sU2zZBN0NKhgxFs8pJ28BSLZkPtlFE1KTJiAy8Dw+aSVJWpIgE4Dpij5Mzs8spOvzLc6Cb5eDGQmtfaLg2aTggY+2GM0RvzWWeOXeILdMPIYLmHBTTjK4+ogJFkqUX9iX5rRxxbVnS/s8hGIWWiiF9JhmKIWEhJh6Ho4oIieoRg1QTFG2MCWt7kogRWvui71md99CqsW2kAJehKiULcFenyZMTi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T9Co41XNdb794U0C4CUNz9k6AqD0LbtOYmBf9HqKVE=;
 b=sBJ8ttHk9dvt+yjRu75P7zvQZQBkFnycNB/b4mb3WW8dzsaLAZccEDW/2BL+GgTCAzcQCdrJ58bJy9zjb+FyNFOEb6XCZFqN1x/3TZVVUmss1xUO0Yp+hfeioPv5uXZwg7wbv8wXLGFT6hyVuWOaytcJJeMEHTsaARNHpUOFEXkD+d1FCizKAfzM6SYriTf6eE0GU4qj49NR7Vk8stChENfHJpYUXDADCcAt+YTB2/jzmdYEC36QsYe+kpeEqWTMDquyKEM9H47xIMFF86AES0mKdzIrq4Uu7QrkyIxFmjdTDGGhg6SmTkXDykXCKnNvfgK9YMqtifIikKwvSBkM5w==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:32 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
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
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH v3 01/14] vfio/samples: Remove module get/put
Date: Wed, 28 Jul 2021 21:49:10 -0300
Message-Id: <1-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:31 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pmg-NH; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 932e60ed-2554-4aab-f231-08d9522ab9e2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160B7AAA0447E1623C7F6C6C2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhstPzCBDzRfQ7IIh7FwglopvD42DtD5xy+bz2btuDmuR+x4CKWddzCMRooedqI5PK0no8y8Am9Ok/gO2D6nYeNien7uJ+/5fEiVkyw5c+ueHYaPHGEfrwbgr/jgoDJEtduBm7dlQAS4wIZKBfWbF/dlc+mAekcYOsfiGeutDH63ULM6zBFjNF9PfIcTgd8+W3VE9BA2+YBYyYPch/yrsvPr8wO8OZXDrEnDJz9IjX2x70/lwuJloPvRdjmPwtIPvivn8ABz7uX2m8TKMDeLBJUsTr2QTW1dbQK9MuM3Hpv7Kp8CUs3xWZAhAxipxfOaNJOyr/JQBqY+e6myZYYcxSasp963gQXtzE9ak69qExAiTQ4u+fsW4XJzIQyUqztUbzsG5Az9gjmPs6B86p98fF2NVnTbQGclv6jn/jvSkAuV3pkr35I8alr7drVDqC5HXKtY4weejcBjNBIOSEbS8kgYvcE9ZcGWSCAJPScTctjtmfuyaZrbzTrBwfjSPKwexjt2VEPbC5+a3XKmLePXZbXfLy25vu8bNssipQzY2yNarL6/J35lPcjBW8lu12R5XJ3W/jja5+9t66qQkaGI//vCtbvWyQWvoqzz1J43lFSjdAS5XJ/QZvDslIU9Qw6UOh+rKKXXQwueNT6cSHedl+H5hruLhUOFu8JgBMWm8BP8A9Vs78GfmapJ3Pnlq0gNpzsNlFU/zopG91DBjoCkMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYlr9ZlnCm8QAjiDBpR6TJxVpwzvBAq7HiHpPGoFcw//VUFl7PP/c05hiEmA?=
 =?us-ascii?Q?ISleaUfgBvgav5gGyje/POi9s0H8RwtInjqBhJs5OJj1iZ+okTqRUWWtnYy0?=
 =?us-ascii?Q?8vkgkc/N/QmNhoo+JYX/0jscOmxWNiL9Fl16UpwqBkpe1wYMxznT+P5O/UEv?=
 =?us-ascii?Q?opnqBhY5Tytds+07nQ3NVLvghE0PxaWkn9kV9xng3myRkoQYegP9JhuA1wI5?=
 =?us-ascii?Q?JBAbnTObQv+WF4cS/6ReopHLS5rGo/BejctOjw90xfFc72/N+PapdpnnS/jv?=
 =?us-ascii?Q?aa/cnRuc7gQ2FHdxjqOQ8tkpYQRvB6fXfMK4i2jSx9nkZWhi0f8EpsHYcffb?=
 =?us-ascii?Q?qaY2QSL1Xw3Qzt10/n6NQ2QqLKnfhI+8NYw9kjxgzMdpZVw//HyA98vKogUp?=
 =?us-ascii?Q?uYCs7uWBJb1IPdyzvdtsu1+yM+XkDvytGZWXQYne0InCLlxxvfrDLqgzToDm?=
 =?us-ascii?Q?qHDHjgSgR8aJW4jvgHNeDAVEjOWZ5FepwsYYCWhEzfgmMT6IddWukoD4x/yn?=
 =?us-ascii?Q?fJFKuMNY5T0s+3grrxwkSbdTvYGqZdWbbLp+cuKrdT4k/oVItevJDVas9EdC?=
 =?us-ascii?Q?AExjgF8wwk6/q7uAT+vhu1CwQtzj/Af6Yw6vMKF9zW3a7MV0IGdI0D53yfXQ?=
 =?us-ascii?Q?hj6+eGpYyZNWa5jddyNPqrEuFaKIzgbiFVvb2MClFlXW/odoVHgo4+KS++Dt?=
 =?us-ascii?Q?ReJSqkBTDJh+01qlyL0KghmeX/PCMSKFvtXXq22LumDCtqvDjKTWmJo1rypP?=
 =?us-ascii?Q?4pqqGBVX8MRSZaHfHHUCgvZnzBz/+ll9jCH6aXWrRH5cYx8leWddwJJgEfhI?=
 =?us-ascii?Q?HaKDDxKMhILKjDoJXt4Tn/jlvaqKE+pdPOauYpTtyvmeu8PIlNqrvwrftj/b?=
 =?us-ascii?Q?sIbnKkcz4OyHBnpsa79GCMByn8ZjZ6g8q/H4cxpsoMcLpvysiYyuI0UOULs8?=
 =?us-ascii?Q?aErOdkqvPfoWwhCqKXnjwY6y4mt3pFAjZl6JXA72WtvdgiaR7r4fM9tJRQr7?=
 =?us-ascii?Q?vd0KYIz3ca+6m5x/Nbx60d3ojlyLPdH1jWEm/w/3QPI293n3ciYwzI+MxHCn?=
 =?us-ascii?Q?v6hTnIb4mJZVwrdqBfqiHudAhhEsTXm7cpDIphWw5CZBVlSj3nKl1yTRbr/0?=
 =?us-ascii?Q?L6YrzbxpefBd83jG1PLirexfHvSYXx4FP85nM4GzhpWvGEAlyg/tS14qgFZR?=
 =?us-ascii?Q?1DJeFwg6S/BiYuQtFa0sZWM7qSjs7oVXeqFPULwmhli8iaA4sDwHxqlcdXYM?=
 =?us-ascii?Q?xjJ38o+CNp0LEdxfnkvmnd9foFkTnbUjbXXlJj4kgrRsQPw4vcAXq/hDUNuu?=
 =?us-ascii?Q?ym9TP2Z/HvVP5NtZpvA6s8kn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932e60ed-2554-4aab-f231-08d9522ab9e2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:31.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecQ8LhzKP+1sNsd1KsG2CXGuE7mqR0DmBAFyKyu0sFqxiNLY9imkRwn30UrJP4nt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch to move the get/put to core and the patch to convert the samples
to use vfio_device crossed in a way that this was missed. When both
patches are together the samples do not need their own get/put.

Fixes: 437e41368c01 ("vfio/mdpy: Convert to use vfio_register_group_dev()")
Fixes: 681c1615f891 ("vfio/mbochs: Convert to use vfio_register_group_dev()")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ----
 samples/vfio-mdev/mdpy.c   | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 6c0f229db36a1a..e81b875b4d87b4 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,9 +1274,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mbochs_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -1300,7 +1297,6 @@ static void mbochs_close(struct vfio_device *vdev)
 	mbochs_put_pages(mdev_state);
 
 	mutex_unlock(&mdev_state->ops_lock);
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 393c9df6f6a010..a7d4ed28d66411 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -611,15 +611,11 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 
 static int mdpy_open(struct vfio_device *vdev)
 {
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	return 0;
 }
 
 static void mdpy_close(struct vfio_device *vdev)
 {
-	module_put(THIS_MODULE);
 }
 
 static ssize_t
-- 
2.32.0

