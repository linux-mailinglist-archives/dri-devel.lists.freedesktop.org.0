Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952A3D9A42
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60096E8FF;
	Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A16E372;
 Thu, 29 Jul 2021 00:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfP8Chrr0rYAGpHGbzMn2ismO5XNJSvpJ1mOfxZWUarfvztykWkamQ1xzf9Jg9R5FNcxGqB2Ob15ryps752N5Pa0CVhnRbqT3kJPUMV2KyxNI7jyTH627Qm1rYYJf2IZ3wg/KA3CZWT9ePj16sV2UNCEncmd972c+4xWUl/AXHZHtlTUkUOodEpy/nbNp9Fj6Ic2Um8aEdgRKkNSXIuDOR7+XbCCo66hVecnceGGh19ULOy283+hJlVIbYMs5EJQjjD0aXfNoAXzsSNyxniodl+pApkcLyAHSLCQeZBanzXUqETwpCIje0jKHBu08k4JXyCBBVcqtOSqvYFocHWc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=KYeNc6E2zuLhJelVdJTCjsg2kciSohpEO2B1C2/b3hReuwerf3ieort6faPZGgkq1jTXeBdMwqXnE7Xq3+/zNhNdjyM2HjOxGGT2cRc71A9HOrJOyN+8K8uOMLogVBTh2niqjELt57dt3mduuVibslPRQseMSryHrf4wE8SVGDyTHWQub12xBdS7owC2WC7W97e8ZOXKO2ZcCYxPCr30uj9zQ+bEF4x9wVRzQspNy0m6qjCQhygP/FTVGZG8RQbqo4fZmH5RGewMew78Odr5wzAceaACs8rHZnjrgnuLWcngO1EBv3MNFIS9gXdCfLfwRg2WSa1e2XfORc8xgiFCLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJK14RuN27yL4pbSykuBL3LBGOhHR4BSiLIrEDi331s=;
 b=O9YfBu6SCLgYmhsHstSXBo62pIHA03ioTNCVy+pcRkN6yWAUbVA2DThuCrwZUiDIqcI7vS5IQjYIsZ4wpZCk9IZ+VZ9JnlcIgJWvVrqaQbd9uxKXf3KKmqm59HYGNZqR0QBWQZK0qbcxfMElKPQBjs+HqiB0Y58ZI5mOKoxHCyyRjtb7J9/rJWpOfGjW51LAJKV7dZ1ijeqda0TVx1AF3nTeLlYVuGETb9ULg9978wEy2UtBhyNl67q6l4Ts0tF2JfOmFbCQ9YNY8Wbk4h3TFwdAp/rF/iiHSZzDyiCCWQxlb3Fmpiqa6hnDFf/CQK5rcSAxxh5UaiwjQ87l+v8LRg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:27 +0000
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
Subject: [PATCH v3 12/14] vfio/ap,
 ccw: Fix open/close when multiple device FDs are open
