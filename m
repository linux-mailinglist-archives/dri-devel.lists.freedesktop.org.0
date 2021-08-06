Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A23E20E6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5216E9C0;
	Fri,  6 Aug 2021 01:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4EA6E905;
 Fri,  6 Aug 2021 01:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTxkqZPR4Yr7beEG/oHsXQPTAg6h8gZWTzG3Z/DDag9q66MQ4VxwpdBvrgG2q+4mPd2HgH0KvUBz3KvymtG1w680/oQO7p9wI1Xt8M5NIcSyZ4M9PsKxbPFrHk0JyuyilIE8IAuMENZklHvUWL7ODKZX2popSD9ByMfYPFx6xE89AGG8R3YEGYy6YmNb5KGGqSb9xRvpEAiXiCuhR0uGRjFnzdeF1mUQraA5Y8F86PS5Sr5IYYSGxeAZX2yWIg9kjTbCrJWQ/ZN4SZ8sjUbI0NQIWEKVfRS97mK/+ErUeOXXrZKQ6/SH2d2FHqjSHePI7IHRx8WMswqq+RDx5jrwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpaOi4GcFtwKnGBjbs9PAq5eiPJpaFKiKbHIzApgzA8=;
 b=baB+1HLSdEIBDsLR06JC1EpfzC/hOtusOWOCrls43AnhILYcvbilLzpe7RZCdG1v43cfgXAHz3JGOnN2JxN/Em6ozMGxwE2Dsy88Ydbvu49D7KCCnYF9Ab3Is8BovrREjZsTcsoTLAVDRfblYLRRqwAglgLA9w9RX6CWudvZotkRghB6Fd7mlLRaGf55riMHlN3PdZ9eaaet7ed7AoImltWl6JTZs94+ttM9wiDTfFOfcYMJ95jwKQRFRtBXI21lvBkSTFDGi2PLHZWJg8KDp4AV4Z4SodPsqUH5ddaEB89pPDrJo/ftM2qZXUolbXrn5saR32eot1cT0+AudSHgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpaOi4GcFtwKnGBjbs9PAq5eiPJpaFKiKbHIzApgzA8=;
 b=XLLNdrswAe+UNUO8Js3oxVjsrXlTIGu7Rv0CouU+10UjrLQ0eY0RIIktRgyG+K/eF4QXlzovTtqil/Aetc1apjkWITM4fkcBUY1WRN/5rET0hW+yfCVGnreN6jdWOA7c3ZTSjK3FVfJRBdQR8fjttDCLpWC7//5NZG0cgvTgW4e98gbMwbdENyXSZn88BdyzYHlGH644RUn0WTrUCtWj5XA68r/oIHCa76ob6FmiC+QOpjqqHvszr3zoVTgX10Kp/vdmz9f0KKBxRRqQ/PUKFVZ0svgWu2VqC2u9+snlK4cf5wT/sQ08xS5Hy552/1HGMRMnKvKbpiEWm/4yoJZG/Q==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:14 +0000
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
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 07/14] vfio/platform: Use open_device() instead of open
 coding a refcnt scheme
