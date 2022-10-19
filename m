Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68FC604D2E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22610F297;
	Wed, 19 Oct 2022 16:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F69310EB08;
 Wed, 19 Oct 2022 16:21:48 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JFwOdk003117;
 Wed, 19 Oct 2022 16:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZXD2NF3bhb9xa6K8S7PWWXyNpAdQgQN41ZXfCUSfxLA=;
 b=cfLCYZtMWYOFsJm21oqZTrl4tXt/srGxeUu4imP6iDpd8wsELKLL2021z6QgNXNwCjW9
 4ItIxPjualisAo92EnitLuNvK5ZgnH5oDADp2oshbt1TWLLzZZFmbpP8EPdzXgsvJL8i
 iHKJvN6+93OBVj6SBu3IMOcRh+wrED+ElZgOZUMwOpLMxgX2IDwhN0W25NK+c0kBPZ1w
 RdE6OBdP/WNGL5S64L4UhoRpi2uLisLt9zzu+EhwrkfrOpSFcqjuk8cVLrL2YHHbDXNM
 F6R+tksyoJfLoYTeZ4PPwuEpWmgpntDvkC9k593eUhcN4V9skrdqYelbkn4bq03PoTUV hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kambb1b05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JG0dGN008834;
 Wed, 19 Oct 2022 16:21:44 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kambb1ax3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:44 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JGLTBh015554;
 Wed, 19 Oct 2022 16:21:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3k7mg97cx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29JGMBQo52363548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 16:22:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77BB3A404D;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5899FA4040;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id DA8C2E1693; Wed, 19 Oct 2022 18:21:37 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Date: Wed, 19 Oct 2022 18:21:34 +0200
Message-Id: <20221019162135.798901-7-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162135.798901-1-farman@linux.ibm.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AtH2RdMo3ch1mwnGrA92KYP9LojR7_EX
X-Proofpoint-ORIG-GUID: dWtngy90OA-mfsIT0f1Ujgtf3a4TtoZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190091
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have a reasonable separation of structs that follow
the subchannel and mdev lifecycles, there's no reason we can't
call the official vfio_alloc_device routine for our private data,
and behave like everyone else.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 29 -----------------------------
 drivers/s390/cio/vfio_ccw_ops.c     | 28 ++++++++++++++++++----------
 drivers/s390/cio/vfio_ccw_private.h |  3 ---
 drivers/vfio/vfio_main.c            |  3 ---
 4 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 686a9b9f6731..9bbf41315aca 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -146,35 +146,6 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
 }
 
-struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
-{
-	struct vfio_ccw_private *private;
-
-	private = kzalloc(sizeof(*private), GFP_KERNEL);
-	if (!private)
-		return ERR_PTR(-ENOMEM);
-
-	return private;
-}
-
-void vfio_ccw_free_private(struct vfio_ccw_private *private)
-{
-	struct vfio_ccw_crw *crw, *temp;
-
-	list_for_each_entry_safe(crw, temp, &private->crw, next) {
-		list_del(&crw->next);
-		kfree(crw);
-	}
-
-	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
-	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
-	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
-	kmem_cache_free(vfio_ccw_io_region, private->io_region);
-	kfree(private->cp.guest_cp);
-	mutex_destroy(&private->io_mutex);
-	kfree(private);
-}
-
 static void vfio_ccw_free_parent(struct device *dev)
 {
 	struct vfio_ccw_parent *parent = container_of(dev, struct vfio_ccw_parent, dev);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 261cb8150abb..9619dc35080f 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -103,15 +103,10 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	struct vfio_ccw_private *private;
 	int ret;
 
-	private = vfio_ccw_alloc_private(sch);
-	if (!private)
-		return -ENOMEM;
-
-	ret = vfio_init_device(&private->vdev, &mdev->dev, &vfio_ccw_dev_ops);
-	if (ret) {
-		kfree(private);
-		return ret;
-	}
+	private = vfio_alloc_device(vfio_ccw_private, vdev, &mdev->dev,
+				    &vfio_ccw_dev_ops);
+	if (IS_ERR(private))
+		return PTR_ERR(private);
 
 	dev_set_drvdata(&parent->dev, private);
 
@@ -136,8 +131,21 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
+	struct vfio_ccw_crw *crw, *temp;
+
+	list_for_each_entry_safe(crw, temp, &private->crw, next) {
+		list_del(&crw->next);
+		kfree(crw);
+	}
+
+	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
+	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
+	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
+	kmem_cache_free(vfio_ccw_io_region, private->io_region);
+	kfree(private->cp.guest_cp);
+	mutex_destroy(&private->io_mutex);
 
-	vfio_ccw_free_private(private);
+	vfio_free_device(vdev);
 }
 
 static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index ddaf6846022d..2ca408881659 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -116,9 +116,6 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch);
 void vfio_ccw_sch_io_todo(struct work_struct *work);
 void vfio_ccw_crw_todo(struct work_struct *work);
 
-struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch);
-void vfio_ccw_free_private(struct vfio_ccw_private *private);
-
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
 /*
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2d168793d4e1..28f36c6d9d3f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -386,8 +386,6 @@ EXPORT_SYMBOL_GPL(_vfio_alloc_device);
 
 /*
  * Initialize a vfio_device so it can be registered to vfio core.
- *
- * Only vfio-ccw driver should call this interface.
  */
 int vfio_init_device(struct vfio_device *device, struct device *dev,
 		     const struct vfio_device_ops *ops)
@@ -422,7 +420,6 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
 	ida_free(&vfio.device_ida, device->index);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(vfio_init_device);
 
 /*
  * The helper called by driver @release callback to free the device
-- 
2.34.1

