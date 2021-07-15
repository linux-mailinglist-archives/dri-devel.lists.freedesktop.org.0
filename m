Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1C3C9512
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3E96E523;
	Thu, 15 Jul 2021 00:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592636E51B;
 Thu, 15 Jul 2021 00:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHxV2/RzbBn/UKk8XTrBPDeHXR0JqOhK6ShmYM46FDgoVQ48fXXzpRp1i+HTRbhT/aavBtZ8i3uy0LV997v9fkM+flRsr9wDqWT+I/O40jMW1UAIYA4wI1Jrkvc9ItXvRYC2DlYO+1MEIrWT3iz2i11sKhhhau2FNOPpqkSysFP8ZCoLENzb3UOrlGDC5hxL8jf+ek8P+XGcolvkjOpEglBu+ZsPGCHWXlZPKfkQ2+FYDMZvnnLme2XWnW0cPKlxUdUKE75jV5ZIb0vSH8NDt9+Lotr2cvobgHEYupLdAXzZGM95apMXJd4oyLJ2DZFSP2updmzsVwPejqGMdydZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+yjMYhEcWEUEqiPJn9wZH0hUqIDhNY47wOx5CFzXys=;
 b=mO66F2a90khiqR5w5hX2a3uNRGLAYezU23s2ntXbJaMMIwMScky4umcWvxPUFaLpzdUZWCYKZ6Wj2CuN3UHbyZqbuHeAPLKhuD1U7xuwamS3Gf+ZEyFuoWD3RWZLwjRMFUeWwWLIH+IF50CPTp4a97nom55IyXu91ikmi/LKBZIuS3mYQsVvqqMBfpQ7sWd0Y74QXhM63KzfR9EFOW0enHazNSMgWqDbvB4FvGspC+AuTSCq7xzKsWnBl2eT4yxPB5EbLAZbJQ43IV7vnwrcuGDfjHOQJ/xTDFji5sYgai7l7KqlJzDr/VMdoX3V9F5ZhC3ur3KkBkaHBthFwVPmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+yjMYhEcWEUEqiPJn9wZH0hUqIDhNY47wOx5CFzXys=;
 b=bOpw6r8nH3/yPKPbeUrDdrvMOvheXiTIJGFLDGUmFZ2Xyhgm0RpKha+6pbhJCltKzjIQerYHm+l4yloLmQFkhGeYFGyWEUkd8d7afooWDlQQfBFVllolU5R2T2gsGOzGUEXiiUtY1/Waie1aSAYPmH5lEMDJh8AnHVKOC+ng5qlZX79Oe2DL5Xo3jSFGVFaUKuEWHl+tckNbYruoaS4FC4gyjFIoQVNm7AHUyCYTXtlCSJlQva/oMKcas2WK939q24ICnZbUh20gZGT5qTg/UOWRoFsN45229qXfJ9PEePJ32g65zAjRA1J7d38KYSByOmpz03VZk0yFGxRhQislTQ==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:49 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:49 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 06/13] vfio/platform: Use open_device() instead of open coding
 a refcnt scheme
