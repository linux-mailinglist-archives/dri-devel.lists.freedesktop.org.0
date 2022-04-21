Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A622750A575
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 18:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2910E732;
	Thu, 21 Apr 2022 16:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A377510E41F;
 Thu, 21 Apr 2022 16:28:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/Su71wcdZtxnyX3H2lSTAt9r83ITPqtTfEiEkf3v/wMLgv0+BHk8OpXn4biTcGNCcO2lbPOH9K1aKZp/QGFRUAGVkV+mrFz1u361potch+S1zygadrw55S8BgZUoDBI17+0QgMsFvUq3feQ8epfUw3syA7lDo/U4zx+/K+V/YNq/1mgr5qWbQDcRlsT4ztJQCbiur1W4tz/fcSYfe00wfPpIv5ahJcGaaNJGr4r4RRYbBLuGJE95LqlU+6G80iL620JXz7Hq93nuzQA/56NXKdzbqyCn8YB6hX7qlEU9AdH5j42O9meeeaboZVR8XqUFYLA2HAkoLvtOKHSvfIENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AFVYapKKz93+ctNIzsGMJHKP40wdOIKn/dMxEF0YS8=;
 b=dEjvMS2X4bP9lW5VszPrT2cWFE0qkZJ9nTBGj4vGhPW78iiKhJoz9yL3ZSh6FeftgJAZ62PXvuNbLO0biS5MEwdvbfOIyDeLVjNvn6f5vCB9VtuU1fmiVxq9QgDfotjGCFLTXuuEXOhFnCX0QRfsDVnPpcDn+hug0Cw6VOfcIc/Ys2njECMo67BJ35M5Eyca7yXhKSI+PfZKjCzVJ9hm+66swa0USySNdl1U7NMwjUP8ExW5dMTNQgsGcyn3CBK5Fw2lZ733ZguuVzCpmjglTZhgFUzGbJrVu4wuIrb4Wz+0eCbfBQXyREKtTxwRvs1ZZ9YBXyQvxCawUQZ4oR03Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AFVYapKKz93+ctNIzsGMJHKP40wdOIKn/dMxEF0YS8=;
 b=DyZLFUZ9vxGGz+GIvUXbpa5bi5GWspkyFfqHTFWXIK4I95FcJygqPempM6mvzESg4gArpIpMVcrrWekow1/u0tFgZXY1JYbY8zR5VR1qhOMyf15SWKnFZRVeay1WCHTyug2IrBLgmwQEGmZrW1ii0PBrl5G3LLfRA5almR+jlMVTilzRPLLvWZUF3a+/g/mq8jVq1iqqiaXFPobRYRwZXhlgK/lL1SNxt+you6zcNaV49k7CSk3D32k9yPJ4wAB0qcB8w/IBYYDoKtMEfRdxOnF3+ylhv+lqyapHqcv2M80SCIa77HG7zaiRm5WfCPkyK99j2hQypXmlbhdmVnKpHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 16:28:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 16:28:42 +0000
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
Subject: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Date: Thu, 21 Apr 2022 13:28:35 -0300
Message-Id: <4-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db2ad08-d0d3-48fc-56c8-08da23b3fe38
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2907F94D0D88029352DB8FE2C2F49@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGECqTmNNZwrJLb3G7iZmfH4EELPKnCvmvcPbj28nC7ERDuDb+8vYNxWR/OFe8mURBzwlbgG+udeJE2DVkb22/kY4YOieDXt4sTI/ep2X4ILkvSHAO9x6ss3oq3diXqlXXjnx1iJTY2VQJCpWzCne7p5ddQlRTU9upvMVQHV3AGoC77zSA6Bg4iu7lyFQkF6BmvkuR0EHnGZrybtDgDgCFDsu/NRONZkM4LcvSLPwmMj8AgQO2r7JUXfU7/pjhEFofzeqC6aBm6yj8bY0EWwIR9lx8hsAapPN3j6D7DHLXP4VyMwKgr7aHBBwpBhxZzuB4XXr92ygOH1VvJaW1HIKd17L5pfKvg4Lm9EDJsM4wbfq0wUhvuxjY3YpetVONTu5oLMchyg8jPWPbs5ZSx79Fe/UQxvwoxdmcUEUkxHNs23jOw7/coq/OF3mZaU5sPJammgxUxGBokhmnmg7lBKHKPTSbp8xkLAsR9ooW9zwysCga9oHw5BbMwZOuIo696a21NcfA7bkG9oDxJrqistaLyeAVAjAcpw6eThFc6wxQBPty11Qta26BciaEyLcHUDCKNJTpG1+OlAi/suZXBS/nCERsJpqdUoOazi30hlIj/AXAuf2UM/PezWRzgz6TchYeqZFknfxRI3p+3BduIWly/zEh+7YsB1EW0pxeiz510AvpKr/DPBoFIxFn93omgOhkY4hT3KtAxAXdsULfH21w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(316002)(5660300002)(38100700002)(6512007)(54906003)(36756003)(66946007)(86362001)(186003)(921005)(110136005)(508600001)(8936002)(6666004)(2616005)(83380400001)(8676002)(7416002)(7406005)(66556008)(4326008)(26005)(2906002)(66476007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jcDHiPy92+JIZGf7W0NICIgiWqsixtXXDsi75CBO9KCTc37ePTRdbRDWgnCL?=
 =?us-ascii?Q?eWxwXf2EGF3Zv30Y2yAcyxAKnPf3XixIB296qWUMW/XYtwImLWkjML1rQUkP?=
 =?us-ascii?Q?e1eiGTs2AOM/Objwe63uI00Px+mHHJnxcaEPuig13HFC5ZOd3PTnEp2vX7e9?=
 =?us-ascii?Q?p77PaIHknZi5MA/DaPaFU3OXWn4N0r+IpXdl8XrEdbIWp206A98PXrPvgG4V?=
 =?us-ascii?Q?JMfQLZYxOoox5Z4L88UlLyJ2Tz4g+ZYjoEOiCEqzVChUAi9cl2Feff3R2eaX?=
 =?us-ascii?Q?FPFXUZ1Jg9KaK4nyo14QvLtX12PNEq25po2k2OCDkuigv/l+7mwJyjW1OEbq?=
 =?us-ascii?Q?TjNEuHVE0+M+DhfylLBI0DDNzGuS9l08vQ0NI+TLA/JSBXHs09zdJcxShqGh?=
 =?us-ascii?Q?zKT2rRnVGe5RgYTa8vq4aXcRKQqyd/zLV0KKULbGWiJaZNaNvW/C2RgZc6xo?=
 =?us-ascii?Q?5bOShsJ05JJRyi9rMHMPvzxx5aShiHmlPlhJBC+RTo8eCDmRGjd9A4Q2Ssvb?=
 =?us-ascii?Q?jt36TuwHNah21XB6ymKNcuod92Rb8GXAKJgGxvLdQHTDW/MZUVneoL/QmG+h?=
 =?us-ascii?Q?nzDqVSaS5EbNcPMg2F8vY5c5EZArjlLtDfEAaqw25Ffb37hN+P/+dM8kg44C?=
 =?us-ascii?Q?BOumiTRlwMlq2PltmoQOQ/N2/vXXjyzG3SzVeaLtFQI/Lw+Ko1FB4e9SovAb?=
 =?us-ascii?Q?WtNdieYFW6ypq26j2q0rfVA3fQlCdWYFY/j0BqRDMcjSOLa6EUmujebOdsiQ?=
 =?us-ascii?Q?yBT6+GDA3pdtpUAr3S9VQHJs0BWJjs5GXwf4ZHCvSpO3saRPc/brez7JWpcV?=
 =?us-ascii?Q?GfMJq3ioo1/+ajbg91FuA4WkEdwwlqrE5OzJ7FkwandueomFH8bWlk+Rdteb?=
 =?us-ascii?Q?FDwpSrYCXWu9uBWeQsSJkXhxZsY3Z6q9YPNJmLr73y+rBRUbc1CjpduECIxr?=
 =?us-ascii?Q?xb81iwfRFkpeufSlD5QXFbupMi0OhA/NYrX03xdWGE71idfqWIwNjIg3ovkh?=
 =?us-ascii?Q?P42boCWwdVGSg4tcUqs0rE4hoh54+5v31pPuLAs2roHkHcC1fTX0LSlEtVJk?=
 =?us-ascii?Q?iOHp8EtSMBqGJE4M2rX7Wz29Q2I7By1rVS/bk2tyvpvCK7ib7JasOuO7mMIW?=
 =?us-ascii?Q?bfac7fLijd1jWevfL0OyzGSwZYOccRE9yK1beWk6ehxhlY0G0Y/Mmo7/S3vU?=
 =?us-ascii?Q?krao35u35vXYdvufHXpI32Y0qB38irr5YhPegXDm6t1IcOr2EkPgcoXc+ng0?=
 =?us-ascii?Q?KHjUHsd54aonz6FW6tls8b7uxebA36WTazX3WPs3Ko191Ct62TXcOpb6zMO6?=
 =?us-ascii?Q?6oA+GhE2pSODjc8xare10tOj6RJpyLlSXjplZ7e1l7BTcwixXRHr93f8JeqH?=
 =?us-ascii?Q?++d2xDTOTNt7KbV9JL5JoiPAEaEKmAJThojkmVWqb405DUswNJBjXjv8iUI3?=
 =?us-ascii?Q?ZDJwhcLIR9h52qipdAkkNViz8BA5hlW3ZEkW1nmDQYrVvAEuq1LDwp4zOJSE?=
 =?us-ascii?Q?Wvju1156ji3kfKRt+rmbnktRxEGdklGcZKm6gZO//SjzR7ZuJ/JJ9JOYWqtW?=
 =?us-ascii?Q?S659p38a66rYOkVaDImCURuSB34/3DyYxdLdFt8bsz6ac/tQ8gJOlJWHQI1W?=
 =?us-ascii?Q?deLfcWyR8jv+//tpEnvniAgqSyDhYrPRyj0ELgexVkXNAHpMOK1Zs2dL3EDk?=
 =?us-ascii?Q?p7L/RByYpCI0A1gbm4DLKde10w4SECWHckATexwwjPz5dOx1UMvM4aUtn4zG?=
 =?us-ascii?Q?7AfFmllyyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db2ad08-d0d3-48fc-56c8-08da23b3fe38
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 16:28:39.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBhq7H1eE6E6dV9WTuK2TDyrSBC922KiuOdhd3ZQheKsDnMx03i/EvT8ky71cSNQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every caller has a readily available vfio_device pointer, use that instead
of passing in a generic struct device. The struct vfio_device already
contains the group we need so this avoids complexity, extra refcountings,
and a confusing lifecycle model.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h |  4 ++--
 drivers/vfio/vfio.c            | 24 +++++++++++-------------
 include/linux/vfio.h           |  2 +-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 03ecffc2ba56a9..5a28ee965b7f3e 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -732,7 +732,7 @@ static inline int intel_gvt_read_gpa(struct intel_vgpu *vgpu, unsigned long gpa,
 {
 	if (!vgpu->attached)
 		return -ESRCH;
-	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, false);
+	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, false);
 }
 
 /**
@@ -750,7 +750,7 @@ static inline int intel_gvt_write_gpa(struct intel_vgpu *vgpu,
 {
 	if (!vgpu->attached)
 		return -ESRCH;
-	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, true);
+	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, true);
 }
 
 void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 24b92a45cfc8f1..d10d20d393b706 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -2323,32 +2323,28 @@ EXPORT_SYMBOL(vfio_group_unpin_pages);
  * As the read/write of user space memory is conducted via the CPUs and is
  * not a real device DMA, it is not necessary to pin the user space memory.
  *
- * The caller needs to call vfio_group_get_external_user() or
- * vfio_group_get_external_user_from_dev() prior to calling this interface,
- * so as to prevent the VFIO group from disposal in the middle of the call.
- * But it can keep the reference to the VFIO group for several calls into
- * this interface.
- * After finishing using of the VFIO group, the caller needs to release the
- * VFIO group by calling vfio_group_put_external_user().
- *
- * @group [in]		: VFIO group
+ * @vdev [in]		: VFIO device
  * @user_iova [in]	: base IOVA of a user space buffer
  * @data [in]		: pointer to kernel buffer
  * @len [in]		: kernel buffer length
  * @write		: indicate read or write
  * Return error code on failure or 0 on success.
  */
-int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
-		void *data, size_t len, bool write)
+int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova, void *data,
+		size_t len, bool write)
 {
 	struct vfio_container *container;
 	struct vfio_iommu_driver *driver;
 	int ret = 0;
 
-	if (!group || !data || len <= 0)
+	if (!data || len <= 0)
 		return -EINVAL;
 
-	container = group->container;
+	ret = vfio_group_add_container_user(vdev->group);
+	if (ret)
+		return ret;
+
+	container = vdev->group->container;
 	driver = container->iommu_driver;
 
 	if (likely(driver && driver->ops->dma_rw))
@@ -2357,6 +2353,8 @@ int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
 	else
 		ret = -ENOTTY;
 
+	vfio_group_try_dissolve_container(vdev->group);
+
 	return ret;
 }
 EXPORT_SYMBOL(vfio_dma_rw);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 8f2a09801a660b..91d46e532ca104 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -161,7 +161,7 @@ extern int vfio_group_pin_pages(struct vfio_group *group,
 extern int vfio_group_unpin_pages(struct vfio_group *group,
 				  unsigned long *user_iova_pfn, int npage);
 
-extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
+extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
 		       void *data, size_t len, bool write);
 
 extern struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group);
-- 
2.36.0

