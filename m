Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D73D9A75
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F226EB92;
	Thu, 29 Jul 2021 00:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832E6E958;
 Thu, 29 Jul 2021 00:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mzs0lswnUSSWHlnOCNeK0aokOeXO0vkutzlYoPoDEEyLc4xtDyvMcyMb2eTK2PK+6zkQ9aGl7WIZxzha7YK8SPm18Wfdp+9f8sdxvILmyc0e04yT/Bh8K26YqM6ZIrHjBjaBS/kYrTJ6s2Mub24wPA8RkQI8yk4iTE9gktBp/PVAKSw7aMkWYNPv5zu9vwPLsLeJ92pGDCeKXJqpM/B3F2LSXZNd1dhQZQ30MmFOYtESs2Wual20b+jtq0I5MApAtarVglW5GjYOf3zJh9NzwO8a8svL/6xim3DjRZE1LGGfpYGlIDXqJ6poCfPIVza0VruMiLWP/HsflJF/UOWfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLGplyUOI1vk2Tp1MTRUFrLoOOCdoTKaDLTz1c2M8/Y=;
 b=nQxjOuR/QOpmhOLOMHmYTPcI6w1ljsEzA/bhyJquJYkGdJfZ7eqh7rUcyLD/K4xmKew2Quhhn3uNP0nIIOYeQF1Ff/o56wshjZOw93DSl5JwEt2rIY3E4B5hKVnyxSA6DgXCgrxuZ3l3vmcD+rYlRQHgUb8agaMOg7IqtXLsy7TCKWq8P7+nTHz+fG0A0Ugx7T3NtKENMkmmZPS04R4gDUE4c94oMAVUAGSwoEcuet7U1ddQF6Kdri7AlImy6k+8/0pt+68G/CN++gWsF6P7eXxIpuhxeE6HuywtVIvPnL2E4TS+lz26j1MUVBq4AisgVHpaYKPJzvwbBgHbqRm0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLGplyUOI1vk2Tp1MTRUFrLoOOCdoTKaDLTz1c2M8/Y=;
 b=CXQMT1E9EfkYDsB+0GR4j7ouhRac2xRsCelNh8qGNCXA7W2+Wqb0kJm+kUxmCwZXx4uZqd3w76H/IqOJtUw4ftB6Yt3yEIPtrJPjDGEumPthuIs5UyRrjSDUwvNRmcHLlIy50DdP5GkxaTywKYlLIIN8xEYb9zUT8fyF7B1WxHbYa2YBuYVxJUZzXwdupJNYqXg+EZQYboJ8RYYdw+5+ORrMlgTVfHgoTXbXlwkNB6dElkM2aqPZYq6YMIhzrHGyhuq+u9UvySNr9XnwB4eD27Dvnud6KC5IgnA+YwG9Ox+l5dA1qGen4IIV48b5TjQoTSPRD6E93GbVmDelsUP7HQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:30 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:30 +0000
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
Subject: [PATCH v3 05/14] vfio/samples: Delete useless open/close
Date: Wed, 28 Jul 2021 21:49:14 -0300
Message-Id: <5-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::45) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTBPR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 00:49:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEl-009pmw-Tn; Wed, 28 Jul 2021 21:49:23 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d7006d-bfa4-4dda-e746-08d9522ab76e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB51604683793A64EB56D5F6AFC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/yAAkafMjquHIkzNjkCqu4BNTX9nIsC43q3OgaIjHBl77s7RrNdnEmLm8iCD3s3QoEutjYO2iys/wPyGwaCocIOvmXmP7zrvV3dPQYtYvMQYSAoyjiHB7iXcE02DI2jBltM8yBiAOL+diFtRk6L5BxSFFWLc79cMC9rpFNcmdk7wG8jnIRAHBoBx5PTy42GKx9zBRWMmo5q9iZbxJHTmNh4Kn4BU/OEhdvxk+TJ/ARTe+fBgN9tE/6/aZDd6L2sQj05rxBE9Mxp1PS31eLTi/P4YBgX8YWCteaAa9j1ekKERuru5PLuPJFDbc3ezpXC50MljCDF5mYVGBzayPJxfULY4OYnTKsXdcT2UmkABOADjp1G4tOo7jvwz5hLUymV41UpTXBFYmgDkgrW0ez/OBjIdCwScGQ77zp4CcLr7rA+/EEc8An+3pFm3sUCjjNOwirml3Vnf1Xkti/wcGwsUJoiT1JUTkb9Zxwu3Z5NDSl+S40UVlaFLQrJdRlsZGphvsV4xOefiXQNj4+auCpu5Qb0R2HgqUNs2ONaVw6kyAbeRxnij31lqjfyXShUt4wJcKfAgXeED/vEsKYBfwJj5ZcnPGkBTzqgIyhyYA8ANkPGlcObTAeTTY7v1L5KH4WNB/SHv+1N1bYMqRLUr4PFbIecSQLN8GlcnK4RaVbdg3CxUaEfn/IYgo3PuJ3lNf/gnazHhP7w4K3xFyAtCMHARA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Niw/49XD85Vd2jAK4nwyZFoSFx6kE77OV83pDESk8qwo3JoU9pHyDAsfQ152?=
 =?us-ascii?Q?eTI8bRPL4HoUu2vbUrp/XI1jl6hEOeqbjXOmV4NDLwXh7P3Vdo6aKnCcF7eC?=
 =?us-ascii?Q?/HITDQKlPJdL/z0Fqoww22dwtkAyCD0/8tlDpPbUSQ3gtAT0Aukkw/w+NGD+?=
 =?us-ascii?Q?8LRsDVxLPbaAx785Vs8jf+evWLapGiyUWPM9K+tKXeXWBLEcTBVaB0EG0eV/?=
 =?us-ascii?Q?VrZXY1o1DmPsjZHbgeZIrsn9h1sjc5w9JnNzq8hoZHuSi8bP4VdTK3uRzDOp?=
 =?us-ascii?Q?UQp68a95+G5M3GwB0tVw+v9dMP2xaTAAl2Pact8+DwFDOOHDjU0JpMGAw3Lm?=
 =?us-ascii?Q?KCL59/xxv3CSQyaAqJIfqafFKb7CXZsKmQXxPS++wE3TejzKteqzqokOYdhw?=
 =?us-ascii?Q?kcW/bBsnkgi3rRuN8YtskSRtPdfJaiPqxvX1xnexUijCKw50BdSwChFC5qzL?=
 =?us-ascii?Q?avmnI+k3bGQD8b/EPt21w21bLWIkzP0DsfTcsERN9tC2ahIqGM1KHJ1OTwVM?=
 =?us-ascii?Q?Js+6HeE18wwjKhN51EAoAeW2O1mRYya7okG0fXoeDBwCXjNfujDr7HYhzWlm?=
 =?us-ascii?Q?x0WxexV4yPKOOjR/T/xPtFRxBr4WMaIVfAEkZnA4HmzQvzfTzAIIUQz0dj3F?=
 =?us-ascii?Q?KGh9QWo/33Ni8JdCVpBfC7DCOIrvhPZZEb7zSYw5SIiBa3ALmWJCMa93lAb2?=
 =?us-ascii?Q?w4mmyQ5z77XvdHPnDfjkzZLD8m9cSkFb325JOC6o6prBSs/ULYapzD4C0044?=
 =?us-ascii?Q?w2FKurqSK8zFkZWZMlAkAx0X7SRmIWOtbZUzsxDSQoGzSeaPozpUlrkRjKY6?=
 =?us-ascii?Q?Pk7dI2tpDjqoI+NaDigS0IrxtC76ATIbV6T0i3oGwecVxSOGE+9endju6DWY?=
 =?us-ascii?Q?JSriD3E9te46tHC+dGuNPljpAuoU0gGZ/F0GU4suPO+JfuLwjnr8kWXRc0zf?=
 =?us-ascii?Q?wQ+4e+t/x4Boc9DvKxDk4q/csmo3UTx/QMJG/5hnbtW1QalI4FpwnRtdkRQy?=
 =?us-ascii?Q?y70WH0IS7bhKVD1zkhuFTg0a+yDRZKgdaB2fVV3yg3/XcaxsIkxY2LrL40+0?=
 =?us-ascii?Q?3sNOVdBf0IrsmVrLJYz47LlBytqe/8OH09GQ86YjowYBDaTCrhjM9WNZaoDP?=
 =?us-ascii?Q?vmk46nwMqfpubYXyG3XOYT1tVuKObN6WLBHr6A5DmAx5T20pL+SgFU0pfPAc?=
 =?us-ascii?Q?iihDViLtuR0QT2hedMR5B5CiwfANjSH+SH60uAQRHiJmgv8UqWYyUSNASF7F?=
 =?us-ascii?Q?yGkbXGj70b+4DDzGd31Mu7LTrgjrqwP2kaqtqE1ojad/sqafI4d6NEKiCFlV?=
 =?us-ascii?Q?NRuHggx0OvE05MizBNC54BUc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d7006d-bfa4-4dda-e746-08d9522ab76e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:27.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBdzmc3SL9J2hHm5obWEh3RbM6EODekJDJczeEmRcm9yKnhXsBsMmV9/Stfy6/fY
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

