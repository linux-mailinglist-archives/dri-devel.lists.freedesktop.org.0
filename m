Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B13D9A5D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE11E6E8F8;
	Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F646E05A;
 Thu, 29 Jul 2021 00:49:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odFQ7aZSGFeGL/FwbiAtj3LuvHeie9CSNp4WGsb5OLdwh/fCLIo3lGgGC6zDjM87n7L+GFFPwjbA43Fsu8dbjWL6XXhBvee5g5tF93S2TLLlzslzlzKG91ukmsk8DcNHG3s02OhHtb/EvxYIeEvLPeVqTRxnNWzG8wIqzy124XYt1TjTDHVW1NcJNQ/dhsmjm9NV/PxcjIGgW/Hr8KVRsdbWk3EXb4eguOYwJR2G9OEHXfIoy8P3zyoS36JB1GTuGUc0ZaPfWfhb2M+Ac7m31sVQkeGMO23ehSEaFD4qUkVxzOgX+1NlkAtj/jF++Np/MoTD2o6jbfpKEiK3aPDqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXyefBkktVmWek9EregEH8TYMRyjC/vbPCkBhyk9gFE=;
 b=CeOEo4R74WYOU2EkBa1jpsjEMupXei0JurY79yY7dbIee810Ad6QZ7DJcJExKRjNijLkq14ds2GUyx3cIC4Gz/PwyYU56cyToNGjG7dW3fumjQJn431H4J0mQro1lxwFQRCawaQzqT8J4i9GsRPdhVqp68Kwig9ejG+Eb9zPfhVdORNQhrpEYi2Ycr7HU8yDy/me1+6mvYBpYykX04Q8cM3dP0iVcLY4GIXX44+/XfR6UVF/OWXGtiYOKikirO33w1KVWxu7u4c/w+o6E/zAaKY/uaDjXUQIx4yE8Eibl1Na66ilH+u8f1L4eKyHomcGL3OfZ4CEkHeOreLPiGPHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXyefBkktVmWek9EregEH8TYMRyjC/vbPCkBhyk9gFE=;
 b=icoxScaRPAoKwAta/WCDRRBPmnFRQymNtB4ibaAZQKCDKp5NJHkhMmhvnP6yaFrVMo4VVDJ3YPoi4xasR5IZAM0mU7/is724A5OqWD3oqDWym7OG7LQpFgOAhZ1gjHY99bfVPGy02tSvEJf8L7DzO4E4SqOkcjM9CJ0Bn8TDnWZgh6tX+JxxmVT22xNPqYMO4YKYhMlfdu98xqGwS9UaYog1KxPfcPj5Q+uaBlQwCimbd9qz4pMzNH6gX42qt7HHeN2qJhzKl9XAhniUfnU8YiWhyoK3G0q3SIjSFeSLNdVpQPiOJ0CS1jlDV96YJ/mU1wojBPbFEEQRJvQfKyqV1A==
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
 00:49:28 +0000
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
Subject: [PATCH v3 07/14] vfio/platform: Use open_device() instead of open
 coding a refcnt scheme