Date: Thu,  5 Aug 2021 22:19:03 -0300
Message-Id: <7-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:208:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 01:19:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7G-79; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3bf9d59-8226-48fc-bff1-08d958783325
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206A99AEB5CADBE5934285FC2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWqmXJOHeef2vUVKN0QrnHQ/XYkEQY9CRwimkFgQNyI1SSOIGA54maI3Rc62S4VUriS5Ip2UoiGBVoRfCfgzsEyomqIFt+x0cl+DN3JsO1k5yIM/4jBu+W/jqzySs1TD5lRIH2I9CTQnuA319cDqj1+LbPFvRWuUOqmmkBrkVq5gOEKxmuStPZoYGeI8sc009cRB3nxDS2tIxGibTdNeyWUv19fYX/9JheKbP+Cro0z60GHzCY/rYtE15QU0PHwfigCq0yGZeDma0B6Z7frSq7WpX/+J2f7Wm0tQ/VCRyf3t65LByW7UgEDSsszFH1yVM6iVvVrCxUQPa+Xia9eWAO1yjnijyoglXykrfbP8SOwa47XIJR7NFU6d5VCF+8qCQBJ4CHYVk67KvurTwdxRucTE1OuXArpIvmYxBBAh6JtFprnFixHfsNo0BWlIU9XSeDM56zG5qJc12Ipxqbf1LkbGB5C/+kLMUufjrXK8GHk4TTznha3t8kW3SFStHJ+bmefcQJwP0wheMbrYfiDtOnvWO0IuGKj71A0FXemlsh2IE3xGpkZNTTl9mw57gUKY0hvlzCtK79WaDHLL2ozH+Z6OdIzzwC8yqAaBE8//dZ7RHUFxo+6C2EmN2svo5aga3mX2S+F/O8zNvWADXXLKQcqivOQfAUlBqH9FqaAAUUxNijX86Gfry5LF2/q5gtgRlFAOfCXexsHuq6+1sQHe4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(6666004)(66476007)(316002)(4326008)(66556008)(110136005)(54906003)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u/mFF5WkbhsAEf0qws+qQD1c+IfusAccT6lGxolOIVZ++vFkLoeQyWAM7LeV?=
 =?us-ascii?Q?AL/FVR6tuqEkj2rW8djrIHh/Oi8hsbl5vpYE3N/jBbYCTewd8PWeeJGkJM25?=
 =?us-ascii?Q?53fl34APh3mCE9Hd+7m5rxNsYiyqySBO+1YE9btdcSzEo3aUCVt9yVaoYDSp?=
 =?us-ascii?Q?3KWZljgvYwjbaM2pXnyHK+e/3U+WfZ30cHA7//TE/jqhnyJjgxt5K9zao7St?=
 =?us-ascii?Q?c0u2ll//FeEIrd5gasy1p0C5ZlU3SlK40peSreVYG3uQaZB/xYOiHj6nzlRq?=
 =?us-ascii?Q?iZCG5yqMMGj93y5KQxcn5FlDDUYdiDYGHmnbBs6VL/z4gFWJq8F6Nos5qNPz?=
 =?us-ascii?Q?O1C0UxBNF3ISHAdf3T7YtSrd/sfbRcrdzmb0jAcjAOT5ODQxKMlgj0Z84zmo?=
 =?us-ascii?Q?EgcFzLgirmkglZRmnbIRrY4r1A8T7DSaBRLh5evye/b7NjiQDdgVFlwaCWu2?=
 =?us-ascii?Q?EwNWhBafyhGaw8+j0Sq+R1gHVd00V4GWNUivDusEuDHuttSk/4GXLNlpmaaw?=
 =?us-ascii?Q?7Zzyx8DGqnlTIhhjXa9CoH+MYq6wVVXmA6C5f30FPKF+dqIm231nuJhIwZwf?=
 =?us-ascii?Q?7+KJpkoltEBwNodOlADW9MucZqb38FwRQCFnOleXwtatb7nprSJGVg5jzmWV?=
 =?us-ascii?Q?+wt+lymeOHKjed1TJBQLRfnNCYF6s2x1qZta0h9zteVDxsqSOeLiIEjhXZrI?=
 =?us-ascii?Q?KJBbd0Gg9nX8HwxUYpvcDu/Jb67aAZAYubylmm2RxqjvoHgx5chT6ZkvDt1o?=
 =?us-ascii?Q?YMYj5F6NRDzTI9pykjHA/yuDS+wwIK0lcxlz2MK01JF3hGTMHV/SWgtxxeZj?=
 =?us-ascii?Q?8d4bMvq30rKuH9T1OIophvnPEQbl/aqc90tL1jDbq9FOgjnzsCVW4gLMjzKM?=
 =?us-ascii?Q?nlG+wlOYA74atUvcGTJ53g/bQGr0jV39JXHD3MirinSObCLIAcAA5ppjh8Fu?=
 =?us-ascii?Q?KHhGRcGLezm971b2tPZDg29yYQ6PbqKlj5yOIjjNWl1+5aLhQQmq/XC5k74V?=
 =?us-ascii?Q?7sbAQaVDovBL4j9Swwh5ulLKigGOHOoR1wqHuEW530xz/VBNOCOc1IMrLUbG?=
 =?us-ascii?Q?yYGP80qUMSa8fnUUsMxL5ZZqrSMrKMKrdHo0nqQ6hAASq1m1u8qunvQo/Vte?=
 =?us-ascii?Q?jJ0CZWFN8mpQ5hriLKeIg/w3uMS9JT00qTsW4xmgACRG8A1VGmefzYZQoR+B?=
 =?us-ascii?Q?0jHhUx3+JUQ5d+2SN0zSirk3c0jDzPF0tHvfN0v2Nag90jLyqLFf7Q5uk5uz?=
 =?us-ascii?Q?xngefQ2iE2PulqrTu5wtmiIrFDLiVHiv+ybIP8IbIETVeMJjZ4kbvVWnhNkI?=
 =?us-ascii?Q?Xmei0EAqOiLJOqK9OuvIBwZ7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bf9d59-8226-48fc-bff1-08d958783325
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:12.8461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bXeFvU7Fe/n6Pcc05fjLTH6AmX8lKXAcOVd1Vn57fpnbIrgJ/XKBa/q0z/63vRF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform simply wants to run some code when the device is first
opened/last closed. Use the core framework and locking for this.  Aside
from removing a bit of code this narrows the locking scope from a global
lock.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
---
 drivers/vfio/platform/vfio_platform_common.c  | 95 ++++++++-----------
 drivers/vfio/platform/vfio_platform_private.h |  1 -
 2 files changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index bdde8605178cd2..6af7ce7d619c25 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -218,65 +218,52 @@ static int vfio_platform_call_reset(struct vfio_platform_device *vdev,
 	return -EINVAL;
 }
 