Date: Wed, 28 Jul 2021 21:49:21 -0300
Message-Id: <12-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.21 via Frontend Transport; Thu, 29 Jul 2021 00:49:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnO-8h; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14a8f922-7b81-4ae6-2254-08d9522ab6d7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB516073262E3884FCE975BED2C2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODM7/097UCSDrOAUsa7QObsnWV9BCgjdED3aagGgSJKVEDtaOtczCu9pV4ZgTPxucCZUhs0JW607bqzrnXd21vvnhKX3azpOSD7px2iP5oioYBoQfa49QV7b+hjVo01A3IG1xN4wLAbe2qtzMbCMrN6/EDYjffuGFzVe/1hoqG/BeiE99MElzZahNEgV9Jf8dqg2tsETG/LbImp0nolqRBjSY4ogm9Zgj7kO3dXz6nc1xIFQJD4Db0fQmeCAVLm189M22f7JW9x1Me14Ns89Fm9erNmDJpjeeL9uUpi4zPP4r8OahiBcy+sS3PsjnIOw/omEypCDE5W1HrBC4Q69DmXeU5IIPoxN6Gvr5PQMFv6XrBGMQ4UDdbR4uz7+Qgrt+DdN6wOxMg82o8/99cSfZSbiIQ/muVYYVYTjVmO6jy5f7T78u5fAO+kMSP60SC1l/7+j10AlkgcQ98rOcAVI95khfJHrIOso0mQYxE2kOF6iTw5fpvV+DimgFRUfb5By/QRx3jXtVNYhyk4ncS08GRuR1hYj3PhcJc35GumTnoScOndau668gXx2FhMBF7q4+1MUkBsS0CKFQX679KzAs/AtRatrr7XCUZHEQMkg3wtmQiHWI2CGDfcCr8q2mGSOpdofrp3zv2fbQnmlUhdbPzLn04XeEJdASAfEVhRS4p4zNWBDZ15LRt3NMILpZ1hT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?znWA2lDXKXYjJ4CfDpqtyiV9wH8Jg7gkc4rG1kQAAik9p2UHrUMQ8FS8wqfz?=
 =?us-ascii?Q?/rsLTpgyEm7L3lkdSmHAK/dD0HjVHOoWyxuYuDoSJS8wxRdAgT1geaqJlMxi?=
 =?us-ascii?Q?7t+8IydBkqPptAH5c8Re3RSCXOEPTG8UgGV9BkVOamb8GN8xXeNj7ZVNYTve?=
 =?us-ascii?Q?twQefth0FYu2aXys7BCF0yaeEW2ztDsg3z+YOalhJ+b2A3YqJOvwLYoyuqwa?=
 =?us-ascii?Q?vClzinJMKbXUQpBlExPOy9hA0t2Bt9Khdl0IOnfrcTghewA8lH44x5You58E?=
 =?us-ascii?Q?Jv+RMyn5TvnsC2gHu2K6HXcLR05ARpyQS2R1bvNfsqywa1HxKsWe2wg8Vn1K?=
 =?us-ascii?Q?cawu9vqpfMSBMpjWTV+b4FAqBzqh/MtxPKlQMO37LzoMRSmBoheLtnSQJ9iz?=
 =?us-ascii?Q?6dC+DnyQn7MmYd7Hxbqhl8F/clClxloUFTqnLzuMHIGOGNmTiH4Z+nQMQURs?=
 =?us-ascii?Q?OLSsKe2156r/qwgr5taSINfo0Tl/yd13QJOFT2rSNTBNLoy48HRj2MssiWdz?=
 =?us-ascii?Q?V66VJnF0gfKaYYNjZrSVTJnvfJ2POzxD+NhWoET8gzdFhT86kPJoZ2/qaitE?=
 =?us-ascii?Q?pkhXalLCrFMu7LvsPgLkFtyy4NJ0oTjiJiAcGCKPEm79jvXerr/0gh9nBIce?=
 =?us-ascii?Q?lHcaW39ma2E6DFsdioue+NDAFfHCb5n/Pytk2pptzRjy2zPPzOsk9fGRPn2t?=
 =?us-ascii?Q?078FsXvjVF+efCNLBpzF4wzZURpIryw8dFyW2xk1j2tAgAAjQv1GRfqoGrg+?=
 =?us-ascii?Q?jRhKbRQCWqjygd+7+jO8i96/Krj8bA3EQhOm7gf2HTG5rGXESD68dL7tQjsC?=
 =?us-ascii?Q?yNUAEA99qiisRA3TcxOvqX6C7rbNK89ixbsNGCzIr+kSc1RU/974VHvusyvE?=
 =?us-ascii?Q?6oaePDF11Ukyw94D9qSnt3PHqM/VJ8BbDsu+5v2hoGzV4ht8h93LYrd34sRy?=
 =?us-ascii?Q?9SpYoSSzAbxRs35swoXwusirFB+Wrdp58L5i6TKPJ4q1OeTS9IdppCgbsD6m?=
 =?us-ascii?Q?DEJDuqrLfmORmAmTvyni7zivQl1svPPQiOkKucnOEkqVVmU22ISRjvnZP3aW?=
 =?us-ascii?Q?ooOlxfXChHvCL6dz9azwVwbeG0talh6JyMt4p0VwgN0QPEB3ZxXQ5z/Www49?=
 =?us-ascii?Q?oGmyI8rJ8zHk7b1SmuUe5KE68aEuHcQvnAaGQlCiJO5J7GDoBrrbA71yTlqU?=
 =?us-ascii?Q?wzsaKmH3snmUujWcQHaa4ZQxWtEbRckBl2axkoLC/8mz8lGXfi7rwzaVGeqZ?=
 =?us-ascii?Q?LxUrW6bH0Zudce4R01Td9FsRNhE2ttgamFsYaHjaCYpKRQdbPZYDugazZ6sv?=
 =?us-ascii?Q?hY+dqRRF08344lrnqSlJMbEa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a8f922-7b81-4ae6-2254-08d9522ab6d7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:26.0974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNG50LT0+rV2WamKAwS7Hq6huuDeZFKAVKuIPq1NdsNB4hWJ4UuXydecqEbFncwg
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