Date: Wed, 28 Jul 2021 21:49:16 -0300
Message-Id: <7-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::7) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Thu, 29 Jul 2021 00:49:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pn4-2X; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b855d8cb-1847-475a-49a7-08d9522ab6e3
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160CF83B0AF513B153FC5F4C2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pRshqt0Qzoociw+7OGsVQD1+FA7DrRztrPsjlJbh9RS/zrnOue3uZZW7g/JSkg9dxJuCofeJN+z0zSaHKUrgnQlj1JFal7i3Akyg2y4KkrGaZE91hkHfb/M0Cjf5baaoedOE9WW3fxP9rLipdh5RwnXHmQp11MTYkGWb22nvnRCPaOGoLWUf9qryj5UGD0gOrk17X/Nw7237ixveH6nYCeYRiUolp/eKERU/8xSScng3RGKpDiNdw2HHvPajPaH6TU59FiuU2wsJjo2DiHFWLTRgm6HfWq35JBTEsqpmReD0HN/3cyL0ejA9Kxur1NZDzUSC0Uw5Y0j362/pEhCxP36iDG/Q6fU6qe2eTIrDMmZhxemzceYMa9uKtvFOZVfSreMFnEk6sJfczPIIzT1gSqicezBGeiJV6QfAzF2dF6YVptrS3EDyC08fSCd6nOVOvK2XSremmDkwRkRdkkKUGAPUh87FKiCASxfEOf3jSEThEYDufZkzJkA4aPo1sOBrnobqV+iq41agxeRdOF3vVWZzTJMaAUPNOqnOLMx3ikcp6VQ6M0B3Bg59GuSAWc+70IyYiFn3v9/4XwnRN556lykPZrOfxqaWPJePGPb930/lFasevUsvEMZ2m8T0y2Pxjsg/9Nyjr/wXUkLaPs64BNFm4pTBedRcDiaJDmq5R+jmTFcVeDkOVcPn6x3dAyXZyccNddkqCQlXDjLWBFvlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(6666004)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZ+AzuBeSJm1LLDt40aJY+T3/l+MpAam7iGA/r1ebE/MJEJToZ4cAMo9wxZQ?=
 =?us-ascii?Q?BkDFBLREcDVrmiOMlyMROAUEVdVnKmBrhqJg7tLq7OZ0oDXjgKYZt8K8Xalm?=
 =?us-ascii?Q?UiZJEXZgHJ7Pq7pkwE+9idH1jULIGXf1RbFZOjqJ/Yg/95WPuGh+msnxHiQw?=
 =?us-ascii?Q?xI19yRmi5MU/xMENkO1S7xHCYsrKmwAHA9K0YYij+gJiwJRRRfXDm55USu+k?=
 =?us-ascii?Q?/+mpLZ+bWlpj9iUvBYZJbD8Al12alUyFj1NnY+sV14oYNapRMzI2KXHEyK44?=
 =?us-ascii?Q?G29WTBDDlm76MQIYucYD/OTMRxn9mmde+N9kvVdaj3iNXr0GkVTeDiVu/NpV?=
 =?us-ascii?Q?YMmMnfrhjrTWLBm7K81HqpM5aMVDY3UZKq6H57LagXXkR4xlOR3GEMKL2+3a?=
 =?us-ascii?Q?9Pv8XgL/lZi6VcO4bhBWInW4DZh8tnau7LjDo13e2hl1n4QBBTMNQ2BpCOiA?=
 =?us-ascii?Q?isvmI85G94BKrjvZkDwMpQYGHHt/52EXaI/8DVwEm6GE/yPLDnZctnKf9VGL?=
 =?us-ascii?Q?RMWDYXmND6PfDh/sdNyo08cyygRDHTbsBOylJzPR29gqVeooKWQ+oxDfbx4M?=
 =?us-ascii?Q?1Hp4EJyvI8LuVXu3JuFcA2ChYqirM4rpuLHrvfs338XA94/Y1tQNvvB2U2DI?=
 =?us-ascii?Q?Cy0B44Chy4XXVG66lI6O/AF+JiacYbO8iTaVnl/shLmdGptN0yBa41Jv/sRA?=
 =?us-ascii?Q?hab48XF+jDuelHqjPcdVPKNxcMkJIwLYRHx6HPI+m6LTMuHyEnjDv1jMI/n9?=
 =?us-ascii?Q?Q/OhI7m6Uba+Nss6rpzTqD+4VgHhFzbi02EgmKsmoo0clwNlqKiH0QRskdHa?=
 =?us-ascii?Q?EqAVhe+jvroAmSfAnRJJ4rC2HvnAM9LgXMVGI7St3TN18rgqoT4zaXdLHR0Y?=
 =?us-ascii?Q?r/j+if9ne6JHtGeho04YOtQldMTjt/I5fW/AwO4vE2dxuQ+T63Iy+AYAbJWl?=
 =?us-ascii?Q?4Y7wfVj9HQvGjwrUzLCx/NCsXOBSFerjePn2KSIWKn8+dL47QF7hZYIntitE?=
 =?us-ascii?Q?B6T0k7asSSu6msBQD7e5o1GFaUaHzlKy296T4iYNDaz2w/KQR213IECI0pGg?=
 =?us-ascii?Q?NHnlwvKpORTpuc0XjPdlaPkB7w0PFRyAka1AeR1fhMbVSylWl3Zl4/L0l7oO?=
 =?us-ascii?Q?G62V/Tr4XZmSsBsOaaudJcx4heB90HXxb9AGdSjgxltnQnI4ognFIhXISbvZ?=
 =?us-ascii?Q?3ub2Tqa8KqpIMLAWXenFiwinq9YvUl+w7QukMrv+YqKNkmxQ75egF1FLBfM1?=
 =?us-ascii?Q?xuYK2A8oXxUfpMaf68sdCJTt1JX1H7xlKtCtEgD81oLk7bRGVvzKPLNwinp8?=
 =?us-ascii?Q?pwj4pdEXnRqXTCSQbR8TeXxN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b855d8cb-1847-475a-49a7-08d9522ab6e3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:26.1552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daxolzDYc2BtU5xeJEHE5kUdoYL/+iYMt9y89EUTVjwbp+kwadWGrt1ztDx6Hajc
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