-static void vfio_platform_release(struct vfio_device *core_vdev)
-{
-	struct vfio_platform_device *vdev =
-		container_of(core_vdev, struct vfio_platform_device, vdev);
-
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
-	}
-
-	mutex_unlock(&driver_lock);
-}
-
-static int vfio_platform_open(struct vfio_device *core_vdev)
+static void vfio_platform_close_device(struct vfio_device *core_vdev)
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
-
-		ret = vfio_platform_irq_init(vdev);
-		if (ret)
-			goto err_irq;
-
-		ret = pm_runtime_get_sync(vdev->device);
-		if (ret < 0)
-			goto err_rst;
-
-		ret = vfio_platform_call_reset(vdev, &extra_dbg);
-		if (ret && vdev->reset_required) {
-			dev_warn(vdev->device, "reset driver is required and reset call failed in open (%d) %s\n",
-				 ret, extra_dbg ? extra_dbg : "");
-			goto err_rst;
-		}
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (WARN_ON(ret && vdev->reset_required)) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in release (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
 	}
+	pm_runtime_put(vdev->device);
+	vfio_platform_regions_cleanup(vdev);
+	vfio_platform_irq_cleanup(vdev);
+}
 
-	vdev->refcnt++;
+static int vfio_platform_open_device(struct vfio_device *core_vdev)
+{
+	struct vfio_platform_device *vdev =
+		container_of(core_vdev, struct vfio_platform_device, vdev);
+	const char *extra_dbg = NULL;
+	int ret;
 
-	mutex_unlock(&driver_lock);
+	ret = vfio_platform_regions_init(vdev);
+	if (ret)
+		return ret;
+
+	ret = vfio_platform_irq_init(vdev);
+	if (ret)
+		goto err_irq;
+
+	ret = pm_runtime_get_sync(vdev->device);
+	if (ret < 0)
+		goto err_rst;
+
+	ret = vfio_platform_call_reset(vdev, &extra_dbg);
+	if (ret && vdev->reset_required) {
+		dev_warn(
+			vdev->device,
+			"reset driver is required and reset call failed in open (%d) %s\n",
+			ret, extra_dbg ? extra_dbg : "");
+		goto err_rst;
+	}
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

