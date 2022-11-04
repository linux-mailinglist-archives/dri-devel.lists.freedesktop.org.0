Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEC8619958
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF03A10E80A;
	Fri,  4 Nov 2022 14:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B5310E804;
 Fri,  4 Nov 2022 14:20:19 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4Dw6GP016268;
 Fri, 4 Nov 2022 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VMsQlIOph2melnKgDuuL3mcqbyZty03wwwAh7W57W7Y=;
 b=rkDBeR7HcqnoU06u8K7sYeE5iH1ugdou+Bpo04QHuDf+FQpS1daN/gNeWQ5lDaGp/vLE
 AKcxFwNez4Y2Qr2ffK1SFJJslYYV9ZCVjQSOF8hwlcG62kt9x1NJ4+PCK64tNtPI0Mnj
 icTLhhagHBQkTWGzGNmDDmgJgp3ppSRxIoOGuqoDKkKwBp9rMIcCQMON/kC9Lo5uMtb9
 CmMby2vtx1T/gwRehqa4i42gV0sT9W1KZ2Qgg1RZndEWJiDBsjq7xstdpc3esqUSHwbW
 LIVGTPIRYAd8+w+tfVfU05NXvbrzUZDwcDLKUjoxCmVLuaDukfC0tM51pk/SGs2e7Yds KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2464yvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4CQZqV007667;
 Fri, 4 Nov 2022 14:20:15 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kn2464yu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4E68r0002753;
 Fri, 4 Nov 2022 14:20:12 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3kgut9fu3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4EK99C2228916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 14:20:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E7D1AE051;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2109EAE04D;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id CF60DE1E61; Fri,  4 Nov 2022 15:20:08 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v3 4/7] vfio/ccw: move private to mdev lifecycle
Date: Fri,  4 Nov 2022 15:20:04 +0100
Message-Id: <20221104142007.1314999-5-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104142007.1314999-1-farman@linux.ibm.com>
References: <20221104142007.1314999-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ItOV8byF7pjjAZ8i2IUZCvcFkvWRCT9s
X-Proofpoint-GUID: CfRdTos1-QZFR7sXnN2jDzdpKjQ_WPna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040093
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

Now that the mdev parent data is split out into its own struct,
it is safe to move the remaining private data to follow the
mdev probe/remove lifecycle. The mdev parent data will remain
where it is, and follow the subchannel and the css driver
interfaces.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 16 +---------------
 drivers/s390/cio/vfio_ccw_ops.c     | 26 +++++++++++++-------------
 drivers/s390/cio/vfio_ccw_private.h |  2 ++
 3 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index fbc26338ceab..9fbd1b27a1ac 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -152,7 +152,7 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
 }
 
-static void vfio_ccw_free_private(struct vfio_ccw_private *private)
+void vfio_ccw_free_private(struct vfio_ccw_private *private)
 {
 	struct vfio_ccw_crw *crw, *temp;
 
@@ -180,7 +180,6 @@ static void vfio_ccw_free_parent(struct device *dev)
 static int vfio_ccw_sch_probe(struct subchannel *sch)
 {
 	struct pmcw *pmcw = &sch->schib.pmcw;
-	struct vfio_ccw_private *private;
 	struct vfio_ccw_parent *parent;
 	int ret = -ENOMEM;
 
@@ -201,14 +200,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 	if (ret)
 		goto out_free;
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL);
-	if (!private) {
-		device_unregister(&parent->dev);
-		return -ENOMEM;
-	}
-
 	dev_set_drvdata(&sch->dev, parent);
-	dev_set_drvdata(&parent->dev, private);
 
 	parent->mdev_type.sysfs_name = "io";
 	parent->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
@@ -227,25 +219,19 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 out_unreg:
 	device_unregister(&parent->dev);
 out_free:
-	dev_set_drvdata(&parent->dev, NULL);
 	dev_set_drvdata(&sch->dev, NULL);
-	if (private)
-		vfio_ccw_free_private(private);
 	return ret;
 }
 
 static void vfio_ccw_sch_remove(struct subchannel *sch)
 {
 	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
-	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 
 	mdev_unregister_parent(&parent->parent);
 
 	device_unregister(&parent->dev);
 	dev_set_drvdata(&sch->dev, NULL);
 
-	vfio_ccw_free_private(private);
-
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
 			   sch->schid.cssid, sch->schid.ssid,
 			   sch->schid.sch_no);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index eb0b8cc210bb..e45d4acb109b 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -100,15 +100,20 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
 	struct subchannel *sch = to_subchannel(mdev->dev.parent);
 	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
-	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
+	struct vfio_ccw_private *private;
 	int ret;
 
-	if (private->state == VFIO_CCW_STATE_NOT_OPER)
-		return -ENODEV;
+	private = kzalloc(sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
 
 	ret = vfio_init_device(&private->vdev, &mdev->dev, &vfio_ccw_dev_ops);
-	if (ret)
+	if (ret) {
+		kfree(private);
 		return ret;
+	}
+
+	dev_set_drvdata(&parent->dev, private);
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: create\n",
 			   sch->schid.cssid,
@@ -122,6 +127,7 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	return 0;
 
 err_put_vdev:
+	dev_set_drvdata(&parent->dev, NULL);
 	vfio_put_device(&private->vdev);
 	return ret;
 }
@@ -131,15 +137,6 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
 
-	/*
-	 * We cannot free vfio_ccw_private here because it includes
-	 * parent info which must be free'ed by css driver.
-	 *
-	 * Use a workaround by memset'ing the core device part and
-	 * then notifying the remove path that all active references
-	 * to this device have been released.
-	 */
-	memset(vdev, 0, sizeof(*vdev));
 	complete(&private->release_comp);
 }
 
@@ -156,6 +153,7 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 
 	vfio_unregister_group_dev(&private->vdev);
 
+	dev_set_drvdata(&parent->dev, NULL);
 	vfio_put_device(&private->vdev);
 	/*
 	 * Wait for all active references on mdev are released so it
@@ -166,6 +164,8 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	 * cycle.
 	 */
 	wait_for_completion(&private->release_comp);
+
+	vfio_ccw_free_private(private);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 55d636225cff..747aba5f5272 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -134,6 +134,8 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch);
 void vfio_ccw_sch_io_todo(struct work_struct *work);
 void vfio_ccw_crw_todo(struct work_struct *work);
 
+void vfio_ccw_free_private(struct vfio_ccw_private *private);
+
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
 /*
-- 
2.34.1