Platform simply wants to run some code when the device is first
opened/last closed. Use the core framework and locking for this.  Aside
from removing a bit of code this narrows the locking scope from a global
lock.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/vfio/platform/vfio_platform_common.c  | 79 ++++++++-----------
 drivers/vfio/platform/vfio_platform_private.h |  1 -
 2 files changed, 32 insertions(+), 48 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index bdde8605178cd2..6af7ce7d619c25 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -218,65 +218,52 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	return -EINVAL;
 }
 
-static void vfio_platform_release(struct vfio_device *core_vdev)
+static void vfio_platform_close_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
+	const char *extra_dbg = NULL;
+	int ret;
 
-	mutex_lock(&driver_lock);
-
-	if (!(--vdev->refcnt)) {
-		const char *extra_dbg = NULL;
-		int ret;
-
-		ret = vfio_platform_call_reset(vdev, &extra_dbg);
-		if (ret && vdev->reset_required) {
-			dev_warn(vdev->device, "reset driver is required and reset call failed in release (%d) %s\n",
-				 ret, extra_dbg ? extra_dbg : "");
-			WARN_ON(1);
-		}
-		pm_runtime_put(vdev->device);
-		vfio_platform_regions_cleanup(vdev);
-		vfio_platform_irq_cleanup(vdev);
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (WARN_ON(ret && vdev->reset_required)) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in release (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
 	}
-
-	mutex_unlock(&driver_lock);
+	pm_runtime_put(vdev->device);
+	vfio_platform_regions_cleanup(vdev);
+	vfio_platform_irq_cleanup(vdev);
 }
 
-static int vfio_platform_open(struct vfio_device *core_vdev)
+static int vfio_platform_open_device(struct vfio_device *core_vdev)
 {
 	struct vfio_platform_device *vdev =
 		container_of(core_vdev, struct vfio_platform_device, vdev);
+	const char *extra_dbg = NULL;
 	int ret;
 
-	mutex_lock(&driver_lock);
-
-	if (!vdev->refcnt) {
-		const char *extra_dbg = NULL;
-
-		ret = vfio_platform_regions_init(vdev);
-		if (ret)
-			goto err_reg;
+	ret = vfio_platform_regions_init(vdev);
+	if (ret)
+		return ret;
 
-		ret = vfio_platform_irq_init(vdev);
-		if (ret)
-			goto err_irq;
+	ret = vfio_platform_irq_init(vdev);
+	if (ret)
+		goto err_irq;
 
-		ret = pm_runtime_get_sync(vdev->device);
-		if (ret < 0)
-			goto err_rst;
+	ret = pm_runtime_get_sync(vdev->device);
+	if (ret < 0)
+		goto err_rst;
 
-		ret = vfio_platform_call_reset(vdev, &extra_dbg);
-		if (ret && vdev->reset_required) {
-			dev_warn(vdev->device, "reset driver is required and reset call failed in open (%d) %s\n",
-				 ret, extra_dbg ? extra_dbg : "");
-			goto err_rst;
-		}
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (ret && vdev->reset_required) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in open (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
+		goto err_rst;
 	}
-
-	vdev->refcnt++;
-
-	mutex_unlock(&driver_lock);
 	return 0;
 
 err_rst:
@@ -284,8 +271,6 @@ static int vfio_platform_open(struct vfio_device *core_vdev)
 	vfio_platform_irq_cleanup(vdev);
 err_irq:
 	vfio_platform_regions_cleanup(vdev);
-err_reg:
-	mutex_unlock(&driver_lock);
 	return ret;
 }
 
@@ -616,8 +601,8 @@ static int vfio_platform_mmap(struct vfio_device *core_vdev, struct vm_area_stru
 
 static const struct vfio_device_ops vfio_platform_ops = {
 	.name		= "vfio-platform",
-	.open		= vfio_platform_open,
-	.release	= vfio_platform_release,
+	.open_device	= vfio_platform_open_device,
+	.close_device	= vfio_platform_close_device,
 	.ioctl		= vfio_platform_ioctl,
 	.read		= vfio_platform_read,
 	.write		= vfio_platform_write,
diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
index dfb834c1365946..520d2a8e8375b2 100644
--- a/drivers/vfio/platform/vfio_platform_private.h
+++ b/drivers/vfio/platform/vfio_platform_private.h
@@ -48,7 +48,6 @@ struct vfio_platform_device {
 	u32				num_regions;
 	struct vfio_platform_irq	*irqs;
 	u32				num_irqs;
-	int				refcnt;
 	struct mutex			igate;
 	const char			*compat;
 	const char			*acpihid;
-- 
2.32.0