The user can open multiple device FDs if it likes, however these open()
functions call vfio_register_notifier() on some device global
state. Calling vfio_register_notifier() twice in will trigger a WARN_ON
from notifier_chain_register() and the first close will wrongly delete the
notifier and more.

Since these really want the new open/close_device() semantics just change
the functions over.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c   | 8 ++++----
 drivers/s390/crypto/vfio_ap_ops.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index c57d2a7f091975..7f540ad0b568bc 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -159,7 +159,7 @@ static int vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	return 0;
 }
 
-static int vfio_ccw_mdev_open(struct mdev_device *mdev)
+static int vfio_ccw_mdev_open_device(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private =
 		dev_get_drvdata(mdev_parent_dev(mdev));
@@ -194,7 +194,7 @@ static int vfio_ccw_mdev_open(struct mdev_device *mdev)
 	return ret;
 }
 
-static void vfio_ccw_mdev_release(struct mdev_device *mdev)
+static void vfio_ccw_mdev_close_device(struct mdev_device *mdev)
 {
 	struct vfio_ccw_private *private =
 		dev_get_drvdata(mdev_parent_dev(mdev));
@@ -638,8 +638,8 @@ static const struct mdev_parent_ops vfio_ccw_mdev_ops = {
 	.supported_type_groups  = mdev_type_groups,
 	.create			= vfio_ccw_mdev_create,
 	.remove			= vfio_ccw_mdev_remove,
-	.open			= vfio_ccw_mdev_open,
-	.release		= vfio_ccw_mdev_release,
+	.open_device		= vfio_ccw_mdev_open_device,
+	.close_device		= vfio_ccw_mdev_close_device,
 	.read			= vfio_ccw_mdev_read,
 	.write			= vfio_ccw_mdev_write,
 	.ioctl			= vfio_ccw_mdev_ioctl,
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 122c85c224695e..cee5626fe0a4ef 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1315,7 +1315,7 @@ static int vfio_ap_mdev_reset_queues(struct mdev_device *mdev)
 	return rc;
 }
 
-static int vfio_ap_mdev_open(struct mdev_device *mdev)
+static int vfio_ap_mdev_open_device(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev = mdev_get_drvdata(mdev);
 	unsigned long events;
@@ -1348,7 +1348,7 @@ static int vfio_ap_mdev_open(struct mdev_device *mdev)
 	return ret;
 }
 
-static void vfio_ap_mdev_release(struct mdev_device *mdev)
+static void vfio_ap_mdev_close_device(struct mdev_device *mdev)
 {
 	struct ap_matrix_mdev *matrix_mdev = mdev_get_drvdata(mdev);
 
@@ -1427,8 +1427,8 @@ static const struct mdev_parent_ops vfio_ap_matrix_ops = {
 	.mdev_attr_groups	= vfio_ap_mdev_attr_groups,
 	.create			= vfio_ap_mdev_create,
 	.remove			= vfio_ap_mdev_remove,
-	.open			= vfio_ap_mdev_open,
-	.release		= vfio_ap_mdev_release,
+	.open_device		= vfio_ap_mdev_open_device,
+	.close_device		= vfio_ap_mdev_close_device,
 	.ioctl			= vfio_ap_mdev_ioctl,
 };
 
-- 
2.32.0