Date: Wed, 14 Jul 2021 21:20:35 -0300
Message-Id: <6-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:610:b0::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:610:b0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002UxR-Kq; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf05dac-0aaa-42e1-e5e4-08d94726635a
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55553AC0431C88977D0DFE51C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrtXtPts6iNtcVUbj87slgKqm9fnkc3a02GPBJTis7YRIQ5QUw6C9/lre5AXIsP92h8VB4Vonn7bKnBUYsf0m6/FH9jS6Stu9xkmqqXD2GYn0CkBEGTerqju/rWBHZ6lUzX9bm6r9jHIAQh1OId7U6TxtZRFKxtLZPn3uiGih9Ah9oI9UxQH1+SG+INypsR/4A3LSwqKLd8A8OETY5q+ZmouiZRZSI0PFpEvIUFC3SgpyNsvT1LVnsC8VPXAGq4ViWCwQKWgRFNg6f8/2vYrndXWISMBD6pmMTggveiSVaGQZWcIr+BmNjBaWBmi2HjV5MwlbYI/lUu9c2l/Z4HVw6DED9jrIXbuuqxyHveSd4lzzhut749+3LkjZZC0NvEhF5OLlutPbefeEgdtuubChwFAmmyTFXqhrYCMRdgbCUGpdTYy7jZRZSYEcaRSdUgD99qT4wKEHba98LjPJBDP5wZOWfWuIEMcpQhVCLFtawD7afen8foe2dCD6ZEGFtZnJOFR1DOwkCMylJM8UF6rPH6GifdAeEZC1EvBCctct7HeU8zk02TTGPRKT3WJ0KX0E7yZqTeV8uxFRejNSNSicjQ+DWn1LkWvjBr9d1ttP+zWJ3zPBPEFgjzwzQJuVpnyLsrEGUSZ89pH9yjsqY202iZlAg21HzX5JgioBZ44w8z5Zg3Csz8I38adwgNTSmdJyUuhNlG25lVdPygOTBAdUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxO8l6w6dcxn9b+0UyRXv6l2djI/YMJxbaFqLO0KXzN1wysiMdb8+1JOkFre?=
 =?us-ascii?Q?mja7PLXXhGC9HdNw6RogjRlQ2Tjioyarn8yufnmso8FKXRbXvuqbP315yp31?=
 =?us-ascii?Q?Po6Sa93rmQ2Pi+12xdDPyiCa3JDmtEwz8DajBanfQH7ZFyKHRKim9Aj20XmL?=
 =?us-ascii?Q?EgmcjTwMWjOadJRCXkvavSCPZomT9wWQkYKbtkChNtME4FgCNMWXJ91JcmwN?=
 =?us-ascii?Q?Lrq75N0Ow8+4Rh79sJqumz/Lu4W0wJWV2p6LGBq7iaF0UjqpzrlBO7MGURUn?=
 =?us-ascii?Q?g/rUbotD9Rzl+vpgKz3uGyOOBEUCB1e4K8aV45hsxLk96IHeo2yFyBHWyqsP?=
 =?us-ascii?Q?HgK0Px+tP6ln8RLato908gGSfZWtFft+hnEaaxS6fNPxCn0lCd0x6B9CcJgf?=
 =?us-ascii?Q?APQa8qogHWNCfD3zUt3a6d+brKb69bDK+5WTdbbmNTMvuxxcKWs+BttElBeS?=
 =?us-ascii?Q?0jj4NwIsLE+pe8y3qPHMsg7QzYdReqcfAybx8W8LGGECn3pr/SqwdGubeuag?=
 =?us-ascii?Q?QEvZpBqLCELkCZ3VwcezzLctsd/rQde3Nw1F/Ii0rNkf+nY5YIUEDDuIDGGr?=
 =?us-ascii?Q?4XxbZZZhS4VgdXFSoSOcNWccaC1tKma1CRYgC0t4mIynDgXEUHC1xtTABhes?=
 =?us-ascii?Q?vR9xwnyMErifQySEB0eaL3dTQI4rGGX8b60n99BhoXku0V30Lxt2Qzhvsiru?=
 =?us-ascii?Q?hliJ/+3avi5Bl0fRPh2sOgqbullpJI2Flmf3JAfMHBVXnJr+YFlhR9rTxv0I?=
 =?us-ascii?Q?gKBOTB6GLjc+xf7H/mL4WiS0LrsXvp6G9d593y58U/6hXOKyGTuZl3j0Cjpv?=
 =?us-ascii?Q?3XWyNBiNldoEYfc80fOAJohKKpxUDMamSYz2w2/v0plVS1aX7g1BhZrFAsLj?=
 =?us-ascii?Q?wVyfmA2TiaFxMaVA99+yvM0Z3MTV4UW1XZpVW0p/OSWcLAZGwgRtKEzb87eT?=
 =?us-ascii?Q?76nqNh2tkrQ94H4Hx84DCOw36/kjPDkzDDt9XaS20xaoAhD7AzbREyNzC6fc?=
 =?us-ascii?Q?nDitDieNY53ZWf3lO7wQdAefyT6cwvHor0+hnsu8Grak5rIMwl7+WHYDnExc?=
 =?us-ascii?Q?qJ6E19z/LsD6CdoiH2VLI3P5/eeJ63VN25k6K28cW+l5HspI8QiguDvzGvEl?=
 =?us-ascii?Q?Ij6mBu6Qiu1sIBT5AIC7/qqcZtrcV0xQMBEDu6H0uD7loyB7NRXa3knQFLo/?=
 =?us-ascii?Q?psozi1euIvR+kwKApFp4K0pYhhWKjntMGnmP7hUyXuRsf7s+seAbnn2tYJbi?=
 =?us-ascii?Q?1lYutnnesPTm3g8VcisIXILT4N4WalumDDvJ8S/TgRLRbQE0XpWcnCSgfgOQ?=
 =?us-ascii?Q?FqomOABcGJp97qyNJ5+hoqy+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf05dac-0aaa-42e1-e5e4-08d94726635a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:45.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZqH0BUQeSxZ/bVs4yAW9L4GYsr62W2vdnHYU0Kq/IwlwRDAJh5ccLyVDlsg0TOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform simply wants to run some code when the device is first
opened/last closed. Use the core framework and locking for this.  Aside
from removing a bit of code this narrows the locking scope from a global
lock.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
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