The core code no longer requires these ops to be defined, so delete these
empty functions and leave the op as NULL. mtty's functions only log a
pointless message, delete that entirely.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c |  6 ------
 samples/vfio-mdev/mdpy.c   | 11 -----------
 samples/vfio-mdev/mtty.c   | 13 -------------
 3 files changed, 30 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 3d02e8e5964be7..5ac65894fcd38c 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1278,11 +1278,6 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mbochs_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
 static void mbochs_close(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
@@ -1401,7 +1396,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.open = mbochs_open,
 	.release = mbochs_close,
 	.read = mbochs_read,
 	.write = mbochs_write,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 57334034cde6dd..8d1a80a0722aa9 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -614,15 +614,6 @@ static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mdpy_open(struct vfio_device *vdev)
-{
-	return 0;
-}
-
-static void mdpy_close(struct vfio_device *vdev)
-{
-}
-
 static ssize_t
 resolution_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
@@ -717,8 +708,6 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mdpy_dev_ops = {
-	.open = mdpy_open,
-	.release = mdpy_close,
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 37cc9067e1601d..5983cdb16e3d1d 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1207,17 +1207,6 @@ static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static int mtty_open(struct vfio_device *vdev)
-{
-	pr_info("%s\n", __func__);
-	return 0;
-}
-
-static void mtty_close(struct vfio_device *mdev)
-{
-	pr_info("%s\n", __func__);
-}
-
 static ssize_t
 sample_mtty_dev_show(struct device *dev, struct device_attribute *attr,
 		     char *buf)
@@ -1325,8 +1314,6 @@ static struct attribute_group *mdev_type_groups[] = {
 
 static const struct vfio_device_ops mtty_dev_ops = {
 	.name = "vfio-mtty",
-	.open = mtty_open,
-	.release = mtty_close,
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-- 
2.32.0

